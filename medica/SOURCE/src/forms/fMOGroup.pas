unit fMOGroup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ActnList, Db, OracleData,
  Oracle, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxMaskEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGridLevel, cxGrid, cxDBLookupComboBox,
  cxTextEdit, cxCheckBox, JvComponentBase, JvFormPlacement, Menus, cxTL, cxInplaceContainer, cxDBTL, cxTLData;

type
  TMOGroupRec = packed record
    GROUPID : Integer;
    FC_GROUP : string;
    FK_SKLAD_ID : Integer;
    FC_QUOTA_CODE_1 : string;
    FL_POST : Boolean;
    FL_DEL : Boolean;
    FK_PARENTID : Integer;
  end;
  PMOGroupRec = ^TMOGroupRec;

  TfrmMOGroup = class(TForm)
    al: TActionList;
    acClose: TAction;
    acDel: TAction;
    acEdit: TAction;
    acAdd: TAction;
    acRefresh: TAction;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton7: TToolButton;
    ToolButton5: TToolButton;
    dsMO: TDataSource;
    odsMO: TOracleDataSet;
    aSelect: TAction;
    aCancel: TAction;
    btnClose: TToolButton;
    JvFormStorage1: TJvFormStorage;
    btnSelect: TToolButton;
    pmAdd: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    pmTreeList: TPopupMenu;
    miAdd: TMenuItem;
    miAddChild: TMenuItem;
    miEdit: TMenuItem;
    miDelete: TMenuItem;
    acAddChild: TAction;
    tlMOGroup: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListGROUPID: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListFC_GROUP: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListFK_SKLAD_ID: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListFC_QUOTA_CODE_1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListFL_POST: TcxDBTreeListColumn;
    tlMOGroupcxDBTreeListFL_DEL: TcxDBTreeListColumn;
    tlMOGroupcxDBTreeListFK_PARENTID: TcxDBTreeListColumn;
    procedure acCloseExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acDelExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure aSelectExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure alUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure tlMOGroupCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
    procedure tlMOGroupDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure tlMOGroupDblClick(Sender: TObject);
  private
    { Private declarations }
    fCurMOGroupId : integer; // текщая позиция
    fExcludeId : integer; // позция, которую надо исключить из выборки вместе со всеми ее потомками
    fIsForSelect : Boolean;
    fIsShowDeleted : Boolean;
  public
    { Public declarations }
    function ShowMOGroupForm: Boolean;
    constructor Create ( AOwner : TComponent; aCurMoGroupID : integer = -1; AIsSelect : Boolean = False;
      AIsShowDeleted : Boolean = False; AExcludeId : integer = -1 ) ; overload;
  end;
// просмотр и редактирование справочника
procedure DoShowMOGroups ();

// выбор группы из справочника
function DoSelectMoGroup ( AOwner : TComponent;  out AMOGroupRec : TMOGroupRec; aCurMoGroupID : integer = -1;
  AIsShowDeleted : Boolean = False; AExcludeId : integer = -1 ) : Integer;

var
  frmMOGroup: TfrmMOGroup;

implementation

uses fdmMain, fMainForm, fMOGroupEdit, Variants;
{$R *.DFM}

procedure DoShowMOGroups ();
begin
  if not frmMain.RestoreMDI_Window('frmMOGroup') then
  begin
    frmMOGroup := TfrmMOGroup.Create (Application, -1, False, True);
    frmMOGroup.FormStyle := fsMDIChild;
//    frmMOGroup.DragMode := Controls.dmAutomatic;
  end;
end;

function DoSelectMoGroup ( AOwner : TComponent; out AMOGroupRec : TMOGroupRec; aCurMoGroupID : integer = -1;
  AIsShowDeleted : Boolean = False; AExcludeId : integer = -1 ): Integer;
var
  frmMOGroupSel : TfrmMOGroup;
