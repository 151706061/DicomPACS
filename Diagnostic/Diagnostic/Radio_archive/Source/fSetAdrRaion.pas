unit fSetAdrRaion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, ExtCtrls, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Menus, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  dxSkinsCore, dxSkinOffice2007Green, dxSkinscxPCPainter;

type
  TfrmSetAdrRaion = class(TForm)
    dsList: TDataSource;
    odsList: TOracleDataSet;
    tvList: TcxGridDBTableView;
    grListLevel1: TcxGridLevel;
    grList: TcxGrid;
    Panel1: TPanel;
    bSet: TcxButton;
    bCancel: TcxButton;
    al: TActionList;
    aSet: TAction;
    aCancel: TAction;
    tvListName: TcxGridDBColumn;
    procedure aSetExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  frmSetAdrRaion: TfrmSetAdrRaion;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetAdrRaion.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetAdrRaion.aSetExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetAdrRaion.FormCreate(Sender: TObject);
begin
  if odsList.Active = False then
    odsList.Active := True;
  aSet.Enabled := odsList.RecordCount <> 0;   
end;

procedure TfrmSetAdrRaion.tvListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aSetExecute(nil);
end;

procedure TfrmSetAdrRaion.tvListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    aSetExecute(nil);
end;

end.
