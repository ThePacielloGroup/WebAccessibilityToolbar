
function main(){
for(fr = 0; fr <f_length; fr++){

// Developed By Sofia Celic Dec 2004

//open new window with results
function results_window(ss_els,cs_els) {
var loc=WAT.document.location;
if (typeof document.body.style.maxHeight=="undefined") 
{
WAT.document.writeln("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\""+localize('doclang')+"\" lang=\""+localize('doclang')+"\"><head><title>"+localize('map1')+"</title></head><link rel=\"Stylesheet\" href=\"http://www.wat-c.org/WAT/scripts/css/generic.css\" type=\"text/css\"><body><a href=\""+loc+"\">"+localize('common3')+"</a>");

	WAT.document.writeln("<h1>"+localize('map2')+"'"+GetFrame(fr).document.title+"'</h1><hr />");
	
	// Server-side image map specs
WAT.document.writeln("<h2>"+localize('map3')+"</h2>");
	if(ss_els.length!=0)
	{
		for(var q=0;q<ss_els.length;q++)
		{
			WAT.document.writeln("<p>"+ss_els[q]+"</p>");
		}
		WAT.document.writeln("<hr>");
	}
	else
	{
		WAT.document.writeln("<p>"+localize('map4')+"</p>");
	}
	
	// Client-side image map specs
WAT.document.writeln("<hr /><h2>"+localize('map5')+"</h2>");
	if(cs_els.length!=0)
	{						
		for(var l=0;l<cs_els.length;l++)
		{
			//first array item is the image		
			if(!cs_els[l][0].attributes.alt.specified)
			{
				WAT.document.writeln("<p>"+cs_els[l][0].outerHTML+"&nbsp;<br /><strong style=\"color:#FF0000\">"+localize('map6')+"</strong></p>");
			}
			else
			{
				WAT.document.writeln("<p>"+cs_els[l][0].outerHTML+"</p><hr />");
			}
		
			//second array item is the map opening tag
			var capsule=cs_els[l][1].outerHTML;
			capsule=capsule.slice(0,(capsule.indexOf('>')+1));
			WAT.document.writeln("<p>"+replace_brackets(capsule)+"</p>");
			
			//next array items except last are 'area' elements
			for(var m=2;m<cs_els[l].length-1;m++)
			{		
				if(!cs_els[l][m].attributes.alt.specified)
				{
					WAT.document.writeln("<p>"+replace_brackets(cs_els[l][m].outerHTML)+"<strong style=\"color:#FF0000\">"+localize('map7')+"</strong></p>");
				}
				else
				{
					WAT.document.writeln("<p>"+replace_brackets(cs_els[l][m].outerHTML)+"</p>");
				}
			}
			WAT.document.writeln("<p>"+cs_els[l][(cs_els[l].length-1)]+"</p>");
			
			//write in client-side map and area elements in code
			WAT.document.write(capsule);
			for(var m=2;m<cs_els[l].length-1;m++)
			{
				WAT.document.write(cs_els[l][m].outerHTML);
			}
			
			
			WAT.document.writeln("<hr />");
		}
	}
	else
	{
		WAT.document.writeln("<p>"+localize('map8')+"</p><hr />");
	}
	
	WAT.document.writeln("</body></html>");
	WAT.document.close();
	
} 
	else {
	try{imr=window.open("about:blank","imagemap_results");
		imr.document.open();}
		catch(e) {
		
			if(e.message.toLowerCase().indexOf('object required')>=0) 
			{
				alert(localize('errortxt1'));
				return;
			}
			else if(e.message.toLowerCase().indexOf('access is denied')>=0) 
			{
				if(!imr.closed) imr.close();
				alert(localize('errortxt4'));
				return;
			}
	}	

	imr.document.writeln("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\""+localize('doclang')+"\" lang=\""+localize('doclang')+"\"><head><title>"+localize('map1')+"</title></head><link rel=\"Stylesheet\" href=\"http://www.wat-c.org/WAT/scripts/css/generic.css\" type=\"text/css\"><body><a href=\"javascript:window.close();\">"+localize('common1')+"</a>");
	imr.document.writeln("<h1>"+localize('map2')+"'"+GetFrame(fr).document.title+"'</h1><hr />");
	
	// Server-side image map specs
	imr.document.writeln("<h2>"+localize('map3')+"</h2>");
	if(ss_els.length!=0)
	{
		for(var q=0;q<ss_els.length;q++)
		{
			imr.document.writeln("<p>"+ss_els[q]+"</p>");
		}
		imr.document.writeln("<hr>");
	}
	else
	{
		imr.document.writeln("<p>"+localize('map4')+"</p>");
	}
	
	// Client-side image map specs
	imr.document.writeln("<hr /><h2>"+localize('map5')+"</h2>");
	if(cs_els.length!=0)
	{						
		for(var l=0;l<cs_els.length;l++)
		{
			//first array item is the image		
			if(!cs_els[l][0].attributes.alt.specified)
			{
				imr.document.writeln("<p>"+cs_els[l][0].outerHTML+"&nbsp;<br /><strong style=\"color:#FF0000\">"+localize('map6')+"</strong></p>");
			}
			else
			{
				imr.document.writeln("<p>"+cs_els[l][0].outerHTML+"</p><hr />");
			}
		
			//second array item is the map opening tag
			var capsule=cs_els[l][1].outerHTML;
			capsule=capsule.slice(0,(capsule.indexOf('>')+1));
			imr.document.writeln("<p>"+replace_brackets(capsule)+"</p>");
			
			//next array items except last are 'area' elements
			for(var m=2;m<cs_els[l].length-1;m++)
			{		
				if(!cs_els[l][m].attributes.alt.specified)
				{
					imr.document.writeln("<p>"+replace_brackets(cs_els[l][m].outerHTML)+"<strong style=\"color:#FF0000\">"+localize('map7')+"</strong></p>");
				}
				else
				{
					imr.document.writeln("<p>"+replace_brackets(cs_els[l][m].outerHTML)+"</p>");
				}
			}
			imr.document.writeln("<p>"+cs_els[l][(cs_els[l].length-1)]+"</p>");
			
			//write in client-side map and area elements in code
			imr.document.write(capsule);
			for(var m=2;m<cs_els[l].length-1;m++)
			{
				imr.document.write(cs_els[l][m].outerHTML);
			}
			
			
			imr.document.writeln("<hr />");
		}
	}
	else
	{
		imr.document.writeln("<p>"+localize('map8')+"</p><hr />");
	}
	
	imr.document.writeln("</body></html>");
	imr.document.close();
}}

function replace_brackets(str){
	rep1=/</gi;
	replaceIt=str.replace(rep1, "&lt;");
	rep2=/>/gi;
	replaceIt=replaceIt.replace(rep2, "&gt;");
	return replaceIt;	
}



	//array to store server-side image maps
	ss_maps=new Array();

	//each map element has its associated code (image, map, areas) stored in an array
	// this 2D array is used to collate all of the individual map arrays
	all_cs_map_arrays=new Array();
	
	var usemap_str;
	var img_els=WAT.document.getElementsByTagName('img');


function start()
{

//first check page for frames
	var frm=WAT.document.getElementsByTagName('frame');
	if (frm.length>0)
	{
		alert(localize('errortxt3'));
		return;
	}
	serverside();
	clientside();
	if(ss_maps.length==0&&all_cs_map_arrays.length==0)
	{
		alert(localize('map9'));
	}
	else
	{
		results_window(ss_maps,all_cs_map_arrays);
	}
}
}
//check for server-side image maps
function serverside()
{
	if(img_els.length!=0)
	{
		for(var n=0;n<img_els.length;n++)
		{
			if(img_els[n].getAttribute("ismap"))
			{
				ss_maps.push(img_els[n].outerHTML);
			}
		}
	}
}


//check for client-side image maps
function clientside() 
{
	//first look for 'map' element. if none present return negative
	//this means that even if an img element has a 'usemap' attribute it will return negative
	var map_els=WAT.document.getElementsByTagName('map');
	if(map_els.length!=0)
	{
		for(var j=0;j<img_els.length;j++)
		{
			if(img_els[j].getAttribute("usemap"))
			{
				for(var i=0;i<map_els.length;i++)
				{
					usemap_str=img_els[j].getAttribute("usemap");
					//each usemap value starts with a # which needs to be removed
					usemap_str=usemap_str.slice(1);			
					mapname_str=map_els[i].getAttribute("name");
					mapid_str=map_els[i].getAttribute("id");
					if((usemap_str==mapname_str)||(usemap_str==mapid_str))
					{
						//create array of map and child areas
						map_array = new Array();
						//get image properties
						var img_src=img_els[j].getAttribute("src");
						
						//add img node as first item of array
						map_array.push(img_els[j]);
					
						//add map element as second item of array
						map_array.push(map_els[i]);
						
						//get child 'area' elements of map
						if(map_els[i].hasChildNodes)
						{
							var children=map_els[i].childNodes;
							for (var k=0;k<children.length;k++)
							{
								if(children[k].nodeType==1)
								{
									//check for 'area' element & alt attribute
									if(children[k].nodeName.toLowerCase()=="area")
									{
										map_array.push(children[k]);
									}
								}
								
							}
							
						}
						map_array.push(replace_brackets("</map>"));
						all_cs_map_arrays.push(map_array);
					}
				}
			}
		}

	}
}

	start();
}
