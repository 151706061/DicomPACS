unit fEdIzmEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, JvFormPlacement, StdCtrls, JvComponentBase,
  Variants;

type
  TfrmEdIzmEdit = class(TForm)
    FormStorage: TJvFormStorage;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    al: TActionList;
    acSave: TAction;
    acAdd: TAction;
    acCancel: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    edName: TEdit;
    edOKEI: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    acRlsHelp: TAction;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    procedure acSaveExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure acRlsHelpExecute(Sender: TObject);
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

function DoShowEdIzmEdit(pID: Integer): Boolean;
var
  frmEdIzmEdit: TfrmEdIzmEdit;

implementation

uses fmainform, fEdIzm, fdmMain, fRlsDragForms;

{$R *.DFM}

{********************************************************************************************************}
{        DoShowEdIzmEdit
{********************************************************************************************************}

function DoShowEdIzmEdit(pID: Integer): Boolean;
begin
  Application.CreateForm(TfrmEdIzmEdit, frmEdIzmEdit);
  try
    frmEdIzmEdit.nID := pID;
    Result := frmEdIzmEdit.ShowModal = mrOk;
  finally
    frmEdIzmEdit.free;
  end;
end;

{********************************************************************************************************}
{        TfrmEdIzmEdit.acSaveExecute
{********************************************************************************************************}

procedure TfrmEdIzmEdit.acSaveExecute(Sender: TObject);
begin
  if DoSave then begin
    ModalResult := mrOk;
  end;
end;

{********************************************************************************************************}
{        TfrmEdIzmEdit.SetnID
{********************************************************************************************************}

procedure TfrmEdIzmEdit.SetnID(const Value: Integer);
var
  edNameText  : Variant;
  edOKEIText  : Variant;
  RlsDrugForm : Variant;
begin
  FnID := Value;
  if Value <> -1 then begin
    dmMain.pkgEdIzm.GETBYID(nID, edNameText, edOKEIText,RlsDrugForm);
    //    frmEdIzm.op.CallProcedure('GetByID', [nID, edName.Text, edOKEI.Text]);
    edName.Text := edNameText;
    edName.Tag := fdmMain.nvl(RlsDrugForm,-1);
    edOKEI.Text := edOKEIText;
  end
  else begin
    edName.Text := '';
    edName.Tag := -1;
    edOKEI.Text := '';
  end;
  //  edName.SetFocus;
end;



{********************************************************************************************************}
{        TfrmEdIzmEdit.acAddExecute
{********************************************************************************************************}

procedure TfrmEdIzmEdit.acAddExecute(Sender: TObject);
begin
  DoSave;
  nID := -1;
end;

{********************************************************************************************************}
{        TfrmEdIzmEdit.acCancelExecute
{********************************************************************************************************}

procedure TfrmEdIzmEdit.acCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

{********************************************************************************************************}
{        TfrmEdIzmEdit.DoSave
{********************************************************************************************************}

function TfrmEdIzmEdit.DoSave: boolean;
var RlsKod : Variant;
begin
  if edName.Text = '' then begin
    windows.MessageBox(Handle, 'Обязательно ввести название измерения!', 'Ошибка', MB_OK + MB_ICONERROR);
    edName.SetFocus;
    result := FALSE;
    Exit;
  end;

  if edName.Tag = -1 then RlsKod := null
  else RlsKod := edName.Tag;

  dmMain.pkgEdIzm.DOSET(edName.Text, edOKEI.Text,RlsKod, nID);
  //  frmEdIzm.op.CallProcedure('DoSet', [edName.Text, edOKEI.Text, nID]);
  dmMain.os.Commit;
  result := TRUE;
end;

procedure TfrmEdIzmEdit.acRlsHelpExecute(Sender: TObject);
var frmRlsDragForms : TfrmRlsDragForms;
begin
  frmRlsDragForms :=  TfrmRlsDragForms.Create(nil);
  try
    if frmRlsDragForms.ShowModal = mrOk then
    begin
      edName.Text := frmRlsDragForms.odsDrugForms.FieldByName('fc_name').AsString;
      edName.Tag := frmRlsDragForms.odsDrugForms.FieldByName('fk_id').AsInteger;
    end;
  finally
    frmRlsDragForms.Free;
  end;
end;

procedure TfrmEdIzmEdit.FormCreate(Sender: TObject);
begin
// автоматически определяем длину ограничения на поле Воронов О.А. 25.08.2008
  edName.MaxLength := dmMain.GetFieldLength('med', 'TEI', 'FC_NAME');
end;

end.
