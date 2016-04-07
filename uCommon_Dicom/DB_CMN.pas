{ Модуль для процедур работы с базой данных, используемых в модулях
  типа управления транзакцией, выполнения запросов и проч.
}

unit DB_CMN;

interface

Uses pFIBDatabase, SysUtils, Dialogs, pFIBQuery, pFIBDataSet,
     FIBDatabase, CmnUnit, pFIBProps, Registry, Windows, Forms,
     Variants, Uni, IniFiles, DB, DCM_Server, PostgreSQLUniProvider,
     Oracle, OracleData, ComCtrls, DCM_Attributes, IB_ErrorCodes, fib;

// Функция возврата роли юзера
//  1 - sysdba
function gtUserRole ( pUserName : string ) : SmallInt;

// функция формирования строки SQL-запроса с параметрами
function lg_SQLCMN( const FIBQuery:TpFIBQuery ):AnsiString;

// функция формирования строки SQL-запроса с параметрами
function lg_SQLDSCMN( const FIBQuery:TpFIBDataSet ):AnsiString;

// завершение транзакции
procedure MyEndTrans(const p_FIBTransaction : TpFIBTransaction);

// старт транзакции
procedure MyStartTrans(const p_FIBTransaction : TpFIBTransaction);

// закрытие соединения с базой
procedure MyDBDisconnect(const p_FIBDatabase: TpFIBDatabase);

// открытие соединения с базой
procedure MyDbConnect(const p_FIBDatabase: TpFIBDatabase);

// commit и start транзакции Read
procedure Cmn_Commit(const p_FIBTransaction : TpFIBTransaction);

// выполнение запроса
procedure MyExecQuery( const v_FIBQuery : TpFIBQuery );

// выполнение запроса
procedure MyExecDSQuery( const v_FIBDataSet : TpFIBDataSet );

// функция возврата параметров DICOM устройства по AETitle
function gt_device_params  ( const p_AETitle : string;
                             const p_IP_AE   : string;
                             AClientThread: TDicomClientThread;
                             var   p_IP      : string;
                             var   p_port    : string
                           ):boolean;

procedure MyDoQueryInsert( sEvent: string;
                           nType: Integer;
                           sRemark: string;
                           p_FIBTransaction : TpFIBTransaction;
                           DB: TpFIBDatabase
                         );

procedure CmnMyDoQueryInsertCMN( sEvent: string;
                           nType: Integer;
                           sRemark: string;
                           p_DB : TFIBDatabase;
                           p_FIBTransaction : TpFIBTransaction;
                           p_isPostgres : Boolean;
                           p_PGconn: TUniConnection;
                           p_PGTrans : TUniTransaction;
                           p_isOracle : Boolean;
                           pOraConn : TOracleSession
                         );

// запись параметров
procedure DBparams_wrt (
      const p_SECTION : string;
      const p_KEY     : string;
      const p_VALUE   : string
      );

// чтение описания устройства (комментария)
function gt_AE_DEVICE_comm ( p_aetitle:string;
                             p_FIBTransaction : TpFIBTransaction;
                             p_DB: TpFIBDatabase
                           ):string;

// функция возвращает наименование приложения без расширения
// для записи параметров в реестр
function gt_app_name : string;

// процедура чтения имени пакса для отправки снимков
procedure gt_pacs_aetitle ( var p_ae_title : string;
                            var p_ae_comm : string;
                            p_FIBTransaction : TpFIBTransaction;
                            p_DB: TpFIBDatabase;
                            p_CalledAE : string;
                            p_username : string = 'MainUser'
                          );
                          
// процедура записи имени пакса для отправки снимков
procedure wrt_pacs_aetitle ( p_ae_title : string;
                             p_ae_comm  : string;
                             p_username : string = 'MainUser'
                           );
                           
const c_param_not_found = '';  //  'NOT_FOUND';

// чтение параметра
function DBparams_get( p_SECTION : string;
                       p_KEY : string;
                       p_default_value : string = c_param_not_found;
                       p_DB : TpFIBDatabase = nil
                       ) : ansistring;

// процедура закрытия соединения с БД
procedure Logout(DataBase: TpFIBDatabase);

// освобождение соединения с firebird
procedure p_free_conn_fb ( p_DB : TpFIBDatabase;
                           p_trWrite: TpFIBTransaction;
                           p_trRead: TpFIBTransaction
                         );

// функция создания соединения с oracle
function OraConnCrt (p_is_conn:Boolean = True) : TOracleSession ;
// процедура  освобождение соединения oracle
procedure OraFree ( p_Oraconn: TOracleSession );

// функция создания соединения с postgres
function PgConnCrt (p_is_conn:Boolean = True) : TUniConnection ;
// функция создания транзакции postgres
function PGTransCreate (p_conn:TUniConnection) : TUniTransaction;
// процедура закрытия транзакции Postgres и освобождение соединения
procedure PgFree ( p_PGconn: TUniConnection;
                   p_PGTrans : TUniTransaction
                 );

// создание бд для соединения с firebird
function f_fb_db_crt (AliasName:string): TpFIBDatabase;

function f_FbReadTransactCreateNS (p_DB : TpFIBDatabase) : TpFIBTransaction;
function f_FbWriteTransactCreateNS (p_DB : TpFIBDatabase) : TpFIBTransaction;

function f_FbReadTransactCreate (p_DB : TpFIBDatabase) : TpFIBTransaction;
function f_FbWriteTransactCreate (p_DB : TpFIBDatabase) : TpFIBTransaction;

// общая процедура чтения параметров соединения с БД
procedure cmn_db_params_read(Ini : TIniFile);

procedure wrtErrSnim ( p_isOracle : Boolean;
                       pOraConn : TOracleSession;
                       p_isPostgres : Boolean;
                       p_PGconn: TUniConnection;
                       p_PGTrans : TUniTransaction;
                       p_DB: TpFIBDatabase;
                       p_trWrite : TpFIBTransaction;
                       p_FK_ID_RSND: Integer;
                       p_FC_STUDYUID: String;
                       p_FC_INSTANCEUID: String;
                       p_FC_COMM: String;
                       p_TRANSFERSYNTAX: Integer;
                       p_FC_CALLEDTITLE: String;
                       p_1_7_IS_LOG_WRITE : Boolean = True
                     );

function EVENTS_RSND_ins (   p_isOracle : Boolean; 
                             pOraConn : TOracleSession;
                             p_isPostgres : Boolean;
                             p_PGconn: TUniConnection;
                             p_PGTrans : TUniTransaction;
                             p_DB: TpFIBDatabase;
                             p_trWrite : TpFIBTransaction;
                             p_FC_CALLINGTITLE : String;
                             p_FC_CALLEDTITLE : String;
                             p_FC_STUDYUID : String;
                             p_FC_MODALITY : String;
                             p_FD_STUDYDATE : TDateTime;
                             p_FD_DATE : TDateTime;
                             p_FN_AMM : Integer;
                             p_FC_PATIENTID : String;
                             p_FC_PATIENTNAME : String;
                             p_P_ENAME : String;
                             p_ACCESSIONNUMBER : String;
                             p_FN_AMM_ERR : Integer;
                             p_1_7_IS_LOG_WRITE : Boolean = True
                          ):integer;

// функция формирования строки об ошибках в SQL-запросе
function lg_SQL( const FIBQuery:TpFIBQuery; const p_ClassName:AnsiString; const p_Message:AnsiString ):AnsiString; overload;
function lg_SQL( const FIBQuery:TUniQuery; const p_ClassName:AnsiString; const p_Message:AnsiString ):AnsiString; overload;

function lg_SQLDS( const FIBQuery:TpFIBDataSet; const p_ClassName:AnsiString; const p_Message:AnsiString ):AnsiString;

procedure gt_servParms ( p_device_name:string;
                         p_DB : tpFIBDatabase;
                         p_trRead : TpFIBTransaction;
                         p_isPostgres : boolean;
                         p_Connection :  TUniConnection;
                         p_Transaction :  TUniTransaction;
                         p_isOracle : Boolean;
                         pOraConn : TOracleSession;
                         var teServer:string;
                         var tePort:integer );

procedure cmn_ins_add ( var p_str:ansistring );
function MySetSQL ( p_fld_name:string; p_cmn_str:string ):string;
function gtTabName( p_table_Name:string ):string;
function gtFldName( p_Fld_Name:string ):string;

function gt_fld_name ( p_tabname, p_fieldname : string ) : string;

procedure trWriteStart;
procedure trReadStart;
procedure cmn_trans_start ;

const cBase       = 'BASE';
      cWorkList   = 'WORKLIST';
      cPACIENTNET = 'PACIENTNET';
      cWADO       = 'WADO';
      cPACIENTNETWORKLIST   = 'PACIENTNETWORKLIST';
      cPN1 = 'SendToPacientNet';
      cPN2 = 'PG_database';
      cPN3 = 'PG_port';
      cPN4 = 'PG_server';
      cPN5 = 'PG_user';
      cPN6 = 'PG_password';
      cPN7 = 'PG_schema';
      cPN8 = 'AmmStoreDays';
      cPN9 = 'TimeCheckPacNetInMinutes';
      cPN10 = 'CheckWorkListPacientNet';
      cWL_max_connections        = 'max_connections';
      cWLMinFreeMemory           = 'MinFreeMemory';
      cWLMaxTimeoutThreadWait    = 'MaxTimeoutThreadWait';
      cWADO_max_connections      = 'max_connections';
      cWADOMinFreeMemory         = 'MinFreeMemory';
      cWADOMaxTimeoutThreadWait  = 'MaxTimeoutThreadWait';
      cPACS_max_connections      = 'max_connections';
      cPACSMinFreeMemory         = 'MinFreeMemory';
      cPACSMaxTimeoutThreadWait  = 'MaxTimeoutThreadWait';
   //   cPN8 = 'удалять записи сроком более дней (=0-не чистить)';

var DB : TpFIBDatabase;
    trWrite: TpFIBTransaction;
    trRead: TpFIBTransaction;
    //
    WLDB : TpFIBDatabase;
    WLtrWrite: TpFIBTransaction;
    WLtrRead: TpFIBTransaction;
    //
    LOGDB : TpFIBDatabase;
    LOGtrWrite: TpFIBTransaction;
    LOGtrRead: TpFIBTransaction;
    //
    PGconn: TUniConnection;
    MnUniTransaction : TUniTransaction;
    //
    OraConn: TOracleSession;
    //
    vUserRole : SmallInt; // роль юзера 1-sysdba
    //
    v_1_7_DB_LOG_WRITE ,  // писать лог в БД

    v_isPostgres,
    v_isWLPostgres,
    v_isWADOPostgres : Boolean; // если true то работаем с Postgres
    vWL_pg_port     : Integer;
    vWL_pg_database ,
    vWL_pg_server   ,
    vWL_pg_user     ,
    vWL_pg_password ,
    vWL_pg_Schema   : string;
    vWADO_pg_port     : Integer;
    vWADO_pg_database ,
    vWADO_pg_server   ,
    vWADO_pg_user     ,
    vWADO_pg_password ,
    vWADO_pg_Schema  : string;
    vWL_max_connections,
    vWLMinFreeMemory,
    vWLMaxTimeoutThreadWait,
    vWADO_max_connections,
    vWADOMinFreeMemory,
    vWADOMaxTimeoutThreadWait,
    vPACS_max_connections,
    vPACSMinFreeMemory,
    vPACSMaxTimeoutThreadWait : Integer;

    v_isOracle : Boolean ;  // если true то работаем с Oracle
    v_OraSchema,
    v_OraUser,
    v_OraPassword : string;
    v_pg_port : Integer;
    v_pg_server ,
    v_pg_user ,
    v_pg_password ,
    v_pg_Schema ,
    v_pg_database,
    //
    v_accessionnumberTMP,
    //
    sBase, sWLBase, sLOGBase : string;
    //
    vIsSendWlToMisPacNet : Boolean;
    vPACSSendToMisPacNet  : Boolean;
    vPACSSend_pg_port : Integer;
    vPACSSend_pg_database ,
    vPACSSend_pg_server   ,
    vPACSSend_pg_user     ,
    vPACSSend_pg_password ,
    vPACSSend_pg_Schema   : string;  
    //
    v_WLAmmStoreDays,
    v_WLTimeCheckPacNet : Integer;
    v_WLSend_pg_port : Integer;
    v_WLSend_pg_database ,
    v_WLSend_pg_server   ,
    v_WLSend_pg_user     ,
    v_WLSend_pg_password ,
    v_WLSend_pg_Schema   : string;
    //
    v_teIPWORKLIST,
    v_AEWORKLIST ,
    v_PortWORKLIST : String;

    v_MPPS,
    v_CheckAEWorklist ,
    v_LOGWorklist     : Boolean;

    v_WADOhostname : string;
    v_WADOport     : Integer;
    v_is_WADOlog   : Boolean;
    //
    v_is_wl_pacs : Integer ; // 0-worklist 1-pacs 2-wado
    //
    v_cbAutoBackup,
    v_cbPACS,
    v_cbWORKLIST,
    v_cbWADO : Boolean;
    v_teCatalogDbBackup,
    v_teHourDbBackup,
    v_teMinuteDbBackup : string;

const c_alias='PACSBASE';
      c_wlalias='WORKLISTBASE';
      c_logalias='LOGBASE';
      c_is_debug = True;

procedure dcmTagRead ( AClientThread: TDicomClientThread  );

