unit uPeriod_Param;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ActnList, cxGraphics, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, DB, OracleData,
  cxCheckBox, Menus, cxLookAndFeelPainters, cxButtons, cxLabel, cxButtonEdit,
  Registry, dxSkinsCore, dxSkinOffice2007Green;

type
  TPeriodKind = (pkUnknown, pkMonth, pkQuarter, pkHalfYear, pkYear, pkManual);
  TPeriod = record
   Kind: TPeriodKind;
   First: TDate;
   Last: TDate;
  end;

  TDateCorrectProcedure = procedure (var ADateBegin, ADateEnd: TDateTime);

  TfrmParamDate = class(TForm)
    grpList: TGroupBox;
    lblMonth: TLabel;
    cmbMonth: TComboBox;
    lblQuarter: TLabel;
    cmbQuarter: TComboBox;
    lblHalfYear: TLabel;
    cmbHalfYear: TComboBox;
    lblYear: TLabel;
    cmbYear: TComboBox;
    grpManual: TGroupBox;
    lblFirst: TLabel;
    lblLast: TLabel;
    dtFirst: TDateTimePicker;
    dtLast: TDateTimePicker;
    ActionList: TActionList;
    acSelect: TAction;
    acCancel: TAction;
    rdbFullYear: TRadioButton;
    bOk: TcxButton;
    bCancel: TcxButton;
    beWork: TcxButtonEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    beUch: TcxButtonEdit;
    cxSpec: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acSelectExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure ListChange(Sender: TObject);
    procedure rdbFullYearClick(Sender: TObject);
    procedure ManualChange(Sender: TObject);
    procedure beWorkPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FCleaning: Boolean;
    FFocus: TPeriodKind;
    FMax: Integer;
    FDateCorrect: TDateCorrectProcedure;

    function GetPeriod: TPeriod;

    procedure SetDefaults;
    function GetLastDay(AYear, AMonth: Word): Word;
  public
    isAll : Boolean;
    function Execute: Boolean;
    procedure Disable(APeriodKind: TPeriodKind);
    procedure Default(APeriodKind: TPeriodKind; AValue: Integer=-2000); overload;
    procedure Default(APeriodKind: TPeriodKind; AFirst, ALast: TDate); overload;

    property Period: TPeriod read GetPeriod;
    property Max: Integer read FMax write FMax;
    property DateCorrect: TDateCorrectProcedure read FDateCorrect write FDateCorrect;
  end;

implementation
uses fMain, fCompanyList, fSetUch;
{$R *.dfm}

