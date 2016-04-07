unit Mpr3DUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, OpenGlPanel, DCM32, Dcm_View, DCM_Attributes,
  opengl, StdCtrls, ToolWin, ComCtrls, Spin,DCM_MPR, Menus,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxLabel, cxControls, cxContainer, cxEdit, cxCheckBox,
  ActnList, cxButtons, dxSkinOffice2007Green, dxSkinBlack;

type
  TMPR3DForm = class(TForm)
    Splitter1: TSplitter;
    Timer1: TTimer;
    Panel1: TPanel;
    Panel2: TPanel;
    MPRDicomImage1: TMPRDicomImage;
    bPrior: TcxButton;
    bNext: TcxButton;
    al: TActionList;
    aPrior: TAction;
    aNext: TAction;
    aReset: TAction;
    aClose: TAction;
    Panel3: TPanel;
    OpenGlPanel1: TOpenGlPanel;
    Panel4: TPanel;
    cbX: TcxCheckBox;
    cbY: TcxCheckBox;
    cbZ: TcxCheckBox;
    cxLabel1: TcxLabel;
    seSpeed: TcxSpinEdit;
    bClose: TcxButton;
    bReset: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure OpenGlPanel1glDraw(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MPRDicomImage1MPRLineChanging(Sender: TObject; AIndex,
      ALineX1, ALineY1, ALineX2, ALineY2: Integer);
    procedure MPRDicomImage1DatasetChanged(Sender: TObject);
    procedure MPRDicomImage1ImageWinLevelChange(Sender: TObject; W,
      L: Integer);
    procedure OpenGlPanel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure OpenGlPanel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure OpenGlPanel1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure aPriorExecute(Sender: TObject);
    procedure aNextExecute(Sender: TObject);
    procedure aResetExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure cbXClick(Sender: TObject);
    procedure cbYClick(Sender: TObject);
    procedure cbZClick(Sender: TObject);
  private
    { Private declarations }
    FCamera: record
      //Pos: TDotVector3;
      Pitch, Yaw: Single;
    end;
    FMousePos: TPoint;
    MouseCapturing: Boolean;
  public
    { Public declarations }
    n1: TDicomMPRImage;

    Image1: GluInt;
    Image2: GluInt;
    Image3: GluInt;

    yrot: GLFloat;
    procedure SetBitmap(AIndex: Integer; ABitmap: TCnsBitmap32);
  end;

implementation
{$R *.dfm}

procedure TMPR3DForm.SetBitmap(AIndex: Integer; ABitmap: TCnsBitmap32);
var
  i, x1, y1, BitmapLength: Integer;
  pData: Pointer;
//  p1: pRGB;
  psrc1: PColor32Array;
  nc1: TColor32;
begin
  x1 := ABitmap.Width;
  y1 := ABitmap.Height;
  BitmapLength := x1 * y1 * 3;
  GetMem(pData, BitmapLength);
//  p1 := pData;
  psrc1 := ABitmap.Bits;
  for I := 0 to x1 * y1 - 1 do
  begin
    nc1 := psrc1[i];
//    p1^.r := (nc1 shr 16) and $FF;
//    p1^.g := (nc1 shr 8) and $FF;
//    p1^.b := nc1 and $FF;
//    inc(p1);
  end;
  case AIndex of
    0:
      begin
        if Image1 > 0 then
          glDeleteTextures(1, Image1);
        Image1 := CreateTexture(x1, y1, GL_RGB, pData);
      end;
    1:
      begin
        if Image2 > 0 then
          glDeleteTextures(1, Image2);
        Image2 := CreateTexture(x1, y1, GL_RGB, pData);
      end;
    2:
      begin
        if Image3 > 0 then
          glDeleteTextures(1, Image3);
        Image3 := CreateTexture(x1, y1, GL_RGB, pData);
      end;
  end;
  FreeMem(pData);
end;

procedure TMPR3DForm.FormCreate(Sender: TObject);
begin
  MouseCapturing := false;
  OpenGlPanel1.glInit;
  cbX.Checked := True;
  cbY.Checked := True;
  seSpeed.Value := 10;
end;

procedure TMPR3DForm.OpenGlPanel1glDraw(Sender: TObject);
var
  x, y, z, wx, wy, wz: Double;
  rx, ry, rz: integer;
begin
  wx := n1.getX / 100;
  wy := n1.getY / 100;
  wz := n1.getZ / 100;
  x := (MPRDicomImage1.VerLine / n1.getX - 1 / 2) * wx;
  y := (MPRDicomImage1.HozLine / n1.getY - 1 / 2) * wy;
  z := (n1.GetSliceNo(MPRDicomImage1.DicomDatasets[MPRDicomImage1.AttributesIndex]) / n1.sliceNumber - 1 / 2) * wz;

  glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);
  glLoadIdentity;

  glTranslatef(0, 0, -10);

  glRotatef(FCamera.Pitch, 1, 0, 0);
  glRotatef(FCamera.Yaw, 0, 1, 0);
  //  glTranslatef(-FCamera.Pos.x, -FCamera.Pos.y, -FCamera.Pos.z);
  if cbX.Checked then
    rx := 1
  else
    rx := 0;
  if cbY.Checked then
    ry := 1
  else
    ry := 0;
  if cbZ.Checked then
    rz := 1
  else
    rz := 0;
  if (rx <> 0) or (ry <> 0) or (rz <> 0) then
    glRotatef(yrot, rx, ry, rz);

  glBindTexture(GL_TEXTURE_2D, Image1);

  // Front
  glBegin(GL_QUADS);
  glTexCoord2d(0, 0);
  glVertex3f(-wx / 2, -wy / 2, z);
  glTexCoord2d(0, 1);
  glVertex3f(-wx / 2, wy / 2, z);
  glTexCoord2d(1, 1);
  glVertex3f(wx / 2, wy / 2, z);
  glTexCoord2d(1, 0);
  glVertex3f(wx / 2, -wy / 2, z);
  glEnd;

  glBindTexture(GL_TEXTURE_2D, Image2);
  glBegin(GL_QUADS);
  glTexCoord2d(0, 0);
  glVertex3f(x, -wy / 2, -wz / 2);
  glTexCoord2d(0, 1);
  glVertex3f(x, -wy / 2, wz / 2);
  glTexCoord2d(1, 1);
  glVertex3f(x, wy / 2, wz / 2);
  glTexCoord2d(1, 0);
  glVertex3f(x, wy / 2, -wz / 2);
  glEnd;

  glBindTexture(GL_TEXTURE_2D, Image3);
  glBegin(GL_QUADS);
  glTexCoord2d(0, 0);
  glVertex3f(-wx / 2, y, -wz / 2);
  glTexCoord2d(0, 1);
  glVertex3f(-wx / 2, y, wz / 2);
  glTexCoord2d(1, 1);
  glVertex3f(wx / 2, y, wz / 2);
  glTexCoord2d(1, 0);
  glVertex3f(wx / 2, y, -wz / 2);
  glEnd;
