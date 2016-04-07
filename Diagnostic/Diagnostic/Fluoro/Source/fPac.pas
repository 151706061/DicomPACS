unit fPac;
// +++ Сделать просмотр по F7, также на KeyUP грида повесить enter
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, dxBar, ExtCtrls,
  ActnList, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, OracleData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, frxClass, frxDBSet, Oracle, Menus, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel, JvDBUtils, Clipbrd,
  dxSkinBlack, dxSkinCaramel, dxSkinCoffee, dxSkinLondonLiquidSky, cxButtonEdit,
  cxDBLookupComboBox, cxVGrid, cxInplaceContainer, dxSkinBlue, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmPac = class(TForm)
    BM: TdxBarManager;
    bbClose: TdxBarButton;
		actlstPac: TActionList;
    actClose: TAction;
    cxGrid1: TcxGrid;
    TVLIST: TcxGridDBTableView;
    VLISTRUN: TcxGridDBColumn;
    VLISTNAME: TcxGridDBColumn;
    VDOZA: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    bbProsmotr: TdxBarButton;
    bbPrint: TdxBarButton;
    actProsmotr: TAction;
    actPrint: TAction;
    frxDBPrintList: TfrxDBDataset;
    pmGrid: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    C1: TMenuItem;
    frxRepProsmotr: TfrxReport;
    frxPrintList: TfrxReport;
    Panel4: TPanel;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    Panel2: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    bbRefresh: TdxBarButton;
    aRefresh: TAction;
    dxBarButton1: TdxBarButton;
    aNaprav: TAction;
    frxFlu: TfrxReport;
    odsListNaz: TOracleDataSet;
    odsListNazROWNUM: TFloatField;
    odsListNazFK_DOCID: TFloatField;
    odsListNazFK_NAZSOSID: TFloatField;
    odsListNazFC_TYPE: TStringField;
    odsListNazFK_ID: TFloatField;
    odsListNazFC_NAME: TStringField;
    odsListNazFK_SMID: TFloatField;
    odsListNazFK_VRACHID: TFloatField;
    odsListNazDOZA: TFloatField;
    odsListNazKOLVO: TFloatField;
    odsListNazKOLVOPRSV: TFloatField;
    frxNaprav: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    odsListNazTIME: TFloatField;
    odsListNazVID_SNIMOK: TStringField;
    odsListNazTYPEPLENKA: TStringField;
    odsListNazKOLVOLISTOV: TStringField;
    verGr: TcxVerticalGrid;
    rowPacient: TcxCategoryRow;
    merFIOMK: TcxMultiEditorRow;
    merDateAgeSex: TcxMultiEditorRow;
    rowAddress: TcxEditorRow;
    rowAdrPreb: TcxEditorRow;
    rowGra: TcxEditorRow;
    rowWork: TcxEditorRow;
    rowAdmin: TcxCategoryRow;
    rowPeplID: TcxEditorRow;
    cxButton1: TcxButton;
    odsInfo: TOracleDataSet;
    procedure actCloseExecute(Sender: TObject);
    procedure odsListBeforeOpen(DataSet: TDataSet);
    procedure actProsmotrExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure frxPrintListGetValue(const VarName: String;
      var Value: Variant);
    procedure frxRepProsmotrGetValue(const VarName: String;
      var Value: Variant);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure C1Click(Sender: TObject);
    procedure odsListAfterOpen(DataSet: TDataSet);
    procedure aRefreshExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TVLISTCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TVLISTKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure aNapravExecute(Sender: TObject);
    procedure frxFluGetValue(const VarName: string; var Value: Variant);
    procedure frxNapravGetValue(const VarName: string; var Value: Variant);
    procedure odsInfoBeforeOpen(DataSet: TDataSet);
    procedure merFIOMKEditors0EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowPeplIDEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    pPEPLID : Integer;
    Russian : HKL;
    nAge_4rep : Integer;
    sSex_4rep : string;
    sAddress_4rep : string;
    sPhone_4rep : string;
    sKabName_4rep : string;
    sKabPhone_4rep : string;
    sLabName_4rep : string;
    sKoren_4rep : string;
    sOpl_4rep : string;
    sTarget_4rep : string;
    sPriem_4rep : string;
    sApparat_4rep : string;
    sProjivaet_4rep : string;
    sVrach_4rep : string;
    sNadbavka_4rep : string;
    sUrgent_4rep : string;
    sDS_4rep : string;
    sKem_4rep : string;
    sTypeKontrast_4rep : string;
    sKolvoKontrast_4rep : Integer;
    sVvod_4rep : string;
    sVvel_4rep : string;
    sDisc_4rep : string;
    sKorob_4rep : string;
    sCifra_4rep : string;
    sTelefon_4rep : string;
    sKolvoKomy_4rep : string;
    sRemark_4rep : string;
    sOtdel_4rep : string;
    dDateVydano_4rep, dDateVozvrat_4rep : TDateTime;
    procedure DoProjivaet;
    { Private declarations }
  public
    GET_SYSDATE_4REP : String;
    sSotrFIO_4rep, sTextIssl_4rep, sNumIssl_4rep, sDateSys4Rep : String;
    procedure DoShowFormPac(nPEPLID : Integer; sFIO : String);
    { Public declarations }
  end;

