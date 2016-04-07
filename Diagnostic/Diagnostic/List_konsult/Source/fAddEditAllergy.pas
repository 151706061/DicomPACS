unit fAddEditAllergy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxControls, cxContainer, cxEdit, cxLabel, cxGraphics,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ActnList,
  DB, OracleData, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCheckBox, dxBar, StrUtils,
  dxSkinsCore, dxSkinOffice2007Green, dxSkinscxPCPainter, dxSkinsdxBarPainter;

type
  TfrmAddEditAllergy = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    lcbLe: TcxLookupComboBox;
    bOk: TcxButton;
    bCancel: TcxButton;
    al: TActionList;
    aOk: TAction;
    aEsc: TAction;
    peChar: TcxPopupEdit;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    odsListC: TOracleDataSet;
    dsListC: TDataSource;
    odsListCFL_CHECK: TFloatField;
    odsListCFK_ID: TFloatField;
    odsListCFC_NAME: TStringField;
    odsListCFN_ORDER: TFloatField;
    paPopup: TPanel;
    grListChar: TcxGrid;
    tvListChar: TcxGridDBTableView;
    tvListCharCheck: TcxGridDBColumn;
    tvListCharName: TcxGridDBColumn;
    grListCharLevel1: TcxGridLevel;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbSet: TdxBarButton;
    bbCancel: TdxBarButton;
    tvListCharID: TcxGridDBColumn;
    procedure aOkExecute(Sender: TObject);
    procedure aEscExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lcbLePropertiesChange(Sender: TObject);
    procedure bbSetClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure peCharPropertiesPopup(Sender: TObject);
  private
    { Private declarations }
  public
    strID : string;
    { Public declarations }
  end;

var
  frmAddEditAllergy: TfrmAddEditAllergy;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmAddEditAllergy.aEscExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditAllergy.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmAddEditAllergy.bbCancelClick(Sender: TObject);
begin
  peChar.PopupWindow.Close;
end;

procedure TfrmAddEditAllergy.bbSetClick(Sender: TObject);
var i : Integer;
    str : string;
begin
  strID := '';
  for i := 0 to tvListChar.DataController.RecordCount - 1 do
    begin
      if tvListChar.DataController.Values[i, tvListCharCheck.Index] = 1 then
        begin
          str := str + tvListChar.DataController.Values[i, tvListCharName.Index] + ', ';
          strID := strID + IntToStr(tvListChar.DataController.Values[i, tvListCharID.Index]) + ', ';
        end;
    end;
  str := copy(str, 1, Length(str)-2);
  strID := copy(strID, 1, Length(strID)-2);
  peChar.Text := str;
  peChar.PopupWindow.Close;
end;

procedure TfrmAddEditAllergy.FormCreate(Sender: TObject);
begin
  if odsList.Active = False then
    odsList.Active := True;
  if odsListC.Active = False then
    odsListC.Active := True;
end;

procedure TfrmAddEditAllergy.lcbLePropertiesChange(Sender: TObject);
begin
  aOk.Enabled := lcbLe.EditText <> '';
end;

procedure TfrmAddEditAllergy.peCharPropertiesPopup(Sender: TObject);
var i : Integer;
begin
  if strID <> '' then
    begin
      for i := 0 to tvListChar.DataController.RecordCount - 1 do
        begin
          if AnsiContainsStr(strID, tvListChar.DataController.Values[i, tvListCharID.Index]) then
            begin
              odsListC.Locate('fk_id', tvListChar.DataController.Values[i, tvListCharID.Index], []);
              odsListC.Edit;
              odsListC.FieldByName('fl_check').AsInteger := 1;
              odsListC.Post;
            end;
        end;
    end;
end;

end.
