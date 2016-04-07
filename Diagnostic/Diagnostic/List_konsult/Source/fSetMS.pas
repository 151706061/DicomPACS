unit fSetMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls, cxContainer,
  cxEdit, cxLabel, ExtCtrls, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ActnList, dxSkinsCore, dxSkinOffice2007Green;

type
  TfrmSetMS = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    beMs: TcxButtonEdit;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    Panel2: TPanel;
    bOk: TcxButton;
    bCancel: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure beMsPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetMS: TfrmSetMS;

implementation
uses fMs;
{$R *.dfm}

procedure TfrmSetMS.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetMS.aOkExecute(Sender: TObject);
begin
  if beMs.Tag = 0 then
    begin
      MessageDlg('Внимание!'+#13+#10+'Прежде чем сохранить выберите медсестру!', mtInformation, [mbOK], 0);
      beMs.SetFocus;
      exit;
    end;
  ModalResult := mrOk;
end;

procedure TfrmSetMS.beMsPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmMs, frmMs);
  try
    frmMs.ShowModal;
    if frmMs.ModalResult = mrOk then
      begin
        beMs.Text := frmMs.odsms.FieldByName('fc_name').AsString;
        beMs.Tag := frmMs.odsms.FieldByName('fk_id').AsInteger;
      end;
  finally
    frmMs.Free;
  end; 
end;

end.
