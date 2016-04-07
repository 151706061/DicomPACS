
unit fgetperiod;

interface

uses Windows, FR_DSet, FR_DBSet, Db,
  FR_Class, frOLEExl, frXMLExl, FR_Desgn, OracleData, Oracle, Classes,
  ActnList, ImgList, Controls, DBCtrls, ComCtrls, ToolWin, StdCtrls,
  ExtCtrls, Forms, HtmlHlp, JvExMask, JvToolEdit, Mask, OracleMonitor,
  cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  frxClass, frxDBSet, cxCheckBox, cxCheckComboBox, frxExportXLS, Menus,
  frxChart, {dxSkinsCore, dxSkinsDefaultPainters, }cxLookAndFeelPainters, cxButtons, cxGroupBox;

//const NullDate = -700000;

type               
  TInitPluginFoundPac = function (Panel_HND, App_HND: THandle; nPacID, nSotrID, nSpecID, nSecID, nSmidID: integer): LongInt; stdcall;
  /// nPacID: 0 - амб, 1 - стационар, 2 - пипл из TPEOPLES, 3 - забронированный из TBronInfo
  /// Panel_HND, nSpecID, nSecID, nSmidID - не используются
  TFreePluginFoundPac = function (): LongInt; stdcall;

  TfrmGetPeriod = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbuPrint: TToolButton;
    ToolButton2: TToolButton;
    ilImages: TImageList;
    alActions: TActionList;
    aSave: TAction;
    aCancel: TAction;
    os: TOracleSession;
    odsRepSpisOnPac: TOracleDataSet;
    acExcelExport: TAction;
    Panel1: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    rbM1: TRadioButton;
    rbM2: TRadioButton;
    rbM3: TRadioButton;
    rbM4: TRadioButton;
    rbM5: TRadioButton;
    rbM6: TRadioButton;
    rbM7: TRadioButton;
    rbM8: TRadioButton;
    rbM9: TRadioButton;
    rbM10: TRadioButton;
    rbM11: TRadioButton;
    rbM12: TRadioButton;
    rbK1: TRadioButton;
    rbK2: TRadioButton;
    rbK3: TRadioButton;
    rbK4: TRadioButton;
    rbG1: TRadioButton;
    rbG2: TRadioButton;
    rbG3: TRadioButton;
    Panel4: TPanel;
    Label4: TLabel;
    dDate1: TJvDateEdit;
    dDate2: TJvDateEdit;
    Panel2: TPanel;
    odsPacLst: TOracleDataSet;
    dsPacLst: TDataSource;
    frxRepSpisOnPac: TfrxReport;
    frxDBRepSpisOnPac: TfrxDBDataset;
    rbuAllPac: TRadioButton;
    rbuOnePac: TRadioButton;
    oqGetRepParam: TOracleQuery;
    ccbKontingent: TcxCheckComboBox;
    chbKontingent: TcxCheckBox;
    lcbPacLst: TcxLookupComboBox;
    chbVidOpl: TcxCheckBox;
    ccbVidOpl: TcxCheckComboBox;
    odsKontingent: TOracleDataSet;
    odsVidOpl: TOracleDataSet;
    frxXLSExport1: TfrxXLSExport;
    Panel3: TPanel;
    chbAllMOGROUP: TcxCheckBox;
    odsMOGROUP: TOracleDataSet;
    dsMOGROUP: TDataSource;
    lcbMOGROUP: TcxLookupComboBox;
    frxReport2: TfrxReport;
    odsActSpisRep: TOracleDataSet;
    odsTSMINI: TOracleDataSet;
    frxRepSpisOnPac_Diagr: TfrxReport;
    pmPrintView: TPopupMenu;
    miViewTable: TMenuItem;
    miViewDiagr: TMenuItem;
    frxChartObject1: TfrxChartObject;
    odsRepSpisOnPac_Diagr: TOracleDataSet;
    frxDBRepSpisOnPac_Diagr: TfrxDBDataset;
    frxRepSpisOnPacWithFIO: TfrxReport;
    frxDBRepSpisOnPacWithFIO: TfrxDBDataset;
    odsRepSpisOnPacWithFIO: TOracleDataSet;
    miViewTableWithFIO: TMenuItem;
    Panel5: TPanel;
    chbAllUchGr: TcxCheckBox;
    ccbUchGr: TcxCheckComboBox;
    btSearchPac: TcxButton;
    odsUchGr: TOracleDataSet;
    chbPeriod: TcxCheckBox;
    Label1: TLabel;
    gbUchGr: TcxGroupBox;
    chbShowMoGroup: TcxCheckBox;
    pFinsource: TPanel;
    chbAllFinsource: TcxCheckBox;
    ccbFinsource: TcxCheckComboBox;
    chbShowUchGr: TcxCheckBox;
    odsPacInfo: TOracleDataSet;
    Panel6: TPanel;
    chbAllMedic: TcxCheckBox;
    odsMedic: TOracleDataSet;
    lcbMedic: TcxLookupComboBox;
    dsMedic: TDataSource;
    oqBuhTsmini: TOracleQuery;
    oqNextDocNumber: TOracleQuery;
    odsFinSource: TOracleDataSet;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frRepUserFunction(const Name: String; p1, p2, p3: Variant;
      var Val: Variant);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rbAllClick(Sender: TObject);
    procedure odsPacLstAfterOpen(DataSet: TDataSet);
    procedure frxRepSpisOnPacGetValue(const VarName: String;
      var Value: Variant);
    procedure rbuOnePacClick(Sender: TObject);
    procedure rbuAllPacClick(Sender: TObject);
    procedure chbKontingentClick(Sender: TObject);
    procedure chbVidOplClick(Sender: TObject);
    procedure dDate1Change(Sender: TObject);
    procedure ccbKontingentPropertiesClickCheck(Sender: TObject;
      ItemIndex: Integer; var AllowToggle: Boolean);
    procedure lcbPacLstPropertiesInitPopup(Sender: TObject);
    procedure chbAllMOGROUPClick(Sender: TObject);
    function frxRepSpisOnPacUserFunction(const MethodName: String; var Params: Variant): Variant;
    procedure miViewTableClick(Sender: TObject);
    procedure btSearchPacClick(Sender: TObject);
    procedure chbAllUchGrClick(Sender: TObject);
    procedure chbAllFinsourceClick(Sender: TObject);
    procedure chbShowMoGroupClick(Sender: TObject);
    procedure chbShowUchGrClick(Sender: TObject);
    procedure chbAllMedicClick(Sender: TObject);

  private
    { Private declarations }
    FLang: array[0..KL_NAMELENGTH] of char; //Раскладка клавиатуры
    FPacByKontingentAndVidOpl : Integer;
    FTempSQL_odsRepSpisOnPacWithFIO : string;
    FTempSQL_odsRepSpisOnPac, FTempSQL_odsRepSpisOnPac_Diagr : string;
    FZaklKom, FSpisano,
    FPred, FKom1, FKom2, FKom3,
    FDolPred, FDolKom1, FDolKom2, FDolKom3, FFC_NAIM_KOL, FPrikaz  : string;
    fMOName, fVIDDEYAT, fINVNUM, fSCHET, fMVZ, fZAKAZ : string;
    FKom, FDolKom : array of string; // должности и фамилии членов комиссии

    procedure LOAD_FUNC_PacByKontingentAndVidOpl;
    procedure Refresh_odsPacLst;
    function get_countstr(aNumber: Integer): string;
    function GetValueFromTSMINI(const aSection, aKey: string): string;
    function GetValueFromBuhTSMINI(const aSection, aKey: string): string;
    function EncodeHexToString(aHexStr: string): string;
    function EncodeStringToHex(aStr: string): string;
  PUBLIC
    { Public declarations }                       

    nPacid            : Integer;
    HandleFoundPacDLL : THandle;
    InitPlgnFoundPac  : TInitPluginFoundPac;
    FreePlgnFoundPac  : TFreePluginFoundPac;
  end;

