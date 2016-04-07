unit fUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, dxSkinsCore, dxSkinsDefaultPainters,
  cxControls, cxContainer, cxEdit, cxLabel, JvExControls, JvAnimatedImage,
  JvGIFCtrl, cxProgressBar, dxSkinOffice2007Black;

type
  TfrmUpdate = class(TForm)
    Shape2: TShape;
    Shape1: TShape;
    sm_progress_anim: TJvGIFAnimator;
    lbCaption: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel4: TcxLabel;
    cxProgressBar: TcxProgressBar;
    lbNumTabl: TcxLabel;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    sColTabl : string;
  end;
    {
function  UpdateShow(s: ShortString; ColTabl : Integer): Pointer;
procedure UpdateUpdate(p: Pointer; s: ShortString = ''; NumTabl : Integer = 0; pPos : Integer = 0);
procedure UpdateHide(p: Pointer); //stdcall; export;
function  ReturnProgrBar: double;
 }
var
  frmUpdate         : TfrmUpdate;
  //pFrm              : Pointer;

implementation

{$R *.dfm}
{
function UpdateShow(s: ShortString; ColTabl : Integer): Pointer;
begin
  Application.CreateForm(TfrmUpdate, frmUpdate);
  frmUpdate.sColTabl := IntToStr(ColTabl);
  frmUpdate.Show;
  frmUpdate.sm_progress_anim.Animate := True;
  UpdateUpdate(frmUpdate, s, 0, 0);
  Result := frmUpdate;
end;

procedure UpdateUpdate(p: Pointer; s: ShortString = ''; NumTabl : Integer = 0; pPos : Integer = 0);
begin
  Application.ProcessMessages;
  frmUpdate := p;
  if (s<>'') then
    frmUpdate.lbCaption.Caption := s;
  frmUpdate.cxProgressBar.Position := pPos;
  if NumTabl > 0 then
   frmUpdate.lbNumTabl.Caption := 'Запись '+IntToStr(NumTabl)+' из '+frmUpdate.sColTabl;
  frmUpdate.Update;
  frmUpdate.Invalidate;
  Application.ProcessMessages;
end;

procedure UpdateHide(p: Pointer); //stdcall;
begin
  frmUpdate := p;
  frmUpdate.Hide;
  FreeAndNil(frmUpdate);
  //pFrm := nil;
end;

function  ReturnProgrBar: double;
begin
  Result := frmUpdate.cxProgressBar.Properties.Max;
end;  }

procedure TfrmUpdate.FormShow(Sender: TObject);
begin
  Timer1.Enabled:=True;
end;

procedure TfrmUpdate.Timer1Timer(Sender: TObject);
begin
  Sleep(1000);
  ModalResult:=mrOk;
end;

end.

