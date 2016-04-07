unit UnComment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, Medotrade, dxSkinOffice2007Green,
  dxSkinscxPCPainter, cxContainer, cxEdit, cxTextEdit, cxMemo, cxPC, cxControls,
  Menus, cxSplitter, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, cxLookAndFeelPainters, FIBDataSet,
  pFIBDataSet, cxButtons, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls,
  FIBDatabase, pFIBDatabase, dxSkinOffice2007Black, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxRadioGroup, cxLabel, dxdbtrel, ComCtrls, dxSkinsdxBarPainter,
  dxBar, dxBarExtItems, DB_CMN, DB_CMN1, cxProgressBar, Uni, MemDS, DBAccess, DCM_Client;

type
  TfrmComment = class(TForm)
    cxPageControl1: TcxPageControl;
    tsDiagnos: TcxTabSheet;
    MemOsnDz: TcxMemo;
    tsFiles: TcxTabSheet;
    MemDopDz: TcxMemo;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    cxSplitter1: TcxSplitter;
    Panel1: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    sFileList: TDataSource;
    dsFileList: TpFIBDataSet;
    colFDATE: TcxGridDBColumn;
    colFCOMMENT: TcxGridDBColumn;
    colF_ID: TcxGridDBColumn;
    cxButton1: TcxButton;
    tsFields: TcxTabSheet;
    cxLabel1: TcxLabel;
    tePatientID: TcxTextEdit;
    cxLabel5: TcxLabel;
    teFIOpac: TcxTextEdit;
    cxLabel8: TcxLabel;
    cxPolMan: TcxRadioButton;
    cxPolWoMan: TcxRadioButton;
    cxLabel7: TcxLabel;
    deDateBorn: TcxDateEdit;
    cxLabel2: TcxLabel;
    deStudyDate: TcxDateEdit;
    cxLabel3: TcxLabel;
    teOpisStudy: TcxTextEdit;
    cxLabel4: TcxLabel;
    teDoctor: TcxTextEdit;
    cxRadioButton3: TcxRadioButton;
    cxLabel6: TcxLabel;
    teStudyUID: TcxTextEdit;
    cxLabel9: TcxLabel;
    teAccessionNumber: TcxTextEdit;
    cxLabel10: TcxLabel;
    cbType: TcxComboBox;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    dxTreeViewEdit1: TdxTreeViewEdit;
    dxTreeViewEdit2: TdxTreeViewEdit;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    cxLabel13: TcxLabel;
    teAE: TcxTextEdit;
    CheckBox1: TCheckBox;
    ProgressBar1: TcxProgressBar;
    UniQuery1: TUniQuery;
    tsInfoFromFile: TcxTabSheet;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxPatientID: TcxTextEdit;
    cxFIOPac: TcxTextEdit;
    cxLabel16: TcxLabel;
    cxPolMan1: TcxRadioButton;
    cxPolWoMan1: TcxRadioButton;
    cxLabel17: TcxLabel;
    cxDateBrn1: TcxDateEdit;
    cxLabel18: TcxLabel;
    cxStudyDate1: TcxDateEdit;
    cxLabel20: TcxLabel;
    cxAccessionNumber1: TcxTextEdit;
    cxLabel21: TcxLabel;
    cxMod1: TcxComboBox;
    cxLabel22: TcxLabel;
    cxStudyUID1: TcxTextEdit;
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    vFIO_old,
    vP_PID_OLD ,
    vSTUDYUID_OLD ,
    vACCESSIONNUMBER_OLD : string;
    v_CnsDMTable_tmp : TCnsDMTable;
  public
    vFilenameTmp,
    v_STUDYUID : string;
    vIDosnDiag, vIDdopDiag, vPage : Integer;
    procedure ShowForm( p_STUDYUID : string );
    procedure filelist_refresh;
  end;

var
  frmComment: TfrmComment;

implementation

{$R *.dfm}

Uses pFIBQuery, DCM_Connection, pFIBProps, FIBQuery, DCM_Attributes,
     DCM_Dict, DCM_UID, DICOM_CMN, fMain, CmnUnit,
     UnFrmAddDocument, UnFrmFileBrowse, DICOM_charset, JvJCLUtils;

procedure TfrmComment.ShowForm( p_STUDYUID : string );
var vFIBDataSet : TpFIBDataSet; vFileName, vStrTmp : string;
    vTreeNodeosn, vTreeNodedop  : TTreeNode;
    vTreeNode1:TTreeNode;
    v_UniQr : TUniQuery;
    vDt : TDateTime;
  procedure gtValues ( pDateSet : TDataset );
  begin
    vFIO_old             := pDateSet.FieldByName('p_ename').AsString;
    vIDosnDiag           := pDateSet.FieldByName('FK_IDOSNDIAG').AsInteger ;
    vIDdopDiag           := pDateSet.FieldByName('FK_IDDOPDIAG').AsInteger ;
    vP_PID_OLD           := pDateSet.FieldByName('P_PID').AsString ;
    vSTUDYUID_OLD        := pDateSet.FieldByName('STUDYUID').AsString ;
    vACCESSIONNUMBER_OLD := pDateSet.FieldByName('ACCESSIONNUMBER').AsString ;
    tePatientID.Text := pDateSet.FieldByName('P_PID').AsString ;
    teFIOpac.Text := pDateSet.FieldByName('P_ENAME').AsString ;
    if pDateSet.FieldByName('P_SEX').AsString='F' then
      cxPolWoMan.Checked:=True
    else
      cxPolMan.Checked:=True;
    deDateBorn.Date        := pDateSet.FieldByName('P_DATEBORN').AsDateTime ;
    deStudyDate.Date       := pDateSet.FieldByName('LDATE').AsDateTime ;
    teOpisStudy.Text       := pDateSet.FieldByName('STUDYDESCRIPTION').AsString ;
    teDoctor.Text          := pDateSet.FieldByName('referringphysicianname').AsString ;
    teStudyUID.Text        := pDateSet.FieldByName('STUDYUID').AsString ;
    teAccessionNumber.Text := pDateSet.FieldByName('ACCESSIONNUMBER').AsString ;
    cbType.Text            := pDateSet.FieldByName('STUDIES_IMAGE_TYPE').AsString ;
    teAE.Text              := pDateSet.FieldByName('FC_AEAPPARAT').AsString ;
  end;
