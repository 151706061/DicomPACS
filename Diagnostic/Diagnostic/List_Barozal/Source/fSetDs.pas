unit fSetDs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, Menus, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, OracleData,
  ExtCtrls, dxSkinOffice2007Green;

type
  TfrmSetDs = class(TForm)
    tvDs: TcxGridDBTableView;
    grDsLevel1: TcxGridLevel;
    grDs: TcxGrid;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    odsDs: TOracleDataSet;
    dsDs: TDataSource;
    tvDs_Date: TcxGridDBColumn;
    tvDs_Ds: TcxGridDBColumn;
    tvDs_Kod: TcxGridDBColumn;
    tvDs_Vid: TcxGridDBColumn;
    tvDs_Type: TcxGridDBColumn;
    pmTV: TPopupMenu;
    N2: TMenuItem;
    Panel1: TPanel;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure tvDsCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvDsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetDs: TfrmSetDs;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetDs.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetDs.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetDs.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  tvDs.StoreToRegistry('\SoftWare\SoftMaster\List_barozal\fSetDs\tvDsVrach_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'tvDs');
end;

procedure TfrmSetDs.FormCreate(Sender: TObject);
begin
  tvDs.StoreToRegistry('\SoftWare\SoftMaster\List_barozal\fSetDs\tvDsVrach_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'tvDs');
  tvDs.RestoreFromRegistry('\SoftWare\SoftMaster\List_barozal\fSetDs\tvDsVrach_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'tvDs');
end;

procedure TfrmSetDs.N2Click(Sender: TObject);
begin
  tvDs.RestoreFromRegistry('\SoftWare\SoftMaster\List_barozal\fSetDs\tvDsVrach_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'tvDs');
end;

procedure TfrmSetDs.tvDsCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aOkExecute(nil);
end;

procedure TfrmSetDs.tvDsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    aOkExecute(nil);
end;

end.
