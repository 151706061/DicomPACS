unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinCaramel,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxSplitter,
  ExtCtrls, Menus, cxLookAndFeelPainters, cxContainer, cxLabel, StdCtrls,
  cxButtons, Oracle, jvDBUtils, JclFileUtils,
  OracleData, cxCalendar, cxGroupBox, cxButtonEdit, ActnList, ImgList, cxDropDownEdit,
  cxTextEdit, cxMaskEdit, cxTimeEdit, cxPC, cxImage, TAPI3Lib_TLB, uPhone,
  cxImageComboBox, IniFiles, cxStyles, cxBlobEdit, JvComponentBase,
  JvAppStorage, JvAppXMLStorage, cxSpinEdit, dxmdaset, cxCheckBox, dxSkinCoffee,
  dxSkinOffice2007Green, cxMemo, StrUtils, ShellAPI, OoMisc, AdVoIP;

const
  wm_new = wm_user + 103;

type
  TKey = record
    key: string;
    synonym: string;
    action:TAction;
    raion:Variant;
    shift:Boolean;
    alt:boolean;
    ctrl:boolean;
  end;
  TfrmMain = class(TForm)
    paTop: TPanel;
    grJournal: TcxGrid;
    tvJournal: TcxGridDBTableView;
    grJournalLevel1: TcxGridLevel;
    paButtons: TPanel;
    os: TOracleSession;
    dsJur: TDataSource;
    odsJur: TOracleDataSet;
    VJOURNAL_DATEIN: TcxGridDBColumn;
    VJOURNAL_NUMTEL: TcxGridDBColumn;
    VJOURNAL_FROM: TcxGridDBColumn;
    VJOURNAL_KUDA: TcxGridDBColumn;
    dsHis: TDataSource;
    odsHis: TOracleDataSet;
    AL: TActionList;
    IL: TImageList;
    odsCost: TOracleDataSet;
    odsKolvoMin: TOracleDataSet;
    VJOURNAL_FICS: TcxGridDBColumn;
    VJOURNAL_DRV: TcxGridDBColumn;
    VJOURNAL_SUM: TcxGridDBColumn;
    odsStops: TOracleDataSet;
    colSos: TcxGridDBColumn;
    aOtmena: TAction;
    odsJurFK_ID: TFloatField;
    odsJurFD_DATEIN: TDateTimeField;
    odsJurFC_ADR1: TStringField;
    odsJurFC_ADR2: TStringField;
    odsJurFN_SOS: TIntegerField;
    odsJurFC_PHONE: TStringField;
    odsJurFK_CLIENTID: TFloatField;
    odsJurFD_DATEF_STR: TStringField;
    odsJurFD_DATEF: TDateTimeField;
    odsJurFD_DATER: TDateTimeField;
    odsJurFC_NUM: TStringField;
    odsJurFC_KOD: TStringField;
    odsJurFN_KM1: TFloatField;
    odsJurFN_KM2: TFloatField;
    odsJurFL_BONUS: TIntegerField;
    odsJurSUM_RAS: TFloatField;
    odsJurFN_TIME: TFloatField;
    odsJurFN_STOP: TIntegerField;
    odsJurNUMDRV: TStringField;
    odsJurJURNUM: TStringField;
    odsJurFK_DRVID: TFloatField;
    odsJurFL_PEREGON: TIntegerField;
    odsJurFL_BAGAGE: TIntegerField;
    cxSplitter1: TcxSplitter;
    odsJurFN_NOW: TFloatField;
    odsJurFN_BONUS: TFloatField;
    odsJurFC_ADR: TStringField;
    odsJurFL_NEOPL: TIntegerField;
    tAlarm: TTimer;
    tShAlarm: TTimer;
    odsJurFL_ISSTOP: TIntegerField;
    aSetDrv: TAction;
    aAdr2: TAction;
    aFics: TAction;
    aSetFactSum: TAction;
    pmGrid: TPopupMenu;
    N1: TMenuItem;
    aCalculate: TAction;
    odsJurFK_ADRID: TFloatField;
    VJOURNAL_IMAGE: TcxGridDBColumn;
    ilImage: TcxImageList;
    odsJurFL_SOS: TIntegerField;
    odsJurNAMEDRV: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    imAdr: TcxImage;
    bNumAb: TcxButton;
    bKod: TcxButton;
    bHomeAdr: TcxButton;
    bSetHome: TcxButton;
    Panel3: TPanel;
    pcOptions: TcxPageControl;
    tsMain: TcxTabSheet;
    grHis: TcxGrid;
    TVHIS: TcxGridDBTableView;
    VHIS_FROM: TcxGridDBColumn;
    VHIS_KUDA: TcxGridDBColumn;
    VHIS_MAR: TcxGridDBColumn;
    grHisLevel1: TcxGridLevel;
    tsKm: TcxTabSheet;
    cxButton13: TcxButton;
    teNum: TcxTextEdit;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    tsDopTime: TcxTabSheet;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    tsFactOpl: TcxTabSheet;
    cxLabel6: TcxLabel;
    teFactSum: TcxTextEdit;
    cxButton45: TcxButton;
    odsJurDRVPHONE: TStringField;
    aCopy: TAction;
    aBagage: TAction;
    VJOURNAL_DOZVON: TcxGridDBColumn;
    odsJurFK_RAIONID: TFloatField;
    odsJurFK_ADR1ID: TFloatField;
    odsJurFK_ADR2ID: TFloatField;
    odsFindDrv: TOracleDataSet;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    stRep: TcxStyleRepository;
    stSelected: TcxStyle;
    colSos2: TcxGridDBColumn;
    tWrong: TTimer;
    VJOURNAL_NAMEDRV: TcxGridDBColumn;
    stNameDrv: TcxStyle;
    odsJurFL_PRED: TFloatField;
    AppStorage: TJvAppXMLFileStorage;
    odsJurNUMDRV1: TStringField;
    odsJurNUMDRV2: TStringField;
    tTimeAlarm: TTimer;
    odsJurFD_DATEF_CHR: TStringField;
    odsJurFN_SOS2: TIntegerField;
    odsJurFL_DOZVON: TIntegerField;
    odsJurFC_ADR2_DETAIL: TStringField;
    odsJurFC_DOP2_DETAIL: TStringField;
    odsJurFC_ADR1_DETAIL: TStringField;
    odsJurFC_DOP1_DETAIL: TStringField;
    odsJurFC_STREET_DETAIL: TStringField;
    odsJurFC_STREET1_DETAIL: TStringField;
    odsJurFL_ISDOWNSLASH_DETAIL: TIntegerField;
    odsJurFK_IDADR1_DETAIL: TFloatField;
    odsJurFK_IDADR2_DETAIL: TFloatField;
    odsJurFC_HOUSE_DETAIL: TStringField;
    odsJurFC_HOUSELITER_DETAIL: TStringField;
    odsJurFC_HALL_DETAIL: TStringField;
    odsJurFC_ADR_PLACE: TStringField;
    tRefresh: TTimer;
    odsIsRefresh: TOracleDataSet;
    oqUpdKeyRefresh: TOracleQuery;
    tsBagage: TcxTabSheet;
    cxLabel3: TcxLabel;
    bBagage: TcxButton;
    bOtmenaBagage: TcxButton;
    odsJurFC_HOUSEFRACTION: TStringField;
    odsDetailAdrHome: TOracleDataSet;
    cxLabel5: TcxLabel;
    lbNumTrip: TcxLabel;
    cxLabel1: TcxLabel;
    bBonus: TcxButton;
    VJOURNAL_EDITFICS: TcxGridDBColumn;
    colIsStop: TcxGridDBColumn;
    odsJurFL_BAGAGE_REAL: TIntegerField;
    aEditZakaz: TAction;
    odsDetailAdr1: TOracleDataSet;
    odsDetailAdr2: TOracleDataSet;
    vJournal_ID: TcxGridDBColumn;
    vJournal_DrvId1: TcxGridDBColumn;
    vJournal_Adr2Id: TcxGridDBColumn;
    vJournal_DrvId2: TcxGridDBColumn;
    odsJurFK_DRVID2: TFloatField;
    colFl_Baggage: TcxGridDBColumn;
    vJournal_JurNum: TcxGridDBColumn;
    vJournal_FcNum: TcxGridDBColumn;
    vJournal_FlBonus: TcxGridDBColumn;
    vJournal_FkClientid: TcxGridDBColumn;
    vJournal_FnNow: TcxGridDBColumn;
    vJournal_FnStop: TcxGridDBColumn;
    vJournal_FlPeregon: TcxGridDBColumn;
    colKm1: TcxGridDBColumn;
    colKm2: TcxGridDBColumn;
    colTime: TcxGridDBColumn;
    odsJurFC_PHONE_FULL: TStringField;
    odsJurFD_STOP: TDateTimeField;
    vJournal_FdStop: TcxGridDBColumn;
    aAdr1: TAction;
    aInfo: TAction;
    VJOURNAL_SETADR1: TcxGridDBColumn;
    VJOURNAL_SETADR2: TcxGridDBColumn;
    VJOURNAL_SETDRV: TcxGridDBColumn;
    VJOURNAL_SETSUM: TcxGridDBColumn;
    odsJurFD_STOP_CHR: TStringField;
    VJOURNAL_SETNUMTEL: TcxGridDBColumn;
    odsJurFD_DATEIN_CHR: TStringField;
    vJournal_NumDrv1: TcxGridDBColumn;
    vJournal_NumDrv2: TcxGridDBColumn;
    aStopClient: TAction;
    aStopDrv: TAction;
    aContinue: TAction;
    N5: TMenuItem;
    IL4All: TcxImageList;
    nContinue: TMenuItem;
    vJournal_NumTelFull: TcxGridDBColumn;
    aRefresh: TAction;
    aTab: TAction;
    odsKeys: TOracleDataSet;
    tmKeys: TTimer;
    vJournal_FkRaionID: TcxGridDBColumn;
    VJOURNAL_FkTypeDetail: TcxGridDBColumn;
    odsJurFK_TYPE_DETAIL: TFloatField;
    aFind: TAction;
    aAddTime: TAction;
    odsJurFN_TIME_TRIP: TFloatField;
    cxLabel8: TcxLabel;
    lbDrv: TcxLabel;
    cxLabel19: TcxLabel;
    seAddTime: TcxSpinEdit;
    bSaveAddTime: TcxButton;
    seAddTime1: TcxSpinEdit;
    bClearTime: TcxButton;
    cxLabel21: TcxLabel;
    teFics: TcxTimeEdit;
    bSaveFics: TcxButton;
    bDelFics: TcxButton;
    odsSysDate: TOracleDataSet;
    cxLabel22: TcxLabel;
    lbTimeRas: TcxLabel;
    odsJurFD_DATER_STR: TStringField;
    cxLabel23: TcxLabel;
    lbSumR: TcxLabel;
    odsJurFN_SUMR: TFloatField;
    odsJurFN_SUMF: TFloatField;
    cxLabel24: TcxLabel;
    seSumF: TcxSpinEdit;
    bSaveSumF: TcxButton;
    bDelSumF: TcxButton;
    colSetFics: TcxGridDBColumn;
    bSaveKM: TcxButton;
    bCancelKm: TcxButton;
    bSaveTime: TcxButton;
    bCancelTime: TcxButton;
    bClearDopTime: TcxButton;
    bClearKM: TcxButton;
    bSaveFact: TcxButton;
    bCancelFact: TcxButton;
    nStopDrv: TMenuItem;
    nStopClt: TMenuItem;
    cxLabel18: TcxLabel;
    cxLabel25: TcxLabel;
    seStopDrv: TcxSpinEdit;
    seStopClt: TcxSpinEdit;
    bSaveStopDrv: TcxButton;
    bDelStopDrv: TcxButton;
    bSaveStopClt: TcxButton;
    bDelStopClt: TcxButton;
    stCapValue: TcxStyle;
    tShowRemark: TTimer;
    cxLabel26: TcxLabel;
    teNumKm: TcxTextEdit;
    bSaveKm1: TcxButton;
    bClearKm1: TcxButton;
    stError: TcxStyle;
    aAddZakaz: TAction;
    stSum: TcxStyle;
    stDefault: TcxStyle;
    memDataLast: TdxMemData;
    memDataLastNumDrv: TStringField;
    memDataLastRasSum: TIntegerField;
    memDataLastDateSys: TDateField;
    dsLast: TDataSource;
    tColorError: TTimer;
    odsLine: TOracleDataSet;
    N2: TMenuItem;
    nAddTime: TMenuItem;
    N3: TMenuItem;
    nKM: TMenuItem;
    nSumFact: TMenuItem;
    stOk: TcxStyle;
    odsHisLuxury: TOracleDataSet;
    cbPeregon: TcxCheckBox;
    cbNeopl: TcxCheckBox;
    memDataLastFics: TdxMemData;
    StringField1: TStringField;
    DateField1: TDateField;
    dsLastFics: TDataSource;
    VHIS_SOS: TcxGridDBColumn;
    paAllButtons: TPanel;
    Panel6: TPanel;
    teVvod: TcxTextEdit;
    bActionsR: TcxButton;
    N6: TMenuItem;
    aActions: TAction;
    aSysInfo: TAction;
    aContinueStop: TAction;
    aSetFics: TAction;                                        
    aPredZakaz: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    aComeBack: TAction;
    N10: TMenuItem;
    N9: TMenuItem;
    odsJurFN_SOS_PREV: TFloatField;
    colSumF: TcxGridDBColumn;
    N11: TMenuItem;
    aCallClient: TAction;
    aCallDriver: TAction;
    N12: TMenuItem;
    N13: TMenuItem;
    aKM: TAction;
    nSumCall: TMenuItem;
    aCallClient2: TAction;
    aCallDriver2: TAction;
    N21: TMenuItem;
    N14: TMenuItem;
    stInfo: TcxStyle;
    cxSplitter2: TcxSplitter;
    aContinueRas: TAction;
    N15: TMenuItem;
    bChange: TcxButton;
    aChange: TAction;
    pcButtons: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    bAddZakaz: TcxButton;
    bInfo: TcxButton;
    cxButton3: TcxButton;
    bAlarm: TcxButton;
    cxButton16: TcxButton;
    bDriverStop: TcxButton;
    bPeregruz: TcxButton;
    bClientStop: TcxButton;
    bKM: TcxButton;
    bContinueStop: TcxButton;
    bFact: TcxButton;
    grF: TcxGrid;
    tvLastF: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    grRas: TcxGrid;
    tvLast: TcxGridDBTableView;
    tvLastNumDrv: TcxGridDBColumn;
    tvLastSumRas: TcxGridDBColumn;
    grRasLevel1: TcxGridLevel;
    cxLabel20: TcxLabel;
    seBaggage: TcxSpinEdit;
    bSaveBaggage: TcxButton;
    bDelBaggage: TcxButton;
    odsJurFC_COMMENT: TStringField;
    colCommentBut: TcxGridDBColumn;
    tsComment: TcxTabSheet;
    cxLabel27: TcxLabel;
    bSaveComment: TcxButton;
    bCancelComment: TcxButton;
    memComment: TcxMemo;
    colComment: TcxGridDBColumn;
    VHIS_DATE: TcxGridDBColumn;
    odsJurFL_FREE: TFloatField;
    cbFree: TcxCheckBox;
    cxLabel28: TcxLabel;
    seSumFMG: TcxSpinEdit;
    bSaveSumFMG: TcxButton;
    bDelSumFMG: TcxButton;
    odsJurFN_SUMFMG: TFloatField;
    cxLabel7: TcxLabel;
    teFactSumMG: TcxTextEdit;
    cxButton1: TcxButton;
    colSumFMG: TcxGridDBColumn;
    colStopReal: TcxGridDBColumn;
    odsJurFL_STOP_REAL: TIntegerField;
    aPredRas: TAction;
    odsKolvoMinPred: TOracleDataSet;
    colFree: TcxGridDBColumn;
    bClosetsBag: TcxButton;
    nNotExit: TMenuItem;
    aNotExit: TAction;
    odsCost4Vih: TOracleDataSet;
    lbState: TcxLabel;
    bDelDrv: TcxButton;
    bDelRas: TcxButton;
    mSend: TMenuItem;
    tNeedRefresh: TTimer;
    colFreeShow: TcxGridDBColumn;
    aLastSum: TAction;
    N4: TMenuItem;
    nSms: TMenuItem;
    odsJurFC_PREFFIX: TStringField;
    colSetAdr2: TcxGridDBColumn;
    pmRaion: TPopupMenu;
    bTop: TcxButton;
    bSetRasNow: TcxButton;
    odsKolvoMinNow: TOracleDataSet;
    colSMS: TcxGridDBColumn;
    odsJurFL_SMS: TIntegerField;
    cxLabel2: TcxLabel;
    lbCntZ: TcxLabel;
    odsCntJur: TOracleDataSet;
    memDataLastJurID: TIntegerField;
    memDataLastFicsTimeFics: TStringField;
    bPen: TcxButton;
    aPenalty: TAction;
    tsPenalty: TcxTabSheet;
    cxLabel9: TcxLabel;
    sePenalty: TcxSpinEdit;
    bClearPenalty: TcxButton;
    bSavePenalty: TcxButton;
    bCancelPenalty: TcxButton;
    lbPenNum: TcxLabel;
    odsJurFL_TALON: TIntegerField;
    cbTalon: TcxCheckBox;
    colTalon: TcxGridDBColumn;
    odsCostOrg: TOracleDataSet;
    colAdr1ID: TcxGridDBColumn;
    colIsTalon: TcxGridDBColumn;
    aContinueRasMG: TAction;
    N16: TMenuItem;
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure odsJurAfterScroll(DataSet: TDataSet);
    procedure bBonusClick(Sender: TObject);
    procedure VHIS_MARPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure TVHISCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvJournalCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvJournalGetCellHeight(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);
    procedure teNumPropertiesChange(Sender: TObject);
    procedure odsJurBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure tvJournalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bNumAbClick(Sender: TObject);
    procedure bKodClick(Sender: TObject);
    procedure bHomeAdrClick(Sender: TObject);
    procedure teFactSumPropertiesChange(Sender: TObject);
    procedure tAlarmTimer(Sender: TObject);
    procedure aSetDrvExecute(Sender: TObject);
    procedure aAdr2Execute(Sender: TObject);
    procedure aFicsExecute(Sender: TObject);
    procedure aSetFactSumExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure aCalculateExecute(Sender: TObject);
    procedure bSetHomeClick(Sender: TObject);
    procedure bDopFuncClick(Sender: TObject);
    procedure aCopyExecute(Sender: TObject);
    procedure aOtmenaExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tWrongTimer(Sender: TObject);
    procedure tTimeAlarmTimer(Sender: TObject);
    procedure cxButton46MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure VJOURNAL_DOZVONPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton45MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tRefreshTimer(Sender: TObject);
    procedure VJOURNAL_EDITFICSPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure bBagageClick(Sender: TObject);
    procedure bOtmenaBagageClick(Sender: TObject);
    procedure aEditZakazExecute(Sender: TObject);
    procedure teVvodPropertiesChange(Sender: TObject);
    procedure aAdr1Execute(Sender: TObject);
    procedure tvJournalKeyPress(Sender: TObject; var Key: Char);
    procedure aInfoExecute(Sender: TObject);
    procedure VJOURNAL_SETADR1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure VJOURNAL_SETADR2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure VJOURNAL_SETDRVPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure VJOURNAL_SETSUMPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure VJOURNAL_SETNUMTELPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure aStopDrvExecute(Sender: TObject);
    procedure aStopClientExecute(Sender: TObject);
    procedure aContinueExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aTabExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tmKeysTimer(Sender: TObject);
    procedure aFindExecute(Sender: TObject);
    procedure aAddTimeExecute(Sender: TObject);
    procedure bbKmClick(Sender: TObject);
    procedure bbPeregruzClick(Sender: TObject);
    procedure lbDrvMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbDrvMouseLeave(Sender: TObject);
    procedure lbDrvClick(Sender: TObject);
    procedure seAddTimePropertiesChange(Sender: TObject);
    procedure bSaveAddTimeClick(Sender: TObject);
    procedure seAddTime1PropertiesChange(Sender: TObject);
    procedure bClearTimeClick(Sender: TObject);
    procedure teFicsPropertiesChange(Sender: TObject);
    procedure bSaveFicsClick(Sender: TObject);
    procedure bDelFicsClick(Sender: TObject);
    procedure seAddTime1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure teFicsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure seAddTimeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bDelSumFClick(Sender: TObject);
    procedure bSaveSumFClick(Sender: TObject);
    procedure seSumFPropertiesChange(Sender: TObject);
    procedure seSumFKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure vJournal_SetFPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure teNumKeyPress(Sender: TObject; var Key: Char);
    procedure teNumClick(Sender: TObject);
    procedure teNumEnter(Sender: TObject);
    procedure teNumExit(Sender: TObject);
    procedure cxButton13Click(Sender: TObject);
    procedure bSaveKMClick(Sender: TObject);
    procedure bCancelKmClick(Sender: TObject);
    procedure teNumKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bSaveTimeClick(Sender: TObject);
    procedure bCancelTimeClick(Sender: TObject);
    procedure bClearDopTimeClick(Sender: TObject);
    procedure bClearKMClick(Sender: TObject);
    procedure bSaveFactClick(Sender: TObject);
    procedure bCancelFactClick(Sender: TObject);
    procedure nStopDrvClick(Sender: TObject);
    procedure nStopCltClick(Sender: TObject);
    procedure teFactSumKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure teFactSumKeyPress(Sender: TObject; var Key: Char);
    procedure bDelStopDrvClick(Sender: TObject);
    procedure bDelStopCltClick(Sender: TObject);
    procedure seStopDrvPropertiesChange(Sender: TObject);
    procedure seStopCltPropertiesChange(Sender: TObject);
    procedure seStopDrvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bSaveStopDrvClick(Sender: TObject);
    procedure bSaveStopCltClick(Sender: TObject);
    procedure seStopCltKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tShowRemarkTimer(Sender: TObject);
    procedure bClearKm1Click(Sender: TObject);
    procedure bSaveKm1Click(Sender: TObject);
    procedure teNumKmClick(Sender: TObject);
    procedure teNumKmEnter(Sender: TObject);
    procedure teNumKmExit(Sender: TObject);
    procedure teNumKmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure teNumKmKeyPress(Sender: TObject; var Key: Char);
    procedure teNumKmPropertiesChange(Sender: TObject);
    procedure aAddZakazExecute(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure nAddTimeClick(Sender: TObject);
    procedure teVvodKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tColorErrorTimer(Sender: TObject);
    procedure nKMClick(Sender: TObject);
    procedure teFicsEnter(Sender: TObject);
    procedure teFicsClick(Sender: TObject);
    procedure teFicsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure nSumFactClick(Sender: TObject);
    procedure bbFicsClick(Sender: TObject);
    procedure cbPeregonPropertiesChange(Sender: TObject);
    procedure cbNeoplPropertiesChange(Sender: TObject);
    procedure TVHISCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cxSplitter1BeforeOpen(Sender: TObject; var NewSize: Integer;
      var AllowOpen: Boolean);
    procedure cxSplitter1BeforeClose(Sender: TObject; var AllowClose: Boolean);
    procedure bPeregruzClick(Sender: TObject);
    procedure bDriverStopClick(Sender: TObject);
    procedure bClientStopClick(Sender: TObject);
    procedure aActionsExecute(Sender: TObject);
    procedure aSysInfoExecute(Sender: TObject);
    procedure aContinueStopExecute(Sender: TObject);
    procedure aSetFicsExecute(Sender: TObject);
    procedure aPredZakazExecute(Sender: TObject);
    procedure aComeBackExecute(Sender: TObject);
    procedure aCallClientExecute(Sender: TObject);
    procedure aCallDriverExecute(Sender: TObject);
    procedure aKMExecute(Sender: TObject);
    procedure nSumCallClick(Sender: TObject);
    procedure aCallClient2Execute(Sender: TObject);
    procedure aCallDriver2Execute(Sender: TObject);
    procedure cxSplitter2BeforeClose(Sender: TObject; var AllowClose: Boolean);
    procedure cxSplitter2BeforeOpen(Sender: TObject; var NewSize: Integer;
      var AllowOpen: Boolean);
    procedure aContinueRasExecute(Sender: TObject);
    procedure aChangeExecute(Sender: TObject);
    procedure seBaggageKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure seBaggagePropertiesChange(Sender: TObject);
    procedure bSaveBaggageClick(Sender: TObject);
    procedure bDelBaggageClick(Sender: TObject);
    procedure bCancelCommentClick(Sender: TObject);
    procedure colCommentPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure bSaveCommentClick(Sender: TObject);
    procedure memCommentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbFreePropertiesChange(Sender: TObject);
    procedure seSumFMGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure seSumFMGPropertiesChange(Sender: TObject);
    procedure bSaveSumFMGClick(Sender: TObject);
    procedure bDelSumFMGClick(Sender: TObject);
    procedure teFactSumMGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure teFactSumMGKeyPress(Sender: TObject; var Key: Char);
    procedure teFactSumMGPropertiesChange(Sender: TObject);
    procedure cxButton1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure aPredRasExecute(Sender: TObject);
    procedure odsJurAfterOpen(DataSet: TDataSet);
    procedure bClosetsBagClick(Sender: TObject);
    procedure aNotExitExecute(Sender: TObject);
    procedure bBagageKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bOtmenaBagageKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bDelDrvClick(Sender: TObject);
    procedure bDelRasClick(Sender: TObject);
    procedure tNeedRefreshTimer(Sender: TObject);
    procedure aLastSumExecute(Sender: TObject);
    procedure nSmsClick(Sender: TObject);
    procedure colSetAdr2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure bTopClick(Sender: TObject);
    procedure bSetRasNowClick(Sender: TObject);
    procedure odsCntJurBeforeOpen(DataSet: TDataSet);
    procedure tvLastCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure aPenaltyExecute(Sender: TObject);
    procedure sePenaltyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sePenaltyPropertiesChange(Sender: TObject);
    procedure bClearPenaltyClick(Sender: TObject);
    procedure bCancelPenaltyClick(Sender: TObject);
    procedure bSavePenaltyClick(Sender: TObject);
    procedure cbTalonPropertiesChange(Sender: TObject);
    procedure aContinueRasMGExecute(Sender: TObject);
  private
    FKeys : array of TKey;
    RowId : Integer;
    isMyCallToClient : Boolean; // Я делаю звонок или нет (true = я)
    sGlobalPhone, sGlobalPhone2 : string; // Номер телефона диспетчера
    sGlobalPhones : string; // все остальные внутренние номера телефонов
    intTimer : Integer;
    flStopClientPer : Double; // Остановка по просьбе клиента, процент
    flBagage : Double; // Процент за перегруз, багаж
    intKolvoBonusMin : Integer; // Кол-во бесплатных минут по бонусной поездке
    intPeregon : Integer;
    intMin : Integer; // Минималка
    intKolvoPredMin : Integer;
    pSotrFIO : string; // ФИО диспетчера - в caption главной формы
    pTaxiName : string; // Название такси - в caption главной формы
    JurID, JurID2 : Integer; // при отзвоне запоминается позиция
    s1, s2 : string; // при отзвоне запоминается номер телефона
    procedure DoItogo(nType, nJurID, nStop, nPeregon : Integer; nKm1, nKm2 : Double; nTime, isStop, isTalon, nAdr1ID : Integer; sNumDrv : string = '');
    procedure DoItogoPred(nJurID, nStop, nPeregon : Integer; nKm1, nKm2 : Double; nTime, isStop, nCntBag, nTimeStopDrv, nTimeStopClt, isTalon : Integer;
                          sNumDrv : string = '');
    procedure DoItogoBonus(nJurID : Integer; dStop : string);
    procedure OnOffering(const S: string); // поступил звонок
    procedure OnConnected(const S: string); // подняли трубку
    procedure OnDisconected(const S: string); // положили трубку (разъединение)
    procedure DoKolvoTrips(nClienID, nBonus, nKolTrips : Integer); // считаем кол-во поездок после расчета
    function FindDriver(sNameDrv : string) : Integer;
    function FindDriverFcs(sNameDrv : string) : Integer;
    function FindDriverFics(sNameDrv : string) : Integer; // ищем зафиксированного таксиста
    function FindPhone(sPhone : string) : Integer;
    procedure DoStopDrv(nJurID : Integer); // остановка по просьбе водителя
    procedure DoStopClient(nJurID : Integer); // остановка по просьбе клиента
    procedure DoStopContinue(nJurID, nTypeStop : Integer); // продолжить
    procedure DoActions; // присваиваем горячие клавиши из базы
    procedure DoInsLastRas(sNumDrv, sSumRas : string; nJurID : Integer);
    procedure DoInsLastFics(sNumDrv : string; dTimeFics : TDateTime);
    procedure DoSaveFactSum(pID, pDrvID, pDrvID2, pClientID, pBonus, pNow, isStop, isBaggage : Integer; pNumDrv : string);
    procedure DoSaveTime(pID : Integer);
    procedure DoSaveKm(pID : Integer);
    procedure DoShowState(nState : Integer);
    function WinExecAndWait(Path: PChar; Visibility: Word): Word;

// Фиксация
    procedure DoFicsDrvFind(nId, nJurID, nDrvID, nAdr2ID, nDrvID2, nRaionID, nFree : Integer); // зафиксировать таксиста, найденного в списке
    procedure DoFicsDrvNew; // зафиксировать таксиста, НЕнайденного в списке
    procedure DoFicsDrv(nId : Integer); // обычная фиксация таксиста (nid = 0 - первая фиксация на заказе, 1 - повторная фиксация)
    procedure LoadKey;

    procedure DoCreateSubMenu;
    procedure DoCreateMenuAdr2;
    procedure DoClickMenuAdr2(Sender : TObject);
    procedure DoSendToTaxi(Sender : TObject);
    procedure DoStopWithBaggageMove(pJurID : Integer);
    procedure DoSetRaschetByRow(nType : Integer); // 0 - обычный расчет, 1 - окончательный расчет для межгорода 
    { Private declarations }
  public
    Phone, Phone2 : TPhone;
    sFormFocus : String;
    Russian, Latin : HKL;
    isClose : Boolean;
    pSOTRID : Integer;
    pTaxiID : Integer;
    pTOWN : Integer;
    pMG, pPERS : Integer; // идентификаторы поездка по м/г, персоналка
    pPriceKm : Integer; // Стоимость 1 км по межгороду
    pCostTalonCar, pCostTalonMin : Double; // Подача машины и минута по талону для конкретного такси
    sSynTaxi : string;
    flObratnoMG : Double; // Процент обратно по м/г
    intAutoSavePass : Integer; // Автоматически сохранять пароль
    intAutoShowAdr : Integer; // Автоматически выводить адрес
    procedure DoTapi(sNum : string; var pPhone : TPhone);
    procedure DoParams;
    function DoLogin():Boolean;
    function FindDriverNotInZakaz(sNameDrv : Variant; sJurId : Variant) : Integer;
    function FindDrv(sName : String) : boolean; // ищем по позывному таксиста на линии
    procedure DoShowRemark(str : string; st : TcxStyle); // показываем подсказку
    procedure DoDriverEvent(pJurID, pDrvID, pDrvID2, pAdr2ID : Integer; sEvent : string);
// Остановки
    procedure DoEnableStops(aEnable : Boolean);
    procedure DoEnableVisibleStop; // показываем, инайблим кнопки остановок
    procedure DoVisibleOtmena;
    procedure DoVisibleCopy;
    procedure DoVisibleFact;
    procedure DoVisibleKM;
    procedure DoVisibleNotExit;
    procedure DoVisibleComeBack;
    procedure DoVisibleAddTime;
    procedure DoVisibleSumCall;
    procedure DoVisibleContinueRas;
    procedure DoVisibleMakeCall;
    procedure DoVisibleSend;
    procedure DoVisibleLastRas;

    procedure DoEnableNeoplata;
    procedure DoEnableBaggage;
    procedure DoEnablePeregon;
    procedure DoEnableFicsControls;
    procedure DoEnableAddTimeControls;
    procedure DoEnableStopControls;
    procedure DoEnableKmControls;
    procedure DoEnableFactControls;
    procedure DoEnablePredZakaz;
    procedure DoEnableDrv;
    procedure DoEnableFree;
    procedure DoEnableAdr1;
    procedure DoEnableAdr2;
    procedure DoEnableRas;
    procedure DoEnableNumKod;

    procedure Lg_ev(p_strs : ansistring; p_filename : ansistring = '');
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses fLogin, fExit, fNumAbonent, fKod, fSetDrv, fdlgFics,
     fdlgSetRaschet, fdlgBonus, fdlgPred, fCalendar, fSprav, fSetPhone, fFics,
     fZakaz, fSetAdr2, fSetAdr1, fActions, fInfo, fSysInfo, fSetPhoneAdr1,
  fdlgSendToTaxi;

{$R *.dfm}

{ TfrmMain }

procedure TfrmMain.Lg_ev(p_strs : ansistring; p_filename : ansistring = '');
var F : TextFile;
begin
  try
    if Trim(p_filename) <> '' then
      begin
        if FileExists(p_filename) then
          begin
            AssignFile(F, p_filename);
            Append(F);
          end else
          begin
            AssignFile(F, p_filename);
            rewrite(F);
          end;
        writeln(F, DateTimeToStr(Now)+' '+p_strs);
        CloseFile(F);
      end;
  except
  end;
end;

procedure TfrmMain.aActionsExecute(Sender: TObject);
begin
  if (not Assigned(frmActions)) and (teVvod.Text <> '') then
    begin
      odsFindDrv.Close;
      odsFindDrv.SetVariable('pfc_name', teVvod.Text);
      odsFindDrv.SetVariable('pfk_taxiid', pTaxiID);
      odsFindDrv.Open;
      if odsFindDrv.RecordCount = 0 then
        begin
          DoShowRemark('Позывной №'+teVvod.Text+' не существует!', stError);
          beep;
          teVvod.Style.Color := clRed;
          tColorError.Enabled := True;
          teVvod.Text := '';
          exit;
        end;
      if Assigned(frmActions) then
        begin
          frmActions.iDriverId := odsFindDrv.FieldByName('fk_id').AsInteger;
          frmActions.Show;
        end else
        begin
          Application.CreateForm(TfrmActions, frmActions);
          frmActions.iDriverId := odsFindDrv.FieldByName('fk_id').AsInteger;
          frmActions.Show;
        end;
      frmActions.grActions.SetFocus;
      frmActions.tvActions.DataController.GotoFirst;
    end else
    begin
      if Assigned(frmActions) then
        frmActions.Close;
      VJOURNAL_DATEIN.Focused := True;
      grJournal.SetFocus;
    end;
end;

procedure TfrmMain.aAddTimeExecute(Sender: TObject);
begin
  if teVvod.Text <> '' then
    begin
      if FindDriverFics(teVvod.Text) = -1 then // не нашли зафиксированного или рассчитанного позывного с таким номером
        begin
          beep;
          teVvod.Style.Color := clRed;
          tColorError.Enabled := True;
          DoShowRemark('Фиксированного или рассчитанного поз. № '+teVvod.Text+' нет в заказах!', stError);
          teVvod.Clear;
          exit;
        end else
        begin // нашли
          pcOptions.ActivePageIndex := 2;
          seAddTime1.Tag := 1;
          seAddTime1.SetFocus;
          if colTime.DataBinding.DataController.Values[RowID, colTime.Index] <> 0 then
            begin
              seAddTime1.Properties.OnChange := nil;
              seAddTime1.Value := colTime.DataBinding.DataController.Values[RowID, colTime.Index];
              seAddTime1.Properties.OnChange := seAddTime1PropertiesChange;
              seAddTime1.SelLength := 0;
              seAddTime1.SelStart := Length(seAddTime1.Text);
            end else
            begin
              seAddTime1.Properties.OnChange := nil;
              seAddTime1.Value := 0;
              seAddTime1.Properties.OnChange := seAddTime1PropertiesChange;
              seAddTime1.SelLength := 0;
              seAddTime1.SelStart := Length(seAddTime1.Text);
            end;
        end;
    end else
    begin
      if odsJur.FieldByName('fn_sos').AsInteger = 3 then
        begin
          beep;
          DoShowRemark('Заказ отменен! Вы не можете использовать доп. время!', stError);
          teVvod.Clear;
          exit;
        end;
      if odsJur.FieldByName('fn_sos').AsInteger = 4 then
        begin
          beep;
          DoShowRemark('Неоплата заказа! Вы не можете использовать доп. время!', stError);
          teVvod.Clear;
          exit;
        end;
      if odsJur.FieldByName('fn_sos').AsInteger = 5 then
        begin
          beep;
          DoShowRemark('Невыход! Вы не можете использовать доп. время!', stError);
          teVvod.Clear;
          exit;
        end;
      if odsJur.FieldByName('fn_sos').AsInteger = 6 then
        begin
          beep;
          DoShowRemark('Заказ закрыт! Оплата за подачу машины!', stError);
          teVvod.Clear;
          exit;
        end;
      if odsJur.FieldByName('numdrv').AsString = '' then
        begin
          beep;
          DoShowRemark('Для заказа не выбрана машина!', stError);
          teVvod.Clear;
          exit;
        end;
      pcOptions.ActivePageIndex := 2;
      seAddTime1.Tag := 2;
      seAddTime1.SetFocus;
      if odsJur.FieldByName('fn_time').AsInteger <> 0 then
        begin
          seAddTime1.Properties.OnChange := nil;
          seAddTime1.Value := odsJur.FieldByName('fn_time').AsInteger;
          seAddTime1.Properties.OnChange := seAddTime1PropertiesChange;
          seAddTime1.SelLength := 0;
          seAddTime1.SelStart := Length(seAddTime1.Text);
        end;
    end;
end;

procedure TfrmMain.aAddZakazExecute(Sender: TObject);
begin
  if Assigned(frmSetPhoneAdr1) then
    begin
      frmSetPhoneAdr1.Show;
    end else
    begin
      Application.CreateForm(TfrmSetPhoneAdr1, frmSetPhoneAdr1);
      frmSetPhoneAdr1.Show;
    end;
end;

procedure TfrmMain.aAdr1Execute(Sender: TObject);
begin
  if odsJur.FieldByName('fn_sos').AsInteger = 1 then
    begin
      beep;
      DoShowRemark('Заказ закрыт! Изменить адрес клиента нельзя!', stError);
      exit;
    end;
  if odsJur.FieldByName('fn_sos').AsInteger = 3 then
    begin
      beep;
      DoShowRemark('Заказ отменен! Изменить адрес клиента нельзя!', stError);
      exit;
    end;
  if odsJur.FieldByName('fn_sos').AsInteger = 4 then
    begin
      beep;
      DoShowRemark('Неоплата заказа! Изменить адрес клиента нельзя!', stError);
      exit;
    end;
  if Assigned(frmSetAdr1) then
    begin
      frmSetAdr1.pTypeShow := 1;
      frmSetAdr1.Show;
    end else
    begin
      Application.CreateForm(TfrmSetAdr1, frmSetAdr1);
      frmSetAdr1.pTypeShow := 1;
      frmSetAdr1.sPrefix := odsJur.FieldByName('fc_preffix').AsString;
      frmSetAdr1.teAdr1.Tag := odsJur.FieldByName('fk_idadr1_detail').AsInteger;
      frmSetAdr1.teAdr2.Tag := odsJur.FieldByName('fk_idadr2_detail').AsInteger;
      if frmSetAdr1.teAdr1.Tag <> 0 then
        begin
          frmSetAdr1.teAdr1.Properties.OnChange := nil;
          frmSetAdr1.teAdr1.Text := odsJur.FieldByName('fc_street_detail').AsString;
          frmSetAdr1.teAdr1.Properties.OnChange := frmSetAdr1.teAdr1PropertiesChange;
          frmSetAdr1.aOk.Enabled := True;
        end;
      if frmSetAdr1.teAdr2.Tag <> 0 then
        begin
          frmSetAdr1.teAdr2.Properties.OnChange := nil;
          frmSetAdr1.teAdr2.Text := odsJur.FieldByName('fc_street1_detail').AsString;
          frmSetAdr1.teAdr2.Properties.OnChange := frmSetAdr1.teAdr2PropertiesChange;
        end;
      frmSetAdr1.teHouse.Text := odsJur.FieldByName('fc_house_detail').AsString+odsJur.FieldByName('fc_housefraction').AsString;
      frmSetAdr1.teHall.Text := odsJur.FieldByName('fc_hall_detail').AsString;
      frmSetAdr1.teHouseLiter.Text := odsJur.FieldByName('fc_houseliter_detail').AsString;
      frmSetAdr1.teDop.Text := odsJur.FieldByName('fc_dop1_detail').AsString;
      frmSetAdr1.DoShowForm(odsJur.FieldByName('fk_id').AsInteger,
                            odsJur.FieldByName('fn_stop').AsInteger,
                            odsJur.FieldByName('fk_raionid').AsInteger,
                            odsJur.FieldByName('fk_type_detail').AsInteger);
      frmSetAdr1.Show;
    end;
end;

procedure TfrmMain.aComeBackExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    if odsJur.FieldByName('fn_sos').AsInteger = 6 then // если был статус "оплата за выход"
      begin
        oq.SQL.Text := ' update taxi.tjournal set fn_sos = :pfn_sos, fd_dater = null, fn_sumr = 0, fn_time_trip = 0 where fk_id = :pfk_id ';
        lbSumR.Caption := '0';
      end else
      begin
        oq.SQL.Text := ' update taxi.tjournal set fn_sos = :pfn_sos where fk_id = :pfk_id ';
      end;
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.DeclareAndSet('pfn_sos', otInteger, odsJur.FieldByName('fn_sos_prev').AsInteger);
    oq.Execute;
    os.Commit;
    DoDriverEvent(odsJur.FieldByName('fk_id').AsInteger,
                  odsJur.FieldByName('fk_drvid').AsInteger,
                  odsJur.FieldByName('fk_drvid2').AsInteger,
                  0,
                  'MOVE_TO_CLIENT');
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    RefreshQuery(odsHis);
    odsJur.AfterScroll := odsJurAfterScroll;

    DoVisibleNotExit; // Невыход
    DoVisibleOtmena;
    DoVisibleComeBack;
    DoVisibleSumCall;

    lbDrv.Enabled := True;
    bBonus.Enabled := True;
    bSetHome.Enabled := True;
    DoEnableFicsControls;
    DoEnableAddTimeControls;
    DoEnableStopControls;
    DoEnableFactControls;
    DoEnableKmControls;
    DoEnableDrv;

    DoEnableAdr1;
    DoEnableAdr2;
    DoEnablePredZakaz;
    DoVisibleKM;
    DoVisibleFact;
    DoEnablePeregon;
    DoVisibleCopy;
    DoVisibleSend;

    DoShowState(odsJur.FieldByName('fn_sos').AsInteger);
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.aContinueExecute(Sender: TObject);
begin
  if teVvod.Text <> '' then
    begin
      if FindDriver(teVvod.Text) <> -1 then
        begin
          if colSos.DataBinding.DataController.Values[RowId, colSos.Index] <> 1 then
            begin
              DoStopContinue(vJournal_ID.DataBinding.DataController.Values[RowId, vJournal_ID.Index],
                             colIsStop.DataBinding.DataController.Values[RowId, colIsStop.Index]);
            end else
            begin
              teVvod.Clear;
              beep;
              DoShowRemark('Такого зафиксированного позывного нет в заказах!', stError);
            end;
        end else
        begin
          teVvod.Clear;
          beep;
          DoShowRemark('Такого зафиксированного позывного нет в заказах!', stError);
        end;
    end else
    begin
      if (odsJur.FieldByName('fd_datef_str').AsString <> '') and (odsJur.FieldByName('fn_sos').AsInteger <> 1) then
        begin
          DoStopContinue(odsJur.FieldByName('fk_id').AsInteger, odsJur.FieldByName('fl_isstop').AsInteger);
        end else
        begin
          teVvod.Clear;
          beep;
          DoShowRemark('Заказ незафиксирован или уже рассчитан!', stError);
        end;
    end;
end;

procedure TfrmMain.aContinueRasExecute(Sender: TObject); // Дальше
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal '+#13+
                   '    set fn_sos = 8, fn_sos2 = 1, fd_dater = null, fn_sumr = 0, '+#13+
                   '        fn_summg = 0, fn_sumgorod = 0, fn_time_trip = 0, fn_sumf = 0, fn_sumfmg = 0 '+#13+
                   '  where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    os.Commit;

    DoDriverEvent(odsJur.FieldByName('fk_id').AsInteger,
                  odsJur.FieldByName('fk_drvid').AsInteger,
                  odsJur.FieldByName('fk_drvid2').AsInteger,
                  odsJur.FieldByName('fk_adr2id').AsInteger,
                  'START_CLIENT_MOVE');

    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
    DoVisibleContinueRas;
    DoEnableVisibleStop;
    DoVisibleCopy;
    DoEnableFicsControls;
    DoEnableAdr1;
    DoEnableAdr2;
    DoEnableBaggage;
    DoEnableRas;

    lbSumR.Caption := '0';
    seSumF.Value := 0;
    seSumFMG.Value := 0;
  finally
    oq.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.aContinueRasMGExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Screen.Cursor := crSQLWait;
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal '+#13+
                   '    set fn_sos = 8, fn_sos2 = 1, fk_adr2id = :pfk_adr2id, fk_raionid = :pfk_raionid, '+#13+
                   '        fc_adr2 = (select fc_name from taxi.ts_raion where fk_id = :pfk_raionid) '+#13+
                   '  where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_adr2id', otInteger, pMG);
    oq.DeclareAndSet('pfk_raionid', otInteger, pMG);
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    oq.DeleteVariables;
    oq.SQL.Text := ' update taxi.tjuradr2 set fc_adr = (select fc_name from taxi.ts_raion where fk_id = :pfk_raionid) '+#13+
                   '  where fk_jurid = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.DeclareAndSet('pfk_raionid', otInteger, pMG);
    oq.Execute;
    os.Commit;

    DoDriverEvent(odsJur.FieldByName('fk_id').AsInteger,
                  odsJur.FieldByName('fk_drvid').AsInteger,
                  odsJur.FieldByName('fk_drvid2').AsInteger,
                  odsJur.FieldByName('fk_adr2id').AsInteger,
                  'START_CLIENT_MOVE');

    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
    DoVisibleContinueRas;
    DoEnableVisibleStop;
    DoVisibleCopy;
    DoEnableFicsControls;
    DoEnableAdr1;
    DoEnableAdr2;
    DoEnableBaggage;
    DoEnableRas;
  finally
    Screen.Cursor := crDefault;
    oq.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.aContinueStopExecute(Sender: TObject);
