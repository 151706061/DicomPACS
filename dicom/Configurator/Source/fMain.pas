unit fMain;

interface

{
FormCreate line line 754  -- начальная инициализация каталога
sys_read        line 298  -- чтение параметров
Myparams_save   line 776  -- сохранение параметров
}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsdxBarPainter, ImgList, dxBar,
  cxClasses, ActnList, ComCtrls, cxControls, cxContainer, cxTreeView,
  dxSkinscxPCPainter, cxPC, cxSplitter, ExtCtrls, StdCtrls, IBDatabase, DB,
  FIBDatabase, pFIBDatabase, Menus, cxLookAndFeelPainters, cxButtons, cxEdit,
  cxTextEdit, JvBaseDlg, JvBrowseFolder, IB_Services, cxGraphics, cxLabel,
  cxCheckBox, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxMemo, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, cxMaskEdit, cxDropDownEdit,
  cxCalendar, JvExExtCtrls, JvExtComponent, JvPanel, FIBDataSet, pFIBDataSet,
  cxGroupBox, cxRadioGroup, dxSkinOffice2007Green, jvDBUtils,
  Grids, DBGrids, DCM32, DCM_Attributes, JvExDBGrids, Registry,
  cxGridExportLink, frxClass, frxDBSet, DateUtils, UnAbout,
  IBServices, StrUtils, FIBQuery, pFIBQuery, dxBarExtItems, JvAppInst,
  dxSkinBlack, dxSkinOffice2007Black, MemDS, DBAccess, Uni, Medotrade, Oracle,
  OracleData, dxmdaset, DCM_Dict, DCM_UID, ComObj;

