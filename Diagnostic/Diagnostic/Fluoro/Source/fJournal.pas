unit fJournal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, dxBar,
  cxClasses, ActnList, dxBarExtItems, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, OracleData, Menus, dxPSUtl, Clipbrd, cxGridExportLink,
  frxClass, frxDBSet, Oracle, jvDBUtils, cxSplitter, ExtCtrls,
  cxLookAndFeelPainters, StdCtrls, cxRadioGroup, cxDropDownEdit, cxButtons,
  cxTextEdit, cxMaskEdit, cxCalendar, cxLabel, JvExExtCtrls, JvExtComponent,
  JvPanel, cxContainer, cxGroupBox, cxSpinEdit, DateUtils, cxCheckBox,
  cxImageComboBox, ImgList, dxSkinBlack, dxSkinOffice2007Green;

type
  TfrmJournal = class(TForm)
    dxBM: TdxBarManager;
    dxBMBar1: TdxBar;
    bbClose: TdxBarButton;
    al: TActionList;
    actClose: TAction;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    bbPrint: TdxBarButton;
    actPrint: TAction;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    N3: TMenuItem;
    N2: TMenuItem;
    actCopyFIO: TAction;
    actText: TAction;
    actWeb: TAction;
    actXML: TAction;
    actXLS: TAction;
    dlgSavePopUp: TSaveDialog;
    frxRepList: TfrxReport;
    frxdsList: TfrxDBDataset;
    bbOkonZakl: TdxBarButton;
    actOkonZakl: TAction;
    bbBase: TdxBarButton;
    aBase: TAction;
    paDates: TPanel;
    cxSplitter1: TcxSplitter;
    gbPeriod: TcxGroupBox;
    paPeriod: TJvPanel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    deBegin: TcxDateEdit;
    deEnd: TcxDateEdit;
    bPeriod: TcxButton;
    bToday: TcxButton;
    bYesterday: TcxButton;
    cbDates: TcxComboBox;
    cxLabel2: TcxLabel;
    paDate: TPanel;
    paDateButtons: TPanel;
    rb1: TcxRadioButton;
    rb2: TcxRadioButton;
    seYear: TcxSpinEdit;
    bbRefresh: TdxBarButton;
    aRefresh: TAction;
    Panel1: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    cxGrDoobsledovan: TcxGrid;
    TVDOOBSL: TcxGridDBTableView;
    VDOOBSLNUM: TcxGridDBColumn;
    VDOOBSLFIO: TcxGridDBColumn;
    VDOOBSLDATEROJD: TcxGridDBColumn;
    VDOOBSLADDRESS: TcxGridDBColumn;
    VDOOBSLWORKPLACE: TcxGridDBColumn;
    VDOOBSLDATENUM: TcxGridDBColumn;
    VDOOBSLKUDA: TcxGridDBColumn;
    VDOOBSLPREDVZAKL: TcxGridDBColumn;
    VDOOBSLFIOSOTRZAKL: TcxGridDBColumn;
    VDOOBSLUCHASTOK: TcxGridDBColumn;
    VDOOBSLOKONZAKL: TcxGridDBColumn;
    cxGrDoobsledovanLevel1: TcxGridLevel;
    cxGroupBox1: TcxGroupBox;
    teFIO: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    teNum: TcxTextEdit;
    bFIO: TcxButton;
    bNum: TcxButton;
    chb1: TcxCheckBox;
    cxSplitter2: TcxSplitter;
    VDOOBSLNUMISSL: TcxGridDBColumn;
    aCloseSpl: TAction;
    aOpenSpl: TAction;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    aInfo: TAction;
    bbInfo: TdxBarButton;
    bbFlu: TdxBarButton;
    aFluoro: TAction;
    bbTub: TdxBarButton;
    aTub: TAction;
    bbPrintNaprav: TdxBarButton;
    actPrintNaprav: TAction;
    frxRepNapr: TfrxReport;
    cxLabel9: TcxLabel;
    lbKolvo: TcxLabel;
    odsCount: TOracleDataSet;
    N4: TMenuItem;
    aSetDop: TAction;
    N5: TMenuItem;
    VDOOBSLDOP: TcxGridDBColumn;
    VDOOBSLCNTTUB: TcxGridDBColumn;
    ilCntTub: TImageList;
    ilRgPlus: TImageList;
    VDOOBSLRG: TcxGridDBColumn;
    aEdit: TAction;
    N6: TMenuItem;
    cxLabel1: TcxLabel;
    procedure actCloseExecute(Sender: TObject);
    procedure odsListBeforeOpen(DataSet: TDataSet);
    procedure actPrintExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure actCopyFIOExecute(Sender: TObject);
    procedure actTextExecute(Sender: TObject);
    procedure actWebExecute(Sender: TObject);
    procedure actXMLExecute(Sender: TObject);
    procedure actXLSExecute(Sender: TObject);
    procedure frxRepListGetValue(const VarName: string; var Value: Variant);
    procedure odsListAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure actOkonZaklExecute(Sender: TObject);
    procedure aBaseExecute(Sender: TObject);
    procedure cxSplitter1BeforeClose(Sender: TObject; var AllowClose: Boolean);
    procedure cxSplitter1BeforeOpen(Sender: TObject; var NewSize: Integer;
      var AllowOpen: Boolean);
    procedure bTodayClick(Sender: TObject);
    procedure bYesterdayClick(Sender: TObject);
    procedure bPeriodClick(Sender: TObject);
    procedure cbDatesPropertiesEditValueChanged(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure chb1PropertiesEditValueChanged(Sender: TObject);
    procedure cxSplitter2BeforeClose(Sender: TObject; var AllowClose: Boolean);
    procedure cxSplitter2BeforeOpen(Sender: TObject; var NewSize: Integer;
      var AllowOpen: Boolean);
    procedure aCloseSplExecute(Sender: TObject);
    procedure aOpenSplExecute(Sender: TObject);
    procedure aInfoExecute(Sender: TObject);
    procedure aFluoroExecute(Sender: TObject);
    procedure aTubExecute(Sender: TObject);
    procedure actPrintNapravExecute(Sender: TObject);
    procedure frxRepNaprGetValue(const VarName: string; var Value: Variant);
    procedure aSetDopExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
  private
    sDateSys : String;
		sZakl : String;
    wm : Integer; // workmode (режим работы: 1 - по году, 2 - по периоду)
    { Private declarations }
  public
    GET_SYSDATE_4REP : String;
  procedure CheckEnabledButtons;
    { Public declarations }
  end;

var
  frmJournal: TfrmJournal;

implementation
uses uPeriod, fMain, fOkonZakl, fAllHistory, fPacInfo, fFluoro, fTub,
  fSetPeriodCategory;
{$R *.dfm}

procedure TfrmJournal.aBaseExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmAllHistory, frmAllHistory);
  try
    frmAllHistory.DoShowForm(odsList.FieldByName('PEPLID').AsInteger,
                             odsList.FieldByName('PACFIO').AsString);
    frmAllHistory.ShowModal;
  finally
    frmAllHistory.Free;
  end;
