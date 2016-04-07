{ ������ ��� �������� "������ ����������", ������������ � �������
  ���� ��������� �����, ���������� ���������, ������ � ������� � ����.
}

unit CmnUnit;

interface

uses Windows, Forms, SysUtils, Controls, WinSvc, Types, Psapi, tlhelp32,
     Classes, Dialogs, DateUtils, DICOM_charset, cxShellBrowserDialog,
     FileCtrl;

var
  // ��������� ������� ��������
  // 0 - � �����
  // 1 - �������������� ���������
  // 2 - �������� ����������
  v_exit_progressbar : byte;

// ������� �������� ��������� ����������� ������
function gtFreeVirtualMemory : Cardinal;

// ������� ����������� ����������� ���� ��������
function gt_sex ( p_sex : string ) : string;

// ����� �������� - ������� ������ ������ DICOP
procedure gt_files_dicom_fr_folder ( var p_s2 : TStringList );

Procedure ScanDir(StartDir: String; Mask:string; List:TStrings);
{ ��������� ������� ������ ���������� � ������ List, ������� � ����������,
��������� � StartDir. Mask - ����� ��� ��������� ������
}

// ��������� ��������� ����� �� ������� �������� ��������
procedure cntr_frm ( p_Form : TForm; var p_is_move : Boolean );

// ��������� ���������� �������� Windows
function GetTempDirectory: String;

// ��������� ������ � ���� ������
procedure MnFl_ev ( const p_strs : ansistring;
                  const p_filename : ansistring = '';
                  const p_is_delim : Boolean = False;
                  const p_is_DT : boolean = True );

// ��������� ������ � ���-����
procedure MnLg_ev ( const p_strs : ansistring;
                    const p_filename : ansistring = '';
                    const p_is_delim : Boolean = False;
                    const p_is_DT : boolean = True );

// ��������� ��������� ����� �� ������
Procedure Cntr_screen ( p_form : TForm );

// ����������� ������� �����
function FileSizeByName(fileName : wideString) : Int64;

// ������� �������� ������ � integer
// �� �������� ���� �������� ������ - ���������� 0
function MyStrToInt ( const p_val : string ) : Integer;

// ����������� ������� � ���� �������� �����
procedure ShowBusy(blBusy: boolean);

function ServiceStart(aMachine, aServiceName: PChar ): boolean;

function ServiceStop(aMachine,aServiceName: PChar ): boolean;

