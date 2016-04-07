// JCL_DEBUG_EXPERT_GENERATEJDBG ON
// JCL_DEBUG_EXPERT_INSERTJDBG ON
library dll_worklist_nazn;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

{ Модуль для работы с АТРИС
  Настройка в TSMINI :
  begin
    asu.pkg_smini.WRITESTRING('DLL_WORKLIST_NAZN','atris_webpage','http://192.168.56.101:2080/login?redirect=');
    asu.pkg_smini.WRITESTRING('DLL_WORKLIST_NAZN','atris_mssql_conn_str','Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;User ID=sa;Initial Catalog=ClusterPacsServer;Data Source=AFOMIN\MSSQL2012;');
    asu.pkg_smini.WRITESTRING('DLL_WORKLIST_NAZN','atris_webuser','Hipax');
    asu.pkg_smini.WRITESTRING('DLL_WORKLIST_NAZN','atris_webpassword','Hipax');
    asu.pkg_smini.WRITESTRING('DLL_WORKLIST_NAZN','atris_use','1');
    asu.pkg_smini.WRITESTRING('DLL_WORKLIST_NAZN','atris_web_timeout','20000');
    asu.pkg_smini.WRITESTRING('DLL_WORKLIST_NAZN','atris_use_web_browser','1');  -- использовать веб-просмотровщик АТРИС

    asu.pkg_smini.WRITESTRING('XRAY','DICOM_PORT','104');
    asu.pkg_smini.WRITESTRING('XRAY','DICOM_IP','192.168.56.101');
    asu.pkg_smini.WRITESTRING('XRAY','DICOM_CALLED_AE','Server');
    asu.pkg_smini.WRITESTRING('XRAY','DICOM_LOCAL_PORT','1131'); -- Локальный порт для передачи снимков - один для всех станций

    'DICOM','USE_3D_LIBRARY','0'

  end;
добавить константы:
  SHOW_DICOM = -1
  USE_C_MOVE = -1
  DICOM_SHOW_3D = -1
  файл DicomSettings.ini
      sCallingAET := Ini.ReadString('MAIN', 'CALLING_AET', 'MEDOTRADE');
  а также проверить константы :

  get_radiolog
  GET_XRAY_VRACH_KMN
  GET_RAD_ISSL


-- удаленно в Хабаровске
begin
    asu.pkg_smini.WRITESTRING('DLL_WORKLIST_NAZN','atris_webpage','http://10.1.1.18:8887/login?redirect=');
    asu.pkg_smini.WRITESTRING('DLL_WORKLIST_NAZN','atris_mssql_conn_str','Provider=SQLOLEDB.1;Password=Password2013;Persist Security Info=True;User ID=sa;Initial Catalog=ClusterPacsServer;Data Source=10.1.1.18');
    asu.pkg_smini.WRITESTRING('DLL_WORKLIST_NAZN','atris_webuser','Hipax');
    asu.pkg_smini.WRITESTRING('DLL_WORKLIST_NAZN','atris_webpassword','Hipax');
    asu.pkg_smini.WRITESTRING('DLL_WORKLIST_NAZN','atris_use','1');
    asu.pkg_smini.WRITESTRING('DLL_WORKLIST_NAZN','atris_web_timeout','20000');
    asu.pkg_smini.WRITESTRING('DLL_WORKLIST_NAZN','atris_use_web_browser','1');  -- использовать веб-просмотровщик АТРИС

    asu.pkg_smini.WRITESTRING('XRAY','DICOM_PORT','104');
    asu.pkg_smini.WRITESTRING('XRAY','DICOM_IP','10.1.1.18');
    asu.pkg_smini.WRITESTRING('XRAY','DICOM_CALLED_AE','Server');
    asu.pkg_smini.WRITESTRING('XRAY','DICOM_LOCAL_PORT','105'); -- Локальный порт для передачи снимков - один для всех станций

    asu.pkg_smini.WRITESTRING('DICOM','USE_3D_LIBRARY','0');

  end;

procedure ... (  p_AppHandl : THandle;
                          ...
                       ); stdcall;
var DllHandl : THandle;                       
begin
  DllHandl := Application.Handle;
  Application.Handle := p_AppHandl;
  try
    ...
  finally

    Application.Handle := DllHandl;
  end;
end;


}

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Classes,
  types,
  forms,
  Controls,
  inifiles,
  Windows,
  Oracle,
  ADODB,
  dialogs,
  Uni,
  PostgreSQLUniProvider,
  unSnimkiAtris in 'unSnimkiAtris.pas' {frmSnimkiAtris},
  UndmMain in 'UndmMain.pas' {dmMain: TDataModule},
  fUpdate in 'fUpdate.pas' {frmUpdate},
  DCM_Attributes in '..\..\..\..\DicomVCL\DCM_Attributes.pas';

