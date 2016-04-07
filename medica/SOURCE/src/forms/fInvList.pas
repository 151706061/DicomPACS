unit fInvList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ActnList, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxCalendar, cxDropDownEdit, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, OracleData, JvComponentBase, JvFormPlacement;

type
  TfrmInvList = class(TForm)
    al: TActionList;
    acRefresh: TAction;
    acAdd: TAction;
    acEdit: TAction;
    acDel: TAction;
    acClose: TAction;
    clbMain: TCoolBar;
    tlbMain: TToolBar;
    btnAdd: TToolButton;
    btnEdit: TToolButton;
    btnRefresh: TToolButton;
    btnDel: TToolButton;
    sepClose: TToolButton;
    btnClose: TToolButton;
    sepRefresh: TToolButton;
    odsInventoryList: TOracleDataSet;
    dsInventoryList: TDataSource;
    grdInventoryListDBTV1: TcxGridDBTableView;
    grdInventoryListLvl1: TcxGridLevel;
    grdInventoryList: TcxGrid;
    grdInventoryListDBTV1INVLISTID: TcxGridDBColumn;
    grdInventoryListDBTV1MATOTVID_OWNER: TcxGridDBColumn;
    grdInventoryListDBTV1MATOTVID: TcxGridDBColumn;
    grdInventoryListDBTV1FC_DOCNUM: TcxGridDBColumn;
    grdInventoryListDBTV1FD_DATA1: TcxGridDBColumn;
    grdInventoryListDBTV1FD_DATA2: TcxGridDBColumn;
    grdInventoryListDBTV1FC_PREDS: TcxGridDBColumn;
    grdInventoryListDBTV1FN_TYPE: TcxGridDBColumn;
    grdInventoryListDBTV1FD_DT_BEG: TcxGridDBColumn;
    grdInventoryListDBTV1FD_DT_END: TcxGridDBColumn;
    grdInventoryListDBTV1FC_NMB_PRIKAZ: TcxGridDBColumn;
    grdInventoryListDBTV1FD_DAT_PRIKAZ: TcxGridDBColumn;
    grdInventoryListDBTV1FK_FINSOURCE_ID: TcxGridDBColumn;
    grdInventoryListDBTV1FC_MO_OWNER: TcxGridDBColumn;
    grdInventoryListDBTV1FC_MOGR: TcxGridDBColumn;
    grdInventoryListDBTV1FC_FINSOURCE: TcxGridDBColumn;
    FormStorage: TJvFormStorage;
    grdInventoryListDBTV1FC_INVTYPE: TcxGridDBColumn;
    grdInventoryListDBTV1FL_EDIT: TcxGridDBColumn;
    grdInventoryListDBTV1FC_EDIT: TcxGridDBColumn;
    acSign: TAction;
    ToolButton1: TToolButton;
    sepSign: TToolButton;
    grdInventoryListDBTV1FC_SIGNED_BY: TcxGridDBColumn;
    grdInventoryListDBTV1FD_SIGNED: TcxGridDBColumn;
    acPrint: TAction;
    btnPrint: TToolButton;
    sepPrint: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acCloseExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure alUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure acAddExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acDelExecute(Sender: TObject);
    procedure grdInventoryListDBTV1DblClick(Sender: TObject);
    procedure acSignExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoShowInventoryList;

var
  frmInvList: TfrmInvList;

implementation

uses fMainForm, fdmMain, fdmPrintReports, fInvEdit;

procedure DoShowInventoryList;
begin
  if not frmMain.RestoreMDI_Window('frmInvList') then
  begin
    frmInvList := TfrmInvList.Create(Application);
    frmInvList.FormStyle := fsMDIChild;
  end;
end;

{$R *.dfm}

procedure TfrmInvList.acAddExecute(Sender: TObject);
var
  NewRecId : Integer;
begin
  NewRecId := -1;
  if DoInventoryEdit(NewRecId) then
  begin
    acRefresh.Execute;
    
    // локейт на новую запись
    with  (grdInventoryList.ActiveView as TcxGridDBTableView).DataController do
    begin
    if not LocateByKey( NewRecId ) then
      GotoFirst;
    end;
  end;
end;

