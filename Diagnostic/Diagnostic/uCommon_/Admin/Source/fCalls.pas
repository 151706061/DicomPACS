unit fCalls;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, dxSkinsCore, dxSkinCaramel,
  dxSkinOffice2007Green, cxControls, cxInplaceContainer, cxVGrid, ExtCtrls,
  cxCalendar, cxDropDownEdit, cxDBLookupComboBox, cxSpinEdit, cxCheckBox,
  cxContainer, cxLabel, JvExControls, JvAnimatedImage, JvGIFCtrl, cxSplitter,
  dxSkinsdxBarPainter, dxBar, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, cxClasses, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxBarExtItems, Oracle, OracleData, ActnList, cxMaskEdit, Menus, cxGridExportLink;

type
  TfrmCalls = class(TForm)
    paLeft: TPanel;
    vgrFilters: TcxVerticalGrid;
    catFilters: TcxCategoryRow;
    rowDate1: TcxEditorRow;
    rowDate2: TcxEditorRow;
    rowType: TcxEditorRow;
    rowTaxi: TcxEditorRow;
    rowDop: TcxCategoryRow;
    merTime: TcxMultiEditorRow;
    rowMissing: TcxEditorRow;
    cxSplitter2: TcxSplitter;
    paSubParam: TPanel;
    Animator1: TJvGIFAnimator;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxSplitter1: TcxSplitter;
    BM: TdxBarManager;
    paRight: TPanel;
    grList: TcxGrid;
    tvList: TcxGridDBTableView;
    grListLevel1: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbRefresh: TdxBarLargeButton;
    bbClose: TdxBarLargeButton;
    odsTaxi: TOracleDataSet;
    dsTaxi: TDataSource;
    al: TActionList;
    aClose: TAction;
    aRefresh: TAction;
    colDate: TcxGridDBColumn;
    colTimeSpeak: TcxGridDBColumn;
    colTimeRing: TcxGridDBColumn;
    colNum: TcxGridDBColumn;
    colTaxi: TcxGridDBColumn;
    colIO: TcxGridDBColumn;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    colPhone: TcxGridDBColumn;
    rowPhone: TcxEditorRow;
    bbPrint: TdxBarLargeButton;
    aPrint: TAction;
    pmGrid: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    aExpXLS: TAction;
    aExpXLS1: TMenuItem;
    sdPopUp: TSaveDialog;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure rowTypeEditPropertiesChange(Sender: TObject);
    procedure aExpXLSExecute(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalls: TfrmCalls;

implementation
uses fMain;
{$R *.dfm}
const
  sqlOds = ' select fd_date, '+#13+
           '        fc_duration, '+#13+
           '        fn_time, '+#13+
           '        fc_cli, '+#13+
           '        fc_direction, '+#13+
           '        fc_name_p1, '+#13+
           '        fc_ddi1 '+#13+
           '   from taxi.tcalls '+#13+
           '  where fd_date >= :pfd_date1 '+#13+
           '    and fd_date <= :pfd_date2 ';
           
procedure TfrmCalls.aCloseExecute(Sender: TObject);
begin
  tvList.StoreToRegistry('\SoftWare\TaxiService\Admin\fCalls', True, [], 'tvList');
  close;
end;

procedure TfrmCalls.aExpXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    ExportGridToExcel(sdPopUp.FileName, grList, True, True);
end;

procedure TfrmCalls.aRefreshExecute(Sender: TObject);
begin
  vgrFilters.SetFocus;
  odsList.DeleteVariables;
  odsList.Close;
  odsList.SQL.Text := sqlOds;
// -- Тип звонка
  if rowType.Properties.Value <> Null then
    begin
      if rowType.Properties.Value = 'Входящий внешний' then
        begin
          odsList.SQL.Add(' and ((fc_direction = ''I'') and (fn_inside = 0)) ');
        end;
      if rowType.Properties.Value = 'Внутренний' then
        begin
          odsList.SQL.Add(' and ((fc_direction = ''O'') and (fn_inside = 1)) ');
        end;
      if rowType.Properties.Value = 'Исходящий внешний' then
        begin
          odsList.SQL.Add(' and ((fc_direction = ''O'') and (fn_inside = 0)) ');
        end;
    end;
// -- Телефон
  if (rowPhone.Visible = True) and (rowPhone.Properties.Value <> null) and (rowPhone.Properties.Value <> '') then
    begin
      odsList.SQL.Add(' and fc_ddi1 = :pfc_ddi1 '); 
      odsList.DeclareAndSet('pfc_ddi1', otString, rowPhone.Properties.Value);
    end;
// -- Такси (проблемы с кодировкой)

// -- Время
  if (merTime.Properties.Editors[0].Value <> null) and (merTime.Properties.Editors[0].Value <> '') then
    begin
      odsList.SQL.Add(' and to_char(fd_date, ''hh24:mi'') >= :ptime1 ');
      odsList.SQL.Add(' and to_char(fd_date, ''hh24:mi'') <= :ptime2 ');
      odsList.DeclareAndSet('ptime1', otString, merTime.Properties.Editors[0].Value);
      odsList.DeclareAndSet('ptime2', otString, merTime.Properties.Editors[1].Value);
    end;
// -- Пропущенные
  if rowMissing.Properties.Value = 1 then
    begin
      odsList.SQL.Add(' and fc_duration = ''00:00:00'' ');
    end;
// -- Даты
  odsList.DeclareAndSet('pfd_date1', otDate, VarToDateTime(rowDate1.Properties.Value));
  odsList.DeclareAndSet('pfd_date2', otDate, VarToDateTime(rowDate2.Properties.Value+' 23:59:59'));
  odsList.Open;
end;

procedure TfrmCalls.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCalls.FormCreate(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select to_char(sysdate, ''dd.mm.yyyy'') as datesys from dual ';
    ods.Open;
    rowDate1.Properties.Value := ods.FieldByName('datesys').AsVariant;
    rowDate2.Properties.Value := ods.FieldByName('datesys').AsVariant;
  finally
    ods.Free;
  end;
  if odsTaxi.Active = False then
    odsTaxi.Active := True;
  tvList.StoreToRegistry('\SoftWare\TaxiService\Admin\fCalls_Default', TRUE, [], 'tvList');
  tvList.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fCalls', FALSE, FALSE, [], 'tvList');
end;

procedure TfrmCalls.FormDestroy(Sender: TObject);
begin
  frmCalls := nil;
end;

procedure TfrmCalls.N2Click(Sender: TObject);
begin
  tvList.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fCalls_Default', FALSE, FALSE, [], 'tvList');
end;

procedure TfrmCalls.rowTypeEditPropertiesChange(Sender: TObject);
begin
  rowPhone.Visible := rowType.Properties.Value = 'Входящий внешний';
end;

end.