var
  frmPac: TfrmPac;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmPac.actCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmPac.DoProjivaet;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' DECLARE '+
                    '   nSMID NUMBER; '+
                    ' BEGIN '+
                    ' SELECT '+
                    ' DECODE((SELECT ASU.GET_SMIDNAME(MAX(FK_SMID)) FROM TIB '+
                    '          WHERE FK_PACID = :PFK_PACID '+
                    '            AND (FK_SMID IN (SELECT FK_ID '+
                    '                               FROM TSMID '+
                    '                              WHERE FK_OWNER = (SELECT MAX(FK_ID) '+
                    '                                                  FROM TSMID '+
                    '                                                 WHERE FC_SYNONIM = ''PD_MZ'')) '+
                    '                                 OR FK_SMID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO''))), '+
                    '        NULL, '+
                    '        (SELECT ASU.GET_SMIDNAME(MAX(FK_SMID)) FROM TIB '+
                    '          WHERE FK_PACID = :PFK_PEPLID '+
                    '            AND (FK_SMID IN (SELECT FK_ID '+
                    '                               FROM TSMID '+
                    '                              WHERE FK_OWNER = (SELECT MAX(FK_ID) '+
                    '                                                  FROM TSMID '+
                    '                                                 WHERE FC_SYNONIM = ''PD_MZ'')) '+
                    '                                 OR FK_SMID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO''))), '+
                    '        (SELECT ASU.GET_SMIDNAME(MAX(FK_SMID)) FROM TIB '+
										'          WHERE FK_PACID = :PFK_PACID '+
                    '            AND (FK_SMID IN (SELECT FK_ID '+
                    '                               FROM TSMID '+
                    '                              WHERE FK_OWNER = (SELECT MAX(FK_ID) '+
                    '                                                  FROM TSMID '+
                    '                                                 WHERE FC_SYNONIM = ''PD_MZ'')) '+
                    '                                 OR FK_SMID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO'')))) INTO :VAL '+
                    ' FROM DUAL; '+
                    ' IF :VAL IS NULL THEN '+
										'   SELECT ASU.GET_SMIDNAME(MAX(FK_ID)) INTO :VAL FROM TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''PD_MZ'') AND FK_DEFAULT = 1; '+
                    ' END IF; '+
                    ' END; ';
    ods.DeclareAndSet('PFK_PACID', otInteger, odsList.FieldByName('FK_PACID').AsInteger);
    ods.DeclareAndSet('PFK_PEPLID', otInteger, odsList.FieldByName('PEPLID').AsInteger);
    ods.DeclareVariable('VAL', otString);
    ods.Open;
    sProjivaet_4rep := ods.GetVariable('VAL');
  finally
    ods.Free;
  end;
