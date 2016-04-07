unit dcm_vglayer;

{$I dcm_define.inc}
{$H+}
{.$DEFINE DARWINBUFFER}
{.$DEFINE UPDATERECT}
{.$DEFINE BOUNDS}

interface

uses
  {$IFDEF DARWIN}
  macosall,
  CarbonDef, CarbonPrivate, carboncanvas,
  {$ENDIF}
  {$IFDEF WIN32}
  Windows, Messages, MMSystem,
  {$ENDIF}
  {$IFDEF FPC}
  LCLProc, LCLIntf, LCLType, LMessages, LResources,
  {$ENDIF}
  dcm_scene, dcm_utils, dcm_vgcore, 
  Classes, SysUtils, Forms, Controls, Dialogs, Graphics, ExtCtrls, Menus;

type

  { TdxCustomObjectLayer }

  TdxCustomObjectLayer = class(TdxCustomBufferLayer, IvgScene)
  private
    FCanvas: TvxCanvas;
    FDisableUpdate: boolean;
    FChildren: TList;
    FDesignRoot, FSelected, FCaptured, FHovered, FFocused: TvxVisualObject;
    FSelection: array of TvxObject;
    FDesignPlaceObject: TvxVisualObject;
    FDesignGridLines: array of TvxVisualObject;
    FDesignPopup: TPopupMenu;
    FDesignChangeSelection: TNotifyEvent;
    FUnsnapMousePos, FMousePos, FDownPos: TvxPoint;
    FMoving, FLeftTop, FRightTop, FLeftBottom, FRightBottom, FTop, FBottom, FLeft, FRight, FRotate: boolean;
    FLeftTopHot, FRightTopHot, FLeftBottomHot, FRightBottomHot, FTopHot, FBottomHot, FLeftHot, FRightHot, FRotateHot: boolean;
    FResizeSize, FResizePos, FResizeStartPos, FDownSize: TvxPoint;
    FDragging, FResizing: boolean;
    FDesignTime: boolean;
    FFill: TvxBrush;
    FTransparency: boolean;
    FAllowDrag: boolean;
    FSnapToGrid: boolean;
    FSnapToLines: boolean;
    FSnapGridShow: boolean;
    FSnapGridSize: single;
    FInsertObject: string;
    FAlignRoot: boolean;
    FDesignPopupEnabled: boolean;
    FPopupPos: TvxPoint;
    FOpenInFrame: TvxFrame;
    FCloneFrame: TForm;
    FDrawing: boolean;
    FSaveIdle: TIdleEvent;
    FStyle: TvxResources;
    FShowTimer: TTimer;
    FLoadCursor: TCursor;
    FActiveControl: TvxControl;
    FAnimatedCaret: boolean;
    procedure SetActiveControl(AControl: TvxControl);
    procedure DoShowTimer(Sender: TObject);
    function GetCount: integer;
    procedure SetChildren(Index: integer; const Value: TvxObject);
    function GetChildrenObject(Index: integer): TvxObject;
    procedure SetFill(const Value: TvxBrush);
    procedure FillChanged(Sender: TObject);
    procedure SetSnapGridShow(const Value: boolean);
    procedure AddUpdateRectsFromGridLines;
    function SnapToGridValue(Value: single): single;
    procedure SetSnapGridSize(const Value: single);
    procedure SnapToGridLines(AllowChangePosition: boolean);
    function SnapPointToGridLines(const APoint: TvxPoint): TvxPoint;
    procedure ReadDesignSnapGridShow(Reader: TReader);
    procedure WriteDesignSnapGridShow(Writer: TWriter);
    procedure ReadDesignSnapToGrid(Reader: TReader);
    procedure WriteDesignSnapToGrid(Writer: TWriter);
    procedure ReadDesignSnapToLines(Reader: TReader);
    procedure WriteDesignSnapToLines(Writer: TWriter);
    procedure RealignRoot;
    { design }
    procedure OpenDesignPopup;
    procedure doDesignTabOrderBtnClick(Sender: TObject);
    procedure doDesignTabOrderRebuildList(ListBox: TvxVisualObject);
    procedure doDesignPopupTabOrder(Sender: TObject);
    procedure doDesignPopupEditStyle(Sender: TObject);
    procedure doDesignPopupCreateStyle(Sender: TObject);
    procedure doDesignPopupLoadFromFile(Sender: TObject);
    procedure doDesignPopupDesignHide(Sender: TObject);
    procedure doDesignPopupAddItem(Sender: TObject);
    procedure doDesignPopupAdd(Sender: TObject);
    procedure doDesignPopupDel(Sender: TObject);
    procedure doDesignPopupReorder(Sender: TObject);
    procedure doDesignPopupGrid(Sender: TObject);
    procedure doDesignPopupCopy(Sender: TObject);
    function GetRoot: TvxObject;
    procedure SetFocused(const Value: TvxVisualObject);
    procedure DoDesignSelect(AObject: TObject);
    procedure SetSelected(const Value: TvxVisualObject);
    procedure doDesignPopupPaste(Sender: TObject);
    { IvgScene }
    function GetDisableUpdate: boolean;
    function GetDesignTime: boolean;
    function GetCanvas: TvxCanvas;
    function GetOwner: TComponent;
    function GetRealTime: boolean;
    function GetComponent: TComponent;
    function GetSelected: TvxVisualObject;
    function GetDeltaTime: single;
    procedure SetDisableUpdate(Value: boolean);
    function GetUpdateRectsCount: integer;
    function GetUpdateRect(const Index: integer): TvxRect;
    procedure SetCaptured(const Value: TvxVisualObject);
    function GetCaptured: TvxVisualObject;
    function GetFocused: TvxVisualObject;
    procedure SetDesignRoot(const Value: TvxVisualObject);
    function GetMousePos: TvxPoint;
    procedure BeginDrag;
    procedure BeginResize;
    function GetTransparency: boolean;
    function GetDesignPlaceObject: TvxVisualObject;
    function GetStyle: TvxResources;
    function LocalToScreen(const Point: TvxPoint): TvxPoint;
    function GetActiveControl: TvxControl;
    procedure SetStyle(const Value: TvxResources);
    procedure BeginVCLDrag(Source: TObject; ABitmap: TvxBitmap);
    function GetAnimatedCaret: boolean;
    function ShowKeyboardForControl(AObject: TvxObject): boolean;
    function HideKeyboardForControl(AObject: TvxObject): boolean;
  protected
    FUpdateRects: array of TvxRect;
    procedure Loaded; override;
    procedure Draw; virtual;
    procedure BeforePaint; override;
    procedure Paint; override;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure DefineProperties(Filer: TFiler); override;
    procedure LayerMouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: single); override;
    procedure LayerMouseMove(Shift: TShiftState; X, Y: single); override;
    procedure LayerMouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: single); override;
    procedure MouseWheel(Shift: TShiftState; WheelDelta: integer; var Handled: boolean); override;
    procedure KeyUp(var Key: Word; var Char: System.WideChar; Shift: TShiftState); override;
    procedure KeyDown(var Key: Word; var Char: System.WideChar; Shift: TShiftState); override;
    procedure DragEnter(const Data: TdxDragObject; const Point: TdxPoint); override;
    procedure DragOver(const Data: TdxDragObject; const Point: TdxPoint; var Accept: Boolean); override;
    procedure DragDrop(const Data: TdxDragObject; const Point: TdxPoint); override;
    procedure DragLeave; override;
    procedure DragEnd; override;
    function DoHintShow(var Message: {$IFDEF FPC} TLMessage {$ELSE} TMessage {$ENDIF}): boolean; override;
    function ObjectByPoint(X, Y: single): TvxVisualObject;
    procedure SetVisible(const Value: boolean); override;
    procedure EnterFocus; override;
    procedure KillFocus; override;
    procedure MouseLeave; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DeleteChildren;
    property Canvas: TvxCanvas read FCanvas;
    procedure UpdateResource;
    function RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean; override;
    { children }
    procedure GetTabOrderList(const AList: TList); override;
    procedure AddObject(AObject: TvxObject);
    procedure RemoveObject(AObject: TvxObject);
    { realtime }
    procedure ProcessTick;
    { paint }
    procedure AddUpdateRect(R: TvxRect);
    { design }
    procedure InsertObject(const ClassName: string);
    { design }
    property DesignTime: boolean read FDesignTime write FDesignTime stored false;
    { }
    property Count: integer read GetCount;
    property Root: TvxObject read GetRoot;
    property Children[Index: integer]: TvxObject read GetChildrenObject write SetChildren;
    property Selected: TvxVisualObject read FSelected write SetSelected;
    property Captured: TvxVisualObject read FCaptured;
    property Hovered: TvxVisualObject read FHovered;
    property Focused: TvxVisualObject read FFocused write SetFocused;
    property DisableUpdate: boolean read FDisableUpdate;
    { design }
    property DesignPopupEnabled: boolean read FDesignPopupEnabled write FDesignPopupEnabled;
    property DesignSnapGridShow: boolean read FSnapGridShow write SetSnapGridShow;
    property DesignSnapToGrid: boolean read FSnapToGrid write FSnapToGrid;
    property DesignSnapToLines: boolean read FSnapToLines write FSnapToLines;
    property DesignChangeSelection: TNotifyEvent read FDesignChangeSelection write FDesignChangeSelection;
    property AlignRoot: boolean read FAlignRoot write FAlignRoot default true;
    property AllowDrag: boolean read FAllowDrag write FAllowDrag;
    property DesignSnapGridSize: single read FSnapGridSize write SetSnapGridSize;
    property ShowHint default true;
    property Transparency: boolean read FTransparency write FTransparency;
    property Fill: TvxBrush read FFill write SetFill;
    property Style: TvxResources read FStyle write SetStyle;
  published
    property CanFocused default true;
    property ActiveControl: TvxControl read FActiveControl write SetActiveControl;
    property AnimatedCaret: boolean read FAnimatedCaret write FAnimatedCaret default true;
  end;

  TdxObjectLayer = class(TdxCustomObjectLayer)
  private
  protected
  public
  published
    property Align;
    property Body;
    property Collider;
    property ColliseTrack;
    property Dynamic;
    property Velocity;
    property Margins;
    property Padding;
    property Fill;
    property Style;
    property Resolution;
  end;

{ GUI }

  TdxGUIObjectLayer = class(TdxCustomObjectLayer)
  private
  protected
  public
    constructor Create(AOwner: TComponent); override;
  published
    property AllowDrag default false; 
    property LayerAlign;
    property Fill;
    property Style;
    property ZWrite default false;
  end;

{ Deprecated }

  TdxVGLayer = class(TdxCustomObjectLayer)
  private
  protected
  public
  published
  end;

  TdxScreenVGLayer = class(TdxGUIObjectLayer)
  private
  protected
  public
  published
  end;

implementation {===============================================================}

uses math, typinfo;

type
  TvxHackObject = class(TvxObject);
  TvxHackVisualObject = class(TvxVisualObject);
  TdxHackScene = class(TdxScene);
  TvxHackControl = class(TvxControl);
  TxxHackCanvas = class(TvxCanvas);

function BigEndianColor(C: cardinal): cardinal;
begin
  Result := C;
  vgReverseBytes(@Result, 4);
end;

{ TdxCustomObjectLayer ==================================================================}

constructor TdxCustomObjectLayer.Create(AOwner: TComponent);
begin
  inherited;
  AddScene(Self);
  CanFocused := true;
  FAnimatedCaret := true;
  FDesignTime := csDesigning in ComponentState;
  FCanvas := dcm_vgcore.DefaultCanvasClass.Create(FLayerWidth, FLayerHeight);
  ShowHint := true;
  DragDisableHighlight := true;
  Width := 8;
  Depth := 8;
  AutoCapture := true;
  FDesignInteract := true;
  FSnapToLines := true;
  FAlignRoot := true;
  TxxHackCanvas(FCanvas).FBuffered := true;
  FFill := TvxBrush.Create(vgBrushSolid, $FF505050);
  FFill.OnChanged := FillChanged;
  DesignPopupEnabled := true;
  FSnapGridSize := 1;
  Fill.Style := vgBrushNone;
  if vgDesigner <> nil then
    vgDesigner.AddScene(Self);
  vgSceneCount := vgSceneCount + 1;
end;

destructor TdxCustomObjectLayer.Destroy;
begin
  if FHovered <> nil then
  begin
    TvxVisualObject(FHovered).RemoveFreeNotify(Self);
    FHovered := nil;
  end;
  if FFocused <> nil then
  begin
    TvxVisualObject(FFocused).RemoveFreeNotify(Self);
    FFocused := nil;
  end;
  if vgDesigner <> nil then
    vgDesigner.RemoveScene(Self);
  vgSceneCount := vgSceneCount - 1;
  if vgSceneCount = 0 then
  begin
    if dcm_vgcore.aniThread <> nil then
    begin
      dcm_vgcore.aniThread.Free;
    end;
    dcm_vgcore.aniThread := nil;
  end;
  if Assigned(FSaveIdle) then
    Application.OnIdle := FSaveIdle;
  if FOpenInFrame <> nil then
    FOpenInFrame.SceneObject := nil;
  DeleteChildren;
  if FChildren <> nil then
    FreeAndNil(FChildren);
  FreeAndNil(FFill);
  FreeAndNil(FCanvas);
  RemoveScene(Self);
  inherited;
end;

procedure TdxCustomObjectLayer.Loaded;
begin
  inherited;
  FLoadCursor := Cursor;
  if FSnapToLines then
    FSnapToGrid := false;
  FShowTimer := TTimer.Create(Self);
  FShowTimer.Interval := 1;
  FShowTimer.OnTimer := DoShowTimer;
end;

procedure TdxCustomObjectLayer.DoShowTimer(Sender: TObject);
begin
  FShowTimer.Enabled := false;
  AddUpdateRect(vgRect(0, 0, $FFFF, $FFFF));
  FShowTimer.Free;
end;

procedure TdxCustomObjectLayer.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  i: Integer;
begin
  inherited;
  if FChildren <> nil then
    for i := 0 to FChildren.Count - 1 do
      if (TObject(FChildren[i]) is TvxObject) and (TvxObject(FChildren[i]).Stored) then
        Proc(FChildren[i]);
end;