function ServiceGetStatus(sMachine, sService: PChar): DWORD;
  {******************************************}
  {*** Parameters: ***}
  {*** sService: specifies the name of the service to open
  {*** sMachine: specifies the name of the target computer
  {*** ***}
  {*** Return Values: ***}
  {*** -1 = Error opening service ***}
  {*** 1 = SERVICE_STOPPED ***}
  {*** 2 = SERVICE_START_PENDING ***}
  {*** 3 = SERVICE_STOP_PENDING ***}
  {*** 4 = SERVICE_RUNNING ***}
  {*** 5 = SERVICE_CONTINUE_PENDING ***}
  {*** 6 = SERVICE_PAUSE_PENDING ***}
  {*** 7 = SERVICE_PAUSED ***}
  {******************************************}

function ServiceRunning(sMachine, sService: PChar): Boolean;

// �������������� �� ������ � ���������
function TranslitEng(s: string): string;
// �������������� �� ��������� � ������
function TranslitRus(s: string): string;

// ������� ���������� ���� ������ - '1' ����� - '0'
function MyBoolToStr(const p_par:boolean):string;

function MyStrToBool(const p_par:string):boolean;

// ������� ������ �������� � ������
// ��� ������������ ����� �����
procedure p_repl_smb ( var p_str:ansistring );

// ������� ������������ ������������ ������
function gt_random_str : ansistring;

// ������� ������������ ���������� ������
function gt_uniq_str : ansistring;

// ������� ���������� 1 ���� true � 0 ���� false
function MyBoolToInt (p_var:boolean) : integer;

// �������������� ������ � ������ � ����������� ����� ����� �� �������� �����
function f_frm_nmb ( p_i : integer; p_len:integer = 2 ) : string;

var
    v_FC_IMAGETYPE_1, v_FC_IMAGETYPE_2,
    v_FC_STUDYID_1, v_FC_STUDYID_2,
    v_FC_PATIENTID_1, v_FC_PATIENTID_2,
    v_FC_STUDYDESCRIPTION_1, v_FC_STUDYDESCRIPTION_2,
    v_FC_ACCESSIONNUMBER_1, v_FC_ACCESSIONNUMBER_2,
    v_FC_DA_1, v_FC_DA_2,
    v_FC_DT_1, v_FC_DT_2,
    v_FC_STUDYUID_1, v_FC_STUDYUID_2,
    v_FC_SERIESUID_1, v_FC_SERIESUID_2,
    v_FC_SERNUM_1, v_FC_SERNUM_2,
    v_FC_PHYSNAME_1, v_FC_PHYSNAME_2,
    v_FC_PNAME_1, v_FC_PNAME_2,
    v_FC_PDATEBORN_1, v_FC_PDATEBORN_2,
    v_FC_PSEX_1, v_FC_PSEX_2,
    v_FC_AID_1, v_FC_AID_2,
    v_FC_ACQNUM_1, v_FC_ACQNUM_2,
    v_FC_INSTANCEUID_1, v_FC_INSTANCEUID_2,
    v_FC_KIN_1, v_FC_KIN_2 : Integer;

procedure dcmTagIni;
function GetWinVer: string;

implementation

// ������� �������� ��������� ����������� ������
function gtFreeVirtualMemory : Cardinal;
var Status: TMemoryStatus; vAmmFree : Cardinal;
begin
  Status.dwLength := sizeof(TMemoryStatus);
  GlobalMemoryStatus(Status);
  {
  vAmmFree := Status.dwMemoryLoad; // : ���������� ������������ ������ � ��������� (%).
  vAmmFree := Status.dwTotalPhys; // : ����� ���������� ���������� ������ � ������.
  vAmmFree := Status.dwAvailPhys; // : ���������� ���������� ���������� ������ � ������.
  vAmmFree := Status.dwTotalPageFile; // : ����� ����������� ����� � ������.
  vAmmFree := Status.dwAvailPageFile; // : ���������� ����� � ���������� �����.
  vAmmFree := Status.dwTotalVirtual; // : ����� ����� ����������� ������ � ������.
  vAmmFree := Status.dwAvailVirtual; // : ���������� ��������� ����������� ������ � ������.
  }
  vAmmFree := Status.dwAvailVirtual div 1024417 ;
  Result := vAmmFree;
end;

// Win95 ��� ���� � NT3.5 ��� ����
function GetWinVer: string;
var
  temp1, temp2, temp3:  integer;
  OsVer: OSVERSIONINFO;
begin
   OsVer.dwOSVersionInfoSize := SizeOf( OSVERSIONINFO );
   GetVersionEx( OsVer );
   temp1 := OsVer.dwMajorVersion;
   temp2 := OsVer.dwMinorVersion;
   temp3 := OsVer.dwPlatformId;
   if temp1 = 4 then
      if temp2 = 0 then
         if temp3 = VER_PLATFORM_WIN32_WINDOWS then
            Result := 'Windows 95';
   if temp1 = 4 then
      if temp2 = 10 then
         Result := 'Windows 98';
   if temp1 = 4 then
      if temp2 = 90 then
         Result := 'Windows Me';
   if temp1 = 3 then
      if temp2 = 51 then
         Result := 'Windows NT 3.51';
   if temp1 = 4 then
      if temp2 = 0 then
         Result := 'Windows NT 4.0';
   if temp1 = 5 then
      if temp2 = 0 then
         Result := 'Windows 2000';
   if temp1 = 5 then
      if temp2 = 1 then
         Result := 'Windows XP';
   if temp1 = 6 then
      if temp2 = 0 then
         Result := 'Windows Vista';
   if temp1 = 6 then
      if temp2 = 1 then
         Result := 'Windows 7';
end;

procedure dcmTagIni;
begin
  v_FC_IMAGETYPE_1:= $8;
  v_FC_IMAGETYPE_2:= $60;
  v_FC_STUDYID_1:= $20;
  v_FC_STUDYID_2:= $10;
  v_FC_PATIENTID_1:= $10;
  v_FC_PATIENTID_2:= $20;
  v_FC_STUDYDESCRIPTION_1:= $8;
  v_FC_STUDYDESCRIPTION_2:= $1030;
  v_FC_ACCESSIONNUMBER_1:= $8;
  v_FC_ACCESSIONNUMBER_2:= $0050;
  v_FC_DA_1:= $8;
  v_FC_DA_2:= $20;
  v_FC_DT_1:= $8;
  v_FC_DT_2:= $30;
  v_FC_STUDYUID_1:= $20;
  v_FC_STUDYUID_2:= $D;
  v_FC_SERIESUID_1:= $20;
  v_FC_SERIESUID_2:= $E;
  v_FC_SERNUM_1:= $20;
  v_FC_SERNUM_2:= $11;
  v_FC_PHYSNAME_1:= $8;
  v_FC_PHYSNAME_2:= $0090;
  v_FC_PNAME_1:= $10;
  v_FC_PNAME_2:= $10;
  v_FC_PDATEBORN_1:= $10;
  v_FC_PDATEBORN_2:= $30;
  v_FC_PSEX_1:= $10;
  v_FC_PSEX_2:= $40;
  v_FC_AID_1:= $20;
  v_FC_AID_2:= $13;
  v_FC_ACQNUM_1:= $20;
  v_FC_ACQNUM_2:= $12;
  v_FC_INSTANCEUID_1:= $8;
  v_FC_INSTANCEUID_2:= $18;
  v_FC_KIN_1:= $2809;
  v_FC_KIN_2:= $001D;
end;

// �������������� ������ � ������ � ����������� ����� ����� �� �������� �����
function f_frm_nmb ( p_i : integer; p_len:integer = 2 ) : string;
var v_res : string;
begin
  v_res:=IntToStr(p_i);
  while length(v_res)<p_len do v_res:='0'+v_res;
  Result:=v_res;
end;

// ������� ���������� 1 ���� true � 0 ���� false
function MyBoolToInt (p_var:boolean) : integer;
begin
  if p_var then
    Result:=1
  else
    Result:=0;
end;

// ����� �������� - ������� ������ ������ DICOP
procedure gt_files_dicom_fr_folder ( var p_s2 : TStringList );
var v_f : TFileOpenDialog; //;  TcxShellBrowserDialog
    v_strings : TStringList;
    i : Integer;
    v_str : string;
    chosenDirectory : string;
    options : TSelectDirOpts;
  procedure GetAllFiles( Path: string );
  var
    sRec: TSearchRec;
    isFound: boolean;
  begin
    isFound := FindFirst( Path + '\*.*', faAnyFile, sRec ) = 0;
    while isFound do
    begin
      if ( sRec.Name <> '.' ) and ( sRec.Name <> '..' ) then
      begin
        if ( sRec.Attr and faDirectory ) = faDirectory then
          GetAllFiles( Path + '\' + sRec.Name  )
        else
          v_strings.Add( Path + '\' + sRec.Name );
      end;
      Application.ProcessMessages;
      isFound := FindNext( sRec ) = 0;
    end;
    FindClose( sRec );
  end;
begin
    chosenDirectory := ExtractFilePath(paramstr(0));
    if SelectDirectory(chosenDirectory, options, 0)
    then begin
      v_strings := TStringList.Create;
      try
        v_strings.Clear;
        GetAllFiles( chosenDirectory );
        // �������� � ����� ������ ������
        p_s2.AddStrings(v_strings);
      finally
        v_strings.Free;
      end;
    end;




   { if SelectDirectory('�������� �������', ExtractFilePath(paramstr(0)), chosenDirectory)
    then begin
      v_strings := TStringList.Create;
      try
        for i:=0 to v_f.Files.Count-1 do begin
          v_strings.Clear;
          // �������� ��� ����� ��������
        //  v_str:=vOpenDialog.Files.Strings[i];
        //  ScanDir(v_str,'*.*',v_strings);
          // �������� � ����� ������ ������
        //  p_s2.AddStrings(v_strings);
        end;
      finally
        v_strings.Free;
      end;
    end;    }

    {
    v_f:=TFileOpenDialog.Create(nil);
    v_f.DefaultFolder := ExtractFilePath(paramstr(0)) ;
    v_strings := TStringList.Create;

ShowMessage('3');

    try
      v_f.Options := [fdoPickFolders,fdoAllowMultiSelect];

ShowMessage('4');
      try
      if v_f.Execute then begin
        // ������ �� ���������

ShowMessage('5');

        for i:=0 to v_f.Files.Count-1 do begin
          v_strings.Clear;
          // �������� ��� ����� ��������
          v_str:=v_f.Files.Strings[i];
          ScanDir(v_str,'*.*',v_strings);
          // �������� � ����� ������ ������
          p_s2.AddStrings(v_strings);
        end;
      end;
      except
      on E:Exception do begin
        ShowMessage('ERROR '+E.Message);
      end;
      end;
    finally
      v_strings.Free;
      v_f.Free;
    end; }
end;

// ������� ������ �������� � ������
// ��� ������������ ����� �����
procedure p_repl_smb ( var p_str:ansistring );
begin
  p_str := StringReplace(p_str, ' ', '_', [rfReplaceAll, rfIgnoreCase]);
  p_str := StringReplace(p_str, '/', '_', [rfReplaceAll, rfIgnoreCase]);
  p_str := StringReplace(p_str, '-', '_', [rfReplaceAll, rfIgnoreCase]);
  p_str := StringReplace(p_str, ':', '_', [rfReplaceAll, rfIgnoreCase]);
end;

// ����������� ������� � ���� �������� �����
procedure ShowBusy(blBusy: boolean);
begin
   if blBusy then
      screen.cursor := crHourglass
   else
      screen.cursor := crDefault;
end;

// ������� �������� ������ � integer
// �� �������� ���� �������� ������ - ���������� 0
function MyStrToInt ( const p_val : string ) : Integer;
begin
  if Trim(p_val)='' then
  begin
    MyStrToInt:=0;
  end else
  begin
    try
      MyStrToInt:=StrToInt(StringReplace(p_val,' ','',[rfReplaceAll, rfIgnoreCase]));
    except
      MyStrToInt:=0;
    end;
  end;
end;

// ��������� ��������� ����� �� ������
Procedure Cntr_screen ( p_form : TForm );
begin
  if ( ( p_form.Width ) > Screen.WIdth )
  or ( ( p_form.Height ) > Screen.Height )
  then begin
    try
      p_form.WindowState := wsMaximized ;
    except
    end;
  end else begin
    try
      p_form.Left:= round ( ( Screen.Width - p_form.Width ) * 0.5 ) ;
    except
    end;
    try
      p_form.Top:= round ( ( Screen.Height - p_form.Height ) * 0.5 ) ;
    except
    end;
  end;
end;

// ����������� ������� �����
function FileSizeByName(fileName : wideString) : Int64;
var sr : TSearchRec; v_res : Integer;
begin
  if SysUtils.FindFirst(fileName, faAnyFile, sr ) = 0 then
    v_res := Int64(sr.FindData.nFileSizeHigh) shl Int64(32) + Int64(sr.FindData.nFileSizeLow)
  else
    v_res := -1;
  SysUtils.FindClose(sr) ;
  if v_res<0 then v_res:=0;
  FileSizeByName := v_res;
end;

function ServiceStart(aMachine, aServiceName: PChar ): boolean;
// aMachine ��� UNC ����, ���� ��������� ��������� ���� �����
var
  h_manager,h_svc: SC_Handle;
  svc_status: TServiceStatus;
  Temp: PChar;
  dwCheckPoint: DWord;
begin
  svc_status.dwCurrentState := 1;
  h_manager := OpenSCManager(PChar(aMachine), nil, SC_MANAGER_CONNECT);
  if h_manager > 0 then
  begin
    h_svc := OpenService(h_manager, PChar(aServiceName),
    SERVICE_START or SERVICE_QUERY_STATUS);
    if h_svc > 0 then
    begin
      temp := nil;
      if (StartService(h_svc,0,temp)) then
        if (QueryServiceStatus(h_svc,svc_status)) then
        begin
          while (SERVICE_RUNNING <> svc_status.dwCurrentState) do
          begin
            dwCheckPoint := svc_status.dwCheckPoint;
            Sleep(svc_status.dwWaitHint);
            if (not QueryServiceStatus(h_svc,svc_status)) then
              break;
            if (svc_status.dwCheckPoint < dwCheckPoint) then
            begin
              // QueryServiceStatus �� ����������� dwCheckPoint
              break;
            end;
          end;
        end;
      CloseServiceHandle(h_svc);
    end;
    CloseServiceHandle(h_manager);
  end;
  Result := SERVICE_RUNNING = svc_status.dwCurrentState;
end;


function ServiceStop(aMachine,aServiceName: PChar ): boolean;
// aMachine ��� UNC ����, ���� ��������� ��������� ���� �����
var
  h_manager, h_svc: SC_Handle;
  svc_status: TServiceStatus;
  dwCheckPoint: DWord;
begin
  h_manager:=OpenSCManager(PChar(aMachine),nil, SC_MANAGER_CONNECT);
  if h_manager > 0 then
  begin
    h_svc := OpenService(h_manager,PChar(aServiceName),
    SERVICE_STOP or SERVICE_QUERY_STATUS);
    if h_svc > 0 then
    begin
      if(ControlService(h_svc,SERVICE_CONTROL_STOP, svc_status))then
      begin
        if(QueryServiceStatus(h_svc,svc_status))then
        begin
          while(SERVICE_STOPPED <> svc_status.dwCurrentState)do
          begin
            dwCheckPoint := svc_status.dwCheckPoint;
            Sleep(svc_status.dwWaitHint);
            if(not QueryServiceStatus(h_svc,svc_status))then
            begin
              // couldn't check status
              break;
            end;
            if(svc_status.dwCheckPoint < dwCheckPoint)then
              break;
          end;
        end;
      end;
      CloseServiceHandle(h_svc);
    end;
    CloseServiceHandle(h_manager);
  end;
  Result := SERVICE_STOPPED = svc_status.dwCurrentState;
end;

{
  Windows 2000 and earlier: All processes are granted the SC_MANAGER_CONNECT, 
  SC_MANAGER_ENUMERATE_SERVICE, and SC_MANAGER_QUERY_LOCK_STATUS access rights. 
  Windows XP: Only authenticated users are granted the SC_MANAGER_CONNECT,
  SC_MANAGER_ENUMERATE_SERVICE,
  and SC_MANAGER_QUERY_LOCK_STATUS access rights.
  Do not use the service display name (as displayed in the services
  control panel applet.) You must use the real service name, as
  referenced in the registry under
  HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services
}
function ServiceGetStatus(sMachine, sService: PChar): DWORD;
  {******************************************}
  {*** Parameters: ***}
  {*** sService: specifies the name of the service to open
  {*** sMachine: specifies the name of the target computer
  {*** ***}
  {*** Return Values: ***}
  {*** -1 = Error opening service ***}
  {*** 1 = SERVICE_STOPPED ***}
  {*** 2 = SERVICE_START_PENDING ***}
  {*** 3 = SERVICE_STOP_PENDING ***}
  {*** 4 = SERVICE_RUNNING ***}
  {*** 5 = SERVICE_CONTINUE_PENDING ***}
  {*** 6 = SERVICE_PAUSE_PENDING ***}
  {*** 7 = SERVICE_PAUSED ***}
  {******************************************}
var
  SCManHandle, SvcHandle: SC_Handle; 
  SS: TServiceStatus; 
  dwStat: DWORD; 
begin 
  dwStat := 0; 
  // Open service manager handle. 
  SCManHandle := OpenSCManager(sMachine, nil, SC_MANAGER_CONNECT); 
  if (SCManHandle > 0) then 
  begin 
    SvcHandle := OpenService(SCManHandle, sService, SERVICE_QUERY_STATUS); 
    // if Service installed 
    if (SvcHandle > 0) then 
    begin
      // SS structure holds the service status (TServiceStatus); 
      if (QueryServiceStatus(SvcHandle, SS)) then 
        dwStat := ss.dwCurrentState; 
      CloseServiceHandle(SvcHandle); 
    end; 
    CloseServiceHandle(SCManHandle); 
  end; 
  Result := dwStat; 
end;

function ServiceRunning(sMachine, sService: PChar): Boolean;
begin 
  Result := ( SERVICE_RUNNING = ServiceGetStatus(sMachine, sService) ) ; 
end;

function MyFileExists(fileName:string):boolean;
var Code : DWORD; v_err : integer;
begin
  Code := GetFileAttributes(PAnsiChar(fileName));
  v_err:=GetLastError;
  if (Code=-1) then
  begin
    Result := False;
  end else if (v_err=0) then
  begin
    Result := True;
  end else
  begin
    Result := False;
  end;
end;

// ��������� ������ � ���� ������
procedure MnFl_ev ( const p_strs : ansistring;
                  const p_filename : ansistring = '';
                  const p_is_delim : Boolean = False;
                  const p_is_DT : boolean = True );
var v_flist_res : TStringList;
const c_delim = '-------------------------------------------------------------------------------';
begin
  if Trim(p_filename)<>'' then begin
    v_flist_res := TStringList.Create;
    try
      if fileexists(p_filename) then
        v_flist_res.LoadFromFile(p_filename);
      v_flist_res.Add(p_strs);
      v_flist_res.SaveToFile(p_filename);
    finally
      v_flist_res.Free;
    end;
  end;
end;

// ��������� ������ � ���-����
procedure MnLg_ev ( const p_strs : ansistring;
                  const p_filename : ansistring = '';
                  const p_is_delim : Boolean = False;
                  const p_is_DT : boolean = True );
var F : TextFile; v_is_ex : Boolean;
const c_delim = '-------------------------------------------------------------------------------';
  procedure wrt_err(p_str:ansistring);
  begin
  {  try
        AssignFile(F, p_filename+IntToStr(GetTickCount)+'_err');
        rewrite(F);
        writeln(F,DateTimeToStr(Now)+' '+p_str);
        Flush(F);
        CloseFile(F);
      except
      end;  }
  end;
 { function GetFreeDiskSize: Int64;
  var free_size, total_size: Int64;
      RootPath: array[0..4] of Char;
      RootPtr: PChar;
      current_dir, v_tmp: string;
      drive: char;
  begin
    v_tmp := Trim(GetCurrentDir);
    drive:=v_tmp[1];
    RootPath[0] := Drive;
    RootPath[1] := ':';
    RootPath[2] := '\';
    RootPath[3] := #0;
    RootPtr := RootPath;
    current_dir := GetCurrentDir;
    if SetCurrentDir(drive + ':\') then
    begin
      GetDiskFreeSpaceEx(RootPtr, Free_size, Total_size, nil);
      // this to turn back to original dir
      SetCurrentDir(current_dir);
      Result := Trunc( Free_size/(1024 * 1024 * 1024) );
    end
    else
    begin
      Result := 0;
      Free_size  := -1;
      Total_size := -1;
    end;
  end;  }
const c_free_space = 5; // ��������� ����� �� ����� - ���� ������ - �� ����� ����
begin
  try
//    if GetFreeDiskSize<c_free_space then Exit; // ���� ����� ������  Gigabytes
    if Trim(p_filename)<>'' then begin
      v_is_ex:=FileExists(p_filename);
      AssignFile(F, p_filename);
      try
        try
          if v_is_ex then begin
            Append(F);
          end else begin
            rewrite(F);
          end;
          if p_is_delim then writeln(F,c_delim);
          if p_is_DT then
            writeln(F,DateTimeToStr(Now)+' '+p_strs)
          else
            writeln(F,p_strs);
          Flush(F);
        except
          on E:Exception do
            wrt_err(DateTimeToStr(Now)+' ERROR (append/rewrite): '+E.Message+#13+
                 ' original message : '+p_strs);
        end;
      finally
        try
          CloseFile(F);
        except
          on E:Exception do
            wrt_err(DateTimeToStr(Now)+' ERROR (CloseFile) : '+E.Message+#13+
                 ' original message : '+p_strs);
        end;
      end;
    end;
  except
    on E:Exception do
      wrt_err(DateTimeToStr(Now)+' ERROR (summary): '+E.Message+#13+
                 ' original message : '+p_strs);
  end;   
end;

function TranslitRus(s: string): string;
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
                       '�', 'ya', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'yu', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'e', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'eh', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'shh', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'sh', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'ch', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'zh', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'jo', [rfReplaceAll, rfIgnoreCase])),
                       '�', '''', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'y', [rfReplaceAll, rfIgnoreCase])),
                       '�', '"', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'h', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'c', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'f', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'u', [rfReplaceAll, rfIgnoreCase])),
                       '�', 't', [rfReplaceAll, rfIgnoreCase])),
                       '�', 's', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'r', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'p', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'o', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'n', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'm', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'l', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'k', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'j', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'i', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'z', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'd', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'g', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'v', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'b', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'a', [rfReplaceAll, rfIgnoreCase]);

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
                       '�', 'ya', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'yu', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'e', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'eh', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'shh', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'sh', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'ch', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'zh', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'jo', [rfReplaceAll, rfIgnoreCase])),
                       '�', '''', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'y', [rfReplaceAll, rfIgnoreCase])),
                       '�', '"', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'h', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'c', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'f', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'u', [rfReplaceAll, rfIgnoreCase])),
                       '�', 't', [rfReplaceAll, rfIgnoreCase])),
                       '�', 's', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'r', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'p', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'o', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'n', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'm', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'l', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'k', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'j', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'i', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'z', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'd', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'g', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'v', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'b', [rfReplaceAll, rfIgnoreCase])),
                       '�', 'a', [rfReplaceAll, rfIgnoreCase]);

  TranslitRus := AnsiUpperCase(StrL);
