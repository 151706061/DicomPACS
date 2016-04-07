unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxTextEdit, Menus, ActnList, dxBar, cxClasses, ImgList,
  Oracle, OracleData, cxGraphics, DB, cxGroupBox, cxTimeEdit, JclFileUtils,
  SMMainAPI, ComCtrls, cxTreeView, dxSkinsdxBarPainter, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxPC, cxStyles, cxDBLookupComboBox,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxCheckBox,
  ExtCtrls, cxGridCustomView, cxGrid, JvDBUtils, cxEdit, cxButtonEdit,
  cxContainer, cxVGrid, cxInplaceContainer, cxLabel, cxBarEditItem, cxGridExportLink,
  cxSplitter, StdCtrls, Medotrade, cxConstantsRus, dxBarCustomize_Rus;

type
    TfrmMain = class(TForm)
    cxPage: TcxPageControl;
    dxBM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    actlstMain: TActionList;
    ilMain: TImageList;
    dxBMBar1: TdxBar;
    bbClose: TdxBarButton;
    actClose: TAction;
    osMain: TOracleSession;
    odsTarget: TOracleDataSet;
    dsTarget: TDataSource;
    odsUrgent: TOracleDataSet;
    dsUrgent: TDataSource;
    odsVidOplat: TOracleDataSet;
    dsVidOplat: TDataSource;
    odsRegPrin: TOracleDataSet;
    dsRegPrin: TDataSource;
    odsPriem: TOracleDataSet;
    dsPriem: TDataSource;
    odsApparat: TOracleDataSet;
    dsApparat: TDataSource;
    dxBMBar2: TdxBar;
    bbAddReanim: TdxBarButton;
    bbDelReanim: TdxBarButton;
    actAddReanim: TAction;
    actDelReanim: TAction;
    dsReanim: TDataSource;
    odsReanim: TOracleDataSet;
    odsCompDog: TOracleDataSet;
    dsCompDog: TDataSource;
    odsPeriod: TOracleDataSet;
    dsPeriod: TDataSource;
    dxBMBar4: TdxBar;
    bbAddPeriod: TdxBarButton;
    bbEditPeriod: TdxBarButton;
    bbDelPeriod: TdxBarButton;
    bbRefresh: TdxBarButton;
    aAddPeriod: TAction;
    aEditPeriod: TAction;
    aDelPeriod: TAction;
    aRefreshPeriod: TAction;
    odsPeriodSpisok: TOracleDataSet;
    dsPeriodSpisok: TDataSource;
    dxBMBar5: TdxBar;
    bbAddAccess: TdxBarButton;
    bbDelAccess: TdxBarButton;
    aAddAccess: TAction;
    aDelAccess: TAction;
    dsAccess: TDataSource;
    odsAccess: TOracleDataSet;
    tvTree: TcxTreeView;
    cx: TcxTabSheet;
    cxDefault: TcxTabSheet;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    dxBarDockControl2: TdxBarDockControl;
    cxGrReanim: TcxGrid;
    TV: TcxGridDBTableView;
    VNAME: TcxGridDBColumn;
    cxGrReanimLevel1: TcxGridLevel;
    cxTabSheet4: TcxTabSheet;
    cxAccess: TcxTabSheet;
    dxBarDockControl5: TdxBarDockControl;
    cxGrid2: TcxGrid;
    TVACCESS: TcxGridDBTableView;
    VFIO: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxDicom: TcxTabSheet;
    VerGrMain: TcxVerticalGrid;
    catMain: TcxCategoryRow;
    rowBoss: TcxEditorRow;
    rowZav: TcxEditorRow;
    rowOtdel: TcxEditorRow;
    rowPhone: TcxEditorRow;
    catDop: TcxCategoryRow;
    rowNew: TcxEditorRow;
    catProtocol: TcxCategoryRow;
    rowKolvoDays: TcxEditorRow;
    rowNumProtocol: TcxEditorRow;
    rowAgreePac: TcxEditorRow;
    rowBlockLab: TcxEditorRow;
    rowAmbTalon: TcxEditorRow;
    vGrFlu: TcxVerticalGrid;
    catFlu: TcxCategoryRow;
    rowDoobsl: TcxEditorRow;
    rowPat: TcxEditorRow;
    rowBrak: TcxEditorRow;
    rowPnevmo: TcxEditorRow;
    rowNorma: TcxEditorRow;
    vGrDefaults: TcxVerticalGrid;
    catNapravDef: TcxCategoryRow;
    rowTarget: TcxEditorRow;
    rowUrgent: TcxEditorRow;
    rowVidOplat: TcxEditorRow;
    rowProj: TcxEditorRow;
    rowCompanyDog: TcxEditorRow;
    rowNumDisk: TcxEditorRow;
    catFluDef: TcxCategoryRow;
    rowVidPriem: TcxEditorRow;
    rowApparat: TcxEditorRow;
    rowTargetFlu: TcxEditorRow;
    rowVidOplFlu: TcxEditorRow;
    rowPeriod: TcxEditorRow;
    dxBarDockControl3: TdxBarDockControl;
    cxGrid1: TcxGrid;
    TVPERIOD: TcxGridDBTableView;
    TVPERIODNAME: TcxGridDBColumn;
    TVPERIODKOLVO: TcxGridDBColumn;
    TVPERIODMONTHS: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    rowPrPat: TcxEditorRow;
    rowDozapol: TcxEditorRow;
    rowShowDolgTalon: TcxEditorRow;
    rowKonsult: TcxEditorRow;
    rowEng: TcxEditorRow;
    cxKabs: TcxTabSheet;
    grMRTKabs: TcxGrid;
    tvMRTKabs: TcxGridDBTableView;
    tvMRTKabs_Name: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    dxBarDockControl4: TdxBarDockControl;
    dxBMBar3: TdxBar;
    cxBarEditItem1: TcxBarEditItem;
    bbAddMrt: TdxBarButton;
    bbDelMrt: TdxBarButton;
    aAddMrt: TAction;
    aDelMrt: TAction;
    odsMrtkabs: TOracleDataSet;
    dsMrtKabs: TDataSource;
    dxBarDockControl6: TdxBarDockControl;
    dxBMBar6: TdxBar;
    cxBarEditItem2: TcxBarEditItem;
    bbAddFlu: TdxBarButton;
    bbDelFlu: TdxBarButton;
    grFluKabs: TcxGrid;
    tvFluKabs: TcxGridDBTableView;
    TV_NAME: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    aAddFlu: TAction;
    aDelFlu: TAction;
    odsFluKabs: TOracleDataSet;
    dsFluKabs: TDataSource;
    rowShowWork: TcxEditorRow;
    Panel1: TPanel;
    dxBarDockControl7: TdxBarDockControl;
    dxBMBar7: TdxBar;
    bbAddMetod: TdxBarButton;
    bbDelMetod: TdxBarButton;
    grMetods: TcxGrid;
    TVMETODS: TcxGridDBTableView;
    TVMETODS_NAME: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    aAddMet: TAction;
    aDelMet: TAction;
    cxBarEditItem3: TcxBarEditItem;
    stRep: TcxStyleRepository;
    stBold: TcxStyle;
    odsMetods: TOracleDataSet;
    dsMetods: TDataSource;
    bbLiter: TdxBarButton;
    aSetLiter: TAction;
    TV_LITER: TcxGridDBColumn;
    rowShowAdd: TcxEditorRow;
    rowMk: TcxEditorRow;
    rowVidSnimok: TcxEditorRow;
    odsVidSnimok: TOracleDataSet;
    dsVidSnimok: TDataSource;
    catAmbTalon: TcxCategoryRow;
    rowRes: TcxEditorRow;
    rowDopIshod: TcxEditorRow;
    odsDopIshod: TOracleDataSet;
    dsDopIshod: TDataSource;
    odsRes: TOracleDataSet;
    dsRes: TDataSource;
    dxBMBar8: TdxBar;
    bbAddAp: TdxBarButton;
    bbEditAp: TdxBarButton;
    bbDelAp: TdxBarButton;
    bbRefreshAp: TdxBarButton;
    aAddAp: TAction;
    aEditAp: TAction;
    aDelAp: TAction;
    aRefreshAp: TAction;
    odsAp: TOracleDataSet;
    dsAp: TDataSource;
    aXLS: TAction;
    sdPopUp: TSaveDialog;
    bbExcel: TdxBarButton;
    pmtvAp: TPopupMenu;
    N2: TMenuItem;
    dxBMBar9: TdxBar;
    bbAddModal: TdxBarButton;
    bbEditModal: TdxBarButton;
    bbDelModal: TdxBarButton;
    bbRefModal: TdxBarButton;
    aAddModal: TAction;
    aEditModal: TAction;
    aDelModal: TAction;
    aRefModal: TAction;
    dsModal: TDataSource;
    odsModal: TOracleDataSet;
    cxApModal: TcxTabSheet;
    pcDicom: TcxPageControl;
    tsApparats: TcxTabSheet;
    paApparats: TPanel;
    dxBarDockControl8: TdxBarDockControl;
    grAp: TcxGrid;
    tvAp: TcxGridDBTableView;
    tvApName: TcxGridDBColumn;
    tvApAE: TcxGridDBColumn;
    tvApIP: TcxGridDBColumn;
    tvApKab: TcxGridDBColumn;
    grApLevel1: TcxGridLevel;
    tsModality: TcxTabSheet;
    Panel2: TPanel;
    dxBarDockControl9: TdxBarDockControl;
    grModal: TcxGrid;
    tvModal: TcxGridDBTableView;
    tvModalName: TcxGridDBColumn;
    cxGridLevel6: TcxGridLevel;
    rowShowAgree: TcxEditorRow;
    tsKontrast: TcxTabSheet;
    dxBMBar10: TdxBar;
    dxBarDockControl10: TdxBarDockControl;
    bbAddMK: TdxBarButton;
    bbDelMK: TdxBarButton;
    bbRefMK: TdxBarButton;
    aAddMK: TAction;
    aDelMK: TAction;
    aRefMK: TAction;
    tvListMK: TcxGridDBTableView;
    grListMKLevel1: TcxGridLevel;
    grListMK: TcxGrid;
    dsListMK: TDataSource;
    odsListMK: TOracleDataSet;
    tvListMKName: TcxGridDBColumn;
    tvListMKID: TcxGridDBColumn;
    rowAddTalonInfo: TcxEditorRow;
    rowShowHand: TcxEditorRow;
    rowSumDoza: TcxEditorRow;
    rowEditTime: TcxEditorRow;
    rowKolvoRaspred: TcxEditorRow;
    pcDicom1: TcxPageControl;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;
    vGrDicom: TcxVerticalGrid;
    catDicom: TcxCategoryRow;
    rowPort: TcxEditorRow;
    rowIP: TcxEditorRow;
    rowCalled: TcxEditorRow;
    catInteg: TcxCategoryRow;
    rowLookInside: TcxEditorRow;
    rowPortWeb: TcxEditorRow;
    catArch: TcxCategoryRow;
    rowPortLookInside: TcxEditorRow;
    rowIPLookInside: TcxEditorRow;
    rowAETitleServer: TcxEditorRow;
    rowLoginLookInside: TcxEditorRow;
    rowPasswordLookInside: TcxEditorRow;
    catWLM: TcxCategoryRow;
    rowPortSend: TcxEditorRow;
    rowPortRec: TcxEditorRow;
    rowIPHL7: TcxEditorRow;
    vGrWL: TcxVerticalGrid;
    catWL: TcxCategoryRow;
    rowPortWL: TcxEditorRow;
    rowIPWL: TcxEditorRow;
    rowWLInUse: TcxEditorRow;
    cxTabSheet6: TcxTabSheet;
    dxBarDockControl11: TdxBarDockControl;
    dxBMBar11: TdxBar;
    bbAddBody: TdxBarButton;
    bbEditBody: TdxBarButton;
    tvBodyParts: TcxGridDBTableView;
    grBodyPartsLevel1: TcxGridLevel;
    grBodyParts: TcxGrid;
    tvBodyName: TcxGridDBColumn;
    tvBodyPartsNameEng: TcxGridDBColumn;
    bbDelBody: TdxBarButton;
    bbRefreshBody: TdxBarButton;
    aAddBody: TAction;
    aEditBody: TAction;
    aDelBody: TAction;
    aRefreshBody: TAction;
    odsBodyParts: TOracleDataSet;
    dsBodyParts: TDataSource;
    aExcelBody: TAction;
    bbExportBody: TdxBarButton;
    rowCMOVE: TcxEditorRow;
    catDopDicom: TcxCategoryRow;
    rowLocalPort: TcxEditorRow;
    rowShow3D: TcxEditorRow;
    tsProtocol: TcxTabSheet;
    cxVerticalGrid1: TcxVerticalGrid;
    cxCategoryRow4: TcxCategoryRow;
    rowShowPass: TcxEditorRow;
    rowShowSnimki: TcxEditorRow;
    rowShowDs: TcxEditorRow;
    rowShowRecom: TcxEditorRow;
    rowPod: TcxEditorRow;
    RowMoreMet: TcxEditorRow;
    rowShowSpeed: TcxEditorRow;
    rowShowPrint: TcxEditorRow;
    rowSpell: TcxEditorRow;
    rowShowInsPic: TcxEditorRow;
    rowPF: TcxEditorRow;
    Panel3: TPanel;
    dxBarDockControl12: TdxBarDockControl;
    dxBMBar12: TdxBar;
    tvEdit: TcxGridDBTableView;
    grEditLevel1: TcxGridLevel;
    grEdit: TcxGrid;
    cxBarEditItem4: TcxBarEditItem;
    bbAddEdit: TdxBarButton;
    bbEditEdit: TdxBarButton;
    aAddEdit: TAction;
    aDelEdit: TAction;
    aEditEdit: TAction;
    bbDelEdit: TdxBarButton;
    bbRefEdit: TdxBarButton;
    aRefEdit: TAction;
    dsEdit: TDataSource;
    odsEdit: TOracleDataSet;
    tvEditOtdel: TcxGridDBColumn;
    tvEditDays: TcxGridDBColumn;
    rowPlace: TcxEditorRow;
    rowTargetTalon: TcxEditorRow;
    rowStandart: TcxEditorRow;
    rowTypeVid: TcxEditorRow;
    odsPlace: TOracleDataSet;
    dsPlace: TDataSource;
    odsTargetTalon: TOracleDataSet;
    dsTargetTalon: TDataSource;
    odsStandartMP: TOracleDataSet;
    dsStandarMP: TDataSource;
    odsTypeVMU: TOracleDataSet;
    dsTypeVMU: TDataSource;
    cxMetodsModality: TcxTabSheet;
    Panel4: TPanel;
    cxSplitter1: TcxSplitter;
    Panel5: TPanel;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGrid4DBTableView1: TcxGridDBTableView;
    cxGrid4Level1: TcxGridLevel;
    cxGrid4: TcxGrid;
    oraTSMINI_GROUP: TOracleDataSet;
    dsTSMINI_GROUP: TDataSource;
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
    VGROUPNAME: TcxGridDBColumn;
    cxGrid4DBTableView1FC_NAME: TcxGridDBColumn;
    Panel6: TPanel;
    Label1: TLabel;
    edMOD: TEdit;
    Button1: TButton;
    cxGrid4DBTableView1FC_MOD_NAME: TcxGridDBColumn;
    grCitoExtra: TcxGrid;
    grdbtvCitoExtra: TcxGridDBTableView;
    grlCitoExtra: TcxGridLevel;
    bdcCitoExtra: TdxBarDockControl;
    brCitoExtra: TdxBar;
    cxBarEditItem5: TcxBarEditItem;
    bbAddOtdelCito: TdxBarButton;
    bbDelOtdelCito: TdxBarButton;
    aAddOtdelCito: TAction;
    aDelOtdelCito: TAction;
    odsOtdelInCito: TOracleDataSet;
    dsOtdelInCito: TDataSource;
    grdbtvCitoExtraFK_ID: TcxGridDBColumn;
    grdbtvCitoExtraFC_NAME: TcxGridDBColumn;
    grdbtvCitoExtraFC_SHORT: TcxGridDBColumn;
    cxSplitter2: TcxSplitter;
    procedure actCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actAddReanimExecute(Sender: TObject);
    procedure actDelReanimExecute(Sender: TObject);
    procedure aAddPeriodExecute(Sender: TObject);
    procedure aEditPeriodExecute(Sender: TObject);
    procedure aDelPeriodExecute(Sender: TObject);
    procedure aRefreshPeriodExecute(Sender: TObject);
    procedure aAddAccessExecute(Sender: TObject);
    procedure aDelAccessExecute(Sender: TObject);
    procedure cxPageChange(Sender: TObject);
    procedure osMainAfterLogOn(Sender: TOracleSession);
    procedure FormCreate(Sender: TObject);
    procedure tvTreeChange(Sender: TObject; Node: TTreeNode);
    procedure rowBossEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowZavEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowOtdelEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowPhoneEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowPhoneEditPropertiesChange(Sender: TObject);
    procedure VerGrMainKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rowKolvoDaysEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowKolvoDaysEditPropertiesChange(Sender: TObject);
    procedure rowNumProtocolEditPropertiesChange(Sender: TObject);
    procedure rowAgreePacEditPropertiesChange(Sender: TObject);
    procedure rowBlockLabEditPropertiesChange(Sender: TObject);
    procedure rowAmbTalonEditPropertiesChange(Sender: TObject);
    procedure rowShowPassEditPropertiesChange(Sender: TObject);
    procedure rowShowSnimkiEditPropertiesChange(Sender: TObject);
    procedure rowNewEditPropertiesChange(Sender: TObject);
    procedure rowShowRecomEditPropertiesChange(Sender: TObject);
    procedure rowShowDsEditPropertiesChange(Sender: TObject);
    procedure rowCompanyDogEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowTargetEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowUrgentEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowVidOplatEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowProjEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowTargetFluEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowVidOplFluEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowVidPriemEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowApparatEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowPeriodEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowNumDiskEditPropertiesChange(Sender: TObject);
    procedure rowNumDiskEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowPortEditPropertiesChange(Sender: TObject);
    procedure rowIPEditPropertiesChange(Sender: TObject);
    procedure rowPortEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowIPEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure vGrDicomKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rowDoobslEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowPatEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowBrakEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowPnevmoEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowNormaEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowCalledEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowCalledEditPropertiesChange(Sender: TObject);
    procedure rowPodEditPropertiesChange(Sender: TObject);
    procedure RowMoreMetEditPropertiesChange(Sender: TObject);
    procedure rowPrPatEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowShowPrintEditPropertiesChange(Sender: TObject);
    procedure rowDozapolEditPropertiesChange(Sender: TObject);
    procedure rowShowDolgTalonEditPropertiesChange(Sender: TObject);
    procedure rowKonsultEditPropertiesChange(Sender: TObject);
    procedure rowEngEditPropertiesChange(Sender: TObject);
    procedure aAddMrtExecute(Sender: TObject);
    procedure aDelMrtExecute(Sender: TObject);
    procedure aAddFluExecute(Sender: TObject);
    procedure aDelFluExecute(Sender: TObject);
    procedure rowShowWorkEditPropertiesChange(Sender: TObject);
    procedure aAddMetExecute(Sender: TObject);
    procedure aDelMetExecute(Sender: TObject);
    procedure aSetLiterExecute(Sender: TObject);
    procedure odsFluKabsAfterOpen(DataSet: TDataSet);
    procedure rowShowAddEditPropertiesChange(Sender: TObject);
    procedure rowMkEditPropertiesChange(Sender: TObject);
    procedure rowVidSnimokEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowResEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowDopIshodEditPropertiesEditValueChanged(Sender: TObject);
    procedure aRefreshApExecute(Sender: TObject);
    procedure aDelApExecute(Sender: TObject);
    procedure aAddApExecute(Sender: TObject);
    procedure aEditApExecute(Sender: TObject);
    procedure rowLookInsideEditPropertiesChange(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure aRefModalExecute(Sender: TObject);
    procedure aDelModalExecute(Sender: TObject);
    procedure aAddModalExecute(Sender: TObject);
    procedure aEditModalExecute(Sender: TObject);
    procedure rowPortLookInsideEditPropertiesChange(Sender: TObject);
    procedure rowIPLookInsideEditPropertiesChange(Sender: TObject);
    procedure rowLoginLookInsideEditPropertiesChange(Sender: TObject);
    procedure rowPasswordLookInsideEditPropertiesChange(Sender: TObject);
    procedure rowPortLookInsideEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowIPLookInsideEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowLoginLookInsideEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowPasswordLookInsideEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowPortWebEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowPortWebEditPropertiesChange(Sender: TObject);
    procedure rowAETitleServerEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowAETitleServerEditPropertiesChange(Sender: TObject);
    procedure rowPortSendEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowPortRecEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowPortSendEditPropertiesChange(Sender: TObject);
    procedure rowPortRecEditPropertiesChange(Sender: TObject);
    procedure rowIPHL7EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowIPHL7EditPropertiesChange(Sender: TObject);
    procedure rowShowAgreeEditPropertiesChange(Sender: TObject);
    procedure rowSpellEditPropertiesChange(Sender: TObject);
    procedure rowShowSpeedEditPropertiesChange(Sender: TObject);
    procedure aAddMKExecute(Sender: TObject);
    procedure aDelMKExecute(Sender: TObject);
    procedure aRefMKExecute(Sender: TObject);
    procedure odsListMKAfterOpen(DataSet: TDataSet);
    procedure rowAddTalonInfoEditPropertiesChange(Sender: TObject);
    procedure rowShowHandEditPropertiesChange(Sender: TObject);
    procedure rowSumDozaEditPropertiesChange(Sender: TObject);
    procedure rowSumDozaEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowEditTimeEditPropertiesChange(Sender: TObject);
    procedure rowKolvoRaspredEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowKolvoRaspredEditPropertiesChange(Sender: TObject);
    procedure rowPortWLEditPropertiesChange(Sender: TObject);
    procedure rowIPWLEditPropertiesChange(Sender: TObject);
    procedure rowPortWLEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowIPWLEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowWLInUseEditPropertiesChange(Sender: TObject);
    procedure aAddBodyExecute(Sender: TObject);
    procedure aEditBodyExecute(Sender: TObject);
    procedure aDelBodyExecute(Sender: TObject);
    procedure aRefreshBodyExecute(Sender: TObject);
    procedure pcDicom1Change(Sender: TObject);
    procedure aExcelBodyExecute(Sender: TObject);
    procedure rowCMOVEEditPropertiesChange(Sender: TObject);
    procedure rowLocalPortEditPropertiesChange(Sender: TObject);
    procedure rowLocalPortEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowShowInsPicEditPropertiesChange(Sender: TObject);
    procedure rowShow3DEditPropertiesChange(Sender: TObject);
    procedure rowPFEditPropertiesChange(Sender: TObject);
    procedure aAddEditExecute(Sender: TObject);
    procedure aDelEditExecute(Sender: TObject);
    procedure aEditEditExecute(Sender: TObject);
    procedure aRefEditExecute(Sender: TObject);
    procedure odsEditAfterOpen(DataSet: TDataSet);
    procedure rowPlaceEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowTargetTalonEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowStandartEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowTypeVidEditPropertiesEditValueChanged(Sender: TObject);
    procedure cxMetodsModalityShow(Sender: TObject);
    procedure oraTSMINI_GROUPAfterScroll(DataSet: TDataSet);
    procedure OracleDataSet1AfterScroll(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure aAddOtdelCitoExecute(Sender: TObject);
    procedure aDelOtdelCitoExecute(Sender: TObject);
    procedure odsOtdelInCitoAfterOpen(DataSet: TDataSet);
  private
    xray_param_use_cito : integer;
    procedure DoSetDicomParameters;
    procedure DoSetProtocolParameters;
    { Private declarations }
  public
    Russian, Latin : HKL;
    pAPPSOTRID : Integer;
    pSOTRID : Integer; // код пользователя (tsotr.fk_id)
    sSOTRFIO : string;
    pOTDELID : Integer; // отделение пользователя (tsotr.fk_otdelid)
    procedure DoShowfrmMain;
    procedure DoSetMainValues;
    procedure DoOpenDefaultDataSets;
    procedure DoSetDoobsledovanValues; 
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses fSetZavOtdel, fSetDoobsl, fSetOtdel, fSetGlavVrach, fAddEditPeriod,
  fSetSotr, fSetKab, fSetMetod, fSetLiter, fAddEditApparat, fAddEditModal,
  fAddMK, fAddEditBodyParts, fAddEditDays, fSetKabinet, udbtableutils;

{$R *.dfm}

{ TfrmMain }

procedure TfrmMain.aAddAccessExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmSetSotr, frmSetSotr);
  frmSetSotr.DoShowForm(pOTDELID);
  frmSetSotr.ShowModal;
  if frmSetSotr.ModalResult = mrOk then
    begin
      oq  := TOracleQuery.Create(nil);
      try
	      oq.Session := osMain;
	      oq.Cursor := crSQLWait;
	      oq.SQL.Text := ' INSERT INTO asu.TSMINI(FC_SECTION, FC_KEY, FC_VALUE) '+#13+
	                     ' VALUES(''XRAY'', :PFC_KEY, :PFC_VALUE) ';
	      oq.DeclareAndSet('PFC_KEY', otString, 'ПРАВА_АДМИНИСТРАТОРА_'+IntToStr(frmSetSotr.odsSotr.FieldByName('FK_ID').AsInteger));
	      oq.DeclareAndSet('PFC_VALUE', otString, IntToStr(frmSetSotr.odsSotr.FieldByName('FK_ID').AsInteger));
	      oq.Execute;
	      osMain.Commit;
	      RefreshQuery(odsAccess);
      finally
      	oq.Free;
      end;
    end;
  frmSetSotr.Free;
end;

procedure TfrmMain.aAddApExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditApparat, frmAddEditApparat);
  try
    frmAddEditApparat.Caption := 'Добавить аппарат';
    frmAddEditApparat.ShowModal;
    if frmAddEditApparat.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := osMain;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into asu.txray_apparats(fc_name, fc_aetitle, fc_ip, fk_kabinet) '+#13+
                         ' values(:pfc_name, :pfc_aetitle, :pfc_ip, :pfk_kabinet) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditApparat.teName.Text);
          oq.DeclareAndSet('pfc_aetitle', otString, frmAddEditApparat.teAE.Text);
          oq.DeclareAndSet('pfc_ip', otString, frmAddEditApparat.teIP.Text);
          oq.DeclareAndSet('pfk_kabinet', otInteger, frmAddEditApparat.beKab.Tag);
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          osMain.Commit;
          RefreshQuery(odsAp);
          odsAp.Locate('fk_id', oq.GetVariable('pfk_id'), []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditApparat.Free;
  end;
end;

procedure TfrmMain.aAddBodyExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditBodyParts, frmAddEditBodyParts);
  try
    frmAddEditBodyParts.Caption := 'Добавить';
    frmAddEditBodyParts.ShowModal;
    if frmAddEditBodyParts.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := osMain;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into asu.tbodyparts(fc_name, fc_name_eng) values(:pfc_name, :pfc_name_eng) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditBodyParts.teName.Text);
          oq.DeclareAndSet('pfc_name_eng', otString, frmAddEditBodyParts.teNameEng.Text);
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          osMain.Commit;
          RefreshQuery(odsBodyParts);
          odsBodyParts.Locate('fk_id', oq.GetVariable('pfk_id'), []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditBodyParts.Free;
  end;
end;

procedure TfrmMain.aAddEditExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditDays, frmAddEditDays);
  try
    frmAddEditDays.Caption := 'Добавление';
    frmAddEditDays.ShowModal;
    if frmAddEditDays.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := osMain;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into asu.tsmini(fc_section, fc_key, fc_value) '+#13+
                         ' values(''XRAY'', :pfc_key, :pfc_value) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_key', otString, 'РЕДАКТИРОВАНИЕ_'+IntToStr(frmAddEditDays.beOtdel.Tag));
          oq.DeclareAndSet('pfc_value', otString, IntToStr(frmAddEditDays.seDays.Value));
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          osMain.Commit;
          RefreshQuery(odsEdit);
          odsEdit.Locate('fk_id', oq.GetVariable('pfk_id'), []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditDays.Free;
  end;
end;

procedure TfrmMain.aAddFluExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmSetKab, frmSetKab);
  try
    frmSetKab.DoShowForm(pSOTRID);
    frmSetKab.ShowModal;
    if frmSetKab.ModalResult = mrOk then
      begin
        oq  := TOracleQuery.Create(nil);
        try
	        oq.Session := osMain;
	        oq.Cursor := crSQLWait;
	        oq.SQL.Text := ' INSERT INTO asu.TSMINI(FC_SECTION, FC_KEY, FC_VALUE) '+#13+
	                       ' VALUES(''XRAY'', :PFC_KEY, :PFC_VALUE) ';
	        oq.DeclareAndSet('PFC_KEY', otString, 'ФЛЮОРО_КАБИНЕТЫ_'+IntToStr(frmSetKab.odsKab.FieldByName('FK_ID').AsInteger));
	        oq.DeclareAndSet('PFC_VALUE', otString, IntToStr(frmSetKab.odsKab.FieldByName('FK_ID').AsInteger));
	        oq.Execute;
	        osMain.Commit;
	        RefreshQuery(odsFluKabs);
        finally
      	  oq.Free;
        end;
      end;
  finally
    frmSetKab.Free;
  end;
