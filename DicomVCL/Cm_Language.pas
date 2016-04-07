unit Cm_Language;

interface

uses
  Windows, Forms, Classes, StdCtrls, Menus, Controls, ExtCtrls;

type
  TLanguage = (
    tNone,
    tEnglish,
    tGBChs,
    tBig5,
    tGBCht
    );

  TCaptionControl = class(TControl)
  public
    property Caption;
  end;

function GetSysDefaultLg: TLanguage;
function Big5ToGB(BIG5Str: string): AnsiString;
function GBToBig5(GBStr: string): AnsiString;
function GBChtToChs(GBStr: string): AnsiString;
function GBChsToCht(GBStr: string): AnsiString;

function TranLanguage(SrcStr: string; SrcLan, DesLan: TLanguage): string;
procedure SetFormLanguage(sForm: TForm; SrcLan, DesLan: TLanguage);

implementation

//获取操作系统默认语言
// -1、无效 0、英语 1、简体中文 3、繁体中文

function GetSysDefaultLg: TLanguage;
var
  LangID: Integer;
begin
  Result := tNone;
  LangID := GetSystemDefaultLangID;
  if LangID = ((SUBLANG_ENGLISH_US shl 10) or LANG_ENGLISH) then
    Result := tEnglish //美国英语
  else
    if LangID = ((SUBLANG_CHINESE_SIMPLIFIED shl 10) or LANG_CHINESE) then
    Result := tGBChs //简体中文
  else
    if LangID = ((SUBLANG_CHINESE_TRADITIONAL shl 10) or LANG_CHINESE) then
    Result := tBig5; //繁体中文
end;

function Big5ToGB(BIG5Str: string): AnsiString;
{进行big5转GB内码}
var
  Len: Integer;
  pBIG5Char: PChar;
  pGBCHSChar: PChar;
  pGBCHTChar: PChar;
  pUniCodeChar: PWideChar;
begin
  //String -> PChar
  pBIG5Char := PChar(BIG5Str);
  Len := MultiByteToWideChar(950, 0, pBIG5Char, -1, nil, 0);
  GetMem(pUniCodeChar, Len * 2);
  ZeroMemory(pUniCodeChar, Len * 2);
  //Big5 -> UniCode
  MultiByteToWideChar(950, 0, pBIG5Char, -1, pUniCodeChar, Len);
  Len := WideCharToMultiByte(936, 0, pUniCodeChar, -1, nil, 0, nil, nil);
  GetMem(pGBCHTChar, Len * 2);
  GetMem(pGBCHSChar, Len * 2);
  ZeroMemory(pGBCHTChar, Len * 2);
  ZeroMemory(pGBCHSChar, Len * 2);
  //UniCode->GB CHT
  WideCharToMultiByte(936, 0, pUniCodeChar, -1, pGBCHTChar, Len, nil, nil);
  //GB CHT -> GB CHS
  LCMapString($804, LCMAP_SIMPLIFIED_CHINESE, pGBCHTChar, -1, pGBCHSChar, Len);
  Result := string(pGBCHSChar);
  FreeMem(pGBCHTChar);
  FreeMem(pGBCHSChar);
  FreeMem(pUniCodeChar);
end;

function GBToBig5(GBStr: string): AnsiString;
{进行GB转BIG5内码}
var
  Len: Integer;
  pGBCHTChar: PChar;
  pGBCHSChar: PChar;
  pUniCodeChar: PWideChar;
  pBIG5Char: PChar;
begin
  pGBCHSChar := PChar(GBStr);
  Len := MultiByteToWideChar(936, 0, pGBCHSChar, -1, nil, 0);
  GetMem(pGBCHTChar, Len * 2 + 1);
  ZeroMemory(pGBCHTChar, Len * 2 + 1);
  //GB CHS -> GB CHT
  LCMapString($804, LCMAP_TRADITIONAL_CHINESE, pGBCHSChar, -1, pGBCHTChar, Len * 2);
  GetMem(pUniCodeChar, Len * 2);
  ZeroMemory(pUniCodeChar, Len * 2);
  //GB CHT -> UniCode
  MultiByteToWideChar(936, 0, pGBCHTChar, -1, pUniCodeChar, Len * 2);
  Len := WideCharToMultiByte(950, 0, pUniCodeChar, -1, nil, 0, nil, nil);
  GetMem(pBIG5Char, Len);
  ZeroMemory(pBIG5Char, Len);
  //UniCode -> Big5
  WideCharToMultiByte(950, 0, pUniCodeChar, -1, pBIG5Char, Len, nil, nil);
  Result := string(pBIG5Char);
  FreeMem(pBIG5Char);
  FreeMem(pGBCHTChar);
  FreeMem(pUniCodeChar);
