

function main(){
	//first check page for frames
	var frm=document.getElementsByTagName('frame');
	if (frm.length>0)
	{
		alert(localize('errortxt3'));
		return;
	}


//alert(document.nameProp);
var s='',l='',p='';
var loc = WAT.document.location;
var out1='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xml:lang="'+localize('doclang')+'" lang="'+localize('doclang')+'" xmlns="http://www.w3.org/1999/xhtml"><title>'+localize('meta1')+'</title><style type="text/css">h1,h2 {font:1.4em arial;}table,td, th {margin:10px;border:1px solid gray;border-collapse : collapse;border-spacing : 0px;padding:2px;} body{font:1em arial;}caption{font-weight:bold;text-align:left;}</style></head><body>';
var out2 ='<a href=\"javascript:window.close();\">'+localize('common1')+'</a>';
var out2a ='<a href=\"'+loc+'\">'+localize('common3')+'</a>';
p='<hr />';

if (document.title) 
{

p= p+'<p style="font:1em arial;"><strong>URL: </strong>'+document.location.href+'</p><h1>Title: '+document.title+'</h1>'

}

else {
p= p+'<p style="font:.8em arial;"><strong>URL: </strong>'+document.location.href+'</p><h1>No Title</h1>'
}

var mt=document.getElementsByTagName('meta');
if (mt.length>0) {
for(i=0;i<mt.length;i++){
  s=s+'<tr valign=top>';
  s=s+'<td>'+mt[i].name+'&nbsp;</td>';
  s=s+'<td>'+mt[i].content+'</td>';
  s=s+'<td>'+mt[i].httpEquiv+'&nbsp;</td>';
  s=s+'</tr>';
}
s='<br /><table><caption>'+localize('meta2')+'</caption><tr><th>name</th><th>'+localize('meta6')+'</th><th>HttpEquiv</th></tr>'+s+'</table>';
}

else {
s="<h2>"+localize('meta3')+"</h2>"
}


var lt=document.getElementsByTagName('link');
if (lt.length>0) {
for(i=0;i<lt.length;i++)
{l=l+'<tr valign=top><td>'+lt[i].rel+'&nbsp;</td><td>'+lt[i].href+'</td><td>'+lt[i].type+'&nbsp;</td><td>'+lt[i].title+'&nbsp;</td></tr>';}
l='<br /><br /><table><caption>'+localize('meta4')+'</caption><tr><th>rel</th><th>Href</th><th>type</th><th>title</th></tr>'+l+'</table>';
}

else 
{
l="<h2>"+localize('meta5')+"</h2>"
}

l=l+"</body></html>"


try
{
var m=window.open('about:blank','');
m.document.open();
m.document.write(out1+out2+p+s+l);
m.document.close();
}
catch(e) {
			if(e.message.toLowerCase().indexOf('object required')>=0) 
			{
				//alert(localize('errortxt1'));
				WAT.document.write(out1+out2a+p+s+l);
				return;
			}
			else if(e.message.toLowerCase().indexOf('access is denied')>=0) 
			{
				if(!m.closed) m.close();
				WAT.document.write(out1+out2a+p+s+l);
				//alert(localize('errortxt4'));
				return;
			


}
}
}



