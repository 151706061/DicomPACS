unit fNeyav;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ImgList, dxBar, cxClasses, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMemo, dxSkinsCore, dxSkinOffice2007Green, dxSkinsdxBarPainter;

type
  TfrmNeyav = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    al: TActionList;
    il: TImageList;
    aOk: TAction;
    aCancel: TAction;
    BMBar1: TdxBar;
    bbOk: TdxBarButton;
    bbCancel: TdxBarButton;
    memReason: TcxMemo;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNeyav: TfrmNeyav;

implementation

{$R *.dfm}

procedure TfrmNeyav.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmNeyav.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
