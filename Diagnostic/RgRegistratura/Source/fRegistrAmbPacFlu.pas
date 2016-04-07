unit fRegistrAmbPacFlu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, RVScroll, RichView, RVEdit, ExtCtrls, ImgList, ActnList,
  Oracle, StdCtrls, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxRadioGroup, cxGroupBox,
  cxGraphics, OracleData, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  DB, cxSpinEdit, cxCheckGroup, cxCustomData, cxStyles, cxTL,
  cxInplaceContainer, cxTLData, cxDBTL, cxCurrencyEdit, jvDBUtils, cxCheckBox,
  frxClass, cxTimeEdit, DateUtils, cxMemo, Menus, cxLookAndFeelPainters,
  cxButtons, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, cxClasses,
  AppEvnts, cxBarEditItem;

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

  TfrmRegistrAmbPacFlu = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    Panel1: TPanel;
    al: TActionList;
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
    paLaborant: TPanel;
    cxLabel13: TcxLabel;
    paIssl: TPanel;
    cxLabel16: TcxLabel;
    cxVidOplat: TcxLookupComboBox;
    odsVidOplat: TOracleDataSet;
    dsVidOplat: TDataSource;
    odsRegPrin: TOracleDataSet;
    dsRegPrin: TDataSource;
    cxProjivaet: TcxLookupComboBox;
    cxKorennoe: TcxLookupComboBox;
    dsKorennoe: TDataSource;
    odsKorennoe: TOracleDataSet;
    cxTarget: TcxLookupComboBox;
    odsTarget: TOracleDataSet;
    dsTarget: TDataSource;
    cxNaz: TcxLabel;
    odsVidDoc: TOracleDataSet;
    odsRgLaborant: TOracleDataSet;
    dsRgLaborant: TDataSource;
    bbHistory: TdxBarButton;
    aHistory: TAction;
    cxlKontaktPhone: TcxLabel;
    cxTelefon: TcxTextEdit;
    paFIO: TPanel;
    cxLabel12: TcxLabel;
    cxLabel10: TcxLabel;
    cxPriem: TcxLookupComboBox;
    cxLabel11: TcxLabel;
    cxApparat: TcxLookupComboBox;
    cxLabel14: TcxLabel;
    odsPeriod: TOracleDataSet;
    dsPeriod: TDataSource;
    odsPriem: TOracleDataSet;
    dsPriem: TDataSource;
    odsApparat: TOracleDataSet;
    dsApparat: TDataSource;
    bbSend: TdxBarButton;
    actSend: TAction;
    cxCompany: TcxMemo;
    bbCompany: TcxButton;
    cxlbOtdel: TcxLabel;
    cxLabel15: TcxLabel;
    odsLaborant: TOracleDataSet;
    dsLaborant: TDataSource;
    cxCompDogovor: TcxLookupComboBox;
    odsCompanyName: TOracleDataSet;
    dsCompanyName: TDataSource;
    cxLabel17: TcxLabel;
    cxPeriod: TcxLookupComboBox;
    bbZakl: TdxBarButton;
    aZakl: TAction;
    cxLabel18: TcxLabel;
    cxLabel28: TcxLabel;
    cxRgLaborant: TcxLookupComboBox;
    cxLabel9: TcxLabel;
    cxLaborant: TcxLookupComboBox;
    cxLabel1: TcxLabel;
    cxFam: TcxTextEdit;
    cxName: TcxTextEdit;
    cxOtch: TcxTextEdit;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    cxAddress: TMemo;
    ApplicationEvents1: TApplicationEvents;
    cxAge: TcxLabel;
    lbCompany: TcxLabel;
    bVozrast: TcxButton;
    cxNum: TcxTextEdit;
    cxLabel19: TcxLabel;
    lbTub: TcxLabel;
    cxNumIssl: TcxMaskEdit;
    bbAgree: TdxBarButton;
    aAgree: TAction;
    cxLabel8: TcxLabel;
    lbUch: TcxLabel;
    lbDoza: TcxBarEditItem;
    odsCntOut: TOracleDataSet;
    cxLabel23: TcxLabel;
    teAnother: TcxTextEdit;
    dxBarPopupMenu1: TdxBarPopupMenu;
    frAgreeProc: TfrxReport;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    aAgreeProc: TAction;
    cxLabel24: TcxLabel;
    teAdrR: TcxTextEdit;
    l1: TcxLabel;
    cxKem: TcxPopupEdit;
    l2: TcxLabel;
    cxVrach: TcxTextEdit;
    pnlFilter: TPanel;
    cxKemNapravlen: TcxDBTreeList;
    tlc1: TcxDBTreeListColumn;
    pnl1: TPanel;
    l3: TcxLabel;
    teFilter: TcxTextEdit;
    odsKemNapravlen: TOracleDataSet;
    dsKemNapravlen: TDataSource;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure cxNazClick(Sender: TObject);
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
    procedure FormShow(Sender: TObject);
    procedure cxdeRojdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aHistoryExecute(Sender: TObject);
    procedure actSendExecute(Sender: TObject);
    procedure bbCompanyClick(Sender: TObject);
    procedure cxPriemPropertiesChange(Sender: TObject);
    procedure cxVidOplatPropertiesChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aZaklExecute(Sender: TObject);
    procedure odsLaborantBeforeOpen(DataSet: TDataSet);
    procedure odsRgLaborantBeforeOpen(DataSet: TDataSet);
    procedure ApplicationEvents1Deactivate(Sender: TObject);
    procedure bVozrastClick(Sender: TObject);
    procedure aAgreeExecute(Sender: TObject);
    procedure cxFamKeyPress(Sender: TObject; var Key: Char);
    procedure cxNameKeyPress(Sender: TObject; var Key: Char);
    procedure cxOtchKeyPress(Sender: TObject; var Key: Char);
    procedure teAnotherPropertiesChange(Sender: TObject);
    procedure aAgreeProcExecute(Sender: TObject);
    procedure frAgreeProcGetValue(const VarName: string; var Value: Variant);
    procedure cxKemNapravlenDblClick(Sender: TObject);
    procedure teFilterEnter(Sender: TObject);
    procedure teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    isAnother : Boolean;
    pSumDoza : Double;
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
    GetNum : Boolean;    
    idTalon : Integer;
    isKonsult : Boolean; // является ли услуга консультативной
    procedure DoGetAddress;
    procedure DoUpdateAddress(nIDPepl : Integer);
    function fGetIB(var nIBIDf, nIBYf: Integer): boolean;
    procedure OnMove(var Msg: TWMMove); message WM_MOVE;
    procedure DoInsertKorennoe(nidPepl : Integer);
    procedure DoTub;
    procedure DoUchastok;
    procedure DoSumDoza;
    procedure DoCheckUslugKonsult;
    procedure DoVrachNapravil;
    { Private declarations }
  public
    EDIT_MODE : Boolean;
    pAMBUL, pPACID, pPEPLID, pOTDELID, pTypeDocID, pSMIDID, pNAZID, pCOMPANYID : Integer;
    pDOCOBSLID : Integer;
    nIBID, nIBY : Integer;
    strFileName : String;
    v_fk_nazsosid : Integer;
    procedure DoShowfrmRegistrAmbPac(nAmbul, nPACID, nPEPLID : Integer; strFIO : String; nOTDELID, nSMIDID : Integer; nNAZID : Integer=0);
    procedure DoTextTypeAmbul;
    procedure DoTextTypeStac;
    procedure DoTextTypeFIO(strFIO : String);
    function DoCheckParameters : Integer;
    procedure CheckEnabledControls;
    procedure DoTextTypeNaz;
    procedure DoInsertEditParametersNaz(nIdPepl : Integer);
    procedure DoTextParametersNaz;
    procedure DoUpdateStatusNaz;
    procedure DoUpdatePacIDNaz(nIDPAC : Integer);
    procedure DoVidOplat;
    procedure DoTarget;
    procedure DoRgLaborant;
    procedure DoProjivaet;
    procedure DoInsertProjivaet(nPACID : Integer);
    procedure DoPriem;
    procedure DoApparat;
    procedure DoNumberFlu;
    procedure DoCompany;
    procedure DoCompanyDogovor;
    function Set_NewNum_For_Apparat : String;
    procedure DoPeriod;
    { Public declarations }
  end;

var
  frmRegistrAmbPacFlu: TfrmRegistrAmbPacFlu;

implementation

uses fNazRgOne1, fMain, fAllHistory, fCompanyList, fProsmotrZaklFlu;

{$R *.dfm}

