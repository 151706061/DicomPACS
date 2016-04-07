unit dcm_dxreg;

{$I dcm_define.inc}

interface

uses
  {$IFDEF FPC}
  LCLProc, LCLType, LMessages, LResources,
  {$ENDIF}
  {$IFDEF WIN32}
  Windows,
  {$ENDIF}
  {$IFNDEF fpc}
  {$IFDEF KS_COMPILER6_UP}DesignIntf, DesignEditors, VCLEditors, {$ELSE}DsgnIntf, {$ENDIF}
  {$ELSE}
  LazIDEIntf, PropEdits, ComponentEditors,
  {$ENDIF}
  Classes, Controls, Dialogs, ExtDlgs, SysUtils, Forms, dcm_scene, dcm_vgcore,
  dcm_controls, dcm_dynamics, dcm_mesa, Graphics, dcm_viewport;

type

  TdxIDEDesigner = class(TdxDesigner{$IFNDEF fpc}, IDesignNotification{$ENDIF})
  private
    {$IFNDEF fpc}
    {$IFDEF KS_COMPILER6_UP}
    procedure ItemDeleted(const ADesigner: IDesigner; AItem: TPersistent);
    procedure ItemInserted(const ADesigner: IDesigner; AItem: TPersistent);
    procedure ItemsModified(const ADesigner: IDesigner);
    procedure SelectionChanged(const ADesigner: IDesigner;
      const ASelection: IDesignerSelections);
    procedure DesignerOpened(const ADesigner: IDesigner; AResurrecting: Boolean);
    procedure DesignerClosed(const ADesigner: IDesigner; AGoingDormant: Boolean);
    {$ELSE}
    procedure ItemDeleted(const AItem: IPersistent);
    procedure ItemInserted(const AItem: IPersistent);
    procedure ItemsModified(const ADesigner: IUnknown);
    procedure SelectionChanged(const ASelection: IDesignerSelections);
    procedure DesignerInitialized(const ADesigner: IUnknown);
    procedure DesignerClosed(const ADesigner: IUnknown);
    {$ENDIF}
    {$ENDIF}
  public
    procedure SelectObject(ADesigner: TComponent; AObject: TdxObject; MultiSelection: array of TdxObject); override;
    procedure Modified(ADesigner: TComponent); override;
    function UniqueName(ADesigner: TComponent; ClassName: string): string; override;
    function IsSelected(ADesigner: TComponent; const AObject: TObject): boolean; override;
  end;

  TvxIDEDesigner = class(TvxDesigner{$IFNDEF fpc}, IDesignNotification{$ENDIF})
  private
    {$IFNDEF fpc}
    {$IFDEF KS_COMPILER6_UP}
    procedure ItemDeleted(const ADesigner: IDesigner; AItem: TPersistent);
    procedure ItemInserted(const ADesigner: IDesigner; AItem: TPersistent);
    procedure ItemsModified(const ADesigner: IDesigner);
    procedure SelectionChanged(const ADesigner: IDesigner;
      const ASelection: IDesignerSelections);
    procedure DesignerOpened(const ADesigner: IDesigner; AResurrecting: Boolean);
    procedure DesignerClosed(const ADesigner: IDesigner; AGoingDormant: Boolean);
    {$ELSE}
    procedure ItemDeleted(const AItem: IPersistent);
    procedure ItemInserted(const AItem: IPersistent);
    procedure ItemsModified(const ADesigner: IUnknown);
    procedure SelectionChanged(const ASelection: IDesignerSelections);
    procedure DesignerInitialized(const ADesigner: IUnknown);
    procedure DesignerClosed(const ADesigner: IUnknown);
    {$ENDIF}
    {$ENDIF}
  public
    procedure SelectObject(ADesigner: TComponent; AObject: TvxObject; MultiSelection: array of TvxObject); override;
    procedure Modified(ADesigner: TComponent); override;
    function UniqueName(ADesigner: TComponent; ClassName: string): string; override;
    function IsSelected(ADesigner: TComponent; const AObject: TObject): boolean; override;
    procedure EditStyle(const Res: TvxResources; const ASelected: string); override;
  end;

  TvxBrushProperty = class(TClassProperty)
  private
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
  end;

  TvxBitmapProperty = class(TClassProperty)
  private
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
  end;

  TvxPathDataProperty = class(TClassProperty)
  private
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
  end;

  TvxResourceProperty = class(TClassProperty)
  private
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
  end;

  TvxWideStringsProperty = class(TClassProperty)
  private
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
  end;

  TvxFontProperty = class(TClassProperty)
  private
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
  end;

  TvxTriggerProperty = class(TStringProperty)
  private
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure SetValue(const Value: string); override;
  end;

  TvxLangProperty = class(TStringProperty)
  private
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

  TvxLangEditor = class(TComponentEditor)
  private
  public
    procedure Edit; override;
  end;

  TvxImgListEditor = class(TComponentEditor)
  private
  public
    procedure Edit; override;
  end;

  TdxMeshProperty = class(TClassProperty)
  private
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
  end;

  TdxMaterialProperty = class(TClassProperty)
  private
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
  end;

  TdxParticleProperty = class(TClassProperty)
  private
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
  end;

  TdxBitmapProperty = class(TClassProperty)
  private
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
  end;

  TdxBitmapNameProperty = class(TStringProperty)
  private
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure SetValue(const Value: string); override;
  end;

  TdxColorProperty = class(TStringProperty)
  private
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure SetValue(const Value: string); override;
    procedure Edit; override;
  end;

  TvxGradientProperty = class(TStringProperty)
  private
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure SetValue(const Value: string); override;
    procedure Edit; override;
  end;

  TdxFontProperty = class(TClassProperty)
  private
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
  end;

