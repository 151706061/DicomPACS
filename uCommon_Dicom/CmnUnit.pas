{ Модуль для процедур "общего назначения", используемых в модулях
  типа обработка строк, управление сервисами, работы с файлами и проч.
}

unit CmnUnit;

interface

uses Windows, Forms, SysUtils, Controls, WinSvc, Types, Psapi, tlhelp32,
     Classes, Dialogs, DateUtils, DICOM_charset, cxShellBrowserDialog,
     FileCtrl;

var
  // обработка событий ползунка
  // 0 - в цикле
  // 1 - принудительная остановка
  // 2 - успешное завершение
  v_exit_progressbar : byte;

// функция возврата свободной виртуальной памяти
function gtFreeVirtualMemory : Cardinal;

// функция правильного отображения пола пациента
function gt_sex ( p_sex : string ) : string;

// выбор каталога - возврат списка файлов DICOP
procedure gt_files_dicom_fr_folder ( var p_s2 : TStringList );

Procedure ScanDir(StartDir: String; Mask:string; List:TStrings);
{ Процедура выводит список директории в список List, начиная с директории,
указанной в StartDir. Mask - маска для получения файлов
}

// процедура центровки формы на текущем активном мониторе
procedure cntr_frm ( p_Form : TForm; var p_is_move : Boolean );

// получение временного каталога Windows
function GetTempDirectory: String;

// процедура записи в файл строки
procedure MnFl_ev ( const p_strs : ansistring;
                  const p_filename : ansistring = '';
                  const p_is_delim : Boolean = False;
                  const p_is_DT : boolean = True );

// процедура записи в лог-файл
procedure MnLg_ev ( const p_strs : ansistring;
                    const p_filename : ansistring = '';
                    const p_is_delim : Boolean = False;
                    const p_is_DT : boolean = True );

// процедура центровки формы на экране
Procedure Cntr_screen ( p_form : TForm );

// определение размера файла
function FileSizeByName(fileName : wideString) : Int64;

// функция перевода строки в integer
// не ругается если возникла ошибка - возвращает 0
function MyStrToInt ( const p_val : string ) : Integer;

// отображение курсора в виде песочных часов
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

// транслитерация из латыни в кириллицу
function TranslitEng(s: string): string;
// транслитерация из кириллицы в латынь
function TranslitRus(s: string): string;

// функция возвразает если истина - '1' иначе - '0'
function MyBoolToStr(const p_par:boolean):string;

function MyStrToBool(const p_par:string):boolean;

// функция замены символов в строке
// для формирования имени файла
procedure p_repl_smb ( var p_str:ansistring );

// функция возвращающая произвольную строку
function gt_random_str : ansistring;

// функция возвращающая уникальную строку
function gt_uniq_str : ansistring;

// функция возвращает 1 если true и 0 если false
function MyBoolToInt (p_var:boolean) : integer;

// преобразование целого в строку с добавлением слева нулей до заданной длины
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

// функция возврата свободной виртуальной памяти
function gtFreeVirtualMemory : Cardinal;
var Status: TMemoryStatus; vAmmFree : Cardinal;
begin
  Status.dwLength := sizeof(TMemoryStatus);
  GlobalMemoryStatus(Status);
  {
  vAmmFree := Status.dwMemoryLoad; // : Количество используемой памяти в процентах (%).
  vAmmFree := Status.dwTotalPhys; // : Общее количество физической памяти в байтах.
  vAmmFree := Status.dwAvailPhys; // : Количество оставшейся физической памяти в байтах.
  vAmmFree := Status.dwTotalPageFile; // : Объём страничного файла в байтах.
  vAmmFree := Status.dwAvailPageFile; // : Свободного места в страничном файле.
  vAmmFree := Status.dwTotalVirtual; // : Общий объём виртуальной памяти в байтах.
  vAmmFree := Status.dwAvailVirtual; // : Количество свободной виртуальной памяти в байтах.
  }
  vAmmFree := Status.dwAvailVirtual div 1024417 ;
  Result := vAmmFree;
end;

// Win95 или выше и NT3.5 или выше
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

// преобразование целого в строку с добавлением слева нулей до заданной длины
function f_frm_nmb ( p_i : integer; p_len:integer = 2 ) : string;
var v_res : string;
begin
  v_res:=IntToStr(p_i);
  while length(v_res)<p_len do v_res:='0'+v_res;
  Result:=v_res;
end;

