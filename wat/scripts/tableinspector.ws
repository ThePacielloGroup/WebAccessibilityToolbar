function main()
{
test();
var strTIOutput;

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

function jstiserialiseNode(objNode)
{
	var strClass = '';

	if (objNode)
	{
		if (objNode.nodeType == 3 && objNode.data)
		{
			strTIOutput += objNode.data;
		}
		else if (objNode.nodeType == 1 && objNode.getAttribute('alt'))
		{
			strTIOutput += objNode.getAttribute('alt');
		}

		objNode = objNode.firstChild;
	}

	if (objNode && objNode.className)
	{
		strClass = objNode.className;
	}

	while (objNode && strClass != 'juicystudiohighlightmeta')
	{
		jstiserialiseNode(objNode);
		objNode = objNode.nextSibling;
	}
}

function jstiremoveDetails()
{
	var objExisting = window.document.getElementById('jstinodatatables');
	var iElementsRemoved, iElementCounter, objRedundant;

	// Remove table information if it exists
	do
	{
		iElementsRemoved = 0;
		objRedundant = window.document.getElementsByTagName('div');

		for (iElementCounter=0; iElementCounter<objRedundant.length; iElementCounter++)
		{
			if (objRedundant[iElementCounter].className == 'juicystudiohighlightmeta')
			{
				objRedundant[iElementCounter].parentNode.removeChild(objRedundant[iElementCounter]);
				iElementsRemoved++;
			}
		}
	} while (iElementsRemoved > 0);

	if (objExisting)
	{
		objExisting.parentNode.removeChild(objExisting);
	}

	objExisting = window.document.getElementById('jstableinspectorstyle');

	if (objExisting)
	{
		objExisting.parentNode.removeChild(objExisting);
	}

	return false;
}


function jstiwarnNoDataTables()
{
	window.alert('No data tables detected. The table inspector reveals accessibility information for data tables.');
	
}

function test()
{
	var iElementCounter, objHead;
	var objContainer, arElement, arAxis, objText, objContent, objItem, objCSS;
	var objTable, strSummary, strHeaders, strScope, strAbbr, strAxis, objHeader;
	var objExisting = window.document.getElementById('jstableinspectorstyle');
	var iTableCounter, arHeader;
	var bDataTable = false;

	if (!objExisting)
	{
		
		var cssLink = window.document.createElement('STYLE');
cssLink.setAttribute('id', 'poot');
window.document.getElementsByTagName('head')[0].appendChild(cssLink);
window.document.all.poot.innerHTML=localize('style10');
		


		objTable = window.document.getElementsByTagName('table');

		for(iTableCounter=0; iTableCounter<objTable.length; iTableCounter++)
		{
			strSummary = objTable[iTableCounter].getAttribute('summary');
			if (strSummary)
			{
				objContainer = window.document.createElement('div');

				objContainer.className = 'juicystudiohighlightmeta';

				arElement = window.document.createElement('strong');
				objText = window.document.createTextNode(localize('tableinspector1') +' '+ strSummary);

				arElement.appendChild(objText);

				objContainer.appendChild(arElement);

				try
				{
					objTable[iTableCounter].parentNode.insertBefore(objContainer, objTable[iTableCounter]);
				}
				catch (err)
				{
					window.document.body.insertBefore(objContainer, objTable[iTableCounter]);
				}

				bDataTable = true;

			}

			arElement = objTable[iTableCounter].getElementsByTagName('*');

			for (iElementCounter=0; iElementCounter<arElement.length; iElementCounter++)
			{
				if (arElement[iElementCounter].tagName.toLowerCase() == 'td' || arElement[iElementCounter].tagName.toLowerCase() == 'th')
				{
					objExisting = getElementsByClassName(arElement[iElementCounter], 'div', 'juicystudiohighlightmeta');
					if (objExisting.length < 1)
					{
						strHeaders = arElement[iElementCounter].getAttribute('headers');
						if (strHeaders)
						{
							objContainer = window.document.createElement('div');
							objContainer.className = 'juicystudiohighlightmeta';

							objContent = window.document.createElement('strong');
							objText = window.document.createTextNode(localize('tableinspector2'));
							objContent.appendChild(objText);
							objContainer.appendChild(objContent);

							objContent = window.document.createElement('ul');

							arHeader = strHeaders.split(/\s/);

							for (var i=0; i< arHeader.length; i++)
							{
								objHeader = window.document.getElementById(arHeader[i]);
								strTIOutput = '';
								jstiserialiseNode(objHeader);

								objItem = window.document.createElement('li');

								objText = window.document.createTextNode(strTIOutput);
								objItem.appendChild(objText);
								objContent.appendChild(objItem);
							}

							objContainer.appendChild(objContent);
							arElement[iElementCounter].appendChild(objContainer);
							bDataTable = true;
						}
					}
				}
			}

			for (iElementCounter=0; iElementCounter<arElement.length; iElementCounter++)
			{
				if (arElement[iElementCounter].tagName.toLowerCase() == 'td' || arElement[iElementCounter].tagName.toLowerCase() == 'th')
				{
					objExisting = getElementsByClassName(arElement[iElementCounter], 'div', 'juicystudiohighlightmeta');
					if (objExisting.length < 1)
					{
						strScope = arElement[iElementCounter].getAttribute('scope');
						if (strScope)
						{
							objContainer = window.document.createElement('div');
							objContainer.className = 'juicystudiohighlightmeta';

							objContent = window.document.createElement('strong');
							if (strScope.toLowerCase() == 'col')
							{
								strScope = 'column';
							}
							else if (strScope.toLowerCase() == 'colgroup')
							{
								strScope = 'column group';
							}
							else if (strScope.toLowerCase() == 'rowgroup')
							{
								strScope = 'row group';
							}
							objText = window.document.createTextNode(strScope +' '+localize('tableinspector3'));
							objContent.appendChild(objText);
							objContainer.appendChild(objContent);

							arElement[iElementCounter].appendChild(objContainer);
							bDataTable = true;
						}
						else if (arElement[iElementCounter].tagName.toLowerCase() == 'th')
						{
							objContainer = window.document.createElement('div');
							objContainer.className = 'juicystudiohighlightmeta';
							objContent = window.document.createElement('strong');
							objText = window.document.createTextNode(localize('tableinspector4'));

							objContent.appendChild(objText);
							objContainer.appendChild(objContent);

							arElement[iElementCounter].appendChild(objContainer);
							bDataTable = true;
						}

						strAbbr = arElement[iElementCounter].getAttribute('abbr');
						if (strAbbr)
						{
							objContainer = window.document.createElement('div');
							objContainer.className = 'juicystudiohighlightmeta';

							objContent = window.document.createElement('strong');
							objText = window.document.createTextNode(localize('tableinspector5')+' ' + strAbbr);
							objContent.appendChild(objText);
							objContainer.appendChild(objContent);

							arElement[iElementCounter].appendChild(objContainer);
							bDataTable = true;
						}

						strAxis = arElement[iElementCounter].getAttribute('axis');
						if (strAxis)
						{
							objContainer = window.document.createElement('div');
							objContainer.className = 'juicystudiohighlightmeta';

							objContent = window.document.createElement('strong');
							objText = window.document.createTextNode(localize('tableinspector6'));
							objContent.appendChild(objText);
							objContainer.appendChild(objContent);

							objContent = window.document.createElement('ul');
							objContainer.appendChild(objContent);

							arAxis = strAxis.split(',');

							for (var iAxis=0; iAxis<arAxis.length; iAxis++)
							{
								objText = arAxis[iAxis];
								objContent = window.document.createElement('li');

								objText = window.document.createTextNode(objText);
								objContent.appendChild(objText);
								objContainer.appendChild(objContent);
							}
							arElement[iElementCounter].appendChild(objContainer);
							bDataTable = true;
						}
					}
				}
			}
		}
		if (!bDataTable)
		{
			jstiwarnNoDataTables();
		}
	}
	else
	{
		jstiremoveDetails();
	}
}
}