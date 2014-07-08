
// Developed By Sofia Celic Dec 2004
function main()
{
    var mmr="";
    var poot="";
function results_window(files)
{
    var m,n
   
        try
        {
            mmr=window.open("about:blank","multimedia_results");
            mmr.document.open();
        }
        catch(e)
        {
            if (mmr)
            {
                alert(localize('errortxt5'));
                mmr.close();
                return;
            }
            else
            {
                alert(localize('errortxt1'));
                return;
            }
        }
        mmr.document.writeln('<!DOCTYPE html><html lang=\"en\"><title>'+localize('down0')+'</title><style>body{font-size:1em;font-family:\"Calibri\",\"sans-serif\";}</style><body><a href=\"javascript:window.close();\">'+localize('docp2')+'</a>');
        if (!mmr.document.open)
        {
            alert();
            return;
        }
        mmr.document.writeln("<h1>"+localize('down1')+"'"+WAT.document.title+"'</h1><hr />");
        mmr.document.writeln("<h2>"+localize('down2')+"</h2>");
        if(files.length!=0)
        {
            for(m=0;m<files.length;m++)
            {
                mmr.document.writeln("<h3>"+localize('down5')+"" +files[m][0]+ "</h3>");
                mmr.document.writeln("<ul>");
                for(n=1;n<files[m].length;n++)
                if (files[m][n].getAttribute('title'))
                {
                    mmr.document.writeln("<li>"+files[m][n].outerHTML+" ["+localize('linklist2')+files[m][n].title+"]</li>");
                }
                else
                {
                    mmr.document.writeln("<li>");
                    if (files[m][n].childNodes[0].alt)
                    {
                        mmr.document.writeln("["+localize('down3')+""+files[m][n].childNodes[0].alt+"]");
                    }
                    mmr.document.writeln(files[m][n].outerHTML+"</li>");
                }
                mmr.document.writeln("</ul>");
            }
        }
        mmr.document.writeln("</body></html>");
        mmr.document.close();
        return true;
    }

function links_to_mm(mm_arr)
{
    mm_files=new Array('.exe','.txt','.ppt','.rtf','.xls','.zip','.pdf','.doc','.swf','.wav','.ra','.rm','.ram','.rpm','.mp3','.mp4','.m3u','.mid','.midi','.mpg','.mpeg','.avi','.mov','.wma','.wmv','.asf','.qt','.chm','.tar','.gz','.lit','.pdb','.css','.js','.brf');
    var t=WAT.document.getElementsByTagName('a');
    var j,i;
    for(i=0;i<mm_files.length;i++)
    {
        for(j=0;j<t.length;j++)
        {
            if(t[j].getAttribute('href'))
            {
                href_url=t[j].href.toLowerCase();
                href_url=href_url.slice(href_url.lastIndexOf('/'));
                href_url=href_url.slice(href_url.lastIndexOf('.'));
                if(href_url.indexOf(mm_files[i])>=0)
                {
                    if(mm_arr.length==0)
                    {
                        first_array=new Array();
                        first_array[0]=mm_files[i];
                        first_array[1]=t[j];
                        mm_arr[0]=first_array;
                    }
                    else
                    {
                        var item_place=mm_arr.length;
                        for(k=0;k<mm_arr.length;k++)
                        {
                            if(mm_arr[k][0]==mm_files[i])
                            {
                                item_place=k;
                                break;
                            }
                        }
                        if(item_place==mm_arr.length)
                        {
                            new_arr=new Array();
                            new_arr[0]=mm_files[i];
                            mm_arr.push(new_arr);
                        }
                        mm_arr[item_place].push(t[j]);
                    }
                }
            }
        }
    }
    return mm_arr;
}
function start()
{
    try
    {
        var frm=WAT.document.getElementsByTagName('frame');
        if (frm.length>0)
        {
            alert(localize('errortxt5'));
            return;
        }
        mm_all_mm_links=new Array();
        mm_all_mm_links=links_to_mm(mm_all_mm_links);
        if(mm_all_mm_links==0)
        {
            alert(localize('down4'));
        }
        else
        {
            results_window(mm_all_mm_links);
        }
    }
    catch(e)
    {
    }
}
start();
}

