program Xray_Archive; // ~СТАРАЯ АВТОРИЗАЦИЯ~
// окб-ханты(аутентификация) ГромутИП - 122487                                
// окб-ханты ГромутИП - 115183
// локально ГромутИП - 112545
// МИД Крючкова - 48730
uses
  {$IFDEF USE_NEW_AUTH}
    SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  {$ELSE}
    SMMainAPI in '..\..\..\..\..\Trunk\ASU2\uCommon_Tima\SMMainAPI.pas',
  {$ENDIF}
  Forms,
  OracleMonitor,
  fMain in '..\Source\fMain.pas' {frmMain},
  uPeriod in '..\..\..\uCommon_Kolya\uPeriod.pas' {frmParamDate},
  fSetNapravlen in '..\Source\fSetNapravlen.pas' {frmSetNapravlen},
  fSetKontrast in '..\Source\fSetKontrast.pas' {frmSetKontrast},
  fZakl in '..\Source\fZakl.pas' {frmZakl},
  fNazRgOne1 in '..\Source\fNazRgOne1.pas' {frmNazRg1},
  fSearch in '..\Source\fSearch.pas' {frmSearch},
  fWait in '..\..\..\uCommon_Kolya\fWait.pas' {FrmWait},
  fOtmena in '..\..\..\uCommon_Kolya\fOtmena.pas' {frmOtmena},
  fWork in '..\Source\fWork.pas' {frmWork},
  fSetOtdel in '..\Source\fSetOtdel.pas' {frmSetOtdel};

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
  Application.Title := 'Рентген-архив';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowMainForm;
  Application.Run;
end.
