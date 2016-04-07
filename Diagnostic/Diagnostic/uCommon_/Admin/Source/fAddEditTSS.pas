unit fAddEditTSS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ActnList, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  dxSkinCaramel, dxSkinOffice2007Green;

type
  TfrmAddEditTSS = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    teName: TcxTextEdit;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    bOk: TcxButton;
    cxButton1: TcxButton;
    cxLabel2: TcxLabel;
    teSyn: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure teSynClick(Sender: TObject);
    procedure teSynEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditTSS: TfrmAddEditTSS;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmAddEditTSS.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditTSS.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk; // !!! проверка на уже существующий синоним, а нужна ли, если индекс уникальный - проверить
end;

procedure TfrmAddEditTSS.FormCreate(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Russian, KLF_REORDER);
end;

procedure TfrmAddEditTSS.teSynClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Latin, KLF_REORDER);
end;

procedure TfrmAddEditTSS.teSynEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Latin, KLF_REORDER);
end;

end.
