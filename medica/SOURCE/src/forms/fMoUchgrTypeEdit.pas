unit fMoUchgrTypeEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ActnList, ExtCtrls, Db, OracleData, dxCntner, dxTL,
  StdCtrls, dxTLClms, ImgList, Oracle, dxExEdtr;

type
  TfrmMoUchgrTypeEdit = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    odsMoUchgrTypes: TOracleDataSet;
    gbType: TGroupBox;
    tl: TdxTreeList;
    odsMoUchgrTypesFK_ID: TIntegerField;
    odsMoUchgrTypesFC_NAME: TStringField;
    odsMoUchgrTypesEXUCHGRTYPE: TFloatField;
    tlType: TdxTreeListColumn;
    ilStateImg: TImageList;
    tlExists: TdxTreeListImageColumn;
    oqInsert: TOracleQuery;
    oqDelete: TOracleQuery;
    procedure aCancelExecute(Sender: TObject);
    procedure tlKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aSaveExecute(Sender: TObject);
    procedure tlMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FMoid: Integer;
    procedure SetMoID(const Value: Integer);
    { Private declarations }
  public
    property Moid: Integer read FMoid write SetMoID;
    constructor Create(pMOID: Integer);reintroduce;
    { Public declarations }
  end;

function DoShowUchGrEdit(pMoID: Integer):Integer;

//var
//  frmMoUchgrTypeEdit: TfrmMoUchgrTypeEdit;

implementation

{$R *.DFM}

uses fdmMain;

function DoShowUchGrEdit(pMoID: Integer):Integer;
var
  frmMoUchgrTypeEdit: TfrmMoUchgrTypeEdit;
begin
  frmMoUchgrTypeEdit := TfrmMoUchgrTypeEdit.Create(pMOID);
  try
    Result := frmMoUchgrTypeEdit.ShowModal;
  finally
    frmMoUchgrTypeEdit.free;
  end;
end;

procedure TfrmMoUchgrTypeEdit.SetMoID(const Value: Integer);
begin
  FMoid := Value;
end;

constructor TfrmMoUchgrTypeEdit.Create(pMOID: Integer);
var Node: TdxTreeListNode;
begin
  inherited Create(Application);
  odsMoUchgrTypes.SetVariable('MOID',pMOID);
  try
    odsMoUchgrTypes.Open;
    While not odsMoUchgrTypes.Eof do
    begin
      Node := tl.Add;
      Node.Values[0] := odsMoUchgrTypes.FieldByName('EXUCHGRTYPE').AsInteger;
      Node.Values[1] := odsMoUchgrTypes.FieldByName('FC_NAME').AsString;
      Node.Data := pointer(odsMoUchgrTypes.FieldByName('FK_ID').AsInteger);
      odsMoUchgrTypes.Next;
    end;
  except
  end;
  moid := pmoid;
end;

procedure TfrmMoUchgrTypeEdit.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmMoUchgrTypeEdit.tlKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_space then
  begin
    if TdxTreeList(Sender).FocusedNode.Values[0] = 1 then
      TdxTreeList(Sender).FocusedNode.Values[0] := 0
    else
      TdxTreeList(Sender).FocusedNode.Values[0] := 1;
    aSave.Enabled := True;
  end;
end;

procedure TfrmMoUchgrTypeEdit.aSaveExecute(Sender: TObject);
var I  : Integer;
begin
  try
    oqInsert.SetVariable('MOID',MOID);
    oqDelete.SetVariable('MOID',MOID);
    odsMoUchgrTypes.First;
    For I := 0 to tl.Count - 1 do
    begin
      if tl.Items[I].Values[0] = 1 then
      begin
        oqInsert.SetVariable('FK_TUCHGRTYPE',integer(tl.Items[I].Data));
        oqInsert.Execute;
      end
      else
      begin
        oqDelete.SetVariable('FK_TUCHGRTYPE',integer(tl.Items[I].Data));
        oqDelete.Execute;
      end;
    end;
    ModalResult := mrOk;
//    dmMain.os.Commit;
  except
  end;
end;

procedure TfrmMoUchgrTypeEdit.tlMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var HitInfo  : TdxTreeListHitInfo;
    Key      : Word;
begin
  if Button = mbLeft then
  begin
    HitInfo := TdxTreeList(Sender).GetHitInfo(Point(X,Y));
    if (HitInfo.Column = 0) and (HitInfo.hitType = htLabel) then
    begin
      Key := vk_space;
      tl.OnKeyDown(Sender,Key,[]);
    end;
  end;
end;

end.

