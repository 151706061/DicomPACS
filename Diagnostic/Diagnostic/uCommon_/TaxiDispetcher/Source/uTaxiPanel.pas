unit uTaxiPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGridTableView, cxGrid, cxGridLevel, cxLookAndFeels,
  cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridDBTableView,
  Oracle, OracleData, Menus, cxTextEdit, DateUtils;

type
  TRaion = record
    id:Integer;
    name:string;
    order:variant;
    key:string;
  end;

  TPlace = record
    id:Integer;
    name:string;
    fullname:string;
    isplat:boolean;
    comment:string;
    cost:integer;
    raion:TRaion;
  end;

  TCaptionPanel = class(TPanel)
  public
    constructor Create(AOwner:TWinControl; ACaption:string);
    procedure MyDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure MyDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
  end;

  TGridPanel = class;
  TTaxiPanel = class;

  TCommonPanel = class(TPanel)
  private
    FMaxGridOnLine:Integer;
    FMaxGridOnLinePlace:Integer;
    FLevelHeight:Integer;
    FPlaceLevelHeight:Integer;
    FOs:TOracleSession;
    FTaxiId:Integer;
    FCurrentPanel:TGridPanel;
    FPopUp:TPopupMenu;
    FIsRefreshNow:Boolean;
    FShowAllTaxi:Boolean;
    FOwnerView:TcxGridDBTableView;
    FMainView:TcxGridDBTableView;
    FOwner: TCommonPanel;
    FSelectedRaion : Integer;

    procedure SetMaxGridOnLine(value:Integer);
    procedure SetMaxGridOnLinePlace(value:Integer);
    function GetGridWidth:Integer;
    procedure SetLevelHeight(value:Integer);
    procedure SetPlaceLevelHeight(value:Integer);
    procedure SetPopUp(value:TPopupMenu);
    procedure SetShowAllTaxi(value:Boolean);
    function GetOwnerOds():TOracleDataSet;
    function GetMainView():TOracleDataSet;
    function GetTaxiPanel():TTaxiPanel;
  protected
    FChilds: array of TCommonPanel;
    procedure SetOwnerView(value:TcxGridDBTableView);virtual;
    procedure SetMainView(value:TcxGridDBTableView);
    procedure SetCurrentPanel(value:TGridPanel);virtual;
    procedure SetSelectedRaion(value:Integer);virtual;
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy();override;
    function GetCurrentDate():TDateTime;
    function GetDriverByPosiv(APosivnoy:string):Integer;
    procedure ChangeTaxiEvent(Adriver:Integer; AEventSyn:string; AToPlace:Variant; Ajournal:Variant);
    procedure RefreshAllOds();
    procedure SelectDriver(ADriverId:Integer);virtual;
    procedure DoResize();virtual;
    procedure tvCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    function GetViewColumnByFieldName(Atv: TcxGridDBTableView; AColumnName:string):TcxGridDbColumn;
    procedure MoveTaxiToPlace(Adriver:Integer; AToPlace:Integer);    

    property GridWidth:Integer read GetGridWidth;
    property MaxGridOnLine:Integer read FMaxGridOnLine write SetMaxGridOnLine;
    property MaxGridOnLinePlace:Integer read FMaxGridOnLinePlace write SetMaxGridOnLinePlace;
    property LevelHeight:Integer read FLevelHeight write SetLevelHeight;
    property PlaceLevelHeight:Integer read FPlaceLevelHeight write SetPlaceLevelHeight;
    property CurrentPanel:TGridPanel read FCurrentPanel write SetCurrentPanel;
    property PopUp:TPopupMenu read FPopUp write SetPopUp;
    property ShowAllTaxi:Boolean read FShowAllTaxi write SetShowAllTaxi;
    property Os:TOracleSession read FOs write FOs;
    property TaxiId:Integer read FTaxiId write FTaxiId;
    property OwnerView:TcxGridDBTableView read FOwnerView write SetOwnerView;
    property MainView:TcxGridDBTableView read FMainView write SetMainView;
    property OwnerOds:TOracleDataSet read GetOwnerOds;
    property MainViewOds:TOracleDataSet read GetMainView;
    property Owner:TCommonPanel read FOwner write FOwner;
    property SelectedRaion:Integer read FSelectedRaion write SetSelectedRaion;
    property TaxiPanel:TTaxiPanel read GetTaxiPanel;
  end;

  TGridPanel = class(TCommonPanel)
  private
    FGrid:TcxGrid;
    FView:TcxGridDBTableView;
    FCaptionPanel:TCaptionPanel;
    FPanelOds: TOracleDataSet;
    FDataSource: TDataSource;
    FTimer:TTimer;

    procedure OnTimer(Sender:TObject);
  protected
    function CreateColumn(ACaption:string; AFieldName:string; AVisible:Boolean):TcxGridDBColumn;
    procedure MyOnEnter(Sender: TObject);
    procedure MyDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure MyDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure OnLineCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure OnLineCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure OnLineCellClickCommon(Sender: TcxCustomGridTableView;
          ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
          AShift: TShiftState; var AHandled: Boolean;IsDblClick:Boolean);
    procedure OnFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure MyMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    function GetOdsSql():string;virtual;
  public
    constructor Create(AOwner:TComponent; APanelOwner:TCommonPanel);virtual;
    destructor Destroy();override;
    property Grid:TcxGrid read FGrid write FGrid;
    property View:TcxGridDBTableView read FView write FView;
    property CaptionPanel:TCaptionPanel read FCaptionPanel write FCaptionPanel;
    property PanelOds: TOracleDataSet read FPanelOds write FPanelOds;
    property DataSource: TDataSource read FDataSource write FDataSource;
  end;

  TPlaceLevelPanel = class(TPanel)
    constructor CreatePanel(AOwner:TComponent;ALevelHeight:Integer);
  end;

  TRaionPanel = class(TGridPanel)
  private
    FRaion:TRaion;
    FPlaceLevelPanel:array of TPlaceLevelPanel;
  protected
    function GetOdsSql():string;override;
    procedure DoResize();override;
    procedure SetSelectedRaion(value:Integer);override;
  public
    constructor Create(AOwner:TComponent; APanelOwner:TCommonPanel);override;
    destructor Destroy();override;
    procedure CreateChilds(Aos:TOracleSession; ATaxiId:Integer; ARaion: TRaion);

    property Raion:TRaion read FRaion write FRaion;
  end;

  TPlacePanel = class(TGridPanel)
  private
    FPlace:TPlace;
  protected
    function GetOdsSql():string;override;
  public
    procedure DoResize();override;
    constructor Create(AOwner:TComponent; APanelOwner:TCommonPanel);override;
    destructor Destroy();override;
    procedure Init(Aos:TOracleSession; ATaxiId:Integer; APlace: TPlace);
    property Place:TPlace read FPlace write FPlace;
  end;

  TTaxiPanel = class(TCommonPanel)
  protected
    procedure SetOwnerView(value:TcxGridDBTableView);override;
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy();override;
    procedure CreateChilds(Aos:TOracleSession; ATaxiId:Integer; AOwnerView:TcxGridDBTableView);
    procedure ChangeSelectedTaxiEvent(AEventSyn:string);
    function GetSelectedTaxiId():Integer;
    procedure DoResize();
    function GetCurrentDriverId:Variant;
  end;

  procedure ChangeTaxiEventCommon(AOs:TOracleSession; Adriver:Integer; AEventSyn:string; AToPlace:Variant; Ajournal:Variant);  