procedure TdxCustomObjectLayer.AddUpdateRect(R: TvxRect);
begin
  if FDisableUpdate then Exit;
  if csDestroying in ComponentState then Exit;
  if FCanvas = nil then Exit;
  if FCanvas.BufferBits = nil then Exit;

  R := vgRect(Trunc(R.Left), Trunc(R.Top), Trunc(R.Right) + 1, Trunc(R.Bottom) + 1);
  if not vgIntersectRect(R, vgRect(0, 0, FLayerWidth, FLayerHeight)) then Exit;
  
  SetLength(FUpdateRects, Length(FUpdateRects) + 1);
  FUpdateRects[High(FUpdateRects)] := R;
  Repaint;
end;

procedure TdxCustomObjectLayer.Draw;
var
  i, j: integer;
  R: TvxRect;
  Rgn, NRgn: Cardinal;
  ScaleMatrix: TvxMatrix;
begin
  if not (FDesignTime) and (FOpenInFrame <> nil) then Exit;
  if FDrawing then Exit;
  if Length(FUpdateRects) > 0 then
  begin
    FDrawing := true;
    try
      { Split rects if rects too more }
      if (Length(FUpdateRects) > 20) then
      begin
        for i := 1 to High(FUpdateRects) do
          FUpdateRects[0] := vgUnionRect(FUpdateRects[0], FUpdateRects[i]);
        SetLength(FUpdateRects, 1);
      end;
      if Canvas.BeginScene then
      begin
        { draw back }
        Canvas.ResetClipRect;
        ScaleMatrix := dcm_vgcore.IdentityMatrix;
        Canvas.SetMatrix(ScaleMatrix);
        Canvas.SetClipRects(FUpdateRects);

        if (FFill.Style = vgBrushNone) or ((FFill.SolidColor and $FF000000 = 0) and (FFill.Style = vgBrushSolid)) then
        begin
          for i := 0 to High(FUpdateRects) do
          begin
            if FTransparency then
              Canvas.ClearRect(FUpdateRects[i], 0)
            else
              {$ifdef FPC_BIG_ENDIAN}
              Canvas.ClearRect(FUpdateRects[i], BigEndianColor(FFill.SolidColor and $FFFFFF));
              {$ELSE}
              Canvas.ClearRect(FUpdateRects[i], FFill.SolidColor and $FFFFFF);
              {$ENDIF}
          end;
        end
        else
        begin
          Canvas.Fill.Assign(FFill);
          Canvas.FillRect(vgRect(-1, -1, FLayerWidth + 1, FLayerHeight + 1), 0, 0, AllCorners, 1);
        end;
        { reset }
        Canvas.StrokeThickness := 1;
        Canvas.StrokeCap := vgCapFlat;
        Canvas.StrokeJoin := vgJoinMiter;
        Canvas.StrokeDash := vgDashSolid;
        Canvas.Stroke.Style := vgBrushSolid;
        Canvas.Fill.Style := vgBrushSolid;
        if FChildren <> nil then
          for i := 0 to FChildren.Count - 1 do
          begin
            if not (TObject(FChildren[i]) is TvxVisualObject) then Continue;
            if not TvxVisualObject(FChildren[i]).Visible then Continue;

            ScaleMatrix := dcm_vgcore.IdentityMatrix;
            for j := 0 to High(FUpdateRects) do
              if vgIntersectRect(FUpdateRects[j], TvxVisualObject(FChildren[i]).UpdateRect) then
              begin
                Canvas.SetMatrix(vgMatrixMultiply(ScaleMatrix, TvxVisualObject(FChildren[i]).AbsoluteMatrix));
                TvxHackVisualObject(FChildren[i]).BeforePaint;
                TvxHackVisualObject(FChildren[i]).Paint;
                TvxHackVisualObject(FChildren[i]).PaintChildren;
                Break;
              end;
          end;
        { grid }
        if FSnapGridShow and (FSnapGridSize <> 0) then
        begin
          ScaleMatrix := dcm_vgcore.IdentityMatrix;
          Canvas.SetMatrix(ScaleMatrix);
          Canvas.Stroke.Style := vgBrushSolid;
          Canvas.StrokeThickness := 1;
  (*        for i := Trunc((-FDesignScroll.X) / (FSnapGridSize)) - 1 to Trunc((-FDesignScroll.X + Width) / (FSnapGridSize)) + 1 do
          begin
            if i mod 5 = 0 then
              Canvas.Stroke.SolidColor := $50505050
            else
              Canvas.Stroke.SolidColor := $50303030;
            Canvas.DrawLine(vgPoint(i * FSnapGridSize + 0.5, -FDesignScroll.Y + 0.5), vgPoint(i * FSnapGridSize + 0.5, -FDesignScroll.Y + Height + 0.5), 1);
          end;
          for j := Trunc((-FDesignScroll.Y) / (FSnapGridSize)) - 1 to Trunc((-FDesignScroll.Y + Height) / (FSnapGridSize)) + 1 do
          begin
            if j mod 5 = 0 then
              Canvas.Stroke.SolidColor := $50505050
            else
              Canvas.Stroke.SolidColor := $50303030;
            Canvas.DrawLine(vgPoint(-FDesignScroll.X + 0.5, j * FSnapGridSize + 0.5), vgPoint(-FDesignScroll.X + Width + 0.5, j * FSnapGridSize + 0.5), 1)
          end; *)
        end;
        { design }
        if (FSelected <> nil) and not FSelected.DisableDesignResize then
        begin
          Canvas.Fill.Style := vgBrushSolid;
          Canvas.Fill.SolidColor := $FFFFFFFF;
          Canvas.StrokeThickness := 1;
          Canvas.Stroke.Style := vgBrushSolid;
          Canvas.Stroke.SolidColor := $FF1072C5;
          ScaleMatrix := dcm_vgcore.IdentityMatrix;
          Canvas.SetMatrix(vgMatrixMultiply(ScaleMatrix, FSelected.AbsoluteMatrix));
          R := FSelected.BoundsRect;
          vgInflateRect(R, -0.5, -0.5);
          Canvas.StrokeDash := vgDashDash;
          Canvas.DrawRect(R, 0, 0, AllCorners, 1);
          Canvas.StrokeDash := vgDashSolid;
          begin
          { rotate }
          if FRotateHot then
            Canvas.Fill.SolidColor := $FFFF0000
          else
            Canvas.Fill.SolidColor := $FFFFFFFF;
          R := FSelected.BoundsRect;
          vgInflateRect(R, -0.5, -0.5);
          Canvas.DrawLine(vgPoint((R.Left + R.Right) / 2, R.Top), vgPoint((R.Left + R.Right) / 2, R.Top - RotSize), 1);
          Canvas.Fillellipse(vgRect((R.Left + R.Right) / 2 - (GripSize), R.Top - RotSize - (GripSize),
            (R.Left + R.Right) / 2 +(GripSize), R.Top - RotSize + (GripSize)), Opaque);
          Canvas.DrawEllipse(vgRect((R.Left + R.Right) / 2 - (GripSize), R.Top - RotSize - (GripSize),
            (R.Left + R.Right) / 2 +(GripSize), R.Top - RotSize + (GripSize)), Opaque);
          { angles }
          if FLeftTopHot then
            Canvas.Fill.SolidColor := $FFFF0000
          else
            Canvas.Fill.SolidColor := $FFFFFFFF;
          R := FSelected.BoundsRect;
          vgInflateRect(R, -0.5, -0.5);
          Canvas.Fillellipse(vgRect(R.Left - (GripSize), R.Top - (GripSize), R.Left + (GripSize), R.Top + (GripSize)), Opaque);
          Canvas.DrawEllipse(vgRect(R.Left - (GripSize), R.Top - (GripSize), R.Left + (GripSize), R.Top + (GripSize)), Opaque);

          if FRightTopHot then
            Canvas.Fill.SolidColor := $FFFF0000
          else
            Canvas.Fill.SolidColor := $FFFFFFFF;
          R := FSelected.BoundsRect;
          vgInflateRect(R, -0.5, -0.5);
          Canvas.Fillellipse(vgRect(R.Right - (GripSize), R.Top - (GripSize), R.Right + (GripSize), R.Top + (GripSize)), Opaque);
          Canvas.DrawEllipse(vgRect(R.Right - (GripSize), R.Top - (GripSize), R.Right + (GripSize), R.Top + (GripSize)), Opaque);

          if FLeftBottomHot then
            Canvas.Fill.SolidColor := $FFFF0000
          else
            Canvas.Fill.SolidColor := $FFFFFFFF;
          R := FSelected.BoundsRect;
          vgInflateRect(R, -0.5, -0.5);
          Canvas.Fillellipse(vgRect(R.Left - (GripSize), R.Bottom - (GripSize), R.Left + (GripSize), R.Bottom + (GripSize)), Opaque);
          Canvas.DrawEllipse(vgRect(R.Left - (GripSize), R.Bottom - (GripSize), R.Left + (GripSize), R.Bottom + (GripSize)), Opaque);

          if FRightBottomHot then
            Canvas.Fill.SolidColor := $FFFF0000
          else
            Canvas.Fill.SolidColor := $FFFFFFFF;
          R := FSelected.BoundsRect;
          vgInflateRect(R, -0.5, -0.5);
          Canvas.FillEllipse(vgRect(R.Right - (GripSize), R.Bottom - (GripSize), R.Right + (GripSize), R.Bottom + (GripSize)), Opaque);
          Canvas.DrawEllipse(vgRect(R.Right - (GripSize), R.Bottom - (GripSize), R.Right + (GripSize), R.Bottom + (GripSize)), Opaque);
          { lines }
          if FSelected.Width > GripSize * 4 then
          begin
            if FTopHot then
              Canvas.Fill.SolidColor := $FFFF0000
            else
              Canvas.Fill.SolidColor := $FFFFFFFF;
            R := FSelected.BoundsRect;
            vgInflateRect(R, -0.5, -0.5);
            Canvas.FillRect(vgRect(R.Left + vgRectWidth(R)/2 - (GripSize), R.Top - (GripSize), R.Left + vgRectWidth(R)/2 + (GripSize), R.Top + (GripSize)), 0, 0, [], Opaque);
            Canvas.DrawRect(vgRect(R.Left + vgRectWidth(R)/2 - (GripSize), R.Top - (GripSize), R.Left + vgRectWidth(R)/2 + (GripSize), R.Top + (GripSize)), 0, 0, [], Opaque);
            if FBottomHot then
              Canvas.Fill.SolidColor := $FFFF0000
            else
              Canvas.Fill.SolidColor := $FFFFFFFF;
            R := FSelected.BoundsRect;
            vgInflateRect(R, -0.5, -0.5);
            Canvas.FillRect(vgRect(R.Left + vgRectWidth(R)/2 - (GripSize), R.Bottom - (GripSize), R.Left + vgRectWidth(R)/2 + (GripSize), R.Bottom + (GripSize)), 0, 0, [], Opaque);
            Canvas.DrawRect(vgRect(R.Left + vgRectWidth(R)/2 - (GripSize), R.Bottom - (GripSize), R.Left + vgRectWidth(R)/2 + (GripSize), R.Bottom + (GripSize)), 0, 0, [], Opaque);
          end;
          if FSelected.Height > GripSize * 4 then
          begin
            if FLeftHot then
              Canvas.Fill.SolidColor := $FFFF0000
            else
              Canvas.Fill.SolidColor := $FFFFFFFF;
            R := FSelected.BoundsRect;
            vgInflateRect(R, -0.5, -0.5);
            Canvas.FillRect(vgRect(R.Left - (GripSize), R.Top + vgRectHeight(R)/2 - (GripSize), R.Left + (GripSize), R.Top + vgRectHeight(R)/2 + (GripSize)), 0, 0, [], Opaque);
            Canvas.DrawRect(vgRect(R.Left - (GripSize), R.Top + vgRectHeight(R)/2 - (GripSize), R.Left + (GripSize), R.Top + vgRectHeight(R)/2 + (GripSize)), 0, 0, [], Opaque);
            if FRightHot then
              Canvas.Fill.SolidColor := $FFFF0000
            else
              Canvas.Fill.SolidColor := $FFFFFFFF;
            R := FSelected.BoundsRect;
            vgInflateRect(R, -0.5, -0.5);
            Canvas.FillRect(vgRect(R.Right - (GripSize), R.Top + vgRectHeight(R)/2 - (GripSize), R.Right + (GripSize), R.Top + vgRectHeight(R)/2 + (GripSize)), 0, 0, [], Opaque);
            Canvas.DrawRect(vgRect(R.Right - (GripSize), R.Top + vgRectHeight(R)/2 - (GripSize), R.Right + (GripSize), R.Top + vgRectHeight(R)/2 + (GripSize)), 0, 0, [], Opaque);
          end;
          { grid lines }
          if (FMoving or FLeftTop or FRightTop or FLeftBottom or FRightBottom or FTop or FBottom or FLeft or FRight) and
             (Length(FDesignGridLines) > 0) and (FSelected.Parent <> nil) and (FSelected.Parent.IsVisual) then
          begin
            ScaleMatrix := dcm_vgcore.IdentityMatrix;
            Canvas.SetMatrix(vgMatrixMultiply(ScaleMatrix, TvxVisualObject(FSelected.Parent).AbsoluteMatrix));
            Canvas.StrokeDash := vgDashDash;
            for i := 0 to High(FDesignGridLines) do
            begin
              if (FDesignGridLines[i].Position.Y + round(FDesignGridLines[i].Height / 2)) = (FSelected.Position.Y + round(FSelected.Height / 2)) then
              begin
                Canvas.DrawLine(vgPoint(FSelected.Position.X + 0.5, Trunc(FSelected.Position.Y + (FSelected.Height / 2)) + 0.5),
                  vgPoint(FDesignGridLines[i].Position.X + 0.5, Trunc(FSelected.Position.Y + (FSelected.Height / 2)) + 0.5), 1);
              end;
              if (FDesignGridLines[i].Position.X + round(FDesignGridLines[i].Width / 2)) = (FSelected.Position.X + round(FSelected.Width / 2)) then
              begin
                Canvas.DrawLine(vgPoint(Trunc(FSelected.Position.X + (FSelected.Width / 2)) + 0.5, FSelected.Position.Y + 0.5),
                  vgPoint(Trunc(FDesignGridLines[i].Position.X + (FDesignGridLines[i].Width / 2)) + 0.5, FDesignGridLines[i].Position.Y + 0.5), 1);
              end;
              if (FSelected.Position.X = FDesignGridLines[i].Position.X) or (FSelected.Position.Y = FDesignGridLines[i].Position.Y) then
              begin
                Canvas.DrawLine(vgPoint(FSelected.Position.X + 0.5, FSelected.Position.Y + 0.5), vgPoint(FDesignGridLines[i].Position.X + 0.5, FDesignGridLines[i].Position.Y + 0.5), 1);
              end;
              if (FSelected.Position.X + FSelected.Width = FDesignGridLines[i].Position.X) then
              begin
                Canvas.DrawLine(vgPoint(FDesignGridLines[i].Position.X + 0.5, FSelected.Position.Y + 0.5), vgPoint(FDesignGridLines[i].Position.X + 0.5, FDesignGridLines[i].Position.Y + 0.5), 1);
              end;
              if (FSelected.Position.Y + FSelected.Height = FDesignGridLines[i].Position.Y) then
              begin
                Canvas.DrawLine(vgPoint(FSelected.Position.X + 0.5, FDesignGridLines[i].Position.Y + 0.5), vgPoint(FDesignGridLines[i].Position.X + 0.5, FDesignGridLines[i].Position.Y + 0.5), 1);
              end;
              if (FSelected.Position.X = FDesignGridLines[i].Position.X + FDesignGridLines[i].Width) then
              begin
                Canvas.DrawLine(vgPoint(FDesignGridLines[i].Position.X + FDesignGridLines[i].Width + 0.5, FSelected.Position.Y + 0.5),
                  vgPoint(FDesignGridLines[i].Position.X + FDesignGridLines[i].Width + 0.5, FDesignGridLines[i].Position.Y + 0.5), 1);
              end;
              if (FSelected.Position.Y = FDesignGridLines[i].Position.Y + FDesignGridLines[i].Height) then
              begin
                Canvas.DrawLine(vgPoint(FSelected.Position.X + 0.5, FDesignGridLines[i].Position.Y + FDesignGridLines[i].Height + 0.5),
                  vgPoint(FDesignGridLines[i].Position.X + 0.5, FDesignGridLines[i].Position.Y + FDesignGridLines[i].Height + 0.5), 1);
              end;
              if (FSelected.Position.X + FSelected.Width = FDesignGridLines[i].Position.X + FDesignGridLines[i].Width) then
              begin
                Canvas.DrawLine(vgPoint(FDesignGridLines[i].Position.X + FDesignGridLines[i].Width + 0.5, FSelected.Position.Y + 0.5),
                  vgPoint(FDesignGridLines[i].Position.X + FDesignGridLines[i].Width + 0.5, FDesignGridLines[i].Position.Y + 0.5), 1);
              end;
              if (FSelected.Position.Y + FSelected.Height = FDesignGridLines[i].Position.Y + FDesignGridLines[i].Height) then
              begin
                Canvas.DrawLine(vgPoint(FSelected.Position.X + 0.5, FDesignGridLines[i].Position.Y + FDesignGridLines[i].Height + 0.5),
                  vgPoint(FDesignGridLines[i].Position.X + 0.5, FDesignGridLines[i].Position.Y + FDesignGridLines[i].Height + 0.5), 1);
              end;
            end;
            Canvas.StrokeDash := vgDashSolid;
          end;
          end;
          { place message }
          if FDesignPlaceObject <> nil then
          begin
            ScaleMatrix := dcm_vgcore.IdentityMatrix;
            Canvas.SetMatrix(ScaleMatrix);

            R := FDesignPlaceObject.AbsoluteRect;
            Canvas.Stroke.SolidColor := $FF5B91DE;
            Canvas.DrawRect(R, 0, 0, AllCorners, 1);
            Canvas.Font.Family := 'Tahoma';
            Canvas.Font.Style := vgFontRegular;
            Canvas.Font.Size := 9;
            R.Bottom := R.Top;
            R.Top := R.Bottom - 19;
            R.Right := R.Left + 160;
            Canvas.Fill.SolidColor := $FF5B91DE;
            Canvas.FillRect(R, 0, 0, AllCorners, 1);
            Canvas.Fill.SolidColor := $FFFFFFFF;
            vgInflateRect(R, -2, -2);
            if FDesignPlaceObject.Name <> '' then
              Canvas.FillText(R, R, 'ALT-drag to place into [' + FDesignPlaceObject.Name + ']', false, 1, vgTextAlignNear)
            else
              Canvas.FillText(R, R, 'ALT-drag to place into [' + FDesignPlaceObject.ClassName + ']', false, 1, vgTextAlignNear);
          end;
        end;
        { design modes }
        if FDesignTime then
        begin
          ScaleMatrix := dcm_vgcore.IdentityMatrix;
          Canvas.SetMatrix(ScaleMatrix);

          Canvas.Stroke.SolidColor := $FF5B91DE;
          Canvas.Font.Family := 'Tahoma';
          Canvas.Font.Style := vgFontRegular;
          Canvas.Font.Size := 9;
          R := vgRect(0, 0, 200, 17);
        end;
        { debug }
        {$IFDEF UPDATERECT}
        with Canvas do
        begin
          ResetClipRect;
          ScaleMatrix := dcm_vgcore.IdentityMatrix;
          Canvas.SetMatrix(ScaleMatrix);
          Stroke.Style := vgBrushSolid;
          Stroke.Color := '#90FF0000';
          StrokeThickness := 1;
          Fill.Style := vgBrushNone;
          for i := 0 to High(FUpdateRects) do
          begin
            R := FUpdateRects[i];
            DrawRect(FUpdateRects[i], 0, 0, AllCorners, 0.5);
          end;
        end;
        {$ENDIF}
        Canvas.EndScene;
      end;
    finally
      setLength(FUpdateRects, 0);
      FDrawing := false;
    end;
  end;