end;

// �������������� �� ������ � ���������
function TranslitEng(s: string): string;
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
                       'ya', '�', [rfReplaceAll, rfIgnoreCase])),
                       'yu', '�', [rfReplaceAll, rfIgnoreCase])),
                       'e', '�', [rfReplaceAll, rfIgnoreCase])),
                       'eh', '�', [rfReplaceAll, rfIgnoreCase])),
                       'shh', '�', [rfReplaceAll, rfIgnoreCase])),
                       'sh', '�', [rfReplaceAll, rfIgnoreCase])),
                       'ch', '�', [rfReplaceAll, rfIgnoreCase])),
                       'zh', '�', [rfReplaceAll, rfIgnoreCase])),
                       'jo', '�', [rfReplaceAll, rfIgnoreCase])),
                       '''', '�', [rfReplaceAll, rfIgnoreCase])),
                       'y', '�', [rfReplaceAll, rfIgnoreCase])),
                       '"', '�', [rfReplaceAll, rfIgnoreCase])),
                       'h', '�', [rfReplaceAll, rfIgnoreCase])),
                       'c', '�', [rfReplaceAll, rfIgnoreCase])),
                       'f', '�', [rfReplaceAll, rfIgnoreCase])),
                       'u', '�', [rfReplaceAll, rfIgnoreCase])),
                       't', '�', [rfReplaceAll, rfIgnoreCase])),
                       's', '�', [rfReplaceAll, rfIgnoreCase])),
                       'r', '�', [rfReplaceAll, rfIgnoreCase])),
                       'p', '�', [rfReplaceAll, rfIgnoreCase])),
                       'o', '�', [rfReplaceAll, rfIgnoreCase])),
                       'n', '�', [rfReplaceAll, rfIgnoreCase])),
                       'm', '�', [rfReplaceAll, rfIgnoreCase])),
                       'l', '�', [rfReplaceAll, rfIgnoreCase])),
                       'k', '�', [rfReplaceAll, rfIgnoreCase])),
                       'j', '�', [rfReplaceAll, rfIgnoreCase])),
                       'i', '�', [rfReplaceAll, rfIgnoreCase])),
                       'z', '�', [rfReplaceAll, rfIgnoreCase])),
                       'd', '�', [rfReplaceAll, rfIgnoreCase])),
                       'g', '�', [rfReplaceAll, rfIgnoreCase])),
                       'v', '�', [rfReplaceAll, rfIgnoreCase])),
                       'b', '�', [rfReplaceAll, rfIgnoreCase])),
                       'a', '�', [rfReplaceAll, rfIgnoreCase]);

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
                       'ya', '�', [rfReplaceAll, rfIgnoreCase])),
                       'yu', '�', [rfReplaceAll, rfIgnoreCase])),
                       'e', '�', [rfReplaceAll, rfIgnoreCase])),
                       'eh', '�', [rfReplaceAll, rfIgnoreCase])),
                       'shh', '�', [rfReplaceAll, rfIgnoreCase])),
                       'sh', '�', [rfReplaceAll, rfIgnoreCase])),
                       'ch', '�', [rfReplaceAll, rfIgnoreCase])),
                       'zh', '�', [rfReplaceAll, rfIgnoreCase])),
                       'jo', '�', [rfReplaceAll, rfIgnoreCase])),
                       '''', '�', [rfReplaceAll, rfIgnoreCase])),
                       'y', '�', [rfReplaceAll, rfIgnoreCase])),
                       '"', '�', [rfReplaceAll, rfIgnoreCase])),
                       'h', '�', [rfReplaceAll, rfIgnoreCase])),
                       'c', '�', [rfReplaceAll, rfIgnoreCase])),
                       'f', '�', [rfReplaceAll, rfIgnoreCase])),
                       'u', '�', [rfReplaceAll, rfIgnoreCase])),
                       't', '�', [rfReplaceAll, rfIgnoreCase])),
                       's', '�', [rfReplaceAll, rfIgnoreCase])),
                       'r', '�', [rfReplaceAll, rfIgnoreCase])),
                       'p', '�', [rfReplaceAll, rfIgnoreCase])),
                       'o', '�', [rfReplaceAll, rfIgnoreCase])),
                       'n', '�', [rfReplaceAll, rfIgnoreCase])),
                       'm', '�', [rfReplaceAll, rfIgnoreCase])),
                       'l', '�', [rfReplaceAll, rfIgnoreCase])),
                       'k', '�', [rfReplaceAll, rfIgnoreCase])),
                       'j', '�', [rfReplaceAll, rfIgnoreCase])),
                       'i', '�', [rfReplaceAll, rfIgnoreCase])),
                       'z', '�', [rfReplaceAll, rfIgnoreCase])),
                       'd', '�', [rfReplaceAll, rfIgnoreCase])),
                       'g', '�', [rfReplaceAll, rfIgnoreCase])),
                       'v', '�', [rfReplaceAll, rfIgnoreCase])),
                       'b', '�', [rfReplaceAll, rfIgnoreCase])),
                       'a', '�', [rfReplaceAll, rfIgnoreCase]);

  TranslitEng := AnsiUpperCase(StrL);
