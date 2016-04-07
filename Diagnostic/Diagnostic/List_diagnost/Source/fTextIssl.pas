unit fTextIssl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxContainer, cxTextEdit, cxMemo,
  cxVGrid, cxControls, cxInplaceContainer, Menus, cxLookAndFeelPainters,
  ActnList, StdCtrls, cxButtons, ClipBrd;

type
  TfrmTextIssl = class(TForm)
    vGr: TcxVerticalGrid;
    rowPac: TcxEditorRow;
    rowIssl: TcxEditorRow;
    rowDate: TcxEditorRow;
    mText: TcxMemo;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    al: TActionList;
    aCopy: TAction;
    aEsc: TAction;
    pm: TPopupMenu;
    N1: TMenuItem;
    procedure aCopyExecute(Sender: TObject);
    procedure aEscExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTextIssl: TfrmTextIssl;

implementation

uses fMain;

{$R *.dfm}

procedure TfrmTextIssl.aCopyExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmTextIssl.aEscExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmTextIssl.N1Click(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
  Clipboard.AsText := mText.Text;
end;

end.
