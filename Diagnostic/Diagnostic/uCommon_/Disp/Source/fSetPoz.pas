unit fSetPoz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinCaramel, dxSkinCoffee,
  dxSkinOffice2007Green, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, ExtCtrls, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Menus, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, OracleData, cxLabel;

type
  TfrmSetPoz = class(TForm)
    tvList: TcxGridDBTableView;
    grListLevel1: TcxGridLevel;
    grList: TcxGrid;
    Panel2: TPanel;
    bOk: TcxButton;
    cxButton1: TcxButton;
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    dsList: TDataSource;
    odsList: TOracleDataSet;
    tvListName: TcxGridDBColumn;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure odsListBeforeOpen(DataSet: TDataSet);
    procedure tvListCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetPoz: TfrmSetPoz;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetPoz.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetPoz.aSaveExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetPoz.FormCreate(Sender: TObject);
begin
  if odsList.Active = False then
    odsList.Active := True;  
end;

procedure TfrmSetPoz.odsListBeforeOpen(DataSet: TDataSet);
begin
  odsList.SetVariable('pfk_taxiid', frmMain.pTaxiID);
end;

procedure TfrmSetPoz.tvListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aSaveExecute(nil);
end;

procedure TfrmSetPoz.tvListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
    aSaveExecute(nil);
end;

end.
