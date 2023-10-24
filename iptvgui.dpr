program iptvgui;

uses
  Vcl.Forms,
  main in 'main.pas' {mainForm},
  Vcl.Themes,
  Vcl.Styles,
  iptvgui.settings in 'iptvgui.settings.pas',
  iptvgui.database in 'iptvgui.database.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows11 Modern Dark');
  Application.CreateForm(TmainForm, mainForm);
  Application.Run;
end.
