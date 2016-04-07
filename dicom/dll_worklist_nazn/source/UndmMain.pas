unit UndmMain;

interface

uses
  SysUtils, Classes, DB, ADODB, ADOInt, Oracle, Variants, Dialogs, ComObj, DateUtils,
  DCM_Attributes;

type
  TdmMain = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const C_PROGNAME = 'DLL_WORKLIST_NAZN';
      c_is_translit = True;

var
  dmMain: TdmMain;
  OracleSession1: TOracleSession;
  ADOConnection1: TADOConnection;

  // параметры соединения с атрис
  v_atris_webpage ,
  v_atris_mssql_conn_str,
  v_atris_webuser,
  v_atris_webpassword,
  v_atris_use : string;
  v_atris_web_timeout : Integer;

  v_fld_razd : string;

  v_patientID,
  v_AccessionNumber,
  v_studyUID : string ;

  v_maxrow : integer;

  v_obmen_filename : AnsiString;

type PStringList = ^TStringList;

const c_wait_time = 1000*20; // максимальное время ожидания открытия страницы  

function f_MSSQLconn : Boolean;

procedure setSession (OracleSession1: pointer);
procedure oraDisconnect;
function f_gtTSMINI ( p_key : string; p_section : string ) : string;

procedure p_ATRIS_ini_params;
procedure mssql_prep_conn;
procedure gt_StudiesList ( p_patientid : string );
procedure gt_MnStudiesList ( p_patientNum : string; p_AccessionNumber : string  );
procedure gt_WorkList( p_patientid : string; p_AccessionNumber : string; p_studyinstanceuid : string; p_modatity : string; p_stationaetitle : string );
procedure p_MndelWorklist(p_AccessionNumber : string;p_studyinstanceuid : string);
procedure p_MNINSWorklist   ( p_atris_mssql_conn_str : string;
                              p_PatientIDINS : string;      // Номер Карты -> PatientID
                              p_patPrefix : string;         // patPrefix (не исп)
                              p_PatientFamily : string;     // Фамилия
                              p_PatientNAME : string;       // Имя
                              p_PatientSurname : string;    // Отчество
                              p_BirthDate : TDateTime;         // Дата рождения -> PatientBirthDate
                              p_Sex : string;               // Пол
                              p_AETitle : string;           // AETitle аппарата
                              p_Room : string;              // Комната (не исп)
                              p_DiagnMKB10 : string;        // Код напр. диагноза по МКБ-10 -> не исп
                              p_Podrazdelenie : string;     // Направившее подразделение
                              p_VrachFam : string;          // Фамилия направившего врача
                              p_VrachIm : string;           // Имя направившего врача
                              p_VrachOtch : string;         // Отчество направившего врача
                              p_Modality : string;          // Modality
                              p_BodyPart : string;          // Название исследуемой части тела
                              p_StudyName : string;         // Название исследования
                              p_FASTEST : string;           // Экстренный (1/0)-> не исп (integer)
                              p_DateTimeNapravl : TDateTime;       // Дата / Время направления
                              p_Polikl_Statsionar : string; // 0 - Поликлиника, 1 - Стационар
                              p_AccessionNumber : string;    // AccessionNumber
                              p_studyinstanceuid : string  // studyinstanceuid
                           );
// транслитерация из латыни в кириллицу
function TranslitEng(s: string): string;
// транслитерация из кириллицы в латынь
function TranslitRus(s: string): string;

function f_getstudyUID(p_AccessionNumber:string):string;

function chk_AN_inr ( p_atris_mssql_conn_str : string;
                      p_AccessionNumber : string
                    ):Boolean;

implementation

Uses Forms;

{$R *.dfm}

function f_gtTSMINI ( p_key : string; p_section : string ) : string;
var v_OraclePackage : TOraclePackage;
begin
  v_OraclePackage := TOraclePackage.Create(nil);
  try
    v_OraclePackage.Session := OracleSession1;
    v_OraclePackage.PackageName:='asu.PKG_SMINI';
    Result:=v_OraclePackage.CallStringFunction('READSTRING',[p_key,p_section,'']);
  finally
    v_OraclePackage.Free;
  end;
end;

