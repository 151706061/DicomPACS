unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, cxStyles, cxGraphics, cxEdit, cxDBLookupComboBox,
  cxCalendar, cxButtonEdit, cxDropDownEdit, cxSpinEdit, cxCheckBox, cxSplitter,
  cxVGrid, cxInplaceContainer, cxControls, cxContainer, cxLabel, JvExControls,
  JvAnimatedImage, JvGIFCtrl, ExtCtrls, Oracle, SMMainAPI, JclFileUtils, ImgList,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridCustomView, cxGrid, DB, dxmdaset, cxTextEdit, OracleData,
  dxSkinsdxBarPainter, dxBar, ActnList, frxClass, frxDBSet, uGlobalConst,
  cxGridBandedTableView, dxSkinOffice2007Green;

type
  TfrmMain = class(TForm)
    paParam: TPanel;
    Panel1: TPanel;
    paSubParam: TPanel;
    Animator1: TJvGIFAnimator;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    VerticalGrid: TcxVerticalGrid;
    rowCategoryCommon: TcxCategoryRow;
    rowPeriodFrom: TcxEditorRow;
    rowPeriodTo: TcxEditorRow;
    rowIssl: TcxEditorRow;
    cxSplitter1: TcxSplitter;
    os: TOracleSession;
    rowOtdel: TcxEditorRow;
    ilSmall: TcxImageList;
    cxSplitter2: TcxSplitter;
    oqThread: TOracleQuery;
    dxMemData1: TdxMemData;
    BM: TdxBarManager;
    Panel2: TPanel;
    cxGr: TcxGrid;
    VIEW: TcxGridTableView;
    VIEW_DATE: TcxGridColumn;
    VIEW_014: TcxGridColumn;
    VIEW_1517: TcxGridColumn;
    VIEW_18: TcxGridColumn;
    cxGrLevel1: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbRefresh: TdxBarButton;
    bbPrint: TdxBarButton;
    il: TImageList;
    al: TActionList;
    aClose: TAction;
    aRefresh: TAction;
    aPrint: TAction;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    bbClose: TdxBarButton;
    dxMemData1fd_date: TDateField;
    dxMemData1sum014: TIntegerField;
    dxMemData1sum1517: TIntegerField;
    dxMemData1sum18: TIntegerField;
    frxList: TfrxReport;
    frxDBList: TfrxDBDataset;
    catMain: TcxCategoryRow;
    rowOtchet: TcxEditorRow;
    dsReport: TDataSource;
    odsReport: TOracleDataSet;
    VIEW4: TcxGridTableView;
    VIEW4_DATE: TcxGridColumn;
    VIEW4_GOROD: TcxGridColumn;
    VIEW4_RAION: TcxGridColumn;
    VIEW4_OKRUG: TcxGridColumn;
    VIEW4_RF: TcxGridColumn;
    VIEW4_INO: TcxGridColumn;
    VIEW4_BOMJ: TcxGridColumn;
    oqThread4: TOracleQuery;
    dxMemData4: TdxMemData;
    DateField1: TDateField;
    dxMemData4sumGorod: TIntegerField;
    dxMemData4sumRaion: TIntegerField;
    dxMemData4sumOkrug: TIntegerField;
    dxMemData4sumRF: TIntegerField;
    dxMemData4sumIno: TIntegerField;
    dxMemData4sumBomj: TIntegerField;
    frxList4: TfrxReport;
    frxDBList4: TfrxDBDataset;
    VIEW3: TcxGridBandedTableView;
    VIEW3_AMB_PLAN: TcxGridBandedColumn;
    VIEW3_AMB_EXTRA: TcxGridBandedColumn;
    VIEW3_STAC_PLAN: TcxGridBandedColumn;
    VIEW3_STAC_EXTRA: TcxGridBandedColumn;
    oqThread3: TOracleQuery;
    dxMemData3: TdxMemData;
    DateField2: TDateField;
    dxMemData3amb_plan: TIntegerField;
    dxMemData3amb_extra: TIntegerField;
    dxMemData3stac_plan: TIntegerField;
    dxMemData3stac_extra: TIntegerField;
    VIEW3_DATE: TcxGridBandedColumn;
    frxList3: TfrxReport;
    frxDBList3: TfrxDBDataset;
    VIEW2: TcxGridBandedTableView;
    VIEW2_DATE: TcxGridBandedColumn;
    VIEW2_AMB014: TcxGridBandedColumn;
    VIEW2_AMB1517: TcxGridBandedColumn;
    VIEW2_AMB18: TcxGridBandedColumn;
    VIEW2_KDP014: TcxGridBandedColumn;
    VIEW2_KDP1517: TcxGridBandedColumn;
    VIEW2_KDP18: TcxGridBandedColumn;
    VIEW2_DP014: TcxGridBandedColumn;
    VIEW2_DP1517: TcxGridBandedColumn;
    VIEW2_DP18: TcxGridBandedColumn;
    VIEW2_GK014: TcxGridBandedColumn;
    VIEW2_GK1517: TcxGridBandedColumn;
    VIEW2_GK18: TcxGridBandedColumn;
    oqThread2: TOracleQuery;
    dxMemData2: TdxMemData;
    DateField3: TDateField;
    dxMemData2sumAmb014: TIntegerField;
    dxMemData2sumAmb1517: TIntegerField;
    dxMemData2sumAmb18: TIntegerField;
    dxMemData2sumKDP014: TIntegerField;
    dxMemData2sumKDP1517: TIntegerField;
    dxMemData2sumKDP18: TIntegerField;
    dxMemData2sumDP014: TIntegerField;
    dxMemData2sumDP1517: TIntegerField;
    dxMemData2sumDP18: TIntegerField;
    dxMemData2sumGK014: TIntegerField;
    dxMemData2sumGK1517: TIntegerField;
    dxMemData2sumGK18: TIntegerField;
    frxList2: TfrxReport;
    frxDBList2: TfrxDBDataset;
    oqStac: TOracleQuery;
    oqAmbul: TOracleQuery;
    rowTypePac: TcxEditorRow;
    VIEW5: TcxGridTableView;
    VIEW5_FIO: TcxGridColumn;
    VIEW5_DATER: TcxGridColumn;
    VIEW5_AGE: TcxGridColumn;
    VIEW5_ISSL: TcxGridColumn;
    VIEW5_ISPOL: TcxGridColumn;
    oqThread5: TOracleQuery;
    dxMemData5: TdxMemData;
    dxMemData5fio: TStringField;
    dxMemData5birth: TDateField;
    dxMemData5age: TIntegerField;
    dxMemData5issl: TStringField;
    dxMemData5vrfio: TStringField;
    frxList5: TfrxReport;
    frxDBList5: TfrxDBDataset;
    procedure FormCreate(Sender: TObject);
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure rowIsslEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure aCloseExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aRefreshExecute(Sender: TObject);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure aPrintExecute(Sender: TObject);
    procedure frxListGetValue(const VarName: string; var Value: Variant);
    procedure oqThread4ThreadRecord(Sender: TOracleQuery);
    procedure oqThread4ThreadFinished(Sender: TOracleQuery);
    procedure oqThread4ThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure frxList4GetValue(const VarName: string; var Value: Variant);
    procedure oqThread3ThreadRecord(Sender: TOracleQuery);
    procedure oqThread3ThreadFinished(Sender: TOracleQuery);
    procedure oqThread3ThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure frxList3GetValue(const VarName: string; var Value: Variant);
    procedure oqThread2ThreadRecord(Sender: TOracleQuery);
    procedure oqThread2ThreadFinished(Sender: TOracleQuery);
    procedure oqThread2ThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure frxList2GetValue(const VarName: string; var Value: Variant);
    procedure rowOtdelEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowOtchetEditPropertiesChange(Sender: TObject);
    procedure oqThread5ThreadRecord(Sender: TOracleQuery);
    procedure oqThread5ThreadFinished(Sender: TOracleQuery);
    procedure oqThread5ThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure frxList5GetValue(const VarName: string; var Value: Variant);
  private
    get_priem_otd, get_stotdel, get_polikliniki_fkid : Integer;
    ParentID : Integer;
    WorkMode : Integer;
    pAPPSOTRID, pSOTRID : Integer;
    dDateBegin, dDateEnd : TDateTime;
    StartTime : TTime;
    bbr : Boolean;
    sSysDate_4Rep, sCompanyName_4Rep, sOtdelName_4Rep, sSotrFIO : String;
    { Private declarations }
  public
    MedotradeSign : string;
    procedure DoShowForm;
    { Public declarations }
  end;
