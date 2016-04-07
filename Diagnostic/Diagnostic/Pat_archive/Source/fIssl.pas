unit fIssl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, Menus, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, OracleData,
  ExtCtrls, cxCheckBox, StrUtils;

type
  TfrmIssl = class(TForm)
    TV: TcxGridDBTableView;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    VNAME: TcxGridDBColumn;
    al: TActionList;
    aSet: TAction;
    aCancel: TAction;
    dsIssl: TDataSource;
    odsIssl: TOracleDataSet;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    VCHECK: TcxGridDBColumn;
    odsIsslFL_CHECK: TFloatField;
    odsIsslFK_ID: TFloatField;
    odsIsslFC_NAME: TStringField;
    VID: TcxGridDBColumn;
    procedure aSetExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure TVCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TVKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure DoShowForm(pID : string);
    { Public declarations }
  end;

var
  frmIssl: TfrmIssl;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmIssl.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmIssl.aSetExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmIssl.DoShowForm(pID: string);
var i : Integer;
begin
  for i := 0 to tv.DataController.RowCount - 1 do
    begin
      if AnsiContainsStr(pID, IntToStr(VID.DataBinding.DataController.Values[i, VID.Index])) = True  then
        begin
          odsIssl.Locate('fk_id', VID.DataBinding.DataController.Values[i, VID.Index], []);
          odsIssl.Edit;
          odsIssl.FieldByName('fl_check').AsInteger := 1;
          odsIssl.Post;
        end;
    end;
end;

procedure TfrmIssl.FormCreate(Sender: TObject);
begin
  if odsIssl.Active = false then
    odsIssl.Active := true;
end;

procedure TfrmIssl.TVCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
//  aSetExecute(nil);
end;

procedure TfrmIssl.TVKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
//  if key = VK_RETURN then
//    aSetExecute(nil);
end;

end.