end;

procedure TdxCustomObjectLayer.BeforePaint;
begin
  if (FBuffer.Width <> FLayerWidth) or (FBuffer.Height <> FLayerHeight) then
  begin
    AddUpdateRect(vgRect(0, 0, FLayerWidth, FLayerHeight));
  end;
  if (FCanvas <> nil) and ((FCanvas.Width <> FLayerWidth) or (FCanvas.Height <> FLayerHeight)) then
  begin
    FCanvas.ResizeBuffer(FLayerWidth, FLayerHeight);
    RealignRoot;
  end;
  inherited;
end;

procedure TdxCustomObjectLayer.Paint;
var
  B: PdxcolorArray;
  i, j: integer;
begin
  { Update DX texture using VGScene canvas }
  if FBuffer <> nil then
  begin
    if Length(FUpdateRects) > 0 then
    begin
      Draw;
      if FBuffer.LockBitmapBits(B, true) then
      begin
        {$IFDEF DARWIN}
        {$IFDEF FPC_BIG_ENDIAN}
        for j := 0 to FBuffer.Height - 1 do
          for i := 0 to FBuffer.Width - 1 do
          begin
            B[i + (j * FBuffer.Width)] := PdxColorArray(FCanvas.FBufferBits)[i + j * FBuffer.Width];
            ReverseBytes(@B[i + (j * FBuffer.Width)], 4);
          end;
        {$ELSE}
        FCanvas.SaveToBits(B);
        {$ENDIF}
        {$ELSE}
        FCanvas.SaveToBits(B);
        {$ENDIF}
        FBuffer.UnlockBitmapBits;
      end;
    end;
  end;
  inherited ;
end;

function TdxCustomObjectLayer.ObjectByPoint(X, Y: single): TvxVisualObject;
var
  i: integer;
  Obj, NewObj: TvxObject;
begin
  Result := nil;
  for i := Count - 1 downto 0 do
  begin
    Obj := Children[i];
    if not (Obj is TvxVisualObject) then Exit;
    if not TvxVisualObject(Obj).Visible and not (FDesignTime) then Continue;

    NewObj := TvxVisualObject(Obj).ObjectByPoint(X, Y);
    if NewObj <> nil then
    begin
      Result := TvxVisualObject(NewObj);
      Exit;
    end;
  end;
end;

procedure TdxCustomObjectLayer.KeyDown(var Key: Word; var Char: System.WideChar;
  Shift: TShiftState);
begin
  if FFocused <> nil then
  begin
    TvxHackVisualObject(FFocused).KeyDown(Key, Char, Shift);
  end;
end;

procedure TdxCustomObjectLayer.KeyUp(var Key: Word; var Char: System.WideChar;
  Shift: TShiftState);
begin
  if FDesignTime or (FDesignTime) then
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
    TvxHackVisualObject(FFocused).KeyUp(Key, Char, Shift);
  end;
end;

procedure TdxCustomObjectLayer.DeleteChildren;
var
  Child: TvxObject;
begin
  if Assigned(FChildren) then
  begin
    while FChildren.Count > 0 do
    begin
      Child := TvxObject(FChildren[0]);
      FChildren.Delete(0);
      TvxHackObject(Child).FParent := nil;
      TvxHackObject(Child).FScene := nil;
      Child.Free;
    end;
    FreeAndNil(FChildren);
  end;
end;

procedure TdxCustomObjectLayer.GetTabOrderList(const AList: TList);
begin
  if Assigned(Root) then
    TvxVisualObject(Root).GetTabOrderList(AList, true);
end;

procedure TdxCustomObjectLayer.AddObject(AObject: TvxObject);
begin
  if AObject.Parent <> nil then
    AObject.Parent := nil;
  if FChildren = nil then
    FChildren := TList.Create;
  FChildren.Add(AObject);
  TvxHackObject(AObject).FScene := Self;
  if AObject.IsVisual and not (csDestroying in ComponentState) then
    TvxVisualObject(AObject).Repaint;
  RealignRoot;
end;

procedure TdxCustomObjectLayer.RemoveObject(AObject: TvxObject);
begin
  if FChildren <> nil then
  begin
    Repaint;
    FChildren.Remove(AObject);
  end;
end;

function TdxCustomObjectLayer.GetCount: integer;
begin
  if FChildren <> nil then
    Result := FChildren.Count
  else
    Result := 0;
end;

function TdxCustomObjectLayer.GetChildrenObject(Index: integer): TvxObject;
begin
  if FChildren <> nil then
    Result := TvxObject(FChildren[Index])
  else
    Result := nil;
end;

procedure TdxCustomObjectLayer.SetChildren(Index: integer; const Value: TvxObject);
begin
end;

function TdxCustomObjectLayer.DoHintShow(var Message: {$IFDEF FPC} TLMessage {$ELSE} TMessage {$ENDIF}): boolean;
var
  Obj: TvxVisualObject;
  P: TvxPoint;
  i: integer;
  P3, rayPos, rayDir: TdxVector;
  X, Y: single;
begin
  Result := inherited DoHintShow(Message);
  with TCMHintShow(Message).HintInfo^ do
  begin
    inherited Canvas.Pick(CursorPos.X, CursorPos.Y, Projection, rayPos, rayDir);
    rayPos := AbsoluteToLocalVector(rayPos);
    rayDir := AbsoluteToLocalVector(rayDir);
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

    Obj := ObjectByPoint(X, Y);
    if (Obj <> nil) and (Obj.ShowHint) then
    begin
      HintStr := Obj.Hint;
      with LocalToAbsolute(dxPoint(Obj.Position.X, Obj.Position.Y, 0)) do
        CursorRect := Rect(Trunc(X), Trunc(Y), Trunc(X + Obj.Width), Trunc(Y + Obj.Height));
      Result := true;
    end;
  end;
end;

function TdxCustomObjectLayer.SnapToGridValue(Value: single): single;
begin
  if (DesignSnapToGrid) and (DesignSnapGridSize <> 0) then
    Result := Trunc(Value / DesignSnapGridSize) * DesignSnapGridSize
  else
    Result := Value;
end;

procedure TdxCustomObjectLayer.AddUpdateRectsFromGridLines;
  procedure IntAddUpdateRect(const R: TvxRect);
  var
    i: integer;
  begin
    for i := 0 to High(FUpdateRects) do
      with FUpdateRects[i] do
        if (R.Left = Left) and (R.Top = Top) and (R.Right = Right) and (R.Bottom = Bottom) then
        begin
          Exit;
        end;
    AddUpdateRect(R);
  end;
var
  i: integer;
begin
  { Add grip lines }
  if FDesignTime and (FSelected <> nil) and not FSelected.DisableDesignResize and
     (FMoving or FLeftTop or FRightTop or FLeftBottom or FRightBottom or FTop or FBottom or FLeft or FRight) and
     (Length(FDesignGridLines) > 0) and (FSelected.Parent <> nil) and (FSelected.Parent.IsVisual) then
  begin
    for i := 0 to High(FDesignGridLines) do
    begin
      IntAddUpdateRect(vgNormalizeRect2(vgRect(FSelected.Position.X - 1, FSelected.Position.Y + (FSelected.Height / 2) - 1,
        FDesignGridLines[i].Position.X + 1, FDesignGridLines[i].Position.Y + (FDesignGridLines[i].Height / 2) + 1)));
      IntAddUpdateRect(vgNormalizeRect2(vgRect(FSelected.Position.X + (FSelected.Width / 2) - 1, FSelected.Position.Y - 1,
        FDesignGridLines[i].Position.X + (FDesignGridLines[i].Width / 2) + 1, FDesignGridLines[i].Position.Y + 1)));

      IntAddUpdateRect(vgNormalizeRect2(vgRect(FSelected.Position.X - 1, FSelected.Position.Y - 1, FDesignGridLines[i].Position.X + 1, FDesignGridLines[i].Position.Y + 1)));
      IntAddUpdateRect(vgNormalizeRect2(vgRect(FDesignGridLines[i].Position.X - 1, FSelected.Position.Y - 1, FDesignGridLines[i].Position.X + 1, FDesignGridLines[i].Position.Y + 1)));
      IntAddUpdateRect(vgNormalizeRect2(vgRect(FSelected.Position.X - 1, FDesignGridLines[i].Position.Y - 1, FDesignGridLines[i].Position.X + 1, FDesignGridLines[i].Position.Y + 1)));
      IntAddUpdateRect(vgNormalizeRect2(vgRect(FDesignGridLines[i].Position.X + FDesignGridLines[i].Width - 1, FSelected.Position.Y - 1,
          FDesignGridLines[i].Position.X + FDesignGridLines[i].Width + 1, FDesignGridLines[i].Position.Y + 1)));
      IntAddUpdateRect(vgNormalizeRect2(vgRect(FSelected.Position.X - 1, FDesignGridLines[i].Position.Y + FDesignGridLines[i].Height - 1,
          FDesignGridLines[i].Position.X + 1, FDesignGridLines[i].Position.Y + FDesignGridLines[i].Height + 1)));
      IntAddUpdateRect(vgNormalizeRect2(vgRect(FDesignGridLines[i].Position.X + FDesignGridLines[i].Width - 1, FSelected.Position.Y - 1,
          FDesignGridLines[i].Position.X + FDesignGridLines[i].Width + 1, FDesignGridLines[i].Position.Y + 1)));
      IntAddUpdateRect(vgNormalizeRect2(vgRect(FSelected.Position.X - 1, FDesignGridLines[i].Position.Y + FDesignGridLines[i].Height - 1,
          FDesignGridLines[i].Position.X + 1, FDesignGridLines[i].Position.Y + FDesignGridLines[i].Height + 1)));
    end;
  end;
