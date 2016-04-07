unit fFIOTreb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, ExtCtrls, ActnList;

type
  TfrmFIOTreb = class(TForm)
    ActionList1: TActionList;
    enter: TAction;
    Panel1: TPanel;
    Label1: TLabel;
    eotp: TEdit;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    edolotp: TEdit;
    Label2: TLabel;
    acCancel: TAction;
    ToolButton2: TToolButton;
    procedure enterExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFIOTreb: TfrmFIOTreb;

implementation
uses fdmmain;
{$R *.DFM}

procedure TfrmFIOTreb.enterExecute(Sender: TObject);
begin
  if (eotp.Text = '') or (edolotp.Text = '') then
  begin
    MessageBox(Self.Handle, PChar('Необходимо ввести данные !'), 'Предупреждение', MB_OK + MB_ICONWARNING);
    eotp.SetFocus;
  end
  else
    ModalResult := mrOk;
end;

procedure TfrmFIOTreb.acCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmFIOTreb.FormActivate(Sender: TObject);
begin
  eotp.SetFocus;
end;

end.
