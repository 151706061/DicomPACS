program Form30_5115;

uses
  Forms,
  fMain in 'fMain.pas' {frmMain},
  fMetodics in 'fMetodics.pas' {frmMetodics},
  fChooseNaz in 'fChooseNaz.pas' {frmChooseNaz},
  fChooseAnal in 'fChooseAnal.pas' {frmChooseAnal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Форма 30. Таблица 5115';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
