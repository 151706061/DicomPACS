unit fAddRule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  dxSkinsCore, dxSkinOffice2007Green, cxControls, cxContainer, cxEdit, cxLabel,
  cxTextEdit, cxMaskEdit, cxButtonEdit, dxSkinBlack, cxGraphics, cxDropDownEdit,
  dxSkinOffice2007Black, cxTrackBar, Medotrade;

type
  TfrmAddRule = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bOk: TcxButton;
    cxButton1: TcxButton;
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    cxLabel1: TcxLabel;
    beTo: TcxButtonEdit;
    cxLabel2: TcxLabel;
    beFrom: TcxButtonEdit;
    cxLabel3: TcxLabel;
    cbType: TcxComboBox;
    cxLabel4: TcxLabel;
    cxComboBox1: TcxComboBox;
    Label2: TLabel;
    LbPrc: TLabel;
    TBSetZipPrc: TcxTrackBar;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure beToPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure beFromPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cxTrackBar1PropertiesChange(Sender: TObject);
    procedure cxComboBox1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    PGbeFrom_Tag, PGbeTo_Tag : string;
  end;

var
  frmAddRule: TfrmAddRule;

implementation

uses fSetTo, UnFrmGetDevices, DICOM_CMN, DB_CMN;

{$R *.dfm}

procedure TfrmAddRule.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddRule.aSaveExecute(Sender: TObject);
begin
  if Trim(beTo.Text)='' then
  begin
    MessageDlg('Не задан AE Title устройства куда пересылать снимки', mtWarning, [mbOK], 0);
  end else begin
    ModalResult := mrOk;
  end;
end;

procedure TfrmAddRule.beFromPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  Application.CreateForm(TFrmGetDevices, FrmGetDevices);   // из источника
  try
    FrmGetDevices.SetPosListAETitle(beFrom.Text);
    FrmGetDevices.ShowModal;
    if FrmGetDevices.ModalResult = mrOk then
      begin
        beFrom.Text := FrmGetDevices.v_device_name_chk+' ('+FrmGetDevices.v_AETitle_chk+')';
        if v_isPostgres or v_isOracle then begin
          PGbeFrom_Tag := FrmGetDevices.v_fk_ids;
        end else begin
          beFrom.Tag  := FrmGetDevices.v_fk_id;
        end;
//        v_device_name:=FrmGetDevices.v_AETitle_chk;
      //  beFrom.Text := frmSetTo.pFIBTo.FieldByName('fc_title').AsString;
      //  beFrom.Tag := frmSetTo.pFIBTo.FieldByName('fk_id').AsInteger;
      end;
  finally
    FrmGetDevices.Free;
  end;
end;

procedure TfrmAddRule.beToPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  Application.CreateForm(TFrmGetDevices, FrmGetDevices);  // куда пересылать
  try
    FrmGetDevices.SetFilterTypeDevice(1); // фильтр - только сервера
    FrmGetDevices.SetPosListAETitle(beTo.Text);
    FrmGetDevices.ShowModal;
    if FrmGetDevices.ModalResult = mrOk then
      begin
        beTo.Text := FrmGetDevices.v_device_name_chk+' ('+FrmGetDevices.v_AETitle_chk+')';
        if v_isPostgres or v_isOracle then begin
          PGbeTo_Tag := FrmGetDevices.v_fk_ids;
        end else begin
          beTo.Tag  := FrmGetDevices.v_fk_id;
        end;
//        beTo.Text := frmSetTo.pFIBTo.FieldByName('fc_title').AsString;
//        beTo.Tag := frmSetTo.pFIBTo.FieldByName('fk_id').AsInteger;
      end;
  finally
    FrmGetDevices.Free;
  end; 
end;

procedure TfrmAddRule.cxComboBox1PropertiesChange(Sender: TObject);
begin //
   if (v_trsyntList[cxComboBox1.SelectedItem,1] = '1') then
   begin
     TBSetZipPrc.Enabled := True;
   end else
   begin
     TBSetZipPrc.Position:=TBSetZipPrc.Properties.Max;
     TBSetZipPrc.Enabled := False;
   end;
end;

procedure TfrmAddRule.cxTrackBar1PropertiesChange(Sender: TObject);
begin
  LbPrc.Caption := IntToStr(Trunc((TBSetZipPrc.Position*100)/TBSetZipPrc.Properties.Max))+' % ';
end;

procedure TfrmAddRule.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  cxComboBox1.Properties.Items.Clear;
  for I := 0 to High(v_trsyntList) - 1 do
    cxComboBox1.Properties.Items.Add(v_trsyntList[i,0]);
end;

end.
