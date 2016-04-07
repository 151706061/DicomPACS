unit fLabNapravFlu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, ExtCtrls, ImgList, ActnList,
  Oracle, StdCtrls, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxRadioGroup, cxGroupBox,
  cxGraphics, OracleData, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  DB, cxSpinEdit, cxCheckGroup, cxCustomData, cxStyles, cxTL,
  cxInplaceContainer, cxTLData, cxDBTL, cxCurrencyEdit, jvDBUtils, cxCheckBox,
  frxClass, cxTimeEdit, DateUtils, cxMemo, Menus, cxLookAndFeelPainters,
  cxButtons, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, cxClasses,
  cxBarEditItem;

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
  TGetAddrText = function():PChar; stdcall;

  TfrmLabNapravFlu = class(TForm)
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
    Panel3: TPanel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    Panel5: TPanel;
    cxLabel13: TcxLabel;
    Panel6: TPanel;
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
    Panel8: TPanel;
    cxLabel23: TcxLabel;
    cxDoza: TcxCurrencyEdit;
    cxLabel28: TcxLabel;
    cxRgLaborant: TcxLookupComboBox;
    odsRgLaborant: TOracleDataSet;
    dsRgLaborant: TDataSource;
    bbPrint: TdxBarButton;
    aPrint: TAction;
    bbHistory: TdxBarButton;
    aHistory: TAction;
    cxdeDateProtocol: TcxDateEdit;
    cxteTimeProtocol: TcxTimeEdit;
    cxlKontaktPhone: TcxLabel;
    cxTelefon: TcxTextEdit;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    Panel4: TPanel;
    cxLabel12: TcxLabel;
    cxPriem: TcxLookupComboBox;
    cxApparat: TcxLookupComboBox;
    odsPriem: TOracleDataSet;
    dsPriem: TDataSource;
    odsApparat: TOracleDataSet;
    dsApparat: TDataSource;
    cxLabel14: TcxLabel;
    odsUchastok: TOracleDataSet;
    dsUchastok: TDataSource;
    bbSend: TdxBarButton;
    actSend: TAction;
    cxCompany: TcxMemo;
    bbCompany: TcxButton;
    frxReport1: TfrxReport;
    cxlbOtdel: TcxLabel;
    cxLabel15: TcxLabel;
    cxCompDogovor: TcxLookupComboBox;
    odsCompanyName: TOracleDataSet;
    dsCompanyName: TDataSource;
    cxLabel17: TcxLabel;
    cxPeriod: TcxLookupComboBox;
    odsPeriod: TOracleDataSet;
    dsPeriod: TDataSource;
    bbZakl: TdxBarButton;
    aZakl: TAction;
    cxLabel9: TcxLabel;
    cxLabel18: TcxLabel;
    cxLabel1: TcxLabel;
    cxFam: TcxTextEdit;
    cxName: TcxTextEdit;
    cxOtch: TcxTextEdit;
    cxLabel19: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    lbCompany: TcxLabel;
    bVozrast: TcxButton;
    cxAge: TcxLabel;
    cxLabel25: TcxLabel;
    cxAddress: TMemo;
    cxNum: TcxTextEdit;
    cxLabel24: TcxLabel;
    lbTub: TcxLabel;
    cxNumIssl: TcxMaskEdit;
    bbAgree: TdxBarButton;
    aAgree: TAction;
    bbInfo: TdxBarButton;
    aInfo: TAction;
    lbUch: TcxLabel;
    lbDoza: TcxBarEditItem;
    frxRep_4SOKB: TfrxReport;
    dxBarPopupMenu1: TdxBarPopupMenu;
    frAgreeProc: TfrxReport;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    aAgreeProc: TAction;
    cxLabel26: TcxLabel;
    teAdrR: TcxTextEdit;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure cxNazClick(Sender: TObject);
    procedure cxKorennoePropertiesChange(Sender: TObject);
    procedure cxVidOplatPropertiesChange(Sender: TObject);
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
    procedure aPrintExecute(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure aHistoryExecute(Sender: TObject);
    procedure actSendExecute(Sender: TObject);
    procedure bbCompanyClick(Sender: TObject);
    procedure odsUchastokBeforeOpen(DataSet: TDataSet);
    procedure cxPriemPropertiesChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aZaklExecute(Sender: TObject);
    procedure odsRgLaborantBeforeOpen(DataSet: TDataSet);
    procedure bVozrastClick(Sender: TObject);
    procedure aAgreeExecute(Sender: TObject);
    procedure aInfoExecute(Sender: TObject);
    procedure cxFamKeyPress(Sender: TObject; var Key: Char);
    procedure cxNameKeyPress(Sender: TObject; var Key: Char);
    procedure cxOtchKeyPress(Sender: TObject; var Key: Char);
    procedure aAgreeProcExecute(Sender: TObject);
    procedure frAgreeProcGetValue(const VarName: string; var Value: Variant);
  private
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
    GetNum : Boolean;
    Russian : HKL;
    function fGetIB(var nIBIDf, nIBYf: Integer): boolean;
    procedure DoPeriod;
    procedure DoGetAddress;
    procedure DoUpdateAddress(nIDPepl : Integer);
    procedure DoInsertProjivaet(nPACID : Integer);
    procedure DoInsertKorennoe(nIDPepl : Integer);
    procedure DoTub;
    procedure DoSumDoza;
    { Private declarations }
  public
    EDIT_MODE : Boolean;
    pAMBUL, pPACID, pPEPLID, pOTDELID, pTypeDocID, pSMIDID, pNAZID, pCOMPANYID : Integer;
    pDOCOBSLID : Integer;
    nIBID, nIBY,
    VFK_NAZSOSID : Integer;
    strFileName : String;
    procedure DoShowForm(nAmbul, nPACID, nPEPLID : Integer; strFIO : String; nOTDELID, nSMIDID : Integer; nNAZID : Integer=0);
    procedure DoTextTypeAmbul;
    procedure DoTextTypeStac;
    procedure DoTextTypeFIO(strFIO : String);
    function DoCheckParameters : Integer;
    procedure CheckEnabledControls;
    procedure DoTextTypeNaz;
    procedure DoInsertEditParametersNaz(nIdpepl : Integer);
    procedure DoTextParametersNaz;
    procedure DoUpdateStatusNaz;
    procedure DoUpdatePacIDNaz(nIDPAC : Integer);
    procedure DoPodpis;
    procedure DoProjivaet;
    procedure DoVidOplat;
    procedure DoTarget;
    procedure DoGetLaborant;
    procedure DoPriem;
    procedure DoApparat;
    procedure DoNumberFlu;
    procedure DoCompany;
    procedure DoCompanyDogovor;
    procedure DoUchastok;
    function Set_NewNum_For_Apparat : String;
    { Public declarations }
  end;

var
  frmLabNapravFlu: TfrmLabNapravFlu;

implementation

uses fMain, fAllHistory, fNazRgOne1, fCompanylist, fProsmotrZaklFlu, fPacInfo;

{$R *.dfm}

procedure TfrmLabNapravFlu.DoShowForm(nAMBUL, nPACID, nPEPLID : Integer; strFIO : String; nOTDELID, nSMIDID : Integer; nNAZID : Integer);
var ods : TOracleDataSet;
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
    cxLabel23.Visible := cxDoza.Visible;
    if pPACID = 0 then
      begin
        ods := TOracleDataSet.Create(nil);
        try
          ods.Session := frmMain.os;
          ods.SQL.Text := ' SELECT TUSLVID.FK_ID '+#13+
                        '   FROM asu.TUSLVID, asu.TOTDEL_TYPEDOC '+#13+
                        '  WHERE FL_DEFAULT = 1 '+#13+
             	          '    AND TOTDEL_TYPEDOC.FK_TYPEDOC = TUSLVID.FK_ID '+#13+
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
    0: DoTextTypeStac;  // стационарный
    1: DoTextTypeAmbul; // амбулаторный
    end;
    DoVidOplat;
    DoProjivaet;
    DoTarget;
    DoGetLaborant;
    DoPriem;
    DoApparat;
  {  if ((USE_ONE_ACCESSIONNUMBER=1) and (VFK_NAZSOSID=2)) then
    begin
    end else }
      DoNumberFlu;

    DoCompany;
    DoCompanyDogovor;
    DoPeriod;
    DoTub;
    DoUchastok;
    DoSumDoza;
    if pPACID = 0 then
      DoTextTypeFIO(strFIO);
    if pSMIDID <> 0 then
      DoTextTypeNaz;
    if pNAZID <> 0 then
      begin
        DoTextParametersNaz;
      end;
    aAgree.Visible := pPACID <> 0; // если нажали кнопку "Новый" то кнопку "Согласие" не показываем
  finally
    Cursor := crDefault;
  end;
end;

procedure TfrmLabNapravFlu.DoSumDoza;
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

procedure TfrmLabNapravFlu.DoTextTypeAmbul;
var ods : TOracleDataSet;
begin
  CheckEnabledControls;
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
        ods.SQL.Text := ' SELECT FL_VOV, FL_IVOV, FL_ULA, FL_PMC, FC_PUT, FK_PRIZN, '+#13+
		                   	'        TPEOPLES.FC_FAM, TPEOPLES.FC_IM, TPEOPLES.FC_OTCH, '+#13+
		                  	'        DECODE(TO_CHAR(TPEOPLES.FD_ROJD, ''dd.mm.yyyy hh24:mi:ss''), ''00.00.0000 00:00:00'', TRUNC(SYSDATE), TPEOPLES.FD_ROJD) FD_ROJD, '+#13+
		                  	'        TPEOPLES.FP_SEX, '+#13+
                        '        GET_IB(:PFK_ID) AS NUMDOC, '+#13+
                        '        asu.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TAMBULANCE.FK_ID) AS PACAGE, '+#13+
                        '        TPEOPLES.FC_PHONE AS PHONE, '+#13+
                        '        TAMBULANCE.FK_DOCOBSL, '+#13+
                        '        (SELECT FK_SMID FROM asu.TIB WHERE FK_PACID = :PFK_PEPLID AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM asu.TSMID WHERE FC_SYNONIM = ''KOREN_NASEL''))) AS KOREN '+#13+
                        '   FROM asu.TAMBULANCE, asu.TPEOPLES '+#13+
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

procedure TfrmLabNapravFlu.aSaveExecute(Sender: TObject);
var oqIns, oqEdit, oqDelNum : TOracleQuery;
    ods, odsPepl : TOracleDataSet;
    IDPac : Integer;
    idPepl : Integer;
    odsAmb : TOracleDataSet;
    hAgree : Integer;
    LoadAgree : TLoadAgree;      
begin
  idPepl := 0;
  cxdeRojd.PostEditValue;
  if DoCheckParameters = 0 then
    exit;
  if EDIT_MODE = TRUE then
    begin
      odsPepl := TOracleDataSet.Create(nil);
      oqEdit := TOracleQuery.Create(nil);  // открыли НАПРАВЛЕНИЕ, т.е. уже существующего паца(пипла, амбуланс)
      try
        odsPepl.Session := frmMain.os;
        odsPepl.SQL.Text := ' select fk_peplid from asu.tambulance where fk_id = :pfk_id ';
        odsPepl.DeclareAndSet('pfk_id', otInteger, pPACID);
        odsPepl.Open;
        oqEdit.Session := frmMain.os;
        oqEdit.Cursor := crSQLWait;
        oqEdit.SQL.Text := ' begin '+#13+
                           '   update asu.tambulance '+#13+
                           '      set fk_peplid=:pfk_peplid, fc_fam=:pfc_fam, fc_im=:pfc_im, fc_otch=:pfc_otch, fc_phone=:pfc_phone, '+#13+
                           '          fd_rojd=:pfd_rojd, fp_sex=:pfp_sex '+#13+
                           '    where fk_id = :pfk_id; '+#13+
                           '   update asu.tpeoples '+#13+
                           '      set fc_phone=:pfc_phone, '+#13+
                           '          fk_companyid=:pfk_companyid '+#13+
                           '    where fk_id=:pfk_peplid; '+#13+
                           ' end; ';
        oqEdit.DeclareAndSet('pFK_PEPLID', otInteger, odsPepl.FieldByName('fk_peplid').AsInteger);//pPEPLID);
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
        ods.Cursor := crSQLWait;
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
            oqIns.Session := frmMain.os;   //1. если такой пипл НЕ существует в базе
            oqIns.Cursor := crSQLWait;
            oqIns.SQL.Text := ' DECLARE '+#13+
	                            '   nTemp NUMBER; '+#13+
                              ' BEGIN '+#13+
		                          '   INSERT INTO asu.TAMBULANCE(FK_ID) VALUES(:PFK_ID) '+#13+ // инсертим запись в TAMBULANCE
                              '   RETURNING FK_ID INTO :PFK_ID; '+#13+
    		                      '   INSERT INTO asu.TPEOPLES(FC_FAM) VALUES(NULL) '+#13+ // инсертим запись в TPEOPLES
                              '   RETURNING FK_ID INTO :PFK_PEPLID; '+#13+
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
	                            '   0,:pFK_VRACHID, 0); '+#13+
                              '   UPDATE asu.TPEOPLES '+#13+
                              '      SET FC_FAM=:PFC_FAM, FC_IM=:PFC_IM, FC_OTCH=:PFC_OTCH, FP_SEX=:PFP_SEX, FD_ROJD=:PFD_ROJD, FC_RABOTA='''', '+#13+
                              '          FC_PHONE=:PFC_PHONE, FC_FAX=NULL, FC_E_MAIL=NULL, FC_HTTP=NULL, FK_DOCVID=-1, '+#13+
                              '          FC_DOCSER=NULL, FC_DOCNUM=NULL, FC_DOCVIDAN=NULL, FD_DOCDATE=NULL, '+#13+
                              '          FK_COMPANYID=:PFK_COMPANYID, FK_OTDEL=-1, FK_DOLGNOST=-1, FC_ROJDPLACE='' '', '+#13+
                              '          FK_GROUPID=-1 '+#13+
                              '    WHERE FK_ID=:PFK_PEPLID; '+#13+
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
            oqIns.Execute;
            frmMain.os.Commit;
            idPepl := oqIns.GetVariable('PFK_PEPLID');
            IDPac := oqIns.GetVariable('PFK_ID');
            DoInsertProjivaet(IDPac);
            DoInsertKorennoe(idPepl);
          end else
          begin
            odsAmb := TOracleDataSet.Create(nil);
            try
              odsAmb.Cursor := crSQLWait;
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
                  oqIns.Session := frmMain.os;      //2.3. на данного пипла нет амбулаторной карты => заводим новую
                  oqIns.Cursor := crSQLWait;
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
	                                  '   0,:pFK_VRACHID, 0); '+#13+
                                    '   UPDATE asu.TPEOPLES '+#13+
                                    '      SET FK_COMPANYID=:PFK_COMPANYID, FC_PHONE=:PFC_PHONE '+#13+
                                    '    WHERE FK_ID=:PFK_PEPLID; '+#13+
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
  if l_addr_loaded then //++kladr
    begin
      SaveAddrChanges; // Callback Возвращает ID адреса, если было добавление и 0 при изменении
      CommitAddrChanges;
    end;
  if EDIT_MODE = False then
    begin
      if IDPac <> 0 then
        DoUpdatePacIDNaz(IDPac);
      DoUpdateAddress(idPepl);
    end;
  if pPACID <> 0 then
    begin
      DoInsertProjivaet(pPACID);
    end;
  DoInsertEditParametersNaz(idPepl);
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
  DoUpdateStatusNaz;
  DoPodpis;
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
//------------------------------------------------------------------------------
  ModalResult := MrOK;
end;

procedure TfrmLabNapravFlu.aZaklExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  Application.CreateForm(TfrmProsmotrZaklFlu, frmProsmotrZaklFlu);
  frmProsmotrZaklFlu.merFIOMK.Properties.Editors[0].Value := cxFam.Text+' '+cxName.Text+' '+cxOtch.Text;
  frmProsmotrZaklFlu.rowNum.Properties.Value := cxNumIssl.Text;
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
    ods.SQL.Text := ' SELECT FK_NAZTYPEID, TRUNC(FD_RUN) AS FD_RUN, TRUNC(SYSDATE) AS SYS_DATE, '+
                    '       (SELECT MAX(FC_CHAR) FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME1'')) AS RESUME1, '+
                    '       (SELECT MAX(FC_CHAR) FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_RESUME2'')) AS RESUME2, '+
                    '       (SELECT DO_VRACHFIO(MAX(FN_NUM)) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_VRACH1'')) AS SOTR1, '+
                    '       (SELECT DO_VRACHFIO(MAX(FN_NUM)) FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_VRACH2'')) AS SOTR2 '+
                    '   FROM TNAZIS WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.Open;
    frmProsmotrZaklFlu.rowZakl1.Properties.Value := ods.FieldByName('RESUME1').AsString;
    frmProsmotrZaklFlu.rowZakl2.Properties.Value := ods.FieldByName('RESUME2').AsString;
    frmProsmotrZaklFlu.rowSotr1.Properties.Value := ods.FieldByName('SOTR1').AsString;
    frmProsmotrZaklFlu.rowSotr2.Properties.Value := ods.FieldByName('SOTR2').AsString;
  finally
    ods.Free;
  end;
  frmProsmotrZaklFlu.ShowModal;
  frmProsmotrZaklFlu.Free;
end;

procedure TfrmLabNapravFlu.aAgreeExecute(Sender: TObject);
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

procedure TfrmLabNapravFlu.aAgreeProcExecute(Sender: TObject);
begin
  frAgreeProc.ShowReport;
end;

procedure TfrmLabNapravFlu.aCancelExecute(Sender: TObject);
var oq, oqDelNum, oqDelNaz : TOracleQuery;
begin
  if (pPACID = 0) AND (cxNaz.Caption <> '<...>') then
    begin
      Application.MessageBox('Внимание! Вы добавили методику, но не зарегестрировали Нового пациента!'+
                             #13#10+'Методика будет удалена! ',
                             'Предупреждение!',
                             MB_ICONWARNING+MB_OK);
      oqDelNaz := TOracleQuery.Create(nil);
      try
        oqDelNaz.Session := frmMain.os;
        oqDelNaz.Cursor := crSQLWait;
        oqDelNaz.SQL.Text := ' DELETE FROM asu.TNAZIS WHERE FK_ID = :PFK_ID ';
        oqDelNaz.DeclareAndSet('PFK_ID', otInteger, cxNaz.Tag);
        oqDelNaz.Execute;
        frmMain.os.Commit;
      finally
        oqDelNaz.Free;
      end;
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

  if GetNum = True then
    begin
      oqDelNum := TOracleQuery.Create(nil);
      try
        oqDelNum.Session := frmMain.os;
        oqDelNum.Cursor := crSQLWait;
        oqDelNum.SQL.Text := ' UPDATE asu.TSMINI SET FC_VALUE = :PFC_VALUE WHERE FC_SECTION = ''SET_NEW_FLU_NUM''||TO_CHAR(:PKABID) ';
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

procedure TfrmLabNapravFlu.cxNazClick(Sender: TObject);
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
                           -1,
                           cxFam.Text+' '+cxName.Text+' '+cxOtch.Text,
                           pNAZID);
  frmNazRg1.ShowModal;
  frmMain.IDNaz := frmNazRg1.FDNazID;
  cxNaz.Tag := frmNazRg1.FDNazID;
  if frmMain.IDNaz <> 0 then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT GET_NAME_RGISSL(FK_SMID) AS NAMERG, TRUNC(FD_RUN) AS FD_RUN, TO_CHAR(FD_RUN, ''HH24:MI'') AS TIME_FD_RUN, '+
                        ' (SELECT FN_NORM0 FROM TSMID WHERE FK_ID = TNAZIS.FK_SMID) AS FN_DOZA '+
                        '   FROM TNAZIS WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
        ods.Open;
        cxNaz.Caption := ods.FieldByName('NAMERG').AsString;
        cxDoza.Text := ods.FieldByName('FN_DOZA').AsString;
        cxdeDateProtocol.Date := ods.FieldByName('FD_RUN').AsDateTime;
        cxteTimeProtocol.Text := ods.FieldByName('TIME_FD_RUN').AsString;
      finally
        ods.Free;
      end;
    end;
  frmNazRg1.Free;
end;

procedure TfrmLabNapravFlu.cxKorennoePropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
if pPEPLID <> 0 then
  begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT MAX(FK_ID) AS nTmp '+
                    '   FROM  TIB I '+
                    '  WHERE FK_PACID = :PFK_PACID '+ 
                    '    AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''KOREN_NASEL'')) ';
    ods.DeclareAndSet('PFK_PACID', otInteger, pPEPLID);
    ods.Open;
    if ods.FieldByName('nTmp').AsInteger = 0 then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_PACID, :pFK_SMID, :pFK_SMEDITID, :pFK_VRACHID) ';
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

procedure TfrmLabNapravFlu.cxVidOplatPropertiesChange(Sender: TObject);
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

procedure TfrmLabNapravFlu.cxPriemPropertiesChange(Sender: TObject);
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
        if ods.FieldByName('FC_NAME').AsString <> '' then
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

procedure TfrmLabNapravFlu.DoTextTypeFIO(strFIO: String);
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

procedure TfrmLabNapravFlu.cxFamClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmLabNapravFlu.cxFamEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmLabNapravFlu.cxFamKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '"', '№', ';', ':', '?', '=', '\', '/', '.', ',', '>', '<', '|', '[', ']', '{', '}'] then
    Key := #0;
end;

procedure TfrmLabNapravFlu.cxNameClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmLabNapravFlu.cxNameEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmLabNapravFlu.cxNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '"', '№', ';', ':', '?', '=', '\', '/', '.', ',', '>', '<', '|', '[', ']', '{', '}'] then
    Key := #0;
end;

procedure TfrmLabNapravFlu.cxOtchClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmLabNapravFlu.cxOtchEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmLabNapravFlu.cxOtchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '"', '№', ';', ':', '?', '=', '\', '/', '.', ',', '>', '<', '|', '[', ']', '{', '}'] then
    Key := #0;
end;

procedure TfrmLabNapravFlu.cxDSClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmLabNapravFlu.cxDSEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmLabNapravFlu.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TfrmLabNapravFlu.FormCreate(Sender: TObject);
var ods : TOracleDataSet;
begin
  russian:=LoadKeyboardLayout('00000419', 0);
//-->> "Заряжаем" датасеты
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
//-->> 2. Настройки
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' select asu.get_mrtkabs_for_xray(:pKabID) as res from dual ';
    ods.DeclareAndSet('pKabID', otInteger, frmMain.odsKab.FieldByName('FK_ID').AsInteger);
    ods.Open;
    cxDoza.Visible := ods.FieldByName('res').AsInteger <> 1; // графа "Доза" не показывается в кабинете(-ах) МРТ
    bbCompany.Visible := frmMain.get_show_work = '-1'; // показываем кнопку "Место работы" в зависимости от настроек
    if frmMain.get_show_agreepac = '-1' then
      bbAgree.Visible := ivAlways
    else
      bbAgree.Visible := ivNever;
  finally
    ods.Free;
  end;
end;

function TfrmLabNapravFlu.DoCheckParameters : Integer;
var nIBIDf, nIBYf : Integer;
//    DateCh : TDateTime;
    odsDate : TOracleDataSet;
    DateSys : TDateTime;
    ods : TOracleDataSet;
begin
  odsDate := TOracleDataSet.Create(nil);
  try
    odsDate.Session := frmMain.os;
    odsDate.Cursor := crSQLWait;
    odsDate.SQL.Text := ' select trunc(sysdate) as datesys from dual ';
//    odsDate.DeclareAndSet('pfk_peplid', otInteger, pPEPLID);
    odsDate.Open;
    DateSys := odsDate.FieldByName('datesys').AsDateTime;
//    DatePlan := odsDate.FieldByName('planFG').AsDateTime;
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

//  DateCh := DateSys;
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

  if cxNaz.Caption <> '<...>' then
    begin
      if (cxdeDateProtocol.Text = '') then
        begin
          Application.MessageBox('Вам необходимо указать ДАТУ ИССЛЕДОВАНИЯ!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
          cxdeDateProtocol.SetFocus;
          Result:= 0;
          exit;
        end;
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

function TfrmLabNapravFlu.fGetIB(var nIBIDf, nIBYf: Integer): boolean;
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
    oq.Cursor := crSQLWait;
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

procedure TfrmLabNapravFlu.odsVidDocBeforeOpen(DataSet: TDataSet);
begin
//  odsVidDoc.SetVariable('PFK_OTDELID', pOTDELID);
  odsVidDoc.SetVariable('PFK_ID', pPACID);
end;

procedure TfrmLabNapravFlu.DoTextTypeStac;
var ods : TOracleDataSet;
begin
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

procedure TfrmLabNapravFlu.DoTub;
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
        lbTub.Caption := 'На учете в тубдиспансере. '+#13+'Периодичность: '+ods.FieldByName('REC').AsString+#13+
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

procedure TfrmLabNapravFlu.CheckEnabledControls;
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

procedure TfrmLabNapravFlu.DoTextTypeNaz;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT GET_NAME_RGISSL(:PFK_SMIDID) AS NAMEISSL FROM DUAL ';
    ods.DeclareAndSet('PFK_SMIDID', otInteger, pSMIDID);
    ods.Open;
    cxNaz.Caption := ods.FieldByName('NAMEISSL').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmLabNapravFlu.DoInsertEditParametersNaz(nIdpepl : Integer);
var oqNaz : TOracleQuery;
begin
  if (frmMain.IDNaz <> 0) or (pNAZID <> 0) then
  begin
    oqNaz := TOracleQuery.Create(nil);
    try
      oqNaz.Session := frmMain.os;
      oqNaz.Cursor := crSQLWait;
//------------------------------------------------------------------------------
      if cxTarget.Text <> '' then //цель
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+
                            '   Cnt2 NUMBER; '+
                            ' BEGIN '+
                            '   SELECT COUNT(FK_ID) INTO Cnt2 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''ISSL_TARGET''));'+
                            ' IF Cnt2 > 0 THEN '+
                            '   UPDATE TIB SET FK_SMID = :pFK_SMID2, FK_SMEDITID =:pFK_SMEDITID2, FK_VRACHID =:pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''ISSL_TARGET'')); '+
                            ' ELSE '+
                            '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFK_SMID2, :pFK_SMEDITID2, :pFK_VRACHID); '+
                            ' END IF; '+
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
//------------------------------------------------------------------------------
      if (cxDoza.Text <> '') and (cxDoza.Text <> '0') then //доза -1
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+
                            '   Cnt9 NUMBER; '+
                            ' BEGIN '+
                            '   SELECT COUNT(FK_ID) INTO Cnt9 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1; '+
                            ' IF Cnt9 > 0 THEN '+
                            '   UPDATE TIB SET FN_NUM = :pFN_NUM9, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1; '+
                            ' ELSE '+
                            '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFN_NUM9, -1, -1, :pFK_VRACHID); '+
                            ' END IF; '+
                            ' END; ';
          if frmMain.IDNaz = 0 then
            oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID)
          else
            oqNaz.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
          oqNaz.DeclareAndSet('pFN_NUM9', otFloat, StrToFloat(cxDoza.Text));
          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
//------------------------------------------------------------------------------
      if (cxNumIssl.Text <> '') or (cxNumIssl.Text <> '0') then //номер исследования
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+
                            '   nSMID11 NUMBER; '+
                            '   Cnt11 NUMBER; '+
                            ' BEGIN '+
                            '   SELECT COUNT(FK_ID) INTO Cnt11 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_FLU_NUMBER''); '+
                            ' IF Cnt11 > 0 THEN '+
                            '   UPDATE TIB SET FC_CHAR = :pFC_CHAR11, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_FLU_NUMBER''); '+
                            ' ELSE '+
                            '   SELECT FK_ID INTO nSMID11 FROM TSMID WHERE FC_SYNONIM = ''XRAY_FLU_NUMBER''; '+
                            '   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFC_CHAR11, nSMID11, nSMID11, :pFK_VRACHID); '+
                            ' END IF; '+
                            ' END; ';
          if frmMain.IDNaz = 0 then
            oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID)
          else
            oqNaz.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
          oqNaz.DeclareAndSet('pFC_CHAR11', otString, cxNumIssl.Text);
          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          oqNaz.Execute;
          With TOracleQuery.Create(nil) do
          try
            Session:=frmMain.os;
            SQL.Text:=' UPDATE ASU.TNAZIS SET FC_TYPE = :PFC_TYPE, fc_accessionnumber = :PFC_TYPE WHERE FK_ID = :PFK_ID '; //
            DeclareAndSet('PFC_TYPE', otString, trim(cxNumIssl.Text));
            if frmMain.IDNaz = 0 then
              DeclareAndSet('PFK_ID', otInteger, pNAZID)
            else
              DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
            Execute;
          finally
            Free;
          end;
          frmMain.os.Commit;
        end;
//------------------------------------------------------------------------------
      if (cxTelefon.Visible = TRUE) and (cxTelefon.Text <> '') then //Контактный телефон
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+
                            '   nSMID13 NUMBER; '+
                            '   Cnt13 NUMBER; '+
                            ' BEGIN '+
                            '   SELECT COUNT(FK_ID) INTO Cnt13 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''KONTAKT_PHONE''); '+
                            ' IF Cnt13 > 0 THEN '+
                            '   UPDATE TIB SET FC_CHAR = :pFC_CHAR13, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''KONTAKT_PHONE''); '+
                            ' ELSE '+
                            '   SELECT FK_ID INTO nSMID13 FROM TSMID WHERE FC_SYNONIM = ''KONTAKT_PHONE''; '+
                            '   INSERT INTO TIB(FK_PACID, FC_CHAR, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :PFC_CHAR13, nSMID13, nSMID13, :pFK_VRACHID); '+
                            ' END IF; '+
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
      if cxRgLaborant.Text <> '' then //Рентген-лаборант
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+
                            '   nSMID15 NUMBER; '+
                            '   Cnt15 NUMBER; '+
                            ' BEGIN '+
                            '   SELECT COUNT(FK_ID) INTO Cnt15 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''RG_LABORANT''); '+
                            ' IF Cnt15 > 0 THEN '+
                            '   UPDATE TIB SET FN_NUM = :pFN_NUM15, FK_VRACHID = :pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''RG_LABORANT''); '+
                            ' ELSE '+
                            '   SELECT FK_ID INTO nSMID15 FROM TSMID WHERE FC_SYNONIM = ''RG_LABORANT''; '+
                            '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFN_NUM15, nSMID15, nSMID15, :pFK_VRACHID); '+
                            ' END IF; '+
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
      if cxVidOplat.Text <> '' then //способ оплаты
        begin
          oqNaz.DeleteVariables;
          oqNaz.SQL.Text := ' DECLARE '+
                            '   Cnt24 NUMBER; '+
                            ' BEGIN '+
                            '   SELECT COUNT(FK_ID) INTO Cnt24 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''AMBTALON_OPL'')); '+
                            ' IF Cnt24 > 0 THEN '+
                            '   UPDATE TIB SET FK_SMID = :pFK_SMID24, FK_SMEDITID =:pFK_SMEDITID24, FK_VRACHID =:pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''AMBTALON_OPL'')); '+
                            ' ELSE '+
                            '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFK_SMID24, :pFK_SMEDITID24, :pFK_VRACHID); '+
                            ' END IF; '+
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
          oqNaz.SQL.Text := ' DECLARE '+
                            '   Cnt14 NUMBER; '+
                            ' BEGIN '+
                            '   SELECT COUNT(FK_ID) INTO Cnt14 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_PRIEM'')); '+
                            ' IF Cnt14 > 0 THEN '+
                            '   UPDATE TIB SET FK_SMID = :pFK_SMID14, FK_SMEDITID =:pFK_SMEDITID14, FK_VRACHID =:pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_PRIEM'')); '+
                            ' ELSE '+
                            '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFK_SMID14, :pFK_SMEDITID14, :pFK_VRACHID); '+
                            ' END IF; '+
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
          oqNaz.SQL.Text := ' DECLARE '+
                            '   Cnt15 NUMBER; '+
                            ' BEGIN '+
                            '   SELECT COUNT(FK_ID) INTO Cnt15 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_APPARAT'')); '+
                            ' IF Cnt15 > 0 THEN '+
                            '   UPDATE TIB SET FK_SMID = :pFK_SMID15, FK_SMEDITID =:pFK_SMEDITID15, FK_VRACHID =:pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_APPARAT'')); '+
                            ' ELSE '+
                            '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFK_SMID15, :pFK_SMEDITID15, :pFK_VRACHID); '+
                            ' END IF; '+
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
              oqNaz.SQL.Text := ' DECLARE '+
                                '   Cnt26 NUMBER; '+
                                ' BEGIN '+
                                '   SELECT COUNT(FK_ID) INTO Cnt26 FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_COMPANY_DOGOVOR'')); '+
                                ' IF Cnt26 > 0 THEN '+
                                '   UPDATE TIB SET FK_SMID = :pFK_SMID26, FK_SMEDITID =:pFK_SMEDITID26, FK_VRACHID =:pFK_VRACHID WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_COMPANY_DOGOVOR'')); '+
                                ' ELSE '+
                                '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) VALUES(:pFK_ID, :pFK_SMID26, :pFK_SMEDITID26, :pFK_VRACHID); '+
                                ' END IF; '+
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
          oqNaz.SQL.Text := ' DELETE FROM TIB WHERE FK_PACID = :PFK_ID '+
                            ' AND GET_OWNER_FROM_SMID(FK_SMID) = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_COMPANY_DOGOVOR'') ';
          if frmMain.IDNaz = 0 then
            oqNaz.DeclareAndSet('PFK_ID', otInteger, pNAZID)
          else
            oqNaz.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
          oqNaz.Execute;
          frmMain.os.Commit;
        end;
//------------------------------------------------------------------------------
//      if (cxPeriod.Text <> '') and (cxPeriod.Enabled = True) then //Периодичность осмотров
//        begin
//          oqNaz.DeleteVariables;
//          oqNaz.SQL.Text := ' DECLARE '+#13+
//                            '   Cnt14 NUMBER; '+#13+
//                            ' BEGIN '+#13+
//                            '   SELECT COUNT(FK_ID) INTO Cnt14 '+#13+
//                            '     FROM TIB '+#13+
//                            '    WHERE FK_PACID = :PFK_ID '+#13+
//                            '      AND FK_SMID IN (SELECT FK_ID '+#13+
//                            '                        FROM TSMID '+#13+
//                            '                       WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_PERIOD_OSMOTROV'')); '+#13+
//                            ' IF Cnt14 > 0 THEN '+#13+
//                            '   UPDATE TIB SET FK_SMID = :pFK_SMID14, FK_SMEDITID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_PERIOD_OSMOTROV''), FK_VRACHID =:pFK_VRACHID '+#13+
//                            '    WHERE FK_PACID = :pFK_ID '+#13+
//                            '      AND FK_SMID IN (SELECT FK_ID '+#13+
//                            '                        FROM TSMID '+#13+
//                            '                       WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_PERIOD_OSMOTROV'')); '+#13+
//                            ' ELSE '+#13+
//                            '   INSERT INTO TIB(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13+
//                            '   VALUES(:pFK_ID, :pFK_SMID14, (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_PERIOD_OSMOTROV''), :pFK_VRACHID); '+#13+
//                            ' END IF; '+#13+
//                            ' END; ';
//          if pPEPLID = 0 then
//            oqNaz.DeclareAndSet('PFK_ID', otInteger, nIdPepl)
//          else
//            oqNaz.DeclareAndSet('PFK_ID', otInteger, pPEPLID);
//          oqNaz.DeclareAndSet('pFK_SMID14', otInteger, cxPeriod.EditValue);
//          oqNaz.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
//          oqNaz.Execute;
//          frmMain.os.Commit;
//        end;
    finally
      oqNaz.Free;
    end;
  end;
end;

procedure TfrmLabNapravFlu.DoInsertKorennoe(nIDPepl: Integer);
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

procedure TfrmLabNapravFlu.DoInsertProjivaet(nPACID: Integer);
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

procedure TfrmLabNapravFlu.DoTextParametersNaz;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT FK_NAZTYPEID, FD_RUN, FK_ISPOLID '+
                    '   FROM TNAZIS WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.Open;
    cxdeDateProtocol.Date := ods.FieldByName('FD_RUN').AsDateTime;
    cxteTimeProtocol.Time := ods.FieldByName('FD_RUN').AsDateTime;
//------------------------------------------------------------------------------
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' BEGIN '+
                    '   SELECT MAX(FN_NUM) INTO :nCNT_DOZA FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1; '+
                    ' IF :nCNT_DOZA IS NULL THEN '+
                    '   SELECT MAX(FN_NORM0) INTO :nCNT_DOZA FROM TSMID WHERE FK_ID = (SELECT FK_SMID FROM TNAZIS WHERE FK_ID = :pFK_ID); '+
                    ' END IF; '+
                    ' END; ';
    ods.DeclareAndSet('pFK_ID', otInteger, pNAZID);
    ods.DeclareVariable('nCNT_DOZA', otFloat);
    ods.Open;

    cxDoza.Text := FloatToStr(ods.GetVariable('nCNT_DOZA')); // доза
//------------------------------------------------------------------------------
  finally
    ods.Free;
  end;
end;

procedure TfrmLabNapravFlu.FormShow(Sender: TObject);
begin
  DoGetAddress;
  if cxFam.Enabled then
    cxFam.SetFocus;
end;

procedure TfrmLabNapravFlu.DoUpdateStatusNaz;
begin
//
end;

procedure TfrmLabNapravFlu.DoUchastok;
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

procedure TfrmLabNapravFlu.DoUpdateAddress(nIDPepl: Integer);
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

procedure TfrmLabNapravFlu.DoUpdatePacIDNaz(nIDPAC: Integer);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    oq.SQL.Text := ' UPDATE TNAZIS SET FK_PACID = :PFK_PACID WHERE FK_ID = :PFK_ID ';
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

procedure TfrmLabNapravFlu.cxdeRojdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TfrmLabNapravFlu.aPrintExecute(Sender: TObject);
//var ods : TOracleDataSet;
begin
//  ods := TOracleDataSet.Create(nil);
//  try
//    ods.Session := frmMain.os;
//    ods.Cursor := crSQLWait;
//    ods.SQL.Text := ' BEGIN '+
//                    '   SELECT PKG_REGIST_PACFUNC.GET_PAC_ADRFULL(:PFK_PACID) INTO :RES FROM DUAL; '+
//                    '   IF :RES IS NULL THEN '+
//                    '     SELECT ''Адрес не указан!'' INTO :RES FROM DUAL; '+
//                    '   END IF; '+
//                    ' END; ';
//    ods.DeclareVariable('RES', otString);
//    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
//    ods.Open;
//    if pPACID = 0 then //!!! временно пока Линников не сделает функцию
//      sAddress_4Rep := ''
//    else
//      sAddress_4Rep := ods.GetVariable('RES');
//  finally
//    ods.Free;
//  end;

  if frmMain.get_db_name = 'SO' then
    begin
      frxRep_4SOKB.ShowReport;
      exit;
    end;
  frxReport1.ShowReport;
end;

procedure TfrmLabNapravFlu.frAgreeProcGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'PACFIO' then Value := cxFam.Text+' '+cxName.Text+' '+cxOtch.Text;
  if VarName = 'NUMIB' then Value := cxNum.Text;
  if VarName = 'METODS' then Value := cxNaz.Caption;
end;

procedure TfrmLabNapravFlu.frxReport1GetValue(const VarName: String; var Value: Variant);
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
  if VarName = 'NUMISSL' then Value := cxNumIssl.Text;
  if cxNaz.Caption = '<...>' then
    begin
      if VarName = 'NAMEISSL' then Value := ''
    end else
    begin
      if VarName = 'NAMEISSL' then Value := cxNaz.Caption;
    end;
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
  if VarName = 'TARGET' then Value := cxTarget.Text;
  if VarName = 'KABINET' then Value := frmMain.odsKab.FieldByName('FC_NAME').AsString;
  if VarName = 'PHONEKAB' then Value := frmMain.odsKab.FieldByName('FC_PHONE').AsString;
  if VarName = 'PRIEM' then Value := cxPriem.Text;
  if VarName = 'APPARAT' then Value := cxApparat.Text;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.Medotradesign;  
end;

procedure TfrmLabNapravFlu.aHistoryExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmAllHistory, frmAllHistory);
  try
    frmAllHistory.DoShowForm(pPEPLID, cxFam.Text+' '+cxName.Text+' '+cxOtch.Text);
    frmAllHistory.ShowModal;
  finally
    frmAllHistory.Free;
  end;
end;

procedure TfrmLabNapravFlu.aInfoExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  Application.CreateForm(TfrmPacInfo, frmPacInfo);
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQl.Text := ' select asu.get_napravlen(:pfk_pacid, :pfk_id) as kem from dual ';
    ods.DeclareAndSet('pfk_pacid', otInteger, pPACID);
    ods.DeclareAndSet('pfk_id', otInteger, pNAZID);
    ods.Open;
    frmPacInfo.DoShowPacInfo(pPACID,
                             pPEPLID,
                             ods.FieldByName('kem').AsString);
    frmPacInfo.ShowModal;
  finally
    ods.Free;
    frmPacInfo.Free;
  end;
end;

procedure TfrmLabNapravFlu.DoPeriod;
//var ods : TOracleDataSet;
begin
//  ods := TOracleDataSet.Create(nil);
//  try
//    ods.Session := frmMain.os;
//    ods.SQL.Text := ' BEGIN '+
//                    '   SELECT MAX(FK_SMID) INTO :VAL '+#13+
//                    '     FROM TIB '+#13+
//                    '    WHERE FK_PACID = :PFK_ID '+#13+
//                    '      AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_PERIOD_OSMOTROV'')); '+#13+
//                    '   IF :VAL IS NULL THEN '+#13+
//                    '     SELECT MAX(FK_ID) INTO :VAL '+#13+
//                    '       FROM TSMID WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_PERIOD_OSMOTROV'') AND FK_DEFAULT = 1; '+#13+
//                    '   END IF; '+#13+
//                    ' END; ';
//    ods.DeclareAndSet('PFK_ID', otInteger, pPEPLID);
//    ods.DeclareVariable('VAL', otInteger);
//    ods.Open;
//    cxPeriod.EditValue := ods.GetVariable('VAL');
//  finally
//    ods.Free;
//  end;
end;

procedure TfrmLabNapravFlu.DoPodpis;
var oq, oqPod : TOracleQuery;
    ods : TOracleDataSet;
    odsStatus : TOracleDataSet;
    Status : Integer;
begin
  odsStatus := TOracleDataSet.Create(nil);
  try
    odsStatus.Session := frmMain.os;
    odsStatus.Cursor := crSQLWait;
    odsStatus.SQL.Text := ' select fk_nazsosid from asu.tnazis where fk_id = :pfk_id ';
    if frmMain.IDNaz = 0 then
      odsStatus.DeclareAndSet('PFK_ID', otInteger, pNAZID)
    else
      odsStatus.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz);
    odsStatus.Open;
    Status := odsStatus.FieldByName('FK_NAZSOSID').AsInteger;
  finally
    odsStatus.Free;
  end;
  if (frmMain.IDNaz <> 0) or (pNAZID <> 0) then
    begin
      if Status <> GET_VIPNAZ then 
        begin
          oq := TOracleQuery.Create(nil);
          try
            oq.Session := frmMain.os;
            oq.Cursor := crSQLWait;
            oq.SQL.Text := ' update asu.tnazis '+#13+
                           '    set fk_nazsosid=:pfk_nazsosid, fk_ispolid=:pfk_ispolid, fd_run=:pfd_run, fl_in_raspis = 1 '+#13+
                           '  where fk_id=:pfk_nazid ';
            oq.DeclareAndSet('pFK_ISPOLID', otInteger, cxRgLaborant.EditValue);
            oq.DeclareAndSet('pFD_RUN', otDate, StrToDateTime(DateToStr(cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn:ss', IncSecond(cxteTimeProtocol.Time, 1))));
            if frmMain.IDNaz = 0 then
              oq.DeclareAndSet('pFK_NAZID', otInteger, pNAZID)
            else
							oq.DeclareAndSet('pFK_NAZID', otInteger, frmMain.IDNaz);
            oq.DeclareAndSet('PFK_NAZSOSID', otInteger, GET_LABVIP);
            oq.Execute;
            frmMain.os.Commit;
          finally
            oq.Free;
          end;
        end;
//------------------------------------------------------------------------------
            ods := TOracleDataSet.Create(nil);
            oqPod := TOracleQuery.Create(nil);
            try
              ods.Session := frmMain.os;
              ods.Cursor := crSQLWait;
              ods.SQL.Text := ' select * from asu.tpodpisnaz where fk_nazid =:pfk_nazid and fk_sotrid = :pfk_sotrid ';
						  if frmMain.IDNaz = 0 then
							  ods.DeclareAndSet('pFK_NAZID', otInteger, pNAZID)
						  else
							  ods.DeclareAndSet('pFK_NAZID', otInteger, frmMain.IDNaz);
              ods.DeclareAndSet('pFK_SOTRID', otInteger, cxRgLaborant.EditValue);
              ods.Open;
              if ods.RecordCount > 0 then
                begin
                  oqPod.Session := frmMain.os;
                  oqPod.Cursor := crSQLWait;
                  oqPod.DeleteVariables;
								  oqPod.SQL.Text := ' UPDATE ASU.TPODPISNAZ '+#13+
                                    '    SET FK_SOS = asu.GET_LABVIP, FD_DATE = SYSDATE, FD_INS = :pFD_INS '+#13+
                                    '  WHERE FK_NAZID = :pFK_NAZID AND FK_SOTRID = :pFK_SOTRID ';
                  oqPod.DeclareAndSet('pFD_INS', otDate, StrToDateTime(DateToStr(cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn', cxteTimeProtocol.Time)));
								  if frmMain.IDNaz = 0 then
								   	oqPod.DeclareAndSet('pFK_NAZID', otInteger, pNAZID)
								  else
								  	oqPod.DeclareAndSet('pFK_NAZID', otInteger, frmMain.IDNaz);
                  oqPod.DeclareAndSet('pFK_SOTRID', otInteger, cxRgLaborant.EditValue);
                  oqPod.Execute;
                  frmMain.os.Commit;
                end else
                begin
                  oqPod.Session := frmMain.os;
                  oqPod.Cursor := crSQLWait;
                  oqPod.DeleteVariables;
                  oqPod.SQL.Text := ' INSERT INTO ASU.TPODPISNAZ(FK_NAZID, FK_SOTRID, FK_SOS, FD_DATE, FD_INS) '+#13+
								   						    	' VALUES(:pFK_NAZID, :pFK_SOTRID, asu.GET_LABVIP, SYSDATE, :pFD_INS) ';
                  if frmMain.IDNaz = 0 then
								   	oqPod.DeclareAndSet('pFK_NAZID', otInteger, pNAZID)
								  else
									  oqPod.DeclareAndSet('pFK_NAZID', otInteger, frmMain.IDNaz);
                  oqPod.DeclareAndSet('pFK_SOTRID', otInteger, cxRgLaborant.EditValue);
                  oqPod.DeclareAndSet('pFD_INS', otDate, StrToDateTime(DateToStr(cxdeDateProtocol.Date)+' '+FormatDateTime('hh:nn', cxteTimeProtocol.Time)));
                  oqPod.Execute;
                  frmMain.os.Commit;
                end;
            finally
              ods.Free;
              oqPod.Free;
            end;
    //    end;
    end;
end;

procedure TfrmLabNapravFlu.DoProjivaet;
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

procedure TfrmLabNapravFlu.DoVidOplat;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' BEGIN '+
                    '   SELECT MAX(FK_SMID) INTO :VAL '+
                    '     FROM TIB WHERE FK_PACID = :PFK_PEPLID '+
                    '      AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''AMBTALON_OPL'')); '+
                    '   IF :VAL IS NULL THEN '+
                    '     SELECT DECODE((SELECT TO_NUMBER(FC_VALUE) FROM TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DEFAULT_VID_OPLAT''), '+
                    '                    NULL, 0, '+
                    '                    (SELECT TO_NUMBER(FC_VALUE) FROM TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''DEFAULT_VID_OPLAT'')) '+
                    '            INTO :VAL FROM DUAL ; '+
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

procedure TfrmLabNapravFlu.DoTarget;
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
                    '     FROM DUAL ; '+
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

procedure TfrmLabNapravFlu.DoGetAddress;
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

procedure TfrmLabNapravFlu.DoGetLaborant;
var ods : TOracleDataSet;
begin
  if frmmain.list_xray_curr_vrach_as_owner = 1 then
   begin
    cxRgLaborant.editvalue := frmmain.psotrid;
    cxRgLaborant.enabled := (frmMain.get_can_change_vrach = 1) or (cxRgLaborant.EditValue = null) or (cxRgLaborant.EditValue = 1) or (cxRgLaborant.Text = '');
   end
  else
   begin
    ods := TOracleDataSet.Create(nil);
    try
      ods.Session := frmMain.os;
      ods.SQL.Text := ' BEGIN '+
                      '   SELECT MAX(FN_NUM) INTO :VAL '+
                      '     FROM TIB '+
                      '    WHERE FK_PACID = :PFK_PEPLID '+
                      '      AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''RG_LABORANT''); '+
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

procedure TfrmLabNapravFlu.DoPriem;
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
                    '     SELECT MAX(FK_ID) INTO :VAL '+
                    '       FROM TSMID '+
                    '      WHERE FK_OWNER = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_PRIEM'') AND FK_DEFAULT = 1; '+
                    '   END IF; '+
                    ' END; ';
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.DeclareVariable('VAL', otInteger);
    ods.Open;
    cxPriem.EditValue := ods.GetVariable('VAL');
  finally
    ods.Free;
  end;
end;

procedure TfrmLabNapravFlu.DoApparat;
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
    ods.DeclareAndSet('PFK_ID', otInteger, pNAZID);
    ods.DeclareVariable('VAL', otInteger);
    ods.Open;
    cxApparat.EditValue := ods.GetVariable('VAL');
  finally
    ods.Free;
  end;
end;

procedure TfrmLabNapravFlu.DoNumberFlu;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    if frmMain.GET_DB_NAME = 'XA' then //только для хабаровска //Melnikov 2014.09.11
    begin
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
//                    '     :get_num := to_char(asu.set_newflunum(:pKabID)); '+#13+
                    '     :get_num := to_char(asu.set_newflunum); '+#13+
                    '   end if; '+#13+
                    '   close cNum; '+#13+
                    ' end; ';
    end else begin
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
//                    '     :get_num := to_char(asu.set_newflunum); '+#13+
                    '   end if; '+#13+
                    '   close cNum; '+#13+
                    ' end; ';
      ods.DeclareAndSet('pKabID', otInteger, frmMain.odsKab.FieldByName('fk_id').AsInteger);
//    ods.SQL.Text := ' DECLARE '+ // !!! изменено 09.12.2010 по истечение 2-ух месяцев удалить
//                    ' nCNT NUMBER; '+
//                    ' BEGIN '+
//                    '   :VAL := TO_CHAR(0); '+
//                    '   SELECT COUNT(FK_ID) INTO nCNT FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_FLU_NUMBER''); '+
//                    '   IF nCNT > 0 THEN '+
//                    '     SELECT MAX(FC_CHAR) INTO :VAL FROM TIB WHERE FK_PACID = :PFK_ID AND FK_SMID = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''XRAY_FLU_NUMBER''); '+
//                    '   ELSE '+
//                    '     :GET_NUM := TO_CHAR(ASU.SET_NEWFLUNUM); '+
//                    '   END IF; '+
//                    ' END; ';
    end;
    if pNAZID <> 0 then
      ods.DeclareAndSet('PFK_ID', otInteger, pNAZID)
    else
      ods.DeclareAndSet('PFK_ID', otInteger, -1);
    ods.DeclareVariable('VAL', otString);
    ods.DeclareVariable('GET_NUM', otInteger);
   // ods.DeclareAndSet('pKabID', otInteger, frmMain.odsKab.FieldByName('fk_id').AsInteger);
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

procedure TfrmLabNapravFlu.actSendExecute(Sender: TObject);
var str : TStringList;
    strDate : String;
    year, month, day : Word;
    ods : TOracleDataSet;
    sSysDate : String;
    sConnectString : String;
    NewNum_For_Apparat : String;
    //
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
  DLL_HANDLE: THandle;
  v_atris_mssql_conn_str,
  v_atris_use,
  v_fc_aetitle,
  v_pol : string;
  odsListNaz : TOracleDataSet;
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
begin
  if Trim(cxNumIssl.Text)='' then
  begin
    MessageDlg('Не задан № протокола исследования', mtWarning, [mbOK], 0);
    Exit;
  end;
  v_atris_use := f_gtTSMINI('DLL_WORKLIST_NAZN','atris_use');
  v_atris_mssql_conn_str := f_gtTSMINI('DLL_WORKLIST_NAZN','atris_mssql_conn_str');
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
              //  if Trim(cxNumIssl.Text)='' then cxNumIssl.Text:='AN'+IntToStr(odsListNaz.FieldByName('fk_id').AsInteger);
                  if cxMale.Checked = True then
                    v_pol := 'M'
                  else
                    v_pol := 'F';
                odsListNaz := TOracleDataSet.Create(nil);
                try
                  odsListNaz.Session:=frmMain.os;
                  odsListNaz.SQL.Text:='select t.* FROM ASU.TNAZIS t where t.fk_id=:p_fk_id';
                  odsListNaz.DeclareAndSet('p_fk_id',otInteger, cxNaz.Tag ); // frmMain.IDNaz);
                  odsListNaz.Open;
                  odsListNaz.First;
                  if not odsListNaz.Eof then
                  begin
                    ods := TOracleDataSet.Create(nil);
                    try
                      ods.Session := frmMain.os;
                      ods.Cursor := crSQLWait;
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
                    finally
                      ods.Free;
                    end;
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
                                   cxNumIssl.Text, // odsListNaz.FieldByName('fc_accessionnumber').AsString, // cxNumIssl.Text,    // AccessionNumber
                                   ''  // StudyInstanceUID
                                 );
                  end;
                finally
                  odsListNaz.Close;
                  odsListNaz.Free;
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
    if FileExists(strFileName) <> True then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT TRUNC(SYSDATE) AS DATESYS, '+#13+
                        '        (SELECT FC_VALUE FROM asu.TSMINI WHERE FC_SECTION = ''CONNECT_STRING'' AND FC_KEY = ''FLU_APPARAT'') AS CONNECTSTR FROM DUAL ';
        ods.Open;
        sSysDate := FormatDateTime('yyyy', ods.FieldByName('DATESYS').AsDateTime) + FormatDateTime('mm', ods.FieldByName('DATESYS').AsDateTime) + FormatDateTime('dd', ods.FieldByName('DATESYS').AsDateTime);
        sConnectString := ods.FieldByName('CONNECTSTR').AsString;
        NewNum_For_Apparat := Set_NewNum_For_Apparat;
      finally
        ods.Free;
      end;
      DecodeDate(cxdeRojd.Date, year, month, day);
      strDate := FormatDateTime('yyyy', cxdeRojd.Date)+FormatDateTime('mm', cxdeRojd.Date)+FormatDateTime('dd', cxdeRojd.Date);
      str := TStringList.Create;
      str.Append('(0x0008, 0x0005, CS, "ISO_IR 144")');
      str.Append('(0x0008, 0x0050, SH, "'+cxNumIssl.Text+'")'); //номер по порядку в течение дня
      str.Append('(0x0010, 0x0010, PN, "'+cxFam.Text+'^'+cxName.Text+'^'+cxOtch.Text+'")');
      str.Append('(0x0010, 0x0020, LO, "'+cxNumIssl.Text+'")');
      str.Append('(0x0010, 0x0030, DA, "'+strDate+'")'); // дата рождения
      if cxMale.Checked = TRUE then
        str.Append('(0x0010, 0x0040, CS, "M")')
      else
        str.Append('(0x0010, 0x0040, CS, "F")');
      str.Append('(0x0010, 0x1000, LO, "")');
      str.Append('(0x0020, 0x000D, UI, "1.3.643.1.2002.'+NewNum_For_Apparat+'.5")'); // идентификатор ???
      str.Append('(0x0040, 0x0100, SQ,');
      str.Append('{');
      str.Append('(0x0008, 0x0060, CS, "CR")');
      str.Append('(0x0040, 0x0002, DA, "'+sSysDate+'")');
      str.Append('(0x0040, 0x0003, TM, "112")'); //номер ?
      str.Append('}');
      if not DirectoryExists(sConnectString) then
        ForceDirectories(sConnectString);
      str.SaveToFile(sConnectString + '\' + NewNum_For_Apparat + '.pat');
      str.Free;
      strFileName := sConnectString + '\' + NewNum_For_Apparat + '.pat';
    end;
  end;
end;

procedure TfrmLabNapravFlu.bbCompanyClick(Sender: TObject);
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

procedure TfrmLabNapravFlu.bVozrastClick(Sender: TObject);
var ods : TOracleDataSet;
begin
  if cxdeRojd.Text <> '' then
  begin
    if cxdeRojd.Date > frmMain.get_systemdate then
      begin
        MessageDlg( 'Вы ввели дату рождения пациента больше сегодняшней даты!'+#13+#10+
                    'Это недопустимо!'+#13+#10+'Установите правильную дату рождения пациента!',
                    mtWarning, [mbOK], 0);
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

procedure TfrmLabNapravFlu.DoCompany;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT GET_COMPANY_LONGNAME(FK_COMPANYID) AS COMPANYNAME, FK_COMPANYID '+
                    '   FROM TPEOPLES '+
                    '  WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pPEPLID);
    ods.Open;
    cxCompany.Text := ods.FieldByName('COMPANYNAME').AsString;
    cxCompany.Tag := ods.FieldByName('FK_COMPANYID').AsInteger;
  finally
    ods.Free;
  end;
end;

procedure TfrmLabNapravFlu.DoCompanyDogovor;
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

function TfrmLabNapravFlu.Set_NewNum_For_Apparat: String;
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

procedure TfrmLabNapravFlu.odsRgLaborantBeforeOpen(DataSet: TDataSet);
begin
  odsRgLaborant.SetVariable('PFK_OTDELID', frmMain.pOTDELID);
end;

procedure TfrmLabNapravFlu.odsUchastokBeforeOpen(DataSet: TDataSet);
begin
  odsUchastok.SetVariable('PUSLVID', pTypeDocID);
end;

end.
