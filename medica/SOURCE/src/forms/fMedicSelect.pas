unit fMedicSelect;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, ComCtrls, ToolWin, 
  ActnList, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxMaskEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridLevel, cxGrid;

type
  TfrmMedicSelect = class(TForm)
    ToolBar1: TToolBar;
    btnSelect: TToolButton;
    odsMedic: TOracleDataSet;
    dsMedic: TDataSource;
    btnClose: TToolButton;
    ActionList1: TActionList;
    acSelect: TAction;
    acClose: TAction;
    cxGridMedic: TcxGrid;
    cxGridMedicLevel1: TcxGridLevel;
    cxGridMedicDBTableView1: TcxGridDBTableView;
    cxGridMedicDBTableView1FC_MEDIC: TcxGridDBColumn;
    cxGridMedicDBTableView1FC_EI: TcxGridDBColumn;
    cxGridMedicDBTableView1FK_MEDIC: TcxGridDBColumn;
    cxGridMedicDBTableView1FC_UCHGR: TcxGridDBColumn;
    procedure acSelectExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMedicSelect: TfrmMedicSelect;

implementation

uses
	fdmMain;

{$R *.DFM}

procedure TfrmMedicSelect.acSelectExecute(Sender: TObject);
begin
	if odsMedic.IsEmpty = false then ModalResult := mrOk
	else                    	       ModalResult := mrCancel;
end;

procedure TfrmMedicSelect.acCloseExecute(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

procedure TfrmMedicSelect.FormCreate(Sender: TObject);
begin
	odsMedic.Close;
	odsMedic.Open;
end;

end.