{$R *.res}

// получение studyinstanceUID по accessionnumber
function f_gt_studyUID (p_OracleSession: pointer;p_accessionnumber:string):string;stdcall;
var v_s_atris_web_timeout : string;
const c_key = 'DLL_WORKLIST_NAZN';
begin
  UndmMain.setSession ( p_OracleSession );
  if UndmMain.OracleSession1.Connected then  // только если
  begin
    try
      v_atris_webpage := f_gtTSMINI(c_key,'atris_webpage'); //p_atris_webpage;
      v_atris_mssql_conn_str := f_gtTSMINI(c_key,'atris_mssql_conn_str'); // p_atris_mssql_conn_str;
      v_atris_webuser := f_gtTSMINI(c_key,'atris_webuser'); // p_atris_webuser;
      v_atris_webpassword := f_gtTSMINI(c_key,'atris_webpassword'); // p_atris_webpassword;
      v_atris_use := f_gtTSMINI(c_key,'atris_use'); // p_atris_use ;
      try
        v_s_atris_web_timeout:=f_gtTSMINI(c_key,'atris_web_timeout');
        if Trim(v_s_atris_web_timeout)='' then
          v_atris_web_timeout :=  20000
        else
          v_atris_web_timeout := StrToInt( v_s_atris_web_timeout ); // p_atris_web_timeout;
      except
        v_atris_web_timeout :=  20000 ;
      end;

      Result := f_getstudyUID ( p_accessionnumber );

    finally
      oraDisconnect;
    end;
  end;
end;

// Отображение снимков по пациенту/исследованию (для АТРИС)
procedure p_ShowSnimki ( p_OracleSession: pointer;
                         p_patientID:string;
                         p_AccessionNumber:string;
                         p_studyUID:string
                       ); stdcall;
var frmSnimkiAtris : TfrmSnimkiAtris; v_s_atris_web_timeout : string;
const c_key = 'DLL_WORKLIST_NAZN';
begin
  UndmMain.setSession ( p_OracleSession );
  if UndmMain.OracleSession1.Connected then  // только если
  begin
    try
      v_atris_webpage := f_gtTSMINI(c_key,'atris_webpage'); //p_atris_webpage;
      v_atris_mssql_conn_str := f_gtTSMINI(c_key,'atris_mssql_conn_str'); // p_atris_mssql_conn_str;
      v_atris_webuser := f_gtTSMINI(c_key,'atris_webuser'); // p_atris_webuser;
      v_atris_webpassword := f_gtTSMINI(c_key,'atris_webpassword'); // p_atris_webpassword;
      v_atris_use := f_gtTSMINI(c_key,'atris_use'); // p_atris_use ;
      try
        v_s_atris_web_timeout:=f_gtTSMINI(c_key,'atris_web_timeout');
        if Trim(v_s_atris_web_timeout)='' then
          v_atris_web_timeout :=  20000
        else
          v_atris_web_timeout := StrToInt( v_s_atris_web_timeout ); // p_atris_web_timeout;
      except
        v_atris_web_timeout :=  20000 ;
      end;

      v_patientID:=p_patientID;
      v_AccessionNumber:=p_AccessionNumber;
      v_studyUID:=p_studyUID;
      // по AccessionNumber получить studyUID
      if (v_studyUID='') then
        v_studyUID:=f_getstudyUID(v_AccessionNumber);
    //  ShowMessage(' v_studyUID='+v_studyUID);

      if Trim(v_studyUID)<>'' then
      begin
        frmSnimkiAtris := TfrmSnimkiAtris.Create(nil);
        try
          frmSnimkiAtris.ShowModal;
        finally
          FreeAndNil(frmSnimkiAtris);
        end;
      end else
      begin
        MessageDlg('В исследовании не задан StudyUID', mtWarning, [mbOK], 0);
      end;
    finally
      oraDisconnect;
    end;
  end;
