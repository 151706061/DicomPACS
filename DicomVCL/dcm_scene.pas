unit dcm_scene;

{$I dcm_define.inc}
{.$I dx_scene.inc}
{.$DEFINE MOUSERAY}
{.$DEFINE DRAWFOCUSED}

interface

uses
  {$IFDEF LINUX}
  cairo, cairoXlib, xlib, x, xutil, gtk2def, gtk2proc, gtk2, gdk2, gdk2x, gdk2pixbuf, glib2, gtkglext,
  {$ENDIF}
  {$IFDEF DARWIN}
  macosall,
  CarbonProc, CarbonDef, CarbonPrivate, carboncanvas,
  {$ENDIF}
  {$IFDEF WINDOWS}
  Windows, Messages, ShellAPI, ActiveX, CommCtrl, MMSystem,
  {$ENDIF}
  {$IFDEF FPC}
  LCLProc, LCLIntf, LCLType, LMessages, LResources,
  {$ELSE}
  Imm,
  {$ENDIF}
  Classes, SysUtils, Forms, Controls, Dialogs, Graphics, ExtCtrls, Menus,
  dcm_vgcore;

{$HPPEMIT '#include <shldisp.h>'}

const

  WM_ADDUPDATERECT = WM_USER + 501;

  MaxMemoryStream = 4096 * 1024 * 2;
  MaxBitmapSize: integer = 2048;

  FloatCount: single = 0;
  IntCount: integer = 0;

type

  { Base }

  TdxColor = longword;

  PdxColorRec = ^TdxColorRec;
  TdxColorRec = packed record
    case longword of
      0: (Color: TdxColor);
      2: (HiWord, LoWord: Word);
      {$IFDEF  FPC_BIG_ENDIAN}
      3: (A, R, G, B: System.Byte);
      {$ELSE}
      3: (B, G, R, A: System.Byte);
      {$ENDIF}
  end;

  PdxColorRecArray = ^TdxColorRecArray;
  TdxColorRecArray = array[0..100] of TdxColorRec;

  PdxColorArray = ^TdxColorArray;
  TdxColorArray = array[0..0] of TdxColor;

  PdxColor24 = ^TdxColor24;
  TdxColor24 = packed record
    case longword of
      0: (R, G, B: Byte);
  end;

  PdxColor24Array = ^TdxColor24Array;
  TdxColor24Array = array[0..0] of TdxColor24;

  PdxColor32 = ^TdxColor32;
  TdxColor32 = packed record
    case longword of
      0: (R, G, B, A: Byte);
  end;

  PdxColor32Array = ^TdxColor32Array;
  TdxColor32Array = array[0..0] of TdxColor32;

  { Points and rects }

type

  TdxPoint2D = packed record
    X: single;
    Y: single;
  end;

  TdxPoint = packed record
    X: single;
    Y: single;
    Z: single;
  end;

  TdxBox = packed record
    Left, Top, Near, Right, Bottom, Far: single;
  end;

  { Vectors }

  TdxTexVectorType = array[0..1] of single;
  PdxTexVector = ^TdxTexVector;
  TdxTexVector = packed record
    case integer of
      0: (
        V: TdxTexVectorType;
        );
      1: (
        S: single;
        T: single;
        );
  end;

  PdxTexVectorArray = ^TdxTexVectorArray;
  TdxTexVectorArray = array[0..0] of TdxTexVector;

  TdxVectorType = array[0..3] of single;
  PdxVector = ^TdxVector;
  TdxVector = packed record
    case integer of
      0: (
        V: TdxVectorType;
        );
      1: (
        X: single;
        Y: single;
        Z: single;
        W: single;
        );
  end;

  PdxVector3 = ^TdxVector3;
  TdxVector3 = packed record
    X: single;
    Y: single;
    Z: single;
  end;

  PdxFace = ^TdxFace;
  TdxFace = packed record
    P1: TdxVector;
    P2: TdxVector;
    P3: TdxVector;
  end;

  TdxVectorInt = packed record
    X: integer;
    Y: integer;
    Z: integer;
    W: integer;
  end;

  PdxVectorArray = ^TdxVectorArray;
  TdxVectorArray = array[0..0 shr 2] of TdxVector;

  TdxMatrixArray = array[0..3] of TdxVector;
  TdxMatrix = packed record
    case integer of
      0: (
        M: TdxMatrixArray;
        );
      1: (m11, m12, m13, m14: single;
        m21, m22, m23, m24: single;
        m31, m32, m33, m34: single;
        m41, m42, m43, m44: single);
  end;

  TdxMatrix3 = packed record
    m11, m12, m13: single;
    m21, m22, m23: single;
    m31, m32, m33: single;
  end;

  TdxMatrixDouble = packed record
    m11, m12, m13, m14: double;
    m21, m22, m23, m24: double;
    m31, m32, m33, m34: double;
    m41, m42, m43, m44: double;
  end;

  PdxByteArray = ^TdxByteArray;
  TdxByteArray = array[0..MaxInt - 1] of Byte;

  PdxWordArray = ^TdxWordArray;
  TdxWordArray = array[0..0] of Word;

  PdxSingleArray = ^TdxSingleArray;
  TdxSingleArray = array[0..0] of single;

  PdxLongwordArray = ^TdxLongwordArray;
  TdxLongwordArray = array[0..0] of longword;

  TdxAABB = record
    min, max: TdxVector;
  end;

  TdxAABBCorners = array[0..7] of TdxVector;

  TdxBSphere = record
    Center: TdxVector;
    Radius: single;
  end;

  TdxFrustum = record
    pLeft, pTop, pRight, pBottom, pNear, pFar: TdxVector;
  end;

  TdxSpaceContains = (dxNoOverlap, dxContainsFully, dxContainsPartially);

  PdxQuaternion = ^TdxQuaternion;
  TdxQuaternion = record
    ImagPart: TdxVector;
    RealPart: single;
  end;

type

  { Verex format }

  TdxVertexFormat = (
    vfVertex,
    vfVertexNormal,
    vfTexVertexNormal,
    vfTexVertex,
    vfColorVertex,
    vfColorVertexNormal,
    vfColorTexVertex,
    vfColorTexVertexNormal,
    vfNone
    );

  { Vertexs }

  TdxVertex = packed record
    x, y, z: single;
  end;
  PdxVertex = ^TdxVertex;

  TdxVertexArray = array[0..100] of TdxVertex;
  PdxVertexArray = ^TdxVertexArray;

  TdxVertexNormal = packed record
    x, y, z: single;
    nx, ny, nz: single;
  end;
  PdxVertexNormal = ^TdxVertexNormal;

  TdxVertexNormalArray = array[0..0] of TdxVertexNormal;
  PxdVertexNormalArray = ^TdxVertexNormalArray;

  TdxTexVertexNormal = packed record
    x, y, z: single;
    nx, ny, nz: single;
    tu, tv: single;
  end;
  PdxTexVertexNormal = ^TdxTexVertexNormal;

  TdxTexVertexNormalArray = array[0..0] of TdxTexVertexNormal;
  PdxTexVertexNormalArray = ^TdxTexVertexNormalArray;

  TdxTexVertex = packed record
    x, y, z: single;
    tu, tv: single;
  end;
  PdxTexVertex = ^TdxTexVertex;

  TdxTexVertexArray = array[0..0] of TdxTexVertex;
  PdxTexVertexArray = ^TdxTexVertexArray;

  TdxColorVertex = packed record
    x, y, z: single;
    color: longword;
  end;
  PdxColorVertex = ^TdxColorVertex;

  TdxColorVertexArray = array[0..1000] of TdxColorVertex;
  PdxColorVertexArray = ^TdxColorVertexArray;

  TdxColorVertexNormal = packed record
    x, y, z: single;
    nx, ny, nz: single;
    color: longword;
  end;
  PdxColorVertexNormal = ^TdxColorVertexNormal;

  TdxColorVertexNormalArray = array[0..1000] of TdxColorVertexNormal;
  PdxColorVertexNormalArray = ^TdxColorVertexNormalArray;

  TdxColorTexVertex = packed record
    x, y, z: single;
    color: longword;
    tu, tv: single;
  end;
  PdxColorTexVertex = ^TdxColorTexVertex;

  TdxColorTexVertexArray = array[0..1000] of TdxColorTexVertex;
  PdxColorTexVertexArray = ^TdxColorTexVertexArray;

  TdxColorTexVertexNormal = packed record
    x, y, z: single;
    nx, ny, nz: single;
    color: longword;
    tu, tv: single;
  end;
  PdxColorTexVertexNormal = ^TdxColorTexVertexNormal;

  TdxColorTexVertexNormalArray = array[0..1000] of TdxColorTexVertexNormal;
  PdxColorTexVertexNormalArray = ^TdxColorTexVertexNormalArray;

const

  NullPoint: TdxPoint = (x: 0; y: 0);

  { TexPoints (2D space) }

  XTexPoint: TdxTexVector = (S: 1; T: 0);
  YTexPoint: TdxTexVector = (S: 0; T: 1);
  XYTexPoint: TdxTexVector = (S: 1; T: 1);
  NullTexPoint: TdxTexVector = (S: 0; T: 0);
  MidTexPoint: TdxTexVector = (S: 0.5; T: 0.5);

  { Null }

  NullTextVector: TdxTexVector = (S: 0.0; T: 0.0);
  NulldxVector: TdxVector = (X: 0.0; Y: 0.0; Z: 0.0; W: 0.0);

  { Matrixs }

  IdentityQuaternion: TdxQuaternion = (ImagPart: (X: 0; Y: 0; Z: 0; W: 0); RealPart: 1);

  IdentityMatrix: TdxMatrix = (m11: 1.0; m12: 0.0; m13: 0.0; m14: 0.0;
    m21: 0.0; m22: 1.0; m23: 0.0; m24: 0.0;
    m31: 0.0; m32: 0.0; m33: 1.0; m34: 0.0;
    m41: 0.0; m42: 0.0; m43: 0.0; m44: 1.0; );

  { Some usefull vectors }

  XHmgVector: TdxVector = (X: 1; Y: 0; Z: 0; W: 0);
  YHmgVector: TdxVector = (X: 0; Y: 1; Z: 0; W: 0);
  ZHmgVector: TdxVector = (X: 0; Y: 0; Z: 1; W: 0);
  WHmgVector: TdxVector = (X: 0; Y: 0; Z: 0; W: 1);
  XYHmgVector: TdxVector = (X: 1; Y: 1; Z: 0; W: 0);
  XYZHmgVector: TdxVector = (X: 1; Y: 1; Z: 1; W: 0);
  XYZWHmgVector: TdxVector = (X: 1; Y: 1; Z: 1; W: 1);
  NullHmgVector: TdxVector = (X: 0; Y: 0; Z: 0; W: 0);

  { some very small numbers }

  Epsilon: Single = 1E-40;

const
  cPI: Single = 3.141592654;
  cPIdiv180: Single = 0.017453292;
  c180divPI: Single = 57.29577951;
  c2PI: Single = 6.283185307;
  cPIdiv2: Single = 1.570796326;
  cPIdiv4: Single = 0.785398163;
  c3PIdiv4: Single = 2.35619449;
  cInv2PI: Single = 1 / 6.283185307;
  cInv360: Single = 1 / 360;
  c180: Single = 180;
  c360: Single = 360;
  cOneHalf: Single = 0.5;

  MinSingle = 1.5E-45;
  MaxSingle = 3.4E+38;

  ClosePolygon: TdxPoint = (X: $FFFF; Y: $FFFF; Z: $FFFF);

type

  TdxPolygon = array of TdxPoint;
  PdxPolygon = ^TdxPolygon;

type

  TdxCanvas = class;
  TdxScene = class;
  TdxObject = class;
  TdxVisualObject = class;
  TdxObjectClass = class of TdxObject;

  TdxPosition = class(TPersistent)
  private
    FOnChange: TNotifyEvent;
    FSave: TdxVector;
    FY: single;
    FX: single;
    FZ: single;
    FDefaultValue: TdxPoint;
    FOnChangeY: TNotifyEvent;
    FOnChangeX: TNotifyEvent;
    FOnChangeZ: TNotifyEvent;
    procedure SetPoint(const Value: TdxPoint);
    procedure SetX(const Value: single);
    procedure SetY(const Value: single);
    procedure SetZ(const Value: single);
    function GetPoint: TdxPoint;
    function GetVector: TdxVector;
    procedure SetVector(const Value: TdxVector);
  protected
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadPoint(Reader: TReader);
    procedure WritePoint(Writer: TWriter);
  public
    constructor Create(const ADefaultValue: TdxPoint); virtual;
    procedure Assign(Source: TPersistent); override;
    procedure SetPointNoChange(const P: TdxPoint);
    procedure SetVectorNoChange(const P: TdxVector);
    function Empty: boolean;
    property Point: TdxPoint read GetPoint write SetPoint;
    property Vector: TdxVector read GetVector write SetVector;
    property DefaultValue: TdxPoint read FDefaultValue write FDefaultValue;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnChangeX: TNotifyEvent read FOnChangeX write FOnChangeX;
    property OnChangeY: TNotifyEvent read FOnChangeY write FOnChangeY;
    property OnChangeZ: TNotifyEvent read FOnChangeZ write FOnChangeZ;
  published
    property X: single read FX write SetX stored false;
    property Y: single read FY write SetY stored false;
    property Z: single read FZ write SetZ stored false;
  end;

  TdxBounds = class(TPersistent)
  private
    FRight: single;
    FBottom: single;
    FTop: single;
    FLeft: single;
    FOnChange: TNotifyEvent;
    FNear: single;
    FFar: single;
    procedure SetBottom(const Value: single);
    procedure SetLeft(const Value: single);
    procedure SetRight(const Value: single);
    procedure SetTop(const Value: single);
    procedure SetFar(const Value: single);
    procedure SetNear(const Value: single);
  protected
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadRect(Reader: TReader);
    procedure WriteRect(Writer: TWriter);
    procedure ReadNewRect(Reader: TReader);
    procedure WriteNewRect(Writer: TWriter);
  public
    constructor Create; virtual;
    procedure Assign(Source: TPersistent); override;
    function MarginEmpty: boolean;
    function Width: single;
    function Height: single;
    function Depth: single;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  published
    property left: single read FLeft write SetLeft stored false;
    property top: single read FTop write SetTop stored false;
    property znear: single read FNear write SetNear stored false;
    property right: single read FRight write SetRight stored false;
    property bottom: single read FBottom write SetBottom stored false;
    property zfar: single read FFar write SetFar stored false;
  end;

  TdxBitmapRect = class(TPersistent)
  private
    FRight: single;
    FBottom: single;
    FTop: single;
    FLeft: single;
    FOnChange: TNotifyEvent;
    procedure SetBottom(const Value: single);
    procedure SetLeft(const Value: single);
    procedure SetRight(const Value: single);
    procedure SetTop(const Value: single);
  protected
  public
    constructor Create(); virtual;
    procedure Assign(Source: TPersistent); override;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    function empty: boolean;
  published
    property left: single read FLeft write SetLeft;
    property top: single read FTop write SetTop;
    property right: single read FRight write SetRight;
    property bottom: single read FBottom write SetBottom;
  end;

  TdxTransform = class(TPersistent)
  private
    FMatrix: TdxMatrix;
    FRotateAngle: single;
    FPosition: TdxPosition;
    FScale: TdxPosition;
    FSkew: TdxPosition;
    FRotateCenter: TdxPosition;
    FOnChanged: TNotifyEvent;
  protected
    procedure MatrixChanged(Sender: TObject);
    property Skew: TdxPosition read FSkew write FSkew;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    property Matrix: TdxMatrix read FMatrix;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
  published
    property Position: TdxPosition read FPosition write FPosition;
    property Scale: TdxPosition read FScale write FScale;
    property RotateCenter: TdxPosition read FRotateCenter write FRotateCenter;
  end;

  { TdxBitmap }

  TdxBitmap = class(TPersistent)
  private
    FBits: PdxColorArray;
    FCanvas: TdxCanvas;
    FHeight: integer;
    FWidth: integer;
    FHandle: cardinal;
    FNeedUpdate: boolean;
    FLocked: boolean;
    FCanvasList: TList;
    FOnChange: TNotifyEvent;
    function GetCanvas: TdxCanvas;
    procedure SetHeight(const Value: integer);
    procedure SetWidth(const Value: integer);
  protected
    { internal }
    procedure Recreate;
    { vcl }
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadBitmap(Stream: TStream);
    procedure WriteBitmap(Stream: TStream);
    procedure AssignTo(Dest: TPersistent); override;
  public
    Handle: cardinal;
    constructor Create(const AWidth, AHeight: integer); virtual;
    constructor CreateFromStream(const AStream: TStream); virtual;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure SetSize(const AWidth, AHeight: integer);
    procedure Clear(const AColor: TdxColor = 0);
    procedure ClearRect(const ARect: TvxRect; const AColor: TdxColor = 0);
    function LockBitmapBits(var Bits: PdxColorArray; const Write: boolean): boolean;
    procedure UnlockBitmapBits;
    procedure SetCanvas(ACanvas: TdxCanvas);
    procedure FillAlpha(const AAlpha: byte = $FF);
    { I/O }
    procedure LoadFromFile(const AFileName: string; const Rotate: single = 0);
    procedure LoadThumbnailFromFile(const AFileName: string; const AFitWidth, AFitHeight: single;
      const UseEmbedded: boolean = true);
    procedure SaveToFile(const AFileName: string; const Params: string = '');
    procedure LoadFromStream(const AStream: TStream);
    procedure SaveToStream(const AStream: TStream);
    { props }
    property Canvas: TdxCanvas read GetCanvas;
    property Width: integer read FWidth write SetWidth;
    property Height: integer read FHeight write SetHeight;
    { internal usae only }
    property Bits: PdxColorArray read FBits;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property CanvasList: TList read FCanvasList;
    property NeedUpdate: boolean read FNeedUpdate write FNeedUpdate;
  published
  end;

  TdxFilter = class(TPersistent)
  private
  public
  published
    class function GetFileTypes: string; virtual;
    class function GetImageSize(const AFileName: string): TdxPoint; virtual;
    function LoadFromFile(const AFileName: string; const Rotate: single; var Bitmap: TdxBitmap): boolean; virtual; abstract;
    function LoadThumbnailFromFile(const AFileName: string; const AFitWidth, AFitHeight: single; const UseEmbedded: boolean;
      var Bitmap: TdxBitmap): boolean; virtual; abstract;
    function SaveToFile(const AFileName: string; var Bitmap: TdxBitmap; const Params: string = ''): boolean; virtual; abstract;
    function LoadFromStream(const AStream: TStream; var Bitmap: TdxBitmap): boolean; virtual; abstract;
    { Format is a string from "jpeg,png,bmp" }
    function SaveToStream(const AStream: TStream; var Bitmap: TdxBitmap; const Format: string;
      const Params: string = ''): boolean; virtual; abstract;
  end;
  TdxFilterClass = class of TdxFilter;

  TdxMeshData = class(TPersistent)
  private
    FNeedUpdate: boolean;
    FHandle: cardinal;
    FOnDestroyHandle: TNotifyEvent;
    FOnChanged: TNotifyEvent;
    function GetNormals: AnsiString;
    function GetPoints: AnsiString;
    function GetTexCoordinates: AnsiString;
    procedure SetNormals(const Value: AnsiString);
    procedure SetPoints(const Value: AnsiString);
    procedure SetTexCoordinates(const Value: AnsiString);
    function GetTriangleIndices: AnsiString;
    procedure SetTriangleIndices(const Value: AnsiString);
  protected
    procedure Assign(Source: TPersistent); override;
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadMesh(Stream: TStream);
    procedure WriteMesh(Stream: TStream);
  public
    MeshVertices: array of TdxTexVertexNormal;
    MeshIndices: array of word;
    constructor Create; virtual;
    destructor Destroy; override;
    procedure CalcNormals;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
    { internal usage only }
    property Handle: cardinal read FHandle write FHandle;
    property NeedUpdate: boolean read FNeedUpdate write FNeedUpdate;
    property OnDestroyHandle: TNotifyEvent read FOnDestroyHandle write FOnDestroyHandle;
  published
    property Normals: AnsiString read GetNormals write SetNormals stored false;
    property Points: AnsiString read GetPoints write SetPoints stored false;
    property TexCoordinates: AnsiString read GetTexCoordinates write SetTexCoordinates stored false;
    property TriangleIndices: AnsiString read GetTriangleIndices write SetTriangleIndices stored false;
  end;

  TdxTexMode = (
    dxTexModulate,
    dxTexReplace
    );

  TdxShadeMode = (
    dxFlat,
    dxGouraud
    );

  TdxFillMode = (
    dxSolid,
    dxWireframe
    );

  TdxMaterial = class(TPersistent)
  private
    FOnChanged: TNotifyEvent;
    FAmbient: TdxColor;
    FBitmap: string;
    FModulation: TdxTexMode;
    FLighting: boolean;
    FTempBitmap: TdxBitmap;
    FShadeMode: TdxShadeMode;
    FFillMode: TdxFillMode;
    FBitmapTile, FBitmapTileY: single;
    FBitmapRect: TdxBitmapRect;
    procedure SetBitmap(const Value: string);
    procedure SetTempBitmap(const Value: TdxBitmap);
    procedure SetDiffuse(const Value: string);
    function GetDiffuse: string;
    function GetAmbient: string;
    procedure SetAmbient(const Value: string);
    function GetBitmap: TdxBitmap;
    procedure SetModulation(const Value: TdxTexMode);
    procedure SetLighting(const Value: boolean);
    procedure SetNativeDiffuse(const Value: TdxColor);
    procedure SetShadeMode(const Value: TdxShadeMode);
    procedure SetFillMode(const Value: TdxFillMode);
    procedure SetNativeAmbient(const Value: TdxColor);
    procedure SetBitmapTile(const Value: single);
    procedure SetBitmapTileY(const Value: single);
    procedure SetBitmapRect(const Value: TdxBitmapRect);
  protected
    FDiffuse: TdxColor;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
    property NativeAmbient: TdxColor read FAmbient write SetNativeAmbient;
    property NativeDiffuse: TdxColor read FDiffuse write SetNativeDiffuse;
    property NativeBitmap: TdxBitmap read GetBitmap;
    property TempBitmap: TdxBitmap read FTempBitmap write SetTempBitmap;
  published
    property Diffuse: string read GetDiffuse write SetDiffuse;
    property Ambient: string read GetAmbient write SetAmbient;
    property Lighting: boolean read FLighting write SetLighting default true;
    property Bitmap: string read FBitmap write SetBitmap;
    property BitmapMode: TdxTexMode read FModulation write SetModulation;
    property BitmapTileX: single read FBitmapTile write SetBitmapTile;
    property BitmapTileY: single read FBitmapTileY write SetBitmapTileY;
    property BitmapRect: TdxBitmapRect read FBitmapRect write SetBitmapRect;
    property FillMode: TdxFillMode read FFillMode write SetFillMode;
    property ShadeMode: TdxShadeMode read FShadeMode write SetShadeMode default dxGouraud;
  end;

  TdxFontStyle = (
    dxFontRegular,
    dxFontBold,
    dxFontItalic,
    dxFontBoldItalic
    );

  TdxFont = class(TPersistent)
  private
    FSize: single;
    FFamily: string;
    FStyle: TdxFontStyle;
    FOnChanged: TNotifyEvent;
    procedure SetFamily(const Value: string);
    procedure SetSize(const Value: single);
    procedure SetStyle(const Value: TdxFontStyle);
    function isFamilyStored: Boolean;
    function isSizeStored: Boolean;
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
  published
    property Family: string read FFamily write SetFamily stored isFamilyStored;
    property Size: single read FSize write SetSize stored isSizeStored;
    property Style: TdxFontStyle read FStyle write SetStyle;
  end;

  TdxTextAlign = (
    dxTextAlignCenter,
    dxTextAlignNear,
    dxTextAlignFar
    );

  TdxRenderState = (
    rs2DScene,
    rs3DScene,
    rsLightOn,
    rsLightOff,
    rsZTestOn,
    rsZTestOff,
    rsZWriteOn,
    rsZWriteOff,
    { Faces }
    rsFrontFace,
    rsBackFace,
    rsAllFace,
    { Blending }
    rsBlendAdditive,
    rsBlendNormal,
    { Tex stretch }
    rsTexNearest,
    rsTexLinear,
    { Tex modulation }
    rsTexDisable,
    rsTexReplace,
    rsTexModulate,
    { fill mode }
    rsFrame,
    rsSolid,
    { shade mode }
    rsFlat,
    rsGouraud
    );

  TdxCamera = class;
  TdxLight = class;
  TdxDummy = class;

  TdxProjection = (
    dxProjectionCamera,
    dxProjectionScreen
    );

  TdxQuality = (
    dxLowQuality,
    dxHighQuality,
    dxSuperHighQuality
    );

  TdxCanvas = class(TPersistent)
  private
    FLighting: boolean;
    FAmbient: TdxColor;
    FMaterial: TdxMaterial;
    FFont: TdxFont;
    procedure SetMaterial(const M: TdxMaterial);
  protected
    FWidth, FHeight: integer;
    FBitmap: TdxBitmap;
    FWnd: cardinal;
    FScene: TdxScene;
    FLockable: boolean;
    FQuality: TdxQuality;
    { textures }
    FBitmaps: TList;
    FHandles: TList;
    { }
    FBuffered: boolean;
    {$IFDEF WINDOWS}
    FBufferDC: Cardinal;
    FBufferBits: Pointer;
    FBufferHandle: cardinal;
    FBitmapInfo: TBitmapInfo;
    {$ENDIF}
    {$IFDEF DARWIN}
    FBufferBits: Pointer;
    FBufferHandle: CGContextRef;
    {$ENDIF}
    {$IFDEF LINUX}
    FBufferBits: Pointer;
    FBufferHandle: Pointer;
    {$ENDIF}
    { States }
    FRenderStates: array[TdxRenderState] of THandle;
    FChangeStateCount: integer;
    FCurrentBitmap: array[0..8] of TdxBitmap;
    FCurrentVertexFormat: TdxVertexFormat;
    FCurrentStates: array[TdxRenderState] of boolean;
    FCurrentCamera: TdxCamera;
    FCurrentCameraMatrix: TdxMatrix;
    FCurrentCameraInvMatrix: TdxMatrix;
    FCurrentMatrix: TdxMatrix;
    FCurrentLights: TList;
    { paintto }
    FPaintToMatrix: TdxMatrix;
    { save }
    FSaveStates: array[TdxRenderState] of boolean;
    FSaveMatrix: TdxMatrix;
    procedure MaterialChanged(Sender: TObject); virtual;
    procedure CreateRenderStateList(AState: TdxRenderState); virtual; abstract;
    procedure ApplyRenderState(AState: TdxRenderState); virtual; abstract;
    function GetProjectionMatrix: TdxMatrix; virtual;
    function GetScreenMatrix: TdxMatrix; virtual;
    { Textures }
    procedure UpdateBitmap(Bitmap: TdxBitmap); virtual;
    procedure AddHandle(const Bitmap: TdxBitmap; const Handle: cardinal);
    procedure ChangeHandle(const Bitmap: TdxBitmap; const Handle: cardinal);
    procedure RemoveHandle(const Bitmap: TdxBitmap);
    function GetHandle(const Bitmap: TdxBitmap): cardinal;
    procedure DestroyBitmap(const Bitmap: TdxBitmap); virtual; abstract;
    { VCL }
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create(const AWnd: cardinal; const AWidth, AHeight: integer; const ALockable: boolean; const Quality: TdxQuality); virtual;
    constructor CreateFromBitmap(const ABitmap: TdxBitmap); virtual;
    destructor Destroy; override;
    procedure SetQuality(const Quality: TdxQuality); virtual;
    { i/o }
    procedure SaveToStream(S: TStream);
    procedure SaveToBits(Bits: Pointer);
    { buffer }
    procedure Reset;
    function BeginScene: boolean; virtual;
    procedure FlushBuffer; virtual;
    procedure FreeBuffer; virtual;
    procedure ResizeBuffer(const AWidth, AHeight: integer); virtual;
    procedure Clear(const AColor: TdxColor); virtual; abstract;
    procedure ClearARGB(const AWidth, AHeight: integer; const Bits: PdxColorArray); virtual; abstract;
    procedure CopyBits(const Bits: PdxColorArray); virtual; abstract;
    { matrix & state }
    procedure SetMatrix(const M: TdxMatrix); virtual;
    procedure SetCamera(const Camera: TdxCamera); virtual;
    procedure SetLight(const Light: TdxLight); virtual;
    procedure SetRenderState(const State: TdxRenderState); virtual;
    { drawing }
    procedure DrawLine(const StartPoint, EndPoint: TdxVector; const Opacity: single); virtual; abstract;
    procedure DrawRect(const StartPoint, EndPoint: TdxVector; const Opacity: single); virtual; abstract;
    procedure DrawCube(const Center, Size: TdxVector; const Opacity: single); virtual; abstract;
    procedure FillCube(const Center, Size: TdxVector; const Opacity: single); virtual; abstract;
    procedure FillMesh(const Center, Size: TdxVector; const MeshData: TdxMeshData; const Opacity: single); virtual; abstract;
    procedure FillColorTexVertexNormal(const Vertices: array of TdxColorTexVertexNormal;
      const Indices: array of word; const Opacity: single); virtual; abstract;
    { pseudo 2D }
    procedure FillPolygon(const Center, Size: TdxVector; const Rect: TvxRect; const Points: TvxPolygon; const Opacity: single;
      Front: boolean = true; Back: boolean = true; Left: boolean = true); virtual; abstract;
    procedure FillRect(const Rect: TvxRect; const Depth, Opacity: single);
    { text }
    procedure DrawText(const AX, AY: single; const AText: WideString; const Opacity: single); virtual; abstract;
    function MeasureText(const AText: WideString): TdxPoint; virtual; abstract;
    { pick }
    procedure Pick(x, y: single; const AProj: TdxProjection; var RayPos, RayDir: TdxVector);
    function WorldToScreen(const AProj: TdxProjection; const P: TdxPoint): TdxPoint;
    { help }
    procedure SetMaterialWithOpacity(M: TdxMaterial; Opacity: single);
    { props }
    property Height: integer read FHeight;
    property Width: integer read FWidth;
    property Material: TdxMaterial read FMaterial write SetMaterial;
    property Font: TdxFont read FFont write FFont;
    property Ambient: TdxColor read FAmbient write FAmbient;
    property Lighting: boolean read FLighting write FLighting;
    property CurrentMatrix: TdxMatrix read FCurrentMatrix;
    property CurrentCamera: TdxCamera read FCurrentCamera;
    property CurrentCameraMatrix: TdxMatrix read FCurrentCameraMatrix;
    property CurrentCameraInvMatrix: TdxMatrix read FCurrentCameraInvMatrix;
    { internal usage }
    property Bitmap: TdxBitmap read FBitmap;
  published
  end;
  TdxCanvasClass = class of TdxCanvas;

  TdxPhysics = class(TPersistent)
  private
  protected
    FSpaceWorld: Integer;
    FScreenWorld: Integer;
    FScene: TdxScene;
  public
    constructor Create(const Scene: TdxScene); virtual;
    destructor Destroy; override;
    { Worlds }
    function CreateWorld: Integer; virtual; abstract;
    procedure DestroyWorld(const AWorld: Integer); virtual; abstract;
    procedure UpdateWorld(const AWorld: Integer; const DeltaTime: single); virtual; abstract;
    { Collision }
    function Collise(const AOwner: TdxVisualObject; var AList: TList): integer; virtual; abstract;
    function ComplexCollise(const AOwner: TdxVisualObject; var AList: TList): integer; virtual; abstract;
    { Objects }
    function ObjectByBody(const Body: Integer): TdxVisualObject; virtual; abstract;
    function CreateBox(const AOwner: TdxVisualObject;
      const ASize: TdxVector): Integer; virtual; abstract;
    function CreateSphere(const AOwner: TdxVisualObject;
      const ASize: TdxVector): Integer; virtual; abstract;
    function CreateCone(const AOwner: TdxVisualObject;
      const ASize: TdxVector): Integer; virtual; abstract;
    function CreateCylinder(const AOwner: TdxVisualObject;
      const ASize: TdxVector): Integer; virtual; abstract;
    procedure DestroyBody(var ABody: integer); virtual; abstract;
    { Callbacks }
    procedure SetBodyMatrix(const Body: Integer; const M: TdxMatrix); virtual; abstract;
    function GetBodyMatrix(const Body: Integer): TdxMatrix; virtual; abstract;
    { Actions }
    procedure AddForce(const AOwner: TdxVisualObject; const Force: TdxVector); virtual; abstract;
    procedure Explode(const AWorld: Integer; const Position: TdxVector; const Radius, Force: single); virtual; abstract;
    procedure Wind(const AWorld: Integer; const Dir: TdxVector; const Force: single); virtual; abstract;
    { Worlds }
    property ScreenWorld: Integer read FScreenWorld;
    property SpaceWorld: Integer read FSpaceWorld;
  end;
  TdxPhysicsClass = class of TdxPhysics;

  TdxMouseEvent = procedure(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: single; rayPos, rayDir: TdxVector) of object;
  TdxMouseMoveEvent = procedure(Sender: TObject; Shift: TShiftState;
    X, Y: single; rayPos, rayDir: TdxVector) of object;
  TdxMouseWheelEvent = procedure(Sender: TObject; Shift: TShiftState;
    WheelDelta: Integer; MousePos: TdxPoint; var Handled: Boolean) of object;

  TdxKeyEvent = procedure(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState) of object;
  TdxProcessTickEvent = procedure(Sender: TObject; time, deltaTime: single) of object;

  TdxObject = class(TComponent)
  private
    FParent: TdxObject;
    FScene: TdxScene;
    FStored: boolean;
    FResourceName: string;
    FTagFloat: single;
    FTagString: string;
    FTagObject: TObject;
    FOnTick: TdxProcessTickEvent;
    procedure UpdateChildScene;
    procedure ReaderSetName(Reader: TReader; Component: TComponent;
      var Name: string);
    procedure ReaderError(Reader: TReader; const Message: string;
      var Handled: Boolean);
    function GetChild(Index: integer): TdxObject;
    function GetChildrenCount: integer;
  protected
    FDisableEffect: boolean;
    { VCL }
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    procedure SetParentComponent(Value: TComponent); override;
    function GetParentComponent: TComponent; override;
    function HasParent: Boolean; override;
    { }
    procedure SetParent(const Value: TdxObject); virtual;
    { ani }
    procedure DoAniFinished(Sender: TObject);
    procedure SetResourceName(const Value: string); virtual;
  public
    FChildren: TList;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { clone }
    function Clone(const AOwner: TComponent): TdxObject;
    procedure CloneChildFromStream(AStream: TStream);
    { realtime }
    procedure ProcessTick(time, deltaTime: single); virtual;
    { childs  }
    procedure AddObject(AObject: TdxObject); virtual;
    procedure RemoveObject(AObject: TdxObject); virtual;
    procedure DeleteChildren; virtual;
    procedure BringToFront;
    procedure SendToBack;
    procedure AddObjectsToList(const AList: TList); virtual;
    function FindObject(const AClass: TdxObjectClass): TdxObject;
    { i/o }
    procedure LoadFromStream(const AStream: TStream);
    procedure SaveToStream(const Stream: TStream);
    procedure LoadFromBinStream(const AStream: TStream);
    procedure SaveToBinStream(const AStream: TStream);
    { resoruce }
    function FindResource(const AResource: string): TdxObject;
    { animations }
    procedure StartAnimation(const AName: WideString); virtual;
    procedure StopAnimation(const AName: WideString); virtual;
    procedure StartTriggerAnimation(AInstance: TdxObject; ATrigger: string); virtual;
    procedure StopTriggerAnimation(AInstance: TdxObject); virtual;
    { animation property }
    procedure AnimateFloat(const APropertyName: string; const NewValue: single; Duration: single = 0.2;
      AType: TvxAnimationType = vgAnimationIn; AInterpolation: TvxInterpolationType = vgInterpolationLinear);
    procedure AnimateColor(const APropertyName: string; const NewValue: string; Duration: single = 0.2;
      AType: TvxAnimationType = vgAnimationIn; AInterpolation: TvxInterpolationType = vgInterpolationLinear);
    procedure AnimateFloatWait(const APropertyName: string; const NewValue: single; Duration: single = 0.2;
      AType: TvxAnimationType = vgAnimationIn; AInterpolation: TvxInterpolationType = vgInterpolationLinear);
    procedure AnimateColorWait(const APropertyName: string; const NewValue: string; Duration: single = 0.2;
      AType: TvxAnimationType = vgAnimationIn; AInterpolation: TvxInterpolationType = vgInterpolationLinear);
    procedure AnimateStop(const APropertyName: string);
    { }
    function IsVisual: boolean;
    function Visual: TdxVisualObject;
    property Scene: TdxScene read FScene;
    property Stored: boolean read FStored write FStored;
    { }
    property TagObject: TObject read FTagObject write FTagObject;
    property TagFloat: single read FTagFloat write FTagFloat;
    property TagString: string read FTagString write FTagString;
    { children }
    property ChildrenCount: integer read GetChildrenCount;
    property Children[Index: integer]: TdxObject read GetChild;
  published
    property Parent: TdxObject read FParent write SetParent stored false;
    property ResourceName: string read FResourceName write SetResourceName;
    property OnTick: TdxProcessTickEvent read FOnTick write FOnTick;
  end;

  TdxBitmapObject = class(TdxObject)
  private
    FBitmap: TdxBitmap;
    procedure SetBitmap(const Value: TdxBitmap);
  protected
    procedure SetName(const NewName: TComponentName); override;
    procedure SetResourceName(const Value: string); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Bitmap: TdxBitmap read FBitmap write SetBitmap;
  end;

  TdxAnimation = class(TdxObject)
  private
    FDuration: single;
    FDelay, FDelayTime: single;
    FInverse: boolean;
    FTrigger: string;
    FLoop: boolean;
    FPause: boolean;
    FOnFinish: TNotifyEvent;
    FInterpolation: TvxInterpolationType;
    FAnimationType: TvxAnimationType;
    FEnabled, FLoadEnabled: boolean;
    FAutoReverse: boolean;
    procedure SetEnabled(const Value: boolean);
  protected
    FRunning: boolean;
    FTime: single;
    function NormalizedTime: single;
    procedure ProcessAnimation; virtual;
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ProcessTick(time, deltaTime: single); override;
    procedure Start; virtual;
    procedure Stop; virtual;
    procedure StartTrigger(AInstance: TdxObject; ATrigger: string); virtual;
    property Pause: boolean read FPause write FPause;
  published
    property AnimationType: TvxAnimationType read FAnimationType write FAnimationType default vgAnimationIn;
    property AutoReverse: boolean read FAutoReverse write FAutoReverse default false;
    property Duration: single read FDuration write FDuration;
    property Delay: single read FDelay write FDelay;
    property Enabled: boolean read FEnabled write SetEnabled default false;
    property Interpolation: TvxInterpolationType read FInterpolation write FInterpolation default vgInterpolationLinear;
    property Inverse: boolean read FInverse write FInverse;
    property Loop: boolean read FLoop write FLoop;
    property Trigger: string read FTrigger write FTrigger;
    property OnFinish: TNotifyEvent read FOnFinish write FOnFinish;
  end;

  TdxAlign = (
    dxNone,
    dxScale,
    dxContents,
    dxTopLeft,
    dxTopRight,
    dxBottomLeft,
    dxBottomRight,
    dxTop,
    dxLeft,
    dxRight,
    dxBottom,
    dxMostLeft,
    dxMostRight,
    dxClient,
    dxCenter,
    dxVertCenter,
    dxHorzCenter,
    dxHorizontal,
    dxVertical
    );

  TdxCollisionEvent = procedure(Sender: TObject; CollisionObject: TdxVisualObject; Point, Normal: TdxVector) of object;
  TdxPaintEvent = procedure(Sender: TObject; const Canvas: TdxCanvas) of object;

  TdxDragMode = (
    dxDragManual,
    dxDragAutomatic
    );

  TdxDragObject = record
    Source: TObject;
    Files: array of WideString;
    Data: Variant;
  end;

  TdxDragEnterEvent = procedure(Sender: TObject; const Data: TdxDragObject; const Point: TdxPoint) of object;
  TdxDragOverEvent = procedure(Sender: TObject; const Data: TdxDragObject; const Point: TdxPoint; var Accept: Boolean) of object;
  TdxDragDropEvent = procedure(Sender: TObject; const Data: TdxDragObject; const Point: TdxPoint) of object;
  TdxDragLeaveEvent = procedure(Sender: TObject) of object;

  TdxVisualObject = class(TdxObject)
  private
    FVisible: boolean;
    FOnMouseUp: TdxMouseEvent;
    FOnMouseDown: TdxMouseEvent;
    FOnMouseMove: TdxMouseMoveEvent;
    FOnMouseWheel: TdxMouseWheelEvent;
    FOnClick: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FMouseInObject: boolean;
    FHitTest: boolean;
    FClipChildren: boolean;
    FAutoCapture: boolean;
    FAlign: TdxAlign;
    FLocked: boolean;
    FTempCanvas: TdxCanvas;
    FPosition: TdxPosition;
    FQuaternion: TdxQuaternion;
    FRotateAngle: TdxPosition;
    FScale: TdxPosition;
    FSkew: TdxPosition;
    FCanFocused: boolean;
    FIsMouseOver: boolean;
    FIsFocused: boolean;
    FRotateCenter: TdxPosition;
    FZWrite: boolean;
    FProjection: TdxProjection;
    FVelocity: TdxPosition;
    FDynamic: boolean;
    FCollider: boolean;
    FColliseTrack: boolean;
    FOnCollision: TdxCollisionEvent;
    FMargins: TdxBounds;
    FPadding: TdxBounds;
    FOnKeyUp: TdxKeyEvent;
    FOnKeyDown: TdxKeyEvent;
    FOnPaint, FOnBeforePaint: TdxPaintEvent;
    FDesignHide: boolean;
    FTwoSide: boolean;
    FDragMode: TdxDragMode;
    FDragDisableHighlight: boolean;
    FOnDragEnter: TdxDragEnterEvent;
    FOnDragDrop: TdxDragDropEvent;
    FOnDragEnd: TNotifyEvent;
    FOnDragLeave: TdxDragLeaveEvent;
    FOnDragOver: TdxDragOverEvent;
    FIsDragOver: boolean;
    FShowHint: boolean;
    FHint: WideString;
    FPopupMenu: TPopupMenu;
    FPressed, FDoubleClick: boolean;
    FCursor, FLoadCursor: TCursor;
    FShowContextMenu: boolean;
    function GetInvertAbsoluteMatrix: TdxMatrix;
    procedure SetHitTest(const Value: boolean);
    procedure SetClipChildren(const Value: boolean);
    function CheckHitTest(const AHitTest: boolean): boolean;
    procedure SetAlign(const Value: TdxAlign);
    function GetCanvas: TdxCanvas;
    procedure SetLocked(const Value: boolean);
    procedure SetTempCanvas(const Value: TdxCanvas);
    procedure SetOpacity(const Value: single);
    function isOpacityStored: Boolean;
    function GetAbsolutePosition: TdxVector;
    function GetAbsoluteUp: TdxVector;
    function GetAbsoluteDirection: TdxVector;
    function GetAbsoluteRight: TdxVector;
    procedure SetAbsolutePosition(Value: TdxVector);
    function GetScreenBounds: TvxRect;
    procedure ReadQuaternion(Reader: TReader);
    procedure WriteQuaternion(Writer: TWriter);
    procedure SetZWrite(const Value: boolean);
    procedure SetProjection(const Value: TdxProjection);
    procedure SetCollider(const Value: boolean);
    procedure SetDynamic(const Value: boolean);
    procedure SetDesignHide(const Value: boolean);
    procedure MarginsChanged(Sender: TObject);
    procedure PaddingChanged(Sender: TObject);
  protected
    FHeight, FLastHeight: single;
    FWidth, FLastWidth: single;
    FDepth, FLastDepth: single;
    FLocalMatrix: TdxMatrix;
    FAbsoluteMatrix: TdxMatrix;
    FRecalcAbsolute: boolean;
    FDisableAlign: boolean;
    FCanResize, FCanRotate: boolean;
    FBody: integer;
    FDesignInteract: boolean;
    FOpacity, FAbsoluteOpacity: single;
    FRecalcOpacity: boolean;
    procedure Loaded; override;
    procedure DefineProperties(Filer: TFiler); override;
    { props }
    procedure SetVisible(const Value: boolean); virtual;
    procedure SetHeight(const Value: single); virtual;
    procedure SetWidth(const Value: single); virtual;
    procedure SetDepth(const Value: single); virtual;
    { matrix }
    function GetAbsoluteMatrix: TdxMatrix; virtual;
    { opacity }
    function GetAbsoluteOpacity: single; virtual;
    procedure RecalcOpacity; virtual;
    { design }
    procedure DesignSelect; virtual;
    procedure DesignClick; virtual;
    { events }
    procedure Capture;
    procedure ReleaseCapture;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: single; rayPos, rayDir: TdxVector); virtual;
    procedure MouseMove(Shift: TShiftState; X, Y, Dx, Dy: single; rayPos, rayDir: TdxVector); virtual;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: single; rayPos, rayDir: TdxVector); virtual;
    procedure MouseWheel(Shift: TShiftState; WheelDelta: integer; var Handled: boolean); virtual;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); virtual;
    procedure KeyUp(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); virtual;
    procedure MouseEnter; virtual;
    procedure MouseLeave; virtual;
    procedure EnterFocus; virtual;
    procedure KillFocus; virtual;
    procedure Click; virtual;
    procedure DblClick; virtual;
    procedure ContextMenu(const ScreenPosition: TvxPoint); virtual;
    procedure DragEnter(const Data: TdxDragObject; const Point: TdxPoint); virtual;
    procedure DragOver(const Data: TdxDragObject; const Point: TdxPoint; var Accept: Boolean); virtual;
    procedure DragDrop(const Data: TdxDragObject; const Point: TdxPoint); virtual;
    procedure DragLeave; virtual;
    procedure DragEnd; virtual;
    function DoHintShow(var Message: {$IFDEF FPC}TLMessage{$ELSE}TMessage{$ENDIF}): boolean; virtual;
    { control resources }
    procedure ApplyResource; virtual;
    { paint }
    procedure PreRender; virtual;
    procedure BeforePaint; virtual;
    procedure AfterPaint; virtual;
    procedure Paint; virtual;
    procedure PaintChildren; virtual;
    { changes }
    procedure MatrixChanged(Sender: TObject); virtual;
    procedure RotateXChanged(Sender: TObject); virtual;
    procedure RotateYChanged(Sender: TObject); virtual;
    procedure RotateZChanged(Sender: TObject); virtual;
    { props }
    property MouseInObject: boolean read FMouseInObject write FMouseInObject;
    property Skew: TdxPosition read FSkew write FSkew;
    property TempCanvas: TdxCanvas read FTempCanvas write SetTempCanvas;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { Calculate best fit size using AWidth and AHeight, create TdxBitmap object and render to this bitmap.
      Multisampling not supported in render to texture. }
    procedure PaintToBitmap(ABitmap: TdxBitmap; AWidth, AHeight: integer; ClearColor: TdxColor);
    procedure PaintToVxBitmap(ABitmap: TvxBitmap; AWidth, AHeight: integer; ClearColor: TdxColor; AutoFit: boolean = false);
    { Create SuperSampled object's snapshot using tile-rendering and interpolation. Quality can be 1..16 }
    procedure CreateHighQualitySnapshot(ABitmap: TvxBitmap; AWidth, AHeight: integer; ClearColor: TdxColor; Quality: integer);
    { Create tile-part of snaphot. Tiles can be merge. }
    procedure CreateTileSnapshot(ABitmap: TdxBitmap; AWidth, AHeight, OffsetX, OffsetY: integer; Scale: single; ClearColor: TdxColor);
    { matrix }
    procedure RecalcAbsolute; virtual;
    function AbsoluteToLocal(P: TdxPoint): TdxPoint; virtual;
    function LocalToAbsolute(P: TdxPoint): TdxPoint; virtual;
    function AbsoluteToLocalVector(P: TdxVector): TdxVector; virtual;
    function LocalToAbsoluteVector(P: TdxVector): TdxVector; virtual;
    function ObjectByPoint(X, Y: single; AProjection: TdxProjection; var Distance: single): TdxVisualObject;
    function RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean; virtual;
    procedure ResetRotateAngle;
    { drag and drop }
    function FindTarget(const APoint: TdxPoint; AProjection: TdxProjection; const Data: TdxDragObject; var Distance: single): TdxVisualObject;
    { realtime }
    procedure ProcessTick(time, deltaTime: single); override;
    { physics }
    procedure Back;
    procedure Collision(CollisionObject: TdxVisualObject; Point, Normal: TdxVector); virtual;
    procedure CreateBody; virtual;
    procedure DestroyBody; virtual;
    procedure RecreateBody;
    procedure Spawn; virtual;
    procedure AddForce(const Force: TdxVector);
    { focus }
    procedure GetTabOrderList(const AList: TList); virtual;
    { align }
    procedure Realign; virtual;
    procedure RealignLayers;
    { }
    procedure SetFocus;
    procedure Repaint;
    procedure Lock;
    property AbsoluteMatrix: TdxMatrix read GetAbsoluteMatrix;
    property LocalMatrix: TdxMatrix read FLocalMatrix;
    property AbsolutePosition: TdxVector read GetAbsolutePosition write SetAbsolutePosition;
    property AbsoluteUp: TdxVector read GetAbsoluteUp;
    property AbsoluteDirection: TdxVector read GetAbsoluteDirection;
    property AbsoluteRight: TdxVector read GetAbsoluteRight;
    property AbsoluteOpacity: single read GetAbsoluteOpacity;
    property InvertAbsoluteMatrix: TdxMatrix read GetInvertAbsoluteMatrix;
    property Canvas: TdxCanvas read GetCanvas;
    property DesignInteract: boolean read FDesignInteract;
    property Projection: TdxProjection read FProjection write SetProjection;
    property AutoCapture: boolean read FAutoCapture write FAutoCapture default false;
    property RotateCenter: TdxPosition read FRotateCenter write FRotateCenter;
    property ScreenBounds: TvxRect read GetScreenBounds;
    { custom properties }
    property Align: TdxAlign read FAlign write SetAlign;
    { dynamics }
    property Body: integer read FBody;
    property Collider: boolean read FCollider write SetCollider;
    property ColliseTrack: boolean read FColliseTrack write FColliseTrack;
    property Dynamic: boolean read FDynamic write SetDynamic;
    property Velocity: TdxPosition read FVelocity write FVelocity;
    { aligns }
    property Margins: TdxBounds read FMargins write FMargins;
    property Padding: TdxBounds read FPadding write FPadding;
    property CanFocused: boolean read FCanFocused write FCanFocused;
  published
    { triggers }
    property IsDragOver: boolean read FIsDragOver;
    property IsMouseOver: boolean read FIsMouseOver;
    property IsFocused: boolean read FIsFocused;
    property IsVisible: boolean read FVisible;
    { props }
    property Cursor: TCursor read FCursor write FCursor default crDefault;
    property DragMode: TdxDragMode read FDragMode write FDragMode;
    property DragDisableHighlight: boolean read FDragDisableHighlight write FDragDisableHighlight;
    property Position: TdxPosition read FPosition write FPosition;
    property Scale: TdxPosition read FScale write FScale;
    property RotateAngle: TdxPosition read FRotateAngle write FRotateAngle;
    property Locked: boolean read FLocked write SetLocked;
    property Width: single read FWidth write SetWidth;
    property Height: single read FHeight write SetHeight;
    property Depth: single read FDepth write SetDepth;
    property DesignHide: boolean read FDesignHide write SetDesignHide;
    property Opacity: single read FOpacity write SetOpacity stored isOpacityStored;
    property HitTest: boolean read FHitTest write SetHitTest default true;
    property Hint: WideString read FHint write FHint;
    property ShowHint: boolean read FShowHint write FShowHint default false;
    property ShowContextMenu: boolean read FShowContextMenu write FShowContextMenu default true;
    property TwoSide: boolean read FTwoSide write FTwoSide default false;
    property Visible: boolean read FVisible write SetVisible default true;
    property ZWrite: boolean read FZWrite write SetZWrite default true;
    property OnDragEnter: TdxDragEnterEvent read FOnDragEnter write FOnDragEnter;
    property OnDragLeave: TdxDragLeaveEvent read FOnDragLeave write FOnDragLeave;
    property OnDragOver: TdxDragOverEvent read FOnDragOver write FOnDragOver;
    property OnDragDrop: TdxDragDropEvent read FOnDragDrop write FOnDragDrop;
    property OnDragEnd: TNotifyEvent read FOnDragEnd write FOnDragEnd;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnMouseDown: TdxMouseEvent read FOnMouseDown write FOnMouseDown;
    property OnMouseMove: TdxMouseMoveEvent read FOnMouseMove write FOnMouseMove;
    property OnMouseUp: TdxMouseEvent read FOnMouseUp write FOnMouseUp;
    property OnMouseWheel: TdxMouseWheelEvent read FOnMouseWheel write FOnMouseWheel;
    property OnKeyDown: TdxKeyEvent read FOnKeyDown write FOnKeyDown;
    property OnKeyUp: TdxKeyEvent read FOnKeyUp write FOnKeyUp;
    property OnBeforePaint: TdxPaintEvent read FOnBeforePaint write FOnBeforePaint;
    property OnPaint: TdxPaintEvent read FOnPaint write FOnPaint;
    property OnCollision: TdxCollisionEvent read FOnCollision write FOnCollision;
  end;

  TdxCamera = class(TdxVisualObject)
  private
    FSaveCamera: TdxCamera;
    FTarget: TdxVisualObject;
    procedure SetTarget(const Value: TdxVisualObject);
  protected
    procedure Paint; override;
    procedure DesignClick; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean; override;
  published
    property HitTest default false;
    property Target: TdxVisualObject read FTarget write SetTarget;
  end;

  TdxLightType = (
    dxLightDirectional,
    dxLightPoint,
    dxLightSpot
    );

  TdxLight = class(TdxVisualObject)
  private
    FEnabled: boolean;
    FLightType: TdxLightType;
    procedure SetLightType(const Value: TdxLightType);
  protected
    procedure PreRender; override;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean; override;
  published
    property HitTest default false;
    property Enabled: boolean read FEnabled write FEnabled default true;
    property LightType: TdxLightType read FLightType write SetLightType;
  end;

  TdxDummy = class(TdxVisualObject)
  private
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean; override;
  published
    property Align;
    property Body;
    property Collider;
    property ColliseTrack;
    property Dynamic;
    property Velocity;
    property Margins;
    property Padding;
    property HitTest default false;
  end;

  TdxProxyObject = class(TdxVisualObject)
  private
    FSourceObject: TdxVisualObject;
    procedure SetSourceObject(const Value: TdxVisualObject);
  protected
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean; override;
  published
    property Align;
    property Body;
    property Collider;
    property ColliseTrack;
    property Dynamic;
    property Velocity;
    property Margins;
    property Padding;
    property SourceObject: TdxVisualObject read FSourceObject write SetSourceObject;
  end;

  TdxLayerAlign = (
    dxLayerNone,
    dxLayerTop,
    dxLayerLeft,
    dxLayerRight,
    dxLayerBottom,
    dxLayerMostTop,
    dxLayerMostBottom,
    dxLayerMostLeft,
    dxLayerMostRight,
    dxLayerClient,
    dxLayerCenter,
    dxLayerContents
    );

  TdxCustomLayer = class(TdxVisualObject)
  private
    FOnLayerMouseMove: TMouseMoveEvent;
    FOnLayerMouseDown: TMouseEvent;
    FOnLayerMouseUp: TMouseEvent;
    FLayerAlign: TdxLayerAlign;
    FDisableLayerEvent: boolean;
    procedure SetLayerAlign(const Value: TdxLayerAlign);
  protected
    procedure BeforePaint; override;
    procedure Paint; override;
    procedure SetDepth(const Value: single); override;
    procedure SetWidth(const Value: single); override;
    procedure SetHeight(const Value: single); override;
    procedure LayerMouseMove(Shift: TShiftState; X, Y: single); virtual;
    procedure LayerMouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: single); virtual;
    procedure LayerMouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: single); virtual;
    procedure MouseMove(Shift: TShiftState; X, Y, Dx, Dy: single; rayPos, rayDir: TdxVector); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: single; rayPos, rayDir: TdxVector); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: single; rayPos, rayDir: TdxVector); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean; override;
    property LayerAlign: TdxLayerAlign read FLayerAlign write SetLayerAlign;
  published
    property OnLayerMouseMove: TMouseMoveEvent read FOnLayerMouseMove write FOnLayerMouseMove;
    property OnLayerMouseDown: TMouseEvent read FOnLayerMouseDown write FOnLayerMouseDown;
    property OnLayerMouseUp: TMouseEvent read FOnLayerMouseUp write FOnLayerMouseUp;
  end;

  TdxCustomBufferLayer = class(TdxCustomLayer)
  private
    FResolution: integer;
    FModulationColor: TdxColor;
    FOnUpdateBuffer: TNotifyEvent;
    function GetModulationColor: string;
    procedure SetModulationColor(const Value: string);
    procedure SetResolution(const Value: integer);
  protected
    FBuffer: TdxBitmap;
    FPlane: TdxMeshData;
    FPlaneScreen: TdxMeshData;
    FLayerHeight: integer;
    FLayerWidth: integer;
    procedure BeforePaint; override;
    procedure Paint; override;
    procedure SetDepth(const Value: single); override;
    procedure SetWidth(const Value: single); override;
    procedure SetHeight(const Value: single); override;
    procedure MouseMove(Shift: TShiftState; X, Y, Dx, Dy: single; rayPos, rayDir: TdxVector); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: single; rayPos, rayDir: TdxVector); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: single; rayPos, rayDir: TdxVector); override;
    function GetBitmap: TdxBitmap; virtual;
    procedure SetName(const NewName: TComponentName); override;
    property OnUpdateBuffer: TNotifyEvent read FOnUpdateBuffer write FOnUpdateBuffer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TdxVector;
      var Intersection: TdxVector): boolean; override;
    property LayerWidth: integer read FLayerWidth;
    property LayerHeight: integer read FLayerHeight;
    property Buffer: TdxBitmap read FBuffer;
    property Resolution: integer read FResolution write SetResolution;
  published
    property ModulationColor: string read GetModulationColor write SetModulationColor;
  end;

  TdxBufferLayer = class(TdxCustomBufferLayer)
  private
  protected
  public
  published
    property OnUpdateBuffer;
    property Resolution;
  end;

  { TdxScene }

  TdxScene = class(TCustomControl{$IFDEF WINDOWS}, IDropTarget{$ENDIF})
  private
    {$IFDEF FPCWIN}
    PrevWndProc: WNDPROC;
    FWStyle: string;
    {$ENDIF}
    {$IFDEF FPC}
    FShift: TShiftState;
    {$ENDIF}
    FCanvas: TdxCanvas;
    FDisableUpdate: boolean;
    FChildren: TList;
    FDesignRoot, FSelected, FCaptured, FHovered, FFocused: TdxVisualObject;
    FSelection: array of TdxObject;
    FDesignGridLines: array of TdxVisualObject;
    FDesignPopup: TPopupMenu;
    FUnsnapMousePos, FMousePos, FDownPos: TdxPoint;
    FMoving, FLeftFar, FRightTop, FRotateY, FRotateX, FRotateZ: boolean;
    FV1, FV2: TdxVector; // helpvector
    FResizeSize: TPoint;
    FDragging, FResizing: boolean;
    FDesignTime: boolean;
    FTransparency: boolean;
    FAllowDrag: boolean;
    FSnapToGrid: boolean;
    FSnapToLines: boolean;
    FSnapGridShow: boolean;
    FSnapGridSize: single;
    FDesignShowHint: boolean;
    FDesignAllowPanAndRotate: boolean;
    FInsertObject: string;
    FAlignRoot: boolean;
    FPopupPos: TPoint;
    FCloneFrame: TForm;
    FDrawing: boolean;
    FDrawingUpdateRect: array of TvxRect;
    FCamera: TdxCamera;
    FDesignGrid: TdxVisualObject;
    FDesignCamera: TdxCamera;
    FDesignCameraZ: TdxDummy;
    FDesignCameraX: TdxDummy;
    FFill: TdxColor;
    FLighting: boolean;
    FAmbient: TdxColor;
    FQuality: TdxQuality;
    FBlendedList: TList;
    FRealTime: boolean;
    FRenderTime, FRenderCount, FFps, FTime, FDeltaTime: single;
    FPhysics: TdxPhysics;
    FRealTimeSleep: integer;
    FInvisibleAtRuntime: boolean;
    FOnFlush: TNotifyEvent;
    FDesignHide: boolean;
    FDisableDraw: boolean;
    FDisableLayerAlign: boolean;
    FUsingDesignCamera: boolean;
    FShowTimer: TTimer;
    FLoadCursor: TCursor;
    FActiveControl: TdxVisualObject;
    {$IFDEF WINDOWS}
    function GetDataObject: TdxDragObject;
    function DragEnter(const dataObj: IDataObject; grfKeyState: {$IFDEF FPC}DWORD{$ELSE}Longint{$ENDIF};
      pt: TPoint; var dwEffect: {$IFDEF FPC}DWORD{$ELSE}Longint{$ENDIF}): HResult; stdcall;
    function DragOver(grfKeyState: {$IFDEF FPC}DWORD{$ELSE}Longint{$ENDIF}; pt: TPoint;
      var dwEffect: {$IFDEF FPC}DWORD{$ELSE}Longint{$ENDIF}): HResult; stdcall;
    function DragLeave: HResult; stdcall;
    function Drop(const dataObj: IDataObject; grfKeyState: {$IFDEF FPC}DWORD{$ELSE}Longint{$ENDIF}; pt: TPoint;
      var dwEffect: {$IFDEF FPC}DWORD{$ELSE}Longint{$ENDIF}): HResult; stdcall;
    procedure WMAddUpdateRect(var Msg: TMessage); message WM_ADDUPDATERECT;
    procedure WMEraseBkgnd(var Msg: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure WMPaint(var Msg: TWMPaint); message WM_PAINT;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    {$ENDIF}
    {$IFNDEF FPC}
    procedure WMGetDlgCode(var Msg: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
    procedure WMKeyUp(var Message: TWMKeyUp); message WM_KEYUP;
    procedure WMChar(var Message: TWMChar); message WM_CHAR;
    procedure WMImeStartComposition(var Message: TMessage); message WM_IME_STARTCOMPOSITION;
    procedure WMImeComposition(var Message: TMessage); message WM_IME_COMPOSITION;
    {$ENDIF}
    {$IFDEF linux}
    procedure Invalidate; override;
    procedure EraseBackground(DC: HDC); override;
    {$ENDIF}
    procedure CMDesignHitTest(var Msg: {$IFDEF FPC}TLMMouse{$ELSE}TCMDesignHitTest{$ENDIF}); message CM_DESIGNHITTEST;
    procedure CMHintShow(var Message: {$IFDEF FPC}TLMessage{$ELSE}TMessage{$ENDIF}); message CM_HINTSHOW;
    procedure UpdateLayer;
    function GetCount: integer;
    procedure SetChildren(Index: integer; const Value: TdxObject);
    function GetChildrenObject(Index: integer): TdxObject;
    procedure SetSnapGridShow(const Value: boolean);
    procedure SetAllowPanAndRotate(const Value: boolean);
    procedure SetDesignHintShow(const Value: boolean);
    function SnapToGridValue(Value: single): single;
    procedure SetSnapGridSize(const Value: single);
    procedure SnapToGridLines(AllowChangePosition: boolean);
    function SnapPointToGridLines(const APoint: TdxPoint): TdxPoint;
    procedure ReadDesignCameraPos(Reader: TReader);
    procedure ReadDesignCameraZAngle(Reader: TReader);
    procedure ReadDesignCameraXAngle(Reader: TReader);
    procedure WriteDesignCameraPos(Writer: TWriter);
    procedure WriteDesignCameraXAngle(Writer: TWriter);
    procedure WriteDesignCameraZAngle(Writer: TWriter);
    procedure ReadDesignSnapGridShow(Reader: TReader);
    procedure WriteDesignSnapGridShow(Writer: TWriter);
    procedure ReadDesignShowHint(Reader: TReader);
    procedure WriteDesignShowHint(Writer: TWriter);
    procedure ReadDesignSnapToGrid(Reader: TReader);
    procedure WriteDesignSnapToGrid(Writer: TWriter);
    procedure ReadDesignSnapToLines(Reader: TReader);
    procedure WriteDesignSnapToLines(Writer: TWriter);
    { design }
    procedure OpenDesignPopup;
    procedure doDesignPopupShowHint(Sender: TObject);
    procedure doDesignPopupShowGrid(Sender: TObject);
    procedure doDesignPopupLoadFromFile(Sender: TObject);
    procedure doDesignPopupAdd(Sender: TObject);
    procedure doDesignPopupDesignHide(Sender: TObject);
    procedure doDesignPasteFromClip(Sender: TObject);
    procedure doDesignPopupReorder(Sender: TObject);
    procedure doDesignPopupDel(Sender: TObject);
    procedure doDesignPopupCopy(Sender: TObject);
    procedure popupMeasureItem(Sender: TObject; ACanvas: TCanvas; var Width,
      Height: Integer);
    procedure popupDrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    function GetRoot: TdxObject;
    procedure SetFocused(const Value: TdxVisualObject);
    procedure DoDesignSelect(AObject: TObject);
    procedure SetFill(const Value: string);
    procedure SetAmbient(const Value: string);
    procedure SetQuality(const Value: TdxQuality);
    procedure SetRealTime(const Value: boolean);
    function GetFill: string;
    function GetAmbient: string;
    procedure SetActiveControl(AControl: TdxVisualObject);
    procedure SetSelected(Value: TdxVisualObject);
  protected
    procedure BeginVCLDrag(Source: TObject);
    procedure EndDragEvent(Sender, Target: TObject; X, Y: Integer);
    procedure DoIdle(Sender: TObject; var Done: Boolean);
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateHandle; override;
    {$IFDEF WINDOWS}
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    {$ENDIF}
    procedure Loaded; override;
    procedure Resize; override;
    procedure Paint; override;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure DefineProperties(Filer: TFiler); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure NewKeyUp(var Key: Word; var Char: System.WideChar; Shift: TShiftState);
    procedure NewKeyDown(var Key: Word; var Char: System.WideChar; Shift: TShiftState);
    procedure DoDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState;
      var Accept: Boolean);
    procedure DoDragDrop(Sender, Source: TObject;
      X, Y: Integer);
    {$IFDEF FPC}
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure UTF8KeyPress(var UTF8Key: TUTF8Char); override;
    {$ENDIF}
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
      MousePos: TPoint): Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DeleteChildren;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
    procedure Draw; virtual;
    property Canvas: TdxCanvas read FCanvas write FCanvas;
    { }
    function ObjectByPoint(X, Y: single): TdxVisualObject;
    { children }
    procedure AddObject(AObject: TdxObject);
    procedure RemoveObject(AObject: TdxObject);
    { realtime }
    procedure ProcessTick;
    { physics }
    procedure CreatePhysics;
    { optimization }
    procedure BeginUpdate;
    procedure EndUpdate;
    { managment }
    procedure BeginDrag;
    procedure BeginResize;
    { paint }
    procedure AddUpdateRect(const R: TvxRect);
    { design }
    procedure InsertObject(const ClassName: string);
    { design }
    property DesignTime: boolean read FDesignTime write FDesignTime stored false;
    { }
    property Count: integer read GetCount;
    property Root: TdxObject read GetRoot;
    property Children[Index: integer]: TdxObject read GetChildrenObject write SetChildren;
    property Selected: TdxVisualObject read FSelected write SetSelected;
    property Captured: TdxVisualObject read FCaptured;
    property Hovered: TdxVisualObject read FHovered;
    property Focused: TdxVisualObject read FFocused write SetFocused;
    property Physics: TdxPhysics read FPhysics;
    property Time: single read FTime;
    property DeltaTime: single read FDeltaTime;
    property Fps: single read FFps;
    property IsDrawing: boolean read FDrawing;
    { use as emebbded }
    procedure CreateEmbedded(const AWidth, AHeight: integer; AOnFlush: TNotifyEvent);
    procedure EmbeddedMouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure EmbeddedMouseMove(Shift: TShiftState; X, Y: Integer);
    procedure EmbeddedMouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    function EmbeddedMouseWheel(Shift: TShiftState; WheelDelta: Integer): Boolean;
    procedure EmbeddedKeyUp(var Key: Word; var Char: System.WideChar; Shift: TShiftState);
    procedure EmbeddedKeyDown(var Key: Word; var Char: System.WideChar; Shift: TShiftState);
    property OnFlush: TNotifyEvent read FOnFlush write FOnFlush;
    { design }
    property DesignAllowPanAndRotate: boolean read FDesignAllowPanAndRotate write SetAllowPanAndRotate;
    property DesignGridShow: boolean read FSnapGridShow write SetSnapGridShow;
    property DesignShowHint: boolean read FDesignShowHint write SetDesignHintShow;
    property DesignSnapToGrid: boolean read FSnapToGrid write FSnapToGrid;
    property DesignSnapGridSize: single read FSnapGridSize write SetSnapGridSize;
    property DesignSnapToLines: boolean read FSnapToLines write FSnapToLines;
  published
    property Align;
    property AlignRoot: boolean read FAlignRoot write FAlignRoot default true;
    property AllowDrag: boolean read FAllowDrag write FAllowDrag default false;
    property ActiveControl: TdxVisualObject read FActiveControl write SetActiveControl;
    property Lighting: boolean read FLighting write FLighting default true;
    property Quality: TdxQuality read FQuality write SetQuality;
    property FillColor: string read GetFill write SetFill;
    property AmbientColor: string read GetAmbient write SetAmbient;
    property Camera: TdxCamera read FCamera write FCamera;
    property Transparency: boolean read FTransparency write FTransparency default false;
    property RealTime: boolean read FRealTime write SetRealTime default false;
    property RealTimeSleep: integer read FRealTimeSleep write FRealTimeSleep;
    property InvisibleAtRuntime: boolean read FInvisibleAtRuntime write FInvisibleAtRuntime default false;
    property UsingDesignCamera: boolean read FUsingDesignCamera write FUsingDesignCamera default true;
    property TabStop;
    property OnMouseMove;
    property OnMouseDown;
    property OnMouseUp;
    property OnMouseWheel;
  end;

  TdxBitmapCollection = class;
  TdxBitmapList = class;

  { TdxBitmapStream }

  TdxBitmapStream = class(TCollectionItem)
  private
    FBitmap: TdxBitmap;
    FName: string;
    procedure SetBitmap(const Value: TdxBitmap);
    procedure SetName(const Value: string);
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    procedure Assign(Source: TPersistent); override;
    destructor Destroy; override;
  published
    property Bitmap: TdxBitmap read FBitmap write SetBitmap;
    property Name: string read FName write SetName;
  end;

  { TdxBitmapCollection }

  TdxBitmapCollection = class(TCollection)
  private
    FBitmapList: TdxBitmapList;
  protected
  public
    constructor Create(AOwner: TdxBitmapList);
    destructor Destroy; override;
  published
  end;

  { TdxBitmapList class }

  TdxBitmapList = class(TComponent)
  private
    FBitmaps: TdxBitmapCollection;
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Bitmaps: TdxBitmapCollection read FBitmaps write FBitmaps;
  end;

  TOnDesignSelect = procedure(AObject: TObject) of object;

  TdxDesigner = class(TComponent)
  private
    FScenes: TList;
  protected
    procedure CallDesignSelect(AObject: TObject);
  public
    procedure SelectObject(ADesigner: TComponent; AObject: TdxObject; MultiSelection: array of TdxObject); virtual; abstract;
    procedure Modified(ADesigner: TComponent); virtual; abstract;
    function UniqueName(ADesigner: TComponent; ClassName: string): string; virtual; abstract;
    function IsSelected(ADesigner: TComponent; const AObject: TObject): boolean; virtual; abstract;
    procedure AddScene(const Scene: TdxScene); virtual;
    procedure RemoveScene(const Scene: TdxScene); virtual;
  end;

var
  dxDesigner: TdxDesigner;
  DefaultCanvasClass: TdxCanvasClass;
  DefaultFilterClass: TdxFilterClass;
  DefaultPhysicsClass: TdxPhysicsClass;

var
  ObjectList: TStringList;
  BitmapList: TStringList;

var
  DefaultStyles: TdxObject;

procedure RegisterVGObject(const Category: string; const AObject: TdxObjectClass);
procedure RegisterDXObjects(const Category: string; AClasses: array of TdxObjectClass);

function GetBitmapByName(const Name: string): TdxBitmap;
function GetBitmapParent(const Name: string): TObject;

function CreateObjectFromStream(AOwner: TComponent; const AStream: TStream): TdxObject;

{ Resoruces }

procedure AddResource(const AObject: TdxObject);
procedure RemoveResource(const AObject: TdxObject);
function FindResource(const AResource: string): TdxObject;

implementation {===============================================================}

uses
  clipbrd, math, typinfo,
  {$IFDEF windows}
  dcm_directx,
  {$ENDIF}
  {$IFDEF darwin}
  dx_opengl,
  {$ENDIF}
  {$IFDEF linux}
  dx_opengl,
  {$ENDIF}
  dcm_utils,
  dcm_ani,
  dcm_objects, dcm_vglayer; //, dx_resource, dx_physics_newton, dx_textbox, dx_controls;

type
  TParentControl = class(TWinControl);

var
  User32Lib: THandle;
  DXSceneTarget: TdxVisualObject = nil;

var
  RotateGripDist: single = 1.8;
  GripSize: single = 0.18;

procedure RegisterVGObject(const Category: string; const AObject: TdxObjectClass);
begin
  if ObjectList = nil then
    ObjectList := TStringList.Create;
  ObjectList.InsertObject(0, Category, TObject(AObject));
end;

procedure RegisterDXObjects(const Category: string; AClasses: array of TdxObjectClass);
var
  I: Integer;
begin
  for I := Low(AClasses) to High(AClasses) do
  begin
    RegisterVGObject(Category, AClasses[I]);
    RegisterClass(AClasses[I]);
  end;
end;

function GetBitmapByName(const Name: string): TdxBitmap;
var
  Idx: integer;
begin
  if (BitmapList <> nil) and (Name <> '') then
  begin
    Idx := BitmapList.IndexOf(Name);
    if Idx >= 0 then
    begin
      if TObject(BitmapList.Objects[Idx]) is TdxBitmapStream then
        Result := TdxBitmapStream(BitmapList.Objects[Idx]).Bitmap
      else
        if TObject(BitmapList.Objects[Idx]) is TdxBitmapObject then
        Result := TdxBitmapObject(BitmapList.Objects[Idx]).Bitmap
      else
        if TObject(BitmapList.Objects[Idx]) is TdxCustomBufferLayer then
        Result := TdxCustomBufferLayer(BitmapList.Objects[Idx]).Buffer
    end
    else
      Result := nil;
  end
  else
    Result := nil;
end;

function GetBitmapParent(const Name: string): TObject;
var
  Idx: integer;
begin
  if (BitmapList <> nil) and (Name <> '') then
  begin
    Idx := BitmapList.IndexOf(Name);
    if Idx >= 0 then
    begin
      if TObject(BitmapList.Objects[Idx]) is TdxBitmapStream then
        Result := TdxBitmapCollection(TdxBitmapStream(BitmapList.Objects[Idx]).Collection).FBitmapList
      else
        if TObject(BitmapList.Objects[Idx]) is TdxBitmapObject then
        Result := TdxBitmapObject(BitmapList.Objects[Idx]).Scene
      else
        if TObject(BitmapList.Objects[Idx]) is TdxCustomBufferLayer then
        Result := TdxCustomBufferLayer(BitmapList.Objects[Idx]).Scene
    end
    else
      Result := nil;
  end
  else
    Result := nil;
end;

{ Resoruces }

var
  ResourceList: TList;

procedure AddResource(const AObject: TdxObject);
begin
  if ResourceList = nil then
    ResourceList := TList.Create;
  ResourceList.Add(AObject);
end;

procedure RemoveResource(const AObject: TdxObject);
begin
  if ResourceList <> nil then
    ResourceList.Remove(AObject);
end;

function FindResource(const AResource: string): TdxObject;
var
  i: integer;
begin
  Result := nil;
  if ResourceList <> nil then
    for i := 0 to ResourceList.Count - 1 do
      if CompareText(TdxObject(ResourceList[i]).ResourceName, AResource) = 0 then
      begin
        Result := TdxObject(ResourceList[i]);
        Break;
      end;
end;

function CreateObjectFromStream(AOwner: TComponent; const AStream: TStream): TdxObject;
var
  Reader: TReader;
  SavePos: Longint;
  I: Integer;
  Flags: TFilerFlags;
  ClassName: string;
  ObjClass: TdxObjectClass;
  BinStream: TStream;
begin
  Result := nil;
  try
    BinStream := TMemoryStream.Create;
    try
      ObjectTextToBinary(AStream, BinStream);
      BinStream.Position := 0;

      Reader := TReader.Create(BinStream, 4096);
      {$IFDEF FPC}
      Reader.Driver.BeginRootComponent;
      ClassName := Reader.Driver.ReadStr;
      {$ELSE}
      Reader.ReadSignature;
      Reader.ReadPrefix(Flags, I);
      ClassName := Reader.ReadStr;
      {$ENDIF}

      ObjClass := TdxObjectClass(GetClass(ClassName));
      Result := ObjClass.Create(AOwner);
      if Result <> nil then
      begin
        BinStream.Position := 0;
        Result.LoadFromBinStream(BinStream);
      end;
      Reader.Free;
    finally
      BinStream.Free;
    end;
  except
    Result := nil;
  end;
end;

{}

{$IFDEF WINDOWS}
type

  PBlendFunction = ^TBlendFunction;
  _BLENDFUNCTION = packed record
    BlendOp: BYTE;
    BlendFlags: BYTE;
    SourceConstantAlpha: BYTE;
    AlphaFormat: BYTE;
  end;
  TBlendFunction = _BLENDFUNCTION;
  BLENDFUNCTION = _BLENDFUNCTION;

const

  WS_EX_LAYERED = $00080000;
  LWA_COLORKEY = $00000001;
  LWA_ALPHA = $00000002;
  ULW_COLORKEY = $00000001;
  ULW_ALPHA = $00000002;
  ULW_OPAQUE = $00000004;

var
  SetLayeredWindowAttributes: function(hwnd: HWND; crKey: COLORREF; bAlpha: BYTE;
    dwFlags: DWORD): BOOL; stdcall;
  UpdateLayeredWindow: function(hWnd: HWND; hdcDst: HDC; pptDst: PPOINT;
    psize: PSIZE; hdcSrc: HDC; pptSrc: PPOINT; crKey: COLORREF;
    pblend: PBlendFunction; dwFlags: DWORD): BOOL; stdcall;
  PrintWindow: function(hwnd: HWND; hdcBlt: HDC; nFlags: DWORD): BOOL; stdcall;
  {$ENDIF}

  {$IFDEF DARWIN}

function WndEventHandler(inHandlerCallRef: EventHandlerCallRef;
  inEvent: EventRef;
  inUserData: Pointer): OSStatus; stdcall;
var
  myContext: CGContextRef;
  myRect: CGRect;
  rgnCode: WindowRegionCode;
  rgn: RgnHandle;
begin
  Result := CallNextEventHandler(inHandlerCallRef, inEvent);
  Result := eventNotHandledErr;
  if GetEventClass(inEvent) = kEventClassControl then
  begin
    case GetEventKind(inEvent) of
      kEventControlDraw:
        begin
          GetEventParameter(inEvent, kEventParamCGContextRef, typeCGContextRef, nil,
            sizeof(CGContextRef), nil, @myContext);
          if myContext <> nil then
          begin
            myRect.origin.x := 0;
            myRect.origin.y := 0;
            myRect.size.width := 10000;
            myRect.size.height := 10000;
            CGContextClearRect(myContext, myRect);
          end;
          Result := noErr;
        end;
    end;
  end;
  if GetEventClass(inEvent) = kEventClassWindow then
  begin
    case GetEventKind(inEvent) of
      kEventWindowGetRegion:
        begin
          //          TdxScene(inUserData).Invalidate;
                    // which region code is being queried?
          GetEventParameter(inEvent, kEventParamWindowRegionCode, typeWindowRegionCode, nil, sizeof(rgnCode), nil, @rgnCode);
          // if it is the opaque region code then set the region to Empty and return noErr to stop the propagation
          if (rgnCode = kWindowOpaqueRgn) then
          begin
            GetEventParameter(inEvent, kEventParamRgnHandle, typeQDRgnHandle, nil, sizeof(rgn), nil, @rgn);
            SetEmptyRgn(rgn);
            Result := noErr;
          end;
          Result := noErr;
        end;
    end;
  end;
end;

function CreateFileURLFromPasteboard(inPasteboard: PasteboardRef): TdxDragObject;
var
  inIndex: CFIndex;
  inCount: ItemCount;
  item: PasteboardItemID;
  fileURL: CFURLRef;
  fileURLData: CFDataRef;
  info: LSItemInfoRecord;
  uti: CFStringRef;
begin
  Fillchar(Result, sizeOf(Result), 0);

  if PasteboardGetItemCount(inPasteboard, inCount) <> noErr then
    Exit;
  SetLength(Result.Files, inCount);
  for inIndex := 1 to inCount do
  begin
    if PasteboardGetItemIdentifier(inPasteboard, inIndex, item) <> noErr then
      Exit;
    if PasteboardCopyItemFlavorData(inPasteboard, item, kUTTypeFileURL, fileURLData) <> noErr then
      Exit;

    // create the file URL with the dragged data
    fileURL := CFURLCreateAbsoluteURLWithBytes(kCFAllocatorDefault, CFDataGetBytePtr(fileURLData), CFDataGetLength(fileURLData), kCFStringEncodingMacRoman, nil, true);
    if fileURL <> nil then
    begin
      uti := CFURLCopyFileSystemPath(fileURL, kCFURLPOSIXPathStyle);
      Result.Files[inIndex - 1] := CFStringToStr(uti);
      CFRelease(uti);
      CFRelease(fileURL);
    end;
    CFRelease(fileURLData);

    if inIndex = 1 then
      Result.Data := Result.Files[inIndex - 1];
  end;
end;

function CtrlEventHandler(inHandlerCallRef: EventHandlerCallRef;
  inEvent: EventRef;
  inUserData: Pointer): OSStatus; stdcall;
var
  myContext: CGContextRef;
  myRect: CGRect;
  rgn: RgnHandle;
  proc: RegionToRectsUPP;
  err: OSStatus;
  Part: ControlPartCode;
  drag: DragRef;
  pasteboard: PasteboardRef;
  str: string;
  mouseP: MacOSAll.Point;
  P: TdxPoint;
  NewTarget: TdxVisualObject;
  Data: TdxDragObject;
  Accept: boolean;
  Distace: single;
  bool: longbool;
begin
  Result := CallNextEventHandler(inHandlerCallRef, inEvent);
  Result := eventNotHandledErr;
  if GetEventClass(inEvent) = kEventClassControl then
  begin
    case GetEventKind(inEvent) of
      kEventControlDraw:
        begin
          GetEventParameter(inEvent, kEventParamCGContextRef, typeCGContextRef, nil,
            sizeof(CGContextRef), nil, @myContext);
          if myContext <> nil then
          begin
            myRect.origin.x := 0;
            myRect.origin.y := 0;
            myRect.size.width := 10000;
            myRect.size.height := 10000;
            CGContextClearRect(myContext, myRect);
          end;
          Result := noErr;
        end;
      kEventControlDragEnter:
        begin
          bool := true;
          SetEventParameter(inEvent, kEventParamControlWouldAcceptDrop, typeBoolean, sizeof(bool), @bool);
          DXSceneTarget := nil;
          Result := noErr;
        end;
      kEventControlDragWithin:
        begin
          GetEventParameter(inEvent, kEventParamDragRef, typeDragRef, nil, sizeof(DragRef), nil, @drag);
          if drag <> nil then
          begin
            GetDragPasteboard(drag, pasteboard);
            if pasteboard <> nil then
            begin
              if TdxScene(inUserData).Root = nil then
                Exit;

              Data := CreateFileURLFromPasteboard(pasteboard);

              GetDragMouse(drag, mouseP, mouseP);
              with TdxScene(inUserData).ScreenToClient(Point(mouseP.h, mouseP.v)) do
                P := dxPoint(X, Y, 0);
              Distace := $FFFF;
              NewTarget := TdxScene(inUserData).Root.Visual.FindTarget(P, dxProjectionScreen, Data, Distace);
              if NewTarget = nil then
                NewTarget := TdxScene(inUserData).Root.Visual.FindTarget(P, dxProjectionCamera, Data, Distace);
              if (NewTarget <> DXSceneTarget) then
              begin
                if DXSceneTarget <> nil then
                  DXSceneTarget.DragLeave;
                DXSceneTarget := NewTarget;
                if DXSceneTarget <> nil then
                begin
                  DXSceneTarget.DragEnter(Data, DXSceneTarget.AbsoluteToLocal(P));
                end;
              end;
            end;
          end;
          Result := noErr;
        end;
      kEventControlDragLeave:
        begin
          if DXSceneTarget <> nil then
            DXSceneTarget.DragLeave;
          DXSceneTarget := nil;
          Result := noErr;
        end;
      kEventControlDragReceive:
        begin
          GetEventParameter(inEvent, kEventParamDragRef, typeDragRef, nil, sizeof(DragRef), nil, @drag);
          if drag <> nil then
          begin
            GetDragPasteboard(drag, pasteboard);
            if pasteboard <> nil then
            begin
              if TdxScene(inUserData).Root = nil then
                Exit;

              GetDragMouse(drag, mouseP, mouseP);
              with TdxScene(inUserData).ScreenToClient(Point(mouseP.h, mouseP.v)) do
                P := dxPoint(X, Y, 0);
              Data := CreateFileURLFromPasteboard(pasteboard);
              if DXSceneTarget <> nil then
                DXSceneTarget.DragDrop(Data, DXSceneTarget.AbsoluteToLocal(P));
            end;
          end;
          DXSceneTarget := nil;
          Result := noErr;
        end;
    end;
  end;
end;

var
  EventKinds: array[0..20] of EventTypeSpec;
  WndEventHandlerUPP: EventHandlerUPP;
  {$ENDIF}

  {$IFDEF WINDOWS}

function WndCallback(Ahwnd: HWND; uMsg: UINT; wParam: WParam; lParam: LParam): LRESULT; stdcall;
{$IFDEF FPC}
var
  Win: TWinControl;
  {$ENDIF}
begin
  {$IFDEF FPC}
  Win := FindControl(Ahwnd);
  if (Win is TdxScene) then
  begin
    if not (csDestroying in Win.ComponentState) then
    begin
      if (uMsg = WM_ADDUPDATERECT) or (uMsg = WM_PAINT) then
      begin
        Result := Win.Perform(uMsg, wParam, lParam);
        exit;
      end;
    end;
    result := CallWindowProcW(@TdxScene(Win).PrevWndProc, Ahwnd, uMsg, WParam, LParam);
    Exit;
  end;
  {$ENDIF}
  result := CallWindowProcW(@DefWindowProc, Ahwnd, uMsg, WParam, LParam);
end;
{$ENDIF}

type

  TdxAlignInfo = record
    AlignList: TList;
    ControlIndex: Integer;
    Align: TdxAlign;
    Scratch: Integer;
  end;

  { TdxPosition }

constructor TdxPosition.Create(const ADefaultValue: TdxPoint);
begin
  inherited Create;
  FDefaultValue := ADefaultValue;
  FX := FDefaultValue.X;
  FY := FDefaultValue.Y;
  FZ := FDefaultValue.Z;
  FSave := dxVector(Fx, Fy, Fz);
end;

procedure TdxPosition.Assign(Source: TPersistent);
begin
  if Source is TdxPosition then
  begin
    Point := TdxPosition(Source).Point;
    FSave := Vector;
  end
  else
    inherited
end;

procedure TdxPosition.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('Point', ReadPoint, WritePoint, (FX <> DefaultValue.X) or (FY <> DefaultValue.Y) or (FZ <> DefaultValue.Z));
end;

procedure TdxPosition.ReadPoint(Reader: TReader);
begin
  Point := dxStringToPoint(Reader.ReadString);
end;

procedure TdxPosition.WritePoint(Writer: TWriter);
begin
  Writer.WriteString(dxPointToString(Point));
end;

function TdxPosition.GetVector: TdxVector;
begin
  Result := dxVector(Fx, Fy, Fz);
end;

procedure TdxPosition.SetVector(const Value: TdxVector);
begin
  SetPoint(dxPoint(Value));
end;

function TdxPosition.GetPoint: TdxPoint;
begin
  Result := dxPoint(Fx, Fy, Fz);
end;

procedure TdxPosition.SetVectorNoChange(const P: TdxVector);
begin
  FSave := dxVector(Fx, Fy, Fz);
  Fx := P.X;
  Fy := P.Y;
  Fz := P.Z;
end;

procedure TdxPosition.SetPointNoChange(const P: TdxPoint);
begin
  FSave := dxVector(Fx, Fy, Fz);
  Fx := P.X;
  Fy := P.Y;
  Fz := P.Z;
end;

procedure TdxPosition.SetPoint(const Value: TdxPoint);
begin
  FSave := dxVector(Fx, Fy, Fz);
  Fx := Value.X;
  Fy := Value.Y;
  Fz := Value.Z;
  if Assigned(OnChange) then
    OnChange(Self);
end;

procedure TdxPosition.SetX(const Value: single);
begin
  if FX <> Value then
  begin
    FSave.X := FX;
    FX := Value;
    if Assigned(OnChangeX) then
      OnChangeX(Self)
    else
      if Assigned(OnChange) then
      OnChange(Self);
  end;
end;

procedure TdxPosition.SetY(const Value: single);
begin
  if FY <> Value then
  begin
    FSave.Y := FY;
    FY := Value;
    if Assigned(OnChangeY) then
      OnChangeY(Self)
    else
      if Assigned(OnChange) then
      OnChange(Self);
  end;
end;

procedure TdxPosition.SetZ(const Value: single);
begin
  if FZ <> Value then
  begin
    FSave.Z := FZ;
    FZ := Value;
    if Assigned(OnChangeZ) then
      OnChangeZ(Self)
    else
      if Assigned(OnChange) then
      OnChange(Self);
  end;
end;

function TdxPosition.Empty: boolean;
begin
  Result := (FX = 0) and (FY = 0) and (FZ = 0);
end;

{ TdxBounds }

constructor TdxBounds.Create;
begin
  inherited Create;
end;

procedure TdxBounds.Assign(Source: TPersistent);
begin
  if Source is TdxBounds then
  begin
    FLeft := TdxBounds(Source).FLeft;
    FTop := TdxBounds(Source).FTop;
    FRight := TdxBounds(Source).FRight;
    FBottom := TdxBounds(Source).FBottom;
    FNear := TdxBounds(Source).FNear;
    FFar := TdxBounds(Source).FFar;
    if Assigned(OnChange) then
      OnChange(Self);
  end
  else
    inherited
end;

function TdxBounds.Width: single;
begin
  Result := Fright - Fleft;
end;

function TdxBounds.Height: single;
begin
  Result := Fbottom - Ftop;
end;

function TdxBounds.Depth: single;
begin
  Result := FFar - FNear;
end;

function TdxBounds.MarginEmpty: boolean;
begin
  Result := (FLeft = 0) and (FTop = 0) and (FRight = 0) and (FBottom = 0) and (FNear = 0) and (FFar = 0);
end;

procedure TdxBounds.SetBottom(const Value: single);
begin
  if FBottom <> Value then
  begin
    FBottom := Value;
    if Assigned(OnChange) then
      OnChange(Self);
  end;
end;

procedure TdxBounds.SetFar(const Value: single);
begin
  if FFar <> Value then
  begin
    FFar := Value;
    if Assigned(OnChange) then
      OnChange(Self);
  end;
end;

procedure TdxBounds.SetNear(const Value: single);
begin
  if FNear <> Value then
  begin
    FNear := Value;
    if Assigned(OnChange) then
      OnChange(Self);
  end;
end;

procedure TdxBounds.SetLeft(const Value: single);
begin
  if FLeft <> Value then
  begin
    FLeft := Value;
    if Assigned(OnChange) then
      OnChange(Self);
  end;
end;

procedure TdxBounds.SetRight(const Value: single);
begin
  if FRight <> Value then
  begin
    FRight := Value;
    if Assigned(OnChange) then
      OnChange(Self);
  end;
end;

procedure TdxBounds.SetTop(const Value: single);
begin
  if FTop <> Value then
  begin
    FTop := Value;
    if Assigned(OnChange) then
      OnChange(Self);
  end;
end;

procedure TdxBounds.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('Rect', ReadRect, WriteRect, false);
  Filer.DefineProperty('NewRect', ReadNewRect, WriteNewRect, (FLeft <> 0) or (FTop <> 0) or
    (FRight <> 0) or (FBottom <> 0) or (ZNear <> 0) or (ZFar <> 0));
end;

procedure TdxBounds.ReadRect(Reader: TReader);
var
  R: TvxRect;
begin
  R := vgStringToRect(Reader.ReadString);
  FLeft := R.Left;
  FTop := R.Top;
  FRight := R.Right;
  FBottom := R.Bottom;
end;

procedure TdxBounds.WriteRect(Writer: TWriter);
begin
end;

procedure TdxBounds.ReadNewRect(Reader: TReader);
var
  S: AnsiString;
begin
  S := Reader.ReadString;
  try
    GetToken(S, ',()');
    FLeft := vgStrToFloat(GetToken(S, ',()'));
    FTop := vgStrToFloat(GetToken(S, ',()'));
    FRight := vgStrToFloat(GetToken(S, ',()'));
    FBottom := vgStrToFloat(GetToken(S, ',()'));
    FNear := vgStrToFloat(GetToken(S, ',()'));
    FFar := vgStrToFloat(GetToken(S, ',()'));
  except
  end;
end;

procedure TdxBounds.WriteNewRect(Writer: TWriter);
var
  S: AnsiString;
begin
  S := '(' + vgFloatToStr(FLeft) + ',' + vgFloatToStr(FTop) + ',' + vgFloatToStr(FRight) + ',' +
    vgFloatToStr(FBottom) + ',' + vgFloatToStr(FNear) + ',' + vgFloatToStr(FFar) + ')';
  Writer.WriteString(S);
end;

{ TdxBitmapRect ===============================================================}

constructor TdxBitmapRect.Create;
begin
  inherited Create;
end;

procedure TdxBitmapRect.Assign(Source: TPersistent);
begin
  if Source is TdxBitmapRect then
  begin
    FLeft := TdxBitmapRect(Source).FLeft;
    FTop := TdxBitmapRect(Source).FTop;
    FRight := TdxBitmapRect(Source).FRight;
    FBottom := TdxBitmapRect(Source).FBottom;
    if Assigned(FOnChange) then
      FOnChange(Self);
  end
  else
    inherited;
end;

function TdxBitmapRect.empty: boolean;
begin
  Result := (FLeft = 0) and (FTop = 0) and (FRight = 0) and (FBottom = 0);
end;

procedure TdxBitmapRect.SetBottom(const Value: single);
begin
  if FBottom <> Value then
  begin
    FBottom := Value;
    if Assigned(FOnChange) then
      FOnChange(Self);
  end;
end;

procedure TdxBitmapRect.SetLeft(const Value: single);
begin
  if FLeft <> Value then
  begin
    FLeft := Value;
    if Assigned(FOnChange) then
      FOnChange(Self);
  end;
end;

procedure TdxBitmapRect.SetRight(const Value: single);
begin
  if FRight <> Value then
  begin
    FRight := Value;
    if Assigned(FOnChange) then
      FOnChange(Self);
  end;
end;

procedure TdxBitmapRect.SetTop(const Value: single);
begin
  if FTop <> Value then
  begin
    FTop := Value;
    if Assigned(FOnChange) then
      FOnChange(Self);
  end;
end;

{ TdxTransform ================================================================}

constructor TdxTransform.Create;
begin
  inherited;
  FMatrix := IdentityMatrix;
  FPosition := TdxPosition.Create(dxPoint(0, 0, 0));
  FPosition.OnChange := MatrixChanged;
  FScale := TdxPosition.Create(dxPoint(1, 1, 1));
  FScale.OnChange := MatrixChanged;
  FSkew := TdxPosition.Create(dxPoint(0, 0, 0));
  FSkew.OnChange := MatrixChanged;
  FRotateCenter := TdxPosition.Create(dxPoint(0.5, 0.5, 0.5));
  FRotateCenter.OnChange := MatrixChanged;
end;

destructor TdxTransform.Destroy;
begin
  FRotateCenter.Free;
  FScale.Free;
  FSkew.Free;
  FPosition.Free;
  inherited;
end;

procedure TdxTransform.Assign(Source: TPersistent);
begin
  if Source is TdxTransform then
  begin
    FPosition.FX := TdxTransform(Source).Position.FX;
    FPosition.FY := TdxTransform(Source).Position.FY;
    FPosition.FZ := TdxTransform(Source).Position.FZ;
    FScale.FX := TdxTransform(Source).Scale.FX;
    FScale.FY := TdxTransform(Source).Scale.FY;
    FScale.FZ := TdxTransform(Source).Scale.FZ;
    FSkew.FX := TdxTransform(Source).Skew.FX;
    FSkew.FY := TdxTransform(Source).Skew.FY;
    FSkew.FZ := TdxTransform(Source).Skew.FZ;
    FRotateCenter.FX := TdxTransform(Source).RotateCenter.FX;
    FRotateCenter.FY := TdxTransform(Source).RotateCenter.FY;
    FRotateCenter.FZ := TdxTransform(Source).RotateCenter.FZ;
    MatrixChanged(Self);
  end
  else
    inherited
end;

procedure TdxTransform.MatrixChanged(Sender: TObject);
var
  RotMatrix: TdxMatrix;
  M1, M2: TdxMatrix;
begin
  FMatrix := IdentityMatrix;
  FMatrix.m41 := FPosition.X;
  FMatrix.m42 := FPosition.Y;
  FMatrix.m43 := FPosition.Z;
  FMatrix.m14 := FSkew.X;
  FMatrix.m24 := FSkew.Y;
  FMatrix.m34 := FSkew.Z;
  FMatrix.m11 := FScale.X;
  FMatrix.m22 := FScale.Y;
  FMatrix.m33 := FScale.Z;
  if FRotateAngle <> 0 then
  begin

    {    M1 := IdentityMatrix;
        M1.m31 := -FRotateCenter.X * FWidth;
        M1.m32 := -FRotateCenter.Y * FHeight;
        M2 := IdentityMatrix;
        M2.m31 := FRotateCenter.X * FWidth;
        M2.m32 := FRotateCenter.Y * FHeight;
        RotMatrix := vgMatrixMultiply(M1, vgMatrixMultiply(vgCreateRotationMatrix(vgDegToRad(FRotateAngle)), M2));
        FMatrix := vgMatrixMultiply(RotMatrix, FMatrix); }
    //    FMatrix := dxMatrixMultiply(dxCreateRotationMatrix(vgDegToRad(FRotateAngle)), FMatrix);
  end;
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

{ TdxFilter }

class function TdxFilter.GetFileTypes: string;
begin
  Result := '';
end;

class function TdxFilter.GetImageSize(const AFileName: string): TdxPoint;
begin
  Result := dxPoint(0, 0, 0);
end;

{ TdxBitmap ===================================================================}

constructor TdxBitmap.Create(const AWidth, AHeight: integer);
begin
  inherited Create;
  FWidth := AWidth;
  FHeight := AHeight;
  FCanvasList := TList.Create;
  Recreate;
end;

procedure TdxBitmap.SetCanvas(ACanvas: TdxCanvas);
begin
  if FCanvas <> nil then
    FreeAndNil(FCanvas);

  FCanvas := ACanvas;
end;

constructor TdxBitmap.CreateFromStream(const AStream: TStream);
begin
  inherited Create;
  FCanvasList := TList.Create;
  LoadFromStream(AStream);
end;

destructor TdxBitmap.Destroy;
var
  i: integer;
begin
  for i := FCanvasList.Count - 1 downto 0 do
    TdxCanvas(FCanvasList[i]).DestroyBitmap(Self);
  FreeAndNil(FCanvasList);
  if FCanvas <> nil then
    FreeAndNil(FCanvas);
  if FBits <> nil then
    FreeMem(FBits);
  inherited;
end;

procedure TdxBitmap.SetSize(const AWidth, AHeight: integer);
begin
  if (FWidth <> AWidth) or (FHeight <> AHeight) then
  begin
    FWidth := AWidth;
    FHeight := AHeight;
    Recreate;
  end;
end;

procedure TdxBitmap.Recreate;
var
  i: integer;
begin
  for i := FCanvasList.Count - 1 downto 0 do
    TdxCanvas(FCanvasList[i]).DestroyBitmap(Self);
  if FCanvas <> nil then
    FreeAndNil(FCanvas);
  FCanvas := nil;
  if FBits <> nil then
    FreeMem(FBits);
  { not empty - we can't create empty bitmap }
  if FWidth < 1 then
    FWidth := 0;
  if FHeight < 1 then
    FHeight := 0;
  { create and clear }
  GetMem(FBits, FWidth * FHeight * SizeOf(TdxColor));
  vgFillLongword(FBits, FWidth * FHeight, 0);
  FNeedUpdate := true;
end;

procedure TdxBitmap.Clear(const AColor: TdxColor);
begin
  if FBits <> nil then
  begin
    vgFillLongword(FBits, FWidth * FHeight, AColor);
    FNeedUpdate := true;
  end;
end;

procedure TdxBitmap.FillAlpha(const AAlpha: byte = $FF);
begin
  if FBits <> nil then
  begin
    vgFillAlpha(FBits, FWidth * FHeight, AAlpha);
    FNeedUpdate := true;
  end;
end;

procedure TdxBitmap.ClearRect(const ARect: TvxRect;
  const AColor: TdxColor);
begin
  if FBits <> nil then
  begin
    vgFillLongwordRect(FBits, FWidth, FHeight, Trunc(ARect.Left), Trunc(ARect.Top), Trunc(ARect.Right), Trunc(ARect.Bottom), AColor);
    FNeedUpdate := true;
  end;
end;

function TdxBitmap.LockBitmapBits(var Bits: PdxColorArray; const Write: boolean): boolean;
begin
  Bits := nil;
  if FBits <> nil then
  begin
    Bits := FBits;
    if Write then
      FLocked := true;
    Result := true;
  end
  else
    Result := false;
end;

procedure TdxBitmap.UnlockBitmapBits;
begin
  if FLocked then
  begin
    FNeedUpdate := true;
    if Assigned(FOnChange) then
      FOnChange(Self);
  end;
  FLocked := false;
end;

procedure TdxBitmap.AssignTo(Dest: TPersistent);
var
  i: integer;
  {$IFNDEF FPC}
  B: TBitmap;
  {$ENDIF}
begin
  {$IFNDEF FPC}
  if Dest is TPicture then
  begin
    B := TBitmap.Create;
    B.HandleType := bmDIB;
    B.PixelFormat := pf32bit;
    B.Width := FWidth;
    B.Height := FHeight;
    for i := 0 to FHeight - 1 do
      System.Move(Bits[i * FWidth], B.Scanline[i]^, Width * 4);
    TPicture(Dest).Assign(B);
    B.Free;
  end
  else
    if Dest is TBitmap then
  begin
    TBitmap(Dest).HandleType := bmDIB;
    TBitmap(Dest).PixelFormat := pf32bit;
    TBitmap(Dest).Width := FWidth;
    TBitmap(Dest).Height := FHeight;
    for i := 0 to FHeight - 1 do
      System.Move(Bits[i * FWidth], TBitmap(Dest).Scanline[i]^, Width * 4);
  end
  else
    {$ENDIF}
    if Dest is TvxBitmap then
  begin
    TvxBitmap(Dest).SetSize(FWidth, FHeight);
    for i := 0 to FHeight - 1 do
      { flip, because TvxBitmap have diffirent alignment }
      {$IFDEF UNIX}
      System.Move(Bits[i * FWidth], TvxBitmap(Dest).Scanline[FHeight - i - 1]^, Width * 4);
    {$ELSE}
      System.Move(Bits[i * FWidth], TvxBitmap(Dest).Scanline[i]^, Width * 4);
    {$ENDIF}
    if Assigned(TvxBitmap(Dest).OnChange) then
      TvxBitmap(Dest).OnChange(Self);
  end
  else
    inherited;
end;

procedure TdxBitmap.Assign(Source: TPersistent);
var
  SLine: PvgColorArray;
  SLine24: PvgColor24Array;
  i, j: integer;
begin
  if Source is TdxCanvas then
  begin
    SetSize(TdxCanvas(Source).FWidth, TdxCanvas(Source).FHeight);
    TdxCanvas(Source).CopyBits(FBits);
    FNeedUpdate := true;
    if Assigned(FOnChange) then
      FOnChange(Self);
  end
  else
    if Source is TdxBitmap then
  begin
    SetSize(TdxBitmap(Source).Width, TdxBitmap(Source).Height);
    vgMoveLongword(TdxBitmap(Source).FBits, FBits, Width * Height);
    FNeedUpdate := true;
    if Assigned(FOnChange) then
      FOnChange(Self);
  end
  else
    if Source is TvxBitmap then
  begin
    SetSize(TvxBitmap(Source).Width, TvxBitmap(Source).Height);
    vgMoveLongword(TvxBitmap(Source).Startline, FBits, Width * Height);
    FNeedUpdate := true;
    if Assigned(FOnChange) then
      FOnChange(Self);
  end
  else
    {$IFNDEF NOVCL}
    {$IFNDEF FPC}
    {$IFNDEF UCL}
    if (Source is TBitmap) and ((Source as TBitmap).PixelFormat = pf32bit) and ((Source as TBitmap).HandleType = bmDIB) then
    with (Source as TBitmap) do
    begin
      Self.SetSize(Width, Height);
      for j := 0 to Height - 1 do
      begin
        SLine := Scanline[j];
        for i := 0 to Width - 1 do
        begin
          if Transparent and (SLine^[i] = ColorToRGB(TransparentColor)) then
            FBits[i + (j * Width)] := 0
          else
            FBits[i + (j * Width)] := SLine^[i];
        end;
      end;
      FNeedUpdate := true;
      if Assigned(FOnChange) then
        FOnChange(Self);
    end
  else
    if (Source is TBitmap) and ((Source as TBitmap).PixelFormat = pf24bit) then
    with (Source as TBitmap) do
    begin
      Self.SetSize(Width, Height);
      for j := 0 to Height - 1 do
      begin
        SLine24 := Scanline[j];
        for i := 0 to Width - 1 do
        begin
          if Transparent and (RGB(SLine24^[i].R, SLine24^[i].G, SLine24^[i].B) = ColorToRGB(TransparentColor)) then
            FBits[i + (j * Width)] := 0
          else
            FBits[i + (j * Width)] := $FF000000 + RGB(SLine24^[i].R, SLine24^[i].G, SLine24^[i].B);
        end;
      end;
      FNeedUpdate := true;
      if Assigned(FOnChange) then
        FOnChange(Self);
    end
  else
    {$ENDIF}
    {$ENDIF}
    {$ENDIF}
    inherited
end;

procedure TdxBitmap.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineBinaryProperty('PNG', ReadBitmap, WriteBitmap, FWidth * FHeight > 0);
end;

procedure TdxBitmap.ReadBitmap(Stream: TStream);
begin
  LoadFromStream(Stream);
end;

procedure TdxBitmap.WriteBitmap(Stream: TStream);
begin
  SaveToStream(Stream);
end;

procedure TdxBitmap.LoadFromFile(const AFileName: string;
  const Rotate: single);
var
  Filter: TdxFilter;
begin
  Filter := DefaultFilterClass.Create;
  if Filter.LoadFromFile(AFileName, Rotate, Self) then
    if Assigned(FOnChange) then
      FOnChange(Self);
  Filter.Free;
end;

procedure TdxBitmap.LoadThumbnailFromFile(const AFileName: string;
  const AFitWidth, AFitHeight: single; const UseEmbedded: boolean);
var
  Filter: TdxFilter;
begin
  Filter := DefaultFilterClass.Create;
  if Filter.LoadThumbnailFromFile(AFileName, AFitWidth, AFitHeight, UseEmbedded, Self) then
    if Assigned(FOnChange) then
      FOnChange(Self);
  Filter.Free;
end;

procedure TdxBitmap.SaveToFile(const AFileName: string; const Params: string);
var
  Filter: TdxFilter;
begin
  Filter := DefaultFilterClass.Create;
  Filter.SaveToFile(AFileName, Self, Params);
  Filter.Free;
end;

procedure TdxBitmap.LoadFromStream(const AStream: TStream);
var
  Filter: TdxFilter;
begin
  Filter := DefaultFilterClass.Create;
  if Filter.LoadFromStream(AStream, Self) then
    if Assigned(FOnChange) then
      FOnChange(Self);
  Filter.Free;
end;

procedure TdxBitmap.SaveToStream(const AStream: TStream);
var
  i: integer;
  hasAlpha: boolean;
  Filter: TdxFilter;
begin
  { check alpha }
  hasAlpha := false;
  for i := 0 to FWidth * FHeight - 1 do
    if FBits[i] and $FF000000 <> $FF000000 then
    begin
      hasAlpha := true;
      Break;
    end;

  if hasAlpha then
  begin
    Filter := DefaultFilterClass.Create;
    Filter.SaveToStream(AStream, Self, 'png');
    Filter.Free;
  end
  else
  begin
    Filter := DefaultFilterClass.Create;
    Filter.SaveToStream(AStream, Self, 'jpg', 'quality=100');
    Filter.Free;
  end;
end;

procedure TdxBitmap.SetHeight(const Value: integer);
begin
  if FHeight <> Value then
  begin
    FHeight := Value;
    Recreate;
  end;
end;

procedure TdxBitmap.SetWidth(const Value: integer);
begin
  if FWidth <> Value then
  begin
    FWidth := Value;
    Recreate;
  end;
end;

function TdxBitmap.GetCanvas: TdxCanvas;
begin
  if FCanvas = nil then
  begin
    FCanvas := DefaultCanvasClass.CreateFromBitmap(Self);
  end;
  Result := FCanvas;
end;

{ TdxMeshData =================================================================}

constructor TdxMeshData.Create;
begin
  inherited;
end;

destructor TdxMeshData.Destroy;
begin
  if Assigned(FOnDestroyHandle) then
    FOnDestroyHandle(Self);
  Handle := 0;
  inherited;
end;

procedure TdxMeshData.Assign(Source: TPersistent);
begin
  if Source is TdxMeshData then
  begin
    SetLength(MeshVertices, Length(TdxMeshData(Source).MeshVertices));
    system.Move(TdxMeshData(Source).MeshVertices[0], MeshVertices[0], SizeOf(MeshVertices[0]) * Length(MeshVertices));
    SetLength(MeshIndices, Length(TdxMeshData(Source).MeshIndices));
    system.Move(TdxMeshData(Source).MeshIndices[0], MeshIndices[0], SizeOf(MeshIndices[0]) * Length(MeshIndices));
    FNeedUpdate := true;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end
  else
    inherited
end;

procedure TdxMeshData.CalcNormals;
var
  i, j: integer;
  vn: TdxVector;
begin
  for i := 0 to Length(MeshIndices) - 1 do
    with MeshVertices[MeshIndices[i]] do
    begin
      nx := 0;
      ny := 0;
      nz := 0;
    end;

  for i := 0 to ((Length(MeshIndices) - 3) div 3) do
  begin
    j := i * 3;
    if false {CCW} then
      vn := dxCalcPlaneNormal(dxVector(MeshVertices[MeshIndices[j + 0]].x, MeshVertices[MeshIndices[j + 0]].y, MeshVertices[MeshIndices[j + 0]].z),
        dxVector(MeshVertices[MeshIndices[j + 1]].x, MeshVertices[MeshIndices[j + 1]].y, MeshVertices[MeshIndices[j + 1]].z),
        dxVector(MeshVertices[MeshIndices[j + 2]].x, MeshVertices[MeshIndices[j + 2]].y, MeshVertices[MeshIndices[j + 2]].z))
    else
      vn := dxCalcPlaneNormal(dxVector(MeshVertices[MeshIndices[j + 2]].x, MeshVertices[MeshIndices[j + 2]].y, MeshVertices[MeshIndices[j + 2]].z),
        dxVector(MeshVertices[MeshIndices[j + 1]].x, MeshVertices[MeshIndices[j + 1]].y, MeshVertices[MeshIndices[j + 1]].z),
        dxVector(MeshVertices[MeshIndices[j + 0]].x, MeshVertices[MeshIndices[j + 0]].y, MeshVertices[MeshIndices[j + 0]].z));

    with MeshVertices[MeshIndices[j + 0]] do
    begin
      nx := nx + vn.x;
      ny := ny + vn.y;
      nz := nz + vn.z;
    end;
    with MeshVertices[MeshIndices[j + 1]] do
    begin
      nx := nx + vn.x;
      ny := ny + vn.y;
      nz := nz + vn.z;
    end;
    with MeshVertices[MeshIndices[j + 2]] do
    begin
      nx := nx + vn.x;
      ny := ny + vn.y;
      nz := nz + vn.z;
    end;
  end;
end;

procedure TdxMeshData.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineBinaryProperty('Mesh', ReadMesh, WriteMesh, Length(MeshVertices) > 0);
end;

procedure TdxMeshData.ReadMesh(Stream: TStream);
var
  L: cardinal;
begin
  Stream.Read(L, SizeOf(L));
  SetLength(MeshVertices, L);
  Stream.Read(MeshVertices[0], L * SizeOf(MeshVertices[0]));
  Stream.Read(L, SizeOf(L));
  SetLength(MeshIndices, L);
  Stream.Read(MeshIndices[0], L * SizeOf(MeshIndices[0]));
end;

procedure TdxMeshData.WriteMesh(Stream: TStream);
var
  L: cardinal;
begin
  L := Length(MeshVertices);
  Stream.Write(L, SizeOf(L));
  Stream.Write(MeshVertices[0], L * SizeOf(MeshVertices[0]));
  L := Length(MeshIndices);
  Stream.Write(L, SizeOf(L));
  Stream.Write(MeshIndices[0], L * SizeOf(MeshIndices[0]));
end;

function TdxMeshData.GetNormals: AnsiString;
var
  s: ansistring;
  i, pos: integer;
begin
  SetLength(Result, High(MeshVertices) * (3 * 12 + 4));
  pos := 0;
  for i := 0 to High(MeshVertices) do
  begin
    s := dxFloatToStr(MeshVertices[i].nx) + ' ' + dxFloatToStr(MeshVertices[i].ny) + ' ' + dxFloatToStr(MeshVertices[i].nz) + '  ';
    system.Move(PChar(s)^, PByteArray(Result)[pos], length(s));
    pos := pos + length(s);
  end;
  SetLength(Result, Pos);
end;

function TdxMeshData.GetPoints: AnsiString;
var
  s: ansistring;
  i, pos: integer;
begin
  SetLength(Result, High(MeshVertices) * (3 * 12 + 4));
  pos := 0;
  for i := 0 to High(MeshVertices) do
  begin
    s := dxFloatToStr(MeshVertices[i].x) + ' ' + dxFloatToStr(MeshVertices[i].y) + ' ' + dxFloatToStr(MeshVertices[i].z) + '  ';
    system.Move(PChar(s)^, PByteArray(Result)[pos], length(s));
    pos := pos + length(s);
  end;
  SetLength(Result, pos);
end;

function TdxMeshData.GetTexCoordinates: AnsiString;
var
  s: ansistring;
  i, pos: integer;
begin
  SetLength(Result, High(MeshVertices) * (2 * 12 + 4));
  pos := 0;
  for i := 0 to High(MeshVertices) do
  begin
    s := dxFloatToStr(MeshVertices[i].tu) + ' ' + dxFloatToStr(MeshVertices[i].tv) + '  ';
    system.Move(PChar(s)^, PByteArray(Result)[pos], length(s));
    pos := pos + length(s);
  end;
  SetLength(Result, pos);
end;

function TdxMeshData.GetTriangleIndices: AnsiString;
var
  s: ansistring;
  i, pos: integer;
begin
  SetLength(Result, High(MeshIndices) * (7));
  pos := 0;
  for i := 0 to High(MeshIndices) do
  begin
    s := dxFloatToStr(MeshIndices[i]) + ' ';
    if (i + 1) mod 3 = 0 then
      s := s + ' ';
    system.Move(PChar(s)^, PByteArray(Result)[pos], length(s));
    pos := pos + length(s);
  end;
  SetLength(Result, pos);
end;

procedure TdxMeshData.SetNormals(const Value: AnsiString);
var
  Pos, Count: integer;
begin
  Pos := 1;
  Count := 0;
  while Pos < Length(Value) do
  begin
    try
      Count := Count + 1;
      if Length(MeshVertices) < Count then
        SetLength(MeshVertices, Count);
      MeshVertices[Count - 1].nx := dxStrToFloat(dxGetToken(Pos, Value, ' ,'));
      MeshVertices[Count - 1].ny := dxStrToFloat(dxGetToken(Pos, Value, ' ,'));
      MeshVertices[Count - 1].nz := dxStrToFloat(dxGetToken(Pos, Value, ' ,'));
    except
    end;
  end;
  if Length(MeshVertices) > Count then
    SetLength(MeshVertices, Count);
  if Assigned(FOnChanged) then
    FOnChanged(Self);
  FNeedUpdate := true;
end;

procedure TdxMeshData.SetPoints(const Value: AnsiString);
var
  Pos, Count: integer;
begin
  Count := 0;
  Pos := 1;
  while Pos < Length(Value) do
  begin
    try
      Count := Count + 1;
      if Length(MeshVertices) < Count then
        SetLength(MeshVertices, Count);
      MeshVertices[Count - 1].x := dxStrToFloat(dxGetToken(Pos, Value, ' ,'));
      MeshVertices[Count - 1].y := dxStrToFloat(dxGetToken(Pos, Value, ' ,'));
      MeshVertices[Count - 1].z := dxStrToFloat(dxGetToken(Pos, Value, ' ,'));
    except
    end;
  end;
  if Length(MeshVertices) > Count then
    SetLength(MeshVertices, Count);
  if Assigned(FOnChanged) then
    FOnChanged(Self);
  FNeedUpdate := true;
end;

procedure TdxMeshData.SetTexCoordinates(const Value: AnsiString);
var
  Pos, Count: integer;
begin
  Count := 0;
  Pos := 1;
  while Pos < Length(Value) do
  begin
    try
      Count := Count + 1;
      if Length(MeshVertices) < Count then
        SetLength(MeshVertices, Count);
      MeshVertices[Count - 1].tu := dxStrToFloat(dxGetToken(Pos, Value, ' ,'));
      MeshVertices[Count - 1].tv := dxStrToFloat(dxGetToken(Pos, Value, ' ,'));
    except
    end;
  end;
  if Length(MeshVertices) > Count then
    SetLength(MeshVertices, Count);
  if Assigned(FOnChanged) then
    FOnChanged(Self);
  FNeedUpdate := true;
end;

procedure TdxMeshData.SetTriangleIndices(const Value: AnsiString);
var
  Pos, Count: integer;
begin
  Count := 0;
  Pos := 1;
  while Pos < Length(Value) do
  begin
    try
      Count := Count + 1;
      if Length(MeshIndices) < Count then
        SetLength(MeshIndices, Count);
      MeshIndices[Count - 1] := StrToInt(dxGetToken(Pos, Value, ' '));
    except
    end;
  end;
  if Length(MeshIndices) > Count then
    SetLength(MeshIndices, Count);
  if Assigned(FOnChanged) then
    FOnChanged(Self);
  FNeedUpdate := true;
end;

{ TdxMaterial }

constructor TdxMaterial.Create;
begin
  inherited;
  FBitmapRect := TdxBitmapRect.Create;
  FDiffuse := $FF707070;
  FAmbient := $FF303030;
  FLighting := true;
  FShadeMode := dxGouraud;
  FBitmapTile := 1;
  FBitmapTileY := 1;
end;

destructor TdxMaterial.Destroy;
begin
  FBitmapRect.Free;
  inherited;
end;

procedure TdxMaterial.Assign(Source: TPersistent);
begin
  if Source is TdxMaterial then
  begin
    FDiffuse := (Source as TdxMaterial).FDiffuse;
    FAmbient := (Source as TdxMaterial).FAmbient;
    FBitmap := (Source as TdxMaterial).FBitmap;
    FBitmapTile := (Source as TdxMaterial).FBitmapTile;
    FBitmapTileY := (Source as TdxMaterial).FBitmapTileY;
    FBitmapRect.Assign((Source as TdxMaterial).FBitmapRect);
    FLighting := (Source as TdxMaterial).FLighting;
    FModulation := (Source as TdxMaterial).FModulation;
    FShadeMode := (Source as TdxMaterial).FShadeMode;
    FFillMode := (Source as TdxMaterial).FFillMode;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end
  else
    inherited
end;

function TdxMaterial.GetBitmap: TdxBitmap;
var
  Idx: integer;
begin
  if FTempBitmap <> nil then
    Result := FTempBitmap
  else
  begin
    if (BitmapList <> nil) and (FBitmap <> '') then
    begin
      Idx := BitmapList.IndexOf(FBitmap);
      if Idx >= 0 then
      begin
        if TObject(BitmapList.Objects[Idx]) is TdxBitmapStream then
          Result := TdxBitmapStream(BitmapList.Objects[Idx]).Bitmap
        else
          if TObject(BitmapList.Objects[Idx]) is TdxBitmapObject then
          Result := TdxBitmapObject(BitmapList.Objects[Idx]).Bitmap
        else
          if TObject(BitmapList.Objects[Idx]) is TdxCustomBufferLayer then
          Result := TdxCustomBufferLayer(BitmapList.Objects[Idx]).FBuffer
      end
      else
        Result := nil;
    end
    else
      Result := nil;
  end;
end;

procedure TdxMaterial.SetModulation(const Value: TdxTexMode);
begin
  if FModulation <> Value then
  begin
    FModulation := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TdxMaterial.SetLighting(const Value: boolean);
begin
  if FLighting <> Value then
  begin
    FLighting := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TdxMaterial.SetBitmap(const Value: string);
begin
  if FBitmap <> Value then
  begin
    FBitmap := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TdxMaterial.SetTempBitmap(const Value: TdxBitmap);
begin
  if FTempBitmap <> Value then
  begin
    FTempBitmap := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

function TdxMaterial.GetAmbient: string;
begin
  Result := dxColorToStr(FAmbient);
end;

procedure TdxMaterial.SetAmbient(const Value: string);
begin
  if FAmbient <> dxStrToColor(Value) then
  begin
    FAmbient := dxStrToColor(Value);
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

function TdxMaterial.GetDiffuse: string;
begin
  Result := dxColorToStr(FDiffuse);
end;

procedure TdxMaterial.SetNativeDiffuse(const Value: TdxColor);
begin
  if FDiffuse <> Value then
  begin
    FDiffuse := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TdxMaterial.SetNativeAmbient(const Value: TdxColor);
begin
  if FAmbient <> Value then
  begin
    FAmbient := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TdxMaterial.SetBitmapTile(const Value: single);
begin
  if FBitmapTile <> Value then
  begin
    FBitmapTile := Value;
    if FBitmapTile < 0.01 then
      FBitmapTile := 0.01;
    if FBitmapTile > 10 then
      FBitmapTile := 10;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TdxMaterial.SetBitmapTileY(const Value: single);
begin
  if FBitmapTileY <> Value then
  begin
    FBitmapTileY := Value;
    if FBitmapTileY < 0.01 then
      FBitmapTileY := 0.01;
    if FBitmapTileY > 10 then
      FBitmapTileY := 10;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TdxMaterial.SetShadeMode(const Value: TdxShadeMode);
begin
  if FShadeMode <> Value then
  begin
    FShadeMode := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TdxMaterial.SetFillMode(const Value: TdxFillMode);
begin
  if FFillMode <> Value then
  begin
    FFillMode := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TdxMaterial.SetDiffuse(const Value: string);
begin
  if FDiffuse <> dxStrToColor(Value) then
  begin
    FDiffuse := dxStrToColor(Value);
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

{ TdxFont =====================================================================}

constructor TdxFont.Create;
begin
  inherited;
  FSize := 12;
  FFamily := 'Tahoma';
end;

destructor TdxFont.Destroy;
begin
  inherited;
end;

procedure TdxFont.Assign(Source: TPersistent);
begin
  if Source is TdxFont then
  begin
    FFamily := (Source as TdxFont).Family;
    FSize := (Source as TdxFont).Size;
    FStyle := (Source as TdxFont).Style;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end
  else
    if Source is TvxFont then
  begin
    FFamily := (Source as TvxFont).Family;
    FSize := (Source as TvxFont).Size;
    FStyle := TdxFontStyle((Source as TvxFont).Style);
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end
  else
    if Source is TFont then
  begin
    FFamily := TFont(Source).Name;
    FSize := Abs(TFont(Source).Height);
    if TFont(Source).Style = [] then
      FStyle := dxFontRegular;
    if TFont(Source).Style = [fsBold] then
      FStyle := dxFontBold;
    if TFont(Source).Style = [fsItalic] then
      FStyle := dxFontItalic;
    if TFont(Source).Style = [fsBold, fsItalic] then
      FStyle := dxFontBoldItalic;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end
  else
    inherited;
end;

procedure TdxFont.AssignTo(Dest: TPersistent);
begin
  if Dest is TFont then
  begin
    (Dest as TFont).Name := FFamily;
    (Dest as TFont).Height := -round(FSize);
    case Style of
      dxFontRegular: TFont(Dest).Style := [];
      dxFontBold: TFont(Dest).Style := [fsBold];
      dxFontItalic: TFont(Dest).Style := [fsItalic];
      dxFontBoldItalic: TFont(Dest).Style := [fsBold, fsItalic];
    end;
  end
  else
    if Dest is TvxFont then
  begin
    TvxFont(Dest).Family := Family;
    TvxFont(Dest).Size := Size;
    TvxFont(Dest).Style := TvxFontStyle(Style);
  end
  else
    inherited;
end;

function TdxFont.isSizeStored: Boolean;
begin
  Result := FSize <> 12;
end;

function TdxFont.isFamilyStored: Boolean;
begin
  Result := FFamily <> 'Tahoma';
end;

procedure TdxFont.SetFamily(const Value: string);
begin
  if FFamily <> Value then
  begin
    FFamily := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TdxFont.SetSize(const Value: single);
begin
  if FSize <> Value then
  begin
    FSize := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

procedure TdxFont.SetStyle(const Value: TdxFontStyle);
begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

{ TdxCanvas ===================================================================}

constructor TdxCanvas.Create(const AWnd: cardinal; const AWidth, AHeight: integer; const ALockable: boolean; const Quality: TdxQuality);
begin
  FLockable := ALockable;
  FQuality := Quality;
  FWnd := AWnd;
  FWidth := AWidth;
  FHeight := AHeight;
  inherited Create;
  FPaintToMatrix := IdentityMatrix;
  FCurrentLights := TList.Create;
  FMaterial := TdxMaterial.Create;
  FMaterial.OnChanged := MaterialChanged;
  FFont := TdxFont.Create;

  if FBuffered or FLockable then
  begin
    {$IFDEF WINDOWS}
    { Initialization }
    with FBitmapInfo.bmiHeader do
    begin
      biSize := SizeOf(TBitmapInfoHeader);
      biPlanes := 1;
      biBitCount := 32;
      biCompression := BI_RGB;
      biWidth := AWidth;
      if biWidth <= 0 then
        biWidth := 1;
      biHeight := -AHeight;
      if biHeight >= 0 then
        biHeight := -1;
    end;

    { Create new DIB }
    FBufferHandle := CreateDIBSection(0, FBitmapInfo, DIB_RGB_COLORS, Pointer(FBufferBits), 0, 0);
    if FBufferBits = nil then
      raise Exception.Create('Can''t allocate the DIB handle');

    FBufferDC := CreateCompatibleDC(0);
    if FBufferDC = 0 then
    begin
      DeleteObject(FBufferHandle);
      FBufferDC := 0;
      FBufferBits := nil;
      raise Exception.Create('Can''t create compatible DC');
    end;

    if SelectObject(FBufferDC, FBufferHandle) = 0 then
    begin
      DeleteDC(FBufferDC);
      DeleteObject(FBufferHandle);
      FBufferDC := 0;
      FBufferHandle := 0;
      FBufferBits := nil;
      raise Exception.Create('Can''t select an object into DC');
    end;
    {$ENDIF}
    {$IFDEF DARWIN}
    GetMem(FBufferBits, FWidth * FHeight * 4);
    FBufferHandle := CGBitmapContextCreate(FBufferBits, FWidth, FHeight, 8,
      FWidth * 4, CGColorSpaceCreateDeviceRGB, kCGImageAlphaPremultipliedLast);
    CGContextTranslateCTM(FBufferHandle, 0, FHeight);
    CGContextScaleCTM(FBufferHandle, 1, -1);
    {$ENDIF}
  end;
end;

constructor TdxCanvas.CreateFromBitmap(const ABitmap: TdxBitmap);
begin
  FLockable := true;
  FQuality := dxLowQuality;
  inherited Create;
  FPaintToMatrix := IdentityMatrix;
  FBitmap := ABitmap;
  FWidth := FBitmap.Width;
  FHeight := FBitmap.Height;
  FCurrentLights := TList.Create;
  FMaterial := TdxMaterial.Create;
  FMaterial.OnChanged := MaterialChanged;
  FFont := TdxFont.Create;
end;

destructor TdxCanvas.Destroy;
var
  i: integer;
begin
  if FBitmaps <> nil then
    for i := FBitmaps.Count - 1 downto 0 do
      DestroyBitmap(TdxBitmap(FBitmaps[i]));
  FreeBuffer;
  if FBitmaps <> nil then
    FreeAndNil(FBitmaps);
  if FHandles <> nil then
    FreeAndNil(FHandles);
  FCurrentLights.Free;
  FFont.Free;
  FMaterial.Free;
  inherited;
end;

procedure TdxCanvas.AssignTo(Dest: TPersistent);
{$IFNDEF FPC}
var
  i: integer;
  B: TBitmap;
  Bits: PdxColorArray;
  {$ENDIF}
begin
  {$IFNDEF FPC}
  if Dest is TPicture then
  begin
    B := TBitmap.Create;
    B.HandleType := bmDIB;
    B.PixelFormat := pf32bit;
    B.Width := FWidth;
    B.Height := FHeight;
    GetMem(Bits, FWidth * FHeight * 4);
    CopyBits(Bits);
    for i := 0 to FHeight - 1 do
      System.Move(Bits[(i) * FWidth], B.Scanline[i]^, FWidth * 4);
    TPicture(Dest).Assign(B);
    FreeMem(Bits);
    B.Free;
  end
  else
    if Dest is TBitmap then
  begin
    TBitmap(Dest).HandleType := bmDIB;
    TBitmap(Dest).PixelFormat := pf32bit;
    TBitmap(Dest).Width := FWidth;
    TBitmap(Dest).Height := FHeight;
    GetMem(Bits, FWidth * FHeight * 4);
    CopyBits(Bits);
    for i := 0 to FHeight - 1 do
      System.Move(Bits[(i) * FWidth], TBitmap(Dest).Scanline[i]^, FWidth * 4);
    FreeMem(Bits);
  end
  else
    {$ENDIF}
    inherited;
end;

procedure TdxCanvas.UpdateBitmap(Bitmap: TdxBitmap);
begin
  if Bitmap = nil then
    Exit;
  if Bitmap.Width * Bitmap.Height = 0 then
  begin
    Bitmap.NeedUpdate := false;
    Exit;
  end;
  { add to free notification }
  if Bitmap.CanvasList.IndexOf(Self) < 0 then
    Bitmap.CanvasList.Add(Self);
end;

procedure TdxCanvas.AddHandle(const Bitmap: TdxBitmap; const Handle: cardinal);
begin
  if FBitmaps = nil then
  begin
    FBitmaps := TList.Create;
    FHandles := TList.Create;
  end;
  if FBitmaps.IndexOf(Bitmap) < 0 then
  begin
    FBitmaps.Add(Bitmap);
    FHandles.Add(Pointer(Handle));
  end;
end;

procedure TdxCanvas.ChangeHandle(const Bitmap: TdxBitmap; const Handle: cardinal);
var
  Idx: integer;
begin
  if FBitmaps = nil then
    Exit;
  Idx := FBitmaps.IndexOf(Bitmap);
  if Idx >= 0 then
  begin
    FHandles[Idx] := Pointer(Handle);
  end;
end;

procedure TdxCanvas.RemoveHandle(const Bitmap: TdxBitmap);
var
  Idx: integer;
begin
  if FBitmaps = nil then
    Exit;
  Idx := FBitmaps.IndexOf(Bitmap);
  if (Idx >= 0) then
  begin
    FBitmaps.Delete(Idx);
    FHandles.Delete(Idx);
  end;
end;

function TdxCanvas.GetHandle(const Bitmap: TdxBitmap): cardinal;
var
  Idx: integer;
begin
  Result := 0;
  if FBitmaps = nil then
    Exit;
  Idx := FBitmaps.IndexOf(Bitmap);
  if (Idx >= 0) then
  begin
    Result := cardinal(FHandles[Idx]);
  end;
end;

function TdxCanvas.GetScreenMatrix: TdxMatrix;
var
  matProj, scaleMatrix, transMatrix, orthoProj: TdxMatrix;
begin
  OrthoProj := MatrixOrthoOffCenterRH(0, FWidth, 0, FHeight, 1, 1000);
  matProj := MatrixPerspectiveFovRH(cPI / 6, FWidth / FHeight, 1, 1000);

  transMatrix := IdentityMatrix;
  transMatrix.m41 := 0;
  transMatrix.m42 := 0;
  transMatrix.m43 := -2;
  matProj := dxMatrixMultiply(transMatrix, matProj);

  scaleMatrix := IdentityMatrix;
  scaleMatrix.m11 := (OrthoProj.m11 / matProj.m11) * 2;
  scaleMatrix.m22 := -(OrthoProj.m11 / matProj.m11) * 2;
  scaleMatrix.m33 := -(OrthoProj.m11 / matProj.m11) * 2;
  matProj := dxMatrixMultiply(scaleMatrix, matProj);

  transMatrix := IdentityMatrix;
  transMatrix.m41 := -FWidth / 2;
  transMatrix.m42 := -FHeight / 2;
  transMatrix.m43 := 0;
  matProj := dxMatrixMultiply(transMatrix, matProj);

  Result := matProj;
end;

function TdxCanvas.GetProjectionMatrix: TdxMatrix;
begin
  Result := MatrixPerspectiveFovRH(cPI / 4 { + cPI / 6}, FWidth / FHeight, 1.0, 1000.0);
  if (FPaintToMatrix.m41 <> 0) or (FPaintToMatrix.m11 <> 1) then
  begin
    {    FPaintToMatrix := IdentityMatrix;
        FPaintToMatrix.m11 := 2;
        FPaintToMatrix.m22 := 2;
        FPaintToMatrix.m41 := -1;
        FPaintToMatrix.m42 := 1;}
    Result := dxMatrixMultiply(Result, FPaintToMatrix);
  end;
end;

procedure TdxCanvas.SaveToStream(S: TStream);
var
  B: TdxBitmap;
  Bits: PdxColorArray;
begin
  {$IFDEF WINDOWS}
  if FBufferBits <> nil then
  begin
    B := TdxBitmap.Create(FWidth, FHeight);
    B.LockBitmapBits(Bits, false);
    vgMoveLongword(FBufferBits, Bits, FWidth * FHeight);
    B.UnlockBitmapBits;
    B.SaveToStream(S);
    B.Free;
  end;
  {$ENDIF}
end;

procedure TdxCanvas.SaveToBits(Bits: Pointer);
var
  j: integer;
begin
  if FBufferBits <> nil then
  begin
    {$IFDEF DARWIN}
    for j := 0 to FHeight - 1 do
      vgMoveLongword(@PdxColorArray(FBufferBits)[j * FWidth], @PdxColorArray(Bits)[(FHeight - j - 1) * FWidth], FWidth);
    {$ELSE}
    vgMoveLongword(FBufferBits, Bits, FWidth * FHeight);
    {$ENDIF}
  end;
end;

procedure TdxCanvas.SetQuality(const Quality: TdxQuality);
begin
  FQuality := Quality;
end;

procedure TdxCanvas.ResizeBuffer(const AWidth, AHeight: integer);
begin
  if (AWidth = FWidth) and (AHeight = FHeight) then
    Exit;
  {$IFDEF WINDOWS}
  if FBuffered or FLockable then
  begin
    if FBufferDC <> 0 then
      DeleteDC(FBufferDC);
    if FBufferHandle <> 0 then
      DeleteObject(FBufferHandle);
    FBufferDC := 0;
    FBufferHandle := 0;
    FBufferBits := nil;
    FWidth := AWidth;
    FHeight := AHeight;
    if FWidth <= 0 then
      FWidth := 1;
    if FHeight <= 0 then
      FHeight := 1;
    { Initialization }
    with FBitmapInfo.bmiHeader do
    begin
      biSize := SizeOf(TBitmapInfoHeader);
      biPlanes := 1;
      biBitCount := 32;
      biCompression := BI_RGB;
      biWidth := AWidth;
      if biWidth <= 0 then
        biWidth := 1;
      biHeight := -AHeight;
      if biHeight >= 0 then
        biHeight := -1;
    end;

    { Create new DIB }
    FBufferHandle := CreateDIBSection(0, FBitmapInfo, DIB_RGB_COLORS, Pointer(FBufferBits), 0, 0);
    if FBufferBits = nil then
      raise Exception.Create('Can''t allocate the DIB handle');

    FBufferDC := CreateCompatibleDC(0);
    if FBufferDC = 0 then
    begin
      DeleteObject(FBufferHandle);
      FBufferDC := 0;
      FBufferBits := nil;
      raise Exception.Create('Can''t create compatible DC');
    end;

    if SelectObject(FBufferDC, FBufferHandle) = 0 then
    begin
      DeleteDC(FBufferDC);
      DeleteObject(FBufferHandle);
      FBufferDC := 0;
      FBufferHandle := 0;
      FBufferBits := nil;
      raise Exception.Create('Can''t select an object into DC');
    end;
  end
  else
  begin
    FWidth := AWidth;
    FHeight := AHeight;
    if FWidth <= 0 then
      FWidth := 1;
    if FHeight <= 0 then
      FHeight := 1;
  end;
  {$ENDIF}
  {$IFDEF DARWIN}
  if FBuffered or FLockable then
  begin
    if FBufferBits <> nil then
      System.FreeMem(FBufferBits, FWidth * FHeight * 4);
    FBufferBits := nil;
    FWidth := AWidth;
    FHeight := AHeight;
    if FWidth <= 0 then
      FWidth := 1;
    if FHeight <= 0 then
      FHeight := 1;

    GetMem(FBufferBits, FWidth * FHeight * 4);
    FBufferHandle := CGBitmapContextCreate(FBufferBits, FWidth, FHeight, 8,
      FWidth * 4, CGColorSpaceCreateDeviceRGB, kCGImageAlphaPremultipliedLast);
    CGContextTranslateCTM(FBufferHandle, 0, FHeight);
    CGContextScaleCTM(FBufferHandle, 1, -1);
  end
  else
  begin
    FWidth := AWidth;
    FHeight := AHeight;
    if FWidth <= 0 then
      FWidth := 1;
    if FHeight <= 0 then
      FHeight := 1;
  end;
  {$ENDIF}
end;

procedure TdxCanvas.FreeBuffer;
begin
  {$IFDEF WINDOWS}
  if FBufferHandle = 0 then
    Exit;
  if FBufferDC <> 0 then
    DeleteDC(FBufferDC);
  FBufferDC := 0;
  if FBufferHandle <> 0 then
    DeleteObject(FBufferHandle);
  FBufferHandle := 0;
  {$ENDIF}
  {$IFDEF DARWIN}
  if FBufferHandle <> nil then
    CGContextRelease(FBufferHandle);
  if FBufferBits <> nil then
    System.FreeMem(FBufferBits, FWidth * FHeight * 4);
  {$ENDIF}
  FBufferBits := nil;
end;

procedure TdxCanvas.Reset;
begin
  { reset }
  FCurrentVertexFormat := vfNone;
  FChangeStateCount := 0;
  FillChar(FCurrentStates, SizeOf(FCurrentStates), 0);
  //  FCurrentMesh := nil;
  //  FCurrentPixmap[0] := nil;
  //  FCurrentPixmap[1] := nil;
  //  FCurrentPixmap[2] := nil;
  //  FCurrentPixmap[3] := nil;
  //  FCurrentMaterial.lighting := false;
  //  FCurrentMaterial.diffuse := 0;
  //  FCurrentMaterial.specular := 0;
  //  FCurrentMaterial.ambient := 0;
  FCurrentCameraMatrix := IdentityMatrix;
  SetMatrix(IdentityMatrix);
  FCurrentLights.Clear;
  FMaterial.FDiffuse := 0;
  FMaterial.FAmbient := 0;
  FMaterial.FBitmap := '';
end;

function TdxCanvas.BeginScene: boolean;
begin
  Result := false;
end;

procedure TdxCanvas.FlushBuffer;
begin
end;

procedure TdxCanvas.MaterialChanged(Sender: TObject);
begin

end;

procedure TdxCanvas.SetMatrix(const M: TdxMatrix);
begin
  FCurrentMatrix := M;
end;

procedure TdxCanvas.SetLight(const Light: TdxLight);
begin
  FCurrentLights.Add(Light);
end;

procedure TdxCanvas.SetCamera(const Camera: TdxCamera);
begin
  FCurrentCamera := Camera;
  if FCurrentCamera.Target <> nil then
  begin
    FCurrentCameraMatrix := MatrixLookAtDirRH(Camera.AbsoluteMatrix.M[3], dxVectorSubtract(Camera.Target.AbsolutePosition, Camera.AbsolutePosition), Camera.AbsoluteMatrix.M[2]);
  end
  else
    FCurrentCameraMatrix := MatrixLookAtDirRH(Camera.AbsoluteMatrix.M[3], Camera.AbsoluteMatrix.M[1], Camera.AbsoluteMatrix.M[2]);
  FCurrentCameraInvMatrix := FCurrentCameraMatrix;
  dcm_utils.InvertMatrix(FCurrentCameraInvMatrix);
end;

procedure TdxCanvas.SetMaterialWithOpacity(M: TdxMaterial; Opacity: single);
var
  SaveD: cardinal;
begin
  SaveD := M.NativeDiffuse;
  M.FDiffuse := dxOpacity(M.NativeDiffuse, Opacity);
  FMaterial.Assign(M);
  M.FDiffuse := SaveD;
end;

procedure TdxCanvas.SetMaterial(const M: TdxMaterial);
begin
  FMaterial.Assign(M);
end;

procedure TdxCanvas.SetRenderState(const State: TdxRenderState);
begin
  if not FCurrentStates[State] then
  begin
    FCurrentStates[State] := true;
    case State of
      rs2DScene: FCurrentStates[rs3DScene] := false;
      rs3DScene: FCurrentStates[rs2DScene] := false;
      rsLightOn: FCurrentStates[rsLightOff] := false;
      rsLightOff: FCurrentStates[rsLightOn] := false;
      rsZTestOn: FCurrentStates[rsZTestOff] := false;
      rsZTestOff: FCurrentStates[rsZTestOn] := false;
      rsZWriteOn: FCurrentStates[rsZWriteOff] := false;
      rsZWriteOff: FCurrentStates[rsZWriteOn] := false;
      rsFrontFace:
        begin
          FCurrentStates[rsBackFace] := false;
          FCurrentStates[rsAllFace] := false;
        end;
      rsBackFace:
        begin
          FCurrentStates[rsAllFace] := false;
          FCurrentStates[rsFrontFace] := false;
        end;
      rsAllFace:
        begin
          FCurrentStates[rsBackFace] := false;
          FCurrentStates[rsFrontFace] := false;
        end;
      { Blending }
      rsBlendAdditive: FCurrentStates[rsBlendNormal] := false;
      rsBlendNormal: FCurrentStates[rsBlendAdditive] := false;
      { Tex stretch }
      rsTexNearest: FCurrentStates[rsTexLinear] := false;
      rsTexLinear: FCurrentStates[rsTexNearest] := false;
      { Tex modulation }
      rsTexDisable:
        begin
          FCurrentStates[rsTexModulate] := false;
          FCurrentStates[rsTexReplace] := false;
        end;
      rsTexReplace:
        begin
          FCurrentStates[rsTexModulate] := false;
          FCurrentStates[rsTexDisable] := false;
        end;
      rsTexModulate:
        begin
          FCurrentStates[rsTexDisable] := false;
          FCurrentStates[rsTexReplace] := false;
        end;
      { Fill }
      rsFrame: FCurrentStates[rsSolid] := false;
      rsSolid: FCurrentStates[rsFrame] := false;
      { Shade }
      rsFlat: FCurrentStates[rsGouraud] := false;
      rsGouraud: FCurrentStates[rsFlat] := false;
    end;
    ApplyRenderState(State);
  end;
end;

procedure TdxCanvas.Pick(x, y: single; const AProj: TdxProjection; var RayPos, RayDir: TdxVector);
var
  matProj: TdxMatrix;
  vPos, vNear: TdxVector;
begin
  if AProj = dxProjectionCamera then
  begin
    { camera }
    matProj := GetProjectionMatrix;
    // Compute the vector of the pick ray in screen space
    vPos := dxVector(0, 0, 0);
    vNear := dxVector((1.0 - (2.0 * (x / FWidth))) / matProj.m11,
      -(1.0 - (2.0 * (y / FHeight))) / matProj.m22, 1);
    // Get the inverse view matrix
    if FCurrentCamera <> nil then
    begin
      // Transform the screen space pick ray into 3D space
      vPos := dxVectorTransform(vPos, FCurrentCameraInvMatrix);
      vNear := dxVectorTransform(vNear, FCurrentCameraInvMatrix);
    end;
    RayPos := vPos;
    RayDir := dxVectorNormalize(dxVectorSubtract(vPos, vNear));
  end
  else
  begin
    { screen }
    matProj := GetScreenMatrix;
    dcm_utils.InvertMatrix(matProj);
    vPos := dxVector(0, 0, 0);
    vPos := dxVectorTransform(vPos, matProj);
    // Old behavior
    vPos := dxVector(FWidth / 2, FHeight / 2, vPos.Z * 2);
    vNear := dxVector(x, y, 0);
    RayPos := vPos;
    RayDir := dxVectorNormalize(dxVectorSubtract(vNear, vPos));
  end;
end;

function TdxCanvas.WorldToScreen(const AProj: TdxProjection; const P: TdxPoint): TdxPoint;
var
  matProj: TdxMatrix;
begin
  if AProj = dxProjectionCamera then
  begin
    { camera }
    matProj := FCurrentCameraMatrix;
    Result := dxPoint(dxVectorTransform(dxVector(P), matProj));

    matProj := GetProjectionMatrix;
    if Result.z <> 0 then
    begin
      Result.x := -((Result.x / Result.z) * matProj.m11 - 1) * FWidth / 2;
      Result.y := ((Result.y / Result.z) * matProj.m22 + 1) * FHeight / 2;
    end;
  end
  else
  begin
    { screen }
    matProj := GetScreenMatrix;
    Result := P;
  end;
end;

procedure TdxCanvas.FillRect(const Rect: TvxRect; const Depth, Opacity: single);
var
  P: TvxPolygon;
begin
  SetLength(P, 5);
  P[0] := Rect.TopLeft;
  P[1] := vgPoint(Rect.Right, Rect.Top);
  P[2] := Rect.BottomRight;
  P[3] := vgPoint(Rect.Left, Rect.Bottom);
  P[4] := Rect.TopLeft;
  FillPolygon(dxVector((Rect.Left + Rect.Right) / 2, (Rect.Top + Rect.Bottom) / 2, 0),
    dxVector(vgRectWidth(Rect), vgRectHeight(Rect), Depth), Rect, P, Opacity);
end;

procedure TdxMaterial.SetBitmapRect(const Value: TdxBitmapRect);
begin
  FBitmapRect.Assign(Value);
end;

{ TdxBitmapObject }

constructor TdxBitmapObject.Create(AOwner: TComponent);
begin
  inherited;
  FBitmap := TdxBitmap.Create(0, 0);
  if BitmapList = nil then
    BitmapList := TStringList.Create;
  BitmapList.AddObject('', Self);
end;

destructor TdxBitmapObject.Destroy;
begin
  if BitmapList <> nil then
    BitmapList.Delete(BitmapList.IndexOfObject(Self));
  FBitmap.Free;
  inherited;
end;

procedure TdxBitmapObject.SetBitmap(const Value: TdxBitmap);
begin
  FBitmap.Assign(Value);
end;

procedure TdxBitmapObject.SetResourceName(const Value: string);
var
  Idx: integer;
begin
  if FResourceName <> Value then
  begin
    inherited;
    if FResourceName <> '' then
    begin
      Idx := BitmapList.IndexOfObject(Self);
      if Idx >= 0 then
        BitmapList[Idx] := Value;
    end;
  end;
end;

procedure TdxBitmapObject.SetName(const NewName: TComponentName);
var
  Idx: integer;
begin
  if Name <> NewName then
  begin
    inherited SetName(NewName);
    Idx := BitmapList.IndexOfObject(Self);
    if Idx >= 0 then
      BitmapList[Idx] := Name;
  end;
end;

{ TdxAnimation ===================================================================}

type

  TdxAniThread = class(TvxTimer)
  private
    FAniList: TList;
    FTime, FDeltaTime: single;
    procedure OneStep;
    procedure DoSyncTimer(Sender: TObject);
  protected
  public
    constructor Create;
    destructor Destroy; override;
  end;

var
  dxAniThread: TdxAniThread;

  { TdxAniThread }

constructor TdxAniThread.Create;
begin
  inherited Create(nil);
  Interval := round(1000 / 40);
  OnTimer := DoSyncTimer;
  FAniList := TList.Create;
end;

destructor TdxAniThread.Destroy;
begin
  FAniList.Free;
  inherited;
end;

procedure TdxAniThread.DoSyncTimer(Sender: TObject);
begin
  OneStep;
end;

procedure TdxAniThread.OneStep;
var
  i: integer;
  NewTime: single;
begin
  if FTime = 0 then
    FTime := GetTickCount / 1000;
  NewTime := GetTickCount / 1000;
  if NewTime <= FTime then
    Exit;
  FDeltaTime := NewTime - FTime;
  FTime := NewTime;
  if FAniList.Count > 0 then
  begin
    for i := FAniList.Count - 1 downto 0 do
      if TdxAnimation(FAniList[i]).FRunning then
        TdxAnimation(FAniList[i]).ProcessTick(FTime, FDeltaTime);
  end;
end;

{ TdxAnimation }

constructor TdxAnimation.Create(AOwner: TComponent);
begin
  inherited;
  FEnabled := false;
  FDuration := 0.2;
  FRunning := false;
end;

destructor TdxAnimation.Destroy;
begin
  if dxAniThread <> nil then
    dxAniThread.FAniList.Remove(Self);
  inherited;
end;

procedure TdxAnimation.Loaded;
begin
  inherited;
  if not (Assigned(FScene) and (FScene.DesignTime)) and Enabled then
    Start;
end;

procedure TdxAnimation.SetEnabled(const Value: boolean);
begin
  if FEnabled <> Value then
  begin
    FEnabled := Value;
    if not (Assigned(Scene) and Scene.DesignTime) and not (csLoading in ComponentState) then
    begin
      if FEnabled then
        Start
      else
        Stop;
    end;
  end;
end;

function TdxAnimation.NormalizedTime: single;
begin
  if FDuration > 0 then
  begin
    case FInterpolation of
      vgInterpolationLinear: Result := vgInterpolateLinear(FTime, 0, 1, FDuration);
      vgInterpolationQuadratic: Result := vgInterpolateQuad(FTime, 0, 1, FDuration, FAnimationType);
      vgInterpolationCubic: Result := vgInterpolateCubic(FTime, 0, 1, FDuration, FAnimationType);
      vgInterpolationQuartic: Result := vgInterpolateQuart(FTime, 0, 1, FDuration, FAnimationType);
      vgInterpolationQuintic: Result := vgInterpolateQuint(FTime, 0, 1, FDuration, FAnimationType);
      vgInterpolationSinusoidal: Result := vgInterpolateSine(FTime, 0, 1, FDuration, FAnimationType);
      vgInterpolationExponential: Result := vgInterpolateExpo(FTime, 0, 1, FDuration, FAnimationType);
      vgInterpolationCircular: Result := vgInterpolateCirc(FTime, 0, 1, FDuration, FAnimationType);
      vgInterpolationElastic: Result := vgInterpolateElastic(FTime, 0, 1, FDuration, 0, 0, FAnimationType);
      vgInterpolationBack: Result := vgInterpolateBack(FTime, 0, 1, FDuration, 0, FAnimationType);
      vgInterpolationBounce: Result := vgInterpolateBounce(FTime, 0, 1, FDuration, FAnimationType);
    end;
  end
  else
    Result := 0;
end;

procedure TdxAnimation.ProcessAnimation;
begin
end;

procedure TdxAnimation.ProcessTick(time, deltaTime: single);
begin
  inherited;
  if (Parent <> nil) and (Parent.IsVisual) and (not TdxVisualObject(Parent).Visible) then
    Stop;

  if not FRunning then
    Exit;

  if FPause then
    Exit;

  if FDelayTime > 0 then
  begin
    FDelayTime := FDelayTime - deltaTime;
    Exit;
  end;

  if FInverse then
    FTime := FTime - deltaTime
  else
    FTime := FTime + deltaTime;
  if FTime >= FDuration then
  begin
    FTime := FDuration;
    if FLoop then
    begin
      if FAutoReverse then
      begin
        FInverse := true;
        FTime := FDuration;
      end
      else
        FTime := 0;
    end
    else
    begin
      FRunning := false;
    end;
  end
  else
    if FTime <= 0 then
  begin
    FTime := 0;
    if FLoop then
    begin
      if FAutoReverse then
      begin
        FInverse := false;
        FTime := 0;
      end
      else
        FTime := FDuration;
    end
    else
    begin
      FRunning := false;
    end;
  end;

  ProcessAnimation;
  if (FScene <> nil) and (not FScene.RealTime) then
    if not FRunning then
    begin
      if dxAniThread <> nil then
        dxAniThread.FAniList.Remove(Self);
      if Assigned(FOnFinish) then
        FOnFinish(Self);
    end;
  if (FScene <> nil) and (FScene.RealTime) then
    if not FRunning then
    begin
      if Assigned(FOnFinish) then
        FOnFinish(Self);
    end;
end;

procedure TdxAnimation.Start;
begin
  if (Parent <> nil) and (Parent.IsVisual) and (not TdxVisualObject(Parent).Visible) then
    Exit;
  if (Abs(FDuration) < 0.001) or (Assigned(FScene) and (FScene.DesignTime)) then
  begin
    { imediatly animation }
    FDelayTime := 0;
    if FInverse then
    begin
      FTime := 0;
      FDuration := 1;
    end
    else
    begin
      FTime := 1;
      FDuration := 1;
    end;
    FRunning := true;
    ProcessAnimation;
    FRunning := false;
    FTime := 0;
    FDuration := 0;
    FEnabled := false;
    if Assigned(FOnFinish) then
      FOnFinish(Self);
  end
  else
  begin
    FDelayTime := FDelay;
    FRunning := true;
    if FInverse then
      FTime := FDuration
    else
      FTime := 0;
    ProcessAnimation;

    if not ((FScene <> nil) and (FScene.RealTime)) then
    begin
      if dxAniThread = nil then
        dxAniThread := TdxAniThread.Create;
      dxAniThread.FAniList.Add(Self);
    end;
    FEnabled := true;
  end;
end;

procedure TdxAnimation.Stop;
begin
  if not FRunning then
    Exit;

  if dxAniThread <> nil then
    dxAniThread.FAniList.Remove(Self);

  if FInverse then
    FTime := 0
  else
    FTime := FDuration;
  ProcessAnimation;
  FRunning := false;
  FEnabled := false;
  if Assigned(FOnFinish) then
    FOnFinish(Self);
end;

procedure TdxAnimation.StartTrigger(AInstance: TdxObject; ATrigger: string);
var
  StartValue: boolean;
  Line, Setter, Prop, Value: ansistring;
begin
  if FTrigger = '' then
    Exit;
  if AInstance = nil then
    Exit;
  if Pos(LowerCase(ATrigger), LowerCase(FTrigger)) = 0 then
    Exit;

  Line := FTrigger;
  Setter := GetToken(Line, ';');
  StartValue := false;
  while Setter <> '' do
  begin
    Prop := GetToken(Setter, '=');
    Value := Setter;
    if GetPropInfo(AInstance, Prop, [{$IFDEF FPC}tkBool{$ELSE}tkEnumeration{$ENDIF}]) <> nil then
    begin
      {$IFDEF FPC}
      StartValue := false;
      if (CompareText(Value, 'true') = 0) and (GetOrdProp(AInstance, Prop) > 0) then
        StartValue := true;
      if (CompareText(Value, 'false') = 0) and (GetOrdProp(AInstance, Prop) = 0) then
        StartValue := true;
      {$ELSE}
      StartValue := CompareText(GetEnumProp(AInstance, Prop), Value) = 0;
      {$ENDIF}
      if not StartValue then
        Exit;
    end;
    Setter := GetToken(Line, ';');
  end;
  if StartValue then
    Start;
end;

{ TdxPhysics }

constructor TdxPhysics.Create;
begin
  inherited Create;
  FScene := Scene;
end;

destructor TdxPhysics.Destroy;
begin
  inherited;
end;

{ TdxObject ==================================================================}

constructor TdxObject.Create(AOwner: TComponent);
begin
  inherited;
  FStored := true;
end;

destructor TdxObject.Destroy;
begin
  if FParent <> nil then
    FParent.RemoveObject(Self)
  else
    if FScene <> nil then
    FScene.RemoveObject(Self);
  FScene := nil;
  DeleteChildren;
  FScene := nil;
  inherited;
end;

function TdxObject.GetChild(Index: integer): TdxObject;
begin
  if (FChildren <> nil) and (Index < FChildren.Count) then
    Result := TdxObject(FChildren[Index])
  else
    Result := nil;
end;

function TdxObject.GetChildrenCount: integer;
begin
  if (FChildren <> nil) then
    Result := FChildren.Count
  else
    Result := 0;
end;

procedure TdxObject.ReaderSetName(Reader: TReader; Component: TComponent;
  var Name: string);
begin
  Name := '';
end;

procedure TdxObject.ReaderError(Reader: TReader; const Message: string;
  var Handled: Boolean);
begin
  Handled := true;
end;

procedure TdxObject.LoadFromStream(const AStream: TStream);
var
  SaveName: string;
  BinStream: TStream;
begin
  { store }
  BinStream := TMemoryStream.Create;
  try
    ObjectTextToBinary(AStream, BinStream);
    BinStream.Position := 0;
    SaveName := Name;
    Name := '';
    BinStream.ReadComponent(Self);
    Name := SaveName;
  finally
    BinStream.Free;
  end;
end;

procedure TdxObject.SaveToStream(const Stream: TStream);
var
  SaveName: string;
  BinStream: TStream;
begin
  { store }
  BinStream := TMemoryStream.Create;
  try
    SaveName := Name;
    Name := '';
    BinStream.WriteComponent(Self);
    Name := SaveName;
    BinStream.Position := 0;
    ObjectBinaryToText(BinStream, Stream);
  finally
    BinStream.Free;
  end;
end;

procedure TdxObject.LoadFromBinStream(const AStream: TStream);
var
  R: TReader;
begin
  R := TReader.Create(AStream, 1024);
  R.OnSetName := ReaderSetName;
  R.OnError := ReaderError;
  R.ReadRootComponent(Self);
  R.Free;
end;

procedure TdxObject.SaveToBinStream(const AStream: TStream);
var
  SaveName: string;
begin
  { store }
  SaveName := Name;
  Name := '';
  AStream.WriteComponent(Self);
  Name := SaveName;
end;

function TdxObject.Clone(const AOwner: TComponent): TdxObject;
var
  S: TStream;
  R: TReader;
  SaveName: string;
begin
  Result := nil;
  S := TMemoryStream.Create;
  try
    { store }
    SaveName := Name;
    Name := '';
    S.WriteComponent(Self);
    Name := SaveName;
    S.Position := 0;
    { load }
    R := TReader.Create(S, 1024);
    R.OnSetName := ReaderSetName;
    Result := TdxObjectClass(ClassType).Create(AOwner);
    if Result <> nil then
    begin
      R.ReadRootComponent(Result);
    end;
    R.Free;
  finally
    S.Free;
  end;
end;

procedure TdxObject.CloneChildFromStream(AStream: TStream);
var
  i: integer;
  Obj: TdxObject;
begin
  Obj := CreateObjectFromStream(Self, AStream);
  if (Obj <> nil) and (Obj.FChildren <> nil) and (Obj.FChildren.Count > 0) then
  begin
    { delete self childs }
    DeleteChildren;
    { copy parent }
    for i := 0 to Obj.FChildren.Count - 1 do
    begin
      if TdxObject(Obj.FChildren[0]).isVisual then
        TdxVisualObject(Obj.FChildren[0]).Locked := true;
      TdxObject(Obj.FChildren[0]).Stored := false;
      TdxObject(Obj.FChildren[0]).Parent := Self;
    end;
    { realign to new size }
    if Obj.isVisual and (isVisual) then
    begin
      TdxVisualObject(Self).FLastWidth := TdxVisualObject(Obj).Width;
      TdxVisualObject(Self).FLastHeight := TdxVisualObject(Obj).Height;
      TdxVisualObject(Self).Realign;
    end;
    //    Obj.Free;
  end;
end;

procedure TdxVisualObject.SetLocked(const Value: boolean);
var
  i: integer;
begin
  FLocked := Value;
  {  if (FChildren <> nil) and (FChildren.Count > 0) then
      for i := 0 to FChildren.Count - 1 do
        if TdxObject(FChildren[i]).isVisual then
          TdxVisualObject(FChildren[i]).Locked := Value;}
end;

procedure TdxObject.ProcessTick(time, deltaTime: single);
var
  c, i: integer;
begin
  if FChildren <> nil then
  begin
    c := FChildren.Count;
    for i := FChildren.Count - 1 downto 0 do
    begin
      TdxObject(FChildren[i]).ProcessTick(time, deltaTime);
    end;
  end;
  if Assigned(FOnTick) then
    FOnTick(Self, time, deltaTime);
end;

function TdxObject.Visual: TdxVisualObject;
begin
  Result := TdxVisualObject(Self);
end;

function TdxObject.IsVisual: boolean;
begin
  Result := Self is TdxVisualObject;
end;

procedure TdxObject.SetResourceName(const Value: string);
begin
  FResourceName := Value;
end;

{ Animations }

procedure TdxObject.StartAnimation(const AName: WideString);
var
  i: integer;
  E: TdxAnimation;
begin
  if FChildren <> nil then
    for i := 0 to FChildren.Count - 1 do
    begin
      if TdxObject(FChildren[i]) is TdxAnimation then
        if (CompareText(TdxAnimation(FChildren[i]).Name, AName) = 0) or
          (CompareText(TdxAnimation(FChildren[i]).ResourceName, AName) = 0) then
        begin
          E := TdxAnimation(FChildren[i]);
          E.Start;
        end;
    end;
end;

procedure TdxObject.StopAnimation(const AName: WideString);
var
  i: integer;
  E: TdxAnimation;
begin
  if FChildren <> nil then
    for i := FChildren.Count - 1 downto 0 do
      if TdxObject(FChildren[i]) is TdxAnimation then
        if (CompareText(TdxAnimation(FChildren[i]).Name, AName) = 0) or
          (CompareText(TdxAnimation(FChildren[i]).ResourceName, AName) = 0) then
        begin
          E := TdxAnimation(FChildren[i]);
          E.Stop;
        end;
end;

procedure TdxObject.StartTriggerAnimation(AInstance: TdxObject; ATrigger: string);
var
  i: integer;
  E: TdxAnimation;
begin
  StopTriggerAnimation(AInstance);
  if FChildren <> nil then
    for i := 0 to FChildren.Count - 1 do
    begin
      if TdxObject(FChildren[i]) is TdxAnimation then
        TdxAnimation(FChildren[i]).StartTrigger(AInstance, ATrigger);
      { locked objects }
      if TdxObject(FChildren[i]).isVisual and TdxVisualObject(FChildren[i]).Locked and not TdxVisualObject(FChildren[i]).HitTest then
      begin
        TdxObject(FChildren[i]).StartTriggerAnimation(AInstance, ATrigger);
      end;
    end;
end;

procedure TdxObject.StopTriggerAnimation(AInstance: TdxObject);
var
  i: integer;
  E: TdxAnimation;
begin
  if FChildren <> nil then
    for i := 0 to FChildren.Count - 1 do
    begin
      if TdxObject(FChildren[i]) is TdxAnimation then
        if TdxAnimation(FChildren[i]).Trigger <> '' then
        begin
          E := TdxAnimation(FChildren[i]);
          E.Stop;
        end;
      { locked objects }
      if TdxObject(FChildren[i]).isVisual and TdxVisualObject(FChildren[i]).Locked and not TdxVisualObject(FChildren[i]).HitTest then
      begin
        TdxObject(FChildren[i]).StopTriggerAnimation(AInstance);
      end;
    end;
end;

{ Property animation }

procedure TdxObject.AnimateStop(const APropertyName: string);
var
  i: integer;
begin
  for i := 0 to ChildrenCount - 1 do
  begin
    if (Children[i] is TdxFloatAnimation) and (CompareText(TdxFloatAnimation(Children[i]).PropertyName, APropertyName) = 0) then
    begin
      TdxFloatAnimation(Children[i]).Stop;
    end;
    if (Children[i] is TdxColorAnimation) and (CompareText(TdxColorAnimation(Children[i]).PropertyName, APropertyName) = 0) then
    begin
      TdxColorAnimation(Children[i]).Stop;
    end;
  end;
end;

procedure TdxObject.AnimateFloat(const APropertyName: string; const NewValue: single; Duration: single = 0.2;
  AType: TvxAnimationType = vgAnimationIn; AInterpolation: TvxInterpolationType = vgInterpolationLinear);
var
  A: TdxFloatAnimation;
begin
  AnimateStop(APropertyName);
  A := TdxFloatAnimation.Create(Self);
  A.Parent := Self;
  A.OnFinish := DoAniFinished;
  A.Duration := Duration;
  A.AnimationType := AType;
  A.Interpolation := AInterpolation;
  A.PropertyName := APropertyName;
  A.StartFromCurrent := true;
  A.StopValue := NewValue;
  A.Start;
end;

procedure TdxObject.AnimateColor(const APropertyName: string; const NewValue: string; Duration: single = 0.2;
  AType: TvxAnimationType = vgAnimationIn; AInterpolation: TvxInterpolationType = vgInterpolationLinear);
var
  A: TdxColorAnimation;
begin
  AnimateStop(APropertyName);
  A := TdxColorAnimation.Create(Self);
  A.Parent := Self;
  A.OnFinish := DoAniFinished;
  A.Duration := Duration;
  A.AnimationType := AType;
  A.Interpolation := AInterpolation;
  A.PropertyName := APropertyName;
  A.StartFromCurrent := true;
  A.StopValue := NewValue;
  A.Start;
end;

procedure TdxObject.AnimateFloatWait(const APropertyName: string; const NewValue: single; Duration: single = 0.2;
  AType: TvxAnimationType = vgAnimationIn; AInterpolation: TvxInterpolationType = vgInterpolationLinear);
var
  A: TdxFloatAnimation;
begin
  AnimateStop(APropertyName);
  A := TdxFloatAnimation.Create(Self);
  A.Parent := Self;
  A.AnimationType := AType;
  A.Interpolation := AInterpolation;
  A.Duration := Duration;
  A.PropertyName := APropertyName;
  A.StartFromCurrent := true;
  A.StopValue := NewValue;
  A.Start;
  while A.FRunning do
  begin
    Application.ProcessMessages;
    Sleep(0);
  end;
  A.Free;
end;

procedure TdxObject.AnimateColorWait(const APropertyName: string; const NewValue: string; Duration: single = 0.2;
  AType: TvxAnimationType = vgAnimationIn; AInterpolation: TvxInterpolationType = vgInterpolationLinear);
var
  A: TdxColorAnimation;
begin
  AnimateStop(APropertyName);
  A := TdxColorAnimation.Create(Self);
  A.Parent := Self;
  A.Duration := Duration;
  A.AnimationType := AType;
  A.Interpolation := AInterpolation;
  A.PropertyName := APropertyName;
  A.StartFromCurrent := true;
  A.StopValue := NewValue;
  A.Start;
  while A.FRunning do
  begin
    Application.ProcessMessages;
    Sleep(0);
  end;
  A.Free;
end;

procedure TdxObject.DoAniFinished(Sender: TObject);
begin
  TdxAnimation(Sender).Free;
end;

{ VCL }

procedure TdxObject.UpdateChildScene;
var
  i: integer;
begin
  if (FParent <> nil) then
    FScene := FParent.FScene;
  if (FChildren <> nil) and (FChildren.Count > 0) then
    for i := 0 to FChildren.Count - 1 do
      TdxObject(FChildren[i]).UpdateChildScene;
end;

procedure TdxObject.SetParent(const Value: TdxObject);
begin
  if FParent <> nil then
    FParent.RemoveObject(Self)
  else
    if FScene <> nil then
    FScene.RemoveObject(Self);
  FParent := Value;
  if FParent <> nil then
  begin
    FParent.AddObject(Self);
    UpdateChildScene;
  end;
end;

procedure TdxObject.SetParentComponent(Value: TComponent);
begin
  inherited;
  if FParent <> nil then
    FParent.RemoveObject(Self);

  if (Value <> nil) and (Value is TdxObject) then
  begin
    TdxObject(Value).AddObject(Self);
  end
  else
    if (Value <> nil) and (Value is TdxScene) then
  begin
    TdxScene(Value).AddObject(Self);
  end;
end;

procedure TdxObject.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  i, j: Integer;
begin
  inherited;
  if FChildren <> nil then
    for i := 0 to FChildren.Count - 1 do
    begin
      if TdxObject(FChildren[i]).Stored then
      begin
        Proc(FChildren[i]);
      end;
    end;
end;

function TdxObject.GetParentComponent: TComponent;
begin
  Result := FParent;
  if Result = nil then
    Result := FScene;
end;

function TdxObject.HasParent: Boolean;
begin
  Result := true;
end;

{  }

function TdxObject.FindObject(const AClass: TdxObjectClass): TdxObject;
var
  i: integer;
begin
  Result := nil;
  if (FChildren <> nil) and (FChildren.Count > 0) then
  begin
    for i := 0 to FChildren.Count - 1 do
    begin
      if TdxObject(FChildren[i]) is AClass then
      begin
        Result := TdxObject(FChildren[i]);
        Exit;
      end;
      Result := TdxObject(FChildren[i]).FindObject(AClass);
      if Result <> nil then
        Exit;
    end;
  end;
end;

function TdxObject.FindResource(const AResource: string): TdxObject;
var
  i: integer;
begin
  Result := nil;
  if (FChildren <> nil) and (FChildren.Count > 0) then
  begin
    for i := 0 to FChildren.Count - 1 do
    begin
      if CompareText(TdxObject(FChildren[i]).ResourceName, AResource) = 0 then
      begin
        Result := TdxObject(FChildren[i]);
        Exit;
      end;
      Result := TdxObject(FChildren[i]).FindResource(AResource);
      if Result <> nil then
        Exit;
    end;
  end;
end;

procedure TdxObject.DeleteChildren;
var
  Child: TdxObject;
begin
  if Assigned(FChildren) then
  begin
    while FChildren.Count > 0 do
    begin
      Child := TdxObject(FChildren[0]);
      FChildren.Delete(0);
      Child.FParent := nil;
      Child.Free;
    end;
    FreeAndNil(FChildren);
  end;
end;

procedure TdxObject.AddObjectsToList(const AList: TList);
var
  i: integer;
begin
  AList.Add(Self);
  if FChildren <> nil then
    for i := 0 to FChildren.Count - 1 do
      TdxObject(FChildren[i]).AddObjectsToList(AList);
end;

procedure TdxObject.AddObject(AObject: TdxObject);
begin
  if FChildren = nil then
    FChildren := TList.Create;
  FChildren.Add(AObject);
  AObject.FParent := Self;
  AObject.FScene := FScene;
  UpdateChildScene;
  if IsVisual and AObject.IsVisual and (TdxVisualObject(Self).Projection = dxProjectionScreen) then
    TdxVisualObject(AObject).Projection := TdxVisualObject(Self).Projection;
  if isVisual and not (csLoading in ComponentState) then
  begin
    TdxVisualObject(Self).RecalcAbsolute;
    TdxVisualObject(Self).Realign;
  end;
end;

procedure TdxObject.RemoveObject(AObject: TdxObject);
begin
  if FChildren <> nil then
    FChildren.Remove(AObject);
  if isVisual then
  begin
    TdxVisualObject(Self).Realign;
    TdxVisualObject(Self).Repaint;
  end;
end;

procedure TdxObject.BringToFront;
begin
  if (Parent <> nil) and (Parent.FChildren <> nil) then
  begin
    Parent.FChildren.Remove(Self);
    Parent.FChildren.Add(Self);
    if isVisual then
      TdxVisualObject(Self).Repaint;
  end;
end;

procedure TdxObject.SendToBack;
begin
  if (Parent <> nil) and (Parent.FChildren <> nil) then
  begin
    Parent.FChildren.Remove(Self);
    Parent.FChildren.Insert(0, Self);
    if isVisual then
      TdxVisualObject(Self).Repaint;
  end;
end;

{ TdxVisualObject ==================================================================}

constructor TdxVisualObject.Create(AOwner: TComponent);
begin
  inherited;
  FCursor := crDefault;
  FShowContextMenu := true;
  FCanResize := true;
  FCanRotate := true;
  FOpacity := 1;
  FZWrite := true;
  FLocalMatrix := IdentityMatrix;
  FQuaternion := IdentityQuaternion;
  FPosition := TdxPosition.Create(dxPoint(0, 0, 0));
  FPosition.OnChange := MatrixChanged;
  FScale := TdxPosition.Create(dxPoint(1, 1, 1));
  FScale.OnChange := MatrixChanged;
  FSkew := TdxPosition.Create(dxPoint(0, 0, 0));
  FSkew.OnChange := MatrixChanged;
  FRotateAngle := TdxPosition.Create(dxPoint(0, 0, 0));
  FRotateAngle.OnChangeX := RotateXChanged;
  FRotateAngle.OnChangeY := RotateYChanged;
  FRotateAngle.OnChangeZ := RotateZChanged;
  FRotateCenter := TdxPosition.Create(dxPoint(0, 0, 0));
  FRotateCenter.OnChange := MatrixChanged;
  FVelocity := TdxPosition.Create(dxPoint(0, 0, 0));
  FMargins := TdxBounds.Create;
  FMargins.OnChange := MarginsChanged;
  FPadding := TdxBounds.Create;
  FPadding.OnChange := PaddingChanged;
  FWidth := 1;
  FLastWidth := FWidth;
  FHeight := 1;
  FLastHeight := FHeight;
  FDepth := 1;
  FLastDepth := FDepth;
  FVisible := true;
  FHitTest := true;
  FRecalcAbsolute := true;
  FRecalcOpacity := true;
end;

destructor TdxVisualObject.Destroy;
begin
  FAbsoluteOpacity := 0;
  FVisible := false;
  DestroyBody;
  FVelocity.Free;
  FMargins.Free;
  FPadding.Free;
  FRotateCenter.Free;
  FRotateAngle.Free;
  FScale.Free;
  FSkew.Free;
  FPosition.Free;
  inherited;
end;

procedure TdxVisualObject.Loaded;
begin
  inherited;
  FLoadCursor := Cursor;
  MatrixChanged(Self);
  if (FChildren <> nil) and (FChildren.Count > 0) then
    Realign;
  if Assigned(FScene) and (FScene.ActiveControl = Self) then
    SetFocus;
end;

procedure TdxVisualObject.PaddingChanged(Sender: TObject);
begin
  if (FParent <> nil) and (FParent.isVisual) then
    TdxVisualObject(FParent).Realign;
end;

procedure TdxVisualObject.MarginsChanged(Sender: TObject);
begin
  Realign;
end;

procedure TdxVisualObject.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('Quanternion', ReadQuaternion, WriteQuaternion, (FQuaternion.ImagPart.X <> 0) or (FQuaternion.ImagPart.Y <> 0) or
    (FQuaternion.ImagPart.Z <> 0) or (FQuaternion.RealPart <> 0));
end;

procedure TdxVisualObject.ReadQuaternion(Reader: TReader);
var
  S: ansistring;
begin
  S := Reader.ReadString;
  try
    GetToken(S, ',()');
    FQuaternion.ImagPart.X := dxStrToFloat(GetToken(S, ',()'));
    FQuaternion.ImagPart.Y := dxStrToFloat(GetToken(S, ',()'));
    FQuaternion.ImagPart.Z := dxStrToFloat(GetToken(S, ',()'));
    FQuaternion.ImagPart.W := 0;
    FQuaternion.RealPart := dxStrToFloat(GetToken(S, ',()'));
  except
  end;
end;

procedure TdxVisualObject.WriteQuaternion(Writer: TWriter);
var
  S: string;
begin
  S := '(' + dxFloatToStr(FQuaternion.ImagPart.X) + ',' + dxFloatToStr(FQuaternion.ImagPart.Y) + ',' + dxFloatToStr(FQuaternion.ImagPart.Z) + ',' + dxFloatToStr(FQuaternion.RealPart) + ')';
  Writer.WriteString(S);
end;

{ matrix }

procedure TdxVisualObject.RotateXChanged(Sender: TObject);
var
  q: TdxQuaternion;
  a: single;
begin
  a := NormalizeDegAngle(RotateAngle.FX - RotateAngle.FSave.X);
  if a <> 0 then
  begin
    q := QuaternionFromAngleAxis(-a, dxVector(1, 0, 0) {AbsoluteRight});
    FQuaternion := QuaternionMultiply(FQuaternion, q);
    MatrixChanged(Sender);
    RotateAngle.FX := NormalizeDegAngle(RotateAngle.FX);
    RotateAngle.FSave.X := RotateAngle.FX;
  end;
end;

procedure TdxVisualObject.RotateYChanged(Sender: TObject);
var
  q: TdxQuaternion;
  a: single;
begin
  a := NormalizeDegAngle(RotateAngle.FY - RotateAngle.FSave.Y);
  if a <> 0 then
  begin
    q := QuaternionFromAngleAxis(a, dxVector(0, 1, 0) {AbsoluteDirection});
    FQuaternion := QuaternionMultiply(FQuaternion, q);
    MatrixChanged(Sender);
    RotateAngle.FY := NormalizeDegAngle(RotateAngle.FY);
    RotateAngle.FSave.Y := RotateAngle.FY;
  end;
end;

procedure TdxVisualObject.RotateZChanged(Sender: TObject);
var
  q: TdxQuaternion;
  a: single;
begin
  a := NormalizeDegAngle(RotateAngle.FZ - RotateAngle.FSave.Z);
  if a <> 0 then
  begin
    q := QuaternionFromAngleAxis(-a, dxVector(0, 0, 1) {AbsoluteUp});
    FQuaternion := QuaternionMultiply(FQuaternion, q);
    MatrixChanged(Sender);
    RotateAngle.FZ := NormalizeDegAngle(RotateAngle.FZ);
    RotateAngle.FSave.Z := RotateAngle.FZ;
  end;
end;

procedure TdxVisualObject.ResetRotateAngle;
begin
  FQuaternion := IdentityQuaternion;
  MatrixChanged(Self);
  RotateAngle.FZ := 0;
  RotateAngle.FSave.Z := 0;
  RotateAngle.FY := 0;
  RotateAngle.FSave.Y := 0;
  RotateAngle.FX := 0;
  RotateAngle.FSave.X := 0;
end;

procedure TdxVisualObject.MatrixChanged(Sender: TObject);
var
  RightVector, DirectionVector, UpVector: TdxVector;
  RotMatrix: TdxMatrix;
begin
  UpVector := dxVector(0, 0, 1);
  DirectionVector := dxVector(0, 1, 0);
  if (FRotateAngle.X <> 0) or (FRotateAngle.Y <> 0) or (FRotateAngle.Z <> 0) then
  begin
    RotMatrix := QuaternionToMatrix(FQuaternion);
    UpVector := dxVectorTransform(UpVector, RotMatrix);
    DirectionVector := dxVectorTransform(DirectionVector, RotMatrix);
  end
  else
  begin
    RotateAngle.FSave := dxVector(0, 0, 0);
    FQuaternion := IdentityQuaternion;
  end;
  RightVector := dxVectorCrossProduct(DirectionVector, UpVector);
  FLocalMatrix.M[0] := dxVectorScale(RightVector, Scale.X);
  FLocalMatrix.m14 := 0;
  FLocalMatrix.M[1] := dxVectorScale(DirectionVector, Scale.Y);
  FLocalMatrix.m24 := 0;
  FLocalMatrix.M[2] := dxVectorScale(UpVector, Scale.Z);
  FLocalMatrix.m34 := 0;
  FLocalMatrix.m41 := FPosition.X;
  FLocalMatrix.m42 := FPosition.Y;
  FLocalMatrix.m43 := FPosition.Z;
  if Projection = dxProjectionScreen then
  begin
    {    FLocalMatrix.m41 := FPosition.X + (Width / 2);
        FLocalMatrix.m42 := FPosition.Y + (Height / 2);}
  end;
  RecalcAbsolute;
  if (FDynamic) and (FBody <> 0) and (FScene <> nil) and (FScene.Physics <> nil) then
  begin
    FScene.Physics.SetBodyMatrix(FBody, AbsoluteMatrix);
  end;
  Repaint;
end;

procedure TdxVisualObject.ProcessTick(time, deltaTime: single);
var
  L: TList;
  M: TdxMatrix;
  V: TdxVector;
begin
  inherited;
  if (FScene.FInvisibleAtRuntime) then
    Exit;

  if FDynamic and (Body <> 0) and (FScene <> nil) and (FScene.Physics <> nil) then
  begin
    { Apply dynamics }
    M := FScene.Physics.GetBodyMatrix(Body);
    FLocalMatrix := M;
    M.M[0] := AbsoluteToLocalVector(dxVector(M.M[0].X, M.M[0].Y, M.M[0].Z, 0));
    M.M[1] := AbsoluteToLocalVector(dxVector(M.M[1].X, M.M[1].Y, M.M[1].Z, 0));
    M.M[2] := AbsoluteToLocalVector(dxVector(M.M[2].X, M.M[2].Y, M.M[2].Z, 0));
    FQuaternion := dxQuaternionFromMatrix(M);
    FPosition.SetVectorNoChange(AbsoluteToLocalVector(dxVector(M.M[3].X, M.M[3].Y, M.M[3].Z, 0)));
    RecalcAbsolute;
  end;
  if not FVelocity.Empty then
  begin
    V := LocalToAbsoluteVector(dxVector(FVelocity.X, FVelocity.Y, FVelocity.Z, 0));
    FPosition.Vector := dxVectorAdd(FPosition.Vector, dxVectorScale(V, deltaTime));
    if ColliseTrack and (Body <> 0) and (FScene <> nil) and (FScene.Physics <> nil) then
    begin
      L := TList.Create;
      AbsoluteMatrix;
      FScene.Physics.Collise(Self, L);
      L.Free;
    end;
  end;
end;

procedure TdxVisualObject.Back;
var
  V: TdxVector;
begin
  if not FVelocity.Empty then
  begin
    V := LocalToAbsoluteVector(FVelocity.Vector);
    FPosition.Vector := dxVectorAdd(FPosition.Vector, dxVectorScale(LocaltoAbsoluteVector(FVelocity.Vector), -FScene.DeltaTime));
  end;
end;

function TdxVisualObject.GetAbsoluteMatrix: TdxMatrix;
var
  S: TdxMatrix;
begin
  if FRecalcAbsolute then
  begin
    if (FParent <> nil) and (FParent is TdxVisualObject) then
      FAbsoluteMatrix := dxMatrixMultiply(FLocalMatrix, TdxVisualObject(FParent).AbsoluteMatrix)
    else
      FAbsoluteMatrix := FLocalMatrix;

    if (FCollider) and (FBody <> 0) and (FScene <> nil) and (FScene.Physics <> nil) then
    begin
      FScene.Physics.SetBodyMatrix(FBody, FAbsoluteMatrix);
    end;

    Result := FAbsoluteMatrix;
    FRecalcAbsolute := false;
    Repaint;
  end
  else
  begin
    Result := FAbsoluteMatrix;
  end;
end;

function TdxVisualObject.GetAbsoluteDirection: TdxVector;
begin
  Result := AbsoluteMatrix.M[1];
end;

function TdxVisualObject.GetAbsoluteRight: TdxVector;
begin
  Result := AbsoluteMatrix.M[0];
end;

function TdxVisualObject.GetAbsoluteUp: TdxVector;
begin
  Result := AbsoluteMatrix.M[2];
end;

function TdxVisualObject.GetAbsolutePosition: TdxVector;
begin
  Result := AbsoluteMatrix.M[3];
end;

procedure TdxVisualObject.SetAbsolutePosition(Value: TdxVector);
begin
  if (Parent <> nil) and (Parent.IsVisual) then
    Position.Vector := AbsoluteToLocalVector(Value)
  else
    Position.Vector := Value;
end;

function TdxVisualObject.GetInvertAbsoluteMatrix: TdxMatrix;
begin
  Result := AbsoluteMatrix;
  InvertMatrix(Result);
end;

function TdxVisualObject.GetScreenBounds: TvxRect;
var
  Pts: array[0..7] of TdxPoint;
  A, B: TdxPoint;
  i: integer;
begin
  Pts[0] := dxPoint(Width / 2, Height / 2, Depth / 2);
  Pts[1] := dxPoint(-Width / 2, Height / 2, Depth / 2);
  Pts[2] := dxPoint(-Width / 2, -Height / 2, Depth / 2);
  Pts[3] := dxPoint(-Width / 2, -Height / 2, -Depth / 2);
  Pts[4] := dxPoint(Width / 2, -Height / 2, Depth / 2);
  Pts[5] := dxPoint(Width / 2, Height / 2, -Depth / 2);
  Pts[6] := dxPoint(Width / 2, -Height / 2, -Depth / 2);
  Pts[7] := dxPoint(-Width / 2, Height / 2, -Depth / 2);
  for i := 0 to High(Pts) do
    Pts[i] := Canvas.WorldToScreen(Projection, LocalToAbsolute(Pts[i]));
  { normalize }
  A := dxPoint($FFFF, $FFFF, $FFFF);
  B := dxPoint(-$FFFF, -$FFFF, -$FFFF);
  for i := 0 to High(Pts) do
  begin
    if Pts[i].X < A.X then
      A.X := Pts[i].X;
    if Pts[i].Y < A.Y then
      A.Y := Pts[i].Y;
    if Pts[i].X > B.X then
      B.X := Pts[i].X;
    if Pts[i].Y > B.Y then
      B.Y := Pts[i].Y;
  end;
  Result := vgRect(A.X, A.Y, B.X, B.Y);
end;

procedure TdxVisualObject.RecalcAbsolute;
var
  i: integer;
  Child: TdxVisualObject;
begin
  FRecalcAbsolute := true;
  if FChildren <> nil then
    for i := 0 to FChildren.Count - 1 do
    begin
      if not TdxObject(FChildren[i]).isVisual then
        Continue;
      Child := FChildren[i];
      TdxVisualObject(Child).RecalcAbsolute;
    end;
end;

function TdxVisualObject.AbsoluteToLocalVector(P: TdxVector): TdxVector;
begin
  Result := dxVectorTransform(P, InvertAbsoluteMatrix);
end;

function TdxVisualObject.LocalToAbsoluteVector(P: TdxVector): TdxVector;
begin
  Result := dxVectorTransform(P, AbsoluteMatrix);
end;

function TdxVisualObject.AbsoluteToLocal(P: TdxPoint): TdxPoint;
var
  V: TdxVector;
begin
  V := dxVector(P.X, P.Y, P.Z);
  V := dxVectorTransform(V, InvertAbsoluteMatrix);
  Result := dxPoint(V.X, V.Y, V.Z);
end;

function TdxVisualObject.LocalToAbsolute(P: TdxPoint): TdxPoint;
var
  V: TdxVector;
begin
  V := dxVector(P.X, P.Y, P.Z);
  V := dxVectorTransform(V, AbsoluteMatrix);
  Result := dxPoint(V.X, V.Y, V.Z);
end;

{ Opacity }

function TdxVisualObject.GetAbsoluteOpacity: single;
begin
  if FRecalcOpacity then
  begin
    if (FParent <> nil) and (FParent is TdxVisualObject) then
      FAbsoluteOpacity := FOpacity * TdxVisualObject(FParent).AbsoluteOpacity
    else
      FAbsoluteOpacity := FOpacity;

    Result := FAbsoluteOpacity;
    FRecalcOpacity := false;
  end
  else
  begin
    Result := FAbsoluteOpacity;
  end;
end;

procedure TdxVisualObject.RecalcOpacity;
var
  i: integer;
  Child: TdxVisualObject;
begin
  FRecalcOpacity := true;
  if FChildren <> nil then
    for i := 0 to FChildren.Count - 1 do
    begin
      if not TdxObject(FChildren[i]).isVisual then
        Continue;
      Child := TdxVisualObject(FChildren[i]);
      TdxVisualObject(Child).RecalcOpacity;
    end;
end;

{ realtime }

procedure TdxVisualObject.RecreateBody;
begin
  if not (Assigned(FScene) and (FScene.DesignTime)) and not FScene.FInvisibleAtRuntime then
  begin
    DestroyBody;
    CreateBody;
  end;
end;

procedure TdxVisualObject.Collision(CollisionObject: TdxVisualObject;
  Point, Normal: TdxVector);
begin
  if Assigned(OnCollision) then
    OnCollision(Self, CollisionObject, Point, Normal);
end;

procedure TdxVisualObject.AddForce(const Force: TdxVector);
begin
  if (FDynamic) and (FScene.Physics <> nil) and (FBody <> 0) and (not FScene.FInvisibleAtRuntime) then
  begin
    FScene.Physics.AddForce(Self, Force);
  end;
end;

procedure TdxVisualObject.Spawn;
var
  i: integer;
begin
  CreateBody;
  if FChildren <> nil then
    for i := 0 to FChildren.Count - 1 do
      if TdxObject(FChildren[i]).isVisual then
        TdxVisualObject(FChildren[i]).Spawn;
end;

procedure TdxVisualObject.CreateBody;
begin
  if (FScene <> nil) and (FScene.Physics = nil) and (not FScene.FInvisibleAtRuntime) then
    FScene.CreatePhysics;
  if (FCollider or FDynamic) and (FScene.Physics <> nil) and (not FScene.FInvisibleAtRuntime) then
  begin
    FBody := FScene.Physics.CreateBox(Self, dxVector(Width, Height, Depth));
  end;
end;

procedure TdxVisualObject.DestroyBody;
begin
  if (FBody <> 0) and (FScene.Physics <> nil) and (not FScene.FInvisibleAtRuntime) then
  begin
    FScene.Physics.DestroyBody(FBody);
  end;
  FBody := 0;
end;

{ methods }

function TdxVisualObject.RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean;
begin
  Result := true;
  Intersection := AbsolutePosition;
end;

function TdxVisualObject.CheckHitTest(const AHitTest: boolean): boolean;
begin
  Result := FHitTest;
  if ((Scene <> nil) and (Scene.FDesignTime)) then
    Result := true;
  if ((Scene <> nil) and (Scene.FDesignTime)) and FLocked then
    Result := false;
  if ((Scene <> nil) and (Scene.FDesignTime)) and FDesignHide then
    Result := false;
end;

function TdxVisualObject.ObjectByPoint(X, Y: single; AProjection: TdxProjection; var Distance: single): TdxVisualObject;
var
  i: integer;
  Obj, NewObj: TdxVisualObject;
  IP, rPos, rDir: TdxVector;
begin
  Result := nil;
  if not Visible and not (Assigned(FScene) and (FScene.DesignTime)) then
    Exit;

  if FChildren <> nil then
    for i := FChildren.Count - 1 downto 0 do
    begin
      if not TdxObject(FChildren[i]).IsVisual then
        Continue;
      Obj := FChildren[i];
      if (not Obj.Visible) and not (Assigned(FScene) and (FScene.DesignTime)) then
        Continue;
      if (Obj.Locked) and (Assigned(FScene) and (FScene.DesignTime)) then
        Continue;
      if FDesignHide and (Assigned(FScene) and (FScene.DesignTime)) then
        Continue;

      NewObj := Obj.ObjectByPoint(X, Y, AProjection, Distance);
      if NewObj <> nil then
      begin
        Result := NewObj;
      end;
    end;

  if Result = nil then
  begin
    Canvas.Pick(X, Y, FProjection, rPos, rDir);
    if CheckHitTest(HitTest) and RayCastIntersect(AbsoluteToLocalVector(rPos), dxVectorNormalize(AbsoluteToLocalVector(rDir)), IP) then
    begin
      if (AProjection = Projection) and (Projection = dxProjectionScreen) and (dxVectorLength(dxVectorSubtract(IP, rPos)) < Distance) then
      begin
        Distance := dxVectorLength(dxVectorSubtract(IP, rPos));
        Result := Self;
      end;
      if (AProjection = Projection) and (Projection = dxProjectionCamera) and (Canvas.FCurrentCamera <> nil) and (dxVectorLength(dxVectorSubtract(IP, Canvas.FCurrentCamera.AbsolutePosition)) < Distance) then
      begin
        Distance := dxVectorLength(dxVectorSubtract(IP, Canvas.FCurrentCamera.AbsolutePosition));
        Result := Self;
      end;
    end;
  end;
end;

function TdxVisualObject.FindTarget(const APoint: TdxPoint; AProjection: TdxProjection; const Data: TdxDragObject; var Distance: single): TdxVisualObject;
var
  i: integer;
  Obj, NewObj: TdxVisualObject;
  IP, rPos, rDir: TdxVector;
  Accept: boolean;
begin
  Result := nil;
  if not Visible and not (Assigned(FScene) and (FScene.DesignTime)) then
    Exit;

  if FChildren <> nil then
    for i := FChildren.Count - 1 downto 0 do
    begin
      if not TdxObject(FChildren[i]).IsVisual then
        Continue;
      Obj := FChildren[i];
      if (not Obj.Visible) and not (Assigned(FScene) and (FScene.DesignTime)) then
        Continue;
      if (Obj.Locked) and (Assigned(FScene) and (FScene.DesignTime)) then
        Continue;
      if FDesignHide and (Assigned(FScene) and (FScene.DesignTime)) then
        Continue;

      NewObj := Obj.FindTarget(APoint, AProjection, Data, Distance);
      if NewObj <> nil then
      begin
        Result := NewObj;
      end;
    end;

  if Result = nil then
  begin
    Canvas.Pick(APoint.X, APoint.Y, FProjection, rPos, rDir);
    if CheckHitTest(HitTest) and RayCastIntersect(AbsoluteToLocalVector(rPos), dxVectorNormalize(AbsoluteToLocalVector(rDir)), IP) then
    begin
      if (AProjection = Projection) and (Projection = dxProjectionScreen) and (dxVectorLength(dxVectorSubtract(IP, rPos)) < Distance) then
      begin
        Distance := dxVectorLength(dxVectorSubtract(IP, rPos));
        Accept := false;
        DragOver(Data, AbsoluteToLocal(APoint), Accept);
        if Accept then
          Result := Self;
      end;
      if (AProjection = Projection) and (Projection = dxProjectionCamera) and (Canvas.FCurrentCamera <> nil) and (dxVectorLength(dxVectorSubtract(IP, Canvas.FCurrentCamera.AbsolutePosition)) < Distance) then
      begin
        Distance := dxVectorLength(dxVectorSubtract(IP, Canvas.FCurrentCamera.AbsolutePosition));
        Accept := false;
        DragOver(Data, AbsoluteToLocal(APoint), Accept);
        if Accept then
          Result := Self;
      end;
    end;
  end;
end;

function TdxVisualObject.GetCanvas: TdxCanvas;
begin
  if FTempCanvas <> nil then
    Result := FTempCanvas
  else
    if FScene <> nil then
    Result := FScene.Canvas
  else
    Result := nil;
end;

procedure TdxVisualObject.PreRender;
var
  i: integer;
begin
  if FChildren <> nil then
    for i := 0 to FChildren.Count - 1 do
      if TdxObject(FChildren[i]).isVisual then
        TdxVisualObject(FChildren[i]).PreRender;
end;

procedure TdxVisualObject.BeforePaint;
begin
  if Assigned(OnBeforePaint) then
    OnBeforePaint(Self, Canvas);
end;

procedure TdxVisualObject.AfterPaint;
begin
end;

procedure TdxVisualObject.ApplyResource;
var
  i: integer;
begin
  if FChildren <> nil then
    for i := 0 to FChildren.Count - 1 do
      if TdxObject(FChildren[i]).isVisual then
        TdxVisualObject(FChildren[i]).ApplyResource;
end;

procedure TdxVisualObject.Paint;
begin

end;

procedure TdxVisualObject.PaintToVxBitmap(ABitmap: TvxBitmap; AWidth, AHeight: integer;
  ClearColor: TdxColor; AutoFit: boolean = false);
var
  B: TvxBitmap;
  D: TdxBitmap;
  FillR, R: TvxRect;
  i, j: integer;
  ratio: single;
begin
  if AutoFit then
  begin
    { Render to bitmap }
    B := TvxBitmap.Create(1, 1);
    PaintToVxBitmap(B, AWidth, AHeight, 0, false); // - render with alpha
    { calc best size }
    R := vgRect(B.Width, B.Height, 0, 0);
    for i := 0 to B.Width - 1 do
      for j := 0 to B.Height - 1 do
      begin
        if TvxColorRec(B.Scanline[j][i]).A > 0 then
        begin
          if i < R.Left then
            R.Left := i;
          if j < R.Top then
            R.Top := j;
          if i > R.Right then
            R.Right := i;
          if j > R.Bottom then
            R.Bottom := j;
        end;
      end;
    FillR := R;
    ratio := vgFitRect(R, vgRect(0, 0, AWidth, AHeight));
    if (ratio > 0) and (ratio < 1) then
    begin
      ABitmap.SetSize(AWidth, AHeight);
      // render again to better size
      PaintToVxBitmap(B, round(AWidth / ratio), round(AHeight / ratio), 0, false);
      { calc again }
      R := vgRect(B.Width, B.Height, 0, 0);
      for i := 0 to B.Width - 1 do
        for j := 0 to B.Height - 1 do
        begin
          if TvxColorRec(B.Scanline[j][i]).A > 0 then
          begin
            if i < R.Left then
              R.Left := i;
            if j < R.Top then
              R.Top := j;
            if i > R.Right then
              R.Right := i;
            if j > R.Bottom then
              R.Bottom := j;
          end;
        end;
      FillR := R;
      ratio := vgFitRect(FillR, vgRect(0, 0, AWidth, AHeight));
      ABitmap.Clear(vgCorrectColor(ClearColor));
      ABitmap.Canvas.DrawBitmap(B, vgRect(R.left, R.top, R.left + vgRectWidth(R), R.top + vgRectHeight(FillR)), FillR, 1, true);
    end;
    B.Free;
  end
  else
  begin
    D := TdxBitmap.Create(1, 1);
    PaintToBitmap(D, AWidth, AHeight, ClearColor); // - render with alpha
    ABitmap.Assign(D);
    D.Free;
  end;
end;

procedure TdxVisualObject.PaintToBitmap(ABitmap: TdxBitmap; AWidth, AHeight: integer; ClearColor: TdxColor);
var
  i: integer;
  FitR, R: TvxRect;
  S, T: TdxMatrix;
  scale: single;
begin
  R := ScreenBounds;
  if vgIsRectempty(R) then
    Exit;
  FitR := R;
  if AWidth > MaxBitmapSize then
    AWidth := MaxBitmapSize;
  if AHeight > MaxBitmapSize then
    AHeight := MaxBitmapSize;
  scale := 1 / vgFitRect(FitR, vgRect(0, 0, AWidth, AHeight));

  ABitmap.SetSize(round(vgRectWidth(R) * scale), round(vgRectHeight(R) * scale));
  if Assigned(FScene) then
  begin
    S := IdentityMatrix;
    S.m11 := FScene.Height / vgRectHeight(R);
    S.m22 := S.m11;

    T := IdentityMatrix;
    T.m41 := ({OffsetX + }((FScene.Width / 2) - ((R.Left + R.Right) / 2))) / vgRectWidth(R) * 2;
    T.m42 := -({OffsetY + }((FScene.Height / 2) - ((R.Top + R.Bottom) / 2))) / vgRectHeight(R) * 2;
    ABitmap.Canvas.FPaintToMatrix := dxMatrixMultiply(S, T);
    ABitmap.Canvas.CreateRenderStateList(rs3DScene);
  end;

  TempCanvas := ABitmap.Canvas;
  try
    if Assigned(FScene) then
    begin
      // clone camera and lights
      Canvas.Reset;
      Canvas.Lighting := FScene.FLighting;
      Canvas.Ambient := FScene.FAmbient;
      { set matrix and camera }
      Canvas.FCurrentCameraMatrix := FScene.Canvas.FCurrentCameraMatrix;
      Canvas.FCurrentCameraInvMatrix := FScene.Canvas.FCurrentCameraInvMatrix;
      { set lights }
      if FScene.FChildren <> nil then
        for i := 0 to FScene.FChildren.Count - 1 do
        begin
          if not (TObject(FScene.FChildren[i]) is TdxVisualObject) then
            Continue;
          if not TdxVisualObject(FScene.FChildren[i]).Visible then
            Continue;
          Canvas.SetMatrix(TdxVisualObject(FScene.FChildren[i]).AbsoluteMatrix);
          TdxVisualObject(FScene.FChildren[i]).TempCanvas := Canvas;
          TdxVisualObject(FScene.FChildren[i]).PreRender;
        end;
    end;
    // render
    if Canvas.BeginScene then
    begin
      Canvas.SetRenderState(rsGouraud);
      Canvas.SetRenderState(rs3DScene);
      Canvas.SetRenderState(rsZWriteOn);
      Canvas.SetRenderState(rsLightOn);
      Canvas.SetRenderState(rsTexLinear);
      Canvas.SetRenderState(rsFrontFace);
      Canvas.SetMatrix(AbsoluteMatrix);
      Canvas.Clear(ClearColor);
      if FZWrite then
        Canvas.SetRenderState(rsZWriteOn)
      else
        Canvas.SetRenderState(rsZWriteOff);
      if Projection = dxProjectionCamera then
        Canvas.SetRenderState(rs3DScene)
      else
        Canvas.SetRenderState(rs2DScene);
      if TwoSide then
        Canvas.SetRenderState(rsAllFace)
      else
        Canvas.SetRenderState(rsFrontFace);
      BeforePaint;
      Paint;
      if Assigned(OnPaint) then
        OnPaint(Self, Canvas);
      AfterPaint;
      PaintChildren;
      Canvas.FlushBuffer;
    end;
    if Assigned(FScene) then
    begin
      { reset lights }
      if FScene.FChildren <> nil then
        for i := 0 to FScene.FChildren.Count - 1 do
        begin
          if not (TObject(FScene.FChildren[i]) is TdxVisualObject) then
            Continue;
          if not TdxVisualObject(FScene.FChildren[i]).Visible then
            Continue;
          TdxVisualObject(FScene.FChildren[i]).TempCanvas := nil;
        end;
    end;
  finally
    TempCanvas := nil;
  end;
end;

procedure TdxVisualObject.CreateTileSnapshot(ABitmap: TdxBitmap; AWidth, AHeight, OffsetX, OffsetY: integer; Scale: single; ClearColor: TdxColor);
var
  i: integer;
  FitR, R: TvxRect;
  S, T: TdxMatrix;
begin
  R := ScreenBounds;
  if vgIsRectEmpty(R) then
    Exit;
  FitR := vgRect(R.left * Scale, R.Top * Scale, R.Right * Scale, R.Bottom * Scale);
  if AWidth > MaxBitmapSize then
    AWidth := MaxBitmapSize;
  if AHeight > MaxBitmapSize then
    AHeight := MaxBitmapSize;
  vgRectCenter(FitR, vgRect(0, 0, AWidth, AHeight));

  ABitmap.SetSize(AWidth, AHeight);
  if Assigned(FScene) then
  begin
    S := IdentityMatrix;
    S.m11 := Min(FScene.Height / AHeight, (FScene.Width / AWidth)) * Scale;
    S.m22 := S.m11;

    T := IdentityMatrix;
    T.m41 := (((-FitR.Left - offsetx) / Scale) + ((FScene.Width / 2) - ((R.Left + R.Right) / 2))) / AWidth * 2 * Scale;
    T.m42 := -(((-FitR.Top - offsety) / Scale) + ((FScene.Height / 2) - ((R.Top + R.Bottom) / 2))) / AHeight * 2 * Scale;
    ABitmap.Canvas.FPaintToMatrix := dxMatrixMultiply(S, T);
    ABitmap.Canvas.CreateRenderStateList(rs3DScene);
  end;

  TempCanvas := ABitmap.Canvas;
  try
    if Assigned(FScene) then
    begin
      // clone camera and lights
      Canvas.Reset;
      Canvas.Lighting := FScene.FLighting;
      Canvas.Ambient := FScene.FAmbient;
      { set matrix and camera }
      Canvas.FCurrentCameraMatrix := FScene.Canvas.FCurrentCameraMatrix;
      Canvas.FCurrentCameraInvMatrix := FScene.Canvas.FCurrentCameraInvMatrix;
      { set lights }
      if FScene.FChildren <> nil then
        for i := 0 to FScene.FChildren.Count - 1 do
        begin
          if not (TObject(FScene.FChildren[i]) is TdxVisualObject) then
            Continue;
          if not TdxVisualObject(FScene.FChildren[i]).Visible then
            Continue;
          Canvas.SetMatrix(TdxVisualObject(FScene.FChildren[i]).AbsoluteMatrix);
          TdxVisualObject(FScene.FChildren[i]).TempCanvas := Canvas;
          TdxVisualObject(FScene.FChildren[i]).PreRender;
        end;
    end;
    // render
    if Canvas.BeginScene then
    begin
      Canvas.SetRenderState(rsGouraud);
      Canvas.SetRenderState(rs3DScene);
      Canvas.SetRenderState(rsZWriteOn);
      Canvas.SetRenderState(rsLightOn);
      Canvas.SetRenderState(rsTexLinear);
      Canvas.SetRenderState(rsFrontFace);
      Canvas.SetMatrix(AbsoluteMatrix);
      Canvas.Clear(ClearColor);
      if FZWrite then
        Canvas.SetRenderState(rsZWriteOn)
      else
        Canvas.SetRenderState(rsZWriteOff);
      if Projection = dxProjectionCamera then
        Canvas.SetRenderState(rs3DScene)
      else
        Canvas.SetRenderState(rs2DScene);
      if TwoSide then
        Canvas.SetRenderState(rsAllFace)
      else
        Canvas.SetRenderState(rsFrontFace);
      BeforePaint;
      Paint;
      if Assigned(OnPaint) then
        OnPaint(Self, Canvas);
      AfterPaint;
      PaintChildren;
      Canvas.FlushBuffer;
    end;
    if Assigned(FScene) then
    begin
      { reset lights }
      if FScene.FChildren <> nil then
        for i := 0 to FScene.FChildren.Count - 1 do
        begin
          if not (TObject(FScene.FChildren[i]) is TdxVisualObject) then
            Continue;
          if not TdxVisualObject(FScene.FChildren[i]).Visible then
            Continue;
          TdxVisualObject(FScene.FChildren[i]).TempCanvas := nil;
        end;
    end;
    ABitmap.NeedUpdate := true;
  finally
    TempCanvas := nil;
  end;
end;

procedure TdxVisualObject.CreateHighQualitySnapshot(ABitmap: TvxBitmap; AWidth, AHeight: integer; ClearColor: TdxColor; Quality: integer);
const
  TileSize = 512;
var
  i, j: integer;
  Sample, VTile: TvxBitmap;
  Tile: TdxBitmap;
  Obj: TdxVisualObject;
  R, FitR, TileR: TvxRect;
  factor: single;
begin
  if Quality < 1 then
    Quality := 1;
  if Quality > 16 then
    Quality := 16;
  R := ScreenBounds;
  FitR := R;
  factor := vgFitRect(FitR, vgRect(0, 0, AWidth, AHeight));
  if factor < 1 then
  begin
    R := vgRect(R.Left / factor, R.Top / factor, R.Right / factor, R.Bottom / factor);
    vgRectCenter(R, vgRect(0, 0, AWidth, AHeight));
  end
  else
    R := FitR;
  Sample := TvxBitmap.Create(round(vgRectWidth(R) * Quality), round(vgRectHeight(R) * Quality));
  Tile := TdxBitmap.Create(TileSize, TileSize);
  VTile := TvxBitmap.Create(TileSize, TileSize);
  for i := 0 to Sample.Width div TileSize do
    for j := 0 to Sample.Height div TileSize do
    begin
      CreateTileSnapshot(Tile, TileSize, TileSize, i * TileSize, j * TileSize, Quality / factor, ClearColor);
      VTile.Assign(Tile);
      TileR := vgRect(0, 0, TileSize, TileSize);
      vgOffsetRect(TileR, i * TileSize, j * TileSize);
      Sample.Canvas.DrawBitmap(VTile, vgRect(0, 0, TileSize, TileSize), TileR, 1, true);
    end;

  ABitmap.SetSize(AWidth, AHeight);
  ABitmap.Canvas.DrawBitmap(Sample, vgRect(0, 0, Sample.Width, Sample.Height), R, 1);

  VTile.Free;
  Tile.Free;
  Sample.Free;
end;

procedure TdxVisualObject.PaintChildren;
var
  i, j: integer;
  R: TvxRect;
begin
  if FChildren <> nil then
    for i := 0 to FChildren.Count - 1 do
      if TdxObject(FChildren[i]).IsVisual and
        ((TdxVisualObject(FChildren[i]).Visible) or
        (not TdxVisualObject(FChildren[i]).Visible and (Assigned(FScene) and (FScene.DesignTime)) and not TdxVisualObject(FChildren[i]).Locked)) then
      begin
        with TdxVisualObject(FChildren[i]) do
        begin
          if (Assigned(FScene) and (FScene.DesignTime)) and FDesignHide then
            Continue;

          FScene := Self.FScene;
          if (Abs(Scale.X) < 0.01) or (Abs(Scale.Y) < 0.01) then
            Continue;

          if FZWrite then
            Canvas.SetRenderState(rsZWriteOn)
          else
            Canvas.SetRenderState(rsZWriteOff);
          if Projection = dxProjectionCamera then
            Canvas.SetRenderState(rs3DScene)
          else
            Canvas.SetRenderState(rs2DScene);
          if TwoSide then
            Canvas.SetRenderState(rsAllFace)
          else
            Canvas.SetRenderState(rsFrontFace);

          Canvas.SetMatrix(AbsoluteMatrix);
          BeforePaint;
          Paint;
          if Assigned(FOnPaint) then
            FOnPaint(TdxVisualObject(Self.FChildren[i]), Canvas);
          AfterPaint;
          PaintChildren;

          // design selection
          if (dxDesigner <> nil) and (Assigned(Self.Scene)) and (Self.FChildren[i] <> Scene.Selected) and
            (dxDesigner.IsSelected(Self.Scene.Owner, TdxVisualObject(Self.FChildren[i]))) then
          begin
            Canvas.SetMatrix(AbsoluteMatrix);
            Canvas.Material.Diffuse := '#B200CC5A';
            Canvas.SetRenderState(rsGouraud);
            Canvas.SetRenderState(rsZWriteOn);
            Canvas.SetRenderState(rsLightOff);
            Canvas.SetRenderState(rsTexDisable);
            Canvas.DrawCube(dxVector(0, 0, 0), dxVector(Width + 0.01, Height + 0.01, Depth + 0.01), 0.4);
          end;
          if not FDragDisableHighlight and (IsDragOver) then
          begin
            Canvas.SetMatrix(AbsoluteMatrix);
            Canvas.Material.Diffuse := '#B2005ACC';
            Canvas.SetRenderState(rsGouraud);
            Canvas.SetRenderState(rsZWriteOn);
            Canvas.SetRenderState(rsLightOff);
            Canvas.SetRenderState(rsTexDisable);
            Canvas.FillCube(dxVector(0, 0, 0), dxVector(Width + 0.01, Height + 0.01, Depth + 0.01), 0.4);
          end;
          {$IFDEF DRAWFOCUSED}
          if CanFocused and FIsFocused then
          begin
            Canvas.SetMatrix(AbsoluteMatrix);
            Canvas.Material.Diffuse := '#CFFF0000';
            Canvas.SetRenderState(rsGouraud);
            Canvas.SetRenderState(rsZWriteOn);
            Canvas.SetRenderState(rsLightOff);
            Canvas.SetRenderState(rsTexDisable);
            Canvas.FillCube(dxVector(0, 0, 0), dxVector(Width + 0.01, Height + 0.01, Depth + 0.01), 0.1);
          end;
          {$ENDIF}
        end;
      end;
end;

procedure TdxVisualObject.Repaint;
begin
  if not Visible then
    Exit;
  if FScene = nil then
    Exit;
  if not (Assigned(FScene) and (FScene.DesignTime)) and FScene.RealTime then
    Exit;
  if csDestroying in ComponentState then
    Exit;
  FScene.AddUpdateRect(vgRect(0, 0, 0, 0));
end;

procedure TdxVisualObject.Lock;
var
  i: integer;
begin
  Locked := true;
  if FChildren <> nil then
    for i := 0 to FChildren.Count - 1 do
      if TdxObject(FChildren[i]).isVisual then
        TdxVisualObject(FChildren[i]).Lock;
end;

{ bounds }

{ }

procedure TdxVisualObject.DesignSelect;
begin

end;

procedure TdxVisualObject.DesignClick;
begin

end;

procedure TdxVisualObject.Realign;
var
  i: integer;
  R: TdxBox;
  AlignList: TList;

  function InsertBefore(C1, C2: TdxVisualObject; AAlign: TdxAlign): Boolean;
  begin
    Result := False;
    case AAlign of
      dxTop: Result := C1.Position.Y < C2.Position.Y;
      dxBottom: Result := (C1.Position.Y + C1.Height) >= (C2.Position.Y + C2.Height);
      dxLeft, dxMostLeft: Result := C1.Position.X < C2.Position.X;
      dxRight, dxMostRight: Result := (C1.Position.X + C1.Width) >= (C2.Position.X + C2.Width);
    end;
  end;

  procedure DoPosition(Control: TdxVisualObject; AAlign: TdxAlign; AlignInfo: TdxAlignInfo);
  var
    NewNear, NewLeft, NewTop, NewWidth, NewHeight, NewDepth: single;
    ParentSize: TPoint;
  begin
    if not Control.Visible then
      Exit;
    with R do
    begin
      NewWidth := Right - Left;
      if (NewWidth < 0) or (AAlign in [dxLeft, dxRight, dxVertical, dxMostLeft, dxMostRight, dxTopLeft, dxTopRight, dxBottomLeft, dxBottomRight]) then
        NewWidth := Control.Width + Control.Padding.Left + Control.Padding.Right;
      NewHeight := Bottom - Top;
      if (NewHeight < 0) or (AAlign in [dxTop, dxBottom, dxHorizontal, dxTopLeft, dxTopRight, dxBottomLeft, dxBottomRight]) then
        NewHeight := Control.Height + Control.Padding.Top + Control.Padding.Bottom;
      NewDepth := Far - Near;
      if (NewDepth < 0) then
        NewDepth := Control.Depth + Control.Padding.zNear + Control.Padding.zFar;
      NewLeft := Left + ((Control.Width) / 2);
      NewTop := Top + ((Control.Height) / 2);
      NewNear := Near + (Control.Depth / 2);
      if (AAlign in [dxVertical]) then
        NewLeft := Control.Position.X + Control.Padding.Left;
      if (AAlign in [dxHorizontal]) then
        NewTop := Control.Position.Y + Control.Padding.Top;
      case AAlign of
        dxTop:
          begin
            Top := Top + NewHeight;
          end;
        dxBottom:
          begin
            Bottom := Bottom - NewHeight;
            NewTop := Bottom + (Control.Height / 2);
          end;
        dxLeft, dxMostLeft:
          Left := Left + NewWidth;
        dxRight, dxMostRight:
          begin
            Right := Right - NewWidth;
            NewLeft := Right + (Control.Width / 2);
          end;
        dxContents:
          begin
            NewLeft := 0;
            NewTop := 0;
            NewNear := 0;
            NewWidth := Width;
            NewHeight := Height;
            NewDepth := Depth;
            Control.FPosition.FX := NewLeft + Control.Padding.Left / 2 - Control.Padding.Right / 2;
            Control.FPosition.FY := NewTop + Control.Padding.Top / 2 - Control.Padding.Bottom / 2;
            Control.FPosition.FZ := NewNear + Control.Padding.zNear / 2 - Control.Padding.zFar / 2;
            Control.FWidth := NewWidth - Control.Padding.Left - Control.Padding.Right;
            Control.FHeight := NewHeight - Control.Padding.Top - Control.Padding.Bottom;
            Control.FDepth := NewDepth - Control.Padding.zNear - Control.Padding.zFar;
            Control.MatrixChanged(Self);
            Control.Realign;
            Exit;
          end;
        dxCenter:
          begin
            NewLeft := Left + Trunc((NewWidth - (Control.Width + Control.Padding.Left + Control.Padding.Right)) / 2);
            NewWidth := (Control.Width + Control.Padding.Left + Control.Padding.Right);
            NewTop := Top + Trunc((NewHeight - (Control.Height + Control.Padding.Top + Control.Padding.Bottom)) / 2);
            NewHeight := (Control.Height + Control.Padding.Top + Control.Padding.Bottom);
            NewNear := Near + Trunc((NewDepth - (Control.Depth + Control.Padding.zNear + Control.Padding.zFar)) / 2);
            NewDepth := (Control.Depth + Control.Padding.zNear + Control.Padding.zFar);
          end;
        dxTopRight:
          begin
            Control.Position.X := Control.Position.X + ((FWidth - FLastWidth) / 2);
            Control.Position.Y := Control.Position.Y - ((FHeight - FLastHeight) / 2);
            Exit;
          end;
        dxTopLeft:
          begin
            Control.Position.X := Control.Position.X - ((FWidth - FLastWidth) / 2);
            Control.Position.Y := Control.Position.Y - ((FHeight - FLastHeight) / 2);
            Exit;
          end;
        dxBottomLeft:
          begin
            Control.Position.X := Control.Position.X - ((FWidth - FLastWidth) / 2);
            Control.Position.Y := Control.Position.Y + ((FHeight - FLastHeight) / 2);
            Exit;
          end;
        dxBottomRight:
          begin
            Control.Position.X := Control.Position.X + ((FWidth - FLastWidth) / 2);
            Control.Position.Y := Control.Position.Y + ((FHeight - FLastHeight) / 2);
            Exit;
          end;
      end;
    end;

    if (AALign = dxScale) then
    begin
      if (FLastWidth > 0) and (FLastHeight > 0) and (FLastDepth > 0) and (FWidth > 0) and (FHeight > 0) and (FDepth > 0) then
      begin
        Control.FPosition.FX := Control.FPosition.X * (FWidth / FLastWidth);
        Control.FPosition.FY := Control.FPosition.Y * (FHeight / FLastHeight);
        Control.FPosition.FZ := Control.FPosition.Z * (FDepth / FLastDepth);
        Control.FWidth := Control.FWidth * (FWidth / FLastWidth);
        Control.FHeight := Control.FHeight * (FHeight / FLastHeight);
        Control.FDepth := Control.FDepth * (FDepth / FLastDepth);
        Control.MatrixChanged(Self);
        Control.Realign;
      end;
      Exit;
    end
    else
    begin
      Control.FPosition.FX := NewLeft + Control.Padding.Left;
      Control.FPosition.FY := NewTop + Control.Padding.Top;
      Control.FPosition.FZ := NewNear + Control.Padding.zNear;
      if (Control.FWidth <> NewWidth - Control.Padding.Left - Control.Padding.Right) or
        (Control.FHeight <> NewHeight - Control.Padding.Top - Control.Padding.Bottom) or
        (Control.FDepth <> NewDepth - Control.Padding.zNear - Control.Padding.zFar) then
      begin
        Control.FWidth := NewWidth - Control.Padding.Left - Control.Padding.Right;
        Control.FHeight := NewHeight - Control.Padding.Top - Control.Padding.Bottom;
        Control.FDepth := NewDepth - Control.Padding.zNear - Control.Padding.zFar;
        Control.Realign;
      end;
      Control.MatrixChanged(Self);
    end;

    if (Control.Width + Control.Padding.Left + Control.Padding.Right <> NewWidth) or
      (Control.Height + Control.Padding.Top + Control.Padding.Bottom <> NewHeight) or
      (Control.Depth + Control.Padding.zNear + Control.Padding.zFar <> NewDepth) then
      with R do
        case AAlign of
          dxTop:
            Top := Top - (NewHeight - (Control.Height + Control.Padding.Left + Control.Padding.Right));
          dxBottom:
            Bottom := Bottom + (NewHeight - (Control.Height + Control.Padding.Top + Control.Padding.Bottom));
          dxLeft:
            Left := Left - (NewWidth - (Control.Width + Control.Padding.Left + Control.Padding.Right));
          dxRight:
            Right := Right + (NewWidth - (Control.Width + Control.Padding.Top + Control.Padding.Bottom));
          dxClient:
            begin
              Right := Right + NewWidth - (Control.Width + Control.Padding.Left + Control.Padding.Right);
              Bottom := Bottom + NewHeight - (Control.Height + Control.Padding.Top + Control.Padding.Bottom);
              Far := Far + NewDepth - (Control.Depth + Control.Padding.zNear + Control.Padding.zFar);
            end;
        end;
  end;

  procedure DoAlign(AAlign: TdxAlign);
  var
    I, J: Integer;
    Control: TdxVisualObject;
    AlignInfo: TdxAlignInfo;
  begin
    AlignList.Clear;
    for I := 0 to FChildren.Count - 1 do
    begin
      if not TdxObject(FChildren[i]).isVisual then
        Continue;
      Control := TdxVisualObject(FChildren[i]);
      if (Control.Align = AAlign) and ((AAlign = dxNone) or (Control.Visible) or
        (Assigned(FScene) and (FScene.DesignTime))) then
      begin
        J := 0;
        while (J < AlignList.Count) and not InsertBefore(Control, TdxVisualObject(AlignList[J]), AAlign) do
          Inc(J);
        AlignList.Insert(J, Control);
      end;
    end;
    for I := 0 to AlignList.Count - 1 do
    begin
      AlignInfo.AlignList := AlignList;
      AlignInfo.ControlIndex := I;
      AlignInfo.Align := AAlign;
      DoPosition(TdxVisualObject(AlignList[I]), AAlign, AlignInfo);
    end;
  end;

  {  function AlignWork: Boolean;
    var
      I: Integer;
    begin
      Result := True;
      for I := ControlCount - 1 downto 0 do
        if (Controls[I].Align <> alNone) or
          (Controls[I].Anchors <> [akLeft, akTop]) then Exit;
      Result := False;
    end;}

const
  AllowAlign: boolean = true;
  NeedAlign: boolean = false;
  NeedLayerAlign: boolean = false;
begin
  if csDestroying in ComponentState then
    Exit;
  if ((FWidth > -0.2) and (FWidth < 0.2)) or ((FHeight > -0.2) and (FHeight < 0.2)) {or ((FDepth > -0.2) and (FDepth < 0.2)) } then
    Exit;
  if FDisableAlign then
    Exit;
  if csLoading in ComponentState then
  begin
    FLastWidth := FWidth;
    FLastHeight := FHeight;
    FLastDepth := FDepth;
    Exit;
  end;
  if FChildren = nil then
    Exit;
  if FChildren.Count = 0 then
    Exit;

  FDisableAlign := true;
  try
    for i := 0 to FChildren.Count - 1 do
    begin
      if TdxObject(FChildren[i]).isVisual and (TdxVisualObject(FChildren[i]).Align <> dxNone) then
      begin
        NeedAlign := true;
      end;
      if (TdxObject(FChildren[i]) is TdxCustomLayer) and (TdxCustomLayer(FChildren[i]).LayerAlign <> dxLayerNone) then
      begin
        NeedLayerAlign := true;
      end;
    end;
    if NeedLayerAlign then
      RealignLayers;
    if NeedAlign then
    begin
      if AllowAlign then
      begin
        R.Left := -FWidth / 2;
        R.Top := -FHeight / 2;
        R.Near := -FDepth / 2;
        R.Right := FWidth / 2;
        R.Bottom := FHeight / 2;
        R.Far := FDepth / 2;
        AlignList := TList.Create;
        try
          DoAlign(dxScale);
          DoAlign(dxContents);
          DoAlign(dxMostLeft);
          DoAlign(dxMostRight);
          DoAlign(dxTop);
          DoAlign(dxBottom);
          DoAlign(dxLeft);
          DoAlign(dxRight);
          DoAlign(dxClient);
          DoAlign(dxHorizontal);
          DoAlign(dxVertical);
          DoAlign(dxContents);
          DoAlign(dxCenter);
          // Move anchored controls
          DoAlign(dxTopLeft);
          DoAlign(dxTopRight);
          DoAlign(dxBottomLeft);
          DoAlign(dxBottomRight);
        finally
          AlignList.Free;
        end;
      end;
      FLastWidth := FWidth;
      FLastHeight := FHeight;
      FLastDepth := FDepth;
      Repaint;
    end;
  finally
    FDisableAlign := false;
  end;
end;

procedure TdxVisualObject.RealignLayers;
var
  i: integer;
  R, FullR: TvxRect;
  AlignList: TList;

  function InsertBefore(C1, C2: TdxCustomLayer; AAlign: TdxLayerAlign): Boolean;
  begin
    Result := False;
    case AAlign of
      dxLayerTop, dxLayerMostTop: Result := (C1.Position.Y - (C1.Height / 2)) < (C2.Position.Y - (C2.Height / 2));
      dxLayerBottom, dxLayerMostBottom: Result := (C1.Position.Y + (C1.Height / 2)) >= (C2.Position.Y + (C2.Height / 2));
      dxLayerLeft, dxLayerMostLeft: Result := (C1.Position.X - (C1.Width / 2)) < (C2.Position.X - (C2.Width / 2));
      dxLayerRight, dxLayerMostRight: Result := (C1.Position.X + (C1.Width / 2)) >= (C2.Position.X + (C2.Width / 2));
    end;
  end;

  procedure DoPosition(Control: TdxCustomLayer; AAlign: TdxLayerAlign);
  var
    NewLeft, NewTop, NewWidth, NewHeight: single;
    cR, mR: TvxRect;
    fitScale: single;
  begin
    if not Control.Visible and not FScene.Designtime then
      Exit;
    with R do
    begin
      NewWidth := Right - Left;
      if (NewWidth < 0) or (AAlign in [dxLayerLeft, dxLayerRight, dxLayerMostLeft, dxLayerMostRight]) then
        NewWidth := Control.Width { + Control.Padding.Left + Control.Padding.Right};
      NewHeight := Bottom - Top;
      if (NewHeight < 0) or (AAlign in [dxLayerTop, dxLayerBottom, dxLayerMostTop, dxLayerMostBottom]) then
        NewHeight := Control.Height { + Control.Padding.Top + Control.Padding.Bottom};
      NewLeft := Left;
      NewTop := Top;
      case AAlign of
        dxLayerTop, dxLayerMostTop:
          Top := Top + NewHeight;
        dxLayerBottom, dxLayerMostBottom:
          begin
            Bottom := Bottom - NewHeight;
            NewTop := Bottom;
          end;
        dxLayerLeft, dxLayerMostLeft:
          Left := Left + NewWidth;
        dxLayerRight, dxLayerMostRight:
          begin
            Right := Right - NewWidth;
            NewLeft := Right;
          end;
        dxLayerCenter:
          begin
            NewLeft := Left + ((NewWidth - (Control.Width)) / 2);
            NewWidth := (Control.Width);
            NewTop := Top + ((NewHeight - (Control.Height)) / 2);
            NewHeight := (Control.Height);
          end;
        dxLayerContents:
          begin
            NewLeft := 0;
            NewWidth := FullR.Right - FullR.Left;
            NewTop := 0;
            NewHeight := FullR.Bottom - FullR.Top;
          end;
      end;
    end;

    if (Control.Width <> NewWidth) or (Control.Height <> NewHeight) then
    begin
      Control.Width := NewWidth;
      Control.Height := NewHeight;
    end;
    Control.Position.FX := NewLeft + (NewWidth / 2);
    Control.Position.FY := NewTop + (NewHeight / 2);
    Control.MatrixChanged(Self);
    if Control.FChildren <> nil then
      Realign;

    { Adjust client rect if control didn't resize as we expected }
    if (Control.Width <> NewWidth) or (Control.Height <> NewHeight) then
      with R do
        case AAlign of
          dxLayerTop, dxLayerMostTop:
            Top := Top - (NewHeight - (Control.Height));
          dxLayerBottom, dxLayerMostBottom:
            Bottom := Bottom + (NewHeight - (Control.Height));
          dxLayerLeft, dxLayerMostLeft:
            Left := Left - (NewWidth - (Control.Width));
          dxLayerRight, dxLayerMostRight:
            Right := Right + (NewWidth - (Control.Width));
          dxLayerClient:
            begin
              Right := Right + NewWidth - (Control.Width);
              Bottom := Bottom + NewHeight - (Control.Height);
            end;
        end;
  end;

  procedure DoAlign(AAlign: TdxLayerAlign);
  var
    I, J: Integer;
    Control: TdxCustomLayer;
  begin
    AlignList.Clear;
    for I := 0 to ChildrenCount - 1 do
    begin
      if not (Children[i] is TdxCustomLayer) then
        Continue;
      Control := TdxCustomLayer(Children[i]);
      if (Control.LayerAlign = AAlign) and ((AAlign = dxLayerNone) or (Control.Visible) or FScene.FDesignTime) and
        (Control.Projection = dxProjectionScreen) then
      begin
        J := 0;
        while (J < AlignList.Count) and not InsertBefore(Control, TdxCustomLayer(AlignList[J]), AAlign) do
          Inc(J);
        AlignList.Insert(J, Control);
      end;
    end;
    for I := 0 to AlignList.Count - 1 do
    begin
      DoPosition(TdxCustomLayer(AlignList[I]), AAlign);
    end;
  end;

begin
  if FScene = nil then
    Exit;
  if ChildrenCount = 0 then
    Exit;

  if Self is TdxCustomLayer then
    R := vgRect(-Width / 2, -Height / 2, Width / 2, Height / 2)
  else
    R := vgRect(0, 0, FScene.Width, FScene.Height);
  FullR := R;
  AlignList := TList.Create;
  try
    DoAlign(dxLayerMostTop);
    DoAlign(dxLayerMostBottom);
    DoAlign(dxLayerMostLeft);
    DoAlign(dxLayerMostRight);
    DoAlign(dxLayerTop);
    DoAlign(dxLayerBottom);
    DoAlign(dxLayerLeft);
    DoAlign(dxLayerRight);
    DoAlign(dxLayerClient);
    DoAlign(dxLayerCenter);
    DoAlign(dxLayerContents);
  finally
    AlignList.Free;
  end;
end;

{ events }

procedure TdxVisualObject.KeyDown(var Key: Word; var KeyChar: System.WideChar;
  Shift: TShiftState);
begin
  if Assigned(FOnKeyDown) then
    FOnKeyDown(Key, KeyChar, Shift);
end;

procedure TdxVisualObject.KeyUp(var Key: Word; var KeyChar: System.WideChar;
  Shift: TShiftState);
begin
  if Assigned(FOnKeyUp) then
    FOnKeyUp(Key, KeyChar, Shift);
end;

procedure TdxVisualObject.Capture;
begin
  if (FScene <> nil) then
  begin
    FScene.FCaptured := Self;
    FScene.MouseCapture := true;
  end;
end;

procedure TdxVisualObject.ReleaseCapture;
begin
  if (FScene <> nil) then
  begin
    FScene.FCaptured := nil;
    FScene.MouseCapture := false;
  end;
end;

procedure TdxVisualObject.MouseEnter;
begin
  FIsMouseOver := true;
  StartTriggerAnimation(Self, 'IsMouseOver');
  Repaint;
end;

procedure TdxVisualObject.MouseLeave;
begin
  FIsMouseOver := false;
  StartTriggerAnimation(Self, 'IsMouseOver');
  Repaint;
end;

procedure TdxVisualObject.EnterFocus;
begin
  FIsFocused := true;
  Repaint;
  StartTriggerAnimation(Self, 'IsFocused');
end;

procedure TdxVisualObject.KillFocus;
begin
  FIsFocused := false;
  Repaint;
  StartTriggerAnimation(Self, 'IsFocused');
end;

procedure TdxVisualObject.SetFocus;
begin
  if not CanFocused then
    Exit;

  if not FIsFocused and (FScene <> nil) and (FScene.Focused <> Self) then
  begin
    FScene.Focused := Self;
  end;
end;

procedure TdxVisualObject.GetTabOrderList(const AList: TList);
var
  i: integer;
begin
  if IsVisual and Visual.Visible then
    AList.Add(Self);
  if FChildren <> nil then
    for i := 0 to FChildren.Count - 1 do
      if TdxObject(FChildren[i]).IsVisual and (TdxVisualObject(FChildren[i]).Visible) then
      begin
        TdxVisualObject(FChildren[i]).GetTabOrderList(AList);
      end;
end;

procedure TdxVisualObject.ContextMenu(const ScreenPosition: TvxPoint);
begin
  if FPopupMenu <> nil then
  begin
    FPopupMenu.PopupComponent := Self;
    FPopupMenu.Popup(round(ScreenPosition.X), round(ScreenPosition.Y));
  end;
end;

procedure TdxVisualObject.Click;
begin
  if Assigned(FOnClick) then
    FOnClick(Self);
end;

procedure TdxVisualObject.DblClick;
begin
  if Assigned(FOnDblClick) then
    FOnDblClick(Self);
end;

procedure TdxVisualObject.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: single; rayPos, rayDir: TdxVector);
var
  P: TPoint;
  VP: TdxPoint;
begin
  if (FDragMode = dxDragAutomatic) and Assigned(FScene) then
  begin
    FScene.BeginVCLDrag(Self);
    Exit;
  end;
  if (ssDouble in Shift) and (Assigned(FScene) and (FScene.DesignTime)) then
    FScene.FDesignRoot := Self;
  if (Assigned(FScene) and not (FScene.DesignTime)) and CanFocused and not FIsFocused and (FScene <> nil) and (FScene.Focused <> Self) then
    SetFocus;
  if Assigned(FOnMouseDown) then
    FOnMouseDown(Self, Button, Shift, X, Y, rayPos, rayDir);
  if (Button = mbRight) and FShowContextMenu then
  begin
    VP := LocalToAbsolute(dxPoint(X, Y, 0));
    P := Point(Trunc(VP.X), Trunc(VP.Y));
    P := Scene.ClientToScreen(P);
    ContextMenu(vgPoint(P.X, P.Y));
    Exit;
  end;
  if FAutoCapture then
    Capture;
  if (ssDouble in Shift) then
  begin
    DblClick;
    FDoubleClick := true;
  end
  else
    if Button = mbLeft then
  begin
    FPressed := true;
  end;
end;

procedure TdxVisualObject.MouseMove(Shift: TShiftState; X, Y, Dx, Dy: single; rayPos, rayDir: TdxVector);
begin
  if Assigned(FOnMouseMove) then
    FOnMouseMove(Self, Shift, X, Y, rayPos, rayDir);
end;

procedure TdxVisualObject.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: single; rayPos, rayDir: TdxVector);
begin
  if FAutoCapture then
    ReleaseCapture;
  if FPressed and not (FDoubleClick) and (FIsMouseOver) then
  begin
    FPressed := false;
    Click;
  end;
  if Assigned(FOnMouseUp) then
    FOnMouseUp(Self, Button, Shift, X, Y, rayPos, rayDir);
end;

procedure TdxVisualObject.MouseWheel(Shift: TShiftState; WheelDelta: integer; var Handled: boolean);
begin
  if Assigned(FOnMouseWheel) then
    if FScene <> nil then
      FOnMouseWheel(Self, Shift, WheelDelta, FScene.FMousePos, Handled)
    else
      FOnMouseWheel(Self, Shift, WheelDelta, dxPoint(0, 0, 0), Handled);
end;

procedure TdxVisualObject.DragEnter(const Data: TdxDragObject; const Point: TdxPoint);
begin
  FIsDragOver := true;
  Repaint;
  StartTriggerAnimation(Self, 'IsDragOver');
  if Assigned(OnDragEnter) then
    OnDragEnter(Self, Data, Point);
end;

procedure TdxVisualObject.DragLeave;
begin
  FIsDragOver := false;
  Repaint;
  StartTriggerAnimation(Self, 'IsDragOver');
  if Assigned(OnDragLeave) then
    OnDragLeave(Self);
end;

procedure TdxVisualObject.DragEnd;
begin
  // Call mouse up - for effects - inside control
  if DragMode = dxDragAutomatic then
    MouseUp(mbLeft, [ssLeft], $FFFF, $FFFF, dxVector($FFFF, $FFFF, 0), dxVector(1, 0, 0));
  if Assigned(OnDragEnd) then
    OnDragEnd(Self);
end;

function TdxVisualObject.DoHintShow(var Message: {$IFDEF FPC}TLMessage{$ELSE}TMessage{$ENDIF}): boolean;
begin
  Result := false;
end;

procedure TdxVisualObject.DragOver(const Data: TdxDragObject; const Point: TdxPoint; var Accept: Boolean);
begin
  if Assigned(OnDragOver) then
    OnDragOver(Self, Data, Point, Accept);
end;

procedure TdxVisualObject.DragDrop(const Data: TdxDragObject; const Point: TdxPoint);
begin
  FIsDragOver := false;
  Repaint;
  StartTriggerAnimation(Self, 'IsDragOver');
  if Assigned(OnDragDrop) then
    OnDragDrop(Self, Data, Point);
end;

{ properties }

procedure TdxVisualObject.SetTempCanvas(const Value: TdxCanvas);
var
  i: integer;
begin
  FTempCanvas := Value;
  if (FChildren <> nil) and (FChildren.Count > 0) then
    for i := 0 to FChildren.Count - 1 do
      if TdxObject(FChildren[i]).isVisual then
        TdxVisualObject(FChildren[i]).TempCanvas := Value;
end;

procedure TdxVisualObject.SetHitTest(const Value: boolean);
begin
  FHitTest := Value;
end;

procedure TdxVisualObject.SetClipChildren(const Value: boolean);
begin
  if FClipChildren <> Value then
  begin
    FClipChildren := Value;
    Repaint;
  end;
end;

procedure TdxVisualObject.SetAlign(const Value: TdxAlign);
begin
  if FAlign <> Value then
  begin
    FAlign := Value;
    if (FParent <> nil) and (TdxObject(FParent).IsVisual) then
    begin
      TdxVisualObject(FParent).Realign;
    end;
  end;
end;

procedure TdxVisualObject.SetProjection(const Value: TdxProjection);
var
  i: integer;
begin
  if FProjection <> Value then
  begin
    FProjection := Value;
    if FChildren <> nil then
      for i := 0 to FChildren.Count - 1 do
        if TdxObject(FChildren[i]).IsVisual then
          TdxVisualObject(FChildren[i]).Projection := Value;
    Repaint;
  end;
end;

procedure TdxVisualObject.SetCollider(const Value: boolean);
begin
  if FCollider <> Value then
  begin
    FCollider := Value;
    RecreateBody;
  end;
end;

procedure TdxVisualObject.SetDynamic(const Value: boolean);
begin
  if FDynamic <> Value then
  begin
    FDynamic := Value;
    RecreateBody;
  end;
end;

procedure TdxVisualObject.SetVisible(const Value: boolean);
begin
  if FVisible <> Value then
  begin
    FVisible := Value;
    if FVisible then
    begin
      if (Self is TdxCustomLayer) and (TdxCustomLayer(Self).LayerAlign <> dxLayerNone) and (Parent <> nil) and Parent.IsVisual and not (csLoading in ComponentState) then
        Parent.Visual.Realign;
      StartTriggerAnimation(Self, 'IsVisible');
    end;
  end;
end;

procedure TdxVisualObject.SetHeight(const Value: single);
begin
  if FHeight <> Value then
  begin
    FHeight := Value;
    if (FHeight < 0) and (Assigned(FScene) and (FScene.DesignTime)) then
    begin
      FHeight := Abs(FHeight);
      FScale.Y := -FScale.Y;
    end;
    if not (csLoading in ComponentState) then
    begin
      if (Parent <> nil) and (Parent.IsVisual) and (Align <> dxNone) then
      begin
        TdxVisualObject(Parent).Realign;
      end;
      if FChildren <> nil then
        Realign;
      Repaint;
    end;
    if (FBody <> 0) and (FScene <> nil) and (FScene.Physics <> nil) then
      RecreateBody;
  end;
end;

procedure TdxVisualObject.SetWidth(const Value: single);
begin
  if FWidth <> Value then
  begin
    FWidth := Value;
    if (FWidth < 0) and (Assigned(FScene) and (FScene.DesignTime)) then
    begin
      FWidth := Abs(FWidth);
      FScale.X := -FScale.X;
    end;
    if not (csLoading in ComponentState) then
    begin
      if (Parent <> nil) and (Parent.IsVisual) and (Align <> dxNone) then
      begin
        TdxVisualObject(Parent).Realign;
      end;
      if FChildren <> nil then
        Realign;
      Repaint;
    end;
    if (FBody <> 0) and (FScene <> nil) and (FScene.Physics <> nil) then
      RecreateBody;
  end;
end;

procedure TdxVisualObject.SetDepth(const Value: single);
begin
  if FDepth <> Value then
  begin
    FDepth := Value;
    if (FDepth < 0) and (Assigned(FScene) and (FScene.DesignTime)) then
    begin
      FDepth := Abs(FDepth);
      FScale.Z := -FScale.Z;
    end;
    if not (csLoading in ComponentState) then
    begin
      if (Parent <> nil) and (Parent.IsVisual) and (Align <> dxNone) then
      begin
        TdxVisualObject(Parent).Realign;
      end;
      if FChildren <> nil then
        Realign;
      Repaint;
    end;
    if (FBody <> 0) and (FScene <> nil) and (FScene.Physics <> nil) then
      RecreateBody;
  end;
end;

function TdxVisualObject.isOpacityStored: Boolean;
begin
  Result := FOpacity <> 1;
  Result := true;
end;

procedure TdxVisualObject.SetZWrite(const Value: boolean);
begin
  if FZWrite <> Value then
  begin
    FZWrite := Value;
    Repaint;
  end;
end;

procedure TdxVisualObject.SetDesignHide(const Value: boolean);
begin
  if FDesignHide <> Value then
  begin
    FDesignHide := Value;
    if (Assigned(FScene) and (FScene.DesignTime)) then
      Repaint;
  end;
end;

procedure TdxVisualObject.SetOpacity(const Value: single);
var
  i: integer;
begin
  if FOpacity <> Value then
  begin
    FOpacity := Value;
    if FOpacity < 0 then
      FOpacity := 0;
    if FOpacity > 1 then
      FOpacity := 1;
    RecalcOpacity;
    Repaint;
  end;
end;

{ TdxCamera ===================================================================}

constructor TdxCamera.Create(AOwner: TComponent);
var
  i: integer;
  M: TdxVisualObject;
  Mesh: TdxMesh;
  S: TStream;
begin
  inherited;
  HitTest := false;
  FCanResize := false;
  Position.Point := dxPoint(0, -10, 0);

  {  S := TStringStream.Create(CameraMesh);
    try
      M := TdxVisualObject(CreateObjectFromStream(Self, S));
      if M <> nil then
      begin
        M.Locked := true;
        M.RotateAngle.Z := -90;
        M.Parent := Self;
        M.Stored := false;
        for i := 0 to M.FChildren.Count - 1 do
          if TdxObject(M.FChildren[i]) is TdxMesh then
            TdxMesh(M.FChildren[i]).Material.Lighting := false;
        M.Scale.Vector := dxVector(0.5, 0.5, 0.5);
      end;
    except
    end;
    S.Free;}
end;

destructor TdxCamera.Destroy;
begin
  inherited;
end;

procedure TdxCamera.DesignClick;
begin
  inherited;
  if FScene <> nil then
  begin
    if FSaveCamera = nil then
    begin
      FSaveCamera := FScene.FDesignCamera;
      FScene.FDesignCamera := Self;
      Repaint;
    end
    else
    begin
      FScene.FDesignCamera := FSaveCamera;
      FSaveCamera := nil;
    end;
  end;
end;

procedure TdxCamera.Paint;
begin
  if Tag = $FFFE then
    Exit;
  if (Assigned(FScene) and (FScene.DesignTime)) then
  begin
    //    TdxVisualObject(FChildren[0]).Visible := true;
    Canvas.SetRenderState(rsLightOff);
    Canvas.Material.Bitmap := '';
    Canvas.Material.Lighting := false;
    Canvas.Material.NativeDiffuse := $FF60A799;
    Canvas.FillCube(dxVector(0, 0, 0), dxVector(0.8, 0.8, 0.8), 1);
    Canvas.Material.NativeDiffuse := $FF9C60A7;
    Canvas.FillCube(dxVector(0, 0.5, 0), dxVector(0.3, 1.4, 0.3), 1);
    Canvas.DrawLine(dxVector(0, 0, 0), dxVectorScale(dxVector(0, 1, 0), 1000), 1);
    Canvas.SetRenderState(rsLightOn);
  end
    {  else
        TdxVisualObject(FChildren[0]).Visible := false;}
end;

function TdxCamera.RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean;
var
  ip: TdxVector;
  p: array[0..5] of TdxVector;
  CubeSize: TdxVector;
  r: TdxVector;
  i: Integer;
  t, e: Single;
  eSize: TdxVector;
begin
  Result := false;
  if not (Assigned(FScene) and (FScene.DesignTime)) then
    Exit;
  Result := RayCastIntersectsSphere(RayPos, RayDir, dxVector(0, 0, 0), 1);
  Intersection := AbsolutePosition;
end;

procedure TdxCamera.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FTarget) then
  begin
    FTarget := nil;
    MatrixChanged(Self);
  end;
end;

procedure TdxCamera.SetTarget(const Value: TdxVisualObject);
begin
  FTarget := Value;
end;

{ TdxLight ====================================================================}

constructor TdxLight.Create(AOwner: TComponent);
begin
  inherited;
  HitTest := false;
  FEnabled := true;
  FCanResize := false;
end;

destructor TdxLight.Destroy;
begin
  inherited;
end;

procedure TdxLight.PreRender;
begin
  inherited;
  { set light }
  if Enabled and (Canvas <> nil) then
    Canvas.SetLight(Self);
end;

procedure TdxLight.Paint;
var
  i: integer;
begin
  if (Assigned(FScene) and (FScene.DesignTime)) then
  begin
    Canvas.SetRenderState(rsLightOff);
    Canvas.Material.NativeDiffuse := $FFFFFFFF;
    Canvas.Material.Bitmap := '';
    Canvas.Material.Lighting := false;
    Canvas.FillCube(dxVector(0, 0, 0), dxVector(0.8, 0.8, 0.8), 1);
    case LightType of
      dxLightDirectional:
        begin
          Canvas.DrawLine(dxVector(0, 0, 0), dxVectorScale(dxVector(0, 1, 0), 5), 1);
        end;
      dxLightPoint:
        begin
          for i := 1 to 18 do
            Canvas.DrawLine(dxVector(0, 0, 0), dxVectorScale(dxVector(cos(DegToRad(i * 20)), sin(DegToRad(i * 20)), 0), 2), 1);
          for i := 1 to 18 do
            Canvas.DrawLine(dxVector(0, 0, 0), dxVectorScale(dxVector(cos(DegToRad(i * 20)), 0, sin(DegToRad(i * 20))), 2), 1);
        end;
      dxLightSpot:
        begin
          Canvas.DrawLine(dxVector(0, 0, 0), dxVectorScale(dxVectorNormalize(dxVector(0.2, 1, -0.2)), 5), 1);
          Canvas.DrawLine(dxVector(0, 0, 0), dxVectorScale(dxVectorNormalize(dxVector(0.2, 1, 0.2)), 5), 1);
          Canvas.DrawLine(dxVector(0, 0, 0), dxVectorScale(dxVectorNormalize(dxVector(-0.2, 1, 0.2)), 5), 1);
          Canvas.DrawLine(dxVector(0, 0, 0), dxVectorScale(dxVectorNormalize(dxVector(-0.2, 1, -0.2)), 5), 1);
        end;
    end;
    Canvas.SetRenderState(rsLightOn);
  end;
end;

function TdxLight.RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean;
var
  ip: TdxVector;
  p: array[0..5] of TdxVector;
  CubeSize: TdxVector;
  r: TdxVector;
  i: Integer;
  t, e: Single;
  eSize: TdxVector;
begin
  Result := false;
  if not (Assigned(FScene) and (FScene.DesignTime)) then
    Exit;
  e := 0.5 + 0.001; //Small value for floating point imprecisions
  CubeSize.V[0] := Width;
  CubeSize.V[1] := Height;
  CubeSize.V[2] := Depth;
  eSize.V[0] := Width * e;
  eSize.V[1] := Height * e;
  eSize.V[2] := Depth * e;
  p[0] := XHmgVector;
  p[1] := YHmgVector;
  p[2] := ZHmgVector;
  p[3] := dxVector(-1, 0, 0);
  p[4] := dxVector(0, -1, 0);
  p[5] := dxVector(0, 0, -1);
  for i := 0 to 5 do
  begin
    if dxVectorDotProduct(p[i], RayDir) > 0 then
    begin
      t := -(p[i].V[0] * RayPos.V[0] + p[i].V[1] * RayPos.V[1] + p[i].V[2] * RayPos.V[2] + 0.5 * CubeSize.V[i mod 3])
        / (p[i].V[0] * RayDir.V[0] + p[i].V[1] * RayDir.V[1] + p[i].V[2] * RayDir.V[2]);
      r := dxVector(RayPos.V[0] + t * RayDir.V[0], RayPos.V[1] + t * RayDir.V[1], RayPos.V[2] + t * RayDir.V[2]);
      if (Abs(r.V[0]) <= eSize.V[0]) and (Abs(r.V[1]) <= eSize.V[1]) and (Abs(r.V[2]) <= eSize.V[2]) and
        (dxVectorDotProduct(dxVectorSubtract(r, RayPos), RayDir) > 0) then
      begin
        Intersection := dxVector(LocalToAbsolute(dxPoint(r)));
        Result := true;
        Exit;
      end;
    end;
  end;
  Result := false;
end;

procedure TdxLight.SetLightType(const Value: TdxLightType);
begin
  FLightType := Value;
end;

{ TdxDummy ====================================================================}

constructor TdxDummy.Create(AOwner: TComponent);
begin
  inherited;
  HitTest := false;
end;

destructor TdxDummy.Destroy;
begin
  inherited;
end;

procedure TdxDummy.Paint;
begin
  if Tag = $FFFE then
    Exit;

  if ((FScene <> nil) and (FScene.DesignTime)) and not Locked then
  begin
    Canvas.Material.NativeDiffuse := $8060A799;
    Canvas.DrawCube(dxVector(0, 0, 0), dxVector(Width, Height, Depth), AbsoluteOpacity);
  end;
end;

function TdxDummy.RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean;
var
  ip: TdxVector;
  p: array[0..5] of TdxVector;
  CubeSize: TdxVector;
  r: TdxVector;
  i: Integer;
  t, e: Single;
  eSize: TdxVector;
begin
  Result := false;
  if not (Assigned(FScene) and (FScene.DesignTime)) then
    Exit;
  e := 0.5 + 0.001; //Small value for floating point imprecisions
  CubeSize.V[0] := Width;
  CubeSize.V[1] := Height;
  CubeSize.V[2] := Depth;
  eSize.V[0] := Width * e;
  eSize.V[1] := Height * e;
  eSize.V[2] := Depth * e;
  p[0] := XHmgVector;
  p[1] := YHmgVector;
  p[2] := ZHmgVector;
  p[3] := dxVector(-1, 0, 0);
  p[4] := dxVector(0, -1, 0);
  p[5] := dxVector(0, 0, -1);
  for i := 0 to 5 do
  begin
    if dxVectorDotProduct(p[i], RayDir) > 0 then
    begin
      t := -(p[i].V[0] * RayPos.V[0] + p[i].V[1] * RayPos.V[1] + p[i].V[2] * RayPos.V[2] + 0.5 * CubeSize.V[i mod 3])
        / (p[i].V[0] * RayDir.V[0] + p[i].V[1] * RayDir.V[1] + p[i].V[2] * RayDir.V[2]);
      r := dxVector(RayPos.V[0] + t * RayDir.V[0], RayPos.V[1] + t * RayDir.V[1], RayPos.V[2] + t * RayDir.V[2]);
      if (Abs(r.V[0]) <= eSize.V[0]) and (Abs(r.V[1]) <= eSize.V[1]) and (Abs(r.V[2]) <= eSize.V[2]) and
        (dxVectorDotProduct(dxVectorSubtract(r, RayPos), RayDir) > 0) then
      begin
        Intersection := dxVector(LocalToAbsolute(dxPoint(r)));
        Result := true;
        Exit;
      end;
    end;
  end;
  Result := false;
end;

{ TdxProxyObject }

constructor TdxProxyObject.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TdxProxyObject.Destroy;
begin
  inherited;
end;

procedure TdxProxyObject.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FSourceObject) then
    SourceObject := nil;
end;

procedure TdxProxyObject.Paint;
var
  SaveM: TdxMatrix;
  SaveS: TdxVector;
begin
  if FSourceObject <> nil then
  begin
    SaveM := FSourceObject.FAbsoluteMatrix;
    SaveS.X := FSourceObject.FWidth;
    SaveS.Y := FSourceObject.FHeight;
    SaveS.Z := FSourceObject.FDepth;
    FSourceObject.FAbsoluteMatrix := AbsoluteMatrix;
    FSourceObject.FWidth := FWidth;
    FSourceObject.FHeight := FHeight;
    FSourceObject.FDepth := FDepth;
    //    FSourceObject.RecalcAbsolute;
    FSourceObject.BeforePaint;
    FSourceObject.Paint;
    FSourceObject.AfterPaint;
    FSourceObject.PaintChildren;
    FSourceObject.FAbsoluteMatrix := SaveM;
    FSourceObject.FWidth := SaveS.X;
    FSourceObject.FHeight := SaveS.Y;
    FSourceObject.FDepth := SaveS.Z;
    //    FSourceObject.RecalcAbsolute;
  end;
end;

function TdxProxyObject.RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean;
var
  ip: TdxVector;
  p: array[0..5] of TdxVector;
  CubeSize: TdxVector;
  r: TdxVector;
  i: Integer;
  t, e: Single;
  eSize: TdxVector;
begin
  Result := false;
  if (Assigned(FScene) and (FScene.DesignTime)) then
    Exit;
  e := 0.5 + 0.001; //Small value for floating point imprecisions
  CubeSize.V[0] := Width;
  CubeSize.V[1] := Height;
  CubeSize.V[2] := Depth;
  eSize.V[0] := Width * e;
  eSize.V[1] := Height * e;
  eSize.V[2] := Depth * e;
  p[0] := XHmgVector;
  p[1] := YHmgVector;
  p[2] := ZHmgVector;
  p[3] := dxVector(-1, 0, 0);
  p[4] := dxVector(0, -1, 0);
  p[5] := dxVector(0, 0, -1);
  for i := 0 to 5 do
  begin
    if dxVectorDotProduct(p[i], RayDir) > 0 then
    begin
      t := -(p[i].V[0] * RayPos.V[0] + p[i].V[1] * RayPos.V[1] + p[i].V[2] * RayPos.V[2] + 0.5 * CubeSize.V[i mod 3])
        / (p[i].V[0] * RayDir.V[0] + p[i].V[1] * RayDir.V[1] + p[i].V[2] * RayDir.V[2]);
      r := dxVector(RayPos.V[0] + t * RayDir.V[0], RayPos.V[1] + t * RayDir.V[1], RayPos.V[2] + t * RayDir.V[2]);
      if (Abs(r.V[0]) <= eSize.V[0]) and (Abs(r.V[1]) <= eSize.V[1]) and (Abs(r.V[2]) <= eSize.V[2]) and
        (dxVectorDotProduct(dxVectorSubtract(r, RayPos), RayDir) > 0) then
      begin
        Intersection := dxVector(LocalToAbsolute(dxPoint(r)));
        Result := true;
        Exit;
      end;
    end;
  end;
  Result := false;
end;

procedure TdxProxyObject.SetSourceObject(const Value: TdxVisualObject);
begin
  if FSourceObject <> Value then
  begin
    FSourceObject := Value;
    Repaint;
  end;
end;

{ TdxCustomLayer }

constructor TdxCustomLayer.Create(AOwner: TComponent);
begin
  inherited;
  TwoSide := true;

  Width := 4;
  Depth := 3;
  Height := 1;
end;

destructor TdxCustomLayer.Destroy;
begin
  inherited;
end;

procedure TdxCustomLayer.BeforePaint;
begin
  inherited;
end;

procedure TdxCustomLayer.Paint;
begin
end;

function TdxCustomLayer.RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean;
var
  ip: TdxVector;
  p: array[0..5] of TdxVector;
  CubeSize: TdxVector;
  r: TdxVector;
  i: Integer;
  t, e: Single;
  eSize: TdxVector;
begin
  Result := false;
  e := 0.5 + 0.003; // Small value for floating point imprecisions
  CubeSize.V[0] := Width;
  CubeSize.V[1] := Height;
  CubeSize.V[2] := Depth;
  eSize.V[0] := Width * e;
  eSize.V[1] := Height * e;
  eSize.V[2] := Depth * e;
  p[0] := XHmgVector;
  p[1] := YHmgVector;
  p[2] := ZHmgVector;
  p[3] := dxVector(-1, 0, 0);
  p[4] := dxVector(0, -1, 0);
  p[5] := dxVector(0, 0, -1);
  for i := 0 to 5 do
  begin
    if dxVectorDotProduct(p[i], RayDir) > 0 then
    begin
      t := -(p[i].V[0] * RayPos.V[0] + p[i].V[1] * RayPos.V[1] + p[i].V[2] * RayPos.V[2] + 0.5 * CubeSize.V[i mod 3])
        / (p[i].V[0] * RayDir.V[0] + p[i].V[1] * RayDir.V[1] + p[i].V[2] * RayDir.V[2]);
      r := dxVector(RayPos.V[0] + t * RayDir.V[0], RayPos.V[1] + t * RayDir.V[1], RayPos.V[2] + t * RayDir.V[2]);
      if (Abs(r.V[0]) <= eSize.V[0]) and (Abs(r.V[1]) <= eSize.V[1]) and (Abs(r.V[2]) <= eSize.V[2]) and
        (dxVectorDotProduct(dxVectorSubtract(r, RayPos), RayDir) > 0) then
      begin
        Intersection := dxVector(LocalToAbsolute(dxPoint(r)));
        Result := true;
        Break;
      end;
    end;
  end;
  // calc for captured - bacause mouse can be inside layer
  if not Result and (Scene <> nil) and (Scene.FCaptured = Self) then
  begin
    e := 0.5 + 0.003; // Small value for floating point imprecisions
    CubeSize.V[0] := Width * 10;
    CubeSize.V[1] := Height * 10;
    CubeSize.V[2] := Depth * 10;
    eSize.V[0] := Width * 10 * e;
    eSize.V[1] := Height * 10 * e;
    eSize.V[2] := Depth * 10 * e;
    p[0] := XHmgVector;
    p[1] := YHmgVector;
    p[2] := ZHmgVector;
    p[3] := dxVector(-1, 0, 0);
    p[4] := dxVector(0, -1, 0);
    p[5] := dxVector(0, 0, -1);
    for i := 0 to 5 do
    begin
      if dxVectorDotProduct(p[i], RayDir) > 0 then
      begin
        t := -(p[i].V[0] * RayPos.V[0] + p[i].V[1] * RayPos.V[1] + p[i].V[2] * RayPos.V[2] + 0.5 * CubeSize.V[i mod 3])
          / (p[i].V[0] * RayDir.V[0] + p[i].V[1] * RayDir.V[1] + p[i].V[2] * RayDir.V[2]);
        r := dxVector(RayPos.V[0] + t * RayDir.V[0], RayPos.V[1] + t * RayDir.V[1], RayPos.V[2] + t * RayDir.V[2]);
        if (Abs(r.V[0]) <= eSize.V[0]) and (Abs(r.V[1]) <= eSize.V[1]) and (Abs(r.V[2]) <= eSize.V[2]) and
          (dxVectorDotProduct(dxVectorSubtract(r, RayPos), RayDir) > 0) then
        begin
          Intersection := dxVector(LocalToAbsolute(dxPoint(r)));
          Result := true;
          Exit;
        end;
      end;
    end;
  end;
end;

procedure TdxCustomLayer.MouseMove(Shift: TShiftState; X, Y, Dx,
  Dy: single; rayPos, rayDir: TdxVector);
var
  P3, rPos, rDir: TdxVector;
begin
  inherited;
  if FDisableLayerEvent then
    Exit;
  if Projection = dxProjectionCamera then
  begin
    if RayCastIntersect(rayPos, rayDir, P3) then
    begin
      P3 := AbsoluteToLocalVector(P3);
      X := (((P3.x + (Width / 2)) / Width) * Width);
      Y := (((-P3.z + (Depth / 2)) / Depth) * Depth);
    end
    else
      Exit;
  end
  else
  begin
    if RayCastIntersect(rayPos, rayDir, P3) then
    begin
      P3 := AbsoluteToLocalVector(P3);
      X := (((P3.x + (Width / 2)) / Width) * Width);
      Y := (((P3.y + (Height / 2)) / Height) * Height);
    end
    else
      Exit;
  end;
  LayerMouseMove(Shift, X, Y);
end;

procedure TdxCustomLayer.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: single; rayPos, rayDir: TdxVector);
var
  P3, rPos, rDir: TdxVector;
begin
  inherited;
  if FDisableLayerEvent then
    Exit;
  if Projection = dxProjectionCamera then
  begin
    if RayCastIntersect(rayPos, rayDir, P3) then
    begin
      P3 := AbsoluteToLocalVector(P3);
      X := (((P3.x + (Width / 2)) / Width) * Width);
      Y := (((-P3.z + (Depth / 2)) / Depth) * Depth);
    end
    else
      Exit;
  end
  else
  begin
    if RayCastIntersect(rayPos, rayDir, P3) then
    begin
      P3 := AbsoluteToLocalVector(P3);
      X := (((P3.x + (Width / 2)) / Width) * Width);
      Y := (((P3.y + (Height / 2)) / Height) * Height);
    end
    else
      Exit;
  end;
  LayerMouseDown(Button, Shift, X, Y);
end;

procedure TdxCustomLayer.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: single; rayPos, rayDir: TdxVector);
var
  P3, rPos, rDir: TdxVector;
begin
  inherited;
  if FDisableLayerEvent then
    Exit;
  if Projection = dxProjectionCamera then
  begin
    if RayCastIntersect(rayPos, rayDir, P3) then
    begin
      P3 := AbsoluteToLocalVector(P3);
      X := (((P3.x + (Width / 2)) / Width) * Width);
      Y := (((-P3.z + (Depth / 2)) / Depth) * Depth);
    end;
  end
  else
  begin
    if RayCastIntersect(rayPos, rayDir, P3) then
    begin
      P3 := AbsoluteToLocalVector(P3);
      X := (((P3.x + (Width / 2)) / Width) * Width);
      Y := (((P3.y + (Height / 2)) / Height) * Height);
    end;
  end;
  LayerMouseUp(Button, Shift, X, Y);
end;

procedure TdxCustomLayer.LayerMouseMove(Shift: TShiftState; X, Y: single);
begin
  if Assigned(FOnLayerMouseMove) then
    FOnLayerMouseMove(Self, Shift, trunc(X), trunc(Y));
end;

procedure TdxCustomLayer.LayerMouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: single);
begin
  if Assigned(FOnLayerMouseDown) then
    FOnLayerMouseDown(Self, Button, Shift, trunc(X), trunc(Y));
end;

procedure TdxCustomLayer.LayerMouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: single);
begin
  if Assigned(FOnLayerMouseUp) then
    FOnLayerMouseUp(Self, Button, Shift, trunc(X), trunc(Y));
end;

procedure TdxCustomLayer.SetWidth(const Value: single);
begin
  inherited SetWidth(Value);
end;

procedure TdxCustomLayer.SetDepth(const Value: single);
begin
  if Projection = dxProjectionCamera then
  begin
    inherited SetDepth(Value);
  end
  else
    inherited SetDepth(Value);
end;

procedure TdxCustomLayer.SetHeight(const Value: single);
begin
  if Projection = dxProjectionCamera then
    inherited SetHeight(Value)
  else
  begin
    inherited SetHeight(Value);
  end;
end;

procedure TdxCustomLayer.SetLayerAlign(const Value: TdxLayerAlign);
begin
  if FLayerAlign <> Value then
  begin
    FLayerAlign := Value;
    if (Parent <> nil) and (Parent.IsVisual) then
      Parent.Visual.Realign;
  end;
end;

{ TdxCustomBufferLayer }

constructor TdxCustomBufferLayer.Create(AOwner: TComponent);
const
  Res = 2;
var
  x, y: integer;
  s, xx, yy: single;
begin
  inherited;
  TwoSide := true;

  FResolution := 60;
  FModulationColor := $FFFFFFFF;
  Width := 4;
  Depth := 3;
  Height := 1;

  FPlane := TdxMeshData.Create;
  SetLength(FPlane.MeshVertices, Res * Res);
  for y := 0 to Res - 1 do
    for x := 0 to Res - 1 do
    begin
      {      xx := (-0.5 + (x / (Res - 1))) * 4;
            yy := (-0.5 + (y / (Res - 1))) * 4;
            s := -sin(xx * xx + yy * yy) * 0.5;}
      s := 0;
      FPlane.MeshVertices[x + (y * Res)] := TexVertexNormal(-0.5 + (x / (Res - 1)), s, -0.5 + (y / (Res - 1)), 0, -1, 0, (x / (Res - 1)), 1 - (y / (Res - 1)));
    end;
  SetLength(FPlane.MeshIndices, Res * Res * 6);
  for y := 0 to Res - 2 do
    for x := 0 to Res - 2 do
    begin
      FPlane.MeshIndices[(x + (y * Res)) * 6 + 0] := x + (y * Res);
      FPlane.MeshIndices[(x + (y * Res)) * 6 + 2] := x + 1 + (y * Res);
      FPlane.MeshIndices[(x + (y * Res)) * 6 + 1] := x + ((y + 1) * Res);
      FPlane.MeshIndices[(x + (y * Res)) * 6 + 3] := x + ((y + 1) * Res);
      FPlane.MeshIndices[(x + (y * Res)) * 6 + 5] := x + 1 + (y * Res);
      FPlane.MeshIndices[(x + (y * Res)) * 6 + 4] := x + 1 + ((y + 1) * Res);
    end;
  FPlane.CalcNormals;

  FPlaneScreen := TdxMeshData.Create;
  SetLength(FPlaneScreen.MeshVertices, Res * Res);
  for y := 0 to Res - 1 do
    for x := 0 to Res - 1 do
    begin
      s := 0; //sin((y / (Res - 1)) * (Pi * 4));
      FPlaneScreen.MeshVertices[x + (y * Res)] := TexVertexNormal(-0.5 + (x / (Res - 1)), -0.5 + (y / (Res - 1)), s, 0, 0, 1, (x / (Res - 1)), (y / (Res - 1)));
    end;

  SetLength(FPlaneScreen.MeshIndices, Res * Res * 6);
  for y := 0 to Res - 2 do
    for x := 0 to Res - 2 do
    begin
      FPlaneScreen.MeshIndices[(x + (y * Res)) * 6 + 0] := x + (y * Res);
      FPlaneScreen.MeshIndices[(x + (y * Res)) * 6 + 1] := x + 1 + (y * Res);
      FPlaneScreen.MeshIndices[(x + (y * Res)) * 6 + 2] := x + ((y + 1) * Res);
      FPlaneScreen.MeshIndices[(x + (y * Res)) * 6 + 3] := x + ((y + 1) * Res);
      FPlaneScreen.MeshIndices[(x + (y * Res)) * 6 + 4] := x + 1 + (y * Res);
      FPlaneScreen.MeshIndices[(x + (y * Res)) * 6 + 5] := x + 1 + ((y + 1) * Res);
    end;
  FBuffer := TdxBitmap.Create(FLayerWidth, FLayerHeight);
  if BitmapList = nil then
    BitmapList := TStringList.Create;
  BitmapList.AddObject(Name, Self);
end;

procedure TdxCustomBufferLayer.SetName(const NewName: TComponentName);
var
  Idx: integer;
begin
  if Name <> NewName then
  begin
    inherited SetName(NewName);
    Idx := BitmapList.IndexOfObject(Self);
    if Idx >= 0 then
      BitmapList[Idx] := Name;
  end;
end;

destructor TdxCustomBufferLayer.Destroy;
begin
  if BitmapList <> nil then
    BitmapList.Delete(BitmapList.IndexOfObject(Self));
  FreeAndNil(FPlane);
  FreeAndNil(FPlaneScreen);
  FreeAndNil(FBuffer);
  inherited;
end;

procedure TdxCustomBufferLayer.BeforePaint;
begin
  if FBuffer = nil then
    FBuffer := TdxBitmap.Create(FLayerWidth, FLayerHeight);
  if (FBuffer.Width <> FLayerWidth) or (FBuffer.Height <> FLayerHeight) then
  begin
    FBuffer.SetSize(FLayerWidth, FLayerHeight);
  end;
  inherited;
end;

procedure TdxCustomBufferLayer.Paint;
var
  Offset: TdxPoint;
  M: TdxMatrix;
begin
  if (FBuffer <> nil) and Assigned(FOnUpdateBuffer) then
    FOnUpdateBuffer(Self);
  Canvas.Material.FBitmap := '';
  Canvas.Material.FBitmapTile := 1;
  Canvas.Material.FBitmapTileY := 1;
  Canvas.Material.FBitmapRect.left := 0;
  Canvas.Material.FBitmapRect.top := 0;
  Canvas.Material.FBitmapRect.right := 0;
  Canvas.Material.FBitmapRect.bottom := 0;
  Canvas.Material.FDiffuse := dxOpacity(FModulationColor, AbsoluteOpacity);
  Canvas.Material.FLighting := false;
  Canvas.Material.FModulation := dxTexModulate;
  Canvas.Material.FShadeMode := dxGouraud;
  Canvas.Material.FFillMode := dxSolid;
  Canvas.Material.FTempBitmap := GetBitmap;
  Canvas.SetMaterial(Canvas.Material);
  Canvas.SetRenderState(rsTexModulate);
  Canvas.SetRenderState(rsTexLinear);
  if Projection = dxProjectionCamera then
    Canvas.FillMesh(dxVector(0, 0, 0), dxVector(Width, Height, Depth), FPlane, AbsoluteOpacity)
  else
  begin
    M := AbsoluteMatrix;
    Offset := dxPoint(0, 0, 0);
    M.m41 := trunc(M.m41);
    M.m42 := trunc(M.m42);
    Canvas.SetMatrix(M);
    Canvas.FillMesh(dxVector(Offset.X + frac(FLayerWidth / 2), Offset.Y + frac(FLayerHeight / 2), 0), dxVector(FLayerWidth, FLayerHeight, Depth), FPlaneScreen, AbsoluteOpacity)
  end;
  Canvas.Material.FTempBitmap := nil;
  Canvas.SetRenderState(rsTexDisable);
end;

function TdxCustomBufferLayer.GetBitmap: TdxBitmap;
begin
  Result := FBuffer;
end;

function TdxCustomBufferLayer.RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean;
var
  ip: TdxVector;
  p: array[0..5] of TdxVector;
  p1, p2, p3: TdxVector;
  CubeSize: TdxVector;
  r: TdxVector;
  i, j: Integer;
  t, e: Single;
  eSize: TdxVector;
  FData: TdxMeshData;
begin
  Result := false;
  e := 0.5 + 0.003; //Small value for floating point imprecisions
  CubeSize.V[0] := Width;
  CubeSize.V[1] := Height;
  CubeSize.V[2] := Depth;
  eSize.V[0] := Width * e;
  eSize.V[1] := Height * e;
  eSize.V[2] := Depth * e;
  p[0] := XHmgVector;
  p[1] := YHmgVector;
  p[2] := ZHmgVector;
  p[3] := dxVector(-1, 0, 0);
  p[4] := dxVector(0, -1, 0);
  p[5] := dxVector(0, 0, -1);
  if Projection = dxProjectionScreen then
    FData := FPlaneScreen
  else
    FData := FPlane;
  for i := 0 to 5 do
  begin
    if dxVectorDotProduct(p[i], RayDir) > 0 then
    begin
      t := -(p[i].V[0] * RayPos.V[0] + p[i].V[1] * RayPos.V[1] + p[i].V[2] * RayPos.V[2] + 0.5 * CubeSize.V[i mod 3])
        / (p[i].V[0] * RayDir.V[0] + p[i].V[1] * RayDir.V[1] + p[i].V[2] * RayDir.V[2]);
      r := dxVector(RayPos.V[0] + t * RayDir.V[0], RayPos.V[1] + t * RayDir.V[1], RayPos.V[2] + t * RayDir.V[2]);
      if (Abs(r.V[0]) <= eSize.V[0]) and (Abs(r.V[1]) <= eSize.V[1]) and (Abs(r.V[2]) <= eSize.V[2]) and
        (dxVectorDotProduct(dxVectorSubtract(r, RayPos), RayDir) > 0) then
      begin
        { check geomerty }
        if (Length(FData.MeshVertices) > 0) and (Length(FData.MeshIndices) > 0) then
        begin
          for j := 0 to High(FData.MeshIndices) div 3 do
          begin
            if (FData.MeshIndices[(j * 3) + 0] <= High(FData.MeshVertices)) and
            (FData.MeshIndices[(j * 3) + 1] <= High(FData.MeshVertices)) and
            (FData.MeshIndices[(j * 3) + 2] <= High(FData.MeshVertices)) then
            begin
              with FData.MeshVertices[FData.MeshIndices[(j * 3) + 0]] do
                p1 := dxVector(x * Width, y * Height, z * Depth);
              with FData.MeshVertices[FData.MeshIndices[(j * 3) + 1]] do
                p2 := dxVector(x * Width, y * Height, z * Depth);
              with FData.MeshVertices[FData.MeshIndices[(j * 3) + 2]] do
                p3 := dxVector(x * Width, y * Height, z * Depth);
              if RayCastTriangleIntersect(RayPos, RayDir, p1, p2, p3, @ip, nil) then
              begin
                Intersection := LocalToAbsoluteVector(ip);
                Result := true;
                Break;
              end;
            end;
          end;
        end
        else
          if (csDesigning in ComponentState) {or (FScene.DesignTime) } then
        begin
          Result := true;
        end;
        Break;
      end;
    end;
  end;
  // calc for captured - bacause mouse can be inside layer
  if not Result and (Scene <> nil) and (Scene.FCaptured = Self) then
  begin
    e := 0.5 + 0.003; // Small value for floating point imprecisions
    CubeSize.V[0] := Width * 10;
    CubeSize.V[1] := Height * 10;
    CubeSize.V[2] := Depth * 10;
    eSize.V[0] := Width * 10 * e;
    eSize.V[1] := Height * 10 * e;
    eSize.V[2] := Depth * 10 * e;
    p[0] := XHmgVector;
    p[1] := YHmgVector;
    p[2] := ZHmgVector;
    p[3] := dxVector(-1, 0, 0);
    p[4] := dxVector(0, -1, 0);
    p[5] := dxVector(0, 0, -1);
    for i := 0 to 5 do
    begin
      if dxVectorDotProduct(p[i], RayDir) > 0 then
      begin
        t := -(p[i].V[0] * RayPos.V[0] + p[i].V[1] * RayPos.V[1] + p[i].V[2] * RayPos.V[2] + 0.5 * CubeSize.V[i mod 3])
          / (p[i].V[0] * RayDir.V[0] + p[i].V[1] * RayDir.V[1] + p[i].V[2] * RayDir.V[2]);
        r := dxVector(RayPos.V[0] + t * RayDir.V[0], RayPos.V[1] + t * RayDir.V[1], RayPos.V[2] + t * RayDir.V[2]);
        if (Abs(r.V[0]) <= eSize.V[0]) and (Abs(r.V[1]) <= eSize.V[1]) and (Abs(r.V[2]) <= eSize.V[2]) and
          (dxVectorDotProduct(dxVectorSubtract(r, RayPos), RayDir) > 0) then
        begin
          Intersection := dxVector(LocalToAbsolute(dxPoint(r)));
          Result := true;
          Exit;
        end;
      end;
    end;
  end;
end;

procedure TdxCustomBufferLayer.MouseMove(Shift: TShiftState; X, Y, Dx,
  Dy: single; rayPos, rayDir: TdxVector);
var
  P3, rPos, rDir: TdxVector;
begin
  FDisableLayerEvent := true;
  try
    inherited;
  finally
    FDisableLayerEvent := false;
  end;
  if Projection = dxProjectionCamera then
  begin
    if RayCastIntersect(rayPos, rayDir, P3) then
    begin
      P3 := AbsoluteToLocalVector(P3);
      X := (((P3.x + (Width / 2)) / Width) * FLayerWidth);
      Y := (((-P3.z + (Depth / 2)) / Depth) * FLayerHeight);
    end
    else
      Exit;
  end
  else
  begin
    if RayCastIntersect(rayPos, rayDir, P3) then
    begin
      P3 := AbsoluteToLocalVector(P3);
      X := (((P3.x + (Width / 2)) / Width) * FLayerWidth);
      Y := (((P3.y + (Height / 2)) / Height) * FLayerHeight);
    end
    else
      Exit;
  end;
  LayerMouseMove(Shift, X, Y);
end;

procedure TdxCustomBufferLayer.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: single; rayPos, rayDir: TdxVector);
var
  P3, rPos, rDir: TdxVector;
begin
  FDisableLayerEvent := true;
  try
    inherited;
  finally
    FDisableLayerEvent := false;
  end;
  if Projection = dxProjectionCamera then
  begin
    if RayCastIntersect(rayPos, rayDir, P3) then
    begin
      P3 := AbsoluteToLocalVector(P3);
      X := (((P3.x + (Width / 2)) / Width) * FLayerWidth);
      Y := (((-P3.z + (Depth / 2)) / Depth) * FLayerHeight);
    end
    else
      Exit;
  end
  else
  begin
    if RayCastIntersect(rayPos, rayDir, P3) then
    begin
      P3 := AbsoluteToLocalVector(P3);
      X := (((P3.x + (Width / 2)) / Width) * FLayerWidth);
      Y := (((P3.y + (Height / 2)) / Height) * FLayerHeight);
    end
    else
      Exit;
  end;
  LayerMouseDown(Button, Shift, X, Y);
end;

procedure TdxCustomBufferLayer.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: single; rayPos, rayDir: TdxVector);
var
  P3, rPos, rDir: TdxVector;
begin
  FDisableLayerEvent := true;
  try
    inherited;
  finally
    FDisableLayerEvent := false;
  end;
  if Projection = dxProjectionCamera then
  begin
    if RayCastIntersect(rayPos, rayDir, P3) then
    begin
      P3 := AbsoluteToLocalVector(P3);
      X := (((P3.x + (Width / 2)) / Width) * FLayerWidth);
      Y := (((-P3.z + (Depth / 2)) / Depth) * FLayerHeight);
    end;
  end
  else
  begin
    if RayCastIntersect(rayPos, rayDir, P3) then
    begin
      P3 := AbsoluteToLocalVector(P3);
      X := (((P3.x + (Width / 2)) / Width) * FLayerWidth);
      Y := (((P3.y + (Height / 2)) / Height) * FLayerHeight);
    end;
  end;
  LayerMouseUp(Button, Shift, X, Y);
end;

procedure TdxCustomBufferLayer.SetResolution(const Value: integer);
begin
  if FResolution <> Value then
  begin
    FResolution := Value;
    if Projection = dxProjectionCamera then
    begin
      FLayerWidth := Round(Width * FResolution);
      FLayerHeight := Round(Depth * FResolution);
    end;
    Repaint;
  end;
end;

procedure TdxCustomBufferLayer.SetWidth(const Value: single);
begin
  inherited SetWidth(Value);
  if Projection = dxProjectionCamera then
  begin
    if (Round(Width * FResolution) <> FLayerWidth) then
    begin
      FLayerWidth := Round(Width * FResolution);
    end;
  end
  else
    FLayerWidth := Round(Width);
end;

procedure TdxCustomBufferLayer.SetDepth(const Value: single);
begin
  if Projection = dxProjectionCamera then
  begin
    inherited SetDepth(Value);
    if (Round(Depth * FResolution) <> FLayerHeight) then
    begin
      FLayerHeight := Round(Depth * FResolution);
    end;
  end
  else
    inherited SetDepth(Value);
end;

procedure TdxCustomBufferLayer.SetHeight(const Value: single);
begin
  if Projection = dxProjectionCamera then
    inherited SetHeight(Value)
  else
  begin
    inherited SetHeight(Value);
    FLayerHeight := Round(Height);
  end;
end;

function TdxCustomBufferLayer.GetModulationColor: string;
begin
  Result := dxColorToStr(FModulationColor);
end;

procedure TdxCustomBufferLayer.SetModulationColor(const Value: string);
begin
  if FModulationColor <> dxStrToColor(Value) then
  begin
    FModulationColor := dxStrToColor(Value);
    Repaint;
  end;
end;

{ TdxDesigner =================================================================}

procedure TdxDesigner.CallDesignSelect(AObject: TObject);
var
  i: integer;
begin
  if FScenes <> nil then
    for i := 0 to FScenes.Count - 1 do
    begin
      TdxScene(FScenes[i]).DoDesignSelect(AObject);
      TdxScene(FScenes[i]).AddUpdateRect(vgRect(0, 0, 1000, 1000));
    end;
end;

procedure TdxDesigner.AddScene(const Scene: TdxScene);
begin
  if FScenes = nil then
    FScenes := TList.Create;
  if FScenes.IndexOf(Pointer(Scene)) < 0 then
    FScenes.Add(Pointer(Scene));
end;

procedure TdxDesigner.RemoveScene(const Scene: TdxScene);
begin
  FScenes.Remove(Pointer(Scene));
  if FScenes.Count = 0 then
    FreeAndNil(FScenes);
end;

{ TdxScene ====================================================================}

const
  dxSceneCount: integer = 0;

constructor TdxScene.Create(AOwner: TComponent);
begin
  inherited;
  ShowHint := true;
  FDesignShowHint := true;
  FDesignAllowPanAndRotate := true;
  FUsingDesignCamera := true;
  OnDragOver := DoDragOver;
  OnDragDrop := DoDragDrop;
  ControlStyle := ControlStyle + [csCaptureMouse, csOpaque, csDoubleClicks];
  FSnapGridShow := true;
  FSnapToLines := true;
  FAlignRoot := true;
  FSnapGridSize := 0.25;
  FLighting := true;
  FFill := $FF303030;
  FAmbient := $FF202020;
  Width := 100;
  Height := 100;
  FDesignTime := (csDesigning in ComponentState);
  if dxDesigner <> nil then
    dxDesigner.AddScene(Self);

  FDesignCameraZ := TdxDummy.Create(Self);
  with FDesignCameraZ do
  begin
    Tag := $FFFE;
    Locked := true;
    Stored := false;
  end;
  AddObject(FDesignCameraZ);

  FDesignCameraX := TdxDummy.Create(Self);
  with FDesignCameraX do
  begin
    Tag := $FFFE;
    Parent := FDesignCameraZ;
    Locked := true;
    Stored := false;
    RotateAngle.X := 20;
  end;

  FDesignCamera := TdxCamera.Create(Self);
  with FDesignCamera do
  begin
    Tag := $FFFE;
    Parent := FDesignCameraX;
    Locked := true;
    Stored := false;
    Position.Point := dxPoint(0, -20, 0);
  end;

  FDesignGrid := TdxGrid.Create(Self);
  with TdxGrid(FDesignGrid) do
  begin
    Width := 50;
    Height := 50;
    Frequency := 1;
    Marks := 4;
    Tag := $FFFE;
    Locked := true;
    Stored := false;
    Visible := FDesigntime;
  end;
  AddObject(FDesignGrid);

  dxSceneCount := dxSceneCount + 1;
end;

procedure TdxScene.CreateEmbedded(const AWidth, AHeight: integer; AOnFlush: TNotifyEvent);
begin
  Width := AWidth;
  Height := AHeight;
  if Canvas = nil then
  begin
    FCanvas := DefaultCanvasClass.Create(Handle, Width, Height, true, Quality);
    FCanvas.FScene := Self;
  end
  else
  begin
    Canvas.FLockable := true;
    Canvas.ResizeBuffer(AWidth, AHeight);
  end;
  FOnFlush := AOnFlush;
  Draw;
end;

procedure TdxScene.EmbeddedMouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  MouseDown(Button, Shift, X, Y);
end;

procedure TdxScene.EmbeddedMouseMove(Shift: TShiftState; X, Y: Integer);
begin
  MouseMove(Shift, X, Y);
end;

procedure TdxScene.EmbeddedMouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  MouseUp(Button, Shift, X, Y);
end;

function TdxScene.EmbeddedMouseWheel(Shift: TShiftState; WheelDelta: Integer): Boolean;
var
  MousePos: TPoint;
begin
  Result := DoMouseWheel(Shift, WheelDelta, MousePos);
end;

procedure TdxScene.EmbeddedKeyUp(var Key: Word; var Char: System.WideChar; Shift: TShiftState);
begin
  NewKeyUp(Key, Char, Shift);
end;

procedure TdxScene.EmbeddedKeyDown(var Key: Word; var Char: System.WideChar; Shift: TShiftState);
begin
  NewKeyDown(Key, Char, Shift);
end;

procedure TdxScene.Loaded;
begin
  inherited;
  FLoadCursor := Cursor;
  if FSnapToLines then
    FSnapToGrid := false;
end;

procedure TdxScene.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.WindowClass.style := Params.WindowClass.style or CS_HREDRAW or CS_VREDRAW;
end;

procedure TdxScene.CreateHandle;
{$IFDEF LINUX}
var
  FGTKWidget: PGtkwidget;
  {$ENDIF}
begin
  inherited;
  {$IFDEF WINDOWS}
  SetWindowLongW(Handle, GWL_WNDPROC, GetWindowLong(Handle, GWL_WNDPROC));
  {$ENDIF}
  {$IFDEF FPCWIN} // fpc lazarus
  PrevWndProc := Windows.WNDPROC(SetWindowLongPtrW(Self.Handle, GWL_WNDPROC, PtrInt(@WndCallback)));
  {$ENDIF}
  if not (DesignTime) and FInvisibleAtRuntime then
  else
  begin
    FCanvas := DefaultCanvasClass.Create(Handle, Width, Height, Transparency, Quality);
    FCanvas.FScene := Self;
  end;
  if FTransparency and not (DesignTime) then
  begin
    if Parent is TCustomForm then
    begin
      {$IFDEF WINDOWS}
      SetWindowLong(Parent.Handle, GWL_EXSTYLE, GetWindowLong(Parent.Handle, GWL_EXSTYLE) or WS_EX_LAYERED);
      UpdateLayer;
      {$ENDIF}
      {$IFDEF DARWIN}
      WndEventHandlerUPP := NewEventHandlerUPP(EventHandlerProcPtr(Pointer(@WndEventHandler)));
      EventKinds[0].eventClass := kEventClassControl;
      EventKinds[0].eventKind := kEventControlDraw;
      InstallEventHandler(GetControlEventTarget(TCarbonWindow(TCustomForm(Parent).Handle).Widget), WndEventHandlerUPP, 1, @EventKinds[0], Self, nil);
      EventKinds[0].eventClass := kEventClassWindow;
      EventKinds[0].eventKind := kEventWindowGetRegion;
      InstallEventHandler(GetWindowEventTarget(TCarbonWindow(TCustomForm(Parent).Handle).Window), WndEventHandlerUPP, 1, @EventKinds[0], Self, nil);
      SetWindowAlpha(TCarbonWindow(TCustomForm(Parent).Handle).Window, 0.999);
      ReshapeCustomWindow(TCarbonWindow(TCustomForm(Parent).Handle).Window);

      WndEventHandlerUPP := NewEventHandlerUPP(EventHandlerProcPtr(Pointer(@CtrlEventHandler)));
      EventKinds[0].eventClass := kEventClassControl;
      EventKinds[0].eventKind := kEventControlDraw;
      InstallEventHandler(GetControlEventTarget(TCarbonWidget(Handle).Widget), WndEventHandlerUPP, 1, @EventKinds[0], Self, nil);
      {$ENDIF}
    end
  end;

  {$IFDEF LINUX}
  FGTKWidget := GetFixedWidget(pgtkwidget(Handle));
  gtk_widget_realize(FGTKWidget);
  gtk_widget_set_double_buffered(FGTKWidget, false);
  {$ENDIF}
  {$IFDEF DARWIN}
  SetControlDragTrackingEnabled(TCarbonWidget(Handle).Widget, true);
  if Parent is TCustomForm then
    SetAutomaticControlDragTrackingEnabledForWindow(TCarbonWindow(TCustomForm(Parent).Handle).Window, true);
  WndEventHandlerUPP := NewEventHandlerUPP(EventHandlerProcPtr(Pointer(@CtrlEventHandler)));
  EventKinds[0].eventClass := kEventClassControl;
  EventKinds[0].eventKind := kEventControlDragEnter;
  EventKinds[1].eventClass := kEventClassControl;
  EventKinds[1].eventKind := kEventControlDragReceive;
  EventKinds[2].eventClass := kEventClassControl;
  EventKinds[2].eventKind := kEventControlDragWithin;
  EventKinds[3].eventClass := kEventClassControl;
  EventKinds[3].eventKind := kEventControlDragLeave;
  InstallEventHandler(GetControlEventTarget(TCarbonWidget(Handle).Widget), WndEventHandlerUPP, 4, @EventKinds[0], Self, nil);
  {$ENDIF}

  if not HandleAllocated then
    Exit;
end;

{$IFDEF WINDOWS}

procedure TdxScene.CreateWnd;
begin
  inherited;
  RegisterDragDrop(Handle, Self);
end;

procedure TdxScene.DestroyWnd;
begin
  if dxSceneCount = 0 then
  begin
    if dxAniThread <> nil then
      dxAniThread.Free;
    dxAniThread := nil;
  end;
  if (FCanvas <> nil) then
    FreeAndNil(FCanvas);
  if HandleAllocated then
    RevokeDragDrop(Handle);
  {$IFDEF FPCWIN} // fpc lazarus
  if PtrInt(SetWindowLongPtrW(Self.Handle, GWL_WNDPROC, PtrInt(@WndCallback))) = PtrInt(@WndCallback) then
    SetWindowLongPtrW(Self.Handle, GWL_WNDPROC, PtrInt(@PrevWndProc));
  {$ENDIF}
  inherited;
end;

{$ENDIF}

destructor TdxScene.Destroy;
begin
  if dxDesigner <> nil then
    dxDesigner.RemoveScene(Self);
  dxSceneCount := dxSceneCount - 1;
  if Realtime then
    Application.OnIdle := nil;
  DeleteChildren;
  if (FCanvas <> nil) then
    FreeAndNil(FCanvas);
  if FPhysics <> nil then
    FreeAndNil(FPhysics);
  if FBlendedList <> nil then
    FreeAndNil(FBlendedList);
  if FChildren <> nil then
    FreeAndNil(FChildren);
  FreeAndNil(FCanvas);
  inherited;
end;

procedure TdxScene.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  i: Integer;
begin
  inherited;
  if FChildren <> nil then
    for i := 0 to FChildren.Count - 1 do
      if TdxObject(FChildren[i]).Stored then
      begin
        Proc(FChildren[i]);
      end;
end;

{$IFDEF WINDOWS}

procedure TdxScene.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if FHovered <> nil then
  begin
    FHovered.MouseInObject := false;
    FHovered.MouseLeave;
    FHovered := nil;
  end;
end;

procedure TdxScene.WMAddUpdateRect(var Msg: TMessage);
  procedure ProcessUpdateMessages;
  var
    Msg: TMsg;
  begin
    while PeekMessage(Msg, TWinControl(Owner).Handle, WM_ADDUPDATERECT, WM_ADDUPDATERECT, PM_REMOVE) do
    begin
      if Msg.message = WM_QUIT then
      begin
        { Repost WM_QUIT messages }
        PostQuitMessage(Msg.WParam);
        Break;
      end;
    end;
  end;
begin
  { Empty message queue }
  ProcessUpdateMessages;
  { Draw }
  if csDestroying in ComponentState then
    Exit;
  Draw;
end;

{$ENDIF}

procedure TdxScene.AddUpdateRect(const R: TvxRect);
begin
  if FDisableUpdate then
    Exit;
  if csLoading in ComponentState then
    Exit;
  if not HandleAllocated then
    Exit;
  {$IFDEF WINDOWS}
  if Transparency and (Parent is TCustomForm) then
  begin
    PostMessage(Handle, WM_ADDUPDATERECT, 0, 0); // only for layered
  end
  else
  begin
    Windows.InvalidateRect(Handle, nil, false);
  end;
  {$ENDIF}
  {$IFDEF DARWIN}
  HIViewSetNeedsDisplay(HiViewRef(TCarbonWidget(Handle).Widget), true);
  {$ENDIF}
  {$IFDEF LINUX}
  gdk_window_invalidate_rect(PGtkWidget(Handle)^.Window, nil, true);
  {$ENDIF}
end;

procedure TdxScene.Draw;
var
  i, j: integer;
  R: TvxRect;
  Rgn, NRgn: Cardinal;
  M, CameraMatrix: TdxMatrix;
  V: TdxVector;
  P: TPoint;
  Back: TBitmap;
  Dist: single;
begin
  if FDrawing then
    Exit;
  if FDisableUpdate then
    Exit;
  if Canvas = nil then
    Exit;
  FDrawing := true;
  try
    Canvas.Reset;
    Canvas.Lighting := FLighting;
    Canvas.Ambient := FAmbient;
    if FBlendedList = nil then
      FBlendedList := TList.Create;
    { set matrix and camera }
    if Camera <> nil then
    begin
      Canvas.SetCamera(Camera);
    end;
    if DesignTime or FUsingDesignCamera then
    begin
      Canvas.SetCamera(FDesignCamera);
      FDesignGrid.Visible := DesignTime;
    end;
    { set lights }
    if FChildren <> nil then
      for i := 0 to FChildren.Count - 1 do
      begin
        if not (TObject(FChildren[i]) is TdxVisualObject) then
          Continue;
        if not TdxVisualObject(FChildren[i]).Visible then
          Continue;
        Canvas.SetMatrix(TdxVisualObject(FChildren[i]).AbsoluteMatrix);
        TdxVisualObject(FChildren[i]).PreRender;
      end;
    { draw back }
    if Canvas.BeginScene then
    begin
      Canvas.SetRenderState(rsGouraud);
      Canvas.SetRenderState(rs3DScene);
      Canvas.SetRenderState(rsZWriteOn);
      Canvas.SetRenderState(rsLightOn);
      Canvas.SetRenderState(rsTexLinear);
      Canvas.SetRenderState(rsFrontFace);
      if not Transparency then
        Canvas.Clear(FFill)
      else
      begin
        Canvas.Clear(FFill);
      end;
      { reset }
      if FChildren <> nil then
        for i := 0 to FChildren.Count - 1 do
        begin
          if not (TObject(FChildren[i]) is TdxVisualObject) then
            Continue;
          if not TdxVisualObject(FChildren[i]).Visible then
            Continue;
          Canvas.SetMatrix(TdxVisualObject(FChildren[i]).AbsoluteMatrix);
          TdxVisualObject(FChildren[i]).BeforePaint;
          TdxVisualObject(FChildren[i]).Paint;
          TdxVisualObject(FChildren[i]).PaintChildren;
        end;
      {$IFDEF MOUSERAY}
      { helpvector }
      Canvas.SetMatrix(IdentityMatrix);
      Canvas.SetRenderState(rsZWriteOff);
      Canvas.Material.Diffuse := '#FFFF0000';
      V := dxVectorScale(dxVectorSubtract(FV2, FV1), 10);
      Canvas.DrawLine(dxVectorSubtract(FV1, V), dxVectorAdd(FV2, V), 1);
      {$ENDIF}
      { design }
      if (FSelected <> nil) and (FSelected <> Root) and (Canvas.FCurrentCamera <> nil) then
      begin
        dist := dxVectorLength(dxVectorSubtract(Canvas.FCurrentCamera.AbsolutePosition, FSelected.AbsolutePosition)) / (Canvas.GetProjectionMatrix.m11 * Canvas.GetProjectionMatrix.m22);
        if FSelected.Projection = dxProjectionCamera then
        begin
          dist := dist * 0.14;
          RotateGripDist := 1.8;
          GripSize := 0.18 * (Dist);
          Canvas.SetRenderState(rs3DScene)
        end
        else
        begin
          RotateGripDist := 10;
          GripSize := 3;
          Canvas.SetRenderState(rs2DScene);
        end;
        Canvas.SetMatrix(FSelected.AbsoluteMatrix);
        Canvas.SetRenderState(rsZWriteOn);
        Canvas.Material.Lighting := false;
        Canvas.Material.Bitmap := '';
        Canvas.Material.NativeDiffuse := $FF5B91DE;
        { box }
        Canvas.DrawCube(dxVector(0, 0, 0), dxVector(FSelected.Width, FSelected.Height, FSelected.Depth), 1);
        if FSelected.FCanResize then
        begin
          { righttop }
          V := dxVectorAdd(dxVector(0, 0, 0), dxVector(FSelected.Width / 2, -FSelected.Height / 2, FSelected.Depth / 2));
          Canvas.Material.NativeDiffuse := $FF5B91DE;
          if FRightTop then
            Canvas.Material.NativeDiffuse := $FFFF5010;
          Canvas.FillCube(V, dxVector(GripSize * 3, GripSize * 1, GripSize * 3), 1);
          Canvas.Material.NativeDiffuse := $AA000000;
          Canvas.DrawCube(V, dxVector(GripSize * 3, GripSize * 1, GripSize * 3), 1);
          { leftfar }
          V := dxVectorAdd(dxVector(0, 0, 0), dxVector(-FSelected.Width / 2, FSelected.Height / 2, FSelected.Depth / 2));
          Canvas.Material.NativeDiffuse := $FF5B91DE;
          if FLeftFar then
            Canvas.Material.NativeDiffuse := $FFFF5010;
          Canvas.FillCube(V, dxVector(GripSize * 3, GripSize * 3, GripSize * 1), 1);
          Canvas.Material.NativeDiffuse := $AA000000;
          Canvas.DrawCube(V, dxVector(GripSize * 3, GripSize * 3, GripSize * 1), 1);
        end;
        { rotation }
        if FSelected.FCanRotate then
        begin
          { z rotate }
          V := dxVectorAdd(dxVector(0, 0, 0), dxVector(0, -FSelected.Height / 2 - RotateGripDist, 0));
          Canvas.Material.NativeDiffuse := $FF5BDE91;
          if FRotateZ then
            Canvas.Material.NativeDiffuse := $FFFF5010;
          Canvas.DrawLine(dxVector(0, -FSelected.Height / 2, 0), dxVector(0, -FSelected.Height / 2 - RotateGripDist, 0), 1);
          Canvas.FillCube(V, dxVector(GripSize * 5, GripSize * 1.5, GripSize * 1.5), 1);
          Canvas.Material.NativeDiffuse := $AA000000;
          Canvas.DrawCube(V, dxVector(GripSize * 5, GripSize * 1.5, GripSize * 1.5), 1);
          if FSelected.Projection = dxProjectionCamera then
          begin
            { y rotate }
            V := dxVectorAdd(dxVector(0, 0, 0), dxVector(FSelected.Width / 2 + RotateGripDist, 0, 0));
            Canvas.Material.NativeDiffuse := $FF5BDE91;
            if FRotateY then
              Canvas.Material.NativeDiffuse := $FFFF5010;
            Canvas.DrawLine(dxVector(FSelected.Width / 2, 0, 0), dxVector(FSelected.Width / 2 + RotateGripDist, 0, 0), 1);
            Canvas.FillCube(V, dxVector(GripSize * 1.5, GripSize * 1.5, GripSize * 5), 1);
            Canvas.Material.NativeDiffuse := $AA000000;
            Canvas.DrawCube(V, dxVector(GripSize * 1.5, GripSize * 1.5, GripSize * 5), 1);
            { x rotate }
            V := dxVectorAdd(dxVector(0, 0, 0), dxVector(0, 0, FSelected.Depth / 2 + RotateGripDist));
            Canvas.Material.NativeDiffuse := $FF5BDE91;
            if FRotateX then
              Canvas.Material.NativeDiffuse := $FFFF5010;
            Canvas.DrawLine(dxVector(0, 0, FSelected.Depth / 2), dxVector(0, 0, FSelected.Depth / 2 + RotateGripDist), 1);
            Canvas.FillCube(V, dxVector(GripSize * 1.5, GripSize * 5, GripSize * 1.5), 1);
            Canvas.Material.NativeDiffuse := $AA000000;
            Canvas.DrawCube(V, dxVector(GripSize * 1.5, GripSize * 5, GripSize * 1.5), 1);
          end;
        end;
      end;
      { design modes }
      if (DesignTime) and FDesignShowHint then
      begin
        Canvas.SetRenderState(rs2DScene);
        Canvas.SetMatrix(IdentityMatrix);
        Canvas.Material.Diffuse := '#8091DE5B';
        Canvas.Material.Lighting := false;
        Canvas.Font.Size := 9;
        Canvas.Font.Style := dxFontRegular;
        Canvas.DrawText(0, 0, 'Alt+mouse - rotate scene | Shift+mouse - move scene', 1);
        Canvas.DrawText(0, 10, 'Mouse - move object in (XoY) | Ctrl + Mouse - move object in (XoZ)', 1);
        Canvas.DrawText(0, 20, 'Shift+mouse - move layer object in (XoY) | Hold Shift to use DX Menu in ObjectLayers', 1);
      end;
    end;
    { buffer }
    Canvas.FlushBuffer;
    if Assigned(FOnFlush) then
      FOnFlush(Self)
    else
    begin
      { Transparancy }
      {$IFDEF WINDOWS}
      if FTransparency and (Parent is TCustomForm) then
        UpdateLayer;
      {$ENDIF}
      {$IFDEF darwin}
      if FTransparency and (Parent is TCustomForm) then
        UpdateLayer;
      {$ENDIF}
    end;
  finally
    FDrawing := false;
  end;
end;

{$IFDEF WINDOWS}

procedure TdxScene.UpdateLayer;
var
  Blend: TBLENDFUNCTION;
  Origin, Size, BitmapOrigin: Windows.TPoint;
  dragAlpha: integer;
  DC, OldRgn, Rgn: Cardinal;
begin
  if Handle = 0 then
    Exit;
  if Canvas = nil then
    Exit;
  if (DesignTime) then
    Exit;
  if not (Owner is TWinControl) then
    Exit;
  if TWinControl(Owner).Handle = 0 then
    Exit;
  if Canvas.FBufferDC = 0 then
    Exit;

  Origin := Point(TWinControl(Owner).Left + Left, TWinControl(Owner).Top + Top);
  Size := Point(Width, Height);
  { Update }
  with Blend do
  begin
    BlendOp := AC_SRC_OVER;
    AlphaFormat := $01; //AC_SRC_ALPHA;
    BlendFlags := 0;
    SourceConstantAlpha := $FF;
  end;
  BitmapOrigin := Point(0, 0);

  UpdateLayeredWindow(TWinControl(Owner).Handle, 0, @Origin, @Size, Canvas.FBufferDC, @BitmapOrigin, $00000000, @Blend, ULW_ALPHA);
end;
{$ENDIF}

{ Drag and Drop }

type
  THackControl = class(TCustomControl);

var
  VCLDragSource: TControl;

procedure TdxScene.BeginVCLDrag(Source: TObject);
begin
  FCaptured := nil;
  MouseCapture := false;
  VCLDragSource := TCustomControl.Create(Application);
  VCLDragSource.Parent := Self;
  VCLDragSource.Width := 0;
  VCLDragSource.Height := 0;
  VCLDragSource.Tag := Integer(Source);
  VCLDragSource.BeginDrag(true, -1);
  THackControl(VCLDragSource).OnEndDrag := EndDragEvent;
end;

type
  TvxHackVisualObject = class(TvxVisualObject);

procedure TdxScene.EndDragEvent(Sender, Target: TObject; X, Y: Integer);
begin
  if TObject(Pointer(VCLDragSource.Tag)) is TdxVisualObject then
    TdxVisualObject(Pointer(VCLDragSource.Tag)).DragEnd;
  if TObject(Pointer(VCLDragSource.Tag)) is TvxVisualObject then
    TvxHackVisualObject(Pointer(VCLDragSource.Tag)).DragEnd;
  VCLDragSource.Tag := 0;
end;

procedure TdxScene.DoDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);
var
  P: TdxPoint;
  NewTarget: TdxVisualObject;
  Data: TdxDragObject;
  Distance: single;
begin
  Accept := false;
  if Root = nil then
    Exit;

  FillChar(Data, SizeOf(Data), 0);
  if (VCLDragSource <> nil) and (VCLDragSource.Tag <> 0) then
    Data.Source := TdxObject(VCLDragSource.Tag)
  else
    Data.Source := Source;

  P := dxPoint(X, Y, 0);
  Distance := $FFFF;
  NewTarget := Root.Visual.FindTarget(P, dxProjectionScreen, Data, Distance);
  if NewTarget = nil then
    NewTarget := Root.Visual.FindTarget(P, dxProjectionCamera, Data, Distance);

  if (VCLDragSource <> nil) and (NewTarget = TdxObject(VCLDragSource.Tag)) then
  begin
    Accept := false;
    Exit;
  end;

  if DXSceneTarget <> nil then
  begin
    DXSceneTarget.DragOver(Data, DXSceneTarget.AbsoluteToLocal(P), Accept);
  end;
  if (NewTarget <> DXSceneTarget) then
  begin
    if DXSceneTarget <> nil then
      DXSceneTarget.DragLeave;
    DXSceneTarget := NewTarget;
    if DXSceneTarget <> nil then
    begin
      DXSceneTarget.DragEnter(Data, DXSceneTarget.AbsoluteToLocal(P));
    end;
  end;
  if DXSceneTarget = nil then
    Accept := false;
end;

procedure TdxScene.DoDragDrop(Sender, Source: TObject;
  X, Y: Integer);
var
  Data: TdxDragObject;
begin
  if DXSceneTarget <> nil then
  begin
    FillChar(Data, SizeOf(Data), 0);
    if (VCLDragSource <> nil) and (VCLDragSource.Tag <> 0) then
      Data.Source := TdxObject(VCLDragSource.Tag)
    else
      Data.Source := Source;
    DXSceneTarget.DragDrop(Data, DXSceneTarget.AbsoluteToLocal(dxPoint(X, Y, 0)));
  end;
  DXSceneTarget := nil;
end;

{$IFDEF WINDOWS}

const
  IID_IDropTargetHelper: TGUID = (
    D1: $4657278B; D2: $411B; D3: $11D2; D4: ($83, $9A, $00, $C0, $4F, $D9, $18, $D0));
  SID_IDropTargetHelper = '{4657278B-411B-11d2-839A-00C04FD918D0}';
  CLSID_DragDropHelper: TGUID = (
    D1: $4657278A; D2: $411B; D3: $11D2; D4: ($83, $9A, $00, $C0, $4F, $D9, $18, $D0));

type
  {_$EXTERNALSYM IDropTargetHelper}
  IDropTargetHelper = interface(IUnknown)
    [SID_IDropTargetHelper]
    function DragEnter(hwndTarget: HWND; const DataObj: IDataObject;
      var pt: TPoint; dwEffect: Longint): HResult; stdcall;
    function DragLeave: HResult; stdcall;
    function DragOver(var pt: TPoint; dwEffect: longInt): HResult; stdcall;
    function Drop(const DataObj: IDataObject; var pt: TPoint;
      dwEffect: longInt): HResult; stdcall;
    function Show(Show: BOOL): HResult; stdcall;
  end;

var
  FDropTargetHelper: IDropTargetHelper;
  FDataObj: IDataObject;

function TdxScene.GetDataObject: TdxDragObject;
var
  formatEtc: TFORMATETC;
  stgMedium: TSTGMEDIUM;
  str: wideString;
  drop: HDrop;
  i, numFiles: integer;
  buffer: array[0..MAX_PATH] of widechar;
begin
  FillChar(Result, SizeOf(Result), 0);
  if not Assigned(FDataObj) then
    Exit;
  // get file name first
  with formatEtc do
  begin
    cfFormat := CF_HDROP;
    ptd := nil;
    dwAspect := DVASPECT_CONTENT;
    lindex := -1;
    tymed := TYMED_HGLOBAL;
  end;
  { Get the data }
  str := '';
  if FDataObj.GetData(formatEtc, stgMedium) = S_OK then
  begin
    try
      {Lock the global memory handle to get a pointer to the data}
      drop := HDrop(GlobalLock(stgMedium.hGlobal));
      { Replace Text }
      numFiles := DragQueryFile(drop, $FFFFFFFF, nil, 0);
      SetLength(Result.Files, numFiles);
      for i := 0 to numFiles - 1 do
      begin
        DragQueryFileW(drop, i, @buffer, sizeof(buffer));
        Result.Files[i] := buffer;
        if i = 0 then
          Result.Data := Result.Files[0];
      end;
    finally
      {Finished with the pointer}
      GlobalUnlock(stgMedium.hGlobal);
      {Free the memory}
      ReleaseStgMedium({$IFDEF FPC}@{$ENDIF}stgMedium);
    end;
  end
  else
  begin
    // get text
    formatEtc.cfFormat := CF_UNICODETEXT;
    if FDataObj.GetData(formatEtc, stgMedium) = S_OK then
    begin
      try
        {Lock the global memory handle to get a pointer to the data}
        str := PWideChar(GlobalLock(stgMedium.hGlobal));
        Result.Data := str;
      finally
        {Finished with the pointer}
        GlobalUnlock(stgMedium.hGlobal);
        {Free the memory}
        ReleaseStgMedium({$IFDEF FPC}@{$ENDIF}stgMedium);
      end;
    end
  end;
end;

function TdxScene.DragEnter(const dataObj: IDataObject; grfKeyState: {$IFDEF FPC}DWORD{$ELSE}Longint{$ENDIF};
  pt: TPoint; var dwEffect: {$IFDEF FPC}DWORD{$ELSE}Longint{$ENDIF}): HResult;
begin
  try
    if (Root = nil) and not (Root.IsVisual) then
    begin
      dwEffect := DROPEFFECT_NONE;
      Result := E_UNEXPECTED;
      Exit;
    end;
    FDataObj := dataObj;
    Result := S_OK;
    dwEffect := DROPEFFECT_NONE;
    if (Succeeded(CoCreateInstance(CLSID_DragDropHelper, nil, CLSCTX_INPROC_SERVER,
      IDropTargetHelper, FDropTargetHelper))) and
      (FDropTargetHelper <> nil) then
    begin
      if (Failed(FDropTargetHelper.DragEnter(Handle, DataObj, pt, dwEffect))) then
        FDropTargetHelper := nil;
    end;
  except
    dwEffect := DROPEFFECT_NONE;
    Result := E_UNEXPECTED;
  end;
end;

function TdxScene.DragOver(grfKeyState: {$IFDEF FPC}DWORD{$ELSE}Longint{$ENDIF}; pt: TPoint;
  var dwEffect: {$IFDEF FPC}DWORD{$ELSE}Longint{$ENDIF}): HResult;
var
  P: TdxPoint;
  NewTarget: TdxVisualObject;
  Distance: single;
begin
  try
    dwEffect := DROPEFFECT_NONE;
    Result := S_OK;
    with ScreenToClient(pt) do
      P := dxPoint(X, Y, 0);
    Distance := $FFFF;
    NewTarget := Root.Visual.FindTarget(P, dxProjectionScreen, GetDataObject, Distance);
    if NewTarget = nil then
      NewTarget := Root.Visual.FindTarget(P, dxProjectionCamera, GetDataObject, Distance);
    if (NewTarget <> DXSceneTarget) then
    begin
      if DXSceneTarget <> nil then
        DXSceneTarget.DragLeave;
      DXSceneTarget := NewTarget;
      if DXSceneTarget <> nil then
      begin
        DXSceneTarget.DragEnter(GetDataObject, DXSceneTarget.AbsoluteToLocal(P));
      end;
    end;
    if NewTarget <> nil then
      dwEffect := DROPEFFECT_LINK;
    if FDropTargetHelper <> nil then
      FDropTargetHelper.DragOver(pt, dwEffect);
  except
    dwEffect := DROPEFFECT_NONE;
    Result := E_UNEXPECTED;
  end;
end;

function TdxScene.DragLeave: HResult;
begin
  if DXSceneTarget <> nil then
    DXSceneTarget.DragLeave;
  if (FDropTargetHelper <> nil) then
    FDropTargetHelper.DragLeave;
  DXSceneTarget := nil;
  FDropTargetHelper := nil;
  FDataObj := nil;
  Result := S_OK;
end;

function TdxScene.Drop(const dataObj: IDataObject; grfKeyState: {$IFDEF FPC}DWORD{$ELSE}Longint{$ENDIF}; pt: TPoint;
  var dwEffect: {$IFDEF FPC}DWORD{$ELSE}Longint{$ENDIF}): HResult;
var
  P: TdxPoint;
begin
  try
    if (dataObj = nil) then
      Exit;
    if DXSceneTarget <> nil then
    begin
      with ScreenToClient(pt) do
        P := dxPoint(X, Y, 0);
      DXSceneTarget.DragDrop(GetDataObject, DXSceneTarget.AbsoluteToLocal(P));
    end;
    if (FDropTargetHelper <> nil) then
      FDropTargetHelper.Drop(DataObj, pt, dwEffect)
  finally
    FDataObj := nil;
    FDropTargetHelper := nil;
  end;
end;

{$ENDIF}

{$IFDEF darwin}

procedure TdxScene.UpdateLayer;
var
  CGR: CGRect;
  ImgRef: CGImageRef;
begin
  if Handle = 0 then
    Exit;
  if Canvas = nil then
    Exit;
  if (DesignTime) then
    Exit;
  if not (Owner is TWinControl) then
    Exit;
  if TWinControl(Owner).Handle = 0 then
    Exit;
  if Canvas.FBufferBits = nil then
    Exit;

  if (inherited Canvas.Handle <> 0) then
  begin
    CGR.origin.x := 0;
    CGR.origin.y := 0;
    CGR.size.width := Canvas.FWidth;
    CGR.size.height := Canvas.FHeight;
    ImgRef := CGBitmapContextCreateImage(Canvas.FBufferHandle);
    CGContextDrawImage(CGContextRef(inherited Canvas.Handle), CGR, ImgRef);
    CFRelease(ImgRef);
  end;
end;
{$ENDIF}

{$IFDEF linux}

procedure TdxScene.UpdateLayer;
begin
  if Handle = 0 then
    Exit;
  if Canvas = nil then
    Exit;
  if (DesignTime) then
    Exit;
  if not (Owner is TWinControl) then
    Exit;
  if TWinControl(Owner).Handle = 0 then
    Exit;
  if Canvas.FBufferBits = nil then
    Exit;

end;
{$ENDIF}

{$IFDEF linux}

procedure TdxScene.Invalidate;
begin
  if csCustomPaint in FControlState then
    exit;
  inherited Invalidate;
end;

procedure TdxScene.EraseBackground(DC: HDC);
begin
end;
{$ENDIF}

procedure TdxScene.Paint;
begin
  if not FDisableDraw then
    Draw;
end;

function TdxScene.ObjectByPoint(X, Y: single): TdxVisualObject;
var
  i: integer;
  Obj, NewObj: TdxObject;
  Distance: single;
begin
  Result := nil;
  for i := Count - 1 downto 0 do
  begin
    Obj := Children[i];
    if not (Obj is TdxVisualObject) then
      Exit;
    if Obj.Tag = $FFFE then
      Continue;
    if not TdxVisualObject(Obj).Visible and (not DesignTime) then
      Continue;
    if (TdxVisualObject(Obj).Locked) and (DesignTime) then
      Continue;

    Distance := $FFFF;
    // first see screen projection
    NewObj := TdxVisualObject(Obj).ObjectByPoint(X, Y, dxProjectionScreen, Distance);
    if (NewObj <> nil) then
    begin
      Result := TdxVisualObject(NewObj);
    end
    else
    begin
      Distance := $FFFF;
      NewObj := TdxVisualObject(Obj).ObjectByPoint(X, Y, dxProjectionCamera, Distance);
      if (NewObj <> nil) and (NewObj <> Root) then
      begin
        Result := TdxVisualObject(NewObj);
      end
      else
        if TdxVisualObject(Root).CheckHitTest(TdxVisualObject(Root).HitTest) then
      begin
        if (not DesignTime and not AllowDrag) then
          Result := TdxVisualObject(Root)
        else
          Result := nil;
      end
      else
        Result := nil;
    end;
  end;
end;

procedure TdxScene.DeleteChildren;
var
  Child: TdxObject;
begin
  if Assigned(FChildren) then
    while FChildren.Count > 0 do
    begin
      Child := TdxObject(FChildren[0]);
      FChildren.Delete(0);
      Child.FParent := nil;
      Child.FScene := nil;
      Child.Free;
    end;
end;

procedure TdxScene.AddObject(AObject: TdxObject);
begin
  if AObject.Parent <> nil then
    AObject.Parent := nil;
  if FChildren = nil then
    FChildren := TList.Create;
  FChildren.Add(AObject);
  AObject.FScene := Self;
  if AObject.IsVisual and not (csDestroying in ComponentState) then
    TdxVisualObject(AObject).Repaint;
  if (DesignTime) and (AObject is TdxCamera) and (AObject.Tag <> $FFFE) then
    Camera := TdxCamera(AObject);
end;

procedure TdxScene.RemoveObject(AObject: TdxObject);
begin
  if FChildren <> nil then
  begin
    FChildren.Remove(AObject);
    Invalidate;
  end;
end;

function TdxScene.GetCount: integer;
begin
  if FChildren <> nil then
    Result := FChildren.Count
  else
    Result := 0;
end;

function TdxScene.GetChildrenObject(Index: integer): TdxObject;
begin
  if FChildren <> nil then
    Result := TdxObject(FChildren[Index])
  else
    Result := nil;
end;

procedure TdxScene.SetChildren(Index: integer; const Value: TdxObject);
begin
end;

procedure TdxScene.BeginDrag;
var
  P: TPoint;
begin
  FDragging := true;
  GetCursorPos(P);
  P := TWinControl(Owner).ScreenToClient(P);
  //  FDownPos := dxPoint(P.X, P.Y);
  MouseCapture;
end;

procedure TdxScene.BeginResize;
var
  P: TPoint;
begin
  FResizing := true;
  GetCursorPos(P);
  P := TWinControl(Owner).ScreenToClient(P);
  //  FDownPos := dxPoint(P.X, P.Y);
  FResizeSize := Point(TWinControl(Owner).Width, TWinControl(Owner).Height);
  MouseCapture;
end;

function TdxScene.SnapToGridValue(Value: single): single;
begin
  if (DesignSnapToGrid) and (DesignSnapGridSize <> 0) then
    Result := Trunc(Value / DesignSnapGridSize) * DesignSnapGridSize
  else
    Result := Value;
end;

procedure TdxScene.SnapToGridLines(AllowChangePosition: boolean);
var
  i: integer;
begin
  Exit;
  if (DesignSnapToLines) and (FSelected.Parent <> nil) then
    for i := 0 to FSelected.Parent.FChildren.Count - 1 do
    begin
      if TdxObject(FSelected.Parent.FChildren[i]) = FSelected then
        Continue;
      if not TdxObject(FSelected.Parent.FChildren[i]).isVisual then
        Continue;
      with TdxVisualObject(FSelected.Parent.FChildren[i]) do
      begin
        if (Abs(Position.X - FSelected.Position.X) < (2)) then
        begin
          if AllowChangePosition then
            FSelected.Position.X := Position.X;
          SetLength(FDesignGridLines, Length(FDesignGridLines) + 1);
          FDesignGridLines[High(FDesignGridLines)] := TdxVisualObject(FSelected.Parent.FChildren[i]);
          Continue;
        end;
        if (Abs(Position.Y - FSelected.Position.Y) < (2)) then
        begin
          if AllowChangePosition then
            FSelected.Position.Y := Position.Y;
          SetLength(FDesignGridLines, Length(FDesignGridLines) + 1);
          FDesignGridLines[High(FDesignGridLines)] := TdxVisualObject(FSelected.Parent.FChildren[i]);
          Continue;
        end;
        if (Abs(Position.X - (FSelected.Position.X + FSelected.Width)) < (2)) then
        begin
          if AllowChangePosition then
            FSelected.Position.X := Position.X - FSelected.Width;
          SetLength(FDesignGridLines, Length(FDesignGridLines) + 1);
          FDesignGridLines[High(FDesignGridLines)] := TdxVisualObject(FSelected.Parent.FChildren[i]);
          Continue;
        end;
        if (Abs(Position.Y - (FSelected.Position.Y + FSelected.Height)) < (2)) then
        begin
          if AllowChangePosition then
            FSelected.Position.Y := Position.Y - FSelected.Height;
          SetLength(FDesignGridLines, Length(FDesignGridLines) + 1);
          FDesignGridLines[High(FDesignGridLines)] := TdxVisualObject(FSelected.Parent.FChildren[i]);
          Continue;
        end;
        if (Abs((Position.X + Width) - FSelected.Position.X) < (2)) then
        begin
          if AllowChangePosition then
            FSelected.Position.X := Position.X + Width;
          SetLength(FDesignGridLines, Length(FDesignGridLines) + 1);
          FDesignGridLines[High(FDesignGridLines)] := TdxVisualObject(FSelected.Parent.FChildren[i]);
          Continue;
        end;
        if (Abs((Position.Y + Height) - FSelected.Position.Y) < (2)) then
        begin
          if AllowChangePosition then
            FSelected.Position.Y := Position.Y + Height;
          SetLength(FDesignGridLines, Length(FDesignGridLines) + 1);
          FDesignGridLines[High(FDesignGridLines)] := TdxVisualObject(FSelected.Parent.FChildren[i]);
          Continue;
        end;
        if (Abs((Position.X + Width) - (FSelected.Position.X + FSelected.Width)) < (2)) then
        begin
          if AllowChangePosition then
            FSelected.Position.X := Position.X + Width - FSelected.Width;
          SetLength(FDesignGridLines, Length(FDesignGridLines) + 1);
          FDesignGridLines[High(FDesignGridLines)] := TdxVisualObject(FSelected.Parent.FChildren[i]);
          Continue;
        end;
        if (Abs((Position.Y + Height) - (FSelected.Position.Y + FSelected.Height)) < (2)) then
        begin
          if AllowChangePosition then
            FSelected.Position.Y := Position.Y + Height - FSelected.Height;
          SetLength(FDesignGridLines, Length(FDesignGridLines) + 1);
          FDesignGridLines[High(FDesignGridLines)] := TdxVisualObject(FSelected.Parent.FChildren[i]);
          Continue;
        end;
      end;
    end;
end;

function TdxScene.SnapPointToGridLines(const APoint: TdxPoint): TdxPoint;
var
  i: integer;
begin
  Result := APoint;
  if not DesignSnapToLines then
    Exit;
  if FSelected = nil then
    Exit;
  if FSelected.Parent = nil then
    Exit;
  SnapToGridLines(false);
  if Length(FDesignGridLines) > 0 then
  begin
    Result := FSelected.LocalToAbsolute(APoint);
    Result := TdxVisualObject(FSelected.Parent).AbsoluteToLocal(Result);
    for i := 0 to High(FDesignGridLines) do
    begin
      if Abs(Result.X - FDesignGridLines[i].Position.X) < (4) then
        Result.X := FDesignGridLines[i].Position.X;
      if Abs(Result.Y - FDesignGridLines[i].Position.Y) < (4) then
        Result.Y := FDesignGridLines[i].Position.Y;
      if Abs(Result.X - (FDesignGridLines[i].Position.X + FDesignGridLines[i].Width)) < (4) then
        Result.X := FDesignGridLines[i].Position.X + FDesignGridLines[i].Width;
      if Abs(Result.Y - (FDesignGridLines[i].Position.Y + FDesignGridLines[i].Height)) < (4) then
        Result.Y := FDesignGridLines[i].Position.Y + FDesignGridLines[i].Height;
    end;
    Result := TdxVisualObject(FSelected.Parent).LocalToAbsolute(Result);
    Result := FSelected.AbsolutetoLocal(Result);
  end;
end;

procedure TdxScene.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  P: TdxPoint;
  R: TvxRect;
  Obj: TdxVisualObject;
  InsertObject: TdxObject;
  V, V1, BoxCenter: TdxVector;
  i: integer;
begin
  inherited;
  if Canvas = nil then
    Exit;
  if not (DesignTime) and not Assigned(FOnFlush) then
    SetFocus;
  { translate coord }
  FUnsnapMousePos := dxPoint(x, y, 0);
  FMousePos := dxPoint(SnapToGridValue(x), SnapToGridValue(y), 0);
  FDownPos := FMousePos;
  SetLength(FDesignGridLines, 0);
  { design }
  if (DesignTime) then
  begin
    { Create root }
    if (Root = nil) then
    begin
      Obj := TdxVisualObject.Create(Owner);
      if dxDesigner <> nil then
        Obj.Name := dxDesigner.UniqueName(Owner, 'Root');
      AddObject(Obj);
      Exit;
    end;
    { Resize }
    if (FSelected <> nil) and (FSelected <> Root) then
    begin
      Canvas.Pick(FDownPos.X, FDownPos.Y, FSelected.Projection, V, V1);
      V := FSelected.AbsoluteToLocalVector(V);
      V1 := FSelected.AbsoluteToLocalVector(V1);
      if FSelected.FCanResize then
      begin
        { rightTop }
        BoxCenter := dxVectorAdd(dxVector(0, 0, 0), dxVector(FSelected.Width / 2, -FSelected.Height / 2, FSelected.Depth / 2));
        if RayCastIntersectsSphere(V, V1, BoxCenter, GripSize * 2) then
        begin
          if dxDesigner <> nil then
            dxDesigner.SelectObject(Owner, FSelected, []);
          FRightTop := true;
          FMoving := false;
          Exit;
        end;
        { leftFar }
        BoxCenter := dxVectorAdd(dxVector(0, 0, 0), dxVector(-FSelected.Width / 2, FSelected.Height / 2, FSelected.Depth / 2));
        if RayCastIntersectsSphere(V, V1, BoxCenter, GripSize * 2) then
        begin
          if dxDesigner <> nil then
            dxDesigner.SelectObject(Owner, FSelected, []);
          FLeftFar := true;
          FMoving := false;
          Exit;
        end;
      end;
      if FSelected.FCanRotate then
      begin
        if FSelected.Projection = dxProjectionCamera then
        begin
          { rotatez }
          BoxCenter := dxVectorAdd(dxVector(0, 0, 0), dxVector(0, 0, FSelected.Depth / 2 + RotateGripDist));
          if RayCastIntersectsSphere(V, V1, BoxCenter, GripSize * 2) then
          begin
            if dxDesigner <> nil then
              dxDesigner.SelectObject(Owner, FSelected, []);
            FRotateX := true;
            FMoving := false;
            Exit;
          end;
          { rotatey }
          BoxCenter := dxVectorAdd(dxVector(0, 0, 0), dxVector(FSelected.Width / 2 + RotateGripDist, 0, 0));
          if RayCastIntersectsSphere(V, V1, BoxCenter, GripSize * 2) then
          begin
            if dxDesigner <> nil then
              dxDesigner.SelectObject(Owner, FSelected, []);
            FRotateY := true;
            FMoving := false;
            Exit;
          end;
        end;
        { rotatex }
        BoxCenter := dxVectorAdd(dxVector(0, 0, 0), dxVector(0, -FSelected.Height / 2 - RotateGripDist, 0));
        if RayCastIntersectsSphere(V, V1, BoxCenter, GripSize * 2) then
        begin
          if dxDesigner <> nil then
            dxDesigner.SelectObject(Owner, FSelected, []);
          FRotateZ := true;
          FMoving := false;
          Exit;
        end;
      end;
    end;
    { Change Selected }
    Obj := ObjectByPoint(FUnsnapMousePos.X, FUnsnapMousePos.Y);
    if (Obj <> nil) and (Obj = FSelected) and (ssDouble in Shift) then
    begin
      Obj.DesignClick;
    end;
    { Design interact }
    if (Obj = FSelected) and (FSelected <> nil) and (FSelected.DesignInteract) and ([ssShift] * Shift = []) then
    begin
      Canvas.Pick(FDownPos.X, FDownPos.Y, FSelected.Projection, V, V1);
      V := FSelected.AbsoluteToLocalVector(V);
      V1 := FSelected.AbsoluteToLocalVector(V1);
      FSelected.MouseDown(Button, Shift, FUnsnapMousePos.X, FUnsnapMousePos.Y, V, V1);
      Exit;
    end;
    { Popup }
    if Button = mbRight then
      OpenDesignPopup;
    if (Obj <> nil) then
    begin
      if (ssCtrl in Shift) and (Obj <> Selected) then
      begin
        { check is exists }
        for i := 0 to High(FSelection) do
          if FSelection[i] = Obj then
          begin
            FSelection[i] := Selected;
            Obj := nil;
          end;
        if Obj <> nil then
        begin
          SetLength(FSelection, Length(FSelection) + 1);
          FSelection[High(FSelection)] := Obj;
        end;
        if dxDesigner <> nil then
          dxDesigner.SelectObject(Owner, Selected, FSelection);
        Exit;
      end;
      SetLength(FSelection, 0);
      if (Obj <> FSelected) then
      begin
        if FSelected <> nil then
          FSelected.Repaint;
        FSelected := Obj;
        FSelected.DesignSelect;
        // Select in IDE
        if dxDesigner <> nil then
          dxDesigner.SelectObject(Owner, Obj, []);
        FSelected.Repaint;
      end
      else
        if (FSelected <> Root) then
        FMoving := true;
    end
    else
      if Root <> nil then
    begin
      if FSelected <> nil then
        FSelected.Repaint;
      FSelected := TdxVisualObject(Root);
      FSelected.DesignSelect;
      // Select in IDE
      if dxDesigner <> nil then
        dxDesigner.SelectObject(Owner, FSelected, []);
      FSelected.Repaint;
    end;
    Exit;
  end;
  { event }
  if not (DesignTime) then
  begin
    Obj := TdxVisualObject(ObjectByPoint(FUnsnapMousePos.X, FUnsnapMousePos.Y));
    if (Obj <> nil) then
    begin
      P := Obj.AbsoluteToLocal(dxPoint(FUnsnapMousePos.X, FUnsnapMousePos.Y, 0));
      Canvas.Pick(FUnsnapMousePos.X, FUnsnapMousePos.Y, Obj.Projection, V, V1);
      V := Obj.AbsoluteToLocalVector(V);
      V1 := Obj.AbsoluteToLocalVector(V1);
      Obj.MouseDown(Button, Shift, P.X, P.Y, V, V1);
    end
    else
      if AllowDrag and (Button = mbLeft) then
      BeginDrag;
  end;
end;

procedure TdxScene.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  R: TvxRect;
  P: TdxPoint;
  V, V1, V2: TdxVector;
  Obj: TdxVisualObject;
  SaveWidth: single;
  NewCursor: TCursor;
begin
  inherited;
  if Canvas = nil then
    Exit;
  NewCursor := FLoadCursor;
  { drag }
  if FDragging then
  begin
    with TWinControl(Owner).ScreenToClient(ClientToScreen(Point(X, Y))) do
    begin
      TWinControl(Owner).Left := TWinControl(Owner).Left + Trunc(X - FDownPos.X);
      TWinControl(Owner).Top := TWinControl(Owner).Top + Trunc(Y - FDownPos.Y);
    end;
    Exit;
  end;
  {  if Shift = [] then
    begin
      Obj := TdxVisualObject(ObjectByPoint(FMousePos.X, FMousePos.Y));
      if (Obj <> nil) and ((Obj.QueryInterface(IvgSizeGrip, SG) = 0) and Assigned(SG)) then
        SetCursor(Screen.Cursors[crSizeNWSE]);
    end;}
  if FResizing then
  begin
    with TWinControl(Owner).ScreenToClient(ClientToScreen(Point(X, Y))) do
    begin
      FResizeSize.X := FResizeSize.X + Trunc(X - FUnsnapMousePos.X);
      FResizeSize.Y := FResizeSize.Y + Trunc(Y - FUnsnapMousePos.Y);
      TWinControl(Owner).Width := FResizeSize.X;
      TWinControl(Owner).Height := FResizeSize.Y;
      //      SetCursor(Screen.Cursors[crSizeNWSE]);
    end;
    FUnsnapMousePos := dxPoint(x, y, 0);
    Exit;
  end;
  { translate coord }
  FMousePos := dxPoint(SnapToGridValue(x), SnapToGridValue(y), 0);
  FUnsnapMousePos := dxPoint(x, y, 0);
  { design }
  if (DesignTime) then
  begin
    { root pan and rotate }
    if FDesignAllowPanAndRotate and (ssLeft in Shift) and (ssAlt in Shift) then
    begin
      { rotate Z }
      FDesignCameraZ.RotateAngle.Z := FDesignCameraZ.RotateAngle.Z + ((FMousePos.X - FDownPos.X) * 0.3);
      { rotate X }
      FDesignCameraX.RotateAngle.X := FDesignCameraX.RotateAngle.X + ((FMousePos.Y - FDownPos.Y) * 0.3);
      FDownPos := FMousePos;
      Exit;
    end;
    { Manipulation }
    if FDesignAllowPanAndRotate and ((FSelected = nil) or (FSelected = Root)) and (ssLeft in Shift) and (ssShift in Shift) then
    begin
      Canvas.Pick(FDownPos.X, FDownPos.Y, dxProjectionCamera, V, V1);
      Canvas.Pick(FUnsnapMousePos.X, FUnsnapMousePos.Y, dxProjectionCamera, V, V2);
      if ssCtrl in Shift then
      begin
        { x0z }
        RayCastPlaneIntersect(V, V1, FDesignCameraZ.AbsolutePosition, FDesignCameraZ.AbsoluteDirection, V1);
        RayCastPlaneIntersect(V, V2, FDesignCameraZ.AbsolutePosition, FDesignCameraZ.AbsoluteDirection, V2);
      end
      else
      begin
        { x0y }
        RayCastPlaneIntersect(V, V1, FDesignCameraZ.AbsolutePosition, FDesignCameraZ.AbsoluteUp, V1);
        RayCastPlaneIntersect(V, V2, FDesignCameraZ.AbsolutePosition, FDesignCameraZ.AbsoluteUp, V2);
      end;
      FV1 := V1;
      FV2 := V2;
      if (FDesignCameraZ.Parent <> nil) and (FDesignCameraZ.Parent.IsVisual) then
      begin
        V1 := TdxVisualObject(FDesignCameraZ.Parent).AbsoluteToLocalVector(V1);
        V2 := TdxVisualObject(FDesignCameraZ.Parent).AbsoluteToLocalVector(V2);
      end;
      V := dxVectorSubtract(V1, V2);
      FDesignCameraZ.Position.Vector := dxVectorAdd(FDesignCameraZ.Position.Vector, V);
      FDownPos := FMousePos;
      Exit;
    end;
    { resize and move }
    if (FSelected <> Root) and (FSelected <> nil) then
    begin
      if (ssLeft in Shift) and (FMoving) then
      begin
        Canvas.Pick(FDownPos.X, FDownPos.Y, FSelected.Projection, V, V1);
        Canvas.Pick(FUnsnapMousePos.X, FUnsnapMousePos.Y, FSelected.Projection, V, V2);
        if ssCtrl in Shift then
        begin
          { x0z }
          RayCastPlaneIntersect(V, V1, FSelected.AbsolutePosition, dxVector(0, 1, 0), V1);
          RayCastPlaneIntersect(V, V2, FSelected.AbsolutePosition, dxVector(0, 1, 0), V2);
        end
        else
        begin
          { x0y }
          RayCastPlaneIntersect(V, V1, FSelected.AbsolutePosition, dxVector(0, 0, 1), V1);
          RayCastPlaneIntersect(V, V2, FSelected.AbsolutePosition, dxVector(0, 0, 1), V2);
        end;
        FV1 := V1;
        FV2 := V2;
        if (FSelected.Parent <> nil) and (FSelected.Parent.IsVisual) then
        begin
          V1 := TdxVisualObject(FSelected.Parent).AbsoluteToLocalVector(V1);
          V2 := TdxVisualObject(FSelected.Parent).AbsoluteToLocalVector(V2);
        end;
        V := dxVectorSubtract(V2, V1);
        with dxVectorAdd(FSelected.Position.Vector, V) do
        begin
          if FSelected.Projection = dxProjectionScreen then
            FSelected.Position.Vector := dxVector(round(X), round(Y), round(Z))
          else
            FSelected.Position.Vector := dxVector(X, Y, Z);
        end;
        { lines grid }
        SnapToGridLines(true);
        { check place }
        FSelected.FLocked := true;
        Obj := TdxVisualObject(ObjectByPoint(FUnsnapMousePos.X, FUnsnapMousePos.Y));
        FSelected.FLocked := false;
      end;
      if FSelected.FCanResize then
      begin
        if (ssLeft in Shift) and (FSelected <> nil) and (FRightTop) then
        begin
          Canvas.Pick(FDownPos.X, FDownPos.Y, FSelected.Projection, V, V1);
          Canvas.Pick(FUnsnapMousePos.X, FUnsnapMousePos.Y, FSelected.Projection, V, V2);
          { x0z }
          RayCastPlaneIntersect(V, V1, FSelected.AbsolutePosition, FSelected.AbsoluteDirection, V1);
          RayCastPlaneIntersect(V, V2, FSelected.AbsolutePosition, FSelected.AbsoluteDirection, V2);
          V1 := TdxVisualObject(FSelected).AbsoluteToLocalVector(V1);
          V2 := TdxVisualObject(FSelected).AbsoluteToLocalVector(V2);
          V := dxVectorSubtract(V2, V1);
          FSelected.Width := FSelected.Width + V.X;
          FSelected.Depth := FSelected.Depth + V.Z;
          FSelected.Repaint;
        end;
        if (ssLeft in Shift) and (FSelected <> nil) and (FLeftFar) then
        begin
          Canvas.Pick(FDownPos.X, FDownPos.Y, FSelected.Projection, V, V1);
          Canvas.Pick(FUnsnapMousePos.X, FUnsnapMousePos.Y, FSelected.Projection, V, V2);
          { x0y }
          RayCastPlaneIntersect(V, V1, FSelected.AbsolutePosition, FSelected.AbsoluteUp, V1);
          RayCastPlaneIntersect(V, V2, FSelected.AbsolutePosition, FSelected.AbsoluteUp, V2);
          V1 := TdxVisualObject(FSelected).AbsoluteToLocalVector(V1);
          V2 := TdxVisualObject(FSelected).AbsoluteToLocalVector(V2);
          V := dxVectorSubtract(V2, V1);
          FSelected.Width := FSelected.Width - V.X;
          FSelected.Height := FSelected.Height + V.Y;
          FSelected.Repaint;
        end;
      end;
      if FSelected.FCanRotate then
      begin
        if (ssLeft in Shift) and (FSelected <> nil) and (FRotateX) then
        begin
          Canvas.Pick(FUnsnapMousePos.X, FUnsnapMousePos.Y, FSelected.Projection, V, V2);
          { x0y }
          RayCastPlaneIntersect(V, V2, FSelected.AbsolutePosition, FSelected.AbsoluteRight, V2);
          V1 := dxVector(0, 0, 1);
          V2 := TdxVisualObject(FSelected).AbsoluteToLocalVector(V2);
          V := dxVectorCrossProduct(V1, V2);
          if V.X < 0 then
            FSelected.RotateAngle.X := FSelected.RotateAngle.X + RadToDeg(ArcCos(dxVectorAngleCosine(V1, V2)))
          else
            FSelected.RotateAngle.X := FSelected.RotateAngle.X - RadToDeg(ArcCos(dxVectorAngleCosine(V1, V2)));
          FSelected.Repaint;
        end;
        if (ssLeft in Shift) and (FSelected <> nil) and (FRotateY) then
        begin
          Canvas.Pick(FUnsnapMousePos.X, FUnsnapMousePos.Y, FSelected.Projection, V, V2);
          { x0y }
          RayCastPlaneIntersect(V, V2, FSelected.AbsolutePosition, FSelected.AbsoluteDirection, V2);
          V1 := dxVector(1, 0, 0);
          V2 := TdxVisualObject(FSelected).AbsoluteToLocalVector(V2);
          V := dxVectorCrossProduct(V1, V2);
          if V.Y > 0 then
            FSelected.RotateAngle.Y := FSelected.RotateAngle.Y + RadToDeg(ArcCos(dxVectorAngleCosine(V1, V2)))
          else
            FSelected.RotateAngle.Y := FSelected.RotateAngle.Y - RadToDeg(ArcCos(dxVectorAngleCosine(V1, V2)));
          FSelected.Repaint;
        end;
        if (ssLeft in Shift) and (FSelected <> nil) and (FRotateZ) then
        begin
          Canvas.Pick(FUnsnapMousePos.X, FUnsnapMousePos.Y, FSelected.Projection, V, V2);
          { x0y }
          RayCastPlaneIntersect(V, V2, FSelected.AbsolutePosition, FSelected.AbsoluteUp, V2);
          V1 := dxVector(0, -1, 0);
          V2 := TdxVisualObject(FSelected).AbsoluteToLocalVector(V2);
          V := dxVectorCrossProduct(V1, V2);
          if V.Z < 0 then
            FSelected.RotateAngle.Z := FSelected.RotateAngle.Z + RadToDeg(ArcCos(dxVectorAngleCosine(V1, V2)))
          else
            FSelected.RotateAngle.Z := FSelected.RotateAngle.Z - RadToDeg(ArcCos(dxVectorAngleCosine(V1, V2)));
          FSelected.Repaint;
        end;
      end;
      FDownPos := FMousePos;
    end;
    { Design interact }
    if (FSelected <> nil) and (FSelected.DesignInteract) then
    begin
      Canvas.Pick(FDownPos.X, FDownPos.Y, FSelected.Projection, V, V1);
      V := FSelected.AbsoluteToLocalVector(V);
      V1 := FSelected.AbsoluteToLocalVector(V1);
      FSelected.MouseMove(Shift, FUnsnapMousePos.X, FUnsnapMousePos.Y, 0, 0, V, V1);
      Exit;
    end;
    Exit;
  end;
  { event }
  if not (DesignTime) then
  begin
    if (FCaptured <> nil) then
    begin
      P := FCaptured.AbsoluteToLocal(dxPoint(FUnsnapMousePos.X, FUnsnapMousePos.Y, 0));
      Canvas.Pick(FUnsnapMousePos.X, FUnsnapMousePos.Y, FCaptured.Projection, V, V1);
      V := FCaptured.AbsoluteToLocalVector(V);
      V1 := FCaptured.AbsoluteToLocalVector(V1);
      FCaptured.MouseMove(Shift, P.X, P.Y, 0, 0, V, V1);
      Exit;
    end;
    Obj := TdxVisualObject(ObjectByPoint(FUnsnapMousePos.X, FUnsnapMousePos.Y));
    if (Obj <> nil) then
    begin
      {      if (Obj.QueryInterface(IvgSizeGrip, SG) = 0) and Assigned(SG) then
              NewCursor := crSizeNWSE
            else}
      NewCursor := Obj.Cursor;

      if (Obj <> FHovered) then
      begin
        if FHovered <> nil then
        begin
          FHovered.MouseInObject := false;
          FHovered.MouseLeave;
        end;
        FHovered := Obj;
        FHovered.MouseInObject := true;
        FHovered.MouseEnter;
      end;

      P := Obj.AbsoluteToLocal(dxPoint(FUnsnapMousePos.X, FUnsnapMousePos.Y, 0));
      Canvas.Pick(FUnsnapMousePos.X, FUnsnapMousePos.Y, Obj.Projection, V, V1);
      V := Obj.AbsoluteToLocalVector(V);
      V1 := Obj.AbsoluteToLocalVector(V1);
      Obj.MouseMove(Shift, P.X, P.Y, 0, 0, V, V1);
    end
    else
      if FHovered <> nil then
    begin
      FHovered.MouseInObject := false;
      FHovered.MouseLeave;
      FHovered := nil;
    end;
  end;
  FDownPos := FMousePos;
  Cursor := NewCursor;
end;

procedure TdxScene.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var
  P: TdxPoint;
  Obj: TdxVisualObject;
  V, V1: TdxVector;
begin
  inherited;
  if Canvas = nil then
    Exit;
  { design }
  SetLength(FDesignGridLines, 0);
  if (FSelected <> nil) and (FMoving or FRightTop or FLeftFar or FRotateY or FRotateX or FRotateZ) then
  begin
    if (FSelected.Parent <> nil) and (TdxObject(FSelected.Parent).IsVisual) then
      TdxVisualObject(FSelected.Parent).Realign;
    if (dxDesigner <> nil) then
      dxDesigner.Modified(Owner);
    if not Assigned(FOnFlush) then
      ReleaseCapture;
  end;
  FMoving := false;
  FRightTop := false;
  FLeftFar := false;
  FRotateY := false;
  FRotateZ := false;
  FRotateX := false;
  { drag }
  if FDragging then
  begin
    FDragging := false;
    ReleaseCapture;
  end;
  if FResizing then
  begin
    FResizing := false;
    ReleaseCapture;
  end;
  { event }
  if not (DesignTime) then
  begin
    if (FCaptured <> nil) then
    begin
      P := FCaptured.AbsoluteToLocal(dxPoint(FUnsnapMousePos.X, FUnsnapMousePos.Y, 0));
      Canvas.Pick(FUnsnapMousePos.X, FUnsnapMousePos.Y, FCaptured.Projection, V, V1);
      V := FCaptured.AbsoluteToLocalVector(V);
      V1 := FCaptured.AbsoluteToLocalVector(V1);
      FCaptured.MouseUp(Button, Shift, P.X, P.Y, V, V1);
      Exit;
    end;
    Obj := TdxVisualObject(ObjectByPoint(FUnsnapMousePos.X, FUnsnapMousePos.Y));
    if (Obj <> nil) then
    begin
      P := Obj.AbsoluteToLocal(dxPoint(FUnsnapMousePos.X, FUnsnapMousePos.Y, 0));
      Canvas.Pick(FUnsnapMousePos.X, FUnsnapMousePos.Y, Obj.Projection, V, V1);
      V := Obj.AbsoluteToLocalVector(V);
      V1 := Obj.AbsoluteToLocalVector(V1);
      Obj.MouseUp(Button, Shift, P.X, P.Y, V, V1);
    end;
  end
  else
  begin
    { Design interact }
    if (FSelected <> nil) and (FSelected.DesignInteract) then
    begin
      Canvas.Pick(FDownPos.X, FDownPos.Y, FSelected.Projection, V, V1);
      V := FSelected.AbsoluteToLocalVector(V);
      V1 := FSelected.AbsoluteToLocalVector(V1);
      FSelected.MouseUp(Button, Shift, FUnsnapMousePos.X, FUnsnapMousePos.Y, V, V1);
      Exit;
    end;
  end;
end;

function TdxScene.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
  MousePos: TPoint): Boolean;
var
  Obj: TdxVisualObject;
begin
  {$IFNDEF FPC}
  MousePos := ScreenToClient(MousePos);
  {$ENDIF}
  Result := inherited DoMouseWheel(Shift, WheelDelta, MousePos);
  {$IFDEF DARWIN}
  //  WheelDelta := WheelDelta * 40;
  {$ENDIF}
  { event }
  if (FDesignCamera <> nil) and (FDesignTime) then
  begin
    FDesignCamera.Position.Vector := dxVectorAdd(FDesignCamera.Position.Vector, dxVectorScale(dxVector(0, 1, 0), WheelDelta / 120));
  end;
  if not (DesignTime) then
  begin
    if (FCaptured <> nil) then
    begin
      FCaptured.MouseWheel(Shift, WheelDelta, Result);
      Exit;
    end;
    Obj := TdxVisualObject(ObjectByPoint(FMousePos.X, FMousePos.Y));
    while (Obj <> nil) do
    begin
      Obj.MouseWheel(Shift, WheelDelta, Result);
      if Result then
        Break;
      if (Obj.Parent <> nil) and (Obj.Parent.IsVisual) then
        Obj := TdxVisualObject(Obj.Parent)
      else
        Obj := nil;
    end;
  end;
end;

procedure TdxScene.CMDesignHitTest(var Msg: {$IFDEF FPC}TLMMouse{$ELSE}TCMDesignHitTest{$ENDIF});
begin
  inherited;
  Msg.Result := 1;
end;

procedure TdxScene.CMHintShow(var Message: {$IFDEF FPC}TLMessage{$ELSE}TMessage{$ENDIF});
var
  Obj: TdxVisualObject;
begin
  inherited;
  with TCMHintShow(Message).HintInfo^ do
  begin
    Obj := ObjectByPoint(CursorPos.X, CursorPos.Y);
    if (Obj <> nil) and (Obj.ShowHint) then
    begin
      if not Obj.DoHintShow(Message) then
      begin
        HintStr := Obj.Hint;
        CursorRect := Rect(CursorPos.X - 10, CursorPos.Y - 10, CursorPos.X + 10, CursorPos.Y + 10);
      end;
    end
    else
    begin
      HintStr := '';
    end;
  end;
end;

{$IFDEF WINDOWS}

procedure TdxScene.WMEraseBkgnd(var Msg: TWMEraseBkgnd);
begin
  Msg.Result := 1;
end;

procedure TdxScene.WMPaint(var Msg: TWMPaint);
begin
  inherited;
end;

{$IFNDEF FPC}

procedure TdxScene.WMGetDlgCode(var Msg: TWMGetDlgCode);
begin
  inherited;
  Msg.Result := DLGC_WANTTAB or dlgc_WantArrows or DLGC_WANTCHARS;
end;

procedure AssignToLogFont(var LogFont: TLogFont; Font: TdxFont);
var
  ppi: Integer;
  b: TBitmap;
begin
  FillChar(LogFont, sizeof(LogFont), 0);
  b := TBitmap.Create;
  b.Width := 1;
  b.Height := 1;
  b.Canvas.Font.Name := Font.Family;
  with LogFont do
  begin
    ppi := b.Canvas.Font.PixelsPerInch;
    lfHeight := -MulDiv(trunc(Font.size), ppi, 72);
    if Font.Style in [dxFontBoldItalic, dxFontBold] then
      lfWeight := FW_BOLD
    else
      lfWeight := FW_NORMAL;
    lfItalic := Byte(Font.Style in [dxFontBoldItalic, dxFontItalic]);
    lfUnderline := 0;
    lfStrikeOut := 0;
    StrPCopy(lfFaceName, b.Canvas.Font.Name);
    lfQuality := DEFAULT_QUALITY;
    lfOutPrecision := OUT_DEFAULT_PRECIS;
    lfClipPrecision := CLIP_DEFAULT_PRECIS;
    lfPitchAndFamily := DEFAULT_PITCH;
  end;
  b.Free;
end;

procedure TdxScene.WMImeComposition(var Message: TMessage);
var
  i: integer;
  IMC: HIMC;
  s: WideString;
  Size: Integer;
  strend: PChar;
  key: word;
  char: widechar;
begin
  if (Message.LParam and GCS_RESULTSTR) <> 0 then
  begin
    IMC := ImmGetContext(Handle);
    if IMC <> 0 then
    begin
      begin
        try
          Size := ImmGetCompositionStringW(IMC, GCS_RESULTSTR, nil, 0);
          SetLength(s, Size div 2);
          FillChar(PChar(s)^, Size, 0);
          ImmGetCompositionStringW(IMC, GCS_RESULTSTR, PWideChar(s), Size);
        finally
          ImmReleaseContext(Handle, IMC);
        end;
      end;
      for i := 1 to Length(s) do
      begin
        key := 0;
        char := s[i];
        NewKeyDown(key, char, []);
      end;
      Message.Result := 0;
    end;
    if (GetKeyboardLayout(0) and $FFFF) = $0412 then // Special support for Korean IME
      PostMessage(Handle, WM_IME_STARTCOMPOSITION, 0, 0);
  end
  else
    inherited;
end;

procedure TdxScene.WMImeStartComposition(var Message: TMessage);
var
  IMC: HIMC;
  LogFont: TLogFont;
  CF: TCompositionForm;
  F: TdxFont;
begin
  Message.Result := 1;
  inherited;
  IMC := ImmGetContext(Handle);
  F := nil;
  if IMC <> 0 then
  begin
    FillChar(CF, SizeOf(CF), 0);
    F := TdxFont.Create;
    AssignToLogFont(LogFont, F);
    ImmSetCompositionFont(IMC, @LogFont);
    CF.dwStyle := CFS_RECT;
    CF.rcArea := ClientRect;
    if Focused <> nil then
    begin
      with Focused.LocalToAbsolute(dxPoint(-Focused.Width / 2, -Focused.Height / 2, -Focused.Depth / 2)) do
        CF.ptCurrentPos := Point(trunc(x), trunc(y));
    end
    else
    begin
      CF.ptCurrentPos := Point(Left, Top);
    end;
    if (GetKeyboardLayout(0) and $FFFF) = $0412 then
    begin // Special support for Korean IME
      CF.rcArea.TopLeft := CF.ptCurrentPos;
      OffsetRect(CF.rcArea, 0, 1);
    end;
    ImmSetCompositionWindow(IMC, @CF);
    ImmReleaseContext(Handle, IMC);
    if F <> nil then
      F.Free;
  end;
end;

procedure TdxScene.WMKeyDown(var Message: TWMKeyDown);
var
  ShiftState: TShiftState;
  Ch: WideChar;
  NewKey: word;
begin
  with Message do
  begin
    Ch := #0;
    NewKey := Message.CharCode;
    ShiftState := KeyDataToShiftState(KeyData);
    NewKeyDown(NewKey, Ch, ShiftState);
  end;
  inherited;
end;

procedure TdxScene.WMKeyUp(var Message: TWMKeyUp);
var
  ShiftState: TShiftState;
  Ch: WideChar;
  NewKey: word;
begin
  with Message do
  begin
    Ch := #0;
    NewKey := Message.CharCode;
    ShiftState := KeyDataToShiftState(KeyData);
    NewKeyUp(NewKey, Ch, ShiftState);
  end;
  inherited;
end;

procedure TdxScene.WMChar(var Message: TWMChar);
var
  ShiftState: TShiftState;
  Ch: WideChar;
  NewKey: word;
begin
  with Message do
  begin
    Ch := Widechar(CharCode);
    ShiftState := KeyDataToShiftState(KeyData);
    case Ch of
      #3: // ctrl+c
        begin
          Ch := 'c';
          NewKeyDown(NewKey, Ch, ShiftState);
        end;
      #$16: // ctrl+v
        begin
          Ch := 'v';
          NewKeyDown(NewKey, Ch, ShiftState);
        end;
      #$18: // ctrl+x
        begin
          Ch := 'x';
          NewKeyDown(NewKey, Ch, ShiftState);
        end;
      #$1A: // ctrl+z
        begin
          Ch := 'z';
          NewKeyDown(NewKey, Ch, ShiftState);
        end;
      #13: ;
    else
      NewKey := 0;
      NewKeyDown(NewKey, Ch, ShiftState);
    end;
  end;
  inherited;
end;

{$ENDIF}

{$ENDIF}

{$IFDEF FPC}

procedure TdxScene.KeyUp(var Key: Word; Shift: TShiftState);
var
  Char: system.WideChar;
begin
  inherited;
  FShift := [];
  if (DesignTime) then
  begin
    if (Key = VK_DELETE) and (FSelected <> nil) then
    begin
      FSelected.Free;
      FSelected := nil;
    end;
  end;
  { focused handler }
  if FFocused <> nil then
  begin
    Char := #0;
    FFocused.KeyUp(Key, char, Shift);
  end;
end;

procedure TdxScene.KeyDown(var Key: Word; Shift: TShiftState);
var
  List: TList;
  i, CurIdx: integer;
  Found: boolean;
  K: Word;
  Ch, Char: System.WideChar;
begin
  inherited;
  {$IFDEF FPC}
  FShift := Shift;
  if ssMeta in Shift then
  begin
    K := 0;
    case Key of
      67: // ctrl+c
        begin
          Ch := 'c';
          NewKeyDown(K, Ch, [ssCtrl]);
          NewKeyUp(K, Ch, [ssCtrl]);
          Exit;
        end;
      86: // ctrl+v
        begin
          Ch := 'v';
          NewKeyDown(K, Ch, [ssCtrl]);
          NewKeyUp(K, Ch, [ssCtrl]);
          Exit;
        end;
      88: // ctrl+x
        begin
          Ch := 'x';
          NewKeyDown(K, Ch, [ssCtrl]);
          NewKeyUp(K, Ch, [ssCtrl]);
          Exit;
        end;
      99: // ctrl+z
        begin
          Ch := 'z';
          NewKeyDown(K, Ch, [ssCtrl]);
          NewKeyUp(K, Ch, [ssCtrl]);
          Exit;
        end;
    end;
  end;
  { change focus }
  if (Key = VK_TAB) and (Root <> nil) then
  begin
    Key := 0;
    List := TList.Create;
    TdxVisualObject(Root).GetTabOrderList(List);
    if ssShift in Shift then
    begin
      if (FFocused <> nil) then
      begin
        if FFocused is TdxCustomObjectLayer then
        begin
          CurIdx := List.IndexOf(TdxCustomObjectLayer(FFocused).Focused) - 1
        end
        else
          CurIdx := List.IndexOf(FFocused) - 1
      end
      else
        CurIdx := 0;
      Found := false;
      { first search in last part of list }
      if CurIdx > 0 then
        for i := CurIdx - 1 downto 0 do
        begin
          if (TObject(List[i]) is TdxObject) and TdxObject(List[i]).isVisual then
          begin
            if TdxObject(List[i]).isVisual and TdxVisualObject(List[i]).Visible and (TdxVisualObject(List[i]).CanFocused) and (TdxVisualObject(List[i]) <> FFocused) then
            begin
              TdxVisualObject(List[i]).SetFocus;
              Found := true;
              Break;
            end;
          end;
          if (TObject(List[i]) is TvxObject) and TvxObject(List[i]).isVisual then
          begin
            if TvxObject(List[i]).isVisual and TvxVisualObject(List[i]).CheckParentVisible and TvxVisualObject(List[i]).CanFocused then
            begin
              TdxCustomObjectLayer(TvxVisualObject(List[i]).Scene.GetComponent).SetFocus;
              TvxVisualObject(List[i]).SetFocus;
              Found := true;
              Break;
            end;
          end;
        end;
      { second search in last part of list }
      if not Found then
        if (List.Count > 2) and (CurIdx < List.Count) then
          for i := List.Count - 1 downto CurIdx do
          begin
            if (TObject(List[i]) is TdxObject) and TdxObject(List[i]).isVisual then
            begin
              if TdxObject(List[i]).isVisual and TdxVisualObject(List[i]).Visible and (TdxVisualObject(List[i]).CanFocused) and (TdxVisualObject(List[i]) <> FFocused) then
              begin
                TdxVisualObject(List[i]).SetFocus;
                Found := true;
                Break;
              end;
            end;
            if (TObject(List[i]) is TvxObject) and TvxObject(List[i]).isVisual then
            begin
              if TvxObject(List[i]).isVisual and TvxVisualObject(List[i]).CheckParentVisible and TvxVisualObject(List[i]).CanFocused then
              begin
                TdxCustomObjectLayer(TvxVisualObject(List[i]).Scene.GetComponent).SetFocus;
                TvxVisualObject(List[i]).SetFocus;
                Found := true;
                Break;
              end;
            end;
          end;
    end
    else
    begin
      if (FFocused <> nil) then
      begin
        if FFocused is TdxCustomObjectLayer then
        begin
          CurIdx := List.IndexOf(TdxCustomObjectLayer(FFocused).Focused) + 1
        end
        else
          CurIdx := List.IndexOf(FFocused) + 1
      end
      else
        CurIdx := 0;
      Found := false;
      { first search in last part of list }
      if (List.Count > 2) and (CurIdx < List.Count) then
        for i := CurIdx to List.Count - 1 do
        begin
          if (TObject(List[i]) is TdxObject) and TdxObject(List[i]).isVisual then
          begin
            if TdxObject(List[i]).isVisual and TdxVisualObject(List[i]).Visible and (TdxVisualObject(List[i]).CanFocused) then
            begin
              TdxVisualObject(List[i]).SetFocus;
              Found := true;
              Break;
            end;
          end;
          if (TObject(List[i]) is TvxObject) and TvxObject(List[i]).isVisual then
          begin
            if TvxObject(List[i]).isVisual and TvxVisualObject(List[i]).CheckParentVisible and TvxVisualObject(List[i]).CanFocused then
            begin
              TdxCustomObjectLayer(TvxVisualObject(List[i]).Scene.GetComponent).SetFocus;
              TvxVisualObject(List[i]).SetFocus;
              Found := true;
              Break;
            end;
          end;
        end;
      { second search in last part of list }
      if not Found then
        if CurIdx > 0 then
          for i := 0 to CurIdx - 1 do
          begin
            if (TObject(List[i]) is TdxObject) and TdxObject(List[i]).isVisual then
            begin
              if TdxObject(List[i]).isVisual and TdxVisualObject(List[i]).Visible and (TdxVisualObject(List[i]).CanFocused) then
              begin
                TdxVisualObject(List[i]).SetFocus;
                Found := true;
                Break;
              end;
            end;
            if (TObject(List[i]) is TvxObject) and TvxObject(List[i]).isVisual then
            begin
              if TvxObject(List[i]).isVisual and TvxVisualObject(List[i]).CheckParentVisible and TvxVisualObject(List[i]).CanFocused then
              begin
                TdxCustomObjectLayer(TvxVisualObject(List[i]).Scene.GetComponent).SetFocus;
                TvxVisualObject(List[i]).SetFocus;
                Found := true;
                Break;
              end;
            end;
          end;
    end;
    List.Free;
    Exit;
  end;
  { focused handler }
  if FFocused <> nil then
  begin
    Char := #0;
    FFocused.KeyDown(Key, Char, Shift);
  end;
  {$ENDIF}
end;

procedure TdxScene.UTF8KeyPress(var UTF8Key: TUTF8Char);
var
  S: System.WideChar;
  K: word;
  C, Ch: System.WideChar;
begin
  K := 0;
  C := UTF8ToUTF16(UTF8Key)[1];
  case C of
    #3: // ctrl+c
      begin
        Ch := 'c';
        NewKeyDown(K, Ch, FShift);
        NewKeyUp(K, Ch, FShift);
      end;
    #$16: // ctrl+v
      begin
        Ch := 'v';
        NewKeyDown(K, Ch, FShift);
        NewKeyUp(K, Ch, FShift);
      end;
    #$18: // ctrl+x
      begin
        Ch := 'x';
        NewKeyDown(K, Ch, FShift);
        NewKeyUp(K, Ch, FShift);
      end;
    #$1A: // ctrl+z
      begin
        Ch := 'z';
        NewKeyDown(K, Ch, FShift);
        NewKeyUp(K, Ch, FShift);
      end;
  else
    NewKeyDown(K, C, FShift);
    NewKeyUp(K, C, FShift);
    UTF8Key := '';
  end;
end;
{$ENDIF}

procedure TdxScene.NewKeyDown(var Key: Word; var Char: System.WideChar; Shift: TShiftState);
var
  List: TList;
  i, CurIdx: integer;
  Found: boolean;
begin
  inherited;
  { change focus }
  if (Key = VK_TAB) and (Root <> nil) then
  begin
    Key := 0;
    List := TList.Create;
    TdxVisualObject(Root).GetTabOrderList(List);
    if ssShift in Shift then
    begin
      if (FFocused <> nil) then
      begin
        if FFocused is TdxCustomObjectLayer then
        begin
          CurIdx := List.IndexOf(TdxCustomObjectLayer(FFocused).Focused) - 1
        end
        else
          CurIdx := List.IndexOf(FFocused) - 1
      end
      else
        CurIdx := 0;
      Found := false;
      { first search in last part of list }
      if CurIdx > 0 then
        for i := CurIdx - 1 downto 0 do
        begin
          if (TObject(List[i]) is TdxObject) and TdxObject(List[i]).isVisual then
          begin
            if TdxObject(List[i]).isVisual and TdxVisualObject(List[i]).Visible and (TdxVisualObject(List[i]).CanFocused) then
            begin
              TdxVisualObject(List[i]).SetFocus;
              Found := true;
              Break;
            end;
          end;
          if (TObject(List[i]) is TvxObject) and TvxObject(List[i]).isVisual then
          begin
            if TvxObject(List[i]).isVisual and TvxVisualObject(List[i]).CheckParentVisible and TvxVisualObject(List[i]).CanFocused then
            begin
              TdxCustomObjectLayer(TvxVisualObject(List[i]).Scene.GetComponent).SetFocus;
              TvxVisualObject(List[i]).SetFocus;
              Found := true;
              Break;
            end;
          end;
        end;
      { second search in last part of list }
      if not Found then
        if (List.Count > 2) and (CurIdx < List.Count) then
          for i := List.Count - 1 downto CurIdx do
          begin
            if (TObject(List[i]) is TdxObject) and TdxObject(List[i]).isVisual then
            begin
              if TdxObject(List[i]).isVisual and TdxVisualObject(List[i]).Visible and (TdxVisualObject(List[i]).CanFocused) then
              begin
                TdxVisualObject(List[i]).SetFocus;
                Found := true;
                Break;
              end;
            end;
            if (TObject(List[i]) is TvxObject) and TvxObject(List[i]).isVisual then
            begin
              if TvxObject(List[i]).isVisual and TvxVisualObject(List[i]).CheckParentVisible and TvxVisualObject(List[i]).CanFocused then
              begin
                TdxCustomObjectLayer(TvxVisualObject(List[i]).Scene.GetComponent).SetFocus;
                TvxVisualObject(List[i]).SetFocus;
                Found := true;
                Break;
              end;
            end;
          end;
    end
    else
    begin
      if (FFocused <> nil) then
      begin
        if FFocused is TdxCustomObjectLayer then
        begin
          CurIdx := List.IndexOf(TdxCustomObjectLayer(FFocused).Focused) + 1
        end
        else
          CurIdx := List.IndexOf(FFocused) + 1
      end
      else
        CurIdx := 0;
      Found := false;
      { first search in last part of list }
      if (List.Count > 2) and (CurIdx < List.Count) then
        for i := CurIdx to List.Count - 1 do
        begin
          if (TObject(List[i]) is TdxObject) and TdxObject(List[i]).isVisual then
          begin
            if TdxObject(List[i]).isVisual and TdxVisualObject(List[i]).Visible and (TdxVisualObject(List[i]).CanFocused) and (TdxVisualObject(List[i]) <> FFocused) then
            begin
              TdxVisualObject(List[i]).SetFocus;
              Found := true;
              Break;
            end;
          end;
          if (TObject(List[i]) is TvxObject) and TvxObject(List[i]).isVisual then
          begin
            if TvxObject(List[i]).isVisual and TvxVisualObject(List[i]).CheckParentVisible and TvxVisualObject(List[i]).CanFocused then
            begin
              TdxCustomObjectLayer(TvxVisualObject(List[i]).Scene.GetComponent).SetFocus;
              TvxVisualObject(List[i]).SetFocus;
              Found := true;
              Break;
            end;
          end;
        end;
      { second search in last part of list }
      if not Found then
        if CurIdx > 0 then
          for i := 0 to CurIdx - 1 do
          begin
            if (TObject(List[i]) is TdxObject) and TdxObject(List[i]).isVisual then
            begin
              if TdxObject(List[i]).isVisual and TdxVisualObject(List[i]).Visible and (TdxVisualObject(List[i]).CanFocused) and (TdxVisualObject(List[i]) <> FFocused) then
              begin
                TdxVisualObject(List[i]).SetFocus;
                Found := true;
                Break;
              end;
            end;
            if (TObject(List[i]) is TvxObject) and TvxObject(List[i]).isVisual then
            begin
              if TvxObject(List[i]).isVisual and TvxVisualObject(List[i]).CheckParentVisible and TvxVisualObject(List[i]).CanFocused then
              begin
                TdxCustomObjectLayer(TvxVisualObject(List[i]).Scene.GetComponent).SetFocus;
                TvxVisualObject(List[i]).SetFocus;
                Found := true;
                Break;
              end;
            end;
          end;
    end;
    List.Free;
    Exit;
  end;
  { focused handler }
  if FFocused <> nil then
  begin
    FFocused.KeyDown(Key, Char, Shift);
  end;
end;

procedure TdxScene.NewKeyUp(var Key: Word; var Char: System.WideChar; Shift: TShiftState);
begin
  inherited;
  if (DesignTime) then
  begin
    if (Key = VK_DELETE) and (FSelected <> nil) then
    begin
      FSelected.Free;
      FSelected := nil;
    end;
  end;
  { focused handler }
  if FFocused <> nil then
  begin
    FFocused.KeyUp(Key, Char, Shift);
  end;
end;

procedure TdxScene.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  if (Canvas <> nil) and (HandleAllocated) then
  begin
    Canvas.FLockable := Transparency;
    Canvas.ResizeBuffer(AWidth, AHeight);
    if (Root <> nil) and (Root.IsVisual) then
      Root.Visual.Realign;
  end;
end;

procedure TdxScene.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FCaptured) then
    FCaptured := nil;
  if (Operation = opRemove) and (AComponent = FSelected) then
    FSelected := nil;
  if (Operation = opRemove) and (AComponent = FHovered) then
    FHovered := nil;
  if (Operation = opRemove) and (AComponent = FFocused) then
    FFocused := nil;
  if (Operation = opRemove) and (AComponent = FCamera) then
    FCamera := nil;
end;

procedure TdxScene.SetSnapGridShow(const Value: boolean);
begin
  FSnapGridShow := Value;
  if FSnapGridShow then
    FDesignGrid.Opacity := 1
  else
    FDesignGrid.Opacity := 0;
end;

procedure TdxScene.SetAllowPanAndRotate(const Value: boolean);
begin
  FDesignAllowPanAndRotate := Value;
end;

procedure TdxScene.SetDesignHintShow(const Value: boolean);
begin
  FDesignShowHint := Value;
  Invalidate;
end;

procedure TdxScene.SetSnapGridSize(const Value: single);
begin
  if FSnapGridSize <> Value then
  begin
    FSnapGridSize := Value;
    if FSnapGridSize < 0.01 then
      FSnapGridSize := 0.01;
    if FsnapGridShow then
      Repaint;
  end;
end;

procedure TdxScene.InsertObject(const ClassName: string);
var
  P: TPoint;
  Obj: TdxObject;
  InsertPos: TdxPoint;
begin
  if GetClass(ClassName) <> nil then
  begin
    if GetClass(ClassName).InheritsFrom(TdxObject) then
    begin
      if FSelected <> nil then
      begin
        try
          Obj := TdxObjectClass(GetClass(ClassName)).Create(Owner);
          if dxDesigner <> nil then
            Obj.Name := dxDesigner.UniqueName(Owner, Obj.ClassName);
          FSelected.AddObject(Obj);
          if dxDesigner <> nil then
          begin
            dxDesigner.SelectObject(Owner, Obj, []);
            dxDesigner.Modified(Owner);
          end;
          if Obj.IsVisual then
          begin
            if GetPropInfo(Obj.ClassInfo, 'Text', [tkString, tkLString, tkWString]) <> nil then
              SetStrProp(Obj, 'Text', Copy(Obj.ClassName, 4, Length(Obj.ClassName)));
            if (Owner is TWinControl) and (FPopupPos.X > 0) then
            begin
              P := TWinControl(Owner).ScreenToClient(FPopupPos);
              if TdxVisualObject(Obj).Projection = dxProjectionScreen then
              begin
                InsertPos := FSelected.AbsoluteToLocal(dxPoint(P.X, P.Y, 0));
                TdxVisualObject(Obj).Position.X := InsertPos.X + TdxVisualObject(Obj).Width / 2;
                TdxVisualObject(Obj).Position.Y := InsertPos.Y + TdxVisualObject(Obj).Height / 2;
              end;
            end;
            FPopupPos := Point(-1, -1);
            FSelected := TdxVisualObject(Obj);
            FSelected.DesignSelect;
          end;
        except
        end;
      end
      else
        if (FChildren = nil) or (FChildren.Count = 0) then
      begin
        { insert root object }
        try
          Obj := TdxObjectClass(GetClass(ClassName)).Create(Owner);
          if dxDesigner <> nil then
            Obj.Name := dxDesigner.UniqueName(Owner, Obj.ClassName);
          AddObject(Obj);
          if dxDesigner <> nil then
          begin
            dxDesigner.SelectObject(Owner, Obj, []);
            dxDesigner.Modified(Owner);
          end;
          if Obj.IsVisual then
          begin
            if (Owner is TWinControl) and (FPopupPos.X > 0) then
            begin
              P := TWinControl(Owner).ScreenToClient(FPopupPos);
              //                InsertPos := dxPoint(P.X, P.Y);
              TdxVisualObject(Obj).Position.X := P.X;
              TdxVisualObject(Obj).Position.Y := P.Y;
            end;
            FPopupPos := Point(-1, -1);
            FSelected := TdxVisualObject(Obj);
            FSelected.DesignSelect;
          end;
        except
        end;
      end;
    end
    else
    begin
      FInsertObject := ClassName;
    end;
  end
  else
    FInsertObject := '';
end;

procedure TdxScene.Resize;
begin
  inherited;
end;

procedure TdxScene.popupDrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
var
  B: TdxBitmap;
  C: TdxCanvas;
  S: TStream;
  R: TvxRect;
  RName: string;
  W, H: integer;
begin
  (*  W := ARect.Right - ARect.Left;
    H := ARect.Bottom - ARect.Top;

    C := DefaultCanvasClass.Create(W, H);
    C.Clear($FF000000 or ColorToRGB(clMenu));

    if TMenuItem(Sender).Tag = $FF then
    begin
      RName := 'PNG_Tdx' + StripHotkey(TMenuItem(Sender).Caption);
      if Windows.FindResource(HInstance, PChar(RName), RT_RCDATA) <> 0 then
      begin
        S := TResourceStream.Create(HInstance, RName, RT_RCDATA);
        B := TdxBitmap.CreateFromStream(S);
        S.Free;
      end
      else
      begin
        S := TResourceStream.Create(HInstance, 'PNG_Default', RT_RCDATA);
        B := TdxBitmap.CreateFromStream(S);
        S.Free;
      end;
      R := dxRect(2, 2, H - 2, H - 2);
      C.DrawBitmap(B, dxRect(0, 0, B.Width, B.Height), R, 1);
      B.Free;
      R := dxRect(H + 2, 2, W - 2, H - 2);
      C.Fill.Color := '#FF000000';
      C.FillText(R, R, '  ' + StripHotkey(TMenuItem(Sender).Caption), false, 1, vgTextAlignNear);
    end
    else
    begin
      R := dxRect(12, 2, W - 2, H - 2);
      C.Fill.Color := '#FF000000';
      C.FillText(R, R, StripHotkey(TMenuItem(Sender).Caption), false, 1, vgTextAlignNear);
    end;

    R := dxRect(2, 2, W - 2, H - 2);

    if Selected then
    begin
      vgInflateRect(R, 1, 1);
      C.Fill.Color := '#50808080';
      C.FillRoundRect(R, 5, 5, 1);
      C.Stroke.Color := '#FF404040';
      C.StrokeThickness := 1;
      C.Stroke.Style := vgBrushSolid;
      C.DrawRoundRect(R, 5, 5, 1);
    end;

    C.FlushBuffer(ARect.Left, ARect.Top, ACanvas.Handle);

    C.Free; *)
end;

procedure TdxScene.popupMeasureItem(Sender: TObject; ACanvas: TCanvas;
  var Width, Height: Integer);
begin
  Width := 136;
  if TMenuItem(Sender).Tag = $FF then
    Height := 36
  else
    Height := 21;
end;

procedure TdxScene.doDesignPopupDesignHide(Sender: TObject);
begin
  if (FSelected <> nil) and (FSelected <> Root) then
  begin
    FSelected.FDesignHide := not FSelected.FDesignHide;
    if FSelected.FDesignHide and (FSelected.Parent.IsVisual) then
    begin
      FSelected := TdxVisualObject(FSelected.Parent);
    end;
    AddUpdateRect(vgRect(0, 0, Width, Height));
  end;
end;

procedure TdxScene.doDesignPopupDel(Sender: TObject);
var
  Obj: TdxVisualObject;
begin
  if (FSelected <> nil) and (FSelected <> Root) then
  begin
    Obj := FSelected;
    if (Obj.Parent <> nil) and (Obj.Parent.IsVisual) then
    begin
      FSelected := TdxVisualObject(Obj.Parent);
      FSelected.DesignSelect;
    end
    else
    begin
      FSelected := TdxVisualObject(Root);
      if FSelected <> nil then
        FSelected.DesignSelect;
    end;
    Obj.Free;
  end;
end;

procedure TdxScene.doDesignPopupShowGrid(Sender: TObject);
begin
  if FDesignGrid <> nil then
  begin
    if TMenuItem(Sender).Checked then
      FDesignGrid.Opacity := 1
    else
      FDesignGrid.Opacity := 0;
  end;
end;

procedure TdxScene.doDesignPopupShowHint(Sender: TObject);
begin
  DesignShowHint := TMenuItem(Sender).Checked;
end;

procedure TdxScene.doDesignPopupLoadFromFile(Sender: TObject);
var
  S: TStream;
  Result: TdxObject;
  Open: TOpenDialog;
begin
  Open := TOpenDialog.Create(nil);
  Open.Filter := 'DXScene Files|*.dxscene';
  if Open.Execute then
  begin
    S := TFileStream.Create(Open.FileName, fmOpenRead);
    Result := CreateObjectFromStream(Owner, S);
    if FSelected <> nil then
      Result.Parent := FSelected
    else
      Result.Parent := Root;
    if dxDesigner <> nil then
      Result.Name := dxDesigner.UniqueName(Owner, Result.ClassName);
    S.Free;
  end;
  Open.Free;
end;

{$IFDEF FPC}

function StripHotkey(S: string): string;
begin
  Result := S;
end;
{$ENDIF}

procedure TdxScene.doDesignPopupReorder(Sender: TObject);
begin
  if FSelected = nil then
    Exit;

  if StripHotkey(TMenuItem(Sender).Caption) = 'Bring to front' then
    FSelected.BringToFront;
  if StripHotkey(TMenuItem(Sender).Caption) = 'Send to back' then
    FSelected.SendToBack;
end;

procedure TdxScene.doDesignPopupCopy(Sender: TObject);
var
  S: TStringStream;
begin
  if FSelected <> nil then
  begin
    S := TStringStream.Create('');
    FSelected.SaveToStream(S);
    Clipboard.AsText := S.DataString;
    S.Free;
  end;
end;

procedure TdxScene.doDesignPasteFromClip(Sender: TObject);
var
  Str: TStringStream;
  Obj: TdxObject;
begin
  if Clipboard.AsText <> '' then
  begin
    Str := TStringStream.Create(Clipboard.AsText);
    try
      if FSelected <> nil then
      begin
        try
          Obj := CreateObjectFromStream(Owner, Str);
          if Obj = nil then
          begin
            ShowMessage('No object in clipboard');
            Exit;
          end;
          if dxDesigner <> nil then
            Obj.Name := dxDesigner.UniqueName(Owner, Obj.ClassName);
          FSelected.AddObject(Obj);
          if dxDesigner <> nil then
          begin
            dxDesigner.SelectObject(Owner, Obj, []);
            dxDesigner.Modified(Owner);
          end;
          if Obj.IsVisual then
          begin
            if GetPropInfo(Obj.ClassInfo, 'Text', [tkString, tkLString, tkWString]) <> nil then
              SetStrProp(Obj, 'Text', Copy(Obj.ClassName, 4, Length(Obj.ClassName)));
            FSelected := TdxVisualObject(Obj);
            FSelected.DesignSelect;
          end;
        except
          ShowMessage('Error paste object from clipboard');
        end;
      end
    finally
      Str.Free;
    end;
  end;
end;

procedure TdxScene.doDesignPopupAdd(Sender: TObject);
var
  S: string;
begin
  S := StripHotkey(TMenuItem(Sender).Caption);
  if (S <> '') then
    S := 'Tdx' + S;
  InsertObject(S);
end;

procedure TdxScene.OpenDesignPopup;
var
  i: integer;
  S: string;
  OItem, SItem, Item: TMenuItem;
begin
  if FDesignPopup = nil then
  begin
    FDesignPopup := TPopupMenu.Create(Self);
    if ObjectList <> nil then
    begin
      { add }
      Item := NewItem('Add object', 0, false, true, nil, 0, '');
      { add categories }
      for i := 0 to ObjectList.Count - 1 do
      begin
        if Item.Find(ObjectList[i]) = nil then
        begin
          SItem := NewItem(ObjectList[i], 0, false, true, nil, 0, '');
          Item.Add(SItem);
        end;
      end;
      { add objects }
      for i := 0 to ObjectList.Count - 1 do
      begin
        S := TdxObjectClass(ObjectList.Objects[i]).ClassName;
        if Pos('Tdx', S) = 1 then
          Delete(S, 1, 3);
        OItem := NewItem(S, 0, false, true, doDesignPopupAdd, 0, '');
        OItem.Tag := $FF;
        {        if i mod 8 = 0 then
                  OItem.Break := mbBreak;}
        SItem := Item.Find(ObjectList[i]);
        if SItem <> nil then
          SItem.Add(OItem);
      end;
      FDesignPopup.Items.Add(Item);
      { Design Hide }
      if FSelected <> nil then
      begin
        Item := NewItem('Hide in Design-time', 0, FSelected.FDesignHide, true, doDesignPopupDesignHide, 0, '');
        Item.AutoCheck := true;
        {$IFNDEF FPC}
        Item.OnMeasureItem := popupMeasureItem;
        Item.OnDrawItem := popupDrawItem;
        {$ENDIF}
        FDesignPopup.Items.Add(Item);
      end;
      { Reorder }
      Item := NewItem('Order', 0, false, true, nil, 0, '');
      SItem := NewItem('Bring to front', 0, false, true, doDesignPopupReorder, 0, '');
      Item.Add(SItem);
      SItem := NewItem('Send to back', 0, false, true, doDesignPopupReorder, 0, '');
      Item.Add(SItem);
      FDesignPopup.Items.Add(Item);
      { Delete }
      Item := NewItem('Delete object', 0, false, true, doDesignPopupDel, 0, '');
      FDesignPopup.Items.Add(Item);
      { add from clip }
      { Edit }
      Item := NewItem('Edit', 0, false, true, nil, 0, '');
      SItem := NewItem('Copy to clipboard', 0, false, true, doDesignPopupCopy, 0, '');
      Item.Add(SItem);
      SItem := NewItem('Paste from clipboard', 0, false, true, doDesignPasteFromClip, 0, '');
      Item.Add(SItem);
      FDesignPopup.Items.Add(Item);
      { Delete }
      Item := NewItem('Load From File...', 0, false, true, doDesignPopupLoadFromFile, 0, '');
      FDesignPopup.Items.Add(Item);
      { Grid }
      Item := NewItem('Show grid', 0, FSnapGridShow, true, doDesignPopupShowGrid, 0, '');
      Item.AutoCheck := true;
      FDesignPopup.Items.Add(Item);
      { Hint }
      Item := NewItem('Show hint', 0, FDesignShowHint, true, doDesignPopupShowHint, 0, '');
      Item.AutoCheck := true;
      FDesignPopup.Items.Add(Item);
    end;
  end;
  GetCursorPos(FPopupPos);
  FDesignPopup.Popup(FPopupPos.X, FPopupPos.Y);
end;

procedure TdxScene.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('DesignCameraPos', ReadDesignCameraPos, WriteDesignCameraPos, true);
  Filer.DefineProperty('DesignCameraZAngle', ReadDesignCameraZAngle, WriteDesignCameraZAngle, true);
  Filer.DefineProperty('DesignCameraXAngle', ReadDesignCameraXAngle, WriteDesignCameraXAngle, true);
  Filer.DefineProperty('DesignSnapGridShow', ReadDesignSnapGridShow, WriteDesignSnapGridShow, true);
  Filer.DefineProperty('DesignSnapToGrid', ReadDesignSnapToGrid, WriteDesignSnapToGrid, true);
  Filer.DefineProperty('DesignSnapToLines', ReadDesignSnapToLines, WriteDesignSnapToLines, true);
  Filer.DefineProperty('DesignShowHint', ReadDesignShowHint, WriteDesignShowHint, true);
end;

procedure TdxScene.ReadDesignCameraPos(Reader: TReader);
begin
  FDesignCamera.Position.Y := Reader.ReadFloat;
end;

procedure TdxScene.WriteDesignCameraPos(Writer: TWriter);
begin
  Writer.WriteFloat(FDesignCamera.Position.Y);
end;

procedure TdxScene.ReadDesignCameraZAngle(Reader: TReader);
begin
  FDesignCameraZ.RotateAngle.Z := Reader.ReadFloat;
end;

procedure TdxScene.WriteDesignCameraZAngle(Writer: TWriter);
begin
  Writer.WriteFloat(FDesignCameraZ.RotateAngle.Z);
end;

procedure TdxScene.ReadDesignCameraXAngle(Reader: TReader);
begin
  FDesignCameraX.RotateAngle.X := Reader.ReadFloat;
end;

procedure TdxScene.WriteDesignCameraXAngle(Writer: TWriter);
begin
  Writer.WriteFloat(FDesignCameraX.RotateAngle.X);
end;

procedure TdxScene.ReadDesignSnapGridShow(Reader: TReader);
var
  B: boolean;
begin
  B := Reader.ReadBoolean;
  if not (DesignTime) then
    B := false;
  DesignGridShow := B;
end;

procedure TdxScene.ReadDesignShowHint(Reader: TReader);
begin
  FDesignShowHint := Reader.ReadBoolean;
end;

procedure TdxScene.ReadDesignSnapToGrid(Reader: TReader);
begin
  FSnapToGrid := Reader.ReadBoolean;
end;

procedure TdxScene.ReadDesignSnapToLines(Reader: TReader);
begin
  FSnapToLines := Reader.ReadBoolean;
end;

procedure TdxScene.WriteDesignSnapGridShow(Writer: TWriter);
begin
  Writer.WriteBoolean(FSnapGridShow);
end;

procedure TdxScene.WriteDesignShowHint(Writer: TWriter);
begin
  Writer.WriteBoolean(FDesignShowHint);
end;

procedure TdxScene.WriteDesignSnapToGrid(Writer: TWriter);
begin
  Writer.WriteBoolean(FSnapToGrid);
end;

procedure TdxScene.WriteDesignSnapToLines(Writer: TWriter);
begin
  Writer.WriteBoolean(FSnapToLines);
end;

function TdxScene.GetRoot: TdxObject;
var
  i: integer;
begin
  Result := nil;
  if (FChildren <> nil) and (FChildren.Count > 0) then
  begin
    for i := 0 to FChildren.Count - 1 do
      if TdxObject(FChildren[i]).isVisual and not TdxVisualObject(FChildren[i]).Locked then
        Result := TdxObject(FChildren[i])
  end;
end;

procedure TdxScene.DoDesignSelect(AObject: TObject);
begin
  if (AObject <> nil) and (AObject is TdxVisualObject) and (TdxVisualObject(AObject).FScene = Self) then
  begin
    FSelected := TdxVisualObject(AObject);
    FSelected.DesignSelect;
    FSelected.Repaint;
  end;
end;

procedure TdxScene.SetFocused(const Value: TdxVisualObject);
begin
  if FFocused <> Value then
  begin
    if FFocused <> nil then
      FFocused.KillFocus;
    FFocused := Value;
    if FFocused <> nil then
      FFocused.EnterFocus;
  end;
end;

function TdxScene.GetFill: string;
begin
  Result := dxColorToStr(FFill);
end;

procedure TdxScene.SetFill(const Value: string);
begin
  if FFill <> dxStrToColor(Value) then
  begin
    FFill := dxStrToColor(Value);
    Invalidate;
  end;
end;

function TdxScene.GetAmbient: string;
begin
  Result := dxColorToStr(FAmbient);
end;

procedure TdxScene.SetAmbient(const Value: string);
begin
  if FAmbient <> dxStrToColor(Value) then
  begin
    FAmbient := dxStrToColor(Value);
    Invalidate;
  end;
end;

procedure TdxScene.SetQuality(const Value: TdxQuality);
begin
  if FQuality <> Value then
  begin
    FQuality := Value;
    if Canvas <> nil then
      Canvas.SetQuality(FQuality);
  end;
end;

procedure TdxScene.BeginUpdate;
begin
  FDisableUpdate := true;
end;

procedure TdxScene.EndUpdate;
begin
  FDisableUpdate := false;
end;

procedure TdxScene.SetRealTime(const Value: boolean);
begin
  if FRealTime <> Value then
  begin
    FRealTime := Value;
    if not (DesignTime) then
    begin
      Application.OnIdle := DoIdle;
    end;
  end;
end;

procedure TdxScene.DoIdle(Sender: TObject; var Done: Boolean);
begin
  Done := true;
  if not FRealTime then
    Exit;
  ProcessTick;
  Done := false;
end;

procedure TdxScene.ProcessTick;
var
  i: integer;
  NewTime: single;
begin
  if FTime = 0 then
    FTime := GetTickCount / 1000;
  NewTime := GetTickCount / 1000;
  FDeltaTime := NewTime - FTime;
  if FDeltaTime <= 0 then
    FDeltaTime := 0.001;
  FTime := NewTime;
  FRenderTime := FRenderTime + FDeltaTime;
  FRenderCount := FRenderCount + 1;
  if FRenderTime > 1.0 then
  begin
    FFps := FRenderCount / FRenderTime;
    FRenderTime := 0.0;
    FRenderCount := 0;
  end;
  for i := 0 to FChildren.Count - 1 do
    TdxObject(FChildren[i]).ProcessTick(FTime, FDeltaTime);
  if FPhysics <> nil then
  begin
    if FPhysics.FSpaceWorld <> 0 then
      FPhysics.UpdateWorld(FPhysics.FSpaceWorld, deltaTime);
    if FPhysics.FScreenWorld <> 0 then
      FPhysics.UpdateWorld(FPhysics.FScreenWorld, deltaTime);
  end;
  Draw;
  Sleep(FRealTimeSleep);
end;

procedure TdxScene.CreatePhysics;
begin
  if FPhysics = nil then
    FPhysics := DefaultPhysicsClass.Create(Self);
end;

procedure TdxScene.SetActiveControl(AControl: TdxVisualObject);
begin
  if AControl <> FActiveControl then
  begin
    FActiveControl := AControl;
    if (FActiveControl <> nil) and not (csLoading in ComponentState) then
      FActiveControl.SetFocus;
  end;
end;

procedure TdxScene.SetSelected(Value: TdxVisualObject);
begin
  if FSelected <> nil then
    FSelected.Repaint;
  FSelected := Value;
  if FSelected <> nil then
  begin
    FSelected.DesignSelect;
    // Select in IDE
    if dxDesigner <> nil then
      dxDesigner.SelectObject(Owner, Value, []);
    FSelected.Repaint;
  end;
end;

{ TdxBitmapStream =============================================================}

constructor TdxBitmapStream.Create(Collection: TCollection);
begin
  inherited;
  FBitmap := TdxBitmap.Create(0, 0);
  if BitmapList = nil then
    BitmapList := TStringList.Create;
  BitmapList.AddObject('', Self);
end;

procedure TdxBitmapStream.Assign(Source: TPersistent);
begin
  inherited;
end;

destructor TdxBitmapStream.Destroy;
begin
  if BitmapList <> nil then
    BitmapList.Delete(BitmapList.IndexOfObject(Self));
  FreeAndNil(FBitmap);
  inherited;
end;

function TdxBitmapStream.GetDisplayName: string;
begin
  Result := '(Bitmap)';
end;

procedure TdxBitmapStream.SetBitmap(const Value: TdxBitmap);
begin
  if (Value <> nil) then
  begin
    FBitmap.Assign(Value);
  end;
end;

procedure TdxBitmapStream.SetName(const Value: string);
var
  Idx: integer;
begin
  if FName <> Value then
  begin
    FName := Value;
    Idx := BitmapList.IndexOfObject(Self);
    if Idx >= 0 then
      BitmapList[Idx] := Name;
  end;
end;

{ TdxBitmapCollection }

constructor TdxBitmapCollection.Create(AOwner: TdxBitmapList);
begin
  inherited Create(TdxBitmapStream);
end;

destructor TdxBitmapCollection.Destroy;
begin
  inherited;
end;

{ TdxBitmapList }

constructor TdxBitmapList.Create(AOwner: TComponent);
begin
  inherited;
  FBitmaps := TdxBitmapCollection.Create(Self);
end;

destructor TdxBitmapList.Destroy;
begin
  FBitmaps.Free;
  inherited;
end;

initialization
  {$IFDEF WINDOWS}
  User32Lib := LoadLibrary(User32);
  if User32Lib <> 0 then
  begin
    @SetLayeredWindowAttributes := GetProcAddress(User32Lib, 'SetLayeredWindowAttributes');
    @UpdateLayeredWindow := GetProcAddress(User32Lib, 'UpdateLayeredWindow');
    @PrintWindow := GetProcAddress(User32Lib, 'PrintWindow');
  end;
  {$ENDIF}
  RegisterClasses([TdxBitmap, TdxPosition, TdxMeshData, TdxMaterial, TdxBitmapRect, TdxBounds]);
  RegisterClasses([TdxScene, TdxObject, TdxCustomLayer, TdxCustomBufferLayer]);
  RegisterClasses([TdxBitmapStream, TdxBitmapCollection, TdxBitmapList]);
  RegisterDXObjects('Scene', [TdxCamera, TdxLight, TdxDummy, TdxProxyObject]);
  RegisterDXObjects('Resources', [TdxBitmapObject]);
  RegisterDXObjects('Shapes', [TdxBufferLayer]);
  {$IFDEF DxSceneTrial}
  ShowVersion2;
  {$ENDIF}
  {$IFDEF WINDOWS}
  OleInitialize(nil);
  {$ENDIF}
finalization
  if dxAniThread <> nil then
    FreeAndNil(dxAniThread);
  if ObjectList <> nil then
    FreeAndNil(ObjectList);
  if BitmapList <> nil then
    FreeAndNil(BitmapList);
  if ResourceList <> nil then
    FreeAndNil(ResourceList);
end.
.

