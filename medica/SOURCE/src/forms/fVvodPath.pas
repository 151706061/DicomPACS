unit fVvodPath;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fDictAncestor, Db, OracleData, Menus, JvFormPlacement, ImgList, ActnList,
  dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, ToolWin, ExtCtrls,
  dxExEdtr, dxEdLib, dxDBELib, dxEditor, StdCtrls, JvComponentBase;

type
  TfrmVvodPath = class(TfrmDictAncestor)
    odsBrws: TOracleDataSet;
    odsBrwsFK_ID: TFloatField;
    odsBrwsFC_NAME: TStringField;
    odsBrwsFK_SMIDID: TIntegerField;
    odsBrwsFN_PRICE: TFloatField;
    odsBrwsFL_PROCCAB: TIntegerField;
    odsBrwsFC_PROCCAB: TStringField;
    grBrwsFK_ID: TdxDBGridMaskColumn;
    grBrwsFC_NAME: TdxDBGridMaskColumn;
    grBrwsFC_PROCCAB: TdxDBGridMaskColumn;
    cbProcCab: TdxDBCheckEdit;
    deName: TdxDBEdit;
    lbName: TLabel;
    procedure acSaveExecute(Sender: TObject);
    procedure acInsExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    function ValidValues: Boolean; override;
  end;

var
  frmVvodPath: TfrmVvodPath;

procedure DoShowVvodPath;


implementation

uses fdmMain, fMainForm, HtmlHlp;

procedure DoShowVvodPath;
begin
  frmMain.CreateChild(TfrmVvodPath, frmVvodPath);
  frmVvodPath.Show;
end;

{$R *.DFM}

procedure TfrmVvodPath.acSaveExecute(Sender: TObject);
begin
  if ValidValues then
  begin
    inherited;
    acRefresh.Execute;
  end;
end;

function TfrmVvodPath.ValidValues: Boolean;
begin
  Result := False;
  if not ValidateControl(deName) then Exit;
  Result := True;
end;

procedure TfrmVvodPath.acInsExecute(Sender: TObject);
begin
  inherited;
  odsBrws.FieldByName('FL_PROCCAB').AsInteger := 0;
end;

procedure TfrmVvodPath.acRefreshExecute(Sender: TObject);
var Id: Integer;
begin
  //переопределил потому что глюкавило
  Id := odsBrws.FieldByName('FK_ID').AsInteger;
  odsBrws.Close;
  odsBrws.Open;
  odsBrws.Locate('FK_ID',Id,[]);
end;

function TfrmVvodPath.FormHelp(Command: Word; Data: Integer;
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
