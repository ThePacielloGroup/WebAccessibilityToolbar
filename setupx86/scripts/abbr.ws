
function main(){ 
var outitem;
var outitemtext='';
output= new Array();
for(fr = 0; fr <f_length; fr++){
try {
var z=0,
tag= new Array('acronym','abbr');
for(n=0;n<tag.length;n++)
{
t=GetFrame(fr).document.getElementsByTagName(tag[n]); 
{
for(i=0;i<t.length;i++)
{ 
h=t[i].outerHTML;
if (t[i].title!=''){
t[i].outerHTML='<span style=\"'+localize('style6')+'\"><strong> '+tag[n]+' title=\"'+t[i].title+'\" </strong></span> '+h;
}
else {
t[i].outerHTML='<span style=\"'+localize('style6')+'\"><strong> '+tag[n]+'</strong></span> '+h;
}

if (h!='')z=z+1;
}
}
}
if(z==0) {
 if (f_length>1){
     outitem = localize('abbr1')+'\n'+GetFrame(fr).document.location+'\n'; 
	}
	else {
	outitem = localize('abbr1');
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

