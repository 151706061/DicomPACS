unit VolumeRenderingEx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, V3DRenWindow, ExtCtrls, StdCtrls, Menus,
  DCM_Attributes, Dcm_View, DB, LoadXMLTransferParam, dxSkinsCore,
  dxSkinsDefaultPainters, cxControls, cxContainer, cxEdit, cxGroupBox,
  cxRadioGroup, cxLookAndFeelPainters, cxButtons, cxCheckBox, cxSplitter,
  dxSkinOffice2007Green, DCM32, dxSkinBlack, dxSkinOffice2007Black, Medotrade;

type
  TVolumeRenderingForm = class(TForm)
    Cns3DRenderWindow1: TCns3DRenderWindow;
    AdvPopupMenu1: TPopupMenu;
    Reset1: TMenuItem;
    axView1: TMenuItem;
    axViewOpposite1: TMenuItem;
    saView1: TMenuItem;
    saViewOpposite1: TMenuItem;
    coView1: TMenuItem;
    CoViewOpposite1: TMenuItem;
    OpenDialog1: TOpenDialog;
    paMisc: TPanel;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    RadioGroup3: TRadioGroup;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    CheckBox1: TCheckBox;
    bEdit: TcxButton;
    cxGroupBox3: TcxGroupBox;
    bColorTable: TcxButton;
    cbOrient: TcxCheckBox;
    cbX: TcxCheckBox;
    bCube: TcxButton;
    DicomMultiViewer1: TDicomMultiViewer;
    bView: TcxButton;
    cxSplitter1: TcxSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Reset1Click(Sender: TObject);
    procedure JoystickCamera1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RadioGroup3Click(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure bColorTableClick(Sender: TObject);
    procedure cbOrientClick(Sender: TObject);
    procedure cbXClick(Sender: TObject);
    procedure bCubeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fDataSetIndex : Integer;
    fSeriesUID: string;
    fModality: string;

    fLookupTable: TDataset;
    fPresetTable: TDataset;

    fSettings: TTransferFunctionsSettings;

    procedure PrepareData;

    procedure UpdateShading;
  end;

implementation

uses  ShadingUnit;
{$R *.dfm}

{ TVolumeRenderingForm }

procedure TVolumeRenderingForm.PrepareData;
var
  c1: TCursor;
  wl, ww: Single;
begin
  if assigned(Cns3DRenderWindow1.DicomDatasets) and (Cns3DRenderWindow1.DicomDatasets.Count > 0) then
  begin
    c1 := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    try
      Cns3DRenderWindow1.SeriesUID := fSeriesUID;
      Cns3DRenderWindow1.ActiveRendering := true;
      Cns3DRenderWindow1.AttributesIndex := fDatasetIndex;
      Cns3DRenderWindow1.StartRendering;
      wl := DicomMultiViewer1.ActiveView.Attributes.ImageData.WindowCenter;
      ww := DicomMultiViewer1.ActiveView.Attributes.ImageData.WindowWidth;
      Cns3DRenderWindow1.SetWLWW(wl, ww);
      Cns3DRenderWindow1.Invalidate;

      UpdateShading;
    finally
      Screen.Cursor := c1;
    end;
  end;
end;

procedure TVolumeRenderingForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Cns3DRenderWindow1.ActiveRendering := false;
end;

procedure TVolumeRenderingForm.FormCreate(Sender: TObject);
begin
  fLookupTable := nil;
  fPresetTable := nil;
  Cns3DRenderWindow1.ActiveRendering := true;
  cbOrient.Checked := True;
end;

procedure TVolumeRenderingForm.RadioGroup3Click(Sender: TObject);
begin
  Cns3DRenderWindow1.VolumeEngine := RadioGroup3.ItemIndex;
  Cns3DRenderWindow1.Invalidate;
end;

procedure TVolumeRenderingForm.bColorTableClick(Sender: TObject);
var
  stm1: TFileStream;
begin
  OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName);
  if OpenDialog1.Execute then
  begin
    stm1 := TFileStream.Create(OpenDialog1.FileName, fmOpenRead);
    Cns3DRenderWindow1.LoadLutFromStream(stm1);
    Cns3DRenderWindow1.Invalidate;
    stm1.free;
  end;
end;

