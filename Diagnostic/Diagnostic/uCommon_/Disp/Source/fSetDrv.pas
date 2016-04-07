unit fSetDrv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  dxSkinsCore, cxControls, cxContainer, cxEdit, cxLabel, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  DB, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxPC, OracleData,
  Oracle, JvDBUtils, JvComponentBase, JvFormPlacement, dxmdaset, ActnList,
  cxButtonEdit, cxTextEdit, dxSkinCaramel, dxSkinCoffee, dxSkinOffice2007Green;

type
  TfrmSetDrv = class(TForm)
    odsLocal: TOracleDataSet;
    dsLocal: TDataSource;
    odsAllCars: TOracleDataSet;
    dsAllCars: TDataSource;
    dsAllTaxi: TDataSource;
    odsAllTaxi: TOracleDataSet;
    JvFormStorage1: TJvFormStorage;
    odsRaionList: TOracleDataSet;
    mdAllCars: TdxMemData;
    al: TActionList;
    aClose: TAction;
    mdAllTaxi: TdxMemData;
    tmrSearch: TTimer;
    odsJournal: TOracleDataSet;
    aTab: TAction;
    pmRaion: TPopupMenu;
    N1: TMenuItem;
    pmCars: TPopupMenu;
    MenuItem1: TMenuItem;
    pmTaxi: TPopupMenu;
    MenuItem2: TMenuItem;
    Panel2: TPanel;
    Shape2: TShape;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    Shape3: TShape;
    Shape4: TShape;
    cxLabel3: TcxLabel;
    teFilter: TcxTextEdit;
    Label1: TLabel;
    lbCap: TcxLabel;
    Panel1: TPanel;
    paPeregon: TPanel;
    pcMain: TcxPageControl;
    tsLocal: TcxTabSheet;
    grCars: TcxGrid;
    TVCARS: TcxGridDBTableView;
    VCARS_NAME: TcxGridDBColumn;
    VCARS_AUTO: TcxGridDBColumn;
    VCARSChoose: TcxGridDBColumn;
    VCARS_STATUS: TcxGridDBColumn;
    VCARS_BONUS: TcxGridDBColumn;
    VCARS_COM: TcxGridDBColumn;
    grCarsLevel1: TcxGridLevel;
    tsAuto: TcxTabSheet;
    grAllCars: TcxGrid;
    TVALLCARS: TcxGridDBTableView;
    VALLCARSColumn1: TcxGridDBColumn;
    VALLCARS_NAME: TcxGridDBColumn;
    VALLCARS_AUTO: TcxGridDBColumn;
    VALLCARS_STATUS: TcxGridDBColumn;
    VALLCARS_BONUS: TcxGridDBColumn;
    VALLCARS_COM: TcxGridDBColumn;
    TVALLCARSFK_ID: TcxGridDBColumn;
    TVALLCARSFC_SYNONYM: TcxGridDBColumn;
    TVALLCARSFC_PLACE: TcxGridDBColumn;
    VALLCARSOrder: TcxGridDBColumn;
    TVALLCARSFC_RAION: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    pcRaion: TcxPageControl;
    cxTabSheet4: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;
    cxTabSheet6: TcxTabSheet;
    tsAll: TcxTabSheet;
    grAllTaxi: TcxGrid;
    TVALLTAXI: TcxGridDBTableView;
    VALLTAXIColumn1: TcxGridDBColumn;
    VALLTAXI_NAME: TcxGridDBColumn;
    TVALLTAXIFC_NAME_1: TcxGridDBColumn;
    VALLTAXI_AUTO: TcxGridDBColumn;
    VALLTAXI_STATUS: TcxGridDBColumn;
    VALLTAXI_BONUS: TcxGridDBColumn;
    VALLTAXI_COM: TcxGridDBColumn;
    TVALLTAXIFK_ID: TcxGridDBColumn;
    TVALLTAXIFC_SYNONYM: TcxGridDBColumn;
    TVALLTAXIFK_RAION: TcxGridDBColumn;
    TVALLTAXIFN_RORDER: TcxGridDBColumn;
    TVALLTAXIFC_PLACE: TcxGridDBColumn;
    TVALLTAXIFC_RAION: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    pcAllTaxi: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    Panel3: TPanel;
    bRaion: TcxButton;
    bAllCars: TcxButton;
    bAllTaxi: TcxButton;
    bEnter: TcxButton;
    cxButton1: TcxButton;
    bMove: TcxButton;
    bClose: TcxButton;

    procedure bEnterClick(Sender: TObject);
    procedure bRaionClick(Sender: TObject);
    procedure bAllCarsClick(Sender: TObject);
    procedure bAllTaxiClick(Sender: TObject);
    procedure TVCARSGetCellHeight(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);
    procedure pcMainChange(Sender: TObject);
    procedure odsAllCarsBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TVCARSCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVALLCARSCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVALLTAXICustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVCARSCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TVALLCARSCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TVALLTAXICellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure odsAllCarsAfterOpen(DataSet: TDataSet);
    procedure pcRaionPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure TVALLCARSDataControllerCompare(
      ADataController: TcxCustomDataController; ARecordIndex1, ARecordIndex2,
      AItemIndex: Integer; const V1, V2: Variant; var Compare: Integer);
    procedure TVALLCARSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TVCARSKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TVALLTAXIKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TVCARSCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TVALLCARSCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TVALLTAXICellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure aCloseExecute(Sender: TObject);
    procedure VCARSChoosePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure VALLCARSColumn1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure VALLTAXIColumn1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure odsAllTaxiBeforeOpen(DataSet: TDataSet);
    procedure odsAllTaxiAfterOpen(DataSet: TDataSet);
    procedure TVALLTAXIDataControllerCompare(
      ADataController: TcxCustomDataController; ARecordIndex1, ARecordIndex2,
      AItemIndex: Integer; const V1, V2: Variant; var Compare: Integer);
    procedure pcAllTaxiPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure tmrSearchTimer(Sender: TObject);
    procedure aTabExecute(Sender: TObject);
    procedure teFilterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure teFilterKeyPress(Sender: TObject; var Key: Char);
    procedure TVCARSKeyPress(Sender: TObject; var Key: Char);
    procedure teFilterPropertiesChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TVALLCARSKeyPress(Sender: TObject; var Key: Char);
    procedure TVALLTAXIKeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure bMoveMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    pJurID : Integer;
    pPeregon : Integer;
    pSos2 : Integer;
    isFirst : Boolean;
    idFirst, idSecond : Integer;
    FIsInitNow:Boolean;
    procedure InitNavigationTabs(pcControl:TcxPageControl;mdODS:TdxMemData);
    procedure DataControllerCompare(
      ADataController: TcxCustomDataController; ARecordIndex1, ARecordIndex2,
      AItemIndex: Integer; const V1, V2: Variant; var Compare: Integer; mdMemData:TdxMemData);
    procedure pcRPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean; ods:TOracleDataSet; md:TdxMemData;tv:TcxGridDBTableView);
    procedure FindDrv(aods:TOracleDataSet;atv:TcxGridDBTableView);
  public
    sLbFirst : string;
    sRes : Integer;
    procedure DoShowForm(nRaionId, nJurId, nPeregon, nSos2 : Integer);
    { Public declarations }
  end;

