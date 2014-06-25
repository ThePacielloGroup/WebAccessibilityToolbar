function main()
{
    var elName= window.prompt(localize('common6')+' input, p, span ...','');
    var brdrClr= window.prompt(localize('common7'),'red');
    if(elName)
    {
        theEls=WAT.document.getElementsByTagName(elName);
        if(theEls.length!=0)
        {
            for(i=0;i<theEls.length;i++)
            {
                theEls[i].style.border='solid 2px #ff0000';
                theEls[i].style.borderColor=brdrClr;
            }
        }
        else
        {
           alert(localize('common4')+' '+elName+' '+localize('common5'))
        }
    }
}