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
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cbShNastr: TcxCheckBox;
    cbSaveRazmer: TcxCheckBox;
    cbAutoSend: TcxCheckBox;
    cbCloseFormSnd: TcxCheckBox;
    cbNotShowMsg: TcxCheckBox;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel10: TcxLabel;
    hkKadr: TEdit;
    hkStartVideo: TEdit;
    hkStopVideo: TEdit;
    hkFrmOpCl: TEdit;
    hkListDown: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    cbLoadDicom: TcxCheckBox;
    procedure cxButton3Click(Sender: TObject);
    procedure cxECHOClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure hkKadrEnter(Sender: TObject);
    procedure hkStartVideoEnter(Sender: TObject);
    procedure hkStopVideoEnter(Sender: TObject);
    procedure hkFrmOpClEnter(Sender: TObject);
    procedure hkListDownEnter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    procedure CMDialogKey( var msg: TCMDialogKey ); message CM_DIALOGKEY;
  public
    procedure pRegCrtPart;
    function NameKey(Key: Cardinal): string;
  end;

var
  frmNastr: TfrmNastr;
  vlkeycadr_key,
  vlStartVideo_key,
  vlStopVideo_key,
  vlFrmOpCl_key,
  vlListDown_key : Integer;

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

procedure TfrmNastr.Button1Click(Sender: TObject);
begin
  hkKadr.Text   := '';
  vlkeycadr_key := 0 ;
end;

procedure TfrmNastr.Button2Click(Sender: TObject);
begin
  hkStartVideo.Text := '';
  vlStartVideo_key := 0 ;
end;

procedure TfrmNastr.Button3Click(Sender: TObject);
begin
  hkStopVideo.Text := '';
  vlStopVideo_key  := 0 ;
end;

procedure TfrmNastr.Button4Click(Sender: TObject);
begin
  hkFrmOpCl.Text := '';
  vlFrmOpCl_key    := 0 ;
end;

procedure TfrmNastr.Button5Click(Sender: TObject);
begin
  hkListDown.Text := '';
  vlListDown_key   := 0 ;
end;

procedure TfrmNastr.cxButton1Click(Sender: TObject);
var Reg : TRegIniFile;
begin
  v_cbLoadDicom := cbLoadDicom.Checked;

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

    if v_cbLoadDicom then
      Reg.WriteInteger(cRegIniPart, cLoadDicom, 1 )
    else
      Reg.WriteInteger(cRegIniPart, cLoadDicom, 0 );

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

  v_hkKadr       := vlkeycadr_key;  // 16449
  s_hkKadr       := NameKey(v_hkKadr);

  v_hkStartVideo := vlStartVideo_key; // 16467
  s_hkStartVideo := NameKey(v_hkStartVideo);

  v_hkStopVideo  := vlStopVideo_key;   // 16452
  s_hkStopVideo  := NameKey(v_hkStopVideo);

  v_hkFrmOpCl    := vlFrmOpCl_key;
  s_hkFrmOpCl    := NameKey(v_hkFrmOpCl);

  v_hkListDown   := vlListDown_key;
  s_hkListDown   := NameKey(v_hkListDown);

 { v_hkKadr       := hkKadr.HotKey;  // 16449
  s_hkKadr       := ShortCutToText(v_hkKadr);

  v_hkStartVideo := hkStartVideo.Hotkey; // 16467
  s_hkStartVideo := ShortCutToText(v_hkStartVideo);

  v_hkStopVideo  := hkStopVideo.Hotkey;   // 16452
  s_hkStopVideo  := ShortCutToText(v_hkStopVideo);

  v_hkFrmOpCl    := hkFrmOpCl.Hotkey;
  s_hkFrmOpCl    := ShortCutToText(v_hkFrmOpCl);

  s_hkListDown   := ShortCutToText(v_hkListDown);
  v_hkListDown   := hkListDown.Hotkey;   }

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

function TfrmNastr.NameKey(Key: Cardinal): string;
var xCode: Cardinal;
    c: array[0..255] of Char;