procedure TfrmRegistrAmbPacFlu.DoShowfrmRegistrAmbPac(nAMBUL, nPACID, nPEPLID : Integer; strFIO : String; nOTDELID, nSMIDID : Integer; nNAZID : Integer);
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
        if odsVidDoc.Active = False then
          odsVidDoc.Open;
        pTypeDocID := odsVidDoc.FieldByName('FK_VIDDOCID').AsInteger;
      end;
    case pAMBUL of
    0: DoTextTypeStac;  // стационарный
    1: DoTextTypeAmbul; // амбулаторный
    end;
    DoVidOplat;
    DoProjivaet;
    DoTarget;
    DoRgLaborant;
    DoPriem;
    DoApparat;

   { if not ((USE_ONE_ACCESSIONNUMBER=1) and (v_fk_nazsosid = 2)) then  // для хант делалось - Поддержка #30031
    begin  }
      DoNumberFlu;
  //  end;

    DoCompany;
    DoCompanyDogovor;
    DoPeriod;
    DoTub;
    DoUchastok;
    DoSumDoza;
    DoVrachNapravil;
    DoCheckUslugKonsult;
    if pPACID = 0 then
      DoTextTypeFIO(strFIO);
    if pSMIDID <> 0 then
      DoTextTypeNaz;
    if pNAZID <> 0 then
      begin
        DoTextParametersNaz;
        aZakl.Enabled := True;
      end;
    aAgree.Visible := pPACID <> 0; // если нажали кнопку "Новый" то кнопку "Согласие" не показываем
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmRegistrAmbPacFlu.DoCheckUslugKonsult;
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
//        lbKons.Visible := isKonsult = True;
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

procedure TfrmRegistrAmbPacFlu.DoSumDoza;
var ods : TOracleDataSet;
begin
  if pPacID <> 0 then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.SQL.Text := ' select sum(t1.fn_num) as SumDoza, to_date(to_char(sysdate, ''dd.mm'')||to_char(extract(year from sysdate)-1),''dd.mm.yyyy'') as daymin '+#13+
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
        pSumDoza := ods.FieldByName('SumDoza').AsFloat;
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

procedure TfrmRegistrAmbPacFlu.DoTextTypeAmbul;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT COUNT(FK_ID) AS CNT FROM TAMBULANCE WHERE FK_ID=:PFK_ID ';
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
//        PFK_UCHID := ods.FieldByName('FK_UCHID').AsInteger;
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

procedure TfrmRegistrAmbPacFlu.aSaveExecute(Sender: TObject);
var oqIns, oqEdit, oqDelNum : TOracleQuery;
    ods : TOracleDataSet;
    odsAmb, odsPepl : TOracleDataSet;
    IDPac : Integer;
    idPepl : Integer;
    hAgree : Integer;
    LoadAgree : TLoadAgree;    
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
      oqEdit := TOracleQuery.Create(nil);  // изменяем параметры существующей АМБУЛАТОРНОЙ МК пациента
      try                                  // здесь получается что меняются данные АМК даже если открыли стационарного
        odsPepl.Session := frmMain.os;     // ??? критично ли это - да!!! надо делать разграничение
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
                           '      SET FK_COMPANYID =:PFK_COMPANYID, '+#13+
                           '          FC_PHONE=:PFC_PHONE, fc_rabota = :pfc_rabota '+#13+
                           '    WHERE FK_ID=:PFK_PEPLID; '+#13+
                           ' END; ';
        oqEdit.DeclareAndSet('pFK_PEPLID', otInteger, odspepl.FieldByName('fk_peplid').AsInteger); //pPEPLID);
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
        if pCOMPANYID = 0 then
          oqEdit.DeclareAndSet('pFK_COMPANYID', otInteger, cxCompany.Tag)
        else
          oqEdit.DeclareAndSet('pFK_COMPANYID', otInteger, pCOMPANYID);
        oqEdit.DeclareAndSet('pfc_rabota', otString, teAnother.Text);  
        oqEdit.Execute;
        frmMain.os.Commit;
        IDPAC := pPACID;
      finally
        odsPepl.Free;
        oqEdit.Free;
      end;
    end else
    begin
      ods := TOracleDataSet.Create(nil);  // добавляем нового пациента   EDIT_MODE = FALSE
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
            oqIns.Session := frmMain.os; //1. если такой пипл НЕ существует в базе
//            oqIns.Cursor := crSQLWait;
            oqIns.SQL.Text := ' DECLARE '+#13+
	                            '   nTemp NUMBER; '+#13+
                              ' BEGIN '+#13+
		                          '   INSERT INTO asu.TAMBULANCE(FK_ID) VALUES(:PFK_ID) '+#13+ //инсертим запись в tambulance
                              '   RETURNING FK_ID INTO :PFK_ID; '+#13+
    		                      '   INSERT INTO asu.TPEOPLES(FC_FAM) VALUES(NULL) '+#13+ //инсертим запись в tpeoples
                              '   RETURNING FK_ID INTO :PFK_PEPLID; '+#13+
        	                    '   :NDOCOBSLID:= asu.SET_NEWIBNUM(:PFK_USLVIDID, nTemp); '+#13+ //устанавливаем № документа обслуживания
                		          '   UPDATE asu.TAMBULANCE SET '+#13+
			                        '   FK_IBID = nTemp, '+#13+
			                        '   FK_IBY = TO_CHAR(GET_YEARWORK), '+#13+
			                        '   FK_PEPLID = :PFK_PEPLID, '+#13+
			                        '   FK_DOCOBSL = :NDOCOBSLID '+#13+
	                            '   WHERE FK_ID = :PFK_ID; '+#13+
                              '   asu.EDIT_AMBULANCE '+#13+
                              '   (0,:pFK_PEPLID,:pFC_FAM,:pFC_IM,:pFC_OTCH,'''','''',:pFC_PHONE,'''', '+#13+
	                            '   :pFD_ROJD,:pFP_SEX,0,0,0,:pFK_ID,6,0,nTemp,TO_CHAR(GET_YEARWORK), '+#13+
	                            '   0,:pFK_VRACHID, NULL); '+#13+
                              '   UPDATE asu.TPEOPLES '+#13+
                              '   SET FC_FAM=:PFC_FAM, FC_IM=:PFC_IM, FC_OTCH=:PFC_OTCH, FP_SEX=:PFP_SEX, FD_ROJD=:PFD_ROJD, FC_RABOTA=:pfc_rabota, '+#13+
                              '   FC_PHONE=:PFC_PHONE, FC_FAX=NULL, FC_E_MAIL=NULL, FC_HTTP=NULL, FK_DOCVID=-1, '+#13+
                              '   FC_DOCSER=NULL, FC_DOCNUM=NULL, FC_DOCVIDAN=NULL, FD_DOCDATE=NULL, '+#13+
                              '   FK_COMPANYID =:PFK_COMPANYID, FK_OTDEL=-1, FK_DOLGNOST=-1, FC_ROJDPLACE='' '', '+#13+
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
            if pCOMPANYID = 0 then
              oqIns.DeclareAndSet('pFK_COMPANYID', otInteger, cxCompany.Tag)
            else
              oqIns.DeclareAndSet('pFK_COMPANYID', otInteger, pCOMPANYID);
            oqIns.DeclareAndSet('pfc_rabota', otString, teAnother.Text);  
            oqIns.Execute;
            frmMain.os.Commit;
            IDPac := oqIns.GetVariable('PFK_ID');
            idPepl := oqIns.GetVariable('PFK_PEPLID');
            DoInsertProjivaet(IDPac);
            DoInsertKorennoe(idPepl);
          end else
          begin                                    // 2. если такой пипл УЖЕ существует в базе
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
                  oqIns.SQL.Text := ' DECLARE '+#13+
	                                  '     nTemp NUMBER; '+#13+
                                    ' BEGIN '+#13+
		                                '   INSERT INTO asu.TAMBULANCE(FK_ID) '+#13+
                                    '   VALUES(:PFK_ID) '+#13+
                                    '   RETURNING FK_ID INTO :PFK_ID; '+#13+
        	                          '   :NDOCOBSLID:= SET_NEWIBNUM(:PFK_USLVIDID, nTemp); '+#13+  //устанавливаем № документа обслуживания
                		                '   UPDATE asu.TAMBULANCE SET '+#13+
			                              '   FK_IBID = nTemp, '+#13+
			                              '   FK_IBY = TO_CHAR(GET_YEARWORK), '+#13+
			                              '   FK_PEPLID = :PFK_PEPLID, '+#13+
			                              '   FK_DOCOBSL = :NDOCOBSLID '+#13+
	                                  '   WHERE FK_ID = :PFK_ID; '+#13+
                                    '   asu.EDIT_AMBULANCE '+#13+
                                    '   (0,:pFK_PEPLID,:pFC_FAM,:pFC_IM,:pFC_OTCH,'''','''',:pFC_PHONE,'''', '+#13+
	                                  '   :pFD_ROJD,:pFP_SEX,0,0,0,:pFK_ID,6,0,nTemp,TO_CHAR(GET_YEARWORK), '+#13+
	                                  '   0,:pFK_VRACHID, NULL); '+#13+
                                    '   UPDATE asu.TPEOPLES '+#13+
                                    '   SET FK_COMPANYID =:PFK_COMPANYID, FC_PHONE=:PFC_PHONE, fc_rabota = :pfc_rabota '+#13+
                                    '   WHERE FK_ID=:PFK_PEPLID; '+#13+
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
                  if pCOMPANYID = 0 then
                    oqIns.DeclareAndSet('pFK_COMPANYID', otInteger, cxCompany.Tag)
                  else
                    oqIns.DeclareAndSet('pFK_COMPANYID', otInteger, pCOMPANYID);
                  oqIns.DeclareAndSet('pfc_rabota', otString, teAnother.Text);  
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
        ods.Free;
        oqIns.Free;
      end;
    end;

  if l_addr_loaded then //++kladr Сохраняем адрес
    begin
      SaveAddrChanges; // Callback Возвращает ID адреса, если было добавление и 0 при изменении
      CommitAddrChanges;
    end;

  if EDIT_MODE = False then // если новый пациент - делаем необходимые изменения
    begin
      if IDPac <> 0 then
        DoUpdatePacIDNaz(IDPac);
      DoUpdateAddress(idPepl);
    end;

  if pPACID <> 0 then // Сохраняем проживает
    begin
      DoInsertProjivaet(pPACID);
    end;

  DoInsertEditParametersNaz(idPepl); // Сохраняем все параметры направления
  if cxNaz.Caption = '<...>' then
    begin
      if GetNum = True then
        begin
          oqDelNum := TOracleQuery.Create(nil);
          try
            oqDelNum.Session := frmMain.os;
            oqDelNum.Cursor := crSQLWait;
            oqDelNum.SQL.Text := ' UPDATE ASU.TSMINI SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''SET_NEW_FLU_NUM'' ';
            oqDelNum.DeclareAndSet('PFC_VALUE', otString, IntToStr(StrToInt(cxNumIssl.Text)-1));
            oqDelNum.Execute;
            frmMain.os.Commit;
          finally
            oqDelNum.Free;
          end;
        end;
    end;
