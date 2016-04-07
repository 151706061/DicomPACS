unit fProgressCD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxProgressBar, cxContainer, cxEdit, cxLabel, cxPC, cxControls, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList, dxSkinOffice2007Green,
  ExtCtrls, dxSkinBlack, Medotrade, dxSkinOffice2007Black;

type
  TfrmProgressCD = class(TForm)
    pcParam: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxPageControl1: TcxPageControl;
    cxTabSheet2: TcxTabSheet;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxProgressBar1: TcxProgressBar;
    cxProgressBar2: TcxProgressBar;
    lb1: TcxLabel;
    lb2: TcxLabel;
    al: TActionList;
    aCancel: TAction;
    Panel1: TPanel;
    bCancel: TcxButton;
    procedure bCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    bCancels : Boolean;
  end;

var
  frmProgressCD: TfrmProgressCD;

implementation

uses fCD;  // , fMain;

{$R *.dfm}

procedure TfrmProgressCD.bCancelClick(Sender: TObject);
begin
  if Application.MessageBox('Вы хотите прервать процесс подготовки исследований?', 'Вопрос', MB_YESNO+MB_ICONQUESTION) = IDYES then
    bCancels := True;
  {  begin
      frmMain.bCancel := True;
    end; }
end;

procedure TfrmProgressCD.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Application.MessageBox('Вы хотите прервать процесс подготовки исследований?', 'Вопрос', MB_YESNO+MB_ICONQUESTION) = IDYES then
    begin
    //  frmMain.bCancel := True;
      bCancels := True;
    end else
    begin
      CanClose := False;
    end;
end;

end.