end;

procedure TdxCustomObjectLayer.SnapToGridLines(AllowChangePosition: boolean);
  procedure AddGridLine(const Obj: TvxVisualObject);
  var
    i: integer;
  begin
    for i := 0 to High(FDesignGridLines) do
      if FDesignGridLines[i] = Obj then Exit;
    SetLength(FDesignGridLines, Length(FDesignGridLines) + 1);
    FDesignGridLines[High(FDesignGridLines)] := Obj;
  end;
const
  SnapLineSize = 2;
var
  i: integer;
begin
  if (DesignSnapToLines) and (FSelected.Parent <> nil) then
    for i := 0 to FSelected.Parent.ChildrenCount - 1 do
    begin
      if TvxObject(FSelected.Parent.Children[i]) = FSelected then Continue;
      if not TvxObject(FSelected.Parent.Children[i]).isVisual then Continue;
      with TvxVisualObject(FSelected.Parent.Children[i]) do
      begin
        if (Abs((Position.Y + round(Height / 2)) - (FSelected.Position.Y + round(FSelected.Height / 2))) < SnapLineSize) then
        begin
          if AllowChangePosition then
          begin
            FMousePos.Y := FMousePos.Y + ((Position.Y + round(Height / 2)) - (FSelected.Position.Y + round(FSelected.Height / 2)));
            FSelected.Position.Y := (Position.Y + round(Height / 2) - round(FSelected.Height / 2));
          end;
          AddGridLine(TvxVisualObject(FSelected.Parent.Children[i]));
          Continue;
        end;
        if (Abs((Position.X + round(Width / 2)) - (FSelected.Position.X + round(FSelected.Width / 2))) < SnapLineSize) then
        begin
          if AllowChangePosition then
          begin
            FMousePos.X := FMousePos.X + ((Position.X + round(Width / 2)) - (FSelected.Position.X + round(FSelected.Width / 2)));
            FSelected.Position.X := (Position.X + round(Width / 2) - round(FSelected.Width / 2));
          end;
          AddGridLine(TvxVisualObject(FSelected.Parent.Children[i]));
          Continue;
        end;
        if (Abs(Position.X - FSelected.Position.X) < SnapLineSize) then
        begin
          if AllowChangePosition then
          begin
            FMousePos.X := FMousePos.X + (Position.X - FSelected.Position.X);
            FSelected.Position.X := Position.X;
          end;
          AddGridLine(TvxVisualObject(FSelected.Parent.Children[i]));
          Continue;
        end;
        if (Abs(Position.Y - FSelected.Position.Y) < SnapLineSize) then
        begin
          if AllowChangePosition then
          begin
            FMousePos.Y := FMousePos.Y + (Position.Y - FSelected.Position.Y);
            FSelected.Position.Y := Position.Y;
          end;
          AddGridLine(TvxVisualObject(FSelected.Parent.Children[i]));
          Continue;
        end;
        if (Abs(Position.X - (FSelected.Position.X + FSelected.Width)) < SnapLineSize) then
        begin
          if AllowChangePosition then
          begin
            FMousePos.X := FMousePos.X + (Position.X - (FSelected.Position.X + FSelected.Width));
            FSelected.Position.X := Position.X - FSelected.Width;
          end;
          AddGridLine(TvxVisualObject(FSelected.Parent.Children[i]));
          Continue;
        end;
        if (Abs(Position.Y - (FSelected.Position.Y + FSelected.Height)) < SnapLineSize) then
        begin
          if AllowChangePosition then
          begin
            FMousePos.Y := FMousePos.Y + (Position.Y - (FSelected.Position.Y + FSelected.Height));
            FSelected.Position.Y := Position.Y - FSelected.Height;
          end;
          AddGridLine(TvxVisualObject(FSelected.Parent.Children[i]));
          Continue;
        end;
        if (Abs((Position.X + Width) - FSelected.Position.X) < SnapLineSize) then
        begin
          if AllowChangePosition then
          begin
            FMousePos.X := FMousePos.X + ((Position.X + Width) - FSelected.Position.X);
            FSelected.Position.X := Position.X + Width;
          end;
          AddGridLine(TvxVisualObject(FSelected.Parent.Children[i]));
          Continue;
        end;
        if (Abs((Position.Y + Height) - FSelected.Position.Y) < SnapLineSize) then
        begin
          if AllowChangePosition then
          begin
            FMousePos.Y := FMousePos.Y + ((Position.Y + Height) - FSelected.Position.Y);
            FSelected.Position.Y := Position.Y + Height;
          end;
          AddGridLine(TvxVisualObject(FSelected.Parent.Children[i]));
          Continue;
        end;
        if (Abs((Position.X + Width) - (FSelected.Position.X + FSelected.Width)) < SnapLineSize) then
        begin
          if AllowChangePosition then
          begin
            FMousePos.X := FMousePos.X + ((Position.X + Width) - (FSelected.Position.X + FSelected.Width));
            FSelected.Position.X := Position.X + Width - FSelected.Width;
          end;
          AddGridLine(TvxVisualObject(FSelected.Parent.Children[i]));
          Continue;
        end;
        if (Abs((Position.Y + Height) - (FSelected.Position.Y + FSelected.Height)) < SnapLineSize) then
        begin
          if AllowChangePosition then
          begin
            FMousePos.Y := FMousePos.Y + ((Position.Y + Height) - (FSelected.Position.Y + FSelected.Height));
            FSelected.Position.Y := Position.Y + Height - FSelected.Height;
          end;
          AddGridLine(TvxVisualObject(FSelected.Parent.Children[i]));
          Continue;
        end;
      end;
    end;
  AddUpdateRectsFromGridLines;
end;

function TdxCustomObjectLayer.SnapPointToGridLines(const APoint: TvxPoint): TvxPoint;
var
  i: integer;
begin
  Result := APoint;
  if not DesignSnapToLines then Exit;
  if FSelected = nil then Exit;
  if FSelected.Parent = nil then Exit;
  SnapToGridLines(false);
  if Length(FDesignGridLines) > 0 then
  begin
    Result := FSelected.LocalToAbsolute(APoint);
    Result := TvxVisualObject(FSelected.Parent).AbsoluteToLocal(Result);
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
    Result := TvxVisualObject(FSelected.Parent).LocalToAbsolute(Result);
    Result := FSelected.AbsolutetoLocal(Result);
  end;
end;

function TdxCustomObjectLayer.RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean;
var
  V: TdxVector;
  x, y: single;
begin
  Result := inherited RayCastIntersect(RayPos, RayDir, Intersection);
  if Result and not FDesignTime and (Scene <> nil) and (Scene.Captured <> Self) and not AllowDrag then
  begin
    V := AbsoluteToLocalVector(Intersection);
    if Projection = dxProjectionCamera then
    begin
      X := (((V.x + (Width / 2)) / Width) * FLayerWidth);
      Y := (((-V.z + (Depth / 2)) / Depth) * FLayerHeight);
    end
    else
    begin
      X := (((V.x + (Width / 2)) / Width) * FLayerWidth);
      Y := (((V.y + (Height / 2)) / Height) * FLayerHeight);
    end;
    Result := ObjectByPoint(X, Y) <> nil;
  end;
end;

procedure TdxCustomObjectLayer.LayerMouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: single);
var
  P: TvxPoint;
  R: TvxRect;
  Obj: TvxVisualObject;
  InsertObject: TvxObject;
  SG: IvgSizeGrip;
  i: integer;
begin
  inherited;
  if (Assigned(Scene) and not (Scene.DesignTime)) and not (FDesignTime) then
    SetFocus;
  { translate coord }
  FUnsnapMousePos := vgPoint(x, y);
  FMousePos := vgPoint(SnapToGridValue(x), SnapToGridValue(y));
  FDownPos := FMousePos;
  SetLength(FDesignGridLines, 0);
  { design }
  if FDesignTime then
  begin
    { Create root }
    if (FChildren = nil) or (FChildren.Count = 0) then
    begin
      Obj := TvxLayout.Create(Owner);
      if vgDesigner <> nil then
        Obj.Name := vgDesigner.UniqueName(Owner, 'Root');
      AddObject(Obj);
      RealignRoot;
    end;
    { Popup }
    if Button = mbRight then
    begin
      FPopupPos := FMousePos;
      OpenDesignPopup;
    end;
    { Resize }
    if (FSelected <> nil) then
    begin
      P := FSelected.AbsoluteToLocal(vgPoint(FUnsnapMousePos.X, FUnsnapMousePos.Y));
      R := vgRect(FSelected.Width / 2 - (GripSize), - RotSize - (GripSize),
          (FSelected.Width) / 2 +(GripSize), - RotSize + (GripSize));
      if vgPtInRect(P, R) then
      begin
        if vgDesigner <> nil then
          vgDesigner.SelectObject(Owner, FSelected, []);
        if Assigned(FDesignChangeSelection) then
          FDesignChangeSelection(Self);
        FRotate := true;
        FMoving := false;
        Exit;
      end;
      P := FSelected.AbsoluteToLocal(vgPoint(FUnsnapMousePos.X, FUnsnapMousePos.Y));
      R := vgRect(-GripSize, -GripSize, GripSize, GripSize);
      if vgPtInRect(P, R) then
      begin
        if vgDesigner <> nil then
          vgDesigner.SelectObject(Owner, FSelected, []);
        if Assigned(FDesignChangeSelection) then
          FDesignChangeSelection(Self);
        FLeftTop := true;
        FMoving := false;
        Exit;
      end;
      R := FSelected.BoundsRect;
      R := vgRect(R.Right -GripSize, -GripSize, R.Right + GripSize, GripSize);
      if vgPtInRect(P, R) then
      begin
        if vgDesigner <> nil then
          vgDesigner.SelectObject(Owner, FSelected, []);
        if Assigned(FDesignChangeSelection) then
          FDesignChangeSelection(Self);
        FRightTop := true;
        FMoving := false;
        Exit;
      end;
      R := FSelected.BoundsRect;
      R := vgRect(-GripSize, R.Bottom - GripSize, GripSize, R.Bottom + GripSize);
      if vgPtInRect(P, R) then
      begin
        if vgDesigner <> nil then
          vgDesigner.SelectObject(Owner, FSelected, []);
        if Assigned(FDesignChangeSelection) then
          FDesignChangeSelection(Self);
        FLeftBottom := true;
        FMoving := false;
        Exit;
      end;
      R := FSelected.BoundsRect;
      R := vgRect(R.Right - GripSize, R.Bottom - GripSize, R.Right + GripSize, R.Bottom + GripSize);
      if vgPtInRect(P, R) then
      begin
        if vgDesigner <> nil then
          vgDesigner.SelectObject(Owner, FSelected, []);
        if Assigned(FDesignChangeSelection) then
          FDesignChangeSelection(Self);
        FRightBottom := true;
        FMoving := false;
        Exit;
      end;

      R := FSelected.BoundsRect;
      R := vgRect(vgRectWidth(R)/2 - GripSize, -GripSize, vgRectWidth(R)/2 + GripSize, GripSize);
      if vgPtInRect(P, R) then
      begin
        if vgDesigner <> nil then
          vgDesigner.SelectObject(Owner, FSelected, []);
        if Assigned(FDesignChangeSelection) then
          FDesignChangeSelection(Self);
        FTop := true;
        FMoving := false;
        Exit;
      end;
      R := FSelected.BoundsRect;
      R := vgRect(vgRectWidth(R)/2 - GripSize, R.Bottom - GripSize, vgRectWidth(R)/2 + GripSize, R.Bottom + GripSize);
      if vgPtInRect(P, R) then
      begin
        if vgDesigner <> nil then
          vgDesigner.SelectObject(Owner, FSelected, []);
        if Assigned(FDesignChangeSelection) then
          FDesignChangeSelection(Self);
        FBottom := true;
        FMoving := false;
        Exit;
      end;
      R := FSelected.BoundsRect;
      R := vgRect(-GripSize, vgRectHeight(R)/2 - GripSize, GripSize, vgRectHeight(R)/2 + GripSize);
      if vgPtInRect(P, R) then
      begin
        if vgDesigner <> nil then
          vgDesigner.SelectObject(Owner, FSelected, []);
        if Assigned(FDesignChangeSelection) then
          FDesignChangeSelection(Self);
        FLeft := true;
        FMoving := false;
        Exit;
      end;
      R := FSelected.BoundsRect;
      R := vgRect(R.Right-GripSize, vgRectHeight(R)/2 - GripSize, R.Right + GripSize, vgRectHeight(R)/2 + GripSize);
      if vgPtInRect(P, R) then
      begin
        if vgDesigner <> nil then
          vgDesigner.SelectObject(Owner, FSelected, []);
        if Assigned(FDesignChangeSelection) then
          FDesignChangeSelection(Self);
        FRight := true;
        FMoving := false;
        Exit;
      end;
    end;
    { Change Selected }
    Obj := ObjectByPoint(FUnsnapMousePos.X, FUnsnapMousePos.Y);
    if (Obj <> nil) and (Obj = FSelected) and (ssDouble in Shift) then
    begin
      TvxHackVisualObject(Obj).DesignClick;
    end;
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
        if vgDesigner <> nil then
          vgDesigner.SelectObject(Owner, Selected, FSelection);
        Exit;
      end;
      SetLength(FSelection, 0);

      if FSelected <> nil then
        FSelected.Repaint;
      FSelected := Obj;
      TvxHackVisualObject(FSelected).DesignSelect;
      { Select in IDE }
      if vgDesigner <> nil then
      begin
        vgDesigner.SelectObject(Owner, Obj, []);
      end;
      if Assigned(FDesignChangeSelection) then
        FDesignChangeSelection(Self);
      { }
      FSelected.Repaint;
      if (Obj = FSelected) then
        FMoving := true;
    end;
    Exit;
  end;
  { event }
  if not FDesignTime then
  begin
    Obj := TvxVisualObject(ObjectByPoint(FMousePos.X, FMousePos.Y));
    if (Obj <> nil) then
    begin
      if (TvxHackObject(Obj).QueryInterface(IvgSizeGrip, SG) = 0) and (Assigned(SG)) then
      begin
        BeginResize;
      end
      else
      begin
        P := Obj.AbsoluteToLocal(vgPoint(FMousePos.X, FMousePos.Y));
        TvxHackVisualObject(Obj).MouseDown(Button, Shift, P.X, P.Y);
        if (TvxHackVisualObject(Obj).DragMode = vgDragAutomatic) then
          TvxHackVisualObject(Obj).BeginAutoDrag;
      end;
    end
    else
      if AllowDrag then
        BeginDrag;
  end;
