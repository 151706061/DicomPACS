unit fSetParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, ActnList,
  cxClasses, ExtCtrls, Menus, cxLookAndFeelPainters, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, cxButtons, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxLabel, dateutils, cxSpinEdit, dxSkinOffice2007Green;

type
  TfrmSetParam = class(TForm)
    alOkCancel: TActionList;
    aSet: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    cxName: TcxTextEdit;
    bbSetName: TcxButton;
    cxYear: TcxSpinEdit;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure aSetExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure bbSetNameClick(Sender: TObject);
  private
    { Private declarations }
  public
    datebeg : TDateTime;
    dateend : TDateTime;
    { Public declarations }
  end;

var
  frmSetParam: TfrmSetParam;

implementation
uses fMain, fSetPeriod;
{$R *.dfm}

procedure TfrmSetParam.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetParam.aSetExecute(Sender: TObject);
begin
  if cxName.Tag = 0 then
    begin
      Application.MessageBox('Вы не выбрали месяц! Вы можете выбрать месяц, нажав на кнопку "Выбрать..."', 'Предупреждение', MB_OK+MB_ICONWARNING);
      bbSetName.SetFocus;
      Exit;
    end;

  if cxYear.Value = 0 then
    begin
      Application.MessageBox('Вам необходимо указать год сборки отчета!', 'Предупреждение !', MB_OK + MB_ICONWARNING);
      cxYear.SetFocus;
      Exit;
    end;

  frmMain.sDatePeriod := '15.'+frmMain.sMonthPeriod+'.'+IntToStr(cxYear.Value);
  datebeg := StartOfTheMonth(StrTodateTime(frmMain.sDatePeriod));
  dateend := EndOfTheMonth(StrTodateTime(frmMain.sDatePeriod));

  ModalResult := mrOk;
end;

procedure TfrmSetParam.bbSetNameClick(Sender: TObject);
begin
  Application.CreateForm(TfrmSetPeriod, frmSetPeriod);
  try
    frmSetPeriod.DoShowForm(cxName.Tag);
    frmSetPeriod.ShowModal;
    if frmSetPeriod.ModalResult = MrOK then
      begin
        cxName.Tag := frmSetPeriod.ods.FieldByName('FK_ID').AsInteger;
        cxName.Text := frmSetPeriod.ods.FieldByName('FC_NAME').AsString;
        frmMain.sMonthPeriod := frmSetPeriod.ods.FieldByName('DATE1_MON').AsString;
      end;
  finally
    frmSetPeriod.Free;
  end;
end;

end.
