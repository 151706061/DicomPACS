unit fCheckedListEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxMemo, cxControls, cxContainer, cxEdit, cxGroupBox, IniFiles;

type
  TfmCheckedListEdit = class(TForm)
    cxGroupBox1: TcxGroupBox;
    buOk: TcxButton;
    buCancel: TcxButton;
    Memo1: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCheckedListEdit: TfmCheckedListEdit;
// каждая новая строчка списока разделяется символом |
function DoShowCheckedListEdit(const aDefValue : string = ''; const aSectionName : string = ''; const aIniName : string = '') : integer;

function ListStrToString(const aStrList : TStrings; const aSeparator : string = '|') : string;
function StringToListStr(const aStr : string; const aSeparator : string = '|') : string; // результат - строка с разделителями #13#10

implementation

{$R *.dfm}
//==============================================================================
function ListStrToString(const aStrList : TStrings; const aSeparator : string = '|') : string;
begin
  Result := StringReplace(aStrList.Text, #13#10, aSeparator, [rfReplaceAll]);
end;
//------------------------------------------------------------------------------
function StringToListStr(const aStr : string; const aSeparator : string = '|') : string;
begin
  Result := StringReplace(aStr, aSeparator, #13#10, [rfReplaceAll] );
end;
//==============================================================================
function DoShowCheckedListEdit(const aDefValue : string = ''; const aSectionName : string = ''; const aIniName : string = '') : integer;
var
	ini: TIniFile;
  FDefValue, FSectionName, FIniName : string;
begin
  fmCheckedListEdit := TfmCheckedListEdit.Create( Application );

  if aIniName = '' then FIniName := ChangeFileExt(Application.ExeName,'.ini') else FIniName := aIniName;  // дефолтовое имя ини-файла
  if aSectionName = '' then FSectionName := fmCheckedListEdit.Name else FSectionName := aSectionName;     // дефолтовая секция
  FDefValue := aDefValue;

  ini := TIniFile.Create( FIniName );

  fmCheckedListEdit.Memo1.Lines.Text := StringToListStr( ini.ReadString(FSectionName, 'CheckedList', FDefValue));
//  fmCheckedListEdit.Memo1.Lines.Text := StringReplace(ini.ReadString(FSectionName, 'CheckedList', FDefValue), '|', #13#10, [rfReplaceAll] );

  if fmCheckedListEdit.ShowModal = mrOk then
  begin
//    ini.WriteString( aSectionName, 'CheckedList', StringReplace(fmCheckedListEdit.Memo1.Lines.Text, #13#10, '|', [rfReplaceAll]) );
    ini.WriteString( aSectionName, 'CheckedList', ListStrToString(fmCheckedListEdit.Memo1.Lines) );
  end;
  Result := fmCheckedListEdit.ModalResult;
  ini.Free;
  fmCheckedListEdit.Free;
end;

end.
