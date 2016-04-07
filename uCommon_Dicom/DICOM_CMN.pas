{ Модуль для процедур работы с DICOM-объектами, используемых в модулях
  типа выполнения запроса C_ECHO, других запросов и проч.
}

unit DICOM_CMN;

interface

Uses DCM_Connection, DCM_Server, SysUtils, Classes, DCM_Attributes, DCM_Client,
     DCM_UID, DB_CMN, CmnUnit, FIBDatabase, pFIBDatabase, pFIBDataSet,
     Dialogs, DateUtils, Forms, DCM_Dict, UnFrmProgressBar, JclFileUtils,
     Graphics, Controls, Windows, Dcm_View, DICOM_charset, Uni, ExtCtrls,
     Math, Oracle, OracleData;

const c_proc_name = 'DicomServer';
      c_proc_WLname = 'DicomWLServer';
      c_proc_WADO   = 'WADOServer';
      //
      c_1_razdel   = 'MAIN';
      c_2_razdel   = 'DICOMTAGS_PRIEM';
      c_3_razdel   = 'HL7' ;
      c_4_razdel   = 'WORKLIST' ;

      c_5_razdel   = 'WADO';

      c_10_razdel     = 'DB_BACKUP';
      c_10_AutoBackup = 'AutoBackup (0/1)';
      c_10_PACS       = 'PACS (0/1)';
      c_10_WORKLIST   = 'WORKLIST (0/1)';
      c_10_WADO       = 'WADO (0/1)';
      c_10_CatalogDbBackup = 'Каталог BACKUP';
      c_10_HourDbBackup    = 'Время BACKUP (час)';
      c_10_MinuteDbBackup  = 'Время BACKUP (мин)';

      c_5_1_host   = 'HOSTNAME';
      c_5_2_port   = 'PORT';
      c_5_3_is_log   = 'LOG';
      c_5_4_temp_dir   = 'TEMPLATE_DIRECTORY';

      c_1_1_IP_FB = 'IP_DATABASE';
      с_1_2_BCP_CATALOG = 'RESERV_CATALOG';
      c_1_3_STORAGE_FOLDER = 'LOCAL_STORAGE'; // 'LOCAL_DB'
      c_LOG_FOLDER         = 'LOG_FOLDER';
      c_1_4_SERVER_PORT = 'PORT';
      c_1_5_AE_TITLE = 'AE_TITLE';
      c_1_6_IS_DEVICES_CHECK = 'CHK_DEVICE';
      c_1_7_IS_LOG_WRITE = 'USE_LOG';

      c_1_7_DB_LOG_WRITE      = 'write_log_to_database' ;
      c_1_7_DCM_NET_LOG_WRITE = 'write_log_dicom_network' ;
      c_1_7_ANinPID           = 'SEEK_AN_IN_PID' ;

      c_1_8_IS_CHK_AETITLE = 'CHK_AETITLE';
      с_1_9_LOCAL_CATALOG = 'LOCAL_CATALOG';
      c_1_10_autoload_folder = 'AUTOLOAD_FOLDER';
      c_1_11_autoload_timeout = 'AUTOLOAD_TIMEOUT';
      c_1_12_private_tags = 'private_tegs';
      c_1_13_AutoGenAccNmb = 'AutoGenerateAccessionNumber';
    //  c_1_14_AccNmbInPatientID = 'AccNmbInPatientID';
      c_4_1_IP_Worklist = 'IP_Worklist';
      c_4_2_PORT_Worklist   = 'PORT_Worklist';
      c_4_3_AETITLE_Worklist = 'AETITLE_Worklist';
      c_4_4_CheckAE_Worklist = 'CheckAE_Worklist';
      c_4_5_LOGWorklist = 'LOG_Worklist';
      c_4_5_MPPS = 'MPPS';
      //
      c_root_uid = '';
      // Timeout для приема/передачи данных
      c_Timeout = 1000*60 * 20; // 20 минут

      // ЭКГ
      c_partition = 3;
      c_kletka = 15;   // шаг клетки в пикселях

// ECG массив с измерениями
type
  t_ecg_actions = record
    r_type      : Integer;   // 0-горизонтальная отметка 1-вертикальная
    vPntiBeg,                // индексы в массиве точек начала и конца
    vPnti1Beg,
    vPnti2Beg,
    vPntiEnd,
    vPnti1End,
    vPnti2End,
    vPntiEnd1,
    vPnti1End1,
    vPnti2End1  : Integer;
  end;

// тип записи для выбранных пациентов с исследованиями из списка grid
// для последующей обработки
type t_p_pid_list_rec = record
  P_ENAME,
  P_PID,
  STUDYUID,
  ACCESSIONNUMBER,
  MODALITY,
  INSTANCEUID : string;
end;

// тип записи для хранения ответа` STORAGE_COMMITMENT
type SOP_LST = record
  sopclassUID    : string;
  sopinstanceUID : string;
  TransactionUID : string;
end;

var // записи для хранения ответа STORAGE_COMMITMENT
    v_success_SC_lst : array of SOP_LST;
    v_failed__SC_lst : array of SOP_LST;
    //
    v_ds_i : Integer;
    //
    v_amm_img_loaded,
    MoveImageCount : integer;
    //
    // список transfersyntax
    // !!! не удалять - ссылки из БД на UID TransferSyntax
    // добавлять новое сюда, а также в DICOMVCL
    // 1-й элемент: название , 2-й элемент: есть ли потеря качества: 1-сжатие с потерями; 0-без потерь
    // 3-й элемент: код transfer syntax в dicomVCL
    v_trsyntListCMN : array [0..2,0..2] of string[50] = ( // основной список
      ('ImplicitVRLittleEndian','0','8193'),
      ('ExplicitVRLittleEndian','0','8194'),
      ('ExplicitVRBigEndian','0','8195')
      );
    v_trsyntList : array [0..7,0..2] of string[50] = (    // список со сжатием
      ('нет','0','-1'),
      ('JPEG 8-bit','1','8196'), // 8196, '1.2.840.10008.1.2.4.50', 'JPEG Baseline Transfer Syntax (Process 1)' JPEG
      ('JPEG Lossless (Process 14, Selection Value 1)','0','8197'),  // 8197, '1.2.840.10008.1.2.4.70', 'JPEG Lossless Transfer Syntax (Process 14, Selection Value 1)'
      ('JPEG 2000','1','8221'),            // 8221, '1.2.840.10008.1.2.4.91', 'JPEG 2000, reversible'
      ('JPEG 2000 без потерь','0','8220'), // 8220, '1.2.840.10008.1.2.4.90', 'JPEG 2000, irreversible'
      ('RLELossless','0','8198'),           // 8198, '1.2.840.10008.1.2.5', 'RLE Lossless Transfer Syntax'
      ('JPEG 12-bit','1','8199'), // 8199, '1.2.840.10008.1.2.4.51', 'JPEG Extended (Process 2 & 4)' JPEGExtendedProcess_2_4
      ('JPEG без потерь','0','8205')          // 8205, '1.2.840.10008.1.2.4.57', 'JPEG Lossless, Non-Hierarchical (Process 14)'  JPEGLossless14
      // NOT FINISHED IN DICOMVCL
    //  'JPEGLossless80',          // 8218, '1.2.840.10008.1.2.4.80', 'JPEG Lossless80, lossless'
    //  'JPEGNearLossless81'       // 8219, '1.2.840.10008.1.2.4.81', 'JPEG Lossless81, near-lossless'
      );
    //
    v_DCM_ImageType_1 ,
    v_DCM_ImageType_2 ,
    v_DCM_StudyID_1 ,
    v_DCM_StudyID_2 ,
    v_DCM_PatientID_1 ,
    v_DCM_PatientID_2 ,
    v_DCM_StudyDescription_1 ,
    v_DCM_StudyDescription_2 ,
    v_DCM_AccessionNumber_1 ,
    v_DCM_AccessionNumber_2 ,
    v_DCM_DA_1 ,
    v_DCM_DA_2 ,
    v_DCM_DT_1 ,
    v_DCM_DT_2 ,
    v_DCM_StudyUID_1 ,
    v_DCM_StudyUID_2 ,
    v_DCM_SeriesUID_1 ,
    v_DCM_SeriesUID_2 ,
    v_DCM_PhysName_1 ,
    v_DCM_PhysName_2 ,
    v_DCM_pName_1 ,
    v_DCM_pName_2 ,
    v_DCM_pDateBorn_1 ,
    v_DCM_pDateBorn_2 ,
    v_DCM_pSex_1 ,
    v_DCM_pSex_2 ,
    v_DCM_AID_1 ,
    v_DCM_AID_2 ,
    v_AcqNum_1,
    v_AcqNum_2,
    v_DCM_InstanceUID_1 ,
    v_DCM_InstanceUID_2 ,
    v_DCM_KIN_1 ,
    v_DCM_KIN_2 : string;
    vModList : TStringList;

procedure ctrFullModList( pModList:TStringList );
procedure ctrModList;
procedure DestrModList;

function DICOMDateToStr( pDate:TDateTime ):string;
function crtTimeFromStr ( pStrTmp : string ) : TDateTime;

procedure SetFontECG ( p_pb1:TImage );
    
procedure SetColor ( p_Img:TImage; p_Color:TColor );

// процедура определения позиции точки в массиве по координатам на TImage.Canvas
procedure gtPosXY ( pWaveformData: TDicomWaveForm;
                    pX, pY : Integer;
                    var Pi  : Integer;
                    var pi1 : Integer;
                    var pi2 : Integer  );

// процедура инициализации параметров отрисовки ЭКГ
procedure pIniEcgDrawParameters;

// отрисовка ЭКГ
procedure pECGdraw ( das: TCnsDMTable;
                     p_pb1: TImage;
                     p_act : array of t_ecg_actions;
                     p_koeff_horiz:Integer=25;
                     p_koeff_vert:integer=10;
                     p_is_Savitsky : Boolean = False;
                     p_ShRpnt : Boolean = False;
                     p_is_on_Form : Boolean = True );

// отрисовка измерений
procedure risIzm ( p_WaveformData: TDicomWaveForm; p_pb1: TImage; var p_act : array of t_ecg_actions; p_koeff_horiz:Integer=25; p_koeff_vert:integer=10 );

// процедура прорисовки ключиков у ключевых снимков в датасете в DicomMultiViewer
procedure MultiSetKIN ( p_DicomMV: TDicomMultiViewer ) ;

function GetModuleVersion : string;

// формирование строки с описание dicom-запроса для протоколирования
function gt_dcm_str ( DA : TDicomAttributes ) : AnsiString;

// процедура ожидания окончания приемки снимков
procedure MyWaitForMove;

// процедура инициализации переменных цикла загрузки снимков C_MOVE
procedure MyIniMove;

// получение снимков по заданному списку studyUID или PatientID или SeriesInstanceUID
procedure gt_list_for_studyUIDs ( p_studyUID : String;
                                  p_host:string;
                                  p_port:Integer;
                                  p_local_port:Integer;
                                  p_CalledAET:string;
                                  p_CallingAET:string;
                                  p_progressbar_form : TFrmProgressBar;
                                  p_is_one : boolean;
                                  p_PatientID : String = '';
                                  p_SeriesInstanceUID : String = '';
                                  p_key  : Boolean = False;
                                  p_debug: Boolean = False;
                                  p_AccessioNumber : string = ''
                                );
    
// 
procedure gt_studyUID_lst ( const p_PatientID:string;
                            const p_host:string;
                            const p_port:Integer;
                            const p_CalledAET:string;
                            const p_CallingAET:string;
                            var p_studyUID_lst : TStringList;
                            var p_amm_rec:Integer
                          );

// процедура для протоколирования DICOM datasets - пишет данные в файлы
procedure ds_sav ( const ADataset: TDicomAttributes;
                   const ARequestDatasets:  TList = nil;
                   const AResponseDatasets: TList = nil;
                   const p_suff : string ='dcm';
                   const p_Dir : string = '';
                   const p_Write_Log : Boolean = True
                 );

// разрыв соединения
procedure MyDisconnectAssociation ( const p_CnsDicomConnection : TCnsDicomConnection );

// признак что получен ответ по STORAGE_COMMITMENT
function f_is_get_SC_answ (const p_TransactionUID:string) : Boolean;

// генерация уникального TransactionUID для DICOM запросов
function GenTransactionUID ( const p_callingAETitle : string = '' ) : AnsiString;

// процедура инициализации массивов для ответа по STORAGE_COMMITMENT
procedure SC_init(const p_TransactionUID:string);

// процедура записи результатов ответа PACS сервера по STORAGE_COMMITMENT
// производится добавление либо в массив успешных записей
// либо в массив failed
procedure SC_PACS_save ( const p_is_success     : Boolean;
                         const p_sopclassUID    : string;
                         const p_sopinstanceUID : string;
                         const p_TransactionUID : string
                       );

// функция возврата наименования команды по коду
function gt_cmd_name ( const p_cmd:Integer ):string;

// функция выполнения запроса C_ECHO
function f_C_ECHO ( const p_host       : string;
                    const p_port       : string;
                    const p_CalledAET  : string;
                    const p_CallingAET : string
                  ):boolean;

// процедура показывает результат команды Storage_commitment
procedure Storage_commitment_res_Show(const p_TransactionUID:string);

// функция запроса STORAGE_COMMITMENT
// p_SOPInstanceUID - список SOPInstanceUID
// p_CalledAET      - Called AE Title
// p_CallingAET     - Calling AE Title
// p_host           - host
// p_port           - port
function f_Storage_Commitment_CMD (  const p_SOPInstanceUID : TStringList;
                                     const p_CalledAET      : string;
                                     const p_CallingAET     : string;
                                     const p_host           : string;
                                     const p_port           : integer;
                                     const p_TransactionUID : string
                                   ):boolean;

