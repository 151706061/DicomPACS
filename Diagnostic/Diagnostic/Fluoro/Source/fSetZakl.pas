unit fSetZakl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, dxBar,
  dxBarExtItems, cxClasses, ActnList, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, Oracle, OracleData,
  cxDropDownEdit, cxTL, cxMaskEdit, cxInplaceContainer, cxDBTL, cxTLData,
  cxBarEditItem, cxContainer, cxTextEdit, ExtCtrls, cxLabel, frxClass, Menus, dxPSUtl, Clipbrd, cxGridExportLink,
  frxDBSet, cxSplitter, jvDBUtils, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmRepZakl = class(TForm)
    actlstZakl: TActionList;
    actClose: TAction;
    actPrint: TAction;
    actCopyFIO: TAction;
    actText: TAction;
    actWeb: TAction;
    actXML: TAction;
    actXLS: TAction;
    dxBM: TdxBarManager;
    dxBMBar1: TdxBar;
    bbClose: TdxBarButton;
    bbPrint: TdxBarButton;
    dxBarDockControl1: TdxBarDockControl;
    cxGrZakl: TcxGrid;
    TVZAKL: TcxGridDBTableView;
    VZAKLFIO: TcxGridDBColumn;
    VZAKLDATEROJD: TcxGridDBColumn;
    VZAKLADDRESS: TcxGridDBColumn;
    VZAKLWORKPLACE: TcxGridDBColumn;
    cxGrZaklLevel1: TcxGridLevel;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    bbPrintNaprav: TdxBarButton;
    actPrintNaprav: TAction;
    VZAKLDATERUN: TcxGridDBColumn;
    VZAKLNAMEISSL: TcxGridDBColumn;
    frxRepNapr: TfrxReport;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    N3: TMenuItem;
    N2: TMenuItem;
    dlgSavePopUp: TSaveDialog;
    frxList: TfrxReport;
    frxDBList: TfrxDBDataset;
    bbParams: TdxBarButton;
    aParams: TAction;
    paParams: TPanel;
    cxSplitter1: TcxSplitter;
    cxLabel1: TcxLabel;
    lbDate1: TcxLabel;
    cxLabel3: TcxLabel;
    lbDate2: TcxLabel;
    lbNameZakl: TcxLabel;
    lbZakl: TcxLabel;
    cxLabel2: TcxLabel;
    lbKolvo: TcxLabel;
    bRefresh: TdxBarButton;
    aRefresh: TAction;
    procedure actCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actPrintNapravExecute(Sender: TObject);
    procedure frxRepNaprGetValue(const VarName: string; var Value: Variant);
    procedure odsListAfterOpen(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure actTextExecute(Sender: TObject);
    procedure actWebExecute(Sender: TObject);
    procedure actXMLExecute(Sender: TObject);
    procedure actXLSExecute(Sender: TObject);
    procedure actCopyFIOExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure frxListGetValue(const VarName: string; var Value: Variant);
    procedure aParamsExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
  private
		sDateSys : String;
		sZakl : String;
		procedure CheckEnabledButtons;
    { Private declarations }
	public
   { Public declarations }
  end;

var
	frmRepZakl: TfrmRepZakl;

implementation
uses uPeriod, fMain, fSetParamZakl;
{$R *.dfm}

procedure TfrmRepZakl.actCloseExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmRepZakl.actCopyFIOExecute(Sender: TObject);
begin
  Clipboard.AsText := ReplaceSubStr(dsList.DataSet.FieldByName('PACFIO').AsString, '.', '');
end;

procedure TfrmRepZakl.actPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
     id : Integer;
begin
  id := odsList.FieldByName('FK_ID').AsInteger;
	ods := TOracleDataSet.Create(nil);
  try
		ods.Session := frmMain.os;
		ods.Cursor := crSQLWait;
		ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS DATESYS '+
										'   FROM DUAL ';
		ods.Open;
		sDateSys := ods.FieldByName('DATESYS').AsString;
	finally
		ods.Free;
	end;
  frxList.ShowReport;
  odsList.Locate('FK_ID', id, []);
end;

procedure TfrmRepZakl.actPrintNapravExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
	ods := TOracleDataSet.Create(nil);
  try
		ods.Session := frmMain.os;
		ods.Cursor := crSQLWait;
		ods.SQL.Text := ' select TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS DATESYS, '+#13+
                    '        asu.do_vrachfio(fk_ispolid) as vrachfio, '+#13+
                    '        (SELECT MAX(FC_CHAR) '+#13+
                    '           FROM ASU.TIB '+#13+
                    '          WHERE FK_PACID = TNAZIS.FK_ID '+#13+
                    '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_FLU_NUMBER'')) AS NUMISSL, '+#13+
									  '        (SELECT FC_CHAR FROM asu.TIB '+#13+
                    '          WHERE FK_PACID = tnazis.fk_id '+#13+
                    '            AND FK_SMID IN (SELECT FK_ID FROM asu.TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME'')) AS ZAKL '+#13+
										'   FROM asu.tnazis '+#13+
                    '  where fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
		ods.Open;
		sDateSys := ods.FieldByName('DATESYS').AsString;
		sZakl := odsList.FieldByName('NAMEISSL').AsString+#13+
             odsList.FieldByName('RUNDATE').AsString+', № '+ods.FieldByName('NUMISSL').AsString+#13+
             ods.FieldByName('ZAKL').AsString+#13+ods.FieldByName('vrachfio').AsString;
	finally
		ods.Free;
  end;
	frxRepNapr.ShowReport;
end;

procedure TfrmRepZakl.actTextExecute(Sender: TObject);
begin
	dlgSavePopUp.DefaultExt := 'txt';
	dlgSavePopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
	if dlgSavePopUp.Execute then
		if TVZAKL.DataController.Controller.SelectedRecordCount > 1 then
			ExportGridToText(dlgSavePopUp.FileName, cxGrZakl, TRUE, FALSE)
		else
			ExportGridToText(dlgSavePopUp.FileName, cxGrZakl, TRUE, TRUE);
end;

procedure TfrmRepZakl.actWebExecute(Sender: TObject);
begin
	dlgSavePopUp.DefaultExt := 'html';
	dlgSavePopUp.Filter := 'Web-страницы (*.html)|*.html';
	if dlgSavePopUp.Execute then
		if TVZAKL.DataController.Controller.SelectedRecordCount > 1 then
			ExportGridToHTML(dlgSavePopUp.FileName, cxGrZakl, TRUE, FALSE)
		else
			ExportGridToHTML(dlgSavePopUp.FileName, cxGrZakl, TRUE, TRUE);
end;

procedure TfrmRepZakl.actXLSExecute(Sender: TObject);
begin
	dlgSavePopUp.DefaultExt := 'xls';
	dlgSavePopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
	if dlgSavePopUp.Execute then
		if TVZAKL.DataController.Controller.SelectedRecordCount > 1 then
			ExportGridToExcel(dlgSavePopUp.FileName, cxGrZakl, TRUE, FALSE)
		else
			ExportGridToExcel(dlgSavePopUp.FileName, cxGrZakl, TRUE, TRUE);
end;

procedure TfrmRepZakl.actXMLExecute(Sender: TObject);
begin
	dlgSavePopUp.DefaultExt := 'xml';
	dlgSavePopUp.Filter := 'XML-страницы (*.xml)|*.xml';
	if dlgSavePopUp.Execute then
		if TVZAKL.DataController.Controller.SelectedRecordCount > 1 then
			ExportGridToXML(dlgSavePopUp.FileName, cxGrZakl, TRUE, FALSE)
		else
			ExportGridToXML(dlgSavePopUp.FileName, cxGrZakl, TRUE, TRUE);
end;

procedure TfrmRepZakl.aParamsExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSetParamZakl, frmSetParamZakl);
  if cxSplitter1.Visible = True then
    begin
      if lbNameZakl.Caption = 'Заключение1:' then
        begin
          frmSetParamZakl.rowZakl1.Properties.Value := lbZakl.Caption;
          frmSetParamZakl.rowZakl1.Tag := lbZakl.Tag;
        end else
        begin
          frmSetParamZakl.rowZakl2.Properties.Value := lbZakl.Caption;
          frmSetParamZakl.rowZakl2.Tag := lbZakl.Tag;
        end;
      frmSetParamZakl.rowDate1.Properties.Value := StrToDateTime(lbDate1.Caption);
      frmSetParamZakl.rowDate2.Properties.Value := StrToDateTime(lbDate2.Caption);
    end else
    begin
      frmSetParamZakl.rowDate1.Properties.Value := frmMain.GET_SYSTEMDATE;
      frmSetParamZakl.rowDate2.Properties.Value := frmMain.GET_SYSTEMDATE;
    end;
  try
    frmSetParamZakl.ShowModal;
    if frmSetParamZakl.ModalResult = mrOk then
      begin
        paParams.Visible := True;
        cxSplitter1.Visible := True;
        lbDate1.Caption := DateTimeToStr(frmSetParamZakl.rowDate1.Properties.Value);
        lbDate2.Caption := DateTimeToStr(frmSetParamZakl.rowDate2.Properties.Value);
        odsList.Close;
      	odsList.SetVariable('PDATE1', frmSetParamZakl.rowDate1.Properties.Value);
	      odsList.SetVariable('PDATE2', frmSetParamZakl.rowDate2.Properties.Value);
        if frmSetParamZakl.rowZakl1.Tag <> 0 then
          begin
            odsList.SetVariable('PFK_SMID', frmSetParamZakl.rowZakl1.Tag);
            lbNameZakl.Caption := 'Заключение1:';
            lbZakl.Tag := frmSetParamZakl.rowZakl1.Tag;
            lbZakl.Caption := frmSetParamZakl.rowZakl1.Properties.Value;
          end else
          begin
            odsList.SetVariable('PFK_SMID', frmSetParamZakl.rowZakl2.Tag);
            lbNameZakl.Caption := 'Заключение2:';
            lbZakl.Tag := frmSetParamZakl.rowZakl2.Tag;
            lbZakl.Caption := frmSetParamZakl.rowZakl2.Properties.Value;
          end;
        odsList.Open;
        lbKolvo.Caption := IntToStr(odsList.RecordCount);
      end;
  finally
    frmSetParamZakl.Free;
  end;
