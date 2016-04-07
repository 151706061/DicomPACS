unit DICOM_charset;

{ Unit предназначен для работы с различными кодировками строк dcm-файла
  содержит функции преобразования строк для приемки снимков паксом и
  отображения данных атрибутов во viewer
}

interface

Uses SysUtils, Classes, DCM_Attributes, DCM_Dict, Dialogs, Windows, DCM_log;

// тип массивов для приемки/пересылки изображений
// сами массивы привязаны к потокам - AClientThread и TForwardThread
type t_snimki_rec = record
  f_CallingTitle   : string;
  f_TransactionUID : string;
  f_StudyUID       : string;
  f_patient_info   : ansistring;
  f_amm_received   : integer;
  f_text           : ansistring;
  f_SessionID      : integer;
  f_instanceUID    : string;
end;

type t_snimki1_rec = record
  f_StudyUID       : string;
  f_SessionID      : integer;
  f_instanceUID    : string;
  f_filename       : AnsiString;
  f_Modality       : string;
  f_CallingTitle   : string;
  f_STUDYDATE      : TDateTime;
  f_p_pid          : string;
  f_patientname    : string;
  f_ename          : string;
  f_ACCESSIONNUMBER: string;
  // поля для записи инфы об ошибках пересылки
  f_comm           : string;
  f_transfersyntax : Integer;
  f_calledtitle    : string;
end;