//-->> вызов длл "Согласие пациента"
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

  ModalResult := MrOK;
finally
  Screen.Cursor := crDefault;
end;
end;

procedure TfrmRegistrAmbPacFlu.aZaklExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  Application.CreateForm(TfrmProsmotrZaklFlu, frmProsmotrZaklFlu);
  frmProsmotrZaklFlu.rowNum.Properties.Value := cxNumIssl.Text;
  frmProsmotrZaklFlu.merFIOMK.Properties.Editors[0].Value := cxFam.Text+' '+cxName.Text+' '+cxOtch.Text;
  frmProsmotrZaklFlu.merDateAgeSex.Properties.Editors[0].Value := cxdeRojd.Text;
  frmProsmotrZaklFlu.merDateAgeSex.Properties.Editors[1].Value := cxAge.Caption;
  if cxMale.Checked = True then  
    frmProsmotrZaklFlu.merDateAgeSex.Properties.Editors[2].Value := 'Мужской'
  else
    frmProsmotrZaklFlu.merDateAgeSex.Properties.Editors[2].Value := 'Женский';
  frmProsmotrZaklFlu.rowIssl.Properties.Value := cxNaz.Caption;

  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_NAZTYPEID, '+#13+
                    '        TRUNC(FD_RUN) AS FD_RUN, '+#13+
                    '        TRUNC(SYSDATE) AS SYS_DATE, '+#13+
                    '        (SELECT MAX(FC_CHAR) '+#13+
                    '           FROM asu.TIB '+#13+
                    '          WHERE FK_PACID = :pFK_ID AND FK_SMID = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME1'')) AS RESUME1, '+#13+
                    '        (SELECT MAX(FC_CHAR) '+#13+
                    '           FROM asu.TIB '+#13+
                    '          WHERE FK_PACID = :pFK_ID AND FK_SMID = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME2'')) AS RESUME2, '+#13+
                    '        (SELECT asu.DO_VRACHFIO(MAX(FN_NUM)) '+#13+
                    '           FROM asu.TIB '+#13+
                    '          WHERE FK_PACID = :PFK_ID AND FK_SMID = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_VRACH1'')) AS SOTR1, '+#13+
                    '        (SELECT asu.DO_VRACHFIO(MAX(FN_NUM)) '+#13+
                    '           FROM asu.TIB '+#13+
                    '          WHERE FK_PACID = :PFK_ID AND FK_SMID = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_VRACH2'')) AS SOTR2 '+#13+
                    '   FROM asu.TNAZIS WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.Open;
    frmProsmotrZaklFlu.rowZakl1.Properties.Value := ods.FieldByName('RESUME1').AsString;
    frmProsmotrZaklFlu.rowZakl2.Properties.Value := ods.FieldByName('RESUME2').AsString;
    frmProsmotrZaklFlu.rowSotr1.Properties.Value := ods.FieldByName('SOTR1').AsString;
    frmProsmotrZaklFlu.rowSotr2.Properties.Value := ods.FieldByName('SOTR2').AsString;
    frmProsmotrZaklFlu.ShowModal;
  finally
    ods.Free;
    frmProsmotrZaklFlu.Free;
  end;
end;

procedure TfrmRegistrAmbPacFlu.aAgreeExecute(Sender: TObject);
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
      ShowMessage('Не удалось загрузить динамическую библиотеку Dll_Soglasie_Pac.dll');
    end;
end;

procedure TfrmRegistrAmbPacFlu.aAgreeProcExecute(Sender: TObject);
begin
  frAgreeProc.ShowReport;
end;

procedure TfrmRegistrAmbPacFlu.aCancelExecute(Sender: TObject);
var oq, oqDelNum, oqDelNaz : TOracleQuery;
    ods : TOracleDataSet;
begin
  if (pPACID = 0) AND (cxNaz.Caption <> '<...>') then
    begin
      Application.MessageBox('Внимание! Вы добавили методику, но не зарегистрировали Нового пациента!'+
                             #13#10+'Методика будет удалена! ',
                             'Предупреждение!',
                             MB_ICONWARNING+MB_OK);

      oqDelNaz := TOracleQuery.Create(nil);
      oqDelNaz.Session := frmMain.os;
      oqDelNaz.Cursor := crSQLWait;
      ods := TOracleDataSet.Create(nil);
      ods.Session := frmMain.os;
      ods.Cursor := crSQLWait;
      try
        oqDelNaz.SQL.Text := ' DELETE FROM ASU.TNAZIS WHERE FK_ID = :PFK_ID ';
        oqDelNaz.DeclareAndSet('PFK_ID', otInteger, cxNaz.Tag);
        oqDelNaz.Execute;
        if frmMain.get_db_name = 'SK' then // -- для кардио центра проверяем выгружен ли талон, если не выгружен удаляем и талон
          begin
            ods.DeleteVariables;
            ods.Close;
            ods.SQL.Text := ' select fk_talonid from asu.tambtalon_naz where fk_nazid = :pfk_nazid ';
            ods.DeclareAndSet('pfk_nazid', otInteger, cxNaz.Tag);
            ods.Open;
            odsCntOut.Close;
            odsCntOut.SetVariable('pTalonID', ods.FieldByName('fk_talonid').AsInteger);
            odsCntOut.Open;
            if odsCntOut.FieldByName('cnt_out').AsInteger = 0 then
              begin
                oqDelNaz.DeleteVariables;
                oqDelNaz.SQL.Text := ' delete from asu.tambtalon where fk_id = :pfk_id ';
                oqDelNaz.DeclareAndSet('pfk_id', otInteger, ods.FieldByName('fk_talonid').AsInteger);
                oqDelNaz.Execute;
              end;
          end;
        frmMain.os.Commit;
      finally
        oqDelNaz.Free;
        ods.Free;
      end;
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

  if GetNum = True then
    begin
      oqDelNum := TOracleQuery.Create(nil);
      try
        oqDelNum.Session := frmMain.os;
        oqDelNum.Cursor := crSQLWait;
        oqDelNum.SQL.Text := ' UPDATE ASU.TSMINI SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''SET_NEW_FLU_NUM''||TO_CHAR(:PKABID) ';
        oqDelNum.DeclareAndSet('PFC_VALUE', otString, IntToStr(StrToInt(cxNumIssl.Text)-1));
        oqDelNum.DeclareAndSet('PKABID', otInteger, frmMain.odsKab.FieldByName('fk_id').AsInteger);
        oqDelNum.Execute;
        frmMain.os.Commit;
      finally
        oqDelNum.Free;
      end;
    end;
  ModalResult := MrCancel;
end;

