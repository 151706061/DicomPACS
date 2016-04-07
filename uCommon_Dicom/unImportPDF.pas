unit unImportPDF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, Medotrade, dxSkinOffice2007Green,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit, cxButtonEdit,
  cxRadioGroup, cxDropDownEdit, cxCalendar, dxSkinOffice2007Black, cxGraphics,
  ComCtrls;

type
  TfrmImportPDF = class(TForm)
    cxLabel1: TcxLabel;
    tePatientID: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    teOpisStudy: TcxTextEdit;
    cxLabel4: TcxLabel;
    teDoctor: TcxTextEdit;
    cxLabel5: TcxLabel;
    teFIOpac: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    lbFile: TcxLabel;
    bteditFile: TcxButtonEdit;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    cxPolMan: TcxRadioButton;
    cxPolWoMan: TcxRadioButton;
    cxRadioButton3: TcxRadioButton;
    deDateBorn: TcxDateEdit;
    deStudyDate: TcxDateEdit;
    FileOpenDialog1: TFileOpenDialog;
    GroupBox1: TGroupBox;
    rbPDF: TRadioButton;
    rbBMP: TRadioButton;
    rbJPEG: TRadioButton;
    rbFRM: TRadioButton;
    rbAVI: TRadioButton;
    cxLabel21: TcxLabel;
    cxMod1: TcxComboBox;
    cxLabel20: TcxLabel;
    cxAccessionNumber1: TcxTextEdit;
    pbAVI: TProgressBar;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure bteditFilePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    function ExtractFrames(avifn: string; pRezList: TList) : Boolean;
  private
    { Private declarations }
  public
  end;

var
  frmImportPDF: TfrmImportPDF;

implementation

{$R *.dfm}

Uses DateUtils, DCM_Attributes, DICOM_CMN, DCM_Dict, DCM_UID, CmnUnit,
     DCM_Connection, DCM_Client, fMain, fSendParam, DB_CMN, VFW;

procedure TfrmImportPDF.bteditFilePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var vExt : string;
begin  //
  FileOpenDialog1.FileName := bteditFile.Text ;
  if FileOpenDialog1.Execute then
    if (bteditFile.Text <> FileOpenDialog1.FileName) then
    begin
      vExt := ExtractFileExt(FileOpenDialog1.FileName);
      if vExt='.bmp' then begin
        if rbBMP.Visible then
          rbBMP.Checked := True;
      end else if ((vExt='.jpg') or (vExt='.jpeg')) then begin
        if rbJPEG.Visible then
          rbJPEG.Checked := True;
      end else if vExt='.pdf' then begin
        if rbPDF.Visible then
          rbPDF.Checked := True;
      end else if vExt='.avi' then begin
        if rbAVI.Visible then
          rbAVI.Checked := True;
      end else if vExt='.frm' then begin
        if rbFRM.Visible then
          rbFRM.Checked := True;
      end;
      bteditFile.Text := FileOpenDialog1.FileName;
    end;
end;

procedure TfrmImportPDF.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel ;
end;

function TfrmImportPDF.ExtractFrames(avifn: string; pRezList: TList) : Boolean;
var   Error: Cardinal;
  pFile: IAVIFile;
  AVIStream: IAVISTREAM;
  gapgf: IGetFrame;
  lpbi: PBITMAPINFOHEADER;
  bits: PChar; hBmp: HBITMAP;
  AviInfo: TAVIFILEINFO;
  TmpBmp: TBitmap;
  DC_Handle: HDC;
  fr1, fr2, fr : integer;
  sError, s : string;
  vSize : LONG;
  procedure emp_pFile;
  begin
    AVIFileRelease(pFile);
    Pointer(pfile) := nil;
  end;
  procedure emp_AVIStream;
  begin
    AVIStreamRelease(AVIStream);
    Pointer(AVIStream) := nil;
  end;
