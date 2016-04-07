{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit Dcm_GLView;

{$DEFINE USEMarchingCubesEx}
{.$DEFINE DICOMDEBUX1}

interface

uses
  SysUtils, Classes, Controls, ExtCtrls, Windows, Messages, Graphics, Forms, Dialogs,
  {$IFDEF DICOMDEBUX1}DbugIntf, {$ENDIF} DCM_ImageData_Texture,
  DCM_Attributes, gl,  glu, glext, dotmath, DCM_3D, DCM_MarchingCubes, math;

type
  TAdVector3 = packed record
    {@exclude}
    x, y, z: single;
  end;
  {A standard 3x3 matrix.}
  TAdMatrix = array[0..3] of array[0..3] of single;

  TCGColorF = record
    R, G, B, A: Single; // RGBA floating point quadruple.
  end;
  PCGColorF = ^TCGColorF;
  TCGVector = record
    x, y, z, w: Single; // Store w for OpenGL compatibility, but keep it 1.
  end;
  PCGVector = ^TCGVector;

  TRectangle = record
    Left, Top, Width, Height: Integer;

  end;

  TOpenGLDeviceContext = class(TObject)
  private
    FDC: HDC;
    FRC: HGLRC;
    FPalette: HPALETTE;
  public
    constructor Create(DC: HDC);
    destructor Destroy; override;
    procedure InitGL;
    procedure MakeCurrent;
    procedure PageFlip;
    procedure CleanUpGL;
    procedure RedoPalette;
    property DC: HDC read FDC;
    property RC: HGLRC read FRC;
    property Palette: HPALETTE read FPalette;
  end;

  TDicomLight = class(TObject) // OpenGL light source.
  private
    FIndex: GLenum;
    FAmbient: TCGColorF;
    FDiffuse: TCGColorF;
    FSpecular: TCGColorF;
    FPosition: TCGVector;
    FSpotDirection: TCGVector;
    FSpotExponent: Single;
    FSpotCutoff: Single;
    FConstAtt: Single;
    FLinearAtt: Single;
    FQuadraticAtt: Single;
    FInfinite: Boolean;
    procedure SetAmbient(c: TCGColorF);
    procedure SetDiffuse(c: TCGColorF);
    procedure SetSpecular(c: TCGColorF);
    procedure SetPosition(v: TCGVector);
    procedure SetSpotDirection(d: TCGVector);
    procedure SetSpotExponent(e: Single);
    procedure SetSpotCutoff(c: Single);
    procedure SetConstAtt(a: Single);
    procedure SetLinearAtt(a: Single);
    procedure SetQuadraticAtt(a: Single);
    procedure SetInfinite(i: Boolean);
  public
    constructor Create(light: GLenum);
    procedure Enable;
    procedure Disable;
    property Ambient: TCGColorF read FAmbient write SetAmbient;
    property Diffuse: TCGColorF read FDiffuse write SetDiffuse;
    property Specular: TCGColorF read FSpecular write SetSpecular;
    property Position: TCGVector read FPosition write SetPosition;
    property SpotDirection: TCGVector read FSpotDirection write SetSpotDirection;
    property SpotExponent: Single read FSpotExponent write SetSpotExponent;
    property SpotCutoff: Single read FSpotCutoff write SetSpotCutoff;
    property ConstAtt: Single read FConstAtt write SetConstAtt;
    property LinearAtt: Single read FLinearAtt write SetLinearAtt;
    property QuadraticAtt: Single read FQuadraticAtt write SetQuadraticAtt;
    property Infinite: Boolean read FInfinite write SetInfinite;
  end;

  TDicomGLView = class(TCustomControl)
  private
    fLight: TDicomLight;
    fLight1: TDicomLight;

    LightKind: bool;
    Angle: integer;
    AxesX, AxesY, AxesZ: glfloat;
    ToRotate: bool;
    RotationX, RotationY, RotationZ: glfloat;
    MouseLastX, MouseLastY, MouseDeltaX, MouseDeltaY: integer;
    //    RotateSpeed: integer;

    xPos, yPos: glfloat;

    FContext: TOpenGLDeviceContext;

    scaleValue: glFloat;
    curDCMpwidth, curDCMpheight: Integer;

    FColor: TColor;
    FAttributes: TDicomAttributes;

    Image1: GluInt;
    FCurrentIndex: integer;
    FDicomDatasets: TDicomDatasets;
    FColumn: Integer;
    FRow: Integer;

    fMarchingCubes: TDicomMarchingCubes;
    fMarchingCubesEx: TMarchingCubes;
    FOnDraw: TNotifyEvent;
    FZoom: glFloat;
    FZoomFactor: glFloat;
    fMaxRange: glFloat;
    FPerspective: Boolean;

    procedure SetAttributes(const Value: TDicomAttributes);
    procedure SetColor(const Value: TColor);
    function GetAttributes: TDicomAttributes;
    procedure SetCurrentIndex(const Value: integer);
    procedure SetDicomDatasets(const Value: TDicomDatasets);
    procedure SetColumn(const Value: Integer);
    procedure SetRow(const Value: Integer);
    procedure SetOnDraw(const Value: TNotifyEvent);
    procedure SetZoom(const Value: glFloat);
    procedure SetPerspective(const Value: Boolean);

    procedure draw2DPointMarker(display2DPoint: TPoint);
    procedure Reshape(w, h: GLsizei);
  protected

    procedure LoadExtensions; virtual;
    procedure CreateScene; virtual;
    procedure CreateTextures; virtual;
    procedure CreateShaders; virtual;

    procedure CMMouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;

    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure WMEraseBkgnd(var Message: TMessage); message WM_ERASEBKGND;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure AddSurface(ASeriesUID: string; aLowThreshold, aHighThreshold: Integer);
    procedure AddSurfaceEx(ASeriesUID: string; aLowThreshold,
      aHighThreshold: Integer);

    procedure BuildSurface;
    procedure RemoveSurface;

    procedure UpdateX;

    procedure Draw; virtual;
    procedure loaded; override;
    procedure Paint; override;

    procedure Init;
    procedure InitOpenGL;
    procedure InitLight2;
    procedure Resize; override;

    property MarchingCubes: TDicomMarchingCubes read fMarchingCubes;
    property MarchingCubesEx: TMarchingCubes read fMarchingCubesEx;

    property Context: TOpenGLDeviceContext read FContext;
    property Attributes: TDicomAttributes read GetAttributes write SetAttributes;

    property Perspective: Boolean read FPerspective write SetPerspective;
  published

    property DicomDatasets: TDicomDatasets read FDicomDatasets write SetDicomDatasets;
    property CurrentIndex: integer read FCurrentIndex write SetCurrentIndex;

    property Column: Integer read FColumn write SetColumn;
    property Row: Integer read FRow write SetRow;

    property Zoom: glFloat read FZoom write SetZoom;

    property Color: TColor read FColor write SetColor;

    property OnDraw: TNotifyEvent read FOnDraw write SetOnDraw;

    { Published properties }
    property Align;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
  end;
  TCustomDicomViewGLDrawMode = (glDmUseTexture, glDmUseDrawPixel);

  TCustomDicomViewGL = class(TCustomControl)
  private
    FContext: TOpenGLDeviceContext;
    FZoom: glFloat;
    FColumn: Integer;
    FRow: Integer;
    FCurrentIndex: integer;
    FColor: TColor;
    FDicomDatasets: TDicomDatasets;

    FOnDraw: TNotifyEvent;

    FRenderingToFBO: boolean;
    FCanUseFBO: boolean;

    fTexturePointerData: TTexturePointerData;
    fTextureData: TTextureData;
    fDrawMode: TCustomDicomViewGLDrawMode;

    AngleFirstPoint: TPoint;
    Angle2ndPoint: TPoint;

    LastMousePos: TPoint;
    LastChangeMousePos: TPoint;
    DownMousePos: TPoint;
    MovingMousePos: TPoint;
    fMouseDragging: Boolean;
    fDraggingMouseButton: TMouseButton;

    //    fLeftMouseInteract: TMouseInteract;
    //    fRightMouseInteract: TMouseInteract;
    //    fMouseWheelInteract: TMouseWheelInteract;

    procedure SetColor(const Value: TColor);
    procedure SetColumn(const Value: Integer);
    procedure SetCurrentIndex(const Value: integer);
    procedure SetDicomDatasets(const Value: TDicomDatasets);
    procedure SetOnDraw(const Value: TNotifyEvent);
    procedure SetRow(const Value: Integer);
    procedure SetZoom(const Value: glFloat);

    procedure Setup2DScene(AWidth, AHeight: integer; ANearZ,
      AFarZ: double);
    procedure Setup3DScene(AWidth, AHeight: integer; APos, ADir,
      AUp: TAdVector3; ANearZ, AFarZ: double);
    procedure SetupManualScene(AMatView, AMatProj: TAdMatrix);
    procedure SetDrawMode(const Value: TCustomDicomViewGLDrawMode);
    function GetAttributes: TDicomAttributes;
  protected
    procedure CMMouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;

    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure WMEraseBkgnd(var Message: TMessage); message WM_ERASEBKGND;

    procedure Reshape(w, h: GLsizei);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure loaded; override;
    procedure Paint; override;

    procedure Init;
    procedure Draw; virtual;
    procedure Resize; override;

    procedure UpdateX;
  published

    property DicomDatasets: TDicomDatasets read FDicomDatasets write SetDicomDatasets;
    property CurrentIndex: integer read FCurrentIndex write SetCurrentIndex;

    property Attributes: TDicomAttributes read GetAttributes;
    property Column: Integer read FColumn write SetColumn;
    property Row: Integer read FRow write SetRow;

    property Zoom: glFloat read FZoom write SetZoom;

    property Color: TColor read FColor write SetColor;

    property OnDraw: TNotifyEvent read FOnDraw write SetOnDraw;
    property DrawMode: TCustomDicomViewGLDrawMode read FDrawMode write SetDrawMode;
    { Published properties }
    property Align;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
  end;

  TDicomViewGL = class(TCustomDicomViewGL);

type
  TDotDisplayModeEnumCB = function(w, h, bpp, refresh: Cardinal): Boolean of object;

procedure glGenTextures(n: GLsizei; var textures: GLuint); stdcall; external opengl32;
procedure glBindTexture(target: GLenum; texture: GLuint); stdcall; external opengl32;
procedure glDeleteTextures(n: GLenum; var textures: GLuint); stdcall; external opengl32;

procedure cgDisableAllLights;
function cgVector(vx, vy, vz: Single): TCGVector;
function cgColorF(cR, cG, cB, cA: Single): TCGColorF;
procedure cgBufferConfig(dbuffer, index: Boolean);
procedure cgChangeRes(rw, rh, rbpp: Cardinal);

implementation

const
  Xmin = 0.0;
  Xmax = 400.0;
  Ymin = 0.0;
  Ymax = 400.0;

var
  DoubleBuffer: Boolean = TRUE;
  ColorIndex: Boolean = FALSE;

procedure cgBufferConfig(dbuffer, index: Boolean);
begin

  // Override the display mode flags. Call InitGL _after_ this!
  DoubleBuffer := dbuffer;
  ColorIndex := index;

end;

function ChangeDisplaySettings(lpDevMode: PDeviceModeA; dwFlags: DWORD): Longint; stdcall;
  external user32 name 'ChangeDisplaySettingsA';

procedure cgChangeRes(rw, rh, rbpp: Cardinal);
var
  devMode: TDeviceMode;
  modeExists: LongBool;
  modeSwitch, closeMode, i: Integer;
begin

  // Change the display resolution to rw x rh and rbpp bits.
  // Use cgChangeRes(0, 0, 0) to restore the normal resolution.
  closeMode := 0;
  i := 0;
  repeat
    modeExists := EnumDisplaySettings(nil, i, devMode);
    // if not modeExists then: This mode may not be supported. We'll try anyway, though.
    with devMode do
    begin
      if (dmBitsPerPel = rbpp) and (dmPelsWidth = rw) and (dmPelsHeight = rh) then
      begin
        modeSwitch := ChangeDisplaySettings(@devMode, CDS_FULLSCREEN);
        if modeSwitch = DISP_CHANGE_SUCCESSFUL then
          Exit;
      end;
    end;
    if closeMode <> 0 then
      closeMode := i;
    INC(i);
  until not modeExists;

  EnumDisplaySettings(nil, closeMode, devMode);
  with devMode do
  begin
    dmBitsPerPel := rbpp;
    dmPelsWidth := rw;
    dmPelsHeight := rh;
    dmFields := DM_BITSPERPEL or DM_PELSWIDTH or DM_PELSHEIGHT;
  end;
  modeSwitch := ChangeDisplaySettings(@devMode, CDS_FULLSCREEN);
  if modeSwitch = DISP_CHANGE_SUCCESSFUL then
    Exit;

  devMode.dmFields := DM_BITSPERPEL;
  modeSwitch := ChangeDisplaySettings(@devMode, CDS_FULLSCREEN);
  if modeSwitch = DISP_CHANGE_SUCCESSFUL then
  begin
    devMode.dmFields := DM_PELSWIDTH or DM_PELSHEIGHT;
    modeSwitch := ChangeDisplaySettings(@devMode, CDS_FULLSCREEN);
    if modeSwitch = DISP_CHANGE_SUCCESSFUL then
    begin
      ChangeDisplaySettings(nil, 0);
      Exit;
    end;
  end;

end;

procedure cgInitDC(DC: HDC; Palette: HPalette);
var
  hHeap: Integer;
  nColors, i: Integer;
  lpPalette: PLogPalette;
  byRedMask, byGreenMask, byBlueMask: Byte;
  nPixelFormat: Integer;
  pfd: TPixelFormatDescriptor;
begin

  // Initialise the form's DC for OpenGL, and setup a palette.
  FillChar(pfd, SizeOf(pfd), 0);
  with pfd do
  begin
    nSize := SizeOf(TPixelFormatDescriptor); // Size of this structure
    nVersion := 1; // Version number
    dwFlags := PFD_DRAW_TO_WINDOW or
      PFD_SUPPORT_OPENGL; // Flags
    if DoubleBuffer then
      dwFlags := dwFlags or PFD_DOUBLEBUFFER; // Double buffering?
    if ColorIndex then
      iPixelType := PFD_TYPE_COLORINDEX // Color index pixel values
    else
      iPixelType := PFD_TYPE_RGBA; // RGBA pixel values
    cColorBits := 24; // 24-bit color
    cDepthBits := 24; // 24-bit depth buffer
    cStencilBits := 8; // Stencil buffer, too.
    iLayerType := PFD_MAIN_PLANE; // Layer type
  end;

  nPixelFormat := ChoosePixelFormat(DC, @pfd);
  SetPixelFormat(DC, nPixelFormat, @pfd);

  DescribePixelFormat(DC, nPixelFormat, SizeOf(TPixelFormatDescriptor), pfd);

  if ((pfd.dwFlags and PFD_NEED_PALETTE) <> 0) then
  begin
    nColors := 1 shl pfd.cColorBits;
    hHeap := GetProcessHeap;
    lpPalette := HeapAlloc(hHeap, 0, sizeof(TLogPalette) + (nColors * sizeof(TPaletteEntry)));

    lpPalette^.palVersion := $300;
    lpPalette^.palNumEntries := nColors;

    byRedMask := (1 shl pfd.cRedBits) - 1;
    byGreenMask := (1 shl pfd.cGreenBits) - 1;
    byBlueMask := (1 shl pfd.cBlueBits) - 1;

    for i := 0 to nColors - 1 do
    begin
      lpPalette^.palPalEntry[i].peRed := (((i shr pfd.cRedShift) and byRedMask) * 255) div
        byRedMask;
      lpPalette^.palPalEntry[i].peGreen := (((i shr pfd.cGreenShift) and byGreenMask) * 255) div
        byGreenMask;
      lpPalette^.palPalEntry[i].peBlue := (((i shr pfd.cBlueShift) and byBlueMask) * 255) div
        byBlueMask;
      lpPalette^.palPalEntry[i].peFlags := 0;
    end;

    Palette := CreatePalette(lpPalette^);
    HeapFree(hHeap, 0, lpPalette);

    if Palette <> 0 then
    begin
      SelectPalette(DC, Palette, FALSE);
      RealizePalette(DC);
    end;
  end;
  // Restore default flags for the next window or DC.
  DoubleBuffer := TRUE;
  ColorIndex := FALSE;

end;

{******************************************************************************}
{ TOpenGLDeviceContext                                                             }
{******************************************************************************}

constructor TOpenGLDeviceContext.Create(DC: HDC);
begin

  // Assign a DC to this object. You need to call InitGL after this.
  inherited Create;
  FDC := DC;

end;

procedure TOpenGLDeviceContext.InitGL;
begin

  // Initialize the DC for OpenGL.
  cgInitDC(FDC, FPalette);
  FRC := wglCreateContext(FDC);
  MakeCurrent;

end;

procedure TOpenGLDeviceContext.MakeCurrent;
begin

  // Make DC the current OpenGL rendering context.
  if (FDC <> 0) and (FRC <> 0) then
    wglMakeCurrent(FDC, FRC);

end;

procedure TOpenGLDeviceContext.PageFlip;
begin

  // Page flip.
  SwapBuffers(FDC);

end;

procedure TOpenGLDeviceContext.CleanUpGL;
begin

  // Clean up OpenGL rendering context's related resources.
  if FRC <> 0 then
  begin
    wglMakeCurrent(0, 0);
    wglDeleteContext(FRC);
  end;
  if FPalette <> 0 then
    DeleteObject(FPalette);
  DeleteDC(FDC);

end;

destructor TOpenGLDeviceContext.Destroy;
begin

  // Automatically clean up.
  CleanUpGL;
  inherited Destroy;

end;

procedure TOpenGLDeviceContext.RedoPalette;
begin

  // You remember this one, don't you?
  UnrealizeObject(FPalette);
  SelectPalette(FDC, FPalette, FALSE);
  RealizePalette(FDC);

end;

////////////////////////////////////////////////////////////////////////

procedure TDicomGLView.CMMouseEnter(var Msg: TMessage);
begin
end;

procedure TDicomGLView.CMMouseLeave(var Msg: TMessage);
begin

end;

constructor TDicomGLView.Create(AOwner: TComponent);
begin
  inherited;
  fLight := nil;
  fLight1 := nil;

  FPerspective := false;
  fMaxRange := 40;
  angle := 0;
  AxesX := 0.0;
  AxesY := 1.0;
  AxesZ := 0.0;
  //WHAdjust := 1;

  xPos := 0.0;
  yPos := 0.0;

  FZoom := 1;
  FZoomFactor := fMaxRange * 4;

  LightKind := false;

  FCurrentIndex := -1;
  FDicomDatasets := nil;
  FAttributes := nil;

  BevelOuter := bvNone;
  BevelInner := bvNone;
  FContext := nil;

  ToRotate := false;
  fMarchingCubes := nil;
  fMarchingCubesEx := nil;
end;

procedure TDicomGLView.CreateScene;
begin

end;

procedure TDicomGLView.CreateShaders;
begin

end;

procedure TDicomGLView.CreateTextures;
begin

end;

destructor TDicomGLView.Destroy;
begin
  if FContext <> nil then
    FContext.Free;

  if fMarchingCubes <> nil then
    fMarchingCubes.Free;

  if fMarchingCubesEx <> nil then
    fMarchingCubesEx.Free;

  if fLight <> nil then
    fLight.Free;

  if fLight1 <> nil then
    fLight1.Free;

  if Image1 > 0 then
    glDeleteTextures(1, Image1);

  inherited;
end;

procedure TDicomGLView.InitLight2;
begin
  fLight1 := TDicomLight.Create(GL_LIGHT1);
  fLight1.Position := cgVector(0.0, 0.0, -fMaxRange * 4);
  fLight1.Ambient := cgColorF(1.0, 0.0, 0.0, 1);
  fLight1.Diffuse := cgColorF(0.0, 0.0, 1.0, 1);
  fLight1.Enable;
end;

procedure TDicomGLView.InitOpenGL;
const
  lmodel_ambient: array[0..3] of GLfloat = (0.0, 0.0, 0.0, 1.0);
  spec: array[0..3] of GLfloat = (1.0, 1.0, 1.0, 1.0);
begin
  glClearColor(0.0, 0.0, 0.0, 1.0);

  glEnable(GL_DEPTH_TEST);
  glLightModelfv(GL_LIGHT_MODEL_AMBIENT, @lmodel_ambient);
  glMaterialfv(GL_FRONT, GL_SPECULAR, @spec);
  glMaterialf(GL_FRONT, GL_SHININESS, 20);

  fLight := TDicomLight.Create(GL_LIGHT0);
  fLight.Position := cgVector(0.0, 0.0, -fMaxRange * 4);
  fLight.Enable;
  angle := 0;
  AxesX := 0.0;
  AxesY := 1.0;
  AxesZ := 0.0;
end;

procedure TDicomGLView.Init;
begin
  if FContext = nil then
  begin
    FContext := TOpenGLDeviceContext.Create(GetDC(Self.Handle));

    // Set the pixel format and initialize a rendering context.
    Context.InitGL;

    Resize;
  end;
end;

procedure TDicomGLView.LoadExtensions;
  procedure Load(const ext: string);
  begin
    if not glext_LoadExtension(ext) then
      raise Exception.Create('This demo requires ' + ext + '!');
  end;
begin
  {*****************************************************************************
    Load all required OpenGL extensions here, and throw an exception if any of
    them are not found.
   ****************************************************************************}

//  Load('GL_ARB_multitexture');

end;

procedure TDicomGLView.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited;
  ToRotate := true;
  MouseLastX := X;
  MouseLastY := Y;
end;

procedure TDicomGLView.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if ToRotate then
  begin
    MouseDeltaX := X - MouseLastX;
    MouseDeltaY := Y - MouseLastY;
    RotationX := RotationX + MouseDeltaX * 0.8;
    RotationY := RotationY + MouseDeltaY * 0.8;
    Paint;
    MouseLastX := X;
    MouseLastY := Y;
  end;
end;

procedure TDicomGLView.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  ToRotate := false;
end;

procedure TDicomGLView.Paint;
begin
  inherited;
  if (FContext = nil) or (csDesigning in ComponentState) then
  begin
    with inherited Canvas do
    begin
      Pen.Style := psDash;
      Brush.Style := bsClear;
      //Rectangle(0, 0, ClientWidth, ClientHeight);
      Brush.Color := Color;
      FillRect(rect(0, 0, ClientWidth, ClientHeight));
    end;
  end
  else
    Draw;
end;

procedure TDicomGLView.Resize;
begin
  inherited;
  if (FContext <> nil) then
  begin
    FContext.MakeCurrent;

    Reshape(ClientWidth, ClientHeight);
    invalidate;
  end;
end;

procedure DrawGLImageTile(drawType: Integer; imageWidth: Double;
  imageHeight: Double; zoom: Double; textureWidth: Double; textureHeight: Double;
  offsetX: Double; offsetY: Double; endX: Double;
  endY: Double; texturesOverlap: Boolean; textureRectangle: Boolean);
var
  startXDraw,
    endXDraw,
    startYDraw,
    endYDraw,
    texOverlap,
    startXTexCoord,
    endXTexCoord,
    startYTexCoord,
    endYTexCoord: Double;
begin
  startXDraw := (offsetX - imageWidth * 0.5) * zoom;
  // left edge of poly: offset is in image local coordinates convert to world coordinates
  endXDraw := (endX - imageWidth * 0.5) * zoom;
  // right edge of poly: offset is in image local coordinates convert to world coordinates
  startYDraw := (offsetY - imageHeight * 0.5) * zoom;
  // top edge of poly: offset is in image local coordinates convert to world coordinates
  endYDraw := (endY - imageHeight * 0.5) * zoom;
  // bottom edge of poly: offset is in image local coordinates convert to world coordinates
  if texturesOverlap then
    texOverlap := 1.0
  else
    texOverlap := 0.0;
  // size of texture overlap, switch based on whether we are using overlap or not
  startXTexCoord := texOverlap / (textureWidth + 2.0 * texOverlap);
  // texture right edge coordinate (stepped in one pixel for border if required)
  endXTexCoord := 1.0 - startXTexCoord;
  // texture left edge coordinate (stepped in one pixel for border if required)
  startYTexCoord := texOverlap / (textureHeight + 2.0 * texOverlap);
  // texture top edge coordinate (stepped in one pixel for border if required)
  endYTexCoord := 1.0 - startYTexCoord;
  // texture bottom edge coordinate (stepped in one pixel for border if required)
  if (textureRectangle) then
  begin
    startXTexCoord := texOverlap;
    // texture right edge coordinate (stepped in one pixel for border if required)
    endXTexCoord := textureWidth + texOverlap;
    // texture left edge coordinate (stepped in one pixel for border if required)
    startYTexCoord := texOverlap;
    // texture top edge coordinate (stepped in one pixel for border if required)
    endYTexCoord := textureHeight + texOverlap;
    // texture bottom edge coordinate (stepped in one pixel for border if required)
  end;
  if (endX > (imageWidth + 0.5)) then
    // handle odd image sizes, (+0.5 is to ensure there is no fp resolution problem in comparing two fp numbers)
  begin
    endXDraw := (imageWidth * 0.5) * zoom;
    // end should never be past end of image, so set it there
    if (textureRectangle) then
      endXTexCoord := endXTexCoord - 1.0
    else
      endXTexCoord := 1.0 - 2.0 * startXTexCoord;
    // for the last texture in odd size images there are two texels of padding so step in 2
  end;
  if (endY > (imageHeight + 0.5)) then
    // handle odd image sizes, (+0.5 is to ensure there is no fp resolution problem in comparing two fp numbers)
  begin
    endYDraw := (imageHeight * 0.5) * zoom;
    // end should never be past end of image, so set it there
    if (textureRectangle) then
      endYTexCoord := endYTexCoord - 1.0
    else
      endYTexCoord := 1.0 - 2.0 * startYTexCoord;
    // for the last texture in odd size images there are two texels of padding so step in 2
  end;

  glBegin(drawType);
  // draw either tri strips of line strips (so this will drw either two tris or 3 lines)
  glTexCoord2f(startXTexCoord, startYTexCoord); // draw upper left in world coordinates
  glVertex3d(startXDraw, startYDraw, 0.0);

  glTexCoord2f(endXTexCoord, startYTexCoord); // draw lower left in world coordinates
  glVertex3d(endXDraw, startYDraw, 0.0);

  glTexCoord2f(startXTexCoord, endYTexCoord); // draw upper right in world coordinates
  glVertex3d(startXDraw, endYDraw, 0.0);

  glTexCoord2f(endXTexCoord, endYTexCoord); // draw lower right in world coordinates
  glVertex3d(endXDraw, endYDraw, 0.0);
  glEnd();

  // finish strips
  (*	if (drawType == GL_LINE_STRIP) // draw top and bottom lines which were not draw with above
  begin
   glBegin (GL_LINES);
    glVertex3d(startXDraw, endYDraw, 0.0); // top edge
    glVertex3d(startXDraw, startYDraw, 0.0);

    glVertex3d(endXDraw, startYDraw, 0.0); // bottom edge
    glVertex3d(endXDraw, endYDraw, 0.0);
   glEnd();
  end;*)
end;

function GetNextTextureSize(textureDimension, maxTextureSize: Integer; textureRectangle:
  Boolean): Integer;
var
  targetTextureSize: Integer;
begin
  targetTextureSize := maxTextureSize; // start at max texture size
  if (textureRectangle) then
  begin
    if (textureDimension >= targetTextureSize) then
      // the texture dimension is greater than the target texture size (i.e., it fits)
      Result := targetTextureSize // return corresponding texture size
    else
      Result := textureDimension; // jusr return the dimension
    exit;
  end
  else
  begin
    repeat // while we have txture sizes check for texture value being equal or greater
      begin
        if (textureDimension >= targetTextureSize) then
          // the texture dimension is greater than the target texture size (i.e., it fits)
        begin
          Result := targetTextureSize; // return corresponding texture size
          exit;
        end;
      end;
      targetTextureSize := targetTextureSize shr 1;
    until (targetTextureSize) = 0;
    // step down to next texture size smaller
  end;
  Result := 0; // no textures fit so return zero
end;

function GetTextureNumFromTextureDim(textureDimension, maxTextureSize: Integer;
  texturesOverlap, textureRectangle: Boolean): Integer;
var
  i, bitValue, texOverlapx2: Integer;
begin
  // start at max texture size
  // loop through each texture size, removing textures in turn which are less than the remaining texture dimension
  // each texture has 2 pixels of overlap (one on each side) thus effective texture removed is 2 less than texture size

  i := 0; // initially no textures
  bitValue := maxTextureSize; // start at max texture size
  if texturesOverlap then
    texOverlapx2 := 2
  else
    texOverlapx2 := 0;
  textureDimension := textureDimension - texOverlapx2;
  // ignore texture border since we are using effective texure size (by subtracting 2 from the initial size)
  if (textureRectangle) then
  begin
    // count number of full textures
    while (textureDimension > (bitValue - texOverlapx2)) do
      // while our texture dimension is greater than effective texture size (i.e., minus the border)
    begin
      inc(i); // count a texture
      textureDimension := textureDimension - bitValue - texOverlapx2;
      // remove effective texture size
    end;
    // add one partial texture
    inc(i);
  end
  else
  begin
    repeat
      begin
        while (textureDimension >= (bitValue - texOverlapx2)) do
          // while our texture dimension is greater than effective texture size (i.e., minus the border)
        begin
          inc(i); // count a texture
          textureDimension := textureDimension - bitValue - texOverlapx2;
          // remove effective texture size
        end;
      end;
      bitValue := bitValue shr 1;
    until ((bitValue) > texOverlapx2);
    // step down to next texture while we are greater than two (less than 4 can't be used due to 2 pixel overlap)
    if (textureDimension > 0) then
      // if any textureDimension is left there is an error, because we can't texture these small segments and in anycase should not have image pixels left
      raise
        Exception.Create('GetTextureNumFromTextureDim error: Texture to small to draw, should not ever get here, texture size remaining');
  end;
  Result := i; // return textures counted
end;

procedure TDicomGLView.draw2DPointMarker(display2DPoint: TPoint);
var
  crossx, crossy: Double;
begin
  if (display2DPoint.x <> 0) or (display2DPoint.y <> 0) then
  begin
    glColor3f(0.0, 0.5, 1.0);
    glLineWidth(2.0);
    glBegin(GL_LINES);

    crossx := display2DPoint.x - curDCMpwidth / 2.0;
    crossy := display2DPoint.y - curDCMpheight / 2.0;

    glVertex2f(scaleValue * (crossx - 40), scaleValue * (crossy));
    glVertex2f(scaleValue * (crossx - 5), scaleValue * (crossy));
    glVertex2f(scaleValue * (crossx + 40), scaleValue * (crossy));
    glVertex2f(scaleValue * (crossx + 5), scaleValue * (crossy));

    glVertex2f(scaleValue * (crossx), scaleValue * (crossy - 40));
    glVertex2f(scaleValue * (crossx), scaleValue * (crossy - 5));
    glVertex2f(scaleValue * (crossx), scaleValue * (crossy + 5));
    glVertex2f(scaleValue * (crossx), scaleValue * (crossy + 40));
    glEnd();
  end;
end;

procedure DrawMyObjects;
begin
  //* draw some points */
  glBegin(GL_POINTS);
  glColor3f(1.0, 0.0, 0.0);
  glVertex2f(-10.0, 11.0);
  glColor3f(1.0, 1.0, 0.0);
  glVertex2f(-9.0, 10.0);
  glColor3f(0.0, 1.0, 1.0);
  glVertex2f(-8.0, 12.0);
  glEnd();

  //* draw some line_segments */
  glBegin(GL_LINES);
  glColor3f(1.0, 1.0, 0.0);
  glVertex2f(-11.0, 8.0);
  glVertex2f(-7.0, 7.0);
  glColor3f(1.0, 0.0, 1.0);
  glVertex2f(-11.0, 9.0);
  glVertex2f(-8.0, 6.0);
  glEnd();

  //* draw one opened_line */
  glBegin(GL_LINE_STRIP);
  glColor3f(0.0, 1.0, 0.0);
  glVertex2f(-3.0, 9.0);
  glVertex2f(2.0, 6.0);
  glVertex2f(3.0, 8.0);
  glVertex2f(-2.5, 6.5);
  glEnd();

  //* draw one closed_line */
  glBegin(GL_LINE_LOOP);
  glColor3f(0.0, 1.0, 1.0);
  glVertex2f(7.0, 7.0);
  glVertex2f(8.0, 8.0);
  glVertex2f(9.0, 6.5);
  glVertex2f(10.3, 7.5);
  glVertex2f(11.5, 6.0);
  glVertex2f(7.5, 6.0);
  glEnd();

  //* draw one filled_polygon */
  glBegin(GL_POLYGON);
  glColor3f(0.5, 0.3, 0.7);
  glVertex2f(-7.0, 2.0);
  glVertex2f(-8.0, 3.0);
  glVertex2f(-10.3, 0.5);
  glVertex2f(-7.5, -2.0);
  glVertex2f(-6.0, -1.0);
  glEnd();

  //* draw some filled_quandrangles */
  glBegin(GL_QUADS);
  glColor3f(0.7, 0.5, 0.2);
  glVertex2f(0.0, 2.0);
  glVertex2f(-1.0, 3.0);
  glVertex2f(-3.3, 0.5);
  glVertex2f(-0.5, -1.0);
  glColor3f(0.5, 0.7, 0.2);
  glVertex2f(3.0, 2.0);
  glVertex2f(2.0, 3.0);
  glVertex2f(0.0, 0.5);
  glVertex2f(2.5, -1.0);
  glEnd();

  //* draw some filled_strip_quandrangles */
  glBegin(GL_QUAD_STRIP);
  glVertex2f(6.0, -2.0);
  glVertex2f(5.5, 1.0);
  glVertex2f(8.0, -1.0);
  glColor3f(0.8, 0.0, 0.0);
  glVertex2f(9.0, 2.0);
  glVertex2f(11.0, -2.0);
  glColor3f(0.0, 0.0, 0.8);
  glVertex2f(11.0, 2.0);
  glVertex2f(13.0, -1.0);
  glColor3f(0.0, 0.8, 0.0);
  glVertex2f(14.0, 1.0);
  glEnd();

  //* draw some filled_triangles */
  glBegin(GL_TRIANGLES);
  glColor3f(0.2, 0.5, 0.7);
  glVertex2f(-10.0, -5.0);
  glVertex2f(-12.3, -7.5);
  glVertex2f(-8.5, -6.0);
  glColor3f(0.2, 0.7, 0.5);
  glVertex2f(-8.0, -7.0);
  glVertex2f(-7.0, -4.5);
  glVertex2f(-5.5, -9.0);
  glEnd();

  //* draw some filled_strip_triangles */
  glBegin(GL_TRIANGLE_STRIP);
  glVertex2f(-1.0, -8.0);
  glVertex2f(-2.5, -5.0);
  glColor3f(0.8, 0.8, 0.0);
  glVertex2f(1.0, -7.0);
  glColor3f(0.0, 0.8, 0.8);
  glVertex2f(2.0, -4.0);
  glColor3f(0.8, 0.0, 0.8);
  glVertex2f(4.0, -6.0);
  glEnd();

  //* draw some filled_fan_triangles */
  glBegin(GL_TRIANGLE_FAN);
  glVertex2f(8.0, -6.0);
  glVertex2f(10.0, -3.0);
  glColor3f(0.8, 0.2, 0.5);
  glVertex2f(12.5, -4.5);
  glColor3f(0.2, 0.5, 0.8);
  glVertex2f(13.0, -7.5);
  glColor3f(0.8, 0.5, 0.2);
  glVertex2f(10.5, -9.0);
  glEnd();
end;

procedure TDicomGLView.SetColor(const Value: TColor);
begin
  FColor := Value;
end;

procedure TDicomGLView.Draw;
var
  z, wx, wy: Double;
  i: Integer;
begin
  if FContext <> nil then
  begin
    FContext.MakeCurrent;
    if (Image1 > 0) then
    begin
      glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);
      glColor3f(1.0, 1.0, 1.0);
      glPushMatrix();
      glMatrixMode(GL_MODELVIEW);
      glLoadIdentity;
      if FPerspective then
        glTranslatef(0.0 + xPos, 0.0 + yPos, -fzoom * FZoomFactor);
      glRotatef(angle, AxesX, AxesY, AxesZ);
      glRotatef(RotationY, 1.0, 0.0, 0.0);
      glRotatef(RotationX, 0.0, 1.0, 0.0);

      wx := Attributes.ImageData.Width / 100;
      wy := Attributes.ImageData.Height / 100;
      z := 0;

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
      if assigned(FOnDraw) then
        FOnDraw(self);

      glPopMatrix();
    end
    else
      if fMarchingCubes <> nil then
    begin
      glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);
      glLoadIdentity;
      glColor3f(1.0, 1.0, 1.0);
      glDisable(GL_TEXTURE_2D);

      glMatrixMode(GL_MODELVIEW);

      glPushMatrix();
      if FPerspective then
        glTranslatef(0.0 + xPos, 0.0 + yPos, -fzoom * FZoomFactor);

      glRotatef(angle, AxesX, AxesY, AxesZ);
      glRotatef(RotationY, 1.0, 0.0, 0.0);
      glRotatef(RotationX, 0.0, 1.0, 0.0);

      for i := 0 to fMarchingCubes.ContourCount - 1 do
      begin
        fMarchingCubes.ContourValues[i].STDRerndering;
        //fMarchingCubes.ContourValues[i].VBORerndering;
        //fMarchingCubes.ContourValues[i].VARendering;
      end;
      //if assigned(FOnDraw) then
      //  FOnDraw(self)

      glPopMatrix();
    end
    else
      if fMarchingCubesEx <> nil then
    begin
      glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);
      glColor3f(1.0, 1.0, 1.0);
      glPushMatrix();
      glMatrixMode(GL_MODELVIEW);
      glLoadIdentity;

      if FPerspective then
        glTranslatef(0.0 + xPos, 0.0 + yPos, -fzoom * FZoomFactor);

      glRotatef(angle, AxesX, AxesY, AxesZ);
      glRotatef(RotationY, 1.0, 0.0, 0.0);
      glRotatef(180, 0.0, 1.0, 0.0);
      glRotatef(RotationX, 0.0, 1.0, 0.0);

      glTranslatef(-fMarchingCubesEx.GetRange / 4, -fMarchingCubesEx.GetRange / 4,
        -fMarchingCubesEx.GetRange / 4);

      glTranslatef(0.0, 100, 0);

      if LightKind then
        fMarchingCubesEx.DrawLightKind
      else
        fMarchingCubesEx.DrawSTD;

      glPopMatrix();
    end
    else
      if assigned(FOnDraw) then
      FOnDraw(self)
    else
    begin

      glLoadIdentity(); // reset model view matrix to identity (eliminates rotation basically)
      glScalef(2.0 / self.width, -2.0 / self.height, 1.0); // scale to port per pixel scale
      glTranslatef(-(self.width) / 2.0, -(self.height) / 2.0, 0.0); // translate center to upper left

      glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
      glEnable(GL_BLEND);

      glColor4f(249. / 255., 240. / 255., 140. / 255., 1.0);
      glLineWidth(1.0);
      glBegin(GL_QUADS);
      glVertex2f(0.0, 0.0);
      glVertex2f(0.0, self.height);
      glVertex2f(self.width, self.height);
      glVertex2f(self.width, 0);
      glEnd();
      glDisable(GL_BLEND);

      (* glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);
       glLoadIdentity;

       if FPerspective then
         glTranslatef(0.0 + xPos, 0.0 + yPos, -fzoom * FZoomFactor);

       glRotatef(angle, AxesX, AxesY, AxesZ);
       glRotatef(RotationY, -1.0, 0.0, 0.0);
       glRotatef(RotationX, 0.0, -1.0, 0.0);

       glTranslatef(-fMaxRange / 2, -fMaxRange / 2, -fMaxRange / 2);
       glBegin(GL_QUADS); // 绘制正方形

       glColor3f(0.0, 1.0, 0.0);

       glVertex3f(fMaxRange, fMaxRange, 0);
       glVertex3f(0, fMaxRange, 0);
       glVertex3f(0, fMaxRange, fMaxRange);
       glVertex3f(fMaxRange, fMaxRange, fMaxRange);

       glColor3f(1.0, 0.5, 0.0);
       glVertex3f(fMaxRange, 0, fMaxRange);
       glVertex3f(0, 0, fMaxRange);
       glVertex3f(0, 0, 0);
       glVertex3f(fMaxRange, 0, 0);

       glColor3f(1.0, 0.0, 0.0);
       glVertex3f(fMaxRange, fMaxRange, fMaxRange);
       glVertex3f(0, fMaxRange, fMaxRange);
       glVertex3f(0, 0, fMaxRange);
       glVertex3f(fMaxRange, 0, fMaxRange);

       glColor3f(1.0, 1.0, 0.0);
       glVertex3f(fMaxRange, 0, 0);
       glVertex3f(0, 0, 0);
       glVertex3f(0, fMaxRange, 0);
       glVertex3f(fMaxRange, fMaxRange, 0);

       glColor3f(0.0, 0.0, 1.0);
       glVertex3f(0, fMaxRange, fMaxRange);
       glVertex3f(0, fMaxRange, 0);
       glVertex3f(0, 0, 0);
       glVertex3f(0, 0, fMaxRange);

       glColor3f(1.0, 0.0, 1.0);
       glVertex3f(fMaxRange, fMaxRange, 0);
       glVertex3f(fMaxRange, fMaxRange, fMaxRange);
       glVertex3f(fMaxRange, 0, fMaxRange);
       glVertex3f(fMaxRange, 0, 0);

       glEnd(); // 正方形绘制结束  }
       //glColor3f(0, 0, 1);
       //glutWireTorus(0.6, 1, 16, 32);

       {glTranslatef(-fMaxRange/2, -fMaxRange/2, 0);
       glBegin(GL_TRIANGLES);
       glColor3f(1, 0, 0);
       glVertex2f(0, 0);
       //glColor3f(1, 0, 0);
       glVertex2f(fMaxRange, 0);
       //glColor3f(1, 0, 0);
       glVertex2f(0, fMaxRange);
       glEnd;//*)
    end;
    FContext.PageFlip;
  end;
end;

procedure TDicomGLView.loaded;
begin
  inherited;
  init;
end;

procedure TDicomGLView.WMEraseBkgnd(var Message: TMessage);
begin
  Message.Result := 1;
end;

procedure TDicomGLView.Reshape(w, h: GLsizei);
var
  gldAspect: glDouble;
  ratio, range: glFloat;
begin
  if (h = 0) then
    h := 1;

  if w > h then
    FZoomFactor := fMaxRange * 1.4 * w / h
  else
    FZoomFactor := fMaxRange * 1.4 * h / w;

  glViewport(0, 0, w, h);
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity;

  if FPerspective then
  begin
    gldAspect := w / h;
    //Angle, field of view angle
    //Aspect ratio of viewing volume
    //distance to near clipping plane
    //far
    gluPerspective(30.0, gldAspect, 1, 2000.0);
  end
  else
  begin
    range := fMaxRange * 0.75; //1.25
    if w <= h then
    begin
      ratio := w / h;
      range := 0.8 * range / ratio;
      glOrtho(-range * ratio, range * ratio, -range, range, -range, range); // -50, 50);
    end
    else
    begin
      ratio := h / w;
      range := 0.8 * range / ratio;
      glOrtho(-range, range, -range * ratio, range * ratio, -range, range); // -50, 50);
      //glFrustum(-range, range, -range* ratio , range * ratio, 1, 1+ 20 * range);
    end;
  end; //}

  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity;
  glEnable(GL_DEPTH_TEST);
end;

function TDicomGLView.GetAttributes: TDicomAttributes;
begin
  if FAttributes <> nil then
  begin
    Result := FAttributes;
  end
  else
    if assigned(FDicomDatasets) then
  begin
    if (FCurrentIndex >= 0) and (FCurrentIndex < FDicomDatasets.count) then
    begin
      Result := FDicomDatasets[FCurrentIndex].Attributes;
    end
    else
      Result := FDicomDatasets[0].Attributes;
  end
  else
    FAttributes := nil;
end;

procedure TDicomGLView.SetCurrentIndex(const Value: integer);
begin
  FCurrentIndex := Value;
end;

procedure TDicomGLView.SetDicomDatasets(const Value: TDicomDatasets);
begin
  FDicomDatasets := Value;
end;

procedure TDicomGLView.SetColumn(const Value: Integer);
begin
  FColumn := Value;
end;

procedure TDicomGLView.SetRow(const Value: Integer);
begin
  FRow := Value;
end;

procedure TDicomGLView.SetAttributes(const Value: TDicomAttributes);
begin
  FAttributes := Value;
end;

procedure TDicomGLView.UpdateX;
begin
  if Attributes <> nil then
  begin
    //    Image1 := Attributes.ImageData.CreateTexture(0);
    invalidate;
  end;
end;

procedure TDicomGLView.AddSurface(ASeriesUID: string; aLowThreshold,
  aHighThreshold: Integer);
var
  str1: string;
begin
  if FContext = nil then
  begin
    init;
    //InitLight2;
    //InitOpenGL;
  end;
  if Image1 > 0 then
  begin
    glDeleteTextures(1, Image1);
    Image1 := 0;
  end;
  if (FDicomDatasets <> nil) and (FDicomDatasets.count > 0) then
  begin
    if fMarchingCubes = nil then
    begin
      if ASeriesUID = '' then
      begin
        str1 := Attributes.GetString($20, $E);
      end
      else
        str1 := ASeriesUID;
      fMarchingCubes := TDicomMarchingCubes.Create(FDicomDatasets, str1);
    end;
    fMarchingCubes.AddContourValue(aLowThreshold, aHighThreshold);

    if fMarchingCubesEx <> nil then
    begin
      fMarchingCubesEx.Free;
    end;
  end;
end;

procedure TDicomGLView.AddSurfaceEx(ASeriesUID: string; aLowThreshold,
  aHighThreshold: Integer);
var
  str1: string;
begin
  if FContext = nil then
  begin
    init;
    //InitLight2;
    //InitOpenGL;
  end;
  if Image1 > 0 then
  begin
    glDeleteTextures(1, Image1);
    Image1 := 0;
  end;
  if (FDicomDatasets <> nil) and (FDicomDatasets.count > 0) then
  begin
    if fMarchingCubesEx = nil then
    begin
      if ASeriesUID = '' then
      begin
        str1 := Attributes.GetString($20, $E);
      end
      else
        str1 := ASeriesUID;
      fMarchingCubesEx := TMarchingCubes.Create(FDicomDatasets, str1);
    end;
    fMarchingCubesEx.LowThreshold := aLowThreshold;
    fMarchingCubesEx.HighThreshold := aHighThreshold;
  end;
end;

procedure TDicomGLView.RemoveSurface;
begin
  if fMarchingCubes <> nil then
  begin
    fMarchingCubes.Free;
    fMarchingCubes := nil;
  end;
  if fMarchingCubesEx <> nil then
  begin
    fMarchingCubesEx.Free;
    fMarchingCubesEx := nil;
  end;
end;

procedure TDicomGLView.BuildSurface;
begin
  if fMarchingCubes <> nil then
  begin
    fMarchingCubes.Execute;
  end;
  if fMarchingCubesEx <> nil then
  begin
    fMaxRange := fMarchingCubesEx.GetRange / 2;
    fMarchingCubesEx.CreateTriangleList;
    Reshape(ClientWidth, ClientHeight);
  end;
end;

procedure cgDisableAllLights;
begin

  // Disable all lights and lighting.
  glDisable(GL_LIGHT0);
  glDisable(GL_LIGHT1);
  glDisable(GL_LIGHT2);
  glDisable(GL_LIGHT3);
  glDisable(GL_LIGHT4);
  glDisable(GL_LIGHT5);
  glDisable(GL_LIGHT6);
  glDisable(GL_LIGHT7);
  glDisable(GL_LIGHTING);

end;

function cgColorF(cR, cG, cB, cA: Single): TCGColorF;
begin

  { Create a TCGColor. Clamp values to [0..1]. }
  with Result do
  begin
    R := cR;
    if R > 1 then
      R := 1
    else
      if R < 0 then
      R := 0;
    G := cG;
    if G > 1 then
      G := 1
    else
      if G < 0 then
      G := 0;
    B := cB;
    if B > 1 then
      B := 1
    else
      if B < 0 then
      B := 0;
    A := cA;
    if A > 1 then
      A := 1
    else
      if A < 0 then
      A := 0;
  end;

end;

function cgVector(vx, vy, vz: Single): TCGVector;
begin

  { Create a TCGVector at [vx, vy, vz]. }
  with Result do
  begin
    x := vx;
    y := vy;
    z := vz;
    w := 1;
  end;

end;

constructor TDicomLight.Create(light: GLenum);
begin

  // Create a new light source. The light parameter is GL_LIGHT0 to GL_LIGHT7.
  inherited Create;
  FIndex := light;
  // Set OpenGL defaults.
  FAmbient := cgColorF(0, 0, 0, 1);
  FDiffuse := cgColorF(1, 1, 1, 1);
  FSpecular := cgColorF(1, 1, 1, 1);
  FPosition := cgVector(0, 0, 1);
  FPosition.w := 0;
  FInfinite := TRUE;
  FSpotDirection := cgVector(0, 0, -1);
  FSpotExponent := 0;
  FSpotCutoff := 180;
  FConstAtt := 1;
  FLinearAtt := 0;
  FQuadraticAtt := 0;

end;

procedure TDicomLight.Enable;
begin

  // Enable lighting if necessary, then enable this particular light.
  glEnable(GL_LIGHTING);
  glEnable(FIndex);

end;

procedure TDicomLight.Disable;
begin

  // Disable this light (not all lights!).
  glDisable(FIndex);

end;

procedure TDicomLight.SetAmbient(c: TCGColorF);
begin

  // Set light's ambient color.
  FAmbient := c;
  glLightfv(FIndex, GL_AMBIENT, @FAmbient);

end;

procedure TDicomLight.SetDiffuse(c: TCGColorF);
begin

  // Set diffuse color.
  FDiffuse := c;
  glLightfv(FIndex, GL_DIFFUSE, @FDiffuse);

end;

procedure TDicomLight.SetSpecular(c: TCGColorF);
begin

  // Set specular highlight color.
  FSpecular := c;
  glLightfv(FIndex, GL_SPECULAR, @FSpecular);

end;

procedure TDicomLight.SetPosition(v: TCGVector);
begin

  // Set position.
  FPosition := v;
  if FInfinite then
    v.w := 0
  else
    v.w := 1;
  glLightfv(FIndex, GL_POSITION, @FPosition);

end;

procedure TDicomLight.SetSpotDirection(d: TCGVector);
begin

  // Set spotlight direction.
  FSpotDirection := d;
  glLightfv(FIndex, GL_SPOT_DIRECTION, @FSpotDirection);

end;

procedure TDicomLight.SetSpotExponent(e: Single);
begin

  // Set spotlight exponent (sort of like light density or hotspot).
  FSpotExponent := e;
  glLightf(FIndex, GL_SPOT_EXPONENT, FSpotExponent);

end;

procedure TDicomLight.SetSpotCutoff(c: Single);
begin

  // Set spot cutoff angle.
  FSpotCutoff := c;
  glLightf(FIndex, GL_SPOT_CUTOFF, FSpotCutoff);

end;

procedure TDicomLight.SetConstAtt(a: Single);
begin

  // Set constant attenuation factor.
  FConstAtt := a;
  glLightf(FIndex, GL_CONSTANT_ATTENUATION, FConstAtt);

end;

procedure TDicomLight.SetLinearAtt(a: Single);
begin

  // Set linear attenuation factor.
  FLinearAtt := a;
  glLightf(FIndex, GL_LINEAR_ATTENUATION, FConstAtt);

end;

procedure TDicomLight.SetQuadraticAtt(a: Single);
begin

  // Set quadratic attenuation factor.
  FQuadraticAtt := a;
  glLightf(FIndex, GL_QUADRATIC_ATTENUATION, FConstAtt);

end;

procedure TDicomLight.SetInfinite(i: Boolean);
begin

  { Toggle between local and infinite light source. For local lights, Position
    stores the actual light's position, for infinite lights, position stores
    the light's direction. }
  FInfinite := i;
  // OpenGL lights are made infinite by setting their w coordinate to 0.
  if i then
    FPosition.w := 0
  else
    FPosition.w := 1;
  glLightfv(FIndex, GL_POSITION, @FPosition);

end;

procedure TDicomGLView.SetOnDraw(const Value: TNotifyEvent);
begin
  FOnDraw := Value;
end;

procedure TDicomGLView.SetZoom(const Value: glFloat);
begin
  FZoom := Value;
end;

procedure TDicomGLView.SetPerspective(const Value: Boolean);
begin
  FPerspective := Value;
end;

{ TCustomDicomViewGL }

procedure TCustomDicomViewGL.CMMouseEnter(var Msg: TMessage);
begin

end;

procedure TCustomDicomViewGL.CMMouseLeave(var Msg: TMessage);
begin

end;

constructor TCustomDicomViewGL.Create(AOwner: TComponent);
begin
  inherited;
  FContext := nil;
  FRenderingToFBO := false;
  FCanUseFBO := false;

  fTexturePointerData := TTexturePointerData.Create;
  fTextureData := TTextureData.Create;
  fDrawMode := glDmUseTexture; // glDmUseDrawPixel;
end;

destructor TCustomDicomViewGL.Destroy;
begin
  fTexturePointerData.Free;
  fTextureData.Free;

  if FContext <> nil then
    FContext.Free;
  inherited;
end;

procedure TCustomDicomViewGL.Draw;
var
  z: Integer;
  f1: Single;
  wx, wy: Integer;
begin
  if FContext <> nil then
  begin
    FContext.MakeCurrent;

    glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);
    glColor3f(1.0, 1.0, 1.0);
    glPushMatrix();
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity;

    //glMatrixMode(GL_TEXTURE);
    //glLoadIdentity();
    //glScalef(1, -1, 1);
    if Attributes <> nil then
    begin
      if (fDrawMode = glDmUseDrawPixel) and (fTexturePointerData.Texture <> nil) then
      begin
        wx := fTexturePointerData.Width;
        wy := fTexturePointerData.Height;
        z := 0;
        f1 := Min(width / wx, height / wy);

        //glRasterPos2f((width - wx * f1) / 2, (height - wy * f1) / 2);
        glPixelZoom(f1, f1);
        glDrawPixels(wx, wy, fTexturePointerData.aType, GL_UNSIGNED_BYTE, fTexturePointerData.Texture);
      end
      else
        if (fTextureData.Texture <> 0) then
      begin
        wx := fTextureData.Width;
        wy := fTextureData.Height;

        glBindTexture(GL_TEXTURE_2D, fTextureData.Texture);

        f1 := Min(width / wx, height / wy);
        // Front
        glBegin(GL_QUADS);
        begin
          glTexCoord2d(0, 0);
          glVertex3f(0, 0, 0);

          glTexCoord2d(0, 1);
          glVertex3f(0, wy*f1, 0);

          glTexCoord2d(1, 1);
          glVertex3f(wx*f1, wy*f1, 0);

          glTexCoord2d(1, 0);
          glVertex3f(wx*f1, 0, 0);
        end;
        glEnd;
      end;
      {end
      else
      begin
        glBegin(GL_LINES);
        glColor3f(0.0, 1.0, 0.0);

        glVertex2f(0, 1);
        glVertex2f(200.0, 1);

        glVertex2f(1, 0);
        glVertex2f(1, 200.0);

        glVertex2f(200, 200);
        glVertex2f(200, 0);

        glVertex2f(0, 200);
        glVertex2f(200, 200);
        glEnd();}
    end;
    FContext.PageFlip;
  end;
end;

procedure TCustomDicomViewGL.Init;
begin
  if FContext = nil then
  begin
    FContext := TOpenGLDeviceContext.Create(GetDC(Self.Handle));

    // Set the pixel format and initialize a rendering context.
    FContext.InitGL;
  end;
  if (fDrawMode <> glDmUseDrawPixel) then
  begin
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glShadeModel(GL_SMOOTH);
    glClearDepth(1.0);
    glEnable(GL_DEPTH_TEST);
    glDepthFunc(GL_LESS);
    glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);

    // Tunnel
    glClearColor(0.0, 0.0, 0.0, 0.0); // Black Background
    glShadeModel(GL_SMOOTH); // Enables Smooth Color Shading
    glClearDepth(1.0); // Depth Buffer Setup
    glEnable(GL_DEPTH_TEST); // Enable Depth Buffer
    glDepthFunc(GL_LESS); // The Type Of Depth Test To Do
    glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST); //Realy Nice perspective calculations
    glBlendFunc(GL_SRC_ALPHA, GL_ONE);
    glEnable(GL_TEXTURE_2D);
  end
  else
  begin
    (*
        * Disable stuff that's likely to slow down glDrawPixels.
        * (Omit as much of this as possible, when you know in advance
        * that the OpenGL state will already be set correctly.)
    *)
    glDisable(GL_ALPHA_TEST);
    glDisable(GL_BLEND);
    glDisable(GL_DEPTH_TEST);
    glDisable(GL_DITHER);
    glDisable(GL_FOG);
    glDisable(GL_LIGHTING);
    glDisable(GL_LOGIC_OP);
    glDisable(GL_STENCIL_TEST);
    glDisable(GL_TEXTURE_1D);
    glDisable(GL_TEXTURE_2D);
    glPixelTransferi(GL_MAP_COLOR, GL_FALSE);
    glPixelTransferi(GL_RED_SCALE, 1);
    glPixelTransferi(GL_RED_BIAS, 0);
    glPixelTransferi(GL_GREEN_SCALE, 1);
    glPixelTransferi(GL_GREEN_BIAS, 0);
    glPixelTransferi(GL_BLUE_SCALE, 1);
    glPixelTransferi(GL_BLUE_BIAS, 0);
    glPixelTransferi(GL_ALPHA_SCALE, 1);
    glPixelTransferi(GL_ALPHA_BIAS, 0);

    (*
    * Disable extensions that could slow down glDrawPixels.
    * (Actually, you should check for the presence of the proper
      * extension before making these calls.I've omitted that
        * code for simplicity.)
    *)

    {$IFDEF GL_EXT_convolution}
    glDisable(GL_CONVOLUTION_1D_EXT);
    glDisable(GL_CONVOLUTION_2D_EXT);
    glDisable(GL_SEPARABLE_2D_EXT);
    {$ENDIF}

    {$IFDEF GL_EXT_histogram}
    glDisable(GL_HISTOGRAM_EXT);
    glDisable(GL_MINMAX_EXT);
    {$ENDIF}

    {$IFDEF GL_EXT_texture3D}
    glDisable(GL_TEXTURE_3D_EXT);
    {$ENDIF}
  end;
  Resize;
