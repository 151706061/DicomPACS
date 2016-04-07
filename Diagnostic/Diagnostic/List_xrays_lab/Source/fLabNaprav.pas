unit fLabNaprav;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, //RVScroll, RichView, RVEdit,
  ExtCtrls, ImgList, ActnList,
  Oracle, StdCtrls, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxRadioGroup, cxGroupBox,
  cxGraphics, OracleData, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  DB, cxSpinEdit, cxCheckGroup, cxCustomData, cxStyles, cxTL,
  cxInplaceContainer, cxTLData, cxDBTL, cxCurrencyEdit, jvDBUtils, cxCheckBox,
  frxClass, cxTimeEdit, DateUtils, cxMemo, cxFilter, cxData, cxDataStorage,
  cxDBData, cxButtonEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Buttons, frxDBSet, Grids, DBGrids, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, dxSkinsdxBarPainter, Menus, cxLookAndFeelPainters,
  cxButtons, cxBarEditItem, HL7Sender, uigTranslit, uMD5;

type
  TLoadAgree = procedure (AppHandle : Integer; pPeopleID: Integer; pSotr: Integer); stdcall;
  TGetDllHandle = function(): THandle; stdcall;
  TIsAddrChanged = function(): Boolean; stdcall;
  TCreateAddrDLL = function(Panel_HND, App_HND: THandle; Ssn: pointer): Boolean; stdcall;
  TAddAddr = procedure(PeopleID: Integer; pAddrType: Integer); stdcall;
  TEditAddr = procedure(AddressID: Integer); stdcall;
  TResizeAddrDll = procedure(Panel_HND: THandle); stdcall;
  TMoveAddrDll = procedure; stdcall;
  TSaveAddrChanges = function(): Integer; stdcall;
  TCommitAddrChanges = procedure(); stdcall;
  TCancelAddrChanges = procedure(); stdcall;
  TFreeAddrDll = procedure(); stdcall;
  TCloseAddrDropDown = procedure(); stdcall;
  TGetAddrText = function(): PChar; stdcall;

  TfrmLabNaprav = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    pnlMain: TPanel;
    al: TActionList;
    paFIO: TPanel;
    paSex: TPanel;
    cxLabel2: TcxLabel;
    cxMale: TcxRadioButton;
    cxFemale: TcxRadioButton;
    cxdeRojd: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    bbSave: TdxBarButton;
    aSave: TAction;
    bbCancel: TdxBarButton;
    aCancel: TAction;
    paAddress: TPanel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    paDS: TPanel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    paUrgent: TPanel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    paMetodics: TPanel;
    cxVidOplat: TcxLookupComboBox;
    odsVidOplat: TOracleDataSet;
    dsVidOplat: TDataSource;
    cxUrgent: TcxLookupComboBox;
    dsUrgent: TDataSource;
    odsUrgent: TOracleDataSet;
    cxNadbavka: TcxLookupComboBox;
    dsNadbavka: TDataSource;
    odsNadbavka: TOracleDataSet;
    odsRegPrin: TOracleDataSet;
    dsRegPrin: TDataSource;
    cxProjivaet: TcxLookupComboBox;
    cxKorennoe: TcxLookupComboBox;
    dsKorennoe: TDataSource;
    odsKorennoe: TOracleDataSet;
    cxTarget: TcxLookupComboBox;
    odsTarget: TOracleDataSet;
    dsTarget: TDataSource;
    cxVrach: TcxTextEdit;
    odsVidDoc: TOracleDataSet;
    dsTypePlenka: TDataSource;
    odsTypePlenka: TOracleDataSet;
    odsVvod: TOracleDataSet;
    dsVvod: TDataSource;
    Panel7: TPanel;
    paLaborant: TPanel;
    cxCheckGroup2: TcxCheckGroup;
    cxLabel25: TcxLabel;
    cxKolvoVidano: TcxSpinEdit;
    cxLabel26: TcxLabel;
    cxRemark: TcxTextEdit;
    cxTreeTypeKontrast: TcxDBTreeList;
    dsTypeKontrast: TDataSource;
    odsTypeKontrast: TOracleDataSet;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    odsSnimokVid: TOracleDataSet;
    dsSnimokVid: TDataSource;
    cxLabel28: TcxLabel;
    cxRgLaborant: TcxLookupComboBox;
    odsRgLaborant: TOracleDataSet;
    dsRgLaborant: TDataSource;
    cxCheckGroup3: TcxCheckGroup;
    cxLabel29: TcxLabel;
    cxNumDisk: TcxTextEdit;
    cxLabel30: TcxLabel;
    cxCifraArchive: TcxLookupComboBox;
    odsCifraArchive: TOracleDataSet;
    dsCifraArchive: TDataSource;
    cxDateVydano: TcxDateEdit;
    cxDateVozvrat: TcxDateEdit;
    cxLabel31: TcxLabel;
    cxLabel32: TcxLabel;
    cxLabel: TcxLabel;
    cxOtdelVydano: TcxLookupComboBox;
    dsOtdelVydano: TDataSource;
    odsOtdelVydano: TOracleDataSet;
    bbPrint: TdxBarButton;
    aPrint: TAction;
    bbHistory: TdxBarButton;
    aHistory: TAction;
    cxLabel33: TcxLabel;
    cxNumKorob: TcxTextEdit;
    cxdeDateProtocol: TcxDateEdit;
    cxteTimeProtocol: TcxTimeEdit;
    odsColor: TOracleDataSet;
    dsColor: TDataSource;
    odsKemNapravlen: TOracleDataSet;
    dsKemNapravlen: TDataSource;
    cxDS: TcxMemo;
    cxOnPhone: TcxCheckBox;
    cxlKontaktPhone: TcxLabel;
    cxTelefon: TcxTextEdit;
    dsListNaz: TDataSource;
    odsListNaz: TOracleDataSet;
    odsListNazROWNUM: TFloatField;
    odsListNazFK_DOCID: TFloatField;
    odsListNazFK_NAZSOSID: TFloatField;
    odsListNazFK_ID: TFloatField;
    odsListNazFC_NAME: TStringField;
    odsListNazFK_SMID: TFloatField;
    odsListNazDOZA: TFloatField;
    odsListNazTIME: TFloatField;
    odsListNazKOLVO: TFloatField;
    odsListNazKOLVOPRSV: TFloatField;
    frxDBDataset1: TfrxDBDataset;
    odsListNazFC_TYPE: TStringField;
    odsListNazVID_SNIMOK: TFloatField;
    odsListNazTYPEPLENKA: TFloatField;
    cxColor: TcxLookupComboBox;
    frxReport1: TfrxReport;
    cxDisp: TcxCheckBox;
    cxLbDays: TcxLabel;
    cxCompDogovor: TcxLookupComboBox;
    odsCompanyName: TOracleDataSet;
    dsCompanyName: TDataSource;
    cxDez: TcxCheckBox;
    odsKolvoListov: TOracleDataSet;
    dsKolvoListov: TDataSource;
    odsListNazKOLVOLISTOV: TFloatField;
    odsKtoKontrast: TOracleDataSet;
    dsKtoKontrast: TDataSource;
    aZakl: TAction;
    cxLabel1: TcxLabel;
    cxFam: TcxTextEdit;
    cxName: TcxTextEdit;
    cxOtch: TcxTextEdit;
    cxLabel16: TcxLabel;
    cxLabel18: TcxLabel;
    cxLabel21: TcxLabel;
    cxLabel15: TcxLabel;
    cxNumIssl1: TcxTextEdit;
    cxReanim: TcxLabel;
    Panel1: TPanel;
    cxGrListNaz: TcxGrid;
    TVListNaz: TcxGridDBTableView;
    VROWNUM: TcxGridDBColumn;
    VSNIMOK: TcxGridDBColumn;
    VPROS: TcxGridDBColumn;
    VDOZA: TcxGridDBColumn;
    VNAMEISSL: TcxGridDBColumn;
    VTIME: TcxGridDBColumn;
    VVIDSNIMOK: TcxGridDBColumn;
    VTYPEPLENKA: TcxGridDBColumn;
    VKOLVOLISTOV: TcxGridDBColumn;
    cxGrListNazLevel1: TcxGridLevel;
    bbZakl: TcxButton;
    bDel: TcxButton;
    bAdd: TcxButton;
    cxLabel22: TcxLabel;
    cxLabel23: TcxLabel;
    cxLabel24: TcxLabel;
    cxLabel27: TcxLabel;
    cxCheckGroup1: TcxCheckGroup;
    cxLabel17: TcxLabel;
    cxTypeKontrast: TcxPopupEdit;
    cxLabel19: TcxLabel;
    cxLabel20: TcxLabel;
    cxVvod: TcxLookupComboBox;
    cxLabel14: TcxLabel;
    cxKtoKontrast: TcxLookupComboBox;
    cxLabel34: TcxLabel;
    cxLabel35: TcxLabel;
    bVozrast: TcxButton;
    cxAge: TcxLabel;
    cxAddress: TMemo;
    frxRep_4OBTC: TfrxReport;
    cxNum: TcxTextEdit;
    cxLabel36: TcxLabel;
    lbCompany: TcxLabel;
    cxKem: TcxPopupEdit;
    odsListNazFK_VRACHID: TFloatField;
    odsListNazFK_NAZTYPEID: TFloatField;
    bbAgree: TdxBarButton;
    aAgree: TAction;
    cxLabel37: TcxLabel;
    cxKrat: TcxLookupComboBox;
    odsKrat: TOracleDataSet;
    dsKrat: TDataSource;
    paFilter: TPanel;
    cxKemNapravlen: TcxDBTreeList;
    cxDBTreeListColumn1: TcxDBTreeListColumn;
    Panel2: TPanel;
    cxLabel38: TcxLabel;
    teFilter: TcxTextEdit;
    bbInfo: TdxBarButton;
    aInfo: TAction;
    lbKons: TcxLabel;
    lbDoza: TcxBarEditItem;
    aSearchDs: TAction;
    aCompare: TAction;
    odsListNazMODALITYNAME: TStringField;
    HL7Sender1: THL7Sender;
    odsCntOut: TOracleDataSet;
    odsListNazFK_RESULTID: TFloatField;
    odsListNazFK_ROOMID: TIntegerField;
    cxKolvoKontrast: TcxCurrencyEdit;
    lbSpeed1: TcxLabel;
    ceSpeed: TcxCurrencyEdit;
    lbSpeed2: TcxLabel;
    lbVyp1: TcxLabel;
    lbVyp2: TcxLabel;
    frxRep_4SOKB: TfrxReport;
    frAgreeProc: TfrxReport;
    dxBarPopupMenu1: TdxBarPopupMenu;
    aAgreeProc: TAction;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    bbSend: TdxBarButton;
    aSendToWL: TAction;
    chbVoenkomat: TcxCheckBox;
    VAccessionNumber: TcxGridDBColumn;
    fc_accessionnumber: TStringField;
    TransferSyntaxVListNazColumn1: TcxGridDBColumn;
    frxReport2: TfrxReport;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    aAgreeSurgery1: TAction;
    aAgreeTomoContrast1: TAction;
    aAgreeMRT1: TAction;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure cxKorennoePropertiesChange(Sender: TObject);
    procedure cxFamClick(Sender: TObject);
    procedure cxFamEnter(Sender: TObject);
    procedure cxNameClick(Sender: TObject);
    procedure cxNameEnter(Sender: TObject);
    procedure cxOtchClick(Sender: TObject);
    procedure cxOtchEnter(Sender: TObject);
    procedure cxDSClick(Sender: TObject);
    procedure cxDSEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure odsVidDocBeforeOpen(DataSet: TDataSet);
    procedure cxTreeTypeKontrastDblClick(Sender: TObject);
    procedure cxNadbavkaPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxTreeTypeKontrastKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxOnPhonePropertiesChange(Sender: TObject);
    procedure cxdeRojdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aPrintExecute(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure aHistoryExecute(Sender: TObject);
    procedure VNAMEISSLPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure odsListNazBeforeOpen(DataSet: TDataSet);
    procedure odsListNazApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
    procedure bbZaklClick(Sender: TObject);
    procedure odsListNazAfterOpen(DataSet: TDataSet);
    procedure VVIDSNIMOKPropertiesChange(Sender: TObject);
    procedure cxVidOplatPropertiesChange(Sender: TObject);
    procedure aZaklExecute(Sender: TObject);
    procedure bAddClick(Sender: TObject);
    procedure bDelClick(Sender: TObject);
    procedure odsRgLaborantBeforeOpen(DataSet: TDataSet);
    procedure bVozrastClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure frxRep_4OBTCGetValue(const VarName: string; var Value: Variant);
    procedure cxKemNapravlenDblClick(Sender: TObject);
    procedure cxKemNapravlenKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TVListNazFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure aAgreeExecute(Sender: TObject);
    procedure teFilterClick(Sender: TObject);
    procedure teFilterEnter(Sender: TObject);
    procedure teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxNumIssl1Click(Sender: TObject);
    procedure cxNumIssl1Enter(Sender: TObject);
    procedure cxNumIssl1KeyPress(Sender: TObject; var Key: Char);
    procedure aInfoExecute(Sender: TObject);
    procedure cxFamKeyPress(Sender: TObject; var Key: Char);
    procedure cxNameKeyPress(Sender: TObject; var Key: Char);
    procedure cxOtchKeyPress(Sender: TObject; var Key: Char);
    procedure aSearchDsExecute(Sender: TObject);
    procedure aCompareExecute(Sender: TObject);
    procedure HL7Sender1ACKResponse(Sender: TObject);
    procedure ceSpeedPropertiesChange(Sender: TObject);
    procedure frxRep_4SOKBGetValue(const VarName: string; var Value: Variant);
    procedure aAgreeProcExecute(Sender: TObject);
    procedure frAgreeProcGetValue(const VarName: string; var Value: Variant);
    procedure aSendToWLExecute(Sender: TObject);
    procedure frxReport2GetValue(const VarName: string; var Value: Variant);
    procedure cxNumIssl1PropertiesChange(Sender: TObject);
    procedure cxNumIssl1Exit(Sender: TObject);
    procedure aAgreeSurgery1Execute(Sender: TObject);
    procedure aAgreeTomoContrast1Execute(Sender: TObject);
    procedure aAgreeMRT1Execute(Sender: TObject);
  private
    isSpeed : Boolean;
    idTalon : Integer;
    isKonsult : Boolean; // является ли услуга консультативной
    id4NewPacAddress : Integer; //--> для КЛАДРа
    HandleDLL: THandle;
    GetDllHandle: TGetDllHandle;
    IsAddrChanged: TIsAddrChanged;
    CreateAddrDLL: TCreateAddrDLL;
    AddAddr: TAddAddr;
    EditAddr: TEditAddr;
    ResizeAddrDll: TResizeAddrDll;
    MoveAddrDll: TMoveAddrDll;
    SaveAddrChanges: TSaveAddrChanges;
    CommitAddrChanges: TCommitAddrChanges;
    CancelAddrChanges: TCancelAddrChanges;
    FreeAddrDll: TFreeAddrDll;
    CloseAddrDropDown: TCloseAddrDropDown;
    GetAddrText : TGetAddrText;
    l_addr_loaded: Boolean; //<--
    Russian : HKL;
    strMetods : string;
    function fGetIB(var nIBIDf, nIBYf: Integer): boolean;
    procedure DoSetEditRights;
    procedure DoCompanyDogovor;
    procedure DoBlockLaborant;
    procedure DoGetAddress;
    procedure DoUpdateAddress(nIDPepl : Integer);
    procedure DoInsertProjivaet(nPacID : Integer);
    procedure DoInsertKorennoe(nIDPepl : Integer);
    function GetLastTalonID(App_HND: THandle; OS: TORacleSession; pPacID, pSotrID, pTalonID : Integer) : integer;
    procedure DoCheckUslugKonsult;
    procedure InsertKonsultUslug(nNazid : Integer);
    procedure DoUpdateTalon(nIDPAC : Integer);
    procedure DoSumDoza;
    procedure DoAddWLM;
    procedure DoSpeedKontrast;
    { Private declarations }
  public
    EDIT_MODE : Boolean;
    pAMBUL, pPACID, pPEPLID, pOTDELID, pTypeDocID, pSMIDID, pNAZID, pDOCID : Integer;
    sNUMBERISSL,
    vAccessionNumberOLD,
    IDDOCID, GET_DB_NAME : String;
    pDOCOBSLID : Integer;
    nIBID, nIBY,
    VFK_NAZSOSID : Integer;
    procedure DoShowForm(nAmbul, nPACID, nPEPLID : Integer; strFIO : String; nOTDELID, nSMIDID : Integer; nNAZID : Integer=0; nREANIM : Integer=0; nDOCID : Integer=0; nNUMBERISSL : String='');
    procedure DoTextTypeAmbul;
    procedure DoTextTypeStac;
    procedure DoTextTypeFIO(strFIO : String);
    function DoCheckParameters : Integer;
    procedure CheckEnabledControls;
    procedure DoTextTypeNaprav;
    procedure DoInsertEditParametersNaz;
    procedure DoTextParametersNaz;
    procedure DoKemNapravlen;
    procedure DoUpdatePacIDNaz(nIDPAC : Integer);
    procedure DoNumberDisc;
    procedure DoPodpis;
    procedure DoDates;
    procedure DoProjivaet;
    procedure DoVidOplat;
    procedure DoTarget;
    procedure DoUpdateNumIssl;
    function  DoGetNumIssl:string;
    procedure DoGetLaborant;
    procedure DoVrachNapravil;
    function GetNumber : String;
    procedure DoUrgent;
    { Public declarations }
  end;

var
  frmLabNaprav: TfrmLabNaprav;

implementation

uses fMain, fAllHistory, fNazRgOne1, fProsmotrZakl, fPacInfo, fCompare;

{$R *.dfm}

procedure TfrmLabNaprav.DoSetEditRights;
var ods : TOracleDataSet;
    kolvoParam : Integer;
    kolvoDays : Integer;
begin
  if EDIT_MODE = True then
    begin
  if frmMain.bIsAdmin <> 1 then 
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        if frmMain.nEditDaysOtdel = 0 then
          begin
            ods.SQL.Text := ' SELECT FC_VALUE FROM asu.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''KOLVODAYS_EDIT'' ';
            ods.Open;
            kolvoParam := StrToInt(ods.FieldByName('FC_VALUE').AsString);
          end else
          begin
            kolvoParam := frmMain.nEditDaysOtdel;
          end;
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' SELECT ROUND(SYSDATE - (SELECT MAX(FD_DATE) FROM asu.TPODPISNAZ WHERE FK_SOS = asu.GET_LABVIP AND FK_NAZID = :PFK_NAZID)) AS CNT FROM asu.TNAZIS WHERE FK_ID = :PFK_NAZID ';
        ods.DeclareAndSet('PFK_NAZID', otInteger, pNAZID);
        ods.Open;
        kolvoDays := ods.FieldByName('CNT').AsInteger;
        if KolvoDays >= kolvoParam then
          begin
            cxLbDays.Visible := True;
            cxLbDays.Caption := ' Прошло более '+IntToStr(KolvoParam)+' суток с даты заполнения направления! Изменить направление нельзя! ';
            if (cxOnPhone.Checked) and (pAmbul = 1) then
              begin
                cxFam.Enabled := True;
                cxName.Enabled := True;
                cxOtch.Enabled := True;
                cxdeRojd.Enabled := True;
                cxMale.Enabled := True;
                cxFemale.Enabled := True;
                paFIO.Enabled := True;
                paSex.Enabled := True;
              end else
              begin
                cxFam.Enabled := False;
                cxName.Enabled := False;
                cxOtch.Enabled := False;
                cxdeRojd.Enabled := False;
                cxMale.Enabled := False;
                cxFemale.Enabled := False;
                paFIO.Enabled := False;
                paSex.Enabled := False;
              end;
            paAddress.Enabled := False;
            paDS.Enabled := False;
            paMetodics.Enabled := False;
            paUrgent.Enabled := False;
            paLaborant.Enabled := False;
            cxTypeKontrast.Enabled := False;
            cxKolvoKontrast.Enabled := False;
            cxVvod.Enabled := False;
//            cxNumDisk.Enabled := False;
//            cxNumKorob.Enabled := False;
//            cxCifraArchive.Enabled := False;
            cxKtoKontrast.Enabled := False;
          end else
          begin
            cxLbDays.Visible := False;
            cxLbDays.Caption := '';
            if (cxOnPhone.Checked) and (pAmbul=1) then
              begin
                cxFam.Enabled := True;
                cxName.Enabled := True;
                cxOtch.Enabled := True;
                cxdeRojd.Enabled := True;
                cxMale.Enabled := True;
                cxFemale.Enabled := True;
                paFIO.Enabled := True;
                paSex.Enabled := True;
              end else
              begin
                cxFam.Enabled := False;
                cxName.Enabled := False;
                cxOtch.Enabled := False;
                cxdeRojd.Enabled := False;
                cxMale.Enabled := False;
                cxFemale.Enabled := False;
                paFIO.Enabled := False;
                paSex.Enabled := False;
              end;
            paFIO.Enabled := True;
            paSex.Enabled := True;
            paAddress.Enabled := True;
            paDS.Enabled := True;
            paMetodics.Enabled := True;
            paUrgent.Enabled := True;
            paLaborant.Enabled := True;
            cxTypeKontrast.Enabled := True;
            cxKolvoKontrast.Enabled := True;
            cxVvod.Enabled := True;
            cxNumDisk.Enabled := True;
            cxNumKorob.Enabled := True;
            cxCifraArchive.Enabled := True;
            cxKtoKontrast.Enabled := True;
          end;
      finally
        ods.Free;
      end;
    end;
    end;
end;

procedure TfrmLabNaprav.DoShowForm(nAMBUL, nPACID, nPEPLID : Integer; strFIO : String; nOTDELID, nSMIDID : Integer; nNAZID : Integer; nREANIM : Integer; nDOCID : Integer; nNUMBERISSL : String);
var v_nums, v_d, v_m : string;
function f_gtTSMINI ( p_key : string; p_section : string ) : string;
var v_OraclePackage : TOraclePackage;
begin
  v_OraclePackage := TOraclePackage.Create(nil);
  try
    v_OraclePackage.Session := frmMain.os;
    v_OraclePackage.PackageName:='asu.PKG_SMINI';
    try
      Result:=v_OraclePackage.CallStringFunction('READSTRING',[p_key,p_section,'']);
    except
      on E:Exception do
        MessageDlg('Ошибка '+E.Message, mtError, [mbOK], 0);
    end;
  finally
    v_OraclePackage.Free;
  end;
end;
begin
  try
    Cursor := crSQLWait;
    bVozrast.Visible := cxdeRojd.Enabled;
    pAMBUL := nAMBUL;
    pPACID := nPACID;
    pPEPLID := nPEPLID;
    pOTDELID := nOTDELID;
    pSMIDID := nSMIDID;
    pNAZID := nNAZID;
    pDOCID := nDOCID;
    sNUMBERISSL := nNUMBERISSL;
    if odsListNaz.Active = False then
      odsListNaz.Open;

    cxDisp.Visible := (frmMain.odsKab.FieldByName('fk_id').AsInteger = frmMain.GET_XRAY_MAMMOGRAF) or (frmMain.odsKab.FieldByName('fk_id').AsInteger = frmMain.GET_XRAY_MAMMOGRAF2); //Диспансеризация
    if pPACID = 0 then
      begin
        With TOracleDataSet.Create(nil) do
          try
            Session := frmMain.os;
            SQL.Text := ' select tuslvid.fk_id '+#13+
                            '   from asu.tuslvid, asu.totdel_typedoc '+#13+
                            '  where fl_default = 1 '+#13+
                            '    and totdel_typedoc.fk_typedoc=tuslvid.fk_id '+#13+
                            '    and totdel_typedoc.fk_otdelid = :potdelid and rownum = 1 ';
            DeclareAndSet('potdelid', otInteger, pOTDELID);
            Open;
            if not Eof then
              pTypeDocID := FieldByName('fk_id').AsInteger
            else
              pTypeDocID := -1;  
          finally
            Free;
          end;
      end else
      begin
        if odsVidDoc.Active = FALSE then
          odsVidDoc.Open;
        pTypeDocID := odsVidDoc.FieldByName('fk_viddocid').AsInteger;
      end;
    case pAMBUL of
    0: DoTextTypeStac;  // стационарный
    1: DoTextTypeAmbul; // амбулаторный
    end;
    if nREANIM = 1 then
      cxReanim.Caption := 'В РЕАНИМАЦИИ!'
    else
      cxReanim.Caption := '';
    DoVidOplat;
    DoSpeedKontrast;
    DoProjivaet;
    DoTarget;
    DoDates;
    DoGetLaborant;
    DoVrachNapravil;
    DoCompanyDogovor;
    DoCheckUslugKonsult; // проверка на то является ли услуга консультативной и определение идешника талона
    DoSumDoza;
    if pPACID = 0 then
      DoTextTypeFIO(strFIO);
    if pNAZID <> 0 then
      begin
        DoTextTypeNaprav;
        DoTextParametersNaz;
      end else
      begin
        DoUrgent;
      end;
    DoBlockLaborant;
    DoSetEditRights;
    DoNumberDisc;
    aAgree.Visible := pPACID <> 0; // если нажали кнопку "Новый" то кнопку "Согласие" не показываем
    if v_db_lpu = 'SO' then
    begin  //  aAgree
      dxBarButton1.Visible        := ivNever;
      aAgreeProc.Visible          := False;
    end;

  {  if fileexists(ExtractFilePath(ParamStr(0))+'\testdicom.dat') then
    begin
      Showmessage('Файл '+ExtractFilePath(ParamStr(0))+'\testdicom.dat'+' существует');
    end else
    begin
      Showmessage('Файл '+ExtractFilePath(ParamStr(0))+'\testdicom.dat'+' не существует');
    end;   }

    aSendToWL.Visible := (odsListNaz.RecordCount <> 0) and
                         ( (frmMain.get_use_wl = '-1') or
                           (f_gtTSMINI('DLL_WORKLIST_NAZN','MYWORKLIST_USE')='1') or
                           fileexists(ExtractFilePath(ParamStr(0))+'\testdicom.dat') ); // Отправка на WL
    // проставим номер исследования если пустой
    if ( (USE_ONE_ACCESSIONNUMBER=1) and (frmMain.get_autogenAccNmb = 1) and (cxNumIssl1.Text=''))
    then
    begin
      with TOracleQuery.Create(nil) do
        try
          Session:=frmMain.os;
          SQL.Text:='select MED.SEQ_TANNMBSTR.NEXTVAL as f1 from dual';
          Execute;
          v_nums:=IntToStr(FieldAsInteger('f1'));
        finally
          Close;
          Free;
        end;
      v_d:=inttostr(DayOf(Date));
      if Length(v_d)=1 then v_d:='0'+v_d;
      v_m:=inttostr(Monthof(Date));
      if Length(v_m)=1 then v_m:='0'+v_d;
      //
      cxNumIssl1.Text:=v_nums+'/'+v_m;
    end;
  {  if ((USE_ONE_ACCESSIONNUMBER=1) and (VFK_NAZSOSID=2)) then
    begin
      cxNumIssl1.Text := ''
    end else if USE_ONE_ACCESSIONNUMBER=1 then
      cxNumIssl1.Text := sNUMBERISSL
    else
      cxNumIssl1.Text := DoGetNumIssl; }
  finally
    vAccessionNumberOLD := cxNumIssl1.Text;
    Cursor := crDefault;
  end;
end;

procedure TfrmLabNaprav.DoSpeedKontrast;
var ods : TOracleDataSet;
begin
  if ceSpeed.Visible = True then
    begin
      ods := TOracleDataSet.Create(nil);
      ods.Session := frmMain.os;
      ods.Cursor := crSQLWait;
      try
        ods.SQL.Text := ' select fn_num from asu.tib '+#13+
                        '  where fk_pacid = :pfk_pacid '+#13+
                        '    and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''XRAY_SPEEDKONTRAST'') ';
        ods.DeclareAndSet('pfk_pacid', otInteger, pNAZID);
        ods.Open;
        ceSpeed.Properties.OnChange := nil;
        ceSpeed.EditValue := ods.FieldByName('fn_num').AsFloat;
        ceSpeed.Properties.OnChange := ceSpeedPropertiesChange;
      finally
        ods.Free;
      end;
    end;
end;

procedure TfrmLabNaprav.DoSumDoza;
var ods : TOracleDataSet;
begin
  if pPacID <> 0 then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.SQL.Text := ' select sum(t1.fn_num) as SumDoza '+#13+
                        '   from asu.tib t1, asu.vnaz t2 '+#13+
                        '  where t1.fk_pacid = t2.fk_id '+#13+
                        '    and t1.fk_smid = -1 '+#13+
                        '    and t1.fk_smeditid = -1 '+#13+
                        '    and t2.fk_pacid in (select fk_id from asu.tambulance where fk_peplid = asu.get_peplid(:pfk_pacid) '+#13+
                        '                        union all '+#13+
                        '                        select fk_id from asu.tkarta where fk_peplid = asu.get_peplid(:pfk_pacid)) '+#13+
                        '    and t2.fk_nazsosid in (asu.get_vipnaz, asu.get_labvip) '+#13+
                        '    and t2.fd_run >= add_months(sysdate, -12) '+#13+ //to_date(to_char(sysdate, ''dd.mm'')||to_char(extract(year from sysdate)-1),''dd.mm.yyyy'') '+#13+
                        '    and t2.fd_run < to_date(sysdate)+1 ';
        ods.DeclareAndSet('pfk_pacid', otInteger, pPacID);
        ods.Open;
        if ods.FieldByName('SumDoza').AsFloat > frmMain.get_sum_doza then
          begin
            lbDoza.Visible := ivAlways;
            lbDoza.Caption := FloatToStr(ods.FieldByName('SumDoza').AsFloat)+' мЗв';
          end;
      finally
        ods.Free;
      end;
    end;
end;

procedure TfrmLabNaprav.DoTextTypeAmbul;
var ods : TOracleDataSet;
begin
  cxKem.Enabled := True;
  cxVrach.Enabled := True;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT COUNT(FK_ID) AS CNT FROM asu.TAMBULANCE WHERE FK_ID=:PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pPACID);
    ods.Open;
    if ods.FieldByName('CNT').AsInteger > 0 then
      begin
	      ods.Close;
	      ods.DeleteVariables;
	      ods.SQL.Text := ' SELECT FL_VOV, FL_IVOV, FL_ULA, FL_PMC, FC_PUT, FK_PRIZN, '+
			                  '        TPEOPLES.FC_FAM, TPEOPLES.FC_IM, TPEOPLES.FC_OTCH, '+
			                  '        DECODE(TO_CHAR(TPEOPLES.FD_ROJD, ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), TPEOPLES.FD_ROJD) FD_ROJD, '+
			                  '        TPEOPLES.FP_SEX, '+
                        '        GET_IB(:PFK_ID) AS NUMDOC, '+
                        '        PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TAMBULANCE.FK_ID) AS PACAGE, '+
                        '        TPEOPLES.FC_PHONE AS PHONE, '+
                        '        TAMBULANCE.FK_DOCOBSL, '+
                        '        (SELECT FK_SMID FROM TIB WHERE FK_PACID = :PFK_PEPLID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''KOREN_NASEL''))) AS KOREN '+
                        '   FROM TAMBULANCE, TPEOPLES '+
                        '  WHERE TAMBULANCE.FK_ID=:PFK_ID AND TPEOPLES.FK_ID=:PFK_PEPLID ';
        ods.DeclareAndSet('PFK_ID', otInteger, pPACID);
        ods.DeclareAndSet('PFK_PEPLID', otInteger, pPEPLID);
        ods.Open;
        cxFam.Text := ods.FieldByName('FC_FAM').AsString;
        cxName.Text := ods.FieldByName('FC_IM').AsString;
				cxOtch.Text := ods.FieldByName('FC_OTCH').AsString;
        cxNum.Text := ods.FieldByName('NUMDOC').AsString;
        cxdeRojd.Date := ods.FieldByName('FD_ROJD').AsDateTime;
        cxAge.Caption := IntToStr(ods.FieldByName('PACAGE').AsInteger);
        cxTelefon.Text := ods.FieldByName('PHONE').AsString;
        cxKorennoe.Properties.OnChange := nil;
        cxKorennoe.EditValue := ods.FieldByName('KOREN').AsInteger;
        cxKorennoe.Properties.OnChange := cxKorennoePropertiesChange;
