function main(){

var outitem;
    var outitemtext='';
    output= new Array();
    for(fr = 0; fr <f_length; fr++)
    {
       // try
      // {
var t=GetFrame(fr).document.body.getElementsByTagName('table');
if (t.length>0){
var cssLink = GetFrame(fr).document.createElement('STYLE');
cssLink.setAttribute('id', 'poot');
GetFrame(fr).document.getElementsByTagName('head')[0].appendChild(cssLink);
GetFrame(fr).document.all.poot.innerHTML=localize('style7');
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
        //}
      //catch(e)
       // {
          //alert(localize('errortxt5'))
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
