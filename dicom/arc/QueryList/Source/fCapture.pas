unit fCapture;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, DCM_Attributes, Buttons, StdCtrls, DicomVideoCap, ExtCtrls,
  ComCtrls, DCM32, DCM_Client, Menus, cxLookAndFeelPainters, cxButtons,
  ActnList, dxSkinsCore, dxSkinsdxBarPainter, dxSkinCoffee, dxBar,
  dxBarExtItems, cxClasses, cxControls, cxSplitter, cxStyles, cxGraphics,
  cxEdit, cxVGrid, cxInplaceContainer, DB, Registry,
  dxSkinOffice2007Green, mmSystem, Dcm_View, cxPropertiesStore, dxSkinBlack,
  dxSkinscxPCPainter, cxPC, dxmdaset, dxSkinOffice2007Black, Medotrade,
  cxTextEdit, cxLabel, cxContainer, cxGroupBox, cxDropDownEdit, cxCalendar,
  cxMaskEdit, cxSpinEdit, cxCheckBox, frxClass, frxExportRTF, frxDBSet,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, LcxDBGrid, Variants;

type
  TfrmCapture = class(TForm)
    Panel1: TPanel;
    cap: TDicomVideoCapture;
    StatusBar: TStatusBar;
    lbFrames: TLabel;
    Timer: TTimer;
    Panel2: TPanel;
    cbVModes: TComboBox;
    Button2: TButton;
    Button1: TButton;
    lbDialogs: TComboBox;
    SpeedButton1: TSpeedButton;
    al: TActionList;
    aClose: TAction;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbAttach: TdxBarLargeButton;
    bbSend: TdxBarLargeButton;
    bbClose: TdxBarLargeButton;
    aAttach: TAction;
    aSend: TAction;
    cxSplitter1: TcxSplitter;
    CnsDMTable1: TCnsDMTable;
    aCapture: TAction;
    cxPropertiesStore1: TcxPropertiesStore;
    cxPageControl1: TcxPageControl;
    TSVIDOECAPTURE: TcxTabSheet;
    TSSHOW: TcxTabSheet;
    DicomMultiVIewer1: TDicomMultiViewer;
    CnsDMTable2: TCnsDMTable;
    CaptureView: TDCMMultiImage;
    Panel3: TPanel;
    Button3: TButton;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    aSave: TAction;
    FileOpenDialogDCM: TFileOpenDialog;
    Panel4: TPanel;
    dxMemData1: TdxMemData;
    dxMemData1npp: TIntegerField;
    dxMemData1fvideo: TBlobField;
    dxMemData1filename: TStringField;
    cxlbl1: TcxLabel;
    teP_ENAME: TcxTextEdit;
    cxLabel4: TcxLabel;
    teP_PID: TcxTextEdit;
    cxLabel5: TcxLabel;
    teP_SEX: TcxComboBox;
    cxLabel6: TcxLabel;
    dtP_DATEBORN: TcxDateEdit;
    cxLabel22: TcxLabel;
    teAccessionNumber: TcxTextEdit;
    cxLabel24: TcxLabel;
    teModality: TcxComboBox;
    cxLabel23: TcxLabel;
    tePhysiciansName: TcxTextEdit;
    cxLabel30: TcxLabel;
    teStationName: TcxTextEdit;
    cxLabel29: TcxLabel;
    teProcDescription: TcxTextEdit;
    cxLabel28: TcxLabel;
    deStartDateWorklist: TcxDateEdit;
    cxLabel26: TcxLabel;
    cxLabel1: TcxLabel;
    teStudyUID: TcxTextEdit;
    cxLabel2: TcxLabel;
    seMin: TcxSpinEdit;
    seHour: TcxSpinEdit;
    aStartCapVideo: TAction;
    aStopCapVideo: TAction;
    aChngRejim: TAction;
    cxButton1: TcxButton;
    cxGroupBox3: TcxGroupBox;
    cbCleanData: TcxCheckBox;
    cbCheckedImages: TcxCheckBox;
    dxBarLargeButton2: TdxBarLargeButton;
    aPrint: TAction;
    frxReport1: TfrxReport;
    frxRTFExport1: TfrxRTFExport;
    mdPrintList: TdxMemData;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    dbPrintList: TfrxDBDataset;
    dsPrintList: TDataSource;
    cxPageControl2: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxButton2: TcxButton;
    aDelChecked: TAction;
    CnsDMTable3: TCnsDMTable;
    cbNastr: TCheckBox;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    aSetHotKeys: TAction;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxTabSheet3: TcxTabSheet;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    aWLRefresh: TAction;
    aWLCheck: TAction;
    cxGr: TcxGrid;
    TV: TcxGridTableView;
    VAccessionNumber: TcxGridColumn;
    vPatientName: TcxGridColumn;
    VPatientID: TcxGridColumn;
    VPatientBirthDate: TcxGridColumn;
    VPatientSex: TcxGridColumn;
    VStudyInstanceUID: TcxGridColumn;
    VModality: TcxGridColumn;
    VStationAETitle: TcxGridColumn;
    VScheduledProcedureStepStartDate: TcxGridColumn;
    cxGrLevel1: TcxGridLevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure capBitmapGrabbed(CapturedImage: TCapturedBitmap);
    procedure capCaptureProgress(Sender: TObject);
    procedure capChangeDevice(Sender: TObject);
    procedure capFrameRendered(Sender: TObject);
    procedure capStartPreview(Sender: TObject);
    procedure capStopPreview(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure cbVModesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aAttachExecute(Sender: TObject);
    procedure aCaptureExecute(Sender: TObject);
    procedure CaptureViewDblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure aSendExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure aStartCapVideoExecute(Sender: TObject);
    procedure aStopCapVideoExecute(Sender: TObject);
    procedure aChngRejimExecute(Sender: TObject);
    procedure teP_PIDPropertiesChange(Sender: TObject);
    procedure CaptureViewClick(Sender: TObject);
    function ChkItemInChecked(pi:Integer):Boolean;
    procedure aPrintExecute(Sender: TObject);
    procedure frxReport1GetValue(const VarName: string; var Value: Variant);
    procedure aDelCheckedExecute(Sender: TObject);
    procedure cbNastrClick(Sender: TObject);
    procedure aSetHotKeysExecute(Sender: TObject);
    procedure aWLRefreshExecute(Sender: TObject);
    procedure aWLCheckExecute(Sender: TObject);
  private
    pPort : Integer;
    pIp, pAe : string;
    OnCaptureNewImage: TOnAddImageEvent;
    procedure pRegCrtPart;
    procedure pAddAttrToDicomDataset ( var pDCMAttr:TDicomDataSets );
    function fchkFullDataInForm: Boolean;
    procedure SetShortCutsOfHotKeys;
    procedure ShowRejim;
    procedure SetAN;
    procedure setNastrBtn;
  public
    v_user_cat,
    v_user_file : ansistring;
    WLCalledAE,
    WLHost,
    WLPort,
    WLCallingAE,
    CalledAE,
    Host,
    Port,
    CallingAE,
    vUser : string;
    ControlPanelSize: TSize;
    framecount,
    fImageIndex: integer;
    config: TGraphConfig;
    vIsFromWeb,
    vStartCaptureVideo,
    vRejim : Boolean; // False - видео True - ввод инфы о пациенте
    vImgCheckList: TStringList;
    function InitCapture: Boolean;
    procedure DoShowForm(nPort : Integer; sIp, sAe : string);
    procedure OnWriteFrame(Sender: TObject; AIndex: Integer; Ammount: Integer);
    procedure clr_temp_files;
    procedure FldClr;

  //  procedure WMPaint(var Message: TMessage); message WM_PAINT;

  end;

var frmCapture : TfrmCapture;
    v_ds_list : TList;

const cRegIniPart = '\Software\Softmaster\QueryList\guest';
      cModality       = 'Modality' ;
      cPhysiciansName = 'PhysiciansName' ;
      cStationName    = 'StationName' ;
      cStationAETitle = 'StationAETitle' ;
      cIsClear        = 'ClearFieldsAfterSend';
      cCheckedImages  = 'OnlyCheckedImages';

procedure pStartCapture (    p_fio_pac,            // фио пациента
                             p_pid,                // номер медкарты
                             p_pol,                // пол
                             p_dateborn,           // дата рождения

                             p_mod,                // modality
                             p_doctor,             // врач
                             p_station,            // наименование раб станции
                             p_accessionnumber,    // ACCESSIONNUMBER:
                             p_STUDYUID,           // STUDYUID:
                             p_description,        // Описание:

                             p_get_dicom_ip,
                             p_get_dicom_called,
                             p_get_dicom_port,
                             p_get_local_port,
                             p_get_dicom_calling,
                             p_debug  : string
                        );

implementation

uses DicomVideoUtils, ActiveX, DicomVideoConfig, DicomVideoCapStrings, inifiles,
     fMain, DCM_Dict, CnsTgaGr, DCM_UID, CnsJpgGr, DateUtils, DB_CMN,
     CnsTifGr, CnsPngGr, CnsPpmGr, CnsPcxGr, CnsDcxGr, DCM_Connection,
     CnsDirScan, ImageAttributesList, SelectPacsHost, DCM_MpegWrite, UnOptions,
     Save2MpegStatus, Dicom2AVIStatus, UnFrmProgressBar, DICOM_CMN, CmnUnit,
     DCM_ImageData_Bitmap;
{$R *.dfm}

procedure TfrmCapture.setNastrBtn;
begin
  cbVModes.Visible := cbNastr.Checked ;
  Button2.Visible := cbNastr.Checked ;
  Button1.Visible := cbNastr.Checked ;
  lbDialogs.Visible := cbNastr.Checked ;
  SpeedButton1.Visible := cbNastr.Checked ;
end;

procedure pStartCapture (    p_fio_pac,            // фио пациента
                             p_pid,                // номер медкарты
                             p_pol,                // пол
                             p_dateborn,           // дата рождения

                             p_mod,                // modality
                             p_doctor,             // врач
                             p_station,            // наименование раб станции
                             p_accessionnumber,    // ACCESSIONNUMBER:
                             p_STUDYUID,           // STUDYUID:
                             p_description,        // Описание:

                             p_get_dicom_ip,
                             p_get_dicom_called,
                             p_get_dicom_port,
                             p_get_local_port,
                             p_get_dicom_calling,
                             p_debug  : string
                        );
var vNow : TDateTime;
begin
  frmCapture := TfrmCapture.Create(nil);
  try
    frmCapture.CalledAE := p_get_dicom_called;
    frmCapture.Host := p_get_dicom_ip;
    frmCapture.Port := p_get_dicom_port;
    frmCapture.CallingAE := p_get_dicom_calling;
    frmCapture.vUser := p_doctor ;

    frmCapture.teP_ENAME.Text := p_fio_pac ;
    frmCapture.teP_PID.Text        := p_pid;

    if p_pol='М' then
      frmCapture.teP_SEX.Text        := 'M'        // M/F/O
    else if p_pol='Ж' then
      frmCapture.teP_SEX.Text        := 'F' ;      // M/F/O

    frmCapture.dtP_DATEBORN.Date   := Date ;
                              
    frmCapture.teModality.Text       := p_mod;
    frmCapture.tePhysiciansName.Text := p_doctor;
    frmCapture.teStationName.Text    := p_station;
    frmCapture.deStartDateWorklist.Date:=Date;

    vNow := Now;
    frmCapture.seHour.Text :=IntToStr(HourOf(vNow));
    frmCapture.seMin.Text  :=IntToStr(MinuteOf(vNow));

    frmCapture.teAccessionNumber.Text    :=  p_accessionnumber;
    frmCapture.teStudyUID.Text           :=  p_STUDYUID;
    frmCapture.teProcDescription.Text    :=  p_description;

    frmCapture.cbCleanData.Checked := False;
    frmCapture.vIsFromWeb := True;

    if frmCapture.ShowModal=mrOk then
    begin

    end;
  finally
    FreeAndNil(frmCapture);
  end;

end;

function gt_avi_filename ( p_i : integer ) : string;
var AFileName : string;
begin
  AFileName:='';
  frmCapture.dxMemData1.First;
  while not frmCapture.dxMemData1.Eof do
  begin
    if frmCapture.dxMemData1.FieldByName('npp').AsInteger = p_i
    then
    begin
      AFileName:=frmCapture.dxMemData1.FieldByName('filename').AsString;
      break;
    end;
    frmCapture.dxMemData1.Next;
  end;
  Result := AFileName;
end;

function TfrmCapture.fchkFullDataInForm: Boolean;
begin
  if Trim(teP_ENAME.Text)='' then
  begin
    MessageDlg('Не введено ФИО пациента', mtWarning, [mbOK], 0);
    teP_ENAME.SetFocus;
    Result:=True;
  end else
  if Trim(teP_PID.Text)='' then
  begin
    MessageDlg('Не введен номер медкарты', mtWarning, [mbOK], 0);
    teP_PID.SetFocus;
    Result:=True;
  end else
  if Trim(teAccessionNumber.Text)='' then
  begin
    MessageDlg('Не введен AccessionNumber (номер исследования)', mtWarning, [mbOK], 0);
    teAccessionNumber.SetFocus;
    Result:=True;
  end else
    Result:=False;
end;

procedure TfrmCapture.pAddAttrToDicomDataset ( var pDCMAttr:TDicomDataSets );
var vDateStudy : TDateTime; i:Integer;
  procedure pAssignAttr ( pGroup, pElement : Integer; pText:string );
  begin
    if Assigned(pDCMAttr[i].Attributes.Item[pGroup, pElement]) then pDCMAttr[i].Attributes.Remove(pGroup, pElement);
    pDCMAttr[i].Attributes.Add(pGroup, pElement); // tePacFIO Пациент
    if (Trim(pText)<>'') then
      pDCMAttr[i].Attributes.Add(pGroup, pElement).AsString[0] := Trim(pText)
    else
      pDCMAttr[i].Attributes.Add(pGroup, pElement);
  end;
  procedure pAssignDTAttr ( pGroup, pElement : Integer; pDT:TDateTime );
  begin
    if Assigned(pDCMAttr[i].Attributes.Item[pGroup, pElement]) then pDCMAttr[i].Attributes.Remove(pGroup, pElement);
    pDCMAttr[i].Attributes.Add( pGroup, pElement );
    pDCMAttr[i].Attributes.Add( pGroup, pElement ).AsDatetime[0] := pDT;
  end;
begin
  for I := 0 to pDCMAttr.Count - 1 do
  begin
    if not TryEncodeDateTime( YearOf(deStartDateWorklist.Date) ,
                              MonthOf(deStartDateWorklist.Date),
                              DayOf(deStartDateWorklist.Date),
                              Trunc(seHour.Value),
                              Trunc(seMin.Value),
                              0,
                              0,
                              vDateStudy )
    then vDateStudy := now;
    pAssignAttr( $0010, $0010, teP_ENAME.Text );  // Пациент:    Add(147, $0010, $0010, tPN, 'PatientName', '1')
    pAssignAttr( $0010, $0020, teP_PID.Text   );  // N медкарты:   Add(148, $0010, $0020, tLO, 'PatientID', '1');
    pAssignDTAttr( $0010, $0030, dtP_DATEBORN.Date ); // Дата рожд.: Add(150, $0010, $0030, tDA, 'PatientBirthDate', '1');
    pAssignAttr( $0010, $0040, teP_SEX.Text ); // Пол (M = male F = female O = other):  Add(152, $0010, $0040, tCS, 'PatientSex', '1');
    pAssignAttr( $0020, $000D, teSTUDYUID.Text ); // STUDYUID: Add(425, $0020, $000D, tUI, 'StudyInstanceUID', '1');
    pAssignAttr( $0008, $0060, teModality.Text ); // MODALITY: Add(81, $0008, $0060, tCS, 'Modality', '1');
    pAssignAttr( $0008, $0090, tePhysiciansName.Text ); // Врач: Add(88, $0008, $0090, tPN, 'ReferringPhysiciansName', '1');
    pAssignAttr( $0008, $1010, teStationName.Text ); // Наименование раб.станции: Add(94, $0008, $1010, tSH, 'StationName', '1');
    pAssignDTAttr( $0008, $0020, vDateStudy );  // Дата начала исследования:  Add(64, $0008, $0020, tDA, 'StudyDate', '1')
    pAssignDTAttr( $0008, $0030, vDateStudy );  // Время начала исследования: Add(70, $0008, $0030, tTM, 'StudyTime', '1');
    pAssignAttr( $0008, $0050, teAccessionNumber.Text ); // Add(77, $0008, $0050, tSH, 'AccessionNumber', '1');
    pAssignAttr( $0008, $1030, teProcDescription.Text ); // Описание: Add(95, $0008, $1030, tLO, 'StudyDescription', '1');
  end;
end;

procedure TfrmCapture.pRegCrtPart;
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

function TfrmCapture.InitCapture: Boolean;
begin
  Result := cap.Init;
end;

procedure TfrmCapture.FormClose(Sender: TObject;
  var Action: TCloseAction);
var i:integer; Reg : TRegIniFile;
begin
  if ((CaptureView.DicomDatasets=nil) or (CaptureView.DicomDatasets.Count<=0) or
      (MessageDlg('Несохраненные данные будут потеряны. Выйти ?', mtConfirmation, [mbYes, mbNo], 0)=mrYes))
  then begin
    Reg := TRegIniFile.Create;
    Reg.RootKey:=HKEY_CURRENT_USER;
    pRegCrtPart;
    try
      Reg.WriteString(cRegIniPart, cModality, teModality.Text );
      Reg.WriteString(cRegIniPart, cPhysiciansName, tePhysiciansName.Text );
      Reg.WriteString(cRegIniPart, cStationName, teStationName.Text );
      if cbCleanData.Checked then
        Reg.WriteInteger(cRegIniPart, cIsClear, 1 )
      else
        Reg.WriteInteger(cRegIniPart, cIsClear, 0 );
      if cbCheckedImages.Checked then
        Reg.WriteInteger(cRegIniPart, cCheckedImages, 1 )
      else
        Reg.WriteInteger(cRegIniPart, cCheckedImages, 0 );
    finally
      Reg.Free;
    end;
    dxMemData1.Close;
    cap.StopPreview;
    cap.StopCapture;
    Action := caHide;
    // !!! удаляет все что сохранили
   // p_img_lst_clear;
    CnsDMTable1.Free;
    //
    clr_temp_files;
    //
    if v_ds_list<>nil then
    begin
      for i:=0 to v_ds_list.Count-1 do
        if TDicomDataset(v_ds_list[i])<>nil then
        begin
          if TDicomDataset(v_ds_list[i]).Attributes<>nil then
            TDicomDataset(v_ds_list[i]).Attributes.Clear;
          if TDicomDataset(v_ds_list[i])<>nil then
            TDicomDataset(v_ds_list[i]).Free;
        end;
      v_ds_list.Free;
    end;
    CaptureView.DicomDatasets:=nil;
    DicomMultiVIewer1.DicomDatasets:=nil;
    //
    frmCapture.dxMemData1.Close;
    //
    Action := caFree;
  end else begin
    Action := caNone;
    Exit;
  end;
end;

procedure TfrmCapture.FldClr;
var vNow : TDateTime;
begin
  vNow := Now;
  deStartDateWorklist.Date:=Date;
  teP_ENAME.Text := '' ;
  teP_PID.Text   := '' ;
  dtP_DATEBORN.Clear;
  seHour.Text :=IntToStr(HourOf(vNow));
  seMin.Text  :=IntToStr(MinuteOf(vNow));
  teStudyUID.Text := gt_uniq_StudyUID;
  SetAN;
  CaptureView.DicomDatasets.ClearList;
  Application.ProcessMessages;
end;

procedure TfrmCapture.FormCreate(Sender: TObject);
var Reg : TRegIniFile;
begin
  vIsFromWeb:=False;
  cxPageControl2.ActivePageIndex:=0;
  vImgCheckList:= TStringList.Create;
  vRejim:=False;
  ShowRejim;
  vStartCaptureVideo:=False;
  aStopCapVideo.Enabled:=False;
  // Инициализация данных исследования
  teModality.Properties.Items.Clear;
  ctrFullModList( TStringList(teModality.Properties.Items) );
  //
  Reg := TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    pRegCrtPart;
    teModality.Text      := Reg.ReadString( cRegIniPart, cModality, '' ) ;
    tePhysiciansName.Text:= Reg.ReadString( cRegIniPart, cPhysiciansName, '' ) ;
    teStationName.Text   := Reg.ReadString( cRegIniPart, cStationName, '' ) ;
    cbCleanData.Checked  := ( Reg.ReadInteger(cRegIniPart, cIsClear, 1 ) = 1 );
    cbCheckedImages.Checked  := ( Reg.ReadInteger(cRegIniPart, cCheckedImages, 1 ) = 1 );
  finally
    Reg.Free;
  end;
  FldClr;
  //
  v_user_cat:=ExtractFilePath(Application.ExeName)+'Capture\';    // GetEnvironmentVariable('AppData')
  if not DirectoryExists(v_user_cat) then
    CreateDirectory( Pchar(v_user_cat), nil );
  v_user_file:=v_user_cat+'temp_list.tmp';
  clr_temp_files; // очистка временных файлов
  dxMemData1.Open;
  fImageIndex := 1;
  cxPageControl1.ActivePageIndex:=0;
  config := TGraphConfig.Create;
  CaptureView.BufferMode := true;
  cap.SetVCapMode(cbVModes.ItemIndex);
  v_ds_list := TList.Create;
end;

procedure TfrmCapture.FormDestroy(Sender: TObject);
begin
  vImgCheckList.Free;
  config.Free;
end;

procedure TfrmCapture.FormShow(Sender: TObject);
var s: string;
begin
  SetShortCutsOfHotKeys;
  setNastrBtn;
  if not InitCapture then
  begin
    ShowMessage('Can''t init capture!');
  end
  else
  begin
    with TIniFile.Create('Video.ini') do
    try
      s := ReadString('Graph', 'Config', '');
    finally
      free;
    end;
    if s <> '' then
      config.RestoreGraph(s)
    else
    begin
      cap.SaveGraph(config);
      if EditGraphConfig(config) then
      begin
        // StartWait;
        try
          cap.RestoreGraph(config);
        finally
          //   StopWait;
          Button1Click(Button1);
        end;
      end;
    end;
    Timer.Enabled := s <> '';
  end;
end;

procedure TfrmCapture.frxReport1GetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName='teP_ENAME' then begin
    Value := teP_ENAME.Text;
  end else if VarName='teP_PID' then begin
    Value := teP_PID.Text;
  end else if VarName='teP_SEX' then begin
    Value := teP_SEX.Text;
  end else if VarName='dtP_DATEBORN' then begin
    Value := dtP_DATEBORN.Text;
  end else if VarName='teAccessionNumber' then begin
    Value := teAccessionNumber.Text;
  end else if VarName='deStartDateWorklist' then begin
    Value := deStartDateWorklist.Text;
  end else
    Value:='';
end;

procedure TfrmCapture.capBitmapGrabbed(CapturedImage: TCapturedBitmap);
var d1: TDicomAttributes;
  ds1: TDicomDataset;
  v_StudyUID,
  v_StudyID,
  v_AccNmb,
  v_SeriesUID : string;
begin
    v_StudyUID:=gt_uniq_StudyUID;
    v_StudyID:=gt_uniq_StudyID;
    v_AccNmb:=gt_uniq_AccNmb;
    v_SeriesUID:=gt_uniq_SeriesUID;

    d1 := NewImage(CapturedImage, false);
    d1.AddVariant(dInstanceNumber, CaptureView.DicomDatasets.Count+1);
    d1.AddVariant(dSOPInstanceUID, gt_uniq_InstanceUID );  // !!! обязательно
    d1.AddVariant(dStudyInstanceUID,v_StudyUID);
    d1.AddVariant(dStudyID,v_StudyID );
    d1.AddVariant(dAccessionNumber,v_AccNmb);
    d1.AddVariant(dPatientName,'SID14 I.I.');
    d1.AddVariant(dPatientSex,'M');
    d1.AddVariant(dStudyDate,DateToStr(Dateof(Now)));
    d1.AddVariant(dModality,'MG');
    d1.AddVariant(dStudyDescription,'My test');
    d1.AddVariant(dSeriesInstanceUID,v_SeriesUID);

    d1.AddVariant(8, $16, '1.2.840.10008.5.1.4.1.1.7'); //sc - Secondary Capture Image Storage SOP Class
    d1.AddVariant(8, 8, 'ORIGINAL/PRIMARY//0001');
    d1.AddVariant(dPatientID,'QWERT_14');

    d1.Sort;

    if assigned(d1) then
    begin
      ds1 := TDicomDataset.Create(d1);
      v_ds_list.Add(ds1);
      if assigned(OnCaptureNewImage) then
        OnCaptureNewImage(self, ds1, fImageIndex);
      CnsDMTable1.Add(ds1);
      Inc(fImageIndex);
      CaptureView.RefreshNews;
      CaptureView.Last;
      CaptureView.UpdateScrollBars;
    end;
end;

procedure TfrmCapture.capCaptureProgress(Sender: TObject);
begin
  StatusBar.Panels[0].Text := 'Frames Captured ' + IntToStr(cap.NotDropped) +
    '. Frames Dropped ' + IntToStr(cap.FramesDropped) +
    '. Capture time ' + IntToStr(cap.CapTime div 1000) + '.' + IntToStr((cap.CapTime div 10) mod
    100);
  aStartCapVideo.Enabled := not cap.Capturing;
  aStopCapVideo.Enabled  := not aStartCapVideo.Enabled;
end;

procedure TfrmCapture.capChangeDevice(Sender: TObject);
var
  i, capCount: integer;
  cvcapMode, vcapMode: TVCapMode;
  cacapMode: TACapMode;
  s: string;
  d: TCaptureDialog;
begin
  cvcapMode := cap.VCapMode;
  cacapMode := cap.ACapMode;

//  self.Width := cvcapMode.Width + ControlPanelSize.cx;
//  self.Height := cvcapMode.Height + ControlPanelSize.cy;

  cbVModes.Items.Clear;
  capCount := cap.VCapModeCount;
  for i := 0 to capCount - 1 do
  begin
    vcapMode := cap.VCapModes[i];
    s := GetModeString(vcapMode);
    cbVModes.Items.Add(s);
    if IsEqualModes(cvcapMode, vcapMode) then
      cbVModes.ItemIndex := i;
  end;

  lbDialogs.Items.Clear;
  for d := Low(TCaptureDialog) to High(TCaptureDialog) do
    if d in cap.Dialogs then
    begin
      lbDialogs.Items.AddObject(DialogTitles[d], TObject(d));
    end;
end;

procedure TfrmCapture.capFrameRendered(Sender: TObject);
begin
  framecount := framecount + 1;
  lbFrames.Caption := Format('Frames passed: %d', [framecount]);
end;

procedure TfrmCapture.capStartPreview(Sender: TObject);
begin
  // refresh cur modes
  cbVModes.ItemIndex := cap.VCapModeIdx;
  //  cbAModes.ItemIndex := cap.VCapModeIdx;
  framecount := 0;
  lbFrames.Caption := '';
end;

procedure TfrmCapture.capStopPreview(Sender: TObject);
begin
  framecount := 0;
  lbFrames.Caption := '';
end;

function TfrmCapture.ChkItemInChecked(pi:Integer):Boolean;
var i :Integer; vNmbStr : string;
begin
  Result:=False;
  vNmbStr:=IntToStr(pi);
  for I := 0 to vImgCheckList.Count - 1 do
    if vImgCheckList[i]=vNmbStr then
    begin
    //  vImgCheckList.Delete(i);
      Result:=True;
      Break;
    end;
end;

procedure TfrmCapture.CaptureViewClick(Sender: TObject);
var i, vSelInd, vOldColor :Integer;
    vNmbStr : string;
    vChecked:Boolean;
    vCanvas : TCanvas;
    vBitmap32 : TCnsBitmap32;
    vOldStyle : TPenStyle;
    vBrushColor, vPenWidth : Integer;
const cWidth = 10;
      cBorder = 2 ;
begin
  vSelInd:=CaptureView.CurrentSelectedIndex;
  if (CnsDMTable1.Count>0) and (vSelInd>=0)
    and (vSelInd<CnsDMTable1.Count) then
  begin
    vNmbStr:=IntToStr(vSelInd);
    vChecked:=False;
    for I := 0 to vImgCheckList.Count - 1 do
      if vImgCheckList[i]=vNmbStr then
      begin
        vImgCheckList.Delete(i);
        vChecked:=True;
        Break;
      end;
    vBitmap32 := CaptureView.Bitmap[vSelInd];
    vCanvas   := vBitmap32.Canvas;
    vOldColor:=Canvas.Pen.Color;
    vOldStyle:=Canvas.Pen.Style;
    vBrushColor:=Canvas.Brush.Color;
    vPenWidth:=Canvas.Pen.Width;
    vBitmap32.BeginUpdate;
    try
      if vChecked then // отмена
      begin
        vCanvas.Brush.Color := clBlack;
        vCanvas.Pen.Color   := clBlack;
        vCanvas.Pen.Style   := psSolid ;
        vCanvas.Rectangle(vBitmap32.Width-cWidth,0,vBitmap32.Width,cWidth);
      end else
      begin
        vImgCheckList.Append(vNmbStr);
        vCanvas.Brush.Color := clWhite;
        vCanvas.Pen.Style   := psSolid ;
        vCanvas.Rectangle(vBitmap32.Width-cWidth,0,vBitmap32.Width,cWidth);
        vCanvas.Pen.Color   := ClRed;
        vCanvas.Pen.Width   := 2 ;
        vCanvas.MoveTo( vBitmap32.Width-cWidth+cBorder, Trunc(cBorder*2) );
        vCanvas.LineTo( Trunc(vBitmap32.Width-cWidth/2), cWidth-cBorder );
        vCanvas.LineTo( vBitmap32.Width-cBorder , cBorder );
      end;
    finally
      vBitmap32.EndUpdate;
      CaptureView.Refresh;
      Canvas.Pen.Color:=vOldColor;
      Canvas.Pen.Style:=vOldStyle;
      Canvas.Brush.Color:=vBrushColor;
      Canvas.Pen.Width:=vPenWidth;
    end;
  end;
end;

procedure TfrmCapture.CaptureViewDblClick(Sender: TObject);
begin
  if (CnsDMTable1.Count>0) and (CaptureView.CurrentSelectedIndex>=0)
    and (CaptureView.CurrentSelectedIndex<CnsDMTable1.Count) then
  begin
    cxPageControl1.ActivePageIndex:=1;
    CnsDMTable2.ClearList;
    CnsDMTable2.Add(CnsDMTable1.Item[CaptureView.CurrentSelectedIndex]);
  //  for I := 0 to CnsDMTable1.Count - 1 do
  //  begin
   //   if (v_TCNSTableSRC[i].Attributes.GetString(dStudyInstanceUID)=v_StudyUID) then
   //   begin
  //      CnsDMTable2.Add(CnsDMTable1.Item[i]);
    //  end;
  //  end;
    DicomMultiVIewer1.LimitOneSeries:=False;
    DicomMultiVIewer1.Update;
  end;
end;

procedure TfrmCapture.Button2Click(Sender: TObject);
begin
  cap.SaveGraph(config);
  if EditGraphConfig(config) then
  begin
    // StartWait;
    try
      cap.RestoreGraph(config);
    finally
      //   StopWait;
    end;
  end;
end;

procedure TfrmCapture.Button3Click(Sender: TObject);
begin
  cxPageControl1.ActivePageIndex:=0;
end;

procedure TfrmCapture.Button1Click(Sender: TObject);
var ini1: TIniFile;
begin
  if (cap.CaptureGraph = nil) then
    Exit;

  cap.SaveGraph(config);

  ini1 := TIniFile.Create('Video.ini');

  ini1.WriteString('Graph', 'Config', config.SaveGraph);
  ini1.Free;
end;

procedure TfrmCapture.SpeedButton1Click(Sender: TObject);
begin
  if (lbDialogs.Items.Count > 0) and (lbDialogs.ItemIndex >= 0) then
    cap.ShowDialog(TCaptureDialog(lbDialogs.Items.Objects[lbDialogs.ItemIndex]));
end;

procedure TfrmCapture.teP_PIDPropertiesChange(Sender: TObject);
begin
  SetAN;
end;

procedure TfrmCapture.SetAN;
var v_now : TDateTime;
begin
  v_now := Now;
  teAccessionNumber.Text := teModality.Text+'-'+teP_PID.Text+'/'+
            IntToStr(Yearof(v_now))+'.'+
            IntToStr(Monthof(v_now))+'.'+
            IntToStr(Dayof(v_now))+'.'+
            IntToStr(Hourof(v_now))+'.'+
            IntToStr(Minuteof(v_now)) ;
end;

procedure TfrmCapture.TimerTimer(Sender: TObject);
begin
  // make a delay to show form (let form get a handle)
  Timer.Enabled := false;
  //  StartWait;
  try
    cap.RestoreGraph(config);
  finally
    //    StopWait;
  end;
end;

procedure TfrmCapture.aAttachExecute(Sender: TObject);
var vDicomDataSets : TDicomDatasets;
begin
  if fchkFullDataInForm then Exit;
  if CaptureView.DicomDatasets.Count > 0 then
    begin
      vDicomDataSets:=CaptureView.DicomDatasets;
      pAddAttrToDicomDataset(vDicomDataSets);
      ModalResult := mrOk;
    end else
    begin
      MessageDlg('Внимание!'+#13+#10+'Для того, чтобы вставить снимки в текст протокола, должен быть сделан хотя бы один снимок!', mtConfirmation, [mbOK], 0);
    end;
end;

procedure TfrmCapture.aCaptureExecute(Sender: TObject);
begin
  try
    if not cap.CaptureFrame then
      ShowMessage('Невозможно получить изображение!');
  except
    on E:Exception do
      MessageDlg('Ошибка : '+E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TfrmCapture.ShowRejim;
begin
  if not vRejim then
  begin
    aChngRejim.Caption := 'Снять Гор.клав.';
    aChngRejim.Hint := 'Снять обработку "горячих" клавиш для '+#13+
                       'ввода данных о пациенте (доступны все символы)';
  end else begin
    aChngRejim.Caption := 'Установить Гор.клав.';
    aChngRejim.Hint := 'Установить обработку "горячих" клавиш '+#13+
                       '(в этом случае некоторые символы недоступны '+#13+
                       'для ввода данных о пациенты)';
  end;
end;

procedure TfrmCapture.aChngRejimExecute(Sender: TObject);
begin  // смена режима
  vRejim:=not vRejim;
  ShowRejim;
  SetShortCutsOfHotKeys;
end;

procedure TfrmCapture.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmCapture.aDelCheckedExecute(Sender: TObject);
var i, j : integer;
  //  Fbm : TBitmap;
    vStrLstTmp : TStringList;
    vFnd : Boolean;
begin  // Удалить выделенные снимки/видео
  if vImgCheckList.Count>0 then
  begin
    CaptureView.DicomDatasets := nil;
    vStrLstTmp := TStringList.Create;
    try
      // сформируем список на удаление - те что неотмеченные
      for i := 0 to CnsDMTable1.Count - 1 do
      begin
        vFnd:=False;
        for j := 0 to vImgCheckList.Count - 1 do
          if StrToInt( vImgCheckList[j] ) = i then
          begin
            vFnd:=True;
            Break;
          end;
        if not vFnd then
          vStrLstTmp.Append( IntToStr(i) );
      end;

    {  vSelInd:=CaptureView.CurrentSelectedIndex;
      vNmbStr:=IntToStr(vSelInd);
      vImgCheckList.Append(vNmbStr);  }

      //
      CnsDMTable3.ClearList;
      for I := 0 to vStrLstTmp.Count - 1 do
      begin
        CnsDMTable3.Add( CnsDMTable1.Item[ strToInt(vStrLstTmp[i]) ] );
      end;
      CnsDMTable1.ClearList;
      for i:=0 to CnsDMTable3.Count-1 do
        CnsDMTable1.AddDicomDataset( CnsDMTable3.Item[i] );
      CnsDMTable3.ClearList;
      vImgCheckList.Clear;

    {  Fbm := TBitmap.Create;
      try
        DCM_ImageData_Bitmap.AssignToBitmap(CnsDMTable1.Item[ 0 ].Attributes.ImageData, Fbm);
        FBM.SaveToFile('d:\0.bmp');

      finally
        Fbm.Free;
      end; }
    finally
      vStrLstTmp.Free;
      CaptureView.DicomDatasets := CnsDMTable1;
    end;

    CaptureView.Refresh;
  end else
    MessageDlg('Нет выделенных снимков ...', mtWarning, [mbOK], 0);
end;

procedure TfrmCapture.aPrintExecute(Sender: TObject);
var vDicomDataSets: TDicomDataSets;
    i, vMaxWidth, vMaxHeight : Integer;
    v_DCMAttr : TDicomAttributes;
    FileName1, AFileName, vCurDirectory,
    vTempDir, vSubDirTmp : AnsiString;
    bmp: TBitmap;
    avi1: TCnsAVIReader;
begin //  Печать снимков (видео не печатается)
  if fchkFullDataInForm then Exit;
  Screen.Cursor := crHourGlass;
  try
    vCurDirectory:=GetCurrentDir;
    if (CaptureView.DicomDatasets.Count>0) then
    begin
      mdPrintList.Open;
      vTempDir:=Trim(GetTempDirectory);
      vDicomDataSets:=CaptureView.DicomDatasets;
      vMaxWidth := 0;
      vMaxHeight := 0;
      for I := 0 to vDicomDataSets.Count - 1 do
      begin
        if (cbCheckedImages.Checked and (not ChkItemInChecked(i))) then Continue;
        v_DCMAttr:=CaptureView.DicomDatasets.Item[i].Attributes;
        AFileName:=gt_avi_filename( v_DCMAttr.getInteger(dInstanceNumber) );
        //
        // SetCurrentDir(vTempDir);
        FileName1:=vTempDir+'\'+inttostr(GetTickCount)+'.bmp';
        // преобразуем видео в DICOM - найдем имя файла по dInstanceNumber
        if (FileExists(AFileName)) and (Trim(AFileName)<>'') then  // если видео !!!!!!!
        begin
          Continue;
        {  avi1 := TCnsAVIReader.Create;
          try
            if (avi1.Open(AFileName) >= 0) then
            begin
               FrmProgressBar.MyIncPosMain(
                 ' Отправка видео '+inttostr(i+1)+'/'+inttostr(CaptureView.DicomDatasets.Count));
               // инициализация второго ползунка
               FrmProgressBar.clc_posMain( avi1.Ending-avi1.Start-2, // 0-не отображать ползунок
                                'Сохранение видео',
                                 False
                              );
              bmp := avi1.GetFrame(avi1.Start);
              bmp.SaveToFile(FileName1);
              if vMaxWidth<bmp.Width then vMaxWidth:=bmp.Width;
              if vMaxHeight<bmp.Height then vMaxHeight:=bmp.Height;
            end;
          finally
            avi1.Free;
          end; }
        end else begin // просто снимки
          bmp := TBitmap.Create;
          try
            DCM_ImageData_Bitmap.AssignToBitmap(v_DCMAttr.ImageData, bmp,False);
            bmp.SaveToFile(FileName1);
            if vMaxWidth<bmp.Width then vMaxWidth:=bmp.Width;
            if vMaxHeight<bmp.Height then vMaxHeight:=bmp.Height;
          finally
            bmp.Free;
          end;
        end;
        mdPrintList.Append;
        mdPrintList.FieldByName('npp').AsInteger:=i;
        mdPrintList.FieldByName('filename').AsString:=FileName1;
        mdPrintList.Post;  
      end;

      (frxReport1.FindObject('Picture1') as TfrxPictureView).Height := vMaxHeight;
      (frxReport1.FindObject('Picture1') as TfrxPictureView).Width := vMaxWidth;
      (frxReport1.FindObject('MasterData1') as TfrxMasterData).Height := (frxReport1.FindObject('Picture1') as TfrxPictureView).Height;

      frxReport1.ShowReport;

    end;
  finally
    mdPrintList.Open;
    mdPrintList.First;
    while not mdPrintList.Eof do
    begin
      if FileExists(mdPrintList.FieldByName('filename').AsString) then
        DeleteFile(mdPrintList.FieldByName('filename').AsString);
      mdPrintList.Next;
    end;
    mdPrintList.Close;
    SetCurrentDir(vCurDirectory);
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCapture.OnWriteFrame(Sender: TObject; AIndex: Integer; Ammount: Integer);
begin
  FrmProgressBar.PBMain.Properties.Max := Ammount;
  FrmProgressBar.MyIncPos('Сохранение видео ' +
                     inttostr(AIndex)+'/'+inttostr(Ammount));
end;

procedure TfrmCapture.aSaveExecute(Sender: TObject);
var v_TransactionUID,
    v_Dir, v_FileName, AFileName,
    v_fio : string;
    i, k, l :integer;
    v_DCMAttr:TDicomAttributes;
    da1: TDicomAttribute;
    dimage: TDicomImageData;
    p1: Pointer;
    ALen, x, y: Integer;
    avi1: TCnsAVIReader;
    bmp: TBitmap;
    DestScanline: pRGBs;
    prgb1: pRGB;
    rndd, rndd1 : string;
    vDicomDataSets : TDicomDatasets;
begin // save to file
  if fchkFullDataInForm then Exit;
// проверим есть ли видео
  if CaptureView.DicomDatasets.Count>0 then
  begin
    vDicomDataSets:=CaptureView.DicomDatasets;
    pAddAttrToDicomDataset(vDicomDataSets);
    FileOpenDialogDCM.DefaultFolder:=ExtractFilePath(Application.ExeName);
    FileOpenDialogDCM.Options:=[fdoPickFolders];
    if FileOpenDialogDCM.Execute then
    begin
      v_Dir := FileOpenDialogDCM.FileName + '\';
      Application.CreateForm(TFrmProgressBar, FrmProgressBar);
      try
        Screen.Cursor := crHourGlass;
        CmnUnit.v_exit_progressbar:=0;
        // инициализируем ползунок - чтобы что-то показать
        FrmProgressBar.clc_pos( False, // is_on_top
                            'Сохранение исследования',
                            CaptureView.DicomDatasets.Count,
                            (CaptureView.DicomDatasets.Count=1)
                          );
        FrmProgressBar.clc_posMain( 0, // 0-не отображать ползунок
                                'Сохранение видео',
                                 (CaptureView.DicomDatasets.Count=1)
                             );
        // инициализация переменных для ползунка
        MyIniMove;
        for I := 0 to CaptureView.DicomDatasets.Count - 1 do
        begin
            if (cbCheckedImages.Checked and (not ChkItemInChecked(i))) then Continue;
            v_DCMAttr:=CaptureView.DicomDatasets.Item[i].Attributes;
            v_DCMAttr.AddVariant($0008, $1195, v_TransactionUID);
            //
            rndd:=gt_random_str;
            rndd1 := '14';
            v_DCMAttr.AddVariant(dPatientName,'SID'+rndd1+' I.I.');
            v_DCMAttr.AddVariant(dPatientSex,'M');
            v_DCMAttr.AddVariant(dStudyDate,DateToStr(Dateof(Now)));
            //
            //
            v_DCMAttr.AddVariant(dModality,'MG');
            v_DCMAttr.AddVariant(dStudyDescription,'My test');
           // v_DCMAttr.Remove($0008, $0018);  // dSOPInstanceUID
           // v_DCMAttr.AddVariant(dSOPInstanceUID,'SOPIUID'+rndd1);
            v_DCMAttr.Sort;
            //
            if CmnUnit.v_exit_progressbar=1 then Break;
            FrmProgressBar.MyIncPosMain(
                     ' Сохранение видео '+inttostr(i+1)+'/'+inttostr(CaptureView.DicomDatasets.Count));
            //
            // преобразуем видео в DICOM
            // найдем имя файла по
            // dInstanceNumber
            AFileName:=gt_avi_filename( v_DCMAttr.getInteger(dInstanceNumber) );
            if (FileExists(AFileName)) and (Trim(AFileName)<>'') then
            begin
              v_DCMAttr.AddVariant(dPatientID,'QWERT_'+rndd1);
              v_DCMAttr.AddVariant(dStudyInstanceUID,'SUID_'+rndd1);
              v_DCMAttr.AddVariant(dStudyID,'SID'+rndd1 );
              v_DCMAttr.AddVariant(dAccessionNumber,'ACCN'+rndd1);
              v_DCMAttr.AddVariant(dSeriesInstanceUID,'SIUID'+rndd1);
              v_DCMAttr.Sort;
              avi1 := TCnsAVIReader.Create;
              try
                if (avi1.Open(AFileName) >= 0) then
                begin
                  // инициализация второго ползунка
                  FrmProgressBar.clc_posMain( avi1.Ending, // 0-не отображать ползунок
                                    'Преобразование видео в DICOM',
                                     (CaptureView.DicomDatasets.Count=1)
                                  );
                  bmp := avi1.GetFrame(avi1.Start);
                  ALen := bmp.Width * bmp.Height * 3;
                  da1 := v_DCMAttr.Add(32736, 16);
                  for l := avi1.Start + 1 to avi1.Ending - 1 do
                  begin
                    if CmnUnit.v_exit_progressbar=1 then Break;
                    FrmProgressBar.MyIncPos('Конвертация фреймов '+inttostr(l+1)+'/'+inttostr(avi1.Ending));
                    bmp := avi1.GetFrame(l);
                    if bmp <> nil then
                    try
                      GetMem(p1, alen);
                      prgb1 := p1;
                      for y := 0 to bmp.Height - 1 do // Iterate
                      begin
                        DestScanline := bmp.ScanLine[y];
                        for x := 0 to bmp.Width - 1 do
                        begin
                          CopyMemory(prgb1, destscanline, 3);
                          {
                          prgb1^.b := DestScanLine^.b;
                          prgb1^.g := DestScanLine^.g;
                          prgb1^.r := DestScanLine^.r;
                          }
                          inc(prgb1);
                          inc(DestScanline);
                        end;
                      end;
                      dimage := TDicomImageData.Create(ImplicitVRLittleEndian, p1, ALen);
                      da1.AddData(dimage);
                    finally
                      bmp.free;
                    end;
                  end;
                end;
              finally
                avi1.Free;
              end;
              // сохраним датасет
              // инициализация второго ползунка
              FrmProgressBar.clc_posMain( CaptureView.DicomDatasets.Item[i].Attributes.Count, // 0-не отображать ползунок
                                    'Сохранение видео',
                                     (CaptureView.DicomDatasets.Count=1)
                                  );
              // назначение события по всем атрибутам где фреймов >1
              for k := 0 to CaptureView.DicomDatasets.Item[i].Attributes.Count - 1 do
                if CaptureView.DicomDatasets.Item[i].Attributes.ItemByIndex[k].DataArray.Count>1 then
                  CaptureView.DicomDatasets.Item[i].Attributes.ItemByIndex[k].OnWriteFrame := OnWriteFrame;
              // сохранение в файл
              v_fio:=v_DCMAttr.GetString(dPatientName);
              p_repl_smb(v_fio);
              v_FileName:=v_fio+IntToStr(i+1)+'.dcm';
              //
              CaptureView.DicomDatasets.Item[i].SaveToFile(v_Dir+'\'+v_FileName, True, 8197, 100);
              // снятие события по всем атрибутам где фреймов >1
              for k := 0 to CaptureView.DicomDatasets.Item[i].Attributes.Count - 1 do
                if CaptureView.DicomDatasets.Item[i].Attributes.ItemByIndex[k].DataArray.Count>1 then
                  CaptureView.DicomDatasets.Item[i].Attributes.ItemByIndex[k].OnWriteFrame := nil;
            end else
            begin
              // сохраним просто снимок
              // сохранение в файл
              v_fio:=v_DCMAttr.GetString(dPatientName);
              p_repl_smb(v_fio);
              v_FileName:=v_fio+IntToStr(i+1)+'.dcm';
              //
              CaptureView.DicomDatasets.Item[i].SaveToFile(v_Dir+'\'+v_FileName, True, 8197, 100);  //  8197
            end;
        end;
      //  CaptureView.DicomDatasets.
      //  CaptureView.DicomDatasets.Count
      finally
        chk_close; // закроем ползунок
        FreeAndNil(FrmProgressBar);
        Screen.Cursor := crDefault;
      end;
      // -------------------------------------------------------------------------
    end;
  end;
end;

procedure TfrmCapture.aSendExecute(Sender: TObject);
var CnsDicomConnection1 : TCnsDicomConnection;
    v_TransactionUID,
    AFileName : string;
    i, k, l :integer;
    v_DCMAttr:TDicomAttributes;
    da1: TDicomAttribute;
    dimage: TDicomImageData;
    p1: Pointer;
    ALen, x, y: Integer;
    avi1: TCnsAVIReader;
    bmp: TBitmap;
    DestScanline: pRGBs;
    prgb1: pRGB;
    v_is_ok : boolean;
  function DataSend : boolean;
  begin
    CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
    try
      CnsDicomConnection1.Host := Host;
      CnsDicomConnection1.Port := StrToInt(Port);
      CnsDicomConnection1.CalledTitle := CalledAE;
      CnsDicomConnection1.CallingTitle := CallingAE;
      CnsDicomConnection1.ReceiveTimeout := c_Timeout;
      DCM_Connection.PDUTempPath:=GetTempDirectory;
      //
    //  CnsDicomConnection1.SetTransferSyntax([v_DCMAttr.ImageData.ImageData[0].TransferSyntax]);
      //
      try
        if not CnsDicomConnection1.C_STORAGE(v_DCMAttr)
        then v_is_ok:=False;
      except
        v_is_ok:=False;
      end;
    finally
      MyDisconnectAssociation(CnsDicomConnection1);
      CnsDicomConnection1.Free;
    end;
    Result:=v_is_ok;
  end;
var vDicomDataSets : TDicomDatasets;  
begin
  if fchkFullDataInForm then Exit;
  // проверим есть ли видео
  if CaptureView.DicomDatasets.Count>0 then 
  begin
    vDicomDataSets:=CaptureView.DicomDatasets;
    pAddAttrToDicomDataset(vDicomDataSets);
    v_is_ok:=True;
    FileOpenDialogDCM.DefaultFolder:=ExtractFilePath(Application.ExeName);
    FileOpenDialogDCM.Options:=[fdoPickFolders];
    Application.CreateForm(TFrmProgressBar, FrmProgressBar);
    try
        Screen.Cursor := crHourGlass;
        //
        CmnUnit.v_exit_progressbar:=0;
        // инициализируем ползунок - чтобы что-то показать
        FrmProgressBar.clc_pos( False, // is_on_top
                    'Сохранение исследования пациента',
                    CaptureView.DicomDatasets.Count,
                    (CaptureView.DicomDatasets.Count=1)
                  );
        FrmProgressBar.clc_posMain( 0, // 0-не отображать ползунок
                        'Отправка снимка',
                         (CaptureView.DicomDatasets.Count=1)
                      );
        // инициализация переменных для ползунка
        MyIniMove;

        for I := 0 to CaptureView.DicomDatasets.Count - 1 do
        begin
            if (cbCheckedImages.Checked and (not ChkItemInChecked(i))) then Continue;
            if CmnUnit.v_exit_progressbar=1 then Break;
            v_DCMAttr:=CaptureView.DicomDatasets.Item[i].Attributes;
            AFileName:=gt_avi_filename( v_DCMAttr.getInteger(dInstanceNumber) );
            //
            v_TransactionUID:=GenTransactionUID(CallingAE);
            v_DCMAttr.AddVariant($0008, $1195, v_TransactionUID);
            v_DCMAttr.Sort;
            //
            if CmnUnit.v_exit_progressbar=1 then Break;
            // преобразуем видео в DICOM - найдем имя файла по dInstanceNumber
            if (FileExists(AFileName)) and (Trim(AFileName)<>'') then
            begin
              avi1 := TCnsAVIReader.Create;
              try
                if (avi1.Open(AFileName) >= 0) then
                begin
                   FrmProgressBar.MyIncPosMain(
                     ' Отправка видео '+inttostr(i+1)+'/'+inttostr(CaptureView.DicomDatasets.Count));
                   // инициализация второго ползунка
                   FrmProgressBar.clc_posMain( avi1.Ending-avi1.Start-2, // 0-не отображать ползунок
                                    'Сохранение видео',
                                     False
                                  );
                  bmp := avi1.GetFrame(avi1.Start);
                  ALen := bmp.Width * bmp.Height * 3;
                  da1 := v_DCMAttr.Add(32736, 16);
                  for l := avi1.Start + 1 to avi1.Ending - 1 do
                  begin
                    if CmnUnit.v_exit_progressbar=1 then Break;
                    FrmProgressBar.MyIncPos('Конвертация фреймов '+inttostr(l-(avi1.Start + 1)+1)+'/'+inttostr(avi1.Ending-avi1.Start-1));
                    bmp := avi1.GetFrame(l);
                    if bmp <> nil then
                    try
                      GetMem(p1, alen);
                      prgb1 := p1;
                      for y := 0 to bmp.Height - 1 do // Iterate
                      begin
                        DestScanline := bmp.ScanLine[y];
                        for x := 0 to bmp.Width - 1 do
                        begin
                          CopyMemory(prgb1, destscanline, 3);
                          inc(prgb1);
                          inc(DestScanline);
                        end;
                      end;
                      dimage := TDicomImageData.Create(ImplicitVRLittleEndian, p1, ALen);
                      da1.AddData(dimage);
                    finally
                      bmp.free;
                    end;
                  end;
                end;
              finally
                avi1.Free;
              end;
              if CmnUnit.v_exit_progressbar=1 then Break;
              // сохраним датасет
              // инициализация второго ползунка
              FrmProgressBar.clc_posMain( CaptureView.DicomDatasets.Item[i].Attributes.Count, // 0-не отображать ползунок
                                    'Сохранение видео',
                                     False
                                  );
              // назначение события по всем атрибутам где фреймов >1
              for k := 0 to CaptureView.DicomDatasets.Item[i].Attributes.Count - 1 do
                if CaptureView.DicomDatasets.Item[i].Attributes.ItemByIndex[k].DataArray.Count>1 then
                  CaptureView.DicomDatasets.Item[i].Attributes.ItemByIndex[k].OnWriteFrame := OnWriteFrame;
              v_is_ok:=DataSend;
              if not v_is_ok then break;
              // снятие события по всем атрибутам где фреймов >1
              for k := 0 to CaptureView.DicomDatasets.Item[i].Attributes.Count - 1 do
                if CaptureView.DicomDatasets.Item[i].Attributes.ItemByIndex[k].DataArray.Count>1 then
                  CaptureView.DicomDatasets.Item[i].Attributes.ItemByIndex[k].OnWriteFrame := nil;
              da1.Clear;
            end else
            begin
              FrmProgressBar.MyIncPosMain(
               ' Отправка снимков '+inttostr(i+1)+'/'+inttostr(CaptureView.DicomDatasets.Count));
              // инициализация второго ползунка
              FrmProgressBar.clc_posMain( 1, // 0-не отображать ползунок
                              'Сохранение видео',
                               False
                            );
              v_is_ok:=DataSend;
              if not v_is_ok then break;
            end;
            if CmnUnit.v_exit_progressbar=1 then Break;
        end;
    finally
      if v_is_ok then
        if CmnUnit.v_exit_progressbar=1 then
          MessageDlg('Передача снимков прервана', mtInformation, [mbOK], 0)
        else
        begin
          MessageDlg('Снимки отправлены на PACS', mtInformation, [mbOK], 0);
          // если вошли из-под web то после отправки выходим
          // чтобы уменьшить риск повторной отправки тех же исследований
          if vIsFromWeb then ModalResult:=mrOk;
          if cbCleanData.Checked then
            FldClr;
        end
      else
          MessageDlg('Снимки не отправлены ...', mtError, [mbOK], 0);
      chk_close; // закроем ползунок
      FreeAndNil(FrmProgressBar);
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCapture.aSetHotKeysExecute(Sender: TObject);
begin  // Configure hot keys
  Application.CreateForm(TfOptions, fOptions);
  try
    fOptions.hkKadr.Hotkey := v_hkKadr ;
    fOptions.hkStartVideo.Hotkey := v_hkStartVideo ;
    fOptions.hkStopVideo.Hotkey := v_hkStopVideo ;
    if fOptions.ShowModal=mrOK then
    begin
      v_hkKadr       := fOptions.hkKadr.HotKey;  // 16449
      v_hkStartVideo := fOptions.hkStartVideo.Hotkey; // 16467
      v_hkStopVideo  := fOptions.hkStopVideo.Hotkey;   // 16452
      s_hkKadr       := ShortCutToText(v_hkKadr);
      s_hkStartVideo := ShortCutToText(v_hkStartVideo);
      s_hkStopVideo  := ShortCutToText(v_hkStopVideo);
      SetShortCutsOfHotKeys;
    end;
  finally
    fOptions.Free;
  end;
end;

procedure TfrmCapture.aStartCapVideoExecute(Sender: TObject);
begin
  try
    cap.StartCapture(true);
    capCaptureProgress(Self);
    vStartCaptureVideo:=True;
    aStopCapVideo.Enabled:=True;
  except
    on E:Exception do
      MessageDlg('Ошибка : '+E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TfrmCapture.aStopCapVideoExecute(Sender: TObject);
var d1: TDicomDataset;
    dimage: TDicomImageData;
    p1: Pointer;
    ALen: Integer;
    x, y: Integer;
    avi1: TCnsAVIReader;
    da1: TDicomAttribute;
    bmp: TBitmap;
    DestScanline: pRGBs;
    prgb1: pRGB;
    v_int_to_db : integer;
    v_filename, v_filename1 : ansistring;
    v_StudyUID,
    v_StudyID,
    v_AccNmb,
    v_SeriesUID : string;
begin
  if vStartCaptureVideo then  
  try
    cap.StopCapture;
    capCaptureProgress(Self);
    //Save the AVI to Dicom Cine
    d1 := TDicomDataset.Create;
      v_filename1:='capture.avi';
      d1.Attributes.Clear;
      v_int_to_db:=0;
      avi1 := TCnsAVIReader.Create;
      try
        if avi1.Open(v_filename1) >= 0 then
        begin
          Application.CreateForm(TFrmProgressBar, FrmProgressBar);
          try
            Screen.Cursor := crHourGlass;

            bmp := avi1.GetFrame(avi1.Start);

            v_StudyUID:=gt_uniq_StudyUID;
            v_StudyID:=gt_uniq_StudyID;
            v_AccNmb:=gt_uniq_AccNmb;
            v_SeriesUID:=gt_uniq_SeriesUID;

           // d1.Attributes.Remove($0008, $0018);  // dSOPInstanceUID = 63;
            d1.Attributes.AddVariant(dSOPInstanceUID, gt_uniq_InstanceUID );
            // STUDY
            d1.Attributes.AddVariant(dSeriesInstanceUID, v_SeriesUID );
            d1.Attributes.AddVariant(dStudyInstanceUID, v_StudyUID );
            d1.Attributes.AddVariant(dStudyID, v_StudyID );
            d1.Attributes.AddVariant(dAccessionNumber, v_AccNmb );

            d1.Attributes.AddVariant(8, $16, '1.2.840.10008.5.1.4.1.1.7'); //sc - Secondary Capture Image Storage SOP Class
            d1.Attributes.AddVariant(8, 8, 'ORIGINAL/PRIMARY//0001');
            d1.Attributes.AddVariant(dPatientID,'QWERT_14');
            //
            d1.Attributes.AddVariant(dPatientName,'SID14 I.I.');
            d1.Attributes.AddVariant(dPatientSex,'M');
            d1.Attributes.AddVariant(dStudyDate,DateToStr(Dateof(Now)));
            //
            //
            d1.Attributes.AddVariant(dModality,'MG');
            d1.Attributes.AddVariant(dStudyDescription,'My test');

            v_int_to_db:=CaptureView.DicomDatasets.Count+1;
            d1.Attributes.AddVariant(dInstanceNumber, v_int_to_db );

            d1.Attributes.Add(8, $20).AsDatetime[0] := now;
            d1.Attributes.Add(8, $21).AsDatetime[0] := now;
            d1.Attributes.Add(8, $23).AsDatetime[0] := now;
            d1.Attributes.Add(8, $30).AsDatetime[0] := now;
            d1.Attributes.Add(8, $33).AsDatetime[0] := now;

            //  Result.AddVariant($20, $13, AImageIndex);
            d1.Attributes.AddVariant($28, $11, bmp.Width);
            d1.Attributes.AddVariant($28, $10, bmp.Height);

            ALen := bmp.Width * bmp.Height * 3;

            d1.Attributes.AddVariant($28, $8, avi1.Ending - avi1.Start - 1);
            d1.Attributes.AddVariant($28, $2, 3);
            d1.Attributes.AddVariant($28, $4, 'RGB');

            //ADataset.AddVariant($28, $2, 1);
            //ADataset.AddVariant($28, $4, 'MONOCHROME2');

            d1.Attributes.AddVariant($28, $100, 8);
            d1.Attributes.AddVariant($28, $101, 8);
            d1.Attributes.AddVariant($28, $102, 8 - 1);

            da1 := d1.Attributes.Add(32736, 16);

          // снимок на заставке справа
          // ---------------------------------------------------------------------

            GetMem(p1, alen);
            //Move(avi1.Punter^, p1^, ALen);
            prgb1 := p1;

            Application.CreateForm(TFrmProgressBar, FrmProgressBar);
            try
              CmnUnit.v_exit_progressbar:=0;
              // инициализируем ползунок - чтобы что-то показать
              FrmProgressBar.clc_pos( False, // is_on_top
                              'Преобразование видео в DICOM',
                              bmp.Height, // кол-во
                              True   // один ползунок
                            );
              FrmProgressBar.clc_posMain( bmp.Height, // 0-не отображать ползунок
                                'Преобразование видео в DICOM',
                                 True
                              );
              // инициализация переменных для ползунка
              MyIniMove;

           //   t1 := Now;
              for y := 0 to bmp.Height - 1 do // Iterate
              begin
                FrmProgressBar.MyIncPos('Преобразование видео в DICOM ');
                DestScanline := bmp.ScanLine[y];
                for x := 0 to bmp.Width - 1 do
                begin
                  CopyMemory(prgb1, destscanline, 3);
                {  prgb1^.b := DestScanLine^.b;
                  prgb1^.g := DestScanLine^.g;
                  prgb1^.r := DestScanLine^.r; }
                  inc(prgb1);
                  inc(DestScanline);
                end;
              end;
              dimage := TDicomImageData.Create(ImplicitVRLittleEndian, p1, ALen);
              da1.AddData(dimage);

           //   MessageDlg('время в мс = '+inttostr(MillisecondsBetween(t1,Now)), mtWarning, [mbOK], 0);

            finally
              chk_close; // закроем ползунок
              FreeAndNil(FrmProgressBar);
            end;
          finally
            chk_close; // FreeAndNil(FrmProgressBar);
            screen.cursor := crDefault;
          end;
        end;
      finally
        avi1.Free;
      end;
      if v_int_to_db>0 then
      begin
        // загрузим видео в таблицу в памяти
        try
          Screen.Cursor := crHourGlass;
          // переименуем файл
          v_filename:=v_user_cat+'f_avi_video_'+IntToStr(GetTickCount)+'.tmp';
          MoveFile(PChar(v_filename1),PChar(v_filename));
          // запишем ссылку в базу
          frmCapture.dxMemData1.Append;
          frmCapture.dxMemData1.FieldByName('npp').AsInteger := v_int_to_db;
          frmCapture.dxMemData1.FieldByName('filename').AsString := v_filename;
          frmCapture.dxMemData1.Post;
          // запишем ссылку на него в текстовый файл
           MnFl_ev( v_filename, frmCapture.v_user_file, False, False );
        finally
          Screen.Cursor := crDefault;
        end;
      end;
    TCnsDMTable(CaptureView.DicomDatasets).AddDicomDataset(d1);
    //
    if assigned(OnCaptureNewImage) then
      OnCaptureNewImage(self, d1, fImageIndex);
    inc(fImageIndex);
    //
    CaptureView.RefreshNews;
    CaptureView.Last;
    CaptureView.UpdateScrollBars;
    //
    vStartCaptureVideo:=False;
  except
    on E:Exception do
      MessageDlg('Ошибка : '+E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TfrmCapture.aWLCheckExecute(Sender: TObject);
var vFocusedRowIndex : integer; vStrTmp : string; vDateTmp : TDateTime ;
begin  // Выбор пациента из WL
  if ((TV.DataController.RecordCount>0) and (TV.DataController.FocusedRowIndex>=0)) then
  begin
    with TV.DataController do
    begin
      vFocusedRowIndex := FocusedRowIndex ;

      teP_ENAME.Text := Values[vFocusedRowIndex, vPatientName.Index] ;
      teP_PID.Text   := Values[vFocusedRowIndex, VPatientID.Index] ;
      teP_SEX.Text   := Values[vFocusedRowIndex, VPatientSex.Index] ;
      teModality.Text := Values[vFocusedRowIndex, VModality.Index] ;
      teAccessionNumber.Text := Values[vFocusedRowIndex, VAccessionNumber.Index] ;
      teStudyUID.Text := Values[vFocusedRowIndex, VStudyInstanceUID.Index] ;

      vStrTmp := Values[vFocusedRowIndex, VPatientBirthDate.Index];
      if not TryStrToDate( vStrTmp, vDateTmp ) then
        vDateTmp := EncodeDate(1900,1,1);
      dtP_DATEBORN.Date := vDateTmp;

      vStrTmp := Values[vFocusedRowIndex, VScheduledProcedureStepStartDate.Index];
      if not TryStrToDate( vStrTmp, vDateTmp ) then
        vDateTmp := Date;
      deStartDateWorklist.Date := vDateTmp;
    end;
    cxPageControl2.ActivePage := cxTabSheet1 ;
  end else
    MessageDlg('Пациент не выбран ...', mtWarning, [mbOK], 0);
end;

procedure TfrmCapture.aWLRefreshExecute(Sender: TObject);
var das, da2: TDicomAttributes;
    dd: TDicomAttribute;
    i: Integer;
    CnsDicomConnection1: TCnsDicomConnection;
begin  // Обновить WL
  // запрос к worklist
  CnsDicomConnection1 := TCnsDicomConnection.Create(Self);
  try
    CnsDicomConnection1.v_is_log := True;
    CnsDicomConnection1.v_log_filename := 'mwl_scu.log';

    CnsDicomConnection1.Host := WLHost;
    try
      CnsDicomConnection1.Port := StrToInt(WLPort);
    except
      CnsDicomConnection1.Port := 0;
    end;
    CnsDicomConnection1.CalledTitle := WLCalledAE;
    CnsDicomConnection1.CallingTitle := WLCallingAE;
    //
    das := TDicomAttributes.Create;
    with das do
    begin
      Add($0008, $0050); //(AccessionNumber)SH=<0>NULL
      Add($0008, $0090); //(ReferringPhysiciansName)PN=<0>NULL

     { if ((Edit6.Text <> '') and CheckBox3.Checked) then
        Add($0010, $0010).AsString[0] := Edit6.Text
      else }
        Add($0010, $0010); //(PatientName)PN=<0>NULL

    {  if ((Edit5.Text <> '') and CheckBox2.Checked) then
        Add($0010, $0020).AsString[0] := Edit5.Text
      else    }
        Add($0010, $0020); //(PatientID)LO=<1>

      Add($0010, $0030); //(PatientBirthDate)DA=<0>NULL
      Add($0010, $0040); //(PatientSex)CS=<0>NULL
      Add($0020, $000D); //(StudyInstanceUID)UI=<0>NULL
      Add($0032, $1060); //(RequestedProcedureDescription)LO=<0>NULL
      dd := Add($0040, $0100); //(ScheduledProcedureStepSequence)SQ=<1>Sequence Data
      da2 := TDicomAttributes.Create;
      dd.AddData(da2);

     { if CheckBox1.Checked then
        da2.AddVariant($0008, $0060, ComboBox1.Text); //(Modality)CS=<1>DX
      else }
        Add($0010, $0020);  //(Modality)CS=<1>DX

      da2.Add($0040, $0001); //(ScheduledStationAETitle)AE=<1>HBLB

     { if chk1.Checked then
      begin
        dd := da2.Add($0040, $0002); //(ScheduledProcedureStepStartDate)DA=<1>2004-9-23
        dd.AsDatetime[0] := DateTimePicker1.Date;
        dd.AsDatetime[1] := DateTimePicker2.Date;
      end else }
        da2.Add($0040, $0002);

      da2.Add($0040, $0003); //(ScheduledProcedureStepStartTime)TM=<0>NULL
      da2.Add($0040, $0006); //(ScheduledPerformingPhysiciansName)PN=<0>NULL
      da2.Add($0040, $0007); //(ScheduledProcedureStepDescription)LO=<0>NULL
      da2.Add($0040, $0009); //(ScheduledProcedureStepID)SH=<0>NULL
      da2.Add($0040, $0010); //(ScheduledStationName)SH=<0>NULL
      Add($0040, $1001); //(RequestedProcedureID)SH=<0>NULL
    end;

    TV.DataController.SelectAll;
    TV.DataController.DeleteSelection;

    if CnsDicomConnection1.C_MWL(das) then
    begin
      if CnsDicomConnection1.ReceiveDatasets.Count > 0 then
      begin
        TV.BeginUpdate;
        for i := 0 to CnsDicomConnection1.ReceiveDatasets.Count - 1 do
        begin
          das := CnsDicomConnection1.ReceiveDatasets[i];
          TV.DataController.RecordCount := TV.DataController.RecordCount + 1;
          with TV.DataController do
          begin
            Values[TV.DataController.RecordCount - 1, vPatientName.Index] := das.GetString(dPatientName);
            Values[TV.DataController.RecordCount - 1, VPatientBirthDate.Index] := das.GetString(dPatientBirthDate);
            Values[TV.DataController.RecordCount - 1, VPatientID.Index] := das.GetString(dPatientID);
            Values[TV.DataController.RecordCount - 1, VAccessionNumber.Index] := das.GetString(dAccessionNumber);
            Values[TV.DataController.RecordCount - 1, VPatientSex.Index] := das.GetString(dPatientSex);
            Values[TV.DataController.RecordCount - 1, VStudyInstanceUID.Index] := das.GetString(dStudyInstanceUID);
            Values[TV.DataController.RecordCount - 1, VModality.Index] := das.GetString(dModality);
            Values[TV.DataController.RecordCount - 1, VStationAETitle.Index] := das.GetString(dScheduledStationAETitle);
            Values[TV.DataController.RecordCount - 1, VScheduledProcedureStepStartDate.Index] := das.GetString(dScheduledProcedureStepStartDate);
          end;
        end;
        TV.EndUpdate;
      end
      else
        ShowMessage('No return data');
      CnsDicomConnection1.Clear;
      CnsDicomConnection1.Disconnect;
    end
    else
      ShowMessage('error on query server');
  finally
    CnsDicomConnection1.Free;
  end;
end;

procedure TfrmCapture.SetShortCutsOfHotKeys;
begin
  if vRejim then  // 'Режим ввода данных о пациенте';
  begin
    StatusBar.Panels[0].Text:= 'Режим ввода - без гор.клавиш';
    aCapture.ShortCut := 0 ;
    aStartCapVideo.ShortCut := 0 ;
    aStopCapVideo.ShortCut := 0 ;
  end else begin // 'Захват видео';
    StatusBar.Panels[0].Text:= ''''+s_hkKadr+''' - захват кадра  '+
                               ''''+s_hkStartVideo+''' - старт захвата видео  '+
                               ''''+s_hkStopVideo+ ''' - стоп захвата видео  ';
    aCapture.ShortCut := v_hkKadr ;
    aStartCapVideo.ShortCut := v_hkStartVideo ;
    aStopCapVideo.ShortCut := v_hkStopVideo ;
  end;
  Application.ProcessMessages;
end;

procedure ImportImageEx( p_CnsDMTable:TCnsDMTable; ADataset: TDicomAttributes; AFileName: AnsiString; AIsMono: Boolean
  = false);
const
  filterArray: array[0..11] of AnsiString = ('jpg', 'bmp', 'tif', 'tga', 'png',
    'pcx', 'ppm', 'gif', 'avi', 'mpg', 'jpeg', 'tiff');
  function GetFileType: Integer;
  var
    str1: AnsiString;
    i: integer;
  begin
    str1 := SysUtils.Lowercase(ExtractFileExt(AFileName));
    for i := 0 to 11 do
      if str1 = '.' + filterArray[i] then
      begin
        Result := i;
        exit;
      end;
    Result := -1;
  end;
  procedure NewAVIImage;
  var
    dimage: TDicomImageData;
    p1: Pointer;
    ALen: Integer;
    x, y: Integer;
    avi1: TCnsAVIReader;
    da1: TDicomAttribute;
    bmp: TBitmap;
    DestScanline: pRGBs;
    prgb1: pRGB;
    v_int_to_db : integer;
    v_filename : ansistring;
    ii : integer;
    begin
    v_int_to_db:=0;
    avi1 := TCnsAVIReader.Create;
    try
      if avi1.Open(AFileName) >= 0 then
      begin
        Application.CreateForm(TFrmProgressBar, FrmProgressBar);
        try
          Screen.Cursor := crHourGlass;

          bmp := avi1.GetFrame(avi1.Start);

          ADataset.AddVariant(8, $16, '1.2.840.10008.5.1.4.1.1.7'); //sc - Secondary Capture Image Storage SOP Class
    //      ADataset.AddVariant(8, $16, '1.2.840.10008.5.1.1.2');
          ADataset.AddVariant(8, 8, 'ORIGINAL/PRIMARY//0001');
          //  Result.AddVariant(8, $60, AModility);
          //ADataset.AddVariant(8, $70, 'CNSSoft');

          ADataset.AddVariant(dSOPInstanceUID, 'f_avi_'+IntToStr(p_CnsDMTable.Count+1) ); // !!! обязательно
          ADataset.AddVariant(dSeriesInstanceUID, 'f_ser_avi_'+IntToStr(p_CnsDMTable.Count+1) ); // !!! обязательно

          v_int_to_db:=p_CnsDMTable.Count+1;
          ADataset.AddVariant(dInstanceNumber, v_int_to_db );

          ADataset.Add(8, $20).AsDatetime[0] := now;
          ADataset.Add(8, $21).AsDatetime[0] := now;
          ADataset.Add(8, $23).AsDatetime[0] := now;
          ADataset.Add(8, $30).AsDatetime[0] := now;
          ADataset.Add(8, $33).AsDatetime[0] := now;

          //  Result.AddVariant($20, $13, AImageIndex);
          ADataset.AddVariant($28, $11, bmp.Width);
          ADataset.AddVariant($28, $10, bmp.Height);

          ALen := bmp.Width * bmp.Height * 3;

          ADataset.AddVariant($28, $8, avi1.Ending - avi1.Start - 1);
          ADataset.AddVariant($28, $2, 3);
          ADataset.AddVariant($28, $4, 'RGB');

          //ADataset.AddVariant($28, $2, 1);
          //ADataset.AddVariant($28, $4, 'MONOCHROME2');

          ADataset.AddVariant($28, $100, 8);
          ADataset.AddVariant($28, $101, 8);
          ADataset.AddVariant($28, $102, 8 - 1);

          da1 := ADataset.Add(32736, 16);

        // снимок на заставке справа
        // ---------------------------------------------------------------------

          GetMem(p1, alen);
          //Move(avi1.Punter^, p1^, ALen);
          prgb1 := p1;

          Application.CreateForm(TFrmProgressBar, FrmProgressBar);
          try
            CmnUnit.v_exit_progressbar:=0;
            // инициализируем ползунок - чтобы что-то показать
            FrmProgressBar.clc_pos( False, // is_on_top
                            'Преобразование видео в DICOM',
                            bmp.Height, // кол-во
                            True   // один ползунок
                          );
            FrmProgressBar.clc_posMain( bmp.Height, // 0-не отображать ползунок
                              'Преобразование видео в DICOM',
                               True
                            );
            // инициализация переменных для ползунка
            MyIniMove;

            for y := 0 to bmp.Height - 1 do // Iterate
            begin
              if (y mod 3)=0 then
                 FrmProgressBar.MyIncPos('Преобразование видео в DICOM ' {+
                     inttostr(y+1)+'/'+inttostr(bmp.Height)});
              DestScanline := bmp.ScanLine[y];
              for x := 0 to bmp.Width - 1 do
              begin
                prgb1^.b := DestScanLine^.b;
                prgb1^.g := DestScanLine^.g;
                prgb1^.r := DestScanLine^.r;

                inc(prgb1);
                inc(DestScanline);
              end;
            end;
            dimage := TDicomImageData.Create(ImplicitVRLittleEndian, p1, ALen);
            da1.AddData(dimage);

          finally
            chk_close; // закроем ползунок
            FreeAndNil(FrmProgressBar);
          end;
        // ---------------------------------------------------------------------
          {
          v_amm:=(avi1.Ending - 1)-(avi1.Start + 1);
          // инициализация переменных для ползунка
          CmnUnit.v_exit_progressbar:=0;
          MyIniMove;
          // инициализируем ползунок - чтобы что-то показать
          FrmProgressBar.clc_pos( False, // is_on_top
                            'Перенос видео в DICOM',
                            v_amm, // кол-во
                            True   // один ползунок
                          );
          FrmProgressBar.clc_posMain( v_amm, // 0-не отображать ползунок
                              'Перенос видео в DICOM',
                               True
                            );
          // инициализация переменных для ползунка
          MyIniMove;

          for i := avi1.Start + 1 to avi1.Ending - 1 do
          begin
            if (i mod 2)=0 then
              FrmProgressBar.MyIncPos('Обработка снимков ' +
                     inttostr(i+1)+'/'+inttostr(v_amm),2);
            if CmnUnit.v_exit_progressbar=1 then Break;
            bmp := avi1.GetFrame(i);

            if bmp <> nil then
            try
              GetMem(p1, alen);

              prgb1 := p1;
              for y := 0 to bmp.Height - 1 do // Iterate
              begin
                DestScanline := bmp.ScanLine[y];
                for x := 0 to bmp.Width - 1 do
                begin
                  prgb1^.b := DestScanLine^.b;
                  prgb1^.g := DestScanLine^.g;
                  prgb1^.r := DestScanLine^.r;

                  inc(prgb1);
                  inc(DestScanline);
                end;
              end;
              dimage := TDicomImageData.Create(ImplicitVRLittleEndian, p1, ALen);
              da1.AddData(dimage);
              //
              if CmnUnit.v_exit_progressbar=1 then begin
                if (MessageDlg('Прервать сохранение видео в DICOM ?', mtConfirmation, [mbYes, mbNo], 0) =
                  mrYes) then
                  break;
              end;
            finally
              bmp.free;
            end;
          end;   }

        finally
          chk_close; // FreeAndNil(FrmProgressBar);
          screen.cursor := crDefault;
        end;
      end;
    finally
      avi1.Free;
    end;
    if v_int_to_db>0 then
    begin

      // загрузим видео в таблицу в памяти
      try
        Screen.Cursor := crHourGlass;
        // переименуем файл
        v_filename:=frmCapture.v_user_cat+'f_avi_video_'+IntToStr(GetTickCount)+'.tmp';
        ii:=0;
        While FileExists(v_filename) do
        begin
          Inc(ii);
          v_filename:=frmCapture.v_user_cat+'f_avi_video_'+IntToStr(GetTickCount)+inttostr(ii)+'.tmp';
          if ii>1000 then
          begin
            DeleteFile(v_filename);
            break;
          end;
        end;
        MoveFile(PChar(AFileName),PChar(v_filename));
        // запишем ссылку в базу
        frmCapture.dxMemData1.Append;
        frmCapture.dxMemData1.FieldByName('npp').AsInteger := v_int_to_db;
        frmCapture.dxMemData1.FieldByName('filename').AsString := v_filename;
        frmCapture.dxMemData1.Post;
        // запишем ссылку на него в текстовый файл
        MnLg_ev( v_filename, frmCapture.v_user_file, False, False );
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  procedure NewTIFImage;
  var
    dimage: TDicomImageData;
    p1: Pointer;
    //    pb1: PByte;
    ALen: Integer;
    //    DestScanline: PColor32Array;
    //    prgb1: pRGB;
    f1: TTiffGraphic;
    List1: TList;
    i: Integer;
    bm1: TBitmap;
  begin
    list1 := TList.Create;
    f1 := TTiffGraphic.Create;
    f1.LoadFromFileEx(AFileName, list1);
    if list1.Count <= 0 then
    begin
      bm1 := TBitmap.Create;
      f1.AssignTo(bm1);
      NewImage(ADataset, bm1, AIsMono);
    end
    else
    begin

      //Result := TDicomAttributes.Create;
      //  Result.AddVariant(dPatientName, Patientname);
      //  Result.AddVariant(dPatientID, PatientID);

      //  Result.AddVariant(dStudyInstanceUID, StudyUID);
      //  Result.AddVariant(dSeriesInstanceUID, StudyUID + '.' + IntToStr(ASeriesIndex));
      //  Result.AddVariant(dSOPInstanceUID, StudyUID + '.' + IntToStr(ASeriesIndex) + '.' + IntToStr(AImageIndex + 1));

      ADataset.AddVariant(8, $16, '1.2.840.10008.5.1.4.1.1.7'); //sc
      //SOP CLASS
      //1.2.840.10008.5.1.4.1.1.2  CT
      //1.2.840.10008.5.1.4.1.1.7  secondary capture

      ADataset.AddVariant(8, 8, 'ORIGINAL/PRIMARY//0001');
      //  Result.AddVariant(8, $60, AModility);
      ADataset.AddVariant(8, $70, 'CNSSoft');

      ADataset.Add(8, $20).AsDatetime[0] := now;
      ADataset.Add(8, $21).AsDatetime[0] := now;
      ADataset.Add(8, $23).AsDatetime[0] := now;
      ADataset.Add(8, $30).AsDatetime[0] := now;
      ADataset.Add(8, $33).AsDatetime[0] := now;
      //  Result.AddVariant($20, $13, AImageIndex);
      ADataset.AddVariant($28, $11, f1.Width);
      ADataset.AddVariant($28, $10, f1.Height);
      //    if not AIsMONOCHROME then

      ADataset.AddVariant($28, $2, 1);
      ADataset.AddVariant($28, $4, 'MONOCHROME2');
      ALen := f1.Width * f1.Height;

      ADataset.AddVariant($28, $100, 16);
      ADataset.AddVariant($28, $101, 16);
      ADataset.AddVariant($28, $102, 15);
      for i := 0 to list1.Count - 1 do
      begin
        p1 := list1[i];
        dimage := TDicomImageData.Create(ImplicitVRLittleEndian, p1, ALen);
        ADataset.Add(32736, 16).AddData(dimage);
      end;
    end;
  end;
var
  //  i: integer;
  bm1: TBitmap;
  //  das1: TDicomAttributes;
    //d1: TDicomDataset;
begin
  ADataset.Clear;

  bm1 := TBitmap.Create;
  case GetFileType of
    0, 10: //jpeg
      begin
        with TJpegGraphic.Create do
        try
          LoadFromFile(AFilename);
          assignto(bm1);
        finally
          Free;
        end; //JPEG try..finally}
      end;
    1: //bmp
      begin
        bm1.LoadFromFile(AFilename);
      end;
    2, 11: //tif
      begin
        NewTIFImage;
        bm1.Free;
        exit;
        {with TTiffGraphic.Create do
        try
          LoadFromFile(AFilename);
          assignto(bm1);
        finally
          Free;
        end; }
      end;
    3: //tga
      begin
        with TTgaGraphic.Create do
        try
          LoadFromFile(AFilename);
          assignto(bm1);
        finally
          Free;
        end;
      end;
    4: //png
      begin
        with TPngGraphic.Create do
        try
          LoadFromFile(AFilename);
          assignto(bm1);
        finally
          Free;
        end;
      end;
    5: //pcx
      begin
        with TPcxGraphic.Create do
        try
          LoadFromFile(AFilename);
          assignto(bm1);
        finally
          Free;
        end;
      end;
    6: //ppm
      begin
        with TPpmGraphic.Create do
        try
          LoadFromFile(AFilename);
          assignto(bm1);
        finally
          Free;
        end;
      end;
    7: //gif
      begin

      end;
    8: //avi
      begin
        NewAVIImage;
        bm1.Free;
        exit;
      end;
    9: //mpg
      begin

      end;
  else
    begin
      bm1.Free;
      Exit;
    end;
  end;

  NewImage(ADataset, bm1, AIsMono);

  //Add(Result);
  bm1.Free;
end;

procedure TfrmCapture.clr_temp_files;
var v_flist, v_flist_res : TStringList;
    i:integer;
begin
  try
    if FileExists(v_user_file) then
    begin
      v_flist := TStringList.Create;
      v_flist_res := TStringList.Create;
      try
        v_flist.LoadFromFile(v_user_file);
        for I := 0 to v_flist.Count - 1 do
          if FileExists(v_flist[i]) then
            try
              DeleteFile(v_flist[i]);
            except
              v_flist_res.Add(v_flist[i]);
            end;
      finally
        v_flist.Free;
        if v_flist_res.Count>0 then
        begin
          v_flist_res.SaveToFile(v_user_file);
        end else
        begin
          DeleteFile(v_user_file);
        end;
        v_flist_res.Free;
      end;
    end;
  except
  end;
end;

procedure TfrmCapture.cbNastrClick(Sender: TObject);
begin
  setNastrBtn;
end;

procedure TfrmCapture.cbVModesChange(Sender: TObject);
var v1: TVCapMode;
begin
  cap.SetVCapMode(cbVModes.ItemIndex);

  v1 := cap.VCapMode;
//  self.Width := v1.Width + ControlPanelSize.cx;
//  self.Height := v1.Height + ControlPanelSize.cy;

  cap.StartPreview;
end;

procedure TfrmCapture.DoShowForm(nPort: Integer; sIp, sAe: string);
begin
  pPort := nPort;
  pIp := sIp;
  pAe := sAe;
end;

end.

