unit fReasonStop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, Menus, cxLookAndFeelPainters,
  ActnList, StdCtrls, cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMemo;

type
  TfrmReasonStop = class(TForm)
    memReason: TcxMemo;
    bSave: TcxButton;
    cxButton1: TcxButton;
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure memReasonPropertiesChange(Sender: TObject);
    procedure memReasonClick(Sender: TObject);
    procedure memReasonEnter(Sender: TObject);
  private
    Russian : HKL;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReasonStop: TfrmReasonStop;

implementation

{$R *.dfm}

procedure TfrmReasonStop.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmReasonStop.aSaveExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmReasonStop.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);
  aSave.Enabled := False;
end;

procedure TfrmReasonStop.memReasonClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmReasonStop.memReasonEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmReasonStop.memReasonPropertiesChange(Sender: TObject);
begin
  if memReason.Lines.Text <> '' then
    aSave.Enabled := True
  else
    aSave.Enabled := False;
end;

end.
