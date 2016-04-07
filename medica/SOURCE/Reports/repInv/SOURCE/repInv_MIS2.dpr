program repInv_MIS2;

uses
  Forms,
  fMain in 'fMain.pas' {frmMain},
  udm in 'udm.pas' {dm: TDataModule},
  fCheckedListEdit in '..\..\CommonUnits\fCheckedListEdit.pas' {fmCheckedListEdit},
  uGlobalConst in '..\..\..\..\..\..\uCommon\uGlobalConst.pas';

{$R *.res}

begin
  if Application.Terminated then
    Exit;
 if (ParamStr(1) = '') then
 begin
    Exit;
 end;
  Application.Initialize;
  Application.Title := 'Отчет по инвентаризации';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfmCheckedListEdit, fmCheckedListEdit);
  Application.Run;
end.