// функция ответа по запросу Storage_commitment
// p_das1         - атрибуты для отправки
// p_CalledAET    - AETitle куда слать ответ
// p_CallingAET   - AETitle наш
// Результат : True - ответ отправлен False - ошибка отправки ответа
function f_Storage_commitment_resp ( var p_das1       : TDicomAttributes;
                                     const p_CalledAET  : string;
                                     const p_CallingAET : string;
                                     const p_DB : TFIBDatabase;
                                     const p_FIBTransaction : TpFIBTransaction
                                   ):boolean;

// функция проверки существования снимка в хранилище
// возвращаемое значение - имя DICOM файла со снимком
// p_SOPClassUID - класс объекта - сейчас только снимки
function f_chk_instance ( p_SOPClassUID : AnsiString;
                          p_SOPInstanceUID : AnsiString;
                          AClientThread: TDicomClientThread;
                          p_BaseDir : AnsiString
                        ):AnsiString;

//функция проверки является ли файл DICOM
function f_DICOM_file_chk ( const p_filename : ansistring ) : Boolean;

// функция возвращающая уникальную строку
function gt_uniq_StudyUID : ansistring;
// функция возвращающая уникальную строку
function gt_uniq_SeriesUID : ansistring;
// функция возвращающая уникальную строку
function gt_uniq_InstanceUID : ansistring;
// функция возвращающая уникальную строку
function gt_uniq_StudyID : ansistring;
// функция возвращающая уникальную строку
function gt_uniq_AccNmb : ansistring;

// функция возвращает id transfer syntax по номеру в массиве v_trsyntList
// если не нашли - =-1 - значение по умоляанию
function gt_id_transfer_syntax ( p_id_arr:Integer; p_not_set : Integer = -1 ):Integer;

// функция возвращает номер в массиве v_trsyntList по id transfer syntax
// если не нашли - =-1 - значение по умоляанию
function gt_nn_transfer_syntax ( p_nn_arr:Integer; p_not_set : Integer = -1 ):Integer;

function getListImages ( pPort : integer;
                        pHost,
                        pCalledTitle,
                        pCallingTitle,
                        pStudyUID,
                        pAccessionNumber : string;
                        var pImgSize : integer
                      ) : TStringList;

implementation

// функция возвращает id transfer syntax по номеру в массиве v_trsyntList
// если не нашли - =номеру в массиве v_trsyntList (0 - значение по умолчанию - значение нет)
function gt_id_transfer_syntax ( p_id_arr:Integer; p_not_set : Integer = -1 ):Integer;
begin
  if ((p_id_arr<Length(v_trsyntList)) and (p_id_arr>=0)) then
    Result := StrToInt( v_trsyntList[p_id_arr,2] )
  else
    Result := p_not_set;
end;

// функция возвращает номер в массиве v_trsyntList по id transfer syntax
// если не нашли - =-1 - значение по умолчанию
function gt_nn_transfer_syntax ( p_nn_arr:Integer; p_not_set : Integer = -1 ):Integer;
var i : Integer;
begin
  Result := p_not_set ;
  for I := 0 to Length(v_trsyntList) - 1 do
    if StrToInt( v_trsyntList[i,2] ) = p_nn_arr then
    begin
      Result := i ;
      Break;
    end;
end;

function GetModuleVersion : string;
var Ver: TJclFileVersionInfo;
begin
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    Result := Ver.FileVersion;
  finally
    Ver.Free;
  end;
end;

// процедура для протоколирования DICOM datasets - пишет данные в файлы
procedure ds_sav ( const ADataset: TDicomAttributes;
                   const ARequestDatasets:  TList = nil;
                   const AResponseDatasets: TList = nil;
                   const p_suff : string ='dcm';
                   const p_Dir : string = '';
                   const p_Write_Log : Boolean = True
                 );
var v_tm_str, v_dir : AnsiString; rq, rq1 : TDicomAttributes;
    v_TStr : TStringList; v_I:integer;
  function gt_filename (const p_str_in : ansistring) : AnsiString;
  begin
    gt_filename := v_dir + inttostr(v_ds_i)+'_'+ v_tm_str +'_'+ p_str_in+'_'+
                   inttostr(v_I) + '.'+p_suff;
  end;