end;

procedure p_showHTTPSnimki (  p_atris_webpage ,
                              p_atris_mssql_conn_str,
                              p_atris_webuser,
                              p_atris_webpassword,
                              p_atris_use : string;
                              p_atris_web_timeout : Integer;
                              p_patientID:string;
                              p_AccessionNumber:string;
                              p_studyUID:string
                           ); stdcall;
begin
  v_atris_webpage := p_atris_webpage;
  v_atris_mssql_conn_str := p_atris_mssql_conn_str;
  v_atris_webuser := p_atris_webuser;
  v_atris_webpassword := p_atris_webpassword;
  v_atris_use := p_atris_use ;
  v_atris_web_timeout := p_atris_web_timeout;

  v_patientID:=p_patientID;
  v_AccessionNumber:=p_AccessionNumber;
  v_studyUID:=p_studyUID;
  // по AccessionNumber получить studyUID
  if (v_studyUID='') then
    v_studyUID:=f_getstudyUID(v_AccessionNumber);

  MyIEShow;

{  frmSnimkiAtris := TfrmSnimkiAtris.Create(nil);
  try
    frmSnimkiAtris.MyShow;
    frmSnimkiAtris.ShowModal;

//    ShowMessage('123');

  finally
    FreeAndNil(frmSnimkiAtris);
  end;   }
end;

// Заведение нового исследования в worklist
procedure crtWorklistRecord ( p_patientID:string ); stdcall;
begin
  if f_MSSQLconn then
  begin



  end else
  begin



  end;


end;

// Чтение статуса исследования в worklist

// Удаление исследования из worklist

// Изменение данных исследования

// Изменение статуса исследования в worklist

// True - нет номера   False - номер есть
function f_chk_AN ( p_atris_mssql_conn_str, p_AccessionNumber : string ):boolean; stdcall;
begin
  if Trim(p_atris_mssql_conn_str)='' then
  begin
    MessageDlg('Неверно указаны параметры соединения с MS SQL ATRIS', mtError, [mbOK], 0);
  end
  else
  begin
    UndmMain.v_atris_mssql_conn_str := p_atris_mssql_conn_str;
    Result := chk_AN_inr ( p_atris_mssql_conn_str, p_AccessionNumber );    
  end;
end;                  

// возвращает worklist
procedure p_gtWorklist ( p_atris_mssql_conn_str : string;
                         p_patientid : string ;
                         p_AccessionNumber : string ;
                         p_studyinstanceuid : string ;
                         p_modatity : string ;
                         p_stationaetitle : string ;
                         p_fld_razd : string ;
                         p_filename : string ;
                         p_AmmRecs : integer
                       ); stdcall;
begin
  if Trim(p_atris_mssql_conn_str)='' then
  begin
    MessageDlg('Неверно указаны параметры соединения с MS SQL ATRIS', mtError, [mbOK], 0);
  end
  else
  begin
    UndmMain.v_atris_mssql_conn_str := p_atris_mssql_conn_str;
    UndmMain.v_fld_razd:=p_fld_razd;
    v_maxrow:=p_AmmRecs;
    if v_maxrow<=0 then v_maxrow:=10;
    UndmMain.v_obmen_filename:=p_filename;
    gt_WorkList(p_patientid, p_AccessionNumber, p_studyinstanceuid, p_modatity, p_stationaetitle);
  end;
end;                       

