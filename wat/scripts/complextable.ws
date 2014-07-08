
function main()
{
    var outitem;
    var outitemtext='';
    output= new Array();
    for(fr = 0; fr <f_length; fr++)
    {
       try
        {
            var t=GetFrame(fr).document.getElementsByTagName('table');
            s=GetFrame(fr).document.getElementsByTagName('th');
            u=GetFrame(fr).document.getElementsByTagName('td');
            tr=GetFrame(fr).document.getElementsByTagName('caption');
            if((t.length==0)&&(s.length==0)&&(u.length==0))
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
            for(i=0;i<t.length;i++)
            {
                if (t[i].summary=='')
                {
                    h=t[i].outerHTML;
                    t[i].outerHTML='<span style=\"'+localize('style6')+'\">[table] </span> '+h+'<span style=\"'+localize('style6')+'\">[/table]</span>';
                    t[i].style.border='2px dashed #000080';
                }
                if (t[i].summary>'')
                {
                    h=t[i].outerHTML;
                    t[i].outerHTML='<span style=\"'+localize('style6')+'\">[table summary=\"'+t[i].summary+'\"] </span> '+h+'<span style=\"'+localize('style6')+'\">[/table]</span>';
                    t[i].style.border='2px dashed #000080';
                }
            }
            for(i=0;i<s.length;i++)
            {
                if ((s[i].scope=='')&&(s[i].id=='')&&(s[i].headers==''))
                {
                    h=s[i].innerHTML;
                    s[i].innerHTML='<span style=\"'+localize('style6')+'\">[th]</span> <div>'+h+'</div>';
                    s[i].style.border='2px dotted #d2691e';
                }
                if ((s[i].scope=='')&&(s[i].id>'')&&(s[i].headers==''))
                {
                    h=s[i].innerHTML;
                    s[i].innerHTML='<span style=\"'+localize('style6')+'\">[th id=\"'+s[i].id+'\"]</span> <div>'+h+'</div>';
                    s[i].style.border='2px dotted #d2691e';
                }
                if ((s[i].scope>'')&&(s[i].id=='')&&(s[i].headers==''))
                {
                    h=s[i].innerHTML;
                    s[i].innerHTML='<span style=\"'+localize('style6')+'\">[th scope=\"'+s[i].scope+'\"]</span> <div>'+h+'</div>';
                    s[i].style.border='1px dotted #d2691e';
                }
                if ((s[i].scope>'')&&(s[i].id>'')&&(s[i].headers==''))
                {
                    h=s[i].innerHTML;
                    s[i].innerHTML='<span style=\"'+localize('style6')+'\">[th id=\"'+s[i].id+'\" scope=\"'+s[i].scope+'\"]</span> <div>'+h+'</div>';
                    s[i].style.border='1px dotted #d2691e';
                }
                if ((s[i].scope=='')&&(s[i].id=='')&&(s[i].headers>''))
                {
                    h=s[i].innerHTML;
                    s[i].innerHTML='<span style=\"'+localize('style6')+'\">[th headers=\"'+s[i].headers+'\"]</span> <div>'+h+'</div>';
                    s[i].style.border='2px dotted #d2691e';
                }
                if ((s[i].scope=='')&&(s[i].id>'')&&(s[i].headers>''))
                {
                    h=s[i].innerHTML;
                    s[i].innerHTML='<span style=\"'+localize('style6')+'\">[th id=\"'+s[i].id+'\" headers=\"'+s[i].headers+'\"]</span> <div>'+h+'</div>';
                    s[i].style.border='2px dotted #d2691e';
                }
                if ((s[i].scope>'')&&(s[i].id=='')&&(s[i].headers>''))
                {
                    h=s[i].innerHTML;
                    vs[i].innerHTML='<span style=\"'+localize('style6')+'\">[th scope=\"'+s[i].scope+'\" headers=\"'+s[i].headers+'\"]</span> <div>'+h+'</div>';
                    s[i].style.border='1px dotted #d2691e';
                }
                if ((s[i].scope>'')&&(s[i].id>'')&&(s[i].headers>''))
                {
                    h=s[i].innerHTML;
                    s[i].innerHTML='<span style=\"'+localize('style6')+'\">[th id=\"'+s[i].id+'\" scope=\"'+s[i].scope+'\" headers=\"'+s[i].headers+'\"]</span> <div>'+h+'</div>';
                    s[i].style.border='1px dotted #d2691e';
                }
            }
           for(i=0;i<u.length;i++)
            {
                if ((u[i].scope=='')&&(u[i].id=='')&&(u[i].headers==''))
                {
                    h=u[i].innerHTML;
                    u[i].innerHTML='<span style=\"'+localize('style6')+'\">[td]</span> <div>'+h+'</div>';
                    u[i].style.border='2px dotted #d2691e';
                }
                if ((u[i].scope=='')&&(u[i].id>'')&&(u[i].headers==''))
                {
                    h=u[i].innerHTML;
                    u[i].innerHTML='<span style=\"'+localize('style6')+'\">[td id=\"'+u[i].id+'\"]</span> <div>'+h+'</div>';
                    u[i].style.border='2px dotted #d2691e';
                }
                if ((u[i].scope>'')&&(u[i].id=='')&&(u[i].headers==''))
                {
                    h=u[i].innerHTML;
                    u[i].innerHTML='<span style=\"'+localize('style6')+'\">[td scope=\"'+u[i].scope+'\"]</span> <div>'+h+'</div>';
                    u[i].style.border='1px dotted #d2691e';
                }
                if ((u[i].scope>'')&&(u[i].id>'')&&(u[i].headers==''))
                {
                    h=u[i].innerHTML;
                    u[i].innerHTML='<span style=\"'+localize('style6')+'\">[td id=\"'+u[i].id+'\" scope=\"'+u[i].scope+'\"]</span> <div>'+h+'</div>';
                    u[i].style.border='1px dotted #d2691e';
                }
                if ((u[i].scope=='')&&(u[i].id=='')&&(u[i].headers>''))
                {
                    h=u[i].innerHTML;
                    u[i].innerHTML='<span style=\"'+localize('style6')+'\">[td headers=\"'+u[i].headers+'\"]</span> <div>'+h+'</div>';
                    u[i].style.border='2px dotted #d2691e';
                }
                if ((u[i].scope=='')&&(u[i].id>'')&&(u[i].headers>''))
                {
                    h=u[i].innerHTML;
                    u[i].innerHTML='<span style=\"'+localize('style6')+'\">[td id=\"'+u[i].id+'\" headers=\"'+u[i].headers+'\"]</span> <div>'+h+'</div>';
                    u[i].style.border='2px dotted #d2691e';
                }
                if ((u[i].scope>'')&&(u[i].id=='')&&(u[i].headers>''))
                {
                    h=u[i].innerHTML;
                    vu[i].innerHTML='<span style=\"'+localize('style6')+'\">[td scope=\"'+u[i].scope+'\" headers=\"'+u[i].headers+'\"]</span> <div>'+h+'</div>';
                    u[i].style.border='1px dotted #d2691e';
                }
                if ((u[i].scope>'')&&(u[i].id>'')&&(u[i].headers>''))
                {
                    h=u[i].innerHTML;
                    u[i].innerHTML='<span style=\"'+localize('style6')+'\">[td id=\"'+u[i].id+'\" scope=\"'+u[i].scope+'\" headers=\"'+u[i].headers+'\"]</span> <div>'+h+'</div>';
                    u[i].style.border='1px dotted #d2691e';
                }
            }

            for(i=0;i<tr.length;i++)
            {
                h=tr[i].innerHTML;
                tr[i].innerHTML='<span style=\"'+localize('style6')+'\">[caption] </span>'+h+'<span style=\"'+localize('style6')+'\">[/caption]</span>';
                tr[i].style.border='2px dashed #2f4f4f';
            }
        }
        catch(e)
        {
            //alert(e.message);
			return;
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

