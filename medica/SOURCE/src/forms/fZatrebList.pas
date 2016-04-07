unit fZatrebList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, cxSpinEdit, cxCurrencyEdit, cxCalendar,
  cxDBLookupComboBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, ActnList,
  ComCtrls, ToolWin, OracleData;

type
  TfmZatrebList = class(TForm)
    cxGridTreb: TcxGrid;
    cxGridTrebDBTableView1: TcxGridDBTableView;
    cxGridTrebDBTableView1ROWNUM: TcxGridDBColumn;
    cxGridTrebDBTableView1NAMEKART: TcxGridDBColumn;
    cxGridTrebDBTableView1FN_TREBKOL: TcxGridDBColumn;
    cxGridTrebDBTableView1FN_KOL: TcxGridDBColumn;
    cxGridTrebDBTableView1FC_EDIZM: TcxGridDBColumn;
    cxGridTrebDBTableView1SUMM: TcxGridDBColumn;
    cxGridTrebDBTableView1ODR: TcxGridDBColumn;
    cxGridTrebDBTableView1FN_KOLOST: TcxGridDBColumn;
    cxGridTrebDBTableView1FC_NAZN_NAME: TcxGridDBColumn;
    cxGridTrebDBTableView1FN_NAZN_KOL_F: TcxGridDBColumn;
    cxGridTrebDBTableView1FC_NAZN_ED_IZM: TcxGridDBColumn;
    cxGridTrebDBTableView1FK_ID: TcxGridDBColumn;
    cxGridTrebDBTableView1FD_CREATE: TcxGridDBColumn;
    cxGridTrebDBTableView1FK_CREATE_MO_ID: TcxGridDBColumn;
    cxGridTrebDBTableView1FD_EDIT: TcxGridDBColumn;
    cxGridTrebDBTableView1FK_EDIT_MO_ID: TcxGridDBColumn;
    cxGridTrebDBTableView1MEDICID: TcxGridDBColumn;
    cxGridTrebLevel1: TcxGridLevel;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    tbuSelect: TToolButton;
    tbuCancel: TToolButton;
    dsZatrebovano: TDataSource;
    procedure tbuSelectClick(Sender: TObject);
    procedure tbuCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function ShowZatrebList(aodsZatrebList : TOracleDataset; var aTREB_DPC_ID : variant; const aMedicID : variant) : integer;

implementation

{$R *.dfm}
  function ShowZatrebList(aodsZatrebList : TOracleDataset; var aTREB_DPC_ID : variant; const aMedicID : variant) : integer;
  var
    fmZatrebList: TfmZatrebList;

  begin
    Result := mrCancel;
    if (aodsZatrebList.Active)and(aodsZatrebList.RecordCount > 0) then
    begin
      Application.CreateForm(TfmZatrebList, fmZatrebList);
      fmZatrebList.dsZatrebovano.DataSet := aodsZatrebList;
      if aodsZatrebList.Locate('FK_ID', aTREB_DPC_ID, []) = False then
         aodsZatrebList.Locate('medicid', aMedicID, []);

      result := fmZatrebList.ShowModal;

      if Result = mrOk then
      begin
        aTREB_DPC_ID :=  aodsZatrebList.FieldByName('FK_ID').AsVariant;
      end;

      FreeAndNil( fmZatrebList );
    end;
  end;
  
procedure TfmZatrebList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrNone then
    ModalResult := mrCancel;
end;

procedure TfmZatrebList.tbuCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmZatrebList.tbuSelectClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