end;

procedure TfrmMain.aAddMetExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmSetMetod, frmSetMetod);
  try
    frmSetMetod.ShowModal;
    if frmSetMetod.ModalResult = mrOK then
      begin
        oq  := TOracleQuery.Create(nil);
        try
	        oq.Session := osMain;
	        oq.Cursor := crSQLWait;
	        oq.SQL.Text := ' INSERT INTO asu.TSMINI(FC_SECTION, FC_KEY, FC_VALUE) '+#13+
	                       ' VALUES(''XRAY'', :PFC_KEY, :PFC_VALUE) ';
	        oq.DeclareAndSet('PFC_KEY', otString, 'МЕТОДИКИ_ДЛЯ_ФГ_'+IntToStr(frmSetMetod.odsMetod.FieldByName('FK_ID').AsInteger));
	        oq.DeclareAndSet('PFC_VALUE', otString, IntToStr(frmSetMetod.odsMetod.FieldByName('FK_ID').AsInteger));
	        oq.Execute;
	        osMain.Commit;
	        RefreshQuery(odsMetods);
        finally
      	  oq.Free;
        end;
      end;
  finally
    frmSetMetod.Free;
  end;
end;

procedure TfrmMain.aAddMKExecute(Sender: TObject);
var oq : TOracleQuery;
     i : Integer;
begin
  Application.CreateForm(TfrmAddMK, frmAddMK);
  try
    frmAddMK.ShowModal;
    if frmAddMK.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := osMain;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into asu.tmk(fk_smid) values(:pfk_smid) ';
          for I := 0 to frmAddMK.tvList.DataController.RecordCount - 1 do
            begin
              if frmAddMK.tvList.DataController.Values[i, frmAddMK.tvListCheck.Index] = 1 then
                begin
                  oq.DeclareAndSet('pfk_smid', otInteger, frmAddMK.tvList.DataController.Values[i, frmAddMK.tvListID.Index]);
                  oq.Execute;
                end;
            end;
        finally
          RefreshQuery(odsListMK);
          osMain.Commit;
          oq.Free;
        end;
      end;
  finally
    frmAddMK.Free;
  end;
end;

procedure TfrmMain.aAddModalExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditModal, frmAddEditModal);
  try
    frmAddEditModal.Caption := 'Добавить модальность';
    frmAddEditModal.ShowModal;
    if frmAddEditModal.ModalResult = mrOK then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := osMain;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into asu.tmodality(fc_name) values(:pfc_name) returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditModal.teModal.Text);
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          osMain.Commit;
          RefreshQuery(odsModal);
          odsModal.Locate('fk_id', oq.GetVariable('pfk_id'), []);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditModal.Free;
  end;
end;

procedure TfrmMain.aAddMrtExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmSetKab, frmSetKab);
  try
    frmSetKab.DoShowForm(pSOTRID);
    frmSetKab.ShowModal;
    if frmSetKab.ModalResult = mrOk then
      begin
        oq  := TOracleQuery.Create(nil);
        try
	        oq.Session := osMain;
	        oq.Cursor := crSQLWait;
	        oq.SQL.Text := ' INSERT INTO asu.TSMINI(FC_SECTION, FC_KEY, FC_VALUE) '+#13+
	                       ' VALUES(''XRAY'', :PFC_KEY, :PFC_VALUE) ';
	        oq.DeclareAndSet('PFC_KEY', otString, 'МРТ_КАБИНЕТЫ_'+IntToStr(frmSetKab.odsKab.FieldByName('FK_ID').AsInteger));
	        oq.DeclareAndSet('PFC_VALUE', otString, IntToStr(frmSetKab.odsKab.FieldByName('FK_ID').AsInteger));
	        oq.Execute;
	        osMain.Commit;
	        RefreshQuery(odsMrtkabs);
        finally
      	  oq.Free;
        end;
      end;
  finally
    frmSetKab.Free;
  end;
end;

procedure TfrmMain.aAddOtdelCitoExecute(Sender: TObject);
var
  oq : toraclequery;
  mr , pid : integer;
