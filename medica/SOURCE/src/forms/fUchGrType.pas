unit fUchGrType;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fDictAncestor, Db, OracleData, dxCntner, dxEditor, dxEdLib, dxDBELib,
  StdCtrls, dxTL, dxDBCtrl, dxDBGrid, Menus, JvFormPlacement, ImgList, ActnList,
  ExtCtrls, ComCtrls, ToolWin, HtmlHlp, dxExEdtr, JvComponentBase,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfrmUchGrType = class(TfrmDictAncestor)
    odsBrws: TOracleDataSet;
    odsBrwsFK_ID: TIntegerField;
    odsBrwsFC_NAME: TStringField;
    grBrwsFK_ID: TdxDBGridMaskColumn;
    grBrwsFC_NAME: TdxDBGridMaskColumn;
    deName: TdxDBEdit;
    lbName: TLabel;
    procedure acSaveExecute(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
  private
    { Private declarations }
  public
    function ValidValues: Boolean; override;
    { Public declarations }
  end;

var
  frmUchGrType: TfrmUchGrType;

procedure DoShowUchGrType;

implementation

uses fdmMain, fMainForm, JvDBUtils;

{$R *.DFM}

procedure DoShowUchGrType;
begin
  frmMain.CreateChild(TfrmUchGrType, frmUchGrType);
  frmUchGrType.Show;
end;

{ TfrmUchGrType }

function TfrmUchGrType.ValidValues: Boolean;
begin
  Result := False;
  if not ValidateControl(deName) then Exit;
  Result := True;
end;

procedure TfrmUchGrType.acSaveExecute(Sender: TObject);
begin
  if ValidValues then
  begin
    inherited;
    dmMain.odsUchGrType.Close;
    dmMain.odsUchGrType.Open;    
  end;
end;

function TfrmUchGrType.FormHelp(Command: Word; Data: Integer;
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