begin
  Result := -1;
  AMOGroupRec.GROUPID := -1;

  frmMOGroupSel := TfrmMOGroup.Create (Application, aCurMoGroupID, True, AIsShowDeleted, AExcludeId );
  try
    frmMOGroupSel.FormStyle := fsNormal;
    //frmMOGroupSel.DragMode := Controls.dmManual;
    if frmMOGroupSel.ShowModal = mrOk then
    begin
      Result := frmMOGroupSel.tlMOGroup.DataController.DataSet.FieldByName( 'GROUPID' ).AsInteger;
      with AMOGroupRec do
      begin
        GROUPID := Result;
        FC_GROUP := frmMOGroupSel.tlMOGroup.DataController.DataSet.FieldByName( 'FC_GROUP' ).AsString;
        FK_SKLAD_ID := fdmMain.nvl(frmMOGroupSel.tlMOGroup.DataController.DataSet.FieldByName( 'FK_SKLAD_ID' ).AsVariant, -1);
        FC_QUOTA_CODE_1 := frmMOGroupSel.tlMOGroup.DataController.DataSet.FieldByName( 'FC_QUOTA_CODE_1' ).AsString;
        FL_POST := fdmMain.nvl(frmMOGroupSel.tlMOGroup.DataController.DataSet.FieldByName( 'FL_POST' ).AsVariant, 0 ) = 1 ;
        FL_DEL := fdmMain.nvl(frmMOGroupSel.tlMOGroup.DataController.DataSet.FieldByName( 'FL_DEL' ).AsVariant, 0 ) = 1 ;
        FK_PARENTID := fdmMain.nvl(frmMOGroupSel.tlMOGroup.DataController.DataSet.FieldByName( 'FK_PARENTID' ).AsVariant, -1);
      end;
    end;
  finally
    frmMOGroupSel.Free;
  end;


//  if aIsSelect then
//  begin
//    frmMOGroup := TfrmMOGroup.Create (Application, aCurMoGroupID, aIsSelect);
//    frmMOGroup.FormStyle := fsNormal;
//    if frmMOGroup.ShowModal = mrOk then
//      Result := frmMOGroup.fCurMOGroupId;
//  end
//  else
//  begin
//    Result := aCurMoGroupID;
//    if not frmMain.RestoreMDI_Window('frmMOGroup') then
//    begin
//      frmMOGroup := TfrmMOGroup.Create (Application, aCurMoGroupID, aIsSelect);
//      frmMOGroup.FormStyle := fsMDIChild;
//    end;
//  end;
end;

function TfrmMOGroup.ShowMOGroupForm: Boolean;
begin
  odsMO.Open;
  Result := ShowModal = mrOk;
end;

procedure TfrmMOGroup.tlMOGroupCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
  if not VarIsNull( AViewInfo.Node.Values [ tlMOGroupcxDBTreeListFL_DEL.ItemIndex ] ) and
     ( AViewInfo.Node.Values [ tlMOGroupcxDBTreeListFL_DEL.ItemIndex ] = 1 ) then
  begin
    ACanvas.Font.Style := [fsStrikeOut];
    ACanvas.Font.Color := clGrayText;
  end;                               
end;

procedure TfrmMOGroup.tlMOGroupDblClick(Sender: TObject);
begin
  if fIsForSelect then
    aSelect.Execute
  else
    acEdit.Execute;
end;

procedure TfrmMOGroup.tlMOGroupDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
  CurNode : TcxTreeListNode;
begin  // ХВАЛА разработчикам драг-н-дропа для TcxDBTreeList!! не надо никаких проверок, обработчиков писать :) 
  CurNode := tlMOGroup.GetNodeAt( x, y ) ;
  Accept := ( not fIsForSelect ) and ( Source = Sender ) and 
   ( CurNode <> nil ) and
   ( VarToStrDef ( CurNode.Values [ tlMOGroupcxDBTreeListFL_DEL.ItemIndex ], '0' ) = '0') ;
end;

procedure TfrmMOGroup.acCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMOGroup.acRefreshExecute(Sender: TObject);
var
  KeyFieldVal : Variant;
