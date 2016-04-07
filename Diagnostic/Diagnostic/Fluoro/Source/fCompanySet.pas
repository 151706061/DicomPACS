unit fCompanySet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls,
  cxInplaceContainer, cxTLData, cxDBTL, Oracle, DB, OracleData, cxMaskEdit,
  ComCtrls, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxImageComboBox,
  ImgList, dxBar, ActnList, jvDbUtils, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, dxSkinsdxBarPainter, ExtCtrls, Registry, dxBarExtItems,
  cxLabel, cxContainer, cxTextEdit, frxClass, frxDBSet, Menus, cxGridExportLink,
  cxSplitter, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmCompanySet = class(TForm)
    dsTree: TDataSource;
    IL1: TImageList;
    IL2: TImageList;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    al: TActionList;
    bbClose: TdxBarButton;
    bbSet: TdxBarButton;
    bbAdd: TdxBarButton;
    bbEdit: TdxBarButton;
    bbAddChild: TdxBarButton;
    bbRefresh: TdxBarButton;
    bbDel: TdxBarButton;
    aClose: TAction;
    aSet: TAction;
    aAdd: TAction;
    aEdit: TAction;
    aAddChild: TAction;
    aDel: TAction;
    aRefresh: TAction;
    paPeriod: TPanel;
    Panel2: TPanel;
    TVCOMPANY: TcxGridDBTableView;
    cxGridCompanyLevel1: TcxGridLevel;
    cxGridCompany: TcxGrid;
    odsTree: TOracleDataSet;
    odsTreeFK_ID: TFloatField;
    odsTreeFC_NAME: TStringField;
    odsTreeFK_OWNER: TFloatField;
    odsCompany: TOracleDataSet;
    dsCompany: TDataSource;
    VCOMPANYNAME: TcxGridDBColumn;
    dxBarDockControl2: TdxBarDockControl;
    BMBar2: TdxBar;
    cxDBTree: TcxDBTreeList;
    bbCollapse: TdxBarButton;
    bbExpand: TdxBarButton;
    dxBarDockControl3: TdxBarDockControl;
    BMBar3: TdxBar;
    bbAddCompany: TdxBarButton;
    bbEditCompany: TdxBarButton;
    bbDelCompany: TdxBarButton;
    bbRefreshCompany: TdxBarButton;
    VCOMPANYORDER: TcxGridDBColumn;
    aAddCompany: TAction;
    aEditCompany: TAction;
    aDelCompany: TAction;
    aRefreshCompany: TAction;
    odsTreeFN_ORDER: TFloatField;
    odsTreeFD_DATE1: TDateTimeField;
    odsTreeFD_DATE2: TDateTimeField;
    bbSearch: TdxBarButton;
    aSearch: TAction;
    bbPrint: TdxBarButton;
    aPrint: TAction;
    frxRepCompany: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    TreeColumnNAME: TcxDBTreeListColumn;
    TreeColumnORDER: TcxDBTreeListColumn;
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
    bbEditPeriod: TdxBarButton;
    aEditPeriod: TAction;
    VCOMPANYKOLVO: TcxGridDBColumn;
    bbSearchPeople: TdxBarButton;
    aSearchPeople: TAction;
    bbDate: TdxBarButton;
    aDate: TAction;
    VCOMPANYDATE: TcxGridDBColumn;
    VCOMPANYSOTR: TcxGridDBColumn;
    bbTransfer: TdxBarButton;
    aTransfer: TAction;
    VCOMPANYIMAGE: TcxGridDBColumn;
    cxSplitter1: TcxSplitter;
    VCOMPANYFK_ID: TcxGridDBColumn;
    N3: TMenuItem;
    N4: TMenuItem;
    odsCompany_4Print: TOracleDataSet;
    procedure aCloseExecute(Sender: TObject);
    procedure aSetExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aAddChildExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure odsTreeAfterScroll(DataSet: TDataSet);
    procedure bbCollapseClick(Sender: TObject);
    procedure bbExpandClick(Sender: TObject);
    procedure aAddCompanyExecute(Sender: TObject);
    procedure aEditCompanyExecute(Sender: TObject);
    procedure aDelCompanyExecute(Sender: TObject);
    procedure aRefreshCompanyExecute(Sender: TObject);
    procedure cxDBTreeFocusedNodeChanged(Sender: TObject; APrevFocusedNode,
      AFocusedNode: TcxTreeListNode);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aSearchExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure frxRepCompanyGetValue(const VarName: string; var Value: Variant);
    procedure N2Click(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure odsCompanyAfterOpen(DataSet: TDataSet);
    procedure TVCOMPANYDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure cxDBTreeDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure cxDBTreeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure aEditPeriodExecute(Sender: TObject);
    procedure aSearchPeopleExecute(Sender: TObject);
    procedure TVCOMPANYCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure aDateExecute(Sender: TObject);
    procedure aTransferExecute(Sender: TObject);
    procedure odsCompanyAfterScroll(DataSet: TDataSet);
    procedure N4Click(Sender: TObject);
    procedure pmTVPopup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    idOwner : Integer;
    GET_SYSDATE_4REP : String;
    idCompany2Drag : Integer;
    idTree2Drag : Integer;
    idTreeOwner2Drag : Integer;
    idFK_COMPANYID : Integer;
    idOwnerCompany : Integer;
    procedure CheckEnabledButtonsCompany;
    { Private declarations }
  public
    idSearchPeople : Integer;
    procedure DoShowForm;
    procedure CheckEnabledButtons;
    function GetDragSourceGridView(Source: TObject): TcxCustomGridView;
    { Public declarations }
  end;

var
  frmCompanySet: TfrmCompanySet;

implementation

uses fAddEditElement, fMain, fAddEditCompany, fSearchCompany, fEditPeriod,
  fSearchPeople, fDateControl, fTransfer, fAddToCompany, fAddEditPeriod;

{$R *.dfm}

procedure TfrmCompanySet.TVCOMPANYCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var id : Integer;
    ods : TOracleDataSet;
begin
  id := odsCompany.FieldByName('FK_ID').AsInteger;
  if id = -2 then // проверяем если '...' то выходим, ничего не делаем
    begin
      if odsCompany.FieldByName('FK_OWNER').AsInteger = odsTree.FieldByName('FK_ID').AsInteger then // !!!
        begin
          exit;
        end else
        begin
          aAddCompany.Enabled := True;
          ods := TOracleDataSet.Create(nil);
          try
            ods.Session := frmMain.os;
            ods.Cursor := crSQLWait;
            ods.SQL.Text := ' SELECT FK_OWNER FROM ASU.TPERIOD_COMPANY WHERE FK_ID = :PFK_ID ';
            ods.DeclareAndSet('PFK_ID', otInteger, odsCompany.FieldByName('FK_OWNER').AsInteger);
            ods.Open;
            odsCompany.Close;
            odsCompany.SetVariable('PFK_OWNER', ods.FieldByName('FK_OWNER').AsInteger);
            odsCompany.Open;
            if idOwner <> 0 then
              odsCompany.Locate('FK_ID', idOwner, []);
          finally
            ods.Free;
          end;
        end;
  end else
  begin
    if odsCompany.FieldByName('COUNTCHILD').AsInteger <> 0 then // входим в подкаталог
      begin
        idOwner := odsCompany.FieldByName('FK_ID').AsInteger;
        odsCompany.Close;
        odsCompany.SetVariable('PFK_OWNER', id);
        odsCompany.Open;
        aAddCompany.Enabled := False;
      end else
      begin
        if odsCompany.FieldByName('COUNTCHILD').AsInteger = 0 then
          begin
            aSetExecute(nil);
          end;
      end;
  end;
end;

function TfrmCompanySet.GetDragSourceGridView(Source: TObject): TcxCustomGridView;
begin
  if (TDragControlObject(Source).Control is TcxGridSite) then
    Result := TcxGridSite(TDragControlObject(Source).Control).GridView
  else
    Result := nil;
end;

procedure TfrmCompanySet.TVCOMPANYDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  idTree2Drag := odsTree.FieldByName('FK_ID').AsInteger;
  idOwnerCompany := odsCompany.FieldByName('FK_OWNER').AsInteger;
  idCompany2Drag := odsCompany.FieldByName('FK_ID').AsInteger;
  idFK_COMPANYID := odsCompany.FieldByName('FK_COMPANYID').AsInteger;
  Accept := TRUE;
end;

procedure TfrmCompanySet.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmCompanySet.aSearchExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  Application.CreateForm(TfrmSearchCompany, frmSearchCompany);
  frmSearchCompany.ShowModal;
  if frmSearchCompany.ModalResult = mrOK then
    begin
      if frmSearchCompany.odsSearchCompany.FieldByName('FN_PRIZNAK').AsInteger = 1 then
        begin
          ods := TOracleDataSet.Create(nil);
          try
            ods.Session := frmMain.os;
            ods.Cursor := crSQlWait;
            ods.Sql.Text := ' SELECT FK_OWNER FROM ASU.TPERIOD_COMPANY WHERE FK_ID = :PFK_OWNER ';
            ods.DeclareAndSet('PFK_OWNER', otInteger, frmSearchCompany.odsSearchCompany.FieldByName('FK_OWNER').AsInteger);
            ods.Open;
            odsTree.AfterScroll := nil;
            odsTree.Locate('FK_ID', ods.FieldByName('FK_OWNER').AsInteger, []);
            odsTree.AfterScroll := odsTreeAfterScroll;
            odsCompany.Close;
            odsCompany.SetVariable('PFK_OWNER', frmSearchCompany.odsSearchCompany.FieldByName('FK_OWNER').AsInteger);
            odsCompany.Open;
            odsCompany.Locate('FK_ID', frmSearchCompany.odsSearchCompany.FieldByName('FK_ID').AsInteger, []);
          finally
            ods.Free;
          end;
        end else
        begin
          odsTree.AfterScroll := nil;
          odsTree.Locate('FK_ID', frmSearchCompany.odsSearchCompany.FieldByName('FK_OWNER').AsInteger, []);
          odsTree.AfterScroll := odsTreeAfterScroll;
          odsTreeAfterScroll(nil);
          odsCompany.Locate('FK_ID', frmSearchCompany.odsSearchCompany.FieldByName('FK_ID').AsInteger, []);
        end;
    end;
  frmSearchCompany.Free;
end;

procedure TfrmCompanySet.aSearchPeopleExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  Application.CreateForm(TfrmSearchPeople, frmSearchPeople);
  frmSearchPeople.DoShowfrmSearchPeople;
  frmSearchPeople.ShowModal;
  if frmSearchPeople.ModalResult = MrOK then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT FK_ID, FN_PRIZNAK FROM ASU.TPERIOD_COMPANY WHERE FK_COMPANYID = :PFK_COMPANYID AND FK_OWNER = :PFK_OWNER ';
        ods.DeclareAndSet('PFK_COMPANYID', otInteger, frmSearchPeople.odsPac.FieldByName('FK_COMPANYID').AsInteger);
        ods.DeclareAndSet('PFK_OWNER', otInteger, frmSearchPeople.odsPac.FieldByName('FK_PERIODID').AsInteger);
        ods.Open;
        if ods.FieldByName('FN_PRIZNAK').AsInteger = 1 then
          begin
            odsTree.AfterScroll := nil;
            odsTree.Locate('FK_ID', frmSearchPeople.odsPac.FieldByName('FK_OWNER').AsInteger, []);
            odsTree.AfterScroll := odsTreeAfterScroll;
            odsCompany.Close;
            odsCompany.SetVariable('PFK_OWNER', frmSearchPeople.odsPac.FieldByName('FK_PERIODID').AsInteger);
            odsCompany.Open;
            odsCompany.Locate('FK_ID', ods.FieldByName('FK_ID').AsInteger, []);
            idSearchPeople := frmSearchPeople.odsPac.FieldByName('FK_PEOPLEID').AsInteger;
          end else
          begin
            odsTree.AfterScroll := nil;
            odsTree.Locate('FK_ID', frmSearchPeople.odsPac.FieldByName('FK_PERIODID').AsInteger, []); //frmSearchPeople.odsPac.FieldByName('OWNER').AsInteger, []);
            odsTree.AfterScroll := odsTreeAfterScroll;
            odsTreeAfterScroll(nil);
            odsCompany.Locate('FK_COMPANYID', frmSearchPeople.odsPac.FieldByName('FK_COMPANYID').AsInteger, []);
            idSearchPeople := frmSearchPeople.odsPac.FieldByName('FK_PEOPLEID').AsInteger;
          end;
      finally
        ods.Free;
      end;
    end;
  frmSearchPeople.Free;
end;

procedure TfrmCompanySet.aSetExecute(Sender: TObject);
begin
  ModalResult := MrOK;
end;

procedure TfrmCompanySet.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVCOMPANY.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGridCompany, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGridCompany, TRUE, TRUE);
end;

