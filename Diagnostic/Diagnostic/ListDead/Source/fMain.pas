unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ImgList, dxBar, Oracle, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  OracleData, ShellAPI, dxBarExtItems, frxClass, frxDBSet, Menus, cxGridExportLink,
  ExtCtrls, cxContainer, cxTextEdit, StdCtrls, dxPSUtl, Clipbrd, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxBarPainter, JclFileUtils, uGlobalConst, SMMainAPI,
  dxSkinOffice2007Green, cxMaskEdit, cxDropDownEdit, cxCalendar, cxCheckBox,
  uGlobals;

type
  TfrmMain = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    actlstMain: TActionList;
    ilMain: TImageList;
    actClose: TAction;
    bbClose: TdxBarButton;
    os: TOracleSession;
    TVLIST: TcxGridDBTableView;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    dsList: TDataSource;
    odsList: TOracleDataSet;
    VNUMIB: TcxGridDBColumn;
    VFIOPAC: TcxGridDBColumn;
    VDATEROJD: TcxGridDBColumn;
    VSEX: TcxGridDBColumn;
    bbOpenMK: TdxBarButton;
    actOpenMK: TAction;
    bbPrint: TdxBarButton;
    actPrint: TAction;
    bbParam: TdxBarButton;
    actParam: TAction;
    VAGE: TcxGridDBColumn;
    VDATEDEAD: TcxGridDBColumn;
    bb1: TdxBarButton;
    actLoad: TAction;
    dxBegin: TdxBarDateCombo;
    dxEnd: TdxBarDateCombo;
    frxDBDataset1: TfrxDBDataset;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    N2: TMenuItem;
    actText: TAction;
    actWeb: TAction;
    actXML: TAction;
    actXLS: TAction;
    sdPopUp: TSaveDialog;
    dxBarDockControl2: TdxBarDockControl;
    bbSearchFam: TdxBarButton;
    bbDateDead: TdxBarDateCombo;
    bbSearchDate: TdxBarButton;
    odsListFIO: TOracleDataSet;
    odsDateDead: TOracleDataSet;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    pnlFIO: TPanel;
    bbFIO: TcxTextEdit;
    lbl1: TLabel;
    frxPrintList: TfrxReport;
    N3: TMenuItem;
    actCopyFIO: TAction;
    VOTDEL: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    tmrCheckApplication: TTimer;
    deBegin: TcxDateEdit;
    bcciDateBeg: TdxBarControlContainerItem;
    deEnd: TcxDateEdit;
    bcciDateEnd: TdxBarControlContainerItem;
    deDead: TcxDateEdit;
    bsBegin: TdxBarStatic;
    bsEnd: TdxBarStatic;
    bcciDateDead: TdxBarControlContainerItem;
    bsDead: TdxBarStatic;
    VLISTis_dead_in_interim: TcxGridDBColumn;
    procedure actCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure actOpenMKExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actParamExecute(Sender: TObject);
    procedure actLoadExecute(Sender: TObject);
    procedure odsListBeforeOpen(DataSet: TDataSet);
    procedure frxPrintListGetValue(const VarName: String;
      var Value: Variant);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure actTextExecute(Sender: TObject);
    procedure actWebExecute(Sender: TObject);
    procedure actXMLExecute(Sender: TObject);
    procedure actXLSExecute(Sender: TObject);
    procedure odsListAfterOpen(DataSet: TDataSet);
    procedure bbSearchFamClick(Sender: TObject);
    procedure bbSearchDateClick(Sender: TObject);
    procedure bbFIOKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbFIOClick(Sender: TObject);
    procedure bbFIOEnter(Sender: TObject);
    procedure odsListFIOAfterOpen(DataSet: TDataSet);
    procedure odsDateDeadAfterOpen(DataSet: TDataSet);
    procedure actCopyFIOExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrCheckApplicationTimer(Sender: TObject);
    procedure TVLISTCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    arFIO:array of string;
    Russian : HKL;
//    AppHandle : Integer;
    MedotradeSign : string;
    sCompanyName_4Rep, sOtdelName_4Rep : String;
//    function WinExecAndWait32(FileName: string; Visibility: integer): integer;
    function RestoreApplication(AAppCaption:string):Boolean;
    { Private declarations }
  public
    pAPPSOTRID, pSOTRID : Integer;
    GET_SYSDATE_4REP : String;
    procedure DoShowFormDead;
    procedure CheckEnableButtons;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses fWait, uPeriod, fProcess;
{$R *.dfm}

