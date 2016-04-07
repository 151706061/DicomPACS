unit fInputEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit;

type
  TfmInputEdit = class(TForm)
    teEdit: TcxTextEdit;
    buOk: TcxButton;
    buCancel: TcxButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function DoShowInputEdit( var aString : string; aCaption : string = '' ) : integer;


implementation

{$R *.dfm}

function DoShowInputEdit( var aString : string; aCaption : string = '' ) : integer;
var
  fmInputEdit: TfmInputEdit;
begin
  Application.CreateForm(TfmInputEdit, fmInputEdit);
  fmInputEdit.teEdit.Text := aString;
  fmInputEdit.Caption     := aCaption;
  Result := fmInputEdit.ShowModal;
  if Result = mrOk then
  begin
    fmInputEdit.teEdit.PostEditValue;
    aString := fmInputEdit.teEdit.Text;
  end;
end;

end.
