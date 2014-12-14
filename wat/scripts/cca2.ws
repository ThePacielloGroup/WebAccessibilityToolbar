function main()
{
//first check page for frames
	var frm=WAT.document.getElementsByTagName('iframe');   // change 'frame' to 'iframe'
	//alert("Frame length is " + frm.length);
	if (frm.length>0)
	{
		alert(localize('errortxt3'));   //This function does not work across framed pages
		return;
	}

for(fr = 0; fr <f_length; fr++)
{ //2
	var lw=window.open('about:blank','');
    //alert("lw 1 is " + lw);
	
	var iType=2;
	main.ColorTable = {'aliceblue':'#F0F8FF','antiquewhite':'#FAEBD7','aqua':'#00FFFF','aquamarine':'#7FFFD4','azure':'#F0FFFF','beige':'#F5F5DC','bisque':'#FFE4C4','black':'#000000','blanchedalmond':'#FFEBCD','blue':'#0000FF','blueviolet':'#8A2BE2','brown':'#A52A2A','burlywood':'#DEB887','cadetblue':'#5F9EA0','chartreuse':'#7FFF00','chocolate':'#D2691E','coral':'#FF7F50','cornflowerblue':'#6495ED','cornsilk':'#FFF8DC','crimson':'#DC143C','cyan':'#00FFFF','darkblue':'#00008B','darkcyan':'#008B8B','darkgoldenrod':'#B8860B','darkgray':'#A9A9A9','darkgreen':'#006400','darkkhaki':'#BDB76B','darkmagenta':'#8B008B','darkolivegreen':'#556B2F','darkorange':'#FF8C00','darkorchid':'#9932CC','darkred':'#8B0000','darksalmon':'#E9967A','darkseagreen':'#8FBC8B','darkslateblue':'#483D8B','darkslategray':'#2F4F4F','darkturquoise':'#00CED1','darkviolet':'#9400D3','deeppink':'#FF1493','deepskyblue':'#00BFFF','dimgray':'#696969','dodgerblue':'#1E90FF','firebrick':'#B22222','floralwhite':'#FFFAF0','forestgreen':'#228B22','fuchsia':'#FF00FF','gainsboro':'#DCDCDC','ghostwhite':'#F8F8FF','gold':'#FFD700','goldenrod':'#DAA520','gray':'#808080','green':'#008000','greenyellow':'#ADFF2F','honeydew':'#F0FFF0','hotpink':'#FF69B4','indianred':'#CD5C5C','indigo':'#4B0082','ivory':'#FFFFF0','khaki':'#F0E68C','lavender':'#E6E6FA','lavenderblush':'#FFF0F5','lawngreen':'#7CFC00','lemonchiffon':'#FFFACD','lightblue':'#ADD8E6','lightcoral':'#F08080','lightcyan':'#E0FFFF','lightgoldenrodyellow':'#FAFAD2','lightgreen':'#90EE90','lightgrey':'#D3D3D3','lightpink':'#FFB6C1','lightsalmon':'#FFA07A','lightseagreen':'#20B2AA','lightskyblue':'#87CEFA','lightslategray':'#778899','lightsteelblue':'#B0C4DE','lightyellow':'#FFFFE0','lime':'#00FF00','limegreen':'#32CD32','linen':'#FAF0E6','magenta':'#FF00FF','maroon':'#800000','mediumaquamarine':'#66CDAA','mediumblue':'#0000CD','mediumorchid':'#BA55D3','mediumpurple':'#9370DB','mediumseagreen':'#3CB371','mediumslateblue':'#7B68EE','mediumspringgreen':'#00FA9A','mediumturquoise':'#48D1CC','mediumvioletred':'#C71585','midnightblue':'#191970','mintcream':'#F5FFFA','mistyrose':'#FFE4E1','moccasin':'#FFE4B5','navajowhite':'#FFDEAD','navy':'#000080','oldlace':'#FDF5E6','olive':'#808000','olivedrab':'#6B8E23','orange':'#FFA500','orangered':'#FF4500','orchid':'#DA70D6','palegoldenrod':'#EEE8AA','palegreen':'#98FB98','paleturquoise':'#AFEEEE','palevioletred':'#DB7093','papayawhip':'#FFEFD5','peachpuff':'#FFDAB9','peru':'#CD853F','pink':'#FFC0CB','plum':'#DDA0DD','powderblue':'#B0E0E6','purple':'#800080','red':'#FF0000','rosybrown':'#BC8F8F','royalblue':'#4169E1','saddlebrown':'#8B4513','salmon':'#FA8072','sandybrown':'#F4A460','seagreen':'#2E8B57','seashell':'#FFF5EE','sienna':'#A0522D','silver':'#C0C0C0','skyblue':'#87CEEB','slateblue':'#6A5ACD','slategray':'#708090','snow':'#FFFAFA','springgreen':'#00FF7F','steelblue':'#4682B4','tan':'#D2B48C','teal':'#008080','thistle':'#D8BFD8','tomato':'#FF6347','turquoise':'#40E0D0','violet':'#EE82EE','wheat':'#F5DEB3','white':'#FFFFFF','whitesmoke':'#F5F5F5','yellow':'#FFFF00','yellowgreen':'#9ACD32'};
	

	if (!GetFrame(fr).document.getElementsByTagName || !GetFrame(fr).document.createElement)
		return;

	var objBody = GetFrame(fr).document.getElementsByTagName('body')[0];
	if (objBody)
		var objElements = objBody.getElementsByTagName('*');

	if (!objElements)
		return;

	// Store all element details in an array
	arElements = new Array();

	// Only add body element if there is text that isn't in a container
	if (objBody.firstChild)
	{
		var objChild = objBody.firstChild;
		if (checkText(objChild))
		{
			var objElementDetails = new Object();

			objElementDetails.element = objBody.tagName;
			objElementDetails.className = objBody.className;
			objElementDetails.IDName = objBody.id;
			objElementDetails.forecolour = getColour(objBody, 'color');
			objElementDetails.backcolour = getColour(objBody, 'backgroundColor');
			objElementDetails.parents = '';
			if (iType == 1 || iType == 2)
				objElementDetails.luminosity = getLuminosity(objElementDetails.forecolour, objElementDetails.backcolour);
			if (iType == 1 || iType == 3)
			{
				objElementDetails.colourbrightness = getBrightness(objElementDetails.forecolour, objElementDetails.backcolour);
				objElementDetails.colourdifference = getColourDifference(objElementDetails.forecolour, objElementDetails.backcolour);
			}
			arElements.push(objElementDetails);
		}
	}

	// Get details for each element in the DOM
	for (var iCounter=0; iCounter<objElements.length; iCounter++)
	{
		if (objElements[iCounter].firstChild && objElements[iCounter].tagName && !objElements[iCounter].tagName.match(/script/i))
		{
			var objChild = objElements[iCounter].firstChild;
			if (checkText(objChild))
			{
				var objElementDetails = new Object();

				objElementDetails.element = objElements[iCounter].tagName;
				objElementDetails.className = objElements[iCounter].className;
				objElementDetails.IDName = objElements[iCounter].id;
				objElementDetails.forecolour = getColour(objElements[iCounter], 'color');
				objElementDetails.backcolour = getColour(objElements[iCounter], 'backgroundColor');
				objElementDetails.parents = getParentElements(objElements[iCounter]);
				if (iType == 1 || iType == 2)
					objElementDetails.luminosity = getLuminosity(objElementDetails.forecolour, objElementDetails.backcolour);
				if (iType == 1 || iType == 3)
				{
					objElementDetails.colourbrightness = getBrightness(objElementDetails.forecolour, objElementDetails.backcolour);
					objElementDetails.colourdifference = getColourDifference(objElementDetails.forecolour, objElementDetails.backcolour);
				}

				// Avoid adding duplicate details
				if (!alreadygot(arElements, objElementDetails))
					arElements.push(objElementDetails);
			}
		
		}
		
		/* Added 25 May 2007 by maurice.lanselle@get-the.net
 * Patch to also evaluate INPUT elements which display text which should be legible:
 *  - buttons (submit, reset, and button), 
 *  - data entry fields (text, file, password).


		else if (objElements[iCounter].tagName && objElements[iCounter].tagName.indexOf(/input/i))
		{
			var objInputType = objElements[iCounter].type;
			if ((objInputType == "submit") || (objInputType == "text")|| (objInputType == "button")|| (objInputType == "reset")|| (objInputType == "password")|| (objInputType == "file"))
			{
				var objElementDetails = new Object();

				objElementDetails.element = objElements[iCounter].tagName + "-" + objElements[iCounter].type;
				objElementDetails.className = objElements[iCounter].className;
				objElementDetails.IDName = objElements[iCounter].id;
				objElementDetails.forecolour = getColour(objElements[iCounter], 'color');
				objElementDetails.backcolour = getColour(objElements[iCounter], 'background-color');
				objElementDetails.parents = getParentElements(objElements[iCounter]);
				if (iType == 1 || iType == 2)
					objElementDetails.luminosity = getLuminosity(objElementDetails.forecolour, objElementDetails.backcolour);
				if (iType == 1 || iType == 3)
				{
					objElementDetails.colourbrightness = getBrightness(objElementDetails.forecolour, objElementDetails.backcolour);
					objElementDetails.colourdifference = getColourDifference(objElementDetails.forecolour, objElementDetails.backcolour);
				}
				// Avoid adding duplicate details
				if (!alreadygot(arElements, objElementDetails))
					arElements.push(objElementDetails);
			}
		}
/* * * * * *
 * End of input-node patch added 25 May 2007 by maurice.lanselle@get-the.net
*/
	}


//checks to see if popup blocker is being used or access denied error occurs.
if (arElements.length > 0)
try
	{
		lw.document.title=localize('cca1');   //Colour Contrast Analysis
	}
	catch(e) 
	{
		if (lw)
		{
			//alert("lw 2 is " + lw);
			alert(localize('errortxt5'));   // The function has encountered an error and will not work on this page
			lw.close();
			return;
		}
		else
		{
			alert(localize('errortxt1'));   // pop up blocker
			return;
		}
	}
} //2

	lw.document.title=localize('cca1');    //Colour Contrast Analysis
	
	var cssLink = lw.document.createElement('STYLE');
	cssLink.setAttribute('id', 'poot');
	lw.document.getElementsByTagName('head')[0].appendChild(cssLink);
	lw.document.all.poot.innerHTML=localize('style3');
		
	var objTable = lw.document.createElement('TABLE');
	var objCaption = lw.document.createElement('CAPTION');
	var objTHead = lw.document.createElement('THEAD');
	var objTBody =lw.document.createElement('TBODY');
	var objTR, objTH, objTD, objNodeList, objNodeItem;
	var arParents;
		var objBody = lw.document.createElement('BODY');

	var objHeading = lw.document.createElement('H1');
	objHeading.appendChild(lw.document.createTextNode(localize('cca2')));
	lw.document.body.appendChild(objHeading);

	// Set up the table for the results
	objTable.setAttribute('summary', localize('cca3'));
	if (iType == 1)
		objCaption.appendChild(lw.document.createTextNode(localize('cca4')));
	else if (iType == 2)
		objCaption.appendChild(lw.document.createTextNode(localize('cca5')));    // getting here
	else if (iType == 3)
		objCaption.appendChild(lw.document.createTextNode(localize('cca6')));
	objTable.appendChild(objCaption);

	// Set up the thead element
	objTR = lw.document.createElement('TR');
	objTH = lw.document.createElement('TH');
	
	objTH.setAttribute('SCOPE', 'COL');
	objTH.appendChild(lw.document.createTextNode(localize('cca7')));
	objTR.appendChild(objTH);
	objTH = lw.document.createElement('th');
	
	objTH.setAttribute('scope', 'col');
	objTH.appendChild(lw.document.createTextNode(localize('cca8')));
	objTR.appendChild(objTH);
	objTH = lw.document.createElement('th');
	
	objTH.setAttribute('scope', 'col');
	objTH.appendChild(lw.document.createTextNode(localize('cca9')));
	objTR.appendChild(objTH);
	objTH = lw.document.createElement('th');
	
	objTH.setAttribute('scope', 'col');
	objTH.appendChild(lw.document.createTextNode(localize('cca10')));
	objTR.appendChild(objTH);
	objTH = lw.document.createElement('th');
	
	objTH.setAttribute('scope', 'col');
	objTH.appendChild(lw.document.createTextNode(localize('cca11')));
	objTR.appendChild(objTH);
	if (iType == 1 || iType == 2)
	{
		objTH = lw.document.createElement('th');
		objTH.setAttribute('scope', 'col');
		
		objTH.appendChild(lw.document.createTextNode(localize('cca12')));
		objTR.appendChild(objTH);
	}
	if (iType == 1 || iType == 3)
	{
		objTH = lw.document.createElement('th');
		objTH.setAttribute('scope', 'col');
		objTH.appendChild(lw.document.createTextNode(localize('cca13')));
		objTR.appendChild(objTH);
		objTH = lw.document.createElement('th');
		objTH.setAttribute('scope', 'col');
		objTH.appendChild(lw.document.createTextNode(localize('cca14')));
		objTR.appendChild(objTH);
	}
	objTHead.appendChild(objTR);
	objTable.appendChild(objTHead);

	// Add a row for each element to the tbody element
	for (var iCounter=0; iCounter<arElements.length; iCounter++)
	{
		objTR = lw.document.createElement('tr');
		objTD = lw.document.createElement('td');
		objTD.appendChild(lw.document.createTextNode(arElements[iCounter].element));
		if (arElements[iCounter].className)
		{
			var objP = lw.document.createElement('p');
			var objCode = lw.document.createElement('code');
			objCode.appendChild(lw.document.createTextNode('class'))
			objP.appendChild(objCode);
			objP.appendChild(lw.document.createTextNode(': ' + arElements[iCounter].className));
			objTD.appendChild(objP);
		}
		if (arElements[iCounter].IDName)
		{
			var objP = lw.document.createElement('p');
			var objCode = lw.document.createElement('code');
			objCode.appendChild(lw.document.createTextNode('id'))
			objP.appendChild(objCode);
			objP.appendChild(lw.document.createTextNode(': ' + arElements[iCounter].IDName));
			objTD.appendChild(objP);
		}
		objTR.appendChild(objTD);

		objTD = lw.document.createElement('td');

		if (arElements[iCounter].parents != '')
		{
			arParents = arElements[iCounter].parents;
			objNodeList = lw.document.createElement('ul');
			for (var iParentCounter=0; iParentCounter<arParents.length; iParentCounter++)
			{
				objNodeItem = lw.document.createElement('li');
				objNodeItem.appendChild(lw.document.createTextNode(arParents[iParentCounter]));
				objNodeList.appendChild(objNodeItem);
			}

			objTD.appendChild(objNodeList);
		}
		else
			objTD.appendChild(lw.document.createTextNode(localize('cca15')));
		objTR.appendChild(objTD);

		objTD = lw.document.createElement('td');
		objTD.style.backgroundColor = arElements[iCounter].backcolour.hexcolour;
		objTD.style.color = arElements[iCounter].forecolour.hexcolour;
		objTD.appendChild(lw.document.createTextNode(localize('cca16')));
		objTR.appendChild(objTD);
		objTD = lw.document.createElement('td');
		objTD.appendChild(lw.document.createTextNode(arElements[iCounter].forecolour.hexcolour));
		objTR.appendChild(objTD);
		objTD = lw.document.createElement('td');
		objTD.appendChild(lw.document.createTextNode(arElements[iCounter].backcolour.hexcolour));
		objTR.appendChild(objTD);
		if (iType == 1 || iType == 2)
		{
			objTD = lw.document.createElement('td');
	
			//objTD.appendChild(lw.document.createTextNode(arElements[iCounter].luminosity));
			objTD.appendChild(lw.document.createTextNode(arElements[iCounter].luminosity[0]));
			objTR.appendChild(objTD);
		}
		if (iType == 1 || iType == 3)
		{
			objTD = lw.document.createElement('td');
			objTD.appendChild(lw.document.createTextNode(arElements[iCounter].colourbrightness[0]));
			objTR.appendChild(objTD);
			objTD = lw.document.createElement('td');
			objTD.appendChild(lw.document.createTextNode(arElements[iCounter].colourdifference[0]));
			objTR.appendChild(objTD);
		}
	if (iType == 1)
			{
				if (arElements[iCounter].luminosity[1] == 0 || arElements[iCounter].colourbrightness[1] == 0 || arElements[iCounter].colourdifference[1] == 0)
				{
					objTR.className = 'failure';
				}
			}
			else if (iType == 2)
			{
				if (arElements[iCounter].luminosity[1] == 0)
				{
					objTR.className = 'failure';
				}
			}
			else if (iType == 3)
			{
				if (arElements[iCounter].colourbrightness[1] == 0 || arElements[iCounter].colourdifference[1] == 0)
				{
					objTR.className = 'failure';
				}
			}
			objTBody.appendChild(objTR);
		}


	// Finish table
	objTable.appendChild(objTBody);
	lw.document.body.appendChild(objTable);
	
}  // end of main


