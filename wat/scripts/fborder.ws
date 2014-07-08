function main()
{
  
     
	for(fr = 0; fr <2; fr++){
	 var zappa=0,fzappa=0,izappa=0,tagn=new Array('frame','iframe');
	for(nino=0;nino<tagn.length;nino++)
    {
        tagf=WAT.document.getElementsByTagName(tagn[nino]);
        {
            for(ippo=0;ippo<tagf.length;ippo++)
            {
                if(tagf[ippo].tagName=='FRAME')
                {
                    fzappa=fzappa+1
                }
                else
                {
                    izappa=izappa+1
                }
                tagf[ippo].style.border='dashed 4px #dc143c';
                zappa=zappa+1;
            }
        }
    }}
    if(zappa==0)
    {
        alert(localize('fborder1'));
    }
   if (zappa>0)
    {
    alert(fzappa+' '+localize('fborder2')+'\n'+izappa+' '+localize('fborder3'));
	
    }



}
