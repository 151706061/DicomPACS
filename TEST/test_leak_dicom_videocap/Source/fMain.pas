unit fMain;

interface

uses
  FastMM4, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DCM_Client, DCM_Attributes, ComCtrls, StdCtrls, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxControls, cxContainer, cxEdit, cxLabel, cxGroupBox, Menus,
  cxLookAndFeelPainters, cxButtons, ExtCtrls, ActnList, Registry, cxSplitter,
  cxGraphics, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, dxmdaset,
  dxSkinsdxBarPainter, ImgList, dxBar, cxGridExportLink, frxClass, frxDBSet,
  cxCheckBox, DateUtils, dxSkinOffice2007Green,
  KXString, KXServerCore, DCM_Server, DCM_Connection, dxSkinBlack, 
  dxBarExtItems, dxSkinOffice2007Black, IniFiles, Medotrade, cxPC;

type
  TfrmMain = class(TForm)
    AL: TActionList;
    aClose: TAction;
    dxMemData1: TdxMemData;
    dxMemData1Patient: TStringField;
    dxMemData1Number: TStringField;
    dxMemData1Date: TDateField;
    dxBarDockControl1: TdxBarDockControl;
    IL: TImageList;
    aPrint: TAction;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    N4: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    Excel1: TMenuItem;
    sdPopUp: TSaveDialog;
    frxRep: TfrxReport;
    frxDB: TfrxDBDataset;
    dxMemData1StudyID: TStringField;
    dxMemData1AcNumber: TStringField;
    dxMemData1Modality: TStringField;
    dxMemData1Desc: TStringField;
    dxMemData1STUDYUID: TStringField;
    dxMemData1SERIESUID: TStringField;
    DicomServerCore1: TDicomServerCore;
    actMAH1: TAction;
    Panel3: TPanel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxFld_P_ENAME: TcxGridDBColumn;
    cxFld_P_DATEBORN: TcxGridDBColumn;
    cxFld_Modality: TcxGridDBColumn;
    cxFld_StationAETitle: TcxGridDBColumn;
    cxFld_StartDateWorklist: TcxGridDBColumn;
    cxFld_StepStartTime: TcxGridDBColumn;
    cxFld_StudyUID: TcxGridDBColumn;
    cxFld_P_PID: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    cxGroupBox6: TcxGroupBox;
    cxLabel22: TcxLabel;
    deStartDateWorklist: TcxDateEdit;
    cxLabel23: TcxLabel;
    deEndDateWorklist: TcxDateEdit;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarManager1Bar2: TdxBar;
    dxBarButton1: TdxBarButton;
    aDispWorklist: TAction;
    aRefreshWorklist: TAction;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    aAbout: TAction;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    aNastr: TAction;
    dsWLnew: TDataSource;
    mdWorklist: TdxMemData;
    mdWorklistP_ENAME: TStringField;
    mdWorklistP_SEX: TStringField;
    mdWorklistP_PID: TStringField;
    mdWorklistP_DATEBORN: TDateTimeField;
    mdWorklistSTUDYUID: TStringField;
    mdWorklistModality: TStringField;
    mdWorklistStartDateWorklist: TStringField;
    mdWorklistEndDateWorklist: TStringField;
    mdWorklistStepStartTime: TStringField;
    mdWorklistStepFinishTime: TStringField;
    mdWorklistPhysiciansName: TStringField;
    mdWorklistStepDescription: TStringField;
    mdWorklistStepID: TStringField;
    mdWorklistStationName: TStringField;
    mdWorklistProcedureID: TStringField;
    mdWorklistProcDescription: TStringField;
    mdWorklistProcPriority: TStringField;
    mdWorklistStationAETitle: TStringField;
    mdWorklistACCESSIONNUMBER: TStringField;
    mdWorklistSTATUS: TStringField;
    aChangeStatusWorklist: TAction;
    dxBarButton61: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    aNewIssl: TAction;
    aDoIssl: TAction;
    cxFld_ProcDescription: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure cxSplitter1BeforeOpen(Sender: TObject; var NewSize: Integer;
      var AllowOpen: Boolean);
    procedure TVCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure frxRepGetValue(const VarName: string; var Value: Variant);
    procedure N3Click(Sender: TObject);
    procedure teSotrClick(Sender: TObject);
    procedure teSotrEnter(Sender: TObject);
    procedure teFamClick(Sender: TObject);
    procedure teFamEnter(Sender: TObject);
    procedure DicomServerCore1DicomImage(AClientThread: TDicomClientThread;
      AAddress: string; ADataset: TDicomDataset);
    procedure aRefreshWorklistExecute(Sender: TObject);
    procedure aDispWorklistExecute(Sender: TObject);
    procedure aAboutExecute(Sender: TObject);
    procedure aNastrExecute(Sender: TObject);
    procedure aChangeStatusWorklistExecute(Sender: TObject);
    procedure aDoIsslExecute(Sender: TObject);
    procedure aNewIsslExecute(Sender: TObject);
  private
    nDates : Integer;
    Russian : HKL; // для переключения раскладки
    procedure CheckEnabledButtons;
    procedure DoIssl ( p_is_new : boolean);
    procedure pRegCrtPart;
  public
    sUser : string;
    sCallingAETitle,
    sCalledAETitle : string;
    MWLReceiveDatasets: TList;
  end;

