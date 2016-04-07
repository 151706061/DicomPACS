unit fMOinGroup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Db, OracleData,
  ActnList, Oracle, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxMaskEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGridLevel, cxGrid, cxCheckBox;

type
  TfrmMOinGroup = class(TForm)
    al: TActionList;
    acClose: TAction;
    acDel: TAction;
    acEdit: TAction;
    acAdd: TAction;
    acRefresh: TAction;
    acShowColumnEditor: TAction;
    dsMO: TDataSource;
    odsMO: TOracleDataSet;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbuAdd: TToolButton;
    tbuChange: TToolButton;
    tbuDel: TToolButton;
    ToolButton7: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton1: TToolButton;
    oqDel: TOracleQuery;
    tbuSelect: TToolButton;
    acSelect: TAction;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1FK_ID: TcxGridDBColumn;
    cxGrid1DBTableView1FC_GROUP: TcxGridDBColumn;
    cxGrid1DBTableView1FC_NAME: TcxGridDBColumn;
    oqSetCurMOGroup: TOracleQuery;
    cxGrid1DBTableView1FL_CUR_MOGROUP: TcxGridDBColumn;
    procedure acCloseExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acAddExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acDelExecute(Sender: TObject);
    procedure acSelectExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshAndLocate(LocateID: Integer);
    procedure SelectMOInGroup();
  end;

var
  frmMOinGroup: TfrmMOinGroup;


implementation
uses fdmMain, fEditMOinGroup, fMainForm, variants;
{$R *.DFM}

procedure TfrmMOinGroup.RefreshAndLocate(LocateID: Integer);
begin
  if LocateID > 0 then
    with odsMO do
    begin
      Close;
      Open;
      Locate('fk_id', LocateID, []);
    end;
end;

procedure TfrmMOinGroup.acCloseExecute(Sender: TObject);
begin
  ModalResult := mrOk;
  CLose;
end;

procedure TfrmMOinGroup.acRefreshExecute(Sender: TObject);
begin
  odsMo.CLose;
  odsMo.Open;
end;

procedure TfrmMOinGroup.FormActivate(Sender: TObject);
begin
  odsMO.Open;
end;

procedure TfrmMOinGroup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmMOinGroup.acAddExecute(Sender: TObject);
begin
  with TfrmEditMoinGroup.Create(Self) do
    RefreshAndLocate(ShowFrm);

  oqSetCurMOGroup.SetVariable('pfk_MO', odsMO.FieldByName('fk_mo').AsInteger);
  oqSetCurMOGroup.Execute;
  DoSetCaption; // на всякий случай, вдруг удалили текущую группу
end;

procedure TfrmMOinGroup.acEditExecute(Sender: TObject);
begin
  with TfrmEditMoinGroup.Create(Self) do
    RefreshAndLocate(ShowFrm(Self.odsMO.FieldByName('FK_ID').AsInteger));


  oqSetCurMOGroup.SetVariable('pfk_MO', odsMO.FieldByName('fk_mo').AsInteger);
  oqSetCurMOGroup.Execute;
  DoSetCaption; // на всякий случай, вдруг изменили текущую группу    
end;

procedure TfrmMOinGroup.acDelExecute(Sender: TObject);
var
  old_moid : Integer;
begin
  if MessageBoxEx(Self.Handle, 'Вы действительно хотите удалить МО из группы?', 'Требуется подтверждение!', MB_ICONQUESTION or MB_YESNO,$0419 {Russian}) = idNO
    then Exit;
  old_moid := odsMO.FieldByName('fk_mo').AsInteger;
  oqDel.SetVariable('pfk_id', odsMO.FieldByName('fk_id').AsInteger);
  oqDel.Execute;
  dmMain.os.Commit;

  oqSetCurMOGroup.SetVariable('pfk_MO', old_moid);
  oqSetCurMOGroup.Execute;

  odsMO.Close;
  odsMO.Open;

  DoSetCaption; // на всякий случай, вдруг удалили текущую группу
