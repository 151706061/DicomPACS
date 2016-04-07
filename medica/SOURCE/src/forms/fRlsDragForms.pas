unit fRlsDragForms;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, Db, OracleData,  ExtCtrls, JvFormPlacement,
  JvComponentBase, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, cxDBTL,  cxControls, cxTLData;

type
  TfrmRlsDragForms = class(TForm)
    odsDrugForms: TOracleDataSet;
    dsDrugForms: TDataSource;
    al: TActionList;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    acSelect: TAction;
    acCancel: TAction;
    odsDrugFormsFK_ID: TFloatField;
    odsDrugFormsFK_PARENT: TFloatField;
    odsDrugFormsFC_NAME: TStringField;
    odsDrugFormsFULLNAME: TStringField;
    Panel1: TPanel;
    sb: TStatusBar;
    acCollExpand: TAction;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    FormStorage: TJvFormStorage;
    tl: TcxDBTreeList;
    cxDBTreeList1FULLNAME: TcxDBTreeListColumn;
    procedure acSelectExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure acCollExpandExecute(Sender: TObject);
    procedure odsDrugFormsAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  frmRlsDragForms: TfrmRlsDragForms;

implementation

uses fdmMain;

{$R *.DFM}

procedure TfrmRlsDragForms.acSelectExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmRlsDragForms.acCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmRlsDragForms.acCollExpandExecute(Sender: TObject);
begin
  if TAction(Sender).Checked then
  begin
    TAction(Sender).ImageIndex := 53;
    TAction(Sender).Caption := 'Развернуть';
    TAction(Sender).Hint := 'Развернуть список';
    tl.FullCollapse;
  end
  else
  begin
    TAction(Sender).ImageIndex := 54;
    TAction(Sender).Caption := 'Cвернуть';
    TAction(Sender).Hint := 'Cвернуть список';
    tl.FullExpand;
  end;
  TAction(Sender).Checked := not TAction(Sender).Checked;
end;

procedure TfrmRlsDragForms.odsDrugFormsAfterScroll(DataSet: TDataSet);
begin
  if not DataSet.IsEmpty then
    sb.Panels[0].Text := '  Краткое название ЛФ:   ' + DataSet.FieldByName('fc_name').AsString;
  acSelect.Enabled := not DataSet.IsEmpty;
end;

procedure TfrmRlsDragForms.FormCreate(Sender: TObject);
begin
  odsDrugForms.Open;
end;

end.