// функция возвращает 1 если true и 0 если false
function MyBoolToInt (p_var:boolean) : integer;
begin
  if p_var then
    Result:=1
  else
    Result:=0;
end;

// выбор каталога - возврат списка файлов DICOP
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
        // добавить в общий список файлов
        p_s2.AddStrings(v_strings);
      finally
        v_strings.Free;
      end;
    end;




   { if SelectDirectory('Выберите каталог', ExtractFilePath(paramstr(0)), chosenDirectory)
    then begin
      v_strings := TStringList.Create;
      try
        for i:=0 to v_f.Files.Count-1 do begin
          v_strings.Clear;
          // получить все файлы каталога
        //  v_str:=vOpenDialog.Files.Strings[i];
        //  ScanDir(v_str,'*.*',v_strings);
          // добавить в общий список файлов
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
        // проход по каталогам

ShowMessage('5');

        for i:=0 to v_f.Files.Count-1 do begin
          v_strings.Clear;
          // получить все файлы каталога
          v_str:=v_f.Files.Strings[i];
          ScanDir(v_str,'*.*',v_strings);
          // добавить в общий список файлов
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

// функция замены символов в строке
// для формирования имени файла
procedure p_repl_smb ( var p_str:ansistring );
begin
  p_str := StringReplace(p_str, ' ', '_', [rfReplaceAll, rfIgnoreCase]);
  p_str := StringReplace(p_str, '/', '_', [rfReplaceAll, rfIgnoreCase]);
  p_str := StringReplace(p_str, '-', '_', [rfReplaceAll, rfIgnoreCase]);
  p_str := StringReplace(p_str, ':', '_', [rfReplaceAll, rfIgnoreCase]);
end;

// отображение курсора в виде песочных часов
procedure ShowBusy(blBusy: boolean);
begin
   if blBusy then
      screen.cursor := crHourglass
   else
      screen.cursor := crDefault;
end;

// функция перевода строки в integer
// не ругается если возникла ошибка - возвращает 0
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

// процедура центровки формы на экране
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

// определение размера файла
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
// aMachine это UNC путь, либо локальный компьютер если пусто
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
              // QueryServiceStatus не увеличивает dwCheckPoint
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
// aMachine это UNC путь, либо локальный компьютер если пусто
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

// процедура записи в файл строки
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

// процедура записи в лог-файл
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
const c_free_space = 5; // свободное место на диске - если меньше - не пишем логи
begin
  try
//    if GetFreeDiskSize<c_free_space then Exit; // если места меньше  Gigabytes
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
                       'Я', 'ya', [rfReplaceAll, rfIgnoreCase])),
                       'Ю', 'yu', [rfReplaceAll, rfIgnoreCase])),
                       'Е', 'e', [rfReplaceAll, rfIgnoreCase])),
                       'Э', 'eh', [rfReplaceAll, rfIgnoreCase])),
                       'Щ', 'shh', [rfReplaceAll, rfIgnoreCase])),
                       'Ш', 'sh', [rfReplaceAll, rfIgnoreCase])),
                       'Ч', 'ch', [rfReplaceAll, rfIgnoreCase])),
                       'Ж', 'zh', [rfReplaceAll, rfIgnoreCase])),
                       'Ё', 'jo', [rfReplaceAll, rfIgnoreCase])),
                       'Ь', '''', [rfReplaceAll, rfIgnoreCase])),
                       'Ы', 'y', [rfReplaceAll, rfIgnoreCase])),
                       'Ъ', '"', [rfReplaceAll, rfIgnoreCase])),
                       'Х', 'h', [rfReplaceAll, rfIgnoreCase])),
                       'Ц', 'c', [rfReplaceAll, rfIgnoreCase])),
                       'Ф', 'f', [rfReplaceAll, rfIgnoreCase])),
                       'У', 'u', [rfReplaceAll, rfIgnoreCase])),
                       'Т', 't', [rfReplaceAll, rfIgnoreCase])),
                       'С', 's', [rfReplaceAll, rfIgnoreCase])),
                       'Р', 'r', [rfReplaceAll, rfIgnoreCase])),
                       'П', 'p', [rfReplaceAll, rfIgnoreCase])),
                       'О', 'o', [rfReplaceAll, rfIgnoreCase])),
                       'Н', 'n', [rfReplaceAll, rfIgnoreCase])),
                       'М', 'm', [rfReplaceAll, rfIgnoreCase])),
                       'Л', 'l', [rfReplaceAll, rfIgnoreCase])),
                       'К', 'k', [rfReplaceAll, rfIgnoreCase])),
                       'Й', 'j', [rfReplaceAll, rfIgnoreCase])),
                       'И', 'i', [rfReplaceAll, rfIgnoreCase])),
                       'З', 'z', [rfReplaceAll, rfIgnoreCase])),
                       'Д', 'd', [rfReplaceAll, rfIgnoreCase])),
                       'Г', 'g', [rfReplaceAll, rfIgnoreCase])),
                       'В', 'v', [rfReplaceAll, rfIgnoreCase])),
                       'Б', 'b', [rfReplaceAll, rfIgnoreCase])),
                       'А', 'a', [rfReplaceAll, rfIgnoreCase]);

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
                       'я', 'ya', [rfReplaceAll, rfIgnoreCase])),
                       'ю', 'yu', [rfReplaceAll, rfIgnoreCase])),
                       'е', 'e', [rfReplaceAll, rfIgnoreCase])),
                       'э', 'eh', [rfReplaceAll, rfIgnoreCase])),
                       'щ', 'shh', [rfReplaceAll, rfIgnoreCase])),
                       'ш', 'sh', [rfReplaceAll, rfIgnoreCase])),
                       'ч', 'ch', [rfReplaceAll, rfIgnoreCase])),
                       'ж', 'zh', [rfReplaceAll, rfIgnoreCase])),
                       'ё', 'jo', [rfReplaceAll, rfIgnoreCase])),
                       'ь', '''', [rfReplaceAll, rfIgnoreCase])),
                       'ы', 'y', [rfReplaceAll, rfIgnoreCase])),
                       'ъ', '"', [rfReplaceAll, rfIgnoreCase])),
                       'х', 'h', [rfReplaceAll, rfIgnoreCase])),
                       'ц', 'c', [rfReplaceAll, rfIgnoreCase])),
                       'ф', 'f', [rfReplaceAll, rfIgnoreCase])),
                       'у', 'u', [rfReplaceAll, rfIgnoreCase])),
                       'т', 't', [rfReplaceAll, rfIgnoreCase])),
                       'с', 's', [rfReplaceAll, rfIgnoreCase])),
                       'р', 'r', [rfReplaceAll, rfIgnoreCase])),
                       'п', 'p', [rfReplaceAll, rfIgnoreCase])),
                       'о', 'o', [rfReplaceAll, rfIgnoreCase])),
                       'н', 'n', [rfReplaceAll, rfIgnoreCase])),
                       'м', 'm', [rfReplaceAll, rfIgnoreCase])),
                       'л', 'l', [rfReplaceAll, rfIgnoreCase])),
                       'к', 'k', [rfReplaceAll, rfIgnoreCase])),
                       'й', 'j', [rfReplaceAll, rfIgnoreCase])),
                       'и', 'i', [rfReplaceAll, rfIgnoreCase])),
                       'з', 'z', [rfReplaceAll, rfIgnoreCase])),
                       'д', 'd', [rfReplaceAll, rfIgnoreCase])),
                       'г', 'g', [rfReplaceAll, rfIgnoreCase])),
                       'в', 'v', [rfReplaceAll, rfIgnoreCase])),
                       'б', 'b', [rfReplaceAll, rfIgnoreCase])),
                       'а', 'a', [rfReplaceAll, rfIgnoreCase]);

  TranslitRus := AnsiUpperCase(StrL);
