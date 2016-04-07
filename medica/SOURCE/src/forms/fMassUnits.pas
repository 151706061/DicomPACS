unit fMassUnits;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fDictAncestor, Oracle, Db, Menus, JvFormPlacement, ImgList, ActnList,
  ComCtrls, ToolWin, ExtCtrls, OracleData,
  StdCtrls, JvComponentBase,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxContainer, cxTextEdit, cxDBEdit, cxMaskEdit, cxSpinEdit;

type
  TfrmMassUnits = class(TfrmDictAncestor)
    odsBrws: TOracleDataSet;
    lbFullName: TLabel;
    lbBreifName: TLabel;
    grBrws_DBTableViewFC_SHORTNAME: TcxGridDBColumn;
    grBrws_DBTableViewFC_FULLNAME: TcxGridDBColumn;
    grBrws_DBTableViewFK_ID: TcxGridDBColumn;
    deBreifName: TcxDBTextEdit;
    deFullName: TcxDBTextEdit;
    grBrws_DBTableViewFN_ORDER: TcxGridDBColumn;
    Label1: TLabel;
    deOrder: TcxDBSpinEdit;
    procedure acSaveExecute(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ValidValues: Boolean; override;
  end;

var
  frmMassUnits: TfrmMassUnits;

procedure DoShowMassUnits;

implementation

uses fdmMain, fMainForm, JvDBUtils, HtmlHlp;

{$R *.DFM}

procedure DoShowMassUnits;
begin
	frmMain.CreateChild(TfrmMassUnits, frmMassUnits);
//  frmMassUnits.Show;
end;

{ TfrmDozkaUnits }

function TfrmMassUnits.ValidValues: Boolean;
begin
  Result := False;
  if not ValidateControl(deBreifName) then Exit;
  if not ValidateControl(deFullName) then Exit; 
  if not ValidateControl(deOrder) then Exit;
  Result := True;
end;

procedure TfrmMassUnits.acSaveExecute(Sender: TObject);
begin
  if ValidValues then
  begin
    inherited;
    dmMain.odsMassUnits.Close;
    dmMain.odsMassUnits.Open;        
  end;
end;

function TfrmMassUnits.FormHelp(Command: Word; Data: Integer;
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

procedure TfrmMassUnits.FormCreate(Sender: TObject);
begin
  inherited;
  deBreifName.Properties.MaxLength := dmMain.GetFieldLength('med', 'TMASSUNITS', 'FC_SHORTNAME');
  deFullName.Properties.MaxLength  := dmMain.GetFieldLength('med', 'TMASSUNITS', 'FC_FULLNAME');
end;

end.
