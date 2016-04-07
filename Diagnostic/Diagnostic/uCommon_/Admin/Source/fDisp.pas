unit fDisp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsdxBarPainter, dxSkinCaramel,
  dxSkinOffice2007Green, cxClasses, dxBar, cxCalendar, cxBarEditItem, ActnList,
  DB, OracleData, cxDBLookupComboBox, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxImageComboBox, cxLabel, cxButtonEdit, cxTextEdit, cxTimeEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, cxContainer, cxMaskEdit, cxDropDownEdit, ExtCtrls,
  dxBarExtItems, frxClass, frxDBSet;

type
  TfrmDisp = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbBack: TdxBarButton;
    bbForward: TdxBarButton;
    al: TActionList;
    aBack: TAction;
    aForward: TAction;
    bbClose: TdxBarButton;
    aClose: TAction;
    bbRefresh: TdxBarButton;
    aRefresh: TAction;
    odsJur: TOracleDataSet;
    dsJur: TDataSource;
    beTaxi: TcxBarEditItem;
    odsTaxi: TOracleDataSet;
    dsTaxi: TDataSource;
    bbPrint: TdxBarButton;
    aPrint: TAction;
    grJournal: TcxGrid;
    tvJournal: TcxGridDBTableView;
    VJOURNAL_IMAGE: TcxGridDBColumn;
    colFreeShow: TcxGridDBColumn;
    VJOURNAL_DOZVON: TcxGridDBColumn;
    VJOURNAL_DATEIN: TcxGridDBColumn;
    VJOURNAL_NUMTEL: TcxGridDBColumn;
    VJOURNAL_FROM: TcxGridDBColumn;
    VJOURNAL_KUDA: TcxGridDBColumn;
    VJOURNAL_NAMEDRV: TcxGridDBColumn;
    VJOURNAL_DRV: TcxGridDBColumn;
    VJOURNAL_FICS: TcxGridDBColumn;
    VJOURNAL_SUM: TcxGridDBColumn;
    colSos: TcxGridDBColumn;
    vJournal_ID: TcxGridDBColumn;
    colSos2: TcxGridDBColumn;
    colIsStop: TcxGridDBColumn;
    vJournal_DrvId1: TcxGridDBColumn;
    vJournal_DrvId2: TcxGridDBColumn;
    vJournal_Adr2Id: TcxGridDBColumn;
    colFl_Baggage: TcxGridDBColumn;
    vJournal_JurNum: TcxGridDBColumn;
    vJournal_FcNum: TcxGridDBColumn;
    vJournal_FlBonus: TcxGridDBColumn;
    vJournal_FkClientid: TcxGridDBColumn;
    vJournal_FnNow: TcxGridDBColumn;
    vJournal_FnStop: TcxGridDBColumn;
    vJournal_FlPeregon: TcxGridDBColumn;
    colKm1: TcxGridDBColumn;
    colKm2: TcxGridDBColumn;
    colTime: TcxGridDBColumn;
    vJournal_FdStop: TcxGridDBColumn;
    vJournal_NumDrv1: TcxGridDBColumn;
    vJournal_NumDrv2: TcxGridDBColumn;
    vJournal_NumTelFull: TcxGridDBColumn;
    vJournal_FkRaionID: TcxGridDBColumn;
    VJOURNAL_FkTypeDetail: TcxGridDBColumn;
    colSumF: TcxGridDBColumn;
    colSumFMG: TcxGridDBColumn;
    colComment: TcxGridDBColumn;
    colStopReal: TcxGridDBColumn;
    colFree: TcxGridDBColumn;
    grJournalLevel1: TcxGridLevel;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    paDate: TPanel;
    deDate: TcxDateEdit;
    frxList: TfrxReport;
    frxDBList: TfrxDBDataset;
    aEdit: TAction;
    bbEdit: TdxBarButton;
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure deDatePropertiesChange(Sender: TObject);
    procedure aBackExecute(Sender: TObject);
    procedure aForwardExecute(Sender: TObject);
    procedure beTaxiPropertiesEditValueChanged(Sender: TObject);
    procedure tvJournalCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure frxListGetValue(const VarName: string; var Value: Variant);
    procedure aEditExecute(Sender: TObject);
  private
    sDateSys_4Rep : string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDisp: TfrmDisp;

implementation
uses fMain, fEdit;
{$R *.dfm}

procedure TfrmDisp.aBackExecute(Sender: TObject);
begin
  deDate.EditValue:=deDate.EditValue-1;
