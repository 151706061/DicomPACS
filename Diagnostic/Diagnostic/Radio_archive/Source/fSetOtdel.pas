unit fSetOtdel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit, dxSkinsCore,
  cxInplaceContainer, cxDBTL, cxControls, cxTLData, DB, OracleData, Menus,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxPropertiesStore, dxSkinscxPCPainter, ExtCtrls, dxSkinOffice2007Green;

type
  TfrmSetOtdel = class(TForm)
    dsOtdel: TDataSource;
    odsOtdel: TOracleDataSet;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    cxPropertiesStore1: TcxPropertiesStore;
    tvOtdel: TcxGridDBTableView;
    grOtdelLevel1: TcxGridLevel;
    grOtdel: TcxGrid;
    tvOtdelName: TcxGridDBColumn;
    odsOtdelAmb: TOracleDataSet;
    Panel1: TPanel;
    bOk: TcxButton;
    bCancel: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure tvOtdelCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvOtdelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    Russian : HKL;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetOtdel: TfrmSetOtdel;

implementation

{$R *.dfm}

procedure TfrmSetOtdel.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetOtdel.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetOtdel.FormCreate(Sender: TObject);
begin
  Russian:=LoadKeyboardLayout('00000419', 0);
  ActivateKeyboardLayout(Russian, KLF_REORDER);
end;

procedure TfrmSetOtdel.FormShow(Sender: TObject);
begin
  if odsOtdel.Active = False then
    odsOtdel.Active := True;
end;

procedure TfrmSetOtdel.tvOtdelCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aOkExecute(nil);
end;

procedure TfrmSetOtdel.tvOtdelKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    aOkExecute(nil);
end;

end.
