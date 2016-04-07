unit fSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, mbDrvLib, ComCtrls, mbISOLib, IniFiles, Menus,
  cxLookAndFeelPainters, ActnList, cxButtons, ExtCtrls, dxSkinsCore,
  dxSkinsDefaultPainters, cxControls, cxContainer, cxEdit, cxCheckBox,
  JvExExtCtrls, JvExtComponent, JvPanel, cxLabel, dxSkinOffice2007Green,
  dxSkinBlack, Medotrade, dxSkinOffice2007Black;

type
  TfrmAdvanceSettings = class(TForm)
    dlg: TOpenDialog;
    bOK: TcxButton;
    cxButton1: TcxButton;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    aCloseTrack: TAction;
    JvPanel1: TJvPanel;
    cEject: TcxCheckBox;
    cJoliet: TcxCheckBox;
    cUnderrunProtection: TcxCheckBox;
    cOPC: TcxCheckBox;
    Label1: TLabel;
    sCacheSize: TTrackBar;
    Label3: TLabel;
    cCloseDisc: TcxCheckBox;
    cImportSession: TcxCheckBox;
    eSession: TEdit;
    cTestWrite: TcxCheckBox;
    cQuickSaveISO: TcxCheckBox;
    cBootable: TcxCheckBox;
    cShowFiles: TcxCheckBox;
    cArchiveOnly: TcxCheckBox;
    Label2: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure cImportSessionClick(Sender: TObject);
    procedure sCacheSizeChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCancelExecute(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
    procedure cBootableClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdvanceSettings: TfrmAdvanceSettings;
  oArchiveFiles, oImportSession: Boolean;
implementation

uses fCD;

{$R *.DFM}
procedure TfrmAdvanceSettings.FormShow(Sender: TObject);
begin
  cJoliet.Checked := frmCD.mcdb.JolietFileSystem;
  cQuickSaveISO.Checked := QuickSaveISO;
  cCloseDisc.Checked := frmCD.mcdb.FinalizeDisc;
  cTestWrite.Checked := frmCD.mcdb.TestWrite;
  cOPC.Checked := frmCD.mcdb.PerformOPC;
  cBootable.Checked := frmCD.mcdb.Bootable;
  Label2.Caption := frmCD.mcdb.BootImage;
  eSession.Text := IntToStr(SessionToImport);
  cArchiveOnly.Checked := oArchiveFiles;

  cUnderrunProtection.Checked := frmCD.mcdb.UnderrunProtection;
  cUnderrunProtection.Enabled := dcUnderrunProtection in frmCD.mcdb.DeviceCapabilities;
  sCacheSize.Position := frmCD.mcdb.CacheSize div 1024 div 1024;
end;

procedure TfrmAdvanceSettings.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmAdvanceSettings.aOkExecute(Sender: TObject);
var ini: TIniFile;
begin
//-->> 1. выставляем параметры для mcdb и записи
  frmCD.mcdb.JolietFileSystem := cJoliet.Checked;
  frmCD.mcdb.FinalizeDisc := cCloseDisc.Checked;
  frmCD.mcdb.UnderrunProtection := cUnderrunProtection.Checked;
  frmCD.mcdb.TestWrite := cTestWrite.Checked;
  frmCD.mcdb.PerformOPC := cOPC.Checked;
  frmCD.mcdb.CacheSize := sCacheSize.Position * 1024 * 1024;
  frmCD.mcdb.Bootable := cBootable.Checked;
  frmCD.mcdb.BootImage := Label2.Caption;
  oArchiveFiles := cArchiveOnly.Checked;
  ccEject := cEject.Checked;
  ccShowFiles := cShowFiles.Checked;
  ccImportSession := cImportSession.Checked;
  QuickSaveISO := cQuickSaveISO.Checked;
  oArchiveFiles := cArchiveOnly.Checked;

  if (cImportSession.Checked = True) and (trim(eSession.Text) <> '') and (StrToInt(eSession.Text) = 0) then
    ShowMessage('Сессия на импорт; Ноль означает, что нет сессии для импорта');
  if cImportSession.Checked then
    SessionToImport := StrToInt(eSession.Text)
  else
    SessionToImport := 0;
//<<-- 1

  ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'MCDB.ini');
  ini.WriteBool('Options', 'ArchiveFiles', cArchiveOnly.Checked);
  ini.WriteBool('Options', 'ImportSession', oImportSession);
  ini.WriteBool('Options', 'SavePath', True);
  ini.WriteBool('Options', 'CloseDisc', frmCD.mcdb.FinalizeDisc);
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
  ini.WriteInteger('Options', 'CacheSize', frmCD.mcdb.CacheSize);
  ini.Free;
  Close;
end;

procedure TfrmAdvanceSettings.cBootableClick(Sender: TObject);
begin
  if cBootable.Checked then
    begin
      dlg.FileName := Label2.Caption;
      if dlg.Execute then
        begin
          Label2.Caption := dlg.FileName;
        end else
        begin
          cBootable.Checked := False;
        end;
    end;
end;

procedure TfrmAdvanceSettings.cImportSessionClick(Sender: TObject);
begin
  eSession.Enabled := cImportSession.Checked;
end;

procedure TfrmAdvanceSettings.sCacheSizeChange(Sender: TObject);
begin
  Label3.caption := IntToDec(sCacheSize.Position, 2, ' ')+' MB'; 
end;

procedure TfrmAdvanceSettings.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