const sqlListfor5 = ' select t.fk_id, '+#13+
                    '        asu.pkg_regist_pacfunc.get_pac_fio(t.fk_pacid) as fiopac, '+#13+
                    '        asu.pkg_regist_pacfunc.get_pac_bith(t.fk_pacid) as pacbirth, '+#13+
                    '        asu.pkg_regist_pacfunc.get_pac_age_now(t.fk_pacid) as pacage, '+#13+
                    '        t.fc_name, '+#13+
                    '        asu.do_vrachfio(t.fk_ispolid) as vrachfio '+#13+
                    '   from asu.tnazis t '+#13+
                    '  where fd_run >= :pdate1 '+#13+
                    '    and fd_run <= :pdate2 '+#13+
                    '    and fk_nazsosid = asu.get_vipnaz '+#13+
                    '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                    '                     where fl_showanal = 1 '+#13+
                    '                    start with fc_synonim = ''ISL_FUNC_DIAGNOST'' '+#13+
                    '                    connect by prior fk_id = fk_owner) ';
var
  frmMain: TfrmMain;

implementation

uses fSetIssl, fSetOtdel;

{$R *.dfm}

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
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
    sSysDate_4Rep := ods.FieldByName('DATESYS').AsString;
  finally
    ods.Free;
  end;
  if WorkMode = 1 then
    frxList.ShowReport;
  if WorkMode = 2 then
    frxList2.ShowReport;
  if WorkMode = 3 then
    frxList3.ShowReport;
  if WorkMode = 4 then
    frxList4.ShowReport;
  if WorkMode = 5 then
    frxList5.ShowReport;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin
  if rowOtchet.Properties.Value = Null then
    begin
      showmessage('Выберите отчет!');
      rowOtchet.Focused := True;
      exit;
    end;