end;

procedure TfrmJournal.aCloseSplExecute(Sender: TObject);
begin
  cxSplitter1.CloseSplitter;
end;

procedure TfrmJournal.actCloseExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmJournal.actCopyFIOExecute(Sender: TObject);
begin
  Clipboard.AsText := ReplaceSubStr(dsList.DataSet.FieldByName('PACFIO').AsString, '.', '');
end;

procedure TfrmJournal.actOkonZaklExecute(Sender: TObject);
var ods : TOracleDataSet;
     oq : TOracleQuery;
     id : Integer;
begin
  Application.CreateForm(TfrmOkonZakl, frmOkonZakl);
  try
    frmOkonZakl.DoShowForm(odsList.FieldByName('fk_pacid').AsInteger);
    frmOkonZakl.Caption := 'Окончательное заключение';
    if odsList.FieldByName('OKON_ZAKL').AsString <> '' then
      frmOkonZakl.cxOkonZakl.Text := odsList.FieldByName('OKON_ZAKL').AsString;
    frmOkonZakl.ShowModal;
    if frmOkonZakl.ModalResult = mrOk then
      begin
        ods := TOracleDataSet.Create(nil);
        oq := TOracleQuery.Create(nil);
        try
          ods.Session := frmMain.os;
          ods.Cursor := crSQLWait;
          ods.SQL.Text := ' DECLARE '+#13+
                          '   nCnt NUMBER; '+#13+
                          ' BEGIN '+#13+
                          '   SELECT COUNT(*) INTO nCnt FROM ASU.TIB WHERE FK_PACID = :PFK_PACID '+#13+
                          '                                      AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''FLUORO_OKON_ZAKL''); '+#13+
                          '   IF nCnt > 0 THEN '+#13+
                          '     UPDATE ASU.TIB SET FC_CHAR = :PFC_CHAR, FK_VRACHID = :PFK_VRACHID, FD_DATE = SYSDATE '+#13+
                          '      WHERE FK_PACID = :PFK_PACID AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''FLUORO_OKON_ZAKL''); '+#13+
                          '   ELSE '+#13+
                          '     INSERT INTO ASU.TIB(FC_CHAR, FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID, FD_DATE) '+#13+
                          '              VALUES(:PFC_CHAR, :PFK_PACID, (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''FLUORO_OKON_ZAKL''), '+#13+
                          '                     (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''FLUORO_OKON_ZAKL''), :PFK_VRACHID, SYSDATE); '+#13+
                          '   END IF; '+#13+
                          ' END; ';
          ods.DeclareAndSet('PFK_PACID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
          ods.DeclareAndSet('PFC_CHAR', otString, frmOkonZakl.cxOkonZakl.Text);
          ods.DeclareAndSet('PFK_VRACHID', otInteger, frmMain.pSOTRID);
          ods.Open;
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
//-- дообследование
          oq.SQL.Text := ' delete from asu.tnazid_doobsl where fk_nazid = :pfk_nazid ';
          oq.DeclareAndSet('pfk_nazid', otInteger, odsList.FieldByName('FK_ID').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
//-- последняя ФГ
          ods.DeleteVariables;
          ods.Close;
          ods.SQL.Text := ' merge into asu.tlastfluoro using dual on (fk_peplid = :pfk_peplid) '+#13+
                          '   when not matched then '+#13+
                          '     insert(fk_peplid, fd_date) values(:pfk_peplid, to_date(asu.get_last_fluoro_date(:pfk_peplid, 1), ''dd.mm.yyyy'')) '+#13+
                          '   when matched then '+#13+
                          '     update set fd_date = to_date(asu.get_last_fluoro_date(:pfk_peplid, 1), ''dd.mm.yyyy''), '+#13+
                          '                fc_num = asu.get_last_fluoro_num(:pfk_peplid) '+#13+
                          '      where fk_peplid = :pfk_peplid ';
          ods.DeclareAndSet('pfk_peplid', otInteger, odsList.FieldByName('peplid').AsInteger);
          ods.Open;
          frmMain.os.Commit;
          id := odsList.FieldByName('FK_ID').AsInteger;
          RefreshQuery(odsList);
          odsList.Locate('FK_ID', id, []);
        finally
          ods.Free;
          oq.Free;
        end;
      end;
  finally
    frmOkonZakl.Free;
  end;
end;

procedure TfrmJournal.actPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
     id : Integer;
begin
  id := odsList.FieldByName('FK_ID').AsInteger;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS SYSTEMDATE FROM DUAL ';
    ods.Open;
    GET_SYSDATE_4REP := ods.FieldByName('SYSTEMDATE').AsString;
  finally
    ods.Free;
  end;
  frxRepList.ShowReport;
  odsList.Locate('FK_ID', id, []);
end;

procedure TfrmJournal.actPrintNapravExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
	ods := TOracleDataSet.Create(nil);
  try
		ods.Session := frmMain.os;
		ods.Cursor := crSQLWait;
		ods.SQL.Text := ' select TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS DATESYS, '+#13+
                    '        asu.do_vrachfio(fk_ispolid) as vrachfio '+#13+
										'   FROM asu.tnazis '+#13+
                    '  where fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
		ods.Open;
		sDateSys := ods.FieldByName('DATESYS').AsString;
		sZakl := odsList.FieldByName('NAMEISSL').AsString+#13+
             odsList.FieldByName('DATENUM').AsString+', № '+odsList.FieldByName('numissl').AsString+#13+
             odsList.FieldByName('PR_ZAKL').AsString+#13+ods.FieldByName('vrachfio').AsString;
	finally
		ods.Free;
  end;
	frxRepNapr.ShowReport;
end;

procedure TfrmJournal.actTextExecute(Sender: TObject);
begin
  dlgSavePopUp.DefaultExt := 'txt';
  dlgSavePopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if dlgSavePopUp.Execute then
    if TVDOOBSL.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(dlgSavePopUp.FileName, cxGrDoobsledovan, TRUE, FALSE)
    else
      ExportGridToText(dlgSavePopUp.FileName, cxGrDoobsledovan, TRUE, TRUE);
end;

procedure TfrmJournal.actWebExecute(Sender: TObject);
begin
  dlgSavePopUp.DefaultExt := 'html';
  dlgSavePopUp.Filter := 'Web-страницы (*.html)|*.html';
  if dlgSavePopUp.Execute then
    if TVDOOBSL.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(dlgSavePopUp.FileName, cxGrDoobsledovan, TRUE, FALSE)
    else
      ExportGridToHTML(dlgSavePopUp.FileName, cxGrDoobsledovan, TRUE, TRUE);
end;

procedure TfrmJournal.actXLSExecute(Sender: TObject);
begin
  dlgSavePopUp.DefaultExt := 'xls';
  dlgSavePopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if dlgSavePopUp.Execute then
    if TVDOOBSL.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(dlgSavePopUp.FileName, cxGrDoobsledovan, TRUE, FALSE)
    else
      ExportGridToExcel(dlgSavePopUp.FileName, cxGrDoobsledovan, TRUE, TRUE);
end;

procedure TfrmJournal.actXMLExecute(Sender: TObject);
begin
  dlgSavePopUp.DefaultExt := 'xml';
  dlgSavePopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if dlgSavePopUp.Execute then
    if TVDOOBSL.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(dlgSavePopUp.FileName, cxGrDoobsledovan, TRUE, FALSE)
    else
      ExportGridToXML(dlgSavePopUp.FileName, cxGrDoobsledovan, TRUE, TRUE);
end;

procedure TfrmJournal.aEditExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSetPeriodCategory, frmSetPeriodCategory);
  try
    frmSetPeriodCategory.DoPeriod(odsList.FieldByName('PEPLID').AsInteger);
    frmSetPeriodCategory.ShowModal;
    if frmSetPeriodCategory.ModalResult = mrOk then
      begin
        //
      end;
  finally
    frmSetPeriodCategory.Free;
  end;
end;

procedure TfrmJournal.aFluoroExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmFluoro, frmFluoro);
  try
    frmFluoro.DoShowForm(odsList.FieldByName('PACFIO').AsString,
                         odsList.FieldByName('FK_PACID').AsInteger,
                         odsList.FieldByName('PEPLID').AsInteger); //peplid
    frmFluoro.ShowModal;