//------------------------------------------------------------------------------
        if ods.FieldByName('FP_SEX').AsInteger = 1 then
          cxMale.Checked := TRUE
        else
          cxFemale.Checked := TRUE;
        EDIT_MODE := TRUE;
      end else
      begin
        ods.Close;
        ods.DeleteVariables;
        ods.SQL.Text := ' DECLARE '+
	                      '   nTemp NUMBER; '+
                        ' BEGIN '+
                        '   :NDOCOBSLID:= SET_NEWIBNUM(:PFK_USLVIDID, nTemp); '+
                        '   SELECT TDOCOBSL.FK_NUMIB INTO :nFK_NUMIB FROM TDOCOBSL WHERE FK_ID = :NDOCOBSLID; '+
                        '   SELECT TO_CHAR(GET_YEARWORK) INTO :YEARWORK FROM DUAL; '+
                        ' END; ';
        ods.DeclareAndSet('PFK_USLVIDID', otInteger, pTypeDocID);
        ods.DeclareVariable('NDOCOBSLID', otInteger);
        ods.DeclareVariable('YEARWORK', otString);
        ods.DeclareVariable('nFK_NUMIB', otInteger);
        ods.Open;
        pDOCOBSLID := ods.GetVariable('NDOCOBSLID');
        cxNum.Text := IntToStr(ods.GetVariable('nFK_NUMIB'))+'/'+ods.GetVariable('YEARWORK');
        EDIT_MODE := FALSE;
      end;
  finally
    ods.Free;
  end;  
end;

procedure TfrmLabNaprav.aSaveExecute(Sender: TObject);
var oqIns, oqEdit, oq : TOracleQuery;
    ods, odsPepl : TOracleDataSet;
    IDPac : Integer;
    idPepl : Integer;
    odsAmb : TOracleDataSet;
    hAgree : Integer;
    LoadAgree : TLoadAgree;
    idTalon : Integer;
    v_okf : Boolean;
begin
  odsListNaz.DisableControls;
  if USE_ONE_ACCESSIONNUMBER=0 then
  begin
    if (frmmain.xray_chkUniqAccNmb=1) then
    begin
      odsListNaz.First;
      while not odsListNaz.Eof do
      begin
        with TOracleQuery.Create(nil) do
          try
            Session := frmMain.os;
            Cursor := crSQLWait;
            SQL.Text:='select 1 from ASU.TNAZIS where fc_accessionnumber=:p_fc_accessionnumber '+#10+
                      'and fk_id<>:p_fk_id and fc_accessionnumber is not null';
            DeclareAndSet('p_fc_accessionnumber',otString,odsListNaz.FieldByName('fc_accessionnumber').AsString);
            DeclareAndSet('p_fk_id',otInteger,odsListNaz.FieldByName('fk_id').AsInteger);
            Execute;
            v_okf:=Eof;
          finally
            Close;
            Free;
          end;
        if not v_okf then Break;
        odsListNaz.Next;
      end;
      odsListNaz.EnableControls;
      if (not v_okf) then
      begin
        MessageDlg( 'Измените номер протокола.'+#13+#10+
                    'Запись с номером '+odsListNaz.FieldByName('fc_accessionnumber').AsString+' существует.', mtError, [mbOK], 0);
        Exit;
      end;
    end;
  end else if (Trim(cxNumIssl1.Text)='') then
  begin
    MessageDlg('Не задан  номер протокола ...', mtWarning, [mbOK], 0);
    SetFocusedControl(cxNumIssl1);
    Exit;
  end;
  if USE_ONE_ACCESSIONNUMBER=1 then // вставим проверку что нет дубля номера протокола в соседней группе
  begin
    with TOracleQuery.Create(nil) do
    try
      Session := frmMain.os;
      Cursor := crSQLWait;
      SQL.Text:='SELECT * FROM ASU.TNAZIS WHERE (FC_TYPE = :PFC_TYPE) AND (FK_PACID <> :PFK_PACID) '; // and (fc_accessionnumber<>:p_fc_accessionnumber)'; //
      DeclareAndSet('PFC_TYPE',otString, cxNumIssl1.text );  //   sNUMBERISSL    //  DeclareAndSet('p_fc_accessionnumber',otString, cxNumIssl1.Text );
      DeclareAndSet('PFK_PACID',otInteger, pPACID );
      Execute;
      v_okf:=Eof;
//      if v_okf then Showmessage('EOF') ;
    finally
      Close;
      Free;
    end;
    if not v_okf then
    begin
      MessageDlg( 'Измените номер протокола.'+#13+#10+
                  'Запись с номером '+cxNumIssl1.Text+' существует у другого пациента.', mtError, [mbOK], 0);
      Exit;
    end;
  end;
try
  Screen.Cursor := crSQLWait;
//  if odsListNaz.State in [dsEdit, dsInsert] then
//    odsListNaz.Post;
  TVListNaz.DataController.PostEditingData;
  idTalon := 0;
  idPepl := 0;
  cxdeRojd.PostEditValue;
  if DoCheckParameters = 0 then
    exit;
  if EDIT_MODE = TRUE then
    begin
      oqEdit := TOracleQuery.Create(nil);
      odsPepl := TOracleDataSet.Create(nil);
      try
        odsPepl.Session := frmMain.os;
        odsPepl.SQL.Text := ' select fk_peplid from asu.tambulance where fk_id = :pfk_id ';
        odsPepl.DeclareAndSet('pfk_id', otInteger, pPACID);
        odsPepl.Open;
        oqEdit.Session := frmMain.os;  // изменяем параметры существующего пациента
        oqEdit.SQL.Text := ' BEGIN '+#13+
                           '   update asu.tambulance '+#13+
                           '      set fk_peplid=:pfk_peplid, fc_fam=:pfc_fam, fc_im=:pfc_im, fc_otch=:pfc_otch, fc_phone=:pfc_phone, '+#13+
                           '          fd_rojd=:pfd_rojd, fp_sex=:pfp_sex '+#13+
                           '    where fk_id = :pfk_id; '+#13+
                           '   UPDATE asu.TPEOPLES '+#13+
                           '      SET FC_PHONE=:PFC_PHONE '+#13+
                           '    WHERE FK_ID=:PFK_PEPLID; '+#13+
                           ' END; ';
        oqEdit.DeclareAndSet('pFK_PEPLID', otInteger, odsPepl.FieldByName('fk_peplid').AsInteger); //pPEPLID);
        oqEdit.DeclareAndSet('pFC_FAM', otString, cxFam.Text);
        oqEdit.DeclareAndSet('pFC_IM', otString, cxName.Text);
        oqEdit.DeclareAndSet('pFC_OTCH', otString, cxOtch.Text);
        oqEdit.DeclareAndSet('pFC_PHONE', otString, cxTelefon.Text);
        oqEdit.DeclareAndSet('pFD_ROJD', otDate, cxdeRojd.Date);
        if cxMale.Checked = TRUE then
          oqEdit.DeclareAndSet('pFP_SEX', otInteger, 1)
        else
          oqEdit.DeclareAndSet('pFP_SEX', otInteger, 0);
        oqEdit.DeclareAndSet('pFK_ID', otInteger, pPACID);
        oqEdit.Execute;
        frmMain.os.Commit;
        IDPAC := pPACID;
      finally
        oqEdit.Free;
        odsPepl.Free;
      end;
    end else
    begin
      ods := TOracleDataSet.Create(nil); // добавляем нового пациента EDIT_MODE=FALSE
      oqIns := TOracleQuery.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.SQL.Text := ' SELECT FK_ID '+#13+
                        '   FROM asu.TPEOPLES '+#13+
                        '  WHERE FC_FAM = '''+TRIM(cxFam.Text)+''''+#13+
                        '    AND FD_ROJD = :PFD_ROJD ';
        if TRIM(cxName.Text) <> '' then
          ods.SQL.Add('AND FC_IM ='''+TRIM(cxName.Text)+'''');
        if Trim(cxOtch.Text) <> '' then
          ods.SQL.Add('AND FC_OTCH ='''+TRIM(cxOtch.Text)+'''');
        ods.DeclareAndSet('PFD_ROJD', otDate, cxdeRojd.Date);
        ods.Open;
        idPepl := ods.FieldByName('FK_ID').AsInteger;
        if ods.RecordCount = 0 then
          begin
            oqIns.Session := frmMain.os;     // 1. если такой пипл НЕ существует в базе - ДОБАВЛЯЕМ нового пипла
            oqIns.SQL.Text := ' DECLARE '+#13+
	                            '   nTemp NUMBER; '+#13+
                              ' BEGIN '+#13+
		                          '   INSERT INTO TAMBULANCE(FK_ID) VALUES(:PFK_ID) '+#13+ //инсертим запись в TAMBULANCE
                              '   RETURNING FK_ID INTO :PFK_ID; '+#13+
    		                      '   INSERT INTO TPEOPLES(FC_FAM) VALUES(NULL) '+#13+ //инсертим запись в TPEOPLES
                              '   RETURNING FK_ID INTO :PFK_PEPLID; '+#13+
        	                    '   :NDOCOBSLID:= SET_NEWIBNUM(:PFK_USLVIDID, nTemp); '+#13+
                		          '   UPDATE asu.TAMBULANCE SET '+#13+
			                        '   FK_IBID = nTemp, '+#13+
			                        '   FK_IBY = TO_CHAR(GET_YEARWORK), '+#13+
			                        '   FK_PEPLID = :PFK_PEPLID, '+#13+
			                        '   FK_DOCOBSL = :NDOCOBSLID '+#13+
	                            '	  WHERE FK_ID = :PFK_ID; '+#13+
                              '   EDIT_AMBULANCE '+#13+
                              '   (0,:pFK_PEPLID,:pFC_FAM,:pFC_IM,:pFC_OTCH,'''','''',:pFC_PHONE,'''', '+#13+
	                            '   :pFD_ROJD,:pFP_SEX,0,0,0,:pFK_ID,6,0,nTemp,TO_CHAR(GET_YEARWORK), '+#13+
	                            '   0,:pFK_VRACHID   ); '+#13+
                              '   UPDATE asu.TPEOPLES '+#13+
                              '   SET FC_FAM=:PFC_FAM, FC_IM=:PFC_IM, FC_OTCH=:PFC_OTCH, FP_SEX=:PFP_SEX, FD_ROJD=:PFD_ROJD, FC_RABOTA='''', '+#13+
                              '   FC_PHONE=:PFC_PHONE, FC_FAX=NULL, FC_E_MAIL=NULL, FC_HTTP=NULL, FK_DOCVID=-1, '+#13+
                              '   FC_DOCSER=NULL, FC_DOCNUM=NULL, FC_DOCVIDAN=NULL, FD_DOCDATE=NULL, '+#13+
                              '   FK_COMPANYID=-1, FK_OTDEL=-1, FK_DOLGNOST=-1, FC_ROJDPLACE='' '', '+#13+
                              '   FK_GROUPID=-1 '+#13+
                              '   WHERE FK_ID=:PFK_PEPLID; '+#13+
                              ' END; ';
            oqIns.DeclareAndSet('PFK_USLVIDID', otInteger, pTypeDocID);
            oqIns.DeclareVariable('PFK_ID', otInteger);
            oqIns.DeclareVariable('PFK_PEPLID', otInteger);
            oqIns.DeclareVariable('NDOCOBSLID', otInteger);
            oqIns.DeclareAndSet('PFC_FAM', otString, cxFam.Text);
            oqIns.DeclareAndSet('pFC_IM', otString, cxName.Text);
            oqIns.DeclareAndSet('pFC_OTCH', otString, cxOtch.Text);
            oqIns.DeclareAndSet('pFC_PHONE', otString, cxTelefon.Text);
            oqIns.DeclareAndSet('pFD_ROJD', otDate, cxdeRojd.Date);
            if cxMale.Checked = TRUE then
              oqIns.DeclareAndSet('pFP_SEX', otInteger, 1)
            else
              oqIns.DeclareAndSet('pFP_SEX', otInteger, 0);
            oqIns.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqIns.Execute;
            frmMain.os.Commit;
            IDPac := oqIns.GetVariable('PFK_ID');
            idPepl := oqIns.GetVariable('PFK_PEPLID');
            DoInsertProjivaet(IDPac);
            DoInsertKorennoe(idPepl);
          end else
          begin
            odsAmb := TOracleDataSet.Create(nil);     // 2. если такой пипл УЖЕ существует в базе
            try
              odsAmb.Session := frmMain.os;
              odsAmb.SQL.Text := '   SELECT TAMBULANCE.FK_ID, '+#13+
                                 '          FK_IBID, FK_IBY, TO_CHAR(TDOCOBSL.FK_NUMIB)||''/''||TO_CHAR(TDOCOBSL.FN_YEAR) AS NUMMK, '+#13+
                                 '          FC_FAM||'' ''||FC_IM||'' ''||FC_OTCH AS FIO, '+#13+
                                 '          TO_CHAR(FD_ROJD, ''DD.MM.YYYY'') AS DATEROJD, FK_PEPLID, FK_VIDDOCID '+#13+
                                 '     FROM ASU.TAMBULANCE, ASU.TDOCOBSL '+#13+
                                 '    WHERE TAMBULANCE.FK_DOCOBSL = TDOCOBSL.FK_ID '+#13+
                                 '      AND TAMBULANCE.FK_PEPLID = :PFK_PEPLID '+#13+
                                 '      AND TDOCOBSL.FK_VIDDOCID = :PFK_VIDDOCID ';
              odsAmb.DeclareAndSet('PFK_VIDDOCID', otInteger, pTypeDocID);
              odsAmb.DeclareAndSet('PFK_PEPLID', otInteger, idPepl);
              odsAmb.Open;
              if odsAmb.RecordCount > 0 then //2.1. проверяем нет ли на такого пипла и на такой вид документа записи в TAMBULANCE
                begin
                  MessageDlg('Внимание!'+#13+#10+
                             'Вы ввели следующие данные:'+#13+#10+
                             'ФИО: '+odsAmb.FieldByName('FIO').AsString+','+#13+#10+
                             'Дата рождения: '+odsAmb.FieldByName('DATEROJD').AsString+'.'+#13+#10+
                             'На этого пациента уже заведена амбулаторная карта('+odsAmb.FieldByName('NUMMK').AsString+') '+#13+#10+
                             'Ваши действия:'+#13+#10+
                             '1. Проверьте основные данные регистрации: Фамилию, Имя, Отчество, Дату рождения;'+#13+#10+
                             '2. Закройте форму регистрации, нажав кнопку "Отмена", и попробуйте внимательно поискать этого пациента в окне поиска.',
                             mtWarning, [mbOK], 0);
                  Exit; //2.2. нашли что на данного пипла уже заведена амбулаторная карта => выводим сообщение
                end else
                begin
                  oqIns.Session := frmMain.os;  //2.3. на данного пипла нет амбулаторной карты => заводим новую
                  oqIns.SQL.Text := ' DECLARE '+#13+
	                                  '   nTemp NUMBER; '+#13+
                                    ' BEGIN '+#13+
		                                '   INSERT INTO asu.TAMBULANCE(FK_ID) '+#13+
                                    '   VALUES(:PFK_ID) '+#13+
                                    '   RETURNING FK_ID INTO :PFK_ID; '+#13+
        	                          '   :NDOCOBSLID:= SET_NEWIBNUM(:PFK_USLVIDID, nTemp); '+#13+
                		                '   UPDATE asu.TAMBULANCE '+#13+
                                    '      SET FK_IBID = nTemp, '+#13+
			                              '          FK_IBY = TO_CHAR(GET_YEARWORK), '+#13+
			                              '          FK_PEPLID = :PFK_PEPLID, '+#13+
			                              '          FK_DOCOBSL = :NDOCOBSLID '+#13+
	                                  '	   WHERE FK_ID = :PFK_ID; '+#13+
                                    '   EDIT_AMBULANCE '+#13+
                                    '   (0,:pFK_PEPLID,:pFC_FAM,:pFC_IM,:pFC_OTCH,'''','''',:pFC_PHONE,'''', '+#13+
	                                  '   :pFD_ROJD,:pFP_SEX,0,0,0,:pFK_ID,6,0,nTemp,TO_CHAR(GET_YEARWORK), '+#13+
	                                  '   0,:pFK_VRACHID   ); '+#13+
                                    ' END; ';
                  oqIns.DeclareAndSet('PFK_USLVIDID', otInteger, pTypeDocID);
                  oqIns.DeclareVariable('PFK_ID', otInteger);
                  oqIns.DeclareAndSet('PFK_PEPLID', otInteger, idPepl);
                  oqIns.DeclareVariable('NDOCOBSLID', otInteger);
                  oqIns.DeclareAndSet('PFC_FAM', otString, cxFam.Text);
                  oqIns.DeclareAndSet('pFC_IM', otString, cxName.Text);
                  oqIns.DeclareAndSet('pFC_OTCH', otString, cxOtch.Text);
                  oqIns.DeclareAndSet('pFC_PHONE', otString, cxTelefon.Text);
                  oqIns.DeclareAndSet('pFD_ROJD', otDate, cxdeRojd.Date);
                  if cxMale.Checked = TRUE then
                    oqIns.DeclareAndSet('pFP_SEX', otInteger, 1)
                  else
                    oqIns.DeclareAndSet('pFP_SEX', otInteger, 0);
                  oqIns.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
                  oqIns.Execute;
                  frmMain.os.Commit;
                  IDPac := oqIns.GetVariable('PFK_ID');
                  DoInsertProjivaet(IDPac);
                  DoInsertKorennoe(idPepl);
                end;
            finally
              odsAmb.Free;
            end;
          end;
      finally
        oqIns.Free;
      end;
    end;
//------------------------------------------------------------------------------
//-->> 1. Сохраняем адрес КЛАДР
  if l_addr_loaded then
    begin
      SaveAddrChanges; // Callback Возвращает ID адреса, если было добавление и 0 при изменении
      CommitAddrChanges;
    end;
//-->> 2. Апдейтим записи в назначениях, адресе, если было добавление нового пациента
  if EDIT_MODE = False then
    begin
      if IDPac <> 0 then
        begin
          DoUpdatePacIDNaz(IDPac);
          if isKonsult = True then
            DoUpdateTalon(IDPAC);
        end;
      DoUpdateAddress(idPepl);
    end;
//-->> 4. Проживает
  if pPACID <> 0 then
    begin
      DoInsertProjivaet(pPACID);
    end;
//-->> 4. Сохраняем или изменяем все параметры назначения(-ий), включаем процедуру блокировки подписи лаборанта и проставляем номер исследования
  DoInsertEditParametersNaz;
  DoPodpis;
  DoUpdateNumIssl; //!!! проверку на то не пустой ли датасет
//-->> 5. вызов длл "Согласие пациента"
  if EDIT_MODE <> True then //--> если новый пациент то показываем, иначе не показываем
    begin
      if frmMain.get_agree_pacient = '-1' then //-->> если включена настройка "Согласие пациента"
        begin
          hAgree := LoadLibrary('Dll_Soglasie_Pac.dll');
          if hAgree <> 0 then
            begin
              try
                LoadAgree := GetProcAddress(hAgree, 'LoadSoglasie');
                if @LoadAgree <> nil then
                  LoadAgree(Application.Handle, idPepl, frmMain.pSOTRID);
              finally
                FreeLibrary(hAgree);
              end;
            end else
            begin
              ShowMessage('Не удалось загрузить динамическую библиотеку Dll_Soglasie_Pac.dll');
            end;
        end;
    end;