var
  frmMain: TfrmMain;
  v_debug : boolean; // признак отладки
  v_hkKadr,
  v_hkStartVideo,
  v_hkStopVideo   : Word;
  s_hkKadr,
  s_hkStartVideo,
  s_hkStopVideo   : string;

  v_ds_i:Integer;

  v_teHost      : string ;  // Сервер:
  v_tePort      : string ;  // Порт QUERY:
  v_tePortStore : string ;  // Порт STORE:
  v_teCalled    : string ;  // Called AE Title:
  v_teCalling   : string ;  // Calling AE Title:
  v_teLocalPort : string ;  // Локальный порт:

  v_teWLCalled ,
  v_teWLHost   ,
  v_teWLPort   ,
  v_teWLCalling  : string ;

  v_teModality,
  v_tePhysiciansName,
  v_teStationName,
  v_teProcDescription : string;

 // v_cbCleanData,
  v_cbCheckedImages,
  v_cbShNastr,

  v_cbSaveRazmer,
  v_cbAutoSend,
  v_cbCloseFormSnd,
  v_cbNotShowMsg  : Boolean;

  vCapFrmHeight,
  vCapFrmWidth    : Integer;

  v_cbVModes_list ,
  v_lbDialogs_list : TStringList;

const v_is_ds_log = True;
      v_is_log    = True;
      c_delim = '-------------------------------------------------------------------------------';
      c_ini_file = 'querylist.ini';
      c_mn_log_file = 'dcmevents.log';
      c_events_log = 'events.log';

      c_rzd = 'MAIN';
      c_section_is_debug = 'DEBUG(1-on,0-off)';
      chkKadr       = 'Код захвата кадра';
      chkStartVideo = 'Код старта захвата видео';
      chkStopVideo  = 'Код стоп захвата видео';
      
const cRegIniPart = '\Software\Softmaster\QueryList\guest';
      cModality       = 'Modality' ;
      cPhysiciansName = 'PhysiciansName' ;
      cStationName    = 'StationName' ;
      cStationAETitle = 'StationAETitle' ;
      cIsClear        = 'ClearFieldsAfterSend';
      cCheckedImages  = 'OnlyCheckedImages';
      cShNastr        = 'ShowNastroiki';

      cCapFrmHeight   = 'CapFrmHeight' ;
      cCapFrmWidth    = 'CapFrmWidth' ;

      c_cbSaveRazmer  = 'SaveRazmer';
      c_cbAutoSend    = 'AutoSend';
      c_cbCloseFormSnd= 'CloseFormSnd';
      c_cbNotShowMsg  = 'NotShowMsg';

implementation

uses fSnimok, uPeriod, DCM_Dict, UnFrmProgressBar, CmnUnit, DICOM_CMN,
     UnAbout, fCD, fSettings, unfrmNastr, DCM_UID, UnEdtWLForm,
     fCapture;

{$R *.dfm}

// процедура запрашивает studyid, studyuid
// по accessionNumber
// если найдено несколько записей - возвращает данные из последней
// возвращаемое значение - true - успешный запрос  false - ошибка
function p_studyid_fnd ( const p_accessionNumber : string;
                         const p_PatientID : string;
                         const p_StudyDate : string;
                          const p_host : string;
                          const p_port : string;
                          const p_CalledAET : string;
                          const p_CallingAET : string;
                          var p_amm_rec : Integer;
                          var p_studyid : string;
                          var p_studyuid : string
                        ):boolean;
var //v_ReceiveDatasets: TList;
    DA, DA1: TDicomAttributes;
  //  DateRange: TDicomAttribute;
    i: Integer; v_res : Boolean;
    CnsDicomConnection1: TCnsDicomConnection;
begin

  try
    CnsDicomConnection1.Host := p_host;
    CnsDicomConnection1.Port := StrToInt(p_port);
    CnsDicomConnection1.CalledTitle := p_CalledAET;
    if p_CallingAET <> '' then
      CnsDicomConnection1.CallingTitle := p_CallingAET;

    DA := TDicomAttributes.Create;

    DA.AddVariant(dQueryRetrieveLevel, 'STUDY' ); //    'PATIENT' 'STUDY' 'SERIES' 'IMAGES'
  //  DA.AddVariant(dAccessionNumber, p_accessionNumber) ; // dAccessionNumber  // Add($0008, $0050);  // , tSH, 'AccessionNumber', '1');
    DA.Add($0020, $000D); // dStudyInstanceUID
    // DA.Add($0020, $000E); // dSeriesInstanceUID
    DA.Add($0020, $0010); // dStudyID
    //
//    DA.AddVariant($0010, $0020, p_PatientID); // PatientID
//    DA.AddVariant($0008, $0020, p_StudyDate); // ](StudyDate)DA=<0>NULL
    //
{    DA.Add($0008, $0030); // ](StudyTime)TM=<0>NULL
    DA.Add($0008, $0061); // ](ModalitiesInStudy)CS=<0>NULL
    DA.Add($0008, $1030); // ](StudyDescription)LO=<0>NULL
    DA.Add($0010, $0010); // ](PatientName)PN=<0>NULL
    DA.Add($0010, $1010); // ](PatientAge)AS=<1>*
    DA.Add($0010, $1030); // ](PatientWeight)DS=<1>,00
    DA.Add($0020, $1208); // ](NumberOfStudyRelatedImages)IS=<0>NULL
    DA.Add($0088, $0130); // ](StorageMediaFilesetID)SH=<0>NULL
}    //

