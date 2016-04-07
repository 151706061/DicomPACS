unit fFastRegist;

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
  cxDBData, cxButtonEdit, Buttons, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxBarPainter, cxClasses, Menus, cxLookAndFeelPainters, cxButtons,
  dxSkinOffice2007Green;

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

  TfrmFastRegist = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    Panel1: TPanel;
    il: TImageList;
    al: TActionList;             
    paFIO: TPanel;
    paSex: TPanel;
    cxLabel2: TcxLabel;
    cxMale: TcxRadioButton;
    cxFemale: TcxRadioButton;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    bbSave: TdxBarButton;
    aSave: TAction;
    bbCancel: TdxBarButton;
    aCancel: TAction;
    paAddress: TPanel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    odsRegPrin: TOracleDataSet;
    dsRegPrin: TDataSource;
    cxProjivaet: TcxLookupComboBox;
    cxKorennoe: TcxLookupComboBox;
    dsKorennoe: TDataSource;
    odsKorennoe: TOracleDataSet;
    cxLabel1: TcxLabel;
    cxFam: TcxTextEdit;
    cxName: TcxTextEdit;
    cxOtch: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel11: TcxLabel;
    cxAge: TcxLabel;
    cxAddress: TMemo;
    cxLabel10: TcxLabel;
    cxNum: TcxTextEdit;
    bVozrast: TcxButton;
    cxdeRojd: TcxDateEdit;
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
    procedure FormShow(Sender: TObject);
    procedure cxdeRojdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxAddressClick(Sender: TObject);
    procedure cxAddressEnter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bVozrastClick(Sender: TObject);
  private
    isAgreePacient : Boolean; //--> включена ли настройка "Согласие пациента" ('-1' - включена, 'другое значение' - выключена)
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
    pUSLVIDID : Integer; // ID вида амбулаторной карты (пока это карта КДП - взрослой поликлиники)
    Russian : HKL;
    function fGetIB(var nIBIDf, nIBYf: Integer): boolean;
    procedure DoInsertKorennoe(nIDPepl : Integer);
    procedure DoInsertProjivaet(nPACID : Integer);
    procedure DoGetAddress;
    procedure DoUpdateAddress(nIDPepl : Integer);
    { Private declarations }
  public
    sNUMBERISSL : String;
    EDIT_MODE : Boolean;
    pAMBUL, pSOTRID, pPACID, pPEPLID, pOTDELID, pSMIDID, pNAZID : Integer;
    pDOCOBSLID : Integer;
    nIBID, nIBY : Integer;
    procedure DoShowfrmRegistrAmbPac(nAmbul, nSOTRID, nPACID, nPEPLID : Integer; strFIO : String; nOTDELID, nSMIDID : Integer; nNAZID : Integer=0; nNUMBERISSL : String='');
    procedure DoTextTypeAmbul;
    procedure DoTextTypeFIO(strFIO : String);
    function DoCheckParameters : Integer;
    procedure CheckEnabledControls;
    procedure DoProjivaet;
    { Public declarations }
  end;

var
  frmFastRegist: TfrmFastRegist;

implementation

uses fMain;

{$R *.dfm}

procedure TfrmFastRegist.DoShowfrmRegistrAmbPac(nAMBUL, nSOTRID, nPACID, nPEPLID : Integer; strFIO : String; nOTDELID, nSMIDID : Integer; nNAZID : Integer; nNUMBERISSL : String);
begin
  try
    Cursor := crSQLWait;
    pAMBUL := nAMBUL;
    pSOTRID := nSOTRID;
    pPACID := nPACID;
    pPEPLID := nPEPLID;
    pOTDELID := nOTDELID;
    pSMIDID := nSMIDID;
    pNAZID := nNAZID;
    sNUMBERISSL := nNUMBERISSL;

    DoTextTypeAmbul;
    DoProjivaet;
    DoTextTypeFIO(strFIO);
  finally
    Cursor := crDefault;
  end;
end;