var
  frmGetPeriod      : TfrmGetPeriod;
  iniFileName : string;

implementation

uses Sysutils, Variants, IniFiles, {fdmPrintSelect,} ComObj, DateUtils, uGlobals,
  fReportInputActSpis, uGlobalConst, SMMainAPI;

{$R *.DFM}
//function DATERUSSTR(aDate : TDate) : string;
//begin
//  Result := GetDateStr( aDate );
//end;

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
    if SOT > 0 then
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
//==============================================================================
function IniReadString(sIniFile: string; Section, Ident: string; Default: string = ''): string;
var
	ini: TIniFile;
begin
	ini := TIniFile.Create(sIniFile);
	Result := ini.ReadString(Section, Ident, Default);
	ini.free;
end;

procedure IniWriteString(sIniFile: string; Section, Ident: string; val: string = '');
var
	ini: TIniFile;
begin
	ini := TIniFile.Create(sIniFile);
	ini.WriteString(Section, Ident, val);
	ini.free;
end;
//==============================================================================
//function IniWriteString2(Section, Ident: string; Value: string) : integer;
//begin
//  IniWriteString(iniFileName, Section, Ident, Value);
//  Result := 0;
//end;
//==============================================================================
function TfrmGetPeriod.EncodeStringToHex(aStr: string): string;
var
  i, Len : Integer;
begin
  Result := '';
  Len := Length(aStr);
  for i := 1 to Len do
    Result := Result+IntToHex(Ord(aStr[i]), 2);
end;
//------------------------------------------------------------------------------
function TfrmGetPeriod.EncodeHexToString(aHexStr: string): string;
var
  i, Len : Integer;

  function HexToByte(aHex : string) : Byte;
  var
    res : byte;
  begin
    res := 0;
    case aHex[2] of
      '0'..'9' : res := Ord(aHex[2])-48;
      'A'..'F' : res := Ord(aHex[2])-55;
      'a'..'f' : res := Ord(aHex[2])-87;
    end;

    case aHex[1] of
      '0'..'9' : res := res+ (Ord(aHex[1])-48)*16;
      'A'..'F' : res := res+ (Ord(aHex[1])-55)*16;
      'a'..'f' : res := res+ (Ord(aHex[1])-87)*16;
    end;
    Result := res;
  end;
begin
  Result := '';
  Len := Length(aHexStr) div 2;
  for i := 1 to Len do
    Result := Result+Chr(HexToByte(aHexStr[(i*2)-1]+aHexStr[i*2]));
end;
//------------------------------------------------------------------------------
function TfrmGetPeriod.get_countstr(aNumber: Integer): string;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.DeclareVariable('Number', otInteger);
    oq.DeclareVariable('ResStr', otString);
    oq.SetVariable('Number', aNumber);
    oq.Sql.Text := 'begin SELECT ASU.get_countstr( :Number ) into :ResStr FROM DUAL; end;';
    try
      oq.Execute;
      Result := oq.GetVariable('ResStr');
    except
      Result := '';
    end;
  finally
    oq.Free;
  end;
end;

procedure TfrmGetPeriod.aSaveExecute(Sender: TObject);
var
  s, NewSQL : string;
  i, i2 : Integer;
//  StrList : TStringList;
  frxComp : TfrxComponent;
  Params : TArrayOfParams;
  fShowDopInputParams : Boolean;
  fDopParams : Variant;

begin
  lcbPacLst.DroppedDown := False;
  lcbPacLst.PostEditValue;
  try
    StrToDate( dDate1.Text );
  except
    on EConvertError do begin
      Application.MessageBox('Неверно введена начальная дата периода', 'Ошибка', MB_OK + MB_ICONERROR);
      Self.dDate1.SetFocus;
      Exit;
    end;
  end;
  try
    StrToDate( dDate2.Text );
  except
    on EConvertError do begin
      Application.MessageBox('Неверно введена конечная дата периода', 'Ошибка', MB_OK + MB_ICONERROR);
      Self.dDate2.SetFocus;
      Exit;
    end;
  end;
  if Self.dDate1.date > Self.dDate2.date then begin
     Application.MessageBox('Неверно задан период', 'Ошибка', MB_OK + MB_ICONERROR);
    Self.dDate1.SetFocus;
    Exit;
  end;

  fShowDopInputParams := ( GetValueFromTSMINI('RepSpisOnPac.exe', 'ActInputShowDopParams') = '1' );

  try
    odsPacInfo.SetVariable('ppacid',lcbPacLst.EditValue);
    odsPacInfo.Close;
    odsPacInfo.Open;

    if tbuPrint.Tag < 2 then
    begin
      if ((tbuPrint.Tag = 1) AND FileExists('frxRepSpisOnPac.fr3')) then           // если найден файл
        frxRepSpisOnPac.LoadFromFile('frxRepSpisOnPac.fr3'); // загружаем его

//      StrList := TStringList.Create;
//      StrList.Text := EncodeHexToString(IniReadString(iniFileName, 'KOMISSIYA', 'TEXT', EncodeStringToHex('Председатель='#13#10'Член ком.1='#13#10'Член ком.2='#13#10'Член ком.3='#13#10'Должн. Председателя='#13#10'Должн. члена ком.1='#13#10'Должн. члена ком.2='#13#10'Должн. члена ком.3=')));
//      SetLength(Types, StrList.Count);
      i2 := 0;
      SetLength( Params, 1);
      Params[i2].Name := 'Председатель';
      Params[i2].Value := IniReadString(iniFileName,'Act_Spis', 'Predsed', '');
      Params[i2].ParamType := 1;
      inc( i2 );

      if TryStrToInt(GetValueFromTSMINI('RepSpisOnPac.exe', 'FUNC_COUNT_SPIS_CHLEN_KOM'), i) = False then i := 3;
      SetLength( FKom,  i );
      SetLength( Params, Length(Params)+i);
      for i := 0 to  Length(FKom) - 1 do
      begin
        Params[i2].Name := 'Член ком.'+IntToStr(i+1);
        Params[i2].Value := IniReadString(iniFileName, 'Act_Spis', 'ChlenKom'+IntToStr(i+1), '');
        Params[i2].ParamType := 1;
        inc( i2 );
      end;

      SetLength( Params, Length(Params)+1);
      Params[i2].Name := 'Должн. председателя';
      Params[i2].Value := IniReadString(iniFileName,'Act_Spis', 'DoljnChlenPredsed', '');
      Params[i2].ParamType := 0;
      inc( i2 );
      if TryStrToInt(GetValueFromTSMINI('RepSpisOnPac.exe', 'FUNC_COUNT_SPIS_CHLEN_KOM'), i) = False then i := 3;
      SetLength( FDolKom, i );
      SetLength( Params, Length(Params)+i);
      for i := 0 to  Length(FDolKom) - 1 do
      begin
        Params[i2].Name := 'Должн. члена ком.'+IntToStr(i+1);
        Params[i2].Value := IniReadString(iniFileName,'Act_Spis', 'DoljnChlenKom'+IntToStr(i+1), '');
        Params[i2].ParamType := 0;
        inc( i2 );
      end;

      FZaklKom := EncodeHexToString(IniReadString(iniFileName, 'Act_Spis', 'ZaklKom', ''));
      if FZaklKom = '' then // совместимость со старым хранением
        FZaklKom := EncodeHexToString(IniReadString(iniFileName, 'ZaklKom', 'TEXT', ''));

      FSpisano := EncodeHexToString(IniReadString(iniFileName, 'Act_Spis', 'Spisano', ''));
      if FSpisano = '' then // совместимость со старым хранением
        FSpisano := EncodeHexToString(IniReadString(iniFileName, 'Spisano', 'TEXT', ''));
      FPrikaz := IniReadString(iniFileName, 'Act_Spis', 'PrikazOt', '"___"  ____________  20___ г  № ___');

      if fShowDopInputParams then
      begin
        fMOName := IniReadString(iniFileName,'DopInputParams', 'MOName', '' );
        fVIDDEYAT := GetValueFromBuhTSMINI ( 'CONFIG_PORC', 'Vid_Deyatelnosti' ); 
        fINVNUM := GetValueFromBuhTSMINI ( 'CONFIG_PORC', 'Inventarnii_nomer' );
        fSCHET := GetValueFromBuhTSMINI ( 'CONFIG_PORC', 'Schet_subschet' );
        fMVZ := GetValueFromBuhTSMINI ( 'CONFIG_PORC', 'Mvz' );
        fZAKAZ := GetValueFromBuhTSMINI ( 'CONFIG_PORC', 'Zakaz' );
      end;

      if GetValueFromTSMINI('RepSpisOnPac.exe', 'ActInput') = '1' then
      begin
        fDopParams := VarArrayCreate( [0, 5 ], varVariant );

        fDopParams[0] := fMOName;
        fDopParams[1] := fVIDDEYAT;
        fDopParams[2] := fINVNUM;
        fDopParams[3] := fSCHET;
        fDopParams[4] := fMVZ;
        fDopParams[5] := fZAKAZ;

        if DoShowReportInputActSpis(os, fShowDopInputParams, Params, FZaklKom, FSpisano, FPrikaz, fDopParams ) <> mrOk then
        begin
          FZaklKom := '';
          FSpisano := '';