end;

procedure TMPR3DForm.Timer1Timer(Sender: TObject);
begin
  if cbX.Checked or cbY.Checked or cbZ.Checked then
  begin
    yrot := yrot + seSpeed.Value / 10;
    if yrot > 360 then
      yrot := 0;
  end;
  OpenGlPanel1.Draw;
end;

procedure TMPR3DForm.FormDestroy(Sender: TObject);
begin
  if Image1 > 0 then
    glDeleteTextures(1, Image1);
  if Image2 > 0 then
    glDeleteTextures(1, Image2);
  if Image3 > 0 then
    glDeleteTextures(1, Image3);
  if assigned(n1) then
    n1.Free;
end;

procedure TMPR3DForm.MPRDicomImage1MPRLineChanging(Sender: TObject; AIndex,
  ALineX1, ALineY1, ALineX2, ALineY2: Integer);
var
  b1: TCnsBitmap32;
begin
  b1 := TCnsBitmap32.Create;

  if AIndex = 1 then
  begin
    n1.AssignALineToBitmap(ALineX1, ALineY1, ALineX2, ALineY2, b1);
    SetBitmap(1, b1);
  end
  else
  begin
    n1.AssignALineToBitmap(ALineX1, ALineY1, ALineX2, ALineY2, b1);
    SetBitmap(2, b1);
  end;
end;

procedure TMPR3DForm.MPRDicomImage1DatasetChanged(Sender: TObject);
begin
  SetBitmap(0, MPRDicomImage1.Bitmap);
end;

procedure TMPR3DForm.MPRDicomImage1ImageWinLevelChange(Sender: TObject; W,
  L: Integer);
begin
  SetBitmap(0, MPRDicomImage1.Bitmap);
  MPRDicomImage1.UpdateLineV;
  MPRDicomImage1.UpdateLineH;
end;

procedure TMPR3DForm.OpenGlPanel1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FMousePos := Point(X, Y);
  MouseCapturing := true;
end;

procedure TMPR3DForm.OpenGlPanel1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if MouseCapturing then
  begin
    FCamera.Pitch := FCamera.Pitch - (Y - FMousePos.Y) / 5;
    FCamera.Yaw := FCamera.Yaw - (X - FMousePos.X) / 5;

    if FCamera.Pitch > 360 then
      FCamera.Pitch := FCamera.Pitch - 360
    else
      if FCamera.Pitch < 0 then
      FCamera.Pitch := FCamera.Pitch + 360;
    {if FCamera.Pitch > 90 then
      FCamera.Pitch := 90
    else
      if FCamera.Pitch < -90 then
      FCamera.Pitch := -90;  }

    if FCamera.Yaw > 360 then
      FCamera.Yaw := FCamera.Yaw - 360
    else
      if FCamera.Yaw < 0 then
      FCamera.Yaw := FCamera.Yaw + 360;
    FMousePos := Point(X, Y);
  end;
end;

procedure TMPR3DForm.OpenGlPanel1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  MouseCapturing := false;
end;

procedure TMPR3DForm.cbXClick(Sender: TObject);
begin
  if TCheckBox(Sender).Checked then
    yrot := 0;
end;

procedure TMPR3DForm.cbYClick(Sender: TObject);
begin
  if TCheckBox(Sender).Checked then
    yrot := 0;
end;

procedure TMPR3DForm.cbZClick(Sender: TObject);
begin
  if TCheckBox(Sender).Checked then
    yrot := 0;
end;

procedure TMPR3DForm.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TMPR3DForm.aNextExecute(Sender: TObject);
begin
  MPRDicomImage1.Next;
end;

procedure TMPR3DForm.aPriorExecute(Sender: TObject);
begin
  MPRDicomImage1.Prior;
end;

procedure TMPR3DForm.aResetExecute(Sender: TObject);
var
  k: integer;
begin
  for k := 0 to n1.sliceNumber - 1 do
  begin
    n1.ImageData[k].Reset;
  end;
  MPRDicomImage1.UpdateX;
end;

procedure TMPR3DForm.FormShow(Sender: TObject);
begin
  Timer1.Enabled := true;
end;

end.



//var
//  k: integer;
//begin
//  for k := 0 to n1.sliceNumber - 1 do
//  begin
//    n1.ImageData[k].Reset;
//  end;
//  MPRDicomImage1.UpdateX;