procedure TfrmFastRegist.DoTextTypeAmbul;
var ods : TOracleDataSet;
begin
  CheckEnabledControls;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' DECLARE '+
                    '   nTemp NUMBER; '+
                    ' BEGIN '+
                    '   SELECT TUSLVID.FK_ID INTO :PFK_USLVIDID '+
                    '     FROM ASU.TUSLVID, ASU.TOTDEL_TYPEDOC '+
                    '    WHERE FL_DEFAULT = 1 '+
        	          '      AND TOTDEL_TYPEDOC.FK_TYPEDOC=TUSLVID.FK_ID '+
         	          '      AND TOTDEL_TYPEDOC.FK_OTDELID = :POTDELID AND ROWNUM = 1; '+
                    '   :NDOCOBSLID:= SET_NEWIBNUM(:PFK_USLVIDID, nTemp); '+
                    '   SELECT TDOCOBSL.FK_NUMIB INTO :nFK_NUMIB FROM TDOCOBSL WHERE FK_ID = :NDOCOBSLID; '+
                    '   SELECT TO_CHAR(GET_YEARWORK) INTO :YEARWORK FROM DUAL; '+
                    ' END; ';
    ods.DeclareVariable('PFK_USLVIDID', otInteger);
    ods.DeclareVariable('NDOCOBSLID', otInteger);
    ods.DeclareVariable('YEARWORK', otString);
    ods.DeclareVariable('nFK_NUMIB', otInteger);
    ods.DeclareAndSet('POTDELID', otInteger, pOTDELID);
    ods.Open;
    pDOCOBSLID := ods.GetVariable('NDOCOBSLID');
    pUSLVIDID := ods.GetVariable('PFK_USLVIDID');
    cxNum.Text := IntToStr(ods.GetVariable('nFK_NUMIB'))+'/'+ods.GetVariable('YEARWORK');
    EDIT_MODE := FALSE;
  finally
    ods.Free;
  end;
end;

procedure TfrmFastRegist.aSaveExecute(Sender: TObject);
var oqIns : TOracleQuery;
    ods : TOracleDataSet;
    odsAmb : TOracleDataSet;
    idPepl : Integer;
    hAgree : Integer;
    LoadAgree : TLoadAgree;
