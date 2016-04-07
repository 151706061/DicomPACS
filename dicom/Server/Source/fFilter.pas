unit fFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, StdCtrls, cxRadioGroup,
  cxCheckBox, cxControls, cxContainer, cxEdit, cxGroupBox, ExtCtrls,
  JvExExtCtrls, JvExtComponent, JvPanel, Menus, cxLookAndFeelPainters, ActnList,
  cxButtons, cxImage, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, dxSkinOffice2007Green;

type
  TfrmFilter = class(TForm)
    JvPanel1: TJvPanel;
    cxGroupBox1: TcxGroupBox;
    cbDate: TcxCheckBox;
    al: TActionList;
    aSave: TAction;
    aClose: TAction;
    rbAll: TcxRadioButton;
    rbStart: TcxRadioButton;
    rbStop: TcxRadioButton;
    rbError: TcxRadioButton;
    rbEvents: TcxRadioButton;
    rbParamEdit: TcxRadioButton;
    paDate: TJvPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    deBegin: TcxDateEdit;
    deEnd: TcxDateEdit;
    bEditDates: TcxButton;
    Panel1: TPanel;
    bSave: TcxButton;
    bClose: TcxButton;
    procedure aSaveExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure cbDatePropertiesEditValueChanged(Sender: TObject);
    procedure bEditDatesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFilter: TfrmFilter;

implementation
uses uPeriod;
{$R *.dfm}

procedure TfrmFilter.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmFilter.aSaveExecute(Sender: TObject);
begin
  if cbDate.EditValue = 1 then
    begin
      if (deBegin.Text = '') or (deBegin.Text = '0') or (deBegin.Text = '31.12.1899') then
        begin
          Application.MessageBox('Внимание!'+#13+
                                 'Вы включили фильтр по датам, но не указали дату начала!', 'Внимание!', MB_ICONWARNING + MB_OK);
          deBegin.SetFocus;
          Exit;
        end;

      if (deEnd.Text = '') or (deEnd.Text = '0') or (deEnd.Text = '31.12.1899') then
        begin
          Application.MessageBox('Внимание!'+#13+
                                 'Вы включили фильтр по датам, но не указали дату окончания!', 'Внимание!', MB_ICONWARNING + MB_OK);
          deEnd.SetFocus;
          Exit;
        end;
    end;
  
  ModalResult := mrOk;
end;

procedure TfrmFilter.bEditDatesClick(Sender: TObject);
begin
  with TfrmParamDate.Create(Self) do
    begin
      if Execute then
        begin
      if ModalResult = MrOK then
        begin
          deBegin.Date := Period.First;
          deEnd.Date := Period.Last;
        end;
        end;
    Free;
  end;
end;

procedure TfrmFilter.cbDatePropertiesEditValueChanged(Sender: TObject);
begin
  if cbDate.EditValue = 1 then
    begin
      paDate.Enabled := True;
      deBegin.Enabled := True;
      deEnd.Enabled := True;
      bEditDates.Enabled := True;
    end else
    begin
      paDate.Enabled := False;
      deBegin.Enabled := False;
      deEnd.Enabled := False;
      bEditDates.Enabled := False;
    end;
end;

end.
