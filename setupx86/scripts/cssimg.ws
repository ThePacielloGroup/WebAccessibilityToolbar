function main ()
{
    var outitem =0;
    var outitemtext=''
    output= new Array();
    for(fr = 0; fr <f_length; fr++)
    {
        var cssimg=0;
        pooter = GetFrame(fr).document.body.getElementsByTagName('*');
        for(var g=0;g<pooter.length;++g)
        {
            if (pooter[g].currentStyle.backgroundImage!=null)
            {
                pooter[g].style.backgroundImage='none';
                cssimg+=1
            }
            if (pooter[g].currentStyle.listStyleImage!=null)
            {
                pooter[g].style.listStyleImage='none';
                cssimg+=1
            }
        }
        if(cssimg==0)
        {
            if (f_length>1)
            {
                outitem = GetFrame(fr).document.location+' '+localize('img_alt3')+'\n';
                output.push(outitem);
            }
            else
            {
                alert(localize('img_alt3'))
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