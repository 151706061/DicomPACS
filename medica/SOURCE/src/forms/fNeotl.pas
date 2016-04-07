unit fNeotl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  JvFormPlacement, ImgList, ActnList, ComCtrls, ToolWin, Oracle, ExtCtrls, Db,
  OracleData, StdCtrls, htmlHlp, JvComponentBase, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxMaskEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGridLevel,
  cxGrid, DBCtrls, cxSpinEdit;

type
  TfrmNeotlozh = class(TForm)
    fsNeotlozh: TJvFormStorage;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    alNeotlizh: TActionList;
    ilNeotlozh: TImageList;
    acAdd: TAction;
    ToolButton1: TToolButton;
    acDel: TAction;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    acUpdate: TAction;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    acClose: TAction;
    acSave: TAction;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    acCancel: TAction;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    acRefresh: TAction;
    Panel1: TPanel;
    odsList: TOracleDataSet;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    dsList: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1MEDICID: TcxGridDBColumn;
    cxGrid1DBTableView1FC_MEDIC: TcxGridDBColumn;
    cxGrid1DBTableView1COLVO: TcxGridDBColumn;
    cxGrid1DBTableView1FC_EDIZM: TcxGridDBColumn;
    odsGroupMo: TOracleDataSet;
    dsGroupMo: TDataSource;
    lcbMO_GROUP: TDBLookupComboBox;
    oqAdd: TOracleQuery;
    oqEdit: TOracleQuery;
    oqDel: TOracleQuery;
    cxGrid1DBTableView1fn_border: TcxGridDBColumn;
    procedure acAddExecute(Sender: TObject);
    procedure acDelExecute(Sender: TObject);
    procedure acUpdateExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acCloseExecute(Sender: TObject);
    procedure acSaveExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure alNeotlizhUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure odsmoAfterScroll(DataSet: TDataSet);
    procedure dbListDblClick(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer; var CallHelp: Boolean): Boolean;
    procedure os_AfterLogOn(Sender: TOracleSession);
    procedure cxGrid1DBTableView1EditChanged(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
    procedure cxGrid1DBTableView1COLVOPropertiesEditValueChanged(
      Sender: TObject);
    procedure cxGrid1Exit(Sender: TObject);
    procedure odsListAfterScroll(DataSet: TDataSet);
  private
    FGROUP_MO: Integer;
//    lastmoid: integer;
    procedure UpdateButtons;
  public
    id: integer;
    { Public declarations }
  end;

procedure DoShowNeotlozh(aGROUP_MO: integer = -1);

var
	frmNeotlozh: TfrmNeotlozh;

implementation

uses fdmMain,fmainform, JvDBUtils, PKGMEDSES, fMedic;

{$R *.DFM}

procedure DoShowNeotlozh(aGROUP_MO: integer = -1);
var
  i : Integer;
begin
  i := 0;
  while (i < frmMain.MDIChildCount)and(frmMain.MDIChildren[i].Name <> 'frmNeotlozh') do
    Inc( i );

  if (i >= frmMain.MDIChildCount) then // проверка на присутствие окна - если оно уже было создано, просто делаем его активным
    frmMain.CreateChild(TfrmNeotlozh, frmNeotlozh)
  else
    frmMain.MDIChildren[i].BringToFront;


//	frmNeotlozh.os.Savepoint('neotl');
	fdmMain.dmMain.os.Savepoint('neotl');
//  frmNeotlozh.lastmoid := frmNeotlozh.op.CallIntegerFunction('get_curmo', []);
  if aGROUP_MO > 0 then begin
//    frmNeotlozh.op.CallProcedure('set_curmo', [moid]);
		frmNeotlozh.lcbMO_GROUP.KeyValue := aGROUP_MO;
    frmNeotlozh.lcbMO_GROUP.Enabled := false;
    frmNeotlozh.FGROUP_MO := aGROUP_MO;
    frmNeotlozh.UpdateButtons;
	end
  else begin
    frmNeotlozh.odsGroupMo.Close;
    frmNeotlozh.odsGroupMo.Open;
    frmNeotlozh.lcbMO_GROUP.KeyValue := dmMain.FK_CurMO_GROUP; //pkgMedSes.GET_CUR_MOGROUP_BY_CUR_MO;
    frmNeotlozh.odsGroupMo.locate('GROUPID',frmNeotlozh.lcbMO_GROUP.KeyValue,[]);
//    frmNeotlozh.lemo.LookupKeyValue := frmNeotlozh.odsmo.FieldByName('moid').AsInteger;
  end;
  frmNeotlozh.Show;
end;

procedure TfrmNeotlozh.acAddExecute(Sender: TObject);
var
  MedicId : Integer;
begin
//  if DoShowAddMedic(odsmo.FieldByName('moid').AsInteger, os) = mrOk then


//  if DoShowAddMedic(lcbMO_GROUP.KeyValue, fdmMain.dmMain.os) = mrOk then

  if odsList.State = dsEdit then odsList.Post;
  if (odsList.Active)and(odsList.RecordCount > 0 ) then
    MedicId := odsList.FieldByName('MEDICID').AsInteger
  else
    MedicId := -1; 

  MedicId := DoShowMedic(MedicId, True, '', False, False, '', 'Список объектов учета', dmMain.CurMO_SKLAD_ID);

  if MedicId > 0 then
  begin
    oqAdd.SetVariable('aGROUP_MO', lcbMO_GROUP.KeyValue);
    oqAdd.SetVariable('medicid', MedicId);
    oqAdd.SetVariable('colvo', 0);
    oqAdd.Execute;

    acRefresh.Execute;
    odsList.Locate('medicid',MedicId,[]);
    acSave.Enabled := true;
    acCancel.Enabled := true;
  end;
end;

procedure TfrmNeotlozh.acDelExecute(Sender: TObject);
begin
  if Application.MessageBox('Вы действительно хотите удалить выбранный медикамент ?', 'Подтверждение', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then Exit;
  
  if odsList.RecNo<>odsList.RecordCount then //после удаления переходим на след. или пред. медикамент
  begin
    odsList.next;
    id:=odsList.fieldbyname('medicid').AsInteger;
    odsList.prior;
  end
  else
  begin
    odsList.Prior;
    id:=odsList.fieldbyname('medicid').AsInteger;
    odsList.Next;
  end;
//    DoDeleteMedic(odsList.FieldByName('id').AsInteger, fdmMain.dmMain.os);

    oqDel.SetVariable('pid', odsList.FieldByName('id').AsInteger);
    oqDel.Execute;
    acRefresh.Execute;
    odsList.Locate('medicid',id,[]);
    acSave.Enabled := true;
    acCancel.Enabled := true;
end;

procedure TfrmNeotlozh.acUpdateExecute(Sender: TObject);
var
  MedicId : Integer;
begin
//  if DoShowUpdMedic(fdmMain.dmMain.os, odsList.FieldByName('medicid').AsInteger,
//       odsList.FieldByName('colvo').asFloat,
//       odsList.FieldByName('id').AsInteger) = mrOk then

  MedicId := DoShowMedic( odsList.FieldByName('medicid').AsInteger, True, '', False, False, '', 'Список объектов учета', dmMain.CurMO_SKLAD_ID);
  if MedicId > 0 then
  begin
    oqEdit.SetVariable('pid', odsList.FieldByName('id').AsInteger);
    oqEdit.SetVariable('medicid', MedicId);
    oqEdit.SetVariable('colvo', odsList.FieldByName('colvo').AsFloat);
    oqEdit.Execute;
    acRefresh.Execute;
//    odsList.Locate('medicid',id,[]);
    acSave.Enabled := true;
    acCancel.Enabled := true;
  end;
end;

procedure TfrmNeotlozh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  op.CallProcedure('set_curmo', [lastmoid]);
  frmMain.tbMinZapas.ImageIndex := 51;
  Action := caFree;
end;

procedure TfrmNeotlozh.acCloseExecute(Sender: TObject);
var
  i: integer;
begin
  if acSave.Enabled then begin
    i := Application.MessageBox('Вы хотите сохранить изменения ?', 'Вопрос',
           MB_YESNOCANCEL + MB_ICONQUESTION + mb_defbutton3);
    if i = IDYES then begin
      acSave.Execute;
      Self.Close;
    end;
    if i = IDNO then begin
      acCancel.Execute;
      Self.Close;
    end;
    if i = IDCANCEL then begin
      exit;
    end;
  end
  else
    Self.Close;
end;

procedure TfrmNeotlozh.acSaveExecute(Sender: TObject);
begin
  odsListAfterScroll(nil);
  fdmMain.dmMain.os.Commit;
  fdmMain.dmMain.os.Savepoint('neotl');
  acRefresh.Execute;
  acSave.Enabled := false;
  acCancel.Enabled := false;
end;

procedure TfrmNeotlozh.acCancelExecute(Sender: TObject);
begin
  try
    fdmMain.dmMain.os.RollbackToSavepoint('neotl');
    fdmMain.dmMain.os.Savepoint('neotl');
  except
  end;  
  acRefresh.Execute;
  acSave.Enabled := false;
  acCancel.Enabled := false;
end;

procedure TfrmNeotlozh.acRefreshExecute(Sender: TObject);
begin
//  RefreshQuery(odsList);
  odsList.Close;
  odsList.Open;
end;

procedure TfrmNeotlozh.UpdateButtons;
begin
  if FGROUP_MO > 0 then begin
    acAdd.Enabled := false;
    acUpdate.Enabled := false;
    acDel.Enabled := false;
  end
  else begin
    acAdd.Enabled := true;
    acUpdate.Enabled := true;
    acDel.Enabled := true;
  end;
end;

procedure TfrmNeotlozh.alNeotlizhUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  if odsList.RecordCount < 1 then begin
    acUpdate.Enabled := false;
    acDel.Enabled := false;
  end
  else begin
    if (FGROUP_MO <= 0) then begin
      acUpdate.Enabled := true;
      acDel.Enabled := true;
    end;
  end;
end;

procedure TfrmNeotlozh.odsmoAfterScroll(DataSet: TDataSet);
begin
//  op.CallProcedure('set_curmo', [odsmo.FieldByName('moid').AsInteger]);
  odsList.Close;
  odsList.SetVariable('GROUPID', odsGroupMo.FieldByName('GROUPID').AsInteger);
  odsList.Open;
end;

procedure TfrmNeotlozh.dbListDblClick(Sender: TObject);
begin
  acUpdate.Execute;
end;

function TfrmNeotlozh.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
	Result := False;
  try
    // TODo Подумать насчет праметра  Command
    if Data = -1 then
      HtmlHelp(0, 'Medica.chm', HH_DISPLAY_TOPIC, 0)
    else
      HtmlHelp(0, 'Medica.chm', HH_HELP_CONTEXT, Data);
    CallHelp := False;
    Result := True;
  except
    on EConvertError do
      ShowMessage('Справка не найдена');
  end;
end;

procedure TfrmNeotlozh.os_AfterLogOn(Sender: TOracleSession);
begin
//  Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
//  Sender.DBMS_Application_Info.Set_Module(ExtractFileName(Application.ExeName) + ' - ' + fdmMain.CurrentFileInfo(Application.ExeName),'');
end;

procedure TfrmNeotlozh.cxGrid1DBTableView1EditChanged( Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
  acSave.Enabled:=true;
  acCancel.Enabled:=true;
end;

procedure TfrmNeotlozh.cxGrid1DBTableView1COLVOPropertiesEditValueChanged(Sender: TObject);
begin
  odsListAfterScroll(nil);
end;

procedure TfrmNeotlozh.cxGrid1Exit(Sender: TObject);
begin
  odsListAfterScroll(nil);
end;

procedure TfrmNeotlozh.odsListAfterScroll(DataSet: TDataSet);
begin
  case odsList.State of
    dsEdit: odsList.Post; 
  end;
end;

end.
