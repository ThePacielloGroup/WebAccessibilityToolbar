function main() {
examineDocumentRegions();

function getElementsByAttr(objElement, strTagName, strAttribute)
{
	var objCollection = objElement.getElementsByTagName(strTagName);
	var arReturn = [];

	for(var iCounter=0; iCounter<objCollection.length; iCounter++)
	{
		if (objCollection[iCounter].getAttribute(strAttribute))
		{
			arReturn.push(objCollection[iCounter]);
		}
	}

	objCollection = null;
	return (arReturn);
}

function getElementsByClassName(objElement, strTagName, strClassName)
{
	var objCollection = objElement.getElementsByTagName(strTagName);
	var arReturn = [];
	var strClass, arClass, iClass;

	for(var iCounter=0; iCounter<objCollection.length; iCounter++)
	{
		strClass = objCollection[iCounter].className;
		if (strClass)
		{
			arClass = strClass.split(' ');
			for (iClass=0; iClass<arClass.length; iClass++)
			{
				if (arClass[iClass] == strClassName)
				{
					arReturn.push(objCollection[iCounter]);
					break;
				}
			}
		}
	}

	objCollection = null;
	return (arReturn);
}

function addClassName(objElement, strValue)
{
	var strExisting = objElement.getAttribute('class');
	var arClass, iClass;

	if (strExisting === null)
	{
		objElement.setAttribute('class', strValue);
	}
	else
	{
		arClass = strExisting.split(' ');

		for (iClass=0; iClass<arClass.length; iClass++)
		{
			if (arClass[iClass] == strValue)
			{
				return false;
			}
		}

		objElement.setAttribute('class', strExisting + ' ' + strValue);
	}
	return true;
}

function jsdocariaremoveDetails()
{
	// Remove dialog
	var objExisting =window.document.getElementById('jsarianolandmark');

	if (objExisting)
	{
		objExisting.parentNode.removeChild(objExisting);
	}

	// Remove CSS
	objExisting =window.document.getElementById('jscssariadocumentlandmarkrole');

	if (objExisting)
	{
		objExisting.parentNode.removeChild(objExisting);
	}

	return false;
}

function warnNoDocRegion()
{
	alert('No ARIA document landmark roles detected.')
}

function isSubrole(objElement)
{
	var objParent = objElement;
	var strRole;

	do
	{
		objParent = objParent.parentNode;
		if (objParent.tagName !== undefined)
		{
			strRole = objParent.getAttribute('role');

			if (strRole)
			{
				switch (strRole.toLowerCase())
				{
					case 'application' :
					case 'banner' :
					case 'complementary' :
					case 'contentinfo' :
					case 'main' :
					case 'navigation' :
					case 'search' :
						return true;
				}
			}
		}
	} while (objParent.parentNode);

	return false;
}

function examineDocumentRegions()
{
	var objHead =window.document.getElementsByTagName('head')[0];
	var objElements = getElementsByAttr(window.document, '*', 'role');
	var objExisting =window.document.getElementById('jscssariadocumentlandmarkrole');
	var bRole = false;
	var objCSS, objRoles, objP, iCounter, strClass, strRole;
	
	var cssLink = window.document.createElement('STYLE');
cssLink.setAttribute('id', 'poot');
window.document.body.appendChild(cssLink);
window.document.all.poot.innerHTML=localize('style11');

	for (iCounter=0; iCounter<objElements.length; iCounter++)
	{
		if (!objExisting)
		{
			// Add a class to indicate the region
			strRole = objElements[iCounter].getAttribute('role');

			switch (strRole.toLowerCase())
			{
				case 'application' :
				case 'banner' :
				case 'complementary' :
				case 'contentinfo' :
				case 'form' :
				case 'main' :
				case 'navigation' :
				case 'search' :
					if (isSubrole(objElements[iCounter]))
					{
						addClassName(objElements[iCounter], 'jsariadocumentlandmarksub');
					}
					else
					{
						addClassName(objElements[iCounter], 'jsariadocumentlandmark');
					}

					objP =window.document.createElement('p');
					objP.setAttribute('class', 'poot');
					objP.appendChild(window.document.createTextNode('Role: ' + strRole.toLowerCase()));
					if (objElements[iCounter].firstChild)
					{
						objElements[iCounter].insertBefore(objP, objElements[iCounter].firstChild);
					}
					else
					{
						objElements[iCounter].appendChild(objP);
					}
					break;
			}
			bRole = true;
		}
		else
		{
			// Remove class information from the element
			strClass = objElements[iCounter].getAttribute('class');
			strClass = strClass.replace(/\s*jsariadocumentlandmarksub\s*/, '');
			strClass = strClass.replace(/\s*jsariadocumentlandmark\s*/, '');
			if (strClass !== '')
			{
				objElements[iCounter].setAttribute('class', strClass);
			}
			else
			{
				objElements[iCounter].removeAttribute('class');
			}
		}
	}

	if (!objExisting)
	{
	

		if (!bRole)
		{
			warnNoDocRegion();
		}
	}
	else 
	{
		// Clear up
		//objRoles = getElementsByClassName(content.document, 'p', 'jsariadocumentlandmarkdesc');
		//for (iCounter=0; iCounter<objRoles.length; iCounter++)
		//{
		//	objRoles[iCounter].parentNode.removeChild(objRoles[iCounter]);
		//}

		//objHead.removeChild(objExisting);

		//objExisting =window.document.getElementById('jsarianolandmark');
//
		//if (objExisting)
		//{
		//	objExisting.parentNode.removeChild(objExisting);
		//}
	}

	objElements = null;
}
}