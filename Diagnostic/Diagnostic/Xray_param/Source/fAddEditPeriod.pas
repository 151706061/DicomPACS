unit fAddEditPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, cxClasses,
  ExtCtrls, ActnList, cxMaskEdit, cxSpinEdit, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxLabel, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TfrmAddEditPeriod = class(TForm)
    Panel1: TPanel;
    alOkCancel: TActionList;
    aSave: TAction;
    aCancel: TAction;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxNamePeriod: TcxTextEdit;
    cxKolvoDays: TcxSpinEdit;
    cxKolvoMon: TcxSpinEdit;
    cxLabel4: TcxLabel;
    Panel2: TPanel;
    bCancel: TcxButton;
    bOk: TcxButton;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditPeriod: TfrmAddEditPeriod;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmAddEditPeriod.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditPeriod.aSaveExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