function TranslitRus(s: string): string;
var StrL, StrU : string;
begin
  StrU := StringReplace((StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(s,
                       'Я', 'ya', [rfReplaceAll, rfIgnoreCase])),
                       'Ю', 'yu', [rfReplaceAll, rfIgnoreCase])),
                       'Е', 'e', [rfReplaceAll, rfIgnoreCase])),
                       'Э', 'eh', [rfReplaceAll, rfIgnoreCase])),
                       'Щ', 'shh', [rfReplaceAll, rfIgnoreCase])),
                       'Ш', 'sh', [rfReplaceAll, rfIgnoreCase])),
                       'Ч', 'ch', [rfReplaceAll, rfIgnoreCase])),
                       'Ж', 'zh', [rfReplaceAll, rfIgnoreCase])),
                       'Ё', 'jo', [rfReplaceAll, rfIgnoreCase])),
                       'Ь', '''', [rfReplaceAll, rfIgnoreCase])),
                       'Ы', 'y', [rfReplaceAll, rfIgnoreCase])),
                       'Ъ', '"', [rfReplaceAll, rfIgnoreCase])),
                       'Х', 'h', [rfReplaceAll, rfIgnoreCase])),
                       'Ц', 'c', [rfReplaceAll, rfIgnoreCase])),
                       'Ф', 'f', [rfReplaceAll, rfIgnoreCase])),
                       'У', 'u', [rfReplaceAll, rfIgnoreCase])),
                       'Т', 't', [rfReplaceAll, rfIgnoreCase])),
                       'С', 's', [rfReplaceAll, rfIgnoreCase])),
                       'Р', 'r', [rfReplaceAll, rfIgnoreCase])),
                       'П', 'p', [rfReplaceAll, rfIgnoreCase])),
                       'О', 'o', [rfReplaceAll, rfIgnoreCase])),
                       'Н', 'n', [rfReplaceAll, rfIgnoreCase])),
                       'М', 'm', [rfReplaceAll, rfIgnoreCase])),
                       'Л', 'l', [rfReplaceAll, rfIgnoreCase])),
                       'К', 'k', [rfReplaceAll, rfIgnoreCase])),
                       'Й', 'j', [rfReplaceAll, rfIgnoreCase])),
                       'И', 'i', [rfReplaceAll, rfIgnoreCase])),
                       'З', 'z', [rfReplaceAll, rfIgnoreCase])),
                       'Д', 'd', [rfReplaceAll, rfIgnoreCase])),
                       'Г', 'g', [rfReplaceAll, rfIgnoreCase])),
                       'В', 'v', [rfReplaceAll, rfIgnoreCase])),
                       'Б', 'b', [rfReplaceAll, rfIgnoreCase])),
                       'А', 'a', [rfReplaceAll, rfIgnoreCase]);

  StrL := StringReplace((StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(StrU,
                       'я', 'ya', [rfReplaceAll, rfIgnoreCase])),
                       'ю', 'yu', [rfReplaceAll, rfIgnoreCase])),
                       'е', 'e', [rfReplaceAll, rfIgnoreCase])),
                       'э', 'eh', [rfReplaceAll, rfIgnoreCase])),
                       'щ', 'shh', [rfReplaceAll, rfIgnoreCase])),
                       'ш', 'sh', [rfReplaceAll, rfIgnoreCase])),
                       'ч', 'ch', [rfReplaceAll, rfIgnoreCase])),
                       'ж', 'zh', [rfReplaceAll, rfIgnoreCase])),
                       'ё', 'jo', [rfReplaceAll, rfIgnoreCase])),
                       'ь', '''', [rfReplaceAll, rfIgnoreCase])),
                       'ы', 'y', [rfReplaceAll, rfIgnoreCase])),
                       'ъ', '"', [rfReplaceAll, rfIgnoreCase])),
                       'х', 'h', [rfReplaceAll, rfIgnoreCase])),
                       'ц', 'c', [rfReplaceAll, rfIgnoreCase])),
                       'ф', 'f', [rfReplaceAll, rfIgnoreCase])),
                       'у', 'u', [rfReplaceAll, rfIgnoreCase])),
                       'т', 't', [rfReplaceAll, rfIgnoreCase])),
                       'с', 's', [rfReplaceAll, rfIgnoreCase])),
                       'р', 'r', [rfReplaceAll, rfIgnoreCase])),
                       'п', 'p', [rfReplaceAll, rfIgnoreCase])),
                       'о', 'o', [rfReplaceAll, rfIgnoreCase])),
                       'н', 'n', [rfReplaceAll, rfIgnoreCase])),
                       'м', 'm', [rfReplaceAll, rfIgnoreCase])),
                       'л', 'l', [rfReplaceAll, rfIgnoreCase])),
                       'к', 'k', [rfReplaceAll, rfIgnoreCase])),
                       'й', 'j', [rfReplaceAll, rfIgnoreCase])),
                       'и', 'i', [rfReplaceAll, rfIgnoreCase])),
                       'з', 'z', [rfReplaceAll, rfIgnoreCase])),
                       'д', 'd', [rfReplaceAll, rfIgnoreCase])),
                       'г', 'g', [rfReplaceAll, rfIgnoreCase])),
                       'в', 'v', [rfReplaceAll, rfIgnoreCase])),
                       'б', 'b', [rfReplaceAll, rfIgnoreCase])),
                       'а', 'a', [rfReplaceAll, rfIgnoreCase]);

  TranslitRus := UpperCase(StrL);
end;

// транслитерация из латыни в кириллицу
function TranslitEng(s: string): string;
var StrL, StrU : string;
begin
  StrU := StringReplace((StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(s,
                       'ya', 'Я', [rfReplaceAll, rfIgnoreCase])),
                       'yu', 'Ю', [rfReplaceAll, rfIgnoreCase])),
                       'e', 'Е', [rfReplaceAll, rfIgnoreCase])),
                       'eh', 'Э', [rfReplaceAll, rfIgnoreCase])),
                       'shh', 'Щ', [rfReplaceAll, rfIgnoreCase])),
                       'sh', 'Ш', [rfReplaceAll, rfIgnoreCase])),
                       'ch', 'Ч', [rfReplaceAll, rfIgnoreCase])),
                       'zh', 'Ж', [rfReplaceAll, rfIgnoreCase])),
                       'jo', 'Ё', [rfReplaceAll, rfIgnoreCase])),
                       '''', 'Ь', [rfReplaceAll, rfIgnoreCase])),
                       'y', 'Ы', [rfReplaceAll, rfIgnoreCase])),
                       '"', 'Ъ', [rfReplaceAll, rfIgnoreCase])),
                       'h', 'Х', [rfReplaceAll, rfIgnoreCase])),
                       'c', 'Ц', [rfReplaceAll, rfIgnoreCase])),
                       'f', 'Ф', [rfReplaceAll, rfIgnoreCase])),
                       'u', 'У', [rfReplaceAll, rfIgnoreCase])),
                       't', 'Т', [rfReplaceAll, rfIgnoreCase])),
                       's', 'С', [rfReplaceAll, rfIgnoreCase])),
                       'r', 'Р', [rfReplaceAll, rfIgnoreCase])),
                       'p', 'П', [rfReplaceAll, rfIgnoreCase])),
                       'o', 'О', [rfReplaceAll, rfIgnoreCase])),
                       'n', 'Н', [rfReplaceAll, rfIgnoreCase])),
                       'm', 'М', [rfReplaceAll, rfIgnoreCase])),
                       'l', 'Л', [rfReplaceAll, rfIgnoreCase])),
                       'k', 'К', [rfReplaceAll, rfIgnoreCase])),
                       'j', 'Й', [rfReplaceAll, rfIgnoreCase])),
                       'i', 'И', [rfReplaceAll, rfIgnoreCase])),
                       'z', 'З', [rfReplaceAll, rfIgnoreCase])),
                       'd', 'Д', [rfReplaceAll, rfIgnoreCase])),
                       'g', 'Г', [rfReplaceAll, rfIgnoreCase])),
                       'v', 'В', [rfReplaceAll, rfIgnoreCase])),
                       'b', 'Б', [rfReplaceAll, rfIgnoreCase])),
                       'a', 'А', [rfReplaceAll, rfIgnoreCase]);

  StrL := StringReplace((StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(
                       (StringReplace(StrU,
                       'ya', 'я', [rfReplaceAll, rfIgnoreCase])),
                       'yu', 'ю', [rfReplaceAll, rfIgnoreCase])),
                       'e', 'е', [rfReplaceAll, rfIgnoreCase])),
                       'eh', 'э', [rfReplaceAll, rfIgnoreCase])),
                       'shh', 'щ', [rfReplaceAll, rfIgnoreCase])),
                       'sh', 'ш', [rfReplaceAll, rfIgnoreCase])),
                       'ch', 'ч', [rfReplaceAll, rfIgnoreCase])),
                       'zh', 'ж', [rfReplaceAll, rfIgnoreCase])),
                       'jo', 'ё', [rfReplaceAll, rfIgnoreCase])),
                       '''', 'ь', [rfReplaceAll, rfIgnoreCase])),
                       'y', 'ы', [rfReplaceAll, rfIgnoreCase])),
                       '"', 'ъ', [rfReplaceAll, rfIgnoreCase])),
                       'h', 'х', [rfReplaceAll, rfIgnoreCase])),
                       'c', 'ц', [rfReplaceAll, rfIgnoreCase])),
                       'f', 'ф', [rfReplaceAll, rfIgnoreCase])),
                       'u', 'у', [rfReplaceAll, rfIgnoreCase])),
                       't', 'т', [rfReplaceAll, rfIgnoreCase])),
                       's', 'с', [rfReplaceAll, rfIgnoreCase])),
                       'r', 'р', [rfReplaceAll, rfIgnoreCase])),
                       'p', 'п', [rfReplaceAll, rfIgnoreCase])),
                       'o', 'о', [rfReplaceAll, rfIgnoreCase])),
                       'n', 'н', [rfReplaceAll, rfIgnoreCase])),
                       'm', 'м', [rfReplaceAll, rfIgnoreCase])),
                       'l', 'л', [rfReplaceAll, rfIgnoreCase])),
                       'k', 'к', [rfReplaceAll, rfIgnoreCase])),
                       'j', 'й', [rfReplaceAll, rfIgnoreCase])),
                       'i', 'и', [rfReplaceAll, rfIgnoreCase])),
                       'z', 'з', [rfReplaceAll, rfIgnoreCase])),
                       'd', 'д', [rfReplaceAll, rfIgnoreCase])),
                       'g', 'г', [rfReplaceAll, rfIgnoreCase])),
                       'v', 'в', [rfReplaceAll, rfIgnoreCase])),
                       'b', 'б', [rfReplaceAll, rfIgnoreCase])),
                       'a', 'а', [rfReplaceAll, rfIgnoreCase]);

  TranslitEng := UpperCase(StrL);
