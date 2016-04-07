unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxSplitter, JvExControls,
  JvAnimatedImage, JvGIFCtrl, cxContainer, cxLabel, ExtCtrls, dxBar, DB,
  dxmdaset, Oracle, frxClass, frxDBSet, ActnList, ImgList, Menus, OracleData,
  JclFileUtils, cxGridExportLink, uGlobalConst, SMMainAPI;

type
  TfrmMain = class(TForm)
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    N2: TMenuItem;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbClose: TdxBarButton;
    bbParam: TdxBarButton;
    bbPrint: TdxBarButton;
    bbRefresh: TdxBarButton;
    bbResult: TdxBarButton;
    ilMain: TImageList;
    sdPopUp: TSaveDialog;
    alMain: TActionList;
    aClose: TAction;
    aParam: TAction;
    aPrint: TAction;
    aResult: TAction;
    aRefresh: TAction;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    frxRepProtocol: TfrxReport;
    frxRepPrint: TfrxReport;
    frxDBPrint: TfrxDBDataset;
    os: TOracleSession;
    dsJournal: TDataSource;
    oqThread: TOracleQuery;
    dxMemData1: TdxMemData;
    dxMemData1FK_ID: TIntegerField;
    dxMemData1KABNAME: TStringField;
    dxMemData1FD_RUN: TStringField;
    dxMemData1FIOPAC: TStringField;
    dxMemData1TYPEPAC: TStringField;
    dxBarDockControl1: TdxBarDockControl;
    paParam: TPanel;
    Splitter1: TSplitter;
    paMainParam: TPanel;
    cxLabel2: TcxLabel;
    lbDateBeg: TcxLabel;
    cxLabel3: TcxLabel;
    lbDateEnd: TcxLabel;
    paSubParam: TPanel;
    Animator1: TJvGIFAnimator;
    cxLabel6: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel4: TcxLabel;
    cxSplitter1: TcxSplitter;
    cxGr: TcxGrid;
    TV: TcxGridTableView;
    VFD_RUN: TcxGridColumn;
    VKAB: TcxGridColumn;
    VISSLNAME: TcxGridColumn;
    VFIOPAC: TcxGridColumn;
    VFK_ID: TcxGridColumn;
    VFD_ROJD: TcxGridColumn;
    VFD_RUN_TIME: TcxGridColumn;
    VTYPEPAC: TcxGridColumn;
    cxGrLevel1: TcxGridLevel;
    dxMemData1FD_ROJD: TDateField;
    dxMemData1ISSLNAME: TStringField;
    dxMemData1FD_RUN_TIME: TStringField;
    VISPOLFIO: TcxGridColumn;
    dxMemData1ISPOLFIO: TStringField;
    bbBase: TdxBarButton;
    aAllHistory: TAction;
    dxMemData1FK_PACID: TIntegerField;
    VFK_PACID: TcxGridColumn;
    VQUALITY: TcxGridColumn;
    dxMemData1XRAY_QUALITY: TStringField;
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure aParamExecute(Sender: TObject);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure aRefreshExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure frxRepPrintGetValue(const VarName: string; var Value: Variant);
    procedure aResultExecute(Sender: TObject);
    procedure frxRepProtocolGetValue(const VarName: string; var Value: Variant);
    procedure FormCreate(Sender: TObject);
    procedure aAllHistoryExecute(Sender: TObject);
  private

    sNameIssl_4rep : string;
    sNumIssl_4rep : string;
    sTextIssl_4rep : string;
    sSotrFIO_4rep : string;
    sDateSys_4Rep : string;
    dDateBeg, dDateEnd : TDateTime;
    sVrachFIO : String;
    dSysDate : TDateTime;
    procedure CheckEnabledButtons;
    { Private declarations }
  public
    bIsAdmin : Integer; // входит ли пользователь в группу "Администраторы" (1 - входит, 0 - нет)
    pSOTRID : Integer;
    MedotradeSign : string;
    get_issl_flu, get_xray_mrt, get_sum_doza : Integer;
    get_show_onhand : shortstring;
    get_db_name : string;
    sCompanyName_4Rep : String;
    sOtdelName_4Rep : String;
    procedure DoShowForm;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  bbr : Boolean;
  StartTime: TTime;
  get_neyav, get_nazcancel, get_vipnaz, get_rad_petct, get_rad_gamma : Integer;

