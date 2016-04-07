unit fFarmGr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, Db, OracleData, Grids,
  JvFormPlacement, Oracle, JvDBUtils, HtmlHlp,
  JvComponentBase, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid;

type
  TfrmFarmGr = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ActionList1: TActionList;
    acClose: TAction;
    acDel: TAction;
    acEdit: TAction;
    acAdd: TAction;
    acRefresh: TAction;
    ToolButton5: TToolButton; 
    FormStorage: TJvFormStorage;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    cxGridList: TcxGrid;
    cxGridListDBTableView1: TcxGridDBTableView;
    cxGridListDBTableView1_FC_FARMGR: TcxGridDBColumn;
    cxGridListDBTableView1_FC_NAME: TcxGridDBColumn;
    cxGridListDBTableView1_FARMGRID: TcxGridDBColumn;
    cxGridListLevel1: TcxGridLevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure odsFarmGrAfterOpen(DataSet: TDataSet);
    procedure acDelExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoShowFarmGr;
var
  frmFarmGr         : TfrmFarmGr;

implementation

uses fFarmGrEdit, fdmMain, fMainForm;
{$R *.DFM}

{********************************************************************************************************}
{        DoShowFarmGr
{********************************************************************************************************}

procedure DoShowFarmGr;
begin
  frmMain.CreateChild(TfrmFarmGr, frmFarmGr);
  frmFarmGr.Show;
  frmFarmGr.acRefresh.Execute;
end;

{********************************************************************************************************}
{        TfrmFarmGr.FormClose
{********************************************************************************************************}

procedure TfrmFarmGr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree;
end;

{********************************************************************************************************}
{        TfrmFarmGr.odsListAfterOpen
{********************************************************************************************************}

procedure TfrmFarmGr.odsFarmGrAfterOpen(DataSet: TDataSet);
begin
  if DataSet.RecordCount = 0 then
    begin
      acDel.Enabled := FALSE;
      acEdit.Enabled := FALSE;
    end
  else
    begin
      acDel.Enabled := TRUE;
      acEdit.Enabled := TRUE;
    end;
end;

{********************************************************************************************************}
{        TfrmFarmGr.acDelExecute
{********************************************************************************************************}

procedure TfrmFarmGr.acDelExecute(Sender: TObject);
begin
  if windows.MessageBox(Handle,
    'Вы действительно хотите удалить эту фармакологическую группу?',
    'Подврдите действие', MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      dmMain.PKGFARMGR.DODELCASCADE(dmMain.odsFarmGr.FieldByName('FARMGRID').AsInteger);
      //    dmMain.os.Commit;
      //    frmMain.os.Commit;
      dmMain.odsFarmGr.Close;
      dmMain.odsFarmGr.Open;      
    end;
end;

{********************************************************************************************************}
{        TfrmFarmGr.acEditExecute
{********************************************************************************************************}

procedure TfrmFarmGr.acEditExecute(Sender: TObject);
begin
  DoShowFarmGrEdit(dmMain.odsFarmGr.FieldByName('FARMGRID').AsInteger);
  //  odsList.FieldValues['FK_ID']);
  acRefresh.Execute;
end;

{********************************************************************************************************}
{        TfrmFarmGr.acAddExecute
{********************************************************************************************************}

procedure TfrmFarmGr.acAddExecute(Sender: TObject);
begin
  DoShowFarmGrEdit(-1);
  acRefresh.Execute;
end;

{********************************************************************************************************}
{        TfrmFarmGr.acCloseExecute
{********************************************************************************************************}

procedure TfrmFarmGr.acCloseExecute(Sender: TObject);
begin
  Close;
end;

{********************************************************************************************************}
{        TfrmFarmGr.acRefreshExecute
{********************************************************************************************************}

procedure TfrmFarmGr.acRefreshExecute(Sender: TObject);
//var fkid : Integer;
begin
//* sill  RefreshQuery(dmMain.odsFarmGr);
  dmMain.odsFarmGr.Close;
  dmMain.odsFarmGr.Open;  
//  fkid := dmMain.odsFarmGr.fieldByName('FARMGRID').AsInteger;
//  dmMain.odsFarmGr.Close;
//  dmMain.odsFarmGr.Open;
//  if dmMain.odsFarmGr.LookUp('FARMGRID',fkid,'FARMGRID') > -1 then
//    dmMain.odsFarmGr.Locate('FARMGRID',fkid,[]);
//-
end;

function TfrmFarmGr.FormHelp(Command: Word; Data: Integer;
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

