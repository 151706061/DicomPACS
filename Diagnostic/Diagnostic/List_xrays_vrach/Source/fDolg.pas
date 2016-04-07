unit fDolg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxImageComboBox,
  cxTextEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  OracleData, dxBarExtItems, Oracle, Menus, Registry, cxGridExportLink,
  frxClass, frxDBSet, Clipbrd, dxBar, dxPSUtl, dxBarExtDBItems, ExtCtrls,
  StdCtrls, cxContainer, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, dxSkinsdxBarPainter, jvDBUtils, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmDolg = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    bb1: TdxBarButton;
    actlstDolg: TActionList;
    actClose: TAction;
    actOtmena: TAction;
    actRefresh: TAction;
    bb2: TdxBarButton;
    bb3: TdxBarButton;
    cxGr: TcxGrid;
    TVList: TcxGridDBTableView;
    TVREANIM: TcxGridDBColumn;
    TVDATENAZ: TcxGridDBColumn;
    TVListDATERUN: TcxGridDBColumn;
    TVListFIO: TcxGridDBColumn;
    TVListDATEROJD: TcxGridDBColumn;
    TVListDS: TcxGridDBColumn;
    TVListNAZ: TcxGridDBColumn;
    TVOTDEL: TcxGridDBColumn;
    TVSTATE: TcxGridDBColumn;
    TVListPARAM: TcxGridDBColumn;
    TVSEX: TcxGridDBColumn;
    TVTIME_ISL: TcxGridDBColumn;
    TVNAZTYPE: TcxGridDBColumn;
    TVFK_NAZTYPE: TcxGridDBColumn;
    TVSOS: TcxGridDBColumn;
    TVListAGE: TcxGridDBColumn;
    cxGrLevel1: TcxGridLevel;
    odsList: TOracleDataSet;
    odsListFK_ID: TFloatField;
    odsListFK_SMID: TFloatField;
    odsListFD_NAZ: TDateTimeField;
    odsListFK_PACID: TFloatField;
    odsListFK_NAZSOSID: TFloatField;
    odsListFK_ISPOLID: TFloatField;
    odsListFIOPAC: TStringField;
    odsListFD_ROJD: TDateTimeField;
    odsListAGE: TFloatField;
    odsListFC_NAME: TStringField;
    odsListFC_DIAG: TStringField;
    odsListPARAM: TStringField;
    odsListPEPLID: TFloatField;
    odsListSEX: TStringField;
    odsListSTATE: TStringField;
    odsListTIME_ISL: TStringField;
    odsListFK_ROOMID: TIntegerField;
    odsListOTDEL: TStringField;
    odsListFC_TYPE: TStringField;
    odsListFK_NAZTYPEID: TFloatField;
    odsListFK_VRACHID: TFloatField;
    odsListIS_AMBULANCE: TFloatField;
    odsListFD_RUN: TStringField;
    odsListFK_DOCID: TFloatField;
    odsListRUNTIME: TDateTimeField;
    odsListIS_REANIM: TFloatField;
    dsList: TDataSource;
    dxDate: TdxBarDateCombo;
    bb4: TdxBarButton;
    actLoad: TAction;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    N2: TMenuItem;
    actText: TAction;
    actWeb: TAction;
    actXML: TAction;
    actXLS: TAction;
    actPrint: TAction;
    sdPopUp: TSaveDialog;
    bb5: TdxBarButton;
    frxDBPrintDolg: TfrxDBDataset;
    actCopyFIO: TAction;
    N3: TMenuItem;
    dsKab: TDataSource;
    odsKab: TOracleDataSet;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    pnlKab: TPanel;
    cxlcRoom: TcxLookupComboBox;
    Label4: TLabel;
    frxPrintList: TfrxReport;
    bbRanee: TdxBarButton;
    actPac: TAction;
    VListFK_ID: TcxGridDBColumn;
    VListPACID: TcxGridDBColumn;
    VListSMID: TcxGridDBColumn;
    procedure actCloseExecute(Sender: TObject);
    procedure actOtmenaExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure odsListAfterScroll(DataSet: TDataSet);
    procedure actLoadExecute(Sender: TObject);
    procedure odsListBeforeOpen(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actTextExecute(Sender: TObject);
    procedure actWebExecute(Sender: TObject);
    procedure actXMLExecute(Sender: TObject);
    procedure actXLSExecute(Sender: TObject);
    procedure frxPrintListGetValue(const VarName: String;
      var Value: Variant);
    procedure actCopyFIOExecute(Sender: TObject);
    procedure odsKabBeforeOpen(DataSet: TDataSet);
    procedure actPacExecute(Sender: TObject);
  private
    { Private declarations }
  public
    GET_SYSDATE_4REP : String;
    procedure DoShowfrmDolg;
    procedure CheckEnabledButtons;
    procedure DoRefreshSMIDConst;
    { Public declarations }
  end;

var
  frmDolg: TfrmDolg;
  get_nazcancel : Integer;
  get_sysdate : TDateTime;
implementation
uses fMain, fOtmena, fPac;
{$R *.dfm}

{ TfrmDolg }

procedure TfrmDolg.DoShowfrmDolg;
var Reg : TRegIniFile;
begin
  DoRefreshSMIDConst;
  odsKab.Open;
//------------------------------------------------------------------------------
  actPrint.Enabled := False;
  actOtmena.Enabled := False;
  actPac.Enabled := False;
  dxDate.Date := get_sysdate;
  Reg:=TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  Reg.OpenKey('\Software\Softmaster\List_xrays_vrach\fDolg\ID_SOTR'+IntToStr(frmMain.pSOTRID), True);
  cxlcRoom.EditValue := Reg.ReadInteger('\Software\Softmaster\List_xrays_vrach\fDolg\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'ID_KABINET_DOLG', 0);
  Reg.Free;
//------------------------------------------------------------------------------
  TVList.StoreToRegistry('\SoftWare\SoftMaster\List_xrays_vrach\TVListDolg'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TVListDolg');
  TVList.RestoreFromRegistry('\SoftWare\SoftMaster\List_xrays_vrach\TVListDolg'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TVListDolg');
end;

procedure TfrmDolg.actCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmDolg.actOtmenaExecute(Sender: TObject);
var oq : TOracleQuery;
     I : Integer;
begin
  Application.CreateForm(TfrmOtmena, frmOtmena);
  frmOtmena.DoShowfrmOtmena(odsList.FieldByName('FK_ID').AsInteger, frmMain.pSOTRID);
  frmOtmena.ShowModal;
  if frmOtmena.ModalResult = MrOK then
    begin
      for I := 0 to TVLIST.Controller.SelectedRecordCount -1 do    // Iterate
        begin
          if TVLIST.DataController.Controller.SelectedRecords[I].Selected = True then
            begin
              oq := TOracleQuery.Create(nil);
              oq.Session := frmMain.os;
              oq.Cursor := crSQLWait;
              oq.SQL.Text := ' UPDATE VNAZ SET FK_ISPOLID = :pFK_ISPOLID, FK_NAZSOSID = :pFK_NAZSOSID WHERE FK_ID = :pFK_ID ';
              oq.DeclareAndSet('pFK_ISPOLID', otInteger, frmMain.pSOTRID);
              oq.DeclareAndSet('pFK_NAZSOSID', otInteger, GET_NAZCANCEL);
              oq.DeclareAndSet('pFK_ID', otInteger, TVLIST.Controller.SelectedRecords[i].Values[VLISTFK_ID.Index]);
              oq.Execute;
              frmMain.os.Commit;

              oq.DeleteVariables;
              oq.SQL.Text := ' INSERT INTO VRES(FK_SMID, FD_INS, FC_RES, FC_TYPE, FK_VRACHID, FK_PACID, FK_NAZID, FK_SOS) '+
                             ' VALUES(:pFK_SMID, SYSDATE, :pFC_RES, ''TEXT'', :pFK_VRACHID, :pFK_PACID, :pFK_NAZID, :pFK_SOS) ';
              oq.DeclareAndSet('pFK_SMID', otInteger, TVLIST.Controller.SelectedRecords[i].Values[VLISTSMID.Index]);
              oq.DeclareAndSet('pFC_RES', otString, frmOtmena.cxOtmena.Text+';'+frmOtmena.cxOtmenaHand.Text);
              oq.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
              oq.DeclareAndSet('pFK_PACID', otInteger, TVLIST.Controller.SelectedRecords[i].Values[VLISTPACID.Index]);
              oq.DeclareAndSet('pFK_NAZID', otInteger, TVLIST.Controller.SelectedRecords[i].Values[VLISTFK_ID.Index]);
              oq.DeclareAndSet('pFK_SOS', otInteger, GET_NAZCANCEL);
              oq.Execute;
              frmMain.os.Commit;
              oq.Free;
              odsList.Next;
            end;
        end;
      RefreshQuery(odsList);
    end;
  frmOtmena.Free;
end;

procedure TfrmDolg.actRefreshExecute(Sender: TObject);
begin
//
end;

procedure TfrmDolg.odsListAfterScroll(DataSet: TDataSet);
begin
  CheckEnabledButtons;
end;

procedure TfrmDolg.CheckEnabledButtons;
begin
  actOtmena.Enabled := odsList.RecordCount <> 0;
  actPrint.Enabled := odsList.RecordCount <> 0;
  actPac.Enabled := odsList.RecordCount <> 0;
end;

procedure TfrmDolg.actLoadExecute(Sender: TObject);
begin
  frmDolg.Caption := 'Долги по исследованиям. '+cxlcRoom.Text; 
  odsList.Close;
  odsList.Open;
end;

procedure TfrmDolg.odsListBeforeOpen(DataSet: TDataSet);
begin
  odsList.SetVariable('PFK_ROOMID', cxlcRoom.EditValue);
  odsList.SetVariable('PFD_DATE', dxDate.Date);
end;

procedure TfrmDolg.DoRefreshSMIDConst;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  ods.Session := frmMain.os;
  ods.Cursor := crSQLWait;
  ods.SQL.Text := ' SELECT asu.GET_NAZCANCEL, TRUNC(SYSDATE) AS SYSTEMDATE FROM DUAL ';
  ods.Close;
  ods.Open;

  get_nazcancel := ods.FieldByName('GET_NAZCANCEL').AsInteger;
  get_sysdate := ods.FieldByName('SYSTEMDATE').AsDateTime;
  ods.Free;
end;

procedure TfrmDolg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile;
begin
//------------------------------------------------------------------------------
  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if not Reg.OpenKey('\Software\Softmaster\List_xrays_vrach\fDolg\', FALSE) then
   begin
     Reg.CreateKey('\Software\Softmaster\List_xrays_vrach\fDolg');
   end;
  try
    Reg.WriteInteger('\Software\Softmaster\List_xrays_vrach\fDolg'+'\ID_SOTR'+IntToStr(frmMain.pSOTRID), 'ID_KABINET_DOLG', cxlcRoom.EditValue);
  except
  end;
  Reg.Free;
//------------------------------------------------------------------------------
  TVList.StoreToRegistry('\SoftWare\SoftMaster\List_xrays_vrach\TVListDolg'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TVListDolg');
end;

procedure TfrmDolg.N2Click(Sender: TObject);
begin
  TVList.RestoreFromRegistry('\SoftWare\SoftMaster\List_xrays_vrach\TVListDolg'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TVListDolg');
end;

procedure TfrmDolg.actPacExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmPac, frmPac);
  try
    frmPac.DoShowFormPac;
    frmPac.ShowModal;
  finally
    frmPac.Free;
  end;
end;

procedure TfrmDolg.actPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
     id : Integer;
begin
  id := odsList.FieldByName('FK_ID').AsInteger;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS SYSTEMDATE FROM DUAL ';
    ods.Open;
    GET_SYSDATE_4REP := ods.FieldByName('SYSTEMDATE').AsString;
  finally
    ods.Free;
  end;
  frxPrintList.ShowReport;
  odsList.Locate('FK_ID', id, []);
end;

procedure TfrmDolg.actTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmDolg.actWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmDolg.actXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmDolg.actXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmDolg.frxPrintListGetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'DATESTR' then Value := dxDate.Date;
  if VarName = 'SYSDATE' then Value := GET_SYSDATE_4REP;
  if VarName = 'KAB' then Value := cxlcRoom.Text;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;  
end;

procedure TfrmDolg.actCopyFIOExecute(Sender: TObject);
begin
  Clipboard.AsText := ReplaceSubStr(odsList.FieldByName('FIOPAC').AsString, '.', '');
end;

procedure TfrmDolg.odsKabBeforeOpen(DataSet: TDataSet);
begin
  odsKab.SetVariable('PSOTR', frmMain.pSOTRID);
end;

end.