var
  frmSetDrv: TfrmSetDrv;

implementation

uses fMain;

{$R *.dfm}

procedure TfrmSetDrv.aCloseExecute(Sender: TObject);
begin
  Close;
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus;
end;

procedure TfrmSetDrv.aTabExecute(Sender: TObject);
begin
  frmMain.sFormFocus := 'frmSetDrv';
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus;
end;

procedure TfrmSetDrv.bAllCarsClick(Sender: TObject);
begin
  lbCap.Caption := '¬се машины';
  pcMain.ActivePageIndex := 1;
  bEnter.Enabled := (pPeregon <> 1) and (odsAllCars.RecordCount <> 0);  
end;

procedure TfrmSetDrv.bAllTaxiClick(Sender: TObject);
begin
  lbCap.Caption := '¬се такси';
  pcMain.ActivePageIndex := 2;
  bEnter.Enabled := (pPeregon <> 1) and (odsAllTaxi.RecordCount <> 0);  
end;

procedure TfrmSetDrv.bEnterClick(Sender: TObject);
var oq : TOracleQuery;
    prev_first, prev_second, date_fics, raion_id : Variant;
    procedure SendDriverBack(adriverId:variant);
      begin
        if frmMain.FindDriverNotInZakaz(adriverId, pJurID) <> -1 then //если водитель едет по другому не обработанному заказу, то в таблицу евентов вставл€ть ничего не надо
          Exit;
        if not (VarIsNull(adriverId)) then
          begin
            if (adriverId<>idFirst) and (adriverId<>idSecond) and (adriverId > 0) then
              begin
                oq := TOracleQuery.Create(nil);
                try
                  oq.Session := frmMain.os;
                  oq.Cursor := crSQLWait;
                  oq.DeleteVariables;
                  oq.SQL.Text := ' insert into taxi.tdriverevent(fk_driver, fk_place, fk_journal, fk_drivereventtype) '+#13+
                                 ' values(:pfk_driver, null, :pfk_journal, (select fk_id from taxi.ts_drivereventtype where fc_synonym = ''CANCEL_ZAKAZ'')) ';
                  oq.DeclareAndSet('pfk_driver', otInteger, adriverId);
                  oq.DeclareAndSet('pfk_journal', otInteger, pJurID);
                  oq.Execute;
                finally
                  Screen.Cursor := crDefault;
                  oq.Free;
                end;
              end;
          end;
      end;
    procedure MoveToClient(adriverId:integer);
      begin
        if frmMain.FindDriverNotInZakaz(adriverId, pJurID) <> -1 then //если водитель едет по другому не обработанному заказу, то в таблицу евентов вставл€ть ничего не надо
          Exit;

        oq.DeleteVariables;
        // -- 1 ый таксист
        if (adriverId <> prev_first) and (adriverId <> prev_second) and (adriverId > 0) then
          begin
            oq.DeleteVariables;
            oq.SQL.Text := ' insert into taxi.tdriverevent(fk_driver, fk_place, fk_journal, fk_drivereventtype) '+#13+
                           ' values(:pfk_driver, null, :pfk_journal, (select fk_id from taxi.ts_drivereventtype where fc_synonym = ''MOVE_TO_CLIENT'')) ';
            oq.DeclareAndSet('pfk_driver', otInteger, adriverId);
            oq.DeclareAndSet('pfk_journal', otInteger, pJurID);
            oq.Execute;
            if not(VarIsNull(date_fics)) then
              begin
                oq.DeleteVariables;
                oq.SQL.Text := ' insert into taxi.tdriverevent(fk_driver, fk_place, fk_journal, fk_drivereventtype) '+#13+
                               ' values(:pfk_driver, :pplace, :pfk_journal, (select fk_id from taxi.ts_drivereventtype where fc_synonym = ''START_CLIENT_MOVE'')) ';
                oq.DeclareAndSet('pfk_driver', otInteger, adriverId);
                oq.DeclareAndSet('pfk_journal', otInteger, pJurID);
                oq.DeclareAndSet('pplace', otInteger, raion_id);
                oq.Execute;
              end;
          end;
      end;