begin
  if vPage=0 then
  begin
    v_STUDYUID := p_STUDYUID;
    //
    if v_isOracle then     // ORACLE
    begin
    end else if v_isPostgres then
    begin
      v_UniQr := TUniQuery.Create(nil);
      try
        v_UniQr.Connection:=DB_CMN.PGconn;
        v_UniQr.Transaction:=DB_CMN.MnUniTransaction;

        v_UniQr.SQL.Text := 'SELECT s.* '+
          '  from '+v_pg_schema+'.studies s, '+v_pg_schema+'.patients p'+
          '  where  s.p_pid = p.p_pid and s.studyuid=:p_studyuid';
        v_UniQr.ParamByName('p_studyuid').AsString := v_STUDYUID;
        v_UniQr.Open;
        vIDosnDiag := 0 ;
        vIDdopDiag := 0 ;
        if not v_UniQr.Eof then
        begin
          gtValues(v_UniQr);
          try
            vFileName := PDUTempPath+'\'+inttostr(GetTickCount)+'.tmp';
            TBlobField(v_UniQr.FieldByName('FC_MNDIAGNOS')).SaveToFile( vFileName );
            MemOsnDz.Lines.LoadFromFile( vFileName );
          finally
            if FileExists(vFileName) then DeleteFile(vFileName);
          end;
          try
            vFileName := PDUTempPath+'\'+inttostr(GetTickCount+1)+'.tmp';
            TBlobField(v_UniQr.FieldByName('FC_ADDDIAGNOS')).SaveToFile( vFileName );
            MemDopDz.Lines.LoadFromFile( vFileName );
          finally
            if FileExists(vFileName) then DeleteFile(vFileName);
          end;
        end;
      finally
        v_UniQr.Free;
      end;
    end else
    begin       // firebird
      vFIBDataSet := TpFIBDataSet.Create(nil);
      try
        vFIBDataSet.Database := DB_CMN.DB;
        vFIBDataSet.Transaction := DB_CMN.trRead;
        vFIBDataSet.SelectSQL.Text := 'SELECT s.* '+
          '  FROM STUDIES s, PATIENTS p'+
          '  WHERE  s.P_PID = p.P_PID and s.studyuid=:p_studyuid';
        vFIBDataSet.ParamByName('p_studyuid').AsString := v_STUDYUID;
        vFIBDataSet.Open;
        vIDosnDiag := 0 ;
        vIDdopDiag := 0 ;
        if not vFIBDataSet.Eof then
        begin
          gtValues(vFIBDataSet);
          try
            vFileName := PDUTempPath+'\'+inttostr(GetTickCount)+'.tmp';
            TBlobField(vFIBDataSet.FieldByName('FC_MNDIAGNOS')).SaveToFile( vFileName );
            MemOsnDz.Lines.LoadFromFile( vFileName );
          finally
            if FileExists(vFileName) then DeleteFile(vFileName);
          end;
          try
            vFileName := PDUTempPath+'\'+inttostr(GetTickCount+1)+'.tmp';
            TBlobField(vFIBDataSet.FieldByName('FC_ADDDIAGNOS')).SaveToFile( vFileName );
            MemDopDz.Lines.LoadFromFile( vFileName );
          finally
            if FileExists(vFileName) then DeleteFile(vFileName);
          end;
        end;
        vFIBDataSet.Close;
      finally
        vFIBDataSet.Free;
      end;
    end;
    //
    filelist_refresh;
    //cxPageControl1.ActivePageIndex := 0 ;
    vTreeNodeosn:=nil;
    vTreeNodedop:=nil;
    vTreeNode1:=dxTreeViewEdit1.Items.Add( nil, '<не задано>' );
    vTreeNode1.Data := Pointer( -1 );
    frmDiagTree ( dxTreeViewEdit1, nil, -1, 0 ) ;
    vTreeNode1:=dxTreeViewEdit2.Items.Add( nil, '<не задано>' );
    vTreeNode1.Data := Pointer( -1 );
    frmDiagTree ( dxTreeViewEdit2, nil, -1, 1 ) ;
    if vTreeNodeosn<>nil then
      dxTreeViewEdit1.Text := vTreeNodeosn.Text ;
    if vTreeNodedop<>nil then
      dxTreeViewEdit2.Text := vTreeNodedop.Text ;
    tsInfoFromFile.TabVisible :=False;
    tsDiagnos.TabVisible :=False;
    tsFields.TabVisible :=True;
    tsFiles.TabVisible :=True;
    cxPageControl1.ActivePage := tsFields;
    frmComment.ShowModal;
  end else if vPage=1  then
  begin
    tsInfoFromFile.TabVisible :=True;
    tsFields.TabVisible :=False;
    tsFiles.TabVisible :=False;
    tsDiagnos.TabVisible :=False;
    //
    try
      v_CnsDMTable_tmp.LoadFromFile(vFilenameTmp);
    except
      on E:Exception do ShowMessage('Error : '+E.Message);
    end;

  //  TDicomAttributes(v_CnsDMTable_tmp[0].Attributes).

    cxPatientID.Text := TDicomAttributes(v_CnsDMTable_tmp[0].Attributes).GetString(dPatientID) ;
    cxFIOPac.Text    := TDicomAttributes(v_CnsDMTable_tmp[0].Attributes).GetString(dPatientName) ;
    if TDicomAttributes(v_CnsDMTable_tmp[0].Attributes).GetString(dPatientSex) = 'M' then
    begin
      cxPolMan1.Checked := True;
      cxPolWoMan1.Checked := False;
    end else if TDicomAttributes(v_CnsDMTable_tmp[0].Attributes).GetString(dPatientSex) = 'F' then
    begin
      cxPolMan1.Checked := False;
      cxPolWoMan1.Checked := True;
    end;
    vStrTmp:=TDicomAttributes(v_CnsDMTable_tmp[0].Attributes).GetString(dPatientBirthDate);
    if TryStrToDate(vStrTmp,vDt) then
      cxDateBrn1.Date := vDt;
    vStrTmp:=TDicomAttributes(v_CnsDMTable_tmp[0].Attributes).GetString(dStudyDate);
    if TryStrToDate(vStrTmp,vDt) then
      cxStudyDate1.Date := vDt;
    cxAccessionNumber1.Text    := TDicomAttributes(v_CnsDMTable_tmp[0].Attributes).GetString(dAccessionNumber) ;
    cxMod1.Text    := TDicomAttributes(v_CnsDMTable_tmp[0].Attributes).GetString(dModality) ;
    cxStudyUID1.Text    := TDicomAttributes(v_CnsDMTable_tmp[0].Attributes).GetString(dStudyInstanceUID) ;
    //
    cxPageControl1.ActivePage := tsInfoFromFile;
    frmComment.ShowModal;
  end;
end;

procedure TfrmComment.cxButton1Click(Sender: TObject);
var vFIBDataSet : TpFIBDataSet; vFileName : string;
    v_UniQr : TUniQuery;
  procedure pFileShow;
  begin
    if (Trim(vFileName)<>'') and FileExists(vFileName) then
    begin
      Application.CreateForm(TfrmFileBrowse, frmFileBrowse);
      try
        frmFileBrowse.ShowForm(vFileName);
      finally
        frmFileBrowse.Free;
      end;
      Application.ProcessMessages;
      Sleep(1000);
      DeleteFile(vFileName);
    end;
  end;
begin  // Просмотр документа
  if v_isOracle then     // ORACLE
  begin
  end else if v_isPostgres then
  begin
    v_UniQr := TUniQuery.Create(nil);
    try
      v_UniQr.Connection:=DB_CMN.PGconn;
      v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
      v_UniQr.SQL.Text := 'select f_file from '+v_pg_schema+'.studydocs where f_id=:f_id';
      v_UniQr.ParamByName('F_ID').AsInteger := dsFileList.FieldByName('F_ID').AsInteger;
      v_UniQr.Open;
      v_UniQr.First;
      if not v_UniQr.Eof then
      begin
        vFileName := PDUTempPath+'\'+inttostr(GetTickCount)+'.pdf';
        TBlobField(v_UniQr.FieldByName('F_FILE')).SaveToFile(vFileName);
      end;
    finally
      v_UniQr.Free;
    end;
    pFileShow;
  end else
  begin       // firebird
    if not dsFileList.Eof then
    begin
      vFIBDataSet := TpFIBDataSet.Create(nil);
      try
        vFIBDataSet.Database := DB_CMN.DB;
        vFIBDataSet.Transaction := DB_CMN.trRead;
        if DB_CMN.trRead.Active = False then
          DB_CMN.trRead.StartTransaction;
        vFIBDataSet.SQLs.SelectSQL.Text := 'select F_FILE from STUDYDOCS where F_ID=:F_ID';
        vFIBDataSet.ParamByName('F_ID').AsInteger := dsFileList.FieldByName('F_ID').AsInteger;
        vFIBDataSet.Open;
        vFIBDataSet.First;
        if not vFIBDataSet.Eof then
        begin
          vFileName := PDUTempPath+'\'+inttostr(GetTickCount)+'.pdf';
          TBlobField(vFIBDataSet.FieldByName('F_FILE')).SaveToFile(vFileName);
        end;
      finally
        vFIBDataSet.Free;
      end;
      pFileShow;
    end;
  end;