end;

procedure TfrmPac.DoShowFormPac(nPEPLID : Integer; sFIO : String);
var ods : TOracleDataSet;
begin
  merFIOMK.Properties.Editors[0].Value := sFIO;
  pPEPLID := nPEPLID;
  rowPeplID.Properties.Value := pPEPLID;
  if odsList.Active = False then
    odsList.Open;
//-- загружаем данные
  odsInfo.Close;
  odsInfo.Open;
  merDateAgeSex.Properties.Editors[0].Value := odsInfo.FieldByName('FD_ROJD').AsString;
  merDateAgeSex.Properties.Editors[1].Value := odsInfo.FieldByName('PACAGE').AsString;
  merDateAgeSex.Properties.Editors[2].Value := odsInfo.FieldByName('SEX').AsString;
  rowWork.Properties.Value := odsInfo.FieldByName('workplace').AsString;
  rowGra.Properties.Value := odsInfo.FieldByName('gra').AsString;

  ods := TOracleDataSet.Create(nil); //-- Адреса
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' BEGIN '+#13+
                    '     SELECT ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_ADRFULL(:PFK_PeplID) INTO :RES FROM DUAL; '+#13+
                    '     IF :RES IS NULL THEN '+#13+
                    '       SELECT ''Адрес не указан!'' INTO :RES FROM DUAL; '+#13+
                    '     END IF; '+#13+
                    '     select asu.pkg_regist_peplfunc.get_pepl_adrfull(:pfk_peplid, asu.get_registid) into :res1 from dual; '+#13+
                    ' END; ';
    ods.DeclareAndSet('pfk_peplid', otInteger, pPEPLID);
    ods.DeclareVariable('RES', otString);
    ods.DeclareVariable('res1', otString);
    ods.Open;
    rowAddress.Properties.Value := ods.GetVariable('RES');
    rowAdrPreb.Properties.Value := ods.GetVariable('RES1');
  finally
    ods.Free;
  end;

  TVLIST.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TVLISTPACVrach_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TVLISTPAC');
  TVLIST.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TVLISTPACVrach_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVLISTPAC');
end;

procedure TfrmPac.odsListBeforeOpen(DataSet: TDataSet);
begin
  odsList.SetVariable('PFK_PACID', pPEPLID);
end;

procedure TfrmPac.rowPeplIDEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  ActivateKeyboardLayout(Russian, KLF_REORDER);
  Clipboard.AsText := rowPeplID.Properties.Value;
end;

procedure TfrmPac.TVLISTCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if odsList.RecordCount > 0 then
    actProsmotrExecute(nil);
end;

procedure TfrmPac.TVLISTKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if odsList.RecordCount > 0 then
    begin
      if Key = VK_RETURN then
        actProsmotrExecute(nil);
    end;
end;

procedure TfrmPac.actProsmotrExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select fk_id, '+#13+
                    '        asu.do_vrachfio(fk_ispolid) as VrachFIO, '+#13+
                    '        (select fb_text from asu.trichviewdata where fk_pacid = tnazis.fk_id) as textissl, '+#13+
                    '        to_char(sysdate, ''dd.mm.yyyy hh24:mi'') as datesys '+#13+
                    '   from asu.tnazis '+#13+
                    '  where fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
    ods.Open;
    sSotrFIO_4rep := ods.FieldByName('VrachFIO').AsString;
    sTextIssl_4rep := ods.FieldByName('textissl').AsString;
    sDateSys4Rep := ods.FieldByName('datesys').AsString;
  finally
    ods.Free;
  end;
  frxRepProsmotr.ShowReport;
end;

