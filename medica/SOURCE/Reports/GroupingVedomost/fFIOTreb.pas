unit fFIOTreb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, ExtCtrls, ActnList;

type
  TfrmFIOTreb = class(TForm)
    alActions: TActionList;
    acApply: TAction;
    Panel1: TPanel;
    lbFam: TLabel;
    edFam: TEdit;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    edJobTitle: TEdit;
    lbJobTitle: TLabel;
    acCancel: TAction;
    ToolButton2: TToolButton;
    procedure acApplyExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFIOTreb: TfrmFIOTreb;

implementation

uses fgetperiod;

{$R *.DFM}

procedure TfrmFIOTreb.acApplyExecute(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfrmFIOTreb.acCancelExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