implementation
uses uPeriod, fAllHistory;
{$R *.dfm}
const
   oqAdm = ' SELECT FK_ID, FD_RUN, TO_CHAR(FD_RUN, ''DD.MM.YYYY HH24:MI'') AS FD_RUN_TIME, FK_NAZSOSID, FK_ISPOLID, FK_PACID, '+#13+
           '        (select ASU.DO_VRACHFIO(FK_ISPOLID) from asu.tnazis where fk_id = t.fk_nazowner) AS ISPOLFIO, '+#13+
           '        (SELECT FC_NAME FROM ASU.TKABINET WHERE FK_ID = (SELECT FK_ROOMID FROM ASU.VNAZ WHERE FK_ID = T.FK_NAZOWNER)) AS KABINET, '+#13+
           '        ''Контрольное описание к протоколу № ''|| '+#13+
           '        (SELECT MAX(FC_CHAR) '+#13+
           '           FROM ASU.TIB '+#13+
           '          WHERE FK_PACID = (SELECT FK_ID FROM ASU.VNAZ WHERE FK_ID = T.FK_NAZOWNER) '+#13+
           '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL''))||'' ''|| '+#13+
           '        ASU.GET_NAME_RGISSL((SELECT FK_SMID FROM ASU.VNAZ WHERE FK_ID = T.FK_NAZOWNER)) AS FC_NAME, '+#13+
           '        ASU.PKG_REGIST_PACFUNC.GET_PAC_FIO(FK_PACID) FIOPAC, '+#13+
           '        (SELECT FD_ROJD FROM ASU.TPEOPLES WHERE FK_ID = (SELECT FK_PEPLID FROM ASU.TKARTA WHERE FK_ID = T.FK_PACID '+#13+
           '                                                         UNION ALL '+#13+
           '                                                         SELECT FK_PEPLID FROM ASU.TAMBULANCE WHERE FK_ID = T.FK_PACID)) FD_ROJD, '+#13+
           '        DECODE(ASU.IS_AMBULANCE(T.FK_PACID), 1, ''амбулаторный'', 0, ''стационарный'') AS TYPEPAC, '+#13+
           '        (select asu.get_smidname(fk_smid) '+#13+
           '           from asu.tib '+#13+
           '          where fk_pacid = (SELECT FK_ID FROM ASU.VNAZ WHERE FK_ID = T.FK_NAZOWNER) '+#13+
           '            and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''XRAY_QUALITY'')) as xray_quality '+#13+
           '   FROM ASU.VNAZ T '+#13+
           '  WHERE FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_CONTROL_PROTOCOL'') '+#13+
           '    AND FD_RUN >= :PFD_DATE1 '+#13+
           '    AND FD_RUN <= :PFD_DATE2 '+#13+
//           '    AND FK_ISPOLID = :PSOTRID '+#13+
           ' ORDER BY FD_RUN ';
{ TfrmMain }