procedure TfrmPac.aNapravExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  if odsList.FieldByName('OWNER').AsInteger = frmMain.GET_ISSL_FLU then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT to_char(sysdate, ''dd.mm.yyyy hh24:mi'') as datesys, '+#13+
                        '        ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TNAZIS.FK_PACID) AS PACAGE, '+#13+
                        '        ASU.PKG_REGIST_PACFUNC.GET_PAC_SEX(TNAZIS.FK_PACID) AS SEX, '+#13+
                        '        ASU.GET_ADDR_STR_BY_ID(ASU.PKG_REGIST_PACFUNC.GET_PAC_ADRID(TNAZIS.FK_PACID)) AS ADDRESS, '+#13+
                        '        (SELECT FC_CHAR '+#13+
                        '           FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID '+#13+
                        '                          AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''KONTAKT_PHONE'')) AS PHONE, '+#13+
                        '        (SELECT FC_NAME FROM ASU.TKABINET WHERE FK_ID = TNAZIS.FK_ROOMID) AS KABNAME, '+#13+
                        '        (SELECT FC_PHONE FROM ASU.TKABINET WHERE FK_ID = TNAZIS.FK_ROOMID) AS KABPHONE, '+#13+
                        '        (SELECT ASU.DO_VRACHFIO(FN_NUM) '+#13+
                        '           FROM ASU.TIB '+#13+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+#13+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''RG_LABORANT'')) AS LAB, '+#13+
                        '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+#13+
                        '           FROM ASU.TIB '+#13+
                        '          WHERE FK_PACID = ASU.GET_PEPLID(TNAZIS.FK_PACID) '+#13+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''KOREN_NASEL''))) AS KOREN, '+#13+
                        '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+#13+
                        '           FROM ASU.TIB '+#13+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+#13+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''AMBTALON_OPL''))) AS OPL, '+#13+
                        '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+#13+
                        '           FROM ASU.TIB '+#13+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+#13+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''ISSL_TARGET''))) AS TARGET, '+#13+
                        '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+#13+
                        '           FROM ASU.TIB '+#13+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+#13+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_PRIEM''))) AS PRIEM, '+#13+
                        '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+#13+
                        '           FROM ASU.TIB '+#13+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+#13+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_APPARAT''))) AS APPARAT '+#13+
                        '   FROM ASU.TNAZIS '+#13+
                        '  WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        ods.Open;
        nAge_4rep := ods.FieldByName('PACAGE').AsInteger;
        sSex_4rep := ods.FieldByName('SEX').AsString;
        sAddress_4rep := ods.FieldByName('ADDRESS').AsString;
        sPhone_4rep := ods.FieldByName('PHONE').AsString;
        sKabName_4rep := ods.FieldByName('KABNAME').AsString;
        sKabPhone_4rep := ods.FieldByName('KABPHONE').AsString;
        sLabName_4rep := ods.FieldByName('LAB').AsString;
        sKoren_4rep := ods.FieldByName('KOREN').AsString;
        sOpl_4rep := ods.FieldByName('OPL').AsString;
        sTarget_4rep := ods.FieldByName('TARGET').AsString;
        sPriem_4rep := ods.FieldByName('PRIEM').AsString;
        sApparat_4rep := ods.FieldByName('APPARAT').AsString;
        sDateSys4Rep := ods.FieldByName('datesys').AsString;
        DoProjivaet;
        frxFlu.ShowReport;
      finally
        ods.Free;
      end;
    end else
    begin
      odsListNaz.Close;
      odsListNaz.SetVariable('PFC_TYPE', odsList.FieldByName('FC_TYPE').AsString);
      odsListNaz.Open;
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT to_char(sysdate, ''dd.mm.yyyy hh24:mi'') as datesys, '+#13+
                        '        ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TNAZIS.FK_PACID) AS PACAGE, '+#13+
                        '        ASU.PKG_REGIST_PACFUNC.GET_PAC_SEX(TNAZIS.FK_PACID) AS SEX, '+#13+
                        '        ASU.GET_ADDR_STR_BY_ID(ASU.PKG_REGIST_PACFUNC.GET_PAC_ADRID(TNAZIS.FK_PACID)) AS ADDRESS, '+#13+
                        '        (SELECT FC_CHAR '+#13+
                        '           FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID '+#13+
                        '                          AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''KONTAKT_PHONE'')) AS PHONE, '+#13+
                        '        (SELECT FC_NAME FROM ASU.TKABINET WHERE FK_ID = TNAZIS.FK_ROOMID) AS KABNAME, '+#13+
                        '        (SELECT FC_PHONE FROM ASU.TKABINET WHERE FK_ID = TNAZIS.FK_ROOMID) AS KABPHONE, '+#13+
                        '        (SELECT ASU.DO_VRACHFIO(FN_NUM) '+#13+
                        '           FROM ASU.TIB '+#13+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+#13+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''RG_LABORANT'')) AS LAB, '+#13+
                        '        (SELECT MAX(FC_CHAR) '+#13+
                        '           FROM ASU.TIB '+#13+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+#13+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''VRACH_NAPRAVIL'')) AS VRACH, '+#13+
                        '        (SELECT MAX(FC_CHAR) '+#13+
                        '           FROM ASU.TIB '+#13+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+#13+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_DIAGNOZ'')) AS DS, '+#13+
                        '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+#13+
                        '           FROM ASU.TIB '+#13+
                        '          WHERE FK_PACID = ASU.GET_PEPLID(TNAZIS.FK_PACID) '+#13+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''KOREN_NASEL''))) AS KOREN, '+#13+
                        '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+#13+
                        '           FROM ASU.TIB '+#13+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+#13+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''AMBTALON_OPL''))) AS OPL, '+#13+
                        '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+#13+
                        '           FROM ASU.TIB '+#13+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+#13+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''ISSL_TARGET''))) AS TARGET, '+#13+
                        '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+#13+
                        '           FROM ASU.TIB '+#13+
                        '          WHERE FK_PACID = TNAZIS.FK_ID '+#13+
                        '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''TIME_NORMA_ISSL''))) AS NADBAVKA, '+#13+
                        '        ASU.GET_SMIDNAME(TNAZIS.FK_NAZTYPEID) AS URGENT, '+#13+
                        '        ASU.GET_VRACHFCOTDEL(TNAZIS.FK_VRACHID) AS OTDELSTAC, '+#13+
                        '       (SELECT DECODE(FC_CHAR, NULL, ASU.GET_SMIDNAME(TIB.FK_SMID), FC_CHAR) '+#13+
                        '          FROM ASU.TIB '+#13+
                        '         WHERE FK_PACID = :PFK_ID '+#13+
                        '           AND FK_SMID IN (SELECT FK_ID '+#13+
                        '                             FROM TSMID '+#13+
                        '                           START WITH FC_SYNONIM = ''KEM_NAPRAVLEN'' '+#13+
                        '                           CONNECT BY PRIOR FK_ID = FK_OWNER '+#13+
                        '                           UNION ALL '+#13+
                        '                           SELECT FK_ID FROM ASU.TCOMPANY '+#13+
                        '                           START WITH FC_SYNONIM = ''ROOT_LPU'' '+#13+
                        '                           CONNECT BY PRIOR FK_ID = FK_OWNER)) AS KEMNAPRAVLEN, '+#13+
                        '       (SELECT GET_SMIDNAME(MAX(FK_SMID)) FROM ASU.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_ID IN '+' (SELECT FK_ID FROM ASU.TSMID START WITH FK_ID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_TYPEKONTRAST'') CONNECT BY PRIOR FK_ID = FK_OWNER))) AS TYPEKONTRAST, '+#13+
                        ' 			(SELECT MAX(FN_NUM) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOKONTRAST'')) AS KOLVOKONTRAST, '+#13+
                        '       (SELECT ASU.GET_SMIDNAME(MAX(FK_SMID)) FROM ASU.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_VVOD''))) AS VVOD, '+#13+
                        '       (SELECT ASU.GET_SMIDNAME(MAX(FN_NUM)) FROM ASU.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''KTO_KONTRAST'')) AS KTOKONTRAST, '+#13+
                        '       (SELECT MAX(FC_CHAR) AS FC_CHAR FROM ASU.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''NUMBER_DISK'')) AS NUMBER_DISK, '+#13+
                        '       (SELECT MAX(FC_CHAR) FROM ASU.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''NUMBER_KOROB'')) AS NUMBER_KOROB, '+#13+
                        '       (SELECT ASU.GET_SMIDNAME(MAX(FK_SMID)) FROM ASU.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM ASU.TSMID WHERE FC_SYNONIM = ''CIFRA_ARCHIVE''))) AS CIFRA_ARCHIVE, '+#13+
                        '       (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''ZAPISAN_ONPHONE'')) AS ON_PHONE, '+#13+
                        '       (SELECT MAX(FC_CHAR) FROM ASU.TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''KONTAKT_PHONE'')) AS KONTAKT_PHONE, '+#13+
                        '       (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOKOMY'')) AS KOLVOKOMY, '+#13+
                        '       (SELECT MAX(FC_CHAR) FROM ASU.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_FIO_REMARK'')) AS FIO_REMARK, '+#13+
                        '       (SELECT ASU.GET_SMIDNAME(MAX(FK_SMID)) FROM ASU.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM ASU.TSMID WHERE FC_SYNONIM = ''OTDEL_VYDANO''))) AS OTDEL_VYDANO, '+#13+
                        '       (SELECT MAX(FD_DATE) FROM ASU.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''DATE_VYDANO'')) AS DATE_VYDANO, '+#13+
                        '       (SELECT MAX(FD_DATE) FROM ASU.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''DATE_VOZVRAT'')) AS DATE_VOZVRAT '+#13+
                        '   FROM ASU.TNAZIS '+#13+
                        '  WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        ods.Open;
        nAge_4rep := ods.FieldByName('PACAGE').AsInteger;
        sSex_4rep := ods.FieldByName('SEX').AsString;
        sAddress_4rep := ods.FieldByName('ADDRESS').AsString;
        sPhone_4rep := ods.FieldByName('PHONE').AsString;
        sKabName_4rep := ods.FieldByName('KABNAME').AsString;
        sKabPhone_4rep := ods.FieldByName('KABPHONE').AsString;
        sLabName_4rep := ods.FieldByName('LAB').AsString;
        sKoren_4rep := ods.FieldByName('KOREN').AsString;
        sOpl_4rep := ods.FieldByName('OPL').AsString;
        sTarget_4rep := ods.FieldByName('TARGET').AsString;
        sVrach_4rep := ods.FieldByName('VRACH').AsString;
        sNadbavka_4rep := ods.FieldByName('NADBAVKA').AsString;
        sUrgent_4rep := ods.FieldByName('URGENT').AsString;
        sDS_4rep := ods.FieldByName('DS').AsString;
        sTypeKontrast_4rep := ods.FieldByName('TYPEKONTRAST').AsString;
        sKolvoKontrast_4rep := ods.FieldByName('KOLVOKONTRAST').AsInteger;
        sVvod_4rep := ods.FieldByName('VVOD').AsString;
        sVvel_4rep := ods.FieldByName('KTOKONTRAST').AsString;
        sDisc_4rep := ods.FieldByName('NUMBER_DISK').AsString;
        sKorob_4rep := ods.FieldByName('NUMBER_KOROB').AsString;
        sCifra_4rep := ods.FieldByName('CIFRA_ARCHIVE').AsString;
        if odsList.FieldByName('IS_AMB').AsInteger = 0 then
          sKem_4rep := ods.FieldByName('OTDELSTAC').AsString
        else
          sKem_4rep := ods.FieldByName('KEMNAPRAVLEN').AsString;
        if ods.FieldByName('ON_PHONE').AsInteger = -1 then
          begin
            frxNaprav.FindObject('memTelCap').Visible := True;
            frxNaprav.FindObject('memTel').Visible := True;
            sTelefon_4rep := ods.FieldByName('KONTAKT_PHONE').AsString;
          end else
          begin
            frxNaprav.FindObject('memTelCap').Visible := False;
            frxNaprav.FindObject('memTel').Visible := False;
          end;
        sKolvoKomy_4rep := ods.FieldByName('KOLVOKOMY').AsString;
        sRemark_4rep := ods.FieldByName('FIO_REMARK').AsString;
        sOtdel_4rep := ods.FieldByName('OTDEL_VYDANO').AsString;
        dDateVydano_4rep := ods.FieldByName('DATE_VYDANO').AsDateTime;
        dDateVozvrat_4rep := ods.FieldByName('DATE_VOZVRAT').AsDateTime;
        sDateSys4Rep := ods.FieldByName('datesys').AsString;
        DoProjivaet;
        frxNaprav.ShowReport;
      finally
        ods.Free;
      end;
    end;
