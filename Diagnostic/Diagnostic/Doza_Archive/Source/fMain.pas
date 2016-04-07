unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinOffice2007Green, cxStyles, cxGraphics, cxEdit,
  cxDBLookupComboBox, cxCalendar, cxButtonEdit, cxDropDownEdit, cxSpinEdit,
  cxCheckBox, cxMaskEdit, cxSplitter, cxVGrid, cxInplaceContainer, cxControls,
  cxContainer, cxLabel, JvExControls, JvAnimatedImage, JvGIFCtrl, ExtCtrls,
  dxSkinsdxBarPainter, dxBar, ActnList, dxBarExtItems, cxClasses,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Oracle, OracleData, JclFileUtils, uGlobalConst, SMMainAPI,
  dxmdaset, frxClass, frxDBSet, Menus, ImgList, cxGridExportLink;

type
  TfrmMain = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbParam: TdxBarLargeButton;
    bbRef: TdxBarLargeButton;
    bbPrint: TdxBarLargeButton;
    bbClose: TdxBarLargeButton;
    al: TActionList;
    aParam: TAction;
    aRef: TAction;
    aPrint: TAction;
    aClose: TAction;
    paParam: TPanel;
    Splitter1: TSplitter;
    paMainParam: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    lbDate: TcxLabel;
    paSubParam: TPanel;
    Animator1: TJvGIFAnimator;
    cxLabel6: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel4: TcxLabel;
    cxSplitter1: TcxSplitter;
    grListLevel1: TcxGridLevel;
    grList: TcxGrid;
    os: TOracleSession;
    lbDoza: TcxLabel;
    tvList: TcxGridTableView;
    dxMemData1: TdxMemData;
    oqThread: TOracleQuery;
    tvListFIO: TcxGridColumn;
    tvListBith: TcxGridColumn;
    tvListAge: TcxGridColumn;
    tvListSex: TcxGridColumn;
    tvListDoza: TcxGridColumn;
    tvListPeplid: TcxGridColumn;
    dxMemData1fio: TStringField;
    dxMemData1bith: TDateField;
    dxMemData1age: TIntegerField;
    dxMemData1sex: TStringField;
    dxMemData1doza: TFloatField;
    acEnable: TAction;
    dxMemData1peplid: TIntegerField;
    bbBase: TdxBarLargeButton;
    aBase: TAction;
    frRep: TfrxReport;
    frDB: TfrxDBDataset;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    N2: TMenuItem;
    sdPopUp: TSaveDialog;
    ilMain: TImageList;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    tvListStatusIB: TcxGridColumn;
    dxMemData1statusib: TStringField;
    N3: TMenuItem;
    aRefreshDoza: TAction;
    N4: TMenuItem;
    procedure aParamExecute(Sender: TObject);
    procedure aRefExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure FormCreate(Sender: TObject);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure acEnableExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aBaseExecute(Sender: TObject);
    procedure frRepGetValue(const VarName: string; var Value: Variant);
    procedure N2Click(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aRefreshDozaExecute(Sender: TObject);
  private
    pAPPSOTRID : Integer;
    sVrachFIO, sDateSys_4Rep : string;
    nDoza : Integer;
    dSysDate, dDate : TDateTime;
    { Private declarations }
  public
    pSOTRID, get_issl_flu, get_sum_doza, get_xray_mrt, bIsAdmin : Integer;
    get_db_name, get_show_onhand, sCompanyName_4Rep, sOtdelName_4Rep, MedotradeSign : string;
    procedure DoShowForm;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  bbr : Boolean;
  StartTime: TTime;
  get_nazcancel, get_neyav, get_vipnaz : Integer;
implementation

uses fSetParam, fAllHistory;

{$R *.dfm}

procedure TfrmMain.aBaseExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmAllHistory, frmAllHistory);
  try
    frmAllHistory.WindowState := wsMaximized;
    frmAllHistory.odsList.SQL.Text := frmAllHistory.odsList4Archive.SQL.Text;
    frmAllHistory.DoShowForm(tvList.DataController.Values[tvList.DataController.FocusedRecordIndex, tvListPeplid.Index],
                             tvList.DataController.Values[tvList.DataController.FocusedRecordIndex, tvListFIO.Index],
                             1); 
    frmAllHistory.ShowModal;
  finally
    frmAllHistory.Free;
  end;