end;

procedure TCustomDicomViewGL.loaded;
begin
  inherited;
  init;
end;

procedure TCustomDicomViewGL.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  LastMousePos := Point(X, Y);
  LastChangeMousePos := Point(X, Y);
  DownMousePos := Point(X, Y);

  fMouseDragging := true;
  fDraggingMouseButton := Button;

end;

procedure TCustomDicomViewGL.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  Dx, Dy: Integer;
  das1: TDicomAttributes;
begin
  if fMouseDragging then
  begin

    Dx := X - LastMousePos.X;
    Dy := Y - LastMousePos.Y;

    LastMousePos := Point(X, Y);

    if assigned(fDicomDatasets) and (fDicomDatasets.Count > 0) then
    begin
      das1 := fDicomDatasets[0].Attributes;
      if fDraggingMouseButton = mbRight then
      begin
        das1.ImageData.WindowWidth := Round(das1.ImageData.WindowWidth + Dx * 10); //* Attributes.ImageData.MouseWwWlFactor);
        das1.ImageData.WindowCenter := Round(das1.ImageData.WindowCenter - Dy * 10); //* Attributes.ImageData.MouseWwWlFactor);
        UpdateX;
      end;
    end;
  end;
  inherited MouseMove(Shift, X, Y);
end;

procedure TCustomDicomViewGL.MouseUp(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  fMouseDragging := false;
end;

procedure TCustomDicomViewGL.Paint;
begin
  //inherited;
  if (FContext = nil) or (csDesigning in ComponentState) then
  begin
    with inherited Canvas do
    begin
      Pen.Style := psDash;
      Brush.Style := bsClear;
      //Rectangle(0, 0, ClientWidth, ClientHeight);
      Brush.Color := Color;
      FillRect(rect(0, 0, ClientWidth, ClientHeight));
    end;
  end
  else
    Draw;
end;

procedure TCustomDicomViewGL.Setup2DScene(AWidth, AHeight: integer; ANearZ, AFarZ: double);
begin
  glMatrixMode(GL_PROJECTION);

  glLoadIdentity;
  //When rendering to a FBO, the scene is bottom up - so we have to correct this
  if FRenderingToFBO then
    glOrtho(0, AWidth, 0, AHeight, ANearZ, AFarZ)
  else
    glOrtho(0, AWidth, AHeight, 0, ANearZ, AFarZ);

  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity;
end;

procedure TCustomDicomViewGL.Setup3DScene(AWidth, AHeight: integer;
  APos, ADir, AUp: TAdVector3; ANearZ, AFarZ: double);
begin
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity;

  //When rendering to a FBO, the scene is bottom up - so we have to correct this
  if FRenderingToFBO then
    gluPerspective(45, -AWidth / AHeight, ANearZ, AFarZ)
  else
    gluPerspective(45, AWidth / AHeight, ANearZ, AFarZ);

  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity;

  //When rendering to a FBO, the scene is bottom up - so we have to correct this
  if FRenderingToFBO then
    gluLookAt(APos.x, APos.y, APos.z, ADir.x, ADir.y, ADir.z, -AUp.x, -AUp.y, -AUp.z)
  else
    gluLookAt(APos.x, APos.y, APos.z, ADir.x, ADir.y, ADir.z, AUp.x, AUp.y, AUp.z);
end;

procedure TCustomDicomViewGL.SetupManualScene(AMatView, AMatProj: TAdMatrix);
begin
  //Load the projection matrix
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity;
  glLoadMatrixf(@AMatProj);

  //Load the modelview matrix
  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity;
  glLoadMatrixf(@AMatView);
end;

procedure TCustomDicomViewGL.UpdateX;
var
  {$IFDEF DICOMDEBUX1}
  iii: Integer;
  {$ENDIF}
  das1: TDicomAttributes;
begin
  if (fDicomDatasets <> nil) and (fDicomDatasets.count > 0) then
  begin
    {$IFDEF DICOMDEBUX1}
    iii := GetTickCount;
    {$ENDIF}

    das1 := Attributes;

    if (das1 <> nil) and (das1.ImageData.Modify) then
    begin
      if (fDrawMode = glDmUseDrawPixel) then
      begin
        if fTexturePointerData.Texture <> nil then
          FreeMem(fTexturePointerData.Texture);
        //das1.ImageData.CreateTextureData(0, fTexturePointerData);
      end
      else
      begin
        if fTextureData.Texture <> 0 then
          glDeleteTextures(1, fTextureData.Texture);
        //das1.ImageData.CreateTexture(0, fTextureData);
      end;
      das1.ImageData.Modify := false;
    end;

    {$IFDEF DICOMDEBUX1}
    iii := GetTickCount - iii;
    SendDebug(Format('CreateTexture =%d', [iii]));
    iii := GetTickCount;
    {$ENDIF}
    Draw;
    {$IFDEF DICOMDEBUX1}
    iii := GetTickCount - iii;
    SendDebug(Format('draw =%d', [iii]));
    {$ENDIF}
  end;
end;

procedure TCustomDicomViewGL.Reshape(w, h: GLsizei);
begin
  glViewport(0, 0, w, h);

  glDisable(GL_DEPTH_TEST);
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();

  Setup2DScene(w, h, -1, 1);
end;

procedure TCustomDicomViewGL.Resize;
begin
  if (FContext <> nil) then
  begin
    FContext.MakeCurrent;

    Reshape(ClientWidth, ClientHeight);
    invalidate;
  end;
  inherited;
end;

procedure TCustomDicomViewGL.SetColor(const Value: TColor);
begin
  FColor := Value;
end;

procedure TCustomDicomViewGL.SetColumn(const Value: Integer);
begin
  FColumn := Value;
end;

procedure TCustomDicomViewGL.SetCurrentIndex(const Value: integer);
begin
  FCurrentIndex := Value;
end;

procedure TCustomDicomViewGL.SetDicomDatasets(const Value: TDicomDatasets);
begin
  FDicomDatasets := Value;
end;

procedure TCustomDicomViewGL.SetOnDraw(const Value: TNotifyEvent);
begin
  FOnDraw := Value;
end;

procedure TCustomDicomViewGL.SetRow(const Value: Integer);
begin
  FRow := Value;
end;

procedure TCustomDicomViewGL.SetZoom(const Value: glFloat);
begin
  FZoom := Value;
end;

procedure TCustomDicomViewGL.WMEraseBkgnd(var Message: TMessage);
begin
  Message.Result := 1;
end;

procedure TCustomDicomViewGL.SetDrawMode(
  const Value: TCustomDicomViewGLDrawMode);
begin
  if FDrawMode <> Value then
  begin
    FDrawMode := Value;

    if fTexturePointerData.Texture <> nil then
      FreeMem(fTexturePointerData.Texture);
    fTexturePointerData.Texture := nil;
    if fTextureData.Texture <> 0 then
      glDeleteTextures(1, fTextureData.Texture);
    fTextureData.Texture := 0;

    init;

    if Attributes <> nil then
    begin
      Attributes.ImageData.Modify := true;
      UpdateX;
    end;
  end;
end;

function TCustomDicomViewGL.GetAttributes: TDicomAttributes;
begin
  Result := nil;
  if (FDicomDatasets <> nil) and (FDicomDatasets.Count > 0) and (FDicomDatasets.Count > CurrentIndex) then
  begin
    Result := FDicomDatasets[CurrentIndex].Attributes;
  end;
end;

end.

