//#todo3 сделать редактирование грида (кол-во)
unit fTrebManual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, JvToolEdit, JvBaseEdits,
  Db, OracleData, ActnList, ComCtrls, ToolWin, Oracle, JvFormPlacement, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxDBEdit, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, JvComponentBase,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxDBData,  cxCalendar, cxDropDownEdit, cxCurrencyEdit, cxDBLookupComboBox,
  Menus, cxLookupEdit, cxDBLookupEdit, dxSkinsCore, dxSkinBlack,
  dxSkinOffice2007Green, dxSkinscxPCPainter;

type
  TfrmTrebManual = class(TForm)
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    alActions: TActionList;
    acSave: TAction;
    acCancel: TAction;
    acInsert: TAction;
    acEdit: TAction;
    acDelete: TAction;
    dsMedic: TDataSource;
    odsMedic: TOracleDataSet;
    acSecret: TAction;
    FormStorage: TJvFormStorage;
    paCaption: TPanel;
    Label9: TLabel;
    Label11: TLabel;
    lbDemand: TLabel;
    lbFrom: TLabel;
    deNumTreb: TEdit;
    Label13: TLabel;
    LCBTo: TDBLookupComboBox;
    odsNameTo: TOracleDataSet;
    dsNameTo: TDataSource;
    odsNameFrom: TOracleDataSet;
    dsNameFrom: TDataSource;
    lcbFrom: TDBLookupComboBox;
    odsMO_GroupFrom: TOracleDataSet;
    dsMO_GroupFrom: TDataSource;
    odsMO_GroupTo: TOracleDataSet;
    dsMO_GroupTo: TDataSource;
    chbFL_CITO: TCheckBox;
    lcbMO_GroupFrom: TDBLookupComboBox;
    lcbMO_GroupTo: TDBLookupComboBox;
    deRegisterDate: TcxDateEdit;
    mComment: TEdit;
    odsMinZapas: TOracleDataSet;
    dsMinZapas: TDataSource;
    grbMinZapas: TGroupBox;
    cxGridMinZapas: TcxGrid;
    cxGridMinZapasDBTableView1: TcxGridDBTableView;
    cxGridMinZapasDBTableView1ROWNUM: TcxGridDBColumn;
    cxGridMinZapasDBTableView1NAMEKART: TcxGridDBColumn;
    cxGridMinZapasDBTableView1FC_EDIZM: TcxGridDBColumn;
    cxGridMinZapasLevel1: TcxGridLevel;
    grbTreb: TGroupBox;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1_ROWNUM: TcxGridDBColumn;
    cxGrid1DBTableView1_FC_MEDIC: TcxGridDBColumn;
    cxGrid1DBTableView1_FC_EDIZM: TcxGridDBColumn;
    cxGrid1DBTableView1_FN_KOL: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Splitter1: TSplitter;
    cxGridMinZapasDBTableView1COLVO: TcxGridDBColumn;
    cxGridMinZapasDBTableView1OSTMEDIC: TcxGridDBColumn;
    acAutoFill: TAction;
    cxGrid1DBTableView1FN_KOLOST: TcxGridDBColumn;
    cxGrid1DBTableView1FD_CREATE: TcxGridDBColumn;
    cxGrid1DBTableView1FK_CREATE_MO_ID: TcxGridDBColumn;
    cxGrid1DBTableView1FD_EDIT: TcxGridDBColumn;
    cxGrid1DBTableView1FK_EDIT_MO_ID: TcxGridDBColumn;
    pmAdd: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    acInsFromOst: TAction;
    cxGrid1DBTableView1FC_NAME_LAT: TcxGridDBColumn;
    odsCheckQuota: TOracleDataSet;
    acInsBySkladOst: TAction;
    N1: TMenuItem;
    paFinSource: TPanel;
    lcbFinSource: TcxLookupComboBox;
    Label1: TLabel;
    miUseShtrihcode: TMenuItem;
    N3: TMenuItem;
    cxGrid1DBTableView1FC_INTERNATIONAL_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1FC_CLASS: TcxGridDBColumn;
    procedure acCancelExecute(Sender: TObject);
    procedure acSaveExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acSecretExecute(Sender: TObject);
    procedure odsMedicAfterScroll(DataSet: TDataSet);
    procedure acInsertExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chbFL_CITOClick(Sender: TObject);
    procedure lcbMO_GroupFromClick(Sender: TObject);
    procedure acAutoFillExecute(Sender: TObject);
    procedure cxGridMinZapasDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure deRegisterDatePropertiesEditValueChanged(Sender: TObject);
    procedure deRegisterDatePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure lcbMO_GroupToCloseUp(Sender: TObject);
    procedure LCBToKeyPress(Sender: TObject; var Key: Char);
    procedure acInsFromOstExecute(Sender: TObject);
    procedure acInsBySkladOstExecute(Sender: TObject);
    procedure lcbMO_GroupFromCloseUp(Sender: TObject);
    procedure miUseShtrihcodeClick(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure lcbMO_GroupFromKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lcbMO_GroupToKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FidTreb: Integer;
//    FbEdit: Boolean;
    FbReadOnly: Boolean;
		FbFillMinZapas: Boolean;
    FInsFromOst : Boolean;
    FInsFromSkladOst : Boolean;

		procedure SetidTreb(const Value: Integer);
		procedure SetbReadOnly(const Value: Boolean);
//		function CanAppendDpc: Boolean;
		procedure SetbFillMinZapas(const Value: Boolean);
		{ Private declarations }
	public
		{ Public declarations }
    FL_RPO : boolean;
		iStatus:integer; //-1,'Не определен',0,'Необработанно',1,'Обрабатывается',2,'Обработано'
		iWho_called:integer; //0 - никто, 1 - Движение> требования>Добавить на пополнения мин. запаса.  2 - Движение>требования> Добавить из списка медикаментов
    sLockMO, CurTrebLockID : string;    
		property idTreb: Integer read FidTreb write SetidTreb;
		property bReadOnly: Boolean read FbReadOnly write SetbReadOnly;

		property bFillMinZapas: Boolean read FbFillMinZapas write SetbFillMinZapas;
    procedure DisableInput;
    procedure DisableActions;
    procedure EnableInput;
    procedure EnableActions;

    procedure GetFromToFIO (p_is_from:boolean);
    procedure SavFromToFIO ;
    procedure GtFrReg (p_is_from:boolean);

	end;

var
//  frmTrebManual: TfrmTrebManual;
  ModalRes : Integer;

function DoShowTrebManual(pIdDocs: Integer):TModalResult;

implementation

{$R *.DFM}

uses fdmmain, JvDBUtils, fMainForm, fTrebLst, fMedic, Variants, fMedKardLst,
     Registry, uGlobalConst, jclRegistry;

procedure TfrmTrebManual.GetFromToFIO(p_is_from:boolean);
var Reg : TRegIniFile;
    v_user_name, v_key_fr, v_key_to : string;
const c_mn_pth = '\Software\Softmaster\Medica\';
begin
  v_user_name := dmMain.pkgMO.GETNAMEBYID( dmMain.MOID ) ;
  v_key_fr:=c_mn_pth+v_user_name+'\'+inttostr(nvl(lcbMO_GroupFrom.KeyValue,0));
  v_key_to:=c_mn_pth+v_user_name+'\'+inttostr(nvl(lcbMO_GroupTo.KeyValue,0));
  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if not Reg.OpenKey(v_key_fr, False) then
      Reg.CreateKey(v_key_fr);
  if not Reg.OpenKey(v_key_to, False) then
      Reg.CreateKey(v_key_to);
  try
    if p_is_from then
    begin
      lcbFrom.KeyValue := Reg.ReadInteger(v_key_fr, 'FIO_MO_ID_FROM', 0 );
    //  lcbFrom.ListSource.DataSet.Locate('MOID', lcbFrom.KeyValue, [] );
    end else
    begin
      LCBTo.KeyValue   := Reg.ReadInteger(v_key_to, 'FIO_MO_ID_TO',   0 );
    //  LCBTo.ListSource.DataSet.Locate('MOID', LCBTo.KeyValue, [] );
    end;
  finally
    Reg.Free;
  end;
end;

procedure TfrmTrebManual.GtFrReg (p_is_from:boolean);
begin
  With TOracleQuery.Create(Self) do
  try
    Session := dmMain.os;
    SQL.Text := 'SELECT ASU.PKG_SMINI.READSTRING(''CONFIG'', ''DB_NAME'', ''H'') as FC_VALUE FROM DUAL';
    Execute;
    if not Eof then
      if FieldAsString('FC_VALUE')='H' then
        GetFromToFIO(p_is_from) ; // зачитаем из реестра установки формы
  finally
    Free;
  end;
end;

procedure TfrmTrebManual.SavFromToFIO ;
var Reg : TRegIniFile;
    v_user_name, v_key_fr, v_key_to : string;
const c_mn_pth = '\Software\Softmaster\Medica\';
begin
  v_user_name := dmMain.pkgMO.GETNAMEBYID( dmMain.MOID ) ;
  v_key_fr:=c_mn_pth+v_user_name+'\'+inttostr(nvl(lcbMO_GroupFrom.KeyValue,0));
  v_key_to:=c_mn_pth+v_user_name+'\'+inttostr(nvl(lcbMO_GroupTo.KeyValue,0));
  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if not Reg.OpenKey(v_key_fr, False) then
      Reg.CreateKey(v_key_fr);
  if not Reg.OpenKey(v_key_to, False) then
      Reg.CreateKey(v_key_to);
  try
    Reg.WriteInteger(v_key_fr, 'FIO_MO_ID_FROM', lcbFrom.KeyValue );
    Reg.WriteInteger(v_key_to, 'FIO_MO_ID_TO',   LCBTo.KeyValue   );
  finally
    Reg.Free;
  end;
end;

// функция возвращает код должности из справочника должностей asu.ts_sprav
function gt_st_medses (p_id_sotr:integer):Boolean;
var v_OracleQuery : TOracleQuery;
const c_id_st_medses = 1540;
begin
  v_OracleQuery := TOracleQuery.Create(nil);
  with v_OracleQuery do
  begin
    try
      Session:=dmMain.os;
      SQL.Text := 'select 1 from asu.tsotr ss, asu.ts_sprav ts where '+
                  ' ss.fk_id=:p_id and ts.fk_id = login.get_sotr_postid (ss.fk_id) '+
                  ' and ts.fk_id=:p_id_st_medses';
      DeclareVariable('p_id',otInteger);
      SetVariable('p_id',p_id_sotr);
      DeclareVariable('p_id_st_medses',otInteger);
      SetVariable('p_id_st_medses',c_id_st_medses);
      Execute;
      Result:=not Eof;
    finally
      Free;
    end;
  end;
end;

function DoShowTrebManual(pIdDocs: Integer):TModalResult;
var frmTrebManual : TfrmTrebManual;
begin
  frmTrebManual := TfrmTrebManual.Create(Application);
  try
    frmTrebManual.idTreb := pIdDocs;
    Result := frmTrebManual.ShowModal;
  finally
    frmTrebManual.Free;
  end;
end;

function DoInsTreb_DPC(pFK_TREBID: Integer;pFK_MEDICID: Integer; pFN_KOL: Double): Integer;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := dmMain.os;
    oq.Sql.Text := 'INSERT INTO MED.TTREB_DPC (FK_TREBID,FK_MEDICID,FN_KOL) VALUES (:FK_TREBID,:FK_MEDICID,:FN_KOL) RETURNING FK_ID INTO :FK_ID';
    oq.DeclareVariable('FK_ID',otInteger);
    oq.DeclareVariable('FK_TREBID',otInteger);
    oq.DeclareVariable('FK_MEDICID',otInteger);
    oq.DeclareVariable('FN_KOL',otFloat);
    oq.SetVariable('FK_TREBID',pFK_TREBID);
    oq.SetVariable('FK_MEDICID',pFK_MEDICID);
    oq.SetVariable('FN_KOL',pFN_KOL);
    try
      oq.Execute;
      Result := oq.GetVariable('FK_ID');
    except
      Result := -1;
    end;
  finally
    oq.Free;
  end;
end;

function DoUpdTreb_DPC(pFK_ID: Integer;pFK_MEDICID: Integer; pFN_KOL: Double): Boolean;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := dmMain.os;
    oq.Sql.Text := 'UPDATE MED.TTREB_DPC ' +
                   'SET    FK_MEDICID = :FK_MEDICID, ' +
                   '       FN_KOL     = :FN_KOL ' +
                   'WHERE  FK_ID      = :FK_ID ';
    oq.DeclareVariable('FK_ID',otInteger);
    oq.DeclareVariable('FK_MEDICID',otInteger);
    oq.DeclareVariable('FN_KOL',otFloat);
    oq.SetVariable('FK_ID',pFK_ID);
    oq.SetVariable('FK_MEDICID',pFK_MEDICID);
    oq.SetVariable('FN_KOL',pFN_KOL);
    try
      oq.Execute;
      Result := True;
    except
      Result := False;
    end;
  finally
    oq.Free;
  end;
end;

function DoDelTreb_Dpc(pFK_ID: Integer): Boolean;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := dmMain.os;
    oq.Sql.Text := 'DELETE FROM MED.TTREB_DPC WHERE FK_ID = :FK_ID';
    oq.DeclareVariable('fk_id',otInteger);
    oq.SetVariable('fk_id',pFK_ID);
    try
      oq.Execute;
      Result := True;
    except
      Result := False;
    end;
  finally
    oq.Free;
  end;
end;

function CheckInMedic(pFK_MEDICID: Integer; pFK_TREBID: Integer): Integer;
var ods : TOracleDataSet;
begin
  Result := -1;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := dmMain.os;
    ods.Sql.Text := 'SELECT FK_ID FROM MED.TTREB_DPC ' +
                    'WHERE FK_TREBID = :FK_TREBID' +
                    '  AND FK_MEDICID = :FK_MEDICID AND ROWNUM < 2';
    ods.DeclareVariable('FK_TREBID',otInteger);
    ods.DeclareVariable('FK_MEDICID',otInteger);
    ods.SetVariable('FK_TREBID',pFK_TREBID);
    ods.SetVariable('FK_MEDICID',pFK_MEDICID);
    try
      ods.Open;
      if not ods.Eof then
        Result := ods.FieldByName('FK_ID').AsInteger;
    except
    end;
  finally
    ods.Free;
  end;
end;

procedure TfrmTrebManual.acCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmTrebManual.acSaveExecute(Sender: TObject);
begin
  if deRegisterDate.Date = NullDate then
  begin
    Application.MessageBox(PChar('Необходимо ввести правильную дату регистрации документа!'), 'Ошибка', MB_OK + mb_iconerror);
    deRegisterDate.Enabled := True;
    deRegisterDate.SetFocus;
    exit;
  end;
  if LCBFrom.Text = '' then
  begin
    lcbMO_GroupFrom.SetFocus;
    Application.MessageBox(PChar('Вы не выбрали "От кого" требование!'), 'Ошибка', MB_OK + mb_iconerror);
    exit;
  end;
  if LCBTo.Text = ''  then
  begin
    LCBTo.SetFocus;
    Application.MessageBox(PChar('Вы не выбрали "Кому" требование!'), 'Ошибка', MB_OK + mb_iconerror);
    exit;
  end;
  if lcbMO_GroupFrom.Text = '' then
  begin
    lcbMO_GroupFrom.SetFocus;
    Application.MessageBox(PChar('Вы не указали откуда формируется требование'), 'Ошибка', MB_OK + mb_iconerror);
    exit;
  end;
  if lcbMO_GroupTo.Text = '' then
  begin
    lcbMO_GroupTo.SetFocus;
    Application.MessageBox(PChar('Вы не указали куда предназначено требование'), 'Ошибка', MB_OK + mb_iconerror);
    exit;
  end;

  if lcbMO_GroupFrom.KeyValue = lcbMO_GroupTo.KeyValue then
  begin
    LCBTo.SetFocus;
    Application.MessageBox(PChar('Невозможно фомировать требование внутри отделения!'), 'Ошибка', MB_OK + mb_iconerror);
    exit;
  end;

  if (odsMedic.RecordCount = 0) then
  begin
    Application.MessageBox(PChar('Список медикаментов в требовании пуст!'), 'Ошибка', MB_OK + mb_iconerror);
    exit;
  end;

  if (mComment.Enabled)and(mComment.Visible) then mComment.SetFocus;

  if odsMedic.State = dsEdit then odsMedic.Post;


  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_TREB_QUOTA', 0)=1) then
  begin
    odsMedic.First;
    odsCheckQuota.SetVariable('MO_GROUP', dmMain.FK_CurMO_GROUP);
    odsCheckQuota.SetVariable('PDATE',   deRegisterDate.Date);
    while odsMedic.Eof = False do
    begin
      odsCheckQuota.Close;
      odsCheckQuota.SetVariable('MEDICID', odsMedic.FieldByName('FK_MEDICID').AsVariant);
      odsCheckQuota.Open;

      if (odsCheckQuota.RecordCount > 0)and(odsCheckQuota.FieldByName('fn_quota_kol').AsFloat > 0)and (odsCheckQuota.FieldByName('fn_polucheno_po_treb_kol').AsFloat + odsMedic.FieldByName('FN_KOl').AsFloat > odsCheckQuota.FieldByName('fn_quota_kol').AsFloat) then
      begin
        Application.MessageBox(PChar('Для медикамента "'+odsMedic.FieldByName('FC_MEDIC').AsString+'" превышен размер квоты.'), 'Ошибка', MB_OK + MB_ICONERROR);
        Exit;
      end;
      odsMedic.Next;
    end;
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_REQUIRE_FINSOURCE_IN_TREB', 0)=1) then
  begin
    if lcbFinSource.EditValue = null then
    begin
      lcbFinSource.SetFocus;
      Application.MessageBox(PChar('Необходимо указать источник финансирования'), 'Ошибка', MB_OK + mb_iconerror);
      lcbFinSource.DroppedDown := True;
      exit;
    end;
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_ONLY_SOST_MEDICS_FOR_TREB_TO_RPO', 0) = 1) then
  begin // настройка включена
    if ((odsMO_GroupTo.Locate('groupid', lcbMO_GroupTo.KeyValue, []))and
       (dmMain.odsSklad.Locate('fk_id', odsMO_GroupTo.FieldByName('fk_sklad_id').AsVariant, []))and
       (dmMain.odsSklad.FieldByName('fc_synonim').AsVariant = 'RPO'))or(FL_RPO=True) then // все условия соблюдены
    begin
      dmMain.InitAdditionalUpdateTable('MED.TTREB');
      dmMain.AddAdditionalUpdateTable('FL_RPO', otInteger, 1);
      dmMain.ExecuteAdditionalUpdateTable('FK_ID', otInteger, FidTreb); // обновление таблицы MED.TTREB выполнено
    end;
  end;

  // сохраним в реестр установки формы
  SavFromToFIO ;

  ModalResult := mrok;
end;

procedure TfrmTrebManual.acDeleteExecute(Sender: TObject);
begin
  if (odsMedic.State = dsEdit)or(odsMedic.State = dsInsert) then odsMedic.Post;
  if Windows.MessageBox(Self.Handle,
    PChar('Вы действительно хотите удалить "' + odsMedic.FieldByName('fc_medic').AsString +
    '" из требования?'), 'Предупреждение', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes
  then
  begin
    dmMain.PKGTREB.DODELTREBDPC(odsMedic.FieldByName('fk_id').AsInteger);
//    if not DoDelTreb_Dpc(odsMedic.FieldByName('fk_id').AsInteger) then
//      MessageBox(Self.Handle, PChar('Не удалось удалить медикамент!'), 'Ошибка', MB_OK + mb_iconerror)
    odsMedic.Close;
    odsMedic.Open;    
  end;
end;

procedure TfrmTrebManual.FormCreate(Sender: TObject);
begin
  miUseShtrihcode.Checked := False;

  FL_RPO := False;
  FInsFromOst := False;
  FInsFromSkladOst := False;
  iWho_called:=0;
  odsNameFrom.Open;
  odsNameTo.Open;
  odsMO_GroupFrom.Open;       

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_CLASS', 0) = 0 then
  begin
    cxGrid1DBTableView1FC_CLASS.VisibleForCustomization := False;
    cxGrid1DBTableView1FC_CLASS.Visible                 := False;
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_CROSS_TABLE_CHECK', 0)=1)and(bReadOnly = False) then
  begin
    odsMO_GroupTo.Filtered := False;
    odsMO_GroupTo.Filter := 'FN_VALUE = 1';
    odsMO_GroupTo.Filtered := True;
  end;
  odsMO_GroupTo.Open;
  LCBTo.KeyValue := Null;
  lcbMO_GroupTo.KeyValue := Null;
  lcbFrom.KeyValue := Null;
  lcbMO_GroupFrom.KeyValue := Null;
//  lcbMO_GroupTo.KeyValue := dmMain.pkgMedSes.GET_CUR_MOGROUP_BY_MOID( LCBTo.KeyValue );

  if frmMain.ProvisorState = 1 then // если провизор делает требование - то оно адресовано ему
  begin
    LCBTo.KeyValue         := dmMain.MOID;
    lcbMO_GroupTo.KeyValue := dmMain.FK_CurMO_GROUP;
    GtFrReg(False);
  end
  else
  begin
    lcbFrom.KeyValue         := dmMain.MOID;
    lcbMO_GroupFrom.KeyValue := dmMain.FK_CurMO_GROUP;
    if lcbFrom.Enabled then
      GtFrReg(True);
  end;

  acInsBySkladOst.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_ADD_MED_TO_TREB_BY_SKLAD_OST', 0)=1);
  acInsFromOst.Visible    := (dmMain.ConfigParams.GetParamValue('FUNC_ADD_MED_TO_TREB_BY_CUR_OST', 0)=1);

  deRegisterDate.Date := trunc(ServerDate(dmMain.Os));

  // автоматически определяем длину ограничения на поле Воронов О.А. 25.08.2008
  mComment.MaxLength := dmMain.GetFieldLength('med', 'ttreb', 'fc_comment') - 5; // 5 символов - задел под CITO
end;

procedure TfrmTrebManual.acSecretExecute(Sender: TObject);
begin
  acSecret.Checked := not acSecret.Checked;
  if acSecret.Checked then
  begin
    EnableInput;
    EnableActions;
  end
  else
  begin
    DisableInput;
    DisableActions;
  end;  

  if not acSecret.Checked then cxGrid1DBTableView1.OnDblClick := nil
  else cxGrid1DBTableView1.OnDblClick := acEditExecute;
  FbReadOnly := not acSecret.Checked;
end;

procedure TfrmTrebManual.odsMedicAfterScroll(DataSet: TDataSet);
begin
	acSave.Enabled := (not DataSet.IsEmpty) and (iStatus<>2);
//	acEdit.Enabled := (not FbReadOnly) and (acSave.Enabled) and (DataSet.FieldByName('KARTID').AsInteger = 0);
//	acDelete.Enabled :=(not FbReadOnly) and (acSave.Enabled) and (DataSet.FieldByName('KARTID').AsInteger = 0);
end;

procedure TfrmTrebManual.SetidTreb(const Value: Integer);
begin
  FidTreb := Value;
  case iWho_called of
   1:Begin
      odsMedic.Close;
      odsMedic.SetVariable('FK_TREBID',Value);
      odsMedic.Open;
     end;

   2:Begin
      odsMedic.Close;
  //		odsMedic.SQL.clear;
  //		odsMedic.SQL.text:='SELECT /*+RULE*/ D.ROWID, ROWNUM, D.*, M.FC_NAME AS FC_MEDIC, E.FC_NAME AS FC_EDIZM, 0 AS KARTID ' +
  //											 'FROM MED.TTREB_DPC D, MED.TMEDIC M, MED.TEI E '+
  //											 'WHERE D.FK_TREBID = :FK_TREBID '+
  //											 '	AND M.MEDICID = D.FK_MEDICID '+
  //											 '	AND D.FK_TREBID IS NOT NULL '+
  //											 '	AND D.FK_MEDICID IS NOT NULL '+
  //											 '	AND M.EIID = E.EIID ';

      odsMedic.SetVariable('FK_TREBID',Value);
      odsMedic.Open;
     end;
   else
     Begin
      odsMedic.Close;
      odsMedic.SetVariable('FK_TREBID',Value);
      odsMedic.Open;
     end;
  end;

  
end;

procedure TfrmTrebManual.acInsBySkladOstExecute(Sender: TObject);
begin
  FInsFromOst := True;
  try
    FInsFromSkladOst := True;
    acInsert.Execute;
  finally
    FInsFromOst := False;
    FInsFromSkladOst := False;    
  end;
end;

function nvl(p: Variant; NewPattern: Variant):Variant;
begin
  if VarIsNull(p) or VarIsEmpty(p) then Result := NewPattern
  else Result := p;
end;

procedure TfrmTrebManual.acInsertExecute(Sender: TObject);
var //frmTrebMedic : TfrmTrebMedic;
    nDpcId, nMedicId       : Integer;
    MedicFilter, MedicWhere, PartiesWhereAddition : string;
    MO_GROUP_OST : integer;
    MaxMedicCount : integer;
    MedicidList : TarrInt;
    i : integer;
    OstRec : TOstatokRec;
begin
{  if not CanAppendDpc then //проверка влезает ли отчет на 1 страницу!
	begin
		MessageBox(Self.Handle, PChar('Количество наименований превышает норму.' + #13#10 +
		'Создайте следующее требование!'), 'Внимание', MB_OK + mb_iconwarning);
		Exit;
  end;}

  MedicFilter := '';
  PartiesWhereAddition := '';
  // Добавление nId = 0
  if (odsMedic.State = dsEdit)or(odsMedic.State = dsInsert) then odsMedic.Post;

  if odsMedic.RecordCount >0 then
    nMedicId := odsMedic.FieldByName('FK_MEDICID').AsInteger
  else
    nMedicId := 0;

  MaxMedicCount := dmMain.ConfigParams.GetParamValue('FUNC_MEDIC_COUNT_IN_TREB', 0);
  if (MaxMedicCount > 0)and(odsMedic.RecordCount >= MaxMedicCount) then
  begin
    Application.MessageBox(PChar('Для требований установлен лимит строк ('+IntToStr(MaxMedicCount)+').'), 'Внимание', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  if lcbMO_GroupTo.Text = '' then
  begin
    Application.MessageBox(PChar('Перед заполнением списка требования необходимо'#13#10'указать какой группе мат. отв. оно адресовано.'), 'Ошибка', MB_OK + MB_ICONERROR);
    lcbMO_GroupTo.SetFocus;
    lcbMO_GroupTo.DropDown;
    exit;
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1 then
  begin
//    MedicFilter := 'FK_SKLAD_ID = '+IntToStr(lcbMO_GroupTo.ListSource.DataSet.FieldByName('FK_SKLAD_ID').AsInteger);
  end;

  if lcbMO_GroupFrom.Text = '' then
  begin
    Application.MessageBox(PChar('Перед заполнением списка требования необходимо'#13#10'указать от какой группы мат. отв. оно составляется.'), 'Ошибка', MB_OK + MB_ICONERROR);
    lcbMO_GroupFrom.SetFocus;
    lcbMO_GroupFrom.DropDown;
    exit;
  end;

  lcbMO_GroupTo.ListSource.DataSet.Locate('GROUPID', lcbMO_GroupTo.KeyValue, []);
  lcbMO_GroupFrom.ListSource.DataSet.Locate('GROUPID', lcbMO_GroupFrom.KeyValue, []);  
  
  if (dmMain.ConfigParams.GetParamValue('FUNC_REQUIRE_FINSOURCE_IN_TREB', 0) = 1) then
  begin
    if lcbFinSource.EditValue = null then
    begin
      lcbFinSource.SetFocus;
      Application.MessageBox(PChar('Необходимо указать источник финансирования'), 'Ошибка', MB_OK + mb_iconerror);
      lcbFinSource.DroppedDown := true;
      exit;
    end;

    if MedicFilter <> '' then
      MedicFilter := MedicFilter + ' and ';

    MedicFilter := MedicFilter + '(FK_FINSOURCE_ID = '+IntToStr(lcbFinSource.EditValue)+')';
  end;

//  if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 1) then
//  begin
//    if MedicFilter <> '' then
//      MedicFilter := MedicFilter + ' and ';
//
//    MedicFilter := MedicFilter + '((FC_QUOTA_CODE_1 = ''00'') or (FC_QUOTA_CODE_1 = '''+ lcbMO_GroupFrom.ListSource.DataSet.FieldByName('FC_QUOTA_CODE_1').AsString +'''))';
//  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_ONLY_SOST_MEDICS_FOR_TREB_TO_RPO', 0) = 1) or (FL_RPO=True) then
  begin // настройка включена
    if ((odsMO_GroupTo.Locate('groupid', lcbMO_GroupTo.KeyValue, []))and
       (dmMain.odsSklad.Locate('fk_id', odsMO_GroupTo.FieldByName('fk_sklad_id').AsVariant, []))and
       (dmMain.odsSklad.FieldByName('fc_synonim').AsVariant = 'RPO'))or(FL_RPO=True) then // все условия соблюдены
    begin
      MedicWhere := MedicWhere+' and SostMed.Count_ > 0 ';
      PartiesWhereAddition := PartiesWhereAddition+' and fn_sost_count > 0 ';
    end;
  end;

  if FInsFromOst then
  begin
    if FInsFromSkladOst then
      MO_GROUP_OST := nvl(lcbMO_GroupTo.KeyValue,-1)
    else
      MO_GROUP_OST := -1;
    delete(PartiesWhereAddition,1,4);

//    с зажатой клавишей Shift функционал не работает. TODO: починить в скором светлом будущем
//    if ((GetKeyState(VK_SHIFT) and $8000) <> 0) then   //Если зажата клавиша Shift
//      DoShowMedKardLst( MedicidList, true, -1, dmMain.MedKardLst_FocusedRowIndex, 0, MedicFilter <> '', SPISANIE_VID_NONE, PartiesWhereAddition,False, MedicFilter,False,True, False, MO_GROUP_OST, 0, 'Список остатков по партиям', miUseShtrihcode.Checked )
//    else
      OstRec := DoShowMedKardLst( -1, dmMain.MedKardLst_FocusedRowIndex, 0, MedicFilter <> '', SPISANIE_VID_NONE, PartiesWhereAddition,False, MedicFilter,False,True, False, MO_GROUP_OST, 0, 'Список остатков по партиям', miUseShtrihcode.Checked );
      nMedicId := OstRec.MEDICID;
  end
  else
    if ((GetKeyState(VK_SHIFT) and $8000) <> 0) then   //Если зажата клавиша Shift
      MedicidList := DoShowMedicForGroupAdd(nMedicId, True, MedicWhere,  False, miUseShtrihcode.Checked, '', 'Список объектов учета', lcbMO_GroupTo.ListSource.DataSet.FieldByName('FK_SKLAD_ID').AsInteger)
    else
      nMedicId := DoShowMedic(nMedicId, True, MedicWhere,  False, miUseShtrihcode.Checked, '', 'Список объектов учета', lcbMO_GroupTo.ListSource.DataSet.FieldByName('FK_SKLAD_ID').AsInteger);

  if (nMedicId <= 0) and (Length(MedicidList) = 0) then Exit; // просто выходим если не выбрали медикамент Воронов О.А. 13.08.2007

  //Делаем более универсально
  if (Length(MedicidList) = 0) then begin
    SetLength(MedicidList,1);
    MedicidList[0] := nMedicId;
  end;


  for i := 0 to Length(MedicidList) - 1 do begin
    //проверяем наличие медикамента в требовании
    //#todo2 переделать на pkgtreb
    nDpcId := CheckInMedic(MedicidList[i],idTreb);
    if nDpcId > -1 then
    begin
      if MessageBox(Self.Handle, PChar('Требование уже содержит медикамент "' +
        dmMain.pkgMedic.Getnamebyid(nMedicId) + '"' + #13#10 +
        'Добавить к существующему?'),
        'Внимание', mb_yesno + mb_iconwarning) = idyes
      then
      begin
        odsMedic.Locate('fk_id',nDpcId,[]);
        DoUpdTreb_DPC(nDpcId, MedicidList[i], odsMedic.FieldByName('FN_KOL').AsFloat);
        odsMedic.Close;
        odsMedic.Open;
        odsMedic.Locate('FK_ID',nDpcId,[]);
      end
      else odsMedic.Locate('fk_id',nDpcId,[]);
    end
    else
    begin
      // Если нет такого еще, то вставляем
      nDpcId := DoInsTreb_DPC(idTreb, MedicidList[i], 0);
      if nDpcId = -1 then
        MessageBox(Self.Handle, PChar('Не удалось добавить медикамент!'), 'Ошибка', MB_OK + mb_iconerror)
      else
      begin
//      if (not DoCheckOnePage) and False then //проверка влезает ли отчет на 1 страницу!
//      begin
//        MessageBox(Self.Handle, PChar('Количество наименований превышает норму.' + #13#10 +
//        'Создайте следующее требование!'), 'Внимание', MB_OK + mb_iconwarning);
//         if not DoDelTreb_Dpc(nDpcId) then
//          MessageBox(Self.Handle, PChar('Не удалось удалить медикамент!'), 'Ошибка', MB_OK + mb_iconerror);
//        Exit;
//      end
//      else
//      begin
        odsMedic.Close;
        odsMedic.Open;
        odsMedic.Locate('FK_ID',nDpcId,[]);
//      end;
      end;
    end;
  end;
  // выставляем фокус на столбце "Кол-во"
  odsMedic.RefreshRecord;
  cxGrid1.SetFocus;
  cxGrid1DBTableView1_FN_KOL.Selected := True;
end;

procedure TfrmTrebManual.acEditExecute(Sender: TObject);
var //frmTrebMedic : TfrmTrebMedic;
    bRes         : Boolean;
    nDpcId, nMedicId       : Integer;
    MedicFilter : string;
begin
  if (odsMedic.State = dsEdit)or(odsMedic.State = dsInsert) then odsMedic.Post;
  nMedicId := odsMedic.FieldByName('FK_MEDICID').AsInteger;

  MedicFilter := '';
  if dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1 then
  begin
    if lcbMO_GroupTo.Text = '' then
    begin
      Application.MessageBox(PChar('Перед заполнением списка требования необходимо'#13#10'указать какой группе мат. отв. оно адресовано.'), 'Ошибка', MB_OK + MB_ICONERROR);
      lcbMO_GroupTo.SetFocus;
      lcbMO_GroupTo.DropDown;
      exit;
    end;
    lcbMO_GroupTo.ListSource.DataSet.Locate('GROUPID', lcbMO_GroupTo.KeyValue, []);
//    MedicFilter := 'FK_SKLAD_ID = '+IntToStr(lcbMO_GroupTo.ListSource.DataSet.FieldByName('FK_SKLAD_ID').AsInteger);
  end;

  nMedicId := DoShowMedic(nMedicId, True, '', False, False, MedicFilter, 'Список объектов учета', lcbMO_GroupTo.ListSource.DataSet.FieldByName('FK_SKLAD_ID').AsInteger);

  if nMedicId <= 0 then Exit;
  nDpcId := CheckInMedic(nMedicId, idTreb);
  if (nMedicId <> odsMedic.FieldByName('FK_MEDICID').AsInteger) and (nDpcId > -1) then
  begin
    MessageBox(Self.Handle, PChar('Требование уже содержит медикамент "' +
               dmMain.pkgMedic.Getnamebyid(nMedicId) + '"'), 'Внимание', MB_OK + MB_ICONWARNING);
    odsMedic.Locate('fk_id',nDpcId,[]);
  end
  else
  begin
    bRes := DoUpdTreb_DPC(odsMedic.FieldByName('FK_ID').AsInteger,
      nMedicId, odsMedic.FieldByName('FN_KOL').AsInteger);
    if not bRes then
      MessageBox(Self.Handle, PChar('Не удалось изменить медикамент!'), 'Ошибка', MB_OK + mb_iconerror)
    else
    begin
      odsMedic.Close;
      odsMedic.Open;      
    end;

  end;
end;

procedure TfrmTrebManual.SetbReadOnly(const Value: Boolean);
begin
  FbReadOnly := Value;
	acSave.Enabled := not Value;
//  acInsert.Enabled := acSave.Enabled;
	acInsert.Enabled:= acSave.Enabled or (iStatus=0) OR (iStatus=1);//обрабатывается + необработано
  acEdit.Enabled := acEdit.Enabled and acSave.Enabled and (not FbReadOnly);
	acDelete.Enabled := acDelete.Enabled and acSave.Enabled  and (not FbReadOnly);
//  deRegisterDate.Enabled := acSave.Enabled;
	mComment.Enabled := acSave.Enabled;
//  lcbFrom.Enabled := acSave.Enabled;
  LCBTo.Enabled := acSave.Enabled;
//  lcbMO_GroupFrom.Enabled := acSave.Enabled;
  lcbMO_GroupTo.Enabled := acSave.Enabled;
  chbFL_CITO.Enabled := acSave.Enabled;
//  cxGrid1DBTableView1.OptionsData.Editing := not Value;
  if Value then cxGrid1DBTableView1.OnDblClick := nil
	else cxGrid1DBTableView1.OnDblClick := acEditExecute;
end;

procedure TfrmTrebManual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  LCBTo.CloseUp(False);
  LCBFrom.CloseUp(False);
  lcbMO_GroupTo.CloseUp(False);
  lcbMO_GroupFrom.CloseUp(False);
  if FbFillMinZapas = True then
    IniWriteString(iniFileName, Self.Name, 'grbMinZapas_Height', IntToStr(grbMinZapas.Height));

  if (bReadOnly = False)and(CurTrebLockID<>'') then
    dmMain.SetUnLock(CurTrebLockID);

  ModalRes := Self.ModalResult;
  dmMain.MedKardLst_FocusedRowIndex := -1;  
end;

procedure TfrmTrebManual.SetbFillMinZapas(const Value: Boolean);
begin
  FbFillMinZapas := Value;
//----------заполнение требования на основании мин запаса-----------------------
  if FbFillMinZapas then
  begin
    Caption := 'Регистрация требования на пополнение мин. запаса';
// это теперь это делается через датасет - поскольку получаемые этим запросом цифры нужны для отображения
//    dmMain.PKGTREB.FILLMINZAPAS(idTreb, dmMain.pkgMedSes.GET_CUR_MOGROUP_BY_CUR_MO);
    odsMinZapas.Open;
    grbMinZapas.Show;
    Splitter1.Show;
    odsMedic.AfterScroll:=nil;
    odsMedic.Close;
    odsMedic.SetVariable('FK_TREBID',idTreb);
//    odsMedic.Open;
    acAutoFill.Execute;
    odsMedic.AfterScroll:=odsMedicAfterScroll;
    odsMedicAfterScroll(odsMedic);
  end;
//------------------------------------------------------------------------------
end;

procedure TfrmTrebManual.chbFL_CITOClick(Sender: TObject);
begin
  if chbFL_CITO.Checked then
  begin
    if Copy(mComment.Text, 1, 4) <> 'CITO' then
      mComment.Text := 'CITO ' + mComment.Text;
    chbFL_CITO.Tag := 1;
  end
  else
  begin
    if Copy(mComment.Text, 1, 4) = 'CITO' then
      mComment.Text := StringReplace(mComment.Text,'CITO','',[]);
    chbFL_CITO.Tag := 0;    
  end;
end;

procedure TfrmTrebManual.DisableActions;
begin
  acSave.Enabled := False;
  acInsert.Enabled := False;
  acEdit.Enabled := False;
  acDelete.Enabled := False;
end;

procedure TfrmTrebManual.DisableInput;
begin
  deRegisterDate.Enabled := False;
  mComment.Enabled := False;
  lcbFrom.Enabled := False;
  LCBTo.Enabled := False;
  lcbMO_GroupFrom.Enabled := False;
  lcbMO_GroupTo.Enabled := False;
  chbFL_CITO.Enabled := False;
  cxGrid1DBTableView1.OptionsData.Editing := False;  
end;

procedure TfrmTrebManual.EnableActions;
begin
  acSave.Enabled := True;
  acInsert.Enabled := True;
  acEdit.Enabled := True;
  acDelete.Enabled := True;
end;

procedure TfrmTrebManual.EnableInput;
begin
  deRegisterDate.Enabled := True;
  mComment.Enabled := True;
//  lcbFrom.Enabled := True;
  LCBTo.Enabled := True;
//  lcbMO_GroupFrom.Enabled := True;
  lcbMO_GroupTo.Enabled := True;
  chbFL_CITO.Enabled := True;
  cxGrid1DBTableView1.OptionsData.Editing := True;
end;

procedure TfrmTrebManual.lcbMO_GroupFromClick(Sender: TObject);
begin
//----------заполнение требования на основании мин запаса-----------------------
  if FbFillMinZapas then
  begin
//    dmMain.PKGTREB.FILLMINZAPAS(idTreb, lcbFrom.KeyValue);
//    dmMain.PKGTREB.FILLMINZAPAS(idTreb, lcbMO_GroupFrom.KeyValue);
    acAutoFill.Execute;
    odsMedic.Close;
    odsMedic.Open;
  end;

  lcbFrom.ListSource.DataSet.Locate('fk_curmogroupid;fl_del', VarArrayOf([lcbMO_GroupFrom.KeyValue,0]), []);
  lcbFrom.KeyValue :=  lcbFrom.ListSource.DataSet.FieldByName('MOID').asVariant;
end;

procedure TfrmTrebManual.lcbMO_GroupFromCloseUp(Sender: TObject);
var v_is_fnd : Boolean;
begin
  v_is_fnd:=False;
  // автоматически фильтруем получателей требования
  if LCBFrom.Enabled then
  begin
    odsNameFrom.Filtered := False;
    odsNameFrom.Filter := '(FL_DEL = 0) AND (FK_CURMOGROUPID = '+IntToStr(odsMO_GroupFrom.FieldByName('GROUPID').AsInteger) + ')';
    odsNameFrom.Filtered := True;
    odsNameFrom.First;
    while not odsNameFrom.eof do
    begin
      if gt_st_medses(odsNameFrom.FieldByName('FK_SOTRID').AsInteger) then
      begin
        lcbFrom.KeyValue := odsNameFrom.FieldByName('MOID').AsInteger ;
        v_is_fnd:=True;
        Break;
      end;
      odsNameFrom.Next;
    end;
  end;
  if not v_is_fnd then
  begin
    LCBFrom.ListSource.DataSet.Locate('fk_curmogroupid;fl_del', VarArrayOf([lcbMO_GroupFrom.KeyValue,0]), []);
    LCBFrom.KeyValue := LCBFrom.ListSource.DataSet.FieldByName('MOID').asVariant;
  end;
  GtFrReg(True);
end;

procedure TfrmTrebManual.lcbMO_GroupFromKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  lcbMO_GroupFromCloseUp(nil);
end;

procedure TfrmTrebManual.acAutoFillExecute(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  DoDelTreb_Dpc( idTreb ); // очистили требование
  cxGridMinZapas.BeginUpdate;
  odsMinZapas.First;
  while not odsMinZapas.Eof do
  begin
    DoInsTreb_DPC(idTreb, odsMinZapas.FieldByName('MEDICID').AsInteger, odsMinZapas.FieldByName('NEEDKOLVO').AsInteger );
    odsMinZapas.Next;
  end;
  cxGridMinZapas.EndUpdate;

  odsMedic.Close;
  odsMedic.Open;  
  Screen.Cursor := crDefault;  
end;

procedure TfrmTrebManual.cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if dmMain.ConfigParams.GetParamValue('FUNC_USE_CLASS', 0) = 1 then
  begin
    if AViewInfo.GridRecord.Values[ cxGrid1DBTableView1FC_CLASS.Index ] = '2а' then
      ACanvas.Brush.Color := $7fff00
    else if AViewInfo.GridRecord.Values[ cxGrid1DBTableView1FC_CLASS.Index ] = '2б' then
      ACanvas.Brush.Color := $03c03c
    else if AViewInfo.GridRecord.Values[ cxGrid1DBTableView1FC_CLASS.Index ] = '3' then
      ACanvas.Brush.Color := $3300ff;
  end;
end;

procedure TfrmTrebManual.cxGridMinZapasDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  KOL_DIFF : Double;  
begin
  KOL_DIFF := AViewInfo.GridRecord.Values[ cxGridMinZapasDBTableView1COLVO.Index] -   AViewInfo.GridRecord.Values[ cxGridMinZapasDBTableView1OSTMEDIC.Index];
  if KOL_DIFF = 0 then  ACanvas.Brush.Color := $D9FFD9  // выдано нужно количество - зеленый
  else
    if KOL_DIFF > 0 then ACanvas.Brush.Color := $D9D9FF // недодали - красный
    else
      {if KOL_DIFF < 0 then} ACanvas.Brush.Color := $FFD9D9 // дали больше - синий
end;

procedure TfrmTrebManual.FormActivate(Sender: TObject);
begin
  if (iWho_called = 2)and(frmMain.ProvisorState = 1) then
  begin
    lcbMO_GroupFrom.Enabled := True;
    lcbFrom.Enabled := True;
  end;

  if FbFillMinZapas = True then
  begin
    grbMinZapas.Height := IniReadInteger(iniFileName, Self.Name, 'grbMinZapas_Height', 180);
    if grbTreb.Height < 220 then Self.ClientHeight := Self.ClientHeight + 220 - grbTreb.Height;
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_REQUIRE_FINSOURCE_IN_TREB', 0) = 1 then
    paFinSource.Show
  else
    paCaption.Height := paCaption.Height - paFinSource.Height;
  if FbReadOnly then
  begin
     DisableInput;
     DisableActions;
  end;
end;

procedure TfrmTrebManual.deRegisterDatePropertiesEditValueChanged(Sender: TObject);
begin
  if not IsValidDateEditValue( TcxDateEdit(Sender).Text ) then TcxDateEdit(Sender).EditValue := ServerDate(dmMain.os);
end;

procedure TfrmTrebManual.deRegisterDatePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  cxDateEdit_PropertiesValidate(Sender, DisplayValue, ErrorText, Error);
end;

procedure TfrmTrebManual.lcbMO_GroupToCloseUp(Sender: TObject);
var v_is_fnd : Boolean;
begin
  v_is_fnd:=False;
  // автоматически фильтруем получателей требования
  if LCBTo.Enabled then
  begin
    odsNameTo.Filtered := False;
    odsNameTo.Filter := '(FL_DEL = 0) AND (FK_CURMOGROUPID = '+IntToStr(odsMO_GroupTo.FieldByName('GROUPID').AsInteger) + ')';
    odsNameTo.Filtered := True;
    odsNameTo.First;
    while not odsNameTo.eof do
    begin
      if gt_st_medses(odsNameTo.FieldByName('FK_SOTRID').AsInteger) then
      begin
        LCBTo.KeyValue := odsNameTo.FieldByName('MOID').AsInteger ;
        v_is_fnd:=True;
        Break;
      end;
      odsNameTo.Next;
    end;
  end;
  if not v_is_fnd then
  begin
    LCBTo.ListSource.DataSet.Locate('fk_curmogroupid;fl_del', VarArrayOf([lcbMO_GroupTo.KeyValue,0]), []);
    LCBTo.KeyValue := LCBTo.ListSource.DataSet.FieldByName('MOID').asVariant;
  end;
  GtFrReg(False);
end;

procedure TfrmTrebManual.lcbMO_GroupToKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  lcbMO_GroupToCloseUp(nil);
end;

procedure TfrmTrebManual.LCBToKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then odsNameTo.Filtered := False;
end;

procedure TfrmTrebManual.miUseShtrihcodeClick(Sender: TObject);
begin
  miUseShtrihcode.Checked := not miUseShtrihcode.Checked;
end;

procedure TfrmTrebManual.acInsFromOstExecute(Sender: TObject);
begin
  FInsFromOst := True;
  try
    acInsert.Execute;
  finally
    FInsFromOst := False;
    FInsFromSkladOst := False;    
  end;
end;

end.