end;

procedure TdxCustomObjectLayer.LayerMouseMove(Shift: TShiftState; X, Y: single);
var
  R: TvxRect;
  P, P1: TvxPoint;
  Obj: TvxVisualObject;
  SG: IvgSizeGrip;
  downP: TdxVector;
  P3: TdxVector;
  NewCursor: TCursor;
begin
  inherited;
  NewCursor := FLoadCursor;
  if FDragging then
  begin
    P3 := LocalToAbsoluteVector(dxVector(X - FDownPos.X, Y - FDownPos.Y, 0, 0));
    P3 := TdxVisualObject(Parent).AbsoluteToLocalVector(P3);
    Position.Point := dxPoint(Position.X + P3.X, Position.Y + P3.Y, Position.Z);
    Exit;
  end;
  if FResizing then
  begin
    FResizePos.X := FResizePos.X + (X - FMousePos.X) / 2;
    FResizePos.Y := FResizePos.Y + (Y - FMousePos.Y) / 2;
    FResizeSize.X := FResizeSize.X + (X - FMousePos.X);
    FResizeSize.Y := FResizeSize.Y + (Y - FMousePos.Y);
    Width := round(FResizeSize.X);
    Height := round(FResizeSize.Y);
    if (FResizeStartPos.X <> Position.X - Width / 2) then
    begin
      Position.X := FResizeStartPos.X + (Width / 2);
    end;
    if (FResizeStartPos.Y <> Position.Y - Height / 2) then
    begin
      Position.Y := FResizeStartPos.Y + (Height / 2);
    end;
    FMousePos := vgPoint(x, y);
    Exit;
  end;
  { translate coord }
  FMousePos := vgPoint(SnapToGridValue(x), SnapToGridValue(y));
  FUnsnapMousePos := vgPoint(x, y);
  { design }
  if FDesignTime then
  begin
    { change cursor }
    if (FSelected <> nil) then
    begin
      P := FSelected.AbsoluteToLocal(vgPoint(FUnsnapMousePos.X, FUnsnapMousePos.Y));
      R := vgRect(FSelected.Width / 2 - (GripSize), - RotSize - (GripSize),
        (FSelected.Width) / 2 +(GripSize), - RotSize + (GripSize));
      if FRotateHot <> vgPtInRect(P, R) then
      begin
        FRotateHot := vgPtInRect(P, R);
        R.TopLeft := FSelected.LocaltoAbsolute(R.TopLeft);
        R.BottomRight := FSelected.LocaltoAbsolute(R.BottomRight);
        vgInflateRect(R, 2, 2);
        AddUpdateRect(R);
      end;
      P := FSelected.AbsoluteToLocal(vgPoint(FUnsnapMousePos.X, FUnsnapMousePos.Y));
      R := vgRect(-GripSize, -GripSize, GripSize, GripSize);
      if FLeftTopHot <> vgPtInRect(P, R) then
      begin
        FLeftTopHot := vgPtInRect(P, R);
        R.TopLeft := FSelected.LocaltoAbsolute(R.TopLeft);
        R.BottomRight := FSelected.LocaltoAbsolute(R.BottomRight);
        vgInflateRect(R, 2, 2);
        AddUpdateRect(R);
      end;
      R := FSelected.BoundsRect;
      R := vgRect(R.Right -GripSize, -GripSize, R.Right + GripSize, GripSize);
      if FRightTopHot <> vgPtInRect(P, R) then
      begin
        FRightTopHot := vgPtInRect(P, R);
        R.TopLeft := FSelected.LocaltoAbsolute(R.TopLeft);
        R.BottomRight := FSelected.LocaltoAbsolute(R.BottomRight);
        vgInflateRect(R, 2, 2);
        AddUpdateRect(R);
      end;
      R := FSelected.BoundsRect;
      R := vgRect(-GripSize, R.Bottom - GripSize, GripSize, R.Bottom + GripSize);
      if FLeftBottomHot <> vgPtInRect(P, R) then
      begin
        FLeftBottomHot := vgPtInRect(P, R);
        R.TopLeft := FSelected.LocaltoAbsolute(R.TopLeft);
        R.BottomRight := FSelected.LocaltoAbsolute(R.BottomRight);
        vgInflateRect(R, 2, 2);
        AddUpdateRect(R);
      end;
      R := FSelected.BoundsRect;
      R := vgRect(R.Right - GripSize, R.Bottom - GripSize, R.Right + GripSize, R.Bottom + GripSize);
      if FRightBottomHot <> vgPtInRect(P, R) then
      begin
        FRightBottomHot := vgPtInRect(P, R);
        R.TopLeft := FSelected.LocaltoAbsolute(R.TopLeft);
        R.BottomRight := FSelected.LocaltoAbsolute(R.BottomRight);
        vgInflateRect(R, 2, 2);
        AddUpdateRect(R);
      end;

      R := FSelected.BoundsRect;
      R := vgRect(vgRectWidth(R)/2 - GripSize, -GripSize, vgRectWidth(R)/2 + GripSize, GripSize);
      if FTopHot <> vgPtInRect(P, R) then
      begin
        FTopHot := vgPtInRect(P, R);
        R.TopLeft := FSelected.LocaltoAbsolute(R.TopLeft);
        R.BottomRight := FSelected.LocaltoAbsolute(R.BottomRight);
        vgInflateRect(R, 2, 2);
        AddUpdateRect(R);
      end;
      R := FSelected.BoundsRect;
      R := vgRect(vgRectWidth(R)/2 - GripSize, R.Bottom - GripSize, vgRectWidth(R)/2 + GripSize, R.Bottom + GripSize);
      if FBottomHot <> vgPtInRect(P, R) then
      begin
        FBottomHot := vgPtInRect(P, R);
        R.TopLeft := FSelected.LocaltoAbsolute(R.TopLeft);
        R.BottomRight := FSelected.LocaltoAbsolute(R.BottomRight);
        vgInflateRect(R, 2, 2);
        AddUpdateRect(R);
      end;
      R := FSelected.BoundsRect;
      R := vgRect(-GripSize, vgRectHeight(R)/2 - GripSize, GripSize, vgRectHeight(R)/2 + GripSize);
      if FLeftHot <> vgPtInRect(P, R) then
      begin
        FLeftHot := vgPtInRect(P, R);
        R.TopLeft := FSelected.LocaltoAbsolute(R.TopLeft);
        R.BottomRight := FSelected.LocaltoAbsolute(R.BottomRight);
        vgInflateRect(R, 2, 2);
        AddUpdateRect(R);
      end;
      R := FSelected.BoundsRect;
      R := vgRect(R.Right-GripSize, vgRectHeight(R)/2 - GripSize, R.Right + GripSize, vgRectHeight(R)/2 + GripSize);
      if FRightHot <> vgPtInRect(P, R) then
      begin
        FRightHot := vgPtInRect(P, R);
        R.TopLeft := FSelected.LocaltoAbsolute(R.TopLeft);
        R.BottomRight := FSelected.LocaltoAbsolute(R.BottomRight);
        vgInflateRect(R, 2, 2);
        AddUpdateRect(R);
      end;
    end;
    { resize and move }
    if (ssLeft in Shift) and (FSelected <> nil) and (FMoving) then
    begin
      P := vgPoint(FUnsnapMousePos.X - FDownPos.X, FUnsnapMousePos.Y - FDownPos.Y);
      if (FSelected.Parent <> nil) and (FSelected.Parent.IsVisual) then
      begin
        with TvxVisualObject(FSelected.Parent).AbsoluteToLocalVector(vgVector(P.X, P.Y)) do
          P := vgPoint(X, Y);
      end
      else
      begin
        with FSelected.AbsoluteToLocalVector(vgVector(P.X, P.Y)) do
          P := vgPoint(X, Y);
      end;
      FSelected.Position.X := SnapToGridValue(FSelected.Position.X + P.X);
      FSelected.Position.Y := SnapToGridValue(FSelected.Position.Y + P.Y);
      { lines grid }
      SnapToGridLines(true);
      { check place }
      TvxHackVisualObject(FSelected).FLocked := true;
      Obj := TvxVisualObject(ObjectByPoint(FUnsnapMousePos.X, FUnsnapMousePos.Y));
      TvxHackVisualObject(FSelected).FLocked := false;
      { select }
      if (Obj <> nil) and (Obj <> FSelected.Parent) and (Obj <> FSelected) then
      begin
        FDesignPlaceObject := Obj;
        if (ssAlt in Shift) then
        begin
          P := FSelected.LocalToAbsolute(vgPoint(0, 0));
          FSelected.Parent := FDesignPlaceObject;
          P := FDesignPlaceObject.AbsoluteToLocal(P);
          FSelected.Position.X := P.X;
          FSelected.Position.Y := P.Y;
        end;
      end
      else
        FDesignPlaceObject := nil;
    end;
    if (ssLeft in Shift) and (FSelected <> nil) and (FRotate) then
    begin
      R := FSelected.BoundsRect;
      P := FSelected.AbsoluteToLocal(FMousePos);
      P1 := FSelected.AbsoluteToLocal(FDownPos);
      if vgVectorCrossProductZ(vgVector(P.X - (FSelected.Width / 2), P.Y - (FSelected.Height / 2)),
        vgVector(P1.X - (FSelected.Width / 2), P1.Y - (FSelected.Height / 2))) < 0
      then
        FSelected.RotateAngle := FSelected.RotateAngle + vgRadToDeg(ArcCos(vgVectorAngleCosine(vgVector(P.X - (FSelected.Width / 2), P.Y - (FSelected.Height / 2)),
          vgVector(P1.X - (FSelected.Width / 2), P1.Y - (FSelected.Height / 2)))))
      else
        FSelected.RotateAngle := FSelected.RotateAngle - vgRadToDeg(ArcCos(vgVectorAngleCosine(vgVector(P.X - (FSelected.Width / 2), P.Y - (FSelected.Height / 2)),
          vgVector(P1.X - (FSelected.Width / 2), P1.Y - (FSelected.Height / 2)))));
    end;
    if (ssLeft in Shift) and (FSelected <> nil) and (FLeftTop) then
    begin
      R := FSelected.BoundsRect;
      P := FSelected.AbsoluteToLocal(FMousePos);
      P := SnapPointToGridLines(P);
      FSelected.BoundsRect := vgRect(P.X, P.Y,
        R.Right, R.Bottom);
    end;
    if (ssLeft in Shift) and (FSelected <> nil) and (FRightTop) then
    begin
      R := FSelected.BoundsRect;
      P := FSelected.AbsoluteToLocal(FMousePos);
      P := SnapPointToGridLines(P);
      FSelected.BoundsRect := vgRect(R.Left, P.Y,
        P.X, R.Bottom);
    end;
    if (ssLeft in Shift) and (FSelected <> nil) and (FLeftBottom) then
    begin
      R := FSelected.BoundsRect;
      P := FSelected.AbsoluteToLocal(FMousePos);
      P := SnapPointToGridLines(P);
      FSelected.BoundsRect := vgRect(P.X, R.Top,
        R.Right, P.Y);
    end;
    if (ssLeft in Shift) and (FSelected <> nil) and (FRightBottom) then
    begin
      R := FSelected.BoundsRect;
      P := FSelected.AbsoluteToLocal(FMousePos);
      P := SnapPointToGridLines(P);
      FSelected.BoundsRect := vgRect(R.Left, R.Top, P.X, P.Y);
    end;

    if (ssLeft in Shift) and (FSelected <> nil) and (FTop) then
    begin
      R := FSelected.BoundsRect;
      P := FSelected.AbsoluteToLocal(FMousePos);
      P := SnapPointToGridLines(P);
      FSelected.BoundsRect := vgRect(R.Left, P.Y, R.Right, R.Bottom);
    end;
    if (ssLeft in Shift) and (FSelected <> nil) and (FBottom) then
    begin
      R := FSelected.BoundsRect;
      P := FSelected.AbsoluteToLocal(FMousePos);
      P := SnapPointToGridLines(P);
      FSelected.BoundsRect := vgRect(R.Left, R.Top, R.Right, P.Y);
    end;
    if (ssLeft in Shift) and (FSelected <> nil) and (FLeft) then
    begin
      R := FSelected.BoundsRect;
      P := FSelected.AbsoluteToLocal(FMousePos);
      P := SnapPointToGridLines(P);
      FSelected.BoundsRect := vgRect(P.X, R.Top, R.Right, R.Bottom);
    end;
    if (ssLeft in Shift) and (FSelected <> nil) and (FRight) then
    begin
      R := FSelected.BoundsRect;
      P := FSelected.AbsoluteToLocal(FMousePos);
      P := SnapPointToGridLines(P);
      FSelected.BoundsRect := vgRect(R.Left, R.Top, P.X, R.Bottom);
    end;
    FDownPos := FMousePos;
    Exit;
  end;
  { event }
  if not FDesignTime then
  begin
    if (FCaptured <> nil) then
    begin
      P := FCaptured.AbsoluteToLocal(vgPoint(FMousePos.X, FMousePos.Y));
      TvxHackVisualObject(FCaptured).MouseMove(Shift, P.X, P.Y, 0, 0);
      Exit;
    end;
    Obj := TvxVisualObject(ObjectByPoint(FMousePos.X, FMousePos.Y));
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
          TvxHackVisualObject(FHovered).MouseInObject := false;
          TvxHackVisualObject(FHovered).MouseLeave;
          TvxVisualObject(FHovered).RemoveFreeNotify(Self);
        end;
        FHovered := Obj;
        TvxHackVisualObject(FHovered).MouseInObject := true;
        TvxHackVisualObject(FHovered).MouseEnter;
        TvxVisualObject(FHovered).AddFreeNotify(Self);
      end;

      P := Obj.AbsoluteToLocal(vgPoint(FMousePos.X, FMousePos.Y));
      TvxHackVisualObject(Obj).MouseMove(Shift, P.X, P.Y, 0, 0);
    end
    else
      if FHovered <> nil then
      begin
        TvxHackVisualObject(FHovered).MouseInObject := false;
        TvxHackVisualObject(FHovered).MouseLeave;
        TvxVisualObject(FHovered).RemoveFreeNotify(Self);
        FHovered := nil;
      end;
  end;
  FDownPos := FMousePos;
  Cursor := NewCursor;