// Отчет № 1 - Отчет по отделению, по исследованию, по возрасту за период
  if WorkMode = 1 then
    begin
      rowOtchet.Focused := True;
      if rowIssl.Tag = 0 then
        begin
          showmessage('Укажите критерий выборки "Исследование"');
          rowIssl.Focused := True;
          exit;
        end;
      if rowOtdel.Tag = 0 then
        begin
          showmessage('Укажите критерий выборки "Отделение"');
          rowOtdel.Focused := True;
          exit;
        end; 
      if VIEW.DataController.LockCount = 0 then
        VIEW.BeginUpdate;
      VIEW.DataController.RecordCount := 0;
      while VIEW.DataController.LockCount > 0 do
        VIEW.EndUpdate;

      aRefresh.Enabled := False;
      aPrint.Enabled := False;

      dxMemData1.Close;
      dxMemData1.Open;
      dDateBegin := VarToDateTime(rowPeriodFrom.Properties.Value);
      dDateEnd := VarToDateTime(rowPeriodTo.Properties.Value+' 23:59:59');
      oqThread.Scrollable := True;
      cxLabel1.Caption := '';
      cxLabel2.Caption := '';
      cxLabel3.Caption := 'Выполняется запрос к Базе Данных...';
      StartTime:= Now;
      cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
      cxLabel1.Refresh;
      bbr := False;
      paSubParam.Visible := True;
      cxSplitter2.Visible := True;
      Animator1.Animate := True;
      if ParentID = get_stotdel then // стационар
        oqThread.SQL.Text := oqStac.SQL.Text;
      if ParentID = get_polikliniki_fkid then // поликлиника
        oqThread.SQL.Text := oqAmbul.SQL.Text;
//      if ParentID = get_priem_otd then // приемное отделение // временно не используется - попросят придется делать
//        oqThread.SQL.Text := '';
      oqThread.DeclareAndSet('PDATE1', otDate, dDateBegin);
      oqThread.DeclareAndSet('PDATE2', otDate, dDateEnd);
      oqThread.DeclareAndSet('PFK_SMID', otInteger, rowIssl.Tag);
      oqThread.DeclareAndSet('PFK_OTDELID', otInteger, rowOtdel.Tag);
      oqThread.Execute;
    end;
// Отчет № 2 - Отчет по амбулаторным пациентам в разбивке по возрасту за период
  if WorkMode = 2 then
    begin
      if VIEW2.DataController.LockCount = 0 then
        VIEW2.BeginUpdate;
      VIEW2.DataController.RecordCount := 0;
      while VIEW2.DataController.LockCount > 0 do
        VIEW2.EndUpdate;

      aRefresh.Enabled := False;
      aPrint.Enabled := False;

      dxMemData2.Close;
      dxMemData2.Open;
      dDateBegin := VarToDateTime(rowPeriodFrom.Properties.Value);
      dDateEnd := VarToDateTime(rowPeriodTo.Properties.Value+' 23:59:59');
      oqThread2.Scrollable := True;
      cxLabel1.Caption := '';
      cxLabel2.Caption := '';
      cxLabel3.Caption := 'Выполняется запрос к Базе Данных...';
      StartTime:= Now;
      cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
      cxLabel1.Refresh;
      bbr := False;
      paSubParam.Visible := True;
      cxSplitter2.Visible := True;
      Animator1.Animate := True;
      oqThread2.DeclareAndSet('PDATE1', otDate, dDateBegin);
      oqThread2.DeclareAndSet('PDATE2', otDate, dDateEnd);
      oqThread2.Execute;
    end;
// Отчет № 3 - Отчет по типу исследования за период
  if WorkMode = 3 then
    begin
      if VIEW3.DataController.LockCount = 0 then
        VIEW3.BeginUpdate;
      VIEW3.DataController.RecordCount := 0;
      while VIEW3.DataController.LockCount > 0 do
        VIEW3.EndUpdate;

      aRefresh.Enabled := False;
      aPrint.Enabled := False;

      dxMemData3.Close;
      dxMemData3.Open;
      dDateBegin := VarToDateTime(rowPeriodFrom.Properties.Value);
      dDateEnd := VarToDateTime(rowPeriodTo.Properties.Value+' 23:59:59');
      oqThread3.Scrollable := True;
      cxLabel1.Caption := '';
      cxLabel2.Caption := '';
      cxLabel3.Caption := 'Выполняется запрос к Базе Данных...';
      StartTime:= Now;
      cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
      cxLabel1.Refresh;
      bbr := False;
      paSubParam.Visible := True;
      cxSplitter2.Visible := True;
      Animator1.Animate := True;
      oqThread3.DeclareAndSet('PDATE1', otDate, dDateBegin);
      oqThread3.DeclareAndSet('PDATE2', otDate, dDateEnd);
      oqThread3.Execute;
    end;
// Отчет № 4 - Отчет по региональной принадлежности за период
  if WorkMode = 4 then
    begin
      if VIEW4.DataController.LockCount = 0 then
        VIEW4.BeginUpdate;
      VIEW4.DataController.RecordCount := 0;
      while VIEW4.DataController.LockCount > 0 do
        VIEW4.EndUpdate;

      aRefresh.Enabled := False;
      aPrint.Enabled := False;

      dxMemData4.Close;
      dxMemData4.Open;
      dDateBegin := VarToDateTime(rowPeriodFrom.Properties.Value);
      dDateEnd := VarToDateTime(rowPeriodTo.Properties.Value+' 23:59:59');
      oqThread4.Scrollable := True;
      cxLabel1.Caption := '';
      cxLabel2.Caption := '';
      cxLabel3.Caption := 'Выполняется запрос к Базе Данных...';
      StartTime:= Now;
      cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
      cxLabel1.Refresh;
      bbr := False;
      paSubParam.Visible := True;
      cxSplitter2.Visible := True;
      Animator1.Animate := True;
      oqThread4.DeclareAndSet('PDATE1', otDate, dDateBegin);
      oqThread4.DeclareAndSet('PDATE2', otDate, dDateEnd);
      oqThread4.Execute;
    end;