procedure TfrmMain.aAllHistoryExecute(Sender: TObject);
var ods : TOracleDataSet;
    idPepl : Integer;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select asu.get_peplid(:pfk_pacid) as peplid from dual ';
    ods.DeclareAndSet('pfk_pacid', otInteger, TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFK_PACID.Index]);
    ods.Open;
    idPepl := ods.FieldByName('peplid').AsInteger;
  finally
    ods.Free;
  end;
  Application.CreateForm(TfrmAllHistory, frmAllHistory);
  try
    frmAllHistory.DoShowForm(idPepl,
                             TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFIOPAC.Index],
                             TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFK_PACID.Index]);
    frmAllHistory.ShowModal;
  finally
    frmAllHistory.Free;
  end;
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.aParamExecute(Sender: TObject);
begin
  with TfrmParamDate.Create(Self) do
    begin
      if Execute then
        begin
      if ModalResult = MrOK then
        begin
          dDateBeg := Period.First;
          dDateEnd := StrToDateTime(FormatDateTime('dd.mm.yyyy', Period.Last)+' 23:59:59');
          lbDateBeg.Caption := DateTimeToStr(Period.First);
          lbDateEnd.Caption := DateTimeToStr(Trunc(Period.Last));

          bbr := False;
          aRefresh.Enabled := False;
          aParam.Enabled := False;
          aResult.Enabled := False;
          aPrint.Enabled := False;
          aAllHistory.Enabled := False;

          cxLabel6.Caption := '';
          cxLabel5.Caption := '';
          cxLabel4.Caption := 'Выполняется запрос к Базе Данных...';

          if TV.DataController.LockCount = 0 then
            TV.BeginUpdate;
          TV.DataController.RecordCount := 0;
          while TV.DataController.LockCount > 0 do
            TV.EndUpdate;
          cxGr.Refresh;
          dxMemData1.Close;
          dxMemData1.Open;
          paParam.Visible := True;
          paSubParam.Visible := True;
          cxSplitter1.Visible := True;
          StartTime:= Now;
          cxLabel6.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
          cxLabel6.Refresh;
          oqThread.Scrollable := True;
          Animator1.Animate := True;
          if bIsAdmin = 1 then
            begin
              oqThread.SQL.Text := oqAdm;
              oqThread.SetVariable('PFD_DATE1', dDateBeg);
              oqThread.SetVariable('PFD_DATE2', dDateEnd);
            end else
            begin
              oqThread.SetVariable('PFD_DATE1', dDateBeg);
              oqThread.SetVariable('PFD_DATE2', dDateEnd);
              oqThread.DeclareAndSet('PSOTRID', otInteger, pSOTRID);
            end;
          oqThread.Execute;
        end;
        end;
    Free;
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
  frxRepPrint.ShowReport;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin
  if paParam.Visible = True then
    begin
      aRefresh.Enabled := False;
      aParam.Enabled := False;
      aResult.Enabled := False;
      aPrint.Enabled := False;
      aAllHistory.Enabled := False;
      cxLabel4.Caption := 'Выполняется запрос к Базе Данных...';
      if TV.DataController.LockCount = 0 then
        TV.BeginUpdate;
      TV.DataController.RecordCount := 0;
      while TV.DataController.LockCount > 0 do
        TV.EndUpdate;
      cxGr.Refresh;
      dxMemData1.Close;
      dxMemData1.Open;
      StartTime:= Now;
      oqThread.Scrollable := True;
      Animator1.Animate := True;
      if bIsAdmin = 1 then
        begin
          oqThread.SetVariable('PFD_DATE1', dDateBeg);
          oqThread.SetVariable('PFD_DATE2', dDateEnd);
        end else
        begin
          oqThread.SetVariable('PFD_DATE1', dDateBeg);
          oqThread.SetVariable('PFD_DATE2', dDateEnd);
          oqThread.DeclareAndSet('PSOTRID', otInteger, pSOTRID);
        end;
      oqThread.Execute;
    end;
end;

procedure TfrmMain.aResultExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_ID, '+
                    '        ASU.GET_NAME_RGISSL((SELECT FK_SMID FROM ASU.VNAZ WHERE FK_ID = T.FK_NAZOWNER)) AS FC_NAME, '+
                    '        ASU.DO_VRACHFIO(FK_ISPOLID) AS VRACHFIO, '+
                    '        (SELECT FB_TEXT FROM ASU.TRICHVIEWDATA WHERE FK_PACID = T.FK_ID) AS TEXTISSL, '+
                    '        (SELECT MAX(FC_CHAR) '+
                    '           FROM ASU.TIB '+
                    '          WHERE FK_PACID = (SELECT FK_ID '+
                    '                              FROM ASU.VNAZ '+
                    '                             WHERE FK_ID = T.FK_NAZOWNER) '+
                    '            AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL'')) AS NUMBER_ISSL '+
                    '   FROM ASU.VNAZ T '+
                    '  WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFK_ID.Index]);
    ods.Open;
    sSotrFIO_4rep := ods.FieldByName('VRACHFIO').AsString;
    sTextIssl_4rep := ods.FieldByName('TEXTISSL').AsString;
    sNumIssl_4rep := ods.FieldByName('NUMBER_ISSL').AsString;
    sNameIssl_4rep := ods.FieldByName('FC_NAME').AsString;
  finally
    ods.Free;
  end;
  frxRepProtocol.ShowReport;