end;

function GBChtToChs(GBStr: string): AnsiString;
{进行GBK繁体转简体}
var
  Len: Integer;
  pGBCHTChar: PChar;
  pGBCHSChar: PChar;
begin
  pGBCHTChar := PChar(GBStr);
  Len := MultiByteToWideChar(936, 0, pGBCHTChar, -1, nil, 0);
  GetMem(pGBCHSChar, Len * 2 + 1);
  ZeroMemory(pGBCHSChar, Len * 2 + 1);
  //GB CHS -> GB CHT
  LCMapString($804, LCMAP_SIMPLIFIED_CHINESE, pGBCHTChar, -1, pGBCHSChar, Len * 2);
  Result := string(pGBChsChar);
  //FreeMem(pGBCHTChar);
  FreeMem(pGBCHSChar);
end;

function GBChsToCht(GBStr: string): AnsiString;
{进行GBK简体转繁体}
var
  Len: Integer;
  pGBCHTChar: PChar;
  pGBCHSChar: PChar;
begin
  pGBCHSChar := PChar(GBStr);
  Len := MultiByteToWideChar(936, 0, pGBCHSChar, -1, nil, 0);
  GetMem(pGBCHTChar, Len * 2 + 1);
  ZeroMemory(pGBCHTChar, Len * 2 + 1);
  //GB CHS -> GB CHT
  LCMapString($804, LCMAP_TRADITIONAL_CHINESE, pGBCHSChar, -1, pGBCHTChar, Len * 2);
  Result := string(pGBCHTChar);
  FreeMem(pGBCHTChar);
  //FreeMem(pGBCHSChar);
end;

procedure SetFormLanguage(sForm: TForm; SrcLan, DesLan: TLanguage);
var
  TmpComp: TComponent;
  TmpControl: TControl;
  i, j, Len, Index: Integer;
  TmpCap: string;
begin
  with sForm do
  begin
    for i := 0 to ComponentCount - 1 do
    begin
      TmpComp := Components[i];
      //控件Caption
      if TmpComp is TControl then
      begin
        TmpControl := TmpComp as TControl;
        Len := TmpControl.GetTextLen;
        if Len <> 0 then
        begin
          //-------------------问题所在-----------------------//
          SetString(TmpCap, PChar(nil), Len);
          TmpControl.GetTextBuf(Pointer(TmpCap), Len + 1);
          TmpControl.SetTextBuf(PChar(TranLanguage(TmpCap, SrcLan, DesLan)));
        end;
      end;
      //其他情况
      if TmpComp is TComboBox then
      begin
        with TmpComp as TComboBox do
        begin
          Index := ItemIndex;
          for j := 0 to Items.Count - 1 do
            Items[j] := TranLanguage(Items[j], SrcLan, DesLan);
          ItemIndex := Index;
        end;
      end;

      if TmpComp is TLabeledEdit then
      begin
        with TmpComp as TLabeledEdit do
          EditLabel.Caption := TranLanguage(EditLabel.Caption, SrcLan, DesLan);
      end;
    end;
  end;
end;

function TranLanguage(SrcStr: string; SrcLan, DesLan: TLanguage): string;
begin
  Result := '';
  if SrcLan = DesLan then
  begin
    Result := SrcStr;
    exit;
  end;

  case SrcLan of
    tNone, tEnglish:
      exit;
    tGBChs:
      case DesLan of
        tGBCht:
          Result := GBChsToCht(SrcStr);
        tBig5:
          Result := GBToBig5(SrcStr);
      end;
    tGBCht:
      case DesLan of
        tGBChs:
          Result := GBChtToChs(SrcStr);
        tBig5:
          Result := GBToBig5(SrcStr);
      end;
    tBig5:
      case DesLan of
        tGBChs:
          Result := Big5ToGB(SrcStr);
        tGBCht:
          Result := GBChsToCht(Big5ToGB(SrcStr));
      end;
  end;
end;

end.
