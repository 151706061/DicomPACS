unit fFindDrv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, cxControls,
  cxContainer, cxEdit, cxTextEdit, Menus, cxLookAndFeelPainters, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, StdCtrls, cxRadioGroup, cxButtons,
  ActnList, OracleData, dxSkinCaramel, dxSkinOffice2007Green;

type
  TfrmFindDrv = class(TForm)
    Panel1: TPanel;
    teFind: TcxTextEdit;
    bClear: TcxButton;
    rbFio: TcxRadioButton;
    rbMarka: TcxRadioButton;
    bClose: TcxButton;
    bFind: TcxButton;
    tvFind: TcxGridDBTableView;
    grFindLevel1: TcxGridLevel;
    grFind: TcxGrid;
    al: TActionList;
    aClear: TAction;
    aFind: TAction;
    aClose: TAction;
    odsFind: TOracleDataSet;
    dsFind: TDataSource;
    tvFindName: TcxGridDBColumn;
    tvFindFIO: TcxGridDBColumn;
    tvFindAuto: TcxGridDBColumn;
    rbName: TcxRadioButton;
    tvFindTaxi: TcxGridDBColumn;
    pmGrid: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure aCloseExecute(Sender: TObject);
    procedure aFindExecute(Sender: TObject);
    procedure aClearExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure teFindKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rbFioClick(Sender: TObject);
    procedure rbNameClick(Sender: TObject);
    procedure rbMarkaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure teFindClick(Sender: TObject);
    procedure teFindEnter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N3Click(Sender: TObject);
    procedure tvFindCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFindDrv: TfrmFindDrv;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmFindDrv.aClearExecute(Sender: TObject);
begin
  teFind.Clear;
  aClear.Enabled := False;
  teFind.SetFocus;
  odsFind.Filtered := False;
  aFind.Enabled := odsFind.RecordCount <> 0;
end;

procedure TfrmFindDrv.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmFindDrv.aFindExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmFindDrv.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  tvFind.StoreToRegistry('\SoftWare\TaxiService\Admin\fFindDrvGr', TRUE, [], 'tvFind');
end;

procedure TfrmFindDrv.FormCreate(Sender: TObject);
begin
  if odsFind.Active = False then
    odsFind.Active := True;
  tvFind.StoreToRegistry('\SoftWare\TaxiService\Admin\fFindDrvGr_Default', TRUE, [], 'tvFind');
  tvFind.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fFindDrvGr', FALSE, FALSE, [], 'tvFind');
end;

procedure TfrmFindDrv.FormShow(Sender: TObject);
begin
  rbFio.Checked := True;
end;

procedure TfrmFindDrv.N3Click(Sender: TObject);
begin
  tvFind.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fFindDrvGr_Default', FALSE, FALSE, [], 'tvFind');
end;

procedure TfrmFindDrv.rbFioClick(Sender: TObject);
begin
  teFind.SetFocus;
end;

procedure TfrmFindDrv.rbMarkaClick(Sender: TObject);
begin
  teFind.SetFocus;
end;

procedure TfrmFindDrv.rbNameClick(Sender: TObject);
begin
  teFind.SetFocus;
end;

procedure TfrmFindDrv.teFindClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmFindDrv.teFindEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmFindDrv.teFindKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Length(teFind.Text) > 0 then
    begin
      aClear.Enabled := True;
      if rbFio.Checked then
        odsFind.Filter := 'fc_fio_up = ''*'+teFind.Text+'*'' '; // по ФИО
      if rbName.Checked then
        odsFind.Filter := 'fc_name_up = ''*'+teFind.Text+'*'' '; // по позывному
      if rbMarka.Checked then
        odsFind.Filter := 'fc_auto_up = ''*'+teFind.Text+'*'' '; // по марке, номеру, цвету
      odsFind.Filtered := True;
      aFind.Enabled := odsFind.RecordCount <> 0;
    end else
    begin
      aClear.Enabled := False;
    end;
end;

procedure TfrmFindDrv.tvFindCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aFindExecute(nil);
end;

end.
