program DicomClient;   // asDicomViewer 1 test 5432 localhost postgres postgres mypacs 2015.07.29.09.44.24.100.100000.8593420703

uses
  Forms,
  Dialogs,
  SysUtils,
  fMain in 'fMain.pas' {frmMain},
  fParams in 'fParams.pas' {frmParams},
  fSendParam in '..\..\..\uCommon_Dicom\fSendParam.pas' {frmSendParam},
  fHeader in '..\..\..\uCommon_Dicom\fHeader.pas' {frmHeader},
  fLogin in 'fLogin.pas' {frmLogin},
  fUsers in 'fUsers.pas' {frmUsers},
  fuserInfo in 'fuserInfo.pas' {frmUserInfo},
  fEditSys in 'fEditSys.pas' {frmEditSys},
  SurfaceRenderEx in '..\..\..\uCommon_Dicom\SurfaceRenderEx.pas' {SurfaceRenderForm},
  VolumeRenderingEx in '..\..\..\uCommon_Dicom\VolumeRenderingEx.pas' {VolumeRenderingForm},
  MprUnit in '..\..\..\uCommon_Dicom\MprUnit.pas' {MprForm},
  Mpr3DUnit in 'Mpr3DUnit.pas' {MPR3DForm},
  fCD in '..\..\..\uCommon_Dicom\fCD.pas' {frmCD},
  fProgressCD in '..\..\..\uCommon_Dicom\fProgressCD.pas' {frmProgressCD},
  ImportSession in 'ImportSession.pas' {frmSessions},
  TreeView in 'TreeView.pas' {frmTree},
  fSettings in 'fSettings.pas' {frmAdvanceSettings},
  fJur in 'fJur.pas' {frmJur},
  CmnUnit in '..\..\..\uCommon_Dicom\CmnUnit.pas',
  DB_CMN in '..\..\..\uCommon_Dicom\DB_CMN.pas',
  DICOM_CMN in '..\..\..\uCommon_Dicom\DICOM_CMN.pas',
  fSnimki in '..\..\..\uCommon_Dicom\fSnimki.pas' {frmSnimki},
  UnFrmProgressBar in '..\..\..\uCommon_Dicom\UnFrmProgressBar.pas' {FrmProgressBar},
  UnMultiFormsFrame in '..\..\..\uCommon_Dicom\UnMultiFormsFrame.pas' {MultiForms: TFrame},
  UnFrmSize in '..\..\..\uCommon_Dicom\UnFrmSize.pas' {FrmSize},
  UnFrmGetDevices in '..\..\..\uCommon_Dicom\UnFrmGetDevices.pas' {FrmGetDevices},
  fCine in '..\..\..\uCommon_Dicom\fCine.pas' {frmCine},
  UnKalibr in '..\..\..\uCommon_Dicom\UnKalibr.pas' {frmKalibr},
  DICOM_charset in '..\..\..\..\DicomVCL\DICOM_charset.pas',
  DCM_Attributes in '..\..\..\..\DicomVCL\DCM_Attributes.pas',
  Dcm_View in '..\..\..\..\DicomVCL\Dcm_View.pas',
  DCM_Dict in '..\..\..\..\DicomVCL\DCM_Dict.pas',
  UnFrmEcgFrag in '..\..\..\uCommon_Dicom\UnFrmEcgFrag.pas' {FrmEcgFrag},
  DCM_ImageData_Bitmap in '..\..\..\..\DicomVCL\DCM_ImageData_Bitmap.pas',
  DCM_ImageData_Bitmap16 in '..\..\..\..\DicomVCL\DCM_ImageData_Bitmap16.pas',
  DCM_ImageData_Bitmap32 in '..\..\..\..\DicomVCL\DCM_ImageData_Bitmap32.pas',
  DCM32 in '..\..\..\..\DicomVCL\DCM32.pas',
  DcmImageConvert in '..\..\..\..\DicomVCL\DcmImageConvert.pas',
  dcmjpeg8 in '..\..\..\..\DicomVCL\dcmjpeg8.pas',
  Dcmjpeg12 in '..\..\..\..\DicomVCL\Dcmjpeg12.pas',
  Dcmjpeg16 in '..\..\..\..\DicomVCL\Dcmjpeg16.pas',
  DicomVFWView in '..\..\..\..\DicomVCL\DicomVFWView.pas',
  DCM_UID in '..\..\..\..\DicomVCL\DCM_UID.pas',
  DCM_Connection in '..\..\..\..\DicomVCL\DCM_Connection.pas',
  UnComment in '..\..\..\uCommon_Dicom\UnComment.pas' {frmComment},
  UnFrmAddDocument in '..\..\..\uCommon_Dicom\UnFrmAddDocument.pas' {FrmAddDocument},
  UnFrmFileBrowse in '..\..\..\uCommon_Dicom\UnFrmFileBrowse.pas' {frmFileBrowse},
  unImportPDF in '..\..\..\uCommon_Dicom\unImportPDF.pas' {frmImportPDF},
  UnFrmDiagTree in '..\..\..\uCommon_Dicom\UnFrmDiagTree.pas' {frmDiag},
  UnDiagEdt in '..\..\..\uCommon_Dicom\UnDiagEdt.pas' {frmDiagEdt},
  UnAbout in '..\..\..\uCommon_Dicom\UnAbout.pas' {FrmAbout},
  DCM_Client in '..\..\..\..\DicomVCL\DCM_Client.pas',
  db_cmn1 in '..\..\..\uCommon_Dicom\db_cmn1.pas',
  Uni,
  Classes,
  Controls,
  IniFiles,
  VFW in 'LIB\VFW.pas';