begin
  Result := False;
  AVIFileInit;
  Error := AVIFileOpen( pFile, PChar(avifn), 0, nil );
  if Error <> 0 then
  begin
    AVIFileExit;
 {   case Error of
      AVIERR_BADFORMAT: sError := 'The file couldnot be read';
      AVIERR_MEMORY:    sError := 'The file could not be opened because of insufficient memory.';
      AVIERR_FILEREAD:  sError := 'A disk error occurred while reading the file.';
      AVIERR_FILEOPEN:  sError := 'A disk error occurred while opening the file.';
    else
      sError := 'Error number '+inttostr(Error);
    end;
    ShowMessage(sError);   }
    Exit;
  end;
  vSize := SizeOf(AVIINFO);
  if AVIFileInfo(pFile, AVIINFO, vSize) <> AVIERR_OK then
  begin
    emp_pFile;
    AVIFileExit;
    Exit;
  end;
  Error := AVIFileGetStream(pFile, AVIStream, streamtypeVIDEO, 0);
  if Error <> AVIERR_OK then
  begin
    emp_pFile;
    AVIFileExit;
    Exit;
  end;  
  gapgf := AVIStreamGetFrameOpen(AVIStream, nil);
  if gapgf = nil then
  begin
    emp_AVIStream;
    emp_pFile;
    AVIFileExit;
    Exit;
  end;
  fr1 := AVIStreamStart(AVIStream);
  fr2 := AVIStreamEnd(AVIStream);
  for fr := fr1 to fr2 do
  begin
    lpbi := AVIStreamGetFrame(gapgf, fr);
    if lpbi <> nil then
    begin
      TmpBmp := TBitmap.Create;
      try
        TmpBmp.Height := lpbi.biHeight;
        TmpBmp.Width  := lpbi.biWidth;
        bits := Pointer(Integer(lpbi) + SizeOf(TBITMAPINFOHEADER));
        DC_Handle := CreateDC('Display', nil, nil, nil);
        try
          hBmp := CreateDIBitmap(DC_Handle, lpbi^, CBM_INIT, bits, PBITMAPINFO(lpbi)^, DIB_RGB_COLORS);
        finally
          DeleteDC(DC_Handle);
        end;
        TmpBmp.Handle := hBmp;
        try
          s := IntToStr(fr);
          while Length(s)<6 do s := '0'+s;
          pRezList.Add(Pointer(TmpBmp));
          Result := True;
        except
        end;
      finally
      //  TmpBmp.Free;
      end;
    end;
  end;  
  AVIStreamGetFrameClose(gapgf);
  Pointer(gapgf) := nil;
  emp_AVIStream;

  emp_pFile;
  AVIFileExit;
end;