procedure TfrmCompanySet.aTransferExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmTransfer, frmTransfer);
  try
    frmTransfer.ShowModal;
  finally
    frmTransfer.Free;
  end;
end;

procedure TfrmCompanySet.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVCOMPANY.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGridCompany, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGridCompany, TRUE, TRUE);
end;

procedure TfrmCompanySet.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVCOMPANY.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGridCompany, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGridCompany, TRUE, TRUE);
end;

procedure TfrmCompanySet.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVCOMPANY.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGridCompany, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGridCompany, TRUE, TRUE);
end;

procedure TfrmCompanySet.aAddCompanyExecute(Sender: TObject);
var odsCount : TOracleDataSet;
    oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditCompany, frmAddEditCompany);
  try
    frmAddEditCompany.ShowModal;
    if frmAddEditCompany.ModalResult = MrOk then
      begin
        odsCount := TOracleDataSet.Create(nil);
        try
          odsCount.Session := frmMain.os;
          odsCount.Cursor := crSQLWait;
          odsCount.SQL.Text := ' SELECT FK_ID FROM ASU.TPERIOD_COMPANY '+
                               '  WHERE FK_COMPANYID = :PFK_COMPANYID AND FK_OWNER = :PFK_OWNER AND FL_DEL = 0 ';
          odsCount.DeclareAndSet('PFK_COMPANYID', otInteger, frmAddEditCompany.cxCompany.Tag);
          odsCount.DeclareAndSet('PFK_OWNER', otInteger, odsTree.FieldByName('FK_ID').AsInteger);
          odsCount.Open;
          if odsCount.RecordCount > 0 then
            begin
              Application.MessageBox('В указанном периоде уже существует такое же предприятие!'+
              #13#10+'Вы не можете перенести предприятие в период, в котором оно уже есть,'+
              ' иначе произойдет дублирование пациентов, закрепленных за этим предприятием!', 'Внимание!', MB_OK+MB_ICONWARNING);
              exit;
            end;
        finally
          odsCount.Free;
        end;
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' INSERT INTO TPERIOD_COMPANY(FC_NAME, FK_OWNER, FN_ORDER, FK_COMPANYID) '+
                         ' VALUES(:PFC_NAME, :PFK_OWNER, :PFN_ORDER, :PFK_COMPANYID) '+
                         ' RETURNING FK_ID INTO :PFK_ID ';
          oq.DeclareAndSet('PFC_NAME', otString, frmAddEditCompany.cxName.Text);
          oq.DeclareAndSet('PFK_OWNER', otInteger, odsTree.FieldByName('FK_ID').AsInteger);
          oq.DeclareAndSet('PFN_ORDER', otInteger, frmAddEditCompany.cxOrder.Value);
          oq.DeclareAndSet('PFK_COMPANYID', otInteger, frmAddEditCompany.cxCompany.Tag);
          oq.DeclareVariable('PFK_ID', otInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsCompany);
          odsCompany.Locate('FK_ID', oq.GetVariable('PFK_ID'), []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditCompany.Free;
  end;
end;

procedure TfrmCompanySet.aAddExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditPeriod, frmAddEditPeriod);
  frmAddEditPeriod.ShowModal;
  if frmAddEditPeriod.ModalResult = MrOK then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' INSERT INTO ASU.TPERIOD_COMPANY(FC_NAME, FK_OWNER, FN_ORDER, FK_COMPANYID) '+
                       ' VALUES(:PFC_NAME, 0, :PFN_ORDER, NULL) '+
                       ' RETURNING FK_ID INTO :PFK_ID ';
        oq.DeclareAndSet('PFC_NAME', otString, frmAddEditPeriod.cxName.Text);
        oq.DeclareAndSet('PFN_ORDER', otInteger, frmAddEditPeriod.cxOrder.Value);
        oq.DeclareVariable('PFK_ID', otInteger);
        oq.Execute;
        frmMain.os.Commit;
        odsTree.AfterScroll := nil;
        RefreshQuery(odsTree);
        odsTree.Locate('FK_ID', oq.GetVariable('PFK_ID'), []);
        odsTree.AfterScroll := odsTreeAfterScroll;
        odsTreeAfterScroll(nil);
      finally
        oq.Free;
      end;
    end;
  frmAddEditPeriod.Free;
