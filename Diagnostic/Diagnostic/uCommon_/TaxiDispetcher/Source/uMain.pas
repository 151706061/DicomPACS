unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGridTableView, cxGrid, cxGridLevel, cxLookAndFeels,
  cxStyles, dxSkinsCore, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridDBTableView, Oracle,
  cxLookAndFeelPainters, cxContainer, cxGroupBox, dxSkinsForm, OracleData,
  Menus, ActnList, StdCtrls, cxButtons, cxTextEdit, cxLabel, cxMaskEdit,
  cxDropDownEdit, cxPC, DateUtils, OracleMonitor, cxCheckBox, uTaxiPanel, StrUtils,
  dxSkinCaramel, dxSkinCoffee, dxSkinOffice2007Green;


type
  TKey = record
    key: string;
    synonym: string;
    action:TAction;
    raion:Variant;
    shift:Boolean;
    alt:boolean;
    ctrl:boolean;
    F1:TLabel;
    ShiftL:TLabel;
  end;
  
  TfrmMain = class(TForm)
    pnlMain: TPanel;
    os: TOracleSession;
    tvNotOnLine: TcxGridDBTableView;
    gNotOnLineL: TcxGridLevel;
    gNotOnLine: TcxGrid;
    odsNotOnLine: TOracleDataSet;
    dsNotOnLine: TDataSource;
    tvNotOnLineFK_ID: TcxGridDBColumn;
    tvNotOnLineFC_NAME: TcxGridDBColumn;
    Panel1: TPanel;
    Panel2: TPanel;
    ActionList1: TActionList;
    aToDinner: TAction;
    aFromDinner: TAction;
    aFromCar: TAction;
    aToCar: TAction;
    aBroken: TAction;
    aRepear: TAction;
    aTakeOff: TAction;
    aDayEnd: TAction;
    aDayStart: TAction;
    popAction: TPopupMenu;
    N2: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    tvNotOnLineEVENTTYPE_NAME: TcxGridDBColumn;
    popNotLink: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem10: TMenuItem;
    N14: TMenuItem;
    N1: TMenuItem;
    N3: TMenuItem;
    MainMenu1: TMainMenu;
    aExit: TAction;
    aChangeUser: TAction;
    N4: TMenuItem;
    N7: TMenuItem;
    tvNotOnLineColumn1: TcxGridDBColumn;
    aMoveOut: TAction;
    N10: TMenuItem;
    N15: TMenuItem;
    tvNotOnLineColumn2: TcxGridDBColumn;
    cxButton10: TcxButton;
    teVihod: TcxTextEdit;
    cxButton63: TcxButton;
    cxButton64: TcxButton;
    cxButton65: TcxButton;
    cxButton62: TcxButton;
    cxButton66: TcxButton;
    cxButton67: TcxButton;
    cxButton61: TcxButton;
    cxButton68: TcxButton;
    cxButton69: TcxButton;
    cxButton70: TcxButton;
    cxButton59: TcxButton;
    Shape4: TShape;
    a1: TAction;
    a2: TAction;
    a3: TAction;
    a4: TAction;
    a5: TAction;
    a6: TAction;
    a7: TAction;
    a8: TAction;
    a9: TAction;
    a0: TAction;
    aVihod: TAction;
    aClear: TAction;
    pcMain: TcxPageControl;
    tsOnLine: TcxTabSheet;
    tsOnSmena: TcxTabSheet;
    Panel3: TPanel;
    Shape1: TShape;
    tvSmena: TcxGridDBTableView;
    gSmenaL: TcxGridLevel;
    gSmena: TcxGrid;
    cmbHour: TcxComboBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    dsSmena: TDataSource;
    odsSmena: TOracleDataSet;
    tvSmenaFK_ID: TcxGridDBColumn;
    tvSmenaFC_NAME: TcxGridDBColumn;
    tvSmenaEVENTTYPE_NAME: TcxGridDBColumn;
    tvSmenaFL_ISONLINE: TcxGridDBColumn;
    tvSmenaFC_DATE: TcxGridDBColumn;
    tvSmenaFC_FIO: TcxGridDBColumn;
    lblTime: TcxLabel;
    odsGetSmenaDate: TOracleDataSet;
    tvNotOnLineFn_Besplatcnt: TcxGridDBColumn;
    tvSmenaColumn1: TcxGridDBColumn;
    tvNotOnLineColumn3: TcxGridDBColumn;
    tvSmenaColumn2: TcxGridDBColumn;
    tRefresh: TTimer;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    aEnter: TAction;
    aFind: TAction;
    tvSmenaColumn3: TcxGridDBColumn;
    cbAllTaxi: TcxCheckBox;
    Shape2: TShape;
    cxLabel3: TcxLabel;
    Shape3: TShape;
    cxLabel4: TcxLabel;
    Shape5: TShape;
    cxLabel5: TcxLabel;
    Label1: TLabel;
    tvNotOnLineColumn4: TcxGridDBColumn;
    tsHistory: TcxTabSheet;
    gDriverEventTmp: TcxGrid;
    tvDriverEventTmp: TcxGridDBTableView;
    gDriverEventL: TcxGridLevel;
    dsDriverEventTmp: TDataSource;
    odsDriverEventTmp: TOracleDataSet;
    tvDriverEventTmpFC_EVENTNAME: TcxGridDBColumn;
    tvDriverEventTmpFC_SYNONYM: TcxGridDBColumn;
    tvDriverEventTmpFD_START: TcxGridDBColumn;
    tvDriverEventTmpFD_END: TcxGridDBColumn;
    qSetHistory: TOracleQuery;
    aHistory: TAction;
    N16: TMenuItem;
    tvDriverEventTmpColumn1: TcxGridDBColumn;
    cxGroupBox1: TcxGroupBox;
    gHistoryItogo: TcxGrid;
    tvHistoryItogo: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    gHistoryItogoL: TcxGridLevel;
    dsHistoryItogo: TDataSource;
    odsHistoryItogo: TOracleDataSet;
    cxGroupBox2: TcxGroupBox;
    cxButton9: TcxButton;
    aStreet: TAction;
    tmrSelectCurrentPanel: TTimer;
    odsKeys: TOracleDataSet;
    tvNotOnLineColumn5: TcxGridDBColumn;
    popNotOnline: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    aToDinner2: TAction;
    aFromCar2: TAction;
    aBroken2: TAction;
    aTakeOff2: TAction;
    aDayEnd2: TAction;
    aMoveOut2: TAction;
    aHistory2: TAction;
    aFromCar3: TAction;
    aBroken3: TAction;
    aTakeOff3: TAction;
    aToDinner3: TAction;
    aMoveOut3: TAction;
    aDayEnd3: TAction;
    lblFoundF1: TLabel;
    lblFromCarF1: TLabel;
    lblBrokenF1: TLabel;
    lblTakenOffF1: TLabel;
    lblVihodF1: TLabel;
    Label7: TLabel;
    lblEnterF1: TLabel;
    lblDinnerF1: TLabel;
    lblMoveOutF1: TLabel;
    lblDayEndF1: TLabel;
    lblStreetF1: TLabel;
    lblFoundShift: TLabel;
    lblFromCarShift: TLabel;
    lblBrokenShift: TLabel;
    lblTakenOffShift: TLabel;
    lblVihodShift: TLabel;
    lblEnterShift: TLabel;
    lblDinnerShift: TLabel;
    lblMoveOutShift: TLabel;
    lblDayEndShift: TLabel;
    lblStreetShift: TLabel;
    odsNeedUpdate: TOracleDataSet;
    qUpdateUpdateInfo: TOracleQuery;
    tmKeys: TTimer;
    tmrFKey: TTimer;
    bRefresh: TcxButton;
    aRefresh: TAction;
    tAutoRef: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure pnlMainResize(Sender: TObject);
    procedure cxGridDBTableView1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure cxGridDBTableView1DragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure tvNotOnLineDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure aToDinnerExecute(Sender: TObject);
    procedure aFromDinnerExecute(Sender: TObject);
    procedure aFromCarExecute(Sender: TObject);
    procedure aToCarExecute(Sender: TObject);
    procedure aBrokenExecute(Sender: TObject);
    procedure aRepearExecute(Sender: TObject);
    procedure aTakeOffExecute(Sender: TObject);
    procedure aDayEndExecute(Sender: TObject);
    procedure aDayStartExecute(Sender: TObject);
    procedure tvNotOnLineCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure aExitExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aChangeUserExecute(Sender: TObject);
    procedure aMoveOutExecute(Sender: TObject);
    procedure a1Execute(Sender: TObject);
    procedure aClearExecute(Sender: TObject);
    procedure aVihodExecute(Sender: TObject);
    procedure cmbHourPropertiesCloseUp(Sender: TObject);
    procedure pcMainPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure tvNotOnLineCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvNotOnLineCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ActionList1Update(Action: TBasicAction; var Handled: Boolean);
    procedure tvSmenaCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tRefreshTimer(Sender: TObject);
    procedure tvNotOnLineFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure aFindExecute(Sender: TObject);
    procedure cbAllTaxiPropertiesChange(Sender: TObject);
    procedure aHistoryExecute(Sender: TObject);
    procedure aStreetExecute(Sender: TObject);
    procedure tmrSelectCurrentPanelTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure teVihodKeyPress(Sender: TObject; var Key: Char);
    procedure cxButton63MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure aToDinner2Execute(Sender: TObject);
    procedure aFromCar2Execute(Sender: TObject);
    procedure aBroken2Execute(Sender: TObject);
    procedure aTakeOff2Execute(Sender: TObject);
    procedure aDayEnd2Execute(Sender: TObject);
    procedure aMoveOut2Execute(Sender: TObject);
    procedure aHistory2Execute(Sender: TObject);
    procedure aFromCar3Execute(Sender: TObject);
    procedure aBroken3Execute(Sender: TObject);
    procedure aTakeOff3Execute(Sender: TObject);
    procedure aToDinner3Execute(Sender: TObject);
    procedure aMoveOut3Execute(Sender: TObject);
    procedure aDayEnd3Execute(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure osAfterLogOn(Sender: TOracleSession);
    function DoKey(aKey:TKey; Key: Word):Boolean;
    procedure tmKeysTimer(Sender: TObject);
    procedure tmrFKeyTimer(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure tAutoRefTimer(Sender: TObject);
  private
    { Private declarations }
    pCostTalonCar, pCostTalonMin : Double; // Подача машины и минута по талону для конкретного такси
    taxipanel:TTaxiPanel;
    FSotrId:Integer;
    FTaxiId:Integer;
    FSotrFio:string;
    FIsInitNow:Boolean;
    FSelectedRaion:Integer;
    FSelectedRaionTimerCnt:Integer;
    sSynTaxi : string;
    FKeys:array of TKey;
    hLib2: THandle;
    pPERS : Integer;
    v_AutoRef, v_TimeRef : Integer;

    procedure SetSmenaDate(AHour:Integer);
    procedure LoadHourCmb();
    procedure LoadKey();
    function DoFind():Boolean;
    function DoFind2():Boolean;
    procedure DoHistory();
    procedure ConfirmAction(AEventSyn:string; aDriverID:Integer = -1);
    function MoveToPlaceCurrentDriver(aPlace:Integer):Boolean;
    procedure DoVihod();
    procedure DoRefresh();
    procedure LoadParams;

    procedure DllMessage(var Msg: TMessage); message WM_USER + 1678;
    procedure SetupGlobalKeyBoardHook;
    procedure unhook;
    procedure CheckTimer();
    procedure CheckFTimer();
  public
    { Public declarations }
    function DoLogin():Boolean;
    property SelectedRaion:Integer read FSelectedRaion write FSelectedRaion;
    property SelectedRaionTimerCnt:Integer read FSelectedRaionTimerCnt write FSelectedRaionTimerCnt;
  end;

var
  frmMain: TfrmMain;


implementation

uses fLogin, fAdr1, uConfirmAction, uNeedMove;

{$R *.dfm}

{procedure TfrmMain.WMHotKey(var Mess: TWMHotKey);
begin
 MessageBeep(0);
 ShowMessage('Нажата горячая клавиша CTRL+F12');
end;}

procedure TfrmMain.CheckTimer();
begin
  if not tmKeys.Enabled then
    teVihod.Text := '';

  tmKeys.Enabled := false;
  tmKeys.Enabled := true;
end;

procedure TfrmMain.CheckFTimer();
begin
  tmrFKey.Enabled := false;
  tmrFKey.Enabled := true;
end;

function IsKeyDown(key:Integer) : Boolean;
//var
//   State : TKeyboardState;
begin
   result := HiWord(GetKeyState(key)) <> 0;
   //GetKeyboardState(State) ;
   //Result := ((State[key] and 128) <> 0) ;
end;

function IsCtrlShiftAlt() : Boolean;
begin
   Result :=  IsKeyDown(vk_Shift) or IsKeyDown(vk_Control) or IsKeyDown(VK_MENU);
end;

procedure TfrmMain.DllMessage(var Msg: TMessage);
var
  key:Integer;
  I:Integer;
  num_key:Boolean;
  isfoundkey:boolean;
begin
  //ShowMessage(IntToStr(Msg.wParam)+' '+IntToStr(Msg.LParam));
  //teVihod.Text := IntToStr(Msg.wParam);
  num_key := false;
  key := Msg.wParam;
  if (key in [48..57]) and not IsCtrlShiftAlt() then
  begin
    num_key := true;
    if (GetForegroundWindow<>Handle) then
    begin
      CheckTimer();
      CheckFTimer();
      teVihod.Text := teVihod.Text + IntToStr(key-48);
    end;
  end;
  if (key in [96..105]) and not IsCtrlShiftAlt() then
  begin
    num_key := true;
    if (GetForegroundWindow<>Handle) then
    begin
      CheckTimer();
      CheckFTimer();
      teVihod.Text := teVihod.Text + IntToStr(key-96);
    end;
  end;
  if (key = 8) then   //backspace
  begin
    num_key := true;
    if (GetForegroundWindow<>Handle) then
    begin
      if (Length(teVihod.Text) > 0) then
      begin
        //CheckTimer();
        CheckFTimer();
        teVihod.Text := AnsiLeftStr(teVihod.Text, Length(teVihod.Text)-1);
        teVihod.SelStart := Length(teVihod.Text);
      end;
    end;
    Exit;
  end;
  if (key in [16..18]) then
  begin
    num_key := true;
  end;
  if (key in [13]) then
  begin
    for I := 0 to Application.ComponentCount - 1 do
    begin
      if (Application.Components[i] is TfrmNeedMove) then
      begin
        (Application.Components[i] as TfrmNeedMove).aOK.Execute;
      end;
      if (Application.Components[i] is TfrmConfirmAction) then
      begin
        (Application.Components[i] as TfrmConfirmAction).bEnter.Click;
      end;
    end;
  end;

  if (key in [27]) then
  begin
    for I := 0 to Application.ComponentCount - 1 do
    begin
      if (Application.Components[i] is TfrmNeedMove) then
      begin
        (Application.Components[i] as TfrmNeedMove).aCancel.Execute;
      end;
      if (Application.Components[i] is TfrmConfirmAction) then
      begin
        (Application.Components[i] as TfrmConfirmAction).bCancel.Click;
      end;
    end;
  end;

  if (GetForegroundWindow<>Handle) and not (tmrFKey.Enabled or tmKeys.Enabled) then
  begin
    teVihod.Text := '';
    Exit;
  end;

  isfoundkey := false;
  for I := 0 to Length(FKeys)-1 do
  begin
    isfoundkey := DoKey(FKeys[I], key) or isfoundkey;
  end;
  if not (isfoundkey) then
  begin
    if not num_key then
        teVihod.Text := '';
  end;
end;

procedure TfrmMain.SetupGlobalKeyBoardHook;
var
 StartHook1: function(AppHandle: HWND): Byte;
 SHresult: Byte;
begin
  hLib2:=LoadLibrary('Prog_hook_dll.dll');
  @StartHook1:=GetProcAddress(hLib2, 'StartHook');
  if @StartHook1<>nil then
    SHresult:=StartHook1(Handle);
end;

procedure TfrmMain.unhook;
var StopHook1: function: Boolean;
begin
 @StopHook1:=GetProcAddress(hLib2, 'StopHook');
 if @StopHook1=nil then
 begin
   Exit;
  end;
 if StopHook1 then
 begin
 end;
 FreeLibrary(hLib2);
 // for some reason in Win XP you need to call FreeLibrary twice
 // maybe because you get 2 functions from the DLL
 FreeLibrary(hLib2);
end;

function TfrmMain.DoLogin():Boolean;
var TaxiName:string;
    PriceKm:Integer;
begin
  Result := False;
  os.LogOn;
  if (GetLogin(os, 1, FTaxiId, FSotrId, FSotrFio,TaxiName, PriceKm, sSynTaxi, pCostTalonCar, pCostTalonMin)) then
    begin
      Result := true;
      Caption := Format('Сетка водителей. Пользователь: %s',[FSotrFio]);
    end;
end;

procedure TfrmMain.a1Execute(Sender: TObject);
begin
{  if (Sender is TAction) then
    teVihod.Text := teVihod.Text + (Sender as TAction).Caption;
  if (Sender is TcxButton) then
    teVihod.Text := teVihod.Text + (Sender as TcxButton).Caption;  }
end;

procedure TfrmMain.aBroken2Execute(Sender: TObject);
begin
  ConfirmAction('GET_DAMAGE', odsNotOnLine.FieldByName('fk_id').AsInteger);
end;

procedure TfrmMain.aBroken3Execute(Sender: TObject);
begin
  if DoFind2() or (teVihod.Text = '') then
  begin
    ConfirmAction('GET_DAMAGE', odsNotOnLine.FieldByName('fk_id').AsInteger);
    teVihod.Text := '';    
  end;
end;

procedure TfrmMain.aBrokenExecute(Sender: TObject);
begin
  if (DoFind()) then
  begin
    ConfirmAction('GET_DAMAGE');
  end;
end;

procedure TfrmMain.aChangeUserExecute(Sender: TObject);
var
  hour:Integer;
begin
  Hide;
  if (DoLogin()) then
  begin
    FreeAndNil(taxipanel);

    taxipanel := TTaxiPanel.Create(pnlMain);
    taxipanel.Parent := pnlMain;
    taxipanel.MaxGridOnLine := 3;
    os.LogOn;
    odsNotOnLine.DisableControls;
    try
      odsNotOnLine.Close;
      odsNotOnLine.SetVariable('TAXIID',FTaxiId);
      odsNotOnLine.Open;
    finally
      odsNotOnLine.EnableControls;
    end;
    taxipanel.CreateChilds(os, FTaxiId, tvNotOnLine);
    taxipanel.PopUp := popAction;
    hour := HourOf(taxipanel.GetCurrentDate());
    SetSmenaDate(hour);
    LoadHourCmb();
    cmbHour.ItemIndex := 0;
  end
  else begin
    //Application.Terminate();
  end;
  Show;
  taxipanel.DoResize();  
end;

procedure TfrmMain.aClearExecute(Sender: TObject);
begin
  teVihod.Text := '';
end;

procedure TfrmMain.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
  aVihod.Enabled := teVihod.Text<>'';
  aFind.Enabled := teVihod.Text<>'';
end;

procedure TfrmMain.aDayEnd2Execute(Sender: TObject);
begin
  ConfirmAction('DAY_END', odsNotOnLine.FieldByName('fk_id').AsInteger);
end;

procedure TfrmMain.aDayEnd3Execute(Sender: TObject);
begin
  if DoFind2() or (teVihod.Text = '') then
  begin
    ConfirmAction('DAY_END', odsNotOnLine.FieldByName('fk_id').AsInteger);
    teVihod.Text := '';    
  end;
end;

procedure TfrmMain.aDayEndExecute(Sender: TObject);
begin
  if (DoFind()) then
  begin
    ConfirmAction('DAY_END');
  end;
  //taxipanel.ChangeSelectedTaxiEvent('DAY_END');
end;

procedure TfrmMain.aDayStartExecute(Sender: TObject);
begin
  taxipanel.ChangeSelectedTaxiEvent('ARRIVED');
end;

procedure TfrmMain.aExitExecute(Sender: TObject);
begin
  Close;
end;

function TfrmMain.DoFind2():Boolean;
begin
  if (teVihod.Text='') then
  begin
    Result := false;  
  end
  else begin
    Result := odsNotOnLine.Locate('FC_NAME',teVihod.Text,[]);
  end;
end;

function TfrmMain.DoFind():Boolean;
var
   DriverId:Variant;
   bNotOnline:Boolean;
   cx:TcxGridSite;
begin
  //ShowMessage(popAction.PopupComponent.ClassName);
  bNotOnline := false;
  if (teVihod.Text = '') then
  begin
    if (popAction.PopupComponent<>nil) then
    begin
      bNotOnline := popAction.PopupComponent = tvNotOnLine;
      if (not bNotOnline) then
      begin
        if (popAction.PopupComponent is TcxGridSite) then
        begin
          cx := popAction.PopupComponent as TcxGridSite;
          bNotOnline := cx.GridView = tvNotOnLine;
        end;
      end;
    end;
    if (bNotOnline) then
    begin
      Result := true;
      Exit;
    end
    else begin
      DriverId := taxipanel.GetCurrentDriverId();
      Result := odsNotOnLine.Locate('FK_ID',DriverId,[]);
      //Result := false;
      Exit;
    end;
  end;
  Result := odsNotOnLine.Locate('FC_NAME',teVihod.Text,[]);
  teVihod.Text := '';
end;

procedure TfrmMain.aFindExecute(Sender: TObject);
begin
  DoFind();
end;

procedure TfrmMain.aFromCar2Execute(Sender: TObject);
begin
  ConfirmAction('GO_FROM_CAR', odsNotOnLine.FieldByName('fk_id').AsInteger);
end;

procedure TfrmMain.aFromCar3Execute(Sender: TObject);
begin
  if DoFind2() or (teVihod.Text = '') then
  begin
    ConfirmAction('GO_FROM_CAR', odsNotOnLine.FieldByName('fk_id').AsInteger);
    teVihod.Text := '';
  end;
end;

procedure TfrmMain.aFromCarExecute(Sender: TObject);
begin
  if (DoFind()) then
  begin
    ConfirmAction('GO_FROM_CAR');
  end;
end;

procedure TfrmMain.aFromDinnerExecute(Sender: TObject);
begin
  taxipanel.ChangeSelectedTaxiEvent('BACK_DINNER');
end;

procedure TfrmMain.aHistory2Execute(Sender: TObject);
begin
  aHistory.Execute;
end;

procedure TfrmMain.aHistoryExecute(Sender: TObject);
begin
  DoHistory();
  pcMain.ActivePage := tsHistory;
end;

procedure TfrmMain.aMoveOut2Execute(Sender: TObject);
begin
  ConfirmAction('MOVE_OUT', odsNotOnLine.FieldByName('fk_id').AsInteger);
end;

procedure TfrmMain.aMoveOut3Execute(Sender: TObject);
begin
  if DoFind2() or (teVihod.Text = '') then
  begin
    ConfirmAction('MOVE_OUT', odsNotOnLine.FieldByName('fk_id').AsInteger);
    teVihod.Text := '';    
  end;
end;

procedure TfrmMain.aMoveOutExecute(Sender: TObject);
begin
  if (DoFind()) then
  begin
    ConfirmAction('MOVE_OUT');
  end;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin
  DoRefresh();
end;

procedure TfrmMain.aRepearExecute(Sender: TObject);
begin
  taxipanel.ChangeSelectedTaxiEvent('REPEAR_DAMAGE');
end;

procedure TfrmMain.aStreetExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmAdr1, frmAdr1);
  frmAdr1.DoShowForm();
  frmAdr1.Show;
end;

procedure TfrmMain.aTakeOff2Execute(Sender: TObject);
begin
  ConfirmAction('TAKE_OFF_FROM_LINE', odsNotOnLine.FieldByName('fk_id').AsInteger);
end;

procedure TfrmMain.aTakeOff3Execute(Sender: TObject);
begin
  if DoFind2() or (teVihod.Text = '') then
  begin
    ConfirmAction('TAKE_OFF_FROM_LINE', odsNotOnLine.FieldByName('fk_id').AsInteger);
    teVihod.Text := '';
  end;
end;

procedure TfrmMain.aTakeOffExecute(Sender: TObject);
begin
  if (DoFind()) then
  begin
    ConfirmAction('TAKE_OFF_FROM_LINE');
  end;
end;

procedure TfrmMain.aToCarExecute(Sender: TObject);
begin
  taxipanel.ChangeSelectedTaxiEvent('BACK_TO_CAR');
end;

procedure TfrmMain.aToDinner2Execute(Sender: TObject);
begin
  ConfirmAction('GO_DINNER', odsNotOnLine.FieldByName('fk_id').AsInteger);
end;

procedure TfrmMain.aToDinner3Execute(Sender: TObject);
begin
  if DoFind2() or (teVihod.Text = '') then
  begin
    ConfirmAction('GO_DINNER', odsNotOnLine.FieldByName('fk_id').AsInteger);
    teVihod.Text := '';    
  end;
end;

procedure TfrmMain.aToDinnerExecute(Sender: TObject);
begin
  if (DoFind()) then
  begin
    ConfirmAction('GO_DINNER');
  end;
end;

procedure TfrmMain.DoVihod();
var
  sPosiv:string;
  iDriverId:Integer;
  sTmp:string;
begin
  sPosiv := teVihod.Text;
  if (not odsNotOnLine.Locate('fc_name',sPosiv,[])) then
  begin
    iDriverId := taxipanel.GetDriverByPosiv(sPosiv);
    if iDriverId > 0 then
    begin
      taxipanel.ChangeTaxiEvent(iDriverId,'ARRIVED',null, null);
      odsNotOnLine.DisableControls;
      try
        odsNotOnLine.Close;
        odsNotOnLine.Open;
        odsNotOnLine.Locate('fk_id',iDriverId,[]);
      finally
        odsNotOnLine.EnableControls;
      end;
    end
    else begin
      sTmp := Format('Водитель с позывным %s не найден',[sPosiv]);
      Application.MessageBox(PChar(sTmp), 'Внимание',
        MB_OK + MB_ICONQUESTION);
    end;
  end;
end;

procedure TfrmMain.aVihodExecute(Sender: TObject);
begin
  DoVihod();
  teVihod.Text := '';
end;

procedure TfrmMain.cbAllTaxiPropertiesChange(Sender: TObject);
begin
  taxipanel.ShowAllTaxi := cbAllTaxi.Checked;
  taxipanel.RefreshAllOds();
end;

procedure TfrmMain.cmbHourPropertiesCloseUp(Sender: TObject);
begin
  SetSmenaDate(StrToInt(cmbHour.Text));
end;

procedure TfrmMain.SetSmenaDate(AHour:Integer);
var
  date:TDateTime;
begin
  with odsGetSmenaDate do
  begin
    Close;
    SetVariable('PHOUR',AHour);
    Open;
    date := FieldByName('qtime').AsDateTime;
    lblTime.Caption := '('+FieldByName('time').AsString+')';
    Close;
  end;
  odsSmena.Close;
  odsSmena.SetVariable('TAXIID', FTaxiId);
  odsSmena.SetVariable('PDATE', date);
  odsSmena.Open;
end;

procedure TfrmMain.cxButton63MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Sender is TAction) then
    teVihod.Text := teVihod.Text + (Sender as TAction).Caption;
  if (Sender is TcxButton) then
    teVihod.Text := teVihod.Text + (Sender as TcxButton).Caption;
