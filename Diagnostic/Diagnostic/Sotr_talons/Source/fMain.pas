unit fMain;
// ОКБ Ханты - Сосновская КДП - 179105
// Кардио Агапов 419022
// Междуреченск Admin 160524
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OracleData, JclFileUtils, Oracle, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinsdxBarPainter, ImgList, ActnList, dxBar,
  cxClasses, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, jvDBUtils, cxContainer, cxLabel, ExtCtrls, cxSplitter, frxClass,
  frxDBSet, Menus, cxGridExportLink, JvExControls, JvAnimatedImage, JvGIFCtrl,
  dxmdaset, cxLookAndFeelPainters, StdCtrls, cxButtons, uGlobalConst, ShellAPI, SMMainAPI,
  dxSkinOffice2007Green, JvStringHolder, uGlobals;

type
  TInitPlugin = procedure(nPacid: Integer; nNazid: Integer; nSotrid : Integer); stdcall;
  TFreePlugin = function(): LongInt; stdcall;
  
  TfrmMain = class(TForm)
    os: TOracleSession;
    dxBarDockControl1: TdxBarDockControl;
    BMMain: TdxBarManager;
    alMain: TActionList;
    ILMain: TImageList;                                
    BMMainBar1: TdxBar;
    bbRefresh: TdxBarButton;
    aClose: TAction;
    bbClose: TdxBarButton;
    aRefresh: TAction;
    TVLIST: TcxGridDBTableView;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    dsList: TDataSource;
    bbParam: TdxBarButton;
    aParam: TAction;
    VLISTKABINET: TcxGridDBColumn;
    VLISTISSLNAME: TcxGridDBColumn;
    VLISTFD_NAZ: TcxGridDBColumn;
    paParam: TPanel;
    Splitter1: TSplitter;
    paMainParam: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    lbSotrFIO: TcxLabel;
    lbDateBeg: TcxLabel;
    cxLabel3: TcxLabel;
    lbDateEnd: TcxLabel;
    paSubParam: TPanel;
    cxSplitter1: TcxSplitter;
    VLISTFD_RUN: TcxGridDBColumn;
    VLISTFIOPAC: TcxGridDBColumn;
    VLISTSTATE: TcxGridDBColumn;
    VLISTTIME: TcxGridDBColumn;
    bbResult: TdxBarButton;
    bbPrint: TdxBarButton;
    aResult: TAction;
    aPrint: TAction;
    frxRepList: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    N2: TMenuItem;
    sdPopUp: TSaveDialog;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    Animator1: TJvGIFAnimator;
    cxLabel6: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel4: TcxLabel;
    oqThread: TOracleQuery;
    dxMemData1: TdxMemData;
    acEnable: TAction;
    TVSOTR: TcxGridTableView;
    VSOTRFIOPAC: TcxGridColumn;
    VSOTRFK_ID: TcxGridColumn;
    dxMemData1FC_FIO: TStringField;
    VSOTRNUMMK: TcxGridColumn;
    VSOTRSOS: TcxGridColumn;
    dxMemData1FC_IB: TStringField;
    dxMemData1SOS: TStringField;
    aOpenMK: TAction;
    bbOpenMK: TdxBarButton;
    VSOTRPACID: TcxGridColumn;
    dxMemData1FK_PACID: TIntegerField;
    dxMemData1FD_OPENED: TDateField;
    dxMemData1FD_CLOSED: TDateField;
    VSOTRFD_OPENED: TcxGridColumn;
    VSOTRFD_CLOSED: TcxGridColumn;
    VSOTRDIAG: TcxGridColumn;
    dxMemData1FC_DIAG: TStringField;
    VSOTRPEPLID: TcxGridColumn;
    dxMemData1PEPLID: TIntegerField;
    tmrCheckApplication: TTimer;
    bbTalon: TdxBarButton;
    aEditTalon: TAction;
    VSOTRNAZID: TcxGridColumn;
    dxMemData1NAZID: TIntegerField;
    VSOTRFIOPAC_SHORT: TcxGridColumn;
    strhSelects: TJvMultiStringHolder;
    VSOTRSOTR: TcxGridColumn;
    dxMemData1sotr: TStringField;
    dxMemData1Type_opl: TStringField;
    VSOTRType_opl: TcxGridColumn;
    dxMemData1FC_REASON: TStringField;
    VSOTRFC_REASON: TcxGridColumn;
    VSOTRFD_ROJD: TcxGridColumn;
    VSOTRFN_AGE: TcxGridColumn;
    VSOTRFC_RESULT: TcxGridColumn;
    VSOTRFC_DOPISHOD: TcxGridColumn;
    dxMemData1FD_ROJD: TDateTimeField;
    dxMemData1FN_AGE: TIntegerField;
    dxMemData1FC_RESULT: TStringField;
    dxMemData1FC_DOPISHOD: TStringField;
    VSOTRDISTRICT_NAME: TcxGridColumn;
    dxMemData1DISTRICT_NAME: TStringField;
    dxMemData1GR_ZDOROV: TStringField;
    VSOTRGR_ZDOROV: TcxGridColumn;
    VSOTRFC_WORKPLACE: TcxGridColumn;
    dxMemData1FC_WORKPLACE: TStringField;
    vSotrTalonid_id: TcxGridColumn;
    dxMemData1talonid_id: TIntegerField;
    dxBarButton1: TdxBarButton;
    acHint: TAction;
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aRefreshExecute(Sender: TObject);
    procedure aParamExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure frxRepListGetValue(const VarName: string; var Value: Variant);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure acEnableExecute(Sender: TObject);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure TVSOTRCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure TVSOTRFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure aOpenMKExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrCheckApplicationTimer(Sender: TObject);
    procedure aEditTalonExecute(Sender: TObject);
    procedure acHintExecute(Sender: TObject);
  private
    workmode : Integer;
    arFIO:array of string;
    MedotradeSign : string;
    sCompanyName, sOtdelName : String;
    GET_VIPNAZ : Integer;
    GET_LABVIP : Integer;
    sDateSys_4Rep : String;
    HandleDLL: THandle;
    InitPlugin: TInitPlugin;
    FreePlugin : TFreePlugin;
    procedure CheckEnabledButtons;
