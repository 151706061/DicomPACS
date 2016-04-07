unit fDolgTalon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, Menus, cxLookAndFeelPainters,
  dxBar, StdCtrls, cxButtons, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  dxSkinsdxBarPainter, cxClasses, ActnList, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  OracleData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, JvDBUtils, cxGridExportLink, ClipBrd,
  frxClass, frxDBSet, ShellAPI, SMMainAPI, cxCheckBox, cxCalendar, cxBarEditItem,
  dxBarExtDBItems, Registry, Oracle, dxSkinOffice2007Green;

type
  TInitPlugin = procedure (AppHandle : THandle;
                           nPacID : Integer;
                           nSotrID : Integer;
                           nDef : Integer;
                           nTalonID : Integer); stdcall;

  TfrmDolgTalon = class(TForm)
    Panel4: TPanel;
    lbFIO: TcxLabel;
    bClose: TcxButton;
    Panel5: TPanel;
    BM: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    bbLoad: TdxBarButton;
    bbPrint: TdxBarButton;
    al: TActionList;
    aClose: TAction;
    cxLabel1: TcxLabel;
    aLoad: TAction;
    aPrint: TAction;
    TVTALON: TcxGridDBTableView;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    odsTalon: TOracleDataSet;
    dsTalon: TDataSource;
    VTALONFIO: TcxGridDBColumn;
    VTALONOTDEL: TcxGridDBColumn;
    VTALONDATEOPEN: TcxGridDBColumn;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    sdPopUp: TSaveDialog;
    pmTV: TPopupMenu;
    pmFIO: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    Excel1: TMenuItem;
    N5: TMenuItem;
    aEdit: TAction;
    bbEdit: TdxBarButton;
    frxRepList: TfrxReport;
    frxDBList: TfrxDBDataset;
    bbOpenMK: TdxBarButton;
    aOpenMK: TAction;
    tmrCheckApplication: TTimer;
    dxBarDockControl1: TdxBarDockControl;
    cxBarEditItem1: TcxBarEditItem;
    tvGridIBDAYS: TcxGridDBColumn;
    ColorDialog: TColorDialog;
    N6: TMenuItem;
    nColor: TMenuItem;
    VTALONDATEFIZ: TcxGridDBColumn;
    cbPer: TdxBarLookupCombo;
    dsPeriod: TDataSource;
    odsPeriod: TOracleDataSet;
    VTALONColumn1: TcxGridDBColumn;
    VTALONBIRTHDAY: TcxGridDBColumn;
    VTALONfk_mkb10: TcxGridDBColumn;
    procedure aCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aLoadExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure odsTalonBeforeOpen(DataSet: TDataSet);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure lbFIOMouseLeave(Sender: TObject);
    procedure lbFIOMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure N5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aEditExecute(Sender: TObject);
    procedure odsTalonAfterOpen(DataSet: TDataSet);
    procedure frxRepListGetValue(const VarName: string; var Value: Variant);
    procedure aOpenMKExecute(Sender: TObject);
    procedure tmrCheckApplicationTimer(Sender: TObject);
    procedure TVTALONCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure nColorClick(Sender: TObject);
  private
//    AppHandle : Integer;
    Russian : HKL;
    sDateSys_4Rep : string;
//    function WinExecAndWait32(FileName: string; Visibility: integer): integer;
    { Private declarations }
  public
    procedure DoShowFormTalon;
    { Public declarations }
  end;

var
  frmDolgTalon: TfrmDolgTalon;

