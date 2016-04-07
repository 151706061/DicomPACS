unit fdlgPred;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls, JvComponentBase,
  JvFormPlacement, ActnList, dxSkinCaramel, dxSkinCoffee, dxSkinOffice2007Green;

type
  TdlgPred = class(TForm)
    jvFrmStor: TJvFormStorage;
    al: TActionList;
    aOK: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    lbCap: TcxLabel;
    Panel2: TPanel;
    bEnter: TcxButton;
    bCancel: TcxButton;
    cxButton3: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure cxButton3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    idJur : Integer;
    { Public declarations }
  end;

var
  dlgPred: TdlgPred;

implementation

uses fCalendar;

{$R *.dfm}

procedure TdlgPred.aCancelExecute(Sender: TObject);
begin
  close;
end;

procedure TdlgPred.aOKExecute(Sender: TObject);
begin
  close;
  Application.CreateForm(TfrmCalendar, frmCalendar);
  frmCalendar.DoShowForm(idJur);
  frmCalendar.Show;
end;

procedure TdlgPred.cxButton3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TdlgPred.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TdlgPred.FormDestroy(Sender: TObject);
begin
  dlgPred := nil;
end;

end.
