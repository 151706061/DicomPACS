unit fAddEditSotr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls, Menus,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, cxTextEdit, cxGraphics,
  cxDropDownEdit, cxMaskEdit, cxCalendar, dxSkinCaramel, dxSkinOffice2007Green;

type
  TfrmAddEditSotr = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    teFam: TcxTextEdit;
    teName: TcxTextEdit;
    teOtch: TcxTextEdit;
    bOk: TcxButton;
    cxButton1: TcxButton;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    cxLabel4: TcxLabel;
    teLogin: TcxTextEdit;
    cxLabel5: TcxLabel;
    tePass: TcxTextEdit;
    cxLabel6: TcxLabel;
    teConfirm: TcxTextEdit;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditSotr: TfrmAddEditSotr;

implementation

uses fMain;

{$R *.dfm}

procedure TfrmAddEditSotr.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditSotr.aOkExecute(Sender: TObject);
begin
  if teFam.Text = '' then
    begin
      MessageDlg('Внимание!'+#13+#10+'Вы не указали фамилию пользователя!', mtWarning, [mbOK], 0);
      teFam.SetFocus;
      exit;
    end;
  if teName.Text = '' then
    begin
      MessageDlg('Внимание!'+#13+#10+'Вы не указали имя пользователя!', mtWarning, [mbOK], 0);
      teName.SetFocus;
      exit;
    end;
  if teLogin.Text = '' then
    begin
      MessageDlg('Внимание!'+#13+#10+'Вы не указали логин пользователя!', mtWarning, [mbOK], 0);
      teLogin.SetFocus;
      exit;
    end;
  if tePass.Text = '' then
    begin
      MessageDlg('Внимание!'+#13+#10+'Вы не указали пароль пользователя!', mtWarning, [mbOK], 0);
      tePass.SetFocus;
      exit;
    end;
  if tePass.Text <> teConfirm.Text then
    begin
      MessageDlg('Внимание!'+#13+#10+'Пароль и его подтверждение не совпадают!', mtWarning, [mbOK], 0);
      tePass.SetFocus;
      exit;
    end;
  ModalResult := mrOk;
end;

procedure TfrmAddEditSotr.FormCreate(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Russian, KLF_REORDER);
end;

end.