end;

procedure TfrmCompanySet.aEditCompanyExecute(Sender: TObject);
var oq : TOracleQuery;
    id : Integer;
begin
  id := odsCompany.FieldByName('fk_companyid').AsInteger;
  Application.CreateForm(TfrmAddEditCompany, frmAddEditCompany);
  try
    frmAddEditCompany.cxName.Text := odsCompany.FieldByName('FC_NAME').AsString;
    frmAddEditCompany.cxCompany.Text := odsCompany.FieldByName('SHORTNAME').AsString;
    frmAddEditCompany.cxCompany.Tag :=  odsCompany.FieldByName('FK_COMPANYID').AsInteger;
    frmAddEditCompany.cxOrder.Value := odsCompany.FieldByName('FN_ORDER').AsInteger;
    frmAddEditCompany.ShowModal;
    if frmAddEditCompany.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.tperiod_company '+#13+
                         '    set fc_name = :pfc_name, fk_companyid = :pfk_companyid, fn_order = :pfn_order '+#13+
                         '  where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditCompany.cxName.Text);
          oq.DeclareAndSet('pfk_companyid', otInteger, frmAddEditCompany.cxCompany.Tag);
          oq.DeclareAndSet('pfn_order', otInteger, frmAddEditCompany.cxOrder.Value);
          oq.DeclareAndSet('pfk_id', otInteger, odsCompany.FieldByName('FK_ID').AsInteger);
          oq.Execute;
          oq.DeleteVariables;
          oq.SQL.Text := ' update asu.tpeoples_company '+#13+
                         '    set fk_companyid = :pfk_companyid '+#13+
                         '  where fk_companyid = :pfk_companyid_old '+#13+
                         '    and fk_periodid = :pfk_periodid ';
          oq.DeclareAndSet('pfk_companyid', otInteger, frmAddEditCompany.cxCompany.Tag);
          oq.DeclareAndSet('pfk_companyid_old', otInteger, id);
          oq.DeclareAndSet('pfk_periodid', otInteger, odsCompany.FieldByName('fk_owner').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsCompany);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditCompany.Free;
  end;
