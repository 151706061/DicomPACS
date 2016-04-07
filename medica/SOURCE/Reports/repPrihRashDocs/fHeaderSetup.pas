unit fHeaderSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMemo, cxRichEdit, ComCtrls, StdCtrls, ToolWin, ImgList, ActnList,
  Menus, cxLookAndFeelPainters, cxButtons, ExtCtrls, cxSplitter, cxGroupBox;

type
  TfmHeaderAndFooter = class(TForm)
    ToolbarImages: TImageList;
    ActionList2: TActionList;
    EditUndoCmd: TAction;
    EditCutCmd: TAction;
    EditCopyCmd: TAction;
    EditPasteCmd: TAction;
    EditFontCmd: TAction;
    tlbStandardToolBar: TToolBar;
    tbu2: TToolButton;
    tbuCutButton: TToolButton;
    tbuCopyButton: TToolButton;
    tbuPasteButton: TToolButton;
    tbuUndoButton: TToolButton;
    tbu3: TToolButton;
    cbbFontName: TComboBox;
    tbu4: TToolButton;
    edFontSize: TEdit;
    ud1: TUpDown;
    tbu5: TToolButton;
    tbuBoldButton: TToolButton;
    tbuItalicButton: TToolButton;
    tbuUnderlineButton: TToolButton;
    tbuLeftAlign: TToolButton;
    tbu6: TToolButton;
    tbuCenterAlign: TToolButton;
    tbuRightAlign: TToolButton;
    tbu7: TToolButton;
    grbHeader: TcxGroupBox;
    reHeader: TcxRichEdit;
    cxSplitter1: TcxSplitter;
    grbFooter: TcxGroupBox;
    reFooter: TcxRichEdit;
    Panel1: TPanel;
    buClose: TcxButton;
    tbu1: TToolButton;
    procedure tbuBoldButtonClick(Sender: TObject);
    procedure EditUndoCmdExecute(Sender: TObject);
    procedure EditCutCmdExecute(Sender: TObject);
    procedure EditCopyCmdExecute(Sender: TObject);
    procedure EditPasteCmdExecute(Sender: TObject);
    procedure tbuItalicButtonClick(Sender: TObject);
    procedure tbuUnderlineButtonClick(Sender: TObject);
    procedure tbuAlignButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbbFontNameChange(Sender: TObject);
    procedure edFontSizeChange(Sender: TObject);
    procedure reHeaderPropertiesSelectionChange(Sender: TObject);
    procedure reHeaderEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure buCloseClick(Sender: TObject);
  private
    procedure GetFontNames;
    { Private declarations }
  public
    { Public declarations }
    CurEditor : TcxRichEdit;
  end;

var
  fmHeaderAndFooter: TfmHeaderAndFooter;

implementation

{$R *.dfm}

procedure TfmHeaderAndFooter.buCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmHeaderAndFooter.cbbFontNameChange(Sender: TObject);
begin
  CurEditor.SelAttributes.Name := cbbFontName.Items[cbbFontName.ItemIndex];
end;

procedure TfmHeaderAndFooter.edFontSizeChange(Sender: TObject);
begin
  CurEditor.SelAttributes.Size := StrToInt(edFontSize.Text);
end;

procedure TfmHeaderAndFooter.EditCopyCmdExecute(Sender: TObject);
begin
  CurEditor.CopyToClipboard;
end;

procedure TfmHeaderAndFooter.EditCutCmdExecute(Sender: TObject);
begin
  CurEditor.CutToClipboard;
end;

procedure TfmHeaderAndFooter.EditPasteCmdExecute(Sender: TObject);
begin
  CurEditor.PasteFromClipboard;
end;

procedure TfmHeaderAndFooter.EditUndoCmdExecute(Sender: TObject);
begin
  CurEditor.Undo;
//  with CurEditor do
//    if HandleAllocated then SendMessage(Handle, EM_UNDO, 0, 0);
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure TfmHeaderAndFooter.GetFontNames;
var
  DC: HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(cbbFontName.Items));
  ReleaseDC(0, DC);
  cbbFontName.Sorted := True;
end;

procedure TfmHeaderAndFooter.reHeaderEnter(Sender: TObject);
begin
  CurEditor := TcxRichEdit(Sender);
end;

procedure TfmHeaderAndFooter.reHeaderPropertiesSelectionChange(Sender: TObject);
begin
  with CurEditor.Paragraph do
  try
    tbuBoldButton.Down := (fsBold in CurEditor.SelAttributes.Style);
    tbuItalicButton.Down := (fsItalic in CurEditor.SelAttributes.Style);
    tbuUnderlineButton.Down := (fsUnderline in CurEditor.SelAttributes.Style);
    edFontSize.Text := IntToStr(CurEditor.SelAttributes.Size);
    cbbFontName.Text := CurEditor.SelAttributes.Name;
    case Ord(Alignment) of
      0: tbuLeftAlign.Down   := True;
      1: tbuRightAlign.Down  := True;
      2: tbuCenterAlign.Down := True;
    end;
  finally
  end;
end;

procedure TfmHeaderAndFooter.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfmHeaderAndFooter.FormCreate(Sender: TObject);
begin
  CurEditor := reHeader;
  GetFontNames;
  CurEditor.SelAttributes.Name := DefFontData.Name;
  CurEditor.SelAttributes.Size := -MulDiv(DefFontData.Height, 72, Screen.PixelsPerInch);
end;

procedure TfmHeaderAndFooter.tbuBoldButtonClick(Sender: TObject);
begin
  if tbuBoldButton.Down then
    CurEditor.SelAttributes.Style := CurEditor.SelAttributes.Style + [fsBold]
  else
    CurEditor.SelAttributes.Style := CurEditor.SelAttributes.Style - [fsBold];
end;

procedure TfmHeaderAndFooter.tbuItalicButtonClick(Sender: TObject);
begin
  if tbuItalicButton.Down then
    CurEditor.SelAttributes.Style := CurEditor.SelAttributes.Style + [fsItalic]
  else
    CurEditor.SelAttributes.Style := CurEditor.SelAttributes.Style - [fsItalic];
end;

procedure TfmHeaderAndFooter.tbuAlignButtonClick(Sender: TObject);
begin
  CurEditor.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;


procedure TfmHeaderAndFooter.tbuUnderlineButtonClick(Sender: TObject);
begin
  if tbuUnderlineButton.Down then
    CurEditor.SelAttributes.Style := CurEditor.SelAttributes.Style + [fsUnderline]
  else
    CurEditor.SelAttributes.Style := CurEditor.SelAttributes.Style - [fsUnderline];
end;

end.
