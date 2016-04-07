unit fSklad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, Db, OracleData, Grids,
  JvFormPlacement, Oracle, JvDBUtils, HtmlHlp,
  JvComponentBase, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxTextEdit;

type
  TfrmSklad = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    al: TActionList;
    acClose: TAction;
    acDel: TAction;
    acAdd: TAction;
    acRefresh: TAction;
    ToolButton5: TToolButton;
    FormStorage: TJvFormStorage;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    cxGridList: TcxGrid;
    cxGridListDBTableView1: TcxGridDBTableView;
    cxGridListLevel1: TcxGridLevel;
    oqAdd: TOracleQuery;
    oqDel: TOracleQuery;
    cxGridListDBTableView1FK_ID: TcxGridDBColumn;
    cxGridListDBTableView1FC_NAME: TcxGridDBColumn;
    cxGridListDBTableView1FC_SYNONIM: TcxGridDBColumn;
    cxGridListDBTableView1FC_NAME_REP: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acDelExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoShowSklad;
var
  frmSklad: TfrmSklad;

implementation

uses fmainform, fdmMain, Variants;

{$R *.DFM}
//------------------------------------------------------------------------------
procedure DoShowSklad;
begin
  frmMain.CreateChild(TfrmSklad, frmSklad);
  frmSklad.Show;
end;
//------------------------------------------------------------------------------
procedure TfrmSklad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree;
end;
//------------------------------------------------------------------------------
procedure TfrmSklad.acDelExecute(Sender: TObject);
begin
  if windows.MessageBox(Handle, 'Вы действительно хотите удалить этот склад?', 'Подвердите действие', MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
    try
      oqDel.SetVariable('pFK_ID', dmMain.odsSklad.fieldByName('FK_ID').AsInteger);
      oqDel.Execute;
		except
			windows.MessageBox(Handle, 'Невозможно удалить этот склад. Он уже задействован', 'Ошибка', MB_OK + MB_ICONERROR)
		end;
  end;
  acRefresh.Execute; 
end;
//------------------------------------------------------------------------------
procedure TfrmSklad.acAddExecute(Sender: TObject);
begin
  oqAdd.SetVariable('pFC_NAME', 'Склад');
  oqAdd.SetVariable('pFC_NAME', null);
  oqAdd.SetVariable('pFC_SYNONIM',null);
  oqAdd.SetVariable('pFC_NAME_REP',null);
  oqAdd.SetVariable('pFK_ID',null);
  oqAdd.Execute;
  acRefresh.Execute;

  dmMain.odsSklad.Locate('FK_ID', oqAdd.GetVariable('pFK_ID'), []);
end;
//------------------------------------------------------------------------------
procedure TfrmSklad.acCloseExecute(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TfrmSklad.acRefreshExecute(Sender: TObject);
begin
  dmMain.odsSklad.Close;
  dmMain.odsSklad.Open;
end;
//------------------------------------------------------------------------------
procedure TfrmSklad.FormCreate(Sender: TObject);
begin
  acRefresh.Execute;
end;

end.
