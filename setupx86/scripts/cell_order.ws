

function main(){
    var outitem;
    var outitemtext='';
    output= new Array();
    for(fr = 0; fr <f_length; fr++)
    {
        try
       {
            t=GetFrame(fr).document.body.getElementsByTagName('table');
            {var b=0;
                for(i=0;i<t.length;i++)
                {
                    
                    tabletags=t[i];
					
                    celltags=tabletags.cells;
						for(v=0;v<celltags.length;v++)
                        {
                          
						    b=b+1; 
                            h=celltags[v].innerHTML; 
                            celltags[v].innerHTML='<span style=\"'+localize('style6')+'\">'+b+'</span>'+h;
                            celltags[v].style.border='1px dashed #ff0000';
							
							
                        }
                    
                }
            }
            if(t.length==0)
            {
                if (f_length>1)
                {
                    outitem = localize('ctable1')+'\n'+GetFrame(fr).document.location+'\n';
                }
                else
                {
                    outitem = localize('ctable1');
                }
                output.push(outitem);
            }
        }
      catch(e)
        {
          alert(localize('errortxt5'))
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