end;

procedure TfrmMOinGroup.acSelectExecute(Sender: TObject);
var
  orQuery : TOracleQuery;
  MO_GROUPID : Integer;
begin
  if  odsMO.Eof then Exit else MO_GROUPID := odsMO.FieldByName('fk_group').AsInteger;

  orQuery := TOracleQuery.Create( Self );
  orQuery.Session := dmMain.os;

  orQuery.DeclareAndSet('pMO_GROUPID', otInteger, MO_GROUPID);
  orQuery.SQL.Text :=  'begin'#13#10+
                       '  UPDATE MED.TMO SET TMO.fk_curmogroupid = :pMO_GROUPID WHERE TMO.moid = MED.PKG_MEDSES.GET_CURMO;'#13#10+
                       '  med.PKG_MEDSES.set_curmo_group(:pMO_GROUPID);'#13#10+
                       'end;';
  orQuery.Execute;
  orQuery.Session.Commit;
  orQuery.Free;
  DoSetCaption;  // обновляем наименование группы мат. отв. в заголовке главной формы
  Close;
end;

procedure TfrmMOinGroup.SelectMOInGroup();
var
  CurMO : Integer;
  orQuery : TOracleQuery;
begin
  tbuSelect.Visible := True;
  tbuAdd.Visible    := False;
  tbuChange.Visible := False;
  tbuDel.Visible    := False;

  CurMO := Round(dmMain.pkgMedSes.GETCURMO);
  odsMO.Close;
  odsMO.SetVariable('CurMOID', CurMO);
//  odsMO.SQL.Text := 'SELECT MIG.FK_ID, '+
//                    '       MIG.fk_group, '+
//                    '       MG.FC_GROUP, '+
//                    '        M.FC_NAME   '+
//                    '       FROM MED.TMO_IN_GROUP MIG, '+
//                    '            MED.TMO_GROUP MG, '+
//                    '            MED.TMO M '+
//                    '       WHERE MG.FL_DEL = 0 '+
//                    '       AND MIG.FL_DEL = 0 '+
//                    '       AND MG.GROUPID = MIG.FK_GROUP '+
//                    '       AND M.MOID = MIG.FK_MO '+
//                    '       AND M.MOID = '+IntToStr(CurMO)+
//                    'ORDER BY FC_NAME ';
  odsMO.Open;
// выставляем курсор на ранее выбранной группе
  orQuery := TOracleQuery.Create( Self );
  orQuery.Session := odsMO.Session;
  orQuery.SQL.Text := 'select mogr.FK_ID FROM MED.TMO_IN_GROUP mogr, MED.TMO where TMO.moid = '+IntToStr(CurMO)+' and mogr.FK_MO = TMO.moid and mogr.fk_group = TMO.fk_curmogroupid';
  orQuery.Execute;
  if not orQuery.Eof then odsMO.Locate('FK_ID', orQuery.FieldAsInteger(0), []);
  orQuery.Free;

  if odsMO.Eof then
  begin
    case frmMain.ProvisorState of
      1: Application.MessageBox('Для Вас не назначена ни одна из групп материально ответственных лиц.'#13#10+    // провизор
                                'Для назначения себе необходимых групп, воспользутесь пунктом главного меню :'#13#10+
                                'Настройки => Группы МО', 'Внимание', MB_OK+MB_ICONINFORMATION);
      0: Application.MessageBox('Для Вас не назначена ни одна из групп материально ответственных лиц.'#13#10+    // медсестра
                                'Обратитесь к провизору для внесения Вас в необходимые группы.', 'Внимание', MB_OK+MB_ICONINFORMATION);
    end; // case frmMain.ProvisorState of
  end;
end; // if  frmMOinGroup.odsMO.Eof then

procedure TfrmMOinGroup.FormCreate(Sender: TObject);
begin
  odsMO.SetVariable('CurMOID', null);
end;

end.

