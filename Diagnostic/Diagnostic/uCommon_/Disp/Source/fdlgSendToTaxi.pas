unit fdlgSendToTaxi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, dxSkinCaramel, dxSkinCoffee,
  dxSkinOffice2007Green, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxLabel, ActnList, JvComponentBase,
  JvFormPlacement;

type
  TdlgSendToTaxi = class(TForm)
    JvFormStorage1: TJvFormStorage;
    al: TActionList;
    aNo: TAction;
    Panel1: TPanel;
    lbCap: TcxLabel;
    cxButton3: TcxButton;
    Panel2: TPanel;
    bEnter: TcxButton;
    bCancel: TcxButton;
    aYes: TAction;
    procedure cxButton3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure aNoExecute(Sender: TObject);
    procedure aYesExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dlgSendToTaxi: TdlgSendToTaxi;

implementation

{$R *.dfm}

procedure TdlgSendToTaxi.aNoExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TdlgSendToTaxi.aYesExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TdlgSendToTaxi.cxButton3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TdlgSendToTaxi.FormShow(Sender: TObject);
begin
  bEnter.SetFocus;
end;

end.
