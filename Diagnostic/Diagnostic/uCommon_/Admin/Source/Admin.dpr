program Admin;

uses
  OracleMonitor,
  Forms,
  fMain in 'fMain.pas' {frmMain},
  fSprSotr in 'fSprSotr.pas' {frmSprSotr},
  fAddEditSotr in 'fAddEditSotr.pas' {frmAddEditSotr},
  fSysParams in 'fSysParams.pas' {frmSysParams},
  fSetAdrParam in 'fSetAdrParam.pas' {frmSetAdrParam},
  fSprStreet in 'fSprStreet.pas' {frmSprStreet},
  fEditSpr in 'fEditSpr.pas' {frmEditStr},
  fSprPlaces in 'fSprPlaces.pas' {frmSprPlaces},
  fAddEditPlace in 'fAddEditPlace.pas' {frmAddEditPlace},
  fSysSpr in 'fSysSpr.pas' {frmSysSpr},
  fSprRaion in 'fSprRaion.pas' {frmSprRaion},
  fAddEditRaion in 'fAddEditRaion.pas' {frmAddEditRaion},
  fSprTarif in 'fSprTarif.pas' {frmSprTarif},
  fSprStops in 'fSprStops.pas' {frmSprStops},
  fAddEditTarif in 'fAddEditTarif.pas' {frmAddEditTarif},
  fAddEditTaxi in 'fAddEditTaxi.pas' {frmAddEditTaxi},
  fAddEditTSS in 'fAddEditTSS.pas' {frmAddEditTSS},
  fAddEditStop in 'fAddEditStop.pas' {frmAddEditStop},
  fSprDrivers in 'fSprDrivers.pas' {frmSprDrivers},
  fAddEditDrv in 'fAddEditDrv.pas' {frmAddEditDrv},
  fSprClient in 'fSprClient.pas' {frmSprClient},
  fAddEditClient in 'fAddEditClient.pas' {frmAddEditClient},
  fSetAdr in 'fSetAdr.pas' {frmSetAdr},
  fTel in 'fTel.pas' {frmTel},
  fDistrictStreet in 'fDistrictStreet.pas' {frmDistrictStreet},
  fDistrictStreetEdit in 'fDistrictStreetEdit.pas' {frmDistrictStreetEdit},
  fSprMG in 'fSprMG.pas' {frmSprMG},
  fAddEditMG in 'fAddEditMG.pas' {frmAddEditMG},
  fSetIdentMG in 'fSetIdentMG.pas' {frmSetIdentMG},
  fFindDrv in 'fFindDrv.pas' {frmFindDrv},
  fSprKeys in 'fSprKeys.pas' {frmSprKeys},
  fAddEditKeys in 'fAddEditKeys.pas' {frmAddEditKeys},
  fCalls in 'fCalls.pas' {frmCalls},
  fVedSotr in 'fVedSotr.pas' {frmVedSotr},
  fSetNumDrv in 'fSetNumDrv.pas' {frmSetNumDrv},
  fSvodVed in 'fSvodVed.pas' {frmSvodVed},
  fVedSmena in 'fVedSmena.pas' {frmVedSmena},
  fDisp in 'fDisp.pas' {frmDisp},
  fEdit in 'fEdit.pas' {frmEdit},
  fSetPers in 'fSetPers.pas' {frmSetPers},
  fDetail in 'fDetail.pas' {frmDetail},
  fSprCross in 'fSprCross.pas' {frmSprCross},
  fAddEditCross in 'fAddEditCross.pas' {frmAddEditCross},
  fModuleInfo in 'fModuleInfo.pas' {frmModuleInfo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'АРМ "Администратор"';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