end;

procedure TfrmRepZakl.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(odsList);
end;

procedure TfrmRepZakl.CheckEnabledButtons;
begin
	actPrint.Enabled := odsList.RecordCount <> 0;
	actPrintNaprav.Enabled := odsList.RecordCount <> 0;
	actCopyFIO.Enabled := odsList.RecordCount <> 0;
end;

procedure TfrmRepZakl.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TVZAKL.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TVZAKL'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVZAKL');
end;

procedure TfrmRepZakl.FormCreate(Sender: TObject);
begin
	actPrint.Enabled := False;
	actPrintNaprav.Enabled := False;
	TVZAKL.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TVZAKL'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TVZAKL');
	TVZAKL.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TVZAKL'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVZAKL');
end;

procedure TfrmRepZakl.frxListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
	if VarName = 'ZAKL' then Value := lbZakl.Caption;
	if VarName = 'DATE1' then Value := lbDate1.Caption;
	if VarName = 'DATE2' then Value := lbDate2.Caption;
	if VarName = 'KOLVOISSL' then Value := odsList.RecordCount;
	if VarName = 'DATESYS' then Value := sDateSys;
	if VarName = 'SOTR' then Value := frmMain.sVrachFIO;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
end;

procedure TfrmRepZakl.frxRepNaprGetValue(const VarName: string; var Value: Variant);
begin
	if VarName = 'NAMEORG' then Value := frmMain.sCompanyName_4Rep;
	if VarName = 'DATESYS' then Value := sDateSys;
	if VarName = 'SOTR' then Value := frmMain.sVrachFIO;
	if VarName = 'PACFIO' then Value := odsList.FieldByName('PACFIO').AsString;
	if VarName = 'DATEROJD' then Value := odsList.FieldByName('DATEROJD').AsDateTime;
	if VarName = 'WORKPLACE' then Value := odsList.FieldByName('WORKPLACE').AsString;
	if VarName = 'ADDRESS' then Value := odsList.FieldByName('ADDRESS').AsString;
	if VarName = 'ZAKL' then Value := sZakl;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;  
end;

procedure TfrmRepZakl.N2Click(Sender: TObject);
begin
	TVZAKL.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\TVZAKL'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TVZAKL');
end;

procedure TfrmRepZakl.odsListAfterOpen(DataSet: TDataSet);
begin
  CheckEnabledButtons;
end;

end.