// для работы с разными кодовыми страницами
type
  tcodepagearray = array[$80..$ff] of char;
{
  cp1251 - Кодовая страница windows
  iso8859-5 - iso-страница
  koi8-u - Кодовая страница используемая практически во всех версиях в unix
  mac-u - Страница используемая в macos
  ruscii - или старая добрая codepage 866 известная всем жившим в период dos.
}
// таблицы перекодировки
const
  ruscii:tcodepagearray =
    ('А','Б','В','Г','Д','Е','Ж','З','И','Й','К','Л','М','Н','О','П',
    'Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я',
    'а','б','в','г','д','е','ж','з','и','й','к','л','м','н','о','п',
    #176,#177,#178,#179,#180,#181,#182,#183,#184,#185,#186,#187,#188,#189,#190,#191,
    #192,#193,#194,#195,#196,#197,#198,#199,#200,#201,#202,#203,#204,#205,#206,#207,
    #208,#209,#210,#211,#212,#213,#214,#215,#216,#217,#218,#219,#220,#221,#222,#223,
    'р','с','т','у','ф','х','ц','ч','ш','щ','ъ','ы','ь','э','ю','я',
    'Ё','ё','Г','г','Є','є','І','і','Ї','ї',#250,#251,#252,#253,#254,#255);

  koi8u:tcodepagearray =
    (#128,#129,#130,#131,#132,#133,#134,#135,#136,#137,#138,#139,#140,#141,#142,#143,
    #144,#145,#146,#147,#148,#149,#150,#151,#152,#153,#154,#155,#156,#157,#158,#159,
    #160,#161,#162,'ё' ,'є' ,#165,'і' ,'ї' ,#168,#169,#170,#171,#172,#173,#174,#175,
    #176,#177,#178,'Ё' ,'Є' ,#181,'І' ,'Ї' ,#184,#185,#186,#187,#188,#189,#190,#191,
    'ю' ,'а' ,'б' ,'ц' ,'д' ,'е' ,'ф' ,'г' ,'х' ,'и' ,'й' ,'к' ,'л' ,'м' ,'н' ,'о' ,
    'п' ,'я' ,'р' ,'с' ,'т' ,'у' ,'ж' ,'в' ,'ь' ,'ы' ,'з' ,'ш' ,'э' ,'щ' ,'ч' ,'ъ' ,
    'Ю' ,'А' ,'Б' ,'Ц' ,'Д' ,'Е' ,'Ф' ,'Г' ,'Х' ,'И' ,'Й' ,'К' ,'Л' ,'М' ,'Н' ,'О' ,
    'П' ,'Я' ,'Р' ,'С' ,'Т' ,'У' ,'Ж' ,'В' ,'Ь' ,'Ы' ,'З' ,'Ш' ,'Э' ,'Щ' ,'Ч' ,'Ъ' );

  cp1251:tcodepagearray =
    (#128,#129,#130,#131,#132,#133,#134,#135,#136,#137,#138,#139,#140,#141,#142,#143,
    #144,#145,#146,#147,#148,#149,#150,#151,#152,#153,#154,#155,#156,#157,#158,#159,
    #160,#161,#162,#163,#164,#165,#166,#167,#168,#169,#170,#171,#172,#173,#174,#175,
    #176,#177,#178,#179,#180,#181,#182,#183,#184,#185,#186,#187,#188,#189,#190,#191,
    #192,#193,#194,#195,#196,#197,#198,#199,#200,#201,#202,#203,#204,#205,#206,#207,
    #208,#209,#210,#211,#212,#213,#214,#215,#216,#217,#218,#219,#220,#221,#222,#223,
    #224,#225,#226,#227,#228,#229,#230,#231,#232,#233,#234,#235,#236,#237,#238,#239,
    #240,#241,#242,#243,#244,#245,#246,#247,#248,#249,#250,#251,#252,#253,#254,#255);

  iso88595:tcodepagearray =
    (#128,#129,#130,#131,#132,#133,#134,#135,#136,#137,#138,#139,#140,#141,#142,#143,
    #144,#145,#146,#147,#148,#149,#150,#151,#152,#153,#154,#155,#156,#157,#158,#159,
    #160,'Ё' ,#162,#163,'Є' ,#165,'І' ,'Ї' ,#168,#169,#170,#171,#172,#173,#174,#175,
    'А' ,'Б' ,'В' ,'Г' ,'Д' ,'Е' ,'Ж' ,'З' ,'И' ,'Й' ,'К' ,'Л' ,'М' ,'Н' ,'О' ,'П' ,
    'Р' ,'С' ,'Т' ,'У' ,'Ф' ,'Х' ,'Ц' ,'Ч' ,'Ш' ,'Щ' ,'Ъ' ,'Ы' ,'Ь' ,'Э' ,'Ю' ,'Я' ,
    'а' ,'б' ,'в' ,'г' ,'д' ,'е' ,'ж' ,'з' ,'и' ,'й' ,'к' ,'л' ,'м' ,'н' ,'о' ,'п' ,
    'р' ,'с' ,'т' ,'у' ,'ф' ,'х' ,'ц' ,'ч' ,'ш' ,'щ' ,'ъ' ,'ы' ,'ь' ,'э' ,'ю' ,'я' ,
    #240,'ё' ,#242,#243,'є' ,#245,'і' ,'ї' ,#248,#249,#250,#251,#252,#253,#254,#255);

  c_free_space = 5; // свободное место на диске - если меньше - не пишем логи
  c_log_records = 10000;
  c_max_del_records = 1000000;

var v_day_clr_log : TDateTime;

// функция для вычисления размера свободного места на диске в Гигабайтах    
//function GetFreeDiskSize: Int64;

// процедура для тестирования - показывает содержимое тегов DICOM в списке атрибутов
procedure dicom_tag_show ( p_DicomAttributes : TDicomAttributes );

// функция перекодировки
// p_str_in - строка текста, которую следует перекодировать
// p_codetable - кодировка
//  0 - ruscii
//  1 - koi8u
//  2 - cp1251
//  3 - iso88595
// tcodepagearray - массив перекодировки символов из соответствующей кодировки в cp1251
function set_codepage_str ( p_str_in : string; p_codetable : integer; p_is_rswp : Boolean = False ) : string ;

function gt_charset_value ( p_dicomattributes : TDicomAttributes; p_val:string; p_is_rswp : Boolean = False ) : string;

// транслитерация из латыни в кириллицу
function TranslitEng(s: string): string;

function TranslitRus(s: string): string;

procedure Flds_to_charset (     p_dicomattributes : TDicomAttributes;
                            var P_ENAME_RUS : string;
                            var P_ENAME     : string;
                            var p_VDESC     : string
                          );

procedure Lg_ev  ( const p_strs : ansistring;
                   const p_filename : ansistring = '';
                   const p_is_delim : Boolean = False );

procedure MnLg_ev ( const p_strs : ansistring;
                    const p_filename : ansistring = '';
                    const p_is_delim : Boolean = False;
                    const p_is_DT : boolean = True );

// определение типа файла графики по заголовку
function PhysicalResolveFileType(AStream: TStream): Integer;
function CHK_file_type_graph (p_filename:ansistring):integer;

// проверка не занят ли файл 
function MyFileStatus(const Origin: string): boolean;

// процедура удаления временных файлов
procedure clr_temp_files;

var
  v_TempFileList : TStringList;
  v_is_chk_files : Boolean;

implementation

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

  TranslitRus := AnsiUpperCase(StrL);
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

  TranslitEng := AnsiUpperCase(StrL);
end;

// функция перекодировки
// p_str_in - строка текста, которую следует перекодировать
// p_codetable - кодировка
//  0 - ruscii
//  1 - koi8u
//  2 - cp1251
//  3 - iso88595
// tcodepagearray - массив перекодировки символов из соответствующей кодировки в cp1251
function set_codepage_str ( p_str_in : string; p_codetable : integer; p_is_rswp : Boolean = False ) : string ;
var // sl:tstringlist;
    i:byte;
    j:integer;
    s:string;
    a:tcodepagearray;
begin
  s:=p_str_in;
  case p_codetable of
  0: a:=ruscii;
  1: a:=koi8u;
  2: a:=cp1251;
  3: a:=iso88595;
  else
    Result := s ;
  end;
  if (p_codetable in [0,1,2,3]) then
    for j:=1 to length(s) do
      if byte(s[j])>=low(a) then
        for i:=low(a) to high(a) do
        begin
          if byte(s[j])=i then
          begin
            s[j]:=a[i];
            break;
          end;
        end;
  if p_is_rswp then
    Result := StringReplace( s, '^',' ',[rfReplaceAll, rfIgnoreCase])
  else
    Result := s;
end;

{
"asmo-708",708,
"dos-720",720,
"iso-8859-6",28596,
"x-mac-arabic",10004,
"windows-1256",1256,
"ibm775",775,
"iso-8859-4",28594,
"windows-1257",1257,
"ibm852",852,
"iso-8859-2",28592,
"x-mac-ce",10029,
"windows-1250",1250,
"euc-cn",51936,
"gb2312",936,
"hz-gb-2312",52936,
"x-mac-chinesesimp",10008,
"big5",950,
"x-chinese-cns",20000,
"x-chinese-eten",20002,
"x-mac-chinesetrad",10002,
"cp866",866,
"iso-8859-5",28595,
"koi8-r",20866,
"koi8-u",21866,
"x-mac-cyrillic",10007,
"windows-1251",1251,
"x-europa",29001,
"x-ia5-german",20106,
"ibm737",737,
"iso-8859-7",28597,
"x-mac-greek",10006,
"windows-1253",1253,
"ibm869",869,
"dos-862",862,
"iso-8859-8-i",38598,
"iso-8859-8",28598,
"x-mac-hebrew",10005,
"windows-1255",1255,
"x-ebcdic-arabic",20420,
"x-ebcdic-cyrillicrussian",20880,
"x-ebcdic-cyrillicserbianbulgarian",21025,
"x-ebcdic-denmarknorway",20277,
"x-ebcdic-denmarknorway-euro",1142,
"x-ebcdic-finlandsweden",20278,
"x-ebcdic-finlandsweden-euro",1143,
"x-ebcdic-finlandsweden-euro",1143,
"x-ebcdic-france-euro",1147,
"x-ebcdic-germany",20273,
"x-ebcdic-germany-euro",1141,
"x-ebcdic-greekmodern",875,
"x-ebcdic-greek",20423,
"x-ebcdic-hebrew",20424,
"x-ebcdic-icelandic",20871,
"x-ebcdic-icelandic-euro",1149,
"x-ebcdic-international-euro",1148,
"x-ebcdic-italy",20280,
"x-ebcdic-italy-euro",1144,
"x-ebcdic-japaneseandkana",50930,
"x-ebcdic-japaneseandjapaneselatin",50939,
"x-ebcdic-japaneseanduscanada",50931,
"x-ebcdic-japanesekatakana",20290,
"x-ebcdic-koreanandkoreanextended",50933,
"x-ebcdic-koreanextended",20833,
"cp870",870,
"x-ebcdic-simplifiedchinese",50935,
"x-ebcdic-spain",20284,
"x-ebcdic-spain-euro",1145,
"x-ebcdic-thai",20838,
"x-ebcdic-traditionalchinese",50937,
"cp1026",1026,
"x-ebcdic-turkish",20905,
"x-ebcdic-uk",20285,
"x-ebcdic-uk-euro",1146,
"ebcdic-cp-us",37,
"x-ebcdic-cp-us-euro",1140,
"ibm861",861,
"x-mac-icelandic",10079,
"x-iscii-as",57006,
"x-iscii-be",57003,
"x-iscii-de",57002,
"x-iscii-gu",57010,
"x-iscii-ka",57008,
"x-iscii-ma",57009,
"x-iscii-or",57007,
"x-iscii-pa",57011,
"x-iscii-ta",57004,
"x-iscii-te",57005,
"euc-jp",51932,
"iso-2022-jp",50220,
"iso-2022-jp",50222,
"csiso2022jp",50221,
"x-mac-japanese",10001,
"shift_jis",932,
"ks_c_5601-1987",949,
"euc-kr",51949,
"iso-2022-kr",50225,
"johab",1361,
"x-mac-korean",10003,
"iso-8859-3",28593,
"iso-8859-15",28605,
"x-ia5-norwegian",20108,
"ibm437",437,
"x-ia5-swedish",20107,
"windows-874",874,
"ibm857",857,
"iso-8859-9",28599,
"x-mac-turkish",10081,
"windows-1254",1254,
"utf-7",65000,
"utf-8",65001,
//"us-ascii",20127,
"us-ascii",1252,
"windows-1258",1258,
"ibm850",850,
"x-ia5",20105,
"iso-8859-1",1252, //was 28591
"macintosh",10000,
"windows-1252",1252,
"system",CP_ACP
}

function CSEncode ( pStr:string; pCPFrom : integer; pCPTo : integer = 1251 ) : string;
var wLen, uLen, vCodeFrom, vCodeTo : Integer;
    S, vResult : string;
    wBuf	: PWideChar;
begin
  vCodeFrom := pCPFrom;
  vCodeTo   := pCPTo;
  S := pStr;
  wLen := MultiByteToWideChar(vCodeFrom, 0, PChar(S), Length(S), NIL, 0); // wlen is the number of UCS2 without NULL terminater.
  if wLen = 0 then Exit;
  GetMem(wBuf, wLen * SizeOf(wChar));
  try
    MultiByteToWideChar(vCodeFrom, 0, PChar(S), Length(S), wBuf, wLen);   
    uLen := WideCharToMultiByte(vCodeTo, 0, wBuf, wLen, NIL, 0, NIL, NIL);
    SetLength(vResult, uLen);
    WideCharToMultiByte(vCodeTo, 0, wBuf, wLen, PChar(vResult), uLen, NIL, NIL);
  finally
    FreeMem(WBuf);
  end;
  vResult:=StringReplace(vResult,'?',' ',[rfReplaceAll, rfIgnoreCase]);
  Result:=StringReplace(vResult,'  ',' ',[rfReplaceAll, rfIgnoreCase]);
end;    

// процедура преобразования значений атрибутов DICOM
// в соответствии с кодировкой
procedure Flds_to_charset (     p_dicomattributes : TDicomAttributes;
                            var P_ENAME_RUS : string;
                            var P_ENAME     : string;
                            var p_VDESC     : string
                          );
var vTag85, vCodePage2, vS, vS1,
    vTmpdPatientName, vTmp : string;
    vPos,i, err, vLen, vResTmp :Integer;
    vStr:TStringList; vTmp1:Char;
    vS2 : PWideChar;
    varr : array [0..32767] of char;
begin // Note: If the attribute Specific Character Set (0008,0005) has
      // more than one value and value 1 is empty, it is assumed that
      // value 1 is ISO 2022 IR 6.
  // ISO 2022 IR 149
  // 'ISO 2022 IR 144\ISO 2022 IR 100'
  vTmpdPatientName := p_dicomattributes.GetString(dPatientName) ;
  vTag85:=p_dicomattributes.GetString($08, $05);

{  With TStringList.create do
  try
    append(vTag85);
    append(vTmpdPatientName);
    savetofile(ExtractFilePath(paramstr(0))+'mymy.txt');
  finally
    Free;
  end;  }
          
  vPos:=Pos('\',vTag85);
  if vPos>2 then
  begin
    vCodePage2 := copy( vTag85, vPos+1 );
    vTag85 := copy( vTag85, 0, vPos-1 );
  end;
  {if Pos('ISO 2022 IR 144', vTag85 )>0 then  //
  begin
    P_ENAME     := AnsiUpperCase( TranslitRus( CSEncode( p_dicomattributes.GetString(dPatientName), 28595 ) ) );
    P_ENAME_RUS := TranslitEng(P_ENAME);
    p_VDESC     := CSEncode( p_dicomattributes.GetString(dStudyDescription), 28595 );
  end else} if Pos('ISO 2022 IR 149', vTag85 )>0 then  // "iso-2022-kr",50225,
  begin
    P_ENAME     := AnsiUpperCase( TranslitRus( CSEncode( p_dicomattributes.GetString(dPatientName), 50225) ) );
    P_ENAME_RUS := TranslitEng(P_ENAME);
    p_VDESC     := CSEncode( p_dicomattributes.GetString(dStudyDescription), 50225);
 // end else if Pos('ISO 2022',vTag85)>0 then begin


  end else if vTag85='ISO_IR 144' then begin
    P_ENAME_RUS := set_codepage_str ( p_dicomattributes.GetString(dPatientName),3 ) ;
    P_ENAME     := TranslitRus ( P_ENAME_RUS );
    p_VDESC     := set_codepage_str ( p_dicomattributes.GetString(dStudyDescription),3 );
  end else begin
    P_ENAME     := p_dicomattributes.GetString(dPatientName);
    P_ENAME_RUS := TranslitEng(P_ENAME);
    p_VDESC     := p_dicomattributes.GetString(dStudyDescription);
  end;
end;

function gt_charset_value ( p_dicomattributes : TDicomAttributes; p_val:string; p_is_rswp : Boolean = False ) : string;
begin
  if p_dicomattributes.GetString($08, $05)='ISO_IR 144' then
  begin
    Result:=set_codepage_str ( p_val, 3, p_is_rswp );
  end
  else
  begin
    Result:=p_val;
  end;
end;

procedure dicom_tag_show ( p_DicomAttributes : TDicomAttributes );
var v_StringList : TStringList; v_str : ansistring; i : Integer;
begin
  v_StringList := TStringList.Create;
  try
    p_DicomAttributes.ListAttrinute('', v_StringList );
    v_str:='';
    for I := 0 to v_StringList.Count - 1 do
      v_str:=v_str+v_StringList[i]+#13;
    ShowMessage(v_str);
  finally
    v_StringList.Free;
  end;
end;

// процедура записи в лог-файл
procedure MnLg_ev ( const p_strs : ansistring;
                  const p_filename : ansistring = '';
                  const p_is_delim : Boolean = False;
                  const p_is_DT : boolean = True );
var F : TextFile; vEx, vTmp, vErr : Boolean; vNmb:Integer;
const c_delim = '-------------------------------------------------------------------------------';
label l1;
begin
  try
//    if GetFreeDiskSize<c_free_space then Exit; // если места меньше 10 Gigabytes
    if Trim(p_filename)<>'' then begin
      AssignFile(F, p_filename);
      vTmp:=False;
      try
        vEx := FileExists(p_filename) ;
        vNmb:=0;
        l1:
        Inc(vNmb);
        vErr:=False;
        try
          if vEx then
            Append(F)
          else
            rewrite(F);
        except
          on E:Exception do
            vErr:=True;
        end;
        if vErr and (vNmb<10) then goto l1;        
        vTmp:=True;
        if p_is_delim then writeln(F,c_delim);
        if p_is_DT then
          writeln(F,DateTimeToStr(Now)+' '+p_strs)
        else
          writeln(F,p_strs);
        Flush(F);
      finally
        try
          if vTmp then          
            CloseFile(F);
        except
        end;
      end;
    end;
  except
  end;
end;

procedure Lg_ev  ( const p_strs : ansistring;
                   const p_filename : ansistring = '';
                   const p_is_delim : Boolean = False );
begin
    if trim(p_filename)='' then begin
      MnLg_ev(p_strs,ExtractFilePath(paramstr(0))+'dicom_errors.log');
    end else begin
      MnLg_ev(p_strs,p_filename);
    end;
end;

function PhysicalResolveFileType(AStream: TStream): Integer;
var
  p: PChar; 
begin 
  Result := 0; 
  if not Assigned(AStream) then 
    Exit; 
  GetMem(p, 10);
  try 
    AStream.Position := 0; 
    AStream.Read(p[0], 10); 
    {bitmap format} 
    if (p[0] = #66) and (p[1] = #77) then 
      Result := 1; 
    {tiff format} 
    if ((p[0] = #73) and (p[1] = #73) and (p[2] = #42) and (p[3] = #0)) or 
      ((p[0] = #77) and (p[1] = #77) and (p[2] = #42) and (p[3] = #0)) then 
      Result := 2; 
    {jpg format} 
    if (p[6] = #74) and (p[7] = #70) and (p[8] = #73) and (p[9] = #70) then 
      Result := 3; 
    {png format} 
    if (p[0] = #137) and (p[1] = #80) and (p[2] = #78) and (p[3] = #71) and 
      (p[4] = #13) and (p[5] = #10) and (p[6] = #26) and (p[7] = #10) then 
      Result := 4; 
    {dcx format} 
    if (p[0] = #177) and (p[1] = #104) and (p[2] = #222) and (p[3] = #58) then 
      Result := 5; 
    {pcx format} 
    if p[0] = #10 then 
      Result := 6; 
    {emf format} 
    if (p[0] = #215) and (p[1] = #205) and (p[2] = #198) and (p[3] = #154) then 
      Result := 7; 
    {emf format} 
    if (p[0] = #1) and (p[1] = #0) and (p[2] = #0) and (p[3] = #0) then 
      Result := 7; 
  finally 
    Freemem(p); 
  end; 
end; 

function CHK_file_type_graph (p_filename:ansistring):integer;
var v_fstr:TFileStream;v_res:Integer;
begin
  v_fstr:=TFileStream.Create(p_filename, fmOpenRead);
  try
    v_res := PhysicalResolveFileType (v_fstr);
  finally
    v_fstr.Free;
  end;
  Result:=v_res;
end;

function MyFileStatus(const Origin: string): boolean;
var
  F: TFileStream;
begin
{
    Значение             Описание
    fmCreate             Созда¸т файл с данным именем. Если файл существует, то открыть его в
                                 режиме записи.
    fmOpenRead           Открыть файл только для чтения.
    fmOpenWrite          Открыть файл только на запись. При этом запись в файл заменит вс¸ его
                                 содержимое.
    fmOpenReadWrite Открыть файл скорее для изменения содержимого чем для замены его.

    Режим доступа должен иметь одно из следующих значений:

    Значение            Описание
    fmShareCompat       Доступ к файлу совместим с FCB.
    fmShareExclusive    Другое приложение не может открыть файл для различных целей.
    fmShareDenyWrite    Другое приложение может открыть файл для чтения, но не для записи.
    fmShareDenyRead     Другое приложение может открыть файл для записи, но не для чтения.
    fmShareDenyNone     Разрешить другим файлам делать с файлом и чтени и запись.

    Если файл невозможно открыть, то Create сгенерирует исключение.
    Возвращает true если файл не заблокирован
}
  try
    F := TFileStream.Create(Origin, fmOpenReadWrite or fmShareExclusive);
    try
      Result := true;
    finally
      F.Free;
    end;
  except
    Result := false;
  end;
end;

// процедура удаления временных файлов из списка v_TempFileList
procedure clr_temp_files;
var i, v_amm:Integer;
begin
  if not v_is_chk_files then
  begin
    v_is_chk_files:=True;
    try
      v_amm:=v_TempFileList.Count;
      try
        for i := 0 to v_amm - 1 do
        begin
          if i<v_TempFileList.Count then
          begin
            if v_TempFileList[i]<>'' then
            begin
              if FileExists(v_TempFileList[i]) then
              begin
                if MyFileStatus(v_TempFileList[i]) then
                begin
                  SysUtils.DeleteFile(v_TempFileList[i]);
                  if not FileExists(v_TempFileList[i]) then
                    v_TempFileList.Delete(i);
                end;
              end else
              begin
                v_TempFileList.Delete(i);
              end;
            end else
              v_TempFileList.Delete(i);
          end;
        end;
      except
      end;
      if v_TempFileList.Count=0 then
        v_TempFileList.Clear;
    finally
      v_is_chk_files:=False;
    end;
  end;
end;
  {
function GetFreeDiskSize: Int64;
var free_size, total_size: Int64;
    RootPath: array[0..4] of Char;
    RootPtr: PChar;
    current_dir, v_tmp: string;
    drive: char;
begin
  v_tmp := Trim(GetCurrentDir);
  drive:=v_tmp[1];
  RootPath[0] := Drive;
  RootPath[1] := ':';
  RootPath[2] := '\';
  RootPath[3] := #0;
  RootPtr := RootPath;
  current_dir := GetCurrentDir;
  if SetCurrentDir(drive + ':\') then
  begin
    GetDiskFreeSpaceEx(RootPtr, Free_size, Total_size, nil);
    // this to turn back to original dir
    SetCurrentDir(current_dir);
    Result := Trunc( Free_size/(1024 * 1024 * 1024) );
  end
  else
  begin
    Result := 0;
    Free_size  := -1;
    Total_size := -1;
  end;
end;  }

end.


{ if ( (Pos( 'ISO 2022 IR 100', vTag85 )>=0) or
       (Pos( 'ISO 2022 IR 144', vTag85 )>=0) )
  then begin

   // SetMultiByteConversionCodePage();  // WideCharToMultiByte()         WideCharToString( WideChar(

    vS :=  p_dicomattributes.GetString(dPatientName) ;
    vLen := (Length(vS) + 1) * SizeOf(Char);
    CopyMemory(@varr, @vS[1], vLen); // перегоним в char :)
    if Ord(varr[0])=27 then // используем вторую кодировку ISO 2022 IR 100
    begin
      vS1:=''; for I := 2 to Length(vS) - 1 do vS1:=vS1+varr[i];
      P_ENAME     := vS1 ;
      CopyMemory(@varr, @vS[2], vLen-1); // перегоним в char :)
      err := MultiByteToWideChar( 1251,// Code page     1251   28595
                                  0,// No flags
                                  @varr,// Multibyte characters string
                                  -1,// The string is NULL terminated
                                  @vS2,// Output buffer
                                  vLen  // buffer size
                                );
      P_ENAME     := p_dicomattributes.GetString(dPatientName);
      p_VDESC     := p_dicomattributes.GetString(dStudyDescription);
    end else // используем первую кодировку ISO 2022 IR 144
    begin
      vS1:=''; for I := 0 to Length(vS) - 1 do vS1:=vS1+varr[i];
      P_ENAME     := p_dicomattributes.GetString(dPatientName);
      p_VDESC     := p_dicomattributes.GetString(dStudyDescription);
    end;
    P_ENAME_RUS := TranslitEng(P_ENAME);
  end else}
