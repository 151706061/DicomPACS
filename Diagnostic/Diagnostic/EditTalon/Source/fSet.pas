unit fSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, Menus, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, OracleData, cxTextEdit,
  cxContainer, cxLabel, ExtCtrls, dxSkinOffice2007Green;

type
  TfrmSet = class(TForm)
    TV: TcxGridDBTableView;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    odsList: TOracleDataSet;
    VNAME: TcxGridDBColumn;
    dsList: TDataSource;
    odsTravm: TOracleDataSet;
    paFilter: TPanel;
    cxLabel1: TcxLabel;
    teFilter: TcxTextEdit;
    bClear: TcxButton;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    aClear: TAction;
    procedure aCancelExecute(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
    procedure TVCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TVKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure teFilterClick(Sender: TObject);
    procedure teFilterEnter(Sender: TObject);
    procedure teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure aClearExecute(Sender: TObject);
  private
    Russian : HKL;
    { Private declarations }
  public
    procedure DoShowSet(nSyn : String; nID : Integer);
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

procedure TfrmSet.aClearExecute(Sender: TObject);
begin
  teFilter.Text := '';
  dsList.DataSet.Filtered := False;
  aOK.Enabled := True;
end;

procedure TfrmSet.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSet.DoShowSet(nSyn: String; nID: Integer);
begin
  if dsList.DataSet = odsList then
    begin
      odsList.Close;
      odsList.SetVariable('pfc_synonim', nSyn);
      odsList.Open;
    end;
  if dsList.DataSet = odsTravm then
    begin
      odsTravm.Close;
      odsTravm.SetVariable('pfc_synonim', nSyn);
      odsTravm.Open;
    end;

  if (nId <> 0) and (nId <> -1) then
    odsList.Locate('fk_id', nID, []);
end;

procedure TfrmSet.FormCreate(Sender: TObject);
begin
  Russian:=LoadKeyboardLayout('00000419', 0);
  if dsList.DataSet.Active = False then
    dsList.DataSet.Active := True;
end;

procedure TfrmSet.FormShow(Sender: TObject);
begin
  if paFilter.Visible = True then
    teFilter.SetFocus;
end;

procedure TfrmSet.teFilterClick(Sender: TObject);
begin
  ActivateKeyboardLayout(Russian, KLF_REORDER);
end;

procedure TfrmSet.teFilterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(Russian, KLF_REORDER);
end;

procedure TfrmSet.teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  dsList.DataSet.Filtered := False;
  if length(teFilter.Text) > 0 then
    begin
      dsList.DataSet.Filter := 'LOWERNAME = ''*' + teFilter.Text + '*'' ';
      dsList.DataSet.Filtered := True;
      aClear.Enabled := True;
    end else
    begin
      aClear.Enabled := False;
    end;
  if dsList.DataSet.RecordCount > 0 then
    begin
      aOK.Enabled := True;
      teFilter.Style.Font.Color := clBlack;
    end else
    begin
      aOK.Enabled := False;
      teFilter.Style.Font.Color := clRed;
    end;
end;

procedure TfrmSet.TVCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aOkExecute(nil);
end;

procedure TfrmSet.TVKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    aOkExecute(nil);
end;

end.
