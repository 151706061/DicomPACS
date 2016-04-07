unit fSetParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, ActnList,
  dxBar, cxClasses, ExtCtrls, Menus, cxLookAndFeelPainters, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, cxButtons, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxLabel, cxCheckBox, cxBarEditItem, dxSkinOffice2007Green;

type
  TfrmSetParam = class(TForm)
    alOkCancel: TActionList;
    aSet: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxFIOSotr: TcxTextEdit;
    bbSetSotr: TcxButton;
    cxLabel2: TcxLabel;
    cxDateBeg: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxDateEnd: TcxDateEdit;
    bbSetPeriod: TcxButton;
    Panel2: TPanel;
    bSet: TcxButton;
    bCancel: TcxButton;
    procedure aSetExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure bbSetPeriodClick(Sender: TObject);
    procedure bbSetSotrClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetParam: TfrmSetParam;

implementation
uses fMain, uPeriod, fSetSotr;
{$R *.dfm}

procedure TfrmSetParam.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetParam.aSetExecute(Sender: TObject);
begin
  if cxFIOSotr.Tag = 0 then
    begin
      Application.MessageBox('Вы не выбрали сотрудника! Вы можете выбрать сотрудника, нажав на кнопку "Выбрать..."', 'Предупреждение', MB_OK+MB_ICONWARNING);
      bbSetSotr.SetFocus;
    end else
    begin
      ModalResult := mrOk;
    end;
end;

procedure TfrmSetParam.bbSetSotrClick(Sender: TObject);
begin
  Application.CreateForm(TfrmSetSotr, frmSetSotr);
  try
    frmSetSotr.ShowModal;
    if frmSetSotr.ModalResult = mrOK then
      begin
        cxFIOSotr.Text := frmSetSotr.odsSotr.FieldByName('FC_NAME').AsString;
        cxFIOSotr.Tag := frmSetSotr.odsSotr.FieldByName('FK_ID').AsInteger;
        frmMain.pIDSPEC := frmSetSotr.odsSotr.FieldByName('FK_SPRAVID').AsInteger;
      end;
  finally
    frmSetSotr.Free;
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