begin
  try
    if bEnter.Enabled = False then
      Exit;

    odsJournal.Close;
    odsJournal.SetVariable('pid', pJurID);
    odsJournal.Open;
    prev_first := odsJournal.FieldByName('fk_drvid').AsVariant;
    prev_second := odsJournal.FieldByName('fk_drvid2').AsVariant;
    date_fics := odsJournal.FieldByName('FD_DATEF').AsVariant;
    raion_id := odsJournal.FieldByName('FK_ADR2ID').AsVariant;

    SendDriverBack(prev_first);
    SendDriverBack(prev_second);

    if pPeregon = 1 then  // если перегон
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update taxi.tjournal '+#13+
                         '    set fk_drvid = :pfk_drvid, fk_drvid2 = :pfk_drvid2, fn_sos = 8, '+#13+
                         '        fn_sos2 = 1, fk_sotrid = :pfk_sotrid, fd_setdrv = sysdate '+#13+
                         '  where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfk_drvid', otInteger, idFirst);
          oq.DeclareAndSet('pfk_drvid2', otInteger, idSecond);
          oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
          oq.DeclareAndSet('pfk_id', otInteger, pJurID);
          oq.Execute;
          oq.DeleteVariables;

          MoveToClient(idFirst);         // -- 1 ый таксист
          MoveToClient(idSecond);         // -- 2 ой таксист

          frmMain.os.Commit;
          frmMain.odsJur.AfterScroll := nil;
          RefreshQuery(frmMain.odsJur);
          if pSos2 = 0 then // если предварительный заказ
            frmMain.odsJur.Locate('fk_id', pJurID, []);
          frmMain.odsJur.Locate('fk_id', pJurID, []);
          frmMain.odsJur.AfterScroll := frmMain.odsJurAfterScroll;
        finally
          Screen.Cursor := crDefault;
          oq.Free;
        end;
      end else  // Ќ≈ перегон
      begin
        if pcMain.ActivePageIndex = 0 then
          sRes := odsLocal.FieldByName('fk_id').AsInteger;
        if pcMain.ActivePageIndex = 1 then
          sRes := odsAllCars.FieldByName('fk_id').AsInteger;
        if pcMain.ActivePageIndex = 2 then
          sRes := odsAllTaxi.FieldByName('fk_id').AsInteger;
        Screen.Cursor := crSQLWait;
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update taxi.tjournal '+#13+
                         '    set fk_drvid = :pfk_drvid, fn_sos = 8, fn_sos2 = 1, fk_sotrid = :pfk_sotrid, fd_setdrv = sysdate '+#13+
                         '  where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfk_drvid', otInteger, sRes);
          oq.DeclareAndSet('pfk_id', otInteger, pJurID);
          oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
          oq.Execute;
          oq.DeleteVariables;

          MoveToClient(sRes);

          frmMain.os.Commit;
          frmMain.odsJur.AfterScroll := nil;
          RefreshQuery(frmMain.odsJur);
          if pSos2 = 0 then // если предварительный заказ
            frmMain.odsJur.Locate('fk_id', pJurID, []);
          frmMain.odsJur.AfterScroll := frmMain.odsJurAfterScroll;
        finally
          Screen.Cursor := crDefault;
          oq.Free;
        end;
      end;
    if frmMain.odsJur.FieldByName('fk_id').AsInteger = pJurID then
      begin
        frmMain.DoVisibleOtmena;
        frmMain.DoVisibleSend;
        frmMain.DoVisibleKM;
        frmMain.DoVisibleNotExit;
        frmMain.DoVisibleSumCall;
        frmMain.DoEnableDrv;

        frmMain.DoEnablePeregon;
        frmMain.DoEnablePredZakaz;
        frmMain.DoEnableFactControls;
        frmMain.DoEnableKmControls;
        frmMain.DoEnableAddTimeControls;
        frmMain.lbState.Caption := '¬ работе';
        frmMain.lbDrv.Caption := frmMain.odsJur.FieldByName('numdrv').AsString;
        frmMain.lbDrv.Style.TextColor := clNavy;
      end;
  finally
    close;
    frmMain.VJOURNAL_DATEIN.Focused := True;
    frmMain.grJournal.SetFocus;
  end;
end;

procedure TfrmSetDrv.bMoveMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TfrmSetDrv.bRaionClick(Sender: TObject);
begin
  lbCap.Caption := sLbFirst;
  pcMain.ActivePageIndex := 0;
  bEnter.Enabled := (pPeregon <> 1) and (odsLocal.RecordCount <> 0);
end;