begin
  application.createform(TfrmSetKabinet, frmSetKabinet);
  frmSetKabinet.odsKab.SQL.text := ' SELECT O.FK_ID, O.FC_NAME, O.FC_SHORT FROM LOGIN.TOTDEL O ' +
                                   ' WHERE O.FK_ID not IN (SELECT FK_OTDELID FROM ASU.TOTDELS_IN_CITO) ' +
                                   ' AND O.FL_DEL = 0 ORDER BY O.FC_NAME ';
  frmSetKabinet.odsKab.close;
  frmSetKabinet.odsKab.open;
  mr := frmSetKabinet.ShowModal;
  if mr = mrok then
   begin
    pid := frmSetKabinet.odsKab.FieldByName('fk_id').asinteger;
    try
      oq := toraclequery.create(nil);
      oq.session := osmain;
      oq.SQL.text := 'insert into asu.totdels_in_cito(fk_otdelid) values(:pid)';
      oq.declareandset('pid',otinteger, pid);
      oq.execute;
      oq.session.commit;
    finally
      oq.free;
    end;
    RefreshQuery(odsOtdelInCito);
   end;
  frmSetKabinet.Free;
end;

procedure TfrmMain.aAddPeriodExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditPeriod, frmAddEditPeriod);
  frmAddEditPeriod.ShowModal;
  if frmAddEditPeriod.ModalResult = mrOk then
    begin
      oq  := TOracleQuery.Create(nil);
      try
	      oq.Session := osMain;
	      oq.Cursor := crSQLWait;
	      oq.SQL.Text := ' INSERT INTO TSMID(FC_NAME, FN_NORM0, FN_NORM1, FK_OWNER) '+
	                     ' VALUES(:PFC_NAME, :PFN_NORM0, :PFN_NORM1, (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_PERIOD_OSMOTROV'')) ';
	      oq.DeclareAndSet('PFC_NAME', otString, frmAddEditPeriod.cxNamePeriod.Text);
	      oq.DeclareAndSet('PFN_NORM0', otInteger, frmAddEditPeriod.cxKolvoDays.Value);
        oq.DeclareAndSet('PFN_NORM1', otInteger, frmAddEditPeriod.cxKolvoMon.Value);
	      oq.Execute;
	      osMain.Commit;
	      RefreshQuery(odsPeriodSpisok);
      finally
      	oq.Free;
      end;
    end;
  frmAddEditPeriod.Free;
end;

procedure TfrmMain.actAddReanimExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmSetOtdel, frmSetOtdel);
  if frmSetOtdel.odsOtdel.Active = False then
    frmSetOtdel.odsOtdel.Open;
  frmSetOtdel.ShowModal;
  if frmSetOtdel.ModalResult = mrOk then
    begin
      oq  := TOracleQuery.Create(nil);
      try
	      oq.Session := osMain;
	      oq.Cursor := crSQLWait;
	      oq.SQL.Text := ' INSERT INTO TSMINI(FC_SECTION, FC_KEY, FC_VALUE) '+
	                     ' VALUES(''XRAY'', :PFC_KEY, :PFC_VALUE) ';
	      oq.DeclareAndSet('PFC_KEY', otString, 'РЕАНИМАЦИОННОЕ_ОТДЕЛЕНИЕ_'+IntToStr(frmSetOtdel.odsOtdel.FieldByName('FK_ID').AsInteger));
	      oq.DeclareAndSet('PFC_VALUE', otString, IntToStr(frmSetOtdel.odsOtdel.FieldByName('FK_ID').AsInteger));
	      oq.Execute;
	      osMain.Commit;
	      RefreshQuery(odsReanim);
      finally
      	oq.Free;
      end;
    end;
  frmSetOtdel.Free;
end;

procedure TfrmMain.actCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.actDelReanimExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if Application.MessageBox('Удаление из списка одного из отделений реанимационного профиля может привести к некорректной работе программы!'+#13+
                            'Вы действительно хотите удалить из списка отделение?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
	      oq.Session := osMain;
      	oq.Cursor := crSQLWait;
	      oq.SQL.Text := ' DELETE FROM asu.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = :PFC_KEY AND FC_VALUE = :PFC_VALUE ';
	      oq.DeclareAndSet('PFC_KEY', otString, odsReanim.FieldByName('FC_KEY').AsString);
	      oq.DeclareAndSet('PFC_VALUE', otString, odsReanim.FieldByName('FC_VALUE').AsString);
	      oq.Execute;
	      osMain.Commit;
	      RefreshQuery(odsReanim);
      finally
      	oq.Free;
      end;
    end;
end;

procedure TfrmMain.aDelAccessExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if Application.MessageBox('Вы действительно хотите удалить сотрудника из списка "Администраторы"?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
	      oq.Session := osMain;
      	oq.Cursor := crSQLWait;
	      oq.SQL.Text := ' DELETE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = :PFC_KEY AND FC_VALUE = :PFC_VALUE ';
	      oq.DeclareAndSet('PFC_KEY', otString, odsAccess.FieldByName('FC_KEY').AsString);
	      oq.DeclareAndSet('PFC_VALUE', otString, odsAccess.FieldByName('FC_VALUE').AsString);
	      oq.Execute;
	      osMain.Commit;
	      RefreshQuery(odsAccess);
      finally
      	oq.Free;
      end;
    end;
end;

procedure TfrmMain.aDelApExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Внимание!'+#13+#10+
                'Вы собираетесь удалить из справочника рентгенаппарат. Это может привести к некорректной работе системы!'+#13+#10+
                'Продолжить?', mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := osMain;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.txray_apparats where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsAp.FieldByName('fk_id').AsInteger);
        oq.Execute;
        osMain.Commit;
        RefreshQuery(odsAp);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmMain.aDelBodyExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if MessageDlg('Вы действительно хотите удалить текущую запись?'+#13+#10+
                'Это может привести к некорректной работе программы!'+#13+#10+
                'Продолжить?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := osMain;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tbodyparts where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsBodyParts.FieldByName('fk_id').AsInteger);
        oq.Execute;
        osMain.Commit;
        RefreshQuery(odsBodyParts);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmMain.aDelEditExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if Application.MessageBox('Вы действительно хотите удалить настройку из списка? ', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
	      oq.Session := osMain;
      	oq.Cursor := crSQLWait;
	      oq.SQL.Text := ' delete from asu.tsmini where fk_id = :pfk_id ';
	      oq.DeclareAndSet('pfk_id', otInteger, odsEdit.FieldByName('fk_id').AsInteger);
	      oq.Execute;
	      osMain.Commit;
	      RefreshQuery(odsEdit);
      finally
      	oq.Free;
      end;
    end;
end;

procedure TfrmMain.aDelFluExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if Application.MessageBox('Вы действительно хотите удалить флюоро-кабинет из списка? Это может привести к некорректной работе программы!', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
	      oq.Session := osMain;
      	oq.Cursor := crSQLWait;
	      oq.SQL.Text := ' DELETE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = :PFC_KEY AND FC_VALUE = :PFC_VALUE ';
	      oq.DeclareAndSet('PFC_KEY', otString, odsFluKabs.FieldByName('FC_KEY').AsString);
	      oq.DeclareAndSet('PFC_VALUE', otString, odsFluKabs.FieldByName('FC_VALUE').AsString);
	      oq.Execute;
	      osMain.Commit;
	      RefreshQuery(odsFluKabs);
      finally
      	oq.Free;
      end;
    end;
end;

procedure TfrmMain.aDelMetExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if Application.MessageBox('Вы действительно хотите удалить методику из списка? ', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
	      oq.Session := osMain;
      	oq.Cursor := crSQLWait;
	      oq.SQL.Text := ' DELETE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = :PFC_KEY AND FC_VALUE = :PFC_VALUE ';
	      oq.DeclareAndSet('PFC_KEY', otString, odsMetods.FieldByName('FC_KEY').AsString);
	      oq.DeclareAndSet('PFC_VALUE', otString, odsMetods.FieldByName('FC_VALUE').AsString);
	      oq.Execute;
	      osMain.Commit;
	      RefreshQuery(odsMetods);
      finally
      	oq.Free;
      end;
    end;
end;

procedure TfrmMain.aDelMKExecute(Sender: TObject);
var i : Integer;
    oq : TOracleQuery;
begin
  if MessageDlg('Вы собираетесь удалить выбранные методики.'+#13+#10+'Продолжить?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      for i := 0 to tvListMK.Controller.SelectedRecordCount -1 do
        begin
          if tvListMK.DataController.Controller.SelectedRecords[i].Selected = True then
            begin
              oq := TOracleQuery.Create(nil);
              try
                oq.Session := osMain;
                oq.Cursor := crSQLWait;
                oq.SQL.Text := ' delete from asu.tmk where fk_smid = :pfk_smid ';
                oq.DeclareAndSet('pfk_smid', otInteger, tvListMK.Controller.SelectedRecords[i].Values[tvListMKID.Index]);
                oq.Execute;
              finally
                oq.Free;
              end;
            end;
        end;
      osMain.Commit;
      RefreshQuery(odsListMK);
    end;
end;

procedure TfrmMain.aDelModalExecute(Sender: TObject); // !!! перед удалением проверять есть ли ссылки на эту модальность
var oq : TOracleQuery;
begin
  if MessageDlg('Внимание!'+#13+#10+
                'Вы собираетесь удалить из справочника модальность. Это может привести к некорректной работе системы!'+#13+#10+
                'Продолжить?', mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := osMain;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from asu.tmodality where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsModal.FieldByName('fk_id').AsInteger);
        oq.Execute;
        osMain.Commit;
        RefreshQuery(odsModal);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmMain.aDelMrtExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if Application.MessageBox('Вы действительно хотите удалить кабинет из списка? Это может привести к некорректной работе программы!', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
	      oq.Session := osMain;
      	oq.Cursor := crSQLWait;
	      oq.SQL.Text := ' DELETE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = :PFC_KEY AND FC_VALUE = :PFC_VALUE ';
	      oq.DeclareAndSet('PFC_KEY', otString, odsMrtKabs.FieldByName('FC_KEY').AsString);
	      oq.DeclareAndSet('PFC_VALUE', otString, odsMrtKabs.FieldByName('FC_VALUE').AsString);
	      oq.Execute;
	      osMain.Commit;
	      RefreshQuery(odsMrtKabs);
      finally
      	oq.Free;
      end;
    end;
end;

procedure TfrmMain.aDelOtdelCitoExecute(Sender: TObject);
var
  oq : toraclequery;
  mr , pid : integer;
begin
  pid := odsOtdelInCito.FieldByName('fk_id').asinteger;
  try
    oq := toraclequery.create(nil);
    oq.session := osmain;
    oq.SQL.text := 'delete from asu.totdels_in_cito where fk_otdelid = :pid';
    oq.declareandset('pid',otinteger, pid);
    oq.execute;
    oq.session.commit;
  finally
    oq.free;
  end;
  RefreshQuery(odsOtdelInCito);
end;

procedure TfrmMain.aDelPeriodExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if Application.MessageBox('Удаление из списка одного из видов периодичности прохождения флюорографии может привести к некорректной работе программы!'+#13+
                            'Вы уверены?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := osMain;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' UPDATE TSMID SET FL_DEL = 1 WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('PFK_ID', otInteger, odsPeriodSpisok.FieldByName('FK_ID').AsInteger);
        oq.Execute;
        osMain.Commit;
        RefreshQuery(odsPeriodSpisok);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmMain.aEditApExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditApparat, frmAddEditApparat);
  try
    frmAddEditApparat.Caption := 'Изменить аппарат';
    frmAddEditApparat.teName.Text := odsAp.FieldByName('fc_name').AsString;
    frmAddEditApparat.teAE.Text := odsAp.FieldByName('fc_aetitle').AsString;
    frmAddEditApparat.teIP.Text := odsAp.FieldByName('fc_ip').AsString;
    frmAddEditApparat.beKab.Tag := odsAp.FieldByName('fk_kabinet').AsInteger;
    frmAddEditApparat.beKab.EditValue := odsAp.FieldByName('fc_kab').AsString;
    frmAddEditApparat.ShowModal;
    if frmAddEditApparat.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := osMain;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.txray_apparats '+#13+
                         '    set fc_name = :pfc_name, fc_aetitle = :pfc_aetitle, fc_ip = :pfc_ip, fk_kabinet = :pfk_kabinet '+#13+
                         '  where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditApparat.teName.Text);
          oq.DeclareAndSet('pfc_aetitle', otString, frmAddEditApparat.teAE.Text);
          oq.DeclareAndSet('pfc_ip', otString, frmAddEditApparat.teIP.Text);
          oq.DeclareAndSet('pfk_kabinet', otInteger, frmAddEditApparat.beKab.Tag);
          oq.DeclareAndSet('pfk_id', otInteger, odsAp.FieldByName('fk_id').AsInteger);
          oq.Execute;
          osMain.Commit;
          RefreshQuery(odsAp);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditApparat.Free;
  end;
end;

procedure TfrmMain.aEditBodyExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditBodyParts, frmAddEditBodyParts);
  try
    frmAddEditBodyParts.Caption := 'Изменить';
    frmAddEditBodyParts.teName.Text := odsBodyParts.FieldByName('fc_name').AsString;
    frmAddEditBodyParts.teNameEng.Text := odsBodyParts.FieldByName('fc_name_eng').AsString;
    frmAddEditBodyParts.ShowModal;
    if frmAddEditBodyParts.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := osMain;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.tbodyparts set fc_name = :pfc_name, fc_name_eng = :pfc_name_eng where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditBodyParts.teName.Text);
          oq.DeclareAndSet('pfc_name_eng', otString, frmAddEditBodyParts.teNameEng.Text);
          oq.DeclareAndSet('pfk_id', otInteger, odsBodyParts.FieldByName('fk_id').AsInteger);
          oq.Execute;
          osMain.Commit;
          RefreshQuery(odsBodyParts);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditBodyParts.Free;
  end;
end;

procedure TfrmMain.aEditEditExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditDays, frmAddEditDays);
  try
    frmAddEditDays.Caption := 'Изменение';
    frmAddEditDays.beOtdel.Tag := odsEdit.FieldByName('idOtdel').AsInteger;
    frmAddEditDays.beOtdel.Text := odsEdit.FieldByName('fc_key').AsString;
    frmAddEditDays.seDays.Value := StrToInt(odsEdit.FieldByName('fc_value').AsString);
    frmAddEditDays.ShowModal;
    if frmAddEditDays.ModalResult = mrOk then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := osMain;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.tsmini '+#13+
                         '    set fc_key = :pfc_key, fc_value = :pfc_value '+#13+
                         '  where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_key', otString, 'РЕДАКТИРОВАНИЕ_'+IntToStr(frmAddEditDays.beOtdel.Tag));
          oq.DeclareAndSet('pfc_value', otString, IntToStr(frmAddEditDays.seDays.Value));
          oq.DeclareAndSet('pfk_id', otInteger, odsEdit.FieldByName('fk_id').AsInteger);
          oq.Execute;
          osMain.Commit;
          RefreshQuery(odsEdit);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditDays.Free;
  end;
end;

procedure TfrmMain.aEditModalExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditModal, frmAddEditModal);
  try
    frmAddEditModal.Caption := 'Изменить модальность';
    frmAddEditModal.teModal.Text := odsModal.FieldByName('fc_name').AsString;
    frmAddEditModal.ShowModal;
    if frmAddEditModal.ModalResult = mrOK then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := osMain;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.tmodality set fc_name = :pfc_name where fk_id = :pfk_id ';
          oq.DeclareAndSet('pfc_name', otString, frmAddEditModal.teModal.Text);
          oq.DeclareAndSet('pfk_id', otInteger, odsModal.FieldByName('fk_id').AsInteger);
          oq.Execute;
          osMain.Commit;
          RefreshQuery(odsModal);
        finally
          oq.Free;
        end;
      end;
  finally
    frmAddEditModal.Free;
  end;
end;

procedure TfrmMain.aEditPeriodExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmAddEditPeriod, frmAddEditPeriod);
  frmAddEditPeriod.cxNamePeriod.Text := odsPeriodSpisok.FieldByName('FC_NAME').AsString;
  frmAddEditPeriod.cxKolvoDays.Value := odsPeriodSpisok.FieldByName('FN_NORM0').AsInteger;
  frmAddEditPeriod.cxKolvoMon.Value := odsPeriodSpisok.FieldByName('FN_NORM1').AsInteger;
  frmAddEditPeriod.ShowModal;
  if frmAddEditPeriod.ModalResult = mrOk then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := osMain;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' UPDATE TSMID SET FC_NAME = :PFC_NAME, FN_NORM0 = :PFN_NORM0, FN_NORM1 = :PFN_NORM1 WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('PFC_NAME', otString, frmAddEditPeriod.cxNamePeriod.Text);
        oq.DeclareAndSet('PFN_NORM0', otInteger, frmAddEditPeriod.cxKolvoDays.Value);
        oq.DeclareAndSet('PFN_NORM1', otInteger, frmAddEditPeriod.cxKolvoMon.Value);
        oq.DeclareAndSet('PFK_ID', otInteger, odsPeriodSpisok.FieldByName('FK_ID').AsInteger);
        oq.Execute;
        osMain.Commit;
        RefreshQuery(odsPeriodSpisok);
      finally
        oq.Free;
      end;
    end;
  frmAddEditPeriod.Free;
end;

procedure TfrmMain.aExcelBodyExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if tvBodyParts.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, grBodyParts, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, grBodyParts, TRUE, TRUE);
end;

