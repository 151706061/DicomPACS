unit fEditDs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMemo, ActnList, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, dxSkinOffice2007Green, ExtCtrls;

type
  TfrmEditDs = class(TForm)
    memDs: TcxMemo;
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    bOk: TcxButton;
    bCancel: TcxButton;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditDs: TfrmEditDs;

implementation

{$R *.dfm}

procedure TfrmEditDs.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmEditDs.aSaveExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
