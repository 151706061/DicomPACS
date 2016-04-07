// ханты - ПавловПИ - 187464, МизинАГ - 189064

program List_RHMDL;

uses
  OracleMonitor,
  Forms,
  fMain in 'fMain.pas' {frmMain},
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  fAdd in 'fAdd.pas' {frmAdd},
  fKag in 'fKag.pas' {frmKag},
  fACNK in 'fACNK.pas' {frmACNK},
  fDelManyMetodics in 'fDelManyMetodics.pas' {frmDelManyMetodics},
  fKag1 in 'fKag1.pas' {frmKag1},
  fSetPer in 'fSetPer.pas' {frmSetPer},
  fSet in 'fSet.pas' {frmSet},
  fPacInfoRhmdl in 'fPacInfoRhmdl.pas' {frmPacInfoRhmdl},
  uDM in 'uDM.pas' {frmDM};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Журнал РХМДЛ';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmDM, frmDM);
  Application.Run;
end.