implementation

procedure dcmTagRead ( AClientThread: TDicomClientThread  );
var vIBQr : TpFIBDataSet; v_UniQr : TUniQuery; v_OraDS : TOracleDataSet;
  procedure tagcmn ( pDS : TDataSet );
  begin
    with pDS do
    begin
      if not Eof then
      begin
        try
          // ---------------------------------------------------------------------
          if Trim(FieldByName('FC_IMAGETYPE_1').AsString)<>'' then
            v_FC_IMAGETYPE_1:= StrToInt64('$'+Trim(FieldByName('FC_IMAGETYPE_1').AsString));
          if Trim(FieldByName('FC_IMAGETYPE_2').AsString)<>'' then
            v_FC_IMAGETYPE_2:= StrToInt64('$'+Trim(FieldByName('FC_IMAGETYPE_2').AsString));
          // ---------------------------------------------------------------------
          if Trim(FieldByName('FC_STUDYID_1').AsString)<>'' then
            v_FC_STUDYID_1:= StrToInt64('$'+Trim(FieldByName('FC_STUDYID_1').AsString));
          if Trim(FieldByName('FC_STUDYID_2').AsString)<>'' then
            v_FC_STUDYID_2:= StrToInt64('$'+Trim(FieldByName('FC_STUDYID_2').AsString));
          // ---------------------------------------------------------------------
          if Trim(FieldByName('FC_PATIENTID_1').AsString)<>'' then
            v_FC_PATIENTID_1:= StrToInt64('$'+Trim(FieldByName('FC_PATIENTID_1').AsString));
          if Trim(FieldByName('FC_PATIENTID_2').AsString)<>'' then
            v_FC_PATIENTID_2:= StrToInt64('$'+Trim(FieldByName('FC_PATIENTID_2').AsString));
          // ---------------------------------------------------------------------
          if Trim(FieldByName('FC_STUDYDESCRIPTION_1').AsString)<>'' then
            v_FC_STUDYDESCRIPTION_1:= StrToInt64('$'+Trim(FieldByName('FC_STUDYDESCRIPTION_1').AsString));
          if Trim(FieldByName('FC_STUDYDESCRIPTION_2').AsString)<>'' then
            v_FC_STUDYDESCRIPTION_2:= StrToInt64('$'+Trim(FieldByName('FC_STUDYDESCRIPTION_2').AsString));
          // ---------------------------------------------------------------------
          if Trim(FieldByName('FC_ACCESSIONNUMBER_1').AsString)<>'' then
            v_FC_ACCESSIONNUMBER_1:= StrToInt64('$'+Trim(FieldByName('FC_ACCESSIONNUMBER_1').AsString));
          if Trim(FieldByName('FC_ACCESSIONNUMBER_2').AsString)<>'' then
            v_FC_ACCESSIONNUMBER_2:= StrToInt64('$'+Trim(FieldByName('FC_ACCESSIONNUMBER_2').AsString));
          // ---------------------------------------------------------------------
          if Trim(FieldByName('FC_DA_1').AsString)<>'' then
            v_FC_DA_1:= StrToInt64('$'+Trim(FieldByName('FC_DA_1').AsString));
          if Trim(FieldByName('FC_DA_2').AsString)<>'' then
            v_FC_DA_2:= StrToInt64('$'+Trim(FieldByName('FC_DA_2').AsString));
          // ---------------------------------------------------------------------
          if Trim(FieldByName('FC_DT_1').AsString)<>'' then
            v_FC_DT_1:= StrToInt64('$'+Trim(FieldByName('FC_DT_1').AsString));
          if Trim(FieldByName('FC_DT_2').AsString)<>'' then
            v_FC_DT_2:= StrToInt64('$'+Trim(FieldByName('FC_DT_2').AsString));
          // ---------------------------------------------------------------------
          if Trim(FieldByName('FC_STUDYUID_1').AsString)<>'' then
            v_FC_STUDYUID_1:= StrToInt64('$'+Trim(FieldByName('FC_STUDYUID_1').AsString));
          if Trim(FieldByName('FC_STUDYUID_2').AsString)<>'' then
            v_FC_STUDYUID_2:= StrToInt64('$'+Trim(FieldByName('FC_STUDYUID_2').AsString));
          // ---------------------------------------------------------------------
          if Trim(FieldByName('FC_SERIESUID_1').AsString)<>'' then
            v_FC_SERIESUID_1:= StrToInt64('$'+Trim(FieldByName('FC_SERIESUID_1').AsString));
          if Trim(FieldByName('FC_SERIESUID_2').AsString)<>'' then
            v_FC_SERIESUID_2:= StrToInt64('$'+Trim(FieldByName('FC_SERIESUID_2').AsString));
          // ---------------------------------------------------------------------
          if Trim(FieldByName('FC_SERNUM_1').AsString)<>'' then
            v_FC_SERNUM_1:= StrToInt64('$'+Trim(FieldByName('FC_SERNUM_1').AsString));
          if Trim(FieldByName('FC_SERNUM_2').AsString)<>'' then
            v_FC_SERNUM_2:= StrToInt64('$'+Trim(FieldByName('FC_SERNUM_2').AsString));
          // ---------------------------------------------------------------------
          if Trim(FieldByName('FC_PHYSNAME_1').AsString)<>'' then
            v_FC_PHYSNAME_1:= StrToInt64('$'+Trim(FieldByName('FC_PHYSNAME_1').AsString));
          if Trim(FieldByName('FC_PHYSNAME_2').AsString)<>'' then
            v_FC_PHYSNAME_2:= StrToInt64('$'+Trim(FieldByName('FC_PHYSNAME_2').AsString));
          // ---------------------------------------------------------------------
          if Trim(FieldByName('FC_PNAME_1').AsString)<>'' then
            v_FC_PNAME_1:= StrToInt64('$'+Trim(FieldByName('FC_PNAME_1').AsString));
          if Trim(FieldByName('FC_PNAME_2').AsString)<>'' then
            v_FC_PNAME_2:= StrToInt64('$'+Trim(FieldByName('FC_PNAME_2').AsString));
          // ---------------------------------------------------------------------
          if Trim(FieldByName('FC_PDATEBORN_1').AsString)<>'' then
            v_FC_PDATEBORN_1:= StrToInt64('$'+Trim(FieldByName('FC_PDATEBORN_1').AsString));
          if Trim(FieldByName('FC_PDATEBORN_2').AsString)<>'' then
            v_FC_PDATEBORN_2:= StrToInt64('$'+Trim(FieldByName('FC_PDATEBORN_2').AsString));
          // ---------------------------------------------------------------------
          if Trim(FieldByName('FC_PSEX_1').AsString)<>'' then
            v_FC_PSEX_1:= StrToInt64('$'+Trim(FieldByName('FC_PSEX_1').AsString));
          if Trim(FieldByName('FC_PSEX_2').AsString)<>'' then
            v_FC_PSEX_2:= StrToInt64('$'+Trim(FieldByName('FC_PSEX_2').AsString));
          // ---------------------------------------------------------------------
          if Trim(FieldByName('FC_AID_1').AsString)<>'' then
            v_FC_AID_1:= StrToInt64('$'+Trim(FieldByName('FC_AID_1').AsString));
          if Trim(FieldByName('FC_AID_2').AsString)<>'' then
            v_FC_AID_2:= StrToInt64('$'+Trim(FieldByName('FC_AID_2').AsString));
          // ---------------------------------------------------------------------
          if Trim(FieldByName('FC_ACQNUM_1').AsString)<>'' then
            v_FC_ACQNUM_1:= StrToInt64('$'+Trim(FieldByName('FC_ACQNUM_1').AsString));
          if Trim(FieldByName('FC_ACQNUM_2').AsString)<>'' then
            v_FC_ACQNUM_2:= StrToInt64('$'+Trim(FieldByName('FC_ACQNUM_2').AsString));
          // ---------------------------------------------------------------------
          if Trim(FieldByName('FC_INSTANCEUID_1').AsString)<>'' then
            v_FC_INSTANCEUID_1:= StrToInt64('$'+Trim(FieldByName('FC_INSTANCEUID_1').AsString));
          if Trim(FieldByName('FC_INSTANCEUID_2').AsString)<>'' then
            v_FC_INSTANCEUID_2:= StrToInt64('$'+Trim(FieldByName('FC_INSTANCEUID_2').AsString));
          // ---------------------------------------------------------------------
          if Trim(FieldByName('FC_KIN_1').AsString)<>'' then
            v_FC_KIN_1:= StrToInt64('$'+Trim(FieldByName('FC_KIN_1').AsString));
          if Trim(FieldByName('FC_KIN_2').AsString)<>'' then
            v_FC_KIN_2:= StrToInt64('$'+Trim(FieldByName('FC_KIN_2').AsString));
          // ---------------------------------------------------------------------
        except
          MnFl_ev('!!! ERROR !!! StrToInt64 conversion error', 'error.log' );
        end;
      end;
    end;
  end;
begin
  if v_isOracle then begin               // ORACLE
    v_OraDS := TOracleDataSet.Create(nil);
    try
      v_OraDS.Session := AClientThread.OraConn;
      v_OraDS.SQL.Text := 'select * from TAGS where FC_TITLE=:p_FC_TITLE';
      v_OraDS.DeclareAndSet('p_FC_TITLE', otString  , (AClientThread as TDicomClientThread).Association.Request.CallingTitle );
      v_OraDS.Open; v_OraDS.First;
      tagcmn(v_OraDS);  
    finally
      v_OraDS.Close;
      v_OraDS.Free;
    end;
  end else if v_isPostgres then begin    // Postgres
    v_UniQr := TUniQuery.Create(nil);
    try
      v_UniQr.Connection:=AClientThread.PGconn;
      v_UniQr.Transaction:=AClientThread.PGTrans;
      v_UniQr.SQL.Text := 'select * from '+v_pg_Schema+'.tags where fc_title=:p_FC_TITLE';
      v_UniQr.ParamByName('p_FC_TITLE').AsString  := (AClientThread as TDicomClientThread).Association.Request.CallingTitle;
      v_UniQr.Open; v_UniQr.First;
      tagcmn(v_UniQr);
    finally
      v_UniQr.Close;
      v_UniQr.Free;
    end;
  end else begin
    vIBQr:= TpFIBDataSet.Create(nil);
    try
      vIBQr.Database    := (AClientThread.v_ClThr_DB as TpFIBDatabase);
      vIBQr.Transaction := AClientThread.v_ClThr_trRead as TpFIBTransaction;
      //
      vIBQr.SelectSQL.Text:='select * from TAGS where FC_TITLE=:p_FC_TITLE';
      vIBQr.ParamByName('p_FC_TITLE').AsString  := (AClientThread as TDicomClientThread).Association.Request.CallingTitle;
      vIBQr.Open; vIBQr.First;
      tagcmn(vIBQr);
    finally
      vIBQr.Close;
      vIBQr.Free;
    end;
  end;
end;

procedure trWriteStart;
begin
  if DB_CMN.trWrite.Active = False then
      DB_CMN.trWrite.Active := True;
end;

procedure trReadStart;
begin
  if DB_CMN.trRead.Active = False then
      DB_CMN.trRead.Active := True;
end;

procedure cmn_trans_start;
begin
  if DB_CMN.DB.Connected = True then
  begin
    trWriteStart;
    trReadStart;
  end;
end;

procedure cmn_ins_add ( var p_str:ansistring );
begin
  if p_str <> '' then
    p_str := p_str + ' and ';
end;
function MySetSQL ( p_fld_name:string; p_cmn_str:string ):string;
begin
  Result := ' '+Trim(p_fld_name)+' '+p_cmn_str;
end;
function gtTabName( p_table_Name:string ):string;
begin
  if v_isOracle then     // ORACLE
  begin
    Result := ' '+Trim(p_table_Name)+' ';
  end else if v_isPostgres then begin
    Result := ' '+v_pg_Schema+'.'+Trim(p_table_Name)+' ';
  end else begin
    Result := ' '+Trim(p_table_Name)+' ';
  end;
end;
function gtFldName( p_Fld_Name:string ):string;
begin
  Result := Trim(p_Fld_Name);
end;

