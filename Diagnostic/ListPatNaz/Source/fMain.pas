unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCheckBox, dxBar, Menus, DB, OracleData, ImgList, ActnList,
  cxBarEditItem, dxBarExtItems, cxClasses, Oracle, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxContainer,
  cxLabel, ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, uGlobalConst, SMMainAPI, jvDBUtils, cxGridExportLink,
  frxClass, frxDBSet, Clipbrd;

type
  TfrmMain = class(TForm)
    os: TOracleSession;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbRefresh: TdxBarButton;
    bbProtocol: TdxBarButton;
    bbPrint: TdxBarButton;
    bbParam: TdxBarButton;
    cciDates: TdxBarControlContainerItem;
    bbClear: TdxBarButton;
    al: TActionList;
    aRefresh: TAction;
    aProtocol: TAction;
    aPrint: TAction;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    aParam: TAction;
    aClearDates: TAction;
    IL: TImageList;
    dsList: TDataSource;
    odsList: TOracleDataSet;
    odsListDates: TOracleDataSet;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    Excel1: TMenuItem;
    N2: TMenuItem;
    sdPopUp: TSaveDialog;
    dxBarDockControl1: TdxBarDockControl;
    cxGr: TcxGrid;
    TV: TcxGridDBTableView;
    TVFD_RUN: TcxGridDBColumn;
    VISSLNAME: TcxGridDBColumn;
    VNUMMK: TcxGridDBColumn;
    VVRACHFIO: TcxGridDBColumn;
    VISPOLFIO: TcxGridDBColumn;
    VSOS: TcxGridDBColumn;
    cxGrLevel1: TcxGridLevel;
    paDates: TPanel;
    cxLabel1: TcxLabel;
    lbBeg: TcxLabel;
    cxLabel2: TcxLabel;
    lbEnd: TcxLabel;
    frxDBDataset1: TfrxDBDataset;
    frxList: TfrxReport;
    frxListDates: TfrxReport;
    frxRepProsmotr: TfrxReport;
    N5: TMenuItem;
    aCopy: TAction;
    N6: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure aClearDatesExecute(Sender: TObject);
    procedure aParamExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure bbPrintClick(Sender: TObject);
    procedure frxListGetValue(const VarName: string; var Value: Variant);
    procedure frxListDatesGetValue(const VarName: string; var Value: Variant);
    procedure frxRepProsmotrGetValue(const VarName: string; var Value: Variant);
    procedure aProtocolExecute(Sender: TObject);
    procedure aCopyExecute(Sender: TObject);
  private
    pPACID : Integer;
    MedotradeSign : string;
    dDateBeg, dDateEnd : TDateTime;
    sSysDate_4Rep, sCompanyName_4Rep, sPacFio_4Rep, sTextIssl_4Rep, sSotrSpec_4Rep, sPacAge_4Rep : String;
    Russian : HKL;
    procedure CheckEnabledButtons;
    procedure DoRefreshConst;
    { Private declarations }
  public
    PanelHandle : Integer;
    pSOTRID : Integer;
    procedure DoShowFrmMain(nPACID : Integer; nSOTRID : Integer);
    procedure UnloadDll;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses uPeriod;
{$R *.dfm}

{ TfrmMain }

procedure TfrmMain.aClearDatesExecute(Sender: TObject);
begin
  cciDates.Visible := ivNever;
  aClearDates.Visible := False;
  aClearDates.Enabled := False;
  dsList.DataSet := odsList;
  odsList.Close;
  odsList.Open;
  CheckEnabledButtons;
end;

procedure TfrmMain.aCopyExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select fb_text from asu.trichviewdata where fk_pacid = :pfk_pacid ';
    ods.DeclareAndSet('pfk_pacid', otInteger, dsList.DataSet.FieldByName('FK_ID').AsInteger);
    ods.Open;
    ActivateKeyboardLayout(russian, KLF_REORDER);
    Clipboard.AsText := ods.FieldByName('fb_text').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.aParamExecute(Sender: TObject);
begin
  with TfrmParamDate.Create(Self) do
    begin
      if Execute then
        begin
          if ModalResult = MrOK then
            begin
              dDateBeg := Period.First;
              dDateEnd := Period.Last;
              lbBeg.Caption := DateTimeToStr(Period.First);
              lbEnd.Caption := DateTimeToStr(Trunc(Period.Last));
              cciDates.Visible := ivAlways;
              aClearDates.Visible := True;
              aClearDates.Enabled := True;
              dsList.DataSet := odsListDates;
              odsListDates.Close;
              odsListDates.SetVariable('PFK_PACID', pPACID);
              odsListDates.SetVariable('PDATE1', Period.First);
              odsListDates.SetVariable('PDATE2', Period.Last);
              odsListDates.Open;
              CheckEnabledButtons;
            end;
        end;
      Free;
    end;
end;

