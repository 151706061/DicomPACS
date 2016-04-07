unit fSetParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, dxSkinOffice2007Green, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit, cxLabel,
  cxGraphics, Menus, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxSpinEdit;

type
  TfrmSetParam = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    deDate: TcxDateEdit;
    seDoza: TcxSpinEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    cxLabel4: TcxLabel;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetParam: TfrmSetParam;

implementation

{$R *.dfm}

procedure TfrmSetParam.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetParam.aSaveExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