//          StrList.Free;
          fMOName := EmptyStr;
          fVIDDEYAT := EmptyStr;
          fINVNUM := EmptyStr;
          fSCHET := EmptyStr;
          fMVZ := EmptyStr;
          fZAKAZ := EmptyStr;

          Exit;
        end
        else
        begin
          fMOName := fDopParams[0];
          fVIDDEYAT := fDopParams[1];
          fINVNUM := fDopParams[2];
          fSCHET := fDopParams[3];
          fMVZ := fDopParams[4];
          fZAKAZ := fDopParams[5];
        end;
      end;   

//      IniWriteString(iniFileName, 'KOMISSIYA', 'TEXT', EncodeStringToHex(StrList.Text));
      for i := 0 to Length(Params) - 1 do
      begin
        if Params[i].Name = 'Председатель' then FPred := Params[i].Value;

        if pos('Член ком.', Params[i].Name) > 0 then
          for i2 := 0 to Length(FKom) - 1 do
            if Params[i].Name = 'Член ком.'+IntToStr(i2+1) then FKom[i2] := Params[i].Value;

        if Params[i].Name = 'Должн. председателя' then FDolPred := Params[i].Value;

        if pos('Должн. члена ком.', Params[i].Name) > 0 then
          for i2 := 0 to Length(FDolKom) - 1 do
            if Params[i].Name = 'Должн. члена ком.'+IntToStr(i2+1) then FDolKom[i2] := Params[i].Value;
      end;

      IniWriteString(iniFileName, 'Act_Spis', 'Predsed',           FPred   );

      for i := 1 to Length(FKom) do
        IniWriteString(iniFileName, 'Act_Spis', 'ChlenKom'+IntToStr(i),    FKom[i-1]);

      IniWriteString(iniFileName, 'Act_Spis', 'DoljnChlenPredsed', FDolPred);
      for i := 1 to Length(FDolKom) do
        IniWriteString(iniFileName, 'Act_Spis', 'DoljnChlenKom'+IntToStr(i),    FDolKom[i-1]);

      IniWriteString(iniFileName, 'Act_Spis', 'ZaklKom', EncodeStringToHex(FZaklKom));
      IniWriteString(iniFileName, 'Act_Spis', 'Spisano', EncodeStringToHex(FSpisano));
      IniWriteString(iniFileName, 'Act_Spis', 'PrikazOt', FPrikaz);

      IniWriteString(iniFileName, 'DopInputParams', 'MOName', fMOName);
    end;

    case tbuPrint.Tag of
      0: NewSQL := FTempSQL_odsRepSpisOnPacWithFIO;
      1: NewSQL := FTempSQL_odsRepSpisOnPac;
      2: NewSQL := FTempSQL_odsRepSpisOnPac_Diagr;
    end;

    if (not chbAllUchGr.Checked) then
    begin
      NewSQL := StringReplace(NewSQL, '--%UCHGR', '', [rfReplaceAll]);
      s := '';
      i := 0;
      while i < ccbUchGr.Properties.Items.Count do
      begin
        if ccbUchGr.GetItemState(i) = cbsChecked then
          s := s + ', '+ IntToStr(ccbUchGr.Properties.Items[i].Tag);
        Inc( i );
      end;
      Delete(S, 1, 2);
      if s = '' then s := '-1';
      NewSQL := StringReplace(NewSQL, '%LIST_UCHGR%', s, [rfReplaceAll]);
    end;

    // ------- модифицируем запрос для внесения всех выбранных условий  --------
    if (FPacByKontingentAndVidOpl = 1)and(rbuAllPac.Checked) then
    begin