// Получение списка исследований по пациенту
procedure p_gtStudies ( p_atris_mssql_conn_str : string;
                        p_patientNum : string ;
                        p_AccessionNumber : string ;
                        p_fld_razd : string ;
                        p_filename : string ;
                        p_AmmRecs : integer
                     ); stdcall;
begin
  if Trim(p_atris_mssql_conn_str)='' then
  begin
    MessageDlg('Неверно указаны параметры соединения с MS SQL ATRIS', mtError, [mbOK], 0);
  end
  else
  begin
    UndmMain.v_atris_mssql_conn_str := p_atris_mssql_conn_str;
    UndmMain.v_fld_razd:=p_fld_razd;
    v_maxrow:=p_AmmRecs;
    if v_maxrow<=0 then v_maxrow:=10;
    UndmMain.v_obmen_filename:=p_filename;
    gt_MnStudiesList(p_patientNum,p_AccessionNumber);
  end;
end;

// функции для экспорта - вызываются извне

// процедура для проверки доступности MS SQL ATRIS
function f_chk_mssql_atris ( p_atris_mssql_conn_str1 : string
                           ):boolean;stdcall;
begin
  if Trim(p_atris_mssql_conn_str1)='' then
  begin
    MessageDlg('Неверно указаны параметры соединения с MS SQL ATRIS', mtError, [mbOK], 0);
    Result:=False;
  end
  else
  begin
    UndmMain.v_atris_mssql_conn_str := p_atris_mssql_conn_str1;
    Result:=f_MSSQLconn;
  end;
end;

procedure p_gtPatientStudies ( p_atris_mssql_conn_str : string;
                              p_patientid : string ;
                              p_fld_razd : string ;
                              p_filename : string ;
                              p_AmmRecs : integer
                           ); stdcall;
begin
  if Trim(p_atris_mssql_conn_str)='' then
  begin
    MessageDlg('Неверно указаны параметры соединения с MS SQL ATRIS', mtError, [mbOK], 0);
  end
  else
  begin
    UndmMain.v_atris_mssql_conn_str := p_atris_mssql_conn_str;
    UndmMain.v_fld_razd:=p_fld_razd;
    v_maxrow:=p_AmmRecs;
    if v_maxrow<=0 then v_maxrow:=10;
    v_obmen_filename:=p_filename;
    gt_StudiesList(p_patientid);
  end;
end;

// удаление из worklist
procedure p_delWorklist  ( p_atris_mssql_conn_str : string;
                           p_AccessionNumber      : string ;
                           p_studyinstanceuid     : string
                         ); stdcall;
begin
  if Trim(p_atris_mssql_conn_str)='' then
  begin
    MessageDlg('Неверно указаны параметры соединения с MS SQL ATRIS', mtError, [mbOK], 0);
  end
  else
  begin
    UndmMain.v_atris_mssql_conn_str := p_atris_mssql_conn_str;
    p_MndelWorklist(p_AccessionNumber,p_studyinstanceuid);
  end;
end;

procedure p_INSWorklist     ( p_AppHandl : THandle;
                              p_atris_mssql_conn_str : string;
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
                           ); stdcall;
var DllHandl : THandle;
begin
  DllHandl := Application.Handle;
  Application.Handle := p_AppHandl;
  try
    if Trim(p_atris_mssql_conn_str)='' then
    begin
      MessageDlg('Неверно указаны параметры соединения с MS SQL ATRIS', mtError, [mbOK], 0);
    end
    else
    begin
      UndmMain.v_atris_mssql_conn_str := p_atris_mssql_conn_str;
      p_MNINSWorklist ( p_atris_mssql_conn_str,
                        p_PatientIDINS,      // Номер Карты -> PatientID
                        p_patPrefix,         // patPrefix (не исп)
                        p_PatientFamily,     // Фамилия
                        p_PatientNAME,       // Имя
                        p_PatientSurname,    // Отчество
                        p_BirthDate,         // Дата рождения -> PatientBirthDate
                        p_Sex,               // Пол
                        p_AETitle,           // AETitle аппарата
                        p_Room,              // Комната (не исп)
                        p_DiagnMKB10,        // Код напр. диагноза по МКБ-10 -> не исп
                        p_Podrazdelenie,     // Направившее подразделение
                        p_VrachFam,          // Фамилия направившего врача
                        p_VrachIm,           // Имя направившего врача
                        p_VrachOtch,         // Отчество направившего врача
                        p_Modality,          // Modality
                        p_BodyPart,          // Название исследуемой части тела
                        p_StudyName,         // Название исследования
                        p_FASTEST,           // Экстренный (1/0)-> не исп (integer)
                        p_DateTimeNapravl,       // Время направления
                        p_Polikl_Statsionar, // 0 - Поликлиника, 1 - Стационар
                        p_AccessionNumber,    // AccessionNumber
                        p_studyinstanceuid
                     );
    end;
  finally
    Application.Handle := DllHandl;
  end;
