unit fArchive;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, ActnList, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Oracle, OracleData, dxBarExtItems, jvDbUtils,
  dxBarExtDBItems, cxGridExportLink, Menus, StdCtrls, frxClass, frxDBSet,
  cxImageComboBox, ImgList, Registry, cxContainer, cxTextEdit, ExtCtrls,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  dxmdaset;

type
  TfrmArchive = class(TForm)
    BMArchive: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    bbRefreshArchive: TdxBarButton;
    bbCloseArchive: TdxBarButton;
    bbResultArchive: TdxBarButton;
    alArchive: TActionList;
    aRefreshArchive: TAction;
    aProsmotr: TAction;
    aClose: TAction;
    TVARCHIVE: TcxGridDBTableView;
    cxGrArchLevel1: TcxGridLevel;
    cxGrArch: TcxGrid;
    odsArchive: TOracleDataSet;
    dsArchive: TDataSource;
    TVFC_NAME: TcxGridDBColumn;
    TVVRACHFIO: TcxGridDBColumn;
    TVDATE: TcxGridDBColumn;
    aSearchDate: TAction;
    aPref: TAction;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    sdPopUpArch: TSaveDialog;
    pmTVArch: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    TVFIOPAC: TcxGridDBColumn;
    TVDATEROJD: TcxGridDBColumn;
    TVKEMNAPR: TcxGridDBColumn;
    frxDBDataset1: TfrxDBDataset;
    bbPrintArch: TdxBarButton;
    aPrintArch: TAction;
    N1: TMenuItem;
    frxDBDataset2: TfrxDBDataset;
    odsImages: TOracleDataSet;
    TVIMAGE: TcxGridDBColumn;
    ilImages: TImageList;
    N2: TMenuItem;
    aSnimok: TAction;
    TVSMIDNAME: TcxGridDBColumn;
    N3: TMenuItem;
    TVSTATE: TcxGridDBColumn;
    TVOTDEL: TcxGridDBColumn;
    frxReport1: TfrxReport;
    odsArchiveFK_ID: TFloatField;
    odsArchiveFK_PACID: TFloatField;
    odsArchiveFK_NAZSOSID: TFloatField;
    odsArchiveFD_DATE: TDateTimeField;
    odsArchiveFC_NAME: TStringField;
    odsArchiveSMIDNAME: TStringField;
    odsArchiveFK_OWNER: TFloatField;
    odsArchivePACFIO: TStringField;
    odsArchiveKEM: TStringField;
    odsArchiveVRACHFIO: TStringField;
    odsArchiveFD_ROJD: TDateTimeField;
    odsArchiveCOUNTIMAGE: TFloatField;
    odsArchiveSTATE: TStringField;
    odsArchiveOTDEL: TStringField;
    IL: TImageList;
    bbParam: TdxBarButton;
    aParam: TAction;
    oqThread: TOracleQuery;
    dxMemData1: TdxMemData;
    dxMemData1FK_ID: TIntegerField;
    dxMemData1KABNAME: TStringField;
    dxMemData1FD_RUN: TStringField;
    dxMemData1FIOPAC: TStringField;
    dxMemData1ISSLNAME: TStringField;
    dxMemData1STATE: TStringField;
    dxMemData1FK_NAZSOSID: TIntegerField;
    dxMemData1FD_RUN_TIME: TStringField;
    procedure aCloseExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aRefreshArchiveExecute(Sender: TObject);
    procedure aProsmotrExecute(Sender: TObject);
    procedure odsArchiveAfterOpen(DataSet: TDataSet);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aPrintArchExecute(Sender: TObject);
    procedure odsArchiveBeforeOpen(DataSet: TDataSet);
    procedure aSnimokExecute(Sender: TObject);
    procedure odsArchiveAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure frxDozaGetValue(const VarName: String; var Value: Variant);
    procedure frxDozaSotrGetValue(const VarName: String; var Value: Variant);
    procedure N3Click(Sender: TObject);
    procedure TVARCHIVECellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure aParamExecute(Sender: TObject);
  private
    Russian, Latin: HKL;
    pDATE1, pDATE2 : TDateTime;
    procedure CheckEnabledButtons;
    { Private declarations }
  public
    VRACHID : Integer;
    { Public declarations }
  end;

var
  frmArchive: TfrmArchive;

implementation
uses fMain, fImages, uPeriod;
{$R *.dfm}

procedure TfrmArchive.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmArchive.aParamExecute(Sender: TObject);
begin
//
end;