var oq : TOracleQuery;
    ods : TOracleDataSet;
begin
  try
  if odsJur.FieldByName('fl_isstop').AsInteger = 1 then // была остановка по просьбе водителя
    begin
      ods := TOracleDataSet.Create(nil);
      oq := TOracleQuery.Create(nil);
      Screen.Cursor := crSQLWait;
      try
        ods.Session := os;
        ods.SQL.Text := ' select round((sysdate - fd_stop)*24*60) as cntTime from taxi.tjournal where fk_id = :pfk_id ';
        ods.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
        ods.Open;
        oq.Session := os;
        if ods.FieldByName('cntTime').AsInteger > 0 then
          begin
            oq.DeleteVariables;
            oq.SQL.Text := ' merge into taxi.tstops using dual on (fk_jurid = :pfk_jurid) '+#13+
                           ' when not matched then insert (fk_jurid, fn_stopdrv) values(:pfk_jurid, :pfn_stopdrv) '+#13+
                           ' when matched then update set fn_stopdrv = fn_stopdrv+:pfn_stopdrv where fk_jurid = :pfk_jurid ';
            oq.DeclareAndSet('pfk_jurid', otInteger, odsJur.FieldByName('fk_id').AsInteger);
            oq.DeclareAndSet('pfn_stopdrv', otInteger, ods.FieldByName('cntTime').AsInteger);
            oq.Execute;
          end;
        oq.DeleteVariables;
        oq.SQL.Text := ' update taxi.tjournal set fl_isstop = 0, fd_stop = null where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
        oq.Execute;
        os.Commit;
        odsJur.AfterScroll := nil;
        RefreshQuery(odsJur);
        odsJur.AfterScroll := odsJurAfterScroll;
        bSaveStopDrv.Enabled := False;
        odsStops.Close;
        odsStops.SetVariable('pfk_jurid', odsJur.FieldByName('fk_id').AsInteger);
        odsStops.Open;
        seStopDrv.Properties.OnChange := nil;
        seStopDrv.Value := odsStops.FieldByName('fn_stopdrv').AsInteger;
        seStopDrv.Properties.OnChange := seStopDrvPropertiesChange;
        teVvod.Text := '';
      finally
        Screen.Cursor := crDefault;
        oq.Free;
        ods.Free;
      end;
    end;
  if odsJur.FieldByName('fl_isstop').AsInteger = 2 then // была остановка по просьбе клиента
    begin
      ods := TOracleDataSet.Create(nil);
      oq := TOracleQuery.Create(nil);
      Screen.Cursor := crSQLWait;
      try
        ods.Session := os;
        ods.SQL.Text := ' select round((sysdate - fd_stop)*24*60) as cntTime from taxi.tjournal where fk_id = :pfk_id ';
        ods.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
        ods.Open;
        oq.Session := os;
        if ods.FieldByName('cntTime').AsInteger > 0 then
          begin
            oq.SQL.Text := ' merge into taxi.tstops using dual on (fk_jurid = :pfk_jurid) '+#13+
                           ' when not matched then insert (fk_jurid, fn_stopclt) values(:pfk_jurid, :pfn_stopclt) '+#13+
                           ' when matched then update set fn_stopclt = fn_stopclt+:pfn_stopclt where fk_jurid = :pfk_jurid ';
            oq.DeclareAndSet('pfk_jurid', otInteger, odsJur.FieldByName('fk_id').AsInteger);
            oq.DeclareAndSet('pfn_stopclt', otInteger, ods.FieldByName('cntTime').AsInteger);
            oq.Execute;
          end;
        oq.DeleteVariables;
        oq.SQL.Text := ' update taxi.tjournal set fl_isstop = 0, fd_stop = null where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
        oq.Execute;
        os.Commit;
        odsJur.AfterScroll := nil;
        RefreshQuery(odsJur);
        odsJur.AfterScroll := odsJurAfterScroll;
        bSaveStopClt.Enabled := False;
        odsStops.Close;
        odsStops.SetVariable('pfk_jurid', odsJur.FieldByName('fk_id').AsInteger);
        odsStops.Open;
        seStopClt.Properties.OnChange := nil;
        seStopClt.Value := odsStops.FieldByName('fn_stopclt').AsInteger;
        seStopClt.Properties.OnChange := seStopCltPropertiesChange;
        teVvod.Text := '';
      finally
        Screen.Cursor := crDefault;
        oq.Free;
        ods.Free;
      end;
    end;
  DoEnableStops(True);
  finally
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.aCopyExecute(Sender: TObject); // !!! доделать, добавлять записи в таблицы TJURADR1, TJURADR2
var oq : TOracleQuery;                            // почему в TJOURNAL не вставляется fc_adr2
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' insert into taxi.tjournal(fd_datein, fc_adr1, fn_sos, fk_sotrid, fk_adr1id, fk_taxiid, fk_raionid, fn_sos2) '+#13+
                   ' values(:pfd_datein, :pfc_adr1, :pfn_sos, :pfk_sotrid, :pfk_adr1id, :pfk_taxiid, :pfk_raionid, :pfn_sos2) ';
    oq.DeclareAndSet('pfd_datein', otDate, odsJur.FieldByName('fd_datein').AsDateTime);
    oq.DeclareAndSet('pfc_adr1', otString, odsJur.FieldByName('fc_adr1').AsString);
    oq.DeclareAndSet('pfn_sos', otInteger, 9); // -- новый
    oq.DeclareAndSet('pfk_sotrid', otInteger, pSOTRID);
    oq.DeclareAndSet('pfk_adr1id', otInteger, odsJur.FieldByName('fk_adr1id').AsInteger);
    oq.DeclareAndSet('pfk_taxiid', otInteger, pTaxiID);
    oq.DeclareAndSet('pfk_raionid', otInteger, odsJur.FieldByName('fk_raionid').AsInteger);
    oq.DeclareAndSet('pfn_sos2', otInteger, 1); // -- не обработан
    oq.Execute;
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
    odsJurAfterScroll(nil);
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.aEditZakazExecute(Sender: TObject);
begin
  if Assigned(frmEditZakaz) then
    begin
      frmEditZakaz.Show;
    end else
    begin
      Application.CreateForm(TfrmEditZakaz, frmEditZakaz);
      frmEditZakaz.DoShowForm(odsJur.FieldByName('fk_id').AsInteger, odsJur.FieldByName('fc_num').AsString);
      frmEditZakaz.teDateTime.Text := DateTimeToStr(odsJur.FieldByName('fd_datein').AsDateTime);
      frmEditZakaz.beNumTel.Text := odsJur.FieldByName('fc_phone').AsString;
      frmEditZakaz.teAbonent.Text := odsJur.FieldByName('fc_num').AsString;
      case odsJur.FieldByName('fl_sos').AsInteger of
        0 : frmEditZakaz.lbVip.Caption := '';
        1 : frmEditZakaz.lbVip.Caption := '';
        2 : frmEditZakaz.lbVip.Caption := 'VIP!';
        3 : frmEditZakaz.lbVip.Caption := 'Грубиян!';
      end;
      case odsJur.FieldByName('fl_sos').AsInteger of
        0 : frmEditZakaz.lbVip.Style.TextColor := clMaroon;
        1 : frmEditZakaz.lbVip.Style.TextColor := clMaroon;
        2 : frmEditZakaz.lbVip.Style.TextColor := clGreen;
        3 : frmEditZakaz.lbVip.Style.TextColor := clRed;
      end;

      frmEditZakaz.teKod.Text := odsJur.FieldByName('fc_kod').AsString;
      frmEditZakaz.beHomeAdr.Text := odsJur.FieldByName('fc_adr').AsString;
      frmEditZakaz.beAdr1.Text := odsJur.FieldByName('fc_adr1').AsString;
      frmEditZakaz.beAdr2.Text := odsJur.FieldByName('fc_adr2').AsString;
      frmEditZakaz.beNumDrv.Text := odsJur.FieldByName('numdrv').AsString;
      frmEditZakaz.lbAuto.Caption := odsJur.FieldByName('namedrv').AsString;
      frmEditZakaz.beStart.Text := odsJur.FieldByName('fd_datef_str').AsString;
      frmEditZakaz.teEnd.Text := FormatDateTime('hh:mm', odsJur.FieldByName('fd_dater').AsDateTime);
      frmEditZakaz.teSum.Text := odsJur.FieldByName('sum_ras').AsString;

      frmEditZakaz.Show;
    end;
end;

procedure TfrmMain.aOtmenaExecute(Sender: TObject); // отмена заказа
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal set fn_sos = 3, fn_sos_prev = :pfn_sos where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.DeclareAndSet('pfn_sos', otInteger, odsJur.FieldByName('fn_sos').AsInteger); // предыдущий статус
    oq.Execute;
    os.Commit;

    DoDriverEvent(odsJur.FieldByName('fk_id').AsInteger,
                  odsJur.FieldByName('fk_drvid').AsInteger,
                  odsJur.FieldByName('fk_drvid2').AsInteger,
                  odsJur.FieldByName('fk_adr2id').AsInteger,
                  'CANCEL_ZAKAZ');

    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
    DoVisibleOtmena;
    DoVisibleComeBack;
    DoVisibleNotExit;
    lbDrv.Enabled := False;
    bBonus.Enabled := False;
    bSetHome.Enabled := False;
    DoEnableFicsControls;
    DoEnableAddTimeControls;
    DoEnableStopControls;
    DoEnableFactControls;
    DoEnableKmControls;

    DoEnableAdr1;
    DoEnableAdr2;
    DoEnableDrv;
    DoEnablePredZakaz;
    DoVisibleKM;
    DoEnablePeregon;
    DoVisibleFact;
    DoVisibleCopy;
    DoVisibleSumCall;
    DoVisibleSend;

    DoShowState(odsJur.FieldByName('fn_sos').AsInteger);
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.aPenaltyExecute(Sender: TObject);
begin
  odsFindDrv.Close;
  odsFindDrv.SetVariable('pfc_name', teVvod.Text);
  odsFindDrv.SetVariable('pfk_taxiid', pTaxiID);
  odsFindDrv.Open;
  if odsFindDrv.RecordCount = 0 then
    begin
      DoShowRemark('Позывной №'+teVvod.Text+' не существует!', stError);
      beep;
      teVvod.Style.Color := clRed;
      tColorError.Enabled := True;
      teVvod.Text := '';
      exit;
    end;
  pcOptions.ActivePageIndex := 6;
  lbPenNum.Caption := '№ '+teVvod.Text;
  sePenalty.Tag := odsFindDrv.FieldByName('fk_id').AsInteger;
  sePenalty.SetFocus;
end;

procedure TfrmMain.aPredRasExecute(Sender: TObject);
var ods : TOracleDataSet;
     nTimeBag, nTimeStopDrv, nTimeStopClt : Integer;
begin
// 1 -- расчитываем если введен № позывного
  if teVvod.Text <> '' then
    begin
      odsJur.AfterScroll := nil;
      if FindDriver(teVvod.Text) <> -1 then // ищем таксиста в журнале
        begin
          ods := TOracleDataSet.Create(nil);
          try
            ods.Session := os;
            ods.SQL.Text := ' select nvl(fn_stopdrv, 0) as fn_stopdrv, nvl(fn_stopclt, 0) as fn_stopclt, nvl(fn_baggage, 0) as fn_baggage '+#13+
                            '   from taxi.tstops where fk_jurid = :pfk_jurid ';
            ods.DeclareAndSet('pfk_jurid', otInteger, vJournal_ID.DataBinding.DataController.Values[RowId, vJournal_ID.Index]);
            ods.Open;
            nTimeBag := ods.FieldByName('fn_baggage').AsInteger;
            nTimeStopDrv := ods.FieldByName('fn_stopdrv').AsInteger;
            nTimeStopClt := ods.FieldByName('fn_stopclt').AsInteger;
            if colFl_Baggage.DataBinding.DataController.Values[RowId, colFl_Baggage.Index] = 1 then // багаж
              begin
                ods.DeleteVariables;
                ods.Close;
                ods.SQL.Text := ' select round((sysdate - fd_baggage)*24*60) as cntTime from taxi.tjournal where fk_id = :pfk_id ';
                ods.DeclareAndSet('pfk_id', otInteger, vJournal_ID.DataBinding.DataController.Values[RowId, vJournal_ID.Index]);
                ods.Open;
                nTimeBag := nTimeBag + ods.FieldByName('cntTime').AsInteger;
            end;
            if colIsStop.DataBinding.DataController.Values[RowId, colIsStop.Index] = 1 then // остановка по просьбе Водителя
              begin
                ods.DeleteVariables;
                ods.Close;
                ods.SQL.Text := ' select round((sysdate - fd_stop)*24*60) as cntTime from taxi.tjournal where fk_id = :pfk_id ';
                ods.DeclareAndSet('pfk_id', otInteger, vJournal_ID.DataBinding.DataController.Values[RowId, vJournal_ID.Index]);
                ods.Open;
                nTimeStopDrv := nTimeStopDrv + ods.FieldByName('cntTime').AsInteger;
              end;
            if colIsStop.DataBinding.DataController.Values[RowId, colIsStop.Index] = 2 then // остановка по просьбе Клиента
              begin
                ods.DeleteVariables;
                ods.Close;
                ods.SQL.Text := ' select round((sysdate - fd_stop)*24*60) as cntTime from taxi.tjournal where fk_id = :pfk_id ';
                ods.DeclareAndSet('pfk_id', otInteger, vJournal_ID.DataBinding.DataController.Values[RowId, vJournal_ID.Index]);
                ods.Open;
                nTimeStopClt := nTimeStopClt + ods.FieldByName('cntTime').AsInteger;
              end;
          finally
            ods.Free;
          end;
          DoItogoPred(vJournal_ID.DataBinding.DataController.Values[RowId, vJournal_ID.Index],
                      vJournal_FnStop.DataBinding.DataController.Values[RowId, vJournal_FnStop.Index],
                      vJournal_FlPeregon.DataBinding.DataController.Values[RowId, vJournal_FlPeregon.Index],
                      colKm1.DataBinding.DataController.Values[RowId, colKm1.Index],
                      colKm2.DataBinding.DataController.Values[RowId, colKm2.Index],
                      colTime.DataBinding.DataController.Values[RowId, colTime.Index],
                      colStopReal.DataBinding.DataController.Values[RowId, colStopReal.Index],
                      nTimeBag,
                      nTimeStopDrv,
                      nTimeStopClt,
                      colTalon.DataBinding.DataController.Values[RowId, colTalon.Index],
                      vJournal_NameDrv.DataBinding.DataController.Values[RowId, vJournal_NameDrv.Index]); // общий предварительный расчет
          odsJur.AfterScroll := odsJurAfterScroll;
        end; // !!! расчет если бонусная поездка не забыть потом прикрутить сюда

// 2 -- просто рассчитываем
    end else
    begin
      odsJur.AfterScroll := nil;
      try
      if odsJur.FieldByName('fd_datef_str').AsString = '' then
        begin
          beep;
          DoShowRemark('Заказ незафиксирован!', stError);
          frmMain.VJOURNAL_DATEIN.Focused := True;
          frmMain.grJournal.SetFocus;
          exit;
        end;
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := os;
        ods.SQL.Text := ' select nvl(fn_stopdrv, 0) as fn_stopdrv, nvl(fn_stopclt, 0) as fn_stopclt, nvl(fn_baggage, 0) as fn_baggage '+#13+
                        '   from taxi.tstops where fk_jurid = :pfk_jurid ';
        ods.DeclareAndSet('pfk_jurid', otInteger, odsJur.FieldByName('fk_id').AsInteger);
        ods.Open;
        nTimeBag := ods.FieldByName('fn_baggage').AsInteger;
        nTimeStopDrv := ods.FieldByName('fn_stopdrv').AsInteger;
        nTimeStopClt := ods.FieldByName('fn_stopclt').AsInteger;
        if odsJur.FieldByName('fl_bagage').AsInteger = 1 then // багаж
          begin
            ods.DeleteVariables;
            ods.Close;
            ods.SQL.Text := ' select round((sysdate - fd_baggage)*24*60) as cntTime from taxi.tjournal where fk_id = :pfk_id ';
            ods.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
            ods.Open;
            nTimeBag := nTimeBag + ods.FieldByName('cntTime').AsInteger;
          end;
      if odsJur.FieldByName('fl_isstop').AsInteger = 1 then // остановка по просьбе Водителя
        begin
          ods.DeleteVariables;
          ods.Close;
          ods.SQL.Text := ' select round((sysdate - fd_stop)*24*60) as cntTime from taxi.tjournal where fk_id = :pfk_id ';
          ods.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
          ods.Open;
          nTimeStopDrv := nTimeStopDrv + ods.FieldByName('cntTime').AsInteger;
        end;
      if odsJur.FieldByName('fl_isstop').AsInteger = 2 then // остановка по просьбе Клиента
        begin
          ods.DeleteVariables;
          ods.Close;
          ods.SQL.Text := ' select round((sysdate - fd_stop)*24*60) as cntTime from taxi.tjournal where fk_id = :pfk_id ';
          ods.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
          ods.Open;
          nTimeStopClt := nTimeStopClt + ods.FieldByName('cntTime').AsInteger;
        end;
      finally
        ods.Free;
      end;
      DoItogoPred(odsJur.FieldByName('fk_id').AsInteger,
                  odsJur.FieldByName('fn_stop').AsInteger,
                  odsJur.FieldByName('fl_peregon').AsInteger,
                  odsJur.FieldByName('fn_km1').AsFloat,
                  odsJur.FieldByName('fn_km2').AsFloat,
                  odsJur.FieldByName('fn_time').AsInteger,
                  odsJur.FieldByName('fl_stop_real').AsInteger,
                  nTimeBag,
                  nTimeStopDrv,
                  nTimeStopClt,
                  odsJur.FieldByName('fl_talon').AsInteger,
                  odsJur.FieldByName('numdrv').AsString); //-- общий предварительный расчет // !!! не забыть потом бонусную поездку
      finally
        odsJur.AfterScroll := odsJurAfterScroll;
      end;
    end;
  teVvod.Text := '';
end;

procedure TfrmMain.aPredZakazExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  if odsJur.FieldByName('fl_pred').AsInteger = 1 then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' select to_char(fd_date, ''dd.mm.yyyy'') as datestr, '+#13+
                        '        to_char(fd_date, ''hh24:mi'') as timestr '+#13+
                        '   from taxi.tpred where fk_jurid = :pfk_jurid ';
        ods.DeclareAndSet('pfk_jurid', otInteger, odsJur.FieldByName('fk_id').AsInteger);
        ods.Open;
        DoShowRemark('Предварительный заказ на '+ods.FieldByName('datestr').AsString+' '+ods.FieldByName('timestr').AsString, stInfo);
      finally
        ods.Free;
      end;
    end else
    begin
      try
        if Assigned(dlgPred) then
          begin
            dlgPred.IdJur := odsJur.FieldByName('fk_id').AsInteger;
            dlgPred.Show;
          end else
          begin
            Application.CreateForm(TdlgPred, dlgPred);
            dlgPred.IdJur := odsJur.FieldByName('fk_id').AsInteger;
            dlgPred.Show;
          end;
      except
        Application.CreateForm(TdlgPred, dlgPred);
      end;
    end;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
var oq : TOracleQuery;
     i : Integer;
begin
  Screen.Cursor := crSQLWait;
  odsCntJur.Close;
  odsCntJur.Open;
  lbCntZ.Caption := IntToStr(odsCntJur.FieldByName('cntZ').AsInteger);

  odsJur.AfterScroll := nil;
  oq := TOracleQuery.Create(nil);
  oq.Session := os;
  oq.SQL.Text := ' update taxi.tjournal set fn_sos2 = 2 where fk_id = :pfk_id ';
  try
    for i := 0 to tvJournal.DataController.RowCount - 1 do
      begin
        if colSos2.DataBinding.DataController.Values[i, colSos2.Index] = 2 then
          begin
            exit;
          end else
          begin
            if (Integer(colSos.DataBinding.DataController.Values[i, colSos.Index]) in [1..6]) then
              begin
                oq.DeclareAndSet('pfk_id', otInteger, vJournal_ID.DataBinding.DataController.Values[i, vJournal_ID.Index]);
                oq.Execute;
              end;
          end;
        os.Commit;
      end;
  finally
    oq.Free;
    RefreshQuery(odsJur);
    odsJur.First;
    odsJur.AfterScroll := odsJurAfterScroll;
    odsJurAfterScroll(nil);
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMain.aAdr2Execute(Sender: TObject);
begin
  if odsJur.FieldByName('fn_sos').AsInteger = 3 then
    begin
      beep;
      DoShowRemark('Заказ отменен! Изменить адрес назначения нельзя!', stError);
      exit;
    end;
  if odsJur.FieldByName('fn_sos').AsInteger = 4 then
    begin
      beep;
      DoShowRemark('Неоплата заказа! Изменить адрес назначения нельзя!', stError);
      exit;
    end;
  if odsJur.FieldByName('fn_sos').AsInteger = 5 then
    begin
      beep;
      DoShowRemark('Невыход! Изменить адрес назначения нельзя!', stError);
      exit;
    end;
  if odsJur.FieldByName('fn_sos').AsInteger = 6 then
    begin
      beep;
      DoShowRemark('Оплата за подачу! Изменить адрес назначения нельзя!', stError);
      exit;
    end;
  if odsJur.FieldByName('fn_sos').AsInteger = 1 then
    begin
      beep;
      DoShowRemark('Заказ закрыт! Изменить адрес назначения нельзя!', stError);
      exit;
    end;    
  if Assigned(frmSetAdr2) then
    begin
      frmSetAdr2.Show;
    end else
    begin
      Application.CreateForm(TfrmSetAdr2, frmSetAdr2);
      frmSetAdr2.teRaion.Tag := odsJur.FieldByName('fk_adr2id').AsInteger;
      if frmSetAdr2.teRaion.Tag <> 0 then
        begin
          frmSetAdr2.teRaion.Properties.OnChange := nil;
          frmSetAdr2.teRaion.Text := odsJur.FieldByName('fc_adr2_detail').AsString;
          frmSetAdr2.teRaion.Properties.OnChange := frmSetAdr2.teRaionPropertiesChange;
          frmSetAdr2.teDop.Text := odsJur.FieldByName('fc_dop2_detail').AsString;
          frmSetAdr2.aOk.Enabled := True;
        end;
      frmSetAdr2.DoShowForm(odsJur.FieldByName('fk_id').AsInteger,
                            odsJur.FieldByName('fk_drvid').AsInteger,
                            odsJur.FieldByName('fd_datef_chr').AsString);
      frmSetAdr2.Show;
    end;
end;

procedure TfrmMain.aSetDrvExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  if odsJur.FieldByName('fn_sos').AsInteger = 1 then
    begin
      beep;
      DoShowRemark('Заказ закрыт! Вы не можете выбрать таксиста!', stError);
      exit;
    end;
  if odsJur.FieldByName('fn_sos').AsInteger = 3 then
    begin
      beep;
      DoShowRemark('Заказ отменен! Вы не можете выбрать таксиста!', stError);
      exit;
    end;
  if odsJur.FieldByName('fn_sos').AsInteger = 4 then
    begin
      beep;
      DoShowRemark('Неоплата заказа! Вы не можете выбрать таксиста!', stError);
      exit;
    end;
  if odsJur.FieldByName('fn_sos').AsInteger = 5 then
    begin
      beep;
      DoShowRemark('Невыход! Вы не можете выбрать таксиста!', stError);
      exit;
    end;
  if odsJur.FieldByName('fn_sos').AsInteger = 6 then
    begin
      beep;
      DoShowRemark('Оплата за подачу! Вы не можете выбрать таксиста!', stError);
      exit;
    end;
//  if odsJur.FieldByName('numdrv').AsString <> '' then  // !!! может при фиксации
//    begin
//      beep;
//      DoShowRemark('Для заказа уже выбран таксист!', stError);
//      exit;
//    end;
  if Assigned(frmSetDrv) then
    begin
      frmSetDrv.Show;
    end else
    begin
      Application.CreateForm(TfrmSetDrv, frmSetDrv);
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' select fc_name from taxi.ts_raion where fk_id = :pfk_id ';
        ods.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_raionid').AsInteger);
        ods.Open;
        frmSetDrv.lbCap.Caption := 'Район: '+ods.FieldByName('fc_name').AsString;
        frmSetDrv.sLbFirst := 'Район: '+ods.FieldByName('fc_name').AsString;
        frmSetDrv.DoShowForm(odsJur.FieldByName('fk_raionid').AsInteger,
                             odsJur.FieldByName('fk_id').AsInteger,
                             odsJur.FieldByName('fl_peregon').AsInteger,
                             odsJur.FieldByName('fn_sos2').AsInteger);
        frmSetDrv.Show;
      finally
        ods.Free;
      end;
    end;
end;

procedure TfrmMain.aSetFactSumExecute(Sender: TObject);
begin                                                       
  if teVvod.Text <> '' then
    begin
      if FindDriverFics(teVvod.Text) = -1 then // не нашли зафиксированного или рассчитанного позывного с таким номером
        begin
          beep;
          teVvod.Style.Color := clRed;
          tColorError.Enabled := True;
          DoShowRemark('Фиксированного или рассчитанного поз. № '+teVvod.Text+' нет в заказах!', stError);
          teVvod.Clear;
          exit;
        end else
        begin // нашли
          pcOptions.ActivePageIndex := 3;
          teFactSum.Tag := 1;
          teFactSum.SetFocus;
          if colSumF.DataBinding.DataController.Values[RowID, colSumF.Index] <> 0 then
            begin
              teFactSum.Properties.OnChange := nil;
              teFactSum.Text := IntToStr(colSumF.DataBinding.DataController.Values[RowID, colSumF.Index]);
              teFactSum.Properties.OnChange := teFactSumPropertiesChange;
              teFactSum.SelLength := 0;
              teFactSum.SelStart := Length(teFactSum.Text);
            end;
          if colSumFMG.DataBinding.DataController.Values[RowID, colSumFMG.Index] <> 0 then
            begin
              teFactSumMG.Properties.OnChange := nil;
              teFactSumMG.Text := IntToStr(colSumFMG.DataBinding.DataController.Values[RowID, colSumFMG.Index]);
              teFactSumMG.Properties.OnChange := teFactSumMGPropertiesChange;
            end;
        end;
    end else
    begin
      if odsJur.FieldByName('numdrv').AsString = '' then
        begin
          beep;
          DoShowRemark('Для заказа не выбрана машина!', stError);
          teVvod.Clear;
          exit;
        end;
      if odsJur.FieldByName('fn_sos').AsInteger = 3 then
        begin
          beep;
          DoShowRemark('Заказ отменен! Вы не можете поставить сумму по факту!', stError);
          teVvod.Clear;
          exit;
        end;
      if odsJur.FieldByName('fn_sos').AsInteger = 4 then
        begin
          beep;
          DoShowRemark('Неоплата заказа! Вы не можете поставить сумму по факту!', stError);
          teVvod.Clear;
          exit;
        end;
      if odsJur.FieldByName('fn_sos').AsInteger = 5 then
        begin
          beep;
          DoShowRemark('Невыход! Вы не можете поставить сумму по факту!', stError);
          teVvod.Clear;
          exit;
        end;
      if odsJur.FieldByName('fn_sos').AsInteger = 6 then
        begin
          beep;
          DoShowRemark('Заказ закрыт! Оплата за подачу машины!', stError);
          teVvod.Clear;
          exit;
        end;
      pcOptions.ActivePageIndex := 3;
      teFactSum.Tag := 2;
      teFactSum.SetFocus;
      if odsJur.FieldByName('fn_sumf').AsInteger <> 0 then
        begin
          teFactSum.Properties.OnChange := nil;
          teFactSum.Text := IntToStr(odsJur.FieldByName('fn_sumf').AsInteger);
          teFactSum.Properties.OnChange := teFactSumPropertiesChange;
          teFactSum.SelLength := 0;
          teFactSum.SelStart := Length(teFactSum.Text);
        end;
      if odsJur.FieldByName('fn_sumfmg').AsInteger <> 0 then
        begin
          teFactSumMG.Properties.OnChange := nil;
          teFactSumMG.Text := IntToStr(odsJur.FieldByName('fn_sumfmg').AsInteger);
          teFactSumMG.Properties.OnChange := teFactSumMGPropertiesChange;
        end;
    end;
end;

procedure TfrmMain.aSetFicsExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
// -- проверки
  if odsJur.FieldByName('numdrv').AsString = '' then
    begin
      beep;
      DoShowRemark('Для заказа не выбрана машина!', stError);
      exit;
    end;
  if odsJur.FieldByName('fn_sos').AsInteger = 1 then
    begin
      beep;
      DoShowRemark('Заказ закрыт! Вы не можете зафиксировать закрытый заказ!', stError);
      exit;
    end;
  if odsJur.FieldByName('fn_sos').AsInteger = 3 then
    begin
      beep;
      DoShowRemark('Заказ отменен! Вы не можете зафиксировать заказ!', stError);
      exit;
    end;
  if odsJur.FieldByName('fn_sos').AsInteger = 4 then
    begin
      beep;
      DoShowRemark('Неоплата заказа! Вы не можете зафиксировать заказ!', stError);
      exit;
    end;
  if odsJur.FieldByName('fn_sos').AsInteger = 5 then
    begin
      beep;
      DoShowRemark('Это Невыход! Вы не можете зафиксировать заказ!', stError);
      exit;
    end;
  if odsJur.FieldByName('fn_sos').AsInteger = 6 then
    begin
      beep;
      DoShowRemark('Заказ закрыт! Оплата за подачу машины!', stError);
      exit;
    end;