//    if frmFluoro.isEdit = True then
//      begin
//        odsPac.AfterScroll := nil;
//        RefreshQuery(odsPac);
//        odsPac.AfterScroll := odsPacAfterScroll;
//        sFIO.SetFocus;
//      end;
  finally
    frmFluoro.Free;
  end;
end;

procedure TfrmJournal.aInfoExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  Application.CreateForm(TfrmPacInfo, frmPacInfo);
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT ASU.GET_NAPRAVLEN(:PFK_PACID, :PFK_ID) AS OTDEL FROM DUAL ';
    ods.DeclareAndSet('PFK_PACID', otInteger, odsList.FieldByName('FK_PACID').AsInteger);
    ods.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
    ods.Open;
    frmPacInfo.DoShowPacInfo(odsList.FieldByName('FK_PACID').AsInteger,
                             odsList.FieldByName('PEPLID').AsInteger,
                             ods.FieldByName('OTDEL').AsString);
    frmPacInfo.ShowModal;
  finally
    ods.Free;
    frmPacInfo.Free;
  end;
end;

procedure TfrmJournal.aOpenSplExecute(Sender: TObject);
begin
  cxSplitter1.OpenSplitter;
end;

procedure TfrmJournal.aRefreshExecute(Sender: TObject);
begin
  if wm = 1 then //по году
    begin
      odsList.Close;
      odsList.SetVariable('PDATE1', StrToDateTime('21.12.'+IntToStr(seYear.Value-1)));
      odsList.SetVariable('PDATE2', StrToDateTime('20.12.'+IntToStr(seYear.Value)+' 23:59:59'));
      odsList.Open;
      frmJournal.Caption := 'Журнал дообследования '+seYear.Text+' год';
    end;
  if wm = 2 then //по датам
    begin
      odsList.Close;
      odsList.SetVariable('PDATE1', deBegin.Date);
      odsList.SetVariable('PDATE2', deEnd.Date+StrToDateTime('23:59:59'));
      odsList.Open;
      frmJournal.Caption := 'Журнал дообследования с: '+DateTimeToStr(deBegin.Date)+' по: '+DateTimeToStr(deEnd.Date);
    end;