// Отчет № 5 - Выполненные исследования по ФИО
  if WorkMode = 5 then
    begin
      oqThread5.SQL.Text := sqlListfor5;
      if VIEW5.DataController.LockCount = 0 then
        VIEW5.BeginUpdate;
      VIEW5.DataController.RecordCount := 0;
      while VIEW5.DataController.LockCount > 0 do
        VIEW5.EndUpdate;

      aRefresh.Enabled := False;
      aPrint.Enabled := False;

      dxMemData5.Close;
      dxMemData5.Open;
      dDateBegin := VarToDateTime(rowPeriodFrom.Properties.Value);
      dDateEnd := VarToDateTime(rowPeriodTo.Properties.Value+' 23:59:59');
      oqThread5.Scrollable := True;
      cxLabel1.Caption := '';
      cxLabel2.Caption := '';
      cxLabel3.Caption := 'Выполняется запрос к Базе Данных...';
      StartTime:= Now;
      cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
      cxLabel1.Refresh;
      bbr := False;
      paSubParam.Visible := True;
      cxSplitter2.Visible := True;
      Animator1.Animate := True;
      if rowTypePac.Properties.Value = 'стационарные' then
        begin
          oqThread5.SQL.Add(' AND ASU.IS_AMBULANCE(T.FK_PACID) = 0 ');
        end;
      if rowTypePac.Properties.Value = 'амбулаторные' then
        begin
          oqThread5.SQL.Add(' AND ASU.IS_AMBULANCE(T.FK_PACID) = 1 ');
        end;
      oqThread5.DeclareAndSet('PDATE1', otDate, dDateBegin);
      oqThread5.DeclareAndSet('PDATE2', otDate, dDateEnd);
      oqThread5.Execute;
    end;
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
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY'') AS DATESYS, FK_SOTRID, ASU.DO_VRACHFIO(FK_SOTRID) AS VRACHFIO, '+#13+
                    '        ASU.PKG_SMINI.READSTRING (''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME, '+#13+
                    '        (SELECT FC_NAME '+#13+
                    '           FROM ASU.TOTDEL '+#13+
                    '          WHERE FK_ID = (SELECT FK_OTDID FROM ASU.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME, '+#13+
                    '        asu.get_priem_otd, asu.get_stotdel, asu.get_polikliniki_fkid '+#13+
                    '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, StrToInt(paramstr(1)));
    ods.Open;
    pAPPSOTRID := StrToInt(paramstr(1));
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    sCompanyName_4Rep := ods.FieldByName('COMPANYNAME').AsString;
    sOtdelName_4Rep := ods.FieldByName('OTDELNAME').AsString;
    sSotrFIO := ods.FieldByName('VRACHFIO').AsString;
    get_priem_otd := ods.FieldByName('get_priem_otd').AsInteger;
    get_stotdel := ods.FieldByName('get_stotdel').AsInteger;
    get_polikliniki_fkid := ods.FieldByName('get_polikliniki_fkid').AsInteger;
    frmMain.Caption := 'Отчеты функциональной диагностики ('+Ver.FileVersion+')'+'. Пользователь: '+ods.FieldByName('VRACHFIO').AsString;
    rowPeriodFrom.Properties.Value := ods.FieldByName('DATESYS').AsVariant;
    rowPeriodTo.Properties.Value := ods.FieldByName('DATESYS').AsVariant;
    VIEW.StoreToRegistry('\SoftWare\SoftMaster\aSvodOtchetOtdelIssl\fMain\ViewVrach_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'VIEW');
    VIEW.RestoreFromRegistry('\SoftWare\SoftMaster\aSvodOtchetOtdelIssl\fMain\ViewVrach_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'VIEW');
    MedotradeSign := ReadMedotradeSign;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите закрыть программу ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    begin
      oqThread.BreakThread;
      action := caFree;
    end else
    begin
      action := caNone;
    end;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  VIEW.StoreToRegistry('\SoftWare\SoftMaster\aSvodOtchetOtdelIssl\fMain\ViewVrach_' + IntToStr(pSOTRID), TRUE, [], 'VIEW');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
  if odsReport.Active = False then
    odsReport.Active := True;
  rowIssl.Visible := False;
  rowOtdel.Visible := False;
  rowTypePac.Visible := False;
  aPrint.Enabled := False;
  ParentID := 0;
end;

procedure TfrmMain.frxList2GetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'DATESYS' then Value := sSysDate_4Rep;
  if VarName = 'SOTR' then Value := sSotrFIO;
  if VarName = 'DATE1' then Value := rowPeriodFrom.Properties.Value;
  if VarName = 'DATE2' then Value := rowPeriodTo.Properties.Value;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
  if VarName = 'SUM_AMB014' then Value := VIEW2.DataController.Summary.FooterSummaryValues[0];
  if VarName = 'SUM_AMB1517' then Value := VIEW2.DataController.Summary.FooterSummaryValues[1];
  if VarName = 'SUM_AMB18' then Value := VIEW2.DataController.Summary.FooterSummaryValues[2];
  if VarName = 'SUM_KDP014' then Value := VIEW2.DataController.Summary.FooterSummaryValues[3];
  if VarName = 'SUM_KDP1517' then Value := VIEW2.DataController.Summary.FooterSummaryValues[4];
  if VarName = 'SUM_KDP18' then Value := VIEW2.DataController.Summary.FooterSummaryValues[5];
  if VarName = 'SUM_DP014' then Value := VIEW2.DataController.Summary.FooterSummaryValues[6];
  if VarName = 'SUM_DP1517' then Value := VIEW2.DataController.Summary.FooterSummaryValues[7];
  if VarName = 'SUM_DP18' then Value := VIEW2.DataController.Summary.FooterSummaryValues[8];
  if VarName = 'SUM_GK014' then Value := VIEW2.DataController.Summary.FooterSummaryValues[9];
  if VarName = 'SUM_GK1517' then Value := VIEW2.DataController.Summary.FooterSummaryValues[10];
  if VarName = 'SUM_GK18' then Value := VIEW2.DataController.Summary.FooterSummaryValues[11];
end;

procedure TfrmMain.frxList3GetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'DATESYS' then Value := sSysDate_4Rep;
  if VarName = 'SOTR' then Value := sSotrFIO;
  if VarName = 'DATE1' then Value := rowPeriodFrom.Properties.Value;
  if VarName = 'DATE2' then Value := rowPeriodTo.Properties.Value;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
  if VarName = 'SUM_AMBPLAN' then Value := VIEW3.DataController.Summary.FooterSummaryValues[0];
  if VarName = 'SUM_AMBEXTRA' then Value := VIEW3.DataController.Summary.FooterSummaryValues[1];
  if VarName = 'SUM_STACPLAN' then Value := VIEW3.DataController.Summary.FooterSummaryValues[2];
  if VarName = 'SUM_STACEXTRA' then Value := VIEW3.DataController.Summary.FooterSummaryValues[3];
end;

procedure TfrmMain.frxList4GetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'DATESYS' then Value := sSysDate_4Rep;
  if VarName = 'SOTR' then Value := sSotrFIO;
  if VarName = 'DATE1' then Value := rowPeriodFrom.Properties.Value;
  if VarName = 'DATE2' then Value := rowPeriodTo.Properties.Value;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
  if VarName = 'SUM_GOROD' then Value := VIEW4.DataController.Summary.FooterSummaryValues[0];
  if VarName = 'SUM_RAION' then Value := VIEW4.DataController.Summary.FooterSummaryValues[1];
  if VarName = 'SUM_OKRUG' then Value := VIEW4.DataController.Summary.FooterSummaryValues[2];
  if VarName = 'SUM_RF' then Value := VIEW4.DataController.Summary.FooterSummaryValues[3];
  if VarName = 'SUM_INO' then Value := VIEW4.DataController.Summary.FooterSummaryValues[4];
  if VarName = 'SUM_BOMJ' then Value := VIEW4.DataController.Summary.FooterSummaryValues[5];
end;

procedure TfrmMain.frxList5GetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'DATESYS' then Value := sSysDate_4Rep;
  if VarName = 'SOTR' then Value := sSotrFIO;
  if VarName = 'DATE1' then Value := rowPeriodFrom.Properties.Value;
  if VarName = 'DATE2' then Value := rowPeriodTo.Properties.Value;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
  if VarName = 'TYPEPAC' then Value := rowTypePac.Properties.Value;
  if VarName = 'VSEGO' then Value := oqThread5.RowCount;
end;

procedure TfrmMain.frxListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'DATESYS' then Value := sSysDate_4Rep;
  if VarName = 'SOTR' then Value := sSotrFIO;
  if VarName = 'DATE1' then Value := rowPeriodFrom.Properties.Value;
  if VarName = 'DATE2' then Value := rowPeriodTo.Properties.Value;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
  if VarName = 'SMIDNAME' then Value := rowIssl.Properties.Value;
  if VarName = 'OTDEL' then Value := rowOtdel.Properties.Value;
end;

procedure TfrmMain.oqThread2ThreadError(Sender: TOracleQuery;
  ErrorCode: Integer; const ErrorMessage: string);
begin
  MessageDlg('Во время выполнения запроса произошла ошибка! Обратитесь к администратору системы!'+
             #13#10+'Код ошибки: '+IntToStr(ErrorCode)+
             #13#10+'Текст ошибки: '+ErrorMessage,
             mtError, [mbOK], 0);
  bbr := True;
end;

procedure TfrmMain.oqThread2ThreadFinished(Sender: TOracleQuery);
begin
  aRefresh.Enabled := True;
  aPrint.Enabled := oqThread2.RowCount <> 0;
  Animator1.Animate := False;
  if bbr then
    cxLabel3.Caption := 'При выполнении запроса произошла ошибка!'
  else
    cxLabel3.Caption := 'Запрос к Базе Данных выполнился успешно!';
end;

procedure TfrmMain.oqThread2ThreadRecord(Sender: TOracleQuery);
begin
  VIEW2.BeginUpdate;
  VIEW2.DataController.RecordCount := VIEW2.DataController.RecordCount + 1;
  with VIEW2.DataController do
  begin
    try
      Values[VIEW2.DataController.RecordCount - 1, VIEW2_DATE.Index] := Sender.Field('fd_run_trk');
      Values[VIEW2.DataController.RecordCount - 1, VIEW2_AMB014.Index] := Sender.Field('sumAmb014');
      Values[VIEW2.DataController.RecordCount - 1, VIEW2_AMB1517.Index] := Sender.Field('sumAmb1517');
      Values[VIEW2.DataController.RecordCount - 1, VIEW2_AMB18.Index] := Sender.Field('sumAmb18');

      Values[VIEW2.DataController.RecordCount - 1, VIEW2_KDP014.Index] := Sender.Field('sumKDP014');
      Values[VIEW2.DataController.RecordCount - 1, VIEW2_KDP1517.Index] := Sender.Field('sumKDP1517');
      Values[VIEW2.DataController.RecordCount - 1, VIEW2_KDP18.Index] := Sender.Field('sumKDP18');

      Values[VIEW2.DataController.RecordCount - 1, VIEW2_DP014.Index] := Sender.Field('sumDP014');
      Values[VIEW2.DataController.RecordCount - 1, VIEW2_DP1517.Index] := Sender.Field('sumDP1517');
      Values[VIEW2.DataController.RecordCount - 1, VIEW2_DP18.Index] := Sender.Field('sumDP18');

      Values[VIEW2.DataController.RecordCount - 1, VIEW2_GK014.Index] := Sender.Field('sumGK014');
      Values[VIEW2.DataController.RecordCount - 1, VIEW2_GK1517.Index] := Sender.Field('sumGK1517');
      Values[VIEW2.DataController.RecordCount - 1, VIEW2_GK18.Index] := Sender.Field('sumGK18');

      dxMemData2.Insert;
      dxMemData2.FieldByName('fd_date').AsDateTime := Sender.Field('fd_run_trk');
      dxMemData2.FieldByName('sumAmb014').AsInteger := Sender.Field('sumAmb014');
      dxMemData2.FieldByName('sumAmb1517').AsInteger := Sender.Field('sumAmb1517');
      dxMemData2.FieldByName('sumAmb18').AsInteger := Sender.Field('sumAmb18');

      dxMemData2.FieldByName('sumKDP014').AsInteger := Sender.Field('sumKDP014');
      dxMemData2.FieldByName('sumKDP1517').AsInteger := Sender.Field('sumKDP1517');
      dxMemData2.FieldByName('sumKDP18').AsInteger := Sender.Field('sumKDP18');

      dxMemData2.FieldByName('sumDP014').AsInteger := Sender.Field('sumDP014');
      dxMemData2.FieldByName('sumDP1517').AsInteger := Sender.Field('sumDP1517');
      dxMemData2.FieldByName('sumDP18').AsInteger := Sender.Field('sumDP18');

      dxMemData2.FieldByName('sumGK014').AsInteger := Sender.Field('sumGK014');
      dxMemData2.FieldByName('sumGK1517').AsInteger := Sender.Field('sumGK1517');
      dxMemData2.FieldByName('sumGK18').AsInteger := Sender.Field('sumGK18');

      dxMemData2.Post;
      dxMemData2.Next;
    finally
    end;
  end;
  VIEW2.EndUpdate;
  cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel1.Refresh;
  cxLabel2.Caption := 'Выбрано ' + IntToStr(VIEW2.DataController.RecordCount) + ' записей.';
  cxLabel2.Refresh;
end;

procedure TfrmMain.oqThread3ThreadError(Sender: TOracleQuery;
  ErrorCode: Integer; const ErrorMessage: string);
begin
  MessageDlg('Во время выполнения запроса произошла ошибка! Обратитесь к администратору системы!'+
             #13#10+'Код ошибки: '+IntToStr(ErrorCode)+
             #13#10+'Текст ошибки: '+ErrorMessage,
             mtError, [mbOK], 0);
  bbr := True;
end;

procedure TfrmMain.oqThread3ThreadFinished(Sender: TOracleQuery);
begin
  aRefresh.Enabled := True;
  aPrint.Enabled := oqThread3.RowCount <> 0;
  Animator1.Animate := False;
  if bbr then
    cxLabel3.Caption := 'При выполнении запроса произошла ошибка!'
  else
    cxLabel3.Caption := 'Запрос к Базе Данных выполнился успешно!';
end;

procedure TfrmMain.oqThread3ThreadRecord(Sender: TOracleQuery);
begin
  VIEW3.BeginUpdate;
  VIEW3.DataController.RecordCount := VIEW3.DataController.RecordCount + 1;
  with VIEW3.DataController do
  begin
    try
      Values[VIEW3.DataController.RecordCount - 1, VIEW3_DATE.Index] := Sender.Field('fd_run_trk');
      Values[VIEW3.DataController.RecordCount - 1, VIEW3_AMB_PLAN.Index] := Sender.Field('sumAmbPlan');
      Values[VIEW3.DataController.RecordCount - 1, VIEW3_AMB_EXTRA.Index] := Sender.Field('sumAmbExtra');
      Values[VIEW3.DataController.RecordCount - 1, VIEW3_STAC_PLAN.Index] := Sender.Field('sumStacPlan');
      Values[VIEW3.DataController.RecordCount - 1, VIEW3_STAC_EXTRA.Index] := Sender.Field('sumStacExtra');

      dxMemData3.Insert;
      dxMemData3.FieldByName('fd_date').AsDateTime := Sender.Field('fd_run_trk');
      dxMemData3.FieldByName('amb_plan').AsInteger := Sender.Field('sumAmbPlan');
      dxMemData3.FieldByName('amb_extra').AsInteger := Sender.Field('sumAmbExtra');
      dxMemData3.FieldByName('stac_plan').AsInteger := Sender.Field('sumStacPlan');
      dxMemData3.FieldByName('stac_extra').AsInteger := Sender.Field('sumStacExtra');
      dxMemData3.Post;
      dxMemData3.Next;
    finally
    end;
  end;
  VIEW3.EndUpdate;
  cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel1.Refresh;
  cxLabel2.Caption := 'Выбрано ' + IntToStr(VIEW3.DataController.RecordCount) + ' записей.';
  cxLabel2.Refresh;
end;

procedure TfrmMain.oqThread4ThreadError(Sender: TOracleQuery;
  ErrorCode: Integer; const ErrorMessage: string);
begin
  MessageDlg('Во время выполнения запроса произошла ошибка! Обратитесь к администратору системы!'+
             #13#10+'Код ошибки: '+IntToStr(ErrorCode)+
             #13#10+'Текст ошибки: '+ErrorMessage,
             mtError, [mbOK], 0);
  bbr := True;
end;

procedure TfrmMain.oqThread4ThreadFinished(Sender: TOracleQuery);
begin
  aRefresh.Enabled := True;
  aPrint.Enabled := oqThread4.RowCount <> 0;
  Animator1.Animate := False;
  if bbr then
    cxLabel3.Caption := 'При выполнении запроса произошла ошибка!'
  else
    cxLabel3.Caption := 'Запрос к Базе Данных выполнился успешно!';
end;

procedure TfrmMain.oqThread4ThreadRecord(Sender: TOracleQuery);
begin
  VIEW4.BeginUpdate;
  VIEW4.DataController.RecordCount := VIEW4.DataController.RecordCount + 1;
  with VIEW4.DataController do
  begin
    try
      Values[VIEW4.DataController.RecordCount - 1, VIEW4_DATE.Index] := Sender.Field('fd_run_trk');
      Values[VIEW4.DataController.RecordCount - 1, VIEW4_GOROD.Index] := Sender.Field('sumGorod');
      Values[VIEW4.DataController.RecordCount - 1, VIEW4_RAION.Index] := Sender.Field('sumRaion');
      Values[VIEW4.DataController.RecordCount - 1, VIEW4_OKRUG.Index] := Sender.Field('sumOkrug');
      Values[VIEW4.DataController.RecordCount - 1, VIEW4_RF.Index] := Sender.Field('sumRF');
      Values[VIEW4.DataController.RecordCount - 1, VIEW4_INO.Index] := Sender.Field('sumIno');
      Values[VIEW4.DataController.RecordCount - 1, VIEW4_BOMJ.Index] := Sender.Field('sumBomj');

      dxMemData4.Insert;
      dxMemData4.FieldByName('fd_date').AsDateTime := Sender.Field('fd_run_trk');
      dxMemData4.FieldByName('sumGorod').AsInteger := Sender.Field('sumGorod');
      dxMemData4.FieldByName('sumRaion').AsInteger := Sender.Field('sumRaion');
      dxMemData4.FieldByName('sumOkrug').AsInteger := Sender.Field('sumOkrug');
      dxMemData4.FieldByName('sumRF').AsInteger := Sender.Field('sumRF');
      dxMemData4.FieldByName('sumIno').AsInteger := Sender.Field('sumIno');
      dxMemData4.FieldByName('sumBomj').AsInteger := Sender.Field('sumBomj');
      dxMemData4.Post;
      dxMemData4.Next;
    finally
    end;
  end;
  VIEW4.EndUpdate;
  cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel1.Refresh;
  cxLabel2.Caption := 'Выбрано ' + IntToStr(VIEW4.DataController.RecordCount) + ' записей.';
  cxLabel2.Refresh;
end;

procedure TfrmMain.oqThread5ThreadError(Sender: TOracleQuery;
  ErrorCode: Integer; const ErrorMessage: string);
begin
  MessageDlg('Во время выполнения запроса произошла ошибка! Обратитесь к администратору системы!'+
             #13#10+'Код ошибки: '+IntToStr(ErrorCode)+
             #13#10+'Текст ошибки: '+ErrorMessage,
             mtError, [mbOK], 0);
  bbr := True;
end;

procedure TfrmMain.oqThread5ThreadFinished(Sender: TOracleQuery);
begin
  aRefresh.Enabled := True;
  aPrint.Enabled := oqThread5.RowCount <> 0;
  Animator1.Animate := False;
  if bbr then
    cxLabel3.Caption := 'При выполнении запроса произошла ошибка!'
  else
    cxLabel3.Caption := 'Запрос к Базе Данных выполнился успешно!';
end;

procedure TfrmMain.oqThread5ThreadRecord(Sender: TOracleQuery);
begin
  VIEW5.BeginUpdate;
  VIEW5.DataController.RecordCount := VIEW5.DataController.RecordCount + 1;
  with VIEW5.DataController do
  begin
    try
      Values[VIEW5.DataController.RecordCount - 1, VIEW5_FIO.Index] := Sender.Field('fiopac');
      Values[VIEW5.DataController.RecordCount - 1, VIEW5_DATER.Index] := Sender.Field('pacbirth');
      Values[VIEW5.DataController.RecordCount - 1, VIEW5_AGE.Index] := Sender.Field('pacage');
      Values[VIEW5.DataController.RecordCount - 1, VIEW5_ISSL.Index] := Sender.Field('fc_name');
      Values[VIEW5.DataController.RecordCount - 1, VIEW5_ISPOL.Index] := Sender.Field('vrachfio');

      dxMemData5.Insert;
      dxMemData5.FieldByName('fio').AsString := Sender.Field('fiopac');
      dxMemData5.FieldByName('birth').AsDateTime := Sender.Field('pacbirth');
      dxMemData5.FieldByName('age').AsInteger := Sender.Field('pacage');
      dxMemData5.FieldByName('issl').AsString := Sender.Field('fc_name');
      dxMemData5.FieldByName('vrfio').AsString := Sender.Field('vrachfio');
      dxMemData5.Post;
      dxMemData5.Next;
    finally
    end;
  end;
  VIEW5.EndUpdate;
  cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel1.Refresh;
  cxLabel2.Caption := 'Выбрано ' + IntToStr(VIEW5.DataController.RecordCount) + ' записей.';
  cxLabel2.Refresh;
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
  aRefresh.Enabled := True;
  aPrint.Enabled := oqThread.RowCount <> 0;
  Animator1.Animate := False;
  if bbr then
    cxLabel3.Caption := 'При выполнении запроса произошла ошибка!'
  else
    cxLabel3.Caption := 'Запрос к Базе Данных выполнился успешно!';
end;

procedure TfrmMain.oqThreadThreadRecord(Sender: TOracleQuery);
begin
  VIEW.BeginUpdate;
  VIEW.DataController.RecordCount := VIEW.DataController.RecordCount + 1;
  with VIEW.DataController do
  begin
    try
      Values[VIEW.DataController.RecordCount - 1, VIEW_DATE.Index] := Sender.Field('fd_run_trk');
      Values[VIEW.DataController.RecordCount - 1, VIEW_014.Index] := Sender.Field('sum014');
      Values[VIEW.DataController.RecordCount - 1, VIEW_1517.Index] := Sender.Field('sum1517');
      Values[VIEW.DataController.RecordCount - 1, VIEW_18.Index] := Sender.Field('sum18');

      dxMemData1.Insert;
      dxMemData1.FieldByName('fd_date').AsDateTime := Sender.Field('fd_run_trk');
      dxMemData1.FieldByName('sum014').AsInteger := Sender.Field('sum014');
      dxMemData1.FieldByName('sum1517').AsInteger := Sender.Field('sum1517');
      dxMemData1.FieldByName('sum18').AsInteger := Sender.Field('sum18');
      dxMemData1.Post;
      dxMemData1.Next;
    finally
    end;
  end;
  VIEW.EndUpdate;
  cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel1.Refresh;
  cxLabel2.Caption := 'Выбрано ' + IntToStr(VIEW.DataController.RecordCount) + ' записей.';
  cxLabel2.Refresh;
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

procedure TfrmMain.rowIsslEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmSetIssl, frmSetIssl);
  try
    frmSetIssl.ShowModal;
    if frmSetIssl.ModalResult = mrOk then
      begin
        rowIssl.Tag := frmSetIssl.odsIssl.FieldByName('FK_ID').AsInteger;
        TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
        TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := frmSetIssl.odsIssl.FieldByName('FC_NAME').AsString;
        TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      end;
  finally
    frmSetIssl.Free;
  end;
end;

procedure TfrmMain.rowOtchetEditPropertiesChange(Sender: TObject);
begin
  if rowOtchet.Properties.Value = 1 then
    begin
      WorkMode := 1;
      rowIssl.Visible := True;
      rowOtdel.Visible := True;
      rowTypePac.Visible := False;
      cxGrLevel1.GridView := VIEW;
    end;
  if rowOtchet.Properties.Value = 2 then
    begin
      WorkMode := 2;
      rowIssl.Visible := False;
      rowOtdel.Visible := False;
      rowTypePac.Visible := False;
      cxGrLevel1.GridView := VIEW2;
    end;
  if rowOtchet.Properties.Value = 3 then
    begin
      WorkMode := 3;
      rowIssl.Visible := False;
      rowOtdel.Visible := False;
      rowTypePac.Visible := False;
      cxGrLevel1.GridView := VIEW3;
    end;
  if rowOtchet.Properties.Value = 4 then
    begin
      WorkMode := 4;
      rowIssl.Visible := False;
      rowOtdel.Visible := False;
      rowTypePac.Visible := False;
      cxGrLevel1.GridView := VIEW4;
    end;
  if rowOtchet.Properties.Value = 5 then
    begin
      WorkMode := 5;
      rowIssl.Visible := False;
      rowOtdel.Visible := False;
      rowTypePac.Visible := True;
      cxGrLevel1.GridView := VIEW5;
    end;
end;

procedure TfrmMain.rowOtdelEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetOtdel, frmSetOtdel);
      try
        frmSetOtdel.ShowModal;
        if frmSetOtdel.ModalResult = mrOK then
          begin
            rowOtdel.Tag := frmSetOtdel.odsOtdel.FieldByName('FK_ID').AsInteger;
            ParentID := frmSetOtdel.odsOtdel.FieldByName('FK_ID_ROOT').AsInteger;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := frmSetOtdel.odsOtdel.FieldByName('FC_NAME').AsString;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          end;
      finally
        frmSetOtdel.Free;
      end;
    end;
end;

end.
