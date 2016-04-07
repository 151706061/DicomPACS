unit fNaz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, dxSkinsCore, dxSkinsDefaultPainters,
  cxVGrid, cxControls, cxInplaceContainer, ExtCtrls, dxSkinsdxBarPainter, dxBar,
  cxClasses, cxTextEdit, Menus, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, cxBarEditItem, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid, cxContainer,
  dxBarExtItems, Oracle, OracleData, cxDBLookupComboBox, cxCalendar, cxTimeEdit,
  cxLabel;

type
  TfrmNaz = class(TForm)
    cxVerticalGrid1: TcxVerticalGrid;
    merFIOMK: TcxMultiEditorRow;
    merDateAgeSex: TcxMultiEditorRow;
    catPac: TcxCategoryRow;
    rowKab: TcxEditorRow;
    merDateTime: TcxMultiEditorRow;
    catNaz: TcxCategoryRow;
    Panel1: TPanel;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbClear: TdxBarButton;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    tv: TcxGridDBTableView;
    cxgrLevel1: TcxGridLevel;
    cxgr: TcxGrid;
    tvName: TcxGridDBColumn;
    aClear: TAction;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    paFilter: TPanel;
    Label1: TLabel;
    teFilter: TcxTextEdit;
    odsKab: TOracleDataSet;
    odsNaz: TOracleDataSet;
    dsKab: TDataSource;
    dsNaz: TDataSource;
    rowType: TcxEditorRow;
    odsType: TOracleDataSet;
    dsType: TDataSource;
    Panel2: TPanel;
    bOk: TcxButton;
    bCancel: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aClearExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure odsKabBeforeOpen(DataSet: TDataSet);
    procedure odsNazBeforeOpen(DataSet: TDataSet);
    procedure teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tvCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure odsNazAfterOpen(DataSet: TDataSet);
    procedure teFilterEnter(Sender: TObject);
    procedure teFilterClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure DoShowForm(sPacFIO : string; dDateBirth : TDateTime; nAge : Integer; sSex : string; nPacID : Integer);
    { Public declarations }
  end;

var
  frmNaz: TfrmNaz;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmNaz.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmNaz.aClearExecute(Sender: TObject);
begin
  teFilter.Text := '';
  odsNaz.Filtered := False;
end;

procedure TfrmNaz.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmNaz.DoShowForm(sPacFIO: string; dDateBirth : TDateTime; nAge : Integer; sSex : string; nPacID : Integer);
var ods : TOracleDataSet;
begin
  Screen.Cursor := crSQLWait;
  ods := TOracleDataSet.Create(nil);
  ods.Session := frmMain.os;
  ods.Cursor := crSQLWait;
  try
    ods.SQL.Text := ' select asu.get_ib(:pfk_pacid) as nummk,'+#13+
                    '        sysdate '+#13+
                    '   from dual ';
    ods.DeclareAndSet('pfk_pacid', otInteger, nPacID);
    ods.Open;
    merFIOMK.Properties.Editors[1].Value := ods.FieldByName('nummk').AsString;
    merFIOMK.Properties.Editors[0].Value := sPacFIO;
    merDateAgeSex.Properties.Editors[0].Value := dDateBirth;
    merDateAgeSex.Properties.Editors[1].Value := nAge;
    merDateAgeSex.Properties.Editors[2].Value := sSex;
    merDateTime.Properties.Editors[0].Value := ods.FieldByName('sysdate').AsDateTime;
    merDateTime.Properties.Editors[1].Value := ods.FieldByName('sysdate').AsDateTime;
    rowKab.Properties.Value := frmMain.odsKab.FieldByName('fk_id').AsInteger;
    rowType.Properties.Value := get_nazplan;
  finally
    Screen.Cursor := crDefault;
    ods.Free;
  end;
end;

procedure TfrmNaz.FormCreate(Sender: TObject);
begin
  if odsKab.Active = False then
    odsKab.Active := True;
  if odsNaz.Active = False then
    odsNaz.Active := True;
  if odsType.Active = False then
    odsType.Active := True;  
end;

procedure TfrmNaz.odsKabBeforeOpen(DataSet: TDataSet);
begin
  odsKab.SetVariable('pSOTR', frmMain.pSOTRID);
end;

procedure TfrmNaz.odsNazAfterOpen(DataSet: TDataSet);
begin
  aOk.Enabled := odsNaz.RecordCount <> 0; 
end;

procedure TfrmNaz.odsNazBeforeOpen(DataSet: TDataSet);
begin
  odsNaz.SetVariable('pshowanal', listdiagnost_addnazshowanal);
  odsNaz.SetVariable('PFK_SOTRID', frmMain.pSotrID);
end;

procedure TfrmNaz.teFilterClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Russian, KLF_REORDER);
end;

procedure TfrmNaz.teFilterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Russian, KLF_REORDER);
end;

procedure TfrmNaz.teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  odsNaz.Filtered := False;
  if length(teFilter.Text) > 0 then
    begin
      odsNaz.Filter := 'namenaz = ''*' + AnsiLowerCase(teFilter.Text) + '*'' ';
      odsNaz.Filtered := True;
      aClear.Enabled := True;
    end else
      aClear.Enabled := False;
  if odsNaz.recordCount > 0 then
    begin
       teFilter.Style.Font.Color := clBlack;
       aOk.Enabled := True;
    end else
    begin
       teFilter.Style.Font.Color := clRed;
       aOk.Enabled := False;
    end;
end;

procedure TfrmNaz.tvCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aOkExecute(nil);
end;

procedure TfrmNaz.tvKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if aOk.Enabled = True then
    begin
      if Key = VK_RETURN then  
        aOkExecute(nil);
    end;
end;

end.
