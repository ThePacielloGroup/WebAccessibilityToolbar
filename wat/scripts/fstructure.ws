
function main()
{

function replace_brackets(str)
	{
	rep1=/</gi;
	replaceIt=str.replace(rep1, "&lt;");
	rep2=/>/gi;
	replaceIt=replaceIt.replace(rep2, "&gt;");
	return replaceIt;	
	}
	
	function get_noframes ()
	{
	//alert("entered no frames");
	var tagnf=WAT.document.getElementsByTagName('noframes');
	nf=0;
	 
	if (tagnf.length==false) 
		{
		noframe=localize('frame1');
		return noframe;
		}
	 else 
		{
		for(nf=0;nf<tagnf.length;nf++)
			{
			noframe=tagnf[nf].outerHTML;
			noframe=replace_brackets(noframe);
			return noframe;
			}
		}
	}
	

	function getf()
	{ 
	var zappa=0,fzappa=0,izappa=0,tagn=new Array('frame','iframe'),stuff='';
	noframe='';
	try 
		{
		var loc=WAT.document.location;
		stuff+='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xml:lang="'+localize('doclang')+'" lang="'+localize('doclang')+'" xmlns="http://www.w3.org/1999/xhtml"><head><title>'+localize('frame2')+' '+WAT.document.location+'</title><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body  style="font:normal 1em arial;"><span style="font-size:.8em">'
		if (typeof document.body.style.maxHeight=="undefined") 
			{
			stuff+='<a href=\"'+loc+'\">'+localize('common3')+'</a>';
			}
		else {stuff+='<a href="javascript:window.close();">'+localize('docp2')+'</a>'}

		stuff+='</span></div><hr /><h1>'+localize('frame3')+'</h1><ul>';
		//alert("stuff #1 is " + stuff + "  tagn.length is " + tagn.length + "   tag array is " + f_length); 
		//length of tag array
		for(fr = 0; fr <f_length; fr++)
			{
			for(nino=0;nino<tagn.length;nino++)
				{ //for1    
				tagf=GetFrame(fr).document.getElementsByTagName(tagn[nino]); 
				//var loc = GetFrame(fr).document.title;
				//var loc = GetFrame(fr).document.location;
				//var loc = GetFrame(fr).contentWindow.location;
				//if (loc != "")
				//	var url = "<a href="+loc+">"+loc+"</a>";
				//alert("nino count is " + nino + " tagf is " + tagf + "  tagf.length is " + tagf.length);
				for(ippo=0;ippo<tagf.length;ippo++)
					{   //for2
						//alert("ippo count is " + ippo);
						//alert("tagname is " + tagf[ippo].tagName + " name is " +  tagf[ippo].name + " url is  " + tagf[ippo].contentWindow.location);
						
						stuff+='<li><span style=\'color:#000000;font:small bold;font-family:arial;\'>'+tagf[ippo].tagName+'-'+(ippo+1)+'</li><ul>';
						//if (tagf[ippo].attributes.name.specified==true)
						if (tagf[ippo].name != "")
						{
							stuff+='<li>Name="'+tagf[ippo].name+'"</li>'
						}
						else 
						{
							stuff+='<li>Name <strong style=\"color:ff0000\">'+localize('frame4')+'</strong></li>'
						}
						//if ((tagf[ippo].tagName=='IFRAME'||tagf[ippo].tagName=='FRAME')&&tagf[ippo].attributes.longDesc.specified==true)
						if ((tagf[ippo].tagName=='IFRAME'||tagf[ippo].tagName=='FRAME')&&tagf[ippo].longDesc !="")
						{
							stuff+='<li>Longdesc="<a href=\"'+tagf[ippo].longDesc+'\">'+tagf[ippo].longDesc+'"</a></li>'
						}
						else 
						{
							//alert("style is " + tagf[ippo].style);
							stuff+='<li>Longdesc <strong style=\"color:#ff0000\">'+localize('frame4')+'</strong></li>'
						}
						//if (tagf[ippo].attributes.title.specified==true)
						if (tagf[ippo].title != "")
						{
							stuff+='<li>Title="'+tagf[ippo].title+'"</li>'
						}
						else 
						{
							stuff+='<li>Title <strong style=\"color:#ff0000\">'+localize('frame4')+'</strong></li>'
						}        
		
					stuff+= '<li>Src="<a href=\"'+tagf[ippo].contentWindow.location+'\">'+tagf[ippo].contentWindow.location+'</a>"</span></li></ul></li>';
					zappa=zappa+1;
					//alert("zappa is " + zappa);
					} 
				}
			}
		if(zappa==0)
		{
			alert(localize('frame6'));
		}
		else
		{
			stuff+='</ul>';
			if (typeof document.body.style.maxHeight=="undefined") 
			{
				get_noframes ();
				noframe='<hr /><h2>NOFRAMES</h2><p>'+noframe+'</p>';  
				WAT.document.write(stuff);
				WAT.document.write(noframe);
				WAT.document.write('</body></html>');
				WAT.document.title=localize('frame7')+WAT.document.location;
				WAT.document.close();
				return;
			} 
			else 
			{
				try
					{ 
						var lw=window.open('about:blank','');
						lw.document.open();
						//alert('lw is ' + lw);
					}
				catch(e) 
				{
					if (lw)
					{
						alert(localize('errortxt5'));
						lw.close();
						return;
					}
					else
					{
						alert(localize('errortxt1'));
						return;
					}
				}		
			}
			get_noframes ();
			noframe='<hr /><h2>NOFRAMES</h2><p>'+noframe+'</p>';  
			lw.document.write(stuff);
			lw.document.write(noframe);
			lw.document.write('</body></html>');
			lw.document.title=localize('frame7')+WAT.document.location;
			lw.document.close();
			}
		} 
	catch(e)
	{
		//alert("stuff is " + stuff);
		alert(localize('errortxt5'))
	}
} 
 
getf();
}

