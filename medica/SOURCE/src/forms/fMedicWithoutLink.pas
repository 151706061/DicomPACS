unit fMedicWithoutLink;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, JvComponentBase, JvFormPlacement,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, OracleData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, StdCtrls,
  Mask, JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit,
  JvDatePickerEdit, JvExControls, JvArrowButton, ExtCtrls, ComCtrls,
  ToolWin, ActnList, Menus, DateUtils, JvStringHolder, Oracle;

type
  TfrmMedicWithoutLink = class(TForm)
    alActions: TActionList;
    aChoose: TAction;
    aClose: TAction;
    aRefresh: TAction;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    Panel1: TPanel;
    abuSetDocPeriod: TJvArrowButton;
    dpeDate1: TJvDatePickerEdit;
    dpeDate2: TJvDatePickerEdit;
    ToolButton5: TToolButton;
    ToolButton4: TToolButton;
    tvMedicWithoutLink: TcxGridDBTableView;
    gMedicWithoutLinkL: TcxGridLevel;
    gMedicWithoutLink: TcxGrid;
    odsMedicWithoutLink: TOracleDataSet;
    dsMedicWithoutLink: TDataSource;
    tvMedicWithoutLinkColumn1: TcxGridDBColumn;
    tvMedicWithoutLinkColumn2: TcxGridDBColumn;
    tvMedicWithoutLinkColumn3: TcxGridDBColumn;
    FormStorage: TJvFormStorage;
    pmDates: TPopupMenu;
    N20: TMenuItem;
    N18: TMenuItem;
    N16: TMenuItem;
    N21: TMenuItem;
    N17: TMenuItem;
    N15: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    mshNazMark: TJvMultiStringHolder;
    procedure aRefreshExecute(Sender: TObject);
    procedure aChooseExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure dpeDate1CheckClick(Sender: TObject);
    procedure tvMedicWithoutLinkCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure alActionsUpdate(Action: TBasicAction; var Handled: Boolean);
  private
    { Private declarations }
    FPacID:Integer;
    FIsFilterByDate:Boolean;
    procedure SetIsFilterByDate(Value:Boolean);
  public
    { Public declarations }
    property PacID:Integer read FPacID write FPacID;
    property IsFilterByDate:Boolean read FIsFilterByDate write SetIsFilterByDate;
    procedure Init(APacID:Integer);
    function GetDate():TDateTime;
  end;

  function GetLinkDate(var ADate:TDateTime;APacID:Integer):Boolean;

implementation

uses fdmMain;

{$R *.dfm}

function GetLinkDate(var ADate:TDateTime;APacID:Integer):Boolean;
begin
  with TfrmMedicWithoutLink.Create(nil) do
  begin
    try
      Init(APacID);
      Result := ShowModal = mrOk;
      if Result then
        ADate := GetDate();
    finally
      Free;
    end;
  end;
end;

procedure TfrmMedicWithoutLink.Init(APacID:Integer);
begin
  PacID := APacID;
  FormStorage.Active := True;
  FormStorage.RestoreFormPlacement;
//  dpeDate1.Date := StrToDate(IniReadString( iniFileName, Self.Name, 'dpeDate1Date', DateToStr( Trunc(ServerDate(dmMain.os)))) );
//  dpeDate2.Date := StrToDate(IniReadString( iniFileName, Self.Name, 'dpeDate2Date', DateToStr( Trunc(ServerDate(dmMain.os)))) );
  IsFilterByDate := True;
end;

function TfrmMedicWithoutLink.GetDate():TDateTime;
begin
  Result := odsMedicWithoutLink.FieldByName('fd_truncpost').AsDateTime;
end;

procedure TfrmMedicWithoutLink.aRefreshExecute(Sender: TObject);
begin
  IsFilterByDate := IsFilterByDate;
end;

procedure TfrmMedicWithoutLink.aChooseExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmMedicWithoutLink.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmMedicWithoutLink.N20Click(Sender: TObject);
var
  CurDate : TDate;
begin
  if not Assigned(Sender) then Exit;
  CurDate := ServerDate(dmMain.os);
  case TMenuItem(Sender).Tag of
    1:  // прошлый год
    begin
      dpeDate1.Date := Trunc(StartOfTheYear(IncYear(CurDate, -1)));
      dpeDate2.Date := Trunc(EndOfTheYear(IncYear(CurDate, -1)));
    end;

    2:  // “екущий год
    begin
      dpeDate1.Date := Trunc(StartOfTheYear(CurDate));
      dpeDate2.Date := Trunc(EndOfTheYear(CurDate));
    end;

    3:  // прошлый мес€ц
    begin
      dpeDate1.Date := Trunc(StartOfTheMonth(IncMonth(CurDate,-1)));
      dpeDate2.Date := Trunc(EndOfTheMonth(IncMonth(CurDate,-1)));
    end;

    4:  // текущий мес€ц
    begin
      dpeDate1.Date := Trunc(StartOfTheMonth(CurDate));
      dpeDate2.Date := Trunc(EndOfTheMonth(CurDate));
    end;

    5:  // текущий день
    begin
      dpeDate1.Date := Trunc(CurDate);
      dpeDate2.Date := Trunc(CurDate);
    end;
  end;
  IsFilterByDate := (TMenuItem(Sender).Tag <> 0);
end;

procedure TfrmMedicWithoutLink.SetIsFilterByDate(Value:Boolean);
var
  PrevNazmarkid:Integer;
begin
  FIsFilterByDate := Value;

  PrevNazmarkid := -1;
  if odsMedicWithoutLink.Active then
  begin
    PrevNazmarkid := odsMedicWithoutLink.FieldByName('Nazmarkid').AsInteger;
  end;

  if dpeDate1.Checked<>IsFilterByDate then
  begin
    dpeDate1.Checked := IsFilterByDate;
  end;
  
  if dpeDate2.Checked<>IsFilterByDate then
  begin
    dpeDate2.Checked := IsFilterByDate;
  end;

  odsMedicWithoutLink.Close;
  odsMedicWithoutLink.DeleteVariables;
  odsMedicWithoutLink.DeclareAndSet('ppacid',otInteger,PacID);
  if IsFilterByDate then
  begin
    odsMedicWithoutLink.SQL.Text := mshNazMark.StringsByName['FilterByDate'].Text;
    odsMedicWithoutLink.DeclareAndSet('ps',otDate,dpeDate1.Date);
    odsMedicWithoutLink.DeclareAndSet('ppo',otDate,dpeDate2.Date);
  end
  else begin
    odsMedicWithoutLink.SQL.Text := mshNazMark.StringsByName['NoFilterByDate'].Text;
  end;
  odsMedicWithoutLink.Open;
  odsMedicWithoutLink.Locate('Nazmarkid',PrevNazmarkid,[]);
end;

procedure TfrmMedicWithoutLink.dpeDate1CheckClick(Sender: TObject);
begin
  IsFilterByDate := TJvDatePickerEdit(sender).Checked;
end;

procedure TfrmMedicWithoutLink.tvMedicWithoutLinkCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aChoose.Execute;
end;

procedure TfrmMedicWithoutLink.alActionsUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  if odsMedicWithoutLink.Active then
  begin
    aChoose.Enabled := odsMedicWithoutLink.RecordCount>0;
  end
  else begin
    aChoose.Enabled := False;  
  end;
end;

end.
