unit fSearchCompany;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, ActnList,
  dxBar, dxBarExtItems, cxClasses, cxControls, cxContainer, cxEdit, cxTextEdit,
  ExtCtrls, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, OracleData,
  cxLabel, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  dxSkinOffice2007Green;

type
  TfrmSearchCompany = class(TForm)
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    alSearch: TActionList;
    BMBar1: TdxBar;
    bbSet: TdxBarButton;
    aSet: TAction;
    aClose: TAction;
    aClear: TAction;
    bbClose: TdxBarButton;
    paSearch: TPanel;
    cxCompanyName: TcxTextEdit;
    TVSEARCH: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dsSearchCompany: TDataSource;
    odsSearchCompany: TOracleDataSet;
    VSEARCHNAME: TcxGridDBColumn;
    VSEARCHOWNER: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    bClear: TcxButton;
    procedure aSetExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aClearExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxCompanyNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TVSEARCHDblClick(Sender: TObject);
    procedure TVSEARCHKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxCompanyNameClick(Sender: TObject);
    procedure cxCompanyNameEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    Russian : HKL;
    
    { Public declarations }
  end;

var
  frmSearchCompany: TfrmSearchCompany;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSearchCompany.aClearExecute(Sender: TObject);
begin
  odsSearchCompany.Filtered := False;
  cxCompanyName.Clear;
end;

procedure TfrmSearchCompany.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSearchCompany.aSetExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSearchCompany.cxCompanyNameClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmSearchCompany.cxCompanyNameEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmSearchCompany.cxCompanyNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  odsSearchCompany.Filter := 'fc_name = ''*' + AnsiUpperCase(cxCompanyName.Text) + '*'' ';
  odsSearchCompany.Filtered := True;
  aSet.Enabled := odsSearchCompany.RecordCount <> 0;
end;

procedure TfrmSearchCompany.FormCreate(Sender: TObject);
begin
  if odsSearchCompany.Active = False then
    odsSearchCompany.Open;
  russian:=LoadKeyboardLayout('00000419', 0);
end;

procedure TfrmSearchCompany.FormShow(Sender: TObject);
begin
  cxCompanyName.SetFocus;
end;

procedure TfrmSearchCompany.TVSEARCHDblClick(Sender: TObject);
begin
  if odsSearchCompany.RecordCount <> 0 then
    aSetExecute(nil);
end;

procedure TfrmSearchCompany.TVSEARCHKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if odsSearchCompany.RecordCount <> 0 then
    begin
      if Key = VK_RETURN then
        aSetExecute(nil);
    end;
end;

end.
