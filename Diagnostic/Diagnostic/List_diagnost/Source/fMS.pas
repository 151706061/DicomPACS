unit fMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, dxSkinsCore, dxSkinsDefaultPainters,
  cxVGrid, cxControls, cxInplaceContainer, cxDBLookupComboBox, cxEdit, Menus,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, DB, OracleData,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls;

type
  TfrmMS = class(TForm)
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    dsMs: TDataSource;
    odsMs: TOracleDataSet;
    tvMs: TcxGridDBTableView;
    grMsLevel1: TcxGridLevel;
    grMs: TcxGrid;
    tvName: TcxGridDBColumn;
    tvSpec: TcxGridDBColumn;
    Panel1: TPanel;
    bOk: TcxButton;
    bCancel: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure odsMsBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure odsMsAfterOpen(DataSet: TDataSet);
    procedure tvMsCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvMsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMS: TfrmMS;

implementation

uses fMain;

{$R *.dfm}

procedure TfrmMS.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmMS.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmMS.FormCreate(Sender: TObject);
begin
  if odsMs.Active = False then
    odsMs.Active := True;
  odsMs.Open;  
end;

procedure TfrmMS.odsMsAfterOpen(DataSet: TDataSet);
begin
  aOk.Enabled := odsms.RecordCount <> 0;
end;

procedure TfrmMS.odsMsBeforeOpen(DataSet: TDataSet);
begin
  odsMs.SetVariable('pfk_otdelid', frmMain.pOTDELID);
end;

procedure TfrmMS.tvMsCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aOkExecute(nil);
end;

procedure TfrmMS.tvMsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    aOkExecute(nil); 
end;

end.
