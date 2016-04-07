unit UnMain;

interface

Uses Windows, Dialogs, UnData, SysUtils, IniFiles, DICOM_CMN, CmnUnit, fSnimki,
     Forms, Classes, fSnimok, Controls, UnFrmProgressBar, uCommonXray;

procedure p_showSnimkiDicom (  p_AccessionNumber:string;
                               p_studyUID:string;
                               p_get_dicom_ip:string;
                               p_get_dicom_called:string;
                               p_get_dicom_port:string;
                               p_get_local_port:string
                            );

procedure p_showSnimkiMN (  p_patientID:string;
                            p_AccessionNumber:string;
                            p_studyUID:string;
                            p_old_form : Boolean = True;
                            p_use_c_get : Boolean = False
                         );

var v_get_dicom_ip ,
    v_get_dicom_called ,
    v_get_dicom_port ,
    v_get_local_port,
    v_CallingAET : string;

const c_weblogfile='webATRIS.log';

implementation


procedure DoShowFormMOVE( const p_PATIENT : string;
                          const p_STUDYUID: string;
                          const p_VSTUDYID: string;
                          const p_SERIES  : string;
                          const p_ACCESSIONNUMBER : string;
                          const sLevel : string );
begin
  // запуск сервера
  DataModule1.DicomServerCore1.Stop;
  Application.ProcessMessages;
  Sleep(100);
  MnLg_ev('DicomServerCore1.Start','dicomcmove.log');
  try
    DataModule1.DicomServerCore1.Start;
  except
    on E:Exception do
      ShowMessage(DateTimeToStr(Now)+' ERROR DicomServer Start (listen port '+inttostr(DataModule1.DicomServerCore1.ServerPort)+') : '+E.Message );
  end;

  try
    Screen.Cursor := crHourGlass;
    // создадим ползунок
    Application.CreateForm(TFrmProgressBar, FrmProgressBar);
    if FileExists('dicomcmove.log') then try DeleteFile('dicomcmove.log'); except end;
    MnLg_ev('EXECUTE C-MOVE'+#13+
            'p_STUDYUID='+p_STUDYUID+#13+
            'dicom_ip='+v_get_dicom_ip+#13+
            'dicom_port='+v_get_dicom_port+#13+
            'local_port='+v_get_local_port+#13+
            'dicom_calledAET='+v_get_dicom_called+#13+
            'CallingAET='+v_CallingAET+#13+
            'PATIENTID='+p_PATIENT+#13+
            'ACCESSIONNUMBER='+p_ACCESSIONNUMBER+#13+
            '-------------------------------------------------------------------',
            'dicomcmove.log');
    gt_list_for_studyUIDs ( p_STUDYUID,
                            v_get_dicom_ip,
                            StrToInt(v_get_dicom_port),
                            StrToInt(v_get_local_port),
                            v_get_dicom_called,
                            v_CallingAET,
                            FrmProgressBar,
                            True, //      const p_is_one : boolean;
                            p_PATIENT,
                            p_SERIES,
                            False, // p_key
                            True, // debug
                            p_ACCESSIONNUMBER
                          );
    // if CmnUnit.v_exit_progressbar=2 then ; // на будущее
  finally
    Sleep(1000); // ждем 1 секунду
    DataModule1.DicomServerCore1.Stop;
    Screen.Cursor := crDefault;
    chk_close;
    Application.ProcessMessages;
    Sleep(100);
  end;
end;

procedure p_showSnimkiMN (  p_patientID:string;
                            p_AccessionNumber:string;
                            p_studyUID:string;
                            p_old_form : Boolean = True;
                            p_use_c_get : Boolean = False
                         );
var v_atris_webpage,
    v_atris_mssql_conn_str,
    v_atris_webuser,
    v_atris_webpassword,
    v_atris_use,
    v_atris_web_timeout,
    v_atris_use_web_browser : string;
    DLL_HANDLE: THandle;
    v_FlEx : Boolean;
    v_filename : AnsiString;
    Ini : TIniFile;
    v_sel_rec : array of t_p_pid_list_rec;
    //frmSnimki : TfrmSnimki ;
    v_str : TStringList;
    v_level : string;