end;

procedure TfrmPac.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(odsList);
end;

procedure TfrmPac.actPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
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
  frxPrintList.ShowReport;
end;

procedure TfrmPac.frxFluGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'RG_LABORANT' then Value := sLabName_4rep;
  if VarName = 'FIO_PAC' then Value := merFIOMK.Properties.Editors[0].Value;
  if VarName = 'DATE_ROJD' then Value := odsList.FieldByName('FD_ROJD').AsDateTime;
  if VarName = 'KORENNOE' then Value := sKoren_4rep; 
  if VarName = 'PROJIVAET' then Value := sProjivaet_4rep; 
  if VarName = 'ADDRESS' then Value := sAddress_4rep; 
  if VarName = 'PHONE' then Value := sPhone_4rep; 
  if VarName = 'NUMIB' then Value := odsList.FieldByName('NUMIB').AsString;
  if VarName = 'NUMISSL' then Value := odsList.FieldByName('NUMBER_ISSL').AsString;
  if VarName = 'NAMEISSL' then Value := odsList.FieldByName('FC_NAME').AsString;
  if VarName = 'AGE' then Value := nAge_4rep;
  if VarName = 'SEX' then Value := sSex_4rep;
  if VarName = 'VID_OPLATA' then Value := sOpl_4rep; 
  if VarName = 'TARGET' then Value := sTarget_4rep; 
  if VarName = 'KABINET' then Value := sKabName_4rep;
  if VarName = 'PHONEKAB' then Value := sKabPhone_4rep; 
  if VarName = 'PRIEM' then Value := sPriem_4rep;
  if VarName = 'APPARAT' then Value := sApparat_4rep;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
  if VarName = 'DATESYS' then Value := sDateSys4Rep;
