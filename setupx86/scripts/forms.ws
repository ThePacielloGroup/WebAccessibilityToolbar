

function main(){

var outitem =0;
var outitemtext=''
output= new Array();

for(fr = 0; fr <f_length; fr++){
//try{
 var spn='<span style=\"'+localize('style6')+'\">';
var z=0,tag=new Array('fieldset','legend','label','input','select','textarea','form'),taga=new Array('fieldset','legend','label');
for(n=0;n<tag.length;n++){
  ta=GetFrame(fr).document.getElementsByTagName(taga[n]);
  t=GetFrame(fr).document.getElementsByTagName(tag[n]); 
  z+=ta.length;
  {
    for(i=0;i<t.length;i++){
      var la='';
	  if(tag[n]=='fieldset'||tag[n]=='legend'||tag[n]=='form')
       { la=' '+tag[n]+'';}
	  if(t[i].id!=''&&(tag[n]=='input'||tag[n]=='select'||tag[n]=='textarea'))
      {  la='&nbsp;id=\"'+t[i].id+'\"&nbsp;';}
      if(t[i].htmlFor!=''&&tag[n]=='label')
       { la=' '+tag[n]+' for=\"'+t[i].htmlFor+'\"';}
      if(t[i].htmlFor==''&&tag[n]=='label')
       { la=spn+' '+tag[n]+'<strong style=\"color:#ff0000;\"> '+localize('common4')+' for!</strong> ';}
      var h=t[i].outerHTML;
	  if(tag[n]=='fieldset'||tag[n]=='input'||tag[n]=='select'||tag[n]=='textarea'||tag[n]=='legend'||tag[n]=='form'||tag[n]=='label')
    { 
	try {
	//alert (t[i].type);
	if (t[i].type!='hidden'){
	t[i].outerHTML=spn+''+la+'</span>'+h;
	}
	}
	
	catch(e) {return;}
     }
	 
	if(tag[n]=='label')
    { t[i].style.border='1px solid #000000';t[i].style.padding='2px';t[i].style.background='#ffffff'

     } 
	  
	  
	  if(tag[n]=='fieldset'||tag[n]=='legend'){
	  t[i].style.border='2px dotted #4682b4';
	  }
	  
	  if(tag[n]=='form')
    { 
      t[i].style.border='2px dotted blue',t[i].style.padding='3px';}
      
    }
	
  }
}
if(z==0){
 if (f_length>0){

outitem = GetFrame(fr).document.location+'\n'+localize('label1')+'\n';
output.push(outitem);
}
else
{alert(localize('label1'))}

}

//}
//catch(e){alert(localize('errortxt5')+"\n "+e.description)}
}
for(x in output){
outitemtext+=output[x]

}
if(output.length!=0) {
alert(outitemtext);}


}