procedure TfrmInvList.acCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmInvList.acDelExecute(Sender: TObject);
begin
  odsInventoryList.RefreshRecord;

  if odsInventoryList.FieldByName ( 'FL_EDIT' ).AsInteger = 0  then
  begin
    Application.MessageBox( PAnsiChar('Инвентаризация подписана. Удаление невозможно!'), MSG_CAPTION_ATTENTION, MB_OK + MB_ICONWARNING );
    Exit;
  end
  else
  try
    if (Application.MessageBox ( PAnsiChar( 'Удалить запись?'), MSG_CATION_QUESTION, MB_YESNO + MB_ICONQUESTION ) = mrYes)  then
    begin
      dmMain.pkgInvOpis.DODEL( grdInventoryListDBTV1.Controller.FocusedRow.Values [grdInventoryListDBTV1INVLISTID.Index] );
      dmMain.os.Commit;
      acRefresh.Execute;
    end;
  except
    on e : exception do
    begin
      dmMain.os.Rollback;
      Application.MessageBox( PAnsiChar( 'Ошибка при удалении инвентаризации!' + #13#10 + e.Message ), MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
    end;
  end;  
end;

procedure TfrmInvList.acEditExecute(Sender: TObject);
var
  CurRecId : Integer;
  CanEdit : Boolean;
begin
  CurRecId := grdInventoryListDBTV1.Controller.FocusedRow.Values[ grdInventoryListDBTV1INVLISTID.Index ];
  CanEdit := VarToStr(grdInventoryListDBTV1.Controller.FocusedRow.Values[ grdInventoryListDBTV1FL_EDIT .Index ]) = '1';

  DoInventoryEdit( CurRecId, CanEdit );
  odsInventoryList.RefreshRecord;
end;

procedure TfrmInvList.acPrintExecute(Sender: TObject);
var
  InvListId : integer;
  Msg : string;
begin
  InvListId := grdInventoryListDBTV1.Controller.FocusedRow.Values[ grdInventoryListDBTV1INVLISTID.Index ] ;
  try
    Msg := dmMain.pkgInvOpis.DOCHECKOKINV( InvListId );

    if Msg <> EmptyStr then
      Application.MessageBox( PAnsiChar( 'Обратите внимание! Не указаны следующие данные:' +#13#10 + Msg ),
        MSG_CAPTION_ATTENTION, MB_OK + MB_ICONINFORMATION );
  except
    on e: Exception do
    begin
      Application.ShowException( e );
      Exit;
    end;
  end;

  dmPrintReports.PrintInvOpis( InvListId );
end;

procedure TfrmInvList.acRefreshExecute(Sender: TObject);
var
  KeyFieldVal : Variant;
begin
  KeyFieldVal := Null;

  if grdInventoryList.ActiveView is TcxGridDBTableView then
  try
    Screen.Cursor := crHourGlass;
    grdInventoryList.BeginUpdate;

    with (grdInventoryList.ActiveView as TcxGridDBTableView).DataController do
    begin
      if (odsInventoryList.Active ) and ( not odsInventoryList.IsEmpty )  then
        KeyFieldVal := GetKeyFieldsValues;

      odsInventoryList.Close;
      odsInventoryList.SetVariable( 'pFK_SOTRID', dmMain.nSotrFK_ID );
      odsInventoryList.Open;

      if not LocateByKey( KeyFieldVal ) then
          GotoFirst;
    end;
  finally
    grdInventoryList.EndUpdate;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmInvList.acSignExecute(Sender: TObject);
var
  InvListId : integer;
  Msg : string;
begin
  odsInventoryList.RefreshRecord;
  // проверка перед подписью

  if (odsInventoryList.FieldByName ( 'FL_EDIT' ).AsInteger = 0) then
  begin

    Application.MessageBox( PAnsichar( 'Инвентаризация уже подписана!' ), MSG_CAPTION_ATTENTION, MB_OK + MB_ICONINFORMATION );
    Exit;
  end;

  InvListId := grdInventoryListDBTV1.Controller.FocusedRow.Values [grdInventoryListDBTV1INVLISTID.Index];
  try
    Msg := dmMain.pkgInvOpis.DOCHECKOKINV( InvListId );

    if Msg <> EmptyStr then
    begin
      Application.MessageBox( PAnsiChar( 'Невозможно подписать инвентаризацию!'#13#10'Не указаны следующие данные:' +#13#10 + Msg ),
        MSG_CAPTION_ATTENTION, MB_OK + MB_ICONWARNING );
      Exit;
    end;
  except
    on e: Exception do
    begin
      Application.ShowException( e );
      Exit;
    end;
  end;

  try
    if (Application.MessageBox ( PAnsiChar('Подписать инвентаризацию №' + odsInventoryList.FieldByName ('FC_DOCNUM').AsString +
       ' по приказу №' + odsInventoryList.FieldByName ('FC_NMB_PRIKAZ').AsString + ' от ' + DateToStr (odsInventoryList.FieldByName ('FD_DAT_PRIKAZ').AsDateTime)  + ' ? Снять подпись или отредактировать инвентаризацию будет невозможно!'),
          MSG_CATION_QUESTION, MB_YESNO + MB_ICONQUESTION ) = mrYes)  then
    begin
      dmMain.pkgInvOpis.DOSETSIGN(InvListId);
      dmMain.os.Commit;
      odsInventoryList.RefreshRecord;
    end;
  except
    on e : exception do
    begin
      dmMain.os.Rollback;
      Application.MessageBox( PAnsiChar( 'Ошибка при подписи инвентаризации!' + #13#10 + e.Message ), MSG_CAPTION_ERROR, MB_OK + MB_ICONERROR );
    end;
  end;
end;

procedure TfrmInvList.alUpdate(Action: TBasicAction; var Handled: Boolean);
var
  bActive, bSelected, bFL_EDIT : Boolean;
begin
  bActive := Assigned ( grdInventoryListDBTV1.DataController.DataSet ) and (grdInventoryListDBTV1.DataController.DataSet.Active );
  bSelected := (bActive)  and (not grdInventoryListDBTV1.DataController.DataSet.IsEmpty)
    and Assigned(grdInventoryListDBTV1.Controller.FocusedRow )
    and (grdInventoryListDBTV1.Controller.FocusedRow.IsData);
  bFL_EDIT := (bSelected) and (VarToStr (grdInventoryListDBTV1.Controller.FocusedRow.Values[grdInventoryListDBTV1FL_EDIT.Index]) = '1');

  acAdd.Enabled := bActive;
  acEdit.Enabled := bSelected;
  acDel.Enabled := (bFL_EDIT);
  acSign.Visible := dmMain.ConfigParams.GetParamValue ( 'FUNC_CAN_SIGN_INVENTORY', False ) ;
  acSign.Enabled := (acSign.Visible) and (bFL_EDIT);
  sepSign.Visible := acSign.Visible;

  if not (bFL_EDIT) then
    acEdit.Caption := 'Просмотр'
  else
    acEdit.Caption := 'Изменить';
end;

procedure TfrmInvList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmInvList.FormShow(Sender: TObject);
begin
  acRefresh.Execute;
end;

procedure TfrmInvList.grdInventoryListDBTV1DblClick(Sender: TObject);
begin
  acEdit.Execute;
end;

end.
