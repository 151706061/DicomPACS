{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit KxDriverInfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, IniFiles, dicomburner, cnsmsg, {KxISOBurner,} KxDrvLib,DCM_Attributes;

type
  TfrmSettings = class(TForm)
    Label1: TLabel;
    eVolLabel: TEdit;
    cJoliet: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    cCloseDisc: TCheckBox;
    cUnderrunProtection: TCheckBox;
    cTestWrite: TCheckBox;
    cEject: TCheckBox;
    cImportSession: TCheckBox;
    eSession: TEdit;
    cOPC: TCheckBox;
    sCacheSize: TTrackBar;
    Label3: TLabel;
    Label4: TLabel;
    cQuickSaveISO: TCheckBox;
    cBootable: TCheckBox;
    Label2: TLabel;
    dlg: TOpenDialog;
    cShowFiles: TCheckBox;
    cArchiveOnly: TCheckBox;
    CheckBox1: TCheckBox;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cImportSessionClick(Sender: TObject);
    procedure sCacheSizeChange(Sender: TObject);
    procedure cBootableClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    mcdb1: TCnsCDBurner;
  end;
  {
  var
    frmSettings: TfrmSettings;
    oArchiveFiles, oImportSession: Boolean;}
implementation

{$R *.DFM}

procedure TfrmSettings.FormShow(Sender: TObject);
begin
  cJoliet.Checked := mcdb1.JolietFileSystem;
  cQuickSaveISO.Checked := QuickSaveISO;
  cCloseDisc.Checked := mcdb1.FinalizeDisc;
  eVolLabel.Text := mcdb1.IdVolume;
  cTestWrite.Checked := mcdb1.TestWrite;
  cOPC.Checked := mcdb1.PerformOPC;
  cBootable.Checked := mcdb1.Bootable;
  Label2.Caption := mcdb1.BootImage;
  eSession.Text := IntToStr(SessionToImport);
  cArchiveOnly.Checked := oArchiveFiles;

  cUnderrunProtection.Checked := mcdb1.UnderrunProtection;
  cUnderrunProtection.Enabled := dcUnderrunProtection in mcdb1.DeviceCapabilities;
  sCacheSize.Position := mcdb1.CacheSize div 1024 div 1024;
end;

procedure TfrmSettings.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmSettings.Button1Click(Sender: TObject);
var
  ini: TIniFile;
begin
  mcdb1.JolietFileSystem := cJoliet.Checked;
  mcdb1.IdVolume := eVolLabel.Text;
  mcdb1.FinalizeDisc := cCloseDisc.Checked;
  mcdb1.UnderrunProtection := cUnderrunProtection.Checked;
  mcdb1.TestWrite := cTestWrite.Checked;
  mcdb1.PerformOPC := cOPC.Checked;
  mcdb1.CacheSize := sCacheSize.Position * 1024 * 1024;
  mcdb1.Bootable := cBootable.Checked;
  mcdb1.BootImage := Label2.Caption;
  oArchiveFiles := cArchiveOnly.Checked;
  ccEject := cEject.Checked;
  ccShowFiles := cShowFiles.Checked;
  ccImportSession := cImportSession.Checked;

  if cImportSession.Checked and (trim(eSession.Text) <> '') and (StrToInt(eSession.Text) = 0) then
    ShowMessage('Session to import; Zero means not to import any session');
  if cImportSession.Checked then
    SessionToImport := StrToInt(eSession.Text)
  else
    SessionToImport := 0;
  QuickSaveISO := cQuickSaveISO.Checked;
  oArchiveFiles := cArchiveOnly.Checked;
  ini := TIniFile.Create(DicomTempPath + 'KxPacs.ini');
  ini.WriteBool('Options', 'ArchiveFiles', cArchiveOnly.Checked);
  ini.WriteBool('Options', 'ImportSession', oImportSession);
  //  ini.WriteBool('Options', 'SavePath', cPathInfo.Checked);
  ini.WriteBool('Options', 'CloseTrack', mcdb1.FinalizeTrack);
  ini.WriteBool('Options', 'CloseDisc', mcdb1.FinalizeDisc);
  ini.WriteBool('Options', 'EjectDisc', cEject.Checked);
  ini.WriteBool('Options', 'JolietFS', cJoliet.Checked);
  ini.WriteBool('Options', 'Bootable', cBootable.Checked);
  ini.WriteBool('Options', 'TestWrite', cTestWrite.Checked);
  ini.WriteBool('Options', 'QuickSaveISO', cQuickSaveISO.Checked);
  ini.WriteBool('Options', 'ShowFiles', cShowFiles.Checked);
  ini.WriteBool('Options', 'PerformOPC', cOPC.Checked);
  ini.WriteString('Options', 'SessionNo', eSession.Text);
  ini.WriteBool('Options', 'ImportSession', cImportSession.Checked);
  ini.WriteString('Options', 'BootImage', Label2.Caption);
  ini.WriteString('Options', 'VolumeLable', eVolLabel.Text);
  ini.WriteInteger('Options', 'CacheSize', mcdb1.CacheSize);

  ini.Free;
  Close;
end;

procedure TfrmSettings.cImportSessionClick(Sender: TObject);
begin
  eSession.Enabled := cImportSession.Checked;
end;

function IntToDec(i: Int64; n: Integer = 2; pad: string = '0'): string;
var
  s1, s2: string;
  l, j: Integer;
begin
  s1 := IntToStr(i);
  l := Length(s1);
  for j := l to n - 1 do
    s2 := s2 + Pad;
  result := s2 + s1;
end;

procedure TfrmSettings.sCacheSizeChange(Sender: TObject);
begin
  Label3.caption := IntToDec(sCacheSize.Position, 2, ' ') + ' MB';
end;

procedure TfrmSettings.cBootableClick(Sender: TObject);
begin
  if cBootable.Checked then
  begin
    dlg.FileName := Label2.Caption;
    if dlg.Execute then
    begin
      Label2.Caption := dlg.FileName;
    end
    else
    begin
      cBootable.Checked := False;
    end;
  end

end;

procedure TfrmSettings.Button3Click(Sender: TObject);
begin
  mcdb1.CloseTrack(False, False);
end;

procedure TfrmSettings.FormCreate(Sender: TObject);
begin
  //  self.Font.Charset := GB2312_CHARSET;
  //  self.Font.name := cns_FormDefaultFontName;
  //  self.Font.Size := 9;
  Caption := cns_BurnSetupFormCaption;
  Label1.Caption := cns_ValumeCaption;
  Label4.Caption := cns_BurnBufferSize;

  cCloseDisc.Caption := cns_CloseDisc;
  cTestWrite.Caption := cns_TestWrite;
  cEject.Caption := cns_EjectAfterBurn;
  cQuickSaveISO.Caption := cns_QuickSaveISO;
  cBootable.Caption := cns_BootableCD;
  cShowFiles.Caption := cns_ShowFilesBeforeBurn;
  Button1.Caption := cns_OKCaption;
  Button2.Caption := cns_CancelCaption;
  //  Button1.Caption := '';
end;

end.

