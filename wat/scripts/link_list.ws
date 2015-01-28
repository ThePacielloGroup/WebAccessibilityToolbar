
function main() {
	var frm=document.getElementsByTagName('frame');
	if (frm.length>0)
	{
		alert(localize('errortxt3'));
		return;
	}
	window.onerror = null;
	var filesize = 0;
	var ps = "\n\n<h1 style=\"margin:0px;\">"+localize('linklist1')+"</h1>";
	ps += "\n<div><span style=\"font-size:.8em\"><a href=\"javascript:window.close();\"> ";
	ps +=localize('docp2')+"</a></span></div><hr />";

	// TITLE
	pagetitle = ((window.document.title)? window.document.title : '(untitled)');
	ps += "<p><strong>"+localize('linklist2')+"</strong>";
	ps += pagetitle + "</p>";

	// SOURCE
	ps += "<p><strong>"+localize('imgl5')+"</strong>" + window.location.href + "</p><p><strong>"+localize('docp9')+"</strong>" + window.document.links.length + "</p>";



	//LINKS
	if (window.document.links.length > 0) {
		var s= "";
			for (i=0; i < window.document.links.length; i++)
			{ var lk=WAT.document.links[i]; var lt= (lk.title?lk.title:'&nbsp;'),ltar =(lk.target?lk.target:'&nbsp;');
			s+="<tr>"; 
			if(lk.tagName=='AREA')
			{
			s+="<td>"+(i+1)+". "+lk.alt+localize('linklist3')+"</td>";
			}
			else
			{
			s+="<td>"+(i+1)+". "+lk.innerHTML+"</td>";
			}
			s+="<td><a href="+lk.href+">"+lk.href+"</a></td>";
			s+="<td>"+lt+"</td>";
			s+="<td>"+ltar+"</td></tr>";}
			s="<table><tr><th>"+localize('linklist4')+"</th><th>"+localize('linklist5')+"</th><th>"+localize('linklist6')+"</th><th>target</th></tr>"+s+"";
		}
		s += "\n</table>";
	//}
	

	

	// OUPTPUT
	//var w=window.open("about:blank","w");
	//try{
	if (WAT.IsPMProcess==1 && WAT.IsEPMProcess==1) {
		var d=WAT.ResultWnd();
	}else{
		var d=WAT.CreateNewWnd();
	}
	
		d.open();
		d.write("<html><title>"+localize('linklist1')+"</title><style><!--\n*{font-family:sans-serif;}\nh1{font-size:1.4em;color:#333;}");
		d.write("\nli{margin-top:6px;}");
		d.write("\nth{text-align:left;}");
		d.write("\nbody{font-size:1em;background:#ffffff;}\n.a{color:#009;}\n.b{color:#900;}\ntable,td, th {margin:10px;border:1px solid gray;border-collapse : collapse;border-spacing : 0px;padding:2px;}p{margin-top:5px;margin-bottom:5px;}--></style>");
		d.write("\n</head><body onload=\"if(document.images.length>0){(function(){var altc;function to(c){var a,k;altc=0;a=new Array;for(k=0;k<c.length;++k)a[k]=c[k];return a;}var im,img,xt;im=to(document.images);for(var i=0;i<im.length;++i){img=im[i];e=document.createElement('p');e.style.color='#00008b';e.style.border='1px solid #000080';e.style.background='#f5deb3';if(img.attributes.alt.specified!=true){altc+=1;xt=document.createTextNode('no alt')}else{xt=document.createTextNode('alt='+img.alt+'')}e.appendChild(xt);img.parentNode.appendChild(e);}})()};\">");
		d.write("<div align=\"left\">"+ps + s + "\n\n</div></body></html>");
		d.close();

	



}


