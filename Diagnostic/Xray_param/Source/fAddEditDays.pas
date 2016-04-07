unit fAddEditDays;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, cxControls,
  cxContainer, cxEdit, cxLabel, cxSpinEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList;

type
  TfrmAddEditDays = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    beOtdel: TcxButtonEdit;
    seDays: TcxSpinEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    al: TActionList;
    aSet: TAction;
    aCancel: TAction;
    procedure aSetExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure beOtdelPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditDays: TfrmAddEditDays;

implementation

uses fSetOtdel;

{$R *.dfm}

procedure TfrmAddEditDays.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditDays.aSetExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmAddEditDays.beOtdelPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmSetOtdel, frmSetOtdel);
  try
    if frmSetOtdel.odsOtdel.Active = False then
      frmSetOtdel.odsOtdel.Open;
    frmSetOtdel.ShowModal;
    if frmSetOtdel.ModalResult = mrOk then
      begin
        beOtdel.Text := frmSetOtdel.odsOtdel.FieldByName('fc_name').AsString;
        beOtdel.Tag := frmSetOtdel.odsOtdel.FieldByName('fk_id').AsInteger;
      end;
  finally
    frmSetOtdel.Free;
  end;
end;

end.