procedure TfrmParamDate.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    if not Reg.OpenKey('\Software\Softmaster\Fluoro_company_plan\', FALSE) then
      begin
        Reg.CreateKey('\Software\Softmaster\Fluoro_company_plan');
      end;
    try
      Reg.WriteInteger('\Software\Softmaster\Fluoro_company_plan'+'\ID_CHK'+IntToStr(frmMain.pSOTRID), 'ID_CHK', cxSpec.EditValue);
    except
    end;
  finally
    Reg.Free;
  end;
end;

procedure TfrmParamDate.FormCreate(Sender: TObject);
var Reg : TregIniFile;
    id : Integer;
begin
 FCleaning:=False;
 FMax:=-1;
 FFocus:=pkMonth;
 SetDefaults;

 Reg:=TRegIniFile.Create;
 try
  Reg.RootKey:=HKEY_CURRENT_USER;
  id := Reg.ReadInteger('\Software\Softmaster\Fluoro_company_plan\ID_CHK'+IntToStr(frmMain.pSOTRID), 'ID_CHK', 0);
  case id of
   -1: cxSpec.EditValue := -1;
    0: cxSpec.EditValue := 0;
  end;
 finally
   Reg.Free;
 end;
end;

procedure TfrmParamDate.FormShow(Sender: TObject);
begin
 case FFocus of
  pkMonth: cmbMonth.SetFocus;
  pkQuarter: cmbQuarter.SetFocus;
  pkHalfYear: cmbHalfYear.SetFocus;
  pkYear: cmbYear.SetFocus;
  pkManual: dtFirst.SetFocus;
 end;
end;

function TfrmParamDate.Execute: Boolean;
begin
 Result:=ShowModal=mrOk;
end;

procedure TfrmParamDate.Disable(APeriodKind: TPeriodKind);
begin
 case APeriodKind of
  pkMonth: cmbMonth.Enabled:=False;
  pkQuarter: cmbQuarter.Enabled:=False;
  pkHalfYear: cmbHalfYear.Enabled:=False;
  pkYear: rdbFullYear.Enabled:=False;
  pkManual: begin
   grpManual.Enabled:=False;
   lblFirst.Enabled:=False;
   dtFirst.Enabled:=False;
   lblLast.Enabled:=False;
   dtLast.Enabled:=False;
  end;
 end;
end;

procedure TfrmParamDate.Default(APeriodKind: TPeriodKind; AValue: Integer=-2000);
var
 Y, M, D, Q, H: Word;
begin
 DecodeDate(Date, Y, M, D);
 if M mod 3=0 then Q:=M div 3 else Q:=(M div 3)+1;
 if Y<=6 then H:=1 else H:=2;

 case APeriodKind of
  pkMonth: begin
   if AValue=-2000 then cmbMonth.ItemIndex:=M-1 else cmbMonth.ItemIndex:=AValue-1;
   ListChange(cmbMonth);
  end;
  pkQuarter: begin
   if AValue=-2000 then cmbQuarter.ItemIndex:=Q-1 else cmbQuarter.ItemIndex:=AValue-1;
   ListChange(cmbQuarter);
  end;
  pkHalfYear: begin
   if AValue=-2000 then cmbHalfYear.ItemIndex:=H-1 else cmbHalfYear.ItemIndex:=AValue-1;
   ListChange(cmbHalfYear);
  end;
  pkYear: begin
   if AValue=-2000 then cmbYear.Text:=IntToStr(Y) else cmbYear.Text:=IntToStr(AValue);
   rdbFullYear.Checked:=True;
  end;
 end;
 FFocus:=APeriodKind;
end;

procedure TfrmParamDate.Default(APeriodKind: TPeriodKind; AFirst, ALast: TDate);
begin
 case APeriodKind of
  pkManual: begin
   dtFirst.Date:=AFirst;
   dtLast.Date:=ALast;
  end;
 end;
 FFocus:=APeriodKind;
end;

function TfrmParamDate.GetPeriod: TPeriod;
begin
 with Result do begin
  if cmbMonth.ItemIndex<>-1 then Kind:=pkMonth
  else if cmbQuarter.ItemIndex<>-1 then Kind:=pkQuarter
  else if cmbHalfYear.ItemIndex<>-1 then Kind:=pkHalfYear
  else if rdbFullYear.Checked then Kind:=pkYear
  else Kind:=pkManual;
  First:=dtFirst.Date;
  Last:=dtLast.Date;
 end;
end;

procedure TfrmParamDate.SetDefaults;
var
 Y, M, D: Word;
 I: Integer;
begin
 DecodeDate(Date, Y, M, D);
 cmbYear.Clear;
 for I:=Y-3 to Y+3 do begin
  cmbYear.AddItem(IntToStr(I), nil);
 end;
 FCleaning:=True;
 cmbYear.ItemIndex:=cmbYear.Items.Count-4;
 FCleaning:=False;

 dtFirst.Date:=Date;
 dtLast.Date:=Date;
end;

function TfrmParamDate.GetLastDay(AYear, AMonth: Word): Word;
begin
 Result:=0;
 case AMonth of
  1: Result:=31;
  2: if IsLeapYear(AYear) then Result:=29 else Result:=28;
  3: Result:=31;
  4: Result:=30;
  5: Result:=31;
  6: Result:=30;
  7: Result:=31;
  8: Result:=31;
  9: Result:=30;
  10: Result:=31;
  11: Result:=30;
  12: Result:=31;
 end;
end;

procedure TfrmParamDate.acSelectExecute(Sender: TObject);
var
 nDaysCount: Integer;
begin
 nDaysCount:=Trunc(GetPeriod.Last-GetPeriod.First)+1;
 if (nDaysCount>FMax) and (FMax<>-1) then
  ShowMessage('Установлено ограничение в '+IntToStr(FMax)+' дней. Пожалуйста, выберите меньший период!')
 else
  ModalResult:=mrOk;
end;

procedure TfrmParamDate.beWorkPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmCompanyList, frmCompanyList);
  try
    frmCompanyList.aUpdate.Visible := False;
    frmCompanyList.btn1.Visible := False;
    frmCompanyList.DoShowCompany;
    frmCompanyList.ShowModal;
    if frmCompanyList.ModalResult = MrOK then
      begin
        beWork.Tag := frmCompanyList.odsCompany.FieldByName('FK_ID').AsInteger;
//        beWork.Tag := frmCompanyList.odsCompany.FieldByName('FK_COMPANYID').AsInteger;
        beWork.Text := frmCompanyList.odsCompany.FieldByName('FC_NAME').AsString;
      end;
  finally
    frmCompanyList.Free;
  end;