end;

procedure TfrmPac.frxNapravGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'RG_LABORANT' then Value := sLabName_4rep;
  if VarName = 'FIO_PAC' then Value := merFIOMK.Properties.Editors[0].Value;
  if VarName = 'DATE_ROJD' then Value := odsList.FieldByName('FD_ROJD').AsDateTime;
  if VarName = 'KORENNOE' then Value := sKoren_4rep;
  if VarName = 'PROJIVAET' then Value := sProjivaet_4rep;
  if VarName = 'ADDRESS' then Value := sAddress_4rep;
  if VarName = 'PHONE' then Value := sPhone_4rep;
  if VarName = 'NUMIB' then Value := odsList.FieldByName('NUMIB').AsString;
  if VarName = 'KEM_NAPRAVLEN' then Value := sKem_4rep;
  if VarName = 'NAPRAV_DS' then Value := sDs_4rep;
  if VarName = 'SROCH' then Value := sUrgent_4rep;
  if VarName = 'NADBAVKA_TIME' then Value := sNadbavka_4rep;
  if VarName = 'NUMISSL' then Value := odsList.FieldByName('NUMBER_ISSL').AsString;
  if VarName = 'AGE' then Value := nAge_4rep;
  if VarName = 'SEX' then Value := sSex_4rep;
  if VarName = 'VID_OPLATA' then Value := sOpl_4rep;
  if VarName = 'VRACH_NAPRAVIL' then Value := sVrach_4rep;
  if VarName = 'TARGET' then Value := sTarget_4rep;
  if VarName = 'KABINET' then Value := sKabName_4rep;
  if VarName = 'PHONEKAB' then Value := sKabPhone_4rep;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
  if VarName = 'KONTRAST' then Value := sTypeKontrast_4rep;
  if VarName = 'KOLVOKONTRAST' then Value := sKolvoKontrast_4rep;
  if VarName = 'VVOD' then Value := sVvod_4rep;
  if VarName = 'KTOVVEL' then Value := sVvel_4rep;
  if VarName = 'DISC' then Value := sDisc_4rep;
  if VarName = 'KOROB' then Value := sKorob_4rep;
  if VarName = 'CIFRA' then Value := sCifra_4rep;
  if VarName = 'TELEFON' then Value := sTelefon_4rep;
  if VarName = 'KOLVOLISTOV' then Value := sKolvoKomy_4rep;
  if VarName = 'KYDA' then Value := sOtdel_4rep;
  if VarName = 'REMARK' then Value := sRemark_4rep;
  if VarName = 'DATA1' then Value := dDateVydano_4rep;
  if VarName = 'DATA2' then Value := dDateVozvrat_4rep;
  if VarName = 'DATESYS' then Value := sDateSys4Rep;