{
receive Command: 64[0008:0020](StudyDate)DA=<0>NULL
receive Command: 70[0008:0030](StudyTime)TM=<0>NULL
receive Command: 78[0008:0052](QueryRetrieveLevel)CS=<1>STUDY
receive Command: 82[0008:0061](ModalitiesInStudy)CS=<1>AS
receive Command: 95[0008:1030](StudyDescription)LO=<0>NULL
receive Command: 147[0010:0010](PatientName)PN=<0>NULL
receive Command: 148[0010:0020](PatientID)LO=<1>123
receive Command: 157[0010:1010](PatientAge)AS=<1>*
receive Command: 159[0010:1030](PatientWeight)DS=<1>,00
receive Command: 425[0020:000D](StudyInstanceUID)UI=<0>NULL
receive Command: 427[0020:0010](StudyID)SH=<0>NULL
receive Command: 457[0020:1208](NumberOfStudyRelatedImages)IS=<0>NULL
receive Command: 697[0088:0130](StorageMediaFilesetID)SH=<0>NULL
}

    //
    DA.Sort;
    //
    if v_debug then
      ds_sav(DA,nil,nil,'find_rec_move');
    //
    v_res:=False;
    if CnsDicomConnection1.C_FIND(DA) = True then
    begin
        v_res:=True;
        p_amm_rec:=CnsDicomConnection1.ReceiveDatasets.Count;
        //
        MnLg_ev( 'Подготовка C_MOVE найдено '+inttostr(p_amm_rec)+' записей',
                 ExtractFilePath(paramstr(0))+c_mn_log_file,
                 False
               );
        //
        if p_amm_rec > 0 then
        begin
          for i := 0 to CnsDicomConnection1.ReceiveDatasets.Count - 1 do
          begin
            DA1 := TDicomAttributes(CnsDicomConnection1.ReceiveDatasets[i]);
            if (Trim(DA1.GetString($0008, $0050))=Trim(p_accessionNumber)) then
            begin
              p_studyid  := DA1.GetString(dStudyID);
              p_studyuid := DA1.GetString(dStudyInstanceUID);
              Break;
            end;
          end;
          CnsDicomConnection1.ReceiveDatasets.Clear;
        end
        else
        begin
          p_amm_rec:=0;
        end;
      CnsDicomConnection1.Clear;
      CnsDicomConnection1.Disconnect;
    end;
  finally
    MyDisconnectAssociation(CnsDicomConnection1);
    CnsDicomConnection1.Free;
    Application.ProcessMessages;
    Sleep(100);
  end;
  p_studyid_fnd:=v_res;
end;

procedure TfrmMain.aAboutExecute(Sender: TObject);
begin  // About
  Application.CreateForm(TFrmAbout, FrmAbout);
  try
    FrmAbout.vInfo := 'Программа QueryList '+#13+
                      'Предназначена для работы '+#13+
                      'со списком назначений и'+#13+
                      'создания исследований с '+#13+
                      'помощью видеозахвата.'+#13+
                      ''+#13+
                      '';
    FrmAbout.ShowModal;
  finally
    FrmAbout.Free;
  end;
end;

procedure TfrmMain.aChangeStatusWorklistExecute(Sender: TObject);
begin // aChangeStatusWorklist Изменить статус исследования в Worklist
  if not mdWorklist.Eof then
    EdtWLForm.ShowWLForm(2); // Изменить статус назначения
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.aDispWorklistExecute(Sender: TObject);
begin  // Просмотр информации по назначению
  if not mdWorklist.Eof then
    EdtWLForm.ShowWLForm(0); // Просмотр информации по назначению
end;

procedure TfrmMain.aNastrExecute(Sender: TObject);
begin  // Настройки
  Application.CreateForm(TfrmNastr, frmNastr);
  try
    frmNastr.hkKadr.Hotkey := v_hkKadr ;
    frmNastr.hkStartVideo.Hotkey := v_hkStartVideo ;
    frmNastr.hkStopVideo.Hotkey := v_hkStopVideo ;
    frmNastr.ShowModal;
  finally
    frmNastr.Free;
  end;
end;

