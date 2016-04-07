unit fMedProduceEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, ComCtrls, ToolWin,
	cxSpinEdit, ExtCtrls, Oracle,OracleData, Db,
  Menus, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  Grids, DBGrids, cxCalendar, JvExControls, JvSpeedButton, ImgList,
  cxSpinButton, cxDropDownEdit, cxCheckBox, JvComponentBase,
  JvFormPlacement, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit, Mask,
  JvExMask, JvToolEdit, DBCtrls;

type
  TfrmMedProduceEdit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
		Label1: TLabel;
    deSerial: TEdit;
		Label2: TLabel;
		Label4: TLabel;
    laFC_UEDIZM: TLabel;
    Label6: TLabel;
    edMedic: TcxButtonEdit;
    Label3: TLabel;
    Panel3: TPanel;
		GroupBox1: TGroupBox;
    ToolBar2: TToolBar;
    btnAdd: TToolButton;
    btnEdit: TToolButton;
    btnDel: TToolButton;
    GroupBox2: TGroupBox;
    Splitter1: TSplitter;
    dsObazat_Ingridienti: TDataSource;
    odsObazat_Ingridienti: TOracleDataSet;
		odsMedKartItem: TOracleDataSet;
    dsMedKartItem: TDataSource;
    GroupBox3: TGroupBox;
		Memo1: TMemo;
    PopupMenu1: TPopupMenu;
		PM_Clean: TMenuItem;
    deFN_NUMBER: TcxSpinEdit;
    ToolBar1: TToolBar;
    TB_save: TToolButton;
    ToolButton5: TToolButton;
    TB_cancel: TToolButton;
    Label7: TLabel;
    laFC_FEDIZM: TLabel;
    tbuAutoFill: TToolButton;
    ToolButton2: TToolButton;
    odsIngrOst: TOracleDataSet;
    dsIngrOst: TDataSource;
    oqClearIngr: TOracleQuery;
    cxGridCurIngr: TcxGrid;
    cxGridCurIngrLevel1: TcxGridLevel;
    cxGridCurIngrDBTableView1: TcxGridDBTableView;
    cxGridCurIngrDBTableView1FK_ID: TcxGridDBColumn;
    cxGridCurIngrDBTableView1FK_TKARTCOMPOSID: TcxGridDBColumn;
    cxGridCurIngrDBTableView1FK_KART_ITEM: TcxGridDBColumn;
    cxGridCurIngrDBTableView1TKART_NAME: TcxGridDBColumn;
    cxGridCurIngrDBTableView1FC_UEDIZM: TcxGridDBColumn;
    cxGridCurIngrDBTableView1FN_AMOUNT_FOR1: TcxGridDBColumn;
    cxGridCurIngrDBTableView1FN_AMOUNT: TcxGridDBColumn;
    cxGridObIngr: TcxGrid;
    cxGridObIngrLevel1: TcxGridLevel;
    cxGridObIngrDBTableView1: TcxGridDBTableView;
    cxGridObIngrDBTableView1TMEDICOMPLEX_FK_MEDICITEM: TcxGridDBColumn;
    cxGridObIngrDBTableView1FC_MEDICNAME: TcxGridDBColumn;
    cxGridObIngrDBTableView1FC_UEDIZM: TcxGridDBColumn;
    cxGridObIngrDBTableView1FN_AMOUNT_FOR1: TcxGridDBColumn;
    cxGridObIngrDBTableView1FN_AMOUNT: TcxGridDBColumn;
    deMainAmount: TcxSpinEdit;
    deFasAmount: TcxSpinEdit;
    cxGridCurIngrDBTableView1FN_PARTY_ORDER: TcxGridDBColumn;
    tmRefresh_odsMedKartItem: TTimer;
    cxGridCurIngrDBTableView1FN_OST: TcxGridDBColumn;
    oqUPD_OST: TOracleQuery;
    oqUPD_OST_ALL: TOracleQuery;
    JvFormStorage1: TJvFormStorage;
    deDate: TcxDateEdit;
    chbGodenDo: TCheckBox;
    deGodenDo: TcxDateEdit;
    chbUseTara: TCheckBox;
    odsKARTCOMPOS: TOracleDataSet;
    lcbFinSource: TDBLookupComboBox;
    laFinSource: TLabel;
		procedure edMedicClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxDBGrid1DblClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
		procedure btnEditClick(Sender: TObject);
    procedure dbgDblClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
		procedure PM_CleanClick(Sender: TObject);
    procedure TB_cancelClick(Sender: TObject);
		procedure TB_saveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
		procedure deMainAmountChange(Sender: TObject);
    procedure deFasAmountChange(Sender: TObject);
    procedure tbuAutoFillClick(Sender: TObject);
    procedure cxGridCurIngrExit(Sender: TObject);
    procedure odsObazat_IngridientiAfterRefresh(DataSet: TDataSet);
    procedure odsMedKartItemAfterRefresh(DataSet: TDataSet);
    procedure cxGridCurIngrDBTableView1FN_AMOUNT_FOR1PropertiesEditValueChanged(
      Sender: TObject);
    procedure odsIngrOstAfterOpen(DataSet: TDataSet);
    procedure tmRefresh_odsMedKartItemTimer(Sender: TObject);
    procedure cxGridCurIngrDBTableView1FN_PARTY_ORDERPropertiesEditValueChanged(
      Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure odsMedKartItemBeforeClose(DataSet: TDataSet);
    procedure deDatePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGridCurIngrDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure chbGodenDoClick(Sender: TObject);
    procedure chbUseTaraClick(Sender: TObject);
	private
		{ Private declarations }
		FnMedicID: integer;
    FFN_SUMM_OST : Double; // сумма остатков из всех партий по текущему медикаменту
    FIsOpenForm : Boolean;

		procedure SetnMedicID(const Value: integer);
	public
		{ Public declarations }

		TKARTCOMPOS_FK_ID : integer;
		FN_FPACKINUPACK : integer;
		ideMainAmount: double;
    sFilter : string;
    flIns: boolean;

    procedure Refresh_odsMedKartItem;
		Function CheckAmountOfIngridients:boolean;
// задаем требуемое количество и получаем ответ - есть ли такой остаток в данной партии
		function CheckAmountOfParty(aNeedAmount : Double): boolean;
		function CheckAmountOfAllParty: boolean;

		property TMEDIC_MEDICID: integer read FnMedicID write SetnMedicID;
	end;

Function DoShowMedProduceEdit(TKARTCOMPOS_FK_ID: integer = -1; ins:boolean = true):integer;

var
	frmMedProduceEdit: TfrmMedProduceEdit;
	pfk_medicid:double;
	pfc_TMEDIC_NAME:string;
	pfc_serial:string;
	pfd_data:tdatetime;
	pfn_amount:double;
	pFC_UEDIZM:string;
	pFC_FEDIZM:string;
	pFN_NUMBER:integer;
  pfd_goden_do : Variant;
  pFK_FINSOURCE_ID:integer;
	ModalResulttt:boolean; {true - mrOk, false - mrCancel}

implementation

uses fMedic, fdmMain, fMainForm, fKartsLst,
     fMedProduceList, Math, fMedKardLst, Variants;

{$R *.DFM}

Function TfrmMedProduceEdit.CheckAmountOfIngridients:boolean;
{Проверим, есть ли для всех ингредиентов произвлдимого медикамента (Правый грид), необходимое кол-во на остатке для выбранных в правом гриде карточек
Ф-ия возвращает: true - все есть
								false - ЧЕГО-ТО НЕ ХВАТАЕТ}
var
 i:integer;
 ost,Amount_need:double;
 was_error:boolean;
begin
  frmMedProduceEdit.deMainAmount.PostEditValue;
  was_error:=false;
  Memo1.Clear;
  cxGridObIngrDBTableView1FN_AMOUNT.Caption:='Кол-во на '+floattostr(frmMedProduceEdit.deMainAmount.EditValue)+' порций';
  cxGridCurIngrDBTableView1FN_AMOUNT.Caption:='Кол-во на '+floattostr(frmMedProduceEdit.deMainAmount.EditValue)+' порций';
  odsObazat_Ingridienti.Close;
  frmMedProduceEdit.odsObazat_Ingridienti.SetVariable('tkartcompos_fn_amount', frmMedProduceEdit.deMainAmount.EditValue);
  odsObazat_Ingridienti.Open;


  odsMedKartItem.Close;
  odsMedKartItem.Open;

  odsMedKartItem.DisableControls;
  try
    odsMedKartItem.First;
    while not odsMedKartItem.Eof do
    begin
      i:=round(dmMain.PKGTKARTCOITEM.CHANGEAMOUNT( frmMedProduceEdit.odsMedKartItem.FieldByName('FK_ID').AsInteger,
                                                   frmMedProduceEdit.odsMedKartItem.FieldByName('FK_TKARTCOMPOSID').AsInteger,
                                                   frmMedProduceEdit.deMainAmount.EditValue,
                                                   ost,
                                                   Amount_need) );
      if i=0 then
      Begin // на остатке данной карточки(ингредиента) нет нужного нам кол-ва для frmMedProduceEdit.deMainAmount.value
        frmMedProduceEdit.Memo1.Lines.Add('Ингредиента: '+ frmMedProduceEdit.odsMedKartItem.FieldByName('TKART_NAME').AsString + ' на остатке '+ floattostr(ost) + ', а вам для '+ floattostr(frmMedProduceEdit.demainAmount.EditValue)+' необходимо ' +floattostr(Amount_need) + ' Совет: уменьшите кол-во на 1 порцию  этого ингредиента и добавьте другую карточку этого же объекта учета, у которой укажите недостающее кол-во.');
        was_error:=true;
      end;

      odsMedKartItem.Next;
    end;
  finally
    odsMedKartItem.EnableControls;
  end;
  odsMedKartItem.Close;
  odsMedKartItem.Open;
  Result:= not was_error;
end;


Function DoShowMedProduceEdit(TKARTCOMPOS_FK_ID: integer = -1; ins:boolean = true):integer;
{TKARTCOMPOS_FK_ID - id записи таблицы TKARTCOMPOS.
 ins = true - добавляем запись в tkartcompos, ins = false - редактируем выбранную запись
Ф-ия возвращает: true -  все ок
									false - нажали отмену.}
var
	vpFN_NUMBER:variant;
	pdFN_NUMBER:double;
begin
  ModalResulttt:=false;
  if ins then
  Begin   {добавляем запись}
    ndata:=ServerDate(dmMain.os);
    //dmMain.os.Savepoint('MedProcedureList');
    Application.CreateForm(TfrmMedProduceEdit, frmMedProduceEdit);
//	frmMedProduceEdit.LaFK_ID.Caption:=inttostr(TKARTCOMPOS_FK_ID);
    frmMedProduceEdit.TB_save.enabled:=false;
    vpFN_NUMBER:=dmMain.PKGTKARTCOMPOS.GETNEXTNUMBER;
    pFN_NUMBER:=vpFN_NUMBER;
    frmMedProduceEdit.deFN_NUMBER.value:=pFN_NUMBER;
    frmMedProduceEdit.TKARTCOMPOS_FK_ID:=TKARTCOMPOS_FK_ID;
    frmMedProduceEdit.deMainAmount.EditValue:=1;
    frmMedProduceEdit.deFasAmount.EditValue:=1;
    frmMedProduceEdit.FN_FPACKINUPACK:=1;
    frmMedProduceEdit.odsObazat_Ingridienti.Close;
    frmMedProduceEdit.odsObazat_Ingridienti.SetVariable('tkartcompos_fn_amount', 0);
//	frmMedProduceEdit.LaFK_ID.caption := inttostr(round(dmMain.PKGTKARTCOMPOS.GETLASTNUM));
    frmMedProduceEdit.deSerial.Text   := frmMedProduceEdit.deFN_NUMBER.Text;
//    frmMedProduceEdit.deSerial.text:='';
    frmMedProduceEdit.deDate.Date := ndata;
    frmMedProduceEdit.laFC_FEDIZM.caption :='';
    frmMedProduceEdit.laFC_UEDIZM.caption :='';
    frmMedProduceEdit.flIns:=ins;
    if frmMedProduceEdit.ShowModal = mrOk then
    Begin
      frmMedProduceEdit.deDate.PostEditValue;
      frmMedProduceEdit.deMainAmount.PostEditValue;
      frmMedProduceEdit.deFN_NUMBER.PostEditValue;
      frmMedProduceEdit.deGodenDo.PostEditValue;
      dmMain.PKGTKARTCOMPOS.EDITTKARTCOMPOS( frmMedProduceEdit.TKARTCOMPOS_FK_ID,
                                             frmMedProduceEdit.TMEDIC_MEDICID,
                                             frmMedProduceEdit.deSerial.text,
                                             frmMedProduceEdit.deDate.date,
                                             frmMedProduceEdit.deMainAmount.EditValue,
                                             frmMedProduceEdit.deFN_NUMBER.EditValue,
                                             frmMedProduceEdit.deGodenDo.EditValue
                                             );
      dmMain.InitAdditionalUpdateTable('MED.TKARTCOMPOS');
      if frmMedProduceEdit.chbUseTara.Checked then
        dmMain.AddAdditionalUpdateTable('FL_USE_TARA', otInteger, 1)
      else
        dmMain.AddAdditionalUpdateTable('FL_USE_TARA', otInteger, 0);

      if (dmMain.ConfigParams.GetParamValue('FUNC_USE_FINSOURCE_IN_RPO',0) = 1) then   
        dmMain.AddAdditionalUpdateTable('FK_FINSOURCE_ID', otInteger, frmMedProduceEdit.lcbFinSource.KeyValue);

      dmMain.ExecuteAdditionalUpdateTable('FK_ID', otInteger, frmMedProduceEdit.TKARTCOMPOS_FK_ID);

      dmMain.os.commit;
      result := frmMedProduceEdit.TKARTCOMPOS_FK_ID;
      FreeAndNil(frmMedProduceEdit);
    end
    else
    Begin
      try
        dmMain.os.RollbackToSavepoint('MedProcedureList');
      except
      end;
      FreeAndNil(frmMedProduceEdit);
      result:=-1;
    end;
  end
  else
  Begin  {редактируем запись}
//    dmMain.os.Savepoint('MedProcedureList');
    Application.CreateForm(TfrmMedProduceEdit, frmMedProduceEdit);
//    frmMedProduceEdit.TB_save.enabled:=true;
    frmMedProduceEdit.TKARTCOMPOS_FK_ID:=TKARTCOMPOS_FK_ID;
    frmMedProduceEdit.odsKARTCOMPOS.Close;
    frmMedProduceEdit.odsKARTCOMPOS.SetVariable('FK_TKARTCOMPOSID', TKARTCOMPOS_FK_ID);
    frmMedProduceEdit.odsKARTCOMPOS.Open;    

    frmMedProduceEdit.flIns:=ins;

    frmMedProduceEdit.deFN_NUMBER.Enabled   := not frmMedProduceList.bPodpisan;
    frmMedProduceEdit.deSerial.Enabled      := not frmMedProduceList.bPodpisan;
    frmMedProduceEdit.deDate.Enabled        := not frmMedProduceList.bPodpisan;
    frmMedProduceEdit.edMedic.Enabled       := not frmMedProduceList.bPodpisan;
    frmMedProduceEdit.deMainAmount.Enabled  := not frmMedProduceList.bPodpisan;
    frmMedProduceEdit.deFasAmount.Enabled   := not frmMedProduceList.bPodpisan;
    frmMedProduceEdit.cxGridCurIngr.Enabled := not frmMedProduceList.bPodpisan;
    frmMedProduceEdit.btnAdd.Enabled        := not frmMedProduceList.bPodpisan;
    frmMedProduceEdit.btnEdit.Enabled       := not frmMedProduceList.bPodpisan;
    frmMedProduceEdit.btnDel.Enabled        := not frmMedProduceList.bPodpisan;
    frmMedProduceEdit.tbuAutoFill.Enabled   := not frmMedProduceList.bPodpisan;
    frmMedProduceEdit.cxGridCurIngrDBTableView1FN_OST.Visible := not frmMedProduceList.bPodpisan;
    frmMedProduceEdit.TB_save.Enabled       := not frmMedProduceList.bPodpisan;
    frmMedProduceEdit.chbGodenDo.Enabled    := not frmMedProduceList.bPodpisan;
    frmMedProduceEdit.deGodenDo.Enabled     := not frmMedProduceList.bPodpisan;


    frmMedProduceEdit.odsObazat_Ingridienti.Close;
    pfk_medicid := frmMedProduceEdit.odsKARTCOMPOS.FieldByName('FK_MEDICID').AsInteger;
    pfc_TMEDIC_NAME := frmMedProduceEdit.odsKARTCOMPOS.FieldByName('FC_NAME').AsString;
    pfc_serial := frmMedProduceEdit.odsKARTCOMPOS.FieldByName('FC_SERIAL').AsString;
    pfd_data := frmMedProduceEdit.odsKARTCOMPOS.FieldByName('FD_DATA').AsDateTime;
    pfn_amount := frmMedProduceEdit.odsKARTCOMPOS.FieldByName('FN_AMOUNT').AsFloat;
    pFC_UEDIZM := frmMedProduceEdit.odsKARTCOMPOS.FieldByName('FC_UEDIZM').AsString;
    pdFN_NUMBER := frmMedProduceEdit.odsKARTCOMPOS.FieldByName('FN_NUMBER').AsInteger;
    pfd_goden_do := frmMedProduceEdit.odsKARTCOMPOS.FieldByName('FD_GODEN_DO').AsVariant;
    pFK_FINSOURCE_ID := frmMedProduceEdit.odsKARTCOMPOS.FieldByName('FK_FINSOURCE_ID').AsInteger;
//    pFC_FEDIZM.caption :=
    pFC_UEDIZM := frmMedProduceEdit.odsKARTCOMPOS.FieldByName('FC_UEDIZM').AsString;
    frmMedProduceEdit.chbUseTara.Checked := (frmMedProduceEdit.odsKARTCOMPOS.FieldByName('FL_USE_TARA').AsVariant = 1);

//    dmMain.PKGTKARTCOMPOS.GETBYFKID( frmMedProduceEdit.TKARTCOMPOS_FK_ID,
//                                     pfk_medicid,
//                                     pfc_TMEDIC_NAME,
//                                     pfc_serial,
//                                     pfd_data,
//                                     pfn_amount,
//                                     pFC_UEDIZM,
//                                     pFC_FEDIZM,
//                                     pdFN_NUMBER);


    pFN_NUMBER:=round(pdFN_NUMBER);

//	frmMedProduceEdit.TB_save.visible:= not frmMedProduceList.bPodpisan;

    if frmMedProduceEdit.ShowModal = mrOk then
    Begin
      frmMedProduceEdit.deDate.PostEditValue;
      frmMedProduceEdit.deMainAmount.PostEditValue;
      frmMedProduceEdit.deFN_NUMBER.PostEditValue;
      frmMedProduceEdit.deGodenDo.PostEditValue;
      dmMain.PKGTKARTCOMPOS.EDITTKARTCOMPOS( frmMedProduceEdit.TKARTCOMPOS_FK_ID,
                                             frmMedProduceEdit.TMEDIC_MEDICID,
                                             frmMedProduceEdit.deSerial.text,
                                             frmMedProduceEdit.deDate.date,
                                             frmMedProduceEdit.deMainAmount.EditValue,
                                             frmMedProduceEdit.deFN_NUMBER.EditValue,
                                             frmMedProduceEdit.deGodenDo.EditValue
                                             );
      dmMain.InitAdditionalUpdateTable('MED.TKARTCOMPOS');
      if frmMedProduceEdit.chbUseTara.Checked then
        dmMain.AddAdditionalUpdateTable('FL_USE_TARA', otInteger, 1)
      else
        dmMain.AddAdditionalUpdateTable('FL_USE_TARA', otInteger, 0);  

      if (dmMain.ConfigParams.GetParamValue('FUNC_USE_FINSOURCE_IN_RPO',0) = 1) then   
        dmMain.AddAdditionalUpdateTable('FK_FINSOURCE_ID', otInteger, frmMedProduceEdit.lcbFinSource.KeyValue);

      dmMain.ExecuteAdditionalUpdateTable('FK_ID', otInteger, frmMedProduceEdit.TKARTCOMPOS_FK_ID);
      dmMain.os.commit;
      result := frmMedProduceEdit.TKARTCOMPOS_FK_ID;
      FreeAndNil(frmMedProduceEdit);
    end
    else
    Begin
      try
        dmMain.os.RollbackToSavepoint('MedProcedureList');
      except
      end;
      FreeAndNil(frmMedProduceEdit);
      result := -1;
    end;
  end;
end;

procedure TfrmMedProduceEdit.SetnMedicID(const Value: integer);
var
	q: TOracleDataSet;
begin
  FnMedicID := Value;
  btnAdd.Enabled  := (FnMedicID > 0)and(not frmMedProduceList.bPodpisan);
  TB_save.Enabled := (FnMedicID > 0)and(not frmMedProduceList.bPodpisan);
  odsMedKartItem.SetVariable('PRODUCE_MEDID', FnMedicID);
  q := TOracleDataSet.Create(self);
  q.Session := dmMain.os;
//  q.SQL.Text := 'SELECT TMEDIC.FC_NAME,TEI.FC_NAME AS FC_FEDIZM from TMEDIC,TEI where medicid = :fk_id AND TMEDIC.FK_FPACKID = TEI.EIID (+)';
  q.SQL.Add('SELECT TMEDIC.FC_NAME, TEI.FC_NAME AS FC_UEDIZM,TMEDIC.FN_FPACKINUPACK, T2.FC_NAME AS FC_FEDIZM');
  q.sql.add('FROM MED.TMEDIC, MED.TEI, MED.TEI T2');
  q.sql.add('WHERE medicid = :fk_id 	AND TMEDIC.EIID = TEI.EIID (+) 	AND TMEDIC.FK_FPACKID = T2.EIID (+)');
  q.DeclareVariable('FK_ID', otInteger);
  q.SetVariable('FK_ID', FnMedicID);
  q.close;
  q.Open;
  edMedic.Text := q.fieldbyname('FC_NAME').AsString;
  if q.fieldbyname('FN_FPACKINUPACK').AsInteger<>0 then
    FN_FPACKINUPACK:=q.fieldbyname('FN_FPACKINUPACK').AsInteger
  else
    FN_FPACKINUPACK:=1;
  laFC_FEDIZM.caption := q.fieldbyname('FC_FEDIZM').AsString;
  laFC_UEDIZM.caption := q.fieldbyname('FC_UEDIZM').AsString;
  deMainAmount.EditValue:=1;
  ideMainAmount:=1;
  deFasAmount.value:=deMainAmount.EditValue * FN_FPACKINUPACK;
  q.free;
end;

procedure TfrmMedProduceEdit.edMedicClick(Sender: TObject);
var
  nTmp: Integer;
//  MedicFilter : string;
begin
  if TMEDIC_MEDICID > 0 then
    nTmp := DoShowMedic(TMEDIC_MEDICID, True, 'and SostMed.Count_ > 0', False, False, '', 'Список объектов учета', dmMain.CurMO_SKLAD_ID) //DoShowMedicSel(TMEDIC_MEDICID)
  else
    nTmp := DoShowMedic(0,              True, 'and SostMed.Count_ > 0', False, False, '', 'Список объектов учета', dmMain.CurMO_SKLAD_ID); //DoShowMedicSel(0);
  if nTmp > 0 then
    TMEDIC_MEDICID := nTmp;
  //  deName.Text := edMedic.Text;
  //frmMedic.find_produced_medicament:=false;

  odsObazat_Ingridienti.Close;
  odsObazat_Ingridienti.SetVariable('FK_MEDIC', TMEDIC_MEDICID);
  frmMedProduceEdit.odsObazat_Ingridienti.SetVariable('tkartcompos_fn_amount', frmMedProduceEdit.deMainAmount.EditValue);
  odsObazat_Ingridienti.Open;

  sFilter := '';
  if odsObazat_Ingridienti.RecordCount > 0 then
  begin
    odsObazat_Ingridienti.DisableControls;
    odsObazat_Ingridienti.First;
    while not odsObazat_Ingridienti.Eof do
    begin
      sFilter := ' and medicid = '+ IntToStr(odsObazat_Ingridienti.FieldByName('medicid').AsInteger);
      odsObazat_Ingridienti.Next;
    end;
    Delete(sFilter, 1,5);
    odsObazat_Ingridienti.EnableControls;
  end;
end;

procedure TfrmMedProduceEdit.FormShow(Sender: TObject);
begin
  odsMedKartItem.SetVariable('FK_TKARTCOMPOSID', frmMedProduceEdit.TKARTCOMPOS_FK_ID);
  oqClearIngr.SetVariable('FK_TKARTCOMPOSID', TKARTCOMPOS_FK_ID);
  if (not frmMedProduceList.bPodpisan) then // обновляем поле остатков
  begin
    oqUPD_OST_ALL.SetVariable('FK_TKARTCOMPOSID', TKARTCOMPOS_FK_ID);
    oqUPD_OST_ALL.SetVariable('pDATE', ServerDate(dmMain.os));
    oqUPD_OST_ALL.Execute;
  end;

  odsMedKartItem.Close;
  odsMedKartItem.Open;

  if frmMedProduceEdit.flIns then
    TMEDIC_MEDICID:=0
  else
  begin
    TMEDIC_MEDICID:=round(pfk_medicid);
    frmMedProduceEdit.deSerial.text:=pfc_serial;
    frmMedProduceEdit.deDate.Date :=pfd_data;
    frmMedProduceEdit.edMedic.text:= pfc_TMEDIC_NAME;
    frmMedProduceEdit.laFC_UEDIZM.caption :=pFC_UEDIZM;
    frmMedProduceEdit.laFC_FEDIZM.caption :=pFC_FEDIZM;
    frmMedProduceEdit.deFN_NUMBER.Text :=inttostr(pFN_NUMBER);
    frmMedProduceEdit.deMainAmount.EditValue:=pfn_amount;
    frmMedProduceEdit.deFasAmount.EditValue:=deMainAmount.EditValue * FN_FPACKINUPACK;
    frmMedProduceEdit.deGodenDo.EditValue := pfd_goden_do;
    frmMedProduceEdit.chbGodenDo.Checked := (not VarIsNull(pfd_goden_do));
    frmMedProduceEdit.lcbFinSource.KeyValue := pFK_FINSOURCE_ID;

    odsObazat_Ingridienti.Close;
    frmMedProduceEdit.odsObazat_Ingridienti.SetVariable('FK_MEDIC', TMEDIC_MEDICID);
    frmMedProduceEdit.odsObazat_Ingridienti.SetVariable('tkartcompos_fn_amount', frmMedProduceEdit.deMainAmount.EditValue);
    odsObazat_Ingridienti.Open;
  end;

  TB_save.Enabled := (not frmMedProduceList.bPodpisan) and (edMedic.Text <> '');//сохранить
end;

procedure TfrmMedProduceEdit.dxDBGrid1DblClick(Sender: TObject);
begin
//  DoShowProdCurrentItemEdit(frmMedProduceEdit.odsObazat_Ingridienti.FieldByName('TMEDICOMPLEX_FK_MEDICITEM').AsInteger);
end;

procedure TfrmMedProduceEdit.btnAddClick(Sender: TObject);
var
  sFilter : string;
  res : Integer;
  AmountForN, AmountFor1 : Double;
  OstRec : TOstatokRec;
begin
//  DoShowProdCurrentItemEdit(-1);

  cxGridCurIngrDBTableView1.DataController.Post;

  sFilter := '';
  odsObazat_Ingridienti.DisableControls;
  odsObazat_Ingridienti.First;  
  while not odsObazat_Ingridienti.Eof do
  begin
    sFilter := sFilter + ' or (medicid = '+ IntToStr(odsObazat_Ingridienti.FieldByName('medicid').AsInteger)+')';
    odsObazat_Ingridienti.Next;
  end;
  Delete(sFilter, 1,4);

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_FINSOURCE_IN_RPO',0) = 1) and (lcbFinSource.KeyValue > 0) then
  begin
    if sFilter <> '' then
    begin
      sFilter := '(' + sFilter + ') ';
    end;
    
    sFilter := sFilter + ' and (FK_FINSOURCE_ID = ' + IntToStr(lcbFinSource.KeyValue) + ')';
  end;

  deDate.PostEditValue;
//  dmMain.pkgMedSes.SETDATA2( deDate.EditValue );
  OstRec := DoShowMedKardLst( -1, -1, 0, False, SPISANIE_VID_NONE, 'FN_OST_TYPE = 0',False,sFilter,True, True);
//  dmMain.pkgMedSes.ResetDatePeriod;  
  if OstRec.KARTID < 0 then
  begin
    odsObazat_Ingridienti.EnableControls;
    Exit; // не выбрали медикамент
  end;

  // автозаполнение количества ингредиента
  odsObazat_Ingridienti.First;
  while (not odsObazat_Ingridienti.Eof)and(odsObazat_Ingridienti.FieldByName('MEDICID').AsInteger <> OstRec.MedicID) do
    odsObazat_Ingridienti.Next;

  AmountFor1 := 0;
  AmountForN := 0;
  if not odsObazat_Ingridienti.Eof then
  begin
    AmountFor1 := odsObazat_Ingridienti.FieldByName('FN_AMOUNT_FOR1').AsFloat;
    AmountForN := odsObazat_Ingridienti.FieldByName('FN_AMOUNT').AsFloat;
  end;
  odsObazat_Ingridienti.EnableControls;
  if  OstRec.fn_ostatok < AmountForN then
    AmountForN := OstRec.fn_ostatok;

  res := round( dmMain.PKGTKARTCOITEM.ADDTKARTCOITEM( TKARTCOMPOS_FK_ID,
                                                      AmountForN,
                                                      AmountFor1,
                                                      OstRec.KARTID
                                                      ) );
  if res=-1 then
  Begin
    Application.MessageBox('Выбранная партия медикамента уже есть в списке "Текущие ингредиенты". Вы можете редактировать или удалить данную партию медикаментов в этом списке!', 'Ошибка', MB_OK + mb_iconerror);
    exit;
  end
  else
  begin
    oqUPD_OST.SetVariable('K_ITEM_FK_ID', res);
    oqUPD_OST.SetVariable('pDATE', deDate.Date);    
    oqUPD_OST.Execute;

    odsMedKartItem.Close;
    odsMedKartItem.Open;
    odsMedKartItem.Locate('FK_ID', res, []);
  end;
end;

procedure TfrmMedProduceEdit.btnEditClick(Sender: TObject);
var
  OstRec : TOstatokRec;
begin
  if odsMedKartItem.recordcount>0 then
  begin
  //    DoShowProdCurrentItemEdit(-1,frmMedProduceEdit.odsMedKartItem.FieldByName('FK_ID').AsInteger);
//    if (odsMedKartItem.State = dsEdit)or(odsMedKartItem.State = dsInsert) then
//      odsMedKartItem.Post;
//    cxGridCurIngrDBTableView1.DataController.PostEditingData;
    cxGridCurIngrDBTableView1.DataController.Post;
    sFilter := 'medicid = '+ odsMedKartItem.FieldByName('MedicID').AsString;
    OstRec := DoShowMedKardLst( -1, -1, 0, False, SPISANIE_VID_NONE,'',False,sFilter,False, True);

    if OstRec.KARTID > 0 then
    begin
      dmMain.PKGTKARTCOITEM.EDITTKARTCOITEM( odsMedKartItem.FieldByName('FK_ID').AsInteger,
                                             OstRec.KARTID,
                                             odsMedKartItem.FieldByName('FN_AMOUNT').AsFloat,
                                             odsMedKartItem.FieldByName('FN_AMOUNT_FOR1').AsFloat );
      oqUPD_OST.SetVariable('K_ITEM_FK_ID', odsMedKartItem.FieldByName('FK_ID').AsInteger);
      oqUPD_OST.SetVariable('pDATE', deDate.Date);      
      oqUPD_OST.Execute;
    end;
  end;

  odsMedKartItem.Close;
  odsMedKartItem.Open;
//  CheckAmountOfIngridients;
end;

procedure TfrmMedProduceEdit.dbgDblClick(Sender: TObject);
begin
  btnEdit.Click;
end;

procedure TfrmMedProduceEdit.btnDelClick(Sender: TObject);
begin
  cxGridCurIngrDBTableView1.DataController.Post;
  if odsMedKartItem.recordcount<1 then exit;
  if windows.MessageBoxEx(Self.Handle, PChar('Вы действительно хотите удалить данную запись ?'), 'Предупреждение', MB_YESNO + MB_ICONQUESTION,$0419 {Russian}) = mrYes then
  begin
    dmMain.PKGTKARTCOITEM.DELTKARTCOITEM(frmMedProduceEdit.odsMedKartItem.FieldByName('FK_ID').AsInteger);
    odsMedKartItem.refresh;
  end;
//  CheckAmountOfIngridients;
end;

procedure TfrmMedProduceEdit.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResulttt then
    ModalResult := mrOk
  else
    ModalResult := mrCancel;
end;

procedure TfrmMedProduceEdit.PM_CleanClick(Sender: TObject);
begin
  Memo1.Clear;
end;

procedure TfrmMedProduceEdit.TB_cancelClick(Sender: TObject);
begin
  ModalResulttt:=false;
  ModalResult := mrcancel;
end;

procedure TfrmMedProduceEdit.TB_saveClick(Sender: TObject);
begin
  if deFN_NUMBER.Value = 0 then
  begin
    MessageBox(Self.Handle, PChar('Необходимо ввести номер документа!'), 'Ошибка', MB_OK + mb_iconerror);
    deFN_NUMBER.SetFocus;
    exit;
  end;
  if edMedic.Text = '' then
  begin
    MessageBox(Self.Handle, PChar('Необходимо выбрать наименование препарата!'), 'Ошибка', MB_OK + mb_iconerror);
    edMedic.SetFocus;
    exit;
  end;
//  if laFC_FEDIZM.caption = '' then
//  begin
//    MessageBox(Self.Handle, PChar('Необходимо заполнить поля единиц измерений у объекта учета данного препарата!'), 'Ошибка', MB_OK + mb_iconerror);
//    exit;
//  end;
  if deMainAmount.EditValue <= 0 then
  begin
    MessageBox(Self.Handle, PChar('Необходимо ввести изготавливаемое кол-во!'), 'Ошибка', MB_OK + mb_iconerror);
    deMainAmount.SetFocus;
    exit;
  end;

  if odsMedKartItem.IsEmpty then
  begin
    MessageBox(Self.Handle, PChar('Необходимо ввести список текущих ингредиентов!'), 'Ошибка', MB_OK + mb_iconerror);
    exit;
  end;

//  if CheckAmountOfIngridients=false then
//  Begin
//    MessageBox(Self.Handle, PChar('Не для всех карточек ингредиентов есть нужный остаток, измените кол-во производимого медикамента или кол-во ингредиентов!'), 'Ошибка', MB_OK + mb_iconerror);
//    exit;
//  end;
  ModalResulttt:=true;
  ModalResult := mrOk;
end;

procedure TfrmMedProduceEdit.FormCreate(Sender: TObject);
begin
  frmMedProduceEdit.FN_FPACKINUPACK:=1;
  FIsOpenForm := True;
  chbUseTara.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_TARA_IN_RPO',0) = 1);

  laFinSource.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_FINSOURCE_IN_RPO',0) = 1);
  lcbFinSource.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_FINSOURCE_IN_RPO',0) = 1);

// автоматически определяем длину ограничения на поле Воронов О.А. 25.08.2008
  deSerial.MaxLength   := dmMain.GetFieldLength('med', 'TKARTCOMPOS', 'FC_SERIAL');
end;

procedure TfrmMedProduceEdit.deMainAmountChange(Sender: TObject);
var
  FN_NEED_KOL, FN_RASH_KOL : Double;
  CurMedicID, MedicNum : Integer;
  sMess : string;

begin
  if FIsOpenForm then Exit;
  deMainAmount.PostEditValue;
  ideMainAmount:=deMainAmount.EditingValue;
  deFasAmount.value:=ideMainAmount * FN_FPACKINUPACK;

  cxGridObIngrDBTableView1FN_AMOUNT.Caption:='Кол-во на '+floattostr(ideMainAmount)+' порций';
  cxGridCurIngrDBTableView1FN_AMOUNT.Caption:='Кол-во на '+floattostr(ideMainAmount)+' порций';
  odsObazat_Ingridienti.Close;
  frmMedProduceEdit.odsObazat_Ingridienti.SetVariable('tkartcompos_fn_amount', ideMainAmount);
  odsObazat_Ingridienti.Open;  

//  if CheckAmountOfAllParty then // сначала проверяем хватит ли остатков
//  begin
    odsMedKartItem.First;
    while not odsMedKartItem.Eof do
    begin
      dmMain.PKGTKARTCOITEM.EDITTKARTCOITEM( odsMedKartItem.FieldByName('FK_ID').AsInteger,
                                             odsMedKartItem.FieldByName('fk_kart_item').AsInteger,
                                             0,
                                             odsMedKartItem.FieldByName('FN_AMOUNT_FOR1').AsFloat );
      oqUPD_OST.SetVariable('K_ITEM_FK_ID', odsMedKartItem.FieldByName('FK_ID').AsInteger);
      oqUPD_OST.SetVariable('pDATE', deDate.Date);      
      oqUPD_OST.Execute;                                             
      odsMedKartItem.Next;
    end;
    Refresh_odsMedKartItem;
    
    odsMedKartItem.First;

    CurMedicID := -1;
    MedicNum := 0;
    FN_NEED_KOL := 0;
    while not odsMedKartItem.Eof do
    begin
      if CurMedicID <> odsMedKartItem.FieldByName('MEDICID').AsInteger then // следим за текущим медикаментом - здесь происходи переход к другому медикаменту
      begin
        if CurMedicID > 0 then
        begin
          if FN_NEED_KOL > 0 then
          begin
            Inc(MedicNum);
            sMess := sMess + #13#10+IntToStr(MedicNum)+') ' + odsObazat_Ingridienti.FieldByName('FC_MEDICNAME').AsString+' - '+FloatToStr(RoundTo(FN_NEED_KOL,-4))+' '+odsObazat_Ingridienti.FieldByName('FC_UEDIZM').AsString;
          end;
        end;

        CurMedicID := odsMedKartItem.FieldByName('MEDICID').AsInteger;
        if odsObazat_Ingridienti.RecordCount > 0 then
        begin
          odsObazat_Ingridienti.Locate('MEDICID', CurMedicID, []);
          FN_NEED_KOL := odsObazat_Ingridienti.FieldByName('FN_AMOUNT').AsFloat; // выставляем необходимое кол-во медикамента
        end
        else
        begin
          FN_NEED_KOL := odsMedKartItem.FieldByName('FN_AMOUNT_FOR1').AsFloat*deMainAmount.EditValue;
        end;
      end;

      if FN_NEED_KOL < (odsMedKartItem.FieldByName('FN_OST').AsFloat){odsMedKartItem.FieldByName('FN_OST').AsFloat} then // вычисляем кол-во, которое мы можем взять из текущей партии
        FN_RASH_KOL :=  FN_NEED_KOL
      else
        FN_RASH_KOL := (odsMedKartItem.FieldByName('FN_OST').AsFloat);//odsMedKartItem.FieldByName('FN_OST').AsFloat;
      FN_NEED_KOL := FN_NEED_KOL - FN_RASH_KOL; // корректируем необходимое кол-во
      dmMain.PKGTKARTCOITEM.EDITTKARTCOITEM( odsMedKartItem.FieldByName('FK_ID').AsInteger,
                                             odsMedKartItem.FieldByName('fk_kart_item').AsInteger,
                                             FN_RASH_KOL,
                                             odsMedKartItem.FieldByName('FN_AMOUNT_FOR1').AsFloat );

      odsMedKartItem.Next;
    end;
//    deMainAmount.Tag := ideMainAmount;  // сохраняем старое значение

    if FN_NEED_KOL > 0 then
    begin
      Inc(MedicNum);
      if odsObazat_Ingridienti.RecordCount > 0 then
        sMess := sMess + #13#10+IntToStr(MedicNum)+') ' + odsObazat_Ingridienti.FieldByName('FC_MEDICNAME').AsString+' - '+FloatToStr(RoundTo(FN_NEED_KOL,-4))+' '+odsObazat_Ingridienti.FieldByName('FC_UEDIZM').AsString
      else
        sMess := sMess + #13#10+IntToStr(MedicNum)+') ' + odsMedKartItem.FieldByName('TKART_NAME').AsString+' - '+FloatToStr(RoundTo(FN_NEED_KOL,-4))+' '+odsMedKartItem.FieldByName('FC_UEDIZM').AsString;
    end;
    Refresh_odsMedKartItem;
    if (MedicNum > 0) then // если остатков каких-то препаратов не хватило, выводим список этих препаратов
    begin
      sMess := 'Для '+IntToStr(MedicNum)+' позиций препарата(ов) не хватило остатков (на '+deDate.Text+').'+sMess;
      Application.MessageBox(PAnsiChar(sMess),'Внимание',MB_OK+MB_ICONWARNING);
    end;
//  end // if CheckAmountOfAllParty then
//  else
//  begin
//    dmMain.ShowBalloonHint('Партии препарата '+ odsMedKartItem.FieldByName('TKART_NAME').AsString+' недостаточно!', 'ВНИМАНИЕ', Self);
//    deMainAmount.Value := deMainAmount.Tag;  // возвращаем старое значение
//  end;

end;

procedure TfrmMedProduceEdit.deFasAmountChange(Sender: TObject);
begin
//  deMainAmount.value:=deFasAmount.value / frmMedProduceEdit.FN_FPACKINUPACK;
//  ideMainAmount:=deMainAmount.value;

//  CheckAmountOfIngridients;
end;
//==============================================================================
// Автоматически выбрать остатки по ингредиентам
procedure TfrmMedProduceEdit.tbuAutoFillClick(Sender: TObject);
//==============================================================================
var
  num : integer;
  NeedKol,NeedKolFor1, KolOst : Double;
  sMess : string;
  CurDate : TDate;
begin
  deMainAmount.PostEditValue;
  cxGridCurIngrDBTableView1.DataController.Post;  
  // проверки
  if TMEDIC_MEDICID <=0 then // на производимый медикамент
  begin
    Application.MessageBox('Не выбран медикамент для производства','Внимание',MB_OK+MB_ICONWARNING);
    edMedic.SetFocus;
    Exit;
  end;

  if odsObazat_Ingridienti.RecordCount = 0 then // на наличие составных частей (ингредиентов)
  begin
    Application.MessageBox('Выбранный производимый препарат не имеет составных частей!'#13#10'Указание составных частей возможно только в ручном режиме','Внимание',MB_OK+MB_ICONWARNING);
    Exit;
  end;

  oqClearIngr.Execute;
  Refresh_odsMedKartItem;

  sMess := '';
  num := 0;

  odsObazat_Ingridienti.First;
  CurDate := Trunc(ServerDate( dmMain.os ));
  odsIngrOst.Open;
  while not odsObazat_Ingridienti.Eof do
  begin
    NeedKol     := odsObazat_Ingridienti.FieldByName('FN_AMOUNT').AsFloat; // кол-во составного препарата для производства N единиц нового препарата
    NeedKolFor1 := odsObazat_Ingridienti.FieldByName('FN_AMOUNT_FOR1').AsFloat;

    odsIngrOst.First;
    KolOst := odsIngrOst.FieldByName('FN_KOLOST').AsFloat; // остаток по текущей партии
    while ((NeedKol > KolOst)and(not odsIngrOst.Eof)) do
    begin
      if  (odsIngrOst.FieldByName('fd_goden').IsNull) or (TRUNC(odsIngrOst.FieldByName('fd_goden').AsDateTime) > CurDate) then
      begin
        dmMain.PKGTKARTCOITEM.ADDTKARTCOITEM( TKARTCOMPOS_FK_ID,
                                              KolOst,
                                              NeedKolFor1,
                                              odsIngrOst.FieldByName('KARTID').asInteger
                                              );
        NeedKol := NeedKol - KolOst;
      end; // if  TRUNC(odsIngrOst.FieldByName('fd_goden').AsDateTime) > CurDate then

      odsIngrOst.Next;
      KolOst := odsIngrOst.FieldByName('FN_KOLOST').AsFloat; // остаток по текущей партии      
    end;

    if odsIngrOst.Eof then
    begin
      Inc( num ); // счетчик препаратов, остатков которых не хватило
      sMess := sMess + #13#10+IntToStr(num)+') ' + odsObazat_Ingridienti.FieldByName('FC_MEDICNAME').AsString+' - '+FloatToStr(RoundTo(NeedKol,-4))+' '+odsObazat_Ingridienti.FieldByName('FC_UEDIZM').AsString;
    end
    else
      if NeedKol <= odsIngrOst.FieldByName('FN_KOLOST').AsFloat then // остаток по текущей партии then
      begin
        dmMain.PKGTKARTCOITEM.ADDTKARTCOITEM( TKARTCOMPOS_FK_ID,
                                              NeedKol,
                                              NeedKolFor1,
                                              odsIngrOst.FieldByName('KARTID').asInteger );
//         NeedKol := 0;
      end;

    odsObazat_Ingridienti.Next; // следующий ингредиент
  end; // while not odsObazat_Ingridienti.Eof do
  odsIngrOst.Close;
  oqUPD_OST_ALL.SetVariable('pDATE', deDate.Date);
  oqUPD_OST_ALL.Execute;
  Refresh_odsMedKartItem;
  
  if (num > 0) then // если остатков каких-то препаратов не хватило, выводим список этих препаратов
  begin
    sMess := 'Для '+IntToStr(num)+' позиций препарата(ов) не хватило остатков, с действующим сроком годности.'+sMess;
    Application.MessageBox(PAnsiChar(sMess),'Внимание',MB_OK+MB_ICONWARNING);
  end;
end; // procedure TfrmMedProduceEdit.tbuAutoFillClick(Sender: TObject);

procedure TfrmMedProduceEdit.cxGridCurIngrExit(Sender: TObject);
begin
  if odsMedKartItem.State = dsEdit then odsMedKartItem.Post;
end;

procedure TfrmMedProduceEdit.odsObazat_IngridientiAfterRefresh(
  DataSet: TDataSet);
begin
  tbuAutoFill.Enabled := (odsObazat_Ingridienti.RecordCount > 0)and(not frmMedProduceList.bPodpisan);
  chbUseTaraClick( nil );  
end;

procedure TfrmMedProduceEdit.odsMedKartItemAfterRefresh(DataSet: TDataSet);
begin
  btnEdit.Enabled := (odsMedKartItem.RecordCount > 0)and(not frmMedProduceList.bPodpisan);
  btnDel.Enabled  := (odsMedKartItem.RecordCount > 0)and(not frmMedProduceList.bPodpisan);

  odsMedKartItem.DisableControls;
  odsMedKartItem.First;
  try
    while not(odsMedKartItem.Eof)and(not odsMedKartItem.FieldByName('FN_PARTY_ORDER').IsNull)and(odsMedKartItem.FieldByName('FN_PARTY_ORDER').AsInteger = 1) do
      odsMedKartItem.Next;
  finally
    odsMedKartItem.EnableControls;
  end;
  cxGridCurIngrDBTableView1FN_PARTY_ORDER.Visible := not odsMedKartItem.Eof;
end;

procedure TfrmMedProduceEdit.cxGridCurIngrDBTableView1FN_AMOUNT_FOR1PropertiesEditValueChanged( Sender: TObject);
begin
  if CheckAmountOfParty(cxGridCurIngrDBTableView1FN_AMOUNT.EditValue) then
  begin
    if odsMedKartItem.State = dsEdit then odsMedKartItem.Post;
    dmMain.PKGTKARTCOITEM.EDITTKARTCOITEM( odsMedKartItem.FieldByName('FK_ID').AsInteger,
                                           odsMedKartItem.FieldByName('fk_kart_item').AsInteger,
                                           odsMedKartItem.FieldByName('FN_AMOUNT_FOR1').AsFloat*deMainAmount.EditValue,
                                           odsMedKartItem.FieldByName('FN_AMOUNT_FOR1').AsFloat );
  end
  else
    dmMain.ShowBalloonHint('Партии препарата '+ odsMedKartItem.FieldByName('TKART_NAME').AsString+' недостаточно!', 'ВНИМАНИЕ', Self);

  Refresh_odsMedKartItem;
//  odsMedKartItem.RefreshRecord;
end;

function TfrmMedProduceEdit.CheckAmountOfParty(aNeedAmount : Double): boolean;
begin
//  if odsMedKartItem.Eof then
//  begin
//    Result := False;
//    Exit;
//  end;

  if odsMedKartItem.Eof then
    Result := (aNeedAmount = 0)
  else
    Result := odsMedKartItem.FieldByName('FN_CUR_OST').AsFloat >= aNeedAmount;
end;

function TfrmMedProduceEdit.CheckAmountOfAllParty: boolean;
begin
  odsMedKartItem.First;
  while (not odsMedKartItem.Eof)and(CheckAmountOfParty(odsMedKartItem.FieldByName('FN_AMOUNT_FOR1').AsFloat*deMainAmount.EditValue)) do
    odsMedKartItem.Next;
  Result := odsMedKartItem.Eof;
end;

procedure TfrmMedProduceEdit.odsIngrOstAfterOpen(DataSet: TDataSet);
begin
  FFN_SUMM_OST := 0;
  DataSet.First;
  while not DataSet.Eof do
  begin
    FFN_SUMM_OST := FFN_SUMM_OST + DataSet.FieldByName('FN_KOLOST').AsFloat;
    DataSet.Next;
  end;
  DataSet.First;  
end;

procedure TfrmMedProduceEdit.tmRefresh_odsMedKartItemTimer(Sender: TObject);
begin
  Refresh_odsMedKartItem;
  tmRefresh_odsMedKartItem.Enabled := False;
end;

procedure TfrmMedProduceEdit.cxGridCurIngrDBTableView1FN_PARTY_ORDERPropertiesEditValueChanged(Sender: TObject);
begin
  tmRefresh_odsMedKartItem.Enabled := True;
end;

procedure TfrmMedProduceEdit.Refresh_odsMedKartItem;
var
  FK_ID : Integer;
begin
  FK_ID := odsMedKartItem.FieldByName('FK_ID').AsInteger;
  odsMedKartItem.Close;
  odsMedKartItem.Open;
  odsMedKartItem.Locate('FK_ID', FK_ID, []);
end;

procedure TfrmMedProduceEdit.FormActivate(Sender: TObject);
begin
  FIsOpenForm := False;
end;

procedure TfrmMedProduceEdit.odsMedKartItemBeforeClose(DataSet: TDataSet);
begin
  if DataSet.State = dsEdit then DataSet.Post;
end;

procedure TfrmMedProduceEdit.deDatePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  cxDateEdit_PropertiesValidate(Sender, DisplayValue, ErrorText, Error);
end;

procedure TfrmMedProduceEdit.cxGridCurIngrDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[ cxGridCurIngrDBTableView1FN_OST.Index ] < 0 then
    ACanvas.Brush.Color := $D9D9FF // недодали - красный
end;

procedure TfrmMedProduceEdit.chbGodenDoClick(Sender: TObject);
begin
  deGodenDo.Enabled := (chbGodenDo.Checked)and(not frmMedProduceList.bPodpisan);
  if chbGodenDo.Checked = False then deGodenDo.EditValue := null;
end;

procedure TfrmMedProduceEdit.chbUseTaraClick(Sender: TObject);
begin
  if (odsObazat_Ingridienti.Active) then
  begin
    odsObazat_Ingridienti.Filtered := False;

    if chbUseTara.Checked then
      odsObazat_Ingridienti.Filter := ''
    else
    begin
      odsObazat_Ingridienti.Filter   := 'FL_TARA = 0';
      odsObazat_Ingridienti.Filtered := True;
    end;
  end;
end;

end.
