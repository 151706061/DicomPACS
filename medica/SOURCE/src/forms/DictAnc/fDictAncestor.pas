unit fDictAncestor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  JvFormPlacement, ImgList, ComCtrls, ActnList, ToolWin, ExtCtrls, Menus, Db,
  OracleData, Oracle, Stdctrls, JvComponentBase, fdmMain, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxControls, cxGraphics,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridLevel, cxGrid, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxContainer, cxTextEdit,
  cxMaskEdit;

type

//  TSpecialEdit = class(TcxInplaceEditList)
//  public
//    property ReadOnly;
//  end;

  TDisabledAction = (aInsert, aEdit, aDelete, aSelect, aRefresh, aExit);
  TDisabledActions = set of TDisabledAction;

  TfrmDictAncestor = class(TForm)
    al: TActionList;
    acIns: TAction;
    acEdit: TAction;
    acDelete: TAction;
    acSave: TAction;
    acCancel: TAction;
    acRefresh: TAction;
    acExit: TAction;
    il: TImageList;
    FormStorage: TJvFormStorage;
    mm: TMainMenu;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    dsBrws: TDataSource;
    pcBrws: TPageControl;
    tsBrws: TTabSheet;
    tsForm: TTabSheet;
    acSelect: TAction;
    pm: TPopupMenu;
    acNextTab: TAction;
    acPrevTab: TAction;
    Panel1: TPanel;
    grBrws_: TcxGrid;
    grBrws_Level1: TcxGridLevel;
    grBrws_DBTableView: TcxGridDBTableView;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure acInsExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acSaveExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure acSelectExecute(Sender: TObject);
    procedure dsBrwsStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pcBrwsChange(Sender: TObject);
    procedure pcBrwsChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormShow(Sender: TObject);
    procedure acNextTabExecute(Sender: TObject);
    procedure acPrevTabExecute(Sender: TObject);
  private
    { Private declarations }
    lsEnableActionList: TList;
    FDisabledActions: TDisabledActions;
    FbReadOnly: Boolean;
    procedure SetEditMode(bEnableEdit: Boolean);
    procedure SetReadOnly(const Value: Boolean);
  protected
    { Переключиться в режим редактирования}
    procedure ToggleToForm; virtual;
    { Переключиться в режим просмотра}
    procedure ToggleToTable; virtual;
    procedure ToggleEditButtons(bState: Boolean);

    { Переключение режима редактирования формы }
    procedure ToggleEditControls(bState: Boolean);


    { Установить запрещенные режимы обработки данных }
    procedure SetDisabledActions(NewDisabledSet: TDisabledActions); virtual;
    { Запретить режимы обработки данных}
    procedure DisableActions(ActionSet: TDisabledActions);
    { Разрешить режимы обработки данных}
    procedure EnableActions(ActionSet: TDisabledActions);

  public
    { Public declarations }
    property DisabledActions: TDisabledActions read FDisabledActions;
    property ReadOnly: Boolean read FbReadOnly write SetReadOnly;
    function ValidateControl(aControl: TWinControl): Boolean;
    function ValidValues: Boolean; virtual; abstract;
  end;

//var
//  frmDictAncestor: TfrmDictAncestor;

implementation

uses JvDBUtils;

{$R *.DFM}

{ TfrmDictAncestor }

procedure TfrmDictAncestor.SetEditMode(bEnableEdit: Boolean);
var
  iI: Integer;
begin
  if bEnableEdit <> acSave.Enabled then
  begin
    if bEnableEdit then
    begin // Отключить в режиме редактирования все левые Акции.
      lsEnableActionList.Clear;
      for iI := 0 to al.ActionCount - 1 do
        if TAction(al.Actions[iI]).Enabled then
        begin
          lsEnableActionList.Add(Pointer(iI));
          TAction(al.Actions[iI]).Enabled := False;
        end;
    end
    else
    begin
      for iI := 0 to lsEnableActionList.Count - 1 do
        TAction(al.Actions[Integer(lsEnableActionList.Items[iI])]).Enabled := True;
    end;
    acSave.Enabled := bEnableEdit;
    acCancel.Enabled := bEnableEdit;
  end;
end;

procedure TfrmDictAncestor.FormCreate(Sender: TObject);
begin
  lsEnableActionList := TList.Create;
  if Assigned(dsBrws.DataSet) then
    dsBrws.DataSet.Open;
end;

procedure TfrmDictAncestor.FormDestroy(Sender: TObject);
begin
  lsEnableActionList.Free;
end;

procedure TfrmDictAncestor.acInsExecute(Sender: TObject);
begin
  ToggleEditControls(True);
  ToggleToForm;
  if Assigned(dsBrws.DataSet) then
  begin
    dsBrws.DataSet.Insert;
  end;
