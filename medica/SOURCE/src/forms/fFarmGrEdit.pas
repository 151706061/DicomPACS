unit fFarmGrEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, JvFormPlacement, StdCtrls, Buttons, ExtCtrls,
  JvComponentBase;

type
  TfrmFarmGrEdit = class(TForm)
    FormStorage: TJvFormStorage;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ActionList1: TActionList;
    acSave: TAction;
    acAdd: TAction;
    acCancel: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    aEqual: TAction;
    paNames: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edName: TEdit;
    bbEqual: TBitBtn;
    paDescription: TPanel;
    GroupBox1: TGroupBox;
    meRlsDescription: TMemo;
    bbChoseRlsFarmGroup: TBitBtn;
    procedure acSaveExecute(Sender: TObject);
    procedure edNameExit(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure aEqualExecute(Sender: TObject);
    procedure edRlsNameChange(Sender: TObject);
    procedure bbChoseRlsFarmGroupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FnID: Integer;
    procedure SetnID(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    function DoSave: boolean;
    property nID: Integer read FnID write SetnID;
  end;

procedure DoShowFarmGrEdit(pID: Integer);
var
  frmFarmGrEdit     : TfrmFarmGrEdit;

implementation

uses fmainform, fdmMain, fRlsFarmGroup;

{$R *.DFM}

{********************************************************************************************************}
{        DoShowFarmGrEdit
{********************************************************************************************************}

procedure DoShowFarmGrEdit(pID: Integer);
begin
  Application.CreateForm(TfrmFarmGrEdit, frmFarmGrEdit);
  frmFarmGrEdit.nID := pID;
  frmFarmGrEdit.ShowModal;
  frmFarmGrEdit.free;
end;

{********************************************************************************************************}
{        TfrmFarmGrEdit.acSaveExecute
{********************************************************************************************************}

procedure TfrmFarmGrEdit.acSaveExecute(Sender: TObject);
begin
  if DoSave then
    begin
      Close;
    end;
end;

{********************************************************************************************************}
{        TfrmFarmGrEdit.SetnID
{********************************************************************************************************}

procedure TfrmFarmGrEdit.SetnID(const Value: Integer);
var
  edFullNameText    : string;
begin
  FnID := Value;
  if Value <> -1 then
    begin
      //    frmFarmGr.op.CallProcedure('GetByID', [nID, edName.Text, edFullName.Text]);
      dmMain.PKGFARMGR.GETBYID(nID, edFullNameText);
      edName.Text := edFullNameText;
      //    edFullName.Text:=frmFarmGr.op.GetParameter(2);
      if not dmMain.odsFarmGr.FieldByName('FK_FRMGR_RLS').IsNull then
      begin
        bbChoseRlsFarmGroup.Tag := dmMain.odsFarmGr.FieldByName('FK_FRMGR_RLS').AsInteger;
        bbChoseRlsFarmGroup.Caption := dmMain.odsFarmGr.FieldByName('fc_name').AsString + ' >>';
      end;
      meRlsDescription.Text := dmMain.odsFarmGr.FieldByName('description').AsString;
    end
  else
    begin
      edName.Text := '';
      bbChoseRlsFarmGroup.Caption := 'Справочник фарм групп РЛС >>';
      meRlsDescription.Text := '';
      //    edFullName.Text:= '';
    end;
  //  edName.SetFocus;
  edRlsNameChange(nil);//включить доступность заравнивания если трэба
end;

procedure TfrmFarmGrEdit.edNameExit(Sender: TObject);
begin

end;

{********************************************************************************************************}
{        TfrmFarmGrEdit.acAddExecute
{********************************************************************************************************}

procedure TfrmFarmGrEdit.acAddExecute(Sender: TObject);
begin
  DoSave;
  nID := -1;
  edName.SetFocus;
end;

{********************************************************************************************************}
{        TfrmFarmGrEdit.acCancelExecute
{********************************************************************************************************}

procedure TfrmFarmGrEdit.acCancelExecute(Sender: TObject);
begin
  Close;
end;

{********************************************************************************************************}
{        TfrmFarmGrEdit.DoSave
{********************************************************************************************************}

function TfrmFarmGrEdit.DoSave: boolean;
begin
  if edName.Text = '' then
    begin
      windows.MessageBox(Handle, 'Обязательно ввести название группы!',
        'Ошибка', MB_OK + MB_ICONERROR);
      edName.SetFocus;
      result := FALSE;
      Exit;
    end;
  //  frmFarmGr.op.CallProcedure('DoSet', [edName.Text, edFullName.Text, nID]);
  //в тэг пишется id рлс фарм группы
  dmMain.PKGFARMGR.DOSET(edName.Text, nID, bbChoseRlsFarmGroup.Tag);
  dmMain.os.Commit;
  result := TRUE;
end;

procedure TfrmFarmGrEdit.aEqualExecute(Sender: TObject);
begin
  edName.Text := StringReplace(bbChoseRlsFarmGroup.Caption,' >>','',[]);
end;

procedure TfrmFarmGrEdit.edRlsNameChange(Sender: TObject);
begin
  aEqual.Enabled := (edName.Text <> StringReplace(bbChoseRlsFarmGroup.Caption,' >>','',[])) and
    (bbChoseRlsFarmGroup.Caption <> 'Справочник фарм групп РЛС >>');
end;


procedure TfrmFarmGrEdit.bbChoseRlsFarmGroupClick(Sender: TObject);
begin
  with TfrmRlsFarmGroup.Create(Self,dmMain.odsFarmGr.FieldByName('FK_FRMGR_RLS').AsInteger) do
  try
    if ShowModal = mrOk then
    begin
      Self.bbChoseRlsFarmGroup.Caption := odsRlsFarmGroups.FieldByName('FC_NAME').AsString + ' >>';
      Self.bbChoseRlsFarmGroup.Hint := odsRlsFarmGroups.FieldByName('FC_NAME').AsString;
      Self.bbChoseRlsFarmGroup.Tag := odsRlsFarmGroups.FieldByName('FK_ID').AsInteger;
      Self.meRlsDescription.Text := odsRlsFarmGroups.FieldByName('DESCRIPTION').AsString;
      edRlsNameChange(nil);//включить доступность заравнивания если трэба
    end;
  finally
    Free;
  end;
end;

procedure TfrmFarmGrEdit.FormCreate(Sender: TObject);
begin
// автоматически определяем длину ограничения на поле Воронов О.А. 25.08.2008
  edName.MaxLength := dmMain.GetFieldLength('med', 'TFARMGR', 'FC_FARMGR');
end;

end.