const
  SQL_PYT_YAKH = 'select ta.fk_id as TALONID_ID,' + #13#10 +
    '       ta.fk_ambid as fk_pacid,' + #13#10 +
    '       ta.fk_sotrid as ispolid,' + #13#10 +
    '       asu.get_last_naz_date_in_talon(ta.fk_id) as last_fd_run,' + #13#10 +
    '       asu.get_days_after_last_fizioproc(ta.fk_id, ta.fk_ambid) as days,' + #13#10 +
    '       ta.fd_opened,' + #13#10 +
    '       asu.pkg_regist_pacfunc.get_pac_fio(ta.fk_ambid) as fiopac,' + #13#10 +
    '       (select fc_name from asu.totdel where fk_id = (select fk_otdelid from asu.tambtalon where fk_id = ta.fk_id)) as fc_otdel,' + #13#10 +
    '       decode(to_char(trunc(ta.fd_opened,''dd''), ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', trunc(sysdate), trunc(ta.fd_opened,''dd'')) as fd_data1,' + #13#10 +
    '       (select max(fd_ins)' + #13#10 +
    '          from asu.treslech' + #13#10 +
    '         where fk_sos = asu.get_vipnaz' + #13#10 +
    '           and fk_nazid = (select max(asu.tnazlech.fk_id)' + #13#10 +
    '                             from asu.tnazlech, asu.tambtalon_naz' + #13#10 +
    '                            where tnazlech.fk_id = tambtalon_naz.fk_nazid' + #13#10 +
    '                              and tambtalon_naz.fk_talonid = ta.fk_id' + #13#10 +
    '                              and fk_pacid = ta.fk_ambid' + #13#10 +
    '                              and fk_smid in (select fk_id from asu.tsmid where fl_showanal = 1' + #13#10 +
    '                                              start with fc_synonim = ''PROC_FIZTER'' connect by prior fk_id = fk_owner))) as last_fizprocday,' + #13#10 +
    '       0 as rs,' + #13#10 +
    '       ts.fk_mkb10,' + #13#10 +
    '       asu.pkg_regist_pacfunc.GET_PAC_BITH(ta.fk_ambid) as BIRTHDAY' + #13#10 +
    'FROM ASU.TAMBTALON ta LEFT JOIN ASU.TDIAG td' + #13#10 +
    '     ON ta.fk_diagmain = td.fk_id LEFT JOIN asu.tsmid ts' + #13#10 +
    '     ON td.fk_smdiagid = ts.fk_id' + #13#10 +
    'WHERE ta.fn_sos = 0' + #13#10 +
    '     AND ta.fd_opened >= sysdate - :pfn_days AND ta.fd_opened <= sysdate AND ta.fk_sotrid = :pfk_sotrid';

implementation
uses fMain, fWait;
{$R *.dfm}

procedure TfrmDolgTalon.aCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmDolgTalon.aEditExecute(Sender: TObject);
var AmbTalon : THandle;
    InitPlugin : TInitPlugin;
    str : string;
begin
  AmbTalon := LoadLibrary('AMBTalonDLL.dll');
  try
    if AmbTalon <> 0 then
      begin
        @InitPlugin := GetProcAddress(AmbTalon, 'InitPluginModalDefTalon');
        if @InitPlugin = nil then
          Application.MessageBox('Функция InitPluginModalDefTalon не найдена в AMBTalonDLL.dll', 'Внимание', MB_OK + MB_ICONEXCLAMATION);
        try
          InitPlugin(Application.Handle,
                     odsTalon.FieldByName('FK_PACID').AsInteger,
                     frmMain.pSotrID,
                      -1,
                     odsTalon.FieldByName('TALONID_ID').AsInteger);
        except
          on E:  Exception do
            begin
              str :='Ошибка при запуске внешнего модуля AMBTalonDLL.dll'+sLineBreak+E.Message;
              Application.MessageBox(PChar(str), 'Ошибка', MB_OK + MB_ICONERROR);
            end;
        end;
      end else
      begin
        Application.MessageBox('Библиотека AMBTalonDLL.dll не найдена', 'Внимание', MB_OK + MB_ICONEXCLAMATION);
      end;
  finally
    FreeLibrary(AmbTalon);
  end;
end;

procedure TfrmDolgTalon.aLoadExecute(Sender: TObject);
begin
  RefreshQuery(odsTalon);
end;

procedure TfrmDolgTalon.aOpenMKExecute(Sender: TObject);
var AppProcID : Integer;
begin
  try
    if frmMain.RestoreApplication(odsTalon.FieldByName('FIOPAC').AsString) then Exit;
      SetLength(frmMain.arFIO,Length(frmMain.arFIO)+1);
    frmMain.arFIO[Length(frmMain.arFIO)-1]:=odsTalon.FieldByName('FIOPAC').AsString;
    aOpenMK.Enabled:=False;
    Application.ProcessMessages;
    Screen.Cursor := crSQLWait;
    tmrCheckApplication.Enabled:=True;

