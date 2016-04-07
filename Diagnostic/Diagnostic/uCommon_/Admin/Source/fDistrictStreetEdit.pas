unit fDistrictStreetEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, dxSkinsCore, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, StdCtrls, Menus, cxLookAndFeelPainters,
  ActnList, cxButtons, DB, OracleData, Oracle, dxSkinCaramel,
  dxSkinOffice2007Green, ExtCtrls;

type
  TfrmDistrictStreetEdit = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    qInsert: TOracleQuery;
    odsRaion: TOracleDataSet;
    dsRaion: TDataSource;
    dsStreet: TDataSource;
    odsStreet: TOracleDataSet;
    qUpdate: TOracleQuery;
    odsDistrict: TOracleDataSet;
    Panel1: TPanel;
    Label1: TLabel;
    cmbRaion: TcxLookupComboBox;
    Label2: TLabel;
    cmbStreet: TcxLookupComboBox;
    Label3: TLabel;
    teEvenS: TcxTextEdit;
    Label4: TLabel;
    teEvenPo: TcxTextEdit;
    Label5: TLabel;
    teOddS: TcxTextEdit;
    Label6: TLabel;
    teOddPo: TcxTextEdit;
    procedure teEvenSKeyPress(Sender: TObject; var Key: Char);
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure cmbRaionPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FRaion:Variant;
    FDistrict:Integer;
    procedure SetRaion(value:Variant);
  public
    { Public declarations }
    procedure Init(aos:TOracleSession; var adistrict:Integer);
    function SaveData():Integer;

    property Raion:Variant read FRaion write SetRaion;
  end;

  function GetDistrict(aos:TOracleSession; var adistrict:Integer):Boolean;

implementation
uses fDistrictStreet;

{$R *.dfm}

function GetDistrict(aos:TOracleSession; var adistrict:Integer):Boolean;
var frmDistrictStreetEdit: TfrmDistrictStreetEdit;
begin
  Application.CreateForm(TfrmDistrictStreetEdit, frmDistrictStreetEdit);
  with frmDistrictStreetEdit do
    begin
      try
        Init(aos, adistrict);
        Result := ShowModal = mrOk;
        if (Result) then
          adistrict := SaveData();
      finally
        Free;
      end;
    end;
end;

procedure TfrmDistrictStreetEdit.Init(aos:TOracleSession; var adistrict:Integer);
begin
  qInsert.Session := aos;
  qUpdate.Session := aos;
  odsRaion.Session := aos;
  odsStreet.Session := aos;
  odsDistrict.Session := aos;
  odsRaion.Open;

  FDistrict := adistrict;
  if (FDistrict > 0) then
    begin
      with odsDistrict do
        begin
          Close;
          SetVariable('PFK_ID', FDistrict);
          Open;
          if RecordCount > 0 then  // изменение
            begin
              cmbRaion.EditValue := FieldByName('fk_raion').AsVariant;
              cmbStreet.EditValue := FieldByName('fk_street').AsVariant;
              teEvenS.Text := IntToStr(frmDistrictStreet.odsDistrictStreet.FieldByName('fn_evens').AsInteger);
              teEvenPo.Text := IntToStr(frmDistrictStreet.odsDistrictStreet.FieldByName('fn_evenpo').AsInteger);
              teOddS.Text := IntToStr(frmDistrictStreet.odsDistrictStreet.FieldByName('fn_odds').AsInteger);
              teOddPo.Text := IntToStr(frmDistrictStreet.odsDistrictStreet.FieldByName('fn_oddpo').AsInteger);
            end;
        end;
    end;
end;

function TfrmDistrictStreetEdit.SaveData():Integer;
var vEvenS, vEvenPo, vOddS, vOddPo: Variant;
begin
  cmbStreet.PostEditValue;
  if (teEvenS.Text = '') then
    vEvenS := null
  else
    vEvenS := StrToInt(teEvenS.Text);
  if (teEvenPo.Text = '') then
    vEvenPo := null
  else
    vEvenPo := StrToInt(teEvenPo.Text);
  if (teOddS.Text = '') then
    vOddS := null
  else
    vOddS := StrToInt(teOddS.Text);
  if (teOddPo.Text = '') then
    vOddPo := null
  else
    vOddPo := StrToInt(teOddPo.Text);

  if FDistrict > 0 then
    begin
      qUpdate.SetVariable('PFK_RAION', Raion);
      qUpdate.SetVariable('PFK_STREET', cmbStreet.EditValue);
      qUpdate.SetVariable('PFN_EVENS', vEvenS);
      qUpdate.SetVariable('PFN_EVENPO', vEvenPo);
      qUpdate.SetVariable('PFN_ODDS', vOddS);
      qUpdate.SetVariable('PFN_ODDPO', vOddPo);
      qUpdate.SetVariable('PID', FDistrict);
      qUpdate.Execute;
      qUpdate.Session.Commit;
    end else
    begin
      qInsert.SetVariable('PFK_RAION', Raion);
      qInsert.SetVariable('PFK_STREET', cmbStreet.EditValue);
      qInsert.SetVariable('PFN_EVENS', vEvenS);
      qInsert.SetVariable('PFN_EVENPO', vEvenPo);
      qInsert.SetVariable('PFN_ODDS', vOddS);
      qInsert.SetVariable('PFN_ODDPO', vOddPo);
      qInsert.Execute;
      FDistrict := qInsert.GetVariable('pid');
      qInsert.Session.Commit;
    end;
  Result := FDistrict;
end;

procedure TfrmDistrictStreetEdit.aCancelExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfrmDistrictStreetEdit.aOkExecute(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfrmDistrictStreetEdit.cmbRaionPropertiesChange(Sender: TObject);
begin
  Raion := cmbRaion.EditValue;
end;

procedure TfrmDistrictStreetEdit.teEvenSKeyPress(Sender: TObject; var Key: Char);
begin
  if (not (key in ['0'..'9'])) and (key<>chr(8)) then
    key:=chr(0);
end;

procedure TfrmDistrictStreetEdit.SetRaion(value:Variant);
var iStreet:Variant;
begin
  if FRaion <> value then
    begin
      FRaion := value;
      with odsStreet do
        begin
          if (Active) then
            iStreet := FieldByName('fk_id').AsVariant;
          Close;
          Open;
          Locate('fk_id',iStreet,[]);
          cmbStreet.EditValue := FieldByName('fk_id').AsVariant;
        end;
    end;
end;

end.
