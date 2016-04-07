program Xray_Archive;
// окб-ханты(аутентификация) ГромутИП - 122487                                
// окб-ханты ГромутИП - 122487
// локально ГромутИП - 112545
// на ноуте Сургут ОКБ Климова НВ - 155218

uses
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  Forms,
  OracleMonitor,
  fMain in 'fMain.pas' {frmMain},
  uPeriod in '..\..\..\uCommon_Kolya\uPeriod.pas' {frmParamDate},
  fSetNapravlen in 'fSetNapravlen.pas' {frmSetNapravlen},
  fSetKontrast in 'fSetKontrast.pas' {frmSetKontrast},
  fZakl in 'fZakl.pas' {frmZakl},
  fNazRgOne1 in 'fNazRgOne1.pas' {frmNazRg1},
  fSearch in 'fSearch.pas' {frmSearch},
  fWait in '..\..\..\uCommon_Kolya\fWait.pas' {FrmWait},
  fOtmena in '..\..\..\uCommon_Kolya\fOtmena.pas' {frmOtmena},
  fWork in 'fWork.pas' {frmWork},
  fSetOtdel in 'fSetOtdel.pas' {frmSetOtdel},
  fSetAdrRaion in 'fSetAdrRaion.pas' {frmSetAdrRaion},
  fSetKab in 'fSetKab.pas' {frmSetKab},
  fKabinet in 'fKabinet.pas' {frmKabinet};

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
