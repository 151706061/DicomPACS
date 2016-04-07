unit fFinSourceReplace;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, OracleData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, ExtCtrls, cxDBLookupComboBox;

type
  TfrmFinSourceReplace = class(TForm)
    tvMain: TcxGridDBTableView;
    lvMain: TcxGridLevel;
    cxGrid1: TcxGrid;
    odsMain: TOracleDataSet;
    dsMain: TDataSource;
    tvMainFK_ID: TcxGridDBColumn;
    tvMainMEDICID: TcxGridDBColumn;
    tvMainFD_DATE: TcxGridDBColumn;
    tvMainFK_FINSOURCE_PRIH: TcxGridDBColumn;
    tvMainFK_FINSOURCE_RASH: TcxGridDBColumn;
    Panel1: TPanel;
    btSave: TcxButton;
    btCancel: TcxButton;
    odsFinsource: TOracleDataSet;
    dsFinsource: TDataSource;
    dsMedic: TDataSource;
    odsMedic: TOracleDataSet;
    btAdd: TcxButton;
    btEdit: TcxButton;
    btDelete: TcxButton;
    procedure btCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure odsMainAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFinSourceReplace: TfrmFinSourceReplace;

implementation

uses fgetperiod;

{$R *.dfm}

procedure TfrmFinSourceReplace.btAddClick(Sender: TObject);
begin
  odsMain.Insert;
end;

procedure TfrmFinSourceReplace.btCancelClick(Sender: TObject);
begin
  frmGetPeriod.os.RollbackToSavepoint('FINSOURCE_REPLACE');
  ModalResult := mrCancel;
end;

procedure TfrmFinSourceReplace.btDeleteClick(Sender: TObject);
begin
  odsMain.Delete;
end;

procedure TfrmFinSourceReplace.btEditClick(Sender: TObject);
begin
  odsMain.Edit;
end;

procedure TfrmFinSourceReplace.btSaveClick(Sender: TObject);
begin
  if odsMain.Active and (odsMain.State in [dsEdit, dsInsert]) then odsMain.Post;
  frmGetPeriod.os.Commit;
  ModalResult := mrOk;
end;

procedure TfrmFinSourceReplace.FormCreate(Sender: TObject);
begin
  frmGetPeriod.os.Savepoint('FINSOURCE_REPLACE');
  odsMain.Open;
  odsFinsource.Open;  
  odsMedic.Open;
end;

procedure TfrmFinSourceReplace.odsMainAfterOpen(DataSet: TDataSet);
begin
  btEdit.Enabled := odsMain.RecordCount > 0;
  btDelete.Enabled := odsMain.RecordCount > 0;
end;

end.
