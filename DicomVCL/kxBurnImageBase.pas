{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit kxBurnImageBase;
{$I DicomPack.inc}

interface

uses
  Windows, Messages, SysUtils, {$IFDEF LEVEL6}Variants, {$ENDIF}Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, inifiles, cnsmsg,
  DB, DCM_Attributes, Buttons, ToolWin, StdCtrls, KxDrvLib, Menus,
  DicomBurner;

type
  TBurnCDForm = class(TForm)
    pbottom: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    lSize: TLabel;
    pcd: TProgressBar;
    pHBuf: TProgressBar;
    pBuf: TProgressBar;
    Memo1: TMemo;
    Timer1: TTimer;
    od: TOpenDialog;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    cbDrives: TComboBox;
    bCaps: TSpeedButton;
    cbSpeed: TComboBox;
    bQErase: TSpeedButton;
    bCErase: TSpeedButton;
    bLoad: TSpeedButton;
    bEject: TSpeedButton;
    bReady: TSpeedButton;
    bSaveISO: TSpeedButton;
    bBurnISO: TSpeedButton;
    bClear: TSpeedButton;
    bAdvance: TSpeedButton;
    bBurn: TSpeedButton;
    BitBtn1: TBitBtn;
    SaveDialog1: TSaveDialog;
    DicomCDBurner: TCNSCDBurner;
    Panel1: TPanel;
    bAbort: TButton;
    procedure DicomCDBurnerEraseDone(Sender: TObject; WithError: Boolean);
    procedure DicomCDBurnerWriteDone(Sender: TObject; Error: string);
    procedure Timer1Timer(Sender: TObject);
    procedure bQEraseClick(Sender: TObject);
    procedure bCEraseClick(Sender: TObject);
    procedure bLoadClick(Sender: TObject);
    procedure bEjectClick(Sender: TObject);
    procedure bReadyClick(Sender: TObject);
    procedure bSaveISOClick(Sender: TObject);
    procedure bBurnISOClick(Sender: TObject);
    procedure bAdvanceClick(Sender: TObject);
    procedure bClearClick(Sender: TObject);
    procedure bBurnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbDrivesChange(Sender: TObject);
    procedure cbSpeedDropDown(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bCapsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bAbortClick(Sender: TObject);
    procedure DicomCDBurnerDebugMessage(Sender: TObject; Message: string;
      mType: Byte);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddFilesToCd; virtual;
    procedure DoBurnISO(AFileName: string);
  end;

const
  MaxFiles = 600000;
  MaxDirs = 20000;

implementation
{$R *.dfm}

function GetSpeed(Str: string; Medium: Byte): Word;
var
  Divider: Integer;
begin
  if Str = 'Max' then
    result := 0
  else
  begin
    if Medium >= mtDVD_ROM then
      Divider := 7
    else
      Divider := 1;
    result := StrToInt(Copy(str, 1, Pos('X', str) - 1)) * Divider;
  end;
end;

procedure TBurnCDForm.DicomCDBurnerEraseDone(Sender: TObject; WithError: Boolean);
begin
  if WithError then
    DicomCDBurner.DebugMsg('>>> ' + cns_EraseCDFinishedWithError, 0)
  else
    DicomCDBurner.DebugMsg('>>> ' + cns_EraseCDFinished, 0);
  Timer1.Enabled := False;
  if (not WithError) and (ccEject) then
    DicomCDBurner.LoadMedium(True);
  pcd.Position := 0;
  MessageBeep(MB_OK);
  DicomCDBurner.DebugMsg(' ', 0);
end;

procedure TBurnCDForm.DicomCDBurnerWriteDone(Sender: TObject; Error: string);
begin
  Timer1.Enabled := False;
  Timer1Timer(Sender);
  if Error <> '' then
  begin
    DicomCDBurner.DebugMsg('>>> ' + cns_BurnCDFinishedWithError, 0);
    DicomCDBurner.DebugMsg('>>> ' + Error, 0);
  end
  else
  begin
    DicomCDBurner.DebugMsg('>>> ' + cns_BurnCDFinished, 0);
    if oArchiveFiles then
      DicomCDBurner.ResetFilesArchiveBit;
  end;

  if (Error = '') and (ccEject) then
    DicomCDBurner.LoadMedium(True);
  if oArchiveFiles then
    DicomCDBurner.ResetFilesArchiveBit;
  DicomCDBurner.ClearAll(MaxFiles, MaxDirs);
  MessageBeep(MB_OK);
  bAbort.Visible := False;
  DicomCDBurner.DebugMsg(' ', 0);
  bSaveISO.Enabled := True;
  bBurnISO.Enabled := True;
end;

procedure TBurnCDForm.Timer1Timer(Sender: TObject);
begin
  if not DicomCDBurner.Erasing then
  begin
    lSize.Caption := FormatFloat('#,##0.00', (DicomCDBurner.BytesWritten / (1024 * 1024))) + '/' + FormatFloat('#,##0.00', ((DicomCDBurner.ImageSize * 2048) / (1024 * 1024))) + ' MB';
    pbuf.Position := DicomCDBurner.BufferProgress;
    pcd.Position := DicomCDBurner.BytesWritten div 2048;
    if DicomCDBurner.DeviceBufferSize >= DicomCDBurner.DeviceFreeBufferSize then
      pHBuf.Position := Integer(DicomCDBurner.DeviceBufferSize - DicomCDBurner.DeviceFreeBufferSize);
  end
  else
  begin
    pcd.Max := 100;
    pcd.Position := DicomCDBurner.EraseProgress;
  end;
end;

procedure TBurnCDForm.bQEraseClick(Sender: TObject);
var
  str: string;
  Speed: Word;
begin
  if not (DicomCDBurner.Erasable) and (DicomCDBurner.DiscType <> mtDVD_RAM) then
    ShowMessage(cns_ThisCDIsUnformat)
  else
    if MessageDlg(cns_EraseCDWarning + #13#10 + cns_EraseCDComfird, mtWarning, [MBYES, mbno], 0) = MRYES then
  begin
    Timer1.Enabled := True;
    str := cbSpeed.Items[cbSpeed.ItemIndex];
    Speed := GetSpeed(str, DicomCDBurner.DiscType);
    DicomCDBurner.WriteSpeed := speed;
    DicomCDBurner.EraseDisc(etQuick);
  end;
end;

procedure TBurnCDForm.bCEraseClick(Sender: TObject);
var
  Speed: word;
begin
  if not DicomCDBurner.Erasable then
    ShowMessage(cns_ThisCDIsUnformat)
  else
    if MessageDlg(cns_EraseCDWarning + #13#10 + cns_EraseCDComfird, mtWarning, [MBYES, mbno], 0) = MRYES then
  begin
    Timer1.Enabled := True;
    Speed := GetSpeed(cbSpeed.Items[cbSpeed.ItemIndex], DicomCDBurner.DiscType);
    DicomCDBurner.WriteSpeed := Speed;
    DicomCDBurner.EraseDisc(etComplete);
  end;
end;

procedure TBurnCDForm.bLoadClick(Sender: TObject);
begin
  if DicomCDBurner.LoadMedium then
    DicomCDBurner.DebugMsg('>>> ' + cns_LoadCDSuccess, 0);
end;

procedure TBurnCDForm.bEjectClick(Sender: TObject);
begin
  DicomCDBurner.FlushCache;
  DicomCDBurner.LockMedium(True);
  if DicomCDBurner.LoadMedium(True) then
    DicomCDBurner.DebugMsg('>>> ' + cns_EjectCDSuccess, 0)
  else
    DicomCDBurner.DebugMsg('>>> ' + cns_EjectCDNotSuccess, 0)
end;

procedure TBurnCDForm.bReadyClick(Sender: TObject);
begin
  if DicomCDBurner.TestUnitReady then
    DicomCDBurner.DebugMsg('>>> ' + cns_CDWriterReady, 0)
  else
    DicomCDBurner.DebugMsg('>>> ', 0);
end;

procedure TBurnCDForm.bSaveISOClick(Sender: TObject);
var
  FileName: string;
begin
  FileName := DicomCDBurner.ISOFileName;
  if SaveDialog1.Execute then
  begin
    FileName := SaveDialog1.FileName;
    Timer1.Enabled := True;
    DicomCDBurner.ClearAll(MaxFiles, MaxDirs);
    AddFilesToCD;
    //    DicomCDBurner.IdVolume := Edit1.Text;
    if DicomCDBurner.IdVolume = '' then
      DicomCDBurner.IdVolume := 'DICOMDIR';
    if (DicomCDBurner.DirsCount = 0) and (DicomCDBurner.FilesCount = 0) then
      exit;
    DicomCDBurner.DebugMsg('>>> ' + cns_AddFilesAndDirsSuccess, 0);
    Application.ProcessMessages;
    DicomCDBurner.DebugMsg('>>> ' + cns_StartBurnISOFile, 0);
    bSaveISO.Enabled := False;
    bBurnISO.Enabled := False;
    DicomCDBurner.Prepare(True);
    DicomCDBurner.DebugMsg('>>ImageSize:' + FormatFloat('#,###', DicomCDBurner.ImageSize * 2048), 0);
    pcd.Max := DicomCDBurner.ImageSize;
    lSize.Caption := FormatFloat('#,##0.00', DicomCDBurner.ImageSize * 2048 / (1024 * 1024)) + ' MB';
    DicomCDBurner.SaveToISOFile(FileName, QuickSaveISO);
  end;
end;

procedure TBurnCDForm.bBurnISOClick(Sender: TObject);
var
  a, b: Cardinal;
begin
  bBurnISO.Enabled := false;
  try
    if od.Execute then
    begin
      DicomCDBurner.ReadBufferCapacity(a, b);
      pHBuf.Max := a;
      bAbort.Visible := True;
      Timer1.Enabled := True;
      DicomCDBurner.DebugMsg('>>> ' + DicomCDBurner.Device + cns_StartBurnISOFile, 0);
      bSaveISO.Enabled := False;
      bBurnISO.Enabled := False;
      timer1.Enabled := True;
      DicomCDBurner.BurnISOImage(od.FileName);
      pcd.Max := DicomCDBurner.ImageSize;
    end;
  finally
    bBurnISO.Enabled := true;
  end;
end;

procedure TBurnCDForm.DoBurnISO(AFileName: string);
var
  FileName: string;
begin
  FileName := DicomCDBurner.ISOFileName;
  if AFileName <> '' then
  begin
    FileName := AFileName;
    Timer1.Enabled := True;
    DicomCDBurner.ClearAll(MaxFiles, MaxDirs);
    AddFilesToCD;
    //    DicomCDBurner.IdVolume := Edit1.Text;
    if DicomCDBurner.IdVolume = '' then
      DicomCDBurner.IdVolume := 'DICOMDIR';
    if (DicomCDBurner.DirsCount = 0) and (DicomCDBurner.FilesCount = 0) then
      exit;
    DicomCDBurner.DebugMsg('>>> ' + cns_AddFilesAndDirsSuccess, 0);
    Application.ProcessMessages;
    DicomCDBurner.DebugMsg('>>> ' + cns_StartBurnISOFile, 0);
    bSaveISO.Enabled := False;
    bBurnISO.Enabled := False;
    DicomCDBurner.Prepare(True);
    DicomCDBurner.DebugMsg('>>ImageSize:' + FormatFloat('#,###', DicomCDBurner.ImageSize * 2048), 0);
    pcd.Max := DicomCDBurner.ImageSize;
    lSize.Caption := FormatFloat('#,##0.00', DicomCDBurner.ImageSize * 2048 / (1024 * 1024)) + ' MB';
    DicomCDBurner.SaveToISOFile(FileName, QuickSaveISO);
  end;
end;

procedure TBurnCDForm.bAdvanceClick(Sender: TObject);
begin
  DicomCDBurner.ShowDeviceSetting;
end;

procedure TBurnCDForm.bClearClick(Sender: TObject);
begin
  //  clBox.Items.Clear;
  DicomCDBurner.ClearAll(MaxFiles, MaxDirs);
end;

procedure TBurnCDForm.bBurnClick(Sender: TObject);
var
  a, b: Cardinal;
  str, msg: string;
  speed: Word;
label
  okDoBurn;
begin
  bBurn.Enabled := false;
  try

    DicomCDBurner.ReadBufferCapacity(a, b);
    pHBuf.Max := a;
    if cbSpeed.ItemIndex = -1 then
      cbSpeed.ItemIndex := 0;
    str := cbSpeed.Items[cbSpeed.ItemIndex];
    speed := GetSpeed(str, DicomCDBurner.DiscType);
    DicomCDBurner.WriteSpeed := Speed;
    Application.ProcessMessages;
    DicomCDBurner.ClearAll(MaxFiles, MaxDirs);
    //DicomCDBurner.DebugMsg('>>FreeSize:'+IntToStr(DicomCDBurner.CalcFreeDiscSpace),0);
    AddFilesToCD;
    DicomCDBurner.DebugMsg('>>>' + cns_AddFilesAndDirsSuccess, 0);
    Application.ProcessMessages;
    if (DicomCDBurner.DirsCount = 0) and (DicomCDBurner.FilesCount = 0) then
      exit;
    {  if ccShowFiles then
      begin
        frmDiscLayout := TfrmDiscLayout.Create(Self);
        frmDiscLayout.ShowModal;
      end;}
    DicomCDBurner.Prepare;
    pcd.Max := DicomCDBurner.ImageSize;
    DicomCDBurner.DebugMsg('>>ImageSize:' + FormatFloat('#,###', DicomCDBurner.ImageSize * 2048), 0);
    msg := cns_StartBurnFileTo + FormatFloat('#,##0.00', DicomCDBurner.ImageSize * 2048 / (1024 * 1024)) + ' MB';
    if MessageDlg(msg + #13#10 + cns_BurnComfird_caption, mtWarning, [MBYES, mbno], 0) = MRYES then
      //  if Application.MessageBox(@msg[1], cns_BurnComfird_caption, MB_DEFBUTTON1 + MB_ICONQUESTION + MB_YESNO) = ID_YES then
    begin
      okDoBurn:
      bAbort.Visible := True;
      Timer1.Enabled := True;
      DicomCDBurner.DebugMsg('>>> ' + cns_StartBurning + DicomCDBurner.Device, 0);
      bBurnISO.Enabled := False;
      bSaveISO.Enabled := False;
      DicomCDBurner.BurnCD;
    end
    else
      Timer1.Enabled := False;

  finally
    bBurn.Enabled := true;
  end;
end;

procedure TBurnCDForm.FormShow(Sender: TObject);
var
  ini: TIniFile;
begin
  DicomCDBurner.InitializeASPI(True);
  if not DicomCDBurner.ASPIInitialized then
  begin
    ShowMessage(cns_ASPIInitialized_Error);
    exit;
  end;
  if (DicomCDBurner.Devices <> nil) and (DicomCDBurner.Devices.Count > 0) then
  begin
    cbDrives.Items.Assign(DicomCDBurner.Devices);
    cbDrives.ItemIndex := 0;
    cbDrivesChange(Sender);
  end;
  cbSpeedDropDown(Sender);
  ini := TIniFile.Create(DicomTempPath + 'KxPacs.ini');
  try
    oArchiveFiles := ini.ReadBool('Options', 'ArchiveFiles', oArchiveFiles);
    oImportSession := ini.ReadBool('Options', 'ImportSession', oImportSession);

    DicomCDBurner.FinalizeDisc := ini.ReadBool('Options', 'CloseDisc', DicomCDBurner.FinalizeDisc);
    DicomCDBurner.JolietFileSystem := ini.ReadBool('Options', 'JolietFS', DicomCDBurner.JolietFileSystem);
    DicomCDBurner.TestWrite := ini.ReadBool('Options', 'TestWrite', DicomCDBurner.TestWrite);
    DicomCDBurner.PerformOPC := ini.ReadBool('Options', 'PerformOPC', DicomCDBurner.PerformOPC);
    QuickSaveISO := ini.ReadBool('Options', 'QuickSaveISO', QuickSaveISO);
    if ini.ReadBool('Options', 'ImportSession', False) = True then
      SessionToImport := ini.ReadInteger('Options', 'SessionNo', DicomCDBurner.SessionToImport)
    else
      SessionToImport := 0;
    ccEject := ini.ReadBool('Options', 'EjectDisc', False);
    ccShowFiles := ini.ReadBool('Options', 'ShowFiles', False);
    ccImportSession := ini.ReadBool('Options', 'ImportSession', False);

    DicomCDBurner.BootImage := ini.ReadString('Options', 'BootImage', DicomCDBurner.BootImage);
    DicomCDBurner.IdVolume := ini.ReadString('Options', 'VolumeLable', DicomCDBurner.IdVolume);
    DicomCDBurner.CacheSize := ini.ReadInteger('Options', 'CacheSize', DicomCDBurner.CacheSize);
  finally
    ini.Free;
  end;

  DicomCDBurner.DebugMsg(' ', 0);
end;

procedure TBurnCDForm.cbDrivesChange(Sender: TObject);
begin
  DicomCDBurner.Device := cbDrives.Text;
  cbDrives.Hint := cbDrives.Text;
  if (dcWriteCDR in DicomCDBurner.DeviceCapabilities) or (dcWriteDVDR in DicomCDBurner.DeviceCapabilities) or (dcWriteDVDRAM in DicomCDBurner.DeviceCapabilities) then
    bBurn.Enabled := True
  else
    bBurn.Enabled := False;
end;

procedure TBurnCDForm.cbSpeedDropDown(Sender: TObject);
var
  li: Integer;
  ms{, }
//    Speeds,
  {  ActSpd}: Integer;
//  Str: string;
  Divider, Medium: Integer;
begin
  Medium := DicomCDBurner.DiscType;
  if Medium >= mtDVD_ROM then
    Divider := 7
  else
    Divider := 1;
  li := cbSpeed.ItemIndex;
  cbspeed.Items.clear;
  cbSpeed.Items.Add('Max');
  ms := DicomCDBurner.MaxWriteSpeed;

  { for Speeds := ms downto 1 do
   begin
     DicomCDBurner.WriteSpeed := Speeds;
     ActSpd := DicomCDBurner.CurrentWriteSpeed;
     if (ActSpd div Divider) < 10 then
       Str := FormatFloat('00X ', ActSpd div Divider) + FormatFloat('(#,##0 KB/s)', ActSpd * 150)
     else
       Str := FormatFloat('0X ', ActSpd div Divider) + FormatFloat('(#,##0 KB/s)', ActSpd * 150);
     if cbSpeed.Items.IndexOf(Str) < 0 then
       cbSpeed.Items.Add(Str);
   end; }

  if li = -1 then
    cbSpeed.ItemIndex := 0
  else
    if li <= cbSpeed.Items.Count then
    cbSpeed.ItemIndex := li
  else
    cbSpeed.ItemIndex := 0;
end;

procedure TBurnCDForm.AddFilesToCD;
begin
  //  if Edit1.Text = '' then
  //    Edit1.Text := FormatDatetime('yyyymmdd', now);
  if SessionToImport <> 0 then
  begin
    DicomCDBurner.SessionToImport := 0;
    DicomCDBurner.ImportSession(SessionToImport, nil);
  end;
  {        fPath := GetImagePath;
          if CheckBox2.Checked then
            AddDBPatientToDICOMDIR(da1, ForBackupStudiesDataset);
          //          AddDirToDicomDir(da1, fPath);
          if fPath <> '' then
          begin
            DicomCDBurner.ParentDirectoryOnly := True;
            DicomCDBurner.InsertDir(DicomCDBurner.RootDir, fPath, '*.*', faAnyFile, true, True, oArchiveFiles);
            l := l + DicomCDBurner.GetDirSize(fPath) shr 10;
            Caption := FormatFloat('###,###,000',l )+'KB';

        DicomCDBurner.InsertFile('\', ExtractFilePath(Application.ExeName) + 'cnsviewer.exe', false);
        DicomCDBurner.InsertFile('\', ExtractFilePath(Application.ExeName) + 'DICOMDIR', false);
        DicomCDBurner.InsertFile('\', ExtractFilePath(Application.ExeName) + 'AUTORUN.INF', false);

  }
end;

procedure TBurnCDForm.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TBurnCDForm.bCapsClick(Sender: TObject);
begin
  DicomCDBurner.ShowDeviceCaps;
end;

procedure TBurnCDForm.FormCreate(Sender: TObject);
begin
  //
end;

procedure TBurnCDForm.bAbortClick(Sender: TObject);
begin
  DicomCDBurner.Abort;
end;

procedure TBurnCDForm.DicomCDBurnerDebugMessage(Sender: TObject;
  Message: string; mType: Byte);
begin
  Memo1.Lines.Add(Message);
end;

end.

