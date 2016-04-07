unit SurfaceRenderEx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, V3DRenWindow, ExtCtrls, StdCtrls, DCM_Attributes,
  ComCtrls, Menus, Dcm_View, dxSkinsCore, dxSkinsDefaultPainters, cxControls,
  cxContainer, cxEdit, cxCheckBox, cxGroupBox, cxLabel, cxGraphics, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookAndFeelPainters, cxButtons, ActnList,
  cxSplitter, dxSkinOffice2007Green, DCM32, dxSkinBlack, dxSkinOffice2007Black,
  Medotrade;

type
  TSurfaceRenderForm = class(TForm)
    AdvPopupMenu2: TPopupMenu;
    JoystickCamera1: TMenuItem;
    JoystickActor1: TMenuItem;
    rackballCamera1: TMenuItem;
    rackballActor1: TMenuItem;
    Flight1: TMenuItem;
    Image1: TMenuItem;
    User1: TMenuItem;
    AdvPopupMenu1: TPopupMenu;
    Reset1: TMenuItem;
    axView1: TMenuItem;
    axViewOpposite1: TMenuItem;
    saView1: TMenuItem;
    saViewOpposite1: TMenuItem;
    coView1: TMenuItem;
    CoViewOpposite1: TMenuItem;
    ColorDialog1: TColorDialog;
    paMisc: TPanel;
    cxGroupBox1: TcxGroupBox;
    BResolution: TTrackBar;
    BDecimate: TTrackBar;
    BSmooth: TTrackBar;
    cxLabel1: TcxLabel;
    cbDec: TcxCheckBox;
    cxLabel2: TcxLabel;
    cbSm: TcxCheckBox;
    cxLabel3: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    cxLabel4: TcxLabel;
    cbPix: TcxComboBox;
    tePix: TcxTextEdit;
    cxLabel5: TcxLabel;
    BTransparency: TTrackBar;
    DicomMultiViewer1: TDicomMultiViewer;
    bColor: TcxButton;
    bApply: TcxButton;
    bReset: TcxButton;
    al: TActionList;
    aReset: TAction;
    aClose: TAction;
    aSet: TAction;
    cxGroupBox3: TcxGroupBox;
    cbX: TcxCheckBox;
    cbOrient: TcxCheckBox;
    cbSur: TcxComboBox;
    bClose: TcxButton;
    cxSplitter1: TcxSplitter;
    Cns3DRenderWindow1: TCns3DRenderWindow;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Reset1Click(Sender: TObject);
    procedure JoystickCamera1Click(Sender: TObject);
    procedure cbXClick(Sender: TObject);
    procedure cbOrientClick(Sender: TObject);
    procedure cxComboBox1PropertiesChange(Sender: TObject);
    procedure bColorClick(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aResetExecute(Sender: TObject);
    procedure aSetExecute(Sender: TObject);
  private
    clrImage : TColor;
    { Private declarations }
  public
    { Public declarations }
    fDatasetIndex : Integer;
    fSeriesUID: string;
    fModality: string;
    procedure PrepareData;
  end;

implementation

{$R *.dfm}

{ TSurfaceRenderForm }

procedure TSurfaceRenderForm.PrepareData;
var
  c1: TCursor;
begin
  if assigned(Cns3DRenderWindow1.DicomDatasets) and (Cns3DRenderWindow1.DicomDatasets.Count > 0) then
  begin
    c1 := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    try
      Cns3DRenderWindow1.SeriesUID := fSeriesUID;

      Cns3DRenderWindow1.ActiveRendering := true;
      Cns3DRenderWindow1.AttributesIndex := fDatasetIndex;

      Cns3DRenderWindow1.RenderFunction := rf3DSurfaceRendering;
      Cns3DRenderWindow1.StartRendering;
      //set surface

      Cns3DRenderWindow1.Invalidate;

    finally
      Screen.Cursor := c1;
    end;
  end;

end;

procedure TSurfaceRenderForm.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSurfaceRenderForm.aResetExecute(Sender: TObject);
begin
  if cbSur.ItemIndex >= 0 then
  begin
    Cns3DRenderWindow1.DeleteSurfaceActor(cbSur.ItemIndex);
    Cns3DRenderWindow1.Invalidate;
  end;
end;

procedure TSurfaceRenderForm.aSetExecute(Sender: TObject);
var r1, g1, b1: Double;
    l1: longint;
begin
  if cbSur.ItemIndex >= 0 then
  begin
    l1 := ColorToRGB(clrImage);
    b1 := ((l1 and $FF0000) shr 16) / 255;
    g1 := ((l1 and $FF00) shr 8) / 255;
    r1 := (l1 and $FF) / 255;

    Cns3DRenderWindow1.ChangeSurfaceActor(
      cbSur.ItemIndex, //actor index(0--7)
      BResolution.Position / 10,
      BTransparency.Position / 100,
      //color
      r1, g1, b1,
      //iso value
      StrToInt(tePix.Text),
      //decimate
      cbDec.Checked, BDecimate.Position / 100,
      //smooth
      cbSm.Checked, BSmooth.Position);

    Cns3DRenderWindow1.Invalidate;
  end;
end;

procedure TSurfaceRenderForm.bColorClick(Sender: TObject);
begin
//  ColorDialog1.Color := Panel2.Color;
  if ColorDialog1.Execute then
    begin
      clrImage := ColorDialog1.Color;
//      bColor.Font.Color := ColorDialog1.Color;
    end;
//    Panel2.Color := ColorDialog1.Color;
end;

procedure TSurfaceRenderForm.cbXClick(Sender: TObject);
begin
  Cns3DRenderWindow1.SwitchStereoMode;
  Cns3DRenderWindow1.Invalidate;
end;

procedure TSurfaceRenderForm.FormCreate(Sender: TObject);
begin
  BResolution.Position := 5; //0--10 ==>0--1
  BDecimate.Position := 50; //bar is 0--100  =acture is 0--1
  BSmooth.Position := 20; //0--100
  BTransparency.Position := 100; //bar is 0--100  =acture is 0--1
  cbDec.Checked := true;
  cbSm.Checked := true;
  tePix.Text := '500';
  cbOrient.Checked := True;
  cbSur.ItemIndex := 0;
  clrImage := clWhite;
  Cns3DRenderWindow1.ActiveRendering := true;
end;

procedure TSurfaceRenderForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Cns3DRenderWindow1.ActiveRendering := false;
end;

procedure TSurfaceRenderForm.Reset1Click(Sender: TObject);
begin
  Cns3DRenderWindow1.SetViewOrientation(Tmenu(Sender).Tag);
  Cns3DRenderWindow1.Invalidate;
end;

procedure TSurfaceRenderForm.JoystickCamera1Click(Sender: TObject);
begin
  Cns3DRenderWindow1.InteractorMode := Tmenu(Sender).Tag
end;

procedure TSurfaceRenderForm.cbOrientClick(Sender: TObject);
begin
  Cns3DRenderWindow1.SwitchOrientationWidget;
  Cns3DRenderWindow1.Invalidate;
end;

procedure TSurfaceRenderForm.cxComboBox1PropertiesChange(Sender: TObject);
begin
  case cbPix.ItemIndex of
    0: tePix.Text := '-500'; //skin
    1: tePix.Text := '500'; //bone
    2: tePix.Text := '2000'; //metal
  end;
end;

end.

