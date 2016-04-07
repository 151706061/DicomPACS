unit fTableParam;
{< Окно "Параметры таблицы"
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxTextEdit, cxMaskEdit, cxSpinEdit, cxControls,
  cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, cxDropDownEdit, cxPC,
  cxColorComboBox, RVScroll, RichView,RVTable, RVEdit, RVStyle,
  JvExControls, JvComponent,CRVData, cxGroupBox, Menus, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, cxGraphics;

type
  TfmTableParam = class(TForm)
    Panel1:    TPanel;
    Bevel1:    TBevel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxPageControl1: TcxPageControl;
    tsTable:   TcxTabSheet;
    tsBorder:  TcxTabSheet;
    cxLabel2:  TcxLabel;
    cxLabel1:  TcxLabel;
    seRow:     TcxSpinEdit;
    seCol:     TcxSpinEdit;
    cxLabel3:  TcxLabel;
    cbBorderStyle: TcxComboBox;
    ccBorderColor: TcxColorComboBox;
    cxLabel5:  TcxLabel;
    ccCellColor: TcxColorComboBox;
    cxLabel7:  TcxLabel;
    cxLabel8:  TcxLabel;
    spBorderWidth: TcxSpinEdit;
    tsRules:   TcxTabSheet;
    cxLabel15: TcxLabel;
    seTableWidth: TcxSpinEdit;
    cbTableWidth: TcxComboBox;
    cxLabel16: TcxLabel;
    seTableHeigth: TcxSpinEdit;
    cbTableHeight: TcxComboBox;
    RVExample: TRichViewEdit;
    RVStyle1: TRVStyle;
    tsCellBorders: TcxTabSheet;
    cxLabel4: TcxLabel;
    cbCellBorderStyle: TcxComboBox;
    cxLabel6: TcxLabel;
    ccCellBorderColor: TcxColorComboBox;
    spCellBorderWidth: TcxSpinEdit;
    cxLabel9: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    cxLabel10: TcxLabel;
    seBorderHSpacing: TcxSpinEdit;
    cxLabel11: TcxLabel;
    seBorderVSpacing: TcxSpinEdit;
    cxLabel14: TcxLabel;
    seCellPadding: TcxSpinEdit;
    cxGroupBox2: TcxGroupBox;
    cxLabel12: TcxLabel;
    seCellHSpacing: TcxSpinEdit;
    seCellVSpacing: TcxSpinEdit;
    cxLabel13: TcxLabel;
    cxGroupBox3: TcxGroupBox;
    seHRuleWidth: TcxSpinEdit;
    cxLabel17: TcxLabel;
    ccseHRuleColor: TcxColorComboBox;
    cxLabel18: TcxLabel;
    cxGroupBox4: TcxGroupBox;
    seVRuleWidth: TcxSpinEdit;
    cxLabel19: TcxLabel;
    ccVRuleColor: TcxColorComboBox;
    cxLabel20: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure seTableWidthPropertiesChange(Sender: TObject);
    procedure cbTableWidthPropertiesChange(Sender: TObject);
    procedure ccCellColorPropertiesChange(Sender: TObject);
    procedure cbBorderStylePropertiesChange(Sender: TObject);
    procedure ccBorderColorPropertiesChange(Sender: TObject);
    procedure ccCellBorderColorPropertiesChange(Sender: TObject);
    procedure cbCellBorderStylePropertiesChange(Sender: TObject);
    procedure spBorderWidthPropertiesChange(Sender: TObject);
    procedure spCellBorderWidthPropertiesChange(Sender: TObject);
    procedure seBorderHSpacingPropertiesChange(Sender: TObject);
    procedure seBorderVSpacingPropertiesChange(Sender: TObject);
    procedure seCellHSpacingPropertiesChange(Sender: TObject);
    procedure seCellVSpacingPropertiesChange(Sender: TObject);
    procedure seHRuleWidthPropertiesChange(Sender: TObject);
    procedure ccseHRuleColorPropertiesChange(Sender: TObject);
    procedure seVRuleWidthPropertiesChange(Sender: TObject);
    procedure ccVRuleColorPropertiesChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure seCellPaddingPropertiesChange(Sender: TObject);
  private
    FExampleRVTableItemInfo: TRVTableItemInfo;
    procedure AssigTI_Width;
    procedure AssigTI_Height;
    procedure AssigTI_CellColor;
    procedure AssigTI_BorderStyle;
    procedure AssigTI_BorderColor;
    procedure AssigTI_CellBorderStyle;
    procedure AssigTI_CellBorderColor;
    procedure AssigTI_BorderWidth;
    procedure AssigTI_CellBorderWidth;
    procedure AssigTI_CellPadding;
    procedure AssigTI_BorderHSpacing;
    procedure AssigTI_BorderVSpacing;
    procedure AssigTI_BorderCellHSpacing;
    procedure AssigTI_BorderCellVSpacing;
    procedure AssigTI_HRuleWidth;
    procedure AssigTI_HRuleColor;
    procedure AssigTI_VRuleWidth;
    procedure AssigTI_VruleColor;
  public
    procedure AssigPropToExample;
    procedure AssignExpampleToForm;
  end;

var
  fmTableParam: TfmTableParam;

function CreateRVTableItemInfo(var RVTableItemInfo: TRVTableItemInfo;ARVData : TCustomRVData): boolean;
function GetRVTableItemInfo(var RVTableItemInfo: TRVTableItemInfo;ARVData : TCustomRVData): boolean;

implementation

{$R *.dfm}

function CreateRVTableItemInfo(var RVTableItemInfo: TRVTableItemInfo;ARVData : TCustomRVData): boolean;
begin
  fmTableParam := TfmTableParam.Create(Application);
  fmTableParam.AssigPropToExample;
  Result := fmTableParam.ShowModal = mrOk;
  if Result then
  begin
    RVTableItemInfo := TRVTableItemInfo.CreateEx( fmTableParam.seRow.Value ,fmTableParam.seCol.Value, ARVData);
    RVTableItemInfo.AssignProperties(fmTableParam.FExampleRVTableItemInfo);
  end;
  fmTableParam.Free;

end;
//------------------------------------------------------------------------------
function GetRVTableItemInfo(var RVTableItemInfo: TRVTableItemInfo;ARVData : TCustomRVData): boolean;
begin
  fmTableParam := TfmTableParam.Create(Application);
  fmTableParam.FExampleRVTableItemInfo.AssignProperties(RVTableItemInfo);
  fmTableParam.AssignExpampleToForm;
  Result := fmTableParam.ShowModal = mrOk;
  if Result then
  begin
//    RVTableItemInfo := TRVTableItemInfo.CreateEx( fmTableParam.seRow.Value ,fmTableParam.seCol.Value, ARVData);
    RVTableItemInfo.AssignProperties(fmTableParam.FExampleRVTableItemInfo);
  end;
  fmTableParam.Free;

end;
//------------------------------------------------------------------------------
procedure TfmTableParam.AssigPropToExample;
begin
  AssigTI_Width;
  AssigTI_Height;
  AssigTI_CellColor;
  AssigTI_BorderStyle;
  AssigTI_BorderColor;
  AssigTI_CellBorderStyle;
  AssigTI_CellBorderColor;
  AssigTI_BorderWidth;
  AssigTI_CellBorderWidth;
  AssigTI_CellPadding;
  AssigTI_BorderHSpacing;
  AssigTI_BorderVSpacing;
  AssigTI_BorderCellHSpacing;
  AssigTI_BorderCellVSpacing;
  AssigTI_HRuleWidth;
  AssigTI_HRuleColor;
  AssigTI_VRuleWidth;
  AssigTI_VruleColor;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.AssigTI_CellColor;
begin
  FExampleRVTableItemInfo.Color := ccCellColor.ColorValue;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.AssigTI_Height;
begin
//  case cbTableHeight.ItemIndex of    //
//    0: FExampleRVTableItemInfo.BestHeight := seTableHeigth.Value;
//    1: FExampleRVTableItemInfo.BestHeight := 0-seTableHeigth.Value;
//  end;    // case

end;
//------------------------------------------------------------------------------
procedure TfmTableParam.AssigTI_Width;
begin
  case cbTableWidth.ItemIndex of    //
    0: FExampleRVTableItemInfo.BestWidth := seTableWidth.Value;
    1: FExampleRVTableItemInfo.BestWidth := 0-seTableWidth.Value;
  end;    // case
  RVExample.Format;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.FormCreate(Sender: TObject);
begin
  FExampleRVTableItemInfo := TRVTableItemInfo.CreateEx(3, 3, rvExample.RVData);
  if rvExample.InsertItem('', FExampleRVTableItemInfo) then
  begin
//    AssigPropToExample;
  end;

end;
//------------------------------------------------------------------------------
procedure TfmTableParam.seTableWidthPropertiesChange(Sender: TObject);
begin
  AssigTI_Width;

end;
//------------------------------------------------------------------------------
procedure TfmTableParam.cbTableWidthPropertiesChange(Sender: TObject);
begin
  AssigTI_Width;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.ccCellColorPropertiesChange(Sender: TObject);
begin
  AssigTI_CellColor;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.AssigTI_BorderStyle;
begin
  case cbBorderStyle.ItemIndex of    //
    0: FExampleRVTableItemInfo.BorderStyle := rvtbRaised;
    1: FExampleRVTableItemInfo.BorderStyle := rvtbLowered;
    2: FExampleRVTableItemInfo.BorderStyle := rvtbColor;
    3: FExampleRVTableItemInfo.BorderStyle := rvtbRaisedColor;
  end;    // case
  RVExample.Format;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.cbBorderStylePropertiesChange(Sender: TObject);
begin
  AssigTI_BorderStyle;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.AssigTI_BorderColor;
begin
  FExampleRVTableItemInfo.BorderColor := ccBorderColor.ColorValue;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.AssigTI_CellBorderStyle;
begin
  case cbCellBorderStyle.ItemIndex of    //
    0: FExampleRVTableItemInfo.CellBorderStyle := rvtbRaised;
    1: FExampleRVTableItemInfo.CellBorderStyle := rvtbLowered;
    2: FExampleRVTableItemInfo.CellBorderStyle := rvtbColor;
    3: FExampleRVTableItemInfo.CellBorderStyle := rvtbRaisedColor;
  end;    // case
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.AssigTI_CellBorderColor;
begin
  FExampleRVTableItemInfo.CellBorderColor := ccCellBorderColor.ColorValue;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.AssigTI_BorderWidth;
begin
  FExampleRVTableItemInfo.BorderWidth :=  spBorderWidth.Value;
  RVExample.Format;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.AssigTI_CellBorderWidth;
begin
  FExampleRVTableItemInfo.CellBorderWidth := spCellBorderWidth.Value;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.ccBorderColorPropertiesChange(Sender: TObject);
begin
  AssigTI_BorderColor;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.ccCellBorderColorPropertiesChange(Sender: TObject);
begin
  AssigTI_CellBorderColor;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.cbCellBorderStylePropertiesChange(Sender: TObject);
begin
  AssigTI_CellBorderStyle;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.spBorderWidthPropertiesChange(Sender: TObject);
begin
  AssigTI_BorderWidth;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.spCellBorderWidthPropertiesChange(Sender: TObject);
begin
  AssigTI_CellBorderWidth;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.AssigTI_CellPadding;
begin
  FExampleRVTableItemInfo.CellPadding := seCellPadding.Value;
  RVExample.Format;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.AssigTI_BorderHSpacing;
begin
  FExampleRVTableItemInfo.BorderHSpacing := seBorderHSpacing.Value;
  RVExample.Format;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.AssigTI_BorderVSpacing;
begin
  FExampleRVTableItemInfo.BorderVSpacing := seBorderVSpacing.Value;
  RVExample.Format;

end;
//------------------------------------------------------------------------------
procedure TfmTableParam.seBorderHSpacingPropertiesChange(Sender: TObject);
begin
  AssigTI_BorderHSpacing;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.seBorderVSpacingPropertiesChange(Sender: TObject);
begin
  AssigTI_BorderVSpacing;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.AssigTI_BorderCellHSpacing;
begin
  FExampleRVTableItemInfo.CellHSpacing := seCellHSpacing.Value;
  RVExample.Format;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.seCellHSpacingPropertiesChange(Sender: TObject);
begin
  AssigTI_BorderCellHSpacing;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.AssigTI_BorderCellVSpacing;
begin
  FExampleRVTableItemInfo.CellVSpacing := seCellVSpacing.Value;
  RVExample.Format;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.seCellVSpacingPropertiesChange(Sender: TObject);
begin
  AssigTI_BorderCellVSpacing;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.AssigTI_HRuleWidth;
begin
  FExampleRVTableItemInfo.HRuleWidth := seHRuleWidth.Value;
  RVExample.Format;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.seHRuleWidthPropertiesChange(Sender: TObject);
begin
  AssigTI_HRuleWidth;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.AssigTI_HRuleColor;
begin
  FExampleRVTableItemInfo.HRuleColor := ccseHRuleColor.ColorValue;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.ccseHRuleColorPropertiesChange(Sender: TObject);
begin
  AssigTI_HRuleColor;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.AssigTI_VRuleWidth;
begin
  FExampleRVTableItemInfo.VRuleWidth := seVRuleWidth.Value;
  RVExample.Format;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.seVRuleWidthPropertiesChange(Sender: TObject);
begin
  AssigTI_VRuleWidth;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.AssigTI_VruleColor;
begin
  FExampleRVTableItemInfo.VRuleColor := ccVRuleColor.ColorValue;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.ccVRuleColorPropertiesChange(Sender: TObject);
begin
  AssigTI_VruleColor;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.FormDestroy(Sender: TObject);
begin
//  FExampleRVTableItemInfo.Free;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.AssignExpampleToForm;
begin
  ccCellColor.ColorValue := FExampleRVTableItemInfo.Color;
  seTableWidth.Value := FExampleRVTableItemInfo.BestWidth;
  if seTableWidth.Value>=0 then cbTableWidth.ItemIndex :=0
  else cbTableWidth.ItemIndex :=1;

  if seTableHeigth.Value>=0 then cbTableHeight.ItemIndex :=0
  else cbTableHeight.ItemIndex :=1;

  case FExampleRVTableItemInfo.BorderStyle  of
    rvtbRaised: cbBorderStyle.ItemIndex :=0 ;
    rvtbLowered: cbBorderStyle.ItemIndex :=1;
    rvtbColor: cbBorderStyle.ItemIndex :=2 ;
    rvtbRaisedColor: cbBorderStyle.ItemIndex :=3 ;
  end;    // case

  case FExampleRVTableItemInfo.CellBorderStyle  of
    rvtbRaised: cbCellBorderStyle.ItemIndex :=0 ;
    rvtbLowered: cbCellBorderStyle.ItemIndex :=1;
    rvtbColor: cbCellBorderStyle.ItemIndex :=2 ;
    rvtbRaisedColor: cbCellBorderStyle.ItemIndex :=3 ;
  end;    // case

  ccBorderColor.ColorValue :=  FExampleRVTableItemInfo.BorderColor;
  ccCellBorderColor.ColorValue :=  FExampleRVTableItemInfo.CellBorderColor;
  spBorderWidth.Value := FExampleRVTableItemInfo.BorderWidth;
  spCellBorderWidth.Value := FExampleRVTableItemInfo.CellBorderWidth;
  seCellPadding.Value :=  FExampleRVTableItemInfo.CellPadding;
  seBorderHSpacing.Value := FExampleRVTableItemInfo.BorderHSpacing;
  seBorderVSpacing.Value := FExampleRVTableItemInfo.BorderVSpacing;
  seCellHSpacing.Value := FExampleRVTableItemInfo.CellHSpacing;
  seCellVSpacing.Value := FExampleRVTableItemInfo.CellVSpacing;

  seHRuleWidth.Value := FExampleRVTableItemInfo.HRuleWidth;
  ccseHRuleColor.ColorValue := FExampleRVTableItemInfo.HRuleColor;
  seVRuleWidth.Value :=  FExampleRVTableItemInfo.VRuleWidth;
  ccVRuleColor.ColorValue := FExampleRVTableItemInfo.VRuleColor;
end;
//------------------------------------------------------------------------------
procedure TfmTableParam.seCellPaddingPropertiesChange(Sender: TObject);
begin
  AssigTI_CellPadding;
end;

end.

