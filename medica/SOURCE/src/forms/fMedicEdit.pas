// $Medotrade: sotinov/mis/medica/src/forms/fMedicEdit.pas,v 1.4 2006/09/02 07:42:11 sotinov Exp $
//
UNIT fMedicEdit;

INTERFACE

USES
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, StdCtrls, Db, OracleData, DBCtrls,
  Oracle, ExtCtrls, Buttons, Grids, DBGrids,
  Variants, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxMaskEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGridLevel, cxGrid, cxContainer,
  cxTextEdit, cxSpinEdit, JvComponentBase, JvFormPlacement, fMedic,
  cxLookAndFeelPainters, cxGroupBox, cxCheckBox, cxTL, cxInplaceContainer, cxDBTL, cxTLData, cxDropDownEdit, Mask, JvExMask, JvToolEdit;

TYPE
 TfrmMedicEdit = CLASS(TForm)
  CoolBar1: TCoolBar;
  ToolBar1: TToolBar;
    al: TActionList;
  acSave: TAction;
  acAdd: TAction;
  acCancel: TAction;
  ToolButton1: TToolButton;
  ToolButton2: TToolButton;
  ToolButton3: TToolButton;
  ToolButton4: TToolButton;
  ToolButton5: TToolButton;
    FormStorage: TJvFormStorage;
    aEqual: TAction;
    odsFEdizm: TOracleDataSet;
    dsFEdizm: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    paNames: TPanel;
    grbNames: TGroupBox;
    Label1: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    bbEqual: TBitBtn;
    edEanCode: TEdit;
    bbChoseRlsPrep: TBitBtn;
    grbEI: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    lcbMassUnits: TDBLookupComboBox;
    paDescription: TPanel;
    gbDescription: TGroupBox;
    edComment: TMemo;
    GroupBox3: TGroupBox;
    lcbNarco: TDBLookupComboBox;
    edNameLat: TEdit;
    lblNameLat: TLabel;
    GroupBox4: TGroupBox;
    dsMedicItems: TDataSource;
    cbFEdizm: TDBLookupComboBox;
    Label9: TLabel;
    Label10: TLabel;
    cbUEdIzm: TDBLookupComboBox;
    Label4: TLabel;
    edNameInternational: TEdit;
    Label13: TLabel;
    edName: TEdit;
    seKolFinU: TcxSpinEdit;
    seMass: TcxSpinEdit;
    rbuRusName: TRadioButton;
    rbuLatName: TRadioButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    odsMedicItems: TOracleDataSet;
    odsMedicRLS: TOracleDataSet;
    oqUpdate_Visible_For_Not_Apteka: TOracleQuery;
    oqFL_EQUIPMENT: TOracleQuery;
    chbIsEquipment: TCheckBox;
    paLevel: TPanel;
    Label5: TLabel;
    cbLevel: TDBLookupComboBox;
    Panel2: TPanel;
    cbLgota: TCheckBox;
    chbUpdate_Visible_For_Not_Apteka: TCheckBox;
    paQuotaCode234: TPanel;
    medQuotaCode: TcxMaskEdit;
    Label14: TLabel;
    paFarmGr: TPanel;
    Label2: TLabel;
    cbFarmGr: TDBLookupComboBox;
    paGROUP_LF: TPanel;
    paUchGr: TPanel;
    Label3: TLabel;
    lbGROUP_LF: TLabel;
    cbGROUP_LF: TDBLookupComboBox;
    cxGridMedicItems: TcxGrid;
    cxGridMedicItemsDBTableView1: TcxGridDBTableView;
    cxGridMedicItemsDBTableView1FN_ORDER: TcxGridDBColumn;
    cxGridMedicItemsDBTableView1FC_MEDIC: TcxGridDBColumn;
    cxGridMedicItemsDBTableView1FC_EI: TcxGridDBColumn;
    cxGridMedicItemsDBTableView1FN_AMOUNT: TcxGridDBColumn;
    cxGridMedicItemsLevel1: TcxGridLevel;
    btAddMedicItems: TButton;
    btDelMedicItems: TButton;
    cxGridMedicItemsDBTableView1FL_TARA: TcxGridDBColumn;
    Label8: TLabel;
    edShortName: TEdit;
    paATC: TPanel;
    Label15: TLabel;
    peATC: TcxPopupEdit;
    tlATC: TcxDBTreeList;
    tlATCNAME: TcxDBTreeListColumn;
    chbFormular: TCheckBox;
    chbJNVLS: TCheckBox;
    paProdcert: TPanel;
    lblProducer: TLabel;
    edProducer: TJvComboEdit;
    edCertificate: TJvComboEdit;
    lblCertificate: TLabel;
    paClass: TPanel;
    Label16: TLabel;
    cbClass: TcxComboBox;
    paOKDP: TPanel;
    Label17: TLabel;
    edOKDP: TJvComboEdit;
    tlUchGr: TcxDBTreeList;
    tlUchGrFC_UCHGR: TcxDBTreeListColumn;
    peUchGr: TcxPopupEdit;
  PROCEDURE acSaveExecute(Sender: TObject);
  PROCEDURE acAddExecute(Sender: TObject);
  PROCEDURE acCancelExecute(Sender: TObject);
    procedure edNameChange(Sender: TObject);
    procedure aEqualExecute(Sender: TObject);
    procedure bbChoseRlsPrepClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure seKolFinUChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btAddMedicItemsClick(Sender: TObject);
    procedure btDelMedicItemsClick(Sender: TObject);
    procedure cbGROUP_LFClick(Sender: TObject);
    procedure cxGridMedicItemsDBTableView1FN_ORDERPropertiesEditValueChanged(
      Sender: TObject);
    procedure cxGridMedicItemsDBTableView1FN_ORDERPropertiesChange(
      Sender: TObject);
    procedure tlATCDblClick(Sender: TObject);
    procedure tlATCKeyPress(Sender: TObject; var Key: Char);
    procedure edProducerButtonClick(Sender: TObject);
    procedure edOKDPButtonClick(Sender: TObject);
    procedure tlUchGrDblClick(Sender: TObject);
    procedure tlUchGrKeyPress(Sender: TObject; var Key: Char);
 private
	FnID: Integer;
  frmMedic : TfrmMedic;
  procedure SetnID(const Value: Integer);
  procedure ClearInputFields;
  { Private declarations }
 public
	{ Public declarations }
	cbType_KeyValue : integer; // это поле нужно для исправления косяка со странностью выбора "Типа"
	was_cbType_KeyValue_change : boolean;       
  m_nProdCertID : integer;

  function DoSave: boolean;
	property nID: Integer read FnID write SetnID;
 END;