end;

procedure TfrmCompanySet.aEditExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditPeriod, frmAddEditPeriod);
  frmAddEditPeriod.cxName.Text := odsTree.FieldByName('FC_NAME').AsString;
  frmAddEditPeriod.cxOrder.Value := odsTree.FieldByName('FN_ORDER').AsInteger;
  frmAddEditPeriod.ShowModal;
  if frmAddEditPeriod.ModalResult = MrOK then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' UPDATE ASU.TPERIOD_COMPANY '+
                       '    SET FC_NAME = :PFC_NAME, '+
                       '        FN_ORDER = :PFN_ORDER '+
                       '  WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('PFC_NAME', otString, frmAddEditPeriod.cxName.Text);
        oq.DeclareAndSet('PFN_ORDER', otInteger, frmAddEditPeriod.cxOrder.Value);
        oq.DeclareAndSet('PFK_ID', otInteger, odsTree.FieldByName('FK_ID').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        odsTree.AfterScroll := nil;
        RefreshQuery(odsTree);
        odsTree.AfterScroll := odsTreeAfterScroll;
        odsTreeAfterScroll(nil);
      finally
        oq.Free;
      end;
    end;
  frmAddEditPeriod.Free;
end;

procedure TfrmCompanySet.aEditPeriodExecute(Sender: TObject);
var oq : TOracleQuery;
    idCompany : Integer;
    odsChild : TOracleDataSet;
    oqUpdateChild : TOracleQuery;
begin
  Application.CreateForm(TfrmEditPeriod, frmEditPeriod);
  try
    if frmEditPeriod.odsMonth.Active = False then
      frmEditPeriod.odsMonth.Open;
    frmEditPeriod.cxCompanyName.Text := odsCompany.FieldByName('FC_NAME').AsString;
    frmEditPeriod.cxMonth.EditValue := odsTree.FieldByName('FK_ID').AsInteger;
    idCompany := odsCompany.FieldByName('FK_ID').AsInteger;
    frmEditPeriod.ShowModal;
    if frmEditPeriod.ModalResult = MrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          Screen.Cursor := crSQLWait;
          oq.Session := frmMain.os;
          oq.SQL.Text := ' UPDATE ASU.TPERIOD_COMPANY SET FK_OWNER = :PFK_OWNER, FN_PRIZNAK = 0 WHERE FK_ID = :PFK_ID ';
          oq.DeclareAndSet('PFK_OWNER', otInteger, frmEditPeriod.cxMonth.EditValue);
          oq.DeclareAndSet('PFK_ID', otInteger, odsCompany.FieldByName('FK_ID').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
          oq.DeleteVariables;
          oq.SQL.Text := ' UPDATE ASU.TPEOPLES_COMPANY '+
                         '    SET FK_PERIODID = :PFK_PERIODID '+
                         '  WHERE FK_PERIODID = :PFK_OWNER '+
                         '    AND FK_COMPANYID = :PFK_COMPANYID ';
          oq.DeclareAndSet('PFK_PERIODID', otInteger, frmEditPeriod.cxMonth.EditValue);
          oq.DeclareAndSet('PFK_OWNER', otInteger, odsCompany.FieldByName('FK_OWNER').AsInteger);
          oq.DeclareAndSet('PFK_COMPANYID', otInteger, odsCompany.FieldByName('FK_COMPANYID').AsInteger);
          oq.Execute;
//-->> цикл внутри предприятия
         if odsCompany.FieldByName('COUNTCHILD').AsInteger > 0 then
           begin
             odsChild := TOracleDataSet.Create(nil);
             oqUpdateChild := TOracleQuery.Create(nil);
             try
               odsChild.Session := frmMain.os;
               odsChild.Cursor := crSQLWait;
               odsChild.SQL.Text := ' SELECT FK_ID '+
                                    '   FROM ASU.TPEOPLES_COMPANY '+
                                    '  WHERE FK_COMPANYID IN (SELECT FK_COMPANYID FROM ASU.TPERIOD_COMPANY WHERE FK_OWNER = :PFK_OWNER) '+
                                    '    AND FK_PERIODID <> 0 ';
               odsChild.DeclareAndSet('PFK_OWNER', otInteger, odsCompany.FieldByName('FK_ID').AsInteger);
               odsChild.Open;
               oqUpdateChild.Session := frmMain.os;
               oqUpdateChild.Cursor := crSQLWait;
               oqUpdateChild.SQL.Text := ' UPDATE ASU.TPEOPLES_COMPANY SET FK_PERIODID = :PFK_PERIODID WHERE FK_ID = :PFK_ID ';
               oqUpdateChild.DeclareAndSet('PFK_PERIODID', otInteger, odsCompany.FieldByName('FK_ID').AsInteger); //frmEditPeriod.cxMonth.EditValue);
               oqUpdateChild.DeclareVariable('PFK_ID', otInteger);
               while not odsChild.Eof do
                 begin
                   oqUpdateChild.SetVariable('PFK_ID', odsChild.FieldByName('FK_ID').AsInteger);
                   oqUpdateChild.Execute;
                   odsChild.Next;
                 end;
             finally
               oqUpdateChild.Free;
               odsChild.Free;
             end;
           end;
          frmMain.os.Commit;
          RefreshQuery(odsCompany);
          odsTree.AfterScroll := nil;
          odsTree.Locate('FK_ID', frmEditPeriod.cxMonth.EditValue, []);
          odsTree.AfterScroll := odsTreeAfterScroll;
          odsTreeAfterScroll(odsTree);
          odsCompany.Locate('FK_ID', idCompany, []);
        finally
          Screen.Cursor := crDefault;
          oq.Free;
        end;
      end else
      begin
//        odsTree.AfterScroll := nil; // +++ закоментил 24.02.2010 убрать поистечении 2-ух месяцев
//        odsTree.Locate('FK_ID', frmEditPeriod.cxMonth.EditValue, []);
//        odsTree.AfterScroll := odsTreeAfterScroll;
//        odsTreeAfterScroll(odsTree);
      end;
  finally
    frmEditPeriod.Free;
  end;
end;

procedure TfrmCompanySet.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
     id : Integer;
begin
  id := odsCompany.FieldByName('FK_ID').AsInteger;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS SYSTEMDATE FROM DUAL ';
    ods.Open;
    GET_SYSDATE_4REP := ods.FieldByName('SYSTEMDATE').AsString;
    odsCompany_4Print.Close;
    odsCompany_4Print.SetVariable('PFK_OWNER', odsCompany.FieldByName('FK_OWNER').AsInteger);
    odsCompany_4Print.Open;
  finally
    ods.Free;
  end;
  frxRepCompany.ShowReport;
  odsCompany.Locate('FK_ID', id, []);
end;

procedure TfrmCompanySet.aAddChildExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditPeriod, frmAddEditPeriod);
  frmAddEditPeriod.ShowModal;
  if frmAddEditPeriod.ModalResult = MrOK then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' INSERT INTO ASU.TPERIOD_COMPANY(FC_NAME, FK_OWNER, FN_ORDER, FK_COMPANYID) '+
                       ' VALUES(:PFC_NAME, :PFK_OWNER, :PFN_ORDER, NULL) '+
                       ' RETURNING FK_ID INTO :PFK_ID ';
        oq.DeclareAndSet('PFC_NAME', otString, frmAddEditPeriod.cxName.Text);
        oq.DeclareAndSet('PFK_OWNER', otInteger, odsTree.FieldByName('FK_ID').AsInteger);
        oq.DeclareAndSet('PFN_ORDER', otInteger, frmAddEditPeriod.cxOrder.Value);
        oq.DeclareVariable('PFK_ID', otInteger);
        oq.Execute;
        frmMain.os.Commit;
        odsTree.AfterScroll := nil;
        RefreshQuery(odsTree);
        odsTree.Locate('FK_ID', oq.GetVariable('PFK_ID'), []);
        odsTree.AfterScroll := odsTreeAfterScroll;
        odsTreeAfterScroll(nil);
      finally
        oq.Free;
      end;
    end;
  frmAddEditPeriod.Free;
end;

procedure TfrmCompanySet.aDateExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmDateControl, frmDateControl);
  try
    if DateTimeToStr(odsCompany.FieldByName('FD_DATECONTROL').AsDateTime) = '30.12.1899' then
      frmDateControl.deControl.Date := frmMain.GET_SYSTEMDATE
    else
      frmDateControl.deControl.Date := odsCompany.FieldByName('FD_DATECONTROL').AsDateTime;
    frmDateControl.lcbControl.EditValue := odsCompany.FieldByName('FK_SOTRCONTROL').AsInteger;
    frmDateControl.ShowModal;
    if frmDateControl.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' UPDATE ASU.TPERIOD_COMPANY '+
                         '    SET FD_DATECONTROL = :PFD_DATECONTROL, FK_SOTRCONTROL = :PFK_SOTRCONTROL '+
                         '  WHERE FK_ID = :PFK_ID ';
          oq.DeclareAndSet('PFK_ID', otInteger, odsCompany.FieldByName('FK_ID').AsInteger);
          oq.DeclareAndSet('PFD_DATECONTROL', otDate, frmDateControl.deControl.Date);
          oq.DeclareAndSet('PFK_SOTRCONTROL', otInteger, frmDateControl.lcbControl.EditValue);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsCompany);
        finally
          oq.Free;
        end;
    end;
  finally
    frmDateControl.Free;
  end;