end;

function MyBoolToStr(const p_par:boolean):string;
begin
  if p_par then begin
    MyBoolToStr := '1';
  end else begin
    MyBoolToStr := '0';
  end;
end;

function MyStrToBool(const p_par:string):boolean;
begin
  if Copy(p_par,1,1)='1' then begin
    MyStrToBool := True;
  end else begin
    MyStrToBool := False;
  end;
end;

{
function GetMainWindow (hWindow : THandle) : THandle;
var hMainWindow, hW : THandle;
begin
  hMainWindow := hWindow;
  hW := hWindow;
  repeat
    hW := GetParent(hW);
    if (hW <> 0)
    then hMainWindow := hW;
  until (hW = 0);
  Result := hMainWindow;
end;

procedure Set_Foreground_Window (hWindow : THandle);
var dwTimeout : DWord;
   hMainWindow, hFGW, hMDIClient : THandle;
begin
  if (hWindow = 0) then Exit;
  // ������� ������� ����
  hMainWindow := GetMainWindow(hWindow);
  // ������ ����� ���� ������ �������
  hFGW := GetForegroundWindow;
  // ���� �� ���� - ����� ���������
  if (hMainWindow <> hFGW) then begin
  // �������� �������� ������ ������� ����
    SystemParametersInfo(SPI_GETFOREGROUNDLOCKTIMEOUT, 0, @dwTimeout, 0);
    SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, nil, 0);
    try
    // ��������� ������� ��������� ������� ����
    SendMessage(GetDesktopWindow(), WM_SYSCOMMAND, SC_HOTKEY, hMainWindow);
    SwitchToThisWindow(hMainWindow, True);
    SetForegroundWindow(hMainWindow);
    // ��� MDI ����
    if (hWindow <> hMainWindow) then begin
      // ������ MDI Client
      hMDIClient := FindWindowEx(hMainWindow, 0, "MDIClient", "");
      // ������ ��� ��������� WM_MDIACTIVATE
      SendMessage(hMDIClient, WM_MDIACTIVATE, hWindow, 0);
    end;
    finally
      // ����������� ��������
      SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, @dwTimeout, 0);
    end;
  end;
