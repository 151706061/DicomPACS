unit fJournalNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, ActnList, cxClasses, DB, OracleData, cxDBLookupComboBox,
  cxBarEditItem, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxControls, cxGridCustomView, cxGrid, dxmdaset, Oracle, Menus, cxGridExportLink,
  Clipbrd, frxClass, frxDBSet, cxLabel, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxSkinsdxBarPainter, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmJournalNew = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbClose: TdxBarButton;
    al: TActionList;
    aClose: TAction;
    dsPeriod: TDataSource;
    odsPeriod: TOracleDataSet;
    lcbPeriod: TcxBarEditItem;
    bbRefresh: TdxBarButton;
    aRefresh: TAction;
    oqThread: TOracleQuery;
    memData: TdxMemData;
    memDataFK_ID: TIntegerField;
    memDataFIO: TStringField;
    memDataPACID: TIntegerField;
    memDataPLANDATE: TStringField;
    memDataPER: TStringField;
    memDataUCH: TStringField;
    memDataLAST: TStringField;
    cxGr: TcxGrid;
    TV: TcxGridTableView;
    VFK_ID: TcxGridColumn;
    VFIO: TcxGridColumn;
    VAGE: TcxGridColumn;
    VPLANDATE: TcxGridColumn;
    VPER: TcxGridColumn;
    VUCH: TcxGridColumn;
    VLAST: TcxGridColumn;
    cxGrLevel1: TcxGridLevel;
    memDataAGE: TIntegerField;
    bbPrint: TdxBarButton;
    aPrint: TAction;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    N3: TMenuItem;
    N2: TMenuItem;
    dlgSavePopUp: TSaveDialog;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    frxList: TfrxReport;
    frxDBList: TfrxDBDataset;
    bbEdit: TdxBarButton;
    aEdit: TAction;
    memDataUID: TIntegerField;
    VUID: TcxGridColumn;
    N4: TMenuItem;
    N5: TMenuItem;
    oqIns: TOracleQuery;
    oqUpd: TOracleQuery;
    aPeriod: TAction;
    bbPeriod: TdxBarButton;
    lbPeriod: TcxBarEditItem;
    VGRA: TcxGridColumn;
    memDataGRA: TStringField;
    memDatarojd: TDateField;
    VROJD: TcxGridColumn;
    bbPac: TdxBarButton;
    aPac: TAction;
    procedure aCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure frxListGetValue(const VarName: string; var Value: Variant);
    procedure aEditExecute(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure aPeriodExecute(Sender: TObject);
    procedure aPacExecute(Sender: TObject);
  private
    russian : HKL;
    GET_SYSDATE_4REP : String;
    pDate1, pDate2 : TDateTime;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmJournalNew: TfrmJournalNew;

implementation
uses fMain, fSetPeriodCategory, fSetDateFG, uPeriod, fPac;
{$R *.dfm}

procedure TfrmJournalNew.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmJournalNew.aEditExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  Application.CreateForm(TfrmSetPeriodCategory, frmSetPeriodCategory);
  try
    frmSetPeriodCategory.DoPeriod(TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFK_ID.Index]);
    frmSetPeriodCategory.ShowModal;
    if frmSetPeriodCategory.ModalResult = mrOk then
      begin
        TV.DataController.Values[TV.DataController.FocusedRecordIndex, VPER.Index] := frmSetPeriodCategory.cxPeriod.EditText;
// -- план
        ods := TOracleDataSet.Create(nil);
        try
          ods.Session := frmMain.os;
          ods.Cursor := crSQLWait;
          ods.SQL.Text := ' select asu.get_plan_fluoro_date(:pfk_peplid) as plan_date from dual ';
          ods.DeclareAndSet('pfk_peplid', otInteger, TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFK_ID.Index]);
          ods.Open;
          if ods.FieldByName('plan_date').AsString <> '' then
            TV.DataController.Values[TV.DataController.FocusedRecordIndex, VPLANDATE.Index] := ods.FieldByName('plan_date').AsString
          else
            TV.DataController.Values[TV.DataController.FocusedRecordIndex, VPLANDATE.Index] := null;
          memData.Locate('UID', TV.DataController.Values[TV.DataController.FocusedRecordIndex, VUID.Index], []);
          memData.Edit;
          if ods.FieldByName('plan_date').AsString <> '' then
            memData.FieldByName('PLANDATE').AsString := ods.FieldByName('plan_date').AsString
          else
            memData.FieldByName('PLANDATE').AsString := '';
          memData.FieldByName('PER').AsString := frmSetPeriodCategory.cxPeriod.EditText;
          memData.Post;
        finally
          ods.Free;
        end;
      end;
  finally
    frmSetPeriodCategory.Free;
  end;