procedure TfrmArchive.FormShow(Sender: TObject);
begin
  aProsmotr.Enabled := FALSE;
  aPrintArch.Enabled := FALSE;

  TVARCHIVE.StoreToRegistry('\SoftWare\SoftMaster\XRAYS\TVARCHIVE'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TVARCHIVE');
  TVARCHIVE.ApplyBestFit;
  TVARCHIVE.RestoreFromRegistry('\SoftWare\SoftMaster\XRAYS\TVARCHIVE'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVARCHIVE');
end;

procedure TfrmArchive.aRefreshArchiveExecute(Sender: TObject);
var DataSet : TDataSet;
begin
  DataSet := dsArchive.DataSet;
  RefreshQuery(DataSet);
end;

procedure TfrmArchive.aProsmotrExecute(Sender: TObject);
var DataSet : TDataSet;
begin
  DataSet := dsArchive.DataSet;
  frmMain.DoResult(DataSet.FieldByName('FK_ID').AsInteger)
end;

procedure TfrmArchive.CheckEnabledButtons;
var DataSet : TDataSet;
begin
  DataSet := dsArchive.DataSet;
  aProsmotr.Enabled := DataSet.RecordCount <> 0;
  aPrintArch.Enabled := DataSet.RecordCount <> 0;
end;

procedure TfrmArchive.odsArchiveAfterOpen(DataSet: TDataSet);
begin
  CheckEnabledButtons;
end;

procedure TfrmArchive.aTextExecute(Sender: TObject);
begin
  sdPopUpArch.DefaultExt := 'txt';
  sdPopUpArch.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUpArch.Execute then
    if TVARCHIVE.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUpArch.FileName, cxGrArch, TRUE, FALSE)
    else
      ExportGridToText(sdPopUpArch.FileName, cxGrArch, TRUE, TRUE);
end;

procedure TfrmArchive.aWebExecute(Sender: TObject);
begin
  sdPopUpArch.DefaultExt := 'html';
  sdPopUpArch.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUpArch.Execute then
    if TVARCHIVE.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUpArch.FileName, cxGrArch, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUpArch.FileName, cxGrArch, TRUE, TRUE);
end;

procedure TfrmArchive.aXMLExecute(Sender: TObject);
begin
  sdPopUpArch.DefaultExt := 'xml';
  sdPopUpArch.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUpArch.Execute then
    if TVARCHIVE.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUpArch.FileName, cxGrArch, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUpArch.FileName, cxGrArch, TRUE, TRUE);
end;

procedure TfrmArchive.aXLSExecute(Sender: TObject);
begin
  sdPopUpArch.DefaultExt := 'xls';
  sdPopUpArch.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUpArch.Execute then
    if TVARCHIVE.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUpArch.FileName, cxGrArch, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUpArch.FileName, cxGrArch, TRUE, TRUE);
end;

procedure TfrmArchive.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TVARCHIVE.StoreToRegistry('\SoftWare\SoftMaster\XRAYS\TVARCHIVE'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVARCHIVE');
end;

procedure TfrmArchive.aPrintArchExecute(Sender: TObject);
var DataSet : TDataSet;
begin
  DataSet := dsArchive.DataSet;
  frxDBDataset1.DataSet := DataSet;
  frxReport1.ShowReport;
end;

procedure TfrmArchive.odsArchiveBeforeOpen(DataSet: TDataSet);
begin
  odsArchive.SetVariable('PFD_DATE1', Date); //!!!
  odsArchive.SetVariable('PFD_DATE2', Date);
  odsArchive.SetVariable('PSOTR', frmMain.pSOTRID);
end;

procedure TfrmArchive.TVARCHIVECellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if odsArchive.FieldByName('COUNTIMAGE').AsInteger = 0 then
		aProsmotrExecute(Self)
	else
		aSnimokExecute(Self);
end;

procedure TfrmArchive.aSnimokExecute(Sender: TObject);
var DataSet : TDataSet;
begin
  DataSet := dsArchive.DataSet;
  if not DirectoryExists(ExtractFilePath(paramstr(0))+'RGIMAGES') then
    CreateDir(ExtractFilePath(paramstr(0))+'RGIMAGES');

  odsImages.Close;
  odsImages.SetVariable('PFK_PACID', DataSet.FieldByName('FK_ID').AsInteger);
  odsImages.Open;
  if odsImages.RecordCount > 0 then
    begin
      while not odsImages.Eof do
        begin
          TBlobField(odsImages.FieldByName('FB_BLOB')).SaveToFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+odsImages.FieldByName('SFILENAME').AsString);
          odsImages.Next;
        end;
      Application.CreateForm(TfrmImages, frmImages);
      frmImages.DoShowfrmImages(odsImages, odsImages.RecordCount);
    end;
end;

procedure TfrmArchive.odsArchiveAfterScroll(DataSet: TDataSet);
begin
  if odsArchive.FieldByName('COUNTIMAGE').AsInteger <> 0 then
    aSnimok.Enabled := TRUE
  else
    aSnimok.Enabled := FALSE;
end;

procedure TfrmArchive.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);
  latin:=LoadKeyboardLayout('00000409', 0);
end;

procedure TfrmArchive.frxDozaGetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'D1' then Value := pDATE1;
  if VarName = 'D2' then Value := pDATE2;
end;

procedure TfrmArchive.frxDozaSotrGetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'D1' then Value := pDATE1;
  if VarName = 'D2' then Value := pDATE2;
end;

procedure TfrmArchive.N3Click(Sender: TObject);
begin
  TVARCHIVE.RestoreFromRegistry('\SoftWare\SoftMaster\XRAYS\TVARCHIVE'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TVARCHIVE');
end;

end.