end; }

// ��������� ���������� ��������
function GetTempDirectory: String;
var
  tempFolder: array[0..MAX_PATH] of Char;
  v_tmp : AnsiString;
begin
  // ������������� ����� ������������ GetEnvironmentVariable('TEMP')
  v_tmp:=GetEnvironmentVariable('USERPROFILE'); // +'\AppData\Local\Temp'
  if DirectoryExists(v_tmp) then
  begin
    GetTempDirectory:=v_tmp;
  end else begin  // /windows/temp
    GetTempPath(MAX_PATH, @tempFolder);
    GetTempDirectory:= StrPas(tempFolder);
  end;
end;

// ��������� ��������� ����� �� ������� �������� ��������
procedure cntr_frm ( p_Form : TForm;
                     var p_is_move : Boolean 
                   );
var v_pnt : TPoint;
    v_act_monitor : TMonitor;
begin
  if not p_is_move then
  begin
    p_is_move:=True;
    with p_Form do
    begin
      // ������� �������
      v_pnt:=Mouse.CursorPos;
      // �� ������� ���������� �������
      v_act_monitor := Screen.MonitorFromPoint(v_pnt);
      // ������������� boundsrect �����
//      p_Form.BoundsRect := v_act_monitor.BoundsRect;
      p_Form.BoundsRect := v_act_monitor.WorkareaRect;
      p_Form.Refresh;
    end;
    p_is_move:=False;
  end;
