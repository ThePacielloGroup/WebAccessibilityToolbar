[Setup]

uninstalllogmode=overwrite
uninstallfilesdir={app}
uninstalldisplayname=Web Accessibility Toolbar(Uninstall only)
sourcedir=C:\Users\steven\Documents\Toolbar_dev_versions\WAT2014\setupx86
OutputDir=C:\Users\steven\Documents\Toolbar_dev_versions\WAT2014\setupx86\install
outputbasefilename=WAT2014_x86
defaultdirname={pf}\Accessibility_Toolbar
appvername=Web Accessibility Toolbar
Appname=Web Accessibility Toolbar
AppVersion=2.0
DisableReadyPage=Yes
DisableDirPage=yes
disablestartupprompt=Yes
DisableFinishedPage=no
DisableProgramGroupPage=yes
DisableReadyMemo=yes
DisableWelcomePage=yes
VersionInfoCompany=TPG
VersionInfoCopyright=Copyright (C) 2004-2014 TPG
VersionInfoVersion=2.0.0.0
VersionInfoDescription=Web Accessibility Toolbar 2014
AppPublisher=TPG
AppPublisherURL=http://www.paciellogroup.com
AppSupportURL=http://www.paciellogroup.com
AppUpdatesURL=http://www.paciellogroup.com
;LicenseFile=license.rtf
PrivilegesRequired=admin
[Files]
Source: "icons/*.bmp"; DestDir: "{pf32}\Accessibility_Toolbar"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "Accessibility_Toolbar.xml"; DestDir: "{pf32}\Accessibility_Toolbar"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "translation.ini"; DestDir: "{pf32}\Accessibility_Toolbar"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "WAT_IEset.exe"; DestDir: "{pf32}\Accessibility_Toolbar"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "Accessibility_Toolbar.dll"; DestDir: "{pf32}\Accessibility_Toolbar"; Flags: regserver ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "scripts/*.*"; DestDir: "{pf32}\Accessibility_Toolbar\scripts"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "aViewer/*.*"; DestDir: "{pf32}\Accessibility_Toolbar\aViewer"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "CCA/*.*"; DestDir: "{pf32}\Accessibility_Toolbar\CCA"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
[UninstallDelete]
Type: files; Name: "{pf32}\Accessibility_Toolbar\*.ini";
Type: files; Name: "{pf32}\Accessibility_Toolbar\*.tmp";
Type: files; Name: "{pf32}\Accessibility_Toolbar\*.dll";
Type: files; Name: "{pf32}\Accessibility_Toolbar\*.*";
Type: filesandordirs; Name: "{pf32}\Accessibility_Toolbar";

[Dirs]
Name: "{pf32}\Accessibility_Toolbar"; Permissions: users-readexec;