procedure TfrmMain.DoIssl ( p_is_new : boolean);
var vDateTmp : TDateTime;
begin  // video captute
  frmCapture := TfrmCapture.Create(self);
  try
    if v_cbSaveRazmer then
    begin
      frmCapture.Height:=vCapFrmHeight;
      frmCapture.Width:=vCapFrmWidth;
    end;
    frmCapture.CalledAE := v_teCalled;
    frmCapture.Host := v_teHost;
    frmCapture.Port := v_tePort;
    frmCapture.CallingAE := v_teCalling;
    frmCapture.vUser := sUser ;
    frmCapture.WLCalledAE  := v_teWLCalled;
    frmCapture.WLHost      := v_teWLHost;
    frmCapture.WLPort      := v_teWLPort;
    frmCapture.WLCallingAE := v_teWLCalling;
    if not p_is_new then
    begin
      frmCapture.teP_ENAME.Text := frmMain.mdWorklist.FieldByName('P_ENAME').AsString;
      frmCapture.teP_PID.Text   := frmMain.mdWorklist.FieldByName('P_PID').AsString;
      frmCapture.teP_SEX.Text   := frmMain.mdWorklist.FieldByName('P_SEX').AsString;
      frmCapture.teAccessionNumber.Text := frmMain.mdWorklist.FieldByName('AccessionNumber').AsString;
      v_teStudyUID := frmMain.mdWorklist.FieldByName('STUDYUID').AsString;

      frmCapture.teProcDescription.Text  := frmMain.mdWorklist.FieldByName('ProcDescription').AsString;

      if TryStrToDate( frmMain.mdWorklist.FieldByName('P_DATEBORN').AsString, vDateTmp ) then
        frmCapture.dtP_DATEBORN.Date := vDateTmp;

      if TryStrToDate( frmMain.mdWorklist.FieldByName('StartDateWorklist').AsString, vDateTmp ) then
        frmCapture.deStartDateWorklist.Date := vDateTmp;

    end else begin
      frmCapture.teProcDescription.Text := v_teProcDescription;
      
    end;
    if v_teModality='' then v_teModality:='CT';
    if v_teStudyUID = '' then v_teStudyUID := gt_uniq_StudyUID;

    frmCapture.PnNastr.Visible := v_cbShNastr;

    if frmCapture.ShowModal=mrOk then
    begin

    end;
  finally
    FreeAndNil(frmCapture);
  end;
  aRefreshWorklist.Execute;
end;

procedure TfrmMain.aDoIsslExecute(Sender: TObject);
begin  // Выполнить исследование по назначению
  DoIssl(False);
end;

procedure TfrmMain.aNewIsslExecute(Sender: TObject);
begin  // Выполнить новое исследование
  DoIssl(True);
end;

procedure TfrmMain.aPrintExecute(Sender: TObject);
begin
  frxRep.ShowReport;
end;

procedure TfrmMain.aRefreshWorklistExecute(Sender: TObject);
var das, da2: TDicomAttributes;
    dd, dd1: TDicomAttribute;
    i,j : Integer; // vDD : TDateTime;
    CnsDicomConnection1: TCnsDicomConnection;
    vDicomAttribute : TDicomAttribute;
  //  vStrTmp : string;
begin // aRefreshWorklist Обновить список Worklist (запрос C-FIND к серверу)
  Screen.Cursor := crHourGlass;
  CnsDicomConnection1 := TCnsDicomConnection.Create(Self);
  try
    CnsDicomConnection1.v_is_log := False;  // не протоколируем