end;

procedure TfrmJournalNew.aPacExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmPac, frmPac);
  try
    frmPac.DoShowFormPac(TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFK_ID.Index],
                         TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFIO.Index]);
    frmPac.ShowModal;
  finally
    frmPac.Free;
  end;
end;

procedure TfrmJournalNew.aPeriodExecute(Sender: TObject);
begin
  with TfrmParamDate.Create(Self) do
    begin
      if Execute then
				begin
					if ModalResult = MrOK then
						begin
              pDate1 := Period.First;
              pDate2 := Period.Last;
              lbPeriod.Caption := 'c: '+DateTimeToStr(pDate1)+' по: '+DateTimeToStr(trunc(pDate2));  
              lbPeriod.Visible := ivAlways;
 	 				  end;
				end;
    Free;
	end;
end;

procedure TfrmJournalNew.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select to_char(sysdate, ''dd.mm.yyyy hh24:mi'') as datesys from dual ';
    ods.Open;
    GET_SYSDATE_4REP := ods.FieldByName('datesys').AsString;
  finally
    ods.Free;
  end;
  frxList.ShowReport;
end;

procedure TfrmJournalNew.aRefreshExecute(Sender: TObject);
begin
  if lbPeriod.Visible = ivNever then
    begin
      MessageDlg('Установите период!', mtInformation, [mbOK], 0);
      exit;
    end;
  aRefresh.Enabled := False;
  aPrint.Enabled := False;
  aEdit.Enabled := False;
  aPac.Enabled := False;
  if tv.DataController.LockCount = 0 then
    tv.BeginUpdate;
  tv.DataController.RecordCount := 0;
  while tv.DataController.LockCount > 0 do
    tv.EndUpdate;
  cxGr.Refresh;
  memData.Close;
  memData.Open;
  oqThread.Scrollable := True;
  oqThread.SetVariable('pdate1', pDate1);
  oqThread.SetVariable('pdate2', pDate2);
  //oqThread.SetVariable('pfn_days', lcbPeriod.EditValue);
  oqThread.Execute;
end;