end;

procedure TfrmMain.cxButton8Click(Sender: TObject);
begin
  if (gNotOnLine.Focused) then
    ShowMessage('1');
end;

procedure TfrmMain.cxGridDBTableView1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  ADroppedView: TcxGridDBTableView;
begin
  if Source is TcxDragControlObject then
    with TcxDragControlObject(Source) do
      if Control is TcxGridSite then
        with TcxGridSite(Control) do
        begin
          ADroppedView := GridView as TcxGridDBTableView;
          if (ADroppedView<>nil) then
          begin
            ShowMessage(ADroppedView.DataController.Controller.SelectedRecords[0].Values[0]);

          end;
        end;
end;

procedure TfrmMain.cxGridDBTableView1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := true;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Application.MessageBox('Выйти из программы?', 'Вопрос', MB_YESNO + 
    MB_ICONQUESTION) = IDYES then
  begin
    CanClose := True;
  end
  else
  begin
    CanClose := False;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var hour : Integer;
begin
  SetupGlobalKeyBoardHook;
  ControlStyle := ControlStyle + [csOpaque];
  DoubleBuffered:=True;
  lblFoundF1.Caption := '';
  lblFoundShift.Caption := '';

  lblFromCarF1.Caption := '';
  lblFromCarShift.Caption := '';

  lblBrokenF1.Caption := '';
  lblBrokenShift.Caption := '';

  lblTakenOffF1.Caption := '';
  lblTakenOffShift.Caption := '';

  lblVihodF1.Caption := '';
  lblVihodShift.Caption := '';

  lblEnterF1.Caption := '';
  lblEnterShift.Caption := '';

  lblDinnerF1.Caption := '';
  lblDinnerShift.Caption := '';

  lblMoveOutF1.Caption := '';
  lblMoveOutShift.Caption := '';

  lblDayEndF1.Caption := '';
  lblDayEndShift.Caption := '';

  lblStreetF1.Caption := '';
  lblStreetShift.Caption := '';

  pnlMain.ControlStyle := ControlStyle + [csOpaque];
  pnlMain.DoubleBuffered := True;
  pnlMain.FullRepaint := False;

  SetLength(FKeys, 10);
  FKeys[0].synonym := 'FOUND';
  FKeys[0].action := aFind;
  FKeys[0].F1 := lblFoundF1;
  FKeys[0].ShiftL := lblFoundShift;

  FKeys[1].synonym := 'FROMCAR';
  FKeys[1].action := aFromCar3;
  FKeys[1].F1 := lblFromCarF1;
  FKeys[1].ShiftL := lblFromCarShift;

  FKeys[2].synonym := 'POLOMKA';
  FKeys[2].action := aBroken3;
  FKeys[2].F1 := lblBrokenF1;
  FKeys[2].ShiftL := lblBrokenShift;

  FKeys[3].synonym := 'SNJAT';
  FKeys[3].action := aTakeOff3;
  FKeys[3].F1 := lblTakenOffF1;
  FKeys[3].ShiftL := lblTakenOffShift;

  FKeys[4].synonym := 'NALINIA';
  FKeys[4].action := aVihod;
  FKeys[4].F1 := lblVihodF1;
  FKeys[4].ShiftL := lblVihodShift;

  FKeys[5].synonym := 'VVOD';
  FKeys[5].action := aEnter;
  FKeys[5].F1 := lblEnterF1;
  FKeys[5].ShiftL := lblEnterShift;

  FKeys[6].synonym := 'DINER';
  FKeys[6].action := aToDinner3;
  FKeys[6].F1 := lblDinnerF1;
  FKeys[6].ShiftL := lblDinnerShift;

  FKeys[7].synonym := 'OTLUCH';
  FKeys[7].action := aMoveOut3;
  FKeys[7].F1 := lblMoveOutF1;
  FKeys[7].ShiftL := lblMoveOutShift;

  FKeys[8].synonym := 'SMENAEND';
  FKeys[8].action := aDayEnd3;
  FKeys[8].F1 := lblDayEndF1;
  FKeys[8].ShiftL := lblDayEndShift;

  FKeys[9].synonym := 'STREET';
  FKeys[9].action := aStreet;
  FKeys[9].F1 := lblStreetF1;
  FKeys[9].ShiftL := lblStreetShift;

  WindowState := wsMaximized;
  Application.ProcessMessages;

  if (DoLogin()) then
    begin
      taxipanel := TTaxiPanel.Create(pnlMain);
      taxipanel.Parent := pnlMain;
      taxipanel.MaxGridOnLine := 10;
      os.LogOn;
      odsNotOnLine.DisableControls;
      try
        odsNotOnLine.Close;
        odsNotOnLine.SetVariable('TAXIID',FTaxiId);
        odsNotOnLine.Open;
      finally
        odsNotOnLine.EnableControls;
      end;
      taxipanel.CreateChilds(os, FTaxiId, tvNotOnLine);
      taxipanel.PopUp := popAction;
      hour := HourOf(taxipanel.GetCurrentDate());
      SetSmenaDate(hour);
      LoadHourCmb();
      cmbHour.ItemIndex := 0;
      pcMain.ActivePage := tsOnLine;
      LoadKey();
      LoadParams;
      if v_AutoRef = 1 then
        begin
          tAutoRef.Interval := v_TimeRef*1000;
          tAutoRef.Enabled := True;
        end;
    end else
    begin
      Application.Terminate();
    end;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