end;

function f_translit (p_str:string):string;
begin
  if c_is_translit then
  begin
    Result := TranslitRus(p_str);
  end else
  begin
    Result := p_str;
  end;
end;

procedure p_SetADPConn ( p_ADOConnection1: TADOConnection );
var v_ADOQuery : TADOQuery;
begin // установка дополнительных параметров соединения
// select '5ВП.140.231_13_834', SQL_VARIANT_PROPERTY('5ВП.140.231_13_834', 'collation')
  //  p_ADOConnection1.Execute('SET NAMES ''cp1251'' ');
 { v_ADOQuery := TADOQuery.Create(nil);
  try
    v_ADOQuery.Connection:=ADOConnection1;
    v_ADOQuery.SQL.Text:='SET NAMES ''cp1251'' ';
    v_ADOQuery.ExecSQL;
  finally
    v_ADOQuery.Close;
    v_ADOQuery.Free;
  end;  }
end;

procedure setSession (OracleSession1: pointer);
begin
  if UndmMain.OracleSession1=nil then
    UndmMain.OracleSession1 := TOracleSession.Create(nil);
  UndmMain.OracleSession1.ExternalSVC := OracleSession1 ;
  p_ATRIS_ini_params;
end;

procedure oraDisconnect;
begin
  if UndmMain.OracleSession1<>nil then
    UndmMain.OracleSession1.Connected:=False;
  UndmMain.OracleSession1.Free;
end;

procedure mssql_prep_conn;
begin
  ADOConnection1.Provider:='SQLOLEDB.1';
  ADOConnection1.Mode := cmReadWrite;
  ADOConnection1.LoginPrompt:=False;
  ADOConnection1.KeepConnection:=True;
  ADOConnection1.ConnectionTimeout:=0;
  ADOConnection1.ConnectionString:=UndmMain.v_atris_mssql_conn_str;
end;

function f_MSSQLconn : Boolean;
var v_res:Boolean;
begin
  v_res:=False;
  {v_str_conn := 'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;'+
                'User ID=sa;Initial Catalog=ClusterPacsServer;'+
                'Data Source=AFOMIN\MSSQL2012;';     }
  // Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;User ID=sa;Initial Catalog=ClusterPacsServer;Data Source=AFOMIN\MSSQL2012
  // Provider=SQLOLEDB.1;Password=Password2013;Persist Security Info=True;User ID=sa;Initial Catalog=ClusterPacsServer;Data Source=10.1.1.18
  ADOConnection1:= TADOConnection.Create(nil);
  try
    mssql_prep_conn;
    try
      ADOConnection1.Connected:=True;
      p_SetADPConn(ADOConnection1);
      v_res:=ADOConnection1.Connected;
    except
      on e:Exception do
        begin
          MessageDlg('ERROR : '+E.Message, mtError, [mbOK], 0);
          v_res:=False;
        end;
    end;

  finally
    ADOConnection1.Close;
    ADOConnection1.Free;
  end;
  Result:=v_res;
end;

procedure gt_StudiesList ( p_patientid : string );
var v_ADOQuery : TADOQuery;
    i:Integer;
    v_tstr : TStringList;
