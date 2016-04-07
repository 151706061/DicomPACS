unit fMO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, Db, OracleData, Grids, 
  JvFormPlacement, Oracle, JvDBUtils, ExtCtrls, Menus, HtmlHlp, StdCtrls,
  JvComponentBase, Variants, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxMaskEdit, cxTextEdit, cxInplaceContainer, cxDBTL, cxControls, cxTLData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  TfrmMO = class(TForm)
    al: TActionList;
    acClose: TAction;
    acDel: TAction;
    acEdit: TAction;
    acAdd: TAction;
    acRefresh: TAction;
    FormStorage: TJvFormStorage;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton3: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton7: TToolButton;
    ToolButton5: TToolButton;
    paMo: TPanel;
    odsMO: TOracleDataSet;
    dsMO: TDataSource;
    pm: TPopupMenu;
    acShowColumnEditor: TAction;
    N1: TMenuItem;
    tlMO: TcxDBTreeList;
    tlMO_FC_NAME: TcxDBTreeListColumn;
    tlMO_FC_OTDEL: TcxDBTreeListColumn;
    tlMO_TYPELST: TcxDBTreeListColumn;
    tlMO_FC_CRM: TcxDBTreeListColumn;
    tlMO_fk_parent: TcxDBTreeListColumn;
    tlMO_FC_TREB: TcxDBTreeListColumn;
    tlMO_FC_CUR_GROUP_NAME: TcxDBTreeListColumn;
    tlMO_MOID: TcxDBTreeListColumn;
    tlMO_FK_SOTRID: TcxDBTreeListColumn;
    tlMO_FC_SKLAD_NAME: TcxDBTreeListColumn;
    procedure acDelExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure odsMOAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure acShowColumnEditorExecute(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure cxDBTreeList1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure cxDBTreeList1MoveTo(Sender: TObject;
      AttachNode: TcxTreeListNode; AttachMode: TcxTreeListNodeAttachMode;
      Nodes: TList; var IsCopy, Done: Boolean);
    procedure tlMOCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas;
      AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoShowMO;
//var
//  frmMO: TfrmMO;

implementation

uses fmainform, fMOEdit, fdmMain;

{$R *.DFM}

{********************************************************************************************************}
{        DoShowEdIzm
{********************************************************************************************************}
procedure DoShowMO;
var frmMO : TfrmMO;
begin
  frmMO := TfrmMO.Create(nil);
  frmMO.odsMO.Open;
  try
    frmMO.ShowModal;
    frmMO.tlMO.FullExpand;
  finally
    frmMO.Free;
  end;
end;

procedure TfrmMO.acDelExecute(Sender: TObject);
begin
  if tlMo.FocusedNode.HasChildren then
  begin
    MessageBox(Handle, 'Необходимо сначала удалить подчиненых МО', 'Ошибка', MB_ICONERROR or MB_OK);
    Exit;
  end;
  if windows.MessageBox(Handle, pChar('Удаление материально ответственного: ' +
    odsMO.FieldByName('FC_NAME').AsString + #10#13 + 'Вы уверены?'),
    'Подвердите действие', MB_YESNO + MB_ICONQUESTION) = mrYes then
  try
//    dmMain.pkgMO.del(odsMO.FieldByName('MOID').AsInteger);
    odsMO.Edit;
    odsMO.FieldByName('FL_DEL').AsInteger := 1;
    odsMO.Post;
    odsMO.Close;
    odsMO.Open;
  except
    on E: Exception do
    begin
        if Pos('ORA-20001',E.Message) > 0 then
          MessageBox(Handle,PChar('Невозможно удалить Материально ответственного!' + #10#13 +
            'У него есть подчиненые.'),'Ошибка', MB_ICONERROR or MB_OK)
        else if Pos('ORA-20002',E.Message) > 0 then
          MessageBox(Handle,PChar('Невозможно удалить Материально ответственного!' + #10#13 +
            'Он осуществлял движения.'),'Ошибка', MB_ICONERROR or MB_OK)
        else Raise;
    end;
  end;
end;

procedure TfrmMO.acEditExecute(Sender: TObject);
begin
  if DoShowMOEdit(odsMO.FieldByName('MOID').AsInteger,odsMO) = mrOk then
    acRefresh.Execute;
end;

procedure TfrmMO.acAddExecute(Sender: TObject);
begin
  if DoShowMoEdit(-1,odsMO) = mrOk then
    acRefresh.Execute;
end;

procedure TfrmMO.acCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

{********************************************************************************************************}
{        TfrmMO.acRefreshExecute
{********************************************************************************************************}

procedure TfrmMO.acRefreshExecute(Sender: TObject);
var
  MOID : integer;
begin
  // механизм поиска отредактированной записи
  MOID := -1;
  if (odsMO.Active)and(odsMO.RecordCount > 0) then
    MOID := odsMO.FieldByName('MOID').AsInteger;
  odsMO.Close;
  odsMO.Open;
  tlMo.FullExpand;
  if (odsMO.Active)and(odsMO.RecordCount > 0) then
    odsMO.Locate('MOID', MOID, []);
end;

procedure TfrmMO.odsMOAfterScroll(DataSet: TDataSet);
begin
	acDel.Enabled := (not DataSet.IsEmpty){ AND (odsMO.FieldByName('COUNT_OF_DOCS').AsInteger <= 0)};
  acEdit.Enabled := (not DataSet.IsEmpty);
end;

procedure TfrmMO.FormCreate(Sender: TObject);
begin
  tlMO_FC_SKLAD_NAME.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1);
  acRefresh.Execute;
end;

procedure TfrmMO.acShowColumnEditorExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
//  if TAction(Sender).Checked then tlMo.ColumnsCustomizing
//  else tlMo.EndColumnsCustomizing;

  tlMO.Customizing.Visible := TAction(Sender).Checked;
end;

function TfrmMO.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
Result := False;
  try
    // TODo Подумать насчет праметра  Command
    if Data = -1 then
      HtmlHelp(0, 'Medica.chm', HH_DISPLAY_TOPIC, 0)
    else
      HtmlHelp(0, 'Medica.chm', HH_HELP_CONTEXT, Data);
    CallHelp := False;
    Result := True;
  except
    on EConvertError do
      ShowMessage('Справка не найдена');
  end;
end;

procedure TfrmMO.cxDBTreeList1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  HT: TcxTreeListHitTest;
begin
  Accept := False;
  if Source is TcxDBTreeList then
  begin
    HT := TcxTreeList(Sender).HitTest;

    if Assigned(HT) then
      with HT do
//        if HitAtColumn and (HitAtNode or HitAtNodePreview) then
//          ShowMessage('Ok');

//    Accept := HT in [htIndent, htButton, htIcon, htStateIcon, htLabel];
    Accept := HT.HitAtIndent or HT.HitAtButton or HT.HitAtImage or HT.HitAtStateImage or HT.HitAtNode;
  end;
end;

procedure TfrmMO.cxDBTreeList1MoveTo(Sender: TObject;
  AttachNode: TcxTreeListNode; AttachMode: TcxTreeListNodeAttachMode;
  Nodes: TList; var IsCopy, Done: Boolean);
begin
  if MessageBox(Handle, pChar('Вы действительно хотите переместить "' +
       VarToStr(tlMO.DragNode.Values[tlMO_FC_NAME.ItemIndex]) + #13#10 + '" в подчинение "' +
       VarToStr(AttachNode.Values[tlMO_FC_NAME.ItemIndex]) + '" ?'),
       'Подтверждение', MB_ICONQUESTION or MB_YESNO) = IdNo then Abort;
end;

procedure TfrmMO.tlMOCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
begin
//  if not ASelected then begin
//    if ANode.AbsoluteIndex mod 2 = 0 then AColor := $00ACE1F0
//    else AColor := clSilver;
//  end;
end;

end.
