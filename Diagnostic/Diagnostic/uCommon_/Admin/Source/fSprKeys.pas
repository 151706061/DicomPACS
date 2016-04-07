unit fSprKeys;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsdxBarPainter, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  OracleData, dxBar, ActnList, JvDBUtils, Oracle, cxCheckBox, dxSkinCaramel,
  dxSkinOffice2007Green;

type
  TfrmSprKeys = class(TForm)
    AL: TActionList;
    aEdit: TAction;
    aClose: TAction;
    aRefresh: TAction;
    aAdd: TAction;
    aDel: TAction;
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbAdd: TdxBarButton;
    bbPrint: TdxBarButton;
    bbClose: TdxBarButton;
    bbEdit: TdxBarButton;
    bbDel: TdxBarButton;
    bbRefresh: TdxBarButton;
    dsKeys: TDataSource;
    odsKeys: TOracleDataSet;
    grKeys: TcxGrid;
    tvKeys: TcxGridDBTableView;
    grKeysL: TcxGridLevel;
    tvKeysOID: TcxGridDBColumn;
    tvKeysFC_KEY: TcxGridDBColumn;
    tvKeysFC_SYNONYM: TcxGridDBColumn;
    tvKeysFC_NAME: TcxGridDBColumn;
    tvKeysFC_SYMBOL: TcxGridDBColumn;
    tvKeysFL_SHIFT: TcxGridDBColumn;
    tvKeysFL_ALT: TcxGridDBColumn;
    tvKeysFL_CTRL: TcxGridDBColumn;
    tvKeysFC_RAION: TcxGridDBColumn;
    tvKeysFK_RAION: TcxGridDBColumn;
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aRefreshExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure ALUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tvKeysCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSprKeys: TfrmSprKeys;

implementation

uses fMain, fAddEditKeys;

{$R *.dfm}

procedure TfrmSprKeys.aAddExecute(Sender: TObject);
var
  key:string;
begin
  key := '';
  if DoEditKeys(key, odsKeys.Session) then
  begin
    with odsKeys do
    begin
      Close;
      Open;
      Locate('oid', key, []);      
    end;
  end;
end;

procedure TfrmSprKeys.aCloseExecute(Sender: TObject);
begin
  tvKeys.StoreToRegistry('\SoftWare\TaxiService\Admin\fSprKeys', TRUE, [], 'tvKeys');
  Close;
end;

procedure TfrmSprKeys.aDelExecute(Sender: TObject);
var
  oq : TOracleQuery;
begin
  if odsKeys.RecordCount = 0 then
    Exit;

  if MessageDlg('¬ы действительно хотите удалить эту запись?', mtConfirmation, [mbYes, mbNo], 0) = IDYES then
  begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' delete from taxi.ttaxidispetcherkey s where s.oid = :poid ';
        oq.DeclareAndSet('poid', otChar, odsKeys.FieldByName('oid').AsString);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsKeys);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmSprKeys.aEditExecute(Sender: TObject);
var
  key:string;
begin
  if (odsKeys.RecordCount = 0) then
    Exit;

  key := odsKeys.FieldByName('oid').AsString;
  if DoEditKeys(key, odsKeys.Session) then
  begin
    with odsKeys do
    begin
      Close;
      Open;
      Locate('oid', key, []);
    end;
  end;
end;

procedure TfrmSprKeys.ALUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  if (odsKeys.Active) then
  begin
    aDel.Enabled := odsKeys.RecordCount > 0;
    aEdit.Enabled := odsKeys.RecordCount > 0;
  end
  else begin
    aDel.Enabled := false;
    aEdit.Enabled := false;
  end;
end;

procedure TfrmSprKeys.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(odsKeys);
end;

procedure TfrmSprKeys.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSprKeys.FormCreate(Sender: TObject);
begin
  odsKeys.Open;
  tvKeys.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSprKeys', False, False, [],  'tvKeys');
end;

procedure TfrmSprKeys.FormDestroy(Sender: TObject);
begin
  frmSprKeys := nil;
end;

procedure TfrmSprKeys.tvKeysCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aEdit.Execute;
end;

end.