//-->> 6. Вызов длл "Выбор амбулаторного талона"
  if EDIT_MODE <> True then
    begin
      if isKonsult = False then // 20.03.2012 Убрано после совещания с Засименко О. и Ковалевой А., 23.03.2012 вернули опять же после совещания
        begin
          if (frmMain.GET_AMBTALON_XRAY = '-1') and (pAMBUL = 1) then // В зависимости от настройки начинаем работу с Амбулаторным талоном
            begin
              idTalon := GetLastTalonID(Application.Handle, frmMain.os, idPAC, frmMain.pSOTRID, -1);
            end;
          if idTalon <> 0 then // если есть талон, то для всех назначений делаем связку с амб талоном
            begin
              oq := TOracleQuery.Create(nil);
              try
                oq.Session := frmMain.os;
                oq.Cursor := crSQLWait;
                oq.SQL.Text := ' INSERT INTO ASU.TAMBTALON_NAZ(FK_TALONID, FK_AMBID, FK_NAZID) '+
                               ' VALUES(:PFK_TALONID, :PFK_AMBID, :PFK_NAZID) ';
                odsListNaz.First;
                while not odsListNaz.Eof do
                  begin
                    oq.DeclareAndSet('PFK_TALONID', otInteger, idTalon);
                    oq.DeclareAndSet('PFK_AMBID', otInteger, idPAC);
                    oq.DeclareAndSet('PFK_NAZID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
                    oq.Execute;
                    odsListNaz.Next;
                  end;
                frmMain.os.Commit;
              finally
                oq.Free;
              end;
            end;
        end;
    end;
//-->> 7. Добавление исследований на WLM
  if frmMain.get_lookinside = '-1' then
    begin
      DoAddWLM;
    end;

  ModalResult := MrOK;
finally
  Screen.Cursor := crDefault;
end;
end;

procedure TfrmLabNaprav.aSearchDsExecute(Sender: TObject);
var ods : TOracleDataSet;
    sKod : string;
begin
  if Pos(' ', cxDs.Text) = 0 then
    sKod := cxDs.Text
  else
    sKod := copy(cxDs.Text, 1, Pos(' ', cxDs.Text));
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select fc_name from asu.tsmid '+#13+
                    '  where fk_mkb10 = upper(:pfk_mkb10) '+#13+
                    ' start with fc_synonim = ''DIAGS_MKB10'' '+#13+
                    ' connect by prior fk_id = fk_owner ';
    ods.DeclareAndSet('pfk_mkb10', otString, trim(sKod));
    ods.Open;
    cxDs.Clear;
    cxDs.Text := trim(sKod)+' '+ods.FieldByName('fc_name').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmLabNaprav.aSendToWLExecute(Sender: TObject);
var ods : TOracleDataSet;
    oq : TOracleQuery;
    sModality, sBodyPart, sIB, sStudyUID : string;
//
  p_INSWorklist : procedure ( p_AppHandl : THandle;
                              p_atris_mssql_conn_str : string;
                              p_PatientIDINS : string;      // Номер Карты -> PatientID
                              p_patPrefix : string;         // patPrefix (не исп)
                              p_PatientFamily : string;     // Фамилия
                              p_PatientNAME : string;       // Имя
                              p_PatientSurname : string;    // Отчество
                              p_BirthDate : TDateTime;         // Дата рождения -> PatientBirthDate
                              p_Sex : string;               // Пол
                              p_AETitle : string;           // AETitle аппарата
                              p_Room : string;              // Комната (не исп)
                              p_DiagnMKB10 : string;        // Код напр. диагноза по МКБ-10 -> не исп
                              p_Podrazdelenie : string;     // Направившее подразделение
                              p_VrachFam : string;          // Фамилия направившего врача
                              p_VrachIm : string;           // Имя направившего врача
                              p_VrachOtch : string;         // Отчество направившего врача
                              p_Modality : string;          // Modality
                              p_BodyPart : string;          // Название исследуемой части тела
                              p_StudyName : string;         // Название исследования
                              p_FASTEST : string;           // Экстренный (1/0)-> не исп (integer)
                              p_DateTimeNapravl : TDateTime;       // Дата / Время направления
                              p_Polikl_Statsionar : string; // 0 - Поликлиника, 1 - Стационар
                              p_AccessionNumber : string;    // AccessionNumber
                              p_studyinstanceuid : string  // studyinstanceuid
                           ); stdcall;
// True - нет номера   False - номер есть
f_chk_AN : function  ( p_atris_mssql_conn_str, p_AccessionNumber : string ):boolean; stdcall;
  DLL_HANDLE: THandle;
  v_atris_mssql_conn_str,
  v_atris_use,
  v_fc_aetitle,
  v_pol : string;
const c_fileDLL = 'dll_worklist_nazn.dll';
      c_fld_razd = '|';
function f_gtTSMINI ( p_key : string; p_section : string ) : string;
var v_OraclePackage : TOraclePackage;
begin
  v_OraclePackage := TOraclePackage.Create(nil);
  try
    v_OraclePackage.Session := frmMain.os;
    v_OraclePackage.PackageName:='asu.PKG_SMINI';
    try
      Result:=v_OraclePackage.CallStringFunction('READSTRING',[p_key,p_section,'']);
    except
      on E:Exception do
        MessageDlg('Ошибка '+E.Message, mtError, [mbOK], 0);
    end;
  finally
    v_OraclePackage.Free;
  end;
end;
var v_is_ok : Boolean; v_err:Integer; v_an, v_fpol:string;
begin
  v_atris_use := f_gtTSMINI('DLL_WORKLIST_NAZN','atris_use');
  v_atris_mssql_conn_str := f_gtTSMINI('DLL_WORKLIST_NAZN','atris_mssql_conn_str');
  v_is_ok := True;
  odsListNaz.DisableControls;
  //
  if (f_gtTSMINI('DLL_WORKLIST_NAZN','MYWORKLIST_USE')='1') or fileexists(ExtractFilePath(ParamStr(0))+'\testdicom.dat') then
    if MessageDlg('Вы желаете добавить запись в WORKLIST ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
    then
      if (USE_ONE_ACCESSIONNUMBER=1) then
      begin
        if cxMale.Checked then
          v_fpol:='M'
        else
          v_fpol:='F';
        SenfDataToWorklist ( cxNumIssl1.Text,    // AccessionNumber
                             v_fpol,          // Пол
                             cxNum.Text,            // Номер Карты -> PatientID
                             cxdeRojd.Date,  // p_dateborn : TDateTime;
                             cxFam.Text,     // Фамилия
                             cxName.Text,    // Имя
                             cxOtch.Text,    // Отчество
                             sModality,      // p_Modality,
                             '',             // studyuid : string;
                             cxdeDateProtocol.Date, // Дата направления p_st_dt : TDateTime ;
                             FormatDateTime('hh:nn:ss', cxteTimeProtocol.Time),  // Дата / Время направления stepstarttime : string ;
                             '' // stepdescription : string = '');
                            );
        Exit;                    
      end else
      begin
        odsListNaz.First;
        while not odsListNaz.Eof do
        begin
          SenfDataToWorklist ( odsListNaz.FieldByName('fc_accessionnumber').AsString,    // AccessionNumber
                               v_pol,          // Пол
                               cxNum.Text,            // Номер Карты -> PatientID
                               cxdeRojd.Date,  // p_dateborn : TDateTime;
                               cxFam.Text,     // Фамилия
                               cxName.Text,    // Имя
                               cxOtch.Text,    // Отчество
                               sModality,      // p_Modality,
                               '',             // studyuid : string;
                               cxdeDateProtocol.Date, // Дата направления p_st_dt : TDateTime ;
                               FormatDateTime('hh:nn:ss', cxteTimeProtocol.Time),  // Дата / Время направления stepstarttime : string ;
                               '' // stepdescription : string = '');
                              );
          odsListNaz.Next;
        end;
        Exit;
      end;
  //
  odsListNaz.First;
  while not odsListNaz.Eof do
  begin
    v_an:=odsListNaz.FieldByName('fc_accessionnumber').AsString;
    if v_an='' then
    begin
      v_is_ok := False;
      v_err:=1;
      MessageDlg('Не задан № протокола исследования', mtWarning, [mbOK], 0);
      Break;
    end;
    // --------------------------
    if FileExists(c_fileDLL) then
    begin
      DLL_HANDLE:= LoadLibrary(c_fileDLL);
      Try
        if DLL_HANDLE <> 0 then
        begin
          @f_chk_AN := GetProcAddress(DLL_HANDLE, 'f_chk_AN');
          if @f_chk_AN <> nil then
          begin
            if not f_chk_AN( v_atris_mssql_conn_str,v_an ) then
            begin
              v_is_ok := False;
              v_err:=2;
              MessageDlg('Запись с номером исследования '''+v_an+''' существует', mtError, [mbOK], 0);
              Break;
            end;
          end;
        end;
      Finally
        FreeLibrary(DLL_HANDLE);
      End;
    end;
    // --------------------------
    odsListNaz.Next;
  end;
  odsListNaz.EnableControls;
  if not v_is_ok then
  begin
    Exit;
  end;
  //
  Screen.Cursor := crHourGlass;
  ods := TOracleDataSet.Create(nil);
  oq := TOracleQuery.Create(nil);
  try
    ods.Session := frmMain.os;
    sIb := cxNum.Text; // номер медицинской карты
    if v_atris_use='1' then
    begin
      if MessageDlg('Вы желаете добавить запись в WORKLIST ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
      then
        if FileExists(c_fileDLL) then
        begin
          DLL_HANDLE:= LoadLibrary(c_fileDLL);
          Try
            if DLL_HANDLE <> 0 then
            begin
              @p_INSWorklist := GetProcAddress(DLL_HANDLE, 'p_INSWorklist');
              if @p_INSWorklist <> nil then
              begin
                // if Trim(cxNumIssl.Text)='' then cxNumIssl.Text:='AN'+IntToStr(odsListNaz.FieldByName('fk_id').AsInteger);
                  if cxMale.Checked = True then
                    v_pol := 'M'
                  else
                    v_pol := 'F';
                odsListNaz.First;
                while not odsListNaz.Eof do
                begin
                  ods.SQL.Text := ' select fc_name from asu.tmodality t1, asu.tsmid_modality t2 where t1.fk_id = t2.fk_modality and t2.fk_smid = :pfk_smid ';
                  ods.DeclareAndSet('pfk_smid', otInteger, odsListNaz.FieldByName('fk_smid').AsInteger);
                  ods.Open;
                  sModality := ods.FieldByName('fc_name').AsString; // модальность из справочника
                  ods.DeleteVariables;
                  ods.Close;
                  ods.SQL.Text := ' select t.fc_aetitle from asu.txray_apparats t where t.fk_kabinet=:p_FK_ROOMID and rownum<=1 ';
                  ods.DeclareAndSet('p_FK_ROOMID', otInteger, odsListNaz.FieldByName('FK_ROOMID').AsInteger);
                  ods.Open;
                  if not ods.eof then
                  begin
                    v_fc_aetitle:=ods.FieldByName('fc_aetitle').AsString;
                  end else
                  begin
                    v_fc_aetitle:='';
                  end;
                  ods.DeleteVariables;
                  ods.Close;
                  {
                  ods.SQL.Text := ' select fc_name_eng from asu.tbodyparts t1, asu.tsmid_bodypart t2 where t1.fk_id = t2.fk_bodypart and t2.fk_smid = :pfk_smid ';
                  ods.DeclareAndSet('pfk_smid', otInteger, odsListNaz.FieldByName('fk_smid').AsInteger);
                  ods.Open;
                  sBodyPart := ods.FieldByName('fc_name_eng').AsString; // часть тела
                  }
                  //odsListNaz.sql.SaveToFile('d:\1.sql');
                 // v_fc_aetitle:=odsListNaz.FieldByName('fc_aetitle').AsString;
                  p_INSWorklist( Application.Handle,
                                 v_atris_mssql_conn_str,
                                 sIb,      // Номер Карты -> PatientID
                                 '',         // patPrefix (не исп)
                                 cxFam.Text,     // Фамилия
                                 cxName.Text,       // Имя
                                 cxOtch.Text,    // Отчество
                                 cxdeRojd.Date,         // Дата рождения -> PatientBirthDate
                                 v_pol,               // Пол
                                 v_fc_aetitle,           // AETitle аппарата
                                 '',              // Комната (не исп)
                                 '',        // Код напр. диагноза по МКБ-10 -> не исп
                                 '',     // Направившее подразделение
                                 cxRgLaborant.Text,          // Фамилия направившего врача
                                 '',           // Имя направившего врача
                                 '',         // Отчество направившего врача
                                 sModality,          // Modality
                                 '',          // Название исследуемой части тела
                                 '',         // Название исследования
                                 '0',           // Экстренный (1/0)-> не исп (integer)
                                 StrToDateTime(DateToStr(cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn:ss', cxteTimeProtocol.Time)),       // Дата / Время направления
                                 '0', // 0 - Поликлиника, 1 - Стационар
                                 odsListNaz.FieldByName('fc_accessionnumber').AsString,    // AccessionNumber
                                 ''  // StudyInstanceUID


                               );
                  odsListNaz.Next;
                end;
              end;
            end;
          Finally
            FreeLibrary(DLL_HANDLE);
          End;
        end else
          MessageDlg('Не найден файл '+c_fileDLL, mtWarning, [mbOK], 0);
    end else
    begin

    // -- проверки
      if frmMain.get_dicomwl_port = 0 then
        begin
          MessageDlg('Внимание!'+#13+#10+'Не указан порт сервера WL!'+#13+#10+'Обратитесь к администратору системы!', mtInformation, [mbOK], 0);
          exit;
        end;
      if (frmMain.get_dicomwl_ip = null) or (frmMain.get_dicomwl_ip = '') then
        begin
          MessageDlg('Внимание!'+#13+#10+'Не указан IP-адрес сервера WL!'+#13+#10+'Обратитесь к администратору системы!', mtInformation, [mbOK], 0);
          exit;
        end;
    // -- Данные
        odsListNaz.First;
        while not odsListNaz.Eof do
        begin
          ods.SQL.Text := ' select fc_name from asu.tmodality t1, asu.tsmid_modality t2 where t1.fk_id = t2.fk_modality and t2.fk_smid = :pfk_smid ';
          ods.DeclareAndSet('pfk_smid', otInteger, odsListNaz.FieldByName('fk_smid').AsInteger);
          ods.Open;
          sModality := ods.FieldByName('fc_name').AsString; // модальность из справочника
          ods.DeleteVariables;
          ods.Close;
          ods.SQL.Text := ' select fc_name_eng from asu.tbodyparts t1, asu.tsmid_bodypart t2 where t1.fk_id = t2.fk_bodypart and t2.fk_smid = :pfk_smid ';
          ods.DeclareAndSet('pfk_smid', otInteger, odsListNaz.FieldByName('fk_smid').AsInteger);
          ods.Open;
          sBodyPart := ods.FieldByName('fc_name_eng').AsString; // часть тела
    // -- проверяем GUID
            ods.DeleteVariables;
            ods.Close;
            ods.SQL.Text := ' select fc_guid from asu.vnaz_guid where fk_nazid = :pfk_nazid ';
            ods.DeclareAndSet('pfk_nazid', otInteger, odsListNaz.FieldByName('fk_id').AsInteger);
            ods.Open;
            if ods.RecordCount > 0 then
              begin
                sStudyUID := ods.FieldByName('fc_guid').AsString;
              end else
              begin
                frmMain.odsGuid.Close;
                frmMain.odsGuid.Open;
                sStudyUID := frmMain.odsGuid.FieldByName('nextguid').AsString; // если нет то формируем новый GUID
              end;
    // -- подключаемся к серверу
          {  frmMain.cnsDicomConnection1.Port := frmMain.get_dicomwl_port;
            frmMain.cnsDicomConnection1.Host := frmMain.get_dicomwl_ip;
            frmMain.cnsDBTable.Active := True;
            if frmMain.cnsDBTable.Locate('idfield', sStudyUID, []) = True then
              begin
                frmMain.cnsDBTable.Edit;
                frmMain.cnsDBTable.FieldByName('namefield').AsString := cxFam.Text+' '+copy(cxName.Text, 1, 1)+'. '+copy(cxOtch.Text, 1, 1)+'.';
                frmMain.cnsDBTable.FieldByName('enamefield').AsString := cxFam.Text+' '+copy(cxName.Text, 1, 1)+'. '+copy(cxOtch.Text, 1, 1)+'.';
                frmMain.cnsDBTable.FieldByName('apply_time').AsDateTime := StrToDateTime(DateToStr(cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn:ss', cxteTimeProtocol.Time));
                frmMain.cnsDBTable.FieldByName('uidfield').AsString := odsListNaz.FieldByName('FC_TYPE').AsString;
                frmMain.cnsDBTable.FieldByName('birthdatefield').AsDateTime := cxdeRojd.Date;
                if cxMale.Checked = True then
                  frmMain.cnsDBTable.FieldByName('sexfield').AsString := 'M'
                else
                  frmMain.cnsDBTable.FieldByName('sexfield').AsString := 'F';
                frmMain.cnsDBTable.FieldByName('doctorfield').AsString := cxRgLaborant.Text;
                frmMain.cnsDBTable.FieldByName('modality').AsString := sModality;
                frmMain.cnsDBTable.FieldByName('p_pid').AsString := sIb;
                frmMain.cnsDBTable.FieldByName('accessionnumber').AsString := odsListNaz.FieldByName('FC_TYPE').AsString;
                frmMain.cnsDBTable.FieldByName('bodypart').AsString := sBodyPart;
                frmMain.cnsDBTable.Post;
                frmMain.cnsDBTable.ApplyUpdates;
              end else
              begin
                frmMain.cnsDBTable.Insert;
                frmMain.cnsDBTable.FieldByName('namefield').AsString := cxFam.Text+' '+copy(cxName.Text, 1, 1)+'. '+copy(cxOtch.Text, 1, 1)+'.';
                frmMain.cnsDBTable.FieldByName('enamefield').AsString := cxFam.Text+' '+copy(cxName.Text, 1, 1)+'. '+copy(cxOtch.Text, 1, 1)+'.';
                frmMain.cnsDBTable.FieldByName('idfield').AsString := sStudyUID;
                frmMain.cnsDBTable.FieldByName('apply_time').AsDateTime := StrToDateTime(DateToStr(cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn:ss', cxteTimeProtocol.Time));
                frmMain.cnsDBTable.FieldByName('uidfield').AsString := odsListNaz.FieldByName('FC_TYPE').AsString;
                frmMain.cnsDBTable.FieldByName('birthdatefield').AsDateTime := cxdeRojd.Date;
                if cxMale.Checked = True then
                  frmMain.cnsDBTable.FieldByName('sexfield').AsString := 'M'
                else
                  frmMain.cnsDBTable.FieldByName('sexfield').AsString := 'F';
                frmMain.cnsDBTable.FieldByName('doctorfield').AsString := cxRgLaborant.Text;
                frmMain.cnsDBTable.FieldByName('modality').AsString := sModality;
                frmMain.cnsDBTable.FieldByName('p_pid').AsString := sIb;
                frmMain.cnsDBTable.FieldByName('accessionnumber').AsString := odsListNaz.FieldByName('FC_TYPE').AsString;
                frmMain.cnsDBTable.FieldByName('bodypart').AsString := sBodyPart;
                frmMain.cnsDBTable.Post;
                frmMain.cnsDBTable.ApplyUpdates;
              end;   }
    // -- vnaz_guid
            oq.Session := frmMain.os;
            oq.SQL.Text := ' merge into asu.vnaz_guid using dual on (fk_nazid = :pfk_nazid) '+#13+
                           ' when not matched then insert(fk_nazid, fc_guid) values(:pfk_nazid, :pfc_guid) '+#13+
                           ' when matched then update set fc_guid = :pfc_guid where fk_nazid = :pfk_nazid ';
            oq.DeclareAndSet('pfk_nazid', otInteger, odsListNaz.FieldByName('fk_id').AsInteger);
            oq.DeclareAndSet('pfc_guid', otString, sStudyUID);
            oq.Execute;
            frmMain.os.Commit;
          odsListNaz.Next;
        end;
    end;
  finally
    Screen.Cursor := crDefault;
    ods.Free;
    oq.Free;
  end;
end;

procedure TfrmLabNaprav.aZaklExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  Application.CreateForm(TfrmProsmotrZakl, frmProsmotrZakl);
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT DECODE(MAX(FC_CHAR), NULL, ''Нет заключения'', MAX(FC_CHAR)) AS ZAKL '+#13+
                    '   FROM asu.TIB '+#13+
                    '  WHERE FK_PACID = :PFK_ID '+#13+
                    '    AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME'') ';
    ods.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
    ods.Open;
    frmProsmotrZakl.rowZakl.Properties.Value := ods.FieldByName('ZAKL').AsString;
    frmProsmotrZakl.rowNum.Properties.Value := odsListNaz.FieldByName('FC_TYPE').AsString;
    frmProsmotrZakl.merFIOMK.Properties.Editors[0].Value := cxFam.Text+' '+cxName.Text+' '+cxOtch.Text;
    frmProsmotrZakl.merFIOMK.Properties.Editors[1].Value := cxNum.Text;
    frmProsmotrZakl.merDateAgeSex.Properties.Editors[0].Value := cxdeRojd.Text;
    frmProsmotrZakl.merDateAgeSex.Properties.Editors[1].Value := cxAge.Caption;
    if cxMale.Checked = True then
      frmProsmotrZakl.merDateAgeSex.Properties.Editors[2].Value := 'Мужской'
    else
      frmProsmotrZakl.merDateAgeSex.Properties.Editors[2].Value := 'Женский';
    frmProsmotrZakl.rowIssl.Properties.Value := odsListNaz.FieldByName('fc_name').AsString;    
    frmProsmotrZakl.ShowModal;
  finally
    ods.Free;
    frmProsmotrZakl.Free;
  end;
end;

procedure TfrmLabNaprav.aAgreeExecute(Sender: TObject);
var hAgree : Integer;
    LoadAgree : TLoadAgree;
begin
  hAgree := LoadLibrary('Dll_Soglasie_Pac.dll');
  if hAgree <> 0 then
    begin
      try
        LoadAgree := GetProcAddress(hAgree, 'LoadSoglasie');
        if @LoadAgree <> nil then
          LoadAgree(Application.Handle, pPEPLID, frmMain.pSOTRID);
      finally
        FreeLibrary(hAgree);
      end;
    end else
    begin
      ShowMessage('Не удалось загрузить динамическую библиотеку Dll_Soglasie_Pac.dll'); //!!! проверить
    end;
end;

procedure TfrmLabNaprav.aAgreeProcExecute(Sender: TObject);
var i : Integer;
begin
  strMetods := '';
  for i := 0 to tvListNaz.DataController.RecordCount - 1 do
    begin
      strMetods := strMetods + VNAMEISSL.DataBinding.DataController.Values[i, VNAMEISSL.Index]+', ';
    end;
  strMetods := copy(strMetods, 1, Length(strMetods)-2);
  frAgreeProc.ShowReport;
end;

procedure TfrmLabNaprav.aAgreeMRT1Execute(Sender: TObject);
begin
  frmMain.frxAgreeReportMRT.Variables['FIO']:='''' +cxFam.Text+' '+cxName.Text+' '+cxOtch.Text+' дата рождения : '+cxdeRojd.Text + '''';
  frmMain.frxAgreeReportMRT.ShowReport;
end;

procedure TfrmLabNaprav.aAgreeSurgery1Execute(Sender: TObject);
begin
  frmMain.frxAgreeReportSurgery.Variables['FIO']:='''' +cxFam.Text+' '+cxName.Text+' '+cxOtch.Text+' дата рождения : '+cxdeRojd.Text + '''';
  frmMain.frxAgreeReportSurgery.ShowReport;
end;

procedure TfrmLabNaprav.aAgreeTomoContrast1Execute(Sender: TObject);
begin
  frmMain.frxAgreeReportTomography.Variables['FIO']:='''' +cxFam.Text+' '+cxName.Text+' '+cxOtch.Text+' дата рождения : '+cxdeRojd.Text + '''';
  frmMain.frxAgreeReportTomography.ShowReport;
end;

procedure TfrmLabNaprav.aCancelExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if (pPACID = 0) AND (odsListNaz.RecordCount <> 0) then
    begin
      Application.MessageBox('Внимание! Вы добавили методику(-и), но не зарегестрировали Нового пациента!'+
                             #13#10+'Ваши действия:'+
                             #13#10+'1. Заполнить личные данные пациента и нажать кнопку "Сохранить"; '+
                             #13#10+'2. Удалить методику(-и) из списка и нажать кнопку "Отмена".',
                             'Предупреждение!',
                             MB_ICONWARNING+MB_OK);
      Exit;
    end;

  if pDOCOBSLID <> 0 then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' DELETE FROM asu.TDOCOBSL WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('PFK_ID', otInteger, pDOCOBSLID);
        oq.Execute;
        frmMain.os.Commit;
      finally
        oq.Free;
      end;
    end;
  ModalResult := MrCancel;
end;

procedure TfrmLabNaprav.aCompareExecute(Sender: TObject);
//var s1 : string;
begin
//  Application.CreateForm(TfrmCompare, frmCompare);
//  try
//    s1 := 'http://'+frmMain.get_lookinside_ip+':'+frmMain.get_lookinside_portweb+'/bind.html?'+ 
//          'his_id='+IntToStr(odsListNaz.FieldByName('fk_id').AsInteger)+'&'+
//          'patient_name='+CyrToLatGOST(cxFam.Text)+'%20'+CyrToLatGOST(copy(cxName.Text, 1, 1))+'.%20'+CyrToLatGOST(copy(cxOtch.Text, 1, 1))+'.&'+ // не передаем, не обязательные поля
//          'patient_dob='+FormatDateTime('yyyy-mm-dd', cxdeRojd.Date)+'&'+
//          'study_modalities='+odsListNaz.FieldByName('modalityname').AsString+'&'+
//          'device_name='+frmMain.odsKab.FieldByName('nameapparat').AsString+'&'+
//          'ae_title='+frmMain.odsKab.FieldByName('aetitle').AsString+'&'+
//          'filter_period=2&'+ // ??? по умолчанию ставим за 2 дня
//          'hash='+uMD5.MD5DigestToStr(MD5String(frmMain.get_lookinside_login+frmMain.get_lookinside_pass));
//    frmCompare.wbCompare.Navigate(s1);
//    frmCompare.ShowModal;
//  finally
//    frmCompare.Free;
//  end;
end;

procedure TfrmLabNaprav.cxKemNapravlenDblClick(Sender: TObject);
begin
  if odsKemNapravlen.RecordCount > 0 then
    begin
      if cxKemNapravlen.FocusedNode.HasChildren then
        exit;
      if (isKonsult = True) and (odsKemNapravlen.FieldByName('LPU_XMAO').AsInteger = 0) then
        begin
          Application.MessageBox('Услуга является консультативной, поэтому необходимо выбрать направившее учреждение из ветки "ЛПУ ХМАО"',
                                 'Предупрежение', mb_ok+mb_iconwarning);
          exit;
        end;
      cxKem.Text := odsKemNapravlen.FieldByName('fc_name').AsString;
      cxKem.Tag := odsKemNapravlen.FieldByName('fk_id').AsInteger;
      cxKem.PopupWindow.Close;
    end;
end;

procedure TfrmLabNaprav.cxKemNapravlenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
      if cxKemNapravlen.FocusedNode.HasChildren then
        exit;
      if (isKonsult = True) and (odsKemNapravlen.FieldByName('LPU_XMAO').AsInteger = 0) then
        begin
          Application.MessageBox('Услуга является консультативной, поэтому необходимо выбрать направившее учреждение из ветки "ЛПУ ХМАО"',
                                 'Предупрежение', mb_ok+mb_iconwarning);
          exit;
        end;
      cxKem.Text := odsKemNapravlen.FieldByName('FC_NAME').AsString;
      cxKem.Tag := odsKemNapravlen.FieldByName('FK_ID').AsInteger;
      cxKem.PopupWindow.Close;
    end;
end;

procedure TfrmLabNaprav.cxKorennoePropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
  if pPEPLID <> 0 then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT MAX(FK_ID) AS nTmp '+#13+
                        '   FROM ASU.TIB I '+#13+
                        '  WHERE FK_PACID = :PFK_PACID '+#13+
                        '    AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM asu.TSMID WHERE FC_SYNONIM = ''KOREN_NASEL'')) ';
        ods.DeclareAndSet('PFK_PACID', otInteger, pPEPLID);
        ods.Open;
        if ods.FieldByName('nTmp').AsInteger = 0 then
          begin
            oq := TOracleQuery.Create(nil);
            try
              oq.Session := frmMain.os;
              oq.Cursor := crSQLWait;
              oq.SQL.Text := ' INSERT INTO ASU.TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13+
                             ' VALUES(:pFK_PACID, :pFK_SMID, :pFK_SMEDITID, :pFK_VRACHID) ';
              oq.DeclareAndSet('pFK_PACID', otInteger, pPEPLID);
              oq.DeclareAndSet('pFK_SMID', otInteger, cxKorennoe.EditValue);
              oq.DeclareAndSet('pFK_SMEDITID', otInteger, cxKorennoe.EditValue);
              oq.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
              oq.Execute;
              frmMain.os.Commit;
            finally
              oq.Free;
            end;
          end else
          begin
            oq := TOracleQuery.Create(nil);
            try
              oq.Session := frmMain.os;
              oq.Cursor := crSQLWait;
              oq.SQL.Text := ' UPDATE TIB SET FK_SMID = :pFK_SMID WHERE FK_ID = :pFK_ID ';
              oq.DeclareAndSet('pFK_SMID', otInteger, cxKorennoe.EditValue);
              oq.DeclareAndSet('pFK_ID', otInteger, ods.FieldByName('nTmp').AsInteger);
              oq.Execute;
              frmMain.os.Commit;
            finally
              oq.Free;
            end;
          end;
      finally
        ods.Free;
      end;
  end;
end;

procedure TfrmLabNaprav.DoTextTypeFIO(strFIO: String);
var sFam, sIm, sOtch : String;
    strIm : String;
    flag : Integer;
begin
  flag := 0;
  if Pos(' ', strFIO) = 0 then
    begin
      sFam := strFIO;
      flag := 1;
    end else
    begin
      sFam := copy(strFIO, 1, Pos(' ', strFIO));
    end;

  if flag = 1 then
    strIm := ''
  else
    strIm := trim(copy(strFIO, Length(sFam), Length(strFIO)+1 - Length(sFam)));

  sIm := trim(copy(strIm, 1, Pos(' ', strIm)));
  if sIm = '' then
    sIm := strIm;

  sOtch := trim(copy(strIm, Length(sIm)+1, Length(strIm)-Length(sIm)+1));
  cxFam.Text := Trim(sFam);
  cxName.Text := sIm;
  cxOtch.Text := sOtch;
end;

procedure TfrmLabNaprav.cxFamClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmLabNaprav.cxFamEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmLabNaprav.cxFamKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '"', '№', ';', ':', '?', '=', '\', '/', '.', ',', '>', '<', '|', '[', ']', '{', '}'] then
    Key := #0;
end;

procedure TfrmLabNaprav.cxNameClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmLabNaprav.cxNameEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmLabNaprav.cxNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '"', '№', ';', ':', '?', '=', '\', '/', '.', ',', '>', '<', '|', '[', ']', '{', '}'] then
    Key := #0;
end;

procedure TfrmLabNaprav.cxNumIssl1Click(Sender: TObject);
begin
  if frmMain.get_eng_num = '-1' then
    begin
      ActivateKeyboardLayout(frmMain.Latin, KLF_REORDER);
    end else
    begin
      ActivateKeyboardLayout(frmMain.Russian, KLF_REORDER);
    end;
end;

procedure TfrmLabNaprav.cxNumIssl1Enter(Sender: TObject);
begin
  if frmMain.get_eng_num = '-1' then
    begin
      ActivateKeyboardLayout(frmMain.Latin, KLF_REORDER);
    end else
    begin
      ActivateKeyboardLayout(frmMain.Russian, KLF_REORDER);
    end;
end;

procedure TfrmLabNaprav.cxNumIssl1Exit(Sender: TObject);
var oq : TOracleQuery;
  procedure shErrMsg(pMsg:string);
  begin
    ShowMessage(pMsg);
    cxNumIssl1.Text:=vAccessionNumberOLD;
  end;
begin
  if ((trim(cxNumIssl1.Text)='') or (trim(vAccessionNumberOLD)='')) then Exit;
  if GET_DB_NAME = 'SK' then
  begin
    if vAccessionNumberOLD <> cxNumIssl1.Text then
    begin
     { oq := TOracleQuery.Create(nil);
      try
        Cursor := crSQLWait;
        oq.Session := frmMain.os;
        oq.SQL.Text := 'select 1 from asu.tnazis t where t.fk_id=:pfk_id and t.fk_nazsosid=:pfk_nazsosid';
        oq.DeclareAndSet('pfk_id', otInteger, pNAZID);
        oq.DeclareAndSet('PFK_NAZSOSID', otInteger, GET_VIPNAZ);
        oq.Execute;
        if not oq.Eof then
        begin
          shErrMsg('Изменение номера протокола недоступно в подписанном назначении. ');
          Exit;
        end;
      finally
        oq.Free;
        Cursor := crDefault;
      end; }
      oq := TOracleQuery.Create(nil);
      try
        Cursor := crSQLWait;
        oq.Session := frmMain.os;
        oq.SQL.Text:='SELECT asu.PKG_REGIST_PACFUNC.GET_PAC_FIO(t.fk_pacid) as pacfio, ti.FC_CHAR, ti.FK_PACID'+#10+
                     ' FROM asu.TIB ti, ASU.TNAZIS t'+#10+
                     ' WHERE ti.FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL'')'+#10+
                     ' and ti.FC_CHAR=:p_fc_accessionnumber'+#10+
                     ' and t.fk_id=ti.FK_PACID'+#10+
                     ' and t.fk_id<>:p_fk_id ' ;

        oq.DeclareAndSet('p_fc_accessionnumber',otString,cxNumIssl1.Text); // sNUMBERISSL
        oq.DeclareAndSet('p_fk_id',otInteger,odsListNaz.FieldByName('fk_id').AsInteger);
        oq.Execute;
        if not oq.Eof then
        begin
          shErrMsg('Такой номер протокола существует'+#13+'Пациент '+oq.FieldAsString('pacfio'));
          Exit;
        end;
      finally
        oq.Free;
        Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TfrmLabNaprav.cxNumIssl1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key in ['+','=',')','(','*','&','?','>','<','.',',','^',':',';','"','|','%','$','#','@','!','~']) then key:=#0;
  if frmMain.get_eng_num = '-1' then
    begin
      if (key in ['а'..'я','А'..'Я']) then key:=#0;
    end;
end;

procedure TfrmLabNaprav.cxNumIssl1PropertiesChange(Sender: TObject);
var oq : TOracleQuery;
  procedure shErrMsg(pMsg:string);
  begin
    ShowMessage(pMsg);
    cxNumIssl1.Text:=vAccessionNumberOLD;
  end;
begin
  if ((trim(cxNumIssl1.Text)='') or (trim(vAccessionNumberOLD)='')) then Exit;
  if GET_DB_NAME = 'SK' then
  begin
    if vAccessionNumberOLD <> cxNumIssl1.Text then
    begin
      oq := TOracleQuery.Create(nil);
      try
        Cursor := crSQLWait;
        oq.Session := frmMain.os;
        oq.SQL.Text := 'select 1 from asu.tnazis t where t.fk_id=:pfk_id and t.fk_nazsosid=:pfk_nazsosid';
        oq.DeclareAndSet('pfk_id', otInteger, pNAZID);
        oq.DeclareAndSet('PFK_NAZSOSID', otInteger, GET_VIPNAZ);
        oq.Execute;
        if not oq.Eof then
        begin
          shErrMsg('Изменение номера протокола недоступно в подписанном назначении. ');
          Exit;
        end;
      finally
        oq.Free;
        Cursor := crDefault;
      end;
    {  oq := TOracleQuery.Create(nil);
      try
        Cursor := crSQLWait;
        oq.Session := frmMain.os;
        oq.SQL.Text:='SELECT asu.PKG_REGIST_PACFUNC.GET_PAC_FIO(t.fk_pacid) as pacfio, ti.FC_CHAR, ti.FK_PACID'+#10+
                     ' FROM asu.TIB ti, ASU.TNAZIS t'+#10+
                     ' WHERE ti.FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL'')'+#10+
                     ' and ti.FC_CHAR=:p_fc_accessionnumber'+#10+
                     ' and t.fk_id=ti.FK_PACID'+#10+
                     ' and t.fk_id<>:p_fk_id ' ;

        oq.DeclareAndSet('p_fc_accessionnumber',otString,cxNumIssl1.Text); // sNUMBERISSL
        oq.DeclareAndSet('p_fk_id',otInteger,odsListNaz.FieldByName('fk_id').AsInteger);
        oq.Execute;
        if not oq.Eof then
        begin
          shErrMsg('Такой номер протокола существует'+#13+'Пациент '+oq.FieldAsString('pacfio'));
          Exit;
        end;
      finally
        oq.Free;
        Cursor := crDefault;
      end;   }
    end;
  end;
end;

procedure TfrmLabNaprav.cxOtchClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmLabNaprav.cxOtchEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmLabNaprav.cxOtchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '"', '№', ';', ':', '?', '=', '\', '/', '.', ',', '>', '<', '|', '[', ']', '{', '}'] then
    Key := #0;
end;

procedure TfrmLabNaprav.cxDSClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmLabNaprav.cxDSEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmLabNaprav.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if l_addr_loaded = True then
    begin
      try
        FreeAddrDll;
        FreeLibrary(HandleDLL);
        l_addr_loaded := False;
      except
      end;
    end;
end;

procedure TfrmLabNaprav.FormCreate(Sender: TObject);
var ods : TOracleDataSet;
begin
  //
  aAgreeSurgery1.Visible      := (v_db_lpu = 'SO');
  aAgreeTomoContrast1.Visible := (v_db_lpu = 'SO');
  aAgreeMRT1.Visible          := (v_db_lpu = 'SO');
  //
  if USE_ONE_ACCESSIONNUMBER=1 then
  begin
    cxLabel15.Visible:=True;
    cxNumIssl1.Visible:=True;
    VAccessionNumber.Visible:=False;
  end;
  
  ods := TOracleDataSet.Create(nil);
  try
    Screen.Cursor := crSQLWait;
    idTalon := 0;
    russian:=LoadKeyboardLayout('00000419', 0);
//-->> 1. "Заряжаем" датасеты
    if odsTypeKontrast.Active = False then
      odsTypeKontrast.Active := True;
    if odsKorennoe.Active = False then
      odsKorennoe.Active := True;
    if odsVidOplat.Active = False then
      odsVidOplat.Active := True;
    if odsCompanyName.Active = False then
      odsCompanyName.Active := True;
    if odsKemNapravlen.Active = False then
      odsKemNapravlen.Active := True;
    if odsRegPrin.Active = False then
      odsRegPrin.Active := True;
    if odsUrgent.Active = False then
      odsUrgent.Active := True;
    if odsNadbavka.Active = False then
      odsNadbavka.Active := True;
    if odsTarget.Active = False then
      odsTarget.Active := True;
    if odsVvod.Active = False then
      odsVvod.Active := True;
    if odsKtoKontrast.Active = False then
      odsKtoKontrast.Active := True;
    if odsCifraArchive.Active = False then
      odsCifraArchive.Active := True;
    if odsOtdelVydano.Active = False then
      odsOtdelVydano.Active := True;
    if odsRgLaborant.Active = False then
      odsRgLaborant.Active := True;
    if odsSnimokVid.Active = False then
      odsSnimokVid.Active := True;
    if odsTypePlenka.Active = False then
      odsTypePlenka.Active := True;
    if odsKolvoListov.Active = False then
      odsKolvoListov.Active := True;
    if odsKrat.Active = False then
      odsKrat.Active := True;
//-->> 2. Настройки
    bAdd.Visible := frmMain.get_show_add = '-1'; // показываем кнопку "Добавить" в зависимости от настроек
    if frmMain.get_show_agreepac = '-1' then // показываем кнопку "Согласие пациента" в зависимости от настроек
      bbAgree.Visible := ivAlways
    else
      bbAgree.Visible := ivNever;
    if frmMain.bIsAdmin = 1 then
      begin
        VTIME.Options.Editing := True;
      end else
      begin
        VTIME.Options.Editing := frmMain.get_disable_time <> '-1'; // редактируем время или нет
      end;
//-->> 3. Кабинеты МРТ
    ods.Session := frmMain.os;
    ods.SQL.Text := ' select asu.get_mrtkabs_for_xray(:pKabID) as res from dual ';
    ods.DeclareAndSet('pKabID', otInteger, frmMain.odsKab.FieldByName('FK_ID').AsInteger);
    ods.Open;
    VDOZA.Visible := True; //ods.FieldByName('res').AsInteger <> 1; // графа "Доза" не показывается в кабинете(-ах) МРТ
    VSNIMOK.Visible := True; //ods.FieldByName('res').AsInteger <> 1;
    VPROS.Visible := True; //ods.FieldByName('res').AsInteger <> 1;
//-->> 4. Показывать скорость ввода
    ceSpeed.Visible := frmMain.get_show_speed = '-1';
    lbSpeed1.Visible := ceSpeed.Visible;
    lbSpeed2.Visible := ceSpeed.Visible;
//-->> 5. Изначально нет изменений
    isSpeed := False;    
  finally
    ods.Free;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmLabNaprav.DoAddWLM;
var s, sSex, sGroup, sGuid, sVrachFIO, sModality : string;
    ods : TOracleDataSet;
     oq : TOracleQuery;
begin
  odsListNaz.First;
  while not odsListNaz.Eof do
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' select asu.get_smidname(fk_default) as namegroup from asu.tsmid where fk_id = :pfk_id ';
        ods.DeclareAndSet('pfk_id', otInteger, odsListNaz.FieldByName('fk_smid').AsInteger);
        ods.Open;
        sGroup := ods.FieldByName('namegroup').AsString; // группа исследования
        ods.Close;
        ods.DeleteVariables;
        ods.SQL.Text := ' select fk_guid from asu.txrayguid where fk_nazid = :pfk_nazid ';
        ods.DeclareAndSet('pfk_nazid', otInteger, odsListNaz.FieldByName('fk_id').AsInteger);
        ods.Open;
        sGuid := ods.FieldByName('fk_guid').AsString; // "наш" guid исследования
        ods.Close;
        ods.DeleteVariables;
        ods.SQL.Text := ' select asu.do_vrachfio(:pfk_vrachid) as vrachfio from dual ';
        ods.DeclareAndSet('pfk_vrachid', otInteger, odsListNaz.FieldByName('fk_vrachid').AsInteger);
        ods.Open;
        sVrachFIO := ods.FieldByName('vrachfio').AsString; // назначивший врач
        ods.Close;
        ods.DeleteVariables;
        ods.SQL.Text := ' select fc_aetitle from asu.txray_apparats where fk_kabinet = :pfk_kabinet ';
        ods.DeclareAndSet('pfk_kabinet', otInteger, odsListNaz.FieldByName('fk_roomid').AsInteger);
        ods.Open;
        sModality := ods.FieldByName('fc_aetitle').AsString; // модальность кабинета(аппарата)
      finally
        ods.Free;
      end;

      try
        HL7Sender1.Port := StrToInt(frmMain.get_lookinside_portsend);
      except
        HL7Sender1.Port := 0 ;
      end;
      HL7Sender1.Host := frmMain.get_lookinside_hl7ip;

      if cxMale.Checked then
        sSex := 'M'
      else
        sSex := 'F';
      if odsListNaz.FieldByName('fk_resultid').AsInteger = -1 then // если исследование еще не добавлено на WLM, то добавляем, иначе изменяем
        begin
          s := 'MSH|^~\&|||||||ORM^O01|||2.3|'+#13#10+
               'PID||'+IntToStr(pPACID)+'|||'+CyrToLatGOST(cxFam.Text+' '+copy(cxName.Text, 1, 1)+'. '+copy(cxOtch.Text, 1, 1))+'.||'+FormatDateTime('yyyymmdd', cxdeRojd.Date)+'|'+sSex+'||||||||||||||||||||'+#13#10+
               'PV1||||||||'+CyrToLatGOST(sVrachFIO)+'|||||||||||||||||||||||||||||||||||||'+#13#10+ // назначивший врач, лаборант, сотрудник
               'ORC|NW||||||^^^'+FormatDateTime('yyyymmddhhmmss', StrToDateTime(DateToStr(cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn:ss', IncSecond(cxteTimeProtocol.Time, 1))))+'||||||'+#13#10+
               'OBR||||'+IntToStr(odsListNaz.FieldByName('fk_id').AsInteger)+'^'+CyrToLatGOST(AnsiUpperCase(odsListNaz.FieldByName('fc_name').AsString))+'^'+AnsiUpperCase(sModality)+'^'+CyrToLatGOST(sGroup)+'||||||||||||||||||||||||'+#13#10+
               'ZDS|'+sGuid+'^^Application^DICOM|';
          oq := TOracleQuery.Create(nil);
          try
            oq.Session := frmMain.os;
            oq.Cursor := crSQLWait;
            oq.SQL.Text := ' update asu.tnazis set fk_resultid = 1 where fk_id = :pfk_id '; // проставляем статус "Исследование отправлено на WLM"
            oq.DeclareAndSet('pfk_id', otInteger, odsListNaz.FieldByName('fk_id').AsInteger);
            oq.Execute;
            frmMain.os.Commit;
          finally
            oq.Free;
          end;
        end else
        begin
          s := 'MSH|^~\&|||||||ORM^O01|||2.3|'+#13#10+
               'PID||'+IntToStr(pPACID)+'|||'+CyrToLatGOST(cxFam.Text+' '+copy(cxName.Text, 1, 1)+'. '+copy(cxOtch.Text, 1, 1))+'.||'+FormatDateTime('yyyymmdd', cxdeRojd.Date)+'|'+sSex+'||||||||||||||||||||'+#13#10+
               'PV1||||||||'+CyrToLatGOST(sVrachFIO)+'|||||||||||||||||||||||||||||||||||||'+#13#10+ // назначивший врач, лаборант, сотрудник
               'ORC|XO||||SC||^^^'+FormatDateTime('yyyymmddhhmmss', StrToDateTime(DateToStr(cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn:ss', IncSecond(cxteTimeProtocol.Time, 1))))+'||||||'+#13#10+
               'OBR||||'+IntToStr(odsListNaz.FieldByName('fk_id').AsInteger)+'^'+CyrToLatGOST(AnsiUpperCase(odsListNaz.FieldByName('fc_name').AsString))+'^'+AnsiUpperCase(sModality)+'^'+CyrToLatGOST(sGroup)+'||||||||||||||||||||||||'+#13#10+
               'ZDS|'+sGuid+'^^Application^DICOM|';
        end;
      HL7Sender1.SendMessage(s); // отправляем сообщение
      odsListNaz.Next;
    end;
end;

procedure TfrmLabNaprav.DoBlockLaborant;
var ods : TOracleDataSet;
begin
  if frmMain.bIsAdmin <> 1 then //frmMain.pSPEC <> frmMain.GET_ZAV_SPEC then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.SQL.Text := ' SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''BLOCK_LABORANT'' ';
        ods.Open;
        if ods.FieldByName('FC_VALUE').AsString <> '' then
          begin
            if StrToInt(ods.FieldByName('FC_VALUE').AsString) = -1 then
              begin
                odsListNaz.First;
                ods.DeleteVariables;
                ods.Close;
                ods.SQL.Text := ' SELECT * FROM ASU.TPODPISNAZ WHERE FK_NAZID = :PFK_NAZID AND FK_SOTRID = :PFK_SOTRID ';
                ods.DeclareAndSet('PFK_NAZID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
                ods.DeclareAndSet('PFK_SOTRID', otInteger, frmMain.pSOTRID);
                ods.Open;
                if ods.RecordCount = 0 then
                  cxRgLaborant.enabled := (frmMain.get_can_change_vrach = 1) or (cxRgLaborant.EditValue = null) or (cxRgLaborant.EditValue = 1) or (cxRgLaborant.Text = '')
                else
                  cxRgLaborant.Enabled := False;
              end;
          end;
      finally
        ods.Free;
      end;
    end;
end;

function TfrmLabNaprav.DoCheckParameters : Integer;
var nIBIDf, nIBYf : Integer;
    DateCh : TDateTime;
    ods : TOracleDataSet;
    i : Integer;
    arrID : array of Integer;
    str : String;
    strIssl : String;
    odsDate : TOracleDataSet;
    DateSys : TDateTime;
begin
  odsDate := TOracleDataSet.Create(nil);
  try
    odsDate.Session := frmMain.os;
    odsDate.Cursor := crSQLWait;
    odsDate.SQL.Text := ' select trunc(sysdate) as datesys from dual ';
    odsDate.Open;
    DateSys := odsDate.FieldByName('datesys').AsDateTime;
  finally
    odsDate.Free;
  end;
  if odsListNaz.RecordCount > 0 then
    begin
      i := 0;
      SetLength(arrID, odsListNaz.RecordCount);
      odsListNaz.First;
      while not odsListNaz.Eof do
        begin
          arrId[i] := odsListNaz.FieldByName('FK_ID').AsInteger;
          str:=str+IntToStr(arrId[i])+',';
          odsListNaz.Next;
        end;
      str:= COPY(str,1,Length(str)-1);
      //
      odsListNaz.First;
      while not odsListNaz.Eof do
      begin
        if odsListNaz.FieldByName('FC_TYPE').AsString = '' then
        begin
          if frmMain.get_num_not_empty = '-1' then
          begin
            Application.MessageBox('Укажите номер протокола!', 'Внимание', MB_OK+MB_ICONWARNING);
            Result := 0;
            Exit;
          end;
          //
          if (frmmain.xray_chkUniqAccNmb=1) then
          begin
            ods := TOracleDataSet.Create(nil);
            try
              ods.Session := frmMain.os;
              ods.SQL.Text := ' select fk_id, fc_name, to_char(fd_run, ''dd.mm.yyyy'') as fd_run '+#13+
                              '   from asu.tnazis '+#13+
                              '  where fc_type = :pfc_type '+#13+
                              '    and fk_id not in ('+str+') '+#13+
                              '    and fk_pacid <> :pfk_pacid ';
              ods.DeclareAndSet('pfc_type', otString, trim(odsListNaz.FieldByName('FC_TYPE').AsString));
              ods.DeclareAndSet('pfk_pacid', otInteger, pPACID); // !!! 07.06.2010 удалить по истечении 2-ух месяцев ... пока нельзя удалять
              ods.Open;                                          // на хантах проблема !!! у лаборантов нет кнопки "+" в направлении
              if ods.RecordCount > 0 then
                begin
                  strIssl := 'Такой номер протокола уже существует!'+#13#10;
                  ods.First;
                  while not ods.Eof do
                    begin
                      strIssl := strIssl+ods.FieldByName('fd_run').AsString+' '+ods.FieldByName('fc_name').AsString+';'+#13#10;
                      ods.Next;
                    end;
                  Application.MessageBox(PCHAR(strIssl), 'Предупреждение', MB_OK+MB_ICONWARNING);
                 // cxNumIssl.SetFocus;
                  Result := 0;
                  exit;
                end;
            finally
              ods.Free;
            end;
          end;
        end;
        odsListNaz.Next;
      end;
      odsListNaz.First;
    end;

  if pAMBUL = 1 then
    begin
      if cxNum.Text = '' then
        begin
          Application.MessageBox('Вам необходимо указать НОМЕР МЕДИЦИНСКОГО ДОКУМЕНТА пациента!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
          if cxNum.visible and cxNum.Enabled and (not cxNum.Properties.ReadOnly) then
           cxNum.SetFocus;
          Result:= 0;
          exit;
        end;

      if fGetIb(nIBIDf, nIBYf) = FALSE then
        begin
          Application.MessageBox('Внимание! Такой НОМЕР ДОКУМЕНТА (амбулаторной карты) уже существует в Базе Данных!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
          if cxNum.visible and cxNum.Enabled and (not cxNum.Properties.ReadOnly) then
           cxNum.SetFocus;
          Result:= 0;
          exit;
		    end;
	  end;

  if cxFam.Text = '' then
    begin
      Application.MessageBox('Вам необходимо указать ФАМИЛИЮ пациента!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
      cxFam.SetFocus;
      Result:= 0;
      exit;
    end;

  DateCh := DateSys;
  if (cxdeRojd.Text = '') or (cxdeRojd.Text = '0') or (cxdeRojd.Text = '30.12.1899') or (TryStrToDate(cxdeRojd.Text, DateCh) = False) then
    begin
      Application.MessageBox('Вам необходимо указать ДАТУ РОЖДЕНИЯ пациента!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
      cxdeRojd.SetFocus;
      Result:= 0;
      exit;
    end;

  if cxdeRojd.Date < StrToDateTime('01.01.1899') then
    begin
      Application.MessageBox('Проверьте правильность ввода даты рождения!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
      cxdeRojd.SetFocus;
      Result := 0;
      exit;
    end;

  if trunc(cxdeRojd.Date) > DateSys then
    begin
      Application.MessageBox('Дата рождения не может быть больше текущей даты!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
      cxdeRojd.SetFocus;
      Result := 0;
      exit;
    end;

  if (cxMale.Checked = FALSE) and (cxFemale.Checked = FALSE) then
    begin
      Application.MessageBox('Вам необходимо указать ПОЛ пациента!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
      cxMale.SetFocus;
      Result:= 0;
      exit;
    end;

  if odsListNaz.RecordCount <> 0 then
    begin
      if (cxdeDateProtocol.Text = '') then
        begin
          Application.MessageBox('Вам необходимо указать ДАТУ ИССЛЕДОВАНИЯ!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
          cxdeDateProtocol.SetFocus;
          Result:= 0;
          exit;
        end;
    end;

  if ((VSNIMOK.Visible = True) and (frmMain.get_CheckAmmSnimki=1)) then
    begin
      odsListNaz.First;
      while not odsListNaz.Eof do
        begin
          if (VSNIMOK.DataBinding.Field.Value = 0) or (VarToStr(VSNIMOK.DataBinding.Field.Value) = '') then
            begin
              Application.MessageBox('Вам необходимо указать КОЛ-ВО СНИМКОВ!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
              VSNIMOK.Focused := True;
              Result := 0;
              exit;
            end;
          odsListNaz.Next;
        end;
    end;

  if VDOZA.Visible = True  and ( v_db_lpu <> 'SO' ) and (frmMain.get_CheckDoza=1) then
    begin
      odsListNaz.First;
      while not odsListNaz.Eof do
        begin
          if (VDOZA.DataBinding.Field.Value = 0) or (VarToStr(VDOZA.DataBinding.Field.Value) = '') then
            begin
              Application.MessageBox('Вам необходимо указать ДОЗУ!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
              VDOZA.Focused := True;
              Result := 0;
              exit;
            end;
          odsListNaz.Next;
        end;
    end;

  if (isKonsult = True) and (cxKem.Tag = 0) then
    begin
      Application.MessageBox('Услуга является консультативной, следовательно Вам обязательно нужно указать направившее учреждение!',
                             'Предупреждение !', MB_OK + MB_ICONWARNING);
      cxKem.SetFocus;
      Result := 0;
      exit;
    end;

// -- проверяем на дату распределения
  if frmMain.get_kolvo_raspred <> 0 then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' select sysdate + :pkolvo as farday from dual ';
        ods.DeclareAndSet('pkolvo', otInteger, frmMain.get_kolvo_raspred);
        ods.Open;
        if cxdeDateProtocol.Date > ods.FieldByName('farday').AsDateTime then
          begin
            MessageDlg('Внимание!'+#13+#10+
                       'Вы не можете распределить исследование на эту дату!'+#13+#10+
                       'Выберите дату меньше '+DateTimeToStr(ods.FieldByName('farday').AsDateTime)+'!', mtInformation, [mbOK], 0);
            Result:= 0;
            cxdeDateProtocol.SetFocus;
            exit;
          end;
      finally
        ods.Free;
      end;
    end;

  Result := 1;
end;

procedure TfrmLabNaprav.DoCheckUslugKonsult;
var ods : TOracleDataSet;
begin
  if (pNAZID <> 0) and (pAMBUL = 1) then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.SQL.Text := ' select count(*) as cnt from asu.tkonsult_uslug where fk_nazid = :pfk_nazid ';
        ods.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
        ods.Open;
        isKonsult := ods.FieldByName('cnt').AsInteger > 0;
        lbKons.Visible := isKonsult = True;
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' select fk_talonid from asu.tambtalon_naz where fk_nazid = :pfk_nazid ';
        ods.DeclareAndSet('pfk_nazid', otInteger, pNAZID);
        ods.Open;
        idTalon := ods.FieldByName('fk_talonid').AsInteger;
      finally
        ods.Free;
      end;
    end;
end;

function TfrmLabNaprav.fGetIB(var nIBIDf, nIBYf: Integer): boolean;
const s = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '/'];
var i : Integer;
    tIBID, tIBY : string;
    bIBY : Boolean;
    oq : TOracleDataSet;
begin
    tIBID := '';
    tIBY := '';
    bIBY := False;
    if (cxNum.Text = '') or (cxNum.Text[1] = '/') then
    begin
        fGetIB := False;
        Exit;
    end
    else
        for i := 1 to Length(cxNum.Text) do
        begin
            if (cxNum.Text[i] in s) then
            begin
                if cxNum.Text[i] = '/' then
                begin
                    bIBY := True;
                    Continue;
                end;
                if not bIBY then
                    tIBID := tIBID + cxNum.Text[i]
                else
                    tIBY := tIBY + cxNum.Text[i]
            end
            else
            begin
                fGetIB := frmMain.GET_DB_NAME = 'PP'; //added by Melnikov 0214.02.06 #29561
                Exit;
            end;
        end;
    try
      if frmMain.GET_DB_NAME = 'PP' then//added by Melnikov 0214.02.06 begin #29561
       begin
        if not trystrtoint(tIBID,nIBID) then
         begin
            fGetIB := true;
            Exit;
         end;
        if not trystrtoint(tIBY,nIBY) then
         begin
            fGetIB := true;
            Exit;
         end;
       end
      else//added by Melnikov 0214.02.06 end
       begin
        nIBID := StrToInt(tIBID);
        nIBY := StrToInt(tIBY);
       end;
    except on e: EConvertError do
        begin
            fGetIB := False;
            Exit;
        end;
    end;
    oq := TOracleDataSet.Create(nil);
    oq.Session := frmMain.os;
//    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' SELECT COUNT(TAMBULANCE.FK_ID) AS FP_COUNT '+#13+
                   '   FROM ASU.TAMBULANCE, ASU.TDOCOBSL '+#13+
                   '  WHERE TDOCOBSL.FN_YEAR=:FK_IBY '+#13+
                   '    AND TDOCOBSL.FK_NUMIB=:FK_IBID '+#13+
                   '    AND TAMBULANCE.FK_ID <> :PPACID '+#13+
                   '    AND TAMBULANCE.FK_DOCOBSL = TDOCOBSL.FK_ID '+#13+
                   '    AND TDOCOBSL.FK_VIDDOCID = :PUSLVIDID ';
    oq.DeclareAndSet('FK_IBY', otInteger, nIBY);
    oq.DeclareAndSet('FK_IBID', otInteger, nIBID);
    oq.DeclareAndSet('pPACID', otInteger, pPACID);
    oq.DeclareAndSet('pUSLVIDID', otInteger, pTypeDocID);
    oq.Open;
    if oq.FieldByName('fp_count').AsInteger > 0 then
    begin
        oq.Close;
        oq.Free;
        fGetIB := False;
        Exit;
    end;
    oq.Close;
    oq.Free;
    fGetIB := True;
end;

procedure TfrmLabNaprav.odsVidDocBeforeOpen(DataSet: TDataSet);
begin
//  odsVidDoc.SetVariable('PFK_OTDELID', pOTDELID);
  odsVidDoc.SetVariable('PFK_ID', pPACID);
end;

procedure TfrmLabNaprav.teFilterClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmLabNaprav.teFilterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmLabNaprav.teFilterKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  odsKemNapravlen.Filtered := False;
  if length(teFilter.Text) > 0 then
    begin
      odsKemNapravlen.Filter := 'fc_upper = ''*' + AnsiUpperCase(teFilter.Text) + '*'' ';
      odsKemNapravlen.Filtered := true;
    end;
end;

procedure TfrmLabNaprav.TVListNazFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  bDel.Enabled := odsListNaz.FieldByName('FK_VRACHID').AsInteger = frmMain.pSOTRID;
end;

procedure TfrmLabNaprav.DoTextTypeStac;
var ods : TOracleDataSet;
begin
  cxKem.Enabled := False;
  cxVrach.Enabled := False;
  CheckEnabledControls;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT COUNT(FK_ID) AS CNT FROM ASU.TKARTA WHERE FK_ID=:PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pPACID);
    ods.Open;
    if ods.FieldByName('CNT').AsInteger > 0 then
      begin
        ods.Close;
        ods.DeleteVariables;
        ods.SQL.Text := ' SELECT FL_VOV, FL_IVOV, FL_ULA, FL_PMC, FC_PUT, FK_PRIZN, fp_tek_coc, '+#13+
  		                	'        TPEOPLES.FC_FAM, TPEOPLES.FC_IM, TPEOPLES.FC_OTCH, '+#13+
  			                '        DECODE(TO_CHAR(TPEOPLES.FD_ROJD, ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), TPEOPLES.FD_ROJD) as FD_ROJD, '+#13+
  		                	'        TPEOPLES.FP_SEX, '+#13+
                        '        asu.GET_IB(:PFK_ID) AS NUMDOC, '+#13+
                        '        asu.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TKARTA.FK_ID) AS PACAGE, '+#13+
                        '        TPEOPLES.FC_PHONE AS PHONE, '+#13+
                        '        (SELECT FK_SMID '+#13+
                        '           FROM asu.TIB '+#13+
                        '          WHERE FK_PACID = :PFK_PEPLID '+#13+
                        '            AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID '+#13+
                        '                             WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''KOREN_NASEL''))) AS KOREN '+#13+
                        '   FROM asu.TKARTA, asu.TPEOPLES '+#13+
                        '  WHERE TKARTA.FK_ID = :PFK_ID AND TPEOPLES.FK_ID = :PFK_PEPLID ';
        ods.DeclareAndSet('PFK_ID', otInteger, pPACID);
        ods.DeclareAndSet('PFK_PEPLID', otInteger, pPEPLID);
        ods.Open;
        cxFam.Text := ods.FieldByName('FC_FAM').AsString;
        cxName.Text := ods.FieldByName('FC_IM').AsString;
        cxOtch.Text := ods.FieldByName('FC_OTCH').AsString;
        cxNum.Text := ods.FieldByName('NUMDOC').AsString;
        cxdeRojd.Date := ods.FieldByName('FD_ROJD').AsDateTime;
        cxAge.Caption := IntToStr(ods.FieldByName('PACAGE').AsInteger);
        cxTelefon.Text := ods.FieldByName('PHONE').AsString;
        lbVyp1.Visible := ods.FieldByName('fp_tek_coc').AsInteger = 3;
        lbVyp2.Visible := ods.FieldByName('fp_tek_coc').AsInteger = 3;
        cxKorennoe.Properties.OnChange := nil;
        cxKorennoe.EditValue := ods.FieldByName('KOREN').AsInteger;
        cxKorennoe.Properties.OnChange := cxKorennoePropertiesChange;
        if ods.FieldByName('FP_SEX').AsInteger = 1 then
          cxMale.Checked := TRUE
        else
          cxFemale.Checked := TRUE;
        EDIT_MODE := TRUE;
      end else
      begin
        EDIT_MODE := FALSE;
      end;
  finally
    ods.Free;
  end;  
end;

procedure TfrmLabNaprav.CheckEnabledControls;
begin
  if pAmbul = 0 then //для стационарных пациентов
    begin
      cxFam.Enabled := FALSE;
      cxName.Enabled := FALSE;
      cxOtch.Enabled := FALSE;
      cxNum.Enabled := FALSE;
      cxdeRojd.Enabled := FALSE;
      cxMale.Enabled := FALSE;
      cxFemale.Enabled := FALSE;
    end;  
end;

procedure TfrmLabNaprav.DoTextTypeNaprav;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' BEGIN '+
                    '   SELECT MAX(FC_CHAR) INTO :NAMEDIAG '+
                    '     FROM asu.TIB '+
                    '    WHERE FK_PACID = :pFK_NAZID AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''XRAY_DIAGNOZ'');   '+
                    '   IF :NAMEDIAG IS NULL THEN '+
                    '     SELECT asu.PKG_LISTS.GET_DIAG_MAIN(TNAZIS.FK_PACID) INTO :NAMEDIAG FROM asu.TNAZIS WHERE FK_ID = :PFK_NAZID; '+
                    '   END IF; '+
                    ' END; ';
    ods.DeclareVariable('NAMEDIAG', otString);
    ods.DeclareAndSet('PFK_NAZID', otInteger, pNAZID);
    ods.Open;
    cxDS.Text := ods.GetVariable('NAMEDIAG');
  finally
    ods.Free;
  end;
end;

procedure TfrmLabNaprav.cxTreeTypeKontrastDblClick(Sender: TObject);
begin
  cxTypeKontrast.Text := odsTypeKontrast.FieldByName('FC_NAME').AsString;
  cxTypeKontrast.PopupWindow.Close;
end;

procedure TfrmLabNaprav.DoInsertEditParametersNaz;
var oqNaz : TOracleQuery;
begin
  odsListNaz.First;
  while not odsListNaz.Eof do
  begin
    if (frmMain.IDNaz <> 0) or (pNAZID <> 0) then
    begin
      oqNaz := TOracleQuery.Create(nil);
      try
        oqNaz.Session := frmMain.os;
  //------------------------------------------------------------------------------
        if cxUrgent.Text <> '' then  //срочность
          begin
            if odsListNaz.FieldByName('FK_NAZTYPEID').AsInteger <> cxUrgent.EditValue then
              begin
                oqNaz.DeleteVariables;
                oqNaz.SQL.Text := ' UPDATE asu.TNAZIS SET FK_NAZTYPEID = :PFK_NAZTYPEID WHERE FK_ID = :PFK_ID ';
                oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
                oqNaz.DeclareAndSet('PFK_NAZTYPEID', otInteger, cxUrgent.EditValue);
                oqNaz.Execute;
                frmMain.os.Commit;
              end;
          end;
  //------------------------------------------------------------------------------
        if cxNadbavka.Text <> '' then //надбавка к времени
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+#13+
                              '   Cnt1 NUMBER; '+#13+
                              ' BEGIN '+#13+
                              '   SELECT COUNT(FK_ID) INTO Cnt1 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''TIME_NORMA_ISSL'')); '+#13+
                              ' IF Cnt1 > 0 THEN '+#13+
                              '   UPDATE TIB SET FK_SMID=:pFK_SMID1, FK_SMEDITID=:pFK_SMEDITID1, FK_VRACHID=:pFK_VRACHID, fd_date=sysdate WHERE FK_PACID=:pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER=(SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM=''TIME_NORMA_ISSL'')); '+#13+
                              ' ELSE '+#13+
                              '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFK_SMID1, :pFK_SMEDITID1, :pFK_VRACHID, sysdate); '+#13+
                              ' END IF; '+#13+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFK_SMID1', otInteger, cxNadbavka.EditValue);
            oqNaz.DeclareAndSet('pFK_SMEDITID1', otInteger, cxNadbavka.EditValue);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if cxTarget.Text <> '' then //цель
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+#13+
                              '   Cnt2 NUMBER; '+#13+
                              ' BEGIN '+#13+
                              '   SELECT COUNT(FK_ID) INTO Cnt2 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''ISSL_TARGET''));'+#13+
                              ' IF Cnt2 > 0 THEN '+#13+
                              '   UPDATE TIB SET FK_SMID=:pFK_SMID2, FK_SMEDITID=:pFK_SMEDITID2, FK_VRACHID=:pFK_VRACHID, fd_date=sysdate WHERE FK_PACID=:pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER=(SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM=''ISSL_TARGET'')); '+#13+
                              ' ELSE '+#13+
                              '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFK_SMID2, :pFK_SMEDITID2, :pFK_VRACHID, sysdate); '+#13+
                              ' END IF; '+#13+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFK_SMID2', otInteger, cxTarget.EditValue);
            oqNaz.DeclareAndSet('pFK_SMEDITID2', otInteger, cxTarget.EditValue);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if cxTypeKontrast.Text <> '' then //контраст(тип)
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+#13+
                              '   Cnt3 NUMBER; '+#13+
                              ' BEGIN '+#13+
                              '   SELECT COUNT(FK_ID) INTO Cnt3 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_ID IN '+' (SELECT FK_ID FROM TSMID START WITH FK_ID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_TYPEKONTRAST'') CONNECT BY PRIOR FK_ID = FK_OWNER)); '+#13+
                              ' IF Cnt3 > 0 THEN '+#13+
                              '   UPDATE TIB SET FK_SMID = :pFK_SMID3, FK_SMEDITID =:pFK_SMEDITID3, FK_VRACHID =:pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_ID IN '+' (SELECT FK_ID FROM TSMID START WITH FK_ID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_TYPEKONTRAST'') CONNECT BY PRIOR FK_ID = FK_OWNER)); '+#13+
                              ' ELSE '+#13+
                              '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFK_SMID3, :pFK_SMEDITID3, :pFK_VRACHID, sysdate); '+#13+
                              ' END IF; '+#13+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFK_SMID3', otInteger, odsTypeKontrast.FieldByName('FK_ID').AsInteger); //!!! неправильно сохраняется
            oqNaz.DeclareAndSet('pFK_SMEDITID3', otInteger, odsTypeKontrast.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if cxKolvoKontrast.Value <> 0 then //кол-во контраста
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              ' nSMID4 NUMBER; '+
                              ' Cnt4 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt4 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOKONTRAST''); '+
                              ' IF Cnt4 > 0 THEN '+
                              '   UPDATE TIB SET FN_NUM = :pFN_NUM4, FK_SMEDITID = :PFK_SMEDITID, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOKONTRAST''); '+
                              ' ELSE '+
                              '   SELECT FK_ID INTO nSMID4 FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOKONTRAST''; '+
                              '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :PFN_NUM4, nSMID4, :PFK_SMEDITID, :pFK_VRACHID, sysdate); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFN_NUM4', otFloat, cxKolvoKontrast.Value); 
            oqNaz.DeclareAndSet('PFK_SMEDITID', otInteger, odsTypeKontrast.FieldByName('FK_ID').AsInteger); // !!! почему здесь сохраняется ветка контраст (тип), возможно так и надо 
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if cxVvod.Text <> '' then //способ ввода
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   Cnt5 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt5 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_VVOD'')); '+
                              ' IF Cnt5 > 0 THEN '+
                              '   UPDATE TIB SET FK_SMID=:pFK_SMID5, FK_SMEDITID=:pFK_SMEDITID5, FK_VRACHID=:pFK_VRACHID, fd_date=sysdate WHERE FK_PACID=:pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER=(SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM=''XRAY_VVOD'')); '+
                              ' ELSE '+
                              '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFK_SMID5, :pFK_SMEDITID5, :pFK_VRACHID, sysdate); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFK_SMID5', otInteger, cxVvod.EditValue);
            oqNaz.DeclareAndSet('pFK_SMEDITID5', otInteger, cxVvod.EditValue);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if odsListNaz.FieldByName('KOLVO').AsFloat <> 0 then //кол-во снимков
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   nSMID7 NUMBER; '+
                              '   Cnt7 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt7 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOUCHET''); '+
                              ' IF Cnt7 > 0 THEN '+
                              '   UPDATE TIB SET FN_NUM = :pFN_NUM7, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOUCHET''); '+
                              ' ELSE '+
                              '   SELECT FK_ID INTO nSMID7 FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOUCHET''; '+
                              '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFN_NUM7, nSMID7, nSMID7, :pFK_VRACHID, sysdate); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFN_NUM7', otFloat, odsListNaz.FieldByName('KOLVO').AsFloat);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if odsListNaz.FieldByName('KOLVO').AsFloat <> 0 then //кол-во просвечиваний (скопий)
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   nSMID25 NUMBER; '+
                              '   Cnt25 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt25 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOPRSV''); '+
                              ' IF Cnt25 > 0 THEN '+
                              '   UPDATE TIB SET FN_NUM = :pFN_NUM25, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOPRSV''); '+
                              ' ELSE '+
                              '   SELECT FK_ID INTO nSMID25 FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOPRSV''; '+
                              '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFN_NUM25, nSMID25, nSMID25, :pFK_VRACHID, sysdate); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFN_NUM25', otFloat, odsListNaz.FieldByName('KOLVOPRSV').AsFloat);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;        
  //------------------------------------------------------------------------------
        if cxKolvoVidano.Value <> 0 then //кол-во выдано
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   nSMID8 NUMBER; '+
                              '   Cnt8 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt8 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOKOMY''); '+
                              ' IF Cnt8 > 0 THEN '+
                              '   UPDATE TIB SET FN_NUM = :pFN_NUM8, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOKOMY''); '+
                              ' ELSE '+
                              '   SELECT FK_ID INTO nSMID8 FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOKOMY''; '+
                              '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFN_NUM8, nSMID8, nSMID8, :pFK_VRACHID, sysdate); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFN_NUM8', otInteger, cxKolvoVidano.Value);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if cxRemark.Text <> '' then //ФИО, примечания
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   nSMID9 NUMBER; '+
                              '   Cnt9 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt9 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_FIO_REMARK''); '+
                              ' IF Cnt9 > 0 THEN '+
                              '   UPDATE TIB SET FC_CHAR = :pFC_CHAR9, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_FIO_REMARK''); '+
                              ' ELSE '+
                              '   SELECT FK_ID INTO nSMID9 FROM TSMID WHERE FC_SYNONIM = ''XRAY_FIO_REMARK''; '+
                              '   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :PFC_CHAR9, nSMID9, nSMID9, :pFK_VRACHID, sysdate); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFC_CHAR9', otString, cxRemark.Text);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if odsListNaz.FieldByName('DOZA').AsFloat <> 0 then //доза -1
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   Cnt9 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt9 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1; '+
                              ' IF Cnt9 > 0 THEN '+
                              '   UPDATE TIB SET FN_NUM = :pFN_NUM9, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1; '+
                              ' ELSE '+
                              '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFN_NUM9, -1, -1, :pFK_VRACHID, sysdate); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFN_NUM9', otFloat, odsListNaz.FieldByName('DOZA').AsFloat);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if odsListNaz.FieldByName('TIME').AsFloat <> 0 then //время -2  
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   Cnt10 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt10 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID = -2 AND FK_SMEDITID = -2; '+
                              ' IF Cnt10 > 0 THEN '+
                              '   UPDATE TIB SET FN_NUM = :pFN_NUM10, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID = -2 AND FK_SMEDITID = -2; '+
                              ' ELSE '+
                              '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFN_NUM10, -2, -2, :pFK_VRACHID, sysdate); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFN_NUM10', otFloat, odsListNaz.FieldByName('TIME').AsFloat);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if cxOnPhone.Enabled then //запись по телефону
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+#13+
                              '   nSMID12 NUMBER; '+#13+
                              '   Cnt12 NUMBER; '+#13+
                              ' BEGIN '+#13+
                              '   SELECT COUNT(FK_ID) INTO Cnt12 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''ZAPISAN_ONPHONE''); '+#13+
                              ' IF Cnt12 > 0 THEN '+#13+
                              '   UPDATE TIB SET FN_NUM = :pFN_NUM12, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''ZAPISAN_ONPHONE''); '+#13+
                              ' ELSE '+#13+
                              '   SELECT FK_ID INTO nSMID12 FROM TSMID WHERE FC_SYNONIM = ''ZAPISAN_ONPHONE''; '+#13+
                              '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFN_NUM12, nSMID12, nSMID12, :pFK_VRACHID, sysdate); '+#13+
                              ' END IF; '+#13+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFN_NUM12', otInteger, cxOnPhone.Checked);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if (trim(odsListNaz.FieldByName('FC_TYPE').AsString) <> '') and (odsListNaz.FieldByName('FC_TYPE').AsString <> '0') then //номер исследования      cxNumIssl.Text
          begin
            //odsListNaz.First;
            // !!! еслю флюрография - то писать сюда :   XRAY_FLU_NUMBER
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+#13+
                              '   nSMID11 NUMBER; '+#13+
                              '   Cnt11 NUMBER; '+#13+
                              ' BEGIN '+#13+
                              '   SELECT COUNT(FK_ID) INTO Cnt11 '+#13+
                              '     FROM asu.TIB '+#13+
                              '    WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM in (''NUMBER_ISSL'', ''XRAY_FLU_NUMBER'')); '+#13+
                              ' IF Cnt11 > 0 THEN '+#13+
                              '   UPDATE asu.TIB '+#13+
                              '      SET FC_CHAR = :pFC_CHAR11, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate, '+#13+
                                        'fk_smid = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL''), '+#13+
                                        'fk_smeditid = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL'') '+#13+
                              '    WHERE FK_PACID = :pFK_ID AND '+#13+
                                        'FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM in (''NUMBER_ISSL'', ''XRAY_FLU_NUMBER'')); '+#13+
                              ' ELSE '+#13+
                              '   SELECT FK_ID INTO nSMID11 FROM asu.TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL''; '+#13+
                              '   INSERT INTO asu.TIB(FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) '+#13+
                              '   VALUES(:pFK_ID, :pFC_CHAR11, nSMID11, nSMID11, :pFK_VRACHID, sysdate); '+#13+
                              ' END IF; '+#13+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFC_CHAR11', otString, Trim(cxNumIssl1.Text) ); //odsListNaz.FieldByName('fc_accessionnumber').AsString Trim(odsListNaz.FieldByName('FC_TYPE').AsString));    //   cxNumIssl.Text
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if (cxTelefon.Visible = TRUE) and (cxTelefon.Text <> '') then //Контактный телефон
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+#13+
                              '   nSMID13 NUMBER; '+#13+
                              '   Cnt13 NUMBER; '+#13+
                              ' BEGIN '+#13+
                              '   SELECT COUNT(FK_ID) INTO Cnt13 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''KONTAKT_PHONE''); '+#13+
                              ' IF Cnt13 > 0 THEN '+#13+
                              '   UPDATE TIB SET FC_CHAR = :pFC_CHAR13, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''KONTAKT_PHONE''); '+#13+
                              ' ELSE '+#13+
                              '   SELECT FK_ID INTO nSMID13 FROM TSMID WHERE FC_SYNONIM = ''KONTAKT_PHONE''; '+#13+
                              '   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :PFC_CHAR13, nSMID13, nSMID13, :pFK_VRACHID, sysdate); '+#13+
                              ' END IF; '+#13+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFC_CHAR13', otString, cxTelefon.Text);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if cxRgLaborant.Text <> '' then //Рентген-лаборант
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   nSMID15 NUMBER; '+
                              '   Cnt15 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt15 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''RG_LABORANT''); '+
                              ' IF Cnt15 > 0 THEN '+
                              '   UPDATE TIB SET FN_NUM = :pFN_NUM15, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''RG_LABORANT''); '+
                              ' ELSE '+
                              '   SELECT FK_ID INTO nSMID15 FROM TSMID WHERE FC_SYNONIM = ''RG_LABORANT''; '+
                              '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFN_NUM15, nSMID15, nSMID15, :pFK_VRACHID, sysdate); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('pFN_NUM15', otInteger, cxRgLaborant.EditValue);
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID); 
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if (cxVrach.Text <> '') and (pAMBUL = 1) then //Направивший врач
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   nSMID25 NUMBER; '+
                              '   Cnt25 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt25 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''VRACH_NAPRAVIL''); '+
                              ' IF Cnt25 > 0 THEN '+
                              '   UPDATE TIB SET FC_CHAR = :pFC_CHAR25, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''VRACH_NAPRAVIL''); '+
                              ' ELSE '+
                              '   SELECT FK_ID INTO nSMID25 FROM TSMID WHERE FC_SYNONIM = ''VRACH_NAPRAVIL''; '+
                              '   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFC_CHAR25, nSMID25, nSMID25, :pFK_VRACHID, sysdate); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('pFC_CHAR25', otString, cxVrach.Text);
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if cxNumDisk.Text <> '' then //Номер диска
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   nSMID16 NUMBER; '+
                              '   Cnt16 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt16 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''NUMBER_DISK''); '+
                              ' IF Cnt16 > 0 THEN '+
                              '   UPDATE TIB SET FC_CHAR = :pFC_CHAR16, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''NUMBER_DISK''); '+
                              ' ELSE '+
                              '   SELECT FK_ID INTO nSMID16 FROM TSMID WHERE FC_SYNONIM = ''NUMBER_DISK''; '+
                              '   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :PFC_CHAR16, nSMID16, nSMID16, :pFK_VRACHID, sysdate); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFC_CHAR16', otString, cxNumDisk.Text);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if cxCifraArchive.Text <> '' then //цифровой архив
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   Cnt17 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt17 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''CIFRA_ARCHIVE'')); '+
                              ' IF Cnt17 > 0 THEN '+
                              '   UPDATE TIB SET FK_SMID=:pFK_SMID17, FK_SMEDITID=:pFK_SMEDITID17, FK_VRACHID=:pFK_VRACHID, fd_date=sysdate WHERE FK_PACID=:pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER=(SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM=''CIFRA_ARCHIVE'')); '+
                              ' ELSE '+
                              '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFK_SMID17, :pFK_SMEDITID17, :pFK_VRACHID, sysdate); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFK_SMID17', otInteger, cxCifraArchive.EditValue);
            oqNaz.DeclareAndSet('pFK_SMEDITID17', otInteger, cxCifraArchive.EditValue);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
          if cxDateVydano.Text <> '' then //дата выдачи
            begin
              oqNaz.DeleteVariables;
              oqNaz.SQL.Text := ' DECLARE '+
                                '   nSMID18 NUMBER; '+
                                '   Cnt18 NUMBER; '+
                                ' BEGIN '+
                                '   SELECT COUNT(FK_ID) INTO Cnt18 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''DATE_VYDANO''); '+
                                ' IF Cnt18 > 0 THEN '+
                                '   UPDATE TIB SET FD_DATE = :pFD_DATE18, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''DATE_VYDANO''); '+
                                ' ELSE '+
                                '   SELECT FK_ID INTO nSMID18 FROM TSMID WHERE FC_SYNONIM = ''DATE_VYDANO''; '+
                                '   INSERT INTO TIB(FK_PACID, FD_DATE, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :PFD_DATE18, nSMID18, nSMID18, :pFK_VRACHID); '+
                                ' END IF; '+
                                ' END; ';
              oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
              oqNaz.DeclareAndSet('pFD_DATE18', otDate, cxDateVydano.Date);
              oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
              oqNaz.Execute;
              frmMain.os.Commit;
            end;
  //------------------------------------------------------------------------------
          if cxDateVozvrat.Text <> '' then //дата возврата
            begin
              oqNaz.DeleteVariables;
              oqNaz.SQL.Text := ' DECLARE '+
                                '   nSMID19 NUMBER; '+
                                '   Cnt19 NUMBER; '+
                                ' BEGIN '+
                                '   SELECT COUNT(FK_ID) INTO Cnt19 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''DATE_VOZVRAT''); '+
                                ' IF Cnt19 > 0 THEN '+
                                '   UPDATE TIB SET FD_DATE = :pFD_DATE19, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''DATE_VOZVRAT''); '+
                                ' ELSE '+
                                '   SELECT FK_ID INTO nSMID19 FROM TSMID WHERE FC_SYNONIM = ''DATE_VOZVRAT''; '+
                                '   INSERT INTO TIB(FK_PACID, FD_DATE, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :PFD_DATE19, nSMID19, nSMID19, :pFK_VRACHID); '+
                                ' END IF; '+
                                ' END; ';
              oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
              oqNaz.DeclareAndSet('pFD_DATE19', otDate, cxDateVozvrat.Date);
              oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
              oqNaz.Execute;
              frmMain.os.Commit;
            end;
  //------------------------------------------------------------------------------
        if cxOtdelVydano.Text <> '' then //Отделение
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   nSMID20 NUMBER; '+
                              '   Cnt20 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt20 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''OTDEL_VYDANO'')); '+
                              ' IF Cnt20 > 0 THEN '+
                              '   UPDATE TIB SET FK_SMID = :pFK_SMID20, FK_SMEDITID =:pFK_SMEDITID20, FC_CHAR = :pFC_CHAR20, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER ='+' (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''OTDEL_VYDANO'')); '+
                              ' ELSE '+
                              '   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFC_CHAR20, :pFK_SMID20, :pFK_SMEDITID20, :pFK_VRACHID, sysdate); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('pFK_SMID20', otInteger, cxOtdelVydano.EditValue);
            oqNaz.DeclareAndSet('pFK_SMEDITID20', otInteger, cxOtdelVydano.EditValue);
            oqNaz.DeclareAndSet('pFC_CHAR20', otString, cxOtdelVydano.Text);
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if cxNumKorob.Text <> '' then //Номер коробки
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   nSMID21 NUMBER; '+
                              '   Cnt21 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt21 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''NUMBER_KOROB''); '+
                              ' IF Cnt21 > 0 THEN '+
                              '   UPDATE TIB SET FC_CHAR = :pFC_CHAR21, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''NUMBER_KOROB''); '+
                              ' ELSE '+
                              '   SELECT FK_ID INTO nSMID21 FROM TSMID WHERE FC_SYNONIM = ''NUMBER_KOROB''; '+
                              '   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :PFC_CHAR21, nSMID21, nSMID21, :pFK_VRACHID, sysdate); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFC_CHAR21', otString, cxNumKorob.Text);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if (cxColor.Text <> '') and (cxColor.Visible = TRUE) then //цвет
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   Cnt22 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt22 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_COLOR'')); '+
                              ' IF Cnt22 > 0 THEN '+
                              '   UPDATE TIB SET FK_SMID=:pFK_SMID22, FK_SMEDITID=:pFK_SMEDITID22, FK_VRACHID=:pFK_VRACHID, fd_date=sysdate WHERE FK_PACID=:pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER=(SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM=''XRAY_COLOR'')); '+
                              ' ELSE '+
                              '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFK_SMID22, :pFK_SMEDITID22, :pFK_VRACHID, sysdate); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFK_SMID22', otInteger, cxColor.EditValue);
            oqNaz.DeclareAndSet('pFK_SMEDITID22', otInteger, cxColor.EditValue);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if ((cxKem.Text <> '') or (cxKem.Tag <> 0)) and (pAMBUL = 1) then //Кем направлен
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+#13+
                              '   ID23 NUMBER; '+#13+
                              ' BEGIN '+#13+
                              '   SELECT MAX(FK_ID) INTO ID23 '+#13+
                              '     FROM asu.TIB '+#13+
                              '    WHERE FK_PACID = :PFK_ID '+#13+
                              '      AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID '+#13+
                              '                      START WITH FC_SYNONIM = ''KEM_NAPRAVLEN'' '+#13+
                              '                      CONNECT BY PRIOR FK_ID = FK_OWNER '+#13+
                              '                      UNION ALL '+#13+
                              '                      SELECT FK_ID FROM ASU.TSMID '+#13+
                              '                      START WITH FC_SYNONIM = ''PD_NAPRAVIV_YCH'' '+#13+
                              '                      CONNECT BY PRIOR FK_ID = FK_OWNER); '+#13+
                              ' IF ID23 IS NOT NULL THEN '+#13+
                              '   UPDATE asu.TIB '+#13+
                              '      SET FK_SMID = :pFK_SMID23, '+#13+
                              '          FC_CHAR = :pFC_CHAR, FK_VRACHID =:pFK_VRACHID, fd_date=sysdate '+#13+
                              '    WHERE FK_ID = ID23; '+#13+
                              ' ELSE '+#13+
                              '   INSERT INTO asu.TIB(FK_PACID, FK_SMID, FK_SMEDITID, FC_CHAR, FK_VRACHID, fd_date) '+#13+
                              '   VALUES(:pFK_ID, :pFK_SMID23, (select fk_id from asu.tsmid where fc_synonim = ''PD_NAPRAVIV_YCH''), :pFC_CHAR, :pFK_VRACHID, sysdate); '+#13+
                              ' END IF; '+#13+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFK_SMID23', otInteger, cxKem.Tag);
            oqNaz.DeclareAndSet('pFC_CHAR', otString, cxKem.Text);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
            if (isKonsult = True) and (idTalon <> 0) then
              begin
                oqNaz.DeleteVariables;
                oqNaz.DeclareAndSet('PFK_ID', otInteger, idTalon);
                oqNaz.DeclareAndSet('pFK_SMID23', otInteger, cxKem.Tag);
                oqNaz.DeclareAndSet('pFC_CHAR', otString, cxKem.Text);
                oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
                oqNaz.Execute;
                frmMain.os.Commit;
              end;
          end;
  //------------------------------------------------------------------------------
        if cxVidOplat.Text <> '' then //способ оплаты
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+#13+
                              '   Cnt24 NUMBER; '+#13+
                              ' BEGIN '+#13+
                              '   SELECT COUNT(FK_ID) INTO Cnt24 FROM ASU.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''AMBTALON_OPL'')); '+#13+
                              ' IF Cnt24 > 0 THEN '+#13+
                              '   UPDATE asu.TIB SET FK_SMID=:pFK_SMID24, FK_SMEDITID=:pFK_SMEDITID24, FK_VRACHID=:pFK_VRACHID, fd_date=sysdate WHERE FK_PACID=:pFK_ID AND FK_SMID IN '+' (SELECT FK_ID FROM TSMID WHERE FK_OWNER=(SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM=''AMBTALON_OPL'')); '+#13+
                              ' ELSE '+#13+
                              '   INSERT INTO asu.TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFK_SMID24, :pFK_SMEDITID24, :pFK_VRACHID, sysdate); '+#13+
                              ' END IF; '+#13+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFK_SMID24', otInteger, cxVidOplat.EditValue);
            oqNaz.DeclareAndSet('pFK_SMEDITID24', otInteger, cxVidOplat.EditValue);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if cxDez.Enabled then //Дежурство
          begin
            if cxDez.Checked = True then
              begin
                oqNaz.DeleteVariables;
                oqNaz.SQL.Text := ' merge into asu.tib using dual on (fk_pacid = :pfk_id and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''DEZURSTVO'')) '+#13+
                                  '  when not matched then insert(fk_pacid, fk_vrachid, fd_date, fk_smid, fk_smeditid) '+#13+
                                  '  values(:pfk_id, :pfk_vrachid, sysdate, (select fk_id from asu.tsmid where fc_synonim = ''DEZURSTVO''), (select fk_owner from asu.tsmid where fc_synonim = ''DEZURSTVO'')) ';
                oqNaz.DeclareAndSet('pfk_id', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
                oqNaz.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
                oqNaz.Execute;
                frmMain.os.Commit;
              end else
              begin
                oqNaz.DeleteVariables;
                oqNaz.SQL.Text := ' delete from asu.tib where fk_pacid = :pfk_id and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''DEZURSTVO'') ';
                oqNaz.DeclareAndSet('pfk_id', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
                oqNaz.Execute;
                frmMain.os.Commit;
              end;
  //          oqNaz.DeleteVariables;
  //          oqNaz.SQL.Text := ' DECLARE '+
  //                            '   nSMID12 NUMBER; '+
  //                            '   Cnt12 NUMBER; '+
  //                            ' BEGIN '+
  //                            '   SELECT COUNT(FK_ID) INTO Cnt12 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''DEZURSTVO''); '+
  //                            ' IF Cnt12 > 0 THEN '+
  //                            '   UPDATE TIB SET FN_NUM = :pFN_NUM12, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''DEZURSTVO''); '+
  //                            ' ELSE '+
  //                            '   SELECT FK_ID INTO nSMID12 FROM TSMID WHERE FC_SYNONIM = ''DEZURSTVO''; '+
  //                            '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFN_NUM12, nSMID12, nSMID12, :pFK_VRACHID, sysdate); '+
  //                            ' END IF; '+
  //                            ' END; ';
  //          oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
  //          oqNaz.DeclareAndSet('pFN_NUM12', otInteger, cxDez.Checked);
  //          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
  //          oqNaz.Execute;
  //          frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
  //Melnikov 2013.09.17 begin
        if chbVoenkomat.Enabled then //Дежурство
          begin
            if chbVoenkomat.Checked = True then
              begin
                oqNaz.DeleteVariables;
                oqNaz.SQL.Text := ' merge into asu.tib using dual on (fk_pacid = :pfk_id and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''VOENKOMAT'')) '+#13+
                                  '  when not matched then insert(fk_pacid, fk_vrachid, fd_date, fk_smid, fk_smeditid) '+#13+
                                  '  values(:pfk_id, :pfk_vrachid, sysdate, (select fk_id from asu.tsmid where fc_synonim = ''VOENKOMAT''), (select fk_owner from asu.tsmid where fc_synonim = ''VOENKOMAT'')) ';
                oqNaz.DeclareAndSet('pfk_id', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
                oqNaz.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
                oqNaz.Execute;
                frmMain.os.Commit;
              end else
              begin
                oqNaz.DeleteVariables;
                oqNaz.SQL.Text := ' delete from asu.tib where fk_pacid = :pfk_id and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''VOENKOMAT'') ';
                oqNaz.DeclareAndSet('pfk_id', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
                oqNaz.Execute;
                frmMain.os.Commit;
              end;
  //          oqNaz.DeleteVariables;
  //          oqNaz.SQL.Text := ' DECLARE '+
  //                            '   nSMID12 NUMBER; '+
  //                            '   Cnt12 NUMBER; '+
  //                            ' BEGIN '+
  //                            '   SELECT COUNT(FK_ID) INTO Cnt12 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''DEZURSTVO''); '+
  //                            ' IF Cnt12 > 0 THEN '+
  //                            '   UPDATE TIB SET FN_NUM = :pFN_NUM12, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''DEZURSTVO''); '+
  //                            ' ELSE '+
  //                            '   SELECT FK_ID INTO nSMID12 FROM TSMID WHERE FC_SYNONIM = ''DEZURSTVO''; '+
  //                            '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFN_NUM12, nSMID12, nSMID12, :pFK_VRACHID, sysdate); '+
  //                            ' END IF; '+
  //                            ' END; ';
  //          oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
  //          oqNaz.DeclareAndSet('pFN_NUM12', otInteger, cxDez.Checked);
  //          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
  //          oqNaz.Execute;
  //          frmMain.os.Commit;
          end;
  //Melnikov 2013.09.17 end
  //------------------------------------------------------------------------------
        if cxDisp.Visible then //Диспансеризация
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   nSMID26 NUMBER; '+
                              '   Cnt26 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt26 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_DISPAN''); '+
                              ' IF Cnt26 > 0 THEN '+
                              '   UPDATE TIB SET FN_NUM = :pFN_NUM26, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_DISPAN''); '+
                              ' ELSE '+
                              '   SELECT FK_ID INTO nSMID26 FROM TSMID WHERE FC_SYNONIM = ''XRAY_DISPAN''; '+
                              '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFN_NUM26, nSMID26, nSMID26, :pFK_VRACHID, sysdate); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFN_NUM26', otInteger, cxDisp.Checked);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if cxDS.Text <> '' then //Диагноз
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   nSMID25 NUMBER; '+
                              '   Cnt25 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt25 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_DIAGNOZ''); '+
                              ' IF Cnt25 > 0 THEN '+
                              '   UPDATE TIB SET FC_CHAR = :pFC_CHAR25, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_DIAGNOZ''); '+
                              ' ELSE '+
                              '   SELECT FK_ID INTO nSMID25 FROM TSMID WHERE FC_SYNONIM = ''XRAY_DIAGNOZ''; '+
                              '   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :PFC_CHAR25, nSMID25, nSMID25, :pFK_VRACHID, sysdate); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFC_CHAR25', otString, cxDS.Text);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if cxCompDogovor.Visible = True then //Компания по договору
          begin
            if cxCompDogovor.Text <> '' then
              begin
                oqNaz.DeleteVariables;
                oqNaz.SQL.Text := ' DECLARE '+#13+
                                  '   Cnt26 NUMBER; '+#13+
                                  ' BEGIN '+#13+
                                  '   SELECT COUNT(FK_ID) INTO Cnt26 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_COMPANY_DOGOVOR'')); '+#13+
                                  ' IF Cnt26 > 0 THEN '+#13+
                                  '   UPDATE TIB SET FK_SMID=:pFK_SMID26, FK_SMEDITID=:pFK_SMEDITID26, FK_VRACHID=:pFK_VRACHID, fd_date=sysdate WHERE FK_PACID=:pFK_ID AND FK_SMID IN '+' (SELECT FK_ID FROM TSMID WHERE FK_OWNER=(SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM=''XRAY_COMPANY_DOGOVOR'')); '+#13+
                                  ' ELSE '+#13+
                                  '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFK_SMID26, :pFK_SMEDITID26, :pFK_VRACHID, sysdate); '+#13+
                                  ' END IF; '+#13+
                                  ' END; ';
                oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
                oqNaz.DeclareAndSet('pFK_SMID26', otInteger, cxCompDogovor.EditValue);
                oqNaz.DeclareAndSet('pFK_SMEDITID26', otInteger, cxCompDogovor.EditValue);
                oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
                oqNaz.Execute;
                frmMain.os.Commit;
              end;
          end else
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DELETE FROM asu.TIB WHERE FK_PACID = :PFK_PACID '+#13+
                              ' AND asu.GET_OWNER_FROM_SMID(FK_SMID) = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''XRAY_COMPANY_DOGOVOR'') ';
            oqNaz.DeclareAndSet('PFK_PACID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if cxKtoKontrast.Text <> '' then //Кто ввел контраст
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   nSMID15 NUMBER; '+
                              '   Cnt15 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt15 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''KTO_KONTRAST''); '+
                              ' IF Cnt15 > 0 THEN '+
                              '   UPDATE TIB SET FN_NUM = :pFN_NUM15, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''KTO_KONTRAST''); '+
                              ' ELSE '+
                              '   SELECT FK_ID INTO nSMID15 FROM TSMID WHERE FC_SYNONIM = ''KTO_KONTRAST''; '+
                              '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFN_NUM15, nSMID15, nSMID15, :pFK_VRACHID, sysdate); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('pFN_NUM15', otInteger, cxKtoKontrast.EditValue);
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if cxKrat.Text <> '' then //Кратность
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+
                              '   Cnt27 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt27 FROM ASU.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_KRATNOST'')); '+
                              ' IF Cnt27 > 0 THEN '+
                              '   UPDATE TIB SET FK_SMID=:pFK_SMID27, FK_SMEDITID=:pFK_SMEDITID27, FK_VRACHID=:pFK_VRACHID, fd_date=sysdate WHERE FK_PACID=:pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER=(SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM=''XRAY_KRATNOST'')); '+
                              ' ELSE '+
                              '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFK_SMID27, :pFK_SMEDITID27, :pFK_VRACHID, sysdate); '+
                              ' END IF; '+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFK_SMID27', otInteger, cxKrat.EditValue);
            oqNaz.DeclareAndSet('pFK_SMEDITID27', otInteger, cxKrat.EditValue);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
  //------------------------------------------------------------------------------
        if (ceSpeed.Visible = True) and (isSpeed = True) then // Скорость ввода контраста
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' merge into asu.tib using dual on (fk_pacid = :pfk_pacid and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''XRAY_SPEEDKONTRAST'')) '+#13+
                              ' when matched then update set fn_num = :pfn_num, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                              '                    where fk_pacid = :pfk_pacid and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''XRAY_SPEEDKONTRAST'') '+#13+
                              ' when not matched then insert(fn_num, fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                              '                       values(:pfn_num, :pfk_pacid, (select fk_id from asu.tsmid where fc_synonim = ''XRAY_SPEEDKONTRAST''), '+#13+
                              '                              (select fk_owner from asu.tsmid where fc_synonim = ''XRAY_SPEEDKONTRAST''), :pfk_vrachid, sysdate) ';
            oqNaz.DeclareAndSet('pfn_num', otFloat, ceSpeed.Value);
            oqNaz.DeclareAndSet('pfk_pacid', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
      finally
        oqNaz.Free;
      end;
    end;
    odsListNaz.Next;    
  end;
end;

procedure TfrmLabNaprav.DoInsertKorennoe(nIDPepl : Integer);
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
//    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT MAX(FK_ID) AS nTmp '+#13+
                    '   FROM asu.TIB I '+#13+
                    '  WHERE FK_PACID = :PFK_PACID '+#13+
                    '    AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM asu.TSMID WHERE FC_SYNONIM = ''KOREN_NASEL'')) ';
    ods.DeclareAndSet('PFK_PACID', otInteger, nidPepl);
    ods.Open;
    if ods.FieldByName('nTmp').AsInteger = 0 then //проверяем есть ли такая запись на пациента(PEPLID) в TIB
      begin
        oq := TOracleQuery.Create(nil); //если нет, то добавляем новую (INSERT)
        try
          oq.Session := frmMain.os;
//          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_PACID, :pFK_SMID, :pFK_SMEDITID, :pFK_VRACHID) ';
          oq.DeclareAndSet('pFK_PACID', otInteger, nidPepl);
          oq.DeclareAndSet('pFK_SMID', otInteger, cxKorennoe.EditValue);
          oq.DeclareAndSet('pFK_SMEDITID', otInteger, cxKorennoe.EditValue);
          oq.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oq.Execute;
          frmMain.os.Commit;
        finally
          oq.Free;
        end;
      end else
      begin
        oq := TOracleQuery.Create(nil); //если да, то изменяем существующую (UPDATE)
        try
          oq.Session := frmMain.os;
//          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' UPDATE TIB SET FK_SMID = :pFK_SMID WHERE FK_ID = :pFK_ID ';
          oq.DeclareAndSet('pFK_SMID', otInteger, cxKorennoe.EditValue);
          oq.DeclareAndSet('pFK_ID', otInteger, ods.FieldByName('nTmp').AsInteger);
          oq.Execute;
          frmMain.os.Commit;
        finally
          oq.Free;
        end;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmLabNaprav.DoInsertProjivaet(nPacID : Integer);
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT MAX(FK_ID) AS nTmp '+#13+
                    '   FROM asu.TIB I '+#13+
                    '  WHERE FK_PACID = :PFK_PACID '+#13+
                    '    AND (FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM asu.TSMID WHERE FC_SYNONIM = ''PD_MZ'')) '+#13+
                    '     OR FK_SMID = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO'')) ';
    ods.DeclareAndSet('PFK_PACID', otInteger, nPACID);
    ods.Open;
    if ods.FieldByName('nTmp').AsInteger = 0 then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.SQL.Text := ' INSERT INTO ASU.TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13+
                       ' VALUES(:pFK_PACID, :pFK_SMID, (select fk_owner from asu.tsmid where fk_id = :pFK_SMID), :pFK_VRACHID) ';
        oq.DeclareAndSet('pFK_PACID', otInteger, nPACID);
        oq.DeclareAndSet('pFK_SMID', otInteger, cxProjivaet.EditValue);
        oq.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
        oq.Execute;
        frmMain.os.Commit;
      finally
        oq.Free;
      end;
    end else
    begin
      if pPACID <> 0 then
      begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.SQL.Text := ' UPDATE asu.TIB '+#13+
                       '    SET FK_SMID = :pFK_SMID, FK_SMEDITID = (select fk_owner from asu.tsmid where fk_id = :pFK_SMID) '+#13+
                       '  WHERE FK_ID = :pFK_ID ';
        oq.DeclareAndSet('pFK_SMID', otInteger, cxProjivaet.EditValue);
        oq.DeclareAndSet('pFK_ID', otInteger, ods.FieldByName('nTmp').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
      finally
        oq.Free;
      end;
      end;
    end;
  finally
    ods.Free;
  end;
end;

procedure TfrmLabNaprav.DoKemNapravlen;
var ods : TOracleDataSet;
begin
  if (isKonsult = True) and (pAMBUL = 1) then // только если улуга консультативная и пациент = амбулаторный, то выводим кем направлен автоматом из талона
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.SQL.Text := ' select fk_smid, decode(fc_char, null, asu.get_smidname(fk_smid), fc_char) as fc_char '+#13+
                        '   from asu.tib '+#13+
                        '  where fk_pacid = :pfk_pacid '+#13+
                        '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                        '                    start with fc_synonim = ''KEM_NAPRAVLEN'' '+#13+
                        '                    connect by prior fk_id = fk_owner '+#13+
                        '                    union all '+#13+
                        '                     select fk_id from asu.tsmid '+#13+
                        '                    start with fc_synonim = ''PD_NAPRAVIV_YCH'' '+#13+
                        '                    connect by prior fk_id = fk_owner) ';
        ods.DeclareAndSet('pfk_pacid', otInteger, pNAZID);
        ods.Open;
        if ods.RecordCount = 0 then
          begin
            ods.DeleteVariables;
            ods.Close;
            ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smid) as fc_char '+#13+
                            '   from asu.tib '+#13+
                            '  where fk_pacid = :pfk_pacid '+
                            '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                            '                    start with fc_synonim = ''PD_NAPRAVIV_YCH'' '+#13+
                            '                    connect by prior fk_id = fk_owner) ';
            ods.DeclareAndSet('pfk_pacid', otInteger, idTalon);
            ods.Open;
          end;
        cxKem.Text := ods.FieldByName('fc_char').AsString;
        cxKem.Tag := ods.FieldByName('fk_smid').AsInteger;
        odsKemNapravlen.Locate('FK_ID', ods.FieldByName('fk_smid').AsInteger, []);
      finally
        ods.Free;
      end;
    end else
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.SQL.Text := ' select max(fk_smid) as fk_smid, max(decode(fc_char, null, asu.get_smidname(fk_smid), fc_char)) as fc_char '+#13+
                        '   from asu.tib '+#13+
                        '  where fk_pacid = :pfk_pacid '+#13+
                        '    and fk_smid in (select fk_id from asu.tsmid '+#13+
                        '                    start with fc_synonim = ''KEM_NAPRAVLEN'' '+#13+
                        '                    connect by prior fk_id = fk_owner '+#13+
                        '                    union all '+#13+
                        '                     select fk_id from asu.tsmid '+#13+
                        '                    start with fc_synonim = ''PD_NAPRAVIV_YCH'' '+#13+
                        '                    connect by prior fk_id = fk_owner) ';
        ods.DeclareAndSet('pfk_pacid', otInteger, pNAZID);
        ods.Open;
        cxKem.Text := ods.FieldByName('fc_char').AsString;
        cxKem.Tag := ods.FieldByName('fk_smid').AsInteger;
        odsKemNapravlen.Locate('FK_ID', ods.FieldByName('fk_smid').AsInteger, []);
      finally
        ods.Free;
      end;
    end;
end;

procedure TfrmLabNaprav.DoNumberDisc;
var ods : TOracleDataSet;
begin
  if cxNumDisk.Enabled = True then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.SQL.Text := ' BEGIN '+
		                    '   SELECT MAX(FC_CHAR) INTO :VAL '+
                        '     FROM TIB '+
                        '    WHERE FK_PACID = :PFK_ID AND FK_SMID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''NUMBER_DISK''); '+
		                    '   IF :VAL IS NULL THEN '+
		                    '     SELECT FC_VALUE INTO :VAL FROM TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''NUMBERDISC''; '+
		                    '   END IF; '+
                        ' END; ';
        ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
        ods.DeclareVariable('VAL', otString);
        ods.Open;
        cxNumDisk.Text := ods.GetVariable('VAL');
      finally
        ods.Free;
      end;
    end else
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
//        ods.Cursor := crSQLWait;
        ods.SQL.Text := '   SELECT MAX(FC_CHAR) AS FC_CHAR FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''NUMBER_DISK'') ';
        ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
        ods.Open;
        cxNumDisk.Text := ods.FieldByName('FC_CHAR').AsString;
      finally
        ods.Free;
      end;
    end;
end;

procedure TfrmLabNaprav.DoTextParametersNaz; // !!! тут можно одним запросом вытащить все значения и по синонимам потом пробежаться и расставить всё
var ods : TOracleDataSet;                    // !!! жесть запрос - переделать, обратить внимание на тип контраста
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT sysdate, FK_NAZTYPEID, FD_RUN, FK_ISPOLID, asu.GET_VRACHFCOTDEL(FK_VRACHID) AS OTDELSTAC, '+#13+
                    '       (SELECT MAX(FK_SMID) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''TIME_NORMA_ISSL''))) AS NADBAVKA, '+#13+
                    '       (SELECT asu.GET_SMIDNAME(MAX(FK_SMID)) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_ID IN '+' (SELECT FK_ID FROM TSMID START WITH FK_ID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_TYPEKONTRAST'') CONNECT BY PRIOR FK_ID = FK_OWNER))) AS TYPEKONTRAST, '+#13+
                    '       (SELECT MAX(FK_SMID) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_ID IN '+' (SELECT FK_ID FROM TSMID START WITH FK_ID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_TYPEKONTRAST'') CONNECT BY PRIOR FK_ID = FK_OWNER))) AS ID_TYPEKONTRAST, '+#13+
                    '       (SELECT MAX(DECODE(FC_CHAR, NULL, ASU.GET_SMIDNAME(TIB.FK_SMID), FC_CHAR)) '+#13+
                    '          FROM ASU.TIB '+#13+
                    '         WHERE FK_PACID = :PFK_ID '+#13+
                    '           AND FK_SMID IN (SELECT FK_ID '+#13+
                    '                             FROM TSMID '+#13+
                    '                           START WITH FC_SYNONIM = ''KEM_NAPRAVLEN'' '+#13+
                    '                           CONNECT BY PRIOR FK_ID = FK_OWNER '+#13+
                    '                           UNION ALL '+#13+
                    '                           SELECT FK_ID FROM ASU.TSMID '+#13+
                    '                           START WITH FC_SYNONIM = ''PD_NAPRAVIV_YCH'' '+#13+
                    '                           CONNECT BY PRIOR FK_ID = FK_OWNER)) AS KEMNAPRAVLEN, '+#13+
                    '       (SELECT MAX(FK_SMID) '+#13+
                    '          FROM TIB '+#13+
                    '         WHERE FK_PACID = :PFK_ID '+#13+
                    '           AND FK_SMID IN (SELECT FK_ID '+#13+
                    '                             FROM TSMID '+#13+
                    '                           START WITH FC_SYNONIM = ''KEM_NAPRAVLEN'' CONNECT BY PRIOR FK_ID = FK_OWNER '+#13+
                    '                           UNION ALL '+#13+
                    '                           SELECT FK_ID '+#13+
                    '                             FROM ASU.TSMID '+#13+
                    '                           START WITH FC_SYNONIM = ''PD_NAPRAVIV_YCH'' '+#13+
                    '                           CONNECT BY PRIOR FK_ID = FK_OWNER)) AS ID_KEMNAPRAVLEN, '+#13+
										'       (SELECT MAX(FN_NUM) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOKONTRAST'')) AS KOLVOKONTRAST, '+#13+
                    '       (SELECT MAX(FK_SMID) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_VVOD''))) AS VVOD, '+#13+
                    '       (SELECT MAX(FN_NUM) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOKOMY'')) AS KOLVOKOMY, '+#13+
                    '       (SELECT MAX(FC_CHAR) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_FIO_REMARK'')) AS FIO_REMARK, '+#13+
                    '       (SELECT MAX(FN_NUM) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''ZAPISAN_ONPHONE'')) AS ON_PHONE, '+#13+
                    '       (SELECT count(*) FROM asu.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''DEZURSTVO'')) AS DEZ, '+#13+       
                    '       (SELECT count(*) FROM asu.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''VOENKOMAT'')) AS VOENKOMAT, '+#13+
                    '       (SELECT MAX(FN_NUM) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_DISPAN'')) AS DISP, '+#13+
                    '       (SELECT MAX(FK_SMID) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''CIFRA_ARCHIVE''))) AS CIFRA_ARCHIVE, '+#13+
                    '       (SELECT MAX(FK_SMID) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''OTDEL_VYDANO''))) AS OTDEL_VYDANO, '+#13+
                    '       (SELECT MAX(FK_SMID) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_KRATNOST''))) AS XRAY_KRATNOST, '+#13+
                    '       (SELECT MAX(FC_CHAR) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''NUMBER_KOROB'')) AS NUMBER_KOROB, '+#13+
                    '       (SELECT MAX(FC_CHAR) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL'')) AS NUMBER_ISSL, '+#13+
                    '       (SELECT MAX(FN_NUM) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''KTO_KONTRAST'')) AS KTOKONTRAST '+#13+
                    '   FROM asu.TNAZIS WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.Open;
    cxNumIssl1.Text:= ods.FieldByName('NUMBER_ISSL').AsString;
    cxdeDateProtocol.Date := ods.FieldByName('FD_RUN').AsDateTime;
    cxteTimeProtocol.Time := ods.FieldByName('FD_RUN').AsDateTime;
    if (cxteTimeProtocol.Text = '00:00') and (frmMain.GET_DB_NAME = 'TO') then // пока только для НИжнего Тагила Онко
      begin
        cxteTimeProtocol.Time := ods.FieldByName('sysdate').AsDateTime;
      end;
    cxUrgent.EditValue := ods.FieldByName('FK_NAZTYPEID').AsInteger;
    cxNadbavka.Properties.OnChange := nil;
    cxNadbavka.EditValue := ods.FieldByName('NADBAVKA').AsInteger;
    cxNadbavka.Properties.OnChange := cxNadbavkaPropertiesChange;
    cxTypeKontrast.Text := ods.FieldByName('TYPEKONTRAST').AsString;
    odsTypeKontrast.Locate('FK_ID', ods.FieldByName('ID_TYPEKONTRAST').AsInteger, []);
    if pAMBUL = 0 then
      begin
        cxKem.Text := ods.FieldByName('OTDELSTAC').AsString;
      end else
      begin
        DoKemNapravlen;
      end;
    cxKolvoKontrast.Value := ods.FieldByName('KOLVOKONTRAST').AsFloat;
    cxVvod.EditValue := ods.FieldByName('VVOD').AsInteger;
    cxKolvoVidano.Value := ods.FieldByName('KOLVOKOMY').AsInteger;
    cxRemark.Text := ods.FieldByName('FIO_REMARK').AsString;
    if ods.FieldByName('ON_PHONE').AsInteger = -1 then
      cxOnPhone.Checked := TRUE
    else
      cxOnPhone.Checked := FALSE;
    cxDez.Checked := ods.FieldByName('DEZ').AsInteger > 0;
    chbVoenkomat.Checked := ods.FieldByName('VOENKOMAT').AsInteger > 0;
//    if ods.FieldByName('DEZ').AsInteger = -1 then
//      cxDez.Checked := True
//    else
//      cxDez.Checked := False;
    if ods.FieldByName('DISP').AsInteger = -1 then
      cxDisp.Checked := True
    else
      cxDisp.Checked := False;
    cxCifraArchive.EditValue := ods.FieldByName('CIFRA_ARCHIVE').AsInteger;
    cxOtdelVydano.EditValue := ods.FieldByName('OTDEL_VYDANO').AsInteger;
    cxNumKorob.Text := ods.FieldByName('NUMBER_KOROB').AsString;
    cxKtoKontrast.EditValue := ods.FieldByName('KTOKONTRAST').AsInteger;
    cxKrat.EditValue := ods.FieldByName('XRAY_KRATNOST').AsInteger;
  finally
    ods.Free;
  end;
end;

procedure TfrmLabNaprav.cxNadbavkaPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
    defTime : Extended;
    sSyn : String;
begin
  sSyn := odsNadbavka.FieldByName('FC_SYNONIM').AsString;
  odsListNaz.First;
  while not odsListNaz.Eof do
    begin
      if odsListNaz.FieldByName('TIME').AsFloat <> 0 then
        begin
          defTime := odsListNaz.FieldByName('TIME').AsFloat;
          ods := TOracleDataSet.Create(nil);
          try
            ods.Session := frmMain.os;
            ods.Cursor := crSQLWait;
            ods.SQL.Text := ' SELECT FC_TIME FROM ASU.TSMID WHERE FK_ID = :PFK_ID ';
            ods.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_SMID').AsInteger);
            ods.Open;
            if ods.RecordCount > 0 then
              begin
                if ods.FieldByName('FC_TIME').AsString = '' then
                  defTime := odsListNaz.FieldByName('TIME').AsFloat
                else
                  defTime := StrToFloat(ods.FieldByName('FC_TIME').AsString);
              end;
            if sSyn = 'TIME_CHILD' then
              defTime := defTime * 1.2;
            if sSyn = 'TIME_HARD' then
              defTime := defTime * 1.2;
            if sSyn = 'TIME_NA5' then
              defTime := defTime + 5;
            if sSyn = 'TIME_NA10' then
              defTime := defTime + 10;
            if sSyn = 'TIME_NA15' then
              defTime := defTime + 15;
            if sSyn = 'TIME_NA20' then
              defTime := defTime + 20;
            if sSyn = 'TIME_NA25' then
              defTime := defTime + 25;
            if sSyn = 'TIME_NA30' then
              defTime := defTime + 30;
            if sSyn = 'TIME_V1,5' then
              defTime := defTime * 1.5;
            if sSyn = 'TIME_V2' then
              defTime := defTime * 2;
            if sSyn = 'TIME_V2,5' then
              defTime := defTime * 2.5;
            if sSyn = 'TIME_V3' then
              defTime := defTime * 3;
            if sSyn = 'TIME_NO' then
              defTime := defTime;
            odsListNaz.Edit;
            odsListNaz.FieldByName('TIME').AsString := FloatToStr(defTime);
            odsListNaz.Post;
          finally
            ods.Free;
          end;
        end;
      odsListNaz.RefreshRecord;
      odsListNaz.Next;
    end;
end;

procedure TfrmLabNaprav.FormShow(Sender: TObject);
begin
  DoGetAddress;
  
  if cxFam.Enabled then
    cxFam.SetFocus;
end;

procedure TfrmLabNaprav.cxTreeTypeKontrastKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
      cxTypeKontrast.Text := odsTypeKontrast.FieldByName('FC_NAME').AsString;
      cxTypeKontrast.PopupWindow.Close;
    end;
end;

procedure TfrmLabNaprav.cxVidOplatPropertiesChange(Sender: TObject);
begin
  if odsVidOplat.FieldByName('FC_SYNONIM').AsString = 'TAL_OTHER' then
    begin
      lbCompany.Visible := True;
      cxCompDogovor.Visible := True;
    end else
    begin
      lbCompany.Visible := False; 
      cxCompDogovor.Visible := False;
    end;
end;

procedure TfrmLabNaprav.DoUpdatePacIDNaz(nIDPAC: Integer);
var oq : TOracleQuery;
begin
  odsListNaz.First;
  while not odsListNaz.Eof do
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.SQL.Text := ' update asu.tnazis set fk_pacid = :pfk_pacid where fk_id = :pfk_id ';
        oq.DeclareAndSet('PFK_PACID', otInteger, nIDPAC);
        oq.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
      finally
        oq.Free;
      end;
      odsListNaz.Next;
  end;
end;

procedure TfrmLabNaprav.DoUpdateTalon(nIDPAC: Integer);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.SQL.Text := ' update asu.tambtalon set fk_ambid = :pfk_ambid where fk_id = :pfk_id ';
    oq.DeclareAndSet('pfk_ambid', otInteger, nIDPAC);
    oq.DeclareAndSet('pfk_id', otInteger, idTalon);
    oq.Execute;
    oq.DeleteVariables;
    oq.SQL.Text := ' update asu.tambtalon_naz set fk_ambid = :pfk_ambid where fk_nazid = :pfk_nazid ';
    oq.DeclareAndSet('pfk_ambid', otInteger, nIDPAC);
    oq.DeclareAndSet('pfk_nazid', otInteger, odsListNaz.FieldByName('fk_id').AsInteger);
    oq.Execute;
    frmMain.os.Commit;
  finally
    oq.Free;
  end;
end;

procedure TfrmLabNaprav.DoUrgent;     // !!! проверить
var ods : TOracleDataSet;
begin
	ods := TOracleDataSet.Create(nil);
	try
		ods.Session := frmMain.os;
		ods.SQL.Text := ' SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''NAZN_TYPES'') AND FK_DEFAULT = 1 ';
		ods.Open;
		cxUrgent.EditValue := ods.FieldByName('FK_ID').AsInteger;
	finally
		ods.Free;
  end;
end;

procedure TfrmLabNaprav.cxOnPhonePropertiesChange(Sender: TObject);
begin
  if cxOnPhone.Checked then
    begin
      cxlKontaktPhone.Visible := TRUE;
      cxTelefon.Visible := TRUE;
    end else
    begin
      cxlKontaktPhone.Visible := FALSE;
      cxTelefon.Visible := FALSE;
    end;
end;

procedure TfrmLabNaprav.cxdeRojdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
      if bVozrast.Visible = True then
        begin
          cxdeRojd.PostEditValue;
          bVozrastClick(nil);
        end;
    end;
end;

procedure TfrmLabNaprav.aPrintExecute(Sender: TObject);
var v_filefrx : ansistring;
begin
  if frmMain.get_db_name = 'T' then
    begin
     { v_filefrx:='frxRep_4OBTC.fr3';
      if FileExists(v_filefrx) then
        frxReport1.LoadFromFile(v_filefrx)
      else
      begin
        MessageDlg('Не установлен файл '+v_filefrx, mtError, [mbOK], 0);
        Exit;
      end;   }
      frxRep_4OBTC.ShowReport;
      exit;
    end;
  if frmMain.get_db_name = 'SO' then
    begin
    {  v_filefrx:='frxRep_4SOKB.fr3';
      if FileExists(v_filefrx) then
        frxReport1.LoadFromFile(v_filefrx)
      else
      begin
        MessageDlg('Не установлен файл '+v_filefrx, mtError, [mbOK], 0);
        Exit;
      end;  }
      frxRep_4SOKB.ShowReport;
      exit;
    end;

   // MessageDlg(''+frxDBDataset1.DataSet.FieldByName('fc_accessionnumber').AsString, mtWarning, [mbOK], 0);

  {  v_filefrx:='xrays_labnaprav.fr3';
    if FileExists(v_filefrx) then
      frxReport1.LoadFromFile(v_filefrx)
    else
    begin
      MessageDlg('Не установлен файл '+v_filefrx, mtError, [mbOK], 0);
      Exit;
    end; }
  if USE_ONE_ACCESSIONNUMBER=1 then begin
    frxReport2.ShowReport;
  end else
    frxReport1.ShowReport;
end;

procedure TfrmLabNaprav.frAgreeProcGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'PACFIO' then Value := cxFam.Text+' '+cxName.Text+' '+cxOtch.Text;
  if VarName = 'NUMIB' then Value := cxNum.Text;
  if VarName = 'METODS' then Value := strMetods;
end;

procedure TfrmLabNaprav.frxReport1GetValue(const VarName: String; var Value: Variant);
begin
//  if VarName = 'fc_an' then Value := cxNumIssl1.Text;
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'RG_LABORANT' then Value := cxRgLaborant.Text;
  if VarName = 'FIO_PAC' then Value := cxFam.Text+' '+cxName.Text+' '+cxOtch.Text;
  if cxdeRojd.Text <> '' then
    begin
      if VarName = 'DATE_ROJD' then Value := cxdeRojd.Date;
    end else
    begin
      if VarName = 'DATE_ROJD' then Value := '';
    end;
  if VarName = 'KORENNOE' then Value := cxKorennoe.Text;
  if VarName = 'PROJIVAET' then Value := cxProjivaet.Text;
  if VarName = 'ADDRESS' then Value := String(GetAddrText);
  if VarName = 'PHONE' then Value := cxTelefon.Text;
  if VarName = 'NUMIB' then Value := cxNum.Text;
  if VarName = 'KEM_NAPRAVLEN' then Value := cxKem.Text;
  if VarName = 'NAPRAV_DS' then Value := cxDs.Text;
  if VarName = 'SROCH' then Value := cxUrgent.Text;
  if VarName = 'NADBAVKA_TIME' then Value := cxNadbavka.Text;
  if VarName = 'NUMISSL' then Value := odsListNaz.FieldByName('FC_TYPE').AsString; // cxNumIssl.Text;
  if VarName = 'AGE' then Value := cxAge.Caption;
  if cxMale.Checked then
    begin
      if VarName = 'SEX' then Value := 'МУЖСКОЙ';
    end else
    begin
      if cxFemale.Checked then
        begin
          if VarName = 'SEX' then Value := 'ЖЕНСКИЙ';
        end else
        begin
          if VarName = 'SEX' then Value := '';
        end;
    end;
  if VarName = 'VID_OPLATA' then Value := cxVidOplat.Text;
  if VarName = 'VRACH_NAPRAVIL' then Value := cxVrach.Text;
  if VarName = 'TARGET' then Value := cxTarget.Text;
  if VarName = 'KABINET' then Value := frmMain.odsKab.FieldByName('FC_NAME').AsString;
  if VarName = 'PHONEKAB' then Value := frmMain.odsKab.FieldByName('FC_PHONE').AsString;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
end;

procedure TfrmLabNaprav.frxReport2GetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'FC_AN' then Value := cxNumIssl1.Text;
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'RG_LABORANT' then Value := cxRgLaborant.Text;
  if VarName = 'FIO_PAC' then Value := cxFam.Text+' '+cxName.Text+' '+cxOtch.Text;
  if cxdeRojd.Text <> '' then
    begin
      if VarName = 'DATE_ROJD' then Value := cxdeRojd.Date;
    end else
    begin
      if VarName = 'DATE_ROJD' then Value := '';
    end;
  if VarName = 'KORENNOE' then Value := cxKorennoe.Text;
  if VarName = 'PROJIVAET' then Value := cxProjivaet.Text;
  if VarName = 'ADDRESS' then Value := String(GetAddrText);
  if VarName = 'PHONE' then Value := cxTelefon.Text;
  if VarName = 'NUMIB' then Value := cxNum.Text;
  if VarName = 'KEM_NAPRAVLEN' then Value := cxKem.Text;
  if VarName = 'NAPRAV_DS' then Value := cxDs.Text;
  if VarName = 'SROCH' then Value := cxUrgent.Text;
  if VarName = 'NADBAVKA_TIME' then Value := cxNadbavka.Text;
  if VarName = 'NUMISSL' then Value := odsListNaz.FieldByName('FC_TYPE').AsString; // cxNumIssl.Text;
  if VarName = 'AGE' then Value := cxAge.Caption;
  if cxMale.Checked then
    begin
      if VarName = 'SEX' then Value := 'МУЖСКОЙ';
    end else
    begin
      if cxFemale.Checked then
        begin
          if VarName = 'SEX' then Value := 'ЖЕНСКИЙ';
        end else
        begin
          if VarName = 'SEX' then Value := '';
        end;
    end;
  if VarName = 'VID_OPLATA' then Value := cxVidOplat.Text;
  if VarName = 'VRACH_NAPRAVIL' then Value := cxVrach.Text;
  if VarName = 'TARGET' then Value := cxTarget.Text;
  if VarName = 'KABINET' then Value := frmMain.odsKab.FieldByName('FC_NAME').AsString;
  if VarName = 'PHONEKAB' then Value := frmMain.odsKab.FieldByName('FC_PHONE').AsString;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
end;

procedure TfrmLabNaprav.frxRep_4OBTCGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'RG_LABORANT' then Value := cxRgLaborant.Text;
  if VarName = 'FIO_PAC' then Value := cxFam.Text+' '+cxName.Text+' '+cxOtch.Text;
  if cxdeRojd.Text <> '' then
    begin
      if VarName = 'DATE_ROJD' then Value := cxdeRojd.Date;
    end else
    begin
      if VarName = 'DATE_ROJD' then Value := '';
    end;
  if VarName = 'KORENNOE' then Value := cxKorennoe.Text;
  if VarName = 'PROJIVAET' then Value := cxProjivaet.Text;
  if VarName = 'ADDRESS' then Value := String(GetAddrText); //sAddress_4Rep;
  if VarName = 'PHONE' then Value := cxTelefon.Text;
  if VarName = 'NUMIB' then Value := cxNum.Text;
  if VarName = 'KEM_NAPRAVLEN' then Value := cxKem.Text;
  if VarName = 'NAPRAV_DS' then Value := cxDs.Text;
  if VarName = 'SROCH' then Value := cxUrgent.Text;
  if VarName = 'NADBAVKA_TIME' then Value := cxNadbavka.Text;
  if VarName = 'NUMISSL' then Value := odsListNaz.FieldByName('FC_TYPE').AsString; // cxNumIssl.Text;
  if VarName = 'AGE' then Value := cxAge.Caption;
  if cxMale.Checked then
    begin
      if VarName = 'SEX' then Value := 'МУЖСКОЙ';
    end else
    begin
      if cxFemale.Checked then
        begin
          if VarName = 'SEX' then Value := 'ЖЕНСКИЙ';
        end else
        begin
          if VarName = 'SEX' then Value := '';
        end;
    end;
  if VarName = 'VID_OPLATA' then Value := cxVidOplat.Text;
  if VarName = 'VRACH_NAPRAVIL' then Value := cxVrach.Text;
  if VarName = 'TARGET' then Value := cxTarget.Text;
  if VarName = 'KABINET' then Value := frmMain.odsKab.FieldByName('FC_NAME').AsString;
  if VarName = 'PHONEKAB' then Value := frmMain.odsKab.FieldByName('FC_PHONE').AsString;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;  
end;

procedure TfrmLabNaprav.frxRep_4SOKBGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'RG_LABORANT' then Value := cxRgLaborant.Text;
  if VarName = 'FIO_PAC' then Value := cxFam.Text+' '+cxName.Text+' '+cxOtch.Text;
  if cxdeRojd.Text <> '' then
    begin
      if VarName = 'DATE_ROJD' then Value := cxdeRojd.Date;
    end else
    begin
      if VarName = 'DATE_ROJD' then Value := '';
    end;
  if VarName = 'KORENNOE' then Value := cxKorennoe.Text;
  if VarName = 'PROJIVAET' then Value := cxProjivaet.Text;
  if VarName = 'ADDRESS' then Value := String(GetAddrText); 
  if VarName = 'PHONE' then Value := cxTelefon.Text;
  if VarName = 'NUMIB' then Value := cxNum.Text;
  if VarName = 'KEM_NAPRAVLEN' then Value := cxKem.Text;
  if VarName = 'NAPRAV_DS' then Value := cxDs.Text;
  if VarName = 'SROCH' then Value := cxUrgent.Text;
  if VarName = 'NADBAVKA_TIME' then Value := cxNadbavka.Text;
  if VarName = 'NUMISSL' then Value := odsListNaz.FieldByName('FC_TYPE').AsString; // cxNumIssl.Text;
  if VarName = 'AGE' then Value := cxAge.Caption;
  if cxMale.Checked then
    begin
      if VarName = 'SEX' then Value := 'МУЖСКОЙ';
    end else
    begin
      if cxFemale.Checked then
        begin
          if VarName = 'SEX' then Value := 'ЖЕНСКИЙ';
        end else
        begin
          if VarName = 'SEX' then Value := '';
        end;
    end;
  if VarName = 'VID_OPLATA' then Value := cxVidOplat.Text;
  if VarName = 'VRACH_NAPRAVIL' then Value := cxVrach.Text;
  if VarName = 'TARGET' then Value := cxTarget.Text;
  if VarName = 'KABINET' then Value := frmMain.odsKab.FieldByName('FC_NAME').AsString;
  if VarName = 'PHONEKAB' then Value := frmMain.odsKab.FieldByName('FC_PHONE').AsString;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
end;

procedure TfrmLabNaprav.aHistoryExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmAllHistory, frmAllHistory);
  try
    frmAllHistory.DoShowForm(pPEPLID, cxFam.Text+' '+cxName.Text+' '+cxOtch.Text);
    frmAllHistory.ShowModal;
  finally
    frmAllHistory.Free;
  end;
end;

procedure TfrmLabNaprav.aInfoExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmPacInfo, frmPacInfo);
  try
    frmPacInfo.DoShowPacInfo(pPACID,
                             pPEPLID,
                             cxKem.Text+'-'+cxVrach.Text);
    frmPacInfo.ShowModal;
  finally
    frmPacInfo.Free;
  end;
end;

procedure TfrmLabNaprav.DoPodpis;
var oq, oqPod : TOracleQuery;
    ods : TOracleDataSet;
begin
  odsListNaz.First;
  while not odsListNaz.Eof do
    begin
      if odsListNaz.FieldByName('fk_nazsosid').AsInteger <> GET_VIPNAZ then
        begin
          oq := TOracleQuery.Create(nil); // изменение статуса TNAZIS, добавление записи в VRES
          try
            oq.Session := frmMain.os;
            oq.SQL.Text := ' update asu.tnazis '+#13+
                           '    set fk_nazsosid = :pfk_nazsosid, fk_ispolid = :pfk_ispolid, fd_run = :pfd_run, fl_in_raspis = 1 '+#13+
                           '  where fk_id = :pfk_nazid ';
            oq.DeclareAndSet('pfk_ispolid', otInteger, cxRgLaborant.EditValue);
            oq.DeclareAndSet('pfd_run', otDate, StrToDateTime(DateToStr(cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn:ss', IncSecond(cxteTimeProtocol.Time, 1))));
            oq.DeclareAndSet('pfk_nazid', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oq.DeclareAndSet('pfk_nazsosid', otInteger, GET_LABVIP);
            oq.Execute;
            frmMain.os.Commit;
          finally
            oq.Free;
          end;
        end;
      ods := TOracleDataSet.Create(nil); // добавление или изменение записи в TPODPISNAZ (выполняется всегда)
      oqPod := TOracleQuery.Create(nil);
        try
          ods.Session := frmMain.os;
          ods.SQL.Text := ' SELECT * FROM asu.TPODPISNAZ WHERE FK_NAZID =:pFK_NAZID AND FK_SOTRID = :pFK_SOTRID ';
          ods.DeclareAndSet('pFK_NAZID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
          ods.DeclareAndSet('pFK_SOTRID', otInteger, cxRgLaborant.EditValue);
          ods.Open;
          if ods.RecordCount > 0 then
            begin
              oqPod.Session := frmMain.os;
              oqPod.DeleteVariables;
		          oqPod.SQL.Text := ' UPDATE ASU.TPODPISNAZ SET FK_SOS = GET_LABVIP, FD_INS = :pFD_INS '+
                                '  WHERE FK_NAZID =:pFK_NAZID AND FK_SOTRID =:pFK_SOTRID ';
              oqPod.DeclareAndSet('pFD_INS', otDate, StrToDateTime(DateToStr(cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn', cxteTimeProtocol.Time)));
              oqPod.DeclareAndSet('pFK_NAZID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
              oqPod.DeclareAndSet('pFK_SOTRID', otInteger, cxRgLaborant.EditValue);
              oqPod.Execute;
              frmMain.os.Commit;
            end else
            begin
              oqPod.Session := frmMain.os;
              oqPod.DeleteVariables;
		          oqPod.SQL.Text := ' INSERT INTO asu.TPODPISNAZ(FK_NAZID, FK_SOTRID, FK_SOS, FD_DATE, FD_INS) '+
			                          ' VALUES(:pFK_NAZID, :pFK_SOTRID, asu.GET_LABVIP, SYSDATE, :pFD_INS) ';
              oqPod.DeclareAndSet('pFK_NAZID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
              oqPod.DeclareAndSet('pFK_SOTRID', otInteger, cxRgLaborant.EditValue);
              oqPod.DeclareAndSet('pFD_INS', otDate, StrToDateTime(DateToStr(cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn', cxteTimeProtocol.Time)));
              oqPod.Execute;
              frmMain.os.Commit;
            end;
        finally
          ods.Free;
          oqPod.Free;
        end;
    odsListNaz.Next;
    end;
end;

procedure TfrmLabNaprav.DoDates;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT MAX(FD_DATE) AS MAXDATE, TRUNC(SYSDATE) AS DATESYS '+
                    '   FROM asu.TIB '+
                    '  WHERE FK_PACID = :PFK_ID '+
                    '    AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''DATE_VYDANO'') ';
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.Open;
    if DateTimeToStr(ods.FieldByName('MAXDATE').AsDateTime) = '30.12.1899' then  //!!!
      cxDateVydano.Date := ods.FieldByName('DATESYS').AsDateTime
    else
      cxDateVydano.Date := ods.FieldByName('MAXDATE').AsDateTime;
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT MAX(DECODE(TO_CHAR(FD_DATE, ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), FD_DATE)) AS MAXDATE, '+ //MAX(FD_DATE) AS MAXDATE, '+
                    '        TRUNC(SYSDATE) AS DATESYS '+
                    '   FROM asu.TIB '+
                    '  WHERE FK_PACID = :PFK_ID '+
                    '    AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''DATE_VOZVRAT'') ';
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.Open;
    if DateTimeToStr(ods.FieldByName('MAXDATE').AsDateTime) = '30.12.1899' then //!!!
      cxDateVozvrat.Clear
    else
      cxDateVozvrat.Date := ods.FieldByName('MAXDATE').AsDateTime;
  finally
    ods.Free;
  end;
end;

procedure TfrmLabNaprav.DoCompanyDogovor;
var ods : TOracleDataSet;
begin
  if cxCompDogovor.Visible = True then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.SQL.Text := ' BEGIN '+
  	                    '   SELECT MAX(FK_SMID) INTO :VAL '+
                        '     FROM TIB '+
                        '    WHERE FK_PACID = :PFK_ID '+
                        '      AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_COMPANY_DOGOVOR'')); '+
		                    '   IF :VAL IS NULL THEN '+
		                    '     SELECT MAX(FK_ID) INTO :VAL FROM TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_COMPANY_DOGOVOR'') AND FK_DEFAULT = 1; '+
		                    '   END IF; '+
                        ' END; ';
        ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
        ods.DeclareVariable('VAL', otInteger);
        ods.Open;
        cxCompDogovor.EditValue := ods.GetVariable('VAL');
      finally
        ods.Free;
      end;
    end;
end;

procedure TfrmLabNaprav.DoProjivaet;
var ods : TOracleDataSet;
    id : Integer;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' DECLARE '+
                    '   nSMID NUMBER; '+
                    ' BEGIN '+
                    ' SELECT '+
                    ' DECODE((SELECT MAX(FK_SMID) FROM ASU.TIB '+
                    '          WHERE FK_PACID = :PFK_PACID '+
                    '            AND (FK_SMID IN (SELECT FK_ID '+
                    '                               FROM ASU.TSMID '+
                    '                              WHERE FK_OWNER = (SELECT MAX(FK_ID) '+
                    '                                                  FROM ASU.TSMID '+
                    '                                                 WHERE FC_SYNONIM = ''PD_MZ'')) '+
                    '                                 OR FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO''))), '+
                    '        NULL, '+
                    '        (SELECT MAX(FK_SMID) FROM ASU.TIB '+
                    '          WHERE FK_PACID = :PFK_PEPLID '+
                    '            AND (FK_SMID IN (SELECT FK_ID '+
                    '                               FROM ASU.TSMID '+
                    '                              WHERE FK_OWNER = (SELECT MAX(FK_ID) '+
                    '                                                  FROM ASU.TSMID '+
                    '                                                 WHERE FC_SYNONIM = ''PD_MZ'')))), '+
//                    '                                 OR FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO''))), '+
                    '        (SELECT MAX(FK_SMID) FROM ASU.TIB '+
                    '          WHERE FK_PACID = :PFK_PACID '+
                    '            AND (FK_SMID IN (SELECT FK_ID '+
                    '                               FROM ASU.TSMID '+
                    '                              WHERE FK_OWNER = (SELECT MAX(FK_ID) '+
                    '                                                  FROM ASU.TSMID '+
                    '                                                 WHERE FC_SYNONIM = ''PD_MZ'')) '+
                    '                                 OR FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO'')))) INTO :VAL '+
                    ' FROM DUAL; '+
										' IF :VAL IS NULL THEN '+
										'   SELECT MAX(FK_ID) INTO :VAL FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''PD_MZ'') AND FK_DEFAULT = 1; '+
                    ' END IF; '+
                    ' END; ';
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
    ods.DeclareAndSet('PFK_PEPLID', otInteger, pPEPLID);
    ods.DeclareVariable('VAL', otInteger);
    ods.Open;
    id := ods.GetVariable('VAL');
    cxProjivaet.EditValue := ods.GetVariable('VAL');
    if pPACID = 0 then
      cxProjivaet.EditValue := id;
  finally
    ods.Free;
  end;
end;

procedure TfrmLabNaprav.DoVidOplat;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' BEGIN '+
                    '   SELECT MAX(FK_SMID) INTO :VAL '+
                    '     FROM TIB '+
                    '    WHERE FK_PACID = :PFK_PEPLID '+
                    '      AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''AMBTALON_OPL'')); '+
                    '   IF :VAL IS NULL THEN '+
                    '     SELECT MAX(FK_ID) INTO :VAL '+
                    '       FROM TSMID '+
                    '      WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''AMBTALON_OPL'') AND FK_DEFAULT = 1; '+
            		    '   END IF; '+
                    ' END; ';
    ods.DeclareAndSet('PFK_PEPLID', otInteger, pNAZID);
    ods.DeclareVariable('VAL', otInteger);
    ods.Open;
    cxVidOplat.EditValue := ods.GetVariable('VAL');
  finally
    ods.Free;
  end;
end;

procedure TfrmLabNaprav.DoTarget;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' BEGIN '+
		                '   SELECT MAX(FK_SMID) INTO :VAL '+
                    '     FROM TIB '+
                    '    WHERE FK_PACID = :PFK_ID '+
                    '      AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''ISSL_TARGET'')); '+
		                '   IF :VAL IS NULL THEN '+
		                '     SELECT MAX(FK_ID) INTO :VAL '+
                    '       FROM TSMID '+
                    '      WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''ISSL_TARGET'') AND FK_DEFAULT = 1; '+
		                '   END IF; '+
                    ' END; ';
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.DeclareVariable('VAL', otInteger);
    ods.Open;
    cxTarget.EditValue := ods.GetVariable('VAL');
  finally
    ods.Free;
  end;
end;

procedure TfrmLabNaprav.VNAMEISSLPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var ods : TOracleDataSet;
begin
  if odsListNaz.FieldByName('fk_nazsosid').AsInteger <> get_vipnaz then
    begin
      frmMain.Update := TRUE;
      Application.CreateForm(TfrmNazRg1, frmNazRg1);
      try
        frmNazRg1.IsKonsult := frmLabNaprav.isKonsult;
        if (odsListNaz.RecordCount > 0) and (isKonsult = False) then
          frmNazRg1.isNotKonsult := False
        else
          frmNazRg1.isNotKonsult := True;
        frmNazRg1.DoShowfrmNazRg(pAmbul, pPACID, frmMain.pSOTRID, -1, cxFam.Text+' '+cxName.Text+' '+cxOtch.Text, odsListNaz.FieldByName('FK_ID').AsInteger, odsListNaz.FieldByName('FC_TYPE').AsString);
        frmNazRg1.ShowModal;
        frmMain.IDNaz := frmNazRg1.FDNazID;
        isKonsult := frmNazRg1.isKonsult;
        lbKons.Visible := frmNazRg1.isKonsult;
        IDDOCID := frmNazRg1.FDDOCID;
        odsListNaz.Locate('FK_ID', frmMain.IDNaz, []);
        if frmMain.IDNaz <> 0 then
          begin
            ods := TOracleDataSet.Create(nil);
            try
              ods.Session := frmMain.os;
              ods.Cursor := crSQLWait;
              ods.SQL.Text := ' SELECT asu.GET_NAME_RGISSL(FK_SMID) AS NAMERG, '+#13+
                              '        (SELECT FC_TIME FROM asu.TSMID WHERE FK_ID = TNAZIS.FK_SMID) AS FC_TIME, '+#13+
                              '        (SELECT FN_NORM0 FROM asu.TSMID WHERE FK_ID = TNAZIS.FK_SMID) AS FN_DOZA '+#13+
                              '   FROM asu.TNAZIS WHERE FK_ID = :PFK_ID ';
              ods.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
              ods.Open;
              RefreshQuery(odsListNaz);
              VDOZA.EditValue := ods.FieldByName('fn_doza').AsFloat;
              VTIME.EditValue := ods.FieldByName('fc_time').AsInteger;
            finally
              ods.Free;
            end;
          end;
      finally
        frmNazRg1.Free;
      end;
    end else
    begin
      showmessage('Вы не можете изменить методику, которая выполнена врачом!');
    end;
end;

procedure TfrmLabNaprav.DoGetAddress;
var ods : TOracleDataSet;
begin
  HandleDLL := LoadLibrary('address.dll');
  if HandleDLL <> 0 then
  begin
    GetDllHandle := GetProcAddress(HandleDLL, 'GetDllHandle');
    IsAddrChanged := GetProcAddress(HandleDLL, 'IsAddrChanged');
    CreateAddrDLL := GetProcAddress(HandleDLL, 'CreateAddrDLL');
    AddAddr := GetProcAddress(HandleDLL, 'AddAddr');
    EditAddr := GetProcAddress(HandleDLL, 'EditAddr');
    ResizeAddrDll := GetProcAddress(HandleDLL, 'ResizeAddrDll');
    MoveAddrDll := GetProcAddress(HandleDLL, 'MoveAddrDll');
    SaveAddrChanges := GetProcAddress(HandleDLL, 'SaveAddrChanges');
    CommitAddrChanges := GetProcAddress(HandleDLL, 'CommitAddrChanges');
    CancelAddrChanges := GetProcAddress(HandleDLL, 'CancelAddrChanges');
    FreeAddrDll := GetProcAddress(HandleDLL, 'FreeAddrDll');
    CloseAddrDropDown := GetProcAddress(HandleDLL, 'CloseAddrDropDown');
    GetAddrText := GetProcAddress(HandleDLL, 'GetAddrText');
  end;
//------------------------------------------------------------------------------
  CreateAddrDLL(cxAddress.Handle, Application.Handle, frmMain.os.ExternalSVC);
  l_addr_loaded := True;
  if l_addr_loaded = True then
  begin
    if EDIT_MODE = True then
      begin
        AddAddr(pPEPLID, frmMain.GET_PROPISKAID);
      end else
      begin
        ods := TOracleDataSet.Create(nil);
          try
            ods.Session := frmMain.os;
            ods.SQL.Text := ' SELECT ASU.SEQ_TKARTA.NEXTVAL AS NEXTVALUE FROM DUAL ';
            ods.Open;
            id4NewPacAddress := ods.FieldByName('NEXTVALUE').AsInteger;
          finally
            ods.Free;
          end;
        AddAddr(id4NewPacAddress, frmMain.GET_PROPISKAID);
      end;
  end;
end;

procedure TfrmLabNaprav.DoGetLaborant;
var ods : TOracleDataSet;
begin
  if frmmain.list_xray_curr_vrach_as_owner = 1 then
   begin
    cxRgLaborant.EditValue := frmMain.pSOTRID;
    cxRgLaborant.enabled := (frmMain.get_can_change_vrach = 1) or (cxRgLaborant.EditValue = null) or (cxRgLaborant.EditValue = 1) or (cxRgLaborant.Text = '');
   end
  else
   begin
    ods := TOracleDataSet.Create(nil);  // !!! в регистаторе в "указанный лаборант" вводится от FLU_LABORANT
    try                                 // а здесь поднимается от "RG_LABORANT" так и должно быть?
      ods.Session := frmMain.os;
      ods.SQL.Text := ' BEGIN '+
                      '   SELECT MAX(FN_NUM) INTO :VAL '+
                      '     FROM TIB '+
                      '    WHERE FK_PACID = :PFK_PEPLID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''RG_LABORANT''); '+
                      '   IF :VAL IS NULL THEN '+
                      '     SELECT 0 INTO :VAL FROM DUAL; '+
                      '   END IF; '+
                      ' END; ';
      ods.DeclareAndSet('PFK_PEPLID', otInteger, pNAZID);
      ods.DeclareVariable('VAL', otInteger);
      ods.Open;
      if ods.GetVariable('VAL') <> 0 then
        cxRgLaborant.EditValue := ods.GetVariable('VAL')
      else
        cxRgLaborant.EditValue := frmMain.pSOTRID;
    finally
      ods.Free;
    end;
   end;
end;

procedure TfrmLabNaprav.DoVrachNapravil;
var ods : TOracleDataSet;
begin
  if pNAZID = 0 then // если есть назначение
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.SQL.Text := ' BEGIN '+  // берем значение из TIB. если пусто выводим "пусто"
                        '   SELECT MAX(FC_CHAR) INTO :VAL '+
                        '     FROM TIB '+
                        '    WHERE FK_PACID = :PFK_PEPLID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''VRACH_NAPRAVIL''); '+
                        '   IF :VAL IS NULL THEN '+
                        '     SELECT '''' AS VRACHFIO INTO :VAL FROM DUAL; '+
                        '   END IF; '+
                        ' END; ';
        ods.DeclareAndSet('PFK_PEPLID', otInteger, pNAZID);
        ods.DeclareVariable('VAL', otString);
        ods.Open;
        if ods.GetVariable('VAL') <> '' then
          cxVrach.Text := ods.GetVariable('VAL') //!!! интересное условие, если не сказать больше :)
        else
          cxVrach.Text := ods.GetVariable('VAL');
      finally
        ods.Free;
      end;
    end else
    begin
      ods := TOracleDataSet.Create(nil); // если новое назначение
      try
        ods.Session := frmMain.os;
        ods.SQL.Text := ' BEGIN '+  // берем значение из TIB. если пусто то выводим TNAZIS.FK_VRACHID
                        '   SELECT MAX(FC_CHAR) INTO :VAL '+
                        '     FROM TIB '+
                        '    WHERE FK_PACID = :PFK_PEPLID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''VRACH_NAPRAVIL''); '+
                        '   IF :VAL IS NULL THEN '+
                        '     SELECT NVL(DO_VRACHFIO(TNAZIS.FK_VRACHID), '''') INTO :VAL FROM TNAZIS WHERE FK_ID = :PFK_PEPLID ; '+
                        '   END IF; '+
                        ' END; ';
        ods.DeclareAndSet('PFK_PEPLID', otInteger, pNAZID);
        ods.DeclareVariable('VAL', otString);
        ods.Open;
        if ods.GetVariable('VAL') <> '' then
          cxVrach.Text := ods.GetVariable('VAL')  //!!! интересное условие, если не сказать больше :)
        else
          cxVrach.Text := ods.GetVariable('VAL');
      finally
        ods.Free;
      end;
    end;
end;

procedure TfrmLabNaprav.bAddClick(Sender: TObject);
var ods : TOracleDataSet;
    v_d, v_m, v_cxNum, v_nums : string;
    v_pos:integer;
     oq : TOracleQuery;
begin
  if isKonsult = True then
    begin
      Application.MessageBox('Данная услуга является консультативной! Добавление новых услуг в это направление невозможно!',
                             'Предупреждение', mb_iconwarning+mb_ok);
      exit;
    end;
 { if USE_ONE_ACCESSIONNUMBER=1 then
    if Trim(cxNumIssl1.Text)='' then
    begin
      MessageDlg( 'Не задан номер протокола ...', mtWarning, [mbOK], 0);
      Exit;
    end;   }
  frmMain.Update := False;
//-- 1. Добавляем назначение
  Application.CreateForm(TfrmNazRg1, frmNazRg1);
  try
    if (odsListNaz.RecordCount > 0) and (isKonsult = False) then
      frmNazRg1.isNotKonsult := False
    else
      frmNazRg1.isNotKonsult := True;
    if odsListNaz.RecordCount = 0 then
    begin
      if USE_ONE_ACCESSIONNUMBER=0 then
      begin
        if cxNumIssl1.Text='' then
          cxNumIssl1.Text:=DoGetNumIssl;
        frmNazRg1.DoShowfrmNazRg(pAmbul, pPACID, frmMain.pSOTRID, -1, cxFam.Text+' '+cxName.Text+' '+cxOtch.Text, 0, cxNumIssl1.Text ); // GetNumber
      end else
        frmNazRg1.DoShowfrmNazRg(pAmbul, pPACID, frmMain.pSOTRID, -1, cxFam.Text+' '+cxName.Text+' '+cxOtch.Text, 0, GetNumber ); // GetNumber
    end else
      frmNazRg1.DoShowfrmNazRg(pAmbul, pPACID, frmMain.pSOTRID, -1, cxFam.Text+' '+cxName.Text+' '+cxOtch.Text, 0, odsListNaz.FieldByName('FC_TYPE').AsString);
    frmNazRg1.ShowModal;
    frmMain.IDNaz := frmNazRg1.FDNazID;
    isKonsult := frmNazRg1.isKonsult;
    lbKons.Visible := frmNazRg1.isKonsult;
    IDDOCID := frmNazRg1.FDDOCID;
    if frmMain.IDNaz <> 0 then
      begin
        ods := TOracleDataSet.Create(nil);
        try
          ods.Session := frmMain.os;
          ods.Cursor := crSQLWait;
          ods.SQL.Text := ' SELECT TRUNC(FD_RUN) AS FD_RUN, '+#13+
                          '        TO_CHAR(FD_RUN, ''HH24:MI'') AS TIME_FD_RUN '+#13+
                          '   FROM ASU.TNAZIS WHERE FK_ID = :PFK_ID ';
          ods.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
          ods.Open;
          cxdeDateProtocol.Date := ods.FieldByName('FD_RUN').AsDateTime;
          cxteTimeProtocol.Text := ods.FieldByName('TIME_FD_RUN').AsString;
//-->> 2. В зависимости от настройки начинаем работу с Амбулаторным талоном
        if isKonsult = True then  // если консультативная услуга
          begin
            InsertKonsultUslug(frmMain.IDNaz);
          end else
          begin
            if (frmMain.GET_AMBTALON_XRAY = '-1') and (pAMBUL = 1) and (EDIT_MODE = True) then
              begin
                idTalon := GetLastTalonID(Application.Handle, frmMain.os, pPACID, frmMain.pSOTRID, -1);
              end;
          end;
        RefreshQuery(odsListNaz);
        odsListNaz.Locate('FK_ID', frmMain.IDNaz, []);
        if odsSnimokVid.Locate('fk_default', 1, []) then
          begin
            VVIDSNIMOK.Focused := True;
            VVIDSNIMOK.EditValue := odsSnimokVid.FieldByName('fk_id').AsInteger; // ставим вид снимка по умолчанию
          end;
//-->> 3. если было прикрепление к амб талону, то делаем связку амб талона с назначением
        if idTalon <> 0 then
          begin
            oq := TOracleQuery.Create(nil);
            try
              oq.Session := frmMain.os;
              oq.Cursor := crSQLWait;
              oq.SQL.Text := ' merge into asu.tambtalon_naz using dual on '+#13+
                             '   (fk_talonid = :pfk_talonid and fk_ambid = :pfk_ambid and fk_nazid = :pfk_nazid) '+#13+
                             ' when not matched then '+#13+
                             '   insert(fk_talonid, fk_ambid, fk_nazid) values(:pfk_talonid, :pfk_ambid, :pfk_nazid) ';
              oq.DeclareAndSet('PFK_TALONID', otInteger, idTalon);
              oq.DeclareAndSet('PFK_AMBID', otInteger, pPACID);
              oq.DeclareAndSet('PFK_NAZID', otInteger, frmMain.IDNaz);
              oq.Execute;
              frmMain.os.Commit;
            finally
              oq.Free;
            end;
          end;
      finally
        ods.Free;
      end;
    end;
  finally
    frmNazRg1.Free;
  end;
  //
  v_d:=inttostr(DayOf(Date));
  if Length(v_d)=1 then v_d:='0'+v_d;
  v_m:=inttostr(Monthof(Date));
  if Length(v_m)=1 then v_m:='0'+v_d;
  v_pos:=pos('/',cxNum.Text);
  if v_pos>0 then
    v_cxNum:=Copy(cxNum.Text,1,v_pos-1)
  else
    v_cxNum:=cxNum.Text;
  odsListNaz.DisableControls;
  odsListNaz.Refresh;
  odsListNaz.First;
  while not odsListNaz.Eof do
  begin
    if odsListNaz.FieldByName('fc_accessionnumber').AsString='' then   //       VAccessionNumber.EditValue
    begin
      with TOracleQuery.Create(nil) do
        try
          Session:=frmMain.os;
          SQL.Text:='select MED.SEQ_TANNMBSTR.NEXTVAL as f1 from dual';
          Execute;
          v_nums:=IntToStr(FieldAsInteger('f1'));
        finally
          Close;
          Free;
        end;
    {  odsListNaz.Edit;
      odsListNaz.FieldByName('fc_accessionnumber').AsString :=
        v_nums+'/'+v_cxNum;    //  cxNumIssl1.Text   IntToStr(odsListNaz.RecNo)+
      odsListNaz.Post;  }
      if USE_ONE_ACCESSIONNUMBER=1 then begin
        with TOracleQuery.Create(nil) do
        try
          Session := frmMain.os;
          Cursor := crSQLWait;
          SQL.Text:='update ASU.TNAZIS set fc_accessionnumber=:p_fc_accessionnumber where fk_id=:p_fk_id';
          DeclareAndSet('p_fc_accessionnumber',otString, sNUMBERISSL );
          DeclareAndSet('p_fk_id',otInteger,odsListNaz.FieldByName('fk_id').AsInteger);
          Execute;
          frmMain.os.Commit;
        finally
          Free;
        end;
      end else
      if (frmMain.get_autogenAccNmb = 1) then
        with TOracleQuery.Create(nil) do
        try
          Session := frmMain.os;
          Cursor := crSQLWait;
          SQL.Text:='update ASU.TNAZIS set fc_accessionnumber=:p_fc_accessionnumber where fk_id=:p_fk_id';
          DeclareAndSet('p_fc_accessionnumber',otString,v_nums+'/'+v_cxNum);
          DeclareAndSet('p_fk_id',otInteger,odsListNaz.FieldByName('fk_id').AsInteger);
          Execute;
          frmMain.os.Commit;
        finally
          Free;
        end;
    end;
    odsListNaz.Next;
  end;
  odsListNaz.Refresh;  
  odsListNaz.First;
  odsListNaz.EnableControls;
  //
  if ( (USE_ONE_ACCESSIONNUMBER=1) and (frmMain.get_autogenAccNmb = 1) and (cxNumIssl1.Text=''))
  then
    cxNumIssl1.Text:=v_nums+'/'+v_cxNum;
end;

procedure TfrmLabNaprav.odsListNazBeforeOpen(DataSet: TDataSet);
begin
  if IDDOCID = '' then
    odsListNaz.SetVariable('PFC_TYPE', sNUMBERISSL)
  else
    odsListNaz.SetVariable('PFC_TYPE', IDDOCID);
  odsListNaz.SetVariable('PFK_PACID', pPACID);
end;

procedure TfrmLabNaprav.odsRgLaborantBeforeOpen(DataSet: TDataSet);
begin
  odsRgLaborant.SetVariable('PFK_OTDELID', frmMain.pOTDELID);
end;

procedure TfrmLabNaprav.odsListNazApplyRecord(Sender: TOracleDataSet; Action: Char; var Applied: Boolean; var NewRowId: String);
var oq : TOracleQuery; v_ok:Boolean;
begin
  case Action of
    'U':
       begin
         if VAccessionNumber.Focused then
           begin
              v_ok:=True;
              with TOracleQuery.Create(nil) do
              try
                Session := frmMain.os;
                Cursor := crSQLWait;
                SQL.Text:='select 1 from ASU.TNAZIS where fc_accessionnumber=:p_fc_accessionnumber '+#10+
                          'and fk_id<>:p_fk_id and fc_accessionnumber is not null';
                DeclareAndSet('p_fc_accessionnumber',otString,odsListNaz.FieldByName('fc_accessionnumber').AsString);
                DeclareAndSet('p_fk_id',otInteger,odsListNaz.FieldByName('fk_id').AsInteger);
                Execute;
                v_ok:=Eof;
              finally
                Free;
              end;
              if (v_ok or (Frmmain.xray_chkUniqAccNmb=0)) then
                with TOracleQuery.Create(nil) do
                try
                  Session := frmMain.os;
                  Cursor := crSQLWait;
                  SQL.Text:='update ASU.TNAZIS set fc_accessionnumber=:p_fc_accessionnumber where fk_id=:p_fk_id';
                  DeclareAndSet('p_fc_accessionnumber',otString,odsListNaz.FieldByName('fc_accessionnumber').AsString);
                  DeclareAndSet('p_fk_id',otInteger,odsListNaz.FieldByName('fk_id').AsInteger);
                  Execute;
                  frmMain.os.Commit;
                finally
                  Free;
                end
              else
              begin
                MessageDlg('Данный номер зарегистрирован в системе.', mtWarning, [mbOK], 0);
                odsListNaz.FieldByName('fc_accessionnumber').AsString:='';
              end;
           end;
         if VSNIMOK.Focused then
           begin
             oq := TOracleQuery.Create(nil);
             try
               oq.Session := frmMain.os;
               oq.Cursor := crSQLWait;
               oq.SQL.Text := ' DECLARE '+#13+
                              '   nSMID NUMBER; '+#13+
                              '   Cnt NUMBER; '+#13+
                              ' BEGIN '+#13+
                              '   SELECT COUNT(FK_ID) INTO Cnt FROM asu.TIB WHERE FK_PACID = :pFK_PACID AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOUCHET''); '+#13+
                              ' IF Cnt > 0 THEN '+#13+
                              '   UPDATE TIB SET FN_NUM = :pFN_NUM, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_PACID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOUCHET''); '+#13+
                              ' ELSE '+#13+
                              '   SELECT FK_ID INTO nSMID FROM asu.TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOUCHET''; '+#13+
                              '   INSERT INTO asu.TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_PACID, :pFN_NUM, nSMID, nSMID, :pFK_VRACHID); '+#13+
                              ' END IF; '+#13+
                              ' END; ';
               oq.DeclareAndSet('PFN_NUM', otFloat, VSNIMOK.DataBinding.Field.Value);
               oq.DeclareAndSet('PFK_PACID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
               oq.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
               oq.Execute;
               frmMain.os.Commit;
             finally
               oq.Free;
             end;
           end;
         if VPROS.Focused then
           begin
             oq := TOracleQuery.Create(nil);
             try
               oq.Session := frmMain.os;
               oq.Cursor := crSQLWait;
               oq.SQL.Text := ' DECLARE '+
                              '   nSMID NUMBER; '+
                              '   Cnt NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt FROM TIB WHERE FK_PACID = :pFK_PACID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOPRSV''); '+
                              ' IF Cnt > 0 THEN '+
                              '   UPDATE TIB SET FN_NUM = :pFN_NUM, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_PACID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOPRSV''); '+
                              ' ELSE '+
                              '   SELECT FK_ID INTO nSMID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOPRSV''; '+
                              '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_PACID, :pFN_NUM, nSMID, nSMID, :pFK_VRACHID); '+
                              ' END IF; '+
                              ' END; ';
               oq.DeclareAndSet('PFN_NUM', otFloat, VPROS.DataBinding.Field.Value);
               oq.DeclareAndSet('PFK_PACID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
               oq.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
               oq.Execute;
               frmMain.os.Commit;
             finally
               oq.Free;
             end;
           end;
         if VDOZA.Focused then
           begin
             oq := TOracleQuery.Create(nil);
             try
               oq.Session := frmMain.os;
               oq.Cursor := crSQLWait;
               oq.SQL.Text := ' DECLARE '+
                              '   Cnt NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt FROM TIB WHERE FK_PACID = :pFK_PACID AND FK_SMID = -1 AND FK_SMEDITID = -1; '+
                              ' IF Cnt > 0 THEN '+
                              '   UPDATE TIB SET FN_NUM = :pFN_NUM, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_PACID AND FK_SMID = -1 AND FK_SMEDITID = -1; '+
                              ' ELSE '+
                              '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_PACID, :pFN_NUM, -1, -1, :pFK_VRACHID); '+
                              ' END IF; '+
                              ' END; ';
               oq.DeclareAndSet('PFN_NUM', otFloat, VDOZA.DataBinding.Field.Value);
               oq.DeclareAndSet('PFK_PACID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
               oq.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
               oq.Execute;
               frmMain.os.Commit;
             finally
               oq.Free;
             end;
           end;
         if VTIME.Focused then
           begin
             oq := TOracleQuery.Create(nil);
             try
               oq.Session := frmMain.os;
               oq.Cursor := crSQLWait;
               oq.SQL.Text := ' DECLARE '+
                              '   Cnt NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt FROM TIB WHERE FK_PACID = :pFK_PACID AND FK_SMID = -2 AND FK_SMEDITID = -2; '+
                              ' IF Cnt > 0 THEN '+
                              '   UPDATE TIB SET FN_NUM = :pFN_NUM, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_PACID AND FK_SMID = -2 AND FK_SMEDITID = -2; '+
                              ' ELSE '+
                              '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_PACID, :pFN_NUM, -2, -2, :pFK_VRACHID); '+
                              ' END IF; '+
                              ' END; ';
               oq.DeclareAndSet('PFN_NUM', otFloat, VTIME.DataBinding.Field.Value);
               oq.DeclareAndSet('PFK_PACID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
               oq.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
               oq.Execute;
               frmMain.os.Commit;
             finally
               oq.Free;
             end;
           end;
         if VVIDSNIMOK.Focused then          // !!! неправильно, в tib fk_smid = fk_smeditid, а должно быть fk_smeditid = owner(fk_smid)
           begin
             oq := TOracleQuery.Create(nil);
             try
               oq.Session := frmMain.os;
               oq.Cursor := crSQLWait;
               oq.SQL.Text := ' DECLARE '+#13+
                              '   Cnt6 NUMBER; '+#13+
                              ' BEGIN '+#13+
                              '   SELECT COUNT(FK_ID) INTO Cnt6 '+#13+
                              '     FROM asu.TIB '+#13+
                              '    WHERE FK_PACID = :PFK_ID '+#13+
                              '      AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM asu.TSMID WHERE FC_SYNONIM = ''VID_SNIMOK'')); '+#13+
                              ' IF Cnt6 > 0 THEN '+#13+
                              '   UPDATE asu.TIB SET FK_SMID = :pFK_SMID6, FK_SMEDITID =:pFK_SMEDITID6, FK_VRACHID =:pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''VID_SNIMOK'')); '+#13+
                              ' ELSE '+#13+
                              '   INSERT INTO asu.TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFK_SMID6, :pFK_SMEDITID6, :pFK_VRACHID); '+#13+
                              ' END IF; '+#13+
                              ' END; ';
               oq.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
               oq.DeclareAndSet('pFK_SMID6', otInteger, VVIDSNIMOK.DataBinding.Field.Value);
               oq.DeclareAndSet('pFK_SMEDITID6', otInteger, VVIDSNIMOK.DataBinding.Field.Value);
               oq.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
               oq.Execute;
               frmMain.os.Commit;
             finally
               oq.Free;
             end;
           end;
         if VTYPEPLENKA.Focused then
           begin
             oq := TOracleQuery.Create(nil);
             try
               oq.Session := frmMain.os;
               oq.Cursor := crSQLWait;
               oq.SQL.Text := ' DECLARE '+
                              '   Cnt6 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt6 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_VIDPLENKI'')); '+
                              ' IF Cnt6 > 0 THEN '+
                              '   UPDATE TIB SET FK_SMID = :pFK_SMID6, FK_SMEDITID =:pFK_SMEDITID6, FK_VRACHID =:pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_VIDPLENKI'')); '+
                              '   UPDATE TIB SET FK_SMEDITID =:pFK_SMEDITID6, FK_VRACHID =:pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVO_LISTOV'')); '+
                              ' ELSE '+
                              '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFK_SMID6, :pFK_SMEDITID6, :pFK_VRACHID); '+
                              ' END IF; '+
                              ' END; ';
               oq.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
               oq.DeclareAndSet('pFK_SMID6', otInteger, VTYPEPLENKA.DataBinding.Field.Value);
               oq.DeclareAndSet('pFK_SMEDITID6', otInteger, VTYPEPLENKA.DataBinding.Field.Value);
               oq.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
               oq.Execute;
               frmMain.os.Commit;
             finally
               oq.Free;
             end;
           end;
         if VKOLVOLISTOV.Focused then
           begin
             oq := TOracleQuery.Create(nil);
             try
               oq.Session := frmMain.os;
               oq.Cursor := crSQLWait;
               oq.SQL.Text := ' DECLARE '+
                              '   Cnt6 NUMBER; '+
                              ' BEGIN '+
                              '   SELECT COUNT(FK_ID) INTO Cnt6 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVO_LISTOV'')); '+
                              ' IF Cnt6 > 0 THEN '+
                              '   UPDATE TIB SET FN_NUM = :pFN_NUM6, '+'FK_SMID = :pFK_SMID6, FK_SMEDITID =:pFK_SMEDITID6, FK_VRACHID =:pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVO_LISTOV'')); '+
                              ' ELSE '+
                              '   INSERT INTO TIB(FN_NUM, FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFN_NUM6, :pFK_ID, :pFK_SMID6, :pFK_SMEDITID6, :pFK_VRACHID); '+
                              ' END IF; '+
                              ' END; ';
               oq.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
               oq.DeclareAndSet('pFK_SMID6', otInteger, VKOLVOLISTOV.DataBinding.Field.Value);
               oq.DeclareAndSet('pFK_SMEDITID6', otInteger, VTYPEPLENKA.DataBinding.Field.Value);
               oq.DeclareAndSet('pFN_NUM6', otFloat, odsKolvoListov.FieldByName('FK_DEFAULT').AsFloat);
               oq.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
               oq.Execute;
               frmMain.os.Commit;
             finally
               oq.Free;
             end;
           end;
       end;
  end;
  Applied := TRUE;
end;

procedure TfrmLabNaprav.bbZaklClick(Sender: TObject);
begin

//  RefreshQuery(odsListNaz);
end;

procedure TfrmLabNaprav.bDelClick(Sender: TObject);
var oq : TOracleQuery;
    ods, odsOpl : TOracleDataSet;
    s, sGroup, sGuid, sSex, sVrachFIO, sModality : string;
begin
  odsOpl := TOracleDataSet.Create(nil);
  odsOpl.Session := frmMain.os;
  odsOpl.Cursor := crSQLWait;
  try
    odsOpl.SQL.Text := ' select asu.pkg_platuslug.IS_USL_PAYED((select fk_id from asu.tplat_uslug where fk_naz = :pfk_naz)) as opl from dual ';
    odsOpl.DeclareAndSet('pfk_naz', otInteger, odsListNaz.FieldByName('fk_id').AsInteger);
    odsOpl.Open;
    if odsOpl.FieldByName('opl').AsInteger = 1 then
      begin
        MessageDlg('Внимание!'+#13+#10+'Данная услуга является оплаченной!'+#13+#10+'Её невозможно удалить!', mtInformation, [mbOK], 0);
        exit;
      end;
  finally
    odsOpl.Free;
  end;
  if (odsListNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_NAZCANCEL) or (odsListNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_VIPNAZ) then
  begin
    Application.MessageBox('Эта методика выполнена или отменена врачом. Вы не можете её удалить!', 'Вопрос', MB_OK + MB_ICONWARNING)
  end else
  begin
  if Application.MessageBox('Вы действительно хотите удалить методику из списка?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    begin
      oq := TOracleQuery.Create(nil);
      oq.Session := frmMain.os;
      oq.Cursor := crSQLWait;
      ods := TOracleDataSet.Create(nil);
      ods.Session := frmMain.os;
      ods.Cursor := crSQLWait;
      try
        if frmMain.get_lookinside = '-1' then // удаление исследования с WLM (если есть сопряжение с LookInside)
          begin
            ods.Close;
            ods.DeleteVariables;
            ods.SQL.Text := ' select fk_guid from asu.txrayguid where fk_nazid = :pfk_nazid ';
            ods.DeclareAndSet('pfk_nazid', otInteger, odsListNaz.FieldByName('fk_id').AsInteger);
            ods.Open;
            sGuid := ods.FieldByName('fk_guid').AsString;
          end;
        oq.SQL.Text := ' delete from asu.tnazis where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsListNaz.FieldByName('fk_id').AsInteger);
        oq.Execute;
        if frmMain.get_db_name = 'SK' then // -- для кардио центра проверяем выгружен ли талон, если не выгружен удаляем и талон
          begin
            ods.DeleteVariables;
            ods.Close;
            ods.SQL.Text := ' select fk_talonid from asu.tambtalon_naz where fk_nazid = :pfk_nazid ';
            ods.DeclareAndSet('pfk_nazid', otInteger, odsListNaz.FieldByName('fk_id').AsInteger);
            ods.Open;
            odsCntOut.Close;
            odsCntOut.SetVariable('pTalonID', ods.FieldByName('fk_talonid').AsInteger);
            odsCntOut.Open;
            if odsCntOut.FieldByName('cnt_out').AsInteger = 0 then
              begin
                oq.DeleteVariables;
                oq.SQL.Text := ' delete from asu.tambtalon where fk_id = :pfk_id ';
                oq.DeclareAndSet('pfk_id', otInteger, ods.FieldByName('fk_talonid').AsInteger);
                oq.Execute;
              end;
          end;
        if frmMain.get_lookinside = '-1' then // удаление исследования с WLM (если есть сопряжение с LookInside)
          begin
            ods.DeleteVariables;
            ods.Close;
            ods.SQL.Text := ' select asu.get_smidname(fk_default) as namegroup from asu.tsmid where fk_id = :pfk_id ';
            ods.DeclareAndSet('pfk_id', otInteger, odsListNaz.FieldByName('fk_smid').AsInteger);
            ods.Open;
            sGroup := ods.FieldByName('namegroup').AsString;
            ods.Close;
            ods.DeleteVariables;
            ods.SQL.Text := ' select asu.do_vrachfio(:pfk_vrachid) as vrachfio from dual ';
            ods.DeclareAndSet('pfk_vrachid', otInteger, odsListNaz.FieldByName('fk_vrachid').AsInteger);
            ods.Open;
            sVrachFIO := ods.FieldByName('vrachfio').AsString; // назначивший врач
            ods.Close;
            ods.DeleteVariables;
            ods.SQL.Text := ' select fc_aetitle from asu.txray_apparats where fk_kabinet = :pfk_kabinet ';
            ods.DeclareAndSet('pfk_kabinet', otInteger, odsListNaz.FieldByName('fk_roomid').AsInteger);
            ods.Open;
            sModality := ods.FieldByName('fc_aetitle').AsString; // модальность кабинета(аппарата)

            HL7Sender1.Port := StrToInt(frmMain.get_lookinside_portsend);
            HL7Sender1.Host := frmMain.get_lookinside_hl7ip;

            if cxMale.Checked then
              sSex := 'M'
            else
              sSex := 'F';

            s := 'MSH|^~\&|||||||ORM^O01|||2.3|'+#13#10+
                 'PID||'+IntToStr(pPACID)+'|||'+CyrToLatGOST(cxFam.Text+' '+copy(cxName.Text, 1, 1)+'. '+copy(cxOtch.Text, 1, 1))+'.||'+FormatDateTime('yyyymmdd', cxdeRojd.Date)+'|'+sSex+'||||||||||||||||||||'+#13#10+
                 'PV1||||||||'+CyrToLatGOST(sVrachFIO)+'|||||||||||||||||||||||||||||||||||||'+#13#10+ // назначивший врач, лаборант, сотрудник
                 'ORC|CA||||CA||^^^'+FormatDateTime('yyyymmddhhmmss', StrToDateTime(DateToStr(cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn:ss', IncSecond(cxteTimeProtocol.Time, 1))))+'||||||'+#13#10+
                 'OBR||||'+IntToStr(odsListNaz.FieldByName('fk_id').AsInteger)+'^'+CyrToLatGOST(AnsiUpperCase(odsListNaz.FieldByName('fc_name').AsString))+'^'+AnsiUpperCase(sModality)+'^'+CyrToLatGOST(sGroup)+'||||||||||||||||||||||||'+#13#10+
                 'ZDS|'+sGuid+'^^Application^DICOM|';
            HL7Sender1.SendMessage(s);
          end;
        frmMain.os.Commit;
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' select fk_owner from asu.tsmid where fk_id = :pfk_id ';
        ods.DeclareAndSet('pfk_id', otInteger, odsListNaz.FieldByName('fk_smid').AsInteger);
        ods.Open;
        if ods.FieldByName('fk_owner').AsInteger = frmMain.GET_ISSL_FLU then
          begin
            oq.DeleteVariables;
            oq.SQL.Text := ' declare '+#13+
                           '   sDate varchar2(20); '+#13+
                           ' begin '+#13+
                           '   select asu.get_last_fluoro_date(:pfk_peplid, 1) into sDate from dual; '+#13+
                           '   if sDate is null then '+#13+
                           '     delete from asu.tlastfluoro where fk_peplid = :pfk_peplid; '+#13+
                           '   else '+#13+
                           '     update asu.tlastfluoro '+#13+
                           '        set fd_date = to_date(sDate, ''dd.mm.yyyy''), '+#13+
                           '            fc_num = asu.get_last_fluoro_num(:pfk_peplid) '+#13+
                           '      where fk_peplid = :pfk_peplid; '+#13+
                           '   end if; '+#13+
                           ' end; ';
            oq.DeclareAndSet('pfk_peplid', otInteger, pPEPLID);
            oq.Execute;
            frmMain.os.Commit;
          end;
      finally
        oq.Free;
        ods.Free;
      end;
      RefreshQuery(odsListNaz);
    end;
  end;
end;

procedure TfrmLabNaprav.bVozrastClick(Sender: TObject);
var ods : TOracleDataSet;
begin
  if cxdeRojd.Text <> '' then
  begin
    if cxdeRojd.Date > frmMain.get_systemdate then
      begin
        MessageDlg('Вы ввели дату рождения пациента больше сегодняшней даты!'+#13+#10+'Это недопустимо!'+#13+#10+'Установите правильную дату рождения пациента!', mtWarning, [mbOK], 0);
        cxdeRojd.SetFocus;
        Exit;
      end else
      begin
        ods := TOracleDataSet.Create(nil);
        try
          ods.Session := frmMain.os;
          ods.Cursor := crSQLWait;
          ods.SQL.Text := ' SELECT TRUNC(MONTHS_BETWEEN(SYSDATE,:pFD_ROJD)/12) AS PACAGE FROM DUAL ';
          ods.DeclareAndSet('pFD_ROJD', otDate, cxdeRojd.Date);
          ods.Open;
          cxAge.Caption := IntToStr(ods.FieldByName('PACAGE').AsInteger);
        finally
          ods.Free;
        end;
      end;
  end;
end;

procedure TfrmLabNaprav.ceSpeedPropertiesChange(Sender: TObject);
begin
  isSpeed := True;
end;

function TfrmLabNaprav.DoGetNumIssl:string;
begin
  Result:='';
  odsListNaz.DisableControls;
  odsListNaz.First;
  while not odsListNaz.Eof do
  begin
    if odsListNaz.FieldByName('FC_TYPE').AsString<>'' then
    begin
      Result:=odsListNaz.FieldByName('FC_TYPE').AsString;
      break;
    end;
    Next;
  end;
  if Result='' then
    Result := GetNumber;
  if Result='' then
    Result := gen_accnmb_grpid(False);
  odsListNaz.EnableControls;
end;

procedure TfrmLabNaprav.DoUpdateNumIssl;
var oq : TOracleQuery;
begin
  odsListNaz.DisableControls;
  odsListNaz.First;
  while not odsListNaz.Eof do
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.SQL.Text := ' UPDATE ASU.TNAZIS SET FC_TYPE = :PFC_TYPE WHERE FK_ID = :PFK_ID ';
        if cxNumIssl1.Text = '' then
          oq.DeclareAndSet('PFC_TYPE', otString, odsListNaz.FieldByName('FC_TYPE').AsString)
        else
          oq.DeclareAndSet('PFC_TYPE', otString, trim(cxNumIssl1.Text));
        oq.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);

// MessageDlg('6 PFC_TYPE='+trim(cxNumIssl1.Text)+' PFK_ID='+inttostr(odsListNaz.FieldByName('FK_ID').AsInteger), mtWarning, [mbOK], 0);

        oq.Execute;
        frmMain.os.Commit;
      finally
        oq.Free;
      end;
      odsListNaz.Next;
    end;
  odsListNaz.EnableControls;
end;

procedure TfrmLabNaprav.odsListNazAfterOpen(DataSet: TDataSet);
begin
  aZakl.Enabled := odsListNaz.RecordCount > 0;
  bDel.Enabled := (odsListNaz.RecordCount > 0) and (odsListNaz.FieldByName('FK_VRACHID').AsInteger = frmMain.pSOTRID);
  aSendToWL.Visible := (odsListNaz.RecordCount > 0) and (frmMain.get_use_wl = '-1'); // Отправка на WL
end;

procedure TfrmLabNaprav.DoUpdateAddress(nIDPepl: Integer);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);   
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' UPDATE TADRESS SET FK_PACID = :PFK_PACID WHERE FK_PACID = :PFK_PACID1 ';
    oq.DeclareAndSet('PFK_PACID', otInteger, nIDPepl);
    oq.DeclareAndSet('PFK_PACID1', otInteger, id4NewPacAddress);
    oq.Execute;
    frmMain.os.Commit;
  finally
    oq.Free;
  end;
end;

function TfrmLabNaprav.GetLastTalonID(App_HND: THandle; OS: TORacleSession; pPacID, pSOTRID, pTalonID: Integer): integer;
var AAmbTalonHandle: THandle;
    str: string;
    GetAmbtalonId: function(App_HND: THandle; OS: TORacleSession; pPacID, pSOTRID, pTalonID:Integer; pDate : TDateTime) : LongInt; stdcall;
begin
  if v_db_lpu = 'XA' then
   begin
    with TOracleQuery.Create(nil) do
    try
      Session:=frmMain.os;
      SQL.Text:='SELECT MAX(FK_ID) as FK_ID, 0 as FN_SOS '+#13+
                ' FROM (select fk_id  '+#13+
                '      FROM  ASU.tambtalon where fk_ambid=:pFK_PACID and fn_sos=0 '+#13+
                '      AND FD_OPENED = (SELECT MAX(FD_OPENED) FROM  ASU.tambtalon where fk_ambid=:pFK_PACID and fn_sos=0) ) '+#13+
                ' UNION ALL '+#13+
                ' SELECT MAX(FK_ID) as FK_ID, 1 as FN_SOS '+#13+
                ' FROM (select fk_id '+#13+
                '      FROM  ASU.tambtalon where fk_ambid=:pFK_PACID and fn_sos=1 '+#13+
                '      AND FD_OPENED = (SELECT MAX(FD_OPENED) FROM  ASU.tambtalon where fk_ambid=:pFK_PACID and fn_sos=1) ) '+#13+
                ' ORDER BY FN_SOS ';
      DeclareAndSet('pFK_PACID',otInteger,pPacID);
      Execute;
      if not Eof then // 1 строку
        Result := FieldAsInteger('FK_ID')
      else
        Result := 0;
    finally
      Free;
    end;
   end
  else
   begin
  Result := -1;
  @GetAmbtalonId := nil;
  AAmbTalonHandle := LoadLibrary('AMBTalonDLL.dll');
  if AAmbTalonHandle > HINSTANCE_ERROR then
    begin
      @GetAmbtalonId := GetProcAddress(AAmbTalonHandle, 'InitPluginGetAmbtalonIdDefDate');
      if @GetAmbtalonId <> nil then
        begin
          try
            Result := GetAmbtalonId(App_HND, os, pPacID, frmMain.pSOTRID, pTalonID, StrToDateTime(DateToStr(cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn:ss', cxteTimeProtocol.Time)));
          except
            on E:Exception do
              begin
                str := 'Ошибка при загрузке внешнего модуля'+sLineBreak+e.Message;
                Application.MessageBox(PChar(str), 'Ошибка', MB_OK + MB_ICONINFORMATION);
              end;
          end;
        end;
      FreeLibrary(AAmbTalonHandle);
    end;
   end;
end;

function TfrmLabNaprav.GetNumber: String;
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
  ods := TOracleDataSet.Create(nil);
  oq := TOracleQuery.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FC_VALUE FROM TSMINI WHERE FC_SECTION = ''XRAY_NAPRAVLENIE'' AND FC_KEY = ''ID_NUMBER'' ';
    ods.Open;
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' UPDATE TSMINI SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY_NAPRAVLENIE'' AND FC_KEY = ''ID_NUMBER'' ';
    oq.DeclareAndSet('PFC_VALUE', otString, IntToStr(StrToInt(ods.FieldByName('FC_VALUE').AsString)+1));
    oq.Execute;
    frmMain.os.Commit;
    Result := IntToStr(StrToInt(ods.FieldByName('FC_VALUE').AsString)+1);
  finally
    oq.Free;
    ods.Free;
  end;
end;

procedure TfrmLabNaprav.HL7Sender1ACKResponse(Sender: TObject);
//var oq : TOracleQuery;
begin
//  oq := TOracleQuery.Create(nil);
//  try
//    oq.Session := frmMain.os;
//    oq.Cursor := crSQLWait;
//    oq.SQL.Text := ' update asu.tnazis set fk_resultid = 1 where fk_id = :pfk_id '; // проставляем статус "Исследование отправлено на WLM"
//    oq.DeclareAndSet('pfk_id', otInteger, odsListNaz.FieldByName('fk_id').AsInteger);
//    oq.Execute;
//    frmMain.os.Commit;
//  finally
//    oq.Free;
//  end;
end;

procedure TfrmLabNaprav.InsertKonsultUslug(nNazid: Integer);
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' merge into asu.tkonsult_uslug using dual on (fk_nazid = :pfk_nazid) '+#13+
                    ' when not matched then '+#13+
                    '   insert(fk_nazid) values(:pfk_nazid) ';
    ods.DeclareAndSet('pfk_nazid', otInteger, nNazid);
    ods.Open;
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select count(*) as cnt from asu.tambtalon_naz where fk_nazid = :pfk_nazid ';
    ods.DeclareAndSet('pfk_nazid', otInteger, nNazid);
    ods.Open;
    if ods.FieldByName('cnt').AsInteger = 0 then
      begin
        oq := TOracleQuery.Create(nil);
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into asu.tambtalon(fk_sotrid, fd_opened, fk_ambid, fn_sos, fk_otdelid) '+#13+
                         ' values(:pfk_sotrid, sysdate, :pfk_ambid, 0, :pfk_otdelid) '+#13+
                         ' returning fk_id into :pfk_id ';
          oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
          oq.DeclareAndSet('pfk_ambid', otInteger, pPACID);
          oq.DeclareAndSet('pfk_otdelid', otInteger, pOTDELID);
          oq.DeclareVariable('pfk_id', otInteger);
          oq.Execute;
          idTalon := oq.GetVariable('pfk_id');
          oq.DeleteVariables;
          oq.SQL.Text := ' insert into asu.tambtalon_naz(fk_talonid, fk_ambid, fk_nazid) '+#13+
                         ' values(:pfk_talonid, :pfk_ambid, :pfk_nazid) ';
          oq.DeclareAndSet('pfk_talonid', otInteger, idTalon);
          oq.DeclareAndSet('pfk_ambid', otInteger, pPACID);
          oq.DeclareAndSet('pfk_nazid', otInteger, nNazid);
          oq.Execute;
        finally
          oq.Free;
        end;
      end;
    frmMain.os.Commit;
  finally
    ods.Free;
  end;
end;

procedure TfrmLabNaprav.VVIDSNIMOKPropertiesChange(Sender: TObject);
//var ods : TOracleDataSet;
begin
//  ods := TOracleDataSet.Create(nil);
//  try
//    ods.Session := frmMain.os;
//    ods.Cursor := crSQLWait;
//    ods.SQL.Text := ' SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''SNIMOK_CIFRA'' ';
//    ods.Open;
//    if VVIDSNIMOK.DataBinding.Field.Value = ods.FieldByName('FK_ID').AsInteger then
//      begin
//        odsTypePlenka.Close;
//        odsTypePlenka.SetVariable('PFC_SYNONIM', 'XRAY_VIDPLENKI_CIFRA');
//        odsTypePlenka.Open;
//        cxColor.Visible := FALSE;
//      end else
//      begin
//        odsTypePlenka.Close;
//        odsTypePlenka.SetVariable('PFC_SYNONIM', 'XRAY_VIDPLENKI_PLENKA');
//        odsTypePlenka.Open;
//        cxColor.Visible := TRUE;
//      end;
//  finally
//    ods.Free;
//  end;
end;

end.
