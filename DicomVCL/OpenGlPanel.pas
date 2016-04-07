{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit OpenGlPanel;

interface

uses
  SysUtils, Classes, Controls, ExtCtrls, gl,glu, Windows,
  Messages, Graphics, Forms, Dialogs;

type
  TOpenGlBasePanel = class(TPanel)
  private
    Initialized: Boolean;
    FGlDraw: TNotifyEvent;
    rc: HGLRC;
    dc: HDC;

    procedure Idle(Sender: TObject; var Done: Boolean);
  public
    hApplication: TApplication;
    procedure glInit; virtual;
    procedure Paint; override;
    destructor Destroy; override;

    procedure Draw; virtual;
    constructor Create(AOwner: TComponent); override;
  protected
    procedure Resize; override;
  published
    property glDraw: TNotifyEvent read FGlDraw write FGlDraw;
    property Onkeydown;
  end;

  TOpenGlPanel = class(TOpenGlBasePanel)
  private
    fWireFrame: Boolean;
    procedure SetWireFrame(const Value: Boolean);
    { Private declarations }
  protected
  public
    procedure Paint; override;
    constructor Create(AOwner: TComponent); override;
  published
    property WireFrame: Boolean read fWireFrame write SetWireFrame;
  end;

const
  TEXTURE_SPEED = 1 / 100;
  TUNNEL_START = 2;

function CreateTexture(Width, Height, Format: Word; pData: Pointer): Integer;
//function LoadTexture(Filename: string; var Texture: GLuint; LoadFromRes: Boolean): Boolean;
procedure glGenTextures(n: GLsizei; var textures: GLuint); stdcall; external opengl32;
procedure glBindTexture(target: GLenum; texture: GLuint); stdcall; external opengl32;
procedure glDeleteTextures(n: GLenum; var textures: GLuint); stdcall; external opengl32;

implementation

{ TOpenGlPanel }

procedure setupPixelFormat(DC: HDC);
const
  pfd: TPIXELFORMATDESCRIPTOR = (nSize: sizeof(TPIXELFORMATDESCRIPTOR); // size
    nVersion: 1; // version
    dwFlags: PFD_SUPPORT_OPENGL or PFD_DRAW_TO_WINDOW or PFD_DOUBLEBUFFER;
      // support double-buffering
    iPixelType: PFD_TYPE_RGBA; // color type
    cColorBits: 24; // preferred color depth
    cRedBits: 0; cRedShift: 0; // color bits (ignored)
    cGreenBits: 0; cGreenShift: 0;
    cBlueBits: 0; cBlueShift: 0;
    cAlphaBits: 0; cAlphaShift: 0; // no alpha buffer
    cAccumBits: 0;
    cAccumRedBits: 0; // no accumulation buffer,
    cAccumGreenBits: 0; // accum bits (ignored)
    cAccumBlueBits: 0;
    cAccumAlphaBits: 0;
    cDepthBits: 16; // depth buffer
    cStencilBits: 0; // no stencil buffer
    cAuxBuffers: 0; // no auxiliary buffers
    iLayerType: PFD_MAIN_PLANE; // main layer
    bReserved: 0;
    dwLayerMask: 0;
    dwVisibleMask: 0;
    dwDamageMask: 0; // no layer, visible, damage masks
    );
var
  pixelFormat: integer;
begin
  pixelFormat := ChoosePixelFormat(DC, @pfd);
  if (pixelFormat = 0) then
    exit;
  if (SetPixelFormat(DC, pixelFormat, @pfd) <> TRUE) then
    exit;
end;
//------------------------------------------------------------------------------

procedure TOpenGlBasePanel.glInit();
//var
  //  pfd: TPIXELFORMATDESCRIPTOR;
 // pf: Integer;
begin
  Initialized := True;

  dc := GetDC(Self.Handle);
  {  pfd.nSize := sizeof(pfd);
    pfd.nVersion := 1;
    pfd.dwFlags := PFD_DRAW_TO_WINDOW or PFD_SUPPORT_OPENGL or PFD_DOUBLEBUFFER;
    pfd.iPixelType := PFD_TYPE_RGBA;
    pfd.cColorBits := 24;
    pf := ChoosePixelFormat(dc, @pfd);
    SetPixelFormat(dc, pf, @pfd); }

  setupPixelFormat(dc);

  rc := wglCreateContext(dc);
  wglMakeCurrent(dc, rc);

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

  Resize;
  //  Application.OnIdle := Idle;
end;

//------------------------------------------------------------------------------

constructor TOpenGlBasePanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  //hApplication := Application;
  BevelOuter := bvNone;
  BevelInner := bvNone;
  Initialized := False;
end;

//------------------------------------------------------------------------------

destructor TOpenGlBasePanel.Destroy;
begin
  wglMakeCurrent(0, 0);
  wglDeleteContext(rc);
  //  Application.OnIdle := nil;
  inherited Destroy;
end;

//------------------------------------------------------------------------------

procedure TOpenGlBasePanel.Idle(Sender: TObject; var Done: Boolean);
begin
  glDraw(Self);
  SwapBuffers(DC);
  Done := False;
end;

//------------------------------------------------------------------------------

procedure TOpenGlBasePanel.Draw;
begin
  glDraw(Self);
  SwapBuffers(DC);
end;

//------------------------------------------------------------------------------

procedure TOpenGlBasePanel.Resize;
begin
  inherited;
  glViewport(0, 0, Self.ClientWidth, Self.ClientHeight);
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
  gluPerspective(45.0, Self.ClientWidth / Self.ClientHeight, 1.0, 500.0);
  glMatrixMode(GL_MODELVIEW);
end;

//------------------------------------------------------------------------------

procedure TOpenGlBasePanel.Paint;
begin
  inherited;
  if csDesigning in ComponentState then
    with inherited Canvas do
    begin
      Pen.Style := psDash;
      Brush.Style := bsClear;
      Rectangle(0, 0, Width, Height);
    end;
end;

//------------------------------------------------------------------------------

procedure TOpenGlPanel.Paint;
begin
  inherited;
  // Wire Frame Mode
  if Wireframe = TRUE then
    glPolygonmode(GL_FRONT_AND_BACK, GL_LINE)
  else
    glPolygonmode(GL_FRONT, GL_FILL);
end;

//------------------------------------------------------------------------------

constructor TOpenGlPanel.Create(AOwner: TComponent);
begin
  inherited;
  Cursor := crNone;
end;

//------------------------------------------------------------------------------

procedure TOpenGlPanel.SetWireFrame(const Value: Boolean);
begin
  fWireFrame := Value;
  Paint;
end;

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

function CreateTexture(Width, Height, Format: Word; pData: Pointer): Integer;
var
  Texture: GLuint;
begin
  glGenTextures(1, Texture);
  glBindTexture(GL_TEXTURE_2D, Texture);
  glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
    {Texture blends with object background}

  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR); { only first two can be used }
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR); { all of the above can be used }
  {.$IFDEF VER150}
  if Format = GL_RGBA then
    gluBuild2DMipmaps(GL_TEXTURE_2D, GL_RGBA, Width, Height, GL_RGBA, GL_UNSIGNED_BYTE, pData)
  else
    gluBuild2DMipmaps(GL_TEXTURE_2D, 3, Width, Height, GL_RGB, GL_UNSIGNED_BYTE, pData);
 (* {$ELSE}
  {$IFDEF VER180}
  if Format = GL_RGBA then
    gluBuild2DMipmaps(GL_TEXTURE_2D, GL_RGBA, Width, Height, GL_RGBA, GL_UNSIGNED_BYTE, pData)
  else
    gluBuild2DMipmaps(GL_TEXTURE_2D, 3, Width, Height, GL_RGB, GL_UNSIGNED_BYTE, pData);
  {$ELSE}
  if Format = GL_RGBA then
    gluBuild2DMipmaps(GL_TEXTURE_2D, GL_RGBA, Width, GL_RGBA, GL_UNSIGNED_BYTE, pData)
  else
    gluBuild2DMipmaps(GL_TEXTURE_2D, 3, Width, GL_RGB, GL_UNSIGNED_BYTE, pData);
  {$ENDIF}
  {$ENDIF} *)
  result := Texture;
