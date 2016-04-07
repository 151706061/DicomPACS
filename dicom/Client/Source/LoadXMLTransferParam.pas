unit LoadXMLTransferParam;

interface

{$R v3dtransfer.RES}

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, xmldom, XMLIntf, msxmldom, XMLDoc,
  V3DRenWindow;

type
  TALXMLDocument = TXMLDocument;
  TALXMLNode = IXMLNode;

  //----------------------------------------------------------
  TTransferFunctionsSetting = class(TComponent)
  private
    fXMLDocument: TALXMLDocument;
    FModality: string;
    FComment: string;
    FBlendMode: string;
    procedure SetXMLDocument(const Value: TALXMLDocument);
    procedure SetComment(const Value: string);
    procedure SetModality(const Value: string);
    procedure SetBlendMode(const Value: string);
  protected
    function GetComponent(AIndex: integer): TALXMLNode;
    function GetColorTransferFunction(AIndex: integer): TALXMLNode;
    function GetScalarOpacityPiecewiseFunction(AIndex: integer): TALXMLNode;
    function GetGradientOpacityPiecewiseFunction(AIndex: integer): TALXMLNode;
  public
    constructor Create(AOwner: TComponent; AFileName: string); overload;
    constructor Create(AOwner: TComponent; AResName, AResType: string); overload;
    destructor Destroy; override;

    property XMLDocument: TALXMLDocument read FXMLDocument write SetXMLDocument;
    property Modality: string read FModality write SetModality;
    property Comment: string read FComment write SetComment;
    property BlendMode: string read FBlendMode write SetBlendMode;

    property Components[index: Integer]: TALXMLNode read GetComponent;
    property ColorTransferFunctions[index: Integer]: TALXMLNode read GetColorTransferFunction;
    property ScalarOpacitys[index: Integer]: TALXMLNode read GetScalarOpacityPiecewiseFunction;
    property GradientOpacitys[index: Integer]: TALXMLNode read GetGradientOpacityPiecewiseFunction;
  published

  end;

  TTransferFunctionsSettings = class(TComponent)
  private
    fList: TList;
    function GetItems(index: Integer): TTransferFunctionsSetting;
    function GetCount: Integer;
  protected
    function AddItem(AFileName: string): TTransferFunctionsSetting;
  public
    constructor Create(AOwner: TComponent; APath, AExt: string); overload;
    destructor Destroy; override;
    procedure Clear;
    function FindItem(AComment: string): TTransferFunctionsSetting;

    property Count: Integer read GetCount;
    property Items[index: Integer]: TTransferFunctionsSetting read GetItems;
  published

  end;

procedure LoadSetting(view: TCns3DRenderWindow;
  ASetting: TTransferFunctionsSetting; AIndex: Integer);
implementation

{ TTransferFunctionsSetting }

constructor TTransferFunctionsSetting.Create(AOwner: TComponent; AFileName: string);
var
  aTransferFunctions: TALXMLNode;
begin
  inherited Create(AOwner);
  fXMLDocument := TALXMLDocument.Create(Owner);
  fXMLDocument.LoadFromFile(AFileName);
  aTransferFunctions := fXMLDocument.DocumentElement;

  if aTransferFunctions.NodeName <> 'TransferFunctions' then
    raise Exception.Create('This is not a TransferFunctions setting file');

  fModality := aTransferFunctions.Attributes['Modality'];
  fComment := aTransferFunctions.Attributes['Comment'];
  FBlendMode := aTransferFunctions.Attributes['BlendMode'];
end;

constructor TTransferFunctionsSetting.Create(AOwner: TComponent; AResName,
  AResType: string);
var
  aTransferFunctions: TALXMLNode;
  stm1: TResourceStream;
begin
  inherited Create(AOwner);
  fXMLDocument := TALXMLDocument.Create(Owner);

  stm1 := TResourceStream.Create(Hinstance, pchar(AResName), RT_RCDATA);

  fXMLDocument.LoadFromStream(stm1);
  //fXMLDocument.LoadFromFile(AFileName);

  aTransferFunctions := fXMLDocument.DocumentElement;

  if aTransferFunctions.NodeName <> 'TransferFunctions' then
    raise Exception.Create('This is not a TransferFunctions setting file');

  fModality := aTransferFunctions.Attributes['Modality'];
  fComment := aTransferFunctions.Attributes['Comment'];
  FBlendMode := aTransferFunctions.Attributes['BlendMode'];
end;

