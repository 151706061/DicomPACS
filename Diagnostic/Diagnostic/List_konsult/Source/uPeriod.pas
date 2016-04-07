unit uPeriod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, ActnList, ToolWin, ComCtrls, StdCtrls,
  DateUtils, cxGraphics, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, DB, OracleData, Oracle, Registry,
  cxCalendar, dxSkinsCore, dxSkinsDefaultPainters;

type
  TfrmPeriod = class(TForm)
    PanelTop: TPanel;
    PanelMain: TPanel;
    ImageList: TImageList;
    ActionList: TActionList;
    acOk: TAction;
    acCancel: TAction;
    ToolBar: TToolBar;
    tbOk: TToolButton;
    tbCancel: TToolButton;
    rbFullYear: TRadioButton;
    gbMounth: TGroupBox;
    rbSeptember: TRadioButton;
    rbAugust: TRadioButton;
    rbJune: TRadioButton;
    rbJule: TRadioButton;
    rbMay: TRadioButton;
    rbApril: TRadioButton;
    rbMarch: TRadioButton;
    rbFebruary: TRadioButton;
    rbDecember: TRadioButton;
    rbNovember: TRadioButton;
    rbOctober: TRadioButton;
    rbJanuary: TRadioButton;
    gbQuartal: TGroupBox;
    rbFirstQuartal: TRadioButton;
    rbSecondQuartal: TRadioButton;
    rbThirdQuartal: TRadioButton;
    rbFourthQuartal: TRadioButton;
    gbYearPart: TGroupBox;
    rbFirstPartYear: TRadioButton;
    rbSecondPartYear: TRadioButton;
    gbYear: TGroupBox;
    LabelS: TLabel;
    LabelPo: TLabel;
    cbBeg: TCheckBox;
    cbEnd: TCheckBox;
    dtpBegin: TcxDateEdit;
    dtpEnd: TcxDateEdit;
    procedure FormShow(Sender: TObject);
    procedure rbMounthClick(Sender: TObject);
    procedure rbQuartalClick(Sender: TObject);
    procedure rbPartYearClick(Sender: TObject);
    procedure rbFullYearClick(Sender: TObject);
    procedure acOkExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure cbBegClick(Sender: TObject);
    procedure cbEndClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


function GetPeriod(var DateB, DateE: TDate): Boolean;
var
  frmPeriod: TfrmPeriod;

implementation

uses fMain;

{$R *.dfm}
var
  DateBegin: TDate;
  DateEnd  : TDate;
  CurYear  : string;

  OldDateSeparator  : Char;
  OldShortDateFormat: String;

function GetPeriod(var DateB, DateE: TDate): Boolean;
begin
  OldDateSeparator:=DateSeparator;
  OldShortDateFormat:=ShortDateFormat;
  DateSeparator:='.';
  ShortDateFormat:='dd.mm.yyyy';

  frmPeriod:=TfrmPeriod.Create(nil);
  Result:=frmPeriod.ShowModal=mrOk;

  DateSeparator:=OldDateSeparator;
  ShortDateFormat:=OldShortDateFormat;
  frmPeriod.dtpBegin.Date:=StrToDate(frmPeriod.dtpBegin.Text); frmPeriod.dtpEnd.Date:=StrToDate(frmPeriod.dtpEnd.Text);
  DateBegin:=frmPeriod.dtpBegin.Date; DateEnd:=frmPeriod.dtpEnd.Date;
  DateB:=DateBegin; DateE:=DateEnd;
  if not frmPeriod.cbBeg.Checked then
     DateB:=incYear(now,-1000);
  if not frmPeriod.cbEnd.Checked then
     DateE:=incYear(now,1000);
  frmPeriod.Free
end;

procedure TfrmPeriod.FormShow(Sender: TObject);
var Reg : TRegIniFile;
begin
  CurYear:=IntToStr(CurrentYear);
  Reg:=TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  Reg.OpenKey('\Software\Softmaster\XRAYS\DatesPeriod'+'VRACH'+IntToStr(frmMain.pSOTRID), TRUE);
  if Reg.ReadString('\Software\Softmaster\XRAYS\DatesPeriod'+'VRACH'+IntToStr(frmMain.pSOTRID), 'DATE_BEG', '') = '' then
    begin
      rbJanuary.Checked:=True;
    end else
    begin
      dtpBegin.Date := StrToDateTime(Reg.ReadString('\Software\Softmaster\XRAYS\DatesPeriod'+'VRACH'+IntToStr(frmMain.pSOTRID), 'DATE_BEG', ''));
      dtpEnd.Date := StrToDateTime(Reg.ReadString('\Software\Softmaster\XRAYS\DatesPeriod'+'VRACH'+IntToStr(frmMain.pSOTRID), 'DATE_END', ''));
    end;
  Reg.Free;
end;

procedure TfrmPeriod.rbMounthClick(Sender: TObject);
var
  I: Integer;
