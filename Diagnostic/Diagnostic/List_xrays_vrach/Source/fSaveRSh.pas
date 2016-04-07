unit fSaveRSh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinOffice2007Green, cxControls, cxContainer, cxEdit,
  cxLabel, ExtCtrls, cxTextEdit, Menus, cxLookAndFeelPainters, ActnList,
  StdCtrls, cxButtons;

type
  TfrmSaveRSh = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    teName: TcxTextEdit;
    bSave: TcxButton;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    cxButton1: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure teNameEnter(Sender: TObject);
    procedure teNameClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSaveRSh: TfrmSaveRSh;

implementation

uses fMain;

{$R *.dfm}

procedure TfrmSaveRSh.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSaveRSh.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSaveRSh.teNameClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSaveRSh.teNameEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

end.