end;

procedure TdxCustomObjectLayer.LayerMouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: single);
var
  P: TvxPoint;
  Obj: TvxVisualObject;
begin
  inherited;
  { design }
  FDesignPlaceObject := nil;
  SetLength(FDesignGridLines, 0);
  if (FSelected <> nil) and FMoving then
  begin
    if (FSelected.Parent <> nil) and (TvxObject(FSelected.Parent).IsVisual) then
      TvxVisualObject(FSelected.Parent).Realign;
    if (vgDesigner <> nil) then
      vgDesigner.Modified(Owner);
    if FSelected.Parent = nil then
      RealignRoot;
  end;
  if (FSelected <> nil) and (FLeftTop or FLeftBottom or FLeftBottom or FRightBottom) then
  begin
    if (FSelected.Parent <> nil) and (TvxObject(FSelected.Parent).IsVisual) then
      TvxVisualObject(FSelected.Parent).Realign;
    if (vgDesigner <> nil) then
      vgDesigner.Modified(Owner);
    if FSelected.Parent = nil then
      RealignRoot;
  end;
  FMoving := false;
  FLeftTop := false;
  FLeftBottom := false;
  FRightTop := false;
  FRightBottom := false;
  FTop := false;
  FBottom := false;
  FLeft := false;
  FRight := false;
  FRotate := false;
  { drag }
  if FDragging then
  begin
    FDragging := false;
//    ReleaseCapture;
  end;
  if FResizing then
  begin
    FResizing := false;
//    ReleaseCapture;
  end;
  { event }
  if not FDesignTime then
  begin
    if (FCaptured <> nil) then
    begin
      P := FCaptured.AbsoluteToLocal(vgPoint(FMousePos.X, FMousePos.Y));
      TvxHackVisualObject(FCaptured).MouseUp(Button, Shift, P.X, P.Y);
      Exit;
    end;
    Obj := TvxVisualObject(ObjectByPoint(FMousePos.X, FMousePos.Y));
    if (Obj <> nil) then
    begin
      P := Obj.AbsoluteToLocal(vgPoint(FMousePos.X, FMousePos.Y));
      TvxHackVisualObject(Obj).MouseUp(Button, Shift, P.X, P.Y);
    end;
  end;
end;

procedure TdxCustomObjectLayer.MouseWheel(Shift: TShiftState; WheelDelta: integer; var Handled: boolean);
var
  Obj: TvxVisualObject;
begin
  inherited ;
  { event }
  if not FDesignTime then
  begin
    {$IFDEF DARWIN}
    WheelDelta := WheelDelta * 40;
    {$ENDIF}
    if (FCaptured <> nil) then
    begin
      TvxHackVisualObject(FCaptured).MouseWheel(Shift, WheelDelta, Handled);
      Exit;
    end;
    Obj := TvxVisualObject(ObjectByPoint(FMousePos.X, FMousePos.Y));
    while (Obj <> nil) do
    begin
      TvxHackVisualObject(Obj).MouseWheel(Shift, WheelDelta, Handled);
      if Handled then Break;
      if (Obj.Parent <> nil) and (Obj.Parent.IsVisual) then
        Obj := TvxVisualObject(Obj.Parent)
      else
        Obj := nil;
    end;
  end;
end;

procedure TdxCustomObjectLayer.RealignRoot;
begin
  if (FChildren <> nil) and (FChildren.Count > 0) and (TvxObject(FChildren[0]).isVisual) then
    with TvxVisualObject(FChildren[0]) do
    begin
      if (RotateAngle = 90) or (RotateAngle = -90) or (RotateAngle = -270) or (RotateAngle = 270) then
        SetBounds(round((FLayerWidth - FLayerHeight) / 2), -round((FLayerWidth - FLayerHeight) / 2),
          round(FLayerHeight / Scale.Y), round(FLayerWidth / Scale.X))
      else
        SetBounds(0, 0, Round(FLayerWidth / Scale.X), Round(FLayerHeight / Scale.Y));
    end;
end;