function doShowMedicEdit(pid: integer; breadonly:boolean = FALSE): integer;
//VAR
// frmMedicEdit: TfrmMedicEdit;

implementation

uses
	fmainform, fdmMain, fRlsChosePrep, fMedicSelect, uProdCertDlg, uSprOKDP;

{$R *.DFM}

function doShowMedicEdit(pid: integer; breadonly:boolean = FALSE) : integer;
var frmMedicEdit : TfrmMedicEdit;
begin
  Application.CreateForm(TfrmMedicEdit, frmMedicEdit);
//  frmMedicEdit.Parent.Name
//	frmMedicEdit := TfrmMedicEdit.Create( frmMedic);

	frmMedicEdit.was_cbType_KeyValue_change:=false;
  try
		frmMedicEdit.nID := pID;
    if breadonly then
    begin
      frmMedicEdit.edName.ReadOnly := TRUE;
			frmMedicEdit.peUchGr.Enabled := False;
			frmMedicEdit.cbFarmGr.ReadOnly := TRUE;
			frmMedicEdit.cbUEdIzm.ReadOnly := TRUE;
			frmMedicEdit.edComment.ReadOnly := TRUE;
      frmMedicEdit.seKolFinU.Properties.ReadOnly := True;
      frmMedicEdit.rbuRusName.Enabled := False;
      frmMedicEdit.rbuLatName.Enabled := False;   
      frmMedicEdit.peATC.Enabled := False;
      frmMedicEdit.chbFormular.Enabled := False;
      frmMedicEdit.cbClass.Enabled := False;    
      frmMedicEdit.chbJNVLS.Enabled := False;
 			frmMedicEdit.cbFEdizm.ReadOnly := True;
			frmMedicEdit.acSave.Enabled := False;
			frmMedicEdit.acAdd.Enabled := False;
		end;
// Закоментил Воронов О.А. 17.03.2007 для Дьяченко - на закадке Дополнительно всегда показывать "Состав"
//		if frmMedicEdit.nID=-1 then
//			Begin
//				frmMedicEdit.GroupBox4.visible:=false;
//				frmMedicEdit.dbgMedicItems.visible:=false;
//				frmMedicEdit.btAddMedicItems.visible:=false;
//				frmMedicEdit.btDelMedicItems.visible:=false;
//			end
//		else
//			Begin
//				frmMedicEdit.GroupBox4.visible:=true;
//				frmMedicEdit.dbgMedicItems.visible:=true;
//				frmMedicEdit.btAddMedicItems.visible:=true;
//				frmMedicEdit.btDelMedicItems.visible:=true;
//			end;
    if (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_IMN) then
    begin
      frmMedicEdit.rbuLatName.Hide;
      frmMedicEdit.lblNameLat.Hide;
      frmMedicEdit.edNameLat.Hide;      

      frmMedicEdit.paFarmGr.Hide;      
      frmMedicEdit.paATC.Hide;
