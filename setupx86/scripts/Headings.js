
// Based on code originally Developed By Steve Faulkner 2003/2004


function main(){
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

function heading(){

    var z=0,tag=new Array('h1','h2','h3','h4','h5','h6');
    var count=new Array(0,0,0,0,0,0);
    var msg='';
    if (FrameGuard()) {
        for (n=0;n<tag.length;n++) {
            
            t=document.getElementsByTagName(tag[n]);
            count[n]=t.length;
            //alert( t.length);
            if (count[n]>0) {
                msg=msg+'; '+count[n]+' h'+(n+1);
                //alert( msg);
                for (i=0;i<t.length;i++) {
                    var h;
                    // alert( t[i].style);
                    h=t[i].innerHTML;
                    try {
                        void(t[i].innerHTML='<span style=\'color:navy;font:small bold;background-color:#f5deb3\'><strong>&lt; '+tag[n]+'&gt; </strong></span> '+h+'<span style=\'color:navy;font:small bold;background-color:#f5deb3\'><strong>&lt;/'+tag[n]+'&gt; </strong></span> ');
                    }
                    catch (e) {
                             //alert(e);
                    }
                    if (h!='')
                        z=z+1;
                }
            }
        }
        //alert( 'boo');
        if (z==0)
            alert('No Heading Elements Used');
        else {
            alert(z+' Headings'+msg);

        }
    }
}


heading()

}