
function main()
{
    
    for(fr = 0; fr <f_length; fr++)
    {
        if(!'push' in [])
        Array.prototype.push=function()
        {
            var i=0,b=this.length,a=arguments;
            for(i;i<a.length;i++)
            this[b+i]=a[i];
            return this.length;
        }
        var d=(GetFrame(fr).document.getElementsByTagName&&GetFrame(fr).document.getElementsByTagName('*'))||GetFrame(fr).document.all,images=
        {
            raw:
            {
                cssBg:[],attrBg:[],input:[],lsi:[]
            }
            ,sorted:
            {
            }
        }
        ,i=0,r='',ud='undefined',re=[/\i*url\i*\i/,/\i$/],x=screen.availWidth/1.2,y=screen.availHeight/1.2,j,k,l,n,p,t,z,u,v,c=0;
        l=(1.2*x-x)/2;
        p=(1.2*y-y)/2;
function li(a)
{
    var j,l,k=a.childNodes,i=0,r='<dl>';
    l=k.length;
    for(;i<l;i++)
    if('tagName' in k[i]&&k[i].tagName=='LI')
    {
        r+='<dt>&lt;li';
        for(j=0;j<k[i].attributes.length;j++)
        if(typeof k[i].attributes[j].specified!=ud?k[i].attributes[j].specified:1)
        r+=' '+k[i].attributes[j].name+'="'+(k[i].attributes[j].value!='null'||k[i].attributes[j].name!='style'?k[i].attributes[j].value:k[i].style.cssText)+'"';
        r+='&gt;</dt>';
    }
    return r+'</dl>';
}
images.raw.img=GetFrame(fr).document.getElementsByTagName('img');
images.raw.object=GetFrame(fr).document.getElementsByTagName('object');
t=GetFrame(fr).document.getElementsByTagName('input');
for(;i<t.length;i++)
if(t[i].type=='image')
images.raw.input.push(t[i]);
for(i=0;i<d.length;i++)
{
    if(typeof d[i].tagName!=ud&&d[i].tagName!='!'&&typeof d[i].attributes!=ud&&typeof d[i].attributes.background!=ud&&(typeof d[i].attributes.background.specified!=ud?d[i].attributes.background.specified:d[i].attributes.background!=''))
    images.raw.attrBg.push(d[i]);
    if(d[i].style.backgroundImage!='')
    images.raw.cssBg.push(d[i]);
    if(d[i].style.listStyleImage!='')
    images.raw.lsi.push(d[i]);
}
for(i=0;i<images.raw.img.length;i++)
switch(typeof images.sorted[images.raw.img[i].src])
{
    case 'object':images.sorted[images.raw.img[i].src].push([0,images.raw.img[i]]);
    break;
    default:images.sorted[images.raw.img[i].src]=[[0,images.raw.img[i]]]
}
for(i=0;i<images.raw.input.length;i++)
switch(typeof images.sorted[images.raw.input[i].src])
{
    case 'object':images.sorted[images.raw.input[i].src].push([1,images.raw.input[i]]);
    break;
    default:images.sorted[images.raw.input[i].src]=[[1,images.raw.input[i]]]
}
for(i=0;i<images.raw.object.length;i++)
switch(typeof images.sorted[images.raw.object[i].data])
{
    case 'object':images.sorted[images.raw.object[i].data].push([2,images.raw.object[i]]);
    break;
    default:images.sorted[images.raw.object[i].data]=[[2,images.raw.object[i]]]
}
for(i=0;i<images.raw.attrBg.length;i++)
switch(typeof images.sorted[images.raw.attrBg[i].background])
{
    case 'object':images.sorted[images.raw.attrBg[i].background].push([3,images.raw.attrBg[i]]);
    break;
    default:images.sorted[images.raw.attrBg[i].background]=[[3,images.raw.attrBg[i]]]
}
for(i=0;i<images.raw.cssBg.length;i++)
{
    n=(images.raw.cssBg[i].style.backgroundImage).replace(re[0],'').replace(re[1],'');
    switch(typeof images.sorted[n])
    {
        case 'object':images.sorted[n].push([4,images.raw.cssBg[i]]);
        break;
        default:images.sorted[n]=[[4,images.raw.cssBg[i]]]
    }
}
for(i=0;i<images.raw.lsi.length;i++)
{
    n=(images.raw.lsi[i].style.listStyleImage).replace(re[0],'').replace(re[1],'');
    switch(typeof images.sorted[n])
    {
        case 'object':images.sorted[n].push([5,images.raw.lsi[i]]);
        break;
        default:images.sorted[n]=[[5,images.raw.lsi[i]]]
    }
}
for(i in images.sorted)
{
    if(i=='push')
    continue;
    (t=new Array()).src=i;
    z=0;
    for(j=0;j<images.sorted[i].length;j++)
    {
        if(images.sorted[i][j][0]<5)
        z++;
        else
        {
            v=(u=images.sorted[i][j][1].childNodes).length;
            for(k=0;k<v;k++)
            if('tagName' in u[k]&&u[k].tagName=='LI')
            z++;
        }
    }
	
	var pp =i;
	
if (pp.indexOf('url(/')!=-1) {
pp=pp.slice(5,(pp.length-1))


}

	


r+='<dt style="border-top:2px solid #a9a9a9;padding-top:0.5em;margin-top:1em"><ul>';

    
    v=images.sorted[i].length;
    for(j=0;j<1;j++)
    {
	 u=images.sorted[i][j];
	r+='<li><a href=\"'+pp+'\"><img src=\"'+pp+'\" alt=\"'+localize('imgl1')+' '+u[1].nameProp+'\" /></a> ('+z+' '+ localize('imgl2')+'.)</li><li>width:'+u[1].width+'px&nbsp;&nbsp; height:'+u[1].height+'px</li>'
       
        if (isNaN(u[1].fileSize))
        {
            r+='</ul>'
        }
        else
        {
            r+='<li>'+localize('docp7')+(parseInt((parseInt(u[1].fileSize)) /10.24)/100)+localize('docp8')+'</li></ul>';
        }
        r+=' <div style="border :1px solid #191970;padding:5px;margin:5px">&lt;'+ String(u[1].tagName).toLowerCase();
        for(k=0;k<u[1].attributes.length;k++)
        if(typeof u[1].attributes[k].specified!=ud?u[1].attributes[k].specified:1)
        r+=' '+u[1].attributes[k].name+'="'+(u[1].attributes[k].value!='null'||u[1].attributes[k].name!='style'?u[1].attributes[k].value:u[1].style.cssText)+'"';
        r+='&gt;</div>';
    }
    for(j=1;j<v;j++)
    {
        u=images.sorted[i][j];
        r+=' <div style="border :1px solid #191970;padding:5px;margin:5px">&lt;'+ String(u[1].tagName).toLowerCase();
        for(k=0;k<u[1].attributes.length;k++)
        if(typeof u[1].attributes[k].specified!=ud?u[1].attributes[k].specified:1)
        r+=' '+u[1].attributes[k].name+'="'+(u[1].attributes[k].value!='null'||u[1].attributes[k].name!='style'?u[1].attributes[k].value:u[1].style.cssText)+'"';
        r+='&gt;</div>';
    }
    c++;
}

var loc = GetFrame(fr).document.location;
var out1='<html><title>'+localize('imgl3')+'"'+GetFrame(fr).document.title+'" ('+loc+')</title></head><body>';
var out2 ='<a href=\"javascript:window.close();\">'+localize('common1')+'</a>';
var out2a ='<a href=\"'+loc+'\">'+localize('common3')+'</a>';
var out3='<h1>'+localize('imgl4')+'</h1><h2 style=\'display:inline\'>'+localize('imgl5')+GetFrame(fr).document.title+' </h2> (<a href="'+loc+'">'+loc+'</a>)<dl>'+r+'</dl><div class="author">'+localize('imgl6')+'<a href="http://liorean.web-graphics.com/">Liorean</a>\'s Graphics Info Bookmarklet</div></body></html>'

if (typeof document.body.style.maxHeight=="undefined") {
   WAT.document.write(out1+out2a+out3);
var cssLink = WAT.document.createElement('STYLE');
cssLink.setAttribute('id', 'poot');
WAT.document.getElementsByTagName('head')[0].appendChild(cssLink);
WAT.document.all.poot.innerHTML=localize('style8');
	
} 
	else {
try
{d=window.open('about:blank','');
    d.document.open();
	
}
catch(e)
{
    if (d)
    {
        d.close();
       // alert(localize('errortxt5'));
	  WAT.document.write(out1+out2a+out3);
var cssLink = WAT.document.createElement('STYLE');
cssLink.setAttribute('id', 'poot');
WAT.document.getElementsByTagName('head')[0].appendChild(cssLink);
WAT.document.all.poot.innerHTML=localize('style8');
        return;
    }
    else
    {
        //alert(localize('errortxt1'));
		WAT.document.write(out1+out2a+out3);
var cssLink = WAT.document.createElement('STYLE');
cssLink.setAttribute('id', 'poot');
WAT.document.getElementsByTagName('head')[0].appendChild(cssLink);
WAT.document.all.poot.innerHTML=localize('style8');
        return;
    }
}
d.document.write(out1+out2+out3);
var cssLink = d.document.createElement('STYLE');
cssLink.setAttribute('id', 'poot');
d.document.getElementsByTagName('head')[0].appendChild(cssLink);
d.document.all.poot.innerHTML=localize('style8');
d.document.close();
}
}
}