end;

procedure TfrmJournal.aSetDopExecute(Sender: TObject);
var ods : TOracleDataSet;
     id : Integer;
begin
  Application.CreateForm(TfrmOkonZakl, frmOkonZakl);
  try
    frmOkonZakl.Caption := 'Дополнительно';
    if odsList.FieldByName('DOP').AsString <> '' then
      frmOkonZakl.cxOkonZakl.Text := odsList.FieldByName('DOP').AsString;
    frmOkonZakl.ShowModal;
    if frmOkonZakl.ModalResult = mrOk then
      begin
        ods := TOracleDataSet.Create(nil);
        try
          ods.Session := frmMain.os;
          ods.Cursor := crSQLWait;
          ods.SQL.Text := ' DECLARE '+#13+
                          '   nCnt NUMBER; '+#13+
                          ' BEGIN '+#13+
                          '   SELECT COUNT(*) INTO nCnt '+#13+
                          '     FROM ASU.TIB WHERE FK_PACID = :PFK_PACID '+#13+
                          '                    AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''JOURNAL_DOOBSL_DOP''); '+#13+
                          '   IF nCnt > 0 THEN '+#13+
                          '     UPDATE ASU.TIB SET FC_CHAR = :PFC_CHAR, FK_VRACHID = :PFK_VRACHID, FD_DATE = SYSDATE '+#13+
                          '      WHERE FK_PACID = :PFK_PACID '+#13+
                          '        AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''JOURNAL_DOOBSL_DOP''); '+#13+
                          '   ELSE '+#13+
                          '     INSERT INTO ASU.TIB(FC_CHAR, FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID, FD_DATE) '+#13+
                          '     VALUES(:PFC_CHAR, :PFK_PACID, (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''JOURNAL_DOOBSL_DOP''), '+#13+
                          '             (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''JOURNAL_DOOBSL_DOP''), :PFK_VRACHID, SYSDATE); '+#13+
                          '   END IF; '+#13+
                          ' END; ';
          ods.DeclareAndSet('PFK_PACID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
          ods.DeclareAndSet('PFC_CHAR', otString, frmOkonZakl.cxOkonZakl.Text);
          ods.DeclareAndSet('PFK_VRACHID', otInteger, frmMain.pSOTRID);
          ods.Open;
          frmMain.os.Commit;
          id := odsList.FieldByName('FK_ID').AsInteger;
          RefreshQuery(odsList);
          odsList.Locate('FK_ID', id, []);
        finally
          ods.Free;
        end;
      end;
  finally
    frmOkonZakl.Free;
  end;
end;

procedure TfrmJournal.aTubExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmTub, frmTub);
  try
    frmTub.DoShowFormTub(odsList.FieldByName('PEPLID').AsInteger, odsList.FieldByName('PACFIO').AsString);
    frmTub.ShowModal;
  finally
    frmTub.Free;
  end;
