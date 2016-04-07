unit fPeriodOsm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxControls, cxContainer, cxEdit, cxLabel, cxGraphics,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, DB,
  OracleData, ActnList, dxSkinsCore, dxSkinOffice2007Green;

type
  TfrmSetPeriodOsm = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    odsPeriod: TOracleDataSet;
    dsPeriod: TDataSource;
    cxPeriod: TcxLookupComboBox;
    al: TActionList;
    aOK: TAction;
    aCancel: TAction;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetPeriodOsm: TfrmSetPeriodOsm;

implementation

uses fMain;

{$R *.dfm}

procedure TfrmSetPeriodOsm.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetPeriodOsm.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetPeriodOsm.FormCreate(Sender: TObject);
var ods : TOracleDataSet;
begin
  if odsPeriod.Active = False then
    odsPeriod.Active := True;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_ID '+#13+
                    '   FROM asu.TSMID '+#13+
                    '  WHERE FK_OWNER = (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''XRAY_PERIOD_OSMOTROV'') AND FK_DEFAULT = 1 ';
    ods.Open;
    cxPeriod.EditValue := ods.FieldByName('fk_id').AsInteger;
  finally
    ods.Free;
  end;  
end;

end.