end;


// Отправка назначения на наш worklist
// проверка
// INSERT INTO ASU.TSMINI (FC_SECTION, FC_KEY, FC_VALUE) VALUES('DLL_WORKLIST_NAZN', 'MYWORKLIST_USE', '1');
{
INSERT INTO ASU.TSMINI (FC_SECTION, FC_KEY, FC_VALUE) VALUES('DLL_WORKLIST_NAZN','PG_DATABASE', 'postgres' );
INSERT INTO ASU.TSMINI (FC_SECTION, FC_KEY, FC_VALUE) VALUES('DLL_WORKLIST_NAZN','PG_PORT', '5432' );
INSERT INTO ASU.TSMINI (FC_SECTION, FC_KEY, FC_VALUE) VALUES('DLL_WORKLIST_NAZN','PG_SERVER', 'localhost' );
INSERT INTO ASU.TSMINI (FC_SECTION, FC_KEY, FC_VALUE) VALUES('DLL_WORKLIST_NAZN','PG_SCHEMA', 'mypacs' );
INSERT INTO ASU.TSMINI (FC_SECTION, FC_KEY, FC_VALUE) VALUES('DLL_WORKLIST_NAZN','PG_USERNAME', 'postgres' );
INSERT INTO ASU.TSMINI (FC_SECTION, FC_KEY, FC_VALUE) VALUES('DLL_WORKLIST_NAZN','PG_PASSWORD', 'Dcgjvybcfv11111' );

PACS
    v_get_dicom_ip := f_gtTSMINI('XRAY','DICOM_IP');
    v_get_dicom_called := f_gtTSMINI('XRAY','DICOM_CALLED_AE');
    v_get_dicom_port := f_gtTSMINI('XRAY','DICOM_PORT');
    v_get_local_port := f_gtTSMINI('XRAY','DICOM_LOCAL_PORT');

PACS database
INSERT INTO ASU.TSMINI (FC_SECTION, FC_KEY, FC_VALUE) VALUES('XRAY',	'PACS_DATABASE',	'test');
INSERT INTO ASU.TSMINI (FC_SECTION, FC_KEY, FC_VALUE) VALUES('XRAY',	'PACS_PORT',	'5432');
INSERT INTO ASU.TSMINI (FC_SECTION, FC_KEY, FC_VALUE) VALUES('XRAY',	'PACS_SERVER',	'localhost');
INSERT INTO ASU.TSMINI (FC_SECTION, FC_KEY, FC_VALUE) VALUES('XRAY',	'PACS_SCHEMA',	'mypacs');
INSERT INTO ASU.TSMINI (FC_SECTION, FC_KEY, FC_VALUE) VALUES('XRAY',	'PACS_USERNAME',	'postgres');
INSERT INTO ASU.TSMINI (FC_SECTION, FC_KEY, FC_VALUE) VALUES('XRAY',	'PACS_PASSWORD',	'postgres');

// SOKB
INSERT INTO ASU.TSMINI (FC_SECTION, FC_KEY, FC_VALUE) VALUES('XRAY',  'PACS_DATABASE',  'postgres');
INSERT INTO ASU.TSMINI (FC_SECTION, FC_KEY, FC_VALUE) VALUES('XRAY',  'PACS_PORT',  '5432');
INSERT INTO ASU.TSMINI (FC_SECTION, FC_KEY, FC_VALUE) VALUES('XRAY',  'PACS_SERVER',  'localhost');
INSERT INTO ASU.TSMINI (FC_SECTION, FC_KEY, FC_VALUE) VALUES('XRAY',  'PACS_SCHEMA',  'mypacs');
INSERT INTO ASU.TSMINI (FC_SECTION, FC_KEY, FC_VALUE) VALUES('XRAY',  'PACS_USERNAME',  'postgres');
INSERT INTO ASU.TSMINI (FC_SECTION, FC_KEY, FC_VALUE) VALUES('XRAY',  'PACS_PASSWORD',  'Dcgjvybcfv11111');

INSERT INTO ASU.TSMINI (FC_SECTION, FC_KEY, FC_VALUE) VALUES('XRAY',  'RUNVIEWERDLL',  '1');

}
procedure p_SndToVCLWorklist (  p_AppHandl : THandle;
                                p_AccessionNumber:string;
                                p_sex : string;
                                p_pid : string;
                                p_dateborn : TDateTime;
                                p_fam : string;
                                p_im : string;
                                p_otch : string;
                                modality : string;
                                studyuid : string;
                                p_st_dt : TDateTime ;
                                stepstarttime : string ;
                                stepdescription : string ;
                                //
                                p_PG_Database  : string;
                                p_PG_Port : integer;
                                p_PG_Server  : string;
                                p_PGSchema : string;
                                p_PG_Username  : string;
                                p_PG_Password  : string
                                //
                       ); stdcall;