begin
  ADOConnection1:= TADOConnection.Create(nil);
  try
    mssql_prep_conn;
    ADOConnection1.Connected:=True;
    if ADOConnection1.Connected then
    begin
      p_SetADPConn(ADOConnection1);
      v_ADOQuery := TADOQuery.Create(nil);
      v_tstr := TStringList.Create;
      try
        v_ADOQuery.Connection:=ADOConnection1;
        if trim(p_patientid)<>'' then
        begin
          v_ADOQuery.SQL.Text:='select * from ClusterPacsServer.dbo.dicpat where patid=:p_patientid';
          v_ADOQuery.Parameters.ParamByName('p_patientid').Value:=p_patientid;
        end
        else
          v_ADOQuery.SQL.Text:='select * from ClusterPacsServer.dbo.dicpat ';
        v_ADOQuery.Open;
        v_ADOQuery.First;
        i:=0;
        v_tstr.Append(
            'patnum'+v_fld_razd+
            'adddate'+v_fld_razd+
            'nameprefix'+v_fld_razd+
            'givenname'+v_fld_razd+
            'middlename'+v_fld_razd+
            'familyname'+v_fld_razd+
            'namesuffix'+v_fld_razd+
            'patid'+v_fld_razd+
            'birthdate'+v_fld_razd+
            'birthtime'+v_fld_razd+
            'sex'+v_fld_razd+
            'addresse'
            );
        while not v_ADOQuery.Eof do
        begin
          Inc(i); if i>v_maxrow then Break;
          v_tstr.Append( IntToStr(v_ADOQuery.FieldByName('patnum').AsInteger)+v_fld_razd+
                      DateToStr(v_ADOQuery.FieldByName('adddate').AsDateTime)+v_fld_razd+
                      v_ADOQuery.FieldByName('nameprefix').AsString+v_fld_razd+
                      v_ADOQuery.FieldByName('givenname').AsString+v_fld_razd+
                      v_ADOQuery.FieldByName('middlename').AsString+v_fld_razd+
                      v_ADOQuery.FieldByName('familyname').AsString+v_fld_razd+
                      v_ADOQuery.FieldByName('namesuffix').AsString+v_fld_razd+
                      v_ADOQuery.FieldByName('patid').AsString+v_fld_razd+
                      DateToStr(v_ADOQuery.FieldByName('birthdate').AsDateTime)+v_fld_razd+
                      DateToStr(v_ADOQuery.FieldByName('birthtime').AsDateTime)+v_fld_razd+
                      v_ADOQuery.FieldByName('sex').AsString+v_fld_razd+
                      v_ADOQuery.FieldByName('addresse').AsString );
          v_ADOQuery.Next;
          Application.ProcessMessages;
        end;
        v_tstr.SaveToFile(v_obmen_filename);
      finally
        v_ADOQuery.Close;
        v_ADOQuery.Free;
        v_tstr.Free;
      end;
    end;
  finally
    ADOConnection1.Close;
    ADOConnection1.Free;
  end;
end;

procedure gt_WorkList( p_patientid : string; p_AccessionNumber : string; p_studyinstanceuid : string; p_modatity : string; p_stationaetitle : string );
var v_ADOQuery : TADOQuery;
    i:Integer;
    v_tstr : TStringList;
    v_str1 : AnsiString;
begin
  ADOConnection1:= TADOConnection.Create(nil);
  try
    mssql_prep_conn;
    ADOConnection1.Connected:=True;
    if ADOConnection1.Connected then
    begin
      p_SetADPConn(ADOConnection1);
      v_ADOQuery := TADOQuery.Create(nil);
      v_tstr := TStringList.Create;
      try
        v_ADOQuery.Connection:=ADOConnection1;
        v_str1:='select * from ClusterPacsServer.dbo.worklist where 1=1 ';

        if trim(p_patientid)<>'' then
          v_str1:=v_str1+' and patid=:p_patientid';
        if trim(p_AccessionNumber)<>'' then
          v_str1:=v_str1+' and accessionnumber=:p_AccessionNumber';
        if trim(p_studyinstanceuid)<>'' then
          v_str1:=v_str1+' and studyinstanceuid=:p_studyinstanceuid';
        if trim(p_modatity)<>'' then
          v_str1:=v_str1+' and modatity=:p_modatity';
        if trim(p_stationaetitle)<>'' then
          v_str1:=v_str1+' and sstationaetitle=:p_stationaetitle';
        v_ADOQuery.SQL.Text:=v_str1;
        if trim(p_patientid)<>'' then
          v_ADOQuery.Parameters.ParamByName('p_patientid').Value:=p_patientid;
        if trim(p_AccessionNumber)<>'' then
          v_ADOQuery.Parameters.ParamByName('p_AccessionNumber').Value:=p_AccessionNumber;
        if trim(p_studyinstanceuid)<>'' then
          v_ADOQuery.Parameters.ParamByName('p_studyinstanceuid').Value:=p_studyinstanceuid;
        if trim(p_modatity)<>'' then
          v_ADOQuery.Parameters.ParamByName('p_modatity').Value:=p_modatity;
        if trim(p_stationaetitle)<>'' then
          v_ADOQuery.Parameters.ParamByName('p_stationaetitle').Value:=p_stationaetitle;
        v_ADOQuery.Open;
        v_ADOQuery.First;
        i:=0;
        v_tstr.Append(  'worknum'+v_fld_razd+
                        'Status'+v_fld_razd+
                        'patname'+v_fld_razd+
                        'patid'+v_fld_razd+
                        'patotherid'+v_fld_razd+
                        'patbirthdate'+v_fld_razd+
                        'patbirthtime'+v_fld_razd+
                        'patsex'+v_fld_razd+
                        'pataddresse'+v_fld_razd+
                        'patmedicalalerts'+v_fld_razd+
                        'patethnicgroup'+v_fld_razd+
                        'patcontrastallergies'+v_fld_razd+
                        'patpregnancystatus'+v_fld_razd+
                        'pathistory'+v_fld_razd+
                        'patcomments'+v_fld_razd+
                        'specialneeds'+v_fld_razd+
                        'patstate'+v_fld_razd+
                        'patconfidentialconstraint'+v_fld_razd+
                        'accessionnumber'+v_fld_razd+
                        'referringpysician'+v_fld_razd+
                        'requestingservice'+v_fld_razd+
                        'requestingphysician'+v_fld_razd+
                        'sstationaetitle'+v_fld_razd+
                        'spstartdate'+v_fld_razd+
                        'spstarttime'+v_fld_razd+
                        'modatity'+v_fld_razd+
                        'sperformingphysician'+v_fld_razd+
                        'spstepdescription'+v_fld_razd+
                        'spstepid'+v_fld_razd+
                        'sstationname'+v_fld_razd+
                        'spsteplocation'+v_fld_razd+
                        'premedication'+v_fld_razd+
                        'requestedcontrastagent'+v_fld_razd+
                        'requestedprocedureid'+v_fld_razd+
                        'proceduredescription'+v_fld_razd+
                        'studyinstanceuid'+v_fld_razd+
                        'requestedprocedurepriority'+v_fld_razd+
                        'patienttransportarrangements'+v_fld_razd+
                        'readingphysician'+v_fld_razd+
                        'currentlocation'+v_fld_razd+
                        'resultsphysician'+v_fld_razd+
                        'procedurecomments'+v_fld_razd+
                        'imagingcomments'+v_fld_razd+
                        'admissionid'+v_fld_razd+
                        'admittingdiagnosisdescription'+v_fld_razd+
                        'MSH12'+v_fld_razd+
                        'SENT'
                     );
        while not v_ADOQuery.Eof do
        begin
          Inc(i); if i>v_maxrow then Break;
          v_tstr.Append(
                        IntToStr(v_ADOQuery.FieldByName('worknum').AsInteger)+v_fld_razd+
                        IntToStr(v_ADOQuery.FieldByName('Status').AsInteger)+v_fld_razd+
                        v_ADOQuery.FieldByName('patname').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('patid').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('patotherid').AsString+v_fld_razd+
                        DateToStr(v_ADOQuery.FieldByName('patbirthdate').AsDateTime)+v_fld_razd+
                        DateToStr(v_ADOQuery.FieldByName('patbirthtime').AsDateTime)+v_fld_razd+
                        v_ADOQuery.FieldByName('patsex').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('pataddresse').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('patmedicalalerts').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('patethnicgroup').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('patcontrastallergies').AsString+v_fld_razd+
                        IntToStr(v_ADOQuery.FieldByName('patpregnancystatus').AsInteger)+v_fld_razd+
                        v_ADOQuery.FieldByName('pathistory').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('patcomments').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('specialneeds').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('patstate').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('patconfidentialconstraint').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('accessionnumber').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('referringpysician').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('requestingservice').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('requestingphysician').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('sstationaetitle').AsString+v_fld_razd+
                        DateToStr(v_ADOQuery.FieldByName('spstartdate').AsDateTime)+v_fld_razd+
                        DateToStr(v_ADOQuery.FieldByName('spstarttime').AsDateTime)+v_fld_razd+
                        v_ADOQuery.FieldByName('modatity').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('sperformingphysician').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('spstepdescription').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('spstepid').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('sstationname').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('spsteplocation').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('premedication').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('requestedcontrastagent').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('requestedprocedureid').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('proceduredescription').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('studyinstanceuid').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('requestedprocedurepriority').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('patienttransportarrangements').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('readingphysician').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('currentlocation').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('resultsphysician').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('procedurecomments').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('imagingcomments').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('admissionid').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('admittingdiagnosisdescription').AsString+v_fld_razd+
                        v_ADOQuery.FieldByName('MSH12').AsString+v_fld_razd+
                        IntToStr(v_ADOQuery.FieldByName('SENT').AsInteger)
                       );
          v_ADOQuery.Next;
          Application.ProcessMessages;
        end;
        v_tstr.SaveToFile(v_obmen_filename);
      finally
        v_ADOQuery.Close;
        v_ADOQuery.Free;
        v_tstr.Free;
      end;
    end;
  finally
    ADOConnection1.Close;
    ADOConnection1.Free;
  end;
