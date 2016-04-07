unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SMMainAPI, dxSkinsCore, cxControls,
  cxSplitter, ExtCtrls, cxStyles, cxGraphics, cxEdit, cxVGrid,
  cxInplaceContainer, cxContainer, cxLabel, JvExControls, JvAnimatedImage,
  JvGIFCtrl, cxButtonEdit, cxCalendar, cxDBLookupComboBox, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxImageComboBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView, cxGrid,
  Oracle, JclFileUtils, OracleData, uGlobalConst, cxProgressBar, DB, cxTextEdit,
  ImgList, dxSkinsdxBarPainter, dxBar, ActnList, dxmdaset, Menus, frxClass,
  frxDBSet, cxGridExportLink, dxSkinOffice2007Green;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    cxSplitter1: TcxSplitter;
    vGrParams: TcxVerticalGrid;
    catParam: TcxCategoryRow;
    rowPeriod: TcxEditorRow;
    rowBeg: TcxEditorRow;
    rowEnd: TcxEditorRow;
    rowType: TcxEditorRow;
    rowWork: TcxEditorRow;
    rowUch: TcxEditorRow;
    paSubParam: TPanel;
    Animator1: TJvGIFAnimator;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    os: TOracleSession;
    Panel2: TPanel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    lbLast: TcxLabel;
    lbRun: TcxLabel;
    paRecalc: TPanel;
    pbMain: TcxProgressBar;
    lbCap: TcxLabel;
    lbTime: TcxLabel;
    lbKolvo: TcxLabel;
    lbKolvo1: TcxLabel;
    odsPeoples: TOracleDataSet;
    odsType: TOracleDataSet;
    dsType: TDataSource;
    stRep: TcxStyleRepository;
    stNormal: TcxStyle;
    stBold: TcxStyle;
    cxStyle1: TcxStyle;
    il: TImageList;
    Panel3: TPanel;
    cxGr: TcxGrid;
    tvPlan: TcxGridTableView;
    tvPlan_TUB: TcxGridColumn;
    tvPLAN_FIOPAC: TcxGridColumn;
    tvPlan_SEX: TcxGridColumn;
    tvPLAN_ROJD: TcxGridColumn;
    tvPlan_LAST: TcxGridColumn;
    tvPlan_WORK: TcxGridColumn;
    tvPlan_PLAN: TcxGridColumn;
    tvPlan_Med: TcxGridColumn;
    tvPlan_UCH: TcxGridColumn;
    cxGrLevel1: TcxGridLevel;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbRefresh: TdxBarButton;
    bbClose: TdxBarButton;
    al: TActionList;
    aClose: TAction;
    aRefresh: TAction;
    aPrint: TAction;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    oqThread: TOracleQuery;
    dxMemData1: TdxMemData;
    dxMemData1TUB: TIntegerField;
    dxMemData1FIOPAC: TStringField;
    dxMemData1SEX: TStringField;
    dxMemData1ROJD: TDateField;
    dxMemData1WORK: TStringField;
    dxMemData1PLAN: TDateField;
    dxMemData1LAST: TDateField;
    dxMemData1MEDRAB: TStringField;
    dxMemData1UCH: TStringField;
    odsPeriod: TOracleDataSet;
    dsPeriod: TDataSource;
    odsCat: TOracleDataSet;
    dsCat: TDataSource;
    rowPer: TcxEditorRow;
    rowCat: TcxEditorRow;
    pmTV: TPopupMenu;
    MenuItem1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    XLS1: TMenuItem;
    MenuItem2: TMenuItem;
    bbPrint: TdxBarButton;
    frxList: TfrxReport;
    frxDBList: TfrxDBDataset;
    sdPopUp: TSaveDialog;
    tvPlan_PER: TcxGridColumn;
    dxMemData1PER: TStringField;
    tvPlan_ADR: TcxGridColumn;
    dxMemData1ADR: TStringField;
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure FormCreate(Sender: TObject);
    procedure lbRunMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbRunMouseLeave(Sender: TObject);
    procedure lbRunClick(Sender: TObject);
    procedure rowPeriodEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowBegEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowEndEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowWorkEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowUchEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aRefreshExecute(Sender: TObject);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure rowTypeEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowPerEditPropertiesEditValueChanged(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aPrintExecute(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure frxListGetValue(const VarName: string; var Value: Variant);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
  private
    sParams : String;
    get_sysdate_4rep : String;
    get_oneinyear, get_twoinyear : Integer;
    dDateBegin, dDateEnd : TDateTime;
    StartTime: TTime;
    pAPPSOTRID : Integer;
    sOtdelName_4Rep, sCompanyName_4Rep, sSotrFIO : String;
    MedotradeSign : string;
    procedure DoRefreshSmidConst;
    { Private declarations }
  public
    pSOTRID : Integer;
    procedure DoShowForm;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  StartTime: TTime;
  bbr : Boolean;

const oqComp = ' select (select count(*) from asu.tnazis '+#13+
               '          where fk_pacid = t1.fk_id '+#13+
               '            and fk_smid = asu.get_xray_tubdispancer '+#13+
               '            and sysdate >= fd_naz '+#13+
               '            and (sysdate < to_date(fd_run)+1 or fd_run is null)) as tub, '+#13+
               '        fc_fam||'' ''||fc_im||'' ''||fc_otch as fiopac, '+#13+
               '        decode(fp_sex, 1, ''М'', 0, ''Ж'') as fp_sex, '+#13+
               '        fd_rojd, '+#13+
               '        to_date(asu.get_last_fluoro_date(t1.fk_id, 1), ''dd.mm.yyyy'') as last_fluoro, '+#13+
               '        t3.fc_name as work, '+#13+
               '        t4.fd_date as plan_fluoro, '+#13+
               '        decode((select 1 from asu.tpeplid_med where fk_peplid = t1.fk_id), null, '''', 1, ''ДА'') as MEDRAB, '+#13+
               '        asu.get_area_for_xray(t1.fk_id) as uch, '+#13+
               '        (select asu.get_smidname(fk_smid) '+#13+
               '           from asu.tib '+#13+
               '          where fk_pacid = t1.fk_id '+#13+
               '            and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''XRAY_PERIOD_OSMOTROV'' '+#13+
               '                                                        connect by prior fk_id = fk_owner)) as per, '+#13+
               '        asu.get_adr_by_peplid_level_street(t1.fk_id) as adr '+#13+
               '   from asu.tpeoples t1, asu.tpeoples_company t2, asu.tperiod_company t3, asu.tplanfluoro t4 '+#13+ // !!! может здесь не нужна выборка из tpeoples
               '  where t1.fk_id = t2.fk_peopleid '+#13+
               '    and t2.fk_companyid = t3.fk_companyid '+#13+
               '    and t2.fk_periodid = t3.fk_owner '+#13+
               '    and t3.fl_del = 0 '+#13+
               '    and t1.fk_id = t4.fk_peplid '+#13+
               '    and t4.fd_date >= :pdate1 '+#13+
               '    and t4.fd_date <= :pdate2 ';

      oqUch =  ' select (select count(*) from asu.tnazis '+#13+
               '          where fk_pacid = t.fk_peplid '+#13+
               '            and fk_smid = asu.get_xray_tubdispancer '+#13+
               '            and sysdate >= fd_naz '+#13+
               '            and (sysdate < to_date(fd_run)+1 or fd_run is null)) as tub, '+#13+
               '        asu.pkg_regist_peplfunc.get_pepl_fullfio(t.fk_peplid) as fiopac, '+#13+
               '        decode(asu.pkg_regist_peplfunc.get_pepl_sex(t.fk_peplid), ''Женский'', ''Ж'', ''Мужской'', ''М'') as fp_sex, '+#13+
               '        (select fd_rojd from asu.tpeoples where fk_id = t.fk_peplid) as fd_rojd, '+#13+
               '        to_date(asu.get_last_fluoro_date(t.fk_peplid, 1), ''dd.mm.yyyy'') as last_fluoro, '+#13+
               '        t.fd_date as plan_fluoro, '+#13+
               '        decode((select 1 from asu.tpeplid_med where fk_peplid = t.fk_peplid), null, '''', 1, ''ДА'') as MEDRAB, '+#13+
               '        (select fc_short from asu.tcompany where fk_id = (select fk_companyid from asu.tpeoples where fk_id = t.fk_peplid)) as work, '+#13+
               '        asu.get_area_for_xray(t.fk_peplid) as uch, '+#13+
               '        (select asu.get_smidname(fk_smid) '+#13+
               '           from asu.tib '+#13+
               '          where fk_pacid = t.fk_peplid '+#13+
               '            and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''XRAY_PERIOD_OSMOTROV'' '+#13+
               '                                                        connect by prior fk_id = fk_owner)) as per, '+#13+
               '        asu.get_adr_by_peplid_level_street(t.fk_peplid) as adr '+#13+               
               '   from (select distinct t1.fk_peplid, t2.fd_date, t1.fk_arealid '+#13+
               '           from asu.tdistrict_pacient t1, asu.tplanfluoro t2, asu.tdistrict_name t3 '+#13+
               '          where t1.fk_peplid = t2.fk_peplid '+#13+
               '            and t1.fk_arealid = t3.fk_id '+#13+
               '            and t3.fk_typeid in (select fk_id from asu.tsmid where fc_synonim in (''THERAPIST_AREA'', ''PEDIATR_AREA'')) '+#13+
//               '            and t1.fk_peplid not in (select fk_peopleid from asu.tpeoples_company) ) t '+#13+
               '            and t1.fd_cheked is not null ) t '+#13+
               '  where t.fd_date >= :pdate1 '+#13+
               '    and t.fd_date <= :pdate2 ';

implementation
uses uPeriod, fSetUch, fWork;
{$R *.dfm}

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  vGrParams.SetFocus;
	ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS SYSTEMDATE FROM DUAL ';
    ods.Open;
    get_sysdate_4rep := ods.FieldByName('SYSTEMDATE').AsString;
    sParams := '';
    if rowWork.Tag <> -1 then
      sParams := sParams + 'Место работы: '+rowWork.Properties.Value+'; ';
    if rowUch.Tag <> -1 then
      sParams := sParams + 'Участок: '+rowUch.Properties.Value+'; ';
    if (rowPer.Properties.Value <> -1) and (VarToStr(rowPer.Properties.Value) <> '') then
      sParams := sParams + 'Периодичность: '+odsPeriod.FieldByName('fc_name').AsString+'; ';
    if (rowCat.Properties.Value <> -1) and (VarToStr(rowCat.Properties.Value) <> '') and (rowCat.Visible = True) then
      sParams := sParams + 'Категория: '+odsCat.FieldByName('fc_name').AsString+'; ';
    frxList.FindObject('mLb').Visible := sParams <> '';
    frxList.FindObject('mParam').Visible := sParams <> '';
    frxList.ShowReport;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin
  lbRun.Enabled := False;
  if rowType.Properties.Value = 1 then  // по предприятиям
    begin
      aRefresh.Enabled := False;
      aPrint.Enabled := False;
      cxLabel1.Caption := '';
      cxLabel2.Caption := '';
      cxLabel3.Caption := 'Выполняется запрос к Базе Данных...';
      if tvPlan.DataController.LockCount = 0 then
        tvPlan.BeginUpdate;
      tvPlan.DataController.RecordCount := 0;
      while tvPlan.DataController.LockCount > 0 do
        tvPlan.EndUpdate;
      cxGr.Refresh;
      dxMemData1.Close;
      dxMemData1.Open;
      dDateBegin := VarToDateTime(rowBeg.Properties.Value);
      dDateEnd := VarToDateTime(rowEnd.Properties.Value+' 23:59:59');

      paSubParam.Visible := True;
      StartTime:= Now;
      cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
      cxLabel1.Refresh;
      oqThread.Scrollable := True;
      Animator1.Animate := True;
      oqThread.DeleteVariables;
      oqThread.SQL.Text := oqComp;
      if rowWork.Tag <> -1 then
        begin
          oqThread.SQL.Add(' and t2.fk_companyid = :pfk_companyid ');
          oqThread.DeclareAndSet('pfk_companyid', otInteger, rowWork.Tag);
        end;
      if rowUch.Tag <> -1 then
        begin
          oqThread.SQL.Add(' and exists (select 1 from asu.tdistrict_pacient where fk_peplid = t1.fk_id and fk_arealid = :pfk_arealid) ');
          oqThread.DeclareAndSet('pfk_arealid', otInteger, rowUch.Tag);
        end;
      if (rowPer.Properties.Value <> -1) and (VarToStr(rowPer.Properties.Value) <> '') then
        begin
          oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = t1.fk_id AND FK_SMID = :PFK_SMID21 ) ');
          oqThread.DeclareAndSet('PFK_SMID21', otInteger, rowPer.Properties.Value);
        end;
      if (rowCat.Properties.Value <> -1) and (VarToStr(rowCat.Properties.Value) <> '') and (rowCat.Visible = True) then
        begin
          oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = t1.fk_id AND FK_SMID = :PFK_SMID22 ) ');
          oqThread.DeclareAndSet('PFK_SMID22', otInteger, rowCat.Properties.Value);
        end;
      oqThread.SQL.Add(' ORDER BY FIOPAC ');
      oqThread.DeclareAndSet('pdate1', otDate, dDateBegin);
      oqThread.DeclareAndSet('pdate2', otDate, dDateEnd);
      oqThread.Execute;
    end;
  if rowType.Properties.Value = 2 then  // по участкам
    begin
      aRefresh.Enabled := False;
      aPrint.Enabled := False;
      cxLabel1.Caption := '';
      cxLabel2.Caption := '';
      cxLabel3.Caption := 'Выполняется запрос к Базе Данных...';
      if tvPlan.DataController.LockCount = 0 then
        tvPlan.BeginUpdate;
      tvPlan.DataController.RecordCount := 0;
      while tvPlan.DataController.LockCount > 0 do
        tvPlan.EndUpdate;
      cxGr.Refresh;
      dxMemData1.Close;
      dxMemData1.Open;
      dDateBegin := VarToDateTime(rowBeg.Properties.Value);
      dDateEnd := VarToDateTime(rowEnd.Properties.Value+' 23:59:59');

      paSubParam.Visible := True;
      StartTime:= Now;
      cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
      cxLabel1.Refresh;
      oqThread.Scrollable := True;
      Animator1.Animate := True;
      oqThread.DeleteVariables;
      oqThread.SQL.Text := oqUch;
      if rowUch.Tag <> -1 then
        begin
          oqThread.SQL.Add(' and t.fk_arealid = :pfk_arealid ');
          oqThread.DeclareAndSet('pfk_arealid', otInteger, rowUch.Tag);
        end;
      if (rowPer.Properties.Value <> -1) and (VarToStr(rowPer.Properties.Value) <> '') then
        begin
          oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = t.fk_peplid AND FK_SMID = :PFK_SMID21 ) ');
          oqThread.DeclareAndSet('PFK_SMID21', otInteger, rowPer.Properties.Value);
        end;
      if (rowCat.Properties.Value <> -1) and (VarToStr(rowCat.Properties.Value) <> '') and (rowCat.Visible = True) then
        begin
          oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = t.fk_peplid AND FK_SMID = :PFK_SMID22 ) ');
          oqThread.DeclareAndSet('PFK_SMID22', otInteger, rowCat.Properties.Value);
        end;
      oqThread.SQL.Add(' ORDER BY FIOPAC ');  
      oqThread.DeclareAndSet('pdate1', otDate, dDateBegin);
      oqThread.DeclareAndSet('pdate2', otDate, dDateEnd);
      oqThread.Execute;
    end;
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