implementation

uses uNeedMove;

procedure CopyRaion(src:TRaion;var dst:TRaion);
begin
  with dst do
  begin
    id := src.id;
    name := src.name;
    order := src.order;
    key := src.key;
  end;
end;

procedure CopyPlace(src:TPlace;var dst:TPlace);
begin
  with dst do
  begin
    id := src.id;
    name := src.name;
    fullname := src.fullname;
    isplat := src.isplat;
    comment := src.comment;
    cost := src.cost;
    CopyRaion(src.raion,raion);
  end;
end;


procedure ChangeTaxiEventCommon(AOs:TOracleSession; Adriver:Integer; AEventSyn:string; AToPlace:Variant; Ajournal:Variant);
begin
  with TOracleQuery.Create(nil) do
    begin
      try
        Session := AOs;
        if AEventSyn = 'GO_FROM_CAR' then
          begin
            SQL.Text := ' insert into taxi.tdriverevent(fk_driver, fk_drivereventtype, fk_place, fk_journal) '+#13+
                        ' values(:pdriver, (select max(fk_id) from taxi.ts_drivereventtype t where t.fc_synonym = :psyn), '+#13+
                        '        (select fk_place from taxi.ts_drivers where fk_id = :pdriver), :pjurnal) ';
            DeclareAndSet('pdriver', otInteger, Adriver);
            DeclareAndSet('psyn', otString, AEventSyn);
            if VarToStr(Ajournal) = '' then
              begin
                DeclareAndSet('pjurnal', otInteger, null);
              end else
              begin
                DeclareAndSet('pjurnal', otInteger, Ajournal);
              end;
            Execute;
            AOs.Commit;
          end else
          begin
            SQL.Text := ' insert into taxi.tdriverevent(fk_driver, fk_drivereventtype, fk_place, fk_journal) '+#13+
                        ' values(:pdriver, (select max(fk_id) from taxi.ts_drivereventtype t where t.fc_synonym = :psyn), :pplace, :pjurnal) ';
            DeclareAndSet('pdriver', otInteger, Adriver);
            DeclareAndSet('pplace', otInteger, AToPlace);
            DeclareAndSet('psyn', otString, AEventSyn);
            if VarToStr(Ajournal) = '' then
              begin
                DeclareAndSet('pjurnal', otInteger, null);
              end else
              begin
                DeclareAndSet('pjurnal', otInteger, Ajournal);
              end;
            Execute;
            AOs.Commit;
          end;
      finally
        free;
      end;
    end;
end;

procedure MoveTaxiToPlaceCommon(AOs:TOracleSession; Adriver:Integer; AToPlace:Integer);
begin
  ChangeTaxiEventCommon(AOs, Adriver, 'MOVED', AToPlace, null);
end;

function GetIsPlaceIsRaion(AOS:TOracleSession; ARaion:Integer):Boolean;
begin
  with TOracleDataSet.Create(aos) do
  begin
    try
      Session:= AOS;
      SQL.Text := 'select s.fk_id from taxi.ts_raion s where s.fk_id = :pplace';
      DeclareAndSet('pplace',otInteger,ARaion);
      Open;
      Result := RecordCount > 0;
    finally
      Free;
    end;
  end;
end;
//
procedure UpdateDriverArive(AOS:TOracleSession; ADriver:Integer; IsRaion:Boolean; AOldTime:TDateTime);
var
  newtime:TDateTime;
begin
  newtime := IncSecond(AOldTime, 1);
  with TOracleQuery.Create(nil) do
  begin
    try
      Session := AOs;
      if (IsRaion) then
      begin
        SQL.Text := 'update taxi.ts_drivers s set s.fd_raionarive = :ptime where fk_id = :driver'
      end
      else begin
        SQL.Text := 'update taxi.ts_drivers s set s.fd_placearive = :ptime where fk_id = :driver'
      end;
      DeclareAndSet('driver', otInteger, Adriver);
      DeclareAndSet('ptime', otDate, newtime);
      Execute;
      AOs.Commit;
    finally
      Free;
    end;
  end;
end;

procedure UpdateDriverOrder(AOS:TOracleSession; ADriver:Integer; IsRaion:Boolean; ANewOrder:Double);
begin
  with TOracleQuery.Create(nil) do
  begin
    try
      Session := AOs;
      if (IsRaion) then
      begin
        SQL.Text := 'update taxi.ts_drivers s set s.fn_raionorder = :porder where fk_id = :driver'
      end
      else begin
        SQL.Text := 'update taxi.ts_drivers s set s.fn_placeorder = :porder where fk_id = :driver'
      end;
      DeclareAndSet('driver', otInteger, Adriver);
      DeclareAndSet('porder', otFloat, ANewOrder);
      Execute;
      AOs.Commit;
    finally
      Free;
    end;
  end;
end;

function GetDriverArrive(AOS:TOracleSession; ADriver:Integer; IsRaion:Boolean):TDateTime;
begin
  with TOracleDataSet.Create(aos) do
  begin
    try
      Session:= AOS;
      SQL.Text := 'select d.fd_placearive, d.fd_raionarive from taxi.ts_drivers d where d.fk_id = :driver';
      DeclareAndSet('driver',otInteger,ADriver);
      Open;
      if (IsRaion) then
      begin
        Result := FieldByName('fd_raionarive').AsDateTime;
      end
      else begin
        Result := FieldByName('fd_placearive').AsDateTime;
      end;
    finally
      Free;
    end;
  end;
end;

constructor TCommonPanel.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  MaxGridOnLine := 3;
  MaxGridOnLinePlace := 3;
  LevelHeight := 215;
  PlaceLevelHeight := 200; // Fenix высота гридов-стоянок  
  FIsRefreshNow:=false;
  ControlStyle := ControlStyle + [csOpaque];
  DoubleBuffered:=True;
  FullRepaint := false;
end;

destructor TCommonPanel.Destroy();
begin
  SetLength(FChilds, 0);
  inherited;
end;

function TCommonPanel.GetCurrentDate():TDateTime;
begin
  with TOracleDataSet.Create(self) do
  begin
    try
      Session := FOs;
      SQL.Text := 'select sysdate fd_date from dual';
      Open;
      Result := FieldByName('fd_date').AsDateTime;
    finally
      Free;
    end;
  end;
end;

function TCommonPanel.GetDriverByPosiv(APosivnoy:string):Integer;
begin
  with TOracleDataSet.Create(Self) do
    begin
      try
        Session := FOs;
        SQL.Text := ' select fk_id from taxi.ts_drivers d where d.fc_name = :pname and d.fk_taxiid = :taxiid';
        DeclareAndSet('pname', otInteger, APosivnoy);
        DeclareAndSet('taxiid', otString, TaxiId);
        Open;
        if (RecordCount > 0) then
          begin
            Result := FieldByName('fk_id').AsInteger;
          end else
          begin
            Result := -1;
          end;
      finally
        Free;
      end;
    end;
end;

procedure TCommonPanel.SetOwnerView(value:TcxGridDBTableView);
begin
  FOwnerView := value;
