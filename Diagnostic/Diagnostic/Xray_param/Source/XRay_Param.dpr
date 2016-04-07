program XRay_Param;
// Ханты ГромутИП - 133463
// Кардио БерестовскаяНИ 100903
// МИД КрючковаНВ - 46766
uses
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  Forms,
  OracleMonitor,
  fMain in 'fMain.pas' {frmMain},
  fSetZavOtdel in 'fSetZavOtdel.pas' {frmSetZavOtdel},
  fSetDoobsl in 'fSetDoobsl.pas' {frmSetDoobsl},
  fSetOtdel in 'fSetOtdel.pas' {frmSetOtdel},
  fSetGlavVrach in 'fSetGlavVrach.pas' {frmSetGlavVrach},
  fAddEditPeriod in 'fAddEditPeriod.pas' {frmAddEditPeriod},
  fSetSotr in 'fSetSotr.pas' {frmSetSotr},
  fSetKab in 'fSetKab.pas' {frmSetKab},
  fSetMetod in 'fSetMetod.pas' {frmSetMetod},
  fSetLiter in 'fSetLiter.pas' {frmSetLiter},
  fAddEditApparat in 'fAddEditApparat.pas' {frmAddEditApparat},
  fSetKabinet in 'fSetKabinet.pas' {frmSetKabinet},
  fAddEditModal in 'fAddEditModal.pas' {frmAddEditModal},
  fAddMK in 'fAddMK.pas' {frmAddMK},
  fAddEditBodyParts in 'fAddEditBodyParts.pas' {frmAddEditBodyParts},
  fAddEditDays in 'fAddEditDays.pas' {frmAddEditDays};

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  {$IFDEF USE_NEW_AUTH}
    if not GetCheckConnect() then
      Exit;
  {$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Настройки';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowfrmMain;
  Application.Run;
end.