// Get brightness difference
function getBrightness(objForeColour, objBackColour)
{
	var iForegroundBrightness = ((objForeColour.red * 299) + (objForeColour.green * 587) + (objForeColour.blue * 114)) / 1000;
	var iBackgroundBrightness = ((objBackColour.red * 299) + (objBackColour.green * 587) + (objBackColour.blue * 114)) / 1000;
	var iBrightDifference;
	var strBrightResult;

	if (iBackgroundBrightness > iForegroundBrightness)
		iBrightDifference = parseInt(iBackgroundBrightness - iForegroundBrightness);
	else
		iBrightDifference = parseInt(iForegroundBrightness - iBackgroundBrightness);

	
	
	
	if (iBrightDifference > 125){
		strBrightResult = iBrightDifference + localize('cca17');
	return [strBrightResult, 1];
		}
		
		strBrightResult = iBrightDifference + localize('cca18');
	return [strBrightResult, 0];
}

// Calculate luminosity
function calculateLuminosity(fRed, fGreen, fBlue, fFullScale)
{
	var fRedRGB = fRed / fFullScale;
	var fGreenRGB = fGreen / fFullScale;
	var fBlueRGB = fBlue / fFullScale;
	var fLinearisedRed, fLinearisedGreen, fLinearisedBlue;

	if (fRedRGB <= 0.3928)
		fLinearisedRed = fRedRGB / 12.92;
	else
		fLinearisedRed = Math.pow(((fRedRGB + 0.055)/1.055), 2.4);

	if (fGreenRGB <= 0.3928)
		fLinearisedGreen = fGreenRGB / 12.92;
	else
		fLinearisedGreen = Math.pow(((fGreenRGB + 0.055)/1.055), 2.4);

	if (fBlueRGB <= 0.3928)
		fLinearisedBlue = fBlueRGB / 12.92;
	else
		fLinearisedBlue = Math.pow(((fBlueRGB + 0.055)/1.055), 2.4);

	return (0.2126 * fLinearisedRed + 0.7152 * fLinearisedGreen + 0.0722 * fLinearisedBlue);
}