end;

procedure gt_MnStudiesList ( p_patientNum : string; p_AccessionNumber : string  );
var v_ADOQuery : TADOQuery;
    i:Integer;
    v_tstr : TStringList;
    v_str1 : AnsiString;
begin
  ADOConnection1:= TADOConnection.Create(nil);
  try
    mssql_prep_conn;
    ADOConnection1.Connected:=True;
    if ADOConnection1.Connected then
    begin
      p_SetADPConn(ADOConnection1);
      v_ADOQuery := TADOQuery.Create(nil);
      v_tstr := TStringList.Create;
      try
        v_ADOQuery.Connection:=ADOConnection1;
        v_str1:='select * from ClusterPacsServer.dbo.dicstud where 1=1 ';
        if trim(p_patientNum)<>'' then
          v_str1:=v_str1+' and patnum=:p_patientNum';
        if trim(p_AccessionNumber)<>'' then
          v_str1:=v_str1+' and accessionnum=:p_AccessionNumber';
        v_ADOQuery.SQL.Text:=v_str1;
        if trim(p_patientNum)<>'' then
          v_ADOQuery.Parameters.ParamByName('p_patientNum').Value:=p_patientNum;
        if trim(p_AccessionNumber)<>'' then
          v_ADOQuery.Parameters.ParamByName('p_AccessionNumber').Value:=p_AccessionNumber;
        v_ADOQuery.Open;
        v_ADOQuery.First;
        i:=0;
        v_tstr.Append('studnum'+v_fld_razd+
                      'patnum'+v_fld_razd+
                      'adddate'+v_fld_razd+
                      'accessionnum'+v_fld_razd+
                      'description'+v_fld_razd+
                      'referringphysician'+v_fld_razd+
                      'studytime'+v_fld_razd+
                      'studydate'+v_fld_razd+
                      'stationname'+v_fld_razd+
                      'studyid'+v_fld_razd+
                      'stuinsuid'+v_fld_razd+
                      'patage'+v_fld_razd+
                      'patsize'+v_fld_razd+
                      'patweight'+v_fld_razd+
                      'dataid'+v_fld_razd+
                      'timeoutstatus'
            );
        while not v_ADOQuery.Eof do
        begin
          Inc(i); if i>v_maxrow then Break;
          v_tstr.Append(  IntToStr(v_ADOQuery.FieldByName('studnum').AsInteger)+v_fld_razd+
                          IntToStr(v_ADOQuery.FieldByName('patnum').AsInteger)+v_fld_razd+
                          DateToStr(v_ADOQuery.FieldByName('adddate').AsDateTime)+v_fld_razd+
                          v_ADOQuery.FieldByName('accessionnum').AsString+v_fld_razd+
                          v_ADOQuery.FieldByName('description').AsString+v_fld_razd+
                          v_ADOQuery.FieldByName('referringphysician').AsString+v_fld_razd+
                          DateToStr(v_ADOQuery.FieldByName('studytime').AsDateTime)+v_fld_razd+
                          DateToStr(v_ADOQuery.FieldByName('studydate').AsDateTime)+v_fld_razd+
                          v_ADOQuery.FieldByName('stationname').AsString+v_fld_razd+
                          v_ADOQuery.FieldByName('studyid').AsString+v_fld_razd+
                          v_ADOQuery.FieldByName('stuinsuid').AsString+v_fld_razd+
                          v_ADOQuery.FieldByName('patage').AsString+v_fld_razd+
                          v_ADOQuery.FieldByName('patsize').AsString+v_fld_razd+
                          v_ADOQuery.FieldByName('patweight').AsString+v_fld_razd+
                          IntToStr(v_ADOQuery.FieldByName('dataid').AsInteger)+v_fld_razd+
                          IntToStr(v_ADOQuery.FieldByName('timeoutstatus').AsInteger)
                       );
          v_ADOQuery.Next;
          Application.ProcessMessages;
        end;
        v_tstr.SaveToFile(v_obmen_filename);
      finally
        v_ADOQuery.Close;
        v_ADOQuery.Free;
        v_tstr.Free;
      end;
    end;
  finally
    ADOConnection1.Close;
    ADOConnection1.Free;
  end;
