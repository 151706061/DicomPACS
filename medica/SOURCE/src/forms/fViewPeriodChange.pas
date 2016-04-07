unit fViewPeriodChange;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, JvExComCtrls, JvDateTimePicker, ActnList, ToolWin,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar;

type
  TfmViewPeriodChange = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    ToolButton3: TToolButton;
    al: TActionList;
    acSave: TAction;
    acCancel: TAction;
    Label1: TLabel;
    Label2: TLabel;
    dtStart: TcxDateEdit;
    dtFinish: TcxDateEdit;
    procedure acSaveExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure dtStartChange(Sender: TObject);
    procedure dtStartKeyPress(Sender: TObject; var Key: Char);
    procedure dtFinishKeyPress(Sender: TObject; var Key: Char);
    procedure dtStartPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtStartPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
  private
    { Private declarations }
    FSetDate : Boolean;
  public
    { Public declarations }
    procedure SetDates( aStartDate, aFinishDate : TDate    );
    procedure GetDates(var aStartDate, aFinishDate : TDate );
  end;

var
  fmViewPeriodChange: TfmViewPeriodChange;

  function DoShowModalPeriodChange(  const aSetStartDate, aSetFinishDate : TDate; var aGetStartDate, aGetFinishDate : TDate; const aFormCaption : string = '') : Boolean;
implementation

uses fdmMain;

{$R *.DFM}
function DoShowModalPeriodChange( const aSetStartDate, aSetFinishDate : TDate; var aGetStartDate, aGetFinishDate : TDate; const aFormCaption : string = '') : Boolean;
begin
  fmViewPeriodChange := TfmViewPeriodChange.Create( Application );
  try
    fmViewPeriodChange.SetDates(  aSetStartDate, aSetFinishDate );
    if fmViewPeriodChange.ShowModal = mrOk then
    begin
      fmViewPeriodChange.GetDates( aGetStartDate, aGetFinishDate );
      Result := True;
    end
    else
      Result := False;
  finally
    fmViewPeriodChange.Free;
  end;
end;

procedure TfmViewPeriodChange.acSaveExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfmViewPeriodChange.acCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmViewPeriodChange.GetDates(var aStartDate, aFinishDate: TDate);
begin
  aStartDate  := Trunc(dtStart.Date);
  aFinishDate := Trunc(dtFinish.Date);
end;

procedure TfmViewPeriodChange.SetDates(aStartDate, aFinishDate: TDate);
begin
  FSetDate := True;
  dtStart.EditValue  := Trunc(aStartDate);
  dtFinish.EditValue := Trunc(aFinishDate);
  FSetDate := False;
end;

procedure TfmViewPeriodChange.dtStartChange(Sender: TObject);
var
  TempDate : TDate;
begin
  if dtStart.Date > dtFinish.Date then
  begin
    TempDate      := dtStart.Date;
    dtStart.Date  := dtFinish.Date;
    dtFinish.Date := TempDate;

    TJvDateTimePicker(Sender).SetFocus;
  end;
end;

procedure TfmViewPeriodChange.dtStartKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13 : dtFinish.SetFocus;
  end;
end;

procedure TfmViewPeriodChange.dtFinishKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13 : acSave.Execute;
  end;
end;

procedure TfmViewPeriodChange.dtStartPropertiesChange(Sender: TObject);
var
  TempDate : TDate;
begin
  if (not FSetDate)and(dtStart.Date > dtFinish.Date) then
  begin
    TempDate      := dtStart.EditValue;
    dtStart.EditValue  := dtFinish.EditValue;
    dtFinish.EditValue := TempDate;

    if (TcxDateEdit(Sender).Visible)and(TcxDateEdit(Sender).Enabled)and(Self.Visible) then TcxDateEdit(Sender).SetFocus;
  end;
end;

procedure TfmViewPeriodChange.FormCreate(Sender: TObject);
begin
  FSetDate := false;
end;

procedure TfmViewPeriodChange.FormShow(Sender: TObject);
begin
  dtStart.SetFocus;
  dtStart.SelStart := 0;
end;

procedure TfmViewPeriodChange.dtStartPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
//  if not IsValidDateEditValue( TcxDateEdit(Sender).Text ) then TcxDateEdit(Sender).EditValue := ServerDate(dmMain.os);
  cxDateEdit_PropertiesValidate(Sender, DisplayValue, ErrorText, Error);
end;

end.
