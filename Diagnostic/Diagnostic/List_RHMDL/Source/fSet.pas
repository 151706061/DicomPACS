unit fSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ActnList, OracleData;

type
  TfrmSet = class(TForm)
    tvList: TcxGridDBTableView;
    grListLevel1: TcxGridLevel;
    grList: TcxGrid;
    bOk: TcxButton;
    bCancel: TcxButton;
    al: TActionList;
    aOK: TAction;
    aCancel: TAction;
    tvListName: TcxGridDBColumn;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure tvListCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvListEditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    procedure DoShowForm(nJurID : Integer);
    { Public declarations }
  end;

var
  frmSet: TfrmSet;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSet.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSet.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSet.DoShowForm(nJurID: Integer);
begin
  odsList.Close;
  odsList.SetVariable('pfk_rhmdlid', nJurID);
  odsList.Open;
end;

procedure TfrmSet.tvListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aOKExecute(nil);
end;

procedure TfrmSet.tvListEditKeyDown(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    aOKExecute(nil);
end;

end.
