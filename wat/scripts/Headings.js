
// Based on code originally Developed By Steve Faulkner 2003/2004
// Headings.js

function main(){

// NEW SECTION, May 2014  to not count display='none' ************
function check_parents(element) {    // if returns false, display='none' not found in entire parent grandparent, etc hierarchy
var vis = false;   
var par = element; 
//alert("par is " + par + " and element is " + element);
	while (par)
	{	
		if (par != '[object]')   // to break loop at no object to call/check
		{
		//alert('par is ' + par);
		var dis = par.currentStyle.getPropertyValue('display');
		//alert("dis returned is " + dis);
		if (dis == 'none')
			{
			par = false;  // to break loop
			vis = true;
			}
		else
			{
			par=par.parentNode;  // check up the next parent, until no more to check, but stop at Object Document, otherwise will fail above call
			//alert("par is " + Object.prototype.toString(par));
			if ((par == '[object Document]') || (par == '[object HTMLDocument]'))   // to break loop at last object to call/check
				{
				par=false;
				vis = false;
				}
			}
		}
		else
//			{
//			par=false;
//			vis = false;
//			}
		{
			//if ((par) && (par.type == 1))  // type 1 = attribute
			if (par.style)  // style undefined is root
				{
					//d.document.write("<p>type is " + par.nodeType +  " </p>\n\n");
					if (par.style.getAttribute('display') == 'none')
						{ 
						par = false;  // to break loop
						vis = true;
						}
					par = par.parentNode;  // get parent
				}
			else
				{					
				par=false;
				vis = false;
				}
		}
	}
return vis;
}
// NEW SECTION, May 2014  to not count display='none' ************

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
// NEW SECTION, May 2014
	var non_heading=0;
	var non_text=0;
    if (FrameGuard()) {
        for (n=0;n<tag.length;n++) 
		{
            
            t=document.getElementsByTagName(tag[n]);
            count[n]=t.length;
			//alert("count of " + tag[n] + " is " + count[n]);
			//alert("t is " + t + " and t.length is " + t.length);		// t.length is how many headings found at each particular level
            //alert( t.length);
			
// NEW SECTION, May 2014  to not count display='none' ************
			for (i=0;i<t.length;i++)  
			{
				if (check_parents(t[i]))
					{
					//alert ('none found on element' +  t[i].innerHTML); // if we find display='none', then we don't want to count it, but don't remove from array as still works just fine below
					non_heading++;   // keep track of how many are hidden/display='none'
					if (count[n] != 0)
						count[n]--;
					//alert ('count is ' + count[n]);
					}
			}
// NEW SECTION, May 2014  to not count display='none' ***********
			z= z + count[n];			// count up total headings here, not later....	
			//alert ("z is " + z); 

            if (count[n]>0) 
			{
                msg=msg+'; '+count[n]+' h'+(n+1);
                // alert( msg);							// msg is built on the fly as each 'h' is found
                for (i=0;i<t.length;i++) 				// still draws <h#> around each VISIBLE heading just fine
				{
                    var h;
                    // alert( t[i].style);
                    h=t[i].innerHTML;
                    try {
                        void(t[i].innerHTML='<span style=\'color:navy;font:small bold;background-color:#f5deb3\'><strong>&lt; '+tag[n]+'&gt; </strong></span> '+h+'<span style=\'color:navy;font:small bold;background-color:#f5deb3\'><strong>&lt;/'+tag[n]+'&gt; </strong></span> ');
                    }
                    catch (e) {
                             //alert(e);
                    }
                    //if (h!='')
                    //    z=z+1;
// NEW SECTION, May 2014
					if (h == '')  // if emtpy text, count those headings separate
						non_text++;
                }
            }
        }
        //alert( 'boo');
        if (z==0)   // z = total number of headings found
            alert('No Heading Elements Used');
        else {
// NEW SECTION, May 2014
			if ((non_heading == 0) && (non_text == 0))
				alert(z+' Headings'+msg);	
			else if ((non_heading !=0) && (non_text ==0))
				alert(z+' Headings'+msg+ ", (display:none " + non_heading + " headings)");
			else if ((non_heading ==0) && (non_text !=0))
				alert(z+' Headings'+msg+ ", ( " + non_text + " headings without text)");
			else
				alert(z+' Headings'+msg+ ", (display:none " + non_heading + " headings, including " + non_text + " headings without text)");
        }
    }
}


heading()

}