procedure TfrmMain.DoRefreshSmidConst;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.SQL.Text := ' SELECT (select fk_id from asu.tsmid where fc_synonim = ''ONE_IN_YEAR'') as get_oneinyear, '+#13+
                    '        (select fk_id from asu.tsmid where fc_synonim = ''TWO_IN_YEAR'') as get_twoinyear, '+#13+
                    '        ASU.PKG_SMINI.READSTRING (''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME '+#13+
                    '   FROM DUAL ';
    ods.Open;
    get_oneinyear := ods.FieldByName('get_oneinyear').AsInteger;
    get_twoinyear := ods.FieldByName('get_twoinyear').AsInteger;
    sCompanyName_4Rep := ods.FieldByName('COMPANYNAME').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  DoRefreshSmidConst;
  ods := TOracleDataSet.Create(nil);
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY'') AS DATESYS, FK_SOTRID, ASU.DO_VRACHFIO(FK_SOTRID) AS VRACHFIO, '+#13+
                    '        (SELECT FC_NAME FROM ASU.TOTDEL WHERE FK_ID = (SELECT FK_OTDID FROM ASU.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME '+#13+
                    '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, StrToInt(paramstr(1)));
    ods.Open;
    pAPPSOTRID := StrToInt(paramstr(1));
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    frmMain.Caption := 'План ('+Ver.FileVersion+')'+'. Пользователь: '+ods.FieldByName('VRACHFIO').AsString;
    rowBeg.Properties.Value := ods.FieldByName('DATESYS').AsVariant;
    rowEnd.Properties.Value := ods.FieldByName('DATESYS').AsVariant;
    sOtdelName_4Rep := ods.FieldByName('OTDELNAME').AsString;
    sSotrFIO := ods.FieldByName('VRACHFIO').AsString;
    MedotradeSign := ReadMedotradeSign;
    tvPlan.StoreToRegistry('\SoftWare\SoftMaster\Plan\tvPlanVrach_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'tvPlan');
    tvPlan.RestoreFromRegistry('\SoftWare\SoftMaster\Plan\tvPlanVrach_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'tvPlan');
  finally
    Ver.Free;
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
  tvPlan.StoreToRegistry('\SoftWare\SoftMaster\Plan\tvPlanVrach_' + IntToStr(pSOTRID), TRUE, [], 'tvPlan');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var ods : TOracleDataSet;
begin
  GetSession(os, 'ASU');
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select fc_value from asu.tsmini where fc_key = ''LAST_RECALC'' ';
    ods.Open;
    if ods.FieldByName('fc_value').AsString = '' then
      lbLast.Caption := '-'
    else
      lbLast.Caption := ods.FieldByName('fc_value').AsString;
  finally
    ods.Free;
  end;

  if odsType.Active = False then
    odsType.Active := True;
  if odsPeriod.Active = False then
    odsPeriod.Active := True;
  if odsCat.Active = False then
    odsCat.Active := True;
  rowType.Properties.Value := 2;
  rowWork.Tag := -1;
  rowUch.Tag := -1;
  aPrint.Enabled := False;
end;

procedure TfrmMain.frxListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'SYSDATE' then Value := get_sysdate_4rep;
  if VarName = 'PARAM' then Value := sParams;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
  if VarName = 'DATE1' then Value := rowBeg.Properties.Value;
  if VarName = 'DATE2' then Value := rowEnd.Properties.Value;
  if VarName = 'TYPE' then Value := odsType.FieldByName('fc_name').AsString;
end;

procedure TfrmMain.lbRunClick(Sender: TObject);
var ods : TOracleDataSet;
    plan_date : TDateTime;
    i : Integer;
begin
  paRecalc.Visible := True;
  lbRun.Enabled := False;
  vGrParams.Enabled := False;
  aRefresh.Enabled := False;
  aPrint.Enabled := False;
  rowPeriod.Properties.Options.ShowEditButtons := eisbNever;
  rowBeg.Properties.Options.ShowEditButtons := eisbNever;
  rowEnd.Properties.Options.ShowEditButtons := eisbNever;
  rowType.Properties.Options.ShowEditButtons := eisbNever;
  rowWork.Properties.Options.ShowEditButtons := eisbNever;
  rowUch.Properties.Options.ShowEditButtons := eisbNever;
  rowPer.Properties.Options.ShowEditButtons := eisbNever;
  rowCat.Properties.Options.ShowEditButtons := eisbNever;
  Screen.Cursor := crSQLWait;
  Application.ProcessMessages;
//--
  ods := TOracleDataSet.Create(nil);
  ods.Session := os;
  try
    odsPeoples.Close;
    odsPeoples.Open;
    i := 0;
    StartTime:= Now;
    lbTime.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
    lbTime.Refresh;
    pbMain.Position := 0;
    pbMain.Properties.Max := odsPeoples.RecordCount;
    ods.SQL.Text := ' truncate table asu.tplanfluoro ';
    ods.Open;
    odsPeoples.First;
    while not odsPeoples.Eof do
      begin
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' select to_date(asu.get_plan_fluoro_date(:pfk_id), ''dd.mm.yyyy'') as plan_date from dual ';
        ods.DeclareAndSet('pfk_id', otInteger, odsPeoples.FieldByName('fk_id').AsInteger);
        ods.Open;
        plan_date := ods.FieldByName('plan_date').AsDateTime;
        if DateTimeToStr(plan_date) <> '30.12.1899' then
          begin
            ods.DeleteVariables;
            ods.Close;
            ods.SQL.Text := ' insert into asu.tplanfluoro(fk_peplid, fd_date) values(:pfk_peplid, :pfd_date) ';
            ods.DeclareAndSet('pfk_peplid', otInteger, odsPeoples.FieldByName('fk_id').AsInteger);
            ods.DeclareAndSet('pfd_date', otDate, plan_date);
            ods.Open;
          end;
        pbMain.Position := pbMain.Position + 1;
        lbTime.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
        lbTime.Refresh;
        lbKolvo1.Caption := IntToStr(StrToInt(lbKolvo1.Caption)+1);
        lbKolvo1.Refresh;
        Application.ProcessMessages;
        odsPeoples.Next;
        i := i + 1;
        if i = 1000 then
          begin
            os.Commit;
            i := 0;
          end;
      end;
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' merge into asu.tsmini using dual on (fc_key = ''LAST_RECALC'') '+#13+
                    ' when matched then update set fc_value = to_char(sysdate, ''dd.mm.yyyy hh24:mi'') where fc_key = ''LAST_RECALC'' '+#13+
                    ' when not matched then insert(fc_section, fc_key, fc_value) values(''XRAY'', ''LAST_RECALC'', to_char(sysdate, ''dd.mm.yyyy hh24:mi'')) ';
    ods.Open;
    ods.Close;
    ods.SQL.Text := ' select fc_value from asu.tsmini where fc_key = ''LAST_RECALC'' ';
    ods.Open;
    lbLast.Caption := ods.FieldByName('fc_value').AsString;
  finally
    Screen.Cursor := crDefault;
    rowPeriod.Properties.Options.ShowEditButtons := eisbAlways;
    rowBeg.Properties.Options.ShowEditButtons := eisbAlways;
    rowEnd.Properties.Options.ShowEditButtons := eisbAlways;
    rowType.Properties.Options.ShowEditButtons := eisbAlways;
    rowWork.Properties.Options.ShowEditButtons := eisbAlways;
    rowUch.Properties.Options.ShowEditButtons := eisbAlways;
    rowPer.Properties.Options.ShowEditButtons := eisbAlways;
    rowCat.Properties.Options.ShowEditButtons := eisbAlways;
    lbRun.Enabled := True;
    vGrParams.Enabled := True;
    paRecalc.Visible := False;
    aRefresh.Enabled := True;
    aPrint.Enabled := oqThread.RowCount <> 0;
    ods.Free;
  end;
end;

procedure TfrmMain.lbRunMouseLeave(Sender: TObject);
begin
  lbRun.Style.Font.Style := lbRun.Style.Font.Style - [fsUnderline, fsBold];
  lbRun.Style.Font.Color := clBlack;
end;

procedure TfrmMain.lbRunMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lbRun.Style.Font.Style := lbRun.Style.Font.Style + [fsUnderline, fsBold];
  lbRun.Style.Font.Color := clBlue;
end;

procedure TfrmMain.MenuItem2Click(Sender: TObject);
begin
  tvPlan.RestoreFromRegistry('\SoftWare\SoftMaster\Plan\tvPlanVrach_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'tvPlan');
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
    cxLabel3.Caption := 'При выполнении запроса произошла ошибка!'
  else
    cxLabel3.Caption := 'Запрос к Базе Данных выполнился успешно!';
  aPrint.Enabled := True;
  aRefresh.Enabled := True;
  lbRun.Enabled := True;
  aPrint.Enabled := oqThread.RowCount <> 0;
end;

procedure TfrmMain.oqThreadThreadRecord(Sender: TOracleQuery);
begin
  tvPlan.BeginUpdate;
  tvPlan.DataController.RecordCount := tvPlan.DataController.RecordCount + 1;
  with tvPlan.DataController do
  begin
    try
//      Values[tvPlan.DataController.RecordCount - 1, tvPLAN_NUMPP.Index] := Sender.Field('rownum');
      Values[tvPlan.DataController.RecordCount - 1, tvPLAN_TUB.Index] := Sender.Field('tub');
      Values[tvPlan.DataController.RecordCount - 1, tvPLAN_FIOPAC.Index] := Sender.Field('fiopac');
      Values[tvPlan.DataController.RecordCount - 1, tvPLAN_SEX.Index] := Sender.Field('fp_sex');
      Values[tvPlan.DataController.RecordCount - 1, tvPLAN_ROJD.Index] := Sender.Field('fd_rojd');
      Values[tvPlan.DataController.RecordCount - 1, tvPLAN_LAST.Index] := Sender.Field('last_fluoro');
//      if rowType.Properties.Value <> 2 then
        Values[tvPlan.DataController.RecordCount - 1, tvPLAN_WORK.Index] := Sender.Field('work');
      Values[tvPlan.DataController.RecordCount - 1, tvPLAN_PLAN.Index] := Sender.Field('plan_fluoro');
      Values[tvPlan.DataController.RecordCount - 1, tvPLAN_MED.Index] := Sender.Field('medrab');
      Values[tvPlan.DataController.RecordCount - 1, tvPLAN_UCH.Index] := Sender.Field('UCH');
      Values[tvPlan.DataController.RecordCount - 1, tvPLAN_PER.Index] := Sender.Field('PER');
      Values[tvPlan.DataController.RecordCount - 1, tvPLAN_ADR.Index] := Sender.Field('ADR');
      dxMemData1.Insert;
//      dxMemData1.FieldByName('numpp').AsInteger := Sender.Field('rownum');
      dxMemData1.FieldByName('tub').AsInteger := Sender.Field('tub');
      dxMemData1.FieldByName('fiopac').AsString := Sender.Field('fiopac');
      dxMemData1.FieldByName('sex').AsString := Sender.Field('fp_sex');
      dxMemData1.FieldByName('rojd').AsDateTime := Sender.Field('fd_rojd');
      dxMemData1.FieldByName('last').AsDateTime := Sender.Field('last_fluoro');
//      if rowType.Properties.Value <> 2 then
        dxMemData1.FieldByName('work').AsString := Sender.Field('work');
      dxMemData1.FieldByName('plan').AsDateTime := Sender.Field('plan_fluoro');
      dxMemData1.FieldByName('medrab').AsString := Sender.Field('medrab');
      dxMemData1.FieldByName('uch').AsString := Sender.Field('uch');
      dxMemData1.FieldByName('per').AsString := Sender.Field('per');
      dxMemData1.FieldByName('adr').AsString := Sender.Field('adr');
      dxMemData1.Post;
      dxMemData1.Next;
    finally
    end;
  end;
  tvPlan.EndUpdate;
  cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel1.Refresh;
  cxLabel2.Caption := 'Выбрано ' + IntToStr(tvPlan.DataController.RecordCount) + ' записей.';
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

procedure TfrmMain.rowBegEditPropertiesEditValueChanged(Sender: TObject);
begin
  cxGr.SetFocus;
  rowPeriod.Properties.Value := DateTimeToStr(rowBeg.Properties.Value)+'-'+DateTimeToStr(Trunc(rowEnd.Properties.Value));
end;

procedure TfrmMain.rowEndEditPropertiesEditValueChanged(Sender: TObject);
begin
  cxGr.SetFocus;
  rowPeriod.Properties.Value := DateTimeToStr(rowBeg.Properties.Value)+'-'+DateTimeToStr(Trunc(rowEnd.Properties.Value));
end;

procedure TfrmMain.rowPerEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowPer.Properties.Value = get_oneinyear then
    begin
      rowCat.Visible := True;
      odsCat.Close;
      odsCat.SetVariable('pfc_synonim', 'FLU_PERIOD_CATEGORY_ONEINYEAR');
      odsCat.Open;
    end;
  if rowPer.Properties.Value = get_twoinyear then
    begin
      rowCat.Visible := True;
      odsCat.Close;
      odsCat.SetVariable('pfc_synonim', 'FLU_PERIOD_CATEGORY_TWOINYEAR');
      odsCat.Open;
    end;
  if (rowPer.Properties.Value <> get_oneinyear) and (rowPer.Properties.Value <> get_twoinyear) then
    begin
      rowCat.Visible := False;
    end;
end;

procedure TfrmMain.rowPeriodEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  with TfrmParamDate.Create(Self) do
    begin
      if Execute then
        begin
      if ModalResult = MrOK then
        begin
          rowBeg.Properties.Value := Period.First;
          rowEnd.Properties.Value := Period.Last;
          TcxButtonEdit(vGrParams.InplaceEditor).Properties.ViewStyle := vsNormal;
          TcxButtonEdit(vGrParams.InplaceEditor).EditingText := DateTimeToStr(Period.First)+'-'+DateTimeToStr(trunc(Period.Last));
          TcxButtonEdit(vGrParams.InplaceEditor).Properties.ViewStyle := vsHideCursor;
        end;
        end;
    Free;
  end;
end;

procedure TfrmMain.rowTypeEditPropertiesEditValueChanged(Sender: TObject);
begin
  tvPlan.DataController.RecordCount := 0;
  if rowType.Properties.Value = 1 then
    begin
      rowWork.Visible := True;
//      tvPlan_WORK.Visible := True;
    end;
  if rowType.Properties.Value = 2 then
    begin
      rowWork.Visible := False;
//      tvPlan_WORK.Visible := False;
    end;
end;

procedure TfrmMain.rowUchEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetUch, frmSetUch);
      try
        frmSetUch.DoShowForm;
        frmSetUch.ShowModal;
        if frmSetUch.ModalResult = mrOk then
          begin
            rowUch.Tag := frmSetUch.odsListUch.FieldByName('FK_ID').AsInteger;
            TcxButtonEdit(vGrParams.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vGrParams.InplaceEditor).EditingText := frmSetUch.lcbType.EditText+'-'+frmSetUch.odsListUch.FieldByName('nameuch').AsString;
            TcxButtonEdit(vGrParams.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            if rowUch.Tag = -1 then
              begin
                rowUch.Properties.ImageIndex := -1;
                rowUch.Styles.Content := stNormal;
                rowUch.Styles.Header := stNormal;
              end else
              begin
                rowUch.Properties.ImageIndex := 4;
                rowUch.Styles.Content := stBold;
                rowUch.Styles.Header := stBold;
              end;
          end;
      finally
        frmSetUch.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      rowUch.Tag := -1;
      TcxButtonEdit(vGrParams.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(vGrParams.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(vGrParams.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      rowUch.Properties.ImageIndex := -1;
      rowUch.Styles.Content := stNormal;
      rowUch.Styles.Header := stNormal;
    end;
end;

procedure TfrmMain.rowWorkEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmWork, frmWork);
      try
        frmWork.ShowModal;
        if frmWork.ModalResult = mrOk then
          begin
            rowWork.Tag := frmWork.odsWork.FieldByName('FK_ID').AsInteger;
            TcxButtonEdit(vGrParams.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vGrParams.InplaceEditor).EditingText := frmWork.odsWork.FieldByName('FC_NAME').AsString;
            TcxButtonEdit(vGrParams.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            if rowWork.Tag = -1 then
              begin
                rowWork.Properties.ImageIndex := -1;
                rowWork.Styles.Content := stNormal;
                rowWork.Styles.Header := stNormal;
              end else
              begin
                rowWork.Properties.ImageIndex := 4;
                rowWork.Styles.Content := stBold;
                rowWork.Styles.Header := stBold;
              end;
          end;
      finally
        frmWork.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      rowWork.Tag := -1;
      TcxButtonEdit(vGrParams.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(vGrParams.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(vGrParams.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      rowWork.Properties.ImageIndex := -1;
      rowWork.Styles.Content := stNormal;
      rowWork.Styles.Header := stNormal;
    end;
end;

end.