{$R *.res}

var vOK:Boolean;
    v_sel_rec : array of t_p_pid_list_rec;
    v_PGconn : TUniConnection;
    v_trans : TUniTransaction;
    v_pid_lst : TStringList;
begin
  Application.Initialize;
 // Application.MainFormOnTaskbar := True;
  Application.Title := 'Менеджер исследований';
  //
  if ParamCount>0 then
  begin
    if ParamStr(1)='asDicomViewer' then
    begin
      // параметры соединения
      v_isPostgres := ( ParamStr(2)='1' );
      v_pg_database := ParamStr(3);
      if not TryStrToInt(ParamStr(4),v_pg_port) then
        v_pg_port:=0;
      v_pg_server   := ParamStr(5);
      v_pg_user     := ParamStr(6);
      v_pg_password := ParamStr(7);
      v_pg_Schema   := ParamStr(8);
      // параметры исследования
      v_accessionnumberTMP := ParamStr(9);
      {
      // параметры - asDicomViewer 1 test 5432 localhost postgres postgres mypacs 2015.07.29.09.44.24.100.100000.8593420703     //
          rowNumProt.Properties.Value;
      MessageDlg('v_pg_database='+v_pg_database+#13+#10+
                 'v_pg_server='+v_pg_server+#13+#10+
                 'v_pg_user='+v_pg_user+#13+#10+
                 'v_pg_password='+v_pg_password+#13+#10+
                 'v_pg_Schema='+v_pg_Schema+#13+#10+
                 'accessionnumber='+v_accessionnumberTMP
                 , mtWarning, [mbOK], 0);
      }
      // массив для запроса - список исследований (внутренний - для совместимости)
      SetLength(v_sel_rec,Length(v_sel_rec)+1);
      v_sel_rec[Length(v_sel_rec)-1].P_PID           := '';
      v_sel_rec[Length(v_sel_rec)-1].P_ENAME         := '';
      v_sel_rec[Length(v_sel_rec)-1].ACCESSIONNUMBER := v_accessionnumberTMP;
      v_sel_rec[Length(v_sel_rec)-1].STUDYUID        := '';
      v_sel_rec[Length(v_sel_rec)-1].MODALITY        := '';
      //
      // определим параметры пакса
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
      try
        try
          v_PGconn.Connected := True;
          v_trans := TUniTransaction.Create(nil);
          v_trans.DefaultConnection:=v_PGconn;
          //
          DB_CMN.PGconn := v_PGconn;
          DB_CMN.MnUniTransaction := v_trans;
          //
          Application.CreateForm(TfrmMain, frmMain);
  //
          v_isPostgres:=True;
          frmMain.sPort   := DBparams_get ( 'SERVER', 'PORT' );
          frmMain.sCalledAETitle   := DBparams_get ( 'SERVER', 'AETITLE' );
          frmMain.sIP     := DBparams_get ( 'SERVER', 'IP' );
          try
            // v_accessionnumberTMP:='132132';
