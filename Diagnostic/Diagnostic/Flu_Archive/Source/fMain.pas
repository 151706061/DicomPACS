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
  cxGridExportLink, uGlobalConst, SMMainAPI, cxSpinEdit, cxImageComboBox, Clipbrd, dxPSUtl,
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
    ilSmall: TcxImageList;
    odsKorennoe: TOracleDataSet;
    dsKorennoe: TDataSource;
    cxStyleRepository1: TcxStyleRepository;
    stNormal: TcxStyle;
    stBold: TcxStyle;
    cxStyle1: TcxStyle;
    odsRegPrin: TOracleDataSet;
    dsRegPrin: TDataSource;
    odsTypeNaz: TOracleDataSet;
    dsTypeNaz: TDataSource;
    odsTarget: TOracleDataSet;
    dsTarget: TDataSource;
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
    odsPriem: TOracleDataSet;
    dsPriem: TDataSource;
    odsApparat: TOracleDataSet;
    dsApparat: TDataSource;
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
    rowCategoryAnother: TcxCategoryRow;
    rowKoren: TcxEditorRow;
    rowPlace: TcxEditorRow;
    rowTypeNaz: TcxEditorRow;
    rowTarget: TcxEditorRow;
    rowPriem: TcxEditorRow;
    rowApparat: TcxEditorRow;
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
    frxFlu: TfrxReport;
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
    rowIssl: TcxEditorRow;
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
    tmrCheckApplication: TTimer;
    dxMemData1NUMBER_ISSL: TStringField;
    VIEWNUM: TcxGridColumn;
    dsList: TDataSource;
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
    rowZakl1: TcxEditorRow;
    rowZakl2: TcxEditorRow;
    VIEWREASONCANCEL: TcxGridColumn;
    dxMemData1FC_RES: TStringField;
    dxMemData1FD_ROJD: TDateField;
    VIEW_ROJD: TcxGridColumn;
    dxMemData1DOZA: TFloatField;
    VIEW_DOZA: TcxGridColumn;
    rowWork: TcxEditorRow;
    rowCategory: TcxEditorRow;
    rowUch: TcxEditorRow;
    rowPeriod: TcxEditorRow;
    odsPeriodSpisok: TOracleDataSet;
    dsPeriodSpisok: TDataSource;
    VIEW_ADR: TcxGridColumn;
    dxMemData1ADR: TStringField;
    rowCat: TcxEditorRow;
    odsCat: TOracleDataSet;
    dsCat: TDataSource;
    rowDates: TcxEditorRow;
    rowOpl: TcxEditorRow;
    odsVidOplat: TOracleDataSet;
    dsVidOplat: TDataSource;
    odsCntPepl: TOracleDataSet;
    VIEW_CNTTUB: TcxGridColumn;
    ilCntTub: TImageList;
    dxMemData1CNTTUB: TIntegerField;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    VIEW_CAT: TcxGridColumn;
    dxMemData1CAT: TStringField;
    dxMemData1uch: TStringField;
    VIEWUCH: TcxGridColumn;
    dxMemData1ADR_F: TStringField;
    VIEW_ADRFACT: TcxGridColumn;
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aRefreshExecute(Sender: TObject);
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure odsKabBeforeOpen(DataSet: TDataSet);
    procedure rowKorenEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowPlaceEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowTypeNazEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowTargetEditPropertiesEditValueChanged(Sender: TObject);
    procedure aClearFilterExecute(Sender: TObject);
    procedure aSaveFilterExecute(Sender: TObject);
    procedure aLoadFilterExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure rowPriemEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowApparatEditPropertiesEditValueChanged(Sender: TObject);
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
    procedure frxFluGetValue(const VarName: string; var Value: Variant);
    procedure frxNapravGetValue(const VarName: string; var Value: Variant);
    procedure rowIsslEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure aOpenMKExecute(Sender: TObject);
    procedure aInfoExecute(Sender: TObject);
    procedure tmrCheckApplicationTimer(Sender: TObject);
    procedure rowStatusEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowOtmenaEditPropertiesEditValueChanged(Sender: TObject);
    procedure aOtmenaExecute(Sender: TObject);
    procedure frxListCancelGetValue(const VarName: string; var Value: Variant);
    procedure rowZakl1EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowZakl2EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowWorkEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowCategoryEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowUchEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowPeriodEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowDatesEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowPeriodFromEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowPeriodToEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowOplEditPropertiesEditValueChanged(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure rowCatEditPropertiesEditValueChanged(Sender: TObject);
  private
    nRec : Integer;
    Russian : HKL;
    get_oneinyear, get_twoinyear : Integer;
    get_vipnaz, get_nazcancel, get_xray_flukab, get_nevip, get_pass_registrator : Integer;
    arFIO:array of string;
//    AppHandle : Integer;
    pAPPSOTRID : Integer;
    sParams, sSpec : string;
    GET_VIDOPL_DOGOVOR : Integer;
    pPACID, pPEPLID : Integer;
    sProjivaet_4rep, sSex_4rep, sAddress_4rep, sPhone_4rep, sKabName_4rep,
    sKabPhone_4rep, sLabName_4rep, sKoren_4rep, sOpl_4rep, sTarget_4rep, sPriem_4rep,
    sApparat_4rep : string;
    sVrach_4rep, sNadbavka_4rep, sUrgent_4rep, sDS_4rep, sKem_4Rep : string;
    nAge_4rep : Integer;
    GET_ISSL_FLU : Integer;
    dDateBirth_4Rep : TDateTime;
    nDoza_4Rep : Double;
    sTextIssl_4rep, sNumIssl_4rep, sNumIB_4rep, sDateRunStr_4Rep : string;
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
    get_db_name : string;
    get_xray_mrt : Integer;
    sCompanyName_4Rep : string;
    sOtdelName_4Rep : string;
    MedotradeSign : string;
    pSOTRID : Integer;
    procedure DoShowMainForm;
    { Public declarations }
  end;

const
  sqlList = ' SELECT FK_ID, '+#13+
            '        FK_PACID, '+#13+
            '        FK_NAZSOSID, '+#13+
            '        ASU.GET_IB(TNAZIS.FK_PACID) AS NUMMK, '+#13+
            '        FD_NAZ, TO_CHAR(FD_NAZ, ''DD.MM.YYYY HH24:MI'') AS FD_NAZ_STR, '+#13+
            '        FD_RUN, TO_CHAR(FD_RUN, ''DD.MM.YYYY HH24:MI'') AS FD_RUN_STR, '+#13+
            '        ASU.PKG_REGIST_PACFUNC.GET_PAC_FULLFIO(FK_PACID) AS FIOPAC, '+#13+
            '        (SELECT trunc(FD_ROJD) FROM ASU.TPEOPLES WHERE FK_ID = (SELECT FK_PEPLID FROM ASU.TKARTA WHERE FK_ID = TNAZIS.FK_PACID '+#13+
            '                                                                UNION ALL '+#13+
            '                                                                SELECT FK_PEPLID FROM ASU.TAMBULANCE WHERE FK_ID = TNAZIS.FK_PACID)) as FD_ROJD, '+#13+
            '        ASU.GET_NAME_RGISSL(FK_SMID) AS NAMEISSL, '+#13+
            '        ASU.DO_VRACHFIO(TNAZIS.FK_ISPOLID) AS VRACHFIO, '+#13+
            '        ASU.GET_PEPLID(FK_PACID) AS PEPLID, '+#13+
            '        (SELECT FC_CHAR '+#13+
            '           FROM ASU.TIB '+#13+
            '          WHERE FK_PACID = TNAZIS.FK_ID '+#13+
            '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_FLU_NUMBER'')) AS NUMBER_ISSL, '+#13+
            '        '''' as fc_res, '+#13+
            '        (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA, '+#13+
            '        asu.get_adr_by_peplid_level_street(ASU.GET_PEPLID(FK_PACID)) as adr, '+#13+
            '        asu.get_adr_by_peplid_lev_street_f(ASU.GET_PEPLID(FK_PACID)) as adr_fact, '+#13+
            '        (select max(1) from asu.tnazis t where t.fk_pacid = asu.get_peplid(tnazis.fk_pacid) and t.fk_smid = asu.get_xray_tubdispancer '+#13+
            '         and sysdate >= t.fd_naz and (sysdate < to_date(t.fd_run)+1 or t.fd_run is null)) as cnttub, '+#13+
            '        (select asu.get_smidname(fk_smid) '+#13+
            '           from asu.tib '+#13+
            '          where fk_pacid = asu.get_peplid(tnazis.fk_pacid) '+#13+
            '            and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''FLU_PERIOD_CATEGORY'' connect by prior fk_id = fk_owner)) as categ, '+#13+
            '        asu.get_area_for_xray(asu.get_peplid(tnazis.fk_pacid)) as uch '+#13+
            '   FROM ASU.TNAZIS '+#13+
            '  WHERE FD_RUN >= :PDATE1 '+#13+
            '    AND FD_RUN <= :PDATE2 '+#13+
            '    AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+#13+
            '                     WHERE FL_SHOWANAL = 1 '+#13+
            '                    START WITH FC_SYNONIM = ''ISSLED_FLUROGR'' '+#13+
            '                    CONNECT BY PRIOR FK_ID = FK_OWNER) '+#13+
            '    AND FK_NAZSOSID = :PFK_NAZSOSID ';
  sqlListCancel = ' SELECT tnazis.FK_ID, '+#13+
            '        tnazis.FK_PACID, '+#13+
            '        tnazis.FK_NAZSOSID, '+#13+
            '        ASU.GET_IB(TNAZIS.FK_PACID) AS NUMMK, '+#13#10+
            '        FD_NAZ, TO_CHAR(tnazis.FD_NAZ, ''DD.MM.YYYY HH24:MI'') AS FD_NAZ_STR, '+#13+
            '        FD_RUN, TO_CHAR(tnazis.FD_RUN, ''DD.MM.YYYY HH24:MI'') AS FD_RUN_STR, '+#13+
            '        vres.fd_ins as DATE_CANCEL, '+#13#10+
            '        ASU.PKG_REGIST_PACFUNC.GET_PAC_FULLFIO(tnazis.FK_PACID) AS FIOPAC, '+#13+
            '        (SELECT trunc(FD_ROJD) FROM ASU.TPEOPLES WHERE FK_ID = (SELECT FK_PEPLID FROM ASU.TKARTA WHERE FK_ID = TNAZIS.FK_PACID '+#13+
            '                                                                UNION ALL '+#13+
            '                                                                SELECT FK_PEPLID FROM ASU.TAMBULANCE WHERE FK_ID = TNAZIS.FK_PACID)) as FD_ROJD, '+#13+
            '        ASU.GET_NAME_RGISSL(tnazis.FK_SMID) AS NAMEISSL, '+#13+
            '        ASU.DO_VRACHFIO(TNAZIS.FK_ISPOLID) AS VRACHFIO, '+#13+
            '        ASU.GET_PEPLID(tnazis.FK_PACID) AS PEPLID, '+#13+
            '        '''' AS NUMBER_ISSL, '+#13#10+
            '        vres.fc_res, '+#13+
            '        0 as doza, '+#13+
            '        asu.get_adr_by_peplid_level_street(ASU.GET_PEPLID(TNAZIS.FK_PACID)) as adr, '+#13+
            '        asu.get_adr_by_peplid_lev_street_f(ASU.GET_PEPLID(FK_PACID)) as adr_fact, '+#13+
            '        (select max(1) from asu.tnazis t where t.fk_pacid = asu.get_peplid(tnazis.fk_pacid) and t.fk_smid = asu.get_xray_tubdispancer '+#13+
            '         and sysdate >= t.fd_naz and (sysdate < to_date(t.fd_run)+1 or t.fd_run is null)) as cnttub, '+#13+
            '        (select asu.get_smidname(fk_smid) '+#13+
            '           from asu.tib '+#13+
            '          where fk_pacid = asu.get_peplid(tnazis.fk_pacid) '+#13+
            '            and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''FLU_PERIOD_CATEGORY'' connect by prior fk_id = fk_owner)) as categ, '+#13+
            '        asu.get_area_for_xray(asu.get_peplid(tnazis.fk_pacid)) as uch '+#13+
            '   FROM ASU.TNAZIS, asu.vres '+#13+
            '  WHERE tnazis.FD_RUN >= :PDATE1 '+#13+
            '    AND tnazis.FD_RUN <= :PDATE2 '+#13+
            '    and tnazis.fk_id = vres.fk_nazid '+#13+
            '    AND tnazis.FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+#13+
            '                            WHERE FL_SHOWANAL = 1 '+#13+
            '                           START WITH FC_SYNONIM = ''ISSLED_FLUROGR'' '+#13+
            '                           CONNECT BY PRIOR FK_ID = FK_OWNER) '+#13+
            '    AND tnazis.FK_NAZSOSID = :PFK_NAZSOSID ';

  sqlListCount = ' select count(distinct asu.get_peplid(fk_pacid)) as cnt '+#13+
                 '   from asu.tnazis '+#13+
                 '  where tnazis.fd_run >= :pdate1 '+#13+
                 '    and tnazis.fd_run <= :pdate2 '+#13+
                 '    and tnazis.fk_smid in (select fk_id from asu.tsmid where fl_showanal = 1 '+#13+
                 '                           start with fc_synonim = ''ISSLED_FLUROGR'' '+#13+
                 '                           connect by prior fk_id = fk_owner) '+#13+
                 '    and tnazis.fk_nazsosid = :pfk_nazsosid ';

  sqlListPass = ' SELECT FK_ID, '+#13+
                '        FK_PACID, '+#13+
                '        FK_NAZSOSID, '+#13+
                '        ASU.GET_IB(vnaz.FK_PACID) AS NUMMK, '+#13+
                '        FD_NAZ, TO_CHAR(FD_NAZ, ''DD.MM.YYYY HH24:MI'') AS FD_NAZ_STR, '+#13+
                '        FD_RUN, TO_CHAR(FD_RUN, ''DD.MM.YYYY HH24:MI'') AS FD_RUN_STR, '+#13+
                '        ASU.PKG_REGIST_PACFUNC.GET_PAC_FULLFIO(FK_PACID) AS FIOPAC, '+#13+
                '        (SELECT trunc(FD_ROJD) FROM ASU.TPEOPLES WHERE FK_ID = (SELECT FK_PEPLID FROM ASU.TKARTA WHERE FK_ID = vnaz.FK_PACID '+#13+
                '                                                                UNION ALL '+#13+
                '                                                                SELECT FK_PEPLID FROM ASU.TAMBULANCE WHERE FK_ID = vnaz.FK_PACID)) as FD_ROJD, '+#13+
                '        ASU.GET_NAME_RGISSL(FK_SMID) AS NAMEISSL, '+#13+
                '        ASU.DO_VRACHFIO(vnaz.FK_ISPOLID) AS VRACHFIO, '+#13+
                '        ASU.GET_PEPLID(FK_PACID) AS PEPLID, '+#13+
                '        (SELECT FC_CHAR '+#13+
                '           FROM ASU.TIB '+#13+
                '          WHERE FK_PACID = vnaz.FK_ID '+#13+
                '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_FLU_NUMBER'')) AS NUMBER_ISSL, '+#13+
                '        '''' as fc_res, '+#13+
                '        (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = vnaz.FK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA, '+#13+
                '        asu.get_adr_by_peplid_level_street(ASU.GET_PEPLID(FK_PACID)) as adr, '+#13+
                '        asu.get_adr_by_peplid_lev_street_f(ASU.GET_PEPLID(FK_PACID)) as adr_fact, '+#13+
                '        (select max(1) from asu.tnazis t where t.fk_pacid = asu.get_peplid(vnaz.fk_pacid) and t.fk_smid = asu.get_xray_tubdispancer '+#13+
                '         and sysdate >= t.fd_naz and (sysdate < to_date(t.fd_run)+1 or t.fd_run is null)) as cnttub, '+#13+
                '        (select asu.get_smidname(fk_smid) '+#13+
                '           from asu.tib '+#13+
                '          where fk_pacid = asu.get_peplid(vnaz.fk_pacid) '+#13+
                '            and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''FLU_PERIOD_CATEGORY'' connect by prior fk_id = fk_owner)) as categ, '+#13+
                '        asu.get_area_for_xray(asu.get_peplid(vnaz.fk_pacid)) as uch '+#13+
                '   FROM ASU.VNAZ '+#13+
                '  WHERE FD_RUN >= :PDATE1 '+#13+
                '    AND FD_RUN <= :PDATE2 '+#13+
                '    AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+#13+
                '                     WHERE FL_SHOWANAL = 1 '+#13+
                '                    START WITH FC_SYNONIM = ''ISL_RENTGN'' '+#13+
                '                    CONNECT BY PRIOR FK_ID = FK_OWNER) '+#13+
                '    AND FK_NAZSOSID = :PFK_NAZSOSID ';

  sqlListCountPass = ' select count(distinct asu.get_peplid(fk_pacid)) as cnt '+#13+
                     '   from asu.tnazis '+#13+
                     '  where tnazis.fd_run >= :pdate1 '+#13+
                     '    and tnazis.fd_run <= :pdate2 '+#13+
                     '    and tnazis.fk_smid in (select fk_id from asu.tsmid where fl_showanal = 1 '+#13+
                     '                           start with fc_synonim = ''ISL_RENTGN'' '+#13+
                     '                           connect by prior fk_id = fk_owner) '+#13+
                     '    and tnazis.fk_nazsosid = :pfk_nazsosid ';

var
  frmMain: TfrmMain;

implementation
uses uPeriod, fZakl, fNazRgOne1, fWait, fPacInfo, fOtmena, fWork, fSetUch;
{$R *.dfm}

procedure TfrmMain.aClearFilterExecute(Sender: TObject);
begin
  if Application.MessageBox('Вы действительно хотите очистить настройки фильтра?', 'Вопрос', MB_YESNO) = mrYes then
    begin
      rowKabinet.Properties.Value := -1;
      merAge.Properties.Editors[0].Value := 0;
      merAge.Properties.Editors[1].Value := 0;
      rowIssl.Tag := -1;
      rowIssl.Properties.Value := null;

      rowKoren.Properties.Value := -1;
      rowKoren.Properties.ImageIndex := -1;
      rowKoren.Styles.Content := stNormal;
      rowKoren.Styles.Header := stNormal;

      rowPlace.Properties.Value := -1;
      rowPlace.Properties.ImageIndex := -1;
      rowPlace.Styles.Content := stNormal;
      rowPlace.Styles.Header := stNormal;

      rowTypeNaz.Properties.Value := -1;
      rowTypeNaz.Properties.ImageIndex := -1;
      rowTypeNaz.Styles.Content := stNormal;
      rowTypeNaz.Styles.Header := stNormal;

      rowTarget.Properties.Value := -1;
      rowTarget.Properties.ImageIndex := -1;
      rowTarget.Styles.Content := stNormal;
      rowTarget.Styles.Header := stNormal;

      rowPriem.Properties.Value := -1;
      rowPriem.Properties.ImageIndex := -1;
      rowPriem.Styles.Content := stNormal;
      rowPriem.Styles.Header := stNormal;

      rowApparat.Properties.Value := -1;
      rowApparat.Properties.ImageIndex := -1;
      rowApparat.Styles.Content := stNormal;
      rowApparat.Styles.Header := stNormal;

      rowWork.Tag := -1;
      rowWork.Properties.Value := null;
      rowWork.Properties.ImageIndex := -1;
      rowWork.Styles.Content := stNormal;
      rowWork.Styles.Header := stNormal;

      rowOtmena.Properties.Value := -1;
      rowOtmena.Properties.ImageIndex := -1;
      rowOtmena.Styles.Content := stNormal;
      rowOtmena.Styles.Header := stNormal;

      rowCategory.Properties.Value := 0;
      rowCategory.Properties.ImageIndex := -1;
      rowCategory.Styles.Content := stNormal;
      rowCategory.Styles.Header := stNormal;

      rowUch.Tag := -1;
      rowUch.Properties.Value := null;
      rowUch.Properties.ImageIndex := -1;
      rowUch.Styles.Content := stNormal;
      rowUch.Styles.Header := stNormal;

      rowPeriod.Properties.Value := -1;
      rowPeriod.Properties.ImageIndex := -1;
      rowPeriod.Styles.Content := stNormal;
      rowPeriod.Styles.Header := stNormal;

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
                             '');
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
var ods, odsFlu : TOracleDataSet;
    pType : string;
//    isAmb : Integer;
begin
  ods := TOracleDataSet.Create(nil);   
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_PACID, FC_TYPE, '+#13+
                    '        ASU.GET_PEPLID(FK_PACID) AS PEPLID, '+#13+
                    '        ASU.IS_AMBULANCE(FK_PACID) AS IS_AMB, '+#13+
                    '        ASU.GET_IB(FK_PACID) AS NUMIB, '+#13+
                    '        DECODE(ASU.GET_OWNER_FROM_SMID(TNAZIS.FK_SMID), '+#13+
                    '               ASU.GET_XRAY_FLU, '+#13+
                    '               (SELECT MAX(FC_CHAR) '+#13+
                    '                  FROM ASU.TIB '+#13+
                    '                 WHERE FK_PACID = TNAZIS.FK_ID '+#13+
                    '                   AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_FLU_NUMBER'')), '+#13+
                    '               (SELECT MAX(FC_CHAR) '+#13+
                    '                  FROM ASU.TIB '+#13+
                    '                 WHERE FK_PACID = TNAZIS.FK_ID '+#13+
                    '                   AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL''))) AS NUMBER_ISSL, '+#13+
                    '        (SELECT FD_ROJD FROM ASU.TPEOPLES WHERE FK_ID = (SELECT FK_PEPLID FROM ASU.TKARTA WHERE FK_ID = TNAZIS.FK_PACID '+#13+
                    '                                                         UNION '+#13+
                    '                                                         SELECT FK_PEPLID FROM ASU.TAMBULANCE WHERE FK_ID = TNAZIS.FK_PACID)) FD_ROJD '+#13+
                    '   FROM ASU.TNAZIS '+#13+
                    '  WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_FK_ID.Index]);
    ods.Open;
    pPACID := ods.FieldByName('FK_PACID').AsInteger;
    pPEPLID := ods.FieldByName('PEPLID').AsInteger;
    pType := ods.FieldByName('FC_TYPE').AsString;
//    isAmb := ods.FieldByName('IS_AMB').AsInteger;
    sNumIssl_4rep := ods.FieldByName('NUMBER_ISSL').AsString;
    sNumIB_4rep := ods.FieldByName('NUMIB').AsString;
    dDateBirth_4Rep := ods.FieldByName('FD_ROJD').AsDateTime;

    odsFlu := TOracleDataSet.Create(nil);
    try
      odsFlu.Session := os;
      odsFlu.Cursor := crSQLWait;
      odsFlu.SQL.Text := ' SELECT ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TNAZIS.FK_PACID) AS PACAGE, '+
                         '        ASU.PKG_REGIST_PACFUNC.GET_PAC_SEX(TNAZIS.FK_PACID) AS SEX, '+
                         '        ASU.GET_ADDR_STR_BY_ID(ASU.PKG_REGIST_PACFUNC.GET_PAC_ADRID(TNAZIS.FK_PACID)) AS ADDRESS, '+
                         '        (SELECT FC_CHAR '+
                         '           FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID '+
                         '                          AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''KONTAKT_PHONE'')) AS PHONE, '+
                         '        (SELECT FC_NAME FROM ASU.TKABINET WHERE FK_ID = TNAZIS.FK_ROOMID) AS KABNAME, '+
                         '        (SELECT FC_PHONE FROM ASU.TKABINET WHERE FK_ID = TNAZIS.FK_ROOMID) AS KABPHONE, '+
                         '        (SELECT ASU.DO_VRACHFIO(FN_NUM) '+
                         '           FROM ASU.TIB '+
                         '          WHERE FK_PACID = TNAZIS.FK_ID '+
                         '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''RG_LABORANT'')) AS LAB, '+
                         '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+
                         '           FROM ASU.TIB '+
                         '          WHERE FK_PACID = ASU.GET_PEPLID(TNAZIS.FK_PACID) '+
                         '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''KOREN_NASEL''))) AS KOREN, '+
                         '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+
                         '           FROM ASU.TIB '+
                         '          WHERE FK_PACID = TNAZIS.FK_ID '+
                         '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''AMBTALON_OPL''))) AS OPL, '+
                         '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+
                         '           FROM ASU.TIB '+
                         '          WHERE FK_PACID = TNAZIS.FK_ID '+
                         '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''ISSL_TARGET''))) AS TARGET, '+
                         '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+
                         '           FROM ASU.TIB '+
                         '          WHERE FK_PACID = TNAZIS.FK_ID '+
                         '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_PRIEM''))) AS PRIEM, '+
                         '        (SELECT ASU.GET_SMIDNAME(TIB.FK_SMID) '+
                         '           FROM ASU.TIB '+
                         '          WHERE FK_PACID = TNAZIS.FK_ID '+
                         '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_APPARAT''))) AS APPARAT '+
                         '   FROM ASU.TNAZIS '+
                         '  WHERE FK_ID = :PFK_ID ';
      odsFlu.DeclareAndSet('PFK_ID', otInteger, VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_FK_ID.Index]);
      odsFlu.Open;
      nAge_4rep := odsFlu.FieldByName('PACAGE').AsInteger;
      sSex_4rep := odsFlu.FieldByName('SEX').AsString;
      sAddress_4rep := odsFlu.FieldByName('ADDRESS').AsString;
      sPhone_4rep := odsFlu.FieldByName('PHONE').AsString;
      sKabName_4rep := odsFlu.FieldByName('KABNAME').AsString;
      sKabPhone_4rep := odsFlu.FieldByName('KABPHONE').AsString;
      sLabName_4rep := odsFlu.FieldByName('LAB').AsString;
      sKoren_4rep := odsFlu.FieldByName('KOREN').AsString;
      sOpl_4rep := odsFlu.FieldByName('OPL').AsString;
      sTarget_4rep := odsFlu.FieldByName('TARGET').AsString;
      sPriem_4rep := odsFlu.FieldByName('PRIEM').AsString;
      sApparat_4rep := odsFlu.FieldByName('APPARAT').AsString;
      DoProjivaet;
      frxFlu.ShowReport;
    finally
      odsFlu.Free;
    end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.aOpenMKExecute(Sender: TObject);
var ods : TOracleDataSet;
    AppProcID : Integer;
begin
  ods := TOracleDataSet.Create(nil);
  try
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

//    AppHandle := WinExecAndWait32(PChar('IBRazdel.exe '+IntToStr(pAPPSOTRID)+' '+IntToStr(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index])+' '+IntToStr(-1)+' '+IntToStr(-1)), 1);
//    GetInputMapAppFromApp(AppHandle);

    AppProcID := AppStart(ExtractFilePath(paramstr(0))+'IBRazdel.exe', IntToStr(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index])+' '+IntToStr(-1)+' '+IntToStr(-1));
    if AppProcID = -1 then ShowMessage('Ошибка запуска приложения');
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
  if merAge.Properties.Editors[1].Value <> 0  then
    sParams := sParams + 'Возраст с: '+IntToStr(merAge.Properties.Editors[0].Value)+' по: '+IntToStr(merAge.Properties.Editors[1].Value);
  if rowIssl.Tag <> -1 then
    sParams := sParams + 'Методика: '+rowIssl.Properties.Value+'; ';
  if (rowKoren.Properties.Value <> - 1) and (VarToStr(rowKoren.Properties.Value) <> '') then
    sParams := sParams + 'Коренное население: '+odsKorennoe.FieldByName('FC_NAME').AsString+'; ';
  if (rowPlace.Properties.Value <> -1) and (VarToStr(rowPlace.Properties.Value) <> '') then
    sParams := sParams + 'Проживает: '+odsRegPrin.FieldByName('FC_NAME').AsString+'; ';
  if (rowTypeNaz.Properties.Value <> -1) and (VarToStr(rowTypeNaz.Properties.Value) <> '') then
    sParams := sParams + 'Тип назначения: '+odsTypeNaz.FieldByName('FC_NAME').AsString+'; ';
  if (rowTarget.Properties.Value <> -1) and (VarToStr(rowTarget.Properties.Value) <> '') then
    sParams := sParams + 'Цель: '+odsTarget.FieldByName('FC_NAME').AsString+'; ';
  if (rowPriem.Properties.Value <> -1) and (VarToStr(rowPriem.Properties.Value) <> '') then
    sParams := sParams + 'Приём: '+odsPriem.FieldByName('FC_NAME').AsString+'; ';
  if (rowApparat.Properties.Value <> -1) and (VarToStr(rowApparat.Properties.Value) <> '') then
    sParams := sParams + 'Аппарат: '+odsApparat.FieldByName('FC_NAME').AsString+'; ';
  if (rowOtmena.Properties.Value <> -1) and (VarToStr(rowOtmena.Properties.Value) <> '') then
    sParams := sParams + 'Причина отмены: '+odsOtmena.FieldByName('FC_NAME').AsString+'; ';
  if rowZakl1.Tag <> -1 then
    sParams := sParams + 'Заключение 1: '+rowZakl1.Properties.Value+'; ';
  if rowZakl2.Tag <> -1 then
    sParams := sParams + 'Заключение 2: '+rowZakl2.Properties.Value+'; ';
  if rowWork.Tag <> -1 then
    sParams := sParams + 'Место работы: '+rowWork.Properties.Value+'; ';
  if rowUch.Tag <> -1 then
    sParams := sParams + 'Участок: '+rowUch.Properties.Value+'; ';
  if (rowPeriod.Properties.Value <> -1) and (VarToStr(rowPeriod.Properties.Value) <> '') then
    sParams := sParams + 'Периодичность: '+odsPeriodSpisok.FieldByName('FC_NAME').AsString+'; ';

  if (rowStatus.Properties.Value = get_vipnaz) or (rowStatus.Properties.Value = get_nevip) then
    begin
      if sParams = '' then
        begin
          frxList.FindObject('Memo22').Visible := False;
        end else
        begin
          frxList.FindObject('Memo22').Visible := True;
        end;
      frxList.ShowReport;
    end;

  if rowStatus.Properties.Value = get_nazcancel then
    begin
      if sParams = '' then
        begin
          frxListCancel.FindObject('Memo22').Visible := False;
        end else
        begin
          frxListCancel.FindObject('Memo21').Visible := True;
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
    ods.SQL.Text := ' SELECT FK_ID, '+#13+
                    '        TO_CHAR(FD_RUN, ''DD.MM.YYYY HH24:MI'') AS FD_RUN_STR, '+#13+
                    '        (SELECT FB_TEXT FROM ASU.TRICHVIEWDATA WHERE FK_PACID = TNAZIS.FK_ID) AS TEXTISSL, '+#13+
                    '        ASU.GET_IB(FK_PACID) AS NUMIB, '+#13+
                    '        DECODE(ASU.GET_OWNER_FROM_SMID(TNAZIS.FK_SMID), '+#13+
                    '               ASU.GET_XRAY_FLU, '+#13+
                    '               (SELECT MAX(FC_CHAR) '+#13+
                    '                  FROM ASU.TIB '+#13+
                    '                 WHERE FK_PACID = TNAZIS.FK_ID '+#13+
                    '                   AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_FLU_NUMBER'')), '+#13+
                    '               (SELECT MAX(FC_CHAR) '+#13+
                    '                  FROM ASU.TIB '+#13+
                    '                 WHERE FK_PACID = TNAZIS.FK_ID '+#13+
                    '                   AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL''))) AS NUMBER_ISSL, '+#13+
                    '        (SELECT FD_ROJD FROM ASU.TPEOPLES WHERE FK_ID = (SELECT FK_PEPLID FROM ASU.TKARTA WHERE FK_ID = TNAZIS.FK_PACID '+#13+
                    '                                                         UNION '+#13+
                    '                                                         SELECT FK_PEPLID FROM ASU.TAMBULANCE WHERE FK_ID = TNAZIS.FK_PACID)) FD_ROJD, '+#13+
                    '        (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA, '+#13+
                    '        (SELECT FK_OWNER FROM ASU.TSMID WHERE FK_ID = TNAZIS.FK_SMID) AS FK_OWNER '+#13+
                    '   FROM ASU.TNAZIS '+#13+
                    '  WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_FK_ID.Index]);
    ods.Open;
    sTextIssl_4rep := ods.FieldByName('TEXTISSL').AsString;
    sNumIssl_4rep := ods.FieldByName('NUMBER_ISSL').AsString;
    sNumIB_4rep := ods.FieldByName('NUMIB').AsString;
    sDateRunStr_4Rep := ods.FieldByName('FD_RUN_STR').AsString;
    dDateBirth_4Rep := ods.FieldByName('FD_ROJD').AsDateTime;
    nDoza_4Rep := ods.FieldByName('DOZA').AsFloat;
    if ods.FieldByName('FK_OWNER').AsInteger = frmMain.GET_XRAY_MRT then
      begin
        frxRepProtocol.FindObject('Memo9').Visible := False;
      end else
      begin
        frxRepProtocol.FindObject('Memo9').Visible := True;
      end;
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
  if (rowStatus.Properties.Value = get_vipnaz) or (rowStatus.Properties.Value = get_nevip) then
    oqThread.SQL.Text := sqlList;
  if rowStatus.Properties.Value = get_nazcancel then
    oqThread.SQL.Text := sqlListCancel;
  if rowStatus.Properties.Value = get_pass_registrator then
    oqThread.SQL.Text := sqlListPass;

  odsCntPepl.Close;
  odsCntPepl.DeleteVariables;
  if rowStatus.Properties.Value = get_pass_registrator then
    odsCntPepl.SQL.Text := sqlListCountPass
  else
    odsCntPepl.SQL.Text := sqlListCount;
  odsCntPepl.DeclareAndSet('pfk_nazsosid', otInteger, rowStatus.Properties.Value);
//-->> 0. Статус исследования
  oqThread.DeclareAndSet('PFK_NAZSOSID', otInteger, rowStatus.Properties.Value);
//-->> 1. Кабинет
  if rowKabinet.Properties.Value <> -1 then
    begin
      oqThread.SQL.Add(' AND FK_ROOMID = :PFK_ROOMID ');
      oqThread.DeclareAndSet('PFK_ROOMID', otInteger, rowKabinet.Properties.Value);
      odsCntPepl.SQL.Add(' AND FK_ROOMID = :PFK_ROOMID ');
      odsCntPepl.DeclareAndSet('PFK_ROOMID', otInteger, rowKabinet.Properties.Value);
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
  if (rowOpl.Properties.Value <> -1) and (VarToStr(rowOpl.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID1) ');
      oqThread.DeclareAndSet('PFK_SMID1', otInteger, rowOpl.Properties.Value);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID1) ');
      odsCntPepl.DeclareAndSet('PFK_SMID1', otInteger, rowOpl.Properties.Value);
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
//-->> 23. Приём
  if (rowPriem.Properties.Value <> -1) and (VarToStr(rowPriem.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID14) ');
      oqThread.DeclareAndSet('PFK_SMID14', otInteger, rowPriem.Properties.Value);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID14) ');
      odsCntPepl.DeclareAndSet('PFK_SMID14', otInteger, rowPriem.Properties.Value);
    end;
//-->> 24. Аппарат
  if (rowApparat.Properties.Value <> -1) and (VarToStr(rowApparat.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID15) ');
      oqThread.DeclareAndSet('PFK_SMID15', otInteger, rowApparat.Properties.Value);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID15) ');
      odsCntPepl.DeclareAndSet('PFK_SMID15', otInteger, rowApparat.Properties.Value);
    end;
//-->> 28. Методика
  if rowIssl.Tag <> -1 then
    begin
      oqThread.SQL.Add(' AND FK_SMID = :PFK_SMID18 ');
      oqThread.DeclareAndSet('PFK_SMID18', otInteger, rowIssl.Tag);
      odsCntPepl.SQL.Add(' AND FK_SMID = :PFK_SMID18 ');
      odsCntPepl.DeclareAndSet('PFK_SMID18', otInteger, rowIssl.Tag);
    end;
//-->> 30. Причины отмены
  if (rowOtmena.Properties.Value <> -1) and (VarToStr(rowOtmena.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID20) ');
      oqThread.DeclareAndSet('PFK_SMID20', otInteger, rowOtmena.Properties.Value);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = :PFK_SMID20) ');
      odsCntPepl.DeclareAndSet('PFK_SMID20', otInteger, rowOtmena.Properties.Value);
    end;
//-->> 31. Заключение 1
  if rowZakl1.Tag <> -1 then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME1'') AND FK_BID = :PFK_SMID21) ');
      oqThread.DeclareAndSet('PFK_SMID21', otInteger, rowZakl1.Tag);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME1'') AND FK_BID = :PFK_SMID21) ');
      odsCntPepl.DeclareAndSet('PFK_SMID21', otInteger, rowZakl1.Tag);
    end;
//-->> 32. Заключение 2
  if rowZakl2.Tag <> -1 then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME2'') AND FK_BID = :PFK_SMID22) ');
      oqThread.DeclareAndSet('PFK_SMID22', otInteger, rowZakl2.Tag);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME2'') AND FK_BID = :PFK_SMID22) ');
      odsCntPepl.DeclareAndSet('PFK_SMID22', otInteger, rowZakl2.Tag);
    end;
//-->> 33. Место работы
  if rowWork.Tag <> -1 then
    begin
      oqThread.SQL.Add(' AND (SELECT FK_COMPANYID FROM ASU.TPEOPLES WHERE FK_ID = ASU.GET_PEPLID(TNAZIS.FK_PACID)) = :PWORK ');
      oqThread.DeclareAndSet('PWORK', otInteger, rowWork.Tag);
      odsCntPepl.SQL.Add(' AND (SELECT FK_COMPANYID FROM ASU.TPEOPLES WHERE FK_ID = ASU.GET_PEPLID(TNAZIS.FK_PACID)) = :PWORK ');
      odsCntPepl.DeclareAndSet('PWORK', otInteger, rowWork.Tag);
    end;
//-->> 34. Категория (пока только "Медработник")
  if rowCategory.Properties.Value <> 0 then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TPEPLID_MED WHERE FK_PEPLID = ASU.GET_PEPLID(TNAZIS.FK_PACID)) ');
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TPEPLID_MED WHERE FK_PEPLID = ASU.GET_PEPLID(TNAZIS.FK_PACID)) ');
    end;
//-->> 35. Участок
  if rowUch.Tag <> -1 then // !!! пока поставил max т.к. были дублирующиеся записи
    begin
      oqThread.SQL.Add(' and exists (select 1 from asu.tdistrict_pacient where fk_peplid = asu.get_peplid(tnazis.fk_pacid) and fk_arealid = :pfk_arealid) ');
      oqThread.DeclareAndSet('pfk_arealid', otInteger, rowUch.Tag);
      odsCntPepl.SQL.Add(' and exists (select 1 from asu.tdistrict_pacient where fk_peplid = asu.get_peplid(tnazis.fk_pacid) and fk_arealid = :pfk_arealid) ');
      odsCntPepl.DeclareAndSet('pfk_arealid', otInteger, rowUch.Tag);
    end;
//-->> 36. Периодичность
  if (rowPeriod.Properties.Value <> -1) and (VarToStr(rowPeriod.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = ASU.GET_PEPLID(TNAZIS.FK_PACID) AND FK_SMID = :PFK_SMID21 ) ');
      oqThread.DeclareAndSet('PFK_SMID21', otInteger, rowPeriod.Properties.Value);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = ASU.GET_PEPLID(TNAZIS.FK_PACID) AND FK_SMID = :PFK_SMID21 ) ');
      odsCntPepl.DeclareAndSet('PFK_SMID21', otInteger, rowPeriod.Properties.Value);
    end;
//-->> 37. Категория
  if (rowCat.Properties.Value <> -1) and (VarToStr(rowCat.Properties.Value) <> '') and (rowCat.Visible = True) then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = ASU.GET_PEPLID(TNAZIS.FK_PACID) AND FK_SMID = :PFK_SMID22 ) ');
      oqThread.DeclareAndSet('PFK_SMID22', otInteger, rowCat.Properties.Value);
      odsCntPepl.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = ASU.GET_PEPLID(TNAZIS.FK_PACID) AND FK_SMID = :PFK_SMID22 ) ');
      odsCntPepl.DeclareAndSet('PFK_SMID22', otInteger, rowCat.Properties.Value);
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
  VIEW.BeginUpdate;
  nRec := 0;
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

procedure TfrmMain.cxSplitter2BeforeClose(Sender: TObject;
  var AllowClose: Boolean);
begin
  paSubParam.Visible := False;
end;

procedure TfrmMain.cxSplitter2BeforeOpen(Sender: TObject; var NewSize: Integer;
  var AllowOpen: Boolean);
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
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
    ods.DeclareAndSet('PFK_PEPLID', otInteger, pPEPLID);
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
                    '        (select fk_id from asu.tsmid where fc_synonim = ''ONE_IN_YEAR'') as get_oneinyear, '+#13+
                    '        (select fk_id from asu.tsmid where fc_synonim = ''TWO_IN_YEAR'') as get_twoinyear, '+#13+
                    '        ASU.PKG_SMINI.READSTRING(''CONFIG'', ''DB_NAME'', ''H'') AS DB_NAME '+#13+
                    '   FROM DUAL ';
    ods.Open;
    GET_VID_SNIMOK_PLENKA := ods.FieldByName('VID_SNIMOK_PLENKA').AsInteger;
    sCompanyName_4Rep := ods.FieldByName('COMPANYNAME').AsString;
    GET_XRAY_MRT := ods.FieldByName('GET_XRAY_MRT').AsInteger;
    GET_ISSL_FLU := ods.FieldByName('GET_ISSL_FLU').AsInteger;
    GET_VIDOPL_DOGOVOR := ods.FieldByName('GET_VIDOPL_DOGOVOR').AsInteger;
    get_xray_flukab := ods.FieldByName('get_xray_flukab').AsInteger;
    get_oneinyear := ods.FieldByName('get_oneinyear').AsInteger;
    get_twoinyear := ods.FieldByName('get_twoinyear').AsInteger;
    get_db_name := ods.FieldByName('db_name').AsString;
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
    frmMain.Caption := 'Флюоро-архив ('+Ver.FileVersion+')'+'. Пользователь: '+ods.FieldByName('VRACHFIO').AsString;
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
    if odsKorennoe.Active = False then
      odsKorennoe.Open;
    if odsRegPrin.Active = False then
      odsRegPrin.Open;
    if odsTypeNaz.Active = False then
      odsTypeNaz.Open;
    if odsTarget.Active = False then
      odsTarget.Open;
    if odsPriem.Active = False then
      odsPriem.Open;
    if odsApparat.Active = False then
      odsApparat.Open;
    if odsOtmena.Active = False then
      odsOtmena.Open;
    if odsPeriodSpisok.Active = False then
      odsPeriodSpisok.Open;
    if odsVidOplat.Active = False then
      odsVidOplat.Active := True; 

    rowCategory.Properties.Value := 0;
    rowZakl1.Tag := -1;
    rowZakl2.Tag := -1;
    rowIssl.Tag := -1;
    rowWork.Tag := -1;
    rowUch.Tag := -1;
    VIEW.StoreToRegistry('\SoftWare\SoftMaster\Flu_Archive\fMain\ViewVrach_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'VIEW');
    VIEW.RestoreFromRegistry('\SoftWare\SoftMaster\Flu_Archive\fMain\ViewVrach_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'VIEW');
    MedotradeSign := ReadMedotradeSign;
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
  VIEW.StoreToRegistry('\SoftWare\SoftMaster\Flu_Archive\fMain\ViewVrach_' + IntToStr(pSOTRID), TRUE, [], 'VIEW');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var ods : TOracleDataSet;
begin
  GetSession(os, 'ASU');
//-->> выбираем константы
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.SQL.Text := ' SELECT ASU.GET_VIPNAZ, ASU.GET_NAZCANCEL, ASU.GET_NEVIP, asu.get_pass_registrator FROM DUAL ';
    ods.Open;
    get_vipnaz := ods.FieldByName('GET_VIPNAZ').AsInteger;
    get_nazcancel := ods.FieldByName('GET_NAZCANCEL').AsInteger;
    get_nevip := ods.FieldByName('GET_NEVIP').AsInteger;
    get_pass_registrator := ods.FieldByName('get_pass_registrator').AsInteger;
    rowStatus.Properties.Value := get_vipnaz;
//-->> скрываем поля которые не работают со статусом "Выполнено" get_vipnaz
    rowOtmena.Visible := False;
    aOtmena.Visible := False;
  finally
    ods.Free;
  end;
  russian:=LoadKeyboardLayout('00000419', 0);  
end;

procedure TfrmMain.frxFluGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'RG_LABORANT' then Value := sLabName_4rep;
  if VarName = 'FIO_PAC' then Value := VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACFIO.Index];
  if VarName = 'DATE_ROJD' then Value := dDateBirth_4Rep;
  if VarName = 'KORENNOE' then Value := sKoren_4rep;
  if VarName = 'PROJIVAET' then Value := sProjivaet_4rep;
  if VarName = 'ADDRESS' then Value := sAddress_4rep;
  if VarName = 'PHONE' then Value := sPhone_4rep;
  if VarName = 'NUMIB' then Value := sNumIB_4rep;
  if VarName = 'NUMISSL' then Value := sNumIssl_4rep;
  if VarName = 'NAMEISSL' then Value := VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_NAMEISSL.Index];
  if VarName = 'AGE' then Value := nAge_4rep;
  if VarName = 'SEX' then Value := sSex_4rep;
  if VarName = 'VID_OPLATA' then Value := sOpl_4rep;
  if VarName = 'TARGET' then Value := sTarget_4rep;
  if VarName = 'KABINET' then Value := sKabName_4rep;
  if VarName = 'PHONEKAB' then Value := sKabPhone_4rep;
  if VarName = 'PRIEM' then Value := sPriem_4rep;
  if VarName = 'APPARAT' then Value := sApparat_4rep;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
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
      if VarName = 'STATUS' then Value := 'Не Вып.';
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
  if VarName = 'DATE_ROJD' then Value := dDateBirth_4Rep;
  if VarName = 'KORENNOE' then Value := sKoren_4rep;
  if VarName = 'PROJIVAET' then Value := sProjivaet_4rep;
  if VarName = 'ADDRESS' then Value := sAddress_4rep;
  if VarName = 'PHONE' then Value := sPhone_4rep;
  if VarName = 'NUMIB' then Value := sNumIB_4rep;
  if VarName = 'KEM_NAPRAVLEN' then Value := sKem_4rep;
  if VarName = 'NAPRAV_DS' then Value := sDs_4rep;
  if VarName = 'SROCH' then Value := sUrgent_4rep;
  if VarName = 'NADBAVKA_TIME' then Value := sNadbavka_4rep;
  if VarName = 'NUMISSL' then Value := sNumIssl_4rep;
  if VarName = 'AGE' then Value := nAge_4rep;
  if VarName = 'SEX' then Value := sSex_4rep;
  if VarName = 'VID_OPLATA' then Value := sOpl_4rep;
  if VarName = 'VRACH_NAPRAVIL' then Value := sVrach_4rep;
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
  if VarName = 'DATE_ROJD' then Value := dDateBirth_4Rep;
  if VarName = 'NUMIB' then Value := sNumIB_4rep;
  if VarName = 'NAMEISSL' then Value := VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_NAMEISSL.Index];
  if VarName = 'DOZA' then Value := nDoza_4Rep;
  if VarName = 'DATEISSL' then Value := sDateRunStr_4Rep;
  if VarName = 'TEXTISSL' then Value := sTextIssl_4rep;
  if VarName = 'NUMISSL' then Value := sNumIssl_4rep;
  if VarName = 'SOTR' then Value := VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_VRACH.Index]; //sSotrFIO_4rep;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.N3Click(Sender: TObject);
begin
  VIEW.RestoreFromRegistry('\SoftWare\SoftMaster\Flu_Archive\fMain\ViewVrach_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'VIEW');
end;

procedure TfrmMain.N6Click(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACFIO.Index];
//  trim(copy(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACFIO.Index],
//                           1,
//                           Pos(' ', VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACFIO.Index])));
end;

procedure TfrmMain.N7Click(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select FB_TEXT FROM ASU.TRICHVIEWDATA WHERE FK_PACID = :PFK_PACID ';
    ods.DeclareAndSet('PFK_PACID', otInteger, VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_FK_ID.Index]);
    ods.Open;
    ActivateKeyboardLayout(russian, KLF_REORDER);
    Clipboard.AsText := ods.FieldByName('FB_TEXT').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.odsKabBeforeOpen(DataSet: TDataSet);
begin
  odsKab.SetVariable('PSOTR', pSOTRID);
end;

procedure TfrmMain.oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
  const ErrorMessage: string);
begin
  VIEW.EndUpdate;
  MessageDlg('Во время выполнения запроса произошла ошибка! Обратитесь к администратору системы!'+
             #13#10+'Код ошибки: '+IntToStr(ErrorCode)+
             #13#10+'Текст ошибки: '+ErrorMessage,
             mtError, [mbOK], 0);
  bbr := True;
end;

procedure TfrmMain.oqThreadThreadFinished(Sender: TOracleQuery);
begin
  try
    VIEW.EndUpdate;
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
  finally
    CheckEnabledButtons;
  end;
end;

procedure TfrmMain.oqThreadThreadRecord(Sender: TOracleQuery);
begin
//  VIEW.BeginUpdate;
  VIEW.DataController.RecordCount := VIEW.DataController.RecordCount + 1;
  with VIEW.DataController do
  begin
    try
      Values[VIEW.DataController.RecordCount - 1, VIEW_FK_ID.Index] := Sender.Field('FK_ID');
      Values[VIEW.DataController.RecordCount - 1, VIEW_PACID.Index] := Sender.Field('FK_PACID');
      Values[VIEW.DataController.RecordCount - 1, VIEW_FD_NAZ.Index] := Sender.Field('FD_NAZ');
      if (rowStatus.Properties.Value = get_vipnaz) or (rowStatus.Properties.Value = get_pass_registrator) then
        Values[VIEW.DataController.RecordCount - 1, VIEW_FD_RUN.Index] := Sender.Field('FD_RUN');
      if rowStatus.Properties.Value = get_nazcancel then
        Values[VIEW.DataController.RecordCount - 1, VIEW_FD_RUN.Index] := Sender.Field('DATE_CANCEL');
      Values[VIEW.DataController.RecordCount - 1, VIEW_PACFIO.Index] := Sender.Field('FIOPAC');
      Values[VIEW.DataController.RecordCount - 1, VIEW_NAMEISSL.Index] := Sender.Field('NAMEISSL');
      Values[VIEW.DataController.RecordCount - 1, VIEW_VRACH.Index] := Sender.Field('VRACHFIO');
      Values[VIEW.DataController.RecordCount - 1, VIEW_NUMMK.Index] := Sender.Field('NUMMK');
      Values[VIEW.DataController.RecordCount - 1, VIEW_PEPLID.Index] := Sender.Field('PEPLID');
      Values[VIEW.DataController.RecordCount - 1, VIEWNUM.Index] := Sender.Field('NUMBER_ISSL');
      Values[VIEW.DataController.RecordCount - 1, VIEWREASONCANCEL.Index] := Sender.Field('FC_RES');
      Values[VIEW.DataController.RecordCount - 1, VIEW_ROJD.Index] := Sender.Field('FD_ROJD');
      Values[VIEW.DataController.RecordCount - 1, VIEW_DOZA.Index] := Sender.Field('DOZA');
      Values[VIEW.DataController.RecordCount - 1, VIEW_ADR.Index] := Sender.Field('ADR');
      Values[VIEW.DataController.RecordCount - 1, VIEW_ADRFACT.Index] := Sender.Field('ADR_FACT');
      Values[VIEW.DataController.RecordCount - 1, VIEW_CNTTUB.Index] := Sender.Field('cnttub');
      Values[VIEW.DataController.RecordCount - 1, VIEW_CAT.Index] := Sender.Field('categ');
      Values[VIEW.DataController.RecordCount - 1, VIEWUCH.Index] := Sender.Field('uch');

      dxMemData1.Insert;
      dxMemData1.FieldByName('FK_ID').AsString := Sender.Field('FK_ID');
      dxMemData1.FieldByName('FK_PACID').AsString := Sender.Field('FK_PACID');
      dxMemData1.FieldByName('FD_NAZ_STR').AsString := Sender.Field('FD_NAZ_STR');
      if rowStatus.Properties.Value = get_vipnaz then
        dxMemData1.FieldByName('FD_RUN_STR').AsString := Sender.Field('FD_RUN_STR');
      if rowStatus.Properties.Value = get_nazcancel then
        dxMemData1.FieldByName('FD_RUN_STR').AsString := Sender.Field('DATE_CANCEL');
      dxMemData1.FieldByName('FIOPAC').AsString := Sender.Field('FIOPAC');
      dxMemData1.FieldByName('NAMEISSL').AsString := Sender.Field('NAMEISSL');
      dxMemData1.FieldByName('VRACHFIO').AsString := Sender.Field('VRACHFIO');
      dxMemData1.FieldByName('NUMMK').AsString := Sender.Field('NUMMK');
      dxMemData1.FieldByName('PEPLID').AsString := Sender.Field('PEPLID');
      dxMemData1.FieldByName('NUMBER_ISSL').AsString := Sender.Field('NUMBER_ISSL');
      dxMemData1.FieldByName('FC_RES').AsString := Sender.Field('FC_RES');
      dxMemData1.FieldByName('FD_ROJD').AsString := Sender.Field('FD_ROJD');
      dxMemData1.FieldByName('DOZA').AsFloat := Sender.Field('DOZA');
      dxMemData1.FieldByName('ADR').AsString := Sender.Field('ADR');
      dxMemData1.FieldByName('ADR_F').AsString := Sender.Field('ADR_FACT');
      dxMemData1.FieldByName('CNTTUB').AsString := Sender.Field('cnttub');
      dxMemData1.FieldByName('CAT').AsString := Sender.Field('categ');
      dxMemData1.FieldByName('UCH').AsString := Sender.Field('uch');
      dxMemData1.Post;
      dxMemData1.Next;
    finally
    end;
  end;
//  VIEW.EndUpdate;
  cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel1.Refresh;
  cxLabel2.Caption := 'Выбрано ' + IntToStr(VIEW.DataController.RecordCount) + ' записей.';
  cxLabel2.Refresh;
  nRec := nRec + 1;
  if nRec > 100 then
    begin
      nRec := 0;
      VIEW.EndUpdate;
      VIEW.BeginUpdate;
    end;
end;

procedure TfrmMain.osAfterLogOn(Sender: TOracleSession);
var Ver: TJclFileVersionInfo;
begin
  Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  Sender.DBMS_Application_Info.Set_Module(ExtractFileName(ParamStr(0)) + ' (' + Ver.FileVersion + ')', Self.Name + ' "' + Self.Caption + '"');
  Ver.Free;
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

procedure TfrmMain.rowApparatEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowApparat.Properties.Value = -1 then
    begin
      rowApparat.Properties.ImageIndex := -1;
      rowApparat.Styles.Content := stNormal;
      rowApparat.Styles.Header := stNormal;
    end else
    begin
      rowApparat.Properties.ImageIndex := 4;
      rowApparat.Styles.Content := stBold;
      rowApparat.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowCatEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowCat.Properties.Value = -1 then
    begin
      rowCat.Properties.ImageIndex := -1;
      rowCat.Styles.Content := stNormal;
      rowCat.Styles.Header := stNormal;
    end else
    begin
      rowCat.Properties.ImageIndex := 4;
      rowCat.Styles.Content := stBold;
      rowCat.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowCategoryEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowCategory.Properties.Value = 0 then
    begin
      rowCategory.Properties.ImageIndex := -1;
      rowCategory.Styles.Content := stNormal;
      rowCategory.Styles.Header := stNormal;
    end else
    begin
      rowCategory.Properties.ImageIndex := 4;
      rowCategory.Styles.Content := stBold;
      rowCategory.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowDatesEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  with TfrmParamDate.Create(Self) do
    begin
      if Execute then
        begin
      if ModalResult = MrOK then
        begin
          rowPeriodFrom.Properties.Value := Period.First;
          rowPeriodTo.Properties.Value := Period.Last;
          TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
          TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := DateTimeToStr(Period.First)+'-'+DateTimeToStr(trunc(Period.Last));
          TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
        end;
        end;
    Free;
  end;
end;

procedure TfrmMain.rowIsslEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmNazRg1, frmNazRg1);
      frmNazRg1.ShowModal;
      if frmNazRg1.ModalResult = mrOk then
        begin
          rowIssl.Tag := frmNazRg1.odsChild.FieldByName('FK_ID').AsInteger;
          TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
          TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := frmNazRg1.odsChild.FieldByName('NAMEMETODIC').AsString;
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

procedure TfrmMain.rowOplEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowOpl.Properties.Value = -1 then
    begin
      rowOpl.Properties.ImageIndex := -1;
      rowOpl.Styles.Content := stNormal;
      rowOpl.Styles.Header := stNormal;
    end else
    begin
      rowOpl.Properties.ImageIndex := 4;
      rowOpl.Styles.Content := stBold;
      rowOpl.Styles.Header := stBold;
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

procedure TfrmMain.rowPeriodEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowPeriod.Properties.Value = get_oneinyear then
    begin
      rowCat.Visible := True;
      odsCat.Close;
      odsCat.SetVariable('pfc_synonim', 'FLU_PERIOD_CATEGORY_ONEINYEAR');
      odsCat.Open;
    end;
  if rowPeriod.Properties.Value = get_twoinyear then
    begin
      rowCat.Visible := True;
      odsCat.Close;
      odsCat.SetVariable('pfc_synonim', 'FLU_PERIOD_CATEGORY_TWOINYEAR');
      odsCat.Open;
    end;
  if (rowPeriod.Properties.Value <> get_oneinyear) and (rowPeriod.Properties.Value <> get_twoinyear) then
    begin
      rowCat.Visible := False;
    end;
  if rowPeriod.Properties.Value = -1 then
    begin
      rowPeriod.Properties.ImageIndex := -1;
      rowPeriod.Styles.Content := stNormal;
      rowPeriod.Styles.Header := stNormal;
    end else
    begin
      rowPeriod.Properties.ImageIndex := 4;
      rowPeriod.Styles.Content := stBold;
      rowPeriod.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowPeriodFromEditPropertiesEditValueChanged(Sender: TObject);
begin
  cxGr.SetFocus;
  rowDates.Properties.Value := DateTimeToStr(rowPeriodFrom.Properties.Value)+'-'+DateTimeToStr(Trunc(rowPeriodTo.Properties.Value));
end;

procedure TfrmMain.rowPeriodToEditPropertiesEditValueChanged(Sender: TObject);
begin
  cxGr.SetFocus;
  rowDates.Properties.Value := DateTimeToStr(rowPeriodFrom.Properties.Value)+'-'+DateTimeToStr(Trunc(rowPeriodTo.Properties.Value));
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

procedure TfrmMain.rowPriemEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowPriem.Properties.Value = -1 then
    begin
      rowPriem.Properties.ImageIndex := -1;
      rowPriem.Styles.Content := stNormal;
      rowPriem.Styles.Header := stNormal;
    end else
    begin
      rowPriem.Properties.ImageIndex := 4;
      rowPriem.Styles.Content := stBold;
      rowPriem.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowStatusEditPropertiesEditValueChanged(Sender: TObject);
begin
  VIEW.DataController.RecordCount := 0;
  aInfo.Enabled := False;
  aOpenMK.Enabled := False;
  aNaprav.Enabled := False;
  aProtocol.Enabled := False;
  aOtmena.Enabled := False;
  aPrint.Enabled := False;

  if (rowStatus.Properties.Value = get_vipnaz) or (rowStatus.Properties.Value = get_nevip) then
    begin
      rowKoren.Visible := True;
      rowPlace.Visible := True;
      rowTypeNaz.Visible := True;
      rowTarget.Visible := True;
      rowPriem.Visible := True;
      rowApparat.Visible := True;
      rowZakl1.Visible := rowKabinet.Properties.Value = get_xray_flukab;
      rowZakl2.Visible := rowKabinet.Properties.Value = get_xray_flukab;
      rowWork.Visible := True;
      rowOtmena.Visible := False;
      rowKabinet.Visible := True;
      rowIssl.Visible := True;
      merAge.Visible := True;

      rowOpl.Visible := True;
      rowCategory.Visible := True;
      rowUch.Visible := True;
      rowPeriod.Visible := True;
      rowCategoryAnother.Visible := True;

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
      aPrint.Visible := True;
      N7.Visible := True;
    end;

  if rowStatus.Properties.Value = get_nazcancel then
    begin
      rowKoren.Visible := False;
      rowPlace.Visible := False;
      rowTypeNaz.Visible := False;
      rowTarget.Visible := False;
      rowPriem.Visible := False;
      rowApparat.Visible := False;
      rowZakl1.Visible := False;
      rowZakl2.Visible := False;
      rowWork.Visible := False;
      rowOtmena.Visible := True;
      rowKabinet.Visible := True;
      rowIssl.Visible := True;
      merAge.Visible := True;

      rowOpl.Visible := True;
      rowCategory.Visible := True;
      rowUch.Visible := True;
      rowPeriod.Visible := True;
      rowCategoryAnother.Visible := True;

      rowKoren.Properties.Value := -1;
      rowKoren.Properties.ImageIndex := -1;
      rowKoren.Styles.Content := stNormal;
      rowKoren.Styles.Header := stNormal;

      rowPlace.Properties.Value := -1;
      rowPlace.Properties.ImageIndex := -1;
      rowPlace.Styles.Content := stNormal;
      rowPlace.Styles.Header := stNormal;

      rowTypeNaz.Properties.Value := -1;
      rowTypeNaz.Properties.ImageIndex := -1;
      rowTypeNaz.Styles.Content := stNormal;
      rowTypeNaz.Styles.Header := stNormal;

      rowTarget.Properties.Value := -1;
      rowTarget.Properties.ImageIndex := -1;
      rowTarget.Styles.Content := stNormal;
      rowTarget.Styles.Header := stNormal;

      rowPriem.Properties.Value := -1;
      rowPriem.Properties.ImageIndex := -1;
      rowPriem.Styles.Content := stNormal;
      rowPriem.Styles.Header := stNormal;

      rowApparat.Properties.Value := -1;
      rowApparat.Properties.ImageIndex := -1;
      rowApparat.Styles.Content := stNormal;
      rowApparat.Styles.Header := stNormal;

      rowZakl1.Tag := -1;
      rowZakl1.Properties.Value := null;
      rowZakl1.Properties.ImageIndex := -1;
      rowZakl1.Styles.Content := stNormal;
      rowZakl1.Styles.Header := stNormal;

      rowZakl2.Tag := -1;
      rowZakl2.Properties.Value := null;
      rowZakl2.Properties.ImageIndex := -1;
      rowZakl2.Styles.Content := stNormal;
      rowZakl2.Styles.Header := stNormal;

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
      aPrint.Visible := True;
      N7.Visible := False;
    end;

  if rowStatus.Properties.Value = get_pass_registrator then
    begin
      rowKoren.Visible := False;
      rowPlace.Visible := False;
      rowTypeNaz.Visible := False;
      rowTarget.Visible := False;
      rowPriem.Visible := False;
      rowApparat.Visible := False;
      rowZakl1.Visible := False;
      rowZakl2.Visible := False;
      rowWork.Visible := False;
      rowOtmena.Visible := False;
      rowKabinet.Visible := False;
      rowKabinet.Properties.Value := -1;
      rowIssl.Visible := False;
      rowIssl.Tag := -1;
      rowIssl.Properties.Value := null;

      merAge.Visible := False;
      merAge.Properties.Editors[0].Value := 0;
      merAge.Properties.Editors[1].Value := 0;

      rowOpl.Visible := False;
      rowCategory.Visible := False;
      rowUch.Visible := False;
      rowPeriod.Visible := False;
      rowCategoryAnother.Visible := False;

      rowUch.Tag := -1;
      rowUch.Properties.Value := null;
      rowUch.Properties.ImageIndex := -1;
      rowUch.Styles.Content := stNormal;
      rowUch.Styles.Header := stNormal;

      rowCategory.Properties.Value := 0;
      rowCategory.Properties.ImageIndex := -1;
      rowCategory.Styles.Content := stNormal;
      rowCategory.Styles.Header := stNormal;

      rowPeriod.Properties.Value := -1;
      rowPeriod.Properties.ImageIndex := -1;
      rowPeriod.Styles.Content := stNormal;
      rowPeriod.Styles.Header := stNormal;

      rowOpl.Properties.Value := -1;
      rowOpl.Properties.ImageIndex := -1;
      rowOpl.Styles.Content := stNormal;
      rowOpl.Styles.Header := stNormal;

      rowKoren.Properties.Value := -1;
      rowKoren.Properties.ImageIndex := -1;
      rowKoren.Styles.Content := stNormal;
      rowKoren.Styles.Header := stNormal;

      rowPlace.Properties.Value := -1;
      rowPlace.Properties.ImageIndex := -1;
      rowPlace.Styles.Content := stNormal;
      rowPlace.Styles.Header := stNormal;

      rowTypeNaz.Properties.Value := -1;
      rowTypeNaz.Properties.ImageIndex := -1;
      rowTypeNaz.Styles.Content := stNormal;
      rowTypeNaz.Styles.Header := stNormal;

      rowTarget.Properties.Value := -1;
      rowTarget.Properties.ImageIndex := -1;
      rowTarget.Styles.Content := stNormal;
      rowTarget.Styles.Header := stNormal;

      rowPriem.Properties.Value := -1;
      rowPriem.Properties.ImageIndex := -1;
      rowPriem.Styles.Content := stNormal;
      rowPriem.Styles.Header := stNormal;

      rowApparat.Properties.Value := -1;
      rowApparat.Properties.ImageIndex := -1;
      rowApparat.Styles.Content := stNormal;
      rowApparat.Styles.Header := stNormal;

      rowZakl1.Tag := -1;
      rowZakl1.Properties.Value := null;
      rowZakl1.Properties.ImageIndex := -1;
      rowZakl1.Styles.Content := stNormal;
      rowZakl1.Styles.Header := stNormal;

      rowZakl2.Tag := -1;
      rowZakl2.Properties.Value := null;
      rowZakl2.Properties.ImageIndex := -1;
      rowZakl2.Styles.Content := stNormal;
      rowZakl2.Styles.Header := stNormal;

      rowWork.Tag := -1;
      rowWork.Properties.Value := null;
      rowWork.Properties.ImageIndex := -1;
      rowWork.Styles.Content := stNormal;
      rowWork.Styles.Header := stNormal;

      aNaprav.Visible := False;
      aProtocol.Visible := False;
      aOtmena.Visible := False;
      viewnum.Visible := False;
      VIEWREASONCANCEL.Visible := False;
      VIEW_DOZA.Visible := False;

      VIEW_FD_RUN.Caption := 'Дата зач.';
      aPrint.Visible := False;
      N7.Visible := False;
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

procedure TfrmMain.rowUchEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetUch, frmSetUch);
      try
        frmSetUch.DoShowForm;
        frmSetUch.ShowModal;
        if frmSetUch.ModalResult = mrOk then
          begin
            rowUch.Tag := frmSetUch.odsListUch.FieldByName('FK_ID').AsInteger;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := frmSetUch.lcbType.EditText+'-'+frmSetUch.odsListUch.FieldByName('nameuch').AsString;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            if rowUch.Tag = -1 then
              begin
                rowUch.Properties.ImageIndex := -1;
                rowUch.Styles.Content := stNormal;
                rowUch.Styles.Header := stNormal;
              end else
              begin
                rowUch.Properties.ImageIndex := 4;
                rowUch.Styles.Content := stBold;
                rowUch.Styles.Header := stBold;
              end;
          end;
      finally
        frmSetUch.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      rowUch.Tag := -1;
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      rowUch.Properties.ImageIndex := -1;
      rowUch.Styles.Content := stNormal;
      rowUch.Styles.Header := stNormal;
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

procedure TfrmMain.rowZakl1EditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmZakl, frmZakl);
      try
        frmZakl.ShowModal;
        if frmZakl.ModalResult = MrOk then
          begin
            rowZakl1.Tag := frmZakl.odsTree.FieldByName('FK_ID').AsInteger;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := frmZakl.odsTree.FieldByName('FC_NAME').AsString;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            if rowZakl1.Tag = -1 then
              begin
                rowZakl1.Properties.ImageIndex := -1;
                rowZakl1.Styles.Content := stNormal;
                rowZakl1.Styles.Header := stNormal;
              end else
              begin
                rowZakl1.Properties.ImageIndex := 4;
                rowZakl1.Styles.Content := stBold;
                rowZakl1.Styles.Header := stBold;
              end;
          end;
      finally
        frmZakl.Free;
      end;
  end;
  if AButtonIndex = 1 then
    begin
      rowZakl1.Tag := -1;
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      rowZakl1.Properties.ImageIndex := -1;
      rowZakl1.Styles.Content := stNormal;
      rowZakl1.Styles.Header := stNormal;
    end;
end;

procedure TfrmMain.rowZakl2EditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmZakl, frmZakl);
      try
        frmZakl.ShowModal;
        if frmZakl.ModalResult = MrOk then
          begin
            rowZakl2.Tag := frmZakl.odsTree.FieldByName('FK_ID').AsInteger;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := frmZakl.odsTree.FieldByName('FC_NAME').AsString;
            TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            if rowZakl2.Tag = -1 then
              begin
                rowZakl2.Properties.ImageIndex := -1;
                rowZakl2.Styles.Content := stNormal;
                rowZakl2.Styles.Header := stNormal;
              end else
              begin
                rowZakl2.Properties.ImageIndex := 4;
                rowZakl2.Styles.Content := stBold;
                rowZakl2.Styles.Header := stBold;
              end;
          end;
      finally
        frmZakl.Free;
      end;
  end;
  if AButtonIndex = 1 then
    begin
      rowZakl2.Tag := -1;
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(VerticalGrid.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(VerticalGrid.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      rowZakl2.Properties.ImageIndex := -1;
      rowZakl2.Styles.Content := stNormal;
      rowZakl2.Styles.Header := stNormal;
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
