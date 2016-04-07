unit fChooseNaz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ActnList, dxBar, cxGraphics, cxCustomData, cxStyles,
  cxTL, DB, OracleData, cxControls, cxInplaceContainer, cxTLData, cxDBTL,
  cxMaskEdit, cxCheckBox, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxBarPainter, cxClasses, cxLabel, cxContainer, cxEdit, cxTextEdit,
  ExtCtrls, dxBarExtItems, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  JvStringHolder;

type
  TfrmChooseNaz = class(TForm)
    BM: TdxBarManager;
    bbSave: TdxBarButton;
    bbCancel: TdxBarButton;
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    IL: TImageList;
    dxBarDockControl1: TdxBarDockControl;
    cxTreeNaz: TcxDBTreeList;
    dsNaz: TDataSource;
    odsNazCheck: TOracleDataSet;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    odsNazCheckFL_CHECK: TFloatField;
    odsNazCheckFK_ID: TFloatField;
    odsNazCheckFC_NAME: TStringField;
    odsNazCheckFN_ORDER: TFloatField;
    odsNazCheckFK_OWNER: TFloatField;
    bbSetAll: TdxBarButton;
    bbUnsetAll: TdxBarButton;
    aSetAll: TAction;
    aUnsetAll: TAction;
    paFilter: TPanel;
    cxFilter: TcxTextEdit;
    cxLabel1: TcxLabel;
    aDelFilter: TAction;
    cxDelFilter: TcxButton;
    bbSet: TdxBarButton;
    bbUnset: TdxBarButton;
    aSet: TAction;
    aUnSet: TAction;
    msh: TJvMultiStringHolder;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aSetAllExecute(Sender: TObject);
    procedure aUnsetAllExecute(Sender: TObject);
    procedure aDelFilterExecute(Sender: TObject);
    procedure cxFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxFilterClick(Sender: TObject);
    procedure cxFilterEnter(Sender: TObject);
    procedure aSetExecute(Sender: TObject);
    procedure aUnSetExecute(Sender: TObject);
  private
    Russian : HKL;
    { Private declarations }
  public
    procedure DoShowForm;
    { Public declarations }
  end;

var
  frmChooseNaz: TfrmChooseNaz;

implementation
uses fMain, fMetodics;
{$R *.dfm}

//------------------------------------------------------------------------------
procedure TfrmChooseNaz.aDelFilterExecute(Sender: TObject);
begin
  cxFilter.Clear;
  odsNazCheck.Filtered := False;
end;

//------------------------------------------------------------------------------
procedure TfrmChooseNaz.aSaveExecute(Sender: TObject);
begin
  ModalResult := MrOK;
end;

//------------------------------------------------------------------------------
procedure TfrmChooseNaz.aSetAllExecute(Sender: TObject);
begin
  try
    Cursor := crSQLWait;
    odsNazCheck.First;
    while not odsNazCheck.Eof do
      begin
        if odsNazCheck.FieldByName('FL_CHECK').AsInteger <> 1 then
          begin
            odsNazCheck.Edit;
            odsNazCheck.FieldByName('FL_CHECK').AsInteger:=1;
          end;
        odsNazCheck.Next;
      end;
    odsNazCheck.First;
  finally
    Cursor := crArrow;
  end;
end;

//------------------------------------------------------------------------------
procedure TfrmChooseNaz.aSetExecute(Sender: TObject);
//var I : Integer;
begin
//  if cxTreeNaz.SelectionCount > 1 then
//    begin
//      for I := 0 to odsNazCheck.RecordCount do
//        begin
//          if cxTreeNaz.Nodes.Items[I].Selected = True then
//            begin
//              if odsNazCheck.FieldByName('FL_CHECK').AsInteger <> 1 then
//                begin
//                  odsNazCheck.Edit;
//                  odsNazCheck.FieldByName('FL_CHECK').AsInteger:=1;
//                end;
//              odsNazCheck.Next;
//            end;
//        end;
//    end else
//    begin
      if odsNazCheck.FieldByName('FL_CHECK').AsInteger <> 1 then
        begin
          odsNazCheck.Edit;
          odsNazCheck.FieldByName('FL_CHECK').AsInteger:=1;
        end;
