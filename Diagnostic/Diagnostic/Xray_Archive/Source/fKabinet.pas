unit fKabinet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, Menus, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls,
  cxLabel, cxContainer, cxTextEdit, OracleData, dxSkinsCore,
  dxSkinscxPCPainter, cxImageComboBox, cxCheckBox;

type
  TfrmKabinet = class(TForm)
    tvKabinet: TcxGridDBTableView;
    grlKabinetLevel1: TcxGridLevel;
    grKabinet: TcxGrid;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    FilterText: TcxTextEdit;
    cxLabel1: TcxLabel;
    odsKabinet: TOracleDataSet;
    dsKabinet: TDataSource;
    tvKabinetName: TcxGridDBColumn;
    bbClear: TcxButton;
    Panel2: TPanel;
    bbOk: TcxButton;
    bbCancel: TcxButton;
    tvKabinetFK_ID: TcxGridDBColumn;
    tvKabinetFN_ORDER: TcxGridDBColumn;
    tvKabinetFC_PHONE: TcxGridDBColumn;
    tvKabinetIS_FLU: TcxGridDBColumn;
    tvKabinetCHK: TcxGridDBColumn;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FilterTextKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FilterTextClick(Sender: TObject);
    procedure FilterTextEnter(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure tvKabinetKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tvKabinetCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure odsKabinetApplyRecord(Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
      var NewRowId: string);
  private
    Russian : HKL;
    { Private declarations }
  public
    FSelectedKab : string;
    procedure Init(ASotr : integer);
    { Public declarations }
  end;

var
  frmKabinet: TfrmKabinet;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmKabinet.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmKabinet.aOkExecute(Sender: TObject);
var
  i : integer;
begin
  SetLength(frmMain.ArrKabinets, 0);
  FSelectedKab := '';
  for i := 0 to tvKabinet.DataController.RecordCount - 1 do
   begin
     if tvKabinet.DataController.Values[i, tvKabinetCHK.index] = 1 then
      begin
        SetLength(frmMain.ArrKabinets, length(frmMain.ArrKabinets) + 1);
        frmMain.ArrKabinets[high(frmMain.ArrKabinets)] := tvKabinet.DataController.Values[i, tvKabinetFK_ID.index];
        if FSelectedKab = '' then
          FSelectedKab := tvKabinet.DataController.Values[i, tvKabinetName.index]
        else
          FSelectedKab := FSelectedKab + ',' + tvKabinet.DataController.Values[i, tvKabinetName.index];
      end;
   end;
  ModalResult := mrOk;
end;

procedure TfrmKabinet.bbClearClick(Sender: TObject);
begin
  FilterText.Text := '';
  odsKabinet.Filtered := false;
end;

procedure TfrmKabinet.FilterTextClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmKabinet.FilterTextEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmKabinet.FilterTextKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
//var nLink: Integer;
begin
  odsKabinet.Filtered := False;
  if length(FilterText.Text) > 0 then
    begin
      odsKabinet.Filter := 'fc_name = ''*' + AnsiUpperCase(FilterText.Text) + '*'' ';
      odsKabinet.Filtered := True;
    end;

  if odsKabinet.RecordCount > 0 then
    begin
      FilterText.Style.Font.Color := clMenuHighlight;
      aOk.Enabled := True;
    end else
    begin
      FilterText.Style.Font.Color := clRed;
      aOk.Enabled := False;
    end;
end;

procedure TfrmKabinet.Init(asotr : integer);
var
  i : integer;
begin
  odsKabinet.close;
  odsKabinet.SetVariable('psotr',aSotr);
  odsKabinet.open;
  try
    tvKabinet.BeginUpdate;
    for I := 0 to Length(frmMain.ArrKabinets) - 1 do
     begin
       if odsKabinet.Locate('fk_id', frmMain.ArrKabinets[i],[]) then
        begin
          odsKabinet.Edit;
          odsKabinet.FieldByName('chk').AsInteger := 1;
          odsKabinet.post;
        end;
     end;
  finally
    odsKabinet.first;
    tvKabinet.EndUpdate;
  end;
end;

procedure TfrmKabinet.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);    
end;

procedure TfrmKabinet.odsKabinetApplyRecord(Sender: TOracleDataSet; Action: Char;
  var Applied: Boolean; var NewRowId: string);
begin
  applied := true;
end;

procedure TfrmKabinet.tvKabinetCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aOkExecute(nil);
end;

procedure TfrmKabinet.tvKabinetKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    begin
      if odsKabinet.RecordCount > 0 then
        aOkExecute(nil);
    end;
end;

end.
