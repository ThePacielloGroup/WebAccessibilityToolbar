function main(){

var testinc=0
function docprop() {

	
	window.onerror = null;
	var filesize = 0;
	var s = "\n\n<h1 style=\"margin:0px;\">"+localize('docp1')+"</h1>";
	s += "\n<div><small style=\"font-size:1em\"><a href=\"javascript:window.close();\">";
	s += ""+localize('docp2')+"</a></small></div>";
	s += "\n\n<table border=\"1\" cellpadding=\"4\" cellspacing=\"0\"";
	s += " frame=\"box\" rules=\"rows\">";

	// TITLE
	pagetitle = ((window.document.title)? window.document.title : '(untitled)');
	s += "\n\n<tr valign=\"top\">\n<th scope=\"row\">"+localize('docp0')+"</th>\n<td><strong>";
	s += pagetitle + "</strong></td>\n</tr>";

	// SOURCE
	s += "\n\n<tr valign=\"top\">\n<th scope=\"row\">"+localize('docp11')+"</th>\n<td><span>" + window.location.href + "</span></td>\n</tr>";

	// FRAMES
	if (window.parent.frames.length > 0) {
		var f = 0;
		s += "\n\n<tr valign=\"top\"><th scope=\"row\">Frames:</th>\n<td>" + window.parent.frames.length + "\n<ol>";
		for (i=0; i < window.parent.frames.length; i++) {
			if (window.parent.frames[i].location.length > 0) {
				s += "\n<li><strong><a href=\"" + window.parent.frames[i].location;
				s += "\">URL:</strong> <span>" + window.parent.frames[i].location + "</span></a></li>";
			} else {
				f++;
			}
		}
		s += "\n</ol>";
		if (f > 0) s += "\n<div>"+localize('docp3')+"</div>";
		s += "</td>\n</tr>";
	}

	// DOMAIN
	s += "\n\n<tr valign=\"top\">\n<th scope=\"row\">"+localize('docp01')+"</th>\n<td><span>" + window.document.domain + "</span>";
	s += " <small><a href=\"http://uptime.netcraft.com/up/graph?site=";
	s += window.document.domain + "\">"+localize('docp4')+"</a></small></td>\n</tr>";

	if (window.document.referrer.length > 0) {
		s += "\n\n<tr valign=\"top\">\n<th scope=\"row\">"+localize('docp02')+"</th>";
		s += "\n<td><span>" + window.document.referrer + "</span></td>\n</tr>";
	}

	// COOKIE
	if (window.document.cookie.length > 0) {
		var dacookie = window.document.cookie;
		dacookie = dacookie.replace(/; /g,";");
		dacookie = dacookie.replace(/;/g,";<br />\n");
		s += "\n\n<tr valign=\"top\">\n<th scope=\"row\">Cookie:</th>\n<td><span>" + dacookie + "</span></td>\n</tr>";
	}

	// HASH
	if (window.document.location.hash.length > 0) {
		s += "\n\n<tr valign=\"top\">\n<th scope=\"row\">"+localize('docp03')+"</th>\n<td>" + window.document.location.hash + "</td>\n</tr>";
	}

	// CHARSET
	if (window.document.charset) {
		s += "\n\n<tr valign=\"top\">\n<th scope=\"row\">"+localize('docp04')+"</th>\n<td>";
		s += ((window.document.charset)? window.document.charset : "<span style=\"background:#ccc\">&nbsp;(undefined)&nbsp;</span>") + "</td>\n</tr>";
	}

	// CREATED
	// if (window.document.fileCreatedDate) {
		// s += "\n<tr valign=\"top\">\n<th scope=\"row\">Created:</th>\n<td>";
		// s += window.document.fileCreatedDate + "</td>\n</tr>";
	// }

	// LASTMODIFIED
	if (window.document.lastModified) {
		s += "\n\n<tr valign=\"top\">\n<th scope=\"row\">"+localize('docp5')+"</th>\n<td>";
		s += ((window.document.lastModified)? window.document.lastModified : "<span style=\"background:#ccc\">&nbsp;"+localize('docp6')+"&nbsp;</span>") + "</td>\n</tr>";
	}

	// FILESIZE
	try {
	if (window.document.fileSize > 0) {
		s += "\n\n<tr valign=\"top\">\n<th scope=\"row\">"+localize('docp7')+"</th><td>";
		s += (parseInt((parseInt(window.document.fileSize))/10.24)/100) + " "+localize('docp8')+"</td>\n</tr>";
		filesize += parseInt(window.document.fileSize);
	}
	}
	catch(e){}

	// LINKS
	if (window.document.links.length > 0) {
		s += "\n\n<tr valign=\"top\">\n<th scope=\"row\">"+localize('docp9')+"</th>\n<td>" + window.document.links.length + "<ol>";
		for (i=0; i < window.document.links.length; i++) {
			s += "\n<li>"+window.document.links[i].innerHTML+" : <a href=\"" + window.document.links[i].href + "\">";
			s += " " + window.document.links[i].href + "</a></li>";
		}
		s += "\n</ol></td>\n</tr>";
	}

	// IMAGES
	if (window.document.images.length > 0) {
		s += "\n\n<tr valign=\"top\"><th scope=\"row\">"+localize('docp10')+"</th>\n<td>" + window.document.images.length + "<ol>";
		for (i=0; i < window.document.images.length; i++) {
			s += "\n<li><img src=\"" + window.document.images[i].src + "\" align=\"top\" /><br />";
			s += "\n<strong class=\"b\">"+localize('docp11')+"</strong> <span>";
			s += window.document.images[i].src + "</span><br />";
			s += "\n<strong class=\"a\">"+localize('docp12')+"</strong> ";
			s += ((window.document.images[i].attributes.alt.specified)?("\""+ window.document.images[i].alt+"\"") : "<span style=\"background:#ccc\">&nbsp;"+localize('docp13')+"&nbsp;</span>") + "<br />";
			s += "<strong>"+localize('docp16')+"</strong> ";
			if (window.document.images[i].width < 1 || window.document.images[i].height < 1) {
				s += "<span style=\"background:#ccc\">&nbsp;"+localize('docp14')+"&nbsp;</span>";
			} else {
				s += "<span>";
				if (parseInt(window.document.images[i].fileSize) >= 0) {
					s += (parseInt((parseInt(window.document.images[i].fileSize))/10.24)/100) + " KB, ";
					filesize += parseInt(window.document.images[i].fileSize);
				}
				s+= "width=" + window.document.images[i].width + ", height=" + window.document.images[i].height + "</span>";
			}
			s += ".</li>";
		}
		s += "\n</ol></td>\n</tr>";
	}

	// CSS
	if (window.document.styleSheets.length > 0) {
		s += "\n\n<tr valign=\"top\">\n<th scope=\"row\">"+localize('docp17')+"</th>\n<td>" + window.document.styleSheets.length + "\n<ol>";
		for (i=0; i < window.document.styleSheets.length; i++) {
			var t = ((window.document.styleSheets[i].href)? window.document.styleSheets[i].href : "(inline)");
			s += "\n<li>";
			if (t != "(inline)") s += "<strong><a href=\"" + window.document.styleSheets[i].href + "\">"+localize('docp11')+"</strong>";
			else s += "<strong class=\"b\">"+localize('docp11')+"</strong>";
			s += " <span>" + t + "</span></a>";
			if (navigator.userAgent.toLowerCase().indexOf("gecko")==-1) {
				s += "</br />\n<strong class=\"a\">"+localize('docp15')+"</strong> <span>";
				s += ((window.document.styleSheets[i].media)? window.document.styleSheets[i].media : "(all)");
				s += "</span>";
			}
			s += "</li>";
		}
		s += "\n</ol></td>\n</tr>";
	}

	// SCRIPTS
	if (navigator.userAgent.toLowerCase().indexOf("gecko")==-1) {
	if (window.document.scripts.length > 0) {
		s += "\n\n<tr valign=\"top\">\n<th scope=\"row\">"+localize('docp18')+"</th>\n<td><ol>";
		for (i=0; i < window.document.scripts.length; i++) {
		var cc = (window.document.scripts[i].src.indexOf("wat-c"));
			var t = ((window.document.scripts[i].src)? window.document.scripts[i].src : "(inline)");
			
			if (cc==-1){
			s += "\n<li>";
			if (t != "(inline)") s += "<strong><a href=\"" + window.document.scripts[i].src + "\">"+localize('docp11')+"</strong> <span>";
			else s += "<strong class=\"b\">"+localize('docp11')+"</strong> <span>";
			s += ((window.document.scripts[i].src)? window.document.scripts[i].src : "(inline)") + "</a></span><br />";
			s += "\n<strong class=\"a\">"+localize('docp19')+"</strong> <span>";
			s += ((window.document.scripts[i].type)? window.document.scripts[i].type : "<span style=\"background:#ccc;font-family:arial;\">&nbsp;"+localize('docp20')+"&nbsp;</span>");
			s += "</span></li>";
			}
		}
		s += "\n</ol></td>\n</tr>";
	}
	}

	// FORMS
	if (window.document.forms.length > 0) {
		s += "\n\n<tr valign=\"top\">\n<th scope=\"row\">"+localize('docp21')+"</th>\n<td>" + window.document.forms.length + "<ol>";
		for (i=0; i < window.document.forms.length; i++) {
			s += "\n<li><strong class=\"b\">"+localize('docp22')+"</strong> <span>";
			s += window.document.forms[i].action + "</span><br />";
			s += "\n<strong class=\"a\">"+localize('docp23')+"</strong> <span>";
			s += ((window.document.forms[i].name)? window.document.forms[i].name : "<span style=\"background:#ccc\">&nbsp;"+localize('docp24')+"&nbsp;</span>");
			s += "</span></li>";
		}
		s += "\n</ol></td>\n</tr>";
	}

	// DOCSIZE
	if (filesize > 0) {
		s += "<tr valign=\"top\"><th scope=\"row\">"+localize('docp25')+"</th><td><strong>"+localize('docp26')+"";
		s += (parseInt((parseInt(filesize))/10.24)/100) + " "+localize('docp8')+"</strong><br />";
		s += "<br /><small>"+localize('docp27')+"</small>";
	}

	s += "\n\n</table>";

	// OUPTPUT
	var w=window.open("about:blank","w");
	try{
	with (w.document) {
		open();
		write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><html xml:lang=\""+localize('doclang')+"\" lang=\""+localize('doclang')+"\" xmlns=\"http://www.w3.org/1999/xhtml\"><head>\n<title>"+localize('docp28'));
		write(pagetitle + "</title>");
		write("\n<style><!--\n*{font-family:arial;}\nh1{font-size:1.4em;color:#333;}");
		write("\nli{margin-top:6px;}");
		write("\nth{text-align:right;background:#f5f5dc;}\nspan{font-family:arial;font-size:93%;}");
		write("\ntd{font-size:93%;background:#ffffff;}\n.a{color:#009;}\n.b{color:#900;}\n--></style>");
		write("\n</head><body>");
		write("<div align=\"left\">" + s + "\n\n</div></body></html>");
		close();
	}}
	
	catch(e) {
		if (w){w.close();
		alert(localize('errortxt5'));

//return;
		}
		else{
		alert(localize('errortxt1'));
return;
}}
}
docprop();

}