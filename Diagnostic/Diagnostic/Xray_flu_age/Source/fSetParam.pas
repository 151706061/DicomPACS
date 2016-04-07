unit fSetParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, ActnList,
  dxBar, cxClasses, ExtCtrls, Menus, cxLookAndFeelPainters, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, cxButtons, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxLabel, cxGraphics, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DB, OracleData, cxSpinEdit, cxButtonEdit,
  dxSkinOffice2007Green;

type
  TfrmSetParam = class(TForm)
    alOkCancel: TActionList;
    aSet: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    cxLabel2: TcxLabel;
    cxDateBeg: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxDateEnd: TcxDateEdit;
    bbSetPeriod: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel4: TcxLabel;
    cxNational: TcxLookupComboBox;
    cxProj: TcxLookupComboBox;
    dsProj: TDataSource;
    odsProj: TOracleDataSet;
    odsNational: TOracleDataSet;
    dsNational: TDataSource;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    seAgeStart: TcxSpinEdit;
    seAgeEnd: TcxSpinEdit;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    beWork: TcxButtonEdit;
    cxLabel9: TcxLabel;
    beUch: TcxButtonEdit;
    Panel2: TPanel;
    bSet: TcxButton;
    bCancel: TcxButton;
    procedure aSetExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure bbSetPeriodClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure beWorkPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure beUchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetParam: TfrmSetParam;

implementation
uses fMain, uPeriod, fCompanyList, fSetUch;
{$R *.dfm}

procedure TfrmSetParam.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetParam.aSetExecute(Sender: TObject);
begin
  if seAgeStart.EditValue < 0 then
    begin
      Application.MessageBox('Значение возраста не может быть меньше нуля!', 'Внимание', MB_OK+MB_ICONWARNING);
      seAgeStart.SetFocus;
      Exit;
    end;
  if seAgeEnd.EditValue < 0 then
    begin
      Application.MessageBox('Значение возраста не может быть меньше нуля!', 'Внимание', MB_OK+MB_ICONWARNING);
      seAgeEnd.SetFocus;
      Exit;
    end;

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

procedure TfrmSetParam.beUchPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmSetUch, frmSetUch);
  try
    frmSetUch.DoShowForm;
    frmSetUch.ShowModal;
    if frmSetUch.ModalResult = mrOk then
      begin
        beUch.Tag := frmSetUch.odsListUch.FieldByName('FK_ID').AsInteger;
        beUch.Text := frmSetUch.lcbType.EditText+' - '+frmSetUch.odsListUch.FieldByName('NAMEUCH').AsString;
      end;
  finally
    frmSetUch.Free;
  end;
end;

procedure TfrmSetParam.beWorkPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmCompanyList, frmCompanyList);
  try
    frmCompanyList.aAdd.Visible := False;
    frmCompanyList.aEdit.Visible := False;
    frmCompanyList.aUpdate.Visible := False;
    frmCompanyList.btn1.Visible := False;
    frmCompanyList.btn2.Visible := False;
    frmCompanyList.DoShowCompany;
    frmCompanyList.ShowModal;
    if frmCompanyList.ModalResult = MrOK then
      begin
        beWork.Tag := frmCompanyList.odsCompany.FieldByName('FK_ID').AsInteger;
        beWork.Text := frmCompanyList.odsCompany.FieldByName('FC_NAME').AsString;
      end;
  finally
    frmCompanyList.Free;
  end;
end;

procedure TfrmSetParam.FormCreate(Sender: TObject);
begin
  if odsProj.Active = False then
    odsProj.Active := True;
  if odsNational.Active = False then
    odsNational.Active := True;
end;

end.
