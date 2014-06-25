
function main(){


for(i = 0; i < f_length; i++){
var  j=0;z=0;
for(z=0;z<GetFrame(i).document.all.length;z++)
{

GetFrame(i).document.all[z].style.cssText="";
}
if(GetFrame(i).document.styleSheets.length>0){
cs=!GetFrame(i).document.styleSheets[0].disabled;

for(j=0;j<GetFrame(i).document.styleSheets.length;j++)
{
GetFrame(i).document.styleSheets[j].disabled=cs;
};cs=true;
}





var H=[];Y={TABLE:1,TR:1,TD:1,TH:1,TBODY:1,TFOOT:1,COL:1,COLGROUP:1,DIV:1},d=[];
var p="";
function R(N)
{
var divs= document.getElementByTagName('DIV');
alert(divs.length);
	for (j=0;divs.length;++j)divs[j].style.display='block';
    var a,x,i,t,j;
    if(t=N.tagName)
    {
	
        t=t.toUpperCase();
        for (i=0;a=H[i];++i)if(N.getAttribute(a))N.removeAttribute(a);
        for(i=0;x=N.childNodes[i];++i)R(x);
        if (Y[t])d.push(N);
    }
}
R(GetFrame(i).document.documentElement);
for (i=0;N=d[i];++i)
{
    p=N.parentNode;
    while(N.firstChild)p.insertBefore(N.firstChild,N);
    p.removeChild(N);
}
}
return null;
}