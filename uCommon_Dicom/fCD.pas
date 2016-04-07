unit fCD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, dxSkinsDefaultPainters, cxControls,
  cxContainer, cxEdit, cxLabel, Menus, cxLookAndFeelPainters, ActnList,
  StdCtrls, cxButtons, cxProgressBar, DCM_Attributes, DCM_Client, cxGroupBox,
  cxImage, KxDrvLib, cxGraphics, cxTextEdit, cxMaskEdit, DCM_Connection,
  cxDropDownEdit, OleServer, ComCtrls, mbExDD, cxListView, DateUtils,
  JvPanel, dxSkinsdxBarPainter, cxClasses, cxMemo, mbDrvLib, mbCDBC, FileCtrl,
  JvExExtCtrls, JvExtComponent, dxBar, cxTreeView, dxSkinscxPCPainter, cxPC,
  ImgList, cxSplitter, mbISOLib, cxRadioGroup, FIBQuery, pFIBQuery,
  dxSkinOffice2007Green, dxSkinBlack, dxSkinOffice2007Black, DB, Medotrade,
  dxmdaset;

type
  vDICOMrec = record
    STUDYDATE       : TDateTime;
    PATIENTID       : string;
    ENAME           : string;
    MODALITY        : string;
    STUDYUID        : string;
    ACCESSIONNUMBER : string;
  end;

