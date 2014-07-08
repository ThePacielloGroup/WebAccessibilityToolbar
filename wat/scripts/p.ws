
function main(){
var outitem;
var outitemtext='';
output= new Array();
for(fr = 0; fr <f_length; fr++){
try {


var z=0,tag=new Array('p','header');
for(n=0;n<tag.length;n++){
  t=GetFrame(fr).document.getElementsByTagName(tag[n]); 
  z+=t.length;
  {
    for(i=0;i<t.length;i++){
      var la='',ha='';
	 
		la=''+tag[n]+'';
		ha='/'+tag[n]+'';
		t[i].style.border='solid 1px #ff0000';
      var h=t[i].innerHTML;
	  //alert(h);
	t[i].innerHTML='<span style=\"'+localize('style6')+'\">'+la+'</span>'+h+'<span style=\"'+localize('style6')+'\">'+ha+'</span>';
     // alert(h);
      
    }
  }
}
if(z==0)
{
 if (f_length>1){
     outitem = localize('common12')+'\n'+GetFrame(fr).document.location+'\n'; 
	}
	else {
	outitem = localize('common12');
	}
	output.push(outitem);
	 }
	 }
 

//}




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




