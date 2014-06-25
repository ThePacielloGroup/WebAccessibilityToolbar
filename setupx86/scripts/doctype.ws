function main()
{
    var outitem;
    var outitemtext='';
    output= new Array();
    for(fr = 0; fr <f_length; fr++)
    {
        var z=0,tag=new Array('!');
        for(n=0;n<tag.length;n++)
        {
            t=GetFrame(fr).document.getElementsByTagName(tag[n]);
         if(t.length==0){
            if (f_length>1)
                        {//alert(f_length);
                            outitem = localize('common8')+'\n'+GetFrame(fr).document.location+'\n';
                            output.push(outitem);
                            break;
                        }
                        else
                        {
                            outitem = localize('common8');
							 output.push(outitem);
                            break;
                        }
						}
						
            else
            {
                for(i=0;i<t.length;i++)
                {
                    myString=new String(t[i].text).toUpperCase();
                    myString1=new String(t[i].text).toUpperCase();
                    if(myString1.indexOf('XML')!=-1)
                    {
                        if(t.length>1)
                        {
                            if (f_length>1)
                            {
                                outitem = t[i+1].text+'\n'+GetFrame(fr).document.location+'\n';
                                output.push(outitem);
                                break;
                            }
                            else
                            {
                                outitem = t[i+1].text;
                                output.push(outitem);
                                break;
                            }
                        }
                    }
                    if(myString.indexOf('DOCTYPE')!=-1)
                    {
                        if (f_length>1)
                        {
                            outitem = t[i].text+'\n'+GetFrame(fr).document.location+'\n';
                            output.push(outitem);
                            break;
                        }
                        else
                        {
                            outitem = t[i].text;
                            output.push(outitem);
                            break;
                        }
                    }
                /*     else
                    {
                        
                    }*/
               }
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