type
  TfrmMain = class(TForm)
    ilMain: TImageList;
    dlgrezcopy: TJvBrowseForFolderDialog;
    actlstal: TActionList;
    actOpenCatalog: TAction;
    actCreateBackUpCopy: TAction;
    actClose: TAction;
    ParamsSave: TAction;
    dlglocimg: TJvBrowseForFolderDialog;
    actOpenCatLocalDBImages: TAction;
    dsEvents: TDataSource;
    pFIBEvents: TpFIBDataSet;
    pFIBDevices: TpFIBDataSet;
    dsDevices: TDataSource;
    actEdtDevice: TAction;
    actInsDevice: TAction;
    actDltDevice: TAction;
    actRefreshLog: TAction;
    actStartProcess: TAction;
    actStopProcess: TAction;
    actReboot: TAction;
    actRefrDevices: TAction;
    dxbrmngr1: TdxBarManager;
    dxbrmngr1Bar1: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    Panel1: TPanel;
    pnl2: TPanel;
    btnSave: TcxButton;
    btnClose: TcxButton;
    cxpgcntrl1: TcxPageControl;
    TSDatabase: TcxTabSheet;
    TSLocal: TcxTabSheet;
    TSEvents: TcxTabSheet;
    GrTVList: TcxGrid;
    TVList: TcxGridDBTableView;
    FD_DATE: TcxGridDBColumn;
    FN_TYPE: TcxGridDBColumn;
    FC_NAME: TcxGridDBColumn;
    FC_REMARK: TcxGridDBColumn;
    GrTVListdlvlGrLevel1: TcxGridLevel;
    cxmLog: TcxMemo;
    cxspltr2: TcxSplitter;
    TSDevices: TcxTabSheet;
    cxgrdDevices: TcxGrid;
    cxDV: TcxGridDBTableView;
    FC_COMMENT: TcxGridDBColumn;
    FC_TITLE: TcxGridDBColumn;
    FC_IP: TcxGridDBColumn;
    FN_PORT: TcxGridDBColumn;
    cxgrdlvl1: TcxGridLevel;
    dxbrdckcntrl1: TdxBarDockControl;
    pnl3: TPanel;
    cxCheckBox2: TcxCheckBox;
    pFIBDevicesFC_IP: TFIBStringField;
    pFIBDevicesFK_ID: TFIBIntegerField;
    pFIBDevicesFN_PORT: TFIBIntegerField;
    pFIBDevicesFC_TITLE: TFIBStringField;
    pFIBDevicesFC_COMMENT: TFIBStringField;
    Panel2: TPanel;
    cxtrvwTree: TcxTreeView;
    Panel3: TPanel;
    btnConnect: TcxButton;
    btnDisconnect: TcxButton;
    btnReconnect: TcxButton;
    cxlblWarBD: TcxLabel;
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
    aExcel: TAction;
    aPrintDev: TAction;
    aListClr: TAction;
    sdPopUp: TSaveDialog;
    pmDV: TPopupMenu;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    aText1: TAction;
    aPrintLog: TAction;
    aWeb1: TAction;
    aXML1: TAction;
    aExcel1: TAction;
    aListClr1: TAction;
    tsRules: TcxTabSheet;
    dxBarDockControl1: TdxBarDockControl;
    dxbrmngr1Bar2: TdxBar;
    bbAddRul: TdxBarButton;
    bbDelRul: TdxBarButton;
    bbRefRul: TdxBarButton;
    tvRules: TcxGridDBTableView;
    grRulesLevel1: TcxGridLevel;
    grRules: TcxGrid;
    aAddRul: TAction;
    aDelRul: TAction;
    aRefRul: TAction;
    dsRules: TDataSource;
    pFIBRules: TpFIBDataSet;
    tvRulesName: TcxGridDBColumn;
    pmRules: TPopupMenu;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    aPrintRul: TAction;
    aTextRul: TAction;
    aWebRul: TAction;
    aXMLRul: TAction;
    aExcelRul: TAction;
    LbRbtSrv: TcxLabel;
    JvAppInstances: TJvAppInstances;
    cxlbl10: TcxLabel;
    cxtxtCtlgLog: TcxTextEdit;
    btn1: TcxButton;
    gbStat: TcxGroupBox;
    cxlbl4: TcxLabel;
    lbl11: TcxLabel;
    cxlbl5: TcxLabel;
    lbl10: TcxLabel;
    cxlbl6: TcxLabel;
    lbl9: TcxLabel;
    cxlbl7: TcxLabel;
    lbl8: TcxLabel;
    gbReservBD: TcxGroupBox;
    cxlbl8: TcxLabel;
    cxlbl9: TcxLabel;
    cxtxtdtBD: TcxTextEdit;
    btnBackUp: TcxButton;
    btnOpen: TcxButton;
    gbPathBD: TcxGroupBox;
    cxGroupBox5: TcxGroupBox;
    cxLabel2: TcxLabel;
    cxlbl11: TcxLabel;
    cxlbl12: TcxLabel;
    TEIPServer: TcxTextEdit;
    cxtAE_TITLE: TcxTextEdit;
    cxtSERVER_PORT: TcxTextEdit;
    cxchckbxchkAE: TcxCheckBox;
    cbIsWrtLog: TcxCheckBox;
    CB_is_stor_comm_ex: TcxCheckBox;
    gbJur: TcxGroupBox;
    cxlbl2: TcxLabel;
    cxdtdtDate1: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxdtdtDate2: TcxDateEdit;
    bRefJur: TcxButton;
    gbFilters: TcxGroupBox;
    cxCBall: TcxCheckBox;
    cxCBstart: TcxCheckBox;
    cxCBstop: TcxCheckBox;
    cxchckbxerror: TcxCheckBox;
    cxchckbxevents: TcxCheckBox;
    cxchckbxParamEdit: TcxCheckBox;
    pFIBDevicesFN_TYPE: TFIBIntegerField;
    colFN_TPE: TcxGridDBColumn;
    pFIBDevicesDEV_TYPE: TFIBStringField;
    tvRulesSource: TcxGridDBColumn;
    tvRulesMod: TcxGridDBColumn;
    dxbarseparator: TdxBarSeparator;
    dxbarseparator2: TdxBarSeparator;
    cb_use_3d: TcxCheckBox;
    tvFN_COMPRESS: TcxGridDBColumn;
    tvFN_PRC_COMPRESS: TcxGridDBColumn;
    tsResend: TcxTabSheet;
    pFIBJrnlRsnd: TpFIBDataSet;
    dsJrnlRsnd: TDataSource;
    tvListRsnd: TcxGridDBTableView;
    grRsndLevel1: TcxGridLevel;
    grRsnd: TcxGrid;
    TYP_NAME: TcxGridDBColumn;
    FC_CALLINGTITLE: TcxGridDBColumn;
    FC_CALLEDTITLE: TcxGridDBColumn;
    FC_MODALITY: TcxGridDBColumn;
    FD_STUDYDATE: TcxGridDBColumn;
    FD_DATE1: TcxGridDBColumn;
    FN_AMM: TcxGridDBColumn;
    FC_PATIENTID: TcxGridDBColumn;
    FC_PATIENTNAME: TcxGridDBColumn;
    cxGroupBox1: TcxGroupBox;
    cxLabel3: TcxLabel;
    cxButton1: TcxButton;
    cxDateEdit1: TcxDateEdit;
    ActRefrResend: TAction;
    pmResend: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    Excel1: TMenuItem;
    aTextRsnd: TAction;
    aWebRsnd: TAction;
    aXMLRsnd: TAction;
    aExcelRsnd: TAction;
    aPrintRsnd: TAction;
    FC_ACCESSIONNUMBER: TcxGridDBColumn;
    FN_AMM_int: TcxGridDBColumn;
    FN_AMM_ERR: TcxGridDBColumn;
    cxButton2: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxSplitter1: TcxSplitter;
    Panel4: TPanel;
    cxGroupBox2: TcxGroupBox;
    cxLabel4: TcxLabel;
    cxDtIssl1: TcxDateEdit;
    cxLabel5: TcxLabel;
    cxDtIssl2: TcxDateEdit;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxDtPatId: TcxTextEdit;
    cxPatient: TcxTextEdit;
    cxCalledAE: TcxTextEdit;
    cxCallingAE: TcxTextEdit;
    cxCBMod: TcxComboBox;
    cxLabel12: TcxLabel;
    cxAccessionNumber: TcxTextEdit;
    bbRsnd: TcxButton;
    aDoRsnd: TAction;
    FK_ID: TcxGridDBColumn;
    frxRptRsnd: TfrxReport;
    frxRptRules: TfrxReport;
    frxRptEvents: TfrxReport;
    frxRptDevices: TfrxReport;
    frxDBEvents: TfrxDBDataset;
    frxDBDevices: TfrxDBDataset;
    frxDBRules: TfrxDBDataset;
    frxDBRsnd: TfrxDBDataset;
    tvFN_COMPRESS1: TcxGridDBColumn;
    pFIBJrnlRsndFK_ID: TFIBIntegerField;
    pFIBJrnlRsndFN_TYPE: TFIBSmallIntField;
    pFIBJrnlRsndFC_CALLINGTITLE: TFIBStringField;
    pFIBJrnlRsndFC_CALLEDTITLE: TFIBStringField;
    pFIBJrnlRsndFC_STUDYUID: TFIBStringField;
    pFIBJrnlRsndFC_MODALITY: TFIBStringField;
    pFIBJrnlRsndFD_STUDYDATE: TFIBDateField;
    pFIBJrnlRsndFD_DATE: TFIBDateField;
    pFIBJrnlRsndFN_AMM: TFIBIntegerField;
    pFIBJrnlRsndFN_AMM_ERR: TFIBIntegerField;
    pFIBJrnlRsndFC_PATIENTID: TFIBStringField;
    pFIBJrnlRsndFC_PATIENTNAME: TFIBStringField;
    pFIBJrnlRsndFC_ENAME: TFIBStringField;
    pFIBJrnlRsndFC_ACCESSIONNUMBER: TFIBStringField;
    pFIBRulesFC_TITLE: TFIBStringField;
    pFIBRulesFK_ID: TFIBIntegerField;
    pFIBRulesFN_PRC_COMPRESS: TFIBSmallIntField;
    pFIBRulesFC_AET_SOURCE: TFIBStringField;
    pFIBRulesFC_MOD: TFIBStringField;
    pFIBRulesFN_COMPRESS: TFIBIntegerField;
    UniEvents: TUniQuery;
    UniDevices: TUniQuery;
    UniRules: TUniQuery;
    UniJrnlRsnd: TUniQuery;
    dxBarButton6: TdxBarButton;
    actEdtTags: TAction;
    cxGroupBox3: TcxGroupBox;
    cxLabel11: TcxLabel;
    cxtxtdt1: TcxTextEdit;
    cxButton7: TcxButton;
    TSWORKLIST: TcxTabSheet;
    TSPacients: TcxTabSheet;
    cxGroupBox4: TcxGroupBox;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    teIPWORKLIST: TcxTextEdit;
    teAEWORKLIST: TcxTextEdit;
    tePortWORKLIST: TcxTextEdit;
    cbCheckAEWorklist: TcxCheckBox;
    cbLOGWorklist: TcxCheckBox;
    dxBarDockControl2: TdxBarDockControl;
    dxbrmngr1Bar3: TdxBar;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    Panel5: TPanel;
    jr: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxP_ENAME: TcxGridDBColumn;
    cxP_AETITLE: TcxGridDBColumn;
    cxACCESSIONNUMBERs: TcxGridDBColumn;
    cxP_ST_DT: TcxGridDBColumn;
    cxSTATUS: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    pFIBWORKLIST: TpFIBDataSet;
    dsWORKLIST: TDataSource;
    pFIBDevicesFN_TRANSFER: TIntegerField;
    OraEvents: TOracleDataSet;
    OraDevices: TOracleDataSet;
    OraRules: TOracleDataSet;
    OraJrnlRsnd: TOracleDataSet;
    OraWORKLIST: TOracleDataSet;
    UniWORKLIST: TUniQuery;
    CB_is_add_tags: TcxCheckBox;
    dxMemData1: TdxMemData;
    dxMemData1fc_calledtitle: TStringField;
    dxMemData1fc_ip: TStringField;
    dxMemData1studyuid: TStringField;
    dxMemData1instanceuid: TStringField;
    dxMemData1ldate: TDateField;
    dxMemData1fn_port: TIntegerField;
    dxMemData1imagetype: TStringField;
    dxMemData1studyid: TStringField;
    dxMemData1seriesuid: TStringField;
    dxMemData1FN_TRANSFERSYNTAX: TIntegerField;
    btnConnectWL: TcxButton;
    btnDisconnectWL: TcxButton;
    btnReconnectWL: TcxButton;
    cxlblWarBDWL: TcxLabel;
    tsNewWorkList: TcxTabSheet;
    dxBarDockControl3: TdxBarDockControl;
    dxbrmngr1Bar4: TdxBar;
    dxBarButton12: TdxBarButton;
    dxBarButton13: TdxBarButton;
    dxBarButton14: TdxBarButton;
    dxBarButton15: TdxBarButton;
    aCreateWorklist: TAction;
    aDeleteWorklist: TAction;
    aChangeStatusWorklist: TAction;
    aRefreshWorklist: TAction;
    mdWorklist: TdxMemData;
    dxBarButton16: TdxBarButton;
    aDispWorklist: TAction;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    dsWLnew: TDataSource;
    mdWorklistP_ENAME: TStringField;
    mdWorklistP_SEX: TStringField;
    mdWorklistP_PID: TStringField;
    mdWorklistP_DATEBORN: TDateTimeField;
    Panel6: TPanel;
    cxGroupBox6: TcxGroupBox;
    cxLabel18: TcxLabel;
    deStartDateWorklist: TcxDateEdit;
    cxLabel19: TcxLabel;
    deEndDateWorklist: TcxDateEdit;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    tePatientID: TcxTextEdit;
    tePacFIO: TcxTextEdit;
    cbModality: TcxComboBox;
    cxLabel25: TcxLabel;
    teAccessionnumber: TcxTextEdit;
    cxSplitter2: TcxSplitter;
    bTest: TcxButton;
    mdWorklistSTUDYUID: TStringField;
    mdWorklistModality: TStringField;
    mdWorklistStartDateWorklist: TStringField;
    mdWorklistEndDateWorklist: TStringField;
    mdWorklistStepStartTime: TStringField;
    mdWorklistStepFinishTime: TStringField;
    mdWorklistPhysiciansName: TStringField;
    mdWorklistStepDescription: TStringField;
    mdWorklistStepID: TStringField;
    mdWorklistStationName: TStringField;
    mdWorklistProcedureID: TStringField;
    mdWorklistProcDescription: TStringField;
    mdWorklistProcPriority: TStringField;
    mdWorklistStationAETitle: TStringField;
    cxFld_P_ENAME: TcxGridDBColumn;
    cxFld_P_DATEBORN: TcxGridDBColumn;
    cxFld_Modality: TcxGridDBColumn;
    cxFld_StationAETitle: TcxGridDBColumn;
    cxFld_StartDateWorklist: TcxGridDBColumn;
    cxFld_StepStartTime: TcxGridDBColumn;
    mdWorklistACCESSIONNUMBER: TStringField;
    mdWorklistSTATUS: TStringField;
    pnlAbout: TPanel;
    cbAbout: TcxButton;
    cxFld_StudyUID: TcxGridDBColumn;
    cxFld_P_PID: TcxGridDBColumn;
    teSTATUS: TcxComboBox;
    cxLabel23: TcxLabel;
    cxButton3: TcxButton;
    cxButton8: TcxButton;
    cxButton9: TcxButton;
    cxLabel24: TcxLabel;
    cxtxtCtlgAutoLoad: TcxTextEdit;
    cxButton10: TcxButton;
    cxLabel26: TcxLabel;
    cxAutoLoadTm: TcxTextEdit;
    cxLabel27: TcxLabel;
    actOpenCatLogFiles: TAction;
    cbWrtLogToDB: TcxCheckBox;
    cbIsWrtLogDicomObmen: TcxCheckBox;
    gbTESTIMAGES: TcxGroupBox;
    cxButton11: TcxButton;
    Panel7: TPanel;
    cxGrid1: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    dsTestFiles: TDataSource;
    dxMemTestFiles: TdxMemData;
    cxLabel13: TcxLabel;
    cxdtBeg: TcxDateEdit;
    cxdtEnd: TcxDateEdit;
    cxLabel14: TcxLabel;
    cbModality1: TcxComboBox;
    cxLabel28: TcxLabel;
    cxLabel29: TcxLabel;
    teAETitleApparat: TcxTextEdit;
    ProgressBar1: TProgressBar;
    dxMemTestFilesp_pid: TStringField;
    dxMemTestFilesp_ename: TStringField;
    dxMemTestFilesp_ename_rus: TStringField;
    dxMemTestFilesp_dateborn: TDateTimeField;
    dxMemTestFilesstudies_image_type: TStringField;
    dxMemTestFilesldate: TDateTimeField;
    dxMemTestFilesstudyuid: TStringField;
    dxMemTestFilesaccessionnumber: TStringField;
    dxMemTestFilesinstanceuid: TStringField;
    dxMemTestFilesseriesuid: TStringField;
    cxGridDBTableView2accessionnumber: TcxGridDBColumn;
    cxGridDBTableView2instanceuid: TcxGridDBColumn;
    cxGridDBTableView2ldate: TcxGridDBColumn;
    cxGridDBTableView2p_dateborn: TcxGridDBColumn;
    cxGridDBTableView2p_ename: TcxGridDBColumn;
    cxGridDBTableView2p_ename_rus: TcxGridDBColumn;
    cxGridDBTableView2p_pid: TcxGridDBColumn;
    cxGridDBTableView2RecId: TcxGridDBColumn;
    cxGridDBTableView2seriesuid: TcxGridDBColumn;
    cxGridDBTableView2studies_image_type: TcxGridDBColumn;
    cxGridDBTableView2studyuid: TcxGridDBColumn;
    cxGridDBTableView2AEApparat: TcxGridDBColumn;
    dxMemTestFilesAEApparat: TStringField;
    cxLabel31: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxLabel32: TcxLabel;
    dxMemTestFilesfcERRORtext: TStringField;
    cxGridDBTableView2fcERRORtext: TcxGridDBColumn;
    cxLabel33: TcxLabel;
    teSTUDYUID: TcxTextEdit;
    cxButton12: TcxButton;
    cbANinPID: TcxCheckBox;
    cxButton13: TcxButton;
    cbMPPS: TcxCheckBox;
    TSWADO: TcxTabSheet;
    cxGroupBox8: TcxGroupBox;
    cxLabel30: TcxLabel;
    cxLabel35: TcxLabel;
    teWADOhostname: TcxTextEdit;
    teWADOport: TcxTextEdit;
    cbWADOlog: TcxCheckBox;
    cxButton14: TcxButton;
    cxButton15: TcxButton;
    cxButton16: TcxButton;
    lbWADOproc: TcxLabel;
    cxButton18: TcxButton;
    cxGroupBox9: TcxGroupBox;
    cxLabel34: TcxLabel;
    cxLabel36: TcxLabel;
    cxLabel37: TcxLabel;
    tePACSSend_pg_database: TcxTextEdit;
    tePACSSend_pg_server: TcxTextEdit;
    tePACSSend_pg_port: TcxTextEdit;
    cxButton17: TcxButton;
    cbPACSSendToMisPacNet: TcxCheckBox;
    cxLabel38: TcxLabel;
    tePACSSend_pg_user: TcxTextEdit;
    cxLabel39: TcxLabel;
    tePACSSend_pg_password: TcxTextEdit;
    cxLabel40: TcxLabel;
    tevPACSSend_pg_Schema: TcxTextEdit;
    cxGroupBox10: TcxGroupBox;
    cxLabel41: TcxLabel;
    cxLabel42: TcxLabel;
    cxLabel43: TcxLabel;
    teWLSend_pg_database: TcxTextEdit;
    teWLSend_pg_server: TcxTextEdit;
    teWLSend_pg_port: TcxTextEdit;
    cxButton19: TcxButton;
    cbIsSendWlToMisPacNet: TcxCheckBox;
    cxLabel44: TcxLabel;
    teWLSend_pg_user: TcxTextEdit;
    cxLabel45: TcxLabel;
    teWLSend_pg_password: TcxTextEdit;
    cxLabel46: TcxLabel;
    teWLSend_pg_Schema: TcxTextEdit;
    cxLabel47: TcxLabel;
    teWLTimeCheckPacNet: TcxTextEdit;
    teWLAmmStoreDays: TcxTextEdit;
    cxLabel48: TcxLabel;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxLabel49: TcxLabel;
    tePACS_pg_database: TcxTextEdit;
    cxLabel50: TcxLabel;
    tePACS_pg_user: TcxTextEdit;
    cxLabel51: TcxLabel;
    tePACS_pg_port: TcxTextEdit;
    cxLabel52: TcxLabel;
    tePACS_pg_password: TcxTextEdit;
    cxLabel53: TcxLabel;
    tePACS_pg_server: TcxTextEdit;
    cxLabel54: TcxLabel;
    tePACS_pg_Schema: TcxTextEdit;
    cxButton20: TcxButton;
    cxGroupBox7: TcxGroupBox;
    cxPageControl2: TcxPageControl;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    cxLabel55: TcxLabel;
    teWL_pg_database: TcxTextEdit;
    cxLabel56: TcxLabel;
    teWL_pg_user: TcxTextEdit;
    cxLabel57: TcxLabel;
    teWL_pg_port: TcxTextEdit;
    cxLabel58: TcxLabel;
    teWL_pg_password: TcxTextEdit;
    cxLabel59: TcxLabel;
    teWL_pg_server: TcxTextEdit;
    cxLabel60: TcxLabel;
    teWL_pg_Schema: TcxTextEdit;
    cxButton21: TcxButton;
    cxGroupBox11: TcxGroupBox;
    cxPageControl3: TcxPageControl;
    cxTabSheet5: TcxTabSheet;
    cxTabSheet6: TcxTabSheet;
    cxLabel61: TcxLabel;
    teWADO_pg_database: TcxTextEdit;
    cxLabel62: TcxLabel;
    teWADO_pg_user: TcxTextEdit;
    cxLabel63: TcxLabel;
    teWADO_pg_port: TcxTextEdit;
    cxLabel64: TcxLabel;
    teWADO_pg_password: TcxTextEdit;
    cxLabel65: TcxLabel;
    teWADO_pg_server: TcxTextEdit;
    cxLabel66: TcxLabel;
    teWADO_pg_Schema: TcxTextEdit;
    cxButton22: TcxButton;
    cbWL_use_Postgres: TcxCheckBox;
    cbWADO_use_Postgres: TcxCheckBox;
    cbPACS_use_Postgres: TcxCheckBox;
    cxLabel67: TcxLabel;
    teWL_max_connections: TcxTextEdit;
    cxLabel68: TcxLabel;
    teWLMinFreeMemory: TcxTextEdit;
    cxLabel69: TcxLabel;
    cxLabel70: TcxLabel;
    teWLMaxTimeoutThreadWait: TcxTextEdit;
    cxLabel71: TcxLabel;
    cxLabel72: TcxLabel;
    teWADO_max_connections: TcxTextEdit;
    cxLabel73: TcxLabel;
    teWADOMinFreeMemory: TcxTextEdit;
    cxLabel74: TcxLabel;
    cxLabel75: TcxLabel;
    teWADOMaxTimeoutThreadWait: TcxTextEdit;
    cxLabel76: TcxLabel;
    cxLabel77: TcxLabel;
    cxLabel78: TcxLabel;
    tePACSMinFreeMemory: TcxTextEdit;
    tePACS_max_connections: TcxTextEdit;
    cxLabel79: TcxLabel;
    cxLabel80: TcxLabel;
    tePACSMaxTimeoutThreadWait: TcxTextEdit;
    cxLabel81: TcxLabel;
    cxButton23: TcxButton;
    TSDBBACKUP: TcxTabSheet;
    cxGroupBox12: TcxGroupBox;
    cbAutoBackup: TcxCheckBox;
    cbPACS: TcxCheckBox;
    cbWORKLIST: TcxCheckBox;
    cbWADO: TcxCheckBox;
    cxLabel88: TcxLabel;
    teCatalogDbBackup: TcxTextEdit;
    cxButton25: TcxButton;
    cxButton24: TcxButton;
    cxButton26: TcxButton;
    cxLabel82: TcxLabel;
    teHourDbBackup: TcxTextEdit;
    teMinuteDbBackup: TcxTextEdit;
    cxLabel83: TcxLabel;
    cxLabel84: TcxLabel;
    TSMonitor: TcxTabSheet;
    cbResetEchoAsk: TCheckBox;
    lbInterval: TLabel;
    edEchoInterval: TEdit;
    cbEchoLog: TCheckBox;
    cbEchoWrtLogFile: TCheckBox;
    Panel8: TPanel;
    meECHOLog: TMemo;
    tmEchoTest: TTimer;
    actEchoTimer: TAction;
    procedure cxtrvwTreeChange(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TSDatabaseShow(Sender: TObject);
    procedure actOpenCatalogExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actCreateBackUpCopyExecute(Sender: TObject);
    procedure ParamsSaveExecute(Sender: TObject);
    procedure actConnectExecute(Sender: TObject);
    procedure actOpenCatLocalDBImagesExecute(Sender: TObject);
    procedure TSLocalShow(Sender: TObject);
    procedure TSDevicesShow(Sender: TObject);
    procedure actEdtDeviceExecute(Sender: TObject);
    procedure actInsDeviceExecute(Sender: TObject);
    procedure actDltDeviceExecute(Sender: TObject);
    procedure actRefreshLogExecute(Sender: TObject);
    procedure actStartProcessExecute(Sender: TObject);
    procedure actStopProcessExecute(Sender: TObject);
    procedure actRebootExecute(Sender: TObject);
    procedure actRefrDevicesExecute(Sender: TObject);
    procedure TSEventsShow(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aExcelExecute(Sender: TObject);
    procedure aListClrExecute(Sender: TObject);
    procedure aText1Execute(Sender: TObject);
    procedure aWeb1Execute(Sender: TObject);
    procedure aXML1Execute(Sender: TObject);
    procedure aExcel1Execute(Sender: TObject);
    procedure aListClr1Execute(Sender: TObject);
    procedure cxtxtdtBDEditing(Sender: TObject; var CanEdit: Boolean);
    procedure cxtxtCtlgLogEditing(Sender: TObject; var CanEdit: Boolean);
    procedure cxtAE_TITLEEditing(Sender: TObject; var CanEdit: Boolean);
    procedure cxtSERVER_PORTEditing(Sender: TObject; var CanEdit: Boolean);
    procedure cxchckbxchkAEEditing(Sender: TObject; var CanEdit: Boolean);
    procedure cbIsWrtLogEditing(Sender: TObject; var CanEdit: Boolean);
    procedure cxCheckBox2Editing(Sender: TObject; var CanEdit: Boolean);
    procedure aPrintLogExecute(Sender: TObject);
    procedure aPrintDevExecute(Sender: TObject);
    procedure frxRptNewGetValue(Sender: TObject; const VarName: string;
      var Value: Variant);
    procedure FormShow(Sender: TObject);
    procedure aAddRulExecute(Sender: TObject);
    procedure aDelRulExecute(Sender: TObject);
    procedure aRefRulExecute(Sender: TObject);
    procedure tsRulesShow(Sender: TObject);
    procedure pFIBRulesAfterOpen(DataSet: TDataSet);
    procedure MenuItem19Click(Sender: TObject);
    procedure aTextRulExecute(Sender: TObject);
    procedure aWebRulExecute(Sender: TObject);
    procedure aXMLRulExecute(Sender: TObject);
    procedure aExcelRulExecute(Sender: TObject);
    procedure aPrintRulExecute(Sender: TObject);
    procedure JvAppInstancesRejected(Sender: TObject);
    procedure tvFN_COMPRESSGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: string);
    procedure tsResendShow(Sender: TObject);
    procedure ActRefrResendExecute(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure aTextRsndExecute(Sender: TObject);
    procedure aWebRsndExecute(Sender: TObject);
    procedure aXMLRsndExecute(Sender: TObject);
    procedure aExcelRsndExecute(Sender: TObject);
    procedure aPrintRsndExecute(Sender: TObject);
    procedure FN_AMMGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: string);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxSplitter1BeforeClose(Sender: TObject; var AllowClose: Boolean);
    procedure cxSplitter1BeforeOpen(Sender: TObject; var NewSize: Integer;
      var AllowOpen: Boolean);
    procedure aDoRsndExecute(Sender: TObject);
    procedure frxRptRsndNewGetValue(Sender: TObject; const VarName: string;
      var Value: Variant);
    procedure pFIBDevicesAfterOpen(DataSet: TDataSet);
    procedure pFIBJrnlRsndAfterOpen(DataSet: TDataSet);
    procedure frxRptRulesNewGetValue(Sender: TObject; const VarName: string;
      var Value: Variant);
    procedure tvListRsndSelectionChanged(Sender: TcxCustomGridTableView);
    procedure TVListCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure actEdtTagsExecute(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure TSPacientsShow(Sender: TObject);
    procedure dxBarButton11Click(Sender: TObject);
    procedure dxBarButton8Click(Sender: TObject);
    procedure dxBarButton9Click(Sender: TObject);
    procedure dxBarButton10Click(Sender: TObject);
    procedure btnDisconnectWLClick(Sender: TObject);
    procedure btnReconnectWLClick(Sender: TObject);
    procedure btnConnectWLClick(Sender: TObject);
    procedure aCreateWorklistExecute(Sender: TObject);
    procedure aDeleteWorklistExecute(Sender: TObject);
    procedure aChangeStatusWorklistExecute(Sender: TObject);
    procedure aRefreshWorklistExecute(Sender: TObject);
    procedure aDispWorklistExecute(Sender: TObject);
    procedure cxSplitter2BeforeClose(Sender: TObject; var AllowClose: Boolean);
    procedure cxSplitter2BeforeOpen(Sender: TObject; var NewSize: Integer;
      var AllowOpen: Boolean);
    procedure teIPWORKLISTEditing(Sender: TObject; var CanEdit: Boolean);
    procedure teAEWORKLISTEditing(Sender: TObject; var CanEdit: Boolean);
    procedure tePortWORKLISTEditing(Sender: TObject; var CanEdit: Boolean);
    procedure cbCheckAEWorklistEditing(Sender: TObject; var CanEdit: Boolean);
    procedure cbLOGWorklistEditing(Sender: TObject; var CanEdit: Boolean);
    procedure bTestClick(Sender: TObject);
    procedure tsNewWorkListShow(Sender: TObject);
    procedure TSWORKLISTShow(Sender: TObject);
    procedure cbAboutClick(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton9Click(Sender: TObject);
    procedure actOpenCatLogFilesExecute(Sender: TObject);
    procedure cxButton11Click(Sender: TObject);
    procedure cxButton12Click(Sender: TObject);
    procedure cxButton13Click(Sender: TObject);
    procedure cxButton14Click(Sender: TObject);
    procedure cxButton15Click(Sender: TObject);
    procedure cxButton16Click(Sender: TObject);
    procedure cxButton18Click(Sender: TObject);
    procedure teWADOhostnameEditing(Sender: TObject; var CanEdit: Boolean);
    procedure teWADOportEditing(Sender: TObject; var CanEdit: Boolean);
    procedure cbWADOlogEditing(Sender: TObject; var CanEdit: Boolean);
    procedure cbIsSendWlToMisPacNetEditing(Sender: TObject;
      var CanEdit: Boolean);
    procedure teWLSend_pg_databaseEditing(Sender: TObject;
      var CanEdit: Boolean);
    procedure teWLSend_pg_portEditing(Sender: TObject; var CanEdit: Boolean);
    procedure teWLSend_pg_serverEditing(Sender: TObject; var CanEdit: Boolean);
    procedure teWLTimeCheckPacNetEditing(Sender: TObject; var CanEdit: Boolean);
    procedure teWLSend_pg_userEditing(Sender: TObject; var CanEdit: Boolean);
    procedure teWLSend_pg_passwordEditing(Sender: TObject;
      var CanEdit: Boolean);
    procedure teWLSend_pg_SchemaEditing(Sender: TObject; var CanEdit: Boolean);
    procedure teWLAmmStoreDaysEditing(Sender: TObject; var CanEdit: Boolean);
    procedure cbPACSSendToMisPacNetEditing(Sender: TObject;
      var CanEdit: Boolean);
    procedure tePACSSend_pg_databaseEditing(Sender: TObject;
      var CanEdit: Boolean);
    procedure tePACSSend_pg_portEditing(Sender: TObject; var CanEdit: Boolean);
    procedure tePACSSend_pg_serverEditing(Sender: TObject;
      var CanEdit: Boolean);
    procedure tePACSSend_pg_userEditing(Sender: TObject; var CanEdit: Boolean);
    procedure tePACSSend_pg_passwordEditing(Sender: TObject;
      var CanEdit: Boolean);
    procedure tevPACSSend_pg_SchemaEditing(Sender: TObject;
      var CanEdit: Boolean);
    procedure cxButton17Click(Sender: TObject);
    procedure cxButton19Click(Sender: TObject);
    procedure cxButton20Click(Sender: TObject);
    procedure cxButton21Click(Sender: TObject);
    procedure cxButton22Click(Sender: TObject);
    procedure cxButton24Click(Sender: TObject);
    procedure cxButton26Click(Sender: TObject);
    procedure cxButton25Click(Sender: TObject);
    procedure cbResetEchoAskMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure actEchoTimerExecute(Sender: TObject);
  private
  public
    procedure wrtEchoMonitorLog( pStr:string );
    procedure db_conn_cmn;
    procedure events_refresh;
    procedure PanelDB_Show(const p_n_panel : integer );
    procedure p_devices_refr;
    procedure resend_refresh;
    procedure rules_refresh;
    procedure patients_WL_refresh;
    procedure CallFrm_Devices(const p_par:Byte);
    procedure getPos ( pOraQuery :TOracleDataSet ; p_UniQr:TUniQuery; p_FIB_DataSet: TpFIBDataSet; p_UniFldName:string = 'fk_id' );
    procedure setPos ( pOraQuery :TOracleDataSet ; p_UniQr:TUniQuery; p_FIB_DataSet: TpFIBDataSet; p_UniFldName:string = 'fk_id' );
    procedure Set_Equal_Values;
    function Chk_Equal_Values:string;
    procedure Myparams_save;
    procedure SetSavBtnCol( p_is_Act:Boolean );
    procedure pCheckPGConn( p_pg_database : string;
                                     p_pg_port     : integer;
                                     p_pg_server   : string;
                                     p_pg_Schema   : string;
                                     p_pg_user     : string;
                                     p_pg_password : string
                                   );
    procedure TreeChange(const p_SelIndex: integer);
  end;

const // установка цвета
      c_server_start_color = clTeal; // цвет для надписи сервер запущен
      c_server_stop_color  = clMaroon; // цвет для надписи сервер остановлен
      c_reg_lst_mn = '\SoftWare\SoftMaster\Configurator\';
      c_devices_rg = 'cxDV';
      c_events_rg  = 'TVList';
      c_devices_def_rg = 'cxDVDefault';
      c_events_def_rg  = 'TVListDefault';

      c_ini_file = 'Settings.ini';    //   Configurator.ini

var   frmMain: TfrmMain;
      //
      v_exe_path : AnsiString;
      //
      v_ip_fb,
      v_1_2_BCP_CATALOG         ,
      v_1_3_STORAGE_FOLDER      ,
      v_LOG_FOLDER,
      v_1_10_autoload_folder,
      v_1_11_autoload_timeout,
      v_1_4_SERVER_PORT         ,
      v_1_5_AE_TITLE,
      v_1_9_SERVER_IP            : String;
      v_1_6_IS_DEVICES_CHECK    ,
      v_1_7_IS_LOG_WRITE        ,

//      v_1_7_DB_LOG_WRITE        ,
      v_1_7_DCM_NET_LOG_WRITE        ,
      v_ANinPID ,

      v_1_8_IS_CHK_AETITLE      ,
      v_1_9_is_stor_comm_ex,
      v_is_add_tags     : Boolean;

      v_is_cxlbl8               : Boolean;

      myid : Integer;
      myids: string;

      LocAE : string;
      LocPort : integer;




function read_db_ip:string;

implementation

uses CmnUnit, IniFiles, pFIBProps, fBackUp, fEdtDevice, fAddRule, fTAGSEdt,
     DICOM_CMN, DB_CMN, DCM_Client, DCM_Connection, UnFrmProgressBar,
     UnfrmEdtPatient, UnEdtWLForm;

{$R *.dfm}

procedure TfrmMain.pCheckPGConn( p_pg_database : string;
                                 p_pg_port     : integer;
                                 p_pg_server   : string;
                                 p_pg_Schema   : string;
                                 p_pg_user     : string;
                                 p_pg_password : string
                               );
var v_PGconn : TUniConnection;
begin
  v_PGconn:= TUniConnection.Create(nil);
  v_PGconn.LoginPrompt:=False;
//  v_PGconn.Debug:=True;
  v_PGconn.ProviderName := 'PostgreSQL';
  v_PGconn.Database := p_pg_database;
  v_PGconn.Port := p_pg_port;
  v_PGconn.Server := p_pg_server;
  v_PGconn.SpecificOptions.Values['Schema'] := p_pg_Schema;
  v_PGconn.SpecificOptions.Values['UseUnicode'] := 'True';
  v_PGconn.Username := p_pg_user;
  v_PGconn.Password := p_pg_password;
  try
    try
      v_PGconn.Connected := True;
      if v_PGconn.Connected then
        ShowMessage('ОК ...')
      else
        ShowMessage('ERROR ...');
    except
      on e:Exception do
        ShowMessage( e.Message );
    end;
  finally
    if v_PGconn.Connected then v_PGconn.Connected := False;
    v_PGconn.Free;
  end;
end;

procedure TfrmMain.Set_Equal_Values;
  procedure setIntFrmVal ( pEd : TcxTextEdit; var pVal:Integer);
  begin
    if not TryStrToInt(pEd.Text,pVal) then begin
     pVal:=0;
     pEd.Text:='0';
   end;
  end;
begin
  v_LOG_FOLDER            := frmMain.cxtxtCtlgLog.Text;
  v_1_2_BCP_CATALOG       := frmMain.cxtxtdtBD.Text ;          //
  v_1_3_STORAGE_FOLDER    := frmMain.cxtxtdt1.Text ;           //
  v_1_10_autoload_folder  := frmMain.cxtxtCtlgAutoLoad.Text ;  //
  v_1_11_autoload_timeout := frmMain.cxAutoLoadTm.Text ;       //
  v_1_4_SERVER_PORT       := frmMain.cxtSERVER_PORT.Text ;     //
  v_1_5_AE_TITLE          := frmMain.cxtAE_TITLE.Text ;        //
  v_1_6_IS_DEVICES_CHECK  := frmMain.cxCheckBox2.Checked ;     //
  v_1_7_IS_LOG_WRITE      := frmMain.cbIsWrtLog.Checked ;      //

  v_1_7_DB_LOG_WRITE      := frmMain.cbWrtLogToDB.Checked ;
  v_1_7_DCM_NET_LOG_WRITE := frmMain.cbIsWrtLogDicomObmen.Checked ;

  v_ANinPID               := frmMain.cbANinPID.Checked ;

  v_1_8_IS_CHK_AETITLE    := frmMain.cxchckbxchkAE.Checked ;   //
  v_1_9_SERVER_IP         := frmMain.TEIPServer.Text ;         //
  v_1_9_is_stor_comm_ex   := frmMain.CB_is_stor_comm_ex.Checked ; //
  v_is_add_tags           := frmMain.CB_is_add_tags.Checked ; //
  v_teIPWORKLIST          := frmMain.teIPWORKLIST.Text;
  v_PortWORKLIST          := frmMain.tePortWORKLIST.Text;
  v_AEWORKLIST            := frmMain.teAEWORKLIST.Text;
  v_CheckAEWorklist       := frmMain.cbCheckAEWorklist.Checked;
  v_LOGWorklist           := frmMain.cbLOGWorklist.Checked;
  v_MPPS                  := frmMain.cbMPPS.Checked;

  v_WADOhostname := frmMain.teWADOhostname.Text;
  setIntFrmVal(frmMain.teWADOport,v_WADOport);
  v_is_WADOlog   := frmMain.cbWADOlog.Checked;

  // send accessionnumber from PACS to MIS while receive new study
   vPACSSendToMisPacNet := frmMain.cbPACSSendToMisPacNet.checked  ;
   vPACSSend_pg_database := frmMain.tePACSSend_pg_database.Text ;
   setIntFrmVal(frmMain.tePACSSend_pg_port,vPACSSend_pg_port);
   vPACSSend_pg_server := frmMain.tePACSSend_pg_server.Text ;
   vPACSSend_pg_user := frmMain.tePACSSend_pg_user.Text ;
   vPACSSend_pg_password := frmMain.tePACSSend_pg_password.Text ;
   vPACSSend_pg_Schema := frmMain.tevPACSSend_pg_Schema.Text  ;
  // ---------------------------------------------------------------------------
  // check list of accessionnumber from worklist
   setIntFrmVal(frmMain.teWLTimeCheckPacNet,v_WLTimeCheckPacNet);
   vIsSendWlToMisPacNet := frmMain.cbIsSendWlToMisPacNet.Checked;
   v_WLSend_pg_database := frmMain.teWLSend_pg_database.Text;
   setIntFrmVal(frmMain.teWLSend_pg_port,v_WLSend_pg_port);
   v_WLSend_pg_server := frmMain.teWLSend_pg_server.Text;
   v_WLSend_pg_user := frmMain.teWLSend_pg_user.Text;
   v_WLSend_pg_password := frmMain.teWLSend_pg_password.Text;
   v_WLSend_pg_Schema := frmMain.teWLSend_pg_Schema.Text;
   setIntFrmVal(frmMain.teWLAmmStoreDays,v_WLAmmStoreDays);
   // ---------------------------------------------------------------------------
   v_isWLPostgres := frmMain.cbWL_use_Postgres.checked;
   vWL_pg_database := frmMain.teWL_pg_database.Text  ;
   setIntFrmVal(frmMain.teWL_pg_port,vWL_pg_port);
   vWL_pg_server  := frmMain.teWL_pg_server.Text ;
   vWL_pg_user  := frmMain.teWL_pg_user.Text ;
   vWL_pg_password  := frmMain.teWL_pg_password.Text ;
   vWL_pg_Schema  := frmMain.teWL_pg_Schema.Text ;
   setIntFrmVal(frmMain.teWL_max_connections,vWL_max_connections);
   setIntFrmVal(frmMain.teWLMinFreeMemory,vWLMinFreeMemory);
   setIntFrmVal(frmMain.teWLMaxTimeoutThreadWait,vWLMaxTimeoutThreadWait);

   v_isWADOPostgres := frmMain.cbWADO_use_Postgres.checked;
   vWADO_pg_database  := frmMain.teWADO_pg_database.Text ;
   setIntFrmVal(frmMain.teWADO_pg_port,vWADO_pg_port);
   vWADO_pg_server   := frmMain.teWADO_pg_server.Text ;
   vWADO_pg_user  := frmMain.teWADO_pg_user.Text ;
   vWADO_pg_password  := frmMain.teWADO_pg_password.Text ;
   vWADO_pg_Schema  := frmMain.teWADO_pg_Schema.Text ;
   setIntFrmVal(frmMain.teWADO_max_connections,vWADO_max_connections);
   setIntFrmVal(frmMain.teWADOMinFreeMemory,vWADOMinFreeMemory);
   setIntFrmVal(frmMain.teWADOMaxTimeoutThreadWait,vWADOMaxTimeoutThreadWait);

   v_isPostgres := frmMain.cbPACS_use_Postgres.checked;
   v_pg_database := frmMain.tePACS_pg_database.Text;
   setIntFrmVal(frmMain.tePACS_pg_port,v_pg_port);
   v_pg_server := frmMain.tePACS_pg_server.Text;
   v_pg_user := frmMain.tePACS_pg_user.Text;
   v_pg_password := frmMain.tePACS_pg_password.Text;
   v_pg_Schema := frmMain.tePACS_pg_Schema.Text;
   setIntFrmVal(frmMain.tePACS_max_connections,vPACS_max_connections);
   setIntFrmVal(frmMain.tePACSMinFreeMemory,vPACSMinFreeMemory);
   setIntFrmVal(frmMain.tePACSMaxTimeoutThreadWait,vPACSMaxTimeoutThreadWait);

   v_cbAutoBackup   := cbAutoBackup.Checked;
   v_cbPACS         := cbPACS.Checked;
   v_cbWORKLIST     := cbWORKLIST.Checked;
   v_cbWADO         := cbWADO.Checked;
   v_teCatalogDbBackup := teCatalogDbBackup.Text;
   v_teHourDbBackup    := teHourDbBackup.Text;
   v_teMinuteDbBackup  := teMinuteDbBackup.Text;

end;

procedure TfrmMain.teAEWORKLISTEditing(Sender: TObject; var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.teIPWORKLISTEditing(Sender: TObject; var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.tePACSSend_pg_databaseEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.tePACSSend_pg_passwordEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.tePACSSend_pg_portEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.tePACSSend_pg_serverEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.tePACSSend_pg_userEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.tePortWORKLISTEditing(Sender: TObject; var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.tevPACSSend_pg_SchemaEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.teWADOhostnameEditing(Sender: TObject; var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.teWADOportEditing(Sender: TObject; var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.teWLAmmStoreDaysEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.teWLSend_pg_databaseEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.teWLSend_pg_passwordEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.teWLSend_pg_portEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.teWLSend_pg_SchemaEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.teWLSend_pg_serverEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.teWLSend_pg_userEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.teWLTimeCheckPacNetEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

function TfrmMain.Chk_Equal_Values:string;
begin
       if (frmMain.cxtxtdtBD.Text         <>  v_1_2_BCP_CATALOG)        then Result:='Каталог резервного копирования изменился'
  else if (frmMain.cxtxtdt1.Text          <>  v_1_3_STORAGE_FOLDER)     then Result:='Каталог базы изображений изменился'
  else if (frmMain.cxtxtCtlgLog.Text      <>  v_LOG_FOLDER)             then Result:='Каталог хранения файлов протоколов изменился'
  else if (frmMain.cxtxtCtlgAutoLoad.Text <>  v_1_10_autoload_folder)   then Result:='Каталог для загрузки исследований изменился'
  else if (frmMain.cxAutoLoadTm.Text      <>  v_1_11_autoload_timeout)  then Result:='Интервал загрузки исследований изменился'
  else if (frmMain.cxtSERVER_PORT.Text    <>  v_1_4_SERVER_PORT)        then Result:='Порт сервера изменился'
  else if (frmMain.cxtAE_TITLE.Text       <>  v_1_5_AE_TITLE)           then Result:='AETitle сервера изменился'
  else if (frmMain.cxCheckBox2.Checked    <>  v_1_6_IS_DEVICES_CHECK)   then Result:='Признак проверять устройства изменился'
  else if (frmMain.cbIsWrtLog.Checked     <>  v_1_7_IS_LOG_WRITE)       then Result:='Признак вести протокол изменился'

  else if (frmMain.cbWrtLogToDB.Checked   <>  v_1_7_DB_LOG_WRITE)       then Result:='Признак сохранять лог в БД изменился'
  else if (frmMain.cbIsWrtLogDicomObmen.Checked  <>  v_1_7_DCM_NET_LOG_WRITE) then Result:='Признак протоколировать обмен dicom сети изменился'

  else if (frmMain.cbANinPID.Checked   <>  v_ANinPID)                   then Result:='Признак искать Accessionnumber (номер протокола) в PatientID (номере медкарты) на сервере'

  else if (frmMain.cxchckbxchkAE.Checked  <> v_1_8_IS_CHK_AETITLE)      then Result:='Признак проверки AE Title изменился'
  else if (frmMain.TEIPServer.Text        <> v_1_9_SERVER_IP)           then Result:='IP-адрес сервера изменился'
  else if (frmMain.CB_is_stor_comm_ex.Checked <> v_1_9_is_stor_comm_ex) then Result:='Признак STORAGE COMMITMENT изменился'
  else if (frmMain.CB_is_add_tags.Checked <> v_is_add_tags)             then Result:='Признак private tags изменился'
  else if (v_teIPWORKLIST          <> frmMain.teIPWORKLIST.Text)        then Result:='IP Worklist изменился'
  else if (v_PortWORKLIST          <> frmMain.tePortWORKLIST.Text)      then Result:='Port WORKLIST изменился'
  else if (v_AEWORKLIST            <> frmMain.teAEWORKLIST.Text)        then Result:='AE WORKLIST изменился'
  else if (v_CheckAEWorklist       <> frmMain.cbCheckAEWorklist.Checked) then Result:='Признак проверки AE Worklist изменился'
  else if (v_LOGWorklist           <> frmMain.cbLOGWorklist.Checked)    then Result:='Признак вести протокол Worklist изменился'

  else if (v_WADOhostname          <> frmMain.teWADOhostname.Text)    then Result:='Host web сервера изменился'
  else if (IntToStr(v_WADOport)    <> frmMain.teWADOport.Text)     then Result:='Порт Web сервера изменился'
  else if (v_is_WADOlog            <> frmMain.cbWADOlog.Checked)    then Result:='Признак вести протокол Web сервера изменился'


  // ---------------------------------------------------------------------------
  // send accessionnumber from PACS to MIS while receive new study
  else if (vPACSSendToMisPacNet          <> frmMain.cbPACSSendToMisPacNet.checked)    then Result:='Отправка результатов на Patient.NET: признак "производить отправку" изменился'
  else if (vPACSSend_pg_database         <> frmMain.tePACSSend_pg_database.Text)    then Result:='Отправка результатов на Patient.NET: настройка "База данных" изменилась'
  else if (IntToStr(vPACSSend_pg_port)   <> frmMain.tePACSSend_pg_port.Text)    then Result:='Отправка результатов на Patient.NET: настройка "Порт" изменилась'
  else if (vPACSSend_pg_server           <> frmMain.tePACSSend_pg_server.Text)    then Result:='Отправка результатов на Patient.NET: настройка "Сервер" изменилась'
  else if (vPACSSend_pg_user             <> frmMain.tePACSSend_pg_user.Text)    then Result:='Отправка результатов на Patient.NET: настройка "Пользователь" изменилась'
  else if (vPACSSend_pg_password         <> frmMain.tePACSSend_pg_password.Text)    then Result:='Отправка результатов на Patient.NET: настройка "Пароль" изменилась'
  else if (vPACSSend_pg_Schema           <> frmMain.tevPACSSend_pg_Schema.Text)    then Result:='Отправка результатов на Patient.NET: настройка "Схема" изменилась'
  // ---------------------------------------------------------------------------
  // check list of accessionnumber from worklist
  else if (IntToStr(v_WLTimeCheckPacNet) <> frmMain.teWLTimeCheckPacNet.Text)      then Result:='Опрос Worklist`ом новых назначений Pacient.NET: настройка "Время опроса(мин)" изменилась'
  else if (vIsSendWlToMisPacNet          <> frmMain.cbIsSendWlToMisPacNet.Checked) then Result:='Опрос Worklist`ом новых назначений Pacient.NET: настройка "Опрашивать список исследований" изменилась'
  else if (v_WLSend_pg_database          <> frmMain.teWLSend_pg_database.Text)     then Result:='Опрос Worklist`ом новых назначений Pacient.NET: настройка "База данных" изменилась'
  else if (IntToStr(v_WLSend_pg_port)    <> frmMain.teWLSend_pg_port.Text)         then Result:='Опрос Worklist`ом новых назначений Pacient.NET: настройка "Порт" изменилась'
  else if (v_WLSend_pg_server            <> frmMain.teWLSend_pg_server.Text)       then Result:='Опрос Worklist`ом новых назначений Pacient.NET: настройка "Сервер" изменилась'
  else if (v_WLSend_pg_user              <> frmMain.teWLSend_pg_user.Text)         then Result:='Опрос Worklist`ом новых назначений Pacient.NET: настройка "Пользователь" изменилась'
  else if (v_WLSend_pg_password          <> frmMain.teWLSend_pg_password.Text)     then Result:='Опрос Worklist`ом новых назначений Pacient.NET: настройка "Пароль" изменилась'
  else if (v_WLSend_pg_Schema            <> frmMain.teWLSend_pg_Schema.Text)       then Result:='Опрос Worklist`ом новых назначений Pacient.NET: настройка "Схема" изменилась'
  else if (IntToStr(v_WLAmmStoreDays)    <> frmMain.teWLAmmStoreDays.Text)         then Result:='Опрос Worklist`ом новых назначений Pacient.NET: настройка "Данные хранятся (дней)" изменилась'
  // ---------------------------------------------------------------------------
   else if (v_isWLPostgres <> frmMain.cbWL_use_Postgres.checked) then Result:='настройки WORKLIST: использовать PostgreSQL'
   else if (vWL_pg_database <> frmMain.teWL_pg_database.Text) then Result:='настройки WORKLIST: База данных'
   else if (frmMain.teWL_pg_port.Text <> IntToStr(vWL_pg_port)) then Result:='настройки WORKLIST: Порт'
   else if (vWL_pg_server  <> frmMain.teWL_pg_server.Text) then Result:='настройки WORKLIST: Сервер'
   else if (vWL_pg_user  <> frmMain.teWL_pg_user.Text) then Result:='настройки WORKLIST: Пользователь'
   else if (vWL_pg_password  <> frmMain.teWL_pg_password.Text) then Result:='настройки WORKLIST: Пароль'
   else if (vWL_pg_Schema  <> frmMain.teWL_pg_Schema.Text) then Result:='настройки WORKLIST: Схема'
   else if (frmMain.teWL_max_connections.Text <> IntToStr(vWL_max_connections)) then Result:='настройки WORKLIST: Max connections'
   else if (frmMain.teWLMinFreeMemory.Text <> IntToStr(vWLMinFreeMemory)) then Result:='настройки WORKLIST: Min ammount free memory'
   else if (frmMain.teWLMaxTimeoutThreadWait.Text <> IntToStr(vWLMaxTimeoutThreadWait)) then Result:='настройки WORKLIST: Timeout wait free connection'

   else if (v_isWADOPostgres <> frmMain.cbWADO_use_Postgres.checked) then Result:='настройки WADO: использовать PostgreSQL'
   else if (vWADO_pg_database  <> frmMain.teWADO_pg_database.Text) then Result:='настройки WADO: База данных'
   else if (frmMain.teWADO_pg_port.Text <> IntToStr(vWADO_pg_port)) then Result:='настройки WADO: Порт'
   else if (vWADO_pg_server   <> frmMain.teWADO_pg_server.Text) then Result:='настройки WADO: Сервер'
   else if (vWADO_pg_user  <> frmMain.teWADO_pg_user.Text) then Result:='настройки WADO: Пользователь'
   else if (vWADO_pg_password  <> frmMain.teWADO_pg_password.Text) then Result:='настройки WADO: Пароль'
   else if (vWADO_pg_Schema  <> frmMain.teWADO_pg_Schema.Text) then Result:='настройки WADO: Схема'
   else if (frmMain.teWADO_max_connections.Text <> IntToStr(vWADO_max_connections)) then Result:='настройки WADO: Max connections'
   else if (frmMain.teWADOMinFreeMemory.Text <> IntToStr(vWADOMinFreeMemory)) then Result:='настройки WADO: Min ammount free memory'
   else if (frmMain.teWADOMaxTimeoutThreadWait.Text <> IntToStr(vWADOMaxTimeoutThreadWait)) then Result:='настройки WADO: Timeout wait free connection'

   else if (v_isPostgres <> frmMain.cbPACS_use_Postgres.checked) then Result:='настройки PACS: использовать PostgreSQL'
   else if (v_pg_database <> frmMain.tePACS_pg_database.Text) then Result:='настройки PACS: База данных'
   else if (frmMain.tePACS_pg_port.Text <> IntToStr(v_pg_port)) then Result:='настройки PACS: Порт'
   else if (v_pg_server <> frmMain.tePACS_pg_server.Text) then Result:='настройки PACS: Сервер'
   else if (v_pg_user <> frmMain.tePACS_pg_user.Text) then Result:='настройки PACS: Пользователь'
   else if (v_pg_password <> frmMain.tePACS_pg_password.Text) then Result:='настройки PACS: Пароль'
   else if (v_pg_Schema <> frmMain.tePACS_pg_Schema.Text) then Result:='настройки PACS: Схема'
   else if (frmMain.tePACS_max_connections.Text <> IntToStr(vPACS_max_connections)) then Result:='настройки PACS: Max connections'
   else if (frmMain.tePACSMinFreeMemory.Text <> IntToStr(vPACSMinFreeMemory)) then Result:='настройки PACS: Min ammount free memory'
   else if (frmMain.tePACSMaxTimeoutThreadWait.Text <> IntToStr(vPACSMaxTimeoutThreadWait)) then Result:='настройки PACS: Timeout wait free connection'

   else if (v_cbAutoBackup   <> cbAutoBackup.Checked) then Result:='Признак autobackup'
   else if (v_cbPACS         <> cbPACS.Checked) then Result:='Признак PACS backup'
   else if (v_cbWORKLIST     <> cbWORKLIST.Checked) then Result:='Признак WORKLIST backup'
   else if (v_cbWADO         <> cbWADO.Checked) then Result:='Признак WADO backup'
   else if (v_teCatalogDbBackup <> teCatalogDbBackup.Text) then Result:='Каталог backup'
   else if (v_teHourDbBackup    <> teHourDbBackup.Text) then Result:='Часы начала backup'
   else if (v_teMinuteDbBackup  <> teMinuteDbBackup.Text) then Result:='Минуты начала backup'
  // ---------------------------------------------------------------------------
  else Result:='';
end;

procedure TfrmMain.getPos ( pOraQuery:TOracleDataSet ; p_UniQr:TUniQuery; p_FIB_DataSet: TpFIBDataSet; p_UniFldName:string = 'fk_id' );
begin
  if v_isOracle then begin
    if pOraQuery.Active then
      myids := pOraQuery.FieldByName(p_UniFldName).AsString
    else
      myid := 0;
  end else if v_isPostgres then begin
    if p_UniQr.Active then
      myids := p_UniQr.FieldByName(p_UniFldName).AsString
    else
      myids := '';
  end else begin
    if p_FIB_DataSet.Active then
      myid := p_FIB_DataSet.FieldByName(p_UniFldName).AsInteger
    else
      myid := 0;
  end;
end;

procedure TfrmMain.setPos ( pOraQuery:TOracleDataSet ; p_UniQr:TUniQuery; p_FIB_DataSet: TpFIBDataSet; p_UniFldName:string = 'fk_id' );
begin
  if v_isOracle then begin
    if myids<>'' then
      pOraQuery.Locate(p_UniFldName, myids, [])
    else
      pOraQuery.First;
  end else if v_isPostgres then begin
    if myids<>'' then
      p_UniQr.Locate(p_UniFldName, myids, [])
    else
      p_UniQr.First;
  end else begin
    if myid>0 then
      p_FIB_DataSet.Locate(p_UniFldName, myid, [])
    else
      p_FIB_DataSet.First;
  end;
end;

procedure TfrmMain.db_conn_cmn;
begin
  if v_isOracle then
  begin
    OraConn := DB_CMN.OraConnCrt;
    //
    OraEvents.Session:=DB_CMN.OraConn;
    OraDevices.Session:=DB_CMN.OraConn;
    OraRules.Session:=DB_CMN.OraConn;
    OraJrnlRsnd.Session:=DB_CMN.OraConn;
    //
    dsEvents.DataSet:=OraEvents;
    dsDevices.DataSet:=OraDevices;
    dsRules.DataSet:=OraRules;
    dsJrnlRsnd.DataSet:=OraJrnlRsnd;
    dsWORKLIST.DataSet  := OraWORKLIST ;
  end else if v_isPostgres then
  begin
    DB_CMN.PGconn := DB_CMN.PgConnCrt;
    //
    UniEvents.Connection:=DB_CMN.PGconn;
    UniDevices.Connection:=DB_CMN.PGconn;
    UniRules.Connection:=DB_CMN.PGconn;
    UniJrnlRsnd.Connection:=DB_CMN.PGconn;
    //
    dsEvents.DataSet:=UniEvents;
    dsDevices.DataSet:=UniDevices;
    dsRules.DataSet:=UniRules;
    dsJrnlRsnd.DataSet:=UniJrnlRsnd;
    dsWORKLIST.DataSet  := UniWORKLIST ;
  end else
  begin
    if v_1_9_SERVER_IP='' then v_1_9_SERVER_IP:='localhost';    
    DB_CMN.DB := f_fb_db_crt(v_1_9_SERVER_IP+':'+c_alias);
    DB_CMN.trRead:= f_FbReadTransactCreate( DB_CMN.DB );
    DB_CMN.trWrite:= f_FbWriteTransactCreate( DB_CMN.DB );
    //
    DB_CMN.WLDB := f_fb_db_crt(v_1_9_SERVER_IP+':'+c_wlalias);
    DB_CMN.WLtrWrite:= f_FbReadTransactCreate( DB_CMN.WLDB );
    DB_CMN.WLtrRead:= f_FbWriteTransactCreate( DB_CMN.WLDB );
    //
    DB_CMN.LOGDB := f_fb_db_crt(v_1_9_SERVER_IP+':'+c_logalias);
    DB_CMN.LOGtrWrite:= f_FbReadTransactCreate( DB_CMN.LOGDB );
    DB_CMN.LOGtrRead:= f_FbWriteTransactCreate( DB_CMN.LOGDB );
    //
    dsEvents.DataSet:=pFIBEvents;
    dsDevices.DataSet:=pFIBDevices;
    dsRules.DataSet:=pFIBRules;
    dsJrnlRsnd.DataSet:=pFIBJrnlRsnd;
    //
    pFIBEvents.Database:=DB_CMN.LOGDB;
    pFIBEvents.Transaction:=DB_CMN.LOGtrRead;
    pFIBEvents.UpdateTransaction:=DB_CMN.LOGtrWrite;
    //
    pFIBDevices.Database:=DB_CMN.DB;
    pFIBDevices.Transaction:=DB_CMN.trRead;
    pFIBDevices.UpdateTransaction:=DB_CMN.trWrite;
    //
    pFIBRules.Database:=DB_CMN.DB;
    pFIBRules.Transaction:=DB_CMN.trRead;
    pFIBRules.UpdateTransaction:=DB_CMN.trWrite;
    //
    pFIBJrnlRsnd.Database:=DB_CMN.LOGDB;
    pFIBJrnlRsnd.Transaction:=DB_CMN.LOGtrRead;
    pFIBJrnlRsnd.UpdateTransaction:=DB_CMN.LOGtrWrite;
    //
    pFIBWORKLIST.Database:=DB_CMN.WLDB;
    pFIBWORKLIST.Transaction:=DB_CMN.WLtrRead;
    pFIBWORKLIST.UpdateTransaction:=DB_CMN.WLtrWrite;
    //
    frxDBEvents.DataSet := pFIBEvents;
    frxDBDevices.DataSet:= pFIBDevices;
    frxDBRules.DataSet  := pFIBRules;
    frxDBRsnd.DataSet   := pFIBJrnlRsnd;
    dsWORKLIST.DataSet  := pFIBWORKLIST ;
  end;
end;

procedure TfrmMain.dxBarButton11Click(Sender: TObject);
begin  // refresh
  patients_WL_refresh;
end;

procedure TfrmMain.dxBarButton10Click(Sender: TObject);
begin // delete
  if (cxGridDBTableView1.DataController.Controller.SelectedRecordCount=1)
  then
    if Application.MessageBox(
      PChar('Вы действительно хотите удалить назначение из списка?'),
      'Вопрос', MB_YESNO + MB_ICONQUESTION) = IDYES
    then
    begin
      if v_isOracle then begin
        with TOracleQuery.Create(nil) do
        try
          Session := DB_CMN.OraConn;
          SQL.Text := 'delete from WORKLIST where FK_ID=:p_FK_ID';
          DeclareAndSet('p_FK_ID', otInteger , OraWORKLIST.FieldByName('FK_ID').AsInteger ) ;
          try
            Execute;
          except
          on e:Exception do
            MessageDlg(E.Message, mtError, [mbOK], 0);
          end;
        finally
          Free;
        end;
      end else if v_isPostgres then begin
        with TUniQuery.Create(nil) do
        try
          Connection:=DB_CMN.PGconn;
          Transaction:=DB_CMN.MnUniTransaction;
          SQL.Text := 'delete from '+v_pg_Schema+'.worklist where FK_ID=:p_FK_ID';
          ParamByName('p_FK_ID').AsInteger := UniWORKLIST.FieldByName('FK_ID').AsInteger;
          try
            Prepare;
            ExecSQL;
          except
          on e:Exception do
            MessageDlg(E.Message, mtError, [mbOK], 0);
          end;
        finally
          Free;
        end;
      end else begin
        with TpFIBQuery.Create(nil) do
        try
          Options :=  Options + [qoAutoCommit];
          Database    := DB_CMN.DB;
          Transaction := DB_CMN.trWrite;
          if not Transaction.Active then Transaction.StartTransaction;
          SQL.Text := 'delete from WORKLIST where FK_ID=:p_FK_ID';
          ParamByName('p_FK_ID').AsInteger := pFIBWORKLIST.FieldByName('FK_ID').AsInteger;
          try
            Prepare;
            ExecQuery;
          except
          on e:Exception do
            MessageDlg(E.Message, mtError, [mbOK], 0);
          end;
        finally
          Free;
        end;
      end;
      patients_WL_refresh;
    end;
end;

procedure TfrmMain.dxBarButton8Click(Sender: TObject);
begin  // +
  Application.CreateForm(TfrmEdtPatient, frmEdtPatient);
  try
    // инициализировать пустыми значениями
    frmEdtPatient.teFAM.Text := '';
    frmEdtPatient.cxTeName.Text := '';
    frmEdtPatient.cxteSurname.Text := '';
//    frmEdtPatient.cxDateBorn.Date := ;
//  cxTePol
//  cxTePatientID
//  cxTeAETITLE
    frmEdtPatient.cxTeModality.Text := '';
    frmEdtPatient.cxTeACCESSIONNUMBER.Text := '';
    frmEdtPatient.cxTeSTUDYUID.Text := '';
    frmEdtPatient.cxDatDtudy.Date := Date;
    frmEdtPatient.cxseHourStudy.Value := HourOf(Now);
    frmEdtPatient.cxSeMinStudy.Value  := MinuteOf(Now);
    frmEdtPatient.cxSeStatus.Value    := 0;
    if frmEdtPatient.ShowModal=mrOk then
    begin // добавим запись
      if v_isOracle then begin
        with TOracleQuery.Create(nil) do
        try
          Session := DB_CMN.OraConn;
          SQL.Text := 'insert into WORKLIST (P_ENAME, P_SEX, P_PID, P_DATEBORN, P_FAM, P_IM, '+
                                           ' P_OTCH, P_ENAME_RUS, P_PATIENTSEX, '+
                                           ' ACCESSIONNUMBER, MODALITY, P_AETITLE,  '+
                                           ' STUDYUID, P_ST_DT, STATUS) values ('+
                                           ' :P_ENAME, :P_SEX, :P_PID, :P_DATEBORN, :P_FAM, :P_IM, '+
                                           ' :P_OTCH, :P_ENAME_RUS, :P_PATIENTSEX, '+
                                           ' :p_ACCESSIONNUMBER, :MODALITY, :P_AETITLE,  '+
                                           ' :STUDYUID, :P_ST_DT, :STATUS)';
          DeclareAndSet('P_ENAME', otString, TranslitRus(frmEdtPatient.teFAM.Text+' '+
                                                 frmEdtPatient.cxTeName.Text+' '+
                                                 frmEdtPatient.cxteSurname.Text) );
          DeclareAndSet('P_SEX', otString, frmEdtPatient.cxTePol.Text);
          DeclareAndSet('P_PID', otString, frmEdtPatient.cxTePatientID.Text);
          DeclareAndSet('P_DATEBORN', otDate, frmEdtPatient.cxDateBorn.Date);
          DeclareAndSet('P_FAM', otString, frmEdtPatient.teFAM.Text );
          DeclareAndSet('P_IM', otString, frmEdtPatient.cxTeName.Text );
          DeclareAndSet('P_OTCH', otString, frmEdtPatient.cxteSurname.Text );  
          DeclareAndSet('P_ENAME_RUS', otString, frmEdtPatient.teFAM.Text+' '+
                                                 frmEdtPatient.cxTeName.Text+' '+
                                                 frmEdtPatient.cxteSurname.Text );
          DeclareAndSet('P_PATIENTSEX', otString, frmEdtPatient.cxTePol.Text);  
          DeclareAndSet('p_ACCESSIONNUMBER', otString, frmEdtPatient.cxTeACCESSIONNUMBER.Text);
          DeclareAndSet('MODALITY', otString, frmEdtPatient.cxTeModality.Text);  
          DeclareAndSet('P_AETITLE', otString, frmEdtPatient.cxTeAETITLE.Text);
          DeclareAndSet('STUDYUID', otString, frmEdtPatient.cxTeSTUDYUID.Text);
          DeclareAndSet('P_ST_DT', otTimestamp, EncodeDateTime( YearOf(frmEdtPatient.cxDatDtudy.Date),
                                                               MonthOf(frmEdtPatient.cxDatDtudy.Date),
                                                               DayOf(frmEdtPatient.cxDatDtudy.Date),
                                                               Trunc(frmEdtPatient.cxseHourStudy.Value),
                                                               Trunc(frmEdtPatient.cxSeMinStudy.Value),
                                                               0,
                                                               0
                                                             ) );
          DeclareAndSet('STATUS', otInteger, Trunc(frmEdtPatient.cxSeStatus.Value) );  
          try
            Execute;
          except
          on e:Exception do
            MessageDlg(E.Message, mtError, [mbOK], 0);
          end;
        finally
          DB_CMN.OraConn.Commit;
          Free;
        end;
      end else if v_isPostgres then begin
        with TUniQuery.Create(nil) do
        try
          Connection:=DB_CMN.PGconn;
          Transaction:=DB_CMN.MnUniTransaction;
          SQL.Text := 'insert into '+v_pg_Schema+'.WORKLIST (P_ENAME, P_SEX, P_PID, P_DATEBORN, P_FAM, P_IM, '+
                                           ' P_OTCH, P_ENAME_RUS, P_PATIENTSEX, '+
                                           ' ACCESSIONNUMBER, MODALITY, P_AETITLE,  '+
                                           ' STUDYUID, P_ST_DT, STATUS) values ('+
                                           ' :P_ENAME, :P_SEX, :P_PID, :P_DATEBORN, :P_FAM, :P_IM, '+
                                           ' :P_OTCH, :P_ENAME_RUS, :P_PATIENTSEX, '+
                                           ' :p_ACCESSIONNUMBER, :MODALITY, :P_AETITLE,  '+
                                           ' :STUDYUID, :P_ST_DT, :STATUS)';
          ParamByName('P_ENAME').AsString := TranslitRus(frmEdtPatient.teFAM.Text+' '+
                                                 frmEdtPatient.cxTeName.Text+' '+
                                                 frmEdtPatient.cxteSurname.Text);
          ParamByName('P_SEX').AsString := frmEdtPatient.cxTePol.Text;
          ParamByName('P_PID').AsString := frmEdtPatient.cxTePatientID.Text;
          ParamByName('P_DATEBORN').AsDateTime := frmEdtPatient.cxDateBorn.Date ;
          ParamByName('P_FAM').AsString := frmEdtPatient.teFAM.Text;
          ParamByName('P_IM').AsString := frmEdtPatient.cxTeName.Text;
          ParamByName('P_OTCH').AsString := frmEdtPatient.cxteSurname.Text;
          ParamByName('P_ENAME_RUS').AsString := frmEdtPatient.teFAM.Text+' '+
                                                 frmEdtPatient.cxTeName.Text+' '+
                                                 frmEdtPatient.cxteSurname.Text;
          ParamByName('P_PATIENTSEX').AsString := frmEdtPatient.cxTePol.Text;
          ParamByName('p_ACCESSIONNUMBER').AsString := frmEdtPatient.cxTeACCESSIONNUMBER.Text;
          ParamByName('MODALITY').AsString := frmEdtPatient.cxTeModality.Text;
          ParamByName('P_AETITLE').AsString := frmEdtPatient.cxTeAETITLE.Text;
          ParamByName('STUDYUID').AsString := frmEdtPatient.cxTeSTUDYUID.Text;
          ParamByName('P_ST_DT').AsDateTime := EncodeDateTime( YearOf(frmEdtPatient.cxDatDtudy.Date),
                                                               MonthOf(frmEdtPatient.cxDatDtudy.Date),
                                                               DayOf(frmEdtPatient.cxDatDtudy.Date),
                                                               Trunc(frmEdtPatient.cxseHourStudy.Value),
                                                               Trunc(frmEdtPatient.cxSeMinStudy.Value),
                                                               0,
                                                               0
                                                             ) ;
          ParamByName('STATUS').AsInteger := Trunc(frmEdtPatient.cxSeStatus.Value);
          try
            Prepare;
            ExecSQL;
          except
          on e:Exception do
            MessageDlg(E.Message, mtError, [mbOK], 0);
          end;
        finally
          Free;
        end;
      end else begin
        with TpFIBQuery.Create(nil) do
        try
          Options :=  Options + [qoAutoCommit];
          Database    := DB_CMN.DB;
          Transaction := DB_CMN.trWrite;
          if not Transaction.Active then Transaction.StartTransaction;
          SQL.Text := 'insert into WORKLIST (P_ENAME, P_SEX, P_PID, P_DATEBORN, P_FAM, P_IM, '+
                                           ' P_OTCH, P_ENAME_RUS, P_PATIENTSEX, '+
                                           ' ACCESSIONNUMBER, MODALITY, P_AETITLE,  '+
                                           ' STUDYUID, P_ST_DT, STATUS) values ('+
                                           ' :P_ENAME, :P_SEX, :P_PID, :P_DATEBORN, :P_FAM, :P_IM, '+
                                           ' :P_OTCH, :P_ENAME_RUS, :P_PATIENTSEX, '+
                                           ' :p_ACCESSIONNUMBER, :MODALITY, :P_AETITLE,  '+
                                           ' :STUDYUID, :P_ST_DT, :STATUS)';
          ParamByName('P_ENAME').AsString := TranslitRus(frmEdtPatient.teFAM.Text+' '+
                                                 frmEdtPatient.cxTeName.Text+' '+
                                                 frmEdtPatient.cxteSurname.Text);
          ParamByName('P_SEX').AsString := frmEdtPatient.cxTePol.Text;
          ParamByName('P_PID').AsString := frmEdtPatient.cxTePatientID.Text;
          ParamByName('P_DATEBORN').AsDateTime := frmEdtPatient.cxDateBorn.Date ;
          ParamByName('P_FAM').AsString := frmEdtPatient.teFAM.Text;
          ParamByName('P_IM').AsString := frmEdtPatient.cxTeName.Text;
          ParamByName('P_OTCH').AsString := frmEdtPatient.cxteSurname.Text;
          ParamByName('P_ENAME_RUS').AsString := frmEdtPatient.teFAM.Text+' '+
                                                 frmEdtPatient.cxTeName.Text+' '+
                                                 frmEdtPatient.cxteSurname.Text;
          ParamByName('P_PATIENTSEX').AsString := frmEdtPatient.cxTePol.Text;
          ParamByName('p_ACCESSIONNUMBER').AsString := frmEdtPatient.cxTeACCESSIONNUMBER.Text;
          ParamByName('MODALITY').AsString := frmEdtPatient.cxTeModality.Text;
          ParamByName('P_AETITLE').AsString := frmEdtPatient.cxTeAETITLE.Text;
          ParamByName('STUDYUID').AsString := frmEdtPatient.cxTeSTUDYUID.Text;
          ParamByName('P_ST_DT').AsDateTime := EncodeDateTime( YearOf(frmEdtPatient.cxDatDtudy.Date),
                                                               MonthOf(frmEdtPatient.cxDatDtudy.Date),
                                                               DayOf(frmEdtPatient.cxDatDtudy.Date),
                                                               Trunc(frmEdtPatient.cxseHourStudy.Value),
                                                               Trunc(frmEdtPatient.cxSeMinStudy.Value),
                                                               0,
                                                               0
                                                             ) ;
          ParamByName('STATUS').AsInteger := Trunc(frmEdtPatient.cxSeStatus.Value);
          try
            Prepare;
            ExecQuery;
          except
          on e:Exception do
            MessageDlg(E.Message, mtError, [mbOK], 0);
          end;
        finally
          Free;
        end;
      end;
      patients_WL_refresh;
    end;
  finally
    FreeAndNil(frmEdtPatient);
  end;
end;

procedure TfrmMain.dxBarButton9Click(Sender: TObject);
begin // edit
  if (cxGridDBTableView1.DataController.Controller.SelectedRecordCount=1)
  then begin
    Application.CreateForm(TfrmEdtPatient, frmEdtPatient);
    try
      // инициализируем значениями из записи таблицы WORKLIST
      if v_isOracle then begin
        frmEdtPatient.teFAM.Text := OraWORKLIST.FieldByName('P_FAM').AsString;
        frmEdtPatient.cxTeName.Text := OraWORKLIST.FieldByName('P_IM').AsString;
        frmEdtPatient.cxteSurname.Text := OraWORKLIST.FieldByName('P_OTCH').AsString;
        frmEdtPatient.cxDateBorn.Date := OraWORKLIST.FieldByName('P_DATEBORN').AsDateTime;
        frmEdtPatient.cxTePol.Text := OraWORKLIST.FieldByName('P_PATIENTSEX').AsString;
        frmEdtPatient.cxTePatientID.Text := OraWORKLIST.FieldByName('P_PID').AsString;
        frmEdtPatient.cxTeAETITLE.Text  := OraWORKLIST.FieldByName('P_AETITLE').AsString;
        frmEdtPatient.cxTeModality.Text := OraWORKLIST.FieldByName('MODALITY').AsString;
        frmEdtPatient.cxTeACCESSIONNUMBER.Text := OraWORKLIST.FieldByName('ACCESSIONNUMBER').AsString;
        frmEdtPatient.cxTeSTUDYUID.Text := OraWORKLIST.FieldByName('STUDYUID').AsString;
        frmEdtPatient.cxDatDtudy.Date := OraWORKLIST.FieldByName('P_ST_DT').AsDateTime;
        frmEdtPatient.cxseHourStudy.Value := HourOf(OraWORKLIST.FieldByName('P_ST_DT').AsDateTime);
        frmEdtPatient.cxSeMinStudy.Value  := MinuteOf(OraWORKLIST.FieldByName('P_ST_DT').AsDateTime);
        frmEdtPatient.cxSeStatus.Value    := OraWORKLIST.FieldByName('STATUS').AsInteger;
      end else if v_isPostgres then begin
        frmedtpatient.tefam.text := uniworklist.fieldbyname('p_fam').asstring;
        frmedtpatient.cxtename.text := uniworklist.fieldbyname('p_im').asstring;
        frmedtpatient.cxtesurname.text := uniworklist.fieldbyname('p_otch').asstring;
        frmedtpatient.cxdateborn.date := uniworklist.fieldbyname('p_dateborn').asdatetime;
        frmedtpatient.cxtepol.text := uniworklist.fieldbyname('p_patientsex').asstring;
        frmedtpatient.cxtepatientid.text := uniworklist.fieldbyname('p_pid').asstring;
        frmedtpatient.cxteaetitle.text  := uniworklist.fieldbyname('p_aetitle').asstring;
        frmedtpatient.cxtemodality.text := uniworklist.fieldbyname('modality').asstring;
        frmedtpatient.cxteaccessionnumber.text := uniworklist.fieldbyname('accessionnumber').asstring;
        frmedtpatient.cxtestudyuid.text := uniworklist.fieldbyname('studyuid').asstring;
        frmedtpatient.cxdatdtudy.date := uniworklist.fieldbyname('p_st_dt').asdatetime;
        frmedtpatient.cxsehourstudy.value := hourof(uniworklist.fieldbyname('p_st_dt').asdatetime);
        frmedtpatient.cxseminstudy.value  := minuteof(uniworklist.fieldbyname('p_st_dt').asdatetime);
        frmedtpatient.cxsestatus.value    := uniworklist.fieldbyname('status').asinteger;
      end else begin
        frmEdtPatient.teFAM.Text := pFIBWORKLIST.FieldByName('P_FAM').AsString;
        frmEdtPatient.cxTeName.Text := pFIBWORKLIST.FieldByName('P_IM').AsString;
        frmEdtPatient.cxteSurname.Text := pFIBWORKLIST.FieldByName('P_OTCH').AsString;
        frmEdtPatient.cxDateBorn.Date := pFIBWORKLIST.FieldByName('P_DATEBORN').AsDateTime;
        frmEdtPatient.cxTePol.Text := pFIBWORKLIST.FieldByName('P_PATIENTSEX').AsString;
        frmEdtPatient.cxTePatientID.Text := pFIBWORKLIST.FieldByName('P_PID').AsString;
        frmEdtPatient.cxTeAETITLE.Text  := pFIBWORKLIST.FieldByName('P_AETITLE').AsString;
        frmEdtPatient.cxTeModality.Text := pFIBWORKLIST.FieldByName('MODALITY').AsString;
        frmEdtPatient.cxTeACCESSIONNUMBER.Text := pFIBWORKLIST.FieldByName('ACCESSIONNUMBER').AsString;
        frmEdtPatient.cxTeSTUDYUID.Text := pFIBWORKLIST.FieldByName('STUDYUID').AsString;
        frmEdtPatient.cxDatDtudy.Date := pFIBWORKLIST.FieldByName('P_ST_DT').AsDateTime;
        frmEdtPatient.cxseHourStudy.Value := HourOf(pFIBWORKLIST.FieldByName('P_ST_DT').AsDateTime);
        frmEdtPatient.cxSeMinStudy.Value  := MinuteOf(pFIBWORKLIST.FieldByName('P_ST_DT').AsDateTime);
        frmEdtPatient.cxSeStatus.Value    := pFIBWORKLIST.FieldByName('STATUS').AsInteger;
      end;
      if frmEdtPatient.ShowModal=mrOk then
      begin // добавим запись
        if v_isOracle then begin
          with TOracleQuery.Create(nil) do
          try
            Session := DB_CMN.OraConn;
            SQL.Text := 'update WORKLIST SET P_ENAME = :P_ENAME,  '+
                                            ' P_SEX = :P_SEX, '+
                                            ' P_PID = :P_PID,  '+
                                            ' P_DATEBORN = :P_DATEBORN, '+
                                            ' P_FAM = :P_FAM, '+
                                            ' P_IM = :P_IM, '+
                                            ' P_OTCH = :P_OTCH, '+
                                            ' P_ENAME_RUS = :P_ENAME_RUS,  '+
                                            ' P_PATIENTSEX = :P_PATIENTSEX, '+
                                            ' ACCESSIONNUMBER = :p_ACCESSIONNUMBER, '+
                                            ' MODALITY = :MODALITY, '+
                                            ' P_AETITLE = :P_AETITLE,  '+
                                            ' STUDYUID = :STUDYUID, '+
                                            ' P_ST_DT = :P_ST_DT, '+
                                            ' STATUS = :STATUS '+
                        ' WHERE FK_ID=:p_FK_ID ';
            DeclareAndSet('p_FK_ID', otInteger , OraWORKLIST.FieldByName('FK_ID').AsInteger ) ;

            DeclareAndSet('P_ENAME', otString , TranslitRus(frmEdtPatient.teFAM.Text+' '+
                                                   frmEdtPatient.cxTeName.Text+' '+
                                                   frmEdtPatient.cxteSurname.Text) ) ;
            DeclareAndSet('P_SEX', otString , frmEdtPatient.cxTePol.Text ) ;
            DeclareAndSet('P_PID', otString , frmEdtPatient.cxTePatientID.Text ) ;
            DeclareAndSet('P_DATEBORN', otTimestamp , frmEdtPatient.cxDateBorn.Date  ) ;
            DeclareAndSet('P_FAM', otString , frmEdtPatient.teFAM.Text ) ;
            DeclareAndSet('P_IM', otString , frmEdtPatient.cxTeName.Text ) ;
            DeclareAndSet('P_OTCH', otString , frmEdtPatient.cxteSurname.Text ) ;
            DeclareAndSet('P_ENAME_RUS', otString , frmEdtPatient.teFAM.Text+' '+
                                                   frmEdtPatient.cxTeName.Text+' '+
                                                   frmEdtPatient.cxteSurname.Text ) ;
            DeclareAndSet('P_PATIENTSEX', otString , frmEdtPatient.cxTePol.Text ) ;
            DeclareAndSet('p_ACCESSIONNUMBER', otString , frmEdtPatient.cxTeACCESSIONNUMBER.Text ) ;
            DeclareAndSet('MODALITY', otString , frmEdtPatient.cxTeModality.Text ) ;
            DeclareAndSet('P_AETITLE', otString , frmEdtPatient.cxTeAETITLE.Text ) ;
            DeclareAndSet('STUDYUID', otString , frmEdtPatient.cxTeSTUDYUID.Text ) ;
            DeclareAndSet('P_ST_DT', otTimestamp , EncodeDateTime( YearOf(frmEdtPatient.cxDatDtudy.Date),
                                                                 MonthOf(frmEdtPatient.cxDatDtudy.Date),
                                                                 DayOf(frmEdtPatient.cxDatDtudy.Date),
                                                                 Trunc(frmEdtPatient.cxseHourStudy.Value),
                                                                 Trunc(frmEdtPatient.cxSeMinStudy.Value),
                                                                 0,
                                                                 0
                                                               )  ) ;
            DeclareAndSet('STATUS', otInteger , Trunc(frmEdtPatient.cxSeStatus.Value) ) ;
            try
              Execute;
            except
            on e:Exception do
              MessageDlg(E.Message, mtError, [mbOK], 0);
            end;
          finally
            Free;
          end;
        end else if v_isPostgres then begin
          with TUniQuery.Create(nil) do
          try
            Connection:=DB_CMN.PGconn;
            Transaction:=DB_CMN.MnUniTransaction;

            SQL.Text := 'update '+v_pg_Schema+'.WORKLIST SET P_ENAME = :P_ENAME,  '+
                                            ' P_SEX = :P_SEX, '+
                                            ' P_PID = :P_PID,  '+
                                            ' P_DATEBORN = :P_DATEBORN, '+
                                            ' P_FAM = :P_FAM, '+
                                            ' P_IM = :P_IM, '+
                                            ' P_OTCH = :P_OTCH, '+
                                            ' P_ENAME_RUS = :P_ENAME_RUS,  '+
                                            ' P_PATIENTSEX = :P_PATIENTSEX, '+
                                            ' ACCESSIONNUMBER = :p_ACCESSIONNUMBER, '+
                                            ' MODALITY = :MODALITY, '+
                                            ' P_AETITLE = :P_AETITLE,  '+
                                            ' STUDYUID = :STUDYUID, '+
                                            ' P_ST_DT = :P_ST_DT, '+
                                            ' STATUS = :STATUS '+
                        ' WHERE FK_ID=:p_FK_ID ';
            ParamByName('p_FK_ID').AsInteger := UniWORKLIST.FieldByName('FK_ID').AsInteger;

            ParamByName('P_ENAME').AsString := TranslitRus(frmEdtPatient.teFAM.Text+' '+
                                                   frmEdtPatient.cxTeName.Text+' '+
                                                   frmEdtPatient.cxteSurname.Text);
            ParamByName('P_SEX').AsString := frmEdtPatient.cxTePol.Text;
            ParamByName('P_PID').AsString := frmEdtPatient.cxTePatientID.Text;
            ParamByName('P_DATEBORN').AsDateTime := frmEdtPatient.cxDateBorn.Date ;
            ParamByName('P_FAM').AsString := frmEdtPatient.teFAM.Text;
            ParamByName('P_IM').AsString := frmEdtPatient.cxTeName.Text;
            ParamByName('P_OTCH').AsString := frmEdtPatient.cxteSurname.Text;
            ParamByName('P_ENAME_RUS').AsString := frmEdtPatient.teFAM.Text+' '+
                                                   frmEdtPatient.cxTeName.Text+' '+
                                                   frmEdtPatient.cxteSurname.Text;
            ParamByName('P_PATIENTSEX').AsString := frmEdtPatient.cxTePol.Text;
            ParamByName('p_ACCESSIONNUMBER').AsString := frmEdtPatient.cxTeACCESSIONNUMBER.Text;
            ParamByName('MODALITY').AsString := frmEdtPatient.cxTeModality.Text;
            ParamByName('P_AETITLE').AsString := frmEdtPatient.cxTeAETITLE.Text;
            ParamByName('STUDYUID').AsString := frmEdtPatient.cxTeSTUDYUID.Text;
            ParamByName('P_ST_DT').AsDateTime := EncodeDateTime( YearOf(frmEdtPatient.cxDatDtudy.Date),
                                                                 MonthOf(frmEdtPatient.cxDatDtudy.Date),
                                                                 DayOf(frmEdtPatient.cxDatDtudy.Date),
                                                                 Trunc(frmEdtPatient.cxseHourStudy.Value),
                                                                 Trunc(frmEdtPatient.cxSeMinStudy.Value),
                                                                 0,
                                                                 0
                                                               ) ;
            ParamByName('STATUS').AsInteger := Trunc(frmEdtPatient.cxSeStatus.Value);
            try
              Prepare;
              Execute;
            except
            on e:Exception do
              MessageDlg(E.Message, mtError, [mbOK], 0);
            end;
          finally
            Free;
          end;
        end else begin
          with TpFIBQuery.Create(nil) do
          try
            Options :=  Options + [qoAutoCommit];
            Database    := DB_CMN.DB;
            Transaction := DB_CMN.trWrite;
            if not Transaction.Active then Transaction.StartTransaction;
            SQL.Text := 'update WORKLIST SET P_ENAME = :P_ENAME,  '+
                                            ' P_SEX = :P_SEX, '+
                                            ' P_PID = :P_PID,  '+
                                            ' P_DATEBORN = :P_DATEBORN, '+
                                            ' P_FAM = :P_FAM, '+
                                            ' P_IM = :P_IM, '+
                                            ' P_OTCH = :P_OTCH, '+
                                            ' P_ENAME_RUS = :P_ENAME_RUS,  '+
                                            ' P_PATIENTSEX = :P_PATIENTSEX, '+
                                            ' ACCESSIONNUMBER = :p_ACCESSIONNUMBER, '+
                                            ' MODALITY = :MODALITY, '+
                                            ' P_AETITLE = :P_AETITLE,  '+
                                            ' STUDYUID = :STUDYUID, '+
                                            ' P_ST_DT = :P_ST_DT, '+
                                            ' STATUS = :STATUS '+
                        ' WHERE FK_ID=:p_FK_ID ';
            ParamByName('p_FK_ID').AsInteger := pFIBWORKLIST.FieldByName('FK_ID').AsInteger;

            ParamByName('P_ENAME').AsString := TranslitRus(frmEdtPatient.teFAM.Text+' '+
                                                   frmEdtPatient.cxTeName.Text+' '+
                                                   frmEdtPatient.cxteSurname.Text);
            ParamByName('P_SEX').AsString := frmEdtPatient.cxTePol.Text;
            ParamByName('P_PID').AsString := frmEdtPatient.cxTePatientID.Text;
            ParamByName('P_DATEBORN').AsDateTime := frmEdtPatient.cxDateBorn.Date ;
            ParamByName('P_FAM').AsString := frmEdtPatient.teFAM.Text;
            ParamByName('P_IM').AsString := frmEdtPatient.cxTeName.Text;
            ParamByName('P_OTCH').AsString := frmEdtPatient.cxteSurname.Text;
            ParamByName('P_ENAME_RUS').AsString := frmEdtPatient.teFAM.Text+' '+
                                                   frmEdtPatient.cxTeName.Text+' '+
                                                   frmEdtPatient.cxteSurname.Text;
            ParamByName('P_PATIENTSEX').AsString := frmEdtPatient.cxTePol.Text;
            ParamByName('p_ACCESSIONNUMBER').AsString := frmEdtPatient.cxTeACCESSIONNUMBER.Text;
            ParamByName('MODALITY').AsString := frmEdtPatient.cxTeModality.Text;
            ParamByName('P_AETITLE').AsString := frmEdtPatient.cxTeAETITLE.Text;
            ParamByName('STUDYUID').AsString := frmEdtPatient.cxTeSTUDYUID.Text;
            ParamByName('P_ST_DT').AsDateTime := EncodeDateTime( YearOf(frmEdtPatient.cxDatDtudy.Date),
                                                                 MonthOf(frmEdtPatient.cxDatDtudy.Date),
                                                                 DayOf(frmEdtPatient.cxDatDtudy.Date),
                                                                 Trunc(frmEdtPatient.cxseHourStudy.Value),
                                                                 Trunc(frmEdtPatient.cxSeMinStudy.Value),
                                                                 0,
                                                                 0
                                                               ) ;
            ParamByName('STATUS').AsInteger := Trunc(frmEdtPatient.cxSeStatus.Value);
            try
              Prepare;
              ExecQuery;
            except
            on e:Exception do
              MessageDlg(E.Message, mtError, [mbOK], 0);
            end;
          finally
            Free;
          end;
        end;
        patients_WL_refresh;
      end;
    finally
      FreeAndNil(frmEdtPatient);
    end;
  end;
end;

procedure TfrmMain.SetSavBtnCol( p_is_Act:Boolean );
begin
  frmMain.ParamsSave.Enabled:=p_is_Act;
end;

function read_db_ip:string;
var v_ini : TIniFile;
    v_res : string;
begin
  // чтение ini-файла
  v_ini:=TIniFile.Create(v_exe_path+c_ini_file);
  try
    v_res := v_ini.ReadString( c_1_razdel, c_1_1_IP_FB, '' );
    v_ini.WriteString( c_1_razdel, c_1_1_IP_FB, v_res);
  finally
    FreeAndNil(v_ini);
  end;
  Result := v_res;
end;

// чтение параметров
procedure sys_read(const p_is_save:Boolean=True);
var v_ini : TIniFile;
begin
  // чтение ini-файла
  v_ini:=TIniFile.Create(v_exe_path+c_ini_file);
  try
    v_1_2_BCP_CATALOG         := v_ini.ReadString( c_1_razdel, с_1_2_BCP_CATALOG,      '' );
    v_1_3_STORAGE_FOLDER      := v_ini.ReadString( c_1_razdel, c_1_3_STORAGE_FOLDER,   '' );

    v_LOG_FOLDER              := v_ini.ReadString( c_1_razdel, c_LOG_FOLDER,   '' );

    v_1_4_SERVER_PORT         := v_ini.ReadString( c_1_razdel, c_1_4_SERVER_PORT,      '' );

    // чтение параметров базы
    cmn_db_params_read(v_ini);
    //
    frmMain.cbWL_use_Postgres.checked := v_isWLPostgres;
    frmMain.teWL_pg_database.Text :=  vWL_pg_database  ;
    frmMain.teWL_pg_port.Text :=  IntToStr(vWL_pg_port)  ;
    frmMain.teWL_pg_server.Text :=  vWL_pg_server  ;
    frmMain.teWL_pg_user.Text :=  vWL_pg_user  ;
    frmMain.teWL_pg_password.Text :=  vWL_pg_password  ;
    frmMain.teWL_pg_Schema.Text :=  vWL_pg_Schema  ;
    frmMain.teWL_max_connections.Text := inttostr(vWL_max_connections);
    frmMain.teWLMinFreeMemory.Text := inttostr(vWLMinFreeMemory);
    frmMain.teWLMaxTimeoutThreadWait.Text := inttostr(vWLMaxTimeoutThreadWait);

    frmMain.cbWADO_use_Postgres.checked := v_isWADOPostgres;
    frmMain.teWADO_pg_database.Text :=  vWADO_pg_database  ;
    frmMain.teWADO_pg_port.Text :=  IntToStr(vWADO_pg_port)  ;
    frmMain.teWADO_pg_server.Text := vWADO_pg_server   ;
    frmMain.teWADO_pg_user.Text :=  vWADO_pg_user  ;
    frmMain.teWADO_pg_password.Text :=  vWADO_pg_password  ;
    frmMain.teWADO_pg_Schema.Text :=  vWADO_pg_Schema  ;
    frmMain.teWADO_max_connections.Text := inttostr(vWADO_max_connections);
    frmMain.teWADOMinFreeMemory.Text := inttostr(vWADOMinFreeMemory);
    frmMain.teWADOMaxTimeoutThreadWait.Text := inttostr(vWADOMaxTimeoutThreadWait);

    frmMain.cbPACS_use_Postgres.checked := v_isPostgres ;
    frmMain.tePACS_pg_database.Text :=  v_pg_database  ;
    frmMain.tePACS_pg_port.Text :=  IntToStr(v_pg_port)  ;
    frmMain.tePACS_pg_server.Text :=  v_pg_server  ;
    frmMain.tePACS_pg_user.Text :=  v_pg_user  ;
    frmMain.tePACS_pg_password.Text :=  v_pg_password  ;
    frmMain.tePACS_pg_Schema.Text :=  v_pg_Schema  ;
    frmMain.tePACS_max_connections.Text := inttostr(vPACS_max_connections);
    frmMain.tePACSMinFreeMemory.Text := inttostr(vPACSMinFreeMemory);
    frmMain.tePACSMaxTimeoutThreadWait.Text := inttostr(vPACSMaxTimeoutThreadWait);

    // ---------------------------------------------------------------------------
    // send accessionnumber from PACS to MIS while receive new study
    frmMain.cbPACSSendToMisPacNet.checked := vPACSSendToMisPacNet;
    frmMain.tePACSSend_pg_database.Text := vPACSSend_pg_database;
    frmMain.tePACSSend_pg_port.Text := IntToStr(vPACSSend_pg_port);
    frmMain.tePACSSend_pg_server.Text := vPACSSend_pg_server;
    frmMain.tePACSSend_pg_user.Text := vPACSSend_pg_user;
    frmMain.tePACSSend_pg_password.Text := vPACSSend_pg_password;
    frmMain.tevPACSSend_pg_Schema.Text := vPACSSend_pg_Schema;
    // ---------------------------------------------------------------------------
    // check list of accessionnumber from worklist
    frmMain.teWLTimeCheckPacNet.Text := IntToStr(v_WLTimeCheckPacNet);
    frmMain.cbIsSendWlToMisPacNet.Checked := vIsSendWlToMisPacNet;
    frmMain.teWLSend_pg_database.Text :=   v_WLSend_pg_database;
    frmMain.teWLSend_pg_port.Text :=   IntToStr(v_WLSend_pg_port);
    frmMain.teWLSend_pg_server.Text :=   v_WLSend_pg_server;
    frmMain.teWLSend_pg_user.Text :=   v_WLSend_pg_user;
    frmMain.teWLSend_pg_password.Text :=   v_WLSend_pg_password;
    frmMain.teWLSend_pg_Schema.Text :=   v_WLSend_pg_Schema;
    frmMain.teWLAmmStoreDays.Text :=   IntToStr(v_WLAmmStoreDays);
    // ---------------------------------------------------------------------------
    //
    // коннект к БД
    frmMain.db_conn_cmn;

    v_1_9_SERVER_IP           := DBparams_get ( 'SERVER', 'IP' );

    v_1_5_AE_TITLE            := v_ini.ReadString( c_1_razdel, c_1_5_AE_TITLE,         '' );
    v_1_10_autoload_folder    := v_ini.ReadString( c_1_razdel, c_1_10_autoload_folder,         '' );
    v_1_11_autoload_timeout   := v_ini.ReadString( c_1_razdel, c_1_11_autoload_timeout,         '' );
    v_1_6_IS_DEVICES_CHECK    := ( v_ini.ReadString( c_1_razdel, c_1_6_IS_DEVICES_CHECK, '0' ) = '1' ) ;
    v_1_7_IS_LOG_WRITE        := ( v_ini.ReadString( c_1_razdel, c_1_7_IS_LOG_WRITE, '0' ) = '1' ) ;

    v_1_7_DB_LOG_WRITE      := ( v_ini.ReadString( c_1_razdel, c_1_7_DB_LOG_WRITE, '0' ) = '1' ) ;
    v_1_7_DCM_NET_LOG_WRITE := ( v_ini.ReadString( c_1_razdel, c_1_7_DCM_NET_LOG_WRITE, '0' ) = '1' ) ;

    v_ANinPID               := ( v_ini.ReadString( c_1_razdel, c_1_7_ANinPID, '0' ) = '1' ) ;

    v_is_add_tags             := ( v_ini.ReadString( c_1_razdel, c_1_12_private_tags, '0' ) = '1' ) ;

    v_1_8_IS_CHK_AETITLE      := ( v_ini.ReadString( c_1_razdel, c_1_8_IS_CHK_AETITLE, '0' ) = '1' ) ;
    v_1_9_is_stor_comm_ex     := MyStrToBool( DBparams_get ( 'DICOM',  'ST_COMM_CONF_AFT_ST' ) );
    //
    v_WADOhostname := v_ini.ReadString( c_5_razdel, c_5_1_host, 'localhost' );
    v_WADOport := v_ini.ReadInteger(c_5_razdel, c_5_2_port, 0);
    v_is_WADOlog := (v_ini.ReadInteger( c_5_razdel, c_5_3_is_log, 0 )=1);
    //
    v_cbAutoBackup := (v_ini.ReadInteger( c_10_razdel, c_10_AutoBackup, 0 )=1);
    v_cbPACS       := (v_ini.ReadInteger( c_10_razdel, c_10_PACS, 0 )=1);
    v_cbWORKLIST   := (v_ini.ReadInteger( c_10_razdel, c_10_WORKLIST, 0 )=1);
    v_cbWADO       := (v_ini.ReadInteger( c_10_razdel, c_10_WADO, 0 )=1);
    v_teCatalogDbBackup  := v_ini.ReadString( c_10_razdel, c_10_CatalogDbBackup,         '' );
    v_teHourDbBackup     := v_ini.ReadString( c_10_razdel, c_10_HourDbBackup,         '' );
    v_teMinuteDbBackup   := v_ini.ReadString( c_10_razdel, c_10_MinuteDbBackup,         '' );
    //
    frmMain.cxtxtdtBD.Text      :=  v_1_2_BCP_CATALOG;
    frmMain.cxtxtdt1.Text       :=  v_1_3_STORAGE_FOLDER;
    frmMain.cxtxtCtlgLog.Text   :=  v_LOG_FOLDER;
    frmMain.cxtxtCtlgAutoLoad.Text  :=  v_1_10_autoload_folder ;
    frmMain.cxAutoLoadTm.Text  :=  v_1_11_autoload_timeout ;
    frmMain.cxtSERVER_PORT.Text :=  v_1_4_SERVER_PORT;
    frmMain.cxtAE_TITLE.Text    :=  v_1_5_AE_TITLE;
    frmMain.cxCheckBox2.Checked :=  v_1_6_IS_DEVICES_CHECK;
    frmMain.cbIsWrtLog.Checked  :=  v_1_7_IS_LOG_WRITE;

    frmMain.cbWrtLogToDB.Checked  :=  v_1_7_DB_LOG_WRITE;
    frmMain.cbIsWrtLogDicomObmen.Checked  :=  v_1_7_DCM_NET_LOG_WRITE;

    frmMain.cbANinPID.Checked  :=  v_ANinPID;


    frmMain.CB_is_add_tags.Checked := v_is_add_tags;
    frmMain.cxchckbxchkAE.Checked := v_1_8_IS_CHK_AETITLE;
    frmMain.CB_is_stor_comm_ex.Checked := v_1_9_is_stor_comm_ex;
    frmMain.TEIPServer.Text     :=  v_1_9_SERVER_IP;
    //
    frmMain.cb_use_3d.Checked := MyStrToBool( DBparams_get ('STATION', 'USE_3D_LIBRARY', '1' )  );
    // WORKLIST
    v_teIPWORKLIST := v_ini.ReadString( c_4_razdel, c_4_1_IP_Worklist, 'localhost' ) ;
    v_PortWORKLIST := v_ini.ReadString( c_4_razdel, c_4_2_PORT_Worklist, '1112' ) ;
    v_AEWORKLIST   := v_ini.ReadString( c_4_razdel, c_4_3_AETITLE_Worklist, 'WLSERVER' ) ;

    v_CheckAEWorklist := ( v_ini.ReadString( c_1_razdel, c_4_4_CheckAE_Worklist, '0' ) = '1' ) ;
    v_LOGWorklist     := ( v_ini.ReadString( c_1_razdel, c_4_5_LOGWorklist, '0' ) = '1' ) ;

    v_MPPS := ( v_ini.ReadString( c_4_razdel, c_4_5_MPPS, '0' ) = '1' );

    //
    frmMain.teIPWORKLIST.Text := v_teIPWORKLIST;
    frmMain.tePortWORKLIST.Text := v_PortWORKLIST;
    frmMain.teAEWORKLIST.Text := v_AEWORKLIST;
    frmMain.cbCheckAEWorklist.Checked := v_CheckAEWorklist;
    frmMain.cbLOGWorklist.Checked := v_LOGWorklist;

    frmMain.teWADOhostname.Text    := v_WADOhostname;
    frmMain.cbWADOlog.Checked      := v_is_WADOlog;
    frmMain.teWADOport.Text        := IntToStr(v_WADOport);

    frmMain.cbMPPS.Checked := v_MPPS ;

    frmMain.cbAutoBackup.Checked    := v_cbAutoBackup ;
    frmMain.cbPACS.Checked          := v_cbPACS ;
    frmMain.cbWORKLIST.Checked      := v_cbWORKLIST ;
    frmMain.cbWADO.Checked          := v_cbWADO ;
    frmMain.teCatalogDbBackup.Text  := v_teCatalogDbBackup ;
    frmMain.teHourDbBackup.Text     := v_teHourDbBackup ;
    frmMain.teMinuteDbBackup.Text   := v_teMinuteDbBackup ;

  finally
    FreeAndNil(v_ini);
  end;
  if p_is_save then frmMain.Myparams_save;
end;

function frm_prm_str ( p_prm_name : string;
                       p_old_value : string;
                       p_new_value : string;
                       p_is_new : boolean = True
                     ) : ansistring;
const c_r1 = '[';
      c_r2 = ']';
begin
  if (p_old_value<>p_new_value) then
  begin
    if p_is_new then    
      Result := #13+c_r1+p_prm_name+c_r2+
                '   было: '+c_r1+p_old_value+c_r2+
                '   стало: '+c_r1+p_new_value+c_r2
    else          
      Result :=     c_r1+p_prm_name+c_r2+
                '   было: '+c_r1+p_old_value+c_r2+
                '   стало: '+c_r1+p_new_value+c_r2;
  end else
  begin
    Result:='';
  end;
end;

procedure TfrmMain.Myparams_save;
var v_ini : TIniFile; v_str_wrt : ansistring;
begin
  // сформируем строку протокола
  v_str_wrt:=
    frm_prm_str('Каталог резервного копирования',
                v_1_2_BCP_CATALOG,
                frmMain.cxtxtdtBD.Text, False);
  v_str_wrt:=v_str_wrt+
    frm_prm_str('Каталог базы изображений',
                v_1_3_STORAGE_FOLDER,
                frmMain.cxtxtdt1.Text);
  v_str_wrt:=v_str_wrt+
    frm_prm_str('Каталог хранения файлов протоколов',
                v_LOG_FOLDER,       
                frmMain.cxtxtCtlgLog.Text);
  v_str_wrt:=v_str_wrt+
    frm_prm_str('IP-адрес',
                v_1_9_SERVER_IP,
                frmMain.TEIPServer.Text);
  v_str_wrt:=v_str_wrt+
    frm_prm_str('AE Title',
                v_1_5_AE_TITLE,
                frmMain.cxtAE_TITLE.Text);
  v_str_wrt:=v_str_wrt+
    frm_prm_str('Порт',
                v_1_4_SERVER_PORT,
                frmMain.cxtSERVER_PORT.Text);
  v_str_wrt:=v_str_wrt+
    frm_prm_str('Проверять AE Title',
                MyBoolToStr(v_1_8_IS_CHK_AETITLE),
                MyBoolToStr(frmMain.cxchckbxchkAE.Checked));
  v_str_wrt:=v_str_wrt+
    frm_prm_str('Вести расширенный протокол',
                MyBoolToStr(v_1_7_IS_LOG_WRITE),
                MyBoolToStr(frmMain.cbIsWrtLog.Checked));

  v_str_wrt:=v_str_wrt+
    frm_prm_str('Сохранять лог в БД',
                MyBoolToStr(v_1_7_DB_LOG_WRITE),
                MyBoolToStr(frmMain.cbWrtLogToDB.Checked));
  v_str_wrt:=v_str_wrt+
    frm_prm_str('Протоколировать обмен dicom сети',
                MyBoolToStr(v_1_7_DCM_NET_LOG_WRITE),
                MyBoolToStr(frmMain.cbIsWrtLogDicomObmen.Checked));

  v_str_wrt:=v_str_wrt+
    frm_prm_str('Искать Accessionnumber (номер протокола) вPatientID (номере медкарты) на сервере',
                MyBoolToStr(v_ANinPID),
                MyBoolToStr(frmMain.cbANinPID.Checked));


  v_str_wrt:=v_str_wrt+
    frm_prm_str('private tags',
                MyBoolToStr(v_is_add_tags),
                MyBoolToStr(frmMain.CB_is_add_tags.Checked));

  v_str_wrt:=v_str_wrt+
    frm_prm_str('Выполнять STORAGE COMMITMENT после отправки снимков',
                MyBoolToStr(v_1_9_is_stor_comm_ex),
                MyBoolToStr(frmMain.CB_is_stor_comm_ex.Checked));
  v_str_wrt:=v_str_wrt+
    frm_prm_str('Проверять наличие устройства DICOM в списке устройств',
                MyBoolToStr(v_1_6_IS_DEVICES_CHECK),
                MyBoolToStr(frmMain.cxCheckBox2.Checked));

  v_str_wrt:=v_str_wrt+
    frm_prm_str('',
                v_1_10_autoload_folder,
                frmMain.cxtxtCtlgAutoLoad.Text);
  v_str_wrt:=v_str_wrt+
    frm_prm_str('',
                v_1_11_autoload_timeout,
                frmMain.cxAutoLoadTm.Text);

  v_str_wrt:=v_str_wrt+
    frm_prm_str('Host web сервера',
                IntToStr(v_WADOport),
                frmMain.teWADOport.Text);
  v_str_wrt:=v_str_wrt+
    frm_prm_str('',
                v_1_11_autoload_timeout,
                frmMain.cxAutoLoadTm.Text);
  v_str_wrt:=v_str_wrt+
    frm_prm_str('Признак протоколирования web сервера',
                MyBoolToStr(v_is_WADOlog),
                MyBoolToStr(frmMain.cbWADOlog.Checked));

  // запись ini-файла
  if Trim(v_str_wrt)<>'' then
    if DB_CMN.LOGDB<>nil then
      if DB_CMN.LOGDB.Connected then      
        MyDoQueryInsert( 'Изменение параметров сервера',2,
                         'Параметры сервера были изменены:'+#13+
                         v_str_wrt+#13+
                         'Необходима перезагрузка сервера.',
                         DB_CMN.LOGtrWrite,
                         DB_CMN.LOGDB );
  Set_Equal_Values;                       
  v_ini:=TIniFile.Create(v_exe_path+c_ini_file);
  try
    v_ini.WriteString( c_1_razdel, с_1_2_BCP_CATALOG,      Trim(frmMain.cxtxtdtBD.Text) );
    DBparams_wrt (  'SERVER', // c_DICOM,        // SECTION
                    'STORAGESCP', // KEY
                    Trim(frmMain.cxtxtdtBD.Text)      // VALUE
                    );
    v_ini.WriteString( c_1_razdel, c_1_3_STORAGE_FOLDER,   Trim(frmMain.cxtxtdt1.Text) );
    v_ini.WriteString( c_1_razdel, c_LOG_FOLDER,   Trim(frmMain.cxtxtCtlgLog.Text) );
    DBparams_wrt (  'SERVER', // c_DICOM,        // SECTION
                    'REMOTESTORAGESCP', // KEY
                    Trim(frmMain.cxtxtdt1.Text)      // VALUE
                    );
    v_ini.WriteString( c_1_razdel, c_1_4_SERVER_PORT,      Trim(frmMain.cxtSERVER_PORT.Text) );
    DBparams_wrt (  'SERVER',
                    'PORT',
                    Trim(frmMain.cxtSERVER_PORT.Text)
                    );                     

    DBparams_wrt (  'SERVER',
                    'IP',
                    Trim(frmMain.TEIPServer.Text)
                    );

    v_ini.WriteString( c_1_razdel, c_1_5_AE_TITLE,         Trim(frmMain.cxtAE_TITLE.Text) );
    DBparams_wrt (  'SERVER', // c_DICOM,        // SECTION
                    'AETITLE', // KEY
                    Trim(frmMain.cxtAE_TITLE.Text)
                    );
    v_ini.WriteString( c_1_razdel, c_1_6_IS_DEVICES_CHECK, MyBoolToStr(frmMain.cxCheckBox2.Checked) );
    v_ini.WriteString( c_1_razdel, c_1_7_IS_LOG_WRITE,     MyBoolToStr(frmMain.cbIsWrtLog.Checked) );

    v_ini.WriteString( c_1_razdel, c_1_7_DB_LOG_WRITE,     MyBoolToStr(frmMain.cbWrtLogToDB.Checked) );
    v_ini.WriteString( c_1_razdel, c_1_7_DCM_NET_LOG_WRITE,MyBoolToStr(frmMain.cbIsWrtLogDicomObmen.Checked) );

    v_ini.WriteString( c_1_razdel, c_1_7_ANinPID,MyBoolToStr(frmMain.cbANinPID.Checked) );

    v_ini.WriteString( c_1_razdel, c_1_12_private_tags,     MyBoolToStr(frmMain.CB_is_add_tags.Checked) );

    v_ini.WriteString( c_1_razdel, c_1_8_IS_CHK_AETITLE,   MyBoolToStr(frmMain.cxchckbxchkAE.Checked) );

    v_1_10_autoload_folder := frmMain.cxtxtCtlgAutoLoad.Text;
    v_1_11_autoload_timeout:= frmMain.cxAutoLoadTm.Text;
    v_ini.WriteString( c_1_razdel, c_1_10_autoload_folder,  v_1_10_autoload_folder  );
    v_ini.WriteString( c_1_razdel, c_1_11_autoload_timeout, v_1_11_autoload_timeout   );
    //
    DBparams_wrt (  'DICOM', // c_DICOM,        // SECTION
                    'ST_COMM_CONF_AFT_ST', // KEY
                    MyBoolToStr(frmMain.CB_is_stor_comm_ex.Checked)      // VALUE
                    );
    //
    DBparams_wrt (  'STATION', // c_DICOM,        // SECTION
                    'USE_3D_LIBRARY', // KEY
                    MyBoolToStr(frmMain.cb_use_3d.Checked)      // VALUE
                    );
  //  v_ini.WriteString( c_1_razdel, c_1_9_is_stor_comm_ex,  MyBoolToStr(frmMain.CB_is_stor_comm_ex.Checked) );

    // WORKLIST
    v_teIPWORKLIST          := frmMain.teIPWORKLIST.Text;
    v_PortWORKLIST          := frmMain.tePortWORKLIST.Text;
    v_AEWORKLIST            := frmMain.teAEWORKLIST.Text;
    v_CheckAEWorklist       := frmMain.cbCheckAEWorklist.Checked;
    v_MPPS                  := frmMain.cbMPPS.Checked ;
    v_LOGWorklist           := frmMain.cbLOGWorklist.Checked;
    DBparams_wrt (  'WLSERVER',
                    'IP',
                    Trim(v_teIPWORKLIST)
                    );
    DBparams_wrt (  'WLSERVER',
                    'PORT',
                    Trim(v_PortWORKLIST)
                    );
    DBparams_wrt (  'WLSERVER',
                    'AETITLE',
                    Trim(v_AEWORKLIST)
                    );
    v_ini.WriteString( c_4_razdel, c_4_1_IP_Worklist, v_teIPWORKLIST );
    v_ini.WriteString( c_4_razdel, c_4_2_PORT_Worklist, v_PortWORKLIST );
    v_ini.WriteString( c_4_razdel, c_4_3_AETITLE_Worklist, v_AEWORKLIST );
    if v_CheckAEWorklist then
      v_ini.WriteString( c_4_razdel, c_4_4_CheckAE_Worklist, '1' )
    else
      v_ini.WriteString( c_4_razdel, c_4_4_CheckAE_Worklist, '0' );
    if v_LOGWorklist then
      v_ini.WriteString( c_4_razdel, c_4_5_LOGWorklist, '1' )
    else
      v_ini.WriteString( c_4_razdel, c_4_5_LOGWorklist, '0' );
    if v_MPPS then
      v_ini.WriteString( c_4_razdel, c_4_5_MPPS, '1' )
    else
      v_ini.WriteString( c_4_razdel, c_4_5_MPPS, '0' );

    v_ini.WriteString( c_5_razdel, c_5_1_host, v_WADOhostname );
    v_ini.WriteInteger(c_5_razdel, c_5_2_port, v_WADOport);
    if v_is_WADOlog then
      v_ini.WriteInteger( c_5_razdel, c_5_3_is_log, 1 )
    else
      v_ini.WriteInteger( c_5_razdel, c_5_3_is_log, 0 );
      
    // -------------------------------------------------------------------------
    v_ini.WriteInteger(cPACIENTNET, cPN1, MyBoolToInt(vPACSSendToMisPacNet) ) ;
    v_ini.WriteString(cPACIENTNET, cPN2, vPACSSend_pg_database);
    v_ini.WriteInteger(cPACIENTNET, cPN3, vPACSSend_pg_port);
    v_ini.WriteString(cPACIENTNET, cPN4, vPACSSend_pg_server);
    v_ini.WriteString(cPACIENTNET, cPN5, vPACSSend_pg_user);
    v_ini.WriteString(cPACIENTNET, cPN6, vPACSSend_pg_password);
    v_ini.WriteString(cPACIENTNET, cPN7, vPACSSend_pg_Schema);
    // -------------------------------------------------------------------------
    v_ini.WriteInteger(cPACIENTNETWORKLIST, cPN9, v_WLTimeCheckPacNet);
    v_ini.WriteString(cPACIENTNETWORKLIST, cPN2,  v_WLSend_pg_database);
    v_ini.WriteInteger(cPACIENTNETWORKLIST, cPN3, v_WLSend_pg_port);
    v_ini.WriteString(cPACIENTNETWORKLIST, cPN4,  v_WLSend_pg_server);
    v_ini.WriteString(cPACIENTNETWORKLIST, cPN5,  v_WLSend_pg_user);
    v_ini.WriteString(cPACIENTNETWORKLIST, cPN6,  v_WLSend_pg_password);
    v_ini.WriteString(cPACIENTNETWORKLIST, cPN7,  v_WLSend_pg_Schema);
    v_ini.WriteInteger(cPACIENTNETWORKLIST, cPN8, v_WLAmmStoreDays);
    v_ini.WriteInteger(cPACIENTNETWORKLIST, cPN10, MyBoolToInt(vIsSendWlToMisPacNet) ) ;
    // -------------------------------------------------------------------------
    try
      v_ini.WriteInteger(cWorkList, 'use_postgres', MyBoolToInt(v_isWLPostgres));
      v_ini.WriteInteger(cWADO, 'use_postgres', MyBoolToInt(v_isWADOPostgres));
      if v_isWLPostgres then
      begin
        v_ini.WriteString(cWorkList, cPN2, vWL_pg_database);
        v_ini.WriteInteger(cWorkList,cPN3, vWL_pg_port);
        v_ini.WriteString(cWorkList, cPN4, vWL_pg_server);
        v_ini.WriteString(cWorkList, cPN5, vWL_pg_user);
        v_ini.WriteString(cWorkList, cPN6, vWL_pg_password);
        v_ini.WriteString(cWorkList, cPN7, vWL_pg_Schema);
      end;
      if v_isWADOPostgres then
      begin
        v_ini.WriteString(cWADO, cPN2, vWADO_pg_database);
        v_ini.WriteInteger(cWADO,cPN3, vWADO_pg_port);
        v_ini.WriteString(cWADO, cPN4, vWADO_pg_server);
        v_ini.WriteString(cWADO, cPN5, vWADO_pg_user);
        v_ini.WriteString(cWADO, cPN6, vWADO_pg_password);
        v_ini.WriteString(cWADO, cPN7, vWADO_pg_Schema);
      end;
      v_ini.WriteInteger(cWorkList,cWL_max_connections, vWL_max_connections);
      v_ini.WriteInteger(cWorkList,cWLMinFreeMemory, vWLMinFreeMemory);
      v_ini.WriteInteger(cWorkList,cWLMaxTimeoutThreadWait, vWLMaxTimeoutThreadWait);
      v_ini.WriteInteger(cWADO,cWADO_max_connections, vWADO_max_connections);
      v_ini.WriteInteger(cWADO,cWADOMinFreeMemory, vWADOMinFreeMemory);
      v_ini.WriteInteger(cWADO,cWADOMaxTimeoutThreadWait, vWADOMaxTimeoutThreadWait);
      v_ini.WriteInteger(cBase,cPACS_max_connections, vPACS_max_connections);
      v_ini.WriteInteger(cBase,cPACSMinFreeMemory, vPACSMinFreeMemory);
      v_ini.WriteInteger(cBase,cPACSMaxTimeoutThreadWait, vPACSMaxTimeoutThreadWait);
    except
    end;

    v_ini.WriteInteger( c_10_razdel, c_10_AutoBackup, MyBoolToInt(v_cbAutoBackup) );
    v_ini.WriteInteger( c_10_razdel, c_10_PACS, MyBoolToInt(v_cbPACS) );
    v_ini.WriteInteger( c_10_razdel, c_10_WORKLIST, MyBoolToInt(v_cbWORKLIST) );
    v_ini.WriteInteger( c_10_razdel, c_10_WADO, MyBoolToInt(v_cbWADO) );
    v_ini.WriteString( c_10_razdel, c_10_CatalogDbBackup, v_teCatalogDbBackup );
    v_ini.WriteString( c_10_razdel, c_10_HourDbBackup,    v_teHourDbBackup );
    v_ini.WriteString( c_10_razdel, c_10_MinuteDbBackup,  v_teMinuteDbBackup );

  finally
    FreeAndNil(v_ini);
  end;
  Set_Equal_Values;
  SetSavBtnCol(False);
end;

// процедура общая для завершения программы - выход
procedure Appl_Exit;
begin
  frmMain.cxDV.StoreToRegistry(c_reg_lst_mn+c_devices_rg, TRUE, [], 'cxDV');
  frmMain.TVList.StoreToRegistry(c_reg_lst_mn+c_events_rg, TRUE, [], 'TVList');
  //
  frmMain.dxMemTestFiles.Close;
  frmMain.pFIBDevices.Close;
  frmMain.pFIBEvents.Close;
  Application.Terminate;
end;

procedure TfrmMain.aAddRulExecute(Sender: TObject);
var FIBQuery : TpFIBQuery; v_UniQr : TUniQuery; v_OraQr : TOracleQuery;
begin
  Application.CreateForm(TfrmAddRule, frmAddRule);
  try
    frmAddRule.ShowModal;
    if frmAddRule.ModalResult = mrOk then
      begin
        if v_isOracle then begin
          if DB_CMN.OraConn.Connected then
          begin
            v_OraQr := TOracleQuery.Create(nil);
            try
              v_OraQr.Session:=DB_CMN.OraConn;
              v_OraQr.SQL.Text := ' insert into RULES (FK_DEVICEID, FK_DEVICEID2, '+
                                   ' FC_MOD, FN_COMPRESS, FN_PRC_COMPRESS) values(:pfk_deviceid, '+
                                   ':pfk_deviceid2, :pfc_mod, :FN_COMPRESS, :FN_PRC_COMPRESS ) ';
              v_OraQr.DeclareAndSet('pfk_deviceid', otString, frmAddRule.PGbeTo_Tag);
              v_OraQr.DeclareAndSet('pfk_deviceid2', otString, frmAddRule.PGbeFrom_Tag);
              v_OraQr.DeclareAndSet('pfc_mod', otString, frmAddRule.cbType.Text);
              v_OraQr.DeclareAndSet('FN_COMPRESS', otInteger, gt_id_transfer_syntax(frmAddRule.cxComboBox1.ItemIndex,0) );
              v_OraQr.DeclareAndSet('FN_PRC_COMPRESS', otInteger, frmAddRule.TBSetZipPrc.Position*10);
              try
                v_OraQr.Execute;
              except
                on e:Exception do
                  MessageDlg(e.Message, mtError, [mbOK], 0);
              end;
            finally
              v_OraQr.Free;
            end;
            aRefRulExecute(nil);
            OraRules.Locate('fc_title', frmAddRule.beTo.Text, []);
          end;
        end else if v_isPostgres then begin
          if DB_CMN.PGconn.Connected then
          begin
            v_UniQr := TUniQuery.Create(nil);
            try
              v_UniQr.Connection:=DB_CMN.PGconn;
              v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
              v_UniQr.SQL.Text := ' insert into '+v_pg_Schema+'.rules (fk_deviceid, fk_deviceid2, '+
                                   ' fc_mod, fn_compress, fn_prc_compress) values(:pfk_deviceid, '+
                                   ':pfk_deviceid2, :pfc_mod, :FN_COMPRESS, :FN_PRC_COMPRESS ) ';
              v_UniQr.ParamByName('pfk_deviceid').AsString  := frmAddRule.PGbeTo_Tag;
              v_UniQr.ParamByName('pfk_deviceid2').AsString := frmAddRule.PGbeFrom_Tag;
              v_UniQr.ParamByName('pfc_mod').AsString        := frmAddRule.cbType.Text;
              v_UniQr.ParamByName('FN_COMPRESS').AsInteger   := gt_id_transfer_syntax(frmAddRule.cxComboBox1.ItemIndex,0);
              v_UniQr.ParamByName('FN_PRC_COMPRESS').AsInteger := frmAddRule.TBSetZipPrc.Position*10;
              try
            //    v_UniQr.Transaction.StartTransaction;
                v_UniQr.ExecSQL;
            //    if v_UniQr.Transaction.Active then
            //      v_UniQr.Transaction.Commit;
              except
                on e:Exception do
                  MessageDlg(e.Message, mtError, [mbOK], 0);
              end;
            finally
              v_UniQr.Free;
            end;
            aRefRulExecute(nil);
            UniRules.Locate('fc_title', frmAddRule.beTo.Text, []);
          end;
        end else begin
          if DB_CMN.DB.Connected then
          begin
            Cmn_Commit(trWrite);
            FIBQuery := TpFIBQuery.Create(nil);
            FIBQuery.Database := DB_CMN.DB;
            FIBQuery.Transaction := trWrite;
            FIBQuery.Options := FIBQuery.Options + [qoAutoCommit];
            FIBQuery.SQL.Text := ' insert into RULES(fk_deviceid, fk_deviceid2, '+
                                 ' fc_mod, FN_COMPRESS, FN_PRC_COMPRESS) values(:pfk_deviceid, '+
                                 ':pfk_deviceid2, :pfc_mod, :FN_COMPRESS, :FN_PRC_COMPRESS ) ';
            FIBQuery.ParamByName('pfk_deviceid').AsString  := frmAddRule.PGbeTo_Tag;
            FIBQuery.ParamByName('pfk_deviceid2').AsString := frmAddRule.PGbeFrom_Tag;
            FIBQuery.ParamByName('pfc_mod').AsString        := frmAddRule.cbType.Text;
            FIBQuery.ParamByName('FN_COMPRESS').AsInteger   := gt_id_transfer_syntax(frmAddRule.cxComboBox1.ItemIndex,0);
            FIBQuery.ParamByName('FN_PRC_COMPRESS').AsInteger := frmAddRule.TBSetZipPrc.Position*10;
            try
              MyExecQuery(FIBQuery);
            finally
              FIBQuery.Close;
              FreeAndNil(FIBQuery);
            end;
            Cmn_Commit(trWrite);
            aRefRulExecute(nil);
            pFIBRules.Locate('fc_title', frmAddRule.beTo.Text, []);
          end;
        end;
      end;
  finally
    frmAddRule.Free;
  end;
end;

procedure TfrmMain.actCloseExecute(Sender: TObject);
var v_str_tmp : string;
    v_str : string;
begin
  v_str_tmp:=Chk_Equal_Values;
  if Trim(v_str_tmp)<>''
  then begin
    v_str := 'Остались несохраненные данные'+#13+ 
             v_str_tmp+#13+
             'Вы хотите выйти из приложения '+#13+
             'без сохранения данных ?';
  end else begin
    v_str:='Вы хотите выйти из приложения ?';
  end;
  if Application.MessageBox(PChar(v_str),
                            'Вопрос',
                            MB_YESNO + MB_ICONQUESTION) = MrYes
  then begin
    Appl_Exit; // завершение работы
  end;
end;

procedure TfrmMain.actConnectExecute(Sender: TObject);
begin
end;

// функция получения даты последнего архивирования
function dt_last_backup:string;
begin
  dt_last_backup := DBparams_get (
                    'SERVER',
                    'LASTDATE'
                    );
end;

// функция вывода числа integer по формату '999 999 999'
function MyIntToStr (const p_nmb : integer): string;
var i,j:Integer; v_res, v_str : string;
begin
  v_str:=IntToStr(p_nmb);
  j:=Length(v_str);
  v_res:='';
  for i := 0 to j-1 do begin
    if (i mod 3)=0  then v_res:=' '+v_res;
    v_res:=Copy(v_str,j-i,1)+v_res;
  end;
  MyIntToStr:=v_res;
end;

// функция получения количества записей в таблицах
// по параметру p_pr
// p_pr=1 - Количество исследований
// p_pr=2 - Количество серий
// p_pr=3 - Количество изображений
function gt_rec_amm ( const p_pr:Integer ):Integer;
var FIBQuery : TpFIBQuery;
    v_res : Integer;
    v_UniQr : TUniQuery;
    v_OraQr : TOracleQuery;
begin
  v_res:=0;
  if (p_pr in [1,2,3]) then
    if v_isOracle then begin
      v_OraQr := TOracleQuery.Create(nil);
      try
        v_OraQr.Session := DB_CMN.OraConn;
        if p_pr=1 then begin // Количество исследований
          v_OraQr.SQL.Text := 'select count(*) as nnn from STUDIES';
        end else if p_pr=2 then begin // Количество серий
          v_OraQr.SQL.Text := 'select count(*) as nnn from SERIES';
        end else if p_pr=3 then begin // Количество изображений
          v_OraQr.SQL.Text := 'select count(*) as nnn from IMAGES';
        end;
        try
          v_OraQr.Execute;
          if not v_OraQr.Eof then begin
            v_res:=v_OraQr.FieldAsInteger('nnn');
          end else begin
            v_res:=0;
          end;
        except
          on e:Exception do
            begin
              MnLg_ev(e.Message);
              v_res:=0;
            end;
        end;
      finally
        v_OraQr.Free;
      end;
    end else if v_isPostgres then begin
      v_UniQr := TUniQuery.Create(nil);
      try
        v_UniQr.Connection:=DB_CMN.PGconn;
        v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
        if p_pr=1 then begin // Количество исследований
          v_UniQr.SQL.Text := 'select count(*) as nnn from '+v_pg_Schema+'.studies';
        end else if p_pr=2 then begin // Количество серий
          v_UniQr.SQL.Text := 'select count(*) as nnn from '+v_pg_Schema+'.series';
        end else if p_pr=3 then begin // Количество изображений
          v_UniQr.SQL.Text := 'select count(*) as nnn from '+v_pg_Schema+'.images';
        end;
        try
          v_UniQr.Open; v_UniQr.First;
          if not v_UniQr.Eof then begin
            v_res:=v_UniQr.FieldByName('nnn').AsInteger;
          end else begin
            v_res:=0;
          end;
        except
          on e:Exception do
            begin
              MnLg_ev(e.Message);
              v_res:=0;
            end;
        end;
      finally
        v_UniQr.Free;
      end;
    end else begin
      if DB_CMN.DB.Connected 
      then begin
      //  Cmn_Commit(frmMain.trRead);
        FIBQuery := TpFIBQuery.Create(nil);
        FIBQuery.Database := DB_CMN.DB;
        FIBQuery.Transaction := DB_CMN.trRead;
        if p_pr=1 then begin // Количество исследований
          FIBQuery.SQL.Text := 'select count(1) as nnn from STUDIES';
        end else if p_pr=2 then begin // Количество серий
          FIBQuery.SQL.Text := 'select count(1) as nnn from SERIES';
        end else if p_pr=3 then begin // Количество изображений
          FIBQuery.SQL.Text := 'select count(1) as nnn from IMAGES';
        end;
        try
          MyExecQuery(FIBQuery);
          if not FIBQuery.Eof then begin
            v_res:=FIBQuery.FieldByName('nnn').AsInteger;
          end else begin
            v_res:=0;
          end;
        finally
          FIBQuery.Close;
          FreeAndNil(FIBQuery);
        end;
      end;
    end;
  gt_rec_amm:=v_res;
end;

procedure sh_service_status;
begin
  if ServiceRunning(nil,c_proc_name) then begin
    frmMain.cxlblWarBD.Caption := 'PACS запущен';
    frmMain.cxlblWarBD.Style.Font.Color:=c_server_start_color;
  end else begin
    frmMain.cxlblWarBD.Caption := 'PACS остановлен';
    frmMain.cxlblWarBD.Style.Font.Color:=c_server_stop_color;
    frmMain.LbRbtSrv.Visible:=False;
  end;
  if ServiceRunning(nil,c_proc_WLname) then begin
    frmMain.cxlblWarBDWL.Caption := 'WORKLIST запущен';
    frmMain.cxlblWarBDWL.Style.Font.Color:=c_server_start_color;
  end else begin
    frmMain.cxlblWarBDWL.Caption := 'WORKLIST остановлен';
    frmMain.cxlblWarBDWL.Style.Font.Color:=c_server_stop_color;
  end;
  if ServiceRunning(nil,c_proc_WADO) then begin
    frmMain.lbWADOproc.Caption := 'Web сервер запущен';
    frmMain.lbWADOproc.Style.Font.Color:=c_server_start_color;
  end else begin
    frmMain.lbWADOproc.Caption := 'Web сервер остановлен';
    frmMain.lbWADOproc.Style.Font.Color:=c_server_stop_color;
  end;
end;

// отображение/перерисовка первой панели
procedure TfrmMain.PanelDB_Show(const p_n_panel : integer );
var v_dt_str : AnsiString;
begin
  if p_n_panel=1 then
  begin
    v_is_cxlbl8:=False;
    frmMain.cxlbl8.Caption:='';
    //
    frmMain.lbl11.Caption := ''; // Количество исследований :
    frmMain.lbl10.Caption := ''; // Количество серий :
    frmMain.lbl9.Caption  := ''; // Количество изображений :
    frmMain.lbl8.Caption  := ''; // Размер базы данных, байт :
    if ((not v_isPostgres) and (not v_isOracle))
    then
    begin
      if not v_is_cxlbl8 then begin
        v_is_cxlbl8:=True;
        v_dt_str:=dt_last_backup;
        // определим дату последнего резервирования
        if (v_dt_str='') then begin
          frmMain.cxlbl8.Caption:='Резервирование не производилось!';
        end else begin
          frmMain.cxlbl8.Caption:='Дата последнего резервирования: '+v_dt_str;
        end;
      end;
    end;
    // Параметры локальной базы
    frmMain.lbl11.Caption := MyIntToStr( gt_rec_amm(1) ); // Количество исследований :
    frmMain.lbl10.Caption := MyIntToStr( gt_rec_amm(2) ); // Количество серий :
    frmMain.lbl9.Caption  := MyIntToStr( gt_rec_amm(3) ); // Количество изображений :
    // Размер базы данных, байт :
    if (v_isPostgres or v_isOracle) then
    begin
      frmMain.lbl8.Visible:=False;
      frmMain.cxlbl7.Visible:=False;
    end else
      frmMain.lbl8.Caption := MyIntToStr(FileSizeByName(DB_CMN.DB.DBFileName)) ;

    if v_isOracle or v_isPostgres then
    begin
    //  frmMain.gbPathBD.Visible := False;
      frmMain.gbReservBD.Visible := False;
    end;

  end else if p_n_panel=2 then  // LOCAL
  begin
    cbModality1.Properties.Items.Clear;
    ctrFullModList( TStringList(cbModality1.Properties.Items) );
    sh_service_status;
  end else if p_n_panel=3 then  // devices
  begin
    p_devices_refr;
  end else if p_n_panel=4 then // events
  begin
    events_refresh;
  end else if p_n_panel=5 then // журнал пересылки
  begin
    resend_refresh;
  end else if p_n_panel=6 then // RULES
  begin
    rules_refresh;
  end else if p_n_panel=7 then // worklist config
  begin
    sh_service_status;
  end else if p_n_panel=8 then // Пациенты WORKLIST  -   устарело - deprecated
  begin
    patients_WL_refresh;
  end else if p_n_panel=9 then // Scheduled WORKLIST - обновление только по ручному запросу :)
  begin
    cbModality.Properties.Items.Clear;
    ctrFullModList( TStringList(cbModality.Properties.Items) );
  end;
end;

procedure TfrmMain.patients_WL_refresh;
begin
  if v_isOracle then begin
    frmMain.OraWORKLIST.Session := OraConn;
    frmMain.OraWORKLIST.Close;
    frmMain.OraWORKLIST.SQL.Text := 'SELECT * FROM WORKLIST ORDER BY P_ENAME ';
    frmMain.OraWORKLIST.Open;
    dsWORKLIST.DataSet := frmMain.OraWORKLIST;
  end else if v_isPostgres then
  begin
    UniWORKLIST.Close;
    UniWORKLIST.Connection:=PGconn;
    UniWORKLIST.Transaction:=MnUniTransaction;
    frmMain.UniWORKLIST.SQL.Text := 'SELECT * FROM '+v_pg_Schema+'.worklist ORDER BY p_ename ';
    frmMain.UniWORKLIST.Open; frmMain.UniWORKLIST.First;
    dsWORKLIST.DataSet := frmMain.UniWORKLIST;
  end else begin
    frmMain.pFIBWORKLIST.Close;
    frmMain.pFIBWORKLIST.SQLs.SelectSQL.Text := 'SELECT * FROM WORKLIST ORDER BY P_ENAME ';
    MyExecDSQuery(frmMain.pFIBWORKLIST);
    dsWORKLIST.DataSet := frmMain.pFIBWORKLIST;
  end;
end;

procedure TfrmMain.rules_refresh;
begin
  getPos ( OraRules, frmMain.UniRules, frmMain.pFIBRules );
  if v_isOracle then begin
    frmMain.OraRules.Session := OraConn;
    frmMain.OraRules.Close;
    frmMain.OraRules.SQL.Text := 'SELECT DEVICES.FC_TITLE, RULES.FK_ID, RULES.FN_PRC_COMPRESS, '+
          '  (SELECT FC_TITLE FROM DEVICES WHERE FK_ID = RULES.FK_DEVICEID2) as FC_AET_SOURCE, '+
          '  FC_MOD, FN_COMPRESS  FROM RULES, DEVICES WHERE RULES.FK_DEVICEID = DEVICES.FK_ID ';
    frmMain.OraRules.Open; frmMain.OraRules.First;
  end else if v_isPostgres then
  begin
    frmMain.UniRules.Close;
    frmMain.UniRules.SQL.Text := 'select d.fc_title, r.fk_id, r.fn_prc_compress, '+
          '  (select fc_title from '+v_pg_schema+'.devices as d2 where d2.fk_id = r.fk_deviceid2) as fc_aet_source, '+
          '  r.fc_mod, fn_compress  from '+v_pg_schema+'.rules as r, '+v_pg_schema+'.devices as d where r.fk_deviceid = d.fk_id ';
    frmMain.UniRules.Open; frmMain.UniRules.First;
  end else begin
    frmMain.pFIBRules.Close;
    frmMain.pFIBRules.SQLs.SelectSQL.Text := 'SELECT DEVICES.FC_TITLE, RULES.FK_ID, RULES.FN_PRC_COMPRESS, '+
          '  (SELECT FC_TITLE FROM DEVICES WHERE FK_ID = RULES.FK_DEVICEID2) as FC_AET_SOURCE, '+
          '  FC_MOD, FN_COMPRESS  FROM RULES, DEVICES WHERE RULES.FK_DEVICEID = DEVICES.FK_ID ';
    MyExecDSQuery(frmMain.pFIBRules);
  end;
  setPos ( OraRules, frmMain.UniRules, frmMain.pFIBRules );
end;

// запись даты, имени файла архивации
procedure WriteBackupRes( p_Date:TDateTime );
begin
  DBparams_wrt ( 'SERVER', // c_DICOM,        // SECTION
                 'LASTDATE', // KEY
                 DateTimeToStr(p_Date)      // VALUE
               );
end;

// открытие формы архивации
procedure TfrmMain.actCreateBackUpCopyExecute(Sender: TObject);
begin // create backup copy
  if (Trim(cxtxtdtBD.Text)='') then begin
    MessageDlg('Внимание!'+#13+#10+'Не задан каталог для резервного копирования!', mtInformation, [mbOK], 0);
  end else if DB_CMN.DB.Connected then
  begin
    Application.CreateForm(TFrmBackUp, FrmBackUp);
    FrmBackUp.SetParams( Trim(cxtxtdtBD.Text),
                   //  frmMain.DB.DatabaseName,
                     DB_CMN.DB.ConnectParams.UserName,
                     DB_CMN.DB.ConnectParams.Password
                   );
    try
      FrmBackUp.ShowModal;
    finally
      // если копирование было произведено
      // то запишем в журнал резервных копий
      if FrmBackUp.v_ok then begin
        WriteBackupRes(Now);
        cxlbl8.Caption:='Дата последнего резервирования: '+DateTimeToStr(Now);
      end;
      FreeAndNil(FrmBackUp);
    end;
  end
  else
  begin
    Application.MessageBox('Внимание!'+#13+
                           'Невозможно сделать резервную копию базы данных! База данных не подключена!',
                           'Предупреждение',
                           MB_ICONWARNING + MB_OK);
  end;
end;

function f_GEN_DEVICES_ID :Integer;
var FIBQuery : TpFIBQuery; v_res : integer;
begin
  v_res:=1;
  if DB_CMN.DB.Connected
  then begin
    FIBQuery := TpFIBQuery.Create(nil);
    FIBQuery.Database := DB_CMN.DB;
    FIBQuery.Transaction := DB_CMN.trWrite;
    FIBQuery.SQL.Text :=
            'select gen_id(GEN_DEVICES_ID, 1) as gen_id from rdb$database';
    try
      MyExecQuery(FIBQuery);
      v_res := FIBQuery.FieldByName('gen_id').AsInteger;
    finally
      FIBQuery.Close;
      FreeAndNil(FIBQuery);
    end;
    Cmn_Commit(DB_CMN.trWrite);
  end;
  f_GEN_DEVICES_ID := v_res;
end;

procedure TfrmMain.p_devices_refr;
begin
  getPos ( OraDevices, frmMain.UniDevices, frmMain.pFIBDevices );
  // обновить список устройств
  if v_isOracle then begin
    frmMain.OraDevices.Session := OraConn;
    frmMain.OraDevices.Close;
    frmMain.OraDevices.SQL.Text := 'SELECT fk_id, FC_IP, FN_PORT, fc_title, FC_COMMENT, FN_TYPE, FN_TRANSFER, '+
             ' case FN_TYPE when 1 then ''Сервер'' when 2 then ''Рабочая станция'' when 3 then ''Принтер'' '+
             ' else ''Не определено''  end as dev_type, fc_charset, fc_mod FROM DEVICES ';
    frmMain.OraDevices.Open;
  end else if v_isPostgres then begin
    frmMain.UniDevices.Close;
    frmMain.UniDevices.SQL.Text := 'select fk_id, fc_ip, fn_port, fc_title, fc_comment, fn_type, fn_transfer, '+
             ' case fn_type when 1 then ''сервер'' when 2 then ''рабочая станция'' when 3 then ''принтер'' '+
             ' else ''не определено''  end as dev_type, fc_charset, fc_mod from '+v_pg_schema+'.devices ';
    UniDevices.Open;
  end else begin
    frmMain.pFIBDevices.Close;
    frmMain.pFIBDevices.SQLs.SelectSQL.Text := 'SELECT FK_ID, FC_IP, FN_PORT, FC_TITLE, FC_COMMENT, FN_TYPE, FN_TRANSFER, '+
             ' case FN_TYPE when 1 then ''Сервер'' when 2 then ''Рабочая станция'' when 3 then ''Принтер'' '+
             ' else ''Не определено''  end as dev_type, fc_charset, fc_mod FROM DEVICES ';
    MyExecDSQuery(frmMain.pFIBDevices);
  end;
  setPos ( OraDevices, frmMain.UniDevices, frmMain.pFIBDevices );
end;

// вызов формы параметров устройства DICOM
// 1 - добавить
// 2 - изменить
procedure TfrmMain.CallFrm_Devices(const p_par:Byte);
var v_res : Integer;
    FIBQuery : TpFIBQuery;
    v_FC_TITLE : string;
    v_UniQr : TUniQuery;
    v_OraQr : TOracleQuery;
begin
  Application.CreateForm(TFrmEdtDevice, FrmEdtDevice);
  if p_par = 1 then
    begin // добавить устройство в список
      FrmEdtDevice.v_FK_ID       := -1; //f_GEN_DEVICES_ID;
      FrmEdtDevice.v_FC_IP       := '';
      FrmEdtDevice.v_FN_PORT     := 0;
      FrmEdtDevice.v_FC_TITLE    := '';
      FrmEdtDevice.v_FC_COMMENT  := '';
      FrmEdtDevice.v_FN_TYPE     := 0;
      FrmEdtDevice.v_FN_TRANSFER := 0;
      FrmEdtDevice.v_fc_charset  := '';
      FrmEdtDevice.v_fc_mod      := '';
    end else
    begin  // редактировать запись об устройстве
      if v_isOracle then begin
        FrmEdtDevice.v_FK_IDs      := frmMain.OraDevices.FieldByName('FK_ID').AsString;
        FrmEdtDevice.v_FC_IP       := frmMain.OraDevices.FieldByName('FC_IP').AsString;
        FrmEdtDevice.v_FN_PORT     := frmMain.OraDevices.FieldByName('FN_PORT').AsInteger;
        FrmEdtDevice.v_FC_TITLE    := frmMain.OraDevices.FieldByName('FC_TITLE').AsString;
        FrmEdtDevice.v_FC_COMMENT  := frmMain.OraDevices.FieldByName('FC_COMMENT').AsString;
        FrmEdtDevice.v_FN_TYPE     := frmMain.OraDevices.FieldByName('FN_TYPE').AsInteger;
        FrmEdtDevice.v_FN_TRANSFER := frmMain.OraDevices.FieldByName('FN_TRANSFER').AsInteger;
        FrmEdtDevice.v_fc_charset  := frmMain.OraDevices.FieldByName('fc_charset').AsString;
        FrmEdtDevice.v_fc_mod      := frmMain.OraDevices.FieldByName('fc_mod').AsString;
      end else if v_isPostgres then
      begin
        FrmEdtDevice.v_FK_IDs      := frmMain.UniDevices.FieldByName('FK_ID').AsString;
        FrmEdtDevice.v_FC_IP       := frmMain.UniDevices.FieldByName('FC_IP').AsString;
        FrmEdtDevice.v_FN_PORT     := frmMain.UniDevices.FieldByName('FN_PORT').AsInteger;
        FrmEdtDevice.v_FC_TITLE    := frmMain.UniDevices.FieldByName('FC_TITLE').AsString;
        FrmEdtDevice.v_FC_COMMENT  := frmMain.UniDevices.FieldByName('FC_COMMENT').AsString;
        FrmEdtDevice.v_FN_TYPE     := frmMain.UniDevices.FieldByName('FN_TYPE').AsInteger;
        FrmEdtDevice.v_FN_TRANSFER := frmMain.UniDevices.FieldByName('FN_TRANSFER').AsInteger;
        FrmEdtDevice.v_fc_charset  := frmMain.UniDevices.FieldByName('fc_charset').AsString;
        FrmEdtDevice.v_fc_mod      := frmMain.UniDevices.FieldByName('fc_mod').AsString;
      end else
      begin
        FrmEdtDevice.v_FK_ID       := frmMain.pFIBDevices.FieldByName('FK_ID').AsInteger;
        FrmEdtDevice.v_FC_IP       := frmMain.pFIBDevices.FieldByName('FC_IP').AsString;
        FrmEdtDevice.v_FN_PORT     := frmMain.pFIBDevices.FieldByName('FN_PORT').AsInteger;
        FrmEdtDevice.v_FC_TITLE    := frmMain.pFIBDevices.FieldByName('FC_TITLE').AsString;
        FrmEdtDevice.v_FC_COMMENT  := frmMain.pFIBDevices.FieldByName('FC_COMMENT').AsString;
        FrmEdtDevice.v_FN_TYPE     := frmMain.pFIBDevices.FieldByName('FN_TYPE').AsInteger;
        FrmEdtDevice.v_FN_TRANSFER := frmMain.pFIBDevices.FieldByName('FN_TRANSFER').AsInteger;
        FrmEdtDevice.v_fc_charset  := frmMain.pFIBDevices.FieldByName('fc_charset').AsString;
        FrmEdtDevice.v_fc_mod      := frmMain.pFIBDevices.FieldByName('fc_mod').AsString;
      end;
    end;
  FrmEdtDevice.p_set_fld_val;
  try
    v_res:=FrmEdtDevice.ShowModal;
    if v_res=mrOk then
    begin
      if v_isOracle then begin
        v_OraQr := TOracleQuery.Create(nil);
        try
          v_OraQr.Session:=DB_CMN.OraConn;
          if p_par=1 then
          begin // добавить устройство в список
            v_OraQr.SQL.Text := ' insert into DEVICES (FC_IP, FN_PORT, FC_TITLE, FC_COMMENT, FN_TYPE, FN_TRANSFER, fc_charset, fc_mod) '+#13+
                                 ' values(:p_FC_IP, :p_FN_PORT, :p_FC_TITLE, :p_FC_COMMENT, :p_FN_TYPE, :p_FN_TRANSFER, :p_fc_charset, :p_fc_mod) ';
          end else
          begin // редактировать запись об устройстве
            v_OraQr.SQL.Text := ' update DEVICES '+#13+
                                 '    set FC_IP=:p_FC_IP, FN_PORT=:p_FN_PORT, FN_TRANSFER=:p_FN_TRANSFER , fc_charset=:p_fc_charset, fc_mod=:p_fc_mod, '+#13+
                                 '        FC_TITLE=:p_FC_TITLE, FC_COMMENT=:p_FC_COMMENT, FN_TYPE = :p_FN_TYPE '+#13+
                                 '  where FK_ID=:p_FK_ID ';
            v_OraQr.DeclareAndSet('p_FK_ID', otString, FrmEdtDevice.v_FK_IDs );
          end;
          v_OraQr.DeclareAndSet('p_FC_IP', otString, FrmEdtDevice.v_FC_IP);
          v_OraQr.DeclareAndSet('p_FN_PORT', otInteger, FrmEdtDevice.v_FN_PORT);
          v_OraQr.DeclareAndSet('p_FC_TITLE', otString, FrmEdtDevice.v_FC_TITLE);
          v_OraQr.DeclareAndSet('p_FC_COMMENT', otString, FrmEdtDevice.v_FC_COMMENT);
          v_OraQr.DeclareAndSet('p_FN_TYPE', otInteger, FrmEdtDevice.v_FN_TYPE);
          v_OraQr.DeclareAndSet('p_FN_TRANSFER', otInteger, FrmEdtDevice.v_FN_TRANSFER);
          v_OraQr.DeclareAndSet('p_fc_charset', otString, FrmEdtDevice.v_fc_charset);
          v_OraQr.DeclareAndSet('p_fc_mod', otString, FrmEdtDevice.v_fc_mod);
          v_FC_TITLE:=FrmEdtDevice.v_FC_TITLE;
          try
            v_OraQr.Execute;
          except
            on e:Exception do
              MessageDlg(e.Message, mtError, [mbOK], 0);
          end;
        finally
          DB_CMN.OraConn.Commit;
          v_OraQr.Free;
        end;
      end else if v_isPostgres then
      begin
        v_UniQr := TUniQuery.Create(nil);
        try
          v_UniQr.Connection:=DB_CMN.PGconn;
          v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
          if p_par=1 then
          begin // добавить устройство в список
            v_uniqr.sql.text := ' insert into '+v_pg_schema+'.devices (fc_ip, fn_port, fc_title, fc_comment, fn_type, fn_transfer, fc_charset, fc_mod) '+#13+
                                 ' values(:p_fc_ip, :p_fn_port, :p_fc_title, :p_fc_comment, :p_fn_type, :p_fn_transfer, :p_fc_charset, :p_fc_mod) ';
          end else
          begin // редактировать запись об устройстве
            v_uniqr.sql.text := ' update '+v_pg_schema+'.devices '+#13+
                                 '    set fc_ip=:p_fc_ip, fn_port=:p_fn_port, fn_transfer=:p_fn_transfer , fc_charset=:p_fc_charset, fc_mod=:p_fc_mod, '+#13+
                                 '        fc_title=:p_fc_title, fc_comment=:p_fc_comment, fn_type = :p_fn_type '+#13+
                                 '  where fk_id=:p_fk_id ';
            v_UniQr.ParamByName('p_FK_ID').AsString := FrmEdtDevice.v_FK_IDs ;
          end;
          v_UniQr.ParamByName('p_FC_IP').AsString  := FrmEdtDevice.v_FC_IP;
          v_UniQr.ParamByName('p_FN_PORT').AsInteger := FrmEdtDevice.v_FN_PORT;
          v_UniQr.ParamByName('p_FC_TITLE').AsString := FrmEdtDevice.v_FC_TITLE;
          v_UniQr.ParamByName('p_FC_COMMENT').AsString := FrmEdtDevice.v_FC_COMMENT;
          v_UniQr.ParamByName('p_FN_TYPE').AsInteger := FrmEdtDevice.v_FN_TYPE;
          v_UniQr.ParamByName('p_FN_TRANSFER').AsInteger := FrmEdtDevice.v_FN_TRANSFER;
          v_UniQr.ParamByName('p_fc_charset').AsString := FrmEdtDevice.v_fc_charset;
          v_UniQr.ParamByName('p_fc_mod').AsString := FrmEdtDevice.v_fc_mod;
          v_FC_TITLE:=FrmEdtDevice.v_FC_TITLE;
          try
       //   v_UniQr.Transaction.StartTransaction;
          v_UniQr.ExecSQL;
       //   if v_UniQr.Transaction.Active then
       //     v_UniQr.Transaction.Commit;
          except
            on e:Exception do
              MessageDlg(e.Message, mtError, [mbOK], 0);
          end;
        finally
          v_UniQr.Free;
        end;
      end else
      begin
        Cmn_Commit(DB_CMN.trWrite);
        FIBQuery := TpFIBQuery.Create(nil);
        FIBQuery.Database := DB_CMN.DB;
        FIBQuery.Transaction := DB_CMN.trWrite;
        FibQuery.Options := FibQuery.Options + [qoAutoCommit];
        if p_par=1 then
        begin // добавить устройство в список
          FIBQuery.SQL.Text := ' insert into DEVICES (FC_IP, FN_PORT, FC_TITLE, FC_COMMENT, FN_TYPE, FN_TRANSFER, fc_charset, fc_mod) '+#13+
                               ' values(:p_FC_IP, :p_FN_PORT, :p_FC_TITLE, :p_FC_COMMENT, :p_FN_TYPE, :p_FN_TRANSFER, :p_fc_charset, :p_fc_mod) ';
        end else
        begin // редактировать запись об устройстве
          FIBQuery.SQL.Text := ' update DEVICES '+#13+
                               '    set FC_IP=:p_FC_IP, FN_PORT=:p_FN_PORT, FN_TRANSFER=:p_FN_TRANSFER, fc_charset=:p_fc_charset, fc_mod=:p_fc_mod, '+#13+
                               '        FC_TITLE=:p_FC_TITLE, FC_COMMENT=:p_FC_COMMENT, FN_TYPE = :p_FN_TYPE '+#13+
                               '  where FK_ID=:p_FK_ID ';
          FIBQuery.ParamByName('p_FK_ID').AsInteger := FrmEdtDevice.v_FK_ID ;
        end;
        FIBQuery.ParamByName('p_FC_IP').AsString  := FrmEdtDevice.v_FC_IP;
        FIBQuery.ParamByName('p_FN_PORT').AsInteger := FrmEdtDevice.v_FN_PORT;
        FIBQuery.ParamByName('p_FC_TITLE').AsString := FrmEdtDevice.v_FC_TITLE;
        FIBQuery.ParamByName('p_FC_COMMENT').AsString := FrmEdtDevice.v_FC_COMMENT;
        FIBQuery.ParamByName('p_FN_TYPE').AsInteger := FrmEdtDevice.v_FN_TYPE;
        FIBQuery.ParamByName('p_FN_TRANSFER').AsInteger := FrmEdtDevice.v_FN_TRANSFER;
        FIBQuery.ParamByName('p_fc_charset').AsString := FrmEdtDevice.v_fc_charset;
        FIBQuery.ParamByName('p_fc_mod').AsString := FrmEdtDevice.v_fc_mod;
        v_FC_TITLE:=FrmEdtDevice.v_FC_TITLE;
        try
          MyExecQuery(FIBQuery);
        finally
          FIBQuery.Close;
          FreeAndNil(FIBQuery);
        end;
        Cmn_Commit(DB_CMN.trWrite);
      end;
      // обновить список устройств на форме
      p_devices_refr;
      if v_isOracle then begin
        frmMain.OraDevices.Locate('FC_TITLE', FrmEdtDevice.v_FC_TITLE, [])
      end else if v_isPostgres then
        frmMain.UniDevices.Locate('FC_TITLE', FrmEdtDevice.v_FC_TITLE, [])
      else
        frmMain.pFIBDevices.Locate('FC_TITLE', FrmEdtDevice.v_FC_TITLE, []);
    end;
  finally
    FreeAndNil(FrmEdtDevice);
  end;
end;

procedure TfrmMain.actDltDeviceExecute(Sender: TObject);
var FIBQuery : TpFIBQuery; v_UniQr : TUniQuery; v_OraQr : TOracleQuery;
begin // delete device
  if (cxDV.DataController.Controller.SelectedRecordCount=1)
  then begin
    if Application.MessageBox(
      'Вы действительно хотите удалить выбранное устройство из списка?',
      'Вопрос', MB_YESNO + MB_ICONQUESTION) = IDYES
    then
    begin
      if v_isOracle then begin
        v_OraQr := TOracleQuery.Create(nil);
        try
          v_OraQr.Session:=DB_CMN.OraConn;
          v_OraQr.SQL.Text := 'delete from DEVICES where FK_ID=:p_FK_ID';
          v_OraQr.DeclareAndSet( 'p_FK_ID', otString, OraDevices.FieldByName('FK_ID').AsString );
          try
            v_OraQr.Execute;
          except
            on e:Exception do
              MessageDlg(e.Message, mtError, [mbOK], 0);
          end;
        finally
          v_OraQr.Free;
        end;
      end else if v_isPostgres then begin
        v_UniQr := TUniQuery.Create(nil);
        try
          v_UniQr.Connection:=DB_CMN.PGconn;
          v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
          v_UniQr.SQL.Text := 'delete from '+v_pg_Schema+'.devices where fk_id=:p_FK_ID';
          v_UniQr.ParamByName('p_FK_ID').AsString := UniDevices.FieldByName('FK_ID').AsString ;
          try
          //  v_UniQr.Transaction.StartTransaction;
            v_UniQr.ExecSQL;
          //  if v_UniQr.Transaction.Active then
          //    v_UniQr.Transaction.Commit;
          except
            on e:Exception do
              MessageDlg(e.Message, mtError, [mbOK], 0);
          end;
        finally
          v_UniQr.Free;
        end;
      end else
      begin
        Cmn_Commit(DB_CMN.trWrite);
        FIBQuery := TpFIBQuery.Create(nil);
        FIBQuery.Database := DB_CMN.DB;
        FIBQuery.Transaction := DB_CMN.trWrite;
        FibQuery.Options := FibQuery.Options + [qoAutoCommit];
        FIBQuery.SQL.Text := 'delete from DEVICES where FK_ID=:p_FK_ID';
        FIBQuery.ParamByName('p_FK_ID').AsInteger := pFIBDevices.FieldByName('FK_ID').AsInteger ;
        try
          MyExecQuery(FIBQuery);
        finally
          FIBQuery.Close;
          FreeAndNil(FIBQuery);
        end;
        Cmn_Commit(DB_CMN.trWrite);
      end;
      // обновить список устройств на форме
      p_devices_refr;
    end;
  end;
end;

procedure TfrmMain.actEchoTimerExecute(Sender: TObject);
begin
  tmEchoTest.Enabled:=False;
  try
    wrtEchoMonitorLog('try ECHO ...');
    Application.ProcessMessages;
    if f_C_ECHO(TEIPServer.Text, cxtSERVER_PORT.Text, cxtAE_TITLE.Text, LocAE) then
    begin
      wrtEchoMonitorLog('OK')
    end else
    begin
      wrtEchoMonitorLog('ECHO ERROR - RESTART');
      Application.ProcessMessages;
      actReboot.Execute;
      Application.ProcessMessages;
    end;
  finally
    tmEchoTest.Enabled:=True;
  end;
end;

procedure TfrmMain.actEdtDeviceExecute(Sender: TObject);
begin // edit device
  if (cxDV.DataController.Controller.SelectedRecordCount=1)
  then begin
    CallFrm_Devices(2);
  end;
end;

procedure TfrmMain.actEdtTagsExecute(Sender: TObject);
var v_TpFIBDataSet: TpFIBDataSet; v_sql_txt : AnsiString;
    v_TpFIBDataSet1, v_TpFIBDataSet2 : TpFIBQuery;
    v_OraQr : TOracleQuery;
    v_UniQr : TUniQuery;
  procedure pTextEdit_INI ( p_TcxTextEdit1, p_TcxTextEdit2 : TcxTextEdit; p_field1, p_field2 : string; vDS : TDataSet );
  begin
    p_TcxTextEdit1.Text := vDS.FieldByName(p_field1).AsString;
    p_TcxTextEdit2.Text := vDS.FieldByName(p_field2).AsString;
  end;
  function pTextEdit_SET ( p_pr:Integer; p_TcxTextEdit1, p_TcxTextEdit2 : TcxTextEdit; p_field1, p_field2 : string ):string;
  begin
    if p_pr=0 then
    begin
      Result:='  '+p_field1+'=:p_'+p_field1+', '+p_field2+'=:p_'+p_field2+',';
    end else
    begin
      if v_isOracle then begin
        v_OraQr.DeclareAndSet('p_'+p_field1, otString  , p_TcxTextEdit1.Text );
        v_OraQr.DeclareAndSet('p_'+p_field2, otString , p_TcxTextEdit2.Text );
        Result:='';
      end else if v_isPostgres then
      begin
        v_UniQr.ParamByName('p_'+p_field1).AsString  := p_TcxTextEdit1.Text;
        v_UniQr.ParamByName('p_'+p_field2).AsString  := p_TcxTextEdit2.Text;
        Result:='';
      end else
      begin
        v_TpFIBDataSet2.ParamByName('p_'+p_field1).AsString  := p_TcxTextEdit1.Text;
        v_TpFIBDataSet2.ParamByName('p_'+p_field2).AsString  := p_TcxTextEdit2.Text;
        Result:='';
      end;
    end;
  end;
  procedure p_set_params;
  begin
    pTextEdit_SET ( 1,  FTAGS.FC_IMAGETYPE_1, FTAGS.FC_IMAGETYPE_2, 'FC_IMAGETYPE_1', 'FC_IMAGETYPE_2' );
    pTextEdit_SET ( 1,  FTAGS.FC_STUDYID_1, FTAGS.FC_STUDYID_2, 'FC_STUDYID_1', 'FC_STUDYID_2' );
    pTextEdit_SET ( 1,  FTAGS.FC_PATIENTID_1, FTAGS.FC_PATIENTID_2, 'FC_PATIENTID_1', 'FC_PATIENTID_2' );
    pTextEdit_SET ( 1,  FTAGS.FC_STUDYDESCRIPTION_1, FTAGS.FC_STUDYDESCRIPTION_2, 'FC_STUDYDESCRIPTION_1', 'FC_STUDYDESCRIPTION_2' );
    pTextEdit_SET ( 1,  FTAGS.FC_ACCESSIONNUMBER_1, FTAGS.FC_ACCESSIONNUMBER_2, 'FC_ACCESSIONNUMBER_1', 'FC_ACCESSIONNUMBER_2' );
    pTextEdit_SET ( 1,  FTAGS.FC_DA_1, FTAGS.FC_DA_2, 'FC_DA_1', 'FC_DA_2' );
    pTextEdit_SET ( 1,  FTAGS.FC_DT_1, FTAGS.FC_DT_2, 'FC_DT_1', 'FC_DT_2' );
    pTextEdit_SET ( 1,  FTAGS.FC_STUDYUID_1, FTAGS.FC_STUDYUID_2, 'FC_STUDYUID_1', 'FC_STUDYUID_2' );
    pTextEdit_SET ( 1,  FTAGS.FC_SERIESUID_1, FTAGS.FC_SERIESUID_2, 'FC_SERIESUID_1', 'FC_SERIESUID_2' );
    pTextEdit_SET ( 1,  FTAGS.FC_SERNUM_1, FTAGS.FC_SERNUM_2, 'FC_SERNUM_1', 'FC_SERNUM_2' );
    pTextEdit_SET ( 1,  FTAGS.FC_PHYSNAME_1, FTAGS.FC_PHYSNAME_2, 'FC_PHYSNAME_1', 'FC_PHYSNAME_2' );
    pTextEdit_SET ( 1,  FTAGS.FC_PNAME_1, FTAGS.FC_PNAME_2, 'FC_PNAME_1', 'FC_PNAME_2' );
    pTextEdit_SET ( 1,  FTAGS.FC_PDATEBORN_1, FTAGS.FC_PDATEBORN_2, 'FC_PDATEBORN_1', 'FC_PDATEBORN_2' );
    pTextEdit_SET ( 1,  FTAGS.FC_PSEX_1, FTAGS.FC_PSEX_2, 'FC_PSEX_1', 'FC_PSEX_2' );
    pTextEdit_SET ( 1,  FTAGS.FC_AID_1, FTAGS.FC_AID_2, 'FC_AID_1', 'FC_AID_2' );
    pTextEdit_SET ( 1,  FTAGS.FC_ACQNUM_1, FTAGS.FC_ACQNUM_2, 'FC_ACQNUM_1', 'FC_ACQNUM_2' );
    pTextEdit_SET ( 1,  FTAGS.FC_INSTANCEUID_1, FTAGS.FC_INSTANCEUID_2, 'FC_INSTANCEUID_1', 'FC_INSTANCEUID_2' );
    pTextEdit_SET ( 1,  FTAGS.FC_KIN_1, FTAGS.FC_KIN_2, 'FC_KIN_1', 'FC_KIN_2' );
  end;
  procedure p_sav_tags;
  var vStrRmp : AnsiString;
  begin
    vStrRmp := pTextEdit_SET ( 0, FTAGS.FC_IMAGETYPE_1, FTAGS.FC_IMAGETYPE_2, 'FC_IMAGETYPE_1', 'FC_IMAGETYPE_2' )+
            pTextEdit_SET ( 0, FTAGS.FC_STUDYID_1, FTAGS.FC_STUDYID_2, 'FC_STUDYID_1', 'FC_STUDYID_2' )+
            pTextEdit_SET ( 0, FTAGS.FC_PATIENTID_1, FTAGS.FC_PATIENTID_2, 'FC_PATIENTID_1', 'FC_PATIENTID_2' )+
            pTextEdit_SET ( 0, FTAGS.FC_STUDYDESCRIPTION_1, FTAGS.FC_STUDYDESCRIPTION_2, 'FC_STUDYDESCRIPTION_1', 'FC_STUDYDESCRIPTION_2' )+
            pTextEdit_SET ( 0, FTAGS.FC_ACCESSIONNUMBER_1, FTAGS.FC_ACCESSIONNUMBER_2, 'FC_ACCESSIONNUMBER_1', 'FC_ACCESSIONNUMBER_2' )+
            pTextEdit_SET ( 0, FTAGS.FC_DA_1, FTAGS.FC_DA_2, 'FC_DA_1', 'FC_DA_2' )+
            pTextEdit_SET ( 0, FTAGS.FC_DT_1, FTAGS.FC_DT_2, 'FC_DT_1', 'FC_DT_2' )+
            pTextEdit_SET ( 0, FTAGS.FC_STUDYUID_1, FTAGS.FC_STUDYUID_2, 'FC_STUDYUID_1', 'FC_STUDYUID_2' )+
            pTextEdit_SET ( 0, FTAGS.FC_SERIESUID_1, FTAGS.FC_SERIESUID_2, 'FC_SERIESUID_1', 'FC_SERIESUID_2' )+
            pTextEdit_SET ( 0, FTAGS.FC_SERNUM_1, FTAGS.FC_SERNUM_2, 'FC_SERNUM_1', 'FC_SERNUM_2' )+
            pTextEdit_SET ( 0, FTAGS.FC_PHYSNAME_1, FTAGS.FC_PHYSNAME_2, 'FC_PHYSNAME_1', 'FC_PHYSNAME_2' )+
            pTextEdit_SET ( 0, FTAGS.FC_PNAME_1, FTAGS.FC_PNAME_2, 'FC_PNAME_1', 'FC_PNAME_2' )+
            pTextEdit_SET ( 0, FTAGS.FC_PDATEBORN_1, FTAGS.FC_PDATEBORN_2, 'FC_PDATEBORN_1', 'FC_PDATEBORN_2' )+
            pTextEdit_SET ( 0, FTAGS.FC_PSEX_1, FTAGS.FC_PSEX_2, 'FC_PSEX_1', 'FC_PSEX_2' )+
            pTextEdit_SET ( 0, FTAGS.FC_AID_1, FTAGS.FC_AID_2, 'FC_AID_1', 'FC_AID_2' )+
            pTextEdit_SET ( 0, FTAGS.FC_ACQNUM_1, FTAGS.FC_ACQNUM_2, 'FC_ACQNUM_1', 'FC_ACQNUM_2' )+
            pTextEdit_SET ( 0, FTAGS.FC_INSTANCEUID_1, FTAGS.FC_INSTANCEUID_2, 'FC_INSTANCEUID_1', 'FC_INSTANCEUID_2' )+
            pTextEdit_SET ( 0, FTAGS.FC_KIN_1, FTAGS.FC_KIN_2, 'FC_KIN_1', 'FC_KIN_2' ) ;
    if v_isOracle then begin
      v_OraQr := TOracleQuery.Create(nil);
      with v_OraQr do
      try
        Session := DB_CMN.OraConn;
        v_sql_txt := 'update TAGS set '+vStrRmp;
        SQL.Text := Copy(v_sql_txt,1,Length(v_sql_txt)-1)+' where FC_TITLE=:p_FC_TITLE ';
        DeclareAndSet('p_FC_TITLE', otString , FTAGS.v_AETITLE ) ;
        p_set_params;
        Execute;
      finally
        Free;
      end;
    end else if v_isPostgres then
    begin
      v_UniQr := TUniQuery.Create(nil);
      with v_UniQr do
      try
        Connection:=DB_CMN.PGconn;
        Transaction:=DB_CMN.MnUniTransaction;
        v_sql_txt := 'update '+v_pg_Schema+'.TAGS set '+vStrRmp;
        SQL.Text := Copy(v_sql_txt,1,Length(v_sql_txt)-1)+' where FC_TITLE=:p_FC_TITLE ';
        ParamByName('p_FC_TITLE').AsString  := FTAGS.v_AETITLE ;
        p_set_params;
        ExecSQL;
      finally
        Free;
      end;
    end else
    begin
      v_TpFIBDataSet2 := TpFIBQuery.Create(Self);
      with v_TpFIBDataSet2 do
      try
        Database:=DB_CMN.DB;
        Transaction:=DB_CMN.trWrite;
        v_sql_txt := 'update TAGS set '+vStrRmp;
        SQL.Text := Copy(v_sql_txt,1,Length(v_sql_txt)-1)+' where FC_TITLE=:p_FC_TITLE ';
        ParamByName('p_FC_TITLE').AsString  := FTAGS.v_AETITLE ;
        p_set_params;
        ExecQuery;
        DB_CMN.trWrite.CommitRetaining;
      finally
        Close;
        Free;
      end;
    end;
  end;
var v_is_add : Boolean; v_OracleQuery : TOracleDataSet;
    v_UniQuery : TUniQuery;
begin  // edt tags
  FTAGS := TFTAGS.Create(Self);
  try
    if v_isOracle then begin
      FTAGS.v_AETITLE := frmMain.OraDevices.FieldByName('FC_TITLE').AsString;
      v_OracleQuery := TOracleDataSet.Create(Self);
      with v_OracleQuery do
      try
        Session := DB_CMN.OraConn;
        SQL.Text := 'select * from TAGS where FC_TITLE=:p_FC_TITLE';
        DeclareAndSet('p_FC_TITLE', otString , FTAGS.v_AETITLE );
        Open;
        if Eof then
        begin
          v_is_add := True;
          FTAGS.SetDefault;
        end else
        begin
          v_is_add := False;
          pTextEdit_INI ( FTAGS.FC_IMAGETYPE_1, FTAGS.FC_IMAGETYPE_2, 'FC_IMAGETYPE_1', 'FC_IMAGETYPE_2', v_OracleQuery );
          pTextEdit_INI ( FTAGS.FC_STUDYID_1, FTAGS.FC_STUDYID_2, 'FC_STUDYID_1', 'FC_STUDYID_2', v_OracleQuery );
          pTextEdit_INI ( FTAGS.FC_PATIENTID_1, FTAGS.FC_PATIENTID_2, 'FC_PATIENTID_1', 'FC_PATIENTID_2', v_OracleQuery );
          pTextEdit_INI ( FTAGS.FC_STUDYDESCRIPTION_1, FTAGS.FC_STUDYDESCRIPTION_2, 'FC_STUDYDESCRIPTION_1', 'FC_STUDYDESCRIPTION_2', v_OracleQuery );
          pTextEdit_INI ( FTAGS.FC_ACCESSIONNUMBER_1, FTAGS.FC_ACCESSIONNUMBER_2, 'FC_ACCESSIONNUMBER_1', 'FC_ACCESSIONNUMBER_2', v_OracleQuery );
          pTextEdit_INI ( FTAGS.FC_DA_1, FTAGS.FC_DA_2, 'FC_DA_1', 'FC_DA_2', v_OracleQuery );
          pTextEdit_INI ( FTAGS.FC_DT_1, FTAGS.FC_DT_2, 'FC_DT_1', 'FC_DT_2', v_OracleQuery );
          pTextEdit_INI ( FTAGS.FC_STUDYUID_1, FTAGS.FC_STUDYUID_2, 'FC_STUDYUID_1', 'FC_STUDYUID_2', v_OracleQuery );
          pTextEdit_INI ( FTAGS.FC_SERIESUID_1, FTAGS.FC_SERIESUID_2, 'FC_SERIESUID_1', 'FC_SERIESUID_2', v_OracleQuery );
          pTextEdit_INI ( FTAGS.FC_SERNUM_1, FTAGS.FC_SERNUM_2, 'FC_SERNUM_1', 'FC_SERNUM_2', v_OracleQuery );
          pTextEdit_INI ( FTAGS.FC_PHYSNAME_1, FTAGS.FC_PHYSNAME_2, 'FC_PHYSNAME_1', 'FC_PHYSNAME_2', v_OracleQuery );
          pTextEdit_INI ( FTAGS.FC_PNAME_1, FTAGS.FC_PNAME_2, 'FC_PNAME_1', 'FC_PNAME_2', v_OracleQuery );
          pTextEdit_INI ( FTAGS.FC_PDATEBORN_1, FTAGS.FC_PDATEBORN_2, 'FC_PDATEBORN_1', 'FC_PDATEBORN_2', v_OracleQuery );
          pTextEdit_INI ( FTAGS.FC_PSEX_1, FTAGS.FC_PSEX_2, 'FC_PSEX_1', 'FC_PSEX_2', v_OracleQuery );
          pTextEdit_INI ( FTAGS.FC_AID_1, FTAGS.FC_AID_2, 'FC_AID_1', 'FC_AID_2', v_OracleQuery );
          pTextEdit_INI ( FTAGS.FC_ACQNUM_1, FTAGS.FC_ACQNUM_2, 'FC_ACQNUM_1', 'FC_ACQNUM_2', v_OracleQuery );
          pTextEdit_INI ( FTAGS.FC_INSTANCEUID_1, FTAGS.FC_INSTANCEUID_2, 'FC_INSTANCEUID_1', 'FC_INSTANCEUID_2', v_OracleQuery );
          pTextEdit_INI ( FTAGS.FC_KIN_1, FTAGS.FC_KIN_2, 'FC_KIN_1', 'FC_KIN_2', v_OracleQuery );
        end;
      finally
        Close;
        Free;
      end;
    end else if v_isPostgres then
    begin
      FTAGS.v_AETITLE := frmMain.UniDevices.FieldByName('FC_TITLE').AsString;
      v_UniQuery := TUniQuery.Create(Self);
      with v_UniQuery do
      try
        Connection:=DB_CMN.PGconn;
        Transaction:=DB_CMN.MnUniTransaction;
        SQL.Text := 'select * from TAGS where FC_TITLE=:p_FC_TITLE';
        ParamByName('p_FC_TITLE').AsString  := FTAGS.v_AETITLE ;
        Open;
        if Eof then
        begin
          v_is_add := True;
          FTAGS.SetDefault;
        end else
        begin
          v_is_add := False;
          pTextEdit_INI ( FTAGS.FC_IMAGETYPE_1, FTAGS.FC_IMAGETYPE_2, 'FC_IMAGETYPE_1', 'FC_IMAGETYPE_2', v_UniQuery );
          pTextEdit_INI ( FTAGS.FC_STUDYID_1, FTAGS.FC_STUDYID_2, 'FC_STUDYID_1', 'FC_STUDYID_2', v_UniQuery );
          pTextEdit_INI ( FTAGS.FC_PATIENTID_1, FTAGS.FC_PATIENTID_2, 'FC_PATIENTID_1', 'FC_PATIENTID_2', v_UniQuery );
          pTextEdit_INI ( FTAGS.FC_STUDYDESCRIPTION_1, FTAGS.FC_STUDYDESCRIPTION_2, 'FC_STUDYDESCRIPTION_1', 'FC_STUDYDESCRIPTION_2', v_UniQuery );
          pTextEdit_INI ( FTAGS.FC_ACCESSIONNUMBER_1, FTAGS.FC_ACCESSIONNUMBER_2, 'FC_ACCESSIONNUMBER_1', 'FC_ACCESSIONNUMBER_2', v_UniQuery );
          pTextEdit_INI ( FTAGS.FC_DA_1, FTAGS.FC_DA_2, 'FC_DA_1', 'FC_DA_2', v_UniQuery );
          pTextEdit_INI ( FTAGS.FC_DT_1, FTAGS.FC_DT_2, 'FC_DT_1', 'FC_DT_2', v_UniQuery );
          pTextEdit_INI ( FTAGS.FC_STUDYUID_1, FTAGS.FC_STUDYUID_2, 'FC_STUDYUID_1', 'FC_STUDYUID_2', v_UniQuery );
          pTextEdit_INI ( FTAGS.FC_SERIESUID_1, FTAGS.FC_SERIESUID_2, 'FC_SERIESUID_1', 'FC_SERIESUID_2', v_UniQuery );
          pTextEdit_INI ( FTAGS.FC_SERNUM_1, FTAGS.FC_SERNUM_2, 'FC_SERNUM_1', 'FC_SERNUM_2', v_UniQuery );
          pTextEdit_INI ( FTAGS.FC_PHYSNAME_1, FTAGS.FC_PHYSNAME_2, 'FC_PHYSNAME_1', 'FC_PHYSNAME_2', v_UniQuery );
          pTextEdit_INI ( FTAGS.FC_PNAME_1, FTAGS.FC_PNAME_2, 'FC_PNAME_1', 'FC_PNAME_2', v_UniQuery );
          pTextEdit_INI ( FTAGS.FC_PDATEBORN_1, FTAGS.FC_PDATEBORN_2, 'FC_PDATEBORN_1', 'FC_PDATEBORN_2', v_UniQuery );
          pTextEdit_INI ( FTAGS.FC_PSEX_1, FTAGS.FC_PSEX_2, 'FC_PSEX_1', 'FC_PSEX_2', v_UniQuery );
          pTextEdit_INI ( FTAGS.FC_AID_1, FTAGS.FC_AID_2, 'FC_AID_1', 'FC_AID_2', v_UniQuery );
          pTextEdit_INI ( FTAGS.FC_ACQNUM_1, FTAGS.FC_ACQNUM_2, 'FC_ACQNUM_1', 'FC_ACQNUM_2', v_UniQuery );
          pTextEdit_INI ( FTAGS.FC_INSTANCEUID_1, FTAGS.FC_INSTANCEUID_2, 'FC_INSTANCEUID_1', 'FC_INSTANCEUID_2', v_UniQuery );
          pTextEdit_INI ( FTAGS.FC_KIN_1, FTAGS.FC_KIN_2, 'FC_KIN_1', 'FC_KIN_2', v_UniQuery );
        end;
      finally
        Close;
        Free;
      end;
    end else
    begin
      FTAGS.v_AETITLE := frmMain.pFIBDevices.FieldByName('FC_TITLE').AsString;
      v_TpFIBDataSet := TpFIBDataSet.Create(Self);
      with v_TpFIBDataSet do
      try
        Database:=DB_CMN.DB;
        Transaction:=DB_CMN.trRead;
        SelectSQL.Text := 'select * from TAGS where FC_TITLE=:p_FC_TITLE';
        ParamByName('p_FC_TITLE').AsString  := FTAGS.v_AETITLE ;
        Open; First;
        if Eof then
        begin
          v_is_add := True;
          FTAGS.SetDefault;
        end else
        begin
          v_is_add := False;
          pTextEdit_INI ( FTAGS.FC_IMAGETYPE_1, FTAGS.FC_IMAGETYPE_2, 'FC_IMAGETYPE_1', 'FC_IMAGETYPE_2', v_TpFIBDataSet );
          pTextEdit_INI ( FTAGS.FC_STUDYID_1, FTAGS.FC_STUDYID_2, 'FC_STUDYID_1', 'FC_STUDYID_2', v_TpFIBDataSet );
          pTextEdit_INI ( FTAGS.FC_PATIENTID_1, FTAGS.FC_PATIENTID_2, 'FC_PATIENTID_1', 'FC_PATIENTID_2', v_TpFIBDataSet );
          pTextEdit_INI ( FTAGS.FC_STUDYDESCRIPTION_1, FTAGS.FC_STUDYDESCRIPTION_2, 'FC_STUDYDESCRIPTION_1', 'FC_STUDYDESCRIPTION_2', v_TpFIBDataSet );
          pTextEdit_INI ( FTAGS.FC_ACCESSIONNUMBER_1, FTAGS.FC_ACCESSIONNUMBER_2, 'FC_ACCESSIONNUMBER_1', 'FC_ACCESSIONNUMBER_2', v_TpFIBDataSet );
          pTextEdit_INI ( FTAGS.FC_DA_1, FTAGS.FC_DA_2, 'FC_DA_1', 'FC_DA_2', v_TpFIBDataSet );
          pTextEdit_INI ( FTAGS.FC_DT_1, FTAGS.FC_DT_2, 'FC_DT_1', 'FC_DT_2', v_TpFIBDataSet );
          pTextEdit_INI ( FTAGS.FC_STUDYUID_1, FTAGS.FC_STUDYUID_2, 'FC_STUDYUID_1', 'FC_STUDYUID_2', v_TpFIBDataSet );
          pTextEdit_INI ( FTAGS.FC_SERIESUID_1, FTAGS.FC_SERIESUID_2, 'FC_SERIESUID_1', 'FC_SERIESUID_2', v_TpFIBDataSet );
          pTextEdit_INI ( FTAGS.FC_SERNUM_1, FTAGS.FC_SERNUM_2, 'FC_SERNUM_1', 'FC_SERNUM_2', v_TpFIBDataSet );
          pTextEdit_INI ( FTAGS.FC_PHYSNAME_1, FTAGS.FC_PHYSNAME_2, 'FC_PHYSNAME_1', 'FC_PHYSNAME_2', v_TpFIBDataSet );
          pTextEdit_INI ( FTAGS.FC_PNAME_1, FTAGS.FC_PNAME_2, 'FC_PNAME_1', 'FC_PNAME_2', v_TpFIBDataSet );
          pTextEdit_INI ( FTAGS.FC_PDATEBORN_1, FTAGS.FC_PDATEBORN_2, 'FC_PDATEBORN_1', 'FC_PDATEBORN_2', v_TpFIBDataSet );
          pTextEdit_INI ( FTAGS.FC_PSEX_1, FTAGS.FC_PSEX_2, 'FC_PSEX_1', 'FC_PSEX_2', v_TpFIBDataSet );
          pTextEdit_INI ( FTAGS.FC_AID_1, FTAGS.FC_AID_2, 'FC_AID_1', 'FC_AID_2', v_TpFIBDataSet );
          pTextEdit_INI ( FTAGS.FC_ACQNUM_1, FTAGS.FC_ACQNUM_2, 'FC_ACQNUM_1', 'FC_ACQNUM_2', v_TpFIBDataSet );
          pTextEdit_INI ( FTAGS.FC_INSTANCEUID_1, FTAGS.FC_INSTANCEUID_2, 'FC_INSTANCEUID_1', 'FC_INSTANCEUID_2', v_TpFIBDataSet );
          pTextEdit_INI ( FTAGS.FC_KIN_1, FTAGS.FC_KIN_2, 'FC_KIN_1', 'FC_KIN_2', v_TpFIBDataSet );
        end;
      finally
        Close;
        Free;
      end;
    end;
    if FTAGS.ShowModal= mrOk then
    begin
      if v_is_add then
      begin
        if v_isOracle then begin
          v_OraQr := TOracleQuery.Create(nil);
          try
            v_OraQr.Session := DB_CMN.OraConn;
            v_sql_txt := 'insert into TAGS (FC_TITLE) values (:p_FC_TITLE)';
            v_OraQr.SQL.Text := v_sql_txt;
            v_OraQr.DeclareAndSet('p_FC_TITLE', otString , FTAGS.v_AETITLE );
            v_OraQr.Execute;
          finally
            v_OraQr.Free;
          end;
        end else if v_isPostgres then
        begin
          v_UniQr := TUniQuery.Create(nil);
          try
            v_UniQr.Connection:=DB_CMN.PGconn;
            v_UniQr.Transaction:=DB_CMN.MnUniTransaction;

            v_UniQr.SQL.Text := 'insert into '+v_pg_Schema+'.tags (fc_title) values (:p_FC_TITLE)';
            v_UniQr.ParamByName('p_FC_TITLE').AsString  := FTAGS.v_AETITLE ;
            v_UniQr.ExecSQL;
          finally
            v_UniQr.Close;
            v_UniQr.Free;
          end;
        end else
        begin
          v_TpFIBDataSet1 := TpFIBQuery.Create(Self);
          try
            v_TpFIBDataSet1.Database:=DB_CMN.DB;
            v_TpFIBDataSet1.Transaction:=DB_CMN.trWrite;
            v_sql_txt := 'insert into TAGS (FC_TITLE) values (:p_FC_TITLE)';
            v_TpFIBDataSet1.SQL.Text := v_sql_txt;
            v_TpFIBDataSet1.ParamByName('p_FC_TITLE').AsString  := FTAGS.v_AETITLE ;
            v_TpFIBDataSet1.ExecQuery;
            DB_CMN.trWrite.CommitRetaining;
          finally
            v_TpFIBDataSet1.Close;
            v_TpFIBDataSet1.Free;
          end;
        end;
      end;
        p_sav_tags;
    end;
  finally
    FreeAndNil(FTAGS);
  end;
end;

procedure TfrmMain.actInsDeviceExecute(Sender: TObject);
begin  // insert device
  CallFrm_Devices(1);
end;

procedure TfrmMain.actOpenCatalogExecute(Sender: TObject);
begin
  dlgrezcopy.Directory:=cxtxtdtBD.Text;
  if dlgrezcopy.Execute then
  begin
    if (cxtxtdtBD.Text <> dlgrezcopy.Directory) then begin
      SetSavBtnCol(True);
      cxtxtdtBD.Text := dlgrezcopy.Directory;
    end;
  end;
end;

procedure TfrmMain.actOpenCatLocalDBImagesExecute(Sender: TObject);
begin
  dlglocimg.Directory:=cxtxtdt1.Text;
  if dlglocimg.Execute then
  begin
    if (cxtxtdt1.Text <> dlglocimg.Directory) then
    begin
      SetSavBtnCol(True);
      cxtxtdt1.Text := dlglocimg.Directory;
    end;
  end;
end;

procedure TfrmMain.actOpenCatLogFilesExecute(Sender: TObject);
begin
  dlglocimg.Directory:=cxtxtCtlgLog.Text;
  if dlglocimg.Execute then
  begin
    if (cxtxtCtlgLog.Text <> dlglocimg.Directory) then
    begin
      SetSavBtnCol(True);
      cxtxtCtlgLog.Text := dlglocimg.Directory;
    end;
  end;
end;

procedure TfrmMain.events_refresh;
var v_sql : AnsiString;
begin
  getPos ( OraEvents, frmMain.UniEvents, frmMain.pFIBEvents );
  if v_isOracle then begin
    frmMain.OraEvents.Session := OraConn;
    frmMain.OraEvents.Close;
    frmMain.OraEvents.SQL.Clear;
    v_sql := 'select e.*, CASE e.FN_TYPE '+
     ' WHEN 1 THEN ''Запуск сервера'' '+
     ' WHEN 2 THEN ''Остановка сервера'' '+
     ' WHEN 3 THEN ''Ошибка'' '+
     ' WHEN 4 THEN ''Обработанные события'' '+
     ' WHEN 5 THEN ''Изменения параметров сервера'' '+
     ' ELSE ''Не определено'' '+
    'END as TYP_NAME from EVENTS e where 1=1 ';
    if YearOf(frmMain.cxdtdtDate1.Date)>1900 then begin
      v_sql := v_sql + ' and FD_DATE >= :PDATE1 ';
    end;
    if YearOf(frmMain.cxdtdtDate2.Date)>1900 then begin
      v_sql := v_sql + ' and FD_DATE < :PDATE2 + 1 ';
    end;
    if frmMain.cxCBall.Checked then begin // Все события
      v_sql := v_sql + '';
    end else begin
      if frmMain.cxCBstart.Checked or
         frmMain.cxCBstop.Checked or
         frmMain.cxchckbxerror.Checked or
         frmMain.cxchckbxevents.Checked or
         frmMain.cxchckbxParamEdit.Checked
      then begin
        v_sql := v_sql + ' and ( (1=0) ';
        if frmMain.cxCBstart.Checked then begin // Запуск сервера
          v_sql := v_sql + ' or (FN_TYPE=1) ';
        end;
        if frmMain.cxCBstop.Checked then begin // Остановка сервера
          v_sql := v_sql + ' or (FN_TYPE=2) ';
        end;
        if frmMain.cxchckbxerror.Checked then begin // Ошибки
          v_sql := v_sql + ' or (FN_TYPE=3) ';
        end;
        if frmMain.cxchckbxevents.Checked then begin // Обработанные события
          v_sql := v_sql + ' or (FN_TYPE=4) ';
        end;
        if frmMain.cxchckbxParamEdit.Checked then begin // Изменения параметров сервера
          v_sql := v_sql + ' or (FN_TYPE=5) ';
        end;
        v_sql := v_sql + ' ) ';
      end else begin
        frmMain.cxCBall.Checked:=True;
        v_sql := v_sql + '';
      end;
    end;
    v_sql := v_sql + 'order by FD_DATE desc';
    frmMain.OraEvents.SQL.Text:=v_sql;
    if YearOf(frmMain.cxdtdtDate1.Date)>1900 then begin
      frmMain.OraEvents.DeclareAndSet('PDATE1', otDate, frmMain.cxdtdtDate1.Date );
    end;
    if YearOf(frmMain.cxdtdtDate2.Date)>1900 then begin
      frmMain.OraEvents.DeclareAndSet('PDATE2', otDate, frmMain.cxdtdtDate2.Date );
    end;
    try
      OraEvents.Open;
    except
      on e:Exception do
      begin
        MnLg_ev(e.Message);
        Exit;
      end;
    end;
  end else if v_isPostgres then begin
    // обновить список событий на дату
    frmMain.UniEvents.Close;
    frmMain.UniEvents.SQL.Clear;
    v_sql := 'select e.*, case e.fn_type '+
     ' when 1 then ''запуск сервера'' '+
     ' when 2 then ''остановка сервера'' '+
     ' when 3 then ''ошибка'' '+
     ' when 4 then ''обработанные события'' '+
     ' when 5 then ''изменения параметров сервера'' '+
     ' else ''не определено'' '+
    'end as typ_name from '+v_pg_schema+'.events e where 1=1 ';
    if YearOf(frmMain.cxdtdtDate1.Date)>1900 then begin
      v_sql := v_sql + ' and fd_date >= :PDATE1 ';
    end;
    if YearOf(frmMain.cxdtdtDate2.Date)>1900 then begin
      v_sql := v_sql + ' and fd_date < :PDATE2 + 1 ';
    end;
    if frmMain.cxCBall.Checked then begin // Все события
      v_sql := v_sql + '';
    end else begin
      if frmMain.cxCBstart.Checked or
         frmMain.cxCBstop.Checked or
         frmMain.cxchckbxerror.Checked or
         frmMain.cxchckbxevents.Checked or
         frmMain.cxchckbxParamEdit.Checked
      then begin
        v_sql := v_sql + ' and ( (1=0) ';
        if frmMain.cxCBstart.Checked then begin // Запуск сервера
          v_sql := v_sql + ' or (fn_type=1) ';
        end;
        if frmMain.cxCBstop.Checked then begin // Остановка сервера
          v_sql := v_sql + ' or (fn_type=2) ';
        end;
        if frmMain.cxchckbxerror.Checked then begin // Ошибки
          v_sql := v_sql + ' or (fn_type=3) ';
        end;
        if frmMain.cxchckbxevents.Checked then begin // Обработанные события
          v_sql := v_sql + ' or (fn_type=4) ';
        end;
        if frmMain.cxchckbxParamEdit.Checked then begin // Изменения параметров сервера
          v_sql := v_sql + ' or (fn_type=5) ';
        end;
        v_sql := v_sql + ' ) ';
      end else begin
        frmMain.cxCBall.Checked:=True;
        v_sql := v_sql + '';
      end;
    end;
    v_sql := v_sql + 'order by fd_date desc';
    frmMain.UniEvents.SQL.Text:=v_sql;
    if YearOf(frmMain.cxdtdtDate1.Date)>1900 then begin
      frmMain.UniEvents.ParamByName('PDATE1').AsDateTime := frmMain.cxdtdtDate1.Date;
    end;
    if YearOf(frmMain.cxdtdtDate2.Date)>1900 then begin
      frmMain.UniEvents.ParamByName('PDATE2').AsDateTime := frmMain.cxdtdtDate2.Date;
    end;
    try
      UniEvents.Open;
    except
        on e:Exception do
          begin
            MnLg_ev(e.Message);
            Exit;
          end;
      end;
  end else begin
    // обновить список событий на дату
    frmMain.pFIBEvents.Close;
    frmMain.pFIBEvents.SQLs.SelectSQL.Clear;
    v_sql := 'select e.*, CASE e.fn_type '+
     ' WHEN 1 THEN ''Запуск сервера'' '+
     ' WHEN 2 THEN ''Остановка сервера'' '+
     ' WHEN 3 THEN ''Ошибка'' '+
     ' WHEN 4 THEN ''Обработанные события'' '+
     ' WHEN 5 THEN ''Изменения параметров сервера'' '+
     ' ELSE ''Не определено'' '+
    'END as TYP_NAME from EVENTS e where 1=1 ';
    if YearOf(frmMain.cxdtdtDate1.Date)>1900 then begin
      v_sql := v_sql + ' and FD_DATE >= :PDATE1 ';
    end;
    if YearOf(frmMain.cxdtdtDate2.Date)>1900 then begin
      v_sql := v_sql + ' and FD_DATE < :PDATE2 + 1 ';
    end;
    if frmMain.cxCBall.Checked then begin // Все события
      v_sql := v_sql + '';
    end else begin
      if frmMain.cxCBstart.Checked or
         frmMain.cxCBstop.Checked or
         frmMain.cxchckbxerror.Checked or
         frmMain.cxchckbxevents.Checked or
         frmMain.cxchckbxParamEdit.Checked
      then begin
        v_sql := v_sql + ' and ( (1=0) ';
        if frmMain.cxCBstart.Checked then begin // Запуск сервера
          v_sql := v_sql + ' or (FN_TYPE=1) ';
        end;
        if frmMain.cxCBstop.Checked then begin // Остановка сервера
          v_sql := v_sql + ' or (FN_TYPE=2) ';
        end;
        if frmMain.cxchckbxerror.Checked then begin // Ошибки
          v_sql := v_sql + ' or (FN_TYPE=3) ';
        end;
        if frmMain.cxchckbxevents.Checked then begin // Обработанные события
          v_sql := v_sql + ' or (FN_TYPE=4) ';
        end;
        if frmMain.cxchckbxParamEdit.Checked then begin // Изменения параметров сервера
          v_sql := v_sql + ' or (FN_TYPE=5) ';
        end;
        v_sql := v_sql + ' ) ';
      end else begin
        frmMain.cxCBall.Checked:=True;
        v_sql := v_sql + '';
      end;
    end;
    v_sql := v_sql + 'order by FD_DATE desc';
    frmMain.pFIBEvents.SQLs.SelectSQL.Text:=v_sql;
    if YearOf(frmMain.cxdtdtDate1.Date)>1900 then begin
      frmMain.pFIBEvents.ParamByName('PDATE1').AsDateTime := frmMain.cxdtdtDate1.Date;
    end;
    if YearOf(frmMain.cxdtdtDate2.Date)>1900 then begin
      frmMain.pFIBEvents.ParamByName('PDATE2').AsDateTime := frmMain.cxdtdtDate2.Date;
    end;
    MyExecDSQuery(frmMain.pFIBEvents);
  end;
  setPos ( OraEvents, frmMain.UniEvents, frmMain.pFIBEvents );
end;

procedure TfrmMain.resend_refresh;
var v_sql : AnsiString;
begin
  getPos ( OraJrnlRsnd, frmMain.UniJrnlRsnd, frmMain.pFIBJrnlRsnd );
  if v_isOracle then begin
    frmMain.OraJrnlRsnd.Session := OraConn;
    frmMain.OraJrnlRsnd.Close;
    v_sql := 'SELECT t.*, CASE t.FN_TYPE '+
         ' WHEN 0 THEN ''Отправлено'' '+
         ' WHEN 1 THEN ''Ошибки'' '+
         ' ELSE ''Не определено'' '+
       ' END as TYP_NAME  FROM EVENTS_RSND t where 1=1 ';
    if YearOf(frmMain.cxDateEdit1.Date)>1900 then
      v_sql := v_sql + ' and FD_DATE >= :PDATE1 and FD_DATE < :PDATE1 + 1 ';
    // дата исследования
    if YearOf(frmMain.cxDtIssl1.Date)>1900 then
      v_sql := v_sql + ' and FD_STUDYDATE >= :FD_STUDYDATE1 ';
    if YearOf(frmMain.cxDtIssl2.Date)>1900 then
      v_sql := v_sql + ' and FD_STUDYDATE < :FD_STUDYDATE2+1 ';
    // ID пациента
    if Trim(frmMain.cxDtPatId.Text)<>'' then
      v_sql := v_sql + ' and FC_PATIENTID = :FC_PATIENTID ';
    // Пациент FC_PATIENTNAME
    if Trim(frmMain.cxPatient.Text)<>'' then
      v_sql := v_sql + ' and FC_PATIENTNAME = :FC_PATIENTNAME ';
    // Модальность FC_MODALITY
    if Trim(frmMain.cxCBMod.Text)<>'' then
      v_sql := v_sql + ' and FC_MODALITY = :FC_MODALITY ';
    // AE получателя FC_CALLEDTITLE
    if Trim(frmMain.cxCalledAE.Text)<>'' then
      v_sql := v_sql + ' and FC_CALLEDTITLE = :FC_CALLEDTITLE ';
    // AE отправителя FC_CALLINGTITLE
    if Trim(frmMain.cxCallingAE.Text)<>'' then
      v_sql := v_sql + ' and FC_CALLINGTITLE = :FC_CALLINGTITLE ';
    // AccessionNumber
    if Trim(frmMain.cxAccessionNumber.Text)<>'' then
      v_sql := v_sql + ' and FC_ACCESSIONNUMBER = :FC_ACCESSIONNUMBER ';
    v_sql := v_sql + 'order by FK_ID desc';
    frmMain.OraJrnlRsnd.SQL.Text:=v_sql;
    if YearOf(frmMain.cxDateEdit1.Date)>1900 then
      frmMain.OraJrnlRsnd.DeclareAndSet( 'PDATE1', otDate, frmMain.cxDateEdit1.Date );
    // дата исследования
    if YearOf(frmMain.cxDtIssl1.Date)>1900 then
      frmMain.OraJrnlRsnd.DeclareAndSet('FD_STUDYDATE1', otDate, frmMain.cxDtIssl1.Date ); 
    if YearOf(frmMain.cxDtIssl2.Date)>1900 then
      frmMain.OraJrnlRsnd.DeclareAndSet('FD_STUDYDATE2', otDate, frmMain.cxDtIssl2.Date); 
    // ID пациента
    if Trim(frmMain.cxDtPatId.Text)<>'' then
      frmMain.OraJrnlRsnd.DeclareAndSet('FC_PATIENTID', otString, frmMain.cxDtPatId.Text);
    // Пациент FC_PATIENTNAME
    if Trim(frmMain.cxPatient.Text)<>'' then
      frmMain.OraJrnlRsnd.DeclareAndSet('FC_PATIENTNAME', otString, frmMain.cxPatient.Text);
    // Модальность FC_MODALITY
    if Trim(frmMain.cxCBMod.Text)<>'' then
      frmMain.OraJrnlRsnd.DeclareAndSet('FC_MODALITY', otString, frmMain.cxCBMod.Text); 
    // AE получателя FC_CALLEDTITLE
    if Trim(frmMain.cxCalledAE.Text)<>'' then
      frmMain.OraJrnlRsnd.DeclareAndSet('FC_CALLEDTITLE', otString, frmMain.cxCalledAE.Text);
    // AE отправителя FC_CALLINGTITLE
    if Trim(frmMain.cxCallingAE.Text)<>'' then
      frmMain.OraJrnlRsnd.DeclareAndSet('FC_CALLINGTITLE', otString, frmMain.cxCallingAE.Text);
    // AccessionNumber
    if Trim(frmMain.cxAccessionNumber.Text)<>'' then
      frmMain.OraJrnlRsnd.DeclareAndSet('FC_ACCESSIONNUMBER', otString, frmMain.cxAccessionNumber.Text); 
    OraJrnlRsnd.Open;
  end else if v_isPostgres then
  begin
    frmMain.UniJrnlRsnd.Close;
    v_sql := 'select t.*, case t.fn_type '+
         ' when 0 then ''отправлено'' '+
         ' when 1 then ''ошибки'' '+
         ' else ''не определено'' '+
       ' end as typ_name  from '+v_pg_schema+'.events_rsnd t where 1=1 ';
    if yearof(frmmain.cxdateedit1.date)>1900 then
      v_sql := v_sql + ' and fd_date >= :pdate1 and fd_date < :pdate1 + 1 ';
    // дата исследования
    if yearof(frmmain.cxdtissl1.date)>1900 then
      v_sql := v_sql + ' and fd_studydate >= :fd_studydate1 ';
    if yearof(frmmain.cxdtissl2.date)>1900 then
      v_sql := v_sql + ' and fd_studydate < :fd_studydate2+1 ';
    // id пациента
    if trim(frmmain.cxdtpatid.text)<>'' then
      v_sql := v_sql + ' and fc_patientid = :fc_patientid ';
    // пациент fc_patientname
    if trim(frmmain.cxpatient.text)<>'' then
      v_sql := v_sql + ' and fc_patientname = :fc_patientname ';
    // модальность fc_modality
    if trim(frmmain.cxcbmod.text)<>'' then
      v_sql := v_sql + ' and fc_modality = :fc_modality ';
    // ae получателя fc_calledtitle
    if trim(frmmain.cxcalledae.text)<>'' then
      v_sql := v_sql + ' and fc_calledtitle = :fc_calledtitle ';
    // ae отправителя fc_callingtitle
    if trim(frmmain.cxcallingae.text)<>'' then
      v_sql := v_sql + ' and fc_callingtitle = :fc_callingtitle ';
    // accessionnumber
    if trim(frmmain.cxaccessionnumber.text)<>'' then
      v_sql := v_sql + ' and fc_accessionnumber = :fc_accessionnumber ';
    v_sql := v_sql + 'order by fk_id desc';
    frmMain.UniJrnlRsnd.SQL.Text:=v_sql;
    if YearOf(frmMain.cxDateEdit1.Date)>1900 then
      frmMain.UniJrnlRsnd.ParamByName('PDATE1').AsDateTime := frmMain.cxDateEdit1.Date;
    // дата исследования
    if YearOf(frmMain.cxDtIssl1.Date)>1900 then
      frmMain.UniJrnlRsnd.ParamByName('FD_STUDYDATE1').AsDateTime := frmMain.cxDtIssl1.Date;
    if YearOf(frmMain.cxDtIssl2.Date)>1900 then
      frmMain.UniJrnlRsnd.ParamByName('FD_STUDYDATE2').AsDateTime := frmMain.cxDtIssl2.Date;
    // ID пациента
    if Trim(frmMain.cxDtPatId.Text)<>'' then
      frmMain.UniJrnlRsnd.ParamByName('FC_PATIENTID').AsString := frmMain.cxDtPatId.Text;
    // Пациент FC_PATIENTNAME
    if Trim(frmMain.cxPatient.Text)<>'' then
      frmMain.UniJrnlRsnd.ParamByName('FC_PATIENTNAME').AsString := frmMain.cxPatient.Text;
    // Модальность FC_MODALITY
    if Trim(frmMain.cxCBMod.Text)<>'' then
      frmMain.UniJrnlRsnd.ParamByName('FC_MODALITY').AsString := frmMain.cxCBMod.Text;
    // AE получателя FC_CALLEDTITLE
    if Trim(frmMain.cxCalledAE.Text)<>'' then
      frmMain.UniJrnlRsnd.ParamByName('FC_CALLEDTITLE').AsString := frmMain.cxCalledAE.Text;
    // AE отправителя FC_CALLINGTITLE
    if Trim(frmMain.cxCallingAE.Text)<>'' then
      frmMain.UniJrnlRsnd.ParamByName('FC_CALLINGTITLE').AsString := frmMain.cxCallingAE.Text;
    // AccessionNumber
    if Trim(frmMain.cxAccessionNumber.Text)<>'' then
      frmMain.UniJrnlRsnd.ParamByName('FC_ACCESSIONNUMBER').AsString := frmMain.cxAccessionNumber.Text;
    UniJrnlRsnd.Open;
  end else begin
    // обновить список событий на дату
    frmMain.pFIBJrnlRsnd.Close;
    frmMain.pFIBJrnlRsnd.SQLs.SelectSQL.Clear;
    v_sql := 'SELECT t.*, CASE t.FN_TYPE '+
         ' WHEN 0 THEN ''Отправлено'' '+
         ' WHEN 1 THEN ''Ошибки'' '+
         ' ELSE ''Не определено'' '+
       ' END as TYP_NAME  FROM EVENTS_RSND t where 1=1 ';
    if YearOf(frmMain.cxDateEdit1.Date)>1900 then
      v_sql := v_sql + ' and FD_DATE >= :PDATE1 and FD_DATE < :PDATE1 + 1 ';
    // дата исследования
    if YearOf(frmMain.cxDtIssl1.Date)>1900 then
      v_sql := v_sql + ' and FD_STUDYDATE >= :FD_STUDYDATE1 ';
    if YearOf(frmMain.cxDtIssl2.Date)>1900 then
      v_sql := v_sql + ' and FD_STUDYDATE < :FD_STUDYDATE2+1 ';
    // ID пациента
    if Trim(frmMain.cxDtPatId.Text)<>'' then
      v_sql := v_sql + ' and FC_PATIENTID = :FC_PATIENTID ';
    // Пациент FC_PATIENTNAME
    if Trim(frmMain.cxPatient.Text)<>'' then
      v_sql := v_sql + ' and FC_PATIENTNAME = :FC_PATIENTNAME ';
    // Модальность FC_MODALITY
    if Trim(frmMain.cxCBMod.Text)<>'' then
      v_sql := v_sql + ' and FC_MODALITY = :FC_MODALITY ';
    // AE получателя FC_CALLEDTITLE
    if Trim(frmMain.cxCalledAE.Text)<>'' then
      v_sql := v_sql + ' and FC_CALLEDTITLE = :FC_CALLEDTITLE ';
    // AE отправителя FC_CALLINGTITLE
    if Trim(frmMain.cxCallingAE.Text)<>'' then
      v_sql := v_sql + ' and FC_CALLINGTITLE = :FC_CALLINGTITLE ';
    // AccessionNumber
    if Trim(frmMain.cxAccessionNumber.Text)<>'' then
      v_sql := v_sql + ' and FC_ACCESSIONNUMBER = :FC_ACCESSIONNUMBER ';
    v_sql := v_sql + 'order by FK_ID desc';
    frmMain.pFIBJrnlRsnd.SQLs.SelectSQL.Text:=v_sql;
    frmMain.pFIBJrnlRsnd.Prepare;
    if YearOf(frmMain.cxDateEdit1.Date)>1900 then
      frmMain.pFIBJrnlRsnd.ParamByName('PDATE1').AsDateTime := frmMain.cxDateEdit1.Date;
    // дата исследования
    if YearOf(frmMain.cxDtIssl1.Date)>1900 then
      frmMain.pFIBJrnlRsnd.ParamByName('FD_STUDYDATE1').AsDateTime := frmMain.cxDtIssl1.Date;
    if YearOf(frmMain.cxDtIssl2.Date)>1900 then
      frmMain.pFIBJrnlRsnd.ParamByName('FD_STUDYDATE2').AsDateTime := frmMain.cxDtIssl2.Date;
    // ID пациента
    if Trim(frmMain.cxDtPatId.Text)<>'' then
      frmMain.pFIBJrnlRsnd.ParamByName('FC_PATIENTID').AsString := frmMain.cxDtPatId.Text;
    // Пациент FC_PATIENTNAME
    if Trim(frmMain.cxPatient.Text)<>'' then
      frmMain.pFIBJrnlRsnd.ParamByName('FC_PATIENTNAME').AsString := frmMain.cxPatient.Text;
    // Модальность FC_MODALITY
    if Trim(frmMain.cxCBMod.Text)<>'' then
      frmMain.pFIBJrnlRsnd.ParamByName('FC_MODALITY').AsString := frmMain.cxCBMod.Text;
    // AE получателя FC_CALLEDTITLE
    if Trim(frmMain.cxCalledAE.Text)<>'' then
      frmMain.pFIBJrnlRsnd.ParamByName('FC_CALLEDTITLE').AsString := frmMain.cxCalledAE.Text;
    // AE отправителя FC_CALLINGTITLE
    if Trim(frmMain.cxCallingAE.Text)<>'' then
      frmMain.pFIBJrnlRsnd.ParamByName('FC_CALLINGTITLE').AsString := frmMain.cxCallingAE.Text;
    // AccessionNumber
    if Trim(frmMain.cxAccessionNumber.Text)<>'' then
      frmMain.pFIBJrnlRsnd.ParamByName('FC_ACCESSIONNUMBER').AsString := frmMain.cxAccessionNumber.Text;
    MyExecDSQuery(frmMain.pFIBJrnlRsnd);
  end;
  setPos ( OraJrnlRsnd, frmMain.UniJrnlRsnd, frmMain.pFIBJrnlRsnd );
end;

procedure TfrmMain.actRebootExecute(Sender: TObject);
begin  // reboot server
  try
    ShowBusy(True);
    Application.ProcessMessages;
    ServiceStop(nil,c_proc_name);
    Application.ProcessMessages;
    sh_service_status;
    Application.ProcessMessages;
    ServiceStart(nil,c_proc_name);
    Application.ProcessMessages;
    sh_service_status;
    Application.ProcessMessages;
    frmMain.LbRbtSrv.Visible:=False;
  finally
    ShowBusy(False);
    Application.ProcessMessages;
  end;
end;

procedure TfrmMain.actRefrDevicesExecute(Sender: TObject);
begin
  p_devices_refr;
end;

procedure TfrmMain.actRefreshLogExecute(Sender: TObject);
begin // refresh log
  events_refresh;
end;

procedure TfrmMain.ActRefrResendExecute(Sender: TObject);
begin
  resend_refresh;
end;

procedure TfrmMain.actStartProcessExecute(Sender: TObject);
begin  // запустить сервис c_proc_name
  try
    ShowBusy(True);
    ServiceStart(nil,c_proc_name);
    sh_service_status;
    frmMain.LbRbtSrv.Visible:=False;
  finally
    ShowBusy(False);
  end;
end;

procedure TfrmMain.actStopProcessExecute(Sender: TObject);
begin  // остановить сервис c_proc_name
  try
    ShowBusy(True);
    ServiceStop(nil,c_proc_name);
    sh_service_status;
    frmMain.LbRbtSrv.Visible:=False;
  finally
    ShowBusy(False);
  end;
end;

procedure TfrmMain.aDelRulExecute(Sender: TObject);
var FIBQuery : TpFIBQuery; v_UniQr : TUniQuery; v_OraQr : TOracleQuery;
begin
  if tvRules.DataController.Controller.SelectedRecordCount = 1 then
    begin
      if Application.MessageBox('Вы действительно хотите удалить выбранное правило пересылки?',
                                'Вопрос', MB_YESNO + MB_ICONQUESTION) = IdYes then
        begin
          if v_isOracle then begin
            v_OraQr := TOracleQuery.Create(nil);
            try
              v_OraQr.Session:=DB_CMN.OraConn;
              v_OraQr.SQL.Text :=
                    'delete from RULES where FK_ID=:pFK_ID';
              v_OraQr.DeclareAndSet( 'pFK_ID', otString, OraRules.FieldByName('fk_id').AsString );
              try
                v_OraQr.Execute;
              except
                on e:Exception do
                  MessageDlg(e.Message, mtError, [mbOK], 0);
              end;
            finally
              v_OraQr.Free;
            end;
          end else if v_isPostgres then
          begin
            v_UniQr := TUniQuery.Create(nil);
            try
              v_UniQr.Connection:=DB_CMN.PGconn;
              v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
              v_UniQr.SQL.Text :=
                    'delete from '+v_pg_schema+'.rules where fk_id=:pfk_id';
              v_UniQr.ParamByName('pFK_ID').AsString := UniRules.FieldByName('fk_id').AsString;
              try
              //  v_UniQr.Transaction.StartTransaction;
                v_UniQr.ExecSQL;
              //  if v_UniQr.Transaction.Active then
              //    v_UniQr.Transaction.Commit;
              except
                on e:Exception do
                  MessageDlg(e.Message, mtError, [mbOK], 0);
              end;
            finally
              v_UniQr.Free;
            end;
          end else begin
            Cmn_Commit(DB_CMN.trWrite);
            FIBQuery := TpFIBQuery.Create(nil);
            FIBQuery.Database := DB_CMN.DB;
            FIBQuery.Transaction := DB_CMN.trWrite;
            FibQuery.Options := FibQuery.Options + [qoAutoCommit];
            FIBQuery.SQL.Text := 'delete from RULES where FK_ID=:pFK_ID';
            FIBQuery.ParamByName('pFK_ID').AsInteger := pFIBRules.FieldByName('fk_id').AsInteger;
            try
              MyExecQuery(FIBQuery);
            finally
              FIBQuery.Close;
              FreeAndNil(FIBQuery);
            end;
            Cmn_Commit(DB_CMN.trWrite); // обновить список устройств на форме
          end;
          aRefRulExecute(nil);
        end;
    end;
end;

procedure TfrmMain.aDoRsndExecute(Sender: TObject);
var dsSel: TpFIBDataSet;
    v_UniQr : TUniQuery;
    v_OraDS : TOracleDataSet;
    v_id_str : string;
    v_sql, v_curDir, v_filename : ansistring;
    i, v_sel_amm, v_id, RecIdx, ColIdx,
    v_TransferSyntax, v_amm, j : integer;
    y, m, d : Word;
    v_CnsDMTable_tmp : TDicomDataset;
    CnsDicomConnection1 : TCnsDicomConnection;
  function MyCalcAmmRec (p_id:variant):integer;
  var dsSel: TpFIBDataSet; v_UniQr : TUniQuery; v_OraQr : TOracleQuery;
      v_amm:integer;
  begin
    v_amm:=0;
    if v_isOracle then begin    // ORACLE
      v_OraQr := TOracleQuery.Create(nil);
      try
        v_OraQr.Session := DB_CMN.OraConn;
        v_OraQr.SQL.Text :=
              'SELECT COUNT(*) AS FN_AMM '+
          '  FROM EVENTS_RSND T, EVENTS_RSND_ERR_LST E, '+
                    'DEVICES D, IMAGES I, STUDIES S '+
          'WHERE T.FK_ID=E.FK_ID_RSND AND D.FC_TITLE=T.FC_CALLEDTITLE '+
          '  AND S.STUDYUID=I.STUDYUID AND T.FK_ID=:FK_ID '+
          '  AND E.FC_INSTANCEUID=I.INSTANCEUID AND T.FN_TYPE=1 '+ // ТОЛЬКО ЕСЛИ ОШИБКА В СТРОКЕ
          '  AND E.FC_CALLEDTITLE=T.FC_CALLEDTITLE ';
        v_OraQr.DeclareAndSet('FK_ID', otInteger, p_id);
        try
          v_OraQr.Execute;
          if not v_OraQr.Eof then
            v_amm:=v_OraQr.FieldAsInteger('fn_amm')
          else
            v_amm:=0;
        except
          on e:Exception do
            MessageDlg(e.Message, mtError, [mbOK], 0);
        end;
      finally
        v_OraQr.Free;
      end;
    end else if v_isPostgres then begin  // POSTGRES
      v_UniQr := TUniQuery.Create(nil);
      try
        v_UniQr.Connection:=DB_CMN.PGconn;
        v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
        v_UniQr.SQL.Text :=
              'select count(*) as fn_amm '+
          '  from '+v_pg_schema+'.events_rsnd t, '+v_pg_schema+'.events_rsnd_err_lst e, '+
                    v_pg_schema+'.devices d, '+v_pg_schema+'.images i, '+v_pg_schema+'.studies s '+
          'where t.fk_id=e.fk_id_rsnd and d.fc_title=t.fc_calledtitle '+
          '  and s.studyuid=i.studyuid and t.fk_id=:fk_id '+
          '  and e.fc_instanceuid=i.instanceuid and t.fn_type=1 '+ // только если ошибка в строке
          '  and e.fc_calledtitle=t.fc_calledtitle ';
        v_UniQr.ParamByName('FK_ID').Value := p_id;
        try
          v_UniQr.ExecSQL;
          if not dsSel.Eof then
            v_amm:=dsSel.FieldByName('fn_amm').AsInteger
          else
            v_amm:=0;
        except
          on e:Exception do
            MessageDlg(e.Message, mtError, [mbOK], 0);
        end;
      finally
        v_UniQr.Free;
      end;
    end else begin
      dsSel := TpFIBDataSet.Create(nil);
      try
        dsSel.Database := DB_CMN.LOGDB;
        dsSel.Transaction := DB_CMN.LOGtrRead;
        dsSel.SQLs.SelectSQL.Clear;
        v_sql := 'SELECT COUNT(*) AS FN_AMM '+
          '  FROM EVENTS_RSND T, EVENTS_RSND_ERR_LST E, DEVICES D, IMAGES I, STUDIES S '+
          'WHERE T.FK_ID=E.FK_ID_RSND AND D.FC_TITLE=T.FC_CALLEDTITLE '+
          '  AND S.STUDYUID=I.STUDYUID AND T.FK_ID=:FK_ID '+
          '  AND E.FC_INSTANCEUID=I.INSTANCEUID AND T.FN_TYPE=1 '+ // ТОЛЬКО ЕСЛИ ОШИБКА В СТРОКЕ
          '  AND E.FC_CALLEDTITLE=T.FC_CALLEDTITLE';
        dsSel.SQLs.SelectSQL.Add(v_sql);
        dsSel.ParamByName('fk_id').Value := p_id;
        dsSel.Open;
        if not dsSel.Eof then
          v_amm:=dsSel.FieldByName('fn_amm').AsInteger
        else
          v_amm:=0;
      finally
        dsSel.Close;
        FreeAndNil(dsSel);
      end;
    end;
    Result:=v_amm;
  end;
  procedure prc_end_funcs( p_id:Integer; p_instanceuid:string ); // v_id dsSel.FieldByName('instanceuid').AsString
  var v_Qr : TpFIBQuery; v_UniQr : TUniQuery; v_OraQr : TOracleQuery;
  begin
    if v_isOracle then begin    // ORACLE
      v_OraQr := TOracleQuery.Create(nil);
      try
        v_OraQr.Session := DB_CMN.OraConn;
        v_OraQr.SQL.Text := 'delete from EVENTS_RSND_ERR_LST where FK_ID_RSND=:p_FK_ID_RSND '+
            ' and FC_INSTANCEUID=:p_FC_INSTANCEUID';
        v_OraQr.DeclareAndSet( 'p_FK_ID_RSND', otInteger, p_id );
        v_OraQr.DeclareAndSet( 'p_FC_INSTANCEUID', otString , p_instanceuid );
        try
          v_OraQr.Execute;
        except
          on e:Exception do
          begin
            MnLg_ev(e.Message);
            Exit;
          end;
        end;
      finally
        v_OraQr.Free;
      end;
      v_OraQr := TOracleQuery.Create(nil);
      try
        v_OraQr.Session := DB_CMN.OraConn;
        v_OraQr.SQL.Text := 'Update EVENTS_RSND set FN_AMM_ERR=FN_AMM_ERR-1 '+
            ' where FK_ID=:p_FK_ID';
        v_OraQr.DeclareAndSet('p_FK_ID', otInteger , p_id );
        try
          v_OraQr.Execute;
        except
          on e:Exception do
          begin
            MnLg_ev(e.Message);
            Exit;
          end;
        end;
      finally
        v_OraQr.Free;
      end;
      v_OraQr := TOracleQuery.Create(nil);
      try
        v_OraQr.Session := DB_CMN.OraConn;
        v_OraQr.SQL.Text := 'Update EVENTS_RSND set FN_TYPE = '+
            ' case FN_AMM_ERR when 0 then 0 '+
            ' else 1 end '+
            ' where FK_ID=:p_FK_ID';
        v_OraQr.DeclareAndSet('p_FK_ID', otInteger , p_id );
        try
          v_OraQr.Execute;
        except
          on e:Exception do
          begin
            MnLg_ev(e.Message);
            Exit;
          end;
        end;
      finally
        v_OraQr.Free;
      end;
    end else if v_isPostgres then begin
      v_UniQr := TUniQuery.Create(nil);
      try
        v_UniQr.Connection:=DB_CMN.PGconn;
        v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
        v_UniQr.SQL.Text := 'delete from '+v_pg_schema+'.events_rsnd_err_lst where fk_id_rsnd=:p_fk_id_rsnd '+
            ' and fc_instanceuid=:p_fc_instanceuid';
        v_UniQr.ParamByName('p_FK_ID_RSND').AsInteger := p_id;
        v_UniQr.ParamByName('p_FC_INSTANCEUID').AsString := p_instanceuid;
        try
        //  v_UniQr.Transaction.StartTransaction;
          v_UniQr.ExecSQL;
        //  if v_UniQr.Transaction.Active then
        //    v_UniQr.Transaction.Commit;
        except
          on e:Exception do
          begin
            MnLg_ev(e.Message);
            Exit;
          end;
        end;
      finally
        v_UniQr.Free;
      end;
      v_UniQr := TUniQuery.Create(nil);
      try
        v_UniQr.Connection:=DB_CMN.PGconn;
        v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
        v_UniQr.SQL.Text := 'Update '+v_pg_Schema+'.events_rsnd set fn_amm_err=fn_amm_err-1 '+
            ' where fk_id=:p_fk_id';
        v_UniQr.ParamByName('p_FK_ID').AsInteger := p_id;
        try
        //  v_UniQr.Transaction.StartTransaction;
          v_UniQr.ExecSQL;
        //  if v_UniQr.Transaction.Active then
        //    v_UniQr.Transaction.Commit;
        except
          on e:Exception do
          begin
            MnLg_ev(e.Message);
            Exit;
          end;
        end;
      finally
        v_UniQr.Free;
      end;
      v_UniQr := TUniQuery.Create(nil);
      try
        v_UniQr.Connection:=DB_CMN.PGconn;
        v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
        v_UniQr.SQL.Text := 'Update '+v_pg_Schema+'.events_rsnd set fn_type = '+
            ' case fn_amm_err when 0 then 0 '+
            ' else 1 end '+
            ' where fk_id=:p_fk_id';
        v_UniQr.ParamByName('p_FK_ID').AsInteger := p_id;
        try
        //  v_UniQr.Transaction.StartTransaction;
          v_UniQr.ExecSQL;
        //  if v_UniQr.Transaction.Active then
        //    v_UniQr.Transaction.Commit;
        except
          on e:Exception do
          begin
            MnLg_ev(e.Message);
            Exit;
          end;
        end;
      finally
        v_UniQr.Free;
      end;
    end else begin
      v_Qr := TpFIBQuery.Create(nil);
      try
        v_Qr.Database := DB_CMN.LOGDB;
        if DB_CMN.LOGtrWrite.Active = False then
          DB_CMN.LOGtrWrite.StartTransaction;
        v_Qr.Transaction := DB_CMN.LOGtrWrite;
        v_Qr.Options := v_Qr.Options + [qoAutoCommit];
        v_Qr.SQL.Text :=  // удалим запись из списка снимков которые не были отправлены
          'delete from EVENTS_RSND_ERR_LST where FK_ID_RSND=:p_FK_ID_RSND '+
            ' and FC_INSTANCEUID=:p_FC_INSTANCEUID';
        v_Qr.ParamByName('p_FK_ID_RSND').AsInteger := p_id;
        v_Qr.ParamByName('p_FC_INSTANCEUID').AsString := p_instanceuid;
        v_Qr.ExecQuery;
      finally
        v_Qr.Free;
      end;
      v_Qr := TpFIBQuery.Create(nil);
      try
        v_Qr.Database := DB_CMN.LOGDB;
        if DB_CMN.LOGtrWrite.Active = False then
          DB_CMN.LOGtrWrite.StartTransaction;
        v_Qr.Transaction := DB_CMN.LOGtrWrite;
        v_Qr.Options := v_Qr.Options + [qoAutoCommit];
        v_Qr.SQL.Text :=  // уменьшим кол-во ошибок на 1
          'Update EVENTS_RSND set FN_AMM_ERR=FN_AMM_ERR-1 '+
            ' where FK_ID=:p_FK_ID';
        v_Qr.ParamByName('p_FK_ID').AsInteger := p_id;
        v_Qr.ExecQuery;
      finally
        v_Qr.Free;
      end;
      v_Qr := TpFIBQuery.Create(nil);
      try
        v_Qr.Database := DB_CMN.LOGDB;
        if DB_CMN.LOGtrWrite.Active = False then
          DB_CMN.LOGtrWrite.StartTransaction;
        v_Qr.Transaction := DB_CMN.LOGtrWrite;
        v_Qr.Options := v_Qr.Options + [qoAutoCommit];
        v_Qr.SQL.Text := // если ошибок нет - изменим статус записи на успешная отправка
        // дату не меняем
          'Update EVENTS_RSND set FN_TYPE = '+
            ' case FN_AMM_ERR when 0 then 0 '+
            ' else 1 end '+
            ' where FK_ID=:p_FK_ID';
        v_Qr.ParamByName('p_FK_ID').AsInteger := p_id;
        v_Qr.ExecQuery;
      finally
        v_Qr.Free;
      end;
    end;
  end;
  procedure MyGoGo(p_DS:TDataSet);
  begin
    p_DS.Open;
    j:=0;
    While not p_DS.Eof do
    begin
      if CmnUnit.v_exit_progressbar=1 then break; // выход из цикла по кнопке в форме ползунка
      Inc(j);
      FrmProgressBar.MyIncPos('Отправка снимка ' +
        inttostr(j)+'/'+inttostr(v_amm));
      // найдем файл снимка
      DecodeDate(p_DS.FieldByName('ldate').AsDateTime, y, m, d);
      // ставим палку в конец строки если ее нет
      if Copy(v_1_3_STORAGE_FOLDER,Length(v_1_3_STORAGE_FOLDER),1)='\' then
        v_filename := v_1_3_STORAGE_FOLDER
      else
        v_filename := v_1_3_STORAGE_FOLDER+'\';
      // имя файла берем как он сохраняется в паск сервере при приемке
      v_filename:=v_filename+p_DS.FieldByName('imagetype').AsString+'\'+
                  IntToStr(y)+'\'+IntToStr(m)+'\'+IntToStr(d)+'\'+
                  p_DS.FieldByName('studyuid').AsString+'\'+
                  p_DS.FieldByName('seriesuid').AsString+'\'+
                  p_DS.FieldByName('instanceuid').AsString+ '.dcm';
      if FileExists(v_filename) then
      begin // нашли файл снимка
        v_CnsDMTable_tmp := TDicomDataset.Create;
        try  // загрузим снимок из файла в датасет
          v_CnsDMTable_tmp.LoadFromFile(v_filename);
          v_TransferSyntax:=p_DS.FieldByName('FN_TRANSFERSYNTAX').AsInteger;  // из запроса
          CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
          CnsDicomConnection1.MySetTransferSyntax(v_TransferSyntax);
          CnsDicomConnection1.Host := p_DS.FieldByName('fc_ip').AsString;
          CnsDicomConnection1.Port := p_DS.FieldByName('fn_port').AsInteger;
          CnsDicomConnection1.CalledTitle := p_DS.FieldByName('fc_calledtitle').AsString;
          CnsDicomConnection1.CallingTitle := v_1_5_AE_TITLE;
          CnsDicomConnection1.ReceiveTimeout := c_Timeout;
          DCM_Connection.PDUTempPath:=GetTempDirectory;
          try // повторная отправка снимка
            If CnsDicomConnection1.C_STORAGE( v_CnsDMTable_tmp.Attributes ) then
            begin  // SUCCESS
              prc_end_funcs( v_id, p_DS.FieldByName('instanceuid').AsString );
            end else
            begin  // ERROR - ничего не пишем (возможно будем писать текст ошибки)
            end;
          finally
            MyDisconnectAssociation(CnsDicomConnection1);
            CnsDicomConnection1.Free;
          end;
        finally
          v_CnsDMTable_tmp.Free; // освободим временный dataset со снимком
        end;
      end;
      p_DS.Next;
    end;
  end;
begin // повторить пересылку  !!! сделать копирование в базу логов
  try
    Screen.Cursor := crHourGlass;
    v_curDir:=GetCurrentDir;     // запомним текущий каталог т.к. будем ходить по каталогам со снимками
    // проверим что список не пустой
    if (tvListRsnd.DataController.RecordCount>0) then
    begin
      Application.CreateForm(TFrmProgressBar, FrmProgressBar);  // ползунок создали
      try
        v_sel_amm:=tvListRsnd.Controller.SelectedRecordCount;   // кол-во отмеченных записей
        //
        CmnUnit.v_exit_progressbar:=0;                          // признак выхода из цикла
        // инициализируем ползунок - чтобы что-то показать
        FrmProgressBar.clc_pos( False, // is_on_top
                    'Повторная отправка исследований',
                    v_sel_amm,    // обязательно указать кол-во
                    (v_sel_amm=1)
                  );
        FrmProgressBar.clc_posMain( 1, // 0-не отображать ползунок
                        'Отправка снимка',
                        (v_sel_amm=1)
                      );
        // инициализация переменных для ползунка
        MyIniMove;
        //
        for I := 0 to v_sel_amm - 1 do     // цикл по отмеченным
        begin
          if CmnUnit.v_exit_progressbar=1 then break;  // выход по кнопке в форме ползунка
          // запись в цикле
          RecIdx := tvListRsnd.Controller.SelectedRecords[i].RecordIndex;
          // столбец с id
          ColIdx := tvListRsnd.DataController.GetItemByFieldName('FK_ID').Index;
          // значение id
          v_id_str := Trim(VarToStr(tvListRsnd.DataController.Values[RecIdx, ColIdx]));
          if v_id_str='' then
            v_id:=0
          else
            v_id := StrToInt(v_id_str);
          // определим кол-во
          v_amm:=MyCalcAmmRec(v_id);
          // установим найденное кол-во в ползунок - обязательно, т.к. нужно кол-во записей
          FrmProgressBar.MyIncPosMain(
             ' Отправка исследований '+inttostr(i+1)+'/'+inttostr(v_sel_amm));
          // инициализация второго ползунка
          FrmProgressBar.clc_posMain( v_amm, // 0-не отображать ползунок
                            'Отправка снимка',
                            (v_sel_amm=1)
                          );
          if v_amm>0 then // если кол-во больше 0
          begin
            if v_isOracle then begin
              v_OraDS := TOracleDataSet.Create(nil);
              try
                v_OraDS.Session := DB_CMN.OraConn;
                v_OraDS.SQL.Text := 'SELECT T.FC_CALLEDTITLE, D.FC_IP, D.FN_PORT, I.STUDYUID, I.INSTANCEUID,  '+
                  '          S.LDATE, I.IMAGETYPE, S.STUDYID, I.SERIESUID, E.FN_TRANSFERSYNTAX '+
                  '     FROM EVENTS_RSND T, EVENTS_RSND_ERR_LST E, '+
                  '          DEVICES D, IMAGES I, STUDIES S '+
                  '   WHERE T.FK_ID=E.FK_ID_RSND AND D.FC_TITLE=T.FC_CALLEDTITLE '+
                  '     AND S.STUDYUID=I.STUDYUID AND T.FK_ID=:fk_id '+
                  '     AND E.FC_INSTANCEUID=I.INSTANCEUID AND T.FN_TYPE=1  '+  // только если ошибка в строке
                  '     AND E.FC_CALLEDTITLE=T.FC_CALLEDTITLE ';
                v_OraDS.DeclareAndSet( 'fk_id', otInteger, v_id );
                MyGoGo(v_OraDS);
              finally
                v_OraDS.Free;
              end;
            end else if v_isPostgres then begin
              v_UniQr := TUniQuery.Create(nil);
              try
                v_UniQr.Connection:=DB_CMN.PGconn;
                v_UniQr.Transaction:=DB_CMN.MnUniTransaction;
                v_UniQr.SQL.Text := 'select t.fc_calledtitle, d.fc_ip, d.fn_port, i.studyuid, i.instanceuid,  '+
                  '          s.ldate, i.imagetype, s.studyid, i.seriesuid, e.fn_transfersyntax '+
                  '     from '+v_pg_schema+'.events_rsnd t, '+v_pg_schema+'.events_rsnd_err_lst e, '+
                  '          '+v_pg_schema+'.devices d, '+v_pg_schema+'.images i, '+v_pg_schema+'.studies s '+
                  '   where t.fk_id=e.fk_id_rsnd and d.fc_title=t.fc_calledtitle '+
                  '     and s.studyuid=i.studyuid and t.fk_id=:fk_id '+
                  '     and e.fc_instanceuid=i.instanceuid and t.fn_type=1  '+  // только если ошибка в строке
                  '     and e.fc_calledtitle=t.fc_calledtitle ';
                v_UniQr.ParamByName('fk_id').Value := v_id;
                MyGoGo(v_UniQr);
              finally
                v_UniQr.Free;
              end;
            end else begin
              dxMemData1.Open;
              dxMemData1.First;
              while not dxMemData1.Eof do begin dxMemData1.Delete; dxMemData1.Next; end;
              dxMemData1.Close; dxMemData1.Open;
              dsSel := TpFIBDataSet.Create(nil);
              try
                dsSel.Database := DB_CMN.LOGDB;
                dsSel.Transaction := DB_CMN.LOGtrRead;
                dsSel.SQLs.SelectSQL.Clear;
                v_sql:= // цикл по снимкам по выбранной записи в журнале пересылок
                  'SELECT t.fc_calledtitle, e.FN_TRANSFERSYNTAX , e.instanceuid '+
                  '  FROM EVENTS_RSND t, EVENTS_RSND_ERR_LST e '+
                  'where t.fk_id=e.fk_id_rsnd and t.fk_id=:fk_id and t.FN_TYPE=1 '+  // только если ошибка в строке
                  '  and e.FC_CALLEDTITLE=t.FC_CALLEDTITLE '; 
                dsSel.SQLs.SelectSQL.Add(v_sql);
                dsSel.ParamByName('fk_id').Value := v_id;
                dsSel.Open; dsSel.First;
                while not dsSel.Eof do
                begin
                  dxMemData1.Append;
                  dxMemData1.FieldByName('fc_calledtitle').AsString := dsSel.FieldByName('fc_calledtitle').AsString ;
                  dxMemData1.FieldByName('FN_TRANSFERSYNTAX').AsInteger := dsSel.FieldByName('FN_TRANSFERSYNTAX').AsInteger;
                  dxMemData1.FieldByName('instanceuid').AsString := dsSel.FieldByName('instanceuid').AsString;
                  dxMemData1.Post;
                  dsSel.Next;
                end;
              finally
                dsSel.Close;
                FreeAndNil(dsSel);
              end;
              dxMemData1.First;
              while not dxMemData1.Eof do begin
                dsSel := TpFIBDataSet.Create(nil);
                try
                  dsSel.Database := DB_CMN.LOGDB;
                  dsSel.Transaction := DB_CMN.LOGtrRead;
                  dsSel.SQLs.SelectSQL.Clear;
                  v_sql:= // цикл по снимкам по выбранной записи в журнале пересылок
                    'SELECT d.fc_ip, d.fn_port, i.studyuid, i.instanceuid, '+
                    '       s.ldate, i.imagetype, s.studyid, i.seriesuid '+
                    '  FROM devices d, images i, studies s '+
                    'where d.fc_title=:fc_title '+
                    '  and s.studyuid=i.studyuid '+
                    '  and i.instanceuid=:instanceuid '+ // только если ошибка в строке
                    '  and e.FC_CALLEDTITLE=:FC_CALLEDTITLE';
                  dsSel.SQLs.SelectSQL.Add(v_sql);
                  dsSel.ParamByName('fc_title').Value := dsSel.FieldByName('fc_calledtitle').AsString;
                  dsSel.ParamByName('instanceuid').Value := dsSel.FieldByName('instanceuid').AsString;
                  dsSel.Open; dsSel.First;
                  if not dsSel.Eof then
                  begin
                    dxMemData1.Edit;
                    dxMemData1.FieldByName('fc_ip').AsString := dsSel.FieldByName('fc_ip').AsString;
                    dxMemData1.FieldByName('studyuid').AsString := dsSel.FieldByName('fc_ip').AsString;
                    dxMemData1.FieldByName('ldate').AsString := dsSel.FieldByName('fc_ip').AsString;
                    dxMemData1.FieldByName('fn_port').AsInteger := dsSel.FieldByName('fn_port').AsInteger;
                    dxMemData1.FieldByName('imagetype').AsString := dsSel.FieldByName('fc_ip').AsString;
                    dxMemData1.FieldByName('studyid').AsString := dsSel.FieldByName('fc_ip').AsString;
                    dxMemData1.FieldByName('seriesuid').AsString := dsSel.FieldByName('fc_ip').AsString;
                    dxMemData1.Post;
                  end;
                finally
                  dsSel.Close;
                  FreeAndNil(dsSel);
                end;
                dxMemData1.Next;
              end;
              MyGoGo(dxMemData1);
              //
            {  dsSel := TpFIBDataSet.Create(nil);
              try
                dsSel.Database := DB_CMN.LOGDB;
                dsSel.Transaction := DB_CMN.LOGtrRead;
                dsSel.SQLs.SelectSQL.Clear;
                v_sql:= // цикл по снимкам по выбранной записи в журнале пересылок
                  'SELECT t.fc_calledtitle, d.fc_ip, d.fn_port, i.studyuid, i.instanceuid, '+
                  '       s.ldate, i.imagetype, s.studyid, i.seriesuid, e.FN_TRANSFERSYNTAX '+
                  '  FROM EVENTS_RSND t, EVENTS_RSND_ERR_LST e, devices d, images i, studies s '+
                  'where t.fk_id=e.fk_id_rsnd and d.fc_title=t.fc_calledtitle '+
                  '  and s.studyuid=i.studyuid and t.fk_id=:fk_id '+
                  '  and e.fc_instanceuid=i.instanceuid and t.FN_TYPE=1'+ // только если ошибка в строке
                  '  and e.FC_CALLEDTITLE=t.FC_CALLEDTITLE';
                dsSel.SQLs.SelectSQL.Add(v_sql);
                dsSel.ParamByName('fk_id').Value := v_id;
                MyGoGo(dsSel);
              finally
                dsSel.Close;
                FreeAndNil(dsSel);
              end; }
              dxMemData1.Close;
            end;
          end;
        end;
      finally
        chk_close; // закроем ползунок
      end;
    end;
  finally
    SetCurrentDir(v_curDir);
    Screen.Cursor := crDefault;
  end;
  resend_refresh;
end;

procedure TfrmMain.aExcel1Execute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    ExportGridToExcel(sdPopUp.FileName, cxgrdDevices, TRUE, (cxDV.DataController.Controller.SelectedRecordCount <= 1) );

end;

procedure TfrmMain.aExcelExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    ExportGridToExcel(sdPopUp.FileName, GrTVList, TRUE, (TVList.DataController.Controller.SelectedRecordCount <= 1) );
end;

procedure TfrmMain.aExcelRsndExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    ExportGridToExcel(sdPopUp.FileName, grRsnd, TRUE, (tvListRsnd.DataController.Controller.SelectedRecordCount <= 1) );
end;

procedure TfrmMain.aExcelRulExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    ExportGridToExcel(sdPopUp.FileName, grRules, True, (tvRules.DataController.Controller.SelectedRecordCount <= 1) );
end;

procedure TfrmMain.aListClr1Execute(Sender: TObject);
begin
  cxDV.RestoreFromRegistry(c_reg_lst_mn+c_devices_def_rg, FALSE, FALSE, [], 'cxDV');
end;

procedure TfrmMain.aListClrExecute(Sender: TObject);
begin
  TVList.RestoreFromRegistry(c_reg_lst_mn+c_events_def_rg, FALSE, FALSE, [], 'TVList');
end;

procedure TfrmMain.aPrintLogExecute(Sender: TObject);
begin // печать списка событий
  getPos ( OraEvents, frmMain.UniEvents, frmMain.pFIBEvents );
  frxDBEvents.FieldAliases.Clear;
  if v_isOracle then begin
    frxDBEvents.DataSet := OraEvents;
  end else if v_isPostgres then begin
    frxDBEvents.DataSet := UniEvents;
  end else begin
    frxDBEvents.DataSet := pFIBEvents;
  end;
  frxRptEvents.ShowReport;
  setPos ( OraEvents, frmMain.UniEvents, frmMain.pFIBEvents );
end;

procedure TfrmMain.aPrintDevExecute(Sender: TObject);
begin // печать списка устройств
  getPos ( OraDevices, frmMain.UniDevices, frmMain.pFIBDevices );
  frxDBDevices.FieldAliases.Clear;
  if v_isOracle then begin
    frxDBDevices.DataSet := OraDevices;
  end else if v_isPostgres then begin
    frxDBDevices.DataSet := UniDevices;
  end else begin
    frxDBDevices.DataSet := pFIBDevices;
  end;
  frxRptDevices.ShowReport;
  setPos ( OraDevices, frmMain.UniDevices, frmMain.pFIBDevices );
end;

procedure TfrmMain.aPrintRsndExecute(Sender: TObject);
begin // печать журнала пересылки
  getPos ( OraJrnlRsnd, frmMain.UniJrnlRsnd, frmMain.pFIBJrnlRsnd );
  frxDBRsnd.FieldAliases.Clear;
  if v_isOracle then begin
    frxDBRsnd.DataSet := OraJrnlRsnd;
  end else if v_isPostgres then begin
    frxDBRsnd.DataSet := UniJrnlRsnd;
  end else begin
    frxDBRsnd.DataSet := pFIBJrnlRsnd;
  end;
  frxRptRsnd.ShowReport;
  setPos ( OraJrnlRsnd, frmMain.UniJrnlRsnd, frmMain.pFIBJrnlRsnd );
end;

procedure TfrmMain.aPrintRulExecute(Sender: TObject);
begin // печать списка правил
  getPos ( OraRules, frmMain.UniRules, frmMain.pFIBRules );
  frxDBRules.FieldAliases.Clear;
  if v_isOracle then begin
    frxDBRules.DataSet := OraRules;
  end else if v_isPostgres then begin
    frxDBRules.DataSet := UniRules;
  end else begin
    frxDBRules.DataSet := pFIBRules;
  end;
  frxRptRules.ShowReport;
  setPos ( OraRules, frmMain.UniRules, frmMain.pFIBRules );
end;

procedure TfrmMain.aRefRulExecute(Sender: TObject);
begin
  rules_refresh;
end;

procedure TfrmMain.aText1Execute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    ExportGridToText(sdPopUp.FileName, cxgrdDevices, TRUE, (cxDV.DataController.Controller.SelectedRecordCount<= 1));
end;

procedure TfrmMain.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    ExportGridToText(sdPopUp.FileName, GrTVList, TRUE, (TVList.DataController.Controller.SelectedRecordCount<= 1) );
end;

procedure TfrmMain.aTextRsndExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    ExportGridToText(sdPopUp.FileName, grRsnd, TRUE, (tvListRsnd.DataController.Controller.SelectedRecordCount<= 1) );
end;

procedure TfrmMain.aTextRulExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    ExportGridToText(sdPopUp.FileName, grRules, TRUE, (tvRules.DataController.Controller.SelectedRecordCount<= 1) );
end;

procedure TfrmMain.aWeb1Execute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    ExportGridToHTML(sdPopUp.FileName, cxgrdDevices, TRUE, (cxDV.DataController.Controller.SelectedRecordCount <= 1) );
end;

procedure TfrmMain.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    ExportGridToHTML(sdPopUp.FileName, GrTVList, TRUE, (TVList.DataController.Controller.SelectedRecordCount <= 1));
end;

procedure TfrmMain.aWebRsndExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    ExportGridToHTML(sdPopUp.FileName, grRsnd, TRUE, (tvListRsnd.DataController.Controller.SelectedRecordCount <= 1));
end;

procedure TfrmMain.aWebRulExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    ExportGridToHTML(sdPopUp.FileName, grRules, TRUE, (tvRules.DataController.Controller.SelectedRecordCount <= 1));
end;

procedure TfrmMain.aXML1Execute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    ExportGridToXML(sdPopUp.FileName, cxgrdDevices, TRUE, (cxDV.DataController.Controller.SelectedRecordCount <= 1));

end;

procedure TfrmMain.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    ExportGridToXML(sdPopUp.FileName, GrTVList, TRUE, (TVList.DataController.Controller.SelectedRecordCount <= 1));
end;

procedure TfrmMain.aXMLRsndExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    ExportGridToXML(sdPopUp.FileName, grRsnd, TRUE, (tvListRsnd.DataController.Controller.SelectedRecordCount <= 1));
end;

procedure TfrmMain.aXMLRulExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    ExportGridToXML(sdPopUp.FileName, grRules, TRUE, (tvRules.DataController.Controller.SelectedRecordCount <= 1));
end;

procedure TfrmMain.bTestClick(Sender: TObject);
begin
  if f_C_ECHO(teIPWORKLIST.Text, tePortWORKLIST.Text, teAEWORKLIST.Text, LocAE) then
    MessageDlg('Устройство отвечает на запросы', mtInformation, [mbOK], 0)
  else
    MessageDlg('Устройство не отвечает на запросы', mtError, [mbOK], 0);
end;

procedure TfrmMain.btn1Click(Sender: TObject);
begin
  dlglocimg.Directory:=cxtxtCtlgAutoLoad.Text;
  if dlglocimg.Execute then
  begin
    if (cxtxtCtlgAutoLoad.Text <> dlglocimg.Directory) then
    begin
      SetSavBtnCol(True);
      cxtxtCtlgAutoLoad.Text := dlglocimg.Directory;
    end;
  end;
end;

procedure TfrmMain.btnConnectWLClick(Sender: TObject);
begin  // запустить сервис c_proc_name
  try
    ShowBusy(True);
    ServiceStart(nil,c_proc_WLname);
    sh_service_status;
  finally
    ShowBusy(False);
  end;
end;

procedure TfrmMain.btnDisconnectWLClick(Sender: TObject);
begin  // остановить сервис c_proc_name
  try
    ShowBusy(True);
    ServiceStop(nil,c_proc_WLname);
    sh_service_status;
  finally
    ShowBusy(False);
  end;
end;

procedure TfrmMain.btnReconnectWLClick(Sender: TObject);
begin  // reboot server
  try
    ShowBusy(True);
    ServiceStop(nil,c_proc_WLname);
    sh_service_status;
    Application.ProcessMessages;
    ServiceStart(nil,c_proc_WLname);
    sh_service_status;
  finally
    ShowBusy(False);
  end;
end;

procedure TfrmMain.TSDatabaseShow(Sender: TObject);
begin
  PanelDB_Show(1);
end;

procedure TfrmMain.TSLocalShow(Sender: TObject);
begin  // отображение 2 закладки - локальная конфигурация DICOM
  PanelDB_Show(2);
end;

procedure TfrmMain.tsNewWorkListShow(Sender: TObject);
begin
  PanelDB_Show(9);
end;

procedure TfrmMain.TSPacientsShow(Sender: TObject);
begin
  PanelDB_Show(8);
end;

procedure TfrmMain.TSDevicesShow(Sender: TObject);
begin
  PanelDB_Show(3);
end;

procedure TfrmMain.TSEventsShow(Sender: TObject);
begin
  PanelDB_Show(4);
end;

procedure TfrmMain.TreeChange(const p_SelIndex: integer);
begin
  if p_SelIndex = 1 then         // База данных
    cxpgcntrl1.ActivePage := TSDatabase // .ActivePageIndex := 0
  else if (p_SelIndex = 2) then  // Локальная конфигурация DICOM
    cxpgcntrl1.ActivePage := TSLocal // .ActivePageIndex := 1
  else if p_SelIndex = 3 then  // Удаленные устройства DICOM
    cxpgcntrl1.ActivePage := TSDevices // .ActivePageIndex := 3
  else if p_SelIndex = 4 then  // Журнал событий
    cxpgcntrl1.ActivePage := TSEvents // .ActivePageIndex := 2
  else if p_SelIndex = 5 then  // правила пересылки
    cxpgcntrl1.ActivePage := tsRules // .ActivePageIndex := 4
  else if p_SelIndex = 6 then // журнал пересылки
    cxpgcntrl1.ActivePage := tsResend // .ActivePageIndex := 5
  else if p_SelIndex = 7 then // настройки WORKLIST
    cxpgcntrl1.ActivePage := TSWORKLIST // .ActivePageIndex := 6
  else if p_SelIndex = 8 then // список назначений WORKLIST
    cxpgcntrl1.ActivePage := tsNewWorkList // .ActivePageIndex := 8  TSPacients
  else if p_SelIndex = 9 then // Web сервер
    cxpgcntrl1.ActivePage := TSWADO // .ActivePageIndex := 9
  else if p_SelIndex = 10 then // DB BACKUP
    cxpgcntrl1.ActivePage := TSDBBACKUP // .ActivePageIndex := 10
  else if p_SelIndex = 11 then //   Монитор
    cxpgcntrl1.ActivePage := TSMonitor // .ActivePageIndex := 11
  else
    cxpgcntrl1.ActivePage := TSDatabase; // cxpgcntrl1.ActivePageIndex := 0;
end;

// отображение панели, соответствующей выботу в дереве
procedure TfrmMain.cbCheckAEWorklistEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.cbIsSendWlToMisPacNetEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.cbIsWrtLogEditing(Sender: TObject; var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.cbLOGWorklistEditing(Sender: TObject; var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.cbPACSSendToMisPacNetEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.wrtEchoMonitorLog( pStr:string );
var v_str : string; vTmp:string;
begin
  if cbEchoLog.Checked then
  begin
    if meECHOLog.Lines.Count>1000 then
      meECHOLog.Lines.Clear;
    v_str:=DateTimeToStr(Now)+' '+pStr;
    meECHOLog.Lines.Append(v_str);
    if cbEchoWrtLogFile.Checked then
    begin
      vTmp:=ExtractFileDir(Paramstr(0));
      MnLg_ev(v_str,vTmp+'\Monitor.log',False,False);
    end;
  end;
end;

procedure TfrmMain.cbResetEchoAskMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var val : Integer;
const cTm = 60*1000;
  procedure cmn1( pMsg:string; pInterval:Integer = 10 );
  begin
    edEchoInterval.SetFocus;
    cbResetEchoAsk.Checked:=False;
    edEchoInterval.Text:=IntToStr(pInterval);
    wrtEchoMonitorLog(pMsg);
  end;
begin  // запуск монитора активности пакса
  if cbResetEchoAsk.Checked then
  begin
    if not TryStrToInt( edEchoInterval.Text, val ) then
    begin
      cmn1('Введите целое число',5);
    end else
    begin
      if ((val<1) or (val>(24*60))) then
      begin
        cmn1('Неверное значение',5);
      end else
      begin
        tmEchoTest.Interval := Trunc(val*cTm); // интервал в милисекундах
        wrtEchoMonitorLog('Опрос ECHO запущен с интервалом '+inttostr(Trunc(tmEchoTest.Interval/cTm))+' мин');
        tmEchoTest.Enabled:=True;
      end;
    end;
  end else
  begin
    tmEchoTest.Enabled:=False;
    wrtEchoMonitorLog('Опрос ECHO остановлен');
  end;
end;

procedure TfrmMain.cbWADOlogEditing(Sender: TObject; var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.cxButton11Click(Sender: TObject);
var FIBDataset : TpFIBDataset;
    vSQLStr, v_dir, v_pName : string;
    y, m, d : Word;
    vMaxAmmErrors, vNmb : integer;
    vChkAmmRec, vRes : Boolean;
const cSQLText = 'select p.p_pid, p.p_ename, p.p_ename_rus, p.p_dateborn, ' +#13#10+
                 '        s.studies_image_type, s.ldate, s.studyuid, s.accessionnumber, s.FC_AEAPPARAT, ' +#13#10+
                 '        i.instanceuid, i.seriesuid ' +#13#10+
                 ' from patients p, studies s, images i ' +#13#10+
                 ' where p.p_pid=s.p_pid and s.studyuid=i.studyuid' +#13#10;
      cSQLText1 = ' order by s.ldate, s.studies_image_type, s.studyuid desc  ' ;
begin  // test configuration
  frmMain.dxMemTestFiles.Close;
  frmMain.dxMemTestFiles.Open;
  //
  FIBDataset    := TpFIBDataset.Create(nil);
  try
    FIBDataSet.AutoCommit := True;
    FIBDataset.Database:=DB_CMN.DB;
    FIBDataset.Transaction:=DB_CMN.trRead;
    FIBDataset.UpdateTransaction:=DB_CMN.trWrite;
    if not FIBDataset.Transaction.Active then
          FIBDataset.Transaction.Active:=True;
    vSQLStr:=cSQLText;
    if YearOf(cxdtBeg.Date)>1900 then
    begin
      vSQLStr := vSQLStr + ' and s.ldate>=:pDt1 ' +#13#10;
      if YearOf(cxdtEnd.Date)>1900 then
        vSQLStr := vSQLStr + ' and s.ldate<:pDt2 ' +#13#10;
    end;
    if Trim(cbModality1.Text)<>'' then
      vSQLStr := vSQLStr + ' and s.studies_image_type=:pmodality ' +#13#10;
    if Trim(teAETitleApparat.Text)<>'' then
      vSQLStr := vSQLStr + ' and s.FC_AEAPPARAT=:pAEAPPARAT ' +#13#10;
    if Trim(teSTUDYUID.Text)<>'' then
      vSQLStr := vSQLStr + ' and s.studyuid=:studyuid ' +#13#10;

    FIBDataSet.SQLs.SelectSQL.Text := vSQLStr;

    if YearOf(cxdtBeg.Date)>1900 then
    begin
      FIBDataSet.ParamByName('pDt1').AsDate := DateOf(cxdtBeg.Date);
      if YearOf(cxdtEnd.Date)>1900 then
        FIBDataSet.ParamByName('pDt2').AsDate := DateOf(IncDay(cxdtEnd.Date));
    end;
    if Trim(cbModality1.Text)<>'' then
      FIBDataSet.ParamByName('pmodality').AsString := Trim(cbModality1.Text) ;
    if Trim(teAETitleApparat.Text)<>'' then
      FIBDataSet.ParamByName('pAEAPPARAT').AsString := Trim(teAETitleApparat.Text);
    if Trim(teSTUDYUID.Text)<>'' then
      FIBDataSet.ParamByName('studyuid').AsString := Trim(teSTUDYUID.Text);

    FIBDataSet.Open;
    FIBDataSet.First;
    ProgressBar1.Min:=0;
    ProgressBar1.Max:=FIBDataSet.RecordCount;
    ProgressBar1.Visible := True;
    vNmb:=0;
    if Trim(cxTextEdit1.Text)<>'' then
    begin
      vChkAmmRec := TryStrToInt(Trim(cxTextEdit1.Text),vMaxAmmErrors) ;
      if vMaxAmmErrors=0 then vChkAmmRec := False;
    end else
      vChkAmmRec := False;
    while not FIBDataSet.Eof do
    begin
      ProgressBar1.StepIt;
      Application.ProcessMessages;
      // определим каталог
      DecodeDate(FIBDataSet.FieldByName('ldate').AsDateTime, y, m, d);
      v_dir:=v_1_3_STORAGE_FOLDER+'\'+FIBDataSet.FieldByName('studies_image_type').AsString+'\'+
          IntToStr(y)+'\'+IntToStr(m)+'\'+IntToStr(d)+'\'+
          FIBDataSet.FieldByName('STUDYUID').AsString+'\'+
          FIBDataSet.FieldByName('SERIESUID').AsString+'\';
      v_pName := v_dir + Trim(FIBDataSet.FieldByName('INSTANCEUID').asstring) + '.dcm';

      with TStringList.Create do
      try
        try
          LoadFromFile( v_pName );
          vRes:=True;
        except
          vRes := False;
        end;
      finally
        Free;
      end;

    //  vRes := FileExists( v_pName ) ;

      if not vRes then
      begin
        Inc(vNmb);
        frmMain.dxMemTestFiles.Insert;
        frmMain.dxMemTestFiles.FieldByName('p_pid').AsString := FIBDataSet.FieldByName('p_pid').AsString ;
        frmMain.dxMemTestFiles.FieldByName('p_ename').AsString := FIBDataSet.FieldByName('p_ename').AsString ;
        frmMain.dxMemTestFiles.FieldByName('p_ename_rus').AsString := FIBDataSet.FieldByName('p_ename_rus').AsString ;
        frmMain.dxMemTestFiles.FieldByName('p_dateborn').AsDateTime := FIBDataSet.FieldByName('p_dateborn').AsDateTime ;
        frmMain.dxMemTestFiles.FieldByName('studies_image_type').AsString := FIBDataSet.FieldByName('studies_image_type').AsString ;
        frmMain.dxMemTestFiles.FieldByName('ldate').AsDateTime := FIBDataSet.FieldByName('ldate').AsDateTime ;
        frmMain.dxMemTestFiles.FieldByName('studyuid').AsString := FIBDataSet.FieldByName('studyuid').AsString ;
        frmMain.dxMemTestFiles.FieldByName('accessionnumber').AsString := FIBDataSet.FieldByName('accessionnumber').AsString ;
        frmMain.dxMemTestFiles.FieldByName('instanceuid').AsString := FIBDataSet.FieldByName('instanceuid').AsString ;
        frmMain.dxMemTestFiles.FieldByName('seriesuid').AsString := FIBDataSet.FieldByName('seriesuid').AsString ;
        frmMain.dxMemTestFiles.FieldByName('AEApparat').AsString := FIBDataSet.FieldByName('FC_AEAPPARAT').AsString ;
        frmMain.dxMemTestFiles.FieldByName('fcERRORtext').AsString := 'File not found : '+v_pName;
        frmMain.dxMemTestFiles.Post;
        if vChkAmmRec then
        begin
          if vNmb>=vMaxAmmErrors then Break;       
        end;
      end;
      FIBDataSet.Next;
      Application.ProcessMessages;
    end;
  finally
    ProgressBar1.Visible := False;
    FreeAndNil(FIBDataSet);
  end;
end;

procedure TfrmMain.cxButton12Click(Sender: TObject);
begin // Протестировать хранилище
  if gbTESTIMAGES.Visible then
  begin
    gbTESTIMAGES.Visible := False;
  end else
  begin
    gbTESTIMAGES.Visible := True;
    cxdtBeg.Date := Date;
    cxdtEnd.Date := Date;
  end;
end;

procedure TfrmMain.cxButton13Click(Sender: TObject);
var vFileName, vDir, vFname : string; vD : TDateTime;
    VExcel: Variant;
begin   // ExtractFilePath(paramstr(0))
  frmMain.dxMemTestFiles.Open;
  vD := Now;
  vDir := GetTempDirectory;
  vFname := IntToStr(YearOf(vD))+'_'+
      IntToStr(MonthOf(vD))+'_'+
      IntToStr(DayOf(vD))+'_'+
      IntToStr(HourOf(vD))+'_'+
      IntToStr(MinuteOf(vD))+'_'+
      IntToStr(SecondOf(vD))+'_'+
      IntToStr(GetTickCount)+
      '_tmp.xls';
  vFileName := vDir + '\'+ vFname ;
  sdPopUp.InitialDir := vDir;
  sdPopUp.FileName := vFname ;
  if sdPopUp.Execute then
  begin
    ExportGridToExcel( sdPopUp.FileName , cxGrid1, TRUE, True );
    if FileExists(vFileName) then
    begin
      VExcel := CreateOleObject('Excel.Application');
      VExcel.Visible := True;
      VExcel.WindowState := -4137;          //Открывать Excel на полный экран
      VExcel.DisplayAlerts := False; //не показывать предупреждающие сообщения
      VExcel.WorkBooks.Open(sdPopUp.FileName);     //Открываем рабочую книгу
      VExcel.WorkSheets[1].Activate;        //Становимся на первый лист
    end;
  end;
end;

procedure TfrmMain.cxButton14Click(Sender: TObject);
begin
  try
    ShowBusy(True);
    ServiceStart(nil,c_proc_WADO);
    sh_service_status;
  finally
    ShowBusy(False);
  end;
end;

procedure TfrmMain.cxButton15Click(Sender: TObject);
begin
  try
    ShowBusy(True);
    ServiceStop(nil,c_proc_WADO);
    sh_service_status;
  finally
    ShowBusy(False);
  end;
end;

procedure TfrmMain.cxButton16Click(Sender: TObject);
begin
  try
    ShowBusy(True);
    ServiceStop(nil,c_proc_WADO);
    sh_service_status;
    Application.ProcessMessages;
    ServiceStart(nil,c_proc_WADO);
    sh_service_status;
  finally
    ShowBusy(False);
  end;
end;

procedure TfrmMain.cxButton17Click(Sender: TObject);
begin
  pCheckPGConn( tePACSSend_pg_database.Text,
                StrToInt(tePACSSend_pg_port.Text),
                tePACSSend_pg_server.Text,
                tevPACSSend_pg_Schema.Text,
                tePACSSend_pg_user.Text,
                tePACSSend_pg_password.Text
              );
end;

procedure TfrmMain.cxButton18Click(Sender: TObject);
begin
  sh_service_status;
end;

procedure TfrmMain.cxButton19Click(Sender: TObject);
begin
  pCheckPGConn( teWLSend_pg_database.Text,
                StrToInt(teWLSend_pg_port.Text),
                teWLSend_pg_server.Text,
                teWLSend_pg_Schema.Text,
                teWLSend_pg_user.Text,
                teWLSend_pg_password.Text
              );
end;

procedure TfrmMain.cxButton20Click(Sender: TObject);
begin
  pCheckPGConn( tePACS_pg_database.Text,
                StrToInt(tePACS_pg_port.Text),
                tePACS_pg_server.Text,
                tePACS_pg_Schema.Text,
                tePACS_pg_user.Text,
                tePACS_pg_password.Text
              );
end;

procedure TfrmMain.cxButton21Click(Sender: TObject);
begin
  pCheckPGConn( teWL_pg_database.Text,
                StrToInt(teWL_pg_port.Text),
                teWL_pg_server.Text,
                teWL_pg_Schema.Text,
                teWL_pg_user.Text,
                teWL_pg_password.Text
              );
end;

procedure TfrmMain.cxButton22Click(Sender: TObject);
begin
  pCheckPGConn( teWADO_pg_database.Text,
                StrToInt(teWADO_pg_port.Text),
                teWADO_pg_server.Text,
                teWADO_pg_Schema.Text,
                teWADO_pg_user.Text,
                teWADO_pg_password.Text
              );
end;

procedure TfrmMain.cxButton24Click(Sender: TObject);
begin // BACKUP



end;

procedure TfrmMain.cxButton25Click(Sender: TObject);
begin
  dlgrezcopy.Directory:=teCatalogDbBackup.Text;
  if dlgrezcopy.Execute then
  begin
    if (teCatalogDbBackup.Text <> dlgrezcopy.Directory) then begin
      SetSavBtnCol(True);
      teCatalogDbBackup.Text := dlgrezcopy.Directory;
    end;
  end;
end;

procedure TfrmMain.cxButton26Click(Sender: TObject);
begin // RESTORE

end;

procedure TfrmMain.cxButton2Click(Sender: TObject);
begin // месяц назад
  cxDateEdit1.Date:=IncMonth(cxDateEdit1.Date,-1);
  resend_refresh;
end;

procedure TfrmMain.cxButton3Click(Sender: TObject);
begin
  if f_C_ECHO(TEIPServer.Text, cxtSERVER_PORT.Text, cxtAE_TITLE.Text, LocAE) then
    MessageDlg('Устройство отвечает на запросы', mtInformation, [mbOK], 0)
  else
    MessageDlg('Устройство не отвечает на запросы', mtError, [mbOK], 0);
end;

procedure TfrmMain.cbAboutClick(Sender: TObject);
begin // About
  Application.CreateForm(TFrmAbout, FrmAbout);
  try
    FrmAbout.vInfo := 'Программа Configurator '+#13+
                      'Предназначена для настройки '+#13+
                      'и администрирования PACS и '+#13+
                      'WORKLIST серверов и DICOM'+#13+
                      'узлов сети'+#13+
                      ''+#13+
                      '';
    FrmAbout.ShowModal;
  finally
    FrmAbout.Free;
  end;
end;

procedure TfrmMain.cxButton4Click(Sender: TObject);
begin // день назад
  cxDateEdit1.Date:=IncDay(cxDateEdit1.Date,-1);
  resend_refresh;
end;

procedure TfrmMain.cxButton5Click(Sender: TObject);
begin // месяц вперед
  cxDateEdit1.Date:=IncMonth(cxDateEdit1.Date,1);
  resend_refresh;
end;

procedure TfrmMain.cxButton6Click(Sender: TObject);
begin // день вперед
  cxDateEdit1.Date:=IncDay(cxDateEdit1.Date,1);
  resend_refresh;
end;

procedure TfrmMain.cxButton8Click(Sender: TObject);
begin
  sh_service_status;
end;

procedure TfrmMain.cxButton9Click(Sender: TObject);
begin
  sh_service_status;
end;

procedure TfrmMain.cxchckbxchkAEEditing(Sender: TObject; var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.cxCheckBox2Editing(Sender: TObject; var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.cxSplitter1BeforeClose(Sender: TObject;
  var AllowClose: Boolean);
begin
  Panel4.Visible := False;
end;

procedure TfrmMain.cxSplitter1BeforeOpen(Sender: TObject; var NewSize: Integer;
  var AllowOpen: Boolean);
begin
  Panel4.Visible := True;  
end;

procedure TfrmMain.cxSplitter2BeforeClose(Sender: TObject;
  var AllowClose: Boolean);
begin
  Panel6.Visible := False;
end;

procedure TfrmMain.cxSplitter2BeforeOpen(Sender: TObject; var NewSize: Integer;
  var AllowOpen: Boolean);
begin
  Panel6.Visible := True;
end;

procedure TfrmMain.tsResendShow(Sender: TObject);
begin
  PanelDB_Show(5);
end;

procedure TfrmMain.tsRulesShow(Sender: TObject);
begin
  PanelDB_Show(6);
end;

procedure TfrmMain.TSWORKLISTShow(Sender: TObject);
begin
  PanelDB_Show(7);
end;

procedure TfrmMain.tvFN_COMPRESSGetDataText(Sender: TcxCustomGridTableItem;
  ARecordIndex: Integer; var AText: string);
var ColIdx, v_nn : integer; v_val :string;
begin  //
  with TcxGridDBTableView(Sender.GridView).DataController do
  begin
    ColIdx := GetItemByFieldName('FN_COMPRESS').Index;
    v_val:=VarToStr(GetDisplayText(ARecordIndex,ColIdx));
    if v_val='' then v_val:='0';
    v_nn:=gt_nn_transfer_syntax(StrToInt(v_val),0);
    AText := v_trsyntList[v_nn,0];
  end;
end;

procedure TfrmMain.TVListCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if v_isOracle then begin
    cxmLog.Lines.Text := OraEvents.FieldByName('FC_REMARK').AsString;
  end else if v_isPostgres then begin
    cxmLog.Lines.Text := UniEvents.FieldByName('FC_REMARK').AsString;
  end else begin
    cxmLog.Lines.Text := pFIBEvents.FieldByName('FC_REMARK').AsString;
  end;
end;

procedure TfrmMain.tvListRsndSelectionChanged(Sender: TcxCustomGridTableView);
begin
  bbRsnd.Enabled := ( pFIBJrnlRsnd.FieldByName('FN_TYPE').AsInteger=1 );
end;

procedure TfrmMain.cxtAE_TITLEEditing(Sender: TObject; var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.cxtrvwTreeChange(Sender: TObject; Node: TTreeNode);
begin
  TreeChange(Node.StateIndex);
end;

procedure TfrmMain.cxtSERVER_PORTEditing(Sender: TObject; var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.cxtxtCtlgLogEditing(Sender: TObject; var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

procedure TfrmMain.cxtxtdtBDEditing(Sender: TObject; var CanEdit: Boolean);
begin
  SetSavBtnCol(True);
end;

// вывод типа события в строке на основании целочисленного представления в БД
procedure TfrmMain.FN_AMMGetDataText(Sender: TcxCustomGridTableItem;
  ARecordIndex: Integer; var AText: string);
var ColIdx, ColIdx1, v_amm, v_err : integer;
    v_amm_str, v_err_str : string;
begin
  with TcxGridDBTableView(Sender.GridView).DataController do
  begin
    ColIdx := GetItemByFieldName('FN_AMM').Index;
    ColIdx1:= GetItemByFieldName('FN_AMM_ERR').Index;
    v_err_str:=Trim(VarToStr(GetDisplayText(ARecordIndex,ColIdx1)));
    if v_err_str='' then
      v_err := 0
    else
      v_err := StrToInt(v_err_str);
    v_amm_str:=Trim(VarToStr(GetDisplayText(ARecordIndex,ColIdx)));
    if v_amm_str='' then
      v_amm := 0
    else
      v_amm := StrToInt(v_amm_str);
    AText := VarToStr(v_amm-v_err)+'/'+ VarToStr(v_amm);
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var v_str : AnsiString; v_str_tmp : string;
begin
  cxDV.StoreToRegistry(c_reg_lst_mn+c_devices_rg, TRUE, [], 'cxDV');
  TVList.StoreToRegistry(c_reg_lst_mn+c_events_rg, TRUE, [], 'TVList');
  tvRules.StoreToRegistry('\SoftWare\SoftMaster\Configurator\grRules', True, [], 'tvRules');
  tvListRsnd.StoreToRegistry('\SoftWare\SoftMaster\Configurator\grRsnd', True, [], 'tvListRsnd');  
  v_str_tmp:=Chk_Equal_Values;
  if Trim(v_str_tmp)<>''
  then
    v_str := 'Остались несохраненные данные!'+#13+
             v_str_tmp+#13+
             'Вы хотите выйти из приложения '+#13+
             'без сохранения данных ?'
  else
    v_str:='Вы хотите выйти из приложения ?';
  if Application.MessageBox(PChar(v_str), 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes
  then begin
    frmMain.pFIBDevices.Close;
    frmMain.pFIBEvents.Close;
    frmMain.dxMemTestFiles.Close;
    if v_isOracle then
    begin
      OraFree(OraConn);
    end else
    if v_isPostgres then
    begin
      frmMain.UniEvents.Close;
      frmMain.UniDevices.Close;
      frmMain.UniRules.Close;
      frmMain.UniJrnlRsnd.Close;
      PgFree ( PGconn, MnUniTransaction );
    end else
    begin
      frmMain.pFIBEvents.Close;
      frmMain.pFIBDevices.Close;
      frmMain.pFIBRules.Close;
      frmMain.pFIBJrnlRsnd.Close;
      p_free_conn_fb ( DB_CMN.DB ,
                       DB_CMN.trWrite ,
                       DB_CMN.trRead
                      );
      p_free_conn_fb ( DB_CMN.WLDB ,
                       DB_CMN.WLtrWrite ,
                       DB_CMN.WLtrRead
                      );
      p_free_conn_fb ( DB_CMN.LOGDB ,
                       DB_CMN.LOGtrWrite ,
                       DB_CMN.LOGtrRead
                      );
    end;
    action := caFree;
  end else
    action := caNone;
end;

// создание формы - начальная инициализация
procedure TfrmMain.FormCreate(Sender: TObject);
var Reg : TRegIniFile; v_ini:TIniFile;
begin
  tmEchoTest.Enabled:=False;
  // центрирование кнопки about
  cbAbout.Left:=Trunc((pnlAbout.Width-cbAbout.Width)/2);
  //
  cxSplitter2.CloseSplitter;
  // текущий каталог
  v_exe_path:=ExtractFilePath(Application.ExeName);
  // чтение ini-файла
  v_ini:=TIniFile.Create(v_exe_path+c_ini_file);
  try
    LocAE := v_ini.ReadString( 'DICOM', 'LocalAE', 'TEST1' );
    v_ini.WriteString( 'DICOM', 'LocalAE', LocAE);
    LocPort := v_ini.ReadInteger( 'DICOM', 'LocalPort', 104 );
    v_ini.WriteInteger( 'DICOM', 'LocalPort', LocPort);
  finally
    FreeAndNil(v_ini);
  end;

  cxSplitter1.CloseSplitter;
  frmMain.LbRbtSrv.Visible:=False;
  v_is_cxlbl8:=False;
  Reg := TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    if not Reg.OpenKey(c_reg_lst_mn, False) then
    begin
      Reg.CreateKey(c_reg_lst_mn);
    end;
  finally
    Reg.Free;
  end;
  // текущая дата в поиске по логу
  cxdtdtDate1.Date:=Date;
  cxDateEdit1.Date:=Date;
  // фильтр по всем событиям
  frmMain.cxCBall.Checked:=True;
  frmMain.cxCBstart.Checked:=False;
  frmMain.cxCBstop.Checked:=False;
  frmMain.cxchckbxerror.Checked:=False;
  frmMain.cxchckbxevents.Checked:=False;
  frmMain.cxchckbxParamEdit.Checked:=False;
  cxpgcntrl1.HideTabs := True;
  TreeChange(0);
//  cxpgcntrl1.ActivePageIndex := 0;
  // чтение адреса сервера Firebird
  v_ip_fb:=read_db_ip;
  sh_service_status;
  //
  sys_read;
  // установки для Postgres
  gbReservBD.Visible:=not v_isPostgres;
  //
  frmMain.Caption := 'Конфигуратор ('+GetModuleVersion+')';
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  cxDV.StoreToRegistry(c_reg_lst_mn+c_devices_def_rg, True, [], 'cxDV');
  cxDV.RestoreFromRegistry(c_reg_lst_mn+c_devices_rg, False, False, [], 'cxDV');
  TVList.StoreToRegistry(c_reg_lst_mn+c_events_def_rg, True, [], 'TVList');
  TVList.RestoreFromRegistry(c_reg_lst_mn+c_events_rg, False, False, [], 'TVList');
  tvRules.StoreToRegistry('\SoftWare\SoftMaster\Configurator\grRulesDefault', True, [], 'tvRules');
  tvRules.RestoreFromRegistry('\SoftWare\SoftMaster\Configurator\grRules', False, False, [], 'tvRules');
  tvListRsnd.StoreToRegistry('\SoftWare\SoftMaster\Configurator\grRsndDefault', True, [], 'tvListRsnd');
  tvListRsnd.RestoreFromRegistry('\SoftWare\SoftMaster\Configurator\grRsnd', False, False, [], 'tvListRsnd');
end;

procedure TfrmMain.frxRptNewGetValue(Sender: TObject; const VarName: string; var Value: Variant);
begin
  if VarName='EventsTitle' then
    begin
      if ((YearOf(cxdtdtDate1.Date)>1900) and (YearOf(cxdtdtDate2.Date)>1900)) then
        begin
          Value:='Журнал событий за период с '+DateToStr(cxdtdtDate1.Date)+' по '+DateToStr(cxdtdtDate2.Date);
        end else
        if ((YearOf(cxdtdtDate1.Date)<=1900) and (YearOf(cxdtdtDate2.Date)>1900)) then
          begin
            Value:='Журнал событий за период до '+DateToStr(cxdtdtDate2.Date);
          end else
          if ((YearOf(cxdtdtDate1.Date)>1900) and (YearOf(cxdtdtDate2.Date)<=1900)) then
            begin
              Value:='Журнал событий за период c '+DateToStr(cxdtdtDate1.Date);
            end else
            begin
              Value:='Журнал событий';
            end;
    end;
end;

procedure TfrmMain.frxRptRsndNewGetValue(Sender: TObject; const VarName: string;
  var Value: Variant);
begin
  if VarName='EventsTitle' then
    begin
      if (YearOf(cxDateEdit1.Date)>1900)then
        Value:='Журнал пересылки за '+DateToStr(cxDateEdit1.Date)
      else Value:='Журнал пересылки';  
    end else
  if VarName='EventsFilter' then
    begin
      Value:='';
      if ((YearOf(cxDtIssl1.Date)>1900) and (YearOf(cxDtIssl2.Date)>1900)) then 
      begin
        Value:='дата исследования за период с '+DateToStr(cxDtIssl1.Date)+' по '+DateToStr(cxDtIssl2.Date);
      end else if ((YearOf(cxDtIssl1.Date)<=1900) and (YearOf(cxDtIssl2.Date)>1900)) then
      begin
        Value:='дата исследования до '+DateToStr(cxDtIssl2.Date);
      end else if ((YearOf(cxDtIssl1.Date)>1900) and (YearOf(cxDtIssl2.Date)<=1900)) then
      begin
        Value:='дата исследования c '+DateToStr(cxDtIssl1.Date);
      end;
      if Trim(cxDtPatId.Text)<>'' then
        Value:=Value+#13+'N МК:'+cxDtPatId.Text;
      if Trim(cxPatient.Text)<>'' then
        Value:=Value+#13+'Пациент:'+cxPatient.Text;
      if Trim(cxCBMod.Text)<>'' then
        Value:=Value+#13+'Модальность:'+cxCBMod.Text;       
      if Trim(cxCalledAE.Text)<>'' then
        Value:=Value+#13+'AE получателя:'+cxCalledAE.Text;      
      if Trim(cxCallingAE.Text)<>'' then
        Value:=Value+#13+'AE отправителя:'+cxCallingAE.Text;         
      if Trim(cxAccessionNumber.Text)<>'' then
        Value:=Value+#13+'№ протокола:'+cxAccessionNumber.Text;
      if Trim(Value)<>'' then Value:= 'Условие фильтрации :'+Value;       
    end else
  if VarName='AMM' then
    begin
      Value := inttostr( frxDBRsnd.DataSet.FieldByName('FN_AMM').AsInteger -
                      frxDBRsnd.DataSet.FieldByName('FN_AMM_ERR').AsInteger )+
                      '/'+inttostr(frxDBRsnd.DataSet.FieldByName('FN_AMM').AsInteger);
    end else
  if VarName='TYPE' then
    begin
      if frxDBRsnd.DataSet.FieldByName('fn_type').AsInteger=0 then
        Value:='Отправлено'
      else  
        Value:='Ошибки';
    end;
end;

procedure TfrmMain.frxRptRulesNewGetValue(Sender: TObject;
  const VarName: string; var Value: Variant);
var v_nn : integer;
begin
  if VarName='TransferSyntax' then
    begin
      v_nn  := gt_nn_transfer_syntax(frxDBRules.DataSet.FieldByName('FN_COMPRESS').AsInteger,0);
      Value := v_trsyntList[ v_nn, 0 ];
    end;
end;

procedure TfrmMain.JvAppInstancesRejected(Sender: TObject);
begin
  MessageDlg('Программа уже запущена !', mtWarning, [mbOK], 0);
  Application.Terminate;
end;

procedure TfrmMain.MenuItem19Click(Sender: TObject);
begin
  tvRules.RestoreFromRegistry('\SoftWare\SoftMaster\Configurator\grRsndDefault', False, False, [], 'tvRules');
end;

procedure TfrmMain.N5Click(Sender: TObject);
begin
  tvListRsnd.RestoreFromRegistry('\SoftWare\SoftMaster\Configurator\grRsndDefault', False, False, [], 'tvListRsnd');
end;

// сохранение параметров в таблице SYSPARMS
procedure TfrmMain.ParamsSaveExecute(Sender: TObject);
begin
  frmMain.LbRbtSrv.Visible:=True;
  Myparams_save;
  SetSavBtnCol(False);
end;

procedure TfrmMain.pFIBDevicesAfterOpen(DataSet: TDataSet);
begin
  actEdtDevice.Enabled := pFIBDevices.RecordCount > 0;
  actDltDevice.Enabled := pFIBDevices.RecordCount > 0;
  aPrintDev.Enabled    := pFIBDevices.RecordCount > 0;
  aText1.Enabled       := pFIBDevices.RecordCount > 0;
  aWeb1.Enabled        := pFIBDevices.RecordCount > 0;
  aXML1.Enabled        := pFIBDevices.RecordCount > 0;
  aExcel1.Enabled      := pFIBDevices.RecordCount > 0;
end;

procedure TfrmMain.pFIBJrnlRsndAfterOpen(DataSet: TDataSet);
begin
  aPrintRsnd.Enabled := pFIBJrnlRsnd.RecordCount > 0;
  aTextRsnd.Enabled  := pFIBJrnlRsnd.RecordCount > 0;
  aWebRsnd.Enabled   := pFIBJrnlRsnd.RecordCount > 0;
  aXMLRsnd.Enabled   := pFIBJrnlRsnd.RecordCount > 0;
  aExcelRsnd.Enabled := pFIBJrnlRsnd.RecordCount > 0;
  bbRsnd.Enabled     := pFIBJrnlRsnd.RecordCount > 0;
end;

procedure TfrmMain.pFIBRulesAfterOpen(DataSet: TDataSet);
begin
  aDelRul.Enabled   := pFIBRules.RecordCount > 0;
  aPrintRul.Enabled := pFIBRules.RecordCount > 0;
  aTextRul.Enabled  := pFIBRules.RecordCount > 0;
  aWebRul.Enabled   := pFIBRules.RecordCount > 0;
  aXMLRul.Enabled   := pFIBRules.RecordCount > 0;
  aExcelRul.Enabled := pFIBRules.RecordCount > 0;
end;

procedure TfrmMain.aRefreshWorklistExecute(Sender: TObject);
var das, da2: TDicomAttributes;
    dd, dd1: TDicomAttribute;
    i,j : Integer; // vDD : TDateTime;
    CnsDicomConnection1: TCnsDicomConnection;
    vDicomAttribute : TDicomAttribute;
  //  vStrTmp : string;
begin // aRefreshWorklist Обновить список Worklist (запрос C-FIND к серверу)
  CnsDicomConnection1 := TCnsDicomConnection.Create(Self);
  try
    CnsDicomConnection1.v_is_log := False;  // не протоколируем
//    CnsDicomConnection1.v_log_filename := 'mwl_scu.log';    
    CnsDicomConnection1.Host := teIPWORKLIST.Text;
    CnsDicomConnection1.Port := StrToInt(tePortWORKLIST.Text);
    CnsDicomConnection1.CalledTitle := teAEWORKLIST.Text;
    CnsDicomConnection1.CallingTitle := LocAE;

    CnsDicomConnection1.ReceiveTimeout := 1000000;
  //  CnsDicomConnection1.ClearPresentationContext;
    CnsDicomConnection1.addPresentationContext(ModalityWorklistInformationModelFIND);
    CnsDicomConnection1.addPresentationContext(ModalityPerformedProcedureStep);
    CnsDicomConnection1.addPresentationContext(ModalityPerformedProcedureStepRetrieve);
    CnsDicomConnection1.addPresentationContext(ModalityPerformedProcedureStepNotification);

    CnsDicomConnection1.v_is_log := True;
    CnsDicomConnection1.v_log_filename := ExtractFilePath(paramstr(0))+'C_MWL.log';
    { Single Value Matching
      List of UID Matching
      Wild Card Matching
      Range Matching
      Sequence Matching    }
    das := TDicomAttributes.Create;
    with das do
    begin
      Add($0008, $0050); //(AccessionNumber)SH=<0>NULL
      if (Trim(teAccessionnumber.Text)<>'') then
        Add($0008, $0050).AsString[0] := teAccessionnumber.Text
      else
        Add($0008, $0050);

      if (Trim(tePacFIO.Text) <> '') then
        Add($0010, $0010).AsString[0] := tePacFIO.Text // Пациент
      else
        Add($0010, $0010); //(PatientName)PN=<0>NULL

      if (Trim(tePatientID.Text) <> '') then
        Add($0010, $0020).AsString[0] := tePatientID.Text
      else
        Add($0010, $0020); //(PatientID)LO=<1>

      Add($0010, $0030); //(PatientBirthDate)DA=<0>NULL
      Add($0010, $0040); //(PatientSex)CS=<0>NULL
      Add($0020, $000D); //(StudyInstanceUID)UI=<0>NULL
      Add($0032, $1060); //(RequestedProcedureDescription)LO=<0>NULL
      dd := Add($0040, $0100); //(ScheduledProcedureStepSequence)SQ=<1>Sequence Data
      da2 := TDicomAttributes.Create;
      dd.AddData(da2);

      if (Trim(cbModality.Text)<>'') then
        da2.AddVariant($0008, $0060, cbModality.Text); //(Modality)CS=<1>DX

      da2.Add($0040, $0001); //(ScheduledStationAETitle)AE=<1>HBLB
      {
      if ((YearOf(deStartDateWorklist.Date)>1900) and (YearOf(deEndDateWorklist.Date)>1900)) then begin
        dd := da2.Add($0040, $0002); //(ScheduledProcedureStepStartDate)DA=<1>2004-9-23
        dd.AsDatetime[0] := deStartDateWorklist.Date;
        dd.AsDatetime[1] := deEndDateWorklist.Date;
      end;
      }
      if ((YearOf(deStartDateWorklist.Date)>1900) or (YearOf(deEndDateWorklist.Date)>1900)) then
      begin
        dd := Add($0008, $0020);
        if YearOf(deStartDateWorklist.Date)>1900 then
          dd.AsDatetime[0] := deStartDateWorklist.Date
        else
          dd.AsDatetime[0] := EncodeDate(1900,1,1);
        if YearOf(deEndDateWorklist.Date)>1900 then
          dd.AsDatetime[1] := deEndDateWorklist.Date
        else
          dd.AsDatetime[1] := EncodeDate(2100,1,1);
      end;

      da2.Add($0040, $0003); //(ScheduledProcedureStepStartTime)TM=<0>NULL
      da2.Add($0040, $0006); //(ScheduledPerformingPhysiciansName)PN=<0>NULL
      da2.Add($0040, $0007); //(ScheduledProcedureStepDescription)LO=<0>NULL
      da2.Add($0040, $0009); //(ScheduledProcedureStepID)SH=<0>NULL
      da2.Add($0040, $0010); //(ScheduledStationName)SH=<0>NULL

      Add( $0040, $0252 );
      if (Trim(teSTATUS.Text) <> '') then
        Add( $0040, $0252 ).AsString[0] := teSTATUS.Text;
      
      Add($0040, $1001); //(RequestedProcedureID)SH=<0>NULL
    end;

    mdWorklist.DisableControls;
    try
      mdWorklist.Open;
      mdWorklist.First;
      while not mdWorklist.Eof do begin mdWorklist.Delete; mdWorklist.Next; end;
      mdWorklist.Close; mdWorklist.Open;

      if CnsDicomConnection1.C_MWL(das) then
      begin
        if CnsDicomConnection1.ReceiveDatasets.Count > 0 then
        begin 
          for i := 0 to CnsDicomConnection1.ReceiveDatasets.Count - 1 do
          begin
            das := CnsDicomConnection1.ReceiveDatasets[i];
            ds_sav(das,nil,nil,'.records');
            mdWorklist.Insert;

          //  vStrTmp := das.GetString( $0040, $0003 );

            // Patient's Name (0010,0010) Patient's full legal name.
            mdWorklist.FieldByName('P_ENAME').AsString    := das.GetString($0010, $0010); //(PatientName)PN=<0>NULL
            // Patient ID (0010,0020) Primary hospital identification number or code for the patient.
            mdWorklist.FieldByName('P_PID').AsString      := das.GetString($0010, $0020); //(PatientID)LO=<1>
            // (AccessionNumber)SH=<0>NULL
            mdWorklist.FieldByName('ACCESSIONNUMBER').AsString      := das.GetString( $0008, $0050 );
            // Add($0010, $0030); (PatientBirthDate)DA=<0>NULL
            mdWorklist.FieldByName('P_DATEBORN').AsString      := das.GetString( $0010, $0030 );
            // Patient's Sex (0010,0040) Sex of the named Patient. Enumerated Values:
            // M = male F = female O = other
            mdWorklist.FieldByName('P_SEX').AsString      := das.GetString($0010, $0040); //(PatientSex)CS=<0>NULL
            // STUDYUID         CHAR(80),     Add($0020, $000D); //(StudyInstanceUID)UI=<0>NULL
            mdWorklist.FieldByName('STUDYUID').AsString      := das.GetString( $0020, $000D );  //(StudyInstanceUID)UI=<0>NULL
            // Performed Procedure Step Status (0040,0252) Contains the state of the Performed Procedure Step.
            // Enumerated Values: IN PROGRESS = Started but not complete DISCONTINUED = Canceled or unsuccessfully terminated COMPLETED = Successfully completed
            // cWorklistStateInProgress = 'IN PROGRESS';
            // cWorklistStateDiscounted = 'DISCONTINUED';
            // cWorklistStateCompleted  = 'COMPLETED';
            mdWorklist.FieldByName('STATUS').AsString       := das.GetString( $0040, $0252 );
            //(ScheduledProcedureStepSequence)SQ=<1>Sequence Data
            vDicomAttribute:=das.Item[ $0040, $0100 ];
            for j := 0 to vDicomAttribute.GetCount - 1 do //
            begin
              da2:=vDicomAttribute.Attributes[j];
              if Assigned(da2.Item[ $0040, $0001 ]) then
                mdWorklist.FieldByName('StationAETitle').AsString := da2.GetString( $0040, $0001 ); // (ScheduledStationAETitle)AE=<1>HBLB
              // (ScheduledProcedureStepStartDate)DA=<1>2004-9-23
              if Assigned(da2.Item[ $0040, $0002 ]) then
              begin
                dd := da2.Item[ $0040, $0002 ];
                mdWorklist.FieldByName('StartDateWorklist').AsString:= DateToStr( dd.AsDatetime[0] );
                mdWorklist.FieldByName('EndDateWorklist').AsString:= DateToStr( dd.AsDatetime[1] );
              end;
              //
              if Assigned(das.Item[ $0040, $0003 ]) then
              begin
                dd1 := da2.Item[ $0040, $0003 ];
                mdWorklist.FieldByName('StepStartTime').AsString    := IntToStr(HourOf( dd1.AsDatetime[0]))+':'+IntToStr(MinuteOf( dd1.AsDatetime[0]));
                mdWorklist.FieldByName('StepFinishTime').AsString   := IntToStr(HourOf( dd1.AsDatetime[1]))+':'+IntToStr(MinuteOf( dd1.AsDatetime[1]));
              end;
              //
              mdWorklist.FieldByName('Modality').AsString         := da2.GetString( $0008, $0060 );
              mdWorklist.FieldByName('PhysiciansName').AsString   := da2.GetString( $0040, $0006 ); //(ScheduledPerformingPhysiciansName)PN=<0>NULL
              mdWorklist.FieldByName('StepDescription').AsString  := da2.GetString( $0040, $0007 ); //(ScheduledProcedureStepDescription)LO=<0>NULL
              mdWorklist.FieldByName('StepID').AsString           := da2.GetString( $0040, $0009 ); //(ScheduledProcedureStepID)SH=<0>NULL
              mdWorklist.FieldByName('StationName').AsString      := da2.GetString( $0040, $0010 ); //(ScheduledStationName)SH=<0>NULL
              // !!! доделать
              Break; // потом доделать чтение списка аттрибутов - сейчас только один будет читаться - для отладки
            end;
            mdWorklist.FieldByName('ProcedureID').AsString        := das.GetString( $0040, $1001 ); // Requested Procedure ID (0040,1001) O 1
            mdWorklist.FieldByName('ProcDescription').AsString    := das.GetString( $0032, $1060 ); // The Requested Procedure Description
            //  Requested Procedure Priority (0040,1003) Requested Procedure Type Urgency. Defined
            //  Terms are: STAT, HIGH, ROUTINE, MEDIUM, LOW
            mdWorklist.FieldByName('ProcPriority').AsString       := das.GetString( $0040,$1003 );
            {
            // PERFORMED PROCEDURE STEP INFORMATION MODULE ATTRIBUTES
            // Performed Station AE Title (0040,0241) AE title of the modality on which the Performed Procedure Step was performed.
            das1.AddVariant($0040, $0241, edStationAETitle.Text); // Performed Station AE Title:
            // Performed Station Name (0040,0242) An institution defined name for the modality on which the Performed Procedure Step was performed.
            das1.AddVariant($0040, $0242, edStationName.Text); // Performed Station Name:
            // Performed Location (0040,0243) Description of the location at which the Performed Procedure Step was performed
            das1.AddVariant($0040, $0243, edLocation.Text); // Performed Location:
            // Performed Procedure Step Start Date (0040,0244) Date on which the Performed Procedure Step started.
            das1.Add($0040, $0244).asDatetime[0] := now; // Performedprocedure Step Start: 2008 - 1 - 11
            // Performed Procedure Step Start Time (0040,0245) Time at which the Performed Procedure Step started.
            das1.Add($0040, $0245).asDatetime[0] := now; // Performed procedure Step Start: ?? 10: 05: 59
            // Performed Procedure Step End Date (0040,0250) Date on which the Performed Procedure Step ended.
            das1.Add($040, $0250); // Performed Procedure Step End D:
            // Performed Procedure Step End Time (0040,0251) Time at which the Performed Procedure Step ended.
            das1.Add($0040, $0251); // Performed Procedure Step End T:
            // Performed Procedure Step Status (0040,0252) Contains the state of the Performed Procedure Step.
            // Enumerated Values: IN PROGRESS = Started but not complete DISCONTINUED = Canceled or unsuccessfully terminated COMPLETED = Successfully completed
            // cWorklistStateInProgress = 'IN PROGRESS';
            // cWorklistStateDiscounted = 'DISCONTINUED';
            // cWorklistStateCompleted  = 'COMPLETED';
            das1.AddVariant($0040, $0252, cWorklistStateCompleted ); 
            // Performed Procedure Step ID (0040,0253) User or equipment generated identifier of that part of a Procedure that has been carried out within this step.
            das1.AddVariant($0040, $0253, 1); // Performed procedure Step ID: 1
            // Performed Procedure Step Description (0040,0254) Institution-generated description or classification of the Procedure Step that was performed.
            das1.AddVariant($0040, $0254, edPPSD.Text);
            // Performed procedure Step Descr:
            das1.AddVariant($0040, $0255, edPPDT.Text);
            // Performed procedure type Descr:
            da1 := das1.Add($0040, $0260);
// !!!            // Comments on the Performed Procedure Step (0040,0280) User-defined comments on the Performed Procedure Step.
// !!!            // Performed Procedure Type Description (0040,0255) A description of the type of procedure performed.
            }
            mdWorklist.Post;
          end;
        end
        else
          MessageDlg('Данных нет', mtWarning, [mbOK], 0);
        CnsDicomConnection1.Clear;
        CnsDicomConnection1.Disconnect;
      end
      else
        MessageDlg('Ошибка WORKLIST сервера ...', mtError, [mbOK], 0);
    finally
      mdWorklist.EnableControls;
    end;
  finally
    CnsDicomConnection1.Free;
  end;

end;

procedure TfrmMain.aChangeStatusWorklistExecute(Sender: TObject);
begin // aChangeStatusWorklist Изменить статус исследования в Worklist
  if not mdWorklist.Eof then
    EdtWLForm.ShowWLForm(2); // Изменить статус назначения
end;

procedure TfrmMain.aDeleteWorklistExecute(Sender: TObject);
var da1 : TDicomAttributes;
    CnsDicomConnection1 : TCnsDicomConnection;
begin  // aDeleteWorklist Удалить назначение из Worklist
  if (cxGrid2DBTableView1.DataController.Controller.SelectedRecordCount=1)
  then
    if mdWorklist.FieldByName('STUDYUID').AsString='' then
      MessageDlg('Не задан UID исследования ...', mtWarning, [mbOK], 0)
    else
      if MessageDlg('Удалить назначение ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
      then
      begin
        da1 := TDicomAttributes.Create;
        da1.Add($0020, $000D); // STUDYUID
        if (Trim(mdWorklist.FieldByName('STUDYUID').AsString)<>'') then
          da1.Add($0020, $000D).AsString[0] := Trim(mdWorklist.FieldByName('STUDYUID').AsString)
        else
          da1.Add($0020, $000D);
        //
        CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
        try
          CnsDicomConnection1.v_is_log := v_LOGWorklist;
          CnsDicomConnection1.v_log_filename := ExtractFilePath(paramstr(0))+'N_DELETE.log';
          CnsDicomConnection1.Host := frmMain.teIPWORKLIST.Text;
          CnsDicomConnection1.Port := StrToInt(frmMain.tePortWORKLIST.Text);
          CnsDicomConnection1.CalledTitle := frmMain.teAEWORKLIST.Text;
          CnsDicomConnection1.CallingTitle := LocAE;

          CnsDicomConnection1.ReceiveTimeout := 1000000;
          CnsDicomConnection1.addPresentationContext(ModalityWorklistInformationModelFIND);
          CnsDicomConnection1.addPresentationContext(ModalityPerformedProcedureStep);
          CnsDicomConnection1.addPresentationContext(ModalityPerformedProcedureStepRetrieve);
          CnsDicomConnection1.addPresentationContext(ModalityPerformedProcedureStepNotification);
          if CnsDicomConnection1.N_DELETE(ModalityPerformedProcedureStep, gt_uniq_str, da1)
          then
            MessageDlg('Назначение удалено ...', mtWarning, [mbOK], 0)
          else
            ShowMessage('ERROR');
        finally
          CnsDicomConnection1.Free;
          //das1.Free;
        end;


      end;
end;

procedure TfrmMain.aDispWorklistExecute(Sender: TObject);
begin // aDispWorklist Просмотр информации по назначению
  if not mdWorklist.Eof then
    EdtWLForm.ShowWLForm(0); // Просмотр информации по назначению
end;

procedure TfrmMain.aCreateWorklistExecute(Sender: TObject);
begin //aCreateWorklist Добавить назначение в Worklist
  EdtWLForm.ShowWLForm(1); // добавить назначания
end;

// проверка утечек памяти
//initialization
//  ReportMemoryLeaksOnShutdown := True;
end.
