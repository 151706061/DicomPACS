unit fFio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ActnList, ComCtrls, ToolWin, ExtCtrls;

type
  TfrmFIO = class(TForm)
    Panel1: TPanel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    al: TActionList;
    acApply: TAction;
    edPosition: TEdit;
    edExSign: TEdit;
    lbPosition: TLabel;
    lbExSign: TLabel;
    acCancel: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure acApplyExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses fgetperiod;

{$R *.DFM}

procedure TfrmFIO.acApplyExecute(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfrmFIO.acCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
