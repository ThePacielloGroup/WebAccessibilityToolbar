WebAccessibilityToolbar
=======================

This repo contains all the files for the [web accessibility toolbar](http://www.paciellogroup.com/resources/wat) including a an ISS file for creating an install package (using [Inno installer] (http://www.jrsoftware.org/isinfo.php)).

##Editable files

These are the files that you can edit to modify the WAT:

###Accessibility_Toolbar.xml
This is an xml file which creates the menu's and menu items in the WAT UI.
You can add/remove/modify the UI via this file.
The text labels for the UI controls are provided via variable (res_id) references to the Translation.ini

**For example:**
The WAT > Structure > headings feature is represented as this in the XML file:

> &lt;item resid="head1_struc" image="-1" />

###Translation.ini
Contains all the text strings provided in the UI and the functions.
Also includes mappings to invoke the scripts and inbuilt features via the UI.



###Scripts folder
The majority of the WAT functionality is powered by JS or WS files. (WS just being a windows scripting host version - but written in JS)
You can think of the features as bookmarklets, as this is how most of them started life.
You can modify an exsiting feature by changing its corresponding script file.

**For example:**
The WAT > Structure > headings
is powered by Headings.js, so you hack on that script to chnage the behaviour of the feature.