end;

// PKG_SMINI.READSTRING
function Readstring(const Section: string; const Ident: string;
  const Pdefault: string=''): string;
var OCPQuery : TOracleQuery;
begin
    OCPQuery := TOracleQuery.Create(nil);
    with OCPQuery do
    try
      Session:=OracleSession1;
      DeclareVariable('function_result', otString);
      DeclareVariable('SECTION', otString);
      SetVariable('SECTION', Section);
      DeclareVariable('IDENT', otString);
      SetVariable('IDENT', Ident);
      DeclareVariable('PDEFAULT', otString);
      SetVariable('PDEFAULT', Pdefault);
      SQL.Add('begin');
      SQL.Add('  :function_result := "ASU"."PKG_SMINI"."READSTRING"(');
      SQL.Add('    SECTION => :SECTION,');
      SQL.Add('    IDENT => :IDENT,');
      SQL.Add('    PDEFAULT => :PDEFAULT);');
      SQL.Add('end;');
      Execute;
      Result := VarToStr(GetVariable('function_result'));
    finally
      Free;
    end;
end;

procedure p_ATRIS_ini_params;
var v_str : string;
begin
  v_atris_webpage        := Readstring( C_PROGNAME, 'atris_webpage' );
  v_atris_mssql_conn_str := Readstring( C_PROGNAME, 'atris_mssql_conn_str' );
  v_atris_webuser        := Readstring( C_PROGNAME, 'atris_webuser' );
  v_atris_webpassword    := Readstring( C_PROGNAME, 'atris_webpassword' );
  v_atris_use            := Readstring( C_PROGNAME, 'atris_use' );
  try
    v_str := Trim( Readstring( C_PROGNAME, 'atris_web_timeout' ) );
    if v_str='' then
      v_atris_web_timeout  := c_wait_time
    else
      v_atris_web_timeout  := StrToInt( v_str );
  except
    v_atris_web_timeout  := c_wait_time;
  end;
end;

procedure p_MndelWorklist(p_AccessionNumber : string;p_studyinstanceuid : string);
var v_ADOQuery : TADOQuery;
    i:Integer;
    v_tstr : TStringList;
    v_str1 : AnsiString;
begin
  ADOConnection1:= TADOConnection.Create(nil);
  try
    mssql_prep_conn;
    ADOConnection1.Connected:=True;
    if ADOConnection1.Connected then
    begin
      p_SetADPConn(ADOConnection1);
      v_ADOQuery := TADOQuery.Create(nil);
      v_tstr := TStringList.Create;
      try
        v_ADOQuery.Connection:=ADOConnection1;
        v_str1:='delete from ClusterPacsServer.dbo.worklist where 1=1 ';
        if trim(p_AccessionNumber)<>'' then
          v_str1:=v_str1+' and accessionnumber=:p_AccessionNumber ';
        if trim(p_studyinstanceuid)<>'' then
          v_str1:=v_str1+' and studyinstanceuid=:p_studyinstanceuid ';
        v_ADOQuery.SQL.Text:=v_str1;
        if trim(p_AccessionNumber)<>'' then
          v_ADOQuery.Parameters.ParamByName('p_AccessionNumber').Value:=p_AccessionNumber;
        if trim(p_studyinstanceuid)<>'' then
          v_ADOQuery.Parameters.ParamByName('p_studyinstanceuid').Value:=p_studyinstanceuid;
        v_ADOQuery.ExecSQL;
      finally
        v_ADOQuery.Close;
        v_ADOQuery.Free;
        v_tstr.Free;
      end;
    end;
  finally
    ADOConnection1.Close;
    ADOConnection1.Free;
  end;
end;

function chk_AN_inr ( p_atris_mssql_conn_str : string;
                      p_AccessionNumber : string
                    ):Boolean;
var v_ADOQuery : TADOQuery;
    i:Integer; v_is_ok:Boolean;
begin
  Result:=False;
  ADOConnection1:= TADOConnection.Create(nil);
  try
    mssql_prep_conn;
    ADOConnection1.Connected:=True;
    if ADOConnection1.Connected then
    begin
      p_SetADPConn(ADOConnection1);
      v_ADOQuery := TADOQuery.Create(nil);
      try
        v_ADOQuery.Connection:=ADOConnection1;

        v_ADOQuery.SQL.Text := 'select 1 as f1 from ClusterPacsServer.dbo.worklist where accessionnumber=:p_accessionnumber'+
                               ' union all '+
                               'select 1 as f1 from ClusterPacsServer.dbo.dicstud where accessionnum=:p_accessionnumber1' ;
        v_ADOQuery.Parameters.ParamByName('p_accessionnumber').Value := p_AccessionNumber;    // AccessionNumber
        v_ADOQuery.Parameters.ParamByName('p_accessionnumber1').Value := p_AccessionNumber;    // AccessionNumber
        v_ADOQuery.Open;
        Result := v_ADOQuery.eof;
      finally
        v_ADOQuery.Close;
        v_ADOQuery.Free;
      end;
    end;
  finally
    ADOConnection1.Close;
    ADOConnection1.Free;
  end;
end;