procedure TfrmJournalNew.aTextExecute(Sender: TObject);
begin
  dlgSavePopUp.DefaultExt := 'txt';
  dlgSavePopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if dlgSavePopUp.Execute then
    ExportGridToText(dlgSavePopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmJournalNew.aWebExecute(Sender: TObject);
begin
  dlgSavePopUp.DefaultExt := 'html';
  dlgSavePopUp.Filter := 'Web-страницы (*.html)|*.html';
  if dlgSavePopUp.Execute then
    ExportGridToHTML(dlgSavePopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmJournalNew.aXLSExecute(Sender: TObject);
begin
  dlgSavePopUp.DefaultExt := 'xls';
  dlgSavePopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if dlgSavePopUp.Execute then
    ExportGridToExcel(dlgSavePopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmJournalNew.aXMLExecute(Sender: TObject);
begin
  dlgSavePopUp.DefaultExt := 'xml';
  dlgSavePopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if dlgSavePopUp.Execute then
    ExportGridToXML(dlgSavePopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmJournalNew.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TV.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\fJournalNew\TVVrach_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TV');
end;

procedure TfrmJournalNew.FormCreate(Sender: TObject);
begin
//  if odsPeriod.Active = False then
//    odsPeriod.Active := True;
  lcbPeriod.EditValue := 1;
  russian:=LoadKeyboardLayout('00000419', 0);
  TV.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\fJournalNew\TVVrach_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TV');
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\fJournalNew\TVVrach_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TV');
  lbPeriod.Visible := ivNever;
end;

procedure TfrmJournalNew.frxListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'DATESYS' then Value := GET_SYSDATE_4REP;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
  if VarName = 'PERIOD' then Value := lbPeriod.Caption;
end;

procedure TfrmJournalNew.N2Click(Sender: TObject);
begin
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\fJournalNew\TVVrach_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TV');
end;

procedure TfrmJournalNew.N3Click(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFIO.Index];
end;

procedure TfrmJournalNew.N5Click(Sender: TObject);
var ods : TOracleDataSet;
    idAmb : Integer;
    idNaz : Integer;
begin
//-- 1. Проверка на то есть ли амбулаторная карта у пациента
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    if TV.DataController.Values[TV.DataController.FocusedRecordIndex, VAGE.Index] < 18 then
      begin
        ods.SQL.Text := ' select t1.fk_id '+#13+
                        '   from asu.tambulance t1, asu.tdocobsl t2 '+#13+
                        '  where t1.fk_peplid = :pfk_peplid '+#13+
                        '    and t1.fk_docobsl = t2.fk_id '+#13+
                        '    and t2.fk_viddocid = asu.doc_ambdp ';
      end else
      begin
        ods.SQL.Text := ' select t1.fk_id '+#13+
                        '   from asu.tambulance t1, asu.tdocobsl t2 '+#13+
                        '  where t1.fk_peplid = :pfk_peplid '+#13+
                        '    and t1.fk_docobsl = t2.fk_id '+#13+
                        '    and t2.fk_viddocid = asu.doc_ambul ';
      end;
    ods.DeclareAndSet('pfk_peplid', otInteger, TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFK_ID.Index]);
    ods.Open;
    IdAmb := ods.FieldByName('fk_id').AsInteger;
    if ods.RecordCount = 0 then
      begin
        MessageDlg('Внимание! '+#13+#10+
                   'У данного человека нет амбулаторной карты!'+#13+#10+
                   'Вы не можете поставить этому человеку дату отсчета ФГ!'+#13+#10+
                   'Если пациент подросток (возраст до 18 лет) зарегистрируйте ему амбулаторную карту детской поликлиники, в противном случае амбулаторную карту взрослой поликлиники', mtWarning, [mbOK], 0);
        exit;
      end;

//-- Добавление даты отсчета ФГ
    Application.CreateForm(TfrmSetDateFG, frmSetDateFG);
    try
      frmSetDateFG.ShowModal;
      if frmSetDateFG.ModalResult = mrOK then
        begin
          ods.DeleteVariables;
          ods.Close;
          ods.SQL.Text := ' select fk_id from asu.tnazis where fk_pacid = :pfk_pacid and fc_remark = ''Установлена последняя ФГ'' ';
          ods.DeclareAndSet('pfk_pacid', otInteger, idAmb);
          ods.Open;
          idNaz := ods.FieldByName('fk_id').AsInteger;
          if ods.RecordCount = 0 then
            begin
              oqIns.SetVariable('pDate', frmSetDateFG.deDate.Date); // добавляем запись
              oqIns.SetVariable('pPacid', idAmb);
              oqIns.SetVariable('pSotr', frmMain.pSOTRID);
              oqIns.Execute;
              frmMain.os.Commit;
              TV.DataController.Values[TV.DataController.FocusedRecordIndex, VLAST.Index] := DateTimeToStr(frmSetDateFG.deDate.Date);
              ods.DeleteVariables;
              ods.Close;
              ods.SQL.Text := ' select asu.get_plan_fluoro_date(:pfk_peplid) as dateplan from dual ';
              ods.DeclareAndSet('pfk_peplid', otInteger, TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFK_ID.Index]);
              ods.Open;
              TV.DataController.Values[TV.DataController.FocusedRecordIndex, VPLANDATE.Index] := ods.FieldByName('dateplan').AsString;
              memData.Locate('uid', TV.DataController.Values[TV.DataController.FocusedRecordIndex, VUID.Index], []);
              memData.Edit;
              memData.FieldByName('last').AsString := DateTimeToStr(frmSetDateFG.deDate.Date);
              memData.FieldByName('plandate').AsString := ods.FieldByName('dateplan').AsString;
              memData.Post;
            end else
            begin
              oqUpd.SetVariable('pDate', frmSetDateFG.deDate.Date); // изменяем запись
              oqUpd.SetVariable('pfk_id', idNaz);
              oqUpd.Execute;
              frmMain.os.Commit;
              TV.DataController.Values[TV.DataController.FocusedRecordIndex, VLAST.Index] := DateTimeToStr(frmSetDateFG.deDate.Date);
              ods.DeleteVariables;
              ods.Close;
              ods.SQL.Text := ' select asu.get_plan_fluoro_date(:pfk_peplid) as dateplan from dual ';
              ods.DeclareAndSet('pfk_peplid', otInteger, TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFK_ID.Index]);
              ods.Open;
              TV.DataController.Values[TV.DataController.FocusedRecordIndex, VPLANDATE.Index] := ods.FieldByName('dateplan').AsString;
              memData.Locate('uid', TV.DataController.Values[TV.DataController.FocusedRecordIndex, VUID.Index], []);
              memData.Edit;
              memData.FieldByName('last').AsString := DateTimeToStr(frmSetDateFG.deDate.Date);
              memData.FieldByName('plandate').AsString := ods.FieldByName('dateplan').AsString;
              memData.Post;
            end;
          ods.DeleteVariables;
          ods.Close;
          ods.SQL.Text := ' merge into asu.tlastfluoro using dual on (fk_peplid = :pfk_peplid) '+#13+
                          '   when not matched then '+#13+
                          '     insert(fk_peplid, fd_date) '+#13+
                          '     values(:pfk_peplid, to_date(asu.get_last_fluoro_date(:pfk_peplid, 1), ''dd.mm.yyyy'')) '+#13+
                          '   when matched then '+#13+
                          '     update set fd_date = to_date(asu.get_last_fluoro_date(:pfk_peplid, 1), ''dd.mm.yyyy''), '+#13+
                          '                fc_num = asu.get_last_fluoro_num(:pfk_peplid) '+#13+
                          '      where fk_peplid = :pfk_peplid ';
          ods.DeclareAndSet('pfk_peplid', otInteger, TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFK_ID.Index]);
          ods.Open;
          frmMain.os.Commit;
        end;
    finally
      frmSetDateFG.Free;
    end;
  finally
    ods.Free;
  end;
