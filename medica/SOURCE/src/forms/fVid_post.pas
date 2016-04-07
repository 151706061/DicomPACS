unit fVid_post;

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
  TfrmVid_post = class(TForm)
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

procedure DoShowVidPost;
var
  frmVid_post: TfrmVid_post;

implementation

uses fmainform, fdmMain, Variants;

{$R *.DFM}
//------------------------------------------------------------------------------
procedure DoShowVidPost;
begin
  frmMain.CreateChild(TfrmVid_post, frmVid_post);
  frmVid_post.Show;
end;
//------------------------------------------------------------------------------
procedure TfrmVid_post.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree;
end;
//------------------------------------------------------------------------------
procedure TfrmVid_post.acDelExecute(Sender: TObject);
begin
  if windows.MessageBox(Handle, 'Вы действительно хотите удалить этот вид поступления?', 'Подвердите действие', MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
    try
      oqDel.SetVariable('pFK_ID', dmMain.odsVid_post.fieldByName('FK_ID').AsInteger);
      oqDel.Execute;
		except
			windows.MessageBox(Handle, 'Невозможно удалить этот вид поступления. Он уже задействован', 'Ошибка', MB_OK + MB_ICONERROR)
		end;
  end;
  acRefresh.Execute; 
end;
//------------------------------------------------------------------------------
procedure TfrmVid_post.acAddExecute(Sender: TObject);
begin
  oqAdd.SetVariable('pFC_NAME', null);
  oqAdd.SetVariable('pFK_ID',null);
  oqAdd.Execute;
  acRefresh.Execute;

  dmMain.odsVid_post.Locate('FK_ID', oqAdd.GetVariable('pFK_ID'), []);
end;
//------------------------------------------------------------------------------
procedure TfrmVid_post.acCloseExecute(Sender: TObject);
begin
  dmMain.odsVid_post.CommitUpdates;
  Close;
end;
//------------------------------------------------------------------------------
procedure TfrmVid_post.acRefreshExecute(Sender: TObject);
begin
  dmMain.odsVid_post.Close;
  dmMain.odsVid_post.Open;
end;
//------------------------------------------------------------------------------
procedure TfrmVid_post.FormCreate(Sender: TObject);
begin
  acRefresh.Execute;
end;

end.
