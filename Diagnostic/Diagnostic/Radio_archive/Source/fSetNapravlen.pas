unit fSetNapravlen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinsdxBarPainter, ActnList, ImgList, dxBar, DB,
  OracleData, cxInplaceContainer, cxDBTL, cxControls, cxTLData, cxClasses,
  cxTextEdit, cxContainer, cxEdit, cxLabel, ExtCtrls, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, dxSkinOffice2007Green;

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
  private
    Russian : HKL;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetNapravlen: TfrmSetNapravlen;

implementation

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
begin
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
begin
  Russian:=LoadKeyboardLayout('00000419', 0);
  if odsKemNapravlen.Active = False then
    odsKemNapravlen.Active := True;  
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
