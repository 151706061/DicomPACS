unit fSpisokSms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, dxSkinsdxBarPainter, dxBar, cxClasses, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ActnList, Oracle, cxLabel, cxContainer,
  cxProgressBar, ExtCtrls;

type
  TfrmSpisokSms = class(TForm)
    grSpisokLevel1: TcxGridLevel;
    grSpisok: TcxGrid;
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbSend: TdxBarButton;
    bbClose: TdxBarButton;
    tvSpisok: TcxGridTableView;
    tvSpisok_FIO: TcxGridColumn;
    tvSpisok_Last: TcxGridColumn;
    tvSpisok_Plan: TcxGridColumn;
    al: TActionList;
    aSend: TAction;
    aClose: TAction;
    tvSpisok_Phone: TcxGridColumn;
    oqSendSms: TOracleQuery;
    paPb: TPanel;
    pbSend: TcxProgressBar;
    cxLabel1: TcxLabel;
    procedure aSendExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
  private
    br : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSpisokSms: TfrmSpisokSms;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSpisokSms.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSpisokSms.aSendExecute(Sender: TObject);
var i : Integer;
begin
  Screen.Cursor := crHourGlass;
  paPb.Visible := True;
  Application.ProcessMessages;
  br := False;
  pbSend.Position := 0;
  pbSend.Properties.Max := tvSpisok.DataController.RecordCount;
  try
    aSend.Enabled := False;
    aClose.Enabled := False;
    tvSpisok.DataController.GotoFirst;
    for i := 0 to tvSpisok.DataController.RecordCount-1 do
      begin
        if br = True then
          exit;
        oqSendSms.SetVariable('pfc_phone', tvSpisok.DataController.Values[tvSpisok.DataController.GetFocusedRecordIndex, tvSpisok_Phone.Index]);
        oqSendSms.Execute;
        tvSpisok.DataController.GotoNext;
        pbSend.Position := pbSend.Position + 1;
        Application.ProcessMessages;
      end;
  finally
    frmMain.os.Commit;
    Screen.Cursor := crDefault;
    aSend.Enabled := True;
    aClose.Enabled := True;
    paPb.Visible := False;
  end;
end;

end.
