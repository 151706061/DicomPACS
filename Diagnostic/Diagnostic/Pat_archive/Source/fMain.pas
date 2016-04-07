// iii - cxTextEdit в uses нужен для vsNormal, vsHideCursor
unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, cxStyles, cxGraphics, cxEdit,
  cxSplitter, cxInplaceContainer, cxVGrid, cxControls, cxContainer, cxLabel,
  JvExControls, JvAnimatedImage, JvGIFCtrl, ExtCtrls, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, dxBar, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView, cxGrid,
  dxSkinsdxBarPainter, ImgList, ActnList, Oracle, SMMainAPI, cxDBLookupComboBox,
  DB, OracleData, cxCalendar, JclFileUtils, dxmdaset, cxButtonEdit,
  cxDropDownEdit, cxTextEdit, Menus, frxClass, frxDBSet,
  uGlobalConst, cxGridExportLink, Registry, jpeg, word2000, uReportUtils,
  cxCheckBox, Medotrade, cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    paSubParam: TPanel;
    Animator1: TJvGIFAnimator;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    vGr: TcxVerticalGrid;
    cxSplitter1: TcxSplitter;
    paMain: TPanel;
    cxGr: TcxGrid;
    VIEW: TcxGridTableView;
    VIEW_FK_ID: TcxGridColumn;
    VIEW_PACID: TcxGridColumn;
    VIEW_FD_NAZ: TcxGridColumn;
    VIEW_FD_RUN: TcxGridColumn;
    VIEW_NUMMK: TcxGridColumn;
    VIEW_PACFIO: TcxGridColumn;
    VIEW_NAMEISSL: TcxGridColumn;
    VIEW_VRACH: TcxGridColumn;
    VIEW_PEPLID: TcxGridColumn;
    VIEW_OTDEL: TcxGridColumn;
    VIEWNUM: TcxGridColumn;
    cxGrLevel1: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    cxSplitter2: TcxSplitter;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbClose: TdxBarButton;
    al: TActionList;
    il: TImageList;
    os: TOracleSession;
    aClose: TAction;
    oqThread: TOracleQuery;
    catParams: TcxCategoryRow;
    rowStatus: TcxEditorRow;
    odsMain: TOracleDataSet;
    dsMain: TDataSource;
    rowPeriodFrom: TcxEditorRow;
    rowPeriodTo: TcxEditorRow;
    ilSmall: TcxImageList;
    rowKab: TcxEditorRow;
    odsKab: TOracleDataSet;
    dsKab: TDataSource;
    bbRefresh: TdxBarButton;
    aRefresh: TAction;
    memData: TdxMemData;
    memDataFK_ID: TIntegerField;
    memDataFK_PACID: TIntegerField;
    memDataFD_NAZ_STR: TStringField;
    memDataFD_RUN_STR: TStringField;
    memDataFIOPAC: TStringField;
    memDataNAMEISSL: TStringField;
    memDataVRACHFIO: TStringField;
    memDataNUMMK: TStringField;
    memDataPEPLID: TIntegerField;
    memDataOTDEL: TStringField;
    memDataNUMBER_ISSL: TStringField;
    rowVrach: TcxEditorRow;
    rowPac: TcxEditorRow;
    rowSex: TcxEditorRow;
    odsSotr: TOracleDataSet;
    dsSotr: TDataSource;
    rowTypePac: TcxEditorRow;
    catDop: TcxCategoryRow;
    rowUrg: TcxEditorRow;
    odsTypeNaz: TOracleDataSet;
    dsTypeNaz: TDataSource;
    rowOpl: TcxEditorRow;
    rowKor: TcxEditorRow;
    rowProj: TcxEditorRow;
    odsKorennoe: TOracleDataSet;
    dsKorennoe: TDataSource;
    dsRegPrin: TDataSource;
    odsRegPrin: TOracleDataSet;
    odsVidOplat: TOracleDataSet;
    dsVidOplat: TDataSource;
    pm: TPopupMenu;
    N1: TMenuItem;
    stRep: TcxStyleRepository;
    stNormal: TcxStyle;
    stBold: TcxStyle;
    cxStyle1: TcxStyle;
    rowIssl: TcxEditorRow;
    VIEWKOLVO: TcxGridColumn;
    memDataKOLVO: TIntegerField;
    rowMat: TcxEditorRow;
    VIEWKOLMAT: TcxGridColumn;
    memDataKOLVOFR: TIntegerField;
    rowKem: TcxEditorRow;
    rowOtdel: TcxEditorRow;
    vOtdel: TcxGridColumn;
    bbPrint: TdxBarButton;
    aPrint: TAction;
    frList: TfrxReport;
    frDBList: TfrxDBDataset;
    vSotr: TcxGridColumn;
    memDataotdelname: TStringField;
    memDatavrach: TStringField;
    memDatafd_run: TDateField;
    pmVIEW: TPopupMenu;
    MenuItem1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    Excel1: TMenuItem;
    N3: TMenuItem;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    sdPopUp: TSaveDialog;
    rowOsob: TcxEditorRow;
    rowNumGlass: TcxEditorRow;
    aProtocol: TAction;
    bbProtocol: TdxBarButton;
    rowPat: TcxEditorRow;
    VIEWZAKL: TcxGridColumn;
    memDatazakl: TStringField;
    memDatarojdpac: TDateField;
    frListNT: TfrxReport;
    memDataadr: TStringField;
    memDatafd_mat: TStringField;
    rowDates: TcxEditorRow;
    bbOpenMK: TdxBarButton;
    aOpenMK: TAction;
    tmrCheckApplication: TTimer;
    rowArea: TcxEditorRow;
    grtvcOsob: TcxGridColumn;
    memDataosob: TStringField;
    bCancel: TcxButton;
    aBreak: TAction;
    procedure FormCreate(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure odsKabBeforeOpen(DataSet: TDataSet);
    procedure aRefreshExecute(Sender: TObject);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure odsSotrBeforeOpen(DataSet: TDataSet);
    procedure rowPacEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure N1Click(Sender: TObject);
    procedure rowOplEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowProjEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowUrgEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowKorEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowTypePacEditPropertiesEditValueChanged(Sender: TObject);
    procedure rowIsslEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowMatEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowKemEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowOtdelEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure aPrintExecute(Sender: TObject);
    procedure frListGetValue(const VarName: string; var Value: Variant);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N3Click(Sender: TObject);
    procedure rowOsobEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure aProtocolExecute(Sender: TObject);
    procedure vGrEditorRow1EditPropertiesEditValueChanged(Sender: TObject);
    procedure frListNTGetValue(const VarName: string; var Value: Variant);
    procedure aOpenMKExecute(Sender: TObject);
    procedure tmrCheckApplicationTimer(Sender: TObject);
    procedure rowAreaEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure aBreakExecute(Sender: TObject);
  private
    nRec : Integer;
    pAPPSOTRID, pOTDELID, get_vipnaz, get_labvip, get_nevip : Integer;
    sOtdelName_4Rep, sSotrFIO, sSpec, DateSys_4Rep, sCompanyName_4Rep, MedotradeSign, sParams, get_dbname : string;
    dDateBegin, dDateEnd : TDateTime;
    StartTime: TTime;
    bbr, bThreadIsBreaked : Boolean;
    strID, strName : string;
    arFIO:array of string;
    FArrHarMaterial : array of integer;
    procedure DoResult(nNazID: Integer);
    procedure BmpToJPEG(pFNAME1, pFNAME2 : String);
    function PhysicalResolveFileType(AStream: TStream): Integer;
    procedure DoWordProcess(path : String; FormatPr: Integer = 0; bLandscape: Boolean = false);
    function RestoreApplication(AAppCaption:string):Boolean;
    { Private declarations }
  public
    pSOTRID : Integer;
    Russian : HKL;
    procedure DoShowForm;
    { Public declarations }
  end;

const
// -- по дате выполнения
  sqlList = ' SELECT FK_ID, '+#13+
            '        FK_PACID, '+#13+
            '        FK_NAZSOSID, '+#13+
            '        FC_NAME||'' ''||ASU.PKG_NAZ.GET_NAZPARAM(FK_ID) AS NAMEISSL, '+#13+
            '        FC_TYPE AS NUMBER_ISSL, '+#13+
            '        ASU.GET_IB(TNAZIS.FK_PACID) AS NUMMK, '+#13+
            '        FD_NAZ, TO_CHAR(FD_NAZ, ''DD.MM.YYYY HH24:MI'') AS FD_NAZ_STR, '+#13+
            '        FD_RUN, TO_CHAR(FD_RUN, ''DD.MM.YYYY HH24:MI'') AS FD_RUN_STR, '+#13+
            '        ASU.PKG_REGIST_PACFUNC.GET_PAC_FIO(FK_PACID) AS FIOPAC, '+#13+
            '        ASU.PKG_REGIST_PACFUNC.GET_PAC_BITH(FK_PACID) AS ROJDPAC, '+#13+
            '        asu.get_adr_by_peplid_level_street(asu.get_peplid(fk_pacid), 1) as adres, '+#13+
            '        ASU.DO_VRACHFIO(TNAZIS.FK_ISPOLID) AS VRACHFIO, '+#13+
            '        ASU.GET_PEPLID(FK_PACID) AS PEPLID, '+#13+
            '        (select fc_char from asu.tib '+#13+
            '          where fk_pacid = tnazis.fk_id '+#13+
            '            and fk_smid in (select fk_id from asu.tsmid '+#13+
            '                            start with fc_synonim = ''PD_NAPRAVIV_YCH'' connect by prior fk_id = fk_owner)) as otdel, '+#13+
            '        asu.get_vrachfcotdel(tnazis.fk_vrachid) as otdelname, '+#13+
            '        asu.do_vrachfio(tnazis.fk_vrachid) as vrach, '+#13+
            '        (select sum(fn_num) from asu.tib '+#13+
            '          where fk_pacid = tnazis.fk_id '+#13+
            '            and fk_smid in (select fk_id from asu.tsmid '+#13+
            '                             where fc_synonim in (''MARK1_KOLVOFR'', ''MARK2_KOLVOFR'', ''MARK3_KOLVOFR'', ''MARK4_KOLVOFR'', ''MARK5_KOLVOFR''))) as kolvo, '+#13+
            '        asu.get_kolvo_fragmentov(:psmid, tnazis.fk_id) as kolvofr,  '+#13+
            '        asu.get_issl_zakl(fk_id)/*(select fc_char from asu.tib where fk_pacid = tnazis.fk_id and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''ZAKL_PATANATOM'') '+#13+
            '         union all '+#13+
            '         select asu.get_smidname(fk_smid) from asu.tib where fk_pacid = tnazis.fk_id and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ZAKL_CITOLOG'') '+#13+
            '         union all '+#13+
            '         select fc_result from asu.thistology where fk_nazid = tnazis.fk_id)*/ as zakl, '+#13+
            '        (select to_char(fd_date, ''dd.mm.yyyy hh24:mi'') from asu.tib where fk_pacid = tnazis.fk_id and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''DATEIN_PATANATOM'')) as fd_mat, '+#13+
            '        (select sys_xmlagg(xmlelement(col, fc_char ||'';'')).extract(''/ROWSET/COL/text()'').getstringval() from asu.tib where fk_pacid = TNAZIS.fk_id ' + #13 +
            '         and fk_smid in (select fk_id from asu.tsmid where fc_synonim like ''MARK%_OSOB'')) osob ' + #13 +
            '   FROM ASU.TNAZIS '+#13+
            '  WHERE FD_RUN >= :PDATE1 '+#13+
            '    AND FD_RUN <= :PDATE2 '+#13+
            '    AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+#13+
            '                     WHERE FL_SHOWANAL = 1 '+#13+
            '                    START WITH FC_SYNONIM in (''ISL_PATANATOM'', ''I_CITOLOG'', ''I_IMM_GIST'') '+#13+
            '                    CONNECT BY PRIOR FK_ID = FK_OWNER) ';
// -- по дате поступления материала
  sqlMat = ' SELECT FK_ID, '+#13+
           '        FK_PACID, '+#13+
           '        FK_NAZSOSID, '+#13+
           '        FC_NAME||'' ''||ASU.PKG_NAZ.GET_NAZPARAM(FK_ID) AS NAMEISSL, '+#13+
           '        FC_TYPE AS NUMBER_ISSL, '+#13+
           '        ASU.GET_IB(TNAZIS.FK_PACID) AS NUMMK, '+#13+
           '        FD_NAZ, TO_CHAR(FD_NAZ, ''DD.MM.YYYY HH24:MI'') AS FD_NAZ_STR, '+#13+
           '        FD_RUN, TO_CHAR(FD_RUN, ''DD.MM.YYYY HH24:MI'') AS FD_RUN_STR, '+#13+
           '        ASU.PKG_REGIST_PACFUNC.GET_PAC_FIO(FK_PACID) AS FIOPAC, '+#13+
           '        ASU.PKG_REGIST_PACFUNC.GET_PAC_BITH(FK_PACID) AS ROJDPAC, '+#13+
           '        asu.get_adr_by_peplid_level_street(asu.get_peplid(fk_pacid), 1) as adres, '+#13+
           '        ASU.DO_VRACHFIO(TNAZIS.FK_ISPOLID) AS VRACHFIO, '+#13+
           '        ASU.GET_PEPLID(FK_PACID) AS PEPLID, '+#13+
           '        (select fc_char from asu.tib '+#13+
           '          where fk_pacid = tnazis.fk_id '+#13+
           '            and fk_smid in (select fk_id from asu.tsmid '+#13+
           '                            start with fc_synonim = ''PD_NAPRAVIV_YCH'' connect by prior fk_id = fk_owner)) as otdel, '+#13+
           '        asu.get_vrachfcotdel(tnazis.fk_vrachid) as otdelname, '+#13+
           '        asu.do_vrachfio(tnazis.fk_vrachid) as vrach, '+#13+
           '        (select sum(fn_num) from asu.tib '+#13+
           '          where fk_pacid = tnazis.fk_id '+#13+
           '            and fk_smid in (select fk_id from asu.tsmid '+#13+
           '                             where fc_synonim in (''MARK1_KOLVOFR'', ''MARK2_KOLVOFR'', ''MARK3_KOLVOFR'', ''MARK4_KOLVOFR'', ''MARK5_KOLVOFR''))) as kolvo, '+#13+
           '        asu.get_kolvo_fragmentov(:psmid, tnazis.fk_id) as kolvofr,  '+#13+
           '        asu.get_issl_zakl(fk_id)/*(select fc_char from asu.tib where fk_pacid = tnazis.fk_id and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''ZAKL_PATANATOM'') '+#13+
           '         union all '+#13+
           '         select asu.get_smidname(fk_smid) from asu.tib where fk_pacid = tnazis.fk_id and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''ZAKL_CITOLOG'') '+#13+
           '         union all '+#13+
           '         select fc_result from asu.thistology where fk_nazid = tnazis.fk_id)*/ as zakl, '+#13+
           '        (select to_char(fd_date, ''dd.mm.yyyy hh24:mi'') from asu.tib where fk_pacid = tnazis.fk_id and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''DATEIN_PATANATOM'')) as fd_mat, '+#13+
           '        (select sys_xmlagg(xmlelement(col, fc_char ||'';'')).extract(''/ROWSET/COL/text()'').getstringval() from asu.tib where fk_pacid = TNAZIS.fk_id ' + #13 +
           '         and fk_smid in (select fk_id from asu.tsmid where fc_synonim like ''MARK%_OSOB'')) osob ' + #13 +
           '   FROM ASU.TNAZIS '+#13+
           '  WHERE fk_id in (select fk_pacid from asu.tib where fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''DATEIN_PATANATOM'') and fd_date >= :pdate1 and fd_date <= :pdate2) '+#13+
           '    AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID '+#13+
           '                     WHERE FL_SHOWANAL = 1 '+#13+
           '                    START WITH FC_SYNONIM in (''ISL_PATANATOM'', ''I_CITOLOG'', ''I_IMM_GIST'') '+#13+
           '                    CONNECT BY PRIOR FK_ID = FK_OWNER) ';

var
  frmMain: TfrmMain;

implementation

uses fSearch, fIssl, fSetChar, fKem, fSetOtdel, fPreview, fWait;

{$R *.dfm}

procedure TfrmMain.aBreakExecute(Sender: TObject);
begin
  if oqThread.ThreadIsRunning then
   begin
    bThreadIsBreaked := true;
    oqThread.BreakThread;
   end;
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  try
    aBreak.Execute;
  except
  end;
 close;
end;

procedure TfrmMain.aOpenMKExecute(Sender: TObject);
var ods : TOracleDataSet;
    AppProcID : Integer;
begin
  ods := TOracleDataSet.Create(nil);
  try
    {$IFDEF USE_NEW_AUTH}
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_FIO(:FK_PEPLID) FIOPAC FROM DUAL ';
    ods.DeclareAndSet('FK_PEPLID', otInteger, VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PEPLID.Index]);
    ods.Open;
    if RestoreApplication(ods.FieldByName('FIOPAC').AsString) then Exit;
    SetLength(frmMain.arFIO,Length(frmMain.arFIO)+1);
    arFIO[Length(frmMain.arFIO)-1]:=ods.FieldByName('FIOPAC').AsString;
    aOpenMK.Enabled:=False;
    Application.ProcessMessages;
    Screen.Cursor := crSQLWait;
    tmrCheckApplication.Enabled:=True;

    AppProcID := AppStart(ExtractFilePath(paramstr(0))+'IBRazdel.exe', IntToStr(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index])+' '+IntToStr(-1)+' '+IntToStr(-1));
    if AppProcID = -1 then ShowMessage('Ошибка запуска приложения');
    {$ELSE}
      AppProcID := 0;
      if ShellExecute(Application.Handle,
                      pChar('open'),
                      PChar(ExtractFilePath(paramstr(0)) + 'IBRazdel.exe'),
                      PChar(IntToStr(frmMain.pAPPSOTRID) + ' ' +
                      IntToStr(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index]) + ' ' +
                      IntToStr(-1) + ' ' +
                      IntToStr(-1)), PChar(ExtractFilePath(paramstr(0))), SW_SHOWNORMAL) < 32 then
      Application.MessageBox('Запуск внешнего модуля не удался.', 'Ошибка', MB_OK + MB_ICONERROR);
    {$ENDIF}
    ShowWait(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index],True);
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select to_char(sysdate, ''dd.mm.yyyy hh24:mi'') as datesys from dual ';
    ods.Open;
    DateSys_4Rep := ods.FieldByName('datesys').AsString;
  finally
    ods.Free;
  end;
  sParams := '';
  sParams := ' Параметры: ';
  if rowKab.Properties.Value <> -1 then
    sParams := sParams + 'Кабинет: '+odsKab.FieldByName('FC_NAME').AsString+'; ';
  if rowVrach.Properties.Value <> -1 then
    sParams := sParams + 'Врач: '+odsSotr.FieldByName('FC_NAME').AsString+'; ';
  if rowPac.Tag <> -1 then
    sParams := sParams + 'Пациент: '+rowPac.Properties.Value+'; ';
  if VarToStr(rowSex.Properties.Value) <> '' then
    sParams := sParams + 'Пол пациента: '+rowSex.Properties.Value+'; ';
  if rowIssl.Tag <> -1 then
    sParams := sParams + 'Исследование: '+rowIssl.Properties.Value+'; ';
  if VarToStr(rowTypePac.Properties.Value) <> '' then
    sParams := sParams + 'Тип пациента: '+rowTypePac.Properties.Value+'; ';
  if (rowKor.Properties.Value <> - 1) and (VarToStr(rowKor.Properties.Value) <> '') then
    sParams := sParams + 'Коренной житель: '+odsKorennoe.FieldByName('FC_NAME').AsString+'; ';
  if (rowProj.Properties.Value <> -1) and (VarToStr(rowProj.Properties.Value) <> '') then
    sParams := sParams + 'Проживает: '+odsRegPrin.FieldByName('FC_NAME').AsString+'; ';   
  if rowArea.Tag <> -1 then
    sParams := sParams + 'Район: '+rowArea.Properties.Value+'; ';
  if (rowUrg.Properties.Value <> -1) and (VarToStr(rowUrg.Properties.Value) <> '') then
    sParams := sParams + 'Срочность: '+odsTypeNaz.FieldByName('FC_NAME').AsString+'; ';
  if (rowOpl.Properties.Value <> -1) and (VarToStr(rowOpl.Properties.Value) <> '') then
    sParams := sParams + 'Способ оплаты: '+odsVidOplat.FieldByName('FC_NAME').AsString+'; ';
  if rowMat.Tag <> -1 then
    sParams := sParams + 'Характер материала: '+rowMat.Properties.Value+'; ';
  if rowOsob.Tag <> -1 then
    sParams := sParams + 'Особенности: '+rowOsob.Properties.Value+'; ';
  if rowKem.Tag <> -1 then
    sParams := sParams + 'Направившее учреждение: '+rowKem.Properties.Value+'; ';
  if rowOtdel.Tag <> -1 then
    sParams := sParams + 'Направившее отделение: '+rowOtdel.Properties.Value+'; ';
  if sParams = ' Параметры: ' then
    sParams := '';
  if get_dbname = 'TO' then // для Нижнего Тагила Онко
    begin
      frListNT.ShowReport;
      exit;
    end;
  frList.ShowReport;
