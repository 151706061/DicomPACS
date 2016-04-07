unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, ActnList, ImgList, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, OracleData,
  Oracle, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  frxClass, frxDBSet, Menus, cxGridExportLink, ShellAPI, jvDbUtils, StdCtrls,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxBarPainter, JclFileUtils, uGlobalConst, SMMainAPI,
  dxSkinOffice2007Green;

type
  TfrmMain = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    bbClose: TdxBarButton;
    actlstMain: TActionList;
    ilMain: TImageList;
    actClose: TAction;
    bbLoad: TdxBarButton;
    bbPrint: TdxBarButton;
    actLoad: TAction;
    actPrint: TAction;
    TV: TcxGridDBTableView;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    osMain: TOracleSession;
    odsListRep: TOracleDataSet;
    dsListRep: TDataSource;
    VNAMEREP: TcxGridDBColumn;
    VNUMBER: TcxGridDBColumn;
    frxDBPrintList: TfrxDBDataset;
    frxPrintList: TfrxReport;
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
    oqInsertIntParam: TOracleQuery;
    oqInsertDateParam: TOracleQuery;
    oqGetID: TOracleQuery;
    bbRefresh: TdxBarButton;
    actRefresh: TAction;
    oqInsertSubstParam: TOracleQuery;
    oqDelParam: TOracleQuery;
    VTABLES: TcxGridDBColumn;
    VNUMROW: TcxGridDBColumn;
    oqInsertVal: TOracleQuery;
    procedure actCloseExecute(Sender: TObject);
    procedure actLoadExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TVDblClick(Sender: TObject);
    procedure frxPrintListGetValue(const VarName: String; var Value: Variant);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure actTextExecute(Sender: TObject);
    procedure actWebExecute(Sender: TObject);
    procedure actXMLExecute(Sender: TObject);
    procedure actXLSExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure odsListRepBeforeOpen(DataSet: TDataSet);
    procedure odsListRepAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
//    AppHandle : Integer;
    MedotradeSign : string;
    sCompanyName_4Rep, sOtdelName_4Rep : String;
//    function WinExecAndWait32(FileName: string; Visibility: integer): integer;
    { Private declarations }
  public
    pOTDELID : Integer;
    pAPPSOTRID : Integer;
    pSOTRID : Integer;
    pISPOLID : Integer;
    pKABID : Integer;
    idParam : Integer;
    IDDEZ : Variant;
    sSOTRNAME : String;
    GET_SYSDATE_4REP : String;
    procedure DoShowForm;
    procedure CheckEnabledButtons;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses uPeriodParam, cxDBLookupComboBox;
{$R *.dfm}

procedure TfrmMain.actCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.actLoadExecute(Sender: TObject);
var S : String;
    SRun, SParam: String;
    AppProcID : Integer;
begin
//----- обработка параметров
 with TfrmPeriod.Create(Self) do begin
  if Execute then begin
   if cxSotr.Text <> '' then
     pISPOLID := cxSotr.EditValue;
   if cxKab.Text <> '' then
     pKABID := cxKab.EditValue;
   IDDEZ := cxDez.Checked;
  end;
  if ModalResult = MrOK then
    begin
      oqDelParam.SetVariable('PFK_ID', idParam);
      oqDelParam.Execute;
      osMain.Commit;
      oqGetID.Execute;
      osMain.Commit;
      idParam := oqGetID.GetVariable('ID');

      oqInsertDateParam.SetVariable('ID', idParam);
      oqInsertDateParam.SetVariable('pNAME', 'pDATE1');
      oqInsertDateParam.SetVariable('pPARAM', Period.First);
      oqInsertDateParam.Execute;
      osMain.Commit;
      oqInsertDateParam.SetVariable('ID', idParam);
      oqInsertDateParam.SetVariable('pNAME', 'pDATE2');
      oqInsertDateParam.SetVariable('pPARAM', Period.Last);
      oqInsertDateParam.Execute;
      osMain.Commit;
      if pISPOLID <> 0 then
        begin
          S:= ' AND TNAZIS.FK_ISPOLID = '+IntToStr(pISPOLID);
          oqInsertSubstParam.SetVariable('ID', idParam);
          oqInsertSubstParam.SetVariable('pNAME', 'ISPOLID');
          oqInsertSubstParam.SetVariable('pNAME1', 'ISPOLID_VAL');
          oqInsertSubstParam.SetVariable('pPARAM', S);
          oqInsertSubstParam.SetVariable('pPARAM1', cxSotr.EditValue);
          oqInsertSubstParam.Execute;
          osMain.Commit;
          pISPOLID := 0;
        end else
        begin
          oqInsertVal.SetVariable('ID', idParam);
          oqInsertVal.SetVariable('pNAME1', 'ISPOLID_VAL');
          oqInsertVal.SetVariable('pPARAM1', 0);
          oqInsertVal.Execute;
          osMain.Commit;
        end;
      if strID <> '' then
//      if pKABID <> 0 then
        begin
