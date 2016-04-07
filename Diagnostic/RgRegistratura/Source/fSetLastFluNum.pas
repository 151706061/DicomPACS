unit fSetLastFluNum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, Oracle, OracleData,
  dxSkinsCore, dxSkinOffice2007Green;

type
  TfrmSetLastFluNum = class(TForm)
    Label1: TLabel;
    lbNum: TLabel;
    Label2: TLabel;
    seLastNum: TcxSpinEdit;
    bOk: TcxButton;
    bCancel: TcxButton;
    procedure bOkClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetLastFluNum: TfrmSetLastFluNum;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetLastFluNum.bOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetLastFluNum.FormCreate(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select fc_value from asu.tsmini where fc_section = ''SET_NEW_FLU_NUM''||:PKABID ';
    ods.DeclareAndSet('PKABID', otString, IntToStr(frmMain.odsKab.FieldByName('fk_id').AsInteger));
    ods.Open;
    lbNum.Caption := ods.FieldByName('fc_value').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmSetLastFluNum.bCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