procedure TfrmMain.aRefEditExecute(Sender: TObject);
begin
  RefreshQuery(odsEdit);
end;

procedure TfrmMain.aRefMKExecute(Sender: TObject);
begin
  RefreshQuery(odsListMK);
end;

procedure TfrmMain.aRefModalExecute(Sender: TObject);
begin
  RefreshQuery(odsModal);
end;

procedure TfrmMain.aRefreshApExecute(Sender: TObject);
begin
  RefreshQuery(odsAp);
end;

procedure TfrmMain.aRefreshBodyExecute(Sender: TObject);
begin
  RefreshQuery(odsBodyParts);
end;

procedure TfrmMain.aRefreshPeriodExecute(Sender: TObject);
begin
  RefreshQuery(odsPeriodSpisok);
end;

procedure TfrmMain.aSetLiterExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  Application.CreateForm(TfrmSetLiter, frmSetLiter);
  try
    frmSetLiter.lbkab.Caption := odsFluKabs.FieldByName('KABNAME').AsString;
    frmSetLiter.lbkab.Tag := StrToInt(odsFluKabs.FieldByName('FC_VALUE').AsString);
    frmSetLiter.teLiter.Text := odsFluKabs.FieldByName('FC_LITER').AsString;
    frmSetLiter.ShowModal;
    if frmSetLiter.ModalResult = mrOk then
      begin
        ods := TOracleDataSet.Create(nil);
        try
          ods.Session := osMain;
          ods.Cursor := crSQLWait;
          ods.SQL.Text := ' merge into asu.tsmini using dual on (fc_section = ''LITER_FOR_FLUKAB''||:pKAB and fc_key = :pKAB) '+#13+
                          '   when matched then '+#13+
                          '     update set fc_value = :pfc_value where fc_section = ''LITER_FOR_FLUKAB''||:pKAB and fc_key = :pKAB '+#13+
                          '   when not matched then '+#13+
                          '     insert(fc_section, fc_key, fc_value) values(''LITER_FOR_FLUKAB''||:pKAB, :pKAB, :pfc_value) ';
          ods.DeclareAndSet('pKAB', otString, IntToStr(frmSetLiter.lbKab.Tag));
          ods.DeclareAndSet('pfc_value', otString, frmSetLiter.teLiter.Text);
          ods.Open;
          osMain.Commit;
          RefreshQuery(odsFluKabs);
        finally
          ods.Free;
        end;
      end;
  finally
    frmSetLiter.Free;
  end;
end;

procedure TfrmMain.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if tvAp.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, grAp, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, grAp, TRUE, TRUE);
end;

procedure TfrmMain.Button1Click(Sender: TObject);
var v_id_mod : Integer; v_ins : Boolean;
begin // сохранить модальность
  if OracleDataSet1.eof then Exit;
  // проверим есть ли такая модальность в списке
  With TOracleQuery.Create(nil) do
  try
    Session := osMain;
    SQL.Text:='select fk_id from asu.tmodality t where fc_name=:p_fc_name';
    DeclareAndSet('p_fc_name',otString,edMOD.Text);
    Execute;
    if EOF then
    begin
      MessageDlg('Модальность отсутствует в справочнике ...', mtWarning, [mbOK], 0);
      v_id_mod:=-1;
    end else
    begin
      v_id_mod:=FieldAsInteger('fk_id');
    end;
  finally
    Free;
  end;
  if v_id_mod=-1 then Exit;  
  // проверим что запись в таблице связке есть
  With TOracleQuery.Create(nil) do
  try
    Session := osMain;
    SQL.Text:='select t2.fk_modality from asu.tsmid_modality t2 '+
              '  where t2.fk_smid=:p_fk_smid';
    DeclareAndSet('p_fk_smid',otInteger,OracleDataSet1.FieldByName('FK_ID').AsInteger);
    Execute;
    v_ins:=EOF;
  finally
    Free;
  end;
  With TOracleQuery.Create(nil) do
  try
    Session := osMain;
    if v_ins then
    begin
      SQL.Text := 'insert into asu.tsmid_modality (fk_smid, fk_modality) values (:p_fk_smid, :p_fk_modality)';
    end else
    begin
      SQL.Text := 'update asu.tsmid_modality set fk_modality=:p_fk_modality where fk_smid=:p_fk_smid';
    end;
    DeclareAndSet('p_fk_smid',otInteger,OracleDataSet1.FieldByName('FK_ID').AsInteger);
    DeclareAndSet('p_fk_modality',otInteger,v_id_mod);
    Execute;
  finally
    Free;
  end;
  OracleDataSet1.Refresh;
end;

{

SQL.Text:='select t1.fc_name from asu.tmodality t1, asu.tsmid_modality t2 '+
              '  where t1.fk_id = t2.fk_modality and t2.fk_modality=:p_fk_modality';
    DeclareAndSet('p_fk_modality',otInteger,v_id_mod);

 }



procedure TfrmMain.cxMetodsModalityShow(Sender: TObject);
begin
  oraTSMINI_GROUP.Open;
end;

procedure TfrmMain.cxPageChange(Sender: TObject);
begin
  if cxPage.ActivePage.Name = 'cxDefault' then
    begin
      DoOpenDefaultDataSets;
    end;
  if cxPage.ActivePage.Name = 'cxAccess' then
    begin
      if odsAccess.Active = False then
        odsAccess.Open;
    end;
  if cxPage.ActivePage.Name = 'cxKabs' then
    begin
      if odsMrtKabs.Active = False then
        odsMrtKabs.Open;
      if odsFluKabs.Active = False then
        odsFluKabs.Open;
      bdcCitoExtra.Visible := xray_param_use_cito = 1;
      brCitoExtra.Visible := xray_param_use_cito = 1;
      grCitoExtra.Visible := xray_param_use_cito = 1;  
      if (odsOtdelInCito.Active = false) and (xray_param_use_cito = 1) then
        odsOtdelInCito.open;
    end;
  if cxPage.ActivePage.Name = 'cxApModal' then
    begin
      if odsAp.Active = False then
        odsAp.Active := True;
      if odsModal.Active = False then
        odsModal.Active := True;
      pcDicom.ActivePageIndex := 0;
    end;
  if cxPage.ActivePage.Name = 'tsKontrast' then
    begin
      if odsListMK.Active = False then
        odsListMK.Active := True;
    end;
  if cxPage.ActivePage.Name = 'tsProtocol' then
    begin
      if odsEdit.Active = False then
        odsEdit.Active := True;
    end;
end;

procedure TfrmMain.DoOpenDefaultDataSets;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    Screen.Cursor := crSQLWait;
    ods.Session := osMain;
//--- Цель для рентгена и для флюорографии
    if odsTarget.Active <> True then
      begin
        rowTarget.Properties.EditProperties.OnEditValueChanged := nil;
        rowTargetFlu.Properties.EditProperties.OnEditValueChanged := nil;
        odsTarget.Open;
	      ods.DeleteVariables;
	      ods.Close;
	      ods.SQL.Text := ' SELECT FK_ID '+#13#10+
                        '   FROM ASU.TSMID '+#13#10+
			                  '  WHERE FK_DEFAULT = 1 '+#13#10+
                        '    AND FL_DEL = 0 '+#13#10+
                        '    AND FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''ISSL_TARGET'') ';
	      ods.Open;
        rowTarget.Properties.Value := ods.FieldByName('FK_ID').AsInteger;
        rowTarget.Properties.EditProperties.OnEditValueChanged := rowTargetEditPropertiesEditValueChanged;
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' SELECT TO_NUMBER(FC_VALUE) AS FK_ID FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DEFAULT_TARGET'' ';
        ods.Open;
        rowTargetFlu.Properties.Value := ods.FieldByName('FK_ID').AsInteger;
        rowTargetFlu.Properties.EditProperties.OnEditValueChanged := rowTargetFluEditPropertiesEditValueChanged;
      end;
//--- Срочность
    if odsUrgent.Active <> True  then
      begin
	      rowUrgent.Properties.EditProperties.OnEditValueChanged := nil;
	      odsUrgent.Open;
        odsUrgent.Locate('fk_default', 1, []);
	      rowUrgent.Properties.Value  := odsUrgent.FieldByName('fk_id').AsInteger; 
        rowUrgent.Properties.EditProperties.OnEditValueChanged := rowUrgentEditPropertiesEditValueChanged;
      end;
//--- Вид оплаты для рентгена и для флюорографии
    if odsVidOplat.Active <> True then
      begin
        rowVidOplat.Properties.EditProperties.OnEditValueChanged := nil;
        rowVidOplFlu.Properties.EditProperties.OnEditValueChanged := nil;
      	odsVidOplat.Open;
      	ods.DeleteVariables;
      	ods.Close;
      	ods.SQL.Text := ' SELECT FK_ID '+#13#10+
                        '   FROM ASU.TSMID '+#13#10+
                   			'  WHERE FK_DEFAULT = 1 '+#13#10+
                        '    AND FL_DEL = 0 '+#13#10+
                        '    AND FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''AMBTALON_OPL'') ';
      	ods.Open;
        rowVidOplat.Properties.Value := ods.FieldByName('FK_ID').AsInteger;
        rowVidOplat.Properties.EditProperties.OnEditValueChanged := rowVidOplatEditPropertiesEditValueChanged;
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' SELECT TO_NUMBER(FC_VALUE) AS FK_ID FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DEFAULT_VID_OPLAT'' ';
        ods.Open;
        rowVidOplFlu.Properties.Value := ods.FieldByName('FK_ID').AsInteger;
        rowVidOplFlu.Properties.EditProperties.OnEditValueChanged := rowVidOplFluEditPropertiesEditValueChanged;
      end;
//--- Проживает постоянно
    if odsRegPrin.Active <> True then
      begin
        rowProj.Properties.EditProperties.OnEditValueChanged := nil;
	      odsRegPrin.Open;
        odsRegPrin.Locate('fk_default', 1, []);
        rowProj.Properties.Value := odsRegPrin.FieldByName('fk_id').AsInteger;
        rowProj.Properties.EditProperties.OnEditValueChanged := rowProjEditPropertiesEditValueChanged;
      end;
//--- Вид приема
    if odsPriem.Active <> True then
      begin
        rowVidPriem.Properties.EditProperties.OnEditValueChanged := nil;
	      odsPriem.Open;
        odsPriem.Locate('fk_default', 1, []);
        rowVidPriem.Properties.Value := odsPriem.FieldByName('fk_id').AsInteger; 
        rowVidPriem.Properties.EditProperties.OnEditValueChanged := rowVidPriemEditPropertiesEditValueChanged;
      end;
//--- Вид снимка
    if odsVidSnimok.Active <> True then
      begin
        rowVidSnimok.Properties.EditProperties.OnEditValueChanged := nil;
	      odsVidSnimok.Open;
        odsVidSnimok.Locate('fk_default', 1, []);
        rowVidSnimok.Properties.Value := odsVidSnimok.FieldByName('fk_id').AsInteger; 
        rowVidSnimok.Properties.EditProperties.OnEditValueChanged := rowVidSnimokEditPropertiesEditValueChanged;
      end;
//--- Аппарат
    if odsApparat.Active <> True then
      begin
        rowApparat.Properties.EditProperties.OnEditValueChanged := nil;
      	odsApparat.Open;
        odsApparat.Locate('fk_default', 1, []);
        rowApparat.Properties.Value := odsApparat.FieldByName('FK_ID').AsInteger;
        rowApparat.Properties.EditProperties.OnEditValueChanged := rowApparatEditPropertiesEditValueChanged;
      end;
//--- Компания по договору
    if odsCompDog.Active <> True then
      begin
        rowCompanyDog.Properties.EditProperties.OnEditValueChanged := nil;
      	odsCompDog.Open;
        odsCompDog.Locate('fk_default', 1, []);
        rowCompanyDog.Properties.Value := odsCompDog.FieldByName('FK_ID').AsInteger;
        rowCompanyDog.Properties.EditProperties.OnEditValueChanged := rowCompanyDogEditPropertiesEditValueChanged;
      end;
//--- Периодичность
    if odsPeriod.Active <> True then
      begin
        rowPeriod.Properties.EditProperties.OnEditValueChanged := nil;
      	odsPeriod.Open;
        odsPeriod.Locate('fk_default', 1, []);
	      rowPeriod.Properties.Value := odsPeriod.FieldByName('FK_ID').AsInteger;
	      rowPeriod.Properties.EditProperties.OnEditValueChanged := rowPeriodEditPropertiesEditValueChanged;
      end;
//--- Результат обращения
    if odsRes.Active <> True then
      begin
        rowRes.Properties.EditProperties.OnEditValueChanged := nil;
      	odsRes.Open;
        odsRes.Locate('fk_default', 1, []);
        rowRes.Properties.Value := odsRes.FieldByName('FK_ID').AsInteger;
	      rowRes.Properties.EditProperties.OnEditValueChanged := rowResEditPropertiesEditValueChanged;
      end;
//--- Дополнительный исход
    if odsDopIshod.Active <> True then
      begin
        rowDopIshod.Properties.EditProperties.OnEditValueChanged := nil;
      	odsDopIshod.Open;
        odsDopIshod.Locate('fk_default', 1, []);
        rowDopIshod.Properties.Value := odsDopIshod.FieldByName('FK_ID').AsInteger;
	      rowDopIshod.Properties.EditProperties.OnEditValueChanged := rowDopIshodEditPropertiesEditValueChanged;
      end;
//--- Место обслуживания
    if odsPlace.Active <> True then
      begin
        rowPlace.Properties.EditProperties.OnEditValueChanged := nil;
      	odsPlace.Open;
        odsPlace.Locate('fk_default', 1, []);
        rowPlace.Properties.Value := odsPlace.FieldByName('FK_ID').AsInteger;
	      rowPlace.Properties.EditProperties.OnEditValueChanged := rowPlaceEditPropertiesEditValueChanged;
      end;
//--- Цель посещения
    if odsTargetTalon.Active <> True then
      begin
        rowTargetTalon.Properties.EditProperties.OnEditValueChanged := nil;
      	odsTargetTalon.Open;
        odsTargetTalon.Locate('fk_default', 1, []);
        rowTargetTalon.Properties.Value := odsTargetTalon.FieldByName('FK_ID').AsInteger;
	      rowTargetTalon.Properties.EditProperties.OnEditValueChanged := rowTargetTalonEditPropertiesEditValueChanged;
      end;
//--- Стандарт мед. помощи
    if odsStandartMP.Active <> True then
      begin
        rowStandart.Properties.EditProperties.OnEditValueChanged := nil;
      	odsStandartMP.Open;
        odsStandartMP.Locate('fk_default', 1, []);
        rowStandart.Properties.Value := odsStandartMP.FieldByName('FK_ID').AsInteger;
	      rowStandart.Properties.EditProperties.OnEditValueChanged := rowStandartEditPropertiesEditValueChanged;
      end;
//--- Тип вида медицинской помощи
    if odsTypeVMU.Active <> True then
      begin
        rowTypeVid.Properties.EditProperties.OnEditValueChanged := nil;
      	odsTypeVMU.Open;
        odsTypeVMU.Locate('fk_default', 1, []);
        rowTypeVid.Properties.Value := odsTypeVMU.FieldByName('fk_id').AsInteger;
	      rowTypeVid.Properties.EditProperties.OnEditValueChanged := rowTypeVidEditPropertiesEditValueChanged;
      end;
//--- Консультативные услуги
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_DEFAULT_KONSULT'' ';
    ods.Open;
    rowKonsult.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowKonsult.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowKonsult.Properties.Value := 0;
    rowKonsult.Properties.EditProperties.OnChange := rowKonsultEditPropertiesChange;
  finally
    Screen.Cursor := crDefault;
    ods.Free;
  end;
end;

procedure TfrmMain.DoSetDicomParameters;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
//--- Порт
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DICOM_PORT'' ';
    ods.Open;
    rowPort.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowPort.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
    rowPort.Properties.EditProperties.OnChange := rowPortEditPropertiesChange;
//--- Порт WL
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DICOMWL_PORT'' ';
    ods.Open;
    rowPortWL.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowPortWL.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
    rowPortWL.Properties.EditProperties.OnChange := rowPortWLEditPropertiesChange;
//--- IP-адрес
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DICOM_IP'' ';
    ods.Open;
    rowIP.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowIP.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
    rowIP.Properties.EditProperties.OnChange := rowIPEditPropertiesChange;