//    AppHandle := WinExecAndWait32(PChar('IBRazdel.exe '+IntToStr(frmMain.pAPPSOTRID)+' '+IntToStr(odsTalon.FieldByName('FK_PACID').AsInteger)+' '+IntToStr(-1)+' '+IntToStr(-1)), 1);
//    GetInputMapAppFromApp(AppHandle);

    AppProcID := AppStart('IBRazdel.exe', IntToStr(odsTalon.FieldByName('FK_PACID').AsInteger)+' '+IntToStr(-1)+' '+IntToStr(-1));
    if AppProcID = -1 then ShowMessage('Ошибка запуска приложения');
    ShowWait(odsTalon.FieldByName('FK_PACID').AsInteger,True);
  finally
    Screen.Cursor := crDefault;
    aOpenMK.Enabled := True;
  end;
end;

procedure TfrmDolgTalon.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
     id : Integer;
begin
  id := odsTalon.FieldByName('FK_PACID').AsInteger;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS DATESYS FROM DUAL ';
    ods.Open;
    sDateSys_4Rep := ods.FieldByName('DATESYS').AsString;
    frxRepList.ShowReport;
    odsTalon.Locate('FK_PACID', id, []);
  finally
    ods.Free;
  end;
end;

procedure TfrmDolgTalon.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVTALON.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmDolgTalon.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVTALON.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmDolgTalon.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVTALON.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmDolgTalon.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVTALON.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmDolgTalon.DoShowFormTalon;
begin
  aEdit.Enabled := False;
  aPrint.Enabled := False;
  aOpenMK.Enabled := False;
  TVTALON.StoreToRegistry('\SoftWare\SoftMaster\List_konsult\fDolgTalon\TVTALONVrach_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TVTALON');
  TVTALON.RestoreFromRegistry('\SoftWare\SoftMaster\List_konsult\fDolgTalon\TVTALONVrach_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVTALON');
end;

