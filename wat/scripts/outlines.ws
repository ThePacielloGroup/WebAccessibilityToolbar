

function main()
{

// NEW SECTION, May 2014  to not count display='none' ************
function check_parents(element) {    // if returns false, display='none' not found in entire parent grandparent, etc hierarchy
var vis = false;   
var par = element; 
//alert("par is " + par + " and element is " + element);
	while (par)
	{
		if (par != '[object]')   // to break loop at no object to call/check
		{
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
				if (par == '[object Document]')   // to break loop at last object to call/check
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

	var outitem;
	var outitemtext='';
	output= new Array();
	var lw = false;
	
	for(fr = 0; fr <f_length; fr++)
	{
		//alert("fr is " + fr);
		var z=0
		var loc = GetFrame(fr).document.location;
		var tit = GetFrame(fr).document.title;
		var la1='<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="'+localize('doclang')+'" lang="'+localize('doclang')+'"><head><title>'+localize('headst1')+ ' -  ' + tit + '</title><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /><body>';
		var la2 ='<a href=\"javascript:window.close();\">'+localize('common1')+'</a>';
		var la2a ='<a href=\"'+loc+'\">'+localize('common3')+'</a>';
		var la3 ='<hr /><div style="font:x-small verdana;border:2px solid #ffefd5"><strong>'+localize('headst2')+'</li></ol></div>';

		var doctitle = '<h1 style="font:medium verdana">'+localize('common2')+' '+GetFrame(fr).document.title+'</h1>'

		var z=0,  style1="<strong '+localize('style1')+'>";
		t=GetFrame(fr).document.getElementsByTagName('*');
		for(i=0;i<t.length;i++)
		{
			if(t[i].tagName.toLowerCase()=='h6'||t[i].tagName.toLowerCase()=='h5'||t[i].tagName.toLowerCase()=='h4'||t[i].tagName.toLowerCase()=='h3'||t[i].tagName.toLowerCase()=='h2'||t[i].tagName.toLowerCase()=='h1')
			{
// NEW SECTION, May 2014  to not count display='none' ************
				if (check_parents(t[i]))  // if true, we have a display:none at root or in hierarchy...
				{
					//alert("found hidden " + t[i]);
					var h=t[i].innerHTML;
					doctitle+='<div style="margin-left:'+(t[i].tagName.slice(1,2)*4)+'0px;font:medium verdana\"><span style=\"color: #000080;\"><'+t[i].tagName+' style="\font:medium verdana\">&lt;'+ '<span style=\"background-color: red;\">'+ t[i].tagName+'</span> &gt;</span>'
					doctitle+='<span style=\"background-color: red;\">'+h+'</span>';
					doctitle+='<span style=\"color:#000080;\">&lt;/'+ '<span style=\"background-color: red;\">' + t[i].tagName+'</span>&gt;</span></'+ t[i].tagName+ '></div></body></html>';
				}
// NEW SECTION, May 2014  to not count display='none' ************				
				else
				{
					var h=t[i].innerHTML;
					doctitle+='<div style="margin-left:'+(t[i].tagName.slice(1,2)*4)+'0px;font:medium verdana\"><span style=\"color: #000080;\"><'+t[i].tagName+' style="\font:medium verdana\">&lt;'+t[i].tagName+'&gt;</span>'
					doctitle+=h;
					doctitle+='<span style=\"color:#000080;\">&lt;/'+t[i].tagName+'&gt;</span></'+t[i].tagName+'></div></body></html>';
				}
			if(h!='')
				void(z=z+1);
				//alert("got here");
			}
		}


		if((z==0) && (!lw))
		{
			if (f_length>1)
			{
				outitem = localize('head1')+'\n'+GetFrame(fr).document.location+'\n'; 
			}
			else 
			{
				outitem = localize('head3');
			}
		output.push(outitem);
		}
		
		else
			{
			if (typeof document.body.style.maxHeight=="undefined") 
				{
				WAT.document.write(la1+la2a+la3+doctitle);
				alert("height undefind");
				} 
			else 
				{
				try
					{
					if (!lw)
						{
						//lw=window.open('about:blank','lw');
						lw=window.open('about:blank','');	// allows to open multiple windows of same title....
						//alert("lw is " + lw.length);
						lw.document.open();
						}
					}
				catch (e)
					{
					if (lw)
						{
						lw.close();
						alert(localize('errortxt5'));
						WAT.document.write(la1+la2a+la3+doctitle);
						return;
						}
					else
						{
						alert(localize('errortxt1'));
						WAT.document.write(la1+la2a+la3+doctitle);
						return;
						}
					}
				//lw.document.write(la1+la2+la3+doctitle);
				if (fr == f_length)		// don't close until we've done all frames, if they exist
					lw.document.close();
				else
					lw.document.write(la1+la2+la3+doctitle);
				}
			}
	}
	
	if(output.length>0)
	{ 
		for(x in output)
		{
			outitemtext+=output[x]
		}
	}
	if(output.length>0) 
	{
		alert(outitemtext);
	}
}


