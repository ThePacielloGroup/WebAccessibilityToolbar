function main(){

for(i = 0; i < f_length; i++){
 for(z=0;z<GetFrame(i).document.all.length;z++){    


if (GetFrame(i).document.all[z].currentStyle.display=='none')
{

GetFrame(i).document.all[z].style.display='inline-block';
GetFrame(i).document.all[z].style.border='1px dotted #b22222';
}

}
}

}