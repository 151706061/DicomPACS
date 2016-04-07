unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList, Oracle, OracleData, dxSkinsCore, ImgList,
  cxLookAndFeelPainters, Buttons, StdCtrls, cxButtons;

type
  TfrmMain = class(TForm)
    mm1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    al: TActionList;
    aClose: TAction;
    os: TOracleSession;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    IL: TImageList;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N20: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
  public
    Russian, Latin : HKL;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses fSprSotr, fSysParams, fSprStreet, fSprPlaces, fSysSpr, fSprRaion,
  fSprTarif, fSprStops, fSprDrivers, fSprClient, fDistrictStreet, fSprMG,
  fSprKeys, fCalls, fVedSotr, fSvodVed, fVedSmena, fDisp, fSprCross,
  fModuleInfo;

{$R *.dfm}

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите закрыть программу ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    action := caFree
  else
    action := caNone;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Russian:=LoadKeyboardLayout('00000419', 0);
  Latin:=LoadKeyboardLayout('00000409', 0);
  Self.WindowState := wsMaximized;
end;

procedure TfrmMain.N10Click(Sender: TObject);
begin
  try
    if Assigned(frmSysSpr) then
      frmSysSpr.Show
    else
      Application.CreateForm(TfrmSysSpr, frmSysSpr);
  except
    Application.CreateForm(TfrmSysSpr, frmSysSpr);
  end;
end;

procedure TfrmMain.N11Click(Sender: TObject);
begin
  try
    if Assigned(frmSprRaion) then
      frmSprRaion.Show
    else
      Application.CreateForm(TfrmSprRaion, frmSprRaion);
  except
    Application.CreateForm(TfrmSprRaion, frmSprRaion);
  end;
end;

procedure TfrmMain.N12Click(Sender: TObject);
begin
  try
    if Assigned(frmSprStops) then
      frmSprStops.Show
    else
      Application.CreateForm(TfrmSprStops, frmSprStops);
  except
    Application.CreateForm(TfrmSprStops, frmSprStops);
  end;
end;

procedure TfrmMain.N13Click(Sender: TObject);
begin
  try
    if Assigned(frmSprDrivers) then
      frmSprDrivers.Show
    else
      Application.CreateForm(TfrmSprDrivers, frmSprDrivers);
  except
    Application.CreateForm(TfrmSprDrivers, frmSprDrivers);
  end;
end;

procedure TfrmMain.N14Click(Sender: TObject);
begin
  try
    if Assigned(frmSprClient) then
      frmSprClient.Show
    else
      Application.CreateForm(TfrmSprClient, frmSprClient);
  except
    Application.CreateForm(TfrmSprClient, frmSprClient);
  end;
end;

procedure TfrmMain.N15Click(Sender: TObject);
begin
  try
    if Assigned(frmDistrictStreet) then
      frmDistrictStreet.Show
    else
      Application.CreateForm(TfrmDistrictStreet, frmDistrictStreet);
  except
    Application.CreateForm(TfrmDistrictStreet, frmDistrictStreet);
  end;
end;

procedure TfrmMain.N16Click(Sender: TObject);
begin
  try
    if Assigned(frmSprMG) then
      frmSprMG.Show
    else
      Application.CreateForm(TfrmSprMG, frmSprMG);
  except
    Application.CreateForm(TfrmSprMG, frmSprMG);
  end;
end;

procedure TfrmMain.N17Click(Sender: TObject);
begin
  try
    if Assigned(frmSprKeys) then
      frmSprKeys.Show
    else
      Application.CreateForm(TfrmSprKeys, frmSprKeys);
  except
    Application.CreateForm(TfrmSprKeys, frmSprKeys);
  end;
end;

procedure TfrmMain.N18Click(Sender: TObject);
begin
  try
    if Assigned(frmCalls) then
      frmCalls.Show
    else
      Application.CreateForm(TfrmCalls, frmCalls);
  except
    Application.CreateForm(TfrmCalls, frmCalls);
  end;
end;

