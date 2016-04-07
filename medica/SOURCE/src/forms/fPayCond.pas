unit fPayCond;

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
  TfmPayCond = class(TForm)
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
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1_FK_ID: TcxGridDBColumn;
    cxGrid1DBTableView1_FC_NAME: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acDelExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure cxGrid1DBTableView1DataControllerDataChanged(
      Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoShowPayCond;
var
  fmPayCond : TfmPayCond ;

implementation

uses fmainform, fdmMain;

{$R *.DFM}

{********************************************************************************************************}
{        DoShowUchGr
{********************************************************************************************************}

procedure DoShowPayCond;
begin
  frmMain.CreateChild(TfmPayCond , fmPayCond );
  fmPayCond.Show;
end;

procedure TfmPayCond.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfmPayCond.acDelExecute(Sender: TObject);
var
  s : string;
begin
  acEdit.Checked := False;
  acEditExecute(nil);
  try
    if (Application.MessageBox('¬ы действительно хотите удалить это условие оплаты?',
                                     'ѕодтвердите действие', MB_YESNO + MB_ICONQUESTION) = IDYES) then begin

      cxGrid1DBTableView1.DataController.DeleteFocused;
      dmMain.os.Commit;
    end;
  except
    on E: EOracleError do
    begin
      s := 'Ќевозможно удалить условие оплаты "'+cxGrid1DBTableView1_FC_NAME.EditValue+'", т.к. имеютс€ принадлежащие ему приходные документы!'#13#10+
           'ƒл€ успешного удалени€, необходимо предварительно удалить все приходные документы, имеющие это условие оплаты.';
      Application.MessageBox(PChar(s),'ќшибка',MB_OK + MB_ICONERROR);
    end;
  end;
end;

procedure TfmPayCond.acEditExecute(Sender: TObject);
begin
//  cxGridListDBTableView1.OptionsData.Editing := acEdit.Checked;
  if (acEdit.Checked = False) then
  begin
   cxGrid1DBTableView1.DataController.PostEditingData;
   cxGrid1DBTableView1.DataController.Post;   
  end;
  cxGrid1DBTableView1.OptionsData.Editing := acEdit.Checked;
  tbuEdit.Down := acEdit.Checked;
  cxGrid1.SetFocus;
  cxGrid1DBTableView1_FC_NAME.Focused := True;
  if (acEdit.Checked = True) then
    cxGrid1DBTableView1_FC_NAME.Editing := true;
end;

procedure TfmPayCond.acAddExecute(Sender: TObject);
begin
// кака€-то канитель с режимом редактировани€ - нормально работает и отображаетс€ только так
  acEdit.Checked := True;
  acEditExecute(nil);
  cxGrid1DBTableView1.DataController.Insert;
  acEdit.Checked := True;
  acEditExecute(nil);
end;

procedure TfmPayCond.acCloseExecute(Sender: TObject);
begin
  acEdit.Checked := False;
  acEditExecute(nil);
  Close;
end;

procedure TfmPayCond.acRefreshExecute(Sender: TObject);
begin
  acEdit.Checked := False;
  acEditExecute(nil);
  cxGrid1DBTableView1.DataController.Refresh;
end;

function TfmPayCond.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
  Result := False;
//  try
//    // TODo ѕодумать насчет праметра  Command
//    if Data = -1 then
//      HtmlHelp(0, PChar('Medica.chm'), HH_DISPLAY_TOPIC, 0)
//    else
//      HtmlHelp(0, PChar('Medica.chm'), HH_HELP_CONTEXT, Data);
//    CallHelp := False;
//    Result := True;
//  except
//    on EConvertError do
//      ShowMessage('—правка не найдена');
//  end;
end;

procedure TfmPayCond.cxGrid1DBTableView1DataControllerDataChanged(Sender: TObject);
begin
  acDel.Enabled := (cxGrid1DBTableView1.DataController.RecordCount > 0);
end;

end.