end;

procedure TCommonPanel.SetMainView(value:TcxGridDBTableView);
var
  I: Integer;
begin
  FMainView := value;
  for I := 0 to Length(FChilds) - 1 do
  begin
    if (FChilds[i]<>nil) then
      FChilds[i].MainView := value;
  end;
end;

procedure TCommonPanel.SetCurrentPanel(value:TGridPanel);
begin
  FCurrentPanel := value;
  if (Owner<>nil) then
  begin
    if (Self is TGridPanel) then
    begin
      Owner.CurrentPanel := Self as TGridPanel;
    end
    else begin
      Owner.CurrentPanel := value;
    end;
  end;
end;

procedure TCommonPanel.RefreshAllOds();
var
  I: Integer;
  DriverId, topline:Integer;
  GridPanel:TGridPanel;
begin
  if (Self is TGridPanel) then
  begin
    GridPanel := Self as TGridPanel;
    with GridPanel.PanelOds do
    begin
      if (Active) then
      begin
        DriverId := FieldByName('fk_id').AsInteger;
        topline := GridPanel.View.Controller.TopRowIndex;
        try
          DisableControls;
          Close;
          SQL.Text := GridPanel.GetOdsSql();
          Open;
          Locate('fk_id',DriverId,[]);
        finally
          EnableControls;
        end;
        GridPanel.View.Controller.TopRowIndex := topline;        
      end;
    end;
  end;

  for I := 0 to Length(FChilds) - 1 do
  begin
    if (FChilds[i]<>nil) then
      FChilds[i].RefreshAllOds();
  end;
end;

procedure TCommonPanel.ChangeTaxiEvent(Adriver:Integer; AEventSyn:string; AToPlace:Variant; Ajournal:Variant);
begin
  ChangeTaxiEventCommon(Os, Adriver, AEventSyn, AToPlace, Ajournal);
end;

procedure TCommonPanel.MoveTaxiToPlace(Adriver:Integer; AToPlace:Integer);
begin
  MoveTaxiToPlaceCommon(Os, Adriver, AToPlace);
end;

procedure TCommonPanel.SelectDriver(ADriverId:Integer);
var
  I: Integer;
  GridPanel:TGridPanel;
begin
  if (Self is TGridPanel) then
  begin
    GridPanel := Self as TGridPanel;
    GridPanel.View.Invalidate(true);
    if (GridPanel.PanelOds.Active) then
    begin
      if (GridPanel.PanelOds.Locate('fk_id', ADriverId,[])) then
      begin
        if (Owner<>nil) and (Self is TGridPanel) then
        begin
          Owner.CurrentPanel := Self as TGridPanel;
        end;
      end;
    end;
  end;
  for I := 0 to Length(FChilds) - 1 do
  begin
    if (FChilds[i]<>nil) then
      FChilds[i].SelectDriver(ADriverId);
  end;
end;

procedure TCommonPanel.DoResize();
var
  I: Integer;
begin
  for I := 0 to Length(FChilds) - 1 do
  begin
    if (FChilds[i]<>nil) then
      FChilds[i].DoResize();
  end;
end;

function TCommonPanel.GetViewColumnByFieldName(Atv: TcxGridDBTableView; AColumnName:string):TcxGridDbColumn;
var
  I:Integer;
begin
  Result := nil;
  for I:=0 to Atv.ColumnCount-1 do
  begin
      if AnsiSameText(Atv.Columns[I].DataBinding.FieldName, AColumnName) then
      begin
        Result:=Atv.Columns[I];
        Break;
      end;
  end;
end;

procedure TCommonPanel.tvCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  ARec: TRect;
  icolor, icolor2:Tcolor;
  iBesplatCnt:Integer;
  gColumn, gColumnTaxi:TcxGridDBColumn;
  tv:TcxGridDBTableView;
begin
  tv := Sender as TcxGridDBTableView;
  gColumn := GetViewColumnByFieldName(tv,'fn_besplatcnt');
  gColumnTaxi := GetViewColumnByFieldName(tv,'fk_taxiid');

  if (gColumn = nil) then
    Exit;
  if (gColumnTaxi = nil) then
    Exit;

  if AViewInfo.GridRecord.Values[gColumnTaxi.Index] <> TaxiId then
    Exit;

  if TryStrToInt(AViewInfo.GridRecord.Values[gColumn.Index], iBesplatCnt) then
  begin
    if (iBesplatCnt>0) then
    begin
      icolor2 := clBlue;
      if (iBesplatCnt=1) then
      begin
        icolor2 := clBlue;
      end;
      if (iBesplatCnt=2) then
      begin
        icolor2 := $00FF80FF;
      end;
      if (iBesplatCnt>2) then
      begin
        icolor2 := clRed;
      end;
      ARec := AViewInfo.RecordViewInfo.Bounds;
      icolor := ACanvas.Brush.Color;
      ACanvas.Brush.Color := icolor2;
      ACanvas.FrameRect(ARec,icolor2,2,[bLeft..bBottom],True);
      ACanvas.Brush.Color := icolor;
      ACanvas.Pen.Color := icolor;
      AViewInfo.Borders := [];
    end;
  end;
  ACanvas.Brush.Color := $CEE5C7;
  ACanvas.Pen.Color := clBlack;
  ACanvas.Font.Color := clBlack;

  gColumn := GetViewColumnByFieldName(tv,'fk_id');
  if (gColumn<>nil)and(MainViewOds<>nil) then
  begin
    if (AViewInfo.GridRecord.Values[gColumn.Index]= MainViewOds.FieldByName('fk_id').AsVariant) then
    begin
      ACanvas.Brush.Color := $5CA24E;
      ACanvas.Pen.Color := clWhite;
      ACanvas.Font.Color := clWhite;
    end;
  end;
end;

procedure TCommonPanel.SetMaxGridOnLine(value:integer);
var
  I: Integer;
begin
  if (value < 1) then
  begin
    FMaxGridOnLine := 1;
  end
  else begin
    FMaxGridOnLine := value;
  end;
  for I := 0 to Length(FChilds) - 1 do
  begin
    if (FChilds[i]<>nil) then
      FChilds[I].MaxGridOnLine := MaxGridOnLine;
  end;
end;

procedure TCommonPanel.SetMaxGridOnLinePlace(value:Integer);
var
  I: Integer;
begin
  if (value < 1) then
  begin
    FMaxGridOnLinePlace := 1;
  end
  else begin
    FMaxGridOnLinePlace := value;
  end;
  for I := 0 to Length(FChilds) - 1 do
  begin
    if (FChilds[I]<>nil) then    
      FChilds[I].MaxGridOnLinePlace := MaxGridOnLinePlace;
  end;
end;

procedure TCommonPanel.SetLevelHeight(value:Integer);
var
  I: Integer;
begin
  if (value < 1) then
  begin
    FLevelHeight := 1;
  end
  else begin
    FLevelHeight := value;
  end;
  for I := 0 to Length(FChilds) - 1 do
  begin
    if (FChilds[i]<>nil) then
      FChilds[I].LevelHeight := LevelHeight;
  end;
end;

procedure TCommonPanel.SetPlaceLevelHeight(value:Integer);
var
  I: Integer;