//  UnregisterHotKey(Handle, 1);
  unhook;
  SetLength(FKeys, 0);
end;

function TfrmMain.DoKey(aKey:TKey; Key: Word):Boolean;
  var
    k:Integer;
  begin
    Result := false;
    if TryStrToInt(aKey.key, k) then
    begin
      if (k = Key)
        and (not(aKey.shift) or (aKey.shift and IsKeyDown(vk_Shift)))
        and (not(aKey.alt) or (aKey.alt and IsKeyDown(VK_MENU)))
        and (not(aKey.ctrl) or (aKey.ctrl and IsKeyDown(vk_Control)))  then
      begin
        Result := true;
        if (aKey.action <> nil) then
        begin
          if (aKey.action.Enabled) then
          begin
            aKey.action.Execute();
          end;
        end
        else begin
          if (aKey.raion <> null) then
          begin
            if not MoveToPlaceCurrentDriver(aKey.raion) then
            begin
              try
                teVihod.SetFocus;
              except
              end;
            end;
          end;
        end;
      end;
    end;
  end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  procedure DoKey(aKey:TKey);
  var
    k:Integer;
  begin
    if TryStrToInt(aKey.key, k) then
    begin
      if (k = Key)
        and (not(aKey.shift) or (aKey.shift and (Shift >= [ssShift])))
        and (not(aKey.alt) or (aKey.alt and (Shift >= [ssAlt])))
        and (not(aKey.ctrl) or (aKey.ctrl and (Shift >= [ssCtrl]))) then
      begin
        if (aKey.action <> nil) then
        begin
          if (aKey.action.Enabled) then
            aKey.action.Execute();
        end
        else begin
          if (aKey.raion <> null) then
          begin
            if not MoveToPlaceCurrentDriver(aKey.raion) then
            begin
              try
                teVihod.SetFocus;
              except
              end;
            end;
          end;
        end;
      end;
    end;
  end;
