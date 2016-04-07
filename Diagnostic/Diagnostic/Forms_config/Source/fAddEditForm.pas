unit fAddEditForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, dxSkinOffice2007Green, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel, cxControls, cxContainer,
  cxEdit, cxTextEdit, ActnList;

type
  TfrmAddEditF = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    teName: TcxTextEdit;
    cxLabel1: TcxLabel;
    bOk: TcxButton;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    cxButton1: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditF: TfrmAddEditF;

implementation

{$R *.dfm}

procedure TfrmAddEditF.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel; 
end;

procedure TfrmAddEditF.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk; 
end;

end.
