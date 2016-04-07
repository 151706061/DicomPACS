// все датасеты и квери должны иметь неприсвоенную сессию
// сессия присвоится в крейте главной формы аптеки (fMainForm) через
// процедуру SetSession. Это нужно для совместимости
// юнита с внешними отчетами, которые берут отсюда меню pmPrintSelect
// Воронов О.А.
unit fdmPrintReports;

interface

uses
  SysUtils, Classes, frxClass, frxDBSet, DB, OracleData, Controls, Forms, Windows, FR_Class,
  Menus, frxExportXLS, frXMLExl, frOLEExl, frxExportXML, Oracle, OracleMonitor,
  FR_DSet, FR_DBSet, frHTMExp, FR_E_HTML2, FR_E_TXT, FR_E_HTM, FR_View, frxCross, Printers, frxDCtrl;

const NullDate = -700000;
type
  TdmPrintReports = class(TDataModule)
    odsInvoice2: TOracleDataSet;
    frxDBdsInvoice2: TfrxDBDataset;
    frxTrebNakl: TfrxReport;
    frxTrebZam: TfrxReport;
    oqRepM11_Init: TOracleQuery;
    oqRepM11_End: TOracleQuery;
    oqRepM11_UpdateParams: TOracleQuery;
    odsSimpleTrebData: TOracleDataSet;
    odsSimpleTrebHeader: TOracleDataSet;
    frxSimpleTreb: TfrxReport;
    frxDBdsSimpleTrebData: TfrxDBDataset;
    frxDBdsSimpleTrebHeader: TfrxDBDataset;
    odsTSMINI: TOracleDataSet;
    frInvoice_MID: TfrReport;
    frDBdsInvoice_MID: TfrDBDataSet;
    frxTrebNakl_Old: TfrxReport;
    odsInvoice_MID: TOracleDataSet;
    frxReport1: TfrxReport;
    odsGLF_in_Doc: TOracleDataSet;
    frxDBdsGLF_in_Doc: TfrxDBDataset;
    odsFinsource_in_Doc: TOracleDataSet;
    frxDBdsFinsource_in_Doc: TfrxDBDataset;
    frxCrossObject1: TfrxCrossObject;
    odsTTrebDpc: TOracleDataSet;
    frxDBdsTTrebDpc: TfrxDBDataset;
    odsTDPC: TOracleDataSet;
    frxDBdsTDPC: TfrxDBDataset;
    OracleDataSet1: TOracleDataSet;
    frxReport2: TfrxReport;
    frxReport3: TfrxReport;
    oqTSMINI: TOracleQuery;
    frxNarcoticAct: TfrxReport;
    frxAutoFillPlan: TfrxReport;
    odsAutoFillPlanPrint: TOracleDataSet;
    odsTrebDpcList: TOracleDataSet;
    frxdsAutoFillPlan: TfrxDBDataset;
    frxdsTrebDpcList: TfrxDBDataset;
    odsRashByAutoFillPlan: TOracleDataSet;
    frxdsRashByAutoFillPlan: TfrxDBDataset;
    odsAutoFillDeficit: TOracleDataSet;
    frxdsAutoFillDeficit: TfrxDBDataset;
    frxInvOpis: TfrxReport;
    frxRpNewInventariz: TfrxReport;
    odsInvListPrint: TOracleDataSet;
    frxdsInvListPrint: TfrxDBDataset;
    procedure frxTrebNaklGetValue(const VarName: String; var Value: Variant);
    procedure frxTrebZamGetValue(const VarName: String;  var Value: Variant);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    function frxTrebNaklUserFunction(const MethodName: String;
      var Params: Variant): Variant;
    procedure frInvoice_MIDMouseOverObject(View: TfrView;
      var Cursor: TCursor);
    procedure frInvoice_MIDObjectClick(View: TfrView);
    procedure frInvoice_MIDUserFunction(const Name: String; p1, p2,
      p3: Variant; var Val: Variant);
    procedure frxTrebNaklPrintReport(Sender: TObject);
    procedure odsSimpleTrebHeaderAfterClose(DataSet: TDataSet);
    function frxSimpleTrebUserFunction(const MethodName: string;
      var Params: Variant): Variant;
    procedure frxNarcoticActGetValue(const VarName: string; var Value: Variant);
    procedure frxAutoFillPlanGetValue(const VarName: string; var Value: Variant);
    procedure frxInvOpisGetValue(const VarName: string; var Value: Variant);
  private
    { Private declarations }
    FFC_DOC : string;
    FFC_MO_GR_FROM, FFC_MO_GR_TO, FFC_MO_FROM, FFC_MO_TO, FFC_COMMENT, FFC_ZAV_OTD_TO: string;
    FFC_INVOICE_DOC, FFC_INVOICE_TREB, FFC_DOC_DATE : string;
    FFC_FINSOURCE : string; // Added by Neronov A.S. 15.11.2011
    FFC_SMS_TO, FFC_SMS_FROM : string; // Added by Neronov A.S. 18.07.2012
    FFD_INVOICE, FFD_DOC_DATE: Variant;
    fFL_FROM_OTD_PLAT_USLUG, fFK_FINSOURCEID : Integer;
    FSigns : string;
    VAR_OTPUSTIL_DOLJNOST, VAR_POLUCHIL_DOLJNOST : string;

    FMDS_FORMS_M11_FK_ID, FMDS_PARAMS_M11_FK_ID : Integer; // параметры для вызова отчета
    FTreb_FL_STAC : boolean;

  public
    { Public declarations }
    PRINT_TREB_NAKL_V2_FNAME : string;
    procedure PrintTreb(const aDPID : Integer; aFC_DOC : string; const aFD_INVOICE: TDate; aFC_MO_GR_FROM, aFC_MO_GR_TO, aExcelFileName: string;
      aFC_MO_FROM : string = ''; aFC_MO_TO : string = ''; aIsPrintSprav : Boolean = True; aSkladID : integer  = -1; aTrebID : integer = -1;
      aIsPrintDecode : boolean = false; aIsPrintLat : Boolean = false; aIsPrintNarcoticAct : Boolean = False );
    procedure PrintTrebOld(const aDPID : Integer; aFC_DOC : string; const aFD_INVOICE: TDate; aFC_MO_GR_FROM, aFC_MO_GR_TO: string; aFC_MO_FROM : string = ''; aFC_MO_TO : string = '');
    procedure PrintSimlpeTreb(const aTrebID : integer);
    procedure SetSession( aSession : TOracleSession );
    function GetValueFromTSMINI( const aSection, aKey : string; aDefVal : string = '' ) : string;
    procedure SetValueIntoTSMINI( const aSection, aKey, aValue : string );
    procedure DeleteOldReports;
    procedure PrintNarcoticAct ( const ADPID : Integer; AfrxReport : TfrxReport; aIsPrintSprav: Boolean = True ) ;
    procedure PrintAutoFillPlan ( const ATrebDPCList, AAutoFillPlan : TOracleObject; AFK_FINSOURCEID : Integer = -1; AFC_DOC: string = ''; AFD_INVOICE : string = '';
      AFC_MO_GR_FROM : string = ''; AFC_MO_GR_TO : string = '');

    procedure PrintInvOpis ( const AInvListId : integer );

    procedure frReportOnGetValue(const ParName: String;  var ParValue: Variant);
  end;

  // возвращает дату в виде строки:  "23" января 2007 г.
  function GetDateStr( const aDate : TDate ): string;
  function MoneyToString(Summa: double; lRub: boolean): string;
  function IniWriteString2(Section, Ident: string; Value: string) : integer;
  function IniReadString2(Section, Ident: string; Default: string = ''): string;
  function GET_NAIM_KOL(aNumber: Integer; aRod : Integer): string;

  function SavRegParm ( p_section:string; p_key:string; p_str:string ):string;
  function GetRegParm( p_section:string; p_key:string ):string;

  function GetFromTSmini( p_section:string; p_key:string ):string;
  function SavToTSmini ( p_section:string; p_key:string; p_str:string ):string;

//  function PrepareFilePath(const aFileName : string ) : string;
var
  dmPrintReports: TdmPrintReports;


implementation
uses DateUtils, fr_utils, fr_const, fDateInput, Graphics, Dialogs, fGlobal,
     ShellAPI, fdmMain, IniFiles, fSelectCheckedList, fdmPrintSelect, Math,
     fm_Select_MO, fm_Select_Sotr, variants, Registry, fNarcoticActReportUnit;
{$R *.dfm}

function SavToTSmini ( p_section:string; p_key:string; p_str:string ):string;   // SavToTSmini('MANAGER_DOC', 'DOLJ_GLAV_BUH', '');
begin
  dmPrintReports.SetValueIntoTSMINI(p_section,p_key,p_str);
end;

function GetFromTSmini( p_section:string; p_key:string ):string;
begin
  Result := dmPrintReports.GetValueFromTSMINI( p_section, p_key );
end;

function SavRegParm ( p_section:string; p_key:string; p_str:string ):string;
var Reg : TRegIniFile;
    v_user_name, v_key : string;
const c_mn_pth = '\Software\Softmaster\Medica\';
begin
  v_user_name := dmMain.pkgMO.GETNAMEBYID( dmMain.MOID ) ;
  v_key:=c_mn_pth+v_user_name+'\'+p_section;
  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if not Reg.OpenKey(v_key, False) then
      Reg.CreateKey(v_key);
  try
    Reg.WriteString(v_key, p_key, p_str );
  finally
    Reg.Free;
  end;
  Result:='';
end;

function GetRegParm( p_section:string; p_key:string ):string;
var Reg : TRegIniFile;
    v_user_name, v_key, v_res : string;
const c_mn_pth = '\Software\Softmaster\Medica\';
begin
  v_res:='';
  v_user_name := dmMain.pkgMO.GETNAMEBYID( dmMain.MOID ) ;
  v_key:=c_mn_pth+v_user_name+'\'+p_section;
  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if not Reg.OpenKey(v_key, False) then
      Reg.CreateKey(v_key);
  try
    v_res := Reg.ReadString(v_key, p_key, '' );
  finally
    Reg.Free;
  end;
  Result := nvl(v_res,'');
end;