procedure TfrmImportPDF.btnSaveClick(Sender: TObject);
var das : TDicomDataSet;
    CnsDicomConnection1 : TCnsDicomConnection;
    CnsDMTable1 : TCnsDMTable;
    da1: TDicomAttribute;
    v_DCMAttr:TDicomAttributes;
  //  avi1 : TCnsAVIReader;
    bmp: TBitmap;
    j, ALen, x, y, l, v_int_to_db,
    vWidth, vHeight, avi1Ending, avi1Start : Integer;
    p1: Pointer;
    prgb1: pRGB;
    dimage: TDicomImageData;
    DestScanline: pRGBs;
    v_StudyUID, v_StudyID, v_SeriesUID : string;
    vRezList : TList;
  procedure pUsrMsg ( pIsOK:Boolean );
  begin
    If pIsOK then
      MessageDlg('Данные отправлены на сервер ...', mtInformation, [mbOK], 0)
    else
      MessageDlg('Ошибка отправки данных ...', mtError, [mbOK], 0);
  end;
  function fChkFields : Boolean;
  begin
    Result := False;
    if Trim(tePatientID.Text)='' then
      MessageDlg('Не задан ID пациента ...', mtWarning, [mbOK], 0)
    else if Trim(teFIOpac.Text)='' then
      MessageDlg('Не задан ФИО пациента ...', mtWarning, [mbOK], 0)
    else if Yearof(deDateBorn.Date)<1900 then
      MessageDlg('Не задана дата рождения пациента ...', mtWarning, [mbOK], 0)
    else if Yearof(deStudyDate.Date)<1900 then
      MessageDlg('Не задана дата исследования ...', mtWarning, [mbOK], 0)
    else if Trim(teOpisStudy.Text)='' then
      MessageDlg('Не задано описание исследования ...', mtWarning, [mbOK], 0)
    else if Trim(teDoctor.Text)='' then
      MessageDlg('Не задан врач ...', mtWarning, [mbOK], 0)
    else if Trim(bteditFile.Text)='' then
      MessageDlg('Не задан файл ...', mtWarning, [mbOK], 0)
    else if not FileExists(bteditFile.Text) then
      MessageDlg('Не найден файл ...', mtWarning, [mbOK], 0)
    else
      Result := True;
  end;
  procedure pSetValues ( pGroup, pElement : Integer; pValue1 : string=''; pValue2:TDateTime=0; pType:Byte=0 );
  begin
    if pType=0 then          // string type
    begin
      das.Attributes.Add(pGroup,pElement).AsString[0] :=pValue1;
   //   CnsDMTable1.Item[0].Attributes.Add(pGroup,pElement).AsString[0] :=pValue1;
    end else if pType=1 then     // datetime type
    begin
      das.Attributes.Add(pGroup,pElement).AsDatetime[0] := pValue2;
   //   CnsDMTable1.Item[0].Attributes.Add(pGroup,pElement).AsDatetime[0] := pValue2;
    end;
  end;
