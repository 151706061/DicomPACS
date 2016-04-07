unit fProcess;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxLabel, JvExControls, JvAnimatedImage, JvGIFCtrl,
  ExtCtrls, dxSkinsCore, dxSkinOffice2007Green;

type
  TfrmProcess = class(TForm)
    Shape2: TShape;
    Shape1: TShape;
    cxLabel2: TcxLabel;
    btnClose: TcxButton;
    sm_progress_anim: TJvGIFAnimator;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcess: TfrmProcess;

implementation

{$R *.dfm}

procedure TfrmProcess.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmProcess.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

end.
