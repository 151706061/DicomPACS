unit fSprav;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, dxSkinCaramel,
  dxSkinscxPCPainter, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, OracleData,
  cxLabel, cxContainer, JvComponentBase, JvFormPlacement, cxButtonEdit, Oracle, jvDBUtils,
  ActnList, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxSpinEdit, cxTimeEdit, cxCalendar,
  dxSkinCoffee, dxSkinOffice2007Green;

type
  TfrmSprav = class(TForm)
    pcMain: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    tvMG: TcxGridDBTableView;
    grMGLevel1: TcxGridLevel;
    grMG: TcxGrid;
    grPred: TcxGrid;
    tvPred: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    odsMG: TOracleDataSet;
    dsMG: TDataSource;
    tvMGName: TcxGridDBColumn;
    tvMGKM: TcxGridDBColumn;
    tvMGComment: TcxGridDBColumn;
    tvMGSum: TcxGridDBColumn;
    pmMG: TPopupMenu;
    N1: TMenuItem;
    tvMGSumO: TcxGridDBColumn;
    JvFormStorage1: TJvFormStorage;
    dsPred: TDataSource;
    odsPred: TOracleDataSet;
    tvPredAdr: TcxGridDBColumn;
    tvPredTime: TcxGridDBColumn;
    al: TActionList;
    aEsc: TAction;
    aTab: TAction;
    a1: TAction;
    a2: TAction;
    cxTabSheet3: TcxTabSheet;
    Panel1: TPanel;
    cxLabel3: TcxLabel;
    lcbTaxi: TcxLookupComboBox;
    dsTaxi: TDataSource;
    odsTaxi: TOracleDataSet;
    tvDrv: TcxGridDBTableView;
    grDrvLevel1: TcxGridLevel;
    grDrv: TcxGrid;
    tvDrvDrvNum: TcxGridDBColumn;
    tvDrvFIO: TcxGridDBColumn;
    tvDrvAuto: TcxGridDBColumn;
    tvDrvBag: TcxGridDBColumn;
    tvDrvTros: TcxGridDBColumn;
    tvDrvComment: TcxGridDBColumn;
    dsDrv: TDataSource;
    odsDrvAll: TOracleDataSet;
    odsDrv: TOracleDataSet;
    pmPred: TPopupMenu;
    MenuItem1: TMenuItem;
    pmDrv: TPopupMenu;
    MenuItem2: TMenuItem;
    cxLabel4: TcxLabel;
    teFilter: TcxTextEdit;
    cbFilter: TcxComboBox;
    cxLabel5: TcxLabel;
    tvPredAdr2: TcxGridDBColumn;
    N2: TMenuItem;
    nChangeTime: TMenuItem;
    nOtmena: TMenuItem;
    tvPredDel: TcxGridDBColumn;
    nComeBack: TMenuItem;
    nNow: TMenuItem;
    paChange: TPanel;
    cxLabel6: TcxLabel;
    deDate: TcxDateEdit;
    cxLabel7: TcxLabel;
    teTime: TcxTimeEdit;
    bEnter: TcxButton;
    bCancel: TcxButton;
    aOkChange: TAction;
    aCancelChange: TAction;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    lbCost: TcxLabel;
    cxLabel2: TcxLabel;
    teF: TcxTextEdit;
    bF: TcxButton;
    Panel3: TPanel;
    b1: TcxButton;
    a3: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    bMove: TcxButton;
    bClose: TcxButton;
    cxButton3: TcxButton;
    a4: TAction;
    cxTabSheet4: TcxTabSheet;
    Panel4: TPanel;
    cxLabel8: TcxLabel;
    deDateMG: TcxDateEdit;
    tvListMG: TcxGridDBTableView;
    grListMGLevel1: TcxGridLevel;
    grListMG: TcxGrid;
    odsListMG: TOracleDataSet;
    dsListMG: TDataSource;
    tvListMG_Date: TcxGridDBColumn;
    bPrev: TcxButton;
    bNext: TcxButton;
    bRefresh: TcxButton;
    tvListMG_Adr1: TcxGridDBColumn;
    tvListMG_Adr2: TcxGridDBColumn;
    tvListMG_Num: TcxGridDBColumn;
    tvListMG_Avto: TcxGridDBColumn;
    tvListMG_F: TcxGridDBColumn;
    tvListMG_R: TcxGridDBColumn;
    pmListMG: TPopupMenu;
    MenuItem3: TMenuItem;
    bDown: TcxButton;
    bPen: TcxButton;
    a5: TAction;
    cxTabSheet5: TcxTabSheet;
    odsPen: TOracleDataSet;
    dsPen: TDataSource;
    grPen: TcxGrid;
    tvPen: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    Panel5: TPanel;
    cxLabel9: TcxLabel;
    deBegPen: TcxDateEdit;
    bRefreshPen: TcxButton;
    tvPenColumn1: TcxGridDBColumn;
    tvPenColumn2: TcxGridDBColumn;
    tvPenColumn3: TcxGridDBColumn;
    cxLabel10: TcxLabel;
    deEndPen: TcxDateEdit;
    bAddPen: TcxButton;
    bEditPen: TcxButton;
    bDelPen: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure odsMGBeforeOpen(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N1Click(Sender: TObject);
    procedure odsPredBeforeOpen(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure aEscExecute(Sender: TObject);
    procedure aTabExecute(Sender: TObject);
    procedure bFClick(Sender: TObject);
    procedure teFKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure teFClick(Sender: TObject);
    procedure teFEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure a1Execute(Sender: TObject);
    procedure a2Execute(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure lcbTaxiPropertiesChange(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbFilterPropertiesChange(Sender: TObject);
    procedure teFilterClick(Sender: TObject);
    procedure teFilterEnter(Sender: TObject);
    procedure nOtmenaClick(Sender: TObject);
    procedure tvPredCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure odsPredAfterScroll(DataSet: TDataSet);
    procedure nComeBackClick(Sender: TObject);
    procedure nNowClick(Sender: TObject);
    procedure aOkChangeExecute(Sender: TObject);
    procedure aCancelChangeExecute(Sender: TObject);
    procedure nChangeTimeClick(Sender: TObject);
    procedure a3Execute(Sender: TObject);
    procedure bMoveMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure bCloseClick(Sender: TObject);
    procedure a4Execute(Sender: TObject);
    procedure odsListMGBeforeOpen(DataSet: TDataSet);
    procedure deDateMGPropertiesChange(Sender: TObject);
    procedure bPrevClick(Sender: TObject);
    procedure bNextClick(Sender: TObject);
    procedure bRefreshClick(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure odsListMGAfterOpen(DataSet: TDataSet);
    procedure bDownClick(Sender: TObject);
    procedure a5Execute(Sender: TObject);
    procedure bRefreshPenClick(Sender: TObject);
    procedure bAddPenClick(Sender: TObject);
    procedure odsPenBeforeOpen(DataSet: TDataSet);
    procedure bEditPenClick(Sender: TObject);
    procedure bDelPenClick(Sender: TObject);
    procedure odsPenAfterOpen(DataSet: TDataSet);
  private
    dSysDate : TDateTime;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSprav: TfrmSprav;

implementation
uses fMain, fAddEditPen;
{$R *.dfm}

procedure TfrmSprav.a1Execute(Sender: TObject);
begin
  pcMain.ActivePageIndex := 0;
end;

procedure TfrmSprav.a2Execute(Sender: TObject);
begin
  pcMain.ActivePageIndex := 1;
end;

procedure TfrmSprav.a3Execute(Sender: TObject);
begin
  pcMain.ActivePageIndex := 2;
end;

procedure TfrmSprav.a4Execute(Sender: TObject);
begin
  pcMain.ActivePageIndex := 3;
  if odsListMG.Active = False then
    odsListMG.Active := True;
end;

procedure TfrmSprav.a5Execute(Sender: TObject);
begin
  pcMain.ActivePageIndex := 4;
  if odsPen.Active = False then
    odsPen.Active := True;
end;

procedure TfrmSprav.aCancelChangeExecute(Sender: TObject);
begin
  paChange.Visible := False;
  grPred.Enabled := True;
end;

procedure TfrmSprav.aEscExecute(Sender: TObject);
begin
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus;
  close;
end;

procedure TfrmSprav.aOkChangeExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tpred set fd_date = :pfd_date where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfd_date', otDate, StrToDateTime(DateToStr(deDate.Date)+' '+FormatDateTime('hh:nn', teTime.Time)));
    oq.DeclareAndSet('pfk_id', otInteger, odsPred.FieldByName('fk_id').AsInteger);
    oq.Execute;
    frmMain.os.Commit;
    RefreshQuery(odsPred);
    paChange.Visible := False;
  finally
    grPred.Enabled := True;
    oq.Free;
  end;
end;

procedure TfrmSprav.aTabExecute(Sender: TObject);
begin
  frmMain.sFormFocus := 'frmSprav';
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus;
end;

procedure TfrmSprav.bAddPenClick(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditPen, frmAddEditPen);
  try
    frmAddEditPen.deDate.Date := dSysDate;
    frmAddEditPen.beDrv.Tag := 0;
    frmAddEditPen.Caption := 'Добавить';
    frmAddEditPen.ShowModal;
    if frmAddEditPen.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into taxi.tpenalty(fd_datepen, fk_drvid, fn_sumpen) '+#13+
                         ' values(:pfd_datepen, :pfk_drvid, :pfn_sumpen) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfd_datepen', otDate, trunc(frmAddEditPen.deDate.Date));
          oq.DeclareAndSet('pfk_drvid', otInteger, frmAddEditPen.beDrv.Tag);
          oq.DeclareAndSet('pfn_sumpen', otInteger, frmAddEditPen.seSum.Value);
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsPen);
          odsPen.Locate('fk_id', oq.GetVariable('pfk_id'), []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditPen.Free;
  end;
end;

procedure TfrmSprav.bCloseClick(Sender: TObject);
begin
  close;
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus; 
end;

procedure TfrmSprav.bDelPenClick(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Вы действительно хотите удалить штраф?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from taxi.tpenalty where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsPen.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsPen);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmSprav.bDownClick(Sender: TObject);
begin
  frmMain.odsJur.Locate('fk_id', odsListMG.FieldByName('fk_id').AsInteger, []);
  close;
end;

procedure TfrmSprav.bEditPenClick(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditPen, frmAddEditPen);
  try
    frmAddEditPen.deDate.Date := odsPen.FieldByName('fd_datepen').AsDateTime;
    frmAddEditPen.beDrv.Tag := odsPen.FieldByName('fk_drvid').AsInteger;
    frmAddEditPen.beDrv.Text := odsPen.FieldByName('fc_name').AsString;
    frmAddEditPen.seSum.Value := odsPen.FieldByName('fn_sumpen').AsInteger;
    frmAddEditPen.Caption := 'Изменить';
    frmAddEditPen.ShowModal;
    if frmAddEditPen.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update taxi.tpenalty '+#13+
                         '    set fd_datepen = :pfd_datepen, fk_drvid = :pfk_drvid, fn_sumpen = :pfn_sumpen '+#13+
                         '  where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfd_datepen', otDate, frmAddEditPen.deDate.Date);
          oq.DeclareAndSet('pfk_drvid', otInteger, frmAddEditPen.beDrv.Tag);
          oq.DeclareAndSet('pfn_sumpen', otInteger, frmAddEditPen.seSum.Value);
          oq.DeclareAndSet('pfk_id', otInteger, odsPen.FieldByName('fk_id').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsPen);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditPen.Free;
  end;
end;

procedure TfrmSprav.bFClick(Sender: TObject);
begin
  teF.Clear;
  odsMG.Filtered := False;
end;

procedure TfrmSprav.bMoveMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TfrmSprav.bPrevClick(Sender: TObject);
begin
  deDateMG.EditValue:=deDateMG.EditValue-1;
end;

procedure TfrmSprav.cbFilterPropertiesChange(Sender: TObject);
begin
  dsDrv.DataSet.Filtered := False;
  teFilter.Text := '';
  teFilter.SetFocus;
end;

procedure TfrmSprav.bRefreshPenClick(Sender: TObject);
begin
  RefreshQuery(odsPen);
end;

procedure TfrmSprav.bNextClick(Sender: TObject);
begin
  deDateMG.EditValue:=deDateMG.EditValue+1;
end;

procedure TfrmSprav.bRefreshClick(Sender: TObject);
begin
  RefreshQuery(odsListMG);
end;

procedure TfrmSprav.deDateMGPropertiesChange(Sender: TObject);
begin
  RefreshQuery(odsListMG);
end;

procedure TfrmSprav.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus;
  action := caFree;
end;

procedure TfrmSprav.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  tvMG.StoreToRegistry('\SoftWare\TaxiService\Disp\fSprav\tvMG'+IntToStr(frmMain.pSOTRID), TRUE, [], 'tvMG');
  tvPred.StoreToRegistry('\SoftWare\TaxiService\Disp\fSprav\tvPred'+IntToStr(frmMain.pSOTRID), TRUE, [], 'tvPred');
  tvDrv.StoreToRegistry('\SoftWare\TaxiService\Disp\fSprav\tvDrv'+IntToStr(frmMain.pSOTRID), TRUE, [], 'tvDrv');
  tvListMG.StoreToRegistry('\SoftWare\TaxiService\Disp\fSprav\tvListMG'+IntToStr(frmMain.pSOTRID), TRUE, [], 'tvListMG');  
end;

procedure TfrmSprav.FormCreate(Sender: TObject);
var ods : TOracleDataSet;
begin
  pcMain.ActivePageIndex := 0;
  if odsMG.Active = False then
    odsMG.Active := True;
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
  tvMG.StoreToRegistry('\SoftWare\TaxiService\Disp\fSprav\tvMGDefault'+IntToStr(frmMain.pSotrID), True, [], 'tvMG');
  tvMG.RestoreFromRegistry('\SoftWare\TaxiService\Disp\fSprav\tvMG'+IntToStr(frmMain.pSotrID), False, False, [], 'tvMG');
  tvPred.StoreToRegistry('\SoftWare\TaxiService\Disp\fSprav\tvPredDefault'+IntToStr(frmMain.pSotrID), True, [], 'tvPred');
  tvPred.RestoreFromRegistry('\SoftWare\TaxiService\Disp\fSprav\tvPred'+IntToStr(frmMain.pSotrID), False, False, [], 'tvPred');
  tvDrv.StoreToRegistry('\SoftWare\TaxiService\Disp\fSprav\tvDrvDefault'+IntToStr(frmMain.pSotrID), True, [], 'tvDrv');
  tvDrv.RestoreFromRegistry('\SoftWare\TaxiService\Disp\fSprav\tvDrv'+IntToStr(frmMain.pSotrID), False, False, [], 'tvDrv');
  tvListMG.StoreToRegistry('\SoftWare\TaxiService\Disp\fSprav\tvListMGDefault'+IntToStr(frmMain.pSotrID), True, [], 'tvListMG');
  tvListMG.RestoreFromRegistry('\SoftWare\TaxiService\Disp\fSprav\tvListMG'+IntToStr(frmMain.pSotrID), False, False, [], 'tvListMG');
  lbCost.Caption := IntToStr(frmMain.pPriceKm);
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select sysdate from dual ';
    ods.Open;
    dSysDate := ods.FieldByName('sysdate').AsDateTime;
    deDateMG.Properties.OnChange := nil;
    deDateMG.Date := trunc(dSysDate);
    deDateMG.Properties.OnChange := deDateMGPropertiesChange;
    deBegPen.Date := trunc(dSysDate);
    deEndPen.Date := trunc(dSysDate);
  finally
    ods.Free;
  end;
end;

procedure TfrmSprav.FormDestroy(Sender: TObject);
begin
  frmSprav := nil;
end;

procedure TfrmSprav.FormShow(Sender: TObject);
begin
  teF.SetFocus;
end;

procedure TfrmSprav.lcbTaxiPropertiesChange(Sender: TObject);
begin
  if lcbTaxi.EditValue = -1 then
    begin
      dsDrv.DataSet := odsDrvAll;
      odsDrvAll.Close;
      odsDrvAll.Open;
    end else
    begin
      dsDrv.DataSet := odsDrv;
      odsDrv.Close;
      odsDrv.SetVariable('pfk_taxiid', lcbTaxi.EditValue);
      odsDrv.Open;
    end;
end;

procedure TfrmSprav.MenuItem1Click(Sender: TObject);
begin
  tvPred.RestoreFromRegistry('\SoftWare\TaxiService\Disp\fSprav\tvPredDefault'+IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'tvPred');
end;

procedure TfrmSprav.MenuItem2Click(Sender: TObject);
begin
  tvDrv.RestoreFromRegistry('\SoftWare\TaxiService\Disp\fSprav\tvDrvDefault'+IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'tvDrv');
end;

procedure TfrmSprav.MenuItem3Click(Sender: TObject);
begin
  tvListMG.RestoreFromRegistry('\SoftWare\TaxiService\Disp\fSprav\tvListMGDefault'+IntToStr(frmMain.pSOTRID), False, False, [], 'tvListMG');
end;

procedure TfrmSprav.N1Click(Sender: TObject);
begin
  tvMG.RestoreFromRegistry('\SoftWare\TaxiService\Disp\fSprav\tvMGDefault'+IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'tvMG');
end;

procedure TfrmSprav.nChangeTimeClick(Sender: TObject);
begin
  paChange.Visible := True;
  deDate.Date := odsPred.FieldByName('fd_date').AsDateTime;
  teTime.Time := odsPred.FieldByName('fd_date').AsDateTime;
  grPred.Enabled := False;
end;

procedure TfrmSprav.nComeBackClick(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tpred set fl_del = 0 where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsPred.FieldByName('fk_id').AsInteger);
    oq.Execute;
    oq.DeleteVariables;
    oq.SQL.Text := ' update taxi.tjournal set fn_sos = fn_sos_prev where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsPred.FieldByName('fk_jurid').AsInteger);
    oq.Execute;
    frmMain.os.Commit;
    RefreshQuery(odsPred);
  finally
    oq.Free;
  end;
end;

procedure TfrmSprav.nNowClick(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.SQL.Text := ' update taxi.tpred set fd_date = sysdate+5/(24*60), fl_del = 2 where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsPred.FieldByName('fk_id').AsInteger);
    oq.Execute;
    oq.DeleteVariables;
    oq.SQL.Text := ' update taxi.tjournal set fn_sos = 9, fn_sos2 = 0 where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsPred.FieldByName('fk_jurid').AsInteger);
    oq.Execute;
    frmMain.os.Commit;
    frmMain.odsJur.AfterScroll := nil;
    RefreshQuery(frmMain.odsJur);
    frmMain.odsJur.AfterScroll := frmMain.odsJurAfterScroll;
    RefreshQuery(odsPred);
  finally
    oq.Free;
  end;
end;

procedure TfrmSprav.nOtmenaClick(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tpred set fl_del = 1 where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsPred.FieldByName('fk_id').AsInteger);
    oq.Execute;
    oq.DeleteVariables;
    oq.SQL.Text := ' update taxi.tjournal set fn_sos = 3, fn_sos_prev = fn_sos where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsPred.FieldByName('fk_jurid').AsInteger);
    oq.Execute;
    frmMain.os.Commit;
    RefreshQuery(odsPred);
  finally
    oq.Free;
  end;
end;

procedure TfrmSprav.odsListMGAfterOpen(DataSet: TDataSet);
begin
  bDown.Enabled := odsListMG.RecordCount <> 0;
end;

procedure TfrmSprav.odsListMGBeforeOpen(DataSet: TDataSet);
begin
  odsListMG.SetVariable('PFK_TAXIID', frmMain.pTaxiID);
  odsListMG.SetVariable('PFK_ADR2ID', frmMain.pMG);
  odsListMG.SetVariable('PDATE', deDateMG.Date);
end;

procedure TfrmSprav.odsMGBeforeOpen(DataSet: TDataSet);
begin
  odsMG.SetVariable('pCostKm', frmMain.pPriceKm);
  odsMG.SetVariable('pFlObratno', frmMain.flObratnoMG);
end;

procedure TfrmSprav.odsPenAfterOpen(DataSet: TDataSet);
begin
  bEditPen.Enabled := odsPen.RecordCount > 0;
  bDelPen.Enabled := odsPen.RecordCount > 0;
end;

procedure TfrmSprav.odsPenBeforeOpen(DataSet: TDataSet);
begin
  odsPen.SetVariable('pDate1', deBegPen.Date);
  odsPen.SetVariable('pDate2', deEndPen.Date);
  odsPen.SetVariable('pfk_taxiid', frmmain.pTaxiID);
end;

procedure TfrmSprav.odsPredAfterScroll(DataSet: TDataSet);
begin
  nOtmena.Visible := (odsPred.FieldByName('fl_del').AsInteger = 0) and (odsPred.RecordCount <> 0);
  nChangeTime.Visible := (odsPred.FieldByName('fl_del').AsInteger = 0) and (odsPred.RecordCount <> 0);
  nComeBack.Visible := odsPred.FieldByName('fl_del').AsInteger = 1;
  nNow.Visible := (odsPred.FieldByName('fl_del').AsInteger = 0) and (odsPred.RecordCount <> 0);
end;

procedure TfrmSprav.odsPredBeforeOpen(DataSet: TDataSet);
begin
  odsPred.SetVariable('pfk_taxiid', frmMain.pTaxiID);
end;

procedure TfrmSprav.pcMainChange(Sender: TObject);
begin
  if pcMain.ActivePageIndex = 1 then
    begin
      if odsPred.Active = False then
        odsPred.Active := True;
    end;

  if pcMain.ActivePageIndex = 2 then
    begin
      if odsTaxi.Active = False then
        begin
          odsTaxi.Active := True;
          lcbTaxi.EditValue := frmMain.pTaxiID;
          cbFilter.Properties.OnChange := nil;
          cbFilter.Text := 'позывному';
          cbFilter.Properties.OnChange := cbFilterPropertiesChange;
        end;
    end;
end;

procedure TfrmSprav.teFClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSprav.teFEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSprav.teFilterClick(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSprav.teFilterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

procedure TfrmSprav.teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if lcbTaxi.EditValue = -1 then
    begin
      odsDrvAll.Filtered := False;
      if cbFilter.Text = 'позывному' then
        odsDrvAll.Filter := 'fc_name_up = ''*' + teFilter.Text + '*'' ';
      if cbFilter.Text = 'фио' then
        odsDrvAll.Filter := 'fc_fio_up = ''*' + teFilter.Text + '*'' ';
      if cbFilter.Text = 'машине' then
        odsDrvAll.Filter := 'fc_auto_up = ''*' + teFilter.Text + '*'' ';

      odsDrvAll.Filtered := True;
      if odsDrvAll.RecordCount > 0 then
        teFilter.Style.Font.Color := clBlack
      else
        teFilter.Style.Font.Color := clRed;
    end else
    begin
      odsDrv.Filtered := False;
      if cbFilter.Text = 'позывному' then
        odsDrv.Filter := 'fc_name_up = ''*' + teFilter.Text + '*'' ';
      if cbFilter.Text = 'фио' then
        odsDrv.Filter := 'fc_fio_up = ''*' + teFilter.Text + '*'' ';
      if cbFilter.Text = 'машине' then
        odsDrv.Filter := 'fc_auto_up = ''*' + teFilter.Text + '*'' ';

      odsDrv.Filtered := True;
      if odsDrv.RecordCount > 0 then
        teFilter.Style.Font.Color := clBlack
      else
        teFilter.Style.Font.Color := clRed;
    end;
end;

procedure TfrmSprav.teFKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  odsMG.Filtered := True;
  odsMG.Filter := 'fc_name_up = ''*' + teF.Text + '*'' ';
end;

procedure TfrmSprav.tvPredCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[tvPredDel.Index] = 1 then // отменен
    ACanvas.Brush.Color:=clSilver;
end;

end.
