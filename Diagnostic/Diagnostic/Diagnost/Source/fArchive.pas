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
  dxSkinOffice2007Green, Medotrade;

type
  TfrmArchive = class(TForm)
    BMArchive: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    bbRefreshArchive: TdxBarButton;
    bbCloseArchive: TdxBarButton;
    bbResultArchive: TdxBarButton;
    alArchive: TActionList;
    aRefreshArchive: TAction;
    aResult: TAction;
    aClose: TAction;
    TVARCHIVE: TcxGridDBTableView;
    cxGrArchLevel1: TcxGridLevel;
    cxGrArch: TcxGrid;
    odsArchive: TOracleDataSet;
    dsArchive: TDataSource;
    dxBarDockControl2: TdxBarDockControl;
    bbDateBegin: TdxBarDateCombo;
    bbDateEnd: TdxBarDateCombo;
    TVFC_NAME: TcxGridDBColumn;
    TVVRACHFIO: TcxGridDBColumn;
    TVDATE: TcxGridDBColumn;
    bbSearchDate: TdxBarButton;
    aSearchDate: TAction;
    bbPref: TdxBarButton;
    aPref: TAction;
    dcPref: TdxBarDockControl;
    bbFilterFIO: TdxBarButton;
    aFilterFIO: TAction;
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
    paFAM: TPanel;
    deFAM: TcxTextEdit;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    TVSMIDNAME: TcxGridDBColumn;
    N3: TMenuItem;
    TVSTATE: TcxGridDBColumn;
    TVOTDEL: TcxGridDBColumn;
    frxRepArchive: TfrxReport;
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
    lbl1: TLabel;
    VISSLEDSOS: TcxGridDBColumn;
    VARCHIVEVIDOPL: TcxGridDBColumn;
    odsArchiveVID_OPL: TStringField;
    N4: TMenuItem;
    procedure aCloseExecute(Sender: TObject);
    procedure aSearchDateExecute(Sender: TObject);
    procedure aPrefExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aRefreshArchiveExecute(Sender: TObject);
    procedure aFilterFIOExecute(Sender: TObject);
    procedure aResultExecute(Sender: TObject);
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
    procedure deFAMClick(Sender: TObject);
    procedure deFAMEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frxDozaGetValue(const VarName: String; var Value: Variant);
    procedure frxDozaSotrGetValue(const VarName: String; var Value: Variant);
    procedure N3Click(Sender: TObject);
    procedure TVARCHIVEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure deFAMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TVARCHIVECellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TVARCHIVECustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure frxRepArchiveGetValue(const VarName: string; var Value: Variant);
  private
    sDateSys_4Rep : string;
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
uses fMain, fImages, fOtmena;
{$R *.dfm}

procedure TfrmArchive.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmArchive.aSearchDateExecute(Sender: TObject);
var DataSet : TDataSet;
begin
  DataSet := dsArchive.DataSet;
  DataSet.Close;
  DataSet.Open;
end;

procedure TfrmArchive.aPrefExecute(Sender: TObject);
begin
  if bbPref.Down then
    dcPref.Visible := TRUE
  else
    dcPref.Visible := FALSE;
end;

procedure TfrmArchive.FormShow(Sender: TObject);
var Reg : TRegIniFile;
begin
  bbPref.Down := FALSE;
  dcPref.Visible := FALSE;
//------------------------------------------------------------------------------
  Reg:=TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  Reg.OpenKey('\Software\Softmaster\XRAYS\DatesArchive'+'VRACH'+IntToStr(frmMain.pSOTRID), TRUE);
  if Reg.ReadString('\Software\Softmaster\XRAYS\DatesArchive'+'VRACH'+IntToStr(frmMain.pSOTRID), 'DATE_BEG', '') = '' then
    begin
      bbDateBegin.Date := Date;
      bbDateEnd.Date := Date;
    end else
    begin
      bbDateBegin.Date := StrToDateTime(Reg.ReadString('\Software\Softmaster\XRAYS\DatesArchive'+'VRACH'+IntToStr(frmMain.pSOTRID), 'DATE_BEG', ''));
      bbDateEnd.Date := StrToDateTime(Reg.ReadString('\Software\Softmaster\XRAYS\DatesArchive'+'VRACH'+IntToStr(frmMain.pSOTRID), 'DATE_END', ''));
    end;