//  ToggleEditButtons(False);
end;

procedure TfrmDictAncestor.ToggleToForm;
begin
//  SetEditMode(Assigned(dsBrws.DataSet) and (dsBrws.DataSet.State in [dsEdit, dsInsert]));
  SetEditMode(True);
//  ToggleEditButtons(True);
  if tsForm.TabVisible = True then
  begin
    pcBrws.ActivePage := tsForm;
  end;
end;

procedure TfrmDictAncestor.ToggleToTable;
begin
  SetEditMode(False);
  pcBrws.ActivePage := tsBrws;
//  if grBrws.CanFocus then
//    grBrws.SetFocus;

  if grBrws_.CanFocus then
    grBrws_.SetFocus;  
end;

procedure TfrmDictAncestor.ToggleEditButtons(bState: Boolean);
begin
  acDelete.Enabled := bState;
  acEdit.Enabled := acDelete.Enabled;
  acSelect.Enabled := acDelete.Enabled;
end;

procedure TfrmDictAncestor.acEditExecute(Sender: TObject);
begin
  ToggleEditControls(True);
  ToggleToForm;
  if Assigned(dsBrws.DataSet) then
  begin
    dsBrws.DataSet.Edit;
  end;
//  ToggleEditButtons(False);
end;

procedure TfrmDictAncestor.acDeleteExecute(Sender: TObject);
begin
  if Windows.MessageBoxEx(Handle,'Вы действительно хотите удалить запись?',
    'Подтверждение', MB_YESNO + MB_ICONQUESTION,$0419 {Russian}) = IDNO then Exit;
  if Assigned(dsBrws.DataSet) then
  begin
    dsBrws.DataSet.Delete;
  end;
end;

procedure TfrmDictAncestor.acSaveExecute(Sender: TObject);
begin
  if Windows.MessageBoxEx(Handle,'Вы действительно хотите сохранить изменения?',
    'Подтверждение', MB_YESNO + MB_ICONQUESTION,$0419 {Russian}) = IDNO then Exit;
  try
    if Assigned(dsBrws.DataSet) then dsBrws.DataSet.Post;
  finally
    ToggleToTable;
    ToggleEditControls(false);
  end;
end;

procedure TfrmDictAncestor.acCancelExecute(Sender: TObject);
begin
//  if Windows.MessageBox(Handle,'Вы действительно хотите отменить изменения?',
//    'Подтверждение', MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;
  if Assigned(dsBrws.DataSet) then
  begin
    dsBrws.DataSet.Cancel;
  end;
  ToggleToTable;
  ToggleEditControls(false);
end;

procedure TfrmDictAncestor.acRefreshExecute(Sender: TObject);
begin
  if Assigned(dsBrws.DataSet) then
  begin
    dsBrws.DataSet.Close;
    dsBrws.DataSet.Open;    
//    ToggleEditButtons(True);
  end;
end;

procedure TfrmDictAncestor.acExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmDictAncestor.acSelectExecute(Sender: TObject);
begin
  if not (aSelect in DisabledActions) then
  begin
    ModalResult := mrOK;
  end;
end;

procedure TfrmDictAncestor.SetDisabledActions(
  NewDisabledSet: TDisabledActions);
begin
  if Assigned(dsBrws.DataSet) then
  begin
    if not (dsBrws.DataSet.State in [dsEdit, dsInsert]) then
    begin
      FDisabledActions := NewDisabledSet;
      //
      if aEdit in NewDisabledSet then acEdit.Enabled := False
      else acEdit.Enabled := not (ReadOnly or dsBrws.DataSet.IsEmpty);
      //
      if aInsert in NewDisabledSet then acIns.Enabled := False
      else acIns.Enabled := not ReadOnly;
      //
      if aDelete in NewDisabledSet then acEdit.Enabled := False
      else acDelete.Enabled := not (ReadOnly or dsBrws.DataSet.IsEmpty);
      //
      if aSelect in NewDisabledSet then acSelect.Enabled := False
      else acSelect.Enabled := not dsBrws.DataSet.IsEmpty;
      //
      acRefresh.Enabled := (aRefresh in NewDisabledSet);
      //
      acExit.Enabled := (aExit in NewDisabledSet);
    end;
  end
  else
    FDisabledActions := [aEdit, aInsert, aDelete, aSelect, aRefresh];
end;

procedure TfrmDictAncestor.SetReadOnly(const Value: Boolean);
begin
  FbReadOnly := Value;
  if Value then
  begin
    DisableActions([aInsert, aDelete, aEdit]);
  end
  else
  begin
    EnableActions([aInsert, aDelete, aEdit]);
  end;
end;