//      frmMedicEdit.Label2.Hide;

      frmMedicEdit.seMass.Hide;
      frmMedicEdit.Label11.Hide;

      frmMedicEdit.lcbMassUnits.Hide;
      frmMedicEdit.Label12.Hide;

      frmMedicEdit.cbLgota.Hide;
      frmMedicEdit.chbFormular.Hide;    
      frmMedicEdit.chbJNVLS.Hide;
      frmMedicEdit.rbuRusName.Hide;
      frmMedicEdit.rbuLatName.Hide;

      frmMedicEdit.edNameInternational.Hide;
      frmMedicEdit.Label13.Hide;

      frmMedicEdit.Label7.Hide;
      frmMedicEdit.bbChoseRlsPrep.Hide;
      frmMedicEdit.bbEqual.Hide;

      frmMedicEdit.chbUpdate_Visible_For_Not_Apteka.Hide;

      frmMedicEdit.chbIsEquipment.Show;

      // перемещения компонентов
      frmMedicEdit.Label6.Top := frmMedicEdit.lblNameLat.Top;
      frmMedicEdit.edEanCode.Top := frmMedicEdit.edNameLat.Top;

      frmMedicEdit.edName.Width := frmMedicEdit.edEanCode.Width;
      frmMedicEdit.grbNames.Height := frmMedicEdit.chbIsEquipment.Top + frmMedicEdit.chbIsEquipment.Height + 10;

      frmMedicEdit.grbEI.Height := frmMedicEdit.cbFEdizm.Top + frmMedicEdit.cbFEdizm.Height + 10;
    end;


    Result := pid;
		if frmMedicEdit.ShowModal = mrOk then
    begin
      Result := frmMedicEdit.nID;
    end;  

  finally
    frmMedicEdit.Free;
  end;
end;

{********************************************************************************************************}
{        TfrmMedicEdit.acSaveExecute
{********************************************************************************************************}

procedure tfrmmedicedit.acsaveexecute(sender: tobject);
begin
 if (dosave) then
 begin
   ModalResult := mrOk;
//   close;
 end;
end;

PROCEDURE TfrmMedicEdit.SetnID(CONST Value: Integer);
VAR
	n1, n2, n3, n4, n5, lnPku, fl_print_lat_name: Double;
	edNameText, edCommentText: STRING;
	sNameLat : string;
BEGIN
	FnID := Value;
	if value <> -1 then
	begin
		dmMain.pkgMedic.GETBYID(nID, edNameText, edCommentText, n1, n2, n3, n4,
			lnPku, n5, sNameLat,fl_print_lat_name);
		edNameLat.Text := sNameLat;
		cbLgota.Checked := (n5 = 1);
		edName.Text := edNameText;
		edComment.Text := edCommentText;
		peUchGr.Tag := Trunc(n1);
    dmMain.odsUchGr.Locate('UCHGRID',peUchGr.Tag,[]);
    peUchGr.Text := dmMain.odsUchGr.FieldByName('FC_UCHGR').AsString;
		cbUEdIzm.KeyValue := n2;
    if fl_print_lat_name = 0 then rbuRusName.Checked := True else rbuLatName.Checked := True;  // 'Печать латинских названий в отчетах (0 - русское, 1 - латинское)'
//------------------------------------------------------------------------------
    if not frmMedic.odsMedicsList.FieldByName('FN_FPACKINUPACK').IsNull then
      seKolFinU.Value := frmMedic.odsMedicsList.FieldByName('FN_FPACKINUPACK').AsFloat;
    cbFEdizm.KeyValue := frmMedic.odsMedicsList.FieldByName('FK_FPACKID').AsInteger;

    if not frmMedic.odsMedicsList.FieldByName('FN_MASS').IsNull then
      seMass.Value := frmMedic.odsMedicsList.FieldByName('FN_MASS').AsFloat;
    lcbMassUnits.KeyValue := frmMedic.odsMedicsList.FieldByName('FK_MASSUNITS').AsInteger;

    lcbNarco.KeyValue := frmMedic.odsMedicsList.FieldByName('FK_SPECIALMEDIC').AsInteger;
//------------------------------------------------------------------------------
    cbLevel.KeyValue := n3;
    cbFarmGr.KeyValue := n4;

    chbUpdate_Visible_For_Not_Apteka.Checked := (frmMedic.odsMedicsList.FieldByName('FL_VISIBLE_FOR_NOT_APTEKA').AsInteger = 1);
    chbFormular.Checked := (frmMedic.odsMedicsList.FieldByName('FL_FORMULAR').AsInteger = 1);
    chbJNVLS.Checked := (frmMedic.odsMedicsList.FieldByName('FL_JNVLS').AsInteger = 1);

    edProducer.Text    := frmMedic.odsMedicsList.FieldByName('FC_PROD').AsString;
    edCertificate.Text := frmMedic.odsMedicsList.FieldByName('FC_CERT').AsString;
    m_nProdCertID := nvl(frmMedic.odsMedicsList.FieldByName('fn_medicprodcertid').AsVariant, -1);

    edOKDP.Tag := frmMedic.odsMedicsList.FieldByName('FK_OKDP').AsInteger;
    edOKDP.Text := frmMedic.odsMedicsList.FieldByName('FC_OKDP').AsString;

    cbClass.Text := frmMedic.odsMedicsList.FieldByName('FC_CLASS').AsString;

    if (dmMain.ConfigParams.GetParamValue('FUNC_USE_GROUP_LF', 0) = 1) then
    begin
      cbGROUP_LF.KeyValue := frmMedic.odsMedicsList.FieldByName('FK_GROUP_LF').AsVariant;
    end;

    edNameInternational.Text := frmMedic.odsMedicsList.FieldByName('FC_INTERNATIONAL_NAME').AsString;
    edNameLat.Text := frmMedic.odsMedicsList.FieldByName('FC_NAME_LAT').AsString;    
    edShortName.Text := frmMedic.odsMedicsList.FieldByName('FC_SHORTNAME').AsString;
    if bbChoseRlsPrep.Tag > 0 then
    begin
    // перенос 2-х полей NDV и FC_PREP из frmMedic.odsMedicsList в odsMedicRLS
    // поскольку эти поля для списка медикаментов не нужны. Воронов О.А. 19.03.2008
      bbChoseRlsPrep.Tag := fdmMain.nvl(frmMedic.odsMedicsList.FieldByName('FK_NOMEN_RLS').AsVariant, -1);
      odsMedicRLS.Close;
      odsMedicRLS.SetVariable('FK_NOMEN_RLS', bbChoseRlsPrep.Tag);
      odsMedicRLS.SetVariable('medicid', FnID);
      odsMedicRLS.Open;

     // Добавил Воронов О.А. 20.03.2007 Показывать латинское и международное имя (если оно есть)
      if Trim(edNameInternational.Text) = '' then
        edNameInternational.Text := odsMedicRLS.FieldByName('NDV').AsString;

      if trim(odsMedicRLS.FieldByName('FC_PREP').AsString) <> '' then
      begin
        bbChoseRlsPrep.Caption := odsMedicRLS.FieldByName('FC_PREP').AsString + ' >>';
        bbChoseRlsPrep.Hint := odsMedicRLS.FieldByName('FC_PREP').AsString;
      end;
    end;

    if (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_IMN) then
    begin
      chbIsEquipment.Checked := (frmMedic.odsMedicsList.FieldByName('FL_EQUIPMENT').AsInteger = 1);
    end;

    if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 1) then
    begin
