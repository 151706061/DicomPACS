unit uOnkoUchetParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Oracle, OracleData, DB, cxGraphics, ImgList, dxBar, dxBarExtItems,
  cxClasses, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxControls, cxContainer, cxEdit, cxLabel;

type
  TfrmOnkoUchetParam = class(TForm)
    odsDiag: TOracleDataSet;
    cxLabel20: TcxLabel;
    lcbDiag: TcxLookupComboBox;
    BM: TdxBarManager;
    BMMainBar: TdxBar;
    tbtSave: TdxBarLargeButton;
    tbtCancel: TdxBarLargeButton;
    IL24: TcxImageList;
    dsDiag: TDataSource;

    constructor Create(AOwner: TComponent; AOS: TOracleSession; APacID: Integer); reintroduce; overload;
    procedure tbtSaveClick(Sender: TObject);
    procedure tbtCancelClick(Sender: TObject);
  private
    { Private declarations }

    OS: TOracleSession;
    nPacID: Integer;

  public
    { Public declarations }

    function GetDiagID(): integer;
  end;

var
  frmOnkoUchetParam: TfrmOnkoUchetParam;

implementation

{$R *.dfm}

//------------------------------------------------------------------------------
constructor TfrmOnkoUchetParam.Create(AOwner: TComponent; AOS: TOracleSession; APacID: Integer);
var
  i: integer;

begin
  inherited Create(AOwner);

  { установка сессии }
  OS := AOS;

  for i := 0 to ComponentCount - 1 do begin
    if (Components[i].ClassName = 'TOracleDataSet') then begin
      (Components[i] as TOracleDataSet).Session := OS;
    end else
    if (Components[i].ClassName = 'TOracleQuery') then begin
      (Components[i] as TOracleQuery).Session := OS;
    end;
  end;
  {/ установка сессии }

  nPacID := APacID;


  odsDiag.Close;
  odsDiag.SetVariable('pfk_pacid', nPacID);
  odsDiag.Open;
  odsDiag.First;
  lcbDiag.EditValue := odsDiag.FieldByName('fk_id').AsInteger;


end;

//------------------------------------------------------------------------------
procedure TfrmOnkoUchetParam.tbtCancelClick(Sender: TObject);
begin
  Self.ModalResult := mrCancel;
end;

//------------------------------------------------------------------------------
procedure TfrmOnkoUchetParam.tbtSaveClick(Sender: TObject);
begin
  Self.ModalResult := mrOk;
end;

//------------------------------------------------------------------------------
function TfrmOnkoUchetParam.GetDiagID(): integer;
begin
  Result := lcbDiag.EditValue;
end;

end.
