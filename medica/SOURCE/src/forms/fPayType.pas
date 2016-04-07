unit fPayType;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fDictAncestor, Db, OracleData, Menus, JvFormPlacement, ImgList, ActnList,
  dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, ToolWin, ExtCtrls,
  dxEditor, dxEdLib, dxDBELib, StdCtrls, dxExEdtr, JvComponentBase;

type
  TfrmPayType = class(TfrmDictAncestor)
    odsBrws: TOracleDataSet;
    odsBrwsFK_ID: TIntegerField;
    odsBrwsFC_NAME: TStringField;
    grBrwsFK_ID: TdxDBGridMaskColumn;
    grBrwsFC_NAME: TdxDBGridMaskColumn;
    lbName: TLabel;
    deName: TdxDBEdit;
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
  frmPayType: TfrmPayType;

procedure DoShowPayType;

implementation

uses fdmMain, fMainForm, JvDBUtils, HtmlHlp;

{$R *.DFM}

procedure DoShowPayType;
begin
  frmMain.CreateChild(TfrmPayType, frmPayType);
  frmPayType.Show;
end;

{ TfrmPayType }

function TfrmPayType.ValidValues: Boolean;
begin
  Result := False;
  if not ValidateControl(deName) then Exit;
  Result := True;
end;

procedure TfrmPayType.acSaveExecute(Sender: TObject);
begin
  if ValidValues then
  begin
    inherited;
    dmMain.odsMedicPayType.Close;
    dmMain.odsMedicPayType.Open;    
  end;
end;

function TfrmPayType.FormHelp(Command: Word; Data: Integer;
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
