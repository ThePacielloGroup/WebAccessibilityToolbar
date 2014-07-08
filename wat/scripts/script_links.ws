


function main(){



    function cE(a)
    {
        var a2 = [];
        for (var k = 0; k < a.length; ++k) {
            a2.push(a[k]);
            }
        return a2;
    }

    function linktextCB2(node, ifun, ldata)
    {
        function ns(nxi)
        {
            var str = "";

            var nx = nxi;
            while (nx != null)
            {
                if (nx.tagName == "IMG")
                {
                    if ( ifun != null )
                    {
                        str += ifun(nx);
                    }
                    else
                    {
                        str += (nx.hasAttribute("ALT") ? nx.alt : nx.src);
                    }
                }
                else if (nx.data != null
                    && nx.nodeType != 8 // COMMENT_NODE
                    && nx.parentNode.tagName != "SCRIPT")
                {
                    str += nx.data;
                    if (ldata != null) {ldata.length += nx.data;}
                }
                str += ns(nx.firstChild);
                nx = nx.nextSibling;
            }
            return str;
        }

        if (node.href == null || node.href.length == 0) {return null;}
        var nx = ns(node.firstChild);
        return nx.replace( /\s+/mg, " ").replace( /^\s/, "" ).replace( /\s+$/, "" );
    }

    function hasAttribute(e, a)
    {
        return e.hasAttribute(a);
    }

    var rp = 0;


    var js_count = 0;
    var nulltg_count = 0;
	 var target_count = 0;

    function eD(dt) {
        var c = cE( dt.getElementsByTagName( "A" ) );
        for (var k = 0; k < c.length; ++k) {
            var l = c[k];
            if (/^javascript:/i.test(l.href))
            {l.innerHTML+="<img src=\"res://" + scriptpath + "Resources.dll/script.png\" alt='"+localize('slink1')+"["+l.href+"], "+localize('slink2')+"' border='0'>"
                 l.style.border = "2px solid #ff0000";
               l.style.display = "inline-block";
				
                ++js_count;
                ++rp;
            }
            if ((/#$/i.test(l.href)&&l.onclick)||(/window\.open|popup|window/i.test(l.onclick))||(/window\.open/i.test(l.href))) //&&(l.href.length<2)
            {
			l.innerHTML+="<img src=\"res://" + scriptpath + "Resources.dll/warning1.gif\" alt='"+localize('slink2')+"' border='0'>"
                l.style.border = "2px solid #ff0000";
                l.style.display = "inline-block";
				++nulltg_count;
                ++rp;
            }
			
			  //if ((l.target)&&(l.target!="_top"||l.target!="_self"))
			  if ((l.target)&&(l.target!="_top"))
            {
			if ((l.target)&&(l.target!="_self")){
                //l.innerHTML+=" [target="+l.target+"] "
				l.innerHTML+="<img src=\"res://" + scriptpath + "Resources.dll/target.gif\" alt='"+localize('slink2')+" [target="+l.target+"]' border='0'>";
				l.style.border = "2px solid #ff0000";
				l.style.display = "inline-block";
                ++target_count;
                ++rp;
            }
			}
			
        }
    }


    function ifs_( fs )
    {
        for (var i = 0; i < fs.length; ++i)
        {
            try {
                dI_(fs[i].contentDocument, fs[i]); // recursive call
            }
            catch (e) {
                alert(e || "Unspecified error");
            }
        }
    }

    // "dI" == "documentIterator"
    function dI_(dt, f) {
        if (dt == null) {return;}
        eD(dt, f);
        ifs_( dt.getElementsByTagName("FRAME") );
        ifs_( dt.getElementsByTagName("IFRAME") );
    }

    // iterate through all documents
    dI_(document, null);

        var st = "";
        if ( rp > 0 )
        {
            st += localize('slink3')+ js_count+"\n";
            st += localize('slink4')+"*: " + nulltg_count+"\n";
			st += localize('slink5')+"**: " + target_count+"\n\n";
			st += "*"+localize('slink6')+"\n";
			st += localize('slink6a')+"\n";
st += "**"+localize('slink7');
        }
        else
        {
            st = localize('slink8');
        }

      watOutput(st);
	
}