// Get luminosity contrast ratio
function getLuminosity(objForeColour, objBackColour)
{
	var fFore, fBack, fL1, fL2, fDifference, strResult;
	var fPlaces = Math.pow(10, 2);

	fFore = calculateLuminosity(objForeColour.red, objForeColour.green, objForeColour.blue, 255);
	fBack = calculateLuminosity(objBackColour.red, objBackColour.green, objBackColour.blue, 255);

	if (fFore > fBack)
	{
		fL1 = fFore;
		fL2 = fBack;
	}
	else
	{
		fL1 = fBack;
		fL2 = fFore;
	}
	
	fDifference = (fL1 + 0.05) / (fL2 + 0.05);

	fDifference = Math.round(fDifference * fPlaces) / fPlaces;
	
	
	if (fDifference < 3)
	{
		strResult = fDifference + "  " + localize('cca18'); // from cca.properties file
		return [strResult, 0];
	}

	if (fDifference < 4.5)
	{
		strResult = fDifference + "  " +  localize('cca22'); // from cca.properties file
		return [strResult, 1];
	}

	if (fDifference < 7)
	{
		strResult = fDifference + "  " + localize('cca23'); // from cca.properties file
		return [strResult, 1];
	}

	strResult = fDifference + "  " + localize('cca24'); // from cca.properties file
	return [strResult, 1];
}


