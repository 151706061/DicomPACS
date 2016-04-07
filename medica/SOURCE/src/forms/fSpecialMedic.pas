unit fSpecialMedic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fDictAncestor, Db, OracleData, StdCtrls, Menus, JvFormPlacement, ImgList,
  ActnList, ExtCtrls, ComCtrls, ToolWin, JvComponentBase, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxContainer, cxTextEdit, cxMaskEdit, cxButtonEdit, cxDBEdit, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter;

type
  TfrmSpecialMedic = class(TfrmDictAncestor)
    odsBrws: TOracleDataSet;
    lbName: TLabel;
    deName: TcxDBButtonEdit;
    grBrws_DBTableViewFC_NAME: TcxGridDBColumn;
    grBrws_DBTableViewFK_ID: TcxGridDBColumn;
    procedure deNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
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
  frmSpecialMedic: TfrmSpecialMedic;

procedure DoShowSpecialMedic;

implementation

uses fdmMain, fMainForm, fInputMemo, JvDBUtils, HtmlHlp;

{$R *.DFM}

procedure DoShowSpecialMedic;
begin
  frmMain.CreateChild(TfrmSpecialMedic, frmSpecialMedic);
  frmSpecialMedic.Show;
end;

procedure TfrmSpecialMedic.deNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  with TcxDBButtonEdit(Sender) do
  begin
    DataBinding.DataSource.DataSet.Edit;
    DataBinding.DataSource.DataSet.FieldByName(DataBinding.DataField).AsString := Remove1310(GetMemoText(Text,
      TControl(Sender),ReadOnly));
    DataBinding.DataSource.DataSet.Post;      
    SelectAll;
  end;
end;

procedure TfrmSpecialMedic.acSaveExecute(Sender: TObject);
begin
  if ValidValues then
  begin
    inherited;
    dmMain.odsNarco.Close;
    dmMain.odsNarco.Open;    
  end;
end;

function TfrmSpecialMedic.ValidValues: Boolean;
begin
  Result := False;
  if not ValidateControl(deName) then Exit;
  Result := True;
end;

function TfrmSpecialMedic.FormHelp(Command: Word; Data: Integer;
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
