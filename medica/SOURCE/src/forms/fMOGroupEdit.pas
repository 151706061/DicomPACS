unit fMOGroupEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxControls, cxInplaceContainer, cxVGrid, cxDBVGrid, DB, OracleData, ActnList, cxDBLookupComboBox,
  cxCheckBox, cxTextEdit, cxButtonEdit, ComCtrls, ToolWin, cxSpinEdit, Oracle;

type
  TfrmMOGroupEdit = class(TForm)
    grdMOGroupEdit: TcxDBVerticalGrid;
    al: TActionList;
    odsMOGroupEdit: TOracleDataSet;
    grdMOGroupEditDBEditorGROUPID: TcxDBEditorRow;
    grdMOGroupEditDBEditorFC_GROUP: TcxDBEditorRow;
    grdMOGroupEditDBEditorFK_SKLAD_ID: TcxDBEditorRow;
    grdMOGroupEditDBEditorFL_POST: TcxDBEditorRow;
    dsMOGroupEdit: TDataSource;
    acRefresh: TAction;
    acSave: TAction;
    grdMOGroupEditDBEditorFC_QUOTA_CODE_1: TcxDBEditorRow;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    odsMOGroupEditGROUPID: TFloatField;
    odsMOGroupEditFC_GROUP: TStringField;
    odsMOGroupEditFL_DEL: TFloatField;
    odsMOGroupEditFK_SKLAD_ID: TFloatField;
    odsMOGroupEditFC_QUOTA_CODE_1: TStringField;
    odsMOGroupEditFL_POST: TFloatField;
    odsMOGroupEditFK_PARENTID: TFloatField;
    grdMOGroupEditDBEditorlFC_PARENT: TcxDBEditorRow;
    odsMOGRoups: TOracleDataSet;
    dsMOGRoups: TDataSource;
    odsMOGroupEditlFC_PARENT: TStringField;
    oqSetQUOTA_MOGr: TOracleQuery;
    procedure acRefreshExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acSaveExecute(Sender: TObject);
    procedure alUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure grdMOGroupEditDBEditorlFC_PARENTEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure odsMOGroupEditBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    fGroupId : Integer;
    procedure SetFormCaption;
    function CheckOk : Boolean;
    procedure SetQuotaCodeToKarts ( ANewQuota, AOldQuota : string ) ;
  public
    { Public declarations }
    constructor Create ( AOwner : TComponent; AMOGroupId : Integer ); overload;
  end;

function DoMoGroupEdit ( AOwner : TComponent; AMOGroupId : Integer ) : Boolean;
function DoMoGroupAdd ( AOwner : TComponent;  AMOParentGroupId : Integer = -1 ) : Integer;

implementation

uses fdmMain, fMOGroup;

const
  cEmptyFieldData = 'Не заполнено обязательное поле: %s';

{$R *.dfm}

function DoMoGroupAdd ( AOwner : TComponent;  AMOParentGroupId : Integer = -1 ) : Integer;
var
  NewId : Integer;   