//          S := ' AND TNAZIS.FK_ROOMID = '+IntToStr(pKABID);
          S := ' AND TNAZIS.FK_ROOMID in ('+strID+')';
          oqInsertSubstParam.SetVariable('ID', idParam);
          oqInsertSubstParam.SetVariable('pNAME', 'KABID');
          oqInsertSubstParam.SetVariable('pNAME1', 'KABID_VAL');
          oqInsertSubstParam.SetVariable('pPARAM', S);
          oqInsertSubstParam.SetVariable('pPARAM1', ''''+peKab.Text+''''); //strID); //cxKab.EditValue);
          oqInsertSubstParam.Execute;
          osMain.Commit;
          pKABID := 0;
        end else
        begin
          oqInsertVal.SetVariable('ID', idParam);
          oqInsertVal.SetVariable('pNAME1', 'KABID_VAL');
          oqInsertVal.SetVariable('pPARAM1', -1);
          oqInsertVal.Execute;
          osMain.Commit;
        end;
      if IDDEZ <> 0 then
        begin
          S := ' AND exists (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''DEZURSTVO'')) '; //  = '+IntToStr(IDDEZ);
          oqInsertSubstParam.SetVariable('ID', idParam);
          oqInsertSubstParam.SetVariable('pNAME', 'DEZID');
          oqInsertSubstParam.SetVariable('pNAME1', 'DEZID_VAL');
          oqInsertSubstParam.SetVariable('pPARAM', S);
          oqInsertSubstParam.SetVariable('pPARAM1', cxDez.EditValue);
          oqInsertSubstParam.Execute;
          osMain.Commit;
          IDDEZ := 0;
        end else
        begin
          oqInsertVal.SetVariable('ID', idParam);
          oqInsertVal.SetVariable('pNAME1', 'DEZID_VAL');
          oqInsertVal.SetVariable('pPARAM1', 0);
          oqInsertVal.Execute;
          osMain.Commit;
        end;
//------------------------------------------------------------------------------
  Srun := 'repMedStat.exe ';
  SParam := IntToStr(pAPPSOTRID)+' '+'FORM='+IntToStr(odsListRep.FieldByName('fk_id').AsInteger)+' '+'PARAMS='+IntToStr(idParam);

  AppProcID := AppStart(sRun, sParam);
  if AppProcID = -1 then ShowMessage('Ошибка запуска приложения');
//  AppHandle := WinExecAndWait32(Srun+' '+SParam, 1);
//  if AppHandle > 0 then
//    begin
//      GetInputMapAppFromApp(AppHandle);
//    end else
//    begin
//      MessageDlg('Ошибка при запуске ' + Srun, mtConfirmation, [mbOK], 0);
//    end;
   end;
  Free;
  end;
end;

procedure TfrmMain.actPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
     id : Integer;
begin
  id := odsListRep.FieldByName('FK_ID').AsInteger;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS SYSTEMDATE, '+#13+
                    '        ASU.PKG_SMINI.READSTRING (''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME '+#13+
                    '   FROM DUAL ';
    ods.Open;
    GET_SYSDATE_4REP := ods.FieldByName('SYSTEMDATE').AsString;
    sCompanyName_4Rep := ods.FieldByName('COMPANYNAME').AsString;
  finally
    ods.Free;
  end;
  frxPrintList.ShowReport;
  odsListRep.Locate('FK_ID', id, []);
end;

procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  pAPPSOTRID := StrToInt(paramstr(1));
  ods := TOracleDataSet.Create(nil);
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_SOTRID, '+
                    '        DO_VRACHFIO(FK_SOTRID) AS SOTRNAME, '+
                    '        (SELECT FC_NAME FROM TOTDEL WHERE FK_ID = (SELECT FK_OTDID FROM TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME, '+
                    '        (SELECT FK_OTDID FROM TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID) AS OTDELID '+
                    '   FROM LOGIN.TAPPSOTR '+
                    '  WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    pOTDELID := ods.FieldByName('OTDELID').AsInteger;
    sSOTRNAME := ods.FieldByName('SOTRNAME').AsString;
    sOtdelName_4Rep := ods.FieldByName('OTDELNAME').AsString;
    frmMain.Caption := 'ОТЧЁТЫ('+Ver.FileVersion+'). Пользователь: '+ods.FieldByName('SOTRNAME').AsString;
    odsListRep.Open;
  finally
    ods.Free;
    Ver.Free;
  end;

  MedotradeSign := ReadMedotradeSign;
  TV.ApplyBestFit;
  TV.StoreToRegistry('\SoftWare\SoftMaster\Rep_stat\TV'+'Sotr'+ '_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'TV');
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\Rep_stat\TV'+'Sotr'+ '_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'TV');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из приложения ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    action := caFree
  else
    action := caNone;
end;

procedure TfrmMain.TVDblClick(Sender: TObject);
begin
  actLoadExecute(nil);
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

procedure TfrmMain.frxPrintListGetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'SOTRNAME' then Value := sSOTRNAME;
  if VarName = 'DATEREP' then Value := GET_SYSDATE_4REP;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  oqDelParam.SetVariable('PFK_ID', idParam);
  oqDelParam.Execute;
  osMain.Commit;
  TV.StoreToRegistry('\SoftWare\SoftMaster\Rep_stat\TV'+'Sotr'+ '_' + IntToStr(pSOTRID), TRUE, [], 'TV');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(osMain, 'ASU');
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\Rep_stat\TV'+'Sotr'+ '_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TV');
end;

procedure TfrmMain.actTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.actWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.actXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.CheckEnabledButtons;
begin
  actLoad.Enabled := odsListRep.RecordCount <> 0;
  actPrint.Enabled := odsListRep.RecordCount <> 0;
end;

procedure TfrmMain.actXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.actRefreshExecute(Sender: TObject);
begin
  RefreshQuery(odsListRep);
end;

procedure TfrmMain.odsListRepAfterOpen(DataSet: TDataSet);
begin
  CheckEnabledButtons;
end;

procedure TfrmMain.odsListRepBeforeOpen(DataSet: TDataSet);
begin
  odsListRep.SetVariable('PSOTRID', pSOTRID);
end;

end.