procedure TfrmMain.aProtocolExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT (SELECT FB_TEXT FROM ASU.TRICHVIEWDATA WHERE FK_PACID = :PFK_PACID) AS FB_TEXT, '+#13+
                    '        (SELECT TS_SPRAV.FC_NAME FROM ASU.TS_SPRAV, ASU.TSOTR '+#13+
                    '          WHERE TSOTR.FK_SPRAVID = TS_SPRAV.FK_ID AND TSOTR.FK_ID = :PFK_SOTRID) AS NAMESPEC, '+#13+
                    '        ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(:PPACID) AGE '+#13+
                    '   FROM DUAL ';
    ods.DeclareAndSet('PFK_PACID', otInteger, dsList.DataSet.FieldByName('FK_ID').AsInteger);
    ods.DeclareAndSet('PFK_SOTRID', otInteger, dsList.DataSet.FieldByName('FK_ISPOLID').AsInteger);
    ods.DeclareAndSet('PPACID', otInteger, dsList.DataSet.FieldByName('FK_PACID').AsInteger);
    ods.Open;
    sTextIssl_4Rep := ods.FieldByName('FB_TEXT').AsString;
    sSotrSpec_4Rep := ods.FieldByName('NAMESPEC').AsString;
    sPacAge_4Rep := ods.FieldByName('AGE').AsString;
  finally
    ods.Free;
  end;
  frxRepProsmotr.ShowReport;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin
  RefreshQuery(dsList.DataSet);
  CheckEnabledButtons;
end;

procedure TfrmMain.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.bbPrintClick(Sender: TObject);
var id : integer;
begin
  id := dsList.DataSet.FieldByName('FK_ID').AsInteger;
  frxDBDataset1.DataSet := dsList.DataSet;
  if dsList.DataSet = odsListDates then
    begin
      frxListDates.ShowReport;
    end else
    begin
      frxList.ShowReport;
    end;
  dsList.DataSet.Locate('FK_ID', id, []);
end;

procedure TfrmMain.CheckEnabledButtons;
begin
  aProtocol.Enabled := dsList.DataSet.RecordCount <> 0;
  aPrint.Enabled := dsList.DataSet.RecordCount <> 0;
end;

procedure TfrmMain.DoRefreshConst;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select ASU.PKG_REGIST_PACFUNC.GET_PAC_FIO(:PFK_PACID) AS PACFIO, '+#13+
                    '        ASU.PKG_SMINI.READSTRING(''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME, '+#13+
                    '        TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS DATESYS from dual ';
    ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
    ods.Open;
    sPacFio_4Rep := ods.FieldByName('PACFIO').AsString;
    sCompanyName_4Rep := ods.FieldByName('COMPANYNAME').AsString;
    sSysDate_4Rep := ods.FieldByName('DATESYS').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.DoShowFrmMain(nPACID, nSOTRID: Integer);
begin
  pPACID := nPACID;
  pSOTRID := nSOTRID;
  MedotradeSign := ReadMedotradeSign;
  odsList.Close;
  odsList.SetVariable('PFK_PACID', nPACID);
  odsList.Open;
  DoRefreshConst;
  TV.StoreToRegistry('\SoftWare\SoftMaster\ListPatNaz\TVSotr_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'TV');
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\ListPatNaz\TVSotr_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'TV');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
  aClearDates.Visible := False;
  aClearDates.Enabled := False;
  russian:=LoadKeyboardLayout('00000419', 0);  
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  PostMessage(Handle, WM_ACTIVATE, WA_ACTIVE, 0);
end;

procedure TfrmMain.frxListDatesGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'DATESYS' then Value := sSysDate_4Rep;
  if VarName = 'PACFIO' then Value := sPacFio_4Rep;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
  if VarName = 'PDATE1' then Value := dDateBeg;
  if VarName = 'PDATE2' then Value := dDateEnd;
end;

procedure TfrmMain.frxListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'DATESYS' then Value := sSysDate_4Rep;
  if VarName = 'PACFIO' then Value := sPacFio_4Rep;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.frxRepProsmotrGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'PACAGE' then Value := sPacAge_4Rep;
  if VarName = 'PACFIO' then Value := dsList.DataSet.FieldByName('PACFIO').AsString;
  if VarName = 'RUNDATE' then Value := dsList.DataSet.FieldByName('FD_RUN').AsString;
  if VarName = 'ISSLNAME' then Value := dsList.DataSet.FieldByName('FC_NAME').AsString;
  if VarName = 'ISSLTEXT' then Value := sTextIssl_4Rep;
  if VarName = 'SOTRNAME' then Value := dsList.DataSet.FieldByName('IFIO').AsString;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
  if VarName = 'SOTRSPEC' then Value := sSotrSpec_4Rep;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\ListPatNaz\TVSotr_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TV');
end;

procedure TfrmMain.UnloadDll;
begin
  TV.StoreToRegistry('\SoftWare\SoftMaster\ListPatNaz\TVSotr_' + IntToStr(pSOTRID), TRUE, [], 'TV');
end;

end.
