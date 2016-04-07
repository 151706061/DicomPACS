unit uSprOKDP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit, cxMaskEdit, cxInplaceContainer, cxDBTL, cxControls, cxTLData, Menus, DB,
  OracleData, Oracle, ComCtrls, ToolWin, ActnList;

type
  TSprOKDP = class(TForm)
    actionList: TActionList;
    actAdd: TAction;
    actAddChild: TAction;
    actEdit: TAction;
    actRemove: TAction;
    actSelect: TAction;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnSelect: TToolButton;
    ToolButton1: TToolButton;
    btnAdd: TToolButton;
    btnEdit: TToolButton;
    btnDelete: TToolButton;
    ToolButton6: TToolButton;
    btnClose: TToolButton;
    ods: TOracleDataSet;
    ds: TDataSource;
    pmTreeList: TPopupMenu;
    miAdd: TMenuItem;
    miAddChild: TMenuItem;
    miEdit: TMenuItem;
    miDelete: TMenuItem;
    pmAddBtn: TPopupMenu;
    miAddBtnAdd: TMenuItem;
    miAddBtnAddChild: TMenuItem;
    tlSprOKDP: TcxDBTreeList;
    cxDBTreeList1FC_CODE: TcxDBTreeListColumn;
    cxDBTreeList1FC_NAME: TcxDBTreeListColumn;
    osAutonomous: TOracleSession;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure odsAfterOpen(DataSet: TDataSet);
    procedure actRemoveExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actAddChildExecute(Sender: TObject);
    procedure tlSprOKDPDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure tlSprOKDPEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure tlSprOKDPStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure actSelectExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idOKDP : Integer;
    strOKDP : string;
  end;

var
  SprOKDP: TSprOKDP;

implementation

uses fdmMain, uSprOKDPEdit;

{$R *.dfm}

procedure TSprOKDP.actAddChildExecute(Sender: TObject);
var
	id, parentid : Integer;
	dlg : TSprOKDPEdit;   
  oqAdd : TOracleQuery;
begin
	dlg := TSprOKDPEdit.Create(Self);
	if dlg.ShowModal = mrOK then begin
		// Добавляем
		id := 0;
    parentid := 0;
    if ods.RecordCount > 0 then    
      parentid := ods.FieldByName('FK_ID').AsInteger;

		oqAdd := TOracleQuery.Create(Self);
    oqAdd.Session := osAutonomous;
    oqAdd.SQL.Text := 'insert into med.tsprav_okdp(fk_parentid, fc_code, fc_name) values(:pParentid, :pCode, :pName) returning fk_id into :pID';
    oqAdd.DeclareAndSet('pParentid', otInteger, parentid);
    oqAdd.DeclareAndSet('pCode', otString, dlg.GetCode);
    oqAdd.DeclareAndSet('pName', otString, dlg.GetName);
    oqAdd.DeclareVariable('pID', otInteger);
    oqAdd.Execute;
    id := oqAdd.GetVariable('pID');
    oqAdd.Free;

		ods.Refresh;
		ods.Locate('FK_ID', id, []);
	end;
	dlg.Free;
end;

procedure TSprOKDP.actAddExecute(Sender: TObject);
var
	id, parentid : Integer;
	dlg : TSprOKDPEdit;   
  oqAdd : TOracleQuery;
begin
	dlg := TSprOKDPEdit.Create(Self);
	if dlg.ShowModal = mrOK then begin
		// Добавляем
		id := 0;
    parentid := 0;
    if ods.RecordCount > 0 then    
      parentid := ods.FieldByName('FK_PARENTID').AsInteger;

		oqAdd := TOracleQuery.Create(Self);
    oqAdd.Session := osAutonomous;
    oqAdd.SQL.Text := 'insert into med.tsprav_okdp(fk_parentid, fc_code, fc_name) values(:pParentid, :pCode, :pName) returning fk_id into :pID';
    oqAdd.DeclareAndSet('pParentid', otInteger, parentid);
    oqAdd.DeclareAndSet('pCode', otString, dlg.GetCode);
    oqAdd.DeclareAndSet('pName', otString, dlg.GetName);
    oqAdd.DeclareVariable('pID', otInteger);
    oqAdd.Execute;
    id := oqAdd.GetVariable('pID');
    oqAdd.Free;

		ods.Refresh;
		ods.Locate('FK_ID', id, []);
	end;
	dlg.Free;
