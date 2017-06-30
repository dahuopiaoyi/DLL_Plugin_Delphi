program PluginDemo;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {MainForm},
  MainInterface in 'MainInterface.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