// -- проверка на "по освобождению"
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select * from (select t2.fc_synonym '+#13+
                    '                  from taxi.tdriverevent t1, taxi.ts_drivereventtype t2 '+#13+
                    '                 where t1.fk_driver = :pfk_driver '+#13+
                    '                   and t1.fk_drivereventtype = t2.fk_id '+#13+
                    '                order by fd_date desc) t '+#13+
                    '  where rownum = 1 ';
    ods.DeclareAndSet('pfk_driver', otInteger, odsJur.FieldByName('fk_drvid').AsInteger);
    ods.Open;
    if ods.FieldByName('fc_synonym').AsString = 'START_CLIENT_MOVE' then
      begin
        beep;
        DoShowRemark('Позывной №'+odsJur.FieldByName('numdrv').AsString+' уже зафиксирован!', stError);
        exit;
      end;
  finally
    ods.Free;
  end;
// -- фиксация
  if odsJur.FieldByName('fd_datef_str').AsString = '' then
    DoFicsDrv(0)
  else
    DoFicsDrv(1);
  teFics.Properties.OnChange := nil;
  teFics.Time := odsJur.FieldByName('fd_datef').AsDateTime;
  teFics.Properties.OnChange := teFicsPropertiesChange;

  DoEnableVisibleStop; // показываем, инайблим все кнопки остановок
  DoEnableStopControls;
  DoEnableBaggage;
  DoEnableNeoplata;
  DoEnableFicsControls;
  DoEnableFree;
  DoEnableDrv;

  DoVisibleOtmena;
  DoVisibleNotExit;
  DoVisibleAddTime;
  DoVisibleKM;
  DoVisibleSumCall;
  DoVisibleFact;
  DoVisibleLastRas;
end;

procedure TfrmMain.aStopClientExecute(Sender: TObject);
begin
  if teVvod.Text <> '' then
    begin
      if FindDriver(teVvod.Text) <> -1 then
        begin
          if colSos.DataBinding.DataController.Values[RowId, colSos.Index] <> 1 then
            begin
              DoStopClient(vJournal_ID.DataBinding.DataController.Values[RowId, vJournal_ID.Index]);
            end else
            begin
              teVvod.Clear;
              beep;
              DoShowRemark('Такого зафиксированного позывного нет в заказах!', stError);
            end;
        end else
        begin
          teVvod.Clear;
          beep;
          DoShowRemark('Такого зафиксированного позывного нет в заказах!', stError);
        end;
    end else
    begin
      if (odsJur.FieldByName('fd_datef_str').AsString = '') or (odsJur.FieldByName('fn_sos').AsInteger = 1) then
        begin
          teVvod.Clear;
          beep;
          DoShowRemark('Заказ не зафиксирован или уже рассчитан!', stError);
          exit;
        end;
      if odsJur.FieldByName('fn_sos').AsInteger = 4 then
        begin
          teVvod.Clear;
          beep;
          DoShowRemark('Неоплата заказа!', stError);
          exit;
        end;

      DoStopClient(odsJur.FieldByName('fk_id').AsInteger);
    end;
end;

procedure TfrmMain.aStopDrvExecute(Sender: TObject);
begin
  if teVvod.Text <> '' then
    begin
      if FindDriver(teVvod.Text) <> -1 then 
        begin
          if colSos.DataBinding.DataController.Values[RowId, colSos.Index] <> 1 then
            begin
              DoStopDrv(vJournal_ID.DataBinding.DataController.Values[RowId, vJournal_ID.Index]);
            end else
            begin
              teVvod.Clear;
              beep;
              DoShowRemark('Такого зафиксированного позывного нет в заказах!', stError);
            end;
        end else
        begin
          teVvod.Clear;
          beep;
          DoShowRemark('Такого зафиксированного позывного нет в заказах!', stError);
        end;
    end else
    begin
      if (odsJur.FieldByName('fd_datef_str').AsString = '') or (odsJur.FieldByName('fn_sos').AsInteger = 1) then
        begin
          teVvod.Clear;
          beep;
          DoShowRemark('Заказ не зафиксирован или уже рассчитан!', stError);
          exit;
        end;
      if odsJur.FieldByName('fn_sos').AsInteger = 4 then
        begin
          teVvod.Clear;
          beep;
          DoShowRemark('Неоплата заказа!', stError);
          exit;
        end;
      DoStopDrv(odsJur.FieldByName('fk_id').AsInteger);
    end;
end;

procedure TfrmMain.aSysInfoExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSysInfo, frmSysInfo);
  try
    frmSysInfo.rowJurID.Properties.Value := odsJur.FieldByName('fk_id').AsInteger;
    frmSysInfo.rowFn_Stop.Properties.Value := odsJur.FieldByName('fn_stop').AsInteger;
    frmSysInfo.rowDrvID1.Properties.Value := odsJur.FieldByName('fk_drvid').AsInteger;
    frmSysInfo.rowDrvID2.Properties.Value := odsJur.FieldByName('fk_drvid2').AsInteger;
    frmSysInfo.ShowModal;
  finally
    frmSysInfo.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.aTabExecute(Sender: TObject);
begin
  if sFormFocus <> '' then
    begin
      if (sFormFocus = 'frmSetAdr1') and Assigned(frmSetAdr1) then
        frmSetAdr1.SetFocus;
      if (sFormFocus = 'frmSetAdr2') and Assigned(frmSetAdr2) then
        frmSetAdr2.SetFocus;
      if (sFormFocus = 'frmSetPhone') and Assigned(frmSetPhone) then
        frmSetPhone.SetFocus;
      if (sFormFocus = 'frmSprav') and Assigned(frmSprav) then
        frmSprav.SetFocus;
      if (sFormFocus = 'frmSetDrv') and Assigned(frmSetDrv) then
        frmSetDrv.SetFocus;
      if (sFormFocus = 'frmFics') and Assigned(frmFics) then
        frmFics.SetFocus;
      if (sFormFocus = 'frmSetPhoneAdr1') and Assigned(frmSetPhoneAdr1) then
        frmSetPhoneAdr1.SetFocus;
    end;
end;

procedure TfrmMain.aFicsExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  if teVvod.Text <> '' then // быстрая фиксация
    begin
// -- проверяем существует ли такой позывной
      odsFindDrv.Close;
      odsFindDrv.SetVariable('pfc_name', teVvod.Text);
      odsFindDrv.SetVariable('pfk_taxiid', pTaxiID);
      odsFindDrv.Open;
      if odsFindDrv.RecordCount = 0 then
        begin
          beep;
          DoShowRemark('Позывной №'+teVvod.Text+' не существует!', stError);
          teVvod.Text := '';
          exit;
        end;
// -- проверяем есть ли такой позывной зафиксированный
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' select * from (select t2.fc_synonym '+#13+
                        '                  from taxi.tdriverevent t1, taxi.ts_drivereventtype t2 '+#13+
                        '                 where t1.fk_driver = :pfk_driver '+#13+
                        '                   and t1.fk_drivereventtype = t2.fk_id '+#13+
                        '                order by fd_date desc) t '+#13+
                        '  where rownum = 1 ';
        ods.DeclareAndSet('pfk_driver', otInteger, odsFindDrv.FieldByName('fk_id').AsInteger);
        ods.Open;
        if ods.FieldByName('fc_synonym').AsString = 'START_CLIENT_MOVE' then
          begin
            beep;
            DoShowRemark('Позывной №'+odsJur.FieldByName('numdrv').AsString+' уже зафиксирован!', stError);
            exit;
          end;
      finally
        ods.Free;
      end;
// -- фиксация
      RowId := -1;
      odsJur.AfterScroll := nil;
      try
      if FindDriverFcs(teVvod.Text) <> -1 then // ищем таксиста в журнале
        begin
          if VJOURNAL_FICS.DataBinding.DataController.Values[RowId, VJOURNAL_FICS.Index] = null then
            begin
              DoFicsDrvFind(0,
                            vJournal_ID.DataBinding.DataController.Values[RowId, vJournal_ID.Index],           // fk_id
                            vJournal_DrvId1.DataBinding.DataController.Values[RowId, vJournal_DrvId1.Index],   // fk_drvid
                            vJournal_Adr2Id.DataBinding.DataController.Values[RowId, vJournal_Adr2Id.Index],  // fk_adr2id
                            vJournal_DrvId2.DataBinding.DataController.Values[RowId, vJournal_DrvId2.Index],
                            vJournal_fkRaionId.DataBinding.DataController.Values[RowId, vJournal_fkRaionId.Index], // fk_raionid
                            colFree.DataBinding.DataController.Values[RowId, colFree.Index]);
            end else
            begin
              DoFicsDrvFind(1,
                            vJournal_ID.DataBinding.DataController.Values[RowId, vJournal_ID.Index],           // fk_id
                            vJournal_DrvId1.DataBinding.DataController.Values[RowId, vJournal_DrvId1.Index],   // fk_drvid
                            vJournal_Adr2Id.DataBinding.DataController.Values[RowId, vJournal_Adr2Id.Index],  // fk_adr2id
                            vJournal_DrvId1.DataBinding.DataController.Values[RowId, vJournal_DrvId2.Index],
                            vJournal_fkRaionId.DataBinding.DataController.Values[RowId, vJournal_fkRaionId.Index], // fk_raionid
                            colFree.DataBinding.DataController.Values[RowId, colFree.Index]);
            end;
        end else
        begin
          DoFicsDrvNew; // НЕ нашли таксиста в заказах - фиксируем его с добавлением новой записи
        end;
      if vJournal_ID.DataBinding.DataController.Values[RowId, vJournal_ID.Index] = odsJur.FieldByName('fk_id').AsInteger then // если стоим на той же записи
        begin
          teFics.Properties.OnChange := nil;
          teFics.Time := odsJur.FieldByName('fd_datef').AsDateTime;
          teFics.Properties.OnChange := teFicsPropertiesChange;
          DoEnableVisibleStop; // показываем, инайблим все кнопки остановок
          DoEnableBaggage;
          DoEnableNeoplata;
          DoEnableStopControls;
          DoEnableFree;
          DoVisibleOtmena;
          DoVisibleLastRas;
        end;
      finally
        odsJur.AfterScroll := odsJurAfterScroll;
      end;
    end else
    begin
      aSetFicsExecute(nil); // простая фиксация
    end;
end;

procedure TfrmMain.aFindExecute(Sender: TObject);
var NameDrv : string;
    i : Integer;
begin
  try
    if teVvod.Text <> '' then
      begin
        NameDrv := teVvod.Text;
        for i := 0 to tvJournal.DataController.RowCount - 1 do
          begin
            if (vJournal_NumDrv1.DataBinding.DataController.Values[i, vJournal_NumDrv1.Index] = teVvod.Text) or
               (vJournal_NumDrv2.DataBinding.DataController.Values[i, vJournal_NumDrv2.Index] = teVvod.Text) then
              begin
                odsJur.AfterScroll := nil;
                odsJur.Locate('fk_id', vJournal_ID.DataBinding.DataController.Values[i, vJournal_ID.Index], []);
                odsJur.AfterScroll := odsJurAfterScroll;
                odsJurAfterScroll(nil);
                exit;
              end;
          end;
        beep;
        teVvod.Style.Color := clRed;
        tColorError.Enabled := True;
        DoShowRemark('Позывного №'+NameDrv+' нет в заказах!', stError);
      end;
  finally
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
    teVvod.Clear;
  end;
end;

procedure TfrmMain.aInfoExecute(Sender: TObject);
begin
  if Assigned(frmSprav) then
    begin
      frmSprav.Show;
    end else
    begin
      Application.CreateForm(TfrmSprav, frmSprav);
      frmSprav.Show;
    end;
end;

procedure TfrmMain.aKMExecute(Sender: TObject);
begin
  if odsJur.RecordCount > 0 then
  begin
    if teVvod.Text <> '' then
      begin
        if FindDriver(teVvod.Text) <> -1 then
          begin
            pcOptions.ActivePageIndex := 1;
            teNum.Tag := 1;
            teNum.SetFocus;
            if colKm1.DataBinding.DataController.Values[RowID, colKm1.Index] <> 0 then
              begin
                teNum.Properties.OnChange := nil;
                teNum.Text := FloatToStr(colKm1.DataBinding.DataController.Values[RowID, colKm1.Index]);
                if colKm2.DataBinding.DataController.Values[RowID, colKm2.Index] <> 0 then
                  begin
                    teNum.Text := teNum.Text+'/'+FloatToStr(colKm2.DataBinding.DataController.Values[RowID, colKm2.Index])
                  end;
                teNum.Properties.OnChange := teNumPropertiesChange;
                teNum.SelLength := 0;
                teNum.SelStart := Length(teNum.Text);
              end else
              begin
                teNum.Text := '';
              end;
          end else
          begin
            teVvod.Style.Color := clRed;
            tColorError.Enabled := True;
            teVvod.Clear;
            beep;
            DoShowRemark('Такого зафиксированного позывного нет в заказах!', stError);
          end;
      end else
      begin
        if odsJur.FieldByName('fn_sos').AsInteger = 3 then
          begin
            beep;
            DoShowRemark('Заказ отменен! Вы не можете поставить километраж!', stError);
            teVvod.Clear;
            exit;
          end;
        if odsJur.FieldByName('fn_sos').AsInteger = 4 then
          begin
            beep;
            DoShowRemark('Неоплата заказа! Вы не можете поставить километраж!', stError);
            teVvod.Clear;
            exit;
          end;
        if odsJur.FieldByName('fn_sos').AsInteger = 5 then
          begin
            beep;
            DoShowRemark('Невыход! Вы не можете поставить километраж!', stError);
            teVvod.Clear;
            exit;
          end;
        if odsJur.FieldByName('fn_sos').AsInteger = 6 then
          begin
            beep;
            DoShowRemark('Заказ закрыт! Оплата за подачу машины!', stError);
            teVvod.Clear;
            exit;
          end;
        if odsJur.FieldByName('numdrv').AsString = '' then
          begin
            beep;
            DoShowRemark('Для заказа не выбрана машина!', stError);
            teVvod.Clear;
            exit;
          end;
        pcOptions.ActivePageIndex := 1;
        teNum.Tag := 2;
        teNum.SetFocus;
        if odsJur.FieldByName('fn_km1').AsFloat <> 0 then
          begin
            teNum.Properties.OnChange := nil;
            teNum.Text := FloatToStr(odsJur.FieldByName('fn_km1').AsFloat);
            if odsJur.FieldByName('fn_km2').AsFloat <> 0 then
              begin
                teNum.Text := teNum.Text+'/'+FloatToStr(odsJur.FieldByName('fn_km2').AsFloat)
              end;
            teNum.Properties.OnChange := teNumPropertiesChange;
            teNum.SelLength := 0;
            teNum.SelStart := Length(teNum.Text);
          end;
      end;
  end;
end;

procedure TfrmMain.aLastSumExecute(Sender: TObject);
begin
  DoSetRaschetByRow(1);
end;

procedure TfrmMain.aNotExitExecute(Sender: TObject); // невыход
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal set fn_sos = 5, fn_sos_prev = :pfn_sos where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.DeclareAndSet('pfn_sos', otInteger, odsJur.FieldByName('fn_sos').AsInteger);
    oq.Execute;

    DoDriverEvent(odsJur.FieldByName('fk_id').AsInteger,
                  odsJur.FieldByName('fk_drvid').AsInteger,
                  odsJur.FieldByName('fk_drvid2').AsInteger,
                  0,
                  'NOT_EXIT');

    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    RefreshQuery(odsHis);
    odsJur.AfterScroll := odsJurAfterScroll;

    DoVisibleOtmena;
    DoVisibleNotExit;
    DoVisibleComeBack;

    lbDrv.Enabled := False;
    bBonus.Enabled := False;
    bSetHome.Enabled := False;
    DoEnableAdr1;
    DoEnableAdr2;
    DoEnableDrv;

    DoVisibleCopy;
    DoVisibleFact;
    DoVisibleKM;
    DoVisibleSumCall;

    DoEnablePredZakaz;
    DoEnableFree;
    DoEnableFicsControls;
    DoEnableAddTimeControls;
    DoEnableStopControls;
    DoEnableFactControls;
    DoEnableKmControls;
    DoEnablePeregon;
    DoEnableNeoplata;

    DoShowState(odsJur.FieldByName('fn_sos').AsInteger);
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.aCalculateExecute(Sender: TObject);
var oq : TOracleQuery;
begin
// -- расчитываем если введен № позывного
  if teVvod.Text <> '' then
    begin
      odsJur.AfterScroll := nil;
      try
      if FindDriver(teVvod.Text) <> -1 then // ищем таксиста в журнале
        begin
          Application.CreateForm(TdlgSetRaschet, dlgSetRaschet);
          try
            if VJOURNAL_SUM.DataBinding.DataController.Values[RowId, VJOURNAL_SUM.Index] = 0 then
              dlgSetRaschet.lbCap.Caption := 'Рассчитать '+teVvod.Text+'-го?'
            else
              dlgSetRaschet.lbCap.Caption := 'Позывной № '+teVvod.Text+' рассчитан!'+#13+'Пересчитать?';
            dlgSetRaschet.ShowModal;
            if dlgSetRaschet.ModalResult = mrOk then
              begin
                oq := TOracleQuery.Create(nil);
                try
                  oq.Session := os;
                  oq.Cursor := crSQLWait;
// -- !!! доделать! первый раз идет расчет и заказ не закрывается, а второй расчет должен закрывать заказ
                  if vJournal_Adr2Id.DataBinding.DataController.Values[RowId, vJournal_Adr2Id.Index] = pMG then
                    oq.SQL.Text := ' update taxi.tjournal set fd_dater = decode(fd_dater, null, sysdate, fd_dater) where fk_id = :pfk_id '
                  else
                    oq.SQL.Text := ' update taxi.tjournal set fd_dater = decode(fd_dater, null, sysdate, fd_dater), fn_sos = 1 where fk_id = :pfk_id ';
                  oq.DeclareAndSet('pfk_id', otInteger, vJournal_ID.DataBinding.DataController.Values[RowId, vJournal_ID.Index]);
//                  showmessage('RowId='+IntToStr(RowId)+'; Index='+IntToStr(vJournal_ID.Index));
                  oq.Execute;
// -- ставим отметку о том, что движение закончено
                  DoDriverEvent(vJournal_ID.DataBinding.DataController.Values[RowId, vJournal_ID.Index],
                                vJournal_DrvId1.DataBinding.DataController.Values[RowId, vJournal_DrvId1.Index],
                                vJournal_DrvId2.DataBinding.DataController.Values[RowId, vJournal_DrvId2.Index],
                                0,
                                'END_CLIENT_MOVE');
// -- если поездка была с багажом и не была снята, то при расчете добавляем отметку что поездка с багажом закончилась
                  if colFl_Baggage.DataBinding.DataController.Values[RowId, colFl_Baggage.Index] = 1 then
                    begin
                      DoStopWithBaggageMove(vJournal_ID.DataBinding.DataController.Values[RowId, vJournal_ID.Index]);
                    end;
// -- если была остановка и сразу расчет, "продолжаем движение" чтобы снять остановку
                  if colIsStop.DataBinding.DataController.Values[RowId, colIsStop.Index] <> 0 then
                    begin
                      DoStopContinue(vJournal_ID.DataBinding.DataController.Values[RowId, vJournal_ID.Index],
                                     colIsStop.DataBinding.DataController.Values[RowId, colIsStop.Index]);
                    end;
// -- если первый раз происходит расчет то + поездку
                  if colSos.DataBinding.DataController.Values[RowId, colSos.Index] <> 1 then
                    begin
                      DoKolvoTrips(vJournal_FkClientid.DataBinding.DataController.Values[RowId, vJournal_FkClientid.Index],
                                   vJournal_FlBonus.DataBinding.DataController.Values[RowId, vJournal_FlBonus.Index],
                                   vJournal_FnNow.DataBinding.DataController.Values[RowId, vJournal_FnNow.Index]); // кол-во поездок
                    end;
                  if vJournal_JurNum.DataBinding.DataController.Values[RowId, vJournal_JurNum.Index] = '' then
                    begin
                      oq.DeleteVariables;
                      oq.SQL.Text := ' update taxi.tjournal set fc_num = :pfc_num where fk_id = :pfk_id ';
                      oq.DeclareAndSet('pfc_num', otString, vJournal_FcNum.DataBinding.DataController.Values[RowId, vJournal_FcNum.Index]);
                      oq.DeclareAndSet('pfk_id', otInteger, vJournal_ID.DataBinding.DataController.Values[RowId, vJournal_ID.Index]);
                      oq.Execute;
                    end;
                  os.Commit;
                finally
                  oq.Free;
                end;
// РАСЧЕТ
                if vJournal_FlBonus.DataBinding.DataController.Values[RowId, vJournal_FlBonus.Index] <> 1 then // если не бонусная поездка
                  begin
                    if vJournal_FnStop.DataBinding.DataController.Values[RowId, vJournal_FnStop.Index] = null then // !!! можно ли сделать как-то по-другому преобразование null в 0
                      DoItogo(0,
                              vJournal_ID.DataBinding.DataController.Values[RowId, vJournal_ID.Index],
                              0,
                              vJournal_FlPeregon.DataBinding.DataController.Values[RowId, vJournal_FlPeregon.Index],
                              colKm1.DataBinding.DataController.Values[RowId, colKm1.Index],
                              colKm2.DataBinding.DataController.Values[RowId, colKm2.Index],
                              colTime.DataBinding.DataController.Values[RowId, colTime.Index],
                              colStopReal.DataBinding.DataController.Values[RowId, colStopReal.Index],
                              colTalon.DataBinding.DataController.Values[RowId, colTalon.Index],
                              colAdr1ID.DataBinding.DataController.Values[RowId, colAdr1ID.Index],
                              vJournal_NameDrv.DataBinding.DataController.Values[RowId, vJournal_NameDrv.Index])
                    else // общий расчет
                      DoItogo(0,
                              vJournal_ID.DataBinding.DataController.Values[RowId, vJournal_ID.Index],
                              vJournal_FnStop.DataBinding.DataController.Values[RowId, vJournal_FnStop.Index],
                              vJournal_FlPeregon.DataBinding.DataController.Values[RowId, vJournal_FlPeregon.Index],
                              colKm1.DataBinding.DataController.Values[RowId, colKm1.Index],
                              colKm2.DataBinding.DataController.Values[RowId, colKm2.Index],
                              colTime.DataBinding.DataController.Values[RowId, colTime.Index],
                              colStopReal.DataBinding.DataController.Values[RowId, colStopReal.Index],
                              colTalon.DataBinding.DataController.Values[RowId, colTalon.Index],
                              colAdr1ID.DataBinding.DataController.Values[RowId, colAdr1ID.Index],
                              vJournal_NameDrv.DataBinding.DataController.Values[RowId, vJournal_NameDrv.Index]); // общий расчет
                  end else
                  begin
                    DoItogoBonus(vJournal_ID.DataBinding.DataController.Values[RowId, vJournal_ID.Index],
                                 vJournal_FdStop.DataBinding.DataController.Values[RowId, vJournal_FdStop.Index]); // бонусная поездка
                  end;
              end;
          finally
            dlgSetRaschet.Free;
          end;
        end;
      finally
        odsJur.AfterScroll := odsJurAfterScroll;
      end;
// -- просто рассчитываем
    end else
    begin
      odsJur.AfterScroll := nil;
      try
      if odsJur.FieldByName('fd_datef_str').AsString = '' then
        begin
          beep;
          DoShowRemark('Заказ незафиксирован!', stError);
          frmMain.VJOURNAL_DATEIN.Focused := True;
          frmMain.grJournal.SetFocus;
          exit;
        end;
      if odsJur.FieldByName('fn_sos').AsInteger = 4 then
        begin
          beep;
          DoShowRemark('Неоплата заказа! Нельзя рассчитать', stError);
          frmMain.VJOURNAL_DATEIN.Focused := True;
          frmMain.grJournal.SetFocus;
          exit;
        end;
      Application.CreateForm(TdlgSetRaschet, dlgSetRaschet);
      try
        if (FloatToStr(odsJur.FieldByName('sum_ras').AsFloat) = '') or (odsJur.FieldByName('sum_ras').AsFloat = 0) then
          dlgSetRaschet.lbCap.Caption := 'Рассчитать '+odsJur.FieldByName('numdrv').AsString+'-го?'
        else
          dlgSetRaschet.lbCap.Caption := 'Позывной № '+odsJur.FieldByName('numdrv').AsString+' рассчитан!'+#13+ 'Рассчитать его повторно?';
        dlgSetRaschet.ShowModal;
        if dlgSetRaschet.ModalResult = mrOk then
          begin
            oq := TOracleQuery.Create(nil);
            try
              oq.Session := os;
              oq.Cursor := crSQLWait;
              if odsJur.FieldByName('fk_adr2id').AsInteger = pMG then // !!!
                oq.SQL.Text := ' update taxi.tjournal set fd_dater = decode(fd_dater, null, sysdate, fd_dater) where fk_id = :pfk_id '
              else
                oq.SQL.Text := ' update taxi.tjournal set fd_dater = decode(fd_dater, null, sysdate, fd_dater), fn_sos = 1 where fk_id = :pfk_id ';
              oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
              oq.Execute;
              oq.DeleteVariables;
              // -- Ставим отметку о том, что движение закончилось
              DoDriverEvent(odsJur.FieldByName('fk_id').AsInteger,
                            odsJur.FieldByName('fk_drvid').AsInteger,
                            odsJur.FieldByName('fk_drvid2').AsInteger,
                            0,
                            'END_CLIENT_MOVE');
// -- если поездка была с багажом и не была снята, то при расчете добавляем отметку что поездка с багажом закончилась
              if odsJur.FieldByName('fl_bagage').AsInteger = 1 then
                begin
                  DoStopWithBaggageMove(odsJur.FieldByName('fk_id').AsInteger);
                end;
// -- если была остановка и сразу расчет, "продолжаем движение" чтобы снять остановку
              if odsJur.FieldByName('fl_isstop').AsInteger <> 0 then
                begin
                  DoStopContinue(odsJur.FieldByName('fk_id').AsInteger, odsJur.FieldByName('fl_isstop').AsInteger);
                end;
              if odsJur.FieldByName('fn_sos').AsInteger <> 1 then // если первый раз происходит расчет то + поездку
                begin
                  DoKolvoTrips(odsJur.FieldByName('fk_clientid').AsInteger,
                               odsJur.FieldByName('fl_bonus').AsInteger,
                               odsJur.FieldByName('fn_now').AsInteger);
                end;
              if odsJur.FieldByName('jurnum').AsString = '' then
                begin
                  oq.DeleteVariables;
                  oq.SQL.Text := ' update taxi.tjournal set fc_num = :pfc_num where fk_id = :pfk_id ';
                  oq.DeclareAndSet('pfc_num', otString, odsJur.FieldByName('fc_num').AsString);
                  oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
                  oq.Execute;
                end;
              os.Commit;
            finally
              oq.Free;
            end;
            if odsJur.FieldByName('fl_bonus').AsInteger <> 1 then //-- если не бонусная поездка
              begin
                DoItogo(0,
                        odsJur.FieldByName('fk_id').AsInteger,
                        odsJur.FieldByName('fn_stop').AsInteger,
                        odsJur.FieldByName('fl_peregon').AsInteger,
                        odsJur.FieldByName('fn_km1').AsFloat,
                        odsJur.FieldByName('fn_km2').AsFloat,
                        odsJur.FieldByName('fn_time').AsInteger,
                        odsJur.FieldByName('fl_stop_real').AsInteger,
                        odsJur.FieldByName('fl_talon').AsInteger,
                        odsJur.FieldByName('fk_adr1id').AsInteger,
                        odsJur.FieldByName('numdrv').AsString); //-- общий расчет
              end else
              begin
                DoItogoBonus(odsJur.FieldByName('fk_id').AsInteger,
                             odsJur.FieldByName('fd_stop_chr').AsString); //-- бонусная поездка
              end;
          end;
      finally
        dlgSetRaschet.Free;
      end;
      finally
        odsJur.AfterScroll := odsJurAfterScroll;
      end;
    end;
  teVvod.Text := '';
end;

procedure TfrmMain.aCallClient2Execute(Sender: TObject);
var oq : TOracleQuery;
begin
  try
    if (odsJur.FieldByName('fc_phone').AsString <> '') and (odsJur.FieldByName('fc_phone').AsString <> '::::::') then
      begin
        isMyCallToClient := True;
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.SQL.Text := ' update taxi.tjournal set fl_dozvon = 1 where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
          oq.Execute;
          odsJur.AfterScroll := nil;
          RefreshQuery(odsJur);
          odsJur.AfterScroll := odsJurAfterScroll;
          os.Commit;
        finally
          oq.Free;
        end;

//        if not (Phone2.IsBusy) then
//          begin
////            if Length(odsJur.FieldByName('fc_phone').AsString) < 7 then // !!! пока отзваниваем только на стационарные телефоны
              Phone2.MakeCall(odsJur.FieldByName('fc_phone').AsString);
//            s2 := odsJur.FieldByName('fc_phone').AsString;
//            JurID2 := odsJur.FieldByName('fk_id').AsInteger;
//            exit;
//          end;
      end else
      begin
        beep;
        DoShowRemark('Нет номера телефона!', stError);
      end;
  finally
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.aCallClientExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  try
    if (odsJur.FieldByName('fc_phone').AsString <> '') and (odsJur.FieldByName('fc_phone').AsString <> '::::::') then
      begin
        isMyCallToClient := True;
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.SQL.Text := ' update taxi.tjournal set fl_dozvon = 1 where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
          oq.Execute;
          odsJur.AfterScroll := nil;
          RefreshQuery(odsJur);
          odsJur.AfterScroll := odsJurAfterScroll;
          os.Commit;
        finally
          oq.Free;
        end;
//        if not (Phone.IsBusy) then
//          begin
////            if Length(odsJur.FieldByName('fc_phone').AsString) < 7 then // !!! пока отзваниваем только на стационарные номера
              Phone.MakeCall(odsJur.FieldByName('fc_phone').AsString);
//            s1 := odsJur.FieldByName('fc_phone').AsString;
//            JurID := odsJur.FieldByName('fk_id').AsInteger;
//            exit;
//          end;
      end else
      begin
        beep;
        DoShowRemark('Нет номера телефона!', stError);
      end;
  finally
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.aCallDriver2Execute(Sender: TObject);
begin
  if not (Phone2.IsBusy) then
    begin
      Phone2.MakeCall(odsJur.FieldByName('drvphone').AsString);
      exit;
    end;
  if not (Phone.IsBusy) then
    begin
      Phone.MakeCall(odsJur.FieldByName('drvphone').AsString);
      exit;
    end;
end;

procedure TfrmMain.aCallDriverExecute(Sender: TObject);
begin
  if not (Phone.IsBusy) then
    begin
      Phone.MakeCall(odsJur.FieldByName('drvphone').AsString);
      exit;
    end;
  if not (Phone2.IsBusy) then
    begin
      Phone2.MakeCall(odsJur.FieldByName('drvphone').AsString);
      exit;
    end;
end;

procedure TfrmMain.aChangeExecute(Sender: TObject);
begin
  if pcButtons.ActivePageIndex = 0 then
    begin
      pcButtons.ActivePageIndex := 1;
      aChange.ImageIndex := 2;
      aChange.Hint := 'Закладка "Кнопки" ';
    end else
    begin
      pcButtons.ActivePageIndex := 0;
      aChange.ImageIndex := 3;
      aChange.Hint := 'Закладка "Последние расчеты" ';      
    end;
end;

procedure TfrmMain.bHomeAdrClick(Sender: TObject);
begin
  if Assigned(frmSetAdr1) then
    begin
      frmSetAdr1.pTypeShow := 2;
      frmSetAdr1.Show;
    end else
    begin
      Application.CreateForm(TfrmSetAdr1, frmSetAdr1);
      frmSetAdr1.pTypeShow := 2;
      odsDetailAdrHome.Close;
      odsDetailAdrHome.SetVariable('pfk_clientid', odsJur.FieldByName('fk_clientid').AsInteger);
      odsDetailAdrHome.Open;
      frmSetAdr1.sPrefix := odsDetailAdrHome.FieldByName('fc_preffix').AsString;
      frmSetAdr1.teAdr1.Tag := odsDetailAdrHome.FieldByName('fk_idadr1').AsInteger;
      frmSetAdr1.teAdr2.Tag := odsDetailAdrHome.FieldByName('fk_idadr2').AsInteger;
      if frmSetAdr1.teAdr1.Tag <> 0 then
        begin
          frmSetAdr1.teAdr1.Properties.OnChange := nil;
          frmSetAdr1.teAdr1.Text := odsDetailAdrHome.FieldByName('fc_street').AsString;
          frmSetAdr1.teAdr1.Properties.OnChange := frmSetAdr1.teAdr1PropertiesChange;
          frmSetAdr1.aOk.Enabled := True;
        end;
      if frmSetAdr1.teAdr2.Tag <> 0 then
        begin
          frmSetAdr1.teAdr2.Properties.OnChange := nil;
          frmSetAdr1.teAdr2.Text := odsDetailAdrHome.FieldByName('fc_street1').AsString;
          frmSetAdr1.teAdr2.Properties.OnChange := frmSetAdr1.teAdr2PropertiesChange;
        end;
      frmSetAdr1.teHouse.Text := odsDetailAdrHome.FieldByName('fc_house').AsString+odsDetailAdrHome.FieldByName('fc_housefraction').AsString;
      frmSetAdr1.teHall.Text := odsDetailAdrHome.FieldByName('fc_hall').AsString;
      frmSetAdr1.teHouseLiter.Text := odsDetailAdrHome.FieldByName('fc_houseliter').AsString;
      frmSetAdr1.teDop.Text := odsDetailAdrHome.FieldByName('fc_dop').AsString;
      frmSetAdr1.DoShowForm(0, 0, 0, odsDetailAdrHome.FieldByName('fk_type').AsInteger, odsJur.FieldByName('fk_clientid').AsInteger);
      frmSetAdr1.Show;
    end;

//  if Assigned(frmAdr1) then
//    begin
//      frmAdr1.Show;
//    end else
//    begin
//      Application.CreateForm(TfrmAdr1, frmAdr1);
//      frmAdr1.Caption := 'Домашний адрес клиента';
//      frmAdr1.imHand.Visible := False;
//      frmAdr1.lbHand.Visible := False;
//      frmAdr1.bHome.Visible := False;
//      odsDetailAdrHome.Close;
//      odsDetailAdrHome.SetVariable('pfk_clientid', odsJur.FieldByName('fk_clientid').AsInteger);
//      odsDetailAdrHome.Open;
//      if odsDetailAdrHome.RecordCount > 0 then
//        begin
//          if odsDetailAdrHome.FieldByName('fc_street1').AsString <> '' then
//            frmAdr1.teAdr.Text := odsDetailAdrHome.FieldByName('fc_street').AsString+'/'+odsDetailAdrHome.FieldByName('fc_street1').AsString
//          else
//            frmAdr1.teAdr.Text := odsDetailAdrHome.FieldByName('fc_street').AsString;
//          if odsDetailAdrHome.FieldByName('fc_house').AsString <> '' then
//            frmAdr1.teAdr.Text := frmAdr1.teAdr.Text+' '+odsDetailAdrHome.FieldByName('fc_house').AsString;
//          if odsDetailAdrHome.FieldByName('fc_housefraction').AsString <> '' then
//            frmAdr1.teAdr.Text := frmAdr1.teAdr.Text+odsDetailAdrHome.FieldByName('fc_housefraction').AsString;
//          if odsDetailAdrHome.FieldByName('fc_houseliter').AsString <> '' then
//            frmAdr1.teAdr.Text := frmAdr1.teAdr.Text+odsDetailAdrHome.FieldByName('fc_houseliter').AsString;
//          if odsDetailAdrHome.FieldByName('fc_hall').AsString <> '' then
//            frmAdr1.teAdr.Text := frmAdr1.teAdr.Text+' '+odsDetailAdrHome.FieldByName('fc_hall').AsString;
//
//          frmAdr1.teDop.Text := odsDetailAdrHome.FieldByName('fc_dop').AsString;
//          frmAdr1.sStreet := odsDetailAdrHome.FieldByName('fc_street').AsString;
//          frmAdr1.sStreet1 := odsDetailAdrHome.FieldByName('fc_street1').AsString;
//          frmAdr1.sHouse := odsDetailAdrHome.FieldByName('fc_house').AsString;
//          frmAdr1.sHouseFraction := odsDetailAdrHome.FieldByName('fc_housefraction').AsString;
//          frmAdr1.sHouseLiter := odsDetailAdrHome.FieldByName('fc_houseliter').AsString;
//          frmAdr1.sHall := odsDetailAdrHome.FieldByName('fc_hall').AsString;
//          frmAdr1.pType := odsDetailAdrHome.FieldByName('fk_type').AsInteger;
//          frmAdr1.idAdr1 := odsDetailAdrHome.FieldByName('fk_idadr1').AsInteger;
//          frmAdr1.idAdr2 := odsDetailAdrHome.FieldByName('fk_idAdr2').AsInteger;
//
//          if odsDetailAdrHome.FieldByName('fl_isdownslash').AsInteger = 1 then
//            frmAdr1.isDownSlash := True
//          else
//            frmAdr1.isDownSlash := False;
//
//          frmAdr1.odsAdr.Locate('fk_id', odsDetailAdrHome.FieldByName('fk_idadr1').AsInteger, []);
//          frmAdr1.aOk.Enabled := True;
//        end;
//
//      frmAdr1.DoShowForm(odsJur.FieldByName('fk_id').AsInteger, odsJur.FieldByName('fk_clientid').AsInteger, 1);
//      frmAdr1.Show;
//    end;
end;

