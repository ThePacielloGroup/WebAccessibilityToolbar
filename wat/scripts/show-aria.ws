// show-aria.ws      'PowerToy like clone', installed inside AccessibilityToolbar, for finding all ARIA attributes on a web page...

function main()
{

	var str = new String ("toolbar=no,location=no,directories=no,status=yes,menubar=yes, \
	scrollbars=yes, resizable=yes, top=-50, left=10, width=800, height=");

	str = str + (screen.height - 250);
	str = str + " target='_blank'";
	//alert (screen.height);  --> 1024

	//var dlProgress = window.open ("about:blank", "dlProgress", str);
	var dlProgress = window.open ("about:blank", "", str);
	
	if (!dlProgress)
	{
		alert("It appears that you are using a popup blocker, you will need to allow popups on this page to use this function");
		return;
	}

	dlProgress.document.writeln("<!doctype html>");
	dlProgress.document.writeln ("<html lang='en-US'>");
	dlProgress.document.writeln ("<head>");
	dlProgress.document.writeln ("<title>Elements with ARIA attributes list</title>");
	dlProgress.document.writeln ("</head>");
	dlProgress.document.writeln ("<body>");

	dlProgress.document.writeln ("<font style=\"font:       8pt Verdana, Arial, Helvetica, Sans-serif; \
	line-height:18pt;\">");

	dlProgress.document.writeln ("&nbsp;List of all elements with an ARIA attribute in \
	<b>" + document.title + "</b>:<ol>\n\n");

	var elems = document.all;
	var i_aria = 0;
	var aria = false;
	//var aria_tag=new Array('aria-label','aria-labelledby','aria-hidden','aria-haspopup','aria-required','aria-describedby');
	//aria-labelledby

	var aria_tag=new Array('aria-activedescendant', 'aria-atomic', 'aria-autocomplete', 'aria-busy', 'aria-checked',
	'aria-controls', 'aria-describedby', 'aria-disabled', 'aria-dropeffect', 'aria-expanded', 'aria-flowto', 'aria-grabbed',
	'aria-haspopup', 'aria-hidden', 'aria-invalid', 'aria-label', 'aria-labelledby', 'aria-level', 'aria-live', 'aria-multiline',
	'aria-multiselectable', 'aria-orientation', 'aria-owns', 'aria-posinset', 'aria-pressed', 'aria-readonly', 'aria-relevant',
	'aria-required', 'aria-selected', 'aria-setsize', 'aria-sort', 'aria-valuemax', 'aria-valuemin', 'aria-valuenow', 'aria-valuetext', 'role');

	for (i = 0; i < elems.length; i++)
	{
		var str ="";		// rebuild each time thru the loop for each element on the page
		i_aria = 0;
		////if (elems.item(i) != '[object]')
		////{
			for (n=0; n<aria_tag.length;n++) 
			{
// for some reason, tagNames must be in all CAPS ?
				//if (elems.item(i).hasAttribute(aria_tag[n]))    // aspx doesn't seem to support this call ????
				if (elems.item(i).getAttribute(aria_tag[n]))
					{
						i_aria +=1;
						aria=true;
						var value= elems.item(i).getAttribute(aria_tag[n]);
						str = str + aria_tag[n] + " has value of -> " + value + ", ";
					}
				}
			if (i_aria != 0)		
			{
				if ((elems.item(i).tagName == "BODY") || (value == "main"))
					//alert("found body tag");
					dlProgress.document.writeln ("<li> " + elems.item(i).tagName + " -> " + str + " source HTML not included on BODY element or role='main' \n </li>\n\n\n");	
				else
					dlProgress.document.writeln ("<li> " + elems.item(i).tagName + " -> " + str + " \n" + elems.item(i).outerHTML + " </li>\n\n\n");	
			}
		////}			
	}
if (!aria)
    dlProgress.document.writeln ("<p> No elements with ARIA attributes were found on this web page. </p> <BR>");

dlProgress.document.writeln ("</ol><center><a href='javascript:window.close()' style=\"color:#FF0000;text-decoration:none\"> \
close this page</a></center><BR>");

dlProgress.document.writeln ("</font></body></html>");
dlProgress.document.close();


}  // main

 
 