procedure TfrmSetDrv.DoShowForm(nRaionId, nJurId, nPeregon, nSos2: Integer);
begin
  odsLocal.Close;
  odsLocal.SetVariable('pfk_place', nRaionId);
  odsLocal.SetVariable('pfk_taxiid', frmMain.pTaxiID);
  odsLocal.Open;
  pJurID := nJurID;
  pPeregon := nPeregon;
  pSos2 := nSos2;
  paPeregon.Visible := pPeregon = 1;
  bEnter.Enabled := (pPeregon <> 1) and (odsLocal.RecordCount <> 0);
end;

procedure TfrmSetDrv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmSetDrv.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  tvCars.StoreToRegistry('\SoftWare\TaxiService\Disp\fSetDrv\tvCars'+IntToStr(frmMain.pSOTRID), TRUE, [], 'tvCars');
  tvAllCars.StoreToRegistry('\SoftWare\TaxiService\Disp\fSetDrv\tvAllCars'+IntToStr(frmMain.pSOTRID), TRUE, [], 'tvAllCars');
  tvAllTaxi.StoreToRegistry('\SoftWare\TaxiService\Disp\fSetDrv\tvAllTaxi'+IntToStr(frmMain.pSOTRID), TRUE, [], 'tvAllTaxi');
end;

procedure TfrmSetDrv.FormCreate(Sender: TObject);
begin
  pcMain.HideTabs := true;
  if frmMain.sSynTaxi = 'LUXURY' then
    begin

    end;
  tvCars.StoreToRegistry('\SoftWare\TaxiService\Disp\fSetDrv\tvCarsDefault'+IntToStr(frmMain.pSotrID), True, [], 'tvCars');
  tvCars.RestoreFromRegistry('\SoftWare\TaxiService\Disp\fSetDrv\tvCars'+IntToStr(frmMain.pSotrID), False, False, [], 'tvCars');
  tvAllCars.StoreToRegistry('\SoftWare\TaxiService\Disp\fSetDrv\tvAllCarsDefault'+IntToStr(frmMain.pSotrID), True, [], 'tvAllCars');
  tvAllCars.RestoreFromRegistry('\SoftWare\TaxiService\Disp\fSetDrv\tvAllCars'+IntToStr(frmMain.pSotrID), False, False, [], 'tvAllCars');
  tvAllTaxi.StoreToRegistry('\SoftWare\TaxiService\Disp\fSetDrv\tvAllTaxiDefault'+IntToStr(frmMain.pSotrID), True, [], 'tvAllTaxi');
  tvAllTaxi.RestoreFromRegistry('\SoftWare\TaxiService\Disp\fSetDrv\tvAllTaxi'+IntToStr(frmMain.pSotrID), False, False, [], 'tvAllTaxi');
end;

procedure TfrmSetDrv.FormDestroy(Sender: TObject);
begin
  frmSetDrv := nil;
end;

procedure TfrmSetDrv.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (teFilter.Focused) then
    Exit;
end;

procedure TfrmSetDrv.FormShow(Sender: TObject);
begin
  pcMain.ActivePageIndex := 0;
  if odsLocal.Active then
    begin
      if odsLocal.RecordCount = 0 then
        begin
          pcMain.ActivePage := tsAuto;
          bEnter.Enabled := (pPeregon <> 1) and (odsAllCars.RecordCount <> 0);
          grAllCars.SetFocus;
          tvAllCars.DataController.GotoFirst;
        end else
        begin
          grCars.SetFocus;
          tvCars.DataController.GotoFirst;
        end;
    end;
end;

procedure TfrmSetDrv.odsAllCarsAfterOpen(DataSet: TDataSet);
var
  I: Integer;
  raion:Variant;
begin
  mdAllCars.CreateFieldsFromDataSet(odsAllCars);
  mdAllCars.Open;
  with odsAllCars do
  begin
    First;
    for I := 0 to RecordCount - 1 do
    begin
      raion := FieldByName('fk_raion').AsVariant;
      if not (mdAllCars.Locate('fk_raion',raion,[])) then
      begin
        mdAllCars.Insert;
        mdAllCars.FieldByName('fk_raion').AsVariant := raion;
        mdAllCars.FieldByName('fn_rorder').AsVariant := FieldByName('fn_rorder').AsVariant;
        mdAllCars.FieldByName('fc_raion').AsVariant := FieldByName('fc_raion').AsVariant;
        mdAllCars.Post;
      end;
      Next;
    end;
  end;



  InitNavigationTabs(pcRaion,mdAllCars);
  TVALLCARS.DataController.DataSource := dsAllCars;
  TVALLCARS.ViewData.Expand(true);
end;

procedure TfrmSetDrv.odsAllCarsBeforeOpen(DataSet: TDataSet);
begin
  odsAllCars.SetVariable('pfk_taxiid', frmMain.pTaxiID);
  TVALLCARS.DataController.DataSource := nil;
end;

procedure TfrmSetDrv.odsAllTaxiAfterOpen(DataSet: TDataSet);
var
  I: Integer;
  raion:Variant;
begin
  mdAllTaxi.CreateFieldsFromDataSet(odsAllTaxi);
  mdAllTaxi.Open;
  with odsAllTaxi do
  begin
    First;
    for I := 0 to RecordCount - 1 do
    begin
      raion := FieldByName('fk_raion').AsVariant;
      if not (mdAllTaxi.Locate('fk_raion',raion,[])) then
      begin
        mdAllTaxi.Insert;
        mdAllTaxi.FieldByName('fk_raion').AsVariant := raion;
        mdAllTaxi.FieldByName('fn_rorder').AsVariant := FieldByName('fn_rorder').AsVariant;
        mdAllTaxi.FieldByName('fc_raion').AsVariant := FieldByName('fc_raion').AsVariant;
        mdAllTaxi.Post;
      end;
      Next;
    end;
  end;

  InitNavigationTabs(pcAllTaxi,mdAllTaxi);
  TVALLTAXI.DataController.DataSource := dsAllTaxi;
  TVALLTAXI.ViewData.Expand(true);
