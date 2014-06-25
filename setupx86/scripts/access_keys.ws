
function main(){

tag=new Array('a','input','textarea','object','button','select','applet','embed');
var outitem;
var outitemtext='';
output= new Array();
for(fr = 0; fr <f_length; fr++){
try {
var za=0
for(n=0;n<tag.length;n++){
t=GetFrame(fr).document.getElementsByTagName(tag[n]);
for(i=0;i<t.length;i++){h=t[i].outerHTML;if(t[i].accessKey>''){
t[i].outerHTML='<span style=\"'+localize('style6')+'\"><strong> Accesskey ('+t[i].accessKey+') </strong> </span>'+h;
if(h!='')za=za+1;
}
}
}
if(za==0)
{
 if (f_length>1){
     outitem = localize('access1')+'\n'+GetFrame(fr).document.location+'\n'; 
	}
	else {
	outitem = localize('access1');
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