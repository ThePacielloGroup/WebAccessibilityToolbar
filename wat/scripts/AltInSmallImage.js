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


function AltInSpacer2(){

    //create a div object just to check the length
    //of the properties array

    var jt_generic_obj = document.createElement("var");
    var jt_ie7 = false;
    if (jt_generic_obj.attributes.length > 0) {
        jt_ie7 = true;
    }
    //alert("jt_ie7 is " + jt_ie7 + " and here's the array " + jt_generic_obj.attributes.length);

    var x=0,y=0,w=0;
    //alert('boo');
    var t=document.getElementsByTagName('img');
    if (FrameGuard()) {
        for (i=0;i<t.length;i++) {
            // Bad place for alert!alert( 'step '+i+' of '+t.length);
            if ((t[i].parentNode.tagName!='A')&&(t[i].width<=9||t[i].height<=9 )) {
                var l=''; w++; //formatting image 
                //alert( 'small non-link step '+i+' of '+t.length);
                
                //alert( t[i].width+' '+t[i].height+'  '+t[i].outerHTML);
                if ((jt_ie7 && t[i].attributes.alt.specified) || (!(jt_ie7) && t[i].hasAttribute('alt')))
 {
                    
                    if (t[i].alt.length>0) {
                        l='alt=\"'+t[i].alt+'\"';
                        y++;
                        //alert( t[i].width+' '+t[i].height);
                    } else {
                        //No error - correct alt text
                    }
                } else {
                    l='img';x++; //No alt text
                }
                
                var h=t[i].outerHTML;
                t[i].outerHTML='<span style=\"color:navy;font:x-small arial;background:#f5deb3;\"><b>'+l+'</b></span> '+h;
                t[i].style.padding='2px';
                t[i].style.border='2px solid red';

            }
        }
        alert(x+' alt errors out of '+w+' formatting images with ' +y+' images to review');  
    }
}
AltInSpacer2();

}