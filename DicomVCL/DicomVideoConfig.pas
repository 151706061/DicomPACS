{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DicomVideoConfig;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DicomVideoCap;

type
  TFGraphConfig = class(TForm)
    Label1: TLabel;
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    cbWantPreview: TCheckBox;
    cbWantCapture: TCheckBox;
    cbWantBitmaps: TCheckBox;
    cbWantDVAudio: TCheckBox;
    cbDoPreallocCaptureFile: TCheckBox;
    cbUseTempFile: TCheckBox;
    cbVSources: TComboBox;
    cbASources: TComboBox;
    cbVComps: TComboBox;
    cbAComps: TComboBox;
    cbWantAudio: TCheckBox;
    cbVComp: TCheckBox;
    cbAComp: TCheckBox;
    cbDVResolution: TComboBox;
    cbPixelFormat: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Label7: TLabel;
    Label8: TLabel;
    cbWantAudioPreview: TCheckBox;
    feCaptureFile: TEdit;
    feTempFile: TEdit;
    sePreallocSize: TEdit;
    procedure cbWantPreviewClick(Sender: TObject);
    procedure cbWantAudioClick(Sender: TObject);
    procedure cbWantCaptureClick(Sender: TObject);
    procedure cbUseTempFileClick(Sender: TObject);
    procedure cbVCompClick(Sender: TObject);
    procedure cbACompClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbDoPreallocCaptureFileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EditGraphConfig(config: TGraphConfig): boolean;

implementation

{$R *.DFM}

function EditGraphConfig(config: TGraphConfig): boolean;
var
  i: integer;
begin
  with TFGraphConfig.Create(Application) do
  try
    cbWantPreview.Checked := config.WantPreview;
    cbWantCapture.Checked := config.WantCapture;
    cbWantBitmaps.Checked := config.WantBitmaps;
    cbWantDVAudio.Checked := config.WantDVAudio;
    cbDoPreallocCaptureFile.Checked := config.DoPreallocFile;
    cbUseTempFile.Checked := config.UseTempFile;
    cbWantAudio.Checked := config.WantAudio;
    cbWantAudioPreview.Checked := config.WantAudioPreview;
    cbVComp.Checked := true;
    cbAComp.Checked := true;
    feCaptureFile.Text := config.CaptureFileName;
    feTempFile.Text := config.TempCaptureFileName;
    cbDVResolution.ItemIndex := integer(config.DVResolution);
    cbPixelFormat.ItemIndex := integer(config.PixelFormat);
    sePreallocSize.Text := IntToStr(config.PreallocFileSize);

    for i := 0 to cbVSources.Items.Count - 1 do
      if cbVSources.Items[i] = config.VCapSource then
      begin
        cbVSources.ItemIndex := i;
        break;
      end;
    for i := 0 to cbASources.Items.Count - 1 do
      if cbASources.Items[i] = config.ACapSource then
      begin
        cbASources.ItemIndex := i;
        break;
      end;
    for i := 0 to cbVComps.Items.Count - 1 do
      if cbVComps.Items[i] = config.VComp then
      begin
        cbVComps.ItemIndex := i;
        break;
      end;
    for i := 0 to cbAComps.Items.Count - 1 do
      if cbAComps.Items[i] = config.AComp then
      begin
        cbAComps.ItemIndex := i;
        break;
      end;

    cbVComp.Checked := cbVComps.ItemIndex >= 0;
    cbAComp.Checked := cbAComps.ItemIndex >= 0;

    cbWantPreviewClick(nil);
    cbWantAudioClick(nil);
    cbWantCaptureClick(nil);
    cbUseTempFileClick(nil);
    cbVCompClick(nil);
    cbACompClick(nil);
    cbDoPreallocCaptureFileClick(nil);

    Result := ShowModal = mrOk;
    if Result then
    begin
      config.Clear;
      config.WantPreview := cbWantPreview.Checked;
      config.WantCapture := cbWantCapture.Checked;
      config.WantBitmaps := cbWantBitmaps.Checked;
      config.WantDVAudio := cbWantDVAudio.Checked;
      config.DoPreallocFile := cbDoPreallocCaptureFile.Checked;
      config.UseTempFile := cbUseTempFile.Checked;
      config.WantAudio := cbWantAudio.Checked;
      config.WantAudioPreview := cbWantAudioPreview.Checked;

      config.PreallocFileSize :=StrToInt( sePreallocSize.Text);
      config.CaptureFileName := feCaptureFile.Text;
      config.TempCaptureFileName := feTempFile.Text;
      if cbDVResolution.ItemIndex >= 0 then
        config.DVResolution := TDVResolution(cbDVResolution.ItemIndex);
      if cbPixelFormat.ItemIndex >= 0 then
        config.PixelFormat := TPixelFormat(cbPixelFormat.ItemIndex);

      config.VCapSource := cbVSources.Text;
      config.ACapSource := cbASources.Text;
      if cbVComp.Checked then
        config.VComp := cbVComps.Text;
      if cbAComp.Checked then
        config.AComp := cbAComps.Text;
      config.VCompState := '';
    end;
  finally
    Free;
  end;
end;

procedure TFGraphConfig.cbWantPreviewClick(Sender: TObject);
begin
  cbWantBitmaps.Enabled := cbWantPreview.Checked;
  cbWantAudioPreview.Enabled := cbWantPreview.Checked;
end;

procedure TFGraphConfig.cbWantAudioClick(Sender: TObject);
begin
  cbASources.Enabled := cbWantAudio.Checked;
  cbAComp.Enabled := cbWantCapture.Checked and cbWantAudio.Checked;
  cbAComps.Enabled := cbWantCapture.Checked and cbWantAudio.Checked;
end;

procedure TFGraphConfig.cbWantCaptureClick(Sender: TObject);
begin
  feCaptureFile.Enabled := cbWantCapture.Checked;
  cbDoPreallocCaptureFile.Enabled := cbWantCapture.Checked;
  cbUseTempFile.Enabled := cbWantCapture.Checked;
  cbVComps.Enabled := cbWantCapture.Checked;
  cbVComp.Enabled := cbWantCapture.Checked;
  cbAComps.Enabled := cbWantCapture.Checked;
  cbAComp.Enabled := cbWantCapture.Checked;
end;

procedure TFGraphConfig.cbUseTempFileClick(Sender: TObject);
begin
  feTempFile.Enabled := cbUseTempFile.Checked;
end;

procedure TFGraphConfig.cbVCompClick(Sender: TObject);
begin
  cbVComps.Enabled := cbWantCapture.Checked and cbVComp.Checked;
end;

procedure TFGraphConfig.cbACompClick(Sender: TObject);
begin
  cbAComps.Enabled := cbWantCapture.Checked and cbWantAudio.Checked and cbAComp.Checked;
end;

procedure TFGraphConfig.FormCreate(Sender: TObject);
var
  s: TStringList;
begin
  s := GetVideoDevicesList;
  try
    cbVSources.Items.Assign(s);
  finally
    s.Free;
  end;

  s := GetAudioDevicesList;
  try
    cbASources.Items.Assign(s);
  finally
    s.Free;
  end;

  s := GetVideoCompressorsList;
  try
    cbVComps.Items.Assign(s);
  finally
    s.Free;
  end;

  s := GetAudioCompressorsList;
  try
    cbAComps.Items.Assign(s);
  finally
    s.Free;
  end;
end;

procedure TFGraphConfig.cbDoPreallocCaptureFileClick(Sender: TObject);
begin
  sePreallocSize.Enabled := cbDoPreallocCaptureFile.Checked;
end;

end.

