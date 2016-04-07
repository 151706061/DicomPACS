unit fUchGrEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, JvFormPlacement, StdCtrls, DBCtrls,
  JvComponentBase;

type
  TfrmUchGrEdit = class(TForm)
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
    Label1: TLabel;
    Label2: TLabel;
    lcbType: TDBLookupComboBox;
    procedure acSaveExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure cbTypeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbTypeKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure DoShowUchGrEdit(pID: Integer);
var
  frmUchGrEdit: TfrmUchGrEdit;

implementation

uses fmainform, fdmMain;

{$R *.DFM}

{********************************************************************************************************}
{        DoShowUchGrEdit
{********************************************************************************************************}

procedure DoShowUchGrEdit(pID: Integer);
begin
  Application.CreateForm(TfrmUchGrEdit, frmUchGrEdit);
  frmUchGrEdit.nID := pID;
  frmUchGrEdit.ShowModal;
  frmUchGrEdit.free;
end;

{********************************************************************************************************}
{        TfrmUchGrEdit.acSaveExecute
{********************************************************************************************************}

procedure TfrmUchGrEdit.acSaveExecute(Sender: TObject);
begin
  if DoSave then begin
    Close;
  end;
end;

{********************************************************************************************************}
{        TfrmUchGrEdit.SetnID
{********************************************************************************************************}

procedure TfrmUchGrEdit.SetnID(const Value: Integer);
var
  edNameText: string;
  nMat: double;
begin
  FnID := Value;
  if Value <> -1 then begin
    dmMain.pkgUchGR.GETBYID(nID, edNameText, nMat);
    edName.Text := edNameText;
    lcbType.KeyValue := Integer(Round(nMat));
//    edmat.Checked := round(nMat) = 1;
  end
  else begin
    edName.Text := '';
    lcbType.KeyValue := -1;
  end;
end;

{********************************************************************************************************}
{        TfrmUchGrEdit.acAddExecute
{********************************************************************************************************}

procedure TfrmUchGrEdit.acAddExecute(Sender: TObject);
begin
  DoSave;
  nID := -1;
  dmMain.odsUchGr.Close;
  dmMain.odsUchGr.Open;
  
  edName.SetFocus;
end;

{********************************************************************************************************}
{        TfrmUchGrEdit.acCancelExecute
{********************************************************************************************************}

procedure TfrmUchGrEdit.acCancelExecute(Sender: TObject);
begin
  Close;
end;

{********************************************************************************************************}
{        TfrmUchGrEdit.DoSave
{********************************************************************************************************}

function TfrmUchGrEdit.DoSave: boolean;
begin
  if edName.Text = '' then begin
	windows.MessageBox(Handle, 'Обязательно ввести название группы!', 'Ошибка', MB_OK + MB_ICONERROR);
	edName.SetFocus;
    result := FALSE;
    Exit;
  end;
  //  frmUchGr.op.CallProcedure('DoSet', [edName.Text, edFullName.Text, n, nID]);
  dmMain.pkgUchGR.DOSET(edName.text, lcbType.KeyValue, nID);
  dmMain.os.Commit;
  result := TRUE;
end;

procedure TfrmUchGrEdit.cbTypeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then Key := 0;
end;

procedure TfrmUchGrEdit.cbTypeKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key <> #27) and (Key <> #13) then Key := #0;
end;

procedure TfrmUchGrEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  lcbType.CloseUp(False);
end;

procedure TfrmUchGrEdit.FormCreate(Sender: TObject);
begin
  edName.MaxLength := dmMain.GetFieldLength('med', 'TUCHGR', 'FC_UCHGR');
end;

end.
