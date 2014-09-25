function main () 
{
	var outitem =0;
	var outitemtext=''
	output= new Array();

	for(fr = 0; fr <f_length; fr++)
	{
		pooter = GetFrame(fr).document.body.getElementsByTagName('*');
		// alert("element count is " + pooter.length);
		for(var g=0;g<pooter.length;++g)
		{
			if (pooter[g].currentStyle != null)   // SVG iamges broke this check
				//alert ("No currentstyle for " + pooter[g].tagName);
			{
				if (pooter[g].currentStyle.backgroundImage!=null)
				{
					pooter[g].style.backgroundImage='none';
				}
				if (pooter[g].currentStyle.listStyleImage!=null)
				{
					pooter[g].style.listStyleImage='none';
				}
			}
		}
//if(GetFrame(fr).document.images.length>0){

	var altc;
	function to(c)
	{
		var a,k;altc=0;
		a=new Array;
		for(k=0;k<c.length;++k)a[k]=c[k];
			return a;
	}
	
	var im,img,xt;
	//im=to(GetFrame(fr).document.getElementsByTagName('img'));
	//tag= new Array('img','input');
	ime = new Array();
	//for(n=0;n<tag.length;n++)
	//{
	t=to(pooter);
	//}

	for(q=0;q<t.length;q++)
	{
		if(t[q].tagName=='IMG')	
		{
			ime.push(t[q]) 
		}
		if(t[q].tagName=='INPUT'&&t[q].type=='image')
		{
			ime.push(t[q])
		}
	}
	im=ime
	//alert(ime.length);
	if (im.length>0);
	for(var i=0;i<im.length;++i)
	{
		img=im[i];
		e=GetFrame(fr).document.createElement('span');
		e.style.cssText=localize('style6');
		//alert("alt specified is " + img.attributes.alt.specified);
		if (img.attributes.alt != null)
		{
			if(img.attributes.alt.specified!=true)
			{
				altc+=1;
				xt=GetFrame(fr).document.createTextNode(localize('img_alt1'));
			}
			else
			{
				//alert("altc is " + altc);
				xt=GetFrame(fr).document.createTextNode('\"'+img.alt+'\"')
			}
		}
		else 
		{
			altc+=1;
			xt=GetFrame(fr).document.createTextNode(localize('img_alt1'));
		}
		e.appendChild(xt);
		img.parentNode.replaceChild(e,img);
	}
		
		
		if(altc>0)
		{
			if (f_length>1)
			{
				//alert("altc is " + altc);
				outitem = GetFrame(fr).document.location+'\n'+altc+' '+localize('img_alt2')+'\n';
				output.push(outitem);
			}
			else
			{
				alert(altc+' '+localize('img_alt2'))
			}
		}
	}
//}
	for(x in output)
	{
		outitemtext+=output[x]
	}
	if(output.length!=0) 
	{
		alert(outitemtext);
	}
}
