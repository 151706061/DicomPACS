unit fEditPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, ActnList,
  dxBar, cxClasses, ImgList, ExtCtrls, cxGraphics, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxLabel, DB, OracleData, Oracle, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmEditPeriod = class(TForm)
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    alOkCancel: TActionList;
    ImageList1: TImageList;
    BMBar1: TdxBar;
    bbOk: TdxBarButton;
    bbCancel: TdxBarButton;
    aOk: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxCompanyName: TcxTextEdit;
    cxMonth: TcxLookupComboBox;
    odsMonth: TOracleDataSet;
    dsMonth: TDataSource;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditPeriod: TfrmEditPeriod;

implementation
uses fMain, fCompanySet;
{$R *.dfm}

procedure TfrmEditPeriod.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmEditPeriod.aOkExecute(Sender: TObject);
var ods : TOracledataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_ID FROM TPERIOD_COMPANY WHERE FK_COMPANYID = :PFK_COMPANYID AND FK_OWNER = :PFK_OWNER AND FL_DEL = 0';
    ods.DeclareAndSet('PFK_COMPANYID', otInteger, frmCompanySet.odsCompany.FieldByName('FK_COMPANYID').AsInteger);
    ods.DeclareAndSet('PFK_OWNER', otInteger, cxMonth.EditValue);
    ods.Open;
    if ods.RecordCount > 0 then
      begin
        Application.MessageBox('¬ указанном периоде уже существует такое же предпри€тие!'+
        #13#10+'¬ы не можете перенести предпри€тие в период, в котором оно уже есть,'+
        ' иначе произойдет дублирование пациентов, закрепленных за этим предпри€тием!', '¬нимание!', MB_OK+MB_ICONWARNING);
        exit;
      end;
  finally
    ods.Free;
  end;
  ModalResult := mrOk;
end;

end.