// Calculate luminosity
function calculateLuminosity(fRed, fGreen, fBlue, fFullScale)
{
	fLinearisedRed = Math.pow((fRed / fFullScale), 2.4);
	fLinearisedGreen = Math.pow((fGreen / fFullScale), 2.4);
	fLinearisedBlue = Math.pow((fBlue / fFullScale), 2.4);

	return (0.2126 * fLinearisedRed + 0.7152 * fLinearisedGreen + 0.0722 * fLinearisedBlue);
}

// Get an array of the parent elements
function getParentElements(objElement)
{
	var arElements = new Array();
	var objParent = objElement;
	var strElementName;

	do
	{
		objParent = objParent.parentNode;
		if (objParent.tagName != undefined)
		{
			strElementName = objParent.tagName;
			// Get class and id details to help identify the elements
			if (objParent.id)
				strElementName += '#' + objParent.id
			else if (objParent.className)
				strElementName += '.' + objParent.className.replace(/\s/g, '.');
			arElements.push(strElementName);
		}
	} while (objParent.parentNode);
	arElements.reverse();

	return arElements;
	
}

// Get the RGB values and hex colour value
function getColour(objElement, strProperty)
{
	var objColourDetails = new Object();
	var iRed, iGreen, iBlue;

	objColourDetails.hexcolour = getHex(objElement, strProperty);

	var arColour = getColourParts(objElement, strProperty);

	objColourDetails.red = arColour[0];
	objColourDetails.green = arColour[1];
	objColourDetails.blue = arColour[2];

	return objColourDetails;
}