function GET_NAIM_KOL(aNumber: Integer; aRod : Integer): string;
begin
  case aRod of
    0: Result := DMMAIN.get_countstr(aNumber);
    1: Result := StringReplace(DMMAIN.get_countstr(aNumber), 'один', 'одна', [rfReplaceAll]);
    2: Result := StringReplace(DMMAIN.get_countstr(aNumber), 'один', 'одно', [rfReplaceAll]);
  end;
end;

function MoneyToString(Summa: double; lRub: boolean): string;
const
    TysStr: array[1..4] of string = ('', 'две', 'три', 'четыре');
    Ed2_4Str: array[2..4] of string = ('два', 'три', 'четыре');
    Ed5_19Str: array[5..19] of string = ('пять', 'шесть', 'семь', 'восемь', 'девять',
        'десять', 'одиннадцать', 'двенадцать', 'тpинадцать',
        'четыpнадцать', 'пятнадцать', 'шестнадцать', 'семнадцать',
        'восемнадцать', 'девятнадцать');
    DesStr: array[2..9] of string = ('двадцать', 'тpидцать', 'соpок', 'пятьдесят', 'шестьдесят',
        'семьдесят', 'восемьдесят', 'девяносто');
    SotStr: array[1..9] of string = ('сто', 'двести', 'тpиста', 'четыpеста', 'пятьсот', 'шестьсот',
        'семьсот', 'восемьсот', 'девятьсот');

    function MakeStr(C: Char; N: Integer): string;
    begin
      if N < 1 then Result := ''
      else begin
    {$IFNDEF WIN32}
				if N > 255 then N := 255;
    {$ENDIF WIN32}
        SetLength(Result, N);
        FillChar(Result[1], Length(Result), C);
      end;
    end;

    function AddChar(C: Char; const S: string; N: Integer): string;
    begin
      if Length(S) < N then
        Result := MakeStr(C, N - Length(S)) + S
      else Result := S;
    end;

    function KopToStr(Kop: integer): string;
    var
        sRet: string;
    begin
        sRet := '';
        sRet := AddChar('0', IntToStr(Kop), 2);
        case Kop of
            1, 21, 31, 41, 51, 61, 71, 81, 91: sRet := sRet + ' копейка';
            0, 5..20, 25..30, 35..40, 45..50, 55..60, 65..70, 75..80, 85..90, 95..99: sRet := sRet + ' копеек';
            2..4, 22..24, 32..34, 42..44, 52..54, 62..64, 72..74, 82..84, 92..94: sRet := sRet + ' копейки';
        end;
        KopToStr := sRet;
    end;

var
    ResStr, ST: string;
    Rub: integer;
		Kop: integer;
    Desed, Des: integer;
    Mil, Tys, Sot: integer;
begin
    ResStr := '';
    if Summa > 999999999.99 then
        exit;

    Rub := Trunc(Summa);
    Mil := Trunc(Rub / 1000000);
    Tys := Trunc(Rub / 1000) - Mil * 1000;
    Kop := round((Summa - Rub) * 100);

   // миллионы
    if Mil > 0 then begin
        Sot := trunc(Mil / 100);
        if Sot > 0 then
            ResStr := ResStr + SotStr[Sot] + ' ';
        Desed := Mil - 100 * Sot;
//        Des := 0; - убрал вылазит хинт Воронов О.А.
        while true do
            case DESED of
                0: begin
                        ResStr := ResStr + 'миллионов ';
                        Break;
                    end;
                1: begin
                        ResStr := ResStr + 'один миллион ';
                        Break;
                    end;
                2..4: begin
												ResStr := ResStr + ED2_4STR[DESED] + ' миллиона ';
                        Break;
                    end;
                5..19: begin
                        ResStr := ResStr + ED5_19STR[DESED] + ' миллионов ';
                        Break;
                    end;
            else begin
                    Des := Trunc(DESED / 10);
                    ResStr := ResStr + DESSTR[DES] + ' ';
                    DESED := DESED - 10 * DES;
                end;
            end;
    end;
   //тысячи
    if Tys > 0 then begin
        Rub := Rub - Tys * 1000 - Mil * 1000000;
        SOT := Trunc(Tys / 100);
        if SOT > 0 then
            ResStr := ResStr + SOTSTR[SOT] + ' ';
        DESED := TYS - 100 * SOT;
//        Des := 0; - убрал вылазит хинт Воронов О.А.
        while true do
            case DESED of
                0: begin
                        ResStr := ResStr + 'тысяч ';
                        Break;
                    end;
                1: begin
                        ResStr := ResStr + 'одна тысяча ';
                        Break;
										end;
                2..4: begin
                        ResStr := ResStr + TYSSTR[DESED] + ' тысячи ';
                        Break;
                    end;
                5..19: begin
                        ResStr := ResStr + ED5_19STR[DESED] + ' тысяч ';
                        Break;
                    end;
            else begin
                    Des := Trunc(DESED / 10);
                    ResStr := ResStr + DESSTR[DES] + ' ';
                    DESED := DESED - 10 * DES;
                end;
            end;
    end;
   //сотни
    SOT := Trunc(RUB / 100);
    if (SOT > 0) and (SOT < 10) then
        ResStr := ResStr + SOTSTR[SOT] + ' ';
    DESED := RUB - 100 * SOT;
//    Des := 0; - убрал вылазит хинт Воронов О.А.
    if Summa < 1 then
        ResStr := 'ноль';
    while true do
        case DESED of
            0: Break;
            1: begin
                    ResStr := ResStr + 'один';
                    Break;
                end;
						2..4: begin
                    ResStr := ResStr + ED2_4STR[DESED];
                    Break;
                end;
            5..19: begin
                    ResStr := ResStr + ED5_19STR[DESED];
                    Break;
                end;
        else begin
                Des := Trunc(DESED / 10);
                ResStr := ResStr + DESSTR[DES] + ' ';
                DESED := DESED - 10 * DES;
            end;
        end;
    case DESED of
        0, 5..19: ST := ' pублей ';
        1: ST := ' pубль ';
        2..4: ST := ' pубля ';
    end;
    if lRub then begin
        ResStr := ResStr + ST;
        ResStr := ResStr + KopToStr(Kop);
    end;
    ResStr := AnsiUpperCase(ResStr[1]) + copy(ResStr, 2, Length(ResStr) - 1);
    Result := ResStr;
end;

function GetDateStr( const aDate : TDate ): string;
const
  MonthsRusNames : array[1..12] of string = ('января', 'февраля', 'марта', 'апреля', 'мая','июня', 'июля', 'августа', 'сентября', 'октября', 'ноября', 'декабря');
begin
  Result := '«'+IntToStr(DayOf(aDate))+'» '+MonthsRusNames[MonthOf(aDate)]+' '+IntToStr(YearOf(aDate))+' г.';
end;

function IniWriteString2(Section, Ident: string; Value: string) : integer;
begin
  dmMain.JvAppIniFileStorage.Flush;
  IniWriteString(iniFileName, Section, Ident, Value);
  dmMain.JvAppIniFileStorage.Reload;
  Result := 0;
end;

function IniReadString2(Section, Ident: string; Default: string = ''): string;
begin
  Result := IniReadString(iniFileName, Section, Ident, Default);
end;

function MONEYSTR(Summa: double): string;
begin
  Result := MoneyToString(RoundTo(Summa,-2), TRUE);
end;

function ROUND_TO(aFloatNum : double; aDigits : integer): double;
begin
  Result := RoundTo(aFloatNum, aDigits );
end;

procedure TdmPrintReports.DeleteOldReports;
var
  CurPath : string;
  sr: TSearchRec;
  FileAttrs: Integer;
begin
  // путь такой же, как и при создании отчетов (см. PrepareFilePath)
  CurPath := IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName))+'Reports\';
  FileAttrs := faAnyFile;
  if SysUtils.FindFirst(CurPath+'*.*', FileAttrs, sr) = 0 then
  begin
    repeat
      SysUtils.DeleteFile(CurPath+sr.Name);  // удаляем все файлы
    until FindNext(sr) <> 0;
    SysUtils.FindClose(sr);
  end;
end;

//procedure ExportFRToExcel( var aReport : TfrReport; const aFileName : string);
//begin
//  aReport.ExportTo( dmPrintReports.frOLEExcelExport1, PrepareFilePath(aFileName) );
//end;
//
//procedure ExportFRToExcel( var aReport : TfrxReport; const aFileName : string );
//begin
//  dmPrintReports.frxXLSExport1.FileName := PrepareFilePath(aFileName);
//  aReport.Export( dmPrintReports.frxXLSExport1 );
//end;
//
//procedure ExportFRToFilter( var aReport : TfrReport;  const aFileName : string; aFilter : TfrExportFilter); overload;
//begin
//  aReport.ExportTo( aFilter, PrepareFilePath(aFileName) );
//end;
//
//procedure ExportFRToFilter( var aReport : TfrxReport;  const aFileName : string; aFilter : TfrxCustomExportFilter); overload;
//begin
//  aFilter.FileName := PrepareFilePath(aFileName);
//  aReport.Export(aFilter);
//end;

procedure TdmPrintReports.PrintTreb( const aDPID : Integer;
                                     aFC_DOC : string;
                                     const aFD_INVOICE: TDate;
                                     aFC_MO_GR_FROM,
                                     aFC_MO_GR_TO,
                                     aExcelFileName: string;
                                     aFC_MO_FROM : string = '';
                                     aFC_MO_TO : string = '';
                                     aIsPrintSprav : Boolean = True;
                                     aSkladID : integer  = -1;
                                     aTrebID : integer = -1;
                                     aIsPrintDecode : boolean = false;
                                     aIsPrintLat : Boolean = false;
                                     aIsPrintNarcoticAct : Boolean = False );
  function GetOrientedRepName ( ARepFile, AExtention : string; APageOrientation : TPageOrientation ) : string;
  var
    RepFile, strPageOrientation : string;
  begin
    Result := ARepFile;

    if ( APageOrientation = poNone ) then // ориентация не выбиралась
      Exit;

    case APageOrientation of
      poPortrait : strPageOrientation := '_portrait';
      poLandscape : strPageOrientation := '_landscape';
      else
        strPageOrientation := EmptyStr;
    end;

    RepFile := StringReplace( ARepFile, AExtention, EmptyStr, [rfReplaceAll, rfIgnoreCase] );   // без раcширения

    if FileExists ( RepFile + strPageOrientation + AExtention )  then
      RepFile := RepFile + strPageOrientation + AExtention      // есть пф с явно указанной ориентацией
    else
      RepFile := RepFile + AExtention;

    Result := RepFile;                          
  end;
