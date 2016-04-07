unit fZakaz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponentBase, JvFormPlacement, ExtCtrls, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, cxMaskEdit, cxButtonEdit, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, OracleData, ActnList;

type
  TfrmEditZakaz = class(TForm)
    JvFormStorage1: TJvFormStorage;
    paMain: TPanel;
    cxLabel1: TcxLabel;
    teDateTime: TcxTextEdit;
    cxLabel2: TcxLabel;
    beNumTel: TcxButtonEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    tvTrips: TcxGridDBTableView;
    grTripsLevel1: TcxGridLevel;
    grTrips: TcxGrid;
    teAbonent: TcxTextEdit;
    teKod: TcxButtonEdit;
    beHomeAdr: TcxButtonEdit;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    beAdr1: TcxButtonEdit;
    beAdr2: TcxButtonEdit;
    cxLabel13: TcxLabel;
    beNumDrv: TcxButtonEdit;
    cxLabel14: TcxLabel;
    beStart: TcxButtonEdit;
    cxLabel15: TcxLabel;
    teEnd: TcxTextEdit;
    cxLabel16: TcxLabel;
    teTimeTrip: TcxTextEdit;
    lbAuto: TcxLabel;
    odsHis: TOracleDataSet;
    dsHis: TDataSource;
    tvTrips_Adr1: TcxGridDBColumn;
    tvTrips_Adr2: TcxGridDBColumn;
    tvTrips_Button: TcxGridDBColumn;
    al: TActionList;
    aClose: TAction;
    cxLabel6: TcxLabel;
    teSum: TcxTextEdit;
    lbVip: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
  private
    pJurID : Integer;
    { Private declarations }
  public
    procedure DoShowForm(nJurID : Integer; sNum : String);
    { Public declarations }
  end;

var
  frmEditZakaz: TfrmEditZakaz;

implementation
uses fMain;
{$R *.dfm}

{ TfrmZakaz }

procedure TfrmEditZakaz.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmEditZakaz.DoShowForm(nJurID: Integer; sNum : String);
begin
  pJurID := nJurID;
  odsHis.Close;
  odsHis.SetVariable('pfc_num', sNum);
  odsHis.Open;
end;

procedure TfrmEditZakaz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmEditZakaz.FormDestroy(Sender: TObject);
begin
  frmEditZakaz := nil;
end;

end.
