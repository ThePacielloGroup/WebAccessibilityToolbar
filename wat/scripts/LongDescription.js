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



function LongDescription(){



    //create object just to check length of the properties array
    var jt_generic_obj = document.createElement("var");
    var jt_ie7 = false;
    if (jt_generic_obj.attributes.length > 0) {
        jt_ie7 = true;
    }


//alert("new. jt_ie7 is " + jt_ie7 + "document: " + jt_generic_obj.hasAttribute);

    var z=0; 
    if (FrameGuard()) {
        t=document.getElementsByTagName('img');
        for (i=0;i<t.length;i++) {
            if ((jt_ie7 || (!(jt_ie7) && t[i].hasAttribute('longdesc'))) && t[i].getAttribute('longdesc').length>0) {
                var l, h, temp;
                //alert(t[i].getAttribute('longdesc').link(t[i].getAttribute('longdesc')) );
                l='Long Description: '+t[i].getAttribute('longdesc').link(t[i].getAttribute('longdesc'));   
                if ( t[i].parentElement.tagName!="A") {
                    h=t[i].outerHTML;
                    void(t[i].outerHTML='<span style=\"color:navy;font:small arial;background:#f5deb3;\"><b>'+l+'</b></span> '+h);
                    void(t[i].style.padding='3px',t[i].style.border='2px solid red');
                } else {
                    h=t[i].parentElement.outerHTML;
                    void(t[i].parentElement.outerHTML='<span style=\"color:navy;font:small arial;background:#f5deb3;\"><b>'+l+'</b></span> '+h);
                    void(t[i].parentElement.style.padding='0px',t[i].parentElement.style.border='2px solid red');
                }
                if (h!='')void(z=z+1);
            }

        }
        if (z==0)
            alert('No Images with long descriptions');
        else
            alert(z+' Images with long descripitons');
    }
}

LongDescription();
}