//      medQuotaCode.Properties.EditMask := '00-00;0;_';
      medQuotaCode.EditValue := frmMedic.odsMedicsList.FieldByName('FC_QUOTA_CODE_34').AsString;
//      medQuotaCode.Properties.EditMask := '00-00;1;_';
    end;

    edEanCode.Text := frmMedic.odsMedicsList.FieldByName('FC_EANCODE').AsString;

    if dmMain.odsATC.Locate('ID',frmMedic.odsMedicsList.FieldByName('FK_ATC').AsInteger,[]) then
    begin
      peATC.Tag := frmMedic.odsMedicsList.FieldByName('FK_ATC').AsInteger;
      peATC.Text := dmMain.odsATC.FieldByName('NAME').AsString;
    end;

    edNameChange(nil); //включить доступность заравнивания если трэба
  end
  else edname.text := '';


	//  edName.SetFocus;
	odsMedicItems.Close;
	odsMedicItems.SetVariable('FK_MEDIC', FnID);
	odsMedicItems.Open;
end;

procedure TfrmMedicEdit.tlATCDblClick(Sender: TObject);
begin
  peATC.Text := dmMain.odsATC.FieldByName('NAME').AsString;
  peATC.Tag := dmMain.odsATC.FieldByName('ID').AsInteger;
  peATC.PopupWindow.CloseUp;
end;

procedure TfrmMedicEdit.tlATCKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = CHR(VK_RETURN) then
  begin
    peATC.Text := dmMain.odsATC.FieldByName('NAME').AsString;
    peATC.Tag := dmMain.odsATC.FieldByName('ID').AsInteger;
    peATC.PopupWindow.CloseUp;
  end;
end;

procedure TfrmMedicEdit.tlUchGrDblClick(Sender: TObject);
begin
  peUchGr.Text := dmMain.odsUchGr.FieldByName('FC_UCHGR').AsString;
  peUchGr.Tag := dmMain.odsUchGr.FieldByName('UCHGRID').AsInteger;
  peUchGr.PopupWindow.CloseUp;
end;

procedure TfrmMedicEdit.tlUchGrKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = CHR(VK_RETURN) then
  begin
    peUchGr.Text := dmMain.odsUchGr.FieldByName('FC_UCHGR').AsString;
    peUchGr.Tag := dmMain.odsUchGr.FieldByName('UCHGRID').AsInteger;
    peUchGr.PopupWindow.CloseUp;
  end;
end;

PROCEDURE TfrmMedicEdit.acAddExecute(Sender: TObject);
BEGIN
  DoSave;
  ClearInputFields;
END;

PROCEDURE TfrmMedicEdit.acCancelExecute(Sender: TObject);
BEGIN
  try
    dmMain.os.RollbackToSavepoint('MedicEdit');
  except
  end;

	Close;
END;

function TfrmMedicEdit.DoSave: boolean;
var
  fl_print_lat_name: Double;
