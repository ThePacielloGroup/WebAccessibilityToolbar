

function main() {
var intwidth;
var intheight;
intwidth=window.prompt(localize('custom_size1'),'');
intheight=window.prompt(localize('custom_size2'),'');
intwidth=parseInt(intwidth);
intheight=parseInt(intheight);
if(intwidth>0&&intheight>0){window.resizeTo(intwidth,intheight);}
else{window.alert(localize('custom_size3'));

}
}