end;

procedure TfrmCompanySet.aDelCompanyExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if odsCompany.FieldByName('COUNTCHILD').AsInteger > 0 then
    begin
      Application.MessageBox('Внимание!'
                            +#13#10+'Вы не можете удалить предприятие, к которому относятся другие предприятия!'
                            +#13#10+'Сначала удалите относящиеся к нему предприятия!', 'Предупреждение',
                            MB_OK+MB_ICONWARNING);
      exit;
    end;
  if Application.MessageBox('Вы собираетесь удалить предприятие, к которому может быть прикреплен список людей ! '
                            +#13#10+'Это может привести к некорректной работе программы! '
                            +#13#10+'Вы уверены?' , 'Предупреждение',
                            MB_YESNO+MB_ICONWARNING) = IDYES then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete asu.tperiod_company where fk_id = :pfk_id ';
//        oq.SQL.Text := ' UPDATE ASU.TPERIOD_COMPANY SET FL_DEL = 1 WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('pfk_id', otInteger, odsCompany.FieldByName('FK_ID').AsInteger);
        oq.Execute;
//        oq.DeleteVariables;
//        oq.SQL.Text := ' DELETE FROM ASU.TPEOPLES_COMPANY WHERE FK_COMPANYID = :PFK_COMPANYID AND FK_PERIODID = :PFK_PERIODID ';
//        oq.DeclareAndSet('PFK_COMPANYID', otInteger, odsCompany.FieldByName('FK_COMPANYID').AsInteger);
//        oq.DeclareAndSet('PFK_PERIODID', otInteger, odsCompany.FieldByName('FK_OWNER').AsInteger);
//        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsCompany);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmCompanySet.aDelExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if Application.MessageBox('Вы собираетесь удалить уровень и все его подуровни, если таковые имеются! '
                            +#13#10+'Это может привести к некорректной работе программы! '
                            +#13#10+'Вы уверены?' , 'Предупреждение !',
                            MB_YESNO+MB_ICONQUESTION) = IdYES then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tperiod_company '+#13+
                       ' where fk_id in (select fk_id from asu.tperiod_company start with fk_id = :pfk_id connect by prior fk_id = fk_owner) ';
