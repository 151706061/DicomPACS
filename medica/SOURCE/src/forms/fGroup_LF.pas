unit fGroup_LF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, Db, OracleData, Grids,
  JvFormPlacement, Oracle, JvDBUtils, HtmlHlp,
  JvComponentBase, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxTextEdit, cxCheckBox;

type
  TfrmGroup_LF = class(TForm)
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
    tbuEdit: TToolButton;
    acEdit: TAction;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1FK_GROUP_LF_ID: TcxGridDBColumn;
    cxGrid1DBTableView1FC_GROUP_LF: TcxGridDBColumn;
    cxGrid1DBTableView1_FC_SYNONIM: TcxGridDBColumn;
    cxGrid1DBTableView1FL_DEL: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1FN_ORDER: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acDelExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoShowGROUP_LF;
var
  frmGroup_LF: TfrmGroup_LF;

implementation

uses fmainform, fdmMain, Variants;

{$R *.DFM}
//------------------------------------------------------------------------------
procedure DoShowGROUP_LF;
begin
  frmMain.CreateChild(TfrmGroup_LF, frmGroup_LF);
  frmGroup_LF.Show;
end;
//------------------------------------------------------------------------------
procedure TfrmGroup_LF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree;
end;
//------------------------------------------------------------------------------
procedure TfrmGroup_LF.acDelExecute(Sender: TObject);
var
  s : string;
begin
  acEdit.Checked := False;
  acEditExecute(nil);
  try
    if (Application.MessageBox('Вы действительно хотите удалить эту группу ЛФ?',
                                     'Подвердите действие', MB_YESNO + MB_ICONQUESTION) = IDYES) then begin

      cxGrid1DBTableView1.DataController.DeleteFocused;
      dmMain.os.Commit;
    end;
  except
//    on E: EOracleError do
    begin
      s := 'Невозможно удалить группу ЛФ "'+cxGrid1DBTableView1FC_GROUP_LF.EditValue+'",'#13#10+
           ' т.к. имеются принадлежащие ей медикаменты!'#13#10+
           'Для успешного удаления, необходимо предварительно удалить все медикаменты,'#13#10+
           ' имеющие эту группу ЛФ.';
      Application.MessageBox(PChar(s),'Ошибка',MB_OK + MB_ICONERROR);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfrmGroup_LF.acEditExecute(Sender: TObject);
begin
  if (acEdit.Checked = False) then
  begin
   cxGrid1DBTableView1.DataController.PostEditingData;
   cxGrid1DBTableView1.DataController.Post;
  end;
  cxGrid1DBTableView1.OptionsData.Editing := acEdit.Checked;
  tbuEdit.Down := acEdit.Checked;

  if self.Visible then
  begin
    cxGrid1.SetFocus;
    cxGrid1DBTableView1FC_GROUP_LF.Focused := True;
  end;
  if (acEdit.Checked = True) then
    cxGrid1DBTableView1FC_GROUP_LF.Editing := true;
end;
//------------------------------------------------------------------------------
procedure TfrmGroup_LF.acAddExecute(Sender: TObject);
begin
// какая-то канитель с режимом редактирования - нормально работает и отображается только так
  acEdit.Checked := True;
  acEditExecute(nil);
  cxGrid1DBTableView1.DataController.Insert;
  acEdit.Checked := True;
  acEditExecute(nil);
end;
//------------------------------------------------------------------------------
procedure TfrmGroup_LF.acCloseExecute(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TfrmGroup_LF.acRefreshExecute(Sender: TObject);
begin
  acEdit.Checked := False;
  acEditExecute(nil);
  dmMain.odsGroup_LF.Close;
  dmMain.odsGroup_LF.Open;
end;
//------------------------------------------------------------------------------
procedure TfrmGroup_LF.FormCreate(Sender: TObject);
begin
  acRefresh.Execute;
end;

end.