//    CnsDicomConnection1.v_log_filename := 'mwl_scu.log';
    CnsDicomConnection1.Host := v_teWLHost;
    CnsDicomConnection1.Port := StrToInt(v_teWLPort);
    CnsDicomConnection1.CalledTitle := v_teCalled;
    CnsDicomConnection1.CallingTitle := v_teCalling;

    CnsDicomConnection1.ReceiveTimeout := 1000000;
  //  CnsDicomConnection1.ClearPresentationContext;
    CnsDicomConnection1.addPresentationContext(ModalityWorklistInformationModelFIND);
    CnsDicomConnection1.addPresentationContext(ModalityPerformedProcedureStep);
    CnsDicomConnection1.addPresentationContext(ModalityPerformedProcedureStepRetrieve);
    CnsDicomConnection1.addPresentationContext(ModalityPerformedProcedureStepNotification);

    CnsDicomConnection1.v_is_log := True;
    CnsDicomConnection1.v_log_filename := ExtractFilePath(paramstr(0))+'C_MWL.log';
    { Single Value Matching
      List of UID Matching
      Wild Card Matching
      Range Matching
      Sequence Matching    }
    das := TDicomAttributes.Create;
    with das do
    begin
      Add($0008, $0050); //(AccessionNumber)SH=<0>NULL

      Add($0010, $0010); //(PatientName)PN=<0>NULL

      Add($0010, $0020); //(PatientID)LO=<1>

      Add($0010, $0030); //(PatientBirthDate)DA=<0>NULL
      Add($0010, $0040); //(PatientSex)CS=<0>NULL
      Add($0020, $000D); //(StudyInstanceUID)UI=<0>NULL
      Add($0032, $1060); //(RequestedProcedureDescription)LO=<0>NULL
      dd := Add($0040, $0100); //(ScheduledProcedureStepSequence)SQ=<1>Sequence Data
      da2 := TDicomAttributes.Create;
      dd.AddData(da2);

      Add($0008, $0060); //(Modality)CS=<1>DX

      da2.Add($0040, $0001); //(ScheduledStationAETitle)AE=<1>HBLB
      {
      if ((YearOf(deStartDateWorklist.Date)>1900) and (YearOf(deEndDateWorklist.Date)>1900)) then begin
        dd := da2.Add($0040, $0002); //(ScheduledProcedureStepStartDate)DA=<1>2004-9-23
        dd.AsDatetime[0] := deStartDateWorklist.Date;
        dd.AsDatetime[1] := deEndDateWorklist.Date;
      end;
      }
      if ((YearOf(deStartDateWorklist.Date)>1900) or (YearOf(deEndDateWorklist.Date)>1900)) then
      begin
        dd := Add($0008, $0020);
        if YearOf(deStartDateWorklist.Date)>1900 then
          dd.AsDatetime[0] := deStartDateWorklist.Date
        else
          dd.AsDatetime[0] := EncodeDate(1900,1,1);
        if YearOf(deEndDateWorklist.Date)>1900 then
          dd.AsDatetime[1] := deEndDateWorklist.Date
        else
          dd.AsDatetime[1] := EncodeDate(2100,1,1);
      end;

      da2.Add($0040, $0003); //(ScheduledProcedureStepStartTime)TM=<0>NULL
      da2.Add($0040, $0006); //(ScheduledPerformingPhysiciansName)PN=<0>NULL
      da2.Add($0040, $0007); //(ScheduledProcedureStepDescription)LO=<0>NULL
      da2.Add($0040, $0009); //(ScheduledProcedureStepID)SH=<0>NULL
      da2.Add($0040, $0010); //(ScheduledStationName)SH=<0>NULL

      Add( $0040, $0252 );
      
      Add($0040, $1001); //(RequestedProcedureID)SH=<0>NULL
    end;

    mdWorklist.DisableControls;
    try
      mdWorklist.Open;
      mdWorklist.First;
      while not mdWorklist.Eof do begin mdWorklist.Delete; mdWorklist.Next; end;
      mdWorklist.Close; mdWorklist.Open;

      if CnsDicomConnection1.C_MWL(das) then
      begin
        if CnsDicomConnection1.ReceiveDatasets.Count > 0 then
        begin 
          for i := 0 to CnsDicomConnection1.ReceiveDatasets.Count - 1 do
          begin
            das := CnsDicomConnection1.ReceiveDatasets[i];
            ds_sav(das,nil,nil,'.records');
            mdWorklist.Insert;

          //  vStrTmp := das.GetString( $0040, $0003 );

            // Patient's Name (0010,0010) Patient's full legal name.
            mdWorklist.FieldByName('P_ENAME').AsString    := das.GetString($0010, $0010); //(PatientName)PN=<0>NULL
            // Patient ID (0010,0020) Primary hospital identification number or code for the patient.
            mdWorklist.FieldByName('P_PID').AsString      := das.GetString($0010, $0020); //(PatientID)LO=<1>
            // (AccessionNumber)SH=<0>NULL
            mdWorklist.FieldByName('ACCESSIONNUMBER').AsString      := das.GetString( $0008, $0050 );
            // Add($0010, $0030); (PatientBirthDate)DA=<0>NULL
            mdWorklist.FieldByName('P_DATEBORN').AsString      := das.GetString( $0010, $0030 );
            // Patient's Sex (0010,0040) Sex of the named Patient. Enumerated Values:
            // M = male F = female O = other
            mdWorklist.FieldByName('P_SEX').AsString      := das.GetString($0010, $0040); //(PatientSex)CS=<0>NULL
            // STUDYUID         CHAR(80),     Add($0020, $000D); //(StudyInstanceUID)UI=<0>NULL
            mdWorklist.FieldByName('STUDYUID').AsString      := das.GetString( $0020, $000D );  //(StudyInstanceUID)UI=<0>NULL
            // Performed Procedure Step Status (0040,0252) Contains the state of the Performed Procedure Step.
            // Enumerated Values: IN PROGRESS = Started but not complete DISCONTINUED = Canceled or unsuccessfully terminated COMPLETED = Successfully completed
            // cWorklistStateInProgress = 'IN PROGRESS';
            // cWorklistStateDiscounted = 'DISCONTINUED';
            // cWorklistStateCompleted  = 'COMPLETED';
            mdWorklist.FieldByName('STATUS').AsString       := das.GetString( $0040, $0252 );
            //(ScheduledProcedureStepSequence)SQ=<1>Sequence Data
            vDicomAttribute:=das.Item[ $0040, $0100 ];
            for j := 0 to vDicomAttribute.GetCount - 1 do //
            begin
              da2:=vDicomAttribute.Attributes[j];
              if Assigned(da2.Item[ $0040, $0001 ]) then
                mdWorklist.FieldByName('StationAETitle').AsString := da2.GetString( $0040, $0001 ); // (ScheduledStationAETitle)AE=<1>HBLB
              // (ScheduledProcedureStepStartDate)DA=<1>2004-9-23
              if Assigned(da2.Item[ $0040, $0002 ]) then
              begin
                dd := da2.Item[ $0040, $0002 ];
                mdWorklist.FieldByName('StartDateWorklist').AsString:= DateToStr( dd.AsDatetime[0] );
                mdWorklist.FieldByName('EndDateWorklist').AsString:= DateToStr( dd.AsDatetime[1] );
              end;
              //
              if Assigned(das.Item[ $0040, $0003 ]) then
              begin
                dd1 := da2.Item[ $0040, $0003 ];
                mdWorklist.FieldByName('StepStartTime').AsString    := IntToStr(HourOf( dd1.AsDatetime[0]))+':'+IntToStr(MinuteOf( dd1.AsDatetime[0]));
                mdWorklist.FieldByName('StepFinishTime').AsString   := IntToStr(HourOf( dd1.AsDatetime[1]))+':'+IntToStr(MinuteOf( dd1.AsDatetime[1]));
              end;
              //
              mdWorklist.FieldByName('Modality').AsString         := da2.GetString( $0008, $0060 );
              mdWorklist.FieldByName('PhysiciansName').AsString   := da2.GetString( $0040, $0006 ); //(ScheduledPerformingPhysiciansName)PN=<0>NULL
              mdWorklist.FieldByName('StepDescription').AsString  := da2.GetString( $0040, $0007 ); //(ScheduledProcedureStepDescription)LO=<0>NULL
              mdWorklist.FieldByName('StepID').AsString           := da2.GetString( $0040, $0009 ); //(ScheduledProcedureStepID)SH=<0>NULL
              mdWorklist.FieldByName('StationName').AsString      := da2.GetString( $0040, $0010 ); //(ScheduledStationName)SH=<0>NULL
              // !!! доделать
              Break; // потом доделать чтение списка аттрибутов - сейчас только один будет читаться - для отладки
            end;
            mdWorklist.FieldByName('ProcedureID').AsString        := das.GetString( $0040, $1001 ); // Requested Procedure ID (0040,1001) O 1
            mdWorklist.FieldByName('ProcDescription').AsString    := das.GetString( $0032, $1060 ); // The Requested Procedure Description
            //  Requested Procedure Priority (0040,1003) Requested Procedure Type Urgency. Defined
            //  Terms are: STAT, HIGH, ROUTINE, MEDIUM, LOW
            mdWorklist.FieldByName('ProcPriority').AsString       := das.GetString( $0040,$1003 );
            {
            // PERFORMED PROCEDURE STEP INFORMATION MODULE ATTRIBUTES
            // Performed Station AE Title (0040,0241) AE title of the modality on which the Performed Procedure Step was performed.
            das1.AddVariant($0040, $0241, edStationAETitle.Text); // Performed Station AE Title:
            // Performed Station Name (0040,0242) An institution defined name for the modality on which the Performed Procedure Step was performed.
            das1.AddVariant($0040, $0242, edStationName.Text); // Performed Station Name:
            // Performed Location (0040,0243) Description of the location at which the Performed Procedure Step was performed
            das1.AddVariant($0040, $0243, edLocation.Text); // Performed Location:
            // Performed Procedure Step Start Date (0040,0244) Date on which the Performed Procedure Step started.
            das1.Add($0040, $0244).asDatetime[0] := now; // Performedprocedure Step Start: 2008 - 1 - 11
            // Performed Procedure Step Start Time (0040,0245) Time at which the Performed Procedure Step started.
            das1.Add($0040, $0245).asDatetime[0] := now; // Performed procedure Step Start: ?? 10: 05: 59
            // Performed Procedure Step End Date (0040,0250) Date on which the Performed Procedure Step ended.
            das1.Add($040, $0250); // Performed Procedure Step End D:
            // Performed Procedure Step End Time (0040,0251) Time at which the Performed Procedure Step ended.
            das1.Add($0040, $0251); // Performed Procedure Step End T:
            // Performed Procedure Step Status (0040,0252) Contains the state of the Performed Procedure Step.
            // Enumerated Values: IN PROGRESS = Started but not complete DISCONTINUED = Canceled or unsuccessfully terminated COMPLETED = Successfully completed
            // cWorklistStateInProgress = 'IN PROGRESS';
            // cWorklistStateDiscounted = 'DISCONTINUED';
            // cWorklistStateCompleted  = 'COMPLETED';
            das1.AddVariant($0040, $0252, cWorklistStateCompleted ); 
            // Performed Procedure Step ID (0040,0253) User or equipment generated identifier of that part of a Procedure that has been carried out within this step.
            das1.AddVariant($0040, $0253, 1); // Performed procedure Step ID: 1
            // Performed Procedure Step Description (0040,0254) Institution-generated description or classification of the Procedure Step that was performed.
            das1.AddVariant($0040, $0254, edPPSD.Text);
            // Performed procedure Step Descr:
            das1.AddVariant($0040, $0255, edPPDT.Text);
            // Performed procedure type Descr:
            da1 := das1.Add($0040, $0260);
// !!!            // Comments on the Performed Procedure Step (0040,0280) User-defined comments on the Performed Procedure Step.
// !!!            // Performed Procedure Type Description (0040,0255) A description of the type of procedure performed.
            }
            mdWorklist.Post;
          end;
        end
        else
          MessageDlg('Данных нет', mtWarning, [mbOK], 0);
        CnsDicomConnection1.Clear;
        CnsDicomConnection1.Disconnect;
      end
      else
        MessageDlg('Ошибка WORKLIST сервера ...', mtError, [mbOK], 0);
    finally
      mdWorklist.EnableControls;
    end;
  finally
    CnsDicomConnection1.Free;
    Screen.Cursor := crDefault;
  end;
  Application.ProcessMessages;
  CheckEnabledButtons;
