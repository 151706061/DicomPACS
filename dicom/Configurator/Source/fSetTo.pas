unit fSetTo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinOffice2007Green, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, ExtCtrls, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Menus,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, FIBDataSet, pFIBDataSet,
  dxSkinBlack;

type
  TfrmSetTo = class(TForm)
    tvList: TcxGridDBTableView;
    grListLevel1: TcxGridLevel;
    grList: TcxGrid;
    Panel1: TPanel;
    bOk: TcxButton;
    cxButton1: TcxButton;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    tvListName: TcxGridDBColumn;
    pFIBTo: TpFIBDataSet;
    dsTo: TDataSource;
    pFIBToFC_IP: TFIBStringField;
    pFIBToFK_ID: TFIBIntegerField;
    pFIBToFN_PORT: TFIBIntegerField;
    pFIBToFC_TITLE: TFIBStringField;
    pFIBToFC_COMMENT: TFIBStringField;
    procedure aCancelExecute(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
    procedure tvListCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetTo: TfrmSetTo;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetTo.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetTo.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetTo.FormCreate(Sender: TObject);
begin
  if pFIBTo.Active = False then
    pFIBTo.Active := True;
end;

procedure TfrmSetTo.tvListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aOkExecute(nil);
end;

procedure TfrmSetTo.tvListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
    begin
      aOkExecute(nil);
    end;
end;

end.