//                       '  where fk_id in (select fk_id from asu.tperiod) '
//        oq.SQL.Text := ' UPDATE TPERIOD_COMPANY SET FL_DEL = 1 WHERE FK_ID IN ( '+
//                       ' SELECT FK_ID FROM TPERIOD_COMPANY START WITH FK_ID = :PFK_ID '+
//                       ' CONNECT BY PRIOR FK_ID = FK_OWNER ) ';
        oq.DeclareAndSet('PFK_ID', otInteger, odsTree.FieldByName('FK_ID').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        odsTree.AfterScroll := nil;
        RefreshQuery(odsTree);
        odsTree.AfterScroll := odsTreeAfterScroll;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmCompanySet.aRefreshCompanyExecute(Sender: TObject);
begin
  RefreshQuery(odsCompany);
end;

procedure TfrmCompanySet.aRefreshExecute(Sender: TObject);
begin
  odsTree.AfterScroll := nil;
  RefreshQuery(odsTree);
  odsTree.AfterScroll := odsTreeAfterScroll;
  odsTreeAfterScroll(nil);
end;

procedure TfrmCompanySet.DoShowForm;
var Reg : TRegIniFile;
     id : Integer;
begin
  odsTree.AfterScroll := nil;
  if odsTree.Active = False then
    odsTree.Open;
  cxDBTree.FullExpand;
  if frmMain.PeriodId <> 0 then
    begin
      if odsCompany.Active = False then
        odsCompany.Open;
      odsTree.Locate('FK_ID', frmMain.PeriodId, []);
    end;
  odsTree.AfterScroll := odsTreeAfterScroll;
  odsTreeAfterScroll(nil);  
//-->> 1. показываем кнопки в зависимости от прав
  if frmMain.bIsAdmin = 1 then
    begin
      aAdd.Visible := True;
      aEdit.Visible := True;
      aAddChild.Visible := True;
      aDel.Visible := True;
      TreeColumnORDER.Visible := True;
      aDelCompany.Visible := True;
      aTransfer.Visible := True;
    end else
    begin
      aAdd.Visible := False;
      aEdit.Visible := False;
      aAddChild.Visible := False;
      aDel.Visible := False;
      TreeColumnORDER.Visible := False;
      aDelCompany.Visible := False;
      aTransfer.Visible := False;
    end;
//<<-- 1
//------------------------------------------------------------------------------
  Reg:=TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  id := Reg.ReadInteger('\Software\Softmaster\Fluoro\SetCompany\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'WIDTH_PANEL_PERIOD', 0);
  Reg.Free;
  if id = 0 then
    paPeriod.Width := 300
  else
    paPeriod.Width := id;

  TVCOMPANY.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TVCOMPANY'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TVCOMPANY');
  TVCOMPANY.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TVCOMPANY'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVCOMPANY');
end;

procedure TfrmCompanySet.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile;
begin
  Reg:=TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  try
    Reg.WriteInteger('\Software\Softmaster\Fluoro\SetCompany\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'WIDTH_PANEL_PERIOD', paPeriod.Width);
  finally
    Reg.Free;
  end;

  TVCOMPANY.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TVCOMPANY'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVCOMPANY');
end;

procedure TfrmCompanySet.FormCreate(Sender: TObject);
begin
  idOwner := 0;
end;

procedure TfrmCompanySet.frxRepCompanyGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'SYSDATE' then Value := GET_SYSDATE_4REP;
  if VarName = 'ELEMENT' then Value := odsTree.FieldByName('FC_NAME').AsString;
  if VarName = 'KOLVO' then Value := odsCompany.RecordCount-1; // уменьшаем на 1 из-за строки '...'
  if VarName = 'SOTRNAME' then Value := frmMain.sVrachFIO;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
end;

procedure TfrmCompanySet.N2Click(Sender: TObject);
begin
  TVCOMPANY.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TVCOMPANY'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TVCOMPANY');
end;

procedure TfrmCompanySet.N4Click(Sender: TObject);
var oq, oqU : TOracleQuery;
    ods : TOracleDataSet;
begin
  Application.CreateForm(TfrmAddToCompany, frmAddToCompany);
  try
    frmAddToCompany.Caption := 'Предприятия - '+odsTree.FieldByName('FC_NAME').AsString;
    frmAddToCompany.odsList.SetVariable('PFK_OWNER', odsTree.FieldByName('FK_ID').AsInteger);
    frmAddToCompany.odsList.SetVariable('PFK_ID', odsCompany.FieldByName('FK_ID').AsInteger);
    frmAddToCompany.odsList.Open;
    frmAddToCompany.ShowModal;
    if frmAddToCompany.ModalResult = MrOk then
      begin
        oq := TOracleQuery.Create(nil);
        oqU := TOracleQuery.Create(nil);
        ods := TOracleDataSet.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' UPDATE ASU.TPERIOD_COMPANY SET FK_OWNER = :PFK_OWNER, FN_PRIZNAK = 1 WHERE FK_ID = :PFK_ID ';
          oq.DeclareAndSet('PFK_OWNER', otInteger, frmAddToCompany.odsList.FieldByName('FK_ID').AsInteger);
          oq.DeclareAndSet('PFK_ID', otInteger, odsCompany.FieldByName('FK_ID').AsInteger);
          oq.Execute;
          ods.Session := frmMain.os;
          ods.Cursor := crSQLWait;
          ods.SQL.Text := ' SELECT FK_ID FROM ASU.TPEOPLES_COMPANY WHERE FK_COMPANYID = :PFK_COMPANYID AND FK_PERIODID = :PFK_PERIODID ';
          ods.DeclareAndSet('PFK_COMPANYID', otInteger, odsCompany.FieldByName('FK_COMPANYID').AsInteger);
          ods.DeclareAndSet('PFK_PERIODID', otInteger, odsTree.FieldByName('FK_ID').AsInteger);
          ods.Open;
          oqU.Session := frmMain.os;
          oqU.Cursor := crSQLWait;
          oqU.SQL.Text := ' UPDATE ASU.TPEOPLES_COMPANY SET FK_PERIODID = :PFK_PERIODID WHERE FK_ID = :PFK_ID ';
          oqU.DeclareAndSet('PFK_PERIODID', otInteger, frmAddToCompany.odsList.FieldByName('FK_ID').AsInteger);
          oqU.DeclareVariable('PFK_ID', otInteger);
          while not ods.Eof do
            begin
              oqU.SetVariable('PFK_ID', ods.FieldByName('FK_ID').AsInteger);
              oqU.Execute;
              ods.Next;
            end;
          frmMain.os.Commit;
          RefreshQuery(odsCompany);
        finally
          oq.Free;
          ods.Free;
          oqU.Free;
        end;
      end;
  finally
    frmAddToCompany.Free;
  end;