procedure Register;

implementation {===============================================================}

uses dcm_dicom_view, dcm_utils, dcm_objects, dcm_ani, dcm_vglayer;
//  , dx_viewport,  dx_controls, dx_textbox, dx_dynamics, dx_vgdb;

{$IFNDEF fpc}

{ TvxIDEDesigner }

{$IFDEF KS_COMPILER6_UP}

procedure TvxIDEDesigner.DesignerClosed(const ADesigner: IDesigner;
  AGoingDormant: Boolean);
begin
end;

procedure TvxIDEDesigner.DesignerOpened(const ADesigner: IDesigner;
  AResurrecting: Boolean);
begin
end;

procedure TvxIDEDesigner.ItemDeleted(const ADesigner: IDesigner;
  AItem: TPersistent);
begin
end;

procedure TvxIDEDesigner.ItemInserted(const ADesigner: IDesigner;
  AItem: TPersistent);
begin
end;

procedure TvxIDEDesigner.ItemsModified(const ADesigner: IDesigner);
begin
end;

procedure TvxIDEDesigner.SelectionChanged(const ADesigner: IDesigner;
  const ASelection: IDesignerSelections);
begin
  if (ASelection.Count > 0) then
    CallDesignSelect(ASelection.Get(0));
end;

{$ELSE}

procedure TvxIDEDesigner.ItemDeleted(const AItem: IPersistent);
begin
end;

procedure TvxIDEDesigner.ItemInserted(const AItem: IPersistent);
begin
end;

procedure TvxIDEDesigner.ItemsModified(const ADesigner: IUnknown);
begin
end;

procedure TvxIDEDesigner.SelectionChanged(const ASelection: IDesignerSelections);
begin
  {  if (ASelection.Count > 0) then
      CallDesignSelect(ASelection.Get(0));}
end;

procedure TvxIDEDesigner.DesignerInitialized(const ADesigner: IUnknown);
begin
end;

procedure TvxIDEDesigner.DesignerClosed(const ADesigner: IUnknown);
begin
end;

{$ENDIF}

procedure TvxIDEDesigner.Modified(ADesigner: TComponent);
var
  D: IDesigner;
begin
  if (ADesigner is TCustomForm) and (TCustomform(ADesigner).Designer <> nil) then
  begin
    TCustomForm(ADesigner).Designer.QueryInterface(IDesigner, D);
    if Assigned(D) then
    begin
      D.Modified;
    end;
  end;
end;

procedure TvxIDEDesigner.SelectObject(ADesigner: TComponent; AObject: TvxObject; MultiSelection: array of TvxObject);
var
  D: {$IFDEF KS_COMPILER6_UP}IDesigner{$ELSE}IFormDesigner{$ENDIF};
  List: IDesignerSelections;
  i: integer;
begin
  if (ADesigner is TCustomForm) and (TCustomform(ADesigner).Designer <> nil) then
  begin
    TCustomForm(ADesigner).Designer.QueryInterface({$IFDEF KS_COMPILER6_UP}IDesigner{$ELSE}IFormDesigner{$ENDIF}, D);
    if Assigned(D) then
    begin
      D.SelectComponent(AObject);
      {$IFDEF KS_COMPILER6_UP}
      if Length(MultiSelection) > 0 then
      begin
        List := CreateSelectionList;
        D.GetSelections(List);
        for i := 0 to High(MultiSelection) do
          List.Add(MultiSelection[i]);
        D.SetSelections(List);
        List := nil;
      end;
      {$ENDIF}
    end;
  end;
end;

function TvxIDEDesigner.IsSelected(ADesigner: TComponent; const AObject: TObject): boolean;
var
  D: {$IFDEF KS_COMPILER6_UP}IDesigner{$ELSE}IFormDesigner{$ENDIF};
  List: IDesignerSelections;
  i: integer;
begin
  if (ADesigner is TCustomForm) and (TCustomform(ADesigner).Designer <> nil) then
  begin
    TCustomForm(ADesigner).Designer.QueryInterface({$IFDEF KS_COMPILER6_UP}IDesigner{$ELSE}IFormDesigner{$ENDIF}, D);
    if Assigned(D) then
    begin
      List := CreateSelectionList;
      D.GetSelections(List);
      if List.Count > 0 then
        for i := 0 to List.Count - 1 do
          if List.Items[i] = AObject then
          begin
            Result := true;
            List := nil;
            Exit;
          end;
      List := nil;
    end;
  end;
  Result := false;
end;

function TvxIDEDesigner.UniqueName(ADesigner: TComponent;
  ClassName: string): string;
var
  D: IDesigner;
begin
  Result := '';
  if (ADesigner is TCustomForm) and (TCustomform(ADesigner).Designer <> nil) then
  begin
    TCustomForm(ADesigner).Designer.QueryInterface(IDesigner, D);
    if Assigned(D) then
    begin
      if (ClassName <> '') and (Pos('Tvx', ClassName) = 1) then
        Delete(ClassName, 1, 3);
      Result := D.UniqueName('T' + ClassName);
    end;
  end;
