program Dispetcher;

uses
  OracleMonitor,
  Forms,
  fMain in 'fMain.pas' {frmMain},
  fLogin in 'fLogin.pas' {frmLogin},
  fExit in 'fExit.pas' {frmExit},
  fNumAbonent in 'fNumAbonent.pas' {frmNumAbonent},
  fKod in 'fKod.pas',
  fSetDrv in 'fSetDrv.pas' {frmSetDrv},
  fdlgFics in 'fdlgFics.pas' {dlgFics},
  fdlgSetRaschet in 'fdlgSetRaschet.pas' {dlgSetRaschet},
  fdlgBonus in 'fdlgBonus.pas' {dlgBonus},
  fdlgPred in 'fdlgPred.pas' {dlgPred},
  fCalendar in 'fCalendar.pas' {frmCalendar},
  fSprav in 'fSprav.pas' {frmSprav},
  fSetPhone in 'fSetPhone.pas' {frmSetPhone},
  fFics in 'fFics.pas' {frmFics},
  fZakaz in 'fZakaz.pas' {frmEditZakaz},
  fSetAdr2 in 'fSetAdr2.pas' {frmSetAdr2},
  fSetRaion in 'fSetRaion.pas' {frmSetRaion},
  fSetAdr1 in 'fSetAdr1.pas' {frmSetAdr1},
  fSetStreet in 'fSetStreet.pas' {frmSetStreet},
  fActions in 'fActions.pas' {frmActions},
  fInfo in 'fInfo.pas' {frmInfo},
  fSysInfo in 'fSysInfo.pas' {frmSysInfo},
  fSetPhoneAdr1 in 'fSetPhoneAdr1.pas' {frmSetPhoneAdr1},
  fdlgSendToTaxi in 'fdlgSendToTaxi.pas' {dlgSendToTaxi},
  fAddEditPen in 'fAddEditPen.pas' {frmAddEditPen},
  fSetPoz in 'fSetPoz.pas' {frmSetPoz};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'АРМ "Диспетчер"';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