end;

procedure TfrmParamDate.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmSetUch, frmSetUch);
  try
    frmSetUch.DoShowForm;
    frmSetUch.ShowModal;
    if frmSetUch.ModalResult = mrOk then
      begin
        if frmSetUch.cbAllD.EditingValue = 1 then
          begin
            beUch.Tag := frmSetUch.lcbType.EditValue;
            beUch.Text := 'Все участки - '+frmSetUch.lcbType.EditText;
            isAll := True;
          end else
          begin
            beUch.Tag := frmSetUch.odsListUch.FieldByName('FK_ID').AsInteger;
            beUch.Text := frmSetUch.lcbType.EditText+' - '+frmSetUch.odsListUch.FieldByName('NAMEUCH').AsString;
            isAll := False;
          end;
      end;
  finally
    frmSetUch.Free;
  end;
end;

procedure TfrmParamDate.acCancelExecute(Sender: TObject);
begin
 ModalResult:=mrCancel;
end;

procedure TfrmParamDate.ListChange(Sender: TObject);
var
 I: Integer;
 Y1, M1, D1: Word;
 Y2, M2, D2: Word;
 DateFirst, DateLast: TDateTime;
begin
 if not FCleaning then
   begin
     if (Sender<>cmbYear) or (rdbFullYear.Checked) then
       begin
         FCleaning:=True;
         for I:=0 to grpList.ControlCount-1 do
           begin
             if (grpList.Controls[I].ClassType=TComboBox) and (grpList.Controls[I]<>cmbYear) and (grpList.Controls[I]<>Sender) then
               begin
                 TComboBox(grpList.Controls[I]).ItemIndex:=-1;
               end;
           end;
         if Sender<>cmbYear then rdbFullYear.Checked:=False;
         FCleaning:=False;
       end;

     if cxSpec.EditingValue = -1 then // если специальные даты
       begin
         if Sender=cmbMonth then begin
           DecodeDate(Date, Y1, M1, D1);
           DecodeDate(Date, Y2, M2, D2);
           if cmbMonth.ItemIndex = 0 then
             M1:= 12
           else
             M1:=cmbMonth.ItemIndex;
           M2:=cmbMonth.ItemIndex+1;
         end
         else if Sender=cmbQuarter then begin
           DecodeDate(Date, Y1, M1, D1);
           DecodeDate(Date, Y2, M2, D2);
           if cmbQuarter.ItemIndex = 0 then
             M1:= 12
           else
             M1:=cmbQuarter.ItemIndex*3;
           M2:=cmbQuarter.ItemIndex*3+3;
         end
         else if Sender=cmbHalfYear then begin
           DecodeDate(Date, Y1, M1, D1);
           DecodeDate(Date, Y2, M2, D2);
           if cmbHalfYear.ItemIndex = 0 then
             M1:=12
           else
             M1:=cmbHalfYear.ItemIndex*6;
           M2:=cmbHalfYear.ItemIndex*6+6;
         end
         else if Sender=cmbYear then begin
           if rdbFullYear.Checked then begin
             DecodeDate(Date, Y1, M1, D1);
             DecodeDate(Date, Y2, M2, D2);
             M1:=12;
             M2:=12;
           end
           else begin
             DecodeDate(dtFirst.Date, Y1, M1, D1);
             DecodeDate(dtLast.Date, Y2, M2, D2);
             if cxSpec.EditValue = -1 then
               begin
                 if (cmbMonth.ItemIndex = 0) or (cmbQuarter.ItemIndex = 0) or (cmbHalfYear.ItemIndex = 0) then
                   M1:=12;
               end;
           end;
         end;
        if (cmbMonth.ItemIndex = 0) or (cmbQuarter.ItemIndex = 0) or (cmbHalfYear.ItemIndex = 0) or (rdbFullYear.Checked) then
          Y1:=StrToInt(cmbYear.Text)-1
        else
          Y1:=StrToInt(cmbYear.Text);
        Y2:=StrToInt(cmbYear.Text);
        D1:=21;
        D2:=20;
        DateFirst:=EncodeDate(Y1, M1, D1);
        DateLast:=EncodeDate(Y2, M2, D2);
        if Assigned(FDateCorrect) then FDateCorrect(DateFirst, DateLast);

        dtFirst.Date:=DateFirst;
        dtLast.Date:=DateLast;
  end else
  begin // не специальные даты
  if Sender=cmbMonth then begin
   DecodeDate(Date, Y1, M1, D1);
   DecodeDate(Date, Y2, M2, D2);
   M1:=cmbMonth.ItemIndex+1;
   M2:=cmbMonth.ItemIndex+1;
  end
  else if Sender=cmbQuarter then begin
   DecodeDate(Date, Y1, M1, D1);
   DecodeDate(Date, Y2, M2, D2);
   M1:=cmbQuarter.ItemIndex*3+1;
   M2:=cmbQuarter.ItemIndex*3+3;
  end
  else if Sender=cmbHalfYear then begin
   DecodeDate(Date, Y1, M1, D1);
   DecodeDate(Date, Y2, M2, D2);
   M1:=cmbHalfYear.ItemIndex*6+1;
   M2:=cmbHalfYear.ItemIndex*6+6;
  end
  else if Sender=cmbYear then begin
   if rdbFullYear.Checked then begin
    DecodeDate(Date, Y1, M1, D1);
    DecodeDate(Date, Y2, M2, D2);
    M1:=1;
    M2:=12;
   end
   else begin
    DecodeDate(dtFirst.Date, Y1, M1, D1);
    DecodeDate(dtLast.Date, Y2, M2, D2);
   end;
  end;
  Y1:=StrToInt(cmbYear.Text);
  Y2:=StrToInt(cmbYear.Text);
  D1:=1;
  D2:=GetLastDay(Y2, M2);
  DateFirst:=EncodeDate(Y1, M1, D1);
  DateLast:=EncodeDate(Y2, M2, D2);
  if Assigned(FDateCorrect) then FDateCorrect(DateFirst, DateLast);

  dtFirst.Date:=DateFirst;
  dtLast.Date:=DateLast;
 end;
 end;
