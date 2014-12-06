; Choose the type of installer: 32-bit (only) or 32- and 64-bit
; Ensure only one of the following is enabled at a time.
;  * A 32-bit (only) build contains only 32-bit binaries
;  * A 32-and-64-bit build contains 32-bit and 64-bit binaries (so you can run WAT in IE in both 32- and 64-bit modes)
; You can build both types of installer regardless of your Windows architecture.
;#define Build32BitOnly
#define Build32And64Bit
; Please *do not* save changes if you only edit the above two lines :-).

; Vital Stats
#define ReleaseYear 2014
#define TPG "The Paciello Group"
#define AppNameFull "Web Accessibility Toolbar"
#define AppNameShort "WAT"
#define FirstYear 2004
#define TheVersion ReadIni(SourcePath + "\wat\Translation.ini", "Captions", "Version", ">>>UNKOWN<<<")
#define DestinationDirectory "Web-Accessibility-Toolbar"

; Output filename arch part
#ifdef Build32BitOnly
  #define OutputArchName "32"
  #define InstallArch ""
#endif
#ifdef Build32And64Bit
  #define OutputArchName "32+64"
  #define InstallArch "x64"
#endif

[Setup]
uninstalllogmode=overwrite
uninstallfilesdir={app}
UninstallDisplayName={#AppNameFull} (Uninstall only)
sourcedir=wat
OutputDir=..
outputbasefilename=WAT_{#TheVersion}_{#OutputArchName}bit
defaultdirname={pf}\{#DestinationDirectory}
appvername={#AppNameFull}
Appname={#AppNameFull}
AppVersion={#TheVersion}
DisableDirPage=yes
DisableFinishedPage=no
DisableProgramGroupPage=yes
VersionInfoCompany={#TPG}
VersionInfoCopyright=Copyright (C) {#FirstYear}-{#ReleaseYear} {#TPG}
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
ArchitecturesInstallIn64BitMode={#InstallArch}

[Files]
Source: "icons/*.bmp"; DestDir: "{pf32}\{#DestinationDirectory}"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "Accessibility_Toolbar.xml"; DestDir: "{pf32}\{#DestinationDirectory}"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "translation.ini"; DestDir: "{pf32}\{#DestinationDirectory}"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "Accessibility_Toolbar.dll"; DestDir: "{pf32}\{#DestinationDirectory}"; Flags: regserver ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "scripts/*.*"; DestDir: "{pf32}\{#DestinationDirectory}\scripts"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "aViewer/*.*"; DestDir: "{pf32}\{#DestinationDirectory}\aViewer"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
Source: "CCA/*.*"; DestDir: "{pf32}\{#DestinationDirectory}\CCA"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec;
#ifdef Build32And64Bit
Source: "icons/*.bmp"; DestDir: "{pf64}\{#DestinationDirectory}"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec; Check: Is64BitInstallMode
Source: "Accessibility_Toolbar.xml"; DestDir: "{pf64}\{#DestinationDirectory}"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec; Check: Is64BitInstallMode
Source: "translation.ini"; DestDir: "{pf64}\{#DestinationDirectory}"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec; Check: Is64BitInstallMode
Source: "./x64/Accessibility_Toolbar.dll"; DestDir: "{pf64}\{#DestinationDirectory}"; Flags: regserver ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec; Check: Is64BitInstallMode
Source: "scripts/*.*"; DestDir: "{pf64}\{#DestinationDirectory}\scripts"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec; Check: Is64BitInstallMode
Source: "aViewer/*.*"; DestDir: "{pf64}\{#DestinationDirectory}\aViewer"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec; Check: Is64BitInstallMode
Source: "CCA/*.*"; DestDir: "{pf64}\{#DestinationDirectory}\CCA"; Flags: ignoreversion; MinVersion: 6.0.6002; Permissions:users-readexec; Check: Is64BitInstallMode
#endif

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"

[UninstallDelete]
Type: files; Name: "{pf32}\{#DestinationDirectory}\*.*";
Type: filesandordirs; Name: "{pf32}\{#DestinationDirectory}";
#ifdef Build32And64Bit
Type: files; Name: "{pf64}\{#DestinationDirectory}\*.*"; Check: Is64BitInstallMode
Type: filesandordirs; Name: "{pf64}\{#DestinationDirectory}"; Check: Is64BitInstallMode
#endif

[Dirs]
Name: "{pf32}\{#DestinationDirectory}"; Permissions: users-readexec;
#ifdef Build32And64Bit
Name: "{pf64}\{#DestinationDirectory}"; Permissions: users-readexec; Check: Is64BitInstallMode
#endif

[Code]
procedure CurPageChanged(CurPage: Integer);
var
   vIE, vID: Variant;
   ini: String;
begin
     if CurPage = wpFinished then
     begin
          ini := ExpandConstant('{app}') + '\{#DestinationDirectory}.ini';
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