procedure TfrmMain.bBonusClick(Sender: TObject);
begin
  try
    if Assigned(dlgBonus) then
      begin
        dlgBonus.IdJur := odsJur.FieldByName('fk_id').AsInteger;
        dlgBonus.IdClient := odsJur.FieldByName('fk_clientid').AsInteger;
        dlgBonus.IdDrv := odsJur.FieldByName('fk_drvid').AsInteger;
        dlgBonus.Show;
      end else
      begin
        Application.CreateForm(TdlgBonus, dlgBonus);
        dlgBonus.IdJur := odsJur.FieldByName('fk_id').AsInteger;
        dlgBonus.IdClient := odsJur.FieldByName('fk_clientid').AsInteger;
        dlgBonus.IdDrv := odsJur.FieldByName('fk_drvid').AsInteger;
        dlgBonus.Show;
      end;
  except
    Application.CreateForm(TdlgBonus, dlgBonus);
  end;
end;

procedure TfrmMain.bbPeregruzClick(Sender: TObject);
begin
  if odsJur.FieldByName('fl_bagage').AsInteger = 1 then
    bBagage.Caption := 'Закончили ехать с перегрузом'
  else
    bBagage.Caption := 'Начали ехать с перегрузом';
  pcOptions.ActivePageIndex := 9;
end;

procedure TfrmMain.bKodClick(Sender: TObject);
begin
  if odsJur.FieldByName('fk_clientid').AsInteger <> 0 then // если есть привязка к клиенту
    begin
      if Assigned(frmKod) then
        begin
          frmKod.Show;
        end else
        begin
          Application.CreateForm(TfrmKod, frmKod);
          frmKod.DoShowForm(odsJur.FieldByName('fk_clientid').AsInteger);
          frmKod.Show;
        end;
    end;
end;

procedure TfrmMain.bNumAbClick(Sender: TObject);
begin
  if bNumAb.Caption = '' then
    begin
      if Assigned(frmNumAbonent) then
        begin
          frmNumAbonent.Show;
        end else
        begin
          Application.CreateForm(TfrmNumAbonent, frmNumAbonent);
          frmNumAbonent.DoShowForm(odsJur.FieldByName('fk_id').AsInteger, odsJur.FieldByName('fc_phone').AsString);
          frmNumAbonent.Show;
        end;
    end;
end;

