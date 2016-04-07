unit fZayavEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Db, OracleData,
  DBCtrls, Oracle,
  JvToolEdit, JvBaseEdits, JvFormPlacement, HtmlHlp,
  JvComponentBase, JvExStdCtrls, JvEdit, JvValidateEdit, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxTextEdit, cxSpinEdit, cxCurrencyEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridLevel, cxGrid, cxCalendar, cxDBLookupComboBox,
  cxContainer, cxMaskEdit, cxDropDownEdit, cxGroupBox, cxLookupEdit,
  cxDBLookupEdit, cxLookAndFeelPainters;

type
	TfrmZayavEdit = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnSave: TToolButton;
    btnCancel: TToolButton;
    al: TActionList;
    actSave: TAction;
    acesc: TAction;
    Panel1: TPanel;
    edZayavNum: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    btnAdd: TToolButton;
    btnEdit: TToolButton;
    btnDel: TToolButton;
    actAdd: TAction;
    acedit: TAction;
    actDelete: TAction;
    Panel2: TPanel;
    odsZayav_DPC: TOracleDataSet;
    dsZayav_DPC: TDataSource;
    Label5: TLabel;
    acrefresh: TAction;
    FormStorage: TJvFormStorage;
    lbInvoice: TLabel;
    lbFrom: TLabel;
    mComment: TEdit;
    deInvoiceDate: TcxDateEdit;
    deRegistrDate: TcxDateEdit;
    Label9: TLabel;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    edDov_Num: TEdit;
    deDov_Date: TcxDateEdit;
    Label4: TLabel;
    Label7: TLabel;
    lcbPostav: TcxLookupComboBox;
    lcb_MO_SOST: TcxLookupComboBox;
    LCB_MO_GET: TcxLookupComboBox;
    odsZayavka: TOracleDataSet;
    oqSetZayavka: TOracleQuery;
    oqSetZayavka_DPC: TOracleQuery;
    oqDelZayavka_DPC: TOracleQuery;
    grZayav_DPC: TcxGrid;
    grZayav_DPCDBTableView1: TcxGridDBTableView;
    grZayav_DPCDBTableView1_FC_MEDIC: TcxGridDBColumn;
    grZayav_DPCDBTableView1_FC_EDIZM: TcxGridDBColumn;
    grZayav_DPCDBTableView1_FN_KOL: TcxGridDBColumn;
    grZayav_DPCLevel1: TcxGridLevel;
    grZayav_DPCDBTableView1FK_MEDIC: TcxGridDBColumn;
    grZayav_DPCDBTableView1FK_ZAYAVKA: TcxGridDBColumn;
    grZayav_DPCDBTableView1FK_ZAYAVKA_DPC_ID: TcxGridDBColumn;
    procedure actSaveExecute(Sender: TObject);
    procedure acescExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure aceditExecute(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure grZayav_DPCDBTableView1DblClick(Sender: TObject);
    procedure odsZayav_DPCAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure acrefreshExecute(Sender: TObject);
    procedure alUpdate(Action: TBasicAction; var Handled: Boolean);
	private
		{ Private declarations }
    FID_ZAYAV : integer;
    procedure Set_ID_ZAYAV(const Value: Integer);
	public
    bCanEdit : Boolean;
    procedure EnableInput(const aEnabled : Boolean );

    property ID_ZAYAV : Integer read FID_ZAYAV write Set_ID_ZAYAV;

	end;

var
	frmZayavEdit: TfrmZayavEdit;

  function DoShowZayavkaEdit(var aFK_ZayavID : Integer; const aCanEdit : Boolean = True): Integer;
  
implementation

uses fdmMain, fmainform, fZayavList, Variants, fMedic;


{$R *.DFM}
{$C+}

function DoShowZayavkaEdit(var aFK_ZayavID : Integer; const aCanEdit : Boolean = True): Integer;
var
  FIsNewDoc : Boolean;
  FD_DATE_NOW : TDateTime;
  FK_CUR_MO : Integer;
begin
  Result := mrNone;
  FIsNewDoc := False;
  try
    Application.CreateForm(TfrmZayavEdit, frmZayavEdit);
      frmZayavEdit.odsZayavka.Close;
    //--------------------------------------------------------------------------
    if (aFK_ZayavID <= 0) then
    begin // значения по умолчанию для новой заявки
      FD_DATE_NOW := ServerDate(dmMain.os);
      FK_CUR_MO   := TRUNC(dmMain.pkgMedSes.GETCURMO);
      frmZayavEdit.oqSetZayavka.SetVariable('FK_ZAYAVID', -1);
      frmZayavEdit.oqSetZayavka.SetVariable('fd_invoice', FD_DATE_NOW);
      frmZayavEdit.oqSetZayavka.SetVariable('fc_zayav_num', '');
      frmZayavEdit.oqSetZayavka.SetVariable('fd_create', FD_DATE_NOW);
      frmZayavEdit.oqSetZayavka.SetVariable('fk_postavid', -1);
      frmZayavEdit.oqSetZayavka.SetVariable('fk_mo_zayav', FK_CUR_MO);
      frmZayavEdit.oqSetZayavka.SetVariable('fk_mo_get',   FK_CUR_MO);
      frmZayavEdit.oqSetZayavka.SetVariable('fc_dover_num', '');
      frmZayavEdit.oqSetZayavka.SetVariable('fd_dover_date', FD_DATE_NOW);
      frmZayavEdit.oqSetZayavka.SetVariable('fc_comment', '' );
      frmZayavEdit.oqSetZayavka.Execute;
      aFK_ZayavID :=  frmZayavEdit.oqSetZayavka.GetVariable('FK_ZAYAVID');
      FIsNewDoc := True;
    end;


    frmZayavEdit.bCanEdit := aCanEdit or FIsNewDoc;
    frmZayavEdit.ID_ZAYAV    := aFK_ZayavID;
    if frmZayavEdit.odsZayavka.RecordCount <> 1 then Exit;

    // здесь уже работаем с существующим документом
    // заполняем поля при открытии существующего документа
    frmZayavEdit.deInvoiceDate.Date     := frmZayavEdit.odsZayavka.FieldByName('fd_invoice').AsDateTime;
    if FIsNewDoc then
      frmZayavEdit.edZayavNum.Text      := IntToStr(aFK_ZayavID)
    else
      frmZayavEdit.edZayavNum.Text      := frmZayavEdit.odsZayavka.FieldByName('fc_zayav_num').AsString;
    frmZayavEdit.deRegistrDate.Date     := frmZayavEdit.odsZayavka.FieldByName('fd_create').AsDateTime;
    frmZayavEdit.lcbPostav.EditValue    := frmZayavEdit.odsZayavka.FieldByName('fk_postavid').AsInteger;
    frmZayavEdit.lcb_MO_SOST.EditValue  := frmZayavEdit.odsZayavka.FieldByName('fk_mo_zayav').AsInteger;
    frmZayavEdit.LCB_MO_GET.EditValue   := frmZayavEdit.odsZayavka.FieldByName('fk_mo_get').AsInteger;
    frmZayavEdit.edDov_Num.Text         := frmZayavEdit.odsZayavka.FieldByName('fc_dover_num').AsString;
    frmZayavEdit.deDov_Date.EditValue   := frmZayavEdit.odsZayavka.FieldByName('fd_dover_date').AsDateTime;
    frmZayavEdit.mComment.Text          := frmZayavEdit.odsZayavka.FieldByName('fc_comment').AsString;

    frmZayavEdit.EnableInput( frmZayavEdit.bCanEdit );

//------------------------------------------------------------------------------
    Result := frmZayavEdit.ShowModal;
    if Result = mrOk then
    begin
      frmZayavEdit.oqSetZayavka.SetVariable('FK_ZAYAVID',   frmZayavEdit.ID_ZAYAV);
      frmZayavEdit.oqSetZayavka.SetVariable('fd_invoice',   frmZayavEdit.deInvoiceDate.Date);
      frmZayavEdit.oqSetZayavka.SetVariable('fc_zayav_num', frmZayavEdit.edZayavNum.Text);
      frmZayavEdit.oqSetZayavka.SetVariable('fd_create',    frmZayavEdit.deRegistrDate.Date);
      frmZayavEdit.oqSetZayavka.SetVariable('fk_postavid',  frmZayavEdit.lcbPostav.EditValue);
      frmZayavEdit.oqSetZayavka.SetVariable('fk_mo_zayav',  frmZayavEdit.lcb_MO_SOST.EditValue);
      frmZayavEdit.oqSetZayavka.SetVariable('fk_mo_get',    frmZayavEdit.LCB_MO_GET.EditValue);
      frmZayavEdit.oqSetZayavka.SetVariable('fc_dover_num', frmZayavEdit.edDov_Num.Text);
      frmZayavEdit.oqSetZayavka.SetVariable('fd_dover_date',frmZayavEdit.deDov_Date.EditValue);
      frmZayavEdit.oqSetZayavka.SetVariable('fc_comment',   frmZayavEdit.mComment.Text);
      frmZayavEdit.oqSetZayavka.Execute;
    end;

  finally
    FreeAndNil(frmZayavEdit);
  end;
end;
// Сохранить
procedure TfrmZayavEdit.actSaveExecute(Sender: TObject);
begin
  if edZayavNum.Text = '' then
  begin
    Application.MessageBox('Необходимо ввести номер заявки!', 'Ошибка', MB_OK + mb_iconerror);
    edZayavNum.SetFocus;
    exit;
  end;
  if deInvoiceDate.EditValue = Null then
  begin
    Application.MessageBox('Необходимо ввести правильную дату документа!', 'Ошибка', MB_OK + mb_iconerror);
    deInvoiceDate.SetFocus;
    exit;
  end;
  if deRegistrDate.EditValue = Null then
  begin
    Application.MessageBox('Необходимо ввести правильную дату регистрации документа!', 'Ошибка', MB_OK + mb_iconerror);
    deRegistrDate.SetFocus;
    exit;
  end;
  if lcbPostav.Text = '' then
  begin
    Application.MessageBox('Необходимо выбрать поставщика (аптеку)!', 'Ошибка', MB_OK + mb_iconerror);
    lcbPostav.SetFocus;
    exit;
  end;
  if lcb_MO_SOST.Text = '' then
  begin
    Application.MessageBox('Необходимо выбрать составителя заявки!', 'Ошибка', MB_OK + mb_iconerror);
    lcb_MO_SOST.SetFocus;
    exit;
  end;
  if LCB_MO_GET.Text = '' then
  begin
    Application.MessageBox('Необходимо выбрать получателя медикаментов заявки!', 'Ошибка', MB_OK + mb_iconerror);
    LCB_MO_GET.SetFocus;
    exit;
  end;
  if edDov_Num.Text = '' then
  begin
    Application.MessageBox('Необходимо ввести номер доверенности!', 'Ошибка', MB_OK + mb_iconerror);
    edDov_Num.SetFocus;
    exit;
  end;
  if deDov_Date.EditValue = Null then
  begin
    Application.MessageBox('Необходимо ввести правильную дату доверенности!', 'Ошибка', MB_OK + mb_iconerror);
    deDov_Date.SetFocus;
    exit;
  end;

  if (mComment.Enabled)and(mComment.Visible) then mComment.SetFocus;
  if odsZayav_DPC.State = dsEdit then odsZayav_DPC.Post;

  ModalResult := mrOk;
end;

procedure TfrmZayavEdit.acescExecute(Sender: TObject);
begin
  ModalResult := mrcancel;
end;

procedure TfrmZayavEdit.actAddExecute(Sender: TObject);
var
  nMedicId : Integer;
  fk_zayav_dpc : integer;
  isNewMedicPresent : Boolean;

begin
  nMedicId := 0;
  nMedicId := DoShowMedic(nMedicId);
  if nMedicId <= 0 then Exit; // просто выходим если не выбрали медикамент Воронов О.А. 13.08.2007

  try
    if odsZayav_DPC.State = dsEdit then odsZayav_DPC.Post;
    grZayav_DPCDBTableView1.DataController.PostEditingData;
  finally
    //проверяем наличие медикамента в заявке
    odsZayav_DPC.DisableControls;
    odsZayav_DPC.First;
    while (not odsZayav_DPC.Eof)and(odsZayav_DPC.FieldByName('FK_MEDIC').AsInteger <> nMedicId) do
      odsZayav_DPC.Next;
    isNewMedicPresent := (not odsZayav_DPC.Eof)and(odsZayav_DPC.FieldByName('FK_MEDIC').AsInteger = nMedicId);
    odsZayav_DPC.EnableControls;

    if isNewMedicPresent then
    begin
      fk_zayav_dpc := odsZayav_DPC.FieldByName('fk_zayavka_dpc_id').AsInteger;
      Application.MessageBox(PChar('Заявка уже содержит медикамент "' +odsZayav_DPC.FieldByName('FC_MEDIC_NAME').AsString+ '"'), 'Внимание', MB_OK+MB_ICONWARNING);
    end
    else
    begin
      if (mComment.Enabled)and(mComment.Visible) then mComment.SetFocus;
      oqSetZayavka_DPC.SetVariable('fk_zayavka', ID_ZAYAV);
      oqSetZayavka_DPC.SetVariable('fk_zayavka_dpc_id', -1);
      oqSetZayavka_DPC.SetVariable('fk_medic', nMedicId);
      oqSetZayavka_DPC.SetVariable('fn_kol', 0);
      oqSetZayavka_DPC.Execute;
      fk_zayav_dpc := oqSetZayavka_DPC.GetVariable('fk_zayavka_dpc_id');
      acrefresh.Execute;
    end;
    odsZayav_DPC.Locate('fk_zayavka_dpc_id', fk_zayav_dpc, []);

    // выставляем фокус на столбце "Кол-во"
    grZayav_DPC.SetFocus;
    grZayav_DPCDBTableView1_FN_KOL.Selected := True;
  end;  
end;

procedure TfrmZayavEdit.aceditExecute(Sender: TObject);
var
  nMedicId, fk_zayav_dpc: integer;
  fn_kol : Double;
begin
  nMedicId := 0;
  nMedicId := DoShowMedic(nMedicId);
  if nMedicId <= 0 then Exit; // просто выходим если не выбрали медикамент Воронов О.А. 13.08.2007
  
  //проверяем наличие медикамента в заявке
  fk_zayav_dpc := odsZayav_DPC.FieldByName('fk_zayavka_dpc_id').AsInteger;
  fn_kol       := odsZayav_DPC.FieldByName('fn_kol').AsFloat;
  odsZayav_DPC.DisableControls;
  odsZayav_DPC.Filter := 'FK_MEDIC = '+IntToStr(nMedicId);
  odsZayav_DPC.Filtered := True;
  if odsZayav_DPC.RecordCount > 0 then
  begin
    if Application.MessageBox( PChar('Заявка уже содержит медикамент "' +odsZayav_DPC.FieldByName('FC_MEDIC_NAME').AsString+ '"'#13#10'Хотите объединить кол-во текущей позиции с найденной?'),
                                      'Внимание', MB_YESNO+MB_ICONWARNING) = IDYES then
    begin
      oqSetZayavka_DPC.SetVariable('fk_zayavka', ID_ZAYAV);
      oqSetZayavka_DPC.SetVariable('fk_zayavka_dpc_id', fk_zayav_dpc);
      oqSetZayavka_DPC.SetVariable('fk_medic', nMedicId);
      oqSetZayavka_DPC.SetVariable('fn_kol', fn_kol + odsZayav_DPC.FieldByName('fn_kol').AsFloat);
      oqSetZayavka_DPC.Execute; // объединяем кол-во

      oqDelZayavka_DPC.SetVariable('fk_zayavka_dpc_id', odsZayav_DPC.FieldByName('fk_zayavka_dpc_id').AsInteger);
      oqDelZayavka_DPC.Execute; // удалем найденную одинаковую позицию
    end;
  end
  else
  begin
    oqSetZayavka_DPC.SetVariable('fk_zayavka', ID_ZAYAV);
    oqSetZayavka_DPC.SetVariable('fk_zayavka_dpc_id', fk_zayav_dpc);
    oqSetZayavka_DPC.SetVariable('fk_medic', nMedicId);
    oqSetZayavka_DPC.SetVariable('fn_kol', fn_kol);
    oqSetZayavka_DPC.Execute;
    fk_zayav_dpc := oqSetZayavka_DPC.GetVariable('fk_zayavka_dpc_id');
    acrefresh.Execute;
  end;
  odsZayav_DPC.Filtered := False;
  odsZayav_DPC.Filter := '';
  odsZayav_DPC.EnableControls;
  odsZayav_DPC.Locate('fk_zayavka_dpc_id', fk_zayav_dpc, []);

  // выставляем фокус на столбце "Кол-во"
  grZayav_DPC.SetFocus;
  grZayav_DPCDBTableView1_FN_KOL.Selected := True;
end;

procedure TfrmZayavEdit.actDeleteExecute(Sender: TObject);
begin
  if Application.MessageBox( PChar('Вы действительно хотите удалить "' + odsZayav_DPC.FieldByName('FC_MEDIC_NAME').AsString +
    '" из заявки?'), 'Предупреждение', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes
  then
  begin
    oqDelZayavka_DPC.SetVariable('fk_zayavka_dpc_id', odsZayav_DPC.FieldByName('fk_zayavka_dpc_id').AsInteger);
    oqDelZayavka_DPC.Execute;
    acrefresh.Execute;
  end;
end;

function TfrmZayavEdit.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
	Result := False;
  try
    // TODo Подумать насчет праметра  Command
    if Data = -1 then
      HtmlHelp(0, PChar('Medica.chm'), HH_DISPLAY_TOPIC, 0)
    else
      HtmlHelp(0, PChar('Medica.chm'), HH_HELP_CONTEXT, Data);
    CallHelp := False;
    Result := True;
  except
    on EConvertError do
      ShowMessage('Справка не найдена');
  end;
end;

procedure TfrmZayavEdit.EnableInput(const aEnabled : Boolean );
begin
  deInvoiceDate.Enabled  := aEnabled;
  edZayavNum.Enabled     := aEnabled;
  deRegistrDate.Enabled  := aEnabled;
  lcbPostav.Enabled      := aEnabled;
  lcb_MO_SOST.Enabled    := aEnabled;
  LCB_MO_GET.Enabled     := aEnabled;
  edDov_Num.Enabled      := aEnabled;
  deDov_Date.Enabled     := aEnabled;
  mComment.Enabled       := aEnabled;

	actAdd.Enabled    := aEnabled;
  acedit.Enabled    := aEnabled;
  actDelete.Enabled := aEnabled;
	actSave.Enabled   := aEnabled;
  odsZayav_DPCAfterOpen(nil);
end;

procedure TfrmZayavEdit.grZayav_DPCDBTableView1DblClick(Sender: TObject);
begin
  acedit.Execute;
end;

procedure TfrmZayavEdit.odsZayav_DPCAfterOpen(DataSet: TDataSet);
begin
  acedit.Enabled    := odsZayav_DPC.RecordCount > 0;
  actDelete.Enabled := odsZayav_DPC.RecordCount > 0;
end;

procedure TfrmZayavEdit.Set_ID_ZAYAV(const Value: Integer);
begin
  FID_ZAYAV := Value;
  odsZayavka.Close;
  odsZayavka.SetVariable('fk_zayavid', FID_ZAYAV);
  odsZayavka.Open;

  odsZayav_DPC.Close;
  odsZayav_DPC.SetVariable('FK_ZAYAVKA', FID_ZAYAV);
  odsZayav_DPC.Open;
  odsZayav_DPC.First;  
end;

procedure TfrmZayavEdit.FormCreate(Sender: TObject);
begin
  FID_ZAYAV := -1;

// автоматически определяем длину ограничения на поле Воронов О.А. 25.08.2008
  mComment.MaxLength := dmMain.GetFieldLength('med', 'TZAYAVKA', 'fc_comment');
  edZayavNum.MaxLength := dmMain.GetFieldLength('med', 'TZAYAVKA', 'FC_ZAYAV_NUM');
  edDov_Num.MaxLength := dmMain.GetFieldLength('med', 'TZAYAVKA', 'FC_DOVER_NUM');
end;

procedure TfrmZayavEdit.acrefreshExecute(Sender: TObject);
begin
  odsZayav_DPC.Close;
  odsZayav_DPC.Open;  
end;

procedure TfrmZayavEdit.alUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  actSave.Enabled := (edZayavNum.Text <> '') and (deInvoiceDate.EditValue <> Null)and(deRegistrDate.EditValue <> Null)and
                     (edDov_Num.Text <> '') and (deDov_Date.EditValue <> Null) and
                     (lcbPostav.Text <> '') and (lcb_MO_SOST.Text <> '') and (LCB_MO_GET.Text <> '');
end;

end.


