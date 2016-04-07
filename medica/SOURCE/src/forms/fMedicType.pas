unit fMedictype;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fDictAncestor, Menus, Db, JvFormPlacement, ImgList, ActnList, dxCntner, dxTL,
  dxDBCtrl, dxDBGrid, ComCtrls, ToolWin, ExtCtrls, dxDBTLCl, dxGrClms,
  OracleData, dxExEdtr, dxEdLib, dxDBELib, dxEditor, dxExGrEd, dxExELib,
  dxDBEdtr, DBCtrls, StdCtrls, JvComponentBase;

type
  TfrmMedictype = class(TfrmDictAncestor)
    odsBrws: TOracleDataSet;
    odsBrwsFK_ID: TIntegerField;
    odsBrwsFC_NAME: TStringField;
    odsBrwsFC_ACCOUNT: TStringField;
    odsBrwsFC_REPORTTITLE: TStringField;
    odsBrwsFK_TUCHGRTYPE: TIntegerField;
    odsBrwsFC_SMSTITLE: TStringField;
    odsBrwslkuchgrtype: TStringField;
    grBrwsFK_ID: TdxDBGridMaskColumn;
    grBrwsFC_NAME: TdxDBGridMaskColumn;
    grBrwsFC_ACCOUNT: TdxDBGridMaskColumn;
    grBrwsFC_REPORTTITLE: TdxDBGridMaskColumn;
    grBrwsFC_SMSTITLE: TdxDBGridMaskColumn;
    grBrwslkUchgrtype: TdxDBGridLookupColumn;
    lbUchGrType: TLabel;
    lcbUchGrType: TdxDBLookupEdit;
    Label3: TLabel;
    deCaption2: TdxDBButtonEdit;
    deCaption1: TdxDBButtonEdit;
    Label2: TLabel;
    deAccount: TdxDBEdit;
    Label1: TLabel;
    lbName: TLabel;
    deName: TdxDBEdit;
    procedure deCaption1ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure acSaveExecute(Sender: TObject);
    procedure acInsExecute(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    function ValidValues: Boolean; override;
  end;

var
  frmMedictype: TfrmMedictype;

procedure DoShowMedicType;

implementation

uses fdmMain, fMainForm, fInputMemo, JvDBUtils, HtmlHlp;

{$R *.DFM}

procedure DoShowMedicType;
begin
  frmMain.CreateChild(TfrmMedictype, frmMedictype);
  frmMedictype.Show;
end;


procedure TfrmMedictype.deCaption1ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  with TdxDBButtonEdit(Sender) do
  if not ReadOnly then
  begin
    DataSource.DataSet.FieldByName(DataField).AsString := Remove1310(GetMemoText(Text,
      TControl(Sender)));
    SelectAll;
  end;
//    TdxInplaceMaskEdit(Sender).Text := Remove1310(GetMemoText(TdxInplaceMaskEdit(Sender).Text,
//      TControl(Sender)));
end;

function TfrmMedictype.ValidValues: Boolean;
begin
  Result := False;
  if not ValidateControl(deName) then Exit;
  if not ValidateControl(lcbUchGrType) then Exit;
  Result := True;
end;

procedure TfrmMedictype.acSaveExecute(Sender: TObject);
begin
  if ValidValues then
  begin
    inherited;
    dmMain.odsMedicType.Close;
    dmMain.odsMedicType.Open;
  end;
end;

procedure TfrmMedictype.acInsExecute(Sender: TObject);
begin
  inherited;
  //без этой фигни если не клацнуть явно в базу шел Null
  odsBrws.FieldByName('FK_TUCHGRTYPE').AsInteger := dmMain.odsUchGrType.FieldByName('FK_ID').AsInteger;
end;

function TfrmMedictype.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
  inherited;

	  Result := False;
  try
    // TODo Подумать насчет праметра  Command
    if Data = -1 then
      HtmlHelp(0, PChar('Medica.chm'), HH_DISPLAY_TOPIC, 0)
    else
      HtmlHelp(0, PChar('Medica.chm'), HH_HELP_CONTEXT, Data);
    CallHelp := False;
    Result := True;
  except
    on EConvertError do
      ShowMessage('Справка не найдена');
  end;
end;

end.