begin
  //
  seKolFinU.PostEditValue;
  seMass.PostEditValue;
  medQuotaCode.PostEditValue;
  IF (FnID<>-1) AND (odsMedicItems.IsEmpty = FALSE) THEN odsMedicItems.Edit;
  IF edName.Text = '' THEN
  BEGIN
    windows.MessageBox(Handle, 'Обязательно ввести название объекта учета!',
                       'Ошибка', MB_OK + MB_ICONERROR);
    PageControl1.ActivePageIndex:=0;
    edName.SetFocus;
    result := FALSE;
    Exit;
  END;
{ IF cbFarmGr.Text = '' THEN BEGIN
	 windows.MessageBox(Handle,
		'Обязательно ввести приндалежность к фармакологической группе!',
		'Ошибка',
		MB_OK + MB_ICONERROR);
	 PageControl1.ActivePageIndex:=0;
	 cbFarmGr.SetFocus;
	 result := FALSE;
	 Exit;
 END;}
  IF peUchGr.Text = '' THEN
  BEGIN
    windows.MessageBox(Handle,
          'Обязательно ввести принадлежность к учетной группе!', 'Ошибка', MB_OK +
          MB_ICONERROR);
    PageControl1.ActivePageIndex:=0;
    peUchGr.DroppedDown := true;
    result := FALSE;
    Exit;
  end;
  IF cbUEdIzm.Text = '' then
  begin
    windows.MessageBox(Handle, 'Обязательно ввести упаковочные единицы измерения!',
    'Ошибка', MB_OK + MB_ICONERROR);
    PageControl1.ActivePageIndex:=0;
    cbUEdIzm.SetFocus;
    result := FALSE;
    Exit;
  end;

// если не указали фасовочные еидиницы или количество, выставляем их равными упаковочными 1 к 1
// чтобы далее в запросах было удобнее и не приходилось изворачиваться Воронов О.А. 12.07.2007
  if (cbFEdizm.Text = '')or(seKolFinU.Value <= 0) then
  begin
    cbFEdizm.KeyValue := cbUEdIzm.KeyValue;
    seKolFinU.Value := 1;
  end;
  if rbuLatName.Checked then fl_print_lat_name := 1 else fl_print_lat_name := 0;

	FnID :=     trunc(dmMain.pkgMedic.DOSET(edName.Text,
                                       edComment.Text,
                                       fdmMain.nvl(peUchGr.Tag,-1),
                                       fdmMain.nvl(cbUEdIzm.KeyValue,-1),
                                       fdmMain.nvl(cbFarmGr.KeyValue,0),
                                       fdmMain.nvl(cbLevel.KeyValue,0),
                                       -1,  //есть ситуция, когда тип не заполнен
                                    //	 cbPayType.KeyValue, // Заменил Воронов О.А. 19.03.2007 - убрали из списка обязательных для заполнения
                                       -1,
                                       nID,
                                       bbChoseRlsPrep.Tag,
                                       edEanCode.Text,
                                       seKolFinU.EditValue,
                                       fdmMain.nvl(cbFEdizm.KeyValue,0),
                                       seMass.EditValue,
                                       fdmMain.nvl(lcbMassUnits.KeyValue, 0),
                                       fdmMain.nvl(lcbNarco.KeyValue, 0),
                                       Byte(cbLgota.checked),
                                       edNameLat.Text,
                                       fl_print_lat_name));