begin
  for I:=0 to gbQuartal.ControlCount-1 do TRadioButton(gbQuartal.Controls[I]).Checked:=False;
  for I:=0 to gbYearPart.ControlCount-1 do TRadioButton(gbYearPart.Controls[I]).Checked:=False;
  for I:=0 to gbYear.ControlCount-1 do TRadioButton(gbYear.Controls[I]).Checked:=False;
  Case TRadioButton(Sender).Tag of
    1: begin DateBegin:=StrToDate('01.01.'+CurYear); DateEnd:=StrToDate('31.01.'+CurYear) end;
    2: begin DateBegin:=StrToDate('01.02.'+CurYear);
         if IsLeapYear(CurrentYear) then DateEnd:=StrToDate('29.02.'+CurYear) else DateEnd:=StrToDate('28.02.'+CurYear)
       end;
    3: begin DateBegin:=StrToDate('01.03.'+CurYear); DateEnd:=StrToDate('31.03.'+CurYear) end;
    4: begin DateBegin:=StrToDate('01.04.'+CurYear); DateEnd:=StrToDate('30.04.'+CurYear) end;
    5: begin DateBegin:=StrToDate('01.05.'+CurYear); DateEnd:=StrToDate('31.05.'+CurYear) end;
    6: begin DateBegin:=StrToDate('01.06.'+CurYear); DateEnd:=StrToDate('30.06.'+CurYear) end;
    7: begin DateBegin:=StrToDate('01.07.'+CurYear); DateEnd:=StrToDate('31.07.'+CurYear) end;
    8: begin DateBegin:=StrToDate('01.08.'+CurYear); DateEnd:=StrToDate('31.08.'+CurYear) end;
    9: begin DateBegin:=StrToDate('01.09.'+CurYear); DateEnd:=StrToDate('30.09.'+CurYear) end;
    10: begin DateBegin:=StrToDate('01.10.'+CurYear); DateEnd:=StrToDate('31.10.'+CurYear) end;
    11: begin DateBegin:=StrToDate('01.11.'+CurYear); DateEnd:=StrToDate('30.11.'+CurYear) end;
    12: begin DateBegin:=StrToDate('01.12.'+CurYear); DateEnd:=StrToDate('31.12.'+CurYear) end
  end;
  dtpBegin.Date:=DateBegin; dtpEnd.Date:=DateEnd
end;

procedure TfrmPeriod.rbQuartalClick(Sender: TObject);
var
  I: Integer;
begin
  for I:=0 to gbMounth.ControlCount-1 do TRadioButton(gbMounth.Controls[I]).Checked:=False;
  for I:=0 to gbYearPart.ControlCount-1 do TRadioButton(gbYearPart.Controls[I]).Checked:=False;
  for I:=0 to gbYear.ControlCount-1 do TRadioButton(gbYear.Controls[I]).Checked:=False;
  Case TRadioButton(Sender).Tag of
    1: begin DateBegin:=StrToDate('01.01.'+CurYear); DateEnd:=StrToDate('31.03.'+CurYear) end;
    2: begin DateBegin:=StrToDate('01.04.'+CurYear); DateEnd:=StrToDate('30.06.'+CurYear) end;
    3: begin DateBegin:=StrToDate('01.07.'+CurYear); DateEnd:=StrToDate('30.09.'+CurYear) end;
    4: begin DateBegin:=StrToDate('01.10.'+CurYear); DateEnd:=StrToDate('31.12.'+CurYear) end
  end;
  dtpBegin.Date:=DateBegin; dtpEnd.Date:=DateEnd
end;

procedure TfrmPeriod.rbPartYearClick(Sender: TObject);
var
  I: Integer;
begin
  for I:=0 to gbMounth.ControlCount-1 do TRadioButton(gbMounth.Controls[I]).Checked:=False;
  for I:=0 to gbQuartal.ControlCount-1 do TRadioButton(gbQuartal.Controls[I]).Checked:=False;
  for I:=0 to gbYear.ControlCount-1 do TRadioButton(gbYear.Controls[I]).Checked:=False;
  Case TRadioButton(Sender).Tag of
    1: begin DateBegin:=StrToDate('01.01.'+CurYear); DateEnd:=StrToDate('30.06.'+CurYear) end;
    2: begin DateBegin:=StrToDate('01.07.'+CurYear); DateEnd:=StrToDate('31.12.'+CurYear) end
  end;
  dtpBegin.Date:=DateBegin; dtpEnd.Date:=DateEnd
end;

procedure TfrmPeriod.rbFullYearClick(Sender: TObject);
var
  I: Integer;
begin
  for I:=0 to gbMounth.ControlCount-1 do TRadioButton(gbMounth.Controls[I]).Checked:=False;
  for I:=0 to gbQuartal.ControlCount-1 do TRadioButton(gbQuartal.Controls[I]).Checked:=False;
  for I:=0 to gbYearPart.ControlCount-1 do TRadioButton(gbYearPart.Controls[I]).Checked:=False;
  DateBegin:=StrToDate('01.01.'+CurYear); DateEnd:=StrToDate('31.12.'+CurYear);
  dtpBegin.Date:=DateBegin; dtpEnd.Date:=DateEnd
end;

procedure TfrmPeriod.acOkExecute(Sender: TObject);
begin
  ModalResult:=mrOk
end;

procedure TfrmPeriod.acCancelExecute(Sender: TObject);
begin
  ModalResult:=mrCancel
end;

procedure TfrmPeriod.cbBegClick(Sender: TObject);
begin
 dtpBegin.Enabled:=cbBeg.Checked;
end;

procedure TfrmPeriod.cbEndClick(Sender: TObject);
begin
 dtpEnd.Enabled:=cbEnd.Checked;
end;

procedure TfrmPeriod.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if not Reg.OpenKey('\Software\Softmaster\XRAYS\DatesPeriod'+'VRACH'+IntToStr(frmMain.pSOTRID), FALSE) then
   begin
     Reg.CreateKey('\Software\Softmaster\XRAYS\DatesPeriod'+'VRACH'+IntToStr(frmMain.pSOTRID));
   end;
  try
    Reg.WriteString('\Software\Softmaster\XRAYS\DatesPeriod'+'VRACH'+IntToStr(frmMain.pSOTRID), 'DATE_BEG', DateTimeToStr(dtpBegin.Date));
    Reg.WriteString('\Software\Softmaster\XRAYS\DatesPeriod'+'VRACH'+IntToStr(frmMain.pSOTRID), 'DATE_END', DateTimeToStr(dtpEnd.Date));
  except
  end;
  Reg.Free;
end;

end.
