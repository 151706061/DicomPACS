unit fAddEditCompany;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, dxBar,
  ExtCtrls, cxClasses, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, StdCtrls, ActnList, cxSpinEdit, cxLabel, dxSkinOffice2007Green;

type
  TfrmAddEditCompany = class(TForm)
    Panel1: TPanel;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbOK: TdxBarButton;
    bbCancel: TdxBarButton;
    lbl4: TLabel;
    cxCompany: TcxButtonEdit;
    alOkCancel: TActionList;
    aOK: TAction;
    aCancel: TAction;
    cxOrder: TcxSpinEdit;
    lbl1: TLabel;
    cxLabel1: TcxLabel;
    cxName: TcxTextEdit;
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure cxCompanyPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditCompany: TfrmAddEditCompany;

implementation
uses fMain, fCompanyList;
{$R *.dfm}

procedure TfrmAddEditCompany.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditCompany.aOKExecute(Sender: TObject);
begin
  cxOrder.PostEditValue;
  if cxCompany.Tag = 0 then
    begin
      Application.MessageBox('Вы не поставили соответствие из справочника компаний!', 'Предупреждение!', MB_OK+MB_ICONWARNING);
      cxCompany.SetFocus;
      Exit;
    end;
  if (cxOrder.EditValue = 0) or (cxOrder.EditText = '') or (cxOrder.EditValue < 0) then
    begin
      Application.MessageBox('Вы поставили в поле "Порядок" ноль, значение меньше нуля или пустое значение. Это недопустимо! !', 'Предупреждение!', MB_OK+MB_ICONWARNING);
      cxOrder.SetFocus;
      Exit;
    end;
   
  ModalResult := mrOK;
end;

procedure TfrmAddEditCompany.cxCompanyPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  Application.CreateForm(TfrmCompanyList, frmCompanyList);
  frmCompanyList.DoShowCompany;
  frmCompanyList.ShowModal;
  if frmCompanyList.ModalResult = MrOK then
    begin
      cxCompany.Text := frmCompanyList.odsCompany.FieldByName('FC_NAME').AsString;
      cxName.Text := frmCompanyList.odsCompany.FieldByName('FC_NAME').AsString;
      cxCompany.Tag := frmCompanyList.odsCompany.FieldByName('FK_ID').AsInteger;
    end;
  frmCompanyList.Free;
end;

end.
