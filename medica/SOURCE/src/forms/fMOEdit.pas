unit fMOEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, JvFormPlacement, StdCtrls, Mask, JvToolEdit,
  ExtCtrls, Oracle, OracleData, JvComponentBase, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxGraphics, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dxSkinsCore,
  dxSkinsDefaultPainters;

type
  TfrmMOEdit = class(TForm)
    FormStorage: TJvFormStorage;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    al: TActionList;
    acSave: TAction;
    acAdd: TAction;
    acCancel: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    edCRM: TCheckBox;
    laSklad: TLabel;
    cbRoot: TCheckBox;
    Label3: TLabel;
    cbTreb: TCheckBox;
    cbAllGroups: TCheckBox;
    edName: TcxButtonEdit;
    cedUchgrType: TcxButtonEdit;
    lcbSklad: TcxLookupComboBox;
    oqUpdateFK_Sklad_ID: TOracleQuery;
    procedure acSaveExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure cbRootClick(Sender: TObject);
    procedure edNameButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure cedUchgrTypeButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edNameDblClick(Sender: TObject);
    procedure cedUchgrTypeDblClick(Sender: TObject);
    procedure cbAllGroupsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    odsTmp: TOracleDataSet;
    FnID: Integer;
    procedure SetnID(const Value: Integer);
    function get_mo_uchgrtype_lst: string;
    { Private declarations }
  public
    { Public declarations }
    function DoSave: boolean;
    property nID: Integer read FnID write SetnID;
  end;

function DoShowMOEdit(pID: Integer; aOds: TOracleDataSet): TModalResult;


implementation

uses fmainform, fdmMain, {fMoUchgrTypeEdit,} JvDBUtils, fSelectSotr;

{$R *.DFM}