end;

procedure TfrmMain.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.CheckEnabledButtons;
begin
  aResult.Enabled := oqThread.RowCount <> 0;
  aPrint.Enabled := oqThread.RowCount <> 0;
  aAllHistory.Enabled := oqThread.RowCount <> 0;
end;

procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  ods := TOracleDataSet.Create(nil);
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_SOTRID, asu.DO_VRACHFIO(FK_SOTRID) AS VRACHFIO, TRUNC(SYSDATE) AS DATESYS, '+#13+
                    '        ASU.PKG_SMINI.READSTRING (''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME, '+#13+
                    '        ASU.GET_ADMINS_FOR_XRAY(FK_SOTRID) AS IS_ADMIN, '+#13+
                    '        (SELECT FC_NAME '+#13+
                    '           FROM asu.TOTDEL '+#13+
                    '          WHERE FK_ID = (SELECT FK_OTDID FROM asu.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME '+#13+
                    '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, StrToInt(paramstr(1)));
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    sVrachFIO := ods.FieldByName('VRACHFIO').AsString;
    dSysDate := ods.FieldByName('DATESYS').AsDateTime;
    sCompanyName_4Rep := ods.FieldByName('COMPANYNAME').AsString;
    frmMain.Caption := 'ЖУРНАЛ КОНТРОЛЯ('+Ver.FileVersion+'). Пользователь: '+sVrachFIO;
    sOtdelName_4Rep := ods.FieldByName('OTDELNAME').AsString;
    bIsAdmin := ods.FieldByName('IS_ADMIN').AsInteger;
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select asu.get_xray_flu, asu.get_nazcancel, asu.get_neyav, asu.get_xray_mrt, asu.get_vipnaz, '+#13+
                    '        ASU.PKG_SMINI.READSTRING(''CONFIG'', ''DB_NAME'', ''H'') AS DB_NAME, '+#13+
                    '        asu.get_rad_gamma, asu.get_rad_petct '+#13+
                    '   from dual ';
    ods.Open;
    get_issl_flu := ods.FieldByName('get_xray_flu').AsInteger;
    get_nazcancel := ods.FieldByName('get_nazcancel').AsInteger;
    get_neyav := ods.FieldByName('get_neyav').AsInteger;
    get_xray_mrt := ods.FieldByName('get_xray_mrt').AsInteger;
    get_vipnaz := ods.FieldByName('get_vipnaz').AsInteger;
    get_db_name := ods.FieldByName('db_name').AsString;
    get_rad_gamma := ods.FieldByName('get_rad_gamma').AsInteger;
    get_rad_petct := ods.FieldByName('get_rad_petct').AsInteger;
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fc_value, fc_key from asu.tsmini where fc_section = ''XRAY'' order by fk_id ';
    ods.Open;
    ods.First;
    while not ods.Eof do
      begin
        if ods.FieldByName('fc_key').AsString = 'XRAY_SHOW_ONHAND' then // Показывать "от руки" в форме Отмена
          begin
            get_show_onhand := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_SUMDOZA' then // Годовая эффективная доза
          begin
            get_sum_doza := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
        ods.Next;
      end;
  finally
    ods.Free;
    Ver.Free;
  end;
  aResult.Enabled := False;
  aPrint.Enabled := False;
  aAllHistory.Enabled := False;

  MedotradeSign := ReadMedotradeSign;

  TV.StoreToRegistry('\SoftWare\SoftMaster\ControlProtocol\fMain\TVVrach_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'TV');
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\ControlProtocol\fMain\TVVrach_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'TV');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из приложения ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    action := caFree
  else
    action := caNone;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TV.StoreToRegistry('\SoftWare\SoftMaster\ControlProtocol\fMain\TVVrach_' + IntToStr(pSOTRID), TRUE, [], 'TV');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
  frmMain.WindowState := wsMaximized;
end;

procedure TfrmMain.frxRepPrintGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'VSEGO' then Value := oqThread.RowCount;
  if VarName = 'SYSDATE' then Value := sDateSys_4Rep;
  if VarName = 'SOTRNAME' then Value := sVrachFIO;
  if VarName = 'DATE1' then Value := dDateBeg;
  if VarName = 'DATE2' then Value := DateTimeToStr(Trunc(dDateEnd));
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;  
end;