procedure TVolumeRenderingForm.bEditClick(Sender: TObject);
var form1: TShadingForm;
    f1, f2, f3, f4: Double;
begin
  form1 := TShadingForm.Create(self);
  try
    Cns3DRenderWindow1.GetShadingValues(f1, f2, f3, f4);
    form1.cxTextEdit1.Text := Format('%f', [f1]);
    form1.cxTextEdit2.Text := Format('%f', [f2]);
    form1.cxTextEdit3.Text := Format('%f', [f3]);
    form1.cxTextEdit4.Text := Format('%f', [f4]);
    if form1.ShowModal = mrok then
    begin
      f1 := StrToFloat(form1.cxTextEdit1.Text);
      f2 := StrToFloat(form1.cxTextEdit2.Text);
      f3 := StrToFloat(form1.cxTextEdit3.Text);
      f4 := StrToFloat(form1.cxTextEdit4.Text);
      Label2.Caption := Format('Ambient %f', [f1]);
      Label4.Caption := Format('Diffuse %f', [f2]);
      Label5.Caption := Format('Specular %f-%f', [f3, f4]);

      Cns3DRenderWindow1.SetShadingValues(f1, f2, f3, f4);
    end;
  finally
    form1.free;
  end;
end;

procedure TVolumeRenderingForm.Reset1Click(Sender: TObject);
begin
  Cns3DRenderWindow1.SetViewOrientation(Tmenu(Sender).Tag);
  Cns3DRenderWindow1.Invalidate;
end;

procedure TVolumeRenderingForm.JoystickCamera1Click(Sender: TObject);
begin
  Cns3DRenderWindow1.InteractorMode := Tmenu(Sender).Tag
end;

procedure TVolumeRenderingForm.CheckBox1Click(Sender: TObject);
begin
  Cns3DRenderWindow1.ActivateShading(CheckBox1.Checked);
  Cns3DRenderWindow1.Invalidate;
end;

procedure TVolumeRenderingForm.bCubeClick(Sender: TObject);
begin
  Cns3DRenderWindow1.ShowCropCube;
  Cns3DRenderWindow1.Invalidate;
end;

procedure TVolumeRenderingForm.FormDestroy(Sender: TObject);
begin
  fSettings.Free;
end;

procedure TVolumeRenderingForm.UpdateShading;
var
  f1, f2, f3, f4: Double;
begin
  Cns3DRenderWindow1.GetShadingValues(f1, f2, f3, f4);
  Label2.Caption := Format('Ambient %f', [f1]);
  Label4.Caption := Format('Diffuse %f', [f2]);
  Label5.Caption := Format('Specular %f-%f', [f3, f4]);
  CheckBox1.Checked := Cns3DRenderWindow1.IsShading = 1;
end;

procedure TVolumeRenderingForm.Button4Click(Sender: TObject);
var
  form1: TShadingForm;
  f1, f2, f3, f4: Double;
begin
  form1 := TShadingForm.Create(self);
  try
    Cns3DRenderWindow1.GetShadingValues(f1, f2, f3, f4);
    form1.cxTextEdit1.Text := Format('%f', [f1]);
    form1.cxTextEdit2.Text := Format('%f', [f2]);
    form1.cxTextEdit3.Text := Format('%f', [f3]);
    form1.cxTextEdit4.Text := Format('%f', [f4]);
    if form1.ShowModal = mrok then
    begin
      f1 := StrToFloat(form1.cxTextEdit1.Text);
      f2 := StrToFloat(form1.cxTextEdit2.Text);
      f3 := StrToFloat(form1.cxTextEdit3.Text);
      f4 := StrToFloat(form1.cxTextEdit4.Text);
      Cns3DRenderWindow1.SetShadingValues(f1, f2, f3, f4);
    end;
  finally
    form1.free;
  end;
end;

procedure TVolumeRenderingForm.cbOrientClick(Sender: TObject);
begin
  Cns3DRenderWindow1.SwitchOrientationWidget;
  Cns3DRenderWindow1.Invalidate;
end;

procedure TVolumeRenderingForm.cbXClick(Sender: TObject);
begin
  Cns3DRenderWindow1.SwitchStereoMode;
  Cns3DRenderWindow1.Invalidate;
end;

end.

