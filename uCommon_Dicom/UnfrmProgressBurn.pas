unit UnfrmProgressBurn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, cxMemo, cxProgressBar, cxLabel,
  cxControls, cxContainer, cxEdit, cxGroupBox, mbDrvLib, mbCDBC, Menus, 
  ActnList, StdCtrls, cxButtons, ExtCtrls, IniFiles, DateUtils, CmnUnit, dxBar,
  dxBarExtItems, cxClasses, cxGraphics, cxMaskEdit, cxDropDownEdit, cxPC,
  ShellApi, dxSkinsCore, Medotrade, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  dxSkinBlack, dxSkinOffice2007Green, ImgList, dxSkinOffice2007Black, cxSplitter;

type
  TfrmProgressBurn = class(TForm)
    pbProg: TcxProgressBar;
    cxLabel10: TcxLabel;
    pbBuf: TcxProgressBar;
    memLog: TcxMemo;                         
    pbHBuf: TcxProgressBar;
    mcdb: TMCDBurner;
    Timer1: TTimer;
    lDrive: TcxLabel;
    cxLabel9: TcxLabel;
    lDisk: TcxLabel;
    pbSize: TcxProgressBar;
    ActionList1: TActionList;
    aRecord: TAction;
    aExit: TAction;
    aBreak: TAction;
    dxBarManager1: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    dxBarManager1Bar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    cxGroupBox1: TcxGroupBox;
    cbSpeed: TcxComboBox;
    cbDrives: TcxComboBox;
    cxPageControl1: TcxPageControl;
    tsFlash: TcxTabSheet;
    tsCD: TcxTabSheet;
    cxLabel1: TcxLabel;
    cbFlashDisks: TcxComboBox;
    lbUSBTxt: TcxLabel;
    cxProgressBar1: TcxProgressBar;
    dxBarLargeButton4: TdxBarLargeButton;
    aBurnISO: TAction;
    od: TOpenDialog;
    cxButton1: TcxButton;
    aFlashRefresh: TAction;
    ImageList1: TImageList;
    aSaveLog: TAction;
    gbSavLog: TcxGroupBox;
    cxSplitter2: TcxSplitter;
    cxLabel2: TcxLabel;
    teLogFileName: TcxTextEdit;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    aClrLog: TAction;
    lFreeFlushDisk: TcxLabel;
    tsFolder: TcxTabSheet;
    cxLabel3: TcxLabel;
    teDirPath: TcxTextEdit;
    cxButton4: TcxButton;
    aCheckFolder: TAction;
    imgBrnProcess: TImage;
    Timer2: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mcdbAddFile(Sender: TObject; const FullPath: string;
      var LongFileName, ShortFileName: string; var DateTime: TDateTime;
      Attr: Integer; FileSize: Int64; var Skip: Boolean);
    procedure mcdbDebugMessage(Sender: TObject; Message: string; mType: Byte);
    procedure mcdbEraseDone(Sender: TObject; WithError: Boolean);
    procedure mcdbFinalizingTrack(Sender: TObject);
    procedure mcdbWriteDone(Sender: TObject; Error: string);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aRecordExecute(Sender: TObject);
    procedure aExitExecute(Sender: TObject);
    procedure aBreakExecute(Sender: TObject);
    procedure cxComboBox1PropertiesInitPopup(Sender: TObject);
    procedure cbDrivesPropertiesChange(Sender: TObject);
    procedure tsCDShow(Sender: TObject);
    procedure tsFlashShow(Sender: TObject);
    procedure cbFlashDisksPropertiesChange(Sender: TObject);
    procedure aBurnISOExecute(Sender: TObject);
    procedure aFlashRefreshExecute(Sender: TObject);
    procedure aSaveLogExecute(Sender: TObject);
    procedure cxSplitter2BeforeClose(Sender: TObject; var AllowClose: Boolean);
    procedure cxSplitter2BeforeOpen(Sender: TObject; var NewSize: Integer;
      var AllowOpen: Boolean);
    procedure aClrLogExecute(Sender: TObject);
    procedure aCheckFolderExecute(Sender: TObject);
    procedure tsFolderShow(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    bISO : Boolean;
    FreeSize : Double;
    procedure pSetButtonsState(pIsRun:Boolean);
    procedure pSetButtonsEnabled(pIsEnabled : boolean);
  public
    v_CancelClick, vEraseDone, vBurnDone ,
    oArchiveFiles, oImportSession,
    ccEject, ccShowFiles, ccImportSession: Boolean;
    vISOFileName ,
    vAddDirFlash,
    vIshDir ,
    vsCDDate,
    vDirTmp : string;
    vSizeToWrite : Int64;
    vDiskList : TStringList;
    vIsWriteDisk : Boolean;
    procedure pFlashProperties;
    function fCopyDir(pFrom,pTo:PChar):Boolean;
    function CDFreeSize : Boolean;
    procedure FlashRefresh;
    function pPrepareDir ( pDir : string ) : string;
    function FullRemoveDir(Dir: string; DeleteAllFilesAndFolders,
      StopIfNotAllDeleted, RemoveRoot: boolean): Boolean;
  end;

const cWaitDelay = 80;
      MaxFiles = 600000;
      MaxDirs = 20000;

var
  frmProgressBurn: TfrmProgressBurn;
  SessionToImport: ShortInt;
  QuickSaveISO: Boolean = false;

implementation

Uses ShlObj;

{$R *.dfm}

procedure TfrmProgressBurn.pSetButtonsEnabled( pIsEnabled : boolean);
begin
  aBurnISO.Enabled := pIsEnabled;
  aRecord.Enabled := pIsEnabled;
  aBreak.Enabled := not pIsEnabled;
  aExit.Enabled := pIsEnabled;
end;

procedure TfrmProgressBurn.pSetButtonsState(pIsRun:Boolean);
begin
  aBurnISO.Enabled := not pIsRun;
  aRecord.Enabled := not pIsRun;
  aBreak.Enabled := pIsRun;
  aExit.Enabled := not pIsRun;
end;

function GetDiskSize(drive: Char; var free_size, total_size: Int64): Boolean;
var
 RootPath: array[0..4] of Char;
 RootPtr: PChar;
 current_dir: string;
begin
  RootPath[0] := Drive;
  RootPath[1] := ':';
  RootPath[2] := '\';
  RootPath[3] := #0;
  RootPtr := RootPath;
  current_dir := GetCurrentDir;
  if SetCurrentDir(drive + ':\') then
  begin
    GetDiskFreeSpaceEx(RootPtr, Free_size, Total_size, nil);
    frmProgressBurn.lFreeFlushDisk.Caption := 'Свободно - '+
               FormatFloat( '#,##0.00', (Free_size/1024)/1024 ) + ' MB ' ;
    // this to turn back to original dir
    SetCurrentDir(current_dir);
    Result := True;
  end
  else
  begin
    Result := False;
    Free_size  := -1;
    Total_size := -1;
  end;
end;

function TfrmProgressBurn.pPrepareDir ( pDir : string ) : string;
begin
  Result := StringReplace( pDir,'\\','\',[rfReplaceAll, rfIgnoreCase]);
end;

function TfrmProgressBurn.CDFreeSize : Boolean;
var vTotalBlocksOnDisc, vUsedBlocksOnDisc : Extended;
begin
  try
    FreeSize := (mcdb.FreeBlocksOnDisc*2048);
    vTotalBlocksOnDisc := frmProgressBurn.mcdb.TotalBlocksOnDisc*2048/1024 ;
    vUsedBlocksOnDisc  := (vSizeToWrite/1024)/1024; // Trunc(vSizeToWrite+frmProgressBurn.mcdb.UsedBlocksOnDisc*2048/1024);
    lDisk.Caption := 'Занято '+ FormatFloat( '#,##0.00', vUsedBlocksOnDisc )
                     +' MB из '+ FormatFloat( '#,##0.00', vTotalBlocksOnDisc ) + ' MB';
    pbSize.Properties.Min := 0;
    pbSize.Properties.Max := vTotalBlocksOnDisc;
    pbSize.Position       := vUsedBlocksOnDisc;

    Result := ( vUsedBlocksOnDisc < vTotalBlocksOnDisc ) ;
  except
    Result := False;
  end;
end;

function GetSpeed(Str: String; Medium: Byte): Word;
var
  Divider: Integer;
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

procedure TfrmProgressBurn.aBreakExecute(Sender: TObject);
begin
  if MessageDlg('Остановить процесс и выйти ?', mtConfirmation, [mbYes, mbNo], 0)=mrYes
  then
  begin
    v_CancelClick:=True;
    Timer1.Enabled := False;
    mcdb.Abort;
  //  mcdb.Initialize;
    aBreak.Enabled := False;
    ModalResult:=mrCancel;
  end;
end;

procedure TfrmProgressBurn.aBurnISOExecute(Sender: TObject);
//var FileName: String;
begin
  v_CancelClick:=False;
  mcdb.ISOFileName:='D'+DateTimeToStr(Date);
  od.FileName := mcdb.ISOFileName;
  if od.Execute then
 // if InputQuery('Создание ISO-образа','Введите имя .ISO файла для создания образа', FileName) then
  begin
    if pos('.iso',od.FileName)<=0 then od.FileName:=od.FileName+'.iso';
    mcdb.ISOFileName := od.FileName ;
    Timer1.Enabled := True;
  //  mcdb.ClearAll(MaxFiles, MaxDirs);
    // AddFilesToCD;
    if (mcdb.DirsCount = 0) and (mcdb.FilesCount = 0) then exit;
    mcdb.DebugMsg('>>> Добавление файлов и папок в *.ISO выполнено', 0);
    Application.ProcessMessages;
    mcdb.DebugMsg('>>> Создание ISO-образа '+od.FileName, 0);
    mcdb.Prepare(True);
    pbProg.Properties.Max := mcdb.ImageSize;
    bISO := True;
    try
      pSetButtonsState(True);
      mcdb.SaveToISOFile(od.FileName, QuickSaveISO);
    finally
      mcdb.DebugMsg('>>> Образ создан ...', 0);
    //  memLog.Lines.Append('Запись завершена ...');
    //  MessageDlg('Запись завершена ...', mtWarning, [mbOK], 0);
      pSetButtonsState(False);
    end;
  end;
end;

procedure TfrmProgressBurn.aCheckFolderExecute(Sender: TObject);
var
  TitleName : string;
  lpItemID : PItemIDList;
  BrowseInfo : TBrowseInfo;
  DisplayName : array[0..MAX_PATH] of char;
  TempPath : array[0..MAX_PATH] of char;
begin // выбор папки для записи исследований
  FillChar(BrowseInfo, sizeof(TBrowseInfo), #0);
  BrowseInfo.hwndOwner := frmProgressBurn.Handle;
  BrowseInfo.pszDisplayName := @DisplayName;
  TitleName := 'Please specify a directory';
  BrowseInfo.lpszTitle := PChar(TitleName);
  BrowseInfo.ulFlags := BIF_RETURNONLYFSDIRS;
  lpItemID := SHBrowseForFolder(BrowseInfo);
  if lpItemId <> nil then
  begin
    SHGetPathFromIDList(lpItemID, TempPath);
    // ShowMessage(TempPath);
    teDirPath.Text := TempPath;
    GlobalFreePtr(lpItemID);
  end;
end;

procedure TfrmProgressBurn.aClrLogExecute(Sender: TObject);
begin // Очистить лог
  memLog.Lines.Clear;
end;

procedure TfrmProgressBurn.aExitExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmProgressBurn.aFlashRefreshExecute(Sender: TObject);
begin
  FlashRefresh;
end;

function TfrmProgressBurn.fCopyDir(pFrom,pTo:PChar):Boolean;
var CF:TSHFileOpStruct;
  procedure pErrDetailStr ( pNmbStrErr, pErrMsg : string ) ;
  var vStrTmp, vStr : string;
      vFree, vTotal, vZan : Extended;
      free_size, total_size : Int64;
      vDiskStr : char ;
  begin
    vStr := vDiskList[cbFlashDisks.ItemIndex]; // cbFlashDisks.Text;
    vDiskStr := vStr[1];
  //  memLog.Clear;
    if GetDiskSize( vDiskStr, free_size, total_size) then
    begin
    //  vTotal := total_size/1024/1024;
    //  vZan   := (vSizeToWrite+(total_size-free_size))/1024/1024;
      vFree  := free_size/1024/1024;
      if GetLastError=0 then
      begin
        vStrTmp := pNmbStrErr+' '+
                   pErrMsg+' '+
                   ' ( свободно - '+
                   FormatFloat( '#,##0.00', vFree ) + ' MB )';
      end else
      begin
        vStrTmp := pNmbStrErr+' '+
                   pErrMsg+' '+
                   IntToStr(GetLastError)+' '+
                   SysUtils.SysErrorMessage(GetLastError) +
                   ' ( свободно - '+
                   FormatFloat( '#,##0.00', vFree ) + ' MB )';
      end;
      memLog.Lines.Append( vStrTmp );
    end;
  end;
  function __CopyFile(fSource, fDest: String): Longint;
  var F : TextFile; vFTmp:string;
    fsIn, fsOut: TFileStream;
  begin
    vFTmp := pPrepareDir(ExtractFilePath(fDest)+'\1.tmp') ;
    // проверка прав доступа
    try
      AssignFile( F, vFTmp );
    except on E: Exception do
      begin
        pErrDetailStr('#11 ERROR : ',E.Message );
        exit;
      end;
    end;
    try
      try
        Rewrite(F);
        Writeln(F,'1');
      except on E: Exception do
        begin
          pErrDetailStr('#12 ERROR : ',E.Message);
          exit;
        end;
      end;
    finally
      Flush(F);
      CloseFile(F);
      if FileExists(vFTmp) then
        memLog.Lines.Append( 'Testing ...' );
      DeleteFile(vFTmp);
    end;
    // размер файла

    //
    fsOut := TFileStream.Create(fDest, fmCreate);
    fsIn := TFileStream.Create(fSource, fmOpenRead);
    try
      try
        fsIn.Seek(0, soFromBeginning);
        Result := fsOut.CopyFrom(fsIn, 0);
      finally
        fsIn.Free;
        fsOut.Free;
      end;
    except on E: Exception do
      begin
        try
          if FileExists(fDest) then
            DeleteFile(fDest);
          Win32Check( windows.CopyFile( PChar(fSource), PChar(fDest), true ) );
          memLog.Lines.Append('Файл '+fSource+' скопирован в '+fDest);
        except on E: Exception do
          begin
          //  if not FileExists(fDest) then
              pErrDetailStr('#13 ERROR (file copy): ',E.Message );
          //  else
          //    memLog.Lines.Append('Файл '+fSource+' скопирован в '+fDest);
          end;
        end;
        fsIn.Free;
        fsOut.Free;
        Result := 0;
      end;
    end;
  end;
  function FileAttrToStr( pAttr:integer ): string;
  begin
    { Атрибуты искомого элемента это пользовательские или системные атрибуты,
      которые может иметь файл (каталог, метка диска).
      Вот их перечень:
      faReadOnly  - Файлы "только чтение". Такой атрибут устанавливается
                    на файлы, которые не рекомендовано изменять, удалять.
                    Такой атрибут имеют файлы, например, записанные на
                    компакт-дисках.
      faHidden    - Скрытые файлы. При обычных установках браузера и
                    командира эти файлы невидимы.
      faSysFile   - Системные файлы.
      faVolumeID  - Файл метки диска. Такой элемент в своем имени имеет
                    название диска (максимум 11 символов).
      faDirectory - Атрибут признака каталога.
      faArchive   - Обычный файл. По умолчанию устанавливается на заново
                    создаваемых файлах.
      faAnyFile   - Если установить в качестве атрибута искомых элементов,
                    то будет произведен поиск по всем вышесказанным атрибутам.
    }
    case pAttr of
    faReadOnly  : Result:='faReadOnly';  // $00000001 platform;
    faHidden    : Result:='faHidden';    //  $00000002 platform;
    faSysFile   : Result:='faSysFile';   //  $00000004 platform;
    faVolumeID  : Result:='faVolumeID';  //  $00000008 platform deprecated;  // not used in Win32
    faDirectory : Result:='faDirectory'; //  $00000010;
    faArchive   : Result:='faArchive';   //  $00000020 platform;
    faSymLink   : Result:='faSymLink';   //  $00000040 platform;
    faAnyFile   : Result:='faAnyFile';   // = $0000003F;
    else
      Result:='Other='+IntToStr(pAttr); //
    end;
  end;
  function __CopyFolder(SourceDir, TargetDir: string): integer;
  var sr : TSearchRec;
      i : integer;
      F: TFileStream;
      Size: Extended;
  begin
    Result := 1;
    try
      SourceDir := IncludeTrailingPathDelimiter(SourceDir);
      TargetDir := IncludeTrailingPathDelimiter(TargetDir);
      if not SysUtils.DirectoryExists(SourceDir) then
        Exit;
      if not SysUtils.ForceDirectories(TargetDir) then
        SysUtils.ForceDirectories(TargetDir);
      i := FindFirst(SourceDir + '*', faAnyFile, sr);
      try
        while i = 0 do
        begin
          if not ( ((SR.Attr and faDirectory) = faDirectory) and
                   ( (sr.Name = '') or
                     (sr.Name = '.') or
                     (sr.Name = '..') )  )
          then
          begin
            memLog.Lines.Append( 'Копируется '+SourceDir + SR.Name+
                                 ' в '+TargetDir + SR.Name+
                                 ' SR.Attr='+FileAttrToStr(SR.Attr)+
                                 ' SR.Size='+IntToStr(SR.Size) );
            if ((SR.Attr and faDirectory) = faDirectory) then
              try
                __CopyFolder(SourceDir + SR.Name, TargetDir + SR.NAME);
                memLog.Lines.Append( 'Каталог '+SourceDir + SR.Name+
                                     ' скопирован в '+TargetDir + SR.NAME);
              except on E: Exception do pErrDetailStr('#14 ERROR (dir create): ',E.Message );
              end
            else
              try
                F:=TFileStream.Create(SourceDir + SR.Name, fmOpenRead);
                try
                  Size:=(F.Size/1024)/1024;
                finally
                  F.Free;
                end;
                __CopyFile(Pchar(SourceDir + SR.Name), Pchar(TargetDir + SR.Name));
                memLog.Lines.Append( '# Файл '+SourceDir + SR.Name+' ( '+
                                     FormatFloat( '#,##0.00', Size )+
                                     'MB ) скопирован в '+TargetDir + SR.NAME);
              except on E: Exception do
                begin
                  if not FileExists( TargetDir + SR.NAME ) then
                  begin
                    pErrDetailStr( '#15 ERROR (file create) - Файл '+SourceDir + SR.Name+
                                   ' попытка записи в '+TargetDir + SR.NAME+
                                   ' ( размер файла '+FormatFloat( '#,##0.00', Size )+'MB ) ( '+
                                   'SR.Attr='+FileAttrToStr(SR.Attr)+' ) '+
                                   ' : ',E.Message );
                  end;
                end;
              end
          end;
          i := FindNext(SR);
        end;
      finally
        SysUtils.FindClose(SR);
      end;
      Result := 0;
    except on E: Exception do
      begin
        Result := 2 ;
        pErrDetailStr('#16 ERROR : ',E.Message );
      end;
    end;
  end;
var vRes : Integer; vDD, vDirTmpCrt : string; vLastError : Cardinal;
begin
 { try
    CF.Wnd:=0;
    CF.pFrom:=pFrom;//откуда копируем файлы для вас будет ваша папка
    CF.pTo:=pTo;//куда копируем если такого каталога нет то будет предложено его создать
    CF.wFunc:=FO_COPY;//задаём флаг копирования
    // так, что бы при копировании эти файлы заменяли собой более старые
    // CF.fFlags:=FOF_NOCONFIRMATION;
    CF.fFlags:=FOF_ALLOWUNDO;//пусть будет этот флаг
    Result := ( ShFileOperation(CF) = 0 );
  except  }
    vDD:=GetCurrentDir;
    try
     // SetCurrentDir(vDiskList[cbFlashDisks.ItemIndex]);
      if cxPageControl1.ActivePage=tsFolder then
      begin
        vDirTmpCrt := pPrepareDir( pTo );
        if not DirectoryExists(vDirTmpCrt) then
        begin
          if not ForceDirectories(vDirTmpCrt)
          then pErrDetailStr('Добавление нового каталога вызвало ошибку : ','')
          else
            memLog.Lines.Append('Добавление нового каталога '+vDirTmpCrt);
        end;
        vRes := __CopyFolder( pFrom, pTo );
        Result := True;
      end else if cxPageControl1.ActivePage=tsFlash then
      begin
        vDirTmpCrt := pPrepareDir( vDiskList[cbFlashDisks.ItemIndex]+'\'+vAddDirFlash);
        if not DirectoryExists(vDirTmpCrt) then
        begin
          if not ForceDirectories(vDirTmpCrt)
          then pErrDetailStr('Добавление нового каталога вызвало ошибку : ','')
          else
            memLog.Lines.Append('Добавление нового каталога '+vDirTmpCrt);
        end;
        vRes := __CopyFolder( pFrom, pTo );
        memLog.Lines.Append('Копируется '+ pPrepareDir( ExtractFileDir(Application.ExeName)+'\DicomViewer.exe')+
                    ' в '+pPrepareDir( pTo + '\DicomViewer.exe') );
        __CopyFile( Pchar(pPrepareDir( ExtractFileDir(Application.ExeName)+'\DicomViewer.exe') ),
                    Pchar(pPrepareDir( vDiskList[cbFlashDisks.ItemIndex] + '\DicomViewer.exe') ));   //  pTo
        Result := True;
      end;
    finally
      SetCurrentDir(vDD);
    end;
 // end;
end;

procedure TfrmProgressBurn.aRecordExecute(Sender: TObject);
var a,b: Cardinal;
  str, vDirTmp: String;
  Speed: Word;
  vT : TDateTime;
  CF:TSHFileOpStruct;
procedure ShowProcess ( pIsShow:Boolean );
begin
  imgBrnProcess.Visible:=pIsShow;
  Timer2.Enabled:=pIsShow;
end;  
label l1;
begin
  try
    pSetButtonsState(True);
    if cxPageControl1.ActivePage=tsFolder then
    begin
      if DirectoryExists(teDirPath.Text) then
      begin
        if fCopyDir( PChar(vIshDir), PChar( teDirPath.Text ) )
        then
        begin
          memLog.Lines.Append('Выполнение операции копирования завершено ...');
        //  MessageDlg('Запись завершена ...', mtWarning, [mbOK], 0);
        end;
      end else
        MessageDlg('Не выбран каталог для записи ...', mtWarning, [mbOK], 0)
    end else if cxPageControl1.ActivePage=tsFlash then
    begin
      if cbFlashDisks.ItemIndex>=0 then
      begin
        if fCopyDir( PChar(vIshDir), PChar( pPrepareDir(vDiskList[cbFlashDisks.ItemIndex]+'\'+vsCDDate) ) )
        then
        begin
          memLog.Lines.Append('Выполнение операции копирования завершено ...');
        //  MessageDlg('Запись завершена ...', mtWarning, [mbOK], 0);
        end;
      end else
        MessageDlg('Не выбран диск ...', mtWarning, [mbOK], 0)
    end else begin
      // проверка на доступное место на диске
      if not CDFreeSize then Exit;
      //
      if (mcdb.DiscType in [mtCD_RW, mtDVD_RW, mtDVD_RW_RO, mtDVD_RW_SR, mtDVD_PLUSRW, mtDDCD_RW]) then
      if Application.MessageBox('Все данные на диске будут потеряны', 'Очистить диск ?', MB_DEFBUTTON2+MB_ICONWARNING+MB_YESNO) = ID_YES then
      begin
        if not (mcdb.Erasable) then // and (mcdb.DiscType <> mtDVD_RAM) then
          ShowMessage('Disc is not Erasable')
        else
        begin
          Timer1.Enabled := True; v_CancelClick:=False;
          str := cbSpeed.Properties.Items[cbSpeed.ItemIndex];
          Speed := GetSpeed(str, mcdb.DiscType);
          mcdb.WriteSpeed := speed;
          //
          vEraseDone:=False; vT:=Now;
          //
          cxLabel9.Caption := 'Очистка диска :';
          Application.ProcessMessages;
          ShowProcess(True);
          try
            mcdb.EraseDisc(etQuick);
            //
            while ((not vEraseDone) or (MinutesBetween(vT,Now)>cWaitDelay))
            do begin
              Application.ProcessMessages;
              Sleep(1000);
            end;
          finally
            ShowProcess(False);
          end;
          if v_CancelClick then goto l1;
        end;
      end;
      Application.ProcessMessages;
      if not FileExists(vISOFileName) then
      begin
        cxLabel9.Caption := 'Создание образа диска :';
        Application.ProcessMessages;
      //  mcdb.ClearAll(MaxFiles, MaxDirs);
        //AddFilesToCD;
        if (mcdb.DirsCount = 0) and (mcdb.FilesCount = 0) then exit;
        ShowProcess(True);
        try
          mcdb.DebugMsg('>>> ADD FILES/DIRS TO .ISO DONE.', 0);
          Application.ProcessMessages;
          mcdb.DebugMsg('>>> START BUILDING .ISO FILE', 0);
          mcdb.Prepare(True);
          pbProg.Properties.Max := mcdb.ImageSize;
          // lSize.Caption := FormatFloat('#,##0.00', mcdb.ImageSize * 2048 / (1024 * 1024))+' MB';
          vBurnDone:=False; vT:=Now;
          mcdb.SaveToISOFile( vISOFileName, False );
          Sleep(1000);
          mcdb.FlushCache;
          Sleep(1000);
        finally
          ShowProcess(False);
        end;
      end;
      if v_CancelClick then goto l1;
      cxLabel9.Caption := 'Запись диска :';
      Application.ProcessMessages;
      vBurnDone:=False; vT:=Now;
      mcdb.ReadBufferCapacity(a, b);
      mcdb.ParentDirectoryOnly := True;
      pbHBuf.Properties.Max := a;
      mcdb.WriteSpeed := GetSpeed(cbSpeed.Properties.Items[cbSpeed.ItemIndex], mcdb.DiscType);
      Timer1.Enabled := True;
      vIsWriteDisk:=True;
      ShowProcess(True);
      try
        mcdb.BurnISOImage(vISOFileName);
        while ((not vBurnDone) or (MinutesBetween(vT,Now)>cWaitDelay))
        do begin
          Application.ProcessMessages;
          Sleep(500);
        end;
      finally
        Timer1.Enabled := False;
        ShowProcess(False);
        imgBrnProcess.Visible:=False;
      end;
l1:   cxLabel9.Caption := 'Прогресс :';
      Application.ProcessMessages;
      mcdb.FlushCache;
    {  Application.ProcessMessages;
      Sleep(1000);
    //  mcdb.LockMedium(True);
      if mcdb.LoadMedium(True) then
        mcdb.DebugMsg('>>> EJECT MEDIUM COMMAND DONE.', 0)
      else
        mcdb.DebugMsg('>>> EJECT MEDIUM COMMAND FAILED.', 0);
      }
      Application.ProcessMessages;
      Sleep(1000);
    {
        mcdb.ReadBufferCapacity(a, b);
        pbHBuf.Properties.Max := a;
        bRecordAll.Enabled := False;
        Timer1.Enabled := True;
        mcdb.DebugMsg('>>> STARTING BURN .ISO IMAGE ON '+mcdb.Device, 0);
        timer1.Enabled := True;
        mcdb.WriteSpeed := GetSpeed(cbSpeed.Items[cbSpeed.ItemIndex], mcdb.DiscType);
        mcdb.BurnISOImage(od.FileName);
    }  //  pcd.Max := mcdb.ImageSize;


    end;
  finally
    pSetButtonsState(False);
  end;
end;

procedure TfrmProgressBurn.cbDrivesPropertiesChange(Sender: TObject);
var
  Letter: Char;
begin
  mcdb.Device := cbDrives.Text;
  cbDrives.Hint := cbDrives.Text;
  Letter := mcdb.DeviceByDriveLetter;
  if Letter = #0 then
    lDrive.Caption := '  Drive :'
  else
    lDrive.Caption := 'Drive '+Letter+':';
  CDFreeSize;
  if (dcWriteCDR in mcdb.DeviceCapabilities) or
     (dcWriteDVDR in mcdb.DeviceCapabilities) or
     (dcWriteDVDRAM in mcdb.DeviceCapabilities)
  then
  begin
  {  if not CDFreeSize then
      aRecord.Enabled := False
    else }
      aRecord.Enabled := True;
  end else begin
    lDisk.Caption := 'Диск не для записи. Вставьте другой диск.';
    aRecord.Enabled := False;
  end;
end;

procedure TfrmProgressBurn.pFlashProperties;
var free_size, total_size, vSzTmp : Int64;
    vDiskStr : Char; vStr : string[1];
    vFree, vTotal, vZan : Extended;
begin
  vStr := vDiskList[cbFlashDisks.ItemIndex]; // cbFlashDisks.Text;
  vDiskStr := vStr[1];
//  memLog.Clear;
  if GetDiskSize( vDiskStr, free_size, total_size) then
  begin
    vTotal := total_size/1024/1024;
    vZan   := (vSizeToWrite+(total_size-free_size))/1024/1024;
    vFree  := free_size/1024/1024;
    lbUSBTxt.Caption := 'Будет занято '+ FormatFloat( '#,##0.00', vZan ) +
                        ' MB из '+FormatFloat( '#,##0.00', vTotal )+' MB ';
    cxProgressBar1.Visible:=True;
    cxProgressBar1.Properties.Min:=0;
    cxProgressBar1.Properties.Max:=vTotal;
    cxProgressBar1.Position := vZan ;
    if (vZan<vTotal) then
    begin
      aRecord.Visible:=True;
      aRecord.Enabled := True;
      dxBarLargeButton1.Visible:= ivAlways ;
    end else begin
      aRecord.Visible:=False;
      dxBarLargeButton1.Visible:= ivNever ;
    end;
  end else
  begin
    aRecord.Visible:=False;
    aBreak.Visible:=False;
    lbUSBTxt.Caption := 'Нет диска ...';
    cxProgressBar1.Visible:=False;
  end;
end;

procedure TfrmProgressBurn.cbFlashDisksPropertiesChange(Sender: TObject);
begin
  try
    pFlashProperties;
  except
  end;
end;

procedure TfrmProgressBurn.cxComboBox1PropertiesInitPopup(Sender: TObject);
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

procedure TfrmProgressBurn.cxSplitter2BeforeClose(Sender: TObject;
  var AllowClose: Boolean);
begin
  if not gbSavLog.Visible then
  begin
    gbSavLog.Visible := True;
  end else
    gbSavLog.Visible := False;
end;

procedure TfrmProgressBurn.cxSplitter2BeforeOpen(Sender: TObject;
  var NewSize: Integer; var AllowOpen: Boolean);
begin
  if gbSavLog.Visible then
  begin
    gbSavLog.Visible := False;
  end else
    gbSavLog.Visible := True;
end;

function GetMyVersion:string;
type
  TVerInfo=packed record
    Nevazhno: array[0..47] of byte; // ненужные нам 48 байт
    Minor,Major,Build,Release: word; // а тут версия
  end;
var
  s:TResourceStream;
  v:TVerInfo;
begin
  result:='';
  try
    s:=TResourceStream.Create(HInstance,'#1',RT_VERSION); // достаём ресурс
    if s.Size>0 then begin
      s.Read(v,SizeOf(v)); // читаем нужные нам байты
      result:=IntToStr(v.Major)+'.'+IntToStr(v.Minor)+'.'+ // вот и версия...
              IntToStr(v.Release)+'.'+IntToStr(v.Build);
    end;
  s.Free;
  except; end;
end;

procedure TfrmProgressBurn.FormCreate(Sender: TObject);
begin
  imgBrnProcess.Visible:=False;
  Timer2.Enabled:=False;
  vIsWriteDisk:=False;
  teLogFileName.Text:='c:\dicomLogWrite.log';
  gbSavLog.Visible := False;
  vDiskList := TStringList.Create;
  cxPageControl1.ActivePage := tsFlash;
  vISOFileName := GetTempDirectory+'\Dicom\'+
                  inttostr( YearOf(Date)  )+
                  inttostr( MonthOf(Date) )+
                  inttostr( DayOf(Date)   )+
                  inttostr( HourOf(Now)   )+
                  inttostr( GetTickCount )+'.iso';
  if not DirectoryExists(GetTempDirectory+'\Dicom') then CreateDir(GetTempDirectory+'\Dicom');
  memLog.Lines.Append('Программа DicomCD');
  memLog.Lines.Append('Copyright '+#169+' 2003 - '+inttostr(Yearof(Date))+' Medotrade');
  memLog.Lines.Append('Версия '+GetMyVersion);
  memLog.Lines.Append('Temporary folder : '+GetTempDirectory+'\Dicom');
  aBreak.Enabled := False;
end;

{ Удаление непустого каталога вместе с подкаталогами
Удаление подкаталогов рекурсивное - функция вызывает саму себя.
Описание назначения агрументов:
-DeleteAllFilesAndFolder - если TRUE то функцией будут предприняты
попытки для установки атрибута faArchive любому файлу или папке
перед его(её) удалением;
-StopIfNotAllDeleted - если TRUE то работа функции моментально
прекращается если возникла ошибка удаления хотя бы одного файла или папки;
-RemoveRoot - если TRUE, указывает на необходимость удаления корня.
Зависимости: FileCtrl, SysUtils
***************************************************** }
function TfrmProgressBurn.FullRemoveDir(Dir: string; DeleteAllFilesAndFolders,
  StopIfNotAllDeleted, RemoveRoot: boolean): Boolean;
var
  i: Integer;
  SRec: TSearchRec;
  FN: string;
begin
  Result := False;
  if not DirectoryExists(Dir) then
    exit;
  Result := True;
  // Добавляем слэш в конце и задаем маску - "все файлы и директории"
  Dir := IncludeTrailingBackslash(Dir);
  i := FindFirst(Dir + '*', faAnyFile, SRec);
  try
    while i = 0 do
    begin
      // Получаем полный путь к файлу или директорию
      FN := Dir + SRec.Name;
      // Если это директория
      if SRec.Attr = faDirectory then
      begin
        // Рекурсивный вызов этой же функции с ключом удаления корня
        if (SRec.Name <> '') and (SRec.Name <> '.') and (SRec.Name <> '..') then
        begin
          if DeleteAllFilesAndFolders then
            FileSetAttr(FN, faArchive);
          Result := FullRemoveDir(FN, DeleteAllFilesAndFolders,
            StopIfNotAllDeleted, True);
          if not Result and StopIfNotAllDeleted then
            exit;
        end;
      end
      else // Иначе удаляем файл
      begin
        if DeleteAllFilesAndFolders then
          FileSetAttr(FN, faArchive);
        Result := SysUtils.DeleteFile(FN);
        if not Result and StopIfNotAllDeleted then
          exit;
      end;
      // Берем следующий файл или директорию
      i := FindNext(SRec);
    end;
  finally
    SysUtils.FindClose(SRec);
  end;
  if not Result then
    exit;
  if RemoveRoot then // Если необходимо удалить корень - удаляем
    if not RemoveDir(Dir) then
      Result := false;
end;

procedure TfrmProgressBurn.FormDestroy(Sender: TObject);
begin
  vDiskList.Free;
  if FileExists( vISOFileName ) then DeleteFile( vISOFileName );
  SetCurrentDir( ExtractFileDir(Application.ExeName) );
  FullRemoveDir(vIshDir, true, true, true);
end;

procedure TfrmProgressBurn.FormShow(Sender: TObject);
var
  i: integer;
  State: String;
  ini: TIniFile;
begin
 // mcdb.DebugMsg('>>> '+Caption, 0);
  try
    mcdb.InitializeASPI(True);
  except
    MessageDlg('Нет диска ...', mtWarning, [mbOK], 0);
    Exit;
  end;

  if not mcdb.ASPIInitialized then
  begin
    ShowMessage('Error initializing ASPI Layer.');
    exit;
  end;
  if (mcdb.Devices <> nil) and (mcdb.Devices.Count > 0) then
  begin
    cbDrives.Properties.Items.Assign(mcdb.Devices);
    cbDrives.ItemIndex := 0;
    cbDrivesPropertiesChange(Sender);
    cxComboBox1PropertiesInitPopup(Sender); 
  end;
  try
    //cbSpeedDropDown(Sender);
    ini := TIniFile.Create('MCDB.ini');
    oArchiveFiles := False; // ini.ReadBool('Options', 'ArchiveFiles', oArchiveFiles);
    oImportSession := False; // ini.ReadBool('Options', 'ImportSession', oImportSession);
    // State := Unchecked;  // ini.ReadString('Options', 'SavePath', '');
    //
    mcdb.FinalizeDisc := False; // ini.ReadBool('Options', 'CloseDisc', mcdb.FinalizeDisc);
    mcdb.JolietFileSystem := True; // ini.ReadBool('Options', 'JolietFS', mcdb.JolietFileSystem);
    mcdb.TestWrite := False; // ini.ReadBool('Options', 'TestWrite', mcdb.TestWrite);
    mcdb.PerformOPC := True;  // ini.ReadBool('Options', 'PerformOPC', mcdb.PerformOPC);
    //
    SessionToImport := 0;
    ccEject := False;  // ini.ReadBool('Options', 'EjectDisc', False);
    ccShowFiles := False; // ini.ReadBool('Options', 'ShowFiles', False);
    ccImportSession := False; // ini.ReadBool('Options', 'ImportSession', False);

    mcdb.BootImage := ''; // ini.ReadString('Options', 'BootImage', mcdb.BootImage);
    mcdb.Bootable := False; // ini.ReadBool('Options', 'Bootable', mcdb.Bootable);
    mcdb.IdVolume := ''; // ini.ReadString('Options', 'VolumeLable', mcdb.IdVolume);
    // mcdb.CacheSize := 8392704; // ini.ReadInteger('Options', 'CacheSize', mcdb.CacheSize);
    ini.Free;

    mcdb.DebugMsg(' ', 0);
    mcdb.LockDrive;
  except
    MessageDlg('Нет диска ...', mtWarning, [mbOK], 0);
    Exit;
  end;
end;

procedure TfrmProgressBurn.mcdbAddFile(Sender: TObject; const FullPath: string;
  var LongFileName, ShortFileName: String; var DateTime: TDateTime;
  Attr: Integer; FileSize: Int64; var Skip: Boolean);
var
  fs: TFileStream;
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
      mcdb.DebugMsg('>>> SKIPING; FILE IS IN USE '+ FullPath, 0);
      Skip := True
    end;
  end;
  if Length(LongFileName) > 107 then
  begin
    mcdb.DebugMsg('>>> SKIPING; FILE NAME LENGTH > 107 '+ FullPath, 0);
    Skip := True;
  end;
 { if not Skip then
  begin
    lSize.Caption := FormatFloat('#,##0.00', (mcdb.FilesSize) / (1024 * 1024))+' MB';
  end;  }
end;

procedure TfrmProgressBurn.mcdbDebugMessage(Sender: TObject; Message: string;
  mType: Byte);
begin
  memLog.Lines.Add(Message);
end;

procedure TfrmProgressBurn.mcdbEraseDone(Sender: TObject; WithError: Boolean);
begin
  if WithError then
    mcdb.DebugMsg('>>> ERASE PROCESS DONE WITH ERROR', 0)
  else
  begin
    mcdb.DebugMsg('>>> ERASE PROCESS DONE', 0);
    memLog.Lines.Append('Выполнение операции очистки завершено ...');
//    MessageDlg('Очистка завершена ...', mtWarning, [mbOK], 0);
  end;
  Timer1.Enabled := False;
  if (not WithError) and (ccEject) then
    mcdb.LoadMedium(True);
  pbProg.Position := 0;
  MessageBeep(MB_OK);
  mcdb.DebugMsg(' ', 0);
  vEraseDone := True;
end;

procedure TfrmProgressBurn.mcdbFinalizingTrack(Sender: TObject);
begin
  mcdb.DebugMsg('>>> FINALIZING TRACK', 0);
end;

procedure TfrmProgressBurn.mcdbWriteDone(Sender: TObject; Error: string);
begin
  Timer1.Enabled := False;
  Timer1Timer(Sender);
  if Error <> '' then
  begin
    mcdb.DebugMsg('>>> WRITE/BURNCD PROCESS DONE WITH ERROR', 0);
    mcdb.DebugMsg('>>> '+Error, 0);
  end
  else
  begin
    if vIsWriteDisk then
    begin
      mcdb.DebugMsg('>>> WRITE/BURNCD PROCESS DONE', 0);
      mcdb.DebugMsg('Запись завершена ...', 0);
      MessageDlg('Запись завершена ...', mtWarning, [mbOK], 0);
      if oArchiveFiles then
        mcdb.ResetFilesArchiveBit;
    end;
  end;
  if (Error = '') and (ccEject) then
    mcdb.LoadMedium(True);
  if oArchiveFiles then
    mcdb.ResetFilesArchiveBit;
  if vIsWriteDisk then
  begin
    MessageBeep(MB_OK);
    mcdb.DebugMsg(' ', 0);
    vBurnDone:=True;
  end;
end;

procedure TfrmProgressBurn.Timer1Timer(Sender: TObject);
begin
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
  Application.ProcessMessages;
end;

procedure TfrmProgressBurn.Timer2Timer(Sender: TObject);
begin
  imgBrnProcess.Visible:= not imgBrnProcess.Visible;  
end;

procedure TfrmProgressBurn.tsCDShow(Sender: TObject);
var
  i: integer;
  State: String;
  ini: TIniFile;
begin
  try
    aRecord.Visible:=True;
    aRecord.Enabled := True;
    aBurnISO.Visible:=True;
    pSetButtonsEnabled(False);
    try
    //  memLog.Clear;
      //
     // mcdb.DebugMsg('>>> '+Caption, 0);
      mcdb.InitializeASPI(True);

      if not mcdb.ASPIInitialized then
      begin
        ShowMessage('Error initializing ASPI Layer.');
        exit;
      end;
      if (mcdb.Devices <> nil) and (mcdb.Devices.Count > 0) then
      begin
        cbDrives.Properties.Items.Assign(mcdb.Devices);
        cbDrives.ItemIndex := 0;
        cbDrivesPropertiesChange(Sender);
        cxComboBox1PropertiesInitPopup(Sender);
      end;
      //cbSpeedDropDown(Sender);
      ini := TIniFile.Create('MCDB.ini');
      oArchiveFiles := False; // ini.ReadBool('Options', 'ArchiveFiles', oArchiveFiles);
      oImportSession := False; // ini.ReadBool('Options', 'ImportSession', oImportSession);
      // State := Unchecked;  // ini.ReadString('Options', 'SavePath', '');
      //
      mcdb.FinalizeDisc := False; // ini.ReadBool('Options', 'CloseDisc', mcdb.FinalizeDisc);
      mcdb.JolietFileSystem := True; // ini.ReadBool('Options', 'JolietFS', mcdb.JolietFileSystem);
      mcdb.TestWrite := False; // ini.ReadBool('Options', 'TestWrite', mcdb.TestWrite);
      mcdb.PerformOPC := True;  // ini.ReadBool('Options', 'PerformOPC', mcdb.PerformOPC);
      //
      SessionToImport := 0;
      ccEject := False;  // ini.ReadBool('Options', 'EjectDisc', False);
      ccShowFiles := False; // ini.ReadBool('Options', 'ShowFiles', False);
      ccImportSession := False; // ini.ReadBool('Options', 'ImportSession', False);

      mcdb.BootImage := ''; // ini.ReadString('Options', 'BootImage', mcdb.BootImage);
      mcdb.Bootable := False; // ini.ReadBool('Options', 'Bootable', mcdb.Bootable);
      mcdb.IdVolume := ''; // ini.ReadString('Options', 'VolumeLable', mcdb.IdVolume);
      // mcdb.CacheSize := 8392704; // ini.ReadInteger('Options', 'CacheSize', mcdb.CacheSize);
      ini.Free;

      mcdb.DebugMsg(' ', 0);
      mcdb.LockDrive;
    except
      on E:Exception do
        MessageDlg('error(нет диска) '+E.Message, mtWarning, [mbOK], 0);
    end;
  finally
    pSetButtonsEnabled(True);
  end;
end;

procedure TfrmProgressBurn.FlashRefresh;
var vDiskStr, vD : string;
  DriveN: Integer;
  DriveC: Char;
  DriveB: set of 0..25;
  VolumeName,
  FileSystemName : array [0..MAX_PATH-1] of Char;
  VolumeSerialNo : DWord;
  MaxComponentLength,FileSystemFlags, vTp: Cardinal;
begin
  try
  //  memLog.Clear;
    vDiskList.Clear;
    try
      if cbFlashDisks.Properties.Items.Count>0 then      
        cbFlashDisks.Properties.Items.Clear;
    except
    end;
    Integer(DriveB) := GetLogicalDrives;
    for DriveN := 0 to 25 do begin
    if not (DriveN in DriveB) then
      Continue;
      DriveC := Char(DriveN + Ord('a'));
      vDiskStr := DriveC + ':\';

      GetVolumeInformation(PChar(vDiskStr),VolumeName,MAX_PATH,@VolumeSerialNo,
        MaxComponentLength,FileSystemFlags, FileSystemName,MAX_PATH);

    {  memLog.Lines.Add('VolumeName = '+VolumeName);
      memLog.Lines.Add('SerialNo = $'+IntToHex(VolumeSerialNo,8));
      memLog.Lines.Add('CompLen = '+IntToStr(MaxComponentLength));
      memLog.Lines.Add('Flags = $'+IntToHex(FileSystemFlags,4));
      memLog.Lines.Add('FSName = '+FileSystemName);  }

    {  case GetDriveType(vDiskStr) of
        0: ShowMessage('The drive type cannot be determined');
        1: ShowMessage('The root directory does not exist');
        DRIVE_REMOVABLE: ShowMessage('The disk can be removed');
        DRIVE_FIXED: ShowMessage('The disk cannot be removed');
        DRIVE_REMOTE: ShowMessage('The drive is remote (network) drive');
        DRIVE_CDROM: ShowMessage('The drive is a CD-ROM drive');
        DRIVE_RAMDISK: ShowMessage('The drive is a RAM disk');
      end;  }
      vTp:=GetDriveType( PChar(vDiskStr) );
      if vTp <> DRIVE_CDROM then
      begin
        vDiskList.Append(vDiskStr);   //   vDiskList(cbFlashDisks.ItemIndex)
        if vTp = DRIVE_REMOVABLE then
        begin
          cbFlashDisks.Properties.Items.Add( vDiskStr+'  '+VolumeName+' removable' );
          if DriveC<>'' then vD:=vDiskStr+'  '+VolumeName+' removable';
        end else
        begin
          cbFlashDisks.Properties.Items.Add( vDiskStr+'  '+VolumeName );
          if DriveC<>'' then vD:=vDiskStr;
        end;
      end;
    end;
  //  if cbFlashDisks.Text='' then
    cbFlashDisks.Text := vD{+'  '+VolumeName} ;
  except
    on E:Exception do
      MessageDlg('error '+E.Message, mtWarning, [mbOK], 0);
  end;
end;

procedure TfrmProgressBurn.tsFlashShow(Sender: TObject);
begin
  try
    aBurnISO.Visible:=False;
    pSetButtonsEnabled(False);
    FlashRefresh;
  finally
    pSetButtonsEnabled(True);
  end;
end;

procedure TfrmProgressBurn.tsFolderShow(Sender: TObject);
begin
  aBurnISO.Visible:=False;
end;

procedure TfrmProgressBurn.aSaveLogExecute(Sender: TObject);
begin  // Сохранить лог
  try
    memLog.Lines.SaveToFile(teLogFileName.Text);
    memLog.Lines.Append('Лог сохранен в файл '+teLogFileName.Text);
  except on E: Exception do
    begin
      memLog.Lines.Append('ERROR : '+IntToStr(GetLastError)+' '+E.Message);
    end;
  end;
end;

end.
