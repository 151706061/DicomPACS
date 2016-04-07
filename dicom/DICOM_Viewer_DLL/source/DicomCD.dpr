library DicomCD;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  Windows,
  Dialogs,
  Forms,
  Controls,
  DCM_Client,
  DCM_Attributes,
  DCM_Dict,
  ComCtrls,
  DateUtils,
  mbDrvLib,
  fCD in '..\..\..\uCommon_Dicom\fCD.pas' {frmCD},
  fProgressCD in '..\..\..\uCommon_Dicom\fProgressCD.pas' {frmProgressCD},
  CmnUnit in '..\..\..\uCommon_Dicom\CmnUnit.pas',
  ImportSession in '..\..\Client\Source\ImportSession.pas' {frmSessions},
  TreeView in '..\..\Client\Source\TreeView.pas' {frmTree},
  DICOM_CMN in '..\..\..\uCommon_Dicom\DICOM_CMN.pas',
  UnFrmProgressBar in '..\..\..\uCommon_Dicom\UnFrmProgressBar.pas' {FrmProgressBar},
  DB_CMN in '..\..\..\uCommon_Dicom\DB_CMN.pas',
  fSettings in '..\..\Client\Source\fSettings.pas' {frmAdvanceSettings},
  UnfrmProgressBurn in '..\..\..\uCommon_Dicom\UnfrmProgressBurn.pas' {frmProgressBurn};

{$R *.res}

procedure pMakeCD ( pLevel : integer;         // 0 - STUDY  1 - PATIENTS, 2 - IMAGES, 4 - accessionnumber
                    pStudyList : TStringList;
                    pDICOMhost : string;
                    pDICOMport : Integer;
                    pDICOMCALLEDAE : string;
                    pDICOMCALLINGAE : string;
                    pDICOMLocalPort : Integer;
                    pIsDebug : integer
                  ) ; stdcall;
var vStudyListTmp, vDirTmp, vD, vD1 : string;
    i,j:integer;
    CnsDicomConnection1 : TCnsDicomConnection;
    DA, DA1 : TDicomAttributes;
    vDt2, vT : TDateTime;
    tmp: String;
    size: Int64;
    tmpItem: TListItem;
const c_mn_log_file = 'dcmevents.log';
label l1;
var str: String;
    Speed: Word;
    F: TFileStream;