begin
  if p_Write_Log then
  begin
    if (ADataset<>nil) then
    begin
      try
        inc(v_ds_i);
        if p_Dir='' then
          MnLg_ev('ds_i='+inttostr(v_ds_i), ExtractFilePath(paramstr(0))+'dcm_ds.log', False)
        else
          MnLg_ev('ds_i='+inttostr(v_ds_i), p_Dir+'\'+'dcm_ds.log', False);
        v_tm_str:=inttostr(HourOf(Now))+inttostr(MinuteOf(Now))+inttostr(SecondOf(Now))+inttostr(MilliSecondOf(Now));
        if p_Dir='' then
          v_dir:=ExtractFilePath(paramstr(0))+'query_log\'
        else
          v_dir:=p_Dir+'\'+'query_log\';
        if not DirectoryExists(v_dir) then begin
          if not CreateDir(v_dir) then
          begin
            if not ForceDirectories(v_dir) then
            begin
              MessageDlg('Ошибка создания каталога', mtError, [], 0);
              exit;
            end;
          end;
        end;
        MnLg_ev('ADataset.Count='+inttostr(ADataset.Count), ExtractFilePath(paramstr(0))+'dcm_ds.log', False);
        for v_I := 0 to ADataset.Count - 1 do begin
          ADataset.ItemByIndex[v_i].SaveToFile(gt_filename('ds'));
        end;
        v_I := 0;
        //
        try
          v_TStr := TStringList.Create;
          v_TStr.Clear;
          ADataset.ListAttrinute('receive Command: ', v_TStr);
          v_TStr.SaveToFile(gt_filename('cmd'));
          //
          v_TStr.Clear;
          if ARequestDatasets<>nil then begin
            if ARequestDatasets.Count>0 then begin
              rq := TDicomAttributes(ARequestDatasets[0]);
              rq.ListAttrinute('Receive Data: ', v_TStr);
              v_TStr.SaveToFile(gt_filename('Rcv'));
            end;
          end;
          //
          v_TStr.Clear;
          if AResponseDatasets<>nil then begin
            if AResponseDatasets.Count>0 then begin
              rq1 := TDicomAttributes(AResponseDatasets[0]);
              rq1.ListAttrinute('Response Data: ', v_TStr);
              v_TStr.SaveToFile(gt_filename('rsp'));
            end;
          end;
          //
        finally
          FreeAndNil(v_TStr);
        end;
        //
      except
        on E : Exception do
         { MnLg_ev( 'error save dataset : '+E.ClassName+' error raised, with message : '+E.Message,
                 ExtractFilePath(paramstr(0))+'dicom.err',
                 False
               );   }
      end;
    end else
    begin
      MnLg_ev('ADataset=nil', ExtractFilePath(paramstr(0))+'dcm_ds.log', False);
    end;
  end;
end;

// возвращает имя команды по коду
function gt_cmd_name ( const p_cmd:Integer ):string;
begin
  case p_cmd of
  C_DATABASE_REQUEST : gt_cmd_name:='C_DATABASE_REQUEST';
  C_DATABASE_RESPONSE : gt_cmd_name:='C_DATABASE_RESPONSE';

  N_EVENT_REPORT_REQUEST : gt_cmd_name:='N_EVENT_REPORT_REQUEST';
  N_EVENT_REPORT_RESPONSE : gt_cmd_name:='N_EVENT_REPORT_RESPONSE';
  N_GET_REQUEST : gt_cmd_name:='N_GET_REQUEST';
  N_GET_RESPONSE : gt_cmd_name:='N_GET_RESPONSE';
  N_SET_REQUEST : gt_cmd_name:='N_SET_REQUEST';
  N_SET_RESPONSE : gt_cmd_name:='N_SET_RESPONSE';
  N_ACTION_REQUEST : gt_cmd_name:='N_ACTION_REQUEST';
  N_ACTION_RESPONSE : gt_cmd_name:='N_ACTION_RESPONSE';
  N_CREATE_REQUEST : gt_cmd_name:='N_CREATE_REQUEST';
  N_CREATE_RESPONSE : gt_cmd_name:='N_CREATE_RESPONSE';
  N_DELETE_REQUEST : gt_cmd_name:='N_DELETE_REQUEST';
  N_DELETE_RESPONSE : gt_cmd_name:='N_DELETE_RESPONSE';
  C_STORE_REQUEST : gt_cmd_name:='C_STORE_REQUEST';
  C_STORE_RESPONSE : gt_cmd_name:='C_STORE_RESPONSE';
  C_GET_REQUEST : gt_cmd_name:='C_GET_REQUEST';
  C_GET_RESPONSE : gt_cmd_name:='C_GET_RESPONSE';
  C_FIND_REQUEST : gt_cmd_name:='C_FIND_REQUEST';
  C_FIND_RESPONSE : gt_cmd_name:='C_FIND_RESPONSE';
  C_MOVE_REQUEST : gt_cmd_name:='C_MOVE_REQUEST';
  C_MOVE_RESPONSE : gt_cmd_name:='C_MOVE_RESPONSE';
  C_ECHO_REQUEST : gt_cmd_name:='C_ECHO_REQUEST';
  C_ECHO_RESPONSE : gt_cmd_name:='C_ECHO_RESPONSE';
  C_CANCEL_FIND_REQUEST : gt_cmd_name:='C_CANCEL_FIND_REQUEST';
  else gt_cmd_name:='undefined='+inttostr(p_cmd);
  end;
end;

// функция выполнения запроса C_ECHO
function f_C_ECHO ( const p_host       : string;
                    const p_port       : string;
                    const p_CalledAET  : string;
                    const p_CallingAET : string
                  ):boolean;
var v_res : Boolean;
    CnsDicomConnection1: TCnsDicomConnection;
begin
  CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
  DCM_Connection.PDUTempPath:=GetTempDirectory;
  try
    CnsDicomConnection1.Host := p_host;
    CnsDicomConnection1.Port := StrToInt(p_port);
    CnsDicomConnection1.CalledTitle := p_CalledAET;
    if p_CallingAET <> '' then
      CnsDicomConnection1.CallingTitle := p_CallingAET;
    try
      v_res:=CnsDicomConnection1.C_Echo;
    except
      v_res:=False;
    end;
  finally
    MyDisconnectAssociation(CnsDicomConnection1);
    CnsDicomConnection1.Free;
    Application.ProcessMessages;
    Sleep(100);
  end;
  f_C_ECHO:=v_res;
end;

// функция запроса STORAGE_COMMITMENT
// p_SOPInstanceUID - список SOPInstanceUID
// p_CalledAET      - Called AE Title
// p_CallingAET     - Calling AE Title
// p_host           - host
// p_port           - port
function f_Storage_Commitment_CMD (  const p_SOPInstanceUID : TStringList;
                                     const p_CalledAET      : string;
                                     const p_CallingAET     : string;
                                     const p_host           : string;
                                     const p_port           : integer;
                                     const p_TransactionUID : string
                                   ):boolean;
var
  das1: TDicomAttributes;
  da1: TDicomAttribute;
  CnsDicomConnection1: TCnsDicomConnection;
  i : Integer; v_res : Boolean;
  //
  procedure Frm_SOPInstanceUID_Lst(const p_cur_SOPInstanceUID : string);
  var das2: TDicomAttributes;
  begin
    das2 := TDicomAttributes.Create;
    das2.AddVariant($0008, $1150, '1.2.840.10008.1.20.1');
    das2.AddVariant($0008, $1155, p_cur_SOPInstanceUID);
    da1.AddData(das2);
  end;
  //
begin
  //Operation  = N-ACTION
  das1 := TDicomAttributes.Create;
  // Transaction UID
  if p_TransactionUID<>'' then
      das1.AddVariant($0008, $1195, p_TransactionUID);
  da1 := das1.Add($0008, $1199); //  Referenced SOP Sequence
  //
  for I := 0 to p_SOPInstanceUID.Count - 1 do Frm_SOPInstanceUID_Lst( p_SOPInstanceUID[i] );
  //
  CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
  DCM_Connection.PDUTempPath:=GetTempDirectory;
  try
    CnsDicomConnection1.Host := p_host;
    CnsDicomConnection1.Port := p_port;
    CnsDicomConnection1.CalledTitle := p_CalledAET;
    CnsDicomConnection1.CallingTitle := p_CallingAET;
    CnsDicomConnection1.ReceiveTimeout := c_Timeout;
    CnsDicomConnection1.ClearPresentationContext;
    CnsDicomConnection1.addPresentationContext(StorageCommitmentPushModel);
    v_res := CnsDicomConnection1.N_ACTION(StorageCommitmentPushModel,
    // ошибка в компоненте DICOMVCL
    //   UIDs.ItemByIndex1[StorageCommitmentPushModelModelSOPInstance].AsString, das1);
    '1.2.840.10008.1.20.1.1', das1)
  finally
    MyDisconnectAssociation(CnsDicomConnection1);
    CnsDicomConnection1.Free;
    Application.ProcessMessages;
    Sleep(100);
  end;
  f_Storage_Commitment_CMD:=v_res;
end;                                   

// функция ответа по запросу Storage_commitment
// p_das1         - атрибуты для отправки
// p_CalledAET    - AETitle куда слать ответ
// p_CallingAET   - AETitle наш
// Результат : True - ответ отправлен False - ошибка отправки ответа
function f_Storage_commitment_resp ( var p_das1       : TDicomAttributes;
                                     const p_CalledAET  : string;
                                     const p_CallingAET : string;
                                     const p_DB : TFIBDatabase;
                                     const p_FIBTransaction : TpFIBTransaction
                                   ):boolean;
var v_res : Boolean;
    v_host,
    v_port : string;
    CnsDicomConnection1: TCnsDicomConnection;
begin
  v_res:=False; v_host:=''; v_port:='';
  if gt_device_params( p_CallingAET,
                       '',
                       nil,
                       v_host,
                       v_port)
  then begin
    // получили v_host v_port
    if (p_das1<>nil) // атрибуты должны быть
    then begin
      CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
      DCM_Connection.PDUTempPath:=GetTempDirectory;
      try
        CnsDicomConnection1.Host := v_host;
        CnsDicomConnection1.Port := MyStrToInt(v_port);
        CnsDicomConnection1.CalledTitle := p_CalledAET;
        CnsDicomConnection1.CallingTitle := p_CallingAET;
        CnsDicomConnection1.ReceiveTimeout := c_Timeout;

        CnsDicomConnection1.ClearPresentationContext;
        CnsDicomConnection1.addPresentationContext(StorageCommitmentPushModel);
        v_res:=CnsDicomConnection1.N_EVENT_REPORT(StorageCommitmentPushModel,
  //        UIDs.ItemByIndex1[StorageCommitmentPushModelModelSOPInstance].AsString, rq);
          '1.2.840.10008.1.20.1.1', p_das1); // константа
//          '', p_das1); // константа
      finally
        MyDisconnectAssociation(CnsDicomConnection1);
        CnsDicomConnection1.Free;
        Application.ProcessMessages;
        Sleep(100);
        p_das1 := nil;
      end;
    end;
  end else begin
    v_res:=False;
  end;
  f_Storage_commitment_resp:=v_res;
end;                              

// функция проверки существования снимка в хранилище
// возвращаемое значение - имя DICOM файла со снимком
// p_SOPClassUID - класс объекта - сейчас только снимки
function f_chk_instance ( p_SOPClassUID : AnsiString;
                          p_SOPInstanceUID : AnsiString;
                          AClientThread: TDicomClientThread;
                          p_BaseDir : AnsiString
                        ):AnsiString;
var FIBDataSet: TpFIBDataSet; v_res:AnsiString; v_UniQr : TUniQuery;
    v_pName, v_dir : AnsiString; y, m, d:Word; v_ORAQr : TOracleDataSet;
const c_sql_str = 'SELECT i.SERIESUID, i.INSTANCEUID, i.IMGNO, '+
                  '       st.ldate, i.imagetype, st.STUDYUID    '+
                  ' FROM IMAGES i, studies st            '+
                  ' WHERE i.studyuid=st.studyuid         '+
                  ' and INSTANCEUID=:P_SOPInstanceUID ';
begin
  v_res:='';
  if v_isOracle then     // ORACLE
  begin
    v_ORAQr := TOracleDataSet.Create(nil);
    try
      if AClientThread=nil then begin
        v_ORAQr.Session:=DB_CMN.OraConn;
      end else begin
        v_ORAQr.Session:=AClientThread.OraConn;
      end;
      v_ORAQr.SQL.Text := 'select i.'+gt_fld_name('images','seriesuid')+', '+
                  'i.'+gt_fld_name('images','instanceuid')+', '+
                  'i.'+gt_fld_name('images','imgno')+', '+
                  'st.ldate, '+
                  'i.'+gt_fld_name('images','imagetype')+', '+
                  'st.studyuid  '+
                  ' from '+v_pg_schema+'.images as i, '+v_pg_schema+'.studies as st '+
                  ' where i.'+gt_fld_name('images','studyuid')+'=st.studyuid '+
                  ' and i.'+gt_fld_name('images','instanceuid')+'=:p_sopinstanceuid ';
      v_ORAQr.DeclareAndSet('P_SOPInstanceUID', otString , p_SOPInstanceUID );
      v_ORAQr.Open;
      v_ORAQr.First;
      if not v_ORAQr.Eof then begin
        // определим каталог
        DecodeDate(v_ORAQr.FieldByName( gt_fld_name('IMAGES','ldate') ).AsDateTime, y, m, d);
        v_dir:=p_BaseDir+'\'+v_ORAQr.FieldByName( gt_fld_name('IMAGES','imagetype') ).AsString+'\'+
            IntToStr(y)+'\'+IntToStr(m)+'\'+IntToStr(d)+'\'+
            v_ORAQr.FieldByName( gt_fld_name('IMAGES','STUDYUID') ).AsString+'\'+
            v_ORAQr.FieldByName( gt_fld_name('IMAGES','SERIESUID') ).AsString+'\';
        v_pName := v_dir + Trim(v_ORAQr.FieldByName( gt_fld_name('IMAGES','INSTANCEUID') ).asstring) + '.dcm';
        if FileExists(v_pName) then
        begin
          v_res:=v_pName;
        end else
        begin
          v_pName := v_dir + Trim(v_ORAQr.FieldByName('IMGNO').asstring) + '.dcm';
          if FileExists(v_pName) then
          begin
            v_res:=v_pName;
          end else
          begin
            v_res:='';
          end;
        end;
      end else v_res:='';
    finally
      v_ORAQr.Close;
      v_ORAQr.Free;
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
      v_UniQr.SQL.Text := 'select i.'+gt_fld_name('images','seriesuid')+', '+
                  'i.'+gt_fld_name('images','instanceuid')+', '+
                  'i.'+gt_fld_name('images','imgno')+', '+
                  'st.ldate, '+
                  'i.'+gt_fld_name('images','imagetype')+', '+
                  'st.studyuid  '+
                  ' from '+v_pg_schema+'.images as i, '+v_pg_schema+'.studies as st '+
                  ' where i.'+gt_fld_name('images','studyuid')+'=st.studyuid '+
                  ' and i.'+gt_fld_name('images','instanceuid')+'=:p_sopinstanceuid ';
      v_UniQr.ParamByName('P_SOPInstanceUID').AsString := p_SOPInstanceUID;
      v_UniQr.Open;
      v_UniQr.First;
      if not v_UniQr.Eof then begin
        // определим каталог
        DecodeDate(v_UniQr.FieldByName( gt_fld_name('IMAGES','ldate') ).AsDateTime, y, m, d);
        v_dir:=p_BaseDir+'\'+v_UniQr.FieldByName( gt_fld_name('IMAGES','imagetype') ).AsString+'\'+
            IntToStr(y)+'\'+IntToStr(m)+'\'+IntToStr(d)+'\'+
            v_UniQr.FieldByName( gt_fld_name('IMAGES','STUDYUID') ).AsString+'\'+
            v_UniQr.FieldByName( gt_fld_name('IMAGES','SERIESUID') ).AsString+'\';
        v_pName := v_dir + Trim(v_UniQr.FieldByName( gt_fld_name('IMAGES','INSTANCEUID') ).asstring) + '.dcm';
        if FileExists(v_pName) then
        begin
          v_res:=v_pName;
        end else
        begin
          v_pName := v_dir + Trim(v_UniQr.FieldByName('IMGNO').asstring) + '.dcm';
          if FileExists(v_pName) then
          begin
            v_res:=v_pName;
          end else
          begin
            v_res:='';
          end;
        end;
      end else v_res:='';
    finally
      if v_UniQr.Transaction.Active then
              v_UniQr.Transaction.Commit;
      v_UniQr.Free;
    end;
  end else begin
    FIBDataset    := TpFIBDataset.Create(nil);
    try
      FIBDataSet.AutoCommit := True;
      if AClientThread=nil then begin
        FIBDataset.Database    := (AClientThread.v_ClThr_DB as TpFIBDatabase);
        FIBDataset.Transaction := (AClientThread.v_ClThr_trRead as TpFIBTransaction);
      end else begin
        FIBDataset.Database    := DB_CMN.DB;
        FIBDataset.Transaction := DB_CMN.trRead;
      end;
      if not FIBDataset.Transaction.Active then
            FIBDataset.Transaction.Active:=True;
      FIBDataSet.SQLs.SelectSQL.Text := c_sql_str;
      FIBDataSet.ParamByName('P_SOPInstanceUID').AsString := p_SOPInstanceUID;
      FIBDataSet.Open;
      FIBDataSet.First;
      if not FIBDataSet.Eof then begin
        // определим каталог
        DecodeDate(FIBDataSet.FieldByName('ldate').AsDateTime, y, m, d);
        v_dir:=p_BaseDir+'\'+FIBDataSet.FieldByName('imagetype').AsString+'\'+
            IntToStr(y)+'\'+IntToStr(m)+'\'+IntToStr(d)+'\'+
            FIBDataSet.FieldByName('STUDYUID').AsString+'\'+
            FIBDataSet.FieldByName('SERIESUID').AsString+'\';
        v_pName := v_dir + Trim(FIBDataSet.FieldByName('INSTANCEUID').asstring) + '.dcm';
        if FileExists(v_pName) then
        begin
          v_res:=v_pName;
        end else
        begin
          v_pName := v_dir + Trim(FIBDataSet.FieldByName('IMGNO').asstring) + '.dcm';
          if FileExists(v_pName) then
          begin
            v_res:=v_pName;
          end else
          begin
            v_res:='';
          end;
        end;
      end else v_res:='';
    finally
      FreeAndNil(FIBDataSet);
    end;
  end;
  f_chk_instance:=v_res;
end;

// признак что получен ответ по STORAGE_COMMITMENT
function f_is_get_SC_answ (const p_TransactionUID:string) : Boolean;
var v_res:Boolean; i:Integer;
begin
  v_res:=False;
  for I := 0 to Length(v_success_SC_lst) - 1 do begin
    if (v_success_SC_lst[i].TransactionUID=p_TransactionUID) then begin
      v_res:=True;
    end;
  end;
  for I := 0 to Length(v_failed__SC_lst) - 1 do begin
    if (v_failed__SC_lst[i].TransactionUID=p_TransactionUID) then begin
      v_res:=True;
    end;
  end;
  f_is_get_SC_answ:=v_res;
end;

// процедура инициализации массивов для ответа по STORAGE_COMMITMENT
procedure SC_init(const p_TransactionUID:string);
var i, v_strt : Integer;
// label l1, l2;
begin
  v_strt:=0;
  if length(v_success_SC_lst)>0 then
  for I := v_strt to Length(v_success_SC_lst) - 1 do begin
    if (v_success_SC_lst[i].TransactionUID=p_TransactionUID) then begin
      v_success_SC_lst[i].sopclassUID    := '';
      v_success_SC_lst[i].sopinstanceUID := '';
      v_success_SC_lst[i].TransactionUID := '';
    end;
  end;
  if length(v_failed__SC_lst)>0 then
  for I := v_strt to Length(v_failed__SC_lst) - 1 do begin
    if (v_failed__SC_lst[i].TransactionUID=p_TransactionUID) then begin
      v_failed__SC_lst[i].sopclassUID    := '';
      v_failed__SC_lst[i].sopinstanceUID := '';
      v_failed__SC_lst[i].TransactionUID := '';
    end;
  end;
 { v_strt:=0;
  l1:
  for I := v_strt to Length(v_success_SC_lst) - 1 do begin
    if (v_success_SC_lst[i].TransactionUID=p_TransactionUID) then begin
      v_success_SC_lst[i].sopclassUID    := v_success_SC_lst[Length(v_success_SC_lst) - 1].sopclassUID;
      v_success_SC_lst[i].sopinstanceUID := v_success_SC_lst[Length(v_success_SC_lst) - 1].sopinstanceUID;
      v_success_SC_lst[i].TransactionUID := v_success_SC_lst[Length(v_success_SC_lst) - 1].TransactionUID;
      SetLength( v_success_SC_lst, Length(v_success_SC_lst) - 1 );
      v_strt:=i;
      goto l1;
    end;
  end; }
end;

// процедура записи результатов ответа PACS сервера по STORAGE_COMMITMENT
// производится добавление либо в массив успешных записей
// либо в массив failed
procedure SC_PACS_save ( const p_is_success     : Boolean;
                         const p_sopclassUID    : string;
                         const p_sopinstanceUID : string;
                         const p_TransactionUID : string
                       );
var v_len : Integer;
begin
  if p_is_success then begin
    v_len:=Length(v_success_SC_lst);
    SetLength(v_success_SC_lst,v_len+1);
    v_success_SC_lst[v_len].sopclassUID:=p_sopclassUID;
    v_success_SC_lst[v_len].sopinstanceUID:=p_sopinstanceUID;
    v_success_SC_lst[v_len].TransactionUID:=p_TransactionUID;
  end else begin
    v_len:=Length(v_failed__SC_lst);
    SetLength(v_failed__SC_lst,v_len+1);
    v_failed__SC_lst[v_len].sopclassUID:=p_sopclassUID;
    v_failed__SC_lst[v_len].sopinstanceUID:=p_sopinstanceUID;
    v_failed__SC_lst[v_len].TransactionUID:=p_TransactionUID;
  end;
end;

// процедура показывает результат команды Storage_commitment
procedure Storage_commitment_res_Show(const p_TransactionUID:string);
var v_message : AnsiString; i,j :Integer; v_is_error : boolean;
begin
  // ожидание ответа сервера на наш локальный listener
  v_message:=''; v_is_error:=False;
  for I := 0 to 10 do begin
    if f_is_get_SC_answ(p_TransactionUID) then begin
      if ((length(v_failed__SC_lst)=0) and
          (length(v_success_SC_lst)=0))
      then begin
        v_message:='Ошибка. Не получен ответ PACS сервера';
      end else if length(v_failed__SC_lst)>0 then begin
        v_message:=v_message+#13+'Ошибки при передаче изображений';
        for j := 0 to length(v_failed__SC_lst) - 1 do
        begin
          if v_failed__SC_lst[j].TransactionUID=p_TransactionUID
          then begin
            v_is_error:=True;
            v_message:=v_message+#13+v_failed__SC_lst[j].sopinstanceUID;
          end;
        end;
      end else if length(v_success_SC_lst)>0 then begin
        v_message:=v_message+#13+'Успешная передача изображений';
        for j := 0 to length(v_success_SC_lst) - 1 do
        begin
          if v_success_SC_lst[j].TransactionUID=p_TransactionUID then
            v_message:=v_message+#13+v_success_SC_lst[j].sopinstanceUID;
        end;
      end;
      if v_is_error then begin
        MessageDlg('Произошли ошибки при отправке данных на сервер.'+#13+#10+'Повторите передачу данных.', mtError, [mbOK], 0);
      end else MessageDlg('Данные успешно отправлены на сервер', mtInformation, [mbOK], 0);
      SC_init(p_TransactionUID);
      Break;
    end;
  end;
  if (v_message='') then MessageDlg('Ошибка. Не получен ответ PACS сервера', mtError, [mbOK], 0);
end;

// генерация уникального TransactionUID для DICOM запросов
function GenTransactionUID ( const p_callingAETitle : string = '' ) : AnsiString;
var v_res : ansistring; v_now : TDateTime; i :Integer; v_ch : char; v_cod:Byte;
begin
  if (Trim(p_callingAETitle)<>'') then
  begin
    v_res:=DCM_Attributes.DicomImplementationClassUID+'.';
    for I := 0 to Length(p_callingAETitle) - 1 do begin
      v_ch  := p_callingAETitle[i];
      v_cod := ord(v_ch);
      v_res := v_res+inttostr(v_cod);
    end;
  end;
  v_now:=Now;
  v_res:=v_res+'.'+inttostr(YearOf(v_now))+'.'+
         inttostr(MonthOf(v_now))+'.'+
         inttostr(DayOf(v_now))+'.'+
         inttostr(SecondOf(v_now))+'.'+
         inttostr(MilliSecondOf(v_now));
  if Length(v_res)>80 then v_res:=Copy(v_res,1,80);
  GenTransactionUID:=v_res;
end;

//функция проверки является ли файл DICOM
function f_DICOM_file_chk ( const p_filename : ansistring ) : Boolean;
var F: TextFile; v_res:Boolean; v_str1:string[128]; v_str2:string[4];
begin
  try
    if FileExists(p_filename) then begin
      AssignFile(F, p_filename);
      try
        Reset(f);
        Read(F,v_str1);  // чтение первых 128 байт
        Read(F,v_str2);  // чтение 4 байт
        v_res:=(v_str2='DICM'); // если DICM - файл соответствует DICOM
      finally
        CloseFile(F);
      end;
    end else begin
      v_res:=False;
    end;
  except
    v_res:=False;
  end;
  f_DICOM_file_chk:=v_res;
end;

// разрыв соединения
procedure MyDisconnectAssociation ( const p_CnsDicomConnection : TCnsDicomConnection );
begin
  p_CnsDicomConnection.Association.Clear;
  p_CnsDicomConnection.Disconnect;
  Application.ProcessMessages;
end;

// процедура инициализации переменных цикла загрузки снимков C_MOVE
procedure MyIniMove;
begin
  v_amm_img_loaded:=0;
  MoveImageCount:=0;
  CmnUnit.v_exit_progressbar:=0;
end;

procedure MyWaitForMove;
var i:Integer;
begin
  // вставим ожидание
  Application.ProcessMessages;
  // цикл ожидания приемки всех снимков
 // sleep(1000);
  Application.ProcessMessages;
  i:=0;
  while ((v_amm_img_loaded=0) or (CmnUnit.v_exit_progressbar<>2))  // событие - остановим ползунок
  do
  begin
    Inc(i);
    sleep(1000);
    if i<60*10 then Break;
  end;
  while v_amm_img_loaded<MoveImageCount do
  begin
    Application.ProcessMessages;
    sleep(100);
    if (((CmnUnit.v_exit_progressbar=2) and
        (v_amm_img_loaded=MoveImageCount))
     or (CmnUnit.v_exit_progressbar=1) )
    then
    begin
      CmnUnit.v_exit_progressbar:=0;
      Break; // выход
    end;
  end;
end;

// получение снимков по заданному списку studyUID или PatientID или SeriesInstanceUID
procedure gt_list_for_studyUIDs ( p_studyUID : String;
                                  p_host:string;
                                  p_port:Integer;
                                  p_local_port:Integer;
                                  p_CalledAET:string;
                                  p_CallingAET:string;
                                  p_progressbar_form : TFrmProgressBar;
                                  p_is_one : boolean;
                                  p_PatientID : String = '';
                                  p_SeriesInstanceUID : String = '';
                                  p_key  : Boolean = False;
                                  p_debug: Boolean = False;
                                  p_AccessioNumber : string = ''
                                );
var das: TDicomAttributes;
    k1, k2: Integer;
    str1 : AnsiString;
    CnsDicomConnection1 : TCnsDicomConnection;
    v_mn_timeout_old : Integer;
begin
  CnsDicomConnection1 := TCnsDicomConnection.Create(nil);  // по- кмолчанию
  DCM_Connection.PDUTempPath:=GetTempDirectory;
  try
//    CnsDicomConnection1.MySetTransferSyntax( JPEGLossless );
    CnsDicomConnection1.MySetTransferSyntax( RLELossless );  //  JPEGLossless
    // параметры соединения для выполнения C_MOVE
  //  CnsDicomConnection1.ResetSynTax;
    CnsDicomConnection1.Host := p_host;
    CnsDicomConnection1.Port := p_port;
    CnsDicomConnection1.CalledTitle := p_CalledAET;
    CnsDicomConnection1.CallingTitle := p_CallingAET;
    // не указываем - если пусто - возвращается на вызывающий AETitle
    // CnsDicomConnection1.MoveDestination := frmMain.teCalling.Text;
    CnsDicomConnection1.ReceiveTimeout := 60 * 1000 * 2; // ждем 2 минуты - иначе ошибка
    das := TDicomAttributes.Create;
    with das do begin
      if ( (p_PatientID<>'') and
           (p_SeriesInstanceUID='') and
           (p_studyUID='') and
           (p_AccessioNumber='')
         ) then
      begin
        AddVariant(dQueryRetrieveLevel, 'PATIENT');  // dQueryRetrieveLevel = 78
        AddVariant(dPatientID, p_PatientID); // $10, $20
      end else
      if p_SeriesInstanceUID<>'' then
      begin
        AddVariant(dQueryRetrieveLevel, 'SERIES');
        AddVariant(dSeriesInstanceUID, p_SeriesInstanceUID);
      end else if p_studyUID<>'' then
      begin
        AddVariant(dQueryRetrieveLevel, 'STUDY');
        AddVariant(dStudyInstanceUID, p_studyUID);
      end else
      begin
        AddVariant(dQueryRetrieveLevel, 'STUDY');
        AddVariant(dAccessionNumber, p_AccessioNumber);  //  Add(77, $0008, $0050, tSH, 'AccessionNumber', '1');
      end;
      if p_key then // ключевые снимки
      begin
        AddVariant($2809, $001D, 1);
      end;
      Add($0008, $0090);
      Add($0008, $1030);
      Add($0010, $0010);
      Add($0010, $0020);
      Add($0010, $0030);
      Add($0010, $0040);
      Sort; // обязательно отсортируем теги DICOM
    end;
      // команда C_MOVE
      MyIniMove;

     // ShowMessage('PREPARE c-move');

   {  MessageDlg('C_MOVE: '+#13+
                'Host = '+CnsDicomConnection1.Host+#13+
                'Port = '+IntToStr(CnsDicomConnection1.Port)+#13+
                'CalledTitle = '+CnsDicomConnection1.CalledTitle+#13+
                'CallingTitle = '+CnsDicomConnection1.CallingTitle, mtWarning, [mbOK], 0);
     }
      if p_debug then
        MnLg_ev( 'C_MOVE: '+#13+
          'Host = '+CnsDicomConnection1.Host+#13+
          'Port = '+IntToStr(CnsDicomConnection1.Port)+#13+
          'CalledTitle = '+CnsDicomConnection1.CalledTitle+#13+
          'CallingTitle = '+CnsDicomConnection1.CallingTitle,
          ExtractFilePath(paramstr(0))+'c_move.log',
          False
         );
      CnsDicomConnection1.v_is_log := p_debug;
      CnsDicomConnection1.v_log_filename := ExtractFilePath(paramstr(0))+'c_move.log';
     // CnsDicomConnection1.SetReceiveTimeout(1000*10); // 10 секунд
     // CnsDicomConnection1.MaxPduSize:=16384;
      if CnsDicomConnection1.C_MOVE(das) then // получаем снимки
      begin
        das := CnsDicomConnection1.Association.ReceiveCommand;
        str1 := das.GetString(0, $902);
        if str1 <> '' then
        begin
          MessageDlg('Ошибка выполнения команды C_MOVE: ' + str1, mtError, [mbOK], 0);
        end else begin
          k1 := das.getInteger(0, $1020);   // NumberOfRemainingSuboperations
          k2 := das.getInteger(0, $1021);   // NumberOfCompletedSuboperations
          MoveImageCount := k1 + k2; // кол-во снимков которые будут переданы сервером

//ShowMessage('снимков '+IntToStr(MoveImageCount));

          if MoveImageCount=0 then
            MoveImageCount:=1;
          // установим  максимальное кол-во для ползунка
          p_progressbar_form.clc_posMain( MoveImageCount,
                       'загрузка исследования',
                       p_is_one
                     );
        end;
      end else begin  // ошибка если команда завершится неуспешно
        // обязательно вставить обратотку ошибки и вывод сообщения
       // MessageDlg('Ошибка выполнения команды C_MOVE', mtError, [mbOK], 0);
      end;
      // вставим ожидание
      MyWaitForMove;
      das.Clear;
  finally
    v_mn_timeout_old := DCM_Connection.v_mn_timeout;
    DCM_Connection.v_mn_timeout:=100;
    CnsDicomConnection1.SetReceiveTimeout( DCM_Connection.v_mn_timeout );
    DCM_Connection.v_is_raise_exceptions:=False;
    MyDisconnectAssociation(CnsDicomConnection1);
    DCM_Connection.v_is_raise_exceptions:=True;
    DCM_Connection.v_mn_timeout := v_mn_timeout_old;
//    if (CnsDicomConnection1.Association.IsConnected) and CnsDicomConnection1.Socket.Connected then
//      CnsDicomConnection1.Association.sendReleaseRequest;
    CnsDicomConnection1.Free;
    Application.ProcessMessages;
    Sleep(100);
  end;
end;

// вспомогательные процедуры
procedure gt_studyUID_lst ( const p_PatientID:string;
                            const p_host:string;
                            const p_port:Integer;
                            const p_CalledAET:string;
                            const p_CallingAET:string;
                            var p_studyUID_lst : TStringList;
                            var p_amm_rec:Integer
                          );
var DA, DA1: TDicomAttributes;
    i: Integer; //v_res : Boolean;
    CnsDicomConnection1: TCnsDicomConnection;
    v_studyid,
    v_studyuid, v_PatientID  : string;
begin
  if Trim(p_PatientID)<>'' then begin
    CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
    DCM_Connection.PDUTempPath:=GetTempDirectory;
    try
      CnsDicomConnection1.Host := p_host;
      CnsDicomConnection1.Port := p_port;
      CnsDicomConnection1.CalledTitle := p_CalledAET;
      if p_CallingAET <> '' then
        CnsDicomConnection1.CallingTitle := p_CallingAET;

      DA := TDicomAttributes.Create;

      DA.AddVariant(dQueryRetrieveLevel, 'STUDY' ); //   PATIENT
      DA.AddVariant(dPatientID, p_PatientID) ;
      DA.Add($0020, $000D); // dStudyInstanceUID
      DA.Add($0020, $0010); // dStudyID
      DA.Sort;
      if CnsDicomConnection1.C_FIND(DA) = True then
      begin
        p_amm_rec:=p_amm_rec+CnsDicomConnection1.ReceiveDatasets.Count;
        if p_amm_rec > 0 then
        begin
          for i := 0 to CnsDicomConnection1.ReceiveDatasets.Count - 1 do
          begin
            DA1 := TDicomAttributes(CnsDicomConnection1.ReceiveDatasets[i]);
            v_PatientID:=DA1.GetString(dPatientID);
            v_studyid  := DA1.GetString(dStudyID);
            v_studyuid := DA1.GetString(dStudyInstanceUID);
            if (Trim(v_PatientID)=Trim(p_PatientID)) then
              p_studyUID_lst.Add(v_studyuid);
          end;
          CnsDicomConnection1.ReceiveDatasets.Clear;
        end
        else
        begin
          p_amm_rec:=0;
        end;
      end;
    finally
      MyDisconnectAssociation(CnsDicomConnection1);
      CnsDicomConnection1.Free;
      Application.ProcessMessages;
      Sleep(100);
    end;
  end;
end;

// формирование строки с описание dicom-запроса для протоколирования
function gt_dcm_str ( DA : TDicomAttributes ) : AnsiString;
var v_res : AnsiString;
begin
  v_res :=  ' CommandField='+inttostr(DA.getInteger(dCommandField))+' '+#13+
            gt_cmd_name(DA.getInteger(dCommandField))//+
//            ' codepage='''+DA.GetString($08, $05)+''''+#13
            ;
  Result:=v_res;
end;

// функция возвращающая уникальную строку
function gt_uniq_StudyUID : ansistring;
begin
  Result:='ST'+gt_uniq_str;
end;

// функция возвращающая уникальную строку
function gt_uniq_SeriesUID : ansistring;
begin
  Result:='SE'+gt_uniq_str;
end;

// функция возвращающая уникальную строку
function gt_uniq_InstanceUID : ansistring;
begin
  Result:='IN'+gt_uniq_str;
end;

// функция возвращающая уникальную строку
function gt_uniq_StudyID : ansistring;
begin
  Result := inttostr(dayof(Date))+
            inttostr( GetTickCount );
end;

// функция возвращающая уникальную строку
function gt_uniq_AccNmb : ansistring;
begin
  Result := 'AN-'+inttostr(dayof(Date))+'.'+inttostr(monthof(Date))+'.'+inttostr(yearof(Date))+'.'+
            inttostr( GetTickCount );
end;

// процедура прорисовки ключиков у ключевых снимков в датасете в DicomMultiViewer
procedure MultiSetKIN ( p_DicomMV: TDicomMultiViewer ) ;
var k : integer;
begin
  // установим KIN
  for k := 0 to p_DicomMV.DicomDatasets.Count - 1 do
  begin
    if p_DicomMV.DicomDatasets.Item[k].Attributes.getInteger($2809, $001D)=1 then
      p_DicomMV.DicomDatasets.Item[k].Attributes.MultiSelected2:=True;
  end;
end;

procedure SetColor ( p_Img:TImage; p_Color:TColor );
begin
  p_Img.Canvas.Pen.Color := p_Color;
  p_Img.Canvas.Font.Color := p_Color;
end;

procedure SetFontECG ( p_pb1:TImage );
begin
  if v_font_ECG<>nil then
  begin
    p_pb1.Canvas.Font := v_font_ECG;
    p_pb1.Canvas.Font.Name := v_font_ECG.Name; // 'Tahoma';
  end;
  p_pb1.Canvas.Font.Color := v_color_text_ECG;
  p_pb1.Canvas.Font.Size := v_size_font_ECG; // Размер шрифта
  if v_bold_font_ECG and v_italic_font_ECG then                 // Жирный шрифт    // Под наклоном
    p_pb1.Canvas.Font.Style := [fsBold, fsItalic]
  else if (not v_bold_font_ECG) and v_italic_font_ECG then
    p_pb1.Canvas.Font.Style := [fsItalic]
  else if v_bold_font_ECG and ( not v_italic_font_ECG) then
    p_pb1.Canvas.Font.Style := [fsBold]
  else if (not v_bold_font_ECG) and (not v_italic_font_ECG) then
    p_pb1.Canvas.Font.Style := [];
end;

// процедура определения позиции точки в массиве по координатам на TImage.Canvas
procedure gtPosXY ( pWaveformData: TDicomWaveForm;
                    pX, pY : Integer;
                    var Pi  : Integer;
                    var pi1 : Integer;
                    var pi2 : Integer );
var i,i1,i2, vNmbChannel, vBeg,vEnd : Integer; vDltInt : Boolean;
const cDelta = 5;
begin  // v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].r_SamplingFrequency
  Pi:=-1; pi1:=-1; pi2:=-1; vNmbChannel:=0; vDltInt:=False;
  for I := 0 to Length(pWaveformData.v_data) - 1 do // по записям
    for i2 := 0 to pWaveformData.v_data[i].r_amm-1 do // по отведениям
    begin
      inc(vNmbChannel);
      for i1 := 0 to High(pWaveformData.v_data[i].r_data)-1 do // по значениям
      begin
        if ( ( Abs(pWaveformData.v_data[i].r_pnt_data[i2,i1].r_x-pX)<=cDelta ) and
             ( Abs(pWaveformData.v_data[i].r_pnt_data[i2,i1].r_y-pY)<=cDelta ) )
        then
        begin
          if not vDltInt then vBeg:=i1;
          vEnd:=i1;
          vDltInt:=True;
          Pi:=i;
          pi1:=i1;
          pi2:=i2;
        end else if vDltInt then Break;
      end;
    end;
    pi1:=Trunc((vBeg+vEnd)/2)
end;

// отрисовка измерений
procedure risIzm ( p_WaveformData: TDicomWaveForm;
                   p_pb1: TImage;
                   var p_act : array of t_ecg_actions;
                   p_koeff_horiz:Integer=25;
                   p_koeff_vert:integer=10 );
var i// i1, v_n_chnl,
 //   v_y_top, v_height,
   // v_x, v_y, i4
   : Integer;
    //v_k_vert, //v_k_horiz, //v_kx, //vLenTmp,
    vXTmp,vYTmp : Extended;
    vColorOld, vPenColor, vFontColor : TColor;
    vStyleOld : TBrushStyle;
    vWidthPnt, vXsr,vYsr, //vValBeg,vValEnd,
    {vi1b,vi2b,vi1e,vi2e,}vSamplingFrequency : Integer;
  procedure drawX ( x,y, Xwidth : integer );
  begin
    p_pb1.Canvas.MoveTo( x-Xwidth, y );
    p_pb1.Canvas.LineTo( x+Xwidth, y );
    p_pb1.Canvas.MoveTo( x, y-Xwidth );
    p_pb1.Canvas.LineTo( x, y+Xwidth );
  end;
  procedure pVertOtm;
  var vPosXBeg, vPosYBeg, vPosXEnd, vPosYEnd, valBeg,//ValEnd,
      viBeg, viEnd,
      vi1Beg, vi1End,
      vi2Beg, vi2End       : Integer;
  begin
    viBeg  := p_act[i].vPntiBeg ;
    viEnd  := p_act[i].vPntiEnd ;
    vi1Beg := p_act[i].vPnti1Beg ;
    vi1End := p_act[i].vPnti1End ;
    vi2Beg := p_act[i].vPnti2Beg ;
    vi2End := p_act[i].vPnti2End ;
    vPosXBeg := p_WaveformData.v_data[ viBeg ].r_pnt_data[ vi2Beg, vi1Beg ].r_x;
    vPosYBeg := p_WaveformData.v_data[ viBeg ].r_pnt_data[ vi2Beg, vi1Beg ].r_y;
    valBeg := p_WaveformData.v_data[ viBeg ].r_pnt_data[ vi2Beg, vi1Beg ].r_Value;
    p_pb1.Canvas.Pen.Color := v_otmetka_ECG;
    p_pb1.Canvas.Pen.Width := v_size_line_rzd_ECG;
    p_pb1.Canvas.Rectangle( vPosXBeg,             // нарисуем линию отметки
                            p_WaveformData.v_data[ viBeg ].r_pnt_data[ vi2Beg, vi1Beg ].v_y_top,
                            vPosXBeg+1,
                            p_WaveformData.v_data[ viBeg ].r_pnt_data[ vi2Beg, vi1Beg ].v_y_bottom );
    if viEnd<>-1 then
    begin
      vPosXEnd := p_WaveformData.v_data[ viEnd ].r_pnt_data[ vi2End, vi1End ].r_x;
      vPosYEnd := p_WaveformData.v_data[ viEnd ].r_pnt_data[ vi2End, vi1End ].r_y;
      p_pb1.Canvas.Rectangle( vPosXBeg,             // нарисуем линию отметки
                              p_WaveformData.v_data[ viBeg ].r_pnt_data[ vi2Beg, vi1Beg ].v_y_top,
                              vPosXEnd,
                              p_WaveformData.v_data[ viBeg ].r_pnt_data[ vi2Beg, vi1Beg ].v_y_bottom );
    end;
  end;
  procedure pOtrezok;
  var vPosXBeg, vPosYBeg, vPosXEnd, vPosYEnd, valBeg,ValEnd,
      viBeg, viEnd,
      vi1Beg, vi1End,
      vi2Beg, vi2End       : Integer;
  begin
    viBeg  := p_act[i].vPntiBeg ;
    viEnd  := p_act[i].vPntiEnd ;
    vi1Beg := p_act[i].vPnti1Beg ;
    vi1End := p_act[i].vPnti1End ;
    vi2Beg := p_act[i].vPnti2Beg ;
    vi2End := p_act[i].vPnti2End ;
    vPosXBeg := p_WaveformData.v_data[ viBeg ].r_pnt_data[ vi2Beg, vi1Beg ].r_x;
    vPosYBeg := p_WaveformData.v_data[ viBeg ].r_pnt_data[ vi2Beg, vi1Beg ].r_y;
    valBeg := p_WaveformData.v_data[ viBeg ].r_pnt_data[ vi2Beg, vi1Beg ].r_Value;
    p_pb1.Canvas.Brush.Color := clRed;
    p_pb1.Canvas.Brush.Style := bsSolid;
    p_pb1.Canvas.Pen.Color   := clRed;
    p_pb1.Canvas.Font.Color  := clRed;
    vWidthPnt := 4;
    drawX( vPosXBeg , vPosYBeg , vWidthPnt*2 );  
    if viEnd<>-1 then
    begin
      vPosXEnd := p_WaveformData.v_data[ viEnd ].r_pnt_data[ vi2End, vi1End ].r_x;
      vPosYEnd := p_WaveformData.v_data[ viEnd ].r_pnt_data[ vi2End, vi1End ].r_y;
      valEnd := p_WaveformData.v_data[ viEnd ].r_pnt_data[ vi2End, vi1End ].r_Value;
      vSamplingFrequency := p_WaveformData.v_data[ viBeg ].r_pnt_data[ vi2End, vi1End ].r_SamplingFrequency;
      p_pb1.Canvas.MoveTo( vPosXBeg , vPosYBeg );
      p_pb1.Canvas.LineTo( vPosXEnd , vPosYEnd );
      drawX( vPosXEnd , vPosYEnd, vWidthPnt*2 );
      //
      SetColor(p_pb1, v_color_text_ECG);
      SetFontECG(p_pb1);
      p_pb1.Canvas.Brush.Color := clWhite;
      p_pb1.Canvas.Pen.Color := clWhite;
      p_pb1.Canvas.Font.Color := clBlack;
      p_pb1.Canvas.Font.Size := 8;
      //
      vXTmp := Abs(vPosXEnd-vPosXBeg) ;
      vYTmp := Abs(vPosYEnd-vPosYBeg) ;
      vXsr:= Trunc( Min(vPosXBeg,vPosXEnd) + vXTmp/2 );
      vYsr:= Trunc( Min(vPosYBeg,vPosYEnd) + vYTmp/2 );
      //
      if (vSamplingFrequency>0) then
      begin
        p_pb1.Canvas.TextOut( vXsr, vYsr+5, FloatToStr( RoundTo( 1000 * Abs(vi1End-vi1Beg)/vSamplingFrequency , -2 ) )+' мс' );   // по горизонтали: 1 сек - 5 клеток
        p_pb1.Canvas.TextOut( vXsr, vYsr+20, FloatToStr( RoundTo( Abs(valEnd-valBeg)/1000 , -2 ) )+' мв' );        // по вертикали: 1 мв - 2 клетки        /(2*c_kletka)
      end else
        p_pb1.Canvas.TextOut( vXsr, vYsr, 'UDF' );
    end;
    p_pb1.Canvas.Brush.Style := bsClear ;
    p_pb1.Canvas.Refresh;
  end;
  procedure pUgol;
  var vPosXBeg, vPosYBeg, vPosXEnd, vPosYEnd, valBeg,//ValEnd,
      vPosXEnd1, vPosYEnd1, //ValEnd1,
      viBeg, viEnd, viEnd1,
      vi1Beg, vi1End, vi1End1,
      vi2Beg, vi2End, vi2End1       : Integer;
      v1_2,v2_3,v3_1, vTmp1,
      vTmp2, vUgol : Extended;
  begin
    viBeg  := p_act[i].vPntiBeg ;
    viEnd  := p_act[i].vPntiEnd ;
    viEnd1  := p_act[i].vPntiEnd1 ;
    vi1Beg := p_act[i].vPnti1Beg ;
    vi1End := p_act[i].vPnti1End ;
    vi1End1 := p_act[i].vPnti1End1 ;
    vi2Beg := p_act[i].vPnti2Beg ;
    vi2End := p_act[i].vPnti2End ;
    vi2End1 := p_act[i].vPnti2End1 ;
    vPosXBeg := p_WaveformData.v_data[ viBeg ].r_pnt_data[ vi2Beg, vi1Beg ].r_x;
    vPosYBeg := p_WaveformData.v_data[ viBeg ].r_pnt_data[ vi2Beg, vi1Beg ].r_y;
    valBeg := p_WaveformData.v_data[ viBeg ].r_pnt_data[ vi2Beg, vi1Beg ].r_Value;
    p_pb1.Canvas.Brush.Color := clRed;
    p_pb1.Canvas.Brush.Style := bsSolid;
    p_pb1.Canvas.Pen.Color   := clRed;
    p_pb1.Canvas.Font.Color  := clRed;
    vWidthPnt := 4;
    drawX( vPosXBeg , vPosYBeg , vWidthPnt*2 );
    if ((viEnd<>-1) and (viEnd1=-1)) then  // вторая точка
    begin
      vPosXEnd := p_WaveformData.v_data[ viEnd ].r_pnt_data[ vi2End, vi1End ].r_x;
      vPosYEnd := p_WaveformData.v_data[ viEnd ].r_pnt_data[ vi2End, vi1End ].r_y;
      p_pb1.Canvas.MoveTo( vPosXBeg , vPosYBeg );
      p_pb1.Canvas.LineTo( vPosXEnd , vPosYEnd );
      drawX( vPosXEnd , vPosYEnd, vWidthPnt*2 );
    end else if ((viEnd<>-1) and (viEnd1<>-1)) then          // третья точка
    begin
      vPosXEnd := p_WaveformData.v_data[ viEnd ].r_pnt_data[ vi2End, vi1End ].r_x;
      vPosYEnd := p_WaveformData.v_data[ viEnd ].r_pnt_data[ vi2End, vi1End ].r_y;
      p_pb1.Canvas.MoveTo( vPosXBeg , vPosYBeg );
      p_pb1.Canvas.LineTo( vPosXEnd , vPosYEnd );
      drawX( vPosXEnd , vPosYEnd, vWidthPnt*2 );
      vPosXEnd1 := p_WaveformData.v_data[ viEnd1 ].r_pnt_data[ vi2End1, vi1End1 ].r_x;
      vPosYEnd1 := p_WaveformData.v_data[ viEnd1 ].r_pnt_data[ vi2End1, vi1End1 ].r_y;
      p_pb1.Canvas.MoveTo( vPosXEnd , vPosYEnd );
      p_pb1.Canvas.LineTo( vPosXEnd1 , vPosYEnd1 );
      drawX( vPosXEnd1 , vPosYEnd1, vWidthPnt*2 );
      // определим угол : определяется угол до 180 градусов
      // 1. определим длину  сторон треугольника
      // v1_2,v2_3,v3_1,
      vTmp1 := Abs(vPosXEnd-vPosXBeg) ;
      vTmp2 := Abs(vPosYEnd-vPosYBeg) ;
      v1_2:= Sqrt(vTmp1*vTmp1+vTmp2*vTmp2);
      vTmp1 := Abs(vPosXEnd1-vPosXEnd) ;
      vTmp2 := Abs(vPosYEnd1-vPosYEnd) ;
      v2_3:= Sqrt(vTmp1*vTmp1+vTmp2*vTmp2);
      vTmp1 := Abs(vPosXBeg-vPosXEnd1) ;
      vTmp2 := Abs(vPosYBeg-vPosYEnd1) ;
      v3_1:= Sqrt(vTmp1*vTmp1+vTmp2*vTmp2);
      vUgol:=RoundTo( ArcCos((v1_2*v1_2+v2_3*v2_3-v3_1*v3_1)/(2*v1_2*v2_3)) / (Pi/180) , -2);
      //
      vXTmp := Abs(vPosXEnd-vPosXBeg) ;
      vYTmp := Abs(vPosYEnd-vPosYBeg) ;
      vXsr:= Trunc( Min(vPosXBeg,vPosXEnd) + vXTmp/2 );
      vYsr:= Trunc( Min(vPosYBeg,vPosYEnd) + vYTmp/2 );
      //
      SetColor(p_pb1, v_color_text_ECG);
      SetFontECG(p_pb1);
      p_pb1.Canvas.Brush.Color := clWhite;
      p_pb1.Canvas.Pen.Color := clWhite;
      p_pb1.Canvas.Font.Color := clBlack;
      p_pb1.Canvas.Font.Size := 8;
      //
      p_pb1.Canvas.TextOut( vXsr, vYsr+5, FloatToStr( vUgol )+chr(176) );
    end;
    p_pb1.Canvas.Brush.Style := bsClear ;
    p_pb1.Canvas.Refresh;
  end;
begin
  vColorOld := p_pb1.Canvas.Brush.Color ;
  vStyleOld := p_pb1.Canvas.Brush.Style;
  vPenColor := p_pb1.Canvas.Pen.Color;
  vFontColor:= p_pb1.Canvas.Font.Color;
  // рисуем измерения
  if Length(p_act)>0 then
    for i := 0 to Length(p_act) - 1 do
      if      p_act[i].r_type=0 then pVertOtm  // вертикальная отметка
      else if p_act[i].r_type=1 then pOtrezok  // отрезок - измерение расстояния
      else if p_act[i].r_type=2 then pUgol;    // угол
  p_pb1.Canvas.Brush.Color := vColorOld ;
  p_pb1.Canvas.Brush.Style := vStyleOld ;
  p_pb1.Canvas.Pen.Color := vPenColor ;
  p_pb1.Canvas.Font.Color := vFontColor ;
end;

procedure pIniEcgDrawParameters;
begin
  v_color_fon_ECG  := RGB( 255, 237, 196 ); // Цвет фона ЭКГ белый  clWhite
  v_color_rzd_ECG  := RGB( 182, 182, 182 );         // Цвет разделителей
  v_color_rzd_grp_ECG  := RGB( 220, 220, 220 ); // Цвет разделителей групп
  v_size_line_rzd_ECG  := 1;   // толщина линии разделителя
  // толщина кривой ЭКГ
  v_color_text_ECG := clBlue;         // Цвет текста
  v_color_line_ECG := clRed;         // Цвет кривой ЭКГ
  v_font_ECG.Name   := 'Tahoma';     // Шрифт
  v_size_font_ECG   := 8;       // Размер шрифта
  v_bold_font_ECG   := False;   // Жирный шрифт
  v_italic_font_ECG := False;   // Под наклоном
  v_size_line_ECG  := 1;   // толщина кривой ЭКГ
                                           // высота полосы отведения на графике ЭКГ
  v_height_channel_ECG := 2*3*2*c_kletka ; // 3 вверх и 3 вниз от центральной линии
  v_otmetka_ECG := clRed;                  // отметка
end;

// отрисовка ЭКГ
procedure pECGdraw ( das: TCnsDMTable;
                     p_pb1: TImage;
                     p_act : array of t_ecg_actions;
                     p_koeff_horiz:Integer=25;
                     p_koeff_vert:integer=10;
                     p_is_Savitsky : Boolean = False;
                     p_ShRpnt : Boolean = False;
                     p_is_on_Form : Boolean = True );
var v_WaveformData: TDicomWaveForm;
    v_min_val, v_max_val, v_cmn_amm, v_amm_pnt, v_max_pnt_in_group,
    v_SamplingFrequency, v_x_max, v_y_max, v_max, v_delta,
    i, x2,y2,i4, v_height, v_width, i1,i2, v_tmp,
    v_x_top, v_y_top, v_n_chnl, v_n_chnl1, p5, j,
    v_xx, v_yy, v_y_c, v_n_bg, ik, v_i,
    v_y1,v_y2, v_tmp1, v_tmp2, v_amm : Integer;
    v_dt, v_dt_max, v_dt_min : array of Integer;
    v_dt_sr : array of Extended;
    v_kx, v_ky, v_k_vert, v_k_horiz : extended;
    v_p1, v_p2, v_p3, v_step_const,
    v_py1, v_py2, v_py3, v_cur_pnt, v_step : integer;
    v_pr1,v_pr2,v_pr3 : boolean;
const c_delta_x = 150;
      c_delta_y = 50;
      c_LR_part = 20+c_delta_x; // крайние куски которые не рассматриваем
      c_delta = 100;
      cDeltaQS = 50;
  procedure SetWH ( p_width, p_height : integer );
  begin
    p_pb1.Width  := p_width ;
    p_pb1.Height  := p_height ;
    p_pb1.Picture.Bitmap.Height:=p_pb1.Height;
    p_pb1.Picture.Bitmap.Width:=p_pb1.Width;
  end;
  //
  function chkQS( p_pi, p_pi1, p_pi2:integer; p_is_Q:Boolean = True ):integer;  // индекс в массиве точки Q
  var i, v_res, v_i_min :Integer;
  begin
    v_i_min:=p_pi1;
    if ((p_pi1>=c_LR_part+c_delta_x) and
       ( (p_pi1+c_delta) <= (High(v_WaveformData.v_data[p_pi].r_data)-c_LR_part) ))
    then
    begin
      if p_is_Q then
        i:=p_pi1-5
      Else
        i:=p_pi1+5;
      v_res:=v_WaveformData.v_data[p_pi].r_data[i,p_pi2];
      While True do
      begin
        if (v_WaveformData.v_data[p_pi].r_data[i,p_pi2]+cDeltaQS) < v_res then  // текущее меньше мимимального
        begin
          v_res:=v_WaveformData.v_data[p_pi].r_data[i,p_pi2];
          v_i_min:=i;
        end;
        if p_is_Q then
        begin
          Dec(i); 
          if (i<=p_pi1-c_delta) 
          then Break;
        end Else
        begin
          Inc(i);
          if (i>=p_pi1+c_delta)
          then Break;
        end;
      end;
    end;
    Result := v_i_min;
  end;
  // возвращает значение :
  // False - нет минимума или максимума
  // True - максимум / минимум в зависимости от параметра  p_Is_Max
  // p_Is_Max = True - ищем максимумы, False - ищем минимумы 
  function chkPik( p_pi, p_pi1, p_pi2:integer; p_Is_Max:Boolean=True):Boolean;
  var v_res:Boolean;
      i, v_max, v_max_i,
      vCurVal, vLeftVal, vRightVal : Integer;
  begin
    v_res := False; // инициализация
      // не рассматриваем левый/правый крайние куски канала
    if ((p_pi1>=c_LR_part+c_delta_x) and
       ( p_pi1 <= (High(v_WaveformData.v_data[p_pi].r_data)-c_LR_part) ))
    then
    begin
      v_max:=0; i:=0; v_max_i:=0; vCurVal:=0;
      for i := (p_pi1-c_delta_x) to (p_pi1+c_delta_x) do // по значениям
      begin
        vCurVal   := v_WaveformData.v_data[p_pi].r_data[i,p_pi2];
        if ( ((v_max<vCurVal) and p_Is_Max) or       // определение максимальной точки
             ((v_max>vCurVal) and (not p_Is_Max)) )  // определение минимальной точки
        then
        begin
          v_max := vCurVal;
          v_max_i := i;
        end;
      end;
      if (v_max_i=p_pi1) then
      begin
        vCurVal   := v_WaveformData.v_data[p_pi].r_data[v_max_i,p_pi2];
        vLeftVal  := v_WaveformData.v_data[p_pi].r_data[p_pi1-c_delta_x,p_pi2];
        vRightVal := v_WaveformData.v_data[p_pi].r_data[p_pi1+c_delta_x,p_pi2];
        if ( Abs(vCurVal - vLeftVal)>c_delta_y) and
         ( Abs(vCurVal - vRightVal )>c_delta_y)
        then
          v_res:=True;
      end;
    end;
    Result:=v_res;
  end;
  function fSavit ( pi, pi1, pi2:Integer ):Integer;
  var l,k, vLn{, vStep} : integer; {v_k,} v_ost, vTmp, vSum:Extended;
      vArr : array of Extended;
  begin
    vLn:=50; // кол-во шагов влево/вправо для усреднения
    SetLength( vArr,vLn-1 );
    vArr[0]:=0.6; v_ost:=1;
    for l := 1 to vLn - 1 do
    begin
      v_ost:=v_ost-vArr[l-1];
      if (v_ost-(v_ost/1.01))<0.000001 then
        vArr[l]:= 0
      else
        vArr[l]:= (v_ost-(v_ost/1.027))/2;
    end;
    vSum:=vArr[0]; for l := 1 to vLn - 1 do vSum:=vSum+vArr[l]*2;
    vArr[0]:=vArr[0]+(1-vSum);
    if ((pi1>=vLn) and (i1<=High(v_WaveformData.v_data[pi].r_data)-1-vLn) ) then
    begin
      vTmp:=vArr[0] * v_WaveformData.v_data[pi].r_data[pi1,pi2];
      for k := 1 to vLn - 1 do
        vTmp:=vTmp + vArr[k]*v_WaveformData.v_data[pi].r_data[pi1-k,pi2]+vArr[k]*v_WaveformData.v_data[pi].r_data[pi1+k,pi2];
      Result:=Trunc(vTmp);
    end else
      Result := v_WaveformData.v_data[pi].r_data[pi1,pi2] ;
  end;
var vColorOld : TColor;
    vStyleOld : TBrushStyle;
    vWidthPnt, v_len_tmp, i3, vPnt, vTmp,
    v_amm_points, vSrHeartBeats : Integer;
    vFontOld : TFont;
    v_millisec : Extended;
const vDeltaPosQRS = 20;
begin
//  if das[0].Attributes.fWaveformData=nil then das[0].Attributes.fWaveformData:=das[0].GetWaveformData;
  if not Assigned(das[0].Attributes.WaveformData) then Exit;
  p_pb1.Visible:=False;
  v_x_max:=0; v_y_max:=0;
  try
    v_k_vert  := 10/p_koeff_vert ;
    v_k_horiz := p_koeff_horiz/25;
    v_WaveformData := das[0].Attributes.fWaveformData ;
    v_max_pnt_in_group:=0;
    for I := 0 to Length(v_WaveformData.v_data) - 1 do // по записям
      if v_max_pnt_in_group<High(v_WaveformData.v_data[i].r_data) then
        v_max_pnt_in_group:=High(v_WaveformData.v_data[i].r_data);
    p_pb1.Height := Trunc( v_height_channel_ECG/2 + ( v_WaveformData.v_cmn_amm*v_height_channel_ECG + c_partition*2 ) / v_k_vert );
    // c_kletka = 15;   // шаг клетки в пикселях  1сек - 5 клеток
    v_kx := 0.125 ;
    v_width:=Trunc(5*v_max_pnt_in_group*v_kx)+30;
    if p_is_on_Form then    
      if v_width<(p_pb1.Parent as TScrollBox).Width then v_width:=(p_pb1.Parent as TScrollBox).Width;
    p_pb1.Width  := Trunc(v_width*v_k_horiz) ;
    SetWH(p_pb1.Width,p_pb1.Height);
    try
      p_pb1.Canvas.Brush.Color := v_color_fon_ECG;
      p_pb1.Canvas.FillRect(Rect(0,0,p_pb1.Width,p_pb1.Height)); // заливка всей рабочей области
      v_n_chnl:=0; v_n_chnl1:=0;
      for I := 0 to Length(v_WaveformData.v_data) - 1 do // по записям
      begin
        p_pb1.Canvas.Brush.Color := clBlack;
        p_pb1.Canvas.Brush.Style := bsClear;
        v_height := Trunc(v_height_channel_ECG/v_k_vert);     // /2* высота полоски
        v_width  := v_WaveformData.v_data[i].r_amm;
        v_n_bg:=v_n_chnl;
        for I4 := 0 to v_WaveformData.v_data[i].r_amm-1 do     // High(v_data[i].r_channel)-1 do    // по отведениям
        begin
          inc(v_n_chnl);
          v_x_top  := 3;
          v_y_top  := (v_height+c_partition)*(v_n_chnl-1);
          SetColor(p_pb1, v_color_rzd_ECG);
          p_pb1.Canvas.Pen.Width := v_size_line_rzd_ECG;
          p_pb1.Canvas.Rectangle( v_x_top,             // нарисуем границу
                                  v_y_top,
                                  v_x_top+High(v_WaveformData.v_data[i].r_data),
                                  v_y_top+v_height );
          SetLength(v_WaveformData.v_ArrChnlImgBorder,Length(v_WaveformData.v_ArrChnlImgBorder)+1);
          v_WaveformData.v_ArrChnlImgBorder[Length(v_WaveformData.v_ArrChnlImgBorder)-1].r_x_top := v_x_top;
          v_WaveformData.v_ArrChnlImgBorder[Length(v_WaveformData.v_ArrChnlImgBorder)-1].r_y_top := v_y_top;
          v_WaveformData.v_ArrChnlImgBorder[Length(v_WaveformData.v_ArrChnlImgBorder)-1].r_x_bottom := v_x_top+High(v_WaveformData.v_data[i].r_data);
          v_WaveformData.v_ArrChnlImgBorder[Length(v_WaveformData.v_ArrChnlImgBorder)-1].r_y_bottom := v_y_top+v_height;
          if v_y_max<v_y_top+v_height then v_y_max:=v_y_top+v_height;
          x2:=v_x_top;
          p5:=0;
          while x2<p_pb1.Width do // по оси абцисс
          begin
            Inc( x2, Trunc(c_kletka*v_k_horiz));
            Inc(p5);
            if ( p5 mod 5 )=0 then
              SetColor(p_pb1, v_color_rzd_ECG)
            else
              SetColor(p_pb1, v_color_rzd_grp_ECG );
            p_pb1.Canvas.MoveTo( x2 , v_y_top );
            p_pb1.Canvas.LineTo( x2 , v_y_top+v_height );
          end;
          v_y_c := Trunc( v_y_top+c_partition+v_height/2 );
          x2:=v_x_top;
          p_pb1.Canvas.MoveTo( x2 , v_y_c );
          SetColor(p_pb1, v_color_rzd_ECG );
          p_pb1.Canvas.LineTo( p_pb1.Width , v_y_c );
          y2:=v_y_c; p5:=0;
          while y2<(v_y_top+v_height) do // рисуем разметку гориз линии вниз от центральной линии
          begin
            Inc(y2,Trunc(c_kletka/v_k_vert));
            Inc(p5);
            if ( p5 mod 2 )=0 then
              SetColor(p_pb1, v_color_rzd_ECG )
            else
              SetColor(p_pb1, v_color_rzd_grp_ECG ); // v_color_rzd_ECG + 2
            p_pb1.Canvas.MoveTo( v_x_top , y2 );
            p_pb1.Canvas.LineTo( p_pb1.Width , y2 );
          end;
          y2:=v_y_c; p5:=0;
          while y2>v_y_top do            // рисуем разметку гориз линии вверх от центральной линии
          begin
            Inc(y2,(-1)*Trunc(c_kletka/v_k_vert));
            Inc(p5);
            if ( p5 mod 2 )=0 then
              SetColor(p_pb1, v_color_rzd_ECG )
            else
              SetColor(p_pb1, v_color_rzd_grp_ECG );
            p_pb1.Canvas.MoveTo( v_x_top , y2 );
            p_pb1.Canvas.LineTo( p_pb1.Width , y2 );
          end;
          SetColor(p_pb1, v_color_text_ECG);
          SetFontECG(p_pb1);
          p_pb1.Canvas.TextOut( Trunc(v_x_top+c_partition*4),
                                Trunc(v_y_top+c_partition*4),
                                v_WaveformData.v_data[i].r_channel[i4].r_name );
          if ((I4=0) and (I=0)) then
          begin
            SetColor(p_pb1, v_color_text_ECG);
            SetFontECG(p_pb1);
            p_pb1.Canvas.TextOut( Trunc(v_x_top+c_partition*4+300),
                                  Trunc(v_y_top+c_partition*4),
                                  'по горизонтали: 1 сек - 5 клеток' );
            p_pb1.Canvas.TextOut( Trunc(v_x_top+c_partition*4+300),
                                  Trunc(v_y_top+c_partition*8),
                                  'по вертикали: 1 мв - 2 клетки' );
          end;
        end;
        //
        SetLength(v_dt,v_WaveformData.v_data[0].r_amm);
        SetColor(p_pb1, clRed);
        for ik := 0 to High(v_dt) - 1 do v_dt[ik]:=0;
        { v_ky := c_height/v_max_val; // old
          1 мв = 2 клетки
          значения записаны - надо / на 1000
          1 px = 1 значение         }
        v_ky := 0.001 * 2 * c_kletka ;
        v_ky := v_ky / v_k_vert ;
        //
        SetLength(v_dt_max,v_WaveformData.v_data[0].r_amm);
        for ik := 0 to High(v_dt_max) - 1 do v_dt_max[ik]:=0;
        SetLength(v_dt_min,v_WaveformData.v_data[0].r_amm);
        for ik := 0 to High(v_dt_min) - 1 do v_dt_min[ik]:=0;
        SetLength(v_dt_sr,v_WaveformData.v_data[0].r_amm);
        for ik := 0 to High(v_dt_sr) - 1 do v_dt_sr[ik]:=0;
        v_amm := High(v_WaveformData.v_data[i].r_data);
        //
        for i2 := 0 to v_WaveformData.v_data[i].r_amm-1 do  // по отведениям
        begin
          for i1 := 0 to High(v_WaveformData.v_data[i].r_data)-1 do  // по значениям
          begin
            v_y_top  := trunc( v_height*( v_n_bg + i2 ) );
            v_y_c := Trunc( v_y_top+v_height/2 );   // центральная линия   // v_n_bg+i2 - номер канала
            if v_dt_max[i2]<v_WaveformData.v_data[i].r_data[i1,i2] then v_dt_max[i2]:=v_WaveformData.v_data[i].r_data[i1,i2];
            if v_dt_min[i2]>v_WaveformData.v_data[i].r_data[i1,i2] then v_dt_min[i2]:=v_WaveformData.v_data[i].r_data[i1,i2];
            v_dt_sr[i2] := v_dt_sr[i2] + v_WaveformData.v_data[i].r_data[i1,i2]/v_amm;
          end;
        end;
        SetLength( v_WaveformData.v_data[i].r_pnt_data, 0 );
        SetLength( v_WaveformData.v_data[i].r_pnt_data, v_WaveformData.v_data[i].r_amm );   // массив координат
        for i2 := 0 to v_WaveformData.v_data[i].r_amm-1 do // по отведениям
        begin
          SetLength(v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints,0);
          inc(v_n_chnl1);
          v_x_top  := 3;
          v_y_top  := (v_height+c_partition)*(v_n_chnl1-1);
          v_kx := (5*c_kletka) / v_WaveformData.v_data[I].r_channel[i2].r_SamplingFrequency ;
          v_kx := v_kx*v_k_horiz;
          {  1 клетка = 1/5 сек
             5 клеток = r_SamplingFrequency точек
             5*c_kletka = r_SamplingFrequency точек
             r_SamplingFrequency/5*c_kletka          }
          v_y_top  := trunc( v_height*( v_n_bg + i2 ) );
          v_y_c := Trunc( v_y_top+v_height/2 );   // центральная линия   // v_n_bg+i2 - номер канала
          v_x_top  := 3;
          v_y_top  := (v_height+c_partition)*(v_n_bg+i2);
          // по значениям -------------------------------------------------------------------------------------------------
          SetLength( v_WaveformData.v_data[i].r_pnt_data[i2], High(v_WaveformData.v_data[i].r_data) );   // массив координат
          for i1 := 0 to High(v_WaveformData.v_data[i].r_data)-1 do      // по значениям
          begin
          //  if p_is_Savitsky then
          //    v_tmp := fSavit ( i, i1, i2)
          //  else
              v_tmp := v_WaveformData.v_data[i].r_data[i1,i2] ; // ВНИМАНИЕ !!!   сперва i1 а потом i2
            //
            v_tmp1    := Trunc( v_dt[i2] - v_dt_sr[i2] ) ;
            v_tmp2    := Trunc( v_tmp - v_dt_sr[i2] ) ;
            if v_tmp1>0 then
              v_y1  := Trunc( v_y_top  - v_height/2+(v_height-abs(v_tmp1) * v_ky) )
            else
              v_y1  := Trunc( v_y_top  + (v_height/2+abs(v_tmp1) * v_ky) ) ;
            if v_tmp2>0 then
            begin
              v_y2  := Trunc( v_y_top  - v_height/2+(v_height-abs(v_tmp2) * v_ky) );
            end else
            begin
              v_y2  := Trunc( v_y_top  + (v_height/2+abs(v_tmp2) * v_ky) ) ;
            end;
            SetColor(p_pb1, v_color_line_ECG );   // RGB( 151, 194, 240);  // clRed;
            p_pb1.Canvas.Pen.Width := v_size_line_ECG ;
            p_pb1.Canvas.MoveTo( Trunc( (i1-1)*v_kx ) , v_y1 );
            p_pb1.Canvas.LineTo( Trunc( i1*v_kx )     , v_y2 );
            // запомним координаты
            v_WaveformData.v_data[i].r_pnt_data[i2,i1].r_x := Trunc( i1*v_kx ) ;  // ВНИМАНИЕ !!!   сперва i2 а потом i1
            v_WaveformData.v_data[i].r_pnt_data[i2,i1].r_y := v_y2 ;
            v_WaveformData.v_data[i].r_pnt_data[i2,i1].r_SamplingFrequency := v_WaveformData.v_data[I].r_channel[i2].r_SamplingFrequency;
            v_WaveformData.v_data[i].r_pnt_data[i2,i1].r_Value := v_tmp ;
          //  v_WaveformData.v_data[i].r_pnt_data[i2,i1].v_x_top := v_x_top ;
          //  v_WaveformData.v_data[i].r_pnt_data[i2,i1].v_x_bottom :=  ;
            v_WaveformData.v_data[i].r_pnt_data[i2,i1].v_y_top := v_y_top ;
            v_WaveformData.v_data[i].r_pnt_data[i2,i1].v_y_bottom := (v_height+c_partition)*(v_n_bg+i2+1) ;
            // определение максимумов и минимумов
            if p_ShRpnt then // показать точки R - максимумы на кривой ЭКГ
            begin
              if chkPik( I, i1,i2, True ) then  // точки максимума
              begin    // запомним точку
                v_len_tmp := Length(v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints);
                SetLength( v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints, v_len_tmp+1 );
                v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].i1 := i1; // индекс в массиве
                v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].value := v_tmp; // значение
                v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].x1    := Trunc( (i1-1)*v_kx ) ;
                v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].y1    := v_y1 ;
                v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].x2    := Trunc( i1*v_kx ) ;
                v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].y2    := v_y2 ;
                v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].vCentral := v_y_c;
                v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].vYTop := v_y_top;
                v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].vYBottom := v_y_top+v_height;
                v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].vkx := v_kx;
                v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].r_SamplingFrequency := v_WaveformData.v_data[I].r_channel[i2].r_SamplingFrequency;

                if v_tmp2>0 then
                  v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].r_qRPosY := v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].y2-vDeltaPosQRS
                else
                  v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].r_qRPosY := v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].y2+vDeltaPosQRS-8;

                vPnt:=chkQS( I, i1,i2, True );  // индекс в массиве точки Q
                v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].r_Q := vPnt;
                v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].r_qx := Trunc( vPnt * v_kx ) ;
                vTmp:=v_WaveformData.v_data[i].r_data[ vPnt ,i2];
                vTmp:=Trunc(v_dt_sr[i2]);
                v_tmp2    := Trunc( v_WaveformData.v_data[i].r_data[ vPnt ,i2] - v_dt_sr[i2] ) ;
                if v_tmp2>0 then
                begin
                  v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].r_qy  := Trunc( v_y_top  - v_height/2+(v_height-abs(v_tmp2) * v_ky) );
                  v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].r_qQPosY := v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].r_qy-vDeltaPosQRS;
                end else
                begin
                  v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].r_qy  := Trunc( v_y_top  + (v_height/2+abs(v_tmp2) * v_ky) ) ;
                  v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].r_qQPosY := v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].r_qy+vDeltaPosQRS-8;
                end;

                vPnt:=chkQS( I, i1,i2, False );  // индекс в массиве точки S
                v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].r_S := vPnt;
                v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].r_sx := Trunc( vPnt * v_kx ) ;
                v_tmp2    := Trunc( v_WaveformData.v_data[i].r_data[ vPnt ,i2] - v_dt_sr[i2] ) ;
                if v_tmp2>0 then 
                begin
                  v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].r_sy  := Trunc( v_y_top  - v_height/2+(v_height-abs(v_tmp2) * v_ky) );
                  v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].r_qSPosY := v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].r_sy-vDeltaPosQRS;
                end else
                begin
                  v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].r_sy  := Trunc( v_y_top  + (v_height/2+abs(v_tmp2) * v_ky) ) ;
                  v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].r_qSPosY := v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[v_len_tmp].r_sy+vDeltaPosQRS-8;
                end;
              end;
            end;
            if Trunc( i1*v_kx )>v_x_max then v_x_max:=Trunc( i1*v_kx );
            v_dt[i2] := v_tmp ;
          end;
          // END по значениям -------------------------------------------------------------------------------------------------
          Application.ProcessMessages; // Обработка всей очереди сообщений
          if p_ShRpnt then // показать точки R - максимумы на кривой ЭКГ
          begin
            vSrHeartBeats:=0;
            for i3 := 0 to Length(v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints) - 1 do
            begin
              i1 := v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].i1;
              SetFontECG(p_pb1);
              p_pb1.Canvas.Font.Style := [fsBold];
              p_pb1.Canvas.Font.Color := clBlack;
              p_pb1.Canvas.TextOut( v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].x2,
                                v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].r_qRPosY,
                                'R' );
              p_pb1.Canvas.TextOut( v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].r_qx,
                                v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].r_qQPosY,
                                'Q' );
              p_pb1.Canvas.TextOut( v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].r_sx,
                                v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].r_qSPosY,
                                'S' );
              p_pb1.Canvas.Font.Size := v_size_font_ECG; // Размер шрифта
              p_pb1.Canvas.Font.Style := [fsBold];
              SetColor(p_pb1, clRed);
            //  p_pb1.Canvas.MoveTo( v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].x2 , v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].y2 );
            //  p_pb1.Canvas.LineTo( v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].x2 , v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].vYTop );
              // вывод круга для точки R
              vColorOld := p_pb1.Canvas.Brush.Color ;
              vStyleOld:=p_pb1.Canvas.Brush.Style;
              p_pb1.Canvas.Brush.Color := clBlack;
              p_pb1.Canvas.Brush.Style := bsSolid;
              vWidthPnt := 2;
              p_pb1.Canvas.Ellipse( v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].x2-vWidthPnt,
                                    v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].y2-vWidthPnt,
                                    v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].x2+vWidthPnt,
                                    v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].y2+vWidthPnt);
              p_pb1.Canvas.Ellipse( v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].r_qx-vWidthPnt,
                                    v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].r_qy-vWidthPnt,
                                    v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].r_qx+vWidthPnt,
                                    v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].r_qy+vWidthPnt);
              p_pb1.Canvas.Ellipse( v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].r_sx-vWidthPnt,
                                    v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].r_sy-vWidthPnt,
                                    v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].r_sx+vWidthPnt,
                                    v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].r_sy+vWidthPnt);
              p_pb1.Canvas.Brush.Color := vColorOld;
              p_pb1.Canvas.Brush.Style:=vStyleOld;
              if i3>0 then  // вывод ЧСС
              begin
                SetColor(p_pb1, clRed);                                                                                      //  1 клетка = 1/5 сек
                v_amm_points := v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].i1 -                                  //   5 клеток = r_SamplingFrequency точек
                                v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3-1].i1;                                 //   5*c_kletka = r_SamplingFrequency точек
                v_millisec := v_amm_points / v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].r_SamplingFrequency;     //   r_SamplingFrequency/5*c_kletka
                vSrHeartBeats := vSrHeartBeats + Trunc( 60/ v_millisec );
                if i3>1 then  // вывод ЧСС
                begin
                  SetColor(p_pb1, clRed); 
                  p_pb1.Canvas.TextOut( v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].x2,
                                        Trunc(v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].vYTop+c_partition *2),
                                        IntToStr( Trunc( 60/ v_millisec ) ) );
                end;
              end; 
            end;
            if Length(v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints)>0 then
            begin
              SetColor(p_pb1, clRed); i3:=0;
              p_pb1.Canvas.TextOut( v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].x2,
                                    Trunc(v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints[i3].vYTop+c_partition *2),
                                    'ЧСС(ср) '+IntToStr( Trunc(  vSrHeartBeats/ (Length(v_WaveformData.v_data[i].r_channel[i2].r_MaxPoints) - 2) ) ) );
            end;
          end;
        end;
      end;
      p_pb1.Height:=v_y_max+10;
      p_pb1.Width:=v_x_max+10;
      SetWH(p_pb1.Width,p_pb1.Height);
      risIzm ( v_WaveformData, p_pb1, p_act, p_koeff_horiz, p_koeff_vert );
      Application.ProcessMessages; // Обработка всей очереди сообщений
    finally
    //  ScrollBox1.Enabled:=True;
    end;
  finally
      p_pb1.Visible:=True;
  end;
