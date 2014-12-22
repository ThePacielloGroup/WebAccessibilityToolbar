function main()
{
	var outitem;
	var outitemtext='';
	var myRegExp = /svg/i;   // can NOT write title attribute into any SVG elements ...test for string SVG or svg, anywhere in the element name, catches those seen on next line
							 //if (t[i] == '[object SVGSVGElement]' ||  t[i] == '[object SVGImageElement]' || t[i] == '[object SVGGElement]' || t[i] == '[object SVGPathElement]' || t[i] == '[object SVGPolygonElement]')	
	output= new Array();
	for(fr = 0; fr <WAT.f_length; fr++)
	{
		try
		{
			var b=0;
			t=GetFrame(fr).document.body.getElementsByTagName('*');
			for(i=0;i<t.length;i++)
			{
				if((t[i].title!='') && (!myRegExp.test(t[i])))   // added 2nd check to avoid writing 'title' attributes to SVG elements
				{
					t[i].insertAdjacentHTML('AfterEnd','&nbsp;&nbsp;<span style=\"'+localize('style6')+'\"><strong>Title: </strong>'+t[i].title+' </span>');
					b=b+1
				}
			}
			if(b==0)
			{
				if (WAT.f_length>1)
				{
					outitem = localize('frame3') + " - " + localize('common9')+'\n'+GetFrame(fr).document.location+'\n'; 
				}
				else 
				{
					outitem = localize('common9');
				}
			output.push(outitem);
			}
		}
		catch(e)
		{
			alert(localize('errortxt5')+ "what is t " + t[i] + "\n "+e.description)
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