// генерация уникального TransactionUID для DICOM запросов
function GenStudyInstanceUID (p_an:string) : String;
var v_res : ansistring; v_s, v_r, v_p : string; i:Integer;
begin
  v_s:=Copy(p_an,0,pos('/',p_an)-1);
  v_r:='';
  for I := 0 to Length(v_s) - 1 do
  begin
    v_p:=Copy(v_s,i,1);
    if ( (v_p='0') or
         (v_p='1') or
         (v_p='2') or
         (v_p='3') or
         (v_p='4') or
         (v_p='5') or
         (v_p='6') or
         (v_p='7') or
         (v_p='8') or
         (v_p='9') )
    then
      v_r:=v_r+Copy(v_s,i,1);
  end;
  v_res:=DCM_Attributes.DicomImplementationClassUID+'.'+v_r;
  
  Result:=v_res;
end;

procedure p_MNINSWorklist   ( p_atris_mssql_conn_str : string;
                              p_PatientIDINS : string;      // Номер Карты -> PatientID
                              p_patPrefix : string;         // patPrefix (не исп)
                              p_PatientFamily : string;     // Фамилия
                              p_PatientNAME : string;       // Имя
                              p_PatientSurname : string;    // Отчество
                              p_BirthDate : TDateTime;         // Дата рождения -> PatientBirthDate
                              p_Sex : string;               // Пол
                              p_AETitle : string;           // AETitle аппарата
                              p_Room : string;              // Комната (не исп)
                              p_DiagnMKB10 : string;        // Код напр. диагноза по МКБ-10 -> не исп
                              p_Podrazdelenie : string;     // Направившее подразделение
                              p_VrachFam : string;          // Фамилия направившего врача
                              p_VrachIm : string;           // Имя направившего врача
                              p_VrachOtch : string;         // Отчество направившего врача
                              p_Modality : string;          // Modality
                              p_BodyPart : string;          // Название исследуемой части тела
                              p_StudyName : string;         // Название исследования
                              p_FASTEST : string;           // Экстренный (1/0)-> не исп (integer)
                              p_DateTimeNapravl : TDateTime;       // Дата / Время направления
                              p_Polikl_Statsionar : string; // 0 - Поликлиника, 1 - Стационар
                              p_AccessionNumber : string;    // AccessionNumber
                              p_studyinstanceuid : string  // studyinstanceuid
                           );
var v_ADOQuery : TADOQuery;
    i:Integer; v_is_ok:Boolean;
