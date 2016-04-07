unit fPacInfoKonsult;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, DB,
  OracleData, Oracle, cxLabel, dxBar, ActnList, ImgList, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, jvDBUtils, Registry, jpeg, word2000,
  DBCtrls, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  StdCtrls, cxMemo, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  dxSkinsdxBarPainter, frxClass, Menus, cxLookAndFeelPainters, cxButtons, cxGridExportLink,
  frxDBSet, ClipBrd, cxCheckBox, cxCalendar, cxBarEditItem, cxButtonEdit,
  cxVGrid, cxInplaceContainer, cxPC, cxSplitter;

type
  TfrmPacInfoKonsult = class(TForm)
    odsInfo: TOracleDataSet;
    al: TActionList;
    aClose: TAction;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    aProsmotr: TAction;
    dsRegPrin: TDataSource;
    odsRegPrin: TOracleDataSet;
    frxRepProsmotr: TfrxReport;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    N2: TMenuItem;
    sdPopUp: TSaveDialog;
    aPrint: TAction;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    frxRepList: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    BM: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    bbShow: TdxBarButton;
    bbPrint: TdxBarButton;
    bbRefresh: TdxBarButton;
    aRefresh: TAction;
    cxBarEditItem1: TcxBarEditItem;
    stRep: TcxStyleRepository;
    stYellow: TcxStyle;
    BMBar1: TdxBar;
    cxBarEditItem2: TcxBarEditItem;
    bbAdd: TdxBarButton;
    bbEdit: TdxBarButton;
    bbDel: TdxBarButton;
    bbRef: TdxBarButton;
    bbClose: TdxBarButton;
    aCloseA: TAction;
    aAddA: TAction;
    aEditA: TAction;
    aDelA: TAction;
    aRefA: TAction;
    odsListA: TOracleDataSet;
    dsListA: TDataSource;
    pmtvA: TPopupMenu;
    N3: TMenuItem;
    stNone: TcxStyle;
    pcAll: TcxPageControl;
    tsMain: TcxTabSheet;
    tsTalon: TcxTabSheet;
    pcMain: TcxPageControl;
    tsPac: TcxTabSheet;
    verGr: TcxVerticalGrid;
    rowPacient: TcxCategoryRow;
    merFIOMK: TcxMultiEditorRow;
    merDateAgeSex: TcxMultiEditorRow;
    rowKem: TcxEditorRow;
    rowAddress: TcxEditorRow;
    rowAdrProj: TcxEditorRow;
    rowPhone: TcxEditorRow;
    rowWork: TcxEditorRow;
    rowPolis: TcxEditorRow;
    rowProj: TcxEditorRow;
    rowSnils: TcxEditorRow;
    rowAdmin: TcxCategoryRow;
    rowLek: TcxEditorRow;
    rowChar: TcxEditorRow;
    tsAllergy: TcxTabSheet;
    dxBarDockControl2: TdxBarDockControl;
    grA: TcxGrid;
    tvA: TcxGridDBTableView;
    tvADate: TcxGridDBColumn;
    tvANe: TcxGridDBColumn;
    tvAWAction: TcxGridDBColumn;
    tvASotr: TcxGridDBColumn;
    grALevel1: TcxGridLevel;
    paList: TPanel;
    cxGr: TcxGrid;
    TVLIST: TcxGridDBTableView;
    VLISTRUN: TcxGridDBColumn;
    VLISTNAME: TcxGridDBColumn;
    cxGrLevel1: TcxGridLevel;
    Panel5: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    Panel1: TPanel;
    cxButton1: TcxButton;
    bTalons: TcxButton;
    aTalons: TAction;
    odsDoc: TOracleDataSet;
    rowDoc: TcxEditorRow;
    tvTalons: TcxGridDBTableView;
    grTalonsLevel1: TcxGridLevel;
    grTalons: TcxGrid;
    dxBarDockControl3: TdxBarDockControl;
    BMBar2: TdxBar;
    cxBarEditItem3: TcxBarEditItem;
    paBottom: TPanel;
    dxBarDockControl4: TdxBarDockControl;
    BMBar3: TdxBar;
    cxBarEditItem4: TcxBarEditItem;
    tvNaz: TcxGridDBTableView;
    grNazLevel1: TcxGridLevel;
    grNaz: TcxGrid;
    cxSplitter1: TcxSplitter;
    bbLoad: TdxBarButton;
    aLoad: TAction;
    dsListT: TDataSource;
    odsListT: TOracleDataSet;
    tvTalons_DateO: TcxGridDBColumn;
    tvTalons_DateC: TcxGridDBColumn;
    tvTalons_VidOpl: TcxGridDBColumn;
    tvTalons_Sotr: TcxGridDBColumn;
    tvTalons_Sos: TcxGridDBColumn;
    tvNaz_Date: TcxGridDBColumn;
    tvNaz_Name: TcxGridDBColumn;
    tvNaz_Sotr: TcxGridDBColumn;
    tvNaz_State: TcxGridDBColumn;
    dsListN: TDataSource;
    odsListN: TOracleDataSet;
    pmListT: TPopupMenu;
    pmListN: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    aTextT: TAction;
    aTextN: TAction;
    aWebT: TAction;
    aXMLT: TAction;
    aXLST: TAction;
    aWebN: TAction;
    aXMLN: TAction;
    aXLSN: TAction;
    aTextT1: TMenuItem;
    aWebT1: TMenuItem;
    aXMLT1: TMenuItem;
    aXLST1: TMenuItem;
    aTextN1: TMenuItem;
    aWebN1: TMenuItem;
    aXMLN1: TMenuItem;
    aWebN2: TMenuItem;
    tvTalons_Preview: TcxGridDBColumn;
    procedure odsInfoBeforeOpen(DataSet: TDataSet);
    procedure odsInfoAfterOpen(DataSet: TDataSet);
    procedure aCloseExecute(Sender: TObject);
    procedure odsListBeforeOpen(DataSet: TDataSet);
    procedure aProsmotrExecute(Sender: TObject);
    procedure odsListAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure TVLISTCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure frxRepProsmotrGetValue(const VarName: string; var Value: Variant);
    procedure aPrintExecute(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure frxRepListGetValue(const VarName: string; var Value: Variant);
    procedure N2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aRefreshExecute(Sender: TObject);
    procedure rowProjEditPropertiesEditValueChanged(Sender: TObject);
    procedure merFIOMKEditors0EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowSnilsEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowPhoneEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure rowLekEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure aCloseAExecute(Sender: TObject);
    procedure aAddAExecute(Sender: TObject);
    procedure aEditAExecute(Sender: TObject);
    procedure aDelAExecute(Sender: TObject);
    procedure aRefAExecute(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure odsListAAfterOpen(DataSet: TDataSet);
    procedure aTalonsExecute(Sender: TObject);
    procedure odsDocBeforeOpen(DataSet: TDataSet);
    procedure odsDocAfterOpen(DataSet: TDataSet);
    procedure aLoadExecute(Sender: TObject);
    procedure odsListTBeforeOpen(DataSet: TDataSet);
    procedure odsListNBeforeOpen(DataSet: TDataSet);
    procedure odsListTAfterScroll(DataSet: TDataSet);
    procedure aTextNExecute(Sender: TObject);
    procedure aWebNExecute(Sender: TObject);
    procedure aXMLNExecute(Sender: TObject);
    procedure aXLSNExecute(Sender: TObject);
    procedure aTextTExecute(Sender: TObject);
    procedure aWebTExecute(Sender: TObject);
    procedure aXMLTExecute(Sender: TObject);
    procedure aXLSTExecute(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    Russian : HKL;
    GET_SYSDATE_4REP : String;
    sSotrFIO_4rep, sTextIssl_4rep : String;
    pPACID : Integer;
    pPEPLID : Integer;
    { Private declarations }
  public
    isEdit : Boolean;
    procedure DoShowPacInfo(nPACID : Integer; nPEPLID: Integer; sVRACHFIO: String);
    { Public declarations }
  end;

var
  frmPacInfoKonsult: TfrmPacInfoKonsult;

implementation

uses fMain, fAddEditAllergy, uGlobal; 

{$R *.dfm}

{ TfrmPacInfo }

procedure TfrmPacInfoKonsult.DoShowPacInfo(nPACID: Integer; nPEPLID: Integer; sVRACHFIO: String);
var ods : TOracleDataSet;
begin
  pcAll.ActivePageIndex := 0;
  pPACID := nPACID;
  pPEPLID := nPEPLID;
  aProsmotr.Enabled := FALSE;
  aPrint.Enabled := False;
  rowKem.Properties.Value := sVRACHFIO;
  odsInfo.Open;
  odsList.Open;
  odsDoc.Open;

  rowProj.Properties.EditProperties.OnEditValueChanged := nil;
  if odsRegPrin.Active = FALSE
    then odsRegPrin.Open;

  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
//-- проживает
    ods.SQL.Text := ' SELECT * FROM ASU.TIB '+#13+
                    '  WHERE FK_PACID = :PFK_PACID '+#13+
                    '    AND (FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM asu.TSMID WHERE FC_SYNONIM = ''PD_MZ'')) '+#13+
                    '     OR FK_SMID = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO'')) ';
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
    ods.Open;
    rowProj.Properties.Value := ods.FieldByName('FK_SMID').AsInteger;
//-- адреса
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' BEGIN '+#13+
                    '   SELECT ASU.GET_ADDR_STR_BY_ID(ASU.PKG_REGIST_PACFUNC.GET_PAC_ADRID(:PFK_PACID)) INTO :RES FROM DUAL; '+#13+
                    '   IF :RES IS NULL THEN '+#13+
                    '     SELECT ''Адрес не указан!'' INTO :RES FROM DUAL; '+#13+
                    '   END IF; '+#13+
                    '   select asu.pkg_regist_pacfunc.get_pac_adrfull(:pfk_pacid, asu.get_registid) into :res1 from dual; '+#13+
                    ' END; ';
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
    ods.DeclareVariable('RES', otString);
    ods.DeclareVariable('RES1', otString);
    ods.Open;
    rowAddress.Properties.Value := ods.GetVariable('RES');
    rowAdrProj.Properties.Value := ods.GetVariable('RES1');
  finally
    ods.Free;
  end;
  rowProj.Properties.EditProperties.OnEditValueChanged := rowProjEditPropertiesEditValueChanged;

  TVLIST.StoreToRegistry('\SoftWare\SoftMaster\ListKonsult\fPacInfo\TVLISTVrach_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TVLIST');
  TVLIST.RestoreFromRegistry('\SoftWare\SoftMaster\ListKonsult\fPacInfo\TVLISTVrach_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVLIST');
  tvA.StoreToRegistry('\SoftWare\SoftMaster\ListKonsult\fPacInfo\tvAVrach_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'tvA');
  tvA.RestoreFromRegistry('\SoftWare\SoftMaster\ListKonsult\fPacInfo\tvAVrach_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'tvA');
end;

procedure TfrmPacInfoKonsult.odsInfoBeforeOpen(DataSet: TDataSet);
begin
  odsInfo.SetVariable('PFK_PACID', pPACID);
  odsInfo.SetVariable('PFK_PEPLID', pPEPLID);
end;

procedure TfrmPacInfoKonsult.odsDocAfterOpen(DataSet: TDataSet);
begin
  rowDoc.Properties.Value := odsDoc.FieldByName('docname').AsString+', '+
                             'Серия: '+odsDoc.FieldByName('fc_docser').AsString+' '+
                             'Номер: '+odsDoc.FieldByName('fc_docnum').AsString+' '+
                             'Выдан: '+odsDoc.FieldByName('fc_docvidan').AsString;
end;

procedure TfrmPacInfoKonsult.odsDocBeforeOpen(DataSet: TDataSet);
begin
  odsDoc.SetVariable('pfk_id', pPEPLID);
end;

procedure TfrmPacInfoKonsult.odsInfoAfterOpen(DataSet: TDataSet);
begin
  merFIOMK.Properties.Editors[0].Value := odsInfo.FieldByName('PACFIO').AsString;
  merFIOMK.Properties.Editors[1].Value := odsInfo.FieldByName('IB').AsString;
  merDateAgeSex.Properties.Editors[0].Value := odsInfo.FieldByName('FD_ROJD').AsString;
  merDateAgeSex.Properties.Editors[1].Value := odsInfo.FieldByName('PACAGE').AsString;
  merDateAgeSex.Properties.Editors[2].Value := odsInfo.FieldByName('SEX').AsString;
  rowWork.Properties.Value := odsInfo.FieldByName('WORKPLACE').AsString;
  rowPolis.Properties.Value := odsInfo.FieldByName('POLIS').AsString;
  rowLek.Properties.Value := odsInfo.FieldByName('fc_allergy').AsString;
  rowChar.Properties.Value := odsInfo.FieldByName('fc_action').AsString;
  if rowLek.Properties.Value <> '' then
    rowLek.Styles.Content := stYellow;
  if rowChar.Properties.Value <> '' then
    rowChar.Styles.Content := stYellow;
  rowPhone.Properties.Value := odsInfo.FieldByName('fc_phone').AsString;
  rowSnils.Properties.Value := odsInfo.FieldByName('fc_snils').AsString;
end;

procedure TfrmPacInfoKonsult.aAddAExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditAllergy, frmAddEditAllergy);
  try
    frmAddEditAllergy.Caption := 'Добавить';
    frmAddEditAllergy.strID := '';
    frmAddEditAllergy.ShowModal;
    if frmAddEditAllergy.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into asu.tallergy(fk_smid, fc_char, fc_charid, fd_date, fk_sotrid, fk_peplid) '+#13+
                         ' values(:pfk_smid, :pfc_char, :pfc_charid, sysdate, :pfk_sotrid, :pfk_peplid) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfk_smid', otInteger, frmAddEditAllergy.lcbLe.EditValue);
          oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
          oq.DeclareAndSet('pfc_char', otString, frmAddEditAllergy.peChar.Text);
          oq.DeclareAndSet('pfk_peplid', otInteger, pPEPLID);
          oq.DeclareAndSet('pfc_charid', otString, frmAddEditAllergy.strID);
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          frmMain.os.Commit;
          RefreshQuery(odsListA);
          odsListA.Locate('fk_id', oq.GetVariable('pfk_id'), []);
          isEdit := True;
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditAllergy.Free;
  end;
end;

procedure TfrmPacInfoKonsult.aCloseAExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  tvA.StoreToRegistry('\SoftWare\SoftMaster\ListKonsult\fPacInfo\tvAVrach_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'tvA');
  pcMain.ActivePageIndex := 0;
  if isEdit = True then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' select asu.get_allergy(:pfk_peplid, 1) as fc_allergy, asu.get_allergy(:pfk_peplid, 2) as fc_action from dual ';
        ods.DeclareAndSet('pfk_peplid', otInteger, pPEPLID);
        ods.Open;
        rowLek.Properties.Value := ods.FieldByName('fc_allergy').AsString;
        rowChar.Properties.Value := ods.FieldByName('fc_action').AsString;
        if rowLek.Properties.Value <> '' then
          rowLek.Styles.Content := stYellow
        else
          rowLek.Styles.Content := stNone;
        if rowChar.Properties.Value <> '' then
          rowChar.Styles.Content := stYellow
        else
          rowChar.Styles.Content := stNone;
      finally
        ods.Free;
      end;
    end;
end;

procedure TfrmPacInfoKonsult.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmPacInfoKonsult.aDelAExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Вы действительно хотите удалить запись?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tallergy where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsListA.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsListA);
        isEdit := True;
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmPacInfoKonsult.aEditAExecute(Sender: TObject);
var oq : TOracleQuery;
    id : Integer;
begin
  Application.CreateForm(TfrmAddEditAllergy, frmAddEditAllergy);
  try
    frmAddEditAllergy.Caption := 'Изменить';
    frmAddEditAllergy.lcbLe.EditValue := odsListA.FieldByName('fk_smid').AsInteger;
    frmAddEditAllergy.peChar.Text := odsListA.FieldByName('fc_char').AsString;
    frmAddEditAllergy.strID := odsListA.FieldByName('fc_charid').AsString;
    frmAddEditAllergy.ShowModal;
    if frmAddEditAllergy.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.tallergy '+#13+
                         '    set fk_smid = :pfk_smid, fc_char = :pfc_char, fc_charid = :pfc_charid, fd_date = sysdate, fk_sotrid = :pfk_sotrid '+#13+
                         '  where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfk_smid', otInteger, frmAddEditAllergy.lcbLe.EditValue);
          oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
          oq.DeclareAndSet('pfc_char', otString, frmAddEditAllergy.peChar.Text);
          oq.DeclareAndSet('pfc_charid', otString, frmAddEditAllergy.strID);
          oq.DeclareAndSet('pfk_id', otInteger, odsListA.FieldByName('fk_id').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
          id := odsListA.FieldByName('fk_id').AsInteger;
          RefreshQuery(odsListA);
          odsListA.Locate('fk_id', id, []);
          isEdit := True;
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditAllergy.Free;
  end;
end;

procedure TfrmPacInfoKonsult.aLoadExecute(Sender: TObject);
begin
  paBottom.Visible := True;
  cxSplitter1.Visible := True;
  odsListN.Close;
  odsListN.Open;
end;

procedure TfrmPacInfoKonsult.odsListBeforeOpen(DataSet: TDataSet);
begin
  odsList.SetVariable('PFK_PACID', pPEPLID);
  odsList.SetVariable('POTDELID', frmMain.pOTDELID);
end;

procedure TfrmPacInfoKonsult.odsListNBeforeOpen(DataSet: TDataSet);
begin
  odsListN.SetVariable('pfk_talonid', odsListT.FieldByName('fk_id').AsInteger);
end;

procedure TfrmPacInfoKonsult.odsListTAfterScroll(DataSet: TDataSet);
begin
  if paBottom.Visible = True then
    begin
      odsListN.Close;
      odsListN.Open;
    end;
end;

procedure TfrmPacInfoKonsult.odsListTBeforeOpen(DataSet: TDataSet);
begin
  odsListT.SetVariable('pfk_ambid', pPACID);
end;

procedure TfrmPacInfoKonsult.rowLekEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  pcMain.ActivePageIndex := 1;
  odsListA.Close;
  odsListA.SetVariable('pfk_peplid', pPEPLID);
  odsListA.Open;
end;

procedure TfrmPacInfoKonsult.rowPhoneEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := rowPhone.Properties.Value;
end;

procedure TfrmPacInfoKonsult.rowProjEditPropertiesEditValueChanged(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TIB '+#13+
                    '  USING DUAL ON (FK_PACID = :PFK_PACID ' +#13+
                    '                 AND (FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+#13+
                    '                                   WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM ASU.TSMID WHERE FC_SYNONIM = ''PD_MZ'')) '+#13+
                    '                 OR FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO''))) '+#13+
                    ' WHEN MATCHED THEN UPDATE SET FK_SMID = :pFK_SMID, FK_SMEDITID = (select fk_owner from asu.tsmid where fk_id = :pfk_smid) '+#13+
                    '                    WHERE FK_PACID = :PFK_PACID '+#13+
                    '                      AND (FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+#13+
                    '                                   WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM ASU.TSMID WHERE FC_SYNONIM = ''PD_MZ'')) '+#13+
                    '                                      OR FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO'')) '+#13+
                    ' WHEN NOT MATCHED THEN INSERT (FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13+
                    '                       VALUES(:pFK_PACID, :pFK_SMID, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pFK_VRACHID) ';
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
    ods.DeclareAndSet('pFK_SMID', otInteger, rowProj.Properties.Value);
    ods.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
    ods.Open;
    frmMain.os.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmPacInfoKonsult.rowSnilsEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := rowSnils.Properties.Value;
end;

procedure TfrmPacInfoKonsult.aPrintExecute(Sender: TObject);
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

procedure TfrmPacInfoKonsult.aProsmotrExecute(Sender: TObject);
var ods : TOracleDataSet;
    str : string;
    mem : TMemoryStream;
    str1 : TStringList;
begin
  if odsList.RecordCount <> 0 then
    begin
      mem := TMemoryStream.Create;
      str1 := TStringList.Create;
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT FK_ID, '+
                        '        ASU.DO_VRACHFIO(FK_ISPOLID) AS VRACHFIO, '+
                        '        (SELECT FB_TEXT FROM ASU.TRICHVIEWDATA WHERE FK_PACID = VNAZ.FK_ID) AS TEXTISSL, '+
                        '        (SELECT STAT.GET_RES_KONSULT_DIAGNAZ((SELECT FK_ID FROM ASU.VRES WHERE FK_NAZID = VNAZ.FK_ID)) FROM DUAL) AS DIAGNAZ '+
                        '   FROM ASU.VNAZ '+
                        '  WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        ods.Open;
        sSotrFIO_4rep := ods.FieldByName('VRACHFIO').AsString;
        sTextIssl_4rep := ods.FieldByName('TEXTISSL').AsString;
        str := ods.FieldByName('DIAGNAZ').AsString;
        frmMain.RvHtmlImporter1.LoadHtml(str);
        mem.Position := 0;
        frmMain.rve1.SaveTextToStream('',mem,0,False,True);
        mem.Position := 0;
        str1.LoadFromStream(mem);
        mem.Clear;
        frmMain.rve1.Clear;
        frmMain.rve1.Reformat;
        sTextIssl_4Rep := sTextIssl_4Rep + #13#10 + str1.Text;
        str1.Clear;
      finally
        ods.Free;
        mem.Free;
        str1.Free;
      end;
      frxRepProsmotr.ShowReport;
    end;
end;

procedure TfrmPacInfoKonsult.aRefAExecute(Sender: TObject);
begin
  RefreshQuery(odsListA); 
end;

procedure TfrmPacInfoKonsult.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(odsList);
end;

procedure TfrmPacInfoKonsult.aTalonsExecute(Sender: TObject);
begin
  if aTalons.Caption = 'Талоны' then
    begin
      aTalons.Caption := 'Пациент';
      pcAll.ActivePageIndex := 1;
      if odsListT.Active = False then
        odsListT.Active := True;
      tvTalons.StoreToRegistry('\SoftWare\SoftMaster\ListKonsult\fPacInfo\tvTalonsVrach_' + IntToStr(frmMain.pSOTRID)+'Default', True, [], 'tvTalons');
      tvTalons.RestoreFromRegistry('\SoftWare\SoftMaster\ListKonsult\fPacInfo\tvTalonsVrach_' + IntToStr(frmMain.pSOTRID), False, False, [], 'tvTalons');
      tvNaz.StoreToRegistry('\SoftWare\SoftMaster\ListKonsult\fPacInfo\tvNazVrach_' + IntToStr(frmMain.pSOTRID)+'Default', True, [], 'tvNaz');
      tvNaz.RestoreFromRegistry('\SoftWare\SoftMaster\ListKonsult\fPacInfo\tvNazVrach_' + IntToStr(frmMain.pSOTRID), False, False, [], 'tvNaz');
    end else
    begin
      aTalons.Caption := 'Талоны';
      pcAll.ActivePageIndex := 0;
      tvTalons.StoreToRegistry('\SoftWare\SoftMaster\ListKonsult\fPacInfo\tvTalonsVrach_' + IntToStr(frmMain.pSOTRID), True, [], 'tvTalons');
      tvNaz.StoreToRegistry('\SoftWare\SoftMaster\ListKonsult\fPacInfo\tvNazVrach_' + IntToStr(frmMain.pSOTRID), True, [], 'tvNaz');
    end;
end;

procedure TfrmPacInfoKonsult.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, True, False)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, True, True);
end;

procedure TfrmPacInfoKonsult.aTextNExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if tvNaz.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, grNaz, True, False)
    else
      ExportGridToText(sdPopUp.FileName, grNaz, True, True);
end;

procedure TfrmPacInfoKonsult.aTextTExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if tvTalons.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, grTalons, True, False)
    else
      ExportGridToText(sdPopUp.FileName, grTalons, True, True);