//    function WinExecAndWait32(FileName: string; Visibility: integer): integer;
    function RestoreApplication(AAppCaption:string):Boolean;    
    { Private declarations }
  public
    Russian : HKL;
    pIDSPEC : Integer;
    pAPPSOTRID : Integer;
    pSOTRID : Integer;
    sVrachFIO : String;
    pSPEC : Integer;
    dSysDate : TDateTime;
    idVAL : Integer;
    dDateBeg, dDateEnd : TDateTime;
    GET_XRAY_VRACH : Integer;
    GET_ZAV_SPEC : Integer;
    pOTDELID : Integer;
    procedure DoShowForm;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  StartTime: TTime;
  bbr: Boolean;

implementation

uses fSetParam, fSetSotr, fWait;

{$R *.dfm}

{ TfrmMain }

procedure TfrmMain.acEnableExecute(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to TVSOTR.DataController.LockCount - 1
  do TVSOTR.EndUpdate;
end;

procedure TfrmMain.acHintExecute(Sender: TObject);
begin
  Application.MessageBox('В отчет попадают талоны, открытые в указанный период. ' + #13#10 +
                         'Столбец статус показывает текущее состояние талона. Поле "Сотрудник"-это врач, выполнивший последнюю консультацию ИЛИ сотрудник, открывший талон.' + #13#10 +
                         'При этом талон может не иметь ни одной консультации.',
                         'Справка',
                         mb_ok + MB_ICONINFORMATION);
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.aEditTalonExecute(Sender: TObject);
var
  AmbTalon: THandle;
  InitPlugin: procedure (AppHandle: THandle; nPacID: Integer; nSotrID: Integer;
                         nDef: Integer; nTalonID: Integer); stdcall;
  str: string;
begin
  AmbTalon := LoadLibrary('AMBTalonDLL.dll');

  try
    if AmbTalon <> 0
    then begin
      @InitPlugin := GetProcAddress(AmbTalon, 'InitPluginModalDefTalon');

      if @InitPlugin = nil
      then Application.MessageBox('Функция InitPluginModalDefTalon не найдена в AMBTalonDLL.dll',
        'Внимание',
        MB_OK + MB_ICONEXCLAMATION);

      try
        InitPlugin(Application.Handle,
                     tvSotr.DataController.Values[tvSotr.DataController.FocusedRecordIndex, vSotrPacId.Index],
                     frmMain.pSotrID,
                      -1,
                     tvSotr.DataController.Values[tvSotr.DataController.FocusedRecordIndex, vSotrTalonid_id.Index]);
      except
        on E:  Exception do
          begin
            str :='Ошибка при запуске внешнего модуля AMBTalonDLL.dll'+sLineBreak+E.Message;
            Application.MessageBox(PChar(str), 'Ошибка', MB_OK + MB_ICONERROR);
          end;
      end;
    end
    else begin
      Application.MessageBox('Библиотека AMBTalonDLL.dll не найдена', 'Внимание', MB_OK + MB_ICONEXCLAMATION);
    end;
  finally
    FreeLibrary(AmbTalon);
  end;
end;

procedure TfrmMain.aOpenMKExecute(Sender: TObject);
var
  AppProcID: Integer;
  ods: TOracleDataSet;
  NUM_IB: String;
begin
  ods := TOracleDataSet.Create(nil);

  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT asu.pkg_regist_pacfunc.GET_PAC_IB(:PACID) NUM_IB FROM DUAL ';
    ods.DeclareAndSet('PACID', otInteger, tvSotr.DataController.Values[tvSotr.DataController.FocusedRecordIndex, vSotrPacId.Index]);
    ods.Open;

    NUM_IB := ods.FieldByName('NUM_IB').AsString;
  finally
    ods.Free;
  end;

  try
    if RestoreApplication(TVSOTR.DataController.Values[TVSOTR.DataController.FocusedRecordIndex, VSOTRFIOPAC_SHORT.Index] +
      ' - ' + NUM_IB)
    then Exit;

    SetLength(arFIO, Length(arFIO) + 1);
    arFIO[Length(arFIO) - 1] := TVSOTR.DataController.Values[TVSOTR.DataController.FocusedRecordIndex, VSOTRFIOPAC_SHORT.Index];
    aOpenMK.Enabled := False;
    Application.ProcessMessages;
    Screen.Cursor := crSQLWait;
    tmrCheckApplication.Enabled := True;

    AppProcID := AppStart(ExtractFilePath(paramstr(0))+'IBRazdel.exe', IntToStr(TVSOTR.DataController.Values[TVSOTR.DataController.FocusedRecordIndex, VSOTRPACID.Index])+' '+IntToStr(-1)+' '+IntToStr(-1));

    if AppProcID = -1
    then ShowMessage('Ошибка запуска приложения');

    ShowWait(TVSOTR.DataController.Values[TVSOTR.DataController.FocusedRecordIndex, VSOTRPACID.Index], True);
  finally
    Screen.Cursor := crDefault;
    aOpenMK.Enabled := True;
  end;

  if RestoreApplication(TVSOTR.DataController.Values[TVSOTR.DataController.FocusedRecordIndex, VSOTRFIOPAC_SHORT.Index])
  then Exit;
end;

procedure TfrmMain.aParamExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSetParam, frmSetParam);

  try
    if WorkMode = 1
    then frmSetParam.cbVar.Text := 'отделение'
    else frmSetParam.cbVar.Text := 'сотрудник';

    if idVal <> 0
    then begin
      frmSetParam.lbValue.Tag := idVAL;
      frmSetParam.lbValue.Caption := lbSotrFIO.Caption;
      frmSetParam.cxDateBeg.Date := dDateBeg;
      frmSetParam.cxDateEnd.Date := dDateEnd;
    end
    else begin
      frmSetParam.cxDateBeg.Date := dSysDate;
      frmSetParam.cxDateEnd.Date := dSysDate;
    end;

    frmSetParam.ShowModal;

    if frmSetParam.ModalResult = mrOK
    then begin
      if frmSetParam.cbVar.Text = 'отделение'
      then begin
        workmode := 1;
        VSOTRSOTR.Visible := True;
        VSOTRSOTR.VisibleForCustomization := True;
        oqThread.SQL.Text := strhSelects.StringsByName['OTDEL'].Text
      end
      else begin
        workmode := 2;
        VSOTRSOTR.Visible := False;
        VSOTRSOTR.VisibleForCustomization := False;
        oqThread.SQL.Text := strhSelects.StringsByName['SOTR'].Text;
      end;

      bbr := False;
      aRefresh.Enabled := False;
      aOpenMK.Enabled := False;
      aParam.Enabled := False;
      aResult.Enabled := False;
      aPrint.Enabled := False;
      aEditTalon.Enabled := False;
      cxLabel6.Caption := '';
      cxLabel5.Caption := '';
      cxLabel4.Caption := 'Выполняется запрос к Базе Данных...';

      if TVSOTR.DataController.LockCount = 0
      then TVSOTR.BeginUpdate;

      TVSOTR.DataController.RecordCount := 0;

      while TVSOTR.DataController.LockCount > 0 do
        TVSOTR.EndUpdate;

      cxGr.Refresh;
      dxMemData1.Close;
      dxMemData1.Open;
      idVAL := frmSetParam.lbValue.Tag;
      dDateBeg := frmSetParam.cxDateBeg.Date;
      dDateEnd := StrToDateTime(FormatDateTime('dd.mm.yyyy', frmSetParam.cxDateEnd.Date)+' 23:59:59');
      lbSotrFIO.Caption := frmSetParam.lbValue.Caption;
      lbDateBeg.Caption := frmSetParam.cxDateBeg.Text;
      lbDateEnd.Caption := frmSetParam.cxDateEnd.Text;
      paParam.Visible := True;
      paSubParam.Visible := True;
      cxSplitter1.Visible := True;

      StartTime:= Now;
      cxLabel6.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
      cxLabel6.Refresh;
      oqThread.Scrollable := True;
      Animator1.Animate := True;
      oqThread.SetVariable('PFK_SOTRID', idVAL);
      oqThread.SetVariable('PDATE1', dDateBeg);
      oqThread.SetVariable('PDATE2', dDateEnd);
      oqThread.Execute;
    end;
  finally
    frmSetParam.Free;
  end;
