// Plan is to comment out error marking and have separate favelet with error marking
function main()
{
function FrameGuard() {

    //create object just to check length of the properties array
    var jt_generic_obj = document.createElement("var");
    var jt_ie7 = false;
    if (jt_generic_obj.attributes.length > 0) {
        jt_ie7 = true;
    }

    var error="<span style=\'color:red;font: bold;\'><strong> Error no title attribute</strong></span>";
    var tag='frame';
    t=document.getElementsByTagName(tag);
    if (t.length==0) {
        return true;
    } else {
        alert( 'Found '+t.length+' frames\rCheck out list of frames that opens next.');
        var s='';
        s+='<p>This is a Frame site consiting of '+t.length+' frames.<br>\r';
        s+='Check the  required title attributes of the frames for appropriateness.<br>\r';
        s+='<ul>\r';
        // alert('boo');
        for (i=0;i<t.length;i++) {
            
            var titletext='';
            if ((jt_ie7 && t[i].attributes.title.specified) || (!(jt_ie7) && t[i].hasAttribute('title')))
                titletext=t[i].title;
            else titletext=error; 
            s+='<li>';
            s+=tag+'-'+(i+1)+'</li>\r';
            s+='\t<ul>\r\t\t<li> Name ('+t[i].name+')</li>\r'
            s+='\t\t<li>Title ('+titletext+')</li>\r';
            s+='\t\t<li>Src (<a href=\"'+t[i].src+'\">'+t[i].src+'</a>)</li>\r';
            s+='\t</ul>\r';
        }
        s+='</ul>\r';
        //alert( s);
        var lw=window.open('','lw');
        if (lw!=null) {
            lw.document.open();
            lw.document.write(s);
            lw.document.close();
        } else
            alert('Popup windows for frame list blocked');

        return false;
    }
    
}

function isBlank(s){
    var res=true;
    for (var i=0;i<s.length;i++) {
        res=res && s.charAt(i)==' ';
    }
    return res;
}    

/* I don't feel like testing this right now!
function checkAncestorAttProp(myObj, myAttProp, interestingValue) {
    var found = false;
    while (found == false && myObj.tagName != 'BODY' && myObj.tagName != 'HTML') {
        myObj = myObj.parentNode;
        if (myObj.(myAttProp) == interestingValue) {
            alert('found ' + interestingValue);
            return myObj;
        }
        
        
    }
    return(false);

}
*/


function AltInAreaImgInput2(){

    //create object just to check length of the properties array
    var jt_generic_obj = document.createElement("var");
    var jt_ie7 = false;
    if (jt_generic_obj.attributes.length > 0) {
        jt_ie7 = true;
    }

    var style1="<span style=\'color:navy;font:small;background:#f5deb3\'><strong>";
    var error="<span style=\'color:red;font:small bold;background:#f5deb3\'><strong> Error </strong></span>";
    var areasx="<span style=\'color:red;font:small bold;background:#f5deb3\'><strong> AREAS: </strong></span>";
    var w=0,y=0,z=0,wy=0, tag=new Array('img', 'input'); //array of image, area and input(type=image) elements
    if (FrameGuard()) {
        for (var n=0;n<tag.length;n++) {
            var t=document.getElementsByTagName(tag[n]);
            {for (i=0;i<t.length;i++) {
                    
                    if (t[i].tagName!='MAP'&&(t[i].parentNode.tagName=='A'|| (t[i].tagName=='INPUT'&& t[i].type=='image'))) {
                        {   var l='', m='', h, b=false;
                            if ((jt_ie7 && t[i].attributes.alt.specified) || (!(jt_ie7) && t[i].hasAttribute('alt'))) {
                             //alert(isBlank(t[i].parentNode.innerText)); //
                                if (isBlank(t[i].alt)) {
                                    //alert( y);
                                    //if (y<3) {
                                    //  alert( t[i].parentElement.innerText)
                                    //}
                                    //alert(   t[i].parentElement.attributes.href.specified  );
                                    if (t[i].tagName=='INPUT') {
                                        l=' button '+error;  y++;
                                    } else {
                                        // at this point we know it's an A tag, code simplified here
                                        if (((jt_ie7 && t[i].parentNode.attributes.href.specified) || (!(jt_ie7) && t[i].parentNode.hasAttribute('href'))) &&
                                            ((t[i].parentNode.textContent && isBlank(t[i].parentNode.textContent)) || (t[i].parentNode.innerText && isBlank(t[i].parentNode.innerText)))) {
                                            l=' link '+error;
                                            y++;
                                        }
                                        if (t[i].parentNode.tagName=='A' && ((t[i].parentNode.textContent && !isBlank(t[i].parentNode.textContent)) || (t[i].parentNode.innerText && !isBlank(t[i].parentNode.innerText)))) {
                                            m=' with text ';
                                        }
                                    }

                                }

                                w=w+1;
                                l=l+'alt=\"'+t[i].alt+'\"'+m;
                                //h=t[i].outerHTML;
                                //void(t[i].outerHTML=style1+tag[n]+' '+l+'</strong></span> '+h);
                                //void(t[i].style.padding='3px',t[i].style.border='3px solid red');
                            } else {
                                l=''; y++;
                            }
                            
                            
                            h=t[i].outerHTML;
                            void(t[i].outerHTML=style1+tag[n]+' '+l+'</strong></span> '+h);
                            void(t[i].style.padding='3px',t[i].style.border='2px solid red');


                        }
                    }
                    
                    if (t[i].tagName=='IMG'&&t[i].getAttribute('usemap')) {
                        //alert('in map');
                        var l='', m='';
                        var v= t[i].getAttribute('usemap');
                        var vid=v.substr(1,v.lemgth);
                        var wmap=document.getElementById( vid);
                        if (wmap!=null) {
                            
                            if (wmap.tagName=='MAP') {
                                var areas=wmap.children, kk=0;
                                for (q=0;q<areas.length;q++) {
                                    if (areas[q].tagName=='AREA') {
                                        if ((jt_ie7 && areas[q].attributes.alt.specified) || (!(jt_ie7) && areas[q].hasAttribute('alt'))) {
                                            if (isBlank(areas[q].alt)) {
                                                l= l+error+' alt empty';
                                                y=y+1;
                                            } else {
                                                l=l+' alt=\"'+areas[q].alt+'\"'; 
                                                w=w+1;
                                            }                           
                                        } else {
                                            l=l+error+' no alt ';
                                            y=y+1;
                                        }

                                    }

                                }
                                l='map '+areasx+l;
                                h=t[i].outerHTML;
                                void(t[i].outerHTML=style1+tag[n]+l+'</strong></span> '+h);
                                void(t[i].style.padding='3px',t[i].style.border='2px solid red');
                                
                            }
                        }

                    }

                }}
        }
        alert(y+' errors out of '+(y+w)+' active images with '+w+' images to review');

    }
}


AltInAreaImgInput2();
}
