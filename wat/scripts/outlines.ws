

function main(){


var outitem;
var outitemtext='';
output= new Array();

for(fr = 0; fr <f_length; fr++){var z=0
var loc = GetFrame(fr).document.location;
var la1='<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="'+localize('doclang')+'" lang="'+localize('doclang')+'"><head><title>'+localize('headst1')+'</title><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /><body>';
var la2 ='<a href=\"javascript:window.close();\">'+localize('common1')+'</a>';
var la2a ='<a href=\"'+loc+'\">'+localize('common3')+'</a>';
var la3 ='<hr /><div style="font:x-small verdana;border:2px solid #ffefd5"><strong>'+localize('headst2')+'</li></ol></div>';



var doctitle = '<h1 style="font:medium verdana">'+localize('common2')+' '+GetFrame(fr).document.title+'</h1>'

 var z=0,  style1="<strong '+localize('style1')+'>";
 t=GetFrame(fr).document.getElementsByTagName('*');
    for(i=0;i<t.length;i++)
    {
 if(t[i].tagName.toLowerCase()=='h6'||t[i].tagName.toLowerCase()=='h5'||t[i].tagName.toLowerCase()=='h4'||t[i].tagName.toLowerCase()=='h3'||t[i].tagName.toLowerCase()=='h2'||t[i].tagName.toLowerCase()=='h1'){
	    var h=t[i].innerHTML;
        doctitle+='<div style="margin-left:'+(t[i].tagName.slice(1,2)*4)+'0px;font:medium verdana\"><span style=\"color: #000080;\"><'+t[i].tagName+' style="\font:medium verdana\">&lt;'+t[i].tagName+'&gt;</span>'
		 doctitle+=h;
		doctitle+='<span style=\"color:#000080;\">&lt;/'+t[i].tagName+'&gt;</span></'+t[i].tagName+'></div></body></html>';
    
      if(h!='')
        void(z=z+1);}
    }


if(z==0){
 if (f_length>1){
     outitem = localize('head1')+'\n'+GetFrame(fr).document.location+'\n'; 
	}
	else {
	outitem = localize('head3');
	}
	output.push(outitem);
	 }

else{

if (typeof document.body.style.maxHeight=="undefined") {
  	WAT.document.write(la1+la2a+la3+doctitle);
	
} 
	else {
try{
var lw=window.open('about:blank','lw');
		lw.document.open();}
		catch(e) {
		if (lw){
		lw.close();
		WAT.document.write(la1+la2a+la3+doctitle);

return;
		}
		else{
		//alert(localize('errortxt1'));
		WAT.document.write(la1+la2a+la3+doctitle);
return;
}
}

lw.document.write(la1+la2+la3+doctitle);
var cssLink = lw.document.createElement('STYLE');
cssLink.setAttribute('id', 'poot');
lw.document.getElementsByTagName('head')[0].appendChild(cssLink);
lw.document.all.poot.innerHTML=localize('style3');
lw.document.close();
}}
}
if(output.length>0){ 
  for(x in output){
outitemtext+=output[x]
}
}
if(output.length>0) {
alert(outitemtext);}
}
