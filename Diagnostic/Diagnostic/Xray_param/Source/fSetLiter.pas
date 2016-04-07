unit fSetLiter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  Menus, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, dxSkinsCore;

type
  TfrmSetLiter = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    lbKab: TcxLabel;
    cxLabel2: TcxLabel;
    teLiter: TcxTextEdit;
    bOk: TcxButton;
    bCancel: TcxButton;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    procedure teLiterKeyPress(Sender: TObject; var Key: Char);
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetLiter: TfrmSetLiter;

implementation

{$R *.dfm}

procedure TfrmSetLiter.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetLiter.aOkExecute(Sender: TObject);
begin
  if teLiter.Text = '' then
    begin
      MessageDlg('Укажите букву-идентификатор кабинета!', mtWarning, [mbOK], 0);
      teLiter.SetFocus;
      exit;
    end;
  ModalResult := mrOk;
end;

procedure TfrmSetLiter.teLiterKeyPress(Sender: TObject; var Key: Char);
begin
  if (key in ['+','=',')','(','*','&','?','>','<','.',',','^',':',';','"','|','%','$','#','@','!','~']) then key:=#0;
  if (key in ['а'..'я','А'..'Я']) then key:=#0;
end;

end.
