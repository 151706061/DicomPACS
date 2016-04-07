unit fMedKardEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, StdCtrls, DBCtrls, Mask, JvToolEdit,
  Db, Oracle, OracleData, JvBaseEdits, ExtCtrls, cxControls,
  cxContainer, cxEdit, cxGroupBox,
  JvExStdCtrls, JvEdit, JvValidateEdit, JvExMask, cxTextEdit, cxMaskEdit,
  cxSpinEdit, JvSpin, cxDropDownEdit, cxCalendar, cxCurrencyEdit, Buttons,
  cxLookAndFeelPainters;

type
// Воронов О.А. 07.06.2007
// добавлять флаги с таким смыслом, чтобы отсутствие всех флагов означало что
// форма работает в штатном режиме - редактирование партии

//  pfDontSave - не сохранять партию - проверка происходит в функции DoSave - для выбора количества медикаментов из партии
//  pfDontShowPrice - не отображать поле с ценой и суммой - для выбора количества медикаментов из партии
//  pfShowAddButton - показывать кнопку добавить - раньше было нужно теперь не надо - любое добавление партий проходит через приход с оформлением документов
//  pfIsOpenForView - открываем форму только для просмотра - т.е. ничего нельзя менять и сохранять - устанавливает pfDontSave
//  pfInputKol - Ввод количества, по имеющейся партии. Все остальные поля блокируются. устанавливает pfIsOpenForView
//  pfHideProdCert - скрыть информацию о Производителе и Сертификате
//  pfInputByShtrihCode - ввод медикаментов с помощью штрих кода
//  pfLockMedicPriceSumm - блокирование изменениz медикамента, цены и суммы - для редактирования из прихода
//  pfLockMedic - блокирование изменениz медикамента
//  pfFasIE - ввод в фасовочных единицах измерения
//  pfVidPost - отображать вид поступления
//  pfExpensive - отображать признак дороговизны
//  pfVidPostEdit - возможность менять вид поступления
//  pfDontShowKolSum - не отображаем поля кол-во и сумма
//  pfCheckBrak - проверять партию на забраковку
//  pfFINSOURCE - источник финансирования
//  pfInvNomer - инвентарный номер
//  pfQuotaCode - код квотирования (для сургута-кардиоцентра)
//  pfNDS - НДС
//  pfNacenka - наценка
//  pfJNVLS - Жизненно необходимое и важнейшее лекарственное средство или изделие медицинского назначения
//  pfInputSum - Ввод не кол-ва, а суммы, с автоматическим подсчетом кол-ва
//  pfDrugID - уникальный идентификатор для проекта "Мониторинг цен"

  TPartyFlags = set of (pfDontSave, pfDontShowPrice, pfShowAddButton,
                        pfIsOpenForView, pfHideProdCert, pfInputKol,
                        pfInputByShtrihCode, pfLockMedicPriceSumm, pfLockMedic,
                        pfFasIE, pfVidPost, pfVidPostEdit, pfExpensive,
                        pfDontShowKolSum, pfCheckBrak, pfFINSOURCE, pfInvNomer,
                        pfQuotaCode, pfNDS, pfNacenka, pfJNVLS, pfInputSum, pfDrugID );


  TfrmMedKardEdit = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    al: TActionList;
    acCancel: TAction;
    acSave: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    acAdd: TAction;
    cxGroupBox1: TcxGroupBox;
    grbPriceKol: TcxGroupBox;
    laKol: TLabel;
    laSum: TLabel;
    laPrice: TLabel;
    odsEdizm: TOracleDataSet;
    dsEdizm: TDataSource;
    odskartList: TOracleDataSet;
    dsKartList: TDataSource;
    dsDpc: TDataSource;
    odsDpc: TOracleDataSet;
    odsDpcFN_KOL: TFloatField;
    odsDpcFN_SUMM: TFloatField;
    Timer1: TTimer;
    cePriceView: TcxCurrencyEdit;
    seKol: TcxSpinEdit;
    seSumm: TcxCurrencyEdit;
    oqUpdateFK_VID_POST: TOracleQuery;
    oqUpdateExpensive: TOracleQuery;
    acCheckBrak: TAction;
    Panel2: TPanel;
    lbPartyID: TLabel;
    edFN_Party_num: TEdit;
    Label8: TLabel;
    edSerial: TEdit;
    sbuCheckBrak: TSpeedButton;
    Panel1: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    edMedic: TJvComboEdit;
    chbGoden: TCheckBox;
    dedGoden: TcxDateEdit;
    edEdIzm: TEdit;
    paInvNomer: TPanel;
    Label3: TLabel;
    edInvNomer: TEdit;
    paFinSource_VidPost: TPanel;
    laFinSource: TLabel;
    lcbFinSource: TDBLookupComboBox;
    laVidPost: TLabel;
    lcbVidPost: TDBLookupComboBox;
    Bevel2: TBevel;
    paExpensive_Brak: TPanel;
    chbExpensive: TCheckBox;
    chbFL_Brak: TCheckBox;
    paProdCert: TPanel;
    cbProdCert: TCheckBox;
    lblProducer: TLabel;
    edProducer: TJvComboEdit;
    lblCertificate: TLabel;
    edCertificate: TJvComboEdit;
    paQuotaCode: TPanel;
    Label4: TLabel;
    medQUOTA_CODE1: TcxMaskEdit;
    paNacenki: TPanel;
    seNacenka: TcxSpinEdit;
    laNacenka: TLabel;
    laNDS: TLabel;
    seNDS: TcxSpinEdit;
    cedPriceMnf: TcxCurrencyEdit;
    laPriceMnf: TLabel;
    chbJNVLS: TCheckBox;
    medQUOTA_CODE234: TcxMaskEdit;
    paDrugID: TPanel;
    Label5: TLabel;
    edDrugID: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure acSaveExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure edProducerButtonClick(Sender: TObject);
    procedure cbProdCertClick(Sender: TObject);
    procedure edMedicChange(Sender: TObject);
    procedure edMedicButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cePriceViewKeyPress(Sender: TObject; var Key: Char);
    procedure sesummKeyPress(Sender: TObject; var Key: Char);
    procedure chbGodenClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure seKolPropertiesChange(Sender: TObject);
    procedure seSummPropertiesChange(Sender: TObject);
    procedure cePriceViewPropertiesChange(Sender: TObject);
    procedure dedGodenPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure chbExpensiveClick(Sender: TObject);
    procedure acCheckBrakExecute(Sender: TObject);
    procedure cedPriceMnfPropertiesChange(Sender: TObject);
    procedure cedPriceMnfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure seKolEnter(Sender: TObject);
    procedure seSummEnter(Sender: TObject);
    procedure cePriceViewEnter(Sender: TObject);
  private
    { Private declarations }
    flsum, flprice, flkol: Boolean;  // флаги изменения поля суммы и цены 
    FnMedicID, FnID : integer;
    orQuery : TOracleQuery;
    FIsMedicChanged : Boolean;  // флаг изменения медикамента
    FModRes : Integer;
    procedure SetnMedicID(const Value: integer);
    procedure SetnID(const Value: integer);
    function CalcPriceWithNacenka : double; 

  public
    { Public declarations }
    m_nProdCertID : integer;
    ConfigFlags : TPartyFlags;
    FPostavID : integer;
    FNaklDate : TDateTime;
    FIsPrihPost : Boolean;
    VidPost : Variant;
    FL_EXPENSIVE : integer;
    FK_SKLAD_ID : Variant;
    UNIQSTR : string; // ссылка на забракованную партию
    ShowSkladID : integer;

    property nMedicID: integer read FnMedicID write SetnMedicID;
    property nID: integer read FnID write SetnID;
    procedure FillForm;

    function DoSave : Integer;
  end;