procedure TfrmMain.actCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.DoShowFormDead;
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  actOpenMK.Enabled := False;
  actPrint.Enabled := False;
  actCopyFIO.Enabled := False;
  pAPPSOTRID := StrToInt(paramstr(1));
  ods := TOracleDataSet.Create(nil);
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_SOTRID, '+
                    '        DO_VRACHFIO(FK_SOTRID) AS VRACHFIO, '+
                    '        (SELECT FC_NAME FROM TOTDEL WHERE FK_ID = (SELECT FK_OTDID FROM TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME '+
                    '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    sOtdelName_4Rep := ods.FieldByName('OTDELNAME').AsString;
    frmMain.Caption := 'Список умерших('+Ver.FileVersion+'). Пользователь: '+ods.FieldByName('VRACHFIO').AsString;
  finally
    ods.Free;
    Ver.Free;
  end;
  MedotradeSign := ReadMedotradeSign;
  TVList.StoreToRegistry('\SoftWare\SoftMaster\ListDead\TVList'+'Vrach_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'TVList');
  TVList.RestoreFromRegistry('\SoftWare\SoftMaster\ListDead\TVList'+'Vrach_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'TVList');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из приложения ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    action := caFree
  else
    action := caNone;
end;

procedure TfrmMain.osAfterLogOn(Sender: TOracleSession);
var Ver: TJclFileVersionInfo;
begin
  Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  Sender.DBMS_Application_Info.Set_Module(ExtractFileName(ParamStr(0)) + ' (' + Ver.FileVersion + ')', Self.Name + ' "' + Self.Caption + '"');
  Ver.Free;
end;

function TfrmMain.RestoreApplication(AAppCaption: string): Boolean;
var
  Wnd               : hWnd;
  buff              : array[0..127] of Char;
begin
  Result := False;
  Self.SetFocus;
  Application.ProcessMessages;
  Wnd := GetWindow(Handle, gw_HWndFirst);
  while Wnd <> 0 do
  begin
    if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
    begin
      GetWindowText(Wnd, buff, sizeof(buff));
      if StrPas(buff) = AAppCaption then
      begin
        Application.ProcessMessages;
        ShowWindow(wnd, SW_SHOWMINIMIZED);
        ShowWindow(wnd, SW_SHOWNORMAL);
        SetForegroundWindow(wnd);
        Application.ProcessMessages;
        Result := True;
        Exit;
      end; //if StrPas(buff) = cFIO
    end; //if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
    Wnd := GetWindow(Wnd, gw_hWndNext);
  end; //while Wnd <> 0
end;

procedure TfrmMain.tmrCheckApplicationTimer(Sender: TObject);
var Wnd               : hWnd;
    buff              : array[0..127] of Char;
    i, j, iDel        : Integer;
begin
  Application.ProcessMessages;
  if not(tmrCheckApplication.Enabled) then exit;
  iDel:=0;
  for i:=0 to Length(arFIO)-1 do
  begin
    Wnd := GetWindow(Handle, gw_HWndFirst);
    while Wnd <> 0 do
    begin
      if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
        begin
          GetWindowText(Wnd, buff, sizeof(buff));
          if StrPas(buff) = arFIO[i-iDel] then
            begin
              if IsWindowVisible(Wnd) then
              begin
                  for j:=i-iDel to Length(arFIO)-2 do
                  begin
                    arFIO[j]:=arFio[j+1];
                  end;
                  SetLength(arFIO,Length(arFIO)-1);
                  Inc(iDel);
                  if Length(arFIO) = 0 then
                  begin
                    tmrCheckApplication.Enabled:=False;
                    Screen.Cursor:=crDefault;
                    actOpenMK.Enabled:=True;
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

procedure TfrmMain.TVLISTCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  actOpenMKExecute(nil);
end;

//function TfrmMain.WinExecAndWait32(FileName: string; Visibility: integer): integer;
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

procedure TfrmMain.actOpenMKExecute(Sender: TObject);
var ods : TOracleDataSet;
    AppProcID : Integer;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_FIO(:FK_PEPLID) FIOPAC FROM DUAL ';
    ods.DeclareAndSet('FK_PEPLID', otInteger, dsList.DataSet.FieldByName('FK_PEPLID').AsInteger);
    ods.Open;
    if RestoreApplication(ods.FieldByName('FIOPAC').AsString) then Exit;
    SetLength(frmMain.arFIO,Length(frmMain.arFIO)+1);
    arFIO[Length(frmMain.arFIO)-1]:=ods.FieldByName('FIOPAC').AsString;
    actOpenMK.Enabled:=False;
    Application.ProcessMessages;
    Screen.Cursor := crSQLWait;
    tmrCheckApplication.Enabled:=True;

//    AppHandle := WinExecAndWait32(PChar('IBRazdel.exe '+IntToStr(pAPPSOTRID)+' '+IntToStr(dsList.DataSet.FieldByName('FK_ID').AsInteger)+' '+IntToStr(-1)+' '+IntToStr(-1)), 1);
//    GetInputMapAppFromApp(AppHandle);

    AppProcID := AppStart(ExtractFilePath(paramstr(0))+'IBRazdel.exe', IntToStr(dsList.DataSet.FieldByName('FK_ID').AsInteger)+' '+IntToStr(-1)+' '+IntToStr(-1) {+ ' ' + C_OCIDLL});
    if AppProcID = -1 then ShowMessage('Ошибка запуска приложения');
    ShowWait(dsList.DataSet.FieldByName('FK_ID').AsInteger,True);
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.actPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS SYSTEMDATE, '+
                    '        ASU.PKG_SMINI.READSTRING (''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME '+
                    '   FROM DUAL ';
    ods.Open;
    GET_SYSDATE_4REP := ods.FieldByName('SYSTEMDATE').AsString;
    sCompanyName_4Rep := ods.FieldByName('COMPANYNAME').AsString;
  finally
    ods.Free;
  end;
  frxDBDataset1.DataSet := dsList.DataSet;
  frxPrintList.ShowReport;
end;

procedure TfrmMain.actParamExecute(Sender: TObject);
begin
  with TfrmParamDate.Create(Self) do
    begin
      if Execute then
        begin
          if ModalResult = MrOK then
            begin
              deBegin.Date := Period.First;
              deEnd.Date := Period.Last;
            end;
        end;
    Free;
  end;
end;

procedure TfrmMain.actLoadExecute(Sender: TObject);
begin
  dsList.DataSet := odsList;
  odsList.Close;
  odsList.Open;
end;

procedure TfrmMain.odsListBeforeOpen(DataSet: TDataSet);
begin
  odsList.SetVariable('PDATE1', deBegin.Date);
  odsList.SetVariable('PDATE2', deEnd.Date+StrToDateTime('23:59:59'));
end;

procedure TfrmMain.frxPrintListGetValue(const VarName: String; var Value: Variant);
begin
  if dsList.DataSet = odsList then
    if VarName = 'VARNAME' then Value := 'Список умерших пациентов. Период с: '+DateTimeToStr(deBegin.Date)+' по: '+ DateTimeToStr(deEnd.Date);
  if dsList.DataSet = odsListFIO then
    if VarName = 'VARNAME' then Value := 'Список умерших пациентов. Отбор по фамилии : '+bbFIO.Text+'%';
  if dsList.DataSet = odsDateDead then
    if VarName = 'VARNAME' then Value := 'Список умерших пациентов. Отбор по дате смерти : '+DateTimeToStr(DeDead.Date);
  if VarName = 'SYSDATE' then Value := GET_SYSDATE_4REP;
  if VarName = 'KOLVOPAC' then Value := dsList.DataSet.RecordCount;
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;  
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TVList.StoreToRegistry('\SoftWare\SoftMaster\ListDead\TVList'+'Vrach_' + IntToStr(pSOTRID), TRUE, [], 'TVList');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
  russian:=LoadKeyboardLayout('00000419', 0);
  deBegin.date := date;                      
  deEnd.date := date;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  TVList.RestoreFromRegistry('\SoftWare\SoftMaster\ListDead\TVList'+'Vrach_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TVList');
end;

procedure TfrmMain.actTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.actWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.actXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.actXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.odsListAfterOpen(DataSet: TDataSet);
begin
  CheckEnableButtons;
end;

procedure TfrmMain.CheckEnableButtons;
begin
  actOpenMK.Enabled := dsList.DataSet.RecordCount <> 0;
  actPrint.Enabled := dsList.DataSet.RecordCount <> 0;
  actCopyFIO.Enabled := dsList.DataSet.RecordCount <> 0;
end;

procedure TfrmMain.bbSearchFamClick(Sender: TObject);
begin
  dsList.DataSet := odsListFIO;
  odsListFIO.Close;
  odsListFIO.SetVariable('pFAM', bbFIO.Text);
  odsListFIO.Open;
end;

procedure TfrmMain.bbSearchDateClick(Sender: TObject);
begin
  dsList.DataSet := odsDateDead;
  odsDateDead.Close;
  odsDateDead.SetVariable('pDATE', DeDead.Date);
  odsDateDead.Open;
end;

procedure TfrmMain.bbFIOKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  IF Key = VK_RETURN then
    bbSearchFamClick(nil);
end;

procedure TfrmMain.bbFIOClick(Sender: TObject);
begin
  ActivateKeyboardLayout(Russian, KLF_REORDER);
end;

procedure TfrmMain.bbFIOEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(Russian, KLF_REORDER);
end;

procedure TfrmMain.odsListFIOAfterOpen(DataSet: TDataSet);
begin
  CheckEnableButtons;
end;

procedure TfrmMain.odsDateDeadAfterOpen(DataSet: TDataSet);
begin
  CheckEnableButtons;
end;

procedure TfrmMain.actCopyFIOExecute(Sender: TObject);
begin
  Clipboard.AsText := ReplaceSubStr(dsList.DataSet.FieldByName('FC_FAM').AsString, '.', ''); 
end;

end.
