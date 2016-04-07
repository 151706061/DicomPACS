unit fShowLevels;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fgetperiod, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, ExtCtrls, cxCurrencyEdit,
  cxContainer, cxGroupBox, Buttons, ActnList, ImgList, ComCtrls,
  JvExComCtrls, JvToolBar, ToolWin, cxSpinEdit, Menus, cxCheckBox,
  JvComponentBase, JvFormPlacement, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, OracleData, Contnrs,
  FR_DSet, FR_DBSet, FR_Class;

type


  TForm1 = class(TForm)
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    CoolBar1: TCoolBar;
    JvToolBar1: TJvToolBar;
    tbuExpand: TToolButton;
    ToolButton3: TToolButton;
    cxGroupBox2: TcxGroupBox;
    laCurReport: TLabel;
    ToolButton2: TToolButton;
    tbuReport: TToolButton;
    ToolButton1: TToolButton;
    tbuMerge: TToolButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    acExpand: TAction;
    acCollapse: TAction;
    grbRPO: TcxGroupBox;
    ToolButton4: TToolButton;
    chbRPO: TcxCheckBox;
    JvFormStorage1: TJvFormStorage;
    cxGroupBox1: TcxGroupBox;
    cmbReport: TcxComboBox;
    ToolButton5: TToolButton;
    frReport2: TfrReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure acExpandExecute(Sender: TObject);
    procedure acCollapseExecute(Sender: TObject);
    procedure tbuGroupTypeClick(Sender: TObject);
    procedure tbuReportClick(Sender: TObject);
    procedure tbuMergeClick(Sender: TObject);
    procedure chbRPOClick(Sender: TObject);
    procedure cxComboBox1PropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure frReport1UserFunction(const Name: String; p1, p2,
      p3: Variant; var Val: Variant);
//    procedure chbKontraktShowClick(Sender: TObject);
  private
    procedure OnBeforeSelectReporProc;
    procedure OnBeforeOpenReportProc;
    { Private declarations }
  public
    { Public declarations }
    ReportsList : TObjectList;
    Report : TReportItem;
  end;

var
  Form1: TForm1;

implementation

uses fdmPrintSelect, Oracle;

{$R *.dfm}


{  TForm1 }
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
//  grbKONTRAKT.Visible := (frmGetPeriod.FUNC_SHOW_KONTRAKT = 1);
  cxGrid1DBTableView1.ViewData.Collapse(True);
  cxGrid1DBTableView1.DataController.SelectRows(1,1);
  cxGrid1DBTableView1.ViewData.Expand(True);

  tbuReport.Enabled := cxGrid1DBTableView1.DataController.RecordCount > 0;
end;

procedure TForm1.cxGrid1DBTableView1FocusedRecordChanged( Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;  ANewItemRecordFocusingChanged: Boolean);
begin
//  if tbuGroupType.Down = False then
//  begin
//    laCurReport.Caption := '';
//    tbuGroupType.ImageIndex := 6;
//    if cxGrid1DBTableView1.Controller.SelectedRowCount > 0 then
//    begin
//      case cxGrid1DBTableView1.Controller.SelectedRows[0].Level of
//        1 : laCurReport.Caption := 'По поставщикам';
//        2 : laCurReport.Caption := 'По документам';
//        3 : laCurReport.Caption := 'По объектам учета';
//      else
//        laCurReport.Caption := 'По поставщикам';
//      end;
//    end;
//  end;
  tbuGroupTypeClick(nil);
end;

procedure TForm1.acExpandExecute(Sender: TObject);
begin
  cxGrid1DBTableView1.ViewData.Expand(True);
  tbuExpand.Action := acCollapse;
end;

procedure TForm1.acCollapseExecute(Sender: TObject);
begin
  cxGrid1DBTableView1.ViewData.Collapse(True);
  tbuExpand.Action := acExpand;  
end;

procedure TForm1.tbuGroupTypeClick(Sender: TObject);
var
  p : TPoint;
begin
//  if tbuGroupType.Down then
//  begin
//    laCurReport.Caption := 'По группам учетности';
//    tbuGroupType.ImageIndex := 5;
//    p.X := 0;
//    p.Y := tbuGroupType.Height;
//    P := tbuGroupType.ClientToScreen(P);
//    frmGetPeriod.pmUchGr.Popup(p.X, p.Y);
//  end
//  else
//  begin
//    laCurReport.Caption := '';
//    tbuGroupType.ImageIndex := 6;
//    if cxGrid1DBTableView1.Controller.SelectedRowCount > 0 then
//    begin
//      case cxGrid1DBTableView1.Controller.SelectedRows[0].Level of
//        1 : laCurReport.Caption := 'По поставщикам';
//        2 : laCurReport.Caption := 'По документам';
//        3 : laCurReport.Caption := 'По объектам учета';
//      else
//        laCurReport.Caption := 'По поставщикам';
//      end;
//    end;
//
//  end;
end;

procedure TForm1.tbuReportClick(Sender: TObject);
var
  P : TPoint;