end;

procedure TSprOKDP.actEditExecute(Sender: TObject);
var
	id : Integer;
	parentid : Integer;
	dlg : TSprOKDPEdit;
	strCode : String;
  strName : String;
  oqEdit : TOracleQuery;
begin
  // Получим текущий идентификатор и значеие
  id := ods.FieldByName('FK_ID').AsInteger;
  parentid := ods.FieldByName('FK_PARENTID').AsInteger;
  strCode := ods.FieldByName('FC_CODE').AsString;
  strName := ods.FieldByName('FC_NAME').AsString;

  dlg := TSprOKDPEdit.Create(Self);

  dlg.SetCode(strCode);
  dlg.SetName(strName);
  if dlg.ShowModal = mrOK then begin
    // Установим новое значение
    strCode := dlg.GetCode;
    strName := dlg.GetName;
		oqEdit := TOracleQuery.Create(Self);
    oqEdit.Session := osAutonomous;
    oqEdit.SQL.Text := 'update med.tsprav_okdp set fc_code = :pCode, fc_name = :pName where fk_id = :pID';
    oqEdit.DeclareAndSet('pID',otInteger,id);     
    oqEdit.DeclareAndSet('pCode',otString,strCode);
    oqEdit.DeclareAndSet('pName',otString,strName);
    oqEdit.Execute;
    oqEdit.Free;
    // Обновим список
    ods.Refresh;
    ods.Locate('FK_ID',id,[]);
  end;
  dlg.Free;
end;

procedure TSprOKDP.actRemoveExecute(Sender: TObject);
var
	id : Integer;
	ret : Integer;
  oqDel : TOracleQuery;
begin
	// Получим идентификатор записи, которую необходимо удалить
	id := ods.FieldByName('FK_ID').AsInteger;
	// Пользователь уверен?
	ret := Application.MessageBox('Вы действительно хотите удалить данную запись и все её дочерние записи?',
		'Внимание', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2);
	if ret = IDYES then begin // Да, уверен
		oqDel := TOracleQuery.Create(Self);
    oqDel.Session := osAutonomous;
    oqDel.SQL.Text := 'delete from med.tsprav_okdp where fk_id in (SELECT fk_id FROM med.tsprav_okdp START WITH fk_id = :pID CONNECT BY PRIOR fk_id = fk_parentid)';
    oqDel.DeclareAndSet('pID',otInteger,id);
    oqDel.Execute;
    oqDel.Free;
		ods.Refresh;
	end;
end;

procedure TSprOKDP.actSelectExecute(Sender: TObject);
begin
  idOKDP := ods.FieldByName('FK_ID').AsInteger;
  strOKDP := ods.FieldByName('FC_CODE').AsString + ' ' + ods.FieldByName('FC_NAME').AsString;
  ModalResult := mrOK;
end;

procedure TSprOKDP.btnCloseClick(Sender: TObject);
begin
	Close;
end;

procedure TSprOKDP.tlSprOKDPDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source = Sender;  
end;

procedure TSprOKDP.tlSprOKDPEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  tlSprOKDP.OptionsData.Editing := False;
end;

procedure TSprOKDP.tlSprOKDPStartDrag(Sender: TObject; var DragObject: TDragObject);
begin
  tlSprOKDP.OptionsData.Editing := True;
end;

procedure TSprOKDP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TSprOKDP.FormCreate(Sender: TObject);
begin
  osAutonomous.ExternalSVC := dmMain.os.ExternalSVC;
  ods.Open;
end;

procedure TSprOKDP.odsAfterOpen(DataSet: TDataSet);
begin
	actAdd.Enabled := (ods.RecordCount > 0);
	actRemove.Enabled := (ods.RecordCount > 0);
	actEdit.Enabled := (ods.RecordCount > 0);
	actSelect.Enabled := (ods.RecordCount > 0);
end;

end.
