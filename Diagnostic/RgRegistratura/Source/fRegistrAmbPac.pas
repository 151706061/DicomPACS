unit fRegistrAmbPac;

interface                                         

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, RVScroll, RichView, RVEdit, ExtCtrls, ImgList, ActnList,
  Oracle, StdCtrls, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxRadioGroup, cxGroupBox,
  cxGraphics, OracleData, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  DB, cxSpinEdit, cxCheckGroup, cxCustomData, cxStyles, cxTL,
  cxInplaceContainer, cxTLData, cxDBTL, cxCurrencyEdit, jvDBUtils, cxCheckBox,
  frxClass, cxTimeEdit, DateUtils, cxMemo, cxFilter, cxData, cxDataStorage,
  cxDBData, cxButtonEdit, Buttons, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  Menus, cxLookAndFeelPainters, cxButtons, cxBarEditItem, cxImageComboBox;

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

  TfrmRegistrAmbPac = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    al: TActionList;
    bbSave: TdxBarButton;
    aSave: TAction;
    bbCancel: TdxBarButton;
    aCancel: TAction;
    odsVidOplat: TOracleDataSet;
    dsVidOplat: TDataSource;
    dsUrgent: TDataSource;
    odsUrgent: TOracleDataSet;
    dsNadbavka: TDataSource;
    odsNadbavka: TOracleDataSet;
    odsRegPrin: TOracleDataSet;
    dsRegPrin: TDataSource;
    dsKorennoe: TDataSource;
    odsKorennoe: TOracleDataSet;
    odsTarget: TOracleDataSet;
    dsTarget: TDataSource;
    odsVidDoc: TOracleDataSet;
    odsRgLaborant: TOracleDataSet;
    dsRgLaborant: TDataSource;
    odsCifraArchive: TOracleDataSet;
    dsCifraArchive: TDataSource;
    dsOtdelVydano: TDataSource;
    odsOtdelVydano: TOracleDataSet;
    bbPrint: TdxBarButton;
    aPrint: TAction;
    frxReport1: TfrxReport;
    bbHistory: TdxBarButton;
    aHistory: TAction;
    odsKemNapravlen: TOracleDataSet;
    dsKemNapravlen: TDataSource;
    odsListNaz: TOracleDataSet;
    dsListNaz: TDataSource;
    odsListNazROWNUM: TFloatField;
    odsListNazFK_DOCID: TFloatField;
    odsListNazFK_NAZSOSID: TFloatField;
    odsListNazFK_ID: TFloatField;
    odsListNazFC_NAME: TStringField;
    odsListNazFK_SMID: TFloatField;
    odsListNazFC_TYPE: TStringField;
    odsListNazTIME: TFloatField;
    odsCompanyName: TOracleDataSet;
    dsCompanyName: TDataSource;
    odsRegistrator: TOracleDataSet;
    dsRegistrator: TDataSource;
    aZakl: TAction;
    odsListNazFK_VRACHID: TFloatField;
    odsListNazFK_NAZTYPEID: TFloatField;
    aAgree: TAction;
    bbAgree: TdxBarButton;
    odsListNazKONSID: TFloatField;
    cxLabel1: TcxLabel;
    cxFam: TcxTextEdit;
    cxLabel20: TcxLabel;
    cxName: TcxTextEdit;
    cxLabel21: TcxLabel;
    cxOtch: TcxTextEdit;
    cxLabel22: TcxLabel;
    cxLabel2: TcxLabel;
    cxdeRojd: TcxDateEdit;
    bVozrast: TcxButton;
    cxLabel3: TcxLabel;
    cxAge: TcxLabel;
    cxLabel16: TcxLabel;
    cxMale: TcxRadioButton;
    cxFemale: TcxRadioButton;
    cxLabel4: TcxLabel;
    cxLabel7: TcxLabel;
    lbCompany: TcxLabel;
    cxKorennoe: TcxLookupComboBox;
    cxVidOplat: TcxLookupComboBox;
    cxCompDogovor: TcxLookupComboBox;
    cxLabel15: TcxLabel;
    cxNum: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxProjivaet: TcxLookupComboBox;
    cxLabel6: TcxLabel;
    cxAddress: TMemo;
    cxOnPhone: TcxCheckBox;
    cxlKontaktPhone: TcxLabel;
    cxTelefon: TcxTextEdit;
    cxLabel8: TcxLabel;
    cxKem: TcxPopupEdit;
    cxLabel9: TcxLabel;
    cxVrach: TcxTextEdit;
    cxLabel19: TcxLabel;
    cxDS: TcxMemo;
    paMetodics: TPanel;
    cxGrListNaz: TcxGrid;
    TVListNaz: TcxGridDBTableView;
    VROWNUM: TcxGridDBColumn;
    VNAMEISSL: TcxGridDBColumn;
    VTIME: TcxGridDBColumn;
    cxGrListNazLevel1: TcxGridLevel;
    cxLabel11: TcxLabel;
    cxUrgent: TcxLookupComboBox;
    cxLabel12: TcxLabel;
    cxNadbavka: TcxLookupComboBox;
    cxLabel13: TcxLabel;
    cxTarget: TcxLookupComboBox;
    cxCheckGroup1: TcxCheckGroup;
    cxLabel27: TcxLabel;
    cxNumDisk: TcxTextEdit;
    cxLabel28: TcxLabel;
    cxNumKorob: TcxTextEdit;
    cxLabel29: TcxLabel;
    cxCifraArchive: TcxLookupComboBox;
    cxDez: TcxCheckBox;
    cxLbDays: TcxLabel;
    cxCheckGroup2: TcxCheckGroup;
    cxLabel25: TcxLabel;
    cxKolvoVidano: TcxSpinEdit;
    cxLabel: TcxLabel;
    cxOtdelVydano: TcxLookupComboBox;
    cxLabel26: TcxLabel;
    cxRemark: TcxTextEdit;
    cxLabel30: TcxLabel;
    cxDateVydano: TcxDateEdit;
    cxLabel31: TcxLabel;
    cxDateVozvrat: TcxDateEdit;
    cxLabel14: TcxLabel;
    cxRegistrator: TcxLookupComboBox;
    cxLabel23: TcxLabel;
    cxRgLaborant: TcxLookupComboBox;
    paFilter: TPanel;
    cxKemNapravlen: TcxDBTreeList;
    cxDBTreeListColumn1: TcxDBTreeListColumn;
    Panel2: TPanel;
    cxLabel24: TcxLabel;
    teFilter: TcxTextEdit;
    cxLabel32: TcxLabel;
    cxGra: TcxLookupComboBox;
    cxLabel33: TcxLabel;
    cxStatus: TcxLookupComboBox;
    odsGra: TOracleDataSet;
    dsGra: TDataSource;
    odsStatus: TOracleDataSet;
    dsStatus: TDataSource;
    lbDoza: TcxBarEditItem;
    odsCntOut: TOracleDataSet;
    lbKons: TcxLabel;
    dxBarPopupMenu1: TdxBarPopupMenu;
    bbAgree1: TdxBarButton;
    bbAgreeProc: TdxBarButton;
    aAgreeProc: TAction;
    frAgreeProc: TfrxReport;
    dxBarDockControl2: TdxBarDockControl;
    BMBar2: TdxBar;
    bAdd: TdxBarButton;
    bDel: TdxBarButton;
    dxBarButton3: TdxBarButton;
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
    procedure cxNadbavkaPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxOnPhonePropertiesChange(Sender: TObject);
    procedure cxdeRojdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aPrintExecute(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure aHistoryExecute(Sender: TObject);
    procedure cxKemNapravlenDblClick(Sender: TObject);
    procedure cxKemNapravlenKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxAddressClick(Sender: TObject);
    procedure cxAddressEnter(Sender: TObject);
    procedure odsListNazAfterOpen(DataSet: TDataSet);
    procedure odsListNazBeforeOpen(DataSet: TDataSet);
    procedure odsListNazApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
    procedure bbRefreshClick(Sender: TObject);
    procedure VNAMEISSLPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxVidOplatPropertiesChange(Sender: TObject);
    procedure aZaklExecute(Sender: TObject);
    procedure odsRegistratorBeforeOpen(DataSet: TDataSet);
    procedure odsRgLaborantBeforeOpen(DataSet: TDataSet);
    procedure bVozrastClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TVListNazFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure aAgreeExecute(Sender: TObject);
    procedure teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure teFilterClick(Sender: TObject);
    procedure teFilterEnter(Sender: TObject);
    procedure cxFamKeyPress(Sender: TObject; var Key: Char);
    procedure cxNameKeyPress(Sender: TObject; var Key: Char);
    procedure cxOtchKeyPress(Sender: TObject; var Key: Char);
    procedure aAgreeProcExecute(Sender: TObject);
    procedure frAgreeProcGetValue(const VarName: string; var Value: Variant);
    procedure bAddClick(Sender: TObject);
    procedure bDelClick(Sender: TObject);
  private
//    pSumDoza : Double;
    Date4Talon : TDateTime;
    idTalon : Integer;
//    isAgreePacient : Boolean; //--> включена ли настройка "Согласие пациента" ('-1' - включена, 'другое значение' - выключена)
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
    l_addr_loaded: Boolean; //<--
    Russian : HKL;
    strMetods : string;
    isKonsult : Boolean; // является ли услуга консультативной
    function fGetIB(var nIBIDf, nIBYf: Integer): boolean;
    procedure DoSetEditRights;
    procedure DoBlockPodpisLaborant;
    procedure DoGetAddress;
    procedure DoUpdateAddress(nIDPepl : Integer);
    procedure DoInsertKorennoe(nIDPepl : Integer);
    procedure DoInsertProjivaet(nPACID : Integer);
    procedure DoInsertGra(nIDPepl : Integer);
    procedure DoInsertStatus(nIDPepl : Integer);
    function GetLastTalonID(App_HND: THandle; OS: TORacleSession; pPacID, pSotrID, pTalonID : Integer) : integer;
    procedure InsertKonsultUslug(nNazid : Integer);
    procedure DoUpdateTalon(nIDPAC : Integer);
    procedure DoSumDoza;
    { Private declarations }
  public
    sNUMBERISSL : String;
    IDDOCID : String;
    EDIT_MODE : Boolean;
    pAMBUL, pPACID, pPEPLID, pOTDELID, pTypeDocID, pSMIDID, pNAZID : Integer;
    pDOCOBSLID : Integer;
    nIBID, nIBY : Integer;
    procedure DoShowfrmRegistrAmbPac(nAmbul, nPACID, nPEPLID : Integer; strFIO : String; nOTDELID, nSMIDID : Integer; nNAZID : Integer=0; nNUMBERISSL : String='');
    procedure DoTextTypeAmbul;
    procedure DoTextTypeStac;
    procedure DoTextTypeFIO(strFIO : String);
    function DoCheckParameters : Integer;
    procedure CheckEnabledControls;
    procedure DoTextTypeNaprav;
    procedure DoInsertEditParametersNaz;
    procedure DoTextParametersNaz;
    procedure DoUpdateStatusNaz;
    procedure DoUpdatePacIDNaz(nIDPAC : Integer);
    procedure DoVidOplat;
    procedure DoTarget;
    procedure DoRgLaborant;
    procedure DoDates;
    procedure DoProjivaet;
    procedure DoVrachNapravil;
    procedure DoCompanyDogovor;
		function GetNumber : String;
		procedure DoUrgent;
    procedure DoCheckUslugKonsult;
    procedure DoGraAndStatus;
    { Public declarations }
  end;

var
  frmRegistrAmbPac: TfrmRegistrAmbPac;

implementation

uses fNazRgOne1, fMain, fAllHistory, fProsmotrZakl, fKem;

{$R *.dfm}

procedure TfrmRegistrAmbPac.DoSetEditRights; //!!! не работает - в таблице TPODPISNAZ нет записи для регистратора с статусом = GET_LABVIP 
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
            cxFam.Enabled := (cxOnPhone.Checked) and (pAmbul = 1); // причем здесь проверка на cxOnPhone? разрешается редактировать если записан по телефону
            cxName.Enabled := (cxOnPhone.Checked) and (pAmbul = 1);
            cxOtch.Enabled := (cxOnPhone.Checked) and (pAmbul = 1);
            cxdeRojd.Enabled := (cxOnPhone.Checked) and (pAmbul = 1);
            cxMale.Enabled := (cxOnPhone.Checked) and (pAmbul = 1);
            cxFemale.Enabled := (cxOnPhone.Checked) and (pAmbul = 1);
            cxKorennoe.Enabled := (cxOnPhone.Checked) and (pAmbul = 1);
            cxVidOplat.Enabled := (cxOnPhone.Checked) and (pAmbul = 1);
            cxCompDogovor.Enabled := (cxOnPhone.Checked) and (pAmbul = 1);
            cxProjivaet.Enabled := False;
            cxOnPhone.Enabled := False;
            cxTelefon.Enabled := False;
            cxAddress.Enabled := False;
            cxKem.Enabled := False;
            cxVrach.Enabled := False;
            cxDs.Enabled := False;
            paMetodics.Enabled := False;
            cxUrgent.Enabled := False;
            cxNadbavka.Enabled := False;
            cxTarget.Enabled := False;
          end else
          begin
            cxLbDays.Visible := False;
            cxLbDays.Caption := '';
            cxFam.Enabled := (cxOnPhone.Checked) and (pAmbul=1);
            cxName.Enabled := (cxOnPhone.Checked) and (pAmbul=1);
            cxOtch.Enabled := (cxOnPhone.Checked) and (pAmbul=1);
            cxdeRojd.Enabled := (cxOnPhone.Checked) and (pAmbul=1);
            cxMale.Enabled := (cxOnPhone.Checked) and (pAmbul=1);
            cxFemale.Enabled := (cxOnPhone.Checked) and (pAmbul=1);
            cxKorennoe.Enabled := True;
            cxVidOplat.Enabled := True;
            cxCompDogovor.Enabled := True;
            cxProjivaet.Enabled := True;
            cxOnPhone.Enabled := True;
            cxTelefon.Enabled := True;
            cxAddress.Enabled := True;
            cxKem.Enabled := True;
            cxVrach.Enabled := True;
            cxDs.Enabled := True;
            cxUrgent.Enabled := True;
            cxNadbavka.Enabled := True;
            cxTarget.Enabled := True;
            paMetodics.Enabled := True;
            cxNumDisk.Enabled := True;
            cxNumKorob.Enabled := True;
            cxCifraArchive.Enabled := True;
          end;
      finally
        ods.Free;
      end;
    end;
    end;
end;

procedure TfrmRegistrAmbPac.DoShowfrmRegistrAmbPac(nAMBUL, nPACID, nPEPLID : Integer; strFIO : String; nOTDELID, nSMIDID : Integer; nNAZID : Integer; nNUMBERISSL : String);
var ods : TOracleDataSet;
begin
  try
    Screen.Cursor := crSQLWait;
    bVozrast.Visible := cxdeRojd.Enabled;
    pAMBUL := nAMBUL;
    pPACID := nPACID;
    pPEPLID := nPEPLID;
    pOTDELID := nOTDELID;
    pSMIDID := nSMIDID;
    pNAZID := nNAZID;
    sNUMBERISSL := nNUMBERISSL;
    if odsListNaz.Active = FALSE then
      odsListNaz.Open;
    if pPACID = 0 then
      begin
        ods := TOracleDataSet.Create(nil);
        try
          ods.Session := frmMain.os;
          ods.SQL.Text := ' SELECT TUSLVID.FK_ID '+#13+
                          '   FROM asu.TUSLVID, asu.TOTDEL_TYPEDOC '+#13+
                          '  WHERE FL_DEFAULT = 1 '+#13+
               	          '    AND TOTDEL_TYPEDOC.FK_TYPEDOC=TUSLVID.FK_ID '+#13+
              	          '    AND TOTDEL_TYPEDOC.FK_OTDELID = :POTDELID AND ROWNUM =1 ';
          ods.DeclareAndSet('POTDELID', otInteger, pOTDELID);
          ods.Open;
          pTypeDocID := ods.FieldByName('FK_ID').AsInteger;
        finally
          ods.Free;
        end;
      end else
      begin
        if odsVidDoc.Active = FALSE then
          odsVidDoc.Open;
        pTypeDocID := odsVidDoc.FieldByName('FK_VIDDOCID').AsInteger;
      end;

    case pAMBUL of
    0: DoTextTypeStac;  // стационарный пациент
    1: DoTextTypeAmbul; // амбулаторный пациент
    end;
    if pPEPLID <> 0 then
      DoGraAndStatus;
    DoVidOplat;
    DoProjivaet;
    DoTarget;
    DoDates;
    DoRgLaborant;
    DoVrachNapravil;
    DoCompanyDogovor;
    DoCheckUslugKonsult; // проверка на то является ли услуга консультативной и определение идешника талона
    DoSumDoza;
//------------------------------------------------------------------------------
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
    DoSetEditRights;
    aAgree.Visible := pPACID <> 0; // если нажали кнопку "Новый" то кнопку "Согласие" не показываем
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmRegistrAmbPac.DoSumDoza;
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
                        '    and t2.fd_run >= add_months(sysdate, -12) '+#13+
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

procedure TfrmRegistrAmbPac.DoTextTypeAmbul;
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

procedure TfrmRegistrAmbPac.aSaveExecute(Sender: TObject);
var oqIns, oqEdit : TOracleQuery;
    ods, odsPepl : TOracleDataSet;
    IDPac : Integer;
    idPepl : Integer;
    odsAmb : TOracleDataSet;
    hAgree : Integer;
    LoadAgree : TLoadAgree;
    oq : TOracleQuery;
begin
try
  Screen.Cursor := crSQLWait;
  idPepl := 0;
  cxdeRojd.PostEditValue;
  if DoCheckParameters = 0 then
    exit;
  if EDIT_MODE = TRUE then
    begin
      odsPepl := TOracleDataSet.Create(nil);
      oqEdit := TOracleQuery.Create(nil);  // изменяем параметры существующего пациента
      try
        odsPepl.Session := frmMain.os;     
        odsPepl.SQL.Text := ' select fk_peplid from asu.tambulance where fk_id = :pfk_id ';
        odsPepl.DeclareAndSet('pfk_id', otInteger, pPACID);
        odsPepl.Open;
        oqEdit.Session := frmMain.os;
        oqEdit.SQL.Text := ' BEGIN '+#13+
                           '   update asu.tambulance '+#13+
                           '      set fk_peplid=:pfk_peplid, fc_fam=:pfc_fam, fc_im=:pfc_im, fc_otch=:pfc_otch, fc_phone=:pfc_phone, '+#13+
                           '          fd_rojd=:pfd_rojd, fp_sex=:pfp_sex '+#13+
                           '    where fk_id = :pfk_id; '+#13+
                           '   UPDATE asu.TPEOPLES '+#13+
                           '      SET FC_PHONE=:PFC_PHONE '+#13+
                           '    WHERE FK_ID=:PFK_PEPLID; '+#13+
                           ' END; ';
        oqEdit.DeclareAndSet('pFK_PEPLID', otInteger, odsPepl.FieldByName('fk_peplid').AsInteger);
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
        odsPepl.Free;
        oqEdit.Free;
      end;
    end else
    begin
      ods := TOracleDataSet.Create(nil);  // добавляем нового пациента EDIT_MODE=FALSE
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
            oqIns.Session := frmMain.os; // 1. если такой пипл НЕ существует в базе - ДОБАВЛЯЕМ нового пипла
            oqIns.SQL.Text := ' DECLARE '+#13+
	                            '   nTemp NUMBER; '+#13+
                              ' BEGIN '+#13+
		                          '   INSERT INTO asu.TAMBULANCE(FK_ID) VALUES(:PFK_ID) '+#13+ // инсертим запись в TAMBULANCE
                              '   RETURNING FK_ID INTO :PFK_ID; '+#13+
    		                      '   INSERT INTO TPEOPLES(FC_FAM) VALUES(NULL) '+#13+ // инсертим запись в TPEOPLES
                              '   RETURNING FK_ID INTO :PFK_PEPLID; '+#13+
        	                    '   :NDOCOBSLID:= SET_NEWIBNUM(:PFK_USLVIDID, nTemp); '+#13+
                      		    '   UPDATE asu.TAMBULANCE SET '+#13+
			                        '   FK_IBID = nTemp, '+#13+
			                        '   FK_IBY = TO_CHAR(GET_YEARWORK), '+#13+
			                        '   FK_PEPLID = :PFK_PEPLID, '+#13+
			                        '   FK_DOCOBSL = :NDOCOBSLID '+#13+
	                            '	  WHERE FK_ID = :PFK_ID; '+#13+
                              '   EDIT_AMBULANCE '+#13+
                              '   (0,:pFK_PEPLID,:pFC_FAM,:pFC_IM,:pFC_OTCH,:pFC_ADR,'''',:pFC_PHONE,'''', '+#13+
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
            oqIns.DeclareAndSet('pFC_ADR', otString, cxAddress.Text);
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
          begin                             // 2. если такой пипл УЖЕ существует в базе
            odsAmb := TOracleDataSet.Create(nil);
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
                  oqIns.Session := frmMain.os;   //2.3. на данного пипла нет амбулаторной карты => заводим новую
                  oqIns.SQL.Text := ' DECLARE '+
	                                  '   nTemp NUMBER; '+
                                    ' BEGIN '+
		                                '   INSERT INTO TAMBULANCE(FK_ID) '+
                                    '   VALUES(:PFK_ID) '+
                                    '   RETURNING FK_ID INTO :PFK_ID; '+
        	                          '   :NDOCOBSLID:= SET_NEWIBNUM(:PFK_USLVIDID, nTemp); '+
                		                '   UPDATE TAMBULANCE SET '+
			                              '   FK_IBID = nTemp, '+
			                              '   FK_IBY = TO_CHAR(GET_YEARWORK), '+
			                              '   FK_PEPLID = :PFK_PEPLID, '+
			                              '   FK_DOCOBSL = :NDOCOBSLID '+
	                                  '	  WHERE FK_ID = :PFK_ID; '+
                                    '   EDIT_AMBULANCE '+
                                    '   (0,:pFK_PEPLID,:pFC_FAM,:pFC_IM,:pFC_OTCH,'''','''',:pFC_PHONE,'''', '+
	                                  '   :pFD_ROJD,:pFP_SEX,0,0,0,:pFK_ID,6,0,nTemp,TO_CHAR(GET_YEARWORK), '+
	                                  '   0,:pFK_VRACHID   ); '+
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
//-->> 1. Сохраняем адрес КЛАДР
  if l_addr_loaded then
    begin
      SaveAddrChanges;
      CommitAddrChanges;
    end;
//-->> 2. Апдейтим записи в назначениях, адресе, талоне, если было добавление нового пациента
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
//-->> 3. Сохраняем или заменяем графу "Проживает"
  if pPACID <> 0 then
    begin
      DoInsertProjivaet(pPACID);
    end;
//-->> 4. Сохраняем или изменяем все параметры назначения(-ий) и включаем процедуру блокировки подписи лаборанта
  DoInsertEditParametersNaz;
  DoBlockPodpisLaborant;
//-->> 4,5 Сохраняем или изменяем Гражданство и Социальный статус
  if (idPepl <> 0) or (pPEPLID <> 0) then
    begin
      if idPepl <> 0 then
        begin
          DoInsertGra(idPepl);
          DoInsertStatus(idPepl);
        end else
        begin
          DoInsertGra(pPEPLID);
          DoInsertStatus(pPEPLID);
        end;
    end;
//-->> 5. Вызов длл "Согласие пациента"
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
      if isKonsult = False then
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
                oq.SQL.Text := ' INSERT INTO ASU.TAMBTALON_NAZ(FK_TALONID, FK_AMBID, FK_NAZID) '+#13+
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
  ModalResult := MrOK;
finally
  Screen.Cursor := crDefault;
end;
end;

procedure TfrmRegistrAmbPac.aZaklExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  Application.CreateForm(TfrmProsmotrZakl, frmProsmotrZakl);
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT (SELECT DECODE(MAX(FC_CHAR), NULL, ''Нет заключения'', MAX(FC_CHAR)) '+#13+
                    '           FROM asu.TIB '+#13+
                    '          WHERE FK_PACID = :PFK_ID '+#13+
                    '            AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME'')) AS ZAKL, '+#13+
                    '        (SELECT MAX(FC_CHAR) '+#13+
                    '           FROM asu.TIB '+#13+
                    '          WHERE FK_PACID = :PFK_ID '+#13+
                    '            AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL'')) AS NUMBER_ISSL '+#13+
                    '   FROM DUAL ';
    ods.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
    ods.Open;
    frmProsmotrZakl.rowZakl.Properties.Value := ods.FieldByName('ZAKL').AsString;
    frmProsmotrZakl.rowNum.Properties.Value := ods.FieldByName('NUMBER_ISSL').AsString;
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

procedure TfrmRegistrAmbPac.aAgreeExecute(Sender: TObject);
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

procedure TfrmRegistrAmbPac.aAgreeProcExecute(Sender: TObject);
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

procedure TfrmRegistrAmbPac.aCancelExecute(Sender: TObject);
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
        oq.SQL.Text := ' DELETE FROM ASU.TDOCOBSL WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('PFK_ID', otInteger, pDOCOBSLID);
        oq.Execute;
        frmMain.os.Commit;
      finally
        oq.Free;
      end;
    end;

//  if (frmMain.IDNaz <> 0) and (pNAZID = 0) then
//    begin
//      oqDelNaz := TOracleQuery.Create(nil);
//      try
//        oqDelNaz.Session := frmMain.os;
//        oqDelNaz.Cursor := crSQLWait;
//        oqDelNaz.SQL.Text := ' DELETE FROM TNAZIS WHERE FK_ID = :PFK_ID ';
//        oqDelNaz.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
//        oqDelNaz.Execute;
//        frmMain.os.Commit;
//      finally
//        oqDelNaz.Free;
//      end;
//    end;

  ModalResult := MrCancel;
end;

procedure TfrmRegistrAmbPac.cxKorennoePropertiesChange(Sender: TObject);
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
                    '   FROM asu.TIB I '+#13+
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
        oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                       ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate) ';
        oq.DeclareAndSet('pfk_pacid', otInteger, pPEPLID);
        oq.DeclareAndSet('pfk_smid', otInteger, cxKorennoe.EditValue);
//        oq.DeclareAndSet('pfk_smeditid', otInteger, cxKorennoe.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
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
        oq.SQL.Text := ' update asu.tib set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_smid', otInteger, cxKorennoe.EditValue);
        oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        oq.DeclareAndSet('pfk_id', otInteger, ods.FieldByName('nTmp').AsInteger);
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

procedure TfrmRegistrAmbPac.cxVidOplatPropertiesChange(Sender: TObject);
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

procedure TfrmRegistrAmbPac.DoTextTypeFIO(strFIO: String);
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
  cxFam.Text := trim(sFam);
  cxName.Text := sIm;
  cxOtch.Text := sOtch;
end;

procedure TfrmRegistrAmbPac.cxFamClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmRegistrAmbPac.cxFamEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmRegistrAmbPac.cxFamKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '"', '№', ';', ':', '?', '=', '\', '/', '.', ',', '>', '<', '|', '[', ']', '{', '}'] then
    Key := #0;
end;

procedure TfrmRegistrAmbPac.cxNameClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmRegistrAmbPac.cxNameEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmRegistrAmbPac.cxNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '"', '№', ';', ':', '?', '=', '\', '/', '.', ',', '>', '<', '|', '[', ']', '{', '}'] then
    Key := #0;
end;

procedure TfrmRegistrAmbPac.cxOtchClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmRegistrAmbPac.cxOtchEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmRegistrAmbPac.cxOtchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '"', '№', ';', ':', '?', '=', '\', '/', '.', ',', '>', '<', '|', '[', ']', '{', '}'] then
    Key := #0;
end;

procedure TfrmRegistrAmbPac.cxDSClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmRegistrAmbPac.cxDSEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmRegistrAmbPac.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
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

procedure TfrmRegistrAmbPac.FormCreate(Sender: TObject);
begin
  idTalon := 0;
  russian:=LoadKeyboardLayout('00000419', 0);
//-->> 1. "Заряжаем датасеты"
  if odsKemNapravlen.Active = False then
    odsKemNapravlen.Active := True;
  if odsRegPrin.Active = False then
    odsRegPrin.Active := True;
  if odsKorennoe.Active = False then
    odsKorennoe.Active := True;
  if odsVidOplat.Active = False then
    odsVidOplat.Active := True;
  if odsCompanyName.Active = False then
    odsCompanyName.Active := True;
  if odsUrgent.Active = False then
    odsUrgent.Active := True;
  if odsNadbavka.Active = False then
    odsNadbavka.Active := True;
  if odsTarget.Active = False then
    odsTarget.Active := True;
  if odsCifraArchive.Active = False then
    odsCifraArchive.Active := True;
  if odsOtdelVydano.Active = False then
    odsOtdelVydano.Active := True;
  if odsRegistrator.Active = False then
    odsRegistrator.Active := True;
  if odsRgLaborant.Active = False then
    odsRgLaborant.Active := True;
  if odsGra.Active = False then
    odsGra.Active := True;
  if odsStatus.Active = False then
    odsStatus.Active := True;
//-->> 2. Настройки
  if frmMain.get_show_agreepac = '-1' then
    bbAgree.Visible := ivAlways
  else
    bbAgree.Visible := ivNever;
end;

procedure TfrmRegistrAmbPac.DoBlockPodpisLaborant;
begin
// !!!
end;

function TfrmRegistrAmbPac.DoCheckParameters : Integer;
var nIBIDf, nIBYf : Integer;
    DateCh : TDateTime;
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
  if pAMBUL = 1 then
    begin
      if cxNum.Text = '' then
        begin
          Application.MessageBox('Вам необходимо указать НОМЕР МЕДИЦИНСКОГО ДОКУМЕНТА пациента!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
          cxNum.SetFocus;
          Result:= 0;
          exit;
        end;

      if fGetIb(nIBIDf, nIBYf) = FALSE then
        begin
          Application.MessageBox('Внимание! Такой НОМЕР ДОКУМЕНТА (амбулаторной карты) уже существует в Базе Данных!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
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

  if (isKonsult = True) and (cxKem.Tag = 0) then
    begin
      Application.MessageBox('Услуга является консультативной, следовательно Вам обязательно нужно указать направившее учреждение!',
                             'Предупреждение !', MB_OK + MB_ICONWARNING);
      cxKem.SetFocus;
      Result := 0;
      exit;
    end;
   
  Result := 1;
end;

procedure TfrmRegistrAmbPac.DoCheckUslugKonsult;
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

procedure TfrmRegistrAmbPac.DoCompanyDogovor;
var ods : TOracleDataSet;
begin
  if cxCompDogovor.Visible = True then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.SQL.Text := ' BEGIN '+#13+
		                    '   SELECT MAX(FK_SMID) INTO :VAL '+#13+
                        '     FROM TIB '+#13+
                        '    WHERE FK_PACID = :PFK_ID '+#13+
                        '      AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_COMPANY_DOGOVOR'')); '+#13+
		                    '   IF :VAL IS NULL THEN '+#13+
		                    '     SELECT MAX(FK_ID) INTO :VAL '+#13+
                        '       FROM TSMID '+#13+
                        '      WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_COMPANY_DOGOVOR'') AND FK_DEFAULT = 1; '+#13+
		                    '   END IF; '+#13+
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

function TfrmRegistrAmbPac.fGetIB(var nIBIDf, nIBYf: Integer): boolean;
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
                fGetIB := False;
                Exit;
            end;
        end;
    try
        nIBID := StrToInt(tIBID);
        nIBY := StrToInt(tIBY);
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

procedure TfrmRegistrAmbPac.odsVidDocBeforeOpen(DataSet: TDataSet);
begin
  odsVidDoc.SetVariable('PFK_ID', pPACID);
end;

procedure TfrmRegistrAmbPac.teFilterClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmRegistrAmbPac.teFilterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmRegistrAmbPac.teFilterKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  odsKemNapravlen.Filtered := False;
  if length(teFilter.Text) > 0 then
    begin
      odsKemNapravlen.Filter := 'fc_upper = ''*' + AnsiUpperCase(teFilter.Text) + '*'' ';
      odsKemNapravlen.Filtered := true;
    end;
end;

procedure TfrmRegistrAmbPac.TVListNazFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  bDel.Enabled := odsListNaz.FieldByName('FK_VRACHID').AsInteger = frmMain.pSOTRID;
end;

procedure TfrmRegistrAmbPac.DoTextTypeStac;
var ods : TOracleDataSet;
begin
  cxKem.Enabled := False;
  cxVrach.Enabled := False;
  CheckEnabledControls;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT COUNT(FK_ID) AS CNT FROM asu.TKARTA WHERE FK_ID=:PFK_ID ';
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
                        '        PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TKARTA.FK_ID) AS PACAGE, '+
                        '        TPEOPLES.FC_PHONE AS PHONE, '+
		                  	'        (SELECT FK_SMID FROM TIB WHERE FK_PACID = :PFK_PEPLID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''KOREN_NASEL''))) AS KOREN '+
                        '   FROM TKARTA, TPEOPLES '+
                        '  WHERE TKARTA.FK_ID=:PFK_ID AND TPEOPLES.FK_ID=:PFK_PEPLID ';
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

procedure TfrmRegistrAmbPac.CheckEnabledControls;
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
//      cxAddress.Enabled := FALSE;
    end;
end;

procedure TfrmRegistrAmbPac.DoTextTypeNaprav;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' BEGIN '+#13+
                    '   SELECT MAX(FC_CHAR) INTO :NAMEDIAG '+#13+
                    '     FROM TIB '+#13+
                    '    WHERE FK_PACID = :pFK_NAZID '+#13+
                    '      AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_DIAGNOZ''); '+#13+
                    '   IF :NAMEDIAG IS NULL THEN '+#13+
                    '     SELECT PKG_LISTS.GET_DIAG_MAIN(TNAZIS.FK_PACID) INTO :NAMEDIAG FROM TNAZIS WHERE FK_ID = :PFK_NAZID; '+#13+
                    '   END IF; '+#13+
                    ' END; ';
    ods.DeclareVariable('NAMEDIAG', otString);
    ods.DeclareAndSet('PFK_NAZID', otInteger, pNAZID);
    ods.Open;
    cxDS.Text := ods.GetVariable('NAMEDIAG');
  finally
    ods.Free;
  end;
end;

procedure TfrmRegistrAmbPac.DoInsertEditParametersNaz;
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
//-->>----------------------------------------------------------------------------
      if cxUrgent.Text <> '' then  //срочность
        begin
          if odsListNaz.FieldByName('FK_NAZTYPEID').AsInteger <> cxUrgent.EditValue then
            begin
              oqNaz.DeleteVariables;
              oqNaz.SQL.Text := ' update asu.tnazis set fk_naztypeid = :pfk_naztypeid where fk_id = :pfk_id ';
              oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
              oqNaz.DeclareAndSet('PFK_NAZTYPEID', otInteger, cxUrgent.EditValue);
              oqNaz.Execute;
              frmMain.os.Commit;
            end;
        end;
//-->>----------------------------------------------------------------------------
      if cxNadbavka.Text <> '' then //надбавка к времени
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+#13+
                            '   Cnt1 NUMBER; '+#13+
                            ' BEGIN '+#13+
                            '   SELECT COUNT(FK_ID) INTO Cnt1 FROM asu.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM asu.TSMID WHERE FC_SYNONIM = ''TIME_NORMA_ISSL'')); '+#13+
                            ' IF Cnt1 > 0 THEN '+#13+
                            '   UPDATE asu.TIB SET FK_SMID=:pFK_SMID1, FK_SMEDITID=:pFK_SMEDITID1, FK_VRACHID=:pFK_VRACHID, fd_date=sysdate '+#13+
                            '    WHERE FK_PACID=:pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER=(SELECT MAX(FK_ID) FROM asu.TSMID WHERE FC_SYNONIM=''TIME_NORMA_ISSL'')); '+#13+
                            ' ELSE '+#13+
                            '   INSERT INTO asu.TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID, FD_DATE) VALUES(:pFK_ID, :pFK_SMID1, :pFK_SMEDITID1, :pFK_VRACHID, SYSDATE); '+#13+
                            ' END IF; '+#13+
                            ' END; ';
          oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
          oqNaz.DeclareAndSet('pFK_SMID1', otInteger, cxNadbavka.EditValue);
          oqNaz.DeclareAndSet('pFK_SMEDITID1', otInteger, cxNadbavka.EditValue);
          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
//-->>----------------------------------------------------------------------------
      if cxTarget.Text <> '' then //цель
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+#13+
                            '   Cnt2 NUMBER; '+#13+
                            ' BEGIN '+#13+
                            '   SELECT COUNT(FK_ID) INTO Cnt2 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''ISSL_TARGET''));'+#13+
                            ' IF Cnt2 > 0 THEN '+#13+
                            '   UPDATE TIB SET FK_SMID=:pFK_SMID2, FK_SMEDITID=:pFK_SMEDITID2, FK_VRACHID=:pFK_VRACHID, fd_date = sysdate WHERE FK_PACID=:pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER=(SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM=''ISSL_TARGET'')); '+#13+
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
//-->>----------------------------------------------------------------------------
      if cxKolvoVidano.Value <> 0 then //кол-во выдано
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+#13+
                            '   nSMID8 NUMBER; '+#13+
                            '   Cnt8 NUMBER; '+#13+
                            ' BEGIN '+#13+
                            '   SELECT COUNT(FK_ID) INTO Cnt8 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOKOMY''); '+#13+
                            ' IF Cnt8 > 0 THEN '+#13+
                            '   UPDATE TIB SET FN_NUM = :pFN_NUM8, FK_VRACHID = :pFK_VRACHID, fd_date = sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOKOMY''); '+#13+
                            ' ELSE '+#13+
                            '   SELECT FK_ID INTO nSMID8 FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOKOMY''; '+#13+
                            '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFN_NUM8, nSMID8, nSMID8, :pFK_VRACHID, sysdate); '+#13+
                            ' END IF; '+#13+
                            ' END; ';
          oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
          oqNaz.DeclareAndSet('pFN_NUM8', otInteger, cxKolvoVidano.Value);
          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
//-->>----------------------------------------------------------------------------
      if cxRemark.Text <> '' then //ФИО, примечания
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+#13+
                            '   nSMID9 NUMBER; '+#13+
                            '   Cnt9 NUMBER; '+#13+
                            ' BEGIN '+#13+
                            '   SELECT COUNT(FK_ID) INTO Cnt9 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_FIO_REMARK''); '+#13+
                            ' IF Cnt9 > 0 THEN '+#13+
                            '   UPDATE TIB SET FC_CHAR = :pFC_CHAR9, FK_VRACHID = :pFK_VRACHID, fd_date = sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_FIO_REMARK''); '+#13+
                            ' ELSE '+#13+
                            '   SELECT FK_ID INTO nSMID9 FROM TSMID WHERE FC_SYNONIM = ''XRAY_FIO_REMARK''; '+#13+
                            '   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :PFC_CHAR9, nSMID9, nSMID9, :pFK_VRACHID, sysdate); '+#13+
                            ' END IF; '+#13+
                            ' END; ';
          oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
          oqNaz.DeclareAndSet('pFC_CHAR9', otString, cxRemark.Text);
          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
//-->>----------------------------------------------------------------------------
      if odsListNaz.FieldByName('TIME').AsFloat <> 0 then //время -2
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+#13+
                            '   Cnt10 NUMBER; '+#13+
                            ' BEGIN '+#13+
                            '   SELECT COUNT(FK_ID) INTO Cnt10 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID = -2 AND FK_SMEDITID = -2; '+#13+
                            ' IF Cnt10 > 0 THEN '+#13+
                            '   UPDATE TIB SET FN_NUM = :pFN_NUM10, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID = -2 AND FK_SMEDITID = -2; '+#13+
                            ' ELSE '+#13+
                            '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFN_NUM10, -2, -2, :pFK_VRACHID, sysdate); '+#13+
                            ' END IF; '+#13+
                            ' END; ';
          oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
          oqNaz.DeclareAndSet('pFN_NUM10', otFloat, odsListNaz.FieldByName('TIME').AsFloat);
          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
//-->>----------------------------------------------------------------------------
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
//-->>----------------------------------------------------------------------------
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
//-->>----------------------------------------------------------------------------
      if cxRgLaborant.Text <> '' then //Лаборант
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+#13+
                            '   nSMID15 NUMBER; '+#13+
                            '   Cnt15 NUMBER; '+#13+
                            ' BEGIN '+#13+
                            '   SELECT COUNT(FK_ID) INTO Cnt15 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''RG_LABORANT''); '+#13+
                            ' IF Cnt15 > 0 THEN '+#13+
                            '   UPDATE TIB SET FN_NUM = :pFN_NUM15, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''RG_LABORANT''); '+#13+
                            ' ELSE '+#13+
                            '   SELECT FK_ID INTO nSMID15 FROM TSMID WHERE FC_SYNONIM = ''RG_LABORANT''; '+#13+
                            '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFN_NUM15, nSMID15, nSMID15, :pFK_VRACHID, sysdate); '+#13+
                            ' END IF; '+#13+
                            ' END; ';
          oqNaz.DeclareAndSet('pFN_NUM15', otInteger, cxRgLaborant.EditValue);
          oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
//-->>----------------------------------------------------------------------------
      if cxRegistrator.Text <> '' then //Регистратор
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+#13+
                            '   nSMID27 NUMBER; '+#13+
                            '   Cnt27 NUMBER; '+#13+
                            ' BEGIN '+#13+
                            '   SELECT COUNT(FK_ID) INTO Cnt27 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''RG_REGISTRATOR''); '+#13+
                            ' IF Cnt27 > 0 THEN '+#13+
                            '   UPDATE TIB SET FN_NUM = :pFN_NUM27, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''RG_REGISTRATOR''); '+#13+
                            ' ELSE '+#13+
                            '   SELECT FK_ID INTO nSMID27 FROM TSMID WHERE FC_SYNONIM = ''RG_REGISTRATOR''; '+#13+
                            '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFN_NUM27, nSMID27, nSMID27, :pFK_VRACHID, sysdate); '+#13+
                            ' END IF; '+#13+
                            ' END; ';
          oqNaz.DeclareAndSet('pFN_NUM27', otInteger, cxRegistrator.EditValue);
          oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
//-->>----------------------------------------------------------------------------
      if (cxVrach.Text <> '') and (pAMBUL = 1) then //Направивший врач
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+#13+
                            '   nSMID25 NUMBER; '+#13+
                            '   Cnt25 NUMBER; '+#13+
                            ' BEGIN '+#13+
                            '   SELECT COUNT(FK_ID) INTO Cnt25 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''VRACH_NAPRAVIL''); '+#13+
                            ' IF Cnt25 > 0 THEN '+#13+
                            '   UPDATE TIB SET FC_CHAR = :pFC_CHAR25, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''VRACH_NAPRAVIL''); '+#13+
                            ' ELSE '+#13+
                            '   SELECT FK_ID INTO nSMID25 FROM TSMID WHERE FC_SYNONIM = ''VRACH_NAPRAVIL''; '+#13+
                            '   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFC_CHAR25, nSMID25, nSMID25, :pFK_VRACHID, sysdate); '+#13+
                            ' END IF; '+#13+
                            ' END; ';
          oqNaz.DeclareAndSet('pFC_CHAR25', otString, cxVrach.Text);
          oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
//-->>----------------------------------------------------------------------------
      if cxNumDisk.Text <> '' then //Номер диска
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+#13+
                            '   nSMID16 NUMBER; '+#13+
                            '   Cnt16 NUMBER; '+#13+
                            ' BEGIN '+#13+
                            '   SELECT COUNT(FK_ID) INTO Cnt16 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''NUMBER_DISK''); '+#13+
                            ' IF Cnt16 > 0 THEN '+#13+
                            '   UPDATE TIB SET FC_CHAR = :pFC_CHAR16, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''NUMBER_DISK''); '+#13+
                            ' ELSE '+#13+
                            '   SELECT FK_ID INTO nSMID16 FROM TSMID WHERE FC_SYNONIM = ''NUMBER_DISK''; '+#13+
                            '   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :PFC_CHAR16, nSMID16, nSMID16, :pFK_VRACHID, sysdate); '+#13+
                            ' END IF; '+#13+
                            ' END; ';
          oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
          oqNaz.DeclareAndSet('pFC_CHAR16', otString, cxNumDisk.Text);
          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
//-->>----------------------------------------------------------------------------
      if cxCifraArchive.Text <> '' then //цифровой архив
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+#13+
                            '   Cnt17 NUMBER; '+#13+
                            ' BEGIN '+#13+
                            '   SELECT COUNT(FK_ID) INTO Cnt17 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''CIFRA_ARCHIVE'')); '+#13+
                            ' IF Cnt17 > 0 THEN '+#13+
                            '   UPDATE TIB SET FK_SMID=:pFK_SMID17, FK_SMEDITID=:pFK_SMEDITID17, FK_VRACHID=:pFK_VRACHID, fd_date=sysdate WHERE FK_PACID=:pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER=(SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM=''CIFRA_ARCHIVE'')); '+#13+
                            ' ELSE '+#13+
                            '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFK_SMID17, :pFK_SMEDITID17, :pFK_VRACHID, sysdate); '+#13+
                            ' END IF; '+#13+
                            ' END; ';
          oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
          oqNaz.DeclareAndSet('pFK_SMID17', otInteger, cxCifraArchive.EditValue);
          oqNaz.DeclareAndSet('pFK_SMEDITID17', otInteger, cxCifraArchive.EditValue);
          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
//-->>----------------------------------------------------------------------------
        if cxDateVydano.Text <> '' then //дата выдачи
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+#13+
                              '   nSMID18 NUMBER; '+#13+
                              '   Cnt18 NUMBER; '+#13+
                              ' BEGIN '+#13+
                              '   SELECT COUNT(FK_ID) INTO Cnt18 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''DATE_VYDANO''); '+#13+
                              ' IF Cnt18 > 0 THEN '+#13+
                              '   UPDATE TIB SET FD_DATE = :pFD_DATE18, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''DATE_VYDANO''); '+#13+
                              ' ELSE '+#13+
                              '   SELECT FK_ID INTO nSMID18 FROM TSMID WHERE FC_SYNONIM = ''DATE_VYDANO''; '+#13+
                              '   INSERT INTO TIB(FK_PACID, FD_DATE, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :PFD_DATE18, nSMID18, nSMID18, :pFK_VRACHID); '+#13+
                              ' END IF; '+#13+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFD_DATE18', otDate, cxDateVydano.Date);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
//-->>----------------------------------------------------------------------------
        if cxDateVozvrat.Text <> '' then //дата возврата
          begin
            oqNaz.DeleteVariables;
            oqNaz.SQL.Text := ' DECLARE '+#13+
                              '   nSMID19 NUMBER; '+#13+
                              '   Cnt19 NUMBER; '+#13+
                              ' BEGIN '+#13+
                              '   SELECT COUNT(FK_ID) INTO Cnt19 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''DATE_VOZVRAT''); '+#13+
                              ' IF Cnt19 > 0 THEN '+#13+
                              '   UPDATE TIB SET FD_DATE = :pFD_DATE19, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''DATE_VOZVRAT''); '+#13+
                              ' ELSE '+#13+
                              '   SELECT FK_ID INTO nSMID19 FROM TSMID WHERE FC_SYNONIM = ''DATE_VOZVRAT''; '+#13+
                              '   INSERT INTO TIB(FK_PACID, FD_DATE, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :PFD_DATE19, nSMID19, nSMID19, :pFK_VRACHID); '+#13+
                              ' END IF; '+#13+
                              ' END; ';
            oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
            oqNaz.DeclareAndSet('pFD_DATE19', otDate, cxDateVozvrat.Date);
            oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
            oqNaz.Execute;
            frmMain.os.Commit;
          end;
//-->>----------------------------------------------------------------------------
      if cxOtdelVydano.Text <> '' then //Отделение
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+#13+
                            '   nSMID20 NUMBER; '+#13+
                            '   Cnt20 NUMBER; '+#13+
                            ' BEGIN '+#13+
                            '   SELECT COUNT(FK_ID) INTO Cnt20 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''OTDEL_VYDANO'')); '+#13+
                            ' IF Cnt20 > 0 THEN '+#13+
                            '   UPDATE TIB SET FK_SMID=:pFK_SMID20, FK_SMEDITID=:pFK_SMEDITID20, FC_CHAR=:pFC_CHAR20, FK_VRACHID=:pFK_VRACHID, fd_date=sysdate WHERE FK_PACID=:pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER ='+' (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''OTDEL_VYDANO'')); '+#13+
                            ' ELSE '+#13+
                            '   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFC_CHAR20, :pFK_SMID20, :pFK_SMEDITID20, :pFK_VRACHID, sysdate); '+#13+
                            ' END IF; '+#13+
                            ' END; ';
          oqNaz.DeclareAndSet('pFK_SMID20', otInteger, cxOtdelVydano.EditValue);
          oqNaz.DeclareAndSet('pFK_SMEDITID20', otInteger, cxOtdelVydano.EditValue);
          oqNaz.DeclareAndSet('pFC_CHAR20', otString, cxOtdelVydano.Text);
          oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
//-->>----------------------------------------------------------------------------
      if cxNumKorob.Text <> '' then //Номер коробки
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+#13+
                            '   nSMID21 NUMBER; '+#13+
                            '   Cnt21 NUMBER; '+#13+
                            ' BEGIN '+#13+
                            '   SELECT COUNT(FK_ID) INTO Cnt21 FROM asu.TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''NUMBER_KOROB''); '+#13+
                            ' IF Cnt21 > 0 THEN '+#13+
                            '   UPDATE asu.TIB SET FC_CHAR = :pFC_CHAR21, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''NUMBER_KOROB''); '+#13+
                            ' ELSE '+#13+
                            '   SELECT FK_ID INTO nSMID21 FROM TSMID WHERE FC_SYNONIM = ''NUMBER_KOROB''; '+#13+
                            '   INSERT INTO asu.TIB(FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :PFC_CHAR21, nSMID21, nSMID21, :pFK_VRACHID, sysdate); '+#13+
                            ' END IF; '+#13+
                            ' END; ';
          oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
          oqNaz.DeclareAndSet('pFC_CHAR21', otString, cxNumKorob.Text);
          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
//-->>----------------------------------------------------------------------------
      if (cxKem.Text <> '') and (pAMBUL = 1) then //Кем направлен // !!! зачем лишний раз апдейтить запись если она не изменилась и уже есть в базе данных !!!!!!!
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
                            '      SET FK_SMID = :pFK_SMID23, FC_CHAR = :pFC_CHAR, FK_VRACHID =:pFK_VRACHID, fd_date=sysdate '+#13+
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
//-->>----------------------------------------------------------------------------
      if cxVidOplat.Text <> '' then //способ оплаты
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+#13+
                            '   Cnt24 NUMBER; '+#13+
                            ' BEGIN '+#13+
                            '   SELECT COUNT(FK_ID) INTO Cnt24 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''AMBTALON_OPL'')); '+#13+
                            ' IF Cnt24 > 0 THEN '+#13+
                            '   UPDATE TIB SET FK_SMID=:pFK_SMID24, FK_SMEDITID=:pFK_SMEDITID24, FK_VRACHID=:pFK_VRACHID, fd_date=sysdate WHERE FK_PACID=:pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER=(SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM=''AMBTALON_OPL'')); '+#13+
                            ' ELSE '+#13+
                            '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFK_SMID24, :pFK_SMEDITID24, :pFK_VRACHID, sysdate); '+#13+
                            ' END IF; '+#13+
                            ' END; ';
          oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
          oqNaz.DeclareAndSet('pFK_SMID24', otInteger, cxVidOplat.EditValue);
          oqNaz.DeclareAndSet('pFK_SMEDITID24', otInteger, cxVidOplat.EditValue);
          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
//-->>----------------------------------------------------------------------------
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
        end;
//-->>----------------------------------------------------------------------------
      if cxDS.Text <> '' then //Диагноз
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+#13+
                            '   nSMID25 NUMBER; '+#13+
                            '   Cnt25 NUMBER; '+#13+
                            ' BEGIN '+#13+
                            '   SELECT COUNT(FK_ID) INTO Cnt25 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_DIAGNOZ''); '+#13+
                            ' IF Cnt25 > 0 THEN '+#13+
                            '   UPDATE TIB SET FC_CHAR = :pFC_CHAR25, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_DIAGNOZ''); '+#13+
                            ' ELSE '+#13+
                            '   SELECT FK_ID INTO nSMID25 FROM TSMID WHERE FC_SYNONIM = ''XRAY_DIAGNOZ''; '+#13+
                            '   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :PFC_CHAR25, nSMID25, nSMID25, :pFK_VRACHID, sysdate); '+#13+
                            ' END IF; '+#13+
                            ' END; ';
          oqNaz.DeclareAndSet('PFK_ID', otInteger, odsListNaz.FieldByName('FK_ID').AsInteger);
          oqNaz.DeclareAndSet('pFC_CHAR25', otString, cxDS.Text);
          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
//-->>----------------------------------------------------------------------------
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
                                '   UPDATE TIB SET FK_SMID=:pFK_SMID26, FK_SMEDITID=:pFK_SMEDITID26, FK_VRACHID=:pFK_VRACHID, fd_date=sysdate WHERE FK_PACID=:pFK_ID AND FK_SMID IN '+'(SELECT FK_ID FROM TSMID WHERE FK_OWNER=(SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM=''XRAY_COMPANY_DOGOVOR'')); '+#13+
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
    finally
      oqNaz.Free;
    end;
  end;
  odsListNaz.Next;                       
  end;  
end;

procedure TfrmRegistrAmbPac.DoInsertGra(nIDPepl: Integer);
var ods : TOracleDataSet;
begin
  if cxGra.EditText <> '' then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' merge into asu.tib using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_GRAGZ'')) '+#13+
                        ' when matched then '+#13+
                        '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                        '    where fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_GRAGZ'') '+#13+
                        ' when not matched then '+#13+
                        '   insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                        '   values(:pfk_pacid, :pfk_smid, (select fk_id from asu.tsmid where fc_synonim = ''LD_GRAGZ''), :pfk_vrachid, sysdate) ';
        ods.DeclareAndSet('pfk_pacid', otInteger, nIDPepl);
        ods.DeclareAndSet('pfk_smid', otInteger, cxGra.EditValue);
        ods.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        ods.Open;
        frmMain.os.Commit;
      finally
        ods.Free;
      end;
    end;
end;

procedure TfrmRegistrAmbPac.DoInsertKorennoe(nIDPepl: Integer);
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
if cxKorennoe.EditText <> '' then
  begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT MAX(FK_ID) AS nTmp '+#13+
                    '   FROM asu.TIB I '+#13+
                    '  WHERE FK_PACID = :PFK_PACID '+#13+
                    '    AND FK_SMID IN (SELECT FK_ID '+#13+
                    '                      FROM asu.TSMID '+#13+
                    '                     WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM asu.TSMID WHERE FC_SYNONIM = ''KOREN_NASEL'')) ';
    ods.DeclareAndSet('PFK_PACID', otInteger, nidPepl);
    ods.Open;
    if ods.FieldByName('nTmp').AsInteger = 0 then //проверяем есть ли такая запись на пациента(PEPLID) в TIB
      begin
        oq := TOracleQuery.Create(nil); //если нет, то добавляем новую (INSERT)
        try
          oq.Session := frmMain.os;
          oq.SQL.Text := ' INSERT INTO asu.TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) '+#13+
                         ' VALUES(:pFK_PACID, :pFK_SMID, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pFK_VRACHID, sysdate) ';
          oq.DeclareAndSet('pFK_PACID', otInteger, nidPepl);
          oq.DeclareAndSet('pFK_SMID', otInteger, cxKorennoe.EditValue);
//          oq.DeclareAndSet('pFK_SMEDITID', otInteger, cxKorennoe.EditValue);
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
          oq.SQL.Text := ' UPDATE asu.TIB SET FK_SMID = :pFK_SMID, fk_vrachid=:pfk_vrachid, fd_date=sysdate WHERE FK_ID = :pFK_ID ';
          oq.DeclareAndSet('pFK_SMID', otInteger, cxKorennoe.EditValue);
          oq.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
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

procedure TfrmRegistrAmbPac.DoTextParametersNaz;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT FK_NAZTYPEID, FD_RUN, FK_ISPOLID, GET_VRACHFCOTDEL(FK_VRACHID) AS OTDELSTAC, '+#13+
                    '       (SELECT MAX(FK_SMID) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''TIME_NORMA_ISSL''))) AS NADBAVKA, '+#13+
                    '       (SELECT MAX(DECODE(FC_CHAR, NULL, ASU.GET_SMIDNAME(TIB.FK_SMID), FC_CHAR)) '+#13+
                    '          FROM TIB '+#13+
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
                    '       (SELECT MAX(FN_NUM) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOKOMY'')) AS KOLVOKOMY, '+#13+
                    '       (SELECT MAX(FC_CHAR) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_FIO_REMARK'')) AS FIO_REMARK, '+#13+
                    '       (SELECT MAX(FN_NUM) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''ZAPISAN_ONPHONE'')) AS ON_PHONE, '+#13+
                    '       (SELECT count(*) FROM asu.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''DEZURSTVO'')) AS DEZ, '+#13+
                    '       (SELECT MAX(FC_CHAR) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''NUMBER_DISK'')) AS NUMBER_DISK, '+#13+
                    '       (SELECT MAX(FK_SMID) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''CIFRA_ARCHIVE''))) AS CIFRA_ARCHIVE, '+#13+
                    '       (SELECT MAX(FK_SMID) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTDEL_VYDANO''))) AS OTDEL_VYDANO, '+#13+
                    '       (SELECT MAX(FC_CHAR) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''NUMBER_KOROB'')) AS NUMBER_KOROB '+#13+
                    '   FROM asu.TNAZIS WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.Open;
    cxUrgent.EditValue := ods.FieldByName('FK_NAZTYPEID').AsInteger;
    cxNadbavka.Properties.OnChange := nil;
    cxNadbavka.EditValue := ods.FieldByName('NADBAVKA').AsInteger;
    cxNadbavka.Properties.OnChange := cxNadbavkaPropertiesChange;
    if pAMBUL = 0 then
      begin
        cxKem.Text := ods.FieldByName('OTDELSTAC').AsString;
      end else
      begin
        cxKem.Text := ods.FieldByName('KEMNAPRAVLEN').AsString;
        cxKem.Tag := ods.FieldByName('ID_KEMNAPRAVLEN').AsInteger;
        odsKemNapravlen.Locate('FK_ID', ods.FieldByName('ID_KEMNAPRAVLEN').AsInteger, []);
      end;
    cxKolvoVidano.Value := ods.FieldByName('KOLVOKOMY').AsInteger;
    cxRemark.Text := ods.FieldByName('FIO_REMARK').AsString;
    if ods.FieldByName('ON_PHONE').AsInteger = -1 then
      cxOnPhone.Checked := TRUE
    else
      cxOnPhone.Checked := FALSE;
    cxDez.Checked := ods.FieldByName('DEZ').AsInteger > 0;
//    if ods.FieldByName('DEZ').AsInteger = -1 then
//      cxDez.Checked := TRUE
//    else
//      cxDez.Checked := FALSE;
    cxNumDisk.Text := ods.FieldByName('NUMBER_DISK').AsString;
    cxCifraArchive.EditValue := ods.FieldByName('CIFRA_ARCHIVE').AsInteger;
    cxOtdelVydano.EditValue := ods.FieldByName('OTDEL_VYDANO').AsInteger;
    cxNumKorob.Text := ods.FieldByName('NUMBER_KOROB').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmRegistrAmbPac.cxNadbavkaPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
    defTime : Extended;
    sSyn : String;
begin
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
        ods.SQL.Text := ' SELECT FC_SYNONIM FROM TSMID WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, cxNadbavka.EditValue);
        ods.Open;
        sSyn := ods.FieldByName('FC_SYNONIM').AsString;
        ods.Close;
        ods.DeleteVariables;
        ods.SQL.Text := ' SELECT FC_TIME FROM TSMID WHERE FK_ID = (SELECT FK_SMID FROM TNAZIS WHERE FK_ID = :PFK_ID) ';
        if frmMain.IDNaz = 0 then
          ods.DeclareAndSet('PFK_ID', otInteger, pNAZID)
        else
          ods.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
        ods.Open;
        if ods.RecordCount > 0 then
          if ods.FieldByName('FC_TIME').AsString = '' then //!!! происходит наращивание
            defTime := odsListNaz.FieldByName('TIME').AsFloat
          else
          defTime := StrToFloat(ods.FieldByName('FC_TIME').AsString);
        if sSyn <> 'TIME_NO' then
          defTime := defTime * 1.2;
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

procedure TfrmRegistrAmbPac.FormShow(Sender: TObject);
begin
  DoGetAddress;
  
  if cxFam.Enabled then
    cxFam.SetFocus;
end;

procedure TfrmRegistrAmbPac.DoUpdateStatusNaz;
var ods, odsPodpisNaz : TOracleDataSet;
     oq, oqPodpisNaz : TOracleQuery;
begin
  if pSMIDID <> 0 then
    begin
      ods := TOracleDataSet.Create(nil);
      odsPodpisNaz := TOracleDataSet.Create(nil);
      oqPodpisNaz := TOracleQuery.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT FN_ACCESS FROM TNAZVRACH WHERE FK_SOTRID = :pFK_SOTRID AND FK_SMID = :pFK_SMID ';
        ods.DeclareAndSet('pFK_SOTRID', otInteger, frmMain.pSOTRID);
        ods.DeclareAndSet('pFK_SMID', otInteger, pSMIDID);
        ods.Open;
        if ods.FieldByName('FN_ACCESS').AsInteger = 4 then
          begin
            oq := TOracleQuery.Create(nil);
            try
              oq.Session := frmMain.os;
              oq.Cursor := crSQLWait;
              oq.SQL.Text := ' UPDATE TNAZIS SET FK_NAZSOSID = GET_LABVIP, FK_ISPOLID=:PFK_ISPOLID WHERE FK_ID = :PFK_ID ';
              oq.DeclareAndSet('PFK_ISPOLID', otInteger, frmMain.pSOTRID);
              if frmMain.IDNaz = 0 then
                oq.DeclareAndSet('PFK_ID', otInteger, pNAZID)
              else
                oq.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
              oq.Execute;
              frmMain.os.Commit;
            finally
              oq.Free;
            end;
          end;
//------------------------------------------------------------------------------
          odsPodpisNaz.Session := frmMain.os;
          odsPodpisNaz.Cursor := crSQLWait;
          odsPodpisNaz.SQL.Text := ' SELECT * FROM TPODPISNAZ WHERE FK_NAZID =:pFK_NAZID AND FK_SOTRID = :pFK_SOTRID ';
          odsPodpisNaz.DeclareAndSet('pFK_NAZID', otInteger, pNAZID);
          odsPodpisNaz.DeclareAndSet('pFK_SOTRID', otInteger, frmMain.pSOTRID);
          odsPodpisNaz.Open;
          if odsPodpisNaz.RecordCount > 0 then
            begin
              oqPodpisNaz.Session := frmMain.os;
              oqPodpisNaz.Cursor := crSQLWait;
{!!! fd_ins}  oqPodpisNaz.SQL.Text := ' UPDATE TPODPISNAZ SET FK_SOS = GET_LABVIP, FD_DATE = SYSDATE, FD_INS = SYSDATE WHERE FK_NAZID =:pFK_NAZID AND FK_SOTRID =:pFK_SOTRID';
              oqPodpisNaz.DeclareAndSet('pFK_SOTRID', otInteger, frmMain.pSOTRID);
              if frmMain.IDNaz = 0 then
                oqPodpisNaz.DeclareAndSet('PFK_NAZID', otInteger, pNAZID)
              else
                oqPodpisNaz.DeclareAndSet('PFK_NAZID', otInteger, frmMain.IDNaz);
              oqPodpisNaz.Execute;
              frmMain.os.Commit;
            end else
            begin
              oqPodpisNaz.Session := frmMain.os;
              oqPodpisNaz.Cursor := crSQLWait;
              oqPodpisNaz.SQL.Text := ' INSERT INTO TPODPISNAZ(FK_NAZID, FK_SOTRID, FK_SOS, FD_DATE, FD_INS) VALUES(:pFK_NAZID, :pFK_SOTRID, GET_LABVIP, SYSDATE, SYSDATE) ';
              oqPodpisNaz.DeclareAndSet('pFK_SOTRID', otInteger, frmMain.pSOTRID);
              if frmMain.IDNaz = 0 then
                oqPodpisNaz.DeclareAndSet('PFK_NAZID', otInteger, pNAZID)
              else
                oqPodpisNaz.DeclareAndSet('PFK_NAZID', otInteger, frmMain.IDNaz);
              oqPodpisNaz.Execute;
              frmMain.os.Commit;
            end;
          RefreshQuery(frmMain.odsList);
//------------------------------------------------------------------------------
      finally
        ods.Free;
        odsPodpisNaz.Free;
        oqPodpisNaz.Free;
      end;
    end;
end;

procedure TfrmRegistrAmbPac.DoUpdateTalon(nIDPAC: Integer);
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

procedure TfrmRegistrAmbPac.DoUrgent;
var ods : TOracleDataSet;
begin
	ods := TOracleDataSet.Create(nil);
	try
		ods.Session := frmMain.os;
		ods.SQL.Text := ' SELECT FK_ID '+
                    '   FROM TSMID '+
                    '  WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''NAZN_TYPES'') AND FK_DEFAULT = 1 ';
		ods.Open;
		cxUrgent.EditValue := ods.FieldByName('FK_ID').AsInteger;
	finally
		ods.Free;
  end;
end;

procedure TfrmRegistrAmbPac.DoUpdatePacIDNaz(nIDPAC: Integer);
var oq : TOracleQuery;
begin
  odsListNaz.First;
  while not odsListNaz.Eof do
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.SQL.Text := ' update asu.tnazis set fk_pacid = :pfk_pacid where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_pacid', otInteger, nIDPAC);
        oq.DeclareAndSet('pfk_id', otInteger, odsListNaz.FieldByName('fk_id').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
      finally
        oq.Free;
      end;
      odsListNaz.Next;
    end;
end;

procedure TfrmRegistrAmbPac.cxOnPhonePropertiesChange(Sender: TObject);
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

procedure TfrmRegistrAmbPac.cxdeRojdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TfrmRegistrAmbPac.aPrintExecute(Sender: TObject);
begin
 frxReport1.ShowReport;
end;

procedure TfrmRegistrAmbPac.frAgreeProcGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'PACFIO' then Value := cxFam.Text+' '+cxName.Text+' '+cxOtch.Text;
  if VarName = 'NUMIB' then Value := cxNum.Text;
  if VarName = 'METODS' then Value := strMetods;
end;

procedure TfrmRegistrAmbPac.frxReport1GetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'RG_LABORANT' then Value := cxRgLaborant.Text;
  if VarName = 'FIO_PAC' then Value := cxFam.Text+' '+cxName.Text+' '+cxOtch.Text;
  if VarName = 'DATE_ROJD' then Value := cxdeRojd.Date;
  if VarName = 'KORENNOE' then Value := cxKorennoe.Text;
  if VarName = 'PROJIVAET' then Value := cxProjivaet.Text;
  if VarName = 'ADDRESS' then Value := cxAddress.Text;
  if VarName = 'PHONE' then Value := cxTelefon.Text;
  if VarName = 'NUMIB' then Value := cxNum.Text;
  if VarName = 'KEM_NAPRAVLEN' then Value := cxKem.Text;
  if VarName = 'NAPRAV_DS' then Value := cxDs.Text;
  if VarName = 'SROCH' then Value := cxUrgent.Text;
  if VarName = 'NADBAVKA_TIME' then Value := cxNadbavka.Text;
  if VarName = 'NAMEISSL' then Value := ''; //!!!
  if VarName = 'AGE' then Value := cxAge.Caption;
  if cxMale.Checked then
    if VarName = 'SEX' then Value := 'МУЖСКОЙ';
  if cxFemale.Checked then
    if VarName = 'SEX' then Value := 'ЖЕНСКИЙ';
  if VarName = 'VID_OPLATA' then Value := cxVidOplat.Text;
  if VarName = 'VRACH_NAPRAVIL' then Value := cxVrach.Text;
  if VarName = 'TARGET' then Value := cxTarget.Text;
end;

procedure TfrmRegistrAmbPac.aHistoryExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmAllHistory, frmAllHistory);
  try
    frmAllHistory.DoShowForm(pPEPLID, cxFam.Text+' '+cxName.Text+' '+cxOtch.Text);
    frmAllHistory.ShowModal;
  finally
    frmAllHistory.Free;
  end;
end;

procedure TfrmRegistrAmbPac.DoVidOplat;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' BEGIN '+#13+
                    '   SELECT MAX(FK_SMID) INTO :VAL '+#13+
                    '     FROM asu.TIB '+#13+
                    '    WHERE FK_PACID = :PFK_PEPLID '+#13+
                    '      AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM asu.TSMID WHERE FC_SYNONIM = ''AMBTALON_OPL'')); '+#13+
                    '   IF :VAL IS NULL THEN '+#13+
            		    '     SELECT MAX(FK_ID) INTO :VAL '+#13+
                    '       FROM TSMID '+#13+
                    '      WHERE FK_OWNER = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''AMBTALON_OPL'') AND FK_DEFAULT = 1; '+#13+
		                '   END IF; '+#13+
                    ' END; ';
    ods.DeclareAndSet('PFK_PEPLID', otInteger, pNAZID);
    ods.DeclareVariable('VAL', otInteger);
    ods.Open;
    cxVidOplat.EditValue := ods.GetVariable('VAL');
  finally
    ods.Free;
  end;
end;

procedure TfrmRegistrAmbPac.DoTarget;
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

procedure TfrmRegistrAmbPac.DoRgLaborant;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT FN_NUM FROM TIB '+
                    '  WHERE FK_PACID = :PFK_ID '+
                    '    AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''RG_LABORANT'') ';
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.Open;
    if ods.FieldByName('FN_NUM').AsInteger > 0 then
      cxRgLaborant.EditValue := ods.FieldByName('FN_NUM').AsInteger
    else
      cxRgLaborant.EditValue := frmMain.pSOTRID;
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT FN_NUM FROM TIB '+
                    '  WHERE FK_PACID = :PFK_ID '+
                    '    AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''RG_REGISTRATOR'') ';
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.Open;
    if ods.FieldByName('FN_NUM').AsInteger > 0 then
      cxRegistrator.EditValue := ods.FieldByName('FN_NUM').AsInteger
    else
      cxRegistrator.EditValue := frmMain.pSOTRID;
  finally
    ods.Free;
  end;
end;

procedure TfrmRegistrAmbPac.DoDates;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT MAX(FD_DATE) AS MAXDATE, TRUNC(SYSDATE) AS DATESYS '+
                    '   FROM TIB '+
                    '  WHERE FK_PACID = :PFK_ID '+
                    '    AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''DATE_VYDANO'') ';
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.Open;
    if DateTimeToStr(ods.FieldByName('MAXDATE').AsDateTime) = '30.12.1899' then //!!!
      cxDateVydano.Date := ods.FieldByName('DATESYS').AsDateTime
    else
      cxDateVydano.Date := ods.FieldByName('MAXDATE').AsDateTime;
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT MAX(FD_DATE) AS MAXDATE, TRUNC(SYSDATE) AS DATESYS '+
                    '   FROM TIB '+
                    '  WHERE FK_PACID = :PFK_ID '+
                    '    AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''DATE_VOZVRAT'') ';
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.Open;
    if DateTimeToStr(ods.FieldByName('MAXDATE').AsDateTime) = '30.12.1899' then //!!!
      cxDateVozvrat.Clear // := ods.FieldByName('DATESYS').AsDateTime
    else
      cxDateVozvrat.Date := ods.FieldByName('MAXDATE').AsDateTime;
  finally
    ods.Free;
  end;
end;

procedure TfrmRegistrAmbPac.DoGetAddress;
var ods : TOracleDataSet;
//    odsAdr : TOracleDataSet;
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
  end;
//------------------------------------------------------------------------------
  CreateAddrDLL(cxAddress.Handle, Application.Handle, frmMain.os.ExternalSVC);
  l_addr_loaded := True;
  if l_addr_loaded = True then
  begin
    if EDIT_MODE = True then
      begin
        AddAddr(pPEPLID, frmMain.GET_PROPISKAID); //edit
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

procedure TfrmRegistrAmbPac.DoGraAndStatus;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
//-- Гражданство
    ods.SQL.Text := ' select fk_smid '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_GRAGZ'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pPEPLID);
    ods.Open;
    cxGra.EditValue := ods.FieldByName('fk_smid').AsInteger;
//-- Социальный статус
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fk_smid '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_SOC_POL'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pPEPLID);
    ods.Open;
    cxStatus.EditValue := ods.FieldByName('fk_smid').AsInteger;
  finally
    ods.Free;
  end;
end;

procedure TfrmRegistrAmbPac.cxKemNapravlenDblClick(Sender: TObject);
begin
  if odsKemNapravlen.RecordCount > 0 then
    begin
      if cxKemNapravlen.FocusedNode.HasChildren then
        exit;
      if (isKonsult = True) and (odsKemNapravlen.FieldByName('LPU_XMAO').AsInteger = 0) then
        begin
          Application.MessageBox('Услуга является консультативной, поэтому необходимо выбрать направившее учреждение из ветки "ЛПУ ХМАО"',
                                 'Предупреждение', mb_ok+mb_iconwarning);
          exit;
        end;
      cxKem.Text := odsKemNapravlen.FieldByName('FC_NAME').AsString;
      cxKem.Tag := odsKemNapravlen.FieldByName('FK_ID').AsInteger;
      teFilter.Clear;
      odsKemNapravlen.Filtered := False;
      cxKem.PopupWindow.Close;
    end;
end;

procedure TfrmRegistrAmbPac.cxKemNapravlenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
      teFilter.Clear;
      odsKemNapravlen.Filtered := False;
      cxKem.PopupWindow.Close;
    end;
end;

procedure TfrmRegistrAmbPac.DoProjivaet;
var ods : TOracleDataSet;
    id : Integer;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' DECLARE '+#13+
                    '   nSMID NUMBER; '+#13+
                    ' BEGIN '+#13+
                    ' SELECT '+#13+
                    ' DECODE((SELECT MAX(FK_SMID) FROM asu.TIB '+#13+
                    '          WHERE FK_PACID = :PFK_PACID '+#13+
                    '            AND (FK_SMID IN (SELECT FK_ID '+#13+
                    '                               FROM asu.TSMID '+#13+
                    '                              WHERE FK_OWNER = (SELECT MAX(FK_ID) '+#13+
                    '                                                  FROM asu.TSMID '+#13+
                    '                                                 WHERE FC_SYNONIM = ''PD_MZ'')) '+#13+
                    '                                 OR FK_SMID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO''))), '+#13+
                    '        NULL, '+#13+
                    '        (SELECT MAX(FK_SMID) FROM asu.TIB '+#13+
                    '          WHERE FK_PACID = :PFK_PEPLID '+#13+
                    '            AND (FK_SMID IN (SELECT FK_ID '+#13+
                    '                               FROM asu.TSMID '+#13+
                    '                              WHERE FK_OWNER = (SELECT MAX(FK_ID) '+#13+
                    '                                                  FROM asu.TSMID '+#13+
                    '                                                 WHERE FC_SYNONIM = ''PD_MZ'')))), '+#13+
                 //   '                                 OR FK_SMID = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO''))), '+#13+
                    '        (SELECT MAX(FK_SMID) FROM asu.TIB '+#13+
                    '          WHERE FK_PACID = :PFK_PACID '+#13+
                    '            AND (FK_SMID IN (SELECT FK_ID '+#13+
                    '                               FROM asu.TSMID '+#13+
                    '                              WHERE FK_OWNER = (SELECT MAX(FK_ID) '+#13+
                    '                                                  FROM asu.TSMID '+#13+
										'                                                 WHERE FC_SYNONIM = ''PD_MZ'')) '+#13+
                    '                                 OR FK_SMID = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO'')))) INTO :VAL '+#13+
                    ' FROM DUAL; '+#13+
                    ' IF :VAL IS NULL THEN '+#13+
										'   SELECT MAX(FK_ID) INTO :VAL FROM asu.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''PD_MZ'') AND FK_DEFAULT = 1; '+#13+
                    ' END IF; '+#13+
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

procedure TfrmRegistrAmbPac.DoVrachNapravil;
var ods : TOracleDataSet;
begin
  if pNAZID = 0 then
  begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' BEGIN '+
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
      cxVrach.Text := ods.GetVariable('VAL')
    else
      cxVrach.Text := ods.GetVariable('VAL'); //ods.FieldByName('VRACHFIO').AsString;
  finally
    ods.Free;
  end;
  end else
  begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
//    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' DECLARE '+
                    '   nSMID NUMBER; '+
                    ' BEGIN '+
                    '   SELECT COUNT(FK_ID) INTO nSMID FROM TIB WHERE FK_PACID = :PFK_PEPLID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''VRACH_NAPRAVIL''); '+
                    ' IF nSMID > 0 THEN '+
                    '   SELECT FC_CHAR INTO :VAL FROM TIB WHERE FK_PACID = :PFK_PEPLID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''VRACH_NAPRAVIL''); '+
                    ' ELSE '+
                    '   SELECT DO_VRACHFIO(TNAZIS.FK_VRACHID) INTO :VAL FROM TNAZIS WHERE FK_ID = :PFK_PEPLID ; '+
                    ' END IF; '+
                    ' END; ';
    ods.DeclareAndSet('PFK_PEPLID', otInteger, pNAZID);
    ods.DeclareVariable('VAL', otString);
    ods.Open;
    if ods.GetVariable('VAL') <> '' then
      cxVrach.Text := ods.GetVariable('VAL')
    else
      cxVrach.Text := ods.GetVariable('VAL');
  finally
    ods.Free;
  end;
  end;
end;

procedure TfrmRegistrAmbPac.bAddClick(Sender: TObject);
var oq : TOracleQuery;
begin
  if isKonsult = True then
    begin
      Application.MessageBox('Данная услуга является консультативной! Добавление новых услуг в это направление невозможно!',
                             'Предупреждение', mb_iconwarning+mb_ok);
      exit;
    end;

  frmMain.Update := False;
//-->> 1. Добавляем назначение
  Application.CreateForm(TfrmNazRg1, frmNazRg1);
  if (odsListNaz.RecordCount > 0) and (isKonsult = False) then
    frmNazRg1.isNotKonsult := False
  else
    frmNazRg1.isNotKonsult := True;
  if odsListNaz.RecordCount = 0 then
    begin
      frmNazRg1.DoShowfrmNazRg(pAmbul, pPACID, frmMain.pSOTRID, -1, cxFam.Text+' '+cxName.Text+' '+cxOtch.Text, 0, GetNumber)
    end else
    begin
      frmNazRg1.DoShowfrmNazRg(pAmbul, pPACID, frmMain.pSOTRID, -1, cxFam.Text+' '+cxName.Text+' '+cxOtch.Text, 0, odsListNaz.FieldByName('FC_TYPE').AsString)
    end;
  frmNazRg1.ShowModal;
  frmMain.IDNaz := frmNazRg1.FDNazID;
  isKonsult := frmNazRg1.isKonsult;
  lbKons.Visible := frmNazRg1.isKonsult;
  IDDOCID := frmNazRg1.FDDOCID;
  Date4Talon := frmNazRg1.DateNaz;
  if frmMain.IDNaz <> 0 then
    begin
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
    end;
  frmNazRg1.Free;
end;

procedure TfrmRegistrAmbPac.cxAddressClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmRegistrAmbPac.cxAddressEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmRegistrAmbPac.DoInsertProjivaet(nPACID: Integer);
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT MAX(FK_ID) AS nTmp '+#13+
                    '   FROM ASU.TIB I '+#13+
                    '  WHERE FK_PACID = :PFK_PACID '+#13+
                    '    AND (FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''PD_MZ'')) '+#13+
                    '     OR FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO'')) ';
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
        oq.SQL.Text := ' UPDATE ASU.TIB '+#13+
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

procedure TfrmRegistrAmbPac.DoInsertStatus(nIDPepl: Integer);
var ods : TOracleDataSet;
begin
  if cxStatus.EditText <> '' then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' merge into asu.tib using dual on (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_SOC_POL'')) '+#13+
                        ' when matched then '+#13+
                        '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate '+#13+
                        '    where fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_SOC_POL'') '+#13+
                        ' when not matched then '+#13+
                        '   insert(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                        '   values(:pfk_pacid, :pfk_smid, (select fk_id from asu.tsmid where fc_synonim = ''LD_SOC_POL''), :pfk_vrachid, sysdate) ';
        ods.DeclareAndSet('pfk_pacid', otInteger, nIDPepl);
        ods.DeclareAndSet('pfk_smid', otInteger, cxStatus.EditValue);
        ods.DeclareAndSet('pfk_vrachid', otInteger, frmMain.pSOTRID);
        ods.Open;
        frmMain.os.Commit;
      finally
        ods.Free;
      end;
    end;
end;

procedure TfrmRegistrAmbPac.DoUpdateAddress(nIDPepl: Integer);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.SQL.Text := ' UPDATE ASU.TADRESS SET FK_PACID = :PFK_PACID WHERE FK_PACID = :PFK_PACID1 ';
    oq.DeclareAndSet('PFK_PACID', otInteger, nIDPepl);
    oq.DeclareAndSet('PFK_PACID1', otInteger, id4NewPacAddress);
    oq.Execute;
    frmMain.os.Commit;
  finally
    oq.Free;
  end;
end;

procedure TfrmRegistrAmbPac.InsertKonsultUslug(nNazid: Integer);
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

function TfrmRegistrAmbPac.GetLastTalonID(App_HND: THandle; OS: TORacleSession; pPacID, pSotrID, pTalonID: Integer): integer; //received from Хомяков И.
var AAmbTalonHandle: THandle;
    str: string;
    GetAmbtalonId: function(App_HND: THandle; OS: TORacleSession; pPacID, pSotrID, pTalonID:Integer; pDate : TDateTime):LongInt; stdcall;
begin
  Result := -1;
  AAmbTalonHandle := LoadLibrary('AMBTalonDLL.dll');
  if AAmbTalonHandle > HINSTANCE_ERROR then
    begin
      @GetAmbtalonId := GetProcAddress(AAmbTalonHandle, 'InitPluginGetAmbtalonIdDefDate');
      if @GetAmbtalonId <> nil then
        begin
          try
            Result := GetAmbtalonId(App_HND, OS, pPacID, frmMain.pSOTRID, pTalonID, Date4Talon);
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

function TfrmRegistrAmbPac.GetNumber : String;
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
  ods := TOracleDataSet.Create(nil);
  oq := TOracleQuery.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FC_VALUE FROM asu.TSMINI WHERE FC_SECTION = ''XRAY_NAPRAVLENIE'' AND FC_KEY = ''ID_NUMBER'' ';
    ods.Open;
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' UPDATE asu.TSMINI SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''XRAY_NAPRAVLENIE'' AND FC_KEY = ''ID_NUMBER'' ';
    oq.DeclareAndSet('PFC_VALUE', otString, IntToStr(StrToInt(ods.FieldByName('FC_VALUE').AsString)+1));
    oq.Execute;
    frmMain.os.Commit;
    Result := IntToStr(StrToInt(ods.FieldByName('FC_VALUE').AsString)+1);
  finally
    oq.Free;
    ods.Free;
  end;
end;

procedure TfrmRegistrAmbPac.odsListNazAfterOpen(DataSet: TDataSet);
begin
  aZakl.Enabled := (odsListNaz.RecordCount > 0) and (odsListNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_VIPNAZ);
  bDel.Enabled := (odsListNaz.RecordCount > 0) and (odsListNaz.FieldByName('FK_VRACHID').AsInteger = frmMain.pSOTRID);
end;

procedure TfrmRegistrAmbPac.odsListNazBeforeOpen(DataSet: TDataSet);
begin
  if IDDOCID = '' then
    odsListNaz.SetVariable('PFC_TYPE', sNUMBERISSL)
  else
    odsListNaz.SetVariable('PFC_TYPE', IDDOCID);
  odsListNaz.SetVariable('PFK_PACID', pPACID);  
end;

procedure TfrmRegistrAmbPac.odsRegistratorBeforeOpen(DataSet: TDataSet);
begin
  odsRegistrator.SetVariable('PFK_OTDELID', frmMain.pOTDELID);
end;

procedure TfrmRegistrAmbPac.odsRgLaborantBeforeOpen(DataSet: TDataSet);
begin
  odsRgLaborant.SetVariable('PFK_OTDELID', frmMain.pOTDELID);
end;

procedure TfrmRegistrAmbPac.odsListNazApplyRecord(Sender: TOracleDataSet; Action: Char; var Applied: Boolean; var NewRowId: String);
var oq : TOracleQuery;
begin
  case Action of
    'U':
       begin
         if VTIME.Focused then
           begin
             oq := TOracleQuery.Create(nil);
             try
               oq.Session := frmMain.os;
               oq.SQL.Text := ' DECLARE '+#13+
                              '   Cnt NUMBER; '+#13+
                              ' BEGIN '+#13+
                              '   SELECT COUNT(FK_ID) INTO Cnt FROM TIB WHERE FK_PACID = :pFK_PACID AND FK_SMID = -2 AND FK_SMEDITID = -2; '+#13+
                              ' IF Cnt > 0 THEN '+#13+
                              '   UPDATE asu.TIB SET FN_NUM = :pFN_NUM, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_PACID AND FK_SMID = -2 AND FK_SMEDITID = -2; '+#13+
                              ' ELSE '+#13+
                              '   INSERT INTO asu.TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_PACID, :pFN_NUM, -2, -2, :pFK_VRACHID); '+#13+
                              ' END IF; '+#13+
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
       end;
  end;
  Applied := TRUE;
end;

procedure TfrmRegistrAmbPac.bbRefreshClick(Sender: TObject);
begin
  RefreshQuery(odsListNaz);
end;

procedure TfrmRegistrAmbPac.bDelClick(Sender: TObject);
var oq : TOracleQuery;
    ods : TOracleDataSet;
begin
  if (odsListNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_NAZCANCEL) or (odsListNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_VIPNAZ) then
    begin
      Application.MessageBox('Эта методика имеет статус "Выполнено" или "Отменено". Вы не можете её удалить!',
                             'Вопрос', MB_OK + MB_ICONWARNING);
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
          if odsListNaz.RecordCount = 0 then
            begin
              isKonsult := False;
              lbKons.Visible := False;
            end;
        end;
    end;
end;

procedure TfrmRegistrAmbPac.bVozrastClick(Sender: TObject);
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

procedure TfrmRegistrAmbPac.VNAMEISSLPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if odsListNaz.FieldByName('fk_nazsosid').AsInteger <> get_vipnaz then
    begin
      frmMain.Update := TRUE;
      Application.CreateForm(TfrmNazRg1, frmNazRg1);
      frmNazRg1.IsKonsult := frmRegistrAmbPac.isKonsult;
      if (odsListNaz.RecordCount > 0) and (isKonsult = False) then
        frmNazRg1.isNotKonsult := False
      else
        frmNazRg1.isNotKonsult := True;
      try
        frmNazRg1.DoShowfrmNazRg(pAmbul,
                                 pPACID,
                                 frmMain.pSOTRID,
                                 -1,
                                 cxFam.Text+' '+cxName.Text+' '+cxOtch.Text,
                                 odsListNaz.FieldByName('FK_ID').AsInteger,
                                 odsListNaz.FieldByName('FC_TYPE').AsString);
        frmNazRg1.ShowModal;
        frmMain.IDNaz := frmNazRg1.FDNazID;
        isKonsult := frmNazRg1.isKonsult;
        lbKons.Visible := frmNazRg1.isKonsult;
        IDDOCID := frmNazRg1.FDDOCID;
        odsListNaz.Locate('FK_ID', frmMain.IDNaz, []);
        if frmMain.IDNaz <> 0 then
          RefreshQuery(odsListNaz);
      finally
        frmNazRg1.Free;
      end;
    end else
    begin
      showmessage('Вы не можете изменить методику, которая уже выполнена врачом!');
    end;
end;

end.
