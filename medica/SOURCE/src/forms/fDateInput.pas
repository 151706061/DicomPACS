unit fDateInput;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, HtmlHlp, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, dxSkinsCore, dxSkinsDefaultPainters;

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
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure deDatePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
  private
    { Private declarations }
  public
    v_max_date : TDateTime;
    v_check_Date : Boolean;
    v_maxDT_msg : string;
  end;

//var
//  frmDateInput: TfrmDateInput;

implementation

//uses fdmMain;

//uses fdmMain;

{$R *.DFM}

procedure TfrmDateInput.FormCreate(Sender: TObject);
begin
  v_check_Date:=False;
  v_maxDT_msg:='';
  v_max_date:=Date;
//  deDate.Date := ServerDate(dmMain.os);
end;

procedure TfrmDateInput.acOkExecute(Sender: TObject);
begin
  deDate.PostEditValue;
  if v_check_Date then
  begin
    if deDate.Date>v_max_date then
    begin
      if v_maxDT_msg='' then v_maxDT_msg:='Максимальная допустимая дата '+DateToStr(v_max_date);
      MessageDlg(v_maxDT_msg, mtWarning, [mbOK], 0);
      deDate.Date:=v_max_date;
      deDate.PostEditValue;
    end else
      ModalResult := mrOk;
  end else
  begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmDateInput.acCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TfrmDateInput.FormHelp(Command: Word; Data: Integer;
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

procedure TfrmDateInput.deDatePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
//  cxDateEdit_PropertiesValidate(Sender, DisplayValue, ErrorText, Error);
end;

end.