end;

procedure TfrmPacInfoKonsult.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, True, False)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, True, True);
end;

procedure TfrmPacInfoKonsult.aWebNExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if tvNaz.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, grNaz, True, False)
    else
      ExportGridToHTML(sdPopUp.FileName, grNaz, True, True);
end;

procedure TfrmPacInfoKonsult.aWebTExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if tvTalons.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, grTalons, True, False)
    else
      ExportGridToHTML(sdPopUp.FileName, grTalons, True, True);
end;

procedure TfrmPacInfoKonsult.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, True, False)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, True, True);
end;

procedure TfrmPacInfoKonsult.aXLSNExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if tvNaz.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, grNaz, True, False)
    else
      ExportGridToExcel(sdPopUp.FileName, grNaz, True, True);
end;

procedure TfrmPacInfoKonsult.aXLSTExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if tvTalons.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, grTalons, True, False)
    else
      ExportGridToExcel(sdPopUp.FileName, grTalons, True, True);
end;

procedure TfrmPacInfoKonsult.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, True, False)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, True, True);
end;

procedure TfrmPacInfoKonsult.aXMLNExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if tvNaz.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, grNaz, True, False)
    else
      ExportGridToXML(sdPopUp.FileName, grNaz, True, True);
end;

procedure TfrmPacInfoKonsult.aXMLTExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if tvTalons.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, grTalons, True, False)
    else
      ExportGridToXML(sdPopUp.FileName, grTalons, True, True);
