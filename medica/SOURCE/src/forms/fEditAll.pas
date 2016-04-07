//
unit fEditAll;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ExtCtrls, ActnList, StdCtrls, HtmlHlp;

type
  TfrmEditAll = class(TForm)
    Panel1: TPanel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ActionList1: TActionList;
    acEnter: TAction;
    acEsc: TAction;
    CheckBox1: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure acEnterExecute(Sender: TObject);
    procedure acEscExecute(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditAll: TfrmEditAll;

implementation

uses fdmmain, fmainform;

{$R *.DFM}

procedure TfrmEditAll.FormActivate(Sender: TObject);
begin
  if dmMain.nRed = 0 then CheckBox1.Checked := false else CheckBox1.Checked := true;
end;

procedure TfrmEditAll.acEnterExecute(Sender: TObject);
begin
  if CheckBox1.Checked then dmMain.nRed := 1 else dmMain.nRed := 0;
  ModalResult := mrok;
end;

procedure TfrmEditAll.acEscExecute(Sender: TObject);
begin
  ModalResult := mrCancel;

end;

procedure TfrmEditAll.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then CheckBox1.Font.Color := clRed
  else CheckBox1.Font.Color := clBlack;
end;

function TfrmEditAll.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
	Result := False;
  try
    // TODo Подумать насчет праметра  Command
    if Data = -1 then
      HtmlHelp(0, PChar('Medica.chm'), HH_DISPLAY_TOPIC, 0)
    else
      HtmlHelp(0, PChar('Medica.chm'), HH_HELP_CONTEXT, Data);
    CallHelp := False;
    Result := True;
  except
    on EConvertError do
      ShowMessage('Справка не найдена');
  end;
end;

end.
