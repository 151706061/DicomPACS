unit fSetChar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Menus,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, OracleData,
  ExtCtrls, cxTextEdit, cxContainer, cxLabel;

type
  TfrmSetChar = class(TForm)
    TVCHAR: TcxGridDBTableView;
    grCharLevel1: TcxGridLevel;
    grChar: TcxGrid;
    al: TActionList;
    aOK: TAction;
    aCancel: TAction;
    ds: TDataSource;
    ods: TOracleDataSet;
    VNAME: TcxGridDBColumn;
    Panel1: TPanel;
    bOk: TcxButton;
    cxButton1: TcxButton;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    teFilter: TcxTextEdit;
    cxButton2: TcxButton;
    aClear: TAction;
    grdbtvID: TcxGridDBColumn;
    odsArea: TOracleDataSet;
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure TVCHARCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TVCHARKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure odsBeforeOpen(DataSet: TDataSet);
    procedure teFilterClick(Sender: TObject);
    procedure teFilterEnter(Sender: TObject);
    procedure teFilterPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    pSyn : String;
    orads : toracledataset;
    { Private declarations }
  public
    procedure DoShowForm(sSyn : string);
    { Public declarations }
  end;

var
  frmSetChar: TfrmSetChar;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetChar.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetChar.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetChar.DoShowForm(sSyn: string);
begin
  pSyn := sSyn;
  if sSyn = 'AREA' then
   begin
     ods.close;
     ds.DataSet := odsArea;
     odsArea.Close;
     odsArea.Open;
     orads := odsArea;
   end
  else
   begin
     ds.DataSet := ods;
     if ods.Active = False then
       ods.Active := True;
     orads := ods;
   end;
end;

procedure TfrmSetChar.FormShow(Sender: TObject);
begin
  teFilter.SetFocus;
end;

procedure TfrmSetChar.odsBeforeOpen(DataSet: TDataSet);
begin
  ods.SetVariable('pfc_synonim', pSyn);
end;

procedure TfrmSetChar.teFilterClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Russian, KLF_REORDER);
end;

procedure TfrmSetChar.teFilterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Russian, KLF_REORDER);
end;

procedure TfrmSetChar.teFilterPropertiesChange(Sender: TObject);
begin
  orads.Filtered := False;
  if length(teFilter.Text) > 0 then
    begin
      orads.Filter := 'lowername = ''*' + teFilter.Text + '*'' ';
      orads.Filtered := True;
      aClear.Enabled := True;
    end else
    begin
      aClear.Enabled := False;
    end;
  if ods.RecordCount > 0 then
    begin
      aOK.Enabled := True;
      teFilter.Style.Font.Color := clBlack;
    end else
    begin
      aOK.Enabled := False;
      teFilter.Style.Font.Color := clRed;
    end;
end;

procedure TfrmSetChar.TVCHARCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aOKExecute(nil);
end;

procedure TfrmSetChar.TVCHARKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
      if orads.RecordCount > 0 then    
        aOKExecute(nil);
    end;
end;

end.
