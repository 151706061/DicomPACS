unit fAddEditDrv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ActnList, cxMaskEdit, cxSpinEdit, cxTimeEdit, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxLabel, ExtCtrls, cxDropDownEdit, cxCalendar, cxMemo,
  cxCheckBox, dxSkinCaramel, dxSkinOffice2007Green;

type
  TfrmAddEditDrv = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    bOk: TcxButton;
    cxButton1: TcxButton;
    cxLabel6: TcxLabel;
    teFio: TcxTextEdit;
    cxLabel7: TcxLabel;
    teAuto: TcxTextEdit;
    cxLabel8: TcxLabel;
    teYear: TcxTextEdit;
    deIn: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel9: TcxLabel;
    deOut: TcxDateEdit;
    deMed: TcxDateEdit;
    de20: TcxDateEdit;
    deLic: TcxDateEdit;
    cxLabel10: TcxLabel;
    tePhone: TcxTextEdit;
    cxLabel11: TcxLabel;
    memCom: TcxMemo;
    cbBag: TcxCheckBox;
    cbTros: TcxCheckBox;
    meName: TcxMaskEdit;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditDrv: TfrmAddEditDrv;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmAddEditDrv.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditDrv.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmAddEditDrv.FormCreate(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

end.