end;

{$ELSE}

procedure TvxIDEDesigner.Modified(ADesigner: TComponent);
begin
  if (ADesigner is TCustomForm) and (TCustomform(ADesigner).Designer <> nil) then
  begin
    if TCustomForm(ADesigner).Designer <> nil then
    begin
      TCustomForm(ADesigner).Designer.Modified;
    end;
  end;
end;

procedure TvxIDEDesigner.SelectObject(ADesigner: TComponent; AObject: TvxObject; MultiSelection: array of TvxObject);
begin
  if (ADesigner is TCustomForm) and (TCustomform(ADesigner).Designer <> nil) then
  begin
    if TCustomForm(ADesigner).Designer <> nil then
    begin
      TCustomForm(ADesigner).Designer.SelectOnlyThisComponent(AObject);
    end;
  end;
end;

function TvxIDEDesigner.IsSelected(ADesigner: TComponent; const AObject: TObject): boolean;
begin
  Result := false;
end;

function TvxIDEDesigner.UniqueName(ADesigner: TComponent;
  ClassName: string): string;
begin
  Result := '';
  if (ADesigner is TCustomForm) and (TCustomform(ADesigner).Designer <> nil) then
  begin
    if TCustomForm(ADesigner).Designer <> nil then
    begin
      if (ClassName <> '') and (Pos('Tvx', ClassName) = 1) then
        Delete(ClassName, 1, 3);
      Result := TCustomForm(ADesigner).Designer.UniqueName('T' + ClassName);
    end;
  end;
end;

{$ENDIF}

procedure TvxIDEDesigner.EditStyle(const Res: TvxResources; const ASelected: string);
begin
  inherited;
  DesignResources(Res, ASelected);
end;

{ TvxBrushProperty }

procedure TvxBrushProperty.Edit;
begin
  selectInDesign(TvxBrush(GetOrdValue), GetComponent(0));
end;

function TvxBrushProperty.GetValue: string;
begin
  Result := '(Brush)';
end;

function TvxBrushProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paSubProperties, paDialog, paReadOnly];
end;

{ TvxBitmapProperty }

procedure TvxBitmapProperty.Edit;
begin
  vgBitmapEditor := TvxBitmapEditor.Create(nil);
  vgBitmapEditor.AssignFromBitmap(TvxBitmap(GetOrdValue));
  if vgBitmapEditor.ShowModal = mrOk then
  begin
    vgBitmapEditor.AssignToBitmap(TvxBitmap(GetOrdValue));
    Modified;
  end;
  vgBitmapEditor.Free;
end;

function TvxBitmapProperty.GetValue: string;
begin
  Result := '(Bitmap)';
end;

function TvxBitmapProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly];
end;

{ TvxPathDataProperty }

procedure TvxPathDataProperty.Edit;
var
  S: string;
  EditDlg: TvxPathDataDesigner;
begin
  EditDlg := TvxPathDataDesigner.Create(Application);
  EditDlg.PathData.Lines.Text := TvxPathData(GetOrdValue).Data;
  if EditDlg.ShowModal = mrOk then
  begin
    TvxPathData(GetOrdValue).Data := EditDlg.PathData.Lines.Text;
    if GetComponent(0) is TvxVisualObject then
      TvxVisualObject(GetComponent(0)).Repaint;
    Modified;
  end;
  EditDlg.Free;
end;

function TvxPathDataProperty.GetValue: string;
begin
  Result := '(PathData)';
end;

function TvxPathDataProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly];
end;

{ TvxResourceProperty }

procedure TvxResourceProperty.Edit;
begin
  if DesignResources(TvxResources(GetComponent(0)), '') then
    Modified;
end;

function TvxResourceProperty.GetValue: string;
begin
  Result := '(Resource)';
end;

function TvxResourceProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly];
end;

{ TvxWideStringsProperty }

procedure TvxWideStringsProperty.Edit;
var
  EditDlg: TvxPathDataDesigner;
  SaveWrap: boolean;
begin
  EditDlg := TvxPathDataDesigner.Create(Application);
  EditDlg.PathData.WordWrap := false;
  EditDlg.Caption := 'WideStrings Editor';
  if GetComponent(0) is TvxMemo then
  begin
    EditDlg.PathData.WordWrap := false;
    SaveWrap := TvxMemo(GetComponent(0)).WordWrap;
    TvxMemo(GetComponent(0)).WordWrap := false;
    EditDlg.PathData.Lines.Assign(TvxWideStrings(GetOrdValue));
    TvxMemo(GetComponent(0)).WordWrap := SaveWrap;
  end
  else
  begin
    EditDlg.PathData.WordWrap := true;
    EditDlg.PathData.Lines.Assign(TvxWideStrings(GetOrdValue));
  end;
  EditDlg.previewLayout.Visible := false;
  EditDlg.labelMemo.Text := 'Type items:';
  if EditDlg.ShowModal = mrOk then
  begin
    TvxWideStrings(GetOrdValue).Text := EditDlg.PathData.Lines.Text;
    if GetComponent(0) is TvxVisualObject then
      TvxVisualObject(GetComponent(0)).Repaint;
    Modified;
  end;
  EditDlg.Free;
end;