end;

procedure TfrmJournalNew.oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer; const ErrorMessage: string);
begin
  MessageDlg('Во время выполнения запроса произошла ошибка! Обратитесь к администратору системы!'+
             #13#10+'Код ошибки: '+IntToStr(ErrorCode)+
             #13#10+'Текст ошибки: '+ErrorMessage,
             mtError, [mbOK], 0);
end;

procedure TfrmJournalNew.oqThreadThreadFinished(Sender: TOracleQuery);
begin
  aRefresh.Enabled := True;
  aPrint.Enabled := oqThread.RowCount <> 0;
  aEdit.Enabled := oqThread.RowCount <> 0;
  aPac.Enabled := oqThread.RowCount <> 0;
end;

procedure TfrmJournalNew.oqThreadThreadRecord(Sender: TOracleQuery);
begin
  tv.BeginUpdate;
  tv.DataController.RecordCount := tv.DataController.RecordCount + 1;
  with tv.DataController do
  begin
    try
      Values[tv.DataController.RecordCount - 1, vFIO.Index] := Sender.Field('FIO');
      Values[tv.DataController.RecordCount - 1, vAGE.Index] := Sender.Field('AGE');
      Values[tv.DataController.RecordCount - 1, vFK_ID.Index] := Sender.Field('FK_PEPLID');
      Values[tv.DataController.RecordCount - 1, vPLANDATE.Index] := Sender.Field('PLANDATE');
      Values[tv.DataController.RecordCount - 1, vPER.Index] := Sender.Field('PER');
      Values[tv.DataController.RecordCount - 1, vUCH.Index] := Sender.Field('uch');
      Values[tv.DataController.RecordCount - 1, vLAST.Index] := Sender.Field('last');
      Values[tv.DataController.RecordCount - 1, vUID.Index] := Sender.Field('fk_id');
      Values[tv.DataController.RecordCount - 1, vGRA.Index] := Sender.Field('gra');
      Values[tv.DataController.RecordCount - 1, vRojd.Index] := Sender.Field('date_rojd');
      memData.Insert;
      memData.FieldByName('FIO').AsString := Sender.Field('FIO');
      memData.FieldByName('AGE').AsInteger := Sender.Field('AGE');
      memData.FieldByName('FK_ID').AsString := Sender.Field('FK_PEPLID');
      memData.FieldByName('PLANDATE').AsString := Sender.Field('PLANDATE');
      memData.FieldByName('PER').AsString := Sender.Field('PER');
      memData.FieldByName('UCH').AsString := Sender.Field('uch');
      memData.FieldByName('LAST').AsString := Sender.Field('last');
      memData.FieldByName('UID').AsString := Sender.Field('fk_id');
      memData.FieldByName('GRA').AsString := Sender.Field('gra');
      memData.FieldByName('rojd').AsDateTime := Sender.Field('date_rojd');
      memData.Post;
      memData.Next;
    finally
    end;
  end;
  tv.EndUpdate;
end;

procedure TfrmJournalNew.TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  N5.Visible := TV.DataController.Values[TV.DataController.FocusedRecordIndex, VLAST.Index] = '';
end;

end.
