unit fSetParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, ActnList,
  dxBar, cxClasses, ExtCtrls, Menus, cxLookAndFeelPainters, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, cxButtons, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxLabel, cxCheckBox, cxBarEditItem, dxSkinOffice2007Green,
  cxGraphics;

type
  TfrmSetParam = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbSet: TdxBarButton;
    bbCancel: TdxBarButton;
    alOkCancel: TActionList;
    aSet: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    bbSetSotr: TcxButton;
    cxLabel2: TcxLabel;
    cxDateBeg: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxDateEnd: TcxDateEdit;
    bbSetPeriod: TcxButton;
    cxCheck: TcxBarEditItem;
    cbVar: TcxComboBox;
    lbValue: TcxLabel;
    procedure aSetExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure bbSetPeriodClick(Sender: TObject);
    procedure bbSetSotrClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbVarPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetParam: TfrmSetParam;

implementation
uses fMain, uPeriod, fSetSotr, fSetOtdel;
{$R *.dfm}

procedure TfrmSetParam.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetParam.aSetExecute(Sender: TObject);
begin
  if lbValue.Tag = 0
  then begin
    Application.MessageBox('Вы не выбрали значение! Вы можете это сделать, нажав на кнопку "Выбрать..."', 'Предупреждение', MB_OK+MB_ICONWARNING);
    bbSetSotr.SetFocus;
  end
  else begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmSetParam.bbSetSotrClick(Sender: TObject);
begin
  if cbVar.Text = 'отделение'
  then begin
    Application.CreateForm(TfrmSetOtdel, frmSetOtdel);

    try
      frmSetOtdel.ShowModal;

      if frmSetOtdel.ModalResult = mrOK
      then begin
        lbValue.Caption := frmSetOtdel.odsOtdel.FieldByName('fc_name').AsString;
        lbValue.Tag := frmSetOtdel.odsOtdel.FieldByName('fk_id').AsInteger;
      end;
    finally
      frmSetOtdel.Free;
    end;
  end;

  if cbVar.Text = 'сотрудник'
  then begin
    Application.CreateForm(TfrmSetSotr, frmSetSotr);

    try
      frmSetSotr.ShowModal;

      if frmSetSotr.ModalResult = mrOK
      then begin
        lbValue.Caption := frmSetSotr.odsSotr.FieldByName('FIO').AsString;
        lbValue.Tag := frmSetSotr.odsSotr.FieldByName('FK_ID').AsInteger;
        frmMain.pIDSPEC := frmSetSotr.odsSotr.FieldByName('FK_SPRAVID').AsInteger;
      end;
    finally
      frmSetSotr.Free;
    end;
  end;
end;

procedure TfrmSetParam.cbVarPropertiesChange(Sender: TObject);
begin
  lbValue.Caption := '--';
  lbValue.Tag := 0;
end;

procedure TfrmSetParam.FormCreate(Sender: TObject);
begin
  //
end;

procedure TfrmSetParam.bbSetPeriodClick(Sender: TObject);
begin
  with TfrmParamDate.Create(Self) do
  begin
    if Execute
    then begin
      if ModalResult = MrOK
      then begin
        cxDateBeg.Date := Period.First;
        cxDateEnd.Date := Period.Last;
      end;
    end;

    Free;
  end;
end;

end.
