unit fSetUsl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, dxBar,
  cxClasses, ActnList, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, OracleData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxControls, cxGridCustomView, cxGrid, cxLabel, cxContainer, cxTextEdit,
  ExtCtrls, dxSkinOffice2007Green;

type
  TfrmSetUsl = class(TForm)
    dxBM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    dxBMBar1: TdxBar;
    bbOk: TdxBarButton;
    bbCancel: TdxBarButton;
    al: TActionList;
    actSet: TAction;
    actCancel: TAction;
    tvList: TcxGridDBTableView;
    grListLevel1: TcxGridLevel;
    grList: TcxGrid;
    VNAME: TcxGridDBColumn;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    Panel1: TPanel;
    teFilter: TcxTextEdit;
    cxLabel1: TcxLabel;
    procedure actSetExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure tvListDblClick(Sender: TObject);
    procedure tvListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure teFilterClick(Sender: TObject);
    procedure teFilterEnter(Sender: TObject);
    procedure teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    Russian : HKL;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetUsl: TfrmSetUsl;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetUsl.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetUsl.actSetExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetUsl.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);
  if odsList.Active = False then
    odsList.Open;
end;

procedure TfrmSetUsl.FormShow(Sender: TObject);
begin
  teFilter.SetFocus;
end;

procedure TfrmSetUsl.teFilterClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmSetUsl.teFilterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmSetUsl.teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  odsList.Filtered := False;
  if length(teFilter.Text) > 0 then
    begin
      odsList.Filter := 'fc_name_up = ''*' + AnsiUpperCase(teFilter.Text) + '*'' ';
      odsList.Filtered := true;
      actSet.Enabled := odsList.RecordCount <> 0;
    end;
end;

procedure TfrmSetUsl.tvListDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetUsl.tvListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    ModalResult := mrOk;
end;

end.