destructor TTransferFunctionsSetting.Destroy;
begin
  fXMLDocument.Free;
  inherited;
end;

function TTransferFunctionsSetting.GetColorTransferFunction(
  AIndex: integer): TALXMLNode;
var
  aTransferFunctions, aVolumeProperty, aComponent, aRGBTransferFunction: TALXMLNode;
begin
  aTransferFunctions := fXMLDocument.DocumentElement;

  aVolumeProperty := aTransferFunctions.ChildNodes['VolumeProperty'];

  aComponent := aVolumeProperty.ChildNodes.Nodes[AIndex];

  aRGBTransferFunction := aComponent.ChildNodes['RGBTransferFunction'];

  Result := aRGBTransferFunction.ChildNodes['ColorTransferFunction'];
end;

function TTransferFunctionsSetting.GetComponent(AIndex: integer): TALXMLNode;
var
  aTransferFunctions, aVolumeProperty: TALXMLNode;
begin
  aTransferFunctions := fXMLDocument.DocumentElement;

  aVolumeProperty := aTransferFunctions.ChildNodes['VolumeProperty'];

  Result := aVolumeProperty.ChildNodes.Nodes[AIndex];
end;

function TTransferFunctionsSetting.GetGradientOpacityPiecewiseFunction(
  AIndex: integer): TALXMLNode;
var
  aTransferFunctions, aVolumeProperty, aComponent, aGradientOpacity: TALXMLNode;
begin
  aTransferFunctions := fXMLDocument.DocumentElement;

  aVolumeProperty := aTransferFunctions.ChildNodes['VolumeProperty'];

  aComponent := aVolumeProperty.ChildNodes.Nodes[AIndex];

  aGradientOpacity := aComponent.ChildNodes['GradientOpacity'];

  Result := aGradientOpacity.ChildNodes['PiecewiseFunction'];
end;

function TTransferFunctionsSetting.GetScalarOpacityPiecewiseFunction(
  AIndex: integer): TALXMLNode;
var
  aTransferFunctions, aVolumeProperty, aComponent, aScalarOpacity: TALXMLNode;
begin
  aTransferFunctions := fXMLDocument.DocumentElement;

  aVolumeProperty := aTransferFunctions.ChildNodes['VolumeProperty'];

  aComponent := aVolumeProperty.ChildNodes.Nodes[AIndex];

  aScalarOpacity := aComponent.ChildNodes['ScalarOpacity'];

  Result := aScalarOpacity.ChildNodes['PiecewiseFunction'];
end;

procedure TTransferFunctionsSetting.SetBlendMode(const Value: string);
begin
  FBlendMode := Value;
  fXMLDocument.DocumentElement.Attributes['BlendMode'] := Value;
end;

procedure TTransferFunctionsSetting.SetComment(const Value: string);
begin
  FComment := Value;
  fXMLDocument.DocumentElement.Attributes['Comment'] := Value;
end;

procedure TTransferFunctionsSetting.SetModality(const Value: string);
begin
  fModality := Value;
  fXMLDocument.DocumentElement.Attributes['Modality'] := Value;
end;

procedure TTransferFunctionsSetting.SetXMLDocument(
  const Value: TALXMLDocument);
begin
  FXMLDocument := Value;
end;

{ TTransferFunctionsSettings }

function TTransferFunctionsSettings.AddItem(AFileName: string): TTransferFunctionsSetting;
begin
  Result := TTransferFunctionsSetting.Create(Owner, AFileName);
  fList.Add(Result);
end;

procedure TTransferFunctionsSettings.Clear;
var
  i: Integer;
begin
  for i := 0 to fList.Count - 1 do
  begin
    TTransferFunctionsSetting(fList[i]).Free;
  end;
  fList.Clear;
end;

constructor TTransferFunctionsSettings.Create(AOwner: TComponent; APath, AExt: string);
var
  i: integer;
  n1: TTransferFunctionsSetting;
  sr3: TSearchRec;
  str1, str2: string;
begin
  inherited Create(AOwner);
  fList := TList.Create;

  for i := 1 to 26 do
  begin
    n1 := TTransferFunctionsSetting.Create(self, 'V3D_XML' + IntToStr(i), '');
    fList.Add(n1);
  end;

  str1 := APath;
  if str1[length(str1)] <> '\' then
    str1 := str1 + '\';
  if FindFirst(str1 + AExt, faAnyFile, sr3) = 0 then
  begin
    repeat
      str2 := str1 + sr3.Name;
      AddItem(str2);
    until FindNext(sr3) <> 0;
    FindClose(sr3);
  end;
