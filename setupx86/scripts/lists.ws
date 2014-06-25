

function main(){

var outitem;
var outitemtext='';
output= new Array();

for(fr = 0; fr <f_length; fr++){

try {
var t=GetFrame(fr).document.getElementsByTagName('ol'); 
s=GetFrame(fr).document.getElementsByTagName('ul');
u=GetFrame(fr).document.getElementsByTagName('li');
v=GetFrame(fr).document.getElementsByTagName('dd');
w=GetFrame(fr).document.getElementsByTagName('dt');
z=GetFrame(fr).document.getElementsByTagName('dl');

liststyle = localize('style6');

if((t.length==0)&&(s.length==0)&&(u.length==0)&&(v.length==0)&&(w.length==0)&&(z.length==0)) {

if (f_length>1){
     outitem = localize('list1')+'\n'+GetFrame(fr).document.location+'\n'; 
	}
	else {
	outitem = localize('list1');
	}
	output.push(outitem);
	 }

else{
 for(i=0;i<t.length;i++){
 h=t[i].innerHTML;
 t[i].innerHTML='<span style=\"'+localize('style6')+'\">&lt;ol&gt; </span> '+h+'<span style=\"'+localize('style6')+'\">&lt;/ol&gt;</span>';
 }
for(i=0;i<s.length;i++){h=s[i].innerHTML;s[i].innerHTML='<span style=\"'+localize('style6')+'\">&lt;ul&gt;</span> '+h+'<span style=\"'+localize('style6')+'\">&lt;/ul&gt;</span>';}
for(i=0;i<u.length;i++){h=u[i].innerHTML;u[i].innerHTML='<span style=\"'+localize('style6')+'\">&lt;li&gt; </span>'+h+'<span style=\"'+localize('style6')+'\">&lt;/li&gt;</span>';}
for(i=0;i<v.length;i++){h=v[i].innerHTML;v[i].innerHTML='<span style=\"'+localize('style6')+'\">&lt;dd&gt; </span>'+h+'<span style=\"'+localize('style6')+'\">&lt;/dd&gt;</span>';}
for(i=0;i<w.length;i++){h=w[i].innerHTML;w[i].innerHTML='<span style=\"'+localize('style6')+'\">&lt;dt&gt; </span>'+h+'<span style=\"'+localize('style6')+'\">&lt;/dt&gt;</span>';}
for(i=0;i<z.length;i++){h=z[i].innerHTML;z[i].innerHTML='<span style=\"'+localize('style6')+'\">&lt;dl&gt; </span>'+h+'<span style=\"'+localize('style6')+'\">&lt;/dl&gt;</span>';}
}
}
catch(e){alert(localize('errortxt5')+"\n "+e.description)}
}
if(output.length>0){ 
  for(x in output){
outitemtext+=output[x]
}
}


if(outitemtext!='') {
alert(outitemtext);}
}
