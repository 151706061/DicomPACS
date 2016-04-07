unit fSetNumDrv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxStyles, dxSkinsCore, dxSkinCaramel, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxSplitter, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, OracleData,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList, cxTextEdit,
  cxContainer, cxLabel, cxMaskEdit, cxDropDownEdit, dxSkinOffice2007Green;

type
  TfrmSetNumDrv = class(TForm)
    dsDrv: TDataSource;
    odsDrv: TOracleDataSet;
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    grDrv: TcxGrid;
    tvDrv: TcxGridDBTableView;
    tvDrvNumDrv: TcxGridDBColumn;
    tvDrvFIO: TcxGridDBColumn;
    tvDrvCar: TcxGridDBColumn;
    grDrvLevel1: TcxGridLevel;
    Panel1: TPanel;
    tvDrvTaxiName: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    teFilter: TcxTextEdit;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    cxLabel2: TcxLabel;
    cbFilter: TcxComboBox;
    Panel2: TPanel;
    bbSave: TcxButton;
    bbCancel: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure tvDrvCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvDrvKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N1Click(Sender: TObject);
    procedure teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbFilterPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure teFilterClick(Sender: TObject);
    procedure teFilterEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetNumDrv: TfrmSetNumDrv;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetNumDrv.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetNumDrv.aSaveExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetNumDrv.cbFilterPropertiesChange(Sender: TObject);
begin
  odsDrv.Filtered := False;
  teFilter.Text := '';
  teFilter.SetFocus;
end;

procedure TfrmSetNumDrv.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  tvDrv.StoreToRegistry('\SoftWare\Taxi\Taxi_Archive\fSetNumDrv\ViewGrid', True, [], 'tvDrv');
end;

procedure TfrmSetNumDrv.FormCreate(Sender: TObject);
begin
  if odsDrv.Active = False then
    odsDrv.Active := True;
  cbFilter.Properties.OnChange := nil;
  cbFilter.Text := 'позывному';
  cbFilter.Properties.OnChange := cbFilterPropertiesChange;
  tvDrv.StoreToRegistry('\SoftWare\Taxi\Taxi_Archive\fSetNumDrv\ViewGridDefault', True, [], 'tvDrv');
  tvDrv.RestoreFromRegistry('\SoftWare\Taxi\Taxi_Archive\fSetNumDrv\ViewGrid', False, False, [], 'tvDrv');
end;

procedure TfrmSetNumDrv.FormShow(Sender: TObject);
begin
  teFilter.SetFocus;
end;

procedure TfrmSetNumDrv.N1Click(Sender: TObject);
begin
  tvDrv.RestoreFromRegistry('\SoftWare\Taxi\Taxi_Archive\fSetNumDrv\ViewGridDefault', False, False, [], 'tvDrv');
end;

procedure TfrmSetNumDrv.teFilterClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Russian, KLF_REORDER);
end;

procedure TfrmSetNumDrv.teFilterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Russian, KLF_REORDER);
end;

procedure TfrmSetNumDrv.teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  odsDrv.Filtered := False;
  if cbFilter.Text = 'позывному' then
    odsDrv.Filter := 'fc_name_up = ''*' + teFilter.Text + '*'' ';
  if cbFilter.Text = 'фио' then
    odsDrv.Filter := 'fc_fio_up = ''*' + teFilter.Text + '*'' ';
  if cbFilter.Text = 'машине' then
    odsDrv.Filter := 'fc_auto_up = ''*' + teFilter.Text + '*'' ';

  odsDrv.Filtered := True;
  if odsDrv.RecordCount > 0 then
    begin
      aSave.Enabled := True;
      teFilter.Style.Font.Color := clBlack;
    end else
    begin
      aSave.Enabled := False;
      teFilter.Style.Font.Color := clRed;
    end;
end;

procedure TfrmSetNumDrv.tvDrvCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aSaveExecute(nil);
end;

procedure TfrmSetNumDrv.tvDrvKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    aSaveExecute(nil);
end;

end.
