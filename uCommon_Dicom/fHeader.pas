unit fHeader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMemo, ActnList, dxSkinOffice2007Green, dxSkinBlack, ExtCtrls,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxGraphics, cxCustomData,
  cxStyles, cxTL, cxInplaceContainer, DCM_Attributes, DICOM_charset,
  DCM_Dict, cxTLData, dxSkinOffice2007Black, Medotrade;

type
  TfrmHeader = class(TForm)
    memHead: TcxMemo;
    al: TActionList;
    aClose: TAction;
    Panel1: TPanel;
    bClose: TcxButton;
    cxTreeList1: TcxTreeList;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn4: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn5: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn7: TcxTreeListColumn;
    procedure cxTreeList1CustomDrawCell(Sender: TObject;
                  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
                  var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure attr_tree_crt ( p_DicomAttributes : TDicomAttributes;         
                              p_parent : TcxTreeListNode = nil
                            );
  end;

var
  frmHeader : TfrmHeader;
  v_strList : TStringList;

implementation

{$R *.dfm}

function add_nl ( p_str:string; p_amm:Integer ):string;
var s:string; i:Integer;
begin
  s:=p_str;
  for I := 1 to p_amm do s:='0'+s;
  Result:=s;
end;

procedure TfrmHeader.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmHeader.attr_tree_crt ( p_DicomAttributes : TDicomAttributes;
                                     p_parent : TcxTreeListNode = nil
                                   );
var i, {v_length,} v_Index :Integer;
    v_cxTreeListNode : TcxTreeListNode;
    v_Group, v_Element : string;
  procedure line_add;
  begin
    v_Group   := IntToStr(p_DicomAttributes.ItemByIndex[i].FDict.getGroup);
    v_Element := IntToStr(p_DicomAttributes.ItemByIndex[i].FDict.getElement);
    cxTreeList1.BeginUpdate;
    if p_parent=nil then
      v_cxTreeListNode := cxTreeList1.Add
    else
      v_cxTreeListNode := p_parent.AddChild;
    v_cxTreeListNode.Texts[0] := add_nl(v_Group,4-length(v_Group))+':'+
                               add_nl(v_Element,4-length(v_Element));
    v_cxTreeListNode.Texts[1] := p_DicomAttributes.ItemByIndex[i].FDict.getVR ;
    if v_cxTreeListNode.Texts[1]<>'UNKNOWN' then
      if not v_strList.Find(add_nl(v_Group,4-length(v_Group)),v_Index) then
        v_strList.Add(add_nl(v_Group,4-length(v_Group)));
    v_cxTreeListNode.Texts[2] := p_DicomAttributes.ItemByIndex[i].FDict.Description ;
    v_cxTreeListNode.Texts[3] := Copy(gt_charset_value(p_DicomAttributes, p_DicomAttributes.ItemByIndex[i].AsString[0]), 1, 100) ;
    cxTreeList1.EndUpdate;
  end;
begin
  if not assigned(p_DicomAttributes) then
    exit;
  p_DicomAttributes.Sort;
  for I := 0 to p_DicomAttributes.Count - 1 do // Iterate
  begin
    if p_DicomAttributes.ItemByIndex[i].DataType <> ddtAttributes then
    begin
      line_add;
    end else
    begin
      line_add;
      attr_tree_crt( p_DicomAttributes.ItemByIndex[i].Attributes[0], v_cxTreeListNode );
    end;
  end;
end;

procedure TfrmHeader.cxTreeList1CustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
var k, v_nmb : Integer;
begin  //
  v_nmb:=0;
  // тип данных во втором столбце - неопределенный
  if cxTreeList1.Nodes.Items[AViewInfo.RecordIndex].Values[1]='UNKNOWN' then
  begin
    ACanvas.Brush.Color := clSilver;
    ACanvas.Font.Color  := clBlack;
  end else
  begin
    for k := 0 to v_strList.Count - 1 do
    begin
      if v_strList[k]=Copy(cxTreeList1.Nodes.Items[AViewInfo.RecordIndex].Values[0],0,4) then
      begin
        v_nmb:=k mod 2;
        Break;
      end;
    end;
    if v_nmb=0 then
      ACanvas.Brush.Color:=TColor($FFC3CE)
    else
      ACanvas.Brush.Color:=TColor($A5FBA5); 
  end;
end;

procedure TfrmHeader.FormCreate(Sender: TObject);
begin
  v_strList:=TStringList.Create;
end;

procedure TfrmHeader.FormDestroy(Sender: TObject);
begin
  v_strList.Free;
end;

end.