procedure TfrmMain.bOtmenaBagageClick(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  Screen.Cursor := crSQLWait;
  try
    oq.Session := os;
    oq.SQL.Text := ' update taxi.tjournal set fl_bagage = 0, fl_bagage_real = 0 where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    oq.DeleteVariables;
    oq.SQL.Text := ' update taxi.tstops set fn_baggage = 0 where fk_jurid = :pfk_jurid ';
    oq.DeclareAndSet('pfk_jurid', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    frmMain.os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
    seBaggage.Properties.OnChange := nil;
    seBaggage.Value := 0;
    seBaggage.Properties.OnChange := seBaggagePropertiesChange;
  finally
    Screen.Cursor := crDefault;
    oq.Free;
    pcOptions.ActivePageIndex := 0;
  end;
end;

procedure TfrmMain.bOtmenaBagageKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_escape then
    bClosetsBagClick(nil);
end;

procedure TfrmMain.bSaveAddTimeClick(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal set fn_time = :pfn_time where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfn_time', otInteger, seAddTime.Value);
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
    bSaveAddTime.Enabled := False;
  finally
    oq.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.bSaveBaggageClick(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' merge into taxi.tstops using dual on (fk_jurid = :pfk_jurid) '+#13+
                   ' when not matched then insert (fk_jurid, fn_baggage) values(:pfk_jurid, :pfn_baggage) '+#13+
                   ' when matched then update set fn_baggage = :pfn_baggage where fk_jurid = :pfk_jurid ';
    oq.DeclareAndSet('pfk_jurid', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.DeclareAndSet('pfn_baggage', otInteger, seBaggage.Value);
    oq.Execute;
    oq.DeleteVariables;
    oq.SQL.Text := ' update taxi.tjournal set fl_bagage_real = 1 where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
  finally
    oq.Free;
    bSaveBaggage.Enabled := False;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.bSaveCommentClick(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal set fc_comment = :pfc_comment where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfc_comment', otString, memComment.Text);
    oq.DeclareAndSet('pfk_id', otInteger, memComment.Tag);
    oq.Execute;
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
  finally
    memComment.Tag := 0;
    oq.Free;
    memComment.Clear;
    pcOptions.ActivePageIndex := 0;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.bSaveFactClick(Sender: TObject);
begin
  if teFactSum.Tag = 1 then
    begin
      DoSaveFactSum(vJournal_ID.DataBinding.DataController.Values[RowId, vJournal_ID.Index],
                    vJournal_DrvId1.DataBinding.DataController.Values[RowId, vJournal_DrvID1.Index],
                    vJournal_DrvId1.DataBinding.DataController.Values[RowId, vJournal_DrvID2.Index],
                    vJournal_FkClientid.DataBinding.DataController.Values[RowId, vJournal_FkClientid.Index],
                    vJournal_FlBonus.DataBinding.DataController.Values[RowId, vJournal_FlBonus.Index],
                    vJournal_FnNow.DataBinding.DataController.Values[RowId, vJournal_FnNow.Index],
                    colIsStop.DataBinding.DataController.Values[RowId, colIsStop.Index],
                    colFl_Baggage.DataBinding.DataController.Values[RowId, colFl_Baggage.Index],
                    vJournal_NumDrv1.DataBinding.DataController.Values[RowId, vJournal_NumDrv1.Index]);
    end;
  if teFactSum.Tag = 2 then
    begin
      DoSaveFactSum(odsJur.FieldByName('fk_id').AsInteger,
                    odsJur.FieldByName('fk_drvid').AsInteger,
                    odsJur.FieldByName('fk_drvid2').AsInteger,
                    odsJur.FieldByName('fk_clientid').AsInteger,
                    odsJur.FieldByName('fl_bonus').AsInteger,
                    odsJur.FieldByName('fn_now').AsInteger,
                    odsJur.FieldByName('fl_isstop').AsInteger,
                    odsJur.FieldByName('fl_bagage').AsInteger,
                    odsJur.FieldByName('numdrv').AsString);
    end;
end;

procedure TfrmMain.bSaveFicsClick(Sender: TObject);
var oq : TOracleQuery;
begin
  odsSysDate.Close;
  odsSysDate.Open;
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal set fd_datef = :pfd_datef where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfd_datef', otDate, StrToDateTime(FormatDateTime('dd.mm.yyyy', odsSysDate.FieldByName('sysdate').AsDateTime)+teFics.Text));
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := frmMain.odsJurAfterScroll;
    odsJurAfterScroll(nil);
  finally
    oq.Free;
    bSaveFics.Enabled := False;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.bSaveStopCltClick(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' merge into taxi.tstops using dual on (fk_jurid = :pfk_jurid) '+#13+
                   ' when not matched then insert (fk_jurid, fn_stopclt) values(:pfk_jurid, :pfn_stopclt) '+#13+
                   ' when matched then update set fn_stopclt = :pfn_stopclt where fk_jurid = :pfk_jurid ';
    oq.DeclareAndSet('pfk_jurid', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.DeclareAndSet('pfn_stopclt', otInteger, seStopClt.Value);
    oq.Execute;
    oq.DeleteVariables;
    oq.SQL.Text := ' update taxi.tjournal set fl_stop_real = 1 where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;    
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;   
  finally
    oq.Free;
    bSaveStopClt.Enabled := False;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.bSaveStopDrvClick(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' merge into taxi.tstops using dual on (fk_jurid = :pfk_jurid) '+#13+
                   ' when not matched then insert (fk_jurid, fn_stopdrv) values(:pfk_jurid, :pfn_stopdrv) '+#13+
                   ' when matched then update set fn_stopdrv = :pfn_stopdrv where fk_jurid = :pfk_jurid ';
    oq.DeclareAndSet('pfk_jurid', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.DeclareAndSet('pfn_stopdrv', otInteger, seStopDrv.Value);
    oq.Execute;
    oq.DeleteVariables;
    oq.SQL.Text := ' update taxi.tjournal set fl_stop_real = 1 where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
  finally
    oq.Free;
    bSaveStopDrv.Enabled := False;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.bSaveSumFClick(Sender: TObject); // "Сохранить" сумма по факту
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal set fn_sumf = :pfn_sumf, fn_sos = 1, fd_dater = sysdate where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfn_sumf', otInteger, seSumF.Value);
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;

    DoDriverEvent(odsJur.FieldByName('fk_id').AsInteger,
                  odsJur.FieldByName('fk_drvid').AsInteger,
                  odsJur.FieldByName('fk_drvid2').AsInteger,
                  0,
                  'END_CLIENT_MOVE');
// -- если ехали с багажом, то принудительно снимаем багаж
        if odsJur.FieldByName('fl_bagage').AsInteger = 1 then
          begin
            DoStopWithBaggageMove(odsJur.FieldByName('fk_id').AsInteger);
          end;
// -- если была остановка, то принудительно снимаем остановку
    if odsJur.FieldByName('fl_isstop').AsInteger <> 0 then
      begin
        aContinueExecute(nil);
      end;

    bSaveSumF.Enabled := False;

    if odsJur.FieldByName('fn_sos').AsInteger <> 1 then // если первый раз происходит расчет то + поездку
      begin
        DoKolvoTrips(odsJur.FieldByName('fk_clientid').AsInteger,
                     odsJur.FieldByName('fl_bonus').AsInteger,
                     odsJur.FieldByName('fn_now').AsInteger);
      end;
    os.Commit;
    DoShowRemark('Позывной № '+odsJur.FieldByName('numdrv').AsString+' оплата по факту - '+FloatToStr(round(seSumF.Value))+' руб.', stCapValue);
    DoInsLastRas(odsJur.FieldByName('numdrv').AsString, FloatToStr(round(seSumF.Value)), odsJur.FieldByName('fk_id').AsInteger);
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
    DoVisibleContinueRas;
    DoEnableVisibleStop;
    DoVisibleCopy;
  finally
    oq.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.bSaveSumFMGClick(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    if odsJur.FieldByName('fd_datef_chr').AsString <> '' then // если водитель зафиксирован, то НЕ закрываем заказ
      oq.SQL.Text := ' update taxi.tjournal set fn_sumfmg = :pfn_sumfmg where fk_id = :pfk_id '
    else
      oq.SQL.Text := ' update taxi.tjournal set fn_sumfmg = :pfn_sumfmg, fn_sos = 1 where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfn_sumfmg', otInteger, seSumFMG.Value);
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;

//    DoDriverEvent(odsJur.FieldByName('fk_id').AsInteger, // !!! пока временно закомментировал 26.01.2013
//                  odsJur.FieldByName('fk_drvid').AsInteger,
//                  odsJur.FieldByName('fk_drvid2').AsInteger,
//                  0,
//                  'END_CLIENT_MOVE');

    bSaveSumFMG.Enabled := False;
//    if odsJur.FieldByName('fn_sos').AsInteger <> 1 then // если первый раз происходит расчет то + поездку
//      begin
//        DoKolvoTrips(odsJur.FieldByName('fk_clientid').AsInteger,
//                     odsJur.FieldByName('fl_bonus').AsInteger,
//                     odsJur.FieldByName('fn_now').AsInteger);
//      end;

    os.Commit;
    DoShowRemark('Факт по м/г - '+FloatToStr(round(seSumFMG.Value))+' руб.', stCapValue);
    DoInsLastRas(odsJur.FieldByName('numdrv').AsString, FloatToStr(round(seSumFMG.Value)), odsJur.FieldByName('fk_id').AsInteger);
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
  finally
    oq.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.bSaveTimeClick(Sender: TObject);
begin
  if seAddTime1.Tag = 1 then
    DoSaveTime(vJournal_ID.DataBinding.DataController.Values[RowId, vJournal_ID.Index]);
  if seAddTime1.Tag = 2 then
    DoSaveTime(odsJur.FieldByName('fk_id').AsInteger);
end;

procedure TfrmMain.bSetHomeClick(Sender: TObject);
var oq : TOracleQuery;
begin
  odsDetailAdrHome.Close;
  odsDetailAdrHome.SetVariable('pfk_clientid', odsJur.FieldByName('fk_clientid').AsInteger);
  odsDetailAdrHome.Open;
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal '+#13+
                   '    set fc_adr1 = :pfc_adr1, '+#13+
                   '        fk_adr1id = :pfk_adr1id, '+#13+
                   '        fk_raionid = taxi.pkg_drivergrid.GetStreetDistrict(:pfk_adr1id, :pfk_adr2id, :pfn_num) '+#13+
                   '  where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfc_adr1', otString, bHomeAdr.Caption+' '+odsDetailAdrHome.FieldByName('fc_dop').AsString);
    oq.DeclareAndSet('pfk_adr1id', otInteger, bSetHome.Tag);
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.DeclareAndSet('pfk_adr2id', otInteger, odsDetailAdrHome.FieldByName('fk_idadr2').AsInteger);
    if odsDetailAdrHome.FieldByName('fc_house').AsString = '' then
      oq.DeclareAndSet('pfn_num', otInteger, 0)
    else
      oq.DeclareAndSet('pfn_num', otInteger, StrToInt(odsDetailAdrHome.FieldByName('fc_house').AsString));
    oq.Execute;
    oq.DeleteVariables;
    oq.SQL.Text := ' update taxi.tjuradr1 '+#13+
                   '    set fc_adr=:pfc_adr, fc_dop=:pfc_dop, fk_type=:pfk_type, fc_street=:pfc_street, fc_street1=:pfc_street1, '+#13+
                   '        fl_isdownslash=:pfl_isdownslach, fk_idadr1=:pfk_idadr1, fk_idadr2=:pfk_idadr2, fc_house=:pfc_house, '+#13+
                   '        fc_houseliter=:pfc_houseliter, fc_hall=:pfc_hall, fc_adr_place=:pfc_adr_place, fc_housefraction=:pfc_housefraction, '+#13+
                   '        fc_preffix = :pfc_preffix '+#13+
                   '  where fk_jurid = :pfk_id ';
    oq.DeclareAndSet('pfc_adr', otString, odsDetailAdrHome.FieldByName('fc_adr').AsString);
    oq.DeclareAndSet('pfc_dop', otString, odsDetailAdrHome.FieldByName('fc_dop').AsString);
    oq.DeclareAndSet('pfk_type', otInteger, odsDetailAdrHome.FieldByName('fk_type').AsInteger);
    oq.DeclareAndSet('pfc_street', otString, odsDetailAdrHome.FieldByName('fc_street').AsString);
    oq.DeclareAndSet('pfc_street1', otString, odsDetailAdrHome.FieldByName('fc_street1').AsString);
    oq.DeclareAndSet('pfl_isdownslach', otInteger, odsDetailAdrHome.FieldByName('fl_isdownslash').AsInteger);
    oq.DeclareAndSet('pfk_idadr1', otInteger, odsDetailAdrHome.FieldByName('fk_idadr1').AsInteger);
    oq.DeclareAndSet('pfk_idadr2', otInteger, odsDetailAdrHome.FieldByName('fk_idadr2').AsInteger);
    oq.DeclareAndSet('pfc_house', otString, odsDetailAdrHome.FieldByName('fc_house').AsString);
    oq.DeclareAndSet('pfc_houseliter', otString, odsDetailAdrHome.FieldByName('fc_houseliter').AsString);
    oq.DeclareAndSet('pfc_hall', otString, odsDetailAdrHome.FieldByName('fc_hall').AsString);
    oq.DeclareAndSet('pfc_adr_place', otString, odsDetailAdrHome.FieldByName('fc_adr_place').AsString);
    oq.DeclareAndSet('pfc_housefraction', otString, odsDetailAdrHome.FieldByName('fc_housefraction').AsString);
    oq.DeclareAndSet('pfc_preffix', otString, odsDetailAdrHome.FieldByName('fc_preffix').AsString);
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.bSetRasNowClick(Sender: TObject); // расчет от текущего времени
var oq : TOracleQuery;
begin
//-- начинаем Расчет
  Application.CreateForm(TdlgSetRaschet, dlgSetRaschet);
  try
    dlgSetRaschet.lbCap.Caption := 'Расчет '+odsJur.FieldByName('numdrv').AsString+'-го от текущего'+#13#10+'времени? ';
    dlgSetRaschet.ShowModal;
    if dlgSetRaschet.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update taxi.tjournal set fd_dater = sysdate where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
          oq.Execute;
          os.Commit;
        finally
          oq.Free;
        end;
        DoItogo(1, // от текущего времени
                odsJur.FieldByName('fk_id').AsInteger,
                odsJur.FieldByName('fn_stop').AsInteger,
                odsJur.FieldByName('fl_peregon').AsInteger,
                odsJur.FieldByName('fn_km1').AsFloat,
                odsJur.FieldByName('fn_km2').AsFloat,
                odsJur.FieldByName('fn_time').AsInteger,
                odsJur.FieldByName('fl_stop_real').AsInteger,
                odsJur.FieldByName('fl_talon').AsInteger,
                odsJur.FieldByName('fk_adr1id').AsInteger,
                odsJur.FieldByName('numdrv').AsString); //-- общий расчет
        DoEnableRas;
      end;
  finally
    dlgSetRaschet.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.bTopClick(Sender: TObject);
begin
  odsJur.AfterScroll := nil;
  odsJur.First;
  odsJur.AfterScroll := odsJurAfterScroll;
  odsJurAfterScroll(nil);
  VJOURNAL_DATEIN.Focused := True;
  grJournal.SetFocus;
end;

procedure TfrmMain.bCancelCommentClick(Sender: TObject);
begin
  memComment.Tag := 0;
  pcOptions.ActivePageIndex := 0;
  VJOURNAL_DATEIN.Focused := True;
  grJournal.SetFocus;
end;

procedure TfrmMain.bCancelFactClick(Sender: TObject);
begin
  teFactSum.Tag := 0;
  teFactSum.Clear;
  pcOptions.ActivePageIndex := 0;
  VJOURNAL_DATEIN.Focused := True;
  grJournal.SetFocus;
end;

procedure TfrmMain.bCancelKmClick(Sender: TObject);
begin
  teNum.Clear;
  teNum.Tag := 0;
  pcOptions.ActivePageIndex := 0;
  VJOURNAL_DATEIN.Focused := True;
  grJournal.SetFocus;
end;

procedure TfrmMain.bCancelPenaltyClick(Sender: TObject);
begin
  try
    sePenalty.Clear;
    sePenalty.Tag := 0;
    pcOptions.ActivePageIndex := 0;
  finally
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.bCancelTimeClick(Sender: TObject);
begin
  seAddTime1.Clear;
  seAddTime1.Tag := 0;
  pcOptions.ActivePageIndex := 0;
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus;  
end;

procedure TfrmMain.bClearDopTimeClick(Sender: TObject);
begin
  seAddTime1.Value := 0;
end;

procedure TfrmMain.bClearKm1Click(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal set fn_km1 = 0, fn_km2 = 0 where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
    teNumKm.Text := '';
  finally
    oq.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;    
  end;
end;

procedure TfrmMain.bClearKMClick(Sender: TObject);
begin
  teNum.Text := '';
end;

procedure TfrmMain.bClearTimeClick(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal set fn_time = 0 where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
    seAddTime.Value := 0;
  finally
    oq.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.bBagageClick(Sender: TObject);
var oq : TOracleQuery;
    ods : TOracleDataSet;
begin
  if bBagage.Caption = 'Начали ехать с перегрузом' then
    begin
      oq := TOracleQuery.Create(nil);
      Screen.Cursor := crSQLWait;
      try
        oq.Session := os;
        oq.SQL.Text := ' update taxi.tjournal set fl_bagage = 1, fl_bagage_real = 1, fd_baggage = sysdate where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
        oq.Execute;
        os.Commit;
        odsJur.AfterScroll := nil;
        RefreshQuery(odsJur);
        odsJur.AfterScroll := odsJurAfterScroll;
        teVvod.Text := '';
      finally
        Screen.Cursor := crDefault;
        oq.Free;
      end;
      bBagage.Caption := 'Закончили ехать с перегрузом';
    end else
    begin
      ods := TOracleDataSet.Create(nil);
      oq := TOracleQuery.Create(nil);
      Screen.Cursor := crSQLWait;
      try
        ods.Session := os;
        ods.SQL.Text := ' select round((sysdate - fd_baggage)*24*60) as cntTime from taxi.tjournal where fk_id = :pfk_id ';
        ods.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
        ods.Open;
        oq.Session := os;
        if ods.FieldByName('cntTime').AsInteger > 0 then
          begin
            oq.DeleteVariables;
            oq.SQL.Text := ' merge into taxi.tstops using dual on (fk_jurid = :pfk_jurid) '+#13+
                           ' when not matched then insert(fk_jurid, fn_baggage) values(:pfk_jurid, :pfn_baggage) '+#13+
                           ' when matched then update set fn_baggage = fn_baggage+:pfn_baggage where fk_jurid = :pfk_jurid ';
            oq.DeclareAndSet('pfk_jurid', otInteger, odsJur.FieldByName('fk_id').AsInteger);
            oq.DeclareAndSet('pfn_baggage', otInteger, ods.FieldByName('cntTime').AsInteger);
            oq.Execute;
          end;
        oq.DeleteVariables;
        oq.SQL.Text := ' update taxi.tjournal set fl_bagage = 0, fd_baggage = null where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
        oq.Execute;
        os.Commit;
        odsJur.AfterScroll := nil;
        RefreshQuery(odsJur);
        odsJur.AfterScroll := odsJurAfterScroll;
        bSaveBaggage.Enabled := False;
        odsStops.Close;
        odsStops.SetVariable('pfk_jurid', odsJur.FieldByName('fk_id').AsInteger);
        odsStops.Open;
        seBaggage.Properties.OnChange := nil;
        seBaggage.Value := odsStops.FieldByName('fn_baggage').AsInteger;
        seBaggage.Properties.OnChange := seBaggagePropertiesChange;
        teVvod.Text := '';
      finally
        Screen.Cursor := crDefault;
        oq.Free;
        ods.Free;
      end;
      bBagage.Caption := 'Начали ехать с перегрузом';
    end;
  pcOptions.ActivePageIndex := 0;  
end;

procedure TfrmMain.bBagageKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_escape then
    bClosetsBagClick(nil);
end;

procedure TfrmMain.bbFicsClick(Sender: TObject);  // !!! 14.11.2012  удалить через 2 месяца
begin
//  if odsJur.FieldByName('numdrv').AsString <> '' then
//    begin
//      if odsJur.FieldByName('fd_datef_str').AsString = '' then
//        DoFicsDrv(0)
//      else
//        DoFicsDrv(1);
//      teFics.Properties.OnChange := nil;
//      teFics.Time := odsJur.FieldByName('fd_datef').AsDateTime;
//      teFics.Properties.OnChange := teFicsPropertiesChange;
//      DoEnableVisibleStop; // показываем, инайблим все кнопки остановок
//    end else
//    begin
//      beep;
//      DoShowRemark('Для заказа не выбрана машина!', stError);
//    end;
end;

procedure TfrmMain.bbKmClick(Sender: TObject);
begin
  pcOptions.ActivePageIndex := 2;
  teNum.SetFocus;
end;

procedure TfrmMain.bDelBaggageClick(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tstops set fn_baggage = 0 where fk_jurid = :pfk_jurid ';
    oq.DeclareAndSet('pfk_jurid', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    oq.DeleteVariables;
    oq.SQL.Text := ' update taxi.tjournal set fl_bagage = 0, fl_bagage_real = 0 where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
    seBaggage.Value := 0;
  finally
    oq.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.bDelDrvClick(Sender: TObject); // "Удалить" водителя
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal '+#13+
                   '    set fk_drvid = 0, fk_drvid2 = 0, fn_sos = 9 '+#13+
                   '  where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    os.Commit;

    DoDriverEvent(odsJur.FieldByName('fk_id').AsInteger,
                  odsJur.FieldByName('fk_drvid').AsInteger,
                  odsJur.FieldByName('fk_drvid2').AsInteger,
                  0,
                  'CANCEL_ZAKAZ');

    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;

    lbDrv.Caption := '--';
    lbDrv.Style.TextColor := clRed;
    DoEnableDrv;
    DoEnableFicsControls;
    DoEnableAddTimeControls;
    DoEnableStopControls;
    DoEnableKmControls;
    DoEnableFree;
    DoEnablePeregon;
    DoEnableNeoplata;
    DoEnableFactControls;
    DoEnablePredZakaz;

    DoVisibleKM;
    DoVisibleSumCall;
    DoVisibleOtmena;
    DoVisibleNotExit;
  finally
    oq.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.bDelFicsClick(Sender: TObject); // "Удаление" фиксации
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal set fd_datef = null where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    os.Commit;

    DoDriverEvent(odsJur.FieldByName('fk_id').AsInteger,
                  odsJur.FieldByName('fk_drvid').AsInteger,
                  odsJur.FieldByName('fk_drvid2').AsInteger,
                  0,
                  'CANCEL_CLIENT_MOVE');

    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;

    teFics.Text := '00:00';
    DoEnableFicsControls;
    DoEnableStopControls;
    DoEnableFree;
    DoEnablePeregon;
    DoEnableNeoplata;
    DoEnableVisibleStop;
    DoEnableDrv;
    DoEnableBaggage;

    DoVisibleOtmena;
    DoVisibleCopy;
    DoVisibleFact;
    DoVisibleKM;
    DoVisibleNotExit;
    DoVisibleComeBack;
    DoVisibleAddTime;
    DoVisibleSumCall;
    DoVisibleContinueRas;
    DoVisibleFact;
    DoVisibleLastRas;

    bSaveFics.Enabled := False;
  finally
    oq.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.bDelRasClick(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal '+#13+
                   '    set fn_sos = 8, fn_sos2 = 1, fd_dater = null, fn_sumr = 0, '+#13+
                   '        fn_summg = 0, fn_sumgorod = 0, fn_time_trip = 0, fn_sumf = 0, fn_sumfmg = 0 '+#13+
                   '  where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    os.Commit;

    DoDriverEvent(odsJur.FieldByName('fk_id').AsInteger,
                  odsJur.FieldByName('fk_drvid').AsInteger,
                  odsJur.FieldByName('fk_drvid2').AsInteger,
                  odsJur.FieldByName('fk_adr2id').AsInteger,
                  'START_CLIENT_MOVE');

    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;

    DoVisibleContinueRas;
    DoVisibleCopy;
    DoVisibleComeBack;
    DoVisibleKM;
    DoVisibleSumCall;
    DoVisibleOtmena;
    DoVisibleNotExit;

    DoEnableVisibleStop;
    DoEnableFicsControls;
    DoEnableAdr1;
    DoEnableAdr2;
    DoEnableRas;
    DoEnableAddTimeControls;
    DoEnableKmControls;
    DoEnableFactControls;

    lbSumR.Caption := '0';
    seSumF.Value := 0;
    seSumFMG.Value := 0;
  finally
    oq.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.bDelStopCltClick(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tstops set fn_stopclt = 0 where fk_jurid = :pfk_jurid ';
    oq.DeclareAndSet('pfk_jurid', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    if seStopDrv.Value = 0 then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' update taxi.tjournal set fl_stop_real = 0 where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
        oq.Execute;
      end;
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
    seStopClt.Value := 0;
  finally
    oq.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.bDelStopDrvClick(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tstops set fn_stopdrv = 0 where fk_jurid = :pfk_jurid ';
    oq.DeclareAndSet('pfk_jurid', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    if seStopClt.Value = 0 then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' update taxi.tjournal set fl_stop_real = 0 where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
        oq.Execute;
      end;
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
    seStopDrv.Value := 0;
  finally
    oq.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.bDelSumFClick(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal set fn_sumf = 0 where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    os.Commit;
    seSumF.Value := 0;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
  finally
    oq.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.bDelSumFMGClick(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal set fn_sumfmg = 0 where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    os.Commit;
    seSumFMG.Value := 0;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
  finally
    oq.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.bDopFuncClick(Sender: TObject);
var id : Integer;
begin
  intTimer := 0;
  if teVvod.Text <> '' then
    begin
      odsJur.AfterScroll := nil;
      id := odsJur.FieldByName('fk_id').AsInteger;
      if odsJur.Locate('numdrv', teVvod.Text, []) = True then
        begin
          if (odsJur.FieldByName('fn_sos').AsInteger = 2)
          or (odsJur.FieldByName('fn_sos').AsInteger = 3)
          or (odsJur.FieldByName('fn_sos').AsInteger = 4) then
            begin
              odsJur.Locate('fk_id', id, []);
            end;
        end else
        begin
//          teVvod.Style.Color := clRed;
          tWrong.Enabled := True;
        end;
      odsJur.AfterScroll := odsJurAfterScroll;
      odsJurAfterScroll(nil);
    end;
  pcOptions.ActivePageIndex := 8;
end;

procedure TfrmMain.bSaveKm1Click(Sender: TObject);
var sNum1, sNum2 : String;
    oq : TOracleQuery;
begin
  if Pos('/', teNumKm.Text) = 0 then
    begin
      sNum1 := teNumKm.Text;
    end else
    begin
      sNum1 := copy(teNumKm.Text, 1, Pos('/', teNumKm.Text)-1);
    end;
  sNum2 := trim(copy(teNumKm.Text, Length(sNum1)+2, Length(teNumKm.Text) - Length(sNum1)));
  if sNum2 = '' then
    sNum2 := '0';
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal set fn_km1 = :pfn_km1, fn_km2 = :pfn_km2 where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfn_km1', otFloat, StrToFloat(sNum1));
    oq.DeclareAndSet('pfn_km2', otFloat, StrToFloat(sNum2));
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
    bSaveKm1.Enabled := False;
  finally
    oq.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.bSaveKMClick(Sender: TObject);
begin
  if teNum.Tag = 1 then
    DoSaveKm(vJournal_ID.DataBinding.DataController.Values[RowID, vJournal_ID.Index]);
  if teNum.Tag = 2 then
    DoSaveKm(odsJur.FieldByName('fk_id').AsInteger);
end;

procedure TfrmMain.bSavePenaltyClick(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' insert into taxi.tpenalty(fd_datepen, fk_drvid, fn_sumpen) '+#13+
                   ' values(trunc(sysdate), :pfk_drvid, :pfn_sumpen) ';
    oq.DeclareAndSet('pfk_drvid', otInteger, sePenalty.Tag);
    oq.DeclareAndSet('pfn_sumpen', otInteger, sePenalty.Value);
    oq.Execute;
    os.Commit;
    sePenalty.Clear;
    sePenalty.Tag := 0;
    pcOptions.ActivePageIndex := 0;
    teVvod.Text := '';
  finally
    oq.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.bDriverStopClick(Sender: TObject);
begin
  DoStopDrv(odsJur.FieldByName('fk_id').AsInteger);
end;

procedure TfrmMain.bClientStopClick(Sender: TObject);
begin
  DoStopClient(odsJur.FieldByName('fk_id').AsInteger);
end;

procedure TfrmMain.bClosetsBagClick(Sender: TObject);
begin
  pcOptions.ActivePageIndex := 0;
end;

procedure TfrmMain.cbFreePropertiesChange(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal set fl_free = :pfl_free where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    if cbFree.Checked = True then
      begin
        oq.DeclareAndSet('pfl_free', otInteger, 1);
      end else
      begin
        oq.DeclareAndSet('pfl_free', otInteger, 0);
      end;
    oq.Execute;
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.cbNeoplPropertiesChange(Sender: TObject); // Неоплата
var oq : TOracleQuery;
begin
  if cbNeopl.Checked = True then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update taxi.tjournal set fn_sos = 4, fn_sos_prev = fn_sos where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' update taxi.ts_client set fl_neopl = 1 where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_clientid').AsInteger);
        oq.Execute;
        if odsJur.FieldByName('fn_sos').AsInteger <> 1 then // если заказ НЕ закрыт
          begin
            DoDriverEvent(odsJur.FieldByName('fk_id').AsInteger,
                          odsJur.FieldByName('fk_drvid').AsInteger,
                          odsJur.FieldByName('fk_drvid2').AsInteger,
                          0,
                          'END_CLIENT_MOVE');
          end;
// -- если ехали с багажом, то принудительно снимаем багаж
        if odsJur.FieldByName('fl_bagage').AsInteger = 1 then
          begin
            DoStopWithBaggageMove(odsJur.FieldByName('fk_id').AsInteger);
          end;
// -- если была остановка, то принудительно снимаем остановку
        if odsJur.FieldByName('fl_isstop').AsInteger <> 0 then
          begin
            aContinueExecute(nil);
          end;
        os.Commit;
        odsJur.AfterScroll := nil;
        RefreshQuery(odsJur);
        odsJur.AfterScroll := odsJurAfterScroll;
      finally
        oq.Free;
      end;
    end else
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update taxi.tjournal set fn_sos = fn_sos_prev where fk_id = :pfk_id '; 
        oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
        oq.Execute;
        oq.DeleteVariables;
        oq.SQL.Text := ' update taxi.ts_client set fl_neopl = 0 where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_clientid').AsInteger);
        oq.Execute;
        os.Commit;
        if odsJur.FieldByName('fn_sos_prev').AsInteger = 8 then // если предыдущий статус "обрабатывается", то возвращаем таксиста в движение
          begin
            DoDriverEvent(odsJur.FieldByName('fk_id').AsInteger,
                          odsJur.FieldByName('fk_drvid').AsInteger,
                          odsJur.FieldByName('fk_drvid2').AsInteger,
                          0,
                          'START_CLIENT_MOVE');
          end;
        odsJur.AfterScroll := nil;
        RefreshQuery(odsJur);
        odsJur.AfterScroll := odsJurAfterScroll;
      finally
        oq.Free;
      end;
    end;
  DoEnableFicsControls;
  DoEnableAddTimeControls;
  DoEnableStopControls;
  DoEnableKmControls;
  DoEnableFactControls;
  DoEnableVisibleStop;

  DoVisibleAddTime;
  DoVisibleFact;
  DoVisibleKM;
  DoVisibleCopy;

  DoShowState(odsJur.FieldByName('fn_sos').AsInteger);   
end;

procedure TfrmMain.cbPeregonPropertiesChange(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal set fl_peregon = :pfl_peregon where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    if cbPeregon.Checked = True then
      begin
        oq.DeclareAndSet('pfl_peregon', otInteger, 1);
      end else
      begin
        oq.DeclareAndSet('pfl_peregon', otInteger, 0);
      end;
    oq.Execute;
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.cbTalonPropertiesChange(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal set fl_talon = :pfl_talon where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    if cbTalon.Checked = True then
      begin
        oq.DeclareAndSet('pfl_talon', otInteger, 1);
      end else
      begin
        oq.DeclareAndSet('pfl_talon', otInteger, 0);
      end;
    oq.Execute;
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.colCommentPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  pcOptions.ActivePageIndex := 5;
  memComment.SetFocus;
  memComment.Tag := odsJur.FieldByName('fk_id').AsInteger;
  memComment.Text := odsJur.FieldByName('fc_comment').AsString;
  memComment.SelLength := 0;
  memComment.SelStart := Length(memComment.Text);
end;

procedure TfrmMain.colSetAdr2PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if odsJur.FieldByName('fn_sos').AsInteger = 1 then
    begin
      beep;
      DoShowRemark('Заказ закрыт! Изменить адрес назначения нельзя!', stError);
      exit;
    end;
  pmRaion.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmMain.cxButton13Click(Sender: TObject);
begin
  if Pos('/', teNum.Text) = 0 then
    teNum.Text := teNum.Text+cxButton13.Caption
  else
    showmessage('Нельзя поставить 2 знака "/"!'); // !!! вместо showmessage выводить надпись
  teNum.SetFocus;
  teNum.SelLength := 0;
  teNum.SelStart := Length(teNum.Text);  
end;

procedure TfrmMain.cxButton1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  teFactSumMG.Clear;
  bSaveFact.Enabled := False;
end;

procedure TfrmMain.bClearPenaltyClick(Sender: TObject);
begin
  sePenalty.Value := 0;
end;

procedure TfrmMain.bPeregruzClick(Sender: TObject);
begin
  if odsJur.FieldByName('fl_bagage').AsInteger = 1 then
    bBagage.Caption := 'Закончили ехать с перегрузом'
  else
    bBagage.Caption := 'Начали ехать с перегрузом';
  pcOptions.ActivePageIndex := 4;
  bBagage.SetFocus;
end;

procedure TfrmMain.cxButton45MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  teFactSum.Clear;
  bSaveFact.Enabled := False;
end;

procedure TfrmMain.cxButton46MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  teVvod.Text := teVvod.Text + TcxButton(Sender).Caption;
end;

procedure TfrmMain.cxSplitter1BeforeClose(Sender: TObject;
  var AllowClose: Boolean);
begin
  paButtons.Visible := False;
end;

procedure TfrmMain.cxSplitter1BeforeOpen(Sender: TObject; var NewSize: Integer;
  var AllowOpen: Boolean);
begin
  paButtons.Visible := True;
end;

procedure TfrmMain.cxSplitter2BeforeClose(Sender: TObject;
  var AllowClose: Boolean);
begin
  paAllButtons.Visible := False;
end;

procedure TfrmMain.cxSplitter2BeforeOpen(Sender: TObject; var NewSize: Integer;
  var AllowOpen: Boolean);
begin
  paAllButtons.Visible := True;
end;

procedure TfrmMain.DoActions;
begin
  SetLength(FKeys, 14);
  FKeys[0].synonym := 'REFRESH_JUR';
  FKeys[0].action := aRefresh;

  FKeys[1].synonym := 'OTMENA_ZAKAZA';
  FKeys[1].action := aOtmena;

  FKeys[2].synonym := 'INFORMATION';
  FKeys[2].action := aInfo;

  FKeys[3].synonym := 'CHOOSE_DRIVER';
  FKeys[3].action := aSetDrv;

  FKeys[4].synonym := 'ADR1';
  FKeys[4].action := aAdr1;

  FKeys[5].synonym := 'ADR2';
  FKeys[5].action := aAdr2;

  FKeys[6].synonym := 'FICS';
  FKeys[6].action := aFics;

//  FKeys[7].synonym := 'SETSUM';  // Fenix Расчет пока ставим action вручную... потому что как-то пропадал shortcut
//  FKeys[7].action := aCalculate;

  FKeys[8].synonym := 'EDIT_ZAKAZ';
  FKeys[8].action := aEditZakaz;

  FKeys[9].synonym := 'STOP_DRIVER';
  FKeys[9].action := aStopDrv;

  FKeys[10].synonym := 'STOP_CLIENT';
  FKeys[10].action := aStopClient;

  FKeys[11].synonym := 'CONTINUE_STOP';
  FKeys[11].action := aContinue;

  LoadKey;
end;

procedure TfrmMain.DoClickMenuAdr2(Sender : TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal '+#13+
                   '    set fc_adr2 = :pfc_adr2, fk_adr2id = :pfk_adr2id '+#13+
                   '  where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfc_adr2', otString, TMenuItem(Sender).Caption);
    oq.DeclareAndSet('pfk_adr2id', otInteger, TMenuItem(Sender).Tag);
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    oq.DeleteVariables;
    oq.SQL.Text := ' merge into taxi.tjuradr2 using dual on (fk_jurid = :pfk_jurid) '+#13+
                   ' when matched then update set fc_adr = :pfc_adr where fk_jurid = :pfk_jurid '+#13+
                   ' when not matched then insert(fk_jurid, fc_adr) values(:pfk_jurid, :pfc_adr) ';
    oq.DeclareAndSet('pfk_jurid', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.DeclareAndSet('pfc_adr', otString, TMenuItem(Sender).Caption);
    oq.Execute;
    if odsJur.FieldByName('fd_datef_chr').AsString <> '' then
      begin
        DoDriverEvent(odsJur.FieldByName('fk_id').AsInteger,
                      odsJur.FieldByName('fk_drvid').AsInteger,
                      odsJur.FieldByName('fk_drvid2').AsInteger,
                      TMenuItem(Sender).Tag,
                      'START_CLIENT_MOVE');
      end;
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := frmMain.odsJurAfterScroll;
    DoVisibleLastRas;
  finally
    oq.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.DoCreateMenuAdr2;
var mi : TMenuItem;
    ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.SQL.Text := ' select fk_id, fc_name from taxi.ts_raion where fl_del = 0 order by fn_order ';
    ods.Open;
    ods.First;
    while not ods.Eof do
      begin
        mi := TMenuItem.Create(pmRaion);
        try
          mi.Caption := ods.FieldByName('fc_name').AsString;
          mi.Tag := ods.FieldByName('fk_id').AsInteger;
          mi.OnClick := DoClickMenuAdr2;
          pmRaion.Items.Add(mi);
          ods.Next;
        except
        end;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.DoCreateSubMenu;
var ods : TOracleDataSet;
    i, top : TMenuItem;
begin
  top := pmGrid.Items[15];
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select rownum, fk_id, fc_name from taxi.ts_taxi where fk_id <> :pfk_id and fl_del = 0 order by fc_name ';
    ods.DeclareAndSet('pfk_id', otInteger, pTaxiID);
    ods.Open;
    ods.First;
    while not ods.Eof do
      begin
        i := TMenuItem.Create(top);
        i.Caption := ods.FieldByName('fc_name').AsString;
        i.Tag := ods.FieldByName('fk_id').AsInteger;
        i.OnClick := DoSendToTaxi;
        i.ImageIndex := 2;
        top.OnClick := nil;
        top.Insert(top.Count, i);
        ods.Next;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.DoDriverEvent(pJurID, pDrvID, pDrvID2, pAdr2ID: Integer; sEvent: string);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
//-- первый позывной
    if pDrvID <> 0 then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into taxi.tdriverevent(fk_driver, fk_place, fk_journal, fk_drivereventtype) '+#13+
                       ' values(:pfk_driver, :pfk_place, :pfk_journal, (select fk_id from taxi.ts_drivereventtype where fc_synonym = :pfc_synonim)) ';
        oq.DeclareAndSet('pfk_driver', otInteger, pDrvID);
        oq.DeclareAndSet('pfk_journal', otInteger, pJurID);
        oq.DeclareAndSet('pfk_place', otInteger, pAdr2ID);
        oq.DeclareAndSet('pfc_synonim', otString, sEvent);
        oq.Execute;
      end;
//-- второй позывной
    if pDrvID2 <> 0 then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into taxi.tdriverevent(fk_driver, fk_place, fk_journal, fk_drivereventtype) '+#13+
                       ' values(:pfk_driver, :pfk_place, :pfk_journal, '+#13+
                       '        (select fk_id from taxi.ts_drivereventtype where fc_synonym = :pfc_synonim)) ';
        oq.DeclareAndSet('pfk_driver', otInteger, pDrvID2);
        oq.DeclareAndSet('pfk_journal', otInteger, pJurID);
        oq.DeclareAndSet('pfk_place', otInteger, pAdr2ID);
        oq.DeclareAndSet('pfc_synonim', otString, sEvent);
        oq.Execute;
      end;
    os.Commit;  
  finally
    oq.Free;
  end;      
end;

procedure TfrmMain.DoEnableAddTimeControls;
begin
  seAddTime.Enabled := (odsJur.RecordCount <> 0) and
                       (odsJur.FieldByName('numdrv').AsString <> '') and
                       (odsJur.FieldByName('fn_sos').AsInteger <> 3) and  // отменен
                       (odsJur.FieldByName('fn_sos').AsInteger <> 4) and // неоплата
                       (odsJur.FieldByName('fn_sos').AsInteger <> 5) and // невыход
                       (odsJur.FieldByName('fn_sos').AsInteger <> 6);
  bClearTime.Enabled := seAddTime.Enabled;
end;

procedure TfrmMain.DoEnableAdr1;
begin
  aAdr1.Enabled := (odsJur.FieldByName('fn_sos').AsInteger <> 1) and
                   (odsJur.FieldByName('fn_sos').AsInteger <> 3) and
                   (odsJur.FieldByName('fn_sos').AsInteger <> 4) and
                   (odsJur.RecordCount <> 0);
end;

procedure TfrmMain.DoEnableAdr2;
begin
  aAdr2.Enabled := (odsJur.RecordCount <> 0) and
                   (odsJur.FieldByName('fn_sos').AsInteger <> 3) and
                   (odsJur.FieldByName('fn_sos').AsInteger <> 4) and
                   (odsJur.FieldByName('fn_sos').AsInteger <> 5) and
                   (odsJur.FieldByName('fn_sos').AsInteger <> 6);
end;

procedure TfrmMain.DoEnableBaggage;
begin
  bPeregruz.Enabled := (odsJur.FieldByName('fd_datef_chr').AsString <> '') and
                       (odsJur.FieldByName('fn_sos').AsInteger = 8);
end;

procedure TfrmMain.DoEnableNeoplata;
begin
  cbNeopl.Enabled := (odsJur.FieldByName('numdrv').AsString <> '') and
                     (odsJur.FieldByName('fd_datef_chr').AsString <> '') and
                     (odsJur.FieldByName('fn_sos').AsInteger <> 3) and
                     (odsJur.FieldByName('fn_sos').AsInteger <> 5) and
                     (odsJur.FieldByName('fn_sos').AsInteger <> 6);
end;

procedure TfrmMain.DoEnableNumKod;
begin
//-- номер абонента
  if odsJur.FieldByName('fc_num').AsString <> '' then
    bNumAb.Caption := odsJur.FieldByName('fc_num').AsString
  else
    bNumAb.Caption := '';
  bNumAb.Enabled := (bNumAb.Caption = '') and (odsJur.RecordCount <> 0);

//-- кодовое слово
  if odsJur.FieldByName('fc_kod').AsString <> '' then
    bKod.Caption := odsJur.FieldByName('fc_kod').AsString
  else
    bKod.Caption := '';
  bKod.Enabled := bNumAb.Caption <> '';
end;

procedure TfrmMain.DoEnableDrv;
begin
  aSetDrv.Enabled := (odsJur.FieldByName('fn_sos').AsInteger <> 1) and
                     (odsJur.FieldByName('fn_sos').AsInteger <> 3) and
                     (odsJur.FieldByName('fn_sos').AsInteger <> 4) and
                     (odsJur.FieldByName('fn_sos').AsInteger <> 5) and
                     (odsJur.FieldByName('fn_sos').AsInteger <> 6) and
                     (odsJur.RecordCount <> 0);
  lbDrv.Enabled := aSetDrv.Enabled;
  bDelDrv.Enabled := (odsJur.RecordCount <> 0) and
                     (odsJur.FieldByName('numdrv').AsString <> '') and
                     (odsJur.FieldByName('fd_datef_chr').AsString = '') and
                     (odsJur.FieldByName('fn_sos').AsInteger <> 3) and
                     (odsJur.FieldByName('fn_sos').AsInteger <> 4) and
                     (odsJur.FieldByName('fn_sos').AsInteger <> 5) and
                     (odsJur.FieldByName('fn_sos').AsInteger <> 6);
end;

procedure TfrmMain.DoEnablePeregon;
begin
  cbPeregon.Enabled := odsJur.FieldByName('fn_sos').AsInteger = 9;
end;

procedure TfrmMain.DoEnablePredZakaz;
begin
  aPredZakaz.Enabled := (odsJur.RecordCount <> 0) and
                        ((odsJur.FieldByName('fn_sos').AsInteger = 9) or
                        (odsJur.FieldByName('fl_pred').AsInteger = 1)); // только для новых заказов и если заказ уже предварительный
end;

procedure TfrmMain.DoEnableRas;
begin
  bSetRasNow.Enabled := (odsJur.RecordCount <> 0) and
                     ((odsJur.FieldByName('fn_sos').AsInteger = 1) or
                     (odsJur.FieldByName('fn_sos').AsInteger = 6));
  bDelRas.Enabled := (odsJur.RecordCount <> 0) and
                     ((odsJur.FieldByName('fn_sos').AsInteger = 1) or
                     (odsJur.FieldByName('fn_sos').AsInteger = 6));
end;

procedure TfrmMain.DoEnableStopControls;
begin
  seStopDrv.Enabled := (odsJur.FieldByName('fl_isstop').AsInteger = 0) and
                       (odsJur.FieldByName('fn_sos').AsInteger <> 3) and
                       (odsJur.FieldByName('fn_sos').AsInteger <> 4) and
                       (odsJur.FieldByName('fn_sos').AsInteger <> 5) and
                       (odsJur.FieldByName('fd_datef_chr').AsString <> '');
  seStopClt.Enabled := seStopDrv.Enabled;
  bDelStopDrv.Enabled := seStopDrv.Enabled;
  bDelStopClt.Enabled := seStopDrv.Enabled;
  seBaggage.Enabled := (odsJur.FieldByName('fl_bagage').AsInteger = 0) and
                       (odsJur.FieldByName('fn_sos').AsInteger <> 3) and
                       (odsJur.FieldByName('fn_sos').AsInteger <> 4) and
                       (odsJur.FieldByName('fn_sos').AsInteger <> 5) and
                       (odsJur.FieldByName('fd_datef_chr').AsString <> '');
  bDelBaggage.Enabled := seBaggage.Enabled;
end;

procedure TfrmMain.DoEnableStops(aEnable: Boolean);
begin
  bDriverStop.Enabled := aEnable;
  bClientStop.Enabled := aEnable;
  bContinueStop.Enabled := not aEnable;
  nStopDrv.Visible := aEnable;
  nStopClt.Visible := aEnable;
  nContinue.Visible := not aEnable;
  seStopDrv.Enabled := aEnable;
  seStopClt.Enabled := aEnable;
  bDelStopDrv.Enabled := aEnable;
  bDelStopClt.Enabled := aEnable;
end;

procedure TfrmMain.DoEnableFactControls;
begin
  seSumF.Enabled := (odsJur.FieldByName('fn_sos').AsInteger <> 3) and
                    (odsJur.FieldByName('fn_sos').AsInteger <> 4) and
                    (odsJur.FieldByName('fn_sos').AsInteger <> 5) and
                    (odsJur.FieldByName('fn_sos').AsInteger <> 6) and
                    (odsJur.FieldByName('numdrv').AsString <> '');
  bDelSumF.Enabled := seSumF.Enabled;
  seSumFMG.Enabled := seSumF.Enabled;
  bDelSumFMG.Enabled := seSumF.Enabled;
end;

procedure TfrmMain.DoEnableFicsControls;
begin
  teFics.Enabled := (odsJur.FieldByName('fd_datef_chr').AsString <> '') and
                    (odsJur.FieldByName('fn_sos').AsInteger <> 1) and
                    (odsJur.FieldByName('fn_sos').AsInteger <> 3) and
                    (odsJur.FieldByName('fn_sos').AsInteger <> 4);
  bDelFics.Enabled := teFics.Enabled;
end;

procedure TfrmMain.DoEnableFree;
begin
  cbFree.Enabled := (odsJur.RecordCount <> 0) and
                    (odsJur.FieldByName('fd_datef_chr').AsString <> '') and
                    (odsJur.FieldByName('fn_sos').AsInteger <> 3) and
                    (odsJur.FieldByName('fn_sos').AsInteger <> 5) and
                    (odsJur.FieldByName('fn_sos').AsInteger <> 6);
end;

procedure TfrmMain.DoEnableKmControls;
begin
  teNumKm.Enabled := (odsJur.RecordCount <> 0) and
                     (odsJur.FieldByName('numdrv').AsString <> '') and 
                     (odsJur.FieldByName('fn_sos').AsInteger <> 3) and
                     (odsJur.FieldByName('fn_sos').AsInteger <> 4) and
                     (odsJur.FieldByName('fn_sos').AsInteger <> 5) and
                     (odsJur.FieldByName('fn_sos').AsInteger <> 6);
  bClearKm1.Enabled := teNumKm.Enabled;
end;

procedure TfrmMain.DoVisibleOtmena;
begin
  aOtmena.Visible := (odsJur.RecordCount <> 0) and
                     ((odsJur.FieldByName('fn_sos').AsInteger = 9) or // если новый
                      (odsJur.FieldByName('fn_sos').AsInteger = 8) and (odsJur.FieldByName('fd_datef_chr').AsString = '')); // или обрабатываеся, но НЕзафиксированный
end;

procedure TfrmMain.DoVisibleSend;
begin
  mSend.Visible := (odsJur.RecordCount <> 0) and
                   (odsJur.FieldByName('fn_sos').AsInteger = 9);
end;

procedure TfrmMain.DoVisibleSumCall;
begin
  nSumCall.Visible := (odsJur.RecordCount <> 0) and
                      (odsJur.FieldByName('numdrv').AsString <> '') and
                      (odsJur.FieldByName('fd_datef_chr').AsString = '') and
                      (odsJur.FieldByName('fn_sos').AsInteger <> 3) and
                      (odsJur.FieldByName('fn_sos').AsInteger <> 4) and
                      (odsJur.FieldByName('fn_sos').AsInteger <> 5) and
                      (odsJur.FieldByName('fn_sos').AsInteger <> 6);
end;

procedure TfrmMain.DoEnableVisibleStop;
begin
  nStopDrv.Visible := (odsJur.FieldByName('fl_isstop').AsInteger = 0) and // если в данный момент не остановлен
                      (odsJur.FieldByName('fd_datef_chr').AsString <> '') and // если была фиксация
                      (odsJur.FieldByName('fn_sos').AsInteger = 8) and // если статус = обрабатывается
                      (odsJur.FieldByName('fn_sos').AsInteger <> 4);
  nStopClt.Visible := (odsJur.FieldByName('fl_isstop').AsInteger = 0) and
                      (odsJur.FieldByName('fd_datef_chr').AsString <> '') and
                      (odsJur.FieldByName('fn_sos').AsInteger = 8) and
                      (odsJur.FieldByName('fn_sos').AsInteger <> 4);
  nContinue.Visible := odsJur.FieldByName('fl_isstop').AsInteger <> 0;
  bDriverStop.Enabled := (odsJur.FieldByName('fl_isstop').AsInteger = 0) and
                         (odsJur.FieldByName('fd_datef_chr').AsString <> '') and
                         (odsJur.FieldByName('fn_sos').AsInteger = 8) and
                         (odsJur.FieldByName('fn_sos').AsInteger <> 4);
  bClientStop.Enabled := (odsJur.FieldByName('fl_isstop').AsInteger = 0) and
                         (odsJur.FieldByName('fd_datef_chr').AsString <> '') and
                         (odsJur.FieldByName('fn_sos').AsInteger = 8) and
                         (odsJur.FieldByName('fn_sos').AsInteger <> 4);
  bContinueStop.Enabled := odsJur.FieldByName('fl_isstop').AsInteger <> 0;
end;

procedure TfrmMain.DoFicsDrv(nId : Integer);
var oq : TOracleQuery;
begin
  if (odsJur.FieldByName('fk_adr2id').AsInteger = pMG) and (odsJur.FieldByName('fd_datef_chr').AsString <> '') then // если адрес назначения м/г то фиксируем по второй фиксации
    begin
      Application.CreateForm(TdlgFics, dlgFics);
      dlgFics.cbFree.Checked := odsJur.FieldByName('fl_free').AsInteger = 1; // свободный ?
      try
        dlgFics.lbCap.Caption := 'Возвращаемся по межгороду? '+#13#10+'Зафиксировать '+odsJur.FieldByName('numdrv').AsString+'-го?';
        dlgFics.ShowModal;
        if dlgFics.ModalResult = mrOk then
          begin
            oq := TOracleQuery.Create(nil);
            try
              oq.Session := os;
              oq.Cursor := crSQLWait;
              oq.SQL.Text := ' update taxi.tjournal set fd_datef2 = sysdate, fl_free = :pfl_free where fk_id = :pfk_id ';
              oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
              if dlgFics.cbFree.Checked then
                oq.DeclareAndSet('pfl_free', otInteger, 1)
              else
                oq.DeclareAndSet('pfl_free', otInteger, 0);
              oq.Execute;
              os.Commit;
              DoInsLastFics(odsJur.FieldByName('numdrv').AsString, odsJur.FieldByName('fd_datef2').AsDateTime);
            finally
              oq.Free;
            end;
          end;
      finally
        dlgFics.Free;
        VJOURNAL_DATEIN.Focused := True;
        grJournal.SetFocus;
      end;
    end else
    begin
      Application.CreateForm(TdlgFics, dlgFics);
      dlgFics.cbFree.Checked := odsJur.FieldByName('fl_free').AsInteger = 1; // свободный ?
      try
        if nId = 0 then
          dlgFics.lbCap.Caption := 'Зафиксировать '+odsJur.FieldByName('numdrv').AsString+'-го?'
        else
          dlgFics.lbCap.Caption := 'Позывной # '+odsJur.FieldByName('numdrv').AsString+ ' зафиксирован!'+#13#10+'Фиксировать повторно?';
        dlgFics.ShowModal;
        if dlgFics.ModalResult = mrOK then
          begin
            oq := TOracleQuery.Create(nil);
            try
              oq.Session := os;
              oq.Cursor := crSQLWait;
// -- прибавляем минуты +1 +2 +3 +4 +5
              if dlgFics.pMin = 0 then
                oq.SQL.Text := ' update taxi.tjournal set fd_datef = sysdate, fl_free = :pfl_free where fk_id = :pfk_id ';
              if dlgFics.pMin = 1 then
                oq.SQL.Text := ' update taxi.tjournal set fd_datef = sysdate-1/1440, fl_free = :pfl_free where fk_id = :pfk_id ';
              if dlgFics.pMin = 2 then
                oq.SQL.Text := ' update taxi.tjournal set fd_datef = sysdate-2/1440, fl_free = :pfl_free where fk_id = :pfk_id ';
              if dlgFics.pMin = 3 then
                oq.SQL.Text := ' update taxi.tjournal set fd_datef = sysdate-3/1440, fl_free = :pfl_free where fk_id = :pfk_id ';
              if dlgFics.pMin = 4 then
                oq.SQL.Text := ' update taxi.tjournal set fd_datef = sysdate-4/1440, fl_free = :pfl_free where fk_id = :pfk_id ';
              if dlgFics.pMin = 5 then
                oq.SQL.Text := ' update taxi.tjournal set fd_datef = sysdate-5/1440, fl_free = :pfl_free where fk_id = :pfk_id ';
              oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
// -- ставим отметку "Свободный"
              if dlgFics.cbFree.Checked then
                oq.DeclareAndSet('pfl_free', otInteger, 1)
              else
                oq.DeclareAndSet('pfl_free', otInteger, 0);
              oq.Execute; // -- 1F
// -- фиксируемся с багажом
              if dlgFics.pBag = 1 then
                begin
                  oq.DeleteVariables;
                  oq.SQL.Text := ' update taxi.tjournal set fl_bagage = 1, fl_bagage_real = 1, fd_baggage = sysdate where fk_id = :pfk_id ';
                  oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
                  oq.Execute;
                end;
// -- фиксируемся по месту
              if dlgFics.pPlace = 1 then
                begin
                  oq.DeleteVariables;
                  oq.SQL.Text := ' update taxi.tjournal '+#13+
                                 '    set fc_adr2 = (select fc_name from taxi.ts_raion where fk_id = :pfk_raionid), '+#13+
                                 '        fk_adr2id = (select fk_id from taxi.ts_raion where fk_id = :pfk_raionid) '+#13+
                                 '  where fk_id = :pfk_id ';
                  oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
                  oq.DeclareAndSet('pfk_raionid', otInteger, odsJur.FieldByName('fk_raionid').AsInteger);
                  oq.Execute;
                  oq.DeleteVariables;
                  oq.SQL.Text := ' merge into taxi.tjuradr2 using dual on (fk_jurid = :pfk_jurid) '+#13+
                                 ' when matched then update set fc_adr = (select fc_name from taxi.ts_raion where fk_id = :pfk_raionid) where fk_jurid = :pfk_jurid '+#13+
                                 ' when not matched then insert(fk_jurid, fc_adr) values(:pfk_jurid, (select fc_name from taxi.ts_raion where fk_id = :pfk_raionid)) ';
                  oq.DeclareAndSet('pfk_jurid', otInteger, odsJur.FieldByName('fk_id').AsInteger);
                  oq.DeclareAndSet('pfk_raionid', otInteger, odsJur.FieldByName('fk_raionid').AsInteger);
                  oq.Execute;
                end;
// -- добавляем событие таксиста(-ов)
              if dlgFics.pPlace = 1 then // если фиксация по месту
                begin
                  DoDriverEvent(odsJur.FieldByName('fk_id').AsInteger,
                                odsJur.FieldByName('fk_drvid').AsInteger,
                                odsJur.FieldByName('fk_drvid2').AsInteger,
                                odsJur.FieldByName('fk_raionid').AsInteger,
                                'START_CLIENT_MOVE');
                end else
                begin
                  DoDriverEvent(odsJur.FieldByName('fk_id').AsInteger,
                                odsJur.FieldByName('fk_drvid').AsInteger,
                                odsJur.FieldByName('fk_drvid2').AsInteger,
                                odsJur.FieldByName('fk_adr2id').AsInteger,
                                'START_CLIENT_MOVE');

                end;
              os.Commit;
              odsJur.AfterScroll := nil;
              RefreshQuery(odsJur);
              odsJur.AfterScroll := odsJurAfterScroll;
              DoInsLastFics(odsJur.FieldByName('numdrv').AsString, odsJur.FieldByName('fd_datef').AsDateTime);
            finally
              oq.Free
            end;
          end;
      finally
        dlgFics.Free;
        cbFree.Checked := odsJur.FieldByName('fl_free').AsInteger = 1;
        VJOURNAL_DATEIN.Focused := True;
        grJournal.SetFocus;
      end;
    end;
end;

procedure TfrmMain.DoFicsDrvFind(nId, nJurID, nDrvID, nAdr2ID, nDrvID2, nRaionID, nFree : Integer); // !!! межгород разбирать отдельно (багаж, минут по городу, вторая фиксация, расчет, добавление start_client_move и тд)
var oq : TOracleQuery;
    ods : TOracleDataSet;                                                    
begin
  Application.CreateForm(TdlgFics, dlgFics);
  dlgFics.cbFree.Checked := nFree = 1;
  try
    if nId = 0 then
      dlgFics.lbCap.Caption := 'Зафиксировать '+teVvod.Text+'-го?'
    else
      dlgFics.lbCap.Caption := 'Позывной # '+teVvod.Text+ ' зафиксирован!'+#13#10+'Фиксировать повторно?';
    dlgFics.ShowModal;
    if dlgFics.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        ods := TOracleDataSet.Create(nil);
        try
          oq.Session := os;
          oq.Cursor := crSQLWait;
// -- прибавляем минуты +1 +2 +3 +4 +5
          if dlgFics.pMin = 0 then
            oq.SQL.Text := ' update taxi.tjournal set fd_datef = sysdate, fl_free = :pfl_free where fk_id = :pfk_id ';
          if dlgFics.pMin = 1 then
            oq.SQL.Text := ' update taxi.tjournal set fd_datef = sysdate-1/1440, fl_free = :pfl_free where fk_id = :pfk_id ';
          if dlgFics.pMin = 2 then
            oq.SQL.Text := ' update taxi.tjournal set fd_datef = sysdate-2/1440, fl_free = :pfl_free where fk_id = :pfk_id ';
          if dlgFics.pMin = 3 then
            oq.SQL.Text := ' update taxi.tjournal set fd_datef = sysdate-3/1440, fl_free = :pfl_free where fk_id = :pfk_id ';
          if dlgFics.pMin = 4 then
            oq.SQL.Text := ' update taxi.tjournal set fd_datef = sysdate-4/1440, fl_free = :pfl_free where fk_id = :pfk_id ';
          if dlgFics.pMin = 5 then
            oq.SQL.Text := ' update taxi.tjournal set fd_datef = sysdate-5/1440, fl_free = :pfl_free where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfk_id', otInteger, nJurID);
          if dlgFics.cbFree.Checked then
            oq.DeclareAndSet('pfl_free', otInteger, 1)
          else
            oq.DeclareAndSet('pfl_free', otInteger, 0);
          oq.Execute; //-- 2F
// -- фиксируемся с багажом
          if dlgFics.pBag = 1 then
            begin
              oq.DeleteVariables;
              oq.SQL.Text := ' update taxi.tjournal set fl_bagage = 1, fl_bagage_real = 1, fd_baggage = sysdate where fk_id = :pfk_id ';
              oq.DeclareAndSet('pfk_id', otInteger, nJurID);
              oq.Execute;
            end;
// -- фиксируемся по месту
          if dlgFics.pPlace = 1 then
            begin
              oq.DeleteVariables;
              oq.SQL.Text := ' update taxi.tjournal '+#13+
                             '    set fc_adr2 = (select fc_name from taxi.ts_raion where fk_id = :pfk_raionid), '+#13+
                             '        fk_adr2id = (select fk_id from taxi.ts_raion where fk_id = :pfk_raionid) '+#13+
                             '  where fk_id = :pfk_id ';
              oq.DeclareAndSet('pfk_id', otInteger, nJurID);
              oq.DeclareAndSet('pfk_raionid', otInteger, nRaionID);
              oq.Execute;
              oq.DeleteVariables;
              oq.SQL.Text := ' merge into taxi.tjuradr2 using dual on (fk_jurid = :pfk_jurid) '+#13+
                             ' when matched then update set fc_adr = (select fc_name from taxi.ts_raion where fk_id = :pfk_raionid) where fk_jurid = :pfk_jurid '+#13+
                             ' when not matched then insert(fk_jurid, fc_adr) values(:pfk_jurid, (select fc_name from taxi.ts_raion where fk_id = :pfk_raionid)) ';
              oq.DeclareAndSet('pfk_jurid', otInteger, nJurID);
              oq.DeclareAndSet('pfk_raionid', otInteger, nRaionID);
              oq.Execute;
            end;
// -- добавляем событие таксиста(-ов)
          if dlgFics.pPlace = 1 then // если фиксируемся по месту
            begin
              DoDriverEvent(nJurID,
                            nDrvID,
                            nDrvID2,
                            nRaionID,
                            'START_CLIENT_MOVE');
            end else
            begin
              DoDriverEvent(nJurID,
                            nDrvID,
                            nDrvID2,
                            nAdr2ID,
                            'START_CLIENT_MOVE');
            end;
        os.Commit;

        ods.Session := os;
        ods.SQL.Text := ' select fd_datef, to_char(fd_datef, ''hh24:mi'') as fd_datef_chr from taxi.tjournal where fk_id = :pfk_id '; // !!! если стоим на той же записи то нет смысла
        ods.DeclareAndSet('pfk_id', otInteger, nJurID);                                                                               // выполнять этот запрос
        ods.Open;

        RefreshQuery(odsJur);
        DoInsLastFics(teVvod.Text, ods.FieldByName('fd_datef').AsDateTime);
        if nID = 0 then
          DoShowRemark('Позывной № '+teVvod.Text+' зафиксирован в '+ods.FieldByName('fd_datef_chr').AsString, stOk)
        else
          DoShowRemark('Позывной № '+teVvod.Text+' зафиксирован повторно в '+ods.FieldByName('fd_datef_chr').AsString, stOk);
        teVvod.Text := '';
      finally
        ods.Free;
        oq.Free;
      end;
    end;
  finally
    if odsJur.FieldByName('fk_id').AsInteger = nJurID then
      begin
        cbFree.Checked := dlgFics.cbFree.Checked = True;
        DoEnableFicsControls;
        DoEnableDrv;
        DoEnableBaggage;

        DoVisibleNotExit;
        DoVisibleFact;
        DoVisibleSumCall;
        DoVisibleAddTime;
      end;
    dlgFics.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.DoFicsDrvNew;
var oq : TOracleQuery;
    ods : TOracleDataSet;
    id : Integer;
begin
  Application.CreateForm(TdlgFics, dlgFics);
  try
    dlgFics.lbCap.Caption := 'Зафиксировать '+teVvod.Text+'-го?';
    dlgFics.ShowModal;
    if dlgFics.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        ods := TOracleDataSet.Create(nil);
        try
          oq.Session := os;
// -- Добавляем минуты +1 +2 +3 +4 +5
          if dlgFics.pMin = 0 then
            begin
              oq.SQL.Text := ' insert into taxi.tjournal '+#13+
                             '   (fd_datein, fn_sos, fc_phone, fk_clientid, fk_sotrid, fk_taxiid, fd_datef, fk_drvid, fk_adr1id, fc_adr1, fk_raionid, fn_stop, fl_free) '+#13+
                             ' values '+#13+
                             '   (sysdate, 8, null, 0, :pfk_sotrid, :pfk_taxiid, sysdate, :pfk_drvid, :pfk_adr1id, taxi.get_adr1(:pfk_adr1id), :pfk_raionid, (select decode(fn_cost, null, 0, fn_cost) from taxi.ts_places where fk_id = :pfk_raionid), :pfl_free) '+#13+
                             ' returning fk_id into :pfk_id ';
            end;
          if dlgFics.pMin = 1 then
            begin
              oq.SQL.Text := ' insert into taxi.tjournal '+#13+
                             '   (fd_datein, fn_sos, fc_phone, fk_clientid, fk_sotrid, fk_taxiid, fd_datef, fk_drvid, fk_adr1id, fc_adr1, fk_raionid, fn_stop, fl_free) '+#13+
                             ' values '+#13+
                             '   (sysdate, 8, null, 0, :pfk_sotrid, :pfk_taxiid, sysdate-1/1440, :pfk_drvid, :pfk_adr1id, taxi.get_adr1(:pfk_adr1id), :pfk_raionid, (select decode(fn_cost, null, 0, fn_cost) from taxi.ts_places where fk_id = :pfk_raionid), :pfl_free) '+#13+
                             ' returning fk_id into :pfk_id ';
            end;
          if dlgFics.pMin = 2 then
            begin
              oq.SQL.Text := ' insert into taxi.tjournal '+#13+
                             '   (fd_datein, fn_sos, fc_phone, fk_clientid, fk_sotrid, fk_taxiid, fd_datef, fk_drvid, fk_adr1id, fc_adr1, fk_raionid, fn_stop, fl_free) '+#13+
                             ' values '+#13+
                             '   (sysdate, 8, null, 0, :pfk_sotrid, :pfk_taxiid, sysdate-2/1440, :pfk_drvid, :pfk_adr1id, taxi.get_adr1(:pfk_adr1id), :pfk_raionid, (select decode(fn_cost, null, 0, fn_cost) from taxi.ts_places where fk_id = :pfk_raionid), :pfl_free) '+#13+
                             ' returning fk_id into :pfk_id ';
            end;
          if dlgFics.pMin = 3 then
            begin
              oq.SQL.Text := ' insert into taxi.tjournal '+#13+
                             '   (fd_datein, fn_sos, fc_phone, fk_clientid, fk_sotrid, fk_taxiid, fd_datef, fk_drvid, fk_adr1id, fc_adr1, fk_raionid, fn_stop, fl_free) '+#13+
                             ' values '+#13+
                             '   (sysdate, 8, null, 0, :pfk_sotrid, :pfk_taxiid, sysdate-3/1440, :pfk_drvid, :pfk_adr1id, taxi.get_adr1(:pfk_adr1id), :pfk_raionid, (select decode(fn_cost, null, 0, fn_cost) from taxi.ts_places where fk_id = :pfk_raionid), :pfl_free) '+#13+
                             ' returning fk_id into :pfk_id ';
            end;
          if dlgFics.pMin = 4 then
            begin
              oq.SQL.Text := ' insert into taxi.tjournal '+#13+
                             '   (fd_datein, fn_sos, fc_phone, fk_clientid, fk_sotrid, fk_taxiid, fd_datef, fk_drvid, fk_adr1id, fc_adr1, fk_raionid, fn_stop, fl_free) '+#13+
                             ' values '+#13+
                             '   (sysdate, 8, null, 0, :pfk_sotrid, :pfk_taxiid, sysdate-4/1440, :pfk_drvid, :pfk_adr1id, taxi.get_adr1(:pfk_adr1id), :pfk_raionid, (select decode(fn_cost, null, 0, fn_cost) from taxi.ts_places where fk_id = :pfk_raionid), :pfl_free) '+#13+
                             ' returning fk_id into :pfk_id ';
            end;
          if dlgFics.pMin = 5 then
            begin
              oq.SQL.Text := ' insert into taxi.tjournal '+#13+
                             '   (fd_datein, fn_sos, fc_phone, fk_clientid, fk_sotrid, fk_taxiid, fd_datef, fk_drvid, fk_adr1id, fc_adr1, fk_raionid, fn_stop, fl_free) '+#13+
                             ' values '+#13+
                             '   (sysdate, 8, null, 0, :pfk_sotrid, :pfk_taxiid, sysdate-5/1440, :pfk_drvid, :pfk_adr1id, taxi.get_adr1(:pfk_adr1id), :pfk_raionid, (select decode(fn_cost, null, 0, fn_cost) from taxi.ts_places where fk_id = :pfk_raionid), :pfl_free) '+#13+
                             ' returning fk_id into :pfk_id ';
            end;
          oq.DeclareAndSet('pfk_sotrid', otInteger, pSOTRID);
          oq.DeclareAndSet('pfk_taxiid', otInteger, pTaxiID);
          oq.DeclareAndSet('pfk_drvid', otInteger, odsFindDrv.FieldByName('fk_id').AsInteger);
          oq.DeclareAndSet('pfk_adr1id', otInteger, odsFindDrv.FieldByName('fk_place').AsInteger);
          oq.DeclareAndSet('pfk_raionid', otInteger, odsFindDrv.FieldByName('fk_place').AsInteger);
// -- Ставим отметку "Свободный"
          if dlgFics.cbFree.Checked then
            oq.DeclareAndSet('pfl_free', otInteger, 1)
          else
            oq.DeclareAndSet('pfl_free', otInteger, 0);
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute; // 3F
          id := oq.GetVariable('pfk_id');
// -- фиксируемся с багажом
          if dlgFics.pBag = 1 then
            begin
              oq.DeleteVariables;
              oq.SQL.Text := ' update taxi.tjournal set fl_bagage = 1, fl_bagage_real = 1, fd_baggage = sysdate where fk_id = :pfk_id ';
              oq.DeclareAndSet('pfk_id', otInteger, id);
              oq.Execute;
            end;
// -- фиксируемся по месту
          if dlgFics.pPlace = 1 then
            begin
              oq.DeleteVariables;
              oq.SQL.Text := ' update taxi.tjournal '+#13+
                             '    set fc_adr2 = (select fc_name from taxi.ts_raion where fk_id = :pfk_raionid), '+#13+
                             '        fk_adr2id = (select fk_id from taxi.ts_raion where fk_id = :pfk_raionid) '+#13+
                             '  where fk_id = :pfk_id ';
              oq.DeclareAndSet('pfk_id', otInteger, id);
              oq.DeclareAndSet('pfk_raionid', otInteger, odsFindDrv.FieldByName('fk_place').AsInteger);
              oq.Execute;
              oq.DeleteVariables;
              oq.SQL.Text := ' merge into taxi.tjuradr2 using dual on (fk_jurid = :pfk_jurid) '+#13+
                             ' when matched then update set fc_adr = (select fc_name from taxi.ts_raion where fk_id = :pfk_raionid) where fk_jurid = :pfk_jurid '+#13+
                             ' when not matched then insert(fk_jurid, fc_adr) values(:pfk_jurid, (select fc_name from taxi.ts_raion where fk_id = :pfk_raionid)) ';
              oq.DeclareAndSet('pfk_jurid', otInteger, id);
              oq.DeclareAndSet('pfk_raionid', otInteger, odsFindDrv.FieldByName('fk_place').AsInteger);
              oq.Execute;
            end;
// -- добавляем событие таксиста(-ов)
          if dlgFics.pPlace = 1 then // фиксируемся по месту
            begin
              DoDriverEvent(id,
                            odsFindDrv.FieldByName('fk_id').AsInteger,
                            0,
                            odsFindDrv.FieldByName('fk_place').AsInteger,
                            'START_CLIENT_MOVE');
            end else
            begin
              DoDriverEvent(id,
                            odsFindDrv.FieldByName('fk_id').AsInteger,
                            0,
                            0,
                            'START_CLIENT_MOVE');
            end;

          ods.Session := os;
          ods.SQL.Text := ' select fd_datef, to_char(fd_datef, ''hh24:mi'') as fd_datef_chr from taxi.tjournal where fk_id = :pfk_id ';
          ods.DeclareAndSet('pfk_id', otInteger, id);
          ods.Open;
          os.Commit;
          id := odsJur.FieldByName('fk_id').AsInteger;
          odsJur.AfterScroll := nil;
          RefreshQuery(odsJur);
          odsJur.Locate('fk_id', id, []);
          odsJur.AfterScroll := odsJurAfterScroll; // здесь не нужно вызывать ручками AfterScroll
          DoInsLastFics(teVvod.Text, ods.FieldByName('fd_datef').AsDateTime);
          DoShowRemark('Позывной № '+teVvod.Text+' зафиксирован в '+ods.FieldByName('fd_datef_chr').AsString, stOk);
          if odsJur.RecordCount = 1 then
            begin
              DoEnableAdr1;
              DoEnableAdr2;
            end;
          teVvod.Text := '';
        finally
          ods.Free;
          oq.Free;
        end;
      end;
  finally
    dlgFics.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.DoInsLastFics(sNumDrv: string; dTimeFics : TDateTime);
begin
  memDataLastFics.Insert;
  memDataLastFics.FieldByName('NumDrv').AsString := sNumDrv;
  memDataLastFics.FieldByName('TimeFics').AsString := FormatDateTime('hh:mm', dTimeFics);
  memDataLastFics.FieldByName('datesys').AsDateTime := Now;
  memDataLastFics.Post;
  memDataLastFics.Next;
end;

procedure TfrmMain.DoInsLastRas(sNumDrv, sSumRas: string; nJurID : Integer);
begin
  memDataLast.Insert;
  memDataLast.FieldByName('NumDrv').AsString := sNumDrv;
  memDataLast.FieldByName('RasSum').AsInteger := StrToInt(sSumRas);
  memDataLast.FieldByName('datesys').AsDateTime := Now;
  memDataLast.FieldByName('JurID').AsInteger := nJurID;
  memDataLast.Post;
  memDataLast.Next;
end;

procedure TfrmMain.DoItogo(nType, nJurID, nStop, nPeregon : Integer; nKm1, nKm2 : Double; nTime, isStop, isTalon, nAdr1ID : Integer; sNumDrv : string = '');
var oq : TOracleQuery;
    pCost1, pCost2 : Double;
    pStopClient, pStopDrv, pCntBagage : Double;
    pKolvoMin : Integer;
    pSumR : Double;
    pSumMG : Double; // сумма по м/г
    pSumGorod : Double; // сумма по городу
    strMin : string; 
begin
  pStopClient := 0;
  pStopDrv := 0;
//-- вычисляем стоимость подачи машины и стоимость минуты от даты и времени фиксации в зависимости от тарифа
//-- или в зависимости от талона
  if isTalon = 1 then
    begin
      odsCostOrg.Close;
      odsCostOrg.SetVariable('pfk_id', nAdr1ID);
      odsCostOrg.Open;
      if odsCostOrg.FieldByName('fn_cost_car').AsFloat <> 0 then
        begin
          pCost1 := odsCostOrg.FieldByName('fn_cost_car').AsFloat;
          pCost2 := odsCostOrg.FieldByName('fn_cost_min').AsFloat;
        end else
        begin
          pCost1 := pCostTalonCar;
          pCost2 := pCostTalonMin;
        end;
    end else
    begin
      odsCost.Close;
      odsCost.SetVariable('pfk_id', nJurID);
      odsCost.SetVariable('pfk_taxiid', pTaxiID);
      odsCost.Open;
      pCost1 := odsCost.FieldByName('fn_cost1').AsFloat; // подача машины
      pCost2 := odsCost.FieldByName('fn_cost2').AsFloat; // стоимость минуты
    end;
//-- вычисляем кол-во минут, сумму проезда с багажом
  odsStops.Close;
  odsStops.SetVariable('pfk_jurid', nJurID);
  odsStops.Open;
  pCntBagage := (odsStops.FieldByName('fn_baggage').AsInteger*pCost2)+(odsStops.FieldByName('fn_baggage').AsInteger*pCost2*flBagage);
//-- вычисляем количество минут в пути (без багажа)
  if nType = 0 then // нормальный расчет
    begin
      odsKolvoMin.Close;
      odsKolvoMin.SetVariable('pfk_id', nJurID);
      odsKolvoMin.Open;
      pKolvoMin := odsKolvoMin.FieldByName('kolmin').AsInteger - odsStops.FieldByName('fn_baggage').AsInteger;
    end else
    begin // расчет от текущего времени
      odsKolvoMinNow.Close;
      odsKolvoMinNow.SetVariable('pfk_id', nJurID);
      odsKolvoMinNow.Open;
      pKolvoMin := odsKolvoMinNow.FieldByName('kolmin').AsInteger - odsStops.FieldByName('fn_baggage').AsInteger;
    end;
//-- вычисляем остановки
  if isStop = 1 then
    begin
      pStopClient := odsStops.FieldByName('fn_stopclt').AsInteger*pCost2*flStopClientPer; //-- вычисляем кол-во минут, сумму в остановках по требованию клиента
      pStopDrv := odsStops.FieldByName('fn_stopdrv').AsInteger*pCost2; //-- вычисляем кол-во минут, сумму в остановках по требованию водителя
    end;
//=== РАСЧЕТ
  if pKolvoMin < 2 then  // если меньше 2-ух минут то ставим Минималку
    begin
      pSumR := intMin;
      pSumR := pSumR + pCntBagage; // прибавляем багаж
      if nKm1 <> 0 then
        begin
          pSumR := pSumR + (nKm1 * pPriceKm); // по километражу в одну сторону
        end;
      if nKm2 <> 0 then
        begin
          pSumR := pSumR + (nKm2 * pPriceKm * flObratnoMG); // по километражу обратно
        end;
      pSumR := pSumR + nStop + (pCost2*nTime);
      pSumMG := (nKm1 * pPriceKm) + (nKm2 * pPriceKm * flObratnoMG);
      pSumGorod := pSumR - pSumMG;
    end else
    begin
      pSumR := ((pCost1+(pCost2*pKolvoMin))                      // подача машины + (стоимость минуты * кол-во минут)
                - pStopClient-pStopDrv)                           // вычитаем стоимость простоя по просьбе водителя и по просьбе клиента
                +(pCost2*nTime) // вычитаем или прибавляем сумму по времени, внесенном вручную
                +nStop;         // прибавляем стоимость платной стоянки
      if nPeregon = 1 then
        begin
          pSumR := pSumR * intPeregon; // при перегоне умножаем на коэффициент перегона
        end;
      pSumR := pSumR + pCntBagage; // при перегрузе или багаже прибавляем к сумме сумму, помноженную на процент
      if nKm1 <> 0 then
        begin
          pSumR := pSumR + (nKm1 * pPriceKm); // по километражу в одну сторону
        end;
      if nKm2 <> 0 then
        begin
          pSumR := pSumR + (nKm2 * pPriceKm * flObratnoMG); // по километражу обратно
        end;

      pSumMG := (nKm1 * pPriceKm) + (nKm2 * pPriceKm * flObratnoMG);
      pSumGorod := pSumR - pSumMG;
    end;

  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal '+#13+
                   '    set fn_sumr = :pfn_sumr, fn_summg = :pfn_summg, fn_sumgorod = :pfn_sumgorod, fn_time_trip = :pfn_time_trip '+#13+
                   '  where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfn_sumr', otInteger, pSumR);
    oq.DeclareAndSet('pfn_summg', otInteger, pSumMG);
    oq.DeclareAndSet('pfn_sumgorod', otInteger, pSumGorod);
    if nType = 0 then
      oq.DeclareAndSet('pfn_time_trip', otInteger, odsKolvoMin.FieldByName('kolmin').AsInteger)
    else
      oq.DeclareAndSet('pfn_time_trip', otInteger, odsKolvoMinNow.FieldByName('kolmin').AsInteger);
    oq.DeclareAndSet('pfk_id', otInteger, nJurID);
    oq.Execute;
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);                                     
    odsJur.AfterScroll := odsJurAfterScroll;
    odsJurAfterScroll(nil); // !!! убрать ???
    if pKolvoMin < 2 then
      begin
        strMin := 'Минималка';
        if (nKm1 <> 0) or (nKm2 <> 0) then
          strMin := strMin + '+м/г ';
        if pCntBagage <> 0 then
          strMin := strMin + '+(Б) ';
        if nStop <> 0 then
          strMin := strMin + '+ПСт ';
        if nTime <> 0 then
          strMin := strMin + '+Доп.время ';
        strMin := strMin + '=';
        DoShowRemark(strMin+FloatToStr(round(pSumR))+' руб.', stCapValue)
      end else
      begin
        DoShowRemark(FloatToStr(round(pSumR))+' руб.', stCapValue);
      end;
    DoInsLastRas(sNumDrv, FloatToStr(round(pSumR)), nJurID);
  finally
    teVvod.Text := '';
    oq.Free;
  end;
end;

procedure TfrmMain.DoItogoBonus(nJurID : Integer; dStop : string); // !!! осталось прибавить сюда остановки по просьбе клиента  + добавленное время
var pCost2 : Double;                                               // !!! полностью переделывать
    oq : TOracleQuery;
    KolMinStopDrv : Double; // кол-во минут простоя по просьбе водителя
//    id : Integer;
begin
  KolMinStopDrv := 0;
//-- вычисляем стоимость минуты
  odsCost.Close;
  odsCost.SetVariable('pfk_id', nJurID);
  odsCost.SetVariable('pfk_taxiid', pTaxiID);
  odsCost.Open;
  pCost2 := odsCost.FieldByName('fn_cost2').AsFloat;
//-- вычисляем кол-во минут всего
  odsKolvoMin.Close;
  odsKolvoMin.SetVariable('pfk_id', nJurID);
  odsKolvoMin.Open;
  if (dStop <> null) and (dStop <> '0') then
    begin
      odsStops.Close;
      odsStops.SetVariable('pfk_jurid', nJurID);
      odsStops.Open;
      KolMinStopDrv := odsStops.FieldByName('fn_stopdrv').AsInteger; //-- вычисляем кол-во минут простоя по просьбе водителя
    end;
  if (odsKolvoMin.FieldByName('kolmin').AsInteger - KolMinStopDrv) > intKolvoBonusMin then // если наездили больше бесплатных минут
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update taxi.tjournal set fn_sumr = :pfn_sumr where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfn_sumr', otInteger, (odsKolvoMin.FieldByName('kolmin').AsInteger - KolMinStopDrv - intKolvoBonusMin)*pCost2);
        oq.DeclareAndSet('pfk_id', otInteger, nJurID);
        oq.Execute;
        os.Commit;
//        id := nJurID;
        odsJur.AfterScroll := nil;
      finally
        teVvod.Text := '';
        oq.Free;
      end;
    end;
  RefreshQuery(odsJur);
//  odsJur.Locate('fk_id', id, []); // !!! id возможно надо присваивать раньше
  odsJur.AfterScroll := odsJurAfterScroll;
  odsJurAfterScroll(nil);
end;

procedure TfrmMain.DoItogoPred(nJurID, nStop, nPeregon : Integer; nKm1, nKm2 : Double; nTime, isStop, nCntBag, nTimeStopDrv, nTimeStopClt, isTalon : Integer;
                               sNumDrv: string);
var pCost1, pCost2 : Double;
    pStopClient, pStopDrv, pCntBagage : Double;
    pKolvoMin : Integer;
    pSumR : Double;
    strMin : string;
begin
  pStopClient := 0;
  pStopDrv := 0;
//-- вычисляем стоимость подачи машины и стоимость минуты от даты и времени фиксации в зависимости от тарифа
//-- или по талону
  if isTalon = 1 then
    begin
      pCost1 := pCostTalonCar;
      pCost2 := pCostTalonMin;
    end else
    begin
      odsCost.Close;
      odsCost.SetVariable('pfk_id', nJurID);
      odsCost.SetVariable('pfk_taxiid', pTaxiID);
      odsCost.Open;
      pCost1 := odsCost.FieldByName('fn_cost1').AsFloat; // подача машины
      pCost2 := odsCost.FieldByName('fn_cost2').AsFloat; // стоимость минуты
    end;
//-- вычисляем кол-во минут, сумму проезда с багажом
  pCntBagage := (nCntBag*pCost2)+(nCntBag*pCost2*flBagage);
//-- вычисляем количество минут в пути (без багажа)
  odsKolvoMinPred.Close;
  odsKolvoMinPred.SetVariable('pfk_id', nJurID);
  odsKolvoMinPred.Open;
  pKolvoMin := odsKolvoMinPred.FieldByName('kolmin').AsInteger - nCntBag;
//-- вычисляем остановки
  if isStop = 1 then
    begin
      pStopClient := nTimeStopClt*pCost2*flStopClientPer; //-- вычисляем кол-во минут, сумму в остановках по требованию клиента
      pStopDrv := nTimeStopDrv*pCost2; //-- вычисляем кол-во минут, сумму в остановках по требованию водителя
    end;
//== РАСЧЕТ
  if odsKolvoMinPred.FieldByName('kolmin').AsInteger < 2 then // минималка
    begin
      pSumR := intMin;
      pSumR := pSumR + pCntBagage; // прибавляем багаж
      if nKm1 <> 0 then
        begin
          pSumR := pSumR + (nKm1 * pPriceKm); // по километражу в одну сторону
        end;
      if nKm2 <> 0 then
        begin
          pSumR := pSumR + (nKm2 * pPriceKm * flObratnoMG); // по километражу обратно
        end;
      pSumR := pSumR + nStop + (pCost2*nTime);

      strMin := 'Предварительно для № '+sNumDrv+'. Минималка';
      if (nKm1 <> 0) or (nKm2 <> 0) then
        strMin := strMin + '+м/г ';
      if pCntBagage <> 0 then
        strMin := strMin + '+(Б) ';
      if nStop <> 0 then
        strMin := strMin + '+ПСт';
      if nTime <> 0 then
        strMin := strMin + '+Доп. время ';
      strMin := strMin + '=';
      DoShowRemark(strMin+FloatToStr(round(pSumR))+' руб.', stCapValue);
    end else
    begin
      pSumR := ((pCost1+(pCost2*pKolvoMin))                      // подача машины + (стоимость минуты * кол-во минут)
                 - pStopClient-pStopDrv)                           // вычитаем стоимость простоя по просьбе водителя и по просьбе клиента
                 + (pCost2*nTime) // вычитаем или прибавляем сумму по времени, внесенном вручную
                 + nStop;         // прибавляем стоимость платной стоянки
      if nPeregon = 1 then
        begin
          pSumR := pSumR * intPeregon; // при перегоне умножаем на коэффициент перегона
        end;
      pSumR := pSumR + pCntBagage; // при перегрузе или багаже прибавляем к сумме сумму, помноженную на процент
      if nKm1 <> 0 then
        begin
          pSumR := pSumR + (nKm1 * pPriceKm); // по километражу в одну сторону
        end;
      if nKm2 <> 0 then
        begin
          pSumR := pSumR + (nKm2 * pPriceKm * flObratnoMG); // по километражу обратно
        end;
      DoShowRemark('Предварительно для № '+sNumDrv+' = '+FloatToStr(round(pSumR))+' руб.', stCapValue);
    end;
end;

procedure TfrmMain.DoKolvoTrips(nClienID, nBonus, nKolTrips : Integer); // Считаем кол-во поездок
var oq : TOracleQuery;
begin
  if nClienID <> 0 then // если есть привязка к абоненту
    begin
      oq := TOracleQuery.Create(nil);
      oq.Session := os;
      try
        if lbNumTrip.Caption = '8' then
          begin
            if nBonus = 0 then
              begin
                oq.DeleteVariables;
                oq.SQL.Text := ' update taxi.ts_client set fn_now = 0, fn_bonus = fn_bonus+1 where fk_id = :pfk_id '; // обнуляем поездки и прибавляем 1 к бонусным
                oq.DeclareAndSet('pfk_id', otInteger, nClienID);
                oq.Execute;
              end else
              begin
                oq.DeleteVariables;
                oq.SQL.Text := ' update taxi.ts_client set fn_now = 0 where fk_id = :pfk_id '; // обнуляем только поездки, потому что взяли текущую как бонус
                oq.DeclareAndSet('pfk_id', otInteger, nClienID);
                oq.Execute;
              end;
          end else
          begin
            if nBonus = 0 then
              begin
                oq.DeleteVariables;
                oq.SQL.Text := ' update taxi.ts_client set fn_now = fn_now+1 where fk_id = :pfk_id '; // если бонусов не было + 1 к поездкам
                oq.DeclareAndSet('pfk_id', otInteger, nClienID);
                oq.Execute;
              end;
          end;
      finally
        oq.Free;
      end;
    end;
end;

function TfrmMain.DoLogin: Boolean;
var Ver : TJclFileVersionInfo;
begin
  Result := False;
  if (GetLogin(os, intAutoSavePass, pTaxiId, pSotrId, pSotrFio, pTaxiName, pPriceKM, sSynTaxi, pCostTalonCar, pCostTalonMin)) then
    begin
      Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
      try
        pSOTRID := pSOTRID;
        frmMain.Caption := 'АРМ "Диспетчер"('+Ver.FileVersion+'). Пользователь: '+pSotrFio+' - "'+pTaxiName+'"';
        pTaxiID := pTaxiID;
        pPriceKM := pPriceKM; // стоимость 1 км по м/г в зависимости от такси
        sSynTaxi := sSynTaxi;
        pCostTalonCar := pCostTalonCar;
        pCostTalonMin := pCostTalonMin;
        if sSynTaxi = 'LUXURY' then
          begin
            odsHis.SQL.Text := odsHisLuxury.SQL.Text;
          end;
        TVJOURNAL.StoreToRegistry('\SoftWare\TaxiService\Disp\TVJOURNALDefault'+IntToStr(pSotrID), TRUE, [], 'TVJOURNAL');
        TVJOURNAL.RestoreFromRegistry('\SoftWare\TaxiService\Disp\TVJOURNAL'+IntToStr(pSotrID), FALSE, FALSE, [], 'TVJOURNAL');
//-- открываем журнал
        odsJur.AfterScroll := nil;
        RefreshQuery(odsJur);
        odsJur.AfterScroll := odsJurAfterScroll;
        odsJurAfterScroll(nil);
//-- считаем заказы
        odsCntJur.Close;
        odsCntJur.Open;
        lbCntZ.Caption := IntToStr(odsCntJur.FieldByName('cntZ').AsInteger);
//--
        if memDataLastFics.Active = False then
          memDataLastFics.Active := True;
        if memDataLast.Active = False then
          memDataLast.Active := True;

        Result := true;
      finally
        Ver.Free;
      end;
    end;
end;

procedure TfrmMain.DoParams;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := 'select * from taxi.tparams ';
    ods.Open;
    ods.First;
    while not ods.Eof do
      begin
//-- город
        if ods.FieldByName('fc_key').AsString = 'TOWN' then
          begin
            pTOWN := StrToInt(copy(ods.FieldByName('fc_value').AsString, 1, Pos(';', ods.FieldByName('fc_value').AsString)-1));
          end;
//-- Остановка по просьбе клиента, процент
        if ods.FieldByName('fc_key').AsString = 'STOP_CLIENT_PERCENT' then
          begin
            flStopClientPer := StrToFloat(ods.FieldByName('fc_value').AsString);
          end;
//-- Процент обратно по межгороду
        if ods.FieldByName('fc_key').AsString = 'PERCENT_OBRATNO_MG' then
          begin
            flObratnoMG := StrToFloat(ods.FieldByName('fc_value').AsString);
          end;
//-- Автоматически сохранять пароль
        if ods.FieldByName('fc_key').AsString = 'AUTO_SAVE_PASS' then
          begin
            intAutoSavePass := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
//-- Автоматически выводить окно адреса
        if ods.FieldByName('fc_key').AsString = 'AUTO_SHOW_ADR' then
          begin
            intAutoShowAdr := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
//-- Процент за перегруз (багаж)
        if ods.FieldByName('fc_key').AsString = 'PERCENT_BAGAGE' then
          begin
            flBagage := StrToFloat(ods.FieldByName('fc_value').AsString);
          end;
//-- Коэффициент перегона
        if ods.FieldByName('fc_key').AsString = 'KOF_PEREGON' then
          begin
            intPeregon := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
//-- Оплата "Минималка"
        if ods.FieldByName('fc_key').AsString = 'KOLVO_RUB_MIN' then
          begin
            intMin := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
//-- Кол-во бесплатных минут по бонусной поездке
        if ods.FieldByName('fc_key').AsString = 'KOLVO_BONUS_MIN' then
          begin
            intKolvoBonusMin := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
//-- Кол-во минут до предварительного заказа
        if ods.FieldByName('fc_key').AsString = 'KOLVO_PRED_MIN' then
          begin
            intKolvoPredMin := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
//-- Кол-во секунд отображения подсказки
        if ods.FieldByName('fc_key').AsString = 'SEC_SHOW_HELP' then
          begin
            tShowRemark.Interval := StrToInt(ods.FieldByName('fc_value').AsString+'000');
          end;
//-- Идентификатор "Межгород"
        if ods.FieldByName('fc_key').AsString = 'IDENT_MG' then
          begin
            pMG := StrToInt(copy(ods.FieldByName('fc_value').AsString, 1, Pos(';', ods.FieldByName('fc_value').AsString)-1));
          end;
//-- Идентификатор "Персоналка"
        if ods.FieldByName('fc_key').AsString = 'IDENT_PERS' then
          begin
            pPERS := StrToInt(copy(ods.FieldByName('fc_value').AsString, 1, Pos(';', ods.FieldByName('fc_value').AsString)-1));
          end;
        ods.Next;
    end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.DoSaveFactSum(pID, pDrvID, pDrvID2, pClientID, pBonus, pNow, isStop, isBaggage: Integer; pNumDrv: string);
var oq : TOracleQuery;
begin
  bSaveFact.Enabled := False;
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal set fn_sumf = :pfn_sumf, fn_sumfmg = :pfn_sumfmg, fn_sos = 1 where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfn_sumf', otInteger, StrToInt(teFactSum.Text));
    if teFactSumMG.Text = '' then
      oq.DeclareAndSet('pfn_sumfmg', otInteger, 0)
    else
      oq.DeclareAndSet('pfn_sumfmg', otInteger, StrToInt(teFactSumMG.Text));
    oq.DeclareAndSet('pfk_id', otInteger, pID);
    oq.Execute;

    DoDriverEvent(pID,
                  pDrvID,
                  pDRVID2,
                  0,
                  'END_CLIENT_MOVE');

// -- если была поездка с багажом, то принудительно снимаем багаж
    if isBaggage <> 0 then
      begin
        DoStopWithBaggageMove(pID);
      end;
// -- если была остановка, то принудительно снимаем остановку
    if isStop <> 0 then
      begin
        DoStopContinue(pID, isStop);
      end;
// -- если первый раз происходит расчет то + поездку
    if odsJur.FieldByName('fn_sos').AsInteger <> 1 then
      begin
        DoKolvoTrips(pClientID,
                     pBonus,
                     pNow);
      end;
    os.Commit;
    if teFactSumMG.Text <> '' then
      begin
        DoShowRemark('Позывной № '+pNumDrv+' оплата по факту + м/г - '+FloatToStr(round(StrToInt(teFactSum.Text)+StrToInt(teFactSumMG.Text)))+' руб.', stCapValue);
        DoInsLastRas(pNumDrv, IntToStr(StrToInt(teFactSum.Text)+StrToInt(teFactSumMG.Text)), pID);
      end else
      begin
        DoShowRemark('Позывной № '+pNumDrv+' оплата по факту - '+FloatToStr(round(StrToInt(teFactSum.Text)))+' руб.', stCapValue);
        DoInsLastRas(pNumDrv, teFactSum.Text, pID);
      end;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
    teVvod.Text := '';
    if pID = odsJur.FieldByName('fk_id').AsInteger then  // на той же записи, что и стоим
      begin
        seSumF.Properties.OnChange := nil;
        seSumF.Value := StrToInt(teFactSum.Text);
        seSumF.Properties.OnChange := seSumFPropertiesChange;
        seSumFMG.Properties.OnChange := nil;
        if teFactSumMG.Text = '' then
          seSumFMG.Value := 0
        else
          seSumFMG.Value := StrToInt(teFactSumMG.Text);
        seSumFMG.Properties.OnChange := seSumFMGPropertiesChange;
        DoVisibleContinueRas;
        DoEnableVisibleStop;
        DoVisibleCopy;
      end;
  finally
    oq.Free;
    teFactSum.Tag := 0;
    teFactSum.Clear;
    teFactSumMG.Clear;
    pcOptions.ActivePageIndex := 0;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.DoSaveKm(pID: Integer);
var sNum1, sNum2 : String;
    oq : TOracleQuery;
begin
  if Pos('/', teNum.Text) = 0 then
    begin
      sNum1 := teNum.Text;
    end else
    begin
      sNum1 := copy(teNum.Text, 1, Pos('/', teNum.Text)-1);
    end;
  sNum2 := trim(copy(teNum.Text, Length(sNum1)+2, Length(teNum.Text) - Length(sNum1)));
  if sNum2 = '' then
    sNum2 := '0';
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal set fn_km1 = :pfn_km1, fn_km2 = :pfn_km2 where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfn_km1', otFloat, StrToFloat(sNum1));
    oq.DeclareAndSet('pfn_km2', otFloat, StrToFloat(sNum2));
    oq.DeclareAndSet('pfk_id', otInteger, pID);
    oq.Execute;
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
    teVvod.Text := '';
    pcOptions.ActivePageIndex := 0;
    if pID = odsJur.FieldByName('fk_id').AsInteger then
      begin
        teNumKm.Properties.OnChange := nil;
        teNumKm.Text := teNum.Text;
        teNumKm.Properties.OnChange := teNumKmPropertiesChange;
      end;
    teNum.Clear;
  finally
    oq.Free;
    teNum.Tag := 0;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.DoSaveTime(pID: Integer);
var oq : TOracleQuery;
begin
  bSaveTime.Enabled := False;
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal set fn_time = :pfn_time where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfn_time', otInteger, seAddTime1.Value);
    oq.DeclareAndSet('pfk_id', otInteger, pID);
    oq.Execute;
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
    teVvod.Text := '';
    if pID = odsJur.FieldByName('fk_id').AsInteger then
      begin
        seAddTime.Properties.OnChange := nil;
        seAddTime.Value := seAddtime1.Value;
        seAddTime.Properties.OnChange := seAddTimePropertiesChange;
      end;
  finally
    oq.Free;
    pcOptions.ActivePageIndex := 0;
    seAddTime1.Tag := 0;
    seAddTime1.Clear;
    frmMain.VJOURNAL_DATEIN.Focused := True;
    frmMain.grJournal.SetFocus;
  end;
end;

procedure TfrmMain.DoSendToTaxi(Sender : TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TdlgSendToTaxi, dlgSendToTaxi);
  try
    dlgSendToTaxi.lbCap.Tag := TMenuItem(Sender).Tag;
    dlgSendToTaxi.lbCap.Caption := 'Передать заказ в '+TMenuItem(Sender).Caption+'?';
    dlgSendToTaxi.ShowModal;
    if dlgSendToTaxi.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update taxi.tjournal set fk_taxiid = :pfk_taxiid where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfk_taxiid', otInteger, dlgSendToTaxi.lbCap.Tag);
          oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
          oq.Execute;
          oq.DeleteVariables;
          oq.SQL.Text := ' update taxi.tupdateinfo set fl_issend = 1 where fk_taxi = :pfk_taxi ';
          oq.DeclareAndSet('pfk_taxi', otInteger, dlgSendToTaxi.lbCap.Tag);
          oq.Execute;
          os.Commit;
          odsJur.AfterScroll := nil;
          RefreshQuery(odsJur);
          odsJur.AfterScroll := odsJurAfterScroll;
        finally
          oq.Free;
        end;
      end;
  finally
    dlgSendToTaxi.Free;
  end;
end;

procedure TfrmMain.DoSetRaschetByRow(nType: Integer);
var oq : TOracleQuery;
begin
  if odsJur.FieldByName('fn_sos').AsInteger = 3 then
    begin
      beep;
      DoShowRemark('Заказ отменен! Вы не можете рассчитать заказ!', stError);
      exit;
    end;
//-- если нет фиксации, то не расчитываем
  if odsJur.FieldByName('fd_datef_str').AsString = '' then
    begin
      beep;
      DoShowRemark('Заказ незафиксирован!', stError);
      frmMain.VJOURNAL_DATEIN.Focused := True;
      frmMain.grJournal.SetFocus;
      exit;
    end;
//-- начинаем Расчет
  Application.CreateForm(TdlgSetRaschet, dlgSetRaschet);
  try
    if (FloatToStr(odsJur.FieldByName('sum_ras').AsFloat) = '') or (odsJur.FieldByName('sum_ras').AsFloat = 0) then
      dlgSetRaschet.lbCap.Caption := 'Рассчитать '+odsJur.FieldByName('numdrv').AsString+'-го?'
    else
      dlgSetRaschet.lbCap.Caption := 'Позывной № '+odsJur.FieldByName('numdrv').AsString+' рассчитан!'+#13+ 'Рассчитать его повторно?';
    dlgSetRaschet.ShowModal;
    if dlgSetRaschet.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.Cursor := crSQLWait;
// -- если едем по м/г то НЕ меняем статус у заказа
          if (odsJur.FieldByName('fk_adr2id').AsInteger = pMG) and (nType = 0) then
            oq.SQL.Text := ' update taxi.tjournal set fd_dater = decode(fd_dater, null, sysdate, fd_dater) where fk_id = :pfk_id '
          else
            oq.SQL.Text := ' update taxi.tjournal set fd_dater = decode(fd_dater, null, sysdate, fd_dater), fn_sos = 1 where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
          oq.Execute;
// -- ставим отметку о том, что движение закончилось
          DoDriverEvent(odsJur.FieldByName('fk_id').AsInteger,
                        odsJur.FieldByName('fk_drvid').AsInteger,
                        odsJur.FieldByName('fk_drvid2').AsInteger,
                        0,
                        'END_CLIENT_MOVE');
// -- если ехали с багажом и не сняли отметку
          if odsJur.FieldByName('fl_bagage').AsInteger = 1 then
            begin
              DoStopWithBaggageMove(odsJur.FieldByName('fk_id').AsInteger);
            end;
// -- если была остановка и сразу расчет, "продолжаем движение" чтобы снять остановку
          if odsJur.FieldByName('fl_isstop').AsInteger <> 0 then
            begin
              aContinueExecute(nil);
            end;
// -- если первый раз происходит расчет то + поездку
          if odsJur.FieldByName('fn_sos').AsInteger <> 1 then
            begin
              DoKolvoTrips(odsJur.FieldByName('fk_clientid').AsInteger,
                           odsJur.FieldByName('fl_bonus').AsInteger,
                           odsJur.FieldByName('fn_now').AsInteger);
            end;
          if odsJur.FieldByName('jurnum').AsString = '' then
            begin
              oq.DeleteVariables;
              oq.SQL.Text := ' update taxi.tjournal set fc_num = :pfc_num where fk_id = :pfk_id ';
              oq.DeclareAndSet('pfc_num', otString, odsJur.FieldByName('fc_num').AsString);
              oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
              oq.Execute;
            end;
          os.Commit;
        finally
          oq.Free;
        end;
        if odsJur.FieldByName('fl_bonus').AsInteger <> 1 then //-- если не бонусная поездка
          begin
            DoItogo(0,
                    odsJur.FieldByName('fk_id').AsInteger,
                    odsJur.FieldByName('fn_stop').AsInteger,
                    odsJur.FieldByName('fl_peregon').AsInteger,
                    odsJur.FieldByName('fn_km1').AsFloat,
                    odsJur.FieldByName('fn_km2').AsFloat,
                    odsJur.FieldByName('fn_time').AsInteger,
                    odsJur.FieldByName('fl_stop_real').AsInteger,
                    odsJur.FieldByName('fl_talon').AsInteger,
                    odsJur.FieldByName('fk_adr1id').AsInteger,
                    odsJur.FieldByName('numdrv').AsString); //-- общий расчет
          end else
          begin
            DoItogoBonus(odsJur.FieldByName('fk_id').AsInteger,
                         odsJur.FieldByName('fd_stop_chr').AsString); //-- бонусная поездка
          end;
      end;
  finally
    dlgSetRaschet.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.DoShowRemark(str: string; st: TcxStyle);
begin
  try
    if tShowRemark.Enabled = True then
      tShowRemark.Enabled := False;
    tShowRemark.Enabled := True;
// показываем форму сообщений
    if Assigned(frmInfo) then
      begin
        frmInfo.Show;
      end else
      begin
        Application.CreateForm(TfrmInfo, frmInfo);
        frmInfo.Show;
      end;
// запускаем таймер
    if frmInfo.tClose.Enabled = True then
      frmInfo.tClose.Enabled := False;
    frmInfo.tClose.Enabled := True;
// пишем текст сообщения
    if st = stError then
      begin
        frmInfo.Shape1.Pen.Color := clRed;
        frmInfo.lbCap.Style.Font.Color := clRed;
        frmInfo.lbText.Style.Font.Color := clRed;
        frmInfo.lbCap.Caption := 'Ошибка!';
        frmInfo.lbText.Caption := str;
      end;
    if (st = stOk) or (st = stCapValue) then
      begin
        frmInfo.Shape1.Pen.Color := clGreen;
        frmInfo.lbCap.Style.Font.Color := clGreen;
        frmInfo.lbText.Style.Font.Color := clGreen;
        frmInfo.lbCap.Caption := 'Подтверждение';
        frmInfo.lbText.Caption := str;
      end;
    if st = stInfo then
      begin
        frmInfo.Shape1.Pen.Color := clNavy;
        frmInfo.lbCap.Style.Font.Color := clNavy;
        frmInfo.lbText.Style.Font.Color := clNavy;
        frmInfo.lbCap.Caption := 'Информация';
        frmInfo.lbText.Caption := str;
      end;
  finally
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.DoShowState(nState: Integer);
begin
  case nState of
     9 : lbState.Caption := 'Новый';
     8 : lbState.Caption := 'В работе';
     7 : lbState.Caption := 'Предварительный';
     6 : lbState.Caption := 'Оплата за подачу';
     5 : lbState.Caption := 'Невыход';
     4 : lbState.Caption := 'Неоплата';
     3 : lbState.Caption := 'Отменен';
     2 : lbState.Caption := 'Пропущен'; // +++ не используется
     1 : lbState.Caption := 'Закрыт';
  end;
end;

procedure TfrmMain.DoStopClient(nJurID: Integer);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  Screen.Cursor := crSQLWait;
  try
    oq.Session := os;
    oq.SQL.Text := ' update taxi.tjournal set fl_isstop = 2, fl_stop_real = 1, fd_stop = sysdate where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, nJurID);
    oq.Execute;
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
    DoEnableStops(False);
    teVvod.Text := '';
  finally
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
    Screen.Cursor := crDefault;
    oq.Free;
  end;
end;

procedure TfrmMain.DoStopContinue(nJurID, nTypeStop : Integer);
var oq : TOracleQuery;
    ods : TOracleDataSet;
begin
  try
  if nTypeStop = 1 then // была остановка по просьбе водителя
    begin
      ods := TOracleDataSet.Create(nil);
      oq := TOracleQuery.Create(nil);
      Screen.Cursor := crSQLWait;
      try
        ods.Session := os;
        ods.SQL.Text := ' select round((sysdate - fd_stop)*24*60) as cntTime from taxi.tjournal where fk_id = :pfk_id ';
        ods.DeclareAndSet('pfk_id', otInteger, nJurID);
        ods.Open;
        oq.Session := os;
        if ods.FieldByName('cntTime').AsInteger > 0 then
          begin
            oq.DeleteVariables;
            oq.SQL.Text := ' merge into taxi.tstops using dual on (fk_jurid = :pfk_jurid) '+#13+
                           ' when not matched then insert (fk_jurid, fn_stopdrv) values(:pfk_jurid, :pfn_stopdrv) '+#13+
                           ' when matched then update set fn_stopdrv = fn_stopdrv+:pfn_stopdrv where fk_jurid = :pfk_jurid ';
            oq.DeclareAndSet('pfk_jurid', otInteger, nJurID);
            oq.DeclareAndSet('pfn_stopdrv', otInteger, ods.FieldByName('cntTime').AsInteger);
            oq.Execute;
          end;
        oq.DeleteVariables;
        oq.SQL.Text := ' update taxi.tjournal set fl_isstop = 0, fd_stop = null where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, nJurID);
        oq.Execute;
        os.Commit;
        odsJur.AfterScroll := nil;
        RefreshQuery(odsJur);
        odsJur.AfterScroll := odsJurAfterScroll;
        if nJurID = odsJur.FieldByName('fk_id').AsInteger then
          begin
            odsStops.Close;
            odsStops.SetVariable('pfk_jurid', nJurID);
            odsStops.Open;
            seStopDrv.Properties.OnChange := nil;
            seStopDrv.Value := odsStops.FieldByName('fn_stopdrv').AsInteger;
            seStopDrv.Properties.OnChange := seStopDrvPropertiesChange;
          end;
        teVvod.Text := '';
      finally
        Screen.Cursor := crDefault;
        oq.Free;
        ods.Free;
      end;
    end;
  if nTypeStop = 2 then // была остановка по просьбе клиента
    begin
      ods := TOracleDataSet.Create(nil);
      oq := TOracleQuery.Create(nil);
      Screen.Cursor := crSQLWait;
      try
        ods.Session := os;
        ods.SQL.Text := ' select round((sysdate - fd_stop)*24*60) as cntTime from taxi.tjournal where fk_id = :pfk_id ';
        ods.DeclareAndSet('pfk_id', otInteger, nJurID);
        ods.Open;
        oq.Session := os;
        if ods.FieldByName('cntTime').AsInteger > 0 then
          begin
            oq.SQL.Text := ' merge into taxi.tstops using dual on (fk_jurid = :pfk_jurid) '+#13+
                           ' when not matched then insert (fk_jurid, fn_stopclt) values(:pfk_jurid, :pfn_stopclt) '+#13+
                           ' when matched then update set fn_stopclt = fn_stopclt+:pfn_stopclt where fk_jurid = :pfk_jurid ';
            oq.DeclareAndSet('pfk_jurid', otInteger, nJurID);
            oq.DeclareAndSet('pfn_stopclt', otInteger, ods.FieldByName('cntTime').AsInteger);
            oq.Execute;
          end;
        oq.DeleteVariables;
        oq.SQL.Text := ' update taxi.tjournal set fl_isstop = 0, fd_stop = null where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, nJurID);
        oq.Execute;
        os.Commit;
        odsJur.AfterScroll := nil;
        RefreshQuery(odsJur);
        odsJur.AfterScroll := odsJurAfterScroll;
        if nJurID = odsJur.FieldByName('fk_id').AsInteger then
          begin
            odsStops.Close;
            odsStops.SetVariable('pfk_jurid', nJurID);
            odsStops.Open;
            seStopClt.Properties.OnChange := nil;
            seStopClt.Value := odsStops.FieldByName('fn_stopclt').AsInteger;
            seStopClt.Properties.OnChange := seStopCltPropertiesChange;
          end;
        teVvod.Text := '';
      finally
        Screen.Cursor := crDefault;
        oq.Free;
        ods.Free;
      end;
    end;
  finally
    if nJurID = odsJur.FieldByName('fk_id').AsInteger then // если стоим на той же записи которую ищем
      DoEnableStops(True);
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.DoStopDrv(nJurID: Integer);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  Screen.Cursor := crSQLWait;
  try
    oq.Session := os;
    oq.SQL.Text := ' update taxi.tjournal set fl_isstop = 1, fl_stop_real = 1, fd_stop = sysdate where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, nJurID);
    oq.Execute;
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
    DoEnableStops(False);
    teVvod.Text := '';
  finally
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
    Screen.Cursor := crDefault;
    oq.Free;
  end;
end;

procedure TfrmMain.DoStopWithBaggageMove(pJurID: Integer);
var ods : TOracleDataSet;
    oq : TOracleQuery;
begin
  ods := TOracleDataSet.Create(nil);
  oq := TOracleQuery.Create(nil);
  try
    ods.Session := os;
    oq.Session := os;
    ods.SQL.Text := ' select round((sysdate - fd_baggage)*24*60) as cntTime from taxi.tjournal where fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, pJurID);
    ods.Open;
    if ods.FieldByName('cntTime').AsInteger > 0 then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' merge into taxi.tstops using dual on (fk_jurid = :pfk_jurid) '+#13+
                       ' when not matched then insert(fk_jurid, fn_baggage) values(:pfk_jurid, :pfn_baggage) '+#13+
                       ' when matched then update set fn_baggage = fn_baggage+:pfn_baggage where fk_jurid = :pfk_jurid ';
        oq.DeclareAndSet('pfk_jurid', otInteger, pJurID);
        oq.DeclareAndSet('pfn_baggage', otInteger, ods.FieldByName('cntTime').AsInteger);
        oq.Execute;
      end;
    oq.DeleteVariables;
    oq.SQL.Text := ' update taxi.tjournal set fl_bagage = 0, fd_baggage = null where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, pJurID);
    oq.Execute;
    os.Commit;
  finally
    ods.Free;
    oq.Free;
  end;
end;

procedure TfrmMain.DoTapi(sNum : string; var pPhone : TPhone);
begin
//  Lg_ev('DoTapi '+sNum, 'c:\Taxi\uMain.log');
  pPhone := TPhone.Create(Self);
  if (pPhone.Init('IP Office Phone: '+sNum)) then
    begin
      pPhone.OnOffering :=  OnOffering;
      pPhone.OnConnected :=  OnConnected;
      pPhone.OnDisconected :=  OnDisconected;
    end;
end;

procedure TfrmMain.DoVisibleAddTime;
begin
  nAddTime.Visible := (odsJur.FieldByName('numdrv').AsString <> '') and
                      (odsJur.FieldByName('fd_datef_chr').AsString <> '') and
                      (odsJur.FieldByName('fn_sos').AsInteger <> 3) and
                      (odsJur.FieldByName('fn_sos').AsInteger <> 4) and
                      (odsJur.FieldByName('fn_sos').AsInteger <> 5);
end;

procedure TfrmMain.DoVisibleComeBack;
begin
  aComeBack.Visible := (odsJur.RecordCount <> 0) and
                       ((odsJur.FieldByName('fn_sos').AsInteger = 3) or
                        (odsJur.FieldByName('fn_sos').AsInteger = 5) or
                        (odsJur.FieldByName('fn_sos').AsInteger = 6)); // если отменен или невыход
end;

procedure TfrmMain.DoVisibleContinueRas;
begin
  aContinueRas.Visible := (odsJur.FieldByName('fn_sos').AsInteger = 1) and
                          (odsJur.RecordCount <> 0);
  aContinueRasMG.Visible := (odsJur.FieldByName('fn_sos').AsInteger = 1) and
                          (odsJur.RecordCount <> 0);
end;

procedure TfrmMain.DoVisibleCopy;
begin
  aCopy.Visible := ((odsJur.FieldByName('fn_sos').AsInteger = 9) or
                   (odsJur.FieldByName('fn_sos').AsInteger = 8)) and
                   (odsJur.RecordCount <> 0);
end;

procedure TfrmMain.DoVisibleFact;
begin
  nSumFact.Visible := (odsJur.FieldByName('numdrv').AsString <> '') and
                      (odsJur.FieldByName('fd_datef_chr').AsString <> '') and
                      (odsJur.FieldByName('fn_sos').AsInteger <> 3) and
                      (odsJur.FieldByName('fn_sos').AsInteger <> 4) and
                      (odsJur.FieldByName('fn_sos').AsInteger <> 5);
end;

procedure TfrmMain.DoVisibleKM;
begin
  nKM.Visible := (odsJur.FieldByName('numdrv').AsString <> '') and
                 (odsJur.FieldByName('fn_sos').AsInteger <> 3) and
                 (odsJur.FieldByName('fn_sos').AsInteger <> 4) and
                 (odsJur.FieldByName('fn_sos').AsInteger <> 5) and
                 (odsJur.FieldByName('fn_sos').AsInteger <> 6);
end;

procedure TfrmMain.DoVisibleLastRas;
begin
  aLastSum.Visible := (odsJur.RecordCount <> 0) and
                      (odsJur.FieldByName('fd_datef_chr').AsString <> '') and
                      (odsJur.FieldByName('fk_adr2id').AsInteger = pMG);
end;

procedure TfrmMain.DoVisibleMakeCall;
begin
  aCallClient.Visible := (odsJur.FieldByName('fc_phone').AsString <> '') and
                         (odsJur.FieldByName('fc_phone').AsString <> 'б/н') and
                         (odsJur.FieldByName('fc_phone').AsString <> 'н/о') and
                         (odsJur.RecordCount <> 0);
  aCallClient2.Visible := aCallClient.Visible;
  aCallDriver.Visible := (odsJur.FieldByName('numdrv').AsString <> '') and
                         (odsJur.FieldByName('drvphone').AsString <> '') and
                         (odsJur.RecordCount <> 0);
  aCallDriver2.Visible := aCallDriver.Visible;
end;

procedure TfrmMain.DoVisibleNotExit;
begin
  aNotExit.Visible := ((odsJur.FieldByName('numdrv').AsString <> '') and
                       (odsJur.FieldByName('fd_datef_chr').AsString = '') and
                       (odsJur.FieldByName('fn_sos').AsInteger <> 5)) and
                      (odsJur.FieldByName('fn_sos').AsInteger <> 3) and
                      (odsJur.FieldByName('fn_sos').AsInteger <> 6);
end;

procedure TfrmMain.dxBarButton3Click(Sender: TObject);
begin
  VJOURNAL_SUM.Styles.Content := stSum;
end;

function TfrmMain.FindDriver(sNameDrv: string): Integer;
var i : Integer;
begin
  for i := 0 to tvJournal.DataController.RowCount - 1 do
    begin
      if (vJournal_NumDrv1.DataBinding.DataController.Values[i, vJournal_NumDrv1.Index] = sNameDrv) or (vJournal_NumDrv2.DataBinding.DataController.Values[i, vJournal_NumDrv2.Index] = sNameDrv) then
        begin
          if (not (Integer(colSos.DataBinding.DataController.Values[i, colSos.Index]) in [2..6])) and
             (VJOURNAL_FICS.DataBinding.DataController.Values[i, VJOURNAL_FICS.Index] <> null) then
            begin
              Result := i;
              RowId := i;
              exit;
            end;
        end;
    end;
  RowId := -1;
  Result := -1;
end;

function TfrmMain.FindDriverFcs(sNameDrv: string): Integer; 
var i : Integer;
begin
  for i := 0 to tvJournal.DataController.RowCount - 1 do
    begin
      if (vJournal_NumDrv1.DataBinding.DataController.Values[i, vJournal_NumDrv1.Index] = sNameDrv) or (vJournal_NumDrv2.DataBinding.DataController.Values[i, vJournal_NumDrv2.Index] = sNameDrv) then
        begin
          if not (Integer(colSos.DataBinding.DataController.Values[i, colSos.Index]) in [1..6]) then
            begin
              Result := i;
              RowId := i;
              exit;
            end;
        end;
    end;
  RowId := -1;
  Result := -1;
end;

function TfrmMain.FindDriverFics(sNameDrv: string): Integer; // ищем по позывному фиксированный или расчитанный заказ
var i : Integer;
begin
  for i := 0 to tvJournal.DataController.RowCount - 1 do
    begin
      if (vJournal_NumDrv1.DataBinding.DataController.Values[i, vJournal_NumDrv1.Index] = sNameDrv) or
         (vJournal_NumDrv2.DataBinding.DataController.Values[i, vJournal_NumDrv2.Index] = sNameDrv) then
        begin
          if (Integer(colSos.DataBinding.DataController.Values[i, colSos.Index]) = 8) or (Integer(colSos.DataBinding.DataController.Values[i, colSos.Index]) = 1) then
            begin
              Result := i;
              RowId := i;
              exit;
            end;
        end;
    end;
  RowId := -1;
  Result := -1;
end;

function TfrmMain.FindDriverNotInZakaz(sNameDrv : Variant; sJurId : Variant) : Integer;
var i : Integer;
begin
  for i := 0 to tvJournal.DataController.RowCount - 1 do
  begin
    if (VJOURNAL_NAMEDRV.DataBinding.DataController.Values[i, vJournal_DrvId1.Index] = sNameDrv) or
       (VJOURNAL_NAMEDRV.DataBinding.DataController.Values[i, vJournal_DrvId2.Index] = sNameDrv) then
      begin
        if not (Integer(colSos.DataBinding.DataController.Values[i, colSos.Index]) in [1..6]) then
        begin
          if colSos.DataBinding.DataController.Values[i, vJournal_ID.Index] <> sJurId then
          begin
            Result := i;
            Exit;
          end;
        end;
      end;
  end;
  Result := -1;
end;

function TfrmMain.FindDrv(sName: String): boolean;
begin
  odsLine.Close;
  odsLine.SetVariable('pfk_taxiid', pTaxiID);
  odsLine.Open;
  Result := odsLine.Locate('fc_name', teVvod.Text, []);
end;

function TfrmMain.FindPhone(sPhone: string): Integer;
var i : Integer;
begin
  for i := 0 to tvJournal.DataController.RowCount - 1 do
    begin
      if vJournal_NumTelFull.DataBinding.DataController.Values[i, vJournal_NumTelFull.Index] = sPhone then
        begin
          if not (Integer(colSos.DataBinding.DataController.Values[i, colSos.Index]) in [1..6]) then
            begin
              Result := i;
              RowId := i;
              exit;
            end;
        end;
    end;
  RowId := -1;
  Result := -1;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.CreateForm(TfrmExit, frmExit);
  try
    frmExit.ShowModal;
    if frmExit.ModalResult = mrOk then
      begin
        Phone.Free;
        Phone2.Free;
        action := caFree
      end else
      begin
        action := caNone;
      end;
  finally
    frmExit.Free;
  end;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  tvJournal.StoreToRegistry('\SoftWare\TaxiService\Disp\TVJOURNAL'+IntToStr(pSOTRID), True, [], 'TVJOURNAL');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var Ini : TIniFile;
begin
  os.LogOn;
  Russian := LoadKeyboardLayout('00000419', 0);
  Latin := LoadKeyboardLayout('00000409', 0);
  Self.WindowState := wsMaximized;
  Application.ProcessMessages;
  DoParams;
  if (DoLogin()) then
    begin
      Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Dispetcher.ini');
      try
        DoTapi(IntToStr(Ini.ReadInteger('PHONE', 'PhoneNumber', -1)), Phone);
        DoTapi(IntToStr(Ini.ReadInteger('PHONE', 'PhoneNumber2', -1)), Phone2);
        sGlobalPhone := IntToStr(Ini.ReadInteger('PHONE', 'PhoneNumber', -1));
        sGlobalPhone2 := IntToStr(Ini.ReadInteger('PHONE', 'PhoneNumber2', -1));
        sGlobalPhones := Ini.ReadString('PHONE', 'PhoneNumbers', '-1');
        pcOptions.ActivePageIndex := 0;
        tAlarm.Enabled := True;
      finally
        Ini.Free;
      end;
    end else
    begin
      Application.Terminate();
      exit;
    end;
  tRefresh.Enabled := True;
  tNeedRefresh.Enabled := True;
  DoActions;
  aFind.Enabled := teVvod.Text <> '';
  aActions.Enabled := teVvod.Text <> '';
  pcButtons.ActivePageIndex := 0;
  pcOptions.HideTabs := True;
// -- Кнопки и тд
  aKm.Enabled := odsJur.RecordCount <> 0;
  aAddTime.Enabled := odsJur.RecordCount <> 0;
  aSetFactSum.Enabled := odsJur.RecordCount <> 0;

  aCalculate.Enabled := odsJur.RecordCount <> 0;
  aRefresh.Enabled := odsJur.RecordCount <> 0;
  bBonus.Enabled := odsJur.RecordCount <> 0;
  bNumAb.Enabled := odsJur.RecordCount <> 0;
  bPeregruz.Enabled := odsJur.RecordCount <> 0;

  DoEnableAddTimeControls;
  DoEnableStopControls;
  DoEnableFactControls;
  DoEnableKmControls;
  DoEnableFicsControls;
  DoEnablePeregon;
  DoEnableNeoplata;
  DoEnablePredZakaz;
  DoVisibleCopy;
  DoEnableFree;
  DoVisibleMakeCall;

  DoCreateSubMenu;
  DoCreateMenuAdr2;

  JurID := 0;
  JurID2 := 0;
  s1 := '';
  s2 := '';
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
procedure DoKey(aKey:TKey);
  var
    k:Integer;
  begin
    if TryStrToInt(aKey.key, k) then
    begin
      if (k = Key)
        and (not(aKey.shift) or (aKey.shift and (Shift >= [ssShift])))
        and (not(aKey.alt) or (aKey.alt and (Shift >= [ssAlt])))
        and (not(aKey.ctrl) or (aKey.ctrl and (Shift >= [ssCtrl]))) then
      begin
        if (aKey.action <> nil) then
        begin
          if (aKey.action.Enabled) then
            aKey.action.Execute();
        end;
//        else begin
//          if (aKey.raion <> null) then
//          begin
//            if not MoveToPlaceCurrentDriver(aKey.raion) then
//            begin
//              try
//                teVihod.SetFocus;
//              except
//              end;
//            end;
//          end;
//        end;
      end;
    end;
  end;
var
  I: Integer;
begin
//  if key in [48..57] then
//  begin
//    if not(teVihod.Focused) then
//      teVihod.Text := teVihod.Text + IntToStr(key-48);
//  end;
//  if key in [96..105] then
//  begin
//    if not(teVihod.Focused) then
//      teVihod.Text := teVihod.Text + IntToStr(key-96);
//  end;

  for I := 0 to Length(FKeys)-1 do
  begin
    DoKey(FKeys[I]);
  end;
end;

procedure TfrmMain.lbDrvClick(Sender: TObject);
begin
  aSetDrvExecute(nil);
end;

procedure TfrmMain.lbDrvMouseLeave(Sender: TObject);
begin
  lbDrv.Style.TextStyle := lbDrv.Style.TextStyle - [fsUnderLine];
  lbDrv.Cursor := crDefault;
end;

procedure TfrmMain.lbDrvMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lbDrv.Style.TextStyle := lbDrv.Style.TextStyle + [fsUnderLine];
  lbDrv.Cursor := crHandPoint;
end;

procedure TfrmMain.LoadKey;
var
  I: Integer;
  synonym : string;
  J: Integer;
  raion:Variant;
  ilen:Integer;
begin
  with odsKeys do
  begin
    Open;
    First;
    for I := 0 to RecordCount - 1 do
    begin
      raion := FieldByName('fk_raion').AsVariant;
      if (raion<>null) then
      begin
        ilen := Length(FKeys);
        SetLength(FKeys,ilen+1);
        FKeys[ilen].key := FieldByName('fc_key').AsString;
        FKeys[ilen].shift := FieldByName('fl_shift').AsString = '1';
        FKeys[ilen].alt := FieldByName('fl_alt').AsString = '1';
        FKeys[ilen].ctrl := FieldByName('fl_ctrl').AsString = '1';
        FKeys[ilen].raion := FieldByName('fk_raion').AsVariant;
      end
      else
      begin
        synonym := FieldByName('fc_synonym').AsString;
        for J := 0 to Length(FKeys) - 1 do
        begin
          if (FKeys[j].synonym = synonym) and (FKeys[j].synonym <> '') then
          begin
            FKeys[j].key := FieldByName('fc_key').AsString;
//            if (FKeys[j].F1<>nil) then
//            begin
//              FKeys[j].F1.Caption := FieldByName('fc_symbol').AsString;
//            end;
            FKeys[j].shift := FieldByName('fl_shift').AsString = '1';
            FKeys[j].alt := FieldByName('fl_alt').AsString = '1';
            FKeys[j].ctrl := FieldByName('fl_ctrl').AsString = '1';
//            if (FKeys[j].ShiftL<>nil) then
//            begin
//              if FKeys[j].shift then
//                FKeys[j].ShiftL.Caption := FKeys[j].ShiftL.Caption + ' Shift';
//              if FKeys[j].alt then
//                FKeys[j].ShiftL.Caption := FKeys[j].ShiftL.Caption + ' Alt';
//              if FKeys[j].ctrl then
//                FKeys[j].ShiftL.Caption := FKeys[j].ShiftL.Caption + ' Ctrl';
//              FKeys[j].ShiftL.Caption := TrimLeft(FKeys[j].ShiftL.Caption);
//            end;

          end;
      end;
      end;
      Next;
    end;
    Close;
  end;
end;

procedure TfrmMain.memCommentKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_F2) then
    begin
      bSaveCommentClick(nil);
    end;
  if Key = VK_ESCAPE then
    begin
      bCancelCommentClick(nil);
    end;
end;

procedure TfrmMain.nSmsClick(Sender: TObject);
var str : TStringList;
    strPath : string;
    oq : TOracleQuery;
begin
  if (odsJur.FieldByName('fc_phone').AsString = '') and (odsJur.FieldByName('fc_phone').AsString = '::::::') and
     (odsJur.FieldByName('fc_phone').AsString = 'н/о') and (odsJur.FieldByName('fc_phone').AsString = 'б/н') then
    begin
      DoShowRemark('СМС не отправлено! Нет номера телефона!', stError);
      exit;
    end;
  if odsJur.FieldByName('namedrv').AsString = '' then
    begin
      DoShowRemark('СМС не отправлено! Для заказа не выбрана машина!', stError);
      exit;
    end;

  str := TStringList.Create;
  oq := ToracleQuery.Create(nil);
  try
    str.Add(odsJur.FieldByName('fc_phone').AsString);
    str.SaveToFile(ExtractFilePath(paramstr(0))+'contacts.txt');
    str.Clear;
    str.Add('Автомобиль '+odsJur.FieldByName('namedrv').AsString+' ожидает Вас. Счастливого пути!');
    str.SaveToFile(ExtractFilePath(paramstr(0))+'message.txt');
    str.Clear;
    str.Add('blat message.txt -tf contacts.txt -p smsgate -u lux -pw 1234');
    str.SaveToFile(ExtractFilePath(paramstr(0))+'sms.bat');
    strPath := ExtractFilePath(paramstr(0))+'sms.bat';
    WinExecAndWait(PAnsiChar(strPath), 1);
// -- делаем отметку в базе
    oq.Session := os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal set fl_sms = 1 where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    os.Commit;
    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    odsJur.AfterScroll := odsJurAfterScroll;
  finally
    str.Free;
    oq.Free;
  end;
end;

procedure TfrmMain.N1Click(Sender: TObject);
begin
  tvJournal.RestoreFromRegistry('\SoftWare\TaxiService\Disp\TVJOURNALDefault'+IntToStr(pSOTRID), False, False, [], 'TVJOURNAL');
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  showmessage('На смену!');
end;

procedure TfrmMain.nAddTimeClick(Sender: TObject);
begin
  seAddTime1.Tag := 2;
  seAddTime1.Properties.OnChange := nil;
  seAddTime1.Value := odsJur.FieldByName('fn_time').AsInteger;
  seAddTime1.Properties.OnChange := seAddTime1PropertiesChange;
  pcOptions.ActivePageIndex := 2;
  seAddTime1.SetFocus;
end;

procedure TfrmMain.nStopDrvClick(Sender: TObject);
begin
  DoStopDrv(odsJur.FieldByName('fk_id').AsInteger);
end;

procedure TfrmMain.nSumCallClick(Sender: TObject); // Оплата за подачу !!! потом еще надо будет считать поездки для других такси
var oq : TOracleQuery;
    pCost1 : Double;
    pSumR : Double;
begin
  odsCost4Vih.Close;
  odsCost4Vih.SetVariable('pfk_taxiid', pTaxiID);
  odsCost4Vih.Open;
  pCost1 := odsCost4Vih.FieldByName('fn_cost1').AsFloat; // подача машины

  pSumR := pCost1;

  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' update taxi.tjournal '+#13+
                   '    set fn_sos = 6, fn_sos_prev = fn_sos, fd_dater = sysdate, fn_sumr = :pfn_sumr, fn_time_trip = 0 '+#13+
                   '  where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfn_sumr', otInteger, pSumR);
    oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
    oq.Execute;
    os.Commit;
    
    DoDriverEvent(odsJur.FieldByName('fk_id').AsInteger,
                  odsJur.FieldByName('fk_drvid').AsInteger,
                  odsJur.FieldByName('fk_drvid2').AsInteger,
                  0,
                  'EMPTY_TRIP');

    odsJur.AfterScroll := nil;
    RefreshQuery(odsJur);
    RefreshQuery(odsHis);
    odsJur.AfterScroll := odsJurAfterScroll;
    DoShowRemark('Позывному № '+odsJur.FieldByName('numdrv').AsString+' оплата за выход - '+FloatToStr(round(pSumR))+' руб.', stCapValue);
    DoInsLastRas(odsJur.FieldByName('numdrv').AsString, FloatToStr(round(pSumR)), odsJur.FieldByName('fk_id').AsInteger);
    lbSumR.Caption := FloatToStr(pSumR);
    DoVisibleKM;
    DoVisibleSumCall;
    DoVisibleOtmena;
    DoVisibleNotExit;
    DoVisibleCopy;
    DoVisibleComeBack;

    DoEnableAddTimeControls;
    DoEnableKmControls;
    DoEnableFactControls;
    DoEnableDrv;
    DoEnableRas;

    DoShowState(odsJur.FieldByName('fn_sos').AsInteger);
  finally
    oq.Free;
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.nSumFactClick(Sender: TObject);
begin
  pcOptions.ActivePageIndex := 3;
  teFactSum.Tag := 2;
  teFactSum.SetFocus;
  if odsJur.FieldByName('fn_sumf').AsInteger <> 0 then
    begin
      teFactSum.Properties.OnChange := nil;
      teFactSum.Text := IntToStr(odsJur.FieldByName('fn_sumf').AsInteger);
      teFactSum.Properties.OnChange := teFactSumPropertiesChange;
      teFactSum.SelLength := 0;
      teFactSum.SelStart := Length(teFactSum.Text);
    end;
  if odsJur.FieldByName('fn_sumfmg').AsInteger <> 0 then
    begin
      teFactSumMG.Properties.OnChange := nil;
      teFactSumMG.Text := IntToStr(odsJur.FieldByName('fn_sumfmg').AsInteger);
      teFactSumMG.Properties.OnChange := teFactSumMGPropertiesChange;
    end;
end;

procedure TfrmMain.nStopCltClick(Sender: TObject);
begin
  DoStopClient(odsJur.FieldByName('fk_id').AsInteger);
end;

procedure TfrmMain.nKMClick(Sender: TObject);
begin
  pcOptions.ActivePageIndex := 1;
  teNum.Tag := 2;
  teNum.SetFocus;
  if odsJur.FieldByName('fn_km1').AsFloat <> 0 then
    begin
      teNum.Properties.OnChange := nil;
      teNum.Text := FloatToStr(odsJur.FieldByName('fn_km1').AsFloat);
      if odsJur.FieldByName('fn_km2').AsFloat <> 0 then
        begin
          teNum.Text := teNum.Text+'/'+FloatToStr(odsJur.FieldByName('fn_km2').AsFloat)
        end;
      teNum.Properties.OnChange := teNumPropertiesChange;
      teNum.SelLength := 0;
      teNum.SelStart := Length(teNum.Text);
    end;
end;

procedure TfrmMain.odsCntJurBeforeOpen(DataSet: TDataSet);
begin
  odsCntJur.SetVariable('pfk_taxiid', pTaxiID);
  odsCntJur.SetVariable('pfk_sotrid', pSotrID);
end;

procedure TfrmMain.odsJurAfterOpen(DataSet: TDataSet);
begin
  aRefresh.Enabled := odsJur.RecordCount <> 0;
  bHomeAdr.Enabled := odsJur.RecordCount <> 0;
end;

procedure TfrmMain.odsJurAfterScroll(DataSet: TDataSet);
begin
  nSms.Enabled := Length(odsJur.FieldByName('fc_phone').AsString) = 11; 

  DoShowState(odsJur.FieldByName('fn_sos').AsInteger);
  pcOptions.ActivePageIndex := 0;

  DoVisibleNotExit;
  DoVisibleOtmena;
  DoVisibleSumCall;
  DoVisibleContinueRas;
  DoVisibleCopy;
  DoVisibleAddTime;
  DoVisibleComeBack;
  DoVisibleSend;
  DoVisibleLastRas;

  DoEnableBaggage;
  DoEnableRas;
  DoEnableNeoplata;
  DoEnableFree;
  DoEnableVisibleStop; // показываем, инайблим все кнопки остановок
  DoEnablePredZakaz;
  DoEnableAdr1;
  DoEnableAdr2;
  DoEnableDrv;

  if bSaveFics.Enabled = True then
    bSaveFics.Enabled := False;

//-- номер абонента
  if odsJur.FieldByName('fc_num').AsString <> '' then
    bNumAb.Caption := odsJur.FieldByName('fc_num').AsString
  else
    bNumAb.Caption := '';
  bNumAb.Enabled := (bNumAb.Caption = '') and (odsJur.RecordCount <> 0);

//-- кодовое слово
  if odsJur.FieldByName('fc_kod').AsString <> '' then
    bKod.Caption := odsJur.FieldByName('fc_kod').AsString
  else
    bKod.Caption := '';
  bKod.Enabled := bNumAb.Caption <> '';

//-- домашний адрес
  if odsJur.FieldByName('fc_adr').AsString <> '' then
    bHomeAdr.Caption := odsJur.FieldByName('fc_adr').AsString
  else
    bHomeAdr.Caption := '';
  bSetHome.Enabled := (bHomeAdr.Caption <> '') and (odsJur.FieldByName('fn_sos').AsInteger <> 1) and (odsJur.FieldByName('fn_sos').AsInteger <> 3);
  bSetHome.Tag := odsJur.FieldByName('fk_adrid').AsInteger;

//-- поездки
  lbNumTrip.Caption := IntToStr(odsJur.FieldByName('fn_now').AsInteger);
  bBonus.Caption := IntToStr(odsJur.FieldByName('fn_bonus').AsInteger);
  bBonus.Enabled := (bBonus.Caption <> '-1') and (odsJur.RecordCount <> 0) and (odsJur.FieldByName('fn_sos').AsInteger <> 3);

//-- история поездок
  if sSynTaxi = 'LUXURY' then
    begin
      odsHis.Close;
      odsHis.SetVariable('pfc_num', odsJur.FieldByName('fc_phone_full').AsString);
      odsHis.Open;
    end else
    begin
      odsHis.Close;
      odsHis.SetVariable('pfc_num', odsJur.FieldByName('fc_num').AsString);
      odsHis.Open;
    end;

  if odsJur.FieldByName('fl_bagage').AsInteger = 1 then
    bBagage.Caption := 'Закончили ехать с перегрузом'
  else
    bBagage.Caption := 'Начали ехать с перегрузом';

  if odsJur.FieldByName('fn_sos').AsInteger = 4 then // неоплата заказа
    begin
      cbNeopl.Properties.OnChange := nil;
      cbNeopl.Checked := True;
      cbNeopl.Properties.OnChange := cbNeoplPropertiesChange;
    end else
    begin
      cbNeopl.Properties.OnChange := nil;
      cbNeopl.Checked := False;
      cbNeopl.Properties.OnChange := cbNeoplPropertiesChange;
    end;
// Перегон
  DoEnablePeregon;
  if odsJur.FieldByName('fl_peregon').AsInteger = 1 then
    begin
      cbPeregon.Properties.OnChange := nil;
      cbPeregon.Checked := True;
      cbPeregon.Properties.OnChange := cbPeregonPropertiesChange;
    end else
    begin
      cbPeregon.Properties.OnChange := nil;
      cbPeregon.Checked := False;
      cbPeregon.Properties.OnChange := cbPeregonPropertiesChange;
    end;

  if odsJur.FieldByName('numdrv').AsString = '' then
    begin
      lbDrv.Caption := '--';
      lbDrv.Style.TextColor := clRed;
    end else
    begin
      lbDrv.Caption := odsJur.FieldByName('numdrv').AsString;
      lbDrv.Style.TextColor := clNavy;
    end;

// Фиксация
  teFics.Properties.OnChange := nil;
  teFics.Time := odsJur.FieldByName('fd_datef').AsDateTime;
  teFics.Properties.OnChange := teFicsPropertiesChange;
  DoEnableFicsControls;
// Время расчета
  lbTimeRas.Caption := odsJur.FieldByName('fd_dater_str').AsString+' ('+IntToStr(odsJur.FieldByName('fn_time_trip').AsInteger)+')';
// Добавленное время
  seAddTime.Properties.OnChange := nil;
  seAddTime.Value := odsJur.FieldByName('fn_time').AsInteger;
  seAddTime.Properties.OnChange := seAddTimePropertiesChange;
  DoEnableAddTimeControls;
// Остановки и багаж
  bSaveStopDrv.Enabled := False;
  bSaveStopClt.Enabled := False;
  bSaveBaggage.Enabled := False;
  odsStops.Close;
  odsStops.SetVariable('pfk_jurid', odsJur.FieldByName('fk_id').AsInteger);
  odsStops.Open;
  seStopDrv.Properties.OnChange := nil;
  seStopDrv.Value := odsStops.FieldByName('fn_stopdrv').AsInteger;
  seStopDrv.Properties.OnChange := seStopDrvPropertiesChange;
  odsStops.Close;
  odsStops.SetVariable('pfk_jurid', odsJur.FieldByName('fk_id').AsInteger);
  odsStops.Open;
  seStopClt.Properties.OnChange := nil;
  seStopClt.Value := odsStops.FieldByName('fn_stopclt').AsInteger;
  seStopClt.Properties.OnChange := seStopCltPropertiesChange;
  odsStops.Close;
  odsStops.SetVariable('pfk_jurid', odsJur.FieldByName('fk_id').AsInteger);
  odsStops.Open;
  seBaggage.Properties.OnChange := nil;
  seBaggage.Value := odsStops.FieldByName('fn_baggage').AsInteger;
  seBaggage.Properties.OnChange := seBaggagePropertiesChange;
  DoEnableStopControls;
// километраж
  teNumKm.Properties.OnChange := nil;
  if odsJur.FieldByName('fn_km2').AsFloat <> 0 then
    begin
      teNumKm.Text := FloatToStr(odsJur.FieldByName('fn_km1').AsFloat)+'/'+FloatToStr(odsJur.FieldByName('fn_km2').AsFloat);
    end else
    begin
      if odsJur.FieldByName('fn_km1').AsFloat = 0 then
        teNumKm.Text := ''
      else
        teNumKm.Text := FloatToStr(odsJur.FieldByName('fn_km1').AsFloat);
    end;
  teNumKm.Properties.OnChange := teNumKmPropertiesChange;
  DoEnableKmControls;
  DoVisibleKM;
// Сумма
  lbSumR.Caption := IntToStr(odsJur.FieldByName('fn_sumr').AsInteger);
// Cумма по факту и по межгороду
  seSumF.Properties.OnChange := nil;
  seSumF.Value := odsJur.FieldByName('fn_sumf').AsInteger;
  seSumF.Properties.OnChange := seSumFPropertiesChange;
  seSumFMG.Properties.OnChange := nil;
  seSumFMG.Value := odsJur.FieldByName('fn_sumfmg').AsInteger;
  seSumFMG.Properties.OnChange := seSumFMGPropertiesChange;
  DoEnableFactControls;
  DoVisibleFact;

// Звонки клиенту и водителю
  DoVisibleMakeCall;
// Свободный заказ
  if odsJur.FieldByName('fl_free').AsInteger = 1 then
    begin
      cbFree.Properties.OnChange := nil;
      cbFree.Checked := True;
      cbFree.Properties.OnChange := cbFreePropertiesChange;
    end else
    begin
      cbFree.Properties.OnChange := nil;
      cbFree.Checked := False;
      cbFree.Properties.OnChange := cbFreePropertiesChange;
    end;
// Оплата по талону
  if odsJur.FieldByName('fl_talon').AsInteger = 1 then
    begin
      cbTalon.Properties.OnChange := nil;
      cbTalon.Checked := True;
      cbTalon.Properties.OnChange := cbTalonPropertiesChange;
    end else
    begin
      cbTalon.Properties.OnChange := nil;
      cbTalon.Checked := False;
      cbTalon.Properties.OnChange := cbTalonPropertiesChange;
    end;
end;

procedure TfrmMain.odsJurBeforeOpen(DataSet: TDataSet);
begin
  odsJur.SetVariable('pfk_taxiid', pTaxiID);
end;

procedure TfrmMain.OnConnected(const S: string); // поднятие трубки
var oq : TOracleQuery;
    id : Integer;
begin
  Lg_ev(DateTimeToStr(Date)+' OnConnected 1 '+S, 'c:\Taxi\uMain.log');
  if not (S = sGlobalPhone) and not (S = sGlobalPhone2) and not (AnsiContainsStr(sGlobalPhones, S)) then
    begin
      Lg_ev(DateTimeToStr(Date)+' OnConnected 2 '+S, 'c:\Taxi\uMain.log');
      odsJur.AfterScroll := nil;   // Поступил звонок
      try
        if (FindPhone(s) <> -1) and (s <> '::::::') and (s <> 'н/о') then
          begin
            odsJur.Locate('fc_phone_full', s, []);
          end else
          begin
            oq := TOracleQuery.Create(nil);
            try
              oq.Session := os;
              oq.SQL.Text := ' insert into taxi.tjournal(fd_datein, fn_sos, fc_phone, fc_phone_full, fk_clientid, fk_sotrid, fk_taxiid) '+#13+
                             ' values(sysdate, 9, taxi.get_phone_without_kodtown(:pfc_phone), :pfc_phone_full, '+#13+
                             '        (select max(fk_clientid) from taxi.tphones where fc_phone = taxi.get_phone_without_kodtown(:pfc_phone)), '+#13+
                             '        :pfk_sotrid, :pfk_taxiid) '+#13+
                             ' returning fk_id into :pfk_id ';
              oq.DeclareAndSet('pfc_phone', otString, s);
              oq.DeclareAndSet('pfc_phone_full', otString, s);
              oq.DeclareAndSet('pfk_sotrid', otInteger, pSOTRID);
              oq.DeclareAndSet('pfk_taxiid', otInteger, pTaxiID);
              oq.DeclareVariable('pfk_id', otInteger);
              oq.Execute;
              os.Commit;
              id := odsJur.FieldByName('fk_id').AsInteger;
              RefreshQuery(odsJur);
              odsJur.Locate('fk_id', id, []);
              if odsJur.RecordCount = 1 then
                begin
                  DoEnableAdr1;
                  DoEnableAdr2;
                end;

              if intAutoShowAdr = 1 then // если стоит настройка "Автоматически выводить окно адреса", то выводим окно адреса
                begin
                  if Assigned(frmSetAdr1) then
                    begin
                      frmSetAdr1.pTypeShow := 1;
                      frmSetAdr1.Show;
                    end else
                    begin
                      Application.CreateForm(TfrmSetAdr1, frmSetAdr1);
                      frmSetAdr1.pTypeShow := 1;
                      frmSetAdr1.DoShowForm(vJournal_ID.DataBinding.DataController.Values[0, vJournal_ID.Index],
                                            vJournal_FnStop.DataBinding.DataController.Values[0, vJournal_FnStop.Index],
                                            vJournal_FkRaionID.DataBinding.DataController.Values[0, vJournal_FkRaionID.Index],
                                            vJournal_FkTypeDetail.DataBinding.DataController.Values[0, vJournal_FkTypeDetail.Index]);
                      frmSetAdr1.Show;
                    end;
                end;
            finally
              oq.Free;
            end;
        end;
      finally
        odsJur.AfterScroll := odsJurAfterScroll;
        odsJurAfterScroll(nil);
      end;
    end else
    begin       // Звоним сами
      if isMyCallToClient = True then
        begin
          oq := TOracleQuery.Create(nil);
          try
            oq.Session := os;
            oq.SQL.Text := ' update taxi.tjournal set fl_dozvon = 1 where fk_id = :pfk_id ';
            oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
            oq.Execute;
            odsJur.AfterScroll := nil;
            RefreshQuery(odsJur);
            odsJur.AfterScroll := odsJurAfterScroll;
            os.Commit;
          finally
            oq.Free;
          end;
        end;
    end;
end;

procedure TfrmMain.OnDisconected(const S: string); // положили трубку
begin
  isMyCallToClient := False;
//  Lg_ev('OnDisconnected '+s, 'c:\Taxi\uMain.log');
end;

procedure TfrmMain.OnOffering(const S: string);
begin
//  Lg_ev('OnOffering '+s, 'c:\Taxi\uMain.log');
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

procedure TfrmMain.seAddTime1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_F2) then
    begin
      bSaveTimeClick(nil);
    end;
  if Key = VK_ESCAPE then
    begin
      bCancelTimeClick(nil);
    end; 
end;

procedure TfrmMain.seAddTime1PropertiesChange(Sender: TObject);
begin
  if seAddTime1.Value <> 0 then
    bSaveTime.Enabled := True
  else
    bSaveTime.Enabled := False;
end;

procedure TfrmMain.seAddTimeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_F2) then
    begin
      bSaveAddTimeClick(nil);
    end;
end;

procedure TfrmMain.seAddTimePropertiesChange(Sender: TObject);
begin
  if seAddTime.Value <> 0 then
    bSaveAddTime.Enabled := True
  else
    bSaveAddTime.Enabled := False;
end;

procedure TfrmMain.seBaggageKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_F2) then
    begin
      bSaveBaggageClick(nil);
    end;
end;

procedure TfrmMain.seBaggagePropertiesChange(Sender: TObject);
begin
  bSaveBaggage.Enabled := seBaggage.Value <> 0;
end;

procedure TfrmMain.sePenaltyKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_F2) then
    begin
      bSavePenaltyClick(nil);
    end;
  if Key = VK_ESCAPE then
    begin
      bCancelPenaltyClick(nil);
    end;
end;

procedure TfrmMain.sePenaltyPropertiesChange(Sender: TObject);
begin
  if sePenalty.Value <> 0 then
    bSavePenalty.Enabled := True
  else
    bSavePenalty.Enabled := False;
end;

procedure TfrmMain.seStopCltKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_F2) then
    begin
      bSaveStopCltClick(nil);
    end;
end;

procedure TfrmMain.seStopCltPropertiesChange(Sender: TObject);
begin
  if seStopClt.Value <> 0 then
    bSaveStopClt.Enabled := True
  else
    bSaveStopClt.Enabled := False;
end;

procedure TfrmMain.seStopDrvKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_F2) then
    begin
      bSaveStopDrvClick(nil);
    end;
end;

procedure TfrmMain.seStopDrvPropertiesChange(Sender: TObject);
begin
  if seStopDrv.Value <> 0 then
    bSaveStopDrv.Enabled := True
  else
    bSaveStopDrv.Enabled := False;
end;

procedure TfrmMain.seSumFKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_F2) then
    begin
      bSaveSumFClick(nil);
    end;
end;

procedure TfrmMain.seSumFMGKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_F2) then
    begin
      bSaveSumFMGClick(nil);
    end;
end;

procedure TfrmMain.seSumFMGPropertiesChange(Sender: TObject);
begin
  if seSumFMG.Value <> 0 then
    bSaveSumFMG.Enabled := True
  else
    bSaveSumFMG.Enabled := False;
end;

procedure TfrmMain.seSumFPropertiesChange(Sender: TObject);
begin
  if seSumF.Value <> 0 then
    bSaveSumF.Enabled := True
  else
    bSaveSumF.Enabled := False;
end;

procedure TfrmMain.tAlarmTimer(Sender: TObject); // добавление предварительного заказа в список
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.SQL.Text := ' select fk_jurid '+#13+
                    '   from taxi.tpred '+#13+
                    '  where round((fd_date-sysdate)*60*24) = :pKolvoMin '+#13+
                    '    and fk_taxiid = :pfk_taxiid '+#13+
                    '    and fl_del = 0 ';
    ods.DeclareAndSet('pKolvoMin', otInteger, intKolvoPredMin);
    ods.DeclareAndSet('pfk_taxiid', otInteger, pTaxiID);
    ods.Open;
    if ods.RecordCount > 0 then
      begin
        tShAlarm.Enabled := True;
        tTimeAlarm.Enabled := True;
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.SQL.Text := ' update taxi.tjournal set fn_sos = 9, fn_sos2 = 0 where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfk_id', otInteger, ods.FieldByName('fk_jurid').AsInteger);
          oq.Execute;
          os.Commit;
          odsJur.AfterScroll := nil;
          RefreshQuery(odsJur);
          odsJur.AfterScroll := odsJurAfterScroll;
        finally
          oq.Free;
        end;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.tColorErrorTimer(Sender: TObject);
begin
  teVvod.Style.Color := clWindow;
  tColorError.Enabled := False;
end;

procedure TfrmMain.teFactSumKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_F2) then
    begin
      bSaveFactClick(nil);
    end;
  if Key = VK_ESCAPE then
    begin
      bCancelFactClick(nil);
    end;
  if key = vk_down then // вверх
    begin
      teFactSumMG.SetFocus;
    end;
end;

procedure TfrmMain.teFactSumKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9']) and not (Key = #8) then
    Key := #0;
end;

procedure TfrmMain.teFactSumMGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_F2) then
    begin
      bSaveFactClick(nil);
    end;
  if Key = VK_ESCAPE then
    begin
      bCancelFactClick(nil);
    end;
  if key = vk_up then // вверх
    begin
      teFactSum.SetFocus;
    end;
end;

procedure TfrmMain.teFactSumMGKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9']) and not (Key = #8) then
    Key := #0;
end;

procedure TfrmMain.teFactSumMGPropertiesChange(Sender: TObject);
begin
  if teFactSumMG.Text <> '' then
    bSaveFact.Enabled := True;
end;

procedure TfrmMain.teFactSumPropertiesChange(Sender: TObject);
begin
  if teFactSum.Text <> '' then
    bSaveFact.Enabled := True;
end;

procedure TfrmMain.teFicsClick(Sender: TObject);
begin
  teFics.SelLength := 0;
  teFics.SelStart := Length(teFics.Text);
end;

procedure TfrmMain.teFicsEnter(Sender: TObject);
begin
  teFics.SelLength := 0;
  teFics.SelStart := Length(teFics.Text);
end;

procedure TfrmMain.teFicsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_F2) then
    begin
      bSaveFicsClick(nil);
    end;
end;

procedure TfrmMain.teFicsMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  teFics.SelLength := 0;
  teFics.SelStart := Length(teFics.Text);
end;

procedure TfrmMain.teFicsPropertiesChange(Sender: TObject);
begin
  if frmMain.teFics.Text = '00:00' then
    bSaveFics.Enabled := False
  else
    bSaveFics.Enabled := True;
end;

procedure TfrmMain.teNumClick(Sender: TObject);
begin
  ActivateKeyboardLayout(latin, KLF_REORDER);
end;

procedure TfrmMain.teNumEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(latin, KLF_REORDER);
end;

procedure TfrmMain.teNumExit(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmMain.teNumKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_F2) then
    begin
      if bSaveKM.Enabled = True then
        bSaveKMClick(nil);
    end;
  if Key = VK_F8 then 
    begin
      teNum.Text := '';
    end;
  if key = VK_ESCAPE then
    begin
      bCancelKmClick(nil);
    end; 
end;

procedure TfrmMain.teNumKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9']) and not (Key = '/') and not (Key = '\') and not (Key = #8) and not (Key = ',') then
    Key := #0;
  if Key = '\' then
    begin
    if Pos('/', teNum.Text) = 0 then
      Key := '/'
    else
      Key := #0; // !!! выводить надпись "Нельзя поставить 2 знака "/" "
    end;
  if Key = '/' then
    begin
    if Pos('/', teNum.Text) = 0 then
      Key := '/'
    else
      Key := #0; // !!! выводить надпись "Нельзя поставить 2 знака "/" "
    end;
end;

procedure TfrmMain.teNumKmClick(Sender: TObject);
begin
  ActivateKeyboardLayout(latin, KLF_REORDER);
end;

procedure TfrmMain.teNumKmEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(latin, KLF_REORDER);
end;

procedure TfrmMain.teNumKmExit(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmMain.teNumKmKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_F2) then
    begin
      if bSaveKM1.Enabled = True then
        bSaveKM1Click(nil);
    end;
  if (Key = VK_F8) or (Key = VK_ESCAPE) then
    begin
      teNumKm.Text := '';
    end;
end;

procedure TfrmMain.teNumKmKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9']) and not (Key = '/') and not (Key = '\') and not (Key = #8) and not (Key = ',') then
    Key := #0;
  if Key = '\' then
    begin
    if Pos('/', teNumKm.Text) = 0 then
      Key := '/'
    else
      Key := #0; // !!! выводить надпись "Нельзя поставить 2 знака "/" "
    end;
  if Key = '/' then
    begin
    if Pos('/', teNumKm.Text) = 0 then
      Key := '/'
    else
      Key := #0; // !!! выводить надпись "Нельзя поставить 2 знака "/" "
    end;
end;

procedure TfrmMain.teNumKmPropertiesChange(Sender: TObject);
begin
  bSaveKm1.Enabled := teNumKm.Text <> '';
end;

procedure TfrmMain.teNumPropertiesChange(Sender: TObject);
begin
  bSaveKm.Enabled := teNum.Text <> '';
end;

procedure TfrmMain.teVvodKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  try
  if Key = VK_RETURN then // Enter - Выбор действия с водителем
    begin
      if teVvod.Text <> '' then
        begin
          odsFindDrv.Close;
          odsFindDrv.SetVariable('pfc_name', teVvod.Text);
          odsFindDrv.SetVariable('pfk_taxiid', pTaxiID);
          odsFindDrv.Open;
          if odsFindDrv.RecordCount = 0 then
            begin
              DoShowRemark('Позывной №'+teVvod.Text+' не существует!', stError);
              beep;
              teVvod.Style.Color := clRed;
              tColorError.Enabled := True;
              teVvod.Text := '';
              exit;
            end;
          if Assigned(frmActions) then
            begin
              frmActions.iDriverId := odsFindDrv.FieldByName('fk_id').AsInteger;
              frmActions.Show;
            end else
            begin
              Application.CreateForm(TfrmActions, frmActions);
              frmActions.iDriverId := odsFindDrv.FieldByName('fk_id').AsInteger;
              frmActions.Show;
            end;
//          frmActions.Top := teVvod.Top+52;
//          frmActions.Left := teVvod.Left+36;
          frmActions.grActions.SetFocus;
          frmActions.tvActions.DataController.GotoFirst;
        end else
        begin
          if Assigned(frmActions) then
            frmActions.Close;
          VJOURNAL_DATEIN.Focused := True;
          grJournal.SetFocus;
        end;
    end;
  finally
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.teVvodPropertiesChange(Sender: TObject);
begin
  aFind.Enabled := teVvod.Text <> '';
  aActions.Enabled := teVvod.Text <> '';
  aPenalty.Enabled := teVvod.Text <> '';
end;

procedure TfrmMain.tmKeysTimer(Sender: TObject);
begin
  tmKeys.Enabled := False;
end;

procedure TfrmMain.tNeedRefreshTimer(Sender: TObject);
var ods : TOracleDataSet;
    oq : TOracleQuery;
    id : Integer;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.SQL.Text := ' select fl_issend from taxi.tupdateinfo where fk_taxi = :pfk_taxi ';
    ods.DeclareAndSet('pfk_taxi', otInteger, pTaxiID);
    ods.Open;
    if ods.FieldByName('fl_issend').AsInteger = 1 then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := os;
          oq.SQL.Text := ' update taxi.tupdateinfo set fl_issend = 0 where fk_taxi = :pfk_taxi ';
          oq.DeclareAndSet('pfk_taxi', otInteger, pTaxiID);
          oq.Execute;
          os.Commit;
          odsJur.AfterScroll := nil;
          id := odsJur.FieldByName('fk_id').AsInteger;
          RefreshQuery(odsJur);
          odsJur.Locate('fk_id', id, []);
          odsJur.AfterScroll := odsJurAfterScroll;
          DoShowRemark('Переведен новый заказ!', stInfo);
        finally
          oq.Free;
        end;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.tRefreshTimer(Sender: TObject); // !!! проверить нужна ли вообще эта процедура
begin
  odsIsRefresh.Close;
  odsIsRefresh.Open;
  if odsIsRefresh.FieldByName('val').AsInteger = 1 then
    begin
      RefreshQuery(odsJur); // !!! отключать афтерскролл ??? проверить !!!
      oqUpdKeyRefresh.Execute;
      os.Commit;
    end;
end;

procedure TfrmMain.tShowRemarkTimer(Sender: TObject);
begin
  tShowRemark.Enabled := False;
end;

procedure TfrmMain.tTimeAlarmTimer(Sender: TObject);
begin
  tShAlarm.Enabled := False;
  tTimeAlarm.Enabled := False;
end;

procedure TfrmMain.TVHISCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var oq : TOracleQuery;
begin
  try
  if VHIS_FROM.Focused then
    begin
      if (odsJur.FieldByName('fn_sos').AsInteger <> 1) and (odsJur.FieldByName('fn_sos').AsInteger <> 3) and (odsJur.FieldByName('fn_sos').AsInteger <> 4) and
         (odsJur.FieldByName('fn_sos').AsInteger <> 5) and (odsJur.FieldByName('fn_sos').AsInteger <> 6) then
        begin
          oq := TOracleQuery.Create(nil);
          oq.Session := os;
          oq.Cursor := crSQLWait;
          try
            oq.SQL.Text := ' update taxi.tjournal '+#13+
                           '    set fc_adr1 = :pfc_adr1, fk_adr1id = :pfk_adr1id, fk_raionid = :pfk_raionid, fn_stop = decode(:pfn_stop, null, 0, :pfn_stop) '+#13+
                           '  where fk_id = :pfk_id ';
            oq.DeclareAndSet('pfc_adr1', otString, odsHis.FieldByName('fc_adr1').AsString); //TVHIS.DataController.Values[TVHIS.DataController.FocusedRecordIndex, VHIS_FROM.Index]);
            oq.DeclareAndSet('pfk_adr1id', otString, odsHis.FieldByName('fk_adr1id').AsInteger);
            oq.DeclareAndSet('pfk_raionid', otInteger, odsHis.FieldByName('fk_raionid').AsInteger);
            oq.DeclareAndSet('pfn_stop', otInteger, odsHis.FieldByName('fn_stop').AsInteger);
            oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
            oq.Execute;
            odsDetailAdr1.Close;
            odsDetailAdr1.SetVariable('pfk_jurid', odsHis.FieldByName('fk_id').AsInteger);
            odsDetailAdr1.Open;
            oq.DeleteVariables;
            oq.SQL.Text := ' merge into taxi.tjuradr1 using dual on (fk_jurid = :pfk_jurid) '+#13+
                           ' when not matched then '+#13+
                           '   insert(fc_adr, fc_dop, fk_type, fc_street, fc_street1, fl_isdownslash, fk_idadr1, fk_idadr2, fc_house, fc_houseliter, fc_hall, fc_adr_place, fc_housefraction, fk_jurid, fc_preffix) '+#13+
                           '   values(:pfc_adr, :pfc_dop, :pfk_type, :pfc_street, :pfc_street1, :pfl_isdownslach, :pfk_idadr1, :pfk_idadr2, :pfc_house, :pfc_houseliter, :pfc_hall, :pfc_adr_place, :pfc_housefraction, :pfk_jurid, :pfc_preffix) '+#13+
                           ' when matched then '+#13+
                           '   update set fc_adr=:pfc_adr, fc_dop=:pfc_dop, fk_type=:pfk_type, fc_street=:pfc_street, fc_street1=:pfc_street1, '+#13+
                           '              fl_isdownslash=:pfl_isdownslach, fk_idadr1=:pfk_idadr1, fk_idadr2=:pfk_idadr2, fc_house=:pfc_house, '+#13+
                           '              fc_houseliter=:pfc_houseliter, fc_hall=:pfc_hall, fc_adr_place=:pfc_adr_place, fc_housefraction=:pfc_housefraction, '+#13+
                           '              fc_preffix = :pfc_preffix '+#13+
                           '  where fk_jurid = :pfk_jurid ';
            oq.DeclareAndSet('pfc_adr', otString, odsDetailAdr1.FieldByName('fc_adr').AsString);
            oq.DeclareAndSet('pfc_dop', otString, odsDetailAdr1.FieldByName('fc_dop').AsString);
            oq.DeclareAndSet('pfk_type', otInteger, odsDetailAdr1.FieldByName('fk_type').AsInteger);
            oq.DeclareAndSet('pfc_street', otString, odsDetailAdr1.FieldByName('fc_street').AsString);
            oq.DeclareAndSet('pfc_street1', otString, odsDetailAdr1.FieldByName('fc_street1').AsString);
            oq.DeclareAndSet('pfl_isdownslach', otInteger, odsDetailAdr1.FieldByName('fl_isdownslash').AsInteger);
            oq.DeclareAndSet('pfk_idadr1', otInteger, odsDetailAdr1.FieldByName('fk_idadr1').AsInteger);
            oq.DeclareAndSet('pfk_idadr2', otInteger, odsDetailAdr1.FieldByName('fk_idadr2').AsInteger);
            oq.DeclareAndSet('pfc_house', otString, odsDetailAdr1.FieldByName('fc_house').AsString);
            oq.DeclareAndSet('pfc_houseliter', otString, odsDetailAdr1.FieldByName('fc_houseliter').AsString);
            oq.DeclareAndSet('pfc_hall', otString, odsDetailAdr1.FieldByName('fc_hall').AsString);
            oq.DeclareAndSet('pfc_adr_place', otString, odsDetailAdr1.FieldByName('fc_adr_place').AsString);
            oq.DeclareAndSet('pfc_housefraction', otString, odsDetailAdr1.FieldByName('fc_housefraction').AsString);
            oq.DeclareAndSet('pfc_preffix', otString, odsDetailAdr1.FieldByName('fc_preffix').AsString);
            oq.DeclareAndSet('pfk_jurid', otInteger, odsJur.FieldByName('fk_id').AsInteger);
            oq.Execute;
            os.Commit;
            odsJur.AfterScroll := nil;
            RefreshQuery(odsJur);
            odsJur.AfterScroll := odsJurAfterScroll;
          finally
            oq.Free;
          end;
        end;
    end;
  if VHIS_KUDA.Focused then
    begin
      if (odsJur.FieldByName('fn_sos').AsInteger <> 1) and (odsJur.FieldByName('fn_sos').AsInteger <> 3) and (odsJur.FieldByName('fn_sos').AsInteger <> 4) and
         (odsJur.FieldByName('fn_sos').AsInteger <> 5) and (odsJur.FieldByName('fn_sos').AsInteger <> 6) then
        begin
          oq := TOracleQuery.Create(nil);
          try
            oq.Session := os;
            oq.Cursor := crSQLWait;
            oq.SQL.Text := ' update taxi.tjournal '+#13+
                           '    set fc_adr2 = :pfc_adr2, fk_adr2id = :pfk_adr2id '+#13+
                           '  where fk_id = :pfk_id ';
            oq.DeclareAndSet('pfc_adr2', otString, TVHIS.DataController.Values[TVHIS.DataController.FocusedRecordIndex, VHIS_KUDA.Index]);
            oq.DeclareAndSet('pfk_adr2id', otString, odsHis.FieldByName('fk_adr2id').AsInteger);
            oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
            oq.Execute;
            odsDetailAdr2.Close;
            odsDetailAdr2.SetVariable('pfk_jurid', odsHis.FieldByName('fk_id').AsInteger);
            odsDetailAdr2.Open;
            oq.DeleteVariables;
            oq.SQL.Text := ' merge into taxi.tjuradr2 using dual on (fk_jurid = :pfk_id) '+#13+
                           ' when not matched then insert(fc_adr, fc_dop, fk_jurid) values(:pfc_adr, :pfc_dop, :pfk_id) '+#13+
                           ' when matched then update set fc_adr=:pfc_adr, fc_dop=:pfc_dop '+#13+
                           '                    where fk_jurid = :pfk_id ';
            oq.DeclareAndSet('pfc_adr', otString, odsDetailAdr2.FieldByName('fc_adr').AsString);
            oq.DeclareAndSet('pfc_dop', otString, odsDetailAdr2.FieldByName('fc_dop').AsString);
            oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
            oq.Execute;
            os.Commit;
            if odsJur.FieldByName('fd_datef_str').AsString <> '' then
              begin
                DoDriverEvent(odsJur.FieldByName('fk_id').AsInteger,
                              odsJur.FieldByName('fk_drvid').AsInteger,
                              odsJur.FieldByName('fk_drvid2').AsInteger,
                              odsHis.FieldByName('fk_adr2id').AsInteger,
                              'START_CLIENT_MOVE');
              end;
            odsJur.AfterScroll := nil;
            RefreshQuery(odsJur);
            odsJur.AfterScroll := odsJurAfterScroll;
          finally
            oq.Free;
          end;
        end;
    end;
  finally
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.TVHISCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[VHIS_SOS.Index] = 4 then // неоплата
    ACanvas.Brush.Color := RGB(255, 174, 174);
  if AViewInfo.GridRecord.Values[VHIS_SOS.Index] = 5 then // невыход - серый
    ACanvas.Brush.Color := clSilver;
end;

procedure TfrmMain.tvJournalCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var ARec : TRect;
    icolor : Tcolor;
begin
  if AViewInfo.GridRecord.Values[colSos.Index] = 1 then // закрыт - фиолетовый
    ACanvas.Brush.Color := RGB(251, 172, 249);
  if AViewInfo.GridRecord.Values[colSos.Index] = 2 then // пропущен
    ACanvas.Brush.Color := clSilver;
  if AViewInfo.GridRecord.Values[colSos.Index] = 3 then // неоплата - серый
    ACanvas.Brush.Color := clSilver;
  if AViewInfo.GridRecord.Values[colSos.Index] = 4 then // неоплата - красный
    ACanvas.Brush.Color := RGB(255, 174, 174);
  if AViewInfo.GridRecord.Values[colSos.Index] = 5 then // невыход - серый
    ACanvas.Brush.Color := clSilver;
  if AViewInfo.GridRecord.Values[colSos.Index] = 6 then // оплата за выход - фиолетовый
    ACanvas.Brush.Color := RGB(251, 172, 249);
  if AViewInfo.GridRecord.Values[colSos.Index] = 8 then // обрабатывается  - синий
    ACanvas.Brush.Color := RGB(145, 166, 238);
  if (AViewInfo.GridRecord.Values[colSos.Index] = 9) and (AViewInfo.GridRecord.Values[colSos2.Index] = 0) then // предварительный -- оранжевый
    ACanvas.Brush.Color := RGB(255, 209, 164);
  if (AViewInfo.GridRecord.Values[colSos.Index] = 9) and (AViewInfo.GridRecord.Values[colSos2.Index] = 1) then // новый -- зелёный
    ACanvas.Brush.Color := RGB(174, 253, 170);

  if (AViewInfo.GridRecord.Values[colIsStop.Index] = 1) or (AViewInfo.GridRecord.Values[colIsStop.Index] = 2) then // остановлен - желтый
    ACanvas.Brush.Color:=RGB(255, 255, 102);

  if (AViewInfo.Selected) or (AViewInfo.Focused) then
    begin
      ARec := AViewInfo.RecordViewInfo.Bounds;
      icolor := ACanvas.Brush.Color;
      ACanvas.Brush.Color := clBlue;
      ACanvas.FrameRect(ARec, clMaroon, 4, [bLeft..bBottom], True);
      ACanvas.Brush.Color := icolor;
      ACanvas.Pen.Color := icolor;
      AViewInfo.Borders := [];
      ACanvas.Font.Color := clBlack;
    end;
end;

procedure TfrmMain.tvJournalGetCellHeight(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);
begin
//  AHeight := intHRow; // !!! нужна ли настройка в таком случае - не нужна - проверить и доделать убрать настройку
end;

procedure TfrmMain.tvJournalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 34 then // page up
    key := 0;
  if key = 33 then // page down
    key := 0;
  if key = 145 then
    key := 0;
  if Key = 73 then // информация - I
    aInfoExecute(nil);
  if key = VK_CONTROL then // поиск - CTRL
    begin
      key := 0;
      aFindExecute(nil);
    end;
  if key = VK_SHIFT then // по факту - SHIFT
    begin
      aSetFactSumExecute(nil);
    end;
  if key = VK_MENU then // километраж - ALT
    begin
      key := 0;
      aKMExecute(nil);
    end;
  if key = VK_BACK then // Удаляем цифры в поле ввода - BACKSPACE
    begin
      teVvod.Text := copy(teVvod.Text, 1, Length(teVvod.Text)-1);
    end;
  if key = VK_ESCAPE then // Если открыта форма действий - скрывать её
    begin
      if Assigned(frmActions) then
        frmActions.Close;
    end;
  if Key = VK_RETURN then // Enter - Выбор действия с водителем
    begin
      aActionsExecute(nil);
    end;
end;

procedure TfrmMain.tvJournalKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '1' then
    begin
      if not tmKeys.Enabled then
        teVvod.Text := '';

      tmKeys.Enabled := False;
      tmKeys.Enabled := True;

      teVvod.Text := teVvod.Text + '1';
    end;
  if Key = '2' then
    begin
      if not tmKeys.Enabled then
        teVvod.Text := '';

      tmKeys.Enabled := False;
      tmKeys.Enabled := True;
      teVvod.Text := teVvod.Text + '2';
    end;
  if Key = '3' then
    begin
      if not tmKeys.Enabled then
        teVvod.Text := '';

      tmKeys.Enabled := False;
      tmKeys.Enabled := True;
      teVvod.Text := teVvod.Text + '3';
    end;
  if Key = '4' then
    begin
      if not tmKeys.Enabled then
        teVvod.Text := '';

      tmKeys.Enabled := False;
      tmKeys.Enabled := True;
      teVvod.Text := teVvod.Text + '4';
    end;
  if Key = '5' then
    begin
      if not tmKeys.Enabled then
        teVvod.Text := '';

      tmKeys.Enabled := False;
      tmKeys.Enabled := True;
      teVvod.Text := teVvod.Text + '5';
    end;
  if Key = '6' then
    begin
      if not tmKeys.Enabled then
        teVvod.Text := '';

      tmKeys.Enabled := False;
      tmKeys.Enabled := True;
      teVvod.Text := teVvod.Text + '6';
    end;
  if Key = '7' then
    begin
      if not tmKeys.Enabled then
        teVvod.Text := '';

      tmKeys.Enabled := False;
      tmKeys.Enabled := True;
      teVvod.Text := teVvod.Text + '7';
    end;
  if Key = '8' then
    begin
      if not tmKeys.Enabled then
        teVvod.Text := '';

      tmKeys.Enabled := False;
      tmKeys.Enabled := True;
      teVvod.Text := teVvod.Text + '8';
    end;
  if Key = '9' then
    begin
      if not tmKeys.Enabled then
        teVvod.Text := '';

      tmKeys.Enabled := False;
      tmKeys.Enabled := True;
      teVvod.Text := teVvod.Text + '9';
    end;
  if Key = '0' then
    begin
      if not tmKeys.Enabled then
        teVvod.Text := '';

      tmKeys.Enabled := False;
      tmKeys.Enabled := True;
      teVvod.Text := teVvod.Text + '0';
    end;
end;

procedure TfrmMain.tvLastCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  odsJur.AfterScroll := nil;
  odsJur.Locate('fk_id', memDataLast.FieldByName('JurID').AsInteger, []);
  odsJur.AfterScroll := odsJurAfterScroll;
  odsJurAfterScroll(nil);
end;

procedure TfrmMain.tWrongTimer(Sender: TObject);
begin
  intTimer := intTimer + 1;
  if intTimer = 5 then
    begin
      intTimer := 0;
      tWrong.Enabled := False;
      exit;
    end;
      if teVvod.Style.Color = clRed then
        teVvod.Style.Color := clWindow
      else
        teVvod.Style.Color := clRed;
end;

procedure TfrmMain.VHIS_MARPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var oq : TOracleQuery;
begin
  try
  if (odsJur.FieldByName('fn_sos').AsInteger <> 1) and (odsJur.FieldByName('fn_sos').AsInteger <> 3) and (odsJur.FieldByName('fn_sos').AsInteger <> 4) and
     (odsJur.FieldByName('fn_sos').AsInteger <> 5) and (odsJur.FieldByName('fn_sos').AsInteger <> 6) then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update taxi.tjournal '+#13+
                       '    set fc_adr1 = :pfc_adr1, fk_adr1id = :pfk_adr1id, '+#13+
                       '        fc_adr2 = :pfc_adr2, fk_adr2id = :pfk_adr2id, '+#13+
                       '        fk_raionid = :pfk_raionid '+#13+
                       '  where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfc_adr1', otString, TVHIS.DataController.Values[TVHIS.DataController.FocusedRecordIndex, VHIS_FROM.Index]);
        oq.DeclareAndSet('pfc_adr2', otString, TVHIS.DataController.Values[TVHIS.DataController.FocusedRecordIndex, VHIS_KUDA.Index]);
        oq.DeclareAndSet('pfk_adr1id', otInteger, odsHis.FieldByName('fk_adr1id').AsInteger);
        oq.DeclareAndSet('pfk_adr2id', otInteger, odsHis.FieldByName('fk_adr2id').AsInteger);
        oq.DeclareAndSet('pfk_raionid', otInteger, odsHis.FieldByName('fk_raionid').AsInteger);
        oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
        oq.Execute;
        odsDetailAdr1.Close;
        odsDetailAdr1.SetVariable('pfk_jurid', odsHis.FieldByName('fk_id').AsInteger);
        odsDetailAdr1.Open;
        oq.DeleteVariables;
        oq.SQL.Text := ' update taxi.tjuradr1 '+#13+
                       '    set fc_adr=:pfc_adr, fc_dop=:pfc_dop, fk_type=:pfk_type, fc_street=:pfc_street, fc_street1=:pfc_street1, '+#13+
                       '        fl_isdownslash=:pfl_isdownslach, fk_idadr1=:pfk_idadr1, fk_idadr2=:pfk_idadr2, fc_house=:pfc_house, '+#13+
                       '        fc_houseliter=:pfc_houseliter, fc_hall=:pfc_hall, fc_adr_place=:pfc_adr_place, fc_housefraction=:pfc_housefraction, '+#13+
                       '        fc_preffix = :pfc_preffix '+#13+
                       '  where fk_jurid = :pfk_id ';
        oq.DeclareAndSet('pfc_adr', otString, odsDetailAdr1.FieldByName('fc_adr').AsString);
        oq.DeclareAndSet('pfc_dop', otString, odsDetailAdr1.FieldByName('fc_dop').AsString);
        oq.DeclareAndSet('pfk_type', otInteger, odsDetailAdr1.FieldByName('fk_type').AsInteger);
        oq.DeclareAndSet('pfc_street', otString, odsDetailAdr1.FieldByName('fc_street').AsString);
        oq.DeclareAndSet('pfc_street1', otString, odsDetailAdr1.FieldByName('fc_street1').AsString);
        oq.DeclareAndSet('pfl_isdownslach', otInteger, odsDetailAdr1.FieldByName('fl_isdownslash').AsInteger);
        oq.DeclareAndSet('pfk_idadr1', otInteger, odsDetailAdr1.FieldByName('fk_idadr1').AsInteger);
        oq.DeclareAndSet('pfk_idadr2', otInteger, odsDetailAdr1.FieldByName('fk_idadr2').AsInteger);
        oq.DeclareAndSet('pfc_house', otString, odsDetailAdr1.FieldByName('fc_house').AsString);
        oq.DeclareAndSet('pfc_houseliter', otString, odsDetailAdr1.FieldByName('fc_houseliter').AsString);
        oq.DeclareAndSet('pfc_hall', otString, odsDetailAdr1.FieldByName('fc_hall').AsString);
        oq.DeclareAndSet('pfc_adr_place', otString, odsDetailAdr1.FieldByName('fc_adr_place').AsString);
        oq.DeclareAndSet('pfc_housefraction', otString, odsDetailAdr1.FieldByName('fc_housefraction').AsString);
        oq.DeclareAndSet('pfc_preffix', otString, odsDetailAdr1.FieldByName('fc_preffix').AsString);
        oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
        oq.Execute;
        odsDetailAdr2.Close;
        odsDetailAdr2.SetVariable('pfk_jurid', odsHis.FieldByName('fk_id').AsInteger);
        odsDetailAdr2.Open;
        oq.DeleteVariables;
        oq.SQL.Text := ' update taxi.tjuradr2 '+#13+
                       '    set fc_adr=:pfc_adr, fc_dop=:pfc_dop '+#13+
                       '  where fk_jurid = :pfk_id ';
        oq.DeclareAndSet('pfc_adr', otString, odsDetailAdr2.FieldByName('fc_adr').AsString);
        oq.DeclareAndSet('pfc_dop', otString, odsDetailAdr2.FieldByName('fc_dop').AsString);
        oq.DeclareAndSet('pfk_id', otInteger, odsJur.FieldByName('fk_id').AsInteger);
        oq.Execute;
        os.Commit;
        if odsJur.FieldByName('fd_datef_str').AsString <> '' then
          begin
            DoDriverEvent(odsJur.FieldByName('fk_id').AsInteger,
                          odsJur.FieldByName('fk_drvid').AsInteger,
                          odsJur.FieldByName('fk_drvid2').AsInteger,
                          odsHis.FieldByName('fk_adr2id').AsInteger,
                          'START_CLIENT_MOVE');
          end;
        odsJur.AfterScroll := nil;
        RefreshQuery(odsJur);
        odsJur.AfterScroll := odsJurAfterScroll;
      finally
        oq.Free;
      end;
    end;
  finally
    VJOURNAL_DATEIN.Focused := True;
    grJournal.SetFocus;
  end;
end;

procedure TfrmMain.VJOURNAL_DOZVONPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
//  showmessage('1');
end;

procedure TfrmMain.VJOURNAL_EDITFICSPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if odsJur.FieldByName('fk_drvid').AsInteger = 0 then
    begin
      beep;
      DoShowRemark('Нельзя изменить фиксацию! Не выбрана машина!', stError);
      exit;
    end;
  if odsJur.FieldByName('fn_sos').AsInteger = 1 then
    begin
      beep;
      DoShowRemark('Нельзя изменить фиксацию! Заказ уже рассчитан!', stError);
      exit;
    end;
  if odsJur.FieldByName('fd_datef_chr').AsString = '' then
    begin
      beep;
      DoShowRemark('Нельзя изменить фиксацию! Заказ еще незафиксирован!', stError);
      exit;
    end;

  if (odsJur.FieldByName('fk_drvid').AsInteger <> 0) and (odsJur.FieldByName('fn_sos').AsInteger <> 1) then
    begin
      if Assigned(frmFics) then
        begin
          frmFics.Show;
        end else
        begin
          Application.CreateForm(TfrmFics, frmFics);
          frmFics.teTime.Properties.OnChange := nil;
          frmFics.teTime.Time := odsJur.FieldByName('fd_datef').AsDateTime;
          frmFics.teTime.Properties.OnChange := frmFics.teTimePropertiesChange;
          frmFics.DoShowForm(odsJur.FieldByName('fk_id').AsInteger);
          frmFics.Show;
        end;
    end;
end;

procedure TfrmMain.VJOURNAL_SETADR1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  aAdr1Execute(nil);
end;

procedure TfrmMain.VJOURNAL_SETADR2PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  aAdr2Execute(nil);
end;

procedure TfrmMain.VJOURNAL_SETDRVPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  aSetDrvExecute(nil);
end;

procedure TfrmMain.vJournal_SetFPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  aSetFicsExecute(nil);
end;

procedure TfrmMain.VJOURNAL_SETNUMTELPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then  // вбиваем номер от руки
    begin
      if Assigned(frmSetPhone) then
        begin
          frmSetPhone.Caption := 'Номер телефона';
          frmSetPhone.Show;
        end else
        begin
          Application.CreateForm(TfrmSetPhone, frmSetPhone);
          frmSetPhone.Caption := 'Номер телефона';
          frmSetPhone.meVvod.Text := odsJur.FieldByName('fc_phone').AsString;
          frmSetPhone.DoShowForm(odsJur.FieldByName('fk_id').AsInteger);
          frmSetPhone.Show;
        end;
    end;
  if AButtonIndex = 1 then // делаем звонок абоненту
    begin
      aCallClientExecute(nil);
    end;
end;

procedure TfrmMain.VJOURNAL_SETSUMPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  DoSetRaschetByRow(0);                                
end;

function TfrmMain.WinExecAndWait(Path: PChar; Visibility: Word): Word; // нужна для отправки смс
var InstanceID: THandle;
begin
  InstanceID := WinExec(Path, Visibility);
  if InstanceID < 32 then { значение меньше чем 32 указывает на ошибку }
    WinExecAndWait := InstanceID;
  WinExecAndWait := 0;
end;

end.