// Get the hex colour value
function getHex(objElement, strProperty)
{
	var strColour
	
	strColour = objElement.currentStyle[strProperty];

	 // if not hex value used named color array to get hex value
	 if (strColour.substring(0, 1) != '#')  {
	
	strColour = main.ColorTable[strColour]
	}
	// If we don't have it, find where it's inheritted from
	if ((strColour == 'transparent' || strColour == '' || strColour == undefined) && objElement.parentNode)
	{
		try
		{
			strColour = getHex(objElement.parentNode, strProperty);
		} 
		catch (err)
		{
			if (strProperty == 'color')
				strColour = '#000000';
			else
				strColour = '#ffffff';
		}
	}

	return strColour;
}

// Get the red, green, and blue colour parts from the RGB string
function getColourParts(objElement, strProperty)
{
	
	
	var arColour = new Array();
	var strColour = objElement.currentStyle[strProperty];

	// if not hex value used named color array to get hex value
	 if (strColour.substring(0, 1) != '#')  {
	
	strColour = main.ColorTable[strColour]
	}
	
	
	// If we don't have it, find where it's inheritted from
	if ((strColour == 'transparent' || strColour == '' || strColour == undefined) && objElement.parentNode)
	{
		try
		{
			arColour = getColourParts(objElement.parentNode, strProperty);
		} 
		catch (err)
		{
			if (strProperty == 'color')
				arColour = new Array(0, 0, 0);
			else
				arColour = new Array(255, 255, 255);
		}
	}
	else
	{
		arColour = convertHex(strColour);
	}

	return arColour;
}