end;

procedure TfrmMain.aProtocolExecute(Sender: TObject);
begin
  if VIEW.DataController.FocusedRecordIndex >= 0 then
   DoResult(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_FK_ID.Index])
  else
   application.messagebox('Выберите запись.','Внимание',MB_ICONWARNING);
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
var
  s : string;
  i : integer;
begin
  bThreadIsBreaked := false;
  cxGr.SetFocus;
  aRefresh.Enabled := False;
  aPrint.Enabled := False;
  aProtocol.Enabled := False;
  aOpenMK.Enabled := False;

  if VIEW.DataController.LockCount = 0 then
    VIEW.BeginUpdate;
  VIEW.DataController.RecordCount := 0;
  while VIEW.DataController.LockCount > 0 do
    VIEW.EndUpdate;
  memData.Close;
  memData.Open;
  dDateBegin := VarToDateTime(rowPeriodFrom.Properties.Value);
  dDateEnd := VarToDateTime(rowPeriodTo.Properties.Value+' 23:59:59');
  oqThread.Scrollable := True;

  oqThread.DeleteVariables;
  if rowDates.Properties.Value = 'дате выполнения' then
    oqThread.SQL.Text := sqlList
  else
    oqThread.SQL.Text := sqlMat;
//-->> 1. Статус исследования
  if rowStatus.Properties.Value = -100 then
    begin
      oqThread.SQL.Add(' and fk_nazsosid in (asu.get_vipnaz, asu.get_labvip) ');
    end else
    begin
      oqThread.SQL.Add(' and fk_nazsosid = :pfk_nazsosid ');
      oqThread.DeclareAndSet('pfk_nazsosid', otInteger, rowStatus.Properties.Value);
    end;