procedure TfrmDolgTalon.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    if not Reg.OpenKey('\Software\Softmaster\List_konsult\fDolgTalon\', FALSE) then
      begin
        Reg.CreateKey('\Software\Softmaster\List_konsult\fDolgTalon');
      end;
    try
      Reg.WriteInteger('\Software\Softmaster\List_konsult\fDolgTalon'+'\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'ID_PERIOD_DOLG', cbPer.KeyValue);
    except
    end;
  finally
    Reg.Free;
  end;
  TVTALON.StoreToRegistry('\SoftWare\SoftMaster\List_konsult\fDolgTalon\TVTALONVrach_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVTALON');
end;

procedure TfrmDolgTalon.FormCreate(Sender: TObject);
var Reg : TRegIniFile;
begin
  lbFIO.Caption := frmMain.sSotrFIO;
  nColor.Visible := frmMain.get_dbname = 'T';
  if odsPeriod.Active = False then
    odsPeriod.Active := True;
  cbPer.KeyValue := 7;
  Reg:=TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    Reg.OpenKey('\Software\Softmaster\List_konsult\fDolgTalon\ID_SOTR'+IntToStr(frmMain.pSOTRID), True);
    cbPer.KeyValue := Reg.ReadInteger('\Software\Softmaster\List_konsult\fDolgTalon\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'ID_PERIOD_DOLG', 0);
  finally
    Reg.Free;
  end;

  if frmMain.get_dbname = 'Х'
  then odsTalon.SQL.Text := SQL_PYT_YAKH;
end;

procedure TfrmDolgTalon.frxRepListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'SOTR' then Value := lbFIO.Caption;
  if VarName = 'SYSDATE' then Value := sDateSys_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;  
end;

procedure TfrmDolgTalon.lbFIOMouseLeave(Sender: TObject);
begin
  lbFIO.Style.BorderStyle := ebsNone;
  lbFIO.Style.BorderColor := clBtnFace;
end;

procedure TfrmDolgTalon.lbFIOMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lbFIO.Style.BorderStyle := ebsUltraFlat;
  lbFIO.Style.BorderColor := clGray;
end;

procedure TfrmDolgTalon.N1Click(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := lbFIO.Caption;
end;

procedure TfrmDolgTalon.N5Click(Sender: TObject);
begin
  TVTALON.RestoreFromRegistry('\SoftWare\SoftMaster\List_konsult\fDolgTalon\TVTALONVrach_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TVTALON');
end;

procedure TfrmDolgTalon.nColorClick(Sender: TObject);
begin
  ColorDialog.Execute();
end;

procedure TfrmDolgTalon.odsTalonAfterOpen(DataSet: TDataSet);
begin
  aEdit.Enabled := odsTalon.RecordCount <> 0;
  aPrint.Enabled := odsTalon.RecordCount <> 0;
  aOpenMK.Enabled := odsTalon.RecordCount <> 0;
end;

procedure TfrmDolgTalon.odsTalonBeforeOpen(DataSet: TDataSet);
begin
  odsTalon.SetVariable('PFK_SOTRID', frmMain.pSOTRID);
  odsTalon.SetVariable('PFN_DAYS', cbPer.KeyValue);
end;

procedure TfrmDolgTalon.tmrCheckApplicationTimer(Sender: TObject);
var Wnd               : hWnd;
    buff              : array[0..127] of Char;
    i, j, iDel        : Integer;
begin
  Application.ProcessMessages;
  if not(tmrCheckApplication.Enabled) then exit;
  iDel:=0;
  for i:=0 to Length(frmMain.arFIO)-1 do
  begin
    Wnd := GetWindow(Handle, gw_HWndFirst);
    while Wnd <> 0 do
    begin
      if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
        begin
          GetWindowText(Wnd, buff, sizeof(buff));
          if StrPas(buff) = frmMain.arFIO[i-iDel] then
            begin
              if IsWindowVisible(Wnd) then
              begin
                  for j:=i-iDel to Length(frmMain.arFIO)-2 do
                  begin
                    frmMain.arFIO[j]:=frmMain.arFio[j+1];
                  end;
                  SetLength(frmMain.arFIO,Length(frmMain.arFIO)-1);
                  Inc(iDel);
                  if Length(frmMain.arFIO) = 0 then
                  begin
                    tmrCheckApplication.Enabled:=False;
                    Screen.Cursor := crDefault;
                    aOpenMK.Enabled:=True;
                    Exit;
                  end;
                  Break;
              end;
            end;
        end;
      Wnd := GetWindow(Wnd, gw_hWndNext);
    end;
  end;
end;

procedure TfrmDolgTalon.TVTALONCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
 pDaysValue: double;

 function DoDarknesColor(color: TColor; Proc: Integer):TColor;
 var r,g,b : byte;
 begin
  Color:=ColorToRGB(Color);
  r:=GetRValue(Color);
  g:=GetGValue(Color);
  b:=GetBValue(Color);
  r:=r-muldiv(r,Proc,100);  //процент% уменьшения яркости
  g:=g-muldiv(g,Proc,100);
  b:=b-muldiv(b,Proc,100);
  result:=RGB(r,g,b);
 end;
begin
  if frmMain.get_dbname = 'T' then // сургут-травма
    begin
      pDaysValue := AViewInfo.GridRecord.Values[tvGridIBDAYS.Index];
      if (pDaysValue >= 1) and (not AViewInfo.GridRecord.Selected) then
        begin
          if pDaysValue > 6 then
            pDaysValue := 6;
          ACanvas.Brush.Color := TRUNC(DoDarknesColor(ColorDialog.Color, TRUNC(pDaysValue*10)));
          ACanvas.Font.Color := clWhite;
          ACanvas.Font.Style := ACanvas.Font.Style + [fsBold];
        end;
    end;
end;

//function TfrmDolgTalon.WinExecAndWait32(FileName: string; Visibility: integer): integer;
//var zAppName: array[0..512] of char;
//    zCurDir: array[0..255] of char;
//    WorkDir: string;
//    StartupInfo: TStartupInfo;
//    ProcessInfo: TProcessInformation;
//begin
//  StrPCopy(zAppName, FileName);
//  GetDir(0, WorkDir);
//  StrPCopy(zCurDir, FileName);
//  FillChar(StartupInfo, Sizeof(StartupInfo), #0);
//  StartupInfo.cb := Sizeof(StartupInfo);
//  StartupInfo.hStdInput := 23999;
//  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
//  StartupInfo.wShowWindow := Visibility;
//  if not CreateProcess(nil,
//         zAppName, { указатель командной строки }
//         nil, { указатель на процесс атрибутов безопасности }
//         nil, { указатель на поток атрибутов безопасности }
//         false, { флаг родительского обработчика }
//         CREATE_NEW_CONSOLE or { флаг создания }
//         NORMAL_PRIORITY_CLASS,
//         nil, { указатель на новую среду процесса }
//         nil, { указатель на имя текущей директории }
//         StartupInfo, { указатель на STARTUPINFO }
//         ProcessInfo) then Result := -1 { указатель на PROCESS_INF }
//  else begin
//      Result := ProcessInfo.dwProcessId;
//  end;
//end;

end.
