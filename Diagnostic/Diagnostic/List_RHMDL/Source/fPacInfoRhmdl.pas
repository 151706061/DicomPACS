unit fPacInfoRhmdl;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, DB,
  OracleData, Oracle, cxLabel, dxBar, ActnList, ImgList, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, jvDBUtils, Registry, jpeg, word2000,
  DBCtrls, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  StdCtrls, cxMemo, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  dxSkinsdxBarPainter, frxClass, Menus, cxLookAndFeelPainters, cxButtons, cxGridExportLink,
  frxDBSet, ClipBrd, cxCheckBox, cxBarEditItem, cxCalendar, cxButtonEdit,
  cxVGrid, cxInplaceContainer, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmPacInfoRhmdl = class(TForm)
    odsInfo: TOracleDataSet;
    al: TActionList;
    il: TImageList;
    aClose: TAction;
    paList: TPanel;
    TVLIST: TcxGridDBTableView;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    VLISTRUN: TcxGridDBColumn;
    VLISTNAME: TcxGridDBColumn;
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
    dxBarDockControl1: TdxBarDockControl;
    cxBarEditItem1: TcxBarEditItem;
    verGr: TcxVerticalGrid;
    rowPacient: TcxCategoryRow;
    merFIOMK: TcxMultiEditorRow;
    merDateAgeSex: TcxMultiEditorRow;
    rowAddress: TcxEditorRow;
    rowWork: TcxEditorRow;
    rowPolis: TcxEditorRow;
    rowProj: TcxEditorRow;
    rowAdmin: TcxCategoryRow;
    rowPeplID: TcxEditorRow;
    rowPacID: TcxEditorRow;
    cxButton1: TcxButton;
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
    procedure FormCreate(Sender: TObject);
    procedure rowProjEditPropertiesEditValueChanged(Sender: TObject);
    procedure merFIOMKEditors0EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowPeplIDEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowPacIDEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    GET_SYSDATE_4REP : String;
    sSotrFIO_4rep, sTextIssl_4rep, sDateSys4Rep : String;
    Russian : HKL;
    { Private declarations }
  public
    pPACID : Integer;
    pPEPLID : Integer;
    procedure DoShowPacInfo(nPACID : Integer; nPEPLID: Integer);
    { Public declarations }
  end;

var
  frmPacInfoRhmdl: TfrmPacInfoRhmdl;

implementation

uses fMain; 

{$R *.dfm}

{ TfrmPacInfo }

procedure TfrmPacInfoRhmdl.DoShowPacInfo(nPACID: Integer; nPEPLID: Integer);
var ods : TOracleDataSet;
begin
  pPACID := nPACID;
  pPEPLID := nPEPLID;
  aProsmotr.Enabled := FALSE;
  aPrint.Enabled := False;
  odsInfo.Open;
  odsList.Open;
//------------------------------------------------------------------------------
  rowProj.Properties.EditProperties.OnEditValueChanged := nil;
  if odsRegPrin.Active = FALSE
    then odsRegPrin.Open;

  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT * FROM asu.TIB '+#13+
                    '  WHERE FK_PACID = :PFK_PACID '+#13+
                    '    AND (FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM asu.TSMID WHERE FC_SYNONIM = ''PD_MZ'')) '+#13+
                    '     OR FK_SMID = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO'')) ';
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
    ods.Open;
    rowProj.Properties.Value := ods.FieldByName('FK_SMID').AsInteger;
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' BEGIN '+
                    '     SELECT asu.PKG_REGIST_PACFUNC.GET_PAC_ADRFULL(:PFK_PACID) INTO :RES FROM DUAL; '+#13+
                    '     IF :RES IS NULL THEN '+#13+
                    '       SELECT ''Адрес не указан!'' INTO :RES FROM DUAL; '+#13+
                    '     END IF; '+#13+
                    ' END; ';
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID); //++kladr
    ods.DeclareVariable('RES', otString);
    ods.Open;

    rowAddress.Properties.Value := ods.GetVariable('RES');
  finally
    ods.Free;
  end;
  rowProj.Properties.EditProperties.OnEditValueChanged := rowProjEditPropertiesEditValueChanged;

  TVLIST.StoreToRegistry('\SoftWare\SoftMaster\List_RHMDL\fPacInfo\TVLISTVrach_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TVLIST');
  TVLIST.RestoreFromRegistry('\SoftWare\SoftMaster\List_RHMDL\fPacInfo\TVLISTVrach_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVLIST');
end;

procedure TfrmPacInfoRhmdl.odsInfoBeforeOpen(DataSet: TDataSet);
begin
  odsInfo.SetVariable('PFK_PACID', pPACID);
end;

procedure TfrmPacInfoRhmdl.odsInfoAfterOpen(DataSet: TDataSet);
begin
  merFIOMK.Properties.Editors[0].Value := odsInfo.FieldByName('PACFIO').AsString;
  merFIOMK.Properties.Editors[1].Value := odsInfo.FieldByName('IB').AsString;
  merDateAgeSex.Properties.Editors[0].Value := odsInfo.FieldByName('FD_ROJD').AsString;
  merDateAgeSex.Properties.Editors[1].Value := odsInfo.FieldByName('PACAGE').AsString;
  merDateAgeSex.Properties.Editors[2].Value := odsInfo.FieldByName('SEX').AsString;
  rowWork.Properties.Value := odsInfo.FieldByName('WORKPLACE').AsString;
  rowPolis.Properties.Value := odsInfo.FieldByName('POLIS').AsString;
  rowPacID.Properties.Value := IntToStr(pPACID);
  rowPeplID.Properties.Value := IntToStr(pPEPLID);