//--- Показывать 3D
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DICOM_SHOW_3D'' ';
    ods.Open;
    rowShow3D.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowShow3D.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowShow3D.Properties.Value := 0;
    rowShow3D.Properties.EditProperties.OnChange := rowShow3DEditPropertiesChange;
//--- IP-адрес WL
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DICOMWL_IP'' ';
    ods.Open;
    rowIPWL.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowIPWL.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
    rowIPWL.Properties.EditProperties.OnChange := rowIPWLEditPropertiesChange;
//--- Использовать WL
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_USE_WL'' ';
    ods.Open;
    rowWLInUse.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowWLInUse.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
    rowWLInUse.Properties.EditProperties.OnChange := rowWLInUseEditPropertiesChange;
    rowPortWL.Visible := rowWLInUse.Properties.Value = -1;
    rowIPWL.Visible := rowWLInUse.Properties.Value = -1;
//--- Called AE Title
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DICOM_CALLED_AE'' ';
    ods.Open;
    rowCalled.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowCalled.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
    rowCalled.Properties.EditProperties.OnChange := rowCalledEditPropertiesChange;
//--- Использовать интеграцию с LookInside
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''USE_INTEG_LOOKINSIDE'' ';
    ods.Open;
    rowLookInside.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowLookInside.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
    rowLookInside.Properties.EditProperties.OnChange := rowLookInsideEditPropertiesChange;

    rowPortWeb.Visible := rowLookInside.Properties.Value = -1;
    catArch.Visible := rowLookInside.Properties.Value = -1;
    rowPortLookInside.Visible := rowLookInside.Properties.Value = -1;
    rowIPLookInside.Visible := rowLookInside.Properties.Value = -1;
    rowAETitleServer.Visible := rowLookInside.Properties.Value = -1;
    rowLoginLookInside.Visible := rowLookInside.Properties.Value = -1;
    rowPasswordLookInside.Visible := rowLookInside.Properties.Value = -1;
    catWLM.Visible := rowLookInside.Properties.Value = -1;
    rowPortSend.Visible := rowLookInside.Properties.Value = -1;
    rowPortRec.Visible := rowLookInside.Properties.Value = -1;
    rowIPHL7.Visible := rowLookInside.Properties.Value = -1;
//--- Использовать C-MOVE для доступа к снимкам
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''USE_C_MOVE'' ';
    ods.Open;
    rowCMOVE.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowCMOVE.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
    rowCMOVE.Properties.EditProperties.OnChange := rowCMOVEEditPropertiesChange;
//--- Локальный порт для обратной связи
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DICOM_LOCAL_PORT'' ';
    ods.Open;
    rowLocalPort.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowLocalPort.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
    rowLocalPort.Properties.EditProperties.OnChange := rowLocalPortEditPropertiesChange;
//--- Порт для Web-а
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''LOOKINSIDE_PORT_WEB'' ';
    ods.Open;
    rowPortWeb.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowPortWeb.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
    rowPortWeb.Properties.EditProperties.OnChange := rowPortWebEditPropertiesChange;
//--- Порт сервера LookInside
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''LOOKINSIDE_PORT'' ';
    ods.Open;
    rowPortLookInside.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowPortLookInside.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
    rowPortLookInside.Properties.EditProperties.OnChange := rowPortLookInsideEditPropertiesChange;
//--- IP-адрес сервера LookInside
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''LOOKINSIDE_IP'' ';
    ods.Open;
    rowIPLookInside.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowIPLookInside.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
    rowIPLookInside.Properties.EditProperties.OnChange := rowIPLookInsideEditPropertiesChange;
//--- AE Title сервера LookInside
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''LOOKINSIDE_ARCH_AE'' ';
    ods.Open;
    rowAETitleServer.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowAETitleServer.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
    rowAETitleServer.Properties.EditProperties.OnChange := rowAETitleServerEditPropertiesChange;
//--- Логин сервера LookInside
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''LOOKINSIDE_LOGIN'' ';
    ods.Open;
    rowLoginLookInside.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowLoginLookInside.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
    rowLoginLookInside.Properties.EditProperties.OnChange := rowLoginLookInsideEditPropertiesChange;
//--- Пароль сервера LookInside
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''LOOKINSIDE_PASSWORD'' ';
    ods.Open;
    rowPasswordLookInside.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowPasswordLookInside.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
    rowPasswordLookInside.Properties.EditProperties.OnChange := rowPasswordLookInsideEditPropertiesChange;
//--- Порт отправки сообщений
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''LOOKINSIDE_HL7PORT_SEND'' ';
    ods.Open;
    rowPortSend.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowPortSend.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
    rowPortSend.Properties.EditProperties.OnChange := rowPortSendEditPropertiesChange;
//--- Порт получения сообщений
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''LOOKINSIDE_HL7PORT_REC'' ';
    ods.Open;
    rowPortRec.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowPortRec.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
    rowPortRec.Properties.EditProperties.OnChange := rowPortRecEditPropertiesChange;
//--- Ip-адрес HL7/WLM-сервера
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''LOOKINSIDE_HL7_IP'' ';
    ods.Open;
    rowIPHL7.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowIPHL7.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
    rowIPHL7.Properties.EditProperties.OnChange := rowIPHL7EditPropertiesChange;
//--- показывать кнопку "Снимки"
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''SHOW_DICOM'' ';
    ods.Open;
    rowShowSnimki.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowShowSnimki.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowShowSnimki.Properties.Value := 0;
    rowShowSnimki.Properties.EditProperties.OnChange := rowShowSnimkiEditPropertiesChange;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.DoSetDoobsledovanValues;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
//--- Дообследование
    ods.SQL.Text := ' SELECT FK_ID, FC_NAME '+#13+
    		            '   FROM ASU.TSHABLON_XRAY_ZAKL '+#13+
		                '  WHERE FK_ID = (SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DOOBSLEDOVAN'') ';
    ods.Open;
    rowDoobsl.Properties.Value := ods.FieldByName('FC_NAME').AsString;
//--- В связи с паталогией
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT FK_ID, FC_NAME '+#13+
    	              '   FROM ASU.TSHABLON_XRAY_ZAKL '+#13+
		                '  WHERE FK_ID = (SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DOOBSL_PATOLOGIA'') ';
    ods.Open;
    rowPat.Properties.Value := ods.FieldByName('FC_NAME').AsString;
//--- В связи с браком
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT FK_ID, FC_NAME '+#13+
    		            '   FROM ASU.TSHABLON_XRAY_ZAKL '+#13+
		                '  WHERE FK_ID = (SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DOOBSL_BRAK'') ';
    ods.Open;
    rowBrak.Properties.Value := ods.FieldByName('FC_NAME').AsString;
//--- Пневмония
    ods.DeleteVariables;                      
    ods.Close;
    ods.SQL.Text := ' SELECT FK_ID, FC_NAME '+#13+
    		            '   FROM ASU.TSHABLON_XRAY_ZAKL '+#13+
		                '  WHERE FK_ID = (SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''FLU_PNEVMO'') ';
    ods.Open;
    rowPnevmo.Properties.Value := ods.FieldByName('FC_NAME').AsString;
//--- Норма
    ods.Close;
    ods.SQL.Text := ' SELECT FK_ID, FC_NAME '+#13+
    		            '   FROM ASU.TSHABLON_XRAY_ZAKL '+#13+
		                '  WHERE FK_ID = (SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''FLU_NORMA'') ';
    ods.Open;
    rowNorma.Properties.Value := ods.FieldByName('FC_NAME').AsString;
//--- Прочие патологии
    ods.Close;
    ods.SQL.Text := ' SELECT FK_ID, FC_NAME '+#13+
    		            '   FROM ASU.TSHABLON_XRAY_ZAKL '+#13+
		                '  WHERE FK_ID = (SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''PRO_PAT'') ';
    ods.Open;
    rowPrPat.Properties.Value := ods.FieldByName('FC_NAME').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.DoSetProtocolParameters; // !!! переделать на 1 запрос и if-ы
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
//--- Номер диска
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''NUMBERDISC'' ';
    ods.Open;
    rowNumDisk.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowNumDisk.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
    rowNumDisk.Properties.EditProperties.OnChange := rowNumDiskEditPropertiesChange;
//--- Показывать кнопку "Зачесть"
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''SHOW_BUTTON_PASS'' ';
    ods.Open;
    rowShowPass.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowShowPass.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowShowPass.Properties.Value := 0;
    rowShowPass.Properties.EditProperties.OnChange := rowShowPassEditPropertiesChange;
//--- Показывать "Диагноз"
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_SHOW_DS'' ';
    ods.Open;
    rowShowDs.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowShowDs.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowShowDs.Properties.Value := 0;
    rowShowDs.Properties.EditProperties.OnChange := rowShowDsEditPropertiesChange;
//--- Показывать "Рекомендации"
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_SHOW_RECOM'' ';
    ods.Open;
    rowShowRecom.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowShowRecom.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowShowRecom.Properties.Value := 0;
    rowShowRecom.Properties.EditProperties.OnChange := rowShowRecomEditPropertiesChange;
//--- Показывать "Печать нескольких методик"
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_MORE_PRINT'' ';
    ods.Open;
    rowShowPrint.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowShowPrint.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowShowPrint.Properties.Value := 0;
    rowShowPrint.Properties.EditProperties.OnChange := rowShowPrintEditPropertiesChange;
//--- Показывать кнопки проверка орфографии в протоколе и проверка орфографии
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_CHECK_SPELL'' ';
    ods.Open;
    rowSpell.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowSpell.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowSpell.Properties.Value := 0;
    rowSpell.Properties.EditProperties.OnChange := rowSpellEditPropertiesChange;
//--- Показывать кнопку "Вставить картинку"
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_SHOW_INSPIC'' ';
    ods.Open;
    rowShowInsPic.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowShowInsPic.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowShowInsPic.Properties.Value := 0;
    rowShowInsPic.Properties.EditProperties.OnChange := rowShowInsPicEditPropertiesChange;
//--- Показывать кнопку "Проффакторы"
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_SHOW_PF'' ';
    ods.Open;
    rowPF.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowPF.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowPF.Properties.Value := 0;
    rowPF.Properties.EditProperties.OnChange := rowPFEditPropertiesChange;
//--- Показывать кнопку "Место работы"
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_SHOW_WORK'' ';
    ods.Open;
    rowShowWork.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowShowWork.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowShowWork.Properties.Value := 0;
    rowShowWork.Properties.EditProperties.OnChange := rowShowWorkEditPropertiesChange;
//--- Показывать кнопку "Добавить" в направлении
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_SHOW_ADD'' ';
    ods.Open;
    rowShowAdd.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowShowAdd.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowShowAdd.Properties.Value := 0;
    rowShowAdd.Properties.EditProperties.OnChange := rowShowAddEditPropertiesChange;
//--- Показывать кнопку "Добавить данные в амбулаторный талон"
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_SHOW_ADDTALONINFO'' ';
    ods.Open;
    rowAddTalonInfo.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowAddTalonInfo.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowAddTalonInfo.Properties.Value := 0;
    rowAddTalonInfo.Properties.EditProperties.OnChange := rowAddTalonInfoEditPropertiesChange;
//-- Запретить редактировать время исследования в направлении лаборанта
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_DISABLE_TIME'' ';
    ods.Open;
    rowEditTime.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowEditTime.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowEditTime.Properties.Value := 0;
    rowEditTime.Properties.EditProperties.OnChange := rowEditTimeEditPropertiesChange;
//--- Показывать при отмене "От руки" в лаборанте
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_SHOW_ONHAND'' ';
    ods.Open;
    rowShowHand.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowShowHand.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowShowHand.Properties.Value := 0;
    rowShowHand.Properties.EditProperties.OnChange := rowShowHandEditPropertiesChange;
//--- Показывать кнопку "Подпись"
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_SHOW_PODPIS'' ';
    ods.Open;
    rowPod.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowPod.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowPod.Properties.Value := 0;
    rowPod.Properties.EditProperties.OnChange := rowPodEditPropertiesChange;
//--- Несколько методик в 1 протоколе
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_MORE_METODICS'' ';
    ods.Open;
    rowMoreMet.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowMoreMet.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowMoreMet.Properties.Value := 0;
    rowMoreMet.Properties.EditProperties.OnChange := rowMoreMetEditPropertiesChange;
//--- Обязательно заполнять номер протокола
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''NUM_PROTOCOL_NOT_EMPTY'' ';
    ods.Open;
    rowNumProtocol.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowNumProtocol.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowNumProtocol.Properties.Value := 0;
    rowNumProtocol.Properties.EditProperties.OnChange := rowNumProtocolEditPropertiesChange;
//-->> Согласие пациента на обработку персональных данных
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''AGREE_PACIENT'' ';
    ods.Open;
    rowAgreePac.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowAgreePac.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowAgreePac.Properties.Value := 0;
    rowAgreePac.Properties.EditProperties.OnChange := rowAgreePacEditPropertiesChange;
//-->> Показывать кнопку "Согласие пациента"
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''SHOW_AGREE_PACIENT'' ';
    ods.Open;
    rowShowAgree.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowShowAgree.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowShowAgree.Properties.Value := 0;
    rowShowAgree.Properties.EditProperties.OnChange := rowShowAgreeEditPropertiesChange;
//-->> Блокировать подпись лаборанта после сохранения направления
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''BLOCK_LABORANT'' ';
    ods.Open;
    rowBlockLab.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowBlockLab.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowBlockLab.Properties.Value := 0;
    rowBlockLab.Properties.EditProperties.OnChange := rowBlockLabEditPropertiesChange;

//-->> Связка с амбулаторным талоном при назначении
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''AMBTALON_XRAY'' ';
    ods.Open;
    rowAmbTalon.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowAmbTalon.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowAmbTalon.Properties.Value := 0;
    rowAmbTalon.Properties.EditProperties.OnChange := rowAmbTalonEditPropertiesChange;

//-->> Дозаполнение амбулаторного талона
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_EDIT_TALON'' ';
    ods.Open;
    rowDozapol.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowDozapol.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowDozapol.Properties.Value := 0;
    rowDozapol.Properties.EditProperties.OnChange := rowDozapolEditPropertiesChange;

//-->> Английская раскладка в № протокола, направления
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''NUMPROTOCOL_IN_ENG'' ';
    ods.Open;
    rowEng.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowEng.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowEng.Properties.Value := 0;
    rowEng.Properties.EditProperties.OnChange := rowEngEditPropertiesChange;

//-->> Показывать кнопку "Долги по талонам"
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_SHOW_DOLGTALON'' ';
    ods.Open;
    rowShowDolgTalon.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowShowDolgTalon.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowShowDolgTalon.Properties.Value := 0;
    rowShowDolgTalon.Properties.EditProperties.OnChange := rowShowDolgTalonEditPropertiesChange;
//-->> Ставить по умолчанию галку "По текущей МК"
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_DEFAULT_THISMK'' ';
    ods.Open;
    rowMk.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowMk.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowMk.Properties.Value := 0;
    rowMk.Properties.EditProperties.OnChange := rowMkEditPropertiesChange;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.DoSetMainValues;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
//--- Руководитель организации
    ods.SQL.Text := ' SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''MANAGER_DOC'' AND FC_KEY = ''GLAV_VRACH'' ';
    ods.Open;
    rowBoss.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
//--- Заведующий отделением
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT ASU.DO_VRACHFIO(FC_VALUE) AS ZAVOTDEL '+#13#10+
		                '   FROM ASU.TSMINI '+#13#10+
		                '  WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''ZAV_XRAY'' ';
    ods.Open;
    rowZav.Properties.Value := ods.FieldByName('ZAVOTDEL').AsString;
//--- Отделение рентгена
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''OTDEL_XRAY'' ';
    ods.Open;
    rowOtdel.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
//--- Контактный телефон
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''KONTAKTPHONE_FOR_XRAY'' ';
    ods.Open;
    rowPhone.Properties.EditProperties.OnChange := nil;
    rowPhone.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
    rowPhone.Properties.EditProperties.OnChange := rowPhoneEditPropertiesChange;
//--- Количество дней для редактирования
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''KOLVODAYS_EDIT'' ';
    ods.Open;
    rowKolvoDays.Properties.EditProperties.OnChange := nil;
    rowKolvoDays.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
    rowKolvoDays.Properties.EditProperties.OnChange := rowKolvoDaysEditPropertiesChange;
//--- Количество дней для распределения
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''KOLVODAYS_RASPRED'' ';
    ods.Open;
    rowKolvoRaspred.Properties.EditProperties.OnChange := nil;
    rowKolvoRaspred.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
    rowKolvoRaspred.Properties.EditProperties.OnChange := rowKolvoRaspredEditPropertiesChange;
//--- Годовая эффективная доза
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_SUMDOZA'' ';
    ods.Open;
    rowSumDoza.Properties.EditProperties.OnChange := nil;
    rowSumDoza.Properties.Value := ods.FieldByName('FC_VALUE').AsString;
    rowSumDoza.Properties.EditProperties.OnChange := rowSumDozaEditPropertiesChange;