function TvxWideStringsProperty.GetValue: string;
begin
  Result := '(WideStrings)';
end;

function TvxWideStringsProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly];
end;

{ TvxFontProperty }

procedure TvxFontProperty.Edit;
var
  F: TFontDialog;
begin
  F := TFontDialog.Create(Application);
  F.Font.Assign(TvxFont(GetOrdValue));
  if F.Execute then
  begin
    TvxFont(GetOrdValue).Assign(F.Font);
    Modified;
  end;
  F.Free;
end;

function TvxFontProperty.GetValue: string;
begin
  Result := '(Font)';
end;

function TvxFontProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paSubProperties, paDialog, paReadOnly];
end;

{ TvxTriggerProperty ============================================================}

{ TvxTriggerProperty }

function TvxTriggerProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paValueList, paRevertable];
end;

procedure TvxTriggerProperty.GetValues(Proc: TGetStrProc);
var
  i: Integer;
begin
  try
    Proc('IsMouseOver=true');
    Proc('IsMouseOver=false');
    Proc('IsFocused=true');
    Proc('IsFocused=false');
    Proc('IsVisible=true');
    Proc('IsVisible=false');
    Proc('IsDragOver=true');
    Proc('IsDragOver=false');
    Proc('IsOpen=true');
    Proc('IsOpen=false');
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

function TvxTriggerProperty.GetValue: string;
begin
  try
    Result := GetStrValue;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TvxTriggerProperty.SetValue(const Value: string);
begin
  try
    SetStrValue(Value);
    Modified;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

{ TvxLangProperty ============================================================}

{ TvxLangProperty }

function TvxLangProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paRevertable];
end;

procedure TvxLangProperty.Edit;
begin
  ShowDsgnLang(TvxLang(GetComponent(0)));
end;

{ TvxLangEditor ============================================================}

{ TvxLangEditor }

procedure TvxLangEditor.Edit;
begin
  ShowDsgnLang(TvxLang(Component));
end;

{ TvxImgListEditor ============================================================}

{ TvxImgListEditor }

procedure TvxImgListEditor.Edit;
begin
  ShowDsgnImageList(TvxImageList(Component));
end;

{$IFNDEF FPC}
{ TdxIDEDesigner }

{$IFDEF KS_COMPILER6_UP}

procedure TdxIDEDesigner.DesignerClosed(const ADesigner: IDesigner;
  AGoingDormant: Boolean);
begin
end;

procedure TdxIDEDesigner.DesignerOpened(const ADesigner: IDesigner;
  AResurrecting: Boolean);
begin
end;

procedure TdxIDEDesigner.ItemDeleted(const ADesigner: IDesigner;
  AItem: TPersistent);
begin
end;

procedure TdxIDEDesigner.ItemInserted(const ADesigner: IDesigner;
  AItem: TPersistent);
begin
end;

procedure TdxIDEDesigner.ItemsModified(const ADesigner: IDesigner);
begin
end;

procedure TdxIDEDesigner.SelectionChanged(const ADesigner: IDesigner;
  const ASelection: IDesignerSelections);
begin
  if (ASelection.Count > 0) then
    CallDesignSelect(ASelection.Get(0));
end;

{$ELSE}

procedure TdxIDEDesigner.ItemDeleted(const AItem: IPersistent);
begin
end;

procedure TdxIDEDesigner.ItemInserted(const AItem: IPersistent);
begin
end;

procedure TdxIDEDesigner.ItemsModified(const ADesigner: IUnknown);
begin
end;

procedure TdxIDEDesigner.SelectionChanged(const ASelection: IDesignerSelections);
begin
  {  if (ASelection.Count > 0) then
      CallDesignSelect(ASelection.Get(0));}
end;

procedure TdxIDEDesigner.DesignerInitialized(const ADesigner: IUnknown);
begin
end;

procedure TdxIDEDesigner.DesignerClosed(const ADesigner: IUnknown);
begin
end;

{$ENDIF}

procedure TdxIDEDesigner.Modified(ADesigner: TComponent);
var
  D: IDesigner;
begin
  if (ADesigner is TCustomForm) and (TCustomform(ADesigner).Designer <> nil) then
  begin
    TCustomForm(ADesigner).Designer.QueryInterface(IDesigner, D);
    if Assigned(D) then
    begin
      D.Modified;
    end;
  end;
end;

procedure TdxIDEDesigner.SelectObject(ADesigner: TComponent; AObject: TdxObject; MultiSelection: array of TdxObject);
var
  D: {$IFDEF KS_COMPILER6_UP}IDesigner{$ELSE}IFormDesigner{$ENDIF};
  List: IDesignerSelections;
  i: integer;
begin
  if (ADesigner is TCustomForm) and (TCustomform(ADesigner).Designer <> nil) then
  begin
    TCustomForm(ADesigner).Designer.QueryInterface({$IFDEF KS_COMPILER6_UP}IDesigner{$ELSE}IFormDesigner{$ENDIF}, D);
    if Assigned(D) then
    begin
      D.SelectComponent(AObject);
      {$IFDEF KS_COMPILER6_UP}
      if Length(MultiSelection) > 0 then
      begin
        List := CreateSelectionList;
        D.GetSelections(List);
        for i := 0 to High(MultiSelection) do
          List.Add(MultiSelection[i]);
        D.SetSelections(List);
        List := nil;
      end;
      {$ENDIF}
    end;
  end;
