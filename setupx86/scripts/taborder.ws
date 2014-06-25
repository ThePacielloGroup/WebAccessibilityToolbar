

function main(){

var outitem;
var outitemtext='';
output= new Array();
for(fr = 0; fr <f_length; fr++){
try {
var b=0;
t=GetFrame(fr).document.body.getElementsByTagName('*');
{
  for(i=0;i<t.length;i++){
    if(t[i].tagName.toLowerCase()=='a'&&t[i].innerHTML!=''||t[i].tagName.toLowerCase()=='iframe'||t[i].tagName.toLowerCase()=='object'||(t[i].tagName.toLowerCase()=='input'&&t[i].type!='hidden')||t[i].tagName.toLowerCase()=='textarea'||t[i].tagName.toLowerCase()=='select'||t[i].tagName.toLowerCase()=='summary'||t[i].tagName.toLowerCase()=='button'||(t[i].tagName.toLowerCase()=='img'&&t[i].useMap)){
   
   if (t[i].tabIndex) {
   if (t[i].tabIndex>b||t[i].tabIndex==b){
   b=t[i].tabIndex;
   }
	  
      t[i].insertAdjacentHTML("AfterEnd","<span style=\""+localize('style6')+"\"><strong>[tabindex] "+t[i].tabIndex+"</strong></span>");
    t[i].style.border='1px dotted #b22222';
	}
	 
	
  }
  }
  
   for(i=0;i<t.length;i++){
    if((t[i].tagName.toLowerCase()=='a'&&(t[i].innerHTML!=''||t[i].href!='')||t[i].tagName.toLowerCase()=='iframe'||t[i].tagName.toLowerCase()=='object'||(t[i].tagName.toLowerCase()=='input'&&t[i].type!='hidden')||t[i].tagName.toLowerCase()=='textarea'||t[i].tagName.toLowerCase()=='select'||t[i].tagName.toLowerCase()=='summary'||t[i].tagName.toLowerCase()=='button'||(t[i].tagName.toLowerCase()=='img'&&t[i].useMap))&&!t[i].tabIndex){
   
 
	b+=1;
      t[i].insertAdjacentHTML("AfterEnd","<span style=\""+localize('style6')+"\"><strong>"+b+"</strong></span>");
     t[i].style.border='1px dotted #b22222';
	;
	if (t[i].parentNode.style.display=='none'){
	t[i].parentNode.style.display='block'
	//alert(t[i].parentNode.tagName)
	}
	}
	
  }
}
if(b==0) {
 if (f_length>1){
     outitem = localize('tab1')+'\n'+GetFrame(fr).document.location+'\n'; 
	}
	else {
	outitem = localize('tab1');
	}
	output.push(outitem);
	 }
	 }

catch(e){alert(localize('errortxt5'))}
}
if(output.length>0){ 
  for(x in output){
outitemtext+=output[x]
}
}
if(output.length>0) {
watOutput(outitemtext);}
}