end;

procedure TfrmMain.aPrintExecute(Sender: TObject);
var
  ods: TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);

  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS DATESYS FROM DUAL ';
    ods.Open;
    sDateSys_4Rep := ods.FieldByName('DATESYS').AsString;
  finally
    ods.Free;
  end;

  frxRepList.ShowReport;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin
  if idVAL <> 0
  then begin
    aRefresh.Enabled := False;
    aOpenMK.Enabled := False;
    aParam.Enabled := False;
    aResult.Enabled := False;
    aPrint.Enabled := False;
    aEditTalon.Enabled := False;
    cxLabel4.Caption := 'Выполняется запрос к Базе Данных...';

    if TVSOTR.DataController.LockCount = 0
    then TVSOTR.BeginUpdate;

    TVSOTR.DataController.RecordCount := 0;

    while TVSOTR.DataController.LockCount > 0 do
        TVSOTR.EndUpdate;

    cxGr.Refresh;
    dxMemData1.Close;
    dxMemData1.Open;
    StartTime:= Now;
    oqThread.Scrollable := True;
    Animator1.Animate := True;
    oqThread.SetVariable('PFK_SOTRID', idVAL);
    oqThread.SetVariable('PDATE1', dDateBeg);
    oqThread.SetVariable('PDATE2', dDateEnd);
    oqThread.Execute;
  end;
