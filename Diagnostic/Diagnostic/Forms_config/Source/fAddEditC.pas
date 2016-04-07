unit fAddEditC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, dxSkinOffice2007Green, cxControls,
  cxContainer, cxEdit, cxLabel, cxTextEdit, Menus, cxLookAndFeelPainters,
  ActnList, StdCtrls, cxButtons;

type
  TfrmAddEditC = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    teName: TcxTextEdit;
    teSyn: TcxTextEdit;
    teTable: TcxTextEdit;
    bOk: TcxButton;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    cxButton1: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditC: TfrmAddEditC;

implementation

{$R *.dfm}

procedure TfrmAddEditC.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditC.aOkExecute(Sender: TObject);
begin
  if teSyn.Text = '' then
    begin
      MessageDlg('Внимание!'+#13+#10+'Поле "Синоним" обязательное для заполнения!', mtInformation, [mbOK], 0);
      teSyn.SetFocus;
      exit;
    end;

  if teSyn.Text = '' then
    begin
      MessageDlg('Внимание!'+#13+#10+'Поле "Таблица" обязательное для заполнения!', mtInformation, [mbOK], 0);
      teTable.SetFocus;
      exit;
    end;

  ModalResult := mrOk;
end;

end.