procedure TfrmRegistrAmbPacFlu.cxNazClick(Sender: TObject);
var ods : TOracleDataSet;
begin
  if cxNaz.Caption <> '<...>' then
    frmMain.Update := TRUE
  else
    frmMain.Update := FALSE;
  Application.CreateForm(TfrmNazRg1, frmNazRg1);
  frmNazRg1.DoShowfrmNazRg(pAmbul,
                           pPACID,
                           frmMain.pSOTRID,
                           -1, //frmMain.odsKab.FieldByName('FK_ID').AsInteger,  //??? почему сюда не передаётся параметр кабинета
                           cxFam.Text+' '+cxName.Text+' '+cxOtch.Text,
                           pNAZID);
  frmNazRg1.ShowModal;
  frmMain.IDNaz := frmNazRg1.FDNazID;
  if frmMain.IDNaz <> 0 then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT asu.GET_NAME_RGISSL(FK_SMID) AS NAMERG '+
                          '   FROM asu.TNAZIS WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
        ods.Open;
        cxNaz.Caption := ods.FieldByName('NAMERG').AsString;
        cxNaz.Tag := frmNazRg1.FDNazID;
        aZakl.Enabled := True;
      finally
        ods.Free;
      end;
    end;
  frmNazRg1.Free;
end;

procedure TfrmRegistrAmbPacFlu.cxKorennoePropertiesChange(Sender: TObject);
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
                    '    AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''KOREN_NASEL'')) ';
    ods.DeclareAndSet('PFK_PACID', otInteger, pPEPLID);
    ods.Open;
    if ods.FieldByName('nTmp').AsInteger = 0 then //проверяем есть ли такая запись на пациента(PEPLID) в TIB
      begin
        oq := TOracleQuery.Create(nil); //если нет, то добавляем новую (INSERT)
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' insert into asu.tib(fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date) '+#13+
                         ' values(:pfk_pacid, :pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, sysdate) ';
          oq.DeclareAndSet('pFK_PACID', otInteger, pPEPLID);
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
          oq.Cursor := crSQLWait;
          oq.SQL.Text := ' update asu.tib set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid, fd_date = sysdate where fk_id = :pfk_id ';
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

procedure TfrmRegistrAmbPacFlu.cxPriemPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_PRIEM_STAC'' ';
    ods.Open;
    if cxPriem.EditValue = ods.FieldByName('FK_ID').AsInteger then
      begin
	      cxLabel15.Visible := True;
	      cxlbOtdel.Visible := True;
	      ods.DeleteVariables;
	      ods.Close;
	      ods.SQL.Text := ' SELECT TOTDEL.FC_NAME '+
			                  '   FROM ASU.TROOM, ASU.TOTDEL '+
		                  	'  WHERE STAT.PKG_PRIEMREP.GET_PACPALATAID(:PPACID, SYSDATE) = TROOM.FK_ID '+
	   	                  '    AND TOTDEL.FK_ID = TROOM.FK_OTDELID ';
	      ods.DeclareAndSet('PPACID', otInteger, pPACID);
        ods.Open;
        if ods.FieldByName('FC_NAME').AsString <> ''  then
          cxlbOtdel.Caption := ods.FieldByName('FC_NAME').AsString
        else
	        cxlbOtdel.Caption := '--';
      end else
      begin
      	cxLabel15.Visible := False;
      	cxlbOtdel.Visible := False;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmRegistrAmbPacFlu.cxVidOplatPropertiesChange(Sender: TObject);
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

procedure TfrmRegistrAmbPacFlu.DoTextTypeFIO(strFIO: String);
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

procedure TfrmRegistrAmbPacFlu.cxFamClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmRegistrAmbPacFlu.cxFamEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmRegistrAmbPacFlu.cxFamKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '"', '№', ';', ':', '?', '=', '\', '/', '.', ',', '>', '<', '|', '[', ']', '{', '}'] then
    Key := #0;
end;

procedure TfrmRegistrAmbPacFlu.cxNameClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmRegistrAmbPacFlu.cxNameEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmRegistrAmbPacFlu.cxNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '"', '№', ';', ':', '?', '=', '\', '/', '.', ',', '>', '<', '|', '[', ']', '{', '}'] then
    Key := #0;
end;

procedure TfrmRegistrAmbPacFlu.cxOtchClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmRegistrAmbPacFlu.cxOtchEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmRegistrAmbPacFlu.cxOtchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '"', '№', ';', ':', '?', '=', '\', '/', '.', ',', '>', '<', '|', '[', ']', '{', '}'] then
    Key := #0;
end;

procedure TfrmRegistrAmbPacFlu.cxDSClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmRegistrAmbPacFlu.cxDSEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmRegistrAmbPacFlu.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
  frmmain.IDNaz := 0;
end;

procedure TfrmRegistrAmbPacFlu.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);  
  if odsKemNapravlen.Active = False then
    odsKemNapravlen.Active := True;
  if odsKorennoe.Active = False then
    odsKorennoe.Active := True;
  if odsVidOplat.Active = False then
    odsVidOplat.Active := True;
  if odsCompanyName.Active = False then
    odsCompanyName.Active := True;
  if odsRegPrin.Active = False then
    odsRegPrin.Active := True;
  if odsPriem.Active = False then
    odsPriem.Active := True;
  if odsTarget.Active = False then
    odsTarget.Active := True;
  if odsApparat.Active = False then
    odsApparat.Active := True;
  if odsPeriod.Active = False then
    odsPeriod.Active := True;
  if odsRgLaborant.Active = False then
    odsRgLaborant.Active := True;
  if odsLaborant.Active = False then
    odsLaborant.Active := True;
//-->> 2. Настройки
  bbCompany.Visible := frmMain.get_show_work = '-1'; // показываем кнопку "Место работы" в зависимости от настроек
  if frmMain.get_show_agreepac = '-1' then
    bbAgree.Visible := ivAlways
  else
    bbAgree.Visible := ivNever;
end;

function TfrmRegistrAmbPacFlu.DoCheckParameters : Integer;
var nIBIDf, nIBYf : Integer;
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

  if (cxdeRojd.Text = '') or (cxdeRojd.Text = '0') or (cxdeRojd.Text = '30.12.1899') or (TryStrToDate(cxdeRojd.Text, DateSys) = False) then
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

  if trunc(cxdeRojd.Date) > DateSys then // !!! вот здесь после TryStrToDate(cxdeRojd.Text, DateSys) DateSys становится равной дате которую выбрали и условие не работает
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

//  if pPEPLID <> 0 then
//    begin
//      if (DateSys < DatePlan) and (cxTarget.EditValue = frmMain.get_id_profilaktika) and (cxNaz.Caption <> '<...>') then
//        begin
//          MessageDlg('Внимание!'+#13+#10+
//                     'Сегодня '+DateTimeToStr(DateSys)+', а плановая ФГ у пациента должна быть пройдена'+DateTimeToStr(DatePlan)+#13+#10+
//                     'Вы не можете указать этой ФГ цель "Профилактика"!'+#13+#10+
//                     'Поменяйте цель на "Диагностика"!', mtWarning, [mbOK], 0);
//          cxTarget.SetFocus;
//          Result := 0;
//          exit;
//        end
//    end;
  Result := 1;
end;

function TfrmRegistrAmbPacFlu.fGetIB(var nIBIDf, nIBYf: Integer): boolean; // !!! вынести в общую процедуру ?
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
    oq.SQL.Text := ' SELECT COUNT(TAMBULANCE.FK_ID) AS FP_COUNT '+
                   '   FROM ASU.TAMBULANCE, ASU.TDOCOBSL '+
                   '  WHERE TDOCOBSL.FN_YEAR=:FK_IBY '+
                   '    AND TDOCOBSL.FK_NUMIB=:FK_IBID '+
                   '    AND TAMBULANCE.FK_ID <> :PPACID '+
                   '    AND TAMBULANCE.FK_DOCOBSL = TDOCOBSL.FK_ID '+
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

procedure TfrmRegistrAmbPacFlu.odsVidDocBeforeOpen(DataSet: TDataSet);
begin
  odsVidDoc.SetVariable('PFK_ID', pPACID);
end;

procedure TfrmRegistrAmbPacFlu.OnMove(var Msg: TWMMove);
begin
  inherited;
  if l_addr_loaded then
    MoveAddrDll;
end;

procedure TfrmRegistrAmbPacFlu.DoTextTypeStac;
var ods : TOracleDataSet;
begin
  CheckEnabledControls;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT COUNT(FK_ID) AS CNT FROM TKARTA WHERE FK_ID=:PFK_ID ';
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
//------------------------------------------------------------------------------
        if ods.FieldByName('FP_SEX').AsInteger = 1 then
          cxMale.Checked := True
        else
          cxFemale.Checked := True;
        EDIT_MODE := True;
      end else
      begin
        EDIT_MODE := False;
      end;
  finally
    ods.Free;
  end;  
end;