var
  I: Integer;
begin
  if key in [48..57] then
  begin
    if not(teVihod.Focused) then
      teVihod.Text := teVihod.Text + IntToStr(key-48);
  end;
  if key in [96..105] then
  begin
    if not(teVihod.Focused) then
      teVihod.Text := teVihod.Text + IntToStr(key-96);
  end;

  for I := 0 to Length(FKeys)-1 do
  begin
    DoKey(FKeys[I]);
  end;
  {DoKey(FKeyFound);
  DoKey(FKeyFromCar);
  DoKey(FKeyBroken);
  DoKey(FKeyTakeOut);
  DoKey(FKeyAtLine);
  DoKey(FKeyVvod);
  DoKey(FKeyDiner);
  DoKey(FKeyOtluchils);
  DoKey(FKeyEndSmena);
  DoKey(FKeyStreet);}
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  teVihod.SetFocus;
end;

procedure TfrmMain.pcMainPageChanging(Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
var curhour : string;
    I : Integer;
begin
  if NewPage = tsOnSmena then
    begin
      curhour := cmbHour.Text;
      odsSmena.Close;
      odsSmena.Open;
      LoadHourCmb();
      cmbHour.ItemIndex := 0;
      for I := 0 to cmbHour.Properties.Items.Count - 1 do
        begin
          if (cmbHour.Properties.Items[I]=curhour) then
            begin
              cmbHour.ItemIndex := I;
              Break;
            end;
        end;
    end;
  if NewPage = tsHistory then
    begin
      DoHistory();
      odsDriverEventTmp.Close;
      odsDriverEventTmp.Open;
      odsHistoryItogo.Close;
      odsHistoryItogo.Open;
    end;
end;

procedure TfrmMain.pnlMainResize(Sender: TObject);
begin
  taxipanel.DoResize();
end;

procedure TfrmMain.tAutoRefTimer(Sender: TObject);
begin
  DoRefresh();
end;

procedure TfrmMain.teVihodKeyPress(Sender: TObject; var Key: Char);
begin
//  if not (Key in ['0'..'9']) and not (Key = #8) then
//  begin
//    Key :=#0;
//  end
//  else begin
//    if not (Key = #8) then
//    begin
//      CheckTimer();
//    end;
//  end;
end;

procedure TfrmMain.tmKeysTimer(Sender: TObject);
begin
  tmKeys.Enabled := false;
end;

procedure TfrmMain.tmrFKeyTimer(Sender: TObject);
begin
  tmrFKey.Enabled := false;
end;

procedure TfrmMain.tmrSelectCurrentPanelTimer(Sender: TObject);
begin
  if (SelectedRaionTimerCnt < 8) then
  begin
    if Round(SelectedRaionTimerCnt/2)=(SelectedRaionTimerCnt/2) then
      taxipanel.SelectedRaion :=  FSelectedRaion
    else
      taxipanel.SelectedRaion :=  -1;
    SelectedRaionTimerCnt := SelectedRaionTimerCnt + 1;
  end
  else begin
    taxipanel.SelectedRaion :=  -1;
    tmrSelectCurrentPanel.Enabled := false;
  end;
end;

procedure TfrmMain.DoRefresh();
var DriverId : Integer;
    topnotonline, topsmena : Integer;

  procedure RefreshOds(aods:TOracleDataSet);
  begin
    if (aods.Active) then
      begin
        DriverId := aods.FieldByName('fk_id').AsInteger;
        try
          aods.DisableControls;
          aods.Close;
          aods.Open;
          aods.Locate('fk_id',DriverId,[]);
        finally
          aods.EnableControls;
        end;
      end;
  end;
begin
  FIsInitNow := true;
  try
    if (taxipanel<>nil) then
      begin
        taxipanel.RefreshAllOds();
      end;
    topnotonline := tvNotOnLine.Controller.TopRowIndex;
    topsmena := tvSmena.Controller.TopRowIndex;

    RefreshOds(odsNotOnLine);
    RefreshOds(odsSmena);

    tvNotOnLine.Controller.TopRowIndex := topnotonline;
    tvSmena.Controller.TopRowIndex := topsmena;
  finally
    FIsInitNow := false;
  end;
end;

procedure TfrmMain.tRefreshTimer(Sender: TObject);
begin
  with odsNeedUpdate do
    begin
      Close;
      Open;
      if (Locate('FK_TAXI',FTaxiId,[])) then
        begin
          if (FieldByName('FL_NEEDREFRESH').AsString = '1') then // необходимо ли обновление (1-да, 0-нет)
            begin
              DoRefresh();
              with qUpdateUpdateInfo do
                begin
                  SetVariable('PTAXIID', FTaxiId);
                  Execute;
                  Session.Commit;
                end;
            end;
        end;
    end;
end;

procedure TfrmMain.tvNotOnLineCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  taxipanel.SelectDriver(odsNotOnLine.FieldByName('fk_id').AsInteger);
end;

procedure TfrmMain.tvNotOnLineCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  foo: TPoint;
begin
  GetCursorPos(foo);
  popNotOnline.PopupComponent := Sender;
  popNotOnline.Popup(foo.X,foo.Y);
end;

procedure TfrmMain.tvNotOnLineCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  taxipanel.tvCustomDrawCell(Sender,ACanvas,AViewInfo,ADone);
end;

procedure TfrmMain.tvNotOnLineDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
   Accept := False;
end;

procedure TfrmMain.tvNotOnLineFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if not FIsInitNow then
  begin
    taxipanel.SelectDriver(odsNotOnLine.FieldByName('fk_id').AsInteger);
  end;
end;

procedure TfrmMain.tvSmenaCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  taxipanel.tvCustomDrawCell(Sender,ACanvas,AViewInfo,ADone);
end;

procedure TfrmMain.LoadHourCmb();
var
  I: Integer;
  date:TDateTime;
  hour:Integer;
begin
  cmbHour.Properties.Items.Clear;
  date := taxipanel.GetCurrentDate();
  for I := 0 to 12 do
  begin
    hour := HourOf(IncHour(date,-1*I));
    cmbHour.Properties.Items.Add(IntToStr(hour));
  end;
end;

procedure TfrmMain.LoadKey;
var
  I: Integer;
  synonym : string;
  J: Integer;
  raion:Variant;
  ilen:Integer;
begin
  with odsKeys do
  begin
    Open;
    First;
    for I := 0 to RecordCount - 1 do
    begin
      raion := FieldByName('fk_raion').AsVariant;
      if (raion<>null) then
      begin
        ilen := Length(FKeys);
        SetLength(FKeys,ilen+1);
        FKeys[ilen].key := FieldByName('fc_key').AsString;
        FKeys[ilen].shift := FieldByName('fl_shift').AsString = '1';
        FKeys[ilen].alt := FieldByName('fl_alt').AsString = '1';
        FKeys[ilen].ctrl := FieldByName('fl_ctrl').AsString = '1';
        FKeys[ilen].raion := FieldByName('fk_raion').AsVariant;
      end
      else
      begin
        synonym := FieldByName('fc_synonym').AsString;
        for J := 0 to Length(FKeys) - 1 do
        begin
          if (FKeys[j].synonym = synonym) and (FKeys[j].synonym <> '') then
          begin
            FKeys[j].key := FieldByName('fc_key').AsString;
            if (FKeys[j].F1<>nil) then
            begin
              FKeys[j].F1.Caption := FieldByName('fc_symbol').AsString;
            end;
            FKeys[j].shift := FieldByName('fl_shift').AsString = '1';
            FKeys[j].alt := FieldByName('fl_alt').AsString = '1';
            FKeys[j].ctrl := FieldByName('fl_ctrl').AsString = '1';
            if (FKeys[j].ShiftL<>nil) then
            begin
              if FKeys[j].shift then
                FKeys[j].ShiftL.Caption := FKeys[j].ShiftL.Caption + ' Shift';
              if FKeys[j].alt then
                FKeys[j].ShiftL.Caption := FKeys[j].ShiftL.Caption + ' Alt';
              if FKeys[j].ctrl then
                FKeys[j].ShiftL.Caption := FKeys[j].ShiftL.Caption + ' Ctrl';
              FKeys[j].ShiftL.Caption := TrimLeft(FKeys[j].ShiftL.Caption);
            end;
          end;
      end;
      end;
      Next;
    end;
    Close;
  end;
end;

procedure TfrmMain.LoadParams;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.SQl.Text := ' select * from taxi.tparams ';
    ods.Open;
    ods.First;
    while not ods.Eof do
      begin
        if ods.FieldByName('fc_key').AsString = 'AUTO_REF_TAXI' then
          begin
            v_AutoRef := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
        if ods.FieldByName('fc_key').AsString = 'TIME_AUTO_REF' then
          begin
            v_TimeRef := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
        ods.Next;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.ConfirmAction(AEventSyn:string; aDriverID:Integer = -1);
var syn : string;
    frmConfirmAction : TfrmConfirmAction;
begin
  syn := odsNotOnLine.FieldByName('fc_synonym').AsString;
  if (syn = 'START_CLIENT_MOVE') or (syn = 'MOVE_TO_CLIENT') or (syn = 'CANCEL_CLIENT_MOVE') then
    begin
      Application.CreateForm(TfrmConfirmAction, frmConfirmAction);
      with frmConfirmAction do
        begin
          OS := self.os;
          EventSyn:=AEventSyn;
          if (aDriverID = -1) then
            begin
              DriverId:=taxipanel.GetCurrentDriverId();
            end else
            begin
        DriverId:=aDriverID;      
      end;
      commonpanel := taxipanel;
      if (syn = 'MOVE_TO_CLIENT') then
      begin
        lbCap.Caption := 'Водитель едет к клиенту. Выполнить действие?'
      end;
      if (syn = 'START_CLIENT_MOVE') or (syn = 'CANCEL_CLIENT_MOVE') then
      begin
        lbCap.Caption := 'Водитель зафиксирован. Выполнить действие?'
      end;
      Show;
    end;
  end
  else begin
    if (aDriverID = -1) then
    begin
      taxipanel.ChangeSelectedTaxiEvent(AEventSyn);
    end
    else begin
      taxipanel.ChangeTaxiEvent(aDriverID, AEventSyn, null, null);
      taxipanel.RefreshAllOds;
      with odsNotOnLine do
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

procedure TfrmMain.DoHistory;
begin
  with qSetHistory do
    begin
      SetVariable('PDRIVER', odsNotOnLine.FieldByName('fk_id').AsInteger);
      Execute;
      tsHistory.Caption := format('%s: cписок событий', [odsNotOnLine.FieldByName('fc_name').AsString]);
    end;
end;

function TfrmMain.MoveToPlaceCurrentDriver(aPlace:Integer):Boolean;
var
  driverid:Integer;
  synonym, journal_id:string;
  frmNeedMove: TfrmNeedMove;
begin
  Result := false;
  if (teVihod.Text <> '') then
  begin
    if not(odsNotOnLine.Locate('FC_NAME',teVihod.Text,[])) then
    begin
      DoVihod();
    end;
  end;
  if (teVihod.Text = '') or (odsNotOnLine.Locate('FC_NAME',teVihod.Text,[])) then
  begin
    driverid := odsNotOnLine.FieldByName('fk_id').AsInteger;
    synonym := odsNotOnLine.FieldByName('fc_synonym').AsString;
    if (synonym='START_CLIENT_MOVE') or (synonym='MOVE_TO_CLIENT') or (synonym='CANCEL_CLIENT_MOVE') then
    begin
      journal_id := odsNotOnLine.FieldByName('fk_journal').AsString;
      Application.CreateForm(TfrmNeedMove, frmNeedMove);
      frmNeedMove.DriverId := driverid;
      frmNeedMove.Prev_syn := synonym;
      frmNeedMove.PlaceId := aPlace;
      frmNeedMove.Journal_id := journal_id;
      frmNeedMove.CommonPanel := taxipanel;
      frmNeedMove.OS := Os;
      if (synonym = 'MOVE_TO_CLIENT') then
      begin
        frmNeedMove.lbCap.Caption := 'Водитель едет к клиенту. Переместить?'
      end;
      if (synonym = 'START_CLIENT_MOVE') or (synonym='CANCEL_CLIENT_MOVE') then
      begin
        frmNeedMove.lbCap.Caption := 'Водитель зафиксирован. Переместить?'
      end;

      frmNeedMove.Show;
      frmNeedMove.SetFocus;
      Result := true;
    end
    else begin
      taxipanel.MoveTaxiToPlace(driverid, aPlace);
      taxipanel.RefreshAllOds;
      odsNotOnLine.Close;
      odsNotOnLine.Open;
      odsNotOnLine.Locate('fk_id',driverid,[]);      
    end;
    teVihod.Text := '';    
  end;
end;

procedure TfrmMain.osAfterLogOn(Sender: TOracleSession);
begin
   Sender.DBMS_Application_Info.Set_Client_Info('ParamStr(1)');
   Sender.DBMS_Application_Info.Set_Module('TaxiDispetcher','LogOn');
end;

end.