end;

procedure TfrmMain.acEnableExecute(Sender: TObject);
var i : Integer;
begin
  for i := 0 to tvList.DataController.LockCount - 1 do
    tvList.EndUpdate;
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.aParamExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSetParam, frmSetParam);
  try
    if nDoza <> 0 then
      begin
        frmSetParam.deDate.Date := StrToDateTime(lbDate.Caption);
        frmSetParam.seDoza.Value := nDoza;
      end else
      begin
        frmSetParam.deDate.Date := dSysDate;
        frmSetParam.seDoza.Value := get_sum_doza;
      end;
    frmSetParam.ShowModal;
    if frmSetParam.ModalResult = mrOk then
      begin
        nDoza := frmSetParam.seDoza.Value;
        dDate := StrToDateTime(FormatDateTime('dd.mm.yyyy', frmSetParam.deDate.Date)+' 23:59:59');
        paParam.Visible := True;
        paSubParam.Visible := True;
        lbDate.Caption := DateTimeToStr(frmSetParam.deDate.Date);
        lbDoza.Caption := IntToStr(frmSetParam.seDoza.Value)+' мЗв';

        bbr := False;
        aRef.Enabled := False;
        aParam.Enabled := False;
        aPrint.Enabled := False;
        aBase.Enabled := False;

        cxLabel6.Caption := '';
        cxLabel5.Caption := '';
        cxLabel4.Caption := 'Выполняется запрос к Базе Данных...';

        if tvList.DataController.LockCount = 0 then
          tvList.BeginUpdate;
        tvList.DataController.RecordCount := 0;
        while tvList.DataController.LockCount > 0 do
          tvList.EndUpdate;
        grList.Refresh;
        dxMemData1.Close;
        dxMemData1.Open;
        cxSplitter1.Visible := True;
        StartTime := Now;
        cxLabel6.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
        cxLabel6.Refresh;
        oqThread.Scrollable := True;
        Animator1.Animate := True;
        oqThread.SetVariable('pfn_num', nDoza);
        oqThread.SetVariable('pfd_date', dDate);
        oqThread.Execute;
      end;
  finally
    frmSetParam.Free;
  end; 
end;

procedure TfrmMain.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
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
  frRep.ShowReport;
end;

procedure TfrmMain.aRefExecute(Sender: TObject);
begin
  if nDoza <> 0 then
    begin
      aRef.Enabled := False;
      aParam.Enabled := False;
      aPrint.Enabled := False;
      aBase.Enabled := False;
      aRefreshDoza.Enabled := False;

      cxLabel4.Caption := 'Выполняется запрос к Базе Данных...';
      if tvList.DataController.LockCount = 0 then
        tvList.BeginUpdate;
      tvList.DataController.RecordCount := 0;
      while tvList.DataController.LockCount > 0 do
        tvList.EndUpdate;
      grList.Refresh;
      dxMemData1.Close;
      dxMemData1.Open;
      StartTime:= Now;
      oqThread.Scrollable := True;
      Animator1.Animate := True;
      oqThread.SetVariable('pfn_num', nDoza);
      oqThread.SetVariable('pfd_date', dDate);
      oqThread.Execute;
    end;
end;

procedure TfrmMain.aRefreshDozaExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Cursor := crHourGlass;
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.SQL.Text := ' begin asu.do_update_doza(:pfk_peplid); end; ';
    oq.DeclareAndSet('pfk_peplid', otInteger, tvList.DataController.Values[tvList.DataController.FocusedRecordIndex, tvListPeplid.Index]);
    oq.Execute;
    os.Commit;
  finally
    oq.Free;
    Cursor := crDefault;
  end;
  MessageDlg('Нажмите кнопку "Обновить", чтобы изменения вступили в силу!', mtInformation, [mbOK], 0);