// Convert hex number to decimal
function convertHex(strHexColour)
{
	var strHexDigits = "0123456789abcdef";
	var arColour = new Array(3);
	var iDigit1, iDigit2;

	strHexColour = strHexColour.slice(1).toLowerCase();
	if (strHexColour.length == 3)
		for(var iCounter=0; iCounter<3; iCounter++)
		{
			iDigit1 = strHexDigits.indexOf(strHexColour.charAt(iCounter));
			arColour[iCounter] = (iDigit1 * 16) + iDigit1;
		}
	else
		for(var iCounter=0, iColour=0; iCounter<6; iCounter+=2, iColour++)
		{
			iDigit1 = strHexDigits.indexOf(strHexColour.charAt(iCounter));
			iDigit2 = strHexDigits.indexOf(strHexColour.charAt(iCounter + 1)); 
			arColour[iColour] = (iDigit1 * 16) + iDigit2;
		}

	return arColour;
}

// Check if an element with the same details is already in the collection
function alreadygot(arElements, objElementDetails)
{
	for (var iCounter=0; iCounter<arElements.length; iCounter++)
		if (arElements[iCounter].element == objElementDetails.element && arElements[iCounter].className == objElementDetails.className && arElements[iCounter].IDName == objElementDetails.IDName && sameParents(arElements[iCounter].parents, objElementDetails.parents))
			return true;

	return false;
}

// Compare the arrays to see if they have the same parent nodes
function sameParents(arFirst, arSecond)
{
	if (arFirst.length != arSecond.length)
		return false;

	for (var iCounter=0; iCounter<arFirst.length; iCounter++)
		if (arFirst[iCounter] != arSecond[iCounter])
			return false;

	return true;
}

// Check if there are any text nodes on this level
function checkText(objNode)
{
	do
	{
		if (objNode.nodeType == 3 && objNode.data.replace(/\s*/g, '') != '')
			return true;
	} while (objNode = objNode.nextSibling);

	return false;
}