begin   // Записать DICOM CD
  if pIsDebug=1 then
    MessageDlg('Call pMakeCD ...', mtWarning, [mbOK], 0);
  Application.CreateForm(TfrmCD, frmCD);
  frmCD.vCnsDicomConnectionHost := pDICOMhost;
  frmCD.vCnsDicomConnectionCalledTitle := pDICOMCALLEDAE ;
  frmCD.vCnsDicomConnectionPort := pDICOMport ;
  frmCD.vCnsDicomConnectionCallingAETitle := pDICOMCALLINGAE ;
  frmCD.vParentForm     := 4; // call from dll
  vD := GetCurrentDir ;
  vDirTmp := GetTempDirectory+'\Dicom';
  if not DirectoryExists(vDirTmp) then CreateDir(vDirTmp);
  frmCD.lDir.Caption    := vDirTmp;
  frmCD.lbDir.Directory := vDirTmp;
  frmCD.vCDDir := vDirTmp;
  frmCD.lKolvo.Caption := IntToStr(pStudyList.Count);
  // запрос списка исследований с-find
  SetLength(frmCD.vListToWrite,0);
  Screen.Cursor := crHourGlass;
  try
    for I := 0 to pStudyList.Count - 1 do
    begin
      CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
      try
        Screen.Cursor := crHourGlass;
        CnsDicomConnection1.Host := pDICOMhost;
        CnsDicomConnection1.Port := pDICOMport;
        CnsDicomConnection1.CalledTitle := pDICOMCALLEDAE;
        CnsDicomConnection1.CallingTitle := pDICOMCALLINGAE;

        DA := TDicomAttributes.Create;
        with DA do
          begin
            //-->> level
            if pLevel=0 then begin           // 0 - STUDY
              if pIsDebug=1 then
                  MessageDlg('0 - STUDY  StudyInstanceUID='+pStudyList[i], mtWarning, [mbOK], 0);
              AddVariant(dQueryRetrieveLevel, 'STUDY' );
              Add( $0010, $0020); // tLO, 'PatientID', '1');
              Add( $0020, $000D).AsString[0] := pStudyList[i];  // StudyInstanceUID
              Add( $0008, $0050);   // AccessionNumber
            end else if pLevel=1 then begin  // 1 - PATIENTS
              if pIsDebug=1 then
                  MessageDlg('1 - PATIENTS  PatientID='+pStudyList[i], mtWarning, [mbOK], 0);
              AddVariant(dQueryRetrieveLevel, 'PATIENT' );
              Add($0010, $0020).AsString[0] := pStudyList[i];
              Add( $0020, $000D);  // StudyInstanceUID
              Add( $0008, $0050);   // AccessionNumber
            end else if pLevel=4 then begin  // 4 - accessionnumber
              if pIsDebug=1 then
                  MessageDlg('4 - accessionnumber  AccessionNumber='+pStudyList[i], mtWarning, [mbOK], 0);
              AddVariant(dQueryRetrieveLevel, 'STUDY' );
              Add( $0010, $0020); // tLO, 'PatientID', '1');
              Add( $0020, $000D);  // StudyInstanceUID
              Add( $0008, $0050).AsString[0] := pStudyList[i];   // AccessionNumber
            end;
            //-->> номер исследования (он же PatientID)
            vStudyListTmp := pStudyList[i];

            Add( $0008, $0020);  // StudyDate
            Add( $0010, $0010); // tPN, 'PatientName', '1');
            Add( $0008, $0060); // tCS, 'Modality', '1');
          end;

        CnsDicomConnection1.v_is_log := True;
        CnsDicomConnection1.v_log_filename := ExtractFilePath(paramstr(0))+c_mn_log_file;
        frmCD.StudyList.Open;
        if CnsDicomConnection1.C_FIND(DA) then
        begin
          if pIsDebug=1 then
            MessageDlg('Answer: '+inttostr(CnsDicomConnection1.ReceiveDatasets.Count)+' records', mtWarning, [mbOK], 0);
          if CnsDicomConnection1.ReceiveDatasets.Count > 0 then
          begin
            for j := 0 to CnsDicomConnection1.ReceiveDatasets.Count - 1 do
            begin
                DA1 := TDicomAttributes(CnsDicomConnection1.ReceiveDatasets[j]);
                if DA1.GetString(dStudyInstanceUID)<>'' then
                begin
                  frmCD.StudyList.Insert;
                  vD1:=DA1.GetString(dStudyDate);
                  if not TryStrToDate( vD1 , vDt2 ) then vDt2 := Date ;
                  frmCD.StudyList.FieldByName('LDATE').AsDateTime            := vDt2 ;
                  frmCD.StudyList.FieldByName('P_ENAME').AsString            := DA1.GetString(dPatientName) ;
                  frmCD.StudyList.FieldByName('P_PID').AsString              := DA1.GetString(dPatientID) ;
                  frmCD.StudyList.FieldByName('P_ENAME_RUS').AsString        := DA1.GetString(dPatientName) ;
                  frmCD.StudyList.FieldByName('STUDIES_IMAGE_TYPE').AsString := DA1.GetString(dModality) ;
                  frmCD.StudyList.FieldByName('ACCESSIONNUMBER').AsString    := DA1.GetString(dAccessionNumber) ;
                  frmCD.StudyList.FieldByName('STUDYUID').AsString           := DA1.GetString(dStudyInstanceUID) ;
                  frmCD.StudyList.Post;
                end;
            end;
            CnsDicomConnection1.ReceiveDatasets.Clear;
            CnsDicomConnection1.Clear;
            CnsDicomConnection1.Disconnect;
          end
          else
          begin
            ShowMessage('Нет данных!');
            CnsDicomConnection1.Clear;
            CnsDicomConnection1.Disconnect;
            Exit;
          end;
        end
        else
        begin
          ShowMessage('#1 Ошибка получения списка исследований.');
          Exit;
        end;
      finally
        Screen.Cursor := crDefault;
        MyDisconnectAssociation(CnsDicomConnection1);
        CnsDicomConnection1.Free;
      end;
    end;
    //
    if frmCD.StudyList.RecordCount=0 then
    begin
      ShowMessage('#2 Нет данных!');
      Exit;
    end;
    //
    Application.CreateForm(TfrmProgressBurn, frmProgressBurn);
    //
    Screen.Cursor := crHourGlass;
    try
      frmCD.v_DataSet:=frmCD.StudyList;
      frmCD.lKolvo.Caption := IntToStr(pStudyList.Count);
      frmCD.v_DataSet.First;
      while not frmCD.v_DataSet.EOf do
      begin
        frmCD.vStudyUIDList.Append( frmCD.v_DataSet.FieldByName('STUDYUID').AsString );
        frmProgressBurn.memLog.Lines.Append('Подготовлено исследование '+frmCD.v_DataSet.FieldByName('STUDYUID').AsString);
        frmCD.v_DataSet.Next;
      end;
      // сформируем исследования в каталоге юзера в формате dicom disk
      try
        frmCD.aOKExecute(nil);
      except
        on e:Exception do begin
          MessageDlg('#3 Ошибка формирования списка исследований .... '+#13+E.Message, mtError, [mbOK], 0);
          Exit;
        end;
      end;
      if frmCD.vDirList.Count>0 then      
        frmProgressBurn.vDirTmp := frmCD.vDirPacList[0];
      frmProgressBurn.mcdb.ParentDirectoryOnly := True;
      //
      frmProgressBurn.CDFreeSize;
      frmProgressBurn.pbSize.Properties.Min := frmCD.pbSize.Properties.Min;
      frmProgressBurn.pbSize.Properties.Max := frmCD.pbSize.Properties.Max;
      frmProgressBurn.pbSize.Position       := frmCD.pbSize.Position ;
      frmProgressBurn.vSizeToWrite          := frmCD.vSizeToWrite;
      frmProgressBurn.vAddDirFlash          := fCD.vAddDirFlash;
      frmProgressBurn.vIshDir               := fCD.vIshDir;
      frmProgressBurn.vsCDDate              := fCD.vsCDDate;
      //
      F:=TFileStream.Create( ExtractFileDir(Application.ExeName)+'\DicomViewer.exe' , fmOpenRead);
      try
        frmProgressBurn.vSizeToWrite := frmProgressBurn.vSizeToWrite+ F.Size + 1 ;
      finally
        F.Free;
      end;
      //
    //  CopyFile(PAnsiChar(ExtractFileDir(Application.ExeName)+'\DicomViewer.exe'), PAnsiChar('\DicomViewer.exe'), True);
      frmProgressBurn.mcdb.InsertFile( '\', ExtractFileDir(Application.ExeName)+'\DicomViewer.exe' );
      for I := 0 to frmCD.vDirPacList.Count - 1 do
      begin

    //  ShowMessage( frmCD.vDirPacList[i] );
        try
          frmProgressBurn.mcdb.InsertDir( '\',
                                          frmCD.vDirPacList[i],
                                          '*.*',
                                          faAnyFile,
                                          True,
                                          True,
                                          oArchiveFiles
                                        );
        except
          on E:Exception do
            MessageDlg('#4 Ошибка поиска исследования ...'+#13+E.Message, mtError, [mbOK], 0);
        end;
      end;

    finally
      Screen.Cursor := crDefault;
    end;

    frmProgressBurn.ShowModal;
    Application.ProcessMessages;


    frmCD.StudyList.Close;
    SetLength(frmCD.vListToWrite,0);
l1:
  finally
    frmCD.Timer1.Enabled := False;
    FreeAndNil(frmCD);
    FreeAndNil(frmProgressBurn);
    SetCurrentDir(vD);
  end;



end;

exports
  pMakeCD;

begin
end.
