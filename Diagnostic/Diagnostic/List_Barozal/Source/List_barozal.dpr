program List_barozal;
// Ханты ОКБ ТулиноваОВ - 198185 
uses
  Forms,
  OracleMonitor,
  fMain in 'fMain.pas' {frmMain},
  fAdd in 'fAdd.pas' {frmAdd},
  fSetRemark in 'fSetRemark.pas' {frmSetRemark},
  fSetDs in 'fSetDs.pas' {frmSetDs},
  fEdit in 'fEdit.pas' {frmEdit},
  fParams in 'fParams.pas' {frmParams},
  fAddEdit in 'fAddEdit.pas' {frmAddEdit},
  fSetOtdel in 'fSetOtdel.pas' {frmSetOtdel},
  fEditDate in 'fEditDate.pas' {frmEditDate};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Журнал барозала';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmEditDate, frmEditDate);
  frmMain.DoShowForm;
  Application.Run;
end.
