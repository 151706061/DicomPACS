unit fNazRgOne1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, OracleData, Oracle, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ActnList, ImgList, dxBar,
  cxImageComboBox, ExtCtrls, dxBarExtItems, cxLabel, cxContainer,
  cxTextEdit, Registry, fMain, cxSplitter, StrUtils, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxBarPainter, Menus, cxGridExportLink,
  frxClass, frxDBSet, cxLookAndFeelPainters, StdCtrls, cxButtons, Clipbrd,
  dxSkinOffice2007Green, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmNazRg1 = class(TForm)
    ds: TDataSource;
    odsChild: TOracleDataSet;
    al: TActionList;
    BM: TdxBarManager;
    aClose: TAction;
    Panel1: TPanel;
    TVGROUPS: TcxGridDBTableView;
    cxGrGroupLevel1: TcxGridLevel;
    cxGrGroup: TcxGrid;
    Splitter1: TSplitter;
    VGROUPNAME: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    Panel2: TPanel;
    cxGr: TcxGrid;
    TV: TcxGridDBTableView;
    TVNAME: TcxGridDBColumn;
    cxGrLevel1: TcxGridLevel;
    dxBarDockControl2: TdxBarDockControl;
    stName: TdxBarStatic;
    odsGroups: TOracleDataSet;
    dsGroups: TDataSource;
    bbSet: TdxBarButton;
    aSet: TAction;
    pmGroup: TPopupMenu;
    aPrintGroup: TAction;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    Excel1: TMenuItem;
    sdPopUp: TSaveDialog;
    aTextMet: TAction;
    aWebMet: TAction;
    aXMLMet: TAction;
    aXLSMet: TAction;
    aPrintMet: TAction;
    pmMetodic: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Web2: TMenuItem;
    XML2: TMenuItem;
    Excel2: TMenuItem;
    frxRepGroup: TfrxReport;
    frxRepMetodic: TfrxReport;
    frxDBGroup: TfrxDBDataset;
    frxDBMetodic: TfrxDBDataset;
    Panel4: TPanel;
    lbFIO: TcxLabel;
    bClose: TcxButton;
    pmFIO: TPopupMenu;
    N7: TMenuItem;
    procedure TVKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure aCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure odsGroupsBeforeOpen(DataSet: TDataSet);
    procedure odsGroupsAfterScroll(DataSet: TDataSet);
    procedure aSetExecute(Sender: TObject);
    procedure TVCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure aPrintGroupExecute(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aTextMetExecute(Sender: TObject);
    procedure aWebMetExecute(Sender: TObject);
    procedure aXMLMetExecute(Sender: TObject);
    procedure aXLSMetExecute(Sender: TObject);
    procedure aPrintMetExecute(Sender: TObject);
    procedure frxRepGroupGetValue(const VarName: string; var Value: Variant);
    procedure frxRepMetodicGetValue(const VarName: string; var Value: Variant);
    procedure lbFIOMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbFIOMouseLeave(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    pAmbul : Integer;
    get_sysdate_4rep : String;
    Russian : HKL;
    { Private declarations }
  public
    IsKonsult, IsNotKonsult : Boolean;
    pPACID, pSOTRID, PKABID, pNAZID : Integer;
    FDNazID : Integer;
    FDDOCID : String;
    sDOCID : String;
    DateNaz : TDateTime;
    procedure DoShowfrmNazRg(nAmbul : Integer; nPACID, nSOTRID, nKABID : Integer; sFIOPAC : String; nNAZID : Integer=0; nDOCID : String='');
    procedure DoUpdateNaz;
    procedure DoInsertNaz(nROOMID : Integer; nDATE : TDateTime);
    { Public declarations }
  end;

var
  frmNazRg1: TfrmNazRg1;

implementation

uses fNazParamRegist, fRegistrAmbPac;

{$R *.dfm}

procedure TfrmNazRg1.TVCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aSetExecute(nil);
end;

procedure TfrmNazRg1.TVKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    begin
      aSetExecute(nil);
    end;
end;

procedure TfrmNazRg1.aCloseExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

procedure TfrmNazRg1.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);
  pSOTRID := frmMain.pSOTRID;
  odsGroups.AfterScroll := nil;
  if odsGroups.Active = FALSE then
    odsGroups.Open;
  odsGroups.AfterScroll := odsGroupsAfterScroll;  
end;

procedure TfrmNazRg1.frxRepGroupGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'SYSDATE' then Value := get_sysdate_4rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
end;

procedure TfrmNazRg1.frxRepMetodicGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'SYSDATE' then Value := get_sysdate_4rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'GROUPNAME' then Value := odsGroups.FieldByName('FC_NAME').AsString;  
end;

procedure TfrmNazRg1.lbFIOMouseLeave(Sender: TObject);
begin
  lbFIO.Style.BorderStyle := ebsNone;
  lbFIO.Style.BorderColor := clBtnFace;
end;

procedure TfrmNazRg1.lbFIOMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lbFIO.Style.BorderStyle := ebsUltraFlat;
  lbFIO.Style.BorderColor := clGray;
end;

procedure TfrmNazRg1.N7Click(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := lbFIO.Caption;
end;

procedure TfrmNazRg1.DoShowfrmNazRg(nAmbul : Integer; nPACID, nSOTRID, nKABID: Integer; sFIOPAC : String; nNAZID : Integer; nDOCID : String);
var ods : TOracleDataSet;
    id : Integer;
    Reg : TRegIniFile;
begin
  pAmbul := nAmbul;
  pPACID := nPACID;
  pSOTRID := nSOTRID;
  pKABID := nKABID;
  pNAZID := nNAZID;
  sDOCID := nDOCID;
  if sFIOPAC = '' then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT asu.PKG_REGIST_PACFUNC.GET_PAC_FIO(:PFK_PACID) AS PACFIO FROM DUAL ';
        ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
        ods.Open;
        lbFIO.Caption := ods.FieldByName('PACFIO').AsString;
      finally
        ods.Free;
      end;
    end else
    begin
      lbFIO.Caption := sFIOPAC;
    end;
//------------------------------------------------------------------------------
  Reg:=TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  Reg.OpenKey('\Software\Softmaster\fNazRg\ID_VIDNAZ'+IntToStr(pSOTRID), True);
  id := Reg.ReadInteger('\Software\Softmaster\fNazRg\ID_VIDNAZ'+IntToStr(pSOTRID), 'ID_VIDNAZ', 0);
  odsGroups.AfterScroll := nil;
  if id <> 0 then
    odsGroups.Locate('FK_ID', id, []);
  odsChild.Close;
  odsChild.SetVariable('PFK_GROUP', odsGroups.FieldByName('FK_ID').AsInteger);
  odsChild.SetVariable('PFK_KABINET', frmMain.odsKab.FieldByName('FK_ID').AsInteger);
  odsChild.SetVariable('PFK_SOTR', pSOTRID);
  odsChild.Open;
  stName.Caption := odsGroups.FieldByName('FC_NAME').AsString;
  odsGroups.AfterScroll := odsGroupsAfterScroll;
  Reg.Free;
//------------------------------------------------------------------------------
  frmNazRg1.Caption := 'Методики исследований. Кабинет -- ' + frmMain.odsKab.FieldByName('FC_NAME').AsString;
end;

procedure TfrmNazRg1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if not Reg.OpenKey('\Software\Softmaster\fNazRg\', FALSE) then
   begin
     Reg.CreateKey('\Software\Softmaster\fNazRg');
   end;
  try
    Reg.WriteInteger('\Software\Softmaster\fNazRg'+'\ID_VIDNAZ'+IntToStr(pSOTRID), 'ID_VIDNAZ', odsGroups.FieldByName('FK_ID').AsInteger);
  except
  end;
  Reg.Free;
end;

procedure TfrmNazRg1.DoUpdateNaz;
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    if frmMain.odsKab.FieldByName('is_flu').AsInteger = 1 then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' UPDATE asu.TNAZIS '+#13+
                       '    SET FK_SMID = :PFK_SMID, '+#13+
                       '        FK_ROOMID = :PFK_ROOMID, '+#13+
                       '        FC_NAME = asu.GET_SMIDNAME(:PFK_SMID), '+#13+
                       '        FD_RUN = SYSDATE, '+#13+
                       '        FC_TYPE = :PFC_TYPE  '+#13+
                       '  WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('PFK_SMID', otInteger, odsChild.FieldByName('FK_SMID').AsInteger);
        if pNAZID = 0 then
          oq.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz)
        else
          oq.DeclareAndSet('PFK_ID', otInteger, pNAZID);
        oq.DeclareAndSet('PFC_TYPE', otString, sDOCID);
        oq.DeclareAndSet('PFK_ROOMID', otInteger, frmMain.odsKab.FieldByName('fk_id').AsInteger);
        oq.Execute;
      end else
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' UPDATE asu.TNAZIS '+#13+
                       '    SET FK_SMID = :PFK_SMID, '+#13+
                       '        FK_ROOMID = :PFK_ROOMID, '+#13+
                       '        FC_NAME = asu.GET_SMIDNAME(:PFK_SMID), '+#13+
                       '        FD_RUN = :PFD_RUN, '+#13+
                       '        FC_TYPE = :PFC_TYPE  '+#13+
                       '  WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('PFK_SMID', otInteger, odsChild.FieldByName('FK_SMID').AsInteger);
        if pNAZID = 0 then
          oq.DeclareAndSet('PFK_ID', otInteger, frmMain.IDNaz)
        else
          oq.DeclareAndSet('PFK_ID', otInteger, pNAZID);
        oq.DeclareAndSet('PFK_ROOMID', otInteger, frmNazParamRegist.cxlcRoom.EditValue);
        oq.DeclareAndSet('PFD_RUN', otDate, StrToDateTime(DateToStr(frmNazParamRegist.cxdeDate.Date)+' '+FormatDateTime('hh:nn', frmNazParamRegist.cxteTime.Time)));
        oq.DeclareAndSet('PFC_TYPE', otString, sDOCID);
        oq.Execute;
        DateNaz := StrToDateTime(DateToStr(frmNazParamRegist.cxdeDate.Date)+' '+FormatDateTime('hh:nn', frmNazParamRegist.cxteTime.Time));
      end;
    frmMain.os.Commit;
    FDDOCID := sDOCID;
    if pNAZID = 0 then
      FDNazID := frmMain.IDNaz
    else
      FDNazID := pNAZID;
  finally
    oq.Free;
  end;   
end;

procedure TfrmNazRg1.aPrintGroupExecute(Sender: TObject);
var ods : TOracleDataSet;
     id : Integer;
begin
  id := odsGroups.FieldByName('FK_ID').AsInteger;
  odsGroups.AfterScroll := nil;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS SYSTEMDATE '+
                    '   FROM DUAL ';
    ods.Open;
  get_sysdate_4rep := ods.FieldByName('SYSTEMDATE').AsString;
  finally
    ods.Free;
  end;
  frxRepGroup.ShowReport;
  odsGroups.Locate('FK_ID', id, []);
  odsGroups.AfterScroll := odsGroupsAfterScroll;
end;

procedure TfrmNazRg1.aPrintMetExecute(Sender: TObject);
var ods : TOracleDataSet;
     id : Integer;
begin
  id := odsChild.FieldByName('FK_SMID').AsInteger;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS SYSTEMDATE '+
                    '   FROM DUAL ';
    ods.Open;
    get_sysdate_4rep := ods.FieldByName('SYSTEMDATE').AsString;
  finally
    ods.Free;
  end;
  frxRepMetodic.ShowReport;
  odsChild.Locate('FK_SMID', id, []);
end;

procedure TfrmNazRg1.aSetExecute(Sender: TObject);
begin
  if frmMain.odsKab.FieldByName('is_flu').AsInteger = 1 then
    begin
      if frmMain.Update = TRUE then
        DoUpdateNaz
      else
        DoInsertNaz(frmMain.odsKab.FieldByName('fk_id').AsInteger, Date);
      close;
    end else
    begin
      Application.CreateForm(TfrmNazParamRegist, frmNazParamRegist);
      frmNazParamRegist.cbKonsult.Visible := pAmbul = 1;
      frmNazParamRegist.cbKonsult.Enabled := (isKonsult = False) and (frmMain.get_def_konsult <> '-1');
      frmNazParamRegist.cbKonsult.Checked := (isKonsult = True) or (frmMain.get_def_konsult = '-1');
      frmNazParamRegist.DoShowFormParam(odsChild.FieldByName('FK_SMID').AsInteger, pSOTRID, pKABID, pSOTRID);
      frmNazParamRegist.ShowModal;
      if frmNazParamRegist.ModalResult = MrOK then
        begin
          if frmNazParamRegist.cbKonsult.Checked = True then
            isKonsult := True
          else
            isKonsult := False;
          if frmMain.Update = TRUE then
            DoUpdateNaz
          else
            DoInsertNaz(frmNazParamRegist.cxlcRoom.EditValue,
                        StrToDateTime(DateToStr(frmNazParamRegist.cxdeDate.Date)+' '+FormatDateTime('hh:nn', frmNazParamRegist.cxteTime.Time)));
          frmNazParamRegist.Free;
          close;
        end;
    end;
end;

procedure TfrmNazRg1.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVGROUPS.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGrGroup, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGrGroup, TRUE, TRUE);
end;

procedure TfrmNazRg1.aTextMetExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmNazRg1.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVGROUPS.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGrGroup, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGrGroup, TRUE, TRUE);
end;