procedure TfrmMain.frxRepProtocolGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;

  if VarName = 'PACFIO' then Value := TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFIOPAC.Index];
  if VarName = 'DATE_ROJD' then Value := TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFD_ROJD.Index];

  if VarName = 'NAMEISSL' then Value := sNameIssl_4rep;
  if VarName = 'DATEISSL' then Value := TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFD_RUN_TIME.Index];
  if VarName = 'TEXTISSL' then Value := sTextIssl_4rep;
  if VarName = 'NUMISSL' then Value := sNumIssl_4rep;
  if VarName = 'SOTR' then Value := sSotrFIO_4rep;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\ControlProtocol\fMain\TV'+'Vrach'+ '_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TV');
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
  Animator1.Animate := False;
  if bbr then
    cxLabel4.Caption := 'При выполнении запроса произошла ошибка!'
  else
    cxLabel4.Caption := 'Запрос к Базе Данных выполнился успешно!';

  aResult.Enabled := True;
  aPrint.Enabled := True;
  aRefresh.Enabled := True;
  aParam.Enabled := True;
  aAllHistory.Enabled := True;

  CheckEnabledButtons;
end;

procedure TfrmMain.oqThreadThreadRecord(Sender: TOracleQuery);
begin
  TV.BeginUpdate;
  TV.DataController.RecordCount := TV.DataController.RecordCount + 1;
  with TV.DataController do
  begin
    try
      Values[TV.DataController.RecordCount - 1, VFK_ID.Index] := Sender.Field('FK_ID');
      Values[TV.DataController.RecordCount - 1, VKAB.Index] := Sender.Field('KABINET');
      Values[TV.DataController.RecordCount - 1, VFD_RUN.Index] := Sender.Field('FD_RUN');
      Values[TV.DataController.RecordCount - 1, VFIOPAC.Index] := Sender.Field('FIOPAC');
      Values[TV.DataController.RecordCount - 1, VISSLNAME.Index] := Sender.Field('FC_NAME');
      Values[TV.DataController.RecordCount - 1, VFD_ROJD.Index] := Sender.Field('FD_ROJD');
      Values[TV.DataController.RecordCount - 1, VFD_RUN_TIME.Index] := Sender.Field('FD_RUN_TIME');
      Values[TV.DataController.RecordCount - 1, VTYPEPAC.Index] := Sender.Field('TYPEPAC');
      Values[TV.DataController.RecordCount - 1, VISPOLFIO.Index] := Sender.Field('ISPOLFIO');
      Values[TV.DataController.RecordCount - 1, VFK_PACID.Index] := Sender.Field('FK_PACID');
      Values[TV.DataController.RecordCount - 1, VQUALITY.Index] := Sender.Field('XRAY_QUALITY');
      dxMemData1.Insert;

      dxMemData1.FieldByName('KABNAME').AsString := Sender.Field('KABINET');
      dxMemData1.FieldByName('FD_RUN').AsString := Sender.Field('FD_RUN_TIME');
      dxMemData1.FieldByName('FIOPAC').AsString := Sender.Field('FIOPAC');
      dxMemData1.FieldByName('ISSLNAME').AsString := Sender.Field('FC_NAME');
      dxMemData1.FieldByName('FD_RUN_TIME').AsString := Sender.Field('FD_RUN_TIME');
      dxMemData1.FieldByName('TYPEPAC').AsString := Sender.Field('TYPEPAC');
      dxMemData1.FieldByName('ISPOLFIO').AsString := Sender.Field('ISPOLFIO');
      dxMemData1.FieldByName('FK_PACID').AsInteger := Sender.Field('FK_PACID');
      dxMemData1.FieldByName('XRAY_QUALITY').AsString := Sender.Field('XRAY_QUALITY');
      dxMemData1.Post;
      dxMemData1.Next;
    finally
    end;
  end;
  TV.EndUpdate;
  cxLabel6.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel6.Refresh;
  cxLabel5.Caption := 'Выбрано ' + IntToStr(TV.DataController.RecordCount) + ' записей.';
  cxLabel5.Refresh;
end;

end.
