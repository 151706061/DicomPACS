unit UnDiagEdt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, Medotrade, dxSkinOffice2007Green, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxLabel, dxSkinOffice2007Black;

type
  TfrmDiagEdt = class(TForm)
    cxLabel6: TcxLabel;
    teDiagnoz: TcxTextEdit;
    bToday: TcxButton;
    cxButton1: TcxButton;
    rbOsn: TRadioButton;
    rbSop: TRadioButton;
    procedure cxButton1Click(Sender: TObject);
    procedure bTodayClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDiagEdt: TfrmDiagEdt;

implementation

{$R *.dfm}

procedure TfrmDiagEdt.bTodayClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfrmDiagEdt.cxButton1Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
