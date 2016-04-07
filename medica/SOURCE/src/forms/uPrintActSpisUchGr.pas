unit uPrintActSpisUchGr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, ActnList, ComCtrls, ToolWin, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxCalendar, StdCtrls, DB, OracleData;

type
  TfPrintActSpisUchGrp = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    cbPRO: TCheckBox;
    D1: TcxDateEdit;
    D2: TcxDateEdit;
    Label3: TLabel;
    cxodsUchGrList: TcxLookupComboBox;
    al: TActionList;
    actSave: TAction;
    acesc: TAction;
    CoolBar1: TCoolBar;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    odsUchGr: TOracleDataSet;
    dsodsUchGr: TDataSource;
    lcbMO_GROUP: TcxLookupComboBox;
    Label4: TLabel;
    aodsMO_GROUP: TOracleDataSet;
    DSMatOtv: TDataSource;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    actSaveExcel: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure acescExecute(Sender: TObject);
    procedure actSaveExcelExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    aMOGroup : integer;
    vRBExcel : Boolean;
  end;

var
  fPrintActSpisUchGrp: TfPrintActSpisUchGrp;

implementation

uses fdmMain;

{$R *.dfm}

procedure TfPrintActSpisUchGrp.acescExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfPrintActSpisUchGrp.actSaveExcelExecute(Sender: TObject);
begin
  vRBExcel:=True;
  ModalResult := mrOk;
end;

procedure TfPrintActSpisUchGrp.actSaveExecute(Sender: TObject);
begin
  vRBExcel:=False;
  ModalResult := mrOk;
end;

procedure TfPrintActSpisUchGrp.FormCreate(Sender: TObject);
begin
  odsUchGr.Open;
  if not odsUchGr.eof then
    cxodsUchGrList.SelText := odsUchGr.FieldByName('FC_UCHGR').AsString;
end;

procedure TfPrintActSpisUchGrp.FormDestroy(Sender: TObject);
begin
  odsUchGr.Close;
  aodsMO_GROUP.Close;
end;

end.
