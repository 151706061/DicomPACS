unit fTreb_Quota_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdmMain, JvComponentBase, JvFormPlacement, ActnList, ComCtrls,
  ToolWin, StdCtrls, Mask, JvExMask, JvToolEdit, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxLabel, cxDropDownEdit,
  cxCalendar, cxSpinEdit, DB, OracleData, Oracle;

type
  TfmTreb_Quota_Edit = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    ToolButton3: TToolButton;
    al: TActionList;
    acSave: TAction;
    acCancel: TAction;
    FormStorage: TJvFormStorage;
    bedMedic: TcxButtonEdit;
    teEI: TcxTextEdit;
    seKol: TcxSpinEdit;
    deDate1: TcxDateEdit;
    deDate2: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    odsMedic_EI: TOracleDataSet;
    odsTTreb_Quota: TOracleDataSet;
    oqCreate: TOracleQuery;
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure acSaveExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FMedicID: integer;
    ID : integer;
    procedure SetMedicID(const Value: integer);
    { Private declarations }

  public
    { Public declarations }
    property MedicID: integer read FMedicID write SetMedicID;
  end;

  function DoShowQuotaEdit(var pID: integer): integer;

var
  fmTreb_Quota_Edit: TfmTreb_Quota_Edit;



implementation
uses
  fMedic, fMainForm;
{$R *.dfm}

function DoShowQuotaEdit(var pID: integer): integer;
//==============================================================================
begin
  Application.CreateForm(TfmTreb_Quota_Edit, fmTreb_Quota_Edit);
  fmTreb_Quota_Edit.ID := pID;
  if pID > 0 then
  begin
    fmTreb_Quota_Edit.odsTTreb_Quota.SetVariable('FK_ID', pID);
    fmTreb_Quota_Edit.odsTTreb_Quota.Open;
    fmTreb_Quota_Edit.MedicID           := nvl(fmTreb_Quota_Edit.odsTTreb_Quota.FieldByName('fk_medic_id').AsVariant, -1);
    fmTreb_Quota_Edit.seKol.EditValue   := fmTreb_Quota_Edit.odsTTreb_Quota.FieldByName('FN_KOL').AsVariant;
    fmTreb_Quota_Edit.deDate1.EditValue := fmTreb_Quota_Edit.odsTTreb_Quota.FieldByName('FD_DATE1').AsVariant;
    fmTreb_Quota_Edit.deDate2.EditValue := fmTreb_Quota_Edit.odsTTreb_Quota.FieldByName('FD_DATE2').AsVariant;
  end;

  result := fmTreb_Quota_Edit.ShowModal;
  pID := fmTreb_Quota_Edit.ID;
  FreeAndNil(fmTreb_Quota_Edit);
end;

procedure TfmTreb_Quota_Edit.acCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmTreb_Quota_Edit.acSaveExecute(Sender: TObject);
begin
  if MedicID < 1 then
  begin
    Application.MessageBox('Не выбран медикамент.','Подтверждение',MB_OK+MB_ICONERROR);
    bedMedic.SetFocus;
    Exit;
  end;

  seKol.PostEditValue;
  if seKol.EditValue = 0 then
  begin
    Application.MessageBox('Не указано кол-во медикаментов.','Подтверждение',MB_OK+MB_ICONERROR);
    seKol.SetFocus;
    Exit;
  end;

  deDate1.PostEditValue;
  if VarIsNull(deDate1.EditValue) then
  begin
    Application.MessageBox('Не указано кол-во медикаментов.','Подтверждение',MB_OK+MB_ICONERROR);
    seKol.SetFocus;
    Exit;
  end;

  if ID < 1 then
  begin
    oqCreate.SetVariable('FK_MEDIC_ID', MedicID);
    oqCreate.SetVariable('FN_KOL', seKol.EditValue);
    oqCreate.SetVariable('FD_DATE1', deDate1.EditValue);
    oqCreate.SetVariable('FD_DATE2', deDate2.EditValue);
    oqCreate.Execute;    
    ID := oqCreate.GetVariable('ID');
//    :FK_MEDIC_ID, :FN_KOL, :FD_DATE1, :FD_DATE2
  end
  else
  begin
    odsTTreb_Quota.Edit;
    odsTTreb_Quota.FieldByName('fk_medic_id').AsVariant := MedicID;
    odsTTreb_Quota.FieldByName('FN_KOL').AsVariant      := seKol.EditValue;
    odsTTreb_Quota.FieldByName('FD_DATE1').AsVariant    := deDate1.EditValue;
    odsTTreb_Quota.FieldByName('FD_DATE2').AsVariant    := deDate2.EditValue;
    odsTTreb_Quota.Post;
  end;
  odsTTreb_Quota.Session.Commit;

  ModalResult := mrOk;    
end;

procedure TfmTreb_Quota_Edit.cxButtonEdit1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  new_MedicID : integer;
begin
  new_MedicID := DoShowMedic( MedicID, True, '', (frmMain.ProvisorState = 1), false, '', 'Список объектов учета', dmMain.CurMO_SKLAD_ID );

  MedicID := new_MedicID;
end;

procedure TfmTreb_Quota_Edit.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  if ModalResult = mrNone then
    ModalResult := mrCancel;
end;

procedure TfmTreb_Quota_Edit.SetMedicID(const Value: integer);
begin
  FMedicID := Value;
  odsMedic_EI.Close;
  odsMedic_EI.SetVariable('FK_MEDIC_ID', FMedicID);
  odsMedic_EI.Open;
  bedMedic.Text := odsMedic_EI.FieldByName('FC_MEDIC').AsVariant;
  teEI.Text     := odsMedic_EI.FieldByName('FC_EDIZM').AsVariant;
end;

end.