begin  // Добавить
    bteditFile.Text := Trim(bteditFile.Text);
    if fChkFields then
    begin // сохранение файла с тегами на пакс сервер
      das := TDicomDataSet.Create;
      CnsDMTable1 := TCnsDMTable.Create(nil);
      try
        // ---------------------------------------------------------------------
        if (rbBMP.Checked or rbJPEG.Checked) then
        begin
          CnsDMTable1.ImportImageEx(das.Attributes, bteditFile.Text, true);
          CnsDMTable1.add(das);
          pSetValues($08,$60, cxMod1.Text);               // Modality
        //  vTmp := das.Attributes.GetString($08,$60);

        // ---------------------------------------------------------------------
        end else if rbPDF.Checked then
        begin
          pSetValues($08,$60,'OT');               // Modality
          pSetValues( $42,$10 ,'PDF file');  // TitleDocument
          das.Attributes.Add( $42,$11 );
          das.Attributes.Item[ $42,$11 ].LoadFromFile(bteditFile.Text);
         // vDicomAttributes := das.Attributes;
        // ---------------------------------------------------------------------
        end else if rbFRM.Checked then
        begin


        // ---------------------------------------------------------------------
        end else if rbAVI.Checked then
        begin
        // ---------------------------------------------------------------------
          if cxMod1.Text='' then cxMod1.Text:='US';
          Screen.Cursor := crHourGlass;
          pbAVI.Visible := True;
          vRezList := TList.Create;
          try
            v_DCMAttr:=das.Attributes;
            ExtractFrames( bteditFile.Text, vRezList);
            if vRezList.Count=0 then
            begin
              MessageDlg('Неверный формат видео ...', mtWarning, [mbOK], 0);
              Exit;
            end;
            ALen := TBitmap(vRezList[0]).Width * TBitmap(vRezList[0]).Height * 3;
            vWidth  := TBitmap(vRezList[0]).Width;
            vHeight := TBitmap(vRezList[0]).Height;
            da1 := v_DCMAttr.Add(32736, 16);
            avi1Ending := vRezList.Count;
            avi1Start  := 0;
            pbAVI.Min := avi1Start;
            pbAVI.Max := avi1Ending;
            pbAVI.Position := 0;
            for j:=0 to vRezList.Count-1 do
            begin
              pbAVI.StepBy(1);
              Application.ProcessMessages;
              bmp:= TBitmap.Create;
              try
                bmp:=vRezList[j];
                if bmp <> nil then
                begin
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
                end;
              finally
                bmp.Free;
              end;
            end;
            das.Attributes := v_DCMAttr;
          finally
            vRezList.Free;
            Screen.Cursor := crDefault;
            pbAVI.Visible := False;
            Application.ProcessMessages;
          end;
          //
          das.Attributes.AddVariant(dSOPInstanceUID, gt_uniq_InstanceUID );
          // STUDY
          v_StudyUID:=gt_uniq_StudyUID;
          v_StudyID:=gt_uniq_StudyID;
          v_SeriesUID:=gt_uniq_SeriesUID;
          das.Attributes.AddVariant(dSeriesInstanceUID, v_SeriesUID );
          das.Attributes.AddVariant(dStudyInstanceUID, v_StudyUID );
          das.Attributes.AddVariant(dStudyID, v_StudyID );

          das.Attributes.AddVariant(8, $16, '1.2.840.10008.5.1.4.1.1.7'); //sc - Secondary Capture Image Storage SOP Class
          das.Attributes.AddVariant(8, 8, 'ORIGINAL/PRIMARY//0001');
          //
          das.Attributes.AddVariant(dInstanceNumber, 1 );

          das.Attributes.Add(8, $21).AsDatetime[0] := now;
          das.Attributes.Add(8, $30).AsDatetime[0] := now;
          das.Attributes.Add(8, $33).AsDatetime[0] := now;

          //  Result.AddVariant($20, $13, AImageIndex);
          das.Attributes.AddVariant($28, $11, vWidth);
          das.Attributes.AddVariant($28, $10, vHeight);

          ALen := vWidth * vHeight * 3;

          das.Attributes.AddVariant($28, $8, avi1Ending - avi1Start - 1);
          das.Attributes.AddVariant($28, $2, 3);
          das.Attributes.AddVariant($28, $4, 'RGB');

          das.Attributes.AddVariant($28, $100, 8);
          das.Attributes.AddVariant($28, $101, 8);
          das.Attributes.AddVariant($28, $102, 8 - 1);

        // ---------------------------------------------------------------------
        end;
        // ---------------------------------------------------------------------
        pSetValues($08,$60, cxMod1.Text);               // Modality
        pSetValues($42,$12,'application/pdf');  // type of document
        pSetValues($10,$20,tePatientID.Text);   // ID пациента (PatientID)
        pSetValues($08,$1030,teOpisStudy.Text); // StudyDescription
        pSetValues($08,$90,teDoctor.Text);      // ФИО врача (Referring Physicians Name)
        pSetValues($10,$10,teFIOpac.Text);       // ФИО пациента (Patient Name)

        pSetValues ( $08, $20, '', deStudyDate.Date, 1 );
        pSetValues ( $08, $23, '', deStudyDate.Date, 1 );
        pSetValues ( $08, $2A, '', deStudyDate.Date, 1 );

        pSetValues ( $08, $30, '', Now, 1 );           // StudyTime
        pSetValues ( $08, $33, '', Now, 1 );           // ContentTime

        pSetValues( $0008, $0018 ,  gt_uniq_InstanceUID );  // dSOPInstanceUID
        pSetValues( $0020, $000E ,  gt_uniq_SeriesUID );  // dSeriesInstanceUID

        pSetValues( $08,$70 , 'Medotrade Ltd.' );
        pSetValues( $0008, $0016 ,  '1.2.840.10008.5.1.4.1.1.104.1' );  // dSOPClassUID - PDF encapsulated Storage SOP Class

        pSetValues( $0020, $000D ,  gt_uniq_StudyUID ); // dStudyInstanceUID
        pSetValues( $0008, $0050 ,  cxAccessionNumber1.Text ); // dAccessionNumber    gt_uniq_StudyUID

        pSetValues( $0020, $0011 ,'1');   // dSeriesNumber
        pSetValues( $0020, $0013 ,'1');   // dInstanceNumber

        pSetValues ( $10, $30, '', deDateBorn.Date, 1 );           // Дата рождения пациента (Patient Birth Date)

        pSetValues( $0020, $0010 , gt_uniq_StudyID );           // StudyID

        pSetValues( $0010, $0010 , TranslitRus(teFIOpac.Text) ); // dPatientName
        pSetValues( $0010, $0020 ,  tePatientID.Text );         // dPatientID

        pSetValues ( $0010, $0030, '', deDateBorn.Date, 1 );           // dPatientBirthDate

        if cxPolMan.Checked then
          pSetValues( $0010, $0040, 'M')   //  dPatientSex
        else if cxPolWoMan.Checked then
          pSetValues( $0010, $0040, 'F')
        else
          pSetValues( $0010, $0040, 'U');
        CnsDicomConnection1 := TCnsDicomConnection.Create(nil);   //  v_TransferSyntax
        CnsDicomConnection1.MySetTransferSyntax( ImplicitVRLittleEndian );
        with TfrmSendParam.Create(nil) do
        begin
          gt_pacs_aetitle ( v_device_name,
                            v_device_comm,
                            DB_CMN.trRead,
                            DB_CMN.DB,
                            frmMain.sCalledAETitle,
                            frmMain.sUser
                          );
          EdtAETitle.Text := v_device_comm + ' ('+v_device_name+')';
          if ShowModal = mrok then
          begin
            // сохраним в реестр
            wrt_pacs_aetitle ( v_device_name, v_device_comm, frmMain.sUser );
            CnsDicomConnection1.Host := teServer;
            CnsDicomConnection1.Port := tePort;
            CnsDicomConnection1.CalledTitle := v_device_name;
            CnsDicomConnection1.CallingTitle := frmMain.sCallingAETitle;
            CnsDicomConnection1.ReceiveTimeout := c_Timeout;
            DCM_Connection.PDUTempPath:=GetTempDirectory;
            try
              if rbPDF.Checked then
              begin
                CnsDicomConnection1.MySetTransferSyntax( ImplicitVRLittleEndian );
              end else if (rbBMP.Checked or rbJPEG.Checked) then
              begin
                // CnsDMTable1.Item[0].Attributes.ImageData.ImageData[0].TransferSyntax
                CnsDicomConnection1.MySetTransferSyntax( das.Attributes.ImageData.ImageData[0].TransferSyntax );
                // CnsDMTable1.Item[0].Attributes
              end else if rbFRM.Checked then
              begin
                CnsDicomConnection1.MySetTransferSyntax( ImplicitVRLittleEndian );
              end else if rbAVI.Checked then
              begin
                CnsDicomConnection1.MySetTransferSyntax( ImplicitVRLittleEndian );
              end;

            //  vTmp := das.Attributes.GetString($08,$60);


              pUsrMsg( CnsDicomConnection1.C_STORAGE( das.Attributes ) );
            finally
              MyDisconnectAssociation(CnsDicomConnection1);
              CnsDicomConnection1.Free;
            end;
            Free;
          end;
        end;
      finally
        das.Free;
        CnsDMTable1.Free;
      end;
      ModalResult:=mrOk;
    end;
end;

procedure TfrmImportPDF.FormCreate(Sender: TObject);
begin
  // ---------------------------------------------------------------------------
  tePatientID.Text:= 'vga1';
  teFIOpac.Text:= 'vga1';
  deDateBorn.Date := Date;
  teOpisStudy.Text:= 'vga1';
  teDoctor.Text:= 'vga1';
  cxMod1.Text:= 'US';
  cxAccessionNumber1.Text:= 'vga1';
  bteditFile.Text:= 'C:\tmp\test_dicom_avi_frm_s\data\15100217avi7.avi';
  rbAVI.Checked:=True;
  // ---------------------------------------------------------------------------
  deStudyDate.Date := Date ;
  cxAccessionNumber1.Text := gt_uniq_StudyUID ;
  cxMod1.Properties.Items.Clear;
  ctrFullModList(TStringList(cxMod1.Properties.Items));
end;

end.
