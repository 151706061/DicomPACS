// !!! Может вместо этого VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_FK_ID.Index] брать данные из dxMemData1
unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, Menus, cxLookAndFeelPainters,
  cxGraphics, cxDropDownEdit, StdCtrls, cxButtons, cxTextEdit, cxMaskEdit,
  cxCalendar, cxLabel, ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel,
  cxControls, cxContainer, cxEdit, cxGroupBox, dxSkinsdxBarPainter, dxBar,
  cxClasses, cxSplitter, ActnList, ImgList, Oracle, OracleData, JclFileUtils,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  DB, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxmdaset, DateUtils, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxVGrid, cxInplaceContainer, cxButtonEdit,
  cxCheckBox, frxClass, frxDBSet, JvExControls, JvAnimatedImage, JvGIFCtrl,
  cxGridExportLink, uGlobalConst, SMMainAPI, cxSpinEdit, cxTimeEdit, ShellAPI,
  dxSkinOffice2007Green;

type
  TfrmMain = class(TForm)
    paParam: TPanel;
    BM: TdxBarManager;
    paMain: TPanel;
    cxSplitter1: TcxSplitter;
    BMBar1: TdxBar;
    bbClose: TdxBarButton;
    al: TActionList;
    aClose: TAction;
    bbRefresh: TdxBarButton;
    il: TImageList;
    aRefresh: TAction;
    os: TOracleSession;
    dxMemData1: TdxMemData;
    dxMemData1FD_RUN_STR: TStringField;
    dxMemData1NAMEISSL: TStringField;
    dsKab: TDataSource;
    odsKab: TOracleDataSet;
    dsSotr: TDataSource;
    odsSotr: TOracleDataSet;
    ilSmall: TcxImageList;
    odsKorennoe: TOracleDataSet;
    dsKorennoe: TDataSource;
    cxStyleRepository1: TcxStyleRepository;
    stNormal: TcxStyle;
    stBold: TcxStyle;
    cxStyle1: TcxStyle;
    odsVidOplat: TOracleDataSet;
    dsVidOplat: TDataSource;
    odsRegPrin: TOracleDataSet;
    dsRegPrin: TDataSource;
    odsTypeNaz: TOracleDataSet;
    dsTypeNaz: TDataSource;
    odsTarget: TOracleDataSet;
    dsTarget: TDataSource;
    odsNadbavka: TOracleDataSet;
    dsNadbavka: TDataSource;
    odsTypePlenka: TOracleDataSet;
    dsTypePlenka: TDataSource;
    dsVvod: TDataSource;
    odsVvod: TOracleDataSet;
    odsKtoKontrast: TOracleDataSet;
    dsKtoKontrast: TDataSource;
    odsDSsovpalo: TOracleDataSet;
    dsDSsovpalo: TDataSource;
    odsDSposle: TOracleDataSet;
    dsDSposle: TDataSource;
    odsResumeSovpalo: TOracleDataSet;
    dsResumeSovpalo: TDataSource;
    dxBarDockControl2: TdxBarDockControl;
    BMBar2: TdxBar;
    bbClear: TdxBarButton;
    bbSaveFilter: TdxBarButton;
    bbLoadFilter: TdxBarButton;
    aClearFilter: TAction;
    aSaveFilter: TAction;
    aLoadFilter: TAction;
    bbPrint: TdxBarButton;
    aPrint: TAction;
    frxList: TfrxReport;
    frxDBList: TfrxDBDataset;
    cxGr: TcxGrid;
    VIEW: TcxGridTableView;
    VIEW_FD_RUN: TcxGridColumn;
    VIEW_NAMEISSL: TcxGridColumn;
    cxGrLevel1: TcxGridLevel;
    bbNaprav: TdxBarButton;
    bbProtocol: TdxBarButton;
    Panel3: TPanel;
    paSubParam: TPanel;
    Animator1: TJvGIFAnimator;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    dxBarDockControl1: TdxBarDockControl;
    VerticalGrid: TcxVerticalGrid;
    rowCategoryCommon: TcxCategoryRow;
    rowPeriodFrom: TcxEditorRow;
    rowPeriodTo: TcxEditorRow;
    rowKabinet: TcxEditorRow;
    rowVrach: TcxEditorRow;
    rowSex: TcxEditorRow;
    rowCategoryAnother: TcxCategoryRow;
    rowKoren: TcxEditorRow;
    rowVidOplat: TcxEditorRow;
    rowPlace: TcxEditorRow;
    rowTypeNaz: TcxEditorRow;
    rowNapravlen: TcxEditorRow;
    rowTarget: TcxEditorRow;
    rowPhone: TcxEditorRow;
    rowNadbavka: TcxEditorRow;
    rowTypePlenka: TcxEditorRow;
    rowKontrast: TcxEditorRow;
    rowVvod: TcxEditorRow;
    rowKto: TcxEditorRow;
    rowSovpaloNaprav: TcxEditorRow;
    rowPosle: TcxEditorRow;
    rowSovpaloZakl: TcxEditorRow;
    cxSplitter2: TcxSplitter;
    aHide: TAction;
    aShow: TAction;
    aNaprav: TAction;
    aProtocol: TAction;
    pmVIEW: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    N4: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    Excel1: TMenuItem;
    sdPopUp: TSaveDialog;
    VIEW_PACFIO: TcxGridColumn;
    dxMemData1FIOPAC: TStringField;
    VIEW_VRACH: TcxGridColumn;
    dxMemData1VRACHFIO: TStringField;
    frxRepProtocol: TfrxReport;
    VIEW_FK_ID: TcxGridColumn;
    dxMemData1FK_ID: TIntegerField;
    frxNaprav: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
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
    rowCompany: TcxEditorRow;
    odsCompanyName: TOracleDataSet;
    dsCompanyName: TDataSource;
    rowGroup: TcxEditorRow;
    odsGroup: TOracleDataSet;
    dsGroup: TDataSource;
    rowZakl: TcxEditorRow;
    rowIssl: TcxEditorRow;
    rowPacient: TcxEditorRow;
    aOpenMK: TAction;
    bbOpenMK: TdxBarButton;
    VIEW_PACID: TcxGridColumn;
    dxMemData1FK_PACID: TIntegerField;
    oqThread: TOracleQuery;
    VIEW_NUMMK: TcxGridColumn;
    dxMemData1NUMMK: TStringField;
    bbInfo: TdxBarButton;
    aInfo: TAction;
    dxMemData1PEPLID: TIntegerField;
    VIEW_PEPLID: TcxGridColumn;
    dxMemData1OTDEL: TStringField;
    VIEW_OTDEL: TcxGridColumn;
    tmrCheckApplication: TTimer;
    dxMemData1NUMBER_ISSL: TStringField;
    VIEWNUM: TcxGridColumn;
    dsList: TDataSource;
    rowKratnost: TcxEditorRow;
    odsKratnost: TOracleDataSet;
    dsKratnost: TDataSource;
    rowCategoryMain: TcxCategoryRow;
    rowStatus: TcxEditorRow;
    odsMain: TOracleDataSet;
    dsMain: TDataSource;
    rowOtmena: TcxEditorRow;
    odsOtmena: TOracleDataSet;
    dsOtmena: TDataSource;
    dxBarButton1: TdxBarButton;
    aOtmena: TAction;
    VIEW_FD_NAZ: TcxGridColumn;
    dxMemData1FD_NAZ_STR: TStringField;
    frxListCancel: TfrxReport;
    merAge: TcxMultiEditorRow;
    VIEWREASONCANCEL: TcxGridColumn;
    dxMemData1FC_RES: TStringField;
    dxMemData1FD_ROJD: TDateField;
    VIEW_ROJD: TcxGridColumn;
    dxMemData1DOZA: TFloatField;
    VIEW_DOZA: TcxGridColumn;
    rowWork: TcxEditorRow;
    VIEW_KEM: TcxGridColumn;
    dxMemData1KEM: TStringField;
    VIEW_FCTYPE: TcxGridColumn;
    dxMemData1FC_TYPE: TStringField;
    VIEW_FKSMID: TcxGridColumn;
    rowQ: TcxEditorRow;
    odsQ: TOracleDataSet;
    dsQ: TDataSource;
    rowOtdel: TcxEditorRow;
    rowTypePac: TcxEditorRow;
    odsTypePac: TOracleDataSet;
    dsTypePac: TDataSource;
    odsCntPepl: TOracleDataSet;
    rowAmbOtdel: TcxEditorRow;
    rowAdrRaion: TcxEditorRow;
    merTime: TcxMultiEditorRow;
    VIEW_KABNAME: TcxGridColumn;
    dxMemData1FC_KABINET: TStringField;
    VIEWLAB: TcxGridColumn;
    dxMemData1laborant: TStringField;
    rowHighHelp: TcxEditorRow;
    VIEWRFP: TcxGridColumn;
    dxMemData1rfp: TStringField;
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aRefreshExecute(Sender: TObject);
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure odsKabBeforeOpen(DataSet: TDataSet);
    procedure odsSotrBeforeOpen(DataSet: TDataSet);
    procedure rowKorenEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowVidOplatEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowPlaceEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowTypeNazEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowNapravlenEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowTargetEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowNadbavkaEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowPhoneEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowTypePlenkaEditPropertiesEditValueChanged(Sender: TObject);
    procedure VerticalGridEditorRow1EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowVvodEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowKtoEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowSovpaloNapravEditPropertiesEditValueChanged(Sender: TObject);
    procedure aClearFilterExecute(Sender: TObject);
    procedure aSaveFilterExecute(Sender: TObject);
    procedure aLoadFilterExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure rowPosleEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowSovpaloZaklEditPropertiesEditValueChanged(Sender: TObject);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure cxSplitter2BeforeClose(Sender: TObject; var AllowClose: Boolean);
    procedure cxSplitter2BeforeOpen(Sender: TObject; var NewSize: Integer;
      var AllowOpen: Boolean);
    procedure aHideExecute(Sender: TObject);
    procedure aShowExecute(Sender: TObject);
    procedure aProtocolExecute(Sender: TObject);
    procedure aNapravExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N3Click(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure frxListGetValue(const VarName: string; var Value: Variant);
    procedure frxRepProtocolGetValue(const VarName: string; var Value: Variant);
    procedure frxNapravGetValue(const VarName: string; var Value: Variant);
    procedure rowCompanyEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowZaklEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowIsslEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure rowPacientEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure aOpenMKExecute(Sender: TObject);
    procedure aInfoExecute(Sender: TObject);
    procedure tmrCheckApplicationTimer(Sender: TObject);
    procedure rowKratnostEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowStatusEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowOtmenaEditPropertiesEditValueChanged(Sender: TObject);
    procedure aOtmenaExecute(Sender: TObject);
    procedure frxListCancelGetValue(const VarName: string; var Value: Variant);
    procedure rowWorkEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowOtdelEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowAmbOtdelEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowAdrRaionEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowTypePacEditPropertiesChange(Sender: TObject);
    procedure rowHighHelpEditPropertiesEditValueChanged(Sender: TObject);
  private
    get_vipnaz, get_nevip, get_nazcancel, get_xray_flukab, get_labvip : Integer;
    arFIO:array of string;
    pAPPSOTRID : Integer;
    sParams, sSpec : string;
    GET_VIDOPL_DOGOVOR : Integer;
    sProjivaet_4rep, sSex_4rep, sAddress_4rep, sPhone_4rep, sKabName_4rep,
    sKabPhone_4rep, sLabName_4rep, sKoren_4rep, sOpl_4rep, sTarget_4rep,
    sNadbavka_4rep, sUrgent_4rep, sDS_4rep, sKem_4Rep, sTextIssl_4rep, sDateRunStr_4Rep : string;
    nAge_4rep : Integer;
    GET_ISSL_FLU : Integer;
    sSotrFIO : string;
    sSysDate_4Rep : string;
    bbr : Boolean;
    StartTime: TTime;
    GET_VID_SNIMOK_PLENKA : Integer;
    pOTDELID : Integer;
    dDateBegin, dDateEnd : TDateTime;
    procedure DoRefreshSmidConst;
    procedure CheckEnabledButtons;
    procedure DoProjivaet;
//    function WinExecAndWait32(FileName: string; Visibility: integer): integer;
    function RestoreApplication(AAppCaption:string):Boolean;
    { Private declarations }
  public
    Russian : HKL;
    get_xray_mrt : Integer;
    sCompanyName_4Rep : string;
    sOtdelName_4Rep : string;
    MedotradeSign : string;
    pSOTRID : Integer;
    get_db_name : string;
    procedure DoShowMainForm;
    { Public declarations }
  end;

const
  sqlList = ' SELECT FK_ID, FK_PACID, FK_SMID, FK_NAZSOSID, FC_TYPE, '+#13+
            '        ASU.GET_IB(TNAZIS.FK_PACID) AS NUMMK, '+#13+
            '        FD_NAZ, TO_CHAR(FD_NAZ, ''DD.MM.YYYY HH24:MI'') AS FD_NAZ_STR, '+#13+ // ??? FD_NAZ_STR, FD_RUN_STR зачем ?
            '        FD_RUN, TO_CHAR(FD_RUN, ''DD.MM.YYYY HH24:MI'') AS FD_RUN_STR, '+#13+
            '        ASU.PKG_REGIST_PACFUNC.GET_PAC_FIO(FK_PACID) AS FIOPAC, '+#13+
            '        (SELECT TRUNC(FD_ROJD) '+#13+
            '           FROM ASU.TPEOPLES '+#13+
            '          WHERE FK_ID = (SELECT FK_PEPLID FROM ASU.TKARTA WHERE FK_ID = TNAZIS.FK_PACID '+#13+
            '                         UNION ALL '+#13+
            '                         SELECT FK_PEPLID FROM ASU.TAMBULANCE WHERE FK_ID = TNAZIS.FK_PACID)) AS FD_ROJD, '+#13+
            '        ASU.GET_NAME_RGISSL(FK_SMID) AS NAMEISSL, '+#13+
            '        ASU.DO_VRACHFIO(TNAZIS.FK_ISPOLID) AS VRACHFIO, '+#13+
            '        ASU.GET_PEPLID(FK_PACID) AS PEPLID, '+#13+
            '        ASU.GET_NAPRAVLEN(FK_PACID, FK_ID) AS OTDEL, '+#13+
            '        (SELECT max(FC_CHAR) '+#13+
            '           FROM ASU.TIB '+#13+
            '          WHERE FK_PACID = TNAZIS.FK_ID '+#13+
            '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM IN (''XRAY_FLU_NUMBER'', ''NUMBER_ISSL''))) AS NUMBER_ISSL, '+#13+
            '        '''' AS FC_RES, '+#13+
            '        (SELECT FN_NUM FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA, '+#13+
            '        asu.get_kem_napravlen(tnazis.fk_id, asu.is_ambulance(tnazis.fk_pacid)) as kem, '+#13+
            '        (select fc_name from asu.tkabinet where fk_id = tnazis.fk_roomid) as fc_kabinet, '+#13+
            '        (select asu.get_smidname(fk_smid) from asu.tib where fk_pacid = tnazis.fk_id and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''RADIO_RFP'' connect by prior fk_id = fk_owner)) as rfp, '+#13+
            '        (select asu.do_vrachfio(fn_num) from asu.tib where fk_pacid = tnazis.fk_id and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''RG_LABORANT'')) as laborant '+#13+
            '   FROM ASU.TNAZIS '+#13+
            '  WHERE FD_RUN >= :PDATE1 '+#13+
            '    AND FD_RUN <= :PDATE2 '+#13+
            '    AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+#13+
            '                     WHERE FL_SHOWANAL = 1 '+#13+
            '                    START WITH FK_ID = ASU.GET_RAD_ISSL '+#13+
            '                    CONNECT BY PRIOR FK_ID = FK_OWNER) '+#13+
            '    AND FK_NAZSOSID = :PFK_NAZSOSID ';

  sqlList1 = ' SELECT FK_ID, FK_PACID, FK_SMID, FK_NAZSOSID, FC_TYPE, '+#13+
            '        ASU.GET_IB(TNAZIS.FK_PACID) AS NUMMK, '+#13+
            '        FD_NAZ, TO_CHAR(FD_NAZ, ''DD.MM.YYYY HH24:MI'') AS FD_NAZ_STR, '+#13+ // ??? FD_NAZ_STR, FD_RUN_STR зачем ?
            '        FD_RUN, TO_CHAR(FD_RUN, ''DD.MM.YYYY HH24:MI'') AS FD_RUN_STR, '+#13+
            '        ASU.PKG_REGIST_PACFUNC.GET_PAC_FIO(FK_PACID) AS FIOPAC, '+#13+
            '        (SELECT TRUNC(FD_ROJD) '+#13+
            '           FROM ASU.TPEOPLES '+#13+
            '          WHERE FK_ID = (SELECT FK_PEPLID FROM ASU.TKARTA WHERE FK_ID = TNAZIS.FK_PACID '+#13+
            '                         UNION ALL '+#13+
            '                         SELECT FK_PEPLID FROM ASU.TAMBULANCE WHERE FK_ID = TNAZIS.FK_PACID)) AS FD_ROJD, '+#13+
            '        ASU.GET_NAME_RGISSL(FK_SMID) AS NAMEISSL, '+#13+
            '        ASU.DO_VRACHFIO(TNAZIS.FK_ISPOLID) AS VRACHFIO, '+#13+
            '        ASU.GET_PEPLID(FK_PACID) AS PEPLID, '+#13+
            '        ASU.GET_NAPRAVLEN(FK_PACID, FK_ID) AS OTDEL, '+#13+
            '        (SELECT max(FC_CHAR) '+#13+
            '           FROM ASU.TIB '+#13+
            '          WHERE FK_PACID = TNAZIS.FK_ID '+#13+
            '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM IN (''XRAY_FLU_NUMBER'', ''NUMBER_ISSL''))) AS NUMBER_ISSL, '+#13+
            '        '''' AS FC_RES, '+#13+
            '        (SELECT FN_NUM FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA, '+#13+
            '        asu.get_kem_napravlen(tnazis.fk_id, asu.is_ambulance(tnazis.fk_pacid)) as kem, '+#13+
            '        (select fc_name from asu.tkabinet where fk_id = tnazis.fk_roomid) as fc_kabinet, '+#13+
            '        (select asu.get_smidname(fk_smid) from asu.tib where fk_pacid = tnazis.fk_id and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''RADIO_RFP'' connect by prior fk_id = fk_owner)) as rfp, '+#13+
            '        (select asu.do_vrachfio(fn_num) from asu.tib where fk_pacid = tnazis.fk_id and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''RG_LABORANT'')) as laborant '+#13+
            '   FROM ASU.TNAZIS '+#13+
            '  WHERE FD_RUN >= :PDATE1 '+#13+
            '    AND FD_RUN <= :PDATE2 '+#13+
            '    AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+#13+
            '                     WHERE FL_SHOWANAL = 1 '+#13+
            '                    START WITH FK_ID = ASU.GET_RAD_ISSL '+#13+
            '                    CONNECT BY PRIOR FK_ID = FK_OWNER) '+#13+
            '    AND FK_NAZSOSID IN (asu.get_labvip, asu.get_vipnaz) ';

  sqlListCancel = ' SELECT TNAZIS.FK_ID, TNAZIS.FK_PACID, TNAZIS.FK_SMID, TNAZIS.FK_NAZSOSID, TNAZIS.FC_TYPE, '+#13+
                  '        ASU.GET_IB(TNAZIS.FK_PACID) AS NUMMK, '+#13+
                  '        FD_NAZ, TO_CHAR(tnazis.FD_NAZ, ''DD.MM.YYYY HH24:MI'') AS FD_NAZ_STR, '+#13+
                  '        FD_RUN, TO_CHAR(tnazis.FD_RUN, ''DD.MM.YYYY HH24:MI'') AS FD_RUN_STR, '+#13+
                  '        vres.fd_ins as DATE_CANCEL, '+#13+
                  '        ASU.PKG_REGIST_PACFUNC.GET_PAC_FIO(tnazis.FK_PACID) AS FIOPAC, '+#13+
                  '        (SELECT TRUNC(FD_ROJD) '+#13+
                  '           FROM ASU.TPEOPLES '+#13+
                  '          WHERE FK_ID = (SELECT FK_PEPLID FROM ASU.TKARTA WHERE FK_ID = TNAZIS.FK_PACID '+#13+
                  '                         UNION '+#13+
                  '                         SELECT FK_PEPLID FROM ASU.TAMBULANCE WHERE FK_ID = TNAZIS.FK_PACID)) FD_ROJD, '+#13+
                  '        ASU.GET_NAME_RGISSL(tnazis.FK_SMID) AS NAMEISSL, '+#13+
                  '        ASU.DO_VRACHFIO(TNAZIS.FK_ISPOLID) AS VRACHFIO, '+#13+
                  '        ASU.GET_PEPLID(tnazis.FK_PACID) AS PEPLID, '+#13+
                  '        ASU.GET_NAPRAVLEN(tnazis.FK_PACID, tnazis.FK_ID) AS OTDEL, '+#13+
                  '        '''' AS NUMBER_ISSL, '+#13+
                  '        vres.fc_res, '+#13+
                  '        0 as doza, '+#13+
                  '        asu.get_kem_napravlen(tnazis.fk_id, asu.is_ambulance(tnazis.fk_pacid)) as kem, '+#13+
                  '        (select fc_name from asu.tkabinet where fk_id = tnazis.fk_roomid) as fc_kabinet, '+#13+
                  '        (select asu.get_smidname(fk_smid) from asu.tib where fk_pacid = tnazis.fk_id and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''RADIO_RFP'' connect by prior fk_id = fk_owner)) as rfp, '+#13+
                  '        (select asu.do_vrachfio(fn_num) from asu.tib where fk_pacid = tnazis.fk_id and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''RG_LABORANT'')) as laborant '+#13+
                  '   FROM ASU.TNAZIS, asu.vres '+#13+
                  '  WHERE tnazis.FD_RUN >= :PDATE1 '+#13+
                  '    AND tnazis.FD_RUN <= :PDATE2 '+#13+
                  '    and tnazis.fk_id = vres.fk_nazid '+#13+
                  '    AND tnazis.FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+#13+
                  '                            WHERE FL_SHOWANAL = 1 '+#13+
                  '                           START WITH FK_ID = ASU.GET_RAD_ISSL '+#13+
                  '                           CONNECT BY PRIOR FK_ID = FK_OWNER) '+#13+
                  '    AND tnazis.FK_NAZSOSID = :PFK_NAZSOSID ';

  sqlListCount = ' select count(distinct asu.get_peplid(fk_pacid)) as cnt '+#13+
                 '   from asu.tnazis '+#13+
                 '  where fd_run >= :pdate1 '+#13+
                 '    and fd_run <= :pdate2 '+#13+
                 '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                 '                     where fl_showanal = 1 '+#13+
                 '                    start with fk_id = asu.get_rad_issl '+#13+
                 '                    connect by prior fk_id = fk_owner) '+#13+
                 '    and fk_nazsosid = :pfk_nazsosid ';
  sqlListCount1 = ' select count(distinct asu.get_peplid(fk_pacid)) as cnt '+#13+
                 '   from asu.tnazis '+#13+
                 '  where fd_run >= :pdate1 '+#13+
                 '    and fd_run <= :pdate2 '+#13+
                 '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                 '                     where fl_showanal = 1 '+#13+
                 '                    start with fk_id = asu.get_rad_issl '+#13+
                 '                    connect by prior fk_id = fk_owner) '+#13+
                 '    and fk_nazsosid in (asu.get_labvip, asu.get_vipnaz) ';
var
  frmMain: TfrmMain;

implementation
uses uPeriod, fSetNapravlen, fSetKontrast, fZakl, fSearch, fWait, fPacInfo,
     fOtmena, fWork, fSetOtdel, fSetAdrRaion, fSetKab, fSetUsl;
{$R *.dfm}

procedure TfrmMain.aClearFilterExecute(Sender: TObject);
begin
  if Application.MessageBox('Вы действительно хотите очистить настройки фильтра?', 'Вопрос', MB_YESNO) = mrYes then
    begin
      rowKabinet.Properties.Value := -1;
      rowVrach.Properties.Value := -1;
      rowTypePac.Properties.Value := -1;
      rowPacient.Tag := -1;
      rowPacient.Properties.Value := null;
      rowSex.Properties.Value := Null;
      merAge.Properties.Editors[0].Value := 0;
      merAge.Properties.Editors[1].Value := 0;
      rowGroup.Properties.Value := -1;
      rowIssl.Tag := -1;
      rowIssl.Properties.Value := null;

      rowKoren.Properties.Value := -1;
      rowKoren.Properties.ImageIndex := -1;
      rowKoren.Styles.Content := stNormal;
      rowKoren.Styles.Header := stNormal;

      rowVidOplat.Properties.Value := -1;
      rowVidOplat.Properties.ImageIndex := -1;
      rowVidOplat.Styles.Content := stNormal;
      rowVidOplat.Styles.Header := stNormal;

      rowPlace.Properties.Value := -1;
      rowPlace.Properties.ImageIndex := -1;
      rowPlace.Styles.Content := stNormal;
      rowPlace.Styles.Header := stNormal;

      rowTypeNaz.Properties.Value := -1;
      rowTypeNaz.Properties.ImageIndex := -1;
      rowTypeNaz.Styles.Content := stNormal;
      rowTypeNaz.Styles.Header := stNormal;

      rowNapravlen.Tag := -1;
      rowNapravlen.Properties.Value := null;
      rowNapravlen.Properties.ImageIndex := -1;
      rowNapravlen.Styles.Content := stNormal;
      rowNapravlen.Styles.Header := stNormal;

      rowTarget.Properties.Value := -1;
      rowTarget.Properties.ImageIndex := -1;
      rowTarget.Styles.Content := stNormal;
      rowTarget.Styles.Header := stNormal;

      rowKratnost.Properties.Value := -1;
      rowKratnost.Properties.ImageIndex := -1;
      rowKratnost.Styles.Content := stNormal;
      rowKratnost.Styles.Header := stNormal;

      rowPhone.Properties.Value := 0;
      rowPhone.Properties.ImageIndex := -1;
      rowPhone.Styles.Content := stNormal;
      rowPhone.Styles.Header := stNormal;

      rowNadbavka.Properties.Value := -1;
      rowNadbavka.Properties.ImageIndex := -1;
      rowNadbavka.Styles.Content := stNormal;
      rowNadbavka.Styles.Header := stNormal;

      rowKontrast.Tag := -1;
      rowKontrast.Properties.Value := null;
      rowKontrast.Properties.ImageIndex := -1;
      rowKontrast.Styles.Content := stNormal;
      rowKontrast.Styles.Header := stNormal;

      rowVvod.Properties.Value := -1;
      rowVvod.Properties.ImageIndex := -1;
      rowVvod.Styles.Content := stNormal;
      rowVvod.Styles.Header := stNormal;

      rowKto.Properties.Value := -1;
      rowKto.Properties.ImageIndex := -1;
      rowKto.Styles.Content := stNormal;
      rowKto.Styles.Header := stNormal;

      rowSovpaloNaprav.Properties.Value := -1;
      rowSovpaloNaprav.Properties.ImageIndex := -1;
      rowSovpaloNaprav.Styles.Content := stNormal;
      rowSovpaloNaprav.Styles.Header := stNormal;

      rowPosle.Properties.Value := -1;
      rowPosle.Properties.ImageIndex := -1;
      rowPosle.Styles.Content := stNormal;
      rowPosle.Styles.Header := stNormal;

      rowSovpaloZakl.Properties.Value := -1;
      rowSovpaloZakl.Properties.ImageIndex := -1;
      rowSovpaloZakl.Styles.Content := stNormal;
      rowSovpaloZakl.Styles.Header := stNormal;

      rowZakl.Tag := -1;
      rowZakl.Properties.Value := null;
      rowZakl.Properties.ImageIndex := -1;
      rowZakl.Styles.Content := stNormal;
      rowZakl.Styles.Header := stNormal;

      rowWork.Tag := -1;
      rowWork.Properties.Value := null;
      rowWork.Properties.ImageIndex := -1;
      rowWork.Styles.Content := stNormal;
      rowWork.Styles.Header := stNormal;

      rowOtmena.Properties.Value := -1;
      rowOtmena.Properties.ImageIndex := -1;
      rowOtmena.Styles.Content := stNormal;
      rowOtmena.Styles.Header := stNormal;

      rowOtdel.Tag := -1;
      rowOtdel.Properties.Value := null;
      rowOtdel.Properties.ImageIndex := -1;
      rowOtdel.Styles.Content := stNormal;
      rowOtdel.Styles.Header := stNormal;

      rowAmbOtdel.Tag := -1;
      rowAmbOtdel.Properties.Value := null;
      rowAmbOtdel.Properties.ImageIndex := -1;
      rowAmbOtdel.Styles.Content := stNormal;
      rowAmbOtdel.Styles.Header := stNormal;

      rowAdrRaion.Tag := -1;
      rowAdrRaion.Properties.Value := null;
      rowAdrRaion.Properties.ImageIndex := -1;
      rowAdrRaion.Styles.Content := stNormal;
      rowAdrRaion.Styles.Header := stNormal;

      merTime.Properties.Editors[0].Value := '';
      merTime.Properties.Editors[1].Value := '';

      try
        TcxButtonEdit(VerticalGrid.InplaceEditor).EditValue := null;
      except
      end;
      VerticalGrid.FocusRow(VerticalGrid.FirstRow, 0);
    end;
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.aHideExecute(Sender: TObject);
begin
  cxSplitter1.CloseSplitter;
end;

procedure TfrmMain.aInfoExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmPacInfo, frmPacInfo);
  try
    frmPacInfo.DoShowPacInfo(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index],
                             VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PEPLID.Index],
                             VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_OTDEL.Index]);
    frmPacInfo.ShowModal;
  finally
    frmPacInfo.Free;
  end;
end;

procedure TfrmMain.aLoadFilterExecute(Sender: TObject);
begin
  ShowMessage('Эта кнопка находится в разработке!');
end;

procedure TfrmMain.aNapravExecute(Sender: TObject);
var odsNapr : TOracleDataSet;
begin
        odsListNaz.Close;
        odsListNaz.SetVariable('PFK_ID', VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_FK_ID.Index]);
        odsListNaz.Open;
        odsNapr := TOracleDataSet.Create(nil);
        try
          odsNapr.Session := frmMain.os;
          odsNapr.Cursor := crSQLWait;
          odsNapr.SQL.Text := ' SELECT ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TNAZIS.FK_PACID) AS PACAGE, '+#13+
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
                              '        ASU.GET_SMIDNAME(TNAZIS.FK_NAZTYPEID) AS URGENT '+#13+
                              '   FROM ASU.TNAZIS '+#13+
                              '  WHERE FK_ID = :PFK_ID ';
          odsNapr.DeclareAndSet('PFK_ID', otInteger, VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_FK_ID.Index]);
          odsNapr.Open;
          nAge_4rep := odsNapr.FieldByName('PACAGE').AsInteger;
          sSex_4rep := odsNapr.FieldByName('SEX').AsString;
          sAddress_4rep := odsNapr.FieldByName('ADDRESS').AsString;
          sPhone_4rep := odsNapr.FieldByName('PHONE').AsString;
          sKabName_4rep := odsNapr.FieldByName('KABNAME').AsString;
          sKabPhone_4rep := odsNapr.FieldByName('KABPHONE').AsString;
          sLabName_4rep := odsNapr.FieldByName('LAB').AsString;
          sKoren_4rep := odsNapr.FieldByName('KOREN').AsString;
          sOpl_4rep := odsNapr.FieldByName('OPL').AsString;
          sTarget_4rep := odsNapr.FieldByName('TARGET').AsString;
          sNadbavka_4rep := odsNapr.FieldByName('NADBAVKA').AsString;
          sUrgent_4rep := odsNapr.FieldByName('URGENT').AsString;
          sDS_4rep := odsNapr.FieldByName('DS').AsString;
          sKem_4rep := VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_KEM.Index];
          DoProjivaet;
          frxNaprav.ShowReport;
        finally
          odsNapr.Free;
        end;
end;

procedure TfrmMain.aOpenMKExecute(Sender: TObject);
var ods : TOracleDataSet;
    AppProcID : Integer;
begin
  ods := TOracleDataSet.Create(nil);
  try
    {$IFDEF USE_NEW_AUTH}
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_FIO(:FK_PEPLID) FIOPAC FROM DUAL ';
    ods.DeclareAndSet('FK_PEPLID', otInteger, VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PEPLID.Index]);
    ods.Open;
    if RestoreApplication(ods.FieldByName('FIOPAC').AsString) then Exit;
    SetLength(frmMain.arFIO,Length(frmMain.arFIO)+1);
    arFIO[Length(frmMain.arFIO)-1]:=ods.FieldByName('FIOPAC').AsString;
    aOpenMK.Enabled:=False;
    Application.ProcessMessages;
    Screen.Cursor := crSQLWait;
    tmrCheckApplication.Enabled:=True;

    AppProcID := AppStart(ExtractFilePath(paramstr(0))+'IBRazdel.exe', IntToStr(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index])+' '+IntToStr(-1)+' '+IntToStr(-1));
    if AppProcID = -1 then ShowMessage('Ошибка запуска приложения');
    {$ELSE}
      AppProcID := 0;
      if ShellExecute(Application.Handle,
                      pChar('open'),
                      PChar(ExtractFilePath(paramstr(0)) + 'IBRazdel.exe'),
                      PChar(IntToStr(frmMain.pAPPSOTRID) + ' ' +
                      IntToStr(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index]) + ' ' +
                      IntToStr(-1) + ' ' +
                      IntToStr(-1)), PChar(ExtractFilePath(paramstr(0))), SW_SHOWNORMAL) < 32 then
      Application.MessageBox('Запуск внешнего модуля не удался.', 'Ошибка', MB_OK + MB_ICONERROR);
    {$ENDIF}
    ShowWait(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index],True);
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.aOtmenaExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  Application.CreateForm(TfrmOtmena, frmOtmena);
  try
    frmOtmena.acOk.Visible := FALSE;
    frmOtmena.GroupBox1.Visible := FALSE;
    frmOtmena.cxOtmena.Align := alClient;
    frmOtmena.acCancel.Caption := 'Закрыть';
    frmOtmena.acCancel.ImageIndex := 2;
    ods := TOracleDataSet.Create(nil);
    try
      ods.Session := os;
      ods.Cursor := crSQLWait;
      ods.SQL.Text := ' SELECT FC_RES, '+
                      '        TO_CHAR(FD_INS, ''DD.MM.YYYY HH24:MI'') FD_INS, '+
                      '        FK_VRACHID, ASU.DO_VRACHFIO(FK_VRACHID) AS SOTRFIO '+
                      '   FROM ASU.VRES '+
                      '  WHERE FK_NAZID = :pFK_NAZID AND FK_SOS = :PFK_SOS ';
      ods.DeclareAndSet('pFK_NAZID', otInteger, VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_FK_ID.Index]);
      ods.DeclareAndSet('PFK_SOS', otInteger, get_nazcancel);
      ods.Open;
      frmOtmena.cxOtmena.Text := 'Сотрудник:'+' '+ods.FieldByName('SOTRFIO').AsString+','+' '+
                                 'Дата отмены:'+' '+ods.FieldByName('FD_INS').AsString+#13#10+
                                 'Обоснование отмены:'+' '+ods.FieldByName('FC_RES').AsString;
    finally
      ods.Free;
    end;
    frmOtmena.ShowModal;
  finally
    frmOtmena.Free;
  end;
end;

procedure TfrmMain.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  VerticalGrid.FocusRow(VerticalGrid.FirstRow, 0);
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS DATESYS FROM DUAL ';
    ods.Open;
    sSysDate_4Rep := ods.FieldByName('DATESYS').AsString;
  finally
    ods.Free;
  end;
  sParams := '';
  if rowKabinet.Properties.Value <> -1 then
    sParams := sParams + 'Кабинет: '+odsKab.FieldByName('FC_NAME').AsString+'; ';
  if rowVrach.Properties.Value <> -1 then
    sParams := sParams + 'Врач: '+odsSotr.FieldByName('FC_NAME').AsString+'; ';
  if rowPacient.Tag <> -1 then
    sParams := sParams + 'Пациент: '+rowPacient.Properties.Value+'; ';
  if (rowTypePac.Properties.Value <> -1) and (rowTypePac.Properties.Value <> null)  then
    sParams := sParams + 'Тип пациента: '+odsTypePac.FieldByName('fc_name').AsString+'; ';
  if VarToStr(rowSex.Properties.Value) <> '' then
    sParams := sParams + 'Пол пациента: '+rowSex.Properties.Value+'; ';
  if merAge.Properties.Editors[1].Value <> 0  then
    sParams := sParams + 'Возраст с: '+IntToStr(merAge.Properties.Editors[0].Value)+' по: '+IntToStr(merAge.Properties.Editors[1].Value)+'; ';
  if rowGroup.Properties.Value <> -1 then
    sParams := sParams + 'Группа: '+odsGroup.FieldByName('FC_NAME').AsString+'; ';
  if rowIssl.Tag <> -1 then
    sParams := sParams + 'Методика: '+rowIssl.Properties.Value+'; ';
  if (rowKoren.Properties.Value <> - 1) and (VarToStr(rowKoren.Properties.Value) <> '') then
    sParams := sParams + 'Коренное население: '+odsKorennoe.FieldByName('FC_NAME').AsString+'; ';
  if (rowVidOplat.Properties.Value <> -1) and (VarToStr(rowVidOplat.Properties.Value) <> '') then
    sParams := sParams + 'Вид оплаты: '+odsVidOplat.FieldByName('FC_NAME').AsString+'; ';
  if (rowCompany.Visible = True) and (rowCompany.Properties.Value <> -1) and (VarToStr(rowCompany.Properties.Value) <> '') then
    sParams := sParams + 'Компания по договору: '+odsCompanyName.FieldByName('FC_NAME').AsString+'; ';
  if (rowPlace.Properties.Value <> -1) and (VarToStr(rowPlace.Properties.Value) <> '') then
    sParams := sParams + 'Проживает: '+odsRegPrin.FieldByName('FC_NAME').AsString+'; ';
  if (rowTypeNaz.Properties.Value <> -1) and (VarToStr(rowTypeNaz.Properties.Value) <> '') then
    sParams := sParams + 'Тип назначения: '+odsTypeNaz.FieldByName('FC_NAME').AsString+'; ';
  if rowNapravlen.Tag <> -1 then 
    sParams := sParams + 'Направлен: '+rowNapravlen.Properties.Value+'; ';
  if (rowTarget.Properties.Value <> -1) and (VarToStr(rowTarget.Properties.Value) <> '') then
    sParams := sParams + 'Цель: '+odsTarget.FieldByName('FC_NAME').AsString+'; ';
  if (rowKratnost.Properties.Value <> -1) and (VarToStr(rowKratnost.Properties.Value) <> '') then
    sParams := sParams + 'Кратность: '+odsKratnost.FieldByName('FC_NAME').AsString+'; ';
  if rowPhone.Properties.Value <> 0 then
    sParams := sParams + 'Записан по телефону: ДА; ';
  if (rowTypePlenka.Visible = True) and (rowTypePlenka.Properties.Value <> -1) and (VarToStr(rowTypePlenka.Properties.Value) <> '') then
    sParams := sParams + 'Тип плёнки: '+odsTypePlenka.FieldByName('FC_NAME').AsString+'; ';
  if (rowNadbavka.Properties.Value <> -1) and (VarToStr(rowNadbavka.Properties.Value) <> '') then
    sParams := sParams + 'Надбавка ко времени: '+odsNadbavka.FieldByName('FC_NAME').AsString+'; ';
  if rowKontrast.Tag <> -1 then
    sParams := sParams + 'Контраст: '+rowKontrast.Properties.Value+'; ';
  if (rowVvod.Properties.Value <> -1) and (VarToStr(rowVvod.Properties.Value) <> '') then
    sParams := sParams + 'Способ ввода контраста: '+odsVvod.FieldByName('FC_NAME').AsString+'; ';
  if (rowKto.Properties.Value <> -1) and (VarToStr(rowKto.Properties.Value) <> '') then
    sParams := sParams + 'Кто ввёл: '+odsKtoKontrast.FieldByName('FC_NAME').AsString+'; ';
  if (rowSovpaloNaprav.Properties.Value <> -1) and (VarToStr(rowSovpaloNaprav.Properties.Value) <> '') then
    sParams := sParams + 'Совпадение с направительным DS: '+odsDSsovpalo.FieldByName('FC_NAME').AsString+'; ';
  if (rowPosle.Properties.Value <> -1) and (VarToStr(rowPosle.Properties.Value) <> '') then
    sParams := sParams + 'Заключительный DS после: '+odsDSPosle.FieldByName('FC_NAME').AsString+'; ';
  if (rowSovpaloZakl.Properties.Value <> -1) and (VarToStr(rowSovpaloZakl.Properties.Value) <> '') then
    sParams := sParams + 'Совпадение заключительного DS с заключением: '+odsResumeSovpalo.FieldByName('FC_NAME').AsString+'; ';
  if rowZakl.Tag <> -1 then
    sParams := sParams + 'Заключение: '+rowZakl.Properties.Value+'; ';
  if (rowOtmena.Properties.Value <> -1) and (VarToStr(rowOtmena.Properties.Value) <> '') then
    sParams := sParams + 'Причина отмены: '+odsOtmena.FieldByName('FC_NAME').AsString+'; ';
  if rowWork.Tag <> -1 then
    sParams := sParams + 'Место работы: '+rowWork.Properties.Value+'; ';
  if rowOtdel.Tag <> -1 then
    sParams := sParams + 'Стационарное отделение: '+rowOtdel.Properties.Value+'; ';
  if merTime.Properties.Editors[0].Value <> '' then
    sParams := sParams + 'Время с: '+merTime.Properties.Editors[0].Value+' по: '+merTime.Properties.Editors[1].Value+'; ';

  if (rowStatus.Properties.Value = get_vipnaz) or (rowStatus.Properties.Value = get_nevip) or (rowStatus.Properties.Value = get_labvip) or (rowStatus.Properties.Value = -1) then
    begin
      if sParams = '' then
        begin
          frxList.FindObject('Memo21').Visible := False;
          frxList.FindObject('Memo22').Visible := False;
        end else
        begin
          frxList.FindObject('Memo21').Visible := True;
          frxList.FindObject('Memo22').Visible := True;
        end;
      frxList.ShowReport;
    end;

  if rowStatus.Properties.Value = get_nazcancel then
    begin
      if sParams = '' then
        begin
          frxListCancel.FindObject('Memo21').Visible := False;
          frxListCancel.FindObject('Memo22').Visible := False;
        end else
        begin
          frxListCancel.FindObject('Memo21').Visible := True;
          frxListCancel.FindObject('Memo22').Visible := True;
        end;
      frxListCancel.ShowReport;
    end;
end;

procedure TfrmMain.aProtocolExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(FD_RUN, ''DD.MM.YYYY HH24:MI'') AS FD_RUN_STR, '+#13+
                    '        (SELECT FB_TEXT FROM ASU.TRICHVIEWDATA WHERE FK_PACID = TNAZIS.FK_ID) AS TEXTISSL, '+#13+
                    '        (SELECT FK_OWNER FROM ASU.TSMID WHERE FK_ID = TNAZIS.FK_SMID) AS FK_OWNER '+#13+
                    '   FROM ASU.TNAZIS '+#13+
                    '  WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_FK_ID.Index]);
    ods.Open;
    sTextIssl_4rep := ods.FieldByName('TEXTISSL').AsString;
    sDateRunStr_4Rep := ods.FieldByName('FD_RUN_STR').AsString;
    frxRepProtocol.FindObject('Memo9').Visible := ods.FieldByName('FK_OWNER').AsInteger <> frmMain.GET_XRAY_MRT;
    frxRepProtocol.FindObject('Memo22').Visible := ods.FieldByName('FK_OWNER').AsInteger <> frmMain.GET_XRAY_MRT;
    frxRepProtocol.FindObject('Memo23').Visible := ods.FieldByName('FK_OWNER').AsInteger <> frmMain.GET_XRAY_MRT;
  finally
    ods.Free;
  end;
  frxRepProtocol.ShowReport;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin
  cxGr.SetFocus;
//-->> проверяем на правильность введенных данных
  if merAge.Properties.Editors[0].Value < 0 then
    begin
      Application.MessageBox('Начальная цифра возрастного периода не может быть меньше нуля!', 'Внимание', MB_ICONWARNING + MB_OK);
      merAge.Properties.Editors[0].Row.Focused := True;
      Exit;
    end;
  if merAge.Properties.Editors[1].Value < 0 then
    begin
      Application.MessageBox('Конечная цифра возрастного периода не может быть меньше нуля!', 'Внимание', MB_ICONWARNING + MB_OK);
      merAge.Properties.Editors[1].Row.Focused := True;
      Exit;
    end;

  aClearFilter.Enabled := False;
  aRefresh.Enabled := False;
  aNaprav.Enabled := False;
  aProtocol.Enabled := False;
  aPrint.Enabled := False;
  aInfo.Enabled := False;
  aOpenMK.Enabled := False;

  if VIEW.DataController.LockCount = 0 then
    VIEW.BeginUpdate;
  VIEW.DataController.RecordCount := 0;
  while VIEW.DataController.LockCount > 0 do
    VIEW.EndUpdate;
  dxMemData1.Close;
  dxMemData1.Open;
  dDateBegin := VarToDateTime(rowPeriodFrom.Properties.Value);
  dDateEnd := VarToDateTime(rowPeriodTo.Properties.Value+' 23:59:59');
  oqThread.Scrollable := True;

  oqThread.DeleteVariables;
  if (rowStatus.Properties.Value = get_vipnaz) or (rowStatus.Properties.Value = get_nevip) or (rowStatus.Properties.Value = get_labvip) then
    oqThread.SQL.Text := sqlList;
  if rowStatus.Properties.Value = -1 then // вып. + вып. лаборантом
    oqThread.SQL.Text := sqlList1;
  if rowStatus.Properties.Value = get_nazcancel then
    oqThread.SQL.Text := sqlListCancel;

  odsCntPepl.Close;
  odsCntPepl.DeleteVariables;
  if rowStatus.Properties.Value = -1 then
    odsCntPepl.SQL.Text := sqlListCount1
  else
    odsCntPepl.SQL.Text := sqlListCount;
//-->> 0. Статус исследования
  if rowStatus.Properties.Value <> -1 then
    begin
      odsCntPepl.DeclareAndSet('pfk_nazsosid', otInteger, rowStatus.Properties.Value);
      oqThread.DeclareAndSet('PFK_NAZSOSID', otInteger, rowStatus.Properties.Value);
    end;
//-->> 1. Кабинет
  if rowKabinet.Properties.Value <> -1 then
    begin
      oqThread.SQL.Add(' AND FK_ROOMID = :PFK_ROOMID ');
      oqThread.DeclareAndSet('PFK_ROOMID', otInteger, rowKabinet.Properties.Value);
      odsCntPepl.SQL.Add(' AND FK_ROOMID = :PFK_ROOMID ');
      odsCntPepl.DeclareAndSet('PFK_ROOMID', otInteger, rowKabinet.Properties.Value);
    end;
//-->> 2. Врач(сотрудник, исполнитель)
  if rowVrach.Properties.Value <> -1 then
    begin
      oqThread.SQL.Add(' AND FK_ISPOLID = :PFK_ISPOLID ');
      oqThread.DeclareAndSet('PFK_ISPOLID', otInteger, rowVrach.Properties.Value);
      odsCntPepl.SQL.Add(' AND FK_ISPOLID = :PFK_ISPOLID ');
      odsCntPepl.DeclareAndSet('PFK_ISPOLID', otInteger, rowVrach.Properties.Value);
    end;
//-->> 3. Пол пациента
  if VarToStr(rowSex.Properties.Value) <> '' then
    begin
      oqThread.SQL.Add(' AND ASU.PKG_REGIST_PACFUNC.GET_PAC_SEXID(TNAZIS.FK_PACID) = :PFK_SEXID ');
      if rowSex.Properties.Value = 'Мужчины' then
        oqThread.DeclareAndSet('PFK_SEXID', otInteger, 1);
      if rowSex.Properties.Value = 'Женщины' then
        oqThread.DeclareAndSet('PFK_SEXID', otInteger, 0);
      odsCntPepl.SQL.Add(' AND ASU.PKG_REGIST_PACFUNC.GET_PAC_SEXID(TNAZIS.FK_PACID) = :PFK_SEXID ');
      if rowSex.Properties.Value = 'Мужчины' then
        odsCntPepl.DeclareAndSet('PFK_SEXID', otInteger, 1);
      if rowSex.Properties.Value = 'Женщины' then
        odsCntPepl.DeclareAndSet('PFK_SEXID', otInteger, 0);
    end;
//-->> 3.2 Тип пациента
  if (rowTypePac.Properties.Value <> -1) and (rowTypePac.Properties.Value <> null) then
    begin
      oqThread.SQL.Add(' AND ASU.IS_AMBULANCE(TNAZIS.FK_PACID) = :PFK_TYPEPAC ');
      oqThread.DeclareAndSet('PFK_TYPEPAC', otInteger, rowTypePac.Properties.Value);
      odsCntPepl.SQL.Add(' AND ASU.IS_AMBULANCE(TNAZIS.FK_PACID) = :PFK_TYPEPAC ');
      odsCntPepl.DeclareAndSet('PFK_TYPEPAC', otInteger, rowTypePac.Properties.Value);
    end;
//-->> 3.5 Возраст пациента
  if merAge.Properties.Editors[1].Value <> 0 then
    begin
      oqThread.SQL.Add(' AND ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TNAZIS.FK_PACID) >= :PAGE1 ');
      oqThread.SQL.Add(' AND ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TNAZIS.FK_PACID) <= :PAGE2 ');
      oqThread.DeclareAndSet('PAGE1', otInteger, merAge.Properties.Editors[0].Value);
      oqThread.DeclareAndSet('PAGE2', otInteger, merAge.Properties.Editors[1].Value);
      odsCntPepl.SQL.Add(' AND ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TNAZIS.FK_PACID) >= :PAGE1 ');
      odsCntPepl.SQL.Add(' AND ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TNAZIS.FK_PACID) <= :PAGE2 ');
      odsCntPepl.DeclareAndSet('PAGE1', otInteger, merAge.Properties.Editors[0].Value);
      odsCntPepl.DeclareAndSet('PAGE2', otInteger, merAge.Properties.Editors[1].Value);
    end;
//-->> 4. Коренное население
  if (rowKoren.Properties.Value <> -1) and (VarToStr(rowKoren.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = ASU.GET_PEPLID(TNAZIS.FK_PACID) AND FK_SMID = :PFK_SMID) ');
      oqThread.DeclareAndSet('PFK_SMID', otInteger, rowKoren.Properties.Value);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = ASU.GET_PEPLID(TNAZIS.FK_PACID) AND FK_SMID = :PFK_SMID) ');
      odsCntPepl.DeclareAndSet('PFK_SMID', otInteger, rowKoren.Properties.Value);
    end;
//-->> 5. Вид оплаты
  if (rowVidOplat.Properties.Value <> -1) and (VarToStr(rowVidOplat.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID1) ');
      oqThread.DeclareAndSet('PFK_SMID1', otInteger, rowVidOplat.Properties.Value);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID1) ');
      odsCntPepl.DeclareAndSet('PFK_SMID1', otInteger, rowVidOplat.Properties.Value);
    end;
//-->> 6. Проживает
  if (rowPlace.Properties.Value <> -1) and (VarToStr(rowPlace.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_PACID AND FK_SMID = :PFK_SMID2) ');
      oqThread.DeclareAndSet('PFK_SMID2', otInteger, rowPlace.Properties.Value);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_PACID AND FK_SMID = :PFK_SMID2) ');
      odsCntPepl.DeclareAndSet('PFK_SMID2', otInteger, rowPlace.Properties.Value);
    end;
//-->> 7. Тип назначения
  if (rowTypeNaz.Properties.Value <> -1) and (VarToStr(rowTypeNaz.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' AND FK_NAZTYPEID = :PFK_NAZTYPEID ');
      oqThread.DeclareAndSet('PFK_NAZTYPEID', otInteger, rowTypeNaz.Properties.Value);
      odsCntPepl.SQL.Add(' AND FK_NAZTYPEID = :PFK_NAZTYPEID ');
      odsCntPepl.DeclareAndSet('PFK_NAZTYPEID', otInteger, rowTypeNaz.Properties.Value);
    end;
//-->> 8. Цель
  if (rowTarget.Properties.Value <> -1) and (VarToStr(rowTarget.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID3) ');
      oqThread.DeclareAndSet('PFK_SMID3', otInteger, rowTarget.Properties.Value);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID3) ');
      odsCntPepl.DeclareAndSet('PFK_SMID3', otInteger, rowTarget.Properties.Value);
    end;
//-->> 8.5. Кратность
  if (rowKratnost.Properties.Value <> -1) and (VarToStr(rowKratnost.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID19) ');
      oqThread.DeclareAndSet('PFK_SMID19', otInteger, rowKratnost.Properties.Value);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID19) ');
      odsCntPepl.DeclareAndSet('PFK_SMID19', otInteger, rowKratnost.Properties.Value);
    end;
//-->> 9. Записан по телефону
  if rowPhone.Properties.Value <> 0 then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''ZAPISAN_ONPHONE'') AND FN_NUM = :PFN_NUM) ');
      oqThread.DeclareAndSet('PFN_NUM', otInteger, rowPhone.Properties.Value);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''ZAPISAN_ONPHONE'') AND FN_NUM = :PFN_NUM) ');
      odsCntPepl.DeclareAndSet('PFN_NUM', otInteger, rowPhone.Properties.Value);
    end;
//-->> 10. Надбавка
  if (rowNadbavka.Properties.Value <> -1) and (VarToStr(rowNadbavka.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID4) ');
      oqThread.DeclareAndSet('PFK_SMID4', otInteger, rowNadbavka.Properties.Value);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID4) ');
      odsCntPepl.DeclareAndSet('PFK_SMID4', otInteger, rowNadbavka.Properties.Value);
    end;
//-->> 12. Тип пленки
  if (rowTypePlenka.Visible = True) and (rowTypePlenka.Properties.Value <> -1) and (VarToStr(rowTypePlenka.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID6) ');
      oqThread.DeclareAndSet('PFK_SMID6', otInteger, rowTypePlenka.Properties.Value);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID6) ');
      odsCntPepl.DeclareAndSet('PFK_SMID6', otInteger, rowTypePlenka.Properties.Value);
    end;
//-->> 13. Способ ввода конраста
  if (rowVvod.Properties.Value <> -1) and (VarToStr(rowVvod.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID7) ');
      oqThread.DeclareAndSet('PFK_SMID7', otInteger, rowVvod.Properties.Value);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID7) ');
      odsCntPepl.DeclareAndSet('PFK_SMID7', otInteger, rowVvod.Properties.Value);
    end;
//-->> 14. Кто ввёл контраст
  if (rowKto.Properties.Value <> -1) and (VarToStr(rowKto.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' AND (SELECT COUNT(*) FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FN_NUM = :PFN_NUM1) > 0 ');
      oqThread.DeclareAndSet('PFN_NUM1', otInteger, rowKto.Properties.Value);
      odsCntPepl.SQL.Add(' AND (SELECT COUNT(*) FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FN_NUM = :PFN_NUM1) > 0 ');
      odsCntPepl.DeclareAndSet('PFN_NUM1', otInteger, rowKto.Properties.Value);
    end;
//-->> 17. Совпадение с направительным диагнозом
  if (rowSovpaloNaprav.Properties.Value <> -1) and (VarToStr(rowSovpaloNaprav.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID9) ');
      oqThread.DeclareAndSet('PFK_SMID9', otInteger, rowSovpaloNaprav.Properties.Value);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID9) ');
      odsCntPepl.DeclareAndSet('PFK_SMID9', otInteger, rowSovpaloNaprav.Properties.Value);
    end;
//-->> 18. Заключительный диагноз после
  if (rowPosle.Properties.Value <> -1) and (VarToStr(rowPosle.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID10) ');
      oqThread.DeclareAndSet('PFK_SMID10', otInteger, rowPosle.Properties.Value);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID10) ');
      odsCntPepl.DeclareAndSet('PFK_SMID10', otInteger, rowPosle.Properties.Value);
    end;
//-->> 19. Совпадение заключительного диагноза с заключением
  if (rowSovpaloZakl.Properties.Value <> -1) and (VarToStr(rowSovpaloZakl.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID11) ');
      oqThread.DeclareAndSet('PFK_SMID11', otInteger, rowSovpaloZakl.Properties.Value);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID11) ');
      odsCntPepl.DeclareAndSet('PFK_SMID11', otInteger, rowSovpaloZakl.Properties.Value);
    end;
//-->> 20. Направлен
  if rowNapravlen.Tag <> -1 then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID12) ');
      oqThread.DeclareAndSet('PFK_SMID12', otInteger, rowNapravlen.Tag);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID12) ');
      odsCntPepl.DeclareAndSet('PFK_SMID12', otInteger, rowNapravlen.Tag);
    end;
//-->> 21. Тип контраста
  if rowKontrast.Tag <> -1 then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID13) ');
      oqThread.DeclareAndSet('PFK_SMID13', otInteger, rowKontrast.Tag);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID13) ');
      odsCntPepl.DeclareAndSet('PFK_SMID13', otInteger, rowKontrast.Tag);
    end;
//-->> 25. Компания по договору
  if (rowCompany.Visible = True) and (rowCompany.Properties.Value <> -1) and (VarToStr(rowCompany.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID16) ');
      oqThread.DeclareAndSet('PFK_SMID16', otInteger, rowCompany.Properties.Value);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID16) ');
      odsCntPepl.DeclareAndSet('PFK_SMID16', otInteger, rowCompany.Properties.Value);
    end;
//-->> 26. Группа исследований
  if rowGroup.Properties.Value <> -1 then
    begin
      if rowGroup.Properties.Value = 1 then
        begin
          oqThread.SQL.Add(' AND tnazis.FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER IN (ASU.GET_XRAY_GRAF, ASU.GET_XRAY_SCOP) AND FL_DEL = 0 AND FL_SHOWANAL = 1) ');
          odsCntPepl.SQL.Add(' AND tnazis.FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER IN (ASU.GET_XRAY_GRAF, ASU.GET_XRAY_SCOP) AND FL_DEL = 0 AND FL_SHOWANAL = 1) ');
        end else
        begin
          oqThread.SQL.Add(' AND tnazis.FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = :PFK_OWNER AND FL_DEL = 0 AND FL_SHOWANAL = 1) ');
          oqThread.DeclareAndSet('PFK_OWNER', otInteger, rowGroup.Properties.Value);
          odsCntPepl.SQL.Add(' AND tnazis.FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = :PFK_OWNER AND FL_DEL = 0 AND FL_SHOWANAL = 1) ');
          odsCntPepl.DeclareAndSet('PFK_OWNER', otInteger, rowGroup.Properties.Value);
        end;
    end;
//-->> 27. Заключение
  if rowZakl.Tag <> -1 then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME'') AND FK_BID = :PFK_SMID17) ');
      oqThread.DeclareAndSet('PFK_SMID17', otInteger, rowZakl.Tag);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME'') AND FK_BID = :PFK_SMID17) ');
      odsCntPepl.DeclareAndSet('PFK_SMID17', otInteger, rowZakl.Tag);
    end;
//-->> 28. Методика
  if rowIssl.Tag <> -1 then
    begin
      oqThread.SQL.Add(' AND tnazis.FK_SMID = :PFK_SMID18 ');
      oqThread.DeclareAndSet('PFK_SMID18', otInteger, rowIssl.Tag);
      odsCntPepl.SQL.Add(' AND tnazis.FK_SMID = :PFK_SMID18 ');
      odsCntPepl.DeclareAndSet('PFK_SMID18', otInteger, rowIssl.Tag);
    end;
//-->> 29. Пациент
  if rowPacient.Tag <> -1 then
    begin
      oqThread.SQL.Add(' AND ASU.GET_PEPLID(tnazis.FK_PACID) = :PFK_PACID ');
      oqThread.DeclareAndSet('PFK_PACID', otInteger, rowPacient.Tag);
      odsCntPepl.SQL.Add(' AND ASU.GET_PEPLID(tnazis.FK_PACID) = :PFK_PACID ');
      odsCntPepl.DeclareAndSet('PFK_PACID', otInteger, rowPacient.Tag);
    end;
//-->> 30. Причины отмены
  if (rowOtmena.Properties.Value <> -1) and (VarToStr(rowOtmena.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID20) ');
      oqThread.DeclareAndSet('PFK_SMID20', otInteger, rowOtmena.Properties.Value);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID20) ');
      odsCntPepl.DeclareAndSet('PFK_SMID20', otInteger, rowOtmena.Properties.Value);
    end;
//-->> 33. Место работы
  if rowWork.Tag <> -1 then
    begin
      oqThread.SQL.Add(' AND (SELECT FK_COMPANYID FROM ASU.TPEOPLES WHERE FK_ID = ASU.GET_PEPLID(TNAZIS.FK_PACID)) = :PWORK ');
      oqThread.DeclareAndSet('PWORK', otInteger, rowWork.Tag);
      odsCntPepl.SQL.Add(' AND (SELECT FK_COMPANYID FROM ASU.TPEOPLES WHERE FK_ID = ASU.GET_PEPLID(TNAZIS.FK_PACID)) = :PWORK ');
      odsCntPepl.DeclareAndSet('PWORK', otInteger, rowWork.Tag);
    end;
//-->> 34. Оценка качества
  if (rowQ.Properties.Value <> -1) and (VarToStr(rowQ.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID23) ');
      oqThread.DeclareAndSet('PFK_SMID23', otInteger, rowQ.Properties.Value);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID23) ');
      odsCntPepl.DeclareAndSet('PFK_SMID23', otInteger, rowQ.Properties.Value);
    end;
//-->> 35. Стационарное отделение
  if rowOtdel.Tag <> -1 then
    begin
      oqThread.SQL.Add(' AND ASU.PKG_REGIST_PACFUNC.GET_PAC_OTDELID(TNAZIS.FK_PACID) = :POTDEL ');
      oqThread.DeclareAndSet('POTDEL', otInteger, rowOtdel.Tag);
      odsCntPepl.SQL.Add(' AND ASU.PKG_REGIST_PACFUNC.GET_PAC_OTDELID(TNAZIS.FK_PACID) = :POTDEL ');
      odsCntPepl.DeclareAndSet('POTDEL', otInteger, rowOtdel.Tag);
    end;
//-->> 36. Амбулаторное отделение
  if rowAmbOtdel.Tag <> -1 then
    begin
      oqThread.SQL.Add(' and login.get_sotr_otdelid(tnazis.fk_vrachid) = :potdel1 ');
      oqThread.DeclareAndSet('potdel1', otInteger, rowAmbOtdel.Tag);
      odsCntPepl.SQL.Add(' and login.get_sotr_otdelid(tnazis.fk_vrachid) = :potdel1 ');
      odsCntPepl.DeclareAndSet('potdel1', otInteger, rowAmbOtdel.Tag);
    end;
//-->> 37. Адрес район (по месту жительства(фактическому проживанию))
  if rowAdrRaion.Tag <> -1 then
    begin
      oqThread.SQL.Add(' and (select max(fk_kladr) from asu.tadress where fk_pacid = asu.get_peplid(tnazis.fk_pacid) and fk_type = asu.GET_REGISTID) in (select fk_id from asu.tkladr start with fk_id = :pkladr connect by prior fk_id = fk_owner) ');
      oqThread.DeclareAndSet('pkladr', otInteger, rowAdrRaion.Tag);
      odsCntPepl.SQL.Add(' and (select max(fk_kladr) from asu.tadress where fk_pacid = asu.get_peplid(tnazis.fk_pacid) and fk_type = asu.GET_REGISTID) in (select fk_id from asu.tkladr start with fk_id = :pkladr connect by prior fk_id = fk_owner) ');
      odsCntPepl.DeclareAndSet('pkladr', otInteger, rowAdrRaion.Tag);
    end;
//-->> 38. Время
  if (merTime.Properties.Editors[0].Value <> null) and (merTime.Properties.Editors[0].Value <> '') then
    begin
      oqThread.SQL.Add(' and to_char(fd_run, ''hh24:mi'') >= :ptime1 ');
      oqThread.SQL.Add(' and to_char(fd_run, ''hh24:mi'') <= :ptime2 ');
      oqThread.DeclareAndSet('ptime1', otString, merTime.Properties.Editors[0].Value);
      oqThread.DeclareAndSet('ptime2', otString, merTime.Properties.Editors[1].Value);
      odsCntPepl.SQL.Add(' and to_char(fd_run, ''hh24:mi'') >= :ptime1 ');
      odsCntPepl.SQL.Add(' and to_char(fd_run, ''hh24:mi'') <= :ptime2 ');
      odsCntPepl.DeclareAndSet('ptime1', otString, merTime.Properties.Editors[0].Value);
      odsCntPepl.DeclareAndSet('ptime2', otString, merTime.Properties.Editors[1].Value);
    end;
//-->> 39. Высокотехнологичная помощь
  if (rowHighHelp.Visible = True) and (rowHighHelp.Properties.Value <> 0) and (rowHighHelp.Properties.Value <> null) then
    begin
      if rowTypePac.Properties.Value = 1 then // амбулаторный
        begin
          oqThread.SQL.Add(' and exists (select 1 from asu.tib t1, asu.tambtalon_naz t2 where t1.fk_pacid = t2.fk_talonid and t2.fk_nazid = tnazis.fk_id and t1.fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''TYPE_V_MU_HIGHHELP'')) ');
          odsCntPepl.SQL.Add(' and exists (select 1 from asu.tib t1, asu.tambtalon_naz t2 where t1.fk_pacid = t2.fk_talonid and t2.fk_nazid = tnazis.fk_id and t1.fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''TYPE_V_MU_HIGHHELP'')) ');
        end;
      if rowTypePac.Properties.Value = 0 then // стационарный
        begin
          oqThread.SQL.Add(' and exists (select 1 from asu.tib where fk_pacid = tnazis.fk_pacid and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''TYPE_V_MU_HIGHHELP'')) ');
          odsCntPepl.SQL.Add(' and exists (select 1 from asu.tib where fk_pacid = tnazis.fk_pacid and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''TYPE_V_MU_HIGHHELP'')) ');
        end;
    end;

  cxLabel1.Caption := '';
  cxLabel2.Caption := '';
  cxLabel3.Caption := 'Выполняется запрос к Базе Данных...';
  StartTime:= Now;
  cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel1.Refresh;
  bbr := False;
  paSubParam.Visible := True;
  cxSplitter2.Visible := True;
  Animator1.Animate := True;
  oqThread.DeclareAndSet('PDATE1', otDate, dDateBegin);
  oqThread.DeclareAndSet('PDATE2', otDate, dDateEnd);
  oqThread.Execute;
end;

procedure TfrmMain.aSaveFilterExecute(Sender: TObject);
begin
  ShowMessage('Эта кнопка находится в разработке!');
end;

procedure TfrmMain.aShowExecute(Sender: TObject);
begin
  cxSplitter1.OpenSplitter;
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

procedure TfrmMain.CheckEnabledButtons;
begin
  aNaprav.Enabled := oqThread.RowCount <> 0;
  aProtocol.Enabled := oqThread.RowCount <> 0;
  aPrint.Enabled := oqThread.RowCount <> 0;
  aOpenMK.Enabled := oqThread.RowCount <> 0;
  aInfo.Enabled := oqThread.RowCount <> 0;
  aOtmena.Enabled := oqThread.RowCount <> 0;
end;

procedure TfrmMain.cxSplitter2BeforeClose(Sender: TObject; var AllowClose: Boolean);
begin
  paSubParam.Visible := False;
end;

procedure TfrmMain.cxSplitter2BeforeOpen(Sender: TObject; var NewSize: Integer; var AllowOpen: Boolean);
begin
  paSubParam.Visible := True; 
end;

procedure TfrmMain.DoProjivaet;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' DECLARE '+
                    '   nSMID NUMBER; '+
                    ' BEGIN '+
                    ' SELECT '+
                    ' DECODE((SELECT ASU.GET_SMIDNAME(MAX(FK_SMID)) FROM ASU.TIB '+
                    '          WHERE FK_PACID = :PFK_PACID '+
                    '            AND (FK_SMID IN (SELECT FK_ID '+
                    '                               FROM TSMID '+
                    '                              WHERE FK_OWNER = (SELECT MAX(FK_ID) '+
                    '                                                  FROM ASU.TSMID '+
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
										'   SELECT ASU.GET_SMIDNAME(MAX(FK_ID)) INTO :VAL FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''PD_MZ'') AND FK_DEFAULT = 1; '+
                    ' END IF; '+
                    ' END; ';
    ods.DeclareAndSet('PFK_PACID', otInteger, VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index]);
    ods.DeclareAndSet('PFK_PEPLID', otInteger, VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PEPLID.Index]);
    ods.DeclareVariable('VAL', otString);
    ods.Open;
    sProjivaet_4rep := ods.GetVariable('VAL');
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.DoRefreshSmidConst;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.SQL.Text := ' SELECT (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''SNIMOK_PLENKA'') AS VID_SNIMOK_PLENKA, '+#13+
                    '        ASU.PKG_SMINI.READSTRING (''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME, '+#13+
                    '        ASU.GET_XRAY_MRT, asu.get_xray_flukab, '+#13+
                    '        (SELECT MAX(FK_ID) FROM ASU.TSMID WHERE FC_SYNONIM = ''ISSLED_FLUROGR'') AS GET_ISSL_FLU, '+#13+
                    '        (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''TAL_OTHER'') AS GET_VIDOPL_DOGOVOR, '+#13+
                    '        ASU.PKG_SMINI.READSTRING(''CONFIG'', ''DB_NAME'', ''H'') AS DB_NAME '+#13+
                    '   FROM DUAL ';
    ods.Open;
    GET_VID_SNIMOK_PLENKA := ods.FieldByName('VID_SNIMOK_PLENKA').AsInteger;
    sCompanyName_4Rep := ods.FieldByName('COMPANYNAME').AsString;
    GET_XRAY_MRT := ods.FieldByName('GET_XRAY_MRT').AsInteger;
    GET_ISSL_FLU := ods.FieldByName('GET_ISSL_FLU').AsInteger;
    GET_VIDOPL_DOGOVOR := ods.FieldByName('GET_VIDOPL_DOGOVOR').AsInteger;
    get_xray_flukab := ods.FieldByName('get_xray_flukab').AsInteger;
    get_db_name := ods.FieldByName('DB_NAME').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.DoShowMainForm;
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  aOpenMK.Enabled := False;
  aNaprav.Enabled := False;
  aProtocol.Enabled := False;
  aPrint.Enabled := False;
  aInfo.Enabled := False;
  aOtmena.Enabled := False;
  merAge.Properties.Editors[0].Value := 0;
  merAge.Properties.Editors[1].Value := 0;
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
    frmMain.Caption := 'Радионуклидный архив ('+Ver.FileVersion+')'+'. Пользователь: '+ods.FieldByName('VRACHFIO').AsString;
    rowPeriodFrom.Properties.Value := ods.FieldByName('DATESYS').AsVariant;
    rowPeriodTo.Properties.Value := ods.FieldByName('DATESYS').AsVariant;
    sOtdelName_4Rep := ods.FieldByName('OTDELNAME').AsString;
    sSotrFIO := ods.FieldByName('VRACHFIO').AsString;
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT TSOTR.FK_OTDELID, TS_SPRAV.FC_NAME '+#13+
                    '   FROM ASU.TSOTR, ASU.TS_SPRAV '+#13+
                    '  WHERE TSOTR.FK_SPRAVID = TS_SPRAV.FK_ID AND TSOTR.FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pSOTRID);
    ods.Open;
    pOTDELID := ods.FieldByName('FK_OTDELID').AsInteger;
    sSpec := ods.FieldByName('FC_NAME').AsString;
    if odsMain.Active = False then
      odsMain.Open;
    if odsKab.Active = False then
      odsKab.Open;
    if odsSotr.Active = False then
      odsSotr.Open;
    if odsKorennoe.Active = False then
      odsKorennoe.Open;
    if odsVidOplat.Active = False then
      odsVidOplat.Open;
    if odsRegPrin.Active = False then
      odsRegPrin.Open;
    if odsTypeNaz.Active = False then
      odsTypeNaz.Open;
    if odsTarget.Active = False then
      odsTarget.Open;
    if odsKratnost.Active = False then
      odsKratnost.Open; 
    if odsNadbavka.Active = False then
      odsNadbavka.Open;
    if odsTypePlenka.Active = False then
      odsTypePlenka.Open;
    if odsVvod.Active = False then
      odsVvod.Open;
    if odsKtoKontrast.Active = False then
      odsKtoKontrast.Open;
    if odsDSsovpalo.Active = False then
      odsDSsovpalo.Open;
    if odsDSposle.Active = False then
      odsDSposle.Open;
    if odsResumeSovpalo.Active = False then
      odsResumeSovpalo.Open;
    if odsCompanyName.Active = False then
      odsCompanyName.Open;
    if odsGroup.Active = False then
      odsGroup.Open;
    if odsOtmena.Active = False then
      odsOtmena.Open;
    if odsQ.Active = False then
      odsQ.Open;
    if odsTypePac.Active = False then
      odsTypePac.Open;

    rowPhone.Properties.Value := 0;
    rowNapravlen.Tag := -1;
    rowKontrast.Tag := -1;
    rowZakl.Tag := -1;
    rowIssl.Tag := -1;
    rowPacient.Tag := -1;
    rowWork.Tag := -1;
    rowOtdel.Tag := -1;
    rowAmbOtdel.Tag := -1;
    rowAdrRaion.Tag := -1;
    VIEW.StoreToRegistry('\SoftWare\SoftMaster\Xray_Archive\fMain\ViewVrach_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'VIEW');
    VIEW.RestoreFromRegistry('\SoftWare\SoftMaster\Xray_Archive\fMain\ViewVrach_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'VIEW');
    MedotradeSign := ReadMedotradeSign;
    rowCompany.Visible := False;
    rowTypePlenka.Visible := False;
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
  VIEW.StoreToRegistry('\SoftWare\SoftMaster\Xray_Archive\fMain\ViewVrach_' + IntToStr(pSOTRID), TRUE, [], 'VIEW');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var ods : TOracleDataSet;
begin
  russian := LoadKeyboardLayout('00000419', 0);
  {$IFDEF USE_NEW_AUTH}
  GetSession(os, 'ASU');
  {$ELSE}
    os.LogonUsername := 'ASU';
    os.LogonPassword := 'ASU';
    os.LogonDatabase := 'ASU';
    os.Connected:=True;
  {$ENDIF}
//-->> выбираем константы
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.SQL.Text := ' SELECT ASU.GET_VIPNAZ, ASU.GET_NAZCANCEL, asu.get_nevip, asu.get_labvip FROM DUAL ';
    ods.Open;
    get_vipnaz := ods.FieldByName('GET_VIPNAZ').AsInteger;
    get_nazcancel := ods.FieldByName('GET_NAZCANCEL').AsInteger;
    get_nevip := ods.FieldByName('GET_NEVIP').AsInteger;
    get_labvip := ods.FieldByName('get_labvip').AsInteger;
    rowStatus.Properties.Value := get_vipnaz;
//-->> скрываем поля которые не работают со статусом "Выполнено" get_vipnaz
    rowOtmena.Visible := False;
    aOtmena.Visible := False;
  finally
    ods.Free;
  end;
  self.WindowState := wsMaximized;
end;

procedure TfrmMain.frxListCancelGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'VSEGO' then Value := oqThread.RowCount;
  if VarName = 'DATESYS' then Value := sSysDate_4Rep;
  if VarName = 'SOTR' then Value := sSotrFIO;
  if VarName = 'DATE1' then Value := rowPeriodFrom.Properties.Value;
  if VarName = 'DATE2' then Value := rowPeriodTo.Properties.Value;
  if VarName = 'PARAMS' then Value := sParams;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
  if rowStatus.Properties.Value = get_vipnaz then
    begin
      if VarName = 'STATUS' then Value := 'Выполнено';
    end;
  if rowStatus.Properties.Value = get_nazcancel then
    begin
      if VarName = 'STATUS' then Value := 'Отменено';
    end;
  if VarName = 'SPECSOTR' then Value := sSpec;    
end;

procedure TfrmMain.frxListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'VSEGO' then Value := oqThread.RowCount;
  if VarName = 'DATESYS' then Value := sSysDate_4Rep;
  if VarName = 'SOTR' then Value := sSotrFIO;
  if VarName = 'DATE1' then Value := rowPeriodFrom.Properties.Value;
  if VarName = 'DATE2' then Value := rowPeriodTo.Properties.Value;
  if VarName = 'PARAMS' then Value := sParams;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
  if rowStatus.Properties.Value = get_vipnaz then
    begin
      if VarName = 'STATUS' then Value := 'Выполнено';
    end;
  if rowStatus.Properties.Value = get_nevip then
    begin
      if VarName = 'STATUS' then Value := 'Не вып.';
    end;
  if rowStatus.Properties.Value = get_labvip then
    begin
      if VarName = 'STATUS' then Value := 'Вып. лаборантом';
    end;
  if rowStatus.Properties.Value = -1 then
    begin
      if VarName = 'STATUS' then Value := 'Вып. + вып. лаборантом';
    end;
  if rowStatus.Properties.Value = get_nazcancel then
    begin
      if VarName = 'STATUS' then Value := 'Отменено';
    end;
  if VarName = 'SPECSOTR' then Value := sSpec;
end;

procedure TfrmMain.frxNapravGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'RG_LABORANT' then Value := sLabName_4rep;
  if VarName = 'FIO_PAC' then Value := VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACFIO.Index];
  if VarName = 'DATE_ROJD' then Value := VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_ROJD.Index];
  if VarName = 'KORENNOE' then Value := sKoren_4rep;
  if VarName = 'PROJIVAET' then Value := sProjivaet_4rep;
  if VarName = 'ADDRESS' then Value := sAddress_4rep;
  if VarName = 'PHONE' then Value := sPhone_4rep;
  if VarName = 'NUMIB' then Value := VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_NUMMK.Index];
  if VarName = 'KEM_NAPRAVLEN' then Value := sKem_4rep;
  if VarName = 'NAPRAV_DS' then Value := sDs_4rep;
  if VarName = 'SROCH' then Value := sUrgent_4rep;
  if VarName = 'NADBAVKA_TIME' then Value := sNadbavka_4rep;
  if VarName = 'NUMISSL' then Value := VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEWNUM.Index];
  if VarName = 'AGE' then Value := nAge_4rep;
  if VarName = 'SEX' then Value := sSex_4rep;
  if VarName = 'VID_OPLATA' then Value := sOpl_4rep;
  if VarName = 'TARGET' then Value := sTarget_4rep;
  if VarName = 'KABINET' then Value := sKabName_4rep;
  if VarName = 'PHONEKAB' then Value := sKabPhone_4rep;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.frxRepProtocolGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'PACFIO' then Value := VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACFIO.Index];
  if VarName = 'DATE_ROJD' then Value := VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_ROJD.Index];
  if VarName = 'NUMIB' then Value := VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_NUMMK.Index];
  if VarName = 'NAMEISSL' then Value := VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_NAMEISSL.Index];
  if VarName = 'DOZA' then Value := VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_DOZA.Index];
  if VarName = 'DATEISSL' then Value := sDateRunStr_4Rep;
  if VarName = 'TEXTISSL' then Value := sTextIssl_4rep;
  if VarName = 'NUMISSL' then Value := VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEWNUM.Index];
  if VarName = 'SOTR' then Value := VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_VRACH.Index];
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.N3Click(Sender: TObject);
begin
  VIEW.RestoreFromRegistry('\SoftWare\SoftMaster\Xray_Archive\fMain\ViewVrach_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'VIEW');
end;

procedure TfrmMain.odsKabBeforeOpen(DataSet: TDataSet);
begin
  odsKab.SetVariable('PSOTR', pSOTRID);
end;

procedure TfrmMain.odsSotrBeforeOpen(DataSet: TDataSet);
begin
  odsSotr.SetVariable('PFK_OTDELID', pOTDELID);
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
  aClearFilter.Enabled := True;
  aRefresh.Enabled := True;
  Animator1.Animate := False;
  if bbr then
    cxLabel3.Caption := 'При выполнении запроса произошла ошибка!'
  else
    cxLabel3.Caption := 'Запрос к Базе Данных выполнился успешно!';

  odsCntPepl.DeclareAndSet('PDATE1', otDate, dDateBegin);
  odsCntPepl.DeclareAndSet('PDATE2', otDate, dDateEnd);
  odsCntPepl.Open;
  cxlabel2.Caption := cxLabel2.Caption + ' Из них лиц - '+IntToStr(odsCntPepl.FieldByName('cnt').AsInteger);
  CheckEnabledButtons;
end;

procedure TfrmMain.oqThreadThreadRecord(Sender: TOracleQuery);
begin
  VIEW.BeginUpdate;
  VIEW.DataController.RecordCount := VIEW.DataController.RecordCount + 1;
  with VIEW.DataController do
  begin
    try
      Values[VIEW.DataController.RecordCount - 1, VIEW_FK_ID.Index] := Sender.Field('FK_ID');
      Values[VIEW.DataController.RecordCount - 1, VIEW_PACID.Index] := Sender.Field('FK_PACID');
      Values[VIEW.DataController.RecordCount - 1, VIEW_FD_NAZ.Index] := Sender.Field('FD_NAZ');
      if (rowStatus.Properties.Value = get_vipnaz) or (rowStatus.Properties.Value = get_labvip) or (rowStatus.Properties.Value = -1) then
        Values[VIEW.DataController.RecordCount - 1, VIEW_FD_RUN.Index] := Sender.Field('FD_RUN');
      if rowStatus.Properties.Value = get_nazcancel then
        Values[VIEW.DataController.RecordCount - 1, VIEW_FD_RUN.Index] := Sender.Field('DATE_CANCEL');
      Values[VIEW.DataController.RecordCount - 1, VIEW_PACFIO.Index] := Sender.Field('FIOPAC');
      Values[VIEW.DataController.RecordCount - 1, VIEW_NAMEISSL.Index] := Sender.Field('NAMEISSL');
      Values[VIEW.DataController.RecordCount - 1, VIEW_VRACH.Index] := Sender.Field('VRACHFIO');
      Values[VIEW.DataController.RecordCount - 1, VIEW_NUMMK.Index] := Sender.Field('NUMMK');
      Values[VIEW.DataController.RecordCount - 1, VIEW_PEPLID.Index] := Sender.Field('PEPLID');
      Values[VIEW.DataController.RecordCount - 1, VIEW_OTDEL.Index] := Sender.Field('OTDEL');
      Values[VIEW.DataController.RecordCount - 1, VIEWNUM.Index] := Sender.Field('NUMBER_ISSL');
      Values[VIEW.DataController.RecordCount - 1, VIEWREASONCANCEL.Index] := Sender.Field('FC_RES');
      Values[VIEW.DataController.RecordCount - 1, VIEW_ROJD.Index] := Sender.Field('FD_ROJD');
      Values[VIEW.DataController.RecordCount - 1, VIEW_DOZA.Index] := Sender.Field('DOZA');
      Values[VIEW.DataController.RecordCount - 1, VIEW_KEM.Index] := Sender.Field('KEM');
      Values[VIEW.DataController.RecordCount - 1, VIEW_FCTYPE.Index] := Sender.Field('FC_TYPE');
      Values[VIEW.DataController.RecordCount - 1, VIEW_FKSMID.Index] := Sender.Field('FK_SMID');
      Values[VIEW.DataController.RecordCount - 1, VIEW_KABNAME.Index] := Sender.Field('FC_KABINET');
      Values[VIEW.DataController.RecordCount - 1, VIEWLAB.Index] := Sender.Field('laborant');
      Values[VIEW.DataController.RecordCount - 1, VIEWRFP.Index] := Sender.Field('rfp');

      dxMemData1.Insert;
      dxMemData1.FieldByName('FK_ID').AsString := Sender.Field('FK_ID');
      dxMemData1.FieldByName('FK_PACID').AsString := Sender.Field('FK_PACID');
      dxMemData1.FieldByName('FD_NAZ_STR').AsString := Sender.Field('FD_NAZ_STR');
      if (rowStatus.Properties.Value = get_vipnaz) or (rowStatus.Properties.Value = get_labvip) or (rowStatus.Properties.Value = -1) then
        dxMemData1.FieldByName('FD_RUN_STR').AsString := Sender.Field('FD_RUN_STR');
      if rowStatus.Properties.Value = get_nazcancel then
        dxMemData1.FieldByName('FD_RUN_STR').AsString := Sender.Field('DATE_CANCEL');
      dxMemData1.FieldByName('FIOPAC').AsString := Sender.Field('FIOPAC');
      dxMemData1.FieldByName('NAMEISSL').AsString := Sender.Field('NAMEISSL');
      dxMemData1.FieldByName('VRACHFIO').AsString := Sender.Field('VRACHFIO');
      dxMemData1.FieldByName('NUMMK').AsString := Sender.Field('NUMMK');
      dxMemData1.FieldByName('PEPLID').AsString := Sender.Field('PEPLID');
      dxMemData1.FieldByName('OTDEL').AsString := Sender.Field('OTDEL');
      dxMemData1.FieldByName('NUMBER_ISSL').AsString := Sender.Field('NUMBER_ISSL');
      dxMemData1.FieldByName('FC_RES').AsString := Sender.Field('FC_RES');
      dxMemData1.FieldByName('FD_ROJD').AsString := Sender.Field('FD_ROJD');
      dxMemData1.FieldByName('DOZA').AsFloat := Sender.Field('DOZA');
      dxMemData1.FieldByName('KEM').AsString := Sender.Field('KEM');
      dxMemData1.FieldByName('FC_TYPE').AsString := Sender.Field('FC_TYPE');
      dxMemData1.FieldByName('FC_KABINET').AsString := Sender.Field('FC_KABINET');
      dxMemData1.FieldByName('laborant').AsString := Sender.Field('laborant');
      dxMemData1.FieldByName('rfp').AsString := Sender.Field('rfp');
      dxMemData1.Post;
      dxMemData1.Next;
    finally
    end;
  end;
  VIEW.EndUpdate;
  cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel1.Refresh;
  cxLabel2.Caption := 'Выбрано ' + IntToStr(VIEW.DataController.RecordCount) + ' записей.';
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

function TfrmMain.RestoreApplication(AAppCaption: string): Boolean;
var
  Wnd               : hWnd;
  buff              : array[0..127] of Char;
begin
  Result := False;
  Self.SetFocus;
  Application.ProcessMessages;
  Wnd := GetWindow(Handle, gw_HWndFirst);
  while Wnd <> 0 do
  begin
    if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
    begin
      GetWindowText(Wnd, buff, sizeof(buff));
      if StrPas(buff) = AAppCaption then
      begin
        Application.ProcessMessages;
        ShowWindow(wnd, SW_SHOWMINIMIZED);
        ShowWindow(wnd, SW_SHOWNORMAL);
        SetForegroundWindow(wnd);
        Application.ProcessMessages;
        Result := True;
        Exit;
      end; //if StrPas(buff) = cFIO
    end; //if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
    Wnd := GetWindow(Wnd, gw_hWndNext);
  end; //while Wnd <> 0
end;

procedure TfrmMain.rowAdrRaionEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetAdrRaion, frmSetAdrRaion);
      try
        frmSetAdrRaion.ShowModal;
        if frmSetAdrRaion.ModalResult = mrOk then
          begin
            rowAdrRaion.Tag := frmSetAdrRaion.odsList.FieldByName('fk_id').AsInteger;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := frmSetAdrRaion.odsList.FieldByName('fc_name').AsString;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            if rowAdrRaion.Tag = -1 then
              begin
                rowAdrRaion.Properties.ImageIndex := -1;
                rowAdrRaion.Styles.Content := stNormal;
                rowAdrRaion.Styles.Header := stNormal;
              end else
              begin
                rowAdrRaion.Properties.ImageIndex := 4;
                rowAdrRaion.Styles.Content := stBold;
                rowAdrRaion.Styles.Header := stBold;
              end;
          end;
      finally
        frmSetAdrRaion.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      rowAdrRaion.Tag := -1;
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      rowAdrRaion.Properties.ImageIndex := -1;
      rowAdrRaion.Styles.Content := stNormal;
      rowAdrRaion.Styles.Header := stNormal;
    end;
end;

procedure TfrmMain.rowAmbOtdelEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetOtdel, frmSetOtdel);
      frmSetOtdel.odsOtdel.SQL.Text := frmSetOtdel.odsOtdelAmb.SQL.Text;
      try
        frmSetOtdel.ShowModal;
        if frmSetOtdel.ModalResult = mrOk then
          begin
            rowAmbOtdel.Tag := frmSetOtdel.odsOtdel.FieldByName('FK_ID').AsInteger;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := frmSetOtdel.odsOtdel.FieldByName('FC_NAME').AsString;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            if rowAmbOtdel.Tag = -1 then
              begin
                rowAmbOtdel.Properties.ImageIndex := -1;
                rowAmbOtdel.Styles.Content := stNormal;
                rowAmbOtdel.Styles.Header := stNormal;
              end else
              begin
                rowAmbOtdel.Properties.ImageIndex := 4;
                rowAmbOtdel.Styles.Content := stBold;
                rowAmbOtdel.Styles.Header := stBold;
              end;
          end;
      finally
        frmSetOtdel.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      rowAmbOtdel.Tag := -1;
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      rowAmbOtdel.Properties.ImageIndex := -1;
      rowAmbOtdel.Styles.Content := stNormal;
      rowAmbOtdel.Styles.Header := stNormal;
    end;
end;

procedure TfrmMain.rowCompanyEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowCompany.Properties.Value = -1 then
    begin
      rowCompany.Properties.ImageIndex := -1;
      rowCompany.Styles.Content := stNormal;
      rowCompany.Styles.Header := stNormal;
    end else
    begin
      rowCompany.Properties.ImageIndex := 4;
      rowCompany.Styles.Content := stBold;
      rowCompany.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowHighHelpEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowHighHelp.Properties.Value = 0 then
    begin
      rowHighHelp.Properties.ImageIndex := -1;
      rowHighHelp.Styles.Content := stNormal;
      rowHighHelp.Styles.Header := stNormal;
    end else
    begin
      rowHighHelp.Properties.ImageIndex := 4;
      rowHighHelp.Styles.Content := stBold;
      rowHighHelp.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowIsslEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetUsl, frmSetUsl);
      frmSetUsl.dsList.DataSet := frmSetUsl.odsListUsl;
      frmSetUsl.ShowModal;
      if frmSetUsl.ModalResult = mrOk then
        begin
          rowIssl.Tag := frmSetUsl.dsList.DataSet.FieldByName('FK_ID').AsInteger;
          TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
          TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := frmSetUsl.dsList.DataSet.FieldByName('fc_name').AsString;
          TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
        end;
    end;
  if AButtonIndex = 1 then
    begin
      rowIssl.Tag := -1;
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
    end;
end;

procedure TfrmMain.rowKorenEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowKoren.Properties.Value = -1 then
    begin
      rowKoren.Properties.ImageIndex := -1;
      rowKoren.Styles.Content := stNormal;
      rowKoren.Styles.Header := stNormal;
    end else
    begin
      rowKoren.Properties.ImageIndex := 4;
      rowKoren.Styles.Content := stBold;
      rowKoren.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowKratnostEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowKratnost.Properties.Value = -1 then
    begin
      rowKratnost.Properties.ImageIndex := -1;
      rowKratnost.Styles.Content := stNormal;
      rowKratnost.Styles.Header := stNormal;
    end else
    begin
      rowKratnost.Properties.ImageIndex := 4;
      rowKratnost.Styles.Content := stBold;
      rowKratnost.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowKtoEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowKto.Properties.Value = -1 then
    begin
      rowKto.Properties.ImageIndex := -1;
      rowKto.Styles.Content := stNormal;
      rowKto.Styles.Header := stNormal;
    end else
    begin
      rowKto.Properties.ImageIndex := 4;
      rowKto.Styles.Content := stBold;
      rowKto.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowNadbavkaEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowNadbavka.Properties.Value = -1 then
    begin
      rowNadbavka.Properties.ImageIndex := -1;
      rowNadbavka.Styles.Content := stNormal;
      rowNadbavka.Styles.Header := stNormal;
    end else
    begin
      rowNadbavka.Properties.ImageIndex := 4;
      rowNadbavka.Styles.Content := stBold;
      rowNadbavka.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowNapravlenEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetNapravlen, frmSetNapravlen);
      try
        frmSetNapravlen.ShowModal;
        if frmSetNapravlen.ModalResult = MrOK then
          begin
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := frmSetNapravlen.odsKemNapravlen.FieldByName('FC_NAME').AsString;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            rowNapravlen.Tag := frmSetNapravlen.odsKemNapravlen.FieldByName('FK_ID').AsInteger;
            if rowNapravlen.Tag = -1 then
              begin
                rowNapravlen.Properties.ImageIndex := -1;
                rowNapravlen.Styles.Content := stNormal;
                rowNapravlen.Styles.Header := stNormal;
              end else
              begin
                rowNapravlen.Properties.ImageIndex := 4;
                rowNapravlen.Styles.Content := stBold;
                rowNapravlen.Styles.Header := stBold;
              end;
          end;
      finally
        frmSetNapravlen.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      rowNapravlen.Tag := -1;
      rowNapravlen.Properties.ImageIndex := -1;
      rowNapravlen.Styles.Content := stNormal;
      rowNapravlen.Styles.Header := stNormal;
    end;
end;

procedure TfrmMain.rowOtdelEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetOtdel, frmSetOtdel);
      try
        frmSetOtdel.ShowModal;
        if frmSetOtdel.ModalResult = mrOk then
          begin
            rowOtdel.Tag := frmSetOtdel.odsOtdel.FieldByName('FK_ID').AsInteger;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := frmSetOtdel.odsOtdel.FieldByName('FC_NAME').AsString;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            if rowOtdel.Tag = -1 then
              begin
                rowOtdel.Properties.ImageIndex := -1;
                rowOtdel.Styles.Content := stNormal;
                rowOtdel.Styles.Header := stNormal;
              end else
              begin
                rowOtdel.Properties.ImageIndex := 4;
                rowOtdel.Styles.Content := stBold;
                rowOtdel.Styles.Header := stBold;
              end;
          end;
      finally
        frmSetOtdel.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      rowOtdel.Tag := -1;
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      rowOtdel.Properties.ImageIndex := -1;
      rowOtdel.Styles.Content := stNormal;
      rowOtdel.Styles.Header := stNormal;
    end;
end;

procedure TfrmMain.rowOtmenaEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowOtmena.Properties.Value = -1 then
    begin
      rowOtmena.Properties.ImageIndex := -1;
      rowOtmena.Styles.Content := stNormal;
      rowOtmena.Styles.Header := stNormal;
    end else
    begin
      rowOtmena.Properties.ImageIndex := 4;
      rowOtmena.Styles.Content := stBold;
      rowOtmena.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowPacientEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSearch, frmSearch);
      try
        frmSearch.ShowModal;
        if frmSearch.ModalResult = mrOk then
          begin
            rowPacient.Tag := frmSearch.odsPac.FieldByName('FK_ID').AsInteger;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := frmSearch.odsPac.FieldByName('FIO').AsString;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          end;
      finally
        frmSearch.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      rowPacient.Tag := -1;
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
    end;
end;

procedure TfrmMain.rowPhoneEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowPhone.Properties.Value = 0 then
    begin
      rowPhone.Properties.ImageIndex := -1;
      rowPhone.Styles.Content := stNormal;
      rowPhone.Styles.Header := stNormal;
    end else
    begin
      rowPhone.Properties.ImageIndex := 4;
      rowPhone.Styles.Content := stBold;
      rowPhone.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowPlaceEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowPlace.Properties.Value = -1 then
    begin
      rowPlace.Properties.ImageIndex := -1;
      rowPlace.Styles.Content := stNormal;
      rowPlace.Styles.Header := stNormal;
    end else
    begin
      rowPlace.Properties.ImageIndex := 4;
      rowPlace.Styles.Content := stBold;
      rowPlace.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowPosleEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowPosle.Properties.Value = -1 then
    begin
      rowPosle.Properties.ImageIndex := -1;
      rowPosle.Styles.Content := stNormal;
      rowPosle.Styles.Header := stNormal;
    end else
    begin
      rowPosle.Properties.ImageIndex := 4;
      rowPosle.Styles.Content := stBold;
      rowPosle.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowSovpaloNapravEditPropertiesEditValueChanged(
  Sender: TObject);
begin
  if rowSovpaloNaprav.Properties.Value = -1 then
    begin
      rowSovpaloNaprav.Properties.ImageIndex := -1;
      rowSovpaloNaprav.Styles.Content := stNormal;
      rowSovpaloNaprav.Styles.Header := stNormal;
    end else
    begin
      rowSovpaloNaprav.Properties.ImageIndex := 4;
      rowSovpaloNaprav.Styles.Content := stBold;
      rowSovpaloNaprav.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowSovpaloZaklEditPropertiesEditValueChanged(
  Sender: TObject);
begin
  if rowSovpaloZakl.Properties.Value = -1 then
    begin
      rowSovpaloZakl.Properties.ImageIndex := -1;
      rowSovpaloZakl.Styles.Content := stNormal;
      rowSovpaloZakl.Styles.Header := stNormal;
    end else
    begin
      rowSovpaloZakl.Properties.ImageIndex := 4;
      rowSovpaloZakl.Styles.Content := stBold;
      rowSovpaloZakl.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowStatusEditPropertiesEditValueChanged(Sender: TObject);
begin
  VIEW.DataController.RecordCount := 0;
  aInfo.Enabled := False;
  aOpenMk.Enabled := False;
  aNaprav.Enabled := False;
  aProtocol.Enabled := False;
  aOtmena.Enabled := False;
  aPrint.Enabled := False;

  if rowStatus.Properties.Value = get_nazcancel then
    begin
      rowKoren.Visible := False;
      rowVidOplat.Visible := False;
      rowCompany.Visible := False;
      rowPlace.Visible := False;
      rowTypeNaz.Visible := False;
      rowNapravlen.Visible := False;
      rowTarget.Visible := False;
      rowKratnost.Visible := False;
      rowPhone.Visible := False;
      rowTypePlenka.Visible := False;
      rowNadbavka.Visible := False;
      rowKontrast.Visible := False;
      rowVvod.Visible := False;
      rowKto.Visible := False;
      rowSovpaloNaprav.Visible := False;
      rowPosle.Visible := False;
      rowSovpaloZakl.Visible := False;
      rowZakl.Visible := False;
      rowWork.Visible := False;
      rowOtmena.Visible := True;

      rowKoren.Properties.Value := -1;
      rowKoren.Properties.ImageIndex := -1;
      rowKoren.Styles.Content := stNormal;
      rowKoren.Styles.Header := stNormal;

      rowVidOplat.Properties.Value := -1;
      rowVidOplat.Properties.ImageIndex := -1;
      rowVidOplat.Styles.Content := stNormal;
      rowVidOplat.Styles.Header := stNormal;

      rowPlace.Properties.Value := -1;
      rowPlace.Properties.ImageIndex := -1;
      rowPlace.Styles.Content := stNormal;
      rowPlace.Styles.Header := stNormal;

      rowTypeNaz.Properties.Value := -1;
      rowTypeNaz.Properties.ImageIndex := -1;
      rowTypeNaz.Styles.Content := stNormal;
      rowTypeNaz.Styles.Header := stNormal;

      rowNapravlen.Tag := -1;
      rowNapravlen.Properties.Value := null;
      rowNapravlen.Properties.ImageIndex := -1;
      rowNapravlen.Styles.Content := stNormal;
      rowNapravlen.Styles.Header := stNormal;

      rowTarget.Properties.Value := -1;
      rowTarget.Properties.ImageIndex := -1;
      rowTarget.Styles.Content := stNormal;
      rowTarget.Styles.Header := stNormal;

      rowKratnost.Properties.Value := -1;
      rowKratnost.Properties.ImageIndex := -1;
      rowKratnost.Styles.Content := stNormal;
      rowKratnost.Styles.Header := stNormal;

      rowPhone.Properties.Value := 0;
      rowPhone.Properties.ImageIndex := -1;
      rowPhone.Styles.Content := stNormal;
      rowPhone.Styles.Header := stNormal;

      rowNadbavka.Properties.Value := -1;
      rowNadbavka.Properties.ImageIndex := -1;
      rowNadbavka.Styles.Content := stNormal;
      rowNadbavka.Styles.Header := stNormal;

      rowKontrast.Tag := -1;
      rowKontrast.Properties.Value := null;
      rowKontrast.Properties.ImageIndex := -1;
      rowKontrast.Styles.Content := stNormal;
      rowKontrast.Styles.Header := stNormal;

      rowVvod.Properties.Value := -1;
      rowVvod.Properties.ImageIndex := -1;
      rowVvod.Styles.Content := stNormal;
      rowVvod.Styles.Header := stNormal;

      rowKto.Properties.Value := -1;
      rowKto.Properties.ImageIndex := -1;
      rowKto.Styles.Content := stNormal;
      rowKto.Styles.Header := stNormal;

      rowSovpaloNaprav.Properties.Value := -1;
      rowSovpaloNaprav.Properties.ImageIndex := -1;
      rowSovpaloNaprav.Styles.Content := stNormal;
      rowSovpaloNaprav.Styles.Header := stNormal;

      rowPosle.Properties.Value := -1;
      rowPosle.Properties.ImageIndex := -1;
      rowPosle.Styles.Content := stNormal;
      rowPosle.Styles.Header := stNormal;

      rowSovpaloZakl.Properties.Value := -1;
      rowSovpaloZakl.Properties.ImageIndex := -1;
      rowSovpaloZakl.Styles.Content := stNormal;
      rowSovpaloZakl.Styles.Header := stNormal;

      rowZakl.Tag := -1;
      rowZakl.Properties.Value := null;
      rowZakl.Properties.ImageIndex := -1;
      rowZakl.Styles.Content := stNormal;
      rowZakl.Styles.Header := stNormal;

      rowWork.Tag := -1;
      rowWork.Properties.Value := null;
      rowWork.Properties.ImageIndex := -1;
      rowWork.Styles.Content := stNormal;
      rowWork.Styles.Header := stNormal;

      aNaprav.Visible := False;
      aProtocol.Visible := False;
      aOtmena.Visible := True;
      viewnum.Visible := False;
      VIEWREASONCANCEL.Visible := True;
      VIEW_DOZA.Visible := False; 

      VIEW_FD_RUN.Caption := 'Дата отмены';
    end else
    begin
      rowKoren.Visible := True;
      rowVidOplat.Visible := True;
      rowCompany.Visible := True;
      rowPlace.Visible := True;
      rowTypeNaz.Visible := True;
      rowNapravlen.Visible := True;
      rowTarget.Visible := True;
      rowKratnost.Visible := True;
      rowPhone.Visible := True;
      rowTypePlenka.Visible := True;
      rowNadbavka.Visible := True;
      rowKontrast.Visible := True;
      rowVvod.Visible := True;
      rowKto.Visible := True;
      rowSovpaloNaprav.Visible := True;
      rowPosle.Visible := True;
      rowSovpaloZakl.Visible := True;
      rowZakl.Visible := rowKabinet.Properties.Value <> get_xray_flukab;
      rowWork.Visible := True;
      rowOtmena.Visible := False;

      rowOtmena.Properties.Value := -1;
      rowOtmena.Properties.ImageIndex := -1;
      rowOtmena.Styles.Content := stNormal;
      rowOtmena.Styles.Header := stNormal;

      aNaprav.Visible := True;
      aProtocol.Visible := True;
      aOtmena.Visible := False;
      viewnum.Visible := True;
      VIEWREASONCANCEL.Visible := False;
      VIEW_DOZA.Visible := True;

      VIEW_FD_RUN.Caption := 'Дата вып.';
    end;
end;

procedure TfrmMain.rowTargetEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowTarget.Properties.Value = -1 then
    begin
      rowTarget.Properties.ImageIndex := -1;
      rowTarget.Styles.Content := stNormal;
      rowTarget.Styles.Header := stNormal;
    end else
    begin
      rowTarget.Properties.ImageIndex := 4;
      rowTarget.Styles.Content := stBold;
      rowTarget.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowTypeNazEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowTypeNaz.Properties.Value = -1 then
    begin
      rowTypeNaz.Properties.ImageIndex := -1;
      rowTypeNaz.Styles.Content := stNormal;
      rowTypeNaz.Styles.Header := stNormal;
    end else
    begin
      rowTypeNaz.Properties.ImageIndex := 4;
      rowTypeNaz.Styles.Content := stBold;
      rowTypeNaz.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowTypePacEditPropertiesChange(Sender: TObject);
begin
  rowHighHelp.Visible := rowTypePac.Properties.Value <> -1;
  if rowTypePac.Properties.Value = -1 then
    begin
      rowHighHelp.Properties.Value := 0;
      rowHighHelp.Properties.ImageIndex := -1;
      rowHighHelp.Styles.Content := stNormal;
      rowHighHelp.Styles.Header := stNormal;
    end;
end;

procedure TfrmMain.rowTypePlenkaEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowTypePlenka.Properties.Value = -1 then
    begin
      rowTypePlenka.Properties.ImageIndex := -1;
      rowTypePlenka.Styles.Content := stNormal;
      rowTypePlenka.Styles.Header := stNormal;
    end else
    begin
      rowTypePlenka.Properties.ImageIndex := 4;
      rowTypePlenka.Styles.Content := stBold;
      rowTypePlenka.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowVidOplatEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowVidOplat.Properties.Value = -1 then
    begin
      rowVidOplat.Properties.ImageIndex := -1;
      rowVidOplat.Styles.Content := stNormal;
      rowVidOplat.Styles.Header := stNormal;
      rowCompany.Visible := False;
      rowCompany.Properties.Value := -1;
      rowCompany.Properties.ImageIndex := -1;
      rowCompany.Styles.Content := stNormal;
      rowCompany.Styles.Header := stNormal;
    end else
    begin
      if rowVidOplat.Properties.Value = GET_VIDOPL_DOGOVOR then
        begin
          rowCompany.Visible := True
        end else
        begin
          rowCompany.Visible := False;
          rowCompany.Properties.Value := -1;
          rowCompany.Properties.ImageIndex := -1;
          rowCompany.Styles.Content := stNormal;
          rowCompany.Styles.Header := stNormal;
        end;
      rowVidOplat.Properties.ImageIndex := 4;
      rowVidOplat.Styles.Content := stBold;                 
      rowVidOplat.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowVvodEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowVvod.Properties.Value = -1 then
    begin
      rowVvod.Properties.ImageIndex := -1;
      rowVvod.Styles.Content := stNormal;
      rowVvod.Styles.Header := stNormal;
    end else
    begin
      rowVvod.Properties.ImageIndex := 4;
      rowVvod.Styles.Content := stBold;
      rowVvod.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowWorkEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmWork, frmWork);
      try
        frmWork.ShowModal;
        if frmWork.ModalResult = mrOk then
          begin
            rowWork.Tag := frmWork.odsWork.FieldByName('FK_ID').AsInteger;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := frmWork.odsWork.FieldByName('FC_NAME').AsString;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
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
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      rowWork.Properties.ImageIndex := -1;
      rowWork.Styles.Content := stNormal;
      rowWork.Styles.Header := stNormal;
    end;
end;

procedure TfrmMain.rowZaklEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmZakl, frmZakl);
      try
        frmZakl.DoShowForm;
        frmZakl.ShowModal;
        if frmZakl.ModalResult = MrOk then
          begin
            rowZakl.Tag := frmZakl.odsTree.FieldByName('FK_ID').AsInteger;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := frmZakl.odsTree.FieldByName('FC_NAME').AsString;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            if rowZakl.Tag = -1 then
              begin
                rowZakl.Properties.ImageIndex := -1;
                rowZakl.Styles.Content := stNormal;
                rowZakl.Styles.Header := stNormal;
              end else
              begin
                rowZakl.Properties.ImageIndex := 4;
                rowZakl.Styles.Content := stBold;
                rowZakl.Styles.Header := stBold;
              end;
          end;
      finally
        frmZakl.Free;
      end;
  end;
  if AButtonIndex = 1 then
    begin
      rowZakl.Tag := -1;
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      rowZakl.Properties.ImageIndex := -1;
      rowZakl.Styles.Content := stNormal;
      rowZakl.Styles.Header := stNormal;
    end;
end;

procedure TfrmMain.tmrCheckApplicationTimer(Sender: TObject);
var Wnd               : hWnd;
    buff              : array[0..127] of Char;
    i, j, iDel        : Integer;
begin
  Application.ProcessMessages;
  if not(tmrCheckApplication.Enabled) then exit;
  iDel:=0;
  for i:=0 to Length(arFIO)-1 do
  begin
    Wnd := GetWindow(Handle, gw_HWndFirst);
    while Wnd <> 0 do
    begin
      if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
        begin
          GetWindowText(Wnd, buff, sizeof(buff));
          if StrPas(buff) = arFIO[i-iDel] then
            begin
              if IsWindowVisible(Wnd) then
              begin
                  for j:=i-iDel to Length(arFIO)-2 do
                  begin
                    arFIO[j]:=arFio[j+1];
                  end;
                  SetLength(arFIO,Length(arFIO)-1);
                  Inc(iDel);
                  if Length(arFIO) = 0 then
                  begin
                    tmrCheckApplication.Enabled:=False;
                    Screen.Cursor:=crDefault;
                    aOpenMK.Enabled:=True;
                    Exit;
                  end;
                  Break;
              end;
            end;
        end;
      Wnd := GetWindow(Wnd, gw_hWndNext);
    end;
  end;
end;

procedure TfrmMain.VerticalGridEditorRow1EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetKontrast, frmSetKontrast);
      try
        frmSetKontrast.ShowModal;
        if frmSetKontrast.ModalResult = MrOk then
          begin
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := frmSetKontrast.odsTypeKontrast.FieldByName('FC_NAME').AsString;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            rowKontrast.Tag := frmSetKontrast.odsTypeKontrast.FieldByName('FK_ID').AsInteger;
            if rowKontrast.Tag = -1 then
              begin
                rowKontrast.Properties.ImageIndex := -1;
                rowKontrast.Styles.Content := stNormal;
                rowKontrast.Styles.Header := stNormal;
              end else
              begin
                rowKontrast.Properties.ImageIndex := 4;
                rowKontrast.Styles.Content := stBold;
                rowKontrast.Styles.Header := stBold;
              end;
          end;
      finally
        frmSetKontrast.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      rowKontrast.Tag := -1;
      rowKontrast.Properties.ImageIndex := -1;
      rowKontrast.Styles.Content := stNormal;
      rowKontrast.Styles.Header := stNormal;
    end;
end;

//function TfrmMain.WinExecAndWait32(FileName: string; Visibility: integer): integer;
//var zAppName: array[0..512] of char;
//    zCurDir: array[0..255] of char;
//    WorkDir: string;
//    StartupInfo: TStartupInfo;
//    ProcessInfo: TProcessInformation;
//begin
//  StrPCopy(zAppName, FileName);
//  GetDir(0, WorkDir);
//  StrPCopy(zCurDir, FileName);
//  FillChar(StartupInfo, Sizeof(StartupInfo), #0);
//  StartupInfo.cb := Sizeof(StartupInfo);
//  StartupInfo.hStdInput := 23999;
//  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
//  StartupInfo.wShowWindow := Visibility;
//  if not CreateProcess(nil,
//         zAppName, { указатель командной строки }
//         nil, { указатель на процесс атрибутов безопасности }
//         nil, { указатель на поток атрибутов безопасности }
//         false, { флаг родительского обработчика }
//         CREATE_NEW_CONSOLE or { флаг создания }
//         NORMAL_PRIORITY_CLASS,
//         nil, { указатель на новую среду процесса }
//         nil, { указатель на имя текущей директории }
//         StartupInfo, { указатель на STARTUPINFO }
//         ProcessInfo) then Result := -1 { указатель на PROCESS_INF }
//  else begin
//      Result := ProcessInfo.dwProcessId;
//  end;
//end;

end.