begin
  if DoCheckParameters = 0 then //проверка заполнения обязательных полей
    exit;
  cxdeRojd.PostEditValue;

  ods := TOracleDataSet.Create(nil);
  oqIns := TOracleQuery.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_ID '+
                    '   FROM asu.TPEOPLES '+
                    '  WHERE FC_FAM = '''+TRIM(cxFam.Text)+''''+
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
        oqIns.Session := frmMain.os;  // 1. если такой пипл НЕ существует в базе
        oqIns.Cursor := crSQLWait;
        oqIns.SQL.Text := ' DECLARE '+
	                        '   nTemp NUMBER; '+
                          ' BEGIN '+
		                      '   INSERT INTO TAMBULANCE(FK_ID) VALUES(:PFK_ID) '+ //инсертим запись в TAMBULANCE
                          '   RETURNING FK_ID INTO :PFK_ID; '+
    		                  '   INSERT INTO TPEOPLES(FC_FAM) VALUES(NULL) '+ //инсертим запись в TPEOPLES
                          '   RETURNING FK_ID INTO :PFK_PEPLID; '+
        	                '   :NDOCOBSLID:= SET_NEWIBNUM(:PFK_USLVIDID, nTemp); '+
                		      '   UPDATE TAMBULANCE SET '+
			                    '   FK_IBID = nTemp, '+
			                    '   FK_IBY = TO_CHAR(GET_YEARWORK), '+
			                    '   FK_PEPLID = :PFK_PEPLID, '+
			                    '   FK_DOCOBSL = :NDOCOBSLID '+
	                        '	  WHERE FK_ID = :PFK_ID; '+
                          '   EDIT_AMBULANCE '+
                          '   (0,:pFK_PEPLID,:pFC_FAM,:pFC_IM,:pFC_OTCH,:pFC_ADR,'''',NULL,:pFC_RECOM, '+
	                        '   :pFD_ROJD,:pFP_SEX,0,0,0,:pFK_ID,6,0,nTemp,TO_CHAR(GET_YEARWORK), '+
	                        '   0,:pFK_VRACHID   ); '+
                          '   UPDATE TPEOPLES '+
                          '   SET FC_FAM=:PFC_FAM, FC_IM=:PFC_IM, FC_OTCH=:PFC_OTCH, FP_SEX=:PFP_SEX, FD_ROJD=:PFD_ROJD, FC_RABOTA='''', '+
                          '   FC_PHONE=NULL, FC_FAX=NULL, FC_E_MAIL=NULL, FC_HTTP=NULL, FK_DOCVID=-1, '+
                          '   FC_DOCSER=NULL, FC_DOCNUM=NULL, FC_DOCVIDAN=NULL, FD_DOCDATE=NULL, '+
                          '   FK_COMPANYID=-1, FK_OTDEL=-1, FK_DOLGNOST=-1, FC_ROJDPLACE='' '', '+
                          '   FK_GROUPID=-1 '+
                          '   WHERE FK_ID=:PFK_PEPLID; '+
                          ' END; ';
        oqIns.DeclareAndSet('PFK_USLVIDID', otInteger, pUSLVIDID);
        oqIns.DeclareVariable('PFK_ID', otInteger);
        oqIns.DeclareVariable('PFK_PEPLID', otInteger);
        oqIns.DeclareVariable('NDOCOBSLID', otInteger);
        oqIns.DeclareAndSet('PFC_FAM', otString, cxFam.Text);
        oqIns.DeclareAndSet('pFC_IM', otString, cxName.Text);
        oqIns.DeclareAndSet('pFC_OTCH', otString, cxOtch.Text);
        oqIns.DeclareAndSet('pFC_ADR', otString, cxAddress.Text);
        oqIns.DeclareAndSet('pFC_RECOM', otString, '');
        oqIns.DeclareAndSet('pFD_ROJD', otDate, cxdeRojd.Date);
        if cxMale.Checked = TRUE then
          oqIns.DeclareAndSet('pFP_SEX', otInteger, 1)
        else
          oqIns.DeclareAndSet('pFP_SEX', otInteger, 0);
        oqIns.DeclareAndSet('pFK_VRACHID', otInteger, pSOTRID);
        oqIns.Execute;
        frmMain.os.Commit;
        idPepl := oqIns.GetVariable('PFK_PEPLID');
        DoInsertProjivaet(oqIns.GetVariable('PFK_ID'));
        DoInsertKorennoe(idPepl);
      end else
      begin // 2. если такой пипл существует в базе
        odsAmb := TOracleDataSet.Create(nil);
        try
          odsAmb.Cursor := crSQLWait;
          odsAmb.Session := frmMain.os;
          odsAmb.SQL.Text := '   SELECT TAMBULANCE.FK_ID, '+
                             '          FK_IBID, FK_IBY, TO_CHAR(TDOCOBSL.FK_NUMIB)||''/''||TO_CHAR(TDOCOBSL.FN_YEAR) AS NUMMK, '+
                             '          FC_FAM||'' ''||FC_IM||'' ''||FC_OTCH AS FIO, '+
                             '          TO_CHAR(FD_ROJD, ''DD.MM.YYYY'') AS DATEROJD, FK_PEPLID, FK_VIDDOCID '+
                             '     FROM ASU.TAMBULANCE, ASU.TDOCOBSL '+
                             '    WHERE TAMBULANCE.FK_DOCOBSL = TDOCOBSL.FK_ID '+
                             '      AND TAMBULANCE.FK_PEPLID = :PFK_PEPLID '+
                             '      AND TDOCOBSL.FK_VIDDOCID = :PFK_VIDDOCID ';
          odsAmb.DeclareAndSet('PFK_VIDDOCID', otInteger, pUSLVIDID);
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
              oqIns.Cursor := crSQLWait;
              oqIns.SQL.Text := ' DECLARE '+
	                              '   nTemp NUMBER; '+
                                ' BEGIN '+
		                            '   INSERT INTO TAMBULANCE(FK_ID) '+
                                '   VALUES(:PFK_ID) '+
                                '   RETURNING FK_ID INTO :PFK_ID; '+
        	                      '   :NDOCOBSLID:= SET_NEWIBNUM(:PFK_USLVIDID, nTemp); '+
                		            '   UPDATE TAMBULANCE SET FK_IBID = nTemp, '+
			                          '                         FK_IBY = TO_CHAR(GET_YEARWORK), '+
			                          '                         FK_PEPLID = :PFK_PEPLID, '+
			                          '                         FK_DOCOBSL = :NDOCOBSLID '+
	                              '	   WHERE FK_ID = :PFK_ID; '+
                                '   EDIT_AMBULANCE '+
                                '   (0,:pFK_PEPLID,:pFC_FAM,:pFC_IM,:pFC_OTCH,:pFC_ADR,'''',NULL,'''', '+
	                              '   :pFD_ROJD,:pFP_SEX,0,0,0,:pFK_ID,6,0,nTemp,TO_CHAR(GET_YEARWORK), '+
	                              '   0,:pFK_VRACHID   ); '+
                                ' END; ';
              oqIns.DeclareVariable('PFK_ID', otInteger);
              oqIns.DeclareAndSet('PFK_PEPLID', otInteger, idPepl);
              oqIns.DeclareVariable('NDOCOBSLID', otInteger);
              oqIns.DeclareAndSet('PFK_USLVIDID', otInteger, pUSLVIDID);
              oqIns.DeclareAndSet('PFC_FAM', otString, cxFam.Text);
              oqIns.DeclareAndSet('pFC_IM', otString, cxName.Text);
              oqIns.DeclareAndSet('pFC_OTCH', otString, cxOtch.Text);
              oqIns.DeclareAndSet('pFC_ADR', otString, cxAddress.Text);
              oqIns.DeclareAndSet('pFD_ROJD', otDate, cxdeRojd.Date);
              if cxMale.Checked = TRUE then
                oqIns.DeclareAndSet('pFP_SEX', otInteger, 1)
              else
                oqIns.DeclareAndSet('pFP_SEX', otInteger, 0);
              oqIns.DeclareAndSet('pFK_VRACHID', otInteger, pSOTRID);
              oqIns.Execute;
              frmMain.os.Commit;
              DoInsertProjivaet(oqIns.GetVariable('PFK_ID'));
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
//------------------------------------------------------------------------------
  if l_addr_loaded then //++kladr
    begin
      SaveAddrChanges; // Callback Возвращает ID адреса, если было добавление и 0 при изменении
      CommitAddrChanges;
    end;
  if EDIT_MODE = False then
    begin
      DoUpdateAddress(idPepl);
    end;
//-->> вызов длл "Согласие пациента"
  if EDIT_MODE <> True then //--> если новый пациент то показываем, иначе не показываем
    begin
      if isAgreePacient = True then //-->> если включена настройка "Согласие пациента"
        begin
          hAgree := LoadLibrary('Dll_Soglasie_Pac.dll');
          if hAgree <> 0 then
            begin
              try
                LoadAgree := GetProcAddress(hAgree, 'LoadSoglasie');
                if @LoadAgree <> nil then
                  LoadAgree(Application.Handle, idPepl, pSOTRID);
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

procedure TfrmFastRegist.bVozrastClick(Sender: TObject);
var ods : TOracleDataSet;
begin
  if cxdeRojd.Text <> '' then
  begin
    if cxdeRojd.Date > frmMain.GET_SYSTEMDATE then
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

procedure TfrmFastRegist.aCancelExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  if pDOCOBSLID <> 0 then      //удаляем id уникального номера МК из таблицы номеров TDOCOBSL
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

  ModalResult := MrCancel;
end;

procedure TfrmFastRegist.cxKorennoePropertiesChange(Sender: TObject);
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
        oq.DeclareAndSet('pFK_VRACHID', otInteger, pSOTRID);
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

procedure TfrmFastRegist.DoTextTypeFIO(strFIO: String);
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

procedure TfrmFastRegist.cxFamClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmFastRegist.cxFamEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmFastRegist.cxNameClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmFastRegist.cxNameEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmFastRegist.cxOtchClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmFastRegist.cxOtchEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmFastRegist.cxDSClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmFastRegist.cxDSEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmFastRegist.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TfrmFastRegist.FormCreate(Sender: TObject);
var ods : TOracleDataSet;
begin
  russian:=LoadKeyboardLayout('00000419', 0);
//-->> 1. "Заряжаем" датасеты
  if odsKorennoe.Active = False then
    odsKorennoe.Active := True;
  if odsRegPrin.Active = False then
    odsRegPrin.Active := True;
//-->> 2. Настройки
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''XRAY'' AND FC_KEY = ''AGREE_PACIENT'' ';
    ods.Open;
    if ods.FieldByName('FC_VALUE').AsString = '-1' then
      isAgreePacient := True
    else
      isAgreePacient := False;
  finally
    ods.Free;
  end;
// 2
end;

function TfrmFastRegist.DoCheckParameters : Integer;
var nIBIDf, nIBYf : Integer;
    DateCh : TDateTime;
begin
  if cxNum.Text = '' then
    begin
      Application.MessageBox('Вам необходимо указать НОМЕР МЕДИЦИНСКОЙ КАРТЫ (амбулаторной карты) пациента!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
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

  if cxFam.Text = '' then
    begin
      Application.MessageBox('Вам необходимо указать ФАМИЛИЮ пациента!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
      cxFam.SetFocus;
      Result:= 0;
      exit;
    end;

  if cxName.Text = '' then
    begin
      Application.MessageBox('Вам необходимо указать ИМЯ пациента!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
      cxName.SetFocus;
      Result:= 0;
      exit;
    end;

  DateCh := Date; //!!!
  if (cxdeRojd.Text = '') or (cxdeRojd.Text = '0') or (cxdeRojd.Text = '30.12.1899') or (TryStrToDate(cxdeRojd.Text, DateCh) = False) then
    begin
      Application.MessageBox('Вам необходимо указать ДАТУ РОЖДЕНИЯ пациента!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
      cxdeRojd.SetFocus;
      Result:= 0;
      exit;
    end;

  if (cxMale.Checked = FALSE) and (cxFemale.Checked = FALSE) then
    begin
      Application.MessageBox('Вам необходимо указать ПОЛ пациента!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
      cxMale.SetFocus;
      Result:= 0;
      exit;
    end;
  Result := 1;
end;

procedure TfrmFastRegist.DoGetAddress;
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

function TfrmFastRegist.fGetIB(var nIBIDf, nIBYf: Integer): boolean;
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
    oq.DeclareAndSet('pUSLVIDID', otInteger, pUSLVIDID);
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

procedure TfrmFastRegist.DoUpdateAddress(nIDPepl: Integer);
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

procedure TfrmFastRegist.CheckEnabledControls;
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
      cxAddress.Enabled := FALSE;
//      cxDS.Enabled := FALSE;
    end;
end;

procedure TfrmFastRegist.FormShow(Sender: TObject);
begin
  DoGetAddress;
  if cxFam.Enabled then
    cxFam.SetFocus;
end;

procedure TfrmFastRegist.cxdeRojdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TfrmFastRegist.DoProjivaet;
var ods : TOracleDataSet;
    id : Integer;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.SQL.Text := ' DECLARE '+
                    '   nSMID NUMBER; '+
                    ' BEGIN '+
                    '   SELECT COUNT(FK_ID) INTO nSMID FROM TIB WHERE FK_PACID = :PFK_PACID AND (FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''PD_MZ'')) '+
                    '                                                                         OR FK_SMID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO'')); '+
                    '   SELECT FK_ID INTO :VAL FROM TSMID WHERE FC_SYNONIM = ''MZ_GOROD''; '+
                    ' IF nSMID > 0 THEN '+
                    '   SELECT MAX(FK_SMID) INTO :VAL FROM TIB WHERE FK_PACID = :PFK_PACID AND (FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = ''PD_MZ'')) '+
                    '                                                                        OR FK_SMID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO'')); '+
                    ' END IF; '+
                    ' END; ';
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
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

procedure TfrmFastRegist.cxAddressClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmFastRegist.cxAddressEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmFastRegist.DoInsertKorennoe(nIDPepl: Integer);
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
          oq.DeclareAndSet('pFK_VRACHID', otInteger, pSOTRID);
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

procedure TfrmFastRegist.DoInsertProjivaet(nPACID: Integer);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' MERGE INTO ASU.TIB '+#13#10+
                    '  USING DUAL ON (FK_PACID = :PFK_PACID '+#13#10+
                    '                 AND (FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+#13#10+
                    '                                   WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM ASU.TSMID WHERE FC_SYNONIM = ''PD_MZ'')) '+#13#10+
                    '                 OR FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO''))) '+#13#10+
                    ' WHEN MATCHED THEN UPDATE SET FK_SMID = :pFK_SMID, FK_SMEDITID = (select fk_owner from asu.tsmid where fk_id = :pfk_smid) '+#13#10+
                    '                    WHERE FK_PACID = :PFK_PACID '+#13#10+
                    '                      AND (FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+#13#10+
                    '                                   WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM ASU.TSMID WHERE FC_SYNONIM = ''PD_MZ'')) '+#13#10+
                    '                                      OR FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO'')) '+#13#10+
                    ' WHEN NOT MATCHED THEN INSERT(FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13#10+
                    '                       VALUES(:pFK_PACID, :pFK_SMID, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pFK_VRACHID) ';
    ods.DeclareAndSet('PFK_PACID', otInteger, nPACID);
    ods.DeclareAndSet('pFK_SMID', otInteger, cxProjivaet.EditValue);
    ods.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
    ods.Open;
  finally
    ods.Free;
  end;
end;

end.
