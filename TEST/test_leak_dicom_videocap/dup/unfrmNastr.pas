unit unfrmNastr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, dxSkinsCore,
  Medotrade, dxSkinOffice2007Black, dxSkinOffice2007Green, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, ComCtrls, cxGraphics, cxMaskEdit,
  cxDropDownEdit, cxCheckBox;

type
  TfrmNastr = class(TForm)
    GroupBox3: TGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxLabel9: TcxLabel;
    teHost: TcxTextEdit;
    cxLabel12: TcxLabel;
    tePort: TcxTextEdit;
    cxLabel18: TcxLabel;
    tePortStore: TcxTextEdit;
    cxLabel13: TcxLabel;
    teCalled: TcxTextEdit;
    cxLabel14: TcxLabel;
    teCalling: TcxTextEdit;
    cxLabel15: TcxLabel;
    teLocalPort: TcxTextEdit;
    cxECHO: TcxButton;
    cxLabel1: TcxLabel;
    teWLHost: TcxTextEdit;
    cxLabel19: TcxLabel;
    teWLPort: TcxTextEdit;
    cxLabel20: TcxLabel;
    teWLCalled: TcxTextEdit;
    cxLabel21: TcxLabel;
    teWLCalling: TcxTextEdit;
    cxButton3: TcxButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet4: TTabSheet;
    cxLabel24: TcxLabel;
    teModality: TcxComboBox;
    cxLabel23: TcxLabel;
    tePhysiciansName: TcxTextEdit;
    cxLabel30: TcxLabel;
    teStationName: TcxTextEdit;
    cxLabel29: TcxLabel;
    teProcDescription: TcxTextEdit;
    cbCheckedImages: TcxCheckBox;
    TabSheet5: TTabSheet;
    cxLabel2: TcxLabel;
    hkKadr: THotKey;
    cxLabel3: TcxLabel;
    hkStartVideo: THotKey;
    cxLabel4: TcxLabel;
    hkStopVideo: THotKey;
    cbShNastr: TcxCheckBox;
    cbSaveRazmer: TcxCheckBox;
    cbAutoSend: TcxCheckBox;
    cbCloseFormSnd: TcxCheckBox;
    cbNotShowMsg: TcxCheckBox;
    procedure cxButton3Click(Sender: TObject);
    procedure cxECHOClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure pRegCrtPart;
  end;

var
  frmNastr: TfrmNastr;

implementation

{$R *.dfm}

uses DICOM_CMN, DCM_Attributes, DCM_Client, fMain, CmnUnit, Registry;

procedure TfrmNastr.pRegCrtPart;
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    if not Reg.OpenKey(cRegIniPart, False) then
      Reg.CreateKey(cRegIniPart);
  finally
    Reg.Free;
  end;
end;

procedure TfrmNastr.cxButton1Click(Sender: TObject);
var Reg : TRegIniFile;
begin
  v_teHost := teHost.Text;
  v_tePort := tePort.Text;
  v_tePortStore := tePortStore.Text;
  v_teCalled := teCalled.Text;
  v_teCalling := teCalling.Text;
  v_teLocalPort := teLocalPort.Text;

  v_teWLHost := teWLHost.Text;
  v_teWLPort := teWLPort.Text;
  v_teWLCalled := teWLCalled.Text;
  v_teWLCalling := teWLCalling.Text;

  v_teModality := teModality.Text ;
  v_tePhysiciansName := tePhysiciansName.Text;
  v_teStationName := teStationName.Text;
  v_cbCheckedImages := cbCheckedImages.Checked;
  v_cbShNastr       := cbShNastr.Checked;

  v_cbSaveRazmer   := cbSaveRazmer.Checked;
  v_cbAutoSend     := cbAutoSend.Checked;
  v_cbCloseFormSnd := cbCloseFormSnd.Checked;
  v_cbNotShowMsg   := cbNotShowMsg.Checked;

  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  pRegCrtPart;
  try
    Reg.WriteString(cRegIniPart, cModality, v_teModality );
    Reg.WriteString(cRegIniPart, cPhysiciansName, v_tePhysiciansName );
    Reg.WriteString(cRegIniPart, cStationName, v_teStationName );

    if v_cbCheckedImages then
      Reg.WriteInteger(cRegIniPart, cCheckedImages, 1 )
    else
      Reg.WriteInteger(cRegIniPart, cCheckedImages, 0 );

    if v_cbShNastr then
      Reg.WriteInteger(cRegIniPart, cShNastr, 1 )
    else
      Reg.WriteInteger(cRegIniPart, cShNastr, 0 );


    if v_cbSaveRazmer then
      Reg.WriteInteger(cRegIniPart, c_cbSaveRazmer, 1 )
    else
      Reg.WriteInteger(cRegIniPart, c_cbSaveRazmer, 0 );
    if v_cbAutoSend then
      Reg.WriteInteger(cRegIniPart, c_cbAutoSend, 1 )
    else
      Reg.WriteInteger(cRegIniPart, c_cbAutoSend, 0 );
    if v_cbCloseFormSnd then
      Reg.WriteInteger(cRegIniPart, c_cbCloseFormSnd, 1 )
    else
      Reg.WriteInteger(cRegIniPart, c_cbCloseFormSnd, 0 );
    if v_cbNotShowMsg then
      Reg.WriteInteger(cRegIniPart, c_cbNotShowMsg, 1 )
    else
      Reg.WriteInteger(cRegIniPart, c_cbNotShowMsg, 0 );

  finally
    Reg.Free;
  end;

  v_hkKadr       := hkKadr.HotKey;  // 16449
  v_hkStartVideo := hkStartVideo.Hotkey; // 16467
  v_hkStopVideo  := hkStopVideo.Hotkey;   // 16452
  s_hkKadr       := ShortCutToText(v_hkKadr);
  s_hkStartVideo := ShortCutToText(v_hkStartVideo);
  s_hkStopVideo  := ShortCutToText(v_hkStopVideo);

  ModalResult := mrOk;
