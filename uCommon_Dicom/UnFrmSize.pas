unit UnFrmSize;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinOffice2007Green, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxSpinEdit, cxControls,
  cxContainer, cxEdit, cxLabel, ExtCtrls, ActnList, dxSkinBlack,
  dxSkinOffice2007Black, Medotrade;

type
  TFrmSize = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    seColumns: TcxSpinEdit;
    cxLabel2: TcxLabel;
    seRows: TcxSpinEdit;
    Panel2: TPanel;
    bApplyScreen: TcxButton;
    cxButton1: TcxButton;
    al: TActionList;
    actOK: TAction;
    actCancel: TAction;
    procedure actOKExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSize: TFrmSize;

implementation

{$R *.dfm}

procedure TFrmSize.actCancelExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TFrmSize.actOKExecute(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

end.
