
unit fgetperiod;

interface

uses Windows, FR_DSet, FR_DBSet, Db,
  FR_Class, frOLEExl, frXMLExl, FR_Desgn, OracleData, Oracle, Classes,
  ActnList, ImgList, Controls, DBCtrls, ComCtrls, ToolWin, StdCtrls,
  ExtCtrls, Forms, JvExMask, JvToolEdit, Mask, OracleMonitor,
  cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  frxClass, frxDBSet, cxCheckBox, cxCheckComboBox, frxExportXLS, dxSkinsCore,
  dxSkinsDefaultPainters, cxSpinEdit, cxRadioGroup;

//const NullDate = -700000;

type
  TfrmGetPeriod = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ilImages: TImageList;
    alActions: TActionList;
    aSave: TAction;
    aCancel: TAction;
    os: TOracleSession;
    odsRepSpisOnHighTek: TOracleDataSet;
    frDesigner: TfrDesigner;
    acExcelExport: TAction;
    frxRepSpisOnHighTek: TfrxReport;
    oqGetRepParam: TOracleQuery;
    odsTSMINI: TOracleDataSet;
    Panel4: TPanel;
    Label2: TLabel;
    cmbMonth1: TcxComboBox;
    sedYear1: TcxSpinEdit;
    odsServerDate: TOracleDataSet;
    Panel1: TPanel;
    ToolButton3: TToolButton;
    laMonthYear: TLabel;
    rbuByOtd: TcxRadioButton;
    rbuByVid: TcxRadioButton;
    frxDBRepSpisOnHighTek: TfrxDBDataset;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frRepUserFunction(const Name: String; p1, p2, p3: Variant;
      var Val: Variant);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbMonth1PropertiesChange(Sender: TObject);
    procedure frxRepSpisOnHighTekGetValue(const VarName: string;
      var Value: Variant);

  private
    { Private declarations }
    FLang: array[0..KL_NAMELENGTH] of char; //Раскладка клавиатуры
    FDate1, FDate2 : TDate;

    function GetValueFromTSMINI(const aSection, aKey: string): string;
    function EncodeHexToString(aHexStr: string): string;
    function EncodeStringToHex(aStr: string): string;
  PUBLIC
    { Public declarations }
    isMonth1PropertiesChangeEnable : Boolean;
    procedure SetMonth( aDate : TDate ); overload;
    procedure SetMonth( aYear, aMonth : Word ); overload;
  end;

var
  frmGetPeriod      : TfrmGetPeriod;
  iniFileName : string;

implementation

uses Sysutils, Variants, IniFiles, DateUtils, SMMainAPI;

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
procedure TfrmGetPeriod.aSaveExecute(Sender: TObject);
begin
  try
    //--------------------------------------------------------------------------
    odsRepSpisOnHighTek.SetVariable('DATE1', FDate1);
    odsRepSpisOnHighTek.SetVariable('DATE2', FDate2);
    Self.Hide;

    if rbuByOtd.Checked then
    begin
      odsRepSpisOnHighTek.SQL.Text := StringReplace(odsRepSpisOnHighTek.SQL.Text, '--%rbuByOtd%', '', [rfReplaceAll]);
      odsRepSpisOnHighTek.Open;
      frxRepSpisOnHighTek.Pages[1].Visible := True;
      frxRepSpisOnHighTek.ShowReport;
    end;

    if rbuByVid.Checked then
    begin
      odsRepSpisOnHighTek.SQL.Text := StringReplace(odsRepSpisOnHighTek.SQL.Text, '--%rbuByVid%', '', [rfReplaceAll]);
      odsRepSpisOnHighTek.Open;
      frxRepSpisOnHighTek.Pages[2].Visible := True;
      frxRepSpisOnHighTek.ShowReport;
    end;

  finally
    Close;
  end;
end;

procedure TfrmGetPeriod.cmbMonth1PropertiesChange(Sender: TObject);
begin
  if not isMonth1PropertiesChangeEnable then Exit;  // чтобы из SetMonth(aDate: TDate); не вызывалось это событие

  SetMonth(sedYear1.Value, cmbMonth1.ItemIndex+1);
end;

procedure TfrmGetPeriod.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmGetPeriod.FormCreate(Sender: TObject);
var
  i : integer;
begin
  try
    GetSession(os, 'ASU');
    if Application.Terminated then Exit;
//    os.LogOn;
  except
    Application.MessageBox('Нет соединения с базой данных!','Ошибка',mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;


  //Запоминаем текущюю раскладку
  GetKeyboardLayoutName(FLang);
  //Загружаем русскую раскладку клавиатуры
  LoadKeyboardLayout(PChar('00000419'), KLF_ACTIVATE);
  Self.Caption := Application.Title;

  iniFileName := ChangeFileExt(Application.ExeName,'ini');

  isMonth1PropertiesChangeEnable := False;
  for i := Low(LongMonthNames) to High(LongMonthNames) do
    cmbMonth1.Properties.Items.Add(LongMonthNames[i]);
  isMonth1PropertiesChangeEnable := True;

  odsServerDate.Close;
  odsServerDate.Open;
  SetMonth( odsServerDate.FieldByName('sysdate').AsDateTime );  
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

procedure TfrmGetPeriod.frxRepSpisOnHighTekGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'MonthYear' then Value := laMonthYear.Caption;
end;

function TfrmGetPeriod.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
  Result := False;
end;

procedure TfrmGetPeriod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  LoadKeyboardLayout(FLang, KLF_ACTIVATE);
  Action := caFree;
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
procedure TfrmGetPeriod.SetMonth(aDate: TDate);
var
  Day, Month, Year : Word;
begin
  DecodeDate(aDate, Year, Month, Day);
  isMonth1PropertiesChangeEnable := False; // чтобы обработчик cmbMonth1PropertiesChange(Sender: TObject);
  cmbMonth1.ItemIndex := (Month-1);        // не вызывался
  sedYear1.Value := Year;
  isMonth1PropertiesChangeEnable := True;

  SetMonth(Year, Month);
end;

procedure TfrmGetPeriod.SetMonth(aYear, aMonth: Word);
begin
  FDate1 := EncodeDate(aYear, aMonth, 1);
  FDate2 := EncodeDate(aYear, aMonth, DaysInAMonth(aYear, aMonth));
  laMonthYear.Caption :=  cmbMonth1.Text + ' ' + IntToStr(sedYear1.Value)+' г.';
end;

end.