begin
  if (value < 1) then
  begin
    FPlaceLevelHeight := 1;
  end
  else begin
    FPlaceLevelHeight := value;
  end;
  for I := 0 to Length(FChilds) - 1 do
  begin
    if (FChilds[i]<>nil) then
      FChilds[I].PlaceLevelHeight := PlaceLevelHeight;
  end;
end;

procedure TCommonPanel.SetPopUp(value:TPopupMenu);
var
  I: Integer;
begin
  FPopUp := value;
  for I := 0 to Length(FChilds) - 1 do
  begin
    if (FChilds[i]<>nil) then
      FChilds[I].PopUp := PopUp;
  end;
end;

procedure TCommonPanel.SetShowAllTaxi(value:Boolean);
var
  I: Integer;
begin
  FShowAllTaxi := value;
  for I := 0 to Length(FChilds) - 1 do
  begin
    if (FChilds[i]<>nil) then
      FChilds[I].ShowAllTaxi := ShowAllTaxi;
  end;
end;

function TCommonPanel.GetOwnerOds():TOracleDataSet;
begin
   if (OwnerView<>nil) then
   begin
      Result := OwnerView.DataController.DataSource.DataSet as TOracleDataSet;
   end
   else begin
     Result := nil;
   end;
end;

function TCommonPanel.GetMainView():TOracleDataSet;
begin
   if (MainView<>nil) then
   begin
      Result := MainView.DataController.DataSource.DataSet as TOracleDataSet;
   end
   else begin
     Result := nil;
   end;
end;

function TCommonPanel.GetTaxiPanel():TTaxiPanel;
var
  panel:TCommonPanel;
begin
  panel := Self;
  while panel<>nil do
  begin
    if (panel is TTaxiPanel) then
    begin
      Result := panel as TTaxiPanel;
      Break;
    end;
    if (panel.Parent=nil) then
    begin
      panel := nil;
    end
    else begin
      if (panel.Parent is TCommonPanel) then
      begin
        panel := panel.Parent as TCommonPanel;
      end
      else begin
        panel := nil;
      end;
    end;
  end;
end;

procedure TCommonPanel.SetSelectedRaion(value:Integer);
var
   I:Integer;
begin
  FSelectedRaion := value;
  for I := 0 to Length(FChilds) - 1 do
  begin
    if (FChilds[i]<>nil) then
      FChilds[i].SelectedRaion := value;
  end;
end;

function TCommonPanel.GetGridWidth:Integer;
begin
  if (Parent<>nil) then
  begin
    Result := Round(Parent.Width/MaxGridOnLine);
  end
  else begin
    Result := 100;
  end;
end;

// -----------------------------------------------------------------------------
constructor TGridPanel.Create(AOwner:TComponent; APanelOwner:TCommonPanel);
var
  level: TcxGridLevel;
begin
  inherited Create(AOwner);
  Parent := AOwner as TWinControl;
  Owner := APanelOwner;
  CaptionPanel := TCaptionPanel.Create(Self, '');
  FTimer:= TTimer.Create(Self);
  FTimer.Interval := 100;
  FTimer.Enabled := false;
  FTimer.OnTimer := OnTimer;

  grid := TcxGrid.Create(Self);
  grid.ControlStyle := ControlStyle + [csOpaque];
  grid.DoubleBuffered:=True;
  grid.Font.Size:=10;
  grid.Parent := Self;
  grid.Align := alTop;
  grid.Height := 300; // высота гридов с машинами
  grid.OnEnter := MyOnEnter;
  level := grid.Levels.Add;
  View := TcxGridDBTableView.Create(level);
  View.DragMode := dmManual;
  View.OnDragOver :=  MyDragOver;
  View.OnDragDrop :=  MyDragDrop;
  View.OnCellDblClick := OnLineCellDblClick;
  View.OnFocusedRecordChanged:=OnFocusedRecordChanged;
  View.OnCellClick := OnLineCellClick;
  View.OnCustomDrawCell := tvCustomDrawCell;
  View.OnMouseDown := MyMouseDown;
  with View do
  begin
    OptionsView.ColumnAutoWidth := True;
    OptionsView.GroupByBox := False;
    OptionsData.Editing := False;
    OptionsView.GridLineColor := clWindow;
    OptionsView.DataRowHeight := 30;
    OptionsView.NoDataToDisplayInfoText:='';
    OptionsView.Header:=false;
  end;
  with grid do
  begin
    Top := 0;
  end;
  level.GridView := View;

  PanelOds := TOracleDataSet.Create(Self);
  PanelOds.Session := Os;
  DataSource := TDataSource.Create(Self);
  DataSource.DataSet := PanelOds;
  View.DataController.DataSource := DataSource;

  CreateColumn(' ', 'FC_NAME', false);
  CreateColumn('FK_ID', 'FK_ID', false);
  CreateColumn('taxiid', 'taxiid', false);
  CreateColumn('place', 'place', false);
  CreateColumn('fn_besplatcnt', 'fn_besplatcnt', false);
  CreateColumn(' ', 'fc_name_to_show', true);
  CreateColumn('fc_synonym', 'fc_synonym', false);
  CreateColumn('fk_taxiid', 'fk_taxiid', false);
end;

destructor TGridPanel.Destroy();
begin
  inherited;
end;

procedure TGridPanel.OnTimer(Sender:TObject);
begin
  MainViewOds.Locate('fk_id',PanelOds.FieldByName('fk_id').AsInteger,[]);
  FTimer.Enabled := false;
end;

function TGridPanel.CreateColumn(ACaption:string; AFieldName:string; AVisible:Boolean):TcxGridDBColumn;
begin
  Result:=View.CreateColumn;
  with Result do
  begin
    Caption := ACaption;
    DataBinding.FieldName := AFieldName;
    HeaderAlignmentHorz:=taCenter;
    Options.Editing:=False;
    Options.Sorting:=False;
    Options.Filtering:=False;
    Visible := AVisible;
    PropertiesClass:=TcxTextEditProperties;
    TcxTextEditProperties(Properties).Alignment.Horz:=taCenter;
  end;
end;

procedure TGridPanel.MyOnEnter(Sender: TObject);
begin
  if (Owner)<>nil then
  begin
    Owner.CurrentPanel := Self;
  end;
end;

procedure TGridPanel.MyDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if (GetKeyState(VK_LBUTTON) and 128)<>128 then
    (Sender as TcxGridSite).EndDrag(false);
  Accept := (Sender as TControl <> Source);
end;

procedure TGridPanel.MyDragDrop(Sender, Source: TObject; X, Y: Integer);
var ADroppedView, ASenderView : TcxGridDBTableView;
    ADriverId, APlaceId : Integer;
    odsFrom, odsTo : TOracleDataSet;
    gColumn : TcxGridDBColumn;
    prev_syn : string;
    journal_id : string;
    AHitTest : TcxCustomGridHitTest;
    place : Integer;
    driverbefore : Integer;
    driverbefore1_order, driverbefore2_order, neworder : double;
    frmNeedMove : TfrmNeedMove;
    ods : TOracleDataSet;
  procedure DoMoveOrder();
    var id1, id2 : Integer;
    begin
