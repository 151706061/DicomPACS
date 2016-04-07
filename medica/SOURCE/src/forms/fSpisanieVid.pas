unit fSpisanieVid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxMaskEdit, Oracle, OracleData,
  ActnList, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ComCtrls, ToolWin, cxCheckBox, fdmMain, fMainForm, cxSpinEdit;

type
  TfmSpisanieVid = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbuAdd: TToolButton;
    tbuDel: TToolButton;
    ToolButton7: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton1: TToolButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1FK_ID: TcxGridDBColumn;
    cxGrid1DBTableView1FC_NAME: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    al: TActionList;
    acClose: TAction;
    acDel: TAction;
    acAdd: TAction;
    acRefresh: TAction;
    dsSpisanieVid: TDataSource;
    odsSpisanieVid: TOracleDataSet;
    cxGrid1DBTableView1FL_DEL: TcxGridDBColumn;
    cxGrid1DBTableView1FN_DOCTYPE: TcxGridDBColumn;
    procedure acCloseExecute(Sender: TObject);
    procedure acDelExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid1DBTableView1FC_NAMEPropertiesEditValueChanged(
      Sender: TObject);
    procedure odsSpisanieVidAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    FDocType : Integer;
    procedure SetDocType(aDocType : integer);
  public
    { Public declarations }
    property DocType : integer read FDocType write SetDocType;
  end;

var
  fmSpisanieVid: TfmSpisanieVid;

  function DoShowSpisanieVid(aDocType : Integer = VIDMOVE_SPISANIE) : Integer;


implementation

{$R *.dfm}

function DoShowSpisanieVid(aDocType : Integer = VIDMOVE_SPISANIE) : Integer;
begin
  frmMain.CreateChild(TfmSpisanieVid, fmSpisanieVid);
  fmSpisanieVid.DocType := aDocType;
  fmSpisanieVid.acRefresh.Execute;
  fmSpisanieVid.Show;
  Result := 0;
end;

procedure TfmSpisanieVid.acCloseExecute(Sender: TObject);
begin
  cxGrid1DBTableView1FC_NAMEPropertiesEditValueChanged( nil );
  Close;
end;

procedure TfmSpisanieVid.acDelExecute(Sender: TObject);
begin
  cxGrid1DBTableView1FC_NAMEPropertiesEditValueChanged( nil );
  if Application.MessageBox('¬ы действительно хотите удалить этот вид списани€?', 'ѕодтверждение', MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
    odsSpisanieVid.Edit;
    odsSpisanieVid.FieldValues['FL_DEL'] := 1;  // признак удалени€ записи
    odsSpisanieVid.Post;

    acRefresh.Execute;
  end;
end;

procedure TfmSpisanieVid.acAddExecute(Sender: TObject);
begin
  cxGrid1DBTableView1FC_NAMEPropertiesEditValueChanged( nil );
  odsSpisanieVid.Insert;
  cxGrid1DBTableView1FN_DOCTYPE.EditValue := DocType;
  odsSpisanieVid.Post; // сразу постим - вдруг ничего вводить не будут
  cxGrid1DBTableView1FC_NAME.Editing := True;
end;

procedure TfmSpisanieVid.cxGrid1DBTableView1FC_NAMEPropertiesEditValueChanged(Sender: TObject );
begin
  if odsSpisanieVid.State in [dsEdit, dsInsert] then cxGrid1DBTableView1.DataController.Post; // намен€ли - постим - так поститс€ без ошибок
//  if odsSpisanieVid.State in [dsEdit, dsInsert] then odsSpisanieVid.Post; // намен€ли - постим
end;

procedure TfmSpisanieVid.acRefreshExecute(Sender: TObject);
begin
  cxGrid1DBTableView1FC_NAMEPropertiesEditValueChanged( nil );
  odsSpisanieVid.Close;
  odsSpisanieVid.Open;
end;

procedure TfmSpisanieVid.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  dmMain.os.Commit;
  Action := caFree;
end;

procedure TfmSpisanieVid.odsSpisanieVidAfterScroll(DataSet: TDataSet);
begin
  acDel.Enabled := odsSpisanieVid.RecordCount > 0;
end;

procedure TfmSpisanieVid.SetDocType(aDocType: integer);
begin
  FDocType := aDocType;
  odsSpisanieVid.SetVariable('DOCTYPE', FDocType);
  case FDocType of
    VIDMOVE_SPISANIE       : Self.Caption := '¬иды списани€';
    VIDMOVE_RETURN_POSTAV  : Self.Caption := 'ѕеречень оснований дл€ возврата';
    VIDMOVE_SPISANIE_HITEC : Self.Caption := '¬иды помощи';
  end;
end;

end.