procedure TdxCustomObjectLayer.Notification(AComponent: TComponent;
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
  if (Operation = opRemove) and (AComponent = FDesignPlaceObject) then
    FDesignPlaceObject := nil;
  if (Operation = opRemove) and (AComponent = FStyle) then
    Style := nil;
end;

procedure TdxCustomObjectLayer.SetFill(const Value: TvxBrush);
begin
  FFill.Assign(Value);
end;

procedure TdxCustomObjectLayer.FillChanged(Sender: TObject);
begin
  SetLength(FUpdateRects, 0);
  AddUpdateRect(vgRect(0, 0, FLayerWidth, FLayerHeight));
end;

procedure TdxCustomObjectLayer.SetSnapGridShow(const Value: boolean);
begin
  if FSnapGridShow <> Value then
  begin
    FSnapGridShow := Value;
    SetLength(FUpdateRects, 0);
    AddUpdateRect(vgRect(0, 0, FLayerWidth, FLayerHeight));
  end;
end;

procedure TdxCustomObjectLayer.SetSnapGridSize(const Value: single);
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

procedure TdxCustomObjectLayer.InsertObject(const ClassName: string);
var
  P: TPoint;
  Obj: TvxObject;
  OldSel: TvxVisualObject;
  InsertPos: TvxPoint;
begin
  if GetClass(ClassName) <> nil then
  begin
    if GetClass(ClassName).InheritsFrom(TvxObject) then
    begin
      if FSelected <> nil then
      begin
        try
          Obj := TvxObjectClass(GetClass(ClassName)).Create(Owner);
          OldSel := FSelected;
          FSelected.AddObject(Obj);
          if vgDesigner <> nil then
            Obj.Name := vgDesigner.UniqueName(Owner, Obj.ClassName);
          if vgDesigner <> nil then
          begin
            vgDesigner.SelectObject(Owner, Obj, []);
            if Assigned(FDesignChangeSelection) then
              FDesignChangeSelection(Self);
            vgDesigner.Modified(Owner);
          end;
          if Obj.IsVisual then
          begin
            if GetPropInfo(Obj.ClassInfo, 'Text', [tkString, tkLString, tkWString]) <> nil then
              SetStrProp(Obj, 'Text', Copy(Obj.ClassName, 4, Length(Obj.ClassName)));
            if (Owner is TWinControl) and (FPopupPos.X > 0) then
            begin
              if Pos('Item', Obj.ClassName) = 0 then
              begin
                P := Scene.ScreenToClient(Point(trunc(FPopupPos.X), trunc(FPopupPos.Y)));
                InsertPos := OldSel.AbsoluteToLocal(vgPoint(P.X, P.Y));
                if vgPtInRect(vgPoint(P.X, P.Y), vgRect(0, 0, Width, Height)) then
                begin
                  TvxVisualObject(Obj).Position.X := InsertPos.X;
                  TvxVisualObject(Obj).Position.Y := InsertPos.Y;
                end;
              end;
            end;
            FPopupPos := vgPoint(-1, -1);
            FSelected := TvxVisualObject(Obj);
            TvxHackVisualObject(FSelected).DesignSelect;
            TvxHackVisualObject(FSelected).DesignInsert;
          end;
        finally
        end;
      end
      else
        if (FChildren = nil) or (FChildren.Count = 0) then
        begin
          { insert root object }
          try
            Obj := TvxObjectClass(GetClass(ClassName)).Create(Owner);
            if vgDesigner <> nil then
              Obj.Name := vgDesigner.UniqueName(Owner, Obj.ClassName);
            AddObject(Obj);
            if vgDesigner <> nil then
            begin
              vgDesigner.SelectObject(Owner, Obj, []);
              if Assigned(FDesignChangeSelection) then
                FDesignChangeSelection(Self);
              vgDesigner.Modified(Owner);
            end;
            if Obj.IsVisual then
            begin
              InsertPos := FPopupPos;
              FPopupPos := vgPoint(-1, -1);
              FSelected := TvxVisualObject(Obj);
              TvxHackVisualObject(FSelected).DesignSelect;
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

procedure TdxCustomObjectLayer.doDesignPopupDesignHide(Sender: TObject);
begin
  if (FSelected <> nil) and (FSelected <> Root) then
  begin
    FSelected.DesignHide := not FSelected.DesignHide;
    if FSelected.DesignHide and (FSelected.Parent.IsVisual) then
    begin
      FSelected := TvxVisualObject(FSelected.Parent);
    end;
    AddUpdateRect(vgRect(0, 0, FLayerWidth, FLayerHeight));
  end;
end;

procedure TdxCustomObjectLayer.doDesignPopupDel(Sender: TObject);
var
  Obj: TvxVisualObject;
begin
  if (FSelected <> nil) and (FSelected <> Root) then
  begin
    Obj := FSelected;
    if (Obj.Parent <> nil) and (Obj.Parent.IsVisual) then
    begin
      FSelected := TvxVisualObject(Obj.Parent);
      TvxHackvisualObject(FSelected).DesignSelect;
    end
    else
    begin
      FSelected := TvxVisualObject(Root);
      if FSelected <> nil then
        TvxHackvisualObject(FSelected).DesignSelect;
    end;
    Obj.Free;
  end;
end;

procedure TdxCustomObjectLayer.doDesignPopupAddItem(Sender: TObject);
begin
  if FSelected <> nil then
  begin
    InsertObject(TMenuItem(Sender).Hint);
  end;
end;

{$IFDEF FPC}
function StripHotkey(S: string): string;
begin
  Result := S;
end;
{$ENDIF}

procedure TdxCustomObjectLayer.doDesignPopupAdd(Sender: TObject);
var
  S: string;
begin
  S := StripHotkey(TMenuItem(Sender).Caption);
  if (S <> '') then
    S := 'Tvx' + S;
  InsertObject(S);
end;

procedure TdxCustomObjectLayer.doDesignPopupReorder(Sender: TObject);
begin
  if FSelected = nil then Exit;

  if StripHotkey(TMenuItem(Sender).Caption) = 'Bring to front' then
    FSelected.BringToFront;
  if StripHotkey(TMenuItem(Sender).Caption) = 'Send to back' then
    FSelected.SendToBack;
end;

procedure TdxCustomObjectLayer.doDesignPopupGrid(Sender: TObject);
begin
  case TMenuItem(Sender).Tag of
    1: FSnapGridShow := TMenuItem(Sender).Checked;
    2:
      begin
        FSnapToGrid := TMenuItem(Sender).Checked;
        FSnapToLines := not FSnapToGrid;
      end;
    3:
      begin
        FSnapToLines := TMenuItem(Sender).Checked;
        FSnapToGrid := not FSnapToLines;
      end;
    4:
      begin
        FSnapToLines := false;
        FSnapToGrid := false;
      end;
  end;
  SetLength(FUpdateRects, 0);
  AddUpdateRect(vgRect(0, 0, FLayerWidth, FLayerHeight));
end;

var
  Clipboard: AnsiString;
  
procedure TdxCustomObjectLayer.doDesignPopupCopy(Sender: TObject);
var
  S: TStringStream;
begin
  if FSelected <> nil then
  begin
    S := TStringStream.Create('');
    FSelected.SaveToStream(S);
    Clipboard := S.DataString;
    S.Free;
  end;
end;

procedure TdxCustomObjectLayer.doDesignPopupPaste(Sender: TObject);
var
  S: TStringStream;
  Result: TvxObject;
begin
  if Clipboard <> '' then
  begin
    S := TStringStream.Create(Clipboard);
    Result := CreateObjectFromStream(Owner, S);
    if FSelected <> nil then
      Result.Parent := FSelected
    else
      Result.Parent := Root;
    if vgDesigner <> nil then
      Result.Name := vgDesigner.UniqueName(Owner, Result.ClassName);
    S.Free;
  end;
end;

procedure TdxCustomObjectLayer.doDesignPopupLoadFromFile(Sender: TObject);
var
  S: TStream;
  Result: TvxObject;
  Open: TOpenDialog;
begin
  Open := TOpenDialog.Create(nil);
  Open.Filter := 'VGScene Files|*.vgscene';
  if Open.Execute then
  begin
    S := TFileStream.Create(Open.FileName, fmOpenRead);
{    Result := CreateObjectFromStream(Owner, S);
    if FSelected <> nil then
      Result.Parent := FSelected
    else
      Result.Parent := Root;
    if vgDesigner <> nil then
      Result.Name := vgDesigner.UniqueName(Owner, Result.ClassName);}
    S.Free;
  end;
  Open.Free;
end;

procedure TdxCustomObjectLayer.doDesignPopupCreateStyle(Sender: TObject);
var
  R: TvxResources;
  CurrentRes, Link: TvxVisualObject;
  LinkedList: TList;
  i: integer;
begin
  { Edit Style }
  if FSelected = nil then Exit;
  if not Assigned(FSelected.Scene) then Exit;

  if (FSelected.Scene.GetStyle = nil) then
  begin
    // Create style
    R := TvxResources.Create(FSelected.Scene.GetOwner);
    R.Root := TvxBackground.Create(nil);
    if vgDesigner <> nil then
      R.Name := vgDesigner.UniqueName(Owner, R.ClassName);
    FSelected.Scene.SetStyle(R);
  end
  else
    R := FSelected.Scene.GetStyle;

  if (TvxControl(FSelected).Resource = '') and (vgDesigner <> nil) then
  begin
    TvxControl(FSelected).Resource := vgDesigner.UniqueName(Owner, FSelected.Name + 'Style');
  end;
  if (R.Root.FindResource(TvxControl(FSelected).Resource) = nil) then
  begin
    // Clone Resource from Current
    CurrentRes := TvxHackControl(FSelected).GetResourceObject;
    CurrentRes.Align := vaNone;
    CurrentRes.Parent := R.Root;
    if vgDesigner <> nil then
    begin
      CurrentRes.ResourceName := vgDesigner.UniqueName(Owner, FSelected.Name + 'Style');
      TvxControl(FSelected).Resource := CurrentRes.ResourceName;
    end
    else
    begin
      CurrentRes.ResourceName := FSelected.Name;
      TvxControl(FSelected).Resource := CurrentRes.ResourceName;
    end;

    // Add linked object to resource - like ListBox with ScrollBar
    LinkedList := TList.Create;
    TvxControl(CurrentRes).AddControlsToList(LinkedList);
    for i := 0 to LinkedList.Count - 1 do
    begin
      if R.Root.FindResource(TvxControl(LinkedList[i]).Resource) = nil then
      begin
        Link := TvxHackControl(LinkedList[i]).GetResourceObject;
        Link.Align := vaNone;
        Link.Parent := R.Root;
        if vgDesigner <> nil then
        begin
          Link.ResourceName := vgDesigner.UniqueName(Owner, FSelected.Name + TvxControl(LinkedList[i]).ResourceName);
          TvxControl(LinkedList[i]).Resource := Link.ResourceName;
        end;
      end;
    end;
    LinkedList.Free;
  end;

  if vgDesigner <> nil then
  begin
    // Edit Style
    vgDesigner.EditStyle(R, TvxControl(FSelected).Resource);
  end;
end;

procedure TdxCustomObjectLayer.doDesignPopupEditStyle(Sender: TObject);
var
  R: TvxResources;
  CurrentRes, Link: TvxVisualObject;
  LinkedList: TList;
  i: integer;
  StyleName: string;
begin
  { Edit Style }
  if FSelected = nil then Exit;
  if not Assigned(FSelected.Scene) then Exit;

  if (FSelected.Scene.GetStyle = nil) then
  begin
    // Create style
    R := TvxResources.Create(FSelected.Scene.GetOwner);
    R.Root := TvxBackground.Create(nil);
    if vgDesigner <> nil then
      R.Name := vgDesigner.UniqueName(Owner, R.ClassName);
    FSelected.Scene.SetStyle(R);
  end
  else
    R := FSelected.Scene.GetStyle;

  // Clone Resource from Current
  StyleName := TvxControl(FSelected).Resource;
  if StyleName = '' then
  begin
    StyleName := FSelected.ClassName + 'Style';
    Delete(StyleName, 1, 3);
  end;
  if (R.Root.FindResource(StyleName) = nil) then
  begin
    CurrentRes := TvxHackControl(FSelected).GetResourceObject;
    CurrentRes.Align := vaNone;
    CurrentRes.Parent := R.Root;

    // Add linked object to resource - like ListBox with ScrollBar
    LinkedList := TList.Create;
    TvxControl(CurrentRes).AddControlsToList(LinkedList);
    for i := 0 to LinkedList.Count - 1 do
    begin
      StyleName := TvxControl(LinkedList[i]).Resource;
      if StyleName = '' then
      begin
        StyleName := TvxControl(LinkedList[i]).ClassName + 'Style';
        Delete(StyleName, 1, 3);
      end;
      if R.Root.FindResource(StyleName) = nil then
      begin
        Link := TvxHackControl(LinkedList[i]).GetResourceObject;
        Link.Align := vaNone;
        Link.ResourceName := StyleName;
        Link.Parent := R.Root;
      end;
    end;
    LinkedList.Free;
  end;

  if vgDesigner <> nil then
  begin
    // Edit Style
    StyleName := TvxControl(FSelected).Resource;
    if StyleName = '' then
    begin
      StyleName := FSelected.ClassName + 'Style';
      Delete(StyleName, 1, 3);
    end;
    vgDesigner.EditStyle(R, StyleName);
  end;
end;

procedure TdxCustomObjectLayer.doDesignTabOrderBtnClick(Sender: TObject);
var
  Obj: TvxVisualObject;
begin
  if TvxButton(Sender).Text = 'Up' then
  begin
    Obj := TvxVisualObject(TvxListbox(TvxButton(Sender).TagObject).Selected.TagObject);
    Obj.TabOrder := Obj.TabOrder - 1;
  end;
  if TvxButton(Sender).Text = 'Down' then
  begin
    Obj := TvxVisualObject(TvxListbox(TvxButton(Sender).TagObject).Selected.TagObject);
    Obj.TabOrder := Obj.TabOrder + 1;
  end;
  doDesignTabOrderRebuildList(TvxListbox(TvxButton(Sender).TagObject));
end;

procedure TdxCustomObjectLayer.doDesignTabOrderRebuildList(ListBox: TvxVisualObject);
var
  Item: TvxListboxItem;
  List: TvxListBox;
  Idx, i: integer;
  L: TList;
begin
  if FSelected = nil then Exit;
  if FSelected.Parent = nil then Exit;
  if not FSelected.Parent.IsVisual then Exit;
  List := TvxListBox(Listbox);
  if List.Selected <> nil then
    Idx := TvxVisualObject(List.Selected.TagObject).TabOrder
  else
    Idx := 0;
  { add taborder list }
  List.BeginUpdate;
  List.Clear;
  L := TList.Create;
  TvxVisualObject(FSelected.Parent).GetTabOrderList(L, false);
  for i := 0 to L.Count - 1 do
  begin
    Item := TvxListboxItem.Create(List.Owner);
    Item.Parent := List;
    Item.Text := TvxVisualObject(L[i]).Name;
    if Item.Text = '' then
      Item.Text := TvxVisualObject(L[i]).ClassName;
    Item.TagObject := TvxVisualObject(L[i]);
  end;
  L.Free;
  List.EndUpdate;
  List.ItemIndex := Idx;
end;

procedure TdxCustomObjectLayer.doDesignPopupTabOrder(Sender: TObject);
var
  Form: TForm;
  Scene: TDicomScene;
  Wnd: TvxHudWindow;
  List: TvxListbox;
  BtnUp, BtnDown: TvxButton;
begin
  if FSelected = nil then Exit;
  if FSelected.Parent = nil then Exit;
  if not FSelected.Parent.IsVisual then Exit;

  Form := TForm.CreateNew(Application, 0);
  Form.BorderStyle := bsNone;
  Form.Position := poScreenCenter;
  Form.SetBounds(0, 0, 300, 400);
  Scene := TDicomScene.Create(Form);
  Scene.Parent := Form;
  Scene.Align := alClient;
  Scene.Transparency := true;
  Wnd := TvxHudWindow.Create(Form);
  Wnd.ShowSizeGrip := false;
  Wnd.Text := 'TabOrder Editor';
  Scene.AddObject(Wnd);

  BtnUp := TvxHudButton.Create(Form);
  BtnUp.Parent := Wnd;
  BtnUp.SetBounds(Form.Width - 70, 50, 50, 26);
  BtnUp.Text := 'Up';
  BtnUp.OnClick := doDesignTabOrderBtnClick;
  BtnDown := TvxHudButton.Create(Form);
  BtnDown.Parent := Wnd;
  BtnDown.SetBounds(Form.Width - 70, 90, 50, 26);
  BtnDown.Text := 'Down';
  BtnDown.OnClick := doDesignTabOrderBtnClick;

  List := TvxHudListbox.Create(Form);
  List.Parent := Wnd;
  List.Align := vaClient;
  List.Padding.Rect := vgRect(26, 45, 86, 33);
  List.HideSelectionUnfocused := false;
  List.ItemHeight := 20;

  Form.SetBounds(0, 0, 300, 400);
  BtnUp.TagObject := List;
  BtnDown.TagObject := List;
  doDesignTabOrderRebuildList(List);
  List.ItemIndex := FSelected.TabOrder;
  Form.ShowModal;
  Form.Free;
end;

procedure TdxCustomObjectLayer.OpenDesignPopup;
var
  i, j: integer;
  S, T: AnsiString;
  OItem, SItem, Item: TMenuItem;
  CatList: TStringList;
  P: TPoint;
begin
  if not DesignPopupEnabled then Exit;
  if FDesignPopup <> nil then
  begin
    FDesignPopup.Free;
    FDesignPopup := nil;
  end;
  if FDesignPopup = nil then
  begin
    FDesignPopup := TPopupMenu.Create(nil);
    {$IFNDEF FPC}
//    FDesignPopup.OwnerDraw := true;
    {$ENDIF}
    if ObjectList <> nil then
    begin
      { item }
      if (FSelected <> nil) and (FSelected.ItemClass <> '') then
      begin
        S := FSelected.ItemClass;
        T := vgGetToken(S, ';');
        while T <> '' do
        begin
          if Pos('Tvx', T) = 1 then
            Delete(T, 1, 3);
          Item := NewItem('Add ' + T, 0, false, true, doDesignPopupAddItem, 0, '');
          Item.Hint := 'Tvx' + T;
          FDesignPopup.Items.Add(Item);
          T := vgGetToken(S, ';');
        end;
      end;
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
      { add controls to list and sort }
      CatList := TStringList.Create;
      CatList.Sorted := true;
      for i := 0 to dcm_vgcore.ObjectList.Count - 1 do
      begin
        S := TvxObjectClass(dcm_vgcore.ObjectList.Objects[i]).ClassName;
        if Pos('Tvx', S) = 1 then
          Delete(S, 1, 3);
        CatList.Add(S);
      end;
      { add objects }
      for i := 0 to CatList.Count - 1 do
      begin
        OItem := NewItem(CatList[i], 0, false, true, doDesignPopupAdd, 0, '');
        OItem.Tag := $FF;
        for j := 0 to dcm_vgcore.ObjectList.Count - 1 do
        begin
          S := TvxObjectClass(dcm_vgcore.ObjectList.Objects[j]).ClassName;
          if Pos('Tvx', S) = 1 then
            Delete(S, 1, 3);
          if S = CatList[i] then
          begin
            SItem := Item.Find(ObjectList[j]);
            Break;
          end;
        end;
        if SItem <> nil then
          SItem.Add(OItem);
      end;
      CatList.Free;
      FDesignPopup.Items.Add(Item);
      { Delete }
      Item := NewItem('Delete object', 0, false, true, doDesignPopupDel, 0, '');
      FDesignPopup.Items.Add(Item);
      { Delete }
      Item := NewItem('Load From File...', 0, false, true, doDesignPopupLoadFromFile, 0, '');
      FDesignPopup.Items.Add(Item);
      { Design Hide }
      if FSelected <> nil then
      begin
        Item := NewItem('Hide in Design-time', 0, FSelected.DesignHide, true, doDesignPopupDesignHide, 0, '');
        Item.AutoCheck := true;
        FDesignPopup.Items.Add(Item);

        { Edit Style }
        if (FSelected is TvxControl) then
        begin
          Item := NewItem('Edit Default Style...', 0, false, true, doDesignPopupEditStyle, 0, '');
          FDesignPopup.Items.Add(Item);
          Item := NewItem('Edit Custom Style...', 0, false, true, doDesignPopupCreateStyle, 0, '');
          FDesignPopup.Items.Add(Item);
        end;
        { TabOrder }
        if (FSelected.IsVisual) and (FSelected.CanFocused) then
        begin
          Item := NewItem('Tab Order...', 0, false, true, doDesignPopupTabOrder, 0, '');
          FDesignPopup.Items.Add(Item);
        end;
      end;
      { Reorder }
      Item := NewItem('Order', 0, false, true, nil, 0, '');
      SItem := NewItem('Bring to front', 0, false, true, doDesignPopupReorder, 0, '');
      Item.Add(SItem);
      SItem := NewItem('Send to back', 0, false, true, doDesignPopupReorder, 0, '');
      Item.Add(SItem);
      FDesignPopup.Items.Add(Item);
      { Edit }
      Item := NewItem('Edit', 0, false, true, nil, 0, '');
      SItem := NewItem('Copy to clipboard', 0, false, true, doDesignPopupCopy, 0, '');
      Item.Add(SItem);
      SItem := NewItem('Paste from clipboard', 0, false, true, doDesignPopupPaste, 0, '');
      Item.Add(SItem);
      FDesignPopup.Items.Add(Item);
      { Grid }
      Item := NewItem('Grid', 0, false, true, nil, 0, '');
      SItem := NewItem('Show snap grid', 0, FSnapGridShow, true, doDesignPopupGrid, 0, '');
      SItem.Tag := 1;
      {$IFDEF KS_DELPHI6_UP}
      SItem.AutoCheck := true;
      {$ENDIF}
      Item.Add(SItem);
      SItem := NewItem('Snap to grid', 0, FSnapToGrid, true, doDesignPopupGrid, 0, '');
      SItem.Tag := 2;
      SItem.RadioItem := true;
      {$IFDEF KS_DELPHI6_UP}
      SItem.AutoCheck := true;
      {$ENDIF}
      Item.Add(SItem);
      SItem := NewItem('Snap to lines', 0, FSnapToLines, true, doDesignPopupGrid, 0, '');
      SItem.Tag := 3;
      SItem.RadioItem := true;
      {$IFDEF KS_DELPHI6_UP}
      SItem.AutoCheck := true;
      {$ENDIF}
      Item.Add(SItem);
      SItem := NewItem('Snap disabled', 0, not FSnapToLines or not FSnapToLines, true, doDesignPopupGrid, 0, '');
      SItem.Tag := 4;
      SItem.RadioItem := true;
      {$IFDEF KS_DELPHI6_UP}
      SItem.AutoCheck := true;
      {$ENDIF}
      Item.Add(SItem);
      FDesignPopup.Items.Add(Item);
    end;
  end;
  GetCursorPos(P);
  FDesignPopup.Popup(P.X, P.Y);
end;

procedure TdxCustomObjectLayer.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('DesignSnapGridShow', ReadDesignSnapGridShow, WriteDesignSnapGridShow, true);
  Filer.DefineProperty('DesignSnapToGrid', ReadDesignSnapToGrid, WriteDesignSnapToGrid, true);
  Filer.DefineProperty('DesignSnapToLines', ReadDesignSnapToLines, WriteDesignSnapToLines, true);
end;

procedure TdxCustomObjectLayer.ReadDesignSnapGridShow(Reader: TReader);
begin
  FSnapGridShow := Reader.ReadBoolean;
  if not (FDesignTime) then
    FSnapGridShow := false;
end;

procedure TdxCustomObjectLayer.ReadDesignSnapToGrid(Reader: TReader);
begin
  FSnapToGrid := Reader.ReadBoolean;
end;

procedure TdxCustomObjectLayer.ReadDesignSnapToLines(Reader: TReader);
begin
  FSnapToLines := Reader.ReadBoolean;
end;

procedure TdxCustomObjectLayer.WriteDesignSnapGridShow(Writer: TWriter);
begin
  Writer.WriteBoolean(FSnapGridShow);
end;

procedure TdxCustomObjectLayer.WriteDesignSnapToGrid(Writer: TWriter);
begin
  Writer.WriteBoolean(FSnapToGrid);
end;

procedure TdxCustomObjectLayer.WriteDesignSnapToLines(Writer: TWriter);
begin
  Writer.WriteBoolean(FSnapToLines);
end;

function TdxCustomObjectLayer.GetRoot: TvxObject;
begin
  if (FChildren <> nil) and (FChildren.Count > 0) then
    Result := TvxObject(FChildren[0])
  else
    Result := nil;
end;

procedure TdxCustomObjectLayer.SetFocused(const Value: TvxVisualObject);
begin
  if FFocused <> Value then
  begin
    if FFocused <> nil then
    begin
      TvxHackvisualObject(FFocused).KillFocus;
      TvxVisualObject(FFocused).RemoveFreeNotify(Self);
    end;
    FFocused := Value;
    if FFocused <> nil then
    begin
      TvxHackvisualObject(FFocused).EnterFocus;
      TvxVisualObject(FFocused).AddFreeNotify(Self);
      SetFocus;
    end;
  end;
end;

procedure TdxCustomObjectLayer.DoDesignSelect(AObject: TObject);
begin
  if (AObject <> nil) and (AObject is TvxVisualObject) and (TvxVisualObject(AObject).Scene <> nil) and (TvxVisualObject(AObject).Scene.GetComponent = Self) then
  begin
    FSelected := TvxVisualObject(AObject);
    TvxHackvisualObject(FSelected).DesignSelect;
    FSelected.Repaint;
  end;
end;

procedure TdxCustomObjectLayer.ProcessTick;
begin
end;

procedure TdxCustomObjectLayer.SetSelected(const Value: TvxVisualObject);
begin
  if FSelected <> Value then
  begin
    if FSelected <> nil then
      FSelected.Repaint;
    FSelected := Value;
    if FSelected <> nil then
      FSelected.Repaint;
    if Assigned(FDesignChangeSelection) then
      FDesignChangeSelection(Self);
    AddUpdateRect(vgRect(0, 0, 1000, 1000));
    Draw;
  end;
end;

function TdxCustomObjectLayer.GetActiveControl: TvxControl;
begin
  Result := FActiveControl;
end;

function TdxCustomObjectLayer.GetDisableUpdate: boolean;
begin
  Result := FDisableUpdate;
end;

function TdxCustomObjectLayer.GetDesignTime: boolean;
begin
  Result := FDesignTime;
end;

function TdxCustomObjectLayer.GetCanvas: TvxCanvas;
begin
  Result := FCanvas;
end;

function TdxCustomObjectLayer.GetOwner: TComponent;
begin
  Result := Owner;
end;

function TdxCustomObjectLayer.GetRealTime: boolean;
begin
  Result := Scene.RealTime;
end;

function TdxCustomObjectLayer.GetComponent: TComponent;
begin
  Result := Self;
end;

function TdxCustomObjectLayer.GetSelected: TvxVisualObject;
begin
  Result := FSelected;
end;

function TdxCustomObjectLayer.GetDeltaTime: single;
begin
  Result := Scene.DeltaTime;
end;

procedure TdxCustomObjectLayer.SetDisableUpdate(Value: boolean);
begin
  FDisableUpdate := Value;
end;

function TdxCustomObjectLayer.GetUpdateRectsCount: integer;
begin
  Result := Length(FUpdateRects);
end;

function TdxCustomObjectLayer.GetUpdateRect(const Index: integer): TvxRect;
begin
  Result := FUpdateRects[Index];
end;

function TdxCustomObjectLayer.GetCaptured: TvxVisualObject;
begin
  Result := FCaptured;
end;

procedure TdxCustomObjectLayer.SetCaptured(const Value: TvxVisualObject);
begin
  FCaptured := Value;
  if Value <> nil then
    Capture
  else
    ReleaseCapture;
end;

function TdxCustomObjectLayer.GetFocused: TvxVisualObject;
begin
  Result := FFocused;
end;

procedure TdxCustomObjectLayer.SetDesignRoot(const Value: TvxVisualObject);
begin
  FDesignRoot := Value;
end;

function TdxCustomObjectLayer.GetMousePos: TvxPoint;
begin
  Result := FMousePos;
end;

procedure TdxCustomObjectLayer.BeginDrag;
begin
  if (LayerAlign = dxLayerContents) and (Scene.AllowDrag) then
  begin
    Scene.BeginDrag;
  end;
  FDragging := true;
  FDownPos := FMousePos;
  Capture;
end;

procedure TdxCustomObjectLayer.BeginResize;
begin
  if (LayerAlign in [dxLayerContents, dxLayerBottom, dxLayerRight, dxLayerMostBottom, dxLayerMostRight]) then
  begin
    Scene.BeginResize;
  end;
  FResizing := true;
  FDownPos := FMousePos;
  FResizePos := vgPoint(Position.X, Position.Y);
  FResizeStartPos := vgPoint(Round(Position.X - Width / 2), Round(Position.Y - Height / 2));
  if Projection = dxProjectionScreen then
    FResizeSize := vgPoint(Width, Height)
  else
    FResizeSize := vgPoint(Width, Depth);
  FDownSize := FResizeSize;
  Capture;
end;

function TdxCustomObjectLayer.GetStyle: TvxResources;
begin
  Result := FStyle;
end;

function TdxCustomObjectLayer.LocalToScreen(const Point: TvxPoint): TvxPoint;
begin
  with LocalToAbsolute(dxPoint(Point.x - (Width / 2), Point.y - (Height / 2), 0)) do
    with Scene.ClientToScreen(Classes.Point(round(x), round(y))) do
      Result := vgPoint(X, Y);
end;

function TdxCustomObjectLayer.GetTransparency: boolean;
begin
  Result := FTransparency;
end;

function TdxCustomObjectLayer.GetDesignPlaceObject: TvxVisualObject;
begin
  Result := FDesignPlaceObject;
end;

procedure TdxCustomObjectLayer.UpdateResource;
begin
  if Root <> nil then
    Root.UpdateResource;
end;

procedure TdxCustomObjectLayer.SetStyle(const Value: TvxResources);
begin
  if FStyle <> Value then
  begin
    if FStyle <> nil then
      FStyle.RemoveSceneUpdater(Self);
    FStyle := Value;
    if FStyle <> nil then
      FStyle.AddSceneUpdater(Self);

    UpdateResource;
  end;
end;

procedure TdxCustomObjectLayer.BeginVCLDrag(Source: TObject; ABitmap: TvxBitmap);
begin
  if Scene <> nil then
    TdxHackScene(Scene).BeginVCLDrag(Source);
end;

procedure TdxCustomObjectLayer.DragEnter(const Data: TdxDragObject;
  const Point: TdxPoint);
begin
  inherited;
end;

procedure TdxCustomObjectLayer.DragLeave;
begin
  inherited;
end;

var
  FTarget: TvxVisualObject = nil;

procedure TdxCustomObjectLayer.DragOver(const Data: TdxDragObject;
  const Point: TdxPoint; var Accept: Boolean);
var
  P: TvxPoint;
  i: integer;
  NewTarget: TvxVisualObject;
  VGData: TvxDragObject;
  P3, rayPos, rayDir: TdxVector;
begin
  inherited;
  if Accept then Exit; // Self accept

  with LocalToAbsolute(Point) do
    inherited Canvas.Pick(X, Y, Projection, rayPos, rayDir);
  rayPos := AbsoluteToLocalVector(rayPos);
  rayDir := AbsoluteToLocalVector(rayDir);

  if Projection = dxProjectionCamera then
  begin
    if RayCastIntersect(rayPos, rayDir, P3) then
    begin
      P3 := AbsoluteToLocalVector(P3);
      P.X := (((P3.x + (Width / 2)) / Width) * FLayerWidth);
      P.Y := (((-P3.z + (Depth / 2)) / Depth) * FLayerHeight);
    end
    else
      Exit;
  end
  else
  begin
    if RayCastIntersect(rayPos, rayDir, P3) then
    begin
      P3 := AbsoluteToLocalVector(P3);
      P.X := (((P3.x + (Width / 2)) / Width) * FLayerWidth);
      P.Y := (((P3.y + (Height / 2)) / Height) * FLayerHeight);
    end
    else
      Exit;
  end;

  Fillchar(VGData, SizeOf(VGData), 0);
  SetLength(VGData.Files, Length(Data.Files));
  for i := 0 to Length(Data.Files) - 1 do
    VGData.Files[i] := Data.Files[i];
  VGData.Data := Data.Data;
  VGData.Source := Data.Source;
  NewTarget := Root.Visual.FindTarget(P, VGData);
  if (NewTarget <> FTarget) then
  begin
    if FTarget <> nil then
      TvxHackVisualObject(FTarget).DragLeave;
    FTarget := NewTarget;
    if FTarget <> nil then
    begin
      TvxHackVisualObject(FTarget).DragEnter(VGData, P);
    end;
  end;
  Accept := NewTarget <> nil;
end;

procedure TdxCustomObjectLayer.DragDrop(const Data: TdxDragObject;
  const Point: TdxPoint);
var
  P: TvxPoint;
  i: integer;
  NewTarget: TvxVisualObject;
  VGData: TvxDragObject;
  P3, rayPos, rayDir: TdxVector;
begin
  inherited;

  with LocaltoAbsolute(Point) do
    inherited Canvas.Pick(X, Y, Projection, rayPos, rayDir);
  rayPos := AbsoluteToLocalVector(rayPos);
  rayDir := AbsoluteToLocalVector(rayDir);

  if Projection = dxProjectionCamera then
  begin
    if RayCastIntersect(rayPos, rayDir, P3) then
    begin
      P3 := AbsoluteToLocalVector(P3);
      P.X := (((P3.x + (Width / 2)) / Width) * FLayerWidth);
      P.Y := (((-P3.z + (Depth / 2)) / Depth) * FLayerHeight);
    end
    else
      Exit;
  end
  else
  begin
    if RayCastIntersect(rayPos, rayDir, P3) then
    begin
      P3 := AbsoluteToLocalVector(P3);
      P.X := (((P3.x + (Width / 2)) / Width) * FLayerWidth);
      P.Y := (((P3.y + (Height / 2)) / Height) * FLayerHeight);
    end
    else
      Exit;
  end;

  Fillchar(VGData, SizeOf(VGData), 0);
  SetLength(VGData.Files, Length(Data.Files));
  for i := 0 to Length(Data.Files) - 1 do
    VGData.Files[i] := Data.Files[i];
  VGData.Data := Data.Data;
  VGData.Source := Data.Source;
  if (FTarget <> nil) then
  begin
    TvxHackVisualObject(FTarget).DragLeave;
    TvxHackVisualObject(FTarget).DragDrop(VGData, P);
  end;
  FTarget := nil;
end;

procedure TdxCustomObjectLayer.DragEnd;
begin
end;

procedure TdxCustomObjectLayer.SetVisible(const Value: boolean);
begin
  inherited SetVisible(Value);
  if Visible then
    AddUpdateRect(vgRect(0, 0, FLayerWidth, FLayerHeight));
end;

procedure TdxCustomObjectLayer.EnterFocus;
var
  List: TList;
  i, CurIdx: integer;
begin
  inherited ;
  { change focus }
  List := TList.Create;
  TvxVisualObject(Root).GetTabOrderList(List, true);
  for i := 0 to List.Count - 1 do
    if TvxObject(List[i]).isVisual and (TvxHackVisualObject(List[i]).CheckParentVisible) and (TvxVisualObject(List[i]).CanFocused) then
    begin
      TvxVisualObject(List[i]).SetFocus;
      Break;
    end;
  List.Free;
end;

procedure TdxCustomObjectLayer.KillFocus;
begin
  inherited ;
  SetFocused(nil);
end;

procedure TdxCustomObjectLayer.MouseLeave;
begin
  inherited ;
  if FHovered <> nil then
  begin
    TvxHackVisualObject(FHovered).MouseInObject := false;
    TvxHackVisualObject(FHovered).MouseLeave;
    TvxVisualObject(FHovered).RemoveFreeNotify(Self);
  end;
  FHovered := nil;
end;

procedure TdxCustomObjectLayer.SetActiveControl(AControl: TvxControl);
begin
  if AControl <> FActiveControl then
  begin
    FActiveControl := AControl;
    if (FActiveControl <> nil) and not (csLoading in ComponentState) then
      FActiveControl.SetFocus;
  end;
end;

function TdxCustomObjectLayer.GetAnimatedCaret: boolean;
begin
  Result := FAnimatedCaret;
end;

function TdxCustomObjectLayer.ShowKeyboardForControl(AObject: TvxObject): boolean;
begin
  Result := false;
end;

function TdxCustomObjectLayer.HideKeyboardForControl(AObject: TvxObject): boolean;
begin
  Result := false;
end;

{ TdxGUIObjectLayer }

constructor TdxGUIObjectLayer.Create(AOwner: TComponent);
begin
  inherited;
  Projection := dxProjectionScreen;
  Width := 256;
  Height := 256;
  ZWrite := false;
end;

initialization
  RegisterDXObjects('Shapes', [TdxObjectLayer]);
  RegisterDXObjects('GUI', [TdxGUIObjectLayer]);
  RegisterClasses([TdxVGLayer, TdxScreenVGLayer]);
finalization
end.