end;

procedure TfrmCompanySet.bbCollapseClick(Sender: TObject);
begin
  cxDBTree.FullCollapse;
end;

procedure TfrmCompanySet.bbExpandClick(Sender: TObject);
begin
  cxDBTree.FullExpand;
end;

procedure TfrmCompanySet.odsCompanyAfterOpen(DataSet: TDataSet);
begin
  CheckEnabledButtonsCompany;
end;

procedure TfrmCompanySet.odsCompanyAfterScroll(DataSet: TDataSet);
begin
  aSet.Enabled := (odsCompany.FieldByName('FK_ID').AsInteger <> -2) and (odsCompany.FieldByName('COUNTCHILD').AsInteger = 0);
  aEditPeriod.Enabled := (odsCompany.RecordCount <> 0) and (odsCompany.FieldByName('FK_ID').AsInteger <> -2);
  aDate.Enabled := (odsCompany.RecordCount <> 0) and (odsCompany.FieldByName('FK_ID').AsInteger <> -2)
                   and (odsCompany.FieldByName('COUNTCHILD').AsInteger = 0);
  aEditCompany.Enabled := odsCompany.FieldByName('FK_ID').AsInteger <> -2;
  aDelCompany.Enabled := odsCompany.FieldByName('FK_ID').AsInteger <> -2;

end;

procedure TfrmCompanySet.odsTreeAfterScroll(DataSet: TDataSet);
begin
  odsCompany.Close;
  odsCompany.SetVariable('PFK_OWNER', odsTree.FieldByName('FK_ID').AsInteger);
  odsCompany.Open;
end;

procedure TfrmCompanySet.pmTVPopup(Sender: TObject);
begin
  if (odsCompany.FieldByName('FK_OWNER').AsInteger <> odsTree.FieldByName('FK_ID').AsInteger) or
     (odsCompany.FieldByName('COUNTCHILD').AsInteger <> 0) or
     (odsCompany.FieldByName('FK_ID').AsInteger = -2) then
    N4.Visible := False
  else
    N4.Visible := True;
end;

procedure TfrmCompanySet.CheckEnabledButtons;
begin
  aEdit.Enabled := odsTree.RecordCount <> 0;
  aAddChild.Enabled := odsTree.FieldByName('FK_OWNER').AsInteger = 0;
  aDel.Enabled := odsTree.RecordCount <> 0;
  aAddCompany.Enabled := odsTree.FieldByName('FK_OWNER').AsInteger <> 0;
  aRefreshCompany.Enabled := odsTree.FieldByName('FK_OWNER').AsInteger <> 0;
end;

procedure TfrmCompanySet.CheckEnabledButtonsCompany;
begin
  aEditCompany.Enabled := (odsTree.FieldByName('FK_OWNER').AsInteger <> 0) and (odsCompany.RecordCount <> 0) and (odsCompany.FieldByName('FK_ID').AsInteger <> -2);
  aDelCompany.Enabled := (odsTree.FieldByName('FK_OWNER').AsInteger <> 0) and (odsCompany.RecordCount <> 0) and (odsCompany.FieldByName('FK_ID').AsInteger <> -2);
  aRefreshCompany.Enabled := odsTree.FieldByName('FK_OWNER').AsInteger <> 0;
  aSet.Enabled := (odsCompany.RecordCount <> 0);
  aPrint.Enabled := (odsTree.FieldByName('FK_OWNER').AsInteger <> 0) and (odsCompany.RecordCount > 1);
  aEditPeriod.Enabled := (odsCompany.RecordCount <> 0) and (odsCompany.FieldByName('FK_ID').AsInteger <> -2);
  aDate.Enabled := (odsCompany.RecordCount <> 0) and (odsCompany.FieldByName('FK_ID').AsInteger <> -2);
end;

procedure TfrmCompanySet.cxDBTreeDragDrop(Sender, Source: TObject; X, Y: Integer);
var oq : TOracleQuery;
   ods : TOracleDataSet;
   odsCount : TOracleDataSet;
   odsChild : TOracleDataSet;
   oqUpdateChild : TOracleQuery; 
begin
//-->> проверяем чтобы перенос был именно в месяц, а не в квартал
  if idTreeOwner2Drag = 0 then
    begin
      if MessageDlg('Вы не можете перенести компанию в '+odsTree.FieldByName('FC_NAME').AsString+'! Укажите месяц! ', mtConfirmation, [mbOK], 0) = IDOk then
        begin
          odsTree.AfterScroll := nil;
          odsTree.Locate('FK_ID', idTree2Drag, []);
          odsTree.AfterScroll := odsTreeAfterScroll;
          odsTreeAfterScroll(odsTree);
          odsCompany.Locate('FK_ID', idCompany2Drag, []);
          idTree2Drag := 0;
          idCompany2Drag := 0;
          Exit;
        end;
    end;
