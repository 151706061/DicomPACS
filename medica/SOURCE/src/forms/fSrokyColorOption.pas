unit fSrokyColorOption;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxGraphics, DB, OracleData, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxLabel, cxImage, cxControls, cxContainer, cxEdit, cxGroupBox,
  Menus, StdCtrls, cxButtons, Oracle, SmMainAPI;

type
  TfrmSrokyColorOption = class(TForm)
    gbColorDecode: TcxGroupBox;
    imRed: TcxImage;
    imYellow: TcxImage;
    imGreen: TcxImage;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    sedRed: TcxSpinEdit;
    sedYellow: TcxSpinEdit;
    sedGreen: TcxSpinEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    lcbRed: TcxLookupComboBox;
    odsPeriods: TOracleDataSet;
    dsPeriods: TDataSource;
    lcbYellow: TcxLookupComboBox;
    lcbGreen: TcxLookupComboBox;
    btnCancel: TcxButton;
    btnOk: TcxButton;
    cd: TColorDialog;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure sedRedPropertiesChange(Sender: TObject);
    procedure sedYellowPropertiesChange(Sender: TObject);
    procedure lcbRedPropertiesChange(Sender: TObject);
    procedure lcbYellowPropertiesChange(Sender: TObject);
    procedure lcbGreenPropertiesChange(Sender: TObject);
    procedure sedGreenPropertiesChange(Sender: TObject);
    procedure imRedClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSrokyColorOption: TfrmSrokyColorOption;

implementation

uses fdmMain;

{$R *.dfm}

procedure TfrmSrokyColorOption.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSrokyColorOption.btnOkClick(Sender: TObject);
begin
  dmMain.pkgSmini.Writestring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_RED_RANGE_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr(sedRed.Value));
  dmMain.pkgSmini.Writestring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_YELLOW_RANGE_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr(sedYellow.Value));
  dmMain.pkgSmini.Writestring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_GREEN_RANGE_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr(sedGreen.Value));

  dmMain.pkgSmini.Writestring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_RED_RANGE_COLOR_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr(imRed.Style.Color));
  dmMain.pkgSmini.Writestring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_YELLOW_RANGE_COLOR_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr(imYellow.Style.Color));
  dmMain.pkgSmini.Writestring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_GREEN_RANGE_COLOR_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr(imGreen.Style.Color));
  dmMain.os.Commit;
  ModalResult := mrOk;
end;

procedure TfrmSrokyColorOption.FormCreate(Sender: TObject);
begin
  sedRed.EditValue    := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_RED_RANGE_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr(dmMain.ConfigParams.GetParamValue('FUNC_COLORED_KART_BY_SROKY_RED_RANGE', 1))));
  sedYellow.EditValue := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_YELLOW_RANGE_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr(dmMain.ConfigParams.GetParamValue('FUNC_COLORED_KART_BY_SROKY_YELLOW_RANGE', 7))));
  sedGreen.EditValue  := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_GREEN_RANGE_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr(dmMain.ConfigParams.GetParamValue('FUNC_COLORED_KART_BY_SROKY_GREEN_RANGE', 31))));

  imRed.Style.Color    := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_RED_RANGE_COLOR_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr($00AAAAFF)));
  imYellow.Style.Color := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_YELLOW_RANGE_COLOR_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr($00AAFFFF)));
  imGreen.Style.Color  := StrToInt(dmMain.pkgSmini.Readstring('MEDICA.EXE', 'FUNC_COLORED_KART_BY_SROKY_GREEN_RANGE_COLOR_'+dmMain.CurMO_SKLAD_SYNONIM, IntToStr($00AAFFAA)));

  odsPeriods.Open;
end;

procedure TfrmSrokyColorOption.imRedClick(Sender: TObject);
begin
  cd.Color := TcxImage(Sender).Style.Color;
  if cd.Execute then
    TcxImage(Sender).Style.Color := cd.Color;
end;

procedure TfrmSrokyColorOption.lcbGreenPropertiesChange(Sender: TObject);
begin
  if lcbGreen.EditValue >= sedGreen.Properties.MinValue then
  begin
    sedGreen.EditValue := lcbGreen.EditValue;
  end
  else
    lcbGreen.EditValue := sedGreen.EditValue;
end;

procedure TfrmSrokyColorOption.lcbRedPropertiesChange(Sender: TObject);
begin
  if lcbRed.EditValue >= sedRed.Properties.MinValue then
  begin
    sedRed.EditValue := lcbRed.EditValue;
    sedRedPropertiesChange(sedRed);
  end;
end;

procedure TfrmSrokyColorOption.lcbYellowPropertiesChange(Sender: TObject);
begin
  if lcbYellow.EditValue >= sedYellow.Properties.MinValue then
  begin
    sedYellow.EditValue := lcbYellow.EditValue;
    sedYellowPropertiesChange(sedYellow);
  end
  else
    lcbYellow.EditValue := sedYellow.EditValue;
end;

procedure TfrmSrokyColorOption.sedGreenPropertiesChange(Sender: TObject);
begin
  lcbGreen.EditValue := sedGreen.EditValue;
end;

procedure TfrmSrokyColorOption.sedRedPropertiesChange(Sender: TObject);
begin
  sedYellow.Properties.MinValue := sedRed.Value + 1;
  lcbRed.EditValue := sedRed.EditValue;
end;

procedure TfrmSrokyColorOption.sedYellowPropertiesChange(Sender: TObject);
begin
  sedGreen.Properties.MinValue := sedYellow.Value + 1;
  lcbYellow.EditValue := sedYellow.EditValue;
end;

end.
