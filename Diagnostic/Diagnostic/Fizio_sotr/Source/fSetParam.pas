unit fSetParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, ActnList,
  dxBar, cxClasses, ExtCtrls, Menus, cxLookAndFeelPainters, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, cxButtons, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxLabel, cxCheckBox, cxBarEditItem, cxGraphics,
  dxSkinOffice2007Green;

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
    bClearSotr: TcxButton;
    cxLabel4: TcxLabel;
    teUsl: TcxTextEdit;
    bSetUsl: TcxButton;
    bClearUsl: TcxButton;
    cbType: TcxComboBox;
    Panel2: TPanel;
    bSet: TcxButton;
    bCancel: TcxButton;
    procedure aSetExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure bbSetPeriodClick(Sender: TObject);
    procedure bbSetSotrClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bClearSotrClick(Sender: TObject);
    procedure bClearUslClick(Sender: TObject);
    procedure bSetUslClick(Sender: TObject);
    procedure cbTypePropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetParam: TfrmSetParam;

implementation
uses fMain, uPeriod, fSetSotr, fSetUsl;
{$R *.dfm}

procedure TfrmSetParam.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetParam.aSetExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetParam.bbSetSotrClick(Sender: TObject);
begin
  Application.CreateForm(TfrmSetSotr, frmSetSotr);
  try
    if cbType.EditValue = 'по врачу' then
      begin
        frmSetSotr.odsSotr.Close;
        frmSetSotr.odsSotr.SetVariable('pfl_vrach', 1);
        frmSetSotr.odsSotr.Open;
      end else
      begin
        frmSetSotr.odsSotr.Close;
        frmSetSotr.odsSotr.SetVariable('pfl_vrach', 0);
        frmSetSotr.odsSotr.Open;
      end;
    frmSetSotr.ShowModal;
    if frmSetSotr.ModalResult = mrOK then
      begin
        cxFIOSotr.Text := frmSetSotr.odsSotr.FieldByName('FC_NAME').AsString;
        cxFIOSotr.Tag := frmSetSotr.odsSotr.FieldByName('FK_ID').AsInteger;
      end;
  finally
    frmSetSotr.Free;
  end;
end;

procedure TfrmSetParam.bClearSotrClick(Sender: TObject);
begin
  cxFIOSotr.Clear;
  cxFIOSotr.Tag := 0;
end;

procedure TfrmSetParam.bClearUslClick(Sender: TObject);
begin
  teUsl.Clear;
  teUsl.Tag := 0;
end;

procedure TfrmSetParam.bSetUslClick(Sender: TObject);
begin
  Application.CreateForm(TfrmSetUsl, frmSetUsl);
  try
    frmSetUsl.ShowModal;
    if frmSetUsl.ModalResult = mrOK then
      begin
        teUsl.Text := frmSetUsl.odsList.FieldByName('FC_NAME').AsString;
        teUsl.Tag := frmSetUsl.odsList.FieldByName('FK_ID').AsInteger;
      end;
  finally
    frmSetUsl.Free;
  end;
end;

procedure TfrmSetParam.cbTypePropertiesChange(Sender: TObject);
begin
  if cxFIOSotr.Text <> '' then
    begin
      cxFIOSotr.Tag := 0;
      cxFIOSotr.Clear;
    end;
end;

procedure TfrmSetParam.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
//ShowMessage(IntToStr(cxCheck.EditValue));
end;

procedure TfrmSetParam.FormCreate(Sender: TObject);
begin
  //
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