end;

// транслитерация из латыни в кириллицу
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
                       'ya', 'Я', [rfReplaceAll, rfIgnoreCase])),
                       'yu', 'Ю', [rfReplaceAll, rfIgnoreCase])),
                       'e', 'Е', [rfReplaceAll, rfIgnoreCase])),
                       'eh', 'Э', [rfReplaceAll, rfIgnoreCase])),
                       'shh', 'Щ', [rfReplaceAll, rfIgnoreCase])),
                       'sh', 'Ш', [rfReplaceAll, rfIgnoreCase])),
                       'ch', 'Ч', [rfReplaceAll, rfIgnoreCase])),
                       'zh', 'Ж', [rfReplaceAll, rfIgnoreCase])),
                       'jo', 'Ё', [rfReplaceAll, rfIgnoreCase])),
                       '''', 'Ь', [rfReplaceAll, rfIgnoreCase])),
                       'y', 'Ы', [rfReplaceAll, rfIgnoreCase])),
                       '"', 'Ъ', [rfReplaceAll, rfIgnoreCase])),
                       'h', 'Х', [rfReplaceAll, rfIgnoreCase])),
                       'c', 'Ц', [rfReplaceAll, rfIgnoreCase])),
                       'f', 'Ф', [rfReplaceAll, rfIgnoreCase])),
                       'u', 'У', [rfReplaceAll, rfIgnoreCase])),
                       't', 'Т', [rfReplaceAll, rfIgnoreCase])),
                       's', 'С', [rfReplaceAll, rfIgnoreCase])),
                       'r', 'Р', [rfReplaceAll, rfIgnoreCase])),
                       'p', 'П', [rfReplaceAll, rfIgnoreCase])),
                       'o', 'О', [rfReplaceAll, rfIgnoreCase])),
                       'n', 'Н', [rfReplaceAll, rfIgnoreCase])),
                       'm', 'М', [rfReplaceAll, rfIgnoreCase])),
                       'l', 'Л', [rfReplaceAll, rfIgnoreCase])),
                       'k', 'К', [rfReplaceAll, rfIgnoreCase])),
                       'j', 'Й', [rfReplaceAll, rfIgnoreCase])),
                       'i', 'И', [rfReplaceAll, rfIgnoreCase])),
                       'z', 'З', [rfReplaceAll, rfIgnoreCase])),
                       'd', 'Д', [rfReplaceAll, rfIgnoreCase])),
                       'g', 'Г', [rfReplaceAll, rfIgnoreCase])),
                       'v', 'В', [rfReplaceAll, rfIgnoreCase])),
                       'b', 'Б', [rfReplaceAll, rfIgnoreCase])),
                       'a', 'А', [rfReplaceAll, rfIgnoreCase]);

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
                       'ya', 'я', [rfReplaceAll, rfIgnoreCase])),
                       'yu', 'ю', [rfReplaceAll, rfIgnoreCase])),
                       'e', 'е', [rfReplaceAll, rfIgnoreCase])),
                       'eh', 'э', [rfReplaceAll, rfIgnoreCase])),
                       'shh', 'щ', [rfReplaceAll, rfIgnoreCase])),
                       'sh', 'ш', [rfReplaceAll, rfIgnoreCase])),
                       'ch', 'ч', [rfReplaceAll, rfIgnoreCase])),
                       'zh', 'ж', [rfReplaceAll, rfIgnoreCase])),
                       'jo', 'ё', [rfReplaceAll, rfIgnoreCase])),
                       '''', 'ь', [rfReplaceAll, rfIgnoreCase])),
                       'y', 'ы', [rfReplaceAll, rfIgnoreCase])),
                       '"', 'ъ', [rfReplaceAll, rfIgnoreCase])),
                       'h', 'х', [rfReplaceAll, rfIgnoreCase])),
                       'c', 'ц', [rfReplaceAll, rfIgnoreCase])),
                       'f', 'ф', [rfReplaceAll, rfIgnoreCase])),
                       'u', 'у', [rfReplaceAll, rfIgnoreCase])),
                       't', 'т', [rfReplaceAll, rfIgnoreCase])),
                       's', 'с', [rfReplaceAll, rfIgnoreCase])),
                       'r', 'р', [rfReplaceAll, rfIgnoreCase])),
                       'p', 'п', [rfReplaceAll, rfIgnoreCase])),
                       'o', 'о', [rfReplaceAll, rfIgnoreCase])),
                       'n', 'н', [rfReplaceAll, rfIgnoreCase])),
                       'm', 'м', [rfReplaceAll, rfIgnoreCase])),
                       'l', 'л', [rfReplaceAll, rfIgnoreCase])),
                       'k', 'к', [rfReplaceAll, rfIgnoreCase])),
                       'j', 'й', [rfReplaceAll, rfIgnoreCase])),
                       'i', 'и', [rfReplaceAll, rfIgnoreCase])),
                       'z', 'з', [rfReplaceAll, rfIgnoreCase])),
                       'd', 'д', [rfReplaceAll, rfIgnoreCase])),
                       'g', 'г', [rfReplaceAll, rfIgnoreCase])),
                       'v', 'в', [rfReplaceAll, rfIgnoreCase])),
                       'b', 'б', [rfReplaceAll, rfIgnoreCase])),
                       'a', 'а', [rfReplaceAll, rfIgnoreCase]);

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
  // Получим главное окно
  hMainWindow := GetMainWindow(hWindow);
  // Узнаем какое окно сейчас наверху
  hFGW := GetForegroundWindow;
  // Если не наше - будем поднимать
  if (hMainWindow <> hFGW) then begin
  // Отключим моргание вместо подъема окна
    SystemParametersInfo(SPI_GETFOREGROUNDLOCKTIMEOUT, 0, @dwTimeout, 0);
    SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, nil, 0);
    try
    // Попробуем разными способами поднять окно
    SendMessage(GetDesktopWindow(), WM_SYSCOMMAND, SC_HOTKEY, hMainWindow);
    SwitchToThisWindow(hMainWindow, True);
    SetForegroundWindow(hMainWindow);
    // Для MDI окон
    if (hWindow <> hMainWindow) then begin
      // Найдем MDI Client
      hMDIClient := FindWindowEx(hMainWindow, 0, "MDIClient", "");
      // Пошлем ему сообщение WM_MDIACTIVATE
      SendMessage(hMDIClient, WM_MDIACTIVATE, hWindow, 0);
    end;
    finally
      // Восстановим моргание
      SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, @dwTimeout, 0);
    end;
  end;