end;

function TdxIDEDesigner.IsSelected(ADesigner: TComponent; const AObject: TObject): boolean;
var
  D: {$IFDEF KS_COMPILER6_UP}IDesigner{$ELSE}IFormDesigner{$ENDIF};
  List: IDesignerSelections;
  i: integer;
begin
  if (ADesigner is TCustomForm) and (TCustomform(ADesigner).Designer <> nil) then
  begin
    TCustomForm(ADesigner).Designer.QueryInterface({$IFDEF KS_COMPILER6_UP}IDesigner{$ELSE}IFormDesigner{$ENDIF}, D);
    if Assigned(D) then
    begin
      List := CreateSelectionList;
      D.GetSelections(List);
      if List.Count > 0 then
        for i := 0 to List.Count - 1 do
          if List.Items[i] = AObject then
          begin
            Result := true;
            List := nil;
            Exit;
          end;
      List := nil;
    end;
  end;
  Result := false;
end;

function TdxIDEDesigner.UniqueName(ADesigner: TComponent;
  ClassName: string): string;
var
  D: IDesigner;
begin
  Result := '';
  if (ADesigner is TCustomForm) and (TCustomform(ADesigner).Designer <> nil) then
  begin
    TCustomForm(ADesigner).Designer.QueryInterface(IDesigner, D);
    if Assigned(D) then
    begin
      if (ClassName <> '') and (Pos('Tdx', ClassName) = 1) then
        Delete(ClassName, 1, 3);
      Result := D.UniqueName('T' + ClassName);
    end;
  end;
end;

{$ELSE}

procedure TdxIDEDesigner.Modified(ADesigner: TComponent);
begin
  if (ADesigner is TCustomForm) and (TCustomform(ADesigner).Designer <> nil) then
  begin
    if TCustomForm(ADesigner).Designer <> nil then
    begin
      TCustomForm(ADesigner).Designer.Modified;
    end;
  end;
end;

procedure TdxIDEDesigner.SelectObject(ADesigner: TComponent; AObject: TdxObject; MultiSelection: array of TdxObject);
begin
  if (ADesigner is TCustomForm) and (TCustomform(ADesigner).Designer <> nil) then
  begin
    if TCustomForm(ADesigner).Designer <> nil then
    begin
      TCustomForm(ADesigner).Designer.SelectOnlyThisComponent(AObject);
    end;
  end;
end;

function TdxIDEDesigner.IsSelected(ADesigner: TComponent; const AObject: TObject): boolean;
begin
  Result := false;
end;

function TdxIDEDesigner.UniqueName(ADesigner: TComponent;
  ClassName: string): string;
begin
  Result := '';
  if (ADesigner is TCustomForm) and (TCustomform(ADesigner).Designer <> nil) then
  begin
    if TCustomForm(ADesigner).Designer <> nil then
    begin
      if (ClassName <> '') and (Pos('Tdx', ClassName) = 1) then
        Delete(ClassName, 1, 3);
      Result := TCustomForm(ADesigner).Designer.UniqueName('T' + ClassName);
    end;
  end;
end;

{$ENDIF}

{ TdxMeshProperty }

procedure TdxMeshProperty.Edit;
var
  M: TdxMeshData;
begin
  M := TdxMeshData(GetOrdValue);
end;

function TdxMeshProperty.GetValue: string;
begin
  Result := '(Mesh)';
end;

function TdxMeshProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paSubProperties, paDialog, paReadOnly];
end;

{ TdxMaterialProperty }

procedure TdxMaterialProperty.Edit;
var
  M: TdxMaterial;
begin
  {  M := TdxMaterial(GetOrdValue);
    if frmMaterialDesign = nil then
      frmMaterialDesign := TfrmMaterialDesign.Create(Application);
    frmMaterialDesign.modalLayout.Visible := true;
    if (GetComponent(0) is TdxObject) then
      frmMaterialDesign.ParentScene := TdxObject(GetComponent(0)).Scene;
    frmMaterialDesign.Material := M;
    frmMaterialDesign.ShowModal;
    frmMaterialDesign.Free;
    frmMaterialDesign := nil;}
end;

function TdxMaterialProperty.GetValue: string;
begin
  Result := '(Material)';
end;

function TdxMaterialProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paSubProperties, paDialog, paReadOnly];
end;

{ TdxParticleProperty }

procedure TdxParticleProperty.Edit;
//var
//  frmParticleDesign: TdxParticleDialog;
begin
  {  if not (GetComponent(0) is TdxParticleEmitter) then Exit;
    frmParticleDesign := TdxParticleDialog.Create(Application);
    frmParticleDesign.Emitter := TdxParticleEmitter(GetComponent(0));
    if frmParticleDesign.Execute(TdxParticleEmitter(GetComponent(0)).Scene) then
      TdxParticleEmitter(GetComponent(0)).Assign(frmParticleDesign.Emitter);
    frmParticleDesign.Free;}
end;

function TdxParticleProperty.GetValue: string;
begin
  Result := '(Particle Designer)';
end;

function TdxParticleProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly];
end;

{ TdxBitmapProperty }

procedure TdxBitmapProperty.Edit;
var
  B: TvxBitmap;