type
  TfrmCD = class(TForm)
    Panel1: TPanel;
    bClose: TcxButton;
    al: TActionList;
    aOK: TAction;
    pmToCD: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    pcBurn: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    paMain: TPanel;
    Timer1: TTimer;
    od: TOpenDialog;
    pmLog: TPopupMenu;
    ClearAll1: TMenuItem;
    gbBurn: TcxGroupBox;
    Splitter2: TSplitter;
    Panel2: TPanel;
    clBox: TListView;
    Panel3: TPanel;
    Splitter1: TSplitter;
    DriveCB: TDriveComboBox;
    lbDir: TDirectoryListBox;
    lbFiles: TFileListBox;
    gbPodgotovka: TcxGroupBox;
    cxLabel1: TcxLabel;
    lDir: TcxLabel;
    cxLabel2: TcxLabel;
    lKolvo: TcxLabel;
    cxLabel4: TcxLabel;
    lbStatus: TcxLabel;
    cxLabel5: TcxLabel;
    lbVolume: TcxLabel;
    cxLabel3: TcxLabel;
    lbSnimki: TcxLabel;
    bPrepare: TcxButton;
    gbBurnCD: TcxGroupBox;
    bEraseDisc: TcxButton;
    bOptions: TcxButton;
    bBuildISO: TcxButton;
    bBurnISO: TcxButton;
    bBurn: TcxButton;
    bReady: TcxButton;
    bEject: TcxButton;
    bInfo: TcxButton;
    cxGroupBox4: TcxGroupBox;
    cxLabel9: TcxLabel;
    pbProg: TcxProgressBar;
    cxLabel10: TcxLabel;
    pbBuf: TcxProgressBar;
    memLog: TcxMemo;
    cxLabel11: TcxLabel;
    pbHBuf: TcxProgressBar;
    bAbort: TcxButton;
    pbSize: TcxProgressBar;
    cxLabel12: TcxLabel;
    lbFreeSize: TcxLabel;
    Panel4: TPanel;
    cxGroupBox1: TcxGroupBox;
    lDrive: TcxLabel;
    cbDrives: TcxComboBox;
    cxLabel6: TcxLabel;
    cbSpeed: TcxComboBox;
    cxGroupBox2: TcxGroupBox;
    rb1: TcxRadioButton;
    rb2: TcxRadioButton;
    cxLabel13: TcxLabel;
    teNameDisc: TcxTextEdit;
    qUpdate: TpFIBQuery;
    cxLabel14: TcxLabel;
    lbCatalog: TcxLabel;
    mcdb: TMCDBurner;
    Panel5: TPanel;
    cxLabel7: TcxLabel;
    cxImage1: TcxImage;
    Panel6: TPanel;
    cxImage2: TcxImage;
    cxLabel8: TcxLabel;
    aStop: TAction;
    aCancel: TAction;
    StudyList: TdxMemData;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    StringField3: TStringField;
    DateTimeField2: TDateTimeField;
    StringField4: TStringField;
    IntegerField1: TIntegerField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StudyListSTUDYUID: TStringField;
    StudyListffile: TBlobField;
    StudyListVDESC: TStringField;
    StudyListSTUDYID: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure cbDrivesPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure lbDirDblClick(Sender: TObject);
    procedure clBoxDblClick(Sender: TObject);
    procedure clBoxDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure clBoxDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure clBoxEditing(Sender: TObject; Item: TListItem;
      var AllowEdit: Boolean);
    procedure bEjectClick(Sender: TObject);
    procedure bReadyClick(Sender: TObject);
    procedure mcdbDebugMessage(Sender: TObject; Message: string; mType: Byte);
    procedure mcdbAddFile(Sender: TObject; const FullPath: string;
      var LongFileName, ShortFileName: string; var DateTime: TDateTime;
      Attr: Integer; FileSize: Int64; var Skip: Boolean);
    procedure bInfoClick(Sender: TObject);
    procedure bBuildISOClick(Sender: TObject);
    procedure bBurnISOClick(Sender: TObject);
    procedure bOptionsClick(Sender: TObject);
    procedure bBurnClick(Sender: TObject);
    procedure mcdbEraseDone(Sender: TObject; WithError: Boolean);
    procedure mcdbFinalizingTrack(Sender: TObject);
    procedure mcdbWriteDone(Sender: TObject; Error: string);
    procedure bEraseDiscClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ClearAll1Click(Sender: TObject);
    procedure bEjectMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure bEjectMouseLeave(Sender: TObject);
    procedure bInfoMouseLeave(Sender: TObject);
    procedure bInfoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cbSpeedPropertiesInitPopup(Sender: TObject);
    procedure bReadyMouseLeave(Sender: TObject);
    procedure bReadyMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure bEraseDiscMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure bEraseDiscMouseLeave(Sender: TObject);
    procedure bBuildISOMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure bBuildISOMouseLeave(Sender: TObject);
    procedure bBurnISOMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure bBurnISOMouseLeave(Sender: TObject);
    procedure bOptionsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure bOptionsMouseLeave(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure pcBurnChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aStopExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    bISO : Boolean;
    FreeSize : Double;
    procedure AddFilesToCd;
    { Private declarations }
  public
    vCDDir : string;
    v_DataSet: TDataSet ;
    vParentForm : Byte; //  1 - TfrmMain  2 - TfrmSnimki
    bCancel ,
    v_CancelClick : boolean;
    //
    vCnsDicomConnectionHost,
    vCnsDicomConnectionCalledTitle,
    vCnsDicomConnectionCallingAETitle : string;
    vCnsDicomConnectionPort,
    vActivePageIndex : integer;
    vStudyUIDList : TStringList;
    vDS : TDicomDatasets ;
    //
    vDirList, vDirPacList : TStringList;
    vListToWrite : array of vDICOMrec;
    vMnDir : string;
    vEraseDone, vBurnDone ,
    vTimerProcRun : Boolean;
    vSizeToWrite : Int64;
    procedure st_oper ( p_is_start : boolean = True );
  end;

var
  frmCD: TfrmCD;
  SessionToImport: ShortInt;
  QuickSaveISO: Boolean = false;
  ccEject, ccShowFiles, ccImportSession: Boolean;
  oArchiveFiles, oImportSession: Boolean;
  vAddDirFlash, vIshDir, vsCDDate : string;

function GetSpeed(Str: String; Medium: Byte): Word;

implementation

uses fProgressCD, UnfrmProgressBurn, DCM_Dict, CmnUnit, DICOM_CMN, ImportSession,
  fSettings, DB_CMN;

{uses  fProgressCD, ImportSession, fSettings, DICOM_CMN, DCM_Dict, CmnUnit,
     DB_CMN, UnfrmProgressBurn; }

{$R *.dfm}

procedure TfrmCD.st_oper ( p_is_start : boolean = True );
begin
  bAbort.Visible := p_is_start;
  bAbort.Enabled := p_is_start;
  aStop.Enabled := p_is_start;
  Timer1.Enabled := p_is_start;
  bEject.Enabled := not p_is_start;
  bInfo.Enabled := not p_is_start;
  bReady.Enabled := not p_is_start;
  bEraseDisc.Enabled := not p_is_start;
  bBuildISO.Enabled := not p_is_start;
  bBurnISO.Enabled := not p_is_start;
  bOptions.Enabled := not p_is_start;
  bBurn.Enabled := not p_is_start;
  DriveCB.Enabled := not p_is_start;
  cbDrives.Enabled := not p_is_start;
  cbSpeed.Enabled := not p_is_start;
  teNameDisc.Enabled := not p_is_start;
end;

function GetSpeed(Str: String; Medium: Byte): Word;
var Divider: Integer;
begin
  if (Str = 'Max') or (Str = '') then
    result := 0
  else
  begin
    if Medium >= mtDVD_ROM then
      Divider := 1385
    else
      Divider := 177;
    result := Round(StrToFloat(Copy(str, 1, Pos('X', str)-1)) * Divider) ;
  end;
end;

procedure TfrmCD.aCancelExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfrmCD.AddFilesToCd;
var i: Integer;
    Entries: Integer;
    fPath, fName: String;
begin
  if SessionToImport <> 0 then
    begin
      mcdb.SessionToImport := 0;
      mcdb.ImportSession(SessionToImport, nil);
    end;
  Entries := clBox.Items.Count;
  if Entries < 1 then
    begin
      ShowMessage('Хотя бы одна дирректория или файл должны быть выбраны для записи!');
      exit;
    end;

  for i:=0 to Entries-1 do
    begin
      fPath := ExtractFilePath(clBox.Items[i].SubItems[0]);
      fName := ExtractFileName(clBox.Items[i].SubItems[0]);
      if DirectoryExists(clBox.Items[i].SubItems[0]) then
        mcdb.InsertDir(mcdb.RootDir, fPath, '*.*', faAnyFile, clBox.Items[i].Checked, True, oArchiveFiles)
      else
        mcdb.InsertFile('\', fPath+fName, True);
    end;
  mcdb.RemoveEmptyDirs;
end;

procedure TfrmCD.aOKExecute(Sender: TObject);
var CnsDicomConnection1: TCnsDicomConnection;
    DA : TDicomAttributes;
    DDS : TDicomDataset;
    cnsTable : TCnsDMTable;
    i : Integer; //счетчик
    sDir : string;
    y, m, d: Word;
    c : Integer;
    tmp1 : string;
    a, cnt, cnt1 : Integer;
    a1 : Extended;
    SearchRec : TSearchRec;
    sCDDate, vDTmp : string;
    vDateTmp : TDateTime;
  procedure cmn_prt279;
  begin
    frmProgressCD.cxProgressBar2.Position := frmProgressCD.cxProgressBar2.Position + 1;
    Application.ProcessMessages;
    if vParentForm=2 then // из датасета - уже занруженно
    begin
      vDTmp := vDS.Item[0].Attributes.GetString(dStudyDate);
      if not TryStrToDate(vDTmp,vDateTmp) then
        vDateTmp:=EncodeDate(Yearof(Date),Monthof(Date),DayOf(Date));
      DecodeDate(vDateTmp, y, m, d);
      sDir := vCDDir + '\' +                                             // подготавливаем директорию
            sCDDate+
            vDS.Item[0].Attributes.GetString(dPatientName) + '\' +
            IntToStr(d)+'.'+IntToStr(m)+'.'+IntToStr(y) + '\';
      vDirPacList.Append(vCDDir + '\' +                                             // подготавливаем директорию
            sCDDate+
            vDS.Item[0].Attributes.GetString(dPatientName));
    end else if vParentForm=3 then // из QueryList
    begin
      DecodeDate(v_DataSet.FieldByName('DATE').AsDateTime, y, m, d);
      sDir := vCDDir + '\' +                                             // подготавливаем директорию
            sCDDate+
            v_DataSet.FieldByName('PATIENT').AsString + '\' +
            IntToStr(d)+'.'+IntToStr(m)+'.'+IntToStr(y) + '\';
      vDirPacList.Append(vCDDir + '\' +                                             // подготавливаем директорию
            sCDDate+
            v_DataSet.FieldByName('PATIENT').AsString);
    end else if vParentForm=4 then // из dll
    begin
      DecodeDate(v_DataSet.FieldByName('LDATE').AsDateTime, y, m, d);
      sDir := vCDDir + '\' +                                             // подготавливаем директорию
            sCDDate+
            v_DataSet.FieldByName('P_ENAME').AsString + '\' +
            IntToStr(d)+'.'+IntToStr(m)+'.'+IntToStr(y) + '\';
      vDirPacList.Append(vCDDir + '\' +                                             // подготавливаем директорию
            sCDDate+
            v_DataSet.FieldByName('P_ENAME').AsString);
    end else begin
      DecodeDate(v_DataSet.FieldByName('LDATE').AsDateTime, y, m, d);
      sDir := vCDDir + '\' +                                             // подготавливаем директорию
            sCDDate+
            v_DataSet.FieldByName('P_ENAME').AsString + '\' +
            IntToStr(d)+'.'+IntToStr(m)+'.'+IntToStr(y) + '\';
      vDirPacList.Append(vCDDir + '\' +                                             // подготавливаем директорию
            sCDDate+
            v_DataSet.FieldByName('P_ENAME').AsString);
    end;
    vIshDir := vCDDir + '\' + sCDDate;
    vsCDDate := sCDDate;
    vAddDirFlash := sCDDate+
            v_DataSet.FieldByName('P_ENAME').AsString + '\' +
            IntToStr(d)+'.'+IntToStr(m)+'.'+IntToStr(y) + '\';
    vDirList.Append( vIshDir );
    if not DirectoryExists(sDir) then
      if not ForceDirectories(sDir) then
        raise Exception.Create('Не удаётся создать дирректорию ' + sDir);
    if frmProgressCD.bCancels then Exit;
    cnsTable.SaveToDicomDir(sDir, false);
    tmp1:=sDir;
    a:=0;
    cnt := 0;
    if FindFirst(tmp1+'\*.*', faAnyFile, SearchRec) = 0 then
      while FindNext(SearchRec) = 0 do
        if (SearchRec.Attr and faDirectory ) = 0 then
          begin
            inc(a, SearchRec.Size);
            inc(cnt);
          end;
    FindClose(SearchRec);
    a1 := a1 + a;
    cnt1 := cnt1+cnt;
  end;
begin
  aOK.Enabled := False;
//  aCancel.Enabled := False;
  sCDDate := StringReplace(DateTimeToStr(Now), ':', '-', [rfReplaceAll, rfIgnoreCase]) + '\';
  bCancel := False;
  lbStatus.Caption := '--';
  lbVolume.Caption := '--';
  lbSnimki.Caption := '--';
  a1 := 0;
  cnt1 := 0;
  c := 0;
  Application.CreateForm(TfrmProgressCD, frmProgressCD);
  try
    frmProgressCD.Show;
    frmProgressCD.FormStyle := fsStayOnTop;
    frmProgressCD.cxProgressBar2.Position := 0;
    frmProgressCD.cxProgressBar2.Properties.Max := StrToInt(lKolvo.Caption);
    Application.ProcessMessages;
    if vParentForm=2 then // из датасета - уже занруженно
    begin
    {  for i := 0 to vDS.Count -1 do // -- работаем с исследованием
      begin
        if bCancel = True then
          Exit;   }
        cnsTable := TCnsDMTable.Create(nil);  
       { frmProgressCD.lb2.Caption := 'Обрабатывается исследование - '+
                                       vDS.Item[i].Attributes.GetString(dPatientID)+'-'+
                                       vDS.Item[i].Attributes.GetString(dPatientName)+'-'+
                                       vDS.Item[i].Attributes.GetString(dModality);
        frmProgressCD.lb1.Caption := 'Обрабатывается снимок '+IntToStr(i+1);
        DDS := TDicomDataset.Create(TDicomAttributes(vDS[i]));  }
        TDicomDatasets(CnsTable):=vDS;  //   .Item[i].Attributes
      {  frmProgressCD.cxProgressBar1.Position := frmProgressCD.cxProgressBar1.Position + 1;
        c:=c+1;
      end;  }
      cmn_prt279;
    end else begin
      v_DataSet.First;
      // -- работаем с исследованиями
      while not v_DataSet.Eof do // организовываем цикл по отобранным исследованиям (по датасету)
      begin
        Application.ProcessMessages;
        if frmProgressCD.bCancels then Exit; // отмена
        //
        CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
        cnsTable := TCnsDMTable.Create(nil);
        DA := TDicomAttributes.Create;
        try
          if vParentForm=1 then
          begin
            frmProgressCD.lb2.Caption := 'Обрабатывается исследование - '+
                                         v_DataSet.FieldByName('P_PID').AsString+'-'+
                                         v_DataSet.FieldByName('P_ENAME_RUS').AsString+'-'+
                                         v_DataSet.FieldByName('STUDIES_IMAGE_TYPE').AsString;
          end else if vParentForm=3 then
          begin
            frmProgressCD.lb2.Caption := 'Обрабатывается исследование - '+
                                         v_DataSet.FieldByName('Number').AsString+'-'+
                                         v_DataSet.FieldByName('PATIENT').AsString+'-'+
                                         v_DataSet.FieldByName('Modality').AsString;
          end else if vParentForm=4 then
          begin
            frmProgressCD.lb2.Caption := 'Обрабатывается исследование - '+
                                         v_DataSet.FieldByName('P_PID').AsString+'-'+
                                         v_DataSet.FieldByName('P_ENAME_RUS').AsString+'-'+
                                         v_DataSet.FieldByName('STUDIES_IMAGE_TYPE').AsString;
          end;
          Application.ProcessMessages;
          if vActivePageIndex<>3 then
          begin
            CnsDicomConnection1.Host := frmCD.vCnsDicomConnectionHost ;
            CnsDicomConnection1.CalledTitle := frmCD.vCnsDicomConnectionCalledTitle  ;
            CnsDicomConnection1.Port := frmCD.vCnsDicomConnectionPort ;
            CnsDicomConnection1.CallingTitle := frmCD.vCnsDicomConnectionCallingAETitle ;
            CnsDicomConnection1.ReceiveTimeout := c_Timeout;
            DCM_Connection.PDUTempPath:=GetTempDirectory;
            with DA do
            begin
              AddVariant(78, 'STUDY');    //   PATIENT   dPATIENTid
              AddVariant(dStudyInstanceUID, v_DataSet.FieldByName('STUDYUID').AsString); // dPatientID  v_DataSet.FieldByName('P_PID').AsString
              if CnsDicomConnection1.C_GET(DA) then
              begin
                frmProgressCD.cxProgressBar1.Position := 0;
                frmProgressCD.cxProgressBar1.Properties.Max := CnsDicomConnection1.ReceiveDatasets.Count;
                Application.ProcessMessages;
                //-- цикл по снимкам (подгружаем в dicom-таблицу снимки)
                for i := 0 to CnsDicomConnection1.ReceiveDatasets.Count -1 do
                  begin
                    if frmProgressCD.bCancels then
                      Exit;
                    frmProgressCD.lb1.Caption := 'Обрабатывается снимок '+IntToStr(i+1);
                    DDS := TDicomDataset.Create(TDicomAttributes(CnsDicomConnection1.ReceiveDatasets[i]));
                    CnsTable.Add(DDS);
                    frmProgressCD.cxProgressBar1.Position := frmProgressCD.cxProgressBar1.Position + 1;
                    c:=c+1;
                  end;
              end;
            end;
          end else begin
            DDS := TDicomDataset.Create;
            DDS.LoadFromFile(v_DataSet.FieldByName('FILENAME').AsString);
            CnsTable.Add(DDS);
            frmProgressCD.cxProgressBar1.Position := frmProgressCD.cxProgressBar1.Position + 1;
            c:=c+1;
          end;
          if CnsTable.Count>0 then
          begin
            cmn_prt279;
          end else begin
            MessageDlg('Исследования не получены с PACS сервера ...', mtWarning, [mbOK], 0);  
          end;
        finally
          MyDisconnectAssociation(CnsDicomConnection1);
          CnsDicomConnection1.Free;
        end;
        v_DataSet.Next;
      end;
    end;
    frmProgressCD.lb1.Caption := 'Копируется программа просмотра...';
    CopyFile(PAnsiChar(ExtractFileDir(Application.ExeName)+'\DicomViewer.exe'), PAnsiChar(vCDDir+'\'+sCDDate+'DicomViewer.exe'), True);
    lbStatus.Style.Font.Color := clGreen;
    lbStatus.Caption := 'Все исследования сохранены в каталог!';
    lbCatalog.Caption := vCDDir + '\' + sCDDate;
    vSizeToWrite := Trunc(a1);
    a1 := a1 / 1024;
    a1 := a1 / 1024;
    lbVolume.Caption := 'Файлов в каталоге '+inttostr(cnt1)+', размер '+FormatFloat('#,##0.00',a1)+' Мб';
    lbSnimki.Caption := IntToStr(c);
    lbDir.Directory := vCDDir + '\' + sCDDate;
  finally
    frmProgressCD.Free;
    aOK.Enabled := True;
//    aCancel.Enabled := True;
  end;
end;

procedure TfrmCD.aStopExecute(Sender: TObject);
begin
  v_CancelClick:=True;
  Timer1.Enabled := False;
  mcdb.Abort;
  mcdb.Initialize;
  bAbort.Enabled := False;
end;

procedure TfrmCD.bEjectClick(Sender: TObject);
begin
  v_CancelClick:=False;
  mcdb.FlushCache;
  mcdb.LockMedium(True);
  if mcdb.LoadMedium(True) then
    mcdb.DebugMsg('>>> Привод открылся успешно', 0)
  else
    mcdb.DebugMsg('>>> Не удалось открыть привод!', 0);
end;

procedure TfrmCD.bEjectMouseLeave(Sender: TObject);
begin
  bEject.Font.Style := bEject.Font.Style - [fsBold];
end;

procedure TfrmCD.bEjectMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  bEject.Font.Style := bEject.Font.Style + [fsBold];
end;

procedure TfrmCD.bInfoClick(Sender: TObject);
var Disc: TDisc;
    i: Cardinal;
    a, b: Int64;
    fb, ub, tb: Cardinal;
    str: String;
    dt, bs: Byte;
    status: SmallInt;
    label found;
begin
  v_CancelClick:=False;
  frmSessions := TfrmSessions.Create(self);
  frmSessions.lb.Items.Clear;
  try
    Screen.Cursor := crHourGlass;
    Disc := mcdb.GetDiscInformation;
  finally
    Screen.Cursor := crDefault;
  end;
  if not mcdb.TestUnitReady then
    Disc.Valid := False;
  if not Disc.Valid then
    begin
      frmSessions.lb.Items.Add('Ошибка при получении информации о сессии!');
      frmSessions.ShowModal;
      mcdb.LockDrive;
      exit;
    end;
  dt := mcdb.DiscType;
  bs := mcdb.SessionsOnDisc;
  for i:=1 to bs do
    begin
      mcdb.ReadTrackInformation(i);
      a := mcdb.TrackInformation.TrackStartAddress;
      str := IntToDec(a, 8, ' ');
      b := round(mcdb.TrackInformation.TrackSize * (2048 / 1024 / 1024 ));
      frmsessions.lb.Items.Add('  '+IntToDec(i, 3)+ '    '+str+'   '+IntToDec(b, 4, ' ')+' MB');
    end;
  fb := mcdb.FreeBlocksOnDisc;
  Status := mcdb.DiscStatus;
  if (Status = -1) then
    str := 'Неизвестный диск'
  else if (Status = dsCompleteDisc) then
    str := 'Диск закрыт'
  else
    str := 'Диск опознан';

  frmsessions.lFreeSpace.Caption := FormatFloat('#,##0.00 MB', fb / 1024 / 1024 * 2048 )+', '+str;
  Disc := mcdb.GetDiscInformation;
  frmsessions.lMedium.Caption := DiscTypeString[dt];
  ub := mcdb.UsedBlocksOnDisc;
  tb := mcdb.TotalBlocksOnDisc;
  frmsessions.lDiscSize.Caption := FormatFloat('#,##0.00 MB', tb / 1024 / 1024 * 2048 );
  frmsessions.lUsedSpace.Caption := FormatFloat('#,##0.00 MB', ub / 1024 / 1024 * 2048 ) + ',  Сессии : '+IntToStr(bs);
  frmsessions.Visible := False;
  mcdb.LockDrive;
  frmsessions.ShowModal;
end;

procedure TfrmCD.bReadyClick(Sender: TObject);
begin
  v_CancelClick:=False;
  if mcdb.TestUnitReady then
    mcdb.DebugMsg('>>> Привод готов к записи', 0)
  else
    mcdb.DebugMsg('>>> Привод не готов к записи! ', 0);
end;

procedure TfrmCD.bReadyMouseLeave(Sender: TObject);
begin
  bReady.Font.Style := bReady.Font.Style - [fsBold];
end;

procedure TfrmCD.bReadyMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  bReady.Font.Style := bReady.Font.Style + [fsBold];
end;

procedure TfrmCD.cbDrivesPropertiesChange(Sender: TObject);
var Letter: Char;
begin
  mcdb.Device := cbDrives.Text;
  cbDrives.Hint := cbDrives.Text;
  Letter := mcdb.DeviceByDriveLetter;
  if Letter = #0 then
    lDrive.Caption := 'CD привод: '
  else
    lDrive.Caption := 'CD привод '+Letter+':';
  if (dcWriteCDR in mcdb.DeviceCapabilities) or (dcWriteDVDR in mcdb.DeviceCapabilities) or (dcWriteDVDRAM in mcdb.DeviceCapabilities) then
    bBurn.Enabled := True
  else
    bBurn.Enabled := False;
end;

procedure TfrmCD.cbSpeedPropertiesInitPopup(Sender: TObject); // ??? почему вывод скоростей используется на это событие, а не допустим на крейт формы
var Speeds, ActSpd, Medium, Li: Integer;
    Str : String;
    Divider: Double;
begin
  Medium := mcdb.DiscType;
  if Medium >= mtDVD_ROM then
    Divider := 1385
  else
    Divider := 176.4;
  li := cbSpeed.ItemIndex;
  cbspeed.Properties.Items.clear;
  cbSpeed.Properties.Items.Add('Max');
  Speeds := mcdb.MaxWriteSpeed;
  while Speeds > 0 do
    begin
      mcdb.WriteSpeed := Speeds;
      ActSpd := mcdb.CurrentWriteSpeed;
      if Medium >= mtDVD_ROM then
        Str := FormatFloat('0.0X ', ActSpd / Divider)+FormatFloat('(#,##0 KB/s)', ActSpd)
      else
        Str := FormatFloat('0X ', ActSpd / Divider)+FormatFloat('(#,##0 KB/s)', ActSpd);
      if cbSpeed.Properties.Items.IndexOf( Str ) < 0 then
        cbSpeed.Properties.Items.Add(Str);
      if Medium >= mtDVD_ROM then
        Dec(Speeds, 700)
      else
       Dec(Speeds, 176);
    end;

  if li = -1 then
    cbSpeed.ItemIndex := 0
  else
    if li <= cbSpeed.Properties.Items.Count then
      cbSpeed.ItemIndex := li
    else
      cbSpeed.ItemIndex := 0;
end;

procedure TfrmCD.clBoxDblClick(Sender: TObject);
begin
  if clBox.Selected <> nil then
    clBox.Selected.Delete;     
end;

procedure TfrmCD.clBoxDragDrop(Sender, Source: TObject; X, Y: Integer);
var i: Integer;
    tmp: String;
    size: Int64;
    tmpItem: TListItem;
begin
try
  size := 0;
  Screen.Cursor := crHourGlass;
  if (Sender is TListView) and (Source is TDirectoryListBox) then
    begin
      tmp := lbDir.GetItemPath(lbDir.ItemIndex);
      if Copy(tmp, Length(tmp), 1) = '\' then
        tmp := Copy(tmp, 1, Length(tmp)-1);
      clBox.Items.Add;
      tmpItem := clBox.Items[clBox.Items.Count-1];
      size := mcdb.GetDirSize(tmp+'\');
      tmpItem.SubItems.Add(tmp+'\');
      tmpItem.SubItems.Add(FormatFloat('#,##0.00 MB', Size/ 1024 / 1024));
      tmpItem.Checked := True;
    end;
  if (Sender is TListView) and (Source is TFileListBox) then
    begin
      for i := 0 to (lbFiles.Items.Count - 1) do
        if lbFiles.Selected[i] then
          begin
            tmp := lbDir.Directory;
            if Copy(tmp, Length(tmp), 1) = '\' then
              tmp := Copy(tmp, 1, Length(tmp)-1);
            tmp := tmp+'\'+lbfiles.Items[i];
            clBox.Items.Add;
            tmpItem := clBox.Items[clBox.Items.Count-1];
            size := mcdb.GetDirSize(tmp);
            tmpItem.SubItems.Add(tmp);
            tmpItem.SubItems.Add(FormatFloat('#,##0.00 MB', Size/ 1024 / 1024));
          end;
    end;
  {$IFDEF USESHELLCTRLS}
  if (Sender is TListView) and (Source is TShellListView) then
    begin
      tmp := lbDir.GetItemPath(lbDir.ItemIndex);
      tmp := ShellListView.Selected.SubItems.Text;
      tmp := ShellListView.SelectedFolder.PathName;
      tmpItem := ShellListView.Selected;
      while tmpItem <> nil do
        begin
          if tmpItem.Selected then
            begin
              if Copy(tmp, Length(tmp), 1) = '\' then
                tmp := Copy(tmp, 1, Length(tmp)-1);
              clBox.Items.Add;
              tmpItem := clBox.Items[clBox.Items.Count-1];
              size := mcdb.GetDirSize(tmp+'\');
              tmpItem.SubItems.Add(tmp+'\');
              tmpItem.SubItems.Add(FormatFloat('#,##0.00 MB', Size/ 1024 / 1024));
              tmpItem.Checked := True;
            end;
          tmpItem := ShellListView.GetNextItem(tmpItem, sdAll, [isSelected]);
        end;
    end;
 {$ENDIF}
  pbSize.Position := pbSize.Position + size;
  FreeSize := FreeSize - size;
  lbFreeSize.Caption := VarToStr(FreeSize) + ' KB';
  if FreeSize < 0 then
    begin
      lbFreeSize.Style.Font.Color := clRed;
    end;
finally
  Screen.Cursor := crDefault;
end;
end;

procedure TfrmCD.clBoxDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TDirectoryListBox) or (source is TFileListBox)
  {$IFDEF USESHELLCTRLS}
   or (Source is TShellTreeView) or (Source is TShellListView)
  {$ENDIF}
   ;
  {$IFDEF USESHELLCTRLS}
  if (Source is TShellListView) then
  begin
    if not FileExists(ShellListView.SelectedFolder.PathName) then
      Accept := False;
  end;
  {$ENDIF}
end;

procedure TfrmCD.clBoxEditing(Sender: TObject; Item: TListItem;
  var AllowEdit: Boolean);
begin
  AllowEdit := False;
end;

procedure TfrmCD.ClearAll1Click(Sender: TObject);
begin
  memLog.Lines.Clear;
end;

procedure TfrmCD.cxButton1Click(Sender: TObject);
begin
//  lbDir.di
end;

procedure TfrmCD.bEraseDiscClick(Sender: TObject);
var
  str: String;
  Speed: Word;
begin
  vEraseDone:=False;
  v_CancelClick:=False;
  if not (mcdb.Erasable) and (mcdb.DiscType <> mtDVD_RAM) then
    MessageDlg('Диск нельзя очистить!', mtWarning, [mbOK], 0)
  else
  if Application.MessageBox('Вся информация на диске будет стерта!', 'Хотите очистить диск? ?', MB_DEFBUTTON2+MB_ICONWARNING+MB_YESNO) = ID_YES then
  begin
    if cbSpeed.ItemIndex = -1 then
    begin
      Application.MessageBox('Внимание! Вы не указали скорость записи диска!', 'Предупреждение', MB_OK+MB_ICONWARNING);
      cbSpeed.SetFocus;
      Exit;
    end;
    st_oper(True);
    str := cbSpeed.Properties.Items[cbSpeed.ItemIndex];
    Speed := GetSpeed(str, mcdb.DiscType);
    mcdb.WriteSpeed := speed;
    mcdb.EraseDisc(etQuick);
  //  mcdb.EraseDisc(etComplete);
  end;
end;

procedure TfrmCD.bEraseDiscMouseLeave(Sender: TObject);
begin
  bEraseDisc.Font.Style := bEraseDisc.Font.Style - [fsBold];
end;

procedure TfrmCD.bEraseDiscMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  bEraseDisc.Font.Style := bEraseDisc.Font.Style + [fsBold];
end;

procedure TfrmCD.bOptionsClick(Sender: TObject);
begin
  v_CancelClick:=False;
  frmAdvanceSettings := TfrmAdvanceSettings.Create(Self);
  frmAdvanceSettings.cEject.Checked := ccEject;
  frmAdvanceSettings.cShowFiles.Checked := ccShowFiles;
  frmAdvanceSettings.cImportSession.Checked := ccImportSession;
  frmAdvanceSettings.ShowModal;
end;

procedure TfrmCD.bOptionsMouseLeave(Sender: TObject);
begin
  bOptions.Font.Style := bOptions.Font.Style - [fsBold];
end;

procedure TfrmCD.bOptionsMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  bOptions.Font.Style := bOptions.Font.Style + [fsBold];
end;

procedure TfrmCD.bBuildISOClick(Sender: TObject);
var FileName: String;
begin
  v_CancelClick:=False;
  FileName := mcdb.ISOFileName;
  if InputQuery('Создание ISO-образа','Введите имя .ISO файла для создания образа', FileName) then
  begin
    if pos('.',FileName)<=0 then FileName:=FileName+'.iso';
    Timer1.Enabled := True;
    mcdb.ClearAll(MaxFiles, MaxDirs);
    AddFilesToCD;
    if (mcdb.DirsCount = 0) and (mcdb.FilesCount = 0) then exit;
    mcdb.DebugMsg('>>> Добавление файлов и папок в *.ISO выполнено', 0);
    Application.ProcessMessages;
    mcdb.DebugMsg('>>> Создание ISO-образа '+GetCurrentDir+'\'+FileName, 0);
    st_oper(True);
    mcdb.Prepare(True);
    pbProg.Properties.Max := mcdb.ImageSize;
    bISO := True;
    //    ccEject := False;
//    lSize.Caption := FormatFloat('#,##0.00', mcdb.ImageSize * 2048 / (1024 * 1024))+' MB';
    try
      st_oper(True);
      mcdb.SaveToISOFile(FileName, QuickSaveISO);
    finally
      st_oper(False);
    end;
  end;
end;

procedure TfrmCD.bBuildISOMouseLeave(Sender: TObject);
begin
  bBuildISO.Font.Style := bBuildISO.Font.Style - [fsBold];
end;

procedure TfrmCD.bBuildISOMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  bBuildISO.Font.Style := bBuildISO.Font.Style + [fsBold];
end;

procedure TfrmCD.bBurnClick(Sender: TObject);
var a,b: Cardinal;
    msg: String;
    label okDoBurn;
begin
  vBurnDone:=False;
  v_CancelClick:=False;
  mcdb.ReadBufferCapacity(a, b);
  pbHBuf.Properties.Max := a;
//-->> 1. проверка все ли обязательные для записи поля заполнены
  if cbSpeed.ItemIndex = -1 then
    begin
      Application.MessageBox('Внимание! Вы не указали скорость записи диска!', 'Предупреждение', MB_OK+MB_ICONWARNING);
      cbSpeed.SetFocus;
      Exit;
    end;
  if teNameDisc.Text = '' then
    begin
      Application.MessageBox('Внимание! Вы не указали название диска!', 'Предупреждение', MB_OK+MB_ICONWARNING);
      teNameDisc.SetFocus;
      Exit;
    end;
//<<-- 1
  mcdb.WriteSpeed := GetSpeed(cbSpeed.Properties.Items[cbSpeed.ItemIndex], mcdb.DiscType); // устанавливаем скорость записи
  Application.ProcessMessages;
  mcdb.IdVolume := teNameDisc.Text; // устанавливаем название диска
  mcdb.ClearAll(MaxFiles, MaxDirs);
  try
    Screen.Cursor := crHourGlass;
    AddFilesToCD; // добавляем файлы и папки на диск
  finally
    Screen.Cursor := crDefault;
  end;
  if (mcdb.DirsCount = 0) and (mcdb.FilesCount = 0) then
    begin
      mcdb.DebugMsg('>>> Нечего записывать! Выход', 0);
      exit;
    end else
    begin
      mcdb.DebugMsg('>>> Добавление файлов и папок выполнено', 0);
      Application.ProcessMessages;
    end;

  mcdb.Prepare;
  pbProg.Properties.Max := mcdb.ImageSize;
  msg := 'Начать запись '+ FormatFloat('#,##0.00', mcdb.ImageSize * 2048 / (1024 * 1024))+' MB ?';
  if Application.MessageBox(@msg[1], 'Хотите записать диск ?', MB_DEFBUTTON1+MB_ICONQUESTION+MB_YESNO) = ID_YES then
    begin
      okDoBurn:
          mcdb.DebugMsg('>>> Начало записи диска '+mcdb.Device, 0);
          st_oper(True);
          mcdb.BurnCD;
    end else
      Timer1.Enabled := False;
end;

procedure TfrmCD.bBurnISOClick(Sender: TObject);
var a,b: Cardinal;
begin
  v_CancelClick:=False;
  vBurnDone:=False;
  if od.Execute then
    begin
      mcdb.ReadBufferCapacity(a, b);
      pbHBuf.Properties.Max := a;
      mcdb.DebugMsg('>>> Начало записи .ISO образа '+mcdb.Device, 0);
      st_oper(True);
      mcdb.WriteSpeed := GetSpeed(cbSpeed.Properties.Items[cbSpeed.ItemIndex], mcdb.DiscType);
      mcdb.BurnISOImage(od.FileName);
      pbProg.Properties.Max := mcdb.ImageSize;
  end;
end;

procedure TfrmCD.bBurnISOMouseLeave(Sender: TObject);
begin
  bBurnISO.Font.Style := bBurnISO.Font.Style - [fsBold];
end;

procedure TfrmCD.bBurnISOMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  bBurnISO.Font.Style := bBurnISO.Font.Style + [fsBold];
end;

procedure TfrmCD.mcdbAddFile(Sender: TObject; const FullPath: string;
  var LongFileName, ShortFileName: string; var DateTime: TDateTime;
  Attr: Integer; FileSize: Int64; var Skip: Boolean);
var fs: TFileStream;
begin
  if (ExtractFileExt(LongfileName) = '.doc') then
    begin
      Skip := True;
    end; 
  if FullPath <> '' then
    begin
      try
        fs := TFileStream.Create(FullPath, fmOpenRead+fmShareDenyNone);
        fs.Destroy;
      except
        mcdb.DebugMsg('>>> Пропуск; Файл уже используется '+ FullPath, 0);
        Skip := True
      end;
    end;
  if Length(LongFileName) > 107 then
    begin
      mcdb.DebugMsg('>>> Пропуск; Длина имени файла > 107 '+ FullPath, 0);
      Skip := True;
    end;
//  if not Skip then
//  begin
//    lSize.Caption := FormatFloat('#,##0.00', (mcdb.FilesSize) / (1024 * 1024))+' MB';
//  end;
end;

procedure TfrmCD.mcdbDebugMessage(Sender: TObject; Message: string; mType: Byte);
begin
  if frmCD.vParentForm = 4 then // call from dll then
  begin
    frmProgressBurn.memLog.Lines.Add(Message);
  end else begin
    memLog.Lines.Add(Message);
  end;
  Application.ProcessMessages;
end;

procedure TfrmCD.mcdbEraseDone(Sender: TObject; WithError: Boolean);
begin
  Timer1Timer(Sender);
  if v_CancelClick then
    mcdb.DebugMsg('>>> Процесс очистки диска прерван пользователем', 0)
  else if WithError then
    mcdb.DebugMsg('>>> Процесс очистки диска выполнился с ошибками', 0)
  else
    mcdb.DebugMsg('>>> Процесс очистки диска выполнился успешно', 0);
  if (not WithError) and (ccEject) then
    mcdb.LoadMedium(True);
  pbProg.Position := 0;
  MessageBeep(MB_OK);
  mcdb.DebugMsg(' ', 0);
  st_oper(False);
  vEraseDone:=True;
end;

procedure TfrmCD.mcdbFinalizingTrack(Sender: TObject);
begin
  mcdb.DebugMsg('>>> Завершение записи', 0);
end;

procedure TfrmCD.mcdbWriteDone(Sender: TObject; Error: string);
var i:Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    Timer1Timer(Sender);
    if v_CancelClick then
        mcdb.DebugMsg('>>> Процесс записи/прожига диска прерван пользователем', 0)
    else if Error <> '' then
      begin
        mcdb.DebugMsg('>>> Процесс записи/прожига диска завершен с ошибками', 0);
        mcdb.DebugMsg('>>> '+Error, 0);
      end else
      begin
        if bISO = True then
          mcdb.DebugMsg('>>> Процесс создания ISO-образа завершен', 0)
        else
          mcdb.DebugMsg('>>> Процесс записи/прожига завершен', 0);
        if oArchiveFiles then
          mcdb.ResetFilesArchiveBit;
// -->> 1. Если архивный диск меняем статус у исследований и присваиваем название диска
        if rb2.Checked then
          begin
            mcdb.DebugMsg('>>> Обработка записей в базе данных...', 0);
            trWriteStart;

            for I := 0 to vStudyUIDList.Count - 1 do
            begin
              qUpdate.ParamByName('STATUS').AsInteger := 2;
              qUpdate.ParamByName('NAME_DISC').AsString := teNameDisc.Text;
              qUpdate.ParamByName('STUDYUID').AsString := vStudyUIDList[i];
              try
                qUpdate.ExecQuery;
              except
              end;
            end;  
          end;
//<<-- 1
      end;

    if (Error = '') and (ccEject) then
      mcdb.LoadMedium(True);
    if oArchiveFiles then
      mcdb.ResetFilesArchiveBit;
    mcdb.ClearAll(MaxFiles, MaxDirs);
    MessageBeep(MB_OK);
    bAbort.Visible := False;
    if (ccEject = True) and (bISO <> True) then
      bEjectClick(nil);
    bISO := False;
    mcdb.DebugMsg(' ', 0);
  finally
    Screen.Cursor := crDefault;
    st_oper(False);
  end;
  vBurnDone:=True;
end;

procedure TfrmCD.N1Click(Sender: TObject);
begin
  clBox.Items.Clear;
  pbSize.Position := 0;
  FreeSize := (mcdb.FreeBlocksOnDisc*2048);
  lbFreeSize.Caption := IntToStr((mcdb.FreeBlocksOnDisc*2048)) + ' KB';
  lbFreeSize.Style.Font.Color := clBlack;
end;

procedure TfrmCD.N2Click(Sender: TObject);
begin
  if clBox.Selected <> nil then
    clBox.Selected.Delete;
end;

procedure TfrmCD.pcBurnChange(Sender: TObject);
begin
  if pcBurn.ActivePageIndex = 0 then
    frmCD.Caption := 'Запись на диск - Подготовка';
  if pcBurn.ActivePageIndex = 1 then
    frmCD.Caption := 'Запись на диск - Запись';
end;

procedure TfrmCD.rb1Click(Sender: TObject);
begin
  teNameDisc.Text := DateTimeToStr(Now);
end;

procedure TfrmCD.rb2Click(Sender: TObject);
begin
  teNameDisc.Text := 'A';
end;

procedure TfrmCD.Timer1Timer(Sender: TObject);
begin
  if not vTimerProcRun then
  try
    vTimerProcRun:=True;
    if frmCD.vParentForm = 4 then // call from dll then
    begin
      if not mcdb.Erasing then
      begin
  //      lSize.Caption := FormatFloat('#,##0.00', (mcdb.BytesWritten / (1024 * 1024)))+'/'+FormatFloat('#,##0.00', ((mcdb.ImageSize * 2048) / (1024 * 1024)))+' MB';
        frmProgressBurn.pbBuf.Position := mcdb.BufferProgress;
        frmProgressBurn.pbProg.Position := mcdb.BytesWritten div 2048;
        frmProgressBurn.pbProg.Properties.Max := mcdb.ImageSize;
        if mcdb.DeviceBufferSize >= mcdb.DeviceFreeBufferSize then
          frmProgressBurn.pbHBuf.Position := Integer(mcdb.DeviceBufferSize - mcdb.DeviceFreeBufferSize);
      end else
      begin
        frmProgressBurn.pbProg.Properties.Max := 100;
        frmProgressBurn.pbProg.Position := mcdb.EraseProgress;
      end;
    end else begin
      if not mcdb.Erasing then
      begin
  //      lSize.Caption := FormatFloat('#,##0.00', (mcdb.BytesWritten / (1024 * 1024)))+'/'+FormatFloat('#,##0.00', ((mcdb.ImageSize * 2048) / (1024 * 1024)))+' MB';
        pbBuf.Position := mcdb.BufferProgress;
        pbProg.Position := mcdb.BytesWritten div 2048;
        pbProg.Properties.Max := mcdb.ImageSize;
        if mcdb.DeviceBufferSize >= mcdb.DeviceFreeBufferSize then
          pbHBuf.Position := Integer(mcdb.DeviceBufferSize - mcdb.DeviceFreeBufferSize);
      end else
      begin
        pbProg.Properties.Max := 100;
        pbProg.Position := mcdb.EraseProgress;
      end;
    end;
    Application.ProcessMessages;
  finally
    vTimerProcRun:=False;
  end;
end;

procedure TfrmCD.FormClose(Sender: TObject; var Action: TCloseAction);
  procedure stop_all;
  begin
    v_CancelClick:=True;
    Timer1.Enabled := False;
    mcdb.Abort;
    mcdb.Initialize;
    mcdb.OnDebugMessage:=nil;
    mcdb.OnEraseDone:=nil;
    mcdb.OnWriteDone:=nil;
    mcdb.OnFinalizingTrack:=nil;
    Action:=caFree;
  end;
begin
  if Timer1.Enabled then
  begin
    if MessageDlg('Остановить запись ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      stop_all
    else
      Action:=caNone;
  end;
end;

procedure TfrmCD.FormCreate(Sender: TObject);
begin
  vAddDirFlash:='';
  vStudyUIDList := TStringList.Create;
  vDirList := TStringList.Create;
  vDirPacList := TStringList.Create;
  mcdb.ParentDirectoryOnly:=True;
  pcBurn.ActivePageIndex := 0;
  vMnDir := GetCurrentDir;
  vTimerProcRun:=False;
end;

procedure TfrmCD.FormDestroy(Sender: TObject);
var i:Integer; // s : string;
  procedure Remove(Dir: String);
  var
    Result: TSearchRec; Found: Boolean;
  begin
    Found := False;
    if FindFirst(Dir + '\*', faAnyFile, Result) = 0 then
      while not Found do begin
        if (Result.Attr and faDirectory = faDirectory)
            AND (Result.Name <> '.')
            AND (Result.Name <> '..')
        then Remove(Dir + '\' + Result.Name)
        else if (Result.Attr and faAnyFile <> faDirectory) then DeleteFile(Dir + '\' + Result.Name);
        Found := FindNext(Result) <> 0;
      end;
    FindClose(Result); RemoveDir(Dir);
  end;
begin
  SetCurrentDir(vMnDir);
  vStudyUIDList.Free;
  for I := 0 to vDirList.Count - 1 do
    Remove(vDirList[i]);
  vDirList.Free;
  vDirPacList.Free;
end;

procedure TfrmCD.FormShow(Sender: TObject);
begin
  if frmCD.vParentForm = 4 then // call from dll then
  begin
    Application.CreateForm(UnfrmProgressBurn.TfrmProgressBurn, UnfrmProgressBurn.frmProgressBurn);
  end;
  Screen.Cursor := crHourGlass;
  try
    mcdb.InitializeASPI(True);
    if not mcdb.ASPIInitialized then
      begin
        MessageDlg('Ошибка инициализации ASPI!', mtWarning, [mbOK], 0);
        exit;
      end;
    if (mcdb.Devices <> nil) and (mcdb.Devices.Count > 0) then
      begin
        cbDrives.Properties.Items.Assign(mcdb.Devices);
        cbDrives.ItemIndex := 0;
        // список скоростей записи диска
        cbSpeedPropertiesInitPopup(Self);
        cbSpeed.ItemIndex := 0;
  //      Speeds := mcdb.MaxWriteSpeed;
        cbDrivesPropertiesChange(Sender);
        pbSize.Properties.Max := (mcdb.FreeBlocksOnDisc*2048);
        pbSize.Position := 0;
        lbFreeSize.Caption := IntToStr((mcdb.FreeBlocksOnDisc*2048)) + ' KB';
        FreeSize := (mcdb.FreeBlocksOnDisc*2048);
      end;
    rb1.Checked := True;
    teNameDisc.Text := DateTimeToStr(Now); //!!!
    bISO := False;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCD.lbDirDblClick(Sender: TObject);
begin
  gbBurn.Refresh;
end;

procedure TfrmCD.bInfoMouseLeave(Sender: TObject);
begin
  bInfo.Font.Style := bInfo.Font.Style - [fsBold];
end;

procedure TfrmCD.bInfoMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  bInfo.Font.Style := bInfo.Font.Style + [fsBold];
end;

end.