end;

procedure TfrmDisp.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmDisp.aEditExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmEdit, frmEdit);
  try
    frmEdit.ShowModal;
  finally
    frmEdit.Free;
  end;
end;

procedure TfrmDisp.aForwardExecute(Sender: TObject);
begin
  deDate.EditValue:=deDate.EditValue+1;
end;

procedure TfrmDisp.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select to_char(sysdate, ''dd.mm.yyyy hh24:mi'') as datesys from dual ';
    ods.Open;
    sDateSys_4Rep := ods.FieldByName('datesys').AsString;
  finally
    ods.Free;
  end;
  frxList.ShowReport;
end;

procedure TfrmDisp.aRefreshExecute(Sender: TObject);
begin
  odsJur.Close;
  odsJur.SetVariable('pfk_taxiid', beTaxi.EditValue);
  odsJur.SetVariable('pfd_date', deDate.Date);
  odsJur.Open;
end;

procedure TfrmDisp.beTaxiPropertiesEditValueChanged(Sender: TObject);
begin
  aRefreshExecute(nil);
end;

procedure TfrmDisp.deDatePropertiesChange(Sender: TObject);
begin
  aRefreshExecute(nil);
end;

procedure TfrmDisp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmDisp.FormCreate(Sender: TObject);
begin
  if odsTaxi.Active = False then
    odsTaxi.Active := True;
  deDate.Date := Date;
end;

procedure TfrmDisp.FormDestroy(Sender: TObject);
begin
  frmDisp := nil;
end;

procedure TfrmDisp.frxListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'DATE' then Value := deDate.Date;
  if VarName = 'DATESYS' then Value := sDateSys_4Rep;
  if VarName = 'VSEGO' then Value := odsJur.RecordCount;
  if VarName = 'SUMMA' then Value := tvJournal.DataController.Summary.FooterSummaryValues[1];
end;

procedure TfrmDisp.tvJournalCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var ARec : TRect;
    icolor : Tcolor;
begin
  if AViewInfo.GridRecord.Values[colSos.Index] = 1 then // закрыт - фиолетовый
    ACanvas.Brush.Color := RGB(251, 172, 249);
  if AViewInfo.GridRecord.Values[colSos.Index] = 2 then // пропущен
    ACanvas.Brush.Color := clSilver;
  if AViewInfo.GridRecord.Values[colSos.Index] = 3 then // неоплата - серый
    ACanvas.Brush.Color := clSilver;
  if AViewInfo.GridRecord.Values[colSos.Index] = 4 then // неоплата - красный
    ACanvas.Brush.Color := RGB(255, 174, 174);
  if AViewInfo.GridRecord.Values[colSos.Index] = 5 then // невыход - серый
    ACanvas.Brush.Color := clSilver;
  if AViewInfo.GridRecord.Values[colSos.Index] = 6 then // оплата за выход - фиолетовый
    ACanvas.Brush.Color := RGB(251, 172, 249);
  if AViewInfo.GridRecord.Values[colSos.Index] = 8 then // обрабатывается  - синий
    ACanvas.Brush.Color := RGB(145, 166, 238);
  if (AViewInfo.GridRecord.Values[colSos.Index] = 9) and (AViewInfo.GridRecord.Values[colSos2.Index] = 0) then // предварительный -- оранжевый
    ACanvas.Brush.Color := RGB(255, 209, 164);
  if (AViewInfo.GridRecord.Values[colSos.Index] = 9) and (AViewInfo.GridRecord.Values[colSos2.Index] = 1) then // новый -- зелёный
    ACanvas.Brush.Color := RGB(174, 253, 170);

  if (AViewInfo.GridRecord.Values[colIsStop.Index] = 1) or (AViewInfo.GridRecord.Values[colIsStop.Index] = 2) then // остановлен - желтый
    ACanvas.Brush.Color:=RGB(255, 255, 102);

  if (AViewInfo.Selected) or (AViewInfo.Focused) then
    begin
      ARec := AViewInfo.RecordViewInfo.Bounds;
      icolor := ACanvas.Brush.Color;
      ACanvas.Brush.Color := clBlue;
      ACanvas.FrameRect(ARec, clMaroon, 4, [bLeft..bBottom], True);
      ACanvas.Brush.Color := icolor;
      ACanvas.Pen.Color := icolor;
      AViewInfo.Borders := [];
      ACanvas.Font.Color := clBlack;
    end;
end;

end.
