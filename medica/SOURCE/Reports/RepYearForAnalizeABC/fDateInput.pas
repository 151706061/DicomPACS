unit fDateInput;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfrmDateInput = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    al: TActionList;
    acOk: TAction;
    acCancel: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    deDate: TcxDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure acOkExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses fgetperiod;


{$R *.DFM}

procedure TfrmDateInput.FormCreate(Sender: TObject);
begin
  deDate.Date := Now;
end;

procedure TfrmDateInput.acOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmDateInput.acCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
