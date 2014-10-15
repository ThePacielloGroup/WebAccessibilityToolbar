#define TPG "The Paciello Group"
#define AppNameFull "Web Accessibility Toolbar"
#define AppNameShort "WAT"
#define FirstYear 2004
#define ReleaseYear 2014
#define TheVersion "2.0.0.0"

[Setup]
uninstalllogmode=overwrite
uninstallfilesdir={app}
UninstallDisplayName={#AppNameFull} (Uninstall only)
sourcedir=wat
OutputDir=..
outputbasefilename=WAT{#ReleaseYear}_x64
defaultdirname={pf}\Accessibility_Toolbar
appvername={#AppNameFull}
Appname={#AppNameFull}
AppVersion={#TheVersion}
DisableDirPage=yes
DisableFinishedPage=no
DisableProgramGroupPage=yes
VersionInfoCompany={#TPG}
VersionInfoCopyright=Copyright (C) {#FirstYear}-{#ReleaseYear} {#TPG}
VersionInfoVersion={#TheVersion}
VersionInfoDescription={#AppNameFull} {#ReleaseYear}
AppPublisher={#TPG}
AppPublisherURL=http://www.paciellogroup.com
AppSupportURL=http://www.paciellogroup.com/resources/wat
AppUpdatesURL=http://www.paciellogroup.com/resources/wat
LicenseFile=..\LICENSE
PrivilegesRequired=admin
DisableReadyPage=True
DisableReadyMemo=True
RestartApplications=False

ArchitecturesInstallIn64BitMode=x64

[Files]
Source: "icons/*.bmp"; DestDir: "{pf32}\Accessibility_Toolbar"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "Accessibility_Toolbar.xml"; DestDir: "{pf32}\Accessibility_Toolbar"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "translation.ini"; DestDir: "{pf32}\Accessibility_Toolbar"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "WAT_IEset.exe"; DestDir: "{pf32}\Accessibility_Toolbar"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "Accessibility_Toolbar.dll"; DestDir: "{pf32}\Accessibility_Toolbar"; Flags: regserver ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "scripts/*.*"; DestDir: "{pf32}\Accessibility_Toolbar\scripts"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "aViewer/*.*"; DestDir: "{pf32}\Accessibility_Toolbar\aViewer"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "CCA/*.*"; DestDir: "{pf32}\Accessibility_Toolbar\CCA"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;

Source: "icons/*.bmp"; DestDir: "{pf64}\Accessibility_Toolbar"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "Accessibility_Toolbar.xml"; DestDir: "{pf64}\Accessibility_Toolbar"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "translation.ini"; DestDir: "{pf64}\Accessibility_Toolbar"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "./x64/WAT_IEset.exe"; DestDir: "{pf64}\Accessibility_Toolbar"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "./x64/Accessibility_Toolbar.dll"; DestDir: "{pf64}\Accessibility_Toolbar"; Flags: regserver ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "scripts/*.*"; DestDir: "{pf64}\Accessibility_Toolbar\scripts"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "aViewer/*.*"; DestDir: "{pf64}\Accessibility_Toolbar\aViewer"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "CCA/*.*"; DestDir: "{pf64}\Accessibility_Toolbar\CCA"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;


[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"

[UninstallDelete]
Type: files; Name: "{pf32}\Accessibility_Toolbar\*.*";
Type: filesandordirs; Name: "{pf32}\Accessibility_Toolbar";

Type: files; Name: "{pf64}\Accessibility_Toolbar\*.*";
Type: filesandordirs; Name: "{pf64}\Accessibility_Toolbar";

[Dirs]
Name: "{pf32}\Accessibility_Toolbar"; Permissions: users-readexec;
Name: "{pf64}\Accessibility_Toolbar"; Permissions: users-readexec;

[Code]
procedure CurPageChanged(CurPage: Integer);
var
   vIE, vID: Variant;
   ini: String;
begin
     if CurPage = wpFinished then
     begin
          ini := ExpandConstant('{app}') + '\Accessibility_Toolbar.ini';
          // Set update version
          SetIniInt('Update', 'Version', 130, ini);
          // LangID. for text size function
          SetIniInt('IE', 'LangID', 3, ini);

          // Toolbar(Dev ver)'s CLSID
          // CLSID of Release ver is {11352A67-0178-46B1-8855-D50B2F81C054}
          // vID := '{A485C2BF-1A2D-4349-BAB0-FDA69A01DB81}';
          vID := '{11352A67-0178-46B1-8855-D50B2F81C054}';
          // Create an IE instance and ask it to show the toolbar
          vIE := CreateOleObject('InternetExplorer.Application');
          vIE.ShowBrowserBar(vID, True, 0);
          vIE.Visible := True;
          // It navigates to the page of each language version.
          vIE.Navigate('http://www.paciellogroup.com/resources/wat');
     end;
end;