// выставление свойства, по которому будет отсекаться список медикаментов во всех приложениях, кроме аптеки
// Воровнов О.А. - замена неправильного использования уровня доступа
  dmMain.InitAdditionalUpdateTable('MED.TMEDIC');
  if dmMain.ConfigParams.GetParamValue('FUNC_MEDIC_VISIBLE_FOR_NOT_APTEKA', 0) = 1 then
  begin
    if chbUpdate_Visible_For_Not_Apteka.Checked then
      dmMain.AddAdditionalUpdateTable('FL_VISIBLE_FOR_NOT_APTEKA', otInteger, 1)
    else
      dmMain.AddAdditionalUpdateTable('FL_VISIBLE_FOR_NOT_APTEKA', otInteger, 0);
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_FORMULAR', 0) = 1 then
  begin
    if chbFormular.Checked then
      dmMain.AddAdditionalUpdateTable('FL_FORMULAR', otInteger, 1)
    else
      dmMain.AddAdditionalUpdateTable('FL_FORMULAR', otInteger, 0);
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_MEDICPRODCERT', 0) = 1 then
  begin
    dmMain.AddAdditionalUpdateTable('FN_MEDICPRODCERTID', otInteger, m_nProdCertID);
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_OKDP', 0) = 1 then
  begin
    dmMain.AddAdditionalUpdateTable('FK_OKDP', otInteger, edOKDP.Tag);
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_CLASS', 0) = 1 then
  begin
    dmMain.AddAdditionalUpdateTable('FC_CLASS', otString, cbClass.Text);
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_JNVLS', 0) = 1 then
  begin
    if chbJNVLS.Checked then
      dmMain.AddAdditionalUpdateTable('FL_JNVLS', otInteger, 1)
    else
      dmMain.AddAdditionalUpdateTable('FL_JNVLS', otInteger, 0);
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_IMN) then
  begin
    if chbIsEquipment.Checked then
      dmMain.AddAdditionalUpdateTable('FL_EQUIPMENT', otInteger, 1)
    else
      dmMain.AddAdditionalUpdateTable('FL_EQUIPMENT', otInteger, 0)
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_GROUP_LF', 0) = 1) then
  begin
    dmMain.AddAdditionalUpdateTable('FK_GROUP_LF', otInteger, cbGROUP_LF.KeyValue);
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 1) then
  begin
    medQuotaCode.PostEditValue;
    dmMain.AddAdditionalUpdateTable('FC_QUOTA_CODE_34', otString, medQuotaCode.Text);

    // обновляем коды квотирования в партиях
    if dmMain.odsUchGr.Locate('uchgrid', fdmMain.nvl(peUchGr.Tag,-1), []) then
      dmMain.oqSetQUOTA_UchGr.SetVariable('FC_QUOTA_CODE_2', nvl(dmMain.odsUchGr.FieldByName('FC_QUOTA_CODE_2').AsVariant,'00'))
    else
      dmMain.oqSetQUOTA_UchGr.SetVariable('FC_QUOTA_CODE_2', '00');

    dmMain.oqSetQUOTA_UchGr.SetVariable('MEDICID', FnID);
    dmMain.oqSetQUOTA_UchGr.SetVariable('FC_QUOTA_CODE_34', medQuotaCode.EditValue);
    dmMain.oqSetQUOTA_UchGr.Execute;    
  end;

  dmMain.AddAdditionalUpdateTable('FC_INTERNATIONAL_NAME', otString, edNameInternational.Text);    
  dmMain.AddAdditionalUpdateTable('FC_SHORTNAME', otString, edShortName.Text);      //Added by Neronov A.S. 16.01.2013  

  if (peATC.Tag > 0) and (peATC.Text <> '') then
    dmMain.AddAdditionalUpdateTable('FK_ATC', otInteger, peATC.Tag)      //Added by Neronov A.S. 20.02.2013
  else
    dmMain.AddAdditionalUpdateTable('FK_ATC', otInteger, null);      

  dmMain.ExecuteAdditionalUpdateTable('MEDICID', otInteger, FnID);

	IF (FnID<>-1) AND (odsMedicItems.IsEmpty = FALSE) THEN odsMedicItems.Post;   //NSV 20060914 закоментировал. а то ошибки выдает
	Result := TRUE;
// добавил Воронов О.А. 19.03.2007 Исправление ошибки добавления препарата, являющегося составной частью
//  if FnID = -1 then nID := Trunc(frmmedic.id);
  dmMain.os.Commit;

  if ( frmMedic.odsMedicsList.FieldByName('UCHGRID').AsInteger <> peUchGr.Tag ) and
     ( dmMain.ConfigParams.GetParamValue('FUNC_USE_MEDUCHGRP_CH', 0) = '1' ) then
  try
    // заносим смену учетной группы в историю
    dmMain.pkgMedic.SETUCHGRCHANGEHISTORY
      ( frmMedic.odsMedicsList.FieldByName('MEDICID').AsInteger,
        frmMedic.odsMedicsList.FieldByName('UCHGRID').AsInteger,
        peUchGr.Tag,
        dmMain.MOID);
    // обновляем учетные группы в карточках
    dmMain.pkgMedic.SETUCHGRFORKARTS
      ( frmMedic.odsMedicsList.FieldByName('MEDICID').AsInteger,
        peUchGr.Tag,
        Date );
  finally
  end;

end;

procedure TfrmMedicEdit.edNameChange(Sender: TObject);
begin
  aEqual.Enabled := (edName.Text <> StringReplace(bbChoseRlsPrep.Caption,' >>','',[])) and
    (bbChoseRlsPrep.Caption <> 'Справочник препаратов РЛС >>');
end;

procedure TfrmMedicEdit.edOKDPButtonClick(Sender: TObject);
var
  dlg : TSprOKDP;
begin
  dlg := TSprOKDP.Create(Self);
  if dlg.ShowModal = mrOK then begin
    edOKDP.Tag := dlg.idOKDP;
    edOKDP.Text := dlg.strOKDP;
  end;
  dlg.Free;
end;

procedure TfrmMedicEdit.edProducerButtonClick(Sender: TObject);
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

procedure TfrmMedicEdit.aEqualExecute(Sender: TObject);
begin
  edName.Text := StringReplace(bbChoseRlsPrep.Caption,' >>','',[]);
end;

procedure TfrmMedicEdit.bbChoseRlsPrepClick(Sender: TObject);
var frmRlsChosePrep: TfrmRlsChosePrep;
begin
  frmRlsChosePrep := TfrmRlsChosePrep.Create(Self);
	try