procedure TfrmRegistrAmbPacFlu.DoTub;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT NAZ.FK_ID, TUB.FN_COUNTYEAR, TUB.FD_END, ASU.GET_SMIDNAME(TUB.FK_PERIODID_REC) AS REC '+
                    '   FROM ASU.TNAZIS NAZ, ASU.TTUBPARAM TUB '+
                    '  WHERE NAZ.FK_SMID = ASU.GET_XRAY_TUBDISPANCER '+
                    '    AND NAZ.FK_PACID = ASU.GET_PEPLID(:PFK_PACID) '+
                    '    AND NAZ.FK_ID = TUB.FK_NAZID '+
                    '    AND SYSDATE >= TUB.FD_BEGIN '+
                    '    AND SYSDATE < TO_DATE(TUB.FD_END)+1 '+
                    ' ORDER BY NAZ.FK_ID ASC ';
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
    ods.Open;
    ods.Last;
    if ods.RecordCount > 0 then
      begin
        lbTub.Visible := True;
        lbTub.Caption := 'На учете в тубдиспансере. Периодичность: '+ods.FieldByName('REC').AsString+
                         ' до '+DateTimeToStr(ods.FieldByName('FD_END').AsDateTime);
//        cxPeriod.Enabled := False;
//        cxPeriod.Text := ods.FieldByName('REC').AsString;
      end else
      begin
        lbTub.Visible := False;
//        cxPeriod.Enabled := True;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmRegistrAmbPacFlu.CheckEnabledControls;
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

procedure TfrmRegistrAmbPacFlu.DoTextTypeNaz;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT ASU.GET_NAME_RGISSL(:PFK_SMIDID) AS NAMEISSL FROM DUAL ';
    ods.DeclareAndSet('PFK_SMIDID', otInteger, pSMIDID);
    ods.Open;
    cxNaz.Caption := ods.FieldByName('NAMEISSL').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmRegistrAmbPacFlu.DoVrachNapravil;
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

procedure TfrmRegistrAmbPacFlu.DoInsertEditParametersNaz(nIdPepl : Integer);
var oqNaz : TOracleQuery;
begin
  if (frmMain.IDNaz <> 0) or (pNAZID <> 0) then
  begin
    oqNaz := TOracleQuery.Create(nil);
    try
      oqNaz.Session := frmMain.os;
//-- Другое
      if isAnother = True then
        begin

        end;     
      if (cxNumIssl.Text <> '') or (cxNumIssl.Text <> '0') then //номер исследования
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+#13+
                            '   nSMID11 NUMBER; '+#13+
                            '   Cnt11 NUMBER; '+#13+
                            ' BEGIN '+#13+
                            '   SELECT COUNT(FK_ID) INTO Cnt11 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_FLU_NUMBER''); '+#13+
                            ' IF Cnt11 > 0 THEN '+#13+
                            '   UPDATE TIB SET FC_CHAR = :pFC_CHAR11, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_FLU_NUMBER''); '+#13+
                            ' ELSE '+#13+
                            '   SELECT FK_ID INTO nSMID11 FROM TSMID WHERE FC_SYNONIM = ''XRAY_FLU_NUMBER''; '+#13+
                            '   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFC_CHAR11, nSMID11, nSMID11, :pFK_VRACHID); '+#13+
                            ' END IF; '+#13+
                            ' END; ';
          if frmMain.IDNaz = 0 then
            oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID)
          else
            oqNaz.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
          oqNaz.DeclareAndSet('pFC_CHAR11', otString, cxNumIssl.Text);
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
                            '   UPDATE TIB SET FK_SMID = :pFK_SMID2, FK_SMEDITID =:pFK_SMEDITID2, FK_VRACHID =:pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''ISSL_TARGET'')); '+#13+
                            ' ELSE '+#13+
                            '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFK_SMID2, :pFK_SMEDITID2, :pFK_VRACHID); '+#13+
                            ' END IF; '+#13+
                            ' END; ';
          if frmMain.IDNaz = 0 then
            oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID)
          else
            oqNaz.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
          oqNaz.DeclareAndSet('pFK_SMID2', otInteger, cxTarget.EditValue);
          oqNaz.DeclareAndSet('pFK_SMEDITID2', otInteger, cxTarget.EditValue);
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
          oqNaz.DeclareAndSet('PFK_ID', otInteger, pNazid);// odsListNaz.FieldByName('FK_ID').AsInteger);
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
                            '   UPDATE TIB SET FC_CHAR = :pFC_CHAR13, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''KONTAKT_PHONE''); '+#13+
                            ' ELSE '+#13+
                            '   SELECT FK_ID INTO nSMID13 FROM TSMID WHERE FC_SYNONIM = ''KONTAKT_PHONE''; '+#13+
                            '   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :PFC_CHAR13, nSMID13, nSMID13, :pFK_VRACHID); '+#13+
                            ' END IF; '+#13+
                            ' END; ';
          if frmMain.IDNaz = 0 then
            oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID)
          else
            oqNaz.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
          oqNaz.DeclareAndSet('pFC_CHAR13', otString, cxTelefon.Text);
          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
//------------------------------------------------------------------------------
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
          oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID);//odsListNaz.FieldByName('FK_ID').AsInteger);
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
//----------------------------------------------------------------------------------
      if cxRgLaborant.Text <> '' then //Регистратор
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+#13+
                            '   nSMID15 NUMBER; '+#13+
                            '   Cnt15 NUMBER; '+#13+
                            ' BEGIN '+#13+
                            '   SELECT COUNT(FK_ID) INTO Cnt15 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''RG_REGISTRATOR''); '+#13+
                            ' IF Cnt15 > 0 THEN '+#13+
                            '   UPDATE TIB SET FN_NUM = :pFN_NUM15, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''RG_REGISTRATOR''); '+#13+
                            ' ELSE '+#13+
                            '   SELECT FK_ID INTO nSMID15 FROM TSMID WHERE FC_SYNONIM = ''RG_REGISTRATOR''; '+#13+
                            '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFN_NUM15, nSMID15, nSMID15, :pFK_VRACHID); '+#13+
                            ' END IF; '+#13+
                            ' END; ';
          oqNaz.DeclareAndSet('pFN_NUM15', otInteger, cxRgLaborant.EditValue);
          if frmMain.IDNaz = 0 then
            oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID)
          else
            oqNaz.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
//------------------------------------------------------------------------------
      if cxLaborant.Text <> '' then //Лаборант (указанный)
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+#13+
                            '   nSMID16 NUMBER; '+#13+
                            '   Cnt16 NUMBER; '+#13+
                            ' BEGIN '+#13+
                            '   SELECT COUNT(FK_ID) INTO Cnt16 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''FLU_LABORANT''); '+#13+
                            ' IF Cnt16 > 0 THEN '+#13+
                            '   UPDATE TIB SET FN_NUM = :pFN_NUM16, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''FLU_LABORANT''); '+#13+
                            ' ELSE '+#13+
                            '   SELECT FK_ID INTO nSMID16 FROM TSMID WHERE FC_SYNONIM = ''FLU_LABORANT''; '+#13+
                            '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFN_NUM16, nSMID16, nSMID16, :pFK_VRACHID); '+#13+
                            ' END IF; '+#13+
                            ' END; ';
          oqNaz.DeclareAndSet('pFN_NUM16', otInteger, cxLaborant.EditValue);
          if frmMain.IDNaz = 0 then
            oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID)
          else
            oqNaz.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
//------------------------------------------------------------------------------
      if cxVidOplat.Text <> '' then //способ оплаты
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+#13+
                            '   Cnt24 NUMBER; '+#13+
                            ' BEGIN '+#13+
                            '   SELECT COUNT(FK_ID) INTO Cnt24 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''AMBTALON_OPL'')); '+#13+
                            ' IF Cnt24 > 0 THEN '+#13+
                            '   UPDATE TIB SET FK_SMID = :pFK_SMID24, FK_SMEDITID =:pFK_SMEDITID24, FK_VRACHID =:pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''AMBTALON_OPL'')); '+#13+
                            ' ELSE '+#13+
                            '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFK_SMID24, :pFK_SMEDITID24, :pFK_VRACHID); '+#13+
                            ' END IF; '+#13+
                            ' END; ';
          if frmMain.IDNaz = 0 then
            oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID)
          else
            oqNaz.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
          oqNaz.DeclareAndSet('pFK_SMID24', otInteger, cxVidOplat.EditValue);
          oqNaz.DeclareAndSet('pFK_SMEDITID24', otInteger, cxVidOplat.EditValue);
          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