end;

procedure TfrmJournal.bPeriodClick(Sender: TObject);
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

procedure TfrmJournal.bTodayClick(Sender: TObject);
begin
  deBegin.Date := StartOfTheDay(Now);
  deEnd.Date := EndOfTheDay(Now);
end;

procedure TfrmJournal.bYesterdayClick(Sender: TObject);
begin
  deBegin.Date := StartOfTheDay(Yesterday);
  deEnd.Date := EndOfTheDay(Yesterday);
end;

procedure TfrmJournal.cbDatesPropertiesEditValueChanged(Sender: TObject);
begin
  case cbDates.ItemIndex of
  0: // пусто (тоже самое что и 1 день = выставляется текущая дата)
    begin
      deBegin.Properties.OnEditValueChanged := nil;
      deEnd.Properties.OnEditValueChanged := nil;
      deBegin.Date := StartOfTheDay(Now);
      deEnd.Date := EndOfTheDay(Now);
    end;
  1: // 1 день
    begin
      deBegin.Properties.OnEditValueChanged := nil;
      deEnd.Properties.OnEditValueChanged := nil;
      deBegin.Date := StartOfTheDay(Now);
      deEnd.Date := EndOfTheDay(Now);
    end;
  2: // 3 дня
    begin
      deBegin.Properties.OnEditValueChanged := nil;
      deEnd.Properties.OnEditValueChanged := nil;
      deBegin.Date := StartOfTheDay(Yesterday);
      deEnd.Date := EndOfTheDay(Tomorrow);
    end;
  3: // неделя
    begin
      deBegin.Properties.OnEditValueChanged := nil;
      deEnd.Properties.OnEditValueChanged := nil;
      deBegin.Date := StartOfTheWeek(Now);
      deEnd.Date := EndOfTheWeek(Now);
    end;
  4: // месяц
    begin
      deBegin.Properties.OnEditValueChanged := nil;
      deEnd.Properties.OnEditValueChanged := nil;
      deBegin.Date := StartOfTheMonth(Now);
      deEnd.Date := EndOfTheMonth(Now);
    end;
  5: // год
    begin
      deBegin.Properties.OnEditValueChanged := nil;
      deEnd.Properties.OnEditValueChanged := nil;
      deBegin.Date := StartOfTheYear(Now);
      deEnd.Date := EndOfTheYear(Now);
    end;
  end;
