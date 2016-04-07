unit fGetMOGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DB, OracleData;

type
  TfrmGetMOGroup = class(TForm)
    lcbMO_GROUP: TcxLookupComboBox;
    dsGroupMo: TDataSource;
    procedure lcbMO_GROUPPropertiesCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGetMOGroup: TfrmGetMOGroup;

function ShowMoGROUP(aX,aY : integer; aodsMO_GROUP : TOracleDataset; var aMOGRoupID : integer; var aFC_MOGROUP : string) : integer;

implementation

{$R *.dfm}

function ShowMoGROUP(aX,aY : integer; aodsMO_GROUP : TOracleDataset; var aMOGRoupID : integer; var aFC_MOGROUP : string) : integer;
begin
  Application.CreateForm(TfrmGetMOGroup,  frmGetMOGroup);
  frmGetMOGroup.Left := aX;
  frmGetMOGroup.Top  := aY;
  if aodsMO_GROUP.Active = False then
    aodsMO_GROUP.Open;
  frmGetMOGroup.dsGroupMo.DataSet := aodsMO_GROUP;
  frmGetMOGroup.lcbMO_GROUP.EditValue := aMOGRoupID;
  Result := frmGetMOGroup.ShowModal;
  if Result = mrOK then
  begin
    aMOGRoupID  := frmGetMOGroup.lcbMO_GROUP.EditValue;
    aFC_MOGROUP := frmGetMOGroup.lcbMO_GROUP.Text;
  end;
  frmGetMOGroup.Free;
end;


procedure TfrmGetMOGroup.lcbMO_GROUPPropertiesCloseUp(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
