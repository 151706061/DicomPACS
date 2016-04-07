unit fSetSotr;

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
    Panel1: TPanel;
    teFilter: TcxTextEdit;
    cxLabel1: TcxLabel;
    procedure actSetExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure TVSOTRDblClick(Sender: TObject);
    procedure TVSOTRKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmSetSotr.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);
//  if odsSotr.Active = False then
//    odsSotr.Open;
end;

procedure TfrmSetSotr.FormShow(Sender: TObject);
begin
  teFilter.SetFocus;
end;

procedure TfrmSetSotr.teFilterClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmSetSotr.teFilterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmSetSotr.teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  odsSotr.Filtered := False;
  if length(teFilter.Text) > 0 then
    begin
      odsSotr.Filter := 'fc_fam_up = ''*' + AnsiUpperCase(teFilter.Text) + '*'' ';
      odsSotr.Filtered := true;
      actSet.Enabled := odsSotr.RecordCount <> 0;
    end;
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
