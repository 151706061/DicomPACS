unit fdlgSetRaschet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls, ActnList, JvComponentBase,
  JvFormPlacement, dxSkinCaramel, dxSkinCoffee, dxSkinOffice2007Green;

type
  TdlgSetRaschet = class(TForm)
    al: TActionList;
    aNo: TAction;
    JvFormStorage1: TJvFormStorage;
    Panel1: TPanel;
    lbCap: TcxLabel;
    cxButton3: TcxButton;
    Panel2: TPanel;
    bEnter: TcxButton;
    cxButton1: TcxButton;
    procedure bEnterClick(Sender: TObject);
    procedure aNoExecute(Sender: TObject);
    procedure cxButton3MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dlgSetRaschet: TdlgSetRaschet;

implementation

{$R *.dfm}

procedure TdlgSetRaschet.aNoExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TdlgSetRaschet.bEnterClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TdlgSetRaschet.cxButton3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TdlgSetRaschet.FormShow(Sender: TObject);
begin
  bEnter.SetFocus;
end;

end.