//    end;
end;

//------------------------------------------------------------------------------
procedure TfrmChooseNaz.aUnsetAllExecute(Sender: TObject);
begin
  try
    Cursor := crSQLWait;
    odsNazCheck.First;
    while not odsNazCheck.Eof do
      begin
        if odsNazCheck.FieldByName('FL_CHECK').AsInteger <> 0 then
          begin
            odsNazCheck.Edit;
            odsNazCheck.FieldByName('FL_CHECK').AsInteger:=0;
          end;
        odsNazCheck.Next;
      end;
    odsNazCheck.First;
  finally
    Cursor := crArrow;
  end;
end;

//------------------------------------------------------------------------------
procedure TfrmChooseNaz.aUnSetExecute(Sender: TObject);
begin
  if odsNazCheck.FieldByName('FL_CHECK').AsInteger <> 0 then
    begin
      odsNazCheck.Edit;
      odsNazCheck.FieldByName('FL_CHECK').AsInteger:=0;
    end;
end;

//------------------------------------------------------------------------------
procedure TfrmChooseNaz.cxFilterClick(Sender: TObject);
begin
  ActivateKeyboardLayout(Russian, KLF_REORDER); //!!! неправильно работает изменение раскладки
end;

//------------------------------------------------------------------------------
procedure TfrmChooseNaz.cxFilterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(Russian, KLF_REORDER);
end;

//------------------------------------------------------------------------------
procedure TfrmChooseNaz.cxFilterKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  odsNazCheck.Filtered := True;
  odsNazCheck.Filter := 'FC_NAME = ''*' + cxFilter.Text + '*'' '; //!!! сделать так чтобы фильтр работал в независимости от регистра
end;

//------------------------------------------------------------------------------
procedure TfrmChooseNaz.aCancelExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

//------------------------------------------------------------------------------
procedure TfrmChooseNaz.DoShowForm;
begin
  cxTreeNaz.RestoreFromRegistry('\SoftWare\SoftMaster\Rep_config\cxTreeNaz'+'\ID_SOTR_'+IntToStr(frmMain.pSOTRID), FALSE, FALSE);
end;

//------------------------------------------------------------------------------
procedure TfrmChooseNaz.FormShow(Sender: TObject);
var arrID : array of Integer;
    i, j, k : Integer;
begin

  Self.odsNazCheck.Close;
  if (frmMetodics.sTableName = '3000') then begin
     Self.odsNazCheck.SQL.Text := msh.StringsByName['table_3000'].Text;
  end else begin
     Self.odsNazCheck.SQL.Text := msh.StringsByName['table_other'].Text;
  end;
  Self.odsNazCheck.Open;


  if frmMetodics.odsMetodics.RecordCount = 0 then
    SetLength(arrID, 100)
  else
    SetLength(arrID, frmMetodics.odsMetodics.RecordCount);
  frmMetodics.odsMetodics.First;
  i:=0;
  while not frmMetodics.odsMetodics.EOF do
    begin
      arrId[i]:=frmMetodics.odsMetodics.FieldByName('FK_SMID').AsInteger;
      frmMetodics.odsMetodics.Next;
      i:=i+1;
    end;

  for i:=0 to odsNazCheck.RecordCount-1 do
    begin
      k:=odsNazCheck.FieldByName('FK_ID').AsInteger;
      for j:=0 to odsNazCheck.RecordCount-1 do
        begin
          if k = arrID[j] then
          begin
            odsNazCheck.Edit;
            odsNazCheck.FieldByName('FL_CHECK').AsInteger:=1;
          end;
        end;
      odsNazCheck.Next;
    end;
  cxTreeNaz.FullCollapse;
  odsNazCheck.First;
//  cxFilter.SetFocus; //!!! временно убрано, пока нормально не заработает фильтр
end;

//------------------------------------------------------------------------------
procedure TfrmChooseNaz.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  cxTreeNaz.StoreToRegistry('\SoftWare\SoftMaster\Rep_config\cxTreeNaz'+'\ID_SOTR_'+IntToStr(frmMain.pSOTRID), FALSE);
end;

end.