end;

procedure TfrmSetDrv.odsAllTaxiBeforeOpen(DataSet: TDataSet);
begin
  TVALLTAXI.DataController.DataSource:=nil;
end;

procedure TfrmSetDrv.pcAllTaxiPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  pcRPageChanging(Sender, NewPage, AllowChange, odsAllTaxi, mdAllTaxi,TVALLTAXI);
end;

procedure TfrmSetDrv.pcMainChange(Sender: TObject);
begin
  if pcMain.ActivePageIndex = 0 then
  begin
      try
        grCars.SetFocus;
        odsLocal.First;
        FindDrv(odsLocal,TVCARS);
      except
      end;
  end;
  if pcMain.ActivePageIndex = 1 then
    begin
      if odsAllCars.Active = False then
      begin
        try
          FIsInitNow:=true;
          odsAllCars.Active := True;
        finally
          FIsInitNow:=false;
        end;
      end;
      try
        grAllCars.SetFocus;
        odsAllCars.First;
        FindDrv(odsAllCars,TVALLCARS);
      except
      end;
    end;
  if pcMain.ActivePageIndex = 2 then
    begin
      if odsAllTaxi.Active = False then
      begin
        try
          FIsInitNow:=true;
          odsAlltaxi.Active := True;
        finally
          FIsInitNow:=false;
        end;
      end;
      try
        grAllTaxi.SetFocus;
        odsAlltaxi.First;
        FindDrv(odsAllTaxi,TVALLTAXI);
      except
      end;
    end;
end;

procedure TfrmSetDrv.pcRaionPageChanging(Sender: TObject; NewPage: TcxTabSheet;
  var AllowChange: Boolean);
begin
  pcRPageChanging(Sender, NewPage, AllowChange, odsAllCars, mdAllCars,TVALLCARS);
end;

procedure TfrmSetDrv.pcRPageChanging(Sender: TObject; NewPage: TcxTabSheet;
  var AllowChange: Boolean; ods:TOracleDataSet; md:TdxMemData;tv:TcxGridDBTableView);
begin
  if (FIsInitNow) then
    Exit;
  if (NewPage<>nil) then
  begin
    if (ods.Active) then
    begin
      md.Locate('fk_raion',NewPage.Tag,[]);
      if (md.RecNo = 1) then
      begin
        ods.Last;
        tv.DataController.GotoNext;
      end
      else begin
        md.Prior;
        ods.Locate('fk_raion',md.FieldByName('fk_raion').AsInteger,[]);
      end;
      ods.Locate('fk_raion',NewPage.Tag,[]);
    end;
  end;
end;

procedure TfrmSetDrv.FindDrv(aods:TOracleDataSet; atv:TcxGridDBTableView);
begin
    if (aods.Active) then
    begin
      if (Length(teFilter.Text)>1) then
      begin
        if aods.Locate('fc_name', teFilter.Text,[loCaseInsensitive, loPartialKey]) then
        begin
          if (atv.DataController.Controller.SelectedRecordCount > 0) then
          begin
            if atv.DataController.Controller.SelectedRecords[0].Expandable then
            begin
              atv.DataController.GotoNext;
            end;
          end;
        end;
      end
      else begin
        if not aods.Locate('fc_name', teFilter.Text,[]) then
        begin
          if aods.Locate('fc_name', teFilter.Text,[loCaseInsensitive, loPartialKey]) then
          begin
            if (atv.DataController.Controller.SelectedRecordCount > 0) then
            begin
              if atv.DataController.Controller.SelectedRecords[0].Expandable then
              begin
                atv.DataController.GotoNext;
              end;
            end;
          end;
        end
        else begin
          if (atv.DataController.Controller.SelectedRecordCount > 0) then
          begin
            if atv.DataController.Controller.SelectedRecords[0].Expandable then
            begin
              atv.DataController.GotoNext;
            end;
          end;
        end;
      end;
    end;
end;

procedure TfrmSetDrv.teFilterKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (teFilter.Text<>'') then
  begin
    FindDrv(odsLocal, TVCARS);
    FindDrv(odsAllCars, TVALLCARS);
    FindDrv(odsAllTaxi, TVALLTAXI);
  end;
end;

procedure TfrmSetDrv.teFilterKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9']) then
    Key := #0;
end;

procedure TfrmSetDrv.teFilterPropertiesChange(Sender: TObject);
begin
  if teFilter.Text <> '' then
    begin
      FindDrv(odsLocal, TVCARS);
      FindDrv(odsAllCars, TVALLCARS);
      FindDrv(odsAllTaxi, TVALLTAXI);
    end;
end;

procedure TfrmSetDrv.tmrSearchTimer(Sender: TObject);
begin
//  if (teFilter.Text<>'') then
//  begin
//    FindSeacrh(odsLocal, TVCARS);
//    FindSeacrh(odsAllCars, TVALLCARS);
//    FindSeacrh(odsAllTaxi, TVALLTAXI);
//  end;
//  tmrSearch.Enabled := false;
end;