end;

procedure TfrmMain.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    ExportGridToText(sdPopUp.FileName, grList, TRUE, TRUE);
end;

procedure TfrmMain.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    ExportGridToHTML(sdPopUp.FileName, grList, TRUE, TRUE);
end;

procedure TfrmMain.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    ExportGridToExcel(sdPopUp.FileName, grList, TRUE, TRUE);
end;

procedure TfrmMain.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    ExportGridToXML(sdPopUp.FileName, grList, TRUE, TRUE);
end;

procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  pAPPSOTRID := StrToInt(paramstr(1));
  ods := TOracleDataSet.Create(nil);
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select fk_sotrid, do_vrachfio(fk_sotrid) as vrachfio, trunc(sysdate) as datesys, '+#13+
                    '        asu.pkg_smini.readstring (''CONFIG'', ''S_FULLNAME'', '''') as companyname, '+#13+
                    '        (select fc_name '+#13+
                    '           from asu.totdel '+#13+
                    '          where fk_id = (select fk_otdid from asu.tsotr where fk_id = tappsotr.fk_sotrid)) as otdelname, '+#13+
                    '        asu.get_admins_for_xray(fk_sotrid) as is_admin '+#13+
                    '   from login.tappsotr where fl_del <> 1 and fk_id = :pfk_id ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    sVrachFIO := ods.FieldByName('VRACHFIO').AsString;
    dSysDate := ods.FieldByName('DATESYS').AsDateTime;
    sCompanyName_4Rep := ods.FieldByName('COMPANYNAME').AsString;
    frmMain.Caption := 'Контроль доз('+Ver.FileVersion+'). Пользователь: '+sVrachFIO;
    sOtdelName_4Rep := ods.FieldByName('OTDELNAME').AsString;
    bIsAdmin := ods.FieldByName('IS_ADMIN').AsInteger;

    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select (select fk_id from asu.tsmid where fc_synonim = ''ISSLED_FLUROGR'') as get_issl_flu, '+#13+
                    '        asu.get_nazcancel, asu.get_neyav, asu.get_xray_mrt, asu.get_vipnaz, '+#13+
                    '        asu.pkg_smini.readstring(''CONFIG'', ''DB_NAME'', ''H'') as db_name '+#13+
                    '   from dual ';
    ods.Open;
    get_issl_flu := ods.FieldByName('get_issl_flu').AsInteger;
    get_nazcancel := ods.FieldByName('get_nazcancel').AsInteger;
    get_neyav := ods.FieldByName('get_neyav').AsInteger;
    get_xray_mrt := ods.FieldByName('get_xray_mrt').AsInteger;
    get_db_name := ods.FieldByName('db_name').AsString;
    get_vipnaz := ods.FieldByName('get_vipnaz').AsInteger;

    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT FC_VALUE, FC_KEY FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' ORDER BY FK_ID ';
//    ods.SQL.Text := ' select fc_value from asu.tsmini where fc_section = ''XRAY'' and fc_key = ''XRAY_SUMDOZA'' ';
    ods.Open;
    ods.First;
    while not ods.Eof do
      begin
        if ods.FieldByName('fc_key').AsString = 'XRAY_SHOW_ONHAND' then // Показывать "от руки" в форме Отмена
          begin
            get_show_onhand := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_SUMDOZA' then // Эффективная годовая доза
          begin
            get_sum_doza := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
        ods.Next;
      end;
  finally
    ods.Free;
    Ver.Free;
  end;
  aPrint.Enabled := False;
  aBase.Enabled := False;
  aRefreshDoza.Visible := bIsAdmin = 1;
  aRefreshDoza.Enabled := False;
  MedotradeSign := ReadMedotradeSign;
  tvList.StoreToRegistry('\SoftWare\SoftMaster\Doza_Archive\fMain\tvListVrach_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'tvList');
  tvList.RestoreFromRegistry('\SoftWare\SoftMaster\Doza_Archive\fMain\tvListVrach_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'tvList');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы действительно хотите закрыть программу ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    begin
      action := caFree; // !!! BreakThread 
    end else
    begin
      action := caNone;
    end;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  tvList.StoreToRegistry('\SoftWare\SoftMaster\Doza_Archive\fMain\tvListVrach_' + IntToStr(pSOTRID), TRUE, [], 'tvList');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
  nDoza := 0;
end;

procedure TfrmMain.frRepGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'DATESYS' then Value := sDateSys_4Rep;
  if VarName = 'SOTR' then Value := sVrachFIO;
  if VarName = 'DATA' then Value := lbDate.Caption;
  if VarName = 'DOZA' then Value := nDoza;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  tvList.RestoreFromRegistry('\SoftWare\SoftMaster\Doza_Archive\fMain\tvListVrach_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'tvList');
end;

procedure TfrmMain.oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer; const ErrorMessage: string);
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
  if bbr then
    cxLabel4.Caption := 'При выполнении запроса произошла ошибка!'
  else
    cxLabel4.Caption := 'Запрос к Базе Данных выполнился успешно!';

  aPrint.Enabled := oqThread.RowCount > 0;
  aBase.Enabled := oqThread.RowCount > 0;
  aRefreshDoza.Enabled := oqThread.RowCount > 0;
  aRef.Enabled := True;
  aParam.Enabled := True;
end;

procedure TfrmMain.oqThreadThreadRecord(Sender: TOracleQuery);
begin
  tvList.BeginUpdate;
  tvList.DataController.RecordCount := tvList.DataController.RecordCount + 1;
  with tvList.DataController do
  begin
    try
      Values[tvList.DataController.RecordCount - 1, tvListFIO.Index] := Sender.Field('fio');
      Values[tvList.DataController.RecordCount - 1, tvListBith.Index] := Sender.Field('bith');
      Values[tvList.DataController.RecordCount - 1, tvListAge.Index] := Sender.Field('age');
      Values[tvList.DataController.RecordCount - 1, tvListSex.Index] := Sender.Field('sex');
      Values[tvList.DataController.RecordCount - 1, tvListDoza.Index] := Sender.Field('doza');
      Values[tvList.DataController.RecordCount - 1, tvListPeplid.Index] := Sender.Field('fk_peplid');
      Values[tvList.DataController.RecordCount - 1, tvListStatusIB.Index] := Sender.Field('statusib');
      dxMemData1.Insert;
      dxMemData1.FieldByName('fio').AsString := Sender.Field('fio');
      dxMemData1.FieldByName('bith').AsDateTime := Sender.Field('bith');
      dxMemData1.FieldByName('age').AsInteger := Sender.Field('age');
      dxMemData1.FieldByName('sex').AsString := Sender.Field('sex');
      dxMemData1.FieldByName('doza').AsFloat := Sender.Field('doza');
      dxMemData1.FieldByName('peplid').AsInteger := Sender.Field('fk_peplid');
      dxMemData1.FieldByName('statusib').AsString := Sender.Field('statusib');
      dxMemData1.Post;
      dxMemData1.Next;
    finally
    end;
  end;
  tvList.EndUpdate;
  cxLabel6.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel6.Refresh;
  cxLabel5.Caption := 'Выбрано ' + IntToStr(tvList.DataController.RecordCount) + ' записей.';
  cxLabel5.Refresh;
end;

procedure TfrmMain.osAfterLogOn(Sender: TOracleSession);
var Ver: TJclFileVersionInfo;
begin
  Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    Sender.DBMS_Application_Info.Set_Module(ExtractFileName(ParamStr(0)) + ' (' + Ver.FileVersion + ')', Self.Name + ' "' + Self.Caption + '"');
  finally
    Ver.Free;
  end;
end;

end.
