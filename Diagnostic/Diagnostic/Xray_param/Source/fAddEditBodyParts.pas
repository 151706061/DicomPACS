unit fAddEditBodyParts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, cxControls,
  cxContainer, cxEdit, cxLabel, cxTextEdit, Menus, cxLookAndFeelPainters,
  ActnList, StdCtrls, cxButtons;

type
  TfrmAddEditBodyParts = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    teName: TcxTextEdit;
    teNameEng: TcxTextEdit;
    bOk: TcxButton;
    cxButton1: TcxButton;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure teNameClick(Sender: TObject);
    procedure teNameEnter(Sender: TObject);
    procedure teNameEngEnter(Sender: TObject);
    procedure teNameEngClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditBodyParts: TfrmAddEditBodyParts;

implementation
uses fMain;  
{$R *.dfm}

procedure TfrmAddEditBodyParts.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditBodyParts.aOkExecute(Sender: TObject);
begin
  if trim(teName.Text) = '' then
    begin
      MessageDlg('Внимание!'+#13+#10+'Перед сохранением необходимо заполнить поле "Наименование"!', mtInformation, [mbOK], 0);
      teName.SetFocus;
      exit;
    end;
  if trim(teNameEng.Text) = '' then
    begin
      MessageDlg('Внимание!'+#13+#10+'Перед сохранением необходимо заполнить поле "Наименование (англ.)"!', mtInformation, [mbOK], 0);
      teNameEng.SetFocus;
      exit;
    end;
  ModalResult := mrOk;
end;

procedure TfrmAddEditBodyParts.teNameClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmAddEditBodyParts.teNameEngClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Latin, KLF_REORDER);
end;

procedure TfrmAddEditBodyParts.teNameEngEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Latin, KLF_REORDER);
end;

procedure TfrmAddEditBodyParts.teNameEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

end.