//------------------------------------------------------------------------------
      if cxPriem.Text <> '' then //Приём
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+#13+
                            '   Cnt14 NUMBER; '+#13+
                            ' BEGIN '+#13+
                            '   SELECT COUNT(FK_ID) INTO Cnt14 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_PRIEM'')); '+#13+
                            ' IF Cnt14 > 0 THEN '+#13+
                            '   UPDATE TIB SET FK_SMID = :pFK_SMID14, FK_SMEDITID =:pFK_SMEDITID14, FK_VRACHID =:pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_PRIEM'')); '+#13+
                            ' ELSE '+#13+
                            '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFK_SMID14, :pFK_SMEDITID14, :pFK_VRACHID); '+#13+
                            ' END IF; '+#13+
                            ' END; ';
          if frmMain.IDNaz = 0 then
            oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID)
          else
            oqNaz.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
          oqNaz.DeclareAndSet('pFK_SMID14', otInteger, cxPriem.EditValue);
          oqNaz.DeclareAndSet('pFK_SMEDITID14', otInteger, cxPriem.EditValue);
          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
//------------------------------------------------------------------------------
      if cxApparat.Text <> '' then //Аппарат
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+#13+
                            '   Cnt15 NUMBER; '+#13+
                            ' BEGIN '+#13+
                            '   SELECT COUNT(FK_ID) INTO Cnt15 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_APPARAT'')); '+#13+
                            ' IF Cnt15 > 0 THEN '+#13+
                            '   UPDATE TIB SET FK_SMID = :pFK_SMID15, FK_SMEDITID =:pFK_SMEDITID15, FK_VRACHID =:pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_APPARAT'')); '+#13+
                            ' ELSE '+#13+
                            '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFK_SMID15, :pFK_SMEDITID15, :pFK_VRACHID); '+#13+
                            ' END IF; '+#13+
                            ' END; ';
          if frmMain.IDNaz = 0 then
            oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID)
          else
            oqNaz.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
          oqNaz.DeclareAndSet('pFK_SMID15', otInteger, cxApparat.EditValue);
          oqNaz.DeclareAndSet('pFK_SMEDITID15', otInteger, cxApparat.EditValue);
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
                                '   UPDATE TIB SET FK_SMID = :pFK_SMID26, FK_SMEDITID =:pFK_SMEDITID26, FK_VRACHID =:pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_COMPANY_DOGOVOR'')); '+#13+
                                ' ELSE '+#13+
                                '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFK_SMID26, :pFK_SMEDITID26, :pFK_VRACHID); '+#13+
                                ' END IF; '+#13+
                                ' END; ';
              if frmMain.IDNaz = 0 then
                oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID)
              else
                oqNaz.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
              oqNaz.DeclareAndSet('pFK_SMID26', otInteger, cxCompDogovor.EditValue);
              oqNaz.DeclareAndSet('pFK_SMEDITID26', otInteger, cxCompDogovor.EditValue);
              oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
              oqNaz.Execute;
              frmMain.os.Commit;
            end;
        end else
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DELETE FROM asu.TIB WHERE FK_PACID = :PFK_ID '+#13+
                            ' AND asu.GET_OWNER_FROM_SMID(FK_SMID) = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''XRAY_COMPANY_DOGOVOR'') ';
          if frmMain.IDNaz = 0 then
            oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID)
          else
            oqNaz.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
    finally
      oqNaz.Free;
    end;
  end;
end;

procedure TfrmRegistrAmbPacFlu.DoInsertKorennoe(nidPepl: Integer);
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT MAX(FK_ID) AS nTmp '+
                    '   FROM  TIB I '+
                    '  WHERE FK_PACID = :PFK_PACID '+
                    '    AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''KOREN_NASEL'')) ';
    ods.DeclareAndSet('PFK_PACID', otInteger, nidPepl);
    ods.Open;
    if ods.FieldByName('nTmp').AsInteger = 0 then //проверяем есть ли такая запись на пациента(PEPLID) в TIB
      begin
        oq := TOracleQuery.Create(nil); //если нет, то добавляем новую (INSERT)
        try
          oq.Session := frmMain.os;
          oq.Cursor := crSQLWait;
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

procedure TfrmRegistrAmbPacFlu.DoTextParametersNaz;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT FN_NUM FROM TIB '+
                    '  WHERE FK_PACID = :PFK_ID '+
                    '    AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''FLU_LABORANT'') ';
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.Open;
    cxLaborant.EditValue := ods.FieldByName('FN_NUM').AsInteger;
    ods.close;
    ods.SQL.Text := ' SELECT /*FK_NAZTYPEID, FD_RUN, FK_ISPOLID,*/ GET_VRACHFCOTDEL(FK_VRACHID) AS OTDELSTAC, '+#13+
//                    '       (SELECT MAX(FK_SMID) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''TIME_NORMA_ISSL''))) AS NADBAVKA, '+#13+
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
                    '                           CONNECT BY PRIOR FK_ID = FK_OWNER)) AS ID_KEMNAPRAVLEN--, '+#13+
//                    '       (SELECT MAX(FN_NUM) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOKOMY'')) AS KOLVOKOMY, '+#13+
//                    '       (SELECT MAX(FC_CHAR) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_FIO_REMARK'')) AS FIO_REMARK, '+#13+
//                    '       (SELECT MAX(FN_NUM) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''ZAPISAN_ONPHONE'')) AS ON_PHONE, '+#13+
//                    '       (SELECT count(*) FROM asu.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''DEZURSTVO'')) AS DEZ, '+#13+
//                    '       (SELECT MAX(FC_CHAR) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''NUMBER_DISK'')) AS NUMBER_DISK, '+#13+
//                    '       (SELECT MAX(FK_SMID) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''CIFRA_ARCHIVE''))) AS CIFRA_ARCHIVE, '+#13+
//                    '       (SELECT MAX(FK_SMID) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTDEL_VYDANO''))) AS OTDEL_VYDANO, '+#13+
//                    '       (SELECT MAX(FC_CHAR) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''NUMBER_KOROB'')) AS NUMBER_KOROB '+#13+
                    '   FROM asu.TNAZIS WHERE FK_ID = :PFK_ID ';
    ods.Open;
    if pAMBUL = 0 then
      begin
        cxKem.Text := ods.FieldByName('OTDELSTAC').AsString;
      end else
      begin
        cxKem.Text := ods.FieldByName('KEMNAPRAVLEN').AsString;
        cxKem.Tag := ods.FieldByName('ID_KEMNAPRAVLEN').AsInteger;
        odsKemNapravlen.Locate('FK_ID', ods.FieldByName('ID_KEMNAPRAVLEN').AsInteger, []);
        if (cxKem.Text = '') and (cxKem.Tag = 0) then
         begin
          odsKemNapravlen.first;
          cxKem.Text := odsKemNapravlen.FieldByName('fc_name').AsString;
          cxKem.Tag := odsKemNapravlen.FieldByName('fk_id').AsInteger;
         end;        
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmRegistrAmbPacFlu.FormShow(Sender: TObject);
begin
  DoGetAddress;

  if cxFam.Enabled then
    cxFam.SetFocus;
end;

procedure TfrmRegistrAmbPacFlu.frAgreeProcGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'PACFIO' then Value := cxFam.Text+' '+cxName.Text+' '+cxOtch.Text;
  if VarName = 'NUMIB' then Value := cxNum.Text;
  if VarName = 'METODS' then Value := cxNaz.Caption;
end;

procedure TfrmRegistrAmbPacFlu.DoUpdateStatusNaz;
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

procedure TfrmRegistrAmbPacFlu.DoUpdatePacIDNaz(nIDPAC: Integer);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.SQL.Text := ' UPDATE asu.TNAZIS SET FK_PACID = :PFK_PACID WHERE FK_ID = :PFK_ID ';
    oq.DeclareAndSet('PFK_PACID', otInteger, nIDPAC);
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

procedure TfrmRegistrAmbPacFlu.cxdeRojdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TfrmRegistrAmbPacFlu.aHistoryExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmAllHistory, frmAllHistory);
  frmAllHistory.DoShowForm(pPEPLID, cxFam.Text+' '+cxName.Text+' '+cxOtch.Text);
  frmAllHistory.ShowModal;
  frmAllHistory.Free;
end;

procedure TfrmRegistrAmbPacFlu.ApplicationEvents1Deactivate(Sender: TObject);
begin
  if l_addr_loaded then
    CloseAddrDropDown;   // Callback
end;

procedure TfrmRegistrAmbPacFlu.DoVidOplat;
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
                    '     SELECT DECODE((SELECT TO_NUMBER(FC_VALUE) FROM asu.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DEFAULT_VID_OPLAT''), '+#13+
                    '                    NULL, 0, '+#13+
                    '                    (SELECT TO_NUMBER(FC_VALUE) FROM asu.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DEFAULT_VID_OPLAT'')) '+#13+
                    '            INTO :VAL FROM DUAL ; '+#13+
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