// функция формирования строки об ошибках в SQL-запросе
function lg_SQL( const FIBQuery:TUniQuery; const p_ClassName:AnsiString; const p_Message:AnsiString ):AnsiString; overload;
var i:Integer; v_res, v_paramname : AnsiString;
const c_eol = #13;
begin
  v_res:='error raised : '+p_ClassName+' message : '+p_Message+' SQL: '''+FIBQuery.SQL.Text+''' '+c_eol;
  for I := 0 to FIBQuery.ParamCount - 1 do
  begin
    v_paramname:=FIBQuery.Params[i].Name;
    if not VarIsNull( FIBQuery.Params[i].Value ) then
      v_res:= v_res + 'ParamName='''+v_paramname+''' ParamValue='''+vartostr(FIBQuery.Params[i].Value)+''''+c_eol;
  end;
  Result := v_res;
end;

// функция формирования строки об ошибках в SQL-запросе
function lg_SQL( const FIBQuery:TpFIBQuery; const p_ClassName:AnsiString; const p_Message:AnsiString ):AnsiString; overload;
var i:Integer; v_res, v_paramname : AnsiString;
const c_eol = #13;
begin
  v_res:='error raised : '+p_ClassName+' message : '+p_Message+' SQL: '''+FIBQuery.SQL.Text+''' '+c_eol;
  for I := 0 to FIBQuery.ParamCount - 1 do begin
    v_paramname:=FIBQuery.ParamName(i);
    if not VarIsNull(FIBQuery.ParamValue(v_paramname)) then
      v_res:= v_res + 'ParamName='''+v_paramname+''' ParamValue='''+vartostr(FIBQuery.ParamValue(v_paramname))+''''+c_eol;
  end;
  Result:= v_res;
end;

function lg_SQLDS( const FIBQuery:TpFIBDataSet; const p_ClassName:AnsiString; const p_Message:AnsiString ):AnsiString;
var i:Integer; v_res, v_paramname : AnsiString;
const c_eol = #13;
begin
  v_res:='error raised : '+p_ClassName+' message : '+p_Message+' SQL: '''+FIBQuery.SelectSQL.Text+''' '+c_eol;
  for I := 0 to FIBQuery.ParamCount - 1 do begin
    v_paramname:=FIBQuery.ParamName(i);
    if not VarIsNull(FIBQuery.ParamValue(v_paramname)) then
      v_res:= v_res + 'ParamName='''+v_paramname+''' ParamValue='''+vartostr(FIBQuery.ParamValue(v_paramname))+''''+c_eol;
  end;
  lg_SQLDS:= v_res;
end;

// общая процедура чтения параметров соединения с БД
procedure cmn_db_params_read(Ini : TIniFile);
begin
  v_isOracle    := (Ini.ReadInteger(cBase, 'use_oracle', 0)=1);
  v_isPostgres:=(Ini.ReadInteger(cBase, 'use_postgres', 0)=1);
  //
  {
   cPN2 = 'PG_database';
      cPN3 = 'PG_port';
      cPN4 = 'PG_server';
      cPN5 = 'PG_user';
      cPN6 = 'PG_password';
      cPN7 = 'PG_schema';
   }

  v_isWLPostgres   :=(Ini.ReadInteger(cWorkList, 'use_postgres', 0)=1);
  v_isWADOPostgres :=(Ini.ReadInteger(cWADO, 'use_postgres', 0)=1);
  if v_isWLPostgres then
  begin
    vWL_pg_database := Ini.ReadString(cWorkList, cPN2, 'database');
    vWL_pg_port     := Ini.ReadInteger(cWorkList,cPN3, 0);
    vWL_pg_server   := Ini.ReadString(cWorkList, cPN4, 'localhost');
    vWL_pg_user     := Ini.ReadString(cWorkList, cPN5, 'user');
    vWL_pg_password := Ini.ReadString(cWorkList, cPN6, 'password');
    vWL_pg_Schema   := Ini.ReadString(cWorkList, cPN7, 'schema');
  end;
  if v_isWADOPostgres then
  begin
    vWADO_pg_database := Ini.ReadString(cWADO, cPN2, 'database');
    vWADO_pg_port     := Ini.ReadInteger(cWADO,cPN3, 0);
    vWADO_pg_server   := Ini.ReadString(cWADO, cPN4, 'localhost');
    vWADO_pg_user     := Ini.ReadString(cWADO, cPN5, 'user');
    vWADO_pg_password := Ini.ReadString(cWADO, cPN6, 'password');
    vWADO_pg_Schema   := Ini.ReadString(cWADO, cPN7, 'schema');
  end;
  vWL_max_connections        := Ini.ReadInteger(cWorkList,cWL_max_connections, 0);
  vWLMinFreeMemory           := Ini.ReadInteger(cWorkList,cWLMinFreeMemory, 0);
  vWLMaxTimeoutThreadWait    := Ini.ReadInteger(cWorkList,cWLMaxTimeoutThreadWait, 0);
  vWADO_max_connections      := Ini.ReadInteger(cWADO,cWADO_max_connections, 0);
  vWADOMinFreeMemory         := Ini.ReadInteger(cWADO,cWADOMinFreeMemory, 0);
  vWADOMaxTimeoutThreadWait  := Ini.ReadInteger(cWADO,cWADOMaxTimeoutThreadWait, 0);
  vPACS_max_connections      := Ini.ReadInteger(cBase,cPACS_max_connections, 0);
  vPACSMinFreeMemory         := Ini.ReadInteger(cBase,cPACSMinFreeMemory, 0);
  vPACSMaxTimeoutThreadWait  := Ini.ReadInteger(cBase,cPACSMaxTimeoutThreadWait, 0);
  try
    Ini.WriteInteger(cWorkList, 'use_postgres', MyBoolToInt(v_isWLPostgres));
    Ini.WriteInteger(cWADO, 'use_postgres', MyBoolToInt(v_isWADOPostgres));
    if v_isWLPostgres then
    begin
      Ini.WriteString(cWorkList, cPN2, vWL_pg_database);
      Ini.WriteInteger(cWorkList,cPN3, vWL_pg_port);
      Ini.WriteString(cWorkList, cPN4, vWL_pg_server);
      Ini.WriteString(cWorkList, cPN5, vWL_pg_user);
      Ini.WriteString(cWorkList, cPN6, vWL_pg_password);
      Ini.WriteString(cWorkList, cPN7, vWL_pg_Schema);
    end;
    if v_isWADOPostgres then
    begin
      Ini.WriteString(cWADO, cPN2, vWADO_pg_database);
      Ini.WriteInteger(cWADO,cPN3, vWADO_pg_port);
      Ini.WriteString(cWADO, cPN4, vWADO_pg_server);
      Ini.WriteString(cWADO, cPN5, vWADO_pg_user);
      Ini.WriteString(cWADO, cPN6, vWADO_pg_password);
      Ini.WriteString(cWADO, cPN7, vWADO_pg_Schema);
    end;
    Ini.WriteInteger(cWorkList,cWL_max_connections, vWL_max_connections);
    Ini.WriteInteger(cWorkList,cWLMinFreeMemory, vWLMinFreeMemory);
    Ini.WriteInteger(cWorkList,cWLMaxTimeoutThreadWait, vWLMaxTimeoutThreadWait);
    Ini.WriteInteger(cWADO,cWADO_max_connections, vWADO_max_connections);
    Ini.WriteInteger(cWADO,cWADOMinFreeMemory, vWADOMinFreeMemory);
    Ini.WriteInteger(cWADO,cWADOMaxTimeoutThreadWait, vWADOMaxTimeoutThreadWait);
    Ini.WriteInteger(cBase,cPACS_max_connections, vPACS_max_connections);
    Ini.WriteInteger(cBase,cPACSMinFreeMemory, vPACSMinFreeMemory);
    Ini.WriteInteger(cBase,cPACSMaxTimeoutThreadWait, vPACSMaxTimeoutThreadWait);
  except
  end;
  // ---------------------------------------------------------------------------
  // send accessionnumber from PACS to MIS while receive new study
  vPACSSendToMisPacNet :=(Ini.ReadInteger(cPACIENTNET, cPN1, 0)=1);
  vPACSSend_pg_database := Ini.ReadString(cPACIENTNET, cPN2, 'database');
  vPACSSend_pg_port     := Ini.ReadInteger(cPACIENTNET,cPN3, 0);
  vPACSSend_pg_server   := Ini.ReadString(cPACIENTNET, cPN4, 'localhost');
  vPACSSend_pg_user     := Ini.ReadString(cPACIENTNET, cPN5, 'user');
  vPACSSend_pg_password := Ini.ReadString(cPACIENTNET, cPN6, 'password');
  vPACSSend_pg_Schema   := Ini.ReadString(cPACIENTNET, cPN7, 'schema');
  try
    Ini.WriteInteger(cPACIENTNET, cPN1, MyBoolToInt(vPACSSendToMisPacNet) );
    Ini.WriteString(cPACIENTNET, cPN2, vPACSSend_pg_database);
    Ini.WriteInteger(cPACIENTNET, cPN3, vPACSSend_pg_port);
    Ini.WriteString(cPACIENTNET, cPN4, vPACSSend_pg_server);
    Ini.WriteString(cPACIENTNET, cPN5, vPACSSend_pg_user);
    Ini.WriteString(cPACIENTNET, cPN6, vPACSSend_pg_password);
    Ini.WriteString(cPACIENTNET, cPN7, vPACSSend_pg_Schema);
  except
  end;
  // ---------------------------------------------------------------------------
  // check list of accessionnumber from worklist
  v_WLTimeCheckPacNet := Ini.ReadInteger(cPACIENTNETWORKLIST,cPN9, 0);
  v_WLSend_pg_database := Ini.ReadString(cPACIENTNETWORKLIST, cPN2, 'database');
  v_WLSend_pg_port     := Ini.ReadInteger(cPACIENTNETWORKLIST,cPN3, 0);
  v_WLSend_pg_server   := Ini.ReadString(cPACIENTNETWORKLIST, cPN4, 'localhost');
  v_WLSend_pg_user     := Ini.ReadString(cPACIENTNETWORKLIST, cPN5, 'user');
  v_WLSend_pg_password := Ini.ReadString(cPACIENTNETWORKLIST, cPN6, 'password');
  v_WLSend_pg_Schema   := Ini.ReadString(cPACIENTNETWORKLIST, cPN7, 'schema');
  vIsSendWlToMisPacNet := Ini.ReadInteger(cPACIENTNETWORKLIST, cPN10, 0)=1;
  v_WLAmmStoreDays     := Ini.ReadInteger(cPACIENTNETWORKLIST,cPN8, 0);
  try
    Ini.WriteInteger(cPACIENTNETWORKLIST, cPN9, v_WLTimeCheckPacNet);
    Ini.WriteString(cPACIENTNETWORKLIST, cPN2,  v_WLSend_pg_database);
    Ini.WriteInteger(cPACIENTNETWORKLIST, cPN3, v_WLSend_pg_port);
    Ini.WriteString(cPACIENTNETWORKLIST, cPN4,  v_WLSend_pg_server);
    Ini.WriteString(cPACIENTNETWORKLIST, cPN5,  v_WLSend_pg_user);
    Ini.WriteString(cPACIENTNETWORKLIST, cPN6,  v_WLSend_pg_password);
    Ini.WriteString(cPACIENTNETWORKLIST, cPN7,  v_WLSend_pg_Schema);
    Ini.WriteInteger(cPACIENTNETWORKLIST, cPN8, v_WLAmmStoreDays);
    Ini.WriteInteger(cPACIENTNETWORKLIST, cPN10, MyBoolToInt(vIsSendWlToMisPacNet) );
  except
  end;
  // ---------------------------------------------------------------------------
  //
  if v_isOracle then     // ORACLE
  begin
    v_isPostgres:=False;

    v_OraSchema   := Ini.ReadString(cBase, 'oracle_schema', 'pacs');
    v_OraUser     := Ini.ReadString(cBase, 'oracle_user', 'pacs');
    v_OraPassword := Ini.ReadString(cBase, 'oracle_password', 'pacs123');
    try
      Ini.WriteString(cBase, 'oracle_schema', v_OraSchema);
      Ini.WriteString(cBase, 'oracle_user', v_OraUser);
      Ini.WriteString(cBase, 'oracle_password', v_OraPassword);
    except
    end;
  end else if v_isPostgres then   // POSTGRES
  begin
    sBase:='';  // чтобы ругалось при обращении
    v_pg_database := Ini.ReadString(cBase, 'postgres_database', 'database');
    v_pg_port     := Ini.ReadInteger(cBase,'postgres_port', 0);
    v_pg_server   := Ini.ReadString(cBase, 'postgres_server', 'localhost');
    v_pg_user     := Ini.ReadString(cBase, 'postgres_user', 'user');
    v_pg_password := Ini.ReadString(cBase, 'postgres_password', 'password');
    v_pg_Schema   := Ini.ReadString(cBase, 'postgres_schema', 'schema');
    try
      Ini.WriteString(cBase, 'postgres_database', v_pg_database);
      Ini.WriteInteger(cBase, 'postgres_port', v_pg_port);
      Ini.WriteString(cBase, 'postgres_server', v_pg_server);
      Ini.WriteString(cBase, 'postgres_user', v_pg_user);
      Ini.WriteString(cBase, 'postgres_password', v_pg_password);
      Ini.WriteString(cBase, 'postgres_schema', v_pg_Schema);
    except
    end;
  end else
  begin // firebird
    sBase := Ini.ReadString(cBase, 'DBNAME', 'C:\PACS\PACSDB.GDB');
    sWLBase := Ini.ReadString(cBase, 'WORKLISTDBNAME', 'C:\PACS\WORKLISTDB.GDB');
    sLOGBase := Ini.ReadString(cBase, 'LOGDBNAME', 'C:\PACS\LOGDB.GDB');
    try
      Ini.WriteString(cBase, 'DBNAME', sBase);
      Ini.WriteString(cBase, 'WORKLISTDBNAME', sWLBase);
      Ini.WriteString(cBase, 'LOGDBNAME', sLOGBase);
    except
    end;
    v_pg_port :=0;  // чтобы ругалось при обращении
    v_pg_server :='';
    v_pg_user :='';
    v_pg_password :='';
    v_pg_database :='';
  end;
  //
  try
    Ini.WriteInteger(cBase, 'use_postgres', MyBoolToInt(v_isPostgres) );
    Ini.WriteInteger(cBase, 'use_oracle', MyBoolToInt(v_isOracle) );
  except
  end;
end;

procedure Logout(DataBase: TpFIBDatabase);
var i: Integer;
begin
  if not DataBase.Connected then
    Exit;
  for i := 0 to DataBase.TransactionCount - 1 do
    if TpFIBTransaction(DataBase.Transactions[i]).InTransaction then
      TpFIBTransaction(DataBase.Transactions[i]).Commit;
  DataBase.CloseDataSets;
  DataBase.Close;
end;

function f_FbWriteTransactCreate (p_DB : TpFIBDatabase) : TpFIBTransaction;
var v_trWrite : TpFIBTransaction;
begin
  v_trWrite:= f_FbWriteTransactCreateNS(p_DB);
  v_trWrite.StartTransaction;
  Result:=v_trWrite;
end;

function f_FbWriteTransactCreateNS (p_DB : TpFIBDatabase) : TpFIBTransaction;
var v_trWrite : TpFIBTransaction;
begin
  v_trWrite:= TpFIBTransaction.Create(nil);
  v_trWrite.DefaultDatabase := p_DB;
  v_trWrite.TimeoutAction := FIBDatabase.TARollback ;
  v_trWrite.TPBMode := tpbReadCommitted ;
  Result:=v_trWrite;
end;

function f_FbReadTransactCreate (p_DB : TpFIBDatabase) : TpFIBTransaction;
var v_trRead : TpFIBTransaction;
begin
  v_trRead:= f_FbWriteTransactCreateNS(p_DB);
  v_trRead.StartTransaction;
  Result:=v_trRead;
end;

function f_FbReadTransactCreateNS (p_DB : TpFIBDatabase) : TpFIBTransaction;
var v_trRead : TpFIBTransaction;
begin
  v_trRead:= TpFIBTransaction.Create(nil);
  v_trRead.DefaultDatabase := p_DB;
  v_trRead.TimeoutAction := FIBDatabase.TARollback ;
  v_trRead.TPBMode := tpbDefault; // tpbReadCommitted ;
  v_trRead.TRParams.Clear;
  v_trRead.TRParams.Add('isc_tpb_read');
  v_trRead.TRParams.Add('isc_tpb_nowait');
  v_trRead.TRParams.Add('isc_tpb_read_committed');
  v_trRead.TRParams.Add('isc_tpb_rec_version');
  Result:=v_trRead;
end;

function f_fb_db_crt (AliasName:string): TpFIBDatabase;
var v_db : TpFIBDatabase;
begin
  v_db := TpFIBDatabase.Create(nil);
//  v_db.AliasName := AliasName;
  v_db.DBName := AliasName;
  v_db.ConnectParams.UserName := 'sysdba';
  v_db.ConnectParams.Password := 'masterkey';
  v_db.SQLDialect := 3;
  try
      v_db.Connected := True;
    Result:=v_db;
  except
    on e: EFIBError do begin
      MnLg_ev ( 'db.Connected FIB ERROR CODE = '+e.ClassName+' ('+inttostr(e.IBErrorCode)+') '+e.IBMessage+#13+e.Message, gt_app_name+'.err' );
      Result:=nil;
    end;
    on e:Exception do
    begin
      MnLg_ev ( 'db.Connected ERROR '+e.ClassName+' '+#13+e.Message, gt_app_name+'.err' );
  //    MessageDlg('Ошибка создания соединения с БД : '+#13+e.Message, mtWarning, [mbOK], 0);
      Result:=nil;
    end;
  end;
//  if Result=nil then
//    MessageDlg('Невозможно установить соединение с БД : AliasName='+AliasName, mtError, [mbOK], 0);
end;

function PGTransCreate (p_conn:TUniConnection) : TUniTransaction;
var v_trans : TUniTransaction;
begin
  v_trans := TUniTransaction.Create(nil);
  v_trans.DefaultConnection:=p_conn;
  Result:=v_trans;
end;

function PgConnCrt ( p_is_conn : Boolean = True ) : TUniConnection;
var v_PGconn : TUniConnection;
begin
  v_PGconn:= TUniConnection.Create(nil);
  v_PGconn.LoginPrompt:=False;
//  v_PGconn.Debug:=True;
  v_PGconn.ProviderName := 'PostgreSQL';
  v_PGconn.Database := v_pg_database;
  v_PGconn.Port := v_pg_port;
  v_PGconn.Server := v_pg_server;
  v_PGconn.SpecificOptions.Values['Schema'] := v_pg_Schema;
  v_PGconn.SpecificOptions.Values['UseUnicode'] := 'True';
  v_PGconn.Username := v_pg_user;
  v_PGconn.Password := v_pg_password;
  Result := v_PGconn;
  if p_is_conn then
    try
      v_PGconn.Connected := True;
    except
      on e:Exception do
        begin
          v_PGconn.Free;
          MnLg_ev ( '#7.1 ERROR : '+e.ClassName + ' : ' + e.Message +#13#10+
                    ' v_PGconn.Database = '+v_pg_database +#13#10+
                    ' v_PGconn.Port = '+inttostr(v_pg_port) +#13#10+
                    ' v_PGconn.Server = '+v_pg_server +#13#10+
                    ' Schema = '+ v_pg_Schema +#13#10+
                    ' v_PGconn.Username = '+v_pg_user +#13#10+
                    ' v_PGconn.Password = '+v_pg_password +#13#10
                    , gt_app_name+'.err' );
          Result := nil;
        end;
    end;
end;

procedure PgFree ( p_PGconn: TUniConnection;
                   p_PGTrans : TUniTransaction
                 );
begin
  if p_PGconn.Connected then
    p_PGconn.Connected:=False;
  try
    p_PGTrans.Free;
  except
    on e:Exception do
      MnLg_ev ( e.Message+#13+'ERROR - Ошибка освобождения соединения с Postgres', gt_app_name+'.err' );
  end;
  try
    p_PGconn.Free;
  except
    on e:Exception do
      MnLg_ev ( e.Message+#13+'ERROR - Ошибка освобождения транзакции Postgres', gt_app_name+'.err' );
  end;
end;

procedure p_free_conn_fb ( p_DB : TpFIBDatabase;
                           p_trWrite: TpFIBTransaction;
                           p_trRead: TpFIBTransaction
                         );
begin
  if p_trRead<>nil then
  try
    if p_trRead.State in [tsActive,tsDoCommitRetaining] then
      p_trRead.Commit;
  except
    on e:Exception do
      MnLg_ev ( e.Message+#13+'ERROR - Ошибка trRead.Commit firebird', gt_app_name+'.err' );
  end;
  if p_trWrite<>nil then
  try
    if p_trWrite.State in [tsActive,tsDoCommitRetaining] then
      p_trWrite.Commit;
  except
    on e:Exception do
      MnLg_ev ( e.Message+#13+'ERROR - Ошибка trWrite.Commit firebird', gt_app_name+'.err' );
  end;
  if p_DB<>nil then
  begin
    if p_DB.Connected then
      p_DB.Connected := False;
    Logout(p_DB);
    try
      p_DB.Free;
    except
      on e:Exception do
        MnLg_ev ( e.Message+#13+'ERROR - Ошибка освобождения соединения с Firebird', gt_app_name+'.err' );
    end;
  end;
  if p_trRead<>nil then
  try
    p_trRead.Free;
  except
    on e:Exception do
      MnLg_ev ( e.Message+#13+'ERROR - Ошибка освобождения trRead firebird', gt_app_name+'.err' );
  end;
  if p_trWrite<>nil then
  try
    p_trWrite.Free;
  except
    on e:Exception do
      MnLg_ev ( e.Message+#13+'ERROR - Ошибка освобождения trWrite firebird', gt_app_name+'.err' );
  end;
end;

// функция создания соединения с oracle
function OraConnCrt (p_is_conn:Boolean = True) : TOracleSession ;
var vOraSession : TOracleSession;
begin
  vOraSession:= TOracleSession.Create(nil);
  vOraSession.LogonUsername := v_OraUser;
  vOraSession.LogonPassword := v_OraPassword;
  vOraSession.LogonDatabase := v_OraSchema;
  Result := vOraSession;
  if p_is_conn then
    try
      vOraSession.Connected := True;
    except
      on e:Exception do
        begin
          vOraSession.Free;
          MnLg_ev ( e.Message, gt_app_name+'.err' );
          Result := nil;
        end;
    end
 { else
    Result := nil;  }
end;

// процедура закрытия транзакции oracle и освобождение соединения
procedure OraFree ( p_Oraconn: TOracleSession );
begin
  if p_Oraconn.Connected then p_Oraconn.Connected:=False;
  p_Oraconn.Free;
end;

procedure Lg_ev  ( p_strs : ansistring;
                   p_filename : ansistring = '';
                   p_is_delim : Boolean = False;
                   p_1_7_IS_LOG_WRITE : Boolean = True );
begin
  Application.ProcessMessages;
  if p_1_7_IS_LOG_WRITE then
  begin
    if trim(p_filename)='' then begin
      MnLg_ev(p_strs,ExtractFilePath(paramstr(0))+'dcmevents.log');
    end else begin
      MnLg_ev(p_strs,p_filename);
    end;
  end;
end;

function EVENTS_RSND_ins (   p_isOracle : Boolean;
                             pOraConn : TOracleSession;
                             p_isPostgres : Boolean;
                             p_PGconn: TUniConnection;
                             p_PGTrans : TUniTransaction;
                             p_DB: TpFIBDatabase;
                             p_trWrite : TpFIBTransaction;
                             p_FC_CALLINGTITLE : String;
                             p_FC_CALLEDTITLE : String;
                             p_FC_STUDYUID : String;
                             p_FC_MODALITY : String;
                             p_FD_STUDYDATE : TDateTime;
                             p_FD_DATE : TDateTime;
                             p_FN_AMM : Integer;
                             p_FC_PATIENTID : String;
                             p_FC_PATIENTNAME : String;
                             p_P_ENAME : String;
                             p_ACCESSIONNUMBER : String;
                             p_FN_AMM_ERR : Integer;
                             p_1_7_IS_LOG_WRITE : Boolean = True
                          ):integer;
const  c_sql_str0 = 'INSERT INTO EVENTS_RSND ( ';
       c_sql_str1 = ' FN_TYPE ,'+
                   ' FC_CALLINGTITLE ,'+
                   ' FC_CALLEDTITLE ,'+
                   ' FC_STUDYUID ,'+
                   ' FC_MODALITY ,'+
                   ' FD_STUDYDATE ,'+
                   ' FD_DATE ,'+
                   ' FN_AMM ,'+
                   ' FN_AMM_ERR, '+
                   ' FC_PATIENTID, '+
                   ' FC_PATIENTNAME, '+
                   ' FC_ENAME, '+
                   ' FC_ACCESSIONNUMBER '+
               ' ) VALUES ( '+
                   ' :p_FN_TYPE ,'+
                   ' :p_FC_CALLINGTITLE ,'+
                   ' :p_FC_CALLEDTITLE ,'+
                   ' :p_FC_STUDYUID ,'+
                   ' :p_FC_MODALITY ,'+
                   ' :p_FD_STUDYDATE ,'+
                   ' :p_FD_DATE ,'+
                   ' :p_FN_AMM ,'+
                   ' :p_FN_AMM_ERR, '+
                   ' :p_FC_PATIENTID, '+
                   ' :p_FC_PATIENTNAME, '+
                   ' :p_P_ENAME, '+
                   ' :p_ACCESSIONNUMBER '+
                   '  ) RETURNING FK_ID ';
var FIBQuery: TpFIBQuery; v_UniQr : TUniQuery; v_ID_RSND:Integer; v_OraQr : TOracleQuery;
begin
  if p_isOracle then begin
    v_OraQr := TOracleQuery.Create(nil);
    try
      v_OraQr.Session := pOraConn;
      v_OraQr.SQL.Text := 'INSERT INTO events_rsnd ( '+
                   ' FN_TYPE ,'+
                   ' FC_CALLINGTITLE ,'+
                   ' FC_CALLEDTITLE ,'+
                   ' FC_STUDYUID ,'+
                   ' FC_MODALITY ,'+
                   ' FD_STUDYDATE ,'+
                   ' FD_DATE ,'+
                   ' FN_AMM ,'+
                   ' FN_AMM_ERR, '+
                   ' FC_PATIENTID, '+
                   ' FC_PATIENTNAME, '+
                   ' FC_ENAME, '+
                   ' FC_ACCESSIONNUMBER '+
               ' ) VALUES ( '+
                   ' :p_FN_TYPE ,'+
                   ' :p_FC_CALLINGTITLE ,'+
                   ' :p_FC_CALLEDTITLE ,'+
                   ' :p_FC_STUDYUID ,'+
                   ' :p_FC_MODALITY ,'+
                   ' :p_FD_STUDYDATE ,'+
                   ' :p_FD_DATE ,'+
                   ' :p_FN_AMM ,'+
                   ' :p_FN_AMM_ERR, '+
                   ' :p_FC_PATIENTID, '+
                   ' :p_FC_PATIENTNAME, '+
                   ' :p_P_ENAME, '+
                   ' :p_ACCESSIONNUMBER '+
                   '  ) RETURNING FK_ID ';
    //  FIBQuery.ParamByName('p_FK_ID').AsInteger            := p_ID;
      v_OraQr.DeclareAndSet( 'p_FC_CALLINGTITLE', otString , p_FC_CALLINGTITLE );
      v_OraQr.DeclareAndSet('p_FC_CALLEDTITLE', otString   , p_FC_CALLEDTITLE );
      v_OraQr.DeclareAndSet('p_FC_STUDYUID', otString      , p_FC_STUDYUID );
      v_OraQr.DeclareAndSet('p_FC_MODALITY', otString      , p_FC_MODALITY );
      v_OraQr.DeclareAndSet('p_FD_STUDYDATE', otDate       , p_FD_STUDYDATE );
      v_OraQr.DeclareAndSet('p_FD_DATE', otDate            , p_FD_DATE );
      v_OraQr.DeclareAndSet('p_FN_AMM', otInteger          , p_FN_AMM );
      if p_FN_AMM_ERR=0 then
        v_OraQr.DeclareAndSet('p_FN_TYPE', otInteger       , 0 )
      else
        v_OraQr.DeclareAndSet('p_FN_TYPE', otInteger        , 1 );
      v_OraQr.DeclareAndSet('p_FC_PATIENTID', otString      , p_FC_PATIENTID );
      v_OraQr.DeclareAndSet('p_FC_PATIENTNAME', otString    , p_FC_PATIENTNAME );
      v_OraQr.DeclareAndSet('p_P_ENAME', otString           , p_P_ENAME );
      v_OraQr.DeclareAndSet('p_ACCESSIONNUMBER', otString   , p_ACCESSIONNUMBER );
      v_OraQr.DeclareAndSet('p_FN_AMM_ERR', otInteger       , p_FN_AMM_ERR );
      try
        v_OraQr.Execute;
      except
        on e:Exception do
          begin
            Lg_ev(e.Message,'',False, p_1_7_IS_LOG_WRITE);
            Result:=0;
            Exit;
          end;
      end;
      v_ID_RSND:=v_OraQr.FieldAsInteger('FK_ID');
      Result:=v_ID_RSND;
    finally
      v_OraQr.Free;
    end;
  end else if p_isPostgres then
  begin
    v_UniQr := TUniQuery.Create(nil);
    try
      v_UniQr.Connection:=p_PGconn;
      v_UniQr.Transaction:=p_PGTrans;
      v_UniQr.SQL.Text := 'INSERT INTO '+v_pg_Schema+'.events_rsnd ( '+
                   ' fn_type ,'+
                   ' fc_callingtitle ,'+
                   ' fc_calledtitle ,'+
                   ' fc_studyuid ,'+
                   ' fc_modality ,'+
                   ' fd_studydate ,'+
                   ' fd_date ,'+
                   ' fn_amm ,'+
                   ' fn_amm_err, '+
                   ' fc_patientid, '+
                   ' fc_patientname, '+
                   ' fc_ename, '+
                   ' fc_accessionnumber '+
               ' ) VALUES ( '+
                   ' :p_FN_TYPE ,'+
                   ' :p_FC_CALLINGTITLE ,'+
                   ' :p_FC_CALLEDTITLE ,'+
                   ' :p_FC_STUDYUID ,'+
                   ' :p_FC_MODALITY ,'+
                   ' :p_FD_STUDYDATE ,'+
                   ' :p_FD_DATE ,'+
                   ' :p_FN_AMM ,'+
                   ' :p_FN_AMM_ERR, '+
                   ' :p_FC_PATIENTID, '+
                   ' :p_FC_PATIENTNAME, '+
                   ' :p_P_ENAME, '+
                   ' :p_ACCESSIONNUMBER '+
                   '  ) RETURNING FK_ID ';
    //  FIBQuery.ParamByName('p_FK_ID').AsInteger            := p_ID;
      v_UniQr.ParamByName('p_FC_CALLINGTITLE').AsString   := p_FC_CALLINGTITLE;
      v_UniQr.ParamByName('p_FC_CALLEDTITLE').AsString    := p_FC_CALLEDTITLE;
      v_UniQr.ParamByName('p_FC_STUDYUID').AsString       := p_FC_STUDYUID;
      v_UniQr.ParamByName('p_FC_MODALITY').AsString       := p_FC_MODALITY;
      v_UniQr.ParamByName('p_FD_STUDYDATE').AsDateTime    := p_FD_STUDYDATE;
      v_UniQr.ParamByName('p_FD_DATE').AsDateTime         := p_FD_DATE;
      v_UniQr.ParamByName('p_FN_AMM').AsInteger           := p_FN_AMM;
      if p_FN_AMM_ERR=0 then
        v_UniQr.ParamByName('p_FN_TYPE').AsInteger          := 0
      else
        v_UniQr.ParamByName('p_FN_TYPE').AsInteger          := 1;
      v_UniQr.ParamByName('p_FC_PATIENTID').AsString      := p_FC_PATIENTID;
      v_UniQr.ParamByName('p_FC_PATIENTNAME').AsString    := p_FC_PATIENTNAME;
      v_UniQr.ParamByName('p_P_ENAME').AsString           := p_P_ENAME;
      v_UniQr.ParamByName('p_ACCESSIONNUMBER').AsString   := p_ACCESSIONNUMBER;
      v_UniQr.ParamByName('p_FN_AMM_ERR').AsInteger       := p_FN_AMM_ERR;
      try
      //  v_UniQr.Transaction.StartTransaction;
        v_UniQr.ExecSQL;
      //  if v_UniQr.Transaction.Active then
      //        v_UniQr.Transaction.Commit;
      except
        on e:Exception do
          begin
          //  v_UniQr.Transaction.Rollback;
            Lg_ev(e.Message,'',False, p_1_7_IS_LOG_WRITE);
            Result:=0;
            Exit;
          end;
      end;
      v_ID_RSND:=v_UniQr.FieldByName('FK_ID').AsInteger;
      Result:=v_ID_RSND;
    finally
      v_UniQr.Free;
    end;
  end else
  begin
    // запись по studyUID в лог пересылки
    FIBQuery    := TpFIBQuery.Create(nil);
    FIBQuery.Options :=  FIBQuery.Options + [qoAutoCommit];
    try
      FIBQuery.Database    := p_DB;
      FIBQuery.Transaction := p_trWrite ;
      if not FIBQuery.Transaction.Active then FIBQuery.Transaction.StartTransaction;
      FIBQuery.SQL.Text := c_sql_str0+c_sql_str1;
    //  FIBQuery.ParamByName('p_FK_ID').AsInteger            := p_ID;
      FIBQuery.ParamByName('p_FC_CALLINGTITLE').AsString   := p_FC_CALLINGTITLE;
      FIBQuery.ParamByName('p_FC_CALLEDTITLE').AsString    := p_FC_CALLEDTITLE;
      FIBQuery.ParamByName('p_FC_STUDYUID').AsString       := p_FC_STUDYUID;
      FIBQuery.ParamByName('p_FC_MODALITY').AsString       := p_FC_MODALITY;
      FIBQuery.ParamByName('p_FD_STUDYDATE').AsDateTime    := p_FD_STUDYDATE;
      FIBQuery.ParamByName('p_FD_DATE').AsDateTime         := p_FD_DATE;
      FIBQuery.ParamByName('p_FN_AMM').AsInteger           := p_FN_AMM;
      if p_FN_AMM_ERR=0 then
        FIBQuery.ParamByName('p_FN_TYPE').AsInteger          := 0
      else
        FIBQuery.ParamByName('p_FN_TYPE').AsInteger          := 1;
      FIBQuery.ParamByName('p_FC_PATIENTID').AsString      := p_FC_PATIENTID;
      FIBQuery.ParamByName('p_FC_PATIENTNAME').AsString    := p_FC_PATIENTNAME;
      FIBQuery.ParamByName('p_P_ENAME').AsString           := p_P_ENAME;
      FIBQuery.ParamByName('p_ACCESSIONNUMBER').AsString   := p_ACCESSIONNUMBER;
      FIBQuery.ParamByName('p_FN_AMM_ERR').AsInteger       := p_FN_AMM_ERR;
      FIBQuery.Prepare;
      try
        FIBQuery.ExecQuery;
      except
      on e:Exception do
        begin
          Lg_ev(lg_SQL(FIBQuery,E.ClassName,E.Message));
          CmnMyDoQueryInsertCMN ( 'ошибка SQL', 3, lg_SQL(FIBQuery,E.ClassName,E.Message),
                    p_DB, p_trWrite, p_isPostgres,p_PGconn,p_PGTrans, p_isOracle, pOraConn );
          Result:=0;
          Exit;
        end;
      end;
      v_ID_RSND:=FIBQuery.FieldByName('FK_ID').AsInteger;
      Result:=v_ID_RSND;
    finally
      FIBQuery.Free;
    end;
  end;
end;

procedure wrtErrSnim ( p_isOracle : Boolean;
                       pOraConn : TOracleSession;
                       p_isPostgres : Boolean;
                       p_PGconn: TUniConnection;
                       p_PGTrans : TUniTransaction;
                       p_DB: TpFIBDatabase;
                       p_trWrite : TpFIBTransaction;
                       p_FK_ID_RSND: Integer;
                       p_FC_STUDYUID: String;
                       p_FC_INSTANCEUID: String;
                       p_FC_COMM: String;
                       p_TRANSFERSYNTAX: Integer;
                       p_FC_CALLEDTITLE: String;
                       p_1_7_IS_LOG_WRITE : Boolean = True
                     );
var FIBQuery: TpFIBQuery; v_UniQr : TUniQuery; v_OraQr : TOracleQuery;
begin
  if p_isOracle then begin
    v_OraQr := TOracleQuery.Create(nil);
    try
      v_OraQr.Session:=pOraConn;
      v_OraQr.SQL.Text := 'insert into events_rsnd_err_lst ( '+
             ' fk_id_rsnd, fc_studyuid, fc_instanceuid,'+
             ' fc_comm, fn_transfersyntax, fc_calledtitle '+
          ') values ( '+
             ' :p_fk_id_rsnd, :p_fc_studyuid, :p_fc_instanceuid ,'+
             ' :p_fc_comm, :p_transfersyntax, :p_fc_calledtitle )';
      v_OraQr.DeclareAndSet('p_FK_ID_RSND', otInteger     , p_FK_ID_RSND );
      v_OraQr.DeclareAndSet('p_FC_STUDYUID', otString     , p_FC_STUDYUID );
      v_OraQr.DeclareAndSet('p_FC_INSTANCEUID', otString  , p_FC_INSTANCEUID );
      v_OraQr.DeclareAndSet('p_FC_COMM', otString         , Copy(p_FC_COMM,1,250) );
      v_OraQr.DeclareAndSet('p_TRANSFERSYNTAX', otInteger , p_TRANSFERSYNTAX );
      v_OraQr.DeclareAndSet('p_FC_CALLEDTITLE', otString  , p_FC_CALLEDTITLE );
      try
        v_OraQr.Execute;
      except
        on e:Exception do
          begin
            Lg_ev(e.Message,'',False, p_1_7_IS_LOG_WRITE);
            Exit;
          end;
      end;
    finally
      v_OraQr.Free;
    end;
  end else if p_isPostgres then
  begin
    v_UniQr := TUniQuery.Create(nil);
    try
      v_UniQr.Connection:=p_PGconn;
      v_UniQr.Transaction:=p_PGTrans;
      v_UniQr.SQL.Text := 'insert into '+v_pg_schema+'.events_rsnd_err_lst ( '+
             ' fk_id_rsnd, fc_studyuid, fc_instanceuid,'+
             ' fc_comm, fn_transfersyntax, fc_calledtitle '+
          ') values ( '+
             ' :p_fk_id_rsnd, :p_fc_studyuid, :p_fc_instanceuid ,'+
             ' :p_fc_comm, :p_transfersyntax, :p_fc_calledtitle )';
      v_UniQr.ParamByName('p_FK_ID_RSND').AsInteger     := p_FK_ID_RSND;
      v_UniQr.ParamByName('p_FC_STUDYUID').AsString     := p_FC_STUDYUID;
      v_UniQr.ParamByName('p_FC_INSTANCEUID').AsString  := p_FC_INSTANCEUID;
      v_UniQr.ParamByName('p_FC_COMM').AsString         := Copy(p_FC_COMM,1,250);
      v_UniQr.ParamByName('p_TRANSFERSYNTAX').AsInteger := p_TRANSFERSYNTAX;
      v_UniQr.ParamByName('p_FC_CALLEDTITLE').AsString  := p_FC_CALLEDTITLE;
      try
      //  v_UniQr.Transaction.StartTransaction;
        v_UniQr.ExecSQL;
      //  if v_UniQr.Transaction.Active then
      //        v_UniQr.Transaction.Commit;
      except
        on e:Exception do
          begin
      //      v_UniQr.Transaction.Rollback;
            Lg_ev(e.Message,'',False, p_1_7_IS_LOG_WRITE);
            Exit;
          end;
      end;
    finally
      v_UniQr.Free;
    end;
  end else begin
    FIBQuery    := TpFIBQuery.Create(nil);
    FIBQuery.Options :=  FIBQuery.Options + [qoAutoCommit];
    try
      FIBQuery.Database    := p_DB;
      FIBQuery.Transaction := p_trWrite ;
      if not FIBQuery.Transaction.Active then FIBQuery.Transaction.StartTransaction;
      FIBQuery.SQL.Text:='INSERT INTO EVENTS_RSND_ERR_LST ( '+
             ' FK_ID_RSND, FC_STUDYUID, FC_INSTANCEUID,'+
             ' FC_COMM, FN_TRANSFERSYNTAX, FC_CALLEDTITLE '+
          ') VALUES ( '+
             ' :p_FK_ID_RSND, :p_FC_STUDYUID, :p_FC_INSTANCEUID ,'+
             ' :p_FC_COMM, :p_TRANSFERSYNTAX, :p_FC_CALLEDTITLE )';
      FIBQuery.ParamByName('p_FK_ID_RSND').AsInteger     := p_FK_ID_RSND;
      FIBQuery.ParamByName('p_FC_STUDYUID').AsString     := p_FC_STUDYUID;
      FIBQuery.ParamByName('p_FC_INSTANCEUID').AsString  := p_FC_INSTANCEUID;
      FIBQuery.ParamByName('p_FC_COMM').AsString         := Copy(p_FC_COMM,1,250);
      FIBQuery.ParamByName('p_TRANSFERSYNTAX').AsInteger := p_TRANSFERSYNTAX;
      FIBQuery.ParamByName('p_FC_CALLEDTITLE').AsString  := p_FC_CALLEDTITLE;
      FIBQuery.Prepare;
      try
        FIBQuery.ExecQuery;
      except
      on e:Exception do
        begin
          Lg_ev(lg_SQL(FIBQuery,E.ClassName,E.Message),'',False, p_1_7_IS_LOG_WRITE);
          CmnMyDoQueryInsertCMN ( 'ошибка SQL', 3, lg_SQL(FIBQuery,E.ClassName,E.Message),
                    p_DB, p_trWrite, p_isPostgres,p_PGconn,p_PGTrans, p_isOracle, pOraConn );
        end;
      end;
    finally
      FIBQuery.Free;
    end;
  end;
end;

// функция возвращает наименование приложения без расширения
// для записи параметров в реестр
function gt_app_name : string;
var v_progname : string; v_pos : integer;
begin
  v_pos:=pos('.',ExtractFileName(Application.ExeName));
  if v_pos>1 then
  begin
    v_progname := copy(ExtractFileName(Application.ExeName),1,v_pos-1) ;
  end else
  begin
    v_progname := ExtractFileName(Application.ExeName) ;
  end;
  v_progname := StringReplace(v_progname,'.','_',[rfReplaceAll, rfIgnoreCase]);
  Result:=v_progname;
end;

// процедура записи имени пакса для отправки снимков
procedure wrt_pacs_aetitle ( p_ae_title : string;
                             p_ae_comm  : string;
                             p_username : string = 'MainUser'
                           );
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  try
    try
      Reg.RootKey:=HKEY_CURRENT_USER;
      if not Reg.OpenKey('\Software\Softmaster\'+gt_app_name+'\'+p_username, False) then
      begin
        Reg.CreateKey('\Software\Softmaster\'+gt_app_name+'\'+p_username);
      end;
      Reg.WriteString('\Software\Softmaster\'+gt_app_name+'\'+p_username, 'PACS_SEND_AE_TITLE', p_ae_title );
      Reg.WriteString('\Software\Softmaster\'+gt_app_name+'\'+p_username, 'PACS_SEND_AE_COMM',  p_ae_comm );
    except
    end;
  finally
    Reg.Free;
  end;
end;

// процедура чтения имени пакса для отправки снимков
procedure gt_pacs_aetitle ( var p_ae_title : string;
                            var p_ae_comm : string;
                            p_FIBTransaction : TpFIBTransaction;
                            p_DB: TpFIBDatabase;
                            p_CalledAE : string;
                            p_username : string = 'MainUser'
                          );
var Reg : TRegIniFile;
begin
  Reg:=TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    p_ae_title := Reg.ReadString('\Software\Softmaster\'+gt_app_name+'\'+p_username, 'PACS_SEND_AE_TITLE', '');
    p_ae_comm := Reg.ReadString('\Software\Softmaster\'+gt_app_name+'\'+p_username, 'PACS_SEND_AE_COMM',  '');
  finally
    Reg.Free;
  end;
  if ((Trim(p_ae_title)='') or (Trim(p_ae_comm)='')) then
  begin
    p_ae_title   := DBparams_get ( 'SERVER',
                                   'AETITLE'
                                 );
    p_ae_comm   := gt_AE_DEVICE_comm( p_CalledAE, p_FIBTransaction, p_DB );
  end;
end;

// чтение описания устройства (комментария)
function gt_AE_DEVICE_comm ( p_aetitle:string;
                             p_FIBTransaction : TpFIBTransaction;
                             p_DB: TpFIBDatabase
                           ):string;
var FIBDataSet: TpFIBDataSet; v_res:string; v_UniQr : TUniQuery; v_OraQr : TOracleQuery;
begin
  v_res:='';
  if v_isOracle then begin
    v_OraQr := TOracleQuery.Create(nil);
    try
      v_OraQr.Session := DB_CMN.OraConn;
      v_OraQr.SQL.Text :=
            'SELECT '+gt_fld_name('DEVICES','FC_COMMENT')+' FROM '+v_pg_Schema+'.devices WHERE '+
          ' '+gt_fld_name('DEVICES','FC_TITLE')+'=:p_FC_TITLE';
      v_OraQr.DeclareAndSet('p_FC_TITLE', otString , p_aetitle );
      v_OraQr.Execute;
      if not v_OraQr.Eof then
        v_res:=v_OraQr.FieldAsString(gt_fld_name('DEVICES','FC_COMMENT'))
      else
        v_res:='';
    finally
      v_OraQr.Free;
    end;
  end else if v_isPostgres then begin
    v_UniQr := TUniQuery.Create(nil);
    try
      v_UniQr.Connection:=DB_CMN.PGconn;
      v_UniQr.Transaction:=DB_CMN.MnUniTransaction;

      v_UniQr.SQL.Text :=
            'SELECT '+gt_fld_name('DEVICES','FC_COMMENT')+' FROM '+v_pg_Schema+'.devices WHERE '+
          ' '+gt_fld_name('DEVICES','FC_TITLE')+'=:p_FC_TITLE';
      v_UniQr.ParamByName('p_FC_TITLE').AsString := p_aetitle;
      v_UniQr.Open;
      v_UniQr.First;
      if not v_UniQr.Eof then
        v_res:=v_UniQr.FieldByName(gt_fld_name('DEVICES','FC_COMMENT')).AsString
      else
        v_res:='';
    finally
      v_UniQr.Free;
    end;
  end else begin
    FIBDataSet := TpFIBDataSet.Create(nil);
    FIBDataSet.Database := p_DB;
    try
      FIBDataSet.Transaction := p_FIBTransaction;
      FIBDataSet.SQLs.SelectSQL.Clear;
      FIBDataSet.SQLs.SelectSQL.Text := 'SELECT FC_COMMENT FROM DEVICES WHERE '+
          ' FC_TITLE=:p_FC_TITLE';
      FIBDataSet.ParamByName('p_FC_TITLE').AsString := p_aetitle;
      FIBDataSet.Open;
      FIBDataSet.First;
      if not FIBDataSet.Eof then
        v_res:=FIBDataSet.FieldByName('FC_COMMENT').AsString
      else
        v_res:='';
    finally
      FreeAndNil(FIBDataSet);
    end;
  end;
  Result:=v_res;
end;

// чтение параметра
function DBparams_get( p_SECTION : string;
                       p_KEY : string;
                       p_default_value : string = c_param_not_found;
                       p_DB : TpFIBDatabase = nil
                       ): ansistring;
var FIBDataSet: TpFIBDataSet; v_UniQr : TUniQuery;
    v_res:ansistring; v_OraQr : TOracleQuery;
begin
  v_res:=c_param_not_found;
  if v_isOracle then begin
    v_OraQr := TOracleQuery.Create(nil);
    try
      v_OraQr.Session := DB_CMN.OraConn;
      v_OraQr.SQL.Text := ' SELECT FC_VALUE FROM PARAMS '+
                          '  WHERE UPPER(FC_SECTION) = UPPER(:P_FC_SECTION) '+
                          '    AND UPPER(FC_KEY) = UPPER(:p_FC_KEY) ';
      v_OraQr.DeclareAndSet( 'P_FC_SECTION', otString, p_SECTION );
      v_OraQr.DeclareAndSet( 'p_FC_KEY', otString, p_KEY );
      v_OraQr.Execute;
      if not v_OraQr.Eof then
      begin
        v_res:=v_OraQr.FieldAsString( gt_fld_name('PARAMS','FC_VALUE') );
      end else
      begin
        v_res:=p_default_value;
      end;
    finally
      v_OraQr.Free;
    end;
  end else if v_isPostgres then
  begin
    v_UniQr := TUniQuery.Create(nil);
    try
      v_UniQr.Connection:=DB_CMN.PGconn;
      v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
      v_UniQr.SQL.Text := ' select '+gt_fld_name('params','fc_value')+' from '+v_pg_schema+'.params '+
                          '  where upper('+gt_fld_name('params','fc_section')+') = upper(:p_fc_section) '+
                          '    and upper('+gt_fld_name('params','fc_key')+') = upper(:p_fc_key) ';
      v_UniQr.ParamByName('P_FC_SECTION').AsString := p_SECTION;
      v_UniQr.ParamByName('p_FC_KEY').AsString := p_KEY;
      v_UniQr.Open;
      v_UniQr.First;
      if not v_UniQr.Eof then
      begin
        v_res:=v_UniQr.FieldByName( gt_fld_name('PARAMS','FC_VALUE') ).AsString;
      end else
      begin
        v_res:=p_default_value;
      end;
    finally
      v_UniQr.Free;
    end;
  end else
  begin
    FIBDataSet := TpFIBDataSet.Create(nil);
    if p_DB=nil then
      FIBDataSet.Database := DB_CMN.DB
    else
      FIBDataSet.Database := p_DB;
    try
      FIBDataSet.Transaction := DB_CMN.trRead;
      FIBDataSet.SQLs.SelectSQL.Clear;
      FIBDataSet.SQLs.SelectSQL.Text := ' SELECT FC_VALUE '+#13+
                                        '   FROM PARAMS '+#13+
                                        '  WHERE UPPER(FC_SECTION) = UPPER(:P_FC_SECTION) '+#13+
                                        '    AND UPPER(FC_KEY) = UPPER(:p_FC_KEY) ';
      FIBDataSet.ParamByName('P_FC_SECTION').AsString := p_SECTION;
      FIBDataSet.ParamByName('p_FC_KEY').AsString := p_KEY;
      FIBDataSet.Open;
      FIBDataSet.First;
      if not FIBDataSet.Eof then
        v_res:=FIBDataSet.FieldByName('FC_VALUE').AsString
      else
        v_res:=p_default_value;
    finally
      FreeAndNil(FIBDataSet);
    end;
  end;
  DBparams_get:=v_res;
end;

// запись параметров
procedure DBparams_wrt (
      const p_SECTION : string;
      const p_KEY     : string;
      const p_VALUE   : string
      );
var FIBQuery : TpFIBQuery;
    v_val : AnsiString;
    v_UniQr : TUniQuery;
    v_OraQr : TOracleQuery ; 
begin
  // зачитаем параметры - проверим есть ли запись
  v_val := DBparams_get ( p_SECTION,
                          p_KEY
                        );
  if v_isOracle then     // ORACLE
  begin
    v_OraQr := TOracleQuery.Create(nil);
    try
      v_OraQr.Session:=DB_CMN.OraConn;
      if v_val=c_param_not_found then
      begin
        v_OraQr.SQL.Text := 'insert into PARAMS ( FC_SECTION, FC_KEY, FC_VALUE ) '+
                             'values (:P_FC_SECTION,:p_FC_KEY,:p_VALUE)';
      end else
      begin
        v_OraQr.SQL.Text := 'update PARAMS set FC_VALUE=:p_VALUE where '+
                             'FC_SECTION=:P_FC_SECTION and '+
                             'FC_KEY=:p_FC_KEY';
      end;
      v_OraQr.DeclareAndSet('P_FC_SECTION', otString , p_SECTION );
      v_OraQr.DeclareAndSet('p_FC_KEY', otString , p_KEY );
      v_OraQr.DeclareAndSet('p_VALUE', otString , p_VALUE );
      try
        v_OraQr.Execute;
      except
        on e:Exception do
          begin
            MnLg_ev(e.Message);
            Exit;
          end;
      end;
    finally
      v_OraQr.Free;
    end;
  end  else if v_isPostgres then begin
    v_UniQr := TUniQuery.Create(nil);
    try
      v_UniQr.Connection:=DB_CMN.PGconn;
      v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
      if v_val=c_param_not_found then
      begin
        v_UniQr.SQL.Text := 'insert into '+v_pg_Schema+'.PARAMS ('+
                             gt_fld_name('PARAMS','FC_SECTION')+','+
                             gt_fld_name('PARAMS','FC_KEY')+','+
                             gt_fld_name('PARAMS','FC_VALUE')+') '+
                             'values (:P_FC_SECTION,:p_FC_KEY,:p_VALUE)';
      end else
      begin
        v_UniQr.SQL.Text := 'update '+v_pg_Schema+'.PARAMS set '+gt_fld_name('PARAMS','FC_VALUE')+'=:p_VALUE where '+
                             gt_fld_name('PARAMS','FC_SECTION')+'=:P_FC_SECTION and '+
                             gt_fld_name('PARAMS','FC_KEY')+'=:p_FC_KEY';
      end;
      v_UniQr.ParamByName('P_FC_SECTION').AsString := p_SECTION;
      v_UniQr.ParamByName('p_FC_KEY').AsString := p_KEY;
      v_UniQr.ParamByName('p_VALUE').AsString := p_VALUE;
      try
      //  v_UniQr.Transaction.StartTransaction;
        v_UniQr.ExecSQL;
      //  if v_UniQr.Transaction.Active then
      //    v_UniQr.Transaction.Commit;
      except
        on e:Exception do
          begin
            MnLg_ev(e.Message);
            Exit;
          end;
      end;
    finally
      v_UniQr.Free;
    end;
  end else
  begin
    FIBQuery := TpFIBQuery.Create(nil);
    try
      FIBQuery.Close;
      FIBQuery.Database := DB_CMN.DB;
      trWriteStart;
      FIBQuery.Transaction := DB_CMN.trWrite;
      FibQuery.Options := FibQuery.Options + [qoAutoCommit];
      FIBQuery.SQL.Clear;
      if v_val=c_param_not_found then
      begin
        FIBQuery.SQL.Text := 'insert into PARAMS (FC_SECTION,FC_KEY,FC_VALUE) '+
                             'values (:P_FC_SECTION,:p_FC_KEY,:p_VALUE)';
      end else
      begin
        FIBQuery.SQL.Text := 'update PARAMS set FC_VALUE=:p_VALUE where '+
                             'FC_SECTION=:P_FC_SECTION and FC_KEY=:p_FC_KEY';
      end;
      FIBQuery.ParamByName('P_FC_SECTION').AsString := p_SECTION;
      FIBQuery.ParamByName('p_FC_KEY').AsString := p_KEY;
      FIBQuery.ParamByName('p_VALUE').AsString := p_VALUE;
      try
        FIBQuery.ExecQuery;
      except
        on E : Exception do
          MnLg_ev('ERROR '+E.Message);
      end;
    finally
      FIBQuery.Free;
    end;
  end;
end;

// запись события в журнал
procedure MyDoQueryInsert( sEvent: string;
                           nType: Integer;
                           sRemark: string;
                           p_FIBTransaction : TpFIBTransaction;
                           DB: TpFIBDatabase
                         );
var FIBQuery : TpFIBQuery; v_UniQr : TUniQuery; v_OraQr : TOracleQuery;
begin
  if v_isOracle then     // ORACLE
  begin
    v_OraQr := TOracleQuery.Create(nil);
    try
      v_OraQr.Session:=DB_CMN.OraConn;
      v_OraQr.SQL.Text := ' insert into events (fc_name, fn_type, fd_date, fc_remark) '+#13+
                           ' values(:fc_name, :fn_type, :fd_date, :fc_remark) ';
      v_OraQr.DeclareAndSet('FC_NAME', otString , Copy(sEvent,1,250) );
      v_OraQr.DeclareAndSet('FN_TYPE', otInteger , nType );
      v_OraQr.DeclareAndSet('FD_DATE', otTimestamp , Now );
      v_OraQr.DeclareAndSet('FC_REMARK', otString , Copy(sRemark,1,10000) );
      try
        v_OraQr.Execute;
      except
        on e:Exception do
          begin
            MnLg_ev(e.Message);
            Exit;
          end;
      end;
    finally
      v_OraQr.Free;
    end;
  end else if v_isPostgres then
  begin
    v_UniQr := TUniQuery.Create(nil);
    try
      v_UniQr.Connection:=DB_CMN.PGconn;
      v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
      v_UniQr.SQL.Text := ' insert into '+v_pg_schema+'.events (fc_name, fn_type, fd_date, fc_remark) '+#13+
                           ' values(:fc_name, :fn_type, :fd_date, :fc_remark) ';
      v_UniQr.ParamByName('FC_NAME').AsString := Copy(sEvent,1,250);
      v_UniQr.ParamByName('FN_TYPE').AsInteger := nType;
      v_UniQr.ParamByName('FD_DATE').AsDateTime := Now;
      v_UniQr.ParamByName('FC_REMARK').AsString := Copy(sRemark,1,10000);
      try
      //  v_UniQr.Transaction.StartTransaction;
        v_UniQr.ExecSQL;
      //  if v_UniQr.Transaction.Active then
      //    v_UniQr.Transaction.Commit;
      except
        on e:Exception do
          begin
            MnLg_ev(e.Message);
            Exit;
          end;
      end;
    finally
      v_UniQr.Free;
    end;
  end else if v_1_7_DB_LOG_WRITE then
  begin
    FIBQuery := TpFIBQuery.Create(nil);
    try
      FIBQuery.Close;
      FIBQuery.Database := DB;
      if not p_FIBTransaction.Active then
        p_FIBTransaction.Active:=True;
      FIBQuery.Transaction := p_FIBTransaction;
      FibQuery.Options := FibQuery.Options + [qoAutoCommit];
      FIBQuery.SQL.Clear;
      FIBQuery.SQL.Text := ' INSERT INTO EVENTS(FC_NAME, FN_TYPE, FD_DATE, FC_REMARK) '+#13+
                           ' VALUES(:FC_NAME, :FN_TYPE, :FD_DATE, :FC_REMARK) ';
      FIBQuery.ParamByName('FC_NAME').AsString := Copy(sEvent,1,250);
      FIBQuery.ParamByName('FN_TYPE').AsInteger := nType;
      FIBQuery.ParamByName('FD_DATE').AsDateTime := Now;
      FIBQuery.ParamByName('FC_REMARK').AsString := Copy(sRemark,1,10000);
      try
        FIBQuery.ExecQuery;
      except
        on E : Exception do
          MnLg_ev('ERROR '+E.Message);
      end;
    finally
      FIBQuery.Free;
    end;
  end;
end;

// завершение транзакции
procedure MyEndTrans(const p_FIBTransaction : TpFIBTransaction);
begin
  try
    if p_FIBTransaction.Active then p_FIBTransaction.Commit;
  except
    on E : Exception do
      begin
        MessageDlg('Ошибка транзакции : ' + E.Message, mtError, [mbOK], 0);
      end;
  end;
end;

// старт транзакции
procedure MyStartTrans(const p_FIBTransaction : TpFIBTransaction);
begin
  try
    if not p_FIBTransaction.Active then p_FIBTransaction.StartTransaction;
  except
    on E : Exception do
      begin
        MessageDlg('Ошибка транзакции : ' + E.Message, mtError, [mbOK], 0);
      end;
  end;
end;

// закрытие соединения с базой
procedure MyDBDisconnect(const p_FIBDatabase: TpFIBDatabase);
begin
  try
    p_FIBDatabase.Connected := False;
  except
  on e: Exception do
    begin
      MessageDlg('Ошибка соединения с БД : ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

// открытие соединения с базой
procedure MyDbConnect(const p_FIBDatabase: TpFIBDatabase);
begin
  try
    p_FIBDatabase.Connected := true;
  except
  on e: Exception do
    begin
      MessageDlg('Ошибка соединения с БД : ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

// commit и start транзакции Read
procedure Cmn_Commit(const p_FIBTransaction : TpFIBTransaction);
begin
  MyEndTrans(p_FIBTransaction);
  MyStartTrans(p_FIBTransaction);
end;

// выполнение запроса
procedure MyExecQuery( const v_FIBQuery : TpFIBQuery );
begin
  try
    ShowBusy(True);
    try
      v_FIBQuery.Prepare;
      v_FIBQuery.ExecQuery;
    except
      on e: Exception do
        begin
          MessageDlg('Ошибка : ' + E.Message, mtError, [mbOK], 0);
        end;
    end;
  finally
    ShowBusy(False);
  end;
end;

// выполнение запроса
procedure MyExecDSQuery( const v_FIBDataSet : TpFIBDataSet );
begin
  try
    ShowBusy(True);
    try
      v_FIBDataSet.Open;
    except
      on e: Exception do
        begin
          MessageDlg('Ошибка : ' + E.Message, mtError, [mbOK], 0);
        end;
    end;
  finally
    ShowBusy(False);
  end;
end;

// функция возврата параметров DICOM устройства по AETitle
function gt_device_params  ( const p_AETitle : string;
                             const p_IP_AE   : string;
                             AClientThread: TDicomClientThread;
                             var   p_IP      : string;
                             var   p_port    : string
                           ):boolean;
var FIBDataSet: TpFIBDataSet; v_res:Boolean; v_UniQr : TUniQuery;
    v_OraQr : TOracleDataSet;
begin
  v_res:=False;
  if AClientThread<>nil then
    AClientThread.v_TransferSyntaxCMove:=-1; // не задан для c_move - FN_TRANSFER
  if v_isOracle then     // ORACLE
  begin
    v_OraQr := TOracleDataSet.Create(nil);
    try
      if AClientThread=nil then begin
        v_OraQr.Session:=DB_CMN.OraConn;
      end else begin
        v_OraQr.Session:=AClientThread.OraConn;
      end;
      v_OraQr.SQL.Text :=
          'SELECT FC_IP, FN_PORT, FN_TRANSFER '+
             'FROM DEVICES WHERE '+
             'trim(UPPER(fc_title))=trim(UPPER(:P_FC_TITLE)) ';
      v_OraQr.DeclareAndSet('P_FC_TITLE', otString , p_AETitle );
      if Trim(p_IP_AE)<>'' then begin
        v_OraQr.SQL.Text := v_OraQr.SQL.Text+' and trim(UPPER(FC_IP))=trim(UPPER(:p_FC_IP))';
        v_OraQr.DeclareAndSet('p_FC_IP', otString , p_IP_AE );
      end;
      try
        v_OraQr.Open; v_OraQr.First;
        if not v_OraQr.Eof then
        begin
          p_IP:=v_OraQr.FieldByName('FC_IP').AsString;
          p_port:=v_OraQr.FieldByName('FN_PORT').AsString;
          if AClientThread<>nil then
            AClientThread.v_TransferSyntaxCMove:=v_OraQr.FieldByName('FN_TRANSFER').AsInteger;
          v_res:=True;
        end;
      except
        on e:Exception do
          MnLg_ev(e.Message);
      end;
    finally
      v_OraQr.Close;
      v_OraQr.Free;
    end;
  end else if v_isPostgres then begin
    v_UniQr := TUniQuery.Create(nil);
    try
      if AClientThread=nil then begin
        v_UniQr.Connection:=DB_CMN.PGconn;
        v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
      end else begin
        v_UniQr.Connection:=AClientThread.PGconn;
        v_UniQr.Transaction:=AClientThread.PGTrans;
      end;
      v_UniQr.SQL.Text :=
          'SELECT '+gt_fld_name('DEVICES','FC_IP')+', '+
             gt_fld_name('DEVICES','FN_PORT')+', '+
             gt_fld_name('DEVICES','FN_TRANSFER')+' '+
             'FROM '+v_pg_Schema+'.DEVICES WHERE '+
             'UPPER(fc_title)=UPPER(:P_FC_TITLE) ';
      v_UniQr.ParamByName('P_FC_TITLE').AsString := p_AETitle;
      if Trim(p_IP_AE)<>'' then begin
        v_UniQr.SQL.Text := v_UniQr.SQL.Text+' and UPPER('+gt_fld_name('DEVICES','FC_IP')+')=UPPER(:p_FC_IP)';
        v_UniQr.ParamByName('p_FC_IP').AsString := p_IP_AE;
      end;
      try
        v_UniQr.Open; v_UniQr.First;
        if not v_UniQr.Eof then
        begin
          p_IP:=v_UniQr.FieldByName(gt_fld_name('DEVICES','FC_IP')).AsString;
          p_port:=v_UniQr.FieldByName(gt_fld_name('DEVICES','FN_PORT')).AsString;
          if AClientThread<>nil then
            AClientThread.v_TransferSyntaxCMove:=v_UniQr.FieldByName(gt_fld_name('DEVICES','FN_TRANSFER')).AsInteger;
          v_res:=True;
        end;
      except
        on e:Exception do
          MnLg_ev(e.Message);
      end;
    finally
      v_UniQr.Free;
    end;
  end else begin
    FIBDataSet := TpFIBDataSet.Create(nil);
    try
      if AClientThread=nil then
      begin
        FIBDataSet.Database := DB_CMN.DB;
        FIBDataSet.Transaction := DB_CMN.trWrite;
      end else
      begin
        FIBDataSet.Database := (AClientThread.v_ClThr_DB as TpFIBDatabase);
        FIBDataSet.Transaction := (AClientThread.v_ClThr_trWrite as TpFIBTransaction);
      end;
      FIBDataSet.SQLs.SelectSQL.Clear;
      FIBDataSet.SQLs.SelectSQL.Text :=
          'SELECT FC_IP, FN_PORT, FN_TRANSFER FROM DEVICES WHERE UPPER(FC_TITLE)=UPPER(:P_FC_TITLE) ';
      FIBDataSet.ParamByName('P_FC_TITLE').AsString := p_AETitle;
      if Trim(p_IP_AE)<>'' then begin
        FIBDataSet.SQLs.SelectSQL.Text := FIBDataSet.SQLs.SelectSQL.Text+' and UPPER(FC_IP)=UPPER(:p_FC_IP)';
        FIBDataSet.ParamByName('p_FC_IP').AsString := p_IP_AE;
      end;
      FIBDataSet.Open; FIBDataSet.First;
      if not FIBDataSet.Eof then begin
        p_IP:=FIBDataSet.FieldByName('FC_IP').AsString;
        p_port:=FIBDataSet.FieldByName('FN_PORT').AsString;
        if AClientThread<>nil then
          AClientThread.v_TransferSyntaxCMove:=FIBDataSet.FieldByName('FN_TRANSFER').AsInteger;
        v_res:=True;
      end;
    finally
      FreeAndNil(FIBDataSet);
    end;


  end;
  gt_device_params:=v_res;
end;

// функция формирования строки SQL-запроса с параметрами
function lg_SQLCMN( const FIBQuery:TpFIBQuery ):AnsiString;
var i:Integer; v_res, v_paramname : AnsiString;
const c_eol = #13;
begin
  v_res:=' SQL: '''+FIBQuery.SQL.Text+''' '+c_eol;
  for I := 0 to FIBQuery.ParamCount - 1 do
  begin
    v_paramname:=FIBQuery.ParamName(i);
    if not VarIsNull(FIBQuery.ParamValue(v_paramname)) then
      v_res:= v_res + 'ParamName='''+v_paramname+''' ParamValue='''+vartostr(FIBQuery.ParamValue(v_paramname))+''''+c_eol;
  end;
  Result:= v_res;
end;

// функция формирования строки SQL-запроса с параметрами
function lg_SQLDSCMN( const FIBQuery:TpFIBDataSet ):AnsiString;
var i:Integer; v_res, v_paramname : AnsiString;
const c_eol = #13;
begin
  v_res:=' SQL: '''+FIBQuery.SelectSQL.Text+''' '+c_eol;
  for I := 0 to FIBQuery.ParamCount - 1 do
  begin
    v_paramname:=FIBQuery.ParamName(i);
    if not VarIsNull(FIBQuery.ParamValue(v_paramname)) then
      v_res:= v_res + 'ParamName='''+v_paramname+''' ParamValue='''+vartostr(FIBQuery.ParamValue(v_paramname))+''''+c_eol;
  end;
  Result:= v_res;
end;

procedure gt_servParms ( p_device_name:string;
                         p_DB : tpFIBDatabase;
                         p_trRead : TpFIBTransaction;
                         p_isPostgres : boolean;
                         p_Connection :  TUniConnection;
                         p_Transaction :  TUniTransaction;
                         p_isOracle : Boolean;
                         pOraConn : TOracleSession;
                         var teServer:string;
                         var tePort:integer );
var FIBDataSet : TpFIBDataSet; v_UniQr : TUniQuery; v_OraQr : TOracleDataSet;
begin
  teServer:='';
  tePort:=0;
  if v_isOracle then     // ORACLE
  begin
    v_OraQr := TOracleDataSet.Create(nil);
    try
      v_OraQr.Session:=DB_CMN.OraConn;
      v_OraQr.SQL.Text :=
        'select * from DEVICES where FC_TITLE=:p_fc_title';
      v_OraQr.DeclareAndSet('p_fc_title', otString , p_device_name );
      v_OraQr.Open;
      v_OraQr.First;
      if not v_OraQr.Eof then begin
        teServer := v_OraQr.FieldByName(gt_fld_name('DEVICES','fc_ip')).AsString;
        tePort   := v_OraQr.FieldByName(gt_fld_name('DEVICES','fn_port')).AsInteger;
      end;
    finally
      v_OraQr.Close;
      FreeAndNil(v_OraQr);
    end;
  end else if v_isPostgres then begin
    v_UniQr := TUniQuery.Create(nil);
    v_UniQr.Connection:=DB_CMN.PGconn;
    v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
    try
      v_UniQr.SQL.Text :=
        'select * from '+v_pg_Schema+'.DEVICES where '+gt_fld_name('DEVICES','FC_TITLE')+'=:p_fc_title';
      v_UniQr.ParamByName('p_fc_title').AsString := p_device_name;
      v_UniQr.Open;
      v_UniQr.First;
      if not v_UniQr.Eof then begin
        teServer := v_UniQr.FieldByName(gt_fld_name('DEVICES','fc_ip')).AsString;
        tePort   := v_UniQr.FieldByName(gt_fld_name('DEVICES','fn_port')).AsInteger;
      end;
    finally
      FreeAndNil(v_UniQr);
    end;
  end else begin
    FIBDataSet := TpFIBDataSet.Create(nil);
    FIBDataSet.Database := p_DB;
    try
      FIBDataSet.Transaction := p_trRead;
      FIBDataSet.SQLs.SelectSQL.Text :=
        'select * from devices where fc_title=:p_fc_title';
      FIBDataSet.Prepare;
      FIBDataSet.ParamByName('p_fc_title').AsString := p_device_name;
      FIBDataSet.Open;
      FIBDataSet.First;
      if not FIBDataSet.Eof then begin
        teServer := FIBDataSet.FieldByName('fc_ip').AsString;
        tePort   := FIBDataSet.FieldByName('fn_port').AsInteger;
      end;
    finally
      FreeAndNil(FIBDataSet);
    end;
  end;
end;

procedure CmnMyDoQueryInsertCMN( sEvent: string;
                           nType: Integer;
                           sRemark: string;
                           p_DB : TFIBDatabase;
                           p_FIBTransaction : TpFIBTransaction;
                           p_isPostgres : Boolean;
                           p_PGconn: TUniConnection;
                           p_PGTrans : TUniTransaction;
                           p_isOracle : Boolean;
                           pOraConn : TOracleSession
                         );
var FIBQuery : TpFIBQuery; v_UniQr : TUniQuery;
begin
  if p_isPostgres then
  begin
    v_UniQr := TUniQuery.Create(nil);
    try
      v_UniQr.Connection:=p_PGconn;
      v_UniQr.Transaction:=p_PGTrans;
      v_UniQr.SQL.Text := ' insert into '+v_pg_schema+'.events (fc_name, fn_type, fd_date, fc_remark) '+
                         ' values(:fc_name, :fn_type, :fd_date, :fc_remark) ';
      v_UniQr.ParamByName('FN_TYPE').AsInteger := nType;
      v_UniQr.ParamByName('FD_DATE').AsDateTime := Now;
      v_UniQr.ParamByName('FC_REMARK').AsString := Copy(sRemark,1,10000);
      try
      //  v_UniQr.Transaction.StartTransaction;
        v_UniQr.ExecSQL;
      //  if v_UniQr.Transaction.Active then
      //        v_UniQr.Transaction.Commit;
      except
        on e:Exception do
          begin
      //      v_UniQr.Transaction.Rollback;
            MnLg_ev('ERROR '+E.Message);
            Exit;
          end;
      end;
    finally
      v_UniQr.Free;
    end;
  end else if v_1_7_DB_LOG_WRITE then
  begin
    FIBQuery    := TpFIBQuery.Create(nil);
    FIBQuery.Options :=  FIBQuery.Options + [qoAutoCommit];
    try
      FIBQuery.Database    := p_DB;
      FIBQuery.Transaction := p_FIBTransaction ;
      if not FIBQuery.Transaction.Active then FIBQuery.Transaction.StartTransaction;
      FIBQuery.SQL.Text:=' INSERT INTO EVENTS (FC_NAME, FN_TYPE, FD_DATE, FC_REMARK) '+#13+
                         ' VALUES(:FC_NAME, :FN_TYPE, :FD_DATE, :FC_REMARK) ';;
      FIBQuery.ParamByName('FN_TYPE').AsInteger := nType;
      FIBQuery.ParamByName('FD_DATE').AsDateTime := Now;
      FIBQuery.ParamByName('FC_REMARK').AsString := Copy(sRemark,1,10000);
      try
        FIBQuery.ExecQuery;
      except
        on E : Exception do
          MnLg_ev('ERROR '+E.Message);
      end;
    finally
      FIBQuery.Free;
    end;
  end;
end;

function gt_fld_name ( p_tabname, p_fieldname : string ) : string;
  function cmn_set1 (p_tabname1 : string) : boolean;
  begin
    Result := ( LowerCase(p_tabname)=LowerCase(p_tabname1) );
  end;
  function cmn_set (p_fieldname1 : string) : boolean;
  begin
    Result := ( LowerCase(p_fieldname)=LowerCase(p_fieldname1) );
  end;
begin   // gt_fld_name('STUDIES','')

  Result := Lowercase(p_fieldname) ;

  Exit;
  
  {
  if v_is_wl_pacs=0 then // поля переопределяются только для worklist
    if v_isPostgres then
      if cmn_set1('APPLYTABLE') then
        if      cmn_set('idfield')        then Result:='oid'
        else if cmn_set('namefield')      then Result:='patientnameeng'
        else if cmn_set('enamefield')     then Result:='patientnamerus'
        else if cmn_set('uidfield')       then Result:='uid'
        else if cmn_set('birthdatefield') then Result:='birthdate'
        else if cmn_set('sexfield')       then Result:='sex'
        else if cmn_set('doctorfield')    then Result:='doctor'
        else if cmn_set('descfield')      then Result:='description'
        else if cmn_set('p_pid')          then Result:='patientid'
        else Result:=p_fieldname
      else if cmn_set1('DEVICES') then
        if      cmn_set('fk_id')          then Result:='oid'
        else if cmn_set('fc_ip')          then Result:='ip'
        else if cmn_set('fn_port')        then Result:='port'
        else if cmn_set('fc_title')       then Result:='aetitle'
        else if cmn_set('fc_comment')     then Result:='comment'
        else if cmn_set('fn_type')        then Result:='ftype'
        else Result:=p_fieldname
      else if cmn_set1('EVENTS_WL') then
        if      cmn_set('fk_id')          then Result:='oid'
        else if cmn_set('fc_name')        then Result:='fname'
        else if cmn_set('fn_type')        then Result:='ftype'
        else if cmn_set('fd_date')        then Result:='dtevent'
        else if cmn_set('fc_remark')      then Result:='fcomment'
        else Result:=p_fieldname
      else if cmn_set1('IMAGES') then
        if      cmn_set('p_pid')          then Result:='patientid'
        else Result:=p_fieldname
      else if cmn_set1('PARAMS') then
        if      cmn_set('fc_section')     then Result:='fsection'
        else if cmn_set('fc_key')         then Result:='fkey'
        else if cmn_set('fc_value')       then Result:='fvalue'
        else Result:=p_fieldname
      else if cmn_set1('PATIENTS') then
        if      cmn_set('p_pid')          then Result:='patientid'
        else if cmn_set('p_ename')        then Result:='patientnameeng'
        else if cmn_set('p_sex')          then Result:='sex'
        else if cmn_set('p_dateborn')     then Result:='dateborn'
        else if cmn_set('p_fam')          then Result:='family'
        else if cmn_set('p_im')           then Result:='name'
        else if cmn_set('p_otch')         then Result:='surname'
        else if cmn_set('p_ename_rus')    then Result:='patientnamerus'
        else Result:=p_fieldname
      else if cmn_set1('SERIES') then
        Result:=p_fieldname
      else if cmn_set1('STUDIES') then
        if      cmn_set('p_ename')        then Result:='patientnameeng'
        else if cmn_set('p_sex')          then Result:='sex'
        else if cmn_set('p_pid')          then Result:='patientid'
        else if cmn_set('p_age')          then Result:='age'
        else if cmn_set('p_dob')          then Result:='dob'
        else if cmn_set('p_dateborn')     then Result:='dateborn'
        else if cmn_set('p_ename_rus')    then Result:='patientnamerus'
        else Result:=p_fieldname
      else
        Result:=p_fieldname
    else  Result:=p_fieldname
  else Result:=p_fieldname;  }
end;

// Функция возврата роли юзера
//  1 - sysdba
function gtUserRole ( pUserName : string ) : SmallInt;
var dsFIB : TpFIBDataSet; v_UniQr : TUniQuery; vOraQr : TOracleDataSet;
    vRes:SmallInt;
  procedure chkUser( pDS : TDataSet );
  begin
    pDS.Open; pDS.First;
    if pDS.Eof then
      vRes:=0
    else
      vRes:=pDS.FieldByName('FN_ADM').AsInteger;
    pDS.Close;
  end;
begin
  if v_isOracle then begin
    vOraQr := TOracleDataSet.Create(nil);
    try
      vOraQr.Session:=DB_CMN.OraConn;
      vOraQr.SQL.Text := 'select FN_ADM from pacs.users where FC_LOGIN=:p_FC_LOGIN' ;
      vOraQr.DeclareAndSet('p_FC_LOGIN',otString,pUserName);
      chkUser( vOraQr );
    finally
      vOraQr.Free;
    end;
  end else if v_isPostgres then begin
    v_UniQr := TUniQuery.Create(nil);
    try
      v_UniQr.Connection:=DB_CMN.PGconn;
      v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
      v_UniQr.SQL.Text := ' select fn_adm from '+v_pg_Schema+'.users WHERE fc_login = :p_FC_LOGIN ';
      v_UniQr.ParamByName('p_FC_LOGIN').AsString := pUserName;
      chkUser( v_UniQr );
    finally
      v_UniQr.Free;
    end;
  end else  // firebird
  begin
    dsFIB := TpFIBDataSet.Create(nil);
    try
      dsFIB.Database := DB_CMN.DB;
      dsFIB.Transaction := DB_CMN.trRead;
      dsFIB.AutoCommit := True;
      dsFIB.SQLs.SelectSQL.Text := 'select FN_ADM from users where FC_LOGIN=:p_FC_LOGIN';
      dsFIB.ParamByName('p_FC_LOGIN').AsString := pUserName;
      chkUser( dsFIB );
    finally
      dsFIB.Free;
    end;
  end;
  Result := vRes ;
end;

end.
