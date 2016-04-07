{***************************************************************
 *
 * Unit Name:
 * Purpose  :
 * Author   : Vladimir K. Nelepov nelepov@diagnostic.ru
 * History  :
 *
 ****************************************************************}
unit fFIONakl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ActnList, ComCtrls, ToolWin, HtmlHlp;

type
  TfrmFIONakl = class(TForm)
    Panel1: TPanel;
    ePol: TEdit;
    pol1: TLabel;
    eOtp: TEdit;
    otp: TLabel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    al: TActionList;
    enter: TAction;
    dolpol: TLabel;
    dolotp: TLabel;
    esos: TEdit;
    epro1: TEdit;
    epro2: TEdit;
    epro3: TEdit;
    edolsos: TEdit;
    edolpro: TEdit;
    edolpro2: TEdit;
    edolpro3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lpro: TLabel;
    ldolpro: TLabel;
    ePro: TEdit;
    eDolP: TEdit;
    acCancel: TAction;
    ToolButton2: TToolButton;
    eDolotp: TEdit;
    eDolpol: TEdit;
    procedure enterExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFIONakl: TfrmFIONakl;

implementation
uses fdmmain;
{$R *.DFM}

procedure TfrmFIONakl.enterExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmFIONakl.acCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TfrmFIONakl.FormHelp(Command: Word; Data: Integer;
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
