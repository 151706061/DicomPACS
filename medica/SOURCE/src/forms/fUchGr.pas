unit fUchGr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, Db, OracleData, Grids,
  JvFormPlacement, Oracle, JvDBUtils, HtmlHlp,
  JvComponentBase, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxTextEdit, cxTL, cxInplaceContainer, cxDBTL, cxTLData, Menus, cxMaskEdit;

type
  TfrmUchGr = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    tbuEdit: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    al: TActionList;
    acClose: TAction;
    acDel: TAction;
    acEdit: TAction;
    acAdd: TAction;
    acRefresh: TAction;
    ToolButton5: TToolButton;
    FormStorage: TJvFormStorage;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    oqSetQUOTA_UchGr: TOracleQuery;
    tlUchgr: TcxDBTreeList;
    tlUchgrFC_UCHGR: TcxDBTreeListColumn;
    tlUchgrFC_QUOTA_CODE_2: TcxDBTreeListColumn;
    pmTreeList: TPopupMenu;
    miAdd: TMenuItem;
    miAddChild: TMenuItem;
    miEdit: TMenuItem;
    miDelete: TMenuItem;
    acAddChild: TAction;
    tlUchgrPARENTID: TcxDBTreeListColumn;
    tlUchgrUCHGRID: TcxDBTreeListColumn;
    osAutonomous: TOracleSession;
    pmAdd: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure odsUchGrAfterOpen(DataSet: TDataSet);
    procedure acDelExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure ChangeFC_QUOTA_CODE_2();
    procedure tlUchgrDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure tlUchgrEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure tlUchgrStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure FormCreate(Sender: TObject);
    procedure acAddChildExecute(Sender: TObject);
    procedure alUpdate(Action: TBasicAction; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoShowUchGr;
var
  frmUchGr: TfrmUchGr;

implementation

uses fmainform, fUchGrEdit, fdmMain, fUchGrEdit_new;

{$R *.DFM}

{********************************************************************************************************}
{        DoShowUchGr
{********************************************************************************************************}

procedure DoShowUchGr;
begin
  frmMain.CreateChild(TfrmUchGr, frmUchGr);
  frmUchGr.Show;
end;

{********************************************************************************************************}
{        TfrmUchGr.FormClose
{********************************************************************************************************}

procedure TfrmUchGr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmUchGr.FormCreate(Sender: TObject);
begin
//  ShowMessage('склад id= '+inttostr(dmMain.pkgMedSes.GET_CUR_MO_SKLAD_ID) );

  osAutonomous.ExternalSVC := dmMain.os.ExternalSVC;
end;

{********************************************************************************************************}
{        TfrmUchGr.odsListAfterOpen
{********************************************************************************************************}

procedure TfrmUchGr.odsUchGrAfterOpen(DataSet: TDataSet);
begin
  if DataSet.RecordCount = 0 then begin
    acDel.Enabled := FALSE;
    acEdit.Enabled := FALSE;
  end
  else begin
    acDel.Enabled := TRUE;
    acEdit.Enabled := TRUE;
  end;
end;
{********************************************************************************************************}
{        TfrmUchGr.acDelExecute
{********************************************************************************************************}

procedure TfrmUchGr.acDelExecute(Sender: TObject);
var
  s : string;   
  oqDel : TOracleQuery;
begin
//  if dmMain.IsTableRecordBuzy('MED.TUCHGR', 'UCHGRID', dmMain.odsUchGr.FieldByName('UCHGRID').AsInteger, 'Учетная группа редактируется другим сотрудником. Попробуйте позже.') then
//    Exit;
  if tlUchgr.FocusedNode.HasChildren then
  begin
    Application.MessageBox('Вы не можете удалить эту учетную группу, так как у неё есть дочерние группы.'#13#10+
                           'Удалите сначала все дочерние группы' ,
                           'Ошибка', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  
  try
    if (Application.MessageBox('Вы действительно хотите удалить эту учетную группу?',
                                     'Подвердите действие', MB_YESNO + MB_ICONQUESTION) = IDYES){and
        (not dmMain.IsUsedInTMedic('UCHGRID', dmMain.odsUchGr.FieldByName('UCHGRID').AsInteger))} then begin

      //dmMain.pkgUchGr.Dodel(dmMain.odsUchGr.FieldByName('UCHGRID').AsInteger)
      oqDel := TOracleQuery.Create(Self);
      oqDel.Session := osAutonomous;
      oqDel.SQL.Text := 'delete from med.tuchgr where uchgrid = :pID';
      oqDel.DeclareAndSet('pID',otInteger,dmMain.odsUchGr.FieldByName('UCHGRID').AsInteger);
      oqDel.Execute;
      oqDel.Free;
      tlUchgr.DataController.DataSource.DataSet.Refresh;
    end;
  except
    on E: EOracleError do
    begin
      s := 'Невозможно удалить учетную группу "'+tlUchgr.DataController.DataSource.DataSet.FieldByName('FC_UCHGR').AsString+'", т.к. имеются принадлежащие ей медикаменты!'#13#10+
           'Для успешного удаления, необходимо предварительно в списке медикаментов всем медикаментам, принадлежащим учетной группе "'+tlUchgr.DataController.DataSource.DataSet.FieldByName('FC_UCHGR').AsString+'", установить другую учетную группу.'#13#10+
           'Для открытия списка медикаментов выберите меню Настройки\Объекты учета.';
//      s := 'Невозможно удалить учетную группу  "'+cxGridListDBTableView1_FC_UCHGR.EditValue+'", т.к. есть входящие в неё медикаменты !!!.'#13#10+
//           'Для успешного удаления учетной группы "'+cxGridListDBTableView1_FC_UCHGR.EditValue+'", необходимо исключить из нее все медикаменты.'#13#10#13#10+
//           '(Главное меню -> Настройки -> Объекты учета -> Столбец "Учетная группа")';
      Application.MessageBox(PChar(s),'Ошибка',MB_OK + MB_ICONERROR);

//      if E.ErrorCode = 02292 then
//        windows.MessageBox(Handle, 'Невозможно удалить эту учетную группу, т.е. есть медикаменты входящие в неё!!!', 'Ошибка', MB_OK + MB_ICONERROR)
//      else
//        raise;
    end;
//    on E: Exception do
//      raise;

  end;
  //  dmMain.os.Commit;
  acRefresh.Execute;
end;
{********************************************************************************************************}
{        TfrmUchGr.acEditExecute
{********************************************************************************************************}

procedure TfrmUchGr.acEditExecute(Sender: TObject);
var
	id : Integer;
	parentid : Integer;
	dlg : TfrmUchGrEdit_new;
	strCode : String;
  strName : String;
  oqEdit : TOracleQuery;
begin
  // Получим текущий идентификатор и значеие
  id := tlUchgr.DataController.DataSource.DataSet.FieldByName('UCHGRID').AsInteger;
  parentid := tlUchgr.DataController.DataSource.DataSet.FieldByName('PARENTID').AsInteger;
  strCode := tlUchgr.DataController.DataSource.DataSet.FieldByName('FC_QUOTA_CODE_2').AsString;
  strName := tlUchgr.DataController.DataSource.DataSet.FieldByName('FC_UCHGR').AsString;

  dlg := TfrmUchGrEdit_new.Create(Self);

  dlg.UchGrId := id;
  dlg.UchGrCode := strCode;
  dlg.UchGrName := strName;
  dlg.ParentId := parentid;

  if dlg.ShowModal = mrOK then begin
    if ( strCode <> dlg.UchGrCode ) or
       ( strName <> dlg.UchGrName  ) or
       ( parentid <> dlg.ParentId  ) then
    begin
      // Установим новое значение
      oqEdit := TOracleQuery.Create(Self);
      oqEdit.Session := osAutonomous;
      oqEdit.SQL.Text := 'update med.tuchgr set FC_UCHGR = :pName, FC_QUOTA_CODE_2 = :pCode, PARENTID = :pPARENTID where uchgrid = :pID';
      oqEdit.DeclareAndSet('pID',otInteger,id);
      oqEdit.DeclareAndSet('pCode',otString, dlg.UchGrCode);
      oqEdit.DeclareAndSet('pName',otString, dlg.UchGrName);
      oqEdit.DeclareAndSet('pPARENTID',otString, dlg.ParentId);
      oqEdit.Execute;
      oqEdit.Free;

      if strCode <> dlg.UchGrCode then
        ChangeFC_QUOTA_CODE_2;
    end;

    // Обновим список
    tlUchgr.DataController.DataSource.DataSet.Refresh;
    tlUchgr.DataController.DataSource.DataSet.Locate('UCHGRID',id,[]);

  end;
  dlg.Free;
  {case tbuEdit.Down of
    False :cxGridListDBTableView1.DataController.PostEditingData;
  end;
  cxGridListDBTableView1.OptionsData.Editing := tbuEdit.Down;}
end;
{********************************************************************************************************}
{        TfrmUchGr.acAddExecute
{********************************************************************************************************}

procedure TfrmUchGr.acAddChildExecute(Sender: TObject);
var
	id, parentid : Integer;
	dlg : TfrmUchGrEdit_new;
  oqAdd : TOracleQuery;
begin
  id := 0;
  parentid := 0;
  if tlUchgr.DataController.DataSource.DataSet.RecordCount > 0 then
    parentid := tlUchgr.DataController.DataSource.DataSet.FieldByName('UCHGRID').AsInteger;

	dlg := TfrmUchGrEdit_new.Create(Self);

  dlg.ParentId := parentid;

	if dlg.ShowModal = mrOK then begin
		// Добавляем  
		oqAdd := TOracleQuery.Create(Self);
    oqAdd.Session := osAutonomous;
    oqAdd.SQL.Text := 'insert into med.tuchgr(FC_UCHGR, FC_QUOTA_CODE_2, PARENTID) values(:pName, :pCode, :pParentid) returning uchgrid into :pID';
    oqAdd.DeclareAndSet('pParentid', otInteger, dlg.ParentId);
    oqAdd.DeclareAndSet('pCode', otString, dlg.UchGrCode);
    oqAdd.DeclareAndSet('pName', otString, dlg.UchGrName);
    oqAdd.DeclareVariable('pID', otInteger);
    oqAdd.Execute;
    id := oqAdd.GetVariable('pID');
    oqAdd.Free;

		tlUchgr.DataController.DataSource.DataSet.Refresh;
		tlUchgr.DataController.DataSource.DataSet.Locate('UCHGRID', id, []);
	end;
	dlg.Free;
end;


procedure TfrmUchGr.acAddExecute(Sender: TObject);
var
	id, parentid : Integer;
	dlg : TfrmUchGrEdit_new;
  oqAdd : TOracleQuery;
begin
  id := 0;
	dlg := TfrmUchGrEdit_new.Create(Self);

	if dlg.ShowModal = mrOK then begin
		// Добавляем
		oqAdd := TOracleQuery.Create(Self);
    oqAdd.Session := osAutonomous;
    oqAdd.SQL.Text := 'insert into med.tuchgr(FC_UCHGR, FC_QUOTA_CODE_2, PARENTID) values(:pName, :pCode, :pParentid) returning uchgrid into :pID';
    oqAdd.DeclareAndSet('pParentid', otInteger, dlg.ParentId);
    oqAdd.DeclareAndSet('pCode', otString, dlg.UchGrCode);
    oqAdd.DeclareAndSet('pName', otString, dlg.UchGrName);
    oqAdd.DeclareVariable('pID', otInteger);
    oqAdd.Execute;
    id := oqAdd.GetVariable('pID');
    oqAdd.Free;

		tlUchgr.DataController.DataSource.DataSet.Refresh;
		tlUchgr.DataController.DataSource.DataSet.Locate('UCHGRID', id, []);
	end;
	dlg.Free;

  {tbuEdit.Down := True;
  cxGridListDBTableView1.OptionsData.Editing := tbuEdit.Down;
  cxGridListDBTableView1.DataController.Insert;
  cxGridListDBTableView1_FC_UCHGR.Focused := True;
  cxGridListDBTableView1_FC_UCHGR.Selected := True;}
end;

{********************************************************************************************************}
{        TfrmUchGr.acCloseExecute
{********************************************************************************************************}

procedure TfrmUchGr.acCloseExecute(Sender: TObject);
begin
  Close;
end;

{********************************************************************************************************}
{        TfrmUchGr.acRefreshExecute
{********************************************************************************************************}

procedure TfrmUchGr.acRefreshExecute(Sender: TObject);
begin
  dmMain.odsUchGr.Close;
  dmMain.odsUchGr.Open;
end;

procedure TfrmUchGr.alUpdate(Action: TBasicAction; var Handled: Boolean);
var
  CmnAccept : Boolean;
begin
  CmnAccept := (tlUchgr.DataController.DataSource.DataSet.RecordCount > 0)
    and ( tlUchgr.FocusedNode <> nil ) ;

	acAddChild.Enabled := CmnAccept;

	acDel.Enabled := ( CmnAccept ) and  ( not tlUchgr.FocusedNode.HasChildren );

	acEdit.Enabled := CmnAccept;
end;

procedure TfrmUchGr.tlUchgrDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
  CurNode : TcxTreeListNode;
begin
  CurNode := tlUchgr.GetNodeAt( x, y ) ;
  Accept := ( Source = Sender ) and Assigned ( dmMain.odsUchGrListByUchgrId ) and
   ( CurNode <> nil ) and
   ( not dmMain.odsUchGrListByUchgrId.Locate( 'UCHGRID', CurNode.Values[ tlUchgrPARENTID.ItemIndex ] , [] ) ) ;
end;

procedure TfrmUchGr.tlUchgrEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  tlUchgr.OptionsData.Editing := False;
end;

procedure TfrmUchGr.tlUchgrStartDrag(Sender: TObject; var DragObject: TDragObject);
begin
  with dmMain.odsUchGrListByUchgrId do
  try
    Close;
    DeclareAndSet ( 'pUCHGRID', otInteger, tlUchgr.DataController.DataSource.DataSet.FieldByName('UCHGRID').AsInteger );
    Open;
  except
  end;

  tlUchgr.OptionsData.Editing := True;
end;

procedure TfrmUchGr.ChangeFC_QUOTA_CODE_2();
begin
  if Application.MessageBox(PAnsiChar('Код квоты для учетной группы "'+tlUchgr.DataController.DataSource.DataSet.FieldByName('FC_UCHGR').AsString+'" был изменен. Обновить его во всех медикаментах и партиях?'), 'Внимание', MB_YESNO+MB_ICONQUESTION ) = IDYES then
  begin
    oqSetQUOTA_UchGr.SetVariable('UCHGRID', tlUchgr.DataController.DataSource.DataSet.FieldByName('UCHGRID').AsInteger);
    oqSetQUOTA_UchGr.SetVariable('FC_QUOTA_UCHGR', tlUchgr.DataController.DataSource.DataSet.FieldByName('FC_QUOTA_CODE_2').AsString);
    oqSetQUOTA_UchGr.Execute;

    ShowMessage(#13#10'Код квоты был успешно обновлен.'#13#10'Обновлено партий: '+IntToStr(oqSetQUOTA_UchGr.GetVariable('FN_TKART_UCHGR')));
  end;
end;

function TfrmUchGr.FormHelp(Command: Word; Data: Integer;
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

end.
