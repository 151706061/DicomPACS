unit fCine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinOffice2007Green, cxTextEdit, cxMaskEdit, cxSpinEdit, cxControls,
  cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, ExtCtrls, dxBar,
  dxSkinsdxBarPainter, cxClasses, dxBarExtItems, cxBarEditItem, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Medotrade;

type
  TfrmCine = class(TForm)
    Shape1: TShape;
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbPlay: TdxBarButton;
    bbStop: TdxBarButton;
    beSpeed: TcxBarEditItem;
    bMove: TcxButton;
    bClose: TcxButton;
    bbPlayBack: TdxBarButton;
    procedure bbPlayClick(Sender: TObject);
    procedure bbStopClick(Sender: TObject);
    procedure bCloseClick(Sender: TObject);
    procedure bMoveMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure bbPlayBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCine: TfrmCine;

implementation
uses UnMultiFormsFrame;
{$R *.dfm}

procedure TfrmCine.bMoveMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TfrmCine.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmCine.FormDestroy(Sender: TObject);
begin
  frmCine := nil;
end;

procedure TfrmCine.bCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCine.bbPlayBackClick(Sender: TObject);
var v_EmpFrm:TMultiForms;
begin
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    v_EmpFrm.DicomMV.ActiveView.CineDirection := True;
    v_EmpFrm.DicomMV.ActiveView.CineActive := True;
    v_EmpFrm.DicomMV.ActiveView.CineSpeed := beSpeed.EditValue;
  end;
end;

procedure TfrmCine.bbPlayClick(Sender: TObject);
var v_EmpFrm:TMultiForms;
begin
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    v_EmpFrm.DicomMV.ActiveView.CineDirection := False;
    v_EmpFrm.DicomMV.ActiveView.CineActive := True;
    v_EmpFrm.DicomMV.ActiveView.CineSpeed := beSpeed.EditValue;
  end;
end;

procedure TfrmCine.bbStopClick(Sender: TObject);
var v_EmpFrm:TMultiForms;
begin
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    v_EmpFrm.DicomMV.ActiveView.CineActive := False;
  end;
end;

end.