end;

procedure TfrmPacInfoRhmdl.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmPacInfoRhmdl.odsListBeforeOpen(DataSet: TDataSet);
begin
  odsList.SetVariable('PFK_PACID', pPEPLID);
end;

procedure TfrmPacInfoRhmdl.rowPacIDEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := rowPacID.Properties.Value;
end;

procedure TfrmPacInfoRhmdl.rowPeplIDEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := rowPeplID.Properties.Value;
end;

procedure TfrmPacInfoRhmdl.rowProjEditPropertiesEditValueChanged(Sender: TObject);
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

procedure TfrmPacInfoRhmdl.aPrintExecute(Sender: TObject);
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

procedure TfrmPacInfoRhmdl.aProsmotrExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  if odsList.RecordCount <> 0 then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;    
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT FK_ID, to_char(sysdate, ''dd.mm.yyyy hh24:mi'') as datesys, '+#13+
                        '        ASU.DO_VRACHFIO(FK_ISPOLID) AS VRACHFIO, '+#13+
                        '        (SELECT FB_TEXT FROM ASU.TRICHVIEWDATA WHERE FK_PACID = TNAZIS.FK_ID) AS TEXTISSL '+#13+
                        '   FROM ASU.TNAZIS '+#13+
                        '  WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        ods.Open;
        sSotrFIO_4rep := ods.FieldByName('VRACHFIO').AsString;
        sTextIssl_4rep := ods.FieldByName('TEXTISSL').AsString;
        sDateSys4Rep := ods.FieldByName('DATESYS').AsString;
        if frmMain.get_digsig = '1' then
          begin
            ods.Close;
            ods.DeleteVariables;
            ods.SQL.Text := ' SELECT COUNT(*) AS CNT FROM ASU.TPODPIS_RICHVIEWDATA P, ASU.TRICHVIEWDATA D '+#13+
                            '  WHERE P.FK_RICHVIEWDATA = D.FK_ID '+#13+
                            '    AND D.FK_PACID = :PFK_PACID ';
            ods.DeclareAndSet('PFK_PACID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
            ods.Open;
            if ods.FieldByName('CNT').AsInteger > 0 then
              frmMain.is_digsig := True
            else
              frmMain.is_digsig := False;
          end;
      finally
        ods.Free;
      end;
      frxRepProsmotr.ShowReport;
    end;
end;

procedure TfrmPacInfoRhmdl.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(odsList);
end;

procedure TfrmPacInfoRhmdl.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmPacInfoRhmdl.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmPacInfoRhmdl.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmPacInfoRhmdl.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmPacInfoRhmdl.TVLISTCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aProsmotrExecute(nil);
end;

procedure TfrmPacInfoRhmdl.odsListAfterOpen(DataSet: TDataSet);
begin
  if odsList.RecordCount = 0 then
    begin
      aProsmotr.Enabled := FALSE;
      aPrint.Enabled := False;
    end else
    begin
      aProsmotr.Enabled := TRUE;
      aPrint.Enabled := True;
    end;
end;

procedure TfrmPacInfoRhmdl.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TVLIST.StoreToRegistry('\SoftWare\SoftMaster\List_RHMDL\fPacInfo\TVLISTVrach_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVLIST');
end;

procedure TfrmPacInfoRhmdl.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);
end;

procedure TfrmPacInfoRhmdl.FormShow(Sender: TObject);
begin
  cxGr.SetFocus;
end;

procedure TfrmPacInfoRhmdl.frxRepListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'SYSDATE' then Value := GET_SYSDATE_4REP;
  if VarName = 'FIOPAC' then Value := merFIOMK.Properties.Editors[0].Value;
  if VarName = 'DOZA' then Value := TVLIST.DataController.Summary.FooterSummaryValues[0];
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;

end;

procedure TfrmPacInfoRhmdl.frxRepProsmotrGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'NAMEISSL' then Value := odsList.FieldByName('FC_NAME').AsString;
  if VarName = 'DATEISSL' then Value := odsList.FieldByName('FD_RUN').AsString;
  if VarName = 'TEXTISSL' then Value := sTextIssl_4rep;
  if frmMain.is_digsig = True then
    begin
      if VarName = 'SOTR' then Value := 'ЭЦП '+sSotrFIO_4rep
    end else
    begin
      if VarName = 'SOTR' then Value := sSotrFIO_4rep;
    end;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
  if VarName = 'DATEPRINT' then Value := sDateSys4Rep;
end;

procedure TfrmPacInfoRhmdl.merFIOMKEditors0EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := merFIOMK.Properties.Editors[0].Value;
end;

procedure TfrmPacInfoRhmdl.N2Click(Sender: TObject);
begin
  TVLIST.RestoreFromRegistry('\SoftWare\SoftMaster\List_RHMDL\fPacInfo\TVLISTVrach_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TVLIST');
end;

end.
