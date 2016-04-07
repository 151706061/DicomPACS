unit fAddEditRep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, ActnList,
  dxBar, cxClasses, ExtCtrls, cxControls, cxContainer, cxEdit, cxLabel,
  cxGraphics, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, DB, OracleData, cxSpinEdit,
  dxSkinOffice2007Green;

type
  TfrmAddEditRep = class(TForm)
    dxBM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    actlst1: TActionList;
    actOk: TAction;
    actCancel: TAction;
    dxBMBar1: TdxBar;
    bbOK: TdxBarButton;
    bbCancel: TdxBarButton;
    pnl1: TPanel;
    cxLabel1: TcxLabel;
    cxForma: TcxLookupComboBox;
    dsForma: TDataSource;
    odsForma: TOracleDataSet;
    cxLabel2: TcxLabel;
    cxTable: TcxLookupComboBox;
    odsTable: TOracleDataSet;
    dsTable: TDataSource;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxSpinEdit1: TcxSpinEdit;
    cxSpinEdit2: TcxSpinEdit;
    procedure actCancelExecute(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditRep: TfrmAddEditRep;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmAddEditRep.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditRep.actOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmAddEditRep.FormCreate(Sender: TObject);
begin
  if odsForma.Active = False then
    odsForma.Open;
  if odsTable.Active = False then
    odsTable.Open;
end;

end.

