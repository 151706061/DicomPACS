program TaxiDispetcher;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  uTaxiGrid in 'uTaxiGrid.pas',
  fLogin in '..\..\Disp\Source\fLogin.pas' {frmLogin},
  uTaxiPanel in 'uTaxiPanel.pas',
  fAdr1 in 'fAdr1.pas' {frmAdr1},
  uNeedMove in 'uNeedMove.pas' {frmNeedMove},
  uConfirmAction in 'uConfirmAction.pas' {frmConfirmAction};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Сетка водителей';  
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmAdr1, frmAdr1);
  Application.Run;
end.
