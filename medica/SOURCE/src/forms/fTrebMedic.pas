unit fTrebMedic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, dxCntner, dxEditor, dxExEdtr, dxEdLib, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, ToolWin, Db, OracleData;

type
  TTrebMedic = Record
    MedicId : Integer;
    Kol     : Double;
  end;

  TfrmTrebMedic = class(TForm)
    al: TActionList;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    Panel1: TPanel;
    deMedicName: TEdit;
    Label5: TLabel;
    Label1: TLabel;
    deEdIzm: TEdit;
    Label3: TLabel;
    seKol: TdxSpinEdit;
    acSave: TAction;
    acClose: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    acSelect: TAction;
    bbMedicName: TBitBtn;
    procedure acSaveExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure seKolChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure acSelectExecute(Sender: TObject);
  private
    FnMedicId: Integer;
    procedure SetnMedicId(const Value: Integer);
    { Private declarations }
  public
    property nMedicId: Integer read FnMedicId write SetnMedicId;
    { Public declarations }
  end;

//function DoShowTrebMedic(nId : Integer): TTrebMedic;
//var
//  frmTrebMedic: TfrmTrebMedic;

implementation

uses fdmMain, fMedic;

{$R *.DFM}

//function DoShowTrebMedic(nId : Integer): TTrebMedic;
//var frmTrebMedic: TfrmTrebMedic;
//begin
//  // Добавление nId = -1
//  frmTrebMedic := TfrmTrebMedic.Create(Application);
//  try
////    nMedicId := nId;
//    ShowModal;
//  finally
//    frmTrebMedic.Free;
//  end;
//end;

procedure TfrmTrebMedic.acSaveExecute(Sender: TObject);
begin
  if nMedicId = 0 then
  begin
    MessageBox(Self.Handle, PChar('Не выбран медикамент!'), 'Ошибка', MB_OK + mb_iconerror);
    bbMedicName.SetFocus;
    exit;
  end;
  if seKol.Value = 0 then
  begin
    MessageBox(Self.Handle, PChar('Не задано количество медикамента!'), 'Ошибка', MB_OK + mb_iconerror);
    seKol.SetFocus;
    exit;
  end;
  ModalResult := mrOk;
end;

procedure TfrmTrebMedic.acCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmTrebMedic.seKolChange(Sender: TObject);
begin
  if TdxSpinEdit(Sender).Value < 0 then
    TdxSpinEdit(Sender).Value := 0;
end;

procedure TfrmTrebMedic.FormActivate(Sender: TObject);
begin
  if nMedicId = 0 then
    acSelectExecute(nil)
  else
    seKol.SetFocus;
end;

procedure TfrmTrebMedic.SetnMedicId(const Value: Integer);
begin
  FnMedicId := Value;
  deMedicName.Text := dmMain.pkgMedic.Getnamebyid(Value);
  deMedicName.SelLength := 0;
  deMedicName.SelStart := 0;
  deMedicName.Hint := dmMain.pkgMedic.Getnamebyid(Value);
  deEdizm.Text := dmMain.pkgMedic.Getedizmname(Value);
end;

procedure TfrmTrebMedic.acSelectExecute(Sender: TObject);
begin
  nMedicId := DoShowMedic(nMedicId);
  if nMedicId > 0 then seKol.SetFocus;
end;

end.
