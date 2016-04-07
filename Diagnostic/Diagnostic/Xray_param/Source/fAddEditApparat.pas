unit fAddEditApparat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxClasses, ActnList, cxControls, cxContainer,
  cxEdit, cxLabel, cxMaskEdit, cxButtonEdit, cxTextEdit, dxSkinsCore,
  dxSkinsdxBarPainter, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons;

type
  TfrmAddEditApparat = class(TForm)
    Panel1: TPanel;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    teName: TcxTextEdit;
    teAE: TcxTextEdit;
    teIP: TcxTextEdit;
    beKab: TcxButtonEdit;
    Panel2: TPanel;
    bCancel: TcxButton;
    bOk: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure beKabPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditApparat: TfrmAddEditApparat;

implementation
uses fMain, fSetKabinet;
{$R *.dfm}

procedure TfrmAddEditApparat.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditApparat.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmAddEditApparat.beKabPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmSetKabinet, frmSetKabinet);
  try
    frmSetKabinet.ShowModal;
    if frmSetKabinet.ModalResult = mrOK then
      begin
        beKab.Tag := frmSetKabinet.odsKab.FieldByName('fk_id').AsInteger;
        beKab.EditValue := frmSetKabinet.odsKab.FieldByName('fc_name').AsString;
      end;
  finally
    frmSetKabinet.Free;
  end;
end;

end.
