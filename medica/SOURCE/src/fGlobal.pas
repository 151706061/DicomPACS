{***************************************************************
 *
 * Unit Name: fGlobal
 * Purpose  :
 * Author   : Собянин А.А.  sobjanin@diagnostic.ru
 * History  :
 *
 ****************************************************************}

unit fGlobal;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ActnList, ImgList, ComCtrls, ToolWin,
  Db, OracleData, Oracle, JvScrollMax, IniFiles, Menus, OleServer, Word2000, Excel2000,
  registry, JvJVCLUtils, JvJCLUtils, Variants;

const
  BLOB_WRITE_SIZE = 65535;

type
  tproc = procedure(Sender: TObject);

  TMenuDocs = class
    os: TOracleSession;
    nSotrID: Integer;
    procedure pOpenReport(Sender: TObject);
    procedure DoReadFile(pID: integer; pDestDir, pName: string);
    procedure CreateDocMenu(MenuItem: TMenuItem); //создает менюшку со списком документов
    procedure CreateSpravMenu(MenuItem: TMenuItem); //создает менюшку со списком документов
  end;

procedure DoPrintVypEpkikriz(pPACID: integer; os: toraclesession);
//procedure DoPrintIB(pPACID: integer; os: toraclesession);
procedure DoWordProcess(sCurFile: string; sIB: string); overload;
procedure DoWordProcess(sCurFile: string; bLandscape: Boolean = false); overload;
procedure DoOpenInWord(sCurFile: string; bLandscape: Boolean = false);

procedure DoExcelProcess(sCurFile: string; bPreview: boolean = FALSE);

function IniReadString(sIniFile: string; Section, Ident: string; Default: string = ''): string;
function IniReadInteger(sIniFile: string; Section, Ident: string; Default: integer = -1): integer;
procedure IniWriteString(sIniFile: string; Section, Ident: string; Value: string);

function AppPathFileName(FileName: TFileName): TFileName;

procedure WriteBoolean(const IniFile, IniSection, Ident: string; const Value: Boolean; UseRegistry: Boolean);
procedure WriteFloat(const IniFile, IniSection, Ident: string; const Value: Double; UseRegistry: Boolean);
procedure WriteInteger(const IniFile, IniSection, Ident: string; const Value: Integer; UseRegistry: Boolean);
procedure WriteString(const IniFile, IniSection, Ident, Value: string; UseRegistry: Boolean);

function ReadBoolean(const IniFile, IniSection, Ident: string; const DefValue: Boolean; UseRegistry: Boolean): Boolean;
function ReadFloat(const IniFile, IniSection, Ident: string; const DefValue: Double; UseRegistry: Boolean): Double;
function ReadInteger(const IniFile, IniSection, Ident: string; const DefValue: Integer; UseRegistry: Boolean): Integer;
function ReadString(const IniFile, IniSection, Ident, DefValue: string; UseRegistry: Boolean): string;

function GetNumValuesInSMID(s: string): Integer;
procedure DoAddTSMIDShort(FC_NAME, FC_ED_IZM, FC_TYPE, FK_MKB9, FK_MKB10: string;
  FK_OWNER: Integer; Session: TOracleSession);
procedure DoEditTSMIDShort(FC_NAME, FC_ED_IZM, FC_TYPE, FK_MKB9, FK_MKB10: string;
  FK_ID, FK_OWNER: Integer; Session: TOracleSession);
procedure DoDeleteTSMID(pId: Integer; Session: TOracleSession);
procedure DoCopyTSMID(pStartId, pNewOwner: Integer; Session: TOracleSession);
function Get_FullPath(pFK_SMID: Integer; Session: TOracleSession): string;

procedure DoDeleteTIB(pId: Integer; Session: TOracleSession); overload;
procedure DoDeleteTIB(pPacId, pSMID: Integer; Session: TOracleSession); overload;
procedure DoAddTIB(pPacId, pSMID: Integer; Session: TOracleSession; pNum: Integer = 0; pChar: string = ''; pBID: Integer = 0);
procedure DoInsert(sTableName: string; const KeyValues: Variant; Session: TOracleSession);
procedure DoUpdate(sTableName: string; const KeyValues: Variant; sWhere: string; const WhereVars: Variant; Session: TOracleSession);
procedure DoDelete(sTableName: string; const KeyValues: Variant; sWhere: string; Session: TOracleSession);
function GetTextFromClob(Session: TOracleSession; strTableName: string; strFieldName: string; nID: integer): string;
procedure DO_ADDAUDIT(sBulo: string; sStalo: string; sComment: string; nFK_VRACHID: integer; os: TOracleSession);
function get_ib(fk_pacid: integer; os: TOracleSession): string;
function IntToBool(Value: integer): boolean;
function BoolToInt(Value: boolean): Integer;

//procedure DoFormatDBehGrid(gr: TDBGridEh; strTable: string; os: TOracleSession);

function ServerDate(os: TOracleSession): TDateTime;

procedure SaveToLog(const sWhere: string; const sWhat: string);

function Remove1310(const sString: string): string;

const
  IniFileExt = '.ini';

var
  MenuDocs: TMenuDocs;
  AppFileName: string = '';
  FLogLock: TRTLCriticalSection;

implementation
uses fUpdate;

procedure SaveToLog(const sWhere: string; const sWhat: string);
var
  F                 : TextFile;
  S                 : string;
begin
{$I-}
  AssignFile(F, ExtractFilePath(ParamStr(0)) + ExtractFileName(ParamStr(0)) + '.log');
  Append(F);
  if IOResult <> 0 then
    ReWrite(F);
  DateTimeToString(S, '[dd/mm/yyyy hh:mm:ss] ', Now);
  S := S + Copy(sWhere, 1, 128) + ' ' + Copy(sWhat, 1, 2048);
  WriteLn(F, S);
  CloseFile(F);
{$I+}
end;

function ServerDate(os: TOracleSession): TDateTime;
var oq: TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Sql.Text := 'SELECT SYSDATE FROM DUAL';
    try
      oq.Execute;
      Result := oq.FieldAsDate(0);
    except
      Result := Date; 
    end;
  finally
    oq.Free;
  end;
end;