end;

procedure TfrmPacInfoKonsult.TVLISTCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aProsmotrExecute(nil);
end;

procedure TfrmPacInfoKonsult.odsListAAfterOpen(DataSet: TDataSet);
begin
  aEditA.Enabled := odsListA.RecordCount <> 0;
  aDelA.Enabled := odsListA.RecordCount <> 0;
end;

procedure TfrmPacInfoKonsult.odsListAfterOpen(DataSet: TDataSet);
begin
  if odsList.RecordCount = 0 then
    begin
      aProsmotr.Enabled := False;
      aPrint.Enabled := False;
    end else
    begin
      aProsmotr.Enabled := True;
      aPrint.Enabled := True;
    end;
end;

procedure TfrmPacInfoKonsult.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TVLIST.StoreToRegistry('\SoftWare\SoftMaster\ListKonsult\fPacInfo\TVLISTVrach_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVLIST');
  if pcAll.ActivePageIndex = 1 then
    begin
      tvTalons.StoreToRegistry('\SoftWare\SoftMaster\ListKonsult\fPacInfo\tvTalonsVrach_' + IntToStr(frmMain.pSOTRID), True, [], 'tvTalons');
      tvNaz.StoreToRegistry('\SoftWare\SoftMaster\ListKonsult\fPacInfo\tvNazVrach_' + IntToStr(frmMain.pSOTRID), True, [], 'tvNaz');
    end;