end;

procedure ctrFullModList( pModList:TStringList );
  procedure crtModItem( pstr1, pstr2 : string );
  begin
    pModList.Append( pstr1 );
  end;
begin
  try
    crtModItem('AU',	'Audio' );
    crtModItem('BI',	'Biomagnetic Imaging' );
    crtModItem('CD',	'Color flow Doppler' );
    crtModItem('CR',	'Computed radiography' );
    crtModItem('CT',	'Computed tomography' );
    crtModItem('DD',	'uplex Doppler' );
    crtModItem('DG',	'iaphanography' );
    crtModItem('DSA',	'Digital Subtraction Angiography' );
    crtModItem('DX',	'Digital Radiography' );
    crtModItem('ECG',	'Electrocardiography' );
    crtModItem('EPS',	'Cardiac Electrophysiology' );
    crtModItem('ES',	'Endoscopy' );
    crtModItem('GM',	'General Microscopy' );
    crtModItem('HC',	'Hard Copy' );
    crtModItem('HD',	'Hemodynamic Waveform' );
    crtModItem('IO',	'Intra-Oral Radiography' );
    crtModItem('IVUS','Intravascular Ultrasound' );
    crtModItem('LS',	'Laser surface scan' );
    crtModItem('MG',	'Mammography' );
    crtModItem('MR',	'Magnetic Resonance' );
    crtModItem('NM',	'Nuclear Medicine' );

    crtModItem('OCT',	'Optical Coherence Tomography' );
    crtModItem('OP',	'Ophthalmic Photography' );
    crtModItem('OPM',	'Ophthalmic Mapping' );
    crtModItem('OPR',	'Ophthalmic Refraction' );
    crtModItem('OPV',	'Ophthalmic Visual Field' );
    crtModItem('OT',	'Other' );

    crtModItem('PR',	'Presentation State' );
    crtModItem('PET',	'Positron Emission Tomography - PET' );
    crtModItem('PX',	'Panoramic X-Ray' );
    crtModItem('REG',	'Registration' );

    crtModItem('RF',	'Radio Fluoroscopy' );
    crtModItem('RG',	'Radiographic imaging (conventional film/screen)' );
    crtModItem('RTDOSE',	'Radiotherapy Dose' );
    crtModItem('RTIMAGE',	'Radiotherapy Image' );
    crtModItem('RTPLAN',	'Radiotherapy Plan' );
    crtModItem('RTRECORD',	'RT Treatment Record' );
    crtModItem('RTSTRUCT',	'Radiotherapy Structure Set' );

    crtModItem('SEG',	'Segmentation' );
    crtModItem('SM',	'Slide Microscopy' );
    crtModItem('SMR',	'Stereometric Relationship' );
    crtModItem('SR',	'SR Document' );
    crtModItem('ST',	'Single-photon emission computed tomography (SPECT)' );

    crtModItem('TG',	'Thermography' );
    crtModItem('US',	'Ultrasound' );
    crtModItem('XA',	'X-Ray Angiography' );
    crtModItem('XC',	'External-camera photography' );
  except end;
