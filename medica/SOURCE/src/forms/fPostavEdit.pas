{***************************************************************
 *
 * Unit Name: fUchGrEdit
 * Purpose  :
 * Author   : Собянин А.А.  sobjanin_alex@chat.ru
 * History  :
 *
 ****************************************************************}

unit fPostavEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, JvFormPlacement, StdCtrls, JvComponentBase,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls,
  cxContainer, cxEdit, cxGroupBox, cxLookAndFeelPainters, Spin, cxSpinEdit;

type
  TfrmPostavEdit = class(TForm)
    FormStorage: TJvFormStorage;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    al: TActionList;
    acSave: TAction;
    acAdd: TAction;
    acCancel: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    edName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edBossFIO: TEdit;
    Label3: TLabel;
    edBossDolg: TEdit;
    Label4: TLabel;
    meRekviziti: TMemo;
    cxGroupBox1: TcxGroupBox;
    Label6: TLabel;
    deFD_KONTRAKT_BEGIN: TcxDateEdit;
    edFC_KONTRAKT_N: TEdit;
    Label5: TLabel;
    Label7: TLabel;
    deFD_KONTRAKT_END: TcxDateEdit;
    cxGroupBox2: TcxGroupBox;
    Label9: TLabel;
    edFC_ADDRESS: TEdit;
    Label8: TLabel;
    edFC_PHONE: TEdit;
    Label10: TLabel;
    edFC_R_S: TEdit;
    Label11: TLabel;
    edFC_K_S: TEdit;
    Label12: TLabel;
    edFC_BIK: TEdit;
    Label13: TLabel;
    edFC_OKPO: TEdit;
    Label14: TLabel;
    edFC_OKONH: TEdit;
    edFC_BANK: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    edFC_LICENSE_N: TEdit;
    Label17: TLabel;
    deFD_LICENSE: TcxDateEdit;
    Label18: TLabel;
    edFC_INN: TEdit;
    Label19: TLabel;
    edVendorID: TEdit;
    procedure acSaveExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FnID: Integer;
    procedure ClearInputFields();
    procedure SetnID(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    function DoSave: boolean;
    property nID: Integer read FnID write SetnID;
  end;

function DoShowPostavEdit(pID: Integer): integer;
var
  frmPostavEdit: TfrmPostavEdit;

implementation

uses fmainform, fUchGr, fdmMain, Oracle;

{$R *.DFM}

{********************************************************************************************************}
{        DoShowUchGrEdit
{********************************************************************************************************}

function DoShowPostavEdit(pID: Integer): integer;
begin
  Application.CreateForm(TfrmPostavEdit, frmPostavEdit);
  frmPostavEdit.nID := pID;
  frmPostavEdit.ShowModal;
  result := frmPostavEdit.nID;
  frmPostavEdit.free;
end;

{********************************************************************************************************}
{        TfrmPostavEdit.acSaveExecute
{********************************************************************************************************}

procedure TfrmPostavEdit.acSaveExecute(Sender: TObject);
begin
  if DoSave then begin
    Close;
  end;
end;

{********************************************************************************************************}
{        TfrmPostavEdit.SetnID
{********************************************************************************************************}

procedure TfrmPostavEdit.SetnID(const Value: Integer);
//var
//  edNameText, edBossFIOText, edBossDolgText, meRekvizitiText : string;
begin
  if Value <> -1 then begin
    if dmMain.odsPostav.Locate('postavid', Value, []) then
    begin
      FnID := Value;

      edName.Text            := nvl(dmMain.odsPostav.fieldByName('fc_name').AsVariant, '');
      edBossFIO.Text         := nvl(dmMain.odsPostav.fieldByName('fc_bossfio').AsVariant, '');
      edBossDolg.Text        := nvl(dmMain.odsPostav.fieldByName('fc_bossdolg').AsVariant, '');
      meRekviziti.Text       := nvl(dmMain.odsPostav.fieldByName('fc_rekviziti').AsVariant, '');

      edFC_KONTRAKT_N.Text      := nvl(dmMain.odsPostav.fieldByName('FC_KONTRAKT_N').AsVariant, '');
      edFC_ADDRESS.Text         := nvl(dmMain.odsPostav.fieldByName('FC_ADDRESS').AsVariant, '');
      edFC_PHONE.Text           := nvl(dmMain.odsPostav.fieldByName('FC_PHONE').AsVariant, '');
      edFC_R_S.Text             := nvl(dmMain.odsPostav.fieldByName('FC_R_S').AsVariant, '');
      edFC_K_S.Text             := nvl(dmMain.odsPostav.fieldByName('FC_K_S').AsVariant, '');
      edFC_INN.Text             := nvl(dmMain.odsPostav.fieldByName('FC_INN').AsVariant, '');
      edFC_BIK.Text             := nvl(dmMain.odsPostav.fieldByName('FC_BIK').AsVariant, '');
      edFC_OKPO.Text            := nvl(dmMain.odsPostav.fieldByName('FC_OKPO').AsVariant, '');
      edFC_OKONH.Text           := nvl(dmMain.odsPostav.fieldByName('FC_OKONH').AsVariant, '');
      edFC_BANK.Text            := nvl(dmMain.odsPostav.fieldByName('FC_BANK').AsVariant, '');
      edFC_LICENSE_N.Text       := nvl(dmMain.odsPostav.fieldByName('FC_LICENSE_N').AsVariant, '');
      deFD_KONTRAKT_BEGIN.EditValue := dmMain.odsPostav.fieldByName('FD_KONTRAKT_BEGIN').AsVariant;
      deFD_KONTRAKT_END.EditValue   := dmMain.odsPostav.fieldByName('FD_KONTRAKT_END').AsVariant;
      deFD_LICENSE.EditValue        := dmMain.odsPostav.fieldByName('FD_LICENSE').AsVariant;
      edVendorID.Text           := nvl(dmMain.odsPostav.fieldByName('FC_PM_VENDOR_ID').AsVariant, '');
    end;
//	dmMain.pkgPostav.TPOSTAVSEL(nID, edNameText, edBossDolgText, edBossFIOText, meRekvizitiText);
//    edName.Text := edNameText;
//    edBossFIO.Text := edBossFIOText;
//    edBossDolg.Text := edBossDolgText;
//    meRekviziti.Text := meRekvizitiText;
  end
  else begin
    ClearInputFields; 
  end;
end;

{********************************************************************************************************}
{        TfrmPostavEdit.acAddExecute
{********************************************************************************************************}

procedure TfrmPostavEdit.acAddExecute(Sender: TObject);
begin
  DoSave;
  nID := -1;
  edName.SetFocus;
end;

{********************************************************************************************************}
{        TfrmPostavEdit.acCancelExecute
{********************************************************************************************************}

procedure TfrmPostavEdit.acCancelExecute(Sender: TObject);
begin
  Close;
end;

{********************************************************************************************************}
{        TfrmPostavEdit.DoSave
{********************************************************************************************************}

function TfrmPostavEdit.DoSave: boolean;
begin
  if edName.Text = '' then begin
    windows.MessageBox(Handle, 'Обязательно ввести название поставщика!', 'Ошибка', MB_OK + MB_ICONERROR);
    edName.SetFocus;
    result := FALSE;
    Exit;
  end;
  FnID := Round( dmMain.pkgPostav.TPOSTAVSET(niD, edName.Text, edBossDolg.Text, edBossFIO.Text, StringReplace(meRekviziti.Text, #13#10, ' ', [rfReplaceAll])) );
  dmMain.InitAdditionalUpdateTable('MED.TPOSTAV');
  dmMain.AddAdditionalUpdateTable('FC_KONTRAKT_N',     otString,  edFC_KONTRAKT_N.Text);
  dmMain.AddAdditionalUpdateTable('FC_ADDRESS',        otString,  edFC_ADDRESS.Text   );
  dmMain.AddAdditionalUpdateTable('FC_PHONE',          otString,  edFC_PHONE.Text     );
  dmMain.AddAdditionalUpdateTable('FC_R_S',            otString,  edFC_R_S.Text       );
  dmMain.AddAdditionalUpdateTable('FC_K_S',            otString,  edFC_K_S.Text       );
  dmMain.AddAdditionalUpdateTable('FC_INN',            otString,  edFC_INN.Text       );
  dmMain.AddAdditionalUpdateTable('FC_BIK',            otString,  edFC_BIK.Text       );
  dmMain.AddAdditionalUpdateTable('FC_OKPO',           otString,  edFC_OKPO.Text      );
  dmMain.AddAdditionalUpdateTable('FC_OKONH',          otString,  edFC_OKONH.Text     );
  dmMain.AddAdditionalUpdateTable('FC_BANK',           otString,  edFC_BANK.Text      );
  dmMain.AddAdditionalUpdateTable('FC_LICENSE_N',      otString,  edFC_LICENSE_N.Text );
  dmMain.AddAdditionalUpdateTable('FD_KONTRAKT_BEGIN', otDate,    deFD_KONTRAKT_BEGIN.EditValue);
  dmMain.AddAdditionalUpdateTable('FD_KONTRAKT_END',   otDate,    deFD_KONTRAKT_END.EditValue  );
  dmMain.AddAdditionalUpdateTable('FD_LICENSE',        otDate,    deFD_LICENSE.EditValue       );
  dmMain.AddAdditionalUpdateTable('FC_PM_VENDOR_ID',   otString,  edVendorID.Text              );

  dmMain.ExecuteAdditionalUpdateTable('postavid', otInteger, nID);
  dmMain.os.Commit;
  ClearInputFields;

  result := TRUE;
end;

procedure TfrmPostavEdit.FormCreate(Sender: TObject);
begin
  FnID := -1;
  edName.MaxLength      := dmMain.GetFieldLength('med', 'tpostav', 'FC_NAME');
  edBossFIO.MaxLength   := dmMain.GetFieldLength('med', 'tpostav', 'FC_BOSSFIO');
  edBossDolg.MaxLength  := dmMain.GetFieldLength('med', 'tpostav', 'FC_BOSSDOLG');
  meRekviziti.MaxLength := dmMain.GetFieldLength('med', 'tpostav', 'FC_REKVIZITI');

  edFC_KONTRAKT_N.MaxLength := dmMain.GetFieldLength('med', 'tpostav', 'fc_kontrakt_n');
  edFC_ADDRESS.MaxLength    := dmMain.GetFieldLength('med', 'tpostav', 'fc_address');
  edFC_PHONE.MaxLength      := dmMain.GetFieldLength('med', 'tpostav', 'fc_phone');
  edFC_R_S.MaxLength        := dmMain.GetFieldLength('med', 'tpostav', 'fc_r_s');
  edFC_K_S.MaxLength        := dmMain.GetFieldLength('med', 'tpostav', 'fc_k_s');
  edFC_INN.MaxLength        := dmMain.GetFieldLength('med', 'tpostav', 'fc_inn');
  edFC_BIK.MaxLength        := dmMain.GetFieldLength('med', 'tpostav', 'fc_bik');
  edFC_OKPO.MaxLength       := dmMain.GetFieldLength('med', 'tpostav', 'fc_okpo');
  edFC_OKONH.MaxLength      := dmMain.GetFieldLength('med', 'tpostav', 'fc_okonh');
  edFC_BANK.MaxLength       := dmMain.GetFieldLength('med', 'tpostav', 'fc_bank');
  edFC_LICENSE_N.MaxLength  := dmMain.GetFieldLength('med', 'tpostav', 'fc_license_n');
  edVendorID.MaxLength      := dmMain.GetFieldLength('med', 'tpostav', 'FC_PM_VENDOR_ID');
end;

procedure TfrmPostavEdit.ClearInputFields;
begin
  edName.Text := '';
  edBossFIO.Text := '';
  edBossDolg.Text := '';
  meRekviziti.Text := '';

  edFC_KONTRAKT_N.Text := '';
  edFC_ADDRESS.Text := '';
  edFC_PHONE.Text := '';
  edFC_R_S.Text := '';
  edFC_K_S.Text := '';
  edFC_INN.Text := '';
  edFC_BIK.Text := '';
  edFC_OKPO.Text := '';
  edFC_OKONH.Text := '';
  edFC_BANK.Text := '';
  edFC_LICENSE_N.Text := '';
  deFD_KONTRAKT_BEGIN.Clear;
  deFD_KONTRAKT_END.Clear;
  deFD_LICENSE.Clear;
  edVendorID.Text := '';
end;

end.
