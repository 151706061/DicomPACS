unit fEdtDevice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, dxSkinsCore, dxSkinscxPCPainter,
  cxImage, ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel,
  cxTextEdit, cxContainer, cxEdit, cxLabel, cxPC, cxControls, StdCtrls,
  cxButtons, cxGroupBox, ActnList, dxSkinOffice2007Green, dxSkinBlack,
  cxGraphics, cxMaskEdit, cxDropDownEdit, dxSkinOffice2007Black, Medotrade;

type
  TFrmEdtDevice = class(TForm)
    bTest: TcxButton;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    actlstal: TActionList;
    actSave: TAction;
    actDisable: TAction;
    actTest: TAction;
    Panel1: TPanel;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    teName: TcxTextEdit;
    cxLabel2: TcxLabel;
    teAETitle: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxPort: TcxTextEdit;
    cxLabel8: TcxLabel;
    cxIP: TcxTextEdit;
    cxLabel3: TcxLabel;
    cbType: TcxComboBox;
    cxLabel4: TcxLabel;
    cbTRSYNT: TcxComboBox;
    cxLabel5: TcxLabel;
    cbCharset: TcxComboBox;
    cxLabel6: TcxLabel;
    cxMod: TcxTextEdit;
    cxLabel9: TcxLabel;
    procedure actSaveExecute(Sender: TObject);
    procedure actDisableExecute(Sender: TObject);
    procedure actTestExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    v_FK_ID       : Integer;
    v_FK_IDs      : String;
    v_FC_IP       : string;
    v_FN_PORT     : Integer;
    v_FC_TITLE    : string;
    v_FC_COMMENT  : string;
    v_FN_TYPE     : Integer;
    v_FN_TRANSFER : Integer;
    v_fc_charset,
    v_fc_mod      : string;
    // процедура инициализации полей на форме
    procedure p_set_fld_val;
    // процедура сохранени€ данных полей формы в переменные
    procedure p_sav_fld_val;
    // заполнение спичка transfer syntax 
    procedure MyTransferListCreate;
  end;

var
  FrmEdtDevice: TFrmEdtDevice;

implementation

Uses CmnUnit, DICOM_CMN, fMain;

{$R *.dfm}

// процедура инициализации полей на форме
procedure TFrmEdtDevice.p_set_fld_val;
begin
  teName.Text    := v_FC_COMMENT;
  teAETitle.Text := v_FC_TITLE;
  cxPort.Text    := IntToStr(v_FN_PORT);
  cxIP.Text      := v_FC_IP;
  cbType.ItemIndex := v_FN_TYPE;
  cbCharset.Text := v_fc_charset;
  cxMod.Text:= v_fc_mod;
  MyTransferListCreate;
end;

procedure TFrmEdtDevice.p_sav_fld_val;
begin
  v_FC_COMMENT := teName.Text;
  v_FC_TITLE   := teAETitle.Text;
  v_FN_PORT    := MyStrToInt(cxPort.Text);
  v_FC_IP      := cxIP.Text;
  v_FN_TYPE    := cbType.ItemIndex;
  v_fc_charset := cbCharset.Text;
  v_fc_mod     := cxMod.Text;
end;

// процедура сохранени€ данных полей формы в переменные
procedure TFrmEdtDevice.actDisableExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TFrmEdtDevice.actSaveExecute(Sender: TObject);
var i:Integer;
begin
  v_FN_TRANSFER:=0;
  for I := 0 to Length(v_trsyntListCMN) - 1 do
    if (v_trsyntListCMN[i,0]=cbTRSYNT.Text) then
    begin
      v_FN_TRANSFER:=StrToInt(v_trsyntListCMN[i,2]);
      Break;
    end;
  // v_trsyntList
  if v_FN_TRANSFER=0 then
    for I := 0 to Length(v_trsyntList) - 1 do
      if (v_trsyntList[i,0]=cbTRSYNT.Text) then
      begin
        v_FN_TRANSFER:=StrToInt(v_trsyntList[i,2]);
        Break;
      end;
  if cbType.Text = '' then
    begin
      MessageDlg('¬нимание!'+#13+#10+'Ќе указан тип устройства!', mtInformation, [mbOK], 0);
      cbType.SetFocus;
      exit;
    end;
  p_sav_fld_val;
  ModalResult:=mrOk;
end;

procedure TFrmEdtDevice.actTestExecute(Sender: TObject);
begin
  if f_C_ECHO(cxIP.Text, cxPort.Text, teAETitle.Text, LocAE) then
    MessageDlg('”стройство отвечает на запросы', mtInformation, [mbOK], 0)
  else
    MessageDlg('”стройство не отвечает на запросы', mtError, [mbOK], 0);
end;

// заполнение спичка transfer syntax 
procedure TFrmEdtDevice.MyTransferListCreate;
var i:integer;
begin
  cbTRSYNT.Properties.Items.Clear;
  // v_trsyntListCMN
  for I := 0 to Length(v_trsyntListCMN) - 1 do
  begin
    cbTRSYNT.Properties.Items.Add(v_trsyntListCMN[i,0]);
    if (StrToInt(v_trsyntListCMN[i,2])=v_FN_TRANSFER) then
      cbTRSYNT.Text:=v_trsyntListCMN[i,0];
  end;
  // v_trsyntList
  for I := 0 to Length(v_trsyntList) - 1 do
  begin
    cbTRSYNT.Properties.Items.Add(v_trsyntList[i,0]);
    if (StrToInt(v_trsyntList[i,2])=v_FN_TRANSFER) then
      cbTRSYNT.Text:=v_trsyntList[i,0];
  end;
end;

end.
