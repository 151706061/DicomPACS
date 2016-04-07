unit uProdCertDlg;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	ComCtrls, ToolWin, StdCtrls, ExtCtrls, Db, OracleData,
	Grids, Menus, ActnList, cxGraphics, cxCustomData,
  cxStyles, cxTL, cxTextEdit, cxInplaceContainer, cxDBTL, cxControls,
  cxTLData, ImgList, JvComponentBase, JvFormPlacement, cxMaskEdit;

type

	TProdCertDlg = class(TForm)
		CoolBar1: TCoolBar;
		ToolBar1: TToolBar;
		btnSelect: TToolButton;
		btnEdit: TToolButton;
		btnDelete: TToolButton;
		btnAdd: TToolButton;
		ToolButton6: TToolButton;
		btnClose: TToolButton;
		ods: TOracleDataSet;
		ds: TDataSource;
    pmTreeList: TPopupMenu;
    miDelete: TMenuItem;
    miAddCert: TMenuItem;
    miAddProd: TMenuItem;
    miEdit: TMenuItem;
    actionList: TActionList;
    actAddProd: TAction;
    actAddCert: TAction;
    actEdit: TAction;
    actRemove: TAction;
    pmAddBtn: TPopupMenu;
    miAddBtnAddProd: TMenuItem;
    miAddBtnAddCert: TMenuItem;
    actSelect: TAction;
    cxDBTreeList1: TcxDBTreeList;
    cxDBTreeList1FC_VALUE: TcxDBTreeListColumn;
    JvFormStorage1: TJvFormStorage;
    ToolButton1: TToolButton;
    cxDBTreeList1FC_FOREIGHN: TcxDBTreeListColumn;
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actAddProdExecute(Sender: TObject);
    procedure actAddCertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actRemoveExecute(Sender: TObject);
    procedure actionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure actSelectExecute(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
	private
		{ Private declarations }

	public
		m_strProd : String;
		m_strCert : String;
		m_ID : integer;
		{ Public declarations }
		constructor Create(AOwner: TComponent); override;
	end;

var
  ProdCertDlg : TProdCertDlg;

implementation

{$R *.DFM}
uses
	fdmMain, uProdCertEditDlg;

constructor TProdCertDlg.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  ods.Open;
end;

procedure TProdCertDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then Action := caFree;
end;

// Добавить производителя
procedure TProdCertDlg.actAddProdExecute(Sender: TObject);
var
	id : Double;
	dlg : TProdCertEditDlg;
begin
	dlg := TProdCertEditDlg.CreateProd;
	if dlg.ShowModal = mrOK then begin
		// Добавляем производителя
		id := 0;
		dmMain.pkgProdCert.Add(dlg.GetEditValue, id, dlg.GetForeighn);
		ods.Refresh;
		ods.Locate('FK_ID', id, []);
	end;
	dlg.Free;
end;

// Добавить сертификат
procedure TProdCertDlg.actAddCertExecute(Sender: TObject);
var
	id : Double;
	dlg : TProdCertEditDlg;
begin
	dlg := TProdCertEditDlg.CreateCert;
	if dlg.ShowModal = mrOK then begin
		id := ods.FieldByName('FN_PARENT').AsFloat;
		if id = 0 then begin
			id := ods.FieldByName('FK_ID').AsFloat;
		end;
		dmMain.pkgProdCert.Add(dlg.GetEditValue, id, dlg.GetForeighn);
		ods.Refresh;
		ods.Locate('FK_ID', id, []);
	end;
	dlg.Free;
end;

// Редактировать
procedure TProdCertDlg.actEditExecute(Sender: TObject);
var
	id : Double;
	parentid : Double;
	dlg : TProdCertEditDlg;
	str : String;
  bIsForeighn: boolean;
begin
  // Получим текущий идентификатор и значеие
  id := ods.FieldByName('FK_ID').AsFloat;
  parentid := ods.FieldByName('FN_PARENT').AsFloat;
  str := ods.FieldByName('FC_VALUE').AsString;
  bIsForeighn := boolean(ods.FieldByName('FL_FOREIGHN').AsInteger);

  if parentid = 0 then
    begin // Это информация о производителе
      dlg := TProdCertEditDlg.CreateProd;
    end
  else
    begin                // Это информация о СЕРТИФИКАТЕ
      dlg := TProdCertEditDlg.CreateCert;
    end;

  dlg.SetEditValue(str);
  dlg.SetForeighn(bIsForeighn);
  if dlg.ShowModal = mrOK then begin
    // Установим новое значение
    str := dlg.GetEditValue;
    bIsForeighn := dlg.GetForeighn;
    dmMain.pkgProdCert.Edit(id, str, bIsForeighn);
    // Обновим список
    ods.Refresh;
    ods.Locate('FK_ID',id,[]);
  end;
  dlg.Free;
end;

procedure TProdCertDlg.actRemoveExecute(Sender: TObject);
var
	id : Double;
	ret : Integer;
begin
	// Получим идентификатор записи, которую необходимо удалить
	id := ods.FieldByName('FK_ID').AsFloat;
	// Пользователь уверен?
	ret := Application.MessageBox('Вы действительно хотите удалить данную запись?',
		'Внимание', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2);
	if ret = IDYES then begin // Да, уверен
		dmMain.pkgProdCert.Remove(id);
		ods.Refresh;
	end;
end;

procedure TProdCertDlg.actionListUpdate(Action: TBasicAction; var Handled: Boolean);
begin
	actAddCert.Enabled := (ods.RecordCount > 0);
	actRemove.Enabled := (ods.RecordCount > 0);
	actEdit.Enabled := (ods.RecordCount > 0);
	actSelect.Enabled := (ods.RecordCount > 0);
end;

// Выбрать
procedure TProdCertDlg.actSelectExecute(Sender: TObject);
var
	parentid : Double;
begin
  m_ID := ods.FieldByName('FK_ID').AsInteger;
  parentid := ods.FieldByName('FN_PARENT').AsFloat;
  if parentid = 0 then
    begin // Выбран производитель
      m_strProd := ods.FieldByName('FC_VALUE').AsString;
      m_strCert := '';
  end
  else
    begin
      // Получим сертификат
      m_strCert := ods.FieldByName('FC_VALUE').AsString;
      // Перейдем к производителю
      ods.Locate('FK_ID', parentid, []);
      // Получим производителя
      m_strProd := ods.FieldByName('FC_VALUE').AsString;
    end;
  ModalResult := mrOK;
end;

procedure TProdCertDlg.btnCloseClick(Sender: TObject);
begin
	Close;
end;

procedure TProdCertDlg.FormCreate(Sender: TObject);
begin
  ods.Open;

end;

end.
