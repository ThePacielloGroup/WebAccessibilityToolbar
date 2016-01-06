function main(){
	for(i = 0; i < f_length; i++){
		for(z=0;z<GetFrame(i).document.all.length;z++){    
			if ( ((GetFrame(i).document.all[z].currentStyle.left)&&(parseInt(GetFrame(i).document.all[z].currentStyle.left, 10)<=-50)) || ((GetFrame(i).document.all[z].currentStyle.top)&&(parseInt(GetFrame(i).document.all[z].currentStyle.top, 10)<=-50)) || ((GetFrame(i).document.all[z].currentStyle.textIndent)&&(parseInt(GetFrame(i).document.all[z].currentStyle.textIndent, 10)<=-50)) )
			{
				GetFrame(i).document.all[z].style.top='0';
				GetFrame(i).document.all[z].style.left='0';
				GetFrame(i).document.all[z].style.textIndent='0';
				GetFrame(i).document.all[z].style.display='block';
				GetFrame(i).document.all[z].style.position='relative';
				GetFrame(i).document.all[z].style.backgroundColor='#ffffff';
				GetFrame(i).document.all[z].style.color='#000000';
				GetFrame(i).document.all[z].style.zIndex='5000';
			}
		}
	}
}