begin
  vgBitmapEditor := TvxBitmapEditor.Create(nil);
  B := TvxBitmap.Create(1, 1);
  B.Assign(TdxBitmap(GetOrdValue));
  vgBitmapEditor.AssignFromBitmap(B);
  if vgBitmapEditor.ShowModal = mrOk then
  begin
    vgBitmapEditor.AssignToBitmap(B);

    TdxBitmap(GetOrdValue).Assign(B);

    if vgBitmapEditor.FileName <> '' then
    begin
      if GetComponent(0) is TdxBitmapStream then
      begin
        if TdxBitmapStream(GetComponent(0)).Name = '' then
          TdxBitmapStream(GetComponent(0)).Name := ExtractFileName(vgBitmapEditor.FileName);
      end;
      if GetComponent(0) is TdxBitmapObject then
      begin
        if TdxBitmapObject(GetComponent(0)).ResourceName = '' then
          TdxBitmapObject(GetComponent(0)).ResourceName := ExtractFileName(vgBitmapEditor.FileName);
      end;
    end;
  end;
  B.Free;
  vgBitmapEditor.Free;
end;

function TdxBitmapProperty.GetValue: string;
begin
  Result := '(Bitmap)';
end;

function TdxBitmapProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly];
end;

function TdxBitmapNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paValueList, paRevertable];
end;

procedure TdxBitmapNameProperty.GetValues(Proc: TGetStrProc);
var
  i: Integer;
begin
  try
    if BitmapList <> nil then
      for i := 0 to BitmapList.Count - 1 do
      begin
        if BitmapList.Objects[i] is TdxBitmapStream then
          Proc(TdxBitmapStream(BitmapList.Objects[i]).Name);
        if BitmapList.Objects[i] is TdxBitmapObject then
          Proc(TdxBitmapObject(BitmapList.Objects[i]).ResourceName);
        if BitmapList.Objects[i] is TdxBufferLayer then
          Proc(TdxBufferLayer(BitmapList.Objects[i]).Name);
      end;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

function TdxBitmapNameProperty.GetValue: string;
begin
  try
    Result := GetStrValue;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TdxBitmapNameProperty.SetValue(const Value: string);
begin
  try
    SetStrValue(Value);
    Modified;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

{ TdxColorProperty ============================================================}

{ TdxColorProperty }

procedure TdxColorProperty.Edit;
var
  D: TvxBrushDialog;
begin
  D := TvxBrushDialog.Create(Application);
  D.ShowStyles := [vgBrushSolid];
  D.ShowBrushList := false;
  D.Brush.Color := GetStrValue;
  if D.Execute then
  begin
    SetStrValue(D.Brush.Color);
  end;
  D.Free;
end;

function TdxColorProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paMultiSelect];
end;

function TdxColorProperty.GetValue: string;
begin
  try
    Result := GetStrValue;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TdxColorProperty.SetValue(const Value: string);
begin
  try
    SetStrValue(Value);
    Modified;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

{ TvxGradientProperty ============================================================}

{ TvxGradientProperty }

procedure TvxGradientProperty.Edit;
var
  D: TvxBrushDialog;
begin
  D := TvxBrushDialog.Create(Application);
  D.ShowStyles := [vgBrushGradient];
  D.ShowBrushList := false;
  D.Brush.Style := vgBrushGradient;
  D.Brush.Gradient.Assign(TvxGradient(GetOrdValue));
  if D.Execute then
  begin
    TvxGradient(GetOrdValue).Assign(D.Brush.Gradient);
  end;
  D.Free;
end;

function TvxGradientProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly];
end;

function TvxGradientProperty.GetValue: string;
begin
  Result := '(Gradient)';
end;

procedure TvxGradientProperty.SetValue(const Value: string);
begin
  try
    SetStrValue(Value);
    Modified;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

{ TdxFont }

{ TdxFontProperty }

procedure TdxFontProperty.Edit;
var
  F: TFontDialog;
begin
  F := TFontDialog.Create(Application);
  F.Font.Assign(TdxFont(GetOrdValue));
  if F.Execute then
  begin
    TdxFont(GetOrdValue).Assign(F.Font);
    Modified;
  end;
  F.Free;
end;

function TdxFontProperty.GetValue: string;
begin
  Result := '(Font)';
end;

function TdxFontProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paSubProperties, paDialog, paReadOnly];
end;

{ Register Routines ===========================================================}