procedure TfrmSetDrv.TVALLCARSCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if pPeregon = 1 then
    begin
      if isFirst = False then
        begin
          paPeregon.Caption := '¬ыбрана 1-а€ машина: '+odsAllCars.FieldByName('fc_name').AsString+'('+odsAllCars.FieldByName('fc_auto').AsString+');';
          paPeregon.Font.Color := clNavy;
          isFirst := True;
          idFirst := odsAllCars.FieldByName('fk_id').AsInteger;
        end else
        begin
          if idSecond = 0 then
            begin
              paPeregon.Caption := paPeregon.Caption+' ¬ыбрана 2-а€ машина: '+odsAllCars.FieldByName('fc_name').AsString+'('+odsAllCars.FieldByName('fc_auto').AsString+');';
              paPeregon.Font.Color := clGreen;
              idSecond := odsAllCars.FieldByName('fk_id').AsInteger;
              bEnter.Enabled := True;
            end;
        end;
    end;
end;

procedure TfrmSetDrv.TVALLCARSCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if pPeregon <> 1 then
    begin
      bEnter.Click;
    end;
end;

procedure TfrmSetDrv.TVALLCARSCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var iColor, iColor2 : TColor;
    ARec : TRect;
begin
  if AViewInfo.GridRecord.Values[VALLCARS_BONUS.Index] > 0 then
    begin
      icolor2 := clBlue;
      if AViewInfo.GridRecord.Values[VALLCARS_BONUS.Index] = 1 then
        begin
          icolor2 := clBlue;
        end;
      if AViewInfo.GridRecord.Values[VALLCARS_BONUS.Index] = 2 then
        begin
          icolor2 := $00FF80FF;
        end;
      if AViewInfo.GridRecord.Values[VALLCARS_BONUS.Index] > 2 then
        begin
          icolor2 := clRed;
        end;
      ARec := AViewInfo.RecordViewInfo.Bounds;
      icolor := ACanvas.Brush.Color;
      ACanvas.Brush.Color := iColor2;
      ACanvas.FrameRect(ARec, icolor2, 2, [bLeft..bBottom], True);
      ACanvas.Brush.Color := icolor;
      ACanvas.Pen.Color := icolor;
      AViewInfo.Borders := [];
    end;
end;

procedure TfrmSetDrv.DataControllerCompare(
  ADataController: TcxCustomDataController; ARecordIndex1, ARecordIndex2,
  AItemIndex: Integer; const V1, V2: Variant; var Compare: Integer; mdMemData:TdxMemData);
var
  vn1,vn2:Integer;
begin
  if not (mdMemData.Active) then
  begin
    Compare := 0;
    Exit;
  end;

  try
    vn1 := 0;
    vn2 := 0;
    if (mdMemData.Locate('fc_raion',v1,[])) then
    begin
      vn1 := mdMemData.FieldByName('fn_rorder').AsInteger;
    end;
    if (mdMemData.Locate('fc_raion',v2,[])) then
    begin
      vn2 := mdMemData.FieldByName('fn_rorder').AsInteger;
    end;
    Compare := vn1 - vn2;
  except
    Compare := 0;
  end;
end;

procedure TfrmSetDrv.TVALLCARSDataControllerCompare(
  ADataController: TcxCustomDataController; ARecordIndex1, ARecordIndex2,
  AItemIndex: Integer; const V1, V2: Variant; var Compare: Integer);
begin
  DataControllerCompare(ADataController,ARecordIndex1, ARecordIndex2,
  AItemIndex,V1, V2,Compare,mdAllCars);
end;

procedure TfrmSetDrv.TVALLCARSKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_return) or (key = vk_f2) then
    begin
      if pPeregon = 1 then
        begin
          if isFirst = False then
            begin
              paPeregon.Caption := '¬ыбрана 1-а€ машина: '+odsAllCars.FieldByName('fc_name').AsString+'('+odsAllCars.FieldByName('fc_auto').AsString+');';
              paPeregon.Font.Color := clNavy;
              isFirst := True;
              idFirst := odsAllCars.FieldByName('fk_id').AsInteger;
              exit;
            end else
            begin
              if idSecond = 0 then
                begin
                  paPeregon.Caption := paPeregon.Caption+' ¬ыбрана 2-а€ машина: '+odsAllCars.FieldByName('fc_name').AsString+'('+odsAllCars.FieldByName('fc_auto').AsString+');';
                  paPeregon.Font.Color := clGreen;
                  idSecond := odsAllCars.FieldByName('fk_id').AsInteger;
                  bEnter.Enabled := True;
                end;
            end;
        end;
      bEnter.Click;
    end;
//  if tvAllCars.DataController.Controller.SelectedRecordCount > 0 then
//    begin
//      if tvAllCars.DataController.Controller.SelectedRecords[0].Expandable then
//        Exit;
//      if (Key = vk_return) or (key = vk_f2) then
//        bEnter.Click;
//    end;

  if key = vk_back then // стираем поле поиска
    begin
      teFilter.Text := copy(teFilter.Text, 1, Length(teFilter.Text)-1);
    end;
  if (key = vk_f8) or (key = vk_delete) then // очищаем поле поиса
    begin
      teFilter.Text := '';
    end;
  if key = vk_left then // влево
    begin
      bRaion.Click;
    end;
  if key = vk_right then // вправо
    begin
      bAllTaxi.Click;
    end;
end;

