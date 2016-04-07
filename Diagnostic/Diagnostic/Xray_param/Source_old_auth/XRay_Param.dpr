program XRay_Param;
// Ханты (ГромутИП) - 133463
// МИД-Админ-45809, КрючковаНВ - 46766
uses
  {$IFDEF USE_NEW_AUTH}
    SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  {$ELSE}
    SMMainAPI in '..\..\..\..\..\Trunk\ASU2\uCommon_Tima\SMMainAPI.pas',
  {$ENDIF}
  Forms,
  OracleMonitor,
  fMain in '..\Source\fMain.pas' {frmMain},
  fSetZavOtdel in '..\Source\fSetZavOtdel.pas' {frmSetZavOtdel},
  fSetDoobsl in '..\Source\fSetDoobsl.pas' {frmSetDoobsl},
  fSetOtdel in '..\Source\fSetOtdel.pas' {frmSetOtdel},
  fSetGlavVrach in '..\Source\fSetGlavVrach.pas' {frmSetGlavVrach},
  fAddEditPeriod in '..\Source\fAddEditPeriod.pas' {frmAddEditPeriod},
  fSetSotr in '..\Source\fSetSotr.pas' {frmSetSotr},
  fSetKab in '..\Source\fSetKab.pas' {frmSetKab},
  fSetMetod in '..\Source\fSetMetod.pas' {frmSetMetod},
  fSetLiter in '..\Source\fSetLiter.pas' {frmSetLiter},
  fAddEditApparat in '..\Source\fAddEditApparat.pas' {frmAddEditApparat},
  fSetKabinet in '..\Source\fSetKabinet.pas' {frmSetKabinet},
  fAddEditModal in '..\Source\fAddEditModal.pas' {frmAddEditModal};

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