function DoShowMedKardEdit(pID: integer = -1): integer;

var
  frmMedKardEdit: TfrmMedKardEdit;

implementation

uses
	fmainform,
	fMedKardLst,
        uProdCertDlg,
        fMedic,
	fdmMain, Variants, fBrakSelect, Math;
{$R *.DFM}
//==============================================================================
function DoShowMedKardEdit(pID: integer = -1): integer;
//==============================================================================
begin
  Application.CreateForm(TfrmMedKardEdit, frmMedKardEdit);
  frmMedKardEdit.nMedicID := 0;
  frmMedKardEdit.m_nProdCertID := -1;
  frmMedKardEdit.nID := pID;
  frmMedKardEdit.FillForm;

  frmMedKardEdit.ShowModal;
  result := frmMedKardEdit.nID;
  FreeAndNil(frmMedKardEdit);
end;
//==============================================================================
function TfrmMedKardEdit.DoSave : Integer;
//==============================================================================
var
  Uchgrid : Variant;
begin
  // заносим уч.группу в карточку только по опции
  if dmMain.ConfigParams.GetParamValue('FUNC_USE_MEDUCHGRP_CH', 0) = '1'then
    Uchgrid := odsEdizm.FieldByName('UCHGRID').AsVariant
  else
    Uchgrid := null;
    
  if not (pfDontSave in ConfigFlags) then
  begin
    if pfFasIE in ConfigFlags then
      FnID := Round(dmMain.pkgMedKart.DOSET('', nMedicID, dmMain.pkgMedSes.GETCURMO, dedGoden.Date, edSerial.Text, nID, m_nProdCertID, edFN_Party_num.Text, cePriceView.Value*fdmMain.nvl(odsEdizm.FieldByName('FN_FPACKINUPACK').AsVariant,1), seKol.Value, Uchgrid, chbGoden.Checked ))
    else
      FnID := Round(dmMain.pkgMedKart.DOSET('', nMedicID, dmMain.pkgMedSes.GETCURMO, dedGoden.Date, edSerial.Text, nID, m_nProdCertID, edFN_Party_num.Text, cePriceView.Value, seKol.Value, Uchgrid, chbGoden.Checked));

    dmMain.InitAdditionalUpdateTable('MED.TKART'); // обноляем дополнительные параметры таблицы TKART
    if pfVidPost in ConfigFlags then
      dmMain.AddAdditionalUpdateTable('FK_VID_POST', otInteger, lcbVidPost.KeyValue);

    if pfExpensive in ConfigFlags then
    begin
      if chbExpensive.Checked then
        dmMain.AddAdditionalUpdateTable('FL_EXPENSIVE', otInteger, 1)
      else
        dmMain.AddAdditionalUpdateTable('FL_EXPENSIVE', otInteger, 0);
    end;

    if pfCheckBrak in ConfigFlags then
    begin
      case chbFL_Brak.State of
        cbChecked   : dmMain.AddAdditionalUpdateTable('FL_BRAK', otInteger, 1); //dmMain.SetTKART_FL_Brak(FnID, 1);
        cbUnchecked : dmMain.AddAdditionalUpdateTable('FL_BRAK', otInteger, 0);//dmMain.SetTKART_FL_Brak(FnID, 0);
        cbGrayed    : dmMain.AddAdditionalUpdateTable('FL_BRAK', otInteger, null);//dmMain.SetTKART_FL_Brak(FnID, null);
      end;

      case chbFL_Brak.State of
        cbChecked   : dmMain.AddAdditionalUpdateTable('BRAK_UNIQSTR', otString, UNIQSTR);
      else
        dmMain.AddAdditionalUpdateTable('BRAK_UNIQSTR', otString, '');
      end;
    end;

    if pfFINSOURCE in ConfigFlags then
      dmMain.AddAdditionalUpdateTable('FK_FINSOURCE_ID', otInteger, lcbFinSource.KeyValue);

    if pfInvNomer in ConfigFlags then
      dmMain.AddAdditionalUpdateTable('FC_INV_NOMER', otString, edInvNomer.Text);    

    if pfDrugID in ConfigFlags then
      dmMain.AddAdditionalUpdateTable('DRUGID', otString, edDrugID.Text);

    if pfQuotaCode in ConfigFlags then
      dmMain.AddAdditionalUpdateTable('FC_QUOTA_CODE', otString, medQUOTA_CODE1.Text+medQUOTA_CODE234.Text);

    if pfNDS in ConfigFlags then
    begin
      seNDS.PostEditValue;
      dmMain.AddAdditionalUpdateTable('FN_NDS', otFloat, seNDS.EditValue);
    end;

    if pfNacenka in ConfigFlags then
    begin
      seNDS.PostEditValue;
      cedPriceMnf.PostEditValue;
      dmMain.AddAdditionalUpdateTable('FN_NACENKA',   otFloat, seNacenka.EditValue);
      dmMain.AddAdditionalUpdateTable('FN_PRICE_MNF', otFloat, cedPriceMnf.EditValue);
    end;

    if pfJNVLS in ConfigFlags then
    begin
      case chbJNVLS.Checked of
        True : dmMain.AddAdditionalUpdateTable('FL_JNVLS', otInteger, 1);
        else dmMain.AddAdditionalUpdateTable('FL_JNVLS', otInteger, 0);
      end;
    end;

    dmMain.ExecuteAdditionalUpdateTable('KARTID', otInteger, FnID);
  end;
