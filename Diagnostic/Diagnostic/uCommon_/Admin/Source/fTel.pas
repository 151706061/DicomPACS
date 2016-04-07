unit fTel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinscxPCPainter, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, Menus, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, OracleData, dxSkinCaramel, dxSkinOffice2007Green;

type
  TfrmTel = class(TForm)
    grList: TcxGrid;
    TVLIST: TcxGridDBTableView;
    VLIST_NUM: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    bOk: TcxButton;
    al: TActionList;
    aOk: TAction;
    dsTel: TDataSource;
    odsTel: TOracleDataSet;
    procedure aOkExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTel: TfrmTel;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmTel.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