//-->> переносим компанию и если у нее есть дети то и детей тоже
  if MessageDlg('Вы собираетесь перенести компанию в '+odsTree.FieldByName('FC_NAME').AsString+'! Продолжить?', mtConfirmation, [mbOK,mbCancel], 0) = IDOk then
    begin
      odsCount := TOracleDataSet.Create(nil);
      try
//-->> 1. проверка на то есть ли в указанном периоде такое же предприятие
        odsCount.Session := frmMain.os;
        odsCount.Cursor := crSQLWait;
        odsCount.SQL.Text := ' SELECT FK_ID FROM ASU.TPERIOD_COMPANY WHERE FK_COMPANYID = :PFK_COMPANYID AND FK_OWNER = :PFK_OWNER AND FL_DEL = 0 ';
        odsCount.DeclareAndSet('PFK_COMPANYID', otInteger, idFK_COMPANYID);
        odsCount.DeclareAndSet('PFK_OWNER', otInteger, odsTree.FieldByName('FK_ID').AsInteger);
        odsCount.Open;
        if odsCount.RecordCount > 0 then
          begin
            Application.MessageBox('В указанном периоде уже существует такое же предприятие!'+
            #13#10+'Вы не можете перенести предприятие в период, в котором оно уже есть,'+
            ' иначе произойдет дублирование пациентов, закрепленных за этим предприятием!', 'Внимание!', MB_OK+MB_ICONWARNING);
            odsTree.AfterScroll := nil;
            odsTree.Locate('FK_ID', idTree2Drag, []);
            odsTree.AfterScroll := odsTreeAfterScroll;
            odsTreeAfterScroll(odsTree);
            odsCompany.Locate('FK_ID', idCompany2Drag, []);
            exit;
          end;
      finally
        odsCount.Free;
      end;
//-->> 2. меняем у компании владельца, то есть период, к которому она принадлежит
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' UPDATE ASU.TPERIOD_COMPANY SET FK_OWNER = :PFK_OWNER, FN_PRIZNAK = 0 WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('PFK_OWNER', otInteger, odsTree.FieldByName('FK_ID').AsInteger);
        oq.DeclareAndSet('PFK_ID', otInteger, idCompany2Drag);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := 'UPDATE ASU.TPEOPLES_COMPANY SET FK_PERIODID = :PFK_PERIODID WHERE FK_ID = :PFK_ID ';
//-->> 3. в цикле меняем у людей, прикрепленных к этому предприятию период
        ods := TOracleDataSet.Create(nil);
        try
          ods.Session := frmMain.os;
          ods.Cursor := crSQLWait;
          ods.SQL.Text := ' SELECT FK_ID FROM ASU.TPEOPLES_COMPANY WHERE FK_COMPANYID = :PFK_COMPANYID AND FK_PERIODID = :PFK_PERIODID ';
          ods.DeclareAndSet('PFK_COMPANYID', otInteger, idFK_COMPANYID);
          ods.DeclareAndSet('PFK_PERIODID', otInteger, idOwnerCompany);
          ods.Open;
          ods.First;
          while not ods.Eof do
            begin
              oq.DeclareAndSet('PFK_PERIODID', otInteger, odsTree.FieldByName('FK_ID').AsInteger);
              oq.DeclareAndSet('PFK_ID', otInteger, ods.FieldByName('FK_ID').AsInteger);
              oq.Execute;
              ods.Next;
            end;
        finally
          ods.Free;
        end;
//-->> 4. Сюда вставляем цикл по предприятиям внутри предприятия, то есть меняем у всех "детей" у людей периодичность
        if odsCompany.FieldByName('COUNTCHILD').AsInteger > 0 then
          begin
            odsChild := TOracleDataSet.Create(nil);
            oqUpdateChild := TOracleQuery.Create(nil);
            try
              odsChild.Session := frmMain.os;
              odsChild.Cursor := crSQLWait;
              odsChild.SQL.Text := ' SELECT FK_ID '+
                                   '   FROM ASU.TPEOPLES_COMPANY '+
                                   '  WHERE FK_COMPANYID IN (SELECT FK_COMPANYID FROM ASU.TPERIOD_COMPANY WHERE FK_OWNER = :PFK_OWNER) '+
                                   '    AND FK_PERIODID <> 0 ';
              odsChild.DeclareAndSet('PFK_OWNER', otInteger, idCompany2Drag);
              odsChild.Open;
              oqUpdateChild.Session := frmMain.os;
              oqUpdateChild.Cursor := crSQLWait;
              oqUpdateChild.SQL.Text := ' UPDATE ASU.TPEOPLES_COMPANY SET FK_PERIODID = :PFK_PERIODID WHERE FK_ID = :PFK_ID ';
              oqUpdateChild.DeclareAndSet('PFK_PERIODID', otInteger, idCompany2Drag); //odsTree.FieldByName('FK_ID').AsInteger);
              oqUpdateChild.DeclareVariable('PFK_ID', otInteger);
              while not odsChild.Eof do
                begin
                  oqUpdateChild.SetVariable('PFK_ID', odsChild.FieldByName('FK_ID').AsInteger);
                  oqUpdateChild.Execute;
                  odsChild.Next;
                end;
            finally
              oqUpdateChild.Free;
              odsChild.Free;
            end;
          end;

        frmMain.os.Commit;
        RefreshQuery(odsCompany);
        odsCompany.Locate('FK_ID', idCompany2Drag, []);
        idCompany2Drag:=0;
      finally
        oq.Free;
      end;
// если отменили перенос, то возвращаемся туда где были 
    end else
    begin
      odsTree.AfterScroll := nil;
      odsTree.Locate('FK_ID', idTree2Drag, []);
      odsTree.AfterScroll := odsTreeAfterScroll;
      odsTreeAfterScroll(odsTree);
      odsCompany.Locate('FK_ID', idCompany2Drag, []);
    end;
end;

procedure TfrmCompanySet.cxDBTreeDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := TRUE;
  idTreeOwner2Drag := odsTree.FieldByName('FK_OWNER').AsInteger;
end;

procedure TfrmCompanySet.cxDBTreeFocusedNodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
  CheckEnabledButtons;
end;

end.
// инактив стайл, когда переходим на грид не видно на какой позиции в дереве стоим
