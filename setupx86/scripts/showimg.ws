
function main(){

var outitem =0;
var outitemtext=''
output= new Array();


for(fr = 0; fr <f_length; fr++){
var z=0;
var tag=new Array('img');
for(n=0;n<tag.length;n++){
t=GetFrame(fr).document.getElementsByTagName(tag[n]);
for(i=0;i<t.length;i++){
{
var l;
try {
if(t[i].attributes.alt.specified==true){l='alt=\"'+t[i].alt+'\"'};
//alert(t[i].attributes.alt.specified);
else {l='<strong style=\"color:#ff0000\">'+localize('show_img1')+'</strong>';z=z+1;};

}

catch(e){l='<strong style=\"color:#ff0000\">'+localize('show_img1')+'</strong>';z=z+1;}


}
h=t[i].outerHTML;
t[i].outerHTML='<strong style=\"'+localize('style6')+'\">'+l+' </strong> '+h;

t[i].style.padding='3px',t[i].style.border='2px dotted #b22222';

}
}

if(z>0){
if (f_length>0){
outitem = GetFrame(fr).document.location+'\n '+z+' '+localize('show_img2')+'\n ';
output.push(outitem);
}
else
{alert(z+' '+localize('show_img2'))}
}
}
for(x in output){
outitemtext+=output[x]

}
if(output.length!=0) {
alert(outitemtext);}
window.$=null;
window.jQuery=null;
}