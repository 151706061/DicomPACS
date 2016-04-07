// Громут ИП 139169
unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter,
  JvExControls, JvAnimatedImage, JvGIFCtrl, cxControls, cxContainer, cxEdit,
  cxLabel, ExtCtrls, dxBar, ImgList, cxClasses, Menus, ActnList, frxClass,
  frxDBSet, DB, dxmdaset, Oracle, OracleData, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxGridLevel, JclFileUtils,
  cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxGrid, SMMainAPI,
  uGlobalConst, cxSplitter, cxGridExportLink, dxSkinOffice2007Green;

type
  TfrmMain = class(TForm)
    os: TOracleSession;
    dsJournal: TDataSource;
    oqThread: TOracleQuery;
    dxMemData1: TdxMemData;
    dxMemData1FK_ID: TIntegerField;
    dxMemData1FD_RUN: TStringField;
    dxMemData1FIOPAC: TStringField;
    dxMemData1ISSLNAME: TStringField;
    dxMemData1FD_RUN_TIME: TStringField;
    frxDBPrint: TfrxDBDataset;
    frxRepPrint: TfrxReport;
    frxRepProtocol: TfrxReport;
    sdPopUp: TSaveDialog;
    alMain: TActionList;
    aClose: TAction;
    aParam: TAction;
    aPrint: TAction;
    aResult: TAction;
    aRefresh: TAction;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    acEnable: TAction;
    aLaborant: TAction;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    N2: TMenuItem;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbClose: TdxBarButton;
    bbParam: TdxBarButton;
    bbPrint: TdxBarButton;
    bbRefresh: TdxBarButton;
    bbResult: TdxBarButton;
    ilMain: TImageList;
    dxBarDockControl1: TdxBarDockControl;
    paParam: TPanel;
    Splitter1: TSplitter;
    paMainParam: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    lbDateBeg: TcxLabel;
    cxLabel3: TcxLabel;
    lbDateEnd: TcxLabel;
    paSubParam: TPanel;
    Animator1: TJvGIFAnimator;
    cxLabel6: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel4: TcxLabel;
    cxGr: TcxGrid;
    TV: TcxGridTableView;
    VFD_RUN: TcxGridColumn;
    VNAME: TcxGridColumn;
    VFIOPAC: TcxGridColumn;
    VFK_ID: TcxGridColumn;
    VFD_ROJD: TcxGridColumn;
    VFK_NAZSOSID: TcxGridColumn;
    VFD_RUN_TIME: TcxGridColumn;
    cxGrLevel1: TcxGridLevel;
    lbAgeStart: TcxLabel;
    cxLabel8: TcxLabel;
    lbAgeEnd: TcxLabel;
    VNUM: TcxGridColumn;
    VAGE: TcxGridColumn;
    VREGION: TcxGridColumn;
    VNATIONAL: TcxGridColumn;
    dxMemData1FK_NAZSOSID: TIntegerField;
    dxMemData1AGE: TIntegerField;
    dxMemData1REGIONAL: TStringField;
    dxMemData1NUMBER_ISSL: TStringField;
    dxMemData1NATIONALITY: TStringField;
    cxSplitter1: TcxSplitter;
    dxMemData1FD_ROJD: TDateField;
    cxLabel7: TcxLabel;
    cxLabel9: TcxLabel;
    lbProj: TcxLabel;
    lbNat: TcxLabel;
    VDOZA: TcxGridColumn;
    dxMemData1DOZA: TFloatField;
    VMED: TcxGridColumn;
    dxMemData1MEDRAB: TStringField;
    cxLabel10: TcxLabel;
    lbWork: TcxLabel;
    cxLabel11: TcxLabel;
    lbUch: TcxLabel;
    dxMemData1uch: TStringField;
    VUCH: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure aParamExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure aResultExecute(Sender: TObject);
    procedure frxRepProtocolGetValue(const VarName: string; var Value: Variant);
    procedure aPrintExecute(Sender: TObject);
    procedure frxRepPrintGetValue(const VarName: string; var Value: Variant);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
  private
    pAPPSOTRID : Integer;
    sVrachFIO, sCompanyName, sOtdelName, MedotradeSign, sSotrFIO_4rep, sTextIssl_4rep, sNumIB_4rep, sDateSys_4Rep : string;
    sParams : string;
    dSysDate, dDateBegin, dDateEnd : TDateTime;
    procedure CheckEnabledButtons;
    { Private declarations }
  public
    pSOTRID : Integer;
    procedure DoShowForm;
    { Public declarations }
  end;