end;

Procedure ScanDir(StartDir: String; Mask:string; List:TStrings);
{ ��������� ������� ������ ���������� � ������ List, ������� � ����������,
��������� � StartDir. Mask - ����� ��� ��������� ������
}
Var SearchRec : TSearchRec;
Begin
 IF Mask ='' then Mask:= '*.*';
 IF StartDir[Length(StartDir)] <> '\' then StartDir := StartDir + '\';
  IF FindFirst(StartDir+Mask, faAnyFile, SearchRec) = 0 then
   Begin
    Repeat
       { ����� ���������� "�� ���������" }
     Application.ProcessMessages;
     IF (SearchRec.Attr and faDirectory) <> faDirectory then
        List.Add(StartDir + SearchRec.Name) else
         IF (SearchRec.Name <> '..') and (SearchRec.Name <> '.') then
       Begin
       //  List.Add(StartDir + SearchRec.Name + '\');
           { ����������� ����� }
         ScanDir(StartDir + SearchRec.Name + '\',Mask,List);
       End;
    Until FindNext(SearchRec) <> 0;
    FindClose(SearchRec);
  End; {IF}
end;

// ������� ����������� ����������� ���� ��������
function gt_sex ( p_sex : string ) : string;
var v_res : string;
begin
  v_res := Copy(Trim(p_sex),1,1);
  if v_res = 'F' then
  begin
    v_res:= '�';
  end else
  if v_res = 'f' then
  begin
    v_res:= '�';
  end else
  if v_res = 'M' then
  begin
    v_res:= '�';
  end else
  if v_res = 'm' then
  begin
    v_res:= '�';

  end else
  if v_res = '�' then
  begin
    v_res:= '�';
  end else
  if v_res = '�' then
  begin
    v_res:= '�';
  end else
  if v_res = '�' then
  begin
    v_res:= '�';
  end else
  if v_res = '�' then
  begin
    v_res:= '�';
  end else
  begin
    v_res:= '';
  end;
  Result := v_res;
end;

// ������� ������������ ������������ ������
function gt_random_str : ansistring;
//var v_now : TDateTime;
begin
 // v_now := Now;
  Result := inttostr(Random(1000));
           {'random_'+
            Application.Title+'_'+
            IntToStr(Yearof(v_now))+'.'+
            IntToStr(Monthof(v_now))+'.'+
            IntToStr(Dayof(v_now))+'.'+
            IntToStr(Hourof(v_now))+'.'+
            IntToStr(Minuteof(v_now))+'.'+
            IntToStr(Secondof(v_now))+'.'+
            IntToStr(Millisecondof(v_now))} ;
end;

// ������� ������������ ���������� ������
function gt_uniq_str : ansistring;
var v_now : TDateTime;
begin
  v_now := Now;
  Result := IntToStr(GetTickCount)+'.'+
            IntToStr(Yearof(v_now))+'.'+
            IntToStr(Monthof(v_now))+'.'+
            IntToStr(Dayof(v_now))+'.'+
            IntToStr(Hourof(v_now))+'.'+
            IntToStr(Minuteof(v_now))+'.'+
            IntToStr(Secondof(v_now))+'.'+
            IntToStr(Millisecondof(v_now)) ;
end;

end.