//-->> 2. Кабинет
  if rowKab.Properties.Value <> -1 then
    begin
      oqThread.SQL.Add(' and fk_roomid = :pfk_roomid ');
      oqThread.DeclareAndSet('pfk_roomid', otInteger, rowKab.Properties.Value);
    end;
//-->> 3. Врач
  if rowVrach.Properties.Value <> -1 then
    begin
      oqThread.SQL.Add(' and fk_ispolid = :pfk_ispolid ');
      oqThread.DeclareAndSet('pfk_ispolid', otInteger, rowVrach.Properties.Value);
    end;
//-->> 4. Пациент
  if rowPac.Tag <> -1 then
    begin
      oqThread.SQL.Add(' and asu.get_peplid(fk_pacid) = :pfk_pacid ');
      oqThread.DeclareAndSet('pfk_pacid', otInteger, rowPac.Tag);
    end;
//-->> 5. Пол пациента
  if VarToStr(rowSex.Properties.Value) <> '' then
    begin
      oqThread.SQL.Add(' and asu.pkg_regist_pacfunc.get_pac_sexid(fk_pacid) = :pfk_sexid ');
      if rowSex.Properties.Value = 'Мужчины' then
        oqThread.DeclareAndSet('pfk_sexid', otInteger, 1);
      if rowSex.Properties.Value = 'Женщины' then
        oqThread.DeclareAndSet('pfk_sexid', otInteger, 0);
    end;
//-->> 6. Тип пациента
  if VarToStr(rowTypePac.Properties.Value) <> '' then
    begin
      oqThread.SQL.Add(' and asu.is_ambulance(fk_pacid) = :pfk_typepac ');
      if rowTypePac.Properties.Value = 'стационарный' then
        oqThread.DeclareAndSet('pfk_typepac', otInteger, 0);
      if rowTypePac.Properties.Value = 'амбулаторный' then
        oqThread.DeclareAndSet('pfk_typepac', otInteger, 1);
    end;
