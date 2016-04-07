unit fdlgFics;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, dxSkinsCore, cxControls,
  cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, ExtCtrls, ActnList,
  JvComponentBase, JvFormPlacement, cxCheckBox, dxSkinCaramel, dxSkinCoffee,
  dxSkinOffice2007Green;

type
  TdlgFics = class(TForm)
    al: TActionList;
    aNo: TAction;
    JvFormStorage1: TJvFormStorage;
    Panel1: TPanel;
    lbCap: TcxLabel;
    cxButton3: TcxButton;
    Panel2: TPanel;
    bEnter: TcxButton;
    bCancel: TcxButton;
    b1: TcxButton;
    b2: TcxButton;
    bBagage: TcxButton;
    b3: TcxButton;
    b4: TcxButton;
    bPlace: TcxButton;
    b5: TcxButton;
    cbFree: TcxCheckBox;
    procedure bEnterClick(Sender: TObject);
    procedure bBagageClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aNoExecute(Sender: TObject);
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure bPlaceClick(Sender: TObject);
    procedure cxButton3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    pBag, pMin, pPlace : Integer;
    { Public declarations }
  end;

var
  dlgFics: TdlgFics;

implementation

uses fMain;

{$R *.dfm}

procedure TdlgFics.b1Click(Sender: TObject);
begin
  pMin := 1;
  ModalResult := mrOk;
end;

procedure TdlgFics.b2Click(Sender: TObject);
begin
  pMin := 2;
  ModalResult := mrOk;
end;

procedure TdlgFics.b3Click(Sender: TObject);
begin
  pMin := 3;
  ModalResult := mrOk;
end;

procedure TdlgFics.b4Click(Sender: TObject);
begin
  pMin := 4;
  ModalResult := mrOk;
end;

procedure TdlgFics.b5Click(Sender: TObject);
begin
  pMin := 5;
  ModalResult := mrOk;
end;

procedure TdlgFics.bEnterClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TdlgFics.bPlaceClick(Sender: TObject);
begin
  pPlace := 1;
  ModalResult := mrOk;
end;

procedure TdlgFics.cxButton3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TdlgFics.bBagageClick(Sender: TObject);
begin
  pBag := 1;
  ModalResult := mrOk;
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus;
end;

procedure TdlgFics.FormCreate(Sender: TObject);
begin
  pBag := 0;
  pMin := 0;
  pPlace := 0;
end;

procedure TdlgFics.FormShow(Sender: TObject);
begin
  bEnter.SetFocus;
end;

procedure TdlgFics.aNoExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus;
end;

end.
