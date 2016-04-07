unit fMedicSel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, Db, OracleData, Grids, 
  JvFormPlacement, Oracle, JvDBUtils, ExtCtrls, StdCtrls, JvDBCombobox,
  {JvxCtrls, }JvDBControls, DBCtrls, dxTL, dxDBCtrl, dxDBGrid, dxCntner, dxDBTL,
  dxExEdtr, JvComponentBase;

type
  TfrmMedicSel = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    al: TActionList;
    acClose: TAction;
    acRefresh: TAction;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    acSelect: TAction;
    acSecret: TAction;
    odsMedicLst: TOracleDataSet;
    dsMedicLst: TDataSource;
    FormStorage: TJvFormStorage;
    gr: TdxDBTreeList;
    grFC_NAME: TdxDBTreeListMaskColumn;
    grFC_UCHNAME: TdxDBTreeListMaskColumn;
    grFC_FARMNAME: TdxDBTreeListMaskColumn;
    grMEDICID: TdxDBTreeListMaskColumn;
    grFC_PREP: TdxDBTreeListMaskColumn;
    grFC_EANCODE: TdxDBTreeListMaskColumn;
    grFC_MEDPAYTYPE: TdxDBTreeListMaskColumn;
    grFC_UEDIZM: TdxDBTreeListMaskColumn;
    grFN_FPACKINUPACK: TdxDBTreeListMaskColumn;
    grFC_FEDIZM: TdxDBTreeListMaskColumn;
    grFC_SPECIALMEDIC: TdxDBTreeListMaskColumn;
    grFN_MASS: TdxDBTreeListMaskColumn;
    grFC_MASSUNITS: TdxDBTreeListMaskColumn;
    grFC_LGOTA: TdxDBTreeListMaskColumn;
    grFC_MEDICTYPE: TdxDBTreeListMaskColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure odsListAfterOpen(DataSet: TDataSet);
    procedure acCloseExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure acSelectExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxDBTreeList1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    nID: Integer;
//    id : double;
  end;

function DoShowMedicSel(pID: integer = -1; bAssortiment: boolean = False;
  bTreb: Boolean = False): Integer;
  
var
	frmMedicSel: TfrmMedicSel;

implementation

uses fmainform, fMedicEdit, fdmMain;

{$R *.DFM}

function DoShowMedicSel(pID: integer = -1; bAssortiment: Boolean = False;
	bTreb: Boolean = False): Integer;
begin
	if pID <> 0 then
		begin
			Application.CreateForm(TfrmMedicSel, frmMedicSel);
			frmMedicSel.nid := pID;
			if pID <> 0 then
				frmMedicSel.odsMedicLst.Locate('MEDICID', pID, []);
		end
	else
		begin
			Application.CreateForm(TfrmMedicSel, frmMedicSel);
		end;
	frmMedicSel.odslistafteropen(nil);
	frmMedicSel.ShowModal;
	result := frmMedicSel.nID;
end;

procedure TfrmMedicSel.FormClose(Sender: TObject;
	var Action: TCloseAction);
begin
	frmMain.tbAssortiment.ImageIndex := 51;
	action := caFree;
end;

procedure TfrmMedicSel.odsListAfterOpen(DataSet: TDataSet);
begin
	acSelect.Enabled := (odsMedicLst.RecordCount <> 0) and (FormStyle = fsNormal);
end;

procedure TfrmMedicSel.acCloseExecute(Sender: TObject);
begin
	nID := 0;
  Close;
end;

procedure TfrmMedicSel.acRefreshExecute(Sender: TObject);
begin
  odsMedicLst.SetVariable('MOID',dmMain.pkgMedSes.getcurmo);
  RefreshQuery(odsMedicLst);
  odsListAfterOpen(odsMedicLst);
end;

procedure TfrmMedicSel.acSelectExecute(Sender: TObject);
begin
  nID := odsMedicLst.FieldByName('MEDICID').AsVariant;
  Close;
end;

procedure TfrmMedicSel.FormCreate(Sender: TObject);
var CurMo: Integer;
begin
  CurMo := Round(dmMain.pkgMedSes.getcurmo);
  if CurMo = -1 then Application.MessageBox('Не выбран материально ответственный!','Внимание',mb_iconwarning + mb_ok);
  if CurMo > -1 then odsMedicLst.SetVariable('MOID',CurMo);
  odsMedicLst.Close;
  odsMedicLst.Open;
end;

procedure TfrmMedicSel.dxDBTreeList1DblClick(Sender: TObject);
begin
	if acSelect.Enabled then	acSelect.Execute;
end;

end.
