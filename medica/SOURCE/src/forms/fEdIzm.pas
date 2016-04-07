unit fEdIzm;

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
  TfrmEdIzm = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
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
    cxGridList: TcxGrid;
    cxGridListDBTableView1: TcxGridDBTableView;
    cxGridListDBTableView1_FC_NAME: TcxGridDBColumn;
    cxGridListDBTableView1_EIID: TcxGridDBColumn;
    cxGridListDBTableView1_FK_RLSDRUGFORM: TcxGridDBColumn;
    cxGridListLevel1: TcxGridLevel;
    cxGridListDBTableView1_FC_OKEI: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure odsEIAfterOpen(DataSet: TDataSet);
    procedure acDelExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoShowEdIzm;
var
  frmEdIzm: TfrmEdIzm;

implementation

uses fmainform, fEdIzmEdit, fdmMain;

{$R *.DFM}

{********************************************************************************************************}
{        DoShowEdIzm
{********************************************************************************************************}

procedure DoShowEdIzm;
begin
  frmMain.CreateChild(TfrmEdIzm, frmEdIzm);
  frmEdIzm.odsEIAfterOpen(dmMain.odsEI);
  frmEdIzm.Show;
end;

{********************************************************************************************************}
{        TfrmEdIzm.FormClose
{********************************************************************************************************}

procedure TfrmEdIzm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmEdIzm.FormCreate(Sender: TObject);
begin
  acAdd.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_RIGHT_EDT_EI', 0) = 0)
          or ((dmMain.ConfigParams.GetParamValue('FUNC_USE_RIGHT_EDT_EI', 0) = 1) and dmMain.ConfigParams.GetParamValue('FUNC_RIGHT_EDT_EI', False) );
end;

{********************************************************************************************************}
{        TfrmEdIzm.odsListAfterOpen
{********************************************************************************************************}

procedure TfrmEdIzm.odsEIAfterOpen(DataSet: TDataSet);
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
{        TfrmEdIzm.acDelExecute
{********************************************************************************************************}

procedure TfrmEdIzm.acDelExecute(Sender: TObject);
begin
  if windows.MessageBoxEx(Handle, 'Вы действительно хотите удалить эту единицу измерения?', 'Подвердите действие', MB_YESNO + MB_ICONQUESTION,$0419 {Russian}) = mrYes then begin
    try
      dmMain.pkgEdIzm.DODELCASCADE(dmMain.odsEI.fieldByName('EIID').AsInteger);
		except
			windows.MessageBox(Handle, 'Невозможно удалить эту единицу измерения, есть наименования с этой единицей измерения!!!', 'Ошибка', MB_OK + MB_ICONERROR)
		end;
		//    .FieldValues['FK_ID']);
    //      op.CallProcedure('DoDel', [dmMain.odsEI.FieldValues['FK_ID']]);
  end;
  //  dmMain.os.Commit;
  dmMain.odsEI.Close;
  dmMain.odsEI.Open;  


{	if windows.MessageBox(Handle, 'Вы действительно хотите удалить эту единицу измерения?', 'Подвердите действие', MB_YESNO + MB_ICONQUESTION) = mrYes then begin
		try
			dmMain.pkgEdIzm.DODELCASCADE(dmMain.odsEIEIID.AsInteger);
		except
			on E: EoracleError do begin
				if E.ErrorCode = 02292 then
					windows.MessageBox(Handle, 'Невозможно удалить эту единицу измерения, есть медикаменты с этой единицей измерения!!!', 'Ошибка', MB_OK + MB_ICONERROR)
				else
					raise;
			end;
			on E: Exception do
				raise;
		end;
		//    .FieldValues['FK_ID']);
				//      op.CallProcedure('DoDel', [dmMain.odsEI.FieldValues['FK_ID']]);
	end;
	//  dmMain.os.Commit;
	RefreshQuery(dmMain.odsEI);}
end;

{********************************************************************************************************}
{        TfrmEdIzm.acEditExecute
{********************************************************************************************************}

procedure TfrmEdIzm.acEditExecute(Sender: TObject);
begin
  if DoShowEdIzmEdit(dmMain.odsEI.FieldByName('EIID').AsInteger) then
    acRefresh.Execute;
end;

{********************************************************************************************************}
{        TfrmEdIzm.acAddExecute
{********************************************************************************************************}

procedure TfrmEdIzm.acAddExecute(Sender: TObject);
begin
  if DoShowEdIzmEdit(-1) then
    acRefresh.Execute;
end;

{********************************************************************************************************}
{        TfrmEdIzm.acCloseExecute
{********************************************************************************************************}

procedure TfrmEdIzm.acCloseExecute(Sender: TObject);
begin
  Close;
end;

{********************************************************************************************************}
{        TfrmEdIzm.acRefreshExecute
{********************************************************************************************************}

procedure TfrmEdIzm.acRefreshExecute(Sender: TObject);
var
  fCurId : Integer;
begin
  if dmMain.odsEI.Active then
    fCurId := dmMain.odsEI.FieldByName('EIID').AsInteger
  else
    fCurId := -1;

  try
    dmMain.odsEI.DisableControls;
    dmMain.odsEI.Close;
    dmMain.odsEI.Open;
  finally
    dmMain.odsEI.EnableControls;
  end;

  if fCurId > 0 then
    dmMain.odsEI.Locate( 'EIID',fCurId, [] );
end;

function TfrmEdIzm.FormHelp(Command: Word; Data: Integer;
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