var
  fn_summ : Double;
  RepFileName : string;
  i : Integer;
  P : TPoint;
  SelectPageOrientation : Boolean;
  strExtention : string;
begin
  if dmPrintSelect.PrintFlag = 0 then Exit;

  SelectPageOrientation := (dmMain.ConfigParams.GetParamValue('FUNC_PRINT_TREBNAKL_USE_PAGE_ORIENTATION', 0) = 1) ;
  strExtention := '.fr3';

  if SelectPageOrientation then
  begin
    GetCursorPos( P );
    dmPrintSelect.pmOrientationSelect.Popup( P.X, P.Y ); // даем возможность выбрать ориентацию
    Application.ProcessMessages;

    if (dmPrintSelect.PageOrientation = poNone)  then    // не выбрана ориентация страницы
      Exit;
  end;  

// механизм загрузки отчета для разных складов - для медсестер и провизоров
  if (PRINT_TREB_NAKL_V2_FNAME <> '')and(dmMain.ConfigParams.GetParamValue('FUNC_PRINT_TREB_NAKL_V2', False) = True) then
  begin
    RepFileName := GetOrientedRepName ( PRINT_TREB_NAKL_V2_FNAME,  strExtention, dmPrintSelect.PageOrientation ) ;   

    if FileExists ( RepFileName ) then
      frxTrebNakl.LoadFromFile(RepFileName);
  end
  else
  begin
    if aSkladID > 0 then  // если склады используются
    begin
      dmMain.odsSklad.Locate('fk_id', aSkladID, []);

      if aIsPrintDecode then  //Added by Neronov A.S. 01.12.2011
        RepFileName := frxTrebNakl.Name+'_'+dmMain.odsSklad.FieldByName('FC_SYNONIM').AsString+'_WITH_DECODE' + strExtention
      else
        RepFileName := frxTrebNakl.Name+'_'+dmMain.odsSklad.FieldByName('FC_SYNONIM').AsString + strExtention;

      if isShortPrint > 0
      then begin
        if aIsPrintDecode
        then begin
          if FileExists(frxTrebNakl.Name+'_'+dmMain.odsSklad.FieldByName('FC_SYNONIM').AsString+'_WITH_DECODE_Short' + strExtention)
          then RepFileName := frxTrebNakl.Name+'_'+dmMain.odsSklad.FieldByName('FC_SYNONIM').AsString+'_WITH_DECODE_Short' + strExtention;
        end
        else begin
          if FileExists(frxTrebNakl.Name+'_'+dmMain.odsSklad.FieldByName('FC_SYNONIM').AsString+'_Short' + strExtention)
          then RepFileName := frxTrebNakl.Name+'_'+dmMain.odsSklad.FieldByName('FC_SYNONIM').AsString+'_Short' + strExtention;
        end;
      end;

      if not FileExists(RepFileName) then
      begin
        RepFileName := frxTrebNakl.Name + strExtention;

        if ( isShortPrint > 0 ) and
           ( FileExists(frxTrebNakl.Name+'_Short' + strExtention) ) then
            RepFileName := frxTrebNakl.Name+'_Short' + strExtention;
      end;

      RepFileName := GetOrientedRepName( RepFileName, strExtention, dmPrintSelect.PageOrientation );

      if FileExists(RepFileName) then
        frxTrebNakl.LoadFromFile(RepFileName);

    end
    else // если склад один
    begin
      RepFileName := frxTrebNakl.Name + strExtention;

      if ( isShortPrint > 0 ) and
         ( FileExists(frxTrebNakl.Name+'_Short' + strExtention) )
           then RepFileName := frxTrebNakl.Name+'_Short' + strExtention;

      RepFileName := GetOrientedRepName( RepFileName, strExtention, dmPrintSelect.PageOrientation );

      if FileExists(RepFileName) then
        frxTrebNakl.LoadFromFile(RepFileName);
    end;
  end;          

  FFC_DOC        := aFC_DOC;
  FFD_INVOICE    := aFD_INVOICE;
  FFC_MO_GR_FROM := aFC_MO_GR_FROM;
  FFC_MO_GR_TO   := aFC_MO_GR_TO;
  FFC_MO_FROM    := aFC_MO_FROM;
  FFC_MO_TO      := aFC_MO_TO;

  //Added by Neronov A.S. 15.11.2011
  with TOracleDataSet.Create(self) do
  begin
    try
      Session := odsInvoice2.Session;
      SQL.Text := 'select d.fc_comment, f.fc_name fc_finsource from med.tdocs d, med.tfinsource f WHERE d.fk_finsource_id = f.fk_id (+) and d.dpid = '+IntToStr(aDPID);
      Open;
      FFC_COMMENT := FieldByName('fc_comment').AsString;
      FFC_FINSOURCE := FieldByName('fc_finsource').AsString;
    finally
      Free;
    end;
  end;

  odsSimpleTrebHeader.Close;
  odsSimpleTrebHeader.SetVariable('FK_TREBID', aTrebID);
  odsSimpleTrebHeader.SetVariable('DPID',      aDPID);  
  odsSimpleTrebHeader.Open;

  FFC_SMS_FROM := odsSimpleTrebHeader.FieldByName('FC_SMS_FROM').AsString;
  FFC_SMS_TO   := odsSimpleTrebHeader.FieldByName('FC_SMS_TO').AsString;

  FTreb_FL_STAC := (odsSimpleTrebHeader.FieldByName('fl_stac').AsInteger = 1);

  // если печать не из списка документов, то дата тоже берется не из документа
  if odsSimpleTrebHeader.FieldByName('FD_DOC_INVOICE').IsNull then
    FFC_INVOICE_DOC := ''
  else
    FFC_INVOICE_DOC  := DateToStr(odsSimpleTrebHeader.FieldByName('FD_DOC_INVOICE').AsDateTime);

  if odsSimpleTrebHeader.FieldByName('FD_DATE').IsNull then
    FFC_INVOICE_TREB := ''
  else
    FFC_INVOICE_TREB := DateToStr(odsSimpleTrebHeader.FieldByName('FD_DATE').AsDateTime);

  if odsSimpleTrebHeader.FieldByName('FD_DOC_DATA').IsNull then
    FFC_DOC_DATE := ''
  else
    FFC_DOC_DATE := DateToStr(odsSimpleTrebHeader.FieldByName('FD_DOC_DATA').AsDateTime);
  FFD_DOC_DATE := odsSimpleTrebHeader.FieldByName('FD_DOC_DATA').AsVariant;
  fFL_FROM_OTD_PLAT_USLUG := odsSimpleTrebHeader.FieldByName('FL_FROM_OTD_PLAT_USLUG').AsInteger;

  FFC_ZAV_OTD_TO := IniReadString(iniFileName, 'MANAGER_DOC', 'ZAV_OTD_TO', '');
  if FFC_ZAV_OTD_TO = '' then
  begin
    with TOracleDataSet.Create(self) do
    begin
      Session := odsInvoice2.Session;
      SQL.Text := 'SELECT MAX (asu.get_sotrname(nvl(s.fk_id,-1))) AS zav_fio'#13#10+
                  'FROM med.tsotr_medica s,'#13#10+

                  '  (SELECT max(m1.fk_sotrid) as fk_sotrid FROM med.tmo m1, med.tdocs d'#13#10+
                  '   where m1.moid = d.motoid and d.dpid = :aDPID) CurSotrByDOC,'#13#10+

                  '  (SELECT max(m2.fk_sotrid) as fk_sotrid FROM med.tmo m2, med.ttreb t '#13#10+
                  '   where m2.moid = t.fk_mofromid and t.fk_id = :aTREBID) CurSotrByTREB'#13#10+

                  'WHERE'#13#10+
                  '    s.fk_id = asu.get_zavotdid(nvl(CurSotrByDOC.fk_sotrid,CurSotrByTREB.fk_sotrid))'#13#10;
      DeclareAndSet('aDPID',   otInteger, aDPID);
      DeclareAndSet('aTREBID', otInteger, aTrebID);
      Open;
      FFC_ZAV_OTD_TO := FieldByName('zav_fio').AsString;
      Free;
    end;
  end;

  with TOracleQuery.Create(self) do
  begin
    Session := odsInvoice2.Session;
    SQL.Text := 'begin'#13#10+
                '  MED.DO_UPDATE_TREBKOL(:aDPID);'#13#10+
                'end;';
    DeclareAndSet('aDPID', otInteger, aDPID);
    Execute;
    Free;
  end;

  odsInvoice2.Close;
  odsInvoice2.SetVariable('PRINT_LAT_NAME', dmMain.ConfigParams.GetParamValue('FUNC_SHOW_LAT_NAME_IN_RASH_BY_TREB', 1));
  if aIsPrintLat  then  //Если явно указано, что печатать на латинице, то печатаем на латинице
    odsInvoice2.SetVariable('PRINT_LAT_NAME', 1);
  
  odsInvoice2.SetVariable('adpid',aDPID);
  odsInvoice2.SetVariable('aTrebID',aTrebID);

  odsTTrebDpc.Close;
  odsTTrebDpc.SetVariable('adpid',aDPID);
  odsTTrebDpc.SetVariable('aTrebID',aTrebID);
  odsTTrebDpc.Open;

  odsTDPC.SetVariable('adpid',aDPID);
  odsTDPC.Open;

  if (aIsPrintSprav)or((dmMain.ConfigParams.GetParamValue('FUNC_IS_PRINT_TREB_NAKL_VID0_MEDICS', 1) = 0)and(aDPID > 0)) then
  begin
    odsInvoice2.Filter := 'FN_VIDANO_KOL > 0';
    odsInvoice2.Filtered := True;
  end;

  odsInvoice2.Open;

  frxTrebNakl.AddFunction('function MONEYSTR(Summa: double): string');
  frxTrebNakl.AddFunction('function ROUND_TO(aFloatNum : double; aDigits : integer): double');
  frxTrebNakl.AddFunction('function IniWriteString2(Section, Ident: string; Value: string) : integer');
  frxTrebNakl.AddFunction('function IniWriteString3(Section, Ident: string; Value: string) : integer');

  frxTrebNakl.AddFunction('function DoShowSelectMO_str(aFC_MO : string) : string');
  frxTrebNakl.AddFunction('function DoShowSelectMO_str2(const aFC_MO : string; var aSpec : string) : string');
  frxTrebNakl.AddFunction('function DoShowSelectMO_str3(const aFC_MO : string; var aSpec : string) : string');

  frxTrebNakl.AddFunction('function GetValueFromTSMINI(aSection, aKey : string ) : string');
  frxTrebNakl.AddFunction('function IniReadString2(Section, Ident: string; Default: string = ''): string');

  frxTrebNakl.AddFunction('function SavRegParm ( p_section:string; p_key:string; p_str:string );');
  frxTrebNakl.AddFunction('function GetRegParm( p_section:string; p_key:string ):string;');

  frxTrebNakl.AddFunction('function GetFromTSmini( p_section:string; p_key:string ):string;');
  frxTrebNakl.AddFunction('function SavToTSmini ( p_section:string; p_key:string; p_str:string ):string;');

  if (aTrebID > 0) then  // вызвали из списка требований
  begin
    if frxTrebNakl.FindObject('MasterData4') <> nil then
      frxTrebNakl.FindObject('MasterData4').Visible := False;
    if frxTrebNakl.FindObject('Memo50') <> nil then
      frxTrebNakl.FindObject('Memo50').Font.Color := clWhite;
    if frxTrebNakl.FindObject('Memo84') <> nil then
      frxTrebNakl.FindObject('Memo84').Font.Color := clWhite;
    if frxTrebNakl.FindObject('Memo86') <> nil then
      frxTrebNakl.FindObject('Memo86').Font.Color := clWhite;
    if frxTrebNakl.FindObject('Memo79') <> nil then
      frxTrebNakl.FindObject('Memo79').Font.Color := clWhite;

    // для скрытия значений в колонках во всех новых формы писать вот с такими именами -
    if frxTrebNakl.FindObject('meKolOtpusheno') <> nil then
      frxTrebNakl.FindObject('meKolOtpusheno').Font.Color := clWhite;
    if frxTrebNakl.FindObject('mePrice') <> nil then
      frxTrebNakl.FindObject('mePrice').Font.Color := clWhite;
    if frxTrebNakl.FindObject('meSumm') <> nil then
      frxTrebNakl.FindObject('meSumm').Font.Color := clWhite;
    if frxTrebNakl.FindObject('meKolOtpustil') <> nil then
      frxTrebNakl.FindObject('meKolOtpustil').Font.Color := clWhite;
    if frxTrebNakl.FindObject('meKolPoluchil') <> nil then
      frxTrebNakl.FindObject('meKolPoluchil').Font.Color := clWhite;


    if (dmMain.ConfigParams.GetParamValue('FUNC_USE_GROUP_LF', 0) = 1) and (frxTrebNakl.FindObject('MasterData_GLF')<>nil) then
      frxTrebNakl.FindObject('MasterData_GLF').Visible := False;

    if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1) and (frxTrebNakl.FindObject('MasterData_FinSource')<>nil) then
      frxTrebNakl.FindObject('MasterData_FinSource').Visible := False;      

    if frxTrebNakl.PagesCount = 3 then  // для екатеринбурга
    begin
      frxTrebNakl.Pages[2].Visible := False;
    end;
  end
  else
  begin
    odsGLF_in_Doc.Close;
    odsGLF_in_Doc.SetVariable('adpid', aDPID);
    odsGLF_in_Doc.Open;

    odsFinsource_in_Doc.Close;
    odsFinsource_in_Doc.SetVariable('adpid', aDPID);
    odsFinsource_in_Doc.Open;
  end;

  if SelectPageOrientation then // если даем выбирать ориентацию страниц
    TfrxReportPage (frxTrebNakl.Pages[1]).Orientation := TPrinterOrientation ( dmPrintSelect.PageOrientation);

  frxTrebNakl.PrepareReport();

  if ( aIsPrintNarcoticAct ) and ( aDPID > 0 )  then
  begin
      PrintNarcoticAct( aDPID,
        frxTrebNakl,
        ( (aIsPrintSprav)or((dmMain.ConfigParams.GetParamValue('FUNC_IS_PRINT_TREB_NAKL_VID0_MEDICS', 1) = 0)and(aDPID > 0)) ) );
  end;

  case dmPrintSelect.PrintFlag of // флаг куда печатать
    1:
    begin
      odsInvoice2.First;
      fn_summ := 0;
      while not odsInvoice2.Eof do
      begin
        fn_summ := fn_summ + odsInvoice2.FieldByName('FN_VIDANO_SUM').AsFloat;
        odsInvoice2.Next;
      end;
      odsInvoice2.First;

      oqRepM11_UpdateParams.SetVariable('mds_params_fk_id', FMDS_PARAMS_M11_FK_ID);
      oqRepM11_UpdateParams.SetVariable('TrebId',   aDPID);
      oqRepM11_UpdateParams.SetVariable('RecCount', odsInvoice2.RecordCount);
      oqRepM11_UpdateParams.SetVariable('FN_SUMM',  FloatToStr(RoundTo(fn_summ,-2)));
      oqRepM11_UpdateParams.SetVariable('FC_SUMM',  MONEYSTR(fn_summ));
      oqRepM11_UpdateParams.Execute;
      if ShellExecute( Application.MainForm.Handle, PChar('open'), 'repMedStat.exe', PChar(ParamStr(1)+{'29502}' FORM='+IntToStr(FMDS_FORMS_M11_FK_ID)+' PARAMS='+IntToStr(FMDS_PARAMS_M11_FK_ID)+' excelonly'), nil, SW_SHOWNORMAL ) <= 32 then
        Application.MessageBox(PChar('Не найден модуль repMedStat.exe'+#13#10'Необходимо обновить модуль'), 'Ошибка', MB_OK+MB_ICONERROR);
    end;

    2:
    begin
      frxTrebNakl.PrintOptions.Copies := IniReadInteger(iniFileName, 'PRINT_TREB', 'COPIES', 1);
      frxTrebNakl.ShowPreparedReport;
    end;

  end;

  odsGLF_in_Doc.ClearVariables;
  odsGLF_in_Doc.Close;
  odsFinsource_in_Doc.ClearVariables;
  odsFinsource_in_Doc.Close;


  if aIsPrintSprav then
  begin
    odsInvoice2.Filtered := False;
    odsInvoice2.Filter := 'FN_VIDANO_KOL <= 0';
    odsInvoice2.Filtered := True;
  end;  

  if (aIsPrintSprav)and(odsInvoice2.RecordCount > 0)and
     (Application.MessageBox('Некоторые затребованные препараты отсутствуют в аптеке и не были выданы.'#13#10' Вывести на печать замечания к требованию?', 'Подтверждение', MB_YESNO+MB_ICONQUESTION) = ID_YES) then
  begin
    frxTrebZam.PrepareReport();
    case dmPrintSelect.PrintFlag of // флаг куда печатать
      1: ExportFRToExcel( frxTrebZam, aExcelFileName );
      2: frxTrebZam.ShowPreparedReport;
    end;
  end;
  dmPrintSelect.PageOrientation := poNone; // сбрасываем ориентацию страницы
  odsInvoice2.Close;

  odsTTrebDpc.Close;
  odsTDPC.Close;
  odsSimpleTrebHeader.Close;
end;

procedure TdmPrintReports.frxTrebZamGetValue(const VarName: String;
  var Value: Variant);
begin
  if VarName = 'VAR_FC_DOC' then Value := FFC_DOC;
  if VarName = 'VAR_RUS_STR_DATE' then Value := GetDateStr( FFD_INVOICE );
  if VarName = 'VAR_SIGNS' then  Value := FSigns;

  if VarName = 'VAR_NAZN_FIO'     then  Value := IniReadString2('FRXSIMLPETREB', 'VAR_NAZN_FIO',   '');
  if VarName = 'VAR_NAZN_DOLJN'   then  Value := IniReadString2('FRXSIMLPETREB', 'VAR_NAZN_DOLJN', '');

  if VarName = 'VAR_OTP_FIO'      then  Value := IniReadString2('FRXSIMLPETREB', 'VAR_OTP_FIO',   '');
  if VarName = 'VAR_OTP_DOLJN'    then  Value := IniReadString2('FRXSIMLPETREB', 'VAR_OTP_DOLJN', '');

  if VarName = 'VAR_POLUCH_FIO'   then  Value := IniReadString2('FRXSIMLPETREB', 'VAR_POLUCH_FIO',   '');
  if VarName = 'VAR_POLUCH_DOLJN' then  Value := IniReadString2('FRXSIMLPETREB', 'VAR_POLUCH_DOLJN', '');


  if VarName = 'VAR_RASP_KREDIT' then  Value := GetValueFromTSMINI('FRXSIMLPETREB', 'VAR_RASP_KREDIT');
  if VarName = 'VAR_RUKOVODITEL' then  Value := GetValueFromTSMINI('FRXSIMLPETREB', 'VAR_RUKOVODITEL');
  if VarName = 'VAR_GLAV_BUH'    then  Value := GetValueFromTSMINI('MANAGER_DOC', 'GLAV_BUH');
  if VarName = 'VAR_ZAV_APTEKA'  then  Value := GetValueFromTSMINI('MANAGER_DOC', 'ZAV_APTEKA');
end;


procedure TdmPrintReports.frxAutoFillPlanGetValue(const VarName: string; var Value: Variant);
var
  fVarName : string;
begin
  fVarName := UpperCase( VarName ) ;
  if fVarName = 'VAR_FC_DOC' then
    Value := FFC_DOC;

  if fVarName = 'VAR_FD_INVOICE' then
    Value := FFD_INVOICE;

  if fVarName = 'VAR_FC_MOGROUP_FROM' then
    Value := FFC_MO_GR_FROM;

  if fVarName = 'VAR_FC_MOGROUP_TO' then
    Value := FFC_MO_GR_TO;
    
  if fVarName = 'VAR_FINSOURCE_CONDITION' then
  begin
    if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1) and
       (dmMain.ConfigParams.GetParamValue('FUNC_USE_FIN_SOURCE_IN_AUTOFILL', 1) = 1) then
    begin
      if (fFK_FINSOURCEID > 0) then
        Value := '(с учетом ист. фин-я)'
      else
        Value := '(без учета ист. фин-я)';
    end
    else
      Value := EmptyStr;
  end;
end;

procedure TdmPrintReports.frxInvOpisGetValue(const VarName: string; var Value: Variant);
var
  fVarName : string;
begin
  fVarName := UpperCase( VarName ) ;

  if fVarName = 'VAR_RECEIVER' then
    Value := dmMain.pkgSmini.Readstring( 'MANAGER_DOC', 'CLIENT_NAME', '' );

  if fVarName = 'VAR_GLAV_VRACH' then
    Value := dmMain.pkgSmini.Readstring( 'MANAGER_DOC', 'GLAV_VRACH', '' );
end;

procedure TdmPrintReports.frxNarcoticActGetValue(const VarName: string; var Value: Variant);
var
  fVarName : string;
begin
  fVarName := UpperCase( VarName ) ;

  if fVarName = 'S_NAME' then
    Value := dmMain.pkgSmini.Readstring('CONFIG', 'S_NAME', '');

  if fVarName = 'RASH_DATE' then
  begin
    if VarIsNull( FFD_INVOICE ) then
      Value := '«___»________________ 20__г.'
    else
      Value := GetDateStr ( FFD_DOC_DATE);
  end;

  if fVarName = 'ACT_NO' then
    Value := IniReadString ( iniFileName, 'NarcoticAct', 'Act_No', EmptyStr );
  if fVarName = 'PREDSED' then
    Value := IniReadString ( iniFileName, 'NarcoticAct', 'Predsed', EmptyStr );
  if fVarName = 'KOMISS1' then
    Value := IniReadString ( iniFileName, 'NarcoticAct', 'Komiss1', EmptyStr );
  if fVarName = 'KOMISS2' then
    Value := IniReadString ( iniFileName, 'NarcoticAct', 'Komiss2', EmptyStr );
  if fVarName = 'PKG' then
    Value := IniReadString ( iniFileName, 'NarcoticAct', 'Pkg', EmptyStr );
  if fVarName = 'ZAM_GL_VRA4_PO_MED_4ASTI' then
    Value := dmMain.pkgSmini.Readstring('MANAGER_DOC', 'ZAM_GL_VRA4_PO_MED_4ASTI', '');  
end;

function TdmPrintReports.frxSimpleTrebUserFunction(const MethodName: string; var Params: Variant): Variant;
var
  UpperCase_MethodName, s : string;

begin
  UpperCase_MethodName := UpperCase(MethodName);

  if UpperCase(MethodName) = 'INIREADSTRING2' then
  begin
    Result := IniReadString2( Params[0], Params[1], Params[2] );
  end;

  if UpperCase(MethodName) = 'INIWRITESTRING2' then
  begin
    Result := IniWriteString2( Params[0], Params[1], Params[2] );
  end;

  if UpperCase_MethodName = 'DO_SHOW_SELECT_SOTR_STR' then
  begin
    Result := DoShowSelectSotr_str( Params[0], s );
    Params[1] := s;
  end;     

  if UpperCase_MethodName = 'TSMINI_WRITESTRING' then
  begin
    SetValueIntoTSMINI(Params[0], Params[1], Params[2]);
  end;
end;

procedure TdmPrintReports.frxTrebNaklGetValue(const VarName: String; var Value: Variant);
var
  sTemp : string;
  UpperVarName : string;
begin
  UpperVarName := UpperCase(VarName);
//  if ParName = 'var_mo' then ParValue := odsSelDocMove.FieldByName('NAMETO').AsString
  if UpperVarName = 'VAR_SENDER' then
         Value :=  GetValueFromTSMINI('CONFIG', 'SENDER')
  else if UpperVarName = 'VAR_RECEIVER' then
         Value :=  GetValueFromTSMINI('MANAGER_DOC', 'CLIENT_NAME_SMS')
  else if UpperVarName = 'VAR_MAGOTD' then
         Value :=  GetValueFromTSMINI('MANAGER_DOC', 'ZAV_APTEKA');
  if UpperVarName = 'VAR_ZAM_GL_VRA4' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'ZAM_GL_VRA4', '');
    if sTemp = '' then
      Value := GetValueFromTSMINI('MANAGER_DOC', 'ZAM_GL_VRA4')
    else
      Value := sTemp;
  end;

  if UpperVarName = 'VAR_GLAV_BUH' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'GLAV_BUH', '');
    if sTemp = '' then
      Value := GetValueFromTSMINI('MANAGER_DOC', 'GLAV_BUH')
    else
      Value := sTemp;
  end;

  if UpperVarName = 'VAR_ZAM_GLAV_VRACH_LECH_RAB' then
  begin
    Value := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_ZAM_GLAV_VRACH_LECH_RAB', '');
  end;
  if UpperVarName = 'VAR_ZAM_GLAV_PROFIL' then
  begin
    Value := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_ZAM_GLAV_PROFIL', '');
  end;

  if UpperVarName = 'VAR_ZAM_GLAV_VRACH_LECH_RAB_DOLJN' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_ZAM_GLAV_VRACH_LECH_RAB_DOLJN', '');
    if sTemp = '' then
      sTemp := 'Зам. гл. врача по медицинской части';
    Value := sTemp;
  end;
  if UpperVarName = 'VAR_ZAM_GLAV_PROFIL_DOLJN' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_ZAM_GLAV_PROFIL_DOLJN', '');
    if sTemp = '' then
      sTemp := 'Зам. гл. врача по профилю';
    Value := sTemp;
  end;

  if UpperVarName = 'VAR_GLAV_VRACH' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'GLAV_VRACH', '');
    if sTemp = '' then
      Value := GetValueFromTSMINI('MANAGER_DOC', 'GLAV_VRACH')
    else
      Value := sTemp;
  end;

  if UpperVarName = 'VAR_FC_DOC'          then Value := FFC_DOC;

  if UpperVarName = 'VAR_FD_INVOICE'      then Value := FFD_INVOICE;
  if UpperVarName = 'VAR_FC_INVOICE'      then Value := GetDateStr(FFD_INVOICE);
  if UpperVarName = 'VAR_FC_INVOICE_DOC'  then Value := FFC_INVOICE_DOC;
  if UpperVarName = 'VAR_FC_INVOICE_TREB' then Value := FFC_INVOICE_TREB;
  if UpperVarName = 'VAR_FC_DOC_DATE'     then Value := FFC_DOC_DATE;

  if UpperVarName = 'VAR_FC_FINSOURCE'    then Value := FFC_FINSOURCE;  //Added by Neronov A.S. 15.11.2011

  if UpperVarName = 'VAR_FC_SMS_FROM'     then Value := FFC_SMS_FROM;   //Added by Neronov A.S. 18.06.2012
  if UpperVarName = 'VAR_FC_SMS_TO'       then Value := FFC_SMS_TO;     //Added by Neronov A.S. 18.06.2012

  if UpperVarName = 'VAR_FC_MOGROUP_FROM' then Value := FFC_MO_GR_FROM;
  if UpperVarName = 'VAR_FC_MOGROUP_TO'   then Value := FFC_MO_GR_TO;
  if UpperVarName = 'VAR_FC_MO_FROM' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_FC_MO_FROM', '');
    if sTemp = '' then
      Value := FFC_MO_FROM
    else
      Value := sTemp;
  end;

  if UpperVarName = 'VAR_FC_MO_FROM_DOLJNOST' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_FC_MO_FROM_DOLJNOST', '');
    if sTemp = '' then
      Value := ''
    else
      Value := sTemp;
  end;

  if UpperVarName = 'VAR_FC_MO_TO' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_FC_MO_TO'+'_'+StringReplace(FFC_MO_GR_TO,' ','_', [rfReplaceAll]), '');
    if sTemp = '' then
      Value := FFC_MO_TO
    else
      Value := sTemp;
  end;

//  if VarName = 'VAR_FC_MO_FROM' then Value := FFC_MO_FROM;
//  if VarName = 'VAR_FC_MO_TO'   then Value := FFC_MO_TO;

//  if VarName = 'VAR_ZAV_APTEKA' then Value := GetValueFromTSMINI('MANAGER_DOC', 'ZAV_APTEKA');
  {if UpperVarName = 'VAR_ZAV_APTEKA' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_ZAV_APTEKA', '');
    if sTemp = '' then
      Value := GetValueFromTSMINI('MANAGER_DOC', 'ZAV_APTEKA')
    else
      Value := sTemp;
  end;}

  if UpperVarName = 'VAR_FC_ZATREB' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_FC_ZATREB', '');
    if sTemp = '' then
      Value := FFC_MO_TO
    else
      Value := sTemp;
  end;

  if UpperVarName = 'VAR_RAZRESHIL' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_RAZRESHIL', '');
    if sTemp = '' then
      Value := GetValueFromTSMINI('MANAGER_DOC', 'VAR_RAZRESHIL')
    else
      Value := sTemp;
  end;

  if UpperVarName = 'VAR_RAZRESHIL_DOLJNOST' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_RAZRESHIL_DOLJNOST', '');
    if sTemp = '' then
      Value := GetValueFromTSMINI('MANAGER_DOC', 'VAR_RAZRESHIL_DOLJNOST')
    else
      Value := sTemp;
  end;

  if UpperVarName = 'VAR_FC_COMMENT' then Value := FFC_COMMENT;
//  if VarName = 'VAR_FC_ZAV_OTD_TO' then Value := FFC_ZAV_OTD_TO;
  if UpperVarName = 'VAR_FC_ZAV_OTD_TO' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_FC_ZAV_OTD_TO'+'_'+StringReplace(FFC_MO_GR_TO,' ','_', [rfReplaceAll]));
    if sTemp = '' then
      Value := FFC_ZAV_OTD_TO
    else
      Value := sTemp;
  end;
  if UpperVarName = 'VAR_UCHR_NAME' then Value :=  GetValueFromTSMINI('CONFIG', 'S_FULLNAME');

  if UpperVarName = 'VAR_OTPUSTIL_DOLJNOST' then
  begin
    if VAR_OTPUSTIL_DOLJNOST = '' then
      VAR_OTPUSTIL_DOLJNOST := IniReadString(iniFileName,'MANAGER_DOC', 'OTPUSTIL_DOLJNOST','');
    Value := VAR_OTPUSTIL_DOLJNOST;
  end;

  if UpperVarName = 'VAR_OTPUSTIL_FIO' then
  begin
    sTemp := IniReadString(iniFileName,'MANAGER_DOC', 'VAR_OTPUSTIL_FIO','');

    if sTemp = '' then
    begin
      sTemp := GetValueFromTSMINI('MANAGER_DOC', 'VAR_OTPUSTIL_FIO');
      IniWriteString2('MANAGER_DOC', 'VAR_OTPUSTIL_FIO', sTemp);
    end;

    Value := sTemp;
  end;

  if UpperVarName = 'FL_STAC'  then
  begin
    Value := FTreb_FL_STAC;
  end;

  if UpperVarName = 'VAR_DOLJNOST_MAIN1' then
  begin
//    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_DOLJNOST_MAIN1', '');

    if sTemp = '' then
    begin
      if FTreb_FL_STAC = True then
        sTemp := GetValueFromTSMINI('MANAGER_DOC', 'VAR_DOLJNOST_STAC_MAIN1')
      else
        sTemp := GetValueFromTSMINI('MANAGER_DOC', 'VAR_DOLJNOST_POLIKLINIKA_MAIN1');

      IniWriteString2('MANAGER_DOC', 'VAR_DOLJNOST_MAIN1', sTemp);
    end;

    Value := sTemp;
  end;

  if UpperVarName = 'VAR_FIO_MAIN1' then
  begin
//    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_FIO_MAIN1', '');

    if sTemp = '' then
    begin
      if FTreb_FL_STAC = True then
        sTemp := GetValueFromTSMINI('MANAGER_DOC', 'VAR_FIO_STAC_MAIN1')
      else
        sTemp := GetValueFromTSMINI('MANAGER_DOC', 'VAR_FIO_POLIKLINIKA_MAIN1');
      IniWriteString2('MANAGER_DOC', 'VAR_FIO_MAIN1', sTemp);
    end;

    Value := sTemp;
  end;

  if UpperVarName = 'VAR_RASP_KREDIT' then  Value := GetValueFromTSMINI('FRXSIMLPETREB', 'VAR_RASP_KREDIT');
  if UpperVarName = 'VAR_RUKOVODITEL' then  Value := GetValueFromTSMINI('FRXSIMLPETREB', 'VAR_RUKOVODITEL');
 // if UpperVarName = 'VAR_GLAV_BUH'    then  Value := GetValueFromTSMINI('MANAGER_DOC', 'GLAV_BUH');

  if UpperVarName = 'DOLJ_GLAV_BUH' then
  begin
   { sTemp := GetRegParm( 'MANAGER_DOC', 'DOLJ_GLAV_BUH' );
    if Trim(sTemp) = '' then
      Value := 'Гл.бухгалтер'
    else
      Value := sTemp;   }
    sTemp := GetValueFromTSMINI('MANAGER_DOC', 'DOLJ_GLAV_BUH');
    if Trim(sTemp) = '' then
      Value := 'Гл.бухгалтер'
    else
      Value := sTemp;
  end;
  if UpperVarName = 'VAR_GLAV_BUH' then
  begin
   { sTemp := GetRegParm( 'MANAGER_DOC', 'VAR_GLAV_BUH' );
    if Trim(sTemp) = '' then  }
      Value := GetValueFromTSMINI('MANAGER_DOC', 'GLAV_BUH')
   { else
      Value := sTemp;   }
  end;

  //if UpperVarName = 'VAR_ZAV_APTEKA'  then  Value := GetValueFromTSMINI('MANAGER_DOC', 'ZAV_APTEKA');

 // if UpperVarName = 'VAR_ZAV_APTEKA'          then  Value := dmMain.ZAV_APTEKA_FIO;
  if UpperVarName = 'VAR_ZAV_APTEKA_FULL_FIO' then  Value := dmMain.ZAV_APTEKA_FULLFIO;

  if UpperVarName = 'VAR_ZAV_APTEKA' then
  begin
    sTemp := GetRegParm( 'MANAGER_DOC', 'VAR_ZAV_APTEKA' );
    // IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_ZAV_APTEKA', '');
    if Trim(sTemp) = '' then
      Value := dmMain.ZAV_APTEKA_FIO // GetValueFromTSMINI('MANAGER_DOC', 'ZAV_APTEKA')
    else
      Value := sTemp;
  end;

  if UpperVarName = 'VAR_4EREZ_KOGO' then
  begin
    Value := GetValueFromTSMINI('MANAGER_DOC', 'TREB_NAKL_4EREZ_KOGO');
  end;

  if UpperVarName = 'VAR_LPU_TOWN' then // город из реквизитов ЛПУ
  try
    dmMain.odsTTownById.CLose;
    dmMain.odsTTownById.SetVariable( 'PTOWN_ID', GetValueFromTSMINI ( 'CONFIG', 'S_TOWN', '-1' ) );
    dmMain.odsTTownById.Open;

    if ( dmMain.odsTTownById.RecordCount > 0 ) then
      Value := 'г.' + dmMain.odsTTownById.FieldByName( 'FC_TOWN_NAME' ).AsString
    else
      Value := EmptyStr;
  except
    Value := EmptyStr;
  end;

  if UpperVarName = 'VAR_ZAV_OTD_DOLJNOST' then
  begin
    if fFL_FROM_OTD_PLAT_USLUG = 1 then
      Value := 'Нач. мед. по ПДД'
    else
      Value := 'Зав. отделением';
  end;

end;

procedure TdmPrintReports.DataModuleCreate(Sender: TObject);
var
  i, n : integer;
begin
  // убираем все сессии с датасетов и кверей.
  // Без этого для внешних отчетов этот модуль крейтится с ошибкой
  // о неопределенной сессии (скорее всего фастрепорт пытается залезть в список полей)
  // Выставлять сессии нужно после крейта этого модуля процедурой SetSession. Воронов О.А. 20071210
  n := Self.ComponentCount - 1;
  for i := 0 to n do
  begin
    if (UpperCase(Self.Components[i].ClassName) = 'TORACLEDATASET') then  TOracleDataSet(Self.Components[i]).Session := nil;
    if(UpperCase(Self.Components[i].ClassName) = 'TORACLEQUERY')    then TOracleQuery(Self.Components[i]).Session := nil;
  end;



//  if FileExists('frxTrebNakl.fr3') then            // если найден файл
//    frxTrebNakl.LoadFromFile('frxTrebNakl.fr3');  // загружаем его
end;

procedure TdmPrintReports.PrintAutoFillPlan(const ATrebDPCList, AAutoFillPlan: TOracleObject; AFK_FINSOURCEID : Integer = -1; AFC_DOC: string = '';
  AFD_INVOICE : string = ''; AFC_MO_GR_FROM : string = ''; AFC_MO_GR_TO : string = '' );
begin
  FFC_DOC := AFC_DOC;
  FFD_INVOICE := AFD_INVOICE;
  FFC_MO_GR_FROM := AFC_MO_GR_FROM;
  FFC_MO_GR_TO := AFC_MO_GR_TO;
  fFK_FINSOURCEID := AFK_FINSOURCEID;
  try
    with odsTrebDpcList do // затребованные позиции
    begin
      Close;
      SetComplexVariable( 'pTrebDPCList', ATrebDPCList );
      Open;
    end;

    with odsAutoFillPlanPrint do // план автозаполнения
    begin
      Close;
      SetComplexVariable( 'pObj', AAutoFillPlan );
      SetComplexVariable( 'pTrebDPCList', ATrebDPCList );
      Open;
    end;

    with odsRashByAutoFillPlan do // расходные позиции
    begin
      Close;
      SetComplexVariable( 'pObj', AAutoFillPlan );
      Open;
    end;

    with odsAutoFillDeficit do // нехватка по затребованным позициям
    begin
      Close;
      SetComplexVariable( 'pObj', AAutoFillPlan );
      SetComplexVariable( 'pTrebDPCList', ATrebDPCList );
      Open;
    end;                     

    frxAutoFillPlan.PrepareReport;
    frxAutoFillPlan.ShowPreparedReport;
  finally
    odsTrebDpcList.Close ;
    odsAutoFillPlanPrint.Close;
    odsRashByAutoFillPlan.Close;
    odsAutoFillDeficit.Close;
  end;                                 
end;

procedure TdmPrintReports.PrintInvOpis(const AInvListId: integer);
var
  bCanPrint : Boolean;
begin
  try
    odsInvListPrint.Close;
    odsInvListPrint.SetVariable( 'pINVLISTID', AInvListId );
    odsInvListPrint.Open;
  except
    on e : Exception do
    begin
      Application.MessageBox( PAnsiChar('Ошибка при выборке данных по инвентаризации!'+ #13#10 + e.Message), MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
      Exit;
    end;
  end;
  
  bCanPrint := (odsInvListPrint.FieldByName ( 'FL_EDIT' ).AsInteger = 0) ; // только если подписан

  if bCanPrint then
//  begin
    frxInvOpis.PreviewOptions.Buttons := frxInvOpis.PreviewOptions.Buttons + [ frxClass.pbPrint, frxClass.pbSave, frxClass.pbExport, frxClass.pbExportQuick ]
//  end;
  else
    frxInvOpis.PreviewOptions.Buttons := frxInvOpis.PreviewOptions.Buttons - [ frxClass.pbPrint, frxClass.pbSave, frxClass.pbExport, frxClass.pbExportQuick ];  

  frxInvOpis.PrepareReport;
  frxInvOpis.ShowPreparedReport;
end;

procedure TdmPrintReports.PrintNarcoticAct( const ADPID : Integer; AfrxReport: TfrxReport; aIsPrintSprav: Boolean = True) ;
var
  ReportFile : string;
  Params : Variant;
  IsCompositeReport : Boolean; // композитный отчет
  frxOnGetValueEvent : TfrxGetValueEvent;
  TmpFilter : string;
begin
  TmpFilter := EmptyStr;
  ReportFile := 'frxNarcoticAct.fr3';
  IsCompositeReport := ( AfrxReport <> nil ) ;
  if not FileExists( ReportFile ) or not ( ADPID > 0 )  then
    Exit;

  Params := VarArrayCreate( [0, 4 ], varVariant );
  Params[0] := Null;   // номер акта
  Params[1] := IniReadString ( iniFileName, 'NarcoticAct', 'Predsed', EmptyStr ) ; // председатель
  Params[2] := IniReadString ( iniFileName, 'NarcoticAct', 'Komiss1', EmptyStr ) ; // члены комиссии
  Params[3] := IniReadString ( iniFileName, 'NarcoticAct', 'Komiss2', EmptyStr ) ; // члены комиссии
  Params[4] := IniReadString ( iniFileName, 'NarcoticAct', 'Pkg', EmptyStr ) ;   // упаковка

  if ( DoAddParamsNarcoticAct ( Params) <> mrOk ) then
  begin
    Application.MessageBox(PChar( 'Акт НС и ПВ напечатан не будет!' ), PChar ( 'Внимание' ), MB_OK + MB_ICONWARNING);
    Params := Null;
    Exit;
  end;

  IniWriteString( iniFileName, 'NarcoticAct', 'Act_No', VarToStr( Params[0] ) );
  IniWriteString( iniFileName, 'NarcoticAct', 'Predsed', VarToStr( Params[1] ) );
  IniWriteString( iniFileName, 'NarcoticAct', 'Komiss1', VarToStr( Params[2] ) );
  IniWriteString( iniFileName, 'NarcoticAct', 'Komiss2', VarToStr( Params[3] ) );
  IniWriteString( iniFileName, 'NarcoticAct', 'Pkg', VarToStr( Params[4] ) );

  try
    odsSimpleTrebHeader.Close;
    odsSimpleTrebHeader.SetVariable('FK_TREBID', -1 );
    odsSimpleTrebHeader.SetVariable('DPID', ADPID);
    odsSimpleTrebHeader.Open;
  except
    Application.MessageBox(PChar( 'Ошибка при получении реквизитов документа!' ), PChar ( 'Внимание' ), MB_OK + MB_ICONWARNING);
    Exit;
  end;

  FFD_DOC_DATE := odsSimpleTrebHeader.FieldByName('FD_DOC_DATA').AsVariant;

  if ( IsCompositeReport ) and ( odsInvoice2.Active ) then // уже открыт, только фильтруем
  begin
    if odsInvoice2.Filtered then
    begin
      TmpFilter := odsInvoice2.Filter;
      odsInvoice2.Filtered := False;

      if Trim ( TmpFilter ) <> EmptyStr then
        odsInvoice2.Filter := '(' + TmpFilter + ') and ( IS_NARCOTIC = 1 )'
      else
        odsInvoice2.Filter := ' IS_NARCOTIC = 1 ';
    end
    else
      odsInvoice2.Filter := ' IS_NARCOTIC = 1 ';

    odsInvoice2.Filtered := True;
  end
  else
  try
    odsInvoice2.Close;
    odsInvoice2.SetVariable('PRINT_LAT_NAME', dmMain.ConfigParams.GetParamValue('FUNC_SHOW_LAT_NAME_IN_RASH_BY_TREB', 1));
    odsInvoice2.SetVariable('adpid',aDPID);
    odsInvoice2.SetVariable('aTrebID',-1);
    odsInvoice2.Open;

    if (aIsPrintSprav) then
      odsInvoice2.Filter := '( FN_VIDANO_KOL > 0 ) and ( IS_NARCOTIC = 1 )'
    else
      odsInvoice2.Filter := 'IS_NARCOTIC = 1';

    odsInvoice2.Filtered := True;

  except
    Application.MessageBox(PChar( 'Ошибка при получении данных из БД!' ), PChar ( 'Внимание' ), MB_OK + MB_ICONWARNING);
    Exit;
  end;

  if IsCompositeReport then
  begin
    frxOnGetValueEvent := AfrxReport.OnGetValue;
    AfrxReport.OnGetValue := frxNarcoticActGetValue; // параметры отчета
    AfrxReport.LoadFromFile( ReportFile );
    AfrxReport.PrepareReport( False );
    AfrxReport.OnGetValue := frxOnGetValueEvent;
  end
  else
  begin
     frxNarcoticAct.LoadFromFile( ReportFile );
     frxNarcoticAct.OnGetValue := frxNarcoticActGetValue;
     frxNarcoticAct.PrepareReport;
     frxNarcoticAct.ShowPreparedReport;
  end;

  if Trim ( TmpFilter ) <> EmptyStr then // возвращаем фильтр
  begin
    odsInvoice2.Filtered := False;
    odsInvoice2.Filter := TmpFilter;
    odsInvoice2.Filtered := True;
  end
  else
      odsInvoice2.Filtered := False; 
end;

procedure TdmPrintReports.PrintSimlpeTreb(const aTrebID: integer);
var
  md : TfrxMasterData;
  RepFileName : string;
begin
  odsSimpleTrebHeader.Close;
  odsSimpleTrebHeader.SetVariable('FK_TREBID', aTrebID);
  odsSimpleTrebHeader.Open;
  if odsSimpleTrebHeader.RecordCount = 0 then Exit;

  odsSimpleTrebData.SetVariable('PRINT_LAT_NAME', dmMain.ConfigParams.GetParamValue('FUNC_SHOW_LAT_NAME_IN_TREB', 0));

  odsSimpleTrebData.Close;
  odsSimpleTrebData.SetVariable('FK_TREBID', aTrebID);
  odsSimpleTrebData.Open;

  // загружаем внешний вид
  RepFileName := frxSimpleTreb.Name+'.fr3';
  if FileExists(RepFileName) then
    frxSimpleTreb.LoadFromFile(RepFileName);

  frxSimpleTreb.AddFunction('function DO_SHOW_SELECT_SOTR_STR(const aFC_SOTR : string; var aSpec : string) : string');
  frxSimpleTreb.AddFunction('function IniWriteString2(Section, Ident: string; Value: string) : integer');
  frxSimpleTreb.AddFunction('function IniReadString2(Section, Ident: string; Default: string = ''): string'); 
  frxSimpleTreb.AddFunction('procedure TSMINI_WRITESTRING(const Section, Ident, Value: string)');

  if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_LIST_SIGNS_IN_PRINT_TREB', 1) = 1) then
  begin
    FSigns := '';
    if DoShowSelectCheckedList(FSigns, 'Главный врач:'#13#10'Главный бухгалтер:'#13#10'Заведующий отделением:'#13#10'Cтаршая м\с:'#13#10' Отпустил:'#13#10'Получил:', 'Выберите подписываемые должности') = mrCancel then Exit;
    FSigns := StringReplace(FSigns, ':'#13#10, ': ________________________'#13#10#13#10, [rfReplaceAll]); // добавляем место для росписи
    FSigns := StringReplace(FSigns, ' ', #13#10#13#10, [rfReplaceAll]);
  end;

  if(dmMain.ConfigParams.GetParamValue('FUNC_REQUIRE_FINSOURCE_IN_TREB', 0) = 1) then
  begin
    md := TfrxMasterData(frxSimpleTreb.FindObject('mdFinSource'));
    if md <> nil then md.Visible := True;
  end;

  frxSimpleTreb.PrepareReport();
  if  dmPrintSelect.PrintFlag = 0 then dmPrintSelect.PrintFlag := 2;
  try
    case dmPrintSelect.PrintFlag of // флаг куда печатать
      1 : ExportFRToExcel( frxSimpleTreb, 'Требование №'+odsSimpleTrebHeader.FieldByName('FC_TREB').AsString + 'от '+ DateToStr(odsSimpleTrebHeader.FieldByName('TRUNC_DATE').AsDateTime)+' ('+IntTostr(odsSimpleTrebHeader.FieldByName('FK_ID').AsInteger)+')');
      2 : frxSimpleTreb.ShowPreparedReport;
    end;
  finally
    odsSimpleTrebHeader.Close;
    odsSimpleTrebData.Close;
  end;
end;

procedure TdmPrintReports.SetSession(aSession: TOracleSession);
var
  i, n : integer;

begin
  n := Self.ComponentCount - 1;
  for i := 0 to n do
  begin
    if (UpperCase(Self.Components[i].ClassName) = 'TORACLEDATASET') then  TOracleDataSet(Self.Components[i]).Session := aSession;
    if(UpperCase(Self.Components[i].ClassName) = 'TORACLEQUERY') then TOracleQuery(Self.Components[i]).Session := aSession;
  end;

//  try
//    oqRepM11_Init.Execute; // получаем параметры для работы с генератором отчетов для отчета М-11
//    FMDS_FORMS_M11_FK_ID  := oqRepM11_Init.GetVariable('MDS_FORMS_FK_ID');
//    FMDS_PARAMS_M11_FK_ID := oqRepM11_Init.GetVariable('MDS_PARAMS_FK_ID');
//  except
    FMDS_FORMS_M11_FK_ID  := -1;
    FMDS_PARAMS_M11_FK_ID := -1;
//  end;
end;

function TdmPrintReports.GetValueFromTSMINI(const aSection, aKey: string; aDefVal : string = ''): string;
begin
  try
    odsTSMINI.Close;
    odsTSMINI.SetVariable('ASECTION', aSection);
    odsTSMINI.SetVariable('AKEY', aKey);
    odsTSMINI.Open;

    if odsTSMINI.RecordCount > 0 then
      Result := odsTSMINI.FieldByName('FC_VALUE').AsString
    else
      Result := aDefVal;
    odsTSMINI.Close;
  except
    Result := aDefVal;
  end;
end;

procedure TdmPrintReports.SetValueIntoTSMINI( const aSection, aKey, aValue : string );
begin
  oqTSMINI.ClearVariables;
  oqTSMINI.SetVariable('PSECTION', aSection);
  oqTSMINI.SetVariable('PKEY', aKey);        
  oqTSMINI.SetVariable('PVALUE', aValue);
  try
    oqTSMINI.Execute;
  except
  end;
end;

procedure TdmPrintReports.odsSimpleTrebHeaderAfterClose(DataSet: TDataSet);
begin
  odsSimpleTrebHeader.ClearVariables;
end;

procedure TdmPrintReports.DataModuleDestroy(Sender: TObject);
begin
  try
    // очищаем из базы параметры отчета М-11
//    if Assigned(oqRepM11_End.Session) then
//    begin
//      oqRepM11_End.SetVariable('mds_params_fk_id', FMDS_PARAMS_M11_FK_ID);
//      oqRepM11_End.Execute;
//    end;
    DeleteOldReports; // удаляем все отчеты, которые были временно созданы    
  except
  end;
end;

function TdmPrintReports.frxTrebNaklUserFunction(const MethodName: String;
  var Params: Variant): Variant;
begin
  if UpperCase(MethodName) = 'GETFROMTSMINI' then
	begin
    Result := GetFromTSmini( Params[0], Params[1] );
  end else
  if UpperCase(MethodName) = 'SAVTOTSMINI' then
	begin
    SavToTSmini( Params[0], Params[1], Params[2] );
  end else
  if UpperCase(MethodName) = 'SAVREGPARM' then
	begin
    SavRegParm(Params[0], Params[1], Params[2] );
  end else
  if UpperCase(MethodName) = 'SAVZAVAPT' then
	begin
		Result := Params[0];
  end else
	if UpperCase(MethodName) = 'MONEYSTR' then
	begin
		Result := MONEYSTR(Params[0]);
  end else
  if UpperCase(MethodName) = 'INIREADSTRING2' then
  begin
    Result := IniReadString2( Params[0], Params[1], Params[2] );
  end;
  if UpperCase(MethodName) = 'INIWRITESTRING2' then
  begin
    Result := IniWriteString2( Params[0], Params[1], Params[2] );
  end;
  if UpperCase(MethodName) = 'INIWRITESTRING3' then
  begin
    Result := IniWriteString2( Params[0], Params[1]+'_'+StringReplace(FFC_MO_GR_TO,' ','_', [rfReplaceAll]), Params[2] );
  end;
  if UpperCase(MethodName) = 'DOSHOWSELECTMO_STR' then
  begin
    Result := DoShowSelectMO_str( Params[0] );
  end;

  if UpperCase(MethodName) = 'DOSHOWSELECTMO_STR2' then
  begin
//    VAR_OTPUSTIL_DOLJNOST := '';
    Result := DoShowSelectMO_str2( Params[0], VAR_OTPUSTIL_DOLJNOST );
    Params[1]   := VAR_OTPUSTIL_DOLJNOST;
    FFC_MO_FROM := Result;
    IniWriteString2('MANAGER_DOC', 'OTPUSTIL_DOLJNOST', VAR_OTPUSTIL_DOLJNOST);
  end;

  if UpperCase(MethodName) = 'DOSHOWSELECTMO_STR3' then
  begin
//    VAR_OTPUSTIL_DOLJNOST := '';
    Result := DoShowSelectMO_str2( Params[0], VAR_POLUCHIL_DOLJNOST );
    Params[1]   := VAR_POLUCHIL_DOLJNOST;
    FFC_MO_FROM := Result;
    IniWriteString2('MANAGER_DOC', 'POLUCHIL_DOLJNOST', VAR_POLUCHIL_DOLJNOST);
  end;

 	if UpperCase(MethodName) = 'ROUND_TO' then
	begin
		Result := ROUND_TO(Params[0], Params[1]);
  end;
end;

procedure TdmPrintReports.PrintTrebOld(const aDPID: Integer;
  aFC_DOC: string; const aFD_INVOICE: TDate; aFC_MO_GR_FROM, aFC_MO_GR_TO,
  aFC_MO_FROM, aFC_MO_TO: string);
var p         : TfrPreview;
    s         : String;  
begin
  FFC_DOC        := aFC_DOC;
  FFD_INVOICE    := aFD_INVOICE;
  FFC_MO_GR_FROM := aFC_MO_GR_FROM;
  FFC_MO_GR_TO   := aFC_MO_GR_TO;
  FFC_MO_FROM    := aFC_MO_FROM;
  FFC_MO_TO      := aFC_MO_TO;
  
  odsInvoice_MID.Close;
  odsInvoice_MID.SetVariable('ADPID', aDPID);
  odsInvoice_MID.Open;

  with TOracleDataSet.Create(self) do
  begin
    Session := odsInvoice_MID.Session;
    SQL.Text := 'select t.fc_comment from med.ttreb t where t.fk_dpid = '+IntToStr(aDPID);
    Open;
    FFC_COMMENT := FieldByName('fc_comment').AsString;

    Close;
    SQL.Text := 'SELECT MAX (asu.get_sotrname(nvl(s.fk_id,-1))) AS zav_fio'#13#10+
                'FROM'#13#10+
                '  asu.tsotr_medica s,'#13#10+
                '  (SELECT a.fk_sotrid FROM med.tmo a, med.tdocs d where'#13#10+
                '   a.moid = d.motoid and d.dpid = '+IntToStr(aDPID)+') CurSotr'#13#10+
                ' WHERE'#13#10+
                '   s.fk_id = asu.get_zavotdid (CurSotr.fk_sotrid)';
    Open;
    FFC_ZAV_OTD_TO := FieldByName('zav_fio').AsString;

    Free;
  end;

  frInvoice_MID.FindObject('MasterData2').Visible   := (FFC_COMMENT <> '');
  frInvoice_MID.FindObject('MasterHeader2').Visible := (FFC_COMMENT <> '');

  frInvoice_MID.PrepareReport;
  p := TfrPreview.Create(frInvoice_MID);
  CurReport := frInvoice_MID;
  MasterReport := frInvoice_MID;
  DocMode := dmPrinting;
  CurBand := nil;
  if frInvoice_MID.EMFPages.Count = 0 then Exit;
  s := frLoadStr(SPreview);
  if frInvoice_MID.Title <> '' then s := s + ' - ' + frInvoice_MID.Title;
  p.Window.Caption := s;
  frInvoice_MID.Preview := p;

  frInvoice_MID.Preview.Window.Show_Modal(frInvoice_MID);
  Application.ProcessMessages;
  frInvoice_MID.Preview.Window := nil;
  odsInvoice_MID.Close;
end;

procedure TdmPrintReports.frInvoice_MIDMouseOverObject(View: TfrView;
  var Cursor: TCursor);
begin
  if StrToInt(Copy(View.Name,5,2)) in [51,56,57,42,43,44,1,58,60,20, 59] then
  begin
    Cursor := crHandPoint;
  end;
end;

procedure TdmPrintReports.frInvoice_MIDObjectClick(View: TfrView);
var frmDateInput : TfrmDateInput;
    vPos         : Integer;
    aPrompt      : String;
begin
  if StrToInt(Copy(View.Name,5,2)) in [56,57,42,43,44] then
//  if View.Name = 'Memo56' then
  begin
    View.FrameTyp := 15;
    View.FrameColor := clRed;
    vPos := frInvoice_MID.Preview.Window.VScrollBar.Position;
    frInvoice_MID.Preview.Zoom := frInvoice_MID.Preview.Zoom; //дабы перерисовался отчет
    frInvoice_MID.Preview.Window.VScrollBar.Position := vPos;
    try
      frmDateInput := TfrmDateInput.Create(frInvoice_MID.Preview.Window);
      frmDateInput.deDate.Date := ServerDate(odsInvoice_MID.Session);
      try
        if frmDateInput.ShowModal = mrOk then
        begin
          if frmDateInput.deDate.Date = NullDate then
            View.Memo.Text := '"     "                 200  г.'
          else
            View.Memo.Text := FormatDateTime('''"''dd''"'' mmmm yyyy ''г.''',frmDateInput.deDate.Date);
        end;
      finally
        frmDateInput.Free;
      end;
    finally
      View.FrameTyp := 2;
      View.FrameColor := clBlack;
      vPos := frInvoice_MID.Preview.Window.VScrollBar.Position;
      frInvoice_MID.Preview.Zoom := frInvoice_MID.Preview.Zoom; //дабы перерисовался отчет
      frInvoice_MID.Preview.Window.VScrollBar.Position := vPos;
    end;
  end
  else if StrToInt(Copy(View.Name,5,2)) in [1,58,60,20,51, 59] then
  begin

    Case StrToInt(Copy(View.Name,5,2)) of
      1  : aPrompt := 'Заместитель главного врача по мед. части';
      58 : aPrompt := 'Отпустил';
      60 : aPrompt := 'Получил';
      20 : aPrompt := 'Материальное ответственное лицо';
      51 : aPrompt := 'Структурное подразделение';
      59 : aPrompt := 'Заведующий отделением';      
    end;
    
    View.FrameTyp := 15;
    View.FrameColor := clRed;
    vPos := frInvoice_MID.Preview.Window.VScrollBar.Position;
    frInvoice_MID.Preview.Zoom := frInvoice_MID.Preview.Zoom; //дабы перерисовался отчет
    frInvoice_MID.Preview.Window.VScrollBar.Position := vPos;
    try
      View.Memo.Text := InputBox('Ввод данных',aPrompt,StringReplace(View.Memo.Text, #13#10,'',[rfReplaceAll]));
    finally
      View.FrameTyp := 2;
      View.FrameColor := clBlack;
      vPos := frInvoice_MID.Preview.Window.VScrollBar.Position;
      frInvoice_MID.Preview.Zoom := frInvoice_MID.Preview.Zoom; //дабы перерисовался отчет
      frInvoice_MID.Preview.Window.VScrollBar.Position := vPos;
    end;
  end;
end;

procedure TdmPrintReports.frInvoice_MIDUserFunction(const Name: String; p1,
  p2, p3: Variant; var Val: Variant);
var
  d : Double;
begin
  if name = 'ITOG' then
  begin
    d := frParser.Calc(p1);
    val := MoneyToString(d, TRUE);
  end;
end;

procedure TdmPrintReports.frReportOnGetValue(const ParName: String; var ParValue: Variant);
var
  LowerParName : string;
begin
  LowerParName := AnsiLowerCase(ParName);
  if LowerParName = 'var_zav_apteka'     then ParValue := GetValueFromTSMINI('MANAGER_DOC', 'ZAV_APTEKA');
  if (LowerParName = 'var_zam_gl_vra4') or
     (LowerParName = 'var_zam_gl_vrach') then ParValue := GetValueFromTSMINI('MANAGER_DOC', 'ZAM_GL_VRA4');
  if LowerParName = 'var_glav_vrach'     then ParValue := GetValueFromTSMINI('MANAGER_DOC', 'GLAV_VRACH');
  if LowerParName = 'var_glav_buh'       then ParValue := GetValueFromTSMINI('MANAGER_DOC', 'GLAV_BUH');
  if LowerParName = 'var_nachlok_fio'    then ParValue := GetValueFromTSMINI('NACHLOK', 'FIO');
  if LowerParName = 'var_client_name'    then ParValue := GetValueFromTSMINI('MANAGER_DOC','CLIENT_NAME');
end;

procedure TdmPrintReports.frxTrebNaklPrintReport(Sender: TObject);
begin
  IniWriteInteger(iniFileName, 'PRINT_TREB', 'COPIES', frxTrebNakl.PrintOptions.Copies);
end;

end.
