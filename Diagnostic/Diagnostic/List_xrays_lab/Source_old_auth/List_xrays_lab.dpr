program List_xrays_lab; // ~СТАРАЯ АВТОРИЗАЦИЯ~
// Ханты (ЛитвиновАМ) - 39211
// Сургут (АрепьеваЕА) - 71869
// ЛОкально ГромутИП - 112520
// Сургут кардио ДолгийСВ - 65296
// МИД БорисоваНИ - 45715
uses
  {$IFDEF USE_NEW_AUTH}
    SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  {$ELSE}
    SMMainAPI in '..\..\..\..\..\Trunk\ASU2\uCommon_Tima\SMMainAPI.pas',
  {$ENDIF}
  Forms,
  OracleMonitor,
  fMain in '..\Source\fMain.pas' {frmMain},
  fLabNaprav in '..\Source\fLabNaprav.pas' {frmLabNaprav},
  fNazParamRegist in '..\Source\fNazParamRegist.pas' {frmNazParamRegist},
  fSearchLab in '..\Source\fSearchLab.pas' {frmSearchLab},
  fNazRgOne1 in '..\Source\fNazRgOne1.pas' {frmNazRg1},
  fLabNapravFlu in '..\Source\fLabNapravFlu.pas' {frmLabNapravFlu},
  fCompanyList in '..\..\..\uCommon_Kolya\fCompanyList.pas' {frmCompanyList},
  fCompany in '..\..\..\uCommon_Kolya\fCompany.pas' {frmCompany},
  fWait in '..\..\..\uCommon_Kolya\fWait.pas' {FrmWait},
  fEditNaz in '..\..\..\uCommon_Kolya\fEditNaz.pas' {frmEditNaz},
  fPacInfo in '..\..\..\uCommon_Kolya\fPacInfo.pas' {frmPacInfo},
  fPass in '..\Source\fPass.pas' {frmPass},
  fDolg in '..\Source\fDolg.pas' {frmDolg},
  fPac in '..\Source\fPac.pas' {frmPac},
  fProsmotrZaklFlu in '..\..\..\uCommon_Kolya\fProsmotrZaklFlu.pas' {frmProsmotrZaklFlu},
  fOtmena in '..\..\..\uCommon_Kolya\fOtmena.pas' {frmOtmena},
  fSysInfo in '..\..\..\uCommon_Kolya\fSysInfo.pas' {frmSysInfo},
  fCompare in '..\Source\fCompare.pas' {frmCompare};

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  {$IFDEF USE_NEW_AUTH}
  if not GetCheckConnect() then
    Exit;
  {$ENDIF}
  Application.Initialize;
  Application.Title := 'Рентген - Журнал лаборанта';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
