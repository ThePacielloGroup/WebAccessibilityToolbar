function main()
{

function replaceGetElementsByName(searchName) {

        // getElementsByName doesn't
        // work the same in all browsers
        // this copies how it worked in IE 6
        // in all browsers

        // so it returns list of all elements
        // with searchName as name OR AS id

	var myNameElements = new Array();
	var els = document.getElementsByTagName('*');
	var elsLen = els.length;
	var pattern = new RegExp('(^|\\\\s)'+searchName+'(\\\\s|$)');
	for (s = 0, j = 0; s < elsLen; s++) {
		if ( pattern.test(els[s].name) || pattern.test(els[s].id) ) {
			myNameElements[j] = els[s];
			j++;
		}
	}
	return myNameElements;
}



function AnchorsForSkip(){

    //create object just to check length of the properties array
    var jt_generic_obj = document.createElement("var");
    var jt_ie7 = false;
    if (jt_generic_obj.attributes.length > 0) {
        jt_ie7 = true;
    }

    var z=0, w, str='', count=0, missing=0; 
    var name='';
    var names=new Array();
    var v=new Array();
    var pre='<span style=\'color:';
    var next=';font:small; font-family:arial;background:#fffacd;';
    t=document.getElementsByTagName('a');
    for (i=0;i<t.length;i++) {
        var l,x=0, na=0, u=0; var message="";
        if ((jt_ie7 && t[i].attributes.href.specified) || (!(jt_ie7) && t[i].hasAttribute('href')))
 {
            var h=t[i].href;
            u=h.indexOf('#');
            if (u>=0) {  /* gotta do something*/
                // alert('found '+h);
                name=h.substring(u+1,h.length);
                if (name.length>0) {
                    var file=h.substr(0,u);
                    var url=document.URL;
                    var u=url.indexOf('#');
                    if (u>0) url=url.substr(0,u);
                    // alert(file.indexOf('file')+' found # '+file+' compared with '+url);
                    // I don't remember the reason for this test but I wasn't finding local anchors in files
                    // vecause the brgin file://C: ... and file:/// C: ... so are alwayd different 
                    // I added the condition that goes ahead an assumes OK if file!
                    if (file==url || file.indexOf('file')==0 ) {
                        // Local Anchor
                        count++;
                        

                        found=false;k=0;
                        while (!found && k<names.length) {
                            found=(name==names[k]);
                            k++;
                        }
                        if (!found) {
                            names[k]=name;
                            // alert( 'local anchor name=\"'+name+'\"');
                            v=replaceGetElementsByName(name);
                            w=v[0];
                            //alert ("v is " + v);
                            //alert ("w is " + w);
                            //alert ("in reusable variable " + v.length);
                            //alert ("directly " + replaceGetElementsByName(name).length);

                            if (v.length < 1) {
                                //no anchor with that name!
                                found = true; //nothing to outline
                                var message = '<span style=\"color:#C00000;\"> with no target</span>';

                                missing++;

                            } else {
                                if (w.getAttribute('tabindex') == '-1') {
                                    //already have the target
                                } else {
                                    layout=false;
                                    while (!layout && (w.tagName != 'BODY')) {
                                        //alert( w.tagName);
                                        try {layout=w.currentStyle.hasLayout;}
                                        catch (err) {
                                        }
                                        if (!layout) w=w.parentNode;
                                    }
                                }
                            }
                            //Found ancestor with haslayout=true.
                            //or body element
                            //or anchor itself with tabindex neg one
                            str='<img src="res://' + scriptpath + 'Resources.dll/target.gif" alt="'+localize('skip1')+' #'+name+'" style=\"z-index:500;">'+name;
                        }
                        l='href=\"#'+name+'\"'; x++;
                    }
                }
            }
            if ( x>0) {
                //alert('line 48');
                var h=t[i].outerHTML;
                t[i].outerHTML='<span style="color: navy; line-height: normal; font-family: arial; font-size: small; font-style: normal; font-variant: normal; font-weight: normal; background-image: none; background-attachment: scroll; background-repeat: repeat; background-position-x: 0%; background-position-y: 0%; background-color: rgb(255, 250, 205);"><img src="res://' + scriptpath + 'Resources.dll/anchor.png" alt="'+localize('skip0')+'" style=\"z-index:500;"> #'+message+' '+name+'</span>'+h;
                //alert('line 51');
                t[i].style.padding='3px';
                t[i].style.border='1px solid red';
                //alert('line 54');
                if (!found) {
                    var h1=w.innerHTML;
                    if (w.tagName!='A') {
                        //alert ('target is A: '+h1);
                        w.innerHTML=pre+'navy'+next+'\'>'+str+'</span> <div>'+h1+'</div>';
                    } else {
                        var h2=w.outerHTML;
                        w.outerHTML=pre+'navy'+next+'\'>'+str+'</span>'+h2;
                    }
                    w.style.padding='3px';
                    w.style.border='2px solid navy';
                }
                if (h!='')z=z+1;
            }
        }
    }
    if (count==0) {
        alert('No Local anchors');
    } else {
        if (missing > 0) {
            var jt_dif = count-missing;
            alert(missing + ' local anchors without a target. ' + jt_dif + ' local anchors to check out.');
        } else {
            alert(count+' local anchors to check out');
        }
    }
}
AnchorsForSkip();
}