//--- Новый вид
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT NVL(FC_VALUE, 0) AS FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_NEW_STYLE'' ';
    ods.Open;
    rowNew.Properties.EditProperties.OnChange := nil;
    if ods.FieldByName('FC_VALUE').AsString <> '' then
      rowNew.Properties.Value := StrToInt(ods.FieldByName('FC_VALUE').AsString)
    else
      rowNew.Properties.Value := 0;
    rowNew.Properties.EditProperties.OnChange := rowNewEditPropertiesChange;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.DoShowfrmMain;
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  cxPage.ActivePageIndex := 0;
  pAPPSOTRID := StrToInt(paramstr(1));
  ods := TOracleDataSet.Create(nil);
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_SOTRID, '+#13+
                    '        ASU.DO_VRACHFIO(FK_SOTRID) AS SOTRFIO, '+#13+
                    '        (SELECT FK_OTDELID FROM ASU.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID) AS OTDELID '+#13+
                    '   FROM LOGIN.TAPPSOTR '+#13+
                    '  WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    sSOTRFIO := ods.FieldByName('SOTRFIO').AsString;
    pOTDELID := ods.FieldByName('OTDELID').AsInteger;
    frmMain.Caption := 'Настройки('+Ver.FileVersion+'). Пользователь: '+sSOTRFIO;
  finally
    Ver.Free;
    ods.Free;
  end;
  DoSetMainValues;
  DoSetDoobsledovanValues;
  DoSetProtocolParameters;
  DoSetDicomParameters;
  if odsReanim.Active = False then
    odsReanim.Open;
  if odsPeriodSpisok.Active = False then
    odsPeriodSpisok.Open;
  if odsMetods.Active = False then
    odsMetods.Active := True;

  tvAp.StoreToRegistry('\SoftWare\SoftMaster\Xray_param\tvApVrach_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'tvAp');
  tvAp.RestoreFromRegistry('\SoftWare\SoftMaster\Xray_param\tvApVrach_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'tvAp');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из приложения ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    action := caFree
  else
    action := caNone;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  tvAp.StoreToRegistry('\SoftWare\SoftMaster\Xray_param\tvApVrach_' + IntToStr(pSOTRID), TRUE, [], 'tvAp');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  {$IFDEF USE_NEW_AUTH}
    GetSession(osMain, 'ASU');
  {$ELSE}
    osMain.LogonUsername := 'ASU';
    osMain.LogonPassword := 'ASU';
    osMain.LogonDatabase := 'ASU';
    osMain.Connected:=True;
  {$ENDIF}
  cxPage.HideTabs := True;
  russian:=LoadKeyboardLayout('00000419', 0);
  latin:=LoadKeyboardLayout('00000409', 0);
  Self.WindowState := wsMaximized;
  xray_param_use_cito := TDBUtils.GetConstantDef('xray_param_use_cito',osmain,0);
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  tvAp.RestoreFromRegistry('\SoftWare\SoftMaster\Xray_Param\tvApVrach_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'tvAp');
end;

procedure TfrmMain.odsEditAfterOpen(DataSet: TDataSet);
begin
  aEditEdit.Enabled := odsEdit.RecordCount <> 0;
  aDelEdit.Enabled := odsEdit.RecordCount <> 0;
end;

procedure TfrmMain.odsFluKabsAfterOpen(DataSet: TDataSet);
begin
  aDelFlu.Enabled := odsFluKabs.RecordCount <> 0;
  aSetLiter.Enabled := odsFluKabs.RecordCount <> 0;
end;

procedure TfrmMain.odsListMKAfterOpen(DataSet: TDataSet);
begin
  aDelMK.Enabled := odsListMK.RecordCount <> 0;
end;

procedure TfrmMain.odsOtdelInCitoAfterOpen(DataSet: TDataSet);
begin
  aDelOtdelCito.Enabled := odsOtdelInCito.recordcount > 0;
end;

procedure TfrmMain.OracleDataSet1AfterScroll(DataSet: TDataSet);
begin
  if not OracleDataSet1.eof then
  begin
    edMOD.Text:= OracleDataSet1.FieldByName('FC_MOD_NAME').AsString;
    Button1.Enabled:=True;
  end else
  begin
    edMOD.Text:='';
    Button1.Enabled:=False;
  end;
end;

procedure TfrmMain.oraTSMINI_GROUPAfterScroll(DataSet: TDataSet);
begin
  OracleDataSet1.Close;
  if not oraTSMINI_GROUP.Eof then
  begin
    OracleDataSet1.SetVariable('P_FK_DEFAULT',oraTSMINI_GROUP.FieldByName('FK_ID').AsInteger);
    OracleDataSet1.Open;
  end;
end;

procedure TfrmMain.osMainAfterLogOn(Sender: TOracleSession);
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

procedure TfrmMain.pcDicom1Change(Sender: TObject);
begin
  if pcDicom1.ActivePageIndex = 2 then
    begin
      if odsBodyParts.Active = False then
        odsBodyParts.Active := True;
    end;
end;

procedure TfrmMain.rowAddTalonInfoEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''XRAY_SHOW_ADDTALONINFO'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_SHOW_ADDTALONINFO'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''XRAY_SHOW_ADDTALONINFO'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowAddTalonInfo.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowAETitleServerEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' merge into asu.tsmini using dual on (fc_key = ''LOOKINSIDE_ARCH_AE'') '+#13#10+
                    ' when matched then update set fc_value = :pfc_value where fc_section = ''XRAY'' and fc_key = ''LOOKINSIDE_ARCH_AE'' '+#13#10+
                    ' when not matched then insert (fc_section, fc_key, fc_value) values(''XRAY'', ''LOOKINSIDE_ARCH_AE'', :pfc_value) ';
    ods.DeclareAndSet('PFC_VALUE', otString, TcxButtonEdit(vGrDicom.InplaceEditor).EditingText);
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := False;
end;

procedure TfrmMain.rowAETitleServerEditPropertiesChange(Sender: TObject);
begin
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := True;
end;

procedure TfrmMain.rowAgreePacEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''AGREE_PACIENT'') '+#13+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''AGREE_PACIENT'' '+#13+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''AGREE_PACIENT'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowAgreePac.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowAmbTalonEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''AMBTALON_XRAY'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''AMBTALON_XRAY'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''AMBTALON_XRAY'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowAmbTalon.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowApparatEditPropertiesEditValueChanged(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := osMain;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 0 WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_APPARAT'') ';
    oq.Execute;
    if rowApparat.Properties.Value <> 0 then
      begin
	      oq.DeleteVariables;
	      oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 1 WHERE FK_ID = :PFK_ID ';
	      oq.DeclareAndSet('PFK_ID', otInteger, rowApparat.Properties.Value);
	      oq.Execute;
      end;
    osMain.Commit;
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.rowBlockLabEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''BLOCK_LABORANT'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''BLOCK_LABORANT'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''BLOCK_LABORANT'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowBlockLab.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowBossEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
begin
  Application.CreateForm(TfrmSetGlavVrach, frmSetGlavVrach);
  try
    if frmSetGlavVrach.odsGlavVrach.Active = False then
      frmSetGlavVrach.odsGlavVrach.Open;
    frmSetGlavVrach.odsGlavVrach.Locate('FC_NAME', TcxButtonEdit(VerGrMain.InplaceEditor).EditingText, []);
    frmSetGlavVrach.ShowModal;
    if frmSetGlavVrach.ModalResult = mrOk then
      begin
        TcxButtonEdit(VerGrMain.InplaceEditor).Properties.ViewStyle := vsNormal;
        TcxButtonEdit(VerGrMain.InplaceEditor).EditingText := frmSetGlavVrach.odsGlavVrach.FieldByName('FC_NAME').AsString;
        TcxButtonEdit(VerGrMain.InplaceEditor).Properties.ViewStyle := vsHideCursor;
        rowBoss.Tag := frmSetGlavVrach.odsGlavVrach.FieldByName('FK_ID').AsInteger;
        ods := TOracleDataSet.Create(nil);
        try
	        ods.Session := osMain;
	        ods.Cursor := crSQLWait;
	        ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''GLAV_VRACH'') '+#13#10+
                          ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''MANAGER_DOC'' AND FC_KEY = ''GLAV_VRACH'' '+#13#10+
                          ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''MANAGER_DOC'', ''GLAV_VRACH'', :PFC_VALUE) ';
	        ods.DeclareAndSet('PFC_VALUE', otString, frmSetGlavVrach.odsGlavVrach.FieldByName('FC_NAME').AsString);
	        ods.Open;
	        osMain.Commit;
        finally
          ods.Free;
        end;
      end;
  finally
    frmSetGlavVrach.Free;
  end;
end;

procedure TfrmMain.rowBrakEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetDoobsl, frmSetDoobsl);
      if frmSetDoobsl.odsDoobsl.Active = False then
        frmSetDoobsl.odsDoobsl.Open;
      frmSetDoobsl.odsDoobsl.Locate('FC_NAME', TcxButtonEdit(vGrFlu.InplaceEditor).EditingText, []);
      frmSetDoobsl.ShowModal;
      if frmSetDoobsl.ModalResult = MrOk then
        begin
          TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsNormal;
          TcxButtonEdit(vGrFlu.InplaceEditor).EditingText := frmSetDoobsl.odsDoobsl.FieldByName('FC_NAME').AsString;
          TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          rowBrak.Tag := frmSetDoobsl.odsDoobsl.FieldByName('FK_ID').AsInteger;
          ods := TOracleDataSet.Create(nil);
          try
	          ods.Session := osMain;
	          ods.Cursor := crSQLWait;
            ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''DOOBSL_BRAK'') '+#13#10+
                            ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DOOBSL_BRAK'' '+#13#10+
                            ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''DOOBSL_BRAK'', :PFC_VALUE) ';
           	ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(frmSetDoobsl.odsDoobsl.FieldByName('FK_ID').AsInteger));
	          ods.Open;
	          osMain.Commit;
          finally
	          ods.Free;
          end;
        end;
      frmSetDoobsl.Free;
    end;
  if AButtonIndex = 1 then
    begin
      if Application.MessageBox('Удаление настройки дообследования в связи с браком может привести к некорректной работе отчёта по профосмотрам!'+#13+
                         		    'Вы действительно хотите удалить настройку?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = mrYes then
        begin
          oq := TOracleQuery.Create(nil);
          try
      	    oq.Session := osMain;
      	    oq.Cursor := crSQLWait;
      	    oq.SQL.Text := ' DELETE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DOOBSL_BRAK'' ';
      	    oq.Execute;
      	    osMain.Commit;
            TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vGrFlu.InplaceEditor).EditingText := '';
            TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          finally
      	    oq.Free;
          end;
        end;
    end;
end;

procedure TfrmMain.rowCalledEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''DICOM_CALLED_AE'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DICOM_CALLED_AE'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''DICOM_CALLED_AE'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, TcxButtonEdit(vGrDicom.InplaceEditor).EditingText);
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := False;
end;

procedure TfrmMain.rowCalledEditPropertiesChange(Sender: TObject);
begin
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := True;
end;

procedure TfrmMain.rowCMOVEEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''USE_C_MOVE'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''USE_C_MOVE'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''USE_C_MOVE'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowCMOVE.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowCompanyDogEditPropertiesEditValueChanged(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := osMain;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 0 WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_COMPANY_DOGOVOR'') ';
    oq.Execute;
    if rowCompanyDog.Properties.Value <> 0 then
      begin
	      oq.DeleteVariables;
	      oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 1 WHERE FK_ID = :PFK_ID ';
	      oq.DeclareAndSet('PFK_ID', otInteger, rowCompanyDog.Properties.Value);
	      oq.Execute;
      end;
    osMain.Commit;
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.rowDoobslEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
//--- выбираем дообследование
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetDoobsl, frmSetDoobsl);
      if frmSetDoobsl.odsDoobsl.Active = False then
        frmSetDoobsl.odsDoobsl.Open;
      frmSetDoobsl.odsDoobsl.Locate('FC_NAME', TcxButtonEdit(vGrFlu.InplaceEditor).EditingText, []);
      frmSetDoobsl.ShowModal;
      if frmSetDoobsl.ModalResult = MrOk then
        begin
          TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsNormal;
          TcxButtonEdit(vGrFlu.InplaceEditor).EditingText := frmSetDoobsl.odsDoobsl.FieldByName('FC_NAME').AsString;
          TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          rowDoobsl.Tag := frmSetDoobsl.odsDoobsl.FieldByName('FK_ID').AsInteger;
          ods := TOracleDataSet.Create(nil);
          try
      	    ods.Session := osMain;
      	    ods.Cursor := crSQLWait;
            ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''DOOBSLEDOVAN'') '+#13#10+
                            ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DOOBSLEDOVAN'' '+#13#10+
                            ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''DOOBSLEDOVAN'', :PFC_VALUE) ';
      	    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(frmSetDoobsl.odsDoobsl.FieldByName('FK_ID').AsInteger));
      	    ods.Open;
	          osMain.Commit;
          finally
	          ods.Free;
          end;
        end;
      frmSetDoobsl.Free;
    end;
//--- удаляем настройку "дообследования"
  if AButtonIndex = 1 then
    begin
      if Application.MessageBox('Удаление настройки дообследования может привести к некорректной работе журнала дообследования!'+#13+
  	                            'Вы действительно хотите удалить настройку?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = mrYes then
        begin
          oq := TOracleQuery.Create(nil);
          try
      	    oq.Session := osMain;
      	    oq.Cursor := crSQLWait;
      	    oq.SQL.Text := ' DELETE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DOOBSLEDOVAN'' ';
      	    oq.Execute;
      	    osMain.Commit;
            TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vGrFlu.InplaceEditor).EditingText := '';
            TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          finally
	          oq.Free;
          end;
        end;
    end;
end;

procedure TfrmMain.rowDopIshodEditPropertiesEditValueChanged(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := osMain;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 0 WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''DOP_ISHOD_PARENT'') ';
    oq.Execute;
    if rowDopIshod.Properties.Value <> 0 then
      begin
	      oq.DeleteVariables;
	      oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 1 WHERE FK_ID = :PFK_ID ';
	      oq.DeclareAndSet('PFK_ID', otInteger, rowDopIshod.Properties.Value);
	      oq.Execute;
      end;
    osMain.Commit;
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.rowDozapolEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''XRAY_EDIT_TALON'') '+#13+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_EDIT_TALON'' '+#13+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''XRAY_EDIT_TALON'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowDozapol.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowEditTimeEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''XRAY_DISABLE_TIME'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_DISABLE_TIME'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''XRAY_DISABLE_TIME'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowEditTime.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowEngEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''NUMPROTOCOL_IN_ENG'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''NUMPROTOCOL_IN_ENG'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''NUMPROTOCOL_IN_ENG'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowEng.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowIPEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''DICOM_IP'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DICOM_IP'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''DICOM_IP'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, TcxButtonEdit(vGrDicom.InplaceEditor).EditingText);
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := False;
end;

procedure TfrmMain.rowIPEditPropertiesChange(Sender: TObject);
begin
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := True;
end;

procedure TfrmMain.rowIPHL7EditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' merge into asu.tsmini using dual on (fc_key = ''LOOKINSIDE_HL7_IP'') '+#13#10+
                    ' when matched then update set fc_value = :pfc_value where fc_section = ''XRAY'' and fc_key = ''LOOKINSIDE_HL7_IP'' '+#13#10+
                    ' when not matched then insert (fc_section, fc_key, fc_value) values(''XRAY'', ''LOOKINSIDE_HL7_IP'', :pfc_value) ';
    ods.DeclareAndSet('PFC_VALUE', otString, TcxButtonEdit(vGrDicom.InplaceEditor).EditingText);
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := False;
end;

procedure TfrmMain.rowIPHL7EditPropertiesChange(Sender: TObject);
begin
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := True;
end;

procedure TfrmMain.rowIPLookInsideEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''LOOKINSIDE_IP'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''LOOKINSIDE_IP'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''LOOKINSIDE_IP'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, TcxButtonEdit(vGrDicom.InplaceEditor).EditingText);
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := False;
end;

procedure TfrmMain.rowIPLookInsideEditPropertiesChange(Sender: TObject);
begin
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := True;
end;

procedure TfrmMain.rowIPWLEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''DICOMWL_IP'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DICOMWL_IP'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''DICOMWL_IP'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, TcxButtonEdit(vGrWL.InplaceEditor).EditingText);
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
  TcxButtonEdit(vGrWL.InplaceEditor).Properties.Buttons.Items[0].Enabled := False;
end;

procedure TfrmMain.rowIPWLEditPropertiesChange(Sender: TObject);
begin
  TcxButtonEdit(vGrWL.InplaceEditor).Properties.Buttons.Items[0].Enabled := True;
end;

procedure TfrmMain.rowKolvoDaysEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''KOLVODAYS_EDIT'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''KOLVODAYS_EDIT'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''KOLVODAYS_EDIT'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, TcxButtonEdit(VerGrMain.InplaceEditor).EditingText);
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
  TcxButtonEdit(VerGrMain.InplaceEditor).Properties.Buttons.Items[0].Enabled := False;
