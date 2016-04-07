program Flu_Archive;
// ���-�����(��������������) �������� - 122487                                
// ���-����� �������� - 115183
// �������� �������� - 112545
uses
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  Forms,
  OracleMonitor,
  fMain in 'fMain.pas' {frmMain},
  uPeriod in '..\..\..\uCommon_Kolya\uPeriod.pas' {frmParamDate},
  fZakl in 'fZakl.pas' {frmZakl},
  fNazRgOne1 in 'fNazRgOne1.pas' {frmNazRg1},
  fWait in '..\..\..\uCommon_Kolya\fWait.pas' {FrmWait},
  fOtmena in '..\..\..\uCommon_Kolya\fOtmena.pas' {frmOtmena},
  fWork in 'fWork.pas' {frmWork},
  fSetUch in 'fSetUch.pas' {frmSetUch};

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  if not GetCheckConnect() then
    Exit;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '�������-�����';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowMainForm;
  Application.Run;
end.