// -- 1
      if (GetIsPlaceIsRaion(Os, place)) then
        begin
          if odsTo.Locate('fk_id', driverbefore, []) then
            begin
              driverbefore1_order := odsTo.FieldByName('fn_raionorder').AsFloat;
              id1 := odsTo.FieldByName('fk_id').AsInteger;
              odsTo.Next;
              driverbefore2_order := odsTo.FieldByName('fn_raionorder').AsFloat;
              id2 := odsTo.FieldByName('fk_id').AsInteger;
              if (id1=id2) then
                begin
                  driverbefore2_order := driverbefore1_order + 2;
                end;

              neworder := driverbefore1_order+(driverbefore2_order - driverbefore1_order)/2;
              UpdateDriverOrder(os, ADriverId, true, neworder);
            end;
        end else
        begin
          if odsTo.Locate('fk_id', driverbefore, []) then
            begin
              if (odsTo.FieldByName('fn_placeorder').AsString<>'') then
                begin
                  driverbefore1_order := odsTo.FieldByName('fn_placeorder').AsFloat;
                end else
                begin
                  driverbefore1_order := odsTo.RecNo;
                end;
              id1 := odsTo.FieldByName('fk_id').AsInteger;
              odsTo.Next;
              if (odsTo.FieldByName('fn_placeorder').AsString<>'') then
                begin
                  driverbefore2_order := odsTo.FieldByName('fn_placeorder').AsFloat;
                end else
                begin
                  driverbefore2_order := odsTo.RecNo;
                end;
              id2 := odsTo.FieldByName('fk_id').AsInteger;
              if (id1=id2) then
                begin
                  driverbefore2_order := driverbefore1_order + 2;
                end;
              neworder := driverbefore1_order+(driverbefore2_order - driverbefore1_order)/2;
              UpdateDriverOrder(os, ADriverId, false, neworder);
            end;
        end;
// -- 2
      with odsTo do
        begin
          DisableControls;
          try
            Close;
            Open;
            Locate('fk_id', ADriverId, []);
          finally
            EnableControls;
          end;
        end;
  end;