//var
// I: Integer;
// Y1, M1, D1: Word;
// Y2, M2, D2: Word;
// DateFirst, DateLast: TDateTime;
//begin
// if not FCleaning then begin
//  if (Sender<>cmbYear) or (rdbFullYear.Checked) then begin
//   FCleaning:=True;
//   for I:=0 to grpList.ControlCount-1 do begin
//    if (grpList.Controls[I].ClassType=TComboBox) and (grpList.Controls[I]<>cmbYear) and (grpList.Controls[I]<>Sender) then begin
//     TComboBox(grpList.Controls[I]).ItemIndex:=-1;
//    end;
//   end;
//   if Sender<>cmbYear then rdbFullYear.Checked:=False;
//   FCleaning:=False;
//  end;
//
//  if Sender=cmbMonth then begin
//   DecodeDate(Date, Y1, M1, D1);
//   DecodeDate(Date, Y2, M2, D2);
//   M1:=cmbMonth.ItemIndex+1;
//   M2:=cmbMonth.ItemIndex+1;
//  end
//  else if Sender=cmbQuarter then begin
//   DecodeDate(Date, Y1, M1, D1);
//   DecodeDate(Date, Y2, M2, D2);
//   M1:=cmbQuarter.ItemIndex*3+1;
//   M2:=cmbQuarter.ItemIndex*3+3;
//  end
//  else if Sender=cmbHalfYear then begin
//   DecodeDate(Date, Y1, M1, D1);
//   DecodeDate(Date, Y2, M2, D2);
//   M1:=cmbHalfYear.ItemIndex*6+1;
//   M2:=cmbHalfYear.ItemIndex*6+6;
//  end
//  else if Sender=cmbYear then begin
//   if rdbFullYear.Checked then begin
//    DecodeDate(Date, Y1, M1, D1);
//    DecodeDate(Date, Y2, M2, D2);
//    M1:=1;
//    M2:=12;
//   end
//   else begin
//    DecodeDate(dtFirst.Date, Y1, M1, D1);
//    DecodeDate(dtLast.Date, Y2, M2, D2);
//   end;
//  end;
//  Y1:=StrToInt(cmbYear.Text);
//  Y2:=StrToInt(cmbYear.Text);
//  D1:=1;
//  D2:=GetLastDay(Y2, M2);
//  DateFirst:=EncodeDate(Y1, M1, D1);
//  DateLast:=EncodeDate(Y2, M2, D2);
//  if Assigned(FDateCorrect) then FDateCorrect(DateFirst, DateLast);
//
//  dtFirst.Date:=DateFirst;
//  dtLast.Date:=DateLast;
// end;
end;

procedure TfrmParamDate.rdbFullYearClick(Sender: TObject);
begin
 ListChange(cmbYear);
end;

procedure TfrmParamDate.ManualChange(Sender: TObject);
begin
 cmbMonth.ItemIndex:=-1;
 cmbQuarter.ItemIndex:=-1;
 cmbHalfYear.ItemIndex:=-1;
 rdbFullYear.Checked:=False;
end;

end.