end;

procedure ctrModList;
begin
  try
    vModList := TStringList.Create;
  except end;
  ctrFullModList(vModList);
end;

procedure DestrModList;
begin
  try
    vModList.Free;
  except end;
end;

function DICOMDateToStr( pDate:TDateTime ):string;
{ DICOM study date (0008,0020) is similar to the ISO format,
  and is recorded as YYYYMMDD, e.g. 20110504 for May 4, 2011.
  DICOM study time (0008,0030) is recored as HHMMSS.mmm,
  where H = hours, M = minutes, S = seconds, and m = microseconds.
  A time like 080422.590 is 8:04:22.490 AM. }
var vYear,vMonth,vDay:string;
begin //
  vYear  := Trim( IntToStr(YearOf(pDate)) );
  vMonth := Trim( IntToStr(MonthOf(pDate)) );
  vDay   := Trim( IntToStr(DayOf(pDate)) );
  if Length(vYear)=2 then
    if YearOf(pDate)<2000 then
      vYear:='19'+vYear
    else
      vYear:='20'+vYear;
    if Length(vMonth)=1 then
      vMonth:='0'+vMonth;
    if Length(vDay)=1 then
      vDay:='0'+vDay;
  Result:=vYear+vMonth+vDay;
end;

function crtTimeFromStr ( pStrTmp : string ) : TDateTime;
var vPos:Integer; vH, vM : string; vHi, vMi : Integer;
  procedure errRes;
  begin
    Result:=EncodeDateTime( 1899, 1, 1, 0, 0, 0, 0 );
  end;