begin
  xCode:=MapVirtualKey(Key,0) shl 16;
  case Key of
  19:     xCode:=3225747457;
  34..46: xCode:=xCode or (1 shl 24);
  144:    xCode:=3242524673;
  end;
  if xCode>0 then begin
    GetKeyNameText(xCode,c,SizeOf(c));
    Result:=c;
  end
  else Result:='('+inttostr(Key)+')';
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

  cbLoadDicom.Checked := v_cbLoadDicom;

  PageControl1.ActivePage:=TabSheet1;

  vlkeycadr_key := v_hkKadr;
  vlStartVideo_key := v_hkStartVideo;
  vlStopVideo_key := v_hkStopVideo;
  vlFrmOpCl_key := v_hkFrmOpCl;
  vlListDown_key := v_hkListDown ;

  hkKadr.Text := NameKey(v_hkKadr);
  hkStartVideo.Text := NameKey(v_hkStartVideo);
  hkStopVideo.Text := NameKey(v_hkStopVideo);
  hkFrmOpCl.Text := NameKey(v_hkFrmOpCl);
  hkListDown.Text := NameKey(v_hkListDown);

end;

procedure TfrmNastr.CMDialogKey( var msg: TCMDialogKey ); 
begin  //
  if (not fIsTab(msg.Charcode)) then
    inherited
  else
  if ActiveControl=hkKadr then
  begin
    hkKadr.Text := cTAB;
    vlkeycadr_key    := cCode ;
  end else if ActiveControl=hkStartVideo then
  begin
    hkStartVideo.Text := cTAB;
    vlStartVideo_key := cCode ;
  end else if ActiveControl=hkStopVideo then
  begin
    hkStopVideo.Text := cTAB;
    vlStopVideo_key  := cCode ;
  end else if ActiveControl=hkFrmOpCl then
  begin
    hkFrmOpCl.Text := cTAB;
    vlFrmOpCl_key    := cCode ;
  end else if ActiveControl=hkListDown then
  begin
    hkListDown.Text := cTAB;
    vlListDown_key   := cCode ;
  end;
end;

procedure TfrmNastr.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 { if Key = VK_TAB then ShowMessage('TAB!');
  if Key = VK_SPACE then ShowMessage('SPACE!');
  VK_ESCAPE }
  if ActiveControl=hkKadr then
  begin
    hkKadr.Text := NameKey( Key );
    vlkeycadr_key    := Key ;
  end else if ActiveControl=hkStartVideo then
  begin
    hkStartVideo.Text := NameKey( Key );
    vlStartVideo_key := Key ;
  end else if ActiveControl=hkStopVideo then
  begin
    hkStopVideo.Text := NameKey( Key );
    vlStopVideo_key  := Key ;
  end else if ActiveControl=hkFrmOpCl then
  begin
    hkFrmOpCl.Text := NameKey( Key );
    vlFrmOpCl_key    := Key ;
  end else if ActiveControl=hkListDown then
  begin
    hkListDown.Text := NameKey( Key );
    vlListDown_key   := Key ;
  end;
end;

procedure TfrmNastr.hkFrmOpClEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Latin, KLF_REORDER);
end;

procedure TfrmNastr.hkKadrEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Latin, KLF_REORDER);
end;

procedure TfrmNastr.hkListDownEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Latin, KLF_REORDER);
end;

procedure TfrmNastr.hkStartVideoEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Latin, KLF_REORDER);
end;

procedure TfrmNastr.hkStopVideoEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Latin, KLF_REORDER);
end;

{
procedure SetRU;
var
  Layout: array [0.. KL_NAMELENGTH] of char;
begin
  LoadKeyboardLayout(StrCopy(Layout, '00000419'), KLF_ACTIVATE);
end;

procedure SetEN;
var
  Layout: array [0.. KL_NAMELENGTH] of char;
begin
  LoadKeyboardLayout(StrCopy(Layout, '00000409'), KLF_ACTIVATE);
end;

или

var
  rus, lat: HKL;

rus := LoadKeyboardLayout('00000419', 0);
lat := LoadKeyboardLayout('00000409', 0);

SetActiveKeyboardLayout(rus);

}

end.

