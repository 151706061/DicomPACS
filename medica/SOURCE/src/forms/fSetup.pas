{***************************************************************
 *
 * Unit Name: fSetup
 * Purpose  :
 * Author   : Alexander A. Sobjanin sobjanin_alex@chat.ru
 * History  :
 *
 ****************************************************************}

unit fSetup;

interface

uses
  Windows, Oracle, Classes, ActnList, ComCtrls, Controls, ToolWin, StdCtrls,
	Forms, HtmlHlp, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar;

type
  TfrmSetup = class(TForm)
    al: TActionList;
    acSave: TAction;
    acCancel: TAction;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    ToolButton3: TToolButton;
    Label1: TLabel;
    Label2: TLabel;
    oqUpdDate: TOracleQuery;
    edD1: TcxDateEdit;
    edD2: TcxDateEdit;
    procedure acSaveExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DoFill;
  end;

function DoShowSetup: boolean;

var
  frmSetup: TfrmSetup;

implementation

uses fdmMain, fMainForm, Sysutils;

{$R *.DFM}
{****************************************************************************************}
{                                 DoShowSetup
{****************************************************************************************}

function DoShowSetup: boolean;
begin
  Application.CreateForm(TfrmSetup, frmSetup);
  frmSetup.ShowModal;
  result := frmSetup.ModalResult = mrOk;
end;

{****************************************************************************************}
{                                 TfrmSetup.acSaveExecute
{****************************************************************************************}

procedure TfrmSetup.acSaveExecute(Sender: TObject);
var
  DateNow : TDateTime;
begin
  edD1.PostEditValue;
  edD2.PostEditValue;  

  if edD1.Date > edD2.Date then
  begin
    edD1.SetFocus;
    Windows.MessageBox(Handle, 'Начальная дата периода должна быть меньше конечной',
      'Ошибка', MB_OK + MB_ICONERROR);
  end
  else
  begin
    //     oqUpdDate.SetVariable('afd_data1',edD1.Date);
    //     oqUpdDate.SetVariable('afd_data2',edD2.Date);
    //     oqUpdDate.Execute;
    IniWriteString(iniFileName, 'Data', 'data1', datetostr(edD1.Date));
    IniWriteString(iniFileName, 'Data', 'data2', datetostr(edD2.Date));
    dmMain.pkgMedSes.SETDATA1(edD1.Date);
    dmMain.pkgMedSes.SETDATA2(edD2.Date);
    frmMain.sbMain.Panels[0].Text := 'Рабочий период: [ ' + DateToStr(edD1.Date) + ' - ' + DateToStr(edD2.Date) + ' ]';
    DateNow := ServerDate(dmMain.os);
    if (edD1.Date > DateNow) or (edD2.Date < DateNow) then dmMain.ShowBalloonHint('Рабочий период не включает текущую дату'#13#10'Вы не сможете распоряжаться текущими медикаментами');
    ModalResult := mrOk;
  end;
end;

{****************************************************************************************}
{                                 TfrmSetup.acCancelExecute
{****************************************************************************************}

procedure TfrmSetup.acCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

{****************************************************************************************}
{                                 TfrmSetup.DoFill
{****************************************************************************************}

procedure TfrmSetup.DoFill;
begin
  edD1.Date := dmMain.pkgMedSes.GETDATA1;
  edD2.Date := dmMain.pkgMedSes.GETDATA2;
end;

procedure TfrmSetup.FormActivate(Sender: TObject);
begin
  edd1.Date := dmMain.pkgMedSes.GETDATA1;
  edd2.Date := dmMain.pkgMedSes.GETDATA2;
end;

function TfrmSetup.FormHelp(Command: Word; Data: Integer;
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
{		on EConvertError do
			ShowMessage('Справка не найдена');}
	end;
end;

end.
