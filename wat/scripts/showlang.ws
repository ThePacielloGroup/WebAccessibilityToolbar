
function main()
{
    var outitem;
    var outitemtext='';
    output= new Array();
    for(fr = 0; fr <f_length; fr++)
    {
        d=GetFrame(fr).document;
        a=d.all;
        cnt=0;
        spn='<span style=\"'+localize('style6')+'\">';
		 //try
            //{
        for(i=0;i<a.length;i++)
        {
           
                el=a[i];
                if(el.lang||el.hreflang)
                {
                    cnt= cnt+1;
					//alert(cnt);
                    lg=el.lang;
                    hl=el.hreflang;
                    var tn=el.tagName;
                    if(tn=='HTML'||tn=='BODY')
                    {
                        d.body.innerHTML=spn+'['+tn.toLowerCase()+':'+lg+']</span>'+d.body.innerHTML;
                    }
                    else
                    if(tn=='IMG'||tn=='INPUT')
                    {
                        el.insertAdjacentHTML('afterEnd',spn+'['+tn.toLowerCase()+':'+lg+']');
                    }
                    else
                    if(tn=='A')
                    {
                        el.innerHTML=spn+'['+tn.toLowerCase()+':'+hl+']</span>'+el.innerHTML+spn+'[/'+tn.toLowerCase()+']</span>';
                    }
                    //else if (el.canHaveHTML==true)
					try{
					
                    {
                        el.innerHTML=spn+'['+tn.toLowerCase()+':'+el.lang+']</span>'+el.innerHTML+spn+'[/'+tn.toLowerCase()+']</span>';
                    }
					}
					catch(e){ el.insertAdjacentHTML('afterEnd',spn+'['+tn.toLowerCase()+':'+lg+']');}
					}
                }
                if(cnt==0)
                {
                    if (f_length>1)
                    {
					//	if (fr == 1)
							outitem = localize('frame3') + " - " + localize('doclang1')+'\n'+GetFrame(fr).document.location+'\n';
					//	else
					//		outitem = localize('doclang1')+'\n'+GetFrame(fr).document.location+'\n';
					}
                    else
                    {
                        outitem = localize('doclang1');
                    }
                    output.push(outitem);
                }
           // }
            //catch(e)
            //{
                //alert(localize('errortxt5'))
				//break;
            //}
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
