; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Cook_Book"
#define MyAppVersion "1.5"
#define MyAppPublisher "Ali"
#define MyAppExeName "cook_book.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{F70A9CF1-4976-49F7-B66A-2E6E2A4A393B}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
DisableProgramGroupPage=yes
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputDir=D:\Flutter_Apps\cook_book\Installers
OutputBaseFilename=Cook_Book
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "D:\Flutter_Apps\cook_book\build\windows\runner\Release\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Flutter_Apps\cook_book\build\windows\runner\Release\bitsdojo_window_windows_plugin.lib"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Flutter_Apps\cook_book\build\windows\runner\Release\connectivity_plus_windows_plugin.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Flutter_Apps\cook_book\build\windows\runner\Release\cook_book.exp"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Flutter_Apps\cook_book\build\windows\runner\Release\cook_book.lib"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Flutter_Apps\cook_book\build\windows\runner\Release\desktop_window_plugin.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Flutter_Apps\cook_book\build\windows\runner\Release\flutter_windows.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Flutter_Apps\cook_book\build\windows\runner\Release\data\*"; DestDir: "{app}\data"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