end;

procedure TfrmJournal.chb1PropertiesEditValueChanged(Sender: TObject);
begin
  if chb1.Checked then
    begin
      cxSplitter2.CloseSplitter;
      gbPeriod.Enabled := False;
      wm := 3;
      teFIO.Enabled := True;
      bFIO.Enabled := True;
      teNum.Enabled := True;
      bNum.Enabled := True;
      rb1.Enabled := False;
      rb2.Enabled := False;
      seYear.Enabled := False;
    end else
    begin
      cxSplitter2.OpenSplitter;
      gbPeriod.Enabled := True;
      teFIO.Enabled := False;
      bFIO.Enabled := False;
      teNum.Enabled := False;
      bNum.Enabled := False;
      rb1.Enabled := True;
      rb2.Enabled := True;
      if rb1.Checked then
        begin
          seYear.Enabled := True;
          paPeriod.Enabled := False;
          deBegin.Enabled := False;
          deEnd.Enabled := False;
          cbDates.Enabled := False;
          bToday.Enabled := False;
          bYesterday.Enabled := False;
          bPeriod.Enabled := False;
          wm := 1;
        end;
      if rb2.Checked then
        begin
          seYear.Enabled := False;
          paPeriod.Enabled := True;
          deBegin.Enabled := True;
          deEnd.Enabled := True;
          cbDates.Enabled := True;
          bToday.Enabled := True;
          bYesterday.Enabled := True;
          bPeriod.Enabled := True;
          wm := 2;
        end;
    end;
