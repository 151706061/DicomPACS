unit fNazRgOne1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, OracleData, Oracle, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ActnList, ImgList, dxBar,
  cxImageComboBox, ExtCtrls, dxBarExtItems, cxLabel, cxContainer,
  cxTextEdit, fMain, cxSplitter, StrUtils, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  dxSkinOffice2007Green;

type
  TfrmNazRg1 = class(TForm)
    ds: TDataSource;
    odsChild: TOracleDataSet;
    al: TActionList;
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    bbExit: TdxBarButton;
    IL: TImageList;
    aClose: TAction;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    bbSet: TdxBarButton;
    aSet: TAction;
    cxGrid1: TcxGrid;
    TV: TcxGridDBTableView;
    TVNAME: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure TVDblClick(Sender: TObject);
    procedure TVKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure aCloseExecute(Sender: TObject);
    procedure aSetExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNazRg1: TfrmNazRg1;

implementation

{$R *.dfm}

procedure TfrmNazRg1.TVDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmNazRg1.TVKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    begin
      TVDblClick(nil);
    end;
end;

procedure TfrmNazRg1.aCloseExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

procedure TfrmNazRg1.aSetExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmNazRg1.FormCreate(Sender: TObject);
begin
  if odsChild.Active = False then
    odsChild.Active := True;
end;

end.
