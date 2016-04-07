unit uTaxiGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGridTableView, cxGrid, cxGridLevel, cxLookAndFeels,
  cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridDBTableView,
  Oracle, OracleData, Menus, cxTextEdit;

type
  TLevelPanel = class(TPanel)
    public
      procedure DoResize(AGridWidth:Integer);
  end;

  TOnePanelGrid = class(TPanel)
    private
      FOrder:Integer;
    protected
    public
      property Order:Integer read FOrder write FOrder;
  end;

type
  TTaxiGrid = class(TPanel)
  private
    FMaxGridOnLine:Integer;
    FLevelHeight:Integer;
    FOs:TOracleSession;
    FTaxi:Integer;
    FCurrentView:TcxGridDBTableView;
    FPopUp:TPopupMenu;
    FNotOnLine: TOracleDataSet;
    FtvNotOnLine:TcxGridDBTableView;
    FIsRefreshNow:Boolean;
    FShowAllTaxi:Boolean;
    procedure SetMaxGridOnLine(value:integer);
    function GetGridWidth:Integer;

    function CreateLevelPanel(AParent:TWinControl):TLevelPanel;
    function CreateGridPanel(AParent:TWinControl; AIndex:Integer;ACaption:string; APlaceId:Integer):TPanel;
    procedure MoveTaxiToPlace(Adriver:Integer; AToPlace:Integer);
    function GetOdsSql():string;    
  protected
    procedure MyDragOver(Sender, Source: TObject; X,  Y: Integer; State: TDragState; var Accept: Boolean);
    procedure MyDragDrop(Sender, Source: TObject; X,  Y: Integer);
    procedure MyOnEnter(Sender: TObject);
    procedure OnLineCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure OnLineCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure OnLineCellClickCommon(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean;IsDblClick:Boolean);
    procedure MyMouseDown(Sender: TObject;
        Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  public

    constructor Create(AOwner:TComponent);override;
    destructor Destroy();override;
    procedure CreateGrids(Aos:TOracleSession; ATaxiId:Integer; ANotOnLine:TOracleDataSet; AtvNotOnLine:TcxGridDBTableView);
    procedure DoResize();
    procedure ChangeSelectedTaxiEvent(AEventSyn:string);
    function GetDriverByPosiv(APosivnoy:string):Integer;
    procedure ChangeTaxiEvent(Adriver:Integer; AEventSyn:string; AToPlace:Variant);
    function GetCurrentDate():TDateTime;
    procedure SelectDriver(ADriverId:Integer);
    procedure tvCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    function GetViewColumnByFieldName(Atv: TcxGridDBTableView; AColumnName:string):TcxGridDbColumn;
    procedure RefreshAllOds();

    property GridWidth:Integer read GetGridWidth;
    property MaxGridOnLine:Integer read FMaxGridOnLine write SetMaxGridOnLine;
    property LevelHeight:Integer read FLevelHeight write FLevelHeight;
    property CurrentView:TcxGridDBTableView read FCurrentView write FCurrentView;
    property PopUp:TPopupMenu read FPopUp write FPopUp;
    property ShowAllTaxi:Boolean read FShowAllTaxi write FShowAllTaxi;
  end;

implementation

procedure TLevelPanel.DoResize(AGridWidth:Integer);
var
  I: Integer;
  pnl:TOnePanelGrid;
begin
  for I := 0 to ControlCount - 1 do
  begin
    if (Controls[i] Is TOnePanelGrid) then
    begin
      pnl := Controls[i] as TOnePanelGrid;
      pnl.Width := AGridWidth;
    end;
  end;
end;

constructor TTaxiGrid.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  Align := alClient;
  MaxGridOnLine := 1;

  LevelHeight := 215;
  FIsRefreshNow:=false;
end;

destructor TTaxiGrid.Destroy();
begin
  inherited;
end;

procedure TTaxiGrid.SetMaxGridOnLine(value:integer);
begin
  if (value < 1) then
  begin
    FMaxGridOnLine := 1;
  end
  else begin
    FMaxGridOnLine := value;
  end;
end;

function TTaxiGrid.GetGridWidth:Integer;
begin
  if (Parent<>nil) then
  begin
    Result := Round(Parent.Width/MaxGridOnLine);
  end
  else begin
    Result := 100;
  end;
end;

function TTaxiGrid.CreateLevelPanel(AParent:TWinControl):TLevelPanel;
var
  pnl:TLevelPanel;
begin
  pnl := TLevelPanel.Create(AParent);
  pnl.Parent := AParent;
  pnl.BevelOuter := bvNone;
  pnl.Caption := '';
  pnl.Align := alTop;
  pnl.Height := LevelHeight;
  pnl.Top := 0;
  Result := pnl;
end;

procedure TTaxiGrid.DoResize();
var
  I: Integer;
  pnl:TLevelPanel;
begin
  for I := 0 to ControlCount - 1 do
  begin
    if (Controls[I] is TLevelPanel) then
    begin
      pnl := Controls[I] as TLevelPanel;
      pnl.DoResize(GridWidth);
    end;
  end;
end;

function TTaxiGrid.CreateGridPanel(AParent:TWinControl; AIndex:Integer;ACaption:string; APlaceId:Integer):TPanel;
var
  pnl:TOnePanelGrid;
  pnl1,pnl2:TPanel;
begin
  pnl := TOnePanelGrid.Create(AParent);
  pnl.Parent := AParent;
  pnl.BevelOuter := bvNone;
  pnl.Caption := '';
  if (AIndex+1=MaxGridOnLine) then
  begin
    pnl.Align := alClient;
  end
  else begin
    pnl.Align := alLeft;
  end;
  pnl.Left := GridWidth*AIndex+1;
  pnl.Order := AIndex;
  pnl.Width := GridWidth;

  pnl1 := TPanel.Create(pnl);
  pnl1.Parent := pnl;
  pnl1.BevelOuter := bvNone;
  pnl1.Caption := ACaption;
  pnl1.Align := alTop;
  pnl1.Height := 60;

  pnl2 := TPanel.Create(pnl);
  pnl2.Parent := pnl;
  pnl2.BevelOuter := bvNone;
  pnl2.Caption := '';
  pnl2.Align := alClient;
  Result := pnl2;
end;

function TTaxiGrid.GetOdsSql():string;
begin
  Result :=
       '  select :taxiid current_taxi, s.fk_taxiid, s.fk_id, s.fc_name, :taxiid taxiid, :place place, s.fn_besplatcnt, t.fc_synonym, '+sLineBreak+
       '     decode(t.fc_synonym,''START_CLIENT_MOVE'',s.fc_name||''*'',''MOVE_TO_CLIENT'',s.fc_name||''*'',s.fc_name) fc_name_to_show'+sLineBreak+
       '   from taxi.ts_drivers s, taxi.tdriverevent e, taxi.ts_drivereventtype t'+sLineBreak+
       '  where s.fl_del = 0'+sLineBreak+
       '    and s.fd_out is null'+sLineBreak;
  if not (ShowAllTaxi) then
  begin
      Result := Result + '    and s.fk_taxiid = :taxiid'+sLineBreak;
  end;
  Result := Result + 
       '    and s.fk_place = :place'+sLineBreak+
       '    and s.fk_lastdriverevent = e.fk_id'+sLineBreak+
       '    and e.fk_drivereventtype = t.fk_id'+sLineBreak+
       '    and t.fl_isonline = 1'+sLineBreak+
       '   order by s.fk_taxiid, s.fd_placearive asc';
end;

procedure TTaxiGrid.MyMouseDown(Sender: TObject;
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
              if (TcxGridRecordCellHitTest(AHitTest).GridRecord.Values[gColumn.Index]=FTaxi) then
              begin
                TcxGridSite(Sender).BeginDrag(False);
              end;
            end;
          end;
        end;
    end;
  end;
end;

procedure TTaxiGrid.CreateGrids(Aos:TOracleSession; ATaxiId:Integer; ANotOnLine:TOracleDataSet; AtvNotOnLine:TcxGridDBTableView);
var
  I: Integer;
  pnl : TPanel;
  pnlLevel:TLevelPanel;
  grid:TcxGrid;
  tvDriver:TcxGridDBTableView;
  lDriver: TcxGridLevel;
  gColumn:TcxGridDBColumn;
  iLineNum:Integer;
  ods, odsGrid: TOracleDataSet;
  dsGrid:TDataSource;
  procedure CreateColumn(ACaption:string; AFieldName:string; AVisible:Boolean);
  begin
      gColumn:=tvDriver.CreateColumn;
      gColumn.Caption := ACaption;
      gColumn.DataBinding.FieldName := AFieldName;
      gColumn.HeaderAlignmentHorz:=taCenter;
      gColumn.Options.Editing:=False;
      gColumn.Options.Sorting:=False;
      gColumn.Options.Filtering:=False;
      gColumn.Visible := AVisible;
      gColumn.PropertiesClass:=TcxTextEditProperties;
      TcxTextEditProperties(gColumn.Properties).Alignment.Horz:=taCenter;      
  end;
begin
  FOs := Aos;
  FTaxi := ATaxiId;
  FNotOnLine := ANotOnLine;
  FtvNotOnLine := AtvNotOnLine;
  iLineNum := 0;
  pnlLevel := nil;

  for I := 0 to ControlCount - 1 do
  begin
    Controls[0].Free;
  end;
  
  ods := TOracleDataSet.Create(Self);
  ods.Session := FOs;
  ods.SQL.Text :=
     ' select * '+sLineBreak+
     '   from (select rownum rnum, q.*'+sLineBreak+
     '     from (select fk_id,'+sLineBreak+
     '              fc_name '+sLineBreak+
     '           from taxi.ts_places '+sLineBreak+
     '           where fl_del = 0'+sLineBreak+
     '           union all '+sLineBreak+
     '           select fk_id, '+sLineBreak+
     '              fc_name '+sLineBreak+
     '           from taxi.ts_raion '+sLineBreak+
     '            where fl_del = 0 '+sLineBreak+
     '        order by fc_name) q)';
  ods.Close;
  ods.Open;

  ods.First;
  for I := 0 to ods.RecordCount - 1 do
  begin
    if (MaxGridOnLine*iLineNum)=(I) then
    begin
      pnlLevel := CreateLevelPanel(Self);
      Inc(iLineNum);
    end;
    if (pnlLevel<>nil) then
    begin
      pnl := CreateGridPanel(pnlLevel, i,ods.FieldByName('fc_name').AsString, ods.FieldByName('fk_id').AsInteger);
      grid := TcxGrid.Create(pnl);
      grid.Font.Size:=10;
      grid.Parent := pnl;
      grid.Align := alClient;
      grid.OnEnter := MyOnEnter;
      lDriver := grid.Levels.Add;
      tvDriver := TcxGridDBTableView.Create(lDriver);
      tvDriver.DragMode := dmManual;
      tvDriver.OnDragOver :=  MyDragOver;
      tvDriver.OnDragDrop :=  MyDragDrop;
      //tvDriver.PopupMenu := PopUp;
      tvDriver.OnCellDblClick := OnLineCellDblClick;
      tvDriver.OnCellClick := OnLineCellClick;
      tvDriver.OnCustomDrawCell := tvCustomDrawCell;
      tvDriver.OnMouseDown := MyMouseDown;      
      with tvDriver do
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
      lDriver.GridView := tvDriver;

      CreateColumn(' ', 'FC_NAME', false);
      CreateColumn('FK_ID', 'FK_ID', false);
      CreateColumn('taxiid', 'taxiid', false);
      CreateColumn('place', 'place', false);
      CreateColumn('fn_besplatcnt', 'fn_besplatcnt', false);
      CreateColumn(' ', 'fc_name_to_show', true);
      CreateColumn('fc_synonym', 'fc_synonym', false);
      CreateColumn('fk_taxiid', 'fk_taxiid', false);

      odsGrid := TOracleDataSet.Create(Self);
      odsGrid.Session := FOs;
      odsGrid.Tag:=1;
      odsGrid.SQL.Text :=  GetOdsSql();
      odsGrid.DeclareAndSet('taxiid',otInteger, FTaxi);
      odsGrid.DeclareAndSet('place',otInteger, ods.FieldByName('fk_id').AsInteger);
      odsGrid.Open;
      dsGrid := TDataSource.Create(odsGrid);
      dsGrid.DataSet := odsGrid;
      tvDriver.DataController.DataSource := dsGrid;
    end;
    ods.Next;
  end;
end;

procedure TTaxiGrid.MyDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := true;
end;

procedure TTaxiGrid.MyDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  ADroppedView, ASenderView: TcxGridDBTableView;
  ADriverId, APlaceId:Integer;
  odsFrom, odsTo: TOracleDataSet;
  gColumn:TcxGridDBColumn;
  prev_syn:string;
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
      Exit;

    if (ADroppedView.DataController.Controller.SelectedRecordCount > 0) then
    begin
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

        if (prev_syn='START_CLIENT_MOVE') or (prev_syn='MOVE_TO_CLIENT') then
        begin
          ChangeTaxiEvent(ADriverId, prev_syn, APlaceId);
        end
        else begin
          MoveTaxiToPlace(ADriverId, APlaceId);
        end;
       // RefreshAllOds();
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
      end;
    end;
  end;
end;

procedure TTaxiGrid.MoveTaxiToPlace(Adriver:Integer; AToPlace:Integer);
begin
  ChangeTaxiEvent(Adriver, 'MOVED', AToPlace);
end;

procedure TTaxiGrid.ChangeSelectedTaxiEvent(AEventSyn:string);
var
 ADriverId:Integer;
 ods:TOracleDataSet;
 view:TcxGridDBTableView;
begin
  if (CurrentView<>nil) then
  begin
    view := CurrentView;
  end
  else begin
    view := FtvNotOnLine;
  end;
  if (view<>nil) then
  begin
    if (view.DataController.Controller.SelectedRecordCount > 0) then
    begin
      ADriverId := view.DataController.Controller.SelectedRecords[0].Values[1];
      ChangeTaxiEvent(ADriverId, AEventSyn, null);
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
        if (view<>FtvNotOnLine) then
        begin
          with FNotOnLine do
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

function TTaxiGrid.GetDriverByPosiv(APosivnoy:string):Integer;
begin
  with TOracleDataSet.Create(Self) do
  begin
    try
      Session := FOs;
      SQL.Text :=
       ' select fk_id  from taxi.ts_drivers d where d.fc_name=:pname and d.fk_taxiid=:taxiid';
      DeclareAndSet('pname', otInteger, APosivnoy);
      DeclareAndSet('taxiid', otString, FTaxi);
      Open;
      if (RecordCount > 0) then
      begin
        Result := FieldByName('fk_id').AsInteger;
      end
      else begin
        Result := -1;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TTaxiGrid.ChangeTaxiEvent(Adriver:Integer; AEventSyn:string; AToPlace:Variant);
begin
  with TOracleQuery.Create(Self) do
  begin
    try
      Session := FOs;
      SQL.Text :=
       ' insert into taxi.tdriverevent '+sLineBreak+
       '   (fk_driver, fk_drivereventtype, fk_place) '+sLineBreak+
       ' values '+sLineBreak+
       '   (:pdriver, '+sLineBreak+
       '    (select max(fk_id) '+sLineBreak+
       '       from taxi.ts_drivereventtype t '+sLineBreak+
       '      where t.fc_synonym = :psyn), '+sLineBreak+
       '    :pplace) ';
      DeclareAndSet('pdriver', otInteger, Adriver);
      DeclareAndSet('pplace', otInteger, AToPlace);
      DeclareAndSet('psyn', otString, AEventSyn);
      Execute;
      FOs.Commit;
    finally
      Free;
    end;
  end;
end;

procedure TTaxiGrid.MyOnEnter(Sender: TObject);
begin
//  if ((Sender as TcxGrid).Levels > 0) then
    FCurrentView := (Sender as TcxGrid).Levels[0].GridView as TcxGridDBTableView;
end;

procedure TTaxiGrid.OnLineCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  OnLineCellClickCommon(Sender, ACellViewInfo, AButton, AShift, AHandled, true);
end;

procedure TTaxiGrid.OnLineCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  OnLineCellClickCommon(Sender, ACellViewInfo, AButton, AShift, AHandled, false);
end;

procedure TTaxiGrid.OnLineCellClickCommon(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean;IsDblClick:Boolean);
var
  foo: TPoint;
  gColumn: TcxGridDBColumn;
  tv: TcxGridDBTableView;
begin
  GetCursorPos(foo);
  if ((AButton = mbLeft) and (IsDblClick=true)) or ((AButton = mbRight) and (IsDblClick=False)) then
  begin
     tv := Sender as TcxGridDBTableView;
     if (tv<>nil) then
     begin
       gColumn := GetViewColumnByFieldName(tv,'fk_taxiid');
       if (gColumn<>nil) then
       begin
         if (ACellViewInfo.GridRecord.Values[gColumn.Index]=FTaxi) then
         begin
           PopUp.Popup(foo.X,foo.Y);
         end;
       end;
     end;
  end;
end;

function TTaxiGrid.GetCurrentDate():TDateTime;
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

procedure TTaxiGrid.SelectDriver(ADriverId:Integer);
var
  I: Integer;
  pn1,pn2,pn3:TPanel;
  J: Integer;
  Z: Integer;
  grid:TcxGrid;
  view:TcxGridDBTableView;
  ods:TOracleDataSet;
  Y: Integer;
  bFound:Boolean;
begin
  bFound := false;
  for I := 0 to ControlCount - 1 do
  begin
    if (Controls[I] is TPanel) then
    begin
      pn1:= (Controls[I] as TPanel);
      for J := 0 to pn1.ControlCount - 1 do
      begin
        //if (bFound) then
        //  Break;
        if (pn1.Controls[J] is TPanel) then
        begin
          pn2:= (pn1.Controls[J] as TPanel);
          for Z := 0 to pn2.ControlCount - 1 do
          begin
            //if (bFound) then
            //  Break;
            if (pn2.Controls[Z] is TPanel) then
            begin
              pn3 := (pn2.Controls[Z] as TPanel);
              for Y := 0 to pn3.ControlCount - 1 do
              begin
                //if (bFound) then
                //  Break;
                if (pn3.Controls[Y] is TcxGrid) then
                begin
                  grid:=(pn3.Controls[Y] as TcxGrid);
                  view := grid.Levels[0].GridView as TcxGridDBTableView;
                  view.Invalidate(true);
                  //view.ViewChanged();
                  if (not bFound) then
                  begin
                    ods := view.DataController.DataSource.DataSet as TOracleDataSet;
                    if (ods.Active) then
                    begin
                      if (ods.Locate('fk_id',ADriverId,[])) then
                      begin
                        CurrentView := view;
                        bFound := true;
                        break;
                      end;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  if not (bFound) then
    CurrentView := nil;
end;

procedure TTaxiGrid.RefreshAllOds();
var
  I: Integer;
  pn1,pn2,pn3:TPanel;
  J: Integer;
  Z: Integer;
  grid:TcxGrid;
  view:TcxGridDBTableView;
  ods:TOracleDataSet;
  Y: Integer;
  bFound:Boolean;
  DriverId:Integer;
begin
  FIsRefreshNow:=true;
  try
    bFound := false;
    for I := 0 to ControlCount - 1 do
    begin
      if (Controls[I] is TPanel) then
      begin
        pn1:= (Controls[I] as TPanel);
        for J := 0 to pn1.ControlCount - 1 do
        begin
          if (bFound) then
            Break;
          if (pn1.Controls[J] is TPanel) then
          begin
            pn2:= (pn1.Controls[J] as TPanel);
            for Z := 0 to pn2.ControlCount - 1 do
            begin
              if (bFound) then
                Break;
              if (pn2.Controls[Z] is TPanel) then
              begin
                pn3 := (pn2.Controls[Z] as TPanel);
                for Y := 0 to pn3.ControlCount - 1 do
                begin
                  if (bFound) then
                    Break;
                  if (pn3.Controls[Y] is TcxGrid) then
                  begin
                    grid:=(pn3.Controls[Y] as TcxGrid);
                    view := grid.Levels[0].GridView as TcxGridDBTableView;
                    ods := view.DataController.DataSource.DataSet as TOracleDataSet;
                    if (ods.Active) then
                    begin
                      DriverId := ods.FieldByName('fk_id').AsInteger;
                      try
                        ods.DisableControls;
                        ods.Close;
                        if (ods.Tag=1) then
                        begin
                          ods.SQL.Text := GetOdsSql();
                        end;
                        ods.Open;
                        ods.Locate('fk_id',DriverId,[]);
                      finally
                        ods.EnableControls;
                      end;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  finally
    FIsRefreshNow := false;
  end;
end;

function TTaxiGrid.GetViewColumnByFieldName(Atv: TcxGridDBTableView; AColumnName:string):TcxGridDbColumn;
var
  I:Integer;
begin
  Result := nil;
  for I:=0 to Atv.ColumnCount-1 do
  begin
      //Application.ProcessMessages;
      if AnsiSameText(Atv.Columns[I].DataBinding.FieldName, AColumnName) then
      begin
        Result:=Atv.Columns[I];
        Break;
      end;
  end;
end;

procedure TTaxiGrid.tvCustomDrawCell(Sender: TcxCustomGridTableView;
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

  if AViewInfo.GridRecord.Values[gColumnTaxi.Index] <> FTaxi then
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
  if (gColumn<>nil) then
  begin
    if (AViewInfo.GridRecord.Values[gColumn.Index]=FNotOnLine.FieldByName('fk_id').AsVariant) then
    begin
      ACanvas.Brush.Color := $5CA24E;
      ACanvas.Pen.Color := clWhite;
      ACanvas.Font.Color := clWhite;
    end;
  end;
end;

end.
