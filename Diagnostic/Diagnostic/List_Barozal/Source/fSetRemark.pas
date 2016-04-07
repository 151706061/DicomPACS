unit fSetRemark;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo,
  ActnList, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  dxSkinOffice2007Green;

type
  TfrmSetRemark = class(TForm)
    memRemark: TcxMemo;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    bOk: TcxButton;
    bCancel: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure memRemarkClick(Sender: TObject);
    procedure memRemarkEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetRemark: TfrmSetRemark;

implementation

uses fMain;

{$R *.dfm}

procedure TfrmSetRemark.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetRemark.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetRemark.memRemarkClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSetRemark.memRemarkEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

end.
