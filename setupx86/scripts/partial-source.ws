function main()
{ 

try{
    q=(f_length?'':document.selection.createRange().htmlText);
    for(i=0;i<f_length;i++)
    {
        q=GetFrame(i).document.selection.createRange().htmlText;
		//alert(q);
        if(q!='')break;
    }
    if(q)t=(q);
    s=(q.replace(/</gi,'&lt;').replace(/>/gi,'&gt;').replace(/\\n/gi,'<br />\\n'));
   
	
	out1='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xml:lang="'+localize('doclang')+'" lang="'+localize('doclang')+'" xmlns="http://www.w3.org/1999/xhtml"><head><title>'+localize('part1')+' '+WAT.document.location+'</title><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body  style="font:normal 1em arial;">';

out1b ='<a href=\"'+WAT.document.location+'\">'+localize('common3')+'</a><hr />';

out2='<span style="font-size:.8em"><a href="javascript:window.close();">'+localize('docp2')+'</a></span><hr />'

out3='<h1>'+localize('part2')+'</h1><div style="border:1px solid #000;padding:1em">'+t+'</div><h2>'+localize('part3')+'</h2><pre style="background-color:#f5f5dc;border:1px solid #000;padding:1em;word-wrap: break-word;">'+s+'</pre></body></html>';
   
  
  if (typeof document.body.style.maxHeight=="undefined") {
 WAT.document.write(out1+out1b+out3);
	
	
} 
	else {
  
   try{
    var m=window.open('about:blank', 'm','');
		m.document.open();}
		catch(e) {
		if (m){m.close();
		
		WAT.document.write(out1+out1b+out3);

return;
		}
		else{
		
WAT.document.write(out1+out1b+out3);
return;
}
} 

   
	
	m.document.write(out1+out2+out3)
	
	m.document.close()
	
	}}
	catch(e){alert(e.message)}
}