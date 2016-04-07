unit dcm_ani;

{$I dcm_define.inc}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, ExtCtrls, dcm_utils, dcm_scene;

type

  TdxColorAnimation = class(TdxAnimation)
  private
    FStartColor: TdxColor;
    FStopColor: TdxColor;
    FPath, FPropertyName: AnsiString;
    FInstance: TObject;
    FStartFromCurrent: boolean;
    function GetStartColor: string;
    function GetStopColor: string;
    procedure SetStartColor(const Value: string);
    procedure SetStopColor(const Value: string);
  protected
    procedure ProcessAnimation; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Start; override;
  published
    property StartValue: string read GetStartColor write SetStartColor;
    property StartFromCurrent: boolean read FStartFromCurrent write FStartFromCurrent;
    property StopValue: string read GetStopColor write SetStopColor;
    property PropertyName: AnsiString read FPropertyName write FPropertyName;
  end;

  TdxFloatAnimation = class(TdxAnimation)
  private
    FStartFloat: single;
    FStopFloat: single;
    FPath, FPropertyName: AnsiString;
    FInstance: TObject;
    FStartFromCurrent: boolean;
  protected
    procedure ProcessAnimation; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Start; override;
  published
    property StartValue: single read FStartFloat write FStartFloat stored true;
    property StartFromCurrent: boolean read FStartFromCurrent write FStartFromCurrent;
    property StopValue: single read FStopFloat write FStopFloat stored true;
    property PropertyName: AnsiString read FPropertyName write FPropertyName;
  end;

implementation {===============================================================}

uses dcm_objects, typinfo;

{ TdxAnimation ===================================================================}

constructor TdxColorAnimation.Create(AOwner: TComponent);
begin
  inherited;
  Duration := 0.2;
  FStartColor := $FFFFFFFF;
  FStartColor := $FFFFFFFF;
end;

destructor TdxColorAnimation.Destroy;
begin
  inherited;
end;

procedure TdxColorAnimation.Start;
var
  Persistent: string;
begin
  if (Parent <> nil) and (FPropertyName <> '') then
  begin
    if FInstance = nil then
    begin
      FInstance := Parent;
      FPath := FPropertyName;
      while Pos('.', FPath) > 0 do
      begin
        Persistent := GetToken(FPath, '.');
        if GetPropInfo(FInstance.ClassInfo, Persistent, [tkClass]) <> nil then
          FInstance := GetObjectProp(FInstance, Persistent);
      end;
    end;
    if (FInstance <> nil) and StartFromCurrent then
    begin
      { is string prop }
      if GetPropInfo(FInstance.ClassInfo, FPath, [tkString, tkLString, tkWString{$IFDEF FPC},tkAString{$ENDIF}{$IFDEF KS_COMPILER11_UP}, tkUString{$ENDIF}]) <> nil then
        StartValue := GetStrProp(FInstance, FPath);
      { is int prop }
      if GetPropInfo(FInstance.ClassInfo, FPath, [tkInteger]) <> nil then
        StartValue := dxColorToStr(GetOrdProp(FInstance, FPath));
    end;
  end;
  inherited;
end;

procedure TdxColorAnimation.ProcessAnimation;
begin
  if FInstance <> nil then
  begin
    { is string prop }
    if GetPropInfo(FInstance.ClassInfo, FPath, [tkString, tkLString, tkWString{$IFDEF FPC},tkAString{$ENDIF}{$IFDEF KS_COMPILER11_UP}, tkUString{$ENDIF}]) <> nil then
      SetStrProp(FInstance, FPath, dxColorToStr(dxInterpolateColor(FStartColor, FStopColor, NormalizedTime)));
    { is int prop }
    if GetPropInfo(FInstance.ClassInfo, FPath, [tkInteger]) <> nil then
      SetOrdProp(FInstance, FPath, dxInterpolateColor(FStartColor, FStopColor, NormalizedTime));
  end;
end;

function TdxColorAnimation.GetStartColor: string;
begin
  Result := dxColorToStr(FStartColor);
end;

function TdxColorAnimation.GetStopColor: string;
begin
  Result := dxColorToStr(FStopColor);
end;

procedure TdxColorAnimation.SetStartColor(const Value: string);
begin
  FStartColor := dxStrToColor(Value);
end;

procedure TdxColorAnimation.SetStopColor(const Value: string);
begin
  FStopColor := dxStrToColor(Value);
end;

{ TdxAnimation ===================================================================}

constructor TdxFloatAnimation.Create(AOwner: TComponent);
begin
  inherited;
  Duration := 0.2;
  FStartFloat := 0;
  FStopFloat := 0;
end;

destructor TdxFloatAnimation.Destroy;
begin
  PropertyName := '';
  inherited;
end;

procedure TdxFloatAnimation.Start;
var
  Persistent: string;
begin
  if (Parent <> nil) and (FPropertyName <> '') then
  begin
    if FInstance = nil then
    begin
      FInstance := Parent;
      FPath := FPropertyName;
      while Pos('.', FPath) > 0 do
      begin
        Persistent := GetToken(FPath, '.');
        if GetPropInfo(FInstance.ClassInfo, Persistent, [tkClass]) <> nil then
          FInstance := GetObjectProp(FInstance, Persistent);
      end;
    end;
    if (FInstance <> nil) and StartFromCurrent then
    begin
      { is float prop }
      if GetPropInfo(FInstance.ClassInfo, FPath, [tkFloat]) <> nil then
      begin
        StartValue := GetFloatProp(FInstance, FPath);
      end;
    end;
  end;
  inherited;
end;

procedure TdxFloatAnimation.ProcessAnimation;
begin
  if FInstance <> nil then
  begin
    { is float prop }
    if GetPropInfo(FInstance.ClassInfo, FPath, [tkFloat]) <> nil then
    begin
      SetFloatProp(FInstance, FPath, dxInterpolateSingle(FStartFloat, FStopFloat, NormalizedTime));
    end;
  end;
end;

initialization
  RegisterDXObjects('Animations', [TdxColorAnimation, TdxFloatAnimation]);
end.