end;

procedure TfrmMain.rowKolvoDaysEditPropertiesChange(Sender: TObject);
begin
  TcxButtonEdit(VerGrMain.InplaceEditor).Properties.Buttons.Items[0].Enabled := True;
end;

procedure TfrmMain.rowKolvoRaspredEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''KOLVODAYS_RASPRED'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''KOLVODAYS_RASPRED'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''KOLVODAYS_RASPRED'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, TcxButtonEdit(VerGrMain.InplaceEditor).EditingText);
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
  TcxButtonEdit(VerGrMain.InplaceEditor).Properties.Buttons.Items[0].Enabled := False;
end;

procedure TfrmMain.rowKolvoRaspredEditPropertiesChange(Sender: TObject);
begin
  TcxButtonEdit(VerGrMain.InplaceEditor).Properties.Buttons.Items[0].Enabled := True;
end;

procedure TfrmMain.rowKonsultEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''XRAY_DEFAULT_KONSULT'') '+#13+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_DEFAULT_KONSULT'' '+#13+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''XRAY_DEFAULT_KONSULT'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowKonsult.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowLocalPortEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''DICOM_LOCAL_PORT'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DICOM_LOCAL_PORT'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''DICOM_LOCAL_PORT'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, TcxButtonEdit(vGrDicom.InplaceEditor).EditingText);
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := False;
end;

procedure TfrmMain.rowLocalPortEditPropertiesChange(Sender: TObject);
begin
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := True;
end;

procedure TfrmMain.rowLoginLookInsideEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''LOOKINSIDE_LOGIN'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''LOOKINSIDE_LOGIN'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT(FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''LOOKINSIDE_LOGIN'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, TcxButtonEdit(vGrDicom.InplaceEditor).EditingText);
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := False;
end;

procedure TfrmMain.rowLoginLookInsideEditPropertiesChange(Sender: TObject);
begin
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := True;
end;

procedure TfrmMain.rowLookInsideEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''USE_INTEG_LOOKINSIDE'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''USE_INTEG_LOOKINSIDE'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''USE_INTEG_LOOKINSIDE'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowLookInside.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;

  rowPortWeb.Visible := rowLookInside.Properties.Value = -1;
  catArch.Visible := rowLookInside.Properties.Value = -1;
  rowPortLookInside.Visible := rowLookInside.Properties.Value = -1;
  rowIPLookInside.Visible := rowLookInside.Properties.Value = -1;
  rowAETitleServer.Visible := rowLookInside.Properties.Value = -1;
  rowLoginLookInside.Visible := rowLookInside.Properties.Value = -1;
  rowPasswordLookInside.Visible := rowLookInside.Properties.Value = -1;
  catWLM.Visible := rowLookInside.Properties.Value = -1;
  rowPortSend.Visible := rowLookInside.Properties.Value = -1;
  rowPortRec.Visible := rowLookInside.Properties.Value = -1;
  rowIPHL7.Visible := rowLookInside.Properties.Value = -1;
end;

procedure TfrmMain.rowMkEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''XRAY_DEFAULT_THISMK'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_DEFAULT_THISMK'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''XRAY_DEFAULT_THISMK'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowMk.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.RowMoreMetEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''XRAY_MORE_METODICS'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_MORE_METODICS'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''XRAY_MORE_METODICS'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowMoreMet.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowNewEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''XRAY_NEW_STYLE'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_NEW_STYLE'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''XRAY_NEW_STYLE'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowNew.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowNormaEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetDoobsl, frmSetDoobsl);
      if frmSetDoobsl.odsDoobsl.Active = False then
        frmSetDoobsl.odsDoobsl.Open;
      frmSetDoobsl.odsDoobsl.Locate('FC_NAME', TcxButtonEdit(vGrFlu.InplaceEditor).EditingText, []);
      frmSetDoobsl.ShowModal;
      if frmSetDoobsl.ModalResult = MrOk then
        begin
          TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsNormal;
          TcxButtonEdit(vGrFlu.InplaceEditor).EditingText := frmSetDoobsl.odsDoobsl.FieldByName('FC_NAME').AsString;
          TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          rowNorma.Tag := frmSetDoobsl.odsDoobsl.FieldByName('FK_ID').AsInteger;
          ods := TOracleDataSet.Create(nil);
          try
	          ods.Session := osMain;
	          ods.Cursor := crSQLWait;
            ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''FLU_NORMA'') '+#13#10+
                            ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''FLU_NORMA'' '+#13#10+
                            ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''FLU_NORMA'', :PFC_VALUE) ';
	          ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(frmSetDoobsl.odsDoobsl.FieldByName('FK_ID').AsInteger));
	          ods.Open;
	          osMain.Commit;
          finally
	          ods.Free;
          end;
        end;
      frmSetDoobsl.Free;
    end;
  if AButtonIndex = 1 then
    begin
      if Application.MessageBox('Удаление настройки "Норма" может привести к некорректной работе кнопки "Норма" в флюорографическом кабинете!'+#13+
                		            'Вы действительно хотите удалить настройку?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = mrYes then
        begin
          oq := TOracleQuery.Create(nil);
          try
      	    oq.Session := osMain;
      	    oq.Cursor := crSQLWait;
      	    oq.SQL.Text := ' DELETE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''FLU_NORMA'' ';
      	    oq.Execute;
      	    osMain.Commit;
            TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vGrFlu.InplaceEditor).EditingText := '';
            TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          finally
      	    oq.Free;
          end;
        end;
    end; 
end;

procedure TfrmMain.rowNumDiskEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''NUMBERDISC'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''NUMBERDISC'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''NUMBERDISC'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, TcxButtonEdit(vGrDefaults.InplaceEditor).EditingText);
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
  TcxButtonEdit(vGrDefaults.InplaceEditor).Properties.Buttons.Items[0].Enabled := False;
end;

procedure TfrmMain.rowNumDiskEditPropertiesChange(Sender: TObject);
begin
  TcxButtonEdit(vGrDefaults.InplaceEditor).Properties.Buttons.Items[0].Enabled := True;
end;

procedure TfrmMain.rowNumProtocolEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''NUM_PROTOCOL_NOT_EMPTY'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''NUM_PROTOCOL_NOT_EMPTY'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''NUM_PROTOCOL_NOT_EMPTY'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowNumProtocol.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowOtdelEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
//--- Добавляем отделение
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetOtdel, frmSetOtdel);
      try
        if frmSetOtdel.odsOtdel.Active = False then
          frmSetOtdel.odsOtdel.Open;
        frmSetOtdel.odsOtdel.Locate('FC_NAME', TcxButtonEdit(VerGrMain.InplaceEditor).EditingText, []);
        frmSetOtdel.ShowModal;
        if frmSetOtdel.ModalResult = mrOk then
          begin
            TcxButtonEdit(VerGrMain.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(VerGrMain.InplaceEditor).EditingText := frmSetOtdel.odsOtdel.FieldByName('FC_NAME').AsString;
            TcxButtonEdit(VerGrMain.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            rowOtdel.Tag := frmSetOtdel.odsOtdel.FieldByName('FK_ID').AsInteger;
            ods := TOracleDataSet.Create(nil);
            try
	            ods.Session := osMain;
	            ods.Cursor := crSQLWait;
    	        ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''OTDEL_XRAY'') '+#13#10+
                              ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''OTDEL_XRAY'' '+#13#10+
                              ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''OTDEL_XRAY'', :PFC_VALUE) ';
	            ods.DeclareAndSet('PFC_VALUE', otString, frmSetOtdel.odsOtdel.FieldByName('FC_NAME').AsString);
	            ods.Open;
	            osMain.Commit;
            finally
	            ods.Free;
            end;
          end;
      finally
        frmSetOtdel.Free;
      end;
    end;
//--- Удаляем настройку "Отделение"
  if AButtonIndex = 1 then
    begin
      if Application.MessageBox('Удаление настройки отделения может привести к некорректной печати некоторых отчетов системы!'+#13+
    	                  		    'Вы действительно хотите удалить настройку?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = mrYes then
        begin
          oq := TOracleQuery.Create(nil);
          try
	          oq.Session := osMain;
	          oq.Cursor := crSQLWait;
	          oq.SQL.Text := ' DELETE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''OTDEL_XRAY'' ';
	          oq.Execute;
	          osMain.Commit;
            TcxButtonEdit(VerGrMain.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(VerGrMain.InplaceEditor).EditingText := '';
            TcxButtonEdit(VerGrMain.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          finally
        	  oq.Free;
          end;
        end;
    end;
end;

procedure TfrmMain.rowPasswordLookInsideEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''LOOKINSIDE_PASSWORD'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''LOOKINSIDE_PASSWORD'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''LOOKINSIDE_PASSWORD'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, TcxButtonEdit(vGrDicom.InplaceEditor).EditingText);
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := False;
end;

procedure TfrmMain.rowPasswordLookInsideEditPropertiesChange(Sender: TObject);
begin
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := True;
end;

procedure TfrmMain.rowPatEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetDoobsl, frmSetDoobsl);
      if frmSetDoobsl.odsDoobsl.Active = False then
        frmSetDoobsl.odsDoobsl.Open;
      frmSetDoobsl.odsDoobsl.Locate('FC_NAME', TcxButtonEdit(vGrFlu.InplaceEditor).EditingText, []);
      frmSetDoobsl.ShowModal;
      if frmSetDoobsl.ModalResult = MrOk then
        begin
          TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsNormal;
          TcxButtonEdit(vGrFlu.InplaceEditor).EditingText := frmSetDoobsl.odsDoobsl.FieldByName('FC_NAME').AsString;
          TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          rowPat.Tag := frmSetDoobsl.odsDoobsl.FieldByName('FK_ID').AsInteger;
          ods := TOracleDataSet.Create(nil);
          try
	          ods.Session := osMain;
	          ods.Cursor := crSQLWait;
            ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''DOOBSL_PATOLOGIA'') '+#13#10+
                            ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DOOBSL_PATOLOGIA'' '+#13#10+
                            ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''DOOBSL_PATOLOGIA'', :PFC_VALUE) ';
          	ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(frmSetDoobsl.odsDoobsl.FieldByName('FK_ID').AsInteger));
	          ods.Open;
	          osMain.Commit;
          finally
	          ods.Free;
          end;
        end;
      frmSetDoobsl.Free;
    end;
  if AButtonIndex = 1 then
    begin
      if Application.MessageBox('Удаление настройки "Дообследования в связи с патологией" может привести к некорректной работе отчёта по профосмотрам!'+#13+
    	                  		    'Вы действительно хотите удалить настройку?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = mrYes then
        begin
          oq := TOracleQuery.Create(nil);
          try
      	    oq.Session := osMain;
	          oq.Cursor := crSQLWait;
	          oq.SQL.Text := ' DELETE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DOOBSL_PATOLOGIA'' ';
	          oq.Execute;
	          osMain.Commit;
            TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vGrFlu.InplaceEditor).EditingText := '';
            TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          finally
	          oq.Free;
          end;
        end;
    end;
end;

procedure TfrmMain.rowPeriodEditPropertiesEditValueChanged(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := osMain;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 0 WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_PERIOD_OSMOTROV'') ';
    oq.Execute;
    if rowPeriod.Properties.Value <> 0 then
      begin
	      oq.DeleteVariables;
	      oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 1 WHERE FK_ID = :PFK_ID ';
	      oq.DeclareAndSet('PFK_ID', otInteger, rowPeriod.Properties.Value);
	      oq.Execute;
      end;
    osMain.Commit;
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.rowPFEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''XRAY_SHOW_PF'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_SHOW_PF'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''XRAY_SHOW_PF'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowPF.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowPhoneEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''KONTAKTPHONE_FOR_XRAY'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''KONTAKTPHONE_FOR_XRAY'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''KONTAKTPHONE_FOR_XRAY'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, TcxButtonEdit(VerGrMain.InplaceEditor).EditingText);
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
  TcxButtonEdit(VerGrMain.InplaceEditor).Properties.Buttons.Items[0].Enabled := False;
end;

procedure TfrmMain.rowPhoneEditPropertiesChange(Sender: TObject);
begin
  TcxButtonEdit(VerGrMain.InplaceEditor).Properties.Buttons.Items[0].Enabled := True;
end;

procedure TfrmMain.rowPlaceEditPropertiesEditValueChanged(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := osMain;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 0 WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''AMBTALON_SERVPLACE'') ';
    oq.Execute;
    if rowPlace.Properties.Value <> 0 then
      begin
	      oq.DeleteVariables;
	      oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 1 WHERE FK_ID = :PFK_ID ';
	      oq.DeclareAndSet('PFK_ID', otInteger, rowPlace.Properties.Value);
	      oq.Execute;
      end;
    osMain.Commit;
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.rowPnevmoEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetDoobsl, frmSetDoobsl);
      if frmSetDoobsl.odsDoobsl.Active = False then
        frmSetDoobsl.odsDoobsl.Open;
      frmSetDoobsl.odsDoobsl.Locate('FC_NAME', TcxButtonEdit(vGrFlu.InplaceEditor).EditingText, []);
      frmSetDoobsl.ShowModal;
      if frmSetDoobsl.ModalResult = MrOk then
        begin
          TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsNormal;
          TcxButtonEdit(vGrFlu.InplaceEditor).EditingText := frmSetDoobsl.odsDoobsl.FieldByName('FC_NAME').AsString;
          TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          rowPnevmo.Tag := frmSetDoobsl.odsDoobsl.FieldByName('FK_ID').AsInteger;
          ods := TOracleDataSet.Create(nil);
          try
	          ods.Session := osMain;
	          ods.Cursor := crSQLWait;
            ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''FLU_PNEVMO'') '+#13#10+
                            ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''FLU_PNEVMO'' '+#13#10+
                            ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''FLU_PNEVMO'', :PFC_VALUE) ';
    	      ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(frmSetDoobsl.odsDoobsl.FieldByName('FK_ID').AsInteger));
	          ods.Open;
	          osMain.Commit;
          finally
	          ods.Free;
          end;
        end;
      frmSetDoobsl.Free;
    end;
  if AButtonIndex = 1 then
    begin
      if Application.MessageBox('Удаление настройки "Пневмония" может привести к некорректной работе отчёта по профосмотрам!'+#13+
                		            'Вы действительно хотите удалить настройку?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = mrYes then
        begin
          oq := TOracleQuery.Create(nil);
          try
      	    oq.Session := osMain;
      	    oq.Cursor := crSQLWait;
      	    oq.SQL.Text := ' DELETE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''FLU_PNEVMO'' ';
      	    oq.Execute;
      	    osMain.Commit;
            TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vGrFlu.InplaceEditor).EditingText := '';
            TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          finally
      	    oq.Free;
          end;
        end;
    end;
end;

procedure TfrmMain.rowPodEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''XRAY_SHOW_PODPIS'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_SHOW_PODPIS'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''XRAY_SHOW_PODPIS'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowPod.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowPortEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''DICOM_PORT'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DICOM_PORT'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''DICOM_PORT'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, TcxButtonEdit(vGrDicom.InplaceEditor).EditingText);
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := False;
end;

procedure TfrmMain.rowPortEditPropertiesChange(Sender: TObject);
begin
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := True;
end;

procedure TfrmMain.rowPortLookInsideEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''LOOKINSIDE_PORT'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''LOOKINSIDE_PORT'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''LOOKINSIDE_PORT'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, TcxButtonEdit(vGrDicom.InplaceEditor).EditingText);
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := False;
end;

procedure TfrmMain.rowPortLookInsideEditPropertiesChange(Sender: TObject);
begin
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := True;
end;

procedure TfrmMain.rowPortRecEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' merge into asu.tsmini using dual on (fc_key = ''LOOKINSIDE_HL7PORT_REC'') '+#13#10+
                    ' when matched then update set fc_value = :pfc_value where fc_section = ''XRAY'' and fc_key = ''LOOKINSIDE_HL7PORT_REC'' '+#13#10+
                    ' when not matched then insert (fc_section, fc_key, fc_value) values(''XRAY'', ''LOOKINSIDE_HL7PORT_REC'', :pfc_value) ';
    ods.DeclareAndSet('PFC_VALUE', otString, TcxButtonEdit(vGrDicom.InplaceEditor).EditingText);
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := False;
end;

procedure TfrmMain.rowPortRecEditPropertiesChange(Sender: TObject);
begin
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := True;
end;

procedure TfrmMain.rowPortSendEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' merge into asu.tsmini using dual on (fc_key = ''LOOKINSIDE_HL7PORT_SEND'') '+#13#10+
                    ' when matched then update set fc_value = :pfc_value where fc_section = ''XRAY'' and fc_key = ''LOOKINSIDE_HL7PORT_SEND'' '+#13#10+
                    ' when not matched then insert (fc_section, fc_key, fc_value) values(''XRAY'', ''LOOKINSIDE_HL7PORT_SEND'', :pfc_value) ';
    ods.DeclareAndSet('PFC_VALUE', otString, TcxButtonEdit(vGrDicom.InplaceEditor).EditingText);
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := False;
end;