//------------------------------------------------------------------------------
  aResult.Enabled := FALSE;
  aPrintArch.Enabled := FALSE;

  TVARCHIVE.StoreToRegistry('\SoftWare\SoftMaster\XRAYS\TVARCHIVE'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TVARCHIVE');
  TVARCHIVE.ApplyBestFit;
  TVARCHIVE.RestoreFromRegistry('\SoftWare\SoftMaster\XRAYS\TVARCHIVE'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVARCHIVE');
  Reg.Free;
end;

procedure TfrmArchive.aRefreshArchiveExecute(Sender: TObject);
var DataSet : TDataSet;
begin
  DataSet := dsArchive.DataSet;
  RefreshQuery(DataSet);
end;

procedure TfrmArchive.aFilterFIOExecute(Sender: TObject);
begin
  if deFAM.Text <> '' then
    begin
      odsArchive.Filtered := TRUE;
      odsArchive.Filter := 'PACFIO = '+ '''' + deFAM.Text + '*''';
    end else
    begin
      odsArchive.Filtered := FALSE;
      RefreshQuery(odsArchive);
    end;
end;

procedure TfrmArchive.aResultExecute(Sender: TObject);
var DataSet : TDataSet;
begin
  DataSet := dsArchive.DataSet;
  frmMain.DoResult(DataSet.FieldByName('FK_ID').AsInteger);
end;

procedure TfrmArchive.CheckEnabledButtons;
var DataSet : TDataSet;
begin
  DataSet := dsArchive.DataSet;
  aResult.Enabled := DataSet.RecordCount <> 0;
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
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if not Reg.OpenKey('\Software\Softmaster\XRAYS\DatesArchive'+'VRACH'+IntToStr(frmMain.pSOTRID), FALSE) then
   begin
     Reg.CreateKey('\Software\Softmaster\XRAYS\DatesArchive'+'VRACH'+IntToStr(frmMain.pSOTRID));
   end;
  try
    Reg.WriteString('\Software\Softmaster\XRAYS\DatesArchive'+'VRACH'+IntToStr(frmMain.pSOTRID), 'DATE_BEG', DateTimeToStr(bbDateBegin.Date));
    Reg.WriteString('\Software\Softmaster\XRAYS\DatesArchive'+'VRACH'+IntToStr(frmMain.pSOTRID), 'DATE_END', DateTimeToStr(bbDateEnd.Date));
  except
  end;
  Reg.Free;
  TVARCHIVE.StoreToRegistry('\SoftWare\SoftMaster\XRAYS\TVARCHIVE'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVARCHIVE');
end;

procedure TfrmArchive.aPrintArchExecute(Sender: TObject);
var DataSet : TDataSet;
        ods : TOracleDataSet;
         id : Integer;
begin
  id := odsArchive.FieldByName('FK_ID').AsInteger;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS DATESYS FROM DUAL ';
    ods.Open;
    sDateSys_4Rep := ods.FieldByName('DATESYS').AsString;
    DataSet := dsArchive.DataSet;
    frxDBDataset1.DataSet := DataSet;
    frxRepArchive.ShowReport;
  finally
    ods.Free;
  end;
  odsArchive.Locate('FK_ID', id, []);
end;

procedure TfrmArchive.odsArchiveBeforeOpen(DataSet: TDataSet);
begin
  odsArchive.SetVariable('PFD_DATE1', bbDateBegin.Date);
  odsArchive.SetVariable('PFD_DATE2', bbDateEnd.Date);
  odsArchive.SetVariable('PSOTR', frmMain.pSOTRID);
end;

procedure TfrmArchive.TVARCHIVECellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var ods : TOracleDataSet;
begin
  if odsArchive.FieldByName('FK_NAZSOSID').AsInteger = GET_NAZCANCEL then
    begin
      Application.CreateForm(TfrmOtmena, frmOtmena);
      frmOtmena.acOk.Visible := FALSE;
      frmOtmena.GroupBox1.Visible := FALSE;
      frmOtmena.cxOtmena.Align := alClient;
      frmOtmena.acCancel.ImageIndex := 2;
      frmOtmena.acCancel.Caption := 'Закрыть';
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT FC_RES, FD_INS, FK_VRACHID, ASU.DO_VRACHFIO(FK_VRACHID) AS VRACHFIO '+
                        '   FROM VRES WHERE FK_NAZID = :pFK_NAZID AND FK_SOS = GET_NAZCANCEL ';
        ods.DeclareAndSet('pFK_NAZID', otInteger, odsArchive.FieldByName('FK_ID').AsInteger);
        ods.Open;
        frmOtmena.cxOtmena.Text := 'Сотрудник:'+' '+ods.FieldByName('VRACHFIO').AsString+','+' '+
                                   'Дата отмены:'+' '+DateTimeToStr(ods.FieldByName('FD_INS').AsDateTime)+#13#10+
                                   'Обоснование отмены:'+' '+ods.FieldByName('FC_RES').AsString;
      finally
        ods.Free;
      end;
      frmOtmena.ShowModal;
      frmOtmena.Free;
    end else
    begin
      if odsArchive.FieldByName('COUNTIMAGE').AsInteger = 0 then
		    aResultExecute(Self)
	    else
		    aSnimokExecute(Self);
    end;
end;

procedure TfrmArchive.TVARCHIVECustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[VISSLEDSOS.Index] = GET_NAZCANCEL then
    ACanvas.Brush.Color:=RGB(251, 172, 182);
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

procedure TfrmArchive.deFAMClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian,KLF_REORDER);
end;

procedure TfrmArchive.deFAMEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian,KLF_REORDER);
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

procedure TfrmArchive.frxRepArchiveGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'SYSDATE' then Value := sDateSys_4Rep;
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'VSEGO' then Value := odsArchive.RecordCount;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
end;

procedure TfrmArchive.N3Click(Sender: TObject);
begin
  TVARCHIVE.RestoreFromRegistry('\SoftWare\SoftMaster\XRAYS\TVARCHIVE'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TVARCHIVE');
end;

procedure TfrmArchive.TVARCHIVEKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_numpad1 then
    bbDateBegin.DirectClick;
  if key = vk_numpad2 then
    bbDateEnd.DirectClick;
  if (key = vk_numpad3) and (dcPref.Visible) then
    deFAM.SetFocus;
end;

procedure TfrmArchive.deFAMKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (deFAM.Focused) and (Key = VK_RETURN) then
    begin
      aFilterFIOExecute(nil);
      cxGrArch.SetFocus;
    end;
end;

end.