//    frmRlsChosePrep.pEanCode := edEanCode.Text;
//    frmRlsChosePrep.pNomenID := bbChoseRlsPrep.Tag;
    frmRlsChosePrep.PrepInfo.FC_EANCODE := edEanCode.Text;
    frmRlsChosePrep.PrepInfo.FK_ID      := bbChoseRlsPrep.Tag;

    if frmRlsChosePrep.ShowModal = mrOk then
    begin
//      bbChoseRlsPrep.Caption := frmRlsChosePrep.odsRlsPreps.FieldByName('FC_PREP').AsString + ' >>';
//      bbChoseRlsPrep.Hint := frmRlsChosePrep.odsRlsPreps.FieldByName('FC_PREP').AsString;
//      bbChoseRlsPrep.Tag := frmRlsChosePrep.odsRlsPreps.FieldByName('FK_ID').AsInteger;
//
//			edNameLat.Text := frmRlsChosePrep.odsDescription.FieldByName('LATINE_NAME_NDV').AsString;
//			edEanCode.Text := frmRlsChosePrep.odsRlsPreps.FieldByName('FC_EANCODE').AsString;


      bbChoseRlsPrep.Caption := frmRlsChosePrep.PrepInfo.FC_PREP + ' >>';
      bbChoseRlsPrep.Hint := frmRlsChosePrep.PrepInfo.FC_PREP;
      bbChoseRlsPrep.Tag := frmRlsChosePrep.PrepInfo.FK_ID;

      //  Добавил Воронов О.А. 16.03.2007 по просьбе Дьяченко Евгении
      edName.Text := frmRlsChosePrep.PrepInfo.FC_PREP;
      edNameInternational.Text := frmRlsChosePrep.PrepInfo.NAME_INTERNATIONAL;
      edNameLat.Text := frmRlsChosePrep.PrepInfo.LATINE_NAME_NDV;
      edEanCode.Text := frmRlsChosePrep.PrepInfo.FC_EANCODE;

      edEanCode.ReadOnly := edEanCode.Text <> '';
      if edEanCode.ReadOnly then
        edEanCode.Color := clBtnFace;
      edNameChange(nil); //включить доступность заравнивания если трэба
//------------------------------------------------------------------------------
//      if not frmRlsChosePrep.odsRlsPreps.FieldByName('FK_DFMASS').IsNull then
//      begin
//        seMass.Value := frmRlsChosePrep.odsRlsPreps.FieldByName('DFMASS').AsFloat;
//        lcbMassUnits.KeyValue := frmRlsChosePrep.odsRlsPreps.FieldByName('FK_DFMASS').AsInteger;
//      end;
//      if not frmRlsChosePrep.odsRlsPreps.FieldByName('FK_MASSUNIT').IsNull then
//      begin
//        seKolFinU.Value := frmRlsChosePrep.odsRlsPreps.FieldByName('DRUGSINPPACK').AsFloat;
//        cbFEdizm.KeyValue := frmRlsChosePrep.odsRlsPreps.FieldByName('FK_MASSUNIT').AsInteger;
//      end;
//      cbFarmGr.KeyValue := frmRlsChosePrep.odsRlsPreps.FieldByName('FARMGRID').AsInteger;

      if not frmRlsChosePrep.PrepInfo.FK_DFMASS_IS_NULL then
      begin
        seMass.Value := frmRlsChosePrep.PrepInfo.DFMASS;
        lcbMassUnits.KeyValue := frmRlsChosePrep.PrepInfo.FK_DFMASS;
      end;
      if not frmRlsChosePrep.PrepInfo.FK_MASSUNIT_IS_NULL then
      begin
        seKolFinU.Value := frmRlsChosePrep.PrepInfo.DRUGSINPPACK;
        cbFEdizm.KeyValue := frmRlsChosePrep.PrepInfo.FK_MASSUNIT;
      end;
      cbFarmGr.KeyValue := frmRlsChosePrep.PrepInfo.FARMGRID;
//------------------------------------------------------------------------------
		end;
  finally
    frmRlsChosePrep.Free;
  end;
end;

procedure TfrmMedicEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cbFarmGr.CloseUp(False);
  //cbUchGr.CloseUp(False);
  cbUEdIzm.CloseUp(False);
  cbFEdIzm.CloseUp(False);
  cbLevel.CloseUp(False);
  lcbNarco.Closeup(False);
end;

procedure TfrmMedicEdit.seKolFinUChange(Sender: TObject);
begin
  if TcxSpinEdit(Sender).Value < 0 then
    TcxSpinEdit(Sender).Value := 0;
end;

