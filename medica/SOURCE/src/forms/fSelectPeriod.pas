unit fSelectPeriod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Mask, JvToolEdit, DBCtrls,
  Db, OracleData, JvExMask, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxGraphics, cxSpinEdit;

type
  TfrmSelectPeriod = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    alActions: TActionList;
    acApply: TAction;
    acCancel: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Panel1: TPanel;
    rgMinSpare: TRadioGroup;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    cmbMonth1: TcxComboBox;
    sedYear1: TcxSpinEdit;
    cmbMonth2: TcxComboBox;
    sedYear2: TcxSpinEdit;
    procedure acCancelExecute(Sender: TObject);
    procedure acApplyExecute(Sender: TObject);
    procedure rgMinSpareClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbMonth1PropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FDate1, FDate2 : TDate;
    isMonth1PropertiesChangeEnable : boolean;
    procedure SetDate1(const aDate1 : TDate);
    procedure SetDate2(const aDate2 : TDate);
  public
    { Public declarations }
    isCheckDate : Boolean;
    property Date1 : TDate read FDate1 write SetDate1;
    property Date2 : TDate read FDate2 write SetDate2;
  end;

//var
//  frmSelectPeriod: TfrmSelectPeriod;

implementation

uses fdmMain, JvJCLUtils, DateUtils;

{$R *.DFM}

procedure TfrmSelectPeriod.acCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSelectPeriod.acApplyExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSelectPeriod.rgMinSpareClick(Sender: TObject);
begin
  isMonth1PropertiesChangeEnable := False;
  if TRadioGroup(Sender).ItemIndex = 0 then
    Date1 := IncMonth(Date2, -1)+1
  else
    Date1 := IncMonth(Date2, -TRadioGroup(Sender).ItemIndex * 3)+1;
  isMonth1PropertiesChangeEnable := True;    
end;

procedure TfrmSelectPeriod.FormCreate(Sender: TObject);
var
  i : integer;
begin
  isCheckDate := False;
  cmbMonth1.Properties.Items.Clear;
  cmbMonth2.Properties.Items.Clear;  
  for i := Low(LongMonthNames) to High(LongMonthNames) do
  begin
    cmbMonth1.Properties.Items.Add(LongMonthNames[i]);
    cmbMonth2.Properties.Items.Add(LongMonthNames[i]);
  end;  
//	deDate2.Date := LastDayOfPrevMonth;
//  rgMinSpareClick(rgMinSpare);
end;

procedure TfrmSelectPeriod.SetDate1(const aDate1: TDate);
var
  Day, Month, Year : Word;
begin
  DecodeDate(aDate1, Year, Month, Day);

  FDate1 := EncodeDate(Year, Month, 1); // первый день мес€ца
  sedYear1.Value := Year;
  cmbMonth1.ItemIndex := (Month-1);
  if (isCheckDate)and(FDate1 > FDate2) then Date2 := FDate1;
end;

procedure TfrmSelectPeriod.SetDate2(const aDate2: TDate);
var
  Day, Month, Year : Word;
begin
  DecodeDate(aDate2, Year, Month, Day);

  FDate2 := EncodeDate(Year, Month, DaysInAMonth(Year, Month)); // последний день мес€ца
  sedYear2.Value := Year;
  cmbMonth2.ItemIndex := (Month-1);
  if (isCheckDate)and(FDate1 > FDate2) then Date2 := FDate1;  
end;

procedure TfrmSelectPeriod.cmbMonth1PropertiesChange(Sender: TObject);
begin
  if not isMonth1PropertiesChangeEnable then Exit;

  Date1 := EncodeDate( sedYear1.Value, cmbMonth1.ItemIndex+1, 1);
  Date2 := EncodeDate( sedYear2.Value, cmbMonth2.ItemIndex+1, DaysInAMonth(sedYear2.Value, cmbMonth2.ItemIndex+1));
  rgMinSpare.ItemIndex := -1;
end;

procedure TfrmSelectPeriod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmSelectPeriod.FormActivate(Sender: TObject);
begin
  isMonth1PropertiesChangeEnable := True;
end;

end.
