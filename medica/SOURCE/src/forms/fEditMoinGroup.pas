unit fEditMoinGroup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ActnList, Db, OracleData, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ExtCtrls, Oracle,
  cxLookAndFeelPainters, cxGraphics, Menus;

type
  TfrmEditMoinGroup = class(TForm)
    al: TActionList;
    acSave: TAction;
    acCancel: TAction;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    ToolButton3: TToolButton;
    Panel1: TPanel;
    lcbMO: TcxLookupComboBox;
    lcbGroup: TcxLookupComboBox;
    lblMO: TLabel;
    Label1: TLabel;
    bMO: TcxButton;
    odsMO: TOracleDataSet;
    dsMO: TDataSource;
    bGroup: TcxButton;
    odsGroup: TOracleDataSet;
    dsGroup: TDataSource;
    oq: TOracleQuery;
    odsCheck: TOracleDataSet;
    acMO: TAction;
    acGroup: TAction;
    odsData: TOracleDataSet;
    oqSetCurMOGroup: TOracleQuery;
    procedure acSaveExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure acMOExecute(Sender: TObject);
    procedure acGroupExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    bEditing: Boolean;
  public
    { Public declarations }
    function ShowFrm(iId: Integer = 0): Integer;
  end;

var
  frmEditMoinGroup: TfrmEditMoinGroup;

implementation
uses fdmMain, fMO, fMOGroup;
{$R *.DFM}

function TfrmEditMoinGroup.ShowFrm(iId: Integer = 0): Integer;
begin
  if iId > 0 then
  begin
    Self.Caption := 'Изменить';
    bEditing := True;
    odsData.Close;
    odsData.SetVariable('pfk_id', iId);
    odsData.Open;
    lcbMO.EditValue := odsData.FieldByName('fk_mo').AsInteger;
    lcbGroup.EditValue := odsData.FieldByName('fk_group').AsInteger;
  end
  else
    Self.Caption := 'Добавить';
  if Self.ShowModal = mrOK then
    with oq do
    begin
      SetVariable('pfk_mo', lcbMO.EditValue);
      SetVariable('pfk_group', lcbGroup.EditValue);
      SetVariable('pfk_id', iId);
      Execute;
      Result := GetVariable('pfk_id');
      oqSetCurMOGroup.SetVariable('pfk_mo', lcbMO.EditValue);
      oqSetCurMOGroup.Execute;
      dmMain.os.Commit;
    end
  else
    Result := 0;
end;

procedure TfrmEditMoinGroup.acSaveExecute(Sender: TObject);
begin
  lcbMO.PostEditValue;
  lcbGroup.PostEditValue;
  if fdmMain.nvl(lcbMO.EditValue,0) <= 0 then
  begin
    MessageBox(Self.Handle, 'Необходимо указать материально-ответственного!', 'Внимание!', MB_ICONWARNING or MB_OK);
    lcbMO.DroppedDown := True;
    Exit;
  end;
  if fdmMain.nvl(lcbGroup.EditValue,0) <= 0 then
  begin
    MessageBox(Self.Handle, 'Необходимо указать группу!', 'Внимание!', MB_ICONWARNING or MB_OK);
    lcbGroup.DroppedDown := True;
    Exit;
  end;
  with odsCheck do
  begin
    Close;
    SetVariable('pfk_mo', lcbMO.EditValue);
    SetVariable('pfk_group', lcbGroup.EditValue);
    Open;
    if (RecordCount > 0) and ((lcbGroup.EditValue <> odsData.FieldByName('fk_group').AsInteger)
    or (lcbMO.EditValue <> odsData.FieldByName('fk_mo').AsInteger)) then
    begin
      MessageBox(Self.Handle, pChar('В группе ' + lcbGroup.Text + ' уже существует материально-ответственный ' + lcbMO.Text + '!'), 'Внимание!', MB_ICONWARNING or MB_OK);
      Exit;
    end;
  end;
  
  Modalresult := mrOk;
end;

procedure TfrmEditMoinGroup.acCancelExecute(Sender: TObject);
begin
  Modalresult := mrCancel;
end;

procedure TfrmEditMoinGroup.acMOExecute(Sender: TObject);
var iLocate: Integer;
begin
  iLocate := lcbMO.EditValue;
  DoShowMO;
  with odsMO do
  begin
    Close;
    Open;
    Locate('moid', iLocate, []);
  end;
  lcbMO.EditValue := iLocate;
end;

procedure TfrmEditMoinGroup.acGroupExecute(Sender: TObject);
var
  fMoGr : TMOGroupRec;
begin
  if DoSelectMoGroup( Self, fMoGr, fdmMain.nvl( lcbGroup.EditValue, -1 )  ) > 0 then
    lcbGroup.EditValue := fMoGr.GROUPID;    
end;

procedure TfrmEditMoinGroup.FormCreate(Sender: TObject);
begin
  odsMO.Open;
  odsGroup.Open;
  odsData.Open;
end;

end.