begin

  ADroppedView:=nil;
  ASenderView:=nil;
  if Source is TcxDragControlObject then
    with TcxDragControlObject(Source) do
      if Control is TcxGridSite then
        with TcxGridSite(Control) do
          begin
            ADroppedView := GridView as TcxGridDBTableView;
          end;

  if Sender is TcxGridSite then
    with TcxGridSite(Sender) do
      begin
        ASenderView := GridView as TcxGridDBTableView;
      end;

  if (ADroppedView<>nil) and (ASenderView<>nil) then
  begin
    if (ADroppedView=ASenderView) then
    begin
      AHitTest :=  (Sender as TcxGridSite).ViewInfo.GetHitTest(X, Y);
      case AHitTest.HitTestCode of
        htCell:
          begin
            //сбросили на какой-то машине
            odsTo := ASenderView.DataController.DataSource.DataSet as TOracleDataSet;
            if (ADroppedView.DataController.Controller.SelectedRecordCount > 0) then
            begin
              ADriverId := ADroppedView.DataController.Controller.SelectedRecords[0].Values[1];

              place := odsTo.GetVariable('place');
              driverbefore := TcxGridRecordCellHitTest(AHitTest).GridRecord.Values[1];

              if (driverbefore = ADriverId) then
                Exit; //сбросили на себе самом же
              DoMoveOrder();
            end;
          end;
          else begin
            odsTo := ASenderView.DataController.DataSource.DataSet as TOracleDataSet;
            if (ADroppedView.DataController.Controller.SelectedRecordCount > 0) then
            begin
              ADriverId := ADroppedView.DataController.Controller.SelectedRecords[0].Values[1];
              if (odsTo.RecordCount = 1) then
                Exit; // чтобы не ставить за самим собой

              odsTo.Last;
              place := odsTo.GetVariable('place');
              driverbefore := odsTo.FieldByName('fk_id').AsInteger;
              DoMoveOrder();
            end;
          end;
      end;
      Exit;
    end;

    if (ADroppedView.DataController.Controller.SelectedRecordCount > 0) then
    begin
      if AdroppedView.Name = 'tvNotOnLine' then // если перетаскиваем из правого грида, то делаем проверку "есть ли уже такой таксист в сетке" // Prihodko
        begin
          ods := TOracleDataSet.Create(nil);
          try
            ods.Session := os;
            ods.SQL.Text := ' select t.fc_synonym, t.fc_name '+#13+
                            '   from (select t2.fc_synonym, (select fc_name from taxi.ts_drivers where fk_id = :pfk_driver) as fc_name '+#13+
                            '           from taxi.tdriverevent t1, taxi.ts_drivereventtype t2 '+#13+
                            '          where t1.fk_driver = :pfk_driver '+#13+
                            '            and t1.fk_drivereventtype = t2.fk_id '+#13+
                            '         order by t1.fk_id desc) t '+#13+
                            '  where rownum = 1 ';
            ods.DeclareAndSet('pfk_driver', otInteger, ADroppedView.DataController.Controller.SelectedRecords[0].Values[1]);
            ods.Open;
            if ods.FieldByName('fc_synonym').AsString = 'MOVED' then
              begin
                MessageDlg('Внимание!'+#13+#10+'Такой позывной уже есть в районах! ', mtInformation, [mbOK], 0);
                exit;
              end;
          finally
            ods.Free;
          end;
        end;
      odsFrom := ADroppedView.DataController.DataSource.DataSet as TOracleDataSet;
      odsTo := ASenderView.DataController.DataSource.DataSet as TOracleDataSet;
      if (odsFrom<>nil) and (odsTo<>nil) then
      begin
        ADriverId := ADroppedView.DataController.Controller.SelectedRecords[0].Values[1];
        APlaceId := odsTo.GetVariable('place');
        gColumn := GetViewColumnByFieldName(ADroppedView,'fc_synonym');
        if (gColumn<>nil) and (ADroppedView.DataController.Controller.SelectedRecordCount > 0) then
        begin
          prev_syn := ADroppedView.DataController.Controller.SelectedRecords[0].Values[gColumn.Index];
        end;

        if (prev_syn='START_CLIENT_MOVE') or (prev_syn='MOVE_TO_CLIENT') or (prev_syn='CANCEL_CLIENT_MOVE') then
        begin
          journal_id := odsFrom.FieldByName('fk_journal').AsString;
          Application.CreateForm(TfrmNeedMove, frmNeedMove);
          frmNeedMove.DriverId := ADriverId;
          frmNeedMove.Prev_syn := prev_syn;
          frmNeedMove.PlaceId := APlaceId;
          frmNeedMove.Journal_id := journal_id;
          frmNeedMove.CommonPanel := Self;
          frmNeedMove.OS := Os;
          if (prev_syn = 'MOVE_TO_CLIENT') then
          begin
            frmNeedMove.lbCap.Caption := 'Водитель едет к клиенту. Переместить?'
          end;
          if (prev_syn = 'START_CLIENT_MOVE') or (prev_syn='CANCEL_CLIENT_MOVE') then
          begin
            frmNeedMove.lbCap.Caption := 'Водитель зафиксирован. Переместить?'
          end;

          frmNeedMove.Show;
          frmNeedMove.SetFocus;          
        end
        else begin
          MoveTaxiToPlace(ADriverId, APlaceId);
        end;
        with odsFrom do
        begin
          DisableControls;
          try
            Close;
            Open;
          finally
            EnableControls;
          end;
        end;
        with odsTo do
        begin
          DisableControls;
          try
            Close;
            Open;
            Locate('fk_id', ADriverId, []);
          finally
            EnableControls;
          end;
        end;
        with OwnerOds do
        begin
          DisableControls;
          try
            Close;
            Open;
            Locate('fk_id', ADriverId, []);
          finally
            EnableControls;
          end;
        end;
      end;
    end;
  end;
end;

procedure TGridPanel.OnLineCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  OnLineCellClickCommon(Sender, ACellViewInfo, AButton, AShift, AHandled, true);
end;

procedure TGridPanel.OnLineCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  OnLineCellClickCommon(Sender, ACellViewInfo, AButton, AShift, AHandled, false);
end;

procedure TGridPanel.OnFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  {if (MainViewOds<>nil) then
  begin
    if (PanelOds.FieldByName('fk_id').AsInteger<>MainViewOds.FieldByName('fk_id').AsInteger) then
    begin
      MainViewOds.Locate('fk_id',PanelOds.FieldByName('fk_id').AsInteger,[]);
    end;
  end;}
end;

procedure TGridPanel.OnLineCellClickCommon(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean;IsDblClick:Boolean);
var foo : TPoint;
    gColumn : TcxGridDBColumn;
    tv : TcxGridDBTableView;
begin
  GetCursorPos(foo);
  if (AButton=mbLeft) and (IsDblClick=false) then
  begin
    if (MainViewOds<>nil) then
    begin
      if (PanelOds.FieldByName('fk_id').AsInteger<>MainViewOds.FieldByName('fk_id').AsInteger) then
      begin
        Application.ProcessMessages;
        FTimer.Enabled := true;
        if (TaxiPanel<>nil) then
        begin
        //  TaxiPanel.SelectDriver(PanelOds.FieldByName('fk_id').AsInteger);
        end;
      end;
    end;
  end;
  if ((AButton = mbLeft) and (IsDblClick=true)) or ((AButton = mbRight) and (IsDblClick=False)) then
  begin
     tv := Sender as TcxGridDBTableView;
     if (tv<>nil) then
     begin
       gColumn := GetViewColumnByFieldName(tv,'fk_taxiid');
       if (gColumn<>nil) then
       begin
         if (ACellViewInfo.GridRecord.Values[gColumn.Index]=TaxiId) then
         begin
           Sender.Site.EndDrag(false);
           PopUp.PopupComponent := Sender;
           PopUp.Popup(foo.X,foo.Y);
         end;
       end;
     end;
  end;
end;

procedure TGridPanel.MyMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  gColumn: TcxGridDBColumn;
  tv: TcxGridDBTableView;
  AHitTest: TcxCustomGridHitTest;
begin
  if (Button = mbLeft) and (Sender is TcxGridSite) then
  begin
    AHitTest := TcxGridSite(Sender).ViewInfo.GetHitTest(X, Y);
    case AHitTest.HitTestCode of
      htCell:
        begin
          tv := TcxGridRecordCellHitTest(AHitTest).GridView as TcxGridDBTableView;
          if (tv<>nil) then
          begin
            gColumn := GetViewColumnByFieldName(tv,'fk_taxiid');
            if (gColumn<>nil) then
            begin
              if (TcxGridRecordCellHitTest(AHitTest).GridRecord.Values[gColumn.Index]=TaxiId) then
              begin
                TcxGridSite(Sender).BeginDrag(False);
              end;
            end;
          end;
        end;
    end;
  end;
end;

function TGridPanel.GetOdsSql():string;
begin
  Result := '';
end;

constructor TRaionPanel.Create(AOwner:TComponent; APanelOwner:TCommonPanel);
begin
  inherited Create(AOwner, APanelOwner);
  Align := alLeft;
end;

destructor TRaionPanel.Destroy();
begin
  SetLength(FPlaceLevelPanel,0);
  inherited;
end;

function TRaionPanel.GetOdsSql():string; // запрос в стоянках Prihodko или в районах
begin
  Result := '  select :taxiid current_taxi, s.fk_taxiid, s.fk_id, s.fc_name, :taxiid taxiid, :place place, s.fn_besplatcnt, t.fc_synonym, '+#13+
            '         decode(t.fc_synonym, '+#13+
            '                ''GO_FROM_CAR'', s.fc_name||''->'', '+#13+
            '                ''START_CLIENT_MOVE'', s.fc_name||''*'', '+#13+
            '                ''MOVE_TO_CLIENT'', s.fc_name||''*''||decode((select fk_adr1id from taxi.tjournal where fk_id = e.fk_journal), taxi.GET_CONST_PERS, '' ПР''), '+#13+
            '                ''CANCEL_CLIENT_MOVE'', s.fc_name||''*'', '+#13+
            '                ''END_CLIENT_MOVE'', s.fc_name||'' (''||round((sysdate - e.fd_date)*60*24)||'' мин.)'', '+#13+
            '                s.fc_name)||'' ''|| '+#13+
            '         (select max(ss.fc_name) from taxi.ts_places ss where s.fk_place = ss.fk_id) as fc_name_to_show, '+#13+
            '         :place fk_raion, fn_raionorder, fn_placeorder, e.fk_journal'+#13+
            '    from taxi.ts_drivers s, taxi.ts_drivereventtype t, taxi.tdriverevent e'+#13+
            '   where s.fl_del = 0 '+#13+
            '     and s.fd_out is null '+#13+
            '     and e.fk_id = s.fk_lastdriverevent ';
  if not (ShowAllTaxi) then
    begin
      Result := Result + ' and s.fk_taxiid = :taxiid '+sLineBreak;
    end;
  Result := Result +
       ' and s.fk_place in (select :place from dual '+sLineBreak+
       '                    union '+sLineBreak+
       '                    select fk_id from taxi.ts_places pl where pl.fk_raionid = :place) '+sLineBreak+
       ' and s.fk_lastdrivereventtype = t.fk_id '+sLineBreak+
       ' and t.fl_isonline = 1'+sLineBreak+
       ' order by s.fk_taxiid, decode(t.fc_synonym, ''START_CLIENT_MOVE'', 1, ''MOVE_TO_CLIENT'', 1, ''CANCEL_CLIENT_MOVE'', 1, 0), s.fn_raionorder asc ';
end;

procedure TRaionPanel.DoResize();
begin
  Width := GetGridWidth();
  inherited;
end;

procedure TRaionPanel.SetSelectedRaion(value:Integer);
begin
  inherited;
  if (FRaion.id=value) then
  begin
    CaptionPanel.Font.Color := clRed;
    CaptionPanel.Font.Style := [fsBold];
  end
  else begin
    CaptionPanel.Font.Color := clBlack;
    CaptionPanel.Font.Style := [];    
  end;
end;

procedure TRaionPanel.CreateChilds(Aos:TOracleSession; ATaxiId:Integer; ARaion: TRaion);
var
  i, iLineNum:Integer;
  ods:TOracleDataSet;
  place:TPlace;
  placepanel:TPlacePanel;
  panel:TPlaceLevelPanel;
begin
  Os := Aos;
  TaxiId := ATaxiId;
  CopyRaion(ARaion, FRaion);
  iLineNum := 0;

  for I := 0 to ControlCount - 1 do
  begin
    //Controls[0].Free;
  end;

  CaptionPanel.Caption := Raion.name + ' ' + Raion.key;
  PanelOds.Session := Os;
  PanelOds.SQL.Text := GetOdsSql();
  PanelOds.DeclareAndSet('taxiid',otInteger, TaxiId);
  PanelOds.DeclareAndSet('place',otInteger, Raion.id);
  PanelOds.Open;
  SetLength(FChilds, 0);
  ods := TOracleDataSet.Create(Self);
  try
    ods.Session := Os;
    ods.SQL.Text :=
       'select * from taxi.ts_places s where s.fl_del = 0 and s.fk_raionid = :fk_raionid order by s.fc_name';
    ods.Close;
    ods.DeclareAndSet('fk_raionid', otInteger, Raion.id);
    ods.Open;
    ods.First;
    SetLength(FChilds, ods.RecordCount);
    if (ods.RecordCount=0) then
        (View.Level as TcxGridLevel).Control.Align := alClient;

    for I := 0 to ods.RecordCount - 1 do
    begin
      place.id := ods.FieldByName('fk_id').AsInteger;
      place.name := ods.FieldByName('fc_name').AsString;
      place.fullname := ods.FieldByName('fc_name_full').AsString;
      place.isplat := ods.FieldByName('fl_plat').AsString = '1';
      place.comment := ods.FieldByName('fc_comment').AsString;
      place.cost := ods.FieldByName('fn_cost').AsInteger;
      CopyRaion(Raion, place.raion);

      if (MaxGridOnLinePlace*iLineNum = I) then
      begin
        panel := TPlaceLevelPanel.CreatePanel(self, PlaceLevelHeight);
        SetLength(FPlaceLevelPanel,Length(FPlaceLevelPanel)+1);
        FPlaceLevelPanel[Length(FPlaceLevelPanel)-1]:= panel;
        Inc(iLineNum);
      end;
      if (panel<>nil) then
      begin
        placepanel := TPlacePanel.Create(panel, Self);
        placepanel.OwnerView := View;
        placepanel.Init(Os, TaxiId, place);
        FChilds[I] := placepanel;
      end;
      ods.Next;
    end;
  finally
    ods.Free;
  end;
  Width := GetGridWidth();
end;

constructor TTaxiPanel.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  Align := alClient;
end;

destructor TTaxiPanel.Destroy();
begin
  inherited;
end;

procedure TTaxiPanel.SetOwnerView(value:TcxGridDBTableView);
var I : Integer;
begin
  inherited SetOwnerView(value);
  for I := 0 to Length(FChilds) - 1 do
  begin
    if (FChilds[i]<>nil) then
      FChilds[i].OwnerView := value;
  end;
end;

procedure TTaxiPanel.CreateChilds(Aos:TOracleSession; ATaxiId:Integer; AOwnerView:TcxGridDBTableView);
var i : Integer;
    ods : TOracleDataSet;
    raionpanel : TRaionPanel;
    raion : TRaion;
begin
  Os := Aos;
  TaxiId := ATaxiId;
  
  for I := 0 to ControlCount - 1 do
  begin
    Controls[0].Free;
  end;
  SetLength(FChilds, 0);

  ods := TOracleDataSet.Create(Self);
  try
    ods.Session := Os;
    ods.SQL.Text := ' select s.*, (select max(t.fc_symbol) '+#13+
                    '                from taxi.ttaxidispetcherkey t '+#13+
                    '               where t.fk_raion = s.fk_id) as fc_symbol '+#13+
                    '   from taxi.ts_raion s '+#13+
                    '  where fl_del = 0 '+#13+
                    ' order by fn_order ';
    ods.Close;
    ods.Open;
    ods.First;
    SetLength(FChilds, ods.RecordCount);
    for I := 0 to ods.RecordCount - 1 do
    begin
      raion.id := ods.FieldByName('fk_id').AsInteger;
      raion.name := ods.FieldByName('fc_name').AsString;
      raion.order := ods.FieldByName('fn_order').AsVariant;
      raion.key := ods.FieldByName('fc_symbol').AsString;

      raionpanel := TRaionPanel.Create(Self, Self);
      raionpanel.OwnerView := AOwnerView;
      raionpanel.MaxGridOnLine:=ods.RecordCount;
      raionpanel.CreateChilds(Os, TaxiId, raion);
      FChilds[I] := raionpanel;
      ods.Next;
    end;
  finally
    ods.Free;
  end;
  OwnerView := AOwnerView;
  MainView := AOwnerView;
end;

procedure TTaxiPanel.DoResize();
begin
  inherited;
end;

function TTaxiPanel.GetCurrentDriverId;
var
  view:TcxGridDBTableView;
  bFound:Boolean;
  ods:TDataSet;
begin
  Result := null;
  if (CurrentPanel<>nil) then
  begin
    view := CurrentPanel.View;
  end;
  bFound := false;
  if (view<>nil) then
  begin
    ods := view.DataController.DataSource.DataSet;
    if (ods<>nil) then
    begin
      if (ods.RecordCount > 0) then
      begin
        Result := ods.FieldByName('fk_id').AsInteger;
        bFound := true;
      end;
    end;
  end;
  if not(bFound) then
  begin
    if (MainView<>nil) then
    begin
      if (MainView.DataController.Controller.SelectedRecordCount > 0) then
      begin
        Result := MainView.DataController.Controller.SelectedRecords[0].Values[1];
        bFound := true;
      end;
    end;
  end;
end;

function TTaxiPanel.GetSelectedTaxiId():Integer;
var ADriverId : Integer;
    View : TcxGridDBTableView;
begin
  if (CurrentPanel<>nil) then
  begin
    view := CurrentPanel.View;
    if (view<>nil) then
    begin
      if (view.DataController.Controller.SelectedRecordCount=0) then
        View := OwnerView
    end;
  end
  else begin
    view := OwnerView;
  end;
  View := OwnerView;
  if (view<>nil) then
  begin
    if (view.DataController.Controller.SelectedRecordCount > 0) then
    begin
      ADriverId := view.DataController.Controller.SelectedRecords[0].Values[1];
    end;
  end;
  Result := ADriverId;
end;

procedure TTaxiPanel.ChangeSelectedTaxiEvent(AEventSyn:string);
var
 ADriverId, AToPlace : Integer;
 ods:TOracleDataSet;
 view:TcxGridDBTableView;
begin
  if (CurrentPanel<>nil) then
  begin
    view := CurrentPanel.View;
    if (view<>nil) then
    begin
      if (view.DataController.Controller.SelectedRecordCount=0) then
        View := OwnerView
    end;
  end
  else begin
    view := OwnerView;
  end;
  View := OwnerView;
  if (view<>nil) then
  begin
    if (view.DataController.Controller.SelectedRecordCount > 0) then
    begin
      ADriverId := view.DataController.Controller.SelectedRecords[0].Values[1];
      Self.ChangeTaxiEvent(ADriverId, AEventSyn, null, null);
      ods := view.DataController.DataSource.DataSet as TOracleDataSet;
      if (ods<>nil) then
      begin
        with ods do
        begin
          DisableControls;
          try
            Close;
            Open;
            Locate('fk_id', ADriverId, []);
          finally
            EnableControls;
          end;
        end;
        if (view<>OwnerView)and(OwnerOds<>nil) then
        begin
          with OwnerOds do
          begin
            DisableControls;
            try
              Close;
              Open;
              Locate('fk_id', ADriverId, []);
            finally
              EnableControls;
            end;
          end;
        end;
      end;
      RefreshAllOds;      
    end;
  end;
end;

constructor TCaptionPanel.Create(AOwner:TWinControl; ACaption:string); // настройки панели заголовка
begin
  inherited Create(AOwner);
  Parent := AOwner;
  BevelOuter := bvNone;
  Caption := ACaption;
  Align := alTop;
  Height := 30;
  OnDragOver := MyDragOver;
  OnDragDrop := MyDragDrop;
  ControlStyle := ControlStyle + [csOpaque];
  DoubleBuffered:=True;
  FullRepaint := false;  
end;

procedure TCaptionPanel.MyDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  ods : TOracleDataSet;
  pnl:TGridPanel;
  ADroppedView, ASenderView: TcxGridDBTableView;
  adriverid, driverbefore:Integer;
  driverbefore_order, neworder:double;
  place:Integer;
  israion:Boolean;
begin
  ods := nil;
  if Source is TcxDragControlObject then
    with TcxDragControlObject(Source) do
      if Control is TcxGridSite then
        with TcxGridSite(Control) do
        begin
          ADroppedView := GridView as TcxGridDBTableView;
          ods := ADroppedView.DataController.DataSource.DataSet as TOracleDataSet;
        end;
  pnl := Parent as TGridPanel;
  if (ods<>nil) and (pnl<>nil) then
  begin
    israion := true;
    if (pnl is TRaionPanel) then
    begin
      place := (pnl as TRaionPanel).Raion.id;
    end
    else begin
      place := (pnl as TPlacePanel).Place.id;
      israion := false;
    end;

      if (place = ods.GetVariable('place')) then
      begin
        ASenderView:=pnl.View;
        if (ADroppedView<>nil) and (ASenderView<>nil) then
        begin
          if (ADroppedView=ASenderView) then
          begin
              ADriverId := ADroppedView.DataController.Controller.SelectedRecords[0].Values[1];
              ods.First;
              driverbefore := ods.FieldByName('fk_id').AsInteger;
              if (israion) then              
                driverbefore_order := ods.FieldByName('fn_raionorder').AsFloat
              else
                driverbefore_order := ods.FieldByName('fn_placeorder').AsFloat;
              neworder := driverbefore_order/2;
              UpdateDriverOrder(pnl.Os, ADriverId, israion, neworder);
              with ods do
              begin
                DisableControls;
                try
                  Close;
                  Open;
                  Locate('fk_id', ADriverId, []);
                finally
                  EnableControls;
                end;
              end;
          end;
        end;
      end;
  end;
end;

procedure TCaptionPanel.MyDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  ods : TOracleDataSet;
  pnl:TGridPanel;
  ADroppedView: TcxGridDBTableView;
  place:Integer;
begin
  Accept := False;
  if Source is TcxDragControlObject then
    with TcxDragControlObject(Source) do
      if Control is TcxGridSite then
        with TcxGridSite(Control) do
        begin
          ADroppedView := GridView as TcxGridDBTableView;
          ods := ADroppedView.DataController.DataSource.DataSet as TOracleDataSet;
        end;

  pnl := Parent as TGridPanel;
  if (ods<>nil) and (pnl<>nil) then
  begin
    if (pnl is TRaionPanel) then
    begin
      place := (pnl as TRaionPanel).Raion.id;
    end
    else begin
      place := (pnl as TPlacePanel).Place.id;
    end;
    try
      if (ods.VariableIndex('place') > 0) then
      begin
        Accept := (place = ods.GetVariable('place'));
      end;
    except
      Accept := false;
    end;
  end;
end;

constructor TPlacePanel.Create(AOwner:TComponent; APanelOwner:TCommonPanel);
begin
  inherited Create(AOwner, APanelOwner);
  Align := alLeft;
  (View.Level as TcxGridLevel).Control.Align := alClient; 
end;

destructor TPlacePanel.Destroy();
begin
  inherited;
end;

procedure TPlacePanel.Init(Aos:TOracleSession; ATaxiId:Integer; APlace: TPlace);
var i:Integer;
begin
  Os := Aos;
  TaxiId := ATaxiId;
  CopyPlace(APlace, FPlace);

  for I := 0 to ControlCount - 1 do
  begin
    //Controls[0].Free;
  end;

  CaptionPanel.Caption := Place.name;
  PanelOds.SQL.Text := GetOdsSql();
  PanelOds.DeclareAndSet('taxiid',otInteger, TaxiId);
  PanelOds.DeclareAndSet('place',otInteger, Place.id);
  PanelOds.Session := Os;  
  PanelOds.Open;
  Width := GetGridWidth();
  SetLength(FChilds, 0);
end;

function TPlacePanel.GetOdsSql():string; // запрос в гридах Prihodko
begin
  Result := '  select :taxiid current_taxi, s.fk_taxiid, s.fk_id, s.fc_name, :taxiid taxiid, :place place, s.fn_besplatcnt, t.fc_synonym, '+#13+
            '         decode(t.fc_synonym, '+#13+
            '                ''GO_FROM_CAR'', s.fc_name||''->'', '+#13+
            '                ''START_CLIENT_MOVE'', s.fc_name||''*'', '+#13+
            '                ''MOVE_TO_CLIENT'', s.fc_name||''*''||decode((select fk_adr1id from taxi.tjournal where fk_id = e.fk_journal), taxi.GET_CONST_PERS, '' ПР''), '+#13+
            '                ''CANCEL_CLIENT_MOVE'', s.fc_name||''*'', s.fc_name) as fc_name_to_show, '+#13+
            '         (select fk_id from taxi.ts_places pl where pl.fk_raionid = :place) as fk_raion, fn_raionorder, fn_placeorder, e.fk_journal '+#13+
            '    from taxi.ts_drivers s, taxi.ts_drivereventtype t, taxi.tdriverevent e '+#13+
            '   where s.fl_del = 0 '+#13+
            '     and s.fd_out is null ';
  if not (ShowAllTaxi) then
    begin
      Result := Result + '    and s.fk_taxiid = :taxiid'+#13;
    end;
  Result := Result +
       '    and s.fk_place = :place '+#13+
       '    and s.fk_lastdrivereventtype = t.fk_id '+#13+
       '    and t.fl_isonline = 1 '+#13+
       '    and e.fk_id = s.fk_lastdriverevent '+#13+
       '   order by s.fk_taxiid, s.fn_placeorder asc ';
end;

procedure TPlacePanel.DoResize();
begin
  Width := GetGridWidth();
end;

constructor TPlaceLevelPanel.CreatePanel(AOwner: TComponent;ALevelHeight:Integer); // настройки стоянок
begin
  inherited Create(AOwner);
  Parent := AOwner as TWinControl;
  BevelOuter := bvNone;
  BevelKind := bkTile;
  Caption := '';
  Align := alTop;
  Height := ALevelHeight;
  Top := 0;
  ControlStyle := ControlStyle + [csOpaque];
  DoubleBuffered:=True;
  FullRepaint := false;
end;

end.