end;

procedure TfrmMain.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';

  if sdPopUp.Execute
  then ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';

  if sdPopUp.Execute
  then ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';

  if sdPopUp.Execute
  then ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';

  if sdPopUp.Execute
  then ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.CheckEnabledButtons;
begin
  aPrint.Enabled := oqThread.RowCount > 0;
  aEditTalon.Enabled := oqThread.RowCount > 0;
  aResult.Enabled := oqThread.RowCount > 0;
  aOpenMK.Enabled := oqThread.RowCount > 0;
end;

procedure TfrmMain.DoShowForm;
var
  ods: TOracleDataSet;
  Ver: TJclFileVersionInfo;
begin
  pAPPSOTRID := StrToInt(paramstr(1));
  pIDSPEC := 0;
  ods := TOracleDataSet.Create(nil);
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));

  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_SOTRID, asu.DO_VRACHFIO(FK_SOTRID) AS VRACHFIO, TRUNC(SYSDATE) AS DATESYS, '+#13+
                    '        ASU.PKG_SMINI.READSTRING (''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME, '+#13+
                    '        asu.GET_VIPNAZ, asu.GET_NAZCANCEL, asu.GET_LABVIP, asu.GET_XRAY_VRACH, asu.GET_ZAVOTDEL, '+#13+
                    '        (SELECT FC_NAME '+#13+
                    '           FROM asu.TOTDEL '+#13+
                    '          WHERE FK_ID = (SELECT FK_OTDID FROM asu.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME '+#13+
                    '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    sVrachFIO := ods.FieldByName('VRACHFIO').AsString;
    dSysDate := ods.FieldByName('DATESYS').AsDateTime;
    sCompanyName := ods.FieldByName('COMPANYNAME').AsString;
    frmMain.Caption := 'Статистика по талонам('+Ver.FileVersion+'). Пользователь: '+sVrachFIO;
    GET_VIPNAZ := ods.FieldByName('GET_VIPNAZ').AsInteger;
    GET_LABVIP := ods.FieldByName('GET_LABVIP').AsInteger;
    GET_XRAY_VRACH := ods.FieldByName('GET_XRAY_VRACH').AsInteger;
    GET_ZAV_SPEC := ods.FieldByName('GET_ZAVOTDEL').AsInteger;
    sOtdelName := ods.FieldByName('OTDELNAME').AsString;
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT FK_OTDELID, FK_SPRAVID FROM TSOTR WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pSOTRID);
    ods.Open;
    pOTDELID := ods.FieldByName('FK_OTDELID').AsInteger;
  finally
    ods.Free;
    Ver.Free;
  end;

  aResult.Enabled := False;
  aPrint.Enabled := False;
  aOpenMK.Enabled := False;
  aEditTalon.Enabled := False;
  MedotradeSign := ReadMedotradeSign;
  TVSOTR.StoreToRegistry('\SoftWare\SoftMaster\Sotr_talons\fMain\TVLIST'+'Vrach'+ '_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'TVLIST');
  TVSOTR.RestoreFromRegistry('\SoftWare\SoftMaster\Sotr_talons\fMain\TVLIST'+'Vrach'+ '_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из приложения ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes
  then begin
    oqThread.BreakThread;
    action := caFree;
  end
  else action := caNone;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TVSOTR.StoreToRegistry('\SoftWare\SoftMaster\Sotr_talons\fMain\TVLIST'+'Vrach'+ '_' + IntToStr(pSOTRID), TRUE, [], 'TVLIST');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
  russian:=LoadKeyboardLayout('00000419', 0);
end;

procedure TfrmMain.frxRepListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName;
  if VarName = 'OTDELNAME' then Value := sOtdelName;
  if VarName = 'KOLVO' then Value := dsList.DataSet.RecordCount;
  if VarName = 'DATESYS' then Value := sDateSys_4Rep;
  if VarName = 'SOTR' then Value := sVrachFIO;
  if VarName = 'SOTRNAME' then Value := lbSotrFIO.Caption;
  if VarName = 'DATE1' then Value := dDateBeg;
  if VarName = 'DATE2' then Value := DateTimeToStr(Trunc(dDateEnd));
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  TVSOTR.RestoreFromRegistry('\SoftWare\SoftMaster\Sotr_talons\fMain\TVLIST'+'Vrach'+ '_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmMain.oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
  const ErrorMessage: string);
begin
  MessageDlg('Во время выполнения запроса произошла ошибка! Обратитесь к администратору системы!'+
             #13#10+'Код ошибки: '+IntToStr(ErrorCode)+
             #13#10+'Текст ошибки: '+ErrorMessage,
             mtError, [mbOK], 0);
  bbr := True;
end;

procedure TfrmMain.oqThreadThreadFinished(Sender: TOracleQuery);
begin
  acEnable.Execute;
  Animator1.Animate := False;

  if bbr
  then cxLabel4.Caption := 'При выполнении запроса произошла ошибка!'
  else cxLabel4.Caption := 'Запрос к Базе Данных выполнился успешно!';

  aRefresh.Enabled := True;
  aParam.Enabled := True;

  if oqThread.RowCount <> 0
  then tvSotr.ViewData.Rows[0].Focused := True;

  CheckEnabledButtons;
end;

procedure TfrmMain.oqThreadThreadRecord(Sender: TOracleQuery);
begin
  TVSOTR.BeginUpdate;
  TVSOTR.DataController.RecordCount := TVSOTR.DataController.RecordCount + 1;

  with TVSOTR.DataController do
  begin
    try
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFIOPAC.Index] := Sender.Field('FC_FIO');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRNUMMK.Index] := Sender.Field('FC_IB');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRSOS.Index] := Sender.Field('SOS');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRPACID.Index] := Sender.Field('FK_PACID');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFD_OPENED.Index] := Sender.Field('FD_OPENED');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFD_CLOSED.Index] := Sender.Field('FD_CLOSED');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRDIAG.Index] := Sender.Field('FC_DIAG');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRPEPLID.Index] := Sender.Field('FK_PEPLID');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFIOPAC_SHORT.Index] := Sender.Field('FC_FIO');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRSOTR.Index] := Sender.Field('ispolfio');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRType_opl.Index] := Sender.Field('Type_opl');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFC_REASON.Index] := Sender.Field('FC_REASON');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFD_ROJD.Index] := Sender.Field('FD_ROJD');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFN_AGE.Index] := Sender.Field('FN_AGE');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFC_RESULT.Index] := Sender.Field('FC_RESULT');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFC_DOPISHOD.Index] := Sender.Field('FC_DOPISHOD');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRDISTRICT_NAME.Index] := Sender.Field('DISTRICT_NAME');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRGR_ZDOROV.Index] := Sender.Field('GR_ZDOROV');
      Values[TVSOTR.DataController.RecordCount - 1, VSOTRFC_WORKPLACE.Index] := Sender.Field('FC_WORKPLACE');
      Values[TVSOTR.DataController.RecordCount - 1, vSotrTalonid_id.Index] := Sender.Field('talonid_id');

      dxMemData1.Insert;
      dxMemData1.FieldByName('FC_FIO').AsString := Sender.Field('FC_FIO');
      dxMemData1.FieldByName('FC_IB').AsString := Sender.Field('FC_IB');
      dxMemData1.FieldByName('SOS').AsString := Sender.Field('SOS');
      dxMemData1.FieldByName('FK_PACID').AsString := Sender.Field('FK_PACID');
      dxMemData1.FieldByName('FD_OPENED').AsString := Sender.Field('FD_OPENED');
      dxMemData1.FieldByName('FD_CLOSED').AsString := Sender.Field('FD_CLOSED');
      dxMemData1.FieldByName('FC_DIAG').AsString := Sender.Field('FC_DIAG');
      dxMemData1.FieldByName('PEPLID').AsString := Sender.Field('FK_PEPLID');
      dxMemData1.FieldByName('sotr').AsString := Sender.Field('ispolfio');
      dxMemData1.FieldByName('Type_opl').AsString := Sender.Field('Type_opl');
      dxMemData1.FieldByName('FC_REASON').AsString := Sender.Field('FC_REASON');
      dxMemData1.FieldByName('FD_ROJD').AsString := Sender.Field('FD_ROJD');
      dxMemData1.FieldByName('FN_AGE').AsString := Sender.Field('FN_AGE');
      dxMemData1.FieldByName('FC_RESULT').AsString := Sender.Field('FC_RESULT');
      dxMemData1.FieldByName('FC_DOPISHOD').AsString := Sender.Field('FC_DOPISHOD');
      dxMemData1.FieldByName('DISTRICT_NAME').AsString := Sender.Field('DISTRICT_NAME');
      dxMemData1.FieldByName('GR_ZDOROV').AsString := Sender.Field('GR_ZDOROV');
      dxMemData1.FieldByName('FC_WORKPLACE').AsString := Sender.Field('FC_WORKPLACE');
      dxMemData1.FieldByName('FC_WORKPLACE').AsInteger := Sender.Field('talonid_id');
      dxMemData1.Post;
      dxMemData1.Next;
    finally
    end;
  end;

  TVSOTR.EndUpdate;
  cxLabel6.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel6.Refresh;
  cxLabel5.Caption := 'Выбрано ' + IntToStr(TVSOTR.DataController.RecordCount) + ' записей.';
  cxLabel5.Refresh;
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
    if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0)
    then begin
      GetWindowText(Wnd, buff, sizeof(buff));

      if StrPas(buff) = AAppCaption
      then begin
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

  if not(tmrCheckApplication.Enabled)
  then exit;

  iDel:=0;

  for i:=0 to Length(arFIO)-1 do
  begin
    Wnd := GetWindow(Handle, gw_HWndFirst);

    while Wnd <> 0 do
    begin
      if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0)
      then begin
        GetWindowText(Wnd, buff, sizeof(buff));

        if StrPas(buff) = arFIO[i-iDel]
        then begin
          if IsWindowVisible(Wnd)
          then begin
            for j:=i-iDel to Length(arFIO)-2
            do arFIO[j]:=arFio[j+1];

            SetLength(arFIO,Length(arFIO)-1);
            Inc(iDel);

            if Length(arFIO) = 0
            then begin
              tmrCheckApplication.Enabled:=False;
              Screen.Cursor:=crDefault;
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

procedure TfrmMain.TVSOTRCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
//  if dsList.DataSet.RecordCount <> 0 then
//    begin
//      aResultExecute(nil);
//    end;
end;

procedure TfrmMain.TVSOTRFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
//  aResult.Enabled := TVSOTR.DataController.Values[TVSOTR.DataController.FocusedRecordIndex, VSOTRFK_NAZSOSID.Index] <> GET_LABVIP;
end;

end.