begin
//  if  tbuGroupType.Down then
//    frmGetPeriod.rgDocType.ItemIndex := 3
//  else
//    case cxGrid1DBTableView1.Controller.SelectedRows[0].Level of
//      1..3 : frmGetPeriod.rgDocType.ItemIndex := (cxGrid1DBTableView1.Controller.SelectedRows[0].Level - 1);
//      else
//        frmGetPeriod.rgDocType.ItemIndex := 0;
//    end;
  if dmPrintSelect.PrintFlag = 0 then
  begin
    P.X := 0;
    P.Y := tbuReport.Height;
    P := tbuReport.ClientToScreen(P);
    dmPrintSelect.pmPrintSelect.Popup(P.X, P.Y);
    Application.ProcessMessages; // только после этого срабатывает событие TdmPrintReports.miPrintToExcelClick(Sender: TObject);
  end;                           // и проставляется флаг - далее проверки на номер флага должны быть внутри каждой функции печати
  if dmPrintSelect.PrintFlag = 0 then Exit;
  try
    Self.ModalResult := mrOk;
    Self.Hide;
    frmGetPeriod.acPrint.Execute;
  finally
    dmPrintSelect.PrintFlag := 0;
//    frmGetPeriod.Close;    
  end;
end;

procedure TForm1.tbuMergeClick(Sender: TObject);
begin
  if tbuMerge.Down then
  begin
//    cxGrid1DBTableView1NAMEPOSTAV.DataBinding.FieldName := 'DATA';
    cxGrid1DBTableView1DATA.GroupIndex := 1; // вставляем группировку
    tbuMerge.ImageIndex := 3;
  end
  else
  begin
//    cxGrid1DBTableView1NAMEPOSTAV.DataBinding.FieldName := 'FC_NAMEPOSTAV_SUMM';
    cxGrid1DBTableView1DATA.GroupIndex := -1; // убираем группировку
    tbuMerge.ImageIndex := 4;
  end;
  tbuReport.Enabled := (not tbuMerge.Down);
//  tbuGroupType.Enabled := (not tbuMerge.Down);
end;

procedure TForm1.chbRPOClick(Sender: TObject);
begin
  if chbRPO.Checked then
    frmGetPeriod.IS_RPO := 1
  else
    frmGetPeriod.IS_RPO := 0;

  frmGetPeriod.odsSelDocPoMedic.Close;
  frmGetPeriod.odsSelDocPoMedic.SetVariable('IS_RPO', frmGetPeriod.IS_RPO);
  frmGetPeriod.odsSelDocPoMedic.Open;
end;

//procedure TForm1.chbKontraktShowClick(Sender: TObject);
//begin
//  chbKontraktShow.Checked := (chbKontraktShow.Checked) and (frmGetPeriod.FUNC_SHOW_KONTRAKT = 1);
//  if chbKontraktShow.Checked then
//    frmGetPeriod.IS_KONTRAKT_SHOW := 1
//  else
//    frmGetPeriod.IS_KONTRAKT_SHOW := 0;
//
//  frmGetPeriod.odsSelDocPoMedic.Close;
//  frmGetPeriod.odsSelDocPoMedic.SetVariable('IS_KONTRAKT_SHOW', frmGetPeriod.IS_KONTRAKT_SHOW);
//  frmGetPeriod.odsSelDocPoMedic.Open;
//end;

procedure TForm1.cxComboBox1PropertiesChange(Sender: TObject);
begin
  Report.DataSet.Close;
  Report := TReportItem(cmbReport.ItemObject);
  dsGrid.DataSet := Report.DataSet;
  OnBeforeSelectReporProc();
  Report.DataSet.Open;
  cxGrid1Level1.GridView := Report.cxGridDBTableView;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i : integer;
begin
  ReportsList := TObjectList.Create(True);
  ReportsList.Add( TReportItem.Create('Отчет по приходу по поставщикам', 'PrihPost.frf', odsSelDocPrihRep, SelDocPrihRepView) );

  Form1.cmbReport.Properties.Items.Clear;
  for i := 0 to ReportsList.Count - 1 do
  begin
    if TReportItem(ReportsList[i]).Visible then
      Form1.cmbReport.Properties.Items.AddObject( TReportItem(ReportsList[i]).RusName, ReportsList[i] );
  end;
end;

procedure TForm1.ToolButton5Click(Sender: TObject);
begin
  if cmbReport.ItemIndex = -1 then Exit;
  frDBDataSet1.DataSet := Report.DataSet;
  OnBeforeOpenReportProc();
  if frReport1.LoadFromFile( TReportItem(cmbReport.ItemObject).ReportFileName ) = False then
    frReport1.Clear;

  frReport1.ShowReport;
end;

procedure TForm1.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName = 'var_receiver' then
  begin
    with TOracleQuery.Create(nil) do
    try
      Session := frmGetPeriod.os;
      Sql.Text := 'SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''MANAGER_DOC'' AND FC_KEY = ''CLIENT_NAME''';
      try
        Execute;
        ParValue := Field(0);
      except
        ParValue := '';
      end;
    finally
      Free;
    end;
  end; // if ParName = 'var_receiver' then
end;

procedure TForm1.frReport1UserFunction(const Name: String; p1, p2,
  p3: Variant; var Val: Variant);
var
	d : string;
begin
	if name = 'MYSTRTOFLOAT' then
	begin
		d := frParser.Calc(p1);
		val:=StringReplace(d,',', '.',[rfReplaceAll]);
	end;
end;



end.
