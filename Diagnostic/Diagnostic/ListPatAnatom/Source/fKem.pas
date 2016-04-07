unit fKem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, cxGraphics, cxCustomData,
  cxStyles, cxTL, cxMaskEdit, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxInplaceContainer, cxDBTL, cxTLData, cxTextEdit, cxControls, cxContainer,
  cxEdit, cxLabel, ActnList, DB, OracleData, dxSkinOffice2007Green, ExtCtrls;

type
  TfrmKem = class(TForm)
    cxKem: TcxDBTreeList;
    cxDBTreeListColumn1: TcxDBTreeListColumn;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    odsKem: TOracleDataSet;
    dsKem: TDataSource;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    teFilter: TcxTextEdit;
    Panel2: TPanel;
    bOK: TcxButton;
    bCancel: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxKemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxKemDblClick(Sender: TObject);
    procedure teFilterClick(Sender: TObject);
    procedure teFilterEnter(Sender: TObject);
    procedure cxKemFocusedNodeChanged(Sender: TObject; APrevFocusedNode,
      AFocusedNode: TcxTreeListNode);
  private
    Russian : HKL;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKem: TfrmKem;

implementation

{$R *.dfm}

procedure TfrmKem.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmKem.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmKem.cxKemDblClick(Sender: TObject);
begin
  if (odsKem.RecordCount > 0) and (aOk.Enabled = True) then
    begin
      aOkExecute(nil);
    end;
end;

procedure TfrmKem.cxKemFocusedNodeChanged(Sender: TObject; APrevFocusedNode,
  AFocusedNode: TcxTreeListNode);
begin
  if odsKem.RecordCount > 0 then
    begin
      if AFocusedNode.HasChildren then
        aOk.Enabled := False
      else
        aOk.Enabled := True;
    end else
    begin
      aOk.Enabled := False;
    end;
end;

procedure TfrmKem.cxKemKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (odsKem.RecordCount > 0) and (aOk.Enabled = True) then
    begin
      aOkExecute(nil);
    end;
end;

procedure TfrmKem.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);
  if odsKem.Active = False then
    odsKem.Active := True;
  cxKem.FullExpand;  
end;

procedure TfrmKem.teFilterClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmKem.teFilterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmKem.teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  odsKem.Filtered := False;
  if length(teFilter.Text) > 0 then
    begin
      odsKem.Filter := 'fc_name_up = ''*' + teFilter.Text + '*'' ';
      odsKem.Filtered := true;
    end;
end;

end.
