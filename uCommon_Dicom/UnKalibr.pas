unit UnKalibr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, cxControls, cxContainer, cxEdit, cxLabel, dxSkinBlack,
  dxSkinOffice2007Green, cxTextEdit, cxMaskEdit, cxCheckBox, cxDropDownEdit,
  cxSpinEdit, StdCtrls, ExtCtrls, Menus, cxLookAndFeelPainters, ActnList,
  cxButtons, dxSkinOffice2007Black, Medotrade;

type
  TfrmKalibr = class(TForm)
    Panel1: TPanel;
    cxLabel4: TcxLabel;
    cxSpinEdit1: TcxSpinEdit;
    cxLabel1: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxLabel2: TcxLabel;
    Panel2: TPanel;
    bOk: TcxButton;
    bCancel: TcxButton;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    cxLabel3: TcxLabel;
    cbToSeria: TcxCheckBox;
    procedure cxSpinEdit1PropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    v_length_line ,
    v_scale : Double ;
  end;

var
  frmKalibr: TfrmKalibr;

implementation

Uses Math;

{$R *.dfm}

procedure clc;
begin
  frmKalibr.v_scale := RoundTo ( StrToFloat(frmKalibr.cxSpinEdit1.Text) / frmKalibr.v_length_line , -10 ) ;
  frmKalibr.cxTextEdit1.Text := FloatToStr ( frmKalibr.v_scale );
end;

procedure TfrmKalibr.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmKalibr.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmKalibr.cxSpinEdit1PropertiesChange(Sender: TObject);
begin // вставить расчет
  clc;
end;

procedure TfrmKalibr.FormCreate(Sender: TObject);
begin
  if frmKalibr.v_scale=0 then clc;
end;

end.