//-->> 7. Срочность
  if (rowUrg.Properties.Value <> -1) and (VarToStr(rowUrg.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' and fk_naztypeid = :pfk_naztypeid ');
      oqThread.DeclareAndSet('pfk_naztypeid', otInteger, rowUrg.Properties.Value);
    end;
//-->> 8. Коренной житель
  if (rowKor.Properties.Value <> -1) and (VarToStr(rowKor.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' and exists (select 1 from asu.tib where fk_pacid = asu.get_peplid(tnazis.fk_pacid) and fk_smid = :pfk_smid1) ');
      oqThread.DeclareAndSet('pfk_smid1', otInteger, rowKor.Properties.Value);
    end;
//-->> 9. Проживает
  if (rowProj.Properties.Value <> -1) and (VarToStr(rowProj.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' and exists (select 1 from asu.tib where fk_pacid = tnazis.fk_pacid and fk_smid = :pfk_smid2) ');
      oqThread.DeclareAndSet('pfk_smid2', otInteger, rowProj.Properties.Value);
    end;
//-->> 10. Вид оплаты
  if (rowOpl.Properties.Value <> -1) and (VarToStr(rowOpl.Properties.Value) <> '') then
    begin
      oqThread.SQL.Add(' and exists (select 1 from asu.tib where fk_pacid = tnazis.fk_id and fk_smid = :pfk_smid3) ');
      oqThread.DeclareAndSet('pfk_smid3', otInteger, rowOpl.Properties.Value);
    end;
//-->> 11. Исследование
  if rowIssl.Tag <> -1 then
    begin
      oqThread.SQL.Add(' and fk_smid in (:pfk_smid4) ');
      oqThread.DeclareAndSet('pfk_smid4', otSubst, strID);
    end;
//-->> 12. Характер материала
  if rowMat.Tag <> -1 then
    begin
      s := '';
      for i := Low(FArrHarMaterial) to high(FArrHarMaterial) do
       begin
         if s <> '' then
          s := s + ',' + inttostr(FArrHarMaterial[i])
         else
          s := inttostr(FArrHarMaterial[i]);
       end;
      if s = '' then
       s := ' = ' + inttostr(rowMat.Tag)
      else
       s := ' in (' + s + ')';
      oqThread.SQL.Add(' and exists (select 1 from asu.tib where fk_pacid = tnazis.fk_id and fk_smid '+s+') ');
//      oqThread.DeclareAndSet('pfk_smid5', otInteger, rowMat.Tag);
    end;
//-->> 13. Направившее учреждение
  if rowKem.Tag <> -1 then
    begin
      oqThread.SQL.Add(' and exists (select 1 from asu.tib where fk_pacid = tnazis.fk_id and fk_smid = :pfk_smid6) ');
      oqThread.DeclareAndSet('pfk_smid6', otString, rowKem.Tag);
    end;
//-->> 14. Направившее отделение
  if rowOtdel.Tag <> -1 then
    begin
      oqThread.SQL.Add(' and asu.get_vrachfcotdel(tnazis.fk_vrachid) = :pfc_otdel ');
      oqThread.DeclareAndSet('pfc_otdel', otString, rowOtdel.Properties.Value);
    end;
//-->> 15. Особенности (пока только для НТО(Нижний Тагил Онко))
  if rowOsob.Tag <> -1 then
    begin
      oqThread.SQL.Add(' and exists (select 1 from asu.tib where fk_pacid = tnazis.fk_id and fn_num = :pfk_smid7) ');
      oqThread.DeclareAndSet('pfk_smid7', otInteger, rowOsob.Tag);
    end;
//-->> 16. Номер стекла (пока только для НТО)
  if rowNumGlass.Properties.Value <> Null then
    begin
      oqThread.SQL.Add(' and exists (select 1 from asu.tib where fk_pacid = tnazis.fk_id and fc_char = :pfc_char) ');
      oqThread.DeclareAndSet('pfc_char', otString, rowNumGlass.Properties.Value);
    end;
//-->> 17. Патология
  if (rowPat.Properties.Value <> 0) and (rowPat.Properties.Value <> Null) then
    begin
      oqThread.SQL.Add(' and exists (select 1 from asu.vnaz_pat_patology where fk_nazid = tnazis.fk_id) ');
    end;
//-->> 18. Район
  if rowArea.Tag <> -1 then
    begin
      oqThread.SQL.Add(' and exists (select 1 from asu.tareaadrpepl where fk_peplid = asu.get_peplid(tnazis.fk_pacid) and fk_areanameid = :pArea) ');
      oqThread.DeclareAndSet('pArea', otInteger, rowArea.Tag);
    end;

  cxLabel1.Caption := '';
  cxLabel2.Caption := '';
  cxLabel3.Caption := 'Выполняется запрос к Базе Данных...';
  StartTime:= Now;
  cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel1.Refresh;
  bbr := False;
  paSubParam.Visible := True;
  cxSplitter2.Visible := True;
  Animator1.Animate := True;
  aBreak.Enabled := true;
  oqThread.DeclareAndSet('PDATE1', otDate, dDateBegin);
  oqThread.DeclareAndSet('PDATE2', otDate, dDateEnd);
  oqThread.DeclareAndSet('psmid', otInteger, rowMat.Tag);
  VIEW.BeginUpdate;
  nRec := 0;
  oqThread.Execute;
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

procedure TfrmMain.BmpToJPEG(pFNAME1, pFNAME2: String);
var JPEG: TJPEGImage;
    Bitmap: TBitmap;
    Image1: TImage;
    lStream: TFileStream;
begin
  lStream:=TFileStream.Create(ExtractFilePath(paramstr(0))+'RGIMAGES'+pFNAME2,fmOpenRead);
  try
    if PhysicalResolveFileType(lStream)=1 then
      begin
        lStream.Free;
        JPEG := TJPEGImage.Create;
        Bitmap := TBitmap.Create;
        Image1:=timage.create(nil);
        try
          Bitmap.LoadFromFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+pFNAME2);
          JPEG.Assign(Bitmap);
          Image1.Picture.Assign(JPEG);
          Image1.Picture.SaveToFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+pFNAME1);
        finally
          Image1.free;
          JPEG.Free;
          Bitmap.Free;
        end;
      end
      else
          lStream.Free;
  except
    lStream.Free;
  end;
end;

procedure TfrmMain.DoResult(nNazID: Integer);
var q : TOracleDataSet;
    ods : TOracleDataSet;
    LOB : TLOBLocator;
    IDRes : Integer;
    RegSave, RegLoad : TRegIniFile;
begin
  Application.CreateForm(TfrmPreview, frmPreview);
  frmPreview.WindowState := wsMaximized;

  RegLoad := TRegIniFile.Create;
  RegLoad.RootKey:=HKEY_CURRENT_USER;
  RegLoad.OpenKey('\Software\Softmaster\Print\ID_VRACH'+IntToStr(pSotrID), True);
  frmPreview.bbFormat.ItemIndex := RegLoad.ReadInteger('\Software\Softmaster\Print\ID_VRACH'+IntToStr(pSOTRID), 'RazmerList', 0);
  RegLoad.Free;

  if not DirectoryExists(ExtractFilePath(paramstr(0))+'RGIMAGES') then
    CreateDir(ExtractFilePath(paramstr(0))+'RGIMAGES');

  ods := TOracleDataSet.Create(nil);
  ods.Session := os;
  ods.Cursor := crSQLWait;
  ods.SQL.Text := ' SELECT FK_ID FROM VRES WHERE FK_NAZID ='+IntToStr(nNazID);
  ods.Open;
  IDRes := ods.FieldByName('FK_ID').AsInteger;

  ods.DeleteVariables;
  ods.Close;
  ods.SQL.Text := ' SELECT THTMLIMAGES.FC_NAME||''.JPG'' SFILENAME, THTMLIMAGES.FB_BLOB '+
                  '   FROM ASU.TRICHVIEWDATA, ASU.THTMLIMAGES '+
                  '  WHERE TRICHVIEWDATA.FK_PACID ='+IntToStr(nNazID)+  
                  '    AND THTMLIMAGES.FK_RICHVIEW=TRICHVIEWDATA.FK_ID ';
  ods.Open;
  if ods.RecordCount > 0 then
    begin
      while not ods.Eof do
        begin
          TBlobField(ods.FieldByName('FB_BLOB')).SaveToFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+ods.FieldByName('SFILENAME').AsString);
          BmpToJPEG(ods.FieldByName('SFILENAME').AsString, ods.FieldByName('SFILENAME').AsString);
          ods.Next;
        end;
    end;
  ods.Free;
//------------------------------------------------------------------------------
  q:=TOracleDataSet.Create(nil);
  q.Session:=os;
  q.Cursor := crSQLWait;
  LOB:=TLOBLocator.Create(os, otCLOB);
  q.DeclareVariable('html', otCLOB);
  q.SetComplexVariable('html', LOB);
  q.SQL.Add(' BEGIN ');
  q.SQL.Add('  dbms_lob.createtemporary(:html, TRUE, dbms_lob.SESSION);');
  q.SQL.Add('  dbms_lob.WRITE(:html,1,1,'' '');');
  q.SQL.Add('  :html:='+'STAT.PKG_IBXML.GET_HTM_OSM('+IntToStr(IDRes)+');');
  q.SQL.Add(' END; ');
  q.Open;

  LOB:=TLOBLocator(q.GetComplexVariable('html'));
  LOB.SaveToFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+IntToStr(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index]) +'print.htm');
  q.Free;
  LOB.Free;
  frmPreview.wb.Navigate(ExtractFilePath(paramstr(0))+'RGIMAGES'+IntToStr(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index]) +'print.htm');
  frmPreview.ShowModal;
  if frmPreview.ModalResult = MrOk then
    begin
      RegSave := TRegIniFile.Create;
      RegSave.RootKey:=HKEY_CURRENT_USER;
      if not RegSave.OpenKey('\Software\Softmaster\Print\', FALSE) then
        begin
          RegSave.CreateKey('\Software\Softmaster\Print');
        end;
      try
        RegSave.WriteInteger('\Software\Softmaster\Print'+'\ID_VRACH'+IntToStr(pSotrID), 'RazmerList', frmPreview.bbFormat.ItemIndex); 
      except
      end;
      RegSave.Free;
      DoWordProcess(ExtractFilePath(paramstr(0))+'RGIMAGES'+inttostr(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index]) +'print.htm', frmPreview.bbFormat.ItemIndex);
      try
        DeleteFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+inttostr(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index]) +'print.htm');
      except
      end;
      frmPreview.Free;
    end else
    begin
      try
        DeleteFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+inttostr(VIEW.DataController.Values[VIEW.DataController.FocusedRecordIndex, VIEW_PACID.Index]) +'print.htm');
      except
      end;
      frmPreview.Free;
    end;