var frmSnimkiAtris : TfrmSnimkiAtris; v_s_atris_web_timeout : string;
    v_PGconn : TUniConnection; DllHandl: THandle;
    v_trans : TUniTransaction; v_UniQr : TUniQuery;
const c_key = 'DLL_WORKLIST_NAZN';
  function f_check_AN (pAN:string):Boolean;
  var v_UniQr : TUniQuery; vres:Boolean;
  begin
    v_UniQr := TUniQuery.Create(nil);
    try
      v_UniQr.Connection:=v_PGconn;
      v_UniQr.Transaction:=v_trans;
      v_UniQr.SQL.Text := 'select 1 from '+p_PGSchema+'.worklist where accessionnumber=:p_accessionnumber';
      v_UniQr.ParamByName('p_accessionnumber').AsString := pAN;
      try
        v_UniQr.Transaction.StartTransaction;
        v_UniQr.Open;
        vres := not v_UniQr.Eof;
        if v_UniQr.Transaction.Active then
          v_UniQr.Transaction.Commit;
      except
      on e:Exception do
        begin
          v_UniQr.Transaction.Rollback;
          vres := False;
        end;
      end;
    finally
      v_UniQr.Free;
    end;
    Result := vres;
  end;
begin
 { DllHandl := Application.Handle;
  Application.Handle := p_AppHandl;
  try  }
    v_PGconn:= TUniConnection.Create(nil);
    v_PGconn.LoginPrompt:=False;
    v_PGconn.ProviderName := 'PostgreSQL';
    v_PGconn.Database := p_PG_Database;
    v_PGconn.Port := p_PG_Port;
    v_PGconn.Server := p_PG_Server;
    v_PGconn.SpecificOptions.Values['Schema'] := p_PGSchema;
    v_PGconn.SpecificOptions.Values['UseUnicode'] := 'True';
    v_PGconn.Username := p_PG_Username;
    v_PGconn.Password := p_PG_Password;
    try
      v_PGconn.Connected := True;
    except
     on E:Exception do
       ShowMessage('ERROR : '+E.Message+#10+
                    'Database=' + v_PGconn.Database+#10+
                    'Port=' + IntToStr(v_PGconn.Port)+#10+
                    'Server=' + v_PGconn.Server+#10+
                    'Schema=' + p_PGSchema+#10+
                    'Username=' + v_PGconn.Username+#10+
                    'Password=' + v_PGconn.Password
                  );
    end;
    //
    if v_PGconn<>nil then
    begin
      v_trans := TUniTransaction.Create(nil);
      v_trans.DefaultConnection:=v_PGconn;
      try
        if v_PGconn.Connected then
        begin
          if not f_check_AN(p_AccessionNumber) then
          begin
            v_UniQr := TUniQuery.Create(nil);
            try
              v_UniQr.Connection:=v_PGconn;
              v_UniQr.Transaction:=v_trans;
              v_UniQr.SQL.Text := 'insert into '+p_PGSchema+'.worklist ( '+
               ' p_ename, p_sex, p_pid, p_dateborn, p_fam, p_im, p_otch, p_ename_rus, '+
               ' p_patientsex, accessionnumber, modality, studyuid, '+
               ' p_st_dt, status, procedureid, startdateworklist, enddateworklist, '+
               ' stepstarttime, stepfinishtime, physiciansname, stepdescription, '+
               ' stepid, stationname, procdescription, procpriority, '+
               ' stationaetitle ) values ( '+
               ' :p_ename ,  '+
               ' :p_sex ,  '+
               ' :p_pid ,  '+
               ' :p_dateborn ,  '+
               ' :p_fam ,  '+
               ' :p_im ,  '+
               ' :p_otch ,  '+
               ' :p_ename_rus ,  '+
               ' :p_patientsex ,  '+
               ' :accessionnumber ,  '+
               ' :modality ,  '+
               ' :studyuid ,  '+
               ' :p_st_dt ,  '+
               ' :status ,  '+
               ' :procedureid ,  '+
               ' :startdateworklist ,  '+
               ' :enddateworklist ,  '+
               ' :stepstarttime ,  '+
               ' :stepfinishtime ,  '+
               ' :physiciansname ,  '+
               ' :stepdescription ,  '+
               ' :stepid ,  '+
               ' :stationname ,  '+
               ' :procdescription ,  '+
               ' :procpriority,  '+
               ' :stationaetitle '+
               ' ) ';
              v_UniQr.ParamByName('p_sex').AsString := p_sex;
              v_UniQr.ParamByName('p_patientsex').AsString := p_sex;
              if Trim(p_pid)='' then
                v_UniQr.ParamByName('p_pid').AsString := 'UNKNOWN'
              else
                v_UniQr.ParamByName('p_pid').AsString := p_pid; // v_UniQr1.FieldByName('patientid').AsString;
              v_UniQr.ParamByName('p_dateborn').AsDateTime := p_dateborn ;
              v_UniQr.ParamByName('p_fam').AsString := p_fam; // v_UniQr1.FieldByName('middlename').AsString;
              v_UniQr.ParamByName('p_im').AsString := p_im; // v_UniQr1.FieldByName('firstname').AsString;
              v_UniQr.ParamByName('p_otch').AsString := p_otch; // v_UniQr1.FieldByName('lastname').AsString;
              v_UniQr.ParamByName('p_ename_rus').AsString := p_fam+' '+p_im+' '+p_otch ; // v_UniQr1.FieldByName('patientname').AsString;
              v_UniQr.ParamByName('p_ename').AsString := TranslitRus(p_fam+' '+p_im+' '+p_otch);
              v_UniQr.ParamByName('accessionnumber').AsString := p_AccessionNumber;
              v_UniQr.ParamByName('modality').AsString := modality;
              v_UniQr.ParamByName('studyuid').AsString := studyuid;
              v_UniQr.ParamByName('p_st_dt').AsDateTime := p_st_dt ;
              v_UniQr.ParamByName('status').AsString := '';
              v_UniQr.ParamByName('procedureid').AsInteger := 0 ;
              v_UniQr.ParamByName('startdateworklist').AsDateTime := Date ;
              v_UniQr.ParamByName('enddateworklist').AsDateTime := Date ;
              v_UniQr.ParamByName('stepstarttime').AsString := '';
              v_UniQr.ParamByName('stepfinishtime').AsString := '';
              v_UniQr.ParamByName('physiciansname').AsString := '';
              v_UniQr.ParamByName('stepdescription').AsString := '';
              v_UniQr.ParamByName('stepid').AsString := '';
              v_UniQr.ParamByName('stationname').AsString := ''; // v_UniQr1.FieldByName('stationname').AsString;
              v_UniQr.ParamByName('procdescription').AsString := '';
              v_UniQr.ParamByName('procpriority').AsString := '';
            //  if Trim(v_UniQr1.FieldByName('stationaetitle').AsString)='' then
                v_UniQr.ParamByName('stationaetitle').AsString := 'UNKNOWN';
            //  else
            //    v_UniQr.ParamByName('stationaetitle').AsString := v_UniQr1.FieldByName('stationaetitle').AsString;
              try
                v_UniQr.Transaction.StartTransaction;
                v_UniQr.ExecSQL;
                if v_UniQr.Transaction.Active then
                    v_UniQr.Transaction.Commit;
                MessageDlg('Назначение отправлено на worklist...', mtInformation, [mbOK], 0);
              except
                on e:Exception do
                  begin
                    ShowMessage(E.Message);
                    v_UniQr.Transaction.Rollback;
                  end;
              end;
            finally
              v_UniQr.Free;
            end;
          end;
        end;
      finally
        if v_PGconn.Connected then
          v_PGconn.Connected:=False;
        try
          v_trans.Free;
        except
        end;
        try
          v_PGconn.Free;
        except
        end;
      end;
    end;

    {    try

            if v_PGconn.Connected then
            begin
              try
                v_UniQr1 := TUniQuery.Create(nil);
                try
                  v_UniQr1.Connection:=v_PGconn;
                  v_UniQr1.Transaction:=v_PGTrans;
    }

      // if f_gtTSMINI('DLL_WORKLIST_NAZN','myworklist_use')='1' then


           {
            v_UniQr.ParamByName('p_ename').AsString := v_UniQr1.FieldByName('patientnameeng').AsString;
            v_UniQr.ParamByName('p_sex').AsString := 'M';
            v_UniQr.ParamByName('p_patientsex').AsString := 'M';
            v_UniQr.ParamByName('p_pid').AsString := v_UniQr1.FieldByName('patientid').AsString;
            v_UniQr.ParamByName('p_dateborn').AsDateTime := v_UniQr1.FieldByName('birthday').AsDateTime ;
            v_UniQr.ParamByName('p_fam').AsString := v_UniQr1.FieldByName('middlename').AsString;
            v_UniQr.ParamByName('p_im').AsString := v_UniQr1.FieldByName('firstname').AsString;
            v_UniQr.ParamByName('p_otch').AsString := v_UniQr1.FieldByName('lastname').AsString;
            v_UniQr.ParamByName('p_ename_rus').AsString := v_UniQr1.FieldByName('patientname').AsString;
            v_UniQr.ParamByName('accessionnumber').AsString := v_UniQr1.FieldByName('accessionnumber').AsString;
            v_UniQr.ParamByName('modality').AsString := v_UniQr1.FieldByName('modality').AsString;
            v_UniQr.ParamByName('studyuid').AsString := v_UniQr1.FieldByName('studyuid').AsString;
            v_UniQr.ParamByName('p_st_dt').AsDateTime := v_UniQr1.FieldByName('runbeg_dt').AsDateTime ;
            v_UniQr.ParamByName('startdateworklist').AsDateTime := Date ;
            v_UniQr.ParamByName('enddateworklist').AsDateTime := Date ;
            v_UniQr.ParamByName('stepstarttime').AsString := '';
            v_UniQr.ParamByName('stepfinishtime').AsString := '';
            v_UniQr.ParamByName('stepdescription').AsString := v_UniQr1.FieldByName('studydescription').AsString;
            }


{  finally
    Application.Handle := DllHandl;
  end; }
end;

exports
  p_ShowSnimki,
  crtWorklistRecord,
  p_showHTTPSnimki,
  f_chk_mssql_atris,
  p_gtPatientStudies,
  p_gtStudies,
  p_gtWorklist,
  p_delWorklist,
  p_INSWorklist,
  f_gt_studyUID,
  f_chk_AN,
  p_SndToVCLWorklist;

begin

end.