end;

procedure TfrmComment.cxButton2Click(Sender: TObject);
var vFIBQuery : TpFIBQuery; v_UniQr : TUniQuery;
begin
  if v_isOracle then     // ORACLE
  begin
  end else if v_isPostgres then
  begin
    if not UniQuery1.Eof then
      if ( MessageDlg('Удалить запись ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes ) then
      begin
        v_UniQr := TUniQuery.Create(nil);
        try
          v_UniQr.Connection:=DB_CMN.PGconn;
          v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
          v_UniQr.SQL.Text := 'delete from '+v_pg_schema+'.studydocs where f_id=:f_id';
          v_UniQr.ParamByName('F_ID').AsInteger := UniQuery1.FieldByName('F_ID').AsInteger;
          v_UniQr.ExecSQL;
          filelist_refresh;
        finally
          v_UniQr.Free;
        end;
      end;
  end else
  begin       // firebird
    if not dsFileList.Eof then
      if ( MessageDlg('Удалить запись ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes ) then
      begin
        vFIBQuery := TpFIBQuery.Create(nil);
        try
          vFIBQuery.Database := DB_CMN.DB;
          vFIBQuery.Transaction := DB_CMN.trWrite;
          if DB_CMN.trWrite.Active = False then
            DB_CMN.trWrite.StartTransaction;
          vFIBQuery.Options := vFIBQuery.Options + [qoAutoCommit];
          vFIBQuery.SQL.Text := 'delete from STUDYDOCS where F_ID=:F_ID';
          vFIBQuery.ParamByName('F_ID').AsInteger := dsFileList.FieldByName('F_ID').AsInteger;
          vFIBQuery.ExecQuery;
          filelist_refresh;
        finally
          vFIBQuery.Free;
        end;
      end;
  end;
end;

procedure TfrmComment.cxButton3Click(Sender: TObject);
begin
  filelist_refresh;
end;

procedure TfrmComment.cxButton4Click(Sender: TObject);
begin // редактировать описание
  Application.CreateForm(TFrmAddDocument, FrmAddDocument);
  try
    FrmAddDocument.IsAdd := False ;
    FrmAddDocument.vComm := dsFileList.FieldByName('FCOMMENT').AsString ;
    FrmAddDocument.v_id  := dsFileList.FieldByName('F_ID').AsInteger ;
    FrmAddDocument.ShowForm(v_STUDYUID);
    filelist_refresh;
  finally
    FrmAddDocument.Free;
  end;
end;

procedure TfrmComment.cxButton5Click(Sender: TObject);
begin // добавить документ
  Application.CreateForm(TFrmAddDocument, FrmAddDocument);
  try
    FrmAddDocument.IsAdd := True ;
    FrmAddDocument.vComm := '' ;
    FrmAddDocument.v_id:=-1;
    FrmAddDocument.ShowForm(v_STUDYUID);
    filelist_refresh;
  finally
    FrmAddDocument.Free;
  end;
end;

procedure TfrmComment.dxBarLargeButton1Click(Sender: TObject);
var vFIBDataSet : TpFIBDataSet;
    vFIBQuery : TpFIBQuery; vOK : Boolean;
    vFileName1, vFileName2, vteFIOpac, vteFIOpacE,
    vP_FAM, vP_IM, vP_OTCH : string;
    vErrNmb : integer; vFnd : Boolean;
    v_UniQr : TUniQuery;
  procedure pDsIni ( pFIBDataSet : TpFIBDataSet; pIsRead : Boolean = True );
  begin
    pFIBDataSet.Database := DB_CMN.DB;
    if pIsRead then begin
      pFIBDataSet.Transaction := DB_CMN.trRead;
      if DB_CMN.trRead.Active = False then
        DB_CMN.trRead.StartTransaction;
    end else begin
      pFIBDataSet.Transaction := DB_CMN.trWrite;
      if DB_CMN.trWrite.Active = False then
        DB_CMN.trWrite.StartTransaction;
    end;
  end;
  procedure pQrIni ( pFIBQuery : TpFIBQuery; pIsRead : Boolean = True );
  begin
    pFIBQuery.Database := DB_CMN.DB;
    if pIsRead then begin
      pFIBQuery.Transaction := DB_CMN.trRead;
      if DB_CMN.trRead.Active = False then
        DB_CMN.trRead.StartTransaction;
    end else begin
      pFIBQuery.Transaction := DB_CMN.trWrite;
      if DB_CMN.trWrite.Active = False then
        DB_CMN.trWrite.StartTransaction;
    end;
    pFIBQuery.Options := pFIBQuery.Options + [qoAutoCommit];
  end;
  procedure checkPacsData;
  var vInstancesStr : TStringList;
      vAmm, vi, v_iii : Integer;
      das : TDicomAttributes;
      da1 : TDicomDataset;
      CnsDicomConnection1, CnsDicomConnection2 : TCnsDicomConnection ;
    procedure pAssignAttr ( pGroup, pElement : Integer; pText:string );
    begin
      if Assigned(da1.Attributes.Item[pGroup, pElement]) then da1.Attributes.Remove(pGroup, pElement);
      da1.Attributes.Add(pGroup, pElement); // tePacFIO Пациент
      if (Trim(pText)<>'') then
        da1.Attributes.Add(pGroup, pElement).AsString[0] := Trim(pText)
      else
        da1.Attributes.Add(pGroup, pElement);
    end;
    procedure pAssignDTAttr ( pGroup, pElement : Integer; pDT:TDateTime );
    begin
      if Assigned(da1.Attributes.Item[pGroup, pElement]) then da1.Attributes.Remove(pGroup, pElement);
      da1.Attributes.Add( pGroup, pElement );
      da1.Attributes.Add( pGroup, pElement ).AsDatetime[0] := pDT;
    end;
  begin
    if CheckBox1.Checked then
      if MessageDlg('Сохранить данные в файлы PACS сервера ?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then begin
        // 1. Получение списка STUDYUID c PACS сервера
        // 2. В цикле Чтение/изменение/сохранение снимка
        ProgressBar1.Visible := True;
        Screen.Cursor := crHourGlass;
        vInstancesStr := TStringList.Create;
        try
          ProgressBar1.Properties.Text:='Получение списка снимков по исследованию с PACS ...';
          ProgressBar1.Properties.ShowTextStyle := cxtsText ;
          //
          if v_isOracle then     // ORACLE
          begin
          end else if v_isPostgres then
          begin
            v_UniQr := TUniQuery.Create(nil);
            try
              v_UniQr.Connection:=DB_CMN.PGconn;
              v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
              v_UniQr.SQL.Text := 'SELECT i.instanceuid FROM '+v_pg_Schema+'.images i where i.studyuid=:p_studyuid';
              v_UniQr.ParamByName('p_studyuid').AsString := v_STUDYUID;
              v_UniQr.Open;v_UniQr.First;
              vAmm:=0;
              while not v_UniQr.Eof do begin
                Inc(vAmm);
                vInstancesStr.Append( v_UniQr.FieldByName('instanceuid').AsString );
                v_UniQr.Next;
              end;
            finally
              v_UniQr.Free;
            end;
          end else begin
            vFIBDataSet := TpFIBDataSet.Create(nil);
            try
              pDsIni( vFIBDataSet, True );
              vFIBDataSet.SelectSQL.Text:= 'SELECT i.instanceuid FROM images i where i.studyuid=:p_studyuid';
              vFIBDataSet.ParamByName('p_studyuid').AsString := v_STUDYUID;
              vFIBDataSet.Open;vFIBDataSet.First;
              vAmm:=0;
              while not vFIBDataSet.Eof do begin
                Inc(vAmm);
                vInstancesStr.Append( vFIBDataSet.FieldByName('instanceuid').AsString );
                vFIBDataSet.Next;
              end;
            finally
              vFIBDataSet.Free;
            end;
          end;
          ProgressBar1.Properties.ShowTextStyle := cxtsPercent ;
          ProgressBar1.Properties.Max := vAmm;
          ProgressBar1.Properties.Min := 0 ;
          ProgressBar1.Position := 0 ;
          param_read ( frmMain.sPort,
                   frmMain.sIP,
                   frmMain.sCalledAETitle,
                   frmMain.sCallingAETitle,
                   frmMain.sLocalPort,
                   frmMain.sCDDir,
                   frmMain.sDBpath,
                   frmMain.sIMGpath
                 );
          for vI := 0 to vAmm - 1 do
          begin
            // загрузим изображение
            CnsDicomConnection1 := TCnsDicomConnection.Create(self); // ,RLELossless
            CnsDicomConnection1.MySetTransferSyntax( RLELossless );  //  JPEGLossless
            CnsDicomConnection1.Host := frmMain.sIP;
            CnsDicomConnection1.Port := StrToInt(frmMain.sPort);
            CnsDicomConnection1.CalledTitle := frmMain.sCalledAETitle;
            CnsDicomConnection1.CallingTitle := frmMain.sCallingAETitle;
            CnsDicomConnection1.ReceiveTimeout := c_Timeout;
            DCM_Connection.PDUTempPath:=GetTempDirectory;
            try
              das := TDicomAttributes.Create;
              with das do
              begin
                AddVariant(78, 'IMAGE');
                AddVariant( dStudyInstanceUID, v_STUDYUID );
                AddVariant( dSOPInstanceUID, vInstancesStr[vI] );
                if CnsDicomConnection1.C_GET(das) then // получаем снимки
                begin
                  for v_iii := 0 to CnsDicomConnection1.ReceiveDatasets.Count - 1 do // отображаем снимки
                  begin
                    da1 := TDicomDataset.Create(TDicomAttributes(CnsDicomConnection1.ReceiveDatasets[v_iii]));
                    try
                      // проверка на STUDYUID и INSTANCEUID


                        if vP_PID_OLD<>tePatientID.Text then
                          // tePatientID       // dPatientID = 148;           Add(148, $0010, $0020, tLO, 'PatientID', '1');
                          pAssignAttr($0010, $0020, tePatientID.Text);
                        // teFIOpac          // dPatientName = 147;         Add(147, $0010, $0010, tPN, 'PatientName', '1');
                        pAssignAttr( $0010, $0010, teFIOpac.Text);

                        if cxPolMan.Checked then begin // dPatientSex = 152;          Add(152, $0010, $0040, tCS, 'PatientSex', '1');
                          pAssignAttr( $0010, $0040, 'M');
                        end else if cxPolWoMan.Checked then begin
                          pAssignAttr( $0010, $0040, 'F');
                        end;
                        if vACCESSIONNUMBER_OLD<>teAccessionNumber.Text then
                        begin // teAccessionNumber // dAccessionNumber = 77;      Add(77, $0008, $0050, tSH, 'AccessionNumber', '1');
                          pAssignAttr( $0008, $0050, teAccessionNumber.Text);
                        end;
                        // cbType            // dModality = 81;             Add(81, $0008, $0060, tCS, 'Modality', '1');
                        pAssignAttr( $0008, $0060, cbType.Text);
                        // deDateBorn        // dPatientBirthDate = 150;    Add(150, $0010, $0030, tDA, 'PatientBirthDate', '1');
                        pAssignDTAttr( $0010, $0030, deDateBorn.Date );
                        // deStudyDate       // dStudyDate = 64;            Add(64, $0008, $0020, tDA, 'StudyDate', '1');
                        pAssignDTAttr( $0008, $0020, deStudyDate.Date );
                        da1.Attributes.Sort;
                        //
                        // сохраним на PACS сервер

                    //    da1.SaveToFile('d:\1.dcm',True,8193,100);
                      CnsDicomConnection2 := TCnsDicomConnection.Create(self); // ,RLELossless
                      try

                        CnsDicomConnection2.MySetTransferSyntax( RLELossless );  //  JPEGLossless
                        CnsDicomConnection2.Host := frmMain.sIP;
                        CnsDicomConnection2.Port := StrToInt(frmMain.sPort);
                        CnsDicomConnection2.CalledTitle := frmMain.sCalledAETitle;
                        CnsDicomConnection2.CallingTitle := frmMain.sCallingAETitle;
                        CnsDicomConnection2.ReceiveTimeout := c_Timeout;

                        If not CnsDicomConnection2.C_STORAGE( da1.Attributes ) then
                          MessageDlg('Ошибка сохранения данных ...', mtError, [mbOK], 0);

                      finally
                        MyDisconnectAssociation(CnsDicomConnection2);
                        CnsDicomConnection2.free;
                      end;

                    finally
                      da1.Free;
                    end;
                  end;
                  CnsDicomConnection1.ReceiveDatasets.Clear;
                end;
              end;
            finally
              MyDisconnectAssociation(CnsDicomConnection1);
              CnsDicomConnection1.free;
            end;
            ProgressBar1.Position:=ProgressBar1.Position+1;
          end;
          ProgressBar1.Position := 0 ;
          ProgressBar1.Properties.Text:='Завершено ...';
          ProgressBar1.Properties.ShowTextStyle := cxtsText ;
        finally
          Screen.Cursor := crDefault;
          ProgressBar1.Visible := False;
          vInstancesStr.Free;
        end;
      end;
  end;
  function chkPacient ( pPatientID:string ) : Boolean;
  var v_UniQr : TUniQuery; vFIBDataSet : TpFIBDataSet;
  begin
    if v_isOracle then     // ORACLE
    begin
    end else if v_isPostgres then
    begin
      v_UniQr := TUniQuery.Create(nil);
      try
        v_UniQr.Connection:=DB_CMN.PGconn;
        v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
        v_UniQr.SQL.Text := 'select 1 FROM '+v_pg_Schema+'.patients where p_pid=:p_pid';
        v_UniQr.ParamByName('P_PID').AsString := pPatientID;
        v_UniQr.Open; v_UniQr.First;
        Result:=v_UniQr.Eof;
      finally
        v_UniQr.Free;
      end;
    end else begin
      vFIBDataSet := TpFIBDataSet.Create(nil);
      try
        pDsIni( vFIBDataSet, True );
        vFIBDataSet.SelectSQL.Text := 'select 1 FROM PATIENTS where P_PID=:P_PID';
        vFIBDataSet.ParamByName('P_PID').AsString := pPatientID;
        vFIBDataSet.Open; vFIBDataSet.First;
        Result:=vFIBDataSet.Eof;
      finally
        vFIBDataSet.Free;
      end;
    end;
  end;
  function chkStudy( pStudyUID:string ):Boolean;
  var v_UniQr : TUniQuery; vFIBDataSet : TpFIBDataSet;
  begin
    if v_isOracle then     // ORACLE
    begin
    end else if v_isPostgres then
    begin
      v_UniQr := TUniQuery.Create(nil);
      try
        v_UniQr.Connection:=DB_CMN.PGconn;
        v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
        v_UniQr.SQL.Text := 'select 1 from '+v_pg_Schema+'.studies where studyuid=:studyuid';
        v_UniQr.ParamByName('p_studyuid').AsString := pStudyUID;
        v_UniQr.Open; v_UniQr.First;
        Result:=v_UniQr.Eof;
      finally
        v_UniQr.Free;
      end;
    end else begin
      vFIBDataSet := TpFIBDataSet.Create(nil);
      try
        pDsIni( vFIBDataSet, True );
        vFIBDataSet.SelectSQL.Text := 'select 1 from studies where studyuid=:studyuid';
        vFIBDataSet.ParamByName('p_studyuid').AsString := pStudyUID;
        vFIBDataSet.Open; vFIBDataSet.First;
        Result:=vFIBDataSet.Eof;
      finally
        vFIBDataSet.Free;
      end;
    end;
  end;
  function chkACCESSIONNUMBER:Boolean;
  var v_UniQr : TUniQuery; vFIBDataSet : TpFIBDataSet;
  begin
    if v_isOracle then     // ORACLE
    begin
    end else if v_isPostgres then
    begin
      v_UniQr := TUniQuery.Create(nil);
      try
        v_UniQr.Connection:=DB_CMN.PGconn;
        v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
        v_UniQr.SQL.Text := 'select 1 from '+v_pg_Schema+'.studies where studyuid<>:studyuid and accessionnumber=:accessionnumber';
        v_UniQr.ParamByName('STUDYUID').AsString := vSTUDYUID_OLD;
        v_UniQr.ParamByName('ACCESSIONNUMBER').AsString := teAccessionNumber.Text ;
        v_UniQr.Open; v_UniQr.First;
        Result:=v_UniQr.Eof;
      finally
        v_UniQr.Free;
      end;
    end else begin
      vFIBDataSet := TpFIBDataSet.Create(nil);
      try
        pDsIni( vFIBDataSet, True );
        vFIBDataSet.SelectSQL.Text := 'select 1 FROM studies where STUDYUID<>:STUDYUID and ACCESSIONNUMBER=:ACCESSIONNUMBER';
        vFIBDataSet.ParamByName('STUDYUID').AsString := vSTUDYUID_OLD;
        vFIBDataSet.ParamByName('ACCESSIONNUMBER').AsString := teAccessionNumber.Text ;
        vFIBDataSet.Open; vFIBDataSet.First;
        Result:=vFIBDataSet.Eof;
      finally
        vFIBDataSet.Free;
      end;
    end;
  end;
  procedure updStudies;
  var v_UniQr : TUniQuery; vFIBDataSet : TpFIBDataSet;
  begin
    vFileName1 := PDUTempPath+'\'+inttostr(GetTickCount)+'.tmp';
    vFileName2 := PDUTempPath+'\'+inttostr(GetTickCount)+'.tmp';
    MemOsnDz.Lines.SaveToFile(vFileName1);
    MemDopDz.Lines.SaveToFile(vFileName2);
    //
    if v_isOracle then     // ORACLE
    begin
    end else if v_isPostgres then
    begin
      v_UniQr := TUniQuery.Create(nil);
      try
        v_UniQr.Connection:=DB_CMN.PGconn;
        v_UniQr.Transaction:=DB_CMN.MnUniTransaction;

        v_UniQr.SQL.Text := 'update studies s set FC_MNDIAGNOS=:FC_MNDIAGNOS, FC_ADDDIAGNOS=:FC_ADDDIAGNOS, '+
                              ' P_PID=:P_PID, P_ENAME_RUS=:P_ENAME_RUS, P_ENAME=:P_ENAME, P_SEX=:P_SEX, '+
                              ' P_DATEBORN=:P_DATEBORN, LDATE=:LDATE, STUDYDESCRIPTION=:STUDYDESCRIPTION, '+
                              ' referringphysicianname=:referringphysicianname, STUDYUID=:STUDYUID, '+
                              ' FK_IDOSNDIAG=:FK_IDOSNDIAG, FK_IDDOPDIAG=:FK_IDDOPDIAG, FC_AEAPPARAT=:FC_AEAPPARAT, '+
                              ' ACCESSIONNUMBER=:ACCESSIONNUMBER, STUDIES_IMAGE_TYPE=:STUDIES_IMAGE_TYPE '+
                              ' where s.studyuid=:p_studyuid';
        v_UniQr.ParamByName('FC_AEAPPARAT').AsString := teAE.Text;
        v_UniQr.ParamByName('FK_IDOSNDIAG').AsInteger := vIDosnDiag;
        v_UniQr.ParamByName('FK_IDDOPDIAG').AsInteger := vIDdopDiag;
        v_UniQr.ParamByName('p_studyuid').AsString := frmComment.v_STUDYUID;
        v_UniQr.ParamByName('FC_MNDIAGNOS').LoadFromFile(vFileName1, ftBlob);
        v_UniQr.ParamByName('FC_ADDDIAGNOS').LoadFromFile(vFileName2, ftBlob);
        v_UniQr.ParamByName('P_ENAME').AsString :=     vteFIOpac;
        v_UniQr.ParamByName('P_ENAME_RUS').AsString := vteFIOpacE;
        if cxPolWoMan.Checked then
          v_UniQr.ParamByName('P_SEX').AsString := 'F'
        else
          v_UniQr.ParamByName('P_SEX').AsString := 'M';

        v_UniQr.ParamByName('P_DATEBORN').AsDateTime := deDateBorn.Date ;
        v_UniQr.ParamByName('LDATE').AsDateTime := deStudyDate.Date ;
        v_UniQr.ParamByName('STUDYDESCRIPTION').AsString := teOpisStudy.Text ;
        v_UniQr.ParamByName('referringphysicianname').AsString := teDoctor.Text ;
        v_UniQr.ParamByName('STUDIES_IMAGE_TYPE').AsString := cbType.Text ;

        v_UniQr.ParamByName('P_PID').AsString := tePatientID.Text ;
        v_UniQr.ParamByName('STUDYUID').AsString := teStudyUID.Text ;
        v_UniQr.ParamByName('ACCESSIONNUMBER').AsString := teAccessionNumber.Text ;

        v_UniQr.ExecSQL;

      finally
        v_UniQr.Free;
      end;
    end else begin
      vFIBQuery := TpFIBQuery.Create(nil);
      try
        pQrIni( vFIBQuery, False );
        vFIBQuery.SQL.Text := 'update studies s set FC_MNDIAGNOS=:FC_MNDIAGNOS, FC_ADDDIAGNOS=:FC_ADDDIAGNOS, '+
                              ' P_PID=:P_PID, P_ENAME_RUS=:P_ENAME_RUS, P_ENAME=:P_ENAME, P_SEX=:P_SEX, '+
                              ' P_DATEBORN=:P_DATEBORN, LDATE=:LDATE, STUDYDESCRIPTION=:STUDYDESCRIPTION, '+
                              ' referringphysicianname=:referringphysicianname, STUDYUID=:STUDYUID, '+
                              ' FK_IDOSNDIAG=:FK_IDOSNDIAG, FK_IDDOPDIAG=:FK_IDDOPDIAG, FC_AEAPPARAT=:FC_AEAPPARAT, '+
                              ' ACCESSIONNUMBER=:ACCESSIONNUMBER, STUDIES_IMAGE_TYPE=:STUDIES_IMAGE_TYPE '+
                              ' where s.studyuid=:p_studyuid';
        vFIBQuery.ParamByName('FC_AEAPPARAT').AsString := teAE.Text;
        vFIBQuery.ParamByName('FK_IDOSNDIAG').AsInteger := vIDosnDiag;
        vFIBQuery.ParamByName('FK_IDDOPDIAG').AsInteger := vIDdopDiag;
        vFIBQuery.ParamByName('p_studyuid').AsString := frmComment.v_STUDYUID;
        vFIBQuery.ParamByName('FC_MNDIAGNOS').LoadFromFile(vFileName1);
        vFIBQuery.ParamByName('FC_ADDDIAGNOS').LoadFromFile(vFileName2);
        vFIBQuery.ParamByName('P_ENAME').AsString :=     vteFIOpac;
        vFIBQuery.ParamByName('P_ENAME_RUS').AsString := vteFIOpacE;
        if cxPolWoMan.Checked then
          vFIBQuery.ParamByName('P_SEX').AsString := 'F'
        else
          vFIBQuery.ParamByName('P_SEX').AsString := 'M';

        vFIBQuery.ParamByName('P_DATEBORN').AsDateTime := deDateBorn.Date ;
        vFIBQuery.ParamByName('LDATE').AsDateTime := deStudyDate.Date ;
        vFIBQuery.ParamByName('STUDYDESCRIPTION').AsString := teOpisStudy.Text ;
        vFIBQuery.ParamByName('referringphysicianname').AsString := teDoctor.Text ;
        vFIBQuery.ParamByName('STUDIES_IMAGE_TYPE').AsString := cbType.Text ;

        vFIBQuery.ParamByName('P_PID').AsString := tePatientID.Text ;
        vFIBQuery.ParamByName('STUDYUID').AsString := teStudyUID.Text ;
        vFIBQuery.ParamByName('ACCESSIONNUMBER').AsString := teAccessionNumber.Text ;

        vFIBQuery.ExecQuery;
      finally
        vFIBQuery.Free;
      end;
    end;
    if FileExists(vFileName1) then DeleteFile(vFileName1);
    if FileExists(vFileName2) then DeleteFile(vFileName2);
  end;
  function chkPatientEname : Boolean;
  var v_UniQr : TUniQuery; vFIBDataSet : TpFIBDataSet;
  begin
    if v_isOracle then     // ORACLE
    begin
    end else if v_isPostgres then
    begin
      v_UniQr := TUniQuery.Create(nil);
      try
        v_UniQr.Connection:=DB_CMN.PGconn;
        v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
        v_UniQr.SQL.Text := 'select 1 from '+v_pg_Schema+'.patients where p_pid = :p_pid1';  //  and p_ename=:p_ename
        v_UniQr.ParamByName('P_PID1').AsString := tePatientID.Text ;
      //  v_UniQr.ParamByName('p_ename').AsString := vFIO_old ;
        v_UniQr.Open; v_UniQr.First;
        Result:=not v_UniQr.Eof;
      finally
        v_UniQr.Free;
      end;
    end else begin
      // сперва меняем p_pid если его поменяли
      // по p_pid + фио vFIO_old
      vFIBDataSet := TpFIBDataSet.Create(nil);
      try
        pDsIni( vFIBDataSet, True );
        vFIBDataSet.SelectSQL.Text := 'select 1 FROM PATIENTS WHERE P_PID = :P_PID1 ';   // добавить фио  and p_ename=:p_ename
        vFIBDataSet.ParamByName('P_PID1').AsString := tePatientID.Text ;
      //  vFIBDataSet.ParamByName('p_ename').AsString := vFIO_old ;
        vFIBDataSet.Open; vFIBDataSet.First;
        Result:=not vFIBDataSet.Eof;
      finally
        vFIBDataSet.Free;
      end
    end;
  end;
  procedure updatePatients;
  var v_UniQr : TUniQuery; vFIBDataSet : TpFIBDataSet;
  begin
    if v_isOracle then     // ORACLE
    begin
    end else if v_isPostgres then
    begin
      v_UniQr := TUniQuery.Create(nil);
      try
        v_UniQr.Connection:=DB_CMN.PGconn;
        v_UniQr.Transaction:=DB_CMN.MnUniTransaction;

        if vFnd then begin // если нашли то UPDATE
          v_UniQr.SQL.Text := 'update '+v_pg_Schema+'.patients set p_pid = :p_pid1, '+
             ' p_ename = :p_ename1, '+
             ' p_sex = :p_sex,           '+
             ' p_fam = :p_fam,           '+
             ' p_im = :p_im,             '+
             ' p_otch = :p_otch,         '+
             ' p_dateborn = :p_dateborn, '+
             ' p_ename_rus=:p_ename_rus '+
             ' where p_pid = :p_pid and p_ename=:p_ename ';     //
          v_UniQr.ParamByName('P_PID').AsString := vP_PID_OLD ;
          v_UniQr.ParamByName('p_ename').AsString := vFIO_old ;
        end else begin     // если не нашли то INSERT
          v_UniQr.SQL.Text := 'insert into '+v_pg_Schema+'.patients ( p_pid, '+
             ' p_ename, p_sex, p_dateborn, p_fam, p_im, p_otch, '+
             ' p_ename_rus ) values ( :p_pid1, :p_ename1, :p_sex, '+
             ' :p_dateborn, :p_fam, :p_im, :p_otch, :p_ename_rus ) ';
        end;
        if cxPolWoMan.Checked then
          v_UniQr.ParamByName('P_SEX').AsString := 'F'
        else
          v_UniQr.ParamByName('P_SEX').AsString := 'M';
        v_UniQr.ParamByName('P_DATEBORN').AsDateTime := deDateBorn.Date ; 

        v_UniQr.ParamByName('P_FAM').AsString :=     vP_FAM ;
        v_UniQr.ParamByName('P_IM').AsString :=      vP_IM ;
        v_UniQr.ParamByName('P_OTCH').AsString :=    vP_OTCH ;

        v_UniQr.ParamByName('P_PID1').AsString := tePatientID.Text ;
        v_UniQr.ParamByName('P_ENAME1').AsString :=    vteFIOpac;
        v_UniQr.ParamByName('P_ENAME_RUS').AsString := vteFIOpacE;
        try
          v_UniQr.ExecSQL;
        except
          on E:Exception do
            ShowMessage(E.Message);
        end;
      finally
        v_UniQr.Free;
      end;
    end else begin
      vFIBQuery := TpFIBQuery.Create(nil);
      try
        pQrIni( vFIBQuery, False );
        if vFnd then begin // если нашли то UPDATE
          vFIBQuery.SQL.Text := 'update patients set p_pid = :p_pid1, '+
             ' p_ename = :p_ename1, '+
             ' p_sex = :p_sex,           '+
             ' p_dateborn = :p_dateborn, '+
             ' p_fam = :p_fam,           '+
             ' p_im = :p_im,             '+
             ' p_otch = :p_otch,         '+
             ' p_ename_rus=:p_ename_rus '+
             ' where p_pid = :p_pid and p_ename=:p_ename  '; //
          vFIBQuery.ParamByName('P_PID').AsString := vP_PID_OLD ;
          vFIBQuery.ParamByName('p_ename').AsString := vFIO_old ;
        end else begin     // если не нашли то INSERT
          vFIBQuery.SQL.Text := 'insert into PATIENTS ( P_PID, '+
             ' P_ENAME, P_SEX, P_DATEBORN, P_FAM, P_IM, P_OTCH, '+
             ' P_ENAME_RUS ) values ( :P_PID1, :P_ENAME1, :P_SEX, '+
             ' :P_DATEBORN, :P_FAM, :P_IM, :P_OTCH, :P_ENAME_RUS ) ';
        end;
        if cxPolWoMan.Checked then
          vFIBQuery.ParamByName('P_SEX').AsString := 'F'
        else
          vFIBQuery.ParamByName('P_SEX').AsString := 'M';
        vFIBQuery.ParamByName('P_DATEBORN').AsDateTime := deDateBorn.Date ;

        vFIBQuery.ParamByName('P_FAM').AsString :=     vP_FAM ;
        vFIBQuery.ParamByName('P_IM').AsString :=      vP_IM ;
        vFIBQuery.ParamByName('P_OTCH').AsString :=    vP_OTCH ;

        vFIBQuery.ParamByName('P_PID1').AsString := tePatientID.Text ;
        vFIBQuery.ParamByName('P_ENAME1').AsString :=    vteFIOpac;
        vFIBQuery.ParamByName('P_ENAME_RUS').AsString := vteFIOpacE;
        vFIBQuery.ExecQuery;
      finally
        vFIBQuery.Free;
      end;
    end;
  end;
  procedure updateSeries;
  var v_UniQr : TUniQuery; vFIBDataSet : TpFIBDataSet;
  begin
    if v_isOracle then     // ORACLE
    begin
    end else if v_isPostgres then
    begin
      v_UniQr := TUniQuery.Create(nil);
      try
        v_UniQr.Connection:=DB_CMN.PGconn;
        v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
        v_UniQr.SQL.Text := 'update '+v_pg_Schema+'.series set series_imagetype=:series_imagetype , '+
           ' accessionnumber=:accessionnumber, studyuid = :studyuid1 where studyuid = :studyuid ';
        v_UniQr.ParamByName('ACCESSIONNUMBER').AsString := teAccessionNumber.Text ;
        v_UniQr.ParamByName('SERIES_IMAGETYPE').AsString := cbType.Text ;
        v_UniQr.ParamByName('STUDYUID').AsString := vSTUDYUID_OLD ;
        v_UniQr.ParamByName('STUDYUID1').AsString := teStudyUID.Text ;
        v_UniQr.ExecSQL;
      finally
        v_UniQr.Free;
      end;
    end else begin
      vFIBQuery := TpFIBQuery.Create(nil);
      try
        pQrIni( vFIBQuery, False );
        vFIBQuery.SQL.Text := 'update series set series_imagetype=:series_imagetype , '+
           ' accessionnumber=:accessionnumber, studyuid = :studyuid1 where studyuid = :studyuid ';
        vFIBQuery.ParamByName('ACCESSIONNUMBER').AsString := teAccessionNumber.Text ;
        vFIBQuery.ParamByName('SERIES_IMAGETYPE').AsString := cbType.Text ;
        vFIBQuery.ParamByName('STUDYUID').AsString := vSTUDYUID_OLD ;
        vFIBQuery.ParamByName('STUDYUID1').AsString := teStudyUID.Text ;
        vFIBQuery.ExecQuery;
      finally
        vFIBQuery.Free;
      end;
    end;
  end;
  procedure updateImages;
  var v_UniQr : TUniQuery; vFIBDataSet : TpFIBDataSet;
  begin
    if v_isOracle then     // ORACLE
    begin
    end else if v_isPostgres then
    begin
      v_UniQr := TUniQuery.Create(nil);
      try
        v_UniQr.Connection:=DB_CMN.PGconn;
        v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
        v_UniQr.SQL.Text := 'update '+v_pg_Schema+'.images set imagetype=:imagetype, studyuid = :studyuid1, '+
            ' p_pid=:p_pid, accessionnumber=:accessionnumber where studyuid=:studyuid ';
        v_UniQr.ParamByName('P_PID').AsString := tePatientID.Text ;
        v_UniQr.ParamByName('ACCESSIONNUMBER').AsString := teAccessionNumber.Text ;
        v_UniQr.ParamByName('IMAGETYPE').AsString := cbType.Text ;
        v_UniQr.ParamByName('STUDYUID').AsString := vSTUDYUID_OLD ;
        v_UniQr.ParamByName('STUDYUID1').AsString := teStudyUID.Text ;
        v_UniQr.ExecSQL;
      finally
        v_UniQr.Free;
      end;
    end else begin
      vFIBQuery := TpFIBQuery.Create(nil);
      try
        pQrIni( vFIBQuery, False );
        vFIBQuery.SQL.Text := 'UPDATE IMAGES SET IMAGETYPE=:IMAGETYPE, STUDYUID = :STUDYUID1, '+
            ' P_PID=:P_PID, ACCESSIONNUMBER=:ACCESSIONNUMBER WHERE STUDYUID=:STUDYUID ';
        vFIBQuery.ParamByName('P_PID').AsString := tePatientID.Text ;
        vFIBQuery.ParamByName('ACCESSIONNUMBER').AsString := teAccessionNumber.Text ;
        vFIBQuery.ParamByName('IMAGETYPE').AsString := cbType.Text ;
        vFIBQuery.ParamByName('STUDYUID').AsString := vSTUDYUID_OLD ;
        vFIBQuery.ParamByName('STUDYUID1').AsString := teStudyUID.Text ;

        vFIBQuery.ExecQuery;
      finally
        vFIBQuery.Free;
      end;
    end;
  end;
  procedure deletePatients;
  var v_UniQr : TUniQuery; vFIBDataSet : TpFIBDataSet;
  begin
    if v_isOracle then     // ORACLE
    begin
    end else if v_isPostgres then
    begin
      v_UniQr := TUniQuery.Create(nil);
      try
        v_UniQr.Connection:=DB_CMN.PGconn;
        v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
        v_UniQr.SQL.Text := 'delete from '+v_pg_Schema+'.patients p '+
               ' where not exists (select 1 from studies s '+
                                   ' where s.p_pid = p.p_pid ) '+
                                     ' and ((p_pid=:p_pid) or (p_pid=:p_pid1 )) ';
        v_UniQr.ParamByName('P_PID').AsString := vP_PID_OLD ;
        v_UniQr.ParamByName('P_PID1').AsString := tePatientID.Text ;
        v_UniQr.ExecSQL;
      finally
        v_UniQr.Free;
      end;
    end else begin
      vFIBQuery := TpFIBQuery.Create(nil);
      try
        pQrIni( vFIBQuery, False );
        vFIBQuery.SQL.Text := 'delete from PATIENTS p '+
               ' where not exists (select 1 from studies s '+
                                   ' where s.P_PID = p.P_PID ) '+
                                     ' and ((p_pid=:P_PID) or (p_pid=:P_PID1 )) ';
        vFIBQuery.ParamByName('P_PID').AsString := vP_PID_OLD ;
        vFIBQuery.ParamByName('P_PID1').AsString := tePatientID.Text ;
        vFIBQuery.ExecQuery;
      finally
        vFIBQuery.Free;
      end;
    end;
  end;
begin
  if vPage=0  then
  begin
  vErrNmb:=0;
  if ((dxTreeViewEdit1.Text<>'') and (dxTreeViewEdit1.Selected<>nil)) then
    vIDosnDiag := Integer(dxTreeViewEdit1.Selected.Data);
  if ((dxTreeViewEdit2.Text<>'') and (dxTreeViewEdit2.Selected<>nil)) then
    vIDdopDiag := Integer(dxTreeViewEdit2.Selected.Data);
  // сохраняем
  vOK := True;
  // проверка на существование p_pid, STUDYUID, ACCESSIONNUMBER
  if vP_PID_OLD<>tePatientID.Text then
  begin
    vOK := chkPacient(tePatientID.Text);
    if not vOK then vErrNmb:=-1;
  end;
  vteFIOpac := TranslitRus(teFIOpac.Text);
  vteFIOpacE:=TranslitEng(teFIOpac.Text);
  vP_FAM  := TranslitEng(ExtractWord(1, vteFIOpac, [' ','^','.']));
  vP_IM   := TranslitEng(ExtractWord(2, vteFIOpac, [' ','^','.']));
  vP_OTCH := TranslitEng(ExtractWord(3, vteFIOpac, [' ','^','.']));
  {if vAdd then
  begin
    vFIBQuery1 := TpFIBQuery.Create(nil);
    try
      pQrIni( vFIBQuery, False );
      vFIBQuery1.SQL.Text := ' INSERT INTO PATIENTS(P_ENAME, P_ENAME_RUS, P_SEX, P_PID, P_DATEBORN, P_FAM, P_IM, P_OTCH) '+#13+
                       ' VALUES(UPPER(:P_ENAME), UPPER(:P_ENAME_RUS), :P_SEX, UPPER(:P_PID), :P_DATEBORN, UPPER(:P_FAM), UPPER(:P_IM), UPPER(:P_OTCH)) ';
      vFIBQuery1.ParamByName('P_PID').AsString := tePatientID.Text ;
      if cxPolWoMan.Checked then
        vFIBQuery1.ParamByName('P_SEX').AsString := 'F'
      else
        vFIBQuery1.ParamByName('P_SEX').AsString := 'M';
      vFIBQuery1.ParamByName('P_DATEBORN').AsDateTime := deDateBorn.Date ;

      vFIBQuery1.ParamByName('P_FAM').AsString :=     vP_FAM ;
      vFIBQuery1.ParamByName('P_IM').AsString :=      vP_IM ;
      vFIBQuery1.ParamByName('P_OTCH').AsString :=    vP_OTCH ;

      vFIBQuery1.ParamByName('P_ENAME').AsString :=     vteFIOpac;
      vFIBQuery1.ParamByName('P_ENAME_RUS').AsString := vteFIOpacE;

      vFIBQuery1.ExecQuery;
    finally
      vFIBQuery1.Free;
    end;
  end;  }
  if vSTUDYUID_OLD<>teStudyUID.Text  then
  begin
    vOK := chkStudy(teStudyUID.Text);
    if not vOK then vErrNmb:=-2;
  end;
  if vACCESSIONNUMBER_OLD<>teAccessionNumber.Text then
  begin
    vOK := chkACCESSIONNUMBER;
    if not vOK then vErrNmb:=-3;
  end;

  if vOK then
  begin
    updStudies;
    vFnd:=chkPatientEname;
    updatePatients;
    updateSeries;
    updateImages;
    deletePatients;
  //  checkPacsData;
    ModalResult:=mrOk;
  end else
    if vErrNmb=-1 then begin
      MessageDlg('Ошибка: пациент с patientID='+tePatientID.Text+' существует...', mtError, [mbOK], 0);
    end else if vErrNmb=-2 then begin
      MessageDlg('Ошибка: исследование со studyUID='+teStudyUID.Text+' существует...', mtError, [mbOK], 0);
    end else if vErrNmb=-3 then begin
      MessageDlg('Ошибка: исследование со AccessionNumber='+teAccessionNumber.Text+' существует...', mtError, [mbOK], 0);
    end;// else

  end else if vPage=1  then
  begin
    //
    TDicomAttributes(v_CnsDMTable_tmp[0].Attributes).Item[$0010, $0030].AsDatetime[0] := cxDateBrn1.Date;
    TDicomAttributes(v_CnsDMTable_tmp[0].Attributes).Item[$0008, $0020].AsDatetime[0] := cxStudyDate1.Date;
    if cxPolMan1.Checked then
      TDicomAttributes(v_CnsDMTable_tmp[0].Attributes).Item[$0010, $0040].AsString[0] := 'M'
    else
      TDicomAttributes(v_CnsDMTable_tmp[0].Attributes).Item[$0010, $0040].AsString[0] := 'F';
    TDicomAttributes(v_CnsDMTable_tmp[0].Attributes).Item[$0010, $0020].AsString[0] := cxPatientID.Text ;
    TDicomAttributes(v_CnsDMTable_tmp[0].Attributes).Item[$0010, $0010].AsString[0] := cxFIOPac.Text;
    TDicomAttributes(v_CnsDMTable_tmp[0].Attributes).Item[$0008, $0050].AsString[0] := cxAccessionNumber1.Text;
    TDicomAttributes(v_CnsDMTable_tmp[0].Attributes).Item[$0008, $0060].AsString[0] := cxMod1.Text;
    TDicomAttributes(v_CnsDMTable_tmp[0].Attributes).Item[$0020, $000D].AsString[0] := cxStudyUID1.Text;
    //
    try
      TDicomDataset(v_CnsDMTable_tmp[0]).SaveToFile(vFilenameTmp, // FileName
                      True,
                      8197, //ADataset.Attributes.ImageData.ImageData[0].TransferSyntax,
                      100);  //Quality
      MessageDlg('Данные сохранены на диск. Обновите список.', mtInformation, [mbOK], 0);
      ModalResult := mrOk;              
    except
      on E:Exception do ShowMessage('Error : '+E.Message);
    end;
  end;
end;

procedure TfrmComment.dxBarLargeButton2Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfrmComment.filelist_refresh;
var v_id : Integer;
begin
  dsFileList.DisableControls;
  Screen.Cursor := crHourGlass;
  if dsFileList.Active then
    if not dsFileList.Eof then
      v_id := dsFileList.FieldByName('F_ID').AsInteger
    else
      v_id := -1
  else
    v_id := -1;
  try
    if v_isOracle then     // ORACLE
    begin
    end else if v_isPostgres then
    begin
        UniQuery1.Close;
        UniQuery1.Connection:=DB_CMN.PGconn;
        UniQuery1.Transaction:=DB_CMN.MnUniTransaction;
        UniQuery1.SQL.Clear;
        UniQuery1.SQL.Text :=
           'select t.F_ID, t.FDATE, t.FCOMMENT from '+v_pg_Schema+'.studydocs t '+
           'where t.studyuid=:p_studyuid order by t.f_id ' ;
        UniQuery1.ParamByName('p_studyuid').AsString := frmComment.v_STUDYUID;
        UniQuery1.Open;
        if v_id>0 then
          UniQuery1.Locate('F_ID', v_id, [])
        else
          UniQuery1.First;
        if UniQuery1.Eof then
        begin
          cxButton2.Enabled:=False;
          cxButton1.Enabled:=False;
          cxButton4.Enabled:=False;
        end else begin
          cxButton2.Enabled:=True;
          cxButton1.Enabled:=True;
          cxButton4.Enabled:=True;
        end;
        sFileList.DataSet := UniQuery1;
    end else
    begin       // firebird
      dsFileList.Close;
      dsFileList.Database := DB_CMN.DB;
      dsFileList.Transaction := DB_CMN.trRead;
      dsFileList.SQLs.SelectSQL.Clear;
      dsFileList.SQLs.SelectSQL.Text :=
         'select t.F_ID, t.FDATE, t.FCOMMENT from STUDYDOCS t '+
         'where t.studyuid=:p_studyuid order by t.F_ID ' ;
      dsFileList.ParamByName('p_studyuid').AsString := frmComment.v_STUDYUID;
      if not dsFileList.Prepared then dsFileList.Prepare;
      dsFileList.Open;
      if v_id>0 then
        dsFileList.Locate('F_ID', v_id, [])
      else
        dsFileList.First;
      if dsFileList.Eof then
      begin
        cxButton2.Enabled:=False;
        cxButton1.Enabled:=False;
        cxButton4.Enabled:=False;
      end else begin
        cxButton2.Enabled:=True;
        cxButton1.Enabled:=True;
        cxButton4.Enabled:=True;
      end;
      sFileList.DataSet := dsFileList;
    end;
  finally
    Screen.Cursor := crDefault;
    dsFileList.EnableControls;
  end;
end;


procedure TfrmComment.FormCreate(Sender: TObject);
begin
  tsDiagnos.tabVisible := False;
  ProgressBar1.Visible:=False;
  v_CnsDMTable_tmp := TCnsDMTable.Create(nil);
  //
  cbType.Properties.Items.Clear;
  ctrFullModList(TStringList(cbType.Properties.Items));
  //
  cxMod1.Properties.Items.Clear;
  ctrFullModList(TStringList(cxMod1.Properties.Items));

end;

procedure TfrmComment.FormDestroy(Sender: TObject);
begin
  v_CnsDMTable_tmp.Free;
end;

end.