end;

procedure TfrmMain.aWebExecute(Sender: TObject);
begin
{  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);}
end;

procedure TfrmMain.aXMLExecute(Sender: TObject);
begin
{  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);  }
end;

procedure TfrmMain.CheckEnabledButtons;
begin
//  aPrint.Enabled := dxMemData1.RecordCount <> 0;

  if mdWorklist.RecordCount <> 0 then
  begin
    aDispWorklist.Enabled:=True;
    aChangeStatusWorklist.Visible:=False;
  end else begin
    aDispWorklist.Enabled:=False;
    aChangeStatusWorklist.Visible:=False;
  end;
  Application.ProcessMessages;
end;

procedure TfrmMain.cxSplitter1BeforeOpen(Sender: TObject; var NewSize: Integer;
  var AllowOpen: Boolean);
begin
end;

// ПОЛУЧЕНИЕ ИЗОБРАЖЕНИЯ - используется локальный сервер
// который слушает локальный порт приема данных
procedure TfrmMain.DicomServerCore1DicomImage(AClientThread: TDicomClientThread;
  AAddress: string; ADataset: TDicomDataset);
begin
  MnLg_ev('DicomServerDicomImage port='+inttostr(DicomServerCore1.ServerPort)+#13+
          ' AAddress='+AAddress);
  // проверяем признак принудительного выхода - устанавливается
  // в форме ползунка
  if CmnUnit.v_exit_progressbar=1 then // остановить прием
  begin
    frmMain.DicomServerCore1.Stop;
  end else begin  // прием очередного изображения
    MnLg_ev('DicomServerDicomImage MoveImageCount '+inttostr(MoveImageCount)+
             ' / curr_count='+inttostr(v_amm_img_loaded),
             ExtractFilePath(paramstr(0))+'c_move.log',
             False );
    // пока принятых снимков меньше общего
    // количества которое ожидается принять
    // добавили снимок в датасет
    frmSnimok.CnsDMTable1.Add(ADataset);
    // послали сообщение что снимок принят нормально - 0
    AClientThread.Association.SendStatus(0);
   // if v_amm_img_loaded<=MoveImageCount then begin
      inc(v_amm_img_loaded);
      FrmProgressBar.MyIncPos; // прогрессбар нарастили
      // если снимок последний - остановим прием
      if ((v_amm_img_loaded>=MoveImageCount) and (MoveImageCount>0)) then
      begin
        CmnUnit.v_exit_progressbar:=2;  // остановим ползунок
        frmMain.DicomServerCore1.Stop;
      end;
   // end;
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из приложения ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes
  then begin
    action := caFree;
  end else begin
    action := caNone;
  end;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile; Ini:TIniFile;