//            Screen.Cursor := crHourGlass;
            v_pid_lst := TStringList.Create;
            v_pid_lst.Add( v_sel_rec[Length(v_sel_rec)-1].P_PID );
            //
            frmMain.v_isnot_show_3d_loc := not MyStrToBool(
                       DBparams_get ('STATION',        // SECTION
                                     'USE_3D_LIBRARY' // KEY
                                   //  frmMain.trRead,   // FIBTransaction
                                   //  frmMain.DB        // TpFIBDatabase
                                    )
                                 );
            Application.CreateForm(TfrmSnimki, frmSnimki);
            with TIniFile.Create(v_exe_path+c_ini_file) do
              try
                frmSnimki.v_is_log  := (ReadString('LOG', 'is_log', '0')='1');
                frmSnimki.v_logfile :=  ReadString('LOG', 'logfile', '');
                if pos('\',frmSnimki.v_logfile)<=0 then
                  frmSnimki.v_logfile:=ExtractFilePath(Application.ExeName)+frmSnimki.v_logfile;
              {  if frmSnimki.v_is_log then
                  WriteString('LOG', 'is_log','1')
                else
                  WriteString('LOG', 'is_log','0');
                WriteString('LOG', 'logfile', frmSnimki.v_logfile);  }
              finally
                Free;
              end;
            //
            v_is_moveDCM:=False;
            frmSnimki.v_pr_data_fr := 0;   // архив
            if v_pid_lst.Count > 0 then
               frmSnimki.DoShowForm_P_PID( v_pid_lst,
                                           v_sel_rec,
                                           1,
                                           frmMain.MDFolderFullList,
                                           DB_CMN.trRead,
                                           DB_CMN.DB,
                                           frmMain.sIP,
                                           frmMain.sPort,
                                           frmMain.sCalledAETitle,
                                           frmMain.sCallingAETitle,
                                           frmMain.sUser,
                                           False,
                                           frmMain.v_isnot_show_3d_loc, // True - не отображать 3D меню и не загружать dll 3D обработки
                                           v_isPostgres,
                                           PGconn,
                                           MnUniTransaction
                                         );
            if v_pid_lst.Count > 0 then
            begin
              frmSnimki.Visible:=False;
              if v_exit_progressbar<>1 then // не было отмены пользователем
                frmSnimki.ShowModal;
            end;
            //
          finally
            FreeAndNil(frmSnimki);
            Application.ProcessMessages;
            FreeAndNil(v_pid_lst);
            SetLength(v_sel_rec, 0);
//            Screen.Cursor := crDefault;
          end;
        except
          on e:Exception do
            ShowMessage ( e.Message );
        end;
      finally
        frmMain.Free;
        PgFree(v_PGconn,v_trans);
        Application.Terminate;
      end;
    end else
      ShowMessage('Параметр '+ParamStr(1)+' не поддерживается');
  end else
  begin
    Application.CreateForm(TfrmMain, frmMain);
    frmMain.DoShowForm;
  end;
  //
  Application.Run;
end.