end;

procedure TfrmNastr.cxButton2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmNastr.cxButton3Click(Sender: TObject);
var DA, DA1: TDicomAttributes;
    DateRange: TDicomAttribute;
    i: Integer;
    CnsDicomConnection1: TCnsDicomConnection;
  procedure MyWrtLogF (p_str:string);
  begin
    if v_debug then
      MnLg_ev( p_str, ExtractFilePath(paramstr(0))+c_mn_log_file, True );
  end;
begin
  CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
  try
    Screen.Cursor := crHourGlass;
    CnsDicomConnection1.Host := teWLHost.Text;
    CnsDicomConnection1.Port := StrToInt(teWLPort.Text);
    CnsDicomConnection1.CalledTitle := teWLCalled.Text;
    if teWLCalling.Text <> '' then
      CnsDicomConnection1.CallingTitle := teWLCalling.Text;

      MyWrtLogF( 'C_ECHO: '+#13+
          ' Host = '+CnsDicomConnection1.Host+#13+
          ' Port = '+IntToStr(CnsDicomConnection1.Port)+#13+
          ' CalledTitle = '+CnsDicomConnection1.CalledTitle+#13+
          ' CallingTitle = '+CnsDicomConnection1.CallingTitle );

    CnsDicomConnection1.v_is_log := True;
    CnsDicomConnection1.v_log_filename := ExtractFilePath(paramstr(0))+c_mn_log_file;

    if CnsDicomConnection1.C_Echo then
    begin
      MessageDlg('OK', mtWarning, [mbOK], 0);
    end else
    begin
      MyWrtLogF( 'C_ECHO ERROR ' );
      ShowMessage('Ошибка на сервере! Обратитесь к администратору системы!');
    end;
  finally
    Screen.Cursor := crDefault;
    MyDisconnectAssociation(CnsDicomConnection1);
    CnsDicomConnection1.Free;
    Application.ProcessMessages;
    Sleep(100);
  end;
end;
procedure TfrmNastr.cxECHOClick(Sender: TObject);
var DA, DA1: TDicomAttributes;
    DateRange: TDicomAttribute;
    i: Integer;
    CnsDicomConnection1: TCnsDicomConnection;
  procedure MyWrtLogF (p_str:string);
  begin
    if v_debug then
      MnLg_ev( p_str, ExtractFilePath(paramstr(0))+c_mn_log_file, True );
  end;
begin
  CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
  try
    Screen.Cursor := crHourGlass;
    CnsDicomConnection1.Host := teHost.Text;
    CnsDicomConnection1.Port := StrToInt(tePort.Text);
    CnsDicomConnection1.CalledTitle := teCalled.Text;
    if teCalling.Text <> '' then
      CnsDicomConnection1.CallingTitle := teCalling.Text;

      MyWrtLogF( 'C_Echo: '+#13+
          ' Host = '+CnsDicomConnection1.Host+#13+
          ' Port = '+IntToStr(CnsDicomConnection1.Port)+#13+
          ' CalledTitle = '+CnsDicomConnection1.CalledTitle+#13+
          ' CallingTitle = '+CnsDicomConnection1.CallingTitle );

    CnsDicomConnection1.v_is_log := True;
    CnsDicomConnection1.v_log_filename := ExtractFilePath(paramstr(0))+c_mn_log_file;

    if CnsDicomConnection1.C_Echo then
    begin
      MessageDlg('OK', mtWarning, [mbOK], 0);
    end else
    begin
      MyWrtLogF( 'C_ECHO ERROR ' );
      ShowMessage('Ошибка на сервере! Обратитесь к администратору системы!');
    end;
  finally
    Screen.Cursor := crDefault;
    MyDisconnectAssociation(CnsDicomConnection1);
    CnsDicomConnection1.Free;
    Application.ProcessMessages;
    Sleep(100);
  end;
end;

procedure TfrmNastr.FormCreate(Sender: TObject);
begin // Create
  teHost.Text := v_teHost;
  tePort.Text := v_tePort;
  tePortStore.Text := v_tePortStore;
  teCalled.Text := v_teCalled;
  teCalling.Text := v_teCalling;
  teLocalPort.Text := v_teLocalPort;

  teWLHost.Text := v_teWLHost;
  teWLPort.Text := v_teWLPort;
  teWLCalled.Text := v_teWLCalled;
  teWLCalling.Text := v_teWLCalling;

  // Инициализация данных исследования
  teModality.Properties.Items.Clear;
  ctrFullModList( TStringList(teModality.Properties.Items) );

  teModality.Text := v_teModality ;
  tePhysiciansName.Text := v_tePhysiciansName;
  teStationName.Text :=  v_teStationName;
//  cbCleanData.Checked := v_cbCleanData;
  cbCheckedImages.Checked := v_cbCheckedImages;

  cbShNastr.Checked := v_cbShNastr;

  cbSaveRazmer.Checked   :=  v_cbSaveRazmer  ;
  cbAutoSend.Checked     :=  v_cbAutoSend    ;
  cbCloseFormSnd.Checked :=  v_cbCloseFormSnd;
  cbNotShowMsg.Checked   :=  v_cbNotShowMsg  ;

  PageControl1.ActivePage:=TabSheet1;

end;

end.
