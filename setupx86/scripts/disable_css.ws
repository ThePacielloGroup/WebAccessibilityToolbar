
function main()
{

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
}

}