end;

procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  rowPac.Tag := -1;
  rowIssl.Tag := -1;
  rowArea.tag := -1;
  rowMat.Tag := -1;
  rowKem.Tag := -1;
  rowOtdel.Tag := -1;
  rowOsob.Tag := -1;
  ods := TOracleDataSet.Create(nil);
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY'') AS DATESYS, '+#13+
                    '        FK_SOTRID, '+#13+
                    '        ASU.DO_VRACHFIO(FK_SOTRID) AS VRACHFIO, asu.get_vipnaz, '+#13+
                    '        (SELECT FC_NAME '+#13+
                    '           FROM ASU.TOTDEL '+#13+
                    '          WHERE FK_ID = (SELECT FK_OTDID FROM ASU.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME '+#13+
                    '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, StrToInt(paramstr(1)));
    ods.Open;
    rowStatus.Properties.Value := ods.FieldByName('get_vipnaz').AsInteger;
    pAPPSOTRID := StrToInt(paramstr(1));
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    frmMain.Caption := 'Патанатомия - архив ('+Ver.FileVersion+')'+'. Пользователь: '+ods.FieldByName('VRACHFIO').AsString;
    rowPeriodFrom.Properties.Value := ods.FieldByName('DATESYS').AsVariant;
    rowPeriodTo.Properties.Value := ods.FieldByName('DATESYS').AsVariant;
    sOtdelName_4Rep := ods.FieldByName('OTDELNAME').AsString;
    sSotrFIO := ods.FieldByName('VRACHFIO').AsString;
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT TSOTR.FK_OTDELID, TS_SPRAV.FC_NAME '+#13+
                    '   FROM ASU.TSOTR, ASU.TS_SPRAV '+#13+
                    '  WHERE TSOTR.FK_SPRAVID = TS_SPRAV.FK_ID AND TSOTR.FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pSOTRID);
    ods.Open;
    pOTDELID := ods.FieldByName('FK_OTDELID').AsInteger;
    sSpec := ods.FieldByName('FC_NAME').AsString;
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select asu.pkg_smini.readstring(''CONFIG'', ''S_FULLNAME'', '''') as companyname, '+#13+
                    '        asu.get_vipnaz, asu.get_labvip, asu.get_nevip, '+#13+
                    '        asu.pkg_smini.readstring(''CONFIG'', ''DB_NAME'', ''H'') as db_name '+#13+
                    '   from dual ';
    ods.Open;
    sCompanyName_4Rep := ods.FieldByName('companyname').AsString;
    get_vipnaz := ods.FieldByName('get_vipnaz').AsInteger;
    get_labvip := ods.FieldByName('get_labvip').AsInteger;
    get_nevip := ods.FieldByName('get_nevip').AsInteger;
    get_dbname := ods.FieldByName('db_name').AsString;
    rowOsob.Visible := get_dbname = 'TO';
    rowNumGlass.Visible := get_dbname = 'TO';
//--- "заряжаем" датасеты
    if odsMain.Active = False then
      odsMain.Open;
    if odsKab.Active = False then
      odsKab.Open;
    if odsSotr.Active = False then
      odsSotr.Open;
    if odsTypeNaz.Active = False then
      odsTypeNaz.Open;
    if odsKorennoe.Active = False then
      odsKorennoe.Open;
    if odsRegPrin.Active = False then
      odsRegPrin.Open;
    if odsVidOplat.Active = False then
      odsVidOplat.Open;
    VIEW.StoreToRegistry('\SoftWare\SoftMaster\Pat_Archive\fMain\ViewVrach_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'VIEW');
    VIEW.RestoreFromRegistry('\SoftWare\SoftMaster\Pat_Archive\fMain\ViewVrach_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'VIEW');
    MedotradeSign := ReadMedotradeSign;
  finally
    ods.Free;
    Ver.Free;
  end;
end;

procedure TfrmMain.DoWordProcess(path: String; FormatPr: Integer; bLandscape: Boolean);
var
  WordApp : TWordApplication;
  WordDoc : TWordDocument;
  Template, NewTemplate, FileName,
  ConfirmConversions, ReadOnly, AddToRecentFiles,
  PasswordDocument, PasswordTemplate, Revert,
  WritePasswordDocument, WritePasswordTemplate,
  Format, Encoding, EmPar, Visible,
  Background, time,SaveCHanges,OriginalFormat,
  RouteDocument : OleVariant;
begin
  Screen.Cursor := crHourGlass;
  EmPar:='';
  WordApp:=TWordApplication.Create(nil);
  WordDoc:=TWordDocument.Create(nil);
  try
    Template:='';
    NewTemplate:=True;
    try
      WordApp.Connect;
    except
      WordDoc.Close;
      WordDoc.Free;
      Wordapp.Quit;
      WordApp.Free;
      Application.Terminate; //???
    end;
    Wordapp.Visible:=false;
    WordApp.Options.CheckSpellingAsYouType:=False;
    WordApp.Options.CheckGrammarAsYouType:=False;
    FileName:=path;
    ConfirmConversions:=FALSE;
    ReadOnly:=FALSE;
    AddToRecentFiles:=FALSE;
    PasswordDocument:= '';
    PasswordTemplate:= '';
    Revert:=FALSE;
    WritePasswordDocument:= '';
    WritePasswordTemplate:= '';
    Format:=wdOpenFormatAuto;
    Visible:=TRUE;
    WordDoc.ConnectTo(WordApp.Documents.Open(FileName, ConfirmConversions, ReadOnly, AddToRecentFiles, PasswordDocument, PasswordTemplate, Revert, WritePasswordDocument, WritePasswordTemplate, Format, Encoding, visible));
    BackGround:=False;
    Time:=WordApp.Documents.Count;

    if FormatPr = 1 then
      begin
        WordDoc.PageSetup.LineNumbering.Active := 0;
        WordDoc.PageSetup.Orientation := wdOrientLandscape;
        WordDoc.PageSetup.TopMargin := 22.5;
        WordDoc.PageSetup.BottomMargin := 22.5;
        WordDoc.PageSetup.LeftMargin := 56.7;
        WordDoc.PageSetup.RightMargin := 56.7;
        WordDoc.PageSetup.Gutter := 0;
        WordDoc.PageSetup.HeaderDistance := 35.4;
        WordDoc.PageSetup.FooterDistance := 35.4;
        WordDoc.PageSetup.PageWidth := 595.35;
        WordDoc.PageSetup.PageHeight := 419.55;
        WordDoc.PageSetup.FirstPageTray := wdPrinterDefaultBin;
        WordDoc.PageSetup.OtherPagesTray := wdPrinterDefaultBin;
        WordDoc.PageSetup.SectionStart := wdSectionNewPage;
        WordDoc.PageSetup.OddAndEvenPagesHeaderFooter := 0;
        WordDoc.PageSetup.DifferentFirstPageHeaderFooter := 0;
        WordDoc.PageSetup.VerticalAlignment := wdAlignVerticalTop;
        WordDoc.PageSetup.SuppressEndnotes := 0;
        WordDoc.PageSetup.MirrorMargins := 0;
        WordDoc.PageSetup.TwoPagesOnOne := FALSE;
        WordDoc.PageSetup.GutterPos := wdGutterPosLeft;
      end else
      begin
        WordDoc.PageSetup.Orientation:= wdOrientPortrait;
        WordDoc.PageSetup.TextColumns.SetCount(1);
      end;

    WordApp.ActiveWindow.View.Type_:=wdPageView;
    TReportUtils.AddMedotradeSign(WordApp);
    WordApp.PrintOut(BackGround);
    SaveChanges := WdDoNotSaveChanges;
    WordApp.Quit(SaveChanges,OriginalFormat,RouteDocument) ;
    try
      WordApp.Disconnect;
    except
      on E: Exception do
        begin
          Showmessage(E.Message);
          WordApp.Disconnect;
        end;
    end;
  except
    on E: Exception do
      begin
        ShowMessage(E.Message);
        WordApp.Disconnect;
      end;
  end;
  try
    WordDoc.free;
    WordApp.free;
  finally
    Screen.Cursor := crArrow;
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите закрыть программу ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
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
  VIEW.StoreToRegistry('\SoftWare\SoftMaster\Pat_Archive\fMain\ViewVrach_' + IntToStr(pSOTRID), TRUE, [], 'VIEW');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  bThreadIsBreaked := false;
  GetSession(os, 'ASU');
  Russian := LoadKeyboardLayout('00000419', 0);
  aPrint.Enabled := False;
  aProtocol.Enabled := False;
  aOpenMk.Enabled := False;
  Self.WindowState := wsMaximized;
  rowDates.Properties.Value := 'дате выполнения';
end;

procedure TfrmMain.frListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'DATESYS' then Value := DateSys_4Rep;
  if VarName = 'SOTR' then Value := sSotrFIO;
  if VarName = 'DATE1' then Value := rowPeriodFrom.Properties.Value;
  if VarName = 'DATE2' then Value := rowPeriodTo.Properties.Value;
  if VarName = 'PARAMS' then Value := sParams;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
  if VarName = 'VSEGO' then Value := oqThread.RowCount;
  if rowStatus.Properties.Value = get_vipnaz then
    begin
      if VarName = 'STATUS' then Value := 'Выполнено';
    end;
  if rowStatus.Properties.Value = get_nevip then
    begin
      if VarName = 'STATUS' then Value := 'Не вып.';
    end;
  if rowStatus.Properties.Value = get_labvip then
    begin
      if VarName = 'STATUS' then Value := 'Вып. лаборантом';
    end;
  if rowStatus.Properties.Value = -100 then
    begin
      if VarName = 'STATUS' then Value := 'Вып. + вып. лаборантом';
    end;
  if VarName = 'DATES' then Value := rowDates.Properties.Value;   
end;

procedure TfrmMain.frListNTGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'DATESYS' then Value := DateSys_4Rep;
  if VarName = 'SOTR' then Value := sSotrFIO;
  if VarName = 'DATE1' then Value := rowPeriodFrom.Properties.Value;
  if VarName = 'DATE2' then Value := rowPeriodTo.Properties.Value;
  if VarName = 'PARAMS' then Value := sParams;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
  if VarName = 'VSEGO' then Value := oqThread.RowCount;
  if rowStatus.Properties.Value = get_vipnaz then
    begin
      if VarName = 'STATUS' then Value := 'Выполнено';
    end;
  if rowStatus.Properties.Value = get_nevip then
    begin
      if VarName = 'STATUS' then Value := 'Не вып.';
    end;
  if rowStatus.Properties.Value = get_labvip then
    begin
      if VarName = 'STATUS' then Value := 'Вып. лаборантом';
    end;
  if rowStatus.Properties.Value = -100 then
    begin
      if VarName = 'STATUS' then Value := 'Вып. + вып. лаборантом';
    end;
  if VarName = 'DATES' then Value := rowDates.Properties.Value;
end;

procedure TfrmMain.N1Click(Sender: TObject);
begin
  if Application.MessageBox('Вы действительно хотите очистить все критерии выборки?', 'Вопрос', MB_YESNO) = mrYes then
    begin
      rowKab.Properties.Value := -1;
      rowVrach.Properties.Value := -1;
      rowPac.Tag := -1;
      rowPac.Properties.Value := null;
      rowIssl.Tag := -1;
      rowArea.Tag := -1;
      rowIssl.Properties.Value := null;
      strID := '';
      strName := '';
      rowSex.Properties.Value := null;

      rowTypePac.Properties.Value := null;
      rowTypePac.Properties.ImageIndex := -1;
      rowTypePac.Styles.Content := stNormal;
      rowTypePac.Styles.Header := stNormal;

      rowKor.Properties.Value := -1;
      rowKor.Properties.ImageIndex := -1;
      rowKor.Styles.Content := stNormal;
      rowKor.Styles.Header := stNormal;

      rowOpl.Properties.Value := -1;
      rowOpl.Properties.ImageIndex := -1;
      rowOpl.Styles.Content := stNormal;
      rowOpl.Styles.Header := stNormal;

      rowProj.Properties.Value := -1;
      rowProj.Properties.ImageIndex := -1;
      rowProj.Styles.Content := stNormal;
      rowProj.Styles.Header := stNormal;

      rowUrg.Properties.Value := -1;
      rowUrg.Properties.ImageIndex := -1;
      rowUrg.Styles.Content := stNormal;
      rowUrg.Styles.Header := stNormal;

      rowKem.Tag := -1;
      rowKem.Properties.Value := -1;
      rowKem.Properties.Value := null;
      rowKem.Properties.ImageIndex := -1;
      rowKem.Styles.Content := stNormal;
      rowKem.Styles.Header := stNormal;

      rowOtdel.Tag := -1;
      rowOtdel.Properties.Value := -1;
      rowOtdel.Properties.Value := null;
      rowOtdel.Properties.ImageIndex := -1;
      rowOtdel.Styles.Content := stNormal;
      rowOtdel.Styles.Header := stNormal;

      rowMat.Tag := -1;
      rowMat.Properties.Value := -1;
      rowMat.Properties.Value := null;
      rowMat.Properties.ImageIndex := -1;
      rowMat.Styles.Content := stNormal;
      rowMat.Styles.Header := stNormal;

      rowOsob.Tag := -1;
      rowOsob.Properties.Value := -1;
      rowOsob.Properties.Value := null;
      rowOsob.Properties.ImageIndex := -1;
      rowOsob.Styles.Content := stNormal;
      rowOsob.Styles.Header := stNormal;

      rowNumGlass.Properties.Value := null;

      rowPat.Properties.Value := 0;


      try
        TcxButtonEdit(vGr.InplaceEditor).EditValue := null;
      except
      end;
      vGr.FocusRow(vGr.FirstRow, 0);
    end;
end;

procedure TfrmMain.N3Click(Sender: TObject);
begin
  VIEW.RestoreFromRegistry('\SoftWare\SoftMaster\Pat_Archive\fMain\ViewVrach_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'VIEW');
end;

procedure TfrmMain.odsKabBeforeOpen(DataSet: TDataSet);
begin
  odsKab.SetVariable('PSOTR', pSOTRID);
end;

procedure TfrmMain.odsSotrBeforeOpen(DataSet: TDataSet);
begin
  odsSotr.SetVariable('PFK_OTDELID', pOTDELID);
end;

procedure TfrmMain.oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer; const ErrorMessage: string);
begin
  VIEW.EndUpdate;
  MessageDlg('Во время выполнения запроса произошла ошибка! Обратитесь к администратору системы!'+
             #13#10+'Код ошибки: '+IntToStr(ErrorCode)+
             #13#10+'Текст ошибки: '+ErrorMessage,
             mtError, [mbOK], 0);
  bbr := True;
end;

procedure TfrmMain.oqThreadThreadFinished(Sender: TOracleQuery);
begin
  VIEW.EndUpdate;
  aRefresh.Enabled := True;
  aPrint.Enabled := oqThread.RowCount <> 0;
  aProtocol.Enabled := oqThread.RowCount <> 0;
  aOpenMK.Enabled := oqThread.RowCount <> 0;
  Animator1.Animate := False;
  aBreak.Enabled := false;
  if bThreadIsBreaked then
   begin
     cxLabel3.Caption := 'Запрос к Базе Данных был прерван!';
   end
  else
   begin
    if bbr then
      cxLabel3.Caption := 'При выполнении запроса произошла ошибка!'
    else
      cxLabel3.Caption := 'Запрос к Базе Данных выполнился успешно!';
   end;
end;

procedure TfrmMain.oqThreadThreadRecord(Sender: TOracleQuery);
begin
//  VIEW.BeginUpdate;
  VIEW.DataController.RecordCount := VIEW.DataController.RecordCount + 1;
  with VIEW.DataController do
  begin
    try
      Values[VIEW.DataController.RecordCount - 1, VIEW_FK_ID.Index] := Sender.Field('FK_ID');
      Values[VIEW.DataController.RecordCount - 1, VIEW_PACID.Index] := Sender.Field('FK_PACID');
      Values[VIEW.DataController.RecordCount - 1, VIEW_FD_NAZ.Index] := Sender.Field('FD_NAZ');
      Values[VIEW.DataController.RecordCount - 1, VIEW_FD_RUN.Index] := Sender.Field('FD_RUN');
      Values[VIEW.DataController.RecordCount - 1, VIEW_PACFIO.Index] := Sender.Field('FIOPAC');
      Values[VIEW.DataController.RecordCount - 1, VIEW_NAMEISSL.Index] := Sender.Field('NAMEISSL');
      Values[VIEW.DataController.RecordCount - 1, VIEW_VRACH.Index] := Sender.Field('VRACHFIO');
      Values[VIEW.DataController.RecordCount - 1, VIEW_NUMMK.Index] := Sender.Field('NUMMK');
      Values[VIEW.DataController.RecordCount - 1, VIEW_PEPLID.Index] := Sender.Field('PEPLID');
      Values[VIEW.DataController.RecordCount - 1, VIEW_OTDEL.Index] := Sender.Field('OTDEL');
      Values[VIEW.DataController.RecordCount - 1, VIEWNUM.Index] := Sender.Field('NUMBER_ISSL');
      Values[VIEW.DataController.RecordCount - 1, VIEWKOLVO.Index] := Sender.Field('KOLVO');
      Values[VIEW.DataController.RecordCount - 1, VIEWKOLMAT.Index] := Sender.Field('KOLVOFR');
      Values[VIEW.DataController.RecordCount - 1, vOtdel.Index] := Sender.Field('OTDELNAME');
      Values[VIEW.DataController.RecordCount - 1, vSotr.Index] := Sender.Field('VRACH');
      Values[VIEW.DataController.RecordCount - 1, VIEWZAKL.Index] := Sender.Field('ZAKL');    
      Values[VIEW.DataController.RecordCount - 1, grtvcOsob.Index] := Sender.Field('OSOB');

      memData.Insert;
      memData.FieldByName('FK_ID').AsString := Sender.Field('FK_ID');
      memData.FieldByName('FK_PACID').AsString := Sender.Field('FK_PACID');
      memData.FieldByName('FD_NAZ_STR').AsString := Sender.Field('FD_NAZ_STR');
      memData.FieldByName('FD_RUN_STR').AsString := Sender.Field('FD_RUN_STR');
      memData.FieldByName('FIOPAC').AsString := Sender.Field('FIOPAC');
      memData.FieldByName('NAMEISSL').AsString := Sender.Field('NAMEISSL');
      memData.FieldByName('VRACHFIO').AsString := Sender.Field('VRACHFIO'); // исполнитель
      memData.FieldByName('NUMMK').AsString := Sender.Field('NUMMK');
      memData.FieldByName('PEPLID').AsString := Sender.Field('PEPLID');
      memData.FieldByName('OTDEL').AsString := Sender.Field('OTDEL');
      memData.FieldByName('NUMBER_ISSL').AsString := Sender.Field('NUMBER_ISSL');
      memData.FieldByName('KOLVO').AsInteger := Sender.Field('KOLVO');
      memData.FieldByName('KOLVOFR').AsInteger := Sender.Field('KOLVOFR');
      memData.FieldByName('OTDELNAME').AsString := Sender.Field('OTDELNAME');
      memData.FieldByName('VRACH').AsString := Sender.Field('VRACH');
      memData.FieldByName('fd_run').AsDateTime := Sender.Field('fd_run');
      memData.FieldByName('zakl').AsString := Sender.Field('zakl');
      memData.FieldByName('rojdpac').AsDateTime := Sender.Field('rojdpac');
      memData.FieldByName('adr').AsString := Sender.Field('adres');
      memData.FieldByName('fd_mat').AsString := Sender.Field('fd_mat');
      memData.FieldByName('osob').AsString := Sender.Field('osob');
      memData.Post;
      memData.Next;
    finally
    end;
  end;
//  VIEW.EndUpdate;
  cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel1.Refresh;
  cxLabel2.Caption := 'Выбрано ' + IntToStr(VIEW.DataController.RecordCount) + ' записей.';
  cxLabel2.Refresh;
  nRec := nRec + 1;
  if nRec > 100 then
    begin
      nRec := 0;
      VIEW.EndUpdate;
      VIEW.BeginUpdate;
    end;
end;

function TfrmMain.PhysicalResolveFileType(AStream: TStream): Integer;
var p: PChar;
begin
  Result := 0;
  if not Assigned(AStream) then
    Exit;
  GetMem(p, 10);
  try
    AStream.Position := 0;
    AStream.Read(p[0], 10);
    {bitmap format}
    if (p[0] = #66) and (p[1] = #77) then
      Result := 1;
    {tiff format}
    if ((p[0] = #73) and (p[1] = #73) and (p[2] = #42) and (p[3] = #0)) or
      ((p[0] = #77) and (p[1] = #77) and (p[2] = #42) and (p[3] = #0)) then
      Result := 2;
    {jpg format}
    if (p[6] = #74) and (p[7] = #70) and (p[8] = #73) and (p[9] = #70) then
      Result := 3;
    {png format}
    if (p[0] = #137) and (p[1] = #80) and (p[2] = #78) and (p[3] = #71) and
      (p[4] = #13) and (p[5] = #10) and (p[6] = #26) and (p[7] = #10) then
      Result := 4;
    {dcx format}
    if (p[0] = #177) and (p[1] = #104) and (p[2] = #222) and (p[3] = #58) then
      Result := 5;
    {pcx format}
    if p[0] = #10 then
      Result := 6;
    {emf format}
    if (p[0] = #215) and (p[1] = #205) and (p[2] = #198) and (p[3] = #154) then
      Result := 7;
    {emf format}
    if (p[0] = #1) and (p[1] = #0) and (p[2] = #0) and (p[3] = #0) then
      Result := 7;
  finally
    Freemem(p);
  end;
end;

function TfrmMain.RestoreApplication(AAppCaption: string): Boolean;
var
  Wnd               : hWnd;
  buff              : array[0..127] of Char;
begin
  Result := False;
  Self.SetFocus;
  Application.ProcessMessages;
  Wnd := GetWindow(Handle, gw_HWndFirst);
  while Wnd <> 0 do
  begin
    if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
    begin
      GetWindowText(Wnd, buff, sizeof(buff));
      if StrPas(buff) = AAppCaption then
      begin
        Application.ProcessMessages;
        ShowWindow(wnd, SW_SHOWMINIMIZED);
        ShowWindow(wnd, SW_SHOWNORMAL);
        SetForegroundWindow(wnd);
        Application.ProcessMessages;
        Result := True;
        Exit;
      end; //if StrPas(buff) = cFIO
    end; //if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
    Wnd := GetWindow(Wnd, gw_hWndNext);
  end; //while Wnd <> 0
end;

procedure TfrmMain.rowAreaEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetChar, frmSetChar);
      frmSetChar.DoShowForm('AREA');
      frmSetChar.TVCHAR.OptionsSelection.MultiSelect := false;     
      try
        frmSetChar.ShowModal;
        if frmSetChar.ModalResult = mrOK then
          begin
            rowArea.Tag := frmSetChar.odsAREA.FieldByName('fk_id').AsInteger;
            TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vGr.InplaceEditor).EditingText := frmSetChar.odsAREA.FieldByName('fc_name').AsString;
            TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            if rowArea.Tag = -1 then
              begin
                rowArea.Properties.ImageIndex := -1;
                rowArea.Styles.Content := stNormal;
                rowArea.Styles.Header := stNormal;
              end else
              begin
                rowArea.Properties.ImageIndex := 4;
                rowArea.Styles.Content := stBold;
                rowArea.Styles.Header := stBold;
              end;
          end;
      finally
        frmSetChar.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      rowArea.Tag := -1;
      TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(vGr.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      rowArea.Properties.ImageIndex := -1;
      rowArea.Styles.Content := stNormal;
      rowArea.Styles.Header := stNormal;
    end;
end;

procedure TfrmMain.rowIsslEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var i : Integer;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmIssl, frmIssl);
      frmIssl.DoShowForm(strID);
      try
        frmIssl.ShowModal;
        if frmIssl.ModalResult = mrOk then
          begin
            strID := '';
            strName := '';
            rowIssl.Tag := 1;
            for i := 0 to frmIssl.tv.DataController.RowCount-1 do
              begin
                if frmIssl.VCHECK.DataBinding.DataController.Values[i, frmIssl.VCHECK.Index] = 1 then
                  begin
                    strID := strID+IntToStr(frmIssl.VID.DataBinding.DataController.Values[i, frmIssl.VID.Index])+',';
                    strName := strName+frmIssl.VNAME.DataBinding.DataController.Values[i, frmIssl.VNAME.Index]+',';
                  end;
              end;
            strID := copy(strID, 1, Length(strID)-1);
            strName := copy(strName, 1, Length(strName)-1);
            TcxButtonEdit(vgr.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vgr.InplaceEditor).EditingText := strName;
            TcxButtonEdit(vgr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          end;
      finally
        frmIssl.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      rowIssl.Tag := -1;
      strID := '';
      strName := '';
      TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(vGr.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
    end; 
end;

procedure TfrmMain.rowKemEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetKem, frmSetKem);
      try
        frmSetKem.ShowModal;
        if frmSetKem.ModalResult = mrOk then
          begin
            rowKem.Tag := frmSetKem.ods.FieldByName('fk_id').AsInteger;
            TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vGr.InplaceEditor).EditingText := frmSetKem.ods.FieldByName('fc_name').AsString;
            TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            if rowKem.Tag = -1 then
              begin
                rowKem.Properties.ImageIndex := -1;
                rowKem.Styles.Content := stNormal;
                rowKem.Styles.Header := stNormal;
              end else
              begin
                rowKem.Properties.ImageIndex := 4;
                rowKem.Styles.Content := stBold;
                rowKem.Styles.Header := stBold;
              end;
          end;
      finally
        frmSetKem.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      rowKem.Tag := -1;
      TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(vGr.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      rowKem.Properties.ImageIndex := -1;
      rowKem.Styles.Content := stNormal;
      rowKem.Styles.Header := stNormal;
    end;
end;

procedure TfrmMain.rowKorEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowKor.Properties.Value = -1 then
    begin
      rowKor.Properties.ImageIndex := -1;
      rowKor.Styles.Content := stNormal;
      rowKor.Styles.Header := stNormal;
    end else
    begin
      rowKor.Properties.ImageIndex := 4;
      rowKor.Styles.Content := stBold;
      rowKor.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowMatEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  i : integer;
  s : string;
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetChar, frmSetChar);
      frmSetChar.DoShowForm('ORGAN_PATANATOM');
      frmSetChar.TVCHAR.OptionsSelection.MultiSelect := true;
      try
        frmSetChar.ShowModal;
        if frmSetChar.ModalResult = mrOK then
          begin
            SetLength(FArrHarMaterial,0);
            s := '';
            for I := 0 to frmSetChar.TVCHAR.Controller.SelectedRecordcount - 1 do
             begin
               SetLength(FArrHarMaterial,length(FArrHarMaterial)+1);
               FArrHarMaterial[high(FArrHarMaterial)] := frmSetChar.TVCHAR.Controller.SelectedRecords[i].Values[frmSetChar.grdbtvID.Index];
               s := s + frmSetChar.TVCHAR.Controller.SelectedRecords[i].Values[frmSetChar.VNAME.Index] + ';';
             end;
            rowMat.Tag := frmSetChar.ods.FieldByName('fk_id').AsInteger;
            TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vGr.InplaceEditor).EditingText := s;//frmSetChar.ods.FieldByName('fc_name').AsString;
            TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            VIEWKOLMAT.Visible := True;
            if rowMat.Tag = -1 then
              begin
                rowMat.Properties.ImageIndex := -1;
                rowMat.Styles.Content := stNormal;
                rowMat.Styles.Header := stNormal;
              end else
              begin
                rowMat.Properties.ImageIndex := 4;
                rowMat.Styles.Content := stBold;
                rowMat.Styles.Header := stBold;
              end;
          end;
      finally
        frmSetChar.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      rowMat.Tag := -1;
      SetLength(FArrHarMaterial,0);
      TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(vGr.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      VIEWKOLMAT.Visible := False;
      rowMat.Properties.ImageIndex := -1;
      rowMat.Styles.Content := stNormal;
      rowMat.Styles.Header := stNormal;
    end;
end;

procedure TfrmMain.rowOplEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowOpl.Properties.Value = -1 then
    begin
      rowOpl.Properties.ImageIndex := -1;
      rowOpl.Styles.Content := stNormal;
      rowOpl.Styles.Header := stNormal;
    end else
    begin
      rowOpl.Properties.ImageIndex := 4;
      rowOpl.Styles.Content := stBold;
      rowOpl.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowOsobEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetChar, frmSetChar);
      frmSetChar.DoShowForm('DESCRIPTION_PATANATOM'); 
      frmSetChar.TVCHAR.OptionsSelection.MultiSelect := false;     
      try
        frmSetChar.ShowModal;
        if frmSetChar.ModalResult = mrOK then
          begin
            rowOsob.Tag := frmSetChar.ods.FieldByName('fk_id').AsInteger;
            TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vGr.InplaceEditor).EditingText := frmSetChar.ods.FieldByName('fc_name').AsString;
            TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            if rowOsob.Tag = -1 then
              begin
                rowOsob.Properties.ImageIndex := -1;
                rowOsob.Styles.Content := stNormal;
                rowOsob.Styles.Header := stNormal;
              end else
              begin
                rowOsob.Properties.ImageIndex := 4;
                rowOsob.Styles.Content := stBold;
                rowOsob.Styles.Header := stBold;
              end;
          end;
      finally
        frmSetChar.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      rowOsob.Tag := -1;
      TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(vGr.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      rowOsob.Properties.ImageIndex := -1;
      rowOsob.Styles.Content := stNormal;
      rowOsob.Styles.Header := stNormal;
    end;
end;

procedure TfrmMain.rowOtdelEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetOtdel, frmSetOtdel);
      try
        frmSetOtdel.ShowModal;
        if frmSetOtdel.ModalResult = mrOk then
          begin
            rowOtdel.Tag := frmSetOtdel.ods.FieldByName('fk_id').AsInteger;
            TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vGr.InplaceEditor).EditingText := frmSetOtdel.ods.FieldByName('fc_name').AsString;
            TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            if rowOtdel.Tag = -1 then
              begin
                rowOtdel.Properties.ImageIndex := -1;
                rowOtdel.Styles.Content := stNormal;
                rowOtdel.Styles.Header := stNormal;
              end else
              begin
                rowOtdel.Properties.ImageIndex := 4;
                rowOtdel.Styles.Content := stBold;
                rowOtdel.Styles.Header := stBold;
              end;
          end;
      finally
        frmSetOtdel.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      rowOtdel.Tag := -1;
      TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(vGr.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      rowOtdel.Properties.ImageIndex := -1;
      rowOtdel.Styles.Content := stNormal;
      rowOtdel.Styles.Header := stNormal;
    end;
end;

procedure TfrmMain.rowPacEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSearch, frmSearch);
      try
        frmSearch.ShowModal;
        if frmSearch.ModalResult = mrOk then
          begin
            rowPac.Tag := frmSearch.odsPac.FieldByName('FK_ID').AsInteger;
            TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vGr.InplaceEditor).EditingText := frmSearch.odsPac.FieldByName('FIO').AsString;
            TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          end;
      finally
        frmSearch.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      rowPac.Tag := -1;
      TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(vGr.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(vGr.InplaceEditor).Properties.ViewStyle := vsHideCursor;
    end;
end;

procedure TfrmMain.rowProjEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowProj.Properties.Value = -1 then
    begin
      rowProj.Properties.ImageIndex := -1;
      rowProj.Styles.Content := stNormal;
      rowProj.Styles.Header := stNormal;
    end else
    begin
      rowProj.Properties.ImageIndex := 4;
      rowProj.Styles.Content := stBold;
      rowProj.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowTypePacEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowTypePac.Properties.Value = null then
    begin
      rowTypePac.Properties.ImageIndex := -1;
      rowTypePac.Styles.Content := stNormal;
      rowTypePac.Styles.Header := stNormal;
    end else
    begin
      rowTypePac.Properties.ImageIndex := 4;
      rowTypePac.Styles.Content := stBold;
      rowTypePac.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.rowUrgEditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowUrg.Properties.Value = -1 then
    begin
      rowUrg.Properties.ImageIndex := -1;
      rowUrg.Styles.Content := stNormal;
      rowUrg.Styles.Header := stNormal;
    end else
    begin
      rowUrg.Properties.ImageIndex := 4;
      rowUrg.Styles.Content := stBold;
      rowUrg.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.tmrCheckApplicationTimer(Sender: TObject);
var Wnd               : hWnd;
    buff              : array[0..127] of Char;
    i, j, iDel        : Integer;
begin
  Application.ProcessMessages;
  if not(tmrCheckApplication.Enabled) then exit;
  iDel:=0;
  for i:=0 to Length(arFIO)-1 do
  begin
    Wnd := GetWindow(Handle, gw_HWndFirst);
    while Wnd <> 0 do
    begin
      if (Wnd <> Application.Handle) and (GetWindow(Wnd, gw_Owner) = 0) then
        begin
          GetWindowText(Wnd, buff, sizeof(buff));
          if StrPas(buff) = arFIO[i-iDel] then
            begin
              if IsWindowVisible(Wnd) then
              begin
                  for j:=i-iDel to Length(arFIO)-2 do
                  begin
                    arFIO[j]:=arFio[j+1];
                  end;
                  SetLength(arFIO,Length(arFIO)-1);
                  Inc(iDel);
                  if Length(arFIO) = 0 then
                  begin
                    tmrCheckApplication.Enabled := False;
                    Screen.Cursor:=crDefault;
                    aOpenMK.Enabled:=True;
                    Exit;
                  end;
                  Break;
              end;
            end;
        end;
      Wnd := GetWindow(Wnd, gw_hWndNext);
    end;
  end;
end;

procedure TfrmMain.vGrEditorRow1EditPropertiesEditValueChanged(Sender: TObject);
begin
  if rowPat.Properties.Value = 0 then
    begin
      rowPat.Properties.ImageIndex := -1;
      rowPat.Styles.Content := stNormal;
      rowPat.Styles.Header := stNormal;
    end else
    begin
      rowPat.Properties.ImageIndex := 4;
      rowPat.Styles.Content := stBold;
      rowPat.Styles.Header := stBold;
    end;
end;

end.
