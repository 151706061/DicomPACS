unit fDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxSkinsdxBarPainter, dxBar, ActnList, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, OracleData, dxSkinOffice2007Green;

type
  TfrmDetails = class(TForm)
    TVDetails: TcxGridDBTableView;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    alDetails: TActionList;
    BMDetails: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    aClose: TAction;
    BMDetailsBar1: TdxBar;
    bbClose: TdxBarButton;
    odsDetails: TOracleDataSet;
    dsDetails: TDataSource;
    TVKABINET: TcxGridDBColumn;
    TVDATENAZ: TcxGridDBColumn;
    TVDATERUN: TcxGridDBColumn;
    TVFIOPAC: TcxGridDBColumn;
    TVISSLNAME: TcxGridDBColumn;
    TVSNIMKI: TcxGridDBColumn;
    TVDOZA: TcxGridDBColumn;
    TVPROSV: TcxGridDBColumn;
    odsDetailsFK_ID: TFloatField;
    odsDetailsFK_NAZSOSID: TFloatField;
    odsDetailsFK_SMID: TFloatField;
    odsDetailsFD_NAZ: TDateTimeField;
    odsDetailsFD_RUN: TDateTimeField;
    odsDetailsFD_RUN_TIME: TStringField;
    odsDetailsKABNAME: TStringField;
    odsDetailsISSLNAME: TStringField;
    odsDetailsFIOPAC: TStringField;
    odsDetailsDOZA: TFloatField;
    odsDetailsKOLVO: TFloatField;
    odsDetailsKOLVOPRSV: TFloatField;
    procedure aCloseExecute(Sender: TObject);
    procedure odsDetailsBeforeOpen(DataSet: TDataSet);
  private
//    pSYNONIM : String;
    pDATE1, pDATE2 : TDateTime;
    { Private declarations }
  public
    procedure DoShowForm(sSQL : String; {strSYNONIM: String;} dDate1: TDateTime; dDate2: TDateTime);
    { Public declarations }
  end;

var
  frmDetails: TfrmDetails;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmDetails.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmDetails.DoShowForm(sSQL: String; {strSYNONIM: String;} dDate1: TDateTime; dDate2: TDateTime);
begin
//  pSYNONIM := strSYNONIM;
  pDATE1 := dDate1;
  pDATE2 := dDate2;
  odsDetails.SQL.Text := sSQL;
  odsDetails.Close;
//  ShowMessage('s='+sSQL);
//  ShowMessage('text='+odsDetails.SQL.Text);
  odsDetails.Open;
end;

procedure TfrmDetails.odsDetailsBeforeOpen(DataSet: TDataSet);
begin
  odsDetails.SetVariable('PDATE1', pDATE1);
  odsDetails.SetVariable('PDATE2', pDATE2);
//  odsDetails.SetVariable('PFC_SYNONIM', pSYNONIM);
end;

end.
