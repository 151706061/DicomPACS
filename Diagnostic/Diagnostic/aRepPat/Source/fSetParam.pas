unit fSetParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, ActnList,
  dxBar, cxClasses, ExtCtrls, Menus, cxLookAndFeelPainters, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, cxButtons, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxLabel, cxButtonEdit, dxSkinOffice2007Green;

type
  TfrmSetParam = class(TForm)
    alOkCancel: TActionList;
    aSet: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxDateBeg: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxDateEnd: TcxDateEdit;
    bbSetPeriod: TcxButton;
    beOtdel: TcxButtonEdit;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure aSetExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure bbSetPeriodClick(Sender: TObject);
    procedure beOtdelPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetParam: TfrmSetParam;

implementation
uses fMain, uPeriod, fSetValue;
{$R *.dfm}

procedure TfrmSetParam.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetParam.aSetExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetParam.bbSetPeriodClick(Sender: TObject);
begin
  with TfrmParamDate.Create(Self) do
    begin
      if Execute then
        begin
      if ModalResult = MrOK then
        begin
          cxDateBeg.Date := Period.First;
          cxDateEnd.Date := Period.Last;
        end;
        end;
    Free;
  end;
end;

procedure TfrmSetParam.beOtdelPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetValue, frmSetValue);
      try
        frmSetValue.Caption := 'Выбор подразделения';
        frmSetValue.odsList.Close;
        frmSetValue.odsList.Open;
        frmSetValue.ShowModal;
        if frmSetValue.ModalResult = mrOk then
          begin
            beOtdel.Text := frmSetValue.odsList.FieldByName('fc_name').AsString;
            beOtdel.Tag := frmSetValue.odsList.FieldByName('fk_id').AsInteger;
          end;
      finally
        frmSetValue.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      beOtdel.Text := '';
      beOtdel.Tag := -1;
    end;
end;

end.
