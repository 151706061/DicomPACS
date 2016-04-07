unit fSetNapravlen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinsdxBarPainter, ActnList, ImgList, dxBar, DB,
  OracleData, cxInplaceContainer, cxDBTL, cxControls, cxTLData, cxClasses,
  cxTextEdit, cxContainer, cxEdit, cxLabel, ExtCtrls, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxCheckBox;

type
  TfrmSetNapravlen = class(TForm)
    cxKemNapravlen: TcxDBTreeList;
    cxDBTreeListColumn1: TcxDBTreeListColumn;
    odsKemNapravlen: TOracleDataSet;
    dsKemNapravlen: TDataSource;
    BM: TdxBarManager;
    AL: TActionList;
    IL: TImageList;
    aOK: TAction;
    aCancel: TAction;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbOk: TdxBarButton;
    bbCancel: TdxBarButton;
    bbFilter: TdxBarButton;
    aFilter: TAction;
    paFilter: TPanel;
    cxLabel1: TcxLabel;
    teFilter: TcxTextEdit;
    bClear: TcxButton;
    aClear: TAction;
    cxKemNapravlencxDBTreeListColumn1: TcxDBTreeListColumn;
    tlcid: TcxDBTreeListColumn;
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure cxKemNapravlenDblClick(Sender: TObject);
    procedure cxKemNapravlenKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aFilterExecute(Sender: TObject);
    procedure teFilterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure aClearExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure teFilterClick(Sender: TObject);
    procedure teFilterEnter(Sender: TObject);
    procedure odsKemNapravlenApplyRecord(Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
      var NewRowId: string);
  private
    Russian : HKL;
    { Private declarations }
  public
    FSelectedNapravl : string;
    { Public declarations }
  end;

var
  frmSetNapravlen: TfrmSetNapravlen;

implementation

uses fMain;

{$R *.dfm}

procedure TfrmSetNapravlen.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetNapravlen.aClearExecute(Sender: TObject);
begin
  teFilter.Text := '';
  odsKemNapravlen.Filtered := False;
  cxKemNapravlen.FullExpand;
  cxKemNapravlen.GotoBOF;
  aOK.Enabled := True;
end;

procedure TfrmSetNapravlen.aFilterExecute(Sender: TObject);
begin
  if bbFilter.Down = True then
    begin
      paFilter.Visible := True;
      teFilter.SetFocus;
    end else
    begin
      paFilter.Visible := False;
    end;
end;

procedure TfrmSetNapravlen.aOKExecute(Sender: TObject);
var
  i : integer;
begin
  cxKemNapravlen.DataController.PostEditingData;
  SetLength(frmMain.ArrNapravlen, 0);
  FSelectedNapravl := '';
  for i := 0 to cxKemNapravlen.DataController.RecordCount - 1 do
   begin
     if cxKemNapravlen.DataController.Values[i, cxKemNapravlencxDBTreeListColumn1.ItemIndex] = 1 then
      begin
        SetLength(frmMain.ArrNapravlen, length(frmMain.ArrNapravlen) + 1);
        frmMain.ArrNapravlen[high(frmMain.ArrNapravlen)] := cxKemNapravlen.DataController.Values[i, tlcid.ItemIndex];
        if FSelectedNapravl = '' then
          FSelectedNapravl := cxKemNapravlen.DataController.Values[i, cxDBTreeListColumn1.itemindex]
        else
          FSelectedNapravl := FSelectedNapravl + ',' + cxKemNapravlen.DataController.Values[i, cxDBTreeListColumn1.itemindex];
      end;
   end;
  ModalResult := mrOk;
end;

procedure TfrmSetNapravlen.cxKemNapravlenDblClick(Sender: TObject);
begin
  aOKExecute(nil);
end;

procedure TfrmSetNapravlen.cxKemNapravlenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    aOKExecute(nil);
end;

procedure TfrmSetNapravlen.FormCreate(Sender: TObject);
var
  i : integer;
begin
  Russian:=LoadKeyboardLayout('00000419', 0);
  if odsKemNapravlen.Active = False then
    odsKemNapravlen.Active := True;
//  odsKemNapravlen.close;
//  odsKemNapravlen.open;
  try
    cxKemNapravlen.BeginUpdate;
    for I := 0 to Length(frmMain.ArrNapravlen) - 1 do
     begin
       if odsKemNapravlen.Locate('fk_id', frmMain.ArrNapravlen[i],[]) then
        begin
          odsKemNapravlen.Edit;
          odsKemNapravlen.FieldByName('chk').AsInteger := 1;
          odsKemNapravlen.post;
        end;
     end;
  finally
    odsKemNapravlen.first;
    cxKemNapravlen.EndUpdate;
  end;
end;

procedure TfrmSetNapravlen.odsKemNapravlenApplyRecord(Sender: TOracleDataSet; Action: Char;
  var Applied: Boolean; var NewRowId: string);
begin
  applied := true;
end;

procedure TfrmSetNapravlen.teFilterClick(Sender: TObject);
begin
  ActivateKeyboardLayout(Russian, KLF_REORDER);
end;

procedure TfrmSetNapravlen.teFilterEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(Russian, KLF_REORDER);
end;

procedure TfrmSetNapravlen.teFilterKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  odsKemNapravlen.Filtered := False;
  if length(teFilter.Text) > 0 then
    begin
      cxKemNapravlen.FullExpand;
      odsKemNapravlen.Filter := 'LOWERNAME = ''*' + teFilter.Text + '*'' ';
      odsKemNapravlen.Filtered := True;
      aClear.Enabled := True;
    end else
    begin
      aClear.Enabled := False;
    end;
  if odsKemNapravlen.RecordCount > 0 then
    begin
      aOK.Enabled := True;
      teFilter.Style.Font.Color := clBlack;
    end else
    begin
      aOK.Enabled := False;
      teFilter.Style.Font.Color := clRed;
    end;
end;

end.
