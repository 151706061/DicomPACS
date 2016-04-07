unit Fcompanylist;

interface

uses
    Sysutils, Windows, Messages, Classes, Graphics, Controls,
    Stdctrls, Forms, Dbctrls, Db, Dbgrids, Dbtables, Grids, Extctrls, Buttons,
    Provider, Dialogs, Menus, ComCtrls, ActnList, OracleData, Oracle,
    ToolWin, ImgList, cxStyles, cxCustomData, cxGraphics, cxFilter,
    cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
    cxGrid, JvFormPlacement, cxContainer, cxTextEdit, cxLookAndFeelPainters,
    cxButtons, JvAppStorage, JvAppRegistryStorage, JvComponentBase, cxTL,
    cxMaskEdit, cxInplaceContainer, cxDBTL, cxTLData, variants, dxSkinsCore,
    dxSkinsDefaultPainters, dxSkinOffice2007Green; 

type
    TfrmCompanyList = class(Tform)
        Dscompany: Tdatasource;
        Panel2: Tpanel;
        alActionSpr: TActionList;
        aUpdate: TAction;
        aClose: TAction;
        aCheck: TAction;
        odsCompany: TOracleDataSet;
        CoolBar1: TCoolBar;
        ToolBar1: TToolBar;
    btnaClose: TToolButton;
    btnaUpdate: TToolButton;
        tbCheck: TToolButton;
        ilForSpr: TImageList;
        Panel1: TPanel;
        FilterText: TcxTextEdit;
        Label1: TLabel;
    btnFilter: TcxButton;
        Timer3: TTimer;
        cxDBTreeList1: TcxDBTreeList;
        cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
        cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    btn1: TToolButton;
    btn3: TToolButton;
        procedure Formclose(Sender: TObject; var Action: Tcloseaction);
        procedure aCloseExecute(Sender: TObject);
        procedure aUpdateExecute(Sender: TObject);
        procedure aCheckExecute(Sender: TObject);
        procedure FormDestroy(Sender: TObject);
        procedure FilterTextKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure btnFilterClick(Sender: TObject);
        procedure odsCompanyAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FilterTextClick(Sender: TObject);
    procedure FilterTextEnter(Sender: TObject);
    procedure odsCompanyAfterScroll(DataSet: TDataSet);
    procedure cxDBTreeList1DblClick(Sender: TObject);
    private
      Russian: HKL;
    { private declarations }
    public
    { public declarations }
      cField: string;
      Values: variant;
      SelectId: integer;
      nSotrID: Integer;
      procedure DoShowCompany;
    end;

function pSelectOrg(nID: Integer = -1; SotrID: Integer = 0; sSyn: string = 'ROOT_STRAH_COMP'): Integer;


var
  frmCompanyList: TfrmCompanyList;

implementation

uses fMain;

{$R *.DFM}

procedure TfrmCompanyList.DoShowCompany;
begin
  frmCompanyList.aUpdate.Execute;
end;

function pSelectOrg(nID: Integer = -1; SotrID: Integer = 0; sSyn: string = 'ROOT_STRAH_COMP'): Integer;
begin
    try
        frmCompanyList.Tag := 0;
    except
        Application.CreateForm(TfrmCompanyList, frmCompanyList);
    end;
    frmCompanyList.nSotrID := SotrID;

    frmCompanyList.FormStyle := fsNormal;
    frmCompanyList.Visible := FALSE;
    frmCompanyList.BorderIcons := [biSystemMenu];
    frmCompanyList.tbCheck.Visible := TRUE;

    frmCompanyList.odsCompany.SQL.Text := StringReplace(frmCompanyList.odsCompany.SQL.Text, 'ROOT_STRAH_COMP', sSyn, []);

    frmCompanyList.aUpdate.Execute;
    if nID > 0 then
        frmCompanyList.odsCompany.Locate('FK_ID', nId, [loCaseInsensitive]);

    if frmCompanyList.ShowModal = mrOk then
        Result := frmCompanyList.odsCompany.FieldByName('FK_ID').AsInteger
    else
        Result := nID;

    frmCompanyList.odsCompany.Close;
    FreeAndNil(frmCompanyList);
end;

procedure TfrmCompanyList.FormClose(Sender: TObject; var Action: Tcloseaction);
begin
    if Self.FormStyle = fsMDIChild then
    Action := Cafree;
end;

procedure TfrmCompanyList.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);
end;

procedure TfrmCompanyList.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmCompanyList.aUpdateExecute(Sender: TObject);
var nLink: integer;
begin
  nLink := 0;
  if odsCompany.Active then
    nLink := odsCompany.FieldByName('fk_id').AsInteger;
  odsCompany.Close;
  odsCompany.Open;
  odsCompany.Locate('fk_id', nLink, []);
  if odsCompany.RecordCount > 0 then
    begin
      aCheck.Enabled := True;
    end else
    begin
      aCheck.Enabled := False;
    end;
end;

procedure TfrmCompanyList.aCheckExecute(Sender: TObject);
begin
  aCheck.Enabled := FALSE;
  ModalResult := mrOk;
end;

procedure TfrmCompanyList.FormDestroy(Sender: TObject);
begin
    frmCompanyList := nil;
end;

procedure TfrmCompanyList.FilterTextClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmCompanyList.FilterTextEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmCompanyList.FilterTextKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var nLink: Integer;
begin
  nLink := 0;
  if cxDBTreeList1.DataController.GetKeyFieldsValues <> null then
    nLink := cxDBTreeList1.DataController.GetKeyFieldsValues;
  odsCompany.Filtered := false;
  if length(FilterText.Text) > 0 then
    begin
      odsCompany.Filter := 'fc_name = ''*' + AnsiUpperCase(FilterText.Text) + '*'' ';
      odsCompany.Filtered := true;
      btnFilter.Enabled := True;
    end else
      btnFilter.Enabled := False;
  if odsCompany.RecordCount > 0 then
    begin
      FilterText.Style.Font.Color := clMenuHighlight;
      Timer3.Enabled := False;
      aCheck.Enabled := True;
    end else
    begin
      FilterText.Style.Font.Color := clRed;
      Timer3.Enabled := True;
      aCheck.Enabled := False;
    end;

  cxDBTreeList1.FullExpand;
  if Key = 40 then
    begin
      odsCompany.Locate('fk_id', nLink, []);
      cxDBTreeList1.SetFocus;
      cxDBTreeList1.GotoNext;
    end;
  if Key = 38 then
    begin
      odsCompany.Locate('fk_id', nLink, []);
      cxDBTreeList1.SetFocus;
      cxDBTreeList1.GotoPrev;
    end;
end;

procedure TfrmCompanyList.btnFilterClick(Sender: TObject);
begin
  FilterText.Text := '';
  odsCompany.Filtered := false;
  Timer3.Enabled := False;
  cxDBTreeList1.FullExpand;
  cxDBTreeList1.GotoBOF;
end;

procedure TfrmCompanyList.cxDBTreeList1DblClick(Sender: TObject);
begin
  if aCheck.Enabled = True then
    aCheckExecute(nil);
end;

procedure TfrmCompanyList.odsCompanyAfterOpen(DataSet: TDataSet);
begin
  cxDBTreeList1.FullExpand;
  cxDBTreeList1.GotoBOF;
end;

procedure TfrmCompanyList.odsCompanyAfterScroll(DataSet: TDataSet);
begin
  aCheck.Enabled := odsCompany.FieldByName('fk_companyid').AsInteger <> 0;
end;

end.

