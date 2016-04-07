unit fAddEditKeys;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, Menus, cxLookAndFeelPainters, DB, OracleData, ActnList,
  StdCtrls, cxButtons, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  ExtCtrls, Oracle, cxCheckBox, dxSkinsCore, dxSkinCaramel,
  dxSkinOffice2007Green;

type
  TfrmAddEditKeys = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    teName: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    teAction: TcxTextEdit;
    bOk: TcxButton;
    cxButton1: TcxButton;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    cxLabel4: TcxLabel;
    lblCode: TcxLabel;
    teSymbol: TcxTextEdit;
    teSynonym: TcxTextEdit;
    odsInfo: TOracleDataSet;
    qUpdateKey: TOracleQuery;
    qInsKey: TOracleQuery;
    cbShift: TcxCheckBox;
    cbCtrl: TcxCheckBox;
    cbAlt: TcxCheckBox;
    cxLabel5: TcxLabel;
    cmbRaion: TcxLookupComboBox;
    dsRaion: TDataSource;
    odsRaion: TOracleDataSet;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure teNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FKeyoid:string;
    FOS:TOracleSession;
  public
    { Public declarations }
    procedure Init(aKeyoid:string; AOS:TOracleSession);
    procedure SaveData();
  end;

  function DoEditKeys(var aKeyoid:string; AOS:TOracleSession):Boolean;

implementation

{$R *.dfm}

function DoEditKeys(var aKeyoid:string; AOS:TOracleSession):Boolean;
var
  frmAddEditKeys: TfrmAddEditKeys;
begin
  Application.CreateForm(TfrmAddEditKeys, frmAddEditKeys);
  with frmAddEditKeys do
  begin
    try
      Init(aKeyoid, AOS);
      Result := ShowModal = mrOk;
      if (Result) then
      begin
        SaveData();
        aKeyoid := FKeyoid;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmAddEditKeys.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditKeys.aOkExecute(Sender: TObject);
begin
  if (lblCode.Caption = '') then
  begin
    Application.MessageBox('Нажмите в поле нужную кнопку для того, чтобы указать код', 'Внимание', MB_OK +
      MB_ICONQUESTION);
    try
      teName.SetFocus;
      Exit;
    except
    end;
  end;

  if (teSymbol.Text = '') then
  begin
    Application.MessageBox('Укажите символ', 'Внимание', MB_OK +
      MB_ICONQUESTION);
    try
      teSymbol.SetFocus;
      Exit;
    except
    end;
  end;

  ModalResult := mrOk;
end;

procedure TfrmAddEditKeys.SaveData();
begin
  if (FKeyoid <> '') then
  begin
    with qUpdateKey do
    begin
      SetVariable('pfc_key', lblCode.Caption);
      SetVariable('pfc_synonym', teSynonym.Text);
      SetVariable('pfc_name', teAction.Text);
      SetVariable('pfc_symbol', teSymbol.Text);
      if cbShift.Checked then
        SetVariable('PFL_SHIFT', 1)
      else
        SetVariable('PFL_SHIFT', 0);
      if cbCtrl.Checked then
        SetVariable('PFL_CTRL', 1)
      else
        SetVariable('PFL_CTRL', 0);
      if cbAlt.Checked then
        SetVariable('PFL_ALT', 1)
      else
        SetVariable('PFL_ALT', 0);
      SetVariable('poid', FKeyoid);
      SetVariable('pfk_raion', cmbRaion.EditValue);              
      Execute;
      FKeyoid := GetVariable('poid');
      FOS.Commit;
    end;
  end
  else begin
    with qInsKey do
    begin
      SetVariable('pfc_key', lblCode.Caption);
      SetVariable('pfc_synonym', teSynonym.Text);
      SetVariable('pfc_name', teAction.Text);
      SetVariable('pfc_symbol', teSymbol.Text);
      if cbShift.Checked then
        SetVariable('PFL_SHIFT', 1)
      else
        SetVariable('PFL_SHIFT', 0);
      if cbCtrl.Checked then
        SetVariable('PFL_CTRL', 1)
      else
        SetVariable('PFL_CTRL', 0);
      if cbAlt.Checked then
        SetVariable('PFL_ALT', 1)
      else
        SetVariable('PFL_ALT', 0);
      SetVariable('pfk_raion', cmbRaion.EditValue);              
      Execute;
      FKeyoid := GetVariable('poid');
      FOS.Commit;      
    end;
  end;

end;

procedure TfrmAddEditKeys.teNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  lblCode.Caption := IntToStr(Key);
  cbShift.Checked := Shift >= [ssShift];
  cbCtrl.Checked := Shift >= [ssCtrl];
  cbAlt.Checked := Shift >= [ssAlt];
  teSymbol.Text := Chr(Key);  
end;

procedure TfrmAddEditKeys.Init(aKeyoid:string; AOS:TOracleSession);
begin
  FOS := AOS;
  FKeyoid := aKeyoid;
  odsInfo.Session := AOS;
  qUpdateKey.Session := AOS;
  qInsKey.Session := AOS;
  odsRaion.Session := AOS;
  odsRaion.Open;
  if (FKeyoid <> '') then
  begin
    with odsInfo do
    begin
      Close;
      SetVariable('poid', FKeyoid);
      Open;
      lblCode.Caption := FieldByName('fc_key').AsString;
      teSymbol.Text := FieldByName('fc_symbol').AsString;
      teSynonym.Text := FieldByName('fc_synonym').AsString;
      teAction.Text := FieldByName('fc_name').AsString;
      cbShift.Checked := FieldByName('fl_shift').AsString = '1';
      cbCtrl.Checked := FieldByName('fl_ctrl').AsString = '1';
      cbAlt.Checked := FieldByName('fl_alt').AsString = '1';
      cmbRaion.EditValue := FieldByName('fk_raion').AsVariant;
    end;
  end
  else begin
    lblCode.Caption := '';
  end;
end;

end.