procedure TfrmMain.rowPortSendEditPropertiesChange(Sender: TObject);
begin
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := True;
end;

procedure TfrmMain.rowPortWebEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' merge into asu.tsmini using dual on (fc_key = ''LOOKINSIDE_PORT_WEB'') '+#13#10+
                    ' when matched then update set fc_value = :pfc_value where fc_section = ''XRAY'' and fc_key = ''LOOKINSIDE_PORT_WEB'' '+#13#10+
                    ' when not matched then insert (fc_section, fc_key, fc_value) values(''XRAY'', ''LOOKINSIDE_PORT_WEB'', :pfc_value) ';
    ods.DeclareAndSet('PFC_VALUE', otString, TcxButtonEdit(vGrDicom.InplaceEditor).EditingText);
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := False;
end;

procedure TfrmMain.rowPortWebEditPropertiesChange(Sender: TObject);
begin
  TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled := True;
end;

procedure TfrmMain.rowPortWLEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''DICOMWL_PORT'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DICOMWL_PORT'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''DICOMWL_PORT'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, TcxButtonEdit(vGrWL.InplaceEditor).EditingText);
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
  TcxButtonEdit(vGrWL.InplaceEditor).Properties.Buttons.Items[0].Enabled := False;
end;

procedure TfrmMain.rowPortWLEditPropertiesChange(Sender: TObject);
begin
  TcxButtonEdit(vGrWL.InplaceEditor).Properties.Buttons.Items[0].Enabled := True;
end;

procedure TfrmMain.rowProjEditPropertiesEditValueChanged(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := osMain;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 0 WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''PD_MZ'') ';
    oq.Execute;
    if rowProj.Properties.Value <> 0 then
      begin
	      oq.DeleteVariables;
	      oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 1 WHERE FK_ID = :PFK_ID ';
	      oq.DeclareAndSet('PFK_ID', otInteger, rowProj.Properties.Value);
	      oq.Execute;
      end;
    osMain.Commit;
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.rowPrPatEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetDoobsl, frmSetDoobsl);
      if frmSetDoobsl.odsDoobsl.Active = False then
        frmSetDoobsl.odsDoobsl.Open;
      frmSetDoobsl.odsDoobsl.Locate('FC_NAME', TcxButtonEdit(vGrFlu.InplaceEditor).EditingText, []);
      frmSetDoobsl.ShowModal;
      if frmSetDoobsl.ModalResult = MrOk then
        begin
          TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsNormal;
          TcxButtonEdit(vGrFlu.InplaceEditor).EditingText := frmSetDoobsl.odsDoobsl.FieldByName('FC_NAME').AsString;
          TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          rowPrPat.Tag := frmSetDoobsl.odsDoobsl.FieldByName('FK_ID').AsInteger;
          ods := TOracleDataSet.Create(nil);
          try
	          ods.Session := osMain;
	          ods.Cursor := crSQLWait;
            ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''PRO_PAT'') '+#13#10+
                            ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''PRO_PAT'' '+#13#10+
                            ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''PRO_PAT'', :PFC_VALUE) ';
	          ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(frmSetDoobsl.odsDoobsl.FieldByName('FK_ID').AsInteger));
	          ods.Open;
	          osMain.Commit;
          finally
	          ods.Free;
          end;
        end;
      frmSetDoobsl.Free;
    end;
  if AButtonIndex = 1 then
    begin
      if Application.MessageBox('Удаление настройки "Норма" может привести к некорректной работе кнопки "Норма" в флюорографическом кабинете!'+#13+
                		            'Вы действительно хотите удалить настройку?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = mrYes then
        begin
          oq := TOracleQuery.Create(nil);
          try
      	    oq.Session := osMain;
      	    oq.Cursor := crSQLWait;
      	    oq.SQL.Text := ' DELETE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''PRO_PAT'' ';
      	    oq.Execute;
      	    osMain.Commit;
            TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vGrFlu.InplaceEditor).EditingText := '';
            TcxButtonEdit(vGrFlu.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          finally
      	    oq.Free;
          end;
        end;
    end;
end;

procedure TfrmMain.rowResEditPropertiesEditValueChanged(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := osMain;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 0 WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''AMBTALON_RESULT'') ';
    oq.Execute;
    if rowRes.Properties.Value <> 0 then
      begin
	      oq.DeleteVariables;
	      oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 1 WHERE FK_ID = :PFK_ID ';
	      oq.DeclareAndSet('PFK_ID', otInteger, rowRes.Properties.Value);
	      oq.Execute;
      end;
    osMain.Commit;
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.rowShow3DEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''DICOM_SHOW_3D'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DICOM_SHOW_3D'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''DICOM_SHOW_3D'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowShow3D.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowShowAddEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''XRAY_SHOW_ADD'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_SHOW_ADD'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''XRAY_SHOW_ADD'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowShowAdd.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowShowAgreeEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''SHOW_AGREE_PACIENT'') '+#13+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''SHOW_AGREE_PACIENT'' '+#13+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''SHOW_AGREE_PACIENT'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowShowAgree.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowShowDolgTalonEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''XRAY_SHOW_DOLGTALON'') '+#13+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_SHOW_DOLGTALON'' '+#13+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''XRAY_SHOW_DOLGTALON'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowShowDolgTalon.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowShowDsEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''XRAY_SHOW_DS'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_SHOW_DS'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''XRAY_SHOW_DS'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowShowDs.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowShowHandEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''XRAY_SHOW_ONHAND'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_SHOW_ONHAND'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''XRAY_SHOW_ONHAND'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowShowHand.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowShowInsPicEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''XRAY_SHOW_INSPIC'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_SHOW_INSPIC'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''XRAY_SHOW_INSPIC'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowShowInsPic.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowShowPassEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''SHOW_BUTTON_PASS'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''SHOW_BUTTON_PASS'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''SHOW_BUTTON_PASS'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowShowPass.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowShowPrintEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''XRAY_MORE_PRINT'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_MORE_PRINT'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''XRAY_MORE_PRINT'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowShowPrint.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowShowRecomEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''XRAY_SHOW_RECOM'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_SHOW_RECOM'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''XRAY_SHOW_RECOM'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowShowRecom.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowShowSnimkiEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''SHOW_DICOM'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''SHOW_DICOM'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''SHOW_DICOM'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowShowSnimki.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowShowSpeedEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''XRAY_SHOW_SPEEDKONTRAST'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_SHOW_SPEEDKONTRAST'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''XRAY_SHOW_SPEEDKONTRAST'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowShowSpeed.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowShowWorkEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''XRAY_SHOW_WORK'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_SHOW_WORK'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''XRAY_SHOW_WORK'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowShowWork.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowSpellEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''XRAY_CHECK_SPELL'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_CHECK_SPELL'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''XRAY_CHECK_SPELL'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowSpell.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowStandartEditPropertiesEditValueChanged(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := osMain;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 0 WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''CPD_STANDARTGROUP'') ';
    oq.Execute;
    if rowStandart.Properties.Value <> 0 then
      begin
	      oq.DeleteVariables;
	      oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 1 WHERE FK_ID = :PFK_ID ';
	      oq.DeclareAndSet('PFK_ID', otInteger, rowStandart.Properties.Value);
	      oq.Execute;
      end;
    osMain.Commit;
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.rowSumDozaEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''XRAY_SUMDOZA'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_SUMDOZA'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''XRAY_SUMDOZA'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, TcxButtonEdit(VerGrMain.InplaceEditor).EditingText);
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
  TcxButtonEdit(VerGrMain.InplaceEditor).Properties.Buttons.Items[0].Enabled := False;
end;

procedure TfrmMain.rowSumDozaEditPropertiesChange(Sender: TObject);
begin
  TcxButtonEdit(VerGrMain.InplaceEditor).Properties.Buttons.Items[0].Enabled := True;
end;

procedure TfrmMain.rowTargetEditPropertiesEditValueChanged(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := osMain;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 0 WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''ISSL_TARGET'') ';
    oq.Execute;
    if rowTarget.Properties.Value <> 0 then
      begin
	      oq.DeleteVariables;
	      oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 1 WHERE FK_ID = :PFK_ID ';
	      oq.DeclareAndSet('PFK_ID', otInteger, rowTarget.Properties.Value);
	      oq.Execute;
      end;
    osMain.Commit;
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.rowTargetFluEditPropertiesEditValueChanged(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''DEFAULT_TARGET'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DEFAULT_TARGET'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''DEFAULT_TARGET'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowTargetFlu.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowTargetTalonEditPropertiesEditValueChanged(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := osMain;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 0 WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''AMBTALON_REASON'') ';
    oq.Execute;
    if rowTargetTalon.Properties.Value <> 0 then
      begin
	      oq.DeleteVariables;
	      oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 1 WHERE FK_ID = :PFK_ID ';
	      oq.DeclareAndSet('PFK_ID', otInteger, rowTargetTalon.Properties.Value);
	      oq.Execute;
      end;
    osMain.Commit;
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.rowTypeVidEditPropertiesEditValueChanged(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := osMain;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 0 WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''TYPE_V_MU'') ';
    oq.Execute;
    if rowTypeVid.Properties.Value <> 0 then
      begin
	      oq.DeleteVariables;
	      oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 1 WHERE FK_ID = :PFK_ID ';
	      oq.DeclareAndSet('PFK_ID', otInteger, rowTypeVid.Properties.Value);
	      oq.Execute;
      end;
    osMain.Commit;
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.rowUrgentEditPropertiesEditValueChanged(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := osMain;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 0 WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''NAZN_TYPES'') ';
    oq.Execute;
    if rowUrgent.Properties.Value <> 0 then
      begin
	      oq.DeleteVariables;
	      oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 1 WHERE FK_ID = :PFK_ID ';
	      oq.DeclareAndSet('PFK_ID', otInteger, rowUrgent.Properties.Value);
	      oq.Execute;
      end;
    osMain.Commit;
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.rowVidOplatEditPropertiesEditValueChanged(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := osMain;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 0 WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''AMBTALON_OPL'') ';
    oq.Execute;
    if rowVidOplat.Properties.Value <> 0 then
      begin
      	oq.DeleteVariables;
	      oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 1 WHERE FK_ID = :PFK_ID ';
	      oq.DeclareAndSet('PFK_ID', otInteger, rowVidOplat.Properties.Value);
	      oq.Execute;
      end;
    osMain.Commit;
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.rowVidOplFluEditPropertiesEditValueChanged(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''DEFAULT_VID_OPLAT'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DEFAULT_VID_OPLAT'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''DEFAULT_VID_OPLAT'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowVidOplFlu.Properties.Value));
    ods.Open;
    osMain.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowVidPriemEditPropertiesEditValueChanged(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := osMain;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 0 WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_PRIEM'') ';
    oq.Execute;
    if rowVidPriem.Properties.Value <> 0 then
      begin
	      oq.DeleteVariables;
	      oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 1 WHERE FK_ID = :PFK_ID ';
	      oq.DeclareAndSet('PFK_ID', otInteger, rowVidPriem.Properties.Value);
	      oq.Execute;
      end;
    osMain.Commit;
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.rowVidSnimokEditPropertiesEditValueChanged(Sender: TObject);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := osMain;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 0 WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''VID_SNIMOK'') ';
    oq.Execute;
    if rowVidSnimok.Properties.Value <> 0 then
      begin
      	oq.DeleteVariables;
	      oq.SQL.Text := ' UPDATE ASU.TSMID SET FK_DEFAULT = 1 WHERE FK_ID = :PFK_ID ';
	      oq.DeclareAndSet('PFK_ID', otInteger, rowVidSnimok.Properties.Value);
	      oq.Execute;
      end;
    osMain.Commit;
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.rowWLInUseEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := osMain;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''XRAY_USE_WL'') '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''XRAY_USE_WL'' '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''XRAY_USE_WL'', :PFC_VALUE) ';
    ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(rowWLInUse.Properties.Value));
    ods.Open;
    osMain.Commit;

    rowPortWL.Visible := rowWLInUse.Properties.Value = -1;
    rowIPWL.Visible := rowWLInUse.Properties.Value = -1;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.rowZavEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
//--- Выбираем заведующего отделением
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetZavOtdel, frmSetZavOtdel);
      try
        if frmSetZavOtdel.odsZavOtdel.Active = False then
          frmSetZavOtdel.odsZavOtdel.Open;
        frmSetZavOtdel.odsZavOtdel.Locate('FC_NAME', TcxButtonEdit(VerGrMain.InplaceEditor).EditingText, []);
        frmSetZavOtdel.ShowModal;
        if frmSetZavOtdel.ModalResult = mrOk then
          begin
            TcxButtonEdit(VerGrMain.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(VerGrMain.InplaceEditor).EditingText := frmSetZavOtdel.odsZavOtdel.FieldByName('FC_NAME').AsString;
            TcxButtonEdit(VerGrMain.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            rowZav.Tag := frmSetZavOtdel.odsZavOtdel.FieldByName('FK_ID').AsInteger;
            ods := TOracleDataSet.Create(nil);
            try
	            ods.Session := osMain;
	            ods.Cursor := crSQLWait;
     	        ods.SQL.Text := ' MERGE INTO ASU.TSMINI USING DUAL ON (FC_KEY = ''ZAV_XRAY'') '+#13#10+
                              ' WHEN MATCHED THEN UPDATE SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''ZAV_XRAY'' '+#13#10+
                              ' WHEN NOT MATCHED THEN INSERT (FC_SECTION, FC_KEY, FC_VALUE) VALUES(''XRAY'', ''ZAV_XRAY'', :PFC_VALUE) ';
	            ods.DeclareAndSet('PFC_VALUE', otString, IntToStr(frmSetZavOtdel.odsZavOtdel.FieldByName('FK_ID').AsInteger));
	            ods.Open;
	            osMain.Commit;
            finally
          	  ods.Free;
            end;
          end;
      finally
        frmSetZavOtdel.Free;
      end;
    end;
//--- Удаляем настройку "Зав. отделением"
  if AButtonIndex = 1 then
    begin
      if Application.MessageBox('Удаление настройки заведующего рентгенотделением может привести к некорректной работе программы!'+#13+
   		                    	    'Вы действительно хотите удалить настройку?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = mrYes then
        begin
          oq := TOracleQuery.Create(nil);
          try
	          oq.Session := osMain;
	          oq.Cursor := crSQLWait;
	          oq.SQL.Text := ' DELETE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''ZAV_XRAY'' ';
	          oq.Execute;
	          osMain.Commit;
            TcxButtonEdit(VerGrMain.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(VerGrMain.InplaceEditor).EditingText := '';
            TcxButtonEdit(VerGrMain.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          finally
	          oq.Free;
          end;
        end;
    end;
end;

procedure TfrmMain.tvTreeChange(Sender: TObject; Node: TTreeNode);
begin
  if Node.StateIndex = 0 then
    cxPage.ActivePageIndex := 0;
  if Node.StateIndex = 1 then
    cxPage.ActivePageIndex := 1;
  if Node.StateIndex = 2 then
    cxPage.ActivePageIndex := 2;
  if Node.StateIndex = 3 then
    cxPage.ActivePageIndex := 3;
  if Node.StateIndex = 4 then
    cxPage.ActivePageIndex := 4;
  if Node.StateIndex = 5 then
    cxPage.ActivePageIndex := 5;
  if Node.StateIndex = 6 then
    begin
      cxPage.ActivePageIndex := 6;
      pcDicom1.ActivePageIndex := 0;
    end;
  if Node.StateIndex = 7 then
    cxPage.ActivePageIndex := 7;
  if Node.StateIndex = 8 then
    cxPage.ActivePageIndex := 8;
  if Node.StateIndex = 9 then
    cxPage.ActivePageIndex := 9;
  if Node.StateIndex = 10 then
    cxPage.ActivePageIndex := 10;
end;

procedure TfrmMain.VerGrMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
//  if Key = VK_RETURN then //!!! убрали временно при нажатии когда находимся не в режиме редактирования - AV
//    begin
//      if rowPhone.Focused = True then
//        begin
//          rowPhoneEditPropertiesButtonClick(nil, 0);
//        end;
//    end;
end;

procedure TfrmMain.vGrDicomKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
//  if Key = VK_RETURN then //!!! убрали временно при нажатии когда находимся не в режимередактирования - AV
//    begin
//      if (rowPort.Focused = True) and (TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled = True) then
//        begin
//          rowPortEditPropertiesButtonClick(nil, 0);
//        end;
//      if (rowIP.Focused = True) and (TcxButtonEdit(vGrDicom.InplaceEditor).Properties.Buttons.Items[0].Enabled = True) then
//        begin
//          rowIPEditPropertiesButtonClick(nil, 0);
//        end;
//    end;
end;

end.
