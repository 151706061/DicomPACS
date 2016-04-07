unit fSetSotr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, dxBar,
  cxClasses, ActnList, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, OracleData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxControls, cxGridCustomView, cxGrid, Menus, dxSkinOffice2007Green;

type
  TfrmSetSotr = class(TForm)
    dxBM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    dxBMBar1: TdxBar;
    bbOk: TdxBarButton;
    bbCancel: TdxBarButton;
    actlst1: TActionList;
    actSet: TAction;
    actCancel: TAction;
    TVSOTR: TcxGridDBTableView;
    cxGrZavOtdelLevel1: TcxGridLevel;
    cxGrZavOtdel: TcxGrid;
    VSOTRFIO: TcxGridDBColumn;
    odsSotr: TOracleDataSet;
    dsSotr: TDataSource;
    VSOTRSPEC: TcxGridDBColumn;
    VSOTROTDEL: TcxGridDBColumn;
    pmTV: TPopupMenu;
    N1: TMenuItem;                            
    procedure actSetExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure TVSOTRDblClick(Sender: TObject);
    procedure TVSOTRKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cxGrZavOtdelEnter(Sender: TObject);
    procedure TVSOTRCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetSotr: TfrmSetSotr;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetSotr.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetSotr.actSetExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetSotr.cxGrZavOtdelEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSetSotr.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TVSOTR.StoreToRegistry('\SoftWare\SoftMaster\Sotr_talons\fSetSotr\TVLISTSotr_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVLIST');
end;

procedure TfrmSetSotr.FormCreate(Sender: TObject);
begin
  if odsSotr.Active = False then
    odsSotr.Open;
  TVSOTR.StoreToRegistry('\SoftWare\SoftMaster\Sotr_talons\fSetSotr\TVLISTSotr_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TVLIST');
  TVSOTR.RestoreFromRegistry('\SoftWare\SoftMaster\Sotr_talons\fSetSotr\TVLISTSotr_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmSetSotr.N1Click(Sender: TObject);
begin
  TVSOTR.RestoreFromRegistry('\SoftWare\SoftMaster\Sotr_talons\fSetSotr\TVLISTSotr_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmSetSotr.TVSOTRCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSetSotr.TVSOTRDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetSotr.TVSOTRKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    ModalResult := mrOk;
end;

end.