procedure Register;
begin
  RegisterComponents('DicomVCL', [TDicomScene, TdxBitmapList, TvxResources, TvxLang, TvxImageList]);

  RegisterNoIcon([
    TdxCamera, TdxLight, TdxDummy, TdxCube, TdxMesh, TdxSphere, TdxGrid, TdxText, TdxImage,
      TdxCylinder, TdxRoundCube, TdxCone, TdxBitmapObject, TdxStrokeCube,
      TdxVisualObject, TdxProxyObject,
      TdxColorAnimation, TdxFloatAnimation,
      TdxBufferLayer, TdxObjectLayer,
      // shape 3d
  //TdxText3D, TdxPath3D, TdxRectangle3D, TdxEllipse3D,TdxCanvasLayer,
  // controls
  //TdxTextBox3D,
  // dynamics
    TdxParticleEmitter,
      // gui
    TdxGUILayout, TdxGUIObjectLayer, TdxGUIImage, TdxGUIPlane, TdxGUIText, TdxGUISelection,
      // deprecated
    TdxVGLayer
      , TdxScreenCanvasLayer, TdxScreenVGLayer, TdxScreenImage, TdxScreenDummy
      ]);
  RegisterPropertyEditor(TypeInfo(TdxMeshData), nil, '', TdxMeshProperty);
  RegisterPropertyEditor(TypeInfo(TdxMaterial), nil, '', TdxMaterialProperty);
  RegisterPropertyEditor(TypeInfo(TdxBitmap), nil, '', TdxBitmapProperty);
  RegisterPropertyEditor(TypeInfo(TdxFont), nil, '', TdxFontProperty);
  RegisterPropertyEditor(TypeInfo(string), TdxMaterial, 'Bitmap', TdxBitmapNameProperty);
  RegisterPropertyEditor(TypeInfo(string), TdxMaterial, 'Diffuse', TdxColorProperty);
  RegisterPropertyEditor(TypeInfo(string), TdxMaterial, 'Ambient', TdxColorProperty);
  RegisterPropertyEditor(TypeInfo(string), TdxScene, 'FillColor', TdxColorProperty);
  RegisterPropertyEditor(TypeInfo(string), TdxScene, 'AmbientColor', TdxColorProperty);
  RegisterPropertyEditor(TypeInfo(string), TdxCustomLayer, 'ModulationColor', TdxColorProperty);
  RegisterPropertyEditor(TypeInfo(string), TdxAnimation, 'Trigger', TvxTriggerProperty);
  RegisterPropertyEditor(TypeInfo(string), TdxColorAnimation, 'StartValue', TdxColorProperty);
  RegisterPropertyEditor(TypeInfo(string), TdxColorAnimation, 'StopValue', TdxColorProperty);

  RegisterPropertyEditor(TypeInfo(string), TdxParticleEmitter, 'ColorBegin', TdxColorProperty);
  RegisterPropertyEditor(TypeInfo(string), TdxParticleEmitter, 'ColorEnd', TdxColorProperty);
  RegisterPropertyEditor(TypeInfo(string), TdxParticleEmitter, 'Bitmap', TdxBitmapNameProperty);
  RegisterPropertyEditor(TypeInfo(integer), TdxParticleEmitter, 'Editor', TdxParticleProperty);
  //RegisterPropertyEditor(TypeInfo(String), TdxTextBox3D, 'Background', TdxColorProperty);
  //RegisterPropertyEditor(TypeInfo(String), TdxTextBox3D, 'Selection', TdxColorProperty);

  RegisterNoIcon([TvxRectAnimation,
    TvxBitmapListAnimation, TvxGradientAnimation, TvxFloatKeyAnimation, TvxPathSwitcher, TvxColorKeyAnimation, TvxPathAnimation,
      TvxColorAnimation, TvxFloatAnimation, TvxBitmapAnimation, TvxCalendarBox, TvxGroupBox, TvxPathCheckBox,
      TvxCheckBox, TvxRadioButton, TvxPopupBox, TvxPopupButton, TvxCornerButton, TvxCircleButton,
      TvxAngleButton, TvxButton, TvxPathButton, TvxColorButton, TvxBitmapStateButton, TvxSpeedButton,
      TvxRoundButton, TvxBitmapButton, TvxColorPanel, TvxComboColorBox, TvxColorQuad, TvxGradientEdit,
      TvxAlphaTrackBar, TvxBWTrackBar, TvxHueTrackBar, TvxColorBox, TvxColorPicker, TvxCompoundTrackBar,
      TvxCalendar, TvxCompoundNumberBox, TvxCompoundTextBox, TvxCompoundPopupBox, TvxCompoundImage, TvxCompoundMemo,
      TvxCompoundColorButton, TvxCompoundAngleBar, TvxProgressBar, TvxCalloutPanel, TvxVertScrollBox, TvxTrackBar,
      TvxFramedScrollBox, TvxScrollBar, TvxScrollBox, TvxValueLabel, TvxAniIndicator, TvxTrack,
      TvxSplitter, TvxExpander, TvxImageControl, TvxLabel, TvxFramedVertScrollBox, TvxSmallScrollBar,
      TvxPanel, TvxTabControl, TvxDesignFrame, TvxSelection, TvxSelectionPoint, TvxInspector,
      TvxReflectionEffect, TvxInnerGlowEffect, TvxBlurEffect, TvxShadowEffect, TvxGlowEffect, TvxBevelEffect,
      TvxImageViewer, TvxDropTarget, TvxIPhoneButton, TvxHeader, TvxStringGrid, TvxGrid,
      TvxProgressColumn, TvxImageColumn, TvxColumn, TvxPopupColumn, TvxCheckColumn, TvxHudNumberBox,
      TvxHudScrollBar, TvxHudStringComboBox, TvxHudAlphaTrackBar, TvxHudCloseButton, TvxHudCornerButton, TvxHudSizeGrip,
      TvxHudRadioButton, TvxHudComboColorBox, TvxHudMemo, TvxHudStringListBox, TvxHudTrack, TvxHudHorzImageListBox,
      TvxHudSpeedButton, TvxHudWindow, TvxHudListBox, TvxHudHorzListBox, TvxHudRoundTextBox, TvxHudLabel,
      TvxHudCircleButton, TvxHudGroupBox, TvxHudStatusBar, TvxHudPanel, TvxHudBWTrackBar, TvxHudHueTrackBar,
      TvxHudComboTrackBar, TvxHudImageListBox, TvxHudSpinBox, TvxHudComboBox, TvxHudAngleButton, TvxHudButton,
      TvxHudRoundButton, TvxHudCheckBox, TvxHudPopupBox, TvxHudTextBox, TvxHudComboTextBox, TvxHudTrackBar,
      TvxHudTabControl, TvxHeaderItem, TvxImageListBoxItem, TvxHudTabItem, TvxTabItem, TvxTreeViewItem,
      TvxListBoxItem, TvxGridLayout, TvxFrame, TvxLayout, TvxSplitLayout, TvxScaledLayout,
      TvxNonVGLayout, TvxStringComboBox, TvxHorzImageListBox, TvxStringListBox, TvxComboBox, TvxHorzListBox,
      TvxImageListBox, TvxListBox, TvxPlotGrid, TvxPopup, TvxMessagePopup, TvxBitmapObject,
      TvxPathObject, TvxBrushObject, TvxPie, TvxScrollArrowRight, TvxArc, TvxPath,
      TvxPaintBox, TvxCircle, TvxBlurRoundRect, TvxBlurRectangle, TvxRectangle, TvxScrollArrowLeft,
      TvxLine, TvxCalloutRectangle, TvxText, TvxImage, TvxSidesRectangle, TvxEllipse,
      TvxRoundRect, TvxTextBoxClearBtn, TvxTextBox, TvxComboTextBox, TvxNumberBox, TvxRoundTextBox,
      TvxMemo, TvxCalendarTextBox, TvxSpinBox, TvxComboTrackBar, TvxStatusBar, TvxToolButton,
      TvxToolPathButton, TvxToolBar, TvxTreeView, TvxSizeGrip, TvxBackground, TvxCloseButton,
      TvxDicomView
      ]);
  RegisterComponentEditor(TvxImageList, TvxImgListEditor);
  RegisterComponentEditor(TvxLang, TvxLangEditor);
  RegisterPropertyEditor(TypeInfo(string), TvxLang, 'Lang', TvxLangProperty);
  RegisterPropertyEditor(TypeInfo(string), TvxEffect, 'Trigger', TvxTriggerProperty);
  RegisterPropertyEditor(TypeInfo(string), TvxAnimation, 'Trigger', TvxTriggerProperty);
  RegisterPropertyEditor(TypeInfo(string), TvxBrush, 'Color', TdxColorProperty);
  RegisterPropertyEditor(TypeInfo(string), TvxColorKey, 'Value', TdxColorProperty);
  RegisterPropertyEditor(TypeInfo(string), TvxGlowEffect, 'GlowColor', TdxColorProperty);
  RegisterPropertyEditor(TypeInfo(string), TvxShadowEffect, 'ShadowColor', TdxColorProperty);
  RegisterPropertyEditor(TypeInfo(string), TvxColorAnimation, 'StartValue', TdxColorProperty);
  RegisterPropertyEditor(TypeInfo(string), TvxColorAnimation, 'StopValue', TdxColorProperty);
  RegisterPropertyEditor(TypeInfo(string), TvxColorKey, 'Value', TdxColorProperty);
  RegisterPropertyEditor(TypeInfo(string), TvxColorButton, 'Color', TdxColorProperty);
  RegisterPropertyEditor(TypeInfo(string), TvxCompoundColorButton, 'Value', TdxColorProperty);
  RegisterPropertyEditor(TypeInfo(string), TvxColorPanel, 'Color', TdxColorProperty);
  RegisterPropertyEditor(TypeInfo(string), TvxComboColorBox, 'Color', TdxColorProperty);
  RegisterPropertyEditor(TypeInfo(TvxGradient), nil, '', TvxGradientProperty);
  RegisterPropertyEditor(TypeInfo(TvxBrush), nil, '', TvxBrushProperty);
  RegisterPropertyEditor(TypeInfo(TvxBitmap), nil, '', TvxBitmapProperty);
  RegisterPropertyEditor(TypeInfo(TvxPathData), nil, '', TvxPathDataProperty);
  RegisterPropertyEditor(TypeInfo(TvxWideStrings), nil, '', TvxWideStringsProperty);
  RegisterPropertyEditor(TypeInfo(TvxFont), nil, '', TvxFontProperty);
  RegisterPropertyEditor(TypeInfo(TStrings), TvxResources, 'Resource', TvxResourceProperty);
end;

initialization
  dxDesigner := TdxIDEDesigner.Create(nil);
  {$IFDEF KS_COMPILER6_UP}
  RegisterDesignNotification(TdxIDEDesigner(dxDesigner));
  {$ENDIF}
  vgDesigner := TvxIDEDesigner.Create(nil);
  {$IFDEF KS_COMPILER6_UP}
  RegisterDesignNotification(TvxIDEDesigner(vgDesigner));
  {$ENDIF}
finalization
  {$IFDEF KS_COMPILER6_UP}
  UnregisterDesignNotification(TvxIDEDesigner(vgDesigner));
  {$ENDIF}
  vgDesigner.Free;
  vgDesigner := nil;
  {$IFDEF KS_COMPILER6_UP}
  UnregisterDesignNotification(TdxIDEDesigner(dxDesigner));
  {$ENDIF}
  dxDesigner.Free;
  dxDesigner := nil;
end.