procedure TfrmSetDrv.TVALLCARSKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9']) then
    Key := #0
  else
    teFilter.Text := teFilter.Text + Key;
end;

procedure TfrmSetDrv.TVALLTAXICellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if pPeregon = 1 then
    begin
      if isFirst = False then
        begin
          paPeregon.Caption := '¬ыбрана 1-а€ машина: '+odsAllTaxi.FieldByName('fc_name').AsString+'('+odsAllTaxi.FieldByName('fc_auto').AsString+');';
          paPeregon.Font.Color := clNavy;
          isFirst := True;
          idFirst := odsAllTaxi.FieldByName('fk_id').AsInteger;
        end else
        begin
          if idSecond = 0 then
            begin
              paPeregon.Caption := paPeregon.Caption+' ¬ыбрана 2-а€ машина: '+odsAllTaxi.FieldByName('fc_name').AsString+'('+odsAllTaxi.FieldByName('fc_auto').AsString+');';
              paPeregon.Font.Color := clGreen;
              idSecond := odsAllTaxi.FieldByName('fk_id').AsInteger;
              bEnter.Enabled := True;
            end;
        end;
    end;
end;

procedure TfrmSetDrv.TVALLTAXICellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if pPeregon <> 1 then
    begin
      bEnter.Click;
    end;
end;

procedure TfrmSetDrv.TVALLTAXICustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var iColor, iColor2 : TColor;
    ARec : TRect;
begin
  if AViewInfo.GridRecord.Values[VALLTAXI_BONUS.Index] > 0 then
    begin
      icolor2 := clBlue;
      if AViewInfo.GridRecord.Values[VALLTAXI_BONUS.Index] = 1 then
        begin
          icolor2 := clBlue;
        end;
      if AViewInfo.GridRecord.Values[VALLTAXI_BONUS.Index] = 2 then
        begin
          icolor2 := $00FF80FF;
        end;
      if AViewInfo.GridRecord.Values[VALLTAXI_BONUS.Index] > 2 then
        begin
          icolor2 := clRed;
        end;
      ARec := AViewInfo.RecordViewInfo.Bounds;
      icolor := ACanvas.Brush.Color;
      ACanvas.Brush.Color := iColor2;
      ACanvas.FrameRect(ARec, icolor2, 2, [bLeft..bBottom], True);
      ACanvas.Brush.Color := icolor;
      ACanvas.Pen.Color := icolor;
      AViewInfo.Borders := [];
    end;
end;

procedure TfrmSetDrv.TVALLTAXIDataControllerCompare(
  ADataController: TcxCustomDataController; ARecordIndex1, ARecordIndex2,
  AItemIndex: Integer; const V1, V2: Variant; var Compare: Integer);
begin
  DataControllerCompare(ADataController,ARecordIndex1, ARecordIndex2,
  AItemIndex,V1, V2,Compare,mdAllTaxi);
end;

procedure TfrmSetDrv.TVALLTAXIKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_return) or (key = vk_f2) then
    begin
      if pPeregon = 1 then
        begin
          if isFirst = False then
            begin
              paPeregon.Caption := '¬ыбрана 1-а€ машина: '+odsAllTaxi.FieldByName('fc_name').AsString+'('+odsAllTaxi.FieldByName('fc_auto').AsString+');';
              paPeregon.Font.Color := clNavy;
              isFirst := True;
              idFirst := odsAllTaxi.FieldByName('fk_id').AsInteger;
              exit;
            end else
            begin
              if idSecond = 0 then
                begin
                  paPeregon.Caption := paPeregon.Caption+' ¬ыбрана 2-а€ машина: '+odsAllTaxi.FieldByName('fc_name').AsString+'('+odsAllTaxi.FieldByName('fc_auto').AsString+');';
                  paPeregon.Font.Color := clGreen;
                  idSecond := odsAllTaxi.FieldByName('fk_id').AsInteger;
                  bEnter.Enabled := True;
                end;
            end;
        end;
      bEnter.Click;
    end;
    
//  if tvAllTaxi.DataController.Controller.SelectedRecordCount > 0 then
//    begin
//      if tvAllTaxi.DataController.Controller.SelectedRecords[0].Expandable then
//        Exit;
//      if (key = vk_return) or (key = vk_f2) then
//        bEnter.Click;
//    end;

  if key = vk_back then // стираем поле поиска
    begin
      teFilter.Text := copy(teFilter.Text, 1, Length(teFilter.Text)-1);
    end;
  if (key = vk_f8) or (key = vk_delete) then // очищаем поле поиса
    begin
      teFilter.Text := '';
    end;
  if key = vk_left then // влево
    begin
      bAllCars.Click;
    end;
end;

procedure TfrmSetDrv.TVALLTAXIKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9']) then
    Key := #0
  else
    teFilter.Text := teFilter.Text + Key;
end;

procedure TfrmSetDrv.TVCARSCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if pPeregon = 1 then
    begin
      if isFirst = False then
        begin
          paPeregon.Caption := '¬ыбрана 1-а€ машина: '+odsLocal.FieldByName('fc_name').AsString+'('+odsLocal.FieldByName('fc_auto').AsString+');';
          paPeregon.Font.Color := clNavy;
          isFirst := True;
          idFirst := odsLocal.FieldByName('fk_id').AsInteger;
        end else
        begin
          if idSecond = 0 then
            begin
              paPeregon.Caption := paPeregon.Caption+' ¬ыбрана 2-а€ машина: '+odsLocal.FieldByName('fc_name').AsString+'('+odsLocal.FieldByName('fc_auto').AsString+');';
              paPeregon.Font.Color := clGreen;
              idSecond := odsLocal.FieldByName('fk_id').AsInteger;
              bEnter.Enabled := True;
            end;
        end;
    end;
