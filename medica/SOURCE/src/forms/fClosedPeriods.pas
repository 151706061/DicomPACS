unit fClosedPeriods;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, OracleData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Oracle;

type
  TfrmClosedPeriods = class(TForm)
    ilCloseOeriods: TImageList;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbtPodpis: TToolButton;
    ToolButton7: TToolButton;
    tbtAdd: TToolButton;
    tbtEdit: TToolButton;
    tbtDel: TToolButton;
    ToolButton9: TToolButton;
    tbtRefresh: TToolButton;
    ToolButton5: TToolButton;
    tbtClose: TToolButton;
    cxGrid: TcxGrid;
    tvMain: TcxGridDBTableView;
    lvMain: TcxGridLevel;
    odsClosedPeriods: TOracleDataSet;
    dsClosedPeriods: TDataSource;
    tvMainFK_ID: TcxGridDBColumn;
    tvMainFD_BEGIN: TcxGridDBColumn;
    tvMainFD_END: TcxGridDBColumn;
    tvMainFL_PODPIS: TcxGridDBColumn;
    tvMainFC_PODPIS: TcxGridDBColumn;
    tvMainFK_MO: TcxGridDBColumn;
    tvMainFD_DATE: TcxGridDBColumn;
    tvMainFC_MO: TcxGridDBColumn;
    oqAdd: TOracleQuery;
    oqEdit: TOracleQuery;
    oqDel: TOracleQuery;
    oqSign: TOracleQuery;
    procedure tbtCloseClick(Sender: TObject);
    procedure tbtRefreshClick(Sender: TObject);
    procedure tbtAddClick(Sender: TObject);
    procedure tbtEditClick(Sender: TObject);
    procedure tbtDelClick(Sender: TObject);
    procedure odsClosedPeriodsAfterOpen(DataSet: TDataSet);
    procedure odsClosedPeriodsAfterScroll(DataSet: TDataSet);
    procedure tbtPodpisClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoShowClosedPeriods();

var
  frmClosedPeriods: TfrmClosedPeriods;

implementation

uses fdmMain,fmainform, fgetperiod;

{$R *.dfm}         

procedure DoShowClosedPeriods();
begin
  frmClosedPeriods := TfrmClosedPeriods.Create(Application);

  frmClosedPeriods.ShowModal;
  frmClosedPeriods.Free;
end;

procedure TfrmClosedPeriods.FormCreate(Sender: TObject);
begin
  odsClosedPeriods.Close;
  odsClosedPeriods.Open;
end;

procedure TfrmClosedPeriods.odsClosedPeriodsAfterOpen(DataSet: TDataSet);
begin
  tbtEdit.Enabled := (odsClosedPeriods.RecordCount > 0) and (odsClosedPeriods.FieldByName('FL_PODPIS').AsInteger <> 1);
  tbtDel.Enabled := (odsClosedPeriods.RecordCount > 0) and (odsClosedPeriods.FieldByName('FL_PODPIS').AsInteger <> 1);
  tbtPodpis.Enabled := odsClosedPeriods.RecordCount > 0;
end;

procedure TfrmClosedPeriods.odsClosedPeriodsAfterScroll(DataSet: TDataSet);
begin
  if odsClosedPeriods.FieldByName('FL_PODPIS').AsInteger = 0 then
  begin
    tbtPodpis.Caption := 'Подписать';
    tbtPodpis.Hint := 'Закрыть период';
    tbtPodpis.ImageIndex := 5;
    tbtPodpis.Tag := 0;
  end
  else
  begin
    tbtPodpis.Caption := 'Снять подпись';
    tbtPodpis.Hint := 'Открыть период';    
    tbtPodpis.ImageIndex := 6;
    tbtPodpis.Tag := 1;
  end;
  tbtEdit.Enabled := odsClosedPeriods.FieldByName('FL_PODPIS').AsInteger <> 1;
  tbtDel.Enabled := odsClosedPeriods.FieldByName('FL_PODPIS').AsInteger <> 1;
end;

procedure TfrmClosedPeriods.tbtAddClick(Sender: TObject);
begin
  with Tfrmgetperiod.Create(Self) do
  try
    if ShowModal = mrok then
    begin
      oqAdd.SetVariable('pDate1', dDate1.date);
      oqAdd.SetVariable('pDate2', dDate2.date);
      oqAdd.Execute;
      dmMain.os.Commit;
      odsClosedPeriods.Refresh;
      odsClosedPeriods.Locate('FK_ID',oqAdd.GetVariable('pID'),[]);
    end;
  finally
    Free;
  end;
end;

procedure TfrmClosedPeriods.tbtCloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmClosedPeriods.tbtDelClick(Sender: TObject);
begin
  if Application.MessageBox('Вы действительно хотите удалить период?','Подтверждение',MB_ICONQUESTION+MB_YESNOCANCEL) <> ID_YES then exit;
  try
    oqDel.SetVariable('pID', odsClosedPeriods.FieldByName('FK_ID').AsInteger);
    oqDel.Execute;
    dmMain.os.Commit;
    odsClosedPeriods.Refresh;
  finally
  end;
end;

procedure TfrmClosedPeriods.tbtEditClick(Sender: TObject);
begin
  if Application.MessageBox('Вы действительно хотите изменить период?','Подтверждение',MB_ICONQUESTION+MB_YESNOCANCEL) <> ID_YES then exit;
  with Tfrmgetperiod.Create(Self) do
  try
    dDate1.date := odsClosedPeriods.FieldByName('FD_BEGIN').AsDateTime;
    dDate2.date := odsClosedPeriods.FieldByName('FD_END').AsDateTime;
    if ShowModal = mrok then
    begin
      oqEdit.SetVariable('pDate1', dDate1.date);
      oqEdit.SetVariable('pDate2', dDate2.date);  
      oqEdit.SetVariable('pID', odsClosedPeriods.FieldByName('FK_ID').AsInteger);
      oqEdit.Execute;
      dmMain.os.Commit;
      odsClosedPeriods.Refresh;
      odsClosedPeriods.Locate('FK_ID',oqEdit.GetVariable('pID'),[]);
    end;
  finally
    Free;
  end;
end;

procedure TfrmClosedPeriods.tbtPodpisClick(Sender: TObject);
begin
  try
    oqSign.SetVariable('pID', odsClosedPeriods.FieldByName('FK_ID').AsInteger);
    if tbtPodpis.Tag = 0 then
      oqSign.SetVariable('pPodpis', 1)
    else                              
      oqSign.SetVariable('pPodpis', 0);
    oqSign.Execute;
    dmMain.os.Commit;
    odsClosedPeriods.Refresh;  
    odsClosedPeriods.Locate('FK_ID',oqEdit.GetVariable('pID'),[]);
  finally
  end;
end;

procedure TfrmClosedPeriods.tbtRefreshClick(Sender: TObject);
begin
  odsClosedPeriods.Refresh;
end;

end.