procedure TfrmMedicEdit.FormCreate(Sender: TObject);
begin
  dmMain.os.Savepoint('MedicEdit');
  // фича для югорска - необходимо контролировать видимость медикамента у  врачей этим полем
  if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_MEDICEDIC_LEVEL', 0) = 1 then
  begin
    paLevel.Show;
  end;
  chbUpdate_Visible_For_Not_Apteka.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_MEDIC_VISIBLE_FOR_NOT_APTEKA', 0) = 1);
  chbFormular.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_FORMULAR', 0) = 1);
  chbJNVLS.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_JNVLS', 0) = 1);
  paClass.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_CLASS', 0) = 1);

  paGROUP_LF.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_GROUP_LF', 0) = 1);

  if fMedic.IsModal then Self.frmMedic := fMedic.frmMedicModal else Self.frmMedic := fMedic.frmMedic;
  PageControl1.ActivePageIndex := 0;
  odsFEdizm.Open;

  paProdcert.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_MEDICPRODCERT', 0) = 1);   
  paOKDP.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_OKDP', 0) = 1);

  paQuotaCode234.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 1);
  if paQuotaCode234.Visible = False then
  begin
    self.Height := self.Height - paQuotaCode234.Height;
  end;

  cxGridMedicItemsDBTableView1FL_TARA.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_TARA_IN_RPO',0) = 1);

  edName.MaxLength    := dmMain.GetFieldLength('med', 'tmedic', 'FC_NAME');
  edNameLat.MaxLength := dmMain.GetFieldLength('med', 'tmedic', 'FC_NAME_LAT');
  edEanCode.MaxLength := dmMain.GetFieldLength('med', 'tmedic', 'FC_EANCODE');

  m_nProdCertID := -1;
end;

procedure TfrmMedicEdit.btAddMedicItemsClick(Sender: TObject);
var
	f : TfrmMedicSelect;
begin
// добавил Воронов О.А. 19.03.2007 Исправление ошибки добавления препарата, являющегося составной частью
  if (FnID = -1)and(windows.MessageBox(Handle, 'Перед заполнением состава препарата его необходимо сохранить.'#13#10'Сделать это сейчас?', 'Запрос на сохранение', MB_YESNO + MB_ICONWARNING) = IDYES) then
    if DoSave then
    begin
      dmmain.os.commit;
      dmMain.os.Savepoint('MedicEdit');
    end;

  if FnID = -1 then Exit;

	f := TfrmMedicSelect.Create(Self);
	f.odsMedic.SetVariable('FK_MEDIC', FnID);
	f.odsMedic.Refresh;
	if f.ShowModal = mrOk then begin
		dmMain.pkgMedic.MedicComplexAdd(FnID, f.odsMedic.FieldByName('FK_MEDIC').AsInteger);
		odsMedicItems.Refresh;
	end;
	f.Free;
end;

procedure TfrmMedicEdit.btDelMedicItemsClick(Sender: TObject);
begin
if odsMedicItems.RecordCount>0 then
	Begin
		IF (FnID<>-1) AND (odsMedicItems.RecordCount=1) THEN
			Begin
				odsMedicItems.Edit;
				odsMedicItems.Post;
			end;
		dmMain.pkgMedic.MedicComplexDel(FnID, odsMedicItems.FieldByName('FK_MEDICITEM').AsInteger);
	end;
try
	odsMedicItems.Refresh;
	except
end;

end;

procedure TfrmMedicEdit.cbGROUP_LFClick(Sender: TObject);
begin
  was_cbType_KeyValue_change:=true;
end;

procedure TfrmMedicEdit.cxGridMedicItemsDBTableView1FN_ORDERPropertiesEditValueChanged( Sender: TObject);
//var
//  ID : Integer;
begin
//  ID := odsMedicItems.FieldByName('fk_mediccomplexid').AsInteger;
//  odsMedicItems.Refresh;
//  odsMedicItems.Locate('fk_mediccomplexid', ID, []);
end;

procedure TfrmMedicEdit.cxGridMedicItemsDBTableView1FN_ORDERPropertiesChange(
  Sender: TObject);
//var
//  ID : Integer;
begin
//  ID := odsMedicItems.FieldByName('fk_mediccomplexid').AsInteger;
//  odsMedicItems.Refresh;
//  odsMedicItems.Locate('fk_mediccomplexid', ID, []);
end;

procedure TfrmMedicEdit.ClearInputFields;
begin
  nID := -1;
  edName.Text := '';
  edNameLat.Text := '';
  rbuRusName.Checked := True;
  rbuLatName.Checked := False;  
  edNameInternational.Text := '';
  bbChoseRlsPrep.Caption := ' Справочник препаратов РЛС >>';
  edEanCode.Text := '';
  cbFarmGr.KeyValue := null;
  peUchGr.Tag  := -1;
  cbGROUP_LF.KeyValue   := null;
  cbLevel.KeyValue  := null;
  cbUEdIzm.KeyValue := null;
  seKolFinU.Value := 0;
  cbFEdizm.KeyValue := null;
  seMass.Value := 0;
  lcbMassUnits.KeyValue := null;
  lcbNarco.KeyValue := null;
  edComment.Text := '';
  odsMedicItems.Close;
  odsMedicItems.SetVariable('FK_MEDIC', -1);
  odsMedicItems.Open;
  PageControl1.ActivePageIndex := 0;
  edName.SetFocus;
end;

end.

