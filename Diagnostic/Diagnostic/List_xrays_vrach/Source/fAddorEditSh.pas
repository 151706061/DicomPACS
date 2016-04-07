unit fAddorEditSh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinOffice2007Green, cxMemo, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxLabel, ExtCtrls, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, ActnList;

type
  TfrmAddorEditSh = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    teName: TcxTextEdit;
    memText: TcxMemo;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure teNameClick(Sender: TObject);
    procedure teNameEnter(Sender: TObject);
    procedure memTextEnter(Sender: TObject);
    procedure memTextClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddorEditSh: TfrmAddorEditSh;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmAddorEditSh.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddorEditSh.aSaveExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmAddorEditSh.memTextClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmAddorEditSh.memTextEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmAddorEditSh.teNameClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmAddorEditSh.teNameEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

end.