{********************************************************************************************************}
{        DoShowMOEdit
{********************************************************************************************************}

function DoShowMOEdit(pID: Integer; aOds: TOracleDataSet): TModalResult;
var
  frmMOEdit: TfrmMOEdit;
begin
  frmMOEdit := TfrmMOEdit.Create(nil);
  try
    frmMOEdit.odsTmp := aOds;
    frmMOEdit.nID := pId;

    Result := frmMOEdit.ShowModal;
  finally
    frmMOEdit.free;
  end;
end;
{********************************************************************************************************}
{        TfrmMOEdit.acSaveExecute
{********************************************************************************************************}

procedure TfrmMOEdit.acSaveExecute(Sender: TObject);
begin
  if DoSave then
    ModalResult := mrOk;
end;

procedure TfrmMOEdit.SetnID(const Value: Integer);
var
  sName: string;
  iCrm: Integer;
  iSotrid: Double;
  oq: TOracleQuery;
  iTreb: Integer;
//  FN_GROUP: integer; убрал здесь хинт Воронов О.А.
begin
  FnID := Value;
  if FnID = -1 then
  begin
    edName.Text := '';
    edName.Tag := -1;
    edCRM.Checked := False;
    cedUchgrType.Text := '';
    cbTreb.Checked := False;

    lcbSklad.EditValue := dmMain.CurMO_SKLAD_ID;

    Caption := 'Добавление МО - [В подчинении: "' + odsTmp.FieldByName('FC_NAME').AsString + '"]';
    oq := TOracleQuery.Create(nil);
    try
      oq.Session := dmMain.os;
      oq.Sql.Text := 'SELECT MED.SEQ_TMO.NEXTVAL FROM DUAL';
      oq.Execute;
      FnId := oq.FieldAsInteger(0);
      try
        oq.Sql.Text := 'INSERT INTO MED.TMO (MOID, FK_PARENT) VALUES(:MOID, :FK_PARENT)';
        oq.DeclareAndSet('MOID', otInteger, FnID);
        oq.DeclareAndSet('FK_PARENT', otInteger, odsTmp.FieldByName('MOID').AsInteger);
        oq.Execute;
      except
      end;
    finally
      oq.Free;
    end;
  end
  else
  begin
    if dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1 then
    begin
      dmMain.oqGetFK_Sklad_ID_BY_MOID.SetVariable('PMOID', FnID);
      dmMain.oqGetFK_Sklad_ID_BY_MOID.Execute;
      lcbSklad.EditValue :=  dmMain.oqGetFK_Sklad_ID_BY_MOID.GetVariable('PFK_SKLAD_ID');
    end;  
    dmMain.pkgMO.SEL(FnID, sName, iCrm, iSotrid, iTreb);
    edName.Text := sName;
    edName.Tag := fdmMain.nvl(iSotrid, -1);
    edCRM.Checked := Integer(iCrm) = 1;
    cbTreb.Checked := Integer(iTreb) = 1;
    cedUchgrType.Text := get_mo_uchgrtype_lst;
  end;
//  edName.ReadOnly := edName.Tag > -1;
  cbAllGroups.Checked := Boolean(dmMain.pkgMO.IsVeiwAll(FnID));
  cedUchgrType.Enabled := not cbAllGroups.Checked;
end;

procedure TfrmMOEdit.acAddExecute(Sender: TObject);
begin
  DoSave;
  odsTmp.Close;
  odsTmp.Open;  
  nID := -1;
end;

procedure TfrmMOEdit.acCancelExecute(Sender: TObject);
begin
  dmMain.os.Rollback;
  ModalResult := mrCancel;
end;

function TfrmMOEdit.DoSave: boolean;
var
  iParent: Double;
  Id: Double;
begin
  if edName.Text = '' then begin
    windows.MessageBox(Handle, 'Необходимо ввести название мат. ответственного!', 'Ошибка',
      MB_OK + MB_ICONERROR);
    edName.SetFocus;
    result := FALSE;
    Exit;
  end;

  lcbSklad.PostEditValue;

  if (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1) and (lcbSklad.EditValue <= 0) then begin
    windows.MessageBox(Handle, 'Необходимо указать склад!', 'Ошибка',
      MB_OK + MB_ICONERROR);
    lcbSklad.SetFocus;
    result := FALSE;
    Exit;
  end;

  if cbRoot.Checked then
    iParent := 0
  else begin
    if FnID = -1 then
      iParent := odsTmp.FieldByName('MOID').AsInteger
    else
      iParent := -1;
  end;
  id := dmMain.pkgMO.DOSET(
    FnID,
    edName.Text,
    Integer(edCRM.Checked),
    iParent,
    edName.Tag,
    Integer(cbTreb.Checked)
    );

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1 then
  begin
    lcbSklad.PostEditValue;

    oqUpdateFK_Sklad_ID.SetVariable('pMOID', id);
    oqUpdateFK_Sklad_ID.SetVariable('PFK_SKLAD_ID', lcbSklad.EditValue);
    oqUpdateFK_Sklad_ID.Execute;
  end;

  dmMain.os.Commit;
  odsTmp.Locate('MOID', id, []);
  Result := TRUE;
// на всякий случай обновляем статус провизора, вдруг изменили текущего юзера 
  frmMain.ProvisorState := dmMain.pkgMO.IsMOProvisor( dmMain.pkgMedSes.GETCURMO );
end;

function TfrmMOEdit.get_mo_uchgrtype_lst: string;
var ods: TOracleDataset;
begin
  ods := TOracleDataset.Create(nil);
  try
    ods.Session := dmMain.os;
    ods.sql.text := 'SELECT MED.GET_MO_UCHGRTYPE_LST(:MOID) AS LST FROM DUAL';
    ods.DeclareVariable('MOID', otInteger);
    ods.SetVariable('MOID', FnID);
    try
      ods.Open;
    except
    end;
    Result := ods.FieldbyName('LST').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmMOEdit.cbRootClick(Sender: TObject);
begin
  if TCheckBox(Sender).Checked then
    Caption := 'Добавление МО'
  else
    Caption := 'Добавление МО - [В подчинении: "' + odsTmp.FieldByName('FC_NAME').AsString + '"]'
end;

procedure TfrmMOEdit.edNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var frmSelectSotr: TfrmSelectSotr;
begin
  frmSelectSotr := TfrmSelectSotr.Create(nil);
  try
    if edName.Tag > -1 then
      frmSelectSotr.SotrId := edName.Tag;

    if frmSelectSotr.ShowModal = mrOk then
    begin
      edName.Tag := frmSelectSotr.odsSotr.FieldByName('FK_SOTRID').AsInteger;
//      edName.ReadOnly := edName.Tag > -1;

      edName.Text := frmSelectSotr.odsSotr.FieldByName('FC_NAME').AsString;
      Label3.Visible := True;
    end;
  finally
    frmSelectSotr.Free;
  end;
end;

procedure TfrmMOEdit.cedUchgrTypeButtonClick(Sender: TObject; AbsoluteIndex: Integer);
begin
//  if DoShowUchGrEdit(nID) = mrOk then begin
//    cedUchgrType.Text := get_mo_uchgrtype_lst;
//    cbAllGroups.Checked := Boolean(dmMain.pkgMO.IsVeiwAll(FnID));
//  end;
end;

procedure TfrmMOEdit.edNameDblClick(Sender: TObject);
begin
  edNameButtonClick(Sender, 0);
end;

procedure TfrmMOEdit.cedUchgrTypeDblClick(Sender: TObject);
begin
  cedUchgrTypeButtonClick(Sender, 0);
end;

procedure TfrmMOEdit.cbAllGroupsClick(Sender: TObject);
begin
  if cbAllGroups.Checked then begin
    dmMain.pkgMO.SetViewAllGroups(FnID);
    cedUchgrType.Enabled := False;
  end
  else begin
    dmMain.pkgMO.DropViewAllGroups(FnID);
    cedUchgrType.Enabled := True;
  end;
  cedUchgrType.Text := get_mo_uchgrtype_lst;
end;

procedure TfrmMOEdit.FormCreate(Sender: TObject);
begin
  edName.Properties.MaxLength := dmMain.GetFieldLength('med', 'tmo', 'FC_NAME');
  laSklad.Visible  := (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1);
  lcbSklad.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1);
end;

end.