begin
  v_is_ok:=chk_AN_inr(p_atris_mssql_conn_str,p_AccessionNumber);
  if not v_is_ok then
    MessageDlg('Запись с номером исследования '''+p_AccessionNumber+''' существует', mtError, [mbOK], 0)
  else
  begin
    ADOConnection1:= TADOConnection.Create(nil);
    try
      mssql_prep_conn;
      ADOConnection1.Connected:=True;
      if ADOConnection1.Connected then
      begin
        p_SetADPConn(ADOConnection1);
        v_ADOQuery := TADOQuery.Create(nil);
        try
          v_ADOQuery.Connection:=ADOConnection1;

          v_ADOQuery.SQL.Text := 'insert into ClusterPacsServer.dbo.worklist ( '+
             ' Status, patname, patid, patotherid, patbirthdate, patbirthtime, patsex, '+
             ' pataddresse, patmedicalalerts, patethnicgroup, patcontrastallergies, '+
             ' patpregnancystatus, pathistory, patcomments, specialneeds, '+
             ' patstate, patconfidentialconstraint, accessionnumber, referringpysician, '+
             ' requestingservice, requestingphysician, sstationaetitle, spstartdate, '+
             ' spstarttime, modatity, sperformingphysician, spstepdescription, '+
             ' spstepid, sstationname, spsteplocation, premedication, '+
             ' requestedcontrastagent, requestedprocedureid, proceduredescription, studyinstanceuid, '+
             ' requestedprocedurepriority, patienttransportarrangements, '+
             ' readingphysician, currentlocation, resultsphysician, procedurecomments, '+
             ' imagingcomments, admissionid, admittingdiagnosisdescription '+
             ' ) values ( '+
             ' :p_Status, :p_patname, :p_patid, :p_patotherid, :p_patbirthdate, :p_patbirthtime, :p_patsex, '+  //  :p_worknum,
             ' :p_pataddresse, :p_patmedicalalerts, :p_patethnicgroup, :p_patcontrastallergies, '+
             ' :p_patpregnancystatus, :p_pathistory, :p_patcomments, :p_specialneeds, '+
             ' :p_patstate, :p_patconfidentialconstraint, :p_accessionnumber, :p_referringpysician, '+
             ' :p_requestingservice, :p_requestingphysician, :p_sstationaetitle, :p_spstartdate, '+
             ' :p_spstarttime, :p_modatity, :p_sperformingphysician, :p_spstepdescription, '+
             ' :p_spstepid, :p_sstationname, :p_spsteplocation, :p_premedication, '+
             ' :p_requestedcontrastagent, :p_requestedprocedureid, :p_proceduredescription, :p_studyinstanceuid, '+
             ' :p_requestedprocedurepriority, :p_patienttransportarrangements, '+
             ' :p_readingphysician, :p_currentlocation, :p_resultsphysician, :p_procedurecomments, '+
             ' :p_imagingcomments, :p_admissionid, :p_admittingdiagnosisdescription ) ';
             {
               p_Polikl_Statsionar : string; // 0 - Поликлиника, 1 - Стационар
               p_DiagnMKB10 : string;        // Код напр. диагноза по МКБ-10 -> не исп
               p_Room : string;              // Комната (не исп)
               p_Podrazdelenie : string;     // Направившее подразделение
               p_BodyPart : string;          // Название исследуемой части тела
               p_FASTEST : string;           // Экстренный (1/0)-> не исп (integer)
             }
           v_ADOQuery.Parameters.ParamByName('p_Status').Value:= 0;
           v_ADOQuery.Parameters.ParamByName('p_patname').Value:= f_translit(p_PatientFamily+'^'+p_PatientNAME+'^'+p_PatientSurname); // Фамилия  // Имя // Отчество
           v_ADOQuery.Parameters.ParamByName('p_patid').Value:= p_PatientIDINS;   // Номер Карты -> PatientID
           v_ADOQuery.Parameters.ParamByName('p_patotherid').Value:= '';
           v_ADOQuery.Parameters.ParamByName('p_patbirthdate').Value:= Dateof(p_BirthDate);   // datetime   // Дата рождения -> PatientBirthDate
           v_ADOQuery.Parameters.ParamByName('p_patbirthtime').Value:= p_BirthDate;   // datetime
           v_ADOQuery.Parameters.ParamByName('p_patsex').Value:=  p_Sex;      // Пол
           v_ADOQuery.Parameters.ParamByName('p_pataddresse').Value:= '';
           v_ADOQuery.Parameters.ParamByName('p_patmedicalalerts').Value:= '';
           v_ADOQuery.Parameters.ParamByName('p_patethnicgroup').Value:= '';
           v_ADOQuery.Parameters.ParamByName('p_patcontrastallergies').Value:= '';
           v_ADOQuery.Parameters.ParamByName('p_patpregnancystatus').Value:= 0;     // int
           v_ADOQuery.Parameters.ParamByName('p_pathistory').Value:= '';
           v_ADOQuery.Parameters.ParamByName('p_patcomments').Value:= '';  // комменты к пацику
           v_ADOQuery.Parameters.ParamByName('p_specialneeds').Value:= '';
           v_ADOQuery.Parameters.ParamByName('p_patstate').Value:= '';
           v_ADOQuery.Parameters.ParamByName('p_patconfidentialconstraint').Value:= '';
           v_ADOQuery.Parameters.ParamByName('p_accessionnumber').Value:=   p_AccessionNumber;    // AccessionNumber
           v_ADOQuery.Parameters.ParamByName('p_referringpysician').Value:= '';
           v_ADOQuery.Parameters.ParamByName('p_requestingservice').Value:= '';
           v_ADOQuery.Parameters.ParamByName('p_requestingphysician').Value:= '';
           v_ADOQuery.Parameters.ParamByName('p_sstationaetitle').Value:= p_AETitle;           // AETitle аппарата
           v_ADOQuery.Parameters.ParamByName('p_spstartdate').Value:= Dateof(p_DateTimeNapravl);       // datetime  // Дата / Время направления
           v_ADOQuery.Parameters.ParamByName('p_spstarttime').Value:= p_DateTimeNapravl;       // datetime   // Дата / Время направления
           v_ADOQuery.Parameters.ParamByName('p_modatity').Value:= p_Modality;          // Modality
           v_ADOQuery.Parameters.ParamByName('p_sperformingphysician').Value:= '';
           v_ADOQuery.Parameters.ParamByName('p_spstepdescription').Value:=   '';
           v_ADOQuery.Parameters.ParamByName('p_spstepid').Value:= '';
           v_ADOQuery.Parameters.ParamByName('p_sstationname').Value:=  ''; // наименование станции
           v_ADOQuery.Parameters.ParamByName('p_spsteplocation').Value:=  '';
           v_ADOQuery.Parameters.ParamByName('p_premedication').Value:=  '';
           v_ADOQuery.Parameters.ParamByName('p_requestedcontrastagent').Value:= '';
           v_ADOQuery.Parameters.ParamByName('p_requestedprocedureid').Value:= '';
           v_ADOQuery.Parameters.ParamByName('p_proceduredescription').Value:=  '';
           if p_studyinstanceuid='' then
           begin
             v_ADOQuery.Parameters.ParamByName('p_studyinstanceuid').Value:= GenStudyInstanceUID(p_AccessionNumber);
           end else
           begin
             v_ADOQuery.Parameters.ParamByName('p_studyinstanceuid').Value:= p_studyinstanceuid;
           end;
           v_ADOQuery.Parameters.ParamByName('p_requestedprocedurepriority').Value:= '';
           v_ADOQuery.Parameters.ParamByName('p_patienttransportarrangements').Value:= '';
           v_ADOQuery.Parameters.ParamByName('p_readingphysician').Value:= '';
           v_ADOQuery.Parameters.ParamByName('p_currentlocation').Value:= '';
           v_ADOQuery.Parameters.ParamByName('p_resultsphysician').Value:= '';
           v_ADOQuery.Parameters.ParamByName('p_procedurecomments').Value:= f_translit(p_StudyName);         // Название исследования
           v_ADOQuery.Parameters.ParamByName('p_imagingcomments').Value:= '';
           v_ADOQuery.Parameters.ParamByName('p_admissionid').Value:= '';
           v_ADOQuery.Parameters.ParamByName('p_admittingdiagnosisdescription').Value:= '';

           v_ADOQuery.ExecSQL;

           MessageDlg('Данные исследования '''+p_AccessionNumber+''' отправлены на WORKLIST', mtInformation, [mbOK], 0);

        finally
          v_ADOQuery.Close;
          v_ADOQuery.Free;
        end;
      end;
    finally
      ADOConnection1.Close;
      ADOConnection1.Free;
    end;
  end;
end;

function f_getstudyUID(p_AccessionNumber:string):string;
var v_ADOQuery : TADOQuery;
    i:Integer;
    v_tstr : TStringList;
    v_str1 : AnsiString;
begin
  ADOConnection1:= TADOConnection.Create(nil);
  try
    mssql_prep_conn;
    ADOConnection1.Connected:=True;
    if ADOConnection1.Connected then
    begin
      p_SetADPConn(ADOConnection1);
      v_ADOQuery := TADOQuery.Create(nil);
      v_tstr := TStringList.Create;
      try
        v_ADOQuery.Connection:=ADOConnection1;
        v_str1:='select stuinsuid from ClusterPacsServer.dbo.dicstud where accessionnum=:p_AccessionNumber ';
        v_ADOQuery.SQL.Text:=v_str1;
        v_ADOQuery.Parameters.ParamByName('p_AccessionNumber').Value:=p_AccessionNumber;
        v_ADOQuery.Open;
        v_ADOQuery.First;
//ShowMessage('prepare');
        if not v_ADOQuery.Eof then
        begin
          Result := v_ADOQuery.FieldByName('stuinsuid').AsString;
//ShowMessage('found '+Result);
        end else
          Result:='';  
      finally
        v_ADOQuery.Close;
        v_ADOQuery.Free;
        v_tstr.Free;
      end;
    end;
  finally
    ADOConnection1.Close;
    ADOConnection1.Free;
  end;
end;

end.
