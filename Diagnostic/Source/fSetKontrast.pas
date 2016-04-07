unit fSetKontrast;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit, dxSkinsCore,
  cxInplaceContainer, cxDBTL,
  cxControls, cxTLData, DB, OracleData, ExtCtrls, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, ActnList;

type
  TfrmSetKontrast = class(TForm)
    odsTypeKontrast: TOracleDataSet;
    dsTypeKontrast: TDataSource;
    cxTreeTypeKontrast: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    Panel1: TPanel;
    bOk: TcxButton;
    bCancel: TcxButton;
    al: TActionList;
    aOk: TAction;
    aEsc: TAction;
    procedure aOkExecute(Sender: TObject);
    procedure aEscExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxTreeTypeKontrastFocusedNodeChanged(Sender: TObject;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure cxTreeTypeKontrastDblClick(Sender: TObject);
    procedure cxTreeTypeKontrastKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetKontrast: TfrmSetKontrast;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetKontrast.aEscExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetKontrast.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetKontrast.cxTreeTypeKontrastDblClick(Sender: TObject);
begin
  if aOk.Enabled = True then
    aOkExecute(nil);
end;

procedure TfrmSetKontrast.cxTreeTypeKontrastFocusedNodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
  if AFocusedNode.HasChildren then
    aOk.Enabled := False
  else
    aOk.Enabled := True;
end;

procedure TfrmSetKontrast.cxTreeTypeKontrastKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (aOk.Enabled = True) and (Key = vk_return) then
    aOkExecute(nil);
end;

procedure TfrmSetKontrast.FormCreate(Sender: TObject);
begin
  if odsTypeKontrast.Active = False then
    odsTypeKontrast.Active := True;
end;

end.
