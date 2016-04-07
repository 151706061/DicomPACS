unit fFioZav;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  JvFormPlacement, StdCtrls, ComCtrls, ToolWin, ActnList;

type
  TfrmFioZav = class(TForm)
    lbFam: TLabel;
    edFam: TEdit;
    alActions: TActionList;
    acApply: TAction;
    acCancel: TAction;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    cbDontShow: TCheckBox;
    procedure acApplyExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  frmFioZav: TfrmFioZav;

implementation

uses fdmMain;

{$R *.DFM}

procedure TfrmFioZav.acApplyExecute(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfrmFioZav.acCancelExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
