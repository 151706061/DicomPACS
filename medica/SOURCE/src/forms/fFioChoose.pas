unit fFioChoose;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin;

type
  TfrmFioChoose = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    al: TActionList;
    acApply: TAction;
    acCancel: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure acCancelExecute(Sender: TObject);
    procedure acApplyExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  frmFioChoose: TfrmFioChoose;



implementation

uses fdmMain;


{$R *.DFM}

procedure TfrmFioChoose.acCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmFioChoose.acApplyExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
