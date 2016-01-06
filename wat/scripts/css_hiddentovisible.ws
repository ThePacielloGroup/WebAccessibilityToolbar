function main(){
	for(i = 0; i < f_length; i++){
		for(z=0;z<GetFrame(i).document.all.length;z++){    
			if ((GetFrame(i).document.all[z].currentStyle.visibility)&&(GetFrame(i).document.all[z].currentStyle.visibility=='hidden'))
			{
				GetFrame(i).document.all[z].style.visibility='visible';
				GetFrame(i).document.all[z].style.border='1px dotted #228b22';
			}
		}
	}
}