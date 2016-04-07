unit fSetIssl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, OracleData, ActnList,
  dxSkinOffice2007Green, ExtCtrls;

type
  TfrmSetIssl = class(TForm)
    tvIssl: TcxGridDBTableView;
    grIsslLevel1: TcxGridLevel;
    grIssl: TcxGrid;
    odsIssl: TOracleDataSet;
    dsIssl: TDataSource;
    tvIssl_NAME: TcxGridDBColumn;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure tvIsslCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvIsslKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetIssl: TfrmSetIssl;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetIssl.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetIssl.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetIssl.FormCreate(Sender: TObject);
begin
  if odsIssl.Active = False then
    odsIssl.Active := True;  
end;

procedure TfrmSetIssl.tvIsslCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aOkExecute(nil);
end;

procedure TfrmSetIssl.tvIsslKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    aOkExecute(nil);
end;

end.
