unit fAddEditClient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ActnList, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  cxSpinEdit, cxMaskEdit, cxButtonEdit, dxSkinCaramel, dxSkinOffice2007Green;

type
  TfrmAddEditClient = class(TForm)
    Panel1: TPanel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    teNum: TcxTextEdit;
    cxLabel7: TcxLabel;
    teKod: TcxTextEdit;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    bOk: TcxButton;
    cxButton1: TcxButton;
    beAdr: TcxButtonEdit;
    seNow: TcxSpinEdit;
    seBonus: TcxSpinEdit;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure beAdrPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditClient: TfrmAddEditClient;

implementation
uses fMain, fSetAdr;
{$R *.dfm}

procedure TfrmAddEditClient.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditClient.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmAddEditClient.beAdrPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var sRes : String;
begin
  if AButtonIndex = 0 then
    begin
      sRes := '';
      Application.CreateForm(TfrmSetAdr, frmSetAdr);
      try
        frmSetAdr.ShowModal;
        if frmSetAdr.ModalResult = mrOk then
          begin
            sRes := frmSetAdr.sStreet;
            if frmSetAdr.teHouse.Text <> '' then
              sRes := sRes+' д. '+frmSetAdr.teHouse.Text;
            if frmSetAdr.teHall.Text <> '' then
              sRes := sRes+' п. '+frmSetAdr.teHall.Text;

            beAdr.Text := sRes;
            beAdr.Tag := frmSetAdr.lbAdr.Tag;
          end;
      finally
        frmSetAdr.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      if MessageDlg('Вы хотите очистить поле адреса?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
        begin
          beAdr.Clear;
          beAdr.Tag := 0;
        end;
    end;
end;

procedure TfrmAddEditClient.FormCreate(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

end.
