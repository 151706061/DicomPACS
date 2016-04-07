unit fDelManyMetodics;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxControls,
  cxContainer, cxEdit, cxLabel, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, ActnList, OracleData;

type
  TfrmDelManyMetodics = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    Image1: TImage;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    tvIssl: TcxGridDBTableView;
    grIsslLevel1: TcxGridLevel;
    grIssl: TcxGrid;
    bOk: TcxButton;
    bCancel: TcxButton;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    tvIssl_Name: TcxGridDBColumn;
    tvIssl_Sos: TcxGridDBColumn;
    tvIssl_Action: TcxGridDBColumn;
    odsIssl: TOracleDataSet;
    dsIssl: TDataSource;
    tvIssl_Nazsosid: TcxGridDBColumn;
    cxLabel5: TcxLabel;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure odsIsslBeforeOpen(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tvIsslCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDelManyMetodics: TfrmDelManyMetodics;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmDelManyMetodics.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmDelManyMetodics.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmDelManyMetodics.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  tvIssl.StoreToRegistry('\SoftWare\SoftMaster\List_RHMDL\fDelMany\cxGrSotr_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'grIssl');
end;

procedure TfrmDelManyMetodics.FormCreate(Sender: TObject);
begin
  if odsIssl.Active = False then
    odsIssl.Active := True;
  tvIssl.RestoreFromRegistry('\SoftWare\SoftMaster\List_RHMDL\fDelMany\cxGrSotr_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'grIssl');
end;

procedure TfrmDelManyMetodics.odsIsslBeforeOpen(DataSet: TDataSet);
begin
  odsIssl.SetVariable('pfk_rhmdlid', frmMain.odsMain.FieldByName('fk_id').AsInteger);
end;

procedure TfrmDelManyMetodics.tvIsslCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[tvIssl_Nazsosid.Index] = frmMain.get_vipnaz then
    ACanvas.Brush.Color := rgb(254, 169, 156)
  else
    ACanvas.Brush.Color := rgb(190, 255, 125);
end;

end.