procedure TfrmNazRg1.aWebMetExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmNazRg1.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVGROUPS.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGrGroup, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGrGroup, TRUE, TRUE);
end;

procedure TfrmNazRg1.aXLSMetExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmNazRg1.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVGROUPS.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGrGroup, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGrGroup, TRUE, TRUE);
end;

procedure TfrmNazRg1.aXMLMetExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmNazRg1.DoInsertNaz(nROOMID : Integer; nDATE : TDateTime);
var oq : TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := frmMain.os;
    oq.Cursor := crSQLWait;
    if frmMain.odsKab.FieldByName('is_flu').AsInteger = 1 then
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' INSERT INTO asu.TNAZIS(FK_SMID, FD_NAZ, FD_RUN, FK_ROOMID, FK_ISPOLID, FK_VRACHID, FK_NAZSOSID, FK_PACID, FC_NAME, FK_NAZTYPEID, FK_NAZOWNER, FC_TYPE) '+
                       ' VALUES(:PFK_SMID, SYSDATE, SYSDATE, :PFK_ROOMID, 0, :PFK_VRACHID, GET_NEVIP, :PFK_PACID, asu.GET_SMIDNAME(:PFK_SMID), asu.GET_NAZPLAN, -1, :PFC_TYPE) '+
                       ' RETURNING FK_ID INTO :PFK_ID ';
        oq.DeclareAndSet('PFK_SMID', otInteger, odsChild.FieldByName('FK_SMID').AsInteger);
        oq.DeclareAndSet('PFK_ROOMID', otInteger, nROOMID);
        oq.DeclareAndSet('PFK_VRACHID', otInteger, pSOTRID);
        oq.DeclareAndSet('PFK_PACID', otInteger, pPACID);
        oq.DeclareAndSet('PFC_TYPE', otString, sDOCID);
        oq.DeclareVariable('PFK_ID', otInteger);
        oq.Execute;
      end else
      begin
        oq.DeleteVariables;
        oq.SQL.Text := ' INSERT INTO asu.TNAZIS(FK_SMID, FD_NAZ, FD_RUN, FK_ROOMID, FK_ISPOLID, FK_VRACHID, FK_NAZSOSID, FK_PACID, FC_NAME, FK_NAZTYPEID, FK_NAZOWNER, FC_TYPE) '+
                       ' VALUES(:PFK_SMID, SYSDATE, :PFD_RUN, :PFK_ROOMID, 0, :PFK_VRACHID, asu.GET_NEVIP, :PFK_PACID, asu.GET_SMIDNAME(:PFK_SMID), asu.GET_NAZPLAN, -1, :PFC_TYPE) '+
                       ' RETURNING FK_ID INTO :PFK_ID ';
        oq.DeclareAndSet('PFK_SMID', otInteger, odsChild.FieldByName('FK_SMID').AsInteger);
        oq.DeclareAndSet('PFD_RUN', otDate, nDATE);
        oq.DeclareAndSet('PFK_ROOMID', otInteger, nROOMID);
        oq.DeclareAndSet('PFK_VRACHID', otInteger, pSOTRID);
        oq.DeclareAndSet('PFK_PACID', otInteger, pPACID);
        oq.DeclareAndSet('PFC_TYPE', otString, sDOCID);
        oq.DeclareVariable('PFK_ID', otInteger);
        oq.Execute;
        DateNaz := nDATE;
      end;

    FDNazID := oq.GetVariable('PFK_ID');
    FDDOCID := sDOCID;
    frmMain.os.Commit;
  finally
    oq.Free;
  end;
end;

procedure TfrmNazRg1.odsGroupsBeforeOpen(DataSet: TDataSet);
begin
  odsGroups.SetVariable('PFK_KABINET', frmMain.odsKab.FieldByName('FK_ID').AsInteger);
  odsGroups.SetVariable('PFK_SOTRID', frmMain.pSOTRID);
end;

procedure TfrmNazRg1.odsGroupsAfterScroll(DataSet: TDataSet);
begin
  odsChild.Close;
  odsChild.SetVariable('PFK_GROUP', odsGroups.FieldByName('FK_ID').AsInteger);
  odsChild.SetVariable('PFK_KABINET', frmMain.odsKab.FieldByName('FK_ID').AsInteger);
  odsChild.SetVariable('PFK_SOTR', pSOTRID);
  odsChild.Open;
  stName.Caption := odsGroups.FieldByName('FC_NAME').AsString;
end;

end.
