unit fm_Select_UchGr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdmMain, cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Menus, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, DB, OracleData, cxCustomData, cxStyles, cxTL, cxInplaceContainer, cxDBTL, cxTLData;

type
  TfmSelect_UchGr = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ActionList1: TActionList;
    acOk: TAction;
    acCancel: TAction;
    tlUchGr: TcxDBTreeList;
    tlUchGrFC_UCHGR: TcxDBTreeListColumn;
    peUchGr: TcxPopupEdit;
    procedure acOkExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tlUchGrDblClick(Sender: TObject);
    procedure tlUchGrKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function DoShowSelectUchGr(UchGrid : integer) : integer;

implementation

{$R *.dfm}

function DoShowSelectUchGr(UchGrid : integer) : integer;
var fmSelect_UchGr: TfmSelect_UchGr;
begin
  Application.CreateForm( TfmSelect_UchGr, fmSelect_UchGr );
  try
    fmSelect_UchGr.peUchGr.Tag := UchGrid;
    dmMain.odsUchGr.Locate('UCHGRID',UchGrid,[]);
    fmSelect_UchGr.peUchGr.Text := dmMain.odsUchGr.FieldByName('FC_UCHGR').AsString;
    if fmSelect_UchGr.ShowModal = mrOK then
    begin
      Result := fmSelect_UchGr.peUchGr.Tag;
    end
    else
      Result := -100;
  finally
    fmSelect_UchGr.Free;
  end;
end;

procedure TfmSelect_UchGr.acOkExecute(Sender: TObject);
begin
  if peUchGr.Text = '' then
  begin
    Application.MessageBox('Вы не выбрали учётную группу.', 'Ошибка', MB_OK);
    peUchGr.SetFocus;
    exit;
  end;
  ModalResult := mrOk;
end;

procedure TfmSelect_UchGr.acCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmSelect_UchGr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrNone then acCancel.Execute;
end;

procedure TfmSelect_UchGr.tlUchGrDblClick(Sender: TObject);
begin
  peUchGr.Text := dmMain.odsUchGr.FieldByName('FC_UCHGR').AsString;
  peUchGr.Tag := dmMain.odsUchGr.FieldByName('UCHGRID').AsInteger;
  peUchGr.PopupWindow.CloseUp;
end;

procedure TfmSelect_UchGr.tlUchGrKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = CHR(VK_RETURN) then
  begin
    peUchGr.Text := dmMain.odsUchGr.FieldByName('FC_UCHGR').AsString;
    peUchGr.Tag := dmMain.odsUchGr.FieldByName('UCHGRID').AsInteger;
    peUchGr.PopupWindow.CloseUp;
  end;
end;

end.