begin
  KeyFieldVal := Null;

  try
    tlMOGroup.BeginUpdate;

    with tlMOGroup.DataController do
    try
      if Assigned(DataSet) and (DataSet.Active) and (not DataSet.IsEmpty) then
        KeyFieldVal := GetKeyFieldsValues
      else
        KeyFieldVal := fCurMOGroupId;

      odsMO.Close;
      odsMO.SetVariable( 'pExcludeID', fExcludeId );
      if fIsShowDeleted then
        odsMO.SetVariable( 'pShowDeleted', 1 )
      else
        odsMO.SetVariable( 'pShowDeleted', 0 );      
      odsMO.Open;
    Except
      on e : Exception do
      begin
        Application.MessageBox( PAnsiChar('Ошибка при выборке данных с сервера!'+#13#10+ e.Message), 'Ошибка', MB_OK + MB_ICONERROR );
        Exit;
      end;
    end;
  finally
    tlMOGroup.EndUpdate;
    if not tlMOGroup.DataController.LocateByKey( KeyFieldVal )  then
      tlMOGroup.DataController.GotoFirst;
  end;
end;

procedure TfrmMOGroup.alUpdate(Action: TBasicAction; var Handled: Boolean);
var
  bActive, bNotEmpty : Boolean;
begin
  bActive := Assigned( tlMOGroup.DataController.DataSet ) and ( tlMOGroup.DataController.DataSet.Active );
  bNotEmpty := (bActive) and (not tlMOGroup.DataController.DataSet.IsEmpty) and Assigned( tlMOGroup.FocusedNode );

  acAdd.Visible := (not fIsForSelect);
  acAdd.Enabled := (not fIsForSelect) and (bActive);

  acEdit.Visible := (not fIsForSelect);
  acEdit.Enabled := (bNotEmpty) and ( tlMOGroup.DataController.DataSet.FieldByName('FL_DEL').AsString = '0' ) and (not fIsForSelect) ;

  acAddChild.Enabled := acEdit.Enabled;
  acAddChild.Visible := acEdit.Visible;  

  acDel.Enabled := (acEdit.Enabled) and ( not tlMOGroup.FocusedNode.HasChildren ) ;
  acDel.Visible := acEdit.Visible;

  aSelect.Enabled := (bNotEmpty) and (tlMOGroup.DataController.DataSet.FieldByName('FL_DEL').AsString = '0') and (fIsForSelect);
  aSelect.Visible := fIsForSelect;
  aCancel.Enabled := fIsForSelect;
end;

procedure TfrmMOGroup.acAddExecute(Sender: TObject);
var
  NewGroupId, ParentId : integer;
begin
  ParentId := -1;
  if ( Sender = acAddChild ) then
    ParentId := tlMOGroup.FocusedNode.Values [ cxDBTreeList1cxDBTreeListGROUPID.ItemIndex];

  NewGroupId := DoMoGroupAdd( Self, ParentId );

  if NewGroupId > 0 then
  begin
    acRefresh.Execute;
    tlMOGroup.DataController.LocateByKey( NewGroupId );
  end;
end;

procedure TfrmMOGroup.acDelExecute(Sender: TObject);
begin
  if ( Application.MessageBox ( PAnsiCHar('Вы действительно хотите удалить группу?'), 'Требуется подтверждение!',
    MB_ICONQUESTION or MB_YESNO) = IDYES ) then
  try
  try
    odsMO.Edit;
    odsMO.FieldByName( 'FL_DEL' ).AsInteger := 1; // устанавливаем флаг удаленной записи
    odsMO.Post; // коммит на посте
  except
    on e : Exception do
    begin
      odsMO.Session.Rollback;
      Application.MessageBox( PAnsiChar( 'Ошибка при удалении группы!' +#13#10 + e.Message ) , MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
    end;
  end;
  finally
    odsMO.RefreshRecord;
  end;
end;

procedure TfrmMOGroup.acEditExecute(Sender: TObject);
begin
  if DoMoGroupEdit( Self, tlMOGroup.DataController.DataSet.FieldByName('groupid').AsInteger ) then
    (tlMOGroup.DataController.DataSet as TOracleDataSet).RefreshRecord;
end;

procedure TfrmMOGroup.aSelectExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

constructor TfrmMOGroup.Create(AOwner: TComponent; aCurMoGroupID : integer = -1; AIsSelect: Boolean = False;
  AIsShowDeleted : Boolean = False; AExcludeId : integer = -1);
begin
  fIsForSelect := AIsSelect;
  fCurMOGroupId := aCurMoGroupID;
  fIsShowDeleted := AIsShowDeleted;
  fExcludeId := AExcludeId;
  inherited Create ( AOwner );
end;

procedure TfrmMOGroup.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmMOGroup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmMOGroup.FormShow(Sender: TObject);
begin
  cxDBTreeList1cxDBTreeListFK_SKLAD_ID.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1);
  cxDBTreeList1cxDBTreeListFC_QUOTA_CODE_1.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_QUOTA_CODE', 0) = 1);
  cxDBTreeList1cxDBTreeListFL_POST.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_MOGROUP_FL_POST', 0) = 1);
  if fIsForSelect then
    btnClose.Action := aCancel
  else
    btnClose.Action := acClose;

  acRefresh.Execute;
end;

end.

