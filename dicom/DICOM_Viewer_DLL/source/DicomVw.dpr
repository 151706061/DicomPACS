program DicomVw;

uses
  Forms, SysUtils, Windows, Dialogs, IniFiles;

{$R *.res}

var
  p_DicomShowSnimki : procedure (p_AccessionNumber:string;
                                 p_studyUID:string;
                                 p_get_dicom_ip:string;
                                 p_get_dicom_called:string;
                                 p_get_dicom_port:string;
                                 p_get_local_port:string;
                                 p_debug:string
                              ); stdcall;
//  p_DicomTest : procedure ; stdcall;
  DLL_HANDLE: THandle;
  v_AccessionNumber ,
  v_studyUID  ,
  v_get_dicom_ip    ,
  v_get_dicom_called ,
  v_get_dicom_port ,
  v_get_local_port,
  v_debug,
  vDir : string ;
const c_fileDLL = 'DICOM_Viewer.dll';
      c_FileStart = 'ok.tmp';
      c_razdel           = 'dicom_parameters';
      c_AccessionNumber  = 'AccessionNumber' ;
      c_studyUID         = 'studyUID' ;
      c_get_dicom_ip     = 'dicom_ip' ;
      c_get_dicom_called = 'dicom_called' ;
      c_get_dicom_port   = 'dicom_port' ;
      c_get_local_port   = 'local_port' ;
      c_debug            = 'debug' ;
      c_FileName         = 'dllCall.ini';
var F : TextFile; vStr: string;
begin
  vDir:=GetCurrentDir;
  try
    SetCurrentDir(ExtractFileDir(ParamStr(0)));
    if not FileExists(c_FileName) then Exit;
    if FileExists(c_FileStart) then DeleteFile(c_FileStart);    
    with TIniFile.Create(c_FileName) do
    try
      v_AccessionNumber  := ReadString(c_razdel,c_AccessionNumber,'');
      v_studyUID         := ReadString(c_razdel,c_studyUID,'');
      v_get_dicom_ip     := ReadString(c_razdel,c_get_dicom_ip,'');
      v_get_dicom_called := ReadString(c_razdel,c_get_dicom_called,'');
      v_get_dicom_port   := ReadString(c_razdel,c_get_dicom_port,'0');
      v_get_local_port   := ReadString(c_razdel,c_get_local_port,'0');
      v_debug            := ReadString(c_razdel,c_debug,'0');
      //
     { WriteString(c_razdel,c_AccessionNumber,v_AccessionNumber);
      WriteString(c_razdel,c_studyUID,v_studyUID);
      WriteString(c_razdel,c_get_dicom_ip,v_get_dicom_ip);
      WriteString(c_razdel,c_get_dicom_called,v_get_dicom_called);
      WriteString(c_razdel,c_get_dicom_port,v_get_dicom_port);
      WriteString(c_razdel,c_get_local_port,v_get_local_port);
      WriteString(c_razdel,c_debug,v_debug); }
    except
      Free;
    end;
    AssignFile(f, c_FileName); {Assigns the Filename}
    Reset(f); {Opens the file for reading}
    while not Eof(F) do
    begin
      Readln(f, vStr);
      if Pos( c_AccessionNumber, vStr ) >0 then begin
        v_AccessionNumber:=Trim( StringReplace(vStr,c_AccessionNumber+'=','',[rfReplaceAll, rfIgnoreCase]) );
      end else if Pos( c_studyUID, vStr ) >0 then begin
        v_studyUID:=Trim( StringReplace(vStr,c_studyUID+'=','',[rfReplaceAll, rfIgnoreCase]) );
      end else if Pos( c_get_dicom_ip, vStr ) >0 then begin
        v_get_dicom_ip:=Trim( StringReplace(vStr,c_get_dicom_ip+'=','',[rfReplaceAll, rfIgnoreCase]) );
      end else if Pos( c_get_dicom_called, vStr ) >0 then begin
        v_get_dicom_called:=Trim( StringReplace(vStr,c_get_dicom_called+'=','',[rfReplaceAll, rfIgnoreCase]) );
      end else if Pos( c_get_dicom_port, vStr ) >0 then begin
        v_get_dicom_port:=Trim( StringReplace(vStr,c_get_dicom_port+'=','',[rfReplaceAll, rfIgnoreCase]) );
      end else if Pos( c_get_local_port, vStr ) >0 then begin
        v_get_local_port:=Trim( StringReplace(vStr,c_get_local_port+'=','',[rfReplaceAll, rfIgnoreCase]) );
      end else if Pos( c_debug, vStr ) >0 then begin
        v_debug:=Trim( StringReplace(vStr,c_debug+'=','',[rfReplaceAll, rfIgnoreCase]) );
      end;
    end;
    Closefile(f); {Closes file F}
    if v_debug='1' then
      MessageDlg( 'File = '+ExtractFileDir(ParamStr(0))+'\'+c_FileName+#13#10+
                  ' v_AccessionNumber = '+ v_AccessionNumber+#13#10+
                  ' v_studyUID = '+ v_studyUID+#13#10+
                  ' v_get_dicom_ip = '+ v_get_dicom_ip+#13#10+
                  ' v_get_dicom_called = '+ v_get_dicom_called+#13#10+
                  ' v_get_dicom_port = '+ v_get_dicom_port+#13#10+
                  ' v_get_local_port = '+ v_get_local_port+#13#10+
                  ' v_debug = '+v_debug
                   , mtWarning, [mbOK], 0);

    if FileExists(c_FileName) then DeleteFile(c_FileName);
    if FileExists(c_fileDLL) then
    begin
      DLL_HANDLE:= LoadLibrary( c_fileDLL );
      Try
        if DLL_HANDLE <> 0 then
        begin
          @p_DicomShowSnimki := GetProcAddress(DLL_HANDLE, 'p_DicomShowSnimki');
  //        @p_DicomTest := GetProcAddress(DLL_HANDLE, 'p_DicomTest');
  //        if @p_DicomTest <> nil then
  //         p_DicomTest;
          if @p_DicomShowSnimki <> nil then
          begin
           try
             p_DicomShowSnimki( v_AccessionNumber,
                                v_studyUID,
                                v_get_dicom_ip,
                                v_get_dicom_called,
                                v_get_dicom_port,
                                v_get_local_port,
                                v_debug
                         );
           except
             on E:Exception do begin
               MessageDlg('Произошла ошибка : '+E.Message, mtError, [mbOK], 0);
             end;
           end;
          end;
        end;
      Finally
        FreeLibrary(DLL_HANDLE);
      End;
    end else
      MessageDlg('Не найден файл '+c_fileDLL, mtWarning, [mbOK], 0);
  finally
    SetCurrentDir(vDir);
  end;
end.
