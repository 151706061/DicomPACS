unit fSetParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, ActnList,
  cxClasses, ExtCtrls, Menus, cxLookAndFeelPainters, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, cxButtons, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxLabel, dxSkinOffice2007Green;

type
  TfrmSetParam = class(TForm)
    alOkCancel: TActionList;
    aSet: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxDs: TcxTextEdit;
    bbSetDs: TcxButton;
    cxLabel2: TcxLabel;
    cxDateBeg: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxDateEnd: TcxDateEdit;
    bbSetPeriod: TcxButton;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure aSetExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure bbSetPeriodClick(Sender: TObject);
    procedure bbSetDsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetParam: TfrmSetParam;

implementation
uses fMain, uPeriod, fSetDs;
{$R *.dfm}

procedure TfrmSetParam.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetParam.aSetExecute(Sender: TObject);
begin
  if cxDs.Tag = 0 then
    begin
      Application.MessageBox('Вы не выбрали диагноз или группу диагнозов! Вы можете сделать это, нажав на кнопку "Выбрать..."', 'Предупреждение', MB_OK+MB_ICONWARNING);
      bbSetDs.SetFocus;
    end else
    begin
      ModalResult := mrOk;
    end;
end;

procedure TfrmSetParam.bbSetDsClick(Sender: TObject);
begin
  Application.CreateForm(TfrmSetDs, frmSetDs);
  try
    frmSetDs.DoShowForm;
    frmSetDs.ShowModal;
    if frmSetDs.ModalResult = mrOk then
      begin
        cxDs.Tag := frmSetDs.odsDiag.FieldByName('FK_ID').AsInteger;
        cxDs.Text := '('+frmSetDs.odsDiag.FieldByName('FK_MKB10').AsString+') '+frmSetDs.odsDiag.FieldByName('FC_NAME').AsString;
      end;
  finally
    frmSetDs.Free;
  end;
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

end.