end; }

// получение временного каталога
function GetTempDirectory: String;
var
  tempFolder: array[0..MAX_PATH] of Char;
  v_tmp : AnsiString;
begin
  // альтернативно можно использовать GetEnvironmentVariable('TEMP')
  v_tmp:=GetEnvironmentVariable('USERPROFILE'); // +'\AppData\Local\Temp'
  if DirectoryExists(v_tmp) then
  begin
    GetTempDirectory:=v_tmp;
  end else begin  // /windows/temp
    GetTempPath(MAX_PATH, @tempFolder);
    GetTempDirectory:= StrPas(tempFolder);
  end;
end;

// процедура центровки формы на текущем активном мониторе
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
      // текущая позиция
      v_pnt:=Mouse.CursorPos;
      // по позиции определяем монитор
      v_act_monitor := Screen.MonitorFromPoint(v_pnt);
      // устанавливаем boundsrect формы
//      p_Form.BoundsRect := v_act_monitor.BoundsRect;
      p_Form.BoundsRect := v_act_monitor.WorkareaRect;
      p_Form.Refresh;
    end;
    p_is_move:=False;
  end;
end;

Procedure ScanDir(StartDir: String; Mask:string; List:TStrings);
{ Процедура выводит список директории в список List, начиная с директории,
указанной в StartDir. Mask - маска для получения файлов
}
Var SearchRec : TSearchRec;
Begin
 IF Mask ='' then Mask:= '*.*';
 IF StartDir[Length(StartDir)] <> '\' then StartDir := StartDir + '\';
  IF FindFirst(StartDir+Mask, faAnyFile, SearchRec) = 0 then
   Begin
    Repeat
       { Чтобы выполнение "не подвисало" }
     Application.ProcessMessages;
     IF (SearchRec.Attr and faDirectory) <> faDirectory then
        List.Add(StartDir + SearchRec.Name) else
         IF (SearchRec.Name <> '..') and (SearchRec.Name <> '.') then
       Begin
       //  List.Add(StartDir + SearchRec.Name + '\');
           { Рекурсивный вызов }
         ScanDir(StartDir + SearchRec.Name + '\',Mask,List);
       End;
    Until FindNext(SearchRec) <> 0;
    FindClose(SearchRec);
  End; {IF}
end;

// функция правильного отображения пола пациента
function gt_sex ( p_sex : string ) : string;
var v_res : string;
begin
  v_res := Copy(Trim(p_sex),1,1);
  if v_res = 'F' then
  begin
    v_res:= 'Ж';
  end else
  if v_res = 'f' then
  begin
    v_res:= 'Ж';
  end else
  if v_res = 'M' then
  begin
    v_res:= 'М';
  end else
  if v_res = 'm' then
  begin
    v_res:= 'М';

  end else
  if v_res = 'м' then
  begin
    v_res:= 'М';
  end else
  if v_res = 'М' then
  begin
    v_res:= 'М';
  end else
  if v_res = 'ж' then
  begin
    v_res:= 'Ж';
  end else
  if v_res = 'Ж' then
  begin
    v_res:= 'Ж';
  end else
  begin
    v_res:= '';
  end;
  Result := v_res;
end;

// функция возвращающая произвольную строку
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

// функция возвращающая уникальную строку
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