end;

//------------------------------------------------------------------------------

function LoadBMPTexture(Filename: string; var Texture: GLuint; LoadFromResource: Boolean): Boolean;
var
  FileHeader: BITMAPFILEHEADER;
  InfoHeader: BITMAPINFOHEADER;
  Palette: array of RGBQUAD;
  BitmapFile: THandle;
  BitmapLength: LongWord;
  PaletteLength: LongWord;
  ReadBytes: LongWord;
  Front: ^Byte;
  Back: ^Byte;
  Temp: Byte;
  I: Integer;
  Width, Height: Integer;
  pData: Pointer;

  // used for loading from resource
  ResStream: TResourceStream;
begin
  result := FALSE;

  if LoadFromResource then // Load from resource
  begin
    try
      ResStream := TResourceStream.Create(hInstance, PChar(copy(Filename, 1, Pos('.', Filename) -
        1)), 'BMP');
      ResStream.ReadBuffer(FileHeader, SizeOf(FileHeader)); // FileHeader
      ResStream.ReadBuffer(InfoHeader, SizeOf(InfoHeader)); // InfoHeader
      PaletteLength := InfoHeader.biClrUsed;
      SetLength(Palette, PaletteLength);
      ResStream.ReadBuffer(Palette, PaletteLength); // Palette

      Width := InfoHeader.biWidth;
      Height := InfoHeader.biHeight;

      BitmapLength := InfoHeader.biSizeImage;
      if BitmapLength = 0 then
        BitmapLength := Width * Height * InfoHeader.biBitCount div 8;

      GetMem(pData, BitmapLength);
      ResStream.ReadBuffer(pData^, BitmapLength); // Bitmap Data
      ResStream.Free;
    except on
      EResNotFound do
      begin
        MessageBox(0, PChar('File not found in resource - ' + Filename), PChar('BMP Texture'),
          MB_OK);
        Exit;
      end
    else
      begin
        MessageBox(0, PChar('Unable to read from resource - ' + Filename), PChar('BMP Unit'),
          MB_OK);
        Exit;
      end;
    end;
  end
  else
  begin // Load image from file

    BitmapFile := CreateFile(PChar(Filename), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0,
      0);
    if (BitmapFile = INVALID_HANDLE_VALUE) then
    begin
      Exit;
    end;

    // Get header information
    ReadFile(BitmapFile, FileHeader, SizeOf(FileHeader), ReadBytes, nil);
    ReadFile(BitmapFile, InfoHeader, SizeOf(InfoHeader), ReadBytes, nil);

    // Get palette
    PaletteLength := InfoHeader.biClrUsed;
    SetLength(Palette, PaletteLength);
    ReadFile(BitmapFile, Palette, PaletteLength, ReadBytes, nil);
    if (ReadBytes <> PaletteLength) then
    begin
      MessageBox(0, PChar('Error reading palette'), PChar('BMP Unit'), MB_OK);
      Exit;
    end;

    Width := InfoHeader.biWidth;
    Height := InfoHeader.biHeight;
    BitmapLength := InfoHeader.biSizeImage;
    if BitmapLength = 0 then
      BitmapLength := Width * Height * InfoHeader.biBitCount div 8;

    // Get the actual pixel data
    GetMem(pData, BitmapLength);
    ReadFile(BitmapFile, pData^, BitmapLength, ReadBytes, nil);
    if (ReadBytes <> BitmapLength) then
    begin
      MessageBox(0, PChar('Error reading bitmap data'), PChar('BMP Unit'), MB_OK);
      Exit;
    end;
    CloseHandle(BitmapFile);
  end;

  // Bitmaps are stored BGR and not RGB, so swap the R and B bytes.
  for I := 0 to Width * Height - 1 do
  begin
    Front := Pointer(Integer(pData) + I * 3);
    Back := Pointer(Integer(pData) + I * 3 + 2);
    Temp := Front^;
    Front^ := Back^;
    Back^ := Temp;
  end;

  Texture := CreateTexture(Width, Height, GL_RGB, pData);
  FreeMem(pData);
  result := TRUE;
end;

//------------------------------------------------------------------------------

function LoadTexture(Filename: string; var Texture: GLuint; LoadFromRes: Boolean): Boolean;
begin
  Result := False;
  try
    if Uppercase(ExtractFileExt(filename)) = '.BMP' then
      LoadBMPTexture(Filename, Texture, LoadFromRes);
  finally
    Result := True;
  end;
end;

//------------------------------------------------------------------------------

end.