procedure TfrmRegistrAmbPacFlu.DoTarget;
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
                    '     SELECT DECODE((SELECT TO_NUMBER(FC_VALUE) FROM TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DEFAULT_TARGET''), '+
                    '                   NULL, 0, '+
                    '                   (SELECT TO_NUMBER(FC_VALUE) FROM TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DEFAULT_TARGET'')) INTO :VAL '+
                    '       FROM DUAL ; '+
		                ' END IF; '+
                    ' END; ';
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.DeclareVariable('VAL', otInteger);
    ods.Open;
    cxTarget.EditValue := ods.GetVariable('VAL');
  finally
    ods.Free;
  end;
end;

procedure TfrmRegistrAmbPacFlu.DoRgLaborant;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT FN_NUM FROM TIB '+
                    '  WHERE FK_PACID = :PFK_ID '+
                    '    AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''RG_REGISTRATOR'') ';
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.Open;
    if ods.FieldByName('FN_NUM').AsInteger > 0 then
      cxRgLaborant.EditValue := ods.FieldByName('FN_NUM').AsInteger
    else
      cxRgLaborant.EditValue := frmMain.pSOTRID;
  finally
    ods.Free;
  end;
end;

procedure TfrmRegistrAmbPacFlu.DoProjivaet;
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
                    ' DECODE((SELECT MAX(FK_SMID) FROM TIB '+#13+
                    '          WHERE FK_PACID = :PFK_PACID '+#13+
                    '            AND (FK_SMID IN (SELECT FK_ID '+#13+
                    '                               FROM TSMID '+#13+
                    '                              WHERE FK_OWNER = (SELECT MAX(FK_ID) '+#13+
                    '                                                  FROM TSMID '+#13+
                    '                                                 WHERE FC_SYNONIM = ''PD_MZ'')) '+#13+
                    '                                 OR FK_SMID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO''))), '+#13+
                    '        NULL, '+#13+
                    '        (SELECT MAX(FK_SMID) FROM TIB '+#13+
                    '          WHERE FK_PACID = :PFK_PEPLID '+#13+
                    '            AND (FK_SMID IN (SELECT FK_ID '+#13+
                    '                               FROM TSMID '+#13+
                    '                              WHERE FK_OWNER = (SELECT MAX(FK_ID) '+#13+
                    '                                                  FROM TSMID '+#13+
                    '                                                 WHERE FC_SYNONIM = ''PD_MZ'')))), '+#13+
//                    '                                 OR FK_SMID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO''))), '+
                    '        (SELECT MAX(FK_SMID) FROM TIB '+#13+
                    '          WHERE FK_PACID = :PFK_PACID '+#13+
                    '            AND (FK_SMID IN (SELECT FK_ID '+#13+
                    '                               FROM TSMID '+#13+
                    '                              WHERE FK_OWNER = (SELECT MAX(FK_ID) '+#13+
                    '                                                  FROM TSMID '+#13+
                    '                                                 WHERE FC_SYNONIM = ''PD_MZ'')) '+#13+
                    '                                 OR FK_SMID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO'')))) INTO :VAL '+#13+
                    ' FROM DUAL; '+#13+
                    ' IF :VAL IS NULL THEN '+#13+
										'   SELECT MAX(FK_ID) INTO :VAL FROM TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''PD_MZ'') AND FK_DEFAULT = 1; '+#13+
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

procedure TfrmRegistrAmbPacFlu.DoInsertProjivaet(nPACID: Integer);
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT MAX(FK_ID) AS nTmp '+#13+
                    '   FROM asu.TIB I '+#13+
                    '  WHERE FK_PACID = :PFK_PACID '+#13+
                    '    AND (FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''PD_MZ'')) '+#13+
                    '     OR FK_SMID = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO'')) ';
    ods.DeclareAndSet('PFK_PACID', otInteger, nPACID);
    ods.Open;
    if ods.FieldByName('nTmp').AsInteger = 0 then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' INSERT INTO asu.TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13+
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
        oq.Cursor := crSQLWait;
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

procedure TfrmRegistrAmbPacFlu.DoUchastok;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select asu.get_area_for_xray(:pfk_peplid) as uch from dual ';
    ods.DeclareAndSet('pfk_peplid', otInteger, pPEPLID);
    ods.Open;
    lbUch.Caption := ods.FieldByName('uch').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmRegistrAmbPacFlu.DoUpdateAddress(nIDPepl: Integer);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.SQL.Text := ' UPDATE asu.TADRESS SET FK_PACID = :PFK_PACID WHERE FK_PACID = :PFK_PACID1 ';
    oq.DeclareAndSet('PFK_PACID', otInteger, nIDPepl);
    oq.DeclareAndSet('PFK_PACID1', otInteger, id4NewPacAddress);
    oq.Execute;
    frmMain.os.Commit;
  finally
    oq.Free;
  end;
end;

procedure TfrmRegistrAmbPacFlu.DoApparat;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' BEGIN '+
                    '   SELECT MAX(FK_SMID) INTO :VAL '+
                    '     FROM TIB '+
                    '    WHERE FK_PACID = :PFK_ID '+
                    '      AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_APPARAT'')); '+
                    '   IF :VAL IS NULL THEN '+
                    '     SELECT MAX(FK_ID) INTO :VAL '+
                    '       FROM TSMID '+
                    '      WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_APPARAT'') AND FK_DEFAULT = 1; '+
                    '   END IF; '+
                    ' END; ';
    if frmMain.IDNaz = 0 then
      ods.DeclareAndSet('PFK_ID', otInteger, pNAZID)
    else
      ods.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
    ods.DeclareVariable('VAL', otInteger);
    ods.Open;
    cxApparat.EditValue := ods.GetVariable('VAL');
  finally
    ods.Free;
  end;
end;

procedure TfrmRegistrAmbPacFlu.DoPeriod;
//var ods : TOracleDataSet;
begin
//  ods := TOracleDataSet.Create(nil);
//  try
//    ods.Session := frmMain.os;
//    ods.SQL.Text := ' BEGIN '+
//                    '   SELECT MAX(FK_SMID) INTO :VAL '+
//                    '     FROM TIB '+
//                    '    WHERE FK_PACID = :PFK_ID '+
//                    '      AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_PERIOD_OSMOTROV'')); '+
//                    '   IF :VAL IS NULL THEN '+
//                    '     SELECT MAX(FK_ID) INTO :VAL '+
//                    '       FROM TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_PERIOD_OSMOTROV'') AND FK_DEFAULT = 1; '+
//                    '   END IF; '+
//                    ' END; ';
//    ods.DeclareAndSet('PFK_ID', otInteger, pPEPLID);
//    ods.DeclareVariable('VAL', otInteger);
//    ods.Open;
//    cxPeriod.EditValue := ods.GetVariable('VAL');
//  finally
//    ods.Free;
//  end;
end;

procedure TfrmRegistrAmbPacFlu.DoPriem;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' BEGIN '+
                    '   SELECT MAX(FK_SMID) INTO :VAL '+
                    '     FROM TIB '+
                    '    WHERE FK_PACID = :PFK_ID '+
                    '      AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_PRIEM'')); '+
                    '   IF :VAL IS NULL THEN '+
                    '   SELECT MAX(FK_ID) INTO :VAL '+
                    '     FROM TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_PRIEM'') AND FK_DEFAULT = 1; '+
                    '   END IF; '+
                    ' END; ';
    if frmMain.IDNaz = 0 then
      ods.DeclareAndSet('PFK_ID', otInteger, pNAZID)
    else
      ods.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
    ods.DeclareVariable('VAL', otInteger);
    ods.Open;
    cxPriem.EditValue := ods.GetVariable('VAL');
  finally
    ods.Free;
  end;
end;

procedure TfrmRegistrAmbPacFlu.DoNumberFlu;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' declare '+#13+
                    '   cursor cNum is select fc_char '+#13+
                    '                    from asu.tib '+#13+
                    '                   where fk_pacid = :pfk_id '+#13+
                    '                     and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''XRAY_FLU_NUMBER''); '+#13+
                    ' begin '+#13+
                    '   :Val := to_char(0); '+#13+
                    '   open cNum; '+#13+
                    '   fetch cNum into :Val; '+#13+
                    '   if cNum%rowcount = 0 then '+#13+
                    '     :get_num := to_char(asu.set_newflunum(:pKabID)); '+#13+
                    '   end if; '+#13+
                    '   close cNum; '+#13+
                    ' end; ';
