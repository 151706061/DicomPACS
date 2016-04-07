unit fgetperiod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, ComCtrls, ToolWin, DBCtrls, JvComponentBase,
  JvFormPlacement, JvExMask, JvToolEdit, JvAppStorage, Menus,
  JvExControls, JvArrowButton, Contnrs;

type
  TfrmGetPeriod = class(TForm)
    pmDocsFilterPeriod: TPopupMenu;
    miPeriodCurMonth: TMenuItem;
    N14: TMenuItem;
    N20: TMenuItem;
    N18: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N15: TMenuItem;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    abuSetDocPeriod: TJvArrowButton;
    dDate2: TJvDateEdit;
    Label2: TLabel;
    dDate1: TJvDateEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure miPeriodCurMonthClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FCurDate : TDateTime;
  public
    { Public declarations }

  end;

var
  frmGetPeriod: TfrmGetPeriod;

function ShowPeriod(aX,aY : integer; aCurDate : TDateTime; var aDate1, aDate2 : TDateTime) : Integer;

implementation
uses DateUtils;
{$R *.DFM}

function ShowPeriod(aX,aY : integer; aCurDate : TDateTime; var aDate1, aDate2 : TDateTime) : Integer;
begin
  Application.CreateForm( TfrmGetPeriod, frmGetPeriod);
  frmGetPeriod.FCurDate := aCurDate;
  frmGetPeriod.dDate1.Date := aDate1;
  frmGetPeriod.dDate2.Date := aDate2;
  frmGetPeriod.Left := aX;
  frmGetPeriod.Top  := aY; 

  Result := frmGetPeriod.ShowModal;

  if Result = mrOk then
  begin
    aDate1 := frmGetPeriod.dDate1.Date;
    aDate2 := frmGetPeriod.dDate2.Date;
  end;
  frmGetPeriod.Free;
end;
//==============================================================================
procedure TfrmGetPeriod.miPeriodCurMonthClick(Sender: TObject);
var
  Year, Month, Day : word;
begin
  DecodeDate(FCurDate, Year, Month, Day);
  case TMenuItem(sender).Tag of
    0:
    begin
      dDate1.Date := StartOfTheMonth(FCurDate);
      dDate2.Date := EndOfTheMonth(FCurDate)
    end;

    1..12:
    begin
      dDate1.Date := EncodeDate(Year, TMenuItem(sender).Tag, 1);
      dDate2.Date := EndOfTheMonth(dDate1.Date);
    end;
  end;
end;

procedure TfrmGetPeriod.Button1Click(Sender: TObject);
begin
  try
    StrToDate( dDate1.Text );
  except
    on EConvertError do
    begin
      Application.MessageBox('Неверно введена начальная дата периода','Ошибка',MB_OK+MB_ICONERROR);
      Self.dDate1.SetFocus;
      Exit;
    end;
  end;

  try
    StrToDate( dDate2.Text );
  except
    on EConvertError do begin
      Application.MessageBox('Неверно введена конечная дата периода','Ошибка',MB_OK+MB_ICONERROR);
      Self.dDate2.SetFocus;
      Exit;
    end;
  end;
  
  if Self.dDate1.date>Self.dDate2.date then begin
    Application.MessageBox('Неверно задан период','Ошибка',MB_OK+MB_ICONERROR);
    Self.dDate1.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TfrmGetPeriod.Button2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGetPeriod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrNone then
    ModalResult := mrCancel;
end;

end.
