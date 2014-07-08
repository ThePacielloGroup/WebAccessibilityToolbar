function main(){

for(i = 0; i < f_length; i++){
     
var  j=0;z=0;
for(z=0;z<GetFrame(i).document.all.length;z++)
{

if (GetFrame(i).document.all[z].style.cssText!=''){
//alert(GetFrame(i).document.all[z].style.cssText);
GetFrame(i).document.all[z].style.cssText='';
}
}

}



}