end;

procedure TfrmSetDrv.TVCARSCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if pPeregon <> 1 then
    begin
      bEnter.Click;
    end;
end;

procedure TfrmSetDrv.TVCARSCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var iColor, iColor2 : TColor;
    ARec : TRect;
begin
  if AViewInfo.GridRecord.Values[VCARS_BONUS.Index] > 0 then
    begin
      icolor2 := clBlue;
      if AViewInfo.GridRecord.Values[VCARS_BONUS.Index] = 1 then
        begin
          icolor2 := clBlue;
        end;
      if AViewInfo.GridRecord.Values[VCARS_BONUS.Index] = 2 then
        begin
          icolor2 := $00FF80FF;
        end;
      if AViewInfo.GridRecord.Values[VCARS_BONUS.Index] > 2 then
        begin
          icolor2 := clRed;
        end;
      ARec := AViewInfo.RecordViewInfo.Bounds;
      icolor := ACanvas.Brush.Color;
      ACanvas.Brush.Color := iColor2;
      ACanvas.FrameRect(ARec, icolor2, 2, [bLeft..bBottom], True);
      ACanvas.Brush.Color := icolor;
      ACanvas.Pen.Color := icolor;
      AViewInfo.Borders := [];
    end;
end;

procedure TfrmSetDrv.TVCARSGetCellHeight(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);
begin
  AHeight := 25;
end;

procedure TfrmSetDrv.TVCARSKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_return) or (key = vk_f2) then
    begin
      if pPeregon = 1 then
        begin
          if isFirst = False then
            begin
              paPeregon.Caption := '¬ыбрана 1-а€ машина: '+odsLocal.FieldByName('fc_name').AsString+'('+odsLocal.FieldByName('fc_auto').AsString+');';
              paPeregon.Font.Color := clNavy;
              isFirst := True;
              idFirst := odsLocal.FieldByName('fk_id').AsInteger;
              exit;
            end else
            begin
              if idSecond = 0 then
                begin
                  paPeregon.Caption := paPeregon.Caption+' ¬ыбрана 2-а€ машина: '+odsLocal.FieldByName('fc_name').AsString+'('+odsLocal.FieldByName('fc_auto').AsString+');';
                  paPeregon.Font.Color := clGreen;
                  idSecond := odsLocal.FieldByName('fk_id').AsInteger;
                  bEnter.Enabled := True;
                end;
            end;
        end;
      bEnter.Click;
    end;

  if key = vk_back then
    begin
      teFilter.Text := copy(teFilter.Text, 1, Length(teFilter.Text)-1);
    end;
  if (key = vk_f8) or (key = vk_delete) then
    begin
      teFilter.Text := '';
    end;
  if key = vk_right then
    begin
      bAllCars.Click;
    end;
end;

procedure TfrmSetDrv.TVCARSKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9']) then
    Key := #0
  else
    teFilter.Text := teFilter.Text + Key;
end;

procedure TfrmSetDrv.VALLCARSColumn1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  bEnter.Click;
end;

procedure TfrmSetDrv.VALLTAXIColumn1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  bEnter.Click;
end;

procedure TfrmSetDrv.VCARSChoosePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  bEnter.Click;
end;

procedure TfrmSetDrv.InitNavigationTabs(pcControl:TcxPageControl;mdODS:TdxMemData);
var
  I: Integer;
  ts: TcxTabSheet;
begin
  for I := 0 to pcControl.PageCount - 1 do
  begin
    pcControl.Pages[0].Free;
  end;

  with mdODS do
  begin
    Open;
    Last;
    for I := 0 to RecordCount - 1 do
    begin
      ts := TcxTabSheet.Create(pcControl);
      ts.Name := 'pcRaion'+IntToStr(I);
      ts.Caption := FieldByName('fc_raion').AsString;
      ts.Tag := FieldByName('fk_raion').AsInteger;
      ts.PageControl := pcControl;
      Prior;
    end;
  end;
  if (pcControl.TabCount > 0) then
  begin
    pcControl.Width := pcControl.Tabs[0].FullRect.Right - pcControl.Tabs[0].FullRect.Left + 5;
  end
  else begin
    pcControl.Width := 0;
  end;
end;

procedure TfrmSetDrv.MenuItem1Click(Sender: TObject);
begin
  tvAllCars.RestoreFromRegistry('\SoftWare\TaxiService\Disp\fSetDrv\tvAllCarsDefault'+IntToStr(frmMain.pSOTRID), False, False, [], 'tvAllCars');
end;

procedure TfrmSetDrv.MenuItem2Click(Sender: TObject);
begin
  tvAllTaxi.RestoreFromRegistry('\SoftWare\TaxiService\Disp\fSetDrv\tvAllTaxiDefault'+IntToStr(frmMain.pSOTRID), False, False, [], 'tvAllTaxi');
end;

procedure TfrmSetDrv.N1Click(Sender: TObject);
begin
  tvCars.RestoreFromRegistry('\SoftWare\TaxiService\Disp\fSetDrv\tvCarsDefault'+IntToStr(frmMain.pSOTRID), False, False, [], 'tvCars');
end;

end.
