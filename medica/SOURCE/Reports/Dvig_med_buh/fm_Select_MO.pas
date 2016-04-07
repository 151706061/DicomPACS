unit fm_Select_MO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fGetPeriod, cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Menus, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, DB, OracleData;

type
  TfmSelect_MO = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ActionList1: TActionList;
    acOk: TAction;
    acCancel: TAction;
    cxLookupComboBox1: TcxLookupComboBox;
    odsSpecMO: TOracleDataSet;
    procedure acOkExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxLookupComboBox1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    LastText : string;
  end;

  function DoShowSelectMO_str(aFC_MO : string) : string;
  function DoShowSelectMO_str2(const aFC_MO : string; var aSpec : string) : string;

implementation

{$R *.dfm}

function DoShowSelectMO_str(aFC_MO : string) : string;
var fmSelect_MO: TfmSelect_MO;
begin
  Application.CreateForm( TfmSelect_MO, fmSelect_MO );
  try
    if fmSelect_MO.ShowModal = mrOK then
    begin
      if fmSelect_MO.cxLookupComboBox1.EditText = '' then
        Result := fmSelect_MO.LastText
      else
        Result := fmSelect_MO.cxLookupComboBox1.EditText;
    end
    else
      Result := aFC_MO;
  finally
    fmSelect_MO.Free;
  end;
end;

function DoShowSelectMO_str2(const aFC_MO : string; var aSpec : string) : string;
var fmSelect_MO: TfmSelect_MO;
begin
  Application.CreateForm( TfmSelect_MO, fmSelect_MO );
  try
    if fmSelect_MO.ShowModal = mrOK then
    begin
      if fmSelect_MO.cxLookupComboBox1.EditText = '' then
        Result := fmSelect_MO.LastText
      else
        Result := fmSelect_MO.cxLookupComboBox1.EditText;

      fmSelect_MO.odsSpecMO.SetVariable('moid', fmSelect_MO.cxLookupComboBox1.EditValue);
      fmSelect_MO.odsSpecMO.Open;
      aSpec := fmSelect_MO.odsSpecMO.FieldByName('fc_spec').AsString;
    end
    else
      Result := aFC_MO;
  finally
    fmSelect_MO.Free;
  end;
end;

procedure TfmSelect_MO.acOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfmSelect_MO.acCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmSelect_MO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrNone then acCancel.Execute;
end;

procedure TfmSelect_MO.cxLookupComboBox1PropertiesChange(Sender: TObject);
begin
  if cxLookupComboBox1.Text <> '' then
    LastText := cxLookupComboBox1.Text;
end;

end.
