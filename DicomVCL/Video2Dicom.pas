{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit Video2Dicom;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, DCM_Attributes, Buttons, StdCtrls, DicomVideoCap, ExtCtrls,
  ComCtrls, DCM32, Dcm_View, DCM_Client;

type
  TCaptureVideoForm = class(TForm)
    Panel1: TPanel;
    cap: TDicomVideoCapture;
    Label3: TLabel;
    cbVModes: TComboBox;
    Button2: TButton;
    btCaptureFrame: TBitBtn;
    Button1: TButton;
    StatusBar: TStatusBar;
    btStart: TBitBtn;
    btStop: TBitBtn;
    lbDialogs: TComboBox;
    lbFrames: TLabel;
    SpeedButton1: TSpeedButton;
    Timer: TTimer;
    Splitter1: TSplitter;
    CaptureView: TDCMMultiImage;
    Button4: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure capAborted(Sender: TObject);
    procedure capBitmapGrabbed(CapturedImage: TCapturedBitmap);
    procedure capCaptureProgress(Sender: TObject);
    procedure capChangeDevice(Sender: TObject);
    procedure capDeviceLost(Sender: TObject);
    procedure capFrameRendered(Sender: TObject);
    procedure capStartPreview(Sender: TObject);
    procedure capStopPreview(Sender: TObject);
    procedure btCaptureFrameClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure btStartClick(Sender: TObject);
    procedure btStopClick(Sender: TObject);
    procedure cbVModesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    ControlPanelSize: TSize;
    framecount: integer;
    fImageIndex: integer;
    config: TGraphConfig;
    OnCaptureNewImage: TOnAddImageEvent;
    function InitCapture: Boolean;
  end;

implementation

uses DicomVideoUtils, ActiveX, DicomVideoConfig, DicomVideoCapStrings, inifiles;
{$R *.dfm}

function TCaptureVideoForm.InitCapture: Boolean;
begin
  Result := cap.Init;
end;

procedure TCaptureVideoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cap.StopPreview;
  cap.StopCapture;
  Action := caHide;
end;

procedure TCaptureVideoForm.FormDestroy(Sender: TObject);
begin
  config.Free;
end;

procedure TCaptureVideoForm.FormShow(Sender: TObject);
var
  s: string;
begin
  if not InitCapture then
  begin
    ShowMessage('Can''t init capture!');
  end
  else
  begin
    with TIniFile.Create('Video.ini') do
    try
      s := ReadString('Graph', 'Config', '');
    finally
      free;
    end;
    if s <> '' then
      config.RestoreGraph(s)
    else
    begin
      cap.SaveGraph(config);
      if EditGraphConfig(config) then
      begin
        // StartWait;
        try
          cap.RestoreGraph(config);
        finally
          //   StopWait;
          Button1Click(Button1);
        end;
      end;
    end;
    Timer.Enabled := s <> '';
  end;
end;

procedure TCaptureVideoForm.capAborted(Sender: TObject);
begin
  // normal graph run has been aborted
end;

procedure TCaptureVideoForm.capBitmapGrabbed(
  CapturedImage: TCapturedBitmap);
var
  d1: TDicomAttributes;
  ds1: TDicomDataset;
begin
  //  CapturedImage.SaveToFile(feBitmap.FileName);
  //  Image.Picture.Assign(CapturedImage);
  d1 := NewImage(CapturedImage, false);
  d1.AddVariant($20, $13, fImageIndex);
  if assigned(d1) then
  begin
    ds1 := TDicomDataset.Create(d1);
    if assigned(OnCaptureNewImage) then
      OnCaptureNewImage(self, ds1, fImageIndex);
    inc(fImageIndex);
    CaptureView.DicomDatasets.AddDicomDataset(ds1);

    CaptureView.RefreshNews;
    CaptureView.Last;
    CaptureView.UpdateScrollBars;
    //    CaptureView.Invalidate;
  end;
end;

procedure TCaptureVideoForm.capCaptureProgress(Sender: TObject);
begin
  StatusBar.SimpleText := 'Frames Captured ' + IntToStr(cap.NotDropped) +
    '. Frames Dropped ' + IntToStr(cap.FramesDropped) +
    '. Capture time ' + IntToStr(cap.CapTime div 1000) + '.' + IntToStr((cap.CapTime div 10) mod
    100);
  btStart.Enabled := not cap.Capturing;
  btStop.Enabled := not btStart.Enabled;
end;

procedure TCaptureVideoForm.capChangeDevice(Sender: TObject);
var
  i, capCount: integer;
  cvcapMode, vcapMode: TVCapMode;
  cacapMode{, acapMode}: TACapMode;
  s: string;
  d: TCaptureDialog;
begin
  cvcapMode := cap.VCapMode;
  cacapMode := cap.ACapMode;

  self.Width := cvcapMode.Width + ControlPanelSize.cx;
  self.Height := cvcapMode.Height + ControlPanelSize.cy;

  cbVModes.Items.Clear;
  capCount := cap.VCapModeCount;
  for i := 0 to capCount - 1 do
  begin
    vcapMode := cap.VCapModes[i];
    s := GetModeString(vcapMode);
    cbVModes.Items.Add(s);
    if IsEqualModes(cvcapMode, vcapMode) then
      cbVModes.ItemIndex := i;
  end;

  {  cbAModes.Items.Clear;
    capCount := cap.ACapModeCount;
    for i := 0 to capCount - 1 do
    begin
      acapMode := cap.ACapModes[i];
      s := GetModeString(acapMode);
      cbAModes.Items.Add(s);
      if IsEqualModes(cacapMode, acapMode) then
        cbAModes.ItemIndex := i;
    end; }

  lbDialogs.Items.Clear;
  for d := Low(TCaptureDialog) to High(TCaptureDialog) do
    if d in cap.Dialogs then
    begin
      lbDialogs.Items.AddObject(DialogTitles[d], TObject(d));
    end;

end;

procedure TCaptureVideoForm.capDeviceLost(Sender: TObject);
begin
  // capture device has been lost
end;

procedure TCaptureVideoForm.capFrameRendered(Sender: TObject);
begin
  framecount := framecount + 1;
  lbFrames.Caption := Format('Frames passed: %d', [framecount]);
end;

procedure TCaptureVideoForm.capStartPreview(Sender: TObject);
begin
  // refresh cur modes
  cbVModes.ItemIndex := cap.VCapModeIdx;
  //  cbAModes.ItemIndex := cap.VCapModeIdx;
  framecount := 0;
  lbFrames.Caption := '';
end;

procedure TCaptureVideoForm.capStopPreview(Sender: TObject);
begin
  framecount := 0;
  lbFrames.Caption := '';
end;

procedure TCaptureVideoForm.btCaptureFrameClick(Sender: TObject);
begin
  if not cap.CaptureFrame then
    ShowMessage('Can''t capture frame!');
end;

procedure TCaptureVideoForm.Button2Click(Sender: TObject);
begin
  cap.SaveGraph(config);
  if EditGraphConfig(config) then
  begin
    // StartWait;
    try
      cap.RestoreGraph(config);
    finally
      //   StopWait;
    end;
  end;
end;

procedure TCaptureVideoForm.Button1Click(Sender: TObject);
var
  //  s: TStringList;
    //  x: IXml2Dex;
  ini1: TIniFile;
begin
  if (cap.CaptureGraph = nil) then
    Exit;

  {s := TStringList.Create;
  try
    s.Text := DumpGraph(cap.CaptureGraph);
    s.SaveToFile('graph.txt');
  finally
    s.Free;
  end;
  //  if Succeeded(CoCreateInstance(CLSID_Xml2Dex, nil, CLSCTX_INPROC, IID_IXml2Dex, x)) then
  //    x.WriteGrfFile(cap.CaptureGraph, 'graph.grf'); }
  cap.SaveGraph(config);

  ini1 := TIniFile.Create('Video.ini');

  ini1.WriteString('Graph', 'Config', config.SaveGraph);
  ini1.Free;
end;

procedure TCaptureVideoForm.SpeedButton1Click(Sender: TObject);
begin
  if (lbDialogs.Items.Count > 0) and (lbDialogs.ItemIndex >= 0) then
    cap.ShowDialog(TCaptureDialog(lbDialogs.Items.Objects[lbDialogs.ItemIndex]));
end;

procedure TCaptureVideoForm.TimerTimer(Sender: TObject);
begin
  // make a delay to show form (let form get a handle)
  Timer.Enabled := false;
  //  StartWait;
  try
    cap.RestoreGraph(config);
  finally
    //    StopWait;
  end;
end;

procedure TCaptureVideoForm.btStartClick(Sender: TObject);
begin
  cap.StartCapture(true);
  capCaptureProgress(Self);
end;

procedure TCaptureVideoForm.btStopClick(Sender: TObject);
var
  d1: TDicomDataset;
begin
  cap.StopCapture;
  capCaptureProgress(Self);

  //Save the AVI to Dicom Cine
  d1 := TCnsDMTable(CaptureView.DicomDatasets).ImportImage(cap.CaptureFileName);
  if assigned(OnCaptureNewImage) then
    OnCaptureNewImage(self, d1, fImageIndex);
  inc(fImageIndex);

  CaptureView.RefreshNews;
  CaptureView.Last;
  CaptureView.UpdateScrollBars;
end;

procedure TCaptureVideoForm.cbVModesChange(Sender: TObject);
var
  v1: TVCapMode;
begin
  cap.SetVCapMode(cbVModes.ItemIndex);

  v1 := cap.VCapMode;
  self.Width := v1.Width + ControlPanelSize.cx;
  self.Height := v1.Height + ControlPanelSize.cy;

  cap.StartPreview;
end;

procedure TCaptureVideoForm.FormCreate(Sender: TObject);
begin
  config := TGraphConfig.Create;
  ControlPanelSize.cx := self.Width - Cap.Width;
  ControlPanelSize.cy := self.Height - Cap.Height;
  CaptureView.BufferMode := true;
end;

procedure TCaptureVideoForm.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TCaptureVideoForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  if cbVModes.Items.Count > 0 then
  begin
    NewHeight := trunc(NewWidth * cap.VCapMode.Height / cap.VCapMode.Width);
    Resize := true;
  end;
end;

end.

