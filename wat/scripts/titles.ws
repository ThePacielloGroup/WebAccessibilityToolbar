
function main()
{
var outitem;
var outitemtext='';
output= new Array();
for(fr = 0; fr <WAT.f_length; fr++){
    try
    {
        var b=0;
        t=GetFrame(fr).document.body.getElementsByTagName('*');
        for(i=0;i<t.length;i++)
        {
            if(t[i].title!='')
            {
                t[i].insertAdjacentHTML('AfterEnd','&nbsp;&nbsp;<span style=\"'+localize('style6')+'\"><strong>Title: </strong>'+t[i].title+' </span>');
                b=b+1
            }
        }
        if(b==0)
		{
 if (WAT.f_length>1){
     outitem = localize('common9')+'\n'+GetFrame(fr).document.location+'\n'; 
	}
	else {
	outitem = localize('common9');
	}
	output.push(outitem);
	 }
	 }


catch(e){alert(localize('errortxt5')+"\n "+e.description)}
}


if(output.length>0){ 
  for(x in output){
outitemtext+=output[x]
}
}
if(output.length>0) {
alert(outitemtext);}
}