end;

procedure TfrmJournal.CheckEnabledButtons;
begin
  actPrint.Enabled := odsList.RecordCount <> 0;
  actOkonZakl.Enabled := odsList.RecordCount <> 0;
  aBase.Enabled := odsList.RecordCount <> 0;
  aInfo.Enabled := odsList.RecordCount <> 0;
  aFluoro.Enabled := odsList.RecordCount <> 0;
  aTub.Enabled := odsList.RecordCount <> 0;
	actPrintNaprav.Enabled := odsList.RecordCount <> 0;
  aSetDop.Enabled := odsList.RecordCount <> 0;
  aEdit.Enabled := odsList.RecordCount <> 0;
end;

procedure TfrmJournal.cxSplitter1BeforeClose(Sender: TObject; var AllowClose: Boolean);
begin
  paDates.Visible := False;
end;

procedure TfrmJournal.cxSplitter1BeforeOpen(Sender: TObject;
  var NewSize: Integer; var AllowOpen: Boolean);
begin
  paDates.Visible := True;
end;

procedure TfrmJournal.cxSplitter2BeforeClose(Sender: TObject;
  var AllowClose: Boolean);
begin
  gbPeriod.Visible := False;
end;

procedure TfrmJournal.cxSplitter2BeforeOpen(Sender: TObject;
  var NewSize: Integer; var AllowOpen: Boolean);
begin
  gbPeriod.Visible := True;
end;

procedure TfrmJournal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TVDOOBSL.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TVDOOBSL'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVDOOBSL');
end;

procedure TfrmJournal.FormCreate(Sender: TObject);
begin
	actPrintNaprav.Enabled := False;
  actPrint.Enabled := False;
  actOkonZakl.Enabled := False;
  aBase.Enabled := False;
  aInfo.Enabled := False;
  aFluoro.Enabled := False;
  aTub.Enabled := False;
  aEdit.Enabled := False;
  aSetDop.Enabled := False;
  TVDOOBSL.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TVDOOBSL'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TVDOOBSL');
  TVDOOBSL.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TVDOOBSL'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVDOOBSL');
end;