{********************************************************************************************************}
{        DoPrintVypEpkikriz
{********************************************************************************************************}

procedure DoPrintVypEpkikriz(pPACID: integer; os: toraclesession);
var
  op: TOraclePackage;
begin
  op := TOraclePackage.Create(nil);
  op.Session := os;
  op.PackageName := 'TextIB';
  SaveTextFile('c:\epikriz.html', '<html><head><title>Выписной эпикриз</title><meta http-equiv="Content-Type" content="text/html; charset=windows-1251"></head><body>' +
    gettextfromclob(os, 'tclobs', 'fc_clob', op.CallStringFunction('getFullEpikrizTextClobID', [pPACID, -1, -1, -1, -1, -1, -1])) +
    '</body></html>');
  dowordprocess('c:\epikriz.html');
  DeleteFile('c:\epikriz.tmp');
end;

{********************************************************************************************************}
{        DoPrintIB
{********************************************************************************************************}

{procedure DoPrintIB(pPACID: integer; os: toraclesession);
var
  ods: toracledataset;
  sFileName: string;
  str: string;
begin
  ods := toracledataset.Create(nil);
  ods.session := os;
  ods.SQL.Text := 'select fk_ibid, fk_iby from tkarta where fk_id=:pfk_pacid';
  ods.DeclareVariable('pfk_pacid', otinteger);
  ods.SetVariable('pfk_pacid', pPACID);
  ods.Close;
  ods.open;
  sFileName := GetTempDir + ods.FieldByName('FK_IBID').AsString + '-' + ods.FieldByName('FK_IBY').AsString;

  ods.SQL.Text := 'select /*+rule*/ fc_clob from tclobs, tibtext where fk_pacid=:pfk_pacid and tclobs.fk_id=tibtext.fk_blobid';
  ods.Close;
  ods.open;
  if ods.RecordCount = 0 then begin
    raise EReadError.Create('Запрошен текст отсутсвующей истории болезни');
    exit;
  end;
  str := TBlobField(ods.FindField('fc_clob')).AsString;
  str := '<html><head><title>Untitled Document</title><meta http-equiv="Content-Type" content="text/html; charset=windows-1251"></head><body>' + str + '</Body></html>';
  SaveTextFile(sFileName, str);
  DoWordProcess(sFileName, ExtractFileName(sFileName));
  ods.free;
  DeleteFile(sFileName);
end; }

{********************************************************************************************************}
{        DoWordProcess
{********************************************************************************************************}

procedure DoWordProcess(sCurFile: string; bLandscape: Boolean = false);
var
  WordApp: TWordApplication;
  WordDoc: TWordDocument;
  Template, NewTemplate, ItemIndex, FileName,
    ConfirmConversions, ReadOnly, AddToRecentFiles,
    PasswordDocument, PasswordTemplate, Revert,
    WritePasswordDocument, WritePasswordTemplate,
    Format, Encoding, EmPar, Visible,
    Background, time //для распечатки
  : OleVariant;
begin
  Screen.Cursor := crHourGlass;
  EmPar := EmptyParam;
  WordApp := TWordApplication.Create(nil);
  WordDoc := TWordDocument.Create(nil);
  Template := EmptyParam;
  NewTemplate := True;
  ItemIndex := 1;
  try
    Wordapp.Connect;
  except
    MessageDlg('Word не установлена на компьютере.', mtError, [mbOk], 0);
    Abort;
  end;
  Wordapp.Visible := ReadInteger('asu_ora', 'printib', 'showword', 0, false) = 1;
  WordApp.Options.CheckSpellingAsYouType := False;
  WordApp.Options.CheckGrammarAsYouType := False;

  //загрузим хтмл-ку с историей
  FileName := sCurFile;
  ConfirmConversions := FALSE;
  ReadOnly := FALSE;
  AddToRecentFiles := FALSE;
  PasswordDocument := '';
  PasswordTemplate := '';
  Revert := FALSE;
  WritePasswordDocument := '';
  WritePasswordTemplate := '';
  Encoding := Unassigned;
  Format := wdOpenFormatAuto;
  Visible := TRUE;
  WordDoc.ConnectTo(WordApp.Documents.Open(FileName, ConfirmConversions, ReadOnly, AddToRecentFiles,
    PasswordDocument, PasswordTemplate, Revert, WritePasswordDocument, WritePasswordTemplate, Format, Encoding, visible {visible}));

  BackGround := FALSE;
  time := WordApp.Documents.Count;
  if bLandscape then
    WordDoc.PageSetup.Orientation := wdOrientLandscape;
  WordDoc.PrintOutOld(BackGround);
  Time := FALSE;
  WordApp.Quit(Time);
  Screen.Cursor := crArrow;
end;

{********************************************************************************************************}
{        DoExcelProcess
{********************************************************************************************************}

procedure DoExcelProcess(sCurFile: string; bPreview: boolean = FALSE);
var
  ExcelApp: TExcelApplication;
  workbook: TExcelWorkbook;
  Template, NewTemplate, ItemIndex,
	 EmPar, time //для распечатки
  : OleVariant;
begin
  Screen.Cursor := crHourGlass;
  ExcelApp := TExcelApplication.Create(nil);
  workbook := TExcelWorkbook.Create(nil);
  EmPar := EmptyParam;
  Template := EmptyParam;
  NewTemplate := True;
  ItemIndex := 1;
  try
    ExcelApp.Connect;
  except
    MessageDlg('Excel не установлен на компьютере.', mtError, [mbOk], 0);
    Abort;
  end;
  ExcelApp.Visible[0] := (ReadInteger('asu_ora', 'printib', 'showword', 0, false) = 1) or bPreview;
  try
    workbook.ConnectTo(ExcelApp.Workbooks.Add(sCurFile, 9));
  except
    on e: exception do begin
      Screen.Cursor := crArrow;
      workbook.free;
      ExcelApp.free;
      exit;
	end;
  end;
  time := ExcelApp.Workbooks.Count;
  try
    if bPreview then begin
      workbook.PrintOut(EmPar, EmPar, EmPar, NewTemplate, EmPar, EmPar, EmPar, EmPar, $9);
    end
    else begin
      workbook.PrintOut(EmPar, EmPar, EmPar, EmPar {preview}, EmPar, EmPar, EmPar, EmPar, $9);
      ExcelApp.Quit;
    end;
  finally
    workbook.free;
    ExcelApp.free;
    Screen.Cursor := crArrow;
  end;
end;

{********************************************************************************************************}
{        DoOpenInWord
{********************************************************************************************************}

procedure DoOpenInWord(sCurFile: string; bLandscape: Boolean = false);
var
  WordApp: TWordApplication;
  Template, NewTemplate, ItemIndex, FileName,
    ConfirmConversions, ReadOnly, AddToRecentFiles,
    PasswordDocument, PasswordTemplate, Revert,
    WritePasswordDocument, WritePasswordTemplate,
    Format, Encoding, Visible,
    Background, time //для распечатки
  : OleVariant;
begin
  Screen.Cursor := crHourGlass;
  WordApp := TWordApplication.Create(nil);

  Template := EmptyParam;
  NewTemplate := True;
  ItemIndex := 1;
  try
    Wordapp.Connect;
  except
    MessageDlg('Word не установлена на компьютере.', mtError, [mbOk], 0);
    Abort;
  end;
  Wordapp.Visible := TRUE;
  WordApp.Options.CheckSpellingAsYouType := False;
  WordApp.Options.CheckGrammarAsYouType := False;

  //загрузим хтмл-ку с историей
  FileName := sCurFile;
  ConfirmConversions := FALSE;
  ReadOnly := FALSE;
  AddToRecentFiles := FALSE;
  PasswordDocument := '';
  PasswordTemplate := '';
  Revert := FALSE;
  WritePasswordDocument := '';
  WritePasswordTemplate := '';
  Format := wdOpenFormatAuto;
  Encoding := Unassigned;
  Visible := true;
  WordApp.Documents.Open(FileName, ConfirmConversions, ReadOnly, AddToRecentFiles,
    PasswordDocument, PasswordTemplate, Revert, WritePasswordDocument, WritePasswordTemplate, Format, Encoding, visible);

  BackGround := FALSE;
  time := WordApp.Documents.Count;
  //  WordApp.Dialogs.Item(wdDialogFilePrint).Display(Time);
  if bLandscape then
    WordApp.Documents.Item(Time).PageSetup.Orientation := wdOrientLandscape;
  Time := FALSE;
  WordApp.Activate;
  WordApp.free;
  Screen.Cursor := crArrow;
end;

{********************************************************************************************************}
{        DoWordProcess
{********************************************************************************************************}

procedure DoWordProcess(sCurFile: string; sIB: string);
var
  WordApp: TWordApplication;
  WordDocument: TWordDocument;
  wdHtml: TWordDocument;

  Template, NewTemplate, ItemIndex, FileName,
	ConfirmConversions, ReadOnly, AddToRecentFiles,
	PasswordDocument, PasswordTemplate, Revert,
	WritePasswordDocument, WritePasswordTemplate,
	SaveCHanges, RouteDocument, Format,
	FileFormat, LockComments, Password, WritePassword,
	Wrap, ReadOnlyRecommended, EmbedTrueTypeFonts,
	SaveNativePictureFormat, SaveFormsData, SaveAsAOCELetter,
	FindText, MatchCase, MatchWholeWord, MatchWildcards,
	MatchSoundsLike, MatchAllWordForms, oForward,
	ReplaceWith, Replace, Encoding, Visible,
	OriginalFormat, Background //для распечатки
  : OleVariant;
  ini: tinifile;
begin
  WordApp := TWordApplication.Create(nil);
  WordDocument := TWordDocument.Create(nil);
  wdHtml := TWordDocument.Create(nil);
  Assert(WordApp <> nil, 'Ошибка создания объекта TWordApplication');
  Assert(WordDocument <> nil, 'Ошибка создания объекта TWordDocument');
  Assert(wdHtml <> nil, 'Ошибка создания объекта TWordDocument');
  try
	Screen.Cursor := crHourGlass;

	Template := EmptyParam;
	NewTemplate := True;
    ItemIndex := 1;
    try
      Wordapp.Connect;
    except
      MessageDlg('Word не установлена на компьютере.', mtError, [mbOk], 0);
      Abort;
    end;
    ini := tinifile.create('asu_ora.ini');
    Wordapp.Visible := ini.ReadInteger('printib', 'showword', 0) = 1;
    ini.free;

    //    Wordapp.Visible := TRUE;
        {Turn Spell checking of because it takes a long time if enabled and slows down Winword}
    WordApp.Options.CheckSpellingAsYouType := False;
    WordApp.Options.CheckGrammarAsYouType := False;

    WordApp.Caption := 'История болезни № ' + sIB;
    {Create new document}
    Template := EmptyParam;
    NewTemplate := False;

    WordApp.Documents.Add(Template, NewTemplate, Template, Template);
    {Assign WordDocument component}
    WordDocument.ConnectTo(WordApp.Documents.Item(ItemIndex));
    //    DocWindow := WordApp.ActiveDocument.ActiveWindow.Index;;
    //загрузим хтмл-ку с историей
    FileName := sCurFile;
    ConfirmConversions := FALSE; ReadOnly := FALSE;
    AddToRecentFiles := FALSE;
    PasswordDocument := '';
    PasswordTemplate := '';
    Revert := FALSE;
    WritePasswordDocument := '';
    WritePasswordTemplate := '';
    Encoding := EmptyParam;
    Format := wdOpenFormatAuto;
    Visible := true;
    WordApp.Documents.Open(FileName, ConfirmConversions, ReadOnly, AddToRecentFiles,
      PasswordDocument, PasswordTemplate, Revert, WritePasswordDocument, WritePasswordTemplate, Format, Encoding, visible {});
    //
//    insWindow := WordApp.ActiveDocument.ActiveWindow.Index;
    WordApp.Selection.WholeStory;
    WordApp.Selection.Copy;
    //
    SaveCHanges := wdDoNotSaveChanges;
    RouteDocument := False;
    WordApp.ActiveDocument.ActiveWindow.Close(SaveCHanges, RouteDocument);
    //    WordApp.Windows.Item(DocWindow).Activate;
    WordApp.Selection.Paste;
    //вставим разрывы страницы
    FileName := wdStory; //Unit
    WordApp.Selection.HomeKey(FileName, EmptyParam);
    WordApp.ActiveDocument.Sections.Item(1).Range.Find.ClearFormatting;
    WordApp.ActiveDocument.Sections.Item(1).Range.Find.Replacement.ClearFormatting;
    FindText := '[:pagebreak]';
    ReplaceWith := chr(12);
    oForward := true;
    Format := FALSE;
    MatchCase := FALSE;
    Wrap := wdFindContinue;
    MatchWholeWord := FALSE;
    MatchWildcards := FALSE;
    MatchSoundsLike := FALSE;
    MatchAllWordForms := FALSE;
    Replace := true;
    Encoding := EmptyParam;
    WordApp.Selection.Find.Execute(
      FindText, MatchCase,
      MatchWholeWord, MatchWildcards,
      MatchSoundsLike, MatchAllWordForms,
      oForward, Wrap, Format,
      ReplaceWith, Replace, Encoding, Encoding, Encoding, Encoding);
    //Заполним футер
    WordApp.ActiveWindow.View.Type_ := wdPageView;
    WordApp.ActiveWindow.View.SeekView := wdSeekCurrentPageFooter;
    WordApp.Selection.InsertAfter('История болезни №' + sIB);
    FileName := wdAlignPageNumberRight; //выравнивание номеров страниц
    FileFormat := true; //ставить ли номер на первой странице
    WordApp.Selection.HeaderFooter.PageNumbers.Add(filename, fileformat);
    WordApp.ActiveDocument.Sections.Item(1).Footers.Item(wdHeaderFooterFirstPage).Shapes.AddLine(60, 790, 570, 790, EmptyParam);
    //сохраним документ
//    sTmp:='с:\История болезни №'+sIB;
//    VarCopy(PVariant(@FileName)^,PVariant(@sTmp)^);
    FileName := GenTempFileNameExt('c:\история болезни ' + sIB, '.html');
    FileFormat := wdFormatDocument;
    LockComments := False;
    Password := '';
    AddToRecentFiles := True;
    WritePassword := '';
    ReadOnlyRecommended := False;
    EmbedTrueTypeFonts := False;
    SaveNativePictureFormat := False;
    SaveFormsData := False;
    SaveAsAOCELetter := False;
    WordApp.ActiveDocument.SaveAs(FileName, FileFormat, LockComments, WritePassword,
      AddToRecentFiles, WritePassword, ReadOnlyRecommended,
      EmbedTrueTypeFonts, SaveNativePictureFormat, SaveFormsData, SaveAsAOCELetter);
    WordApp.ActiveWindow.ActivePane.View.SeekView := wdSeekMainDocument;
    FileName := wdStory; //Unit
    WordApp.Selection.HomeKey(FileName, EmptyParam);
    //распечатка
    Background := FALSE;
    ini := tinifile.create('asu_ora.ini');
    if ini.ReadInteger('ptinib', 'ptinttoprinter', 1) = 1 then begin
      WordApp.PrintOut(BackGround);
    end;
    ini.free;
    //закроем word
    SaveChanges := WdDoNotSaveChanges;
    OriginalFormat := UnAssigned;
    RouteDocument := UnAssigned;
    WordApp.Quit;
    try
      WordApp.Disconnect;
    except
      on E: Exception do begin
        Showmessage(E.Message);
        WordApp.Disconnect;
      end;
    end;
  except
    on E: Exception do begin
      ShowMessage(E.Message);
      WordApp.Disconnect;
    end;
  end;
  try
    wdHtml.free;
    WordDocument.free;
    WordApp.free;
  finally
    Screen.Cursor := crArrow;
  end;
end;

{********************************************************************************************************}
{        DoEditTSMIDShort
{********************************************************************************************************}

procedure DoEditTSMIDShort;
var
  q: TOracleQuery;
begin
  q := TOracleQuery.Create(nil);
  q.Session := Session;
  q.SQL.Text := 'UPDATE ASU.TSMID SET FC_NAME=:pFC_NAME,FC_ED_IZM=:pFC_ED_IZM, ' +
    'FC_TYPE=:pFC_TYPE, FK_MKB9=:pFK_MKB9, FK_MKB10=:pFK_MKB10, FK_OWNER=:pFK_OWNER ' +
    'WHERE FK_ID=:PID';
  q.DeclareVariable('pFC_NAME', otString);
  q.DeclareVariable('pFC_ED_IZM', otString);
  q.DeclareVariable('pFC_TYPE', otString);
  q.DeclareVariable('pFK_MKB9', otString);
  q.DeclareVariable('pFK_MKB10', otString);
  q.DeclareVariable('pFK_OWNER', otInteger);
  q.DeclareVariable('pid', otInteger);
  q.SetVariable('pFC_NAME', FC_NAME);
  q.SetVariable('pFC_ED_IZM', FC_ED_IZM);
  q.SetVariable('pFC_TYPE', FC_TYPE);
  q.SetVariable('pFK_MKB9', FK_MKB9);
  q.SetVariable('pFK_MKB10', FK_MKB10);
  q.SetVariable('pFK_OWNER', FK_OWNER);
  q.SetVariable('pid', FK_ID);
  q.Execute;
  q.Free;
end;

{********************************************************************************************************}
{        DoAddTSMIDShort
{********************************************************************************************************}

procedure DoAddTSMIDShort;
var
  q: TOracleQuery;
begin
  q := TOracleQuery.Create(nil);
  q.Session := Session;
  q.SQL.Text := 'INSERT INTO ASU.TSMID (FC_NAME,FC_ED_IZM,FC_TYPE,FK_MKB9,FK_MKB10,FK_OWNER) ' +
    'VALUES (:pFC_NAME,:pFC_ED_IZM,:pFC_TYPE, :pFK_MKB9, :pFK_MKB10, :pFK_OWNER)';
  q.DeclareVariable('pFC_NAME', otString);
  q.DeclareVariable('pFC_ED_IZM', otString);
  q.DeclareVariable('pFC_TYPE', otString);
  q.DeclareVariable('pFK_MKB9', otString);
  q.DeclareVariable('pFK_MKB10', otString);
  q.DeclareVariable('pFK_OWNER', otInteger);
  q.SetVariable('pFC_NAME', FC_NAME);
  q.SetVariable('pFC_ED_IZM', FC_ED_IZM);
  q.SetVariable('pFC_TYPE', FC_TYPE);
  q.SetVariable('pFK_MKB9', FK_MKB9);
  q.SetVariable('pFK_MKB10', FK_MKB10);
  q.SetVariable('pFK_OWNER', FK_OWNER);
  q.Execute;
  q.Free;
end;

{********************************************************************************************************}
{        DoDeleteTSMID
{********************************************************************************************************}

procedure DoDeleteTSMID(pId: Integer; Session: TOracleSession);
var
  q: TOracleQuery;
begin
  q := TOracleQuery.Create(nil);
  q.Session := Session;
  q.Cursor := crSQLWait;
  q.SQL.Text := 'DELETE from ASU.tsmid where fk_id in (select fk_id from ASU.tsmid start with fk_id=:PID connect by prior fk_id=fk_owner)';
  q.DeclareVariable('pid', otInteger);
  q.SetVariable('pid', pID);
  q.Execute;
  q.Free;
end;

{********************************************************************************************************}
{        DoCopyTSMID
{********************************************************************************************************}

procedure DoCopyTSMID(pStartId, pNewOwner: Integer; Session: TOracleSession);
var
  q: TOracleQuery;
begin
  q := TOracleQuery.Create(nil);
  q.Session := Session;
  q.Cursor := crSQLWait;
  q.SQL.Text := 'begin do_copysmid(:PID, :pNewOwner); end;';
  q.DeclareVariable('pid', otInteger);
  q.DeclareVariable('pNewOwner', otInteger);
  q.SetVariable('pid', pStartID);
  q.SetVariable('pNewOwner', pNewOwner);
  q.Execute;
  q.Free;
end;

{********************************************************************************************************}
{        Get_FullPath
{********************************************************************************************************}

function Get_FullPath(pFK_SMID: Integer; Session: TOracleSession): string;
var
  ods: TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  ods.Session := Session;
  ods.Cursor := crSQLWait;
  ods.sql.text := 'select get_fullpath(:pFK_SMID) as fc_path from dual';
  ods.DeclareVariable('pFK_SMID', otInteger);
  ods.SetVariable('pFK_SMID', pFK_SMID);
  ods.Close;
  ods.Open;
  result := ods.FieldbyName('fc_path').AsString;
  ods.free;
end;

procedure DoDeleteTIB(pId: Integer; Session: TOracleSession);
var
  q: TOracleQuery;
begin
  q := TOracleQuery.Create(nil);
  q.Session := Session;
  q.SQL.TEXT := 'DELETE FROM ASU.TIB WHERE FK_ID=:PID';
  q.DeclareVariable('PID', otInteger);
  q.SetVariable('PID', pId);
  q.Execute;
end;

{********************************************************************************************************}
{        DoDeleteTIB
{********************************************************************************************************}

procedure DoDeleteTIB(pPacId, pSMID: Integer; Session: TOracleSession);
var
  q: TOracleQuery;
begin
  q := TOracleQuery.Create(nil);
  q.Session := Session;
  q.SQL.TEXT := 'DELETE FROM ASU.TIB WHERE FK_PACID=:PACID and FK_SMID=:SMID';
  q.DeclareVariable('PACID', otInteger);
  q.SetVariable('PACID', pPacId);
  q.DeclareVariable('SMID', otInteger);
  q.SetVariable('SMID', pSMID);
  q.Execute;
end;

{********************************************************************************************************}
{        DoAddTIB
{********************************************************************************************************}

procedure DoAddTIB(pPacId, pSMID: Integer; Session: TOracleSession; pNum: Integer = 0; pChar: string = ''; pBID: Integer = 0);
var
  q: TOracleQuery;
begin
  q := TOracleQuery.Create(nil);
  q.Session := Session;
  q.SQL.TEXT := 'INSERT INTO ASU.TSMID (FC_CHAR,FN_NUM,FK_BID,FK_PACID, FK_SMID) ' +
    'values (:CHAR,:NUM,:BID,:PACID, :SMID)';
  q.DeclareVariable('PACID', otInteger);
  q.SetVariable('PACID', pPacId);
  q.DeclareVariable('SMID', otInteger);
  q.SetVariable('SMID', pSMID);
  q.DeclareVariable('BID', otInteger);
  if pBID <> 0 then q.SetVariable('BID', pBID);
  q.DeclareVariable('NUM', otInteger);
  if pNum <> 0 then q.SetVariable('NUM', pNUM);
  q.DeclareVariable('CHAR', otString);
  if pChar <> '' then q.SetVariable('CHAR', pChar);
  q.Execute;
end;

function GetNumValuesInSMID(s: string): Integer;
var
  postchk: Integer;
begin
  Postchk := -1;
  result := -1;
  while postchk <> 0 do begin
    postchk := pos('...', s);
    delete(s, 1, postchk + 1);
    result := result + 1;
  end;
end;

{********************************************************************************************************}
{        DoInsert
{********************************************************************************************************}

procedure DoInsert(sTableName: string; const KeyValues: Variant; Session: TOracleSession);
var
  KeyLo, KeyHi, i: Integer;
  q: ToracleQuery;
begin
  if not VarIsArray(KeyValues) then begin
    raise EVariantError.Create('Должен передаваться массив триад поле, тип, значение');
    exit;
  end;
  KeyLo := VarArrayLowBound(KeyValues, 1);
  KeyHi := VarArrayHighBound(KeyValues, 1);
  if (KeyHi - KeyLo + 1) mod 3 <> 0 then begin
    raise EVariantError.Create('Должен передаваться массив триад поле, тип, значение');
    exit;
  end;
  q := ToracleQuery.Create(nil);
  q.Session := Session;
  q.Cursor := crSQLWait;
  //  q.Debug:=true;
  q.SQL.Text := 'insert into ' + sTableName + ' (' + KeyValues[KeyLo];
  i := KeyLo + 3;
  while i < KeyHi do begin
    q.SQL.Add(',' + KeyValues[i]);
    inc(i, 3);
  end;
  q.SQL.Add(') Values(:' + KeyValues[KeyLo]);
  i := KeyLo + 3;
  while i < KeyHi do begin
    q.SQL.Add(',:' + KeyValues[i]);
    inc(i, 3);
  end;
  q.SQL.Add(')');
  i := KeyLo;
  while i < KeyHi do begin
    q.DeclareVariable(VarToStr(KeyValues[i]), KeyValues[i + 1]);
    q.SetVariable(VarToStr(KeyValues[i]), KeyValues[i + 2]);
    inc(i, 3);
  end;
  try
    Screen.Cursor := crHourGlass;
    q.Execute;
  finally
    Screen.Cursor := crArrow;
    q.Free;
  end;
end;

{********************************************************************************************************}
{        DoUpdate
{********************************************************************************************************}

procedure DoUpdate(sTableName: string; const KeyValues: Variant; sWhere: string; const WhereVars: Variant; Session: TOracleSession);
var
  KeyLo, KeyHi, KeyLoW, KeyHiW, i: Integer;
  q: ToracleQuery;
begin
  if not VarIsArray(KeyValues) then begin
    raise EVariantError.Create('Должен передаваться массив триад поле, тип, значение');
    exit;
  end;
  KeyLo := VarArrayLowBound(KeyValues, 1);
  KeyHi := VarArrayHighBound(KeyValues, 1);
  KeyLoW := VarArrayLowBound(WhereVars, 1);
  KeyHiW := VarArrayHighBound(WhereVars, 1);
  if ((KeyHi - KeyLo + 1) mod 3 <> 0) or ((KeyHiW - KeyLoW + 1) mod 3 <> 0) then begin
    raise EVariantError.Create('Должен передаваться массив триад поле, тип, значение');
    exit;
  end;
  q := ToracleQuery.Create(nil);
  q.Session := Session;
  q.Cursor := crSQLWait;
  q.SQL.Text := 'update ' + sTableName + ' set ' + KeyValues[KeyLo] + '=:' + KeyValues[KeyLo];
  i := KeyLo + 3;
  while i < KeyHi do begin
    q.SQL.Add(',' + KeyValues[i] + '=:' + KeyValues[i]);
    inc(i, 3);
  end;
  q.SQL.Add(' ' + sWhere);
  i := KeyLo;
  while i < KeyHi do begin
    q.DeclareVariable(VarToStr(KeyValues[i]), KeyValues[i + 1]);
    q.SetVariable(VarToStr(KeyValues[i]), KeyValues[i + 2]);
    inc(i, 3);
  end;
  i := KeyLoW;
  while i < KeyHiW do begin
    q.DeclareVariable(VarToStr(WhereVars[i]), WhereVars[i + 1]);
    q.SetVariable(VarToStr(WhereVars[i]), WhereVars[i + 2]);
    inc(i, 3);
  end;
  //  q.Debug:=TRUE;
  try
    Screen.Cursor := crSQLWait;
    q.Execute;
  finally
    Screen.Cursor := crArrow;
    q.Free;
  end;
end;

{********************************************************************************************************}
{        DoDelete
{********************************************************************************************************}

procedure DoDelete(sTableName: string; const KeyValues: Variant; sWhere: string; Session: TOracleSession);
var
  KeyLo, KeyHi, i: Integer;
  q: ToracleQuery;
  sTmp: string;
begin
  if not VarIsArray(KeyValues) then begin
    raise EVariantError.Create('Должен передаваться массив триад поле, тип, значение');
    exit;
  end;
  KeyLo := VarArrayLowBound(KeyValues, 1);
  KeyHi := VarArrayHighBound(KeyValues, 1);
  if (KeyHi - KeyLo + 1) mod 3 <> 0 then begin
    raise EVariantError.Create('Должен передаваться массив триад поле, тип, значение');
    exit;
  end;
  q := ToracleQuery.Create(nil);
  q.Session := Session;
  q.Cursor := crSQLWait;
  q.SQL.Text := 'delete from ' + sTableName + ' ' + sWhere;
  i := KeyLo;
  while i < KeyHi do begin
    sTmp := VarToStr(KeyValues[i]);
    q.DeclareVariable(sTmp, KeyValues[i + 1]);
    q.SetVariable(sTmp, KeyValues[i + 2]);
    inc(i, 3);
  end;
  try
    Screen.Cursor := crHourGlass;
    q.Execute;
  finally
    Screen.Cursor := crArrow;
    q.Free;
  end;
end;
{********************************************************************************************************}
{        TMenuDocs.CreateDocMenu
{********************************************************************************************************}

procedure TMenuDocs.CreateDocMenu(MenuItem: TMenuItem);
var
//  i: integer;
  q: TOracleDataSet;
  nAppID: Integer;
  mi: TMenuItem;
begin
  if (MenuItem.Count <> 0) then exit;
  q := TOracleDataSet.Create(nil);
  q.Session := os;
  q.SQL.Text := 'SELECT FK_ID FROM ASU.TAPPVIEW WHERE UPPER(FC_OPIS)=' + '''' + UpperCase(ExtractFileName(Paramstr(0))) + '''';
  q.Open;
  if q.RecordCount < 1 then begin
    windows.MessageBox(Application.MainForm.Handle,
      'Программа не может продолжить работу, т.к. нарушена целостность данных (Неверная информация о списке приложений). Обратитесь к Администратору сети.', 'Ошибка', MB_OK +
      MB_ICONERROR);
    q.free;
    Application.Terminate;
  end;
  nAppID := q.FieldByName('FK_ID').AsInteger;
  q.Close;
  q.SQL.Text := 'SELECT DISTINCT ASU.TAPPVIEW.FK_ID,FC_OPIS,FC_VER,FC_NAME FROM ASU.TAPPVIEW,' +
    '(SELECT FK_APPREPID FROM ASU.TREPAPP WHERE FK_APPID=:FK_APPID)' +
    'WHERE ASU.TAPPVIEW.FK_ID=FK_APPREPID';
  q.DeclareVariable('FK_APPID', otInteger);
  q.SetVariable('FK_APPID', nAppID);
  q.Open;
//  q.First;
  While not q.Eof do begin
//  for i := 0 to q.RecordCount - 1 do begin
    mi := TMenuItem.Create(MenuItem);
    mi.Caption := q.FieldByName('FC_NAME').AsString;
    mi.Tag := q.FieldByName('FK_ID').AsInteger;
    mi.OnClick := pOpenReport;
    MenuItem.Add(mi);
    q.Next;
  end;
  q.free;
end;

{********************************************************************************************************}
{        TMenuDocs.CreateSpravMenu
{********************************************************************************************************}

procedure TMenuDocs.CreateSpravMenu(MenuItem: TMenuItem);
var
  i: integer;
  q: TOracleDataSet;
  nAppID: Integer;
  mi: TMenuItem;
begin
  if MenuItem.Count <> 0 then exit;
  q := TOracleDataSet.Create(nil);
  q.Session := os;
  q.SQL.Text := 'SELECT FK_ID FROM ASU.TAPPVIEW WHERE UPPER(FC_OPIS)=' + '''' + UpperCase(ExtractFileName(Paramstr(0))) + '''';
  q.Open;
  if q.RecordCount < 1 then begin
    windows.MessageBox(Application.MainForm.Handle,
      'Программа не может продолжить работу, т.к. нарушена целостность данных (Неверная информация о списке рпиложений). Обратитесь к Администратору сети.', 'Ошибка', MB_OK +
      MB_ICONERROR);
    q.free;
    Application.Terminate;
  end;
  nAppID := q.FieldByName('FK_ID').AsInteger;
  q.Close;
  q.SQL.Text := 'SELECT DISTINCT ASU.TAPPVIEW.FK_ID,FC_OPIS,FC_VER,FC_NAME FROM ASU.TAPPVIEW,' +
    '(SELECT FK_SPRAVAPPID FROM ASU.TSPRAVAPP WHERE FK_ASUID=:FK_APPID)' +
    'WHERE ASU.TAPPVIEW.FK_ID=FK_SPRAVAPPID';
  q.DeclareVariable('FK_APPID', otInteger);
  q.SetVariable('FK_APPID', nAppID);
  q.Open;
  q.First;
  for i := 0 to q.RecordCount - 1 do begin
    mi := TMenuItem.Create(MenuItem);
    mi.Caption := q.FieldByName('FC_NAME').AsString;
    mi.Tag := q.FieldByName('FK_ID').AsInteger;
    mi.OnClick := pOpenReport;
    MenuItem.Add(mi);
    q.Next;
  end;
  q.free;
end;

{********************************************************************************************************}
{        TMenuDocs.DoReadFile
{********************************************************************************************************}

procedure TMenuDocs.DoReadFile(pID: integer; pDestDir, pName: string);
var
  LongRaw: Variant;
  Ptr: Pointer;
  q: TOracleQuery;
  F: file;
begin
  //Слздадим запрос
  q := TOracleQuery.Create(nil);
  q.Session := os;
  q.SQL.Text := 'SELECT FB_FILE FROM ASU.TAPP';
  q.SQL.Add('WHERE FK_ID = :PID');
  q.DeclareVariable('PID', otInteger);
  q.SetVariable('PID', pId);
  q.Execute;
  if not q.EOF then begin // если записи получены
    //Первая и единственная возвращенная запись - variant array of bytes
    LongRaw := q.Field(0);
    // Получим указатель и залочим массив
    Ptr := VarArrayLock(LongRaw);
    // Создадим файл
    try
      AssignFile(F, pDestDir + '\' + pName);
      Rewrite(F, 1);
      BlockWrite(F, Ptr^, VarArrayHighBound(LongRaw, 1) + 1);
      CloseFile(F);
    except
      on E: EInOutError do begin
        case E.ErrorCode of
          3: windows.MessageBox(Application.MainForm.Handle, 'Неверное имя файла. Обратитесь к администратору для настройки АСУ', 'Ошибка', MB_OK + MB_ICONERROR);
          4: windows.MessageBox(Application.MainForm.Handle, 'Слишком много открытых фалов. Закройте все программы и попытайтесь заново.', 'Ошибка', MB_OK + MB_ICONERROR);
          5: windows.MessageBox(Application.MainForm.Handle, 'Доступ к Файлу закрыт. Закройте все программы и попытайтесь заново.', 'Ошибка', MB_OK + MB_ICONERROR);
          101: windows.MessageBox(Application.MainForm.Handle, 'Нехватка места на диске.', 'Ошибка', MB_OK + MB_ICONERROR);
        end;
      end;
    end;
    VarArrayUnlock(LongRaw);
  end;
  q.Destroy;
end;

{********************************************************************************************************}
{        TMenuDocs.pOpenReport
{********************************************************************************************************}

procedure TMenuDocs.pOpenReport(Sender: TObject);
var
  fIni: TINIFile;
  Ver, Path: string;
  SerchRec: TSearchRec;
  q: TOracleDataSet;
  dbVer, dbFileName: string;
  pFrm: Pointer;
  h: THandle;
begin
  fIni := TINIFile.Create('ASU_ORA.INI');
  Path := fIni.ReadString('CONFIG', 'ASU_PATH', 'C:\ASU');
  Path := RemoveBackSlash(Path) + '\';
  q := TOracleDataSet.Create(nil);
  q.Session := Self.os;
  q.SQL.Text := 'select * from ASU.tappview where fk_id=:pFK_APPID';
  q.DeclareVariable('pFK_APPID', otInteger);
  q.SetVariable('pFK_APPID', TMenuItem(Sender).Tag);
  q.CLose;
  q.Open;
  dbVer := q.FieldByName('FC_VER').AsString;
  dbFileName := q.FieldByName('FC_OPIS').AsString;
  Ver := fIni.ReadString('Installed Applications', 'appVer_' + dbFileName, '');
  if Path = '' then begin //создан ли каталог АСУ
    //создана ли такая папка
    if FindFirst(Path, faDirectory, SerchRec) <> 0 then begin
	  ;
	  if not CreateDir(Path) then begin
        windows.MessageBox(Application.MainForm.Handle, PChar('При создании каталога для файлов приложения <' + Path + '>' + #10#13 +
          'Обратитесь к администратору.'), 'Ошибка', MB_OK + MB_ICONERROR);
        Application.MainForm.Close;
      end;
	end;
	fIni.WriteString('CONFIG', 'ASU_Path', Path);
  end;
  if (FindFirst(Path + dbFileName, faAnyFile, SerchRec) <> 0) then begin
    windows.MessageBox(Application.MainForm.Handle, 'Файл отчета не найден. Будет произведена попытка его восстановления.В случае неудачи обратитесь к администратору сети.',
      'Ошибка', MB_OK + MB_ICONERROR);
  end;
  if (Ver = '') or
    (Ver <> dbVer) or
    (FindFirst(Path + dbFileName, faAnyFile, SerchRec) <> 0) then begin //обновление версии
    pFrm := UpdateShow;
    UpdateUpdate(pFrm);
    DoReadFile(TMenuItem(Sender).Tag, Path, dbFileName);
    fIni.WriteString('Installed Applications', 'appVer_' + dbFileName, dbVer);
    UpdateHide(pFrm);
  end;
  try
// + sill 04.05.06
    if LowerCase(ExtractFileExt(dbFileName)) = '.frf' then begin
      h := Winexec(PChar(Path + 'frviewer.exe /file=' + dbFileName), SW_NORMAL)
    end
    else
// -
    //здесь необходимо указать параметр для запускаемого приложения
    h := WinExec(PChar(Path + dbFileName + ' ' + IntToStr(nSotrID)), SW_NORMAL);
    case
      h of
      0:
        windows.MessageBox(Application.MainForm.Handle, 'Нехватает памяти или системных ресурсов. Обратитесь к администратору сети.', 'Ошибка', MB_OK + MB_ICONERROR);
      ERROR_BAD_FORMAT: //The .EXE file is invalid (non-Win32 .EXE or error in .EXE image).
        windows.MessageBox(Application.MainForm.Handle, 'Поврежден файл приложения или неверная настройка параметров АСУ. Обратитесь к администратору сети.', 'Ошибка', MB_OK +
          MB_ICONERROR);
      ERROR_FILE_NOT_FOUND: // The specified file was not found.
        windows.MessageBox(Application.MainForm.Handle, 'Файл не найден. Oбратитесь к администратору сети.', 'Ошибка', MB_OK + MB_ICONERROR);
      ERROR_PATH_NOT_FOUND: // The specified path was not found.
        windows.MessageBox(Application.MainForm.Handle, 'Путь не найден. Oбратитесь к администратору сети.', 'Ошибка', MB_OK + MB_ICONERROR);
    end; //case
  except
    on E: Exception do
      windows.MessageBox(Application.MainForm.Handle, 'Ошибка при запуске отчета', 'Ошибка', MB_OK + MB_ICONERROR);
  end;
  q.Free;
  fIni.Free;
end;

{********************************************************************************************************}
{        GetTextFromClob
{********************************************************************************************************}

function GetTextFromClob(Session: TOracleSession; strTableName: string; strFieldName: string; nID: integer): string;
var
  q: TOracleQuery;
  LOB: TLOBLocator;
  Buffer: array[0..BLOB_WRITE_SIZE - 1] of byte;
  i, j: Integer;
  s: string;
begin
  q := TOracleQuery.Create(Session);
  q.Session := Session;
  q.SQL.Text := 'select :field from :table where fk_id=:PID';
  q.DeclareVariable('FIELD', otSubst);
  q.DeclareVariable('TABLE', otSubst);
  q.DeclareVariable('PID', otInteger);
  q.SetVariable('FIELD', strFieldName);
  q.SetVariable('TABLE', strTableName);
  q.SetVariable('PID', nID);
  q.Execute;
  if q.RowCount = 0 then begin
    result := '';
  end;
  LOB := q.LOBField(strfieldName);
  s := '';
  i := 0;
  LOB.Seek(soFromBeginning, 0);
  while i < Lob.Size do begin
    if (i + BLOB_WRITE_SIZE <= Lob.Size) then begin
      LOB.Read(Buffer, BLOB_WRITE_SIZE);
      for j := 0 to BLOB_WRITE_SIZE - 1 do begin
        if Buffer[j] > 0 then s := s + Chr(Buffer[j]);
      end;
      Lob.Seek(soFromCurrent, BLOB_WRITE_SIZE);
    end
    else begin
      LOB.Read(Buffer, Lob.Size - i);
      for j := 0 to Lob.Size - i - 1 do begin
        if Buffer[j] > 0 then s := s + Chr(Buffer[j]);
      end;
    end;
    inc(i, BLOB_WRITE_SIZE);
  end;
  Result := s;
  q.Free;
end;

{********************************************************************************************************}
{        DO_ADDAUDIT
{********************************************************************************************************}

procedure DO_ADDAUDIT(sBulo: string; sStalo: string; sComment: string; nFK_VRACHID: integer; os: TOracleSession);
begin
end;

{********************************************************************************************************}
{        get_ib
{********************************************************************************************************}

function get_ib(fk_pacid: integer; os: TOracleSession): string;
var
  q: toracledataset;
begin
  q := toracledataset.Create(nil);
  q.Session := os;
  q.SQL.Text := 'select get_ib(:pFK_PACID) as fc_ib from dual';
  q.Close;
  q.Open;
  Result := q.FieldValues['FC_IB'];
  q.free;
end;

{********************************************************************************************************}
{        IniReadString
{********************************************************************************************************}

function IniReadString(sIniFile: string; Section, Ident: string; Default: string = ''): string;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(sIniFile);
  Result := ini.ReadString(Section, Ident, Default);
  ini.free;
end;

{********************************************************************************************************}
{        IniReadInteger
{********************************************************************************************************}

function IniReadInteger(sIniFile: string; Section, Ident: string; Default: integer = -1): integer;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(sIniFile);
  Result := ini.ReadInteger(Section, Ident, Default);
  ini.free;
end;

procedure IniWriteString(sIniFile: string; Section, Ident: string; Value: string);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(sIniFile);
  ini.WriteString(Section, Ident, Value);
  ini.free;
end;
{********************************************************************************************************}
{        IntToBool
{********************************************************************************************************}

function IntToBool(Value: integer): boolean;
begin
  result := value <> 0;
end;

{********************************************************************************************************}
{        BoolToInt
{********************************************************************************************************}

function BoolToInt(Value: boolean): Integer;
begin
  if value then
    result := 1
  else
    result := 0;
end;

{********************************************************************************************************}
{        WriteBoolean
{********************************************************************************************************}

procedure WriteBoolean(const IniFile, IniSection, Ident: string; const Value: Boolean; UseRegistry: Boolean);
begin
  WriteInteger(IniFile, IniSection, Ident, Integer(Value), UseRegistry);
end;

{********************************************************************************************************}
{        WriteFloat
{********************************************************************************************************}

procedure WriteFloat(const IniFile, IniSection, Ident: string; const Value: Double; UseRegistry: Boolean);
begin
  WriteString(IniFile, IniSection, Ident, FloatToStr(Value), UseRegistry);
end;

{********************************************************************************************************}
{        WriteInteger
{********************************************************************************************************}

procedure WriteInteger(const IniFile, IniSection, Ident: string; const Value: Integer; UseRegistry: Boolean);
begin
  WriteString(IniFile, IniSection, Ident, IntToStr(Value), UseRegistry);
end;

{********************************************************************************************************}
{        WriteString
{********************************************************************************************************}

procedure WriteString(const IniFile, IniSection, Ident, Value: string; UseRegistry: Boolean);
  function WriteIni: TObject;
  begin
    Result := TIniFile.Create(IniFile + IniFileExt);
    with TIniFile(Result) do
      WriteString(IniSection, Ident, Value);
  end;

  function WriteReg: TObject;
  begin
    Result := TRegIniFile.Create(IniFile);
    with TRegIniFile(Result) do
      WriteString(IniSection, Ident, Value);
  end;
var
  Obj: TObject;
begin
  Obj := nil;
  try
    if UseRegistry then
      Obj := WriteReg
    else
      Obj := WriteIni;
  finally
    Obj.Free;
  end;
end;

{********************************************************************************************************}
{        ReadBoolean
{********************************************************************************************************}

function ReadBoolean(const IniFile, IniSection, Ident: string; const DefValue: Boolean; UseRegistry: Boolean): Boolean;
begin
  Result := Boolean(ReadInteger(IniFile, IniSection, Ident, Integer(DefValue), UseRegistry));
end;

{********************************************************************************************************}
{        ReadFloat
{********************************************************************************************************}

function ReadFloat(const IniFile, IniSection, Ident: string; const DefValue: Double; UseRegistry: Boolean): Double;
var
  S: string;
begin
  S := ReadString(IniFile, IniSection, Ident, FloatToStr(DefValue), UseRegistry);
  try
    Result := StrToFloat(S);
  except
    Result := DefValue;
  end;
end;

{********************************************************************************************************}
{        ReadInteger
{********************************************************************************************************}

function ReadInteger(const IniFile, IniSection, Ident: string; const DefValue: Integer; UseRegistry: Boolean): Integer;
begin
  try
    Result := StrToInt(ReadString(IniFile, IniSection, Ident, IntToStr(DefValue), UseRegistry));
  except
    Result := DefValue;
  end;
end;

{********************************************************************************************************}
{        ReadString
{********************************************************************************************************}

function ReadString(const IniFile, IniSection, Ident, DefValue: string; UseRegistry: Boolean): string;
var
  S: string;
  function ReadIni: TObject;
  begin
    Result := TIniFile.Create(IniFile + IniFileExt);
    with TIniFile(Result) do
      S := ReadString(IniSection, Ident, DefValue);
  end;

  function ReadReg: TObject;
  begin
    Result := TRegIniFile.Create(IniFile);
    with TRegIniFile(Result) do
      S := ReadString(IniSection, Ident, DefValue);
  end;
var
  Obj: TObject;
begin
  Obj := nil;
  try
    if UseRegistry then
      Obj := ReadReg
    else
      Obj := ReadIni;
    Result := S;
  finally
    Obj.Free;
  end;
end;

{********************************************************************************************************}
{        AppPathFileName
{********************************************************************************************************}

function AppPathFileName(FileName: TFileName): TFileName;
begin
  if ExtractFilePath(FileName) = '' then
    Result := ExtractFilePath(AppFileName) + FileName
  else
    Result := FileName;
end;

{********************************************************************************************************}
{        FormatDBehGrid
{********************************************************************************************************}

//procedure DoFormatDBehGrid(gr: TDBGridEh; strTable: string; os: TOracleSession);
//var
//  q: TOracleDataSet;
//  i: integer;
//begin
//  q := TOracleDataSet.Create(gr);
//  q.Session := TOracleDataSet(gr.DataSource.DataSet).Session;
//  q.SQL.Text := 'SELECT COMMENTS,COLUMN_NAME FROM ALL_COL_COMMENTS WHERE TABLE_NAME=get_upper(''' + strTable + ''')';
//  q.Open;
//  for i := 0 to gr.Columns.Count - 1 do begin
//    q.Locate('COLUMN_NAME', gr.Columns.Items[i].FieldName, []);
//    gr.Columns.Items[i].Title.Caption := q.FieldByName('COMMENTS').AsString;
//  end;
//  q.free;
//end;

function Remove1310(const sString: string): string;
begin
  Result := TRIM(StringReplace(sString, #13#10, ' ', [rfReplaceAll]));
end;

initialization
  InitializeCriticalSection(FLogLock);
  MenuDocs := TMenuDocs.Create;
  AppFileName := ParamStr(0);

finalization
  DeleteCriticalSection(FLogLock);
  MenuDocs.Free;
end.
