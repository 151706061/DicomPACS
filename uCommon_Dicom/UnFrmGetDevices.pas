unit UnFrmGetDevices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  ExtCtrls, cxStyles, dxSkinsCore, dxSkinOffice2007Green,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, FIBDataSet, pFIBDataSet, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxSkinBlack, dxSkinOffice2007Black,
  MemDS, DBAccess, Uni, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Blue,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Medotrade, OracleData;

type
  TFrmGetDevices = class(TForm)
    Panel1: TPanel;
    BtnOk: TcxButton;
    cxButton2: TcxButton;
    alOKCancel: TActionList;
    aOk: TAction;
    aCancel: TAction;
    dsDevices: TDataSource;
    pFIBDevices: TpFIBDataSet;
    pFIBDevicesFC_IP: TFIBStringField;
    pFIBDevicesFK_ID: TFIBIntegerField;
    pFIBDevicesFN_PORT: TFIBIntegerField;
    pFIBDevicesFC_TITLE: TFIBStringField;
    pFIBDevicesFC_COMMENT: TFIBStringField;
    cxgrdDevices: TcxGrid;
    cxDV: TcxGridDBTableView;
    FC_COMMENT: TcxGridDBColumn;
    FC_TITLE: TcxGridDBColumn;
    FC_IP: TcxGridDBColumn;
    FN_PORT: TcxGridDBColumn;
    cxgrdlvl1: TcxGridLevel;
    UniDevices: TUniQuery;
    OraDevices: TOracleDataSet;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxDVCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  public
    v_AETitle_chk : string;
    v_device_name_chk : string;
    v_fk_id : Integer;
    v_fk_ids : String;
    procedure SetPosListAETitle( p_AETitle : string );
    procedure chk_OK;
    procedure SetFilterTypeDevice ( p_fn_type:integer );
  end;

var
  FrmGetDevices: TFrmGetDevices;

implementation

Uses DB_CMN;

//uses fSendParam;

{$R *.dfm}

procedure TFrmGetDevices.SetPosListAETitle( p_AETitle : string );
var v_str : string;
begin
  if Pos( '(', p_AETitle )>0 then
    v_str := Copy(p_AETitle,pos('(',p_AETitle)+1);
  if copy(v_str,Length(v_str))=')' then
    v_str := Copy(v_str,1,length(v_str)-1) ;
  if v_isOracle then begin
    OraDevices .Locate('FC_TITLE', Trim(v_str), []);
  end else if v_isPostgres then begin
    UniDevices.Locate('FC_TITLE', Trim(v_str), []);
  end else begin
    pFIBDevices.Locate('FC_TITLE', Trim(v_str), []);
  end;
end;

procedure TFrmGetDevices.aCancelExecute(Sender: TObject);
begin // отмена
  ModalResult:=mrCancel;
end;

procedure TFrmGetDevices.chk_OK;
begin
  if v_isOracle then begin
    if not OraDevices.Eof then
    begin
      v_AETitle_chk := OraDevices.FieldByName('FC_TITLE').AsString ;
      v_device_name_chk := OraDevices.FieldByName('FC_COMMENT').AsString ;
      v_fk_ids := OraDevices.FieldByName('fk_id').AsString;
      ModalResult:=mrOk;
    end;
  end else if v_isPostgres then begin
    if not UniDevices.Eof then
    begin
      v_AETitle_chk := UniDevices.FieldByName('FC_TITLE').AsString ;
      v_device_name_chk := UniDevices.FieldByName('FC_COMMENT').AsString ;
      v_fk_ids := UniDevices.FieldByName('fk_id').AsString;
      ModalResult:=mrOk;
    end;
  end else begin
    if not pFIBDevices.Eof then
    begin
      v_AETitle_chk := pFIBDevices.FieldByName('FC_TITLE').AsString ;
      v_device_name_chk := pFIBDevices.FieldByName('FC_COMMENT').AsString ;
      v_fk_id := pFIBDevices.FieldByName('fk_id').AsInteger;
      ModalResult:=mrOk;
    end;
  end;
end;

procedure TFrmGetDevices.aOkExecute(Sender: TObject);
begin // выбор устройства
  chk_OK;
end;

procedure TFrmGetDevices.cxDVCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  chk_OK;
end;

procedure TFrmGetDevices.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  pFIBDevices.Close;
end;

procedure TFrmGetDevices.SetFilterTypeDevice ( p_fn_type : integer );
begin
  if v_isOracle then begin
    OraDevices.Close;
    OraDevices.SQL.Clear;
    OraDevices.SQL.Text:=' SELECT * FROM DEVICES WHERE FN_TYPE='+
          inttostr(p_fn_type)+' ORDER BY FC_TITLE';
    OraDevices.Open;
  end else if v_isPostgres then begin
    UniDevices.Close;
    UniDevices.SQL.Clear;
    UniDevices.SQL.Text:=' SELECT * FROM '+v_pg_Schema+'.devices WHERE fn_type='+
          inttostr(p_fn_type)+' ORDER BY fc_title';
    UniDevices.Open;
  end else begin
    pFIBDevices.Close;
    pFIBDevices.SQLs.SelectSQL.Clear;
    pFIBDevices.SQLs.SelectSQL.Add('SELECT FK_ID, FC_IP, FN_PORT, FC_TITLE, FC_COMMENT ');
    pFIBDevices.SQLs.SelectSQL.Add(' FROM DEVICES WHERE FN_TYPE='+inttostr(p_fn_type));
    pFIBDevices.SQLs.SelectSQL.Add(' ORDER BY FC_TITLE');
    pFIBDevices.Open;
  end;
end;

procedure TFrmGetDevices.FormCreate(Sender: TObject);
begin //
  if v_isOracle then begin
    OraDevices.Session:=DB_CMN.OraConn;
    dsDevices.DataSet:=OraDevices;
    OraDevices.SQL.Text:=' SELECT * FROM DEVICES ORDER BY FC_TITLE';
    OraDevices.Open;
    OraDevices.First;
    BtnOk.Enabled := not OraDevices.Eof;
  end else if v_isPostgres then begin
    UniDevices.Connection:=DB_CMN.PGconn;
    dsDevices.DataSet:=UniDevices;
    UniDevices.SQL.Text:=' SELECT * FROM '+v_pg_Schema+'.devices ORDER BY fc_title';
    UniDevices.Open;
    UniDevices.First;
    BtnOk.Enabled := not UniDevices.Eof;
  end else begin
    dsDevices.DataSet:=pFIBDevices;
    pFIBDevices.Database:=DB_CMN.DB;
    pFIBDevices.Transaction:=DB_CMN.trRead;
    pFIBDevices.Sqls.SelectSQL.Text:=' SELECT * FROM DEVICES ORDER BY FC_TITLE';
    pFIBDevices.Prepare;
    pFIBDevices.Open;
    pFIBDevices.First;
    BtnOk.Enabled := not pFIBDevices.Eof;
  end;
end;

end.
