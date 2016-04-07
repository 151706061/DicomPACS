unit fJur;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2007Green, Menus,
  cxGraphics, cxSplitter, cxCheckBox, cxTextEdit, StdCtrls, cxRadioGroup,
  cxDropDownEdit, cxButtons, cxMaskEdit, cxCalendar, cxLabel, JvExExtCtrls,
  JvExtComponent, JvPanel, cxControls, cxContainer, cxEdit, cxGroupBox, ExtCtrls,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  DB, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxMemo, FIBDataSet,
  pFIBDataSet, dxSkinsdxBarPainter, dxBar, dxBarExtItems, ActnList, DateUtils, jvDBUtils,
  frxClass, frxDBSet, ImgList, cxGridExportLink, dxSkinBlack, Medotrade;

type
  TfrmJur = class(TForm)
    paParam: TPanel;
    gbPeriod: TcxGroupBox;
    paPeriod: TJvPanel;
    cxLabel5: TcxLabel;
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
    p1: TPanel;
    p2: TPanel;
    p3: TPanel;
    p4: TPanel;
    p5: TPanel;
    p6: TPanel;
    p7: TPanel;
    pMonth: TPanel;
    deDate: TcxDateEdit;
    cxLabel1: TcxLabel;
    rb1: TcxRadioButton;
    rb2: TcxRadioButton;
    cxSplitter1: TcxSplitter;
    bLWeek: TcxButton;
    bLMon: TcxButton;
    bRMon: TcxButton;
    bRWeek: TcxButton;
    paJournal: TJvPanel;
    memLog: TcxMemo;
    cxSplitter2: TcxSplitter;
    cxGr: TcxGrid;
    TVLOGS: TcxGridDBTableView;
    VDATE: TcxGridDBColumn;
    VEVENT: TcxGridDBColumn;
    cxGrLevel1: TcxGridLevel;
    cxSplitter3: TcxSplitter;
    sLogs: TDataSource;
    dsLogs: TpFIBDataSet;
    dsLogsFK_ID: TFIBIntegerField;
    dsLogsFC_NAME: TFIBStringField;
    dsLogsFN_TYPE: TFIBIntegerField;
    dsLogsFD_DATE: TFIBDateTimeField;
    dsLogsFC_REMARK: TFIBStringField;
    dsLogsDates: TpFIBDataSet;
    FIBIntegerField1: TFIBIntegerField;
    FIBStringField1: TFIBStringField;
    FIBIntegerField2: TFIBIntegerField;
    FIBDateTimeField1: TFIBDateTimeField;
    FIBStringField2: TFIBStringField;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    dxBarDockControl1: TdxBarDockControl;
    bbRefresh: TdxBarLargeButton;
    bbPrint: TdxBarLargeButton;
    bbClose: TdxBarLargeButton;
    al: TActionList;
    aRefresh: TAction;
    aPrint: TAction;
    aClose: TAction;
    frxRep: TfrxReport;
    frxDB: TfrxDBDataset;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    N2: TMenuItem;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    sdPopUp: TSaveDialog;
    cxGroupBox2: TcxGroupBox;
    rbAll: TcxRadioButton;
    rbStart: TcxRadioButton;
    rbStop: TcxRadioButton;
    rbError: TcxRadioButton;
    rbEvents: TcxRadioButton;
    rbParamEdit: TcxRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure deDatePropertiesEditValueChanged(Sender: TObject);
    procedure bLMonClick(Sender: TObject);
    procedure bLWeekClick(Sender: TObject);
    procedure bRWeekClick(Sender: TObject);
    procedure bRMonClick(Sender: TObject);
    procedure p1Click(Sender: TObject);
    procedure p2Click(Sender: TObject);
    procedure p3Click(Sender: TObject);
    procedure p4Click(Sender: TObject);
    procedure p5Click(Sender: TObject);
    procedure p6Click(Sender: TObject);
    procedure p7Click(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure bTodayClick(Sender: TObject);
    procedure bYesterdayClick(Sender: TObject);
    procedure bPeriodClick(Sender: TObject);
    procedure cbDatesPropertiesEditValueChanged(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure dsLogsBeforeOpen(DataSet: TDataSet);
    procedure dsLogsDatesBeforeOpen(DataSet: TDataSet);
    procedure dsLogsDatesAfterScroll(DataSet: TDataSet);
    procedure dsLogsAfterScroll(DataSet: TDataSet);
    procedure frxRepGetValue(const VarName: string; var Value: Variant);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N2Click(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
  private
    procedure DateChange;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmJur: TfrmJur;

implementation
uses uPeriod, fMain, DB_CMN;
{$R *.dfm}

procedure TfrmJur.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmJur.aPrintExecute(Sender: TObject);
var id : Integer;
begin
  id := sLogs.DataSet.FieldValues['FK_ID'];
  frxDB.DataSet := sLogs.DataSet;
  frxRep.ShowReport;
  sLogs.DataSet.Locate('FK_ID', id, []);
end;

procedure TfrmJur.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(sLogs.DataSet);
  if rbAll.Checked then
    begin
      if sLogs.DataSet.Filtered = True then
        sLogs.DataSet.Filtered := False;
        sLogs.DataSet.Filter := '';
      end;
  if rbStart.Checked then
    begin
      sLogs.DataSet.Filter := 'FN_TYPE = '+IntToStr(1);
      sLogs.DataSet.Filtered := True;
    end;
  if rbStop.Checked then
    begin
      sLogs.DataSet.Filter := 'FN_TYPE = '+IntToStr(2);
      sLogs.DataSet.Filtered := True;
    end;
  if rbError.Checked then
    begin
      sLogs.DataSet.Filter := 'FN_TYPE = '+IntToStr(3);
      sLogs.DataSet.Filtered := True;
    end;
  if rbEvents.Checked then
    begin
      sLogs.DataSet.Filter := 'FN_TYPE = '+IntToStr(4);
      sLogs.DataSet.Filtered := True;
    end;
  if rbParamEdit.Checked then
    begin
      sLogs.DataSet.Filter := 'FN_TYPE = '+IntToStr(5);
      sLogs.DataSet.Filtered := True;
    end;
end;

procedure TfrmJur.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := '“екстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if tvLogs.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmJur.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if tvLogs.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmJur.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := '“аблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if tvLogs.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmJur.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if tvLogs.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmJur.bLMonClick(Sender: TObject);
var mm,yy,dd:word;
begin
  decodeDate(deDate.EditValue,yy,mm,dd);
  if dd=31 then dd:=30;
  if ((mm=3) and (dd>28)) then dd:=28;
  if mm>1 then mm:=mm-1
   else
     begin
       mm:=12;
       yy:=yy-1;
     end;

  deDate.EditValue:=encodeDate(yy,mm,dd);
end;

procedure TfrmJur.bLWeekClick(Sender: TObject);
begin
  deDate.EditValue:=deDate.EditValue-1;
end;

procedure TfrmJur.bPeriodClick(Sender: TObject);
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

procedure TfrmJur.bRMonClick(Sender: TObject);
var yy,mm,dd:word;
begin
  decodeDate(deDate.EditValue,yy,mm,dd);
  if dd=31 then dd:=30;
  if ((mm=1) and (dd>28)) then dd:=28;
  if mm<12 then mm:=mm+1
   else
     begin
       mm:=1;
       yy:=yy+1;
     end;
  deDate.EditValue:=encodeDate(yy,mm,dd);
end;

procedure TfrmJur.bRWeekClick(Sender: TObject);
begin
  deDate.EditValue:=deDate.EditValue+1;
end;

procedure TfrmJur.bTodayClick(Sender: TObject);
begin
  deBegin.Date := StartOfTheDay(Now);
  deEnd.Date := EndOfTheDay(Now);
end;

procedure TfrmJur.bYesterdayClick(Sender: TObject);
begin
  deBegin.Date := StartOfTheDay(Yesterday);
  deEnd.Date := EndOfTheDay(Yesterday);
end;

procedure TfrmJur.cbDatesPropertiesEditValueChanged(Sender: TObject);
begin
  case cbDates.ItemIndex of
  0: // пусто (тоже самое что и 1 день = выставл€етс€ текуща€ дата)
    begin
      deBegin.Date := StartOfTheDay(Now);
      deEnd.Date := EndOfTheDay(Now);
    end;
  1: // 1 день
    begin
      deBegin.Date := StartOfTheDay(Now);
      deEnd.Date := EndOfTheDay(Now);
    end;
  2: // 3 дн€
    begin
      deBegin.Date := StartOfTheDay(Yesterday);
      deEnd.Date := EndOfTheDay(Tomorrow);
    end;
  3: // недел€
    begin
      deBegin.Date := StartOfTheWeek(Now);
      deEnd.Date := EndOfTheWeek(Now);
    end;
  4: // мес€ц
    begin
      deBegin.Date := StartOfTheMonth(Now);
      deEnd.Date := EndOfTheMonth(Now);
    end;
  5: // год
    begin
      deBegin.Date := StartOfTheYear(Now);
      deEnd.Date := EndOfTheYear(Now);
    end;
  end;
end;

procedure TfrmJur.DateChange;
var
 yy,mm,dd:word;
 wd:integer;
begin
	pMonth.Caption:=FormatDateTime('mmmm',deDate.EditValue)+', '+(FormatDateTime('dddd',deDate.EditValue));

	wd:=dayofweek(deDate.EditValue);
	if wd=1 then wd:=8;

	decodeDate(deDate.EditValue-wd+2,yy,mm,dd);
	p1.Caption:=inttostr(dd);

	decodeDate(deDate.EditValue-wd+3,yy,mm,dd);
	p2.Caption:=inttostr(dd);

	decodeDate(deDate.EditValue-wd+4,yy,mm,dd);
	p3.Caption:=inttostr(dd);

	decodeDate(deDate.EditValue-wd+5,yy,mm,dd);
	p4.Caption:=inttostr(dd);

	decodeDate(deDate.EditValue-wd+6,yy,mm,dd);
	p5.Caption:=inttostr(dd);

	decodeDate(deDate.EditValue-wd+7,yy,mm,dd);
	p6.Caption:=inttostr(dd);

  decodeDate(deDate.EditValue-wd+8,yy,mm,dd);
  p7.Caption:=inttostr(dd);

  p1.Color:=clCream;
  p2.Color:=clCream;
  p3.Color:=clCream;
  p4.Color:=clCream;
  p5.Color:=clCream;
  p6.Color:=clCream;
  p7.Color:=clCream;
  case wd-1 of
    1:p1.Color:=clSkyBlue;
    2:p2.Color:=clSkyBlue;
    3:p3.Color:=clSkyBlue;
    4:p4.Color:=clSkyBlue;
    5:p5.Color:=clSkyBlue;
    6:p6.Color:=clSkyBlue;
    7:p7.Color:=clSkyBlue;
  end;
end;

procedure TfrmJur.deDatePropertiesEditValueChanged(Sender: TObject);
begin
  DateChange;
  aRefreshExecute(nil);
end;

procedure TfrmJur.dsLogsAfterScroll(DataSet: TDataSet);
begin
  memLog.Lines.Text := dsLogs.FieldByName('FC_REMARK').AsString;
end;

procedure TfrmJur.dsLogsBeforeOpen(DataSet: TDataSet);
begin
  dsLogs.ParamByName('PDATE').AsDateTime := deDate.Date;
end;

procedure TfrmJur.dsLogsDatesAfterScroll(DataSet: TDataSet);
begin
  memLog.Lines.Text := dsLogsDates.FieldByName('FC_REMARK').AsString;
end;

procedure TfrmJur.dsLogsDatesBeforeOpen(DataSet: TDataSet);
begin
  dsLogsDates.ParamByName('FD_DATE1').AsDateTime := deBegin.Date;
  dsLogsDates.ParamByName('FD_DATE2').AsDateTime := StrToDateTime(FormatDateTime('dd.mm.yyyy', deEnd.Date)+' 23:59:59');
end;

procedure TfrmJur.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tvLogs.StoreToRegistry('\SoftWare\SoftMaster\DicomClient\fJur\tvLogs', TRUE, [], 'tvLogs');
end;

procedure TfrmJur.FormCreate(Sender: TObject);
begin
  dsLogs.Database := DB_CMN.DB;
  dsLogs.Transaction := DB_CMN.trRead;
  dsLogsDates.Database := DB_CMN.DB;
  dsLogsDates.Transaction := DB_CMN.trRead;
  //
  deDate.Date := Date;
  deBegin.Date := Date;
  deEnd.Date := Date;
  rb1.Checked := True;
  rbAll.Checked := True;
  tvLogs.StoreToRegistry('\SoftWare\SoftMaster\DicomClient\fJur\tvLogsDefault', True, [], 'tvLogs'); // поднимаем из реестра настройки грида дл€ архива
  tvLogs.RestoreFromRegistry('\SoftWare\SoftMaster\DicomClient\fJur\tvLogs', False, False, [], 'tvLogs');
  //
end;

procedure TfrmJur.frxRepGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'DATESYS' then Value := FormatDateTime('dd.mm.yyyy hh:mm', Now);
end;

procedure TfrmJur.N2Click(Sender: TObject);
begin
  tvLogs.RestoreFromRegistry('\SoftWare\SoftMaster\DicomClient\fJur\tvLogsDefault', False, False, [], 'tvLogs');
end;

procedure TfrmJur.p1Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(deDate.EditValue);
  if wd=1 then wd:=8;
  deDate.EditValue:=deDate.EditValue-wd+2;
end;

procedure TfrmJur.p2Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(deDate.EditValue);
  if wd=1 then wd:=8;
  deDate.EditValue:=deDate.EditValue-wd+3;
end;

procedure TfrmJur.p3Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(deDate.EditValue);
  if wd=1 then wd:=8;
  deDate.EditValue:=deDate.EditValue-wd+4;
end;

procedure TfrmJur.p4Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(deDate.EditValue);
  if wd=1 then wd:=8;
  deDate.EditValue:=deDate.EditValue-wd+5;
end;

procedure TfrmJur.p5Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(deDate.EditValue);
  if wd=1 then wd:=8;
  deDate.EditValue:=deDate.EditValue-wd+6;
end;

procedure TfrmJur.p6Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(deDate.EditValue);
  if wd=1 then wd:=8;
  deDate.EditValue:=deDate.EditValue-wd+7;
end;

procedure TfrmJur.p7Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(deDate.EditValue);
  if wd=1 then wd:=8;
  deDate.EditValue:=deDate.EditValue-wd+8;
end;

procedure TfrmJur.rb1Click(Sender: TObject);
begin
  paDate.Enabled := True;
  paDateButtons.Enabled := True;
  paPeriod.Enabled := False;
  deBegin.Enabled := False;
  deEnd.Enabled := False;
  bPeriod.Enabled := False;
  sLogs.DataSet.Close;
  sLogs.DataSet := dsLogs;
  sLogs.DataSet.Open;
  deDate.Enabled := True;
  cbDates.Enabled := False;
  bToday.Enabled := False;
  bYesterday.Enabled := False;
  pMonth.Color := clSkyBlue;
  DateChange;
  aPrint.Enabled := sLogs.DataSet.RecordCount <> 0;
end;

procedure TfrmJur.rb2Click(Sender: TObject);
begin
  paDate.Enabled := False;
  paDateButtons.Enabled := False;
  paPeriod.Enabled := True;
  deBegin.Enabled := True;
  deEnd.Enabled := True;
  bPeriod.Enabled := True;
  sLogs.DataSet.Close;
  sLogs.DataSet := dsLogsDates;
  sLogs.DataSet.Open;
  deDate.Enabled := False;
  cbDates.Enabled := True;
  bToday.Enabled := True;
  bYesterday.Enabled := True;

  pMonth.Color := clBtnFace;
  p1.Color := clBtnFace;
  p2.Color := clBtnFace;
  p3.Color := clBtnFace;
  p4.Color := clBtnFace;
  p5.Color := clBtnFace;
  p6.Color := clBtnFace;
  p7.Color := clBtnFace;

  aPrint.Enabled := sLogs.DataSet.RecordCount <> 0;
end;

end.
