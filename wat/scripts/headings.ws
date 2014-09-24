function main()
{
	var outitem;
	var outitemtext='';
	output= new Array();

    for(fr = 0; fr <f_length; fr++)
	{
		var z=0;   
		var tag=new Array('h1','h2','h3','h4','h5','h6');
        for(n=0;n<tag.length;n++)
		{
			t=GetFrame(fr).document.getElementsByTagName(tag[n]);
            for(i=0;i<t.length;i++)
			{
				h=t[i].innerHTML;
				t[i].innerHTML='<strong '+localize('style1')+'>&lt; '+tag[n]+'&gt; </strong> '+h+'<strong '+localize('style1')+'>&lt;/'+tag[n]+'&gt; </strong> ';
				if(h!='')
					z=z+1;
			}
		}        
		if(z==0)
		{
			if (f_length>1)
			{
				outitem = localize('head3')+ ' ' + localize('head4') + '\n'+GetFrame(fr).document.location+'\n\n'; 
			}
			else 
			{
				outitem = localize('head3');
			}
		output.push(outitem);
		}  
	} 
	if(output.length>0)
	{ 
		for(x in output)
		{
			outitemtext+=output[x]
		}
	}
	if(outitemtext!='') 
	{
		alert(outitemtext);
	}
}
  



