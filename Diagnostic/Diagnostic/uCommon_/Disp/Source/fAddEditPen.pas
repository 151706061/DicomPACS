unit fAddEditPen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinCaramel, dxSkinCoffee, dxSkinOffice2007Green,
  Menus, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, cxSpinEdit,
  cxButtonEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls,
  cxContainer, cxEdit, cxLabel, ExtCtrls;

type
  TfrmAddEditPen = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    deDate: TcxDateEdit;
    beDrv: TcxButtonEdit;
    seSum: TcxSpinEdit;
    bOk: TcxButton;
    cxButton1: TcxButton;
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure beDrvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditPen: TfrmAddEditPen;

implementation

uses fSetPoz;

{$R *.dfm}

procedure TfrmAddEditPen.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditPen.aSaveExecute(Sender: TObject);
begin
  if beDrv.Tag = 0 then
    begin
      MessageDlg('Необходимо указать позывной!', mtInformation, [mbOK], 0);
      beDrv.SetFocus;
      exit;
    end;
  ModalResult := mrOk;
end;

procedure TfrmAddEditPen.beDrvPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmSetPoz, frmSetPoz);
  try
    frmSetPoz.ShowModal;
    if frmSetPoz.ModalResult = mrOk then
      begin
        beDrv.Text := frmSetPoz.odsList.FieldByName('fc_name').AsString;
        beDrv.Tag := frmSetPoz.odsList.FieldByName('fk_id').AsInteger;
      end;
  finally
    frmSetPoz.Free;
  end;
end;

end.