procedure TfrmDictAncestor.dsBrwsStateChange(Sender: TObject);
begin
  if Assigned(dsBrws.DataSet) then
  begin
    with dsBrws.DataSet do
    begin
      if State = dsBrowse then
      begin
        if IsEmpty then
          ToggleEditButtons(False)
        else
          ToggleEditButtons(True);
      end;
    end;
  end;
end;

procedure TfrmDictAncestor.DisableActions(ActionSet: TDisabledActions);
begin
  SetDisabledActions(DisabledActions + ActionSet);
end;

procedure TfrmDictAncestor.EnableActions(ActionSet: TDisabledActions);
var
  CurrAction: TDisabledAction;
  MovedActions: TDisabledActions;
begin
  MovedActions := [];
  for CurrAction := Low(TDisabledAction) to High(TDisabledAction) do
  begin
    if (CurrAction in ActionSet) then
    begin
      MovedActions := MovedActions + [CurrAction];
    end;
  end;
  SetDisabledActions(DisabledActions - MovedActions);
end;

procedure TfrmDictAncestor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmDictAncestor.ToggleEditControls(bState: Boolean);

  // Для рекурсивного прохождения по компонентам.
  procedure RecursControls(bState: Boolean; oControl: TWinControl);
  var
    iI: Integer;
    rrControl: TControl;
  begin
    for iI := oControl.ControlCount - 1 downto 0 do
    begin
      rrControl := oControl.Controls[iI];
      if (rrControl is TPanel)
        or (rrControl is TTabSheet)
        or (rrControl is TPageControl) then
        //  рекурсия
        RecursControls(bState, TWinControl(rrControl))
      else
      begin
//        ShowMessage(rrControl.ClassName);
//        if rrControl is TcxInplaceEditList then
//          TSpecialEdit(rrControl).ReadOnly := (not bState);
      end;
    end;
  end;
// то что было  
//  procedure RecursControls(bState: Boolean; oControl: TWinControl);
//  var
//    iI: Integer;
//    rrControl: TControl;
//  begin
//    for iI := oControl.ControlCount - 1 downto 0 do
//    begin
//      rrControl := oControl.Controls[iI];
//      if (rrControl is TPanel)
//        or (rrControl is TTabSheet)
//        or (rrControl is TPageControl) then
//        //  рекурсия
//        RecursControls(bState, TWinControl(rrControl))
//      else
//      begin
//        if rrControl is TCustomEdit then
//          TSpecialEdit(rrControl).ReadOnly := (not bState);
//        if rrControl is TButtonControl then
//          TButtonControl(rrControl).Enabled := bState;
//      end;
//    end;
//  end;

begin
  RecursControls(bState, TWinControl(tsForm))
end;

procedure TfrmDictAncestor.pcBrwsChange(Sender: TObject);
begin
// событие срабатывает тока когда DataSet  в режиме просмотра ,
// вот и надо выключать контролы чтоб не редактировалось ничего
//  if Assigned(dsBrws.DataSet) and (dsBrws.State = dsBrowse) then
    case pcBrws.ActivePage.PageIndex of
      0: ToggleEditControls(True); // tsBrws
      1: ToggleEditControls(False);  //tsForm
    end;
end;

procedure TfrmDictAncestor.pcBrwsChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  case pcBrws.ActivePage.PageIndex of
    0: AllowChange := not (dsBrws.DataSet.isEmpty);
    1: AllowChange := not (dsBrws.State in dsEditModes);
  end;
end;

procedure TfrmDictAncestor.FormShow(Sender: TObject);
begin
  ToggleToTable;
end;

procedure TfrmDictAncestor.acNextTabExecute(Sender: TObject);
begin
  if pcBrws.ActivePageIndex < pcBrws.PageCount - 1 then
    pcBrws.ActivePageIndex := pcBrws.ActivePageIndex + 1
  else pcBrws.ActivePageIndex := 0;
end;

procedure TfrmDictAncestor.acPrevTabExecute(Sender: TObject);
begin
  if pcBrws.ActivePageIndex > 0 then
    pcBrws.ActivePageIndex := pcBrws.ActivePageIndex - 1
  else pcBrws.ActivePageIndex := pcBrws.PageCount - 1;
end;

function TfrmDictAncestor.ValidateControl(aControl: TWinControl): Boolean;
begin
  //Hint проверяемого контрола должен быть заполнен
  Result := True;

  if ((aControl.ClassName = 'TcxMaskEdit') and (TcxMaskEdit(aControl).Text = '')) or
  ((aControl.ClassName = 'TcxTextEdit') and (TcxTextEdit(aControl).Text = ''))
  then
  begin
    MessageBox(Handle, pChar('Необходимо заполнить "' + aControl.Hint + '"'), 'Ошибка',
      MB_ICONERROR or MB_OK);
    aControl.SetFocus;
    Result := False;
  end;
end;

end.
