unit fSetKontrast;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, cxGraphics,
  cxCustomData, cxStyles, cxTL, cxMaskEdit, cxInplaceContainer, cxDBTL,
  cxControls, cxTLData, ImgList, ActnList, dxBar, cxClasses, DB, OracleData,
  dxSkinOffice2007Green;

type
  TfrmSetKontrast = class(TForm)
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbOk: TdxBarButton;
    bbCancel: TdxBarButton;
    AL: TActionList;
    aOK: TAction;
    aCancel: TAction;
    IL: TImageList;
    cxTreeTypeKontrast: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    odsTypeKontrast: TOracleDataSet;
    dsTypeKontrast: TDataSource;
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure cxTreeTypeKontrastDblClick(Sender: TObject);
    procedure cxTreeTypeKontrastKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetKontrast: TfrmSetKontrast;

implementation

{$R *.dfm}

procedure TfrmSetKontrast.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetKontrast.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetKontrast.cxTreeTypeKontrastDblClick(Sender: TObject);
begin
  aOKExecute(nil);
end;

procedure TfrmSetKontrast.cxTreeTypeKontrastKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    aOKExecute(nil);
end;

procedure TfrmSetKontrast.FormCreate(Sender: TObject);
begin
  if odsTypeKontrast.Active = False then
    odsTypeKontrast.Active := True;  
end;

end.
