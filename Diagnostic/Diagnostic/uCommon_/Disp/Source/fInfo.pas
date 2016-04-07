unit fInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, JvComponentBase, JvFormPlacement;

type
  TfrmInfo = class(TForm)
    Shape1: TShape;
    lbCap: TcxLabel;
    lbText: TcxLabel;
    bMove: TcxButton;
    jvFrmStor: TJvFormStorage;
    bClose: TcxButton;
    tClose: TTimer;
    procedure bMoveMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure lbCapMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lbTextMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure bCloseClick(Sender: TObject);
    procedure tCloseTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInfo: TfrmInfo;

implementation

uses fMain;

{$R *.dfm}

procedure TfrmInfo.bCloseClick(Sender: TObject);
begin
  close;
  frmMain.VJOURNAL_DATEIN.Focused := True;
  frmMain.grJournal.SetFocus;  
end;

procedure TfrmInfo.bMoveMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TfrmInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmInfo.FormDestroy(Sender: TObject);
begin
  frmInfo := nil;
end;

procedure TfrmInfo.lbCapMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  close;
end;

procedure TfrmInfo.lbTextMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  close;
end;

procedure TfrmInfo.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  close;
end;

procedure TfrmInfo.tCloseTimer(Sender: TObject);
begin
  close;
end;

end.
