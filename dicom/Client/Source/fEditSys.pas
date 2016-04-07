unit fEditSys;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, dxSkinsDefaultPainters, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, ActnList, dxSkinscxPCPainter, cxImage, JvExExtCtrls,
  JvExtComponent, JvPanel, cxPC, dxSkinOffice2007Green, dxSkinBlack;

type
  TfrmEditSys = class(TForm)
    AL: TActionList;
    aSave: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    bSave: TcxButton;
    bCancel: TcxButton;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    teOldPass: TcxTextEdit;
    cxLabel3: TcxLabel;
    tePass: TcxTextEdit;
    cxLabel2: TcxLabel;
    teConfirm: TcxTextEdit;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure teOldPassClick(Sender: TObject);
    procedure teOldPassEnter(Sender: TObject);
    procedure tePassEnter(Sender: TObject);
    procedure tePassClick(Sender: TObject);
    procedure teConfirmClick(Sender: TObject);
    procedure teConfirmEnter(Sender: TObject);
  private
    latin : HKL;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditSys: TfrmEditSys;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmEditSys.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmEditSys.aSaveExecute(Sender: TObject);
begin
  if teOldPass.Text = '' then
    begin
      MessageDlg('Введите старый пароль!', mtWarning, [mbOK], 0);
      teOldPass.SetFocus;
      Exit;
    end;
  if tePass.Text = '' then
    begin
      MessageDlg('Введите новый пароль!', mtWarning, [mbOK], 0);
      tePass.SetFocus;
      Exit;
    end;
  if teConfirm.Text = '' then
    begin
      MessageDlg('Введите подтверждение нового пароля!', mtWarning, [mbOK], 0);
      teConfirm.SetFocus;
      Exit;
    end;
  if teOldPass.Text <> frmMain.sPass then
    begin
      Application.MessageBox('Старый пароль неверен!', 'Внимание!', MB_OK + MB_ICONWARNING);
      teOldPass.Clear;
      teOldPass.SetFocus;
      Exit;
    end;
  ModalResult := mrOk;
end;

procedure TfrmEditSys.FormCreate(Sender: TObject);
begin
  latin:=LoadKeyboardLayout('00000409', 0);
  ActivateKeyboardLayout(latin, KLF_REORDER);
end;

procedure TfrmEditSys.teConfirmClick(Sender: TObject);
begin
  ActivateKeyboardLayout(latin, KLF_REORDER);
end;

procedure TfrmEditSys.teConfirmEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(latin, KLF_REORDER);
end;

procedure TfrmEditSys.teOldPassClick(Sender: TObject);
begin
  ActivateKeyboardLayout(latin, KLF_REORDER);
end;

procedure TfrmEditSys.teOldPassEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(latin, KLF_REORDER);
end;

procedure TfrmEditSys.tePassClick(Sender: TObject);
begin
  ActivateKeyboardLayout(latin, KLF_REORDER);
end;

procedure TfrmEditSys.tePassEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(latin, KLF_REORDER);
end;

end.
