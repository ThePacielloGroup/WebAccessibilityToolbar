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
    //alert (t.length+' frames');
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


function ImportantAltZ(){

    //create a div object just to check the length
    //of the properties array

    var jt_generic_obj = document.createElement("var");
    var jt_ie7 = false;
    if (jt_generic_obj.attributes.length > 0) {
        jt_ie7 = true;
    }


    var x=0,y=0,z=0, tag=new Array('img'); 
    if (FrameGuard()) {
        for (n=0;n<tag.length;n++) {
            t=document.getElementsByTagName(tag[n]);
            // alert( t.length+' images');
            for (i=0;i<t.length;i++) {
                if (t[i].parentNode.tagName!='A'&&t[i].width>9&&t[i].height>9 ) {
                    var l, h;
                    //alert('big image #'+i);
                    if ((jt_ie7 && t[i].attributes.alt.specified) || (!(jt_ie7) && t[i].hasAttribute('alt')))
 {
                        l='alt=\"'+t[i].alt+'\"';
                        y++;
                        //alert(l);
                    } else {
                        l='Img'; x=x+1
                    }
                    //alert(t[i].tagName+' '+t[i].src);
                    //l=l+' ';
                    h=t[i].outerHTML;  // alert('outerHTML='+h);
                    void(t[i].outerHTML='<span style=\"color:navy;font:small arial;background:#f5deb3;\"><b>'+l+'</b></span> '+h);
                    void(t[i].style.padding='3px',t[i].style.border='2px solid red');
                    if (h!='')void(z=z+1);
                }
            }
        }
        alert(x+' alt errors out of '+(x+y)+' larger images with '+y+' images to review');
    }
}

ImportantAltZ();
}
