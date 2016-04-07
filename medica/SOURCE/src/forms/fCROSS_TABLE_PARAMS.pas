unit fCROSS_TABLE_PARAMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, JvComponentBase, JvFormPlacement,
  OracleData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, ActnList,
  ComCtrls, ToolWin, fdmMain, cxDBLookupComboBox, cxGridBandedTableView,
  cxGridDBBandedTableView;

type
  TfrmCROSS_TABLE_PARAMS = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbuAdd: TToolButton;
    tbuEdit: TToolButton;
    ToolButton4: TToolButton;
    ToolButton7: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton1: TToolButton;
    al: TActionList;
    acClose: TAction;
    acDel: TAction;
    acEdit: TAction;
    acAdd: TAction;
    acRefresh: TAction;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    odsCROSS_TABLE_PARAMS: TOracleDataSet;
    dsCROSS_TABLE_PARAMS: TDataSource;
    FormStorage: TJvFormStorage;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1_fk_id: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1_fc_cross_name: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1_fp_check_type: TcxGridDBBandedColumn;
    odsParamValueType: TOracleDataSet;
    dsParamValueType: TDataSource;
    cxGrid1DBBandedTableView1_fc_table1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1_fc_name_field1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1_fc_key_field1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1_fc_table2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1_fc_name_field2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1_fc_key_field2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1_FC_SYNONIM: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1_FC_TABLE1_COMMENT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1_FC_TABLE2_COMMENT: TcxGridDBBandedColumn;
    procedure acAddExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acDelExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure DoShowCROSS_TABLE_PARAMS;

implementation
uses Oracle;

{$R *.dfm}

procedure DoShowCROSS_TABLE_PARAMS;
var frmCROSS_TABLE_PARAMS : TfrmCROSS_TABLE_PARAMS;
begin
  frmCROSS_TABLE_PARAMS := TfrmCROSS_TABLE_PARAMS.Create( Application );
  try
    frmCROSS_TABLE_PARAMS.ShowModal;
  finally
    frmCROSS_TABLE_PARAMS.Free;
  end;
end;

procedure TfrmCROSS_TABLE_PARAMS.acAddExecute(Sender: TObject);
begin
  if (acAdd.Checked = False) then
  begin
    cxGrid1DBBandedTableView1.DataController.PostEditingData;
    cxGrid1DBBandedTableView1.DataController.Post;
  end;
  cxGrid1DBBandedTableView1.OptionsData.Editing := acAdd.Checked;
  tbuAdd.Down := acAdd.Checked;
  cxGrid1.SetFocus;
  cxGrid1DBBandedTableView1.Focused := True;
  if (acAdd.Checked = True) then
    cxGrid1DBBandedTableView1.OptionsData.Editing := True;
    cxGrid1DBBandedTableView1.DataController.Insert;
end;

procedure TfrmCROSS_TABLE_PARAMS.acCloseExecute(Sender: TObject);
begin
  acEdit.Checked := False;
  acEditExecute(nil);
  Close;
end;

procedure TfrmCROSS_TABLE_PARAMS.acDelExecute(Sender: TObject);
begin
  acEdit.Checked := False;
  acEditExecute(nil);
  acAdd.Checked := False;
  if (Application.MessageBox('Вы действительно хотите удалить эту запись?',
                                   'Подвердите действие', MB_YESNO + MB_ICONQUESTION) = IDYES) then begin

    cxGrid1DBBandedTableView1.DataController.DeleteFocused;
    dmMain.os.Commit;
  end;
end;

procedure TfrmCROSS_TABLE_PARAMS.acEditExecute(Sender: TObject);
begin
  if (acEdit.Checked = False) then
  begin
   cxGrid1DBBandedTableView1.DataController.PostEditingData;
   cxGrid1DBBandedTableView1.DataController.Post;
  end;
  cxGrid1DBBandedTableView1.OptionsData.Editing := acEdit.Checked;
  tbuEdit.Down := acEdit.Checked;
  cxGrid1.SetFocus;
  cxGrid1DBBandedTableView1.Focused := True;
  if (acEdit.Checked = True) then
    cxGrid1DBBandedTableView1.OptionsData.Editing := true;
end;


procedure TfrmCROSS_TABLE_PARAMS.acRefreshExecute(Sender: TObject);
begin
  acEdit.Checked := False;
  acEditExecute(nil);
  acAdd.Checked := False;
  cxGrid1DBBandedTableView1.DataController.Refresh;
end;

procedure TfrmCROSS_TABLE_PARAMS.FormCreate(Sender: TObject);
begin
  odsParamValueType.Open;
  odsCROSS_TABLE_PARAMS.Open;
  cxGrid1DBBandedTableView1.OptionsData.Editing := False; 
end;

end.
