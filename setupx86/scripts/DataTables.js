// Developed originally By Steve Faulkner 2003/2004
// steven.faulkner@nils.org.au
// modified by jim thatcher jim@jimthatcher.com 2005
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
    //st added var below
    var t=document.getElementsByTagName(tag);
    if (t.length==0) {
        return true;
    } else {
        alert( 'Found '+t.length+' frames\rCheck out list of frames that opens next.');
        var s='';
        s+='<p>This is a Frame site consiting of '+t.length+' frames.<br>\r';
        s+='Check the  required title attributes of the frames for appropriateness.<br>\r';
        s+='<ul>\r';
        // alert('boo');
        //st added var below
        for (var i=0;i<t.length;i++) {
            
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

function DataTables(){

    //create object to check the length of properties array
    var jt_generic_obj = document.createElement("var");
    var jt_ie7 = false;
    if (jt_generic_obj.attributes.length > 0) {
	jt_ie7 = true;
    }

    var t=document.getElementsByTagName('table'); 
    var c=new Array('red', 'navy', 'lime', 'fuchsia', 'aqua')
    var cx=0;
    var pre='<span style=\'color:';
    var next=';font:medium bold;background:#ffefd5;';
    var s=document.getElementsByTagName('th');
    var u=document.getElementsByTagName('td');
    var cap=document.getElementsByTagName('caption');    
    var cta=0,cth=0,csu=0, ccap=0, cother=0; 
    var msg='';
    if (FrameGuard()) {
        //alert( s.length+ ' th');
        if (t.length==0)
            alert('No Table Elements Found');
        else {
            var str, cx, cta;
            cx=-1;
            cta=t.length;
            // alert( cta+' tables');
            // st added var below
            for (var i=0;i<t.length;i++) { // mark out tables
                var h;
                str='';
                cx=(cx+1)%5; 
                // alert(t[i].hasAttribute('summary'));
                if ((jt_ie7 && t[i].attributes.summary.specified) || (!(jt_ie7) && t[i].hasAttribute('summary'))) {
                    str=' summary=\"'+t[i].summary+'\"';
                    csu++;
                }
                try {
                
                h=t[i].outerHTML;
                void(t[i].outerHTML=pre+c[cx]+next+'\'>&lt;table'+str+'&gt; </span> '+h);
                void(t[i].style.border='3px dashed '+c[cx]);
                } catch (e) {
                    // alert( e);
                    continue;
                }
                // alert( 'table '+i);

            }
            ccap=cap.length;
            // **** Cannot modify outerHTML of caption.
            for (var i=0;i<ccap;i++) { // mark out captions
                //alert('i='+i+' innerhtml='+cap[i].innerHTML);
                h= cap[i].innerHTML;
                cap[i].innerHTML='*** CAPTION: '+h; 
                void(cap[i].innerHTML='<span style=\'color:navy;background:#ffefd5;font:small bold; \'>&lt;caption&gt;</span> '+h+'<span style=\'color:navy;background:#ffefd5;font:small bold; \'> &lt;/caption &gt;</span>');
              }    

            cth=s.length;
            // alert(s.length+' th');
            for (var i=0;i<s.length;i++) {
                var h;
                str='';  
                //TH's scope, id, headers, axis
                // alert( s[i].hasAttribute('scope')+'=scope specified');
                if ((jt_ie7 && s[i].attributes.scope.specified) || (!(jt_ie7) && s[i].hasAttribute('scope'))) {
                    str=' scope=\"'+s[i].scope+'\"';
                    //alert ('scope defined');
                    cother++;
                }
                if ((jt_ie7 && s[i].attributes.id.specified) || (!(jt_ie7) && s[i].hasAttribute('id'))) {
                    str=str+' id=\"'+s[i].id+'\"';
                    cother++;
                }
                if ((jt_ie7 && s[i].attributes.headers.specified) || (!(jt_ie7) && s[i].hasAttribute('headers'))) {
                    str=str+' headers=\"'+s[i].headers+'\"';
                    cother++;
                }
                if ((jt_ie7 && s[i].attributes.axis.specified) || (!(jt_ie7) && s[i].hasAttribute('axis'))) {
                    str=str+' axis=\"'+s[i].axis+'\"';
                    cother++;
                }
                h=s[i].innerHTML;
                // alert( 'inner HTML='+h);
                void(s[i].innerHTML=pre+'navy'+next+'\'>&lt;th'+str+'&gt;</span> <div>'+h+'</div>');
                void(s[i].style.border='2px dashed black'); 
                
            }
            // alert('check scope etc');
            for (var i=0;i<u.length;i++) {
                str='';  
                //TD's scope, id, headers, axis
                try {
                    var qqq=u[i].hasAttribute('scope'); 
                }   
                catch (e) { 
                    continue;
                }
                if ((jt_ie7 && u[i].attributes.scope.specified) || (!(jt_ie7) && u[i].hasAttribute('scope'))) {
                    str=' scope=\"'+u[i].scope+'\"';
                    cother++;
                }
                if ((jt_ie7 && u[i].attributes.id.specified) || (!(jt_ie7) && u[i].hasAttribute('id'))) {
                    str=str+' id=\"'+u[i].id+'\"';
                    cother++;
                }
                if ((jt_ie7 && u[i].attributes.headers.specified) || (!(jt_ie7) && u[i].hasAttribute('headers'))) {
                    str=str+' headers=\"'+u[i].headers+'\"';
                    cother++;
                }
                if ((jt_ie7 && u[i].attributes.axis.specified) || (!(jt_ie7) && u[i].hasAttribute('axis'))) {
                    str=str+' axis=\"'+u[i].axis+'\"';
                    cother++;
                }
                if (str.length>0) {
                    var h='';
                    // alert( str.length);
                    h=u[i].innerHTML;
                    if (h!='') {
                        void(u[i].innerHTML='<span style=\"color:navy;background:#ffefd5;font:small bold;\">&lt;td'+str+'&gt; </span><div>'+h+'</div>');
                        void(u[i].style.border='2px dashed red');
                    }
                }
            }
            msg=cta+' tables';
            if (csu>0) {
                msg=msg+'; '+csu+' summary(s)';
            }
            if (ccap>0) {
                msg=msg+'; '+ccap+' caption(s)';
            }
            if (cth>0) {
                msg=msg+'; '+cth+' TH cells';
            }
            if (cother>0) {
                msg=msg+'; '+cother+' access attribute(s)';
            }
            msg=msg+'.';
            alert( msg);
        }
    }
}
DataTables()

//alert("new4")
}