end;


destructor TTransferFunctionsSettings.Destroy;
begin
  Clear;
  fList.Free;
  inherited;
end;

function TTransferFunctionsSettings.FindItem(
  AComment: string): TTransferFunctionsSetting;
var
  i: integer;
  v1: TTransferFunctionsSetting;
begin
  Result := nil;
  for i := 0 to fList.Count - 1 do
  begin
    v1 := TTransferFunctionsSetting(fList[i]);
    if v1.Comment = AComment then
    begin
      Result := v1;
      exit;
    end;
  end;
end;

function TTransferFunctionsSettings.GetCount: Integer;
begin
  Result := fList.Count;
end;

function TTransferFunctionsSettings.GetItems(
  index: Integer): TTransferFunctionsSetting;
begin
  if (index >= 0) and (fList.Count > 0) and (index < fList.Count) then
    Result := TTransferFunctionsSetting(fList[index])
  else
    Result := nil;
end;

procedure LoadSetting(view: TCns3DRenderWindow;
  ASetting: TTransferFunctionsSetting; AIndex: Integer);
var
  v1, v2: TALXMLNode;
  str1, str2, str3, str4: string;
  f1, f2, f3, f4, r, g, b : Double;
  i, k: integer;
  n1: TFormatSettings;
begin
  n1.DecimalSeparator := '.';

  v1 := ASetting.Components[AIndex];
  //Shade
  view.ActivateShading(v1.Attributes['Shade'] = '1');

  //Ambient Diffuse Specular SpecularPower
  //  SetShadingValues

  //DisableGradientOpacity
  view.ActivateGradientOpacity(v1.Attributes['DisableGradientOpacity'] = '0');

  //ComponentWeight
  //ColorChannels
  //ScalarOpacityUnitDistance

  v1 := ASetting.ColorTransferFunctions[aindex];
  view.ClearColorTransferFunction;
  for i := 0 to v1.ChildNodes.Count - 1 do
  begin
    v2 := v1.ChildNodes.Nodes[i];
    //Point  X Value MidPoint Sharpness  ===>Value=r g b
    f1 := StrToFloat(v2.Attributes['X'], n1);
    str1 := v2.Attributes['Value'];
    k := Pos(' ', str1);
    str2 := Copy(str1, 1, k - 1);

    str1 := Copy(str1, k + 1, Length(str1) - k + 1);
    k := Pos(' ', str1);
    str3 := Copy(str1, 1, k - 1);

    str4 := Copy(str1, k + 1, Length(str1) - k + 1);
    r := StrToFloat(str2);
    g := StrToFloat(str3);
    b := StrToFloat(str4);

    f2 := StrToFloat(v2.Attributes['MidPoint'], n1);
    //    f2 := v2.Attributes['MidPoint'];
    f3 := StrToFloat(v2.Attributes['Sharpness'], n1);
    view.AddColorTransferFunctionPoint(f1, r, g, b, f2, f3);
  end;

  v1 := ASetting.ScalarOpacitys[aindex];
  view.ClearScalarOpacityPoints;
  for i := 0 to v1.ChildNodes.Count - 1 do
  begin
    v2 := v1.ChildNodes.Nodes[i];
    //Point  X Value MidPoint Sharpness
    f1 := StrToFloat(v2.Attributes['X'], n1);
    f2 := StrToFloat(v2.Attributes['Value'], n1);
    f3 := StrToFloat(v2.Attributes['MidPoint'], n1);
    f4 := StrToFloat(v2.Attributes['Sharpness'], n1);
    view.AddScalarOpacityTransferFunctionPoint(f1, f2, f3, f4);
  end;

  v1 := ASetting.GradientOpacitys[aindex];
  view.ClearGradientOpacityPoints;
  for i := 0 to v1.ChildNodes.Count - 1 do
  begin
    v2 := v1.ChildNodes.Nodes[i];
    f1 := StrToFloat(v2.Attributes['X'], n1);
    f2 := StrToFloat(v2.Attributes['Value'], n1);
    f3 := StrToFloat(v2.Attributes['MidPoint'], n1);
    f4 := StrToFloat(v2.Attributes['Sharpness'], n1);
    view.AddGradientOpacityTransferFunctionPoint(f1, f2, f3, f4);
  end;
  view.invalidate;
end;

end.