// Отображение снимков по пациенту/исследованию (для АТРИС)
p_showHTTPSnimki:procedure (  p_atris_webpage ,
                              p_atris_mssql_conn_str,
                              p_atris_webuser,
                              p_atris_webpassword,
                              p_atris_use : string;
                              p_atris_web_timeout : Integer;
                              p_patientID:string;
                              p_AccessionNumber:string;
                              p_studyUID:string
                           );stdcall;

const c_fileDLL = 'dll_worklist_nazn.dll';
begin
  MnLg_ev('START ATRIS connection','dicomcmove.log');
  v_atris_use_web_browser := f_gtTSMINI('DLL_WORKLIST_NAZN','atris_use_web_browser');
  if v_atris_use_web_browser='1' then
  begin
    MnLg_ev('atris_use_web_browser','dicomcmove.log');
    v_atris_webpage := f_gtTSMINI('DLL_WORKLIST_NAZN','atris_webpage');
    v_atris_mssql_conn_str := f_gtTSMINI('DLL_WORKLIST_NAZN','atris_mssql_conn_str');
    v_atris_webuser := f_gtTSMINI('DLL_WORKLIST_NAZN','atris_webuser');
    v_atris_webpassword := f_gtTSMINI('DLL_WORKLIST_NAZN','atris_webpassword');
    v_atris_use := f_gtTSMINI('DLL_WORKLIST_NAZN','atris_use');
    v_atris_web_timeout := f_gtTSMINI('DLL_WORKLIST_NAZN','atris_web_timeout');

    if FileExists(c_fileDLL) then
    begin
      DLL_HANDLE:= LoadLibrary(c_fileDLL);
      Try
        if DLL_HANDLE <> 0 then
        begin
          @p_showHTTPSnimki := GetProcAddress(DLL_HANDLE, 'p_showHTTPSnimki');
          if @p_showHTTPSnimki <> nil then
           p_showHTTPSnimki( v_atris_webpage ,
                             v_atris_mssql_conn_str,
                             v_atris_webuser,
                             v_atris_webpassword,
                             v_atris_use,
                             StrToInt(v_atris_web_timeout),
                             '', // merFIOMK.Properties.Editors[1].Value, // edpatientID.Text,
                             p_AccessionNumber, // edAccessionNumber.Text,
                             '' // edstudyUID.Text
                           );
        end;
      Finally
        FreeLibrary(DLL_HANDLE);
      End;
    end else
      MessageDlg('Не найден файл '+c_fileDLL, mtWarning, [mbOK], 0);
  end else
  begin
    v_get_dicom_ip := f_gtTSMINI('XRAY','DICOM_IP');
    v_get_dicom_called := f_gtTSMINI('XRAY','DICOM_CALLED_AE');
    v_get_dicom_port := f_gtTSMINI('XRAY','DICOM_PORT');
    v_get_local_port := f_gtTSMINI('XRAY','DICOM_LOCAL_PORT');
    v_filename:=ExtractFilePath(paramstr(0))+'DicomSettings.ini';
    v_FlEx:=FileExists(v_filename);
    Ini := TIniFile.Create(v_filename);
    try
      v_CallingAET := Ini.ReadString('MAIN', 'CALLING_AET', 'TEST1');
      if not v_FlEx then
        Ini.WriteString('MAIN', 'CALLING_AET', v_CallingAET);
    finally
      Ini.Free;
    end;
    MnLg_ev ( 'dicom_ip='+v_get_dicom_ip+#13+
                  'dicom_called='+v_get_dicom_called +#13+
                  'dicom_port='+v_get_dicom_port +#13+
                  'CallingAET='+v_CallingAET +#13+
                  'local_port='+v_get_local_port+#13+
                  'p_patientID='+p_patientID+#13+
                  'p_AccessionNumber='+p_AccessionNumber, 'dicomcmove.log'
                );
    if trim(v_get_dicom_ip)='' then Exit;

    if v_get_dicom_ip = '' then
    begin
      MessageDlg('Вы не можете просматривать изображения с сервера!'+#13+#10+
                 'Не установлен IP-адрес сервера!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if v_get_dicom_port = '' then
    begin
      MessageDlg('Вы не можете просматривать изображения с сервера!'+#13+#10+
                 'Не установлен порт соединения с сервером!', mtWarning, [mbOK], 0);
      Exit;
    end;
    if p_use_c_get then
    begin
      MnLg_ev('using c-get','dicomcmove.log');
      DoShowSnimki(p_patientID,
                   p_AccessionNumber,
                   '',
                   v_get_dicom_ip,
                   v_get_dicom_port,
                   v_get_dicom_called,
                   v_CallingAET,
                   'MainUser', // IntToStr(frmMain.pSotrID),
                   True); //     frmMain.dicom_show_3d
    end else
    begin
      MnLg_ev('our viewer','dicomcmove.log');
      // установим порт сервера
      DataModule1.DicomServerCore1.ServerPort:=StrToInt(v_get_local_port);
      if p_old_form then
      begin
        if ((Trim(p_patientID)<>'') and ((Trim(p_studyUID)='') and (Trim(p_AccessionNumber)='')))
        then
        begin
          v_level := 'PATIENT';
        end else if ((Trim(p_studyUID)<>'') or (Trim(p_AccessionNumber)<>'')) then               
        begin
          v_level := 'STUDY';
        end;
        // создание формы
        Application.CreateForm(TfrmSnimok, frmSnimok);

   {     v_get_dicom_ip ,
    v_get_dicom_called ,
    v_get_dicom_port ,
    v_get_local_port,
    v_CallingAET : string;}

      {  frmSnimok.v_Host := v_get_dicom_ip;
        frmSnimok.v_Port := StrToInt(v_get_dicom_port);
        frmSnimok.v_CalledTitle := v_get_dicom_called;
        frmSnimok.v_CallingTitle := v_CallingAET; }
        //
        // запрос c_move
        try
          MnLg_ev ( 'p_patientID='+p_patientID+#13+
                    'p_studyUID='+p_studyUID+#13+
                    'p_AccessionNumber='+p_AccessionNumber+#13+
                    'v_level='+v_level
                    ,'dicomcmove.log');
          DoShowFormMOVE( p_patientID,
                          p_studyUID, // v_STUDYUID,
                          '', // v_VSTUDYID,
                          '', // v_SERIESUID,         // SERIES
                          p_AccessionNumber, // ACCESSIONNUMBER
                          v_level );
          if CmnUnit.v_exit_progressbar in [0,2] then begin
            try
              frmSnimok.ShowModal;
            finally
              frmSnimok.Free;
            end;
          end;
        except
          DataModule1.DicomServerCore1.Stop;
          frmSnimok.Free;
        end;



      end else
      begin
        // просмотр в нашем viewer
        //
        SetLength(v_sel_rec,1);
        v_sel_rec[0].P_PID           := p_patientID;
        v_sel_rec[0].P_ENAME         := '';
        v_sel_rec[0].ACCESSIONNUMBER := p_AccessionNumber;
        v_sel_rec[0].STUDYUID        := p_studyUID;
        //
        MnLg_ev ( 'p_patientID='+p_patientID+#13+
                    'p_studyUID='+p_studyUID+#13+
                    'p_AccessionNumber='+p_AccessionNumber
                    ,'dicomcmove.log');
        //
        v_isnot_show_3d := ( f_gtTSMINI('DICOM','USE_3D_LIBRARY')<>'1');
        //
        // -------------------------------------------------------------------------

        Application.CreateForm(TfrmSnimki, frmSnimki);
        frmSnimki.v_is_start_dicom_server:= True;
        // установим порт сервера
        frmSnimki.DicomServerCore1.ServerPort:=StrToInt(v_get_local_port);

        frmSnimki.v_is_main_form:=True;
        frmSnimki.v_is_stlViewer:=True;
        try
          Screen.Cursor := crHourGlass;
          if FileExists('dicomcmove.log') then try DeleteFile('dicomcmove.log'); except end;
          v_str := TStringList.Create;
          try
            v_str.Append(p_patientID);
            frmSnimki.v_pr_data_fr := 2;   // удаленная база - C_MOVE
            frmSnimki.DoShowForm_P_PID( v_str, // v_pid_lst,
                                        v_sel_rec,
                                        0, // v_max_amm2,
                                        nil, // frmMain.MDFolderFullList,
                                        nil, // DB_CMN.trRead,
                                        nil, // DB_CMN.DB,
                                        v_get_dicom_ip, // frmMain.sIP,
                                        v_get_dicom_port, // frmMain.sPort,
                                        v_get_dicom_called, // frmMain.sCalledAETitle,
                                        v_CallingAET, // frmMain.sCallingAETitle,
                                        '', // frmMain.sUser,
                                        False, // p_key,
                                        v_isnot_show_3d, // True - не отображать 3D меню и не загружать dll 3D обработки
                                        False, // v_isPostgres,
                                        nil, // PGconn,
                                        nil // MnUniTransaction
                                     );
            frmSnimki.Visible:=False;
            if v_exit_progressbar<>1 then // не было отмены пользователем
              frmSnimki.ShowModal;

          finally
            FreeAndNil(frmSnimki);
            v_str.Free;
            SetLength(v_sel_rec,0);
          end;
        finally
          Screen.Cursor := crDefault;
          chk_close;
          Application.ProcessMessages;
          Sleep(100);
        end;
      end;
    end;

    // -------------------------------------------------------------------------

  end;

end;

procedure p_showSnimkiDicom (  p_AccessionNumber:string;
                               p_studyUID:string;
                               p_get_dicom_ip:string;
                               p_get_dicom_called:string;
                               p_get_dicom_port:string;
                               p_get_local_port:string
                            );
var v_level : string; vRes : Boolean;
  procedure logErr( pStr : string );
  var vS : TStringList;
  const vF = 'ERROR.log';
  begin
    vS := TStringList.Create;
    try
      if FileExists(vF) then
        vS.LoadFromFile(vF);
      vS.Append(DateTimeToStr(Now)+' : '+pStr);
      vS.SaveToFile(vF);
    finally
      vS.Free;
    end;
  end;
begin
  // установим порт сервера
  DataModule1.DicomServerCore1.ServerPort:=StrToInt(p_get_local_port);

  if (( p_studyUID <> '' ) or (Trim(p_AccessionNumber)<>'')) then
  begin
    v_level := 'STUDY';
  end;
  v_get_dicom_port:=p_get_dicom_port;
  v_get_local_port:=p_get_local_port;

  v_get_dicom_ip     := p_get_dicom_ip ;
  v_get_dicom_called := p_get_dicom_called ;
  v_CallingAET       := 'TEST1' ;

  // создание формы
  Application.CreateForm(TfrmSnimok, frmSnimok);
  try
  {  frmSnimok.v_Host := p_get_dicom_ip;
    frmSnimok.v_Port := StrToInt(p_get_dicom_port);
    frmSnimok.v_CalledTitle := p_get_dicom_called;
    frmSnimok.v_CallingTitle := 'TEST1';  }
    //
    // запрос c_move
    DoShowSnimki(    '',        // p_patientID
                     p_AccessionNumber,
                     '',
                     v_get_dicom_ip,
                     v_get_dicom_port,
                     v_get_dicom_called,
                     v_CallingAET,
                     'MainUser', // IntToStr(frmMain.pSotrID),
                     True); //     frmMain.dicom_show_3d
  finally
    frmSnimok.Free;
  end;
end;

end.
