
function main(){
var outitem;
var outitemtext='';
output= new Array();
for(fr = 0; fr <f_length; fr++){
try {
var t=GetFrame(fr).document.getElementsByTagName('th');
for(i=0;i<t.length;i++){
t[i].style.border='1px solid #ffff00';
t[i].style.padding='6px';
t[i].style.color='#ffff00';
t[i].style.background='#000000';}
if(t.length==0) {
 if (f_length>1){
     outitem = localize('thead1')+'\n'+GetFrame(fr).document.location+'\n'; 
	}
	else {
	outitem = localize('thead1');
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