procedure TfrmMain.N20Click(Sender: TObject);
begin
  try
    if Assigned(frmDisp) then
      frmDisp.Show
    else
      Application.CreateForm(TfrmDisp, frmDisp);
  except
    Application.CreateForm(TfrmDisp, frmDisp);
  end;
end;

procedure TfrmMain.N22Click(Sender: TObject);
begin
  try
    if Assigned(frmVedSotr) then
      frmVedSotr.Show
    else
      Application.CreateForm(TfrmVedSotr, frmVedSotr);
  except
    Application.CreateForm(TfrmVedSotr, frmVedSotr);
  end;
end;

procedure TfrmMain.N23Click(Sender: TObject);
begin
  try
    if Assigned(frmSvodVed) then
      frmSvodVed.Show
    else
      Application.CreateForm(TfrmSvodVed, frmSvodVed);
  except
    Application.CreateForm(TfrmSvodVed, frmSvodVed);
  end;
end;

procedure TfrmMain.N24Click(Sender: TObject);
begin
  try
    if Assigned(frmVedSmena) then
      frmVedSmena.Show
    else
      Application.CreateForm(TfrmVedSmena, frmVedSmena);
  except
    Application.CreateForm(TfrmVedSmena, frmVedSmena);
  end;
end;

procedure TfrmMain.N25Click(Sender: TObject);
begin
  try
    if Assigned(frmSprCross) then
      frmSprRaion.Show
    else
      Application.CreateForm(TfrmSprCross, frmSprCross);
  except
    Application.CreateForm(TfrmSprCross, frmSprCross);
  end;
end;

procedure TfrmMain.N3Click(Sender: TObject);
begin
  try
    if Assigned(frmSprSotr) then
      frmSprSotr.Show
    else
      Application.CreateForm(TfrmSprSotr, frmSprSotr);
  except
    Application.CreateForm(TfrmSprSotr, frmSprSotr);
  end;
end;

procedure TfrmMain.N5Click(Sender: TObject);
begin
  Application.CreateForm(TfrmModuleInfo, frmModuleInfo);
  try
    frmModuleInfo.ShowModal;
  finally
    frmModuleInfo.Free;
  end;
end;

procedure TfrmMain.N6Click(Sender: TObject);
begin
  try
    if Assigned(frmSysParams) then
      frmSysParams.Show
    else
      Application.CreateForm(TfrmSysParams, frmSysParams);
  except
    Application.CreateForm(TfrmSysParams, frmSysParams);
  end;
end;

procedure TfrmMain.N7Click(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);   // !!! зачем здесь указание города ???
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select fc_value from taxi.tparams where fc_key = ''TOWN'' ';
    ods.Open;
    if ods.RecordCount = 0 then
      begin
        MessageDlg('Внимание!'+#13+#10+'Чтобы загрузить справочник улиц необходимо указать "Город" в системном справочнике!', mtWarning, [mbOK], 0);
        exit;
      end;
    try
      if Assigned(frmSprStreet) then
        begin
          frmSprStreet.Show
        end else
        begin
          Application.CreateForm(TfrmSprStreet, frmSprStreet);
          frmSprStreet.DoShowForm(StrToInt(copy(ods.FieldByName('fc_value').AsString, 1, Pos(';', ods.FieldByName('fc_value').AsString)-1)));
        end;
    except
      Application.CreateForm(TfrmSprStreet, frmSprStreet);
      frmSprStreet.DoShowForm(StrToInt(copy(ods.FieldByName('fc_value').AsString, 1, Pos(';', ods.FieldByName('fc_value').AsString)-1)));
    end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.N8Click(Sender: TObject);
begin
  try
    if Assigned(frmSprPlaces) then
      frmSprPlaces.Show
    else
      Application.CreateForm(TfrmSprPlaces, frmSprPlaces);
  except
    Application.CreateForm(TfrmSprPlaces, frmSprPlaces);
  end;
end;

procedure TfrmMain.N9Click(Sender: TObject);
begin
  try
    if Assigned(frmSprTarif) then
      frmSprTarif.Show
    else
      Application.CreateForm(TfrmSprTarif, frmSprTarif);
  except
    Application.CreateForm(TfrmSprTarif, frmSprTarif);
  end;
end;

end.
