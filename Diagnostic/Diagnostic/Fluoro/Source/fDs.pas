unit fDs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList, OracleData, dxSkinsCore,
  dxSkinOffice2007Green, dxSkinscxPCPainter, ExtCtrls;

type
  TfrmDs = class(TForm)
    tvDs: TcxGridDBTableView;
    grDsLevel1: TcxGridLevel;
    grDs: TcxGrid;
    al: TActionList;
    aOK: TAction;
    aCancel: TAction;
    odsDs: TOracleDataSet;
    dsDs: TDataSource;
    tvDs_Vid: TcxGridDBColumn;
    tvDs_Ds: TcxGridDBColumn;
    tvDs_MKB: TcxGridDBColumn;
    tvDs_Type: TcxGridDBColumn;
    Panel1: TPanel;
    bOk: TcxButton;
    bCancel: TcxButton;
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure tvDsDblClick(Sender: TObject);
    procedure tvDsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDs: TfrmDs;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmDs.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmDs.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmDs.tvDsDblClick(Sender: TObject);
begin
  if odsDs.RecordCount > 0 then
    aOKExecute(nil);
end;

procedure TfrmDs.tvDsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
      if odsDs.RecordCount > 0 then
        aOKExecute(nil);
    end;
end;

end.