const
  sqlStr =  ' SELECT FK_ID, '+#13+
            '        FD_RUN, -- дата вып. '+#13+
            '        TO_CHAR(FD_RUN, ''DD.MM.YYYY HH24:MI'') AS FD_RUN_TIME, '+#13+
            '        FK_NAZSOSID, '+#13+
            '        ASU.GET_NAME_RGISSL(FK_SMID) AS FC_NAME, -- Наименование исследования '+#13+
            '        ASU.PKG_REGIST_PACFUNC.GET_PAC_FIO(FK_PACID) FIOPAC, --ФИО '+#13+
            '        (SELECT trunc(FD_ROJD) FROM ASU.TPEOPLES WHERE FK_ID = (SELECT FK_PEPLID FROM ASU.TKARTA WHERE FK_ID = TNAZIS.FK_PACID '+#13+
            '                                                         UNION ALL '+#13+
            '                                                         SELECT FK_PEPLID FROM ASU.TAMBULANCE WHERE FK_ID = TNAZIS.FK_PACID)) FD_ROJD, --Дата рожд. '+#13+
            '        ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TNAZIS.FK_PACID) AS AGE, -- возраст '+#13+
            '        (SELECT ASU.GET_SMIDNAME(max(FK_SMID)) '+#13+
            '           FROM ASU.TIB '+#13+
            '          WHERE FK_PACID = TNAZIS.FK_PACID '+#13+
            '            AND (FK_SMID IN (SELECT FK_ID '+#13+
            '                               FROM ASU.TSMID '+#13+
            '                              WHERE FK_OWNER = (SELECT MAX(FK_ID) '+#13+
            '                                                  FROM ASU.TSMID '+#13+
            '                                                 WHERE FC_SYNONIM = ''PD_MZ'')) '+#13+
            '             OR FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''LIVEIN_SELO''))) AS REGIONAL, -- Проживает '+#13+
            '        (SELECT MAX(FC_CHAR) '+#13+
            '           FROM ASU.TIB '+#13+
            '          WHERE FK_PACID = TNAZIS.FK_ID '+#13+
            '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''NUMBER_ISSL'' OR FC_SYNONIM = ''XRAY_FLU_NUMBER'')) AS NUMBER_ISSL, -- Номер исследования '+#13+
            '        (SELECT ASU.GET_SMIDNAME(max(FK_SMID)) '+#13+
            '           FROM ASU.TIB '+#13+
            '          WHERE FK_PACID = ASU.GET_PEPLID(TNAZIS.FK_PACID) '+#13+
            '            AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''LD_NAROD'')) ) AS NATIONALITY, -- Национальность '+#13+
            '        (SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA, '+#13+
            '        decode((select 1 from asu.tpeplid_med where fk_peplid = asu.get_peplid(tnazis.fk_pacid)), null, '''', 1, ''ДА'') as medrab, '+#13+
            '        asu.get_area_for_xray(asu.get_peplid(tnazis.fk_pacid)) as uch '+#13+
            '   FROM ASU.TNAZIS '+#13+
            '  WHERE FD_RUN >= :PFD_DATE1 '+#13+
            '    AND FD_RUN <= :PFD_DATE2 '+#13+
            '    AND FK_NAZSOSID = ASU.GET_VIPNAZ '+#13+
            '    AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = ASU.GET_XRAY_FLU) ';

var
  frmMain: TfrmMain;
  StartTime: TTime;
  bbr : Boolean;  

implementation

uses fSetParam;

{$R *.dfm}

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.aParamExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSetParam, frmSetParam);
  try
    if cxSplitter1.Visible = True then
      begin
        frmSetParam.cxDateBeg.Date := StrToDateTime(lbDateBeg.Caption);
        frmSetParam.cxDateEnd.Date := StrToDateTime(lbDateEnd.Caption);
      end else
      begin
        frmSetParam.cxDateBeg.Date := dSysDate;
        frmSetParam.cxDateEnd.Date := dSysDate;
      end;
    frmSetParam.ShowModal;
    if frmSetParam.ModalResult = mrOK then
      begin
        bbr := False;
        aRefresh.Enabled := False;
        aParam.Enabled := False;
        aResult.Enabled := False;
        aPrint.Enabled := False;

        cxLabel6.Caption := '';
        cxLabel5.Caption := '';
        cxLabel4.Caption := 'Выполняется запрос к Базе Данных...';

        if TV.DataController.LockCount = 0 then
          TV.BeginUpdate;
        TV.DataController.RecordCount := 0;
        while TV.DataController.LockCount > 0 do
          TV.EndUpdate;
        cxGr.Refresh;
        dxMemData1.Close;
        dxMemData1.Open;
        dDateBegin := frmSetParam.cxDateBeg.Date;
        dDateEnd := StrToDateTime(FormatDateTime('dd.mm.yyyy', frmSetParam.cxDateEnd.Date)+' 23:59:59');
        lbDateBeg.Caption := DateTimeToStr(frmSetParam.cxDateBeg.Date);
        lbDateEnd.Caption := DateTimeToStr(Trunc(frmSetParam.cxDateEnd.Date));
        if (frmSetParam.seAgeStart.EditValue = 0) and (frmSetParam.seAgeEnd.EditValue = 0) then
          begin
            cxLabel1.Visible := False;
            lbAgeStart.Visible := False;
            cxLabel8.Visible := False;
            lbAgeEnd.Visible := False;
          end else
          begin
            cxLabel1.Visible := True;
            lbAgeStart.Visible := True;
            cxLabel8.Visible := True;
            lbAgeEnd.Visible := True;
          end;
        lbAgeStart.Caption := IntToStr(frmSetParam.seAgeStart.EditValue);
        lbAgeEnd.Caption := IntToStr(frmSetParam.seAgeEnd.EditValue);
        lbProj.Visible := (frmSetParam.cxProj.EditValue <> 0) and (frmSetParam.cxProj.EditValue <> null);
        lbNat.Visible := (frmSetParam.cxNational.EditValue <> 0) and (frmSetParam.cxNational.EditValue <> null);
        cxLabel7.Visible := (frmSetParam.cxNational.EditValue <> 0) and (frmSetParam.cxNational.EditValue <> null);
        cxLabel9.Visible := (frmSetParam.cxProj.EditValue <> 0) and (frmSetParam.cxProj.EditValue <> null);
        lbProj.Caption := frmSetParam.cxProj.Text;
        if frmSetParam.cxProj.EditValue <> null then
          lbProj.Tag := frmSetParam.cxProj.EditValue;
        lbNat.Caption := frmSetParam.cxNational.Text;
        if frmSetParam.cxNational.EditValue <> null then
          lbNat.Tag := frmSetParam.cxNational.EditValue;
//-- Место работы
        lbWork.Visible := frmSetParam.beWork.Tag <> 0;
        cxLabel10.Visible := lbWork.Visible;
        lbWork.Tag := frmSetParam.beWork.Tag;
        lbWork.Caption := frmSetParam.beWork.Text;
//-- Участок
        lbUch.Visible := frmSetParam.beUch.Tag <> 0;
        cxLabel11.Visible := lbUch.Visible;
        lbUch.Tag := frmSetParam.beUch.Tag;
        lbUch.Caption := frmSetParam.beUch.Text;

        paParam.Visible := True;
        paSubParam.Visible := True;
        cxSplitter1.Visible := True;
        StartTime:= Now;
        cxLabel6.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
        cxLabel6.Refresh;
        oqThread.Scrollable := True;
        Animator1.Animate := True;

        oqThread.DeleteVariables;
        oqThread.SQL.Text := sqlStr;
        if lbAgeStart.Visible = True then
          begin
            oqThread.SQL.Add(' AND ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TNAZIS.FK_PACID) >= :PAGE1 AND ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TNAZIS.FK_PACID) <= :PAGE2');
            oqThread.DeclareAndSet('PAGE1', otInteger, StrToInt(lbAgeStart.Caption));
            oqThread.DeclareAndSet('PAGE2', otInteger, StrToInt(lbAgeEnd.Caption));
          end;
        if lbProj.Visible = True then
          begin
            oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_PACID AND FK_SMID = :PFK_SMID)');
            oqThread.DeclareAndSet('PFK_SMID', otInteger, lbProj.Tag);
          end;
        if lbNat.Visible = True then
          begin
            oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = ASU.GET_PEPLID(TNAZIS.FK_PACID) AND FK_SMID = :PFK_SMID1)');
            oqThread.DeclareAndSet('PFK_SMID1', otInteger, lbNat.Tag);
          end;
        if lbWork.Visible = True then
          begin
            oqThread.SQL.Add(' AND (SELECT FK_COMPANYID FROM ASU.TPEOPLES WHERE FK_ID = ASU.GET_PEPLID(TNAZIS.FK_PACID)) = :PWORK ');
            oqThread.DeclareAndSet('PWORK', otInteger, lbWork.Tag);
          end;
        if lbUch.Visible = True then
          begin
            oqThread.SQL.Add(' and exists (select 1 from asu.tdistrict_pacient where fk_peplid = ASU.GET_PEPLID(TNAZIS.FK_PACID) and fk_arealid = :pfk_arealid) ');
            oqThread.DeclareAndSet('pfk_arealid', otInteger, lbUch.Tag);
          end;
        oqThread.SQL.Add(' ORDER BY FIOPAC ');  
        oqThread.DeclareAndSet('PFD_DATE1', otDate, dDateBegin);
        oqThread.DeclareAndSet('PFD_DATE2', otDate, dDateEnd);
        oqThread.Execute;
      end;
  finally
    frmSetParam.Free;
  end;
end;

procedure TfrmMain.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS DATESYS FROM DUAL ';
    ods.Open;
    sDateSys_4Rep := ods.FieldByName('DATESYS').AsString;
  finally
    ods.Free;
  end;
  sParams := '';
  if lbAgeStart.Visible = True then
    sParams := sParams + 'Возраст с: '+lbAgeStart.Caption+' по: '+lbAgeEnd.Caption+' лет; ';
  if lbProj.Visible = True then
    sParams := sParams + 'Проживает: '+lbProj.Caption+'; ';
  if lbNat.Visible = True then
    sParams := sParams + 'Национальность: '+lbNat.Caption+'; ';
  if lbWork.Visible = True then
    sParams := sParams + 'Место работы: '+lbWork.Caption+'; ';
  if lbUch.Visible = True then
    sParams := sParams + 'Участок: '+lbUch.Caption+'; ';
  frxRepPrint.FindObject('Memo19').Visible := sParams <> '';
  frxRepPrint.FindObject('Memo23').Visible := sParams <> '';
  frxRepPrint.ShowReport;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin
  aRefresh.Enabled := False;
  aParam.Enabled := False;
  aResult.Enabled := False;
  aPrint.Enabled := False;

  cxLabel4.Caption := 'Выполняется запрос к Базе Данных...';
  if TV.DataController.LockCount = 0 then
    TV.BeginUpdate;
  TV.DataController.RecordCount := 0;
  while TV.DataController.LockCount > 0 do
    TV.EndUpdate;
  cxGr.Refresh;
  dxMemData1.Close;
  dxMemData1.Open;
  StartTime:= Now;
  oqThread.Scrollable := True;
  Animator1.Animate := True;

  oqThread.DeleteVariables;
  oqThread.SQL.Text := sqlStr;
  if lbAgeStart.Visible = True then
    begin
      oqThread.SQL.Add(' AND ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TNAZIS.FK_PACID) >= :PAGE1 AND ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(TNAZIS.FK_PACID) <= :PAGE2');
      oqThread.DeclareAndSet('PAGE1', otInteger, StrToInt(lbAgeStart.Caption));
      oqThread.DeclareAndSet('PAGE2', otInteger, StrToInt(lbAgeEnd.Caption));
    end;
  if lbProj.Visible = True then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_PACID AND FK_SMID = :PFK_SMID)');
      oqThread.DeclareAndSet('PFK_SMID', otInteger, lbProj.Tag);
    end;
  if lbNat.Visible = True then
    begin
      oqThread.SQL.Add(' AND EXISTS (SELECT 1 FROM ASU.TIB WHERE FK_PACID = ASU.GET_PEPLID(TNAZIS.FK_PACID) AND FK_SMID = :PFK_SMID1)');
      oqThread.DeclareAndSet('PFK_SMID1', otInteger, lbNat.Tag);
    end;
  if lbWork.Visible = True then
    begin
      oqThread.SQL.Add(' AND (SELECT FK_COMPANYID FROM ASU.TPEOPLES WHERE FK_ID = ASU.GET_PEPLID(TNAZIS.FK_PACID)) = :PWORK ');
      oqThread.DeclareAndSet('PWORK', otInteger, lbWork.Tag);
    end;
  if lbUch.Visible = True then
    begin
      oqThread.SQL.Add(' AND (SELECT max(t2.FK_ID) FROM ASU.TDISTRICT_PACIENT t1, asu.tdistrict_name t2 WHERE t1.fk_arealid = t2.fk_id '+' and t1.FK_PEPLID = ASU.GET_PEPLID(TNAZIS.FK_PACID) AND t2.FK_TYPEID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''THERAPIST_AREA'')) = :PFK_DISTRICT ');
      oqThread.DeclareAndSet('PFK_DISTRICT', otInteger, lbUch.Tag);
    end;
  oqThread.DeclareAndSet('PFD_DATE1', otDate, dDateBegin);
  oqThread.DeclareAndSet('PFD_DATE2', otDate, dDateEnd);
  oqThread.Execute;
end;

procedure TfrmMain.aResultExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_ID, '+
                    '        ASU.DO_VRACHFIO(FK_ISPOLID) AS VRACHFIO, '+
                    '        (SELECT FB_TEXT FROM ASU.TRICHVIEWDATA WHERE FK_PACID = TNAZIS.FK_ID) AS TEXTISSL, '+
                    '        ASU.GET_IB(FK_PACID) AS NUMIB '+
                    '   FROM TNAZIS '+
                    '  WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFK_ID.Index]);
    ods.Open;
    sSotrFIO_4rep := ods.FieldByName('VRACHFIO').AsString;
    sTextIssl_4rep := ods.FieldByName('TEXTISSL').AsString;
    sNumIB_4rep := ods.FieldByName('NUMIB').AsString;
  finally
    ods.Free;
  end;
  frxRepProtocol.ShowReport;
end;

procedure TfrmMain.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.CheckEnabledButtons;
begin
  aResult.Enabled := oqThread.RowCount <> 0;
  aPrint.Enabled := oqThread.RowCount <> 0;
end;

procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  pAPPSOTRID := StrToInt(paramstr(1));
  ods := TOracleDataSet.Create(nil);
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_SOTRID, ASU.DO_VRACHFIO(FK_SOTRID) AS VRACHFIO, TRUNC(SYSDATE) AS DATESYS, '+#13+
                    '        ASU.PKG_SMINI.READSTRING (''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME, '+#13+
                    '        (SELECT FC_NAME FROM ASU.TOTDEL WHERE FK_ID = (SELECT FK_OTDID FROM ASU.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME '+#13+
                    '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    sVrachFIO := ods.FieldByName('VRACHFIO').AsString;
    dSysDate := ods.FieldByName('DATESYS').AsDateTime;
    sCompanyName := ods.FieldByName('COMPANYNAME').AsString;
    frmMain.Caption := 'Отчет по флюорографии('+Ver.FileVersion+'). Пользователь: '+sVrachFIO;
    sOtdelName := ods.FieldByName('OTDELNAME').AsString;
  finally
    ods.Free;
    Ver.Free;
  end;
  aResult.Enabled := False;
  aPrint.Enabled := False;
  MedotradeSign := ReadMedotradeSign;
  TV.StoreToRegistry('\SoftWare\SoftMaster\Xray_flu_age\fMain\TVVrach_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'TV');
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\Xray_flu_age\fMain\TVVrach_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'TV');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из приложения ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    begin
      oqThread.BreakThread;
      action := caFree;
    end else
    begin
      action := caNone;
    end;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TV.StoreToRegistry('\SoftWare\SoftMaster\Xray_flu_age\fMain\TVVrach_' + IntToStr(pSOTRID), TRUE, [], 'TV');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
end;

procedure TfrmMain.frxRepPrintGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName;
  if VarName = 'OTDELNAME' then Value := sOtdelName;
  if VarName = 'VSEGO' then Value := oqThread.RowCount;
  if VarName = 'SYSDATE' then Value := sDateSys_4Rep;
  if VarName = 'SOTRNAME' then Value := sVrachFIO;
  if VarName = 'DATE1' then Value := dDateBegin;
  if VarName = 'DATE2' then Value := DateTimeToStr(Trunc(dDateEnd));
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
  if VarName = 'PARAMS' then Value := sParams;
end;

procedure TfrmMain.frxRepProtocolGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName;
  if VarName = 'OTDELNAME' then Value := sOtdelName;
  if VarName = 'PACFIO' then Value := TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFIOPAC.Index];
  if VarName = 'DATE_ROJD' then Value := TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFD_ROJD.Index];
  if VarName = 'NUMIB' then Value := sNumIB_4rep;
  if VarName = 'NAMEISSL' then Value := TV.DataController.Values[TV.DataController.FocusedRecordIndex, VNAME.Index];
  if VarName = 'DOZA' then Value := TV.DataController.Values[TV.DataController.FocusedRecordIndex, VDOZA.Index];
  if VarName = 'DATEISSL' then Value := TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFD_RUN_TIME.Index];
  if VarName = 'TEXTISSL' then Value := sTextIssl_4rep;
  if VarName = 'NUMISSL' then Value := TV.DataController.Values[TV.DataController.FocusedRecordIndex, VNUM.Index];
  if VarName = 'SOTR' then Value := sSotrFIO_4rep;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\Xray_flu_age\fMain\TVVrach_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TV');
end;

procedure TfrmMain.oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
  const ErrorMessage: string);
begin
  MessageDlg('Во время выполнения запроса произошла ошибка! Обратитесь к администратору системы!'+
             #13#10+'Код ошибки: '+IntToStr(ErrorCode)+
             #13#10+'Текст ошибки: '+ErrorMessage,
             mtError, [mbOK], 0);
  bbr := True; 
end;

procedure TfrmMain.oqThreadThreadFinished(Sender: TOracleQuery);
begin
  acEnable.Execute;
  Animator1.Animate := False;
  if bbr then
    cxLabel4.Caption := 'При выполнении запроса произошла ошибка!'
  else
    cxLabel4.Caption := 'Запрос к Базе Данных выполнился успешно!';

  aResult.Enabled := True;
  aPrint.Enabled := True;
  aRefresh.Enabled := True;
  aParam.Enabled := True;

  CheckEnabledButtons;
end;

procedure TfrmMain.oqThreadThreadRecord(Sender: TOracleQuery);
begin
  TV.BeginUpdate;
  TV.DataController.RecordCount := TV.DataController.RecordCount + 1;
  with TV.DataController do
  begin
    try
      Values[TV.DataController.RecordCount - 1, VFK_ID.Index] := Sender.Field('FK_ID');
      Values[TV.DataController.RecordCount - 1, VFD_RUN.Index] := Sender.Field('FD_RUN');
      Values[TV.DataController.RecordCount - 1, VFIOPAC.Index] := Sender.Field('FIOPAC');
      Values[TV.DataController.RecordCount - 1, VNAME.Index] := Sender.Field('FC_NAME');
      Values[TV.DataController.RecordCount - 1, VFD_ROJD.Index] := Sender.Field('FD_ROJD');
      Values[TV.DataController.RecordCount - 1, VFK_NAZSOSID.Index] := Sender.Field('FK_NAZSOSID');
      Values[TV.DataController.RecordCount - 1, VFD_RUN_TIME.Index] := Sender.Field('FD_RUN_TIME');
      Values[TV.DataController.RecordCount - 1, VAGE.Index] := Sender.Field('AGE');
      Values[TV.DataController.RecordCount - 1, VREGION.Index] := Sender.Field('REGIONAL');
      Values[TV.DataController.RecordCount - 1, VNUM.Index] := Sender.Field('NUMBER_ISSL');
      Values[TV.DataController.RecordCount - 1, VNATIONAL.Index] := Sender.Field('NATIONALITY');
      Values[TV.DataController.RecordCount - 1, VDOZA.Index] := Sender.Field('DOZA');
      Values[TV.DataController.RecordCount - 1, VMED.Index] := Sender.Field('MEDRAB');
      Values[TV.DataController.RecordCount - 1, VUCH.Index] := Sender.Field('UCH');
      dxMemData1.Insert;
      dxMemData1.FieldByName('FD_RUN').AsString := Sender.Field('FD_RUN_TIME');
      dxMemData1.FieldByName('FIOPAC').AsString := Sender.Field('FIOPAC');
      dxMemData1.FieldByName('ISSLNAME').AsString := Sender.Field('FC_NAME');
      dxMemData1.FieldByName('FD_ROJD').AsString := Sender.Field('FD_ROJD');
      dxMemData1.FieldByName('AGE').AsString := Sender.Field('AGE');
      dxMemData1.FieldByName('REGIONAL').AsString := Sender.Field('REGIONAL');
      dxMemData1.FieldByName('NUMBER_ISSL').AsString := Sender.Field('NUMBER_ISSL');
      dxMemData1.FieldByName('NATIONALITY').AsString := Sender.Field('NATIONALITY');
      dxMemData1.FieldByName('DOZA').AsString := Sender.Field('DOZA');
      dxMemData1.FieldByName('MEDRAB').AsString := Sender.Field('medrab');
      dxMemData1.FieldByName('UCH').AsString := Sender.Field('UCH');
      dxMemData1.Post;
      dxMemData1.Next;
    finally
    end;
  end;
  TV.EndUpdate;
  cxLabel6.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel6.Refresh;
  cxLabel5.Caption := 'Выбрано ' + IntToStr(TV.DataController.RecordCount) + ' записей.';
  cxLabel5.Refresh;
end;

end.