//    FnID := Round(dmMain.pkgMedKart.DOSET('', nMedicID, dmMain.pkgMedSes.GETCURMO, dedGoden.Date, edSerial.Text, nID, m_nProdCertID, PartyNum, cePriceView.Value, seKol.Value ));
  Result := FnID;
end;
//==============================================================================
procedure TfrmMedKardEdit.acSaveExecute(Sender: TObject);
//==============================================================================
var
  Res : Integer;
  FC_MAX, FC_KOl : string;
begin
  if (nMedicID = 0) then   //trim(edMedic.Text) = ''
  begin
    Application.MessageBox('Необходимо выбрать объект учёта!','Ошибка',mb_ok+mb_iconerror);
    edMedic.SetFocus;
    Exit;
  end;

  // проверка на ввод просроченных партий Воронов О.А. 08.04.2008
  if (not(pfInputKol in ConfigFlags))and(dedGoden.ValidateEdit(True) = False) then
  begin
    dedGoden.SetFocus;
    Exit;
  end;
  if (not(pfInputKol in ConfigFlags))and(chbGoden.Checked)and(dedGoden.Date < ServerDate(dmMain.os)) then
  begin
    if DateToStr(dedGoden.Date) = '00.00.0000' then
    begin
      Application.MessageBox('Неправильно указан срок годности','Ошибка',MB_OK+MB_ICONERROR);
      dedGoden.SetFocus;
      Exit;
    end;
    
    if Application.MessageBox('Срок годности уже истёк.'#13#10'Вы уверены что это верно?','Подтверждение',MB_YESNO+MB_ICONQUESTION) = ID_NO then
    begin
      dedGoden.SetFocus;
      Exit;
    end;
  end;

  // проверка на запредельное количества
  if (seKol.Properties.AssignedValues.MaxValue) then
  begin
    FC_MAX := FloatToStrF(seKol.Properties.MaxValue, ffNumber, 15, 7);
    FC_KOl := FloatToStrF(seKol.EditingValue, ffNumber, 15, 7);
    if (FC_KOl <> FC_MAX)and(seKol.Properties.MaxValue < seKol.EditingValue) then
    begin
      Application.MessageBox(PAnsiChar('Введенное количество ('+FC_KOl+') больше, чем имеется на остатке('+FC_MAX+').'#13#10'Будет выставлено максимально возможное количество('+FloatToStr(seKol.Properties.MaxValue)+').'),'Информация',MB_OK+MB_ICONINFORMATION);
      seKol.PostEditValue;
      seKol.SetFocus;
      seKol.SelLength := 20;
      Exit;
    end;
  end;

	if not cbProdCert.Checked then m_nProdCertID := 0;

  seKol.PostEditValue;
  cePriceView.PostEditValue;
  seSumm.PostEditValue;
  dedGoden.PostEditValue;  
  if (FIsPrihPost = True)and(dmMain.ConfigParams.GetParamValue('FUNC_CHECK_PRICES_IN_NAKL', 0) = 1)and(not(pfInputKol in ConfigFlags)) then  // вводим новую карточку и включен режим
  begin
    dmMain.oqNAKL_PRICE_CHECK_BY_DOGOVOR.SetVariable('PPOSTID', FPostavID);
    dmMain.oqNAKL_PRICE_CHECK_BY_DOGOVOR.SetVariable('PITEMID', nMedicID);
    dmMain.oqNAKL_PRICE_CHECK_BY_DOGOVOR.SetVariable('PNAKLDATE',  FNaklDate);
    dmMain.oqNAKL_PRICE_CHECK_BY_DOGOVOR.SetVariable('PNAKLPRICE',  cePriceView.EditValue);
    dmMain.oqNAKL_PRICE_CHECK_BY_DOGOVOR.Execute;
    Res := dmMain.oqNAKL_PRICE_CHECK_BY_DOGOVOR.GetVariable('Res');
    if (Res = -1)and(Application.MessageBox('Введенная цена меньше договорной. Продолжить?', 'Внимание', MB_YESNO+MB_ICONASTERISK)=IDNO) then
    begin
      Exit;
    end;   
    if (Res = -4) then
    begin
      Application.MessageBox('Введенная цена БОЛЬШЕ договорной. Подобная ситуация недопустима.'#13#10'Обратитесь к регистратору договоров с поставщиками.', 'Внимание', MB_OK+MB_ICONERROR);
      Exit;
    end;
    if (Res = -2) then
    begin
      Application.MessageBox('В дествующих договорах найдено несколько цен на данный объект учета.'#13#10'Введенная цена не совпадает ни с одной из найденных цен'#13#10'Обратитесь к регистратору договоров с поставщиками.', 'Внимание', MB_OK+MB_ICONERROR);
      Exit;
    end;
    if (Res = -3) then
    begin
      Application.MessageBox('В действующих договорах не было найдено упоминания о данном объекте учета.'#13#10'Обратитесь к регистратору договоров с поставщиками.', 'Внимание', MB_OK+MB_ICONERROR);
      Exit;
    end;
  end;

  // проверка на вид поступления
  if (pfVidPostEdit in ConfigFlags)and(lcbVidPost.Text = '') then
  begin
    Application.MessageBox('Не выбран вид поступления','Информация',MB_OK+MB_ICONINFORMATION);
    lcbVidPost.DropDown;
    Exit;
  end;

  if (pfCheckBrak in ConfigFlags)and(nID = -1) then
  begin
    if chbFL_Brak.State = cbGrayed then
    begin
      if (edSerial.Enabled)and(edSerial.Visible) then edSerial.SetFocus;
      acCheckBrak.Execute;
      Exit;
    end;
  end;

  // проверка цены
  cedPriceMnf.PostEditValue;
  if (not (pfIsOpenForView in ConfigFlags))and(pfNacenka in ConfigFlags)and(cedPriceMnf.EditValue > 0) then
  begin
    if (cePriceView.EditValue <> CalcPriceWithNacenka) then
      if Application.MessageBox('Введённая цена с наценкой не совпадает с расчетной.'#13#10'Исправить это?','Информация',MB_YESNO+MB_ICONQUESTION) = mrYes then
        cePriceView.EditValue := CalcPriceWithNacenka;
  end;

  DoSave;
  dmMain.os.Commit; //Added by Neronov A.S. 22.12.2011
  ModalResult := mrOk;
end;

function TfrmMedKardEdit.CalcPriceWithNacenka: double;
var
  PriceWithNac : double;
begin
  cedPriceMnf.PostEditValue;
  seNacenka.PostEditValue;
  seNDS.PostEditValue;
  PriceWithNac := cedPriceMnf.EditValue + SimpleRoundTo((nvl(seNacenka.EditValue,0)*(nvl(cedPriceMnf.EditValue,0)/100)), -2);
  result := PriceWithNac + SimpleRoundTo( (PriceWithNac*(nvl(seNDS.EditValue,0)/100)), -2);
end;
//==============================================================================
procedure TfrmMedKardEdit.acCancelExecute(Sender: TObject);
//==============================================================================
begin
 Close;
end;
//==============================================================================
procedure TfrmMedKardEdit.acAddExecute(Sender: TObject);
//==============================================================================
begin
  DoSave;
  dmMain.os.Commit;
  FnID := -1;
  FnMedicID := 0;
  edSerial.Text := '';
  chbGoden.Checked := True;
  chbGodenClick(nil);
end;
//==============================================================================
procedure TfrmMedKardEdit.FormCreate(Sender: TObject);
//==============================================================================
var
  pTmp   : TPoint;
  pWidth : Integer;
begin
  ShowSkladID := 0;
  ConfigFlags := [];
  FnID := -1;  // это делать обязательно  - см. PKGMEDKART.DOSET - недочет в условии. незачот
  edFN_Party_num.Text := '0';
  FIsMedicChanged := False;
  FModRes := 0;
  FIsPrihPost := False;
  FK_SKLAD_ID := 0;
  UNIQSTR := '';
  if (dmMain.ConfigParams.GetParamValue('FUNC_REQUARE_GODEN', 0) = 1) then
  begin
    chbGoden.Checked := True;
    chbGodenClick(chbGoden);
  end;    
  if (dmMain.ConfigParams.GetParamValue('FUNC_REQUARE_PRODCERT', 0) = 1) then
  begin
    cbProdCert.Checked := True;
    cbProdCertClick(cbProdCert);
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_REPLACE_PRICE_AND_SUMM_IN_PARTY', 0) = 1) then
  begin
    laPrice.Caption := 'Сумма:';
    laSum.Caption := 'Цена:';
    pTmp.X := cePriceView.Left;
    pTmp.Y := cePriceView.Top;
    pWidth := cePriceView.Width;
    cePriceView.Top := seSumm.Top;
    cePriceView.Left := seSumm.Left;
    cePriceView.Width := seSumm.Width;
    seSumm.Top := pTmp.Y;
    seSumm.Left := pTmp.X;
    seSumm.Width := pWidth;
  end;
  

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_IMN) then
    ConfigFlags := ConfigFlags + [pfVidPost];

  if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1) then
    ConfigFlags := ConfigFlags + [pfFINSOURCE];

  if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_INV_NOMER', 0) = 1) then
    ConfigFlags := ConfigFlags + [pfInvNomer];  

  if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_DRUGID', 0) = 1) then
    ConfigFlags := ConfigFlags + [pfDrugID];

  if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 1) then
    ConfigFlags := ConfigFlags + [pfQuotaCode];

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_NDS', 0) = 1) then
    ConfigFlags := ConfigFlags + [pfNDS];

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_NACENKA', 0) = 1) then
    ConfigFlags := ConfigFlags + [pfNacenka];

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_JNVLS', 0) = 1) then
    ConfigFlags := ConfigFlags + [pfJNVLS];

// автоматически определяем длину ограничения на поле Воронов О.А. 25.08.2008
  edSerial.MaxLength       := dmMain.GetFieldLength('med', 'tkart', 'FC_SERIAL');
  edFN_Party_num.MaxLength := dmMain.GetFieldLength('med', 'tkart', 'FN_Party_num');
  edInvNomer.MaxLength     := dmMain.GetFieldLength('med', 'tkart', 'FC_INV_NOMER');
end;
//==============================================================================
procedure TfrmMedKardEdit.FillForm;
//==============================================================================
begin
  // принудительно убираем флаг, если режим выключен
  if dmMain.ConfigParams.GetParamValue('FUNC_FAS_EI_UHC', 0) = 0 then ConfigFlags := ConfigFlags - [pfFasIE];
  
  if nID > 0 then
  begin
    if not odskartList.Eof then
    begin
      edFN_Party_num.Text       := odskartList.FieldByName('fn_party_num').AsString;
//      edMO_NAME.Text := odskartList.FieldByName('fc_group').AsString;
    end;

    edSerial.Text      := odskartList.FieldByName('FC_SERIAL').AsString;

    // По значению null определяем выставлен ли срок годности Воронов О.А. 13.08.2007  
    //    edGoden.DateTime   := odskartList.FieldByName('FD_GODEN').AsDateTime;
    chbGoden.Checked := not VarIsNull( odskartList.FieldByName('FD_GODEN').AsVariant );
    if chbGoden.Checked then
      dedGoden.Date   := Trunc(odskartList.FieldByName('FD_GODEN').AsDateTime)
    else
      dedGoden.Clear;

    edProducer.Text    := odskartList.FieldByName('PROD').AsString;
    edCertificate.Text := odskartList.FieldByName('CERT').AsString;
    m_nProdCertID := nvl(odskartList.FieldByName('fn_prodcertid').AsVariant, -1);

    // поле с ценой производителя обязательно заполнять до итоговой цены
    if pfNacenka in ConfigFlags then
    begin
      seNacenka.EditValue   := odskartList.FieldByName('FN_NACENKA').AsVariant;
      cedPriceMnf.EditValue := odskartList.FieldByName('FN_PRICE_MNF').AsVariant;
    end;

    // проверка на фасовочные единицы
    if pfFasIE in ConfigFlags then
      cePriceView.Value  := (odskartList.FieldByName('FN_PRICE').AsFloat)/fdmMain.nvl(odskartList.FieldByName('FN_FPACKINUPACK').AsVariant,1)
    else
      cePriceView.Value  := odskartList.FieldByName('FN_PRICE').AsFloat;
    if (edProducer.Text <> '') or (edCertificate.Text <> '') then
    begin
      cbProdCert.Checked := True;
      edProducer.Enabled := True;
      edCertificate.Enabled := True;
    end;

    if pfVidPost in ConfigFlags then
    begin
      lcbVidPost.KeyValue := odskartList.FieldByName('FK_VID_POST').AsVariant;
    end;

    if pfFinSource in ConfigFlags then
    begin
      lcbFinSource.KeyValue := odskartList.FieldByName('FK_FINSOURCE_ID').AsVariant;
    end;

    if pfInvNomer in ConfigFlags then
    begin
      edInvNomer.Text := odskartList.FieldByName('FC_INV_NOMER').AsString;
    end;    

    if pfDrugID in ConfigFlags then
    begin
      edDrugID.Text := odskartList.FieldByName('DRUGID').AsString;
    end;

    if pfQuotaCode in ConfigFlags then
    begin
      medQUOTA_CODE1.Text   := Copy(odskartList.FieldByName('FC_QUOTA_CODE').AsString, 1, 2);
      medQUOTA_CODE234.Text := Copy(odskartList.FieldByName('FC_QUOTA_CODE').AsString, 3, 6);
    end;

    if pfExpensive in ConfigFlags then
    begin
      chbExpensive.Checked := (odskartList.FieldByName('FL_EXPENSIVE').AsInteger = 1);
    end;

    if pfCheckBrak in ConfigFlags then
    begin
      if (VarIsNull(odskartList.FieldByName('FL_Brak').AsVariant) = True) then
        chbFL_Brak.State := cbGrayed
      else
        chbFL_Brak.Checked := (odskartList.FieldByName('FL_Brak').AsVariant = 1);
      UNIQSTR := fdmMain.nvl(odskartList.FieldByName('BRAK_UNIQSTR').AsVariant,'');
    end;

    if pfNDS in ConfigFlags then
      seNDS.EditValue := odskartList.FieldByName('FN_NDS').AsVariant;

    if pfCheckBrak in ConfigFlags then
      chbJNVLS.Checked := (odskartList.FieldByName('FL_JNVLS').AsVariant = 1);

    nMedicID := Round(odskartList.FieldByName('MEDICID').AsFloat);
  end
  else
  begin
    chbGoden.Checked := (dmMain.ConfigParams.GetParamValue('FUNC_REQUARE_GODEN', 0) = 1);
    dedGoden.Clear;
  end;

  if (pfVidPostEdit in ConfigFlags)and(pfVidPost in ConfigFlags) then
  begin
    lcbVidPost.Enabled := True;
  end;
end;
//==============================================================================
procedure TfrmMedKardEdit.SetnMedicID(const Value: integer);
//==============================================================================
begin
  odsEdizm.Close;
  odsEdizm.SetVariable('MEDICID', Value);
  odsEdizm.Open;

  if odsEdizm.RecordCount > 0 then
  begin
    FnMedicID := Value;  
    edMedic.Text := odsEdizm.fieldbyname('FC_MEDICNAME').AsString;
    edMedic.Tag := Value;
    // проверка на фасовочные единицы
    if pfFasIE in ConfigFlags then
      edEdIzm.Text := fdmMain.nvl(odsEdizm.fieldbyname('FC_FEI').AsVariant,'')
    else
      edEdIzm.Text := fdmMain.nvl(odsEdizm.fieldbyname('FC_UEI').AsVariant,'');


    if (pfQuotaCode in ConfigFlags) and (nID <= 0) then
    begin
      medQUOTA_CODE1.EditValue   := '00';
      medQUOTA_CODE234.EditValue := nvl(odsEdizm.fieldbyname('FC_QUOTA_CODE_234').AsVariant, '000000');
    end;

    if (pfJNVLS in ConfigFlags) and (nID <= 0) then
      chbJNVLS.Checked := (nvl(odsEdizm.fieldbyname('FL_JNVLS').AsVariant, 0) = 1);

    if (dmMain.ConfigParams.GetParamValue('FUNC_USE_MEDICPRODCERT',0) = 1) and (m_nProdCertID = -1) then  //Только при добавлении новой карточки
    begin
      edProducer.Text    := odsEdizm.FieldByName('FC_PROD').AsString;
      edCertificate.Text := odsEdizm.FieldByName('FC_CERT').AsString;
      m_nProdCertID := nvl(odsEdizm.FieldByName('FN_MEDICPRODCERTID').AsVariant, -1);
    end;
    
  end;
end;
//==============================================================================
procedure TfrmMedKardEdit.SetnID(const Value: integer);
//==============================================================================
begin
  FnID := Value;
  odskartList.Close;
  odskartList.SetVariable('akartid', FnID);
  odskartList.Open;

  odsDpc.Close;
  odsDpc.SetVariable('akartid', FnID);
  odsDpc.Open;
end;
//==============================================================================
procedure TfrmMedKardEdit.edProducerButtonClick(Sender: TObject);
//==============================================================================
var
  dlg : TProdCertDlg;
begin
  dlg := TProdCertDlg.Create(Self);
  if dlg.ShowModal = mrOK then begin
    m_nProdCertID := dlg.m_ID;
    edProducer.Text := dlg.m_strProd;
    edCertificate.Text := dlg.m_strCert;
  end;
  dlg.Free;
end;
//==============================================================================
procedure TfrmMedKardEdit.cbProdCertClick(Sender: TObject);
//==============================================================================
begin
  if cbProdCert.Checked then begin
    edProducer.Enabled := True;
    edCertificate.Enabled := True;
  end
  else begin
    edProducer.Enabled := False;
    edCertificate.Enabled := False;
  end;
end;
//==============================================================================
procedure TfrmMedKardEdit.edMedicChange(Sender: TObject);
//==============================================================================
var
  fn_party_num_next : integer;
begin
// вычисляем будущий номер партии - запрос взят из тригера MED.TKART_INS
  if (nID > 0)and(not FIsMedicChanged) then Exit; // если запись редактируется, то номер партии уже есть, его не надо вычислять
  FIsMedicChanged := False;
  orQuery := TOracleQuery.Create( self );
  orQuery.Session := dmMain.os;
  orQuery.SQL.Text := 'select NVL(MAX(TKart.fn_party_num),0), NVL(COUNT(TKart.fn_party_num),0) from med.TKart where TKart.medicid = '+IntTostr(nMedicID);
  orQuery.Execute;
  if not orQuery.Eof then
  begin  // новый механизм - если в номере партии не цифра - то берем кол-во партий + 1 30.01.2009 Воронов О.А.
    if TryStrToInt(orQuery.FieldAsString(0), fn_party_num_next) then
      edFN_Party_num.Text := IntToStr((fn_party_num_next + 1))
    else
      edFN_Party_num.Text       := IntToStr(orQuery.FieldAsInteger(1)+1);
  end
  else
  begin
    edFN_Party_num.Text       := '0';
  end;
  orQuery.Free;
end;
//==============================================================================
procedure TfrmMedKardEdit.edMedicButtonClick(Sender: TObject);
//==============================================================================
var
  nTmp: Integer;
begin
  nTmp := DoShowMedic( nMedicID, True, '', (frmMain.ProvisorState = 1), (pfInputByShtrihCode in ConfigFlags), '', 'Список объектов учета', FK_SKLAD_ID );

  FIsMedicChanged := nTmp <> nMedicID;

  if nTmp > 0 then
    nMedicID := nTmp
end;

procedure TfrmMedKardEdit.FormShow(Sender: TObject);
begin
  acAdd.Visible := pfShowAddButton in ConfigFlags;
  ToolButton3.Visible := acAdd.Visible;
  self.AutoSize := False;

  if pfInputKol in ConfigFlags then
  begin
    ConfigFlags := ConfigFlags + [pfIsOpenForView];
    Caption := 'Введите количество ТМЦ';
  end;

  if pfVidPostEdit in ConfigFlags then ConfigFlags := ConfigFlags + [pfVidPost];

  if pfIsOpenForView in ConfigFlags then
  begin
    ConfigFlags := ConfigFlags + [pfDontSave];
    // режим просмотра - когда оформляется расход
    cePriceView.Enabled := False;
    sesumm.Enabled := False;
    edFN_Party_num.Enabled := False;

    edMedic.Enabled := False;
    edSerial.Enabled := False;
    cbProdCert.Enabled := False;
    edProducer.Enabled := False;
    edCertificate.Enabled := False;

    dedGoden.Enabled := False;
    chbGoden.Enabled := False;

    edEdIzm.Enabled := False;
    edInvNomer.Enabled := False;
    medQUOTA_CODE1.Enabled   := False;
    medQUOTA_CODE234.Enabled := False;    

    paNacenki.Enabled := False;
    seNDS.Enabled := False;
    seNacenka.Enabled := False;
    cedPriceMnf.Enabled := False;

    chbJNVLS.Enabled := False;       
  end
  else
  begin
    if (pfFinSource in ConfigFlags)and
       (dmMain.ConfigParams.GetParamValue('FUNC_USE_MIXED_FIN_SOURCE_IN_PRIH', 1) = 1) then
      lcbFinSource.Enabled := True;
  end;

  if pfHideProdCert in ConfigFlags then
  begin
    paProdCert.Hide;
    cbProdCert.Visible     := False;
    edCertificate.Visible  := False;
    edProducer.Visible     := False;
    lblProducer.Visible    := False;
    lblCertificate.Visible := False;
    self.Height := self.Height - paProdCert.Height;
  end;

  if pfLockMedicPriceSumm in ConfigFlags then
  begin
    seKol.Enabled := True;
    cePriceView.Enabled := False;
    sesumm.Enabled := False;

    paNacenki.Enabled := False;
    seNDS.Enabled := False;
    seNacenka.Enabled := False;
    cedPriceMnf.Enabled := False;      

    edMedic.Enabled := False;
    edSerial.Enabled := True;
    cbProdCert.Enabled := True;
    dedGoden.Enabled := True;
    chbGoden.Enabled := True;

    edEdIzm.Enabled := False;
  end;

  if pfLockMedic in ConfigFlags then
  begin
    seKol.Enabled := True;
    cePriceView.Enabled := True;
    sesumm.Enabled := True;

    edMedic.Enabled := False;
    edSerial.Enabled := True;
    cbProdCert.Enabled := True;
    dedGoden.Enabled := True;
    chbGoden.Enabled := True;

    edEdIzm.Enabled := False;
  end;

  if pfDontShowKolSum in ConfigFlags then
  begin
    seKol.Enabled := False;
    sesumm.Enabled := False;

    seKol.Visible := False;
    sesumm.Visible := False;
    laKol.Visible := False;
    laSum.Visible := False;
    ConfigFlags := ConfigFlags - [pfNacenka];
    ConfigFlags := ConfigFlags - [pfNDS];    
  end;

  if pfVidPost in ConfigFlags then
  begin
    lcbVidPost.Show;
    laVidPost.Show;
  end;

  if pfFinSource in ConfigFlags then
  begin
    lcbFinSource.Show;
    laFinSource.Show;
  end;

  if ((pfFinSource in ConfigFlags) or (pfVidPost in ConfigFlags)) = False then
  begin // убираем панель с ист. финансирования и видом поступлений, если они оба выключены
    paFinSource_VidPost.Hide;
    self.Height := self.Height - paFinSource_VidPost.Height;
  end;

  if (pfInvNomer in ConfigFlags) = False then
  begin
    paInvNomer.Hide;
    self.Height := self.Height - paInvNomer.Height;
  end;  

  if (pfDrugID in ConfigFlags) = False then
  begin
    paDrugID.Hide;
    self.Height := self.Height - paDrugID.Height;
  end;

  if (pfQuotaCode in ConfigFlags) = False then
  begin
    paQuotaCode.Hide;
    self.Height := self.Height - paQuotaCode.Height;
  end;

  if pfExpensive in ConfigFlags then
  begin
    chbExpensive.Show;
  end;

  if pfCheckBrak in ConfigFlags then
  begin
    edSerial.Width := edSerial.Width - sbuCheckBrak.Width;
    sbuCheckBrak.Show;
    chbFL_Brak.Show;
  end;

  if ((pfExpensive in ConfigFlags) or (pfCheckBrak in ConfigFlags) or (pfJNVLS in ConfigFlags)) = False  then
  begin // убираем панель c галочками Дорогостоящий и Забракован, если они обе выключены
    paExpensive_Brak.Hide;
    self.Height := self.Height - paExpensive_Brak.Height;
  end;

  if ((pfNDS in ConfigFlags) or (pfNacenka in ConfigFlags)) = False then
  begin // убираем панель с наценками, если они обе выключены
    paNacenki.Hide;
    grbPriceKol.Height := grbPriceKol.Height - paNacenki.Height;

    self.Height := self.Height - paNacenki.Height;
  end;

  if pfInputSum in ConfigFlags then
  begin
    seSumm.Enabled := True;
  end;

  laNDS.Visible     := (pfNDS in ConfigFlags);
  seNDS.Visible     := (pfNDS in ConfigFlags);

  laNacenka.Visible   := (pfNacenka in ConfigFlags) and (dmMain.ConfigParams.GetParamValue('FUNC_HIDE_NACENKA', 0) = 0);
  seNacenka.Visible   := (pfNacenka in ConfigFlags) and (dmMain.ConfigParams.GetParamValue('FUNC_HIDE_NACENKA', 0) = 0);
  laPriceMnf.Visible  := (pfNacenka in ConfigFlags);
  cedPriceMnf.Visible := (pfNacenka in ConfigFlags);

  if (dmMain.ConfigParams.GetParamValue('FUNC_HIDE_NACENKA', 0) = 1) then //Убираем автозаполнение Цены при редактировании Цены поставщика
  begin
    cedPriceMnf.OnKeyDown := nil;
    cedPriceMnf.Properties.OnChange := nil;
  end;

  chbJNVLS.Visible    := (pfJNVLS in ConfigFlags);  

  self.AutoSize := True;

  // делаем по аналогии
  if nId < 1 then
  begin //если препарат добавляется, то при открытии формы сразу даем выбрать медикамент
    nID := -1;
    edMedicButtonClick( edMedic );
    if nMedicID <= 0 then
      FModRes := mrCancel; // Добавил Воронов О.А. 13.08.2007 - если не выбрали медикамент, закрываем форму через таймер - по другому не получилось
  end;

  FillForm;

  // если окно открывается для ввода кол-ва, то ставим фокус на поле ввода
  if (pfInputKol in ConfigFlags)and(seKol.Enabled)and(seKol.Visible) then
  begin 
    seKol.SetFocus;
  end
  else
  begin
    edSerial.SetFocus;
  end;
end;

procedure TfrmMedKardEdit.cedPriceMnfKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    cePriceView.EditValue := CalcPriceWithNacenka;
end;

procedure TfrmMedKardEdit.cedPriceMnfPropertiesChange(Sender: TObject);
begin
  cePriceView.EditValue := CalcPriceWithNacenka;
end;

procedure TfrmMedKardEdit.cePriceViewEnter(Sender: TObject);
begin
  cePriceView.SelStart  := 1;
  cePriceView.SelLength := 99;
end;

procedure TfrmMedKardEdit.cePriceViewKeyPress(Sender: TObject;  var Key: Char);
begin
  flprice := False;
  flsum   := False;
end;

procedure TfrmMedKardEdit.sesummKeyPress(Sender: TObject; var Key: Char);
begin
  flprice := False;
  flsum   := False;
end;

procedure TfrmMedKardEdit.chbGodenClick(Sender: TObject);
begin
  dedGoden.Enabled := chbGoden.Checked and chbGoden.Enabled;
  if chbGoden.Checked then
    dedGoden.Date := Trunc(ServerDate(dmMain.os))
  else
    dedGoden.Clear;
end;

procedure TfrmMedKardEdit.Timer1Timer(Sender: TObject);
begin
  if FModRes <> 0 then ModalResult := FModRes;
end;

procedure TfrmMedKardEdit.seKolEnter(Sender: TObject);
begin
  seKol.SelStart  := 1;
  seKol.SelLength := 99;
end;

procedure TfrmMedKardEdit.seKolPropertiesChange(Sender: TObject);
begin
  if flsum then Exit;
  flkol := True;
  if seKol.Value < 0 then
    seKol.Value := 0;

  if pfInputKol in ConfigFlags then // когда делается ввод количества, меняется сумма, а не цена
    seSumm.Value := seKol.Value * cePriceView.Value
  else
    if (seKol.Text <> '') and (seKol.Value <> 0) then
      cePriceView.Value := seSumm.Value / seKol.Value;
  flkol := False;
end;

procedure TfrmMedKardEdit.seSummEnter(Sender: TObject);
begin
  seSumm.SelStart  := 1;
  seSumm.SelLength := 99;
end;

procedure TfrmMedKardEdit.seSummPropertiesChange(Sender: TObject);
begin
  if flprice then Exit;
  flsum := True;
  if pfInputSum in ConfigFlags then // когда делается ввод суммы, меняется кол-во, а не цена
    seKol.Value := seSumm.Value / cePriceView.Value
  else
    if (seKol.Value <> 0)and(sesumm.Text <> '') then
      cePriceView.Value := seSumm.Value / seKol.Value;
  flsum := False;
end;

procedure TfrmMedKardEdit.cePriceViewPropertiesChange(Sender: TObject);
begin
  if flsum then Exit;
  flprice := True;
  if (cePriceView.Text <> '') then
    seSumm.Value := seKol.Value * cePriceView.Value;
  flprice := False;
end;

procedure TfrmMedKardEdit.dedGodenPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  cxDateEdit_PropertiesValidate_WithNull(Sender, DisplayValue, ErrorText, Error);
end;

procedure TfrmMedKardEdit.chbExpensiveClick(Sender: TObject);
begin
  if chbExpensive.Checked then
  begin
    chbExpensive.Font.Color := clRed;
    chbExpensive.Font.Style := chbExpensive.Font.Style + [fsBold];
  end
  else
  begin
    chbExpensive.Font.Color := clBlack;
    chbExpensive.Font.Style := chbExpensive.Font.Style - [fsBold];
  end;
end;

procedure TfrmMedKardEdit.acCheckBrakExecute(Sender: TObject);
var
  FUNIQSTR : string;
begin
  FUNIQSTR := '';
  chbFL_Brak.Checked := DoCheckAndShowBrakSelect(Self,  edSerial.Left, (edSerial.Top+edSerial.Height), FUNIQSTR, edSerial.Text);
  UNIQSTR := FUNIQSTR;
end;

end.