end;

procedure TfrmPacInfoKonsult.FormCreate(Sender: TObject);
begin
  pcMain.ActivePageIndex := 0;
  isEdit := False;
  aTalons.Visible := (DO_CHECK_OBJECT_ACCESS(frmMain.os, frmMain.pAPPSOTRID, aTalons.Owner.Name + '.' + aTalons.Name) > 0);  
end;

procedure TfrmPacInfoKonsult.FormShow(Sender: TObject);
begin
  cxGr.SetFocus;
end;

procedure TfrmPacInfoKonsult.frxRepListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'SYSDATE' then Value := GET_SYSDATE_4REP;
  if VarName = 'FIOPAC' then Value := merFIOMK.Properties.Editors[0].Value;
  if VarName = 'DOZA' then Value := TVLIST.DataController.Summary.FooterSummaryValues[0];
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
end;

procedure TfrmPacInfoKonsult.frxRepProsmotrGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'FIOPAC' then Value := merFIOMK.Properties.Editors[0].Value;
  if VarName = 'DATE_ROJD' then Value := merDateAgeSex.Properties.Editors[0].Value;
  if VarName = 'NUMIB' then Value := merFIOMK.Properties.Editors[1].Value;
  if VarName = 'NAMEISSL' then Value := odsList.FieldByName('FC_NAME').AsString;
  if VarName = 'DATEISSL' then Value := odsList.FieldByName('FD_RUN').AsString;
  if VarName = 'TEXTISSL' then Value := sTextIssl_4rep;
  if VarName = 'SOTR' then Value := sSotrFIO_4rep;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
end;

procedure TfrmPacInfoKonsult.merFIOMKEditors0EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := merFIOMK.Properties.Editors[0].Value;
end;

procedure TfrmPacInfoKonsult.N2Click(Sender: TObject);
begin
  TVLIST.RestoreFromRegistry('\SoftWare\SoftMaster\ListKonsult\fPacInfo\TVLISTVrach_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmPacInfoKonsult.N3Click(Sender: TObject);
begin
  tvA.RestoreFromRegistry('\SoftWare\SoftMaster\ListKonsult\fPacInfo\tvAVrach_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'tvA');
end;

procedure TfrmPacInfoKonsult.N5Click(Sender: TObject);
begin
  tvTalons.RestoreFromRegistry('\SoftWare\SoftMaster\ListKonsult\fPacInfo\tvTalonsVrach_' + IntToStr(frmMain.pSOTRID)+'Default', False, False, [], 'tvTalons');
end;

procedure TfrmPacInfoKonsult.N7Click(Sender: TObject);
begin
  tvNaz.RestoreFromRegistry('\SoftWare\SoftMaster\ListKonsult\fPacInfo\tvNazVrach_' + IntToStr(frmMain.pSOTRID)+'Default', False, False, [], 'tvNaz');
end;

end.