//    ods.SQL.Text := ' DECLARE '+  // !!! изменено 09.12.2010 по истечение 2-ух месяцев удалить
//                    ' nCNT NUMBER; '+
//                    ' BEGIN '+
//                    '   :VAL := TO_CHAR(0); '+
//                    '   SELECT COUNT(FK_ID) INTO nCNT '+
//                    '     FROM ASU.TIB '+
//                    '    WHERE FK_PACID = :PFK_ID AND FK_SMID = (SELECT MAX(FK_ID) FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_FLU_NUMBER''); '+
//                    '   IF nCNT > 0 THEN '+
//                    '     SELECT MAX(FC_CHAR) INTO :VAL '+
//                    '       FROM ASU.TIB '+
//                    '      WHERE FK_PACID = :PFK_ID AND FK_SMID = (SELECT MAX(FK_ID) FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_FLU_NUMBER''); '+
//                    '   ELSE '+
//                    '     :GET_NUM := TO_CHAR(ASU.SET_NEWFLUNUM); '+
//                    '   END IF; '+
//                    ' END; ';
    if pNAZID <> 0 then
      ods.DeclareAndSet('PFK_ID', otInteger, pNAZID)
    else
      ods.DeclareAndSet('PFK_ID', otInteger, -1);
    ods.DeclareVariable('VAL', otString);
    ods.DeclareVariable('GET_NUM', otInteger);
    ods.DeclareAndSet('pKabID', otInteger, frmMain.odsKab.FieldByName('fk_id').AsInteger);
    ods.Open;
    if ods.GetVariable('VAL') = '0' then
      begin
        cxNumIssl.Text := ods.GetVariable('GET_NUM');
        GetNum := True;
      end else
      begin
        cxNumIssl.Text := ods.GetVariable('VAL');
        GetNum := False;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmRegistrAmbPacFlu.actSendExecute(Sender: TObject);
var str : TStringList;
    strDate : String;
    year, month, day : Word;
    ods : TOracleDataSet;
    sSysDate : String;
    sConnectString : String;
    NewNum_For_Apparat : String;
begin
  if cxNaz.Caption = '<...>' then
    begin
      MessageDlg('Внимание!'+#13+#10+'Прежде чем сделать отправку на аппарат, Вам необходимо выбрать услугу!', mtInformation, [mbOK], 0);
      exit;
    end;
  
  if FileExists(strFileName) <> True then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT TRUNC(SYSDATE) AS DATESYS, '+#13+
                        '        (SELECT FC_VALUE FROM TSMINI WHERE FC_SECTION = ''CONNECT_STRING'' AND FC_KEY = ''FLU_APPARAT'') AS CONNECTSTR FROM DUAL ';
        ods.Open;
        sSysDate := FormatDateTime('yyyy', ods.FieldByName('DATESYS').AsDateTime) + FormatDateTime('mm', ods.FieldByName('DATESYS').AsDateTime) + FormatDateTime('dd', ods.FieldByName('DATESYS').AsDateTime);
        sConnectString := ods.FieldByName('CONNECTSTR').AsString;
      finally
        ods.Free;
      end;
      DecodeDate(cxdeRojd.Date, year, month, day);
      strDate := FormatDateTime('yyyy', cxdeRojd.Date)+FormatDateTime('mm', cxdeRojd.Date)+FormatDateTime('dd', cxdeRojd.Date);
      NewNum_For_Apparat := Set_NewNum_For_Apparat;
      str := TStringList.Create;
      try
        str.Append('(0x0008, 0x0005, CS, "ISO_IR 144")'); // кодировка
        str.Append('(0x0008, 0x0050, SH, "'+cxNumIssl.Text+'")'); // номер по порядку в течение дня
        str.Append('(0x0010, 0x0010, PN, "'+cxFam.Text+'^'+cxName.Text+'^'+cxOtch.Text+'")'); // ФИО пациента
        str.Append('(0x0010, 0x0020, LO, "'+cxNumIssl.Text+'")'); // номер по порядку в течение дня
        str.Append('(0x0010, 0x0030, DA, "'+strDate+'")'); // дата рождения пациента
        if cxMale.Checked = TRUE then
          str.Append('(0x0010, 0x0040, CS, "M")') // пол пациента
        else
          str.Append('(0x0010, 0x0040, CS, "F")');
        str.Append('(0x0010, 0x1000, LO, "")');
        str.Append('(0x0020, 0x000D, UI, "1.3.643.1.2002.'+NewNum_For_Apparat+'.5")'); // идентификатор сквозная нумерация в течение года
        str.Append('(0x0040, 0x0100, SQ,');
        str.Append('{');
        str.Append('(0x0008, 0x0060, CS, "CR")');
        str.Append('(0x0040, 0x0002, DA, "'+sSysDate+'")'); // текущая дата
        str.Append('(0x0040, 0x0003, TM, "1")'); //номер ???
        str.Append('}');
        if not DirectoryExists(sConnectString) then
          ForceDirectories(sConnectString);
        str.SaveToFile(sConnectString + '\' + NewNum_For_Apparat + '.pat');
      finally
        str.Free;
      end;
      strFileName := sConnectString + '\' + NewNum_For_Apparat + '.pat';
    end;
end;

procedure TfrmRegistrAmbPacFlu.DoCompany;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT asu.GET_COMPANY_LONGNAME(FK_COMPANYID) AS COMPANYNAME, FK_COMPANYID, fc_rabota '+#13+
                    '   FROM ASU.TPEOPLES '+#13+
                    '  WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pPEPLID);
    ods.Open;
    cxCompany.Text := ods.FieldByName('COMPANYNAME').AsString;
    cxCompany.Tag := ods.FieldByName('FK_COMPANYID').AsInteger;
    teAnother.Text := ods.FieldByName('fc_rabota').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmRegistrAmbPacFlu.DoCompanyDogovor;
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
		                    '     SELECT MAX(FK_ID) INTO :VAL '+
                        '       FROM TSMID '+
                        '      WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_COMPANY_DOGOVOR'') AND FK_DEFAULT = 1; '+
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

procedure TfrmRegistrAmbPacFlu.DoGetAddress;
var ods : TOracleDataSet;
begin
// -- Адрес фактический
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
  CreateAddrDLL(cxAddress.Handle, Application.Handle, frmMain.os.ExternalSVC);
  l_addr_loaded := True;
  if l_addr_loaded = True then
  begin
    if EDIT_MODE = True then
      begin
        AddAddr(pPEPLID, frmMain.get_registid); //frmMain.GET_PROPISKAID);
// -- Адрес по регистрации
        ods := TOracleDataSet.Create(nil);
        try
          ods.Session := frmMain.os;
          ods.SQL.Text := ' select asu.GET_ADR_BY_PEPLID_LEVEL_TOWN(:pPeplID, asu.get_propiskaid) as adrR from dual ';
          ods.DeclareAndSet('pPeplID', otInteger, pPEPLID);
          ods.Open;
          teAdrR.Text := ods.FieldByName('adrR').AsString;
        finally
          ods.Free;
        end;
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
        AddAddr(id4NewPacAddress, frmMain.get_registid); //frmMain.GET_PROPISKAID);
      end;
  end;
end;

procedure TfrmRegistrAmbPacFlu.bbCompanyClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCompanyList, frmCompanyList);
  try
    frmCompanyList.DoShowCompany;
    frmCompanyList.ShowModal;
    if frmCompanyList.ModalResult = MrOK then
      begin
        pCOMPANYID := frmCompanyList.odsCompany.FieldByName('FK_ID').AsInteger;
        cxCompany.Text := frmCompanyList.odsCompany.FieldByName('FC_NAME').AsString;
      end;
  finally
    frmCompanyList.Free;
  end;
end;

procedure TfrmRegistrAmbPacFlu.bVozrastClick(Sender: TObject);
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

function TfrmRegistrAmbPacFlu.Set_NewNum_For_Apparat : String;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);          
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' BEGIN '+#13+
                    ' :GET_NUM := TO_CHAR(ASU.SET_NEWNUM_FOR_APPARAT); '+#13+
                    ' END; ';
    ods.DeclareVariable('GET_NUM', otInteger);
    ods.Open;
    Result := ods.GetVariable('GET_NUM');
  finally
    ods.Free;
  end;
end;

procedure TfrmRegistrAmbPacFlu.teAnotherPropertiesChange(Sender: TObject);
begin
  isAnother := True;
end;

procedure TfrmRegistrAmbPacFlu.teFilterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmRegistrAmbPacFlu.teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  odsKemNapravlen.Filtered := False;
  if length(teFilter.Text) > 0 then
    begin
      odsKemNapravlen.Filter := 'fc_upper = ''*' + AnsiUpperCase(teFilter.Text) + '*'' ';
      odsKemNapravlen.Filtered := true;
    end;
end;

procedure TfrmRegistrAmbPacFlu.cxKemNapravlenDblClick(Sender: TObject);
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

procedure TfrmRegistrAmbPacFlu.odsLaborantBeforeOpen(DataSet: TDataSet);
begin
  odsLaborant.SetVariable('PFK_OTDELID', frmMain.pOTDELID);
end;

procedure TfrmRegistrAmbPacFlu.odsRgLaborantBeforeOpen(DataSet: TDataSet);
begin
  odsRgLaborant.SetVariable('PFK_OTDELID', frmMain.pOTDELID);
end;

end.
