unit fMain;  // D:\Install\Delphi\Components_Utils\Components\JEDI\3.36\jcl\source\common\

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, dxSkinsDefaultPainters, cxControls,
  cxContainer, cxEdit, cxLabel, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxClasses, cxGrid, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ShellAPI, Registry, KXString, KXServerCore, DCM_Server, JclFileUtils,
  JvDBUtils, ImgList, ActnList, DCM_Attributes, DCM_DICT, DBTables, DCM_Connection,
  frxClass, frxDBSet, Printers, DCM_UID, cxTextEdit, cxMemo,
  dxSkinsdxBarPainter, cxSplitter, FIBDatabase, pFIBDatabase, FIBQuery,
  pFIBQuery, IBCustomDataSet, FIBDataSet, pFIBDataSet, Grids, DBGrids,
  cxImageComboBox, pFIBProps, JvExDBGrids, JvDBGrid, cxGroupBox, cxImage,
  JvExControls, JvExExtCtrls, JvExtComponent, JvPanel, JvJCLUtils,
  CnsPngGr, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxGridExportLink, cxMaskEdit, cxDropDownEdit, cxCalendar,
  dxSkinOffice2007Green, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmMain = class(TForm)
    DicomServer: TDicomServerCore;
    pmGrid: TPopupMenu;
    al: TActionList;
    aPrint: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    N4: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    XML2: TMenuItem;
    aRefresh: TAction;
    frxRep: TfrxReport;
    frxDB: TfrxDBDataset;
    aStart: TAction;
    aStop: TAction;
    aParam: TAction;
    DB: TpFIBDatabase;
    trRead: TpFIBTransaction;
    dsLogs: TpFIBDataSet;
    sLogs: TDataSource;
    dsLogsFK_ID: TFIBIntegerField;
    dsLogsFC_NAME: TFIBStringField;
    dsLogsFN_TYPE: TFIBIntegerField;
    dsLogsFD_DATE: TFIBDateTimeField;
    dsLogsFC_REMARK: TFIBStringField;
    trWrite: TpFIBTransaction;
    Timer1: TTimer;
    paAdmin: TJvPanel;
    JvPanel2: TJvPanel;
    cxLabel9: TcxLabel;
    shServer: TShape;
    shBD: TShape;
    shJournal: TShape;
    cxImage1: TcxImage;
    lHeaderServer: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    lStart: TcxLabel;
    cxLabel7: TcxLabel;
    lParams: TcxLabel;
    lStatusServer: TcxLabel;
    lTimeServer: TcxLabel;
    cxLabel1: TcxLabel;
    cxImage2: TcxImage;
    cxImage3: TcxImage;
    cxLabel3: TcxLabel;
    lRefresh: TcxLabel;
    lParamsJournal: TcxLabel;
    cxLabel8: TcxLabel;
    lPrint: TcxLabel;
    cxLabel5: TcxLabel;
    paJournal: TJvPanel;
    JvPanel3: TJvPanel;
    cxImage5: TcxImage;
    cxLabel11: TcxLabel;
    memLog: TcxMemo;
    cxSplitter1: TcxSplitter;
    JvPanel1: TJvPanel;
    JvPanel4: TJvPanel;
    cxLabel6: TcxLabel;
    lTray: TcxLabel;
    cxLabel10: TcxLabel;
    lFilter: TcxLabel;
    cxLabel12: TcxLabel;
    lFilterDates: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    lBegin: TcxLabel;
    lEnd: TcxLabel;
    dsLogsDates: TpFIBDataSet;
    FIBIntegerField1: TFIBIntegerField;
    FIBStringField1: TFIBStringField;
    FIBIntegerField2: TFIBIntegerField;
    FIBDateTimeField1: TFIBDateTimeField;
    FIBStringField2: TFIBStringField;
    cxLabel15: TcxLabel;
    lStatusBD: TcxLabel;
    cxLabel16: TcxLabel;
    memBD: TcxMemo;
    lConnect: TcxLabel;
    cxLabel17: TcxLabel;
    lParamBD: TcxLabel;
    paWar: TJvPanel;
    lWarnings: TcxLabel;
    imRed: TcxImage;
    lWarServer: TcxLabel;
    lWarBD: TcxLabel;
    imGreen: TcxImage;
    im1_ok: TcxImage;
    im2_ok: TcxImage;
    im1_er: TcxImage;
    im2_er: TcxImage;
    cxImage4: TcxImage;
    memLog1: TcxMemo;
    lStartWar: TcxLabel;
    lConnectWar: TcxLabel;
    TVLOGS: TcxGridDBTableView;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    VDATE: TcxGridDBColumn;
    VEVENT: TcxGridDBColumn;
    il: TImageList;
    sdPopUp: TSaveDialog;
    cxLabel18: TcxLabel;
    lbCopy: TcxLabel;
    lbArchive: TcxLabel;
    cxLabel20: TcxLabel;
    deDate: TcxDateEdit;
    cxLabel19: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure DicomServerDicomGet(AClientThread: TDicomClientThread;
      AAddress: string; ACommand: TDicomAttributes; ARequestDatasets,
      AResponseDatasets: TList);
    procedure DicomServerDatabaseSumitSQL(AClientThread: TDicomClientThread;
      ADBStr, ASQL: string; AFetchCount: Integer; UseMultiDatabase: Boolean;
      Params: TDicomAttribute; var AResult: TDataSet);
    procedure DicomServerDicomAssociation(AClientThread: TDicomClientThread;
      AAddress: string; AReg: TRequest; var AHandleType: Integer);
    procedure aRefreshExecute(Sender: TObject);
    procedure DicomServerDicomFilmPrint(AClientThread: TDicomClientThread;
      AAddress: string; APrintTask: TDicomPrintTask);
    procedure DicomServerDicomImage(AClientThread: TDicomClientThread;
      AAddress: string; ADataset: TDicomDataset);
    procedure DicomServerDicomFind(AClientThread: TDicomClientThread;
      AAddress: string; ACommand: TDicomAttributes; ARequestDatasets,
      AResponseDatasets: TList);
    procedure DicomServerDicomLogit(AClientThread: TDicomClientThread; AIP,
      Msg: string);
    procedure aStartExecute(Sender: TObject);
    procedure aStopExecute(Sender: TObject);
    procedure aParamExecute(Sender: TObject);
    procedure frxRepGetValue(const VarName: string; var Value: Variant);
    procedure dsLogsAfterScroll(DataSet: TDataSet);
    procedure shServerMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure shServerMouseLeave(Sender: TObject);
    procedure lStartMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lStartMouseLeave(Sender: TObject);
    procedure lParamsMouseLeave(Sender: TObject);
    procedure lParamsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxImage1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lHeaderServerMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxLabel2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lStatusServerMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxLabel4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxLabel7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lStartClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure shBDMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure shBDMouseLeave(Sender: TObject);
    procedure shJournalMouseLeave(Sender: TObject);
    procedure shJournalMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lParamsClick(Sender: TObject);
    procedure lRefreshMouseLeave(Sender: TObject);
    procedure lParamsJournalMouseLeave(Sender: TObject);
    procedure lRefreshMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lParamsJournalMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxLabel8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxLabel3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxImage3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lRefreshClick(Sender: TObject);
    procedure lPrintClick(Sender: TObject);
    procedure lPrintMouseLeave(Sender: TObject);
    procedure lPrintMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lTrayClick(Sender: TObject);
    procedure lTrayMouseLeave(Sender: TObject);
    procedure lTrayMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxLabel6Click(Sender: TObject);
    procedure lParamsJournalClick(Sender: TObject);
    procedure dsLogsDatesBeforeOpen(DataSet: TDataSet);
    procedure cxLabel10MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxLabel12MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lFilterMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lFilterDatesMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxLabel13MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxLabel14MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lBeginMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lEndMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure cxLabel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lTimeServerMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxImage2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxLabel15MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lStatusBDMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxLabel16MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure memBDMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lConnectMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxLabel17MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lParamBDMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lParamBDMouseLeave(Sender: TObject);
    procedure lConnectMouseLeave(Sender: TObject);
    procedure lParamBDClick(Sender: TObject);
    procedure lConnectClick(Sender: TObject);
    procedure dsLogsDatesAfterScroll(DataSet: TDataSet);
    procedure lConnectWarClick(Sender: TObject);
    procedure lStartWarClick(Sender: TObject);
    procedure lConnectWarMouseLeave(Sender: TObject);
    procedure lConnectWarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lStartWarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lStartWarMouseLeave(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure lbCopyMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbCopyMouseLeave(Sender: TObject);
    procedure lbCopyClick(Sender: TObject);
    procedure DicomServerNormalisedReceivedNDelete(
      AClientThread: TDicomClientThread; AAddress: string;
      ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
    procedure lbArchiveMouseLeave(Sender: TObject);
    procedure lbArchiveMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbArchiveClick(Sender: TObject);
    procedure dsLogsBeforeOpen(DataSet: TDataSet);
    procedure deDatePropertiesChange(Sender: TObject);
    procedure DicomServerPrivateDicomGetRequest(
      AClientThread: TDicomClientThread; rq: TDicomAttributes;
      ADstCommand: TDicomAttribute; AResponseStreams: TList;
      AResponseFiles: TStringList);
  private
    isDevices : Integer;
    isConnected : Boolean;
    dBegin, dEnd : TDateTime; // даты фильтра по датам (начала, окончания)
    isDates : Integer;
    nType : Integer; // фильтр журнала по событиям (0 - все, 1 - старт, 2 - стоп, 3 - ошибки, 4 - события, 5 - изменения параметров)
    StartTime : TTime;
    FIconData: TNotifyIconData;
    sPort, sTitle, sDir, sDirRemote : string; // номер порта, АЕ заголовок, папка хранения dcm-файлов, долговременное хранилище снимков соответственно
    function AppendImage(DA: TDicomAttributes; StudyID, PName, PDateBorn, PSex, PatientID: string;
                         StudyDate: TDateTime; StudyUID, SeriesUID, InstanceUID, ImageType, AID: string;
                         var AModility: string; StudyDescription : string; PhysName : string; AccessionNumber : string): TDatetime;
    procedure DoQueryConnect;
    procedure DoQueryServer(sPort : string; sTitle : string; sDir : string; sDirRemote : string; nDaysArchive : Integer; isDevices : Integer);
    function TranslitEng (s: string): string; // транслитерация из латыни в кириллицу
  protected
    procedure WndProc(var Message: TMessage); override;
    { Private declarations }
  public
    nDaysArchive : Integer; // количество дней, после которого исследование считается устаревшим и подлежит архивации
    isStarted : Integer; // 1 - если сервер стартовал, 0 - если он остановлен
    procedure ExecSQL(asql: string);
    procedure SumitSQL(
      AClientThread: TDicomClientThread; ADBStr, ASQL: string;
      AFetchCount: Integer; UseMultiDatabase: Boolean; Params: TDicomAttribute;
      var AResult: TDataSet);
    procedure DoShowMainForm;
    function TestDcmFileDir(AQuery: TDataset; var AImageDir: string): Boolean;
    function TestDcmFileDir_RemoteDir(AQuery: TDataset; var AImageDir: string): Boolean;
    function TestFile(Query1: TDataset; basedir: string): string;
    function GetAge(AD1, AD2: TDatetime): string;
//    function GetDirSize(path : string) : Integer;
    procedure DoQueryInsert(sEvent : string; nType : Integer; dDate : TDateTime; sRemark : string);    
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses fParam, fReasonStop, fAbout, fFilter, fParamsBD, fCopy, fArchive;

{$R *.dfm}

const
 UM_TRAY = WM_USER + 1;


procedure TfrmMain.aParamExecute(Sender: TObject);
var Reg : TRegIniFile;
    sPortPrev, sTitlePrev, sDirPrev, sDirRemotePrev, isDevicesPrev, isDevicesAfter : string;
    nDaysArchivePrev : Integer;
begin
  try
    Application.CreateForm(TfrmParam, frmParam);
    sPortPrev := sPort;
    sTitlePrev := sTitle;
    sDirPrev := sDir;
    sDirRemotePrev := sDirRemote;
    nDaysArchivePrev := nDaysArchive;
    case isDevices of
    0 : isDevicesPrev := 'Нет';
    1 : isDevicesPrev := 'Да';
    end;
    if sPort = '' then
      frmParam.cxPort.Text := IntToStr(104)
    else
      frmParam.cxPort.Text := sPort;
    frmParam.cxTitle.Text := sTitle;
    frmParam.cxDir.Text := sDir;
    frmParam.teRemoteDir.Text := sDirRemote;
    frmParam.seDaysArchive.EditValue := nDaysArchive;

    frmParam.cbDevices.EditValue := isDevices;
    frmParam.ShowModal;
    if frmParam.ModalResult = mrOk then
      begin
        Reg := TRegIniFile.Create;
        Reg.RootKey:=HKEY_CURRENT_USER;
        if not Reg.OpenKey('\Software\Softmaster\DicomServer\', False) then
          begin
            Reg.CreateKey('\Software\Softmaster\DicomServer');
          end;
        try
          Reg.WriteString('\Software\Softmaster\DicomServer', 'SERVER_PORT', frmParam.cxPort.Text);
          Reg.WriteString('\Software\Softmaster\DicomServer', 'AE_TITLE',  frmParam.cxTitle.Text);
          Reg.WriteString('\Software\Softmaster\DicomServer', 'STORAGE_FOLDER',  frmParam.cxDir.Text);
          Reg.WriteString('\Software\Softmaster\DicomServer', 'REMOTE_STORAGE_FOLDER',  frmParam.teRemoteDir.Text);
          Reg.WriteInteger('\Software\Softmaster\DicomServer', 'DAYS_FOR_ARCHIVE', frmParam.seDaysArchive.EditValue);
          Reg.WriteInteger('\Software\Softmaster\DicomServer', 'IS_DEVICES_CHECK', frmParam.cbDevices.EditValue);
        finally
          Reg.Free;
        end;
        sPort := frmParam.cxPort.Text;
        sTitle := frmParam.cxTitle.Text;
        sDir := Trim(frmParam.cxDir.Text);
        sDirRemote := Trim(frmParam.teRemoteDir.Text);
        nDaysArchive := frmParam.seDaysArchive.EditValue;
        isDevices := frmParam.cbDevices.EditValue;
        case isDevices of
        0 : isDevicesAfter := 'Нет';
        1 : isDevicesAfter := 'Да';
        end;
        DoQueryServer(sPort, sTitle, sDir, sDirRemote, nDaysArchive, isDevices); // записываем/обновляем параметры сервера в БД
        if isStarted = 1 then
          begin
            Application.MessageBox('Внимание!'+#13+
                                   'В данный момент сервер работает! Новые параметры вступят в силу только после перезапуска сервера!',
                                   'Предупреждение', MB_ICONWARNING + MB_OK);
          end;
        DoQueryInsert('Изменились параметры сервера! Требуется перезапуск!',
                      5,
                      Now,
                      DateTimeToStr(Now)+#13+
                      'Изменились параметры сервера! Требуется перезапуск!'+#13+
                      'Предыдущие параметры:------------------------------'+#13+
                      'Порт: '+sPortPrev+#13+
                      'AE Title: '+sTitlePrev+#13+
                      'Оперативное хранилище снимков: '+sDirPrev+#13+
                      'Долговременное хранилище снимков:'+sDirRemotePrev+#13+
                      'Считать исследование устаревшим после дней = '+IntToStr(nDaysArchivePrev)+#13+
                      'Учитывать настройку удаленных устройств: '+isDevicesPrev+#13+
                      'Новые параметры:-----------------------------------'+#13+
                      'Порт: '+sPort+#13+
                      'AE Title: '+sTitle+#13+
                      'Оперативное хранилище снимков: '+sDir+#13+
                      'Долговременное хранилище снимков:'+sDirRemote+#13+
                      'Считать исследование устаревшим после дней = '+IntToStr(nDaysArchive)+#13+
                      'Учитывать настройку удаленных устройств: '+isDevicesAfter);
        sLogs.DataSet.Close;
        sLogs.DataSet.Open;
        sLogs.DataSet.Last;
      end;
  finally
    frmParam.Free;
  end;
end;

function TfrmMain.AppendImage(DA: TDicomAttributes; StudyID, PName, pDateBorn, PSex, PatientID: string;
                              StudyDate: TDatetime; StudyUID, SeriesUID, InstanceUID, ImageType,
                              AID: string; var AModility: string;
                              StudyDescription : string; PhysName : string; AccessionNumber : string): TDatetime;
var FIBQuery: TpFIBQuery;
    FIBDataSet: TpFIBDataSet;
    DA1: TDicomAttribute;
begin
  FIBDataSet := TpFIBDataSet.Create(nil);
  FIBQuery := TpFIBQuery.Create(nil);
  try
    FIBDataSet.Database := DB;
    FIBDataSet.Transaction := trRead;
    FIBDataSet.AutoCommit := True;
    FIBQuery.Database := DB;
    FIBQuery.Transaction := trWrite;
    FIBQuery.Options :=  FIBQuery.Options + [qoAutoCommit];
    Result := StudyDate;
//1. Пациент (Patients)-->
    FIBDataSet.SQLs.SelectSQL.Clear;
    FIBDataSet.SQLs.SelectSQL.Text := ' SELECT * FROM PATIENTS WHERE P_PID = UPPER(:P_PID) '; // ищем пациента (надо по P_PID - № МК)
    FIBDataSet.ParamByName('P_PID').AsString := PatientID;
//    FIBDataSet.SQLs.SelectSQL.Text := ' SELECT * FROM PATIENTS WHERE P_ENAME = UPPER(:P_ENAME) AND P_DATEBORN = :P_DATEBORN '; // ищем пациента
//    FIBDataSet.ParamByName('P_ENAME').AsString := PName;
//    FIBDataSet.ParamByName('P_DATEBORN').AsString := PDateBorn;
    FIBDataSet.Open;

    if FIBDataSet.RecordCount = 0 then // если query ничего не вернул (rowcount = 0), то INSERT
      begin
        if trWrite.Active = False then
          trWrite.Active := True;
        FIBQuery.Close;
        FIBQuery.SQL.Clear;
        FIBQuery.SQL.Add(' INSERT INTO PATIENTS(P_ENAME, P_ENAME_RUS, P_SEX, P_PID, P_DATEBORN, P_FAM, P_IM, P_OTCH) '+#13+
                         ' VALUES(UPPER(:P_ENAME), UPPER(:P_ENAME_RUS), :P_SEX, :P_PID, :P_DATEBORN, UPPER(:P_FAM), UPPER(:P_IM), UPPER(:P_OTCH)) ');
        FIBQuery.ParamByName('P_ENAME').AsString := PName;
        FIBQuery.ParamByName('P_ENAME_RUS').AsString := TranslitEng(PName);
        if PDateBorn = '' then
          FIBQuery.ParamByName('P_DATEBORN').AsDateTime := Now
        else
          FIBQuery.ParamByName('P_DATEBORN').AsDateTime := StrToDate(PDateBorn);
        FIBQuery.ParamByName('P_SEX').AsString := pSex;
        FIBQuery.ParamByName('P_PID').AsString := PatientID;
        FIBQuery.ParamByName('P_FAM').AsString := TranslitEng(ExtractWord(1, PName, [' ','^','.']));
        FIBQuery.ParamByName('P_IM').AsString := TranslitEng(ExtractWord(2, PName, [' ','^','.']));
        FIBQuery.ParamByName('P_OTCH').AsString := TranslitEng(ExtractWord(3, PName, [' ','^','.']));
      try
        FIBQuery.ExecQuery;
      except
//        on e: Exception do
//          showmessage(e.message);
//          memLog1.Lines.Add(e.message);
      end;
    end;
//2. Исследование (Studies)-->
    FIBDataSet.Close;
    FIBDataSet.SQLs.SelectSQL.Clear;
    FIBDataSet.SQLs.SelectSQL.Text := ' SELECT * FROM STUDIES WHERE STUDYUID = :STUDYUID '; // ищем исследование
    FIBDataSet.ParamByName('STUDYUID').AsString := StudyUID;
    FIBDataSet.Open;
    if FIBDataSet.RecordCount = 0 then // если query ничего не вернул (rowcount = 0) то INSERT
      begin
        if trWrite.Active = False then
          trWrite.Active := True;
        FIBQuery.Close;
        FIBQuery.SQL.Clear;
        FIBQuery.SQL.Add(' INSERT INTO STUDIES(STUDYUID, P_ENAME, P_ENAME_RUS, P_SEX, P_PID, BSTATE, LDATE, STUDYID, STUDIES_IMAGE_TYPE, '+#13+
                         '                     P_DATEBORN, STATUS, STUDYDESCRIPTION, REFERRINGPHYSICIANNAME, ACCESSIONNUMBER) ');
        FIBQuery.SQL.Add(' VALUES(:STUDYUID, UPPER(:P_ENAME), UPPER(:P_ENAME_RUS), :P_SEX, :P_PID, 1, :LDATE, :STUDYID, :IMAGE_TYPE, :P_DATEBORN, 0, '+#13+
                         '        UPPER(:STUDYDESC), UPPER(:PHYSNAME), :PACCESSIONNUMBER) ');
        FIBQuery.ParamByName('STUDYUID').AsString := StudyUID;
        FIBQuery.ParamByName('P_ENAME').AsString := PName;
        FIBQuery.ParamByName('P_ENAME_RUS').AsString := TranslitEng(PName);
        FIBQuery.ParamByName('P_SEX').AsString := PSex;
        FIBQuery.ParamByName('P_PID').AsString := PatientID;
        FIBQuery.ParamByName('LDATE').AsDatetime := StudyDate;
        FIBQuery.ParamByName('STUDYID').AsString := StudyID;
        FIBQuery.ParamByName('IMAGE_TYPE').AsString := ImageType;
        if PDateBorn = '' then
          FIBQuery.ParamByName('P_DATEBORN').AsDateTime := Now
        else
          FIBQuery.ParamByName('P_DATEBORN').AsDateTime := StrToDate(PDateBorn);
        FIBQuery.ParamByName('STUDYDESC').AsString := StudyDescription;
        FIBQuery.ParamByName('PHYSNAME').AsString := TranslitEng(PhysName);
        FIBQuery.ParamByName('PACCESSIONNUMBER').AsString := AccessionNumber;
        try
          FIBQuery.ExecQuery;
        except
//          on e: Exception do
//            ShowMessage(e.message);  //!!!
//            memLog1.Lines.Add(e.message);
        end;
        FIBQuery.Close;
        AModility := ImageType;
      end else
    begin
      Result := FIBDataSet.FieldByName('LDATE').AsDatetime;
      AModility := FIBDataSet.FieldByName('STUDIES_IMAGE_TYPE').AsString;
    end;
//3. Серия (Series)-->
    FIBDataSet.Close;
    FIBDataSet.SQLs.SelectSQL.Clear;
    FIBDataSet.SQLs.SelectSQL.Text := ' SELECT * FROM SERIES WHERE SERIESUID = :SERIESUID ';
    FIBDataSet.ParamByName('SERIESUID').AsString := SeriesUID;
    FIBDataSet.Open;
    if FIBDataSet.RecordCount = 0 then
      begin
        if trWrite.Active = False then
          trWrite.Active := True;
        FIBQuery.Close;
        FIBQuery.SQL.Clear;
        FIBQuery.SQL.Add(' INSERT INTO SERIES(STUDYUID, SERIESUID, SERIES_IMAGETYPE, SERIES_DESC, SERIES_DATE, ACCESSIONNUMBER) '+#13+
                         ' VALUES(:STUDYUID,:SERIESUID,:SERIES_IMAGETYPE,:SERIES_DESC,:SERIES_DATE, :PACCESSIONNUMBER) ');
        FIBQuery.ParamByName('STUDYUID').AsString := StudyUID;
        FIBQuery.ParamByName('SERIESUID').AsString := SeriesUID;
        FIBQuery.ParamByName('SERIES_IMAGETYPE').AsString := AModility; //ImageType
        FIBQuery.ParamByName('SERIES_DESC').AsString := DA.GetString($0008, $103E);
        DA1 := DA.Item[$8, $0021]; // Tag Series Date
        if Assigned(DA1) and (DA1.GetCount > 0) then
          FIBQuery.ParamByName('SERIES_DATE').AsDatetime := DA1.AsDatetime[0]
        else
          FIBQuery.ParamByName('SERIES_DATE').AsDatetime := Now;
        FIBQuery.ParamByName('PACCESSIONNUMBER').AsString := AccessionNumber;
        try
          FIBQuery.ExecQuery;
        except
//          on e: Exception do
//            memLog1.Lines.Add(e.message);
        end;
        FIBQuery.Close;
      end;
//4. Снимок (Images)-->
    FIBDataSet.Close;
    FIBDataSet.SQLs.SelectSQL.Clear;
    FIBDataSet.SQLs.SelectSQL.Text := ' SELECT * FROM IMAGES WHERE INSTANCEUID = :INSTANCEUID ';
    FIBDataSet.ParamByName('INSTANCEUID').AsString := InstanceUID;
    FIBDataSet.Open;
    if FIBDataSet.RecordCount = 0 then
      begin
        if trWrite.Active = False then
          trWrite.Active := True;
        FIBQuery.Close;
        FIBQuery.SQL.Clear;
        FIBQuery.SQL.Add(' INSERT INTO IMAGES (STUDYUID, SERIESUID, INSTANCEUID, IMGNO, IMAGETYPE, IMAGEDATE, '+#13+
                         '                     P_PID, SIZEX, SIZEY, PHOTOMETRIC, BITS, ABITS, BITS_PER_SAMPLE, STUDIESDATE, ACCESSIONNUMBER)');
        FIBQuery.SQL.Add(' VALUES(:STUDYUID, :SERIESUID, :INSTANCEUID, :IMGNO, :IMAGE_TYPE, :LDATE, :P_PID,' +#13+
                         '        :SIZEX, :SIZEY, :PHOTOMETRIC, :BITS, :ABITS, :BITS_PER_SAMPLE, :STUDIESDATE, :PACCESSIONNUMBER)');
        FIBQuery.ParamByName('STUDYUID').AsString := StudyUID;
        FIBQuery.ParamByName('SERIESUID').AsString := SeriesUID;
        FIBQuery.ParamByName('INSTANCEUID').AsString := InstanceUID;
        FIBQuery.ParamByName('IMGNO').AsInteger := StrToInt(AID);
        FIBQuery.ParamByName('IMAGE_TYPE').AsString := AModility; //ImageType
        FIBQuery.ParamByName('LDATE').AsDatetime := StudyDate;
        FIBQuery.ParamByName('P_PID').AsString := PatientID;
        FIBQuery.ParamByName('SIZEX').AsInteger := DA.GetInteger($28, $10); // Tag Rows (Ширина)
        FIBQuery.ParamByName('SIZEY').AsInteger := DA.GetInteger($28, $11); //Tag Columns (Высота)
        FIBQuery.ParamByName('BITS').AsInteger := DA.GetInteger($28, $101); //Tag Bits Stored (занято битов)
        FIBQuery.ParamByName('ABITS').AsInteger := DA.GetInteger($28, $100); //Tag Bits Allocated (выделено, забронировано битов)
        FIBQuery.ParamByName('BITS_PER_SAMPLE').AsInteger := DA.GetInteger($28, 2); //Tag Samples per Pixel
        FIBQuery.ParamByName('STUDIESDATE').AsDatetime := StudyDate;
        FIBQuery.ParamByName('PHOTOMETRIC').AsString := DA.GetString($28, 4); // Photometric Interpretation
        FIBQuery.ParamByName('PACCESSIONNUMBER').AsString := AccessionNumber;
      try
        FIBQuery.ExecQuery;
      except
//        on e: Exception do
//          memLog1.Lines.Add(e.message);
      end;
      FIBQuery.Close;
    end;
  finally
//    trWrite.Commit;
    FIBQuery.Free;
    FIBDataSet.Free;
  end;
end;

procedure TfrmMain.aPrintExecute(Sender: TObject);
var id : Integer;
begin
  id := sLogs.DataSet.FieldValues['FK_ID'];
  frxDB.DataSet := sLogs.DataSet;
  frxRep.ShowReport;
  sLogs.DataSet.Locate('FK_ID', id, []);
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(sLogs.DataSet);
  sLogs.DataSet.Last;
end;

procedure TfrmMain.aStartExecute(Sender: TObject);
begin
  if sPort = '' then
    begin
      Application.MessageBox('Не установлен порт соединения! Установите его, нажав на кнопку "Параметры"!', 'Внимание!', MB_ICONWARNING + MB_OK);
      Exit;
    end;

  if sDir = '' then
    begin
      Application.MessageBox('Не выбрана папка оперативного хранения снимков! Выберите её, нажав на кнопку "Параметры"!', 'Внимание!', MB_ICONWARNING + MB_OK);
      Exit;
    end;

  DicomServer.ServerPort := StrToInt(sPort); // устанавливаем порт сервера
  try
    if lStart.Caption = 'Запуск' then
      begin
        DicomServer.Start;
        if DicomServer.IsActive then
          begin
            DoQueryInsert('Сервер запущен',
                          1,
                          Now,
                          DateTimeToStr(Now)+#13+
                          'Запуск сервера выполнился успешно!'+#13+
                          'Параметры подключения сервера:'+#13+
                          'Port: '+sPort+#13+
                          'SCP Storage: '+sDir);
            sLogs.DataSet.Close;
            sLogs.DataSet.Open;
            sLogs.DataSet.Last;

            sLogs.DataSet.Close;
            sLogs.DataSet.Open;
            sLogs.DataSet.Last;
            isStarted := 1;
            lStatusServer.Caption := 'работает';
            aStart.Enabled := False;
            StartTime:= Now;
            lTimeServer.Caption := '00:00:00';
            Timer1.Enabled := True;
            lStart.Caption := 'Стоп';
            imRed.Visible := False;
            imGreen.Visible := True;
            lWarnings.Caption := 'Dicom-сервер работает';
            lWarnings.Style.Font.Color := clGreen;
            im2_ok.Visible := True;
            im2_er.Visible := False;
            lWarServer.Caption := 'Сервер запущен';
            lWarServer.Style.Font.Color := clGreen;
            paWar.FlatBorderColor := clGreen;
            lStartWar.Visible := False;
          end;
      end else
      begin
        aStopExecute(nil);
      end;
  except
    on e: Exception do
      begin
        DoQueryInsert('Не удалось запустить/остановить сервер!',
                      3,
                      Now,
                      DateTimeToStr(Now)+#13+
                      'При запуске/остановке сервера произошла ошибка!'+#13+
                      'Ваши действия:'+#13+
                      '1. Проверьте параметры подключения!'+#13+
                      '2. Попробуйте остановить сервер, нажав кнопку "Остановить", а затем снова запустить, нажав кнопку "Запустить"'+#13+
                      e.Message);
        sLogs.DataSet.Close;
        sLogs.DataSet.Open;
        sLogs.DataSet.Last;
        lStatusServer.Caption := 'ошибка';
        lStartWar.Visible := True;
        isStarted := 0;
      end;
  end;
end;

procedure TfrmMain.aStopExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmReasonStop, frmReasonStop);
  try
    frmReasonStop.ShowModal;
    if frmReasonStop.Modalresult = MrOk then
      begin
        DicomServer.Stop;
        if DicomServer.IsActive = False then
          begin
            DoQueryInsert('Сервер остановлен!',
                          2,
                          Now,
                          DateTimeToStr(Now)+#13+
                          'Сервер остановлен!'+#13+
                          'Причина остановки сервера:'+#13+
                          frmReasonStop.memReason.Lines.Text);
            isStarted := 0;
            aStart.Enabled := True;
            lStart.Caption := 'Запуск';
            lStatusServer.Caption := 'остановлен';
            Timer1.Enabled := False;
            lTimeServer.Caption := '00:00:00';

            imGreen.Visible := False;
            imRed.Visible := True;
            lWarnings.Caption := 'Угроза работы Dicom-сервера';
            lWarnings.Style.Font.Color := clRed;
            im2_ok.Visible := False;
            im2_er.Visible := True;
            lWarServer.Caption := 'Сервер не запущен';
            lWarServer.Style.Font.Color := clRed;
            paWar.FlatBorderColor := clRed;
            lStartWar.Visible := True;
          end;
      end;
  finally
    frmReasonStop.Free;
  end;
end;

procedure TfrmMain.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVLOGS.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVLOGS.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVLOGS.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVLOGS.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.DicomServerDatabaseSumitSQL(AClientThread: TDicomClientThread; ADBStr, ASQL: string; AFetchCount: Integer;
                                               UseMultiDatabase: Boolean; Params: TDicomAttribute; var AResult: TDataSet);
begin
  SumitSQL(AClientThread, ADBStr, ASQL, AFetchCount, UseMultiDatabase, Params, AResult);
  DoQueryInsert('Событие. DatabaseSumitSQL',
                4,
                Now,
                DateTimeToStr(Now)+#13+
                'Событие сервера DatabaseSumitSQL'+#13+
                'DBStr: '+ADBStr+#13+
                'ASQL: '+ASQL);
end;

function MyprepareResponse(request: TRequest; s: string; astr: TStrings;
  flag: Boolean): TDicomResponse;
var
  flag1: Boolean;
  j: Integer;
  acknowledge: TAcknowledge;
  k: Integer;
  uidentry: TUIDEntry;
  l: Integer;
  j1: Integer;
  uidentry1: TUIDEntry;
  flag2: Boolean;
  i1: Integer;
  str1: string;
begin
  if request.isPrivateApplicationContext then
  begin
    result := TDicomReject.Create(REJECTED_PERMANENT,
      DICOM_UL_SERVICE_USER_reject, USER_APPLICATIONCONTEXTNAME_NOT_SUPPORTED);
    exit;
  end;
  if (s <> '') and (request.CalledTitle <> (s)) then
  begin
    result := TDicomReject.Create(REJECTED_PERMANENT,
      DICOM_UL_SERVICE_USER_reject, USER_CALLED_AETITLE_NOT_RECOGNIZED);
    exit;
  end;
  flag1 := TRUE;
  if assigned(astr) and (astr.Count > 0) then
  begin
    j := 0;
    while j < astr.Count do
    begin
      if request.CallingTitle = (astr[j]) then
      begin
        flag1 := FALSE;
      end;
      Inc(j);
    end;
    if flag1 then
    begin
      result := TDicomReject.Create(REJECTED_PERMANENT,
        DICOM_UL_SERVICE_USER_reject, USER_CALLING_AETITLE_NOT_RECOGNIZED);
      exit;
    end;
  end;
  acknowledge := TAcknowledge.Create;
  acknowledge.MaxPduSize := request.MaxPduSize;
  {  if DefaultMaxPdu <= 0 then
    acknowledge.MaxPduSize := request.MaxPduSize
  else
    acknowledge.MaxPduSize := DefaultMaxPdu;}
  acknowledge.CalledTitle := trim(request.CalledTitle);
  acknowledge.CallingTitle := trim(request.CallingTitle);

  acknowledge.ApplicationContextUid := request.ApplicationContextUid;
  for k := 0 to request.getPresentationContexts - 1 do
  begin
    uidentry := request.getAbstractSyntax(k);
    //    for l := 0 to length(ai) - 1 do
    if (uidentry.UIDType = 1) or (uidentry.UIDType = 4) then
    begin
      //      if uidentry <> UIDS.ItemByIndex[ai[l]] then
      //        continue;
      l := 0;
      for j1 := 0 to request.getTransferSyntaxes(k) - 1 do
      begin
        uidentry1 := request.getTransferSyntax(k, j1);
        str1 := Uppercase(request.CalledTitle);

        if
          (uidentry1.Constant = ImplicitVRLittleEndian)
          or (uidentry1.Constant = ExplicitVRLittleEndian)
          or (uidentry1.Constant = ExplicitVRBigEndian)
          {or (uidentry1.Constant = JPEG_2_4)
  or (uidentry1.Constant = JPEGBaseline)
  or (uidentry1.Constant = JPEG_14)
  or (uidentry1.Constant = RLELossless)
  or (uidentry1.Constant = JPEGLossless)}
        then
        begin
          acknowledge.addPresentationContext(request.getPresentationContextID(k), 0,
            uidentry1.Constant);
          inc(l);

        end;
      end;
      if l <= 0 then
        acknowledge.addPresentationContext(request.getPresentationContextID(k), 4,
          ExplicitVRLittleEndian);
    end;
    //    acknowledge.addPresentationContext(request.getPresentationContextID(k), 3, i);
  end;

  if flag then
  begin
    flag2 := TRUE;
    for i1 := 0 to acknowledge.getPresentationContexts - 1 do
    begin
      if acknowledge.getResult(i1) = 0 then
        flag2 := FALSE;
    end;
    if flag2 then
    begin
      result := TDicomReject.Create(REJECTED_PERMANENT,
        DICOM_UL_SERVICE_USER_reject, USER_NO_REASON_GIVEN);
      exit;
    end;
  end;
  result := acknowledge;
end;
    
procedure TfrmMain.DicomServerDicomAssociation(
  AClientThread: TDicomClientThread; AAddress: string; AReg: TRequest;
  var AHandleType: Integer);
//var r: TDicomResponse;
begin
//  memLog.Lines.Add(AAddress);
//  AHandleType := -1;
//  r := MyprepareResponse(AReg, '', nil, true);
//  TDicomClientThread(AClientThread).Association.sendAssociateResponse(r); //}

  AHandleType := 1; // Access
end;

procedure TfrmMain.DicomServerDicomFilmPrint(AClientThread: TDicomClientThread;
  AAddress: string; APrintTask: TDicomPrintTask);
var
  i: Integer;
  das: TDicomDataset;
begin
  if (APrintTask.GetCount > 0) then
  begin
    if printer.Printers.Count <= 0 then
    begin
     ShowMessage('IP=' + AAddress + ',a dicom print data comein.but no printer');
     // memLog.Lines.Add('IP=' + AAddress + ',a dicom print data comein.but no printer');
    end
    else
    try
      ShowMessage('IP=' + AAddress + ',print image:' + IntToStr(APrintTask.GetCount));
      //memLog.Lines.Add('IP=' + AAddress + ',print image:' + IntToStr(APrintTask.GetCount));
      //print to printer
      if APrintTask.PrintOrientation[1] = 'P' then
        Printer.Orientation := poPortrait
      else
        Printer.Orientation := poLandscape;

      //you can select printer by change printerindex
      //printer.PrinterIndex :=

      Printer.BeginDoc;
      try
        APrintTask.Print(Printer.Canvas, 0, 0, Printer.PageWidth, Printer.PageHeight);
      finally
        Printer.EndDoc;
      end;

      //save to file
      for i := 0 to APrintTask.GetCount - 1 do
      begin
        das := TDicomDataset.Create(APrintTask.Items[i]);
        try
          das.SaveToFile(IntToStr(i) + '.DCM', True, ExplicitVRLittleEndian, 100);
          das.RecreateAttributes;
        finally
          das.Free;
        end;
      end;

    except
      on e: Exception do
        ShowMessage('IP=' + AAddress + ',print Error:' + e.Message);
        //memLog.Lines.Add('IP=' + AAddress + ',print Error:' + e.Message);
    end;
  end
  else
    ShowMessage('IP' + AAddress + ',no print image');
    //memLog.Lines.Add('IP' + AAddress + ',no print image');
end;

procedure TfrmMain.DicomServerDicomFind(AClientThread: TDicomClientThread;
                                        AAddress: string;
                                        ACommand: TDicomAttributes;
                                        ARequestDatasets, AResponseDatasets: TList);
var z1, d1, da1, rq, seq: TDicomAttributes;
    x1, x2, at, at1: TDicomAttribute;
    kk, Root: Integer;
    strSQL, Level, sql1, modility: string;
    Query1: TDataset;
    APPLY_NO, PatientID, Pname, psex: string;
    i: Integer;
    date1: TDatetime;
    procedure SetParamAsDatetime(AName: string; AValue: TDatetime);
    var i: integer;
        str1: string;
        dasx1, dasx2: TDicomAttributes;
    begin
      dasx1 := nil;
      for i := 0 to at1.GetCount - 1 do
        begin
          dasx2 := at1.Attributes[i];
          str1 := dasx2.GetString($2809, $28);
          if str1 = AName then
            begin
              dasx2.Item[$2809, $25].AsDatetime[0] := AValue;
              exit;
            end;
        end;
      if not assigned(dasx1) then
        begin
          dasx1 := TDicomAttributes.Create;
          dasx1.Add($2809, $28).asString[0] := AName;
          dasx1.Add($2809, $29).asInteger[0] := 3;
          dasx1.Add($2809, $25).asDatetime[0] := AValue;
          at1.AddData(dasx1);
        end;
    end;

    procedure DicomApplyTable;
      begin
        modility := '';
        at := rq.Item[$40, $100];
        if assigned(at) and (at.GetCount > 0) then // i.e. a sequence
          begin
            seq := at.Attributes[0];
            modility := seq.GetString($8, $60);
          end;
        if modility = '' then
          strSQL := ''
        else
          strSQL := 'MODALITY=''' + modility + '''';
        if (rq.GetString(dPatientID) <> '') then
          begin
            if strSQL <> '' then
              strSQL := strSQL + ' AND ';
            strSQL := strSQL + '( IDField = ''' + rq.GetString(dPatientID) + ''')';
          end;
        if (rq.GetString(dPatientName) <> '') and (rq.GetString(dPatientName) <> '*') then
          begin
            if strSQL <> '' then
              strSQL := strSQL + ' AND ';
            strSQL := strSQL + ' NameField like ''%' + rq.GetString(dPatientName) + '%''';
          end;
        x1 := rq.Item[$40, $100];
        if assigned(x1) and (x1.GetCount > 0) then
          begin
            z1 := x1.Attributes[0];
            x1 := z1.Item[$40, $2];
            if assigned(x1) and (x1.GetCount > 0) then
              begin
                if strSQL <> '' then
                  strSQL := strSQL + ' and ';
                date1 := x1.AsDatetime[0];
                strSQL := strSQL + ' APPLY_TIME >= :CK_DATE1';
                SetParamAsDatetime('CK_DATE1', date1);
                if (x1.GetCount > 1) then
                  begin
                    date1 := x1.AsDatetime[1];
                    strSQL := strSQL + ' AND APPLY_TIME <= :CK_DATE2';
                    SetParamAsDatetime('CK_DATE2', date1);
                  end;
          end;
        end;
        sql1 := ' SELECT * FROM APPLYTABLE ';
        if strSQL <> '' then
          sql1 := sql1 + ' WHERE ' + strSQL;
          if sql1 <> '' then
            begin
              SumitSQL(nil, '', sql1, 0, false, at1, Query1);
              if Assigned(Query1) then
                try
                  Query1.First;
                  while not Query1.Eof do
                    begin
                      da1 := TDicomAttributes.Create;
                      AResponseDatasets.Add(da1);
                      APPLY_NO := Query1.FieldByName('IDField').asstring;
                      if (assigned(Query1.FindField('UIDField'))) then
                        begin
                          if Query1.FieldByName('UIDField').asstring = '' then
                            begin
                              strSQL := '1.2.40.0.13.' + FormatDatetime('yyyymmddhhnnss', now) + '.' + Apply_No;
                              da1.AddVariant($20, $D, strSQL);
                              ExecSQL('update APPLYTABLE set ' +
                                      'UIDField=''' + strSQL + ''' WHERE IDField=' + apply_no);
                            end else
                              da1.AddVariant($20, $D, Query1.FieldByName('UIDField').asstring);
                        end else
                        begin
                          memLog.Lines.Add('FatalError:UIDField Field not found');
                          break;
                        end;
                      da1.AddVariant($8, $5, 'ISO_IR 100');
                      da1.AddVariant($8, $50, Apply_No);
                      da1.Add($8, $90);
                      da1.Add($8, $1110);
                      da1.Add($8, $1120);
                      if (assigned(Query1.FindField('ENameField'))) and (Query1.FieldByName('ENameField').asstring <> '') then
                        da1.AddVariant($10, $10, Query1.FieldByName('ENameField').asstring)
                      else
                        if (assigned(Query1.FindField('NameField'))) then
                          da1.AddVariant($10, $10, (Query1.FieldByName('NameField').asstring))
                        else
                          da1.Add($10, $10);
                        da1.AddVariant($10, $20, Query1.FieldByName('IDField').asstring);
                        da1.Remove($10, $30);
                        if (assigned(Query1.FindField('BirthDateField'))) then
                          begin
                            da1.Add($10, $30).AsDatetime[0] := Query1.FieldByName('BirthDateField').AsDatetime;
                            da1.AddVariant($10, $1010, GetAge(Query1.FieldByName('BirthDateField').AsDatetime,
                            Query1.FieldByName('APPLY_TIME').AsDatetime));
                          end else
                            da1.Add($10, $30);

                      if (assigned(Query1.FindField('SexField'))) then
                        begin
                          da1.AddVariant($10, $40, Query1.FieldByName('SexField').asstring)
                        end else
                          da1.Add($10, $40);

          da1.Add($10, $1030);
          da1.Add($10, $2000);
          da1.Add($10, $2110);
          da1.Add($10, $21C0);
          if (assigned(Query1.FindField('DoctorField'))) then
            da1.AddVariant($32, $1032, (Query1.FieldByName('DoctorField').asstring)) //RequestedPhys
          else
            da1.Add($32, $1032);

          if (assigned(Query1.FindField('DescField'))) then
            da1.AddVariant($32, $1060, (Query1.FieldByName('DescField').asstring)) //RequestedProcedureDescription
          else
            da1.Add($32, $1060);

          da1.Add($32, $1064);
          da1.Add($38, $10);
          da1.Add($38, $50);
          if (assigned(Query1.FindField('DescField'))) then
            da1.AddVariant($38, $300, (Query1.FieldByName('DescField').asstring))
          else
            da1.Add($38, $300);
          da1.Add($38, $500);
          d1 := TDicomAttributes.Create;
          d1.AddVariant($8, $60, Modility);
          d1.Remove($40, $2);
          d1.Remove($40, $3);
          d1.Add($40, $2).AsDatetime[0] := now;
          d1.Add($40, $3).AsDatetime[0] := now;
          d1.Add($40, $6);
          d1.Add($40, $7); //ScheduledProcedureStepDescription
          d1.Add($40, $8);
          d1.AddVariant($40, $9, Apply_No);
          d1.AddVariant($40, $10, 'CNSPACS');
          da1.Add($40, $100).AddData(d1);
          d1.Add($40, $10);
          da1.AddVariant($40, $1001, Apply_No);
          da1.Add($40, $3001);
          Query1.Next;
        end;
      finally
        Query1.Free;
      end;
    end;
  end; //cns pacs mwl
begin
  Root := getAffectedSOPClass(ACommand); // определяем тип поиска
  rq := TDicomAttributes(ARequestDatasets[0]);
  Level := Trim(rq.GetString(78));
  modility := '';
  at1 := TDicomAttribute.Create(nil, $2809, $2B);
  try
    if root = ModalityWorklistInformationModelFIND then // запрашиваем WorkList
      begin
        DoQueryInsert('Событие сервера. DicomFind',
                      4,
                      Now,
                      DateTimeToStr(Now)+#13+
                      'Событие сервера. DicomFind'+#13+
                      'C-FIND worklist request');
        modility := '';
        at := rq.Item[$40, $100];
        if assigned(at) and (at.GetCount > 0) then // i.e. a sequence
          begin
            seq := at.Attributes[0];
            modility := seq.GetString($8, $60);
          end;
        strSQL := '';
        DicomApplyTable; // формируем запрос к БД
      end else
      begin
        DoQueryInsert('Событие сервера. DicomFind',
                      4,
                      Now,
                      DateTimeToStr(Now)+#13+
                      'Событие сервера. DicomFind'+#13+
                      'C-FIND ' + level+';'+#13+
                      'Adress: '+AAddress);
        memLog.Lines.Add('C-FIND ' + level);
//-->> 1. LEVEL = PATIENT (Уровень поиска "Пациент")
        if (level = 'PATIENT') then
          begin
            strSQL := '';
            PName := rq.GetString(dPatientName);
            if (PName <> '') and (PName <> '*') then
              begin
                if strSQL <> '' then
                  strSQL := strSQL + ' and ';
                strSQL := 'P_ENAME like ''%' + PName + '%''';
            end;
            PatientID := rq.GetString(dPatientID);
            if PatientID <> '' then
              begin
                if strSQL <> '' then
                  strSQL := strSQL + ' and ';
                strSQL := strSQL + 'P_PID like ''%' + PatientID + '%''';
              end;
            PSex := rq.GetString(dPatientSex);
            if PSex <> '' then
              begin
                if strSQL <> '' then
                  strSQL := strSQL + ' and ';
                strSQL := strSQL + 'P_SEX = ''' + PSex + '''';
              end;
            if strSQL <> '' then
              sql1 := 'SELECT * FROM STUDIES WHERE ' + strSQL
            else
              sql1 := 'SELECT * FROM STUDIES';
            SumitSQL(nil, '', sql1, 0, false, at1, Query1);

            if Assigned(Query1) then
              begin
                try
                  Query1.First;
                  while not Query1.Eof do
                    begin
                      da1 := TDicomAttributes.Create;
                      for i := 0 to rq.Count - 1 do
                        begin
                          x1 := rq.ItemByIndex[i];
                          x2 := da1.Add(x1.Group, x1.Element);
                          if x1.AsString[0] <> '' then
                            x2.AsString[0] := x1.AsString[0];
                        end;
                      da1.AddVariant($8, $52, Level);
                      da1.AddVariant($8, $5, 'ISO_IR 100');
                      da1.AddVariant($10, $10, Query1.FieldByName('P_ENAME').asstring);
                      da1.AddVariant($10, $20, Query1.FieldByName('P_PID').asstring);
                      da1.AddVariant($10, $40, Query1.FieldByName('P_SEX').asstring);
                      da1.Sort;
                      AResponseDatasets.Add(da1);
                      Query1.Next;
                    end;
                finally
                  Query1.Free;
                end;
              end;
          end; // end of level = patient
//<<-- 1
//-->> 2. LEVEL = STUDY (Уровень поиска "Исследование")
        if level = 'STUDY' then
          begin
            strSQL := '';
            PName := rq.GetString($8, $61); // 1). модальность (тип исследования) +
            if PName = '' then
              PName := rq.GetString($8, $60); //модальность (тип исследования) +
            if (PName <> '') then
              strSQL := 'STUDIES_IMAGE_TYPE = ''' + PName + '''';
            x1 := rq.Item[$8, $20]; // 2). даты +
            if assigned(x1) and (x1.GetCount > 0) then
              begin
                if strSQL <> '' then
                  strSQL := strSQL + ' and ';
                date1 := x1.AsDatetime[0];
                if (x1.GetCount > 1) then
                  begin
                    strSQL := strSQL + ' LDATE >= ''' + DateTimeToStr(date1) + '''';
                    date1 := x1.AsDatetime[1];
                    strSQL := strSQL + ' AND LDATE <= ''' + DateTimeToStr(date1) + '''';
                  end else
                  begin
                    strSQL := strSQL + ' LDATE = ''' + DateTimeToStr(date1) + '''';
                  end;
              end;
            if rq.GetString(dStudyInstanceUID) <> '' then // 3). UID исследования
              begin
                if strSQL <> '' then
                  strSQL := strSQL + ' and ';
                strSQL := 'STUDYUID like ''%' + rq.GetString(dStudyInstanceUID) + '%''';
              end;
            if rq.GetString(dPatientID) <> '' then // 4). Номер исследования
              begin
                if strSQL <> '' then
                  strSQL := strSQL + ' and ';
                strSQL := strSQL + 'P_PID like ''%' + rq.GetString(dPatientID) + '%''';
              end;
            if rq.GetString(dPatientName) <> '' then // 5). Фамилия пациента
              begin
                if strSQL <> '' then
                  strSQL := strSQL + ' and ';
                strSQL := strSQL + 'P_ENAME like ''%' + rq.GetString(dPatientName) + '%''';
              end;
            if rq.GetString(dPatientSex) <> '' then // 6). Пол пациента
              begin
                if strSQL <> '' then
                  strSQL := strSQL + ' and ';
                strSQL := strSQL + 'P_SEX = ''' + rq.GetString(dPatientSex)+'''';
              end;
            if rq.GetString(dPatientBirthDate) <> '' then // 7). Дата рождения пациента
              begin
                if strSQL <> '' then
                  strSQL := strSQL + ' and ';
                strSQL := strSQL + 'P_DATEBORN = ''' + rq.GetString(dPatientBirthDate)+'''';
              end;
            if rq.GetString(dStudyDescription) <> '' then // 8). Описание исследования
              begin
                if strSQL <> '' then
                  strSQL := strSQL + ' and ';
                strSQL := strSQL + 'STUDYDESCRIPTION like ''' + rq.GetString(dStudyDescription)+'''';
              end;
            if rq.GetString($8, $90) <> '' then // 9). Врач
              begin
                if strSQL <> '' then
                  strSQL := strSQL + ' and ';
                strSQL := strSQL + 'REFERRINGPHYSICIANNAME like ''' + rq.GetString($8, $90)+'''';
              end;

            if strSQL <> '' then
              sql1 := 'SELECT * FROM STUDIES WHERE ' + strSQL + ' ORDER BY LDATE'
            else
              sql1 := 'SELECT * FROM STUDIES ORDER BY LDATE';
            SumitSQL(nil, '', sql1, 0, false, at1, Query1);
            if Assigned(Query1) then
              try
                Query1.First;
                while not Query1.Eof do
                  begin
                    da1 := TDicomAttributes.Create;
                    da1.AddVariant($8, $52, Level);
                    da1.AddVariant($8, $5, 'ISO_IR 100');
                    da1.Remove(8, $61);
                    da1.AddVariant($10, $10, Query1.FieldByName('P_ENAME').asString);
                    da1.AddVariant($10, $20, Query1.FieldByName('P_PID').asString);
                    da1.AddVariant($20, $D, Query1.FieldByName('STUDYUID').asString);
                    da1.AddVariant($20, $10, Query1.FieldByName('STUDYID').asString);
                    da1.AddVariant($8, $20, Query1.FieldByName('LDATE').asString);
                    da1.AddVariant($8, $60, Query1.FieldByName('STUDIES_IMAGE_TYPE').asString);
                    da1.AddVariant($8, $1030, Query1.FieldByName('LDATE').asString);
                    da1.Sort;
                    AResponseDatasets.Add(da1);
                    Query1.Next;
                  end;
              finally
                Query1.Free;
              end;
          end; //end of level = study
//<<-- 2
//-->> 3. LEVEL = SERIES (Уровень поиска "Серия")
        if level = 'SERIES' then
          begin
            strSQL := '';
            if rq.GetString(dSeriesInstanceUID) <> '' then
              begin
                if strSQL <> '' then
                  strSQL := strSQL + ' and ';
                strSQL := strSQL + 'SERIESUID  =''' + rq.GetString(dSeriesInstanceUID) + '''';
              end else
                if rq.GetString(dStudyInstanceUID) <> '' then
                  begin
                    strSQL := 'STUDYUID = ''' + rq.GetString(dStudyInstanceUID) + '''';
                  end;
            if strSQL = '' then
              exit;
            sql1 := 'SELECT * FROM SERIES WHERE ' + strSQL;
            SumitSQL(nil, '', sql1, 0, false, at1, Query1);
            kk := 0;
            if Assigned(Query1) then
              try
                Query1.First;
                while not Query1.Eof do
                  begin
                    da1 := TDicomAttributes.Create;
                    for i := 0 to rq.Count - 1 do
                      begin
                        x1 := rq.ItemByIndex[i];
                        x2 := da1.Add(x1.Group, x1.Element);
                        if x1.AsString[0] <> '' then
                          x2.AsString[0] := x1.AsString[0];
                      end;
                    da1.AddVariant($8, $52, Level);
                    da1.AddVariant($8, $5, 'ISO_IR 100');
                    da1.Add($8, $8);
                    da1.Add($8, $70);
                    da1.Add($20, $1002);
                    da1.AddVariant($20, $D, Query1.FieldByName('STUDYUID').asstring);
                    da1.AddVariant($20, $E, Query1.FieldByName('SERIESUID').asstring);
                    da1.AddVariant($8, $60, Query1.FieldByName('SERIES_IMAGETYPE').asstring);
                    da1.Add($8, $0021).AsDatetime[0] := Query1.FieldByName('SERIES_DATE').AsDateTime;
                    da1.AddVariant($8, $103E, Query1.FieldByName('SERIES_DESC').asstring);
                    da1.AddVariant($20, $11, kk);
                    inc(kk);
                    da1.Sort;
                    AResponseDatasets.Add(da1);
                    Query1.Next;
                  end;
              finally
                Query1.Free;
              end;
          end; //end of series
//<<-- 3
//-->> 4. LEVEL = IMAGE (Уровень поиска "Изображение")
        if level = 'IMAGE' then
          begin
            strSQL := '';
            if rq.GetString($8, $18) <> '' then
              begin
                strSQL := ' INSTANCEUID = ''' + rq.GetString($8, $18) + '''';
              end else
                if rq.GetString(dSeriesInstanceUID) <> '' then
                  begin
                    if strSQL <> '' then
                      strSQL := strSQL + ' and ';
                    strSQL := strSQL + 'SERIESUID = ''' + rq.GetString(dSeriesInstanceUID) + '''';
                  end else
                    if rq.GetString(dStudyInstanceUID) <> '' then
                      begin
                        if strSQL <> '' then
                          strSQL := strSQL + ' and ';
                        strSQL := strSQL + 'STUDYUID = ''' + rq.GetString(dStudyInstanceUID) + '''';
                      end;
            if strSQL = '' then
              exit;
            sql1 := 'SELECT * FROM IMAGES WHERE ' + strSQL + ' ORDER BY SERIESUID,IMGNO';
            SumitSQL(nil, '', sql1, 0, false, at1, Query1);
            if Assigned(Query1) then
              try
                Query1.First;
                while not Query1.Eof do
                  begin
                    da1 := TDicomAttributes.Create;
                    for i := 0 to rq.Count - 1 do
                      begin
                        x1 := rq.ItemByIndex[i];
                        x2 := da1.Add(x1.Group, x1.Element);
                        if x1.AsString[0] <> '' then
                          x2.AsString[0] := x1.AsString[0];
                      end;
                    da1.AddVariant($8, $52, Level);
                    da1.AddVariant($8, $5, 'ISO_IR 100');
                    da1.Add($8, $8);
                    da1.AddVariant($20, $D, Query1.FieldByName('STUDYUID').asstring);
                    da1.AddVariant($20, $E, Query1.FieldByName('SERIESUID').asstring);
                    da1.AddVariant($8, $60, Query1.FieldByName('IMAGETYPE').asstring);
                    da1.AddVariant($8, $18, Query1.FieldByName('InstanceUID').asstring);
                    da1.AddVariant($20, $13, Query1.FieldByName('IMGNO').asstring);
                    da1.AddVariant($28, $10, Query1.FieldByName('SIZEX').AsInteger);
                    da1.AddVariant($28, $11, Query1.FieldByName('SIZEY').AsInteger);
                    da1.Sort;
                    AResponseDatasets.Add(da1);
                    Query1.Next;
                  end;
              finally
                Query1.Free;
              end;
          end; //end of level = Image
        end;
  finally
    at1.Free;
  end;
end;

procedure TfrmMain.DicomServerDicomGet(AClientThread: TDicomClientThread;
                                       AAddress: string;
                                       ACommand: TDicomAttributes;
                                       ARequestDatasets, AResponseDatasets: TList);
var Dds : TDicomDataset;
     DA : TDicomAttributes;
    Str, Level, SQL: string;
    Query1: TDataset;
    BaseDir, BaseRemoteDir, pName: string;
function HaveTheImage(Das: TDicomAttributes): Boolean;
var i : integer;
  begin
    Result := true;
    for i := 0 to AResponseDatasets.Count - 1 do
      begin
        DA := TDicomAttributes(AResponseDatasets[i]);
        if DA.GetString(8, $18) = das.GetString(8, $18) then
          begin
            Result := False;
            Exit;
          end;
      end;
  end;
begin
  DA := TDicomAttributes(ARequestDatasets[0]);
  Level := DA.GetString(78); // определяется уровень (patient, study, series, images)

  if Level = 'PATIENT' then
    Str := 'P_PID = ''' + DA.GetString(dPatientID) + ''''
  else
    if Level = 'STUDY' then
      if DA.GetString(dAccessionNumber) = '' then // если не выставлен номер протокола то пытаемся найти по Study UID
        Str := 'STUDYUID = ''' + DA.GetString(dStudyInstanceUID) + ''''
      else
        Str := 'ACCESSIONNUMBER = ''' + DA.GetString(dAccessionNumber) + ''''
  else
    if Level = 'SERIES' then
    Str := 'SeriesUID = ''' + DA.GetString(dSeriesInstanceUID) + ''''
  else
    if Level = 'IMAGE' then
    Str := 'InstanceUID = ''' + DA.GetString($0008, $0018) + '''';
  if Str = '' then
    begin
      exit;
    end;

  SQL := 'SELECT * FROM IMAGES WHERE ' + Str + ' ORDER BY SERIESUID,IMGNO';

  DoQueryInsert('Обработка события. DicomGet',
                4,
                Now,
                DateTimeToStr(Now)+#13+
                'Событие DicomGet'+#13+
                'Address: '+AAddress+#13+
                'Level: '+Level+#13+
                Str+#13+
                SQL);

  SumitSQL(nil, '', SQL, 0, False, nil, Query1); // ???
  if Assigned(Query1) then
    try
      Query1.First;
      if not Query1.EOF then
        begin
          if TestDcmFileDir(Query1, BaseDir) then  // -->> 1. ищем файл в локальном хранилище
            begin
              Dds := TDicomDataset.Create;
              try
                while not Query1.EOF do
                  begin
                    pName := TestFile(Query1, BaseDir);
                    if (pName <> '') then
                      begin
                        if Dds.LoadFromFile(pName) then
                          begin
                            if HaveTheimage(Dds.Attributes) then
                              begin
                                AResponseDatasets.Add(Dds.Attributes);
                                Dds.RecreateAttributes;
                              end else
                              begin
                                Dds.Attributes.Clear;
                                Dds.Attributes.Free;
                                Dds.RecreateAttributes;
                              end;
                          end;
                      end;
                    Query1.Next;
                  end;
              finally
                Dds.Free;
              end;
            end else
            begin
              if TestDcmFileDir_RemoteDir(Query1, BaseRemoteDir) then  // -->> 2. ищем файл в глобальном хранилище
                begin
                  Dds := TDicomDataset.Create;
                  try
                    while not Query1.EOF do
                      begin
                        pName := TestFile(Query1, BaseRemoteDir);
                        if (pName <> '') then
                          begin
                            if Dds.LoadFromFile(pName) then
                              begin
                                if HaveTheimage(Dds.Attributes) then
                                  begin
                                    AResponseDatasets.Add(Dds.Attributes);
                                    Dds.RecreateAttributes;
                                  end else
                                  begin
                                    Dds.Attributes.Clear;
                                    Dds.Attributes.Free;
                                    Dds.RecreateAttributes;
                                  end;
                              end;
                          end;
                        Query1.Next;
                      end;
                  finally
                    Dds.Free;
                  end;
            end;
        end;
        end;
    finally
      Query1.Free;
    end;
end;

procedure TfrmMain.DicomServerDicomImage(AClientThread: TDicomClientThread; AAddress: string; ADataset: TDicomDataset);
var InstanceUID, Aid, pName, pDateBorn, pSex, ImageType, StudyID, SeriesUID, StudyUID, PatientID, ImageType1, StudyDescription, PhysName, AccessionNumber: string;
    StudyDate: TDatetime;
    DA: TDicomAttribute;
    y, m, d: Word;
    ImageFilename: string;
    CurDir : string; //CurrentDir
procedure SetDir(ADir: string);
  begin
    if ADir <> '' then
      begin
        if CurDir <> '' then
          begin
            if CurDir[Length(CurDir)] <> '\' then
              CurDir := CurDir + '\';
            CurDir := CurDir + ADir;
          end else
          begin
            CurDir := ADir;
          end;
        if not DirectoryExists(CurDir) then
          if not CreateDir(CurDir) then
            raise Exception.Create('Не удаётся создать дирректорию ' + CurDir);
      end;
  end;
begin
// парсим DICOM
  ImageType := ADataset.Attributes.GetString($8, $60); // Модальность (CS Modality)
  StudyID := ADataset.Attributes.GetString($20, $10); // ID исследования (StudyID)
  PatientID := ADataset.Attributes.GetString($10, $20); // ID пациента (PatientID)
  StudyDescription := ADataset.Attributes.GetString($8, $1030); // Комментарий-описание к исследованию (Study Description)
  PhysName := ADataset.Attributes.GetString($8, $0090); // ФИО врача (Referring Physicians Name)
  AccessionNumber := ADataset.Attributes.GetString($8, $0050); // Номер протокола исследования
  DA := ADataset.Attributes.Item[8, $20]; // Дата исследования (Study Date)
  if assigned(DA) then
    begin
      StudyDate := DA.AsDatetime[0];
      DA := ADataset.Attributes.Item[8, $30]; // Время исследования (Study Time)
      if assigned(DA) then
        begin
          StudyDate := StudyDate + DA.AsDatetime[0];
        end;
    end else
    begin
      StudyDate := Now;
    end;
  StudyUID := ADataset.Attributes.GetString($20, $D);  // Study Instance UID
  SeriesUID := ADataset.Attributes.GetString($20, $E); // Series Instanse UID
  if SeriesuID = '' then
    SeriesUID := ADataset.Attributes.GetString($20, $11); // Series Number
  pName := ADataset.Attributes.GetString($10, $10); // ФИО пациента (Patient Name)
  pDateBorn := ADataset.Attributes.GetString($10, $30); // Дата рождения пациента (Patient Birth Date)
  pSex := ADataset.Attributes.GetString($10, $40); // Пол пациента (Patient Sex)
  if PatientID = '' then
    PatientID := 'Unknown';
  AID := ADataset.Attributes.GetString($20, $13); // Instance Number
  if aid = '' then
    AID := ADataset.Attributes.GetString($20, $12); // Acquisition Number - что это ?
  if aid = '' then
    aid := '1';
  InstanceUID := ADataset.Attributes.GetString($8, $18); // SOP Instanse UID

// делаем запись в БД FireBird
  StudyDate := AppendImage(ADataset.Attributes,
                           StudyID,
                           PName,
                           pDateBorn,
                           PSex,
                           PatientID,
                           StudyDate,
                           StudyUID,
                           SeriesUID,
                           InstanceUID,
                           ImageType,
                           AID,
                           ImageType1,
                           StudyDescription,
                           PhysName,
                           AccessionNumber);

  DecodeDate(StudyDate, y, m, d);
  SetDir(sDir);
  SetDir(ImageType1);
  SetDir(IntToStr(y));
  SetDir(IntToStr(m));
  SetDir(IntToStr(d));
  SetDir(StudyuID);
  SetDir(SeriesUID);
  ImageFileName := InstanceUID + '.dcm';
  if CurDir[Length(CurDir)] <> '\' then
    CurDir := CurDir + '\';
  CurDir := CurDir + ImageFileName;

//сохраняем DICOM-файл на жесткий диск
  ADataset.SaveToFile(CurDir, // FileName
                      True,
                      8197, //ADataset.Attributes.ImageData.ImageData[0].TransferSyntax,
                      100);  //Quality
  ADataset.Free;
  AClientThread.Association.SendStatus(0);

// запись в лог
  DoQueryInsert('Событие сервера. DicomImage',
                4,
                Now,
                DateTimeToStr(Now)+#13+
                'Обработка события сервера DicomImage'+#13+
                'Данные исследования:'+#13+
                'CS Modality: '+ ImageType+#13+
                'StudyID: '+StudyID+#13+
                'AccessionNumber: '+AccessionNumber+#13+
                'StudyDate: '+DateTimeToStr(StudyDate)+#13+
                'Данные пациента:'+#13+
                'PatientID: '+PatientID+#13+
                'Patient Name: '+PName+#13+
                'Patient Sex: '+pSex+#13+
                'Служебные данные:'+#13+
                'Study Instance UID: '+StudyUID+#13+
                'Series Instanse UID: '+SeriesUID+#13+
                'Instance Number: '+AID+#13+
                'SOP Instanse UID: '+InstanceUID);
end;

procedure TfrmMain.DicomServerDicomLogit(AClientThread: TDicomClientThread; AIP, Msg: string);
begin
  DoQueryInsert('Событие сервера. DicomLogit',
                4,
                Now,
                DateTimeToStr(Now)+#13+
                'Обработка события сервера DicomLogit'+#13+
                'AIP: '+AIP+#13+
                'Msg: '+Msg);
end;

procedure TfrmMain.DicomServerNormalisedReceivedNDelete(
  AClientThread: TDicomClientThread; AAddress: string;
  ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
begin
  DoQueryInsert('Событие сервера. N_DELETE',
                4,
                Now,
                DateTimeToStr(Now));
end;

procedure TfrmMain.DicomServerPrivateDicomGetRequest(
  AClientThread: TDicomClientThread; rq: TDicomAttributes;
  ADstCommand: TDicomAttribute; AResponseStreams: TList;
  AResponseFiles: TStringList);
begin
        DoQueryInsert('Событие сервера. DicomGetRequest',
                      4,
                      Now,
                      DateTimeToStr(Now)+#13+
                      'Событие сервера. DicomGetRequest'+#13+
                      'C-FIND worklist request');
end;

procedure TfrmMain.DoQueryConnect;
var dsFIB : TpFIBDataSet;
     qFIB : TpFIBQuery;
begin
  if DB.Connected = True then
    begin
      dsFIB := TpFIBDataSet.Create(nil);
      qFIB := TpFIBQuery.Create(nil);
      try
        dsFIB.Database := DB;
        dsFIB.Transaction := trWrite;
        dsFIB.AutoCommit := True;
        qFIB.Close;
        qFIB.Database := DB;
        if trWrite.Active = False then
          trWrite.Active := True;
        qFIB.Transaction := trWrite;
        qFIB.Options := qFIB.Options + [qoAutoCommit];
        qFIB.SQL.Clear;

        dsFIB.SQLs.SelectSQL.Text := ' SELECT FC_VALUE FROM PARAMS WHERE FC_SECTION = ''BD'' AND FC_KEY = ''PATH'' ';
        dsFIB.Open;
        if dsFIB.RecordCount > 0 then
          begin
            qFIB.SQL.Text := ' UPDATE PARAMS SET FC_VALUE = :FC_VALUE WHERE FC_SECTION = :FC_SECTION AND FC_KEY = :FC_KEY ';
            qFIB.ParamByName('FC_SECTION').AsString := 'BD';
            qFIB.ParamByName('FC_KEY').AsString := 'PATH';
            qFIB.ParamByName('FC_VALUE').AsString := memBD.Lines.Text;
            qFIB.ExecQuery;
          end else
          begin
            qFIB.SQL.Text := ' INSERT INTO PARAMS(FC_SECTION, FC_KEY, FC_VALUE) VALUES(''BD'', ''PATH'', :FC_VALUE) ';
            qFIB.ParamByName('FC_VALUE').AsString := memBD.Lines.Text;
            qFIB.ExecQuery;
          end;
        finally
          dsFIB.Free;
          qFIB.Free;
        end;
      end;
end;

procedure TfrmMain.DoQueryInsert(sEvent: string; nType: Integer; dDate: TDateTime; sRemark: string);
var FIBQuery : TpFIBQuery;
begin
  FIBQuery := TpFIBQuery.Create(nil);
  try
    FIBQuery.Close;
    FIBQuery.Database := DB;
    if trWrite.Active = False then
      trWrite.Active := True;
    FIBQuery.Transaction := trWrite;
    FibQuery.Options := FibQuery.Options + [qoAutoCommit];
    FIBQuery.SQL.Clear;
    FIBQuery.SQL.Text := ' INSERT INTO EVENTS(FC_NAME, FN_TYPE, FD_DATE, FC_REMARK) '+
                         ' VALUES(:FC_NAME, :FN_TYPE, :FD_DATE, :FC_REMARK) ';
    FIBQuery.ParamByName('FC_NAME').AsString := sEvent;
    FIBQuery.ParamByName('FN_TYPE').AsInteger := nType;
    FIBQuery.ParamByName('FD_DATE').AsDateTime := dDate;
    FIBQuery.ParamByName('FC_REMARK').AsString := sRemark;
    FIBQuery.ExecQuery;
  finally
    FIBQuery.Free;
  end;
end;

procedure TfrmMain.DoQueryServer(sPort : string; sTitle : string; sDir : string; sDirRemote : string; nDaysArchive : Integer; isDevices : Integer);
var qFIB : TpFIBQuery;
    dsFIB : TpFIBDataSet;
begin
  if DB.Connected = True then
    begin
      dsFIB := TpFIBDataSet.Create(nil);
      qFIB := TpFIBQuery.Create(nil);
      try
        dsFIB.Database := DB;
        dsFIB.Transaction := trWrite;
        dsFIB.AutoCommit := True;
        qFIB.Close;
        qFIB.Database := DB;
        if trWrite.Active = False then
          trWrite.Active := True;
        qFIB.Transaction := trWrite;
        qFIB.Options := qFIB.Options + [qoAutoCommit];
        qFIB.SQL.Clear;
// -->> 1. Порт
        dsFIB.SQLs.SelectSQL.Clear;
        dsFIB.SQLs.SelectSQL.Text := ' SELECT FC_VALUE FROM PARAMS WHERE FC_SECTION = ''SERVER'' AND FC_KEY = ''PORT'' ';
        dsFIB.Open;
        if dsFIB.RecordCount > 0 then
          begin
            qFIB.SQL.Text := ' UPDATE PARAMS SET FC_VALUE = :FC_VALUE WHERE FC_SECTION = ''SERVER'' AND FC_KEY = ''PORT'' ';
            qFIB.ParamByName('FC_VALUE').AsString := sPort;
            qFIB.ExecQuery;
          end else
          begin
            qFIB.SQL.Text := ' INSERT INTO PARAMS(FC_SECTION, FC_KEY, FC_VALUE) VALUES(''SERVER'', ''PORT'', :FC_VALUE) ';
            qFIB.ParamByName('FC_VALUE').AsString := sPort;
            qFIB.ExecQuery;
          end;
// -->> 2. AE Title
        dsFIB.Close;
        dsFIB.SQLs.SelectSQL.Clear;
        dsFIB.SQLs.SelectSQL.Text := ' SELECT FC_VALUE FROM PARAMS WHERE FC_SECTION = ''SERVER'' AND FC_KEY = ''AETITLE'' ';
        qFIB.SQL.Clear;
        dsFIB.Open;
        if dsFIB.RecordCount > 0 then
          begin
            qFIB.SQL.Text := ' UPDATE PARAMS SET FC_VALUE = :FC_VALUE WHERE FC_SECTION = ''SERVER'' AND FC_KEY = ''AETITLE'' ';
            qFIB.ParamByName('FC_VALUE').AsString := sTitle;
            qFIB.ExecQuery;
          end else
          begin
            qFIB.SQL.Text := ' INSERT INTO PARAMS(FC_SECTION, FC_KEY, FC_VALUE) VALUES(''SERVER'', ''AETITLE'', :FC_VALUE) ';
            qFIB.ParamByName('FC_VALUE').AsString := sTitle;
            qFIB.ExecQuery;
          end;
// -->> 3. Оперативное хранилище данных
        dsFIB.Close;
        dsFIB.SQLs.SelectSQL.Clear;
        dsFIB.SQLs.SelectSQL.Text := ' SELECT FC_VALUE FROM PARAMS WHERE FC_SECTION = ''SERVER'' AND FC_KEY = ''STORAGESCP'' ';
        qFIB.SQL.Clear;
        dsFIB.Open;
        if dsFIB.RecordCount > 0 then
          begin
            qFIB.SQL.Text := ' UPDATE PARAMS SET FC_VALUE = :FC_VALUE WHERE FC_SECTION = ''SERVER'' AND FC_KEY = ''STORAGESCP'' ';
            qFIB.ParamByName('FC_VALUE').AsString := sDir;
            qFIB.ExecQuery;
          end else
          begin
            qFIB.SQL.Text := ' INSERT INTO PARAMS(FC_SECTION, FC_KEY, FC_VALUE) VALUES(''SERVER'', ''STORAGESCP'', :FC_VALUE) ';
            qFIB.ParamByName('FC_VALUE').AsString := sDir;
            qFIB.ExecQuery;
          end;
//-->> 4. Долговременное хранилище снимков
        dsFIB.Close;
        dsFIB.SQLs.SelectSQL.Clear;
        dsFIB.SQLs.SelectSQL.Text := ' SELECT FC_VALUE FROM PARAMS WHERE FC_SECTION = ''SERVER'' AND FC_KEY = ''REMOTESTORAGESCP'' ';
        qFIB.SQL.Clear;
        dsFIB.Open;
        if dsFIB.RecordCount > 0 then
          begin
            qFIB.SQL.Text := ' UPDATE PARAMS SET FC_VALUE = :FC_VALUE WHERE FC_SECTION = ''SERVER'' AND FC_KEY = ''REMOTESTORAGESCP'' ';
            qFIB.ParamByName('FC_VALUE').AsString := sDirRemote;
            qFIB.ExecQuery;
          end else
          begin
            qFIB.SQL.Text := ' INSERT INTO PARAMS(FC_SECTION, FC_KEY, FC_VALUE) VALUES(''SERVER'', ''REMOTESTORAGESCP'', :FC_VALUE) ';
            qFIB.ParamByName('FC_VALUE').AsString := sDirRemote;
            qFIB.ExecQuery;
          end;
//-->> 5. Количество дней, после которых исследование считается устаревшим и помещается в архив
        dsFIB.Close;
        dsFIB.SQLs.SelectSQL.Clear;
        dsFIB.SQLs.SelectSQL.Text := ' SELECT FC_VALUE FROM PARAMS WHERE FC_SECTION = ''ARCHIVE'' AND FC_KEY = ''DAYSARCHIVE'' ';
        qFIB.SQL.Clear;
        dsFIB.Open;
        if dsFIB.RecordCount > 0 then
          begin
            qFIB.SQL.Text := ' UPDATE PARAMS SET FC_VALUE = :FC_VALUE WHERE FC_SECTION = ''ARCHIVE'' AND FC_KEY = ''DAYSARCHIVE'' ';
            qFIB.ParamByName('FC_VALUE').AsString := IntToStr(nDaysArchive);
            qFIB.ExecQuery;
          end else
          begin
            qFIB.SQL.Text := ' INSERT INTO PARAMS(FC_SECTION, FC_KEY, FC_VALUE) VALUES(''ARCHIVE'', ''DAYSARCHIVE'', :FC_VALUE) ';
            qFIB.ParamByName('FC_VALUE').AsString := IntToStr(nDaysArchive);
            qFIB.ExecQuery;
          end;
//-->> 6. Учитывать настройку удаленных устройств
        dsFIB.Close;
        dsFIB.SQLs.SelectSQL.Clear;
        dsFIB.SQLs.SelectSQL.Text := ' SELECT FC_VALUE FROM PARAMS WHERE FC_SECTION = ''SERVER'' AND FC_KEY = ''IS_DEVICES_CHECK'' ';
        qFIB.SQL.Clear;
        dsFIB.Open;
        if dsFIB.RecordCount > 0 then
          begin
            qFIB.SQL.Text := ' UPDATE PARAMS SET FC_VALUE = :FC_VALUE WHERE FC_SECTION = ''SERVER'' AND FC_KEY = ''IS_DEVICES_CHECK'' ';
            qFIB.ParamByName('FC_VALUE').AsString := IntToStr(isDevices);
            qFIB.ExecQuery;
          end else
          begin
            qFIB.SQL.Text := ' INSERT INTO PARAMS(FC_SECTION, FC_KEY, FC_VALUE) VALUES(''SERVER'', ''IS_DEVICES_CHECK'', :FC_VALUE) ';
            qFIB.ParamByName('FC_VALUE').AsString := IntToStr(isDevices);
            qFIB.ExecQuery;
          end;
        finally
          dsFIB.Free;
          qFIB.Free;
        end;
      end;
end;

procedure TfrmMain.DoShowMainForm;
var Reg : TRegIniFile;
begin
  Reg:=TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    sPort := Reg.ReadString('\Software\Softmaster\DicomServer', 'SERVER_PORT', '');
    sTitle := Reg.ReadString('\Software\Softmaster\DicomServer', 'AE_TITLE', '');
    sDir := Reg.ReadString('\Software\Softmaster\DicomServer', 'STORAGE_FOLDER', '');
    sDirRemote := Reg.ReadString('\Software\Softmaster\DicomServer', 'REMOTE_STORAGE_FOLDER', '');
    nDaysArchive := Reg.ReadInteger('\Software\Softmaster\DicomServer', 'DAYS_FOR_ARCHIVE', 0);
    if nDaysArchive = 0 then
      nDaysArchive := 30;
    case Reg.ReadInteger('\Software\Softmaster\DicomServer', 'IS_DEVICES_CHECK', 0) of
    0: isDevices := 0;
    1: isDevices := 1;
    end; 
  finally
    Reg.Free;
  end;
  TVLOGS.StoreToRegistry('\SoftWare\SoftMaster\DicomServer\cxGrDefault', TRUE, [], 'cxGr');
  TVLOGS.RestoreFromRegistry('\SoftWare\SoftMaster\DicomServer\cxGr', FALSE, FALSE, [], 'cxGr');
end;

procedure TfrmMain.dsLogsAfterScroll(DataSet: TDataSet);
begin
  memLog.Lines.Text := dsLogs.FieldByName('FC_REMARK').AsString;
end;

procedure TfrmMain.dsLogsBeforeOpen(DataSet: TDataSet);
begin
  dsLogs.ParamByName('PDATE').AsDateTime := deDate.Date;
end;

procedure TfrmMain.dsLogsDatesAfterScroll(DataSet: TDataSet);
begin
  memLog.Lines.Text := dsLogsDates.FieldByName('FC_REMARK').AsString; 
end;

procedure TfrmMain.dsLogsDatesBeforeOpen(DataSet: TDataSet);
begin
  dsLogsDates.ParamByName('FD_DATE1').AsDateTime := dBegin;
  dsLogsDates.ParamByName('FD_DATE2').AsDateTime := dEnd;
end;

procedure TfrmMain.cxImage1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shServer.Pen.Style := psSolid;
  shJournal.Pen.Style := psClear;
  shBD.Pen.Style := psClear;
end;

procedure TfrmMain.cxImage2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shBD.Pen.Style := psSolid;
end;

procedure TfrmMain.cxImage3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shJournal.Pen.Style := psSolid;
end;

procedure TfrmMain.lbArchiveClick(Sender: TObject);
var qFIB : TpFIBQuery;
    dsFIB : TpFIBDataSet;
begin
  if isConnected = True then
    begin
      Application.CreateForm(TfrmArchive, frmArchive);
      try
        frmArchive.DoShowForm;
        frmArchive.ShowModal;
        if frmArchive.ModalResult = mrOk then
          begin
            dsFIB := TpFIBDataSet.Create(nil);
            qFIB := TpFIBQuery.Create(nil);
            try
              dsFIB.Database := DB;
              dsFIB.Transaction := trWrite;
              dsFIB.AutoCommit := True;
              qFIB.Close;
              qFIB.Database := DB;
              if trWrite.Active = False then
                trWrite.Active := True;
              qFIB.Transaction := trWrite;
              qFIB.Options := qFIB.Options + [qoAutoCommit];
              qFIB.SQL.Clear;
              dsFIB.SQLs.SelectSQL.Clear;
              dsFIB.SQLs.SelectSQL.Text := ' SELECT FC_VALUE FROM PARAMS WHERE FC_SECTION = ''ARCHIVE'' AND FC_KEY = ''TYPE'' ';
              dsFIB.Open;
              if dsFIB.RecordCount > 0 then
                begin
                  qFIB.SQL.Text := ' UPDATE PARAMS SET FC_VALUE = :FC_VALUE WHERE FC_SECTION = ''ARCHIVE'' AND FC_KEY = ''TYPE'' ';
                  if frmArchive.rbHand.Checked = True then
                    qFIB.ParamByName('FC_VALUE').AsString := '1' // ручной метод архивирования
                  else
                    qFIB.ParamByName('FC_VALUE').AsString := '2'; // автоматический метод архивирования
                  qFIB.ExecQuery;
                end else
                begin
                  qFIB.SQL.Text := ' INSERT INTO PARAMS(FC_SECTION, FC_KEY, FC_VALUE) VALUES(''ARCHIVE'', ''TYPE'', :FC_VALUE) ';
                  if frmArchive.rbHand.Checked = True then
                    qFIB.ParamByName('FC_VALUE').AsString := '1' // ручной метод архивирования
                  else
                    qFIB.ParamByName('FC_VALUE').AsString := '2'; // автоматический метод архивирования
                  qFIB.ExecQuery;
                end;
            finally
              dsFIB.Free;
              qFIB.Free;
            end;
          end;
      finally
        frmArchive.Free;
      end;
    end else
    begin
      Application.MessageBox('Внимание!'+#13+
                             'Невозможно архивировать изображения! База данных не подключена!',
                             'Предупреждение',
                             MB_ICONWARNING + MB_OK);
    end;
end;

procedure TfrmMain.lbArchiveMouseLeave(Sender: TObject);
begin
  lbArchive.Style.Font.Style := lbArchive.Style.Font.Style - [fsUnderline];
end;

procedure TfrmMain.lbArchiveMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  shServer.Pen.Style := psSolid;
  lbArchive.Style.Font.Style := lbArchive.Style.Font.Style + [fsUnderline];

  shJournal.Pen.Style := psClear;
  shBD.Pen.Style := psClear;
end;

procedure TfrmMain.lbCopyClick(Sender: TObject);
begin
  if isConnected = True then
    begin
      Application.CreateForm(TfrmCopy, frmCopy);
      try
        frmCopy.ShowModal;
      finally
        frmCopy.Free;
      end;
    end else
    begin
      Application.MessageBox('Внимание!'+#13+
                             'Невозможно сделать резервную копию базы данных! База данных не подключена!',
                             'Предупреждение',
                             MB_ICONWARNING + MB_OK);
    end;
end;

procedure TfrmMain.lbCopyMouseLeave(Sender: TObject);
begin
  lbCopy.Style.Font.Style := lbCopy.Style.Font.Style - [fsUnderline];
end;

procedure TfrmMain.lbCopyMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lbCopy.Style.Font.Style := lbCopy.Style.Font.Style + [fsUnderline];
end;

procedure TfrmMain.lBeginMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shJournal.Pen.Style := psSolid;
end;

procedure TfrmMain.lConnectClick(Sender: TObject);
begin
  if isConnected = False then
    begin
      try
        if DB.Connected = False then
          begin
            DB.Connected := True;
          end;
        isConnected := True;
        if trRead.Active = False then
          trRead.Active := True; // подключаем Transaction (аналог сессии)
        if trWrite.Active = False then
          trWrite.Active := True; // подключаем Transaction (аналог сессии)
//        if dsLogs.Active = False then
//          dsLogs.Active := True;

        lStatusBD.Caption := 'подключена';

        DoQueryInsert('Подключение к Базе Данных...',
                      1,
                      Now,
                      DateTimeToStr(Now)+#13+ //???
                      'Поключение к БД прошло успешно...!');
//                      +#13+
//                      'Параметры подключения:'+#13+
//                      DB.DBParams.Text);

        sLogs.DataSet.Close;
        sLogs.DataSet.Open;
        sLogs.DataSet.Last;

        DoQueryConnect;

        imGreen.Visible := False;
        imRed.Visible := True;
        lWarnings.Caption := 'Угроза работы Dicom-сервера';
        lWarnings.Style.Font.Color := clRed;
        lWarBD.Caption := 'База данных подключена';
        lWarBD.Style.Font.Color := clGreen;
        im1_ok.Visible := True;
        im1_er.Visible := False;
        lConnectWar.Visible := False;
      except
        on e: Exception do
          begin
            lConnectWar.Visible := True;
            lStatusBD.Style.Font.Color := clRed; // !!! красный цвет не ставится! почему?
            lStatusBD.Caption := 'ошибка!';
            MessageDlg('Подключиться к Базе Данных не удалось!'+#13+#10+
                       'Возможные причины:'+#13+#10+
                       ' 1. Не запущен сервис Firebird (Firebird Server - Default Instance);'+#13+#10+
                       ' 2. Не правильно указан путь к Базе Данных.'+#13+
                       #13+
                       'Error: -->'+#13+
                       e.Message, mtWarning, [mbOK], 0);
            isConnected := False;
          end;
      end;
    end else
    begin
      ShowMessage('База Данных уже подключена!');
    end;
end;

procedure TfrmMain.lConnectMouseLeave(Sender: TObject);
begin
  lConnect.Style.Font.Style := lConnect.Style.Font.Style - [fsUnderline];
end;

procedure TfrmMain.lConnectMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lConnect.Style.Font.Style := lConnect.Style.Font.Style + [fsUnderline];
  shBD.Pen.Style := psSolid;
end;

procedure TfrmMain.lConnectWarClick(Sender: TObject);
begin
  if isConnected = False then
    begin
      try
        if DB.Connected = False then
          begin
            DB.Connected := True;
          end;
        isConnected := True;
        if trRead.Active = False then
          trRead.Active := True; // подключаем Transaction (аналог сессии)
        if trWrite.Active = False then
          trWrite.Active := True; // подключаем Transaction (аналог сессии)
//        if dsLogs.Active = False then
//          dsLogs.Active := True;

        lStatusBD.Caption := 'подключена';

        DoQueryInsert('Подключение к Базе Данных...',
                      1,
                      Now,
                      DateTimeToStr(Now)+#13+ //???
                      'Поключение к БД прошло успешно...!');
//                      +#13+
//                      'Параметры подключения:'+#13+
//                      DB.DBParams.Text);

        sLogs.DataSet.Close;
        sLogs.DataSet.Open;
        sLogs.DataSet.Last;

        DoQueryConnect;

        imGreen.Visible := False;
        imRed.Visible := True;
        lWarnings.Caption := 'Угроза работы Dicom-сервера';
        lWarnings.Style.Font.Color := clRed;
        lWarBD.Caption := 'База данных подключена';
        lWarBD.Style.Font.Color := clGreen;
        im1_ok.Visible := True;
        im1_er.Visible := False;
        lConnectWar.Visible := False;
      except
        on e: Exception do
          begin
            lStatusBD.Style.Font.Color := clRed; // !!! красный цвет не ставится! почему?
            lStatusBD.Caption := 'ошибка!';
            MessageDlg('Подключиться к Базе Данных не удалось!'+#13+#10+
                       'Возможные причины:'+#13+#10+
                       ' 1. Не запущен сервис Firebird (Firebird Server - Default Instance);'+#13+#10+
                       ' 2. Не правильно указан путь к Базе Данных.'+#13+
                       #13+
                       'Error: -->'+#13+
                       e.Message, mtWarning, [mbOK], 0);
            isConnected := False;
            lConnectWar.Visible := True;
          end;
      end;
    end else
    begin
      ShowMessage('База Данных уже подключена!');
    end;
end;

procedure TfrmMain.lConnectWarMouseLeave(Sender: TObject);
begin
  lConnectWar.Style.Font.Style := lConnectWar.Style.Font.Style - [fsUnderline];
end;

procedure TfrmMain.lConnectWarMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lConnectWar.Style.Font.Style := lConnectWar.Style.Font.Style + [fsUnderline];
end;

procedure TfrmMain.lEndMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shJournal.Pen.Style := psSolid;
end;

procedure TfrmMain.lFilterDatesMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shJournal.Pen.Style := psSolid;
end;

procedure TfrmMain.lFilterMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shJournal.Pen.Style := psSolid;
end;

procedure TfrmMain.lHeaderServerMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shServer.Pen.Style := psSolid;
  shJournal.Pen.Style := psClear;
  shBD.Pen.Style := psClear;
end;

procedure TfrmMain.lTimeServerMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shServer.Pen.Style := psSolid;
  shJournal.Pen.Style := psClear;
  shBD.Pen.Style := psClear;
end;

procedure TfrmMain.lTrayClick(Sender: TObject);
begin
  with FIconData do
    begin
      cbSize := SizeOf(FIconData);
      Wnd := Handle;
      uID := 100;
      uFlags := NIF_MESSAGE or NIF_ICON or NIF_TIP;
      uCallbackMessage := UM_TRAY;
      hIcon := Application.Icon.Handle;
      StrPCopy(szTip, Application.Title)
    end;
  Shell_NotifyIcon(NIM_ADD, @FIconData);
  frmMain.Visible := False;
end;

procedure TfrmMain.lTrayMouseLeave(Sender: TObject);
begin
  lTray.Style.Font.Style := lStart.Style.Font.Style - [fsUnderline];
end;

procedure TfrmMain.lTrayMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lTray.Style.Font.Style := lStart.Style.Font.Style + [fsUnderline];
end;

procedure TfrmMain.memBDMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shBD.Pen.Style := psSolid;
end;

procedure TfrmMain.cxLabel10MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shJournal.Pen.Style := psSolid;
end;

procedure TfrmMain.cxLabel12MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shJournal.Pen.Style := psSolid;
end;

procedure TfrmMain.cxLabel13MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shJournal.Pen.Style := psSolid;
end;

procedure TfrmMain.cxLabel14MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shJournal.Pen.Style := psSolid;
end;

procedure TfrmMain.cxLabel15MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shBD.Pen.Style := psSolid;
end;

procedure TfrmMain.cxLabel16MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shBD.Pen.Style := psSolid;
end;

procedure TfrmMain.cxLabel17MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shBD.Pen.Style := psSolid;
end;

procedure TfrmMain.cxLabel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shBD.Pen.Style := psSolid;
end;

procedure TfrmMain.cxLabel2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shServer.Pen.Style := psSolid;
  shJournal.Pen.Style := psClear;
  shBD.Pen.Style := psClear;
end;

procedure TfrmMain.cxLabel3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shJournal.Pen.Style := psSolid;
end;

procedure TfrmMain.lStatusBDMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shBD.Pen.Style := psSolid;
end;

procedure TfrmMain.lStatusServerMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shServer.Pen.Style := psSolid;
  shJournal.Pen.Style := psClear;
  shBD.Pen.Style := psClear;
end;

procedure TfrmMain.cxLabel4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shServer.Pen.Style := psSolid;
  shJournal.Pen.Style := psClear;
  shBD.Pen.Style := psClear;
end;

procedure TfrmMain.cxLabel6Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmAbout, frmAbout);
    frmAbout.ShowModal;
  finally
    frmAbout.Free;
  end;
end;

procedure TfrmMain.lStartClick(Sender: TObject);
begin
  if isConnected = True then
    begin
      aStartExecute(nil);
    end else
    begin
      Application.MessageBox('Внимание!'+#13+
                             'Невозможно запустить сервер! База данных не подключена!',
                             'Предупреждение',
                             MB_ICONWARNING + MB_OK);
    end;
end;

procedure TfrmMain.lStartMouseLeave(Sender: TObject);
begin
  lStart.Style.Font.Style := lStart.Style.Font.Style - [fsUnderline];
end;

procedure TfrmMain.lStartMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shServer.Pen.Style := psSolid;
  lStart.Style.Font.Style := lStart.Style.Font.Style + [fsUnderline];

  shJournal.Pen.Style := psClear;
  shBD.Pen.Style := psClear;
end;

procedure TfrmMain.lStartWarClick(Sender: TObject);
begin
  if isConnected = True then
    begin
      aStartExecute(nil);
    end else
    begin
      Application.MessageBox('Внимание!'+#13+
                             'Невозможно запустить сервер! База данных не подключена!',
                             'Предупреждение',
                             MB_ICONWARNING + MB_OK);
    end;
end;

procedure TfrmMain.lStartWarMouseLeave(Sender: TObject);
begin
  lStartWar.Style.Font.Style := lStartWar.Style.Font.Style - [fsUnderline];
end;

procedure TfrmMain.lStartWarMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lStartWar.Style.Font.Style := lStartWar.Style.Font.Style + [fsUnderline];
end;

procedure TfrmMain.cxLabel7MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shServer.Pen.Style := psSolid;
  shJournal.Pen.Style := psClear;
  shBD.Pen.Style := psClear;
end;

procedure TfrmMain.cxLabel8MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shJournal.Pen.Style := psSolid;
end;

procedure TfrmMain.deDatePropertiesChange(Sender: TObject);
begin
  dsLogs.Close;
  dsLogs.Open;
  dsLogs.Last;
end;

procedure TfrmMain.lParamBDClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmParamsBD, frmParamsBD);
    frmParamsBD.tePathBD.Text := memBD.Lines.Text;
    frmParamsBD.aSave.Enabled := False;
    frmParamsBD.ShowModal;
    if frmParamsBD.ModalResult = MrOK then
      begin
        if isStarted = 1 then
          DicomServer.Stop;
        if (DicomServer.IsActive = False) and (DB.Connected = True) then
          begin
            DoQueryInsert('Сервер остановлен!',
                          2,
                          Now,
                          DateTimeToStr(Now)+#13+
                          'Сервер остановлен!'+#13+
                          'Причина остановки сервера:'+#13+
                          'Изменение параметров БД!');
            sLogs.DataSet.Close;
            sLogs.DataSet.Open;
            sLogs.DataSet.Last;

            isStarted := 0;
            aStart.Enabled := True;
            lStart.Caption := 'Запуск';
            lStatusServer.Caption := 'остановлен';
            Timer1.Enabled := False;
            lTimeServer.Caption := '00:00:00';
          end;

        nType := 0; // сбрасываем фильтры
        if dsLogs.Filtered = True then
          dsLogs.Filtered := False;
        dsLogs.Filter := '';
        lFilter.Caption := 'все события';
        if isDates <> 0 then
          begin
            isDates := 0;
            cxLabel13.Visible := False;
            cxLabel14.Visible := False;
            lBegin.Visible := False;
            lEnd.Visible := False;
            lFilterDates.Caption := 'не установлен';
            sLogs.DataSet := dsLogs;
          end;

        if DB.Connected = True then
          DB.Connected := False;
        isConnected := False;
        lStatusBD.Caption := 'не подключена';
        DB.DatabaseName := frmParamsBD.tePathBD.Text;
        memBD.Lines.Text := frmParamsBD.tePathBD.Text;
        memLog.Lines.Text := '';

        imGreen.Visible := False;
        imRed.Visible := True;
        lWarnings.Caption := 'Угроза работы Dicom-сервера';
        lWarnings.Style.Font.Color := clRed;
        im1_ok.Visible := False;
        im1_er.Visible := True;
        im2_ok.Visible := False;
        im2_er.Visible := True;
        lWarBD.Caption := 'База Данных не подключена';
        lWarBD.Style.Font.Color := clRed;
        lWarServer.Caption := 'Сервер не запущен';
        lWarServer.Style.Font.Color := clRed;
        paWar.FlatBorderColor := clRed;
        lConnectWar.Visible := True;
        lStartWar.Visible := True;
      end;
  finally
    frmParamsBD.Free;
  end;
end;

procedure TfrmMain.lParamBDMouseLeave(Sender: TObject);
begin
  lParamBD.Style.Font.Style := lConnect.Style.Font.Style - [fsUnderline];
end;

procedure TfrmMain.lParamBDMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lParamBD.Style.Font.Style := lConnect.Style.Font.Style + [fsUnderline];
  shBD.Pen.Style := psSolid;
end;

procedure TfrmMain.lParamsClick(Sender: TObject);
begin
  if isConnected = True then
    begin
      aParamExecute(nil);
    end else
    begin
      Application.MessageBox('Внимание!'+#13+
                             'Невозможно настроить сервер! База данных не подключена!',
                             'Предупреждение',
                             MB_ICONWARNING + MB_OK);
    end;
end;

procedure TfrmMain.lParamsJournalClick(Sender: TObject);
begin
if isConnected = True then
  begin
  try
    Application.CreateForm(TfrmFilter, frmFilter);
    case nType of
    0 : frmFilter.rbAll.Checked := True;
    1 : frmFilter.rbStart.Checked := True;
    2 : frmFilter.rbStop.Checked := True;
    3 : frmFilter.rbError.Checked := True;
    4 : frmFilter.rbEvents.Checked := True;
    5 : frmFilter.rbParamEdit.Checked := True;
    end;

    frmFilter.cbDate.EditValue := isDates;
    if isDates = 1 then
      begin
        frmFilter.deBegin.Date := dBegin;
        frmFilter.deEnd.Date := dEnd;
      end;

    frmFilter.ShowModal;
    if frmFilter.ModalResult = mrOk then
      begin
        if frmFilter.rbAll.Checked then
          begin
            nType := 0;
            if dsLogs.Filtered = True then
              dsLogs.Filtered := False;
            dsLogs.Filter := '';
            lFilter.Caption := 'все события';
          end;
        if frmFilter.rbStart.Checked then
          begin
            nType := 1;
            dsLogs.Filter := 'FN_TYPE = '+IntToStr(nType);
            dsLogs.Filtered := True;
            lFilter.Caption := 'запуски сервера';
          end;
        if frmFilter.rbStop.Checked then
          begin
            nType := 2;
            dsLogs.Filter := 'FN_TYPE = '+IntToStr(nType);
            dsLogs.Filtered := True;
            lFilter.Caption := 'остановки сервера';
          end;
        if frmFilter.rbError.Checked then
          begin
            nType := 3;
            dsLogs.Filter := 'FN_TYPE = '+IntToStr(nType);
            dsLogs.Filtered := True;
            lFilter.Caption := 'ошибки';
          end;
        if frmFilter.rbEvents.Checked then
          begin
            nType := 4;
            dsLogs.Filter := 'FN_TYPE = '+IntToStr(nType);
            dsLogs.Filtered := True;
            lFilter.Caption := 'обработанные события';
          end;
        if frmFilter.rbParamEdit.Checked then
          begin
            nType := 5;
            dsLogs.Filter := 'FN_TYPE = '+IntToStr(nType);
            dsLogs.Filtered := True;
            lFilter.Caption := 'изменения параметров';
          end;

        if frmFilter.cbDate.Checked = True then
          begin
            isDates := 1;
            cxLabel19.Visible := False;
            deDate.Visible := False;
            cxLabel13.Visible := True;
            cxLabel14.Visible := True;
            lBegin.Visible := True;
            lEnd.Visible := True;
            lBegin.Caption := frmFilter.deBegin.Text;
            lEnd.Caption := frmFilter.deEnd.Text;
            lFilterDates.Caption := 'включён';
            dBegin := frmFilter.deBegin.Date;
            dEnd := StrToDateTime(FormatDateTime('dd.mm.yyyy', frmFilter.deEnd.Date)+' 23:59:59');
            sLogs.DataSet := dsLogsDates;
            dsLogsDates.Close;
            dsLogsDates.Open;
            if nType <> 0 then
              begin
                dsLogsDates.Filter := 'FN_TYPE = '+IntToStr(nType); // !!! если ничего не выбирает то выдает ошибку
                dsLogsDates.Filtered := True;
              end else
              begin
                nType := 0;
                if dsLogs.Filtered = True then
                  dsLogs.Filtered := False;
                dsLogs.Filter := '';
                lFilter.Caption := 'все события';
              end;
          end else
          begin
            isDates := 0;
            cxLabel19.Visible := True;
            deDate.Visible := True;
            cxLabel13.Visible := False;
            cxLabel14.Visible := False;
            lBegin.Visible := False;
            lEnd.Visible := False;
            lFilterDates.Caption := 'не установлен';
            sLogs.DataSet := dsLogs;
            dsLogs.Close;
            dsLogs.Open;
            if nType <> 0 then
              begin
                dsLogs.Filter := 'FN_TYPE = '+IntToStr(nType);
                dsLogs.Filtered := True;
              end else
              begin
                nType := 0;
                if dsLogs.Filtered = True then
                  dsLogs.Filtered := False;
                dsLogs.Filter := '';
                lFilter.Caption := 'все события';
              end;
          end;
      end;
  finally
    frmFilter.Free;
  end;
  end else
  begin
    Application.MessageBox('Внимание!'+#13+
                             'Невозможно отфильтровать журнал! База данных не подключена!',
                             'Предупреждение',
                             MB_ICONWARNING + MB_OK);
  end;
end;

procedure TfrmMain.lParamsJournalMouseLeave(Sender: TObject);
begin
  lParamsJournal.Style.Font.Style := lStart.Style.Font.Style - [fsUnderline];
end;

procedure TfrmMain.lParamsJournalMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  shJournal.Pen.Style := psSolid;
  lParamsJournal.Style.Font.Style := lStart.Style.Font.Style + [fsUnderline];
end;

procedure TfrmMain.lParamsMouseLeave(Sender: TObject);
begin
  lParams.Style.Font.Style := lTimeServer.Style.Font.Style - [fsUnderline];
end;

procedure TfrmMain.lParamsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  shServer.Pen.Style := psSolid;
  lParams.Style.Font.Style := lTimeServer.Style.Font.Style + [fsUnderline];

  shJournal.Pen.Style := psClear;
  shBD.Pen.Style := psClear;
end;

procedure TfrmMain.lPrintClick(Sender: TObject);
begin
  if isConnected = True then
    begin
      aPrintExecute(nil);
    end else
    begin
      Application.MessageBox('Внимание!'+#13+
                             'Невозможно распечатать журнал! База данных не подключена!',
                             'Предупреждение',
                             MB_ICONWARNING + MB_OK);
    end;
end;

procedure TfrmMain.lPrintMouseLeave(Sender: TObject);
begin
  lPrint.Style.Font.Style := lTimeServer.Style.Font.Style - [fsUnderline];
end;

procedure TfrmMain.lPrintMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shJournal.Pen.Style := psSolid;
  lPrint.Style.Font.Style := lTimeServer.Style.Font.Style + [fsUnderline];
end;

procedure TfrmMain.lRefreshClick(Sender: TObject);
begin
  if isConnected = True then
    begin
      aRefreshExecute(nil);
    end else
    begin
      Application.MessageBox('Внимание!'+#13+
                             'Невозможно обновить журнал! База данных не подключена!',
                             'Предупреждение',
                             MB_ICONWARNING + MB_OK);
    end;
end;

procedure TfrmMain.lRefreshMouseLeave(Sender: TObject);
begin
  lRefresh.Style.Font.Style := lTimeServer.Style.Font.Style - [fsUnderline];
end;

procedure TfrmMain.lRefreshMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shJournal.Pen.Style := psSolid;
  lRefresh.Style.Font.Style := lTimeServer.Style.Font.Style + [fsUnderline];
end;

procedure TfrmMain.ExecSQL(asql: string);
var
  d1: TQuery;
begin
  d1 := TQuery.Create(nil);
  try
    d1.DatabaseName := 'CNSPACS';
    d1.SQL.Text := asql;
    memLog.Lines.Add(asql);
    try
      d1.ExecSQL;
    except
      on e: Exception do
      begin
        memLog.Lines.Add(e.Message);
      end;
    end;
  finally
    d1.Free;
//    d1 := nil; // Prihodko N.
  end;
end;

function TfrmMain.GetAge(AD1, AD2: TDatetime): string;
var
  y, m, d, y1, m1, d1: word;
begin
  DecodeDate(ad1, y, m, d);
  DecodeDate(ad2, y1, m1, d1);
  Result := Format('%3dY', [(y1 - y)]);
  for d := 1 to 3 do
    if Result[d] = ' ' then
      Result[d] := '0'
end;

//function TfrmMain.GetDirSize(path: string): Integer;
//var
//  sr: TSearchRec;
//  res: Integer;
//begin
//  if Copy(path, Length(path), 1) = '\' then
//    res := FindFirst(Path+'*.*', faAnyFile or faDirectory, sr)
//  else
//    res := FindFirst(Path, faAnyFile or faDirectory, sr);
//  result := 0;
//  while res = 0 do
//    begin
//      if ((sr.Attr and faDirectory) = faDirectory) and (sr.Name <> '.') and (sr.Name <> '..') then
//        result := result + GetDirSize(Path+sr.Name+'\')
//      else
//        result := result + (sr.FindData.nFileSizeHigh * MAXDWORD) + sr.FindData.nFileSizeLow;
//      res := FindNext(sr);
//    end;
//  FindClose(sr);
//end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TVLOGS.StoreToRegistry('\SoftWare\SoftMaster\DicomServer\cxGr', TRUE, [], 'cxGr');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var Ver : TJclFileVersionInfo;
begin
  deDate.Properties.OnChange := nil;
  deDate.Date := Date;
  deDate.Properties.OnChange := deDatePropertiesChange;
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    frmMain.Caption := 'Dicom-сервер  '+Ver.FileVersion;
    shServer.Pen.Style := psClear;
    shBD.Pen.Style := psClear;
    shJournal.Pen.Style := psClear;
    nType := 0;
    lFilter.Caption := 'все события';

    lFilterDates.Caption := 'не установлен';
    lBegin.Visible := False;
    lEnd.Visible := False;
    cxLabel14.Visible := False;
    cxLabel13.Visible := False;
    if DB.Connected = False then
      begin
        try
//          DB.DBName := '192.168.1.233:PACSBASE';
          DB.DBName := ExtractFilePath(Application.ExeName) + 'PACSDB.GDB';
          DB.Connected := True; // подключаемся к БД
          isConnected := True;
        except
          on e:Exception do
            begin
              lStatusBD.Style.Font.Color := clRed; // !!! красный цвет не ставится! почему?
              lStatusBD.Caption := 'ошибка!';
              memBD.Lines.Text := '--';
              MessageDlg('Подключиться к Базе Данных не удалось!'+#13+#10+
                         'Возможные причины:'+#13+#10+
                         ' 1. Не запущен сервис Firebird (Firebird Server - Default Instance);'+#13+#10+
                         ' 2. Не правильно указан путь к Базе Данных.'+#13+
                         #13+
                         'Error: -->'+#13+
                         e.Message, mtWarning, [mbOK], 0);
              isConnected := False;
              imGreen.Visible := False;
              imRed.Visible := True;
              lWarnings.Caption := 'Угроза работы Dicom-сервера';
              lWarnings.Style.Font.Color := clRed;
              lWarBD.Caption := 'База данных не подключена';
              lWarBD.Style.Font.Color := clRed;
              im1_ok.Visible := False;
              im1_er.Visible := True;
              im2_ok.Visible := False;
              im2_er.Visible := True;
              lWarServer.Caption := 'Сервер не запущен';
              lWarServer.Style.Font.Color := clRed;
              paWar.FlatBorderColor := clRed;
              lConnectWar.Visible := True;
              lStartWar.Visible := False;
              Exit;
            end;
        end;
      end;
    if trRead.Active = False then
      begin
        trRead.Active := True; // подключаем Transaction (аналог сессии)
      end;
    if trWrite.Active = False then
      begin
        trWrite.Active := True; // подключаем Transaction (аналог сессии)
      end;

//    if dsLogs.Active = False then
//      dsLogs.Active := True;

    lStatusBD.Caption := 'подключена';
    memBD.Lines.Text := ExtractFilePath(Application.ExeName) + 'PACSDB.GDB';
    isConnected := True;
    DoQueryInsert('Подключение к Базе Данных...',
                  1,
                  Now,
                  DateTimeToStr(Now)+#13+ //???
                  'Поключение к БД прошло успешно...!');
    deDate.Date := Date;
//    dsLogs.Close;
//    dsLogs.Open;
//    dsLogs.Last;
    if isConnected = True then
      begin
        imGreen.Visible := False;
        imRed.Visible := True;
        lWarnings.Caption := 'Угроза работы Dicom-сервера';
        lWarnings.Style.Font.Color := clRed;
        lWarBD.Caption := 'База данных подключена';
        lWarBD.Style.Font.Color := clGreen;
        lConnectWar.Visible := False;
        im1_ok.Visible := True;
        im1_er.Visible := False;
        im2_ok.Visible := False;
        im2_er.Visible := True;
        lWarServer.Caption := 'Сервер не запущен';
        lWarServer.Style.Font.Color := clRed;
        lStartWar.Visible := True;
        paWar.FlatBorderColor := clRed;
      end else
      begin
        imGreen.Visible := False;
        imRed.Visible := True;
        lWarnings.Caption := 'Угроза работы Dicom-сервера';
        lWarnings.Style.Font.Color := clRed;
        lWarBD.Caption := 'База данных не подключена';
        lWarBD.Style.Font.Color := clRed;
        lConnectWar.Visible := True;
        im1_ok.Visible := False;
        im1_er.Visible := True;
        im2_ok.Visible := False;
        im2_er.Visible := True;
        lWarServer.Caption := 'Сервер не запущен';
        lWarServer.Style.Font.Color := clRed;
        lStartWar.Visible := False;
        paWar.FlatBorderColor := clRed;
      end;
  finally
    Ver.Free;
  end;
end;

procedure TfrmMain.frxRepGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'DATESYS' then Value := FormatDateTime('dd.mm.yyyy hh:mm', Now); 
end;

procedure TfrmMain.N3Click(Sender: TObject);
begin
  TVLOGS.RestoreFromRegistry('\SoftWare\SoftMaster\DicomServer\cxGrDefault', FALSE, FALSE, [], 'cxGr');
end;

procedure TfrmMain.shServerMouseLeave(Sender: TObject);
begin
  shServer.Pen.Style := psClear;
end;

procedure TfrmMain.shServerMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shServer.Pen.Style := psSolid;
  shJournal.Pen.Style := psClear;
  shBD.Pen.Style := psClear;
end;

procedure TfrmMain.shBDMouseLeave(Sender: TObject);
begin
  shBD.Pen.Style := psClear;
end;

procedure TfrmMain.shBDMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shBD.Pen.Style := psSolid;
  shJournal.Pen.Style := psClear;
  shServer.Pen.Style := psClear;
end;

procedure TfrmMain.shJournalMouseLeave(Sender: TObject);
begin
  shJournal.Pen.Style := psClear;
end;

procedure TfrmMain.shJournalMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  shJournal.Pen.Style := psSolid;
  shServer.Pen.Style := psClear;
  shBD.Pen.Style := psClear;
end;

procedure TfrmMain.SumitSQL(AClientThread: TDicomClientThread; ADBStr,
  ASQL: string; AFetchCount: Integer; UseMultiDatabase: Boolean;
  Params: TDicomAttribute; var AResult: TDataSet);
var dsSel: TpFIBDataSet;
    i: integer;
    param1: TParam;
    das : TDicomAttributes;
    da1 : TDicomAttribute;
    str1: string;
//    AQuery : TQuery;
begin
  dsSel := TpFIBDataSet.Create(nil);
    dsSel.Database := DB;
    dsSel.Transaction := trRead;
    try
      dsSel.SQLs.SelectSQL.Clear;
      dsSel.SQLs.SelectSQL.Add(ASQL);
      if Params <> nil then
        for i := 0 to Params.GetCount - 1 do      // !!! Prihodko N.
          begin
            das := Params.Attributes[i];
            str1 := das.GetString($2809, $28);
            param1 := TParam(dsSel.Params.FindParam(str1));
            if param1 <> nil then
              case das.getInteger($2809, $29) of
                0:
                  begin
                    param1.AsString := das.GetString($2809, $23);
                  end;
                1:
                  begin
                    da1 := das.Item[$2809, $20];
                    if assigned(da1) then
                      param1.AsInteger := da1.asInteger[0]
                    else
                      param1.AsInteger := 0;
                  end;
                2:
                  begin
                    da1 := das.Item[$2809, $21];
                    if assigned(da1) then
                      param1.AsFloat := da1.AsFloat[0]
                    else
                      param1.AsFloat := 0;
                  end;
                3:
                  begin
                    da1 := das.Item[$2809, $25];
                    if assigned(da1) then
                      begin
                        try
                          if str1 = 'CK_DATE2' then
                            dsSel.ParamByName(str1).AsDateTime := StrToDateTime(FormatDateTime('dd.mm.yyyy', da1.AsDatetime[0])+' 23:59:59')
                          else
                            dsSel.ParamByName(str1).AsDateTime := da1.AsDatetime[0];
                        except
                        end;
                      end else
                      begin
                        param1.AsDatetime := now;
                      end;
                  end;
                4:
                  begin
                    param1.AsMemo := das.GetString($2809, $23);
                  end;
              end;
          end;
//  showmessage(dsSel.SQLs.SelectSQL.Text);
    dsSel.Open;
    except
      on e: Exception do
        begin
          DoQueryInsert('Ошибка! Не удалось выполнить запрос!',
                        3,
                        Now,
                        DateTimeToStr(Now)+#13+
                        'FailToOpenQuery' + e.Message + '/' + e.ClassName + ':' + ASQL);
          dsSel.Close;
          FreeAndNil(dsSel);
        raise;
        end;
    end;
    AResult := dsSel;
end;

function TfrmMain.TestDcmFileDir(AQuery: TDataset; var AImageDir: string): Boolean;
function TestDir(ADir: string; ADate: TDatetime; ImageType: string): Boolean;
  var y, m, d: Word;
      str1: string;
  begin
    DecodeDate(adate, y, m, d);
    Result := false;
    if ADir[Length(ADir)] <> '\' then
      adir := adir + '\';
    if ImageType <> '' then
    begin
      str1 := adir + ImageType + '\' + IntToStr(y) + '\' + IntToStr(m) + '\' + IntToStr(d) + '\' +
        Trim(AQuery.FieldByName('STUDYUID').AsString) + '\';
    end
    else
    begin
      str1 := adir + Trim(AQuery.FieldByName('STUDYUID').AsString) + '\';
    end;
    if DirectoryExists(str1) then
    begin
      AImageDir := str1;
      Result := true;
    end
    else
    begin
      str1 := adir + Trim(AQuery.FieldByName('STUDYUID').AsString) + '\';
      if DirectoryExists(str1) then
      begin
        AImageDir := str1;
        Result := true;
      end;
    end;
  end;
var
  date1: TDatetime;
  ImageType: string;
  f1: TField;
begin
  f1 := AQuery.FindField('STUDIESDATE');
  if not assigned(f1) then
    f1 := AQuery.FindField('IMAGEDATE');

  date1 := f1.AsDatetime;
  ImageType := Trim(AQuery.FieldByName('IMAGETYPE').AsString);
  Result := TestDir(sDir, date1, ImageType);
  if Result then
    exit;
end;

function TfrmMain.TestDcmFileDir_RemoteDir(AQuery: TDataset; var AImageDir: string): Boolean;
function TestDir(ADir: string; ADate: TDatetime; ImageType: string): Boolean;
  var y, m, d: Word;
      str1: string;
  begin
    DecodeDate(adate, y, m, d);
    Result := false;
    if ADir[Length(ADir)] <> '\' then
      adir := adir + '\';
    if ImageType <> '' then
    begin
      str1 := adir + ImageType + '\' + IntToStr(y) + '\' + IntToStr(m) + '\' + IntToStr(d) + '\' +
        Trim(AQuery.FieldByName('STUDYUID').AsString) + '\';
    end
    else
    begin
      str1 := adir + Trim(AQuery.FieldByName('STUDYUID').AsString) + '\';
    end;
    if DirectoryExists(str1) then
    begin
      AImageDir := str1;
      Result := true;
    end
    else
    begin
      str1 := adir + Trim(AQuery.FieldByName('STUDYUID').AsString) + '\';
      if DirectoryExists(str1) then
      begin
        AImageDir := str1;
        Result := true;
      end;
    end;
  end;
var
  date1: TDatetime;
  ImageType: string;
  f1: TField;
begin
  f1 := AQuery.FindField('STUDIESDATE');
  if not assigned(f1) then
    f1 := AQuery.FindField('IMAGEDATE');

  date1 := f1.AsDatetime;
  ImageType := Trim(AQuery.FieldByName('IMAGETYPE').AsString);
  Result := TestDir(sDirRemote, date1, ImageType);
  if Result then
    exit;
end;

function TfrmMain.TestFile(Query1: TDataset; basedir: string): string;
var pname: string;
begin
  pName := BaseDir + Trim(Query1.FieldByName('SERIESUID').AsString) + '\' +
    Trim(Query1.FieldByName('IMGNO').asstring) + '.dcm';
  if FileExists(pname) then
    begin
      Result := pName;
    end else
    begin
      pName := BaseDir + Trim(Query1.FieldByName('SERIESUID').AsString) + '\' +
      Trim(Query1.FieldByName('INSTANCEUID').asstring) + '.dcm';
      if FileExists(pname) then
        begin
          Result := pname;
        end else
        begin
          pName := BaseDir + ' ' + Trim(Query1.FieldByName('SERIESUID').AsString) + '\' +
          Trim(Query1.FieldByName('IMGNO').asstring) + '.dcm';
          if FileExists(pname) then
            Result := pname
          else
            Result := '';
        end;
    end;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  lTimeServer.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  lTimeServer.Refresh;
end;

function TfrmMain.TranslitEng(s: string): string;
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

procedure TfrmMain.WndProc(var Message: TMessage);
begin
  case Message.Msg of
    WM_SYSCOMMAND:
      if TWMSysCommand(Message).CmdType and $FFF0 = SC_MINIMIZE then
        begin
          Shell_NotifyIcon(NIM_ADD, @FIconData);
          Application.MainForm.Visible := False
        end else inherited;
    UM_TRAY:
      if Message.LParam = WM_LBUTTONDBLCLK then
        begin
          Application.MainForm.Visible := True;
          ShowWindow(Application.Handle, SW_HIDE);
          Shell_NotifyIcon(NIM_DELETE, @FIconData)
        end;
   else inherited
 end;
end;

end.