//      odsRepSpisOnPac.SQL.Text := FTempSQL_odsRepSpisOnPac;
      if (chbVidOpl.Checked) then
      begin
        NewSQL := StringReplace(NewSQL, '--%VIDOPL', '', [rfReplaceAll]);
        s := '';
        i := 0;
        while i < ccbVidOpl.Properties.Items.Count do
        begin
          if ccbVidOpl.GetItemState(i) = cbsChecked then
            s := s + ', '+ IntToStr(ccbVidOpl.Properties.Items[i].Tag);
          Inc( i );
        end;
        Delete(S, 1, 2);
        if s = '' then s := '-1';
        NewSQL := StringReplace(NewSQL, '%LIST_VIDOPL%', s, [rfReplaceAll]);
      end;

      if (chbKontingent.Checked) then
      begin
        NewSQL := StringReplace(NewSQL, '--%KONTINGENT', '', [rfReplaceAll]);
        s := '';
        i := 0;
        while i < ccbKontingent.Properties.Items.Count do
        begin
          if ccbKontingent.GetItemState(i) = cbsChecked then
            s := s + ', '+ IntToStr(ccbKontingent.Properties.Items[i].Tag);
          Inc( i );
        end;
        Delete(S, 1, 2);
        if s = '' then s := '-1';
        NewSQL := StringReplace(NewSQL, '%LIST_KONTINGENT%', s, [rfReplaceAll]);
      end;
    end;
    //--------------------------------------------------------------------------
    if tbuPrint.Tag = 0 then
    begin
      odsRepSpisOnPacWithFIO.SQL.Text := NewSQL;
      odsRepSpisOnPacWithFIO.Close;

      if FileExists('frxRepSpisOnPacWithFIO.fr3') then           // если найден файл
        frxRepSpisOnPacWithFIO.LoadFromFile('frxRepSpisOnPacWithFIO.fr3'); // загружаем его

      if chbAllMedic.Checked then
        odsRepSpisOnPacWithFIO.SetVariable ('PMEDIC', -1 )
      else
        odsRepSpisOnPacWithFIO.SetVariable('PMEDIC', lcbMedic.EditValue );

      if chbPeriod.Checked then
      begin
        odsRepSpisOnPacWithFIO.SetVariable('DATE1', dDate1.Date);
        odsRepSpisOnPacWithFIO.SetVariable('DATE2', dDate2.Date);
      end
      else
      begin
        odsRepSpisOnPacWithFIO.SetVariable('DATE1', odsPacLst.FieldByName('FD_IN').AsDateTime);
        odsRepSpisOnPacWithFIO.SetVariable('DATE2', odsPacLst.FieldByName('FD_OUT').AsDateTime);
      end;
      odsRepSpisOnPacWithFIO.SetVariable('pPacID',lcbPacLst.EditValue);
      if rbuOnePac.Checked then
        odsRepSpisOnPacWithFIO.SetVariable('ALLPAC', 0)
      else
        odsRepSpisOnPacWithFIO.SetVariable('ALLPAC', 1);

      odsRepSpisOnPacWithFIO.SetVariable('PMOGROUP',lcbMOGROUP.EditValue);
      if chbAllMOGROUP.Checked then
        odsRepSpisOnPacWithFIO.SetVariable('ALLGROUPS', 1)
      else
        odsRepSpisOnPacWithFIO.SetVariable('ALLGROUPS', 0);

      if frxRepSpisOnPacWithFIO.FindObject('mGroupHeader') <> nil then
        TfrxMemoView(frxRepSpisOnPacWithFIO.FindObject('mGroupHeader')).Memo.Text :='';
                                
      odsRepSpisOnPacWithFIO.SetVariable('group','');   
      odsRepSpisOnPacWithFIO.SetVariable('uchgr','');

      if chbShowUchGr.Checked then
      begin
        odsRepSpisOnPacWithFIO.SetVariable('uchgr','fc_uchgr,');

        if frxRepSpisOnPacWithFIO.FindObject('GroupHeader1') <> nil then
        begin
          TfrxGroupHeader(frxRepSpisOnPacWithFIO.FindObject('GroupHeader1')).Condition := 'frxDBRepSpisOnPacWithFIO."FC_UCHGR"';
          frxRepSpisOnPacWithFIO.FindObject('GroupHeader1').Visible := True;
        end;                           

        if frxRepSpisOnPacWithFIO.FindObject('mGroupHeader') <> nil then
          TfrxMemoView(frxRepSpisOnPacWithFIO.FindObject('mGroupHeader')).Memo.Text :='[frxDBRepSpisOnPacWithFIO."FC_UCHGR"] (группа учетности)';

        if frxRepSpisOnPacWithFIO.FindObject('GroupFooter1') <> nil then
        begin
          frxRepSpisOnPacWithFIO.FindObject('GroupFooter1').Visible := True;
        end;
      end
      else if chbShowMoGroup.Checked then
      begin
        odsRepSpisOnPacWithFIO.SetVariable('group','FC_GROUP,');

        if frxRepSpisOnPacWithFIO.FindObject('GroupHeader1') <> nil then
        begin
          TfrxGroupHeader(frxRepSpisOnPacWithFIO.FindObject('GroupHeader1')).Condition := 'frxDBRepSpisOnPacWithFIO."FC_GROUP"';
          frxRepSpisOnPacWithFIO.FindObject('GroupHeader1').Visible := True;
        end;

        if frxRepSpisOnPacWithFIO.FindObject('mGroupHeader') <> nil then
          TfrxMemoView(frxRepSpisOnPacWithFIO.FindObject('mGroupHeader')).Memo.Text :='[frxDBRepSpisOnPacWithFIO."FC_GROUP"] (отделение)';

        if frxRepSpisOnPacWithFIO.FindObject('GroupFooter1') <> nil then
        begin
          frxRepSpisOnPacWithFIO.FindObject('GroupFooter1').Visible := True;
        end;
      end
      else
      begin
        if frxRepSpisOnPacWithFIO.FindObject('GroupHeader1') <> nil then
        begin
          TfrxGroupHeader(frxRepSpisOnPacWithFIO.FindObject('GroupHeader1')).Condition := '1';
          frxRepSpisOnPacWithFIO.FindObject('GroupHeader1').Visible := False;
        end;                                      

        if frxRepSpisOnPacWithFIO.FindObject('GroupFooter1') <> nil then
        begin
          frxRepSpisOnPacWithFIO.FindObject('GroupFooter1').Visible := False;
        end;
      end;

      odsRepSpisOnPacWithFIO.Open;

      FFC_NAIM_KOL := get_countstr(odsRepSpisOnPacWithFIO.RecordCount);

      frxRepSpisOnPacWithFIO.AddFunction('function MONEYSTR(Summa: double): string','ctOther');
      frxRepSpisOnPacWithFIO.AddFunction('function IniWriteString2(Section, Ident: string; Value: string) : integer');

      if rbuAllPac.Checked then
      begin
        frxComp := frxRepSpisOnPacWithFIO.FindObject('mePacFIO');
        if Assigned(frxComp) then  frxComp.Visible := False;

        frxComp := frxRepSpisOnPacWithFIO.FindObject('memKriteria');
        if Assigned(frxComp) then  frxComp.Visible := True;
      end;
      frxRepSpisOnPacWithFIO.PrepareReport(True);

      Self.Hide;
      frxRepSpisOnPacWithFIO.ShowPreparedReport;
    end
    else
    if tbuPrint.Tag = 1 then
    begin
      odsRepSpisOnPac.SQL.Text := NewSQL;
      odsRepSpisOnPac.Close;

      if chbAllMedic.Checked then
        odsRepSpisOnPac.SetVariable ('PMEDIC', -1 )
      else
        odsRepSpisOnPac.SetVariable('PMEDIC', lcbMedic.EditValue);

      if chbPeriod.Checked then
      begin
        odsRepSpisOnPac.SetVariable('DATE1', dDate1.Date);
        odsRepSpisOnPac.SetVariable('DATE2', dDate2.Date);
      end
      else
      begin
        odsRepSpisOnPac.SetVariable('DATE1', odsPacLst.FieldByName('FD_IN').AsDateTime);
        odsRepSpisOnPac.SetVariable('DATE2', odsPacLst.FieldByName('FD_OUT').AsDateTime);
      end;
      odsRepSpisOnPac.SetVariable('pPacID',lcbPacLst.EditValue);
      if rbuOnePac.Checked then
        odsRepSpisOnPac.SetVariable('ALLPAC', 0)
      else
        odsRepSpisOnPac.SetVariable('ALLPAC', 1);

      odsRepSpisOnPac.SetVariable('PMOGROUP',lcbMOGROUP.EditValue);
      if chbAllMOGROUP.Checked then
        odsRepSpisOnPac.SetVariable('ALLGROUPS', 1)
      else
        odsRepSpisOnPac.SetVariable('ALLGROUPS', 0);   

      if frxRepSpisOnPac.FindObject('mGroupHeader') <> nil then
        TfrxMemoView(frxRepSpisOnPac.FindObject('mGroupHeader')).Memo.Text :='';
                                                  
      odsRepSpisOnPac.SetVariable('group','');
      odsRepSpisOnPac.SetVariable('uchgr','');

      if chbShowUchGr.Checked then
      begin
        odsRepSpisOnPac.SetVariable('uchgr','fc_uchgr,');

        if frxRepSpisOnPac.FindObject('GroupHeader1') <> nil then
        begin
          TfrxGroupHeader(frxRepSpisOnPac.FindObject('GroupHeader1')).Condition := 'frxDBRepSpisOnPac."FC_UCHGR"';
          frxRepSpisOnPac.FindObject('GroupHeader1').Visible := True;
        end;                           

        if frxRepSpisOnPac.FindObject('mGroupHeader') <> nil then
          TfrxMemoView(frxRepSpisOnPac.FindObject('mGroupHeader')).Memo.Text :='[frxDBRepSpisOnPac."FC_UCHGR"] (группа учетности)';

        if frxRepSpisOnPac.FindObject('GroupFooter1') <> nil then
        begin
          frxRepSpisOnPac.FindObject('GroupFooter1').Visible := True;
        end;
      end
      else if chbShowMoGroup.Checked then
      begin
        odsRepSpisOnPac.SetVariable('group','FC_GROUP,');

        if frxRepSpisOnPac.FindObject('GroupHeader1') <> nil then
        begin
          TfrxGroupHeader(frxRepSpisOnPac.FindObject('GroupHeader1')).Condition := 'frxDBRepSpisOnPac."FC_GROUP"';
          frxRepSpisOnPac.FindObject('GroupHeader1').Visible := True;
        end;                           

        if frxRepSpisOnPac.FindObject('mGroupHeader') <> nil then
          TfrxMemoView(frxRepSpisOnPac.FindObject('mGroupHeader')).Memo.Text :='[frxDBRepSpisOnPac."FC_GROUP"] (отделение)';

        if frxRepSpisOnPac.FindObject('GroupFooter1') <> nil then
        begin
          frxRepSpisOnPac.FindObject('GroupFooter1').Visible := True;
        end;
      end
      else
      begin
        if frxRepSpisOnPac.FindObject('GroupHeader1') <> nil then
        begin
          TfrxGroupHeader(frxRepSpisOnPac.FindObject('GroupHeader1')).Condition := '1';
          frxRepSpisOnPac.FindObject('GroupHeader1').Visible := False;
        end;

        if frxRepSpisOnPac.FindObject('GroupFooter1') <> nil then
        begin
          frxRepSpisOnPac.FindObject('GroupFooter1').Visible := False;
        end;
      end;  

      // Добавил Неронов А.С. 14.02.2011
      odsRepSpisOnPac.SetVariable('finsource1','');
      odsRepSpisOnPac.SetVariable('finsource2','');
      odsRepSpisOnPac.SetVariable('finsource3','');
      odsRepSpisOnPac.SetVariable('finsource4','');
      odsRepSpisOnPac.SetVariable('finsource5','');
      odsRepSpisOnPac.SetVariable('finsource6','');

      if (GetValueFromTSMINI('RepSpisOnPac.exe', 'USE_FINSOURCE') = '1') or (pFinsource.Visible and (not chbAllFinsource.Checked)) then
      begin
        odsRepSpisOnPac.SetVariable('finsource1','fc_finsourcename, ');
        odsRepSpisOnPac.SetVariable('finsource2',', fs.fc_name as fc_finsourcename');
        odsRepSpisOnPac.SetVariable('finsource3',', med.tfinsource fs');
        odsRepSpisOnPac.SetVariable('finsource4','and k.fk_finsource_id = fs.fk_id(+)');
        odsRepSpisOnPac.SetVariable('finsource5','fc_finsourcename, ');

        if pFinsource.Visible and (not chbAllFinsource.Checked) then
        begin
          begin
            s := '';
            i := 0;
            while i < ccbFinsource.Properties.Items.Count do
            begin
              if ccbFinsource.GetItemState(i) = cbsChecked then
                s := s + ', '+ IntToStr(ccbFinsource.Properties.Items[i].Tag);
              Inc( i );
            end;
            Delete(S, 1, 2);
            if s = '' then s := '-1';                           
            odsRepSpisOnPac.SetVariable('finsource6','and k.fk_finsource_id in ('+s+')');
          end;
        end;
      end;

      odsRepSpisOnPac.Open;

      FFC_NAIM_KOL := get_countstr(odsRepSpisOnPac.RecordCount);

      frxRepSpisOnPac.AddFunction('function MONEYSTR(Summa: double): string','ctOther');
      frxRepSpisOnPac.AddFunction('function IniWriteString2(Section, Ident: string; Value: string) : integer');

      if rbuAllPac.Checked then
      begin
        frxComp := frxRepSpisOnPac.FindObject('mePacFIO');
        if Assigned(frxComp) then  frxComp.Visible := False;

        frxComp := frxRepSpisOnPac.FindObject('memKriteria');
        if Assigned(frxComp) then  frxComp.Visible := True;
      end;
      frxRepSpisOnPac.PrepareReport(True);

      Self.Hide;
      frxRepSpisOnPac.ShowPreparedReport;
    end
    else
    begin
      odsRepSpisOnPac_Diagr.SQL.Text := NewSQL;
      odsRepSpisOnPac_Diagr.Close;

      if chbAllMedic.Checked then
        odsRepSpisOnPac_Diagr.SetVariable ('PMEDIC', -1 )
      else
        odsRepSpisOnPac_Diagr.SetVariable('PMEDIC', lcbMedic.EditValue);
      
      if chbPeriod.Checked then
      begin
        odsRepSpisOnPac_Diagr.SetVariable('DATE1', dDate1.Date);
        odsRepSpisOnPac_Diagr.SetVariable('DATE2', dDate2.Date);
      end
      else
      begin
        odsRepSpisOnPac_Diagr.SetVariable('DATE1', odsPacLst.FieldByName('FD_IN').AsDateTime);
        odsRepSpisOnPac_Diagr.SetVariable('DATE2', odsPacLst.FieldByName('FD_OUT').AsDateTime);
      end;
      odsRepSpisOnPac_Diagr.SetVariable('pPacID',lcbPacLst.EditValue);
      if rbuOnePac.Checked then
        odsRepSpisOnPac_Diagr.SetVariable('ALLPAC', 0)
      else
        odsRepSpisOnPac_Diagr.SetVariable('ALLPAC', 1);

      odsRepSpisOnPac_Diagr.SetVariable('PMOGROUP',lcbMOGROUP.EditValue);
      if chbAllMOGROUP.Checked then
        odsRepSpisOnPac_Diagr.SetVariable('ALLGROUPS', 1)
      else
        odsRepSpisOnPac_Diagr.SetVariable('ALLGROUPS', 0);
      odsRepSpisOnPac_Diagr.Open;

      if rbuAllPac.Checked then
      begin
        frxComp := frxRepSpisOnPac_Diagr.FindObject('mePacFIO');
        if Assigned(frxComp) then  frxComp.Visible := False;

        frxComp := frxRepSpisOnPac_Diagr.FindObject('memKriteria');
        if Assigned(frxComp) then  frxComp.Visible := True;
      end;

      frxRepSpisOnPac_Diagr.PrepareReport();

      Self.Hide;
      frxRepSpisOnPac_Diagr.ShowPreparedReport;
    end;
  finally
      Self.Show;
  end;