begin
  Result := -1;

  try
    NewId := dmMain.pkgMO.DoInsertMOGroup( AMOParentGroupId );
  except
    on e : Exception do
    begin
      Result := -1;
      Application.MessageBox( PAnsiChar(e.Message), MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
      Exit;
    end;
  end;

  // открываем
  if DoMoGroupEdit( AOwner, NewId ) then
    Result := NewId;
end;

function DoMoGroupEdit ( AOwner : TComponent; AMOGroupId : Integer ) : Boolean;
var
  frmMOGroupEdit : TfrmMOGroupEdit;
begin
  frmMOGroupEdit := TfrmMOGroupEdit.Create( AOwner, AMOGroupId );
  Result := frmMOGroupEdit.ShowModal = mrOk;
end;

procedure TfrmMOGroupEdit.acRefreshExecute(Sender: TObject);
begin    
  try
    odsMOGroupEdit.Close;
    odsMOGroupEdit.SetVariable( 'PGROUPID', fGroupId );
    odsMOGroupEdit.Open;
  except
    on e : Exception do
    begin
      Application.MessageBox( PAnsiChar( 'Ошибка при открытии датасета ' + odsMOGroupEdit.Name + '!'+ #13#10 + e.Message ),
        MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
      Exit;
    end;
  end;
  SetFormCaption;
end;

procedure TfrmMOGroupEdit.acSaveExecute(Sender: TObject);
begin
  if not CheckOk then
    Exit;

  SetQuotaCodeToKarts( VarToStr(grdMOGroupEditDBEditorFC_QUOTA_CODE_1.Properties.Value), VarToStr(odsMOGroupEdit.FieldByName('FC_QUOTA_CODE_1').OldValue) );

  if odsMOGroupEdit.State in dsEditModes then
    odsMOGroupEdit.Post;
  odsMOGroupEdit.Session.Commit;

  ModalResult := mrOk;
end;

procedure TfrmMOGroupEdit.alUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  acSave.Enabled := (odsMOGroupEdit.Session.InTransaction) or (odsMOGroupEdit.State in dsEditModes );
end;

function TfrmMOGroupEdit.CheckOk: Boolean;
begin
  Result := True;
  odsMOGroupEdit.FieldByName('FC_QUOTA_CODE_1').OldValue;
  grdMOGroupEditDBEditorFC_QUOTA_CODE_1.Properties.Value;

  grdMOGroupEdit.HideEdit;

  if Trim ( odsMOGroupEdit.FieldByName ( 'FC_GROUP' ).AsString ) = EmptyStr  then
  begin
    Result := False;
    Application.MessageBox( PAnsiChar(Format( cEmptyFieldData, [grdMOGroupEditDBEditorFC_GROUP.Properties.Caption] ) ),
      MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
    Exit;
  end;

  if dmMain.pkgMO.CHECKMOGROUPNAME( odsMOGroupEdit.FieldByName ( 'GROUPID' ).AsInteger,
     odsMOGroupEdit.FieldByName ( 'FC_GROUP' ).AsString ) > 0  then
  begin
    Result := False;
    Application.MessageBox( PAnsiChar('Группа наименованием "' + odsMOGroupEdit.FieldByName ( 'FC_GROUP' ).AsString + '" уже существует!'),
      MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
    Exit;
  end;   
end;

constructor TfrmMOGroupEdit.Create(AOwner: TComponent; AMOGroupId: Integer);
begin
  fGroupId := AMOGroupId;

  inherited Create ( AOwner );
end;

procedure TfrmMOGroupEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
  Action := caFree;
end;

procedure TfrmMOGroupEdit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (odsMOGroupEdit.Session.InTransaction) or (odsMOGroupEdit.State in dsEditModes )  then
  case Application.MessageBox ( 'Сохранить изменения?', MSG_CAPTION_ATTENTION, MB_YESNOCANCEL + MB_ICONQUESTION )  of
    mrYes : acSave.Execute;
    mrNo : odsMOGroupEdit.Session.Rollback;
    mrCancel : CanClose := False;
  end;
end;

procedure TfrmMOGroupEdit.FormShow(Sender: TObject);
begin
  grdMOGroupEditDBEditorFK_SKLAD_ID.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1);
  grdMOGroupEditDBEditorFC_QUOTA_CODE_1.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 1);
  grdMOGroupEditDBEditorFL_POST.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_MOGROUP_FL_POST', 0) = 1);

  acRefresh.Execute;

  try
    odsMOGRoups.Close;
    odsMOGRoups.Open;
  finally
  end;
end;

procedure TfrmMOGroupEdit.grdMOGroupEditDBEditorlFC_PARENTEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  SelMOGroupRec : TMOGroupRec;
begin
  case AButtonIndex of
  0 : // выбор группы
  begin
    if DoSelectMoGroup( Self, SelMOGroupRec, fdmMain.nvl (odsMOGroupEdit.FieldByName('FK_PARENTID').AsVariant, -1),
      False, odsMOGroupEdit.FieldByName('GROUPID').AsInteger ) > 0 then
    begin
      odsMOGroupEdit.Edit;
      odsMOGroupEdit.FieldByName( 'FK_PARENTID' ).AsInteger := SelMOGroupRec.GROUPID;
    end;
  end;

  1 : // очистка группы
  begin
    if not odsMOGroupEdit.FieldByName( 'FK_PARENTID' ).IsNull then
    begin
      odsMOGroupEdit.Edit;
      odsMOGroupEdit.FieldByName( 'FK_PARENTID' ).AsVariant := Null;
    end;
  end;
  end;
end;

procedure TfrmMOGroupEdit.odsMOGroupEditBeforePost(DataSet: TDataSet);
begin
  odsMOGroupEdit.FieldByName ( 'FC_GROUP' ).AsString := Trim (odsMOGroupEdit.FieldByName ( 'FC_GROUP' ).AsString);
end;

procedure TfrmMOGroupEdit.SetFormCaption;
begin
  if (odsMOGroupEdit.Active) and (not odsMOGroupEdit.IsEmpty)   then
  begin
    if (Trim (odsMOGroupEdit.FieldByName( 'FC_GROUP').AsString) <> EmptyStr)  then
      Self.Caption := 'Редактирование группы "' + odsMOGroupEdit.FieldByName( 'FC_GROUP').AsString + '"'
    else
      Self.Caption := 'Добавление группы';
  end;
end;

// обновление кода квоты в партиях
procedure TfrmMOGroupEdit.SetQuotaCodeToKarts ( ANewQuota, AOldQuota : string )  ;
var
  NewQuota, OldQuota : string;
begin
  NewQuota := Trim( ANewQuota );
  OldQuota := Trim( AOldQuota );

  if (grdMOGroupEditDBEditorFC_QUOTA_CODE_1.Visible) and
     ( NewQuota <> EmptyStr ) and ( OldQuota <> EmptyStr ) and
     ( AnsiCompareStr( NewQuota, OldQuota ) <> 0 )   then
  begin
    if Application.MessageBox(PAnsiChar('Код квоты для отделения был изменен. Обновить его во всех партиях?'), 'Внимание', MB_YESNO+MB_ICONQUESTION ) = IDYES then
    with oqSetQUOTA_MOGr do
    try
      SetVariable('FC_OLD_QUOTA_MOGR', OldQuota);
      SetVariable('FC_NEW_QUOTA_MOGR', NewQuota);
      Execute;
      ShowMessage('Код квоты был успешно обновлен.' + #13#10 +
        'Обновлено партий: '+IntToStr(oqSetQUOTA_MOGr.GetVariable('FN_TKART_MOGR')) + #13#10 +
        'Нажмите "Сохранить" для подтверждения.');
    except
      on e : Exception do
      begin
        Application.MessageBox( PAnsiChar( 'Ошибка при обновлении кода квоты в партиях!' + #13#10 + e.Message ), MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
        Exit;
      end
    end;
  end;  
end;

end.
