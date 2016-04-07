unit fDistrictStreet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsdxBarPainter, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, ActnList, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxBar, OracleData, JvStringHolder, cxCheckBox, cxBarEditItem, Oracle,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer, cxTextEdit,
  ExtCtrls, dxSkinCaramel, dxSkinOffice2007Green, cxLabel;

type
  TfrmDistrictStreet = class(TForm)
    BM: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarButton1: TdxBarButton;
    tvDistrictStreet: TcxGridDBTableView;
    gDistrictStreetL: TcxGridLevel;
    gDistrictStreet: TcxGrid;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    al: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    dxBarButton4: TdxBarButton;
    aRefresh: TAction;
    dxBarButton5: TdxBarButton;
    odsDistrictStreet: TOracleDataSet;
    dsDistrictStreet: TDataSource;
    tvDistrictStreetFK_ID: TcxGridDBColumn;
    tvDistrictStreetFK_RAION: TcxGridDBColumn;
    tvDistrictStreetFK_STREET: TcxGridDBColumn;
    tvDistrictStreetFC_NAME: TcxGridDBColumn;
    tvDistrictStreetFC_MAPNAME: TcxGridDBColumn;
    shDistrictStreet: TJvMultiStringHolder;
    tvDistrictStreetFN_EVENS: TcxGridDBColumn;
    tvDistrictStreetFN_EVENPO: TcxGridDBColumn;
    tvDistrictStreetFN_ODDS: TcxGridDBColumn;
    tvDistrictStreetFN_ODDPO: TcxGridDBColumn;
    cbDoubleOnly: TcxBarEditItem;
    qDeleteDistrict: TOracleQuery;
    Panel1: TPanel;
    Label1: TLabel;
    FilterText: TcxTextEdit;
    btnDelPacFiltr: TcxButton;
    dxBarDockControl1: TdxBarDockControl;
    aClose: TAction;
    bbClose: TdxBarButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure tvDistrictStreetCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cbDoubleOnlyPropertiesChange(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure alUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure btnDelPacFiltrClick(Sender: TObject);
    procedure FilterTextKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FilterTextPropertiesChange(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDistrictStreet: TfrmDistrictStreet;

implementation

uses fMain, fDistrictStreetEdit;

{$R *.dfm}

procedure TfrmDistrictStreet.aAddExecute(Sender: TObject);
var iDistrict:Integer;
begin
  iDistrict := -1;
  if GetDistrict(frmMain.os, iDistrict) then
    begin
      aRefresh.Execute;
      odsDistrictStreet.Locate('fk_id', iDistrict, []);
    end;
end;

procedure TfrmDistrictStreet.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmDistrictStreet.alUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  aEdit.Enabled := (tvDistrictStreet.DataController.Controller.SelectedRecordCount > 0)
    and not(tvDistrictStreet.DataController.Controller.SelectedRecords[0].Expandable);
  aDel.Enabled := (tvDistrictStreet.DataController.Controller.SelectedRecordCount > 0)
    and not(tvDistrictStreet.DataController.Controller.SelectedRecords[0].Expandable);
end;

procedure TfrmDistrictStreet.aDelExecute(Sender: TObject);
begin
  if Application.MessageBox('Удалить выбранную запись?', 'Вопрос', MB_YESNO + 
    MB_ICONQUESTION) = IDNO then
  begin
    Exit;
  end;

  with qDeleteDistrict do
  begin
    SetVariable('pid',odsDistrictStreet.FieldByName('fk_id').AsInteger);
    Execute;
    Session.Commit;
  end;
  aRefresh.Execute;
end;

procedure TfrmDistrictStreet.aEditExecute(Sender: TObject);
var iDistrict:Integer;
begin
  iDistrict := odsDistrictStreet.FieldByName('fk_id').AsInteger;
  if GetDistrict(frmMain.os, iDistrict) then
  begin
    aRefresh.Execute;
    odsDistrictStreet.Locate('fk_id',iDistrict,[]);
  end;
end;

procedure TfrmDistrictStreet.aRefreshExecute(Sender: TObject);
var
  iDistrict:Integer;
begin
  with odsDistrictStreet do
  begin
    iDistrict := FieldByName('fk_id').AsInteger;
    Close;
    Open;
    Locate('fk_id',iDistrict,[]);
  end;
end;

procedure TfrmDistrictStreet.cbDoubleOnlyPropertiesChange(Sender: TObject);
begin
  if (cbDoubleOnly.EditValue) then
  begin
    odsDistrictStreet.SQL.Text := shDistrictStreet.ItemByName['NotAll'].Strings.Text;
  end
  else begin
    odsDistrictStreet.SQL.Text := shDistrictStreet.ItemByName['All'].Strings.Text;
  end;
  aRefresh.Execute;
end;

procedure TfrmDistrictStreet.btnDelPacFiltrClick(Sender: TObject);
begin
    FilterText.Text := '';
    odsDistrictStreet.Filtered := false;
end;

procedure TfrmDistrictStreet.FilterTextKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 38 then
  begin
      tvDistrictStreet.DataController.GotoPrev;
      Exit;
  end;

  if Key = 40 then
  begin
      tvDistrictStreet.DataController.GotoNext;
      Exit;
  end;

  if Key = VK_RETURN then
  begin
      if (aEdit.Enabled) then      
        aEdit.Execute;
      Exit;
  end;

  if Key = VK_LEFT then
  begin
    if (tvDistrictStreet.DataController.Controller.SelectedRecordCount > 0) then
      if (tvDistrictStreet.DataController.Controller.SelectedRecords[0].Expandable) then
        tvDistrictStreet.DataController.Controller.SelectedRecords[0].Collapse(False);
    Exit;
  end;

  if Key = VK_RIGHT then
  begin
    if (tvDistrictStreet.DataController.Controller.SelectedRecordCount > 0) then
      if (tvDistrictStreet.DataController.Controller.SelectedRecords[0].Expandable) then
        tvDistrictStreet.DataController.Controller.SelectedRecords[0].Expand(false);
    Exit;
  end;
end;

procedure TfrmDistrictStreet.FilterTextPropertiesChange(Sender: TObject);
begin
  odsDistrictStreet.Filtered := false;
  if length(FilterText.Text) > 0 then
  begin
    odsDistrictStreet.Filter := 'fc_uppermapname = ''*' + AnsiUpperCase(FilterText.Text) + '*'' ';
    odsDistrictStreet.Filtered := true;
    btnDelPacFiltr.Enabled := True;
  end
  else begin
    btnDelPacFiltr.Enabled := False;
  end;
end;

procedure TfrmDistrictStreet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmDistrictStreet.FormCreate(Sender: TObject);
begin
  cbDoubleOnly.EditValue := false;
  odsDistrictStreet.Close;
  odsDistrictStreet.Open;
end;

procedure TfrmDistrictStreet.FormDestroy(Sender: TObject);
begin
  frmDistrictStreet := nil;
end;

procedure TfrmDistrictStreet.tvDistrictStreetCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  aEdit.Execute;
end;

end.
