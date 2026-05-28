#define MyAppName "JustSoft"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "JustSoft"
#define MyAppExeName "JustSoft.exe"

[Setup]
AppId={{9C9F7B8E-7F32-4D5A-A07A-JUSTSOFT001}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputDir=installer_output
OutputBaseFilename=JustSoft_Setup
Compression=lzma
SolidCompression=yes
SetupIconFile=logo.ico
WizardStyle=modern
PrivilegesRequired=lowest
UninstallDisplayIcon={app}\{#MyAppExeName}

[Languages]
Name: "french"; MessagesFile: "compiler:Languages\French.isl"

[Tasks]
Name: "desktopicon"; Description: "Créer un raccourci sur le Bureau"; GroupDescription: "Options :"; Flags: unchecked
Name: "startup"; Description: "Lancer JustSoft au démarrage de Windows"; GroupDescription: "Options :"; Flags: unchecked

[Files]
Source: "logo.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "dist\JustSoft.exe"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\JustSoft"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\logo.ico"
Name: "{autodesktop}\JustSoft"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\logo.ico"; Tasks: desktopicon

[Registry]
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Run"; ValueType: string; ValueName: "JustSoft"; ValueData: """{app}\{#MyAppExeName}"""; Tasks: startup
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Run"; ValueName: "JustSoft"; Flags: deletevalue uninsdeletevalue

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "Lancer JustSoft maintenant"; Flags: nowait postinstall skipifsilent