end;

procedure TfrmPac.frxPrintListGetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'PACFIO' then Value := merFIOMK.Properties.Editors[0].Value;
  if VarName = 'KOLVONAZ' then Value := odsList.RecordCount;
  if VarName = 'SYSDATE' then Value := GET_SYSDATE_4REP;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
end;

procedure TfrmPac.frxRepProsmotrGetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'PACFIO' then Value := merFIOMK.Properties.Editors[0].Value;
  if VarName = 'DATE_ROJD' then Value := odsList.FieldByName('FD_ROJD').AsDateTime;
  if VarName = 'NUMIB' then Value := odsList.FieldByName('NUMIB').AsString;
  if VarName = 'NAMEISSL' then Value := odsList.FieldByName('FC_NAME').AsString;
  if VarName = 'DOZA' then Value := odsList.FieldByName('DOZA').AsString;
  if VarName = 'DATEISSL' then Value := odsList.FieldByName('FD_RUN').AsString;
  if VarName = 'TEXTISSL' then Value := sTextIssl_4rep;
  if VarName = 'NUMISSL' then Value := odsList.FieldByName('NUMBER_ISSL').AsString;
  if VarName = 'SOTR' then Value := sSotrFIO_4rep;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
  if VarName = 'DATESYS' then Value := sDateSys4Rep;
end;

procedure TfrmPac.merFIOMKEditors0EditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := merFIOMK.Properties.Editors[0].Value;
end;

procedure TfrmPac.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TVLIST.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TVLISTPACVrach_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVLISTPAC');
end;

procedure TfrmPac.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);
end;

procedure TfrmPac.C1Click(Sender: TObject);
begin
  TVLIST.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TVLISTPAC'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TVLISTPAC');
end;

procedure TfrmPac.odsInfoBeforeOpen(DataSet: TDataSet);
begin
  odsInfo.SetVariable('pfk_peplid', pPEPLID);
end;

procedure TfrmPac.odsListAfterOpen(DataSet: TDataSet);
begin
  actPrint.Enabled := odsList.RecordCount <> 0;
  actProsmotr.Enabled := odsList.RecordCount <> 0;
  aNaprav.Enabled := odsList.RecordCount <> 0;
end;

end.