procedure TfrmJournal.FormShow(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TRUNC(SYSDATE) AS DATESYS, TO_CHAR(SYSDATE, ''YYYY'') AS SYSYEAR FROM DUAL ';
    ods.Open;
    deEnd.Date := ods.FieldByName('DATESYS').AsDateTime;
    seYear.Value := StrToInt(ods.FieldByName('SYSYEAR').AsString);
  finally
    ods.Free;
  end;
  deBegin.Date := StrToDate('01.01.'+IntToStr(CurrentYear));
  rb1.Checked := True;
  wm := 1;
end;

procedure TfrmJournal.frxRepListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if wm = 1 then
    begin
      if VarName = 'DATE1' then Value := StrToDateTime('21.12.'+IntToStr(seYear.Value-1));
      if VarName = 'DATE2' then Value := StrToDateTime('20.12.'+IntToStr(seYear.Value));
    end;
  if wm = 2 then
    begin
      if VarName = 'DATE1' then Value := deBegin.Date;
      if VarName = 'DATE2' then Value := FormatDateTime('dd.mm.yyyy', deEnd.Date);
    end;
  if VarName = 'KOLVOPAC' then Value := odsList.RecordCount;
  if VarName = 'SOTR' then Value := frmMain.sVrachFIO;
  if VarName = 'SYSDATE' then Value := GET_SYSDATE_4REP;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;  
end;

procedure TfrmJournal.frxRepNaprGetValue(const VarName: string; var Value: Variant);
begin
	if VarName = 'NAMEORG' then Value := frmMain.sCompanyName_4Rep;
	if VarName = 'DATESYS' then Value := sDateSys;
	if VarName = 'SOTR' then Value := frmMain.sVrachFIO;
	if VarName = 'PACFIO' then Value := odsList.FieldByName('PACFIO').AsString;
	if VarName = 'DATEROJD' then Value := odsList.FieldByName('DATEROJD').AsDateTime;
	if VarName = 'WORKPLACE' then Value := odsList.FieldByName('WORKPLACE').AsString;
	if VarName = 'ADDRESS' then Value := odsList.FieldByName('ADDRESS').AsString;
	if VarName = 'ZAKL' then Value := sZakl;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
end;

procedure TfrmJournal.N2Click(Sender: TObject);
begin
  TVDOOBSL.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TVDOOBSL'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TVDOOBSL');
end;

procedure TfrmJournal.odsListAfterOpen(DataSet: TDataSet);
begin
  CheckEnabledButtons;
  if odsList.RecordCount > 0 then
    begin
      if wm = 1 then
        begin
          odsCount.Close;
          odsCount.SetVariable('pdate1', StrToDateTime('21.12.'+IntToStr(seYear.Value-1)));
          odsCount.SetVariable('pdate2', StrToDateTime('20.12.'+IntToStr(seYear.Value)+' 23:59:59'));
          odsCount.Open;
          lbKolvo.Caption := IntToStr(odsCount.FieldByName('cnt').AsInteger);
        end;
      if wm = 2 then
        begin
          odsCount.Close;
          odsCount.SetVariable('pdate1', deBegin.Date);
          odsCount.SetVariable('pdate2', deEnd.Date+StrToDateTime('23:59:59'));
          odsCount.Open;
          lbKolvo.Caption := IntToStr(odsCount.FieldByName('cnt').AsInteger);
        end; 
    end else
    begin
      lbKolvo.Caption := '0';
    end;
end;

procedure TfrmJournal.odsListBeforeOpen(DataSet: TDataSet);
begin
//  odsList.SetVariable('PDATE1', dxBegin.Date);
//  odsList.SetVariable('PDATE2', dxEnd.Date);
end;

procedure TfrmJournal.rb1Click(Sender: TObject);
begin
  paPeriod.Enabled := False;
  deBegin.Enabled := False;
  deEnd.Enabled := False;
  cbDates.Enabled := False;
  bToday.Enabled := False;
  bYesterday.Enabled := False;
  bPeriod.Enabled := False;
  paDate.Enabled := True;
  seYear.Enabled := True;
  wm := 1;
end;

procedure TfrmJournal.rb2Click(Sender: TObject);
begin
  paPeriod.Enabled := True;
  deBegin.Enabled := True;
  deEnd.Enabled := True;
  cbDates.Enabled := True;
  bToday.Enabled := True;
  bYesterday.Enabled := True;
  bPeriod.Enabled := True;
  paDate.Enabled := False;
  seYear.Enabled := False;
  wm := 2;
end;

end.