end;

procedure TfrmGetPeriod.btSearchPacClick(Sender: TObject);
begin
  // Подключаем DLL выбора пациента
  HandleFoundPacDLL := LoadLibrary('FoundPac.dll');
  if HandleFoundPacDLL <> 0 then
  begin
    InitPlgnFoundPac := GetProcAddress(HandleFoundPacDLL, 'InitPlugin');
    FreePlgnFoundPac := GetProcAddress(HandleFoundPacDLL, 'FreePlugin');
    try
      nPacid := InitPlgnFoundPac(0,Application.Handle,1,N_SOTRID,0,0,0);
      FreePlgnFoundPac;
      FreeLibrary(HandleFoundPacDLL);
    except
      MessageBox(Handle, 'Некорректный вызов функции из библиотеки FoundPac.dll!', 'Внимание', MB_ICONWARNING or MB_OK);
    end;
  end
  else
  begin
    MessageBox(Handle, 'Отсутствует файл "FoundPac.dll"!' + #13 + #10 + 'Обратитесь к администратору системы!', 'Внимание!', MB_ICONSTOP or MB_OK);
  end;
  
  if nPacid > 0 then
  begin
    Refresh_odsPacLst;
    if odsPacLst.Locate('FK_PacID', nPacid, []) then
      lcbPacLst.EditValue := nPacid;
  end;
end;

procedure TfrmGetPeriod.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmGetPeriod.FormCreate(Sender: TObject);
var
//  d : Integer;
  ChBox : TcxCheckComboBoxItem;
begin
  FTempSQL_odsRepSpisOnPac        := odsRepSpisOnPac.SQL.Text;
  FTempSQL_odsRepSpisOnPac_Diagr  := odsRepSpisOnPac_Diagr.SQL.Text;
  FTempSQL_odsRepSpisOnPacWithFIO := odsRepSpisOnPacWithFIO.SQL.Text;

  try
//    os.LogOn;
    GetSession(os, 'ASU');
  except
    Application.MessageBox('Нет соединения с базой данных!','Ошибка',mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;

  dDate2.Date := Today;
  dDate1.Date := dDate2.Date - 7;

//  d:=strtoint(ods.FieldByName('M').AsString);
//  case d of
//    1: rbm1.Checked:=true;
//    2: rbm2.Checked:=true;
//    3: rbm3.Checked:=true;
//    4: rbm4.Checked:=true;
//    5: rbm5.Checked:=true;
//    6: rbm6.Checked:=true;
//    7: rbm7.Checked:=true;
//    8: rbm8.Checked:=true;
//    9: rbm9.Checked:=true;
//    10: rbm10.Checked:=true;
//    11: rbm11.Checked:=true;
//    12: rbm12.Checked:=true;
//  else
//     rbm1.Checked:=true;
//  end;
  //Запоминаем текущюю раскладку
  GetKeyboardLayoutName(FLang);
  //Загружаем русскую раскладку клавиатуры
  LoadKeyboardLayout(PChar('00000419'), KLF_ACTIVATE);
  Self.Caption := Application.Title;
  nPacid := -1;

  LOAD_FUNC_PacByKontingentAndVidOpl;

  if FPacByKontingentAndVidOpl = 1 then
  begin // заполняем значениями списки
    ccbKontingent.Properties.Items.Clear;
    odsKontingent.Open;
    odsKontingent.First;
    while not odsKontingent.Eof do
    begin
      ChBox := ccbKontingent.Properties.Items.Add;
      ChBox.Description := odsKontingent.FieldByName('FC_NAME').AsString;
      ChBox.Tag := odsKontingent.FieldByName('FK_ID').AsInteger;
      odsKontingent.Next;
    end;
    odsKontingent.Close;

    ccbVidOpl.Properties.Items.Clear;
    odsVidOpl.Open;
    odsVidOpl.First;
    while not odsVidOpl.Eof do
    begin
      ChBox := ccbVidOpl.Properties.Items.Add;
      ChBox.Description := odsVidOpl.FieldByName('FC_NAME').AsString;
      ChBox.Tag := odsVidOpl.FieldByName('FK_ID').AsInteger;
      odsVidOpl.Next;
    end;
    odsVidOpl.Close;

    ccbKontingent.Show;
    chbKontingent.Show;
    ccbVidOpl.Show;
    chbVidOpl.Show;
    pFinsource.Hide;
  end
  else
  begin  
    pFinsource.Show;
    ccbFinsource.Properties.Items.Clear;

    try
      odsFinSource.Close;    
      odsFinSource.Open;
      odsFinSource.First;
      while not odsFinSource.Eof do
      begin
        ChBox := ccbFinsource.Properties.Items.Add;
        ChBox.Description := odsFinSource.FieldByName('FC_NAME').AsString;
        ChBox.Tag := odsFinSource.FieldByName('FK_ID').AsInteger;
        odsFinSource.Next;
      end;
    finally
      odsFinSource.Close;
    end;

    Self.Height   := Self.Height - 50;
    Panel2.Height := 32;
  end;

  ccbUchGr.Properties.Items.Clear;
  odsUchGr.Open;
  odsUchGr.First;
  while not odsUchGr.Eof do
  begin
    ChBox := ccbUchGr.Properties.Items.Add;
    ChBox.Description := odsUchGr.FieldByName('FC_NAME').AsString;
    ChBox.Tag := odsUchGr.FieldByName('FK_ID').AsInteger;
    odsUchGr.Next;
  end;
  odsUchGr.Close;

  iniFileName := ChangeFileExt(Application.ExeName,'.ini');

  odsMOGROUP.Open;
  odsPacLst.Open;
  odsMedic.Open;

  fMOName := EmptyStr;
  fVIDDEYAT := EmptyStr;
  fINVNUM := EmptyStr;
  fSCHET := EmptyStr;
  fMVZ := EmptyStr;
  fZAKAZ := EmptyStr;
end;

procedure TfrmGetPeriod.frRepUserFunction(const Name: String; p1, p2,
  p3: Variant; var Val: Variant);
var
	d : string;
begin
	if name = 'MYSTRTOFLOAT' then
	begin
		d := frParser.Calc(p1);
		val:=StringReplace(d,',', '.',[rfReplaceAll]);
	end;
end;

function TfrmGetPeriod.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
  Result := False;
  try
    // TODo Подумать насчет праметра  Command
    if Data = -1 then
      HtmlHelp(0, 'StMedsestra.chm', HH_DISPLAY_TOPIC, 0)
    else
      HtmlHelp(0, 'StMedsestra.chm', HH_HELP_CONTEXT, Data);
    CallHelp := False;
    Result := True;
  except
  end;
end;

procedure TfrmGetPeriod.odsPacLstAfterOpen(DataSet: TDataSet);
begin
  lcbPacLst.DroppedDown := False;
  lcbPacLst.PostEditValue;
end;

procedure TfrmGetPeriod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  LoadKeyboardLayout(FLang, KLF_ACTIVATE);
  Action := caFree;
end;

procedure TfrmGetPeriod.rbAllClick(Sender: TObject);
var
  cName             : string;
  dDate             : tdate;
  nMon              : word;
  nYear             : word;
begin
  cName:=uppercase(tcomponent(Sender).getnamepath);
  dDate:=0;
  decodedate(date, nYear, nMon, nMon);
  if cName = 'RBM1' then begin
    dDate:=encodedate(nYear, 1, 1);
    nMon:=1
  end
  else
    if cName = 'RBM2' then begin
      dDate:=encodedate(nYear, 2, 1);
      nMon:=1
    end
    else
      if cName = 'RBM3' then begin
        dDate:=encodedate(nYear, 3, 1);
        nMon:=1
      end
      else
        if cName = 'RBM4' then begin
          dDate:=encodedate(nYear, 4, 1);
          nMon:=1
        end
        else
          if cName = 'RBM5' then begin
            dDate:=encodedate(nYear, 5, 1);
            nMon:=1
          end
          else
            if cName = 'RBM6' then begin
              dDate:=encodedate(nYear, 6, 1);
              nMon:=1
            end
            else
              if cName = 'RBM7' then begin
                dDate:=encodedate(nYear, 7, 1);
                nMon:=1
              end
              else
                if cName = 'RBM8' then begin
                  dDate:=encodedate(nYear, 8, 1);
                  nMon:=1
                end
                else
                  if cName = 'RBM9' then begin
                    dDate:=encodedate(nYear, 9, 1);
                    nMon:=1
                  end
                  else
                    if cName = 'RBM10' then begin
                      dDate:=encodedate(nYear, 10, 1);
                      nMon:=1
                    end
                    else
                      if cName = 'RBM11' then begin
                        dDate:=encodedate(nYear, 11, 1);
                        nMon:=1
                      end
                      else
                        if cName = 'RBM12' then begin
                          dDate:=encodedate(nYear, 12, 1);
                          nMon:=1
                        end
                        else
                          if cName = 'RBK1' then begin
                            dDate:=encodedate(nYear, 1, 1);
                            nMon:=3
                          end
                          else
                            if cName = 'RBK2' then begin
                              dDate:=encodedate(nYear, 4, 1);
                              nMon:=3
                            end
                            else
                              if cName = 'RBK3' then begin
                                dDate:=encodedate(nYear, 7, 1);
                                nMon:=3
                              end
                              else
                                if cName = 'RBK4' then begin
                                  dDate:=encodedate(nYear, 10, 1);
                                  nMon:=3
                                end
                                else
                                  if cName = 'RBG1' then begin
                                    dDate:=encodedate(nYear, 1, 1);
                                    nMon:=6
                                  end
                                  else
                                    if cName = 'RBG2' then begin
                                      dDate:=encodedate(nYear, 7, 1);
                                      nMon:=6
                                    end
                                    else
                                      if cName = 'RBG3' then begin
                                        dDate:=encodedate(nYear, 1, 1);
                                        nMon:=12
                                      end;
  Self.dDate1.date:=dDate;
  Self.dDate2.date:=incmonth(dDate, nMon) - 1;
end;

function TfrmGetPeriod.GetValueFromBuhTSMINI(const aSection, aKey: string): string;
begin
  with oqBuhTsmini do
  try
    ClearVariables;
    SetVariable( 'pSec', aSection );
    SetVariable( 'pIdent', aKey );
    SetVariable( 'pDef', EmptyStr );
    Execute;
    Result := GetVariable( 'pVal' );
  except
    Result := EmptyStr;
  end;
end;

function TfrmGetPeriod.GetValueFromTSMINI(const aSection, aKey: string): string;
begin
  odsTSMINI.Close;
  odsTSMINI.SetVariable('ASECTION', aSection);
  odsTSMINI.SetVariable('AKEY', aKey);
  try
    odsTSMINI.Open;

    if odsTSMINI.RecordCount > 0 then
      Result := odsTSMINI.FieldByName('FC_VALUE').AsString
    else
      Result := '';
    odsTSMINI.Close;
  except
    Result := '';
  end;  
end;

procedure TfrmGetPeriod.frxRepSpisOnPacGetValue(const VarName: String;
  var Value: Variant);

  function GetNextDocNo () : string;
  begin
    with oqNextDocNumber do
    try
      Execute;
      Result := GetVariable( 'pNetxNumber' );
    except
      on e : Exception do
      begin
        Result := EmptyStr;
        Application.MessageBox(PAnsiChar('Ошибка при получении номера документа!'), 'Ошибка', MB_OK + MB_ICONERROR);
      end;
    end;
  end;
var
  i, n:Integer; // Added by A.Nakorjakov 28.08.2008 18:50:03
  s:string;  // Added by A.Nakorjakov 28.08.2008 18:50:03
  IsFirst:Boolean; // Added by A.Nakorjakov 28.08.2008 18:50:03
  UpperCaseVarName, sTemp : string;
begin
  UpperCaseVarName := UpperCase(VarName);
  if UpperCaseVarName = 'VAR_FC_DATE1'   then Value := DateToStr(dDate1.Date);
  if UpperCaseVarName = 'VAR_FC_DATE2'   then Value := DateToStr(dDate2.Date);
  if UpperCaseVarName = 'VAR_FC_PAC_FIO' then
  begin
//b.FK_PacID, b.FC_PAC_FIO, b.FC_IB
    if odsPacLst.Locate('FK_PacID', lcbPacLst.EditValue, []) then
      Value := odsPacLst.FieldByName('FC_PAC_FIO').AsString
    else
      Value := '';
//    Value := lcbPacLst.Text;
  end;
  if UpperCaseVarName = 'VAR_FC_PAC_IB' then
  begin
    if odsPacLst.Locate('FK_PacID', lcbPacLst.EditValue, []) then
      Value := odsPacLst.FieldByName('FC_IB').AsString
    else
      Value := '';
  end;
  if UpperCaseVarName = 'VAR_PAC_BITH' then
  begin
    if odsPacLst.Locate('FK_PacID', lcbPacLst.EditValue, []) then
      Value := odsPacLst.FieldByName('FD_BITH').AsString
    else
      Value := '';
  end;
  if UpperCaseVarName = 'VAR_KDN' then
  begin
    if odsPacInfo.Locate('FK_PacID', lcbPacLst.EditValue, []) then
      Value := odsPacInfo.FieldByName('FN_KDN').AsString
    else
      Value := '';
  end;    
  if UpperCaseVarName = 'VAR_KDN_REANIM' then
  begin
    if odsPacInfo.Locate('FK_PacID', lcbPacLst.EditValue, []) then
      Value := odsPacInfo.FieldByName('FN_KDN_REANIM').AsString
    else
      Value := '';
  end; 
  if UpperCaseVarName = 'VAR_OPER_DLIT' then
  begin
    if odsPacInfo.Locate('FK_PacID', lcbPacLst.EditValue, []) then
      Value := odsPacInfo.FieldByName('FN_OPER_HOUR').AsString + ' ч. ' + odsPacInfo.FieldByName('FN_OPER_MIN').AsString + ' мин.' 
    else
      Value := '';
  end;  
  if UpperCaseVarName = 'VAR_ST_MS' then
  begin
    if odsPacInfo.Locate('FK_PacID', lcbPacLst.EditValue, []) then
      Value := odsPacInfo.FieldByName('fc_st_ms').AsString
    else
      Value := '';
  end;
  if UpperCaseVarName = 'VAR_ZAV_OTD' then
  begin
    if odsPacInfo.Locate('FK_PacID', lcbPacLst.EditValue, []) then
      Value := odsPacInfo.FieldByName('fc_zav_otd').AsString
    else
      Value := '';
  end;

  if UpperCaseVarName = 'GETZAKLKOM' then Value := FZaklKom;
  if UpperCaseVarName = 'GETSPISANO' then Value := FSpisano;

  if UpperCaseVarName = 'VAR_CLIENT_NAME' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_CLIENT_NAME', '');
    if sTemp = '' then
      Value := GetValueFromTSMINI('MANAGER_DOC', 'CLIENT_NAME_SMS')
    else
      Value := sTemp;
  end;
  if UpperCaseVarName = 'VAR_PODRAZDELENIE' then Value := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_PODRAZDELENIE', '');


//  if UpperCaseVarName = 'VAR_CLIENT_NAME' then Value := GetValueFromTSMINI('MANAGER_DOC', 'CLIENT_NAME_SMS')

  if UpperCaseVarName = 'PRED' then Value := FPred;
//  if UpperCaseVarName = 'KOM1' then Value := FKom1;
//  if UpperCaseVarName = 'KOM2' then Value := FKom2;
//  if UpperCaseVarName = 'KOM3' then Value := FKom3;
  if UpperCaseVarName = 'DOLPRED' then Value := FDolPred;
//  if UpperCaseVarName = 'DOLKOM1' then Value := FDolKom1;
//  if UpperCaseVarName = 'DOLKOM2' then Value := FDolKom2;
//  if UpperCaseVarName = 'DOLKOM3' then Value := FDolKom3;

  if (Copy(UpperCaseVarName,1,3) = 'KOM')and(TryStrToInt(Copy(UpperCaseVarName,4,10), n))and(n > 0) then
  begin
    if (n <= Length(FKom)) then
      Value := FKom[n-1]
    else
      Value := '';
  end;

  if (Copy(UpperCaseVarName,1,6) = 'DOLKOM')and(TryStrToInt(Copy(UpperCaseVarName,7,10), n))and(n > 0) then
  begin
    if (n <= Length(FDolKom)) then
      Value := FDolKom[n-1]
    else
      Value := '';
  end;

  if UpperCaseVarName = 'PRIKAZ' then Value := FPrikaz;
  
  if UpperCaseVarName = 'FC_NAIM_KOL' then Value := FFC_NAIM_KOL;
  if UpperCaseVarName = 'MEDOTRADE_SIGN' then Value := ReadMedotradeSign;

//  FPred, FKom1, FKom2, FKom3,
//    FDolPred, FDolKom1, FDolKom2, FDolKom3

  // Added by A.Nakorjakov 28.08.2008 18:56:00
  // started
  if rbuAllPac.Checked then S := 'На всех пациентов  '
  else s := 'На пациента: '+lcbPacLst.Text;

  if not chbAllMedic.Checked then s := s + #13+#10 + 'Медикамент: '+lcbMedic.Text;

  if chbKontingent.Checked then
  begin
    i := 0;
    s := ' по признаку контингента: ';
    IsFirst := True;
    while i < ccbKontingent.Properties.Items.Count do
    begin
      if ccbKontingent.GetItemState(i) = cbsChecked then
      begin
        if IsFirst then
        begin
          s := s + ccbKontingent.Properties.Items[i].GetCaption;
          IsFirst := False;
        end
        else begin
          s := s + ', '+ ccbKontingent.Properties.Items[i].GetCaption;
        end;
      end;
      Inc( i );
    end;
    if IsFirst = True then
      s := s + 'не указан';
  end;

  if chbVidOpl.Checked then
  begin
    i := 0;
    s := s+' по виду оплаты: ';
    IsFirst := True;
    while i < ccbVidOpl.Properties.Items.Count do
    begin
      if ccbVidOpl.GetItemState(i) = cbsChecked then
      begin
        if IsFirst then
        begin
          s := s + ccbVidOpl.Properties.Items[i].GetCaption;
          IsFirst := False;
        end
        else begin
          s := s + ', '+ ccbVidOpl.Properties.Items[i].GetCaption;
        end;
      end;
      Inc( i );
    end;
    if IsFirst = True then
      s := s + 'не указан';
  end;      

  if pFinsource.Visible and (not chbAllFinsource.Checked) then
  begin
    i := 0;
    s := 'Источник финансирования: ';
    IsFirst := True;
    while i < ccbFinsource.Properties.Items.Count do
    begin
      if ccbFinsource.GetItemState(i) = cbsChecked then
      begin
        if IsFirst then
        begin
          s := s + ccbFinsource.Properties.Items[i].GetCaption;
          IsFirst := False;
        end
        else begin
          s := s + ', '+ ccbFinsource.Properties.Items[i].GetCaption;
        end;
      end;
      Inc( i );
    end;
    if IsFirst = True then
      s := s + 'не указан';
  end;

  if UpperCaseVarName = 'VAR_KRITERIA' then Value := s;
  // Added by A.Nakorjakov 28.08.2008 18:56:00
  // finished

  if UpperCaseVarName = 'VAR_GLAV_VRACH' then Value := GetValueFromTSMINI ( 'MANAGER_DOC', 'GLAV_VRACH' ) ;

  if UpperCaseVarName = 'VAR_MO_NAME' then Value := fMOName;  
  if UpperCaseVarName = 'VAR_VIDDEYAT' then Value := fVIDDEYAT;
  if UpperCaseVarName = 'VAR_INVNUM' then Value := fINVNUM;
  if UpperCaseVarName = 'VAR_SCHET' then Value := fSCHET;
  if UpperCaseVarName = 'VAR_MVZ' then Value := fMVZ;
  if UpperCaseVarName = 'VAR_ZAKAZ' then Value := fZAKAZ;
  if UpperCaseVarName = 'VAR_DOC_NO' then Value := GetNextDocNo;

end;

procedure TfrmGetPeriod.rbuOnePacClick(Sender: TObject);
begin
  lcbPacLst.Enabled     := True;
  btSearchPac.Enabled   := True;   
  chbPeriod.Checked     := False;
  chbPeriod.Enabled     := True;

  chbKontingent.Enabled := False;
  ccbKontingent.Enabled := False;

  chbVidOpl.Enabled     := False;
  ccbVidOpl.Enabled     := False;
end;

procedure TfrmGetPeriod.rbuAllPacClick(Sender: TObject);
begin
  lcbPacLst.Enabled     := False;
  btSearchPac.Enabled   := False;
  
  chbPeriod.Checked     := True;
  chbPeriod.Enabled     := False;
  nPacid := -1;

  chbKontingent.Enabled := True;
  ccbKontingent.Enabled := True;

  chbVidOpl.Enabled     := True;
  ccbVidOpl.Enabled     := True;
end;

procedure TfrmGetPeriod.LOAD_FUNC_PacByKontingentAndVidOpl;
begin
  try
    oqGetRepParam.Execute;
    FPacByKontingentAndVidOpl := StrToInt(oqGetRepParam.GetVariable('res'));
  except
    FPacByKontingentAndVidOpl := 0;
  end;
end;

procedure TfrmGetPeriod.chbKontingentClick(Sender: TObject);
begin
  ccbKontingent.Enabled := chbKontingent.Checked;
  lcbPacLst.EditValue := null;
end;

procedure TfrmGetPeriod.chbShowMoGroupClick(Sender: TObject);
begin
  chbShowUchGr.OnClick := nil;
  chbShowUchGr.Checked := false;
  chbShowUchGr.OnClick := chbShowUchGrClick;
end;

procedure TfrmGetPeriod.chbShowUchGrClick(Sender: TObject);
begin                                 
  chbShowMoGroup.OnClick := nil;
  chbShowMoGroup.Checked := false;
  chbShowMoGroup.OnClick := chbShowMoGroupClick;
end;

procedure TfrmGetPeriod.chbVidOplClick(Sender: TObject);
begin
  ccbVidOpl.Enabled := chbVidOpl.Checked;
  lcbPacLst.EditValue := null;
end;

procedure TfrmGetPeriod.chbAllFinsourceClick(Sender: TObject);
begin
  ccbFinsource.Enabled := not chbAllFinsource.Checked;
end;

procedure TfrmGetPeriod.Refresh_odsPacLst;
var
  OldEditValue : Variant;
begin
  OldEditValue := lcbPacLst.EditValue;
  odsPacLst.Close;
  Screen.Cursor := crHourGlass;
  odsPacLst.SetVariable('DATE1', dDate1.Date);
  odsPacLst.SetVariable('DATE2', dDate2.Date);   
  odsPacLst.SetVariable('ppacid', nPacid);
  if rbuOnePac.Checked then
    odsPacLst.SetVariable('ALLPAC', 0)
  else
    odsPacLst.SetVariable('ALLPAC', 1);
  odsPacLst.Open;

  if odsPacLst.Locate('FK_PacID', OldEditValue, []) then
    lcbPacLst.EditValue := OldEditValue;
  Screen.Cursor := crDefault;
end;

procedure TfrmGetPeriod.dDate1Change(Sender: TObject);
begin
  lcbPacLst.EditValue := Null;
end;

procedure TfrmGetPeriod.ccbKontingentPropertiesClickCheck(Sender: TObject;
  ItemIndex: Integer; var AllowToggle: Boolean);
begin
  lcbPacLst.EditValue := null;
end;

procedure TfrmGetPeriod.lcbPacLstPropertiesInitPopup(Sender: TObject);
begin
  Refresh_odsPacLst;
end;

procedure TfrmGetPeriod.chbAllMedicClick(Sender: TObject);
begin
  lcbMedic.Enabled := not chbAllMedic.Checked;
end;

procedure TfrmGetPeriod.chbAllMOGROUPClick(Sender: TObject);
begin
  lcbMOGROUP.Enabled := not chbAllMOGROUP.Checked;
end;

procedure TfrmGetPeriod.chbAllUchGrClick(Sender: TObject);
begin
  ccbUchGr.Enabled := not chbAllUchGr.Checked;
end;

function TfrmGetPeriod.frxRepSpisOnPacUserFunction(const MethodName: String; var Params: Variant): Variant;
begin
	if UpperCase(MethodName) = 'MONEYSTR' then
	begin
		Result := MoneyToString(Params[0], True);
  end;
  if UpperCase(MethodName) = 'INIWRITESTRING2' then
  begin
    IniWriteString(iniFileName, Params[0], Params[1], Params[2] );
    Result := 0;
  end;
end;

procedure TfrmGetPeriod.miViewTableClick(Sender: TObject);
begin
  tbuPrint.Tag := TMenuItem(Sender).Tag;
  aSave.Execute;
end;

end.