begin
  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if not Reg.OpenKey('\Software\Softmaster\QueryList\', False) then
    begin
      Reg.CreateKey('\Software\Softmaster\QueryList');
    end;
  try
    Reg.WriteString('\Software\Softmaster\QueryList', 'CLIENT_PORT_IMAGE', v_teLocalPort);
    Reg.WriteString('\Software\Softmaster\QueryList', 'SERVER_PORT_QUERY', v_tePort);
    Reg.WriteString('\Software\Softmaster\QueryList', 'SERVER_PORT_STORE', v_tePortStore);
    Reg.WriteString('\Software\Softmaster\QueryList', 'SERVER_IP_QUERY', v_teHost);
    Reg.WriteString('\Software\Softmaster\QueryList', 'CALLED_AE_TITLE_QUERY', v_teCalled);
    Reg.WriteString('\Software\Softmaster\QueryList', 'CALLING_AE_TITLE_QUERY', v_teCalling);

    Reg.WriteString('\Software\Softmaster\DicomClient', 'WLCalledAE', v_teWLCalled);
    Reg.WriteString('\Software\Softmaster\DicomClient', 'WLHost', v_teWLHost);
    Reg.WriteString('\Software\Softmaster\DicomClient', 'WLPort', v_teWLPort);
    Reg.WriteString('\Software\Softmaster\DicomClient', 'WLCallingAE', v_teWLCalling);

  finally
    Reg.Free;
  end;
  Ini := TIniFile.Create(ExtractFilePath(paramstr(0))+c_ini_file);
  try   //
    Ini.WriteInteger(c_rzd,chkKadr,v_hkKadr);
    Ini.WriteInteger(c_rzd,chkStartVideo,v_hkStartVideo);
    Ini.WriteInteger(c_rzd,chkStopVideo,v_hkStopVideo);
  finally
    Ini.Free;
  end; 
//  TV.StoreToRegistry('\SoftWare\SoftMaster\QueryList\TV', TRUE, [], 'TV');
end;

procedure TfrmMain.pRegCrtPart;
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    if not Reg.OpenKey(cRegIniPart, False) then
      Reg.CreateKey(cRegIniPart);
  finally
    Reg.Free;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var Ini:TIniFile;  Reg : TRegIniFile;
begin
  //
  Height:=600;
  Width:=800;
  //
  Ini := TIniFile.Create(ExtractFilePath(paramstr(0))+c_ini_file);
  try   // чтение параметров соединения с БД
    v_hkKadr       := Ini.ReadInteger(c_rzd,chkKadr,0);
    v_hkStartVideo := Ini.ReadInteger(c_rzd,chkStartVideo,0);
    v_hkStopVideo  := Ini.ReadInteger(c_rzd,chkStopVideo,0);
    v_debug:=(Ini.ReadString(c_rzd,c_section_is_debug,'0')='1');
    if v_debug then
      Ini.WriteString(c_rzd,c_section_is_debug,'1')
    else
      Ini.WriteString(c_rzd,c_section_is_debug,'0');
    Ini.WriteInteger(c_rzd,chkKadr,v_hkKadr);
    Ini.WriteInteger(c_rzd,chkStartVideo,v_hkStartVideo);
    Ini.WriteInteger(c_rzd,chkStopVideo,v_hkStopVideo);
    s_hkKadr       := ShortCutToText(v_hkKadr);
    s_hkStartVideo := ShortCutToText(v_hkStartVideo);
    s_hkStopVideo  := ShortCutToText(v_hkStopVideo);
  finally
    Ini.Free;
  end;

  Reg := TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    pRegCrtPart;
    v_teModality      := Reg.ReadString( cRegIniPart, cModality, '' ) ;
    v_tePhysiciansName:= Reg.ReadString( cRegIniPart, cPhysiciansName, '' ) ;
    v_teStationName   := Reg.ReadString( cRegIniPart, cStationName, '' ) ;
  //  v_cbCleanData     := ( Reg.ReadInteger(cRegIniPart, cIsClear, 1 ) = 1 );
    v_cbCheckedImages := ( Reg.ReadInteger(cRegIniPart, cCheckedImages, 1 ) = 1 );
    v_cbShNastr := ( Reg.ReadInteger(cRegIniPart, cShNastr, 1 ) = 1 );

    v_cbSaveRazmer    := ( Reg.ReadInteger(cRegIniPart, c_cbSaveRazmer, 1 ) = 1 );

    vCapFrmHeight     := Reg.ReadInteger(cRegIniPart, cCapFrmHeight, 600 ) ;
    vCapFrmWidth      := Reg.ReadInteger(cRegIniPart, cCapFrmWidth, 800 ) ;

    v_cbAutoSend      := ( Reg.ReadInteger(cRegIniPart, c_cbAutoSend, 1 ) = 1 );
    v_cbCloseFormSnd  := ( Reg.ReadInteger(cRegIniPart, c_cbCloseFormSnd, 1 ) = 1 );
    v_cbNotShowMsg    := ( Reg.ReadInteger(cRegIniPart, c_cbNotShowMsg, 1 ) = 1 );

  finally
    Reg.Free;
  end;

  MWLReceiveDatasets := TList.Create;
  aPrint.Enabled := False;
//  aSnimok.Enabled := False;
//  TV.StoreToRegistry('\SoftWare\SoftMaster\QueryList\TVDefault', TRUE, [], 'TV'); // поднимаем из реестра настройки грида
//  TV.RestoreFromRegistry('\SoftWare\SoftMaster\QueryList\TV', FALSE, FALSE, [], 'TV');
  Russian:=LoadKeyboardLayout('00000419', 0);
  //
  v_ds_i:=0;
  //
  CheckEnabledButtons;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to MWLReceiveDatasets.Count - 1 do
    TDicomAttributes(MWLReceiveDatasets[i]).Free;

  MWLReceiveDatasets.Free;
end;

procedure TfrmMain.FormShow(Sender: TObject);
var Reg : TRegIniFile;
begin
  Reg:=TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
//-->> локальный порт для приема изображений
    v_teLocalPort := Reg.ReadString('\Software\Softmaster\QueryList', 'CLIENT_PORT_IMAGE', '');
    if v_teLocalPort= '' then
      v_teLocalPort:= '1115';
//-->> порт
    v_tePort := Reg.ReadString('\Software\Softmaster\QueryList', 'SERVER_PORT_QUERY', '');
    v_tePortStore := Reg.ReadString('\Software\Softmaster\QueryList', 'SERVER_PORT_STORE', '');
    if v_tePort = '' then
      v_tePort := Reg.ReadString('\Software\Softmaster\DicomServer', 'SERVER_PORT', '');
    if v_tePort = '' then
      v_tePort := '104';
//-->> хост (PACS сервер)
    v_teHost := Reg.ReadString('\Software\Softmaster\QueryList', 'SERVER_IP_QUERY', '');
    if v_teHost = '' then
      v_teHost := Reg.ReadString('\Software\Softmaster\DicomClient', 'SERVER_IP', '');
//-->> Called AE Title
    v_teCalled := Reg.ReadString('\Software\Softmaster\QueryList', 'CALLED_AE_TITLE_QUERY', '');
    if v_teCalled = '' then
      v_teCalled := Reg.ReadString('\Software\Softmaster\DicomServer', 'AE_TITLE', '');
//-->> Calling AE Title
    v_teCalling := Reg.ReadString('\Software\Softmaster\QueryList', 'CALLING_AE_TITLE_QUERY', '');
    if v_teCalling = '' then
      v_teCalling := Reg.ReadString('\Software\Softmaster\DicomClient', 'CALLING_AE_TITLE', '');

    if v_teWLCalled = '' then
      v_teWLCalled := Reg.ReadString('\Software\Softmaster\DicomClient', 'WLCalledAE', '');
    if v_teWLHost = '' then
      v_teWLHost := Reg.ReadString('\Software\Softmaster\DicomClient', 'WLHost', '');
    if v_teWLPort = '' then
      v_teWLPort := Reg.ReadString('\Software\Softmaster\DicomClient', 'WLPort', '');
    if v_teWLCalling = '' then
      v_teWLCalling := Reg.ReadString('\Software\Softmaster\DicomClient', 'WLCallingAE', '');

  finally
    Reg.Free;
  end;
  aRefreshWorklist.Execute;
end;

procedure TfrmMain.frxRepGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'DATESYS' then Value := Now; //!!!
  if VarName = 'KOLVO' then Value := dxMemData1.RecordCount;
end;

procedure TfrmMain.N3Click(Sender: TObject);
begin
//  TV.RestoreFromRegistry('\SoftWare\SoftMaster\QueryList\TVDefault', FALSE, FALSE, [], 'TV');
end;

procedure TfrmMain.teFamClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmMain.teFamEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmMain.teSotrClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmMain.teSotrEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmMain.TVCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
end;

// оставлено для тестирования утечек памяти
// initialization
//   ReportMemoryLeaksOnShutdown := True;
end.