begin
  vPos:=Pos(':',pStrTmp);
  if vPos>0 then
  begin
    vH:=Copy(pStrTmp,0,vPos-1);
    vM:=Copy(pStrTmp,vPos+1);
    if not TryStrToInt(vH,vHi) then
      errRes
    else if not TryStrToInt(vM,vMi) then
      errRes
    else
      Result := EncodeDateTime( YearOf(Date), // year
                      MonthOf(Date),    // month
                      DayOf(Date),    // day
                      vHi,    // hour
                      vMi,    // minutes
                      0,    // seconds
                      0     // miliseconds
                    );
  end else
    errRes;
end;

function getListImages ( pPort : integer;
                        pHost,
                        pCalledTitle,
                        pCallingTitle,
                        pStudyUID,
                        pAccessionNumber : string;
                        var pImgSize : integer
                      ) : TStringList;
var CnsDicomConnection1 : TCnsDicomConnection;
    DA , DA1 : TDicomAttributes;
    i : Integer;                      
begin
  Result:=TStringList.Create;
  pImgSize:=0;
  CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
  DCM_Connection.PDUTempPath:=GetTempDirectory;
  try
    Screen.Cursor := crHourGlass;
    // определим текущий ПАКС из списка слева
    CnsDicomConnection1.host := pHost;
    CnsDicomConnection1.port := pPort;
    CnsDicomConnection1.CalledTitle := pCalledTitle;
    if (Trim(CnsDicomConnection1.Host)='') or
       (CnsDicomConnection1.Port=0) or
       (Trim(CnsDicomConnection1.CalledTitle)='')
    then
    begin
      MessageDlg('Не выбраны параметры PACS сервера.', mtWarning, [mbOK], 0);
    end else
    begin
      CnsDicomConnection1.CallingTitle := pCallingTitle; // Calling AE Title (заголовок вызывающего dicom-узла(клиента))
      // sLocalPort не используется для получения списка
      // формирование запроса
      DA := TDicomAttributes.Create;
      with DA do
      begin
  //-->> level
          AddVariant(dQueryRetrieveLevel, 'IMAGE' ); // 'STUDY' 'PATIENT'   'IMAGE'
          if Trim(pStudyUID)<>'' then
            AddVariant(dStudyInstanceUID,pStudyUID);
          if Trim(pAccessionNumber)<>'' then
            AddVariant(dAccessionNumber,pAccessionNumber);
          Add($0008, $0061);   // ModalitiesInStudy
          Add($0008, $0060);   // Modality
          Add($0010, $0020); // (Patient's Id)
          Add($0020, $000D);  // StudyInstanceUID


          { вернули
            da1.AddVariant($20, $D, Query1.FieldByName('STUDYUID').asstring);
            da1.AddVariant($20, $E, Query1.FieldByName('SERIESUID').asstring);
            da1.AddVariant($8, $60, Query1.FieldByName('IMAGETYPE').asstring);
            da1.AddVariant($8, $18, Query1.FieldByName('InstanceUID').asstring);
            da1.AddVariant($20, $13, Query1.FieldByName('IMGNO').asstring);
            da1.AddVariant($28, $10, Query1.FieldByName('SIZEX').AsInteger);
            da1.AddVariant($28, $11, Query1.FieldByName('SIZEY').AsInteger);
          }


      end;
      Application.ProcessMessages;
      if CnsDicomConnection1.C_FIND(DA) then
      begin
        if CnsDicomConnection1.ReceiveDatasets.Count > 0 then
          begin
            for i := 0 to CnsDicomConnection1.ReceiveDatasets.Count - 1 do
            begin
                DA1 := TDicomAttributes(CnsDicomConnection1.ReceiveDatasets[i]);
                Result.Append ( DA1.GetString(dStudyInstanceUID) );
                Inc(pImgSize);
                Application.ProcessMessages;
            end;
            CnsDicomConnection1.ReceiveDatasets.Clear;
          end
        else
          MessageDlg('Нет данных!', mtWarning, [mbOK], 0);
        CnsDicomConnection1.Clear;
        CnsDicomConnection1.Disconnect;
      end else
        MessageDlg('Ошибка на сервере! Обратитесь к администратору системы!', mtError, [mbOK], 0);
    end;
  finally
    Screen.Cursor := crDefault;
    MyDisconnectAssociation(CnsDicomConnection1);
    CnsDicomConnection1.Free;
    Application.ProcessMessages;
  end;
end;

end.
