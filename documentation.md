Web Accessibility Toolbar documentation
=======================================

The [Web Accessibility Toolbar
(WAT)](http://www.paciellogroup.com/resources/wat) is developed by [The
Paciello Group (TPG)](http://www.paciellogroup.com/). It is a free
plugin for Internet Explorer, that makes it easy to evaluate a website
for accessibility.

This documentation describes the menus within the WAT, and the tools and
features they contain. Each menu can be accessed with a mouse, or with a
keyboard shortcut. These shortcuts are included throughout, and
summarised in the [keyboard shortcuts](#keyboard-shortcuts) section for
convenience.

Check menu
----------

Keyboard shortcut: Control 1.

The options under this menu enable you to check the code of the current
web page.

### W3C HTML validation quick check

The HTML validation quick check displays the number of errors detected
in the HTML code of the web page. It is a high level indication of the
code quality, and does not provide any details about the nature of the
errors.

### W3C Nu Markup Checker

The W3C Nu Markup Checker provides a detailed report on the HTML and
ARIA code of the web page, including errors and warnings. There are
options to open the report in the current window or a new window.

### Filter Nu results

The Nu filter can be used on the results produced by the W3C Nu
Markup Checker. It filters the results so that only conformance
issues relating to accessibility are displayed.

### W3C HTML validation service

The W3C HTML validation service provides a detailed report on the HTML
code of the web page, including errors and warnings. There are options
to open the report in the current window or a new window.

### W3C CSS validation service

The W3C CSS validation service provides a detailed report on the CSS
code of the web page, including errors and warnings. There are options
to open the report in the current window or a new window.

### W3C Link checker

The W3C Link checker provides a report on the integrity and validity of
links on the current page, including errors and warnings. There are
options to open the report in the current window or in a new window, and
an option to check the links on pages linked to the current one.

### Functional Accessibility Checker

The Functional Accessibility Checker from the University of Illinois
provides a report on the accessibility of the current page. Results are
grouped into high level categories including navigation and orientation,
text equivalence, scripting, styling and HTML standards.

### The Wave

The Wave accessibility checker from WebAIM provides a report on the
accessibility of the current page. The results are summarised for
convenience, and also displayed in-line with the current page for easy
identification.

### Juicy Studio readability test

The Readability test from Juicy Studio measures the content of a web
page against the Gunning-Fog Index, Flesch Reading Ease, and
Flesch-Kincaid grade level. It provides a report that indicates the
average reading age or education level required to read and understand
the content of the page.

### Tenon

**NEW:** Tenon can be used to test the accessibility of your code
'during' development, rather than after the fact. Tenon also provides a
report on the accessibility of the current page. Feedback welcome...

CSS menu
--------

Keyboard shortcut: Control 2.

The options under this menu can be used to manipulate the CSS used to
style the current web page.

### Disable CSS

This removes all the CSS styling from the current page. It reveals the
underlying HTML structure and the order in which content is presented to
Assistive Technologies (AT).

### Disable in-line styles

This removes all the styling where the CSS has been included in-line
with the HTML of the current page.

### Display none to inline

This reveals content that has been hidden with the CSS display: property
set to "none". The content is changed to be displayed "inline" instead.

### Visibility hidden to visible

This reveals content that has been hidden with the CSS visibility:;
property set to "hidden". The content is changed to be "visible"
instead.

### Top/left text indent 0

This removes the CSS properties commonly used to hide content
off-screen, bringing the content into the browser's viewport.

Images menu
-----------

Keyboard shortcut: Control 3.

The options under this menu can be used to manipulate the images and
graphical content of the current page.

### List images

This opens a new window with a list of images on the page. The filename
and dimensions for each image are displayed, plus the number of
instances of each image and the HTML used to display each one

### Remove images

This removes all foreground images from the page. The alternative text
for each image can then be seen.

### Remove CSS images

This removes all background images from the page. It is then possible to
identify content which becomes meaningless when background images are
not available.

### Show images

Shows the images' alt attribute, if the img does not have an alt
attribute the text 'No alt!' is displayed and puts a border around each
image.

### Show image maps

Checks for the presence of client-side and server-side image maps. if
none are found it is indicated by an alert message. If image maps are
found, they are displayed in a new window along with the associated area
elements

### Active images

Counts alt-text errors and highlights alt text on active images to
review. Active images include images inside anchor tags (image links),
\<input\> elements with type=image and \<area\> elements for image maps.
This favelet adds "NoALT" markup text for image errors with all image
borders highlighted.

### Larger images

Counts alt-text errors and highlights alt-text on larger images to
review. Larger images are \<img\> elements which are not active and
whose height and width are *both*greater than 9 pixels.

Colour menu
-----------

Keyboard shortcut: Control 4.

### Contrast analyzer application

The Contrast analyzer checks the contrast of foreground/background
colour combinations against WCAG 2.0 SC1.4.3. Enter the hex codes for
the foreground/background colours to determine their contrast ratio.

### Juicy Studio luminosity tester

The luminosity tester will provide information regarding the
foreground/background colour combinations for the entire page, in a nice
table format output.

Structure menu
--------------

Keyboard shortcut: Control 5.

The options under this menu can be used to evaluate different aspects of
the HTML structure of the current page.

### Headings

This indicates all the headings marked up using the \<h1\> through
\<h6\> elements. The heading and heading level information is displayed
inline within the page.

### Heading structure

This opens a new browser window displaying the heading structure of the
current page. The document outline is represented visually, with the
different heading elements used to give content structure.

### Heading count

This displays an alert indicating the number of headings on the page,
and a breakdown by heading level.

### List items

This displays the list markup inline within the page, making it possible
to identify lists that have been marked up appropriately.

### Fieldset/labels

This displays fieldset and form label markup inline within the page.
Instances where the \<fieldset\> element does not have a corresponding
\<legend\> element are flagged, as are instances where the \<label\>
element is not properly associated with its corresponding form field.

### Abbreviations and acronyms

This displays the expanded content of \<abbr\> and \<acronym\> elements
inline within the page.

### Q/blockquote

This displays \<q\> and \<blockquote\> markup inline within the page.

### Paragraphs

This displays instances of the \<p\> element inline within the page.

### Section elements

This displays HTML5 sectioning element markup inline within the page,
for example the \<header\>, \<footer\> and \<article\> elements.

### ARIA landmark roles

This displays ARIA landmark roles inline within the page, including the
banner, main, navigation, complimentary, contentinfo and article roles.

### Access keys

This indicates whether access keys are present and displays the keys
that have been assigned.

### Tab order indicator

This displays the tab order inline within the page. Each focusable
element within the page is assigned a number, making it easy to track
the sequence of focusable elements across the page.

### Show other elements

Enter an element, then select a colour. All instances of the chosen
element will be highlighted on the page in the chosen colour.

### Show elements with ARIA attributes

**NEW** This function will pop up a new window providing information
about the use of ARIA on the page. Viewing the source code for this
output window may be more beneficial. Feedback welcome...

### Visually show focus

**NEW** Adds some visual enhancement to the keyboard focus, when tabbing
about a page. Need to apply on a page by page basis, to remove just
refresh the page. Feedback welcome...

Tables menu
-----------

Keyboard shortcut: Control 6.

The options under this menu can be used to examine HTML tables on the
current page.

### Juicy Studio table inspector

The Juicy Studio table inspector examines tables present on the page and
displays inline information about their markup and construction.

### Table headers

This indicates the presence of table headers and displays inline
information for each <th\> element found.

### Show data tables

Show data table function provides markup on the page for any data tables
found.

### Table borders

Adds a CSS border style to all table elements on the page.

### Table cell order

This displays a number inline within each table cell, making it easy to
understand the order of content within a table.

### Data table count

This counts the number of data tables present on the page and presents
the result in an alert dialogue.

### Linearize

This removes the table markup from the page, and displays table content
in a linear format (as it would appear to someone using a screen
reader).

Frames menu
-----------

Keyboard shortcut: Control 7.

The options under this menu can be used to check frames used within the
current page.

### Navigate to frames

This presents a sub-menu with links to each of the documents included
within frames in the current page. Each document can be opened directly
in the browser.

### Frame borders

Shows borders of all frame elements on the current page.

### Frame name/title

Displays (in a new window) a list of framed pages along with their frame
elements name and title attribute content.

Document info menu
------------------

Keyboard shortcut: Control Alt c.

The options under this menu can be used to inspect information about the
current page.

### Page information

This opens a new browser window with information about the current page,
including its title, charset, domain, and basic content types.

### Metadata information

This opens a new browser window with information about the \<meta\> and
\<link\> elements within the \<head\> of the current page.

### Show lang attributes

This displays the lang attribute used on the \<html\> element, and
elsewhere within the current page.

### Show titles

This indicates the presence of the title attribute and displays the
title content inline within the page.

### Skip links

This displays an alert indicating the number of skip links present on
the current page.

### List links

This opens a new browser window with information about the links present
on the current page, including URL, link text and browser window target.

### JavaScript/new window links

This displays an alert containing information about the number and type
of links that use JavaScript to open in a new window.

### List downloadable files

This opens a new browser window and displays information about links
leading to downloadable files on the current page.

### View partial source

Displays the DOM tree of the selected content as HTML. Select some page
content then activate the function. A new window will open showing the
selected content and generated code.

### DOM viewer

This opens a browser based viewer for inspecting the DOM of the current
page.

IE menu
-------

Keyboard shortcut: Control Alt s.

The options under this menu provide quick access to specific IE
settings, including:

-   Toggle images on/off.
-   Toggle JavaScript on/off.
-   Toggle ActiveX on/off.
-   Toggle CSS on/off.
-   Text resize (Largest, Large, Medium, Small, Smallest).
-   Open IE options dialog.
-   Open IE accessibility options dialog.
-   Windows accessibility options center.

Dev button
----------

Keyboard shortcut: Control Alt l.

Opens the built in IE developer tool. Can also be accessed using the IE
shortcut F12.

References menu
---------------

### Standards and specifications

This includes links to the HTML, CSS and ARIA specifications, and to
guidelines including WCAG 2.0 and Section 508.

### Resources

This includes links to resources including HTML5 Accessibility Support,
WebAIM and Jim Thatcher.

### Blogs

This includes links to accessibility blogs including the TPG blog and
Juicy Studio.

aViewer button
--------------

Keyboard shortcut: Control Alt a.

Opens the aViewer accessibility inspector. You can examine the
accessibility information exposed by accessibility APIs in IE, Firefox
or Chrome.

Help menu
---------

Keyboard shortcut: Control Alt 0.

The options under this menu provide access to helpful information, and
settings for the WAT:

-   The Paciello Group website
-   Accessibility toolbar options (enable hotkeys, toggle hotkeys
    display, toggle icon display).
-   Accessibility toolbar documentation.
-   About accessibility toolbar.
-   Installed version.

Keyboard shortcuts
------------------

The following is a list of WAT keyboard shortcuts:

-   Check menu - Control Alt 1.
-   CSS menu - Control Alt 2.
-   Images menu - Control Alt 3.
-   Colour menu - Control Alt 4.
-   Structure menu - Control Alt 5.
-   Tables menu - Control Alt 6.
-   Frames menu - Control Alt 7.
-   Document info - Control Alt c.
-   IE menu - Control Alt s.
-   References menu - Control Alt 8.
-   Help menu - Control Alt 0.

