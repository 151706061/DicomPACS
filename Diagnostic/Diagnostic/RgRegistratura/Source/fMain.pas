unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, ImgList, ActnList, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, StdCtrls, cxSplitter, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, ExtCtrls, ComCtrls, ToolWin, Registry, Jpeg, jvDbUtils, Menus, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  cxGridExportLink, cxTextEdit, cxContainer, cxCheckBox, frxClass, frxDBSet,
  Clipbrd, cxImageComboBox, dxPScxGrid6Lnk, 
  cxDropDownEdit, cxCalendar, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, JclFileUtils, cxRadioGroup, dxSkinsdxBarPainter, dxBar,
  dxBarExtItems, cxBarEditItem, uGlobalConst, SMMainAPI, cxLabel,
  cxInplaceContainer, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue,
  Medotrade;

type
  TfrmMain = class(TForm)
    alMain: TActionList;
    aClose: TAction;
    aRefresh: TAction;
    aCancel: TAction;
    aInfo: TAction;
    aEditNaz: TAction;
    ilMain: TImageList;
    os: TOracleSession;
    dsList: TDataSource;
    odsList: TOracleDataSet;
    odsListFK_ID: TFloatField;
    dsKab: TDataSource;
    odsKab: TOracleDataSet;
    paKab: TPanel;
    cxGrKab: TcxGrid;
    TVKab: TcxGridDBTableView;
    VNAME: TcxGridDBColumn;
    cxGrKabLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    Panel1: TPanel;
    cxGr: TcxGrid;
    TVList: TcxGridDBTableView;
    TVListFIO: TcxGridDBColumn;
    TVListDATEROJD: TcxGridDBColumn;
    TVListAGE: TcxGridDBColumn;
    TVListDS: TcxGridDBColumn;
    TVListDATERUN: TcxGridDBColumn;
    TVListNAZ: TcxGridDBColumn;
    TVListPARAM: TcxGridDBColumn;
    TVSEX: TcxGridDBColumn;
    TVSTATE: TcxGridDBColumn;
    TVTIME_ISL: TcxGridDBColumn;
    cxGrLevel1: TcxGridLevel;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    N2: TMenuItem;
    al: TActionList;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    aPrint: TAction;
    sdPopUp: TSaveDialog;
    stRep: TcxStyleRepository;
    cxStyle1: TcxStyle;
    odsListFK_SMID: TFloatField;
    odsListFD_NAZ: TDateTimeField;
    odsListFD_RUN: TDateTimeField;
    odsListFK_PACID: TFloatField;
    odsListFK_NAZSOSID: TFloatField;
    odsListFK_ISPOLID: TFloatField;
    odsListVRACHFIO: TStringField;
    odsListFIOPAC: TStringField;
    odsListFD_ROJD: TDateTimeField;
    odsListAGE: TFloatField;
    odsListSEX: TStringField;
    odsListFC_NAME: TStringField;
    odsListFC_DIAG: TStringField;
    odsListPARAM: TStringField;
    odsListPEPLID: TFloatField;
    odsListSTATE: TStringField;
    odsListTIME_ISL: TStringField;
    odsListFK_ROOMID: TIntegerField;
    aSearch: TAction;
    aNaprav: TAction;
    odsListIS_AMBULANCE: TFloatField;
    TVVIDLECH: TcxGridDBColumn;
    odsListVIDLECH: TStringField;
    TVFK_NAZTYPE: TcxGridDBColumn;
    odsListFK_NAZTYPEID: TFloatField;
    aDelete: TAction;
    odsListFK_VRACHID: TFloatField;
    TVOTDEL: TcxGridDBColumn;
    odsListOTDEL: TStringField;
    TVListDATENAZ: TcxGridDBColumn;
    frxDBPrintList: TfrxDBDataset;
    TVSOS: TcxGridDBColumn;
    N3: TMenuItem;
    aCopyFIO: TAction;
    TVREANIM: TcxGridDBColumn;
    ilreanim: TImageList;
    odsListIS_REANIM: TFloatField;
    odsListNUMBERISSL: TStringField;
    odsListNUMBERPROTOCOL: TStringField;
    VNUMBERPROTOCOL: TcxGridDBColumn;
    frxPrintList: TfrxReport;
    odsListISSL_TARGET: TStringField;
    VCOMPANY: TcxGridDBColumn;
    odsListCOMPANY: TStringField;
    VUCHASTOK: TcxGridDBColumn;
    odsListUCHASTOK: TStringField;
    pmPrint: TPopupMenu;
    MenuItem1: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    actPrintFio: TAction;
    actPrintDateNaz: TAction;
    odsList_SortFIO: TOracleDataSet;
    odsList_SortDateNaz: TOracleDataSet;
    N4: TMenuItem;
    actPrintDez: TAction;
    odsPrintDez: TOracleDataSet;
    odsListDEZ: TFloatField;
    pmTVKAB: TPopupMenu;
    MenuItem2: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    aTextKab: TAction;
    aWebKab: TAction;
    aXMLKab: TAction;
    aXLSKab: TAction;
    aPrintKab: TAction;
    frxRepKab: TfrxReport;
    frxDBKab: TfrxDBDataset;
    aZakl: TAction;
    odsListFD_NAZ_STR: TStringField;
    odsListFD_RUN_STR: TStringField;
    VCOUNTTUB: TcxGridDBColumn;
    odsListCNTTUB: TFloatField;
    ilCntTub: TImageList;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarButton13: TdxBarButton;
    dxBarDockControl2: TdxBarDockControl;
    BMBar2: TdxBar;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    paDate: TPanel;
    p1: TPanel;
    p2: TPanel;
    p3: TPanel;
    p4: TPanel;
    p5: TPanel;
    p6: TPanel;
    p7: TPanel;
    blWeeks: TButton;
    blMon: TButton;
    brWeeks: TButton;
    brMon: TButton;
    pMonth: TPanel;
    cxPrOtmena: TcxBarEditItem;
    dxdeDate: TcxBarEditItem;
    cxDateText: TcxStyle;
    aHide: TAction;
    aShow: TAction;
    frxListBlanks: TfrxReport;
    frxDBListBlanks: TfrxDBDataset;
    dxBarButton15: TdxBarButton;
    aPrintBlanks: TAction;
    odsBlanks: TOracleDataSet;
    VListZAKL1: TcxGridDBColumn;
    VListZAKL2: TcxGridDBColumn;
    odsListRESUME1: TStringField;
    odsListRESUME2: TStringField;
    aSysInfo: TAction;
    aCorrectNumFlu: TAction;
    stSumDoza: TcxStyle;
    odsCntOut: TOracleDataSet;
    bbEditNaz: TdxBarLargeButton;
    N5: TMenuItem;
    aAddTalonInfo: TAction;
    N7: TMenuItem;
    odsPrintDezFD_NAZ_STR: TStringField;
    odsPrintDezFD_RUN_STR: TStringField;
    odsPrintDezFIOPAC: TStringField;
    odsPrintDezSEX: TStringField;
    odsPrintDezFD_ROJD: TDateTimeField;
    odsPrintDezOTDEL: TStringField;
    odsPrintDezFC_NAME: TStringField;
    odsPrintDezFC_DIAG: TStringField;
    odsPrintDezSTATE: TStringField;
    odsPrintDezISSL_TARGET: TStringField;
    odsPrintDezFK_NAZSOSID: TFloatField;
    odsPrintDezFK_ID: TFloatField;
    odsList_SortFIOFK_ID: TFloatField;
    odsList_SortFIOFK_NAZSOSID: TFloatField;
    odsList_SortFIOFD_NAZ_STR: TStringField;
    odsList_SortFIOFD_RUN_STR: TStringField;
    odsList_SortFIOFIOPAC: TStringField;
    odsList_SortFIOSEX: TStringField;
    odsList_SortFIOFD_ROJD: TDateTimeField;
    odsList_SortFIOOTDEL: TStringField;
    odsList_SortFIOFC_NAME: TStringField;
    odsList_SortFIOFC_DIAG: TStringField;
    odsList_SortFIOSTATE: TStringField;
    odsList_SortFIOISSL_TARGET: TStringField;
    odsList_SortDateNazFK_ID: TFloatField;
    odsList_SortDateNazFK_NAZSOSID: TFloatField;
    odsList_SortDateNazFD_NAZ_STR: TStringField;
    odsList_SortDateNazFD_RUN_STR: TStringField;
    odsList_SortDateNazFIOPAC: TStringField;
    odsList_SortDateNazSEX: TStringField;
    odsList_SortDateNazFD_ROJD: TDateTimeField;
    odsList_SortDateNazOTDEL: TStringField;
    odsList_SortDateNazFC_NAME: TStringField;
    odsList_SortDateNazFC_DIAG: TStringField;
    odsList_SortDateNazSTATE: TStringField;
    odsList_SortDateNazISSL_TARGET: TStringField;
    odsListARCHIVED: TStringField;
    Vfc_an: TcxGridDBColumn;
    odsListfc_type: TStringField;
    VFK_NAZSOSID: TcxGridDBColumn;
    aPrintZaklTalon: TAction;
    bbPrintZakl: TdxBarButton;
    aPrintZaklTalonPac: TAction;
    bbPrintZaklPac: TdxBarButton;
    aReportRentgen: TAction;
    bbReportRentgen: TdxBarButton;
    procedure odsKabBeforeOpen(DataSet: TDataSet);
    procedure odsKabAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aInfoExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure odsListAfterScroll(DataSet: TDataSet);
    procedure aEditNazExecute(Sender: TObject);
    procedure blMonClick(Sender: TObject);
    procedure blWeeksClick(Sender: TObject);
    procedure p1Click(Sender: TObject);
    procedure p2Click(Sender: TObject);
    procedure p3Click(Sender: TObject);
    procedure p4Click(Sender: TObject);
    procedure p5Click(Sender: TObject);
    procedure p6Click(Sender: TObject);
    procedure p7Click(Sender: TObject);
    procedure brWeeksClick(Sender: TObject);
    procedure brMonClick(Sender: TObject);
    procedure TVListCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure N2Click(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aSearchExecute(Sender: TObject);
    procedure aNapravExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure TVListDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure TVKabDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TVListMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TVListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure frxPrintListGetValue(const VarName: String; var Value: Variant);
    procedure aCopyFIOExecute(Sender: TObject);
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure actPrintFioExecute(Sender: TObject);
    procedure actPrintDateNazExecute(Sender: TObject);
    procedure odsList_SortFIOBeforeOpen(DataSet: TDataSet);
    procedure odsList_SortDateNazBeforeOpen(DataSet: TDataSet);
    procedure actPrintDezExecute(Sender: TObject);
    procedure odsPrintDezBeforeOpen(DataSet: TDataSet);
    procedure TVListCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure aTextKabExecute(Sender: TObject);
    procedure aWebKabExecute(Sender: TObject);
    procedure aXMLKabExecute(Sender: TObject);
    procedure aXLSKabExecute(Sender: TObject);
    procedure aPrintKabExecute(Sender: TObject);
    procedure frxRepKabGetValue(const VarName: string; var Value: Variant);
    procedure aZaklExecute(Sender: TObject);
    procedure cxPrOtmenaPropertiesEditValueChanged(Sender: TObject);
    procedure dxdeDateChange(Sender: TObject);
    procedure aHideExecute(Sender: TObject);
    procedure aShowExecute(Sender: TObject);
    procedure aPrintBlanksExecute(Sender: TObject);
    procedure frxListBlanksGetValue(const VarName: string; var Value: Variant);
    procedure odsBlanksBeforeOpen(DataSet: TDataSet);
    procedure aSysInfoExecute(Sender: TObject);
    procedure aCorrectNumFluExecute(Sender: TObject);
    procedure aAddTalonInfoExecute(Sender: TObject);
    procedure Vfc_anGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure aPrintZaklTalonExecute(Sender: TObject);
    procedure aReportRentgenExecute(Sender: TObject);
  private
    get_norma_parent : Integer;
    sSortType : String;
    FileVersion : String;
    get_pr_pat : String;
    procedure DoRefreshSmidConst;
    procedure CheckEnabledButons;
    procedure DateChange;
    procedure DoPrintJournal(sType : string; pDataSet : TOracleDataSet = nil);
    { Private declarations }
  public
    nEditDaysOtdel : Integer; // кол-во дней для особого редактирования по отделению 
    Russian : HKL;
    get_id_profilaktika : Integer;
    get_doc_ambul, get_doc_ambuldp : Integer;
    get_xray_mrt : Integer;
    MedotradeSign : string;
    GET_DB_NAME : string; // имя БД (объекта) из TSMINI
    DB_NAME : string;//добавил Мельников 2015.11.05, дублярует потому что GET_DB_NAME 5 лет
    // выдавала не верный результат и на нее уже многое завязано на разных объектах
    bIsAdmin : Integer; // входит ли пользователь в группу "Администраторы" (1 - входит, 0 - нет)
    GET_PASS_REGISTRATOR : Integer; // Статус "зачтено регистратором"
    GET_PROPISKAID : Integer; // Тип адреса 61 по регистрации
    get_registid : Integer; // Тип адреса 63 фактического проживания
    GET_SYSTEMDATE : TDate;
    sSotrFIO : String;
    sCompanyName_4Rep : String;
    sOtdelName_4Rep : String;
    GET_SYSDATE_4REP : String;
    GET_COUNT_PAC : Integer;
    pSOTRID : Integer;
    pAPPSOTRID : Integer;
    pOTDELID : Integer; // ID Отделения (TOTDEL.FK_ID)
    GET_REGISTRATOR_FLUORO : Integer;
    idNazToDrag : Integer;
    idKabToDrag : Integer;
    idStatusToDrag : Integer;
    GET_XRAY_MRTKAB : Integer;
    GET_ISSL_FLU : Integer;
    GET_XRAY_MAMMOGRAF : Integer;
    get_norma : Integer;
    get_sum_doza, get_kolvo_raspred : Integer;
    get_ambtalon_xray, get_show_work, get_def_konsult, get_def_thismk, get_show_agreepac, get_agree_pacient, get_show_onhand,
    get_show_addtaloninfo : String;
    Update : Boolean;
    IDNaz : Integer;
    procedure DoShowForm;
    procedure ChangeColVisibility;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  get_nazcancel, get_vipnaz, get_labvip, get_nazplan, get_nevip, get_recomend, get_nazextra, get_neyav,
  get_rad_gamma, get_rad_petct, get_radio_otdel,GET_XRAYS_OTDEL, rgreg_hide_last_fluoro,
  USE_ONE_ACCESSIONNUMBER : Integer;
    rgreg_peredvig_apparat_fluoro : integer;

implementation

uses fPacInfo, fOtmena, fEditNaz, fSearch, fRegistrAmbPac, fRegistrAmbPacFlu, uGlobals,
     fProsmotrZakl, fProsmotrZaklFlu, fSysInfo, fSetLastFluNum, fAddTalonInfo,
     fNaprRad, fRegistRad, udbtableutils;
{$R *.dfm}

function WinExecAndWait32(FileName: string; Visibility: integer): integer; //15.02.03
var
  zAppName: array[0..512] of char;
  zCurDir: array[0..255] of char;
  WorkDir: string;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  StrPCopy(zAppName, FileName);
  GetDir(0, WorkDir);
  StrPCopy(zCurDir, FileName);
  FillChar(StartupInfo, Sizeof(StartupInfo), #0);
  StartupInfo.cb := Sizeof(StartupInfo);
  StartupInfo.hStdInput := 23999;

  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;

  if not CreateProcess(nil,
        zAppName, { указатель командной строки }
        nil, { указатель на процесс атрибутов безопасности }
        nil, { указатель на поток атрибутов безопасности }
        false, { флаг родительского обработчика }
        CREATE_NEW_CONSOLE or { флаг создания }
        NORMAL_PRIORITY_CLASS,
        nil, { указатель на новую среду процесса }
        nil, { указатель на имя текущей директории }
        StartupInfo, { указатель на STARTUPINFO }
        ProcessInfo) { указатель на PROCESS_INF }
  then Result := -1
  else begin
    Result := ProcessInfo.dwProcessId;
  end;
end;

procedure TfrmMain.ChangeColVisibility;
begin
 { if USE_ONE_ACCESSIONNUMBER=1 then
  begin
    Vfc_an.Visible := True ;
    Vfc_an.VisibleForCustomization := True ;
    VNUMBERPROTOCOL.Visible :=  False ;
    VNUMBERPROTOCOL.VisibleForCustomization :=  False ;
  end else begin   }

    if odsKab.FieldByName('is_flu').AsInteger = 1 then
    begin
      VNUMBERPROTOCOL.Caption := '№ записи';
//      Vfc_an.Caption := '№ записи';
      aPrintBlanks.Visible := True;
      aPrintBlanks.Visible := bIsAdmin = 1;
      VListZAKL1.Visible := True;
      VListZAKL2.Visible := True;
    end else
    begin
      VNUMBERPROTOCOL.Caption := '№ иссл.';
//      Vfc_an.Caption := '№ иссл.';
      aPrintBlanks.Visible := False;
      VListZAKL1.Visible := False;
      VListZAKL2.Visible := False;
    end;
    
    Vfc_an.Visible := False ;
    Vfc_an.VisibleForCustomization := False ;
    VNUMBERPROTOCOL.Visible :=  True ;
    VNUMBERPROTOCOL.VisibleForCustomization :=  True ;
 // end;
end;

procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
    Reg : TRegIniFile;
    id, vClrGrid, vConstClrGrid : Integer;
begin
  ods := TOracleDataSet.Create(nil);
  Reg := TRegIniFile.Create;
  try
    DoRefreshSmidConst;
    pAPPSOTRID := StrToInt(paramstr(1));
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_SOTRID, ASU.DO_VRACHFIO(FK_SOTRID) AS SOTRFIO, '+#13+
                    '        ASU.PKG_SMINI.READSTRING (''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME, '+#13+

                    '        asu.pkg_smini.readstring(''XRAY'', ''USE_ONE_ACCESSIONNUMBER'', ''0'') as USE_ONE_ACCESSIONNUMBER, '+#13+

                    '        (SELECT FC_NAME '+#13+
                    '           FROM ASU.TOTDEL '+#13+
                    '          WHERE FK_ID = (SELECT FK_OTDID FROM ASU.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME, '+#13+
                    '        ASU.GET_ADMINS_FOR_XRAY(FK_SOTRID) AS IS_ADMIN '+#13+
                    '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;

    if not TryStrToInt(ods.FieldByName('USE_ONE_ACCESSIONNUMBER').AsString,USE_ONE_ACCESSIONNUMBER) then
      USE_ONE_ACCESSIONNUMBER := 0;

    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    sCompanyName_4Rep := ods.FieldByName('COMPANYNAME').AsString;
    sOtdelName_4Rep := ods.FieldByName('OTDELNAME').AsString;
    sSotrFIO := ods.FieldByName('SOTRFIO').AsString;
    bIsAdmin := ods.FieldByName('IS_ADMIN').AsInteger;
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' SELECT FK_OTDELID FROM ASU.TSOTR WHERE FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pSOTRID);
    ods.Open;
    pOTDELID := ods.FieldByName('FK_OTDELID').AsInteger;
// -- особое редактирование
    nEditDaysOtdel := 0;
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fc_value from asu.tsmini where fc_section = ''XRAY'' and fc_key = :pfc_key ';
    ods.DeclareAndSet('pfc_key', otString, 'РЕДАКТИРОВАНИЕ_'+IntToStr(pOTDELID));
    ods.Open;
    if ods.RecordCount > 0 then
      nEditDaysOtdel := StrToInt(ods.FieldByName('fc_value').AsString);

    odsKab.AfterScroll := nil;
    odsKab.Open;
    Reg.RootKey:=HKEY_CURRENT_USER;
    Reg.OpenKey('\Software\Softmaster\RgRegistr\ID_SOTR'+IntToStr(pSOTRID), True);
// - показывать отмененные
  id := Reg.ReadInteger('\Software\Softmaster\RgRegistr\ID_SOTR'+IntToStr(pSOTRID), 'ID_OTMENA', 0);
  case id of
   1: cxPrOtmena.EditValue := 1;
   0: cxPrOtmena.EditValue := 0;  
  end;
  cxPrOtmenaPropertiesEditValueChanged(nil);
// - кабинет
  id := Reg.ReadInteger('\Software\Softmaster\RgRegistr\ID_SOTR'+IntToStr(pSOTRID), 'ID_KABINET', 0);
  if id <> 0 then
    odsKab.Locate('FK_ID', id, []);
  aPrintBlanks.Visible := (bIsAdmin = 1) and (odsKab.FieldByName('is_flu').AsInteger = 1);    
  odsKab.AfterScroll := odsKabAfterScroll;
  dxdeDate.EditValue := GET_SYSTEMDATE;
  frmMain.Caption := '';
  frmMain.Caption := 'АРМ РЕГИСТРАТОРА('+FileVersion+'). '+'Пользователь: '+sSotrFIO+ '; КАБИНЕТ: '+odsKab.FieldByName('FC_NAME').AsString;
  MedotradeSign := ReadMedotradeSign;
  TVList.StoreToRegistry('\SoftWare\SoftMaster\RgRegistr\TVListVrach_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'TVList');
  TVList.RestoreFromRegistry('\SoftWare\SoftMaster\RgRegistr\TVListVrach_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'TVList');
  //
  vConstClrGrid:=1; // если нужно еще раз очистить колонки grid - изменить значение !!!
  vClrGrid := Reg.ReadInteger('\Software\Softmaster\RgRegistr\ID_SOTR'+IntToStr(pSOTRID), 'IS_CLEAR_FMAIN_TVLIST_GRID', 0);
  if vClrGrid<>vConstClrGrid then
  begin
    TVList.RestoreFromRegistry('\SoftWare\SoftMaster\RgRegistr\TVListVrach_'+ '_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TVList');
    ChangeColVisibility;
    Reg.WriteInteger('\Software\Softmaster\RgRegistr\ID_SOTR'+IntToStr(pSOTRID), 'IS_CLEAR_FMAIN_TVLIST_GRID',vConstClrGrid);
  end;
  //
  finally
    ods.Free;
    Reg.Free;
  end;
  ChangeColVisibility;
end;

procedure TfrmMain.dxdeDateChange(Sender: TObject);
begin
  DateChange;
  aRefreshExecute(nil);
end;

procedure TfrmMain.odsKabBeforeOpen(DataSet: TDataSet);
begin
  odsKab.SetVariable('PSOTR', pSOTRID);
end;

procedure TfrmMain.odsKabAfterScroll(DataSet: TDataSet);
begin
  aRefreshExecute(Self);
  frmMain.Caption := '';
  frmMain.Caption := 'АРМ "Регистратор"('+FileVersion+'). '+'Пользователь: '+sSotrFIO+ '; Кабинет: '+odsKab.FieldByName('FC_NAME').AsString;

  ChangeColVisibility;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из приложения ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    action := caFree
  else
    action := caNone;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile;
begin
  Reg := TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    if not Reg.OpenKey('\Software\Softmaster\RgRegistr\', FALSE) then
      begin
        Reg.CreateKey('\Software\Softmaster\RgRegistr');
      end;
    try
      Reg.WriteInteger('\Software\Softmaster\RgRegistr'+'\ID_SOTR'+IntToStr(pSOTRID), 'ID_KABINET', odsKab.FieldByName('FK_ID').AsInteger);
      Reg.WriteInteger('\Software\Softmaster\RgRegistr'+'\ID_SOTR'+IntToStr(pSOTRID), 'ID_OTMENA',  cxPrOtmena.EditValue);
    except
    end;
  finally
    Reg.Free;
  end;
  TVList.StoreToRegistry('\SoftWare\SoftMaster\RgRegistr\TVListVrach_' + IntToStr(pSOTRID), TRUE, [], 'TVList');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  {$IFDEF USE_NEW_AUTH}
    GetSession(os, 'ASU');
  {$ELSE}
    os.LogonUsername := 'ASU';
    os.LogonPassword := 'ASU';
    os.LogonDatabase := 'ASU';
    os.Connected:=True;
  {$ENDIF}
  russian := LoadKeyboardLayout('00000419', 0);
  Application.HelpFile:=ExtractFilePath(Application.ExeName)+'Spiski.chm'; // !!! не работает help по F1

  try
    aPrintZaklTalon.Visible := fileexists(extractfilepath(application.exename)+'print_zakl_talons_in_day.fr3');
    aPrintZaklTalonPac.Visible := aPrintZaklTalon.Visible;
    aReportRentgen.Visible := fileexists(extractfilepath(application.exename)+'report_rentgen.fr3');
  except

  end;
end;

procedure TfrmMain.DoPrintJournal(sType: string; pDataSet : TOracleDataSet = nil);
var id : Integer;
    ods : TOracleDataSet;
begin
  id := pDataSet.FieldByName('FK_ID').AsInteger;
  sSortType := sType;
  if (pDataSet <> nil) and (pDataSet <> odsList) then
    begin
	    pDataSet.Close;
	    pDataSet.Open;
	    if cxPrOtmena.EditValue = 1 then
		    begin
			    pDataSet.Filtered := False;
		    end else
		    begin
			    pDataSet.Filtered := True;
			    pDataSet.Filter := 'not ((fk_nazsosid = '+IntToStr(GET_NAZCANCEL)+') or (fk_nazsosid = '+IntToStr(GET_NEYAV)+'))';
		    end;
    end;
	frxDBPrintList.DataSet := pDataSet;

  if pDataSet = odsList then
    aRefreshExecute(nil);

  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select to_char(sysdate, ''dd.mm.yyyy hh24:mi'') as systemdate from dual ';
    ods.Open;
    GET_SYSDATE_4REP := ods.FieldByName('systemdate').AsString;
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select count(distinct fk_pacid) as cnt '+#13+
                    '   from asu.tnazis '+#13+
			              '  where fk_roomid = :pfk_roomid '+#13+
			              '    and fd_run >= :pfd_date and fd_run < to_date(:pfd_date)+1 ';
    if cxPrOtmena.EditValue <> 1 then
      begin
        ods.SQL.Add('and fk_nazsosid not in (asu.get_neyav, asu.get_nazcancel)');
      end;
    if pDataSet = odsPrintDez then
      begin
        ods.SQL.Add('and exists (select 1 from asu.tib where fk_pacid = tnazis.fk_id and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''DEZURSTVO''))');
      end;
     
    ods.DeclareAndSet('PFK_ROOMID', otInteger, odsKab.FieldByName('FK_ID').AsInteger);
    ods.DeclareAndSet('PFD_DATE', otDate, dxdeDate.EditValue); //dxdeDate.Date);
    ods.Open;
    GET_COUNT_PAC := ods.FieldByName('CNT').AsInteger;
	  if (odsKab.FieldByName('FK_ID').AsInteger = GET_XRAY_MAMMOGRAF) or (odsKab.FieldByName('is_flu').AsInteger = 1) then
      begin
        TfrxMemoView(frxPrintList.FindObject('memSexCap')).Text := 'Цель';
        TfrxMemoView(frxPrintList.FindObject('memSex')).Text := '[frxDBPrintList."ISSL_TARGET"]';
		    frxPrintList.ShowReport;
	    end else
      begin
        TfrxMemoView(frxPrintList.FindObject('memSexCap')).Text := 'Пол';
        TfrxMemoView(frxPrintList.FindObject('memSex')).Text := '[frxDBPrintList."SEX"]';
		    frxPrintList.ShowReport;
      end;
  finally
    pDataSet.Locate('FK_ID', id, []);
    ods.Free;
  end;
end;

procedure TfrmMain.DoRefreshSmidConst;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT asu.get_nazcancel, asu.get_vipnaz, asu.get_labvip, asu.get_registrator_fluoro, asu.get_nevip, '+#13+
                    '        asu.get_recomend, asu.get_nazplan, asu.get_neyav, asu.get_nazextra, asu.GET_PASS_REGISTRATOR, '+#13+
                    '        asu.get_propiskaid, asu.get_registid, asu.get_xray_mrtkab, asu.get_xray_mammograf, asu.get_xray_mrt, '+#13+
                    '        asu.get_rad_gamma, asu.get_rad_petct, asu.get_radio_otdel, '+#13+
                    '        trunc(sysdate) as systemdate, asu.doc_ambul, asu.doc_ambdp, '+#13+
                    '        (select fk_id from asu.tsmid where fc_synonim = ''ISSLED_FLUROGR'') as get_issl_flu, '+#13+
                    '        ASU.PKG_SMINI.READSTRING(''CONFIG'', ''DB_NAME'', ''H'') AS DB_NAME, '+#13+
                    '        (select fk_id from asu.tsmid where fc_synonim = ''TARGET_PROFILAKTIKA'') as get_id_profilaktika,'+#13+
                    '        asu.GET_XRAYS_OTDEL,'+#13+
                    '        asu.rgreg_hide_last_fluoro '+#13+
                    '   FROM DUAL ';
    ods.Close;
    try
      ods.Open;
      get_nazcancel := ods.FieldByName('GET_NAZCANCEL').AsInteger;
      get_vipnaz := ods.FieldByName('GET_VIPNAZ').AsInteger;
      get_labvip := ods.FieldByName('GET_LABVIP').AsInteger;
      get_registrator_fluoro := ods.FieldByName('GET_REGISTRATOR_FLUORO').AsInteger;
      get_nazplan := ods.FieldByName('GET_NAZPLAN').AsInteger;
      get_nevip := ods.FieldByName('GET_NEVIP').AsInteger;
      get_recomend := ods.FieldByName('GET_RECOMEND').AsInteger;
      get_nazextra := ods.FieldByName('GET_NAZEXTRA').AsInteger;
      get_xray_mrtkab := ods.FieldByName('GET_XRAY_MRTKAB').AsInteger;
      get_issl_flu := ods.FieldByName('GET_ISSL_FLU').AsInteger;
      get_systemdate := ods.FieldByName('SYSTEMDATE').AsDateTime;
      get_xray_mammograf := ods.FieldByName('GET_XRAY_MAMMOGRAF').AsInteger;
      get_neyav := ods.FieldByName('GET_NEYAV').AsInteger;
      GET_PROPISKAID := ods.FieldByName('GET_PROPISKAID').AsInteger;
      get_registid := ods.FieldByName('get_registid').AsInteger;
      GET_PASS_REGISTRATOR := ods.FieldByName('GET_PASS_REGISTRATOR').AsInteger;
      GET_DB_NAME := ods.FieldByName('GET_PASS_REGISTRATOR').AsString;//работает с 2009 года - не трогаем чтобы не сломать
      DB_NAME := ods.FieldByName('DB_NAME').AsString;//не удалять,добавил Мельников 2015.11.05, дублярует потому что GET_DB_NAME 5 лет
      // выдавала не верный результат и на нее уже многое завязано на разных объектах
      get_xray_mrt := ods.FieldByName('get_xray_mrt').AsInteger;
      get_doc_ambul := ods.FieldByName('doc_ambul').AsInteger;
      get_doc_ambuldp := ods.FieldByName('doc_ambdp').AsInteger;
      get_id_profilaktika := ods.FieldByName('get_id_profilaktika').AsInteger;
      get_rad_gamma := ods.FieldByName('get_rad_gamma').AsInteger;
      get_rad_petct := ods.FieldByName('get_rad_petct').AsInteger;
      get_radio_otdel := ods.FieldByName('get_radio_otdel').AsInteger;
      GET_XRAYS_OTDEL := ods.FieldByName('GET_XRAYS_OTDEL').AsInteger;
      rgreg_hide_last_fluoro := ods.FieldByName('rgreg_hide_last_fluoro').AsInteger;
    except on e :eoracleerror do
      begin
        application.messagebox(pchar('Произошла ошибка! Обратитесь к администратору!'+#13#10+e.Message),'Ошибка',mb_iconerror);
      end;
    end;

    rgreg_peredvig_apparat_fluoro := udbtableutils.TDBUtils.GetConstantDef('rgreg_peredvig_apparat_fluoro',os,-1);
    
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fc_value, fc_key from asu.tsmini where fc_section = ''XRAY'' order by fk_id '  ;
    ods.Open;
    ods.First;
    while not ods.Eof do
      begin
        if ods.FieldByName('fc_key').AsString = 'AGREE_PACIENT' then
          begin
            get_agree_pacient := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'FLU_NORMA' then
          begin
            get_norma := ods.FieldByName('fc_value').AsInteger;
          end;
        if ods.FieldByName('fc_key').AsString = 'PRO_PAT' then
          begin
            get_pr_pat := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'AMBTALON_XRAY' then
          begin
            get_ambtalon_xray := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_DEFAULT_KONSULT' then
          begin
            get_def_konsult := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_SHOW_WORK' then
          begin
            get_show_work := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_DEFAULT_THISMK' then
          begin
            get_def_thismk := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'SHOW_AGREE_PACIENT' then // Показывать кнопку "Согласие пациента"
          begin
            get_show_agreepac := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_SHOW_ONHAND' then // Показывать "от руки" в форме Отмена
          begin
            get_show_onhand := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'XRAY_SUMDOZA' then // Эффективная годовая доза
          begin
            get_sum_doza := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
        if ods.FieldByName('fc_key').AsString = 'KOLVODAYS_RASPRED' then // Кол-во дней для распределения
          begin
            get_kolvo_raspred := StrToInt(ods.FieldByName('fc_value').AsString);
          end;
       if ods.FieldByName('fc_key').AsString = 'XRAY_SHOW_ADDTALONINFO' then // Показывать "Добавить данные по талону"
         begin
           get_show_addtaloninfo := ods.FieldByName('fc_value').AsString;
         end;
        ods.Next;
      end;

    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' select fk_owner from asu.tshablon_xray_zakl where fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, get_norma);
    ods.Open;
    get_norma_parent := ods.FieldByName('fk_owner').AsInteger;
  finally
    ods.Free;
  end;

end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
var id : Integer;
begin
  odsList.DisableControls;
  id := odsList.FieldByName('FK_ID').AsInteger;
  odsList.Close;
  odsList.SetVariable('PFK_ROOMID', odsKab.FieldByName('FK_ID').AsInteger);
  odsList.SetVariable('PFD_DATE', dxdeDate.EditValue); 
  odsList.Open;
  odsList.Locate('FK_ID', id, []);
  odsList.EnableControls;
end;

procedure TfrmMain.aReportRentgenExecute(Sender: TObject);
var
  path, sPacid: String;
  Operation, FileName, Parameters: String;
  AppHandle: THandle;
begin
  path := ExtractFilePath(ParamStr(0));
  FileName := PChar(Path + 'frviewer4.exe');
  Parameters := PChar(' /file="' + path + 'report_rentgen.fr3" /param:pdate=' + dateToStr(dxdedate.EditValue) +
   ' /param:proomid=' + odsKab.fieldbyname('fk_id').asstring);
  Parameters := Parameters + C_OCIDLL;

  path := PChar(Path);

  AppHandle := WinExecAndWait32(PChar(path + 'frviewer4.exe ' + Parameters), 1);
  GetInputMapAppFromApp(AppHandle);
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.aInfoExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmPacInfo, frmPacInfo);
  try
    frmPacInfo.DoShowPacInfo(odsList.FieldByName('FK_PACID').AsInteger,
                             odsList.FieldByName('PEPLID').AsInteger,
                             odsList.FieldByName('OTDEL').AsString);
    frmPacInfo.ShowModal;
  finally
    frmPacInfo.Free;
  end;
end;

procedure TfrmMain.aAddTalonInfoExecute(Sender: TObject);
var ods : TOracleDataSet;
    oq : TOracleQuery;
    idTalon, idInsur, WorkMode : Integer;
begin
  ods := TOracleDataSet.Create(nil);
  Screen.Cursor := crHourGlass;
  try
    ods.Session := os;
    ods.SQL.Text := ' select t1.fk_id, t1.fn_sos, t1.fk_insuranceid, t1.fd_opened, fk_rezhimid, asu.do_vrachfio(t1.fk_sotrid) as sotrfio, fk_sotrid, '+#13+
                    '        fk_servplace, asu.get_smidname(fk_servplace) as servplace, t1.fd_naprdate, t1.fc_naprnum, '+#13+
                    '        fk_reason, asu.get_smidname(fk_reason) as reason '+#13+
                    '   from asu.tambtalon t1, asu.tambtalon_naz t2 '+#13+
                    '  where t1.fk_id = t2.fk_talonid '+#13+
                    '    and t2.fk_nazid = :pfk_nazid ';
    ods.DeclareAndSet('pfk_nazid', otInteger, odsList.FieldByName('fk_id').AsInteger);
    ods.Open;
    idTalon := ods.FieldByName('fk_id').AsInteger;
    idInsur := ods.FieldByName('fk_insuranceid').AsInteger;
    if ods.RecordCount = 0 then
      begin
        MessageDlg('Внимание!'+#13+#10+'Данное назначение не привязано ни к одному талону!', mtInformation, [mbOK], 0);
        exit;
      end;
    if ods.FieldByName('fn_sos').AsInteger = 1 then
      begin
        MessageDlg('Внимание!'+#13+#10+'Талон данного назначения подписан!'+#13+#10+'Вы не можете ничего изменить!', mtInformation, [mbOK], 0);
        exit;
      end;
// -- проверка на вид оплаты ОМС
//  odsOms := TOracleDataSet.Create(nil);
//  try
//    if get_db_name = 'H' then // только для ОКБ г. Ханты-Мансийск
//      begin
//        odsOms.Session := os;
//        odsOms.SQL.Text := ' select fc_synonim '+#13+
//                           '   from asu.tsmid '+#13+
//                           '  where fk_id = (select fk_smid from asu.tib '+#13+
//                           '                  where fk_pacid = :pfk_pacid '+#13+
//                           '                    and fk_smid in (select fk_id from asu.tsmid start with fc_synonim = ''AMBTALON_OPL'' connect by prior fk_id = fk_owner)) ';
//        odsOms.DeclareAndSet('pfk_pacid', otInteger, odsList.FieldByName('fk_id').AsInteger);
//        odsOms.Open;
//        if odsOms.FieldByName('fc_synonim').AsString <> 'TAL_OPLOMS' then
//          begin
//            WorkMode := 1;
//          end else
//          begin
            WorkMode := 1;
//          end;
//      end;
//  finally
//    odsOms.Free;
//  end;
    Application.CreateForm(TfrmAddTalonInfo, frmAddTalonInfo);
//-- Режим работы
    if WorkMode = 1 then
      begin
        frmAddTalonInfo.Caption := 'Данные амбулаторного талона. Режим просмотра';
        frmAddTalonInfo.rowTypeMedHelp.Properties.Options.ShowEditButtons := eisbNever;
        frmAddTalonInfo.rowRezim.Properties.Options.ShowEditButtons := eisbNever;
        frmAddTalonInfo.rowTypeTalon.Properties.Options.ShowEditButtons := eisbNever;
      end else
      begin
        frmAddTalonInfo.Caption := 'Данные амбулаторного талона';
        frmAddTalonInfo.rowTypeMedHelp.Properties.Options.ShowEditButtons := eisbAlways;
        frmAddTalonInfo.rowRezim.Properties.Options.ShowEditButtons := eisbAlways;
        frmAddTalonInfo.rowTypeTalon.Properties.Options.ShowEditButtons := eisbAlways;
      end;
    frmAddTalonInfo.rowNat.Properties.EditProperties.Buttons[0].Visible := WorkMode = 2;
    frmAddTalonInfo.rowNat.Options.Focusing := WorkMode = 2;
    frmAddTalonInfo.rowSocStatus.Properties.EditProperties.Buttons[0].Visible := WorkMode = 2;
    frmAddTalonInfo.rowSocStatus.Options.Focusing := WorkMode = 2;
    frmAddTalonInfo.rowSotr.Properties.EditProperties.Buttons[0].Visible := WorkMode = 2;
    frmAddTalonInfo.rowSotr.Options.Focusing := WorkMode = 2;
    frmAddTalonInfo.rowPolis.Properties.EditProperties.Buttons[0].Visible := WorkMode = 2;
    frmAddTalonInfo.rowPolis.Options.Focusing := WorkMode = 2;
    frmAddTalonInfo.rowPlace.Properties.EditProperties.Buttons[0].Visible := WorkMode = 2;
    frmAddTalonInfo.rowPlace.Options.Focusing := WorkMode = 2;
    frmAddTalonInfo.rowNapr.Properties.EditProperties.Buttons[0].Visible := WorkMode = 2;
    frmAddTalonInfo.rowNapr.Options.Focusing := WorkMode = 2;
    frmAddTalonInfo.rowReason.Properties.EditProperties.Buttons[0].Visible := WorkMode = 2;
    frmAddTalonInfo.rowReason.Options.Focusing := WorkMode = 2;
    frmAddTalonInfo.rowStandart.Properties.EditProperties.Buttons[0].Visible := WorkMode = 2;
    frmAddTalonInfo.rowStandart.Options.Focusing := WorkMode = 2;
    frmAddTalonInfo.rowTypeMedHelp.Properties.Options.Editing := WorkMode = 2;
    frmAddTalonInfo.rowTypeMedHelp.Options.Focusing := WorkMode = 2;
    frmAddTalonInfo.rowRezim.Properties.Options.Editing := WorkMode = 2;
    frmAddTalonInfo.rowRezim.Options.Focusing := WorkMode = 2;
    frmAddTalonInfo.rowTypeTalon.Properties.Options.Editing := WorkMode = 2;
    frmAddTalonInfo.rowTypeTalon.Options.Focusing := WorkMode = 2;

    frmAddTalonInfo.aSave.Enabled := WorkMode = 2;
    frmAddTalonInfo.aSave.Visible := WorkMode = 2;
//-- Дата открытия талона
    frmAddTalonInfo.rowDate.Properties.Value := ods.FieldByName('fd_opened').AsDateTime;
//-- Дата и номер направления
    if DateTimeToStr(ods.FieldByName('fd_naprdate').AsDateTime) = '30.12.1899' then
      frmAddTalonInfo.merDateNum.Properties.Editors[0].Value := null
    else
      frmAddTalonInfo.merDateNum.Properties.Editors[0].Value := ods.FieldByName('fd_naprdate').AsDateTime;
    frmAddTalonInfo.merDateNum.Properties.Editors[1].Value := ods.FieldByName('fc_naprnum').AsString;
//-- дата вып. услуги и наименование услуги
    frmAddTalonInfo.rowNameUsl.Properties.Value := odsList.FieldByName('fc_name').AsString;
    frmAddTalonInfo.rowDateUsl.Properties.Value := odsList.FieldByName('fd_run_str').AsString;
//-- режим
    frmAddTalonInfo.rowRezim.Properties.Value := ods.FieldByName('fk_rezhimid').AsInteger;
    frmAddTalonInfo.odsRezim.Locate('fk_id', ods.FieldByName('fk_rezhimid').AsInteger, []);
//-- место обслуживания
    frmAddTalonInfo.rowPlace.Properties.Value := ods.FieldByName('servplace').AsString;
    frmAddTalonInfo.rowPlace.Tag := ods.FieldByName('fk_servplace').AsInteger;
//-- цель посещения
    frmAddTalonInfo.rowReason.Properties.Value := ods.FieldByName('reason').AsString;
    frmAddTalonInfo.rowReason.Tag := ods.FieldByName('fk_reason').AsInteger;
//-- сотрудник, открывший талон
    frmAddTalonInfo.rowSotr.Properties.Value := ods.FieldByName('sotrfio').AsString;
    frmAddTalonInfo.rowSotr.Tag := ods.FieldByName('fk_sotrid').AsInteger;
//-- гражданство
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_GRAGZ'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, odsList.FieldByName('peplid').AsInteger);
    ods.Open;
    frmAddTalonInfo.rowNat.Properties.Value := ods.FieldByName('smname').AsString;
    frmAddTalonInfo.rowNat.Tag := ods.FieldByName('fk_smid').AsInteger;
//-- социальный статус
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_SOC_POL'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, odsList.FieldByName('peplid').AsInteger);
    ods.Open;
    frmAddTalonInfo.rowSocStatus.Properties.Value := ods.FieldByName('smname').AsString;
    frmAddTalonInfo.rowSocStatus.Tag := ods.FieldByName('fk_smid').AsInteger;
//-- направившее учреждение
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''PD_NAPRAVIV_YCH'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, idTalon);
    ods.Open;
    frmAddTalonInfo.rowNapr.Properties.Value := ods.FieldByName('smname').AsString;
    frmAddTalonInfo.rowNapr.Tag := ods.FieldByName('fk_smid').AsInteger;
//-- Стандарт мед помощи
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''CPD_STANDARTGROUP'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, idTalon);
    ods.Open;
    frmAddTalonInfo.rowStandart.Properties.Value := ods.FieldByName('smname').AsString;
    frmAddTalonInfo.rowStandart.Tag := ods.FieldByName('fk_smid').AsInteger;
    if frmAddTalonInfo.rowStandart.Tag = 0 then
      begin
        ods.Close;
        ods.DeleteVariables;
        ods.SQL.Text := ' select fk_id, fc_name from asu.tsmid where fc_synonim = ''SG_FEDERAL'' ';
        ods.Open;
        frmAddTalonInfo.rowStandart.Properties.Value := ods.FieldByName('fc_name').AsString;
        frmAddTalonInfo.rowStandart.Tag := ods.FieldByName('fk_id').AsInteger;
      end;    
//-- Тип вида мед помощи
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''TYPE_V_MU'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, idTalon);
    ods.Open;
    frmAddTalonInfo.rowTypeMedHelp.Properties.Value := ods.FieldByName('fk_smid').AsInteger;
    frmAddTalonInfo.odsTypeMedHelp.Locate('fk_id', ods.FieldByName('fk_smid').AsInteger, []);
//-- Тип талона
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fk_smid, asu.get_smidname(fk_smid) as smname '+#13+
                    '   from asu.tib '+#13+
                    '  where fk_pacid = :pfk_pacid '+#13+
                    '    and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''TALON_TYPE_CREATE'') ';
    ods.DeclareAndSet('pfk_pacid', otInteger, idTalon);
    ods.Open;
    frmAddTalonInfo.rowTypeTalon.Properties.Value := ods.FieldByName('fk_smid').AsInteger;
    frmAddTalonInfo.odsTypeTalon.Locate('fk_id', ods.FieldByName('fk_smid').AsInteger, []);
    if (frmAddTalonInfo.rowTypeTalon.Properties.Value = 0) and (GET_DB_NAME = 'SK') then
      begin
        ods.Close;
        ods.DeleteVariables;
        ods.SQL.Text := ' select fk_id, fc_name '+#13+
                        '   from asu.tsmid '+#13+
                        '  where fk_owner = (select fk_id from asu.tsmid where fc_synonim = ''TALON_TYPE_CREATE'') '+#13+
                        '    and fk_default = 1 ';
        ods.Open;
        frmAddTalonInfo.rowTypeTalon.Properties.Value := ods.FieldByName('fk_id').AsInteger;
        frmAddTalonInfo.odsTypeTalon.Locate('fk_id', ods.FieldByName('fk_id').AsInteger, []);
      end;
    frmAddTalonInfo.merDateNum.Visible := frmAddTalonInfo.odsTypeTalon.FieldByName('fc_synonim').AsString = 'TALON_TYPE_CREATE_NAPR';
    try
      frmAddTalonInfo.merFIOMK.Properties.Editors[0].Value := odsList.FieldByName('fiopac').AsString;
      frmAddTalonInfo.merDateAgeSex.Properties.Editors[0].Value := odsList.FieldByName('fd_rojd').AsDateTime;
      frmAddTalonInfo.merDateAgeSex.Properties.Editors[1].Value := odsList.FieldByName('age').AsInteger;
      frmAddTalonInfo.merDateAgeSex.Properties.Editors[2].Value := odsList.FieldByName('sex').AsString;
      frmAddTalonInfo.DoShowForm(idInsur, odsList.FieldByName('fk_pacid').AsInteger);
      Screen.Cursor := crDefault;
      frmAddTalonInfo.ShowModal;
      if frmAddTalonInfo.ModalResult = mrOk then // -- >> сохранение
        begin
          oq := TOracleQuery.Create(nil);
          oq.Session := os;
          oq.Cursor := crSQLWait;
          try
//-- Направившее учреждение
            oq.DeleteVariables;
            oq.SQL.Text := ' merge into asu.tib using dual on '+#13+
                           '   (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''PD_NAPRAVIV_YCH'')) '+#13+
                           ' when not matched then '+#13+
                           '   insert(fk_smid, fk_smeditid, fk_vrachid, fk_pacid) '+#13+
                           '   values(:pfk_smid, (select fk_id from asu.tsmid where fc_synonim = ''PD_NAPRAVIV_YCH''), :pfk_vrachid, :pfk_pacid) '+#13+
                           ' when matched then '+#13+
                           '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid '+#13+
                           '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''PD_NAPRAVIV_YCH'') ';
            oq.DeclareAndSet('pfk_smid', otInteger, frmAddTalonInfo.rowNapr.Tag);
            oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
            oq.DeclareAndSet('pfk_pacid', otInteger, idTalon);
            oq.Execute;
//-- Гражданство
            oq.DeleteVariables;
            oq.SQL.Text := ' merge into asu.tib using dual on '+#13+
                           '   (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_GRAGZ'')) '+#13+
                           ' when not matched then '+#13+
                           '   insert(fk_smid, fk_smeditid, fk_vrachid, fk_pacid) '+#13+
                           '   values(:pfk_smid, (select fk_id from asu.tsmid where fc_synonim = ''LD_GRAGZ''), :pfk_vrachid, :pfk_pacid) '+#13+
                           ' when matched then '+#13+
                           '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid '+#13+
                           '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_GRAGZ'') ';
            oq.DeclareAndSet('pfk_pacid', otInteger, odsList.FieldByName('peplid').AsInteger);
            oq.DeclareAndSet('pfk_smid', otInteger, frmAddTalonInfo.rowNat.Tag);
            oq.DeclareAndSet('pfk_vrachid', otInteger, idTalon);
            oq.Execute;
//-- Социальный статус
            oq.DeleteVariables;
            oq.SQL.Text := ' merge into asu.tib using dual on '+#13+
                           '   (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_SOC_POL'')) '+#13+
                           ' when not matched then '+#13+
                           '   insert(fk_smid, fk_smeditid, fk_vrachid, fk_pacid) '+#13+
                           '   values(:pfk_smid, (select fk_id from asu.tsmid where fc_synonim = ''LD_SOC_POL''), :pfk_vrachid, :pfk_pacid) '+#13+
                           ' when matched then '+#13+
                           '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid '+#13+
                           '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''LD_SOC_POL'') ';
            oq.DeclareAndSet('pfk_pacid', otInteger, odsList.FieldByName('peplid').AsInteger);
            oq.DeclareAndSet('pfk_smid', otInteger, frmAddTalonInfo.rowSocStatus.Tag);
            oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
            oq.Execute;
//-- Стандарт медицинской помощи
            oq.DeleteVariables;
            oq.SQL.Text := ' merge into asu.tib using dual on '+#13+
                           '   (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''CPD_STANDARTGROUP'')) '+#13+
                           ' when not matched then '+#13+
                           '   insert(fk_smid, fk_smeditid, fk_vrachid, fk_pacid) '+#13+
                           '   values(:pfk_smid, (select fk_id from asu.tsmid where fc_synonim = ''CPD_STANDARTGROUP''), :pfk_vrachid, :pfk_pacid) '+#13+
                           ' when matched then '+#13+
                           '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid '+#13+
                           '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''CPD_STANDARTGROUP'') ';
            oq.DeclareAndSet('pfk_pacid', otInteger, idTalon);
            oq.DeclareAndSet('pfk_smid', otInteger, frmAddTalonInfo.rowStandart.Tag);
            oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
            oq.Execute;
//-- Тип вида медицинской помощи
            oq.DeleteVariables;
            oq.SQL.Text := ' merge into asu.tib using dual on '+#13+
                           '   (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''TYPE_V_MU'')) '+#13+
                           ' when not matched then '+#13+
                           '   insert(fk_smid, fk_smeditid, fk_vrachid, fk_pacid) '+#13+
                           '   values(:pfk_smid, (select fk_id from asu.tsmid where fc_synonim = ''TYPE_V_MU''), :pfk_vrachid, :pfk_pacid) '+#13+
                           ' when matched then '+#13+
                           '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid '+#13+
                           '   where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''TYPE_V_MU'') ';
            oq.DeclareAndSet('pfk_pacid', otInteger, idTalon);
            oq.DeclareAndSet('pfk_smid', otInteger, frmAddTalonInfo.rowTypeMedHelp.Properties.Value);
            oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
            oq.Execute;
//-- Тип талона
            oq.DeleteVariables;
            oq.SQL.Text := ' merge into asu.tib using dual on '+#13+
                           '   (fk_pacid = :pfk_pacid and fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = ''TALON_TYPE_CREATE'')) '+#13+
                           ' when not matched then '+#13+
                           '   insert(fk_smid, fk_smeditid, fk_vrachid, fk_pacid) '+#13+
                           '   values(:pfk_smid, (select fk_owner from asu.tsmid where fk_id = :pfk_smid), :pfk_vrachid, :pfk_pacid) '+#13+
                           ' when matched then '+#13+
                           '   update set fk_smid = :pfk_smid, fk_vrachid = :pfk_vrachid '+#13+
                           '    where fk_pacid = :pfk_pacid and fk_smeditid = (select fk_owner from asu.tsmid where fk_id = :pfk_smid) ';
            oq.DeclareAndSet('pfk_smid', otInteger, frmAddTalonInfo.rowTypeTalon.Properties.Value);
            oq.DeclareAndSet('pfk_vrachid', otInteger, pSOTRID);
            oq.DeclareAndSet('pfk_pacid', otInteger, idTalon);
            oq.Execute;
// Талон
            oq.DeleteVariables;
            oq.SQL.Text := ' update asu.tambtalon '+#13+
                           '    set fk_servplace = :pfk_servplace, fk_reason = :pfk_reason, '+#13+
                           '        fk_insuranceid = :pfk_insuranceid, fk_sotrid = :pfk_sotrid, '+#13+
                           '        fk_rezhimid = :pfk_rezhimid, fd_naprdate = :pfd_naprdate, fc_naprnum = :pfc_naprnum '+#13+
                           '  where fk_id = :pfk_id ';
            oq.DeclareAndSet('pfk_servplace', otInteger, frmAddTalonInfo.rowPlace.Tag);
            oq.DeclareAndSet('pfk_reason', otInteger, frmAddTalonInfo.rowReason.Tag);
            oq.DeclareAndSet('pfk_id', otInteger, idTalon);
            oq.DeclareAndSet('pfk_insuranceid', otInteger, frmAddTalonInfo.rowPolis.Tag);
            oq.DeclareAndSet('pfk_rezhimid', otInteger, frmAddTalonInfo.rowRezim.Properties.Value);
            oq.DeclareAndSet('pfd_naprdate', otDate, frmAddTalonInfo.merDateNum.Properties.Editors[0].Value);
            oq.DeclareAndSet('pfc_naprnum', otString, frmAddTalonInfo.merDateNum.Properties.Editors[1].Value);
            oq.DeclareAndSet('pfk_sotrid', otInteger, frmAddTalonInfo.rowSotr.Tag);
            oq.Execute;
          finally
            os.Commit;
            oq.Free;
          end;
        end;
    finally
      frmAddTalonInfo.Free;
    end;
  finally
    Screen.Cursor := crDefault;  
    ods.Free;
  end;
end;

procedure TfrmMain.aCancelExecute(Sender: TObject);
var oq : TOracleQuery;
    ods : TOracleDataSet;
begin
  Application.CreateForm(TfrmOtmena, frmOtmena);
  frmOtmena.DoShowfrmOtmena(odsList.FieldByName('FK_ID').AsInteger, pSOTRID);
  frmOtmena.ShowModal;
  if frmOtmena.ModalResult = MrOK then
    begin
      oq := TOracleQuery.Create(nil);
      ods := TOracleDataSet.Create(nil);
      try
        oq.Session := os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' UPDATE ASU.TNAZIS SET FK_ISPOLID = :pFK_ISPOLID, FK_NAZSOSID = :pFK_NAZSOSID WHERE FK_ID = :pFK_ID ';
        oq.DeclareAndSet('pFK_ISPOLID', otInteger, pSOTRID);
        oq.DeclareAndSet('pFK_NAZSOSID', otInteger, GET_NAZCANCEL);
        oq.DeclareAndSet('pFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        oq.Execute;
        os.Commit;
        oq.DeleteVariables;
        oq.SQL.Text := ' INSERT INTO ASU.VRES(FK_SMID, FD_INS, FC_RES, FC_TYPE, FK_VRACHID, FK_PACID, FK_NAZID, FK_SOS) '+
                       ' VALUES(:pFK_SMID, SYSDATE, :pFC_RES, ''TEXT'', :pFK_VRACHID, :pFK_PACID, :pFK_NAZID, :pFK_SOS) ';
        oq.DeclareAndSet('pFK_SMID', otInteger, odsList.FieldByName('FK_SMID').AsInteger);
        oq.DeclareAndSet('pFC_RES', otString, frmOtmena.cxOtmena.Text+';'+frmOtmena.cxOtmenaHand.Text);
        oq.DeclareAndSet('pFK_VRACHID', otInteger, pSOTRID);
        oq.DeclareAndSet('pFK_PACID', otInteger, odsList.FieldByName('FK_PACID').AsInteger);
        oq.DeclareAndSet('pFK_NAZID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        oq.DeclareAndSet('pFK_SOS', otInteger, GET_NAZCANCEL);
        oq.Execute;
        os.Commit;

        ods.Session := os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' select fk_talonid '+#13+
                        '   from asu.tambtalon_naz '+#13+
                        '  where fk_talonid = (select fk_talonid from asu.tambtalon_naz where fk_nazid = :pfk_nazid) ';
        ods.DeclareAndSet('pfk_nazid', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        ods.Open;
        if ods.RecordCount = 1 then
          begin
            oq.DeleteVariables;
            oq.SQL.Text := ' update asu.tambtalon '+#13+
                           '    set fn_sos = 2, fd_closed = trunc(sysdate),  '+#13+
                           '        fk_result = stat.pkg_statutil.get_smidid(''TALON_NE_YAVKA''), '+#13+
                           '        fk_sotrclosed = :pSotr '+#13+
                           '  where fk_id = :pfk_id ';
            oq.DeclareAndSet('pSotr', otInteger, frmMain.pSOTRID);
            oq.DeclareAndSet('pfk_id', otInteger, ods.FieldByName('fk_talonid').AsInteger);
            oq.Execute;
            os.Commit;
          end;
        RefreshQuery(odsList);
      finally
        oq.Free;
        ods.Free;
      end;
    end;
  frmOtmena.Free;
end;

procedure TfrmMain.odsListAfterScroll(DataSet: TDataSet);
begin
  CheckEnabledButons;
end;

procedure TfrmMain.odsList_SortDateNazBeforeOpen(DataSet: TDataSet);
begin
  odsList_SortDateNaz.SetVariable('PFK_ROOMID', odsKab.FieldByName('FK_ID').AsInteger);
  odsList_SortDateNaz.SetVariable('PFD_DATE', dxdeDate.EditValue);
end;

procedure TfrmMain.odsList_SortFIOBeforeOpen(DataSet: TDataSet);
begin
  odsList_SortFIO.SetVariable('PFK_ROOMID', odsKab.FieldByName('FK_ID').AsInteger);
  odsList_SortFIO.SetVariable('PFD_DATE', dxdeDate.EditValue);
end;

procedure TfrmMain.odsPrintDezBeforeOpen(DataSet: TDataSet);
begin
  odsPrintDez.SetVariable('PFK_ROOMID', odsKab.FieldByName('FK_ID').AsInteger);
  odsPrintDez.SetVariable('PFD_DATE', dxdeDate.EditValue);
end;

procedure TfrmMain.CheckEnabledButons;
begin
  aCancel.Enabled := (odsList.RecordCount <> 0) and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> GET_NAZCANCEL)
                      and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> GET_VIPNAZ) and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> GET_LABVIP);
  aInfo.Enabled := (odsList.RecordCount <> 0);
  aEditNaz.Enabled := (odsList.RecordCount <> 0)
                       and ((odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_NEVIP) or (odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_RECOMEND));
  aNaprav.Enabled := (odsList.RecordCount <> 0) and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> GET_NAZCANCEL)
                      and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> GET_NEYAV);
  aDelete.Enabled := (odsList.RecordCount <> 0)
                      and ((odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_NEVIP) or (odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_RECOMEND))
                      and (odsList.FieldByName('FK_VRACHID').AsInteger = pSOTRID);
  aPrint.Enabled := odsList.RecordCount <> 0;
  aCopyFIO.Enabled := odsList.RecordCount <> 0;
  aZakl.Enabled := (odsList.RecordCount <> 0) and (odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_VIPNAZ);
  aSysInfo.Enabled := odsList.RecordCount <> 0;
  aAddTalonInfo.Visible := (get_show_addtaloninfo = '-1') and
                           (odsList.FieldByName('fk_nazsosid').AsInteger <> GET_NAZCANCEL) and
                           (odsList.FieldByName('fk_nazsosid').AsInteger <> GET_NEYAV) and
                           (odsList.RecordCount <> 0) and
                           (odsList.FieldByName('is_ambulance').AsInteger = 1);
  aNaprav.Enabled := (odsList.RecordCount > 0) and (odsList.FieldByName('ARCHIVED').AsInteger = 0);

  aPrintZaklTalonPac.enabled := aPrintZaklTalonPac.Visible and (odslist.recordcount > 0) and (odsList.FieldByName('fk_nazsosid').AsInteger = get_vipnaz);

end;

procedure TfrmMain.aEditNazExecute(Sender: TObject);
var oq : TOracleQuery;
    ods : TOracleDataSet;
    sUserOs, sMachine, sModule : string;
begin
  Application.CreateForm(TfrmEditNaz, frmEditNaz);
  frmEditNaz.pDateNaz := odsList.FieldByName('fd_naz').AsDateTime;
  frmEditNaz.DoShowEditNaz(odsList.FieldByName('FK_PACID').AsInteger,
                           pSOTRID,
                           odsList.FieldByName('PEPLID').AsInteger,
                           odsList.FieldByName('VRACHFIO').AsString,
                           Trunc(odsList.FieldByName('FD_RUN').AsDateTime),
                           odsList.FieldByName('FK_ROOMID').AsInteger);
  frmEditNaz.ShowModal;
  if frmEditNaz.ModalResult = MrOK then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' update asu.tnazis set fd_run = :pfd_run, fk_roomid = :pfk_roomid, fl_in_raspis = 1 where fk_id = :pfk_id ';
        oq.DeclareAndSet('PFD_RUN', otDate, StrToDateTime(DateToStr(frmEditNaz.cxdeDate.Date)+' '+FormatDateTime('hh:nn:ss', frmEditNaz.cxteTime.Time)));
        oq.DeclareAndSet('PFK_ROOMID', otInteger, frmEditNaz.cxlcKabinet.EditValue);
        oq.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        oq.Execute;

// -- узнаем параметры сессии
        ods := TOracleDataSet.Create(nil);
        try
          ods.Session := frmMain.os;
          ods.Cursor := crSQLWait;
          ods.SQL.Text := ' SELECT OSUSER, MACHINE, MODULE '+#13+
                          '   FROM V$SESSION '+#13+
                          '  WHERE AUDSID=USERENV(''SESSIONID'') ';
          ods.Open;
          sUserOs := ods.FieldByName('osuser').AsString;
          sMachine := ods.FieldByName('machine').AsString;
          sModule := ods.FieldByName('module').AsString;
        finally
          ods.Free;
        end;
// -- логирование
        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.txray_log(fc_field, fc_value, fd_date, fk_nazid, fk_sotrid, fc_osuser, fc_machine, fc_module, fc_form) '+#13+
                       ' values(''Распределение - Дата'', :pfc_value, sysdate, :pfk_nazid, :pfk_sotrid, :pfc_osuser, :pfc_machine, :pfc_module, ''frmEditNaz'') ';
        oq.DeclareAndSet('pfc_value', otString, DateToStr(frmEditNaz.cxdeDate.Date)+' '+FormatDateTime('hh:nn:ss', frmEditNaz.cxteTime.Time));
        oq.DeclareAndSet('pfk_nazid', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
        oq.DeclareAndSet('pfc_osuser', otString, sUserOs);
        oq.DeclareAndSet('pfc_machine', otString, sMachine);
        oq.DeclareAndSet('pfc_module', otString, sModule);
        oq.Execute;

        oq.DeleteVariables;
        oq.SQL.Text := ' insert into asu.txray_log(fc_field, fc_value, fd_date, fk_nazid, fk_sotrid, fc_osuser, fc_machine, fc_module, fc_form) '+#13+
                       ' values(''Распределение - Кабинет'', :pfc_value, sysdate, :pfk_nazid, :pfk_sotrid, :pfc_osuser, :pfc_machine, :pfc_module, ''frmEditNaz'') ';
        oq.DeclareAndSet('pfc_value', otString, frmEditNaz.cxlcKabinet.Text);
        oq.DeclareAndSet('pfk_nazid', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        oq.DeclareAndSet('pfk_sotrid', otInteger, frmMain.pSOTRID);
        oq.DeclareAndSet('pfc_osuser', otString, sUserOs);
        oq.DeclareAndSet('pfc_machine', otString, sMachine);
        oq.DeclareAndSet('pfc_module', otString, sModule);
        oq.Execute;

        oq.DeleteVariables;
        oq.SQL.Text := ' DECLARE '+#13+
                          '   nSMID27 NUMBER; '+#13+
                          '   Cnt27 NUMBER; '+#13+
                          ' BEGIN '+#13+
                          '   SELECT COUNT(FK_ID) INTO Cnt27 FROM TIB WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''RG_REGISTRATOR''); '+#13+
                          ' IF Cnt27 > 0 THEN '+#13+
                          '   UPDATE TIB SET FN_NUM = :pFN_NUM27, FK_VRACHID = :pFK_VRACHID, fd_date=sysdate WHERE FK_PACID = :pFK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''RG_REGISTRATOR''); '+#13+
                          ' ELSE '+#13+
                          '   SELECT FK_ID INTO nSMID27 FROM TSMID WHERE FC_SYNONIM = ''RG_REGISTRATOR''; '+#13+
                          '   INSERT INTO TIB(FK_PACID, FN_NUM, FK_SMID, FK_SMEDITID, FK_VRACHID, fd_date) VALUES(:pFK_ID, :pFN_NUM27, nSMID27, nSMID27, :pFK_VRACHID, sysdate); '+#13+
                          ' END IF; '+#13+
                          ' END; ';
        oq.DeclareAndSet('pFN_NUM27', otInteger, frmEditNaz.lcbRegistrator.EditValue);
        oq.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        oq.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
        oq.Execute;

        os.Commit;
        RefreshQuery(odsList);
      finally
        oq.Free;
      end;
    end;
  frmEditNaz.Free;
end;

procedure TfrmMain.aHideExecute(Sender: TObject);
begin
  cxSplitter1.CloseSplitter;
end;

procedure TfrmMain.DateChange;
var
 yy,mm,dd:word;
 wd:integer;
begin
	pMonth.Caption:=FormatDateTime('mmmm',dxdeDate.EditValue)+', '+(FormatDateTime('dddd',dxdeDate.EditValue));

	wd:=dayofweek(dxdeDate.EditValue);
	if wd=1 then wd:=8;

	decodeDate(dxdeDate.EditValue-wd+2,yy,mm,dd);
	p1.Caption:=inttostr(dd);

	decodeDate(dxdeDate.EditValue-wd+3,yy,mm,dd);
	p2.Caption:=inttostr(dd);

	decodeDate(dxdeDate.EditValue-wd+4,yy,mm,dd);
	p3.Caption:=inttostr(dd);

	decodeDate(dxdeDate.EditValue-wd+5,yy,mm,dd);
	p4.Caption:=inttostr(dd);

	decodeDate(dxdeDate.EditValue-wd+6,yy,mm,dd);
	p5.Caption:=inttostr(dd);

	decodeDate(dxdeDate.EditValue-wd+7,yy,mm,dd);
	p6.Caption:=inttostr(dd);

  decodeDate(dxdeDate.EditValue-wd+8,yy,mm,dd);
  p7.Caption:=inttostr(dd);

  p1.Color:=clCream;
  p2.Color:=clCream;
  p3.Color:=clCream;
  p4.Color:=clCream;
  p5.Color:=clCream;
  p6.Color:=clCream;
  p7.Color:=clCream;
  case wd-1 of
    1:p1.Color:=clSkyBlue;
    2:p2.Color:=clSkyBlue;
    3:p3.Color:=clSkyBlue;
    4:p4.Color:=clSkyBlue;
    5:p5.Color:=clSkyBlue;
    6:p6.Color:=clSkyBlue;
    7:p7.Color:=clSkyBlue;
  end;
end;

procedure TfrmMain.blMonClick(Sender: TObject);
var mm,yy,dd:word;
begin
//  decodeDate(dxdeDate.Date,yy,mm,dd);
  decodeDate(dxdeDate.EditValue,yy,mm,dd);
  if dd=31 then dd:=30;
  if ((mm=3) and (dd>28)) then dd:=28;
  if mm>1 then mm:=mm-1
   else
     begin
       mm:=12;
       yy:=yy-1;
     end;

//  dxdeDate.Date:=encodeDate(yy,mm,dd);
  dxdeDate.EditValue:=encodeDate(yy,mm,dd);
end;

procedure TfrmMain.blWeeksClick(Sender: TObject);
begin
//  dxdeDate.Date:=dxdeDate.Date-1;
  dxdeDate.EditValue:=dxdeDate.EditValue-1;
end;

procedure TfrmMain.p1Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+2;

//  wd:=dayofweek(dxdeDate.Date);
//  if wd=1 then wd:=8;
//  dxdeDate.Date:=dxdeDate.Date-wd+2;
end;

procedure TfrmMain.p2Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+3;

//  wd:=dayofweek(dxdeDate.Date);
//  if wd=1 then wd:=8;
//  dxdeDate.Date:=dxdeDate.Date-wd+3;
end;

procedure TfrmMain.p3Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+4;

//  wd:=dayofweek(dxdeDate.Date);
//  if wd=1 then wd:=8;
//  dxdeDate.Date:=dxdeDate.Date-wd+4;
end;

procedure TfrmMain.p4Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+5;

//  wd:=dayofweek(dxdeDate.Date);
//  if wd=1 then wd:=8;
//  dxdeDate.Date:=dxdeDate.Date-wd+5;
end;

procedure TfrmMain.p5Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+6;

//  wd:=dayofweek(dxdeDate.Date);
//  if wd=1 then wd:=8;
//  dxdeDate.Date:=dxdeDate.Date-wd+6;
end;

procedure TfrmMain.p6Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+7;

//  wd:=dayofweek(dxdeDate.Date);
//  if wd=1 then wd:=8;
//  dxdeDate.Date:=dxdeDate.Date-wd+7;
end;

procedure TfrmMain.p7Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+8;

//  wd:=dayofweek(dxdeDate.Date);
//  if wd=1 then wd:=8;
//  dxdeDate.Date:=dxdeDate.Date-wd+8;
end;

procedure TfrmMain.brWeeksClick(Sender: TObject);
begin
  dxdeDate.EditValue:=dxdeDate.EditValue+1;
//  dxdeDate.Date:=dxdeDate.Date+1;
end;

procedure TfrmMain.brMonClick(Sender: TObject);
var yy,mm,dd:word;
begin
//  decodeDate(dxdeDate.Date,yy,mm,dd);
  decodeDate(dxdeDate.EditValue,yy,mm,dd);
  if dd=31 then dd:=30;
  if ((mm=1) and (dd>28)) then dd:=28;
  if mm<12 then mm:=mm+1
   else
     begin
       mm:=1;
       yy:=yy+1;
     end;
  dxdeDate.EditValue:=encodeDate(yy,mm,dd);
//  dxdeDate.Date:=encodeDate(yy,mm,dd);
end;

procedure TfrmMain.TVListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var ods : TOracleDataSet;
begin
  if odsList.RecordCount <> 0 then
    begin
      if (odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_NAZCANCEL) or (odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_NEYAV) then
        begin
          Application.CreateForm(TfrmOtmena, frmOtmena);
          frmOtmena.acOk.Visible := FALSE;
          frmOtmena.GroupBox1.Visible := FALSE;
          frmOtmena.cxOtmena.Align := alClient;
          frmOtmena.acCancel.Caption := 'Закрыть';
          frmOtmena.acCancel.ImageIndex := 2;
          frmOtmena.cxOtmena.Enabled := False;
          frmOtmena.Caption := 'Обоснование отмены (просмотр)';
          ods := TOracleDataSet.Create(nil);
          try
            ods.Session := os;
            ods.Cursor := crSQLWait;
            ods.SQL.Text := ' SELECT FC_RES, '+
                            '        TO_CHAR(FD_INS, ''DD.MM.YYYY HH24:MI'') FD_INS, '+
                            '        FK_VRACHID, ASU.DO_VRACHFIO(FK_VRACHID) AS SOTRFIO '+
                            '   FROM VRES '+
                            '  WHERE FK_NAZID = :pFK_NAZID AND FK_SOS = :PFK_SOS ';
            ods.DeclareAndSet('pFK_NAZID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
            ods.DeclareAndSet('PFK_SOS', otInteger, odsList.FieldByName('FK_NAZSOSID').AsInteger);
            ods.Open;
            frmOtmena.cxOtmena.Text := 'Сотрудник:'+' '+ods.FieldByName('SOTRFIO').AsString+','+' '+
                                       'Дата:'+' '+ods.FieldByName('FD_INS').AsString+#13#10+
                                       'Обоснование отмены:'+' '+ods.FieldByName('FC_RES').AsString;
          finally
            ods.Free;
          end;
          frmOtmena.ShowModal;
          frmOtmena.Free;
        end else
        begin
          aNapravExecute(nil);
        end;
    end;
end;

procedure TfrmMain.TVListCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
 begin
  if AViewInfo.GridRecord.Values[TVSOS.Index] = GET_NAZCANCEL then
    ACanvas.Brush.Color:=RGB(251, 172, 182);
  if AViewInfo.GridRecord.Values[TVSOS.Index] = GET_NEYAV then
    ACanvas.Brush.Color:=RGB(251, 172, 182);

  if AViewInfo.GridRecord.Values[TVFK_NAZTYPE.Index] = GET_NAZEXTRA then
    begin
      ACanvas.Font.Style := [fsBold];
      ACanvas.Font.Color := RGB(253, 83, 113); 
    end;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  TVList.RestoreFromRegistry('\SoftWare\SoftMaster\RgRegistr\TVList'+'Vrach'+ '_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TVList');
  ChangeColVisibility;
end;

procedure TfrmMain.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aTextKabExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVKab.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGrKab, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGrKab, TRUE, TRUE);
end;

procedure TfrmMain.aPrintBlanksExecute(Sender: TObject);
begin
  odsBlanks.Close;
  odsBlanks.Open;
  frxListBlanks.ShowReport;
end;

procedure TfrmMain.aPrintExecute(Sender: TObject);
begin
  DoPrintJournal('Печать журнала', odsList);
end;

procedure TfrmMain.aPrintKabExecute(Sender: TObject);
var ods : TOracleDataSet;
     id : Integer;
begin
  odsKab.AfterScroll := nil;
  id := odsKab.FieldByName('FK_ID').AsInteger;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS SYSTEMDATE '+
                    '   FROM DUAL ';
    ods.Open;
    GET_SYSDATE_4REP := ods.FieldByName('SYSTEMDATE').AsString;
  finally
    ods.Free;
  end;
  frxRepKab.ShowReport;
  odsKab.Locate('FK_ID', id, []);
  odsKab.AfterScroll := odsKabAfterScroll;
end;

procedure TfrmMain.aPrintZaklTalonExecute(Sender: TObject);
var
  path, sPacid: String;
  Operation, FileName, Parameters: String;
  AppHandle: THandle;
begin
  sPacid := '-1';
  if taction(sender).tag = 1 then
   sPacid := odsList.fieldbyname('fk_pacid').AsString;
  path := ExtractFilePath(ParamStr(0));
  FileName := PChar(Path + 'frviewer4.exe');
  Parameters := PChar(' /file="' + path + 'print_zakl_talons_in_day.fr3" /param:pdate=' + dateToStr(dxdedate.EditValue) +
   ' /param:proomid=' + odsKab.fieldbyname('fk_id').asstring + ' /param:ppacid=' + sPacid);
  Parameters := Parameters + C_OCIDLL;

  path := PChar(Path);

  AppHandle := WinExecAndWait32(PChar(path + 'frviewer4.exe ' + Parameters), 1);
  GetInputMapAppFromApp(AppHandle);
end;

procedure TfrmMain.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aWebKabExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVKab.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGrKab, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGrKab, TRUE, TRUE);
end;

procedure TfrmMain.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXLSKabExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVKab.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGrKab, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGrKab, TRUE, TRUE);
end;

procedure TfrmMain.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVList.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXMLKabExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVKab.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGrKab, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGrKab, TRUE, TRUE);
end;

procedure TfrmMain.aZaklExecute(Sender: TObject);
var ods : TOracleDataSet;
begin

  if odsKab.FieldByName('is_flu').AsInteger = 1 then
    begin
      Application.CreateForm(TfrmProsmotrZaklFlu, frmProsmotrZaklFlu);
      frmProsmotrZaklFlu.rowNum.Properties.Value := odsList.FieldByName('NUMBERPROTOCOL').AsString;
      frmProsmotrZaklFlu.merFIOMK.Properties.Editors[0].Value := odsList.FieldByName('FIOPAC').AsString;
      frmProsmotrZaklFlu.merDateAgeSex.Properties.Editors[0].Value := DateTimeToStr(odsList.FieldByName('fd_rojd').AsDateTime);
      frmProsmotrZaklFlu.merDateAgeSex.Properties.Editors[1].Value := odsList.FieldByName('age').AsString;
      frmProsmotrZaklFlu.merDateAgeSex.Properties.Editors[2].Value := odsList.FieldByName('sex').AsString;
      frmProsmotrZaklFlu.rowIssl.Properties.Value := odsList.FieldByName('fc_name').AsString;
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT FK_NAZTYPEID, '+#13+
                        '        TRUNC(FD_RUN) AS FD_RUN, '+#13+
                        '        TRUNC(SYSDATE) AS SYS_DATE, '+#13+
                        '        asu.get_ib(fk_pacid) as numib, '+#13+
                        '        (SELECT ASU.DO_VRACHFIO(MAX(FN_NUM)) FROM ASU.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_VRACH1'')) AS SOTR1, '+#13+
                        '        (SELECT ASU.DO_VRACHFIO(MAX(FN_NUM)) FROM ASU.TIB WHERE FK_PACID = :PFK_ID AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''OTMETKI_FLU_VRACH2'')) AS SOTR2 '+#13+
                        '   FROM ASU.TNAZIS WHERE FK_ID = :PFK_ID ';
        ods.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        ods.Open;
        frmProsmotrZaklFlu.rowZakl1.Properties.Value := odsList.FieldByName('RESUME1').AsString;
        frmProsmotrZaklFlu.rowZakl2.Properties.Value := odsList.FieldByName('RESUME2').AsString;
        frmProsmotrZaklFlu.rowSotr1.Properties.Value := ods.FieldByName('SOTR1').AsString;
        frmProsmotrZaklFlu.rowSotr2.Properties.Value := ods.FieldByName('SOTR2').AsString;
        frmProsmotrZaklFlu.merFIOMK.Properties.Editors[1].Value := ods.FieldByName('numib').AsString;
      finally
        ods.Free;
      end;
      frmProsmotrZaklFlu.ShowModal;
      frmProsmotrZaklFlu.Free;
    end else
    begin
      Application.CreateForm(TfrmProsmotrZakl, frmProsmotrZakl);
      frmProsmotrZakl.rowNum.Properties.Value := odsList.FieldByName('NUMBERPROTOCOL').AsString;
      frmProsmotrZakl.merFIOMK.Properties.Editors[0].Value := odsList.FieldByName('FIOPAC').AsString;
      frmProsmotrZakl.merDateAgeSex.Properties.Editors[0].Value := DateTimeToStr(odsList.FieldByName('fd_rojd').AsDateTime);
      frmProsmotrZakl.merDateAgeSex.Properties.Editors[1].Value := odsList.FieldByName('age').AsString;
      frmProsmotrZakl.merDateAgeSex.Properties.Editors[2].Value := odsList.FieldByName('sex').AsString;
      frmProsmotrZakl.rowIssl.Properties.Value := odsList.FieldByName('fc_name').AsString;
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT DECODE(MAX(FC_CHAR), NULL, ''Нет заключения'', MAX(FC_CHAR)) AS ZAKL, '+#13+
                        '        asu.get_ib(:pfk_pacid) as nummk '+#13+
                        '   FROM ASU.TIB '+#13+
                        '  WHERE FK_PACID = :PFK_ID '+#13+
                        '    AND FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''XRAY_VRACH_RESUME'') ';
        ods.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        ods.DeclareAndSet('pfk_pacid', otInteger, odsList.FieldByName('FK_PACID').AsInteger);
        ods.Open;
        frmProsmotrZakl.rowZakl.Properties.Value := ods.FieldByName('ZAKL').AsString;
        frmProsmotrZakl.merFIOMK.Properties.Editors[1].Value := ods.FieldByName('nummk').AsString;
      finally
        ods.Free;
      end;
      frmProsmotrZakl.ShowModal;
      frmProsmotrZakl.Free;
    end;
end;

procedure TfrmMain.aSearchExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSearch, frmSearch);
  try
    frmSearch.DoShowfrmSearch;
    frmSearch.ShowModal;
    RefreshQuery(odsList);     
  finally
    frmSearch.Free;
  end;
end;

procedure TfrmMain.aShowExecute(Sender: TObject);
begin
  cxSplitter1.OpenSplitter;
end;

procedure TfrmMain.aSysInfoExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSysInfo, frmSysInfo);
  try
    frmSysInfo.DoShowForm(odsList.FieldByName('fk_pacid').AsInteger,
                          odsList.FieldByName('peplid').AsInteger,
                          odsList.FieldByName('fk_id').AsInteger); // NazID
    frmSysInfo.ShowModal;
  finally
    frmSysInfo.Free;
  end;
end;

procedure TfrmMain.aNapravExecute(Sender: TObject);
var SmidID, idIssl, idOwner : Integer;
    ods : TOracleDataSet; v_accnmb:string;
begin
  // проверяем fc_type на непустоту
  v_accnmb:= odsList.FieldByName('NUMBERISSL').AsString ;
  if v_accnmb = '' then
  begin
    with TOracleQuery.Create(nil) do
    try
      Session:=frmMain.os;
      SQL.Text:='select MED.SEQ_TACCESSIONNMB.NEXTVAL as nmb from dual';
      Execute;
      v_accnmb:=IntToStr(FieldAsInteger('nmb'));
      SQL.Clear; DeleteVariables;
      SQL.Text:='update asu.tnazis t set t.fc_type=:p_fc_type where t.fk_id=:p_fk_id and (t.FC_TYPE is null) ';
      DeclareAndSet('p_fc_type', otString,  v_accnmb );
      DeclareAndSet('p_fk_id',   otInteger, odsList.FieldByName('fk_id').AsInteger );
      Execute;
    finally
      Free;
    end;
  end;
// -- узнаем группу исследования
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.SQL.Text := ' select fk_owner from asu.tsmid where fk_id = :pfk_id ';
    ods.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_smid').AsInteger);
    ods.Open;
    idOwner := ods.FieldByName('fk_owner').AsInteger;
  finally
    ods.Free;
  end;
// -- открываем направление
  if (idOwner = get_rad_gamma) or (idOwner = get_rad_petct) then // для Радионуклидки
    begin
      idIssl := odsList.FieldByName('FK_ID').AsInteger;
      Application.CreateForm(TfrmRegistRad, frmRegistRad);
      frmRegistRad.DoShowForm(odsList.FieldByName('is_ambulance').AsInteger,
				  	                  odsList.FieldByName('fk_pacid').AsInteger,
					  	                odsList.FieldByName('peplid').AsInteger,
						                  '',
						                  pOtdelID,
						                  odsList.FieldByName('fk_smid').AsInteger,
                              odsKab.FieldByName('fk_id').AsInteger,
						                  odsList.FieldByName('fk_id').AsInteger,
                              odsList.FieldByName('fc_name').AsString);
      try
        frmRegistRad.ShowModal;
        if frmRegistRad.ModalResult = mrOk then
          begin
            RefreshQuery(odsList);
            odsList.Locate('FK_ID', idIssl, []);
          end;
      finally
        frmRegistRad.Free;
      end;
    end else
    begin
      if odsKab.FieldByName('is_flu').AsInteger = 1 then // для ФГ
        begin
          idIssl := odsList.FieldByName('FK_ID').AsInteger;
          SmidID := odsList.FieldByName('FK_SMID').AsInteger;
          Application.CreateForm(TfrmRegistrAmbPacFlu, frmRegistrAmbPacFlu);
          try
            frmRegistrAmbPacFlu.cxFam.Enabled := False;
            frmRegistrAmbPacFlu.cxName.Enabled := False;
            frmRegistrAmbPacFlu.cxOtch.Enabled := False;
            frmRegistrAmbPacFlu.cxNum.Enabled := False;
            frmRegistrAmbPacFlu.cxdeRojd.Enabled := False;
            frmRegistrAmbPacFlu.cxFemale.Enabled := False;
            frmRegistrAmbPacFlu.cxMale.Enabled := False;
            frmRegistrAmbPacFlu.v_fk_nazsosid := odsList.FieldByName('fk_nazsosid').AsInteger;
            frmRegistrAmbPacFlu.DoShowfrmRegistrAmbPac(odsList.FieldByName('IS_AMBULANCE').AsInteger,
				  	    	                                     odsList.FieldByName('FK_PACID').AsInteger,
					  	                                         odsList.FieldByName('PEPLID').AsInteger,
						                                           '',
						                                           pOTDELID,
						                                           SMIDID,
						                                           odsList.FieldByName('FK_ID').AsInteger);
            frmRegistrAmbPacFlu.ShowModal;
            RefreshQuery(odsList); // !!! наверное нужно делать refresh только когда modalresult = mrok
            odsList.Locate('FK_ID', idIssl, []);
          finally
            frmRegistrAmbPacFlu.Free;
          end;
        end else
        begin
          idIssl := odsList.FieldByName('FK_ID').AsInteger;
          SMIDID := odsList.FieldByName('FK_SMID').AsInteger;
          Application.CreateForm(TfrmRegistrAmbPac, frmRegistrAmbPac); // для ренгена, КТ и тд
          try
            frmRegistrAmbPac.cxFam.Enabled := False;
            frmRegistrAmbPac.cxName.Enabled := False;
            frmRegistrAmbPac.cxOtch.Enabled := False;
            frmRegistrAmbPac.cxNum.Enabled := False;
            frmRegistrAmbPac.cxdeRojd.Enabled := False;
            frmRegistrAmbPac.cxFemale.Enabled := False;
            frmRegistrAmbPac.cxMale.Enabled := False;
            frmRegistrAmbPac.DoShowfrmRegistrAmbPac(odsList.FieldByName('IS_AMBULANCE').AsInteger,
				  	                                        odsList.FieldByName('FK_PACID').AsInteger,
					                                          odsList.FieldByName('PEPLID').AsInteger,
					                                          '',
					                                          pOTDELID,
					                                          SMIDID,
					                                          odsList.FieldByName('FK_ID').AsInteger,
					                                          v_accnmb );   //  odsList.FieldByName('NUMBERISSL').AsString
            frmRegistrAmbPac.ShowModal;
            RefreshQuery(odsList);
            odsList.Locate('FK_ID', idIssl, []);
          finally
            frmRegistrAmbPac.Free;
          end;
        end;
    end;
end;

procedure TfrmMain.aDeleteExecute(Sender: TObject);
var oq : TOracleQuery;
    ods : TOracleDataSet;
begin
  if Application.MessageBox('Вы действительно хотите удалить исследование?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    begin
      oq := TOracleQuery.Create(nil);
      oq.Session := os;
      oq.Cursor := crSQLWait;
      ods := TOracleDataSet.Create(nil);
      ods.Session := os;
      ods.Cursor := crSQLWait;
      try
        oq.SQL.Text := ' delete from asu.tnazis where fk_id = :pfk_id ';
        oq.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_id').AsInteger);
        oq.Execute;
        if get_db_name = 'SK' then // -- для кардио центра проверяем выгружен ли талон, если не выгружен удаляем и талон
          begin
            ods.DeleteVariables;
            ods.Close;
            ods.SQL.Text := ' select fk_talonid from asu.tambtalon_naz where fk_nazid = :pfk_nazid ';
            ods.DeclareAndSet('pfk_nazid', otInteger, odsList.FieldByName('fk_id').AsInteger);
            ods.Open;
            odsCntOut.Close;
            odsCntOut.SetVariable('pTalonID', ods.FieldByName('fk_talonid').AsInteger);
            odsCntOut.Open;
            if odsCntOut.FieldByName('cnt_out').AsInteger = 0 then
              begin
                oq.DeleteVariables;
                oq.SQL.Text := ' delete from asu.tambtalon where fk_id = :pfk_id ';
                oq.DeclareAndSet('pfk_id', otInteger, ods.FieldByName('fk_talonid').AsInteger);
                oq.Execute;
              end;
          end;        
        os.Commit;
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' select fk_owner from asu.tsmid where fk_id = :pfk_id ';
        ods.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_smid').AsInteger);
        ods.Open;
        if ods.FieldByName('fk_owner').AsInteger = frmMain.GET_ISSL_FLU then
          begin
            oq.DeleteVariables;
            oq.SQL.Text := ' declare '+#13+
                           '   sDate varchar2(20); '+#13+
                           ' begin '+#13+
                           '   select asu.get_last_fluoro_date(:pfk_peplid, 1) into sDate from dual; '+#13+
                           '   if sDate is null then '+#13+
                           '     delete from asu.tlastfluoro where fk_peplid = :pfk_peplid; '+#13+
                           '   else '+#13+
                           '     update asu.tlastfluoro '+#13+
                           '        set fd_date = to_date(sDate, ''dd.mm.yyyy''), '+#13+
                           '            fc_num = asu.get_last_fluoro_num(:pfk_peplid) '+#13+
                           '      where fk_peplid = :pfk_peplid; '+#13+
                           '   end if; '+#13+
                           ' end; ';
            oq.DeclareAndSet('pfk_peplid', otInteger, odsList.FieldByName('peplid').AsInteger);
            oq.Execute;
            os.Commit;
          end;        
      finally
        oq.Free;
        ods.Free;
      end;
      RefreshQuery(odsList);
    end;
end;

procedure TfrmMain.TVListDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := TRUE;
  idKabToDrag := odsKab.FieldByName('FK_ID').AsInteger;
  idStatusToDrag := odsList.FieldByName('FK_NAZSOSID').AsInteger;
end;

procedure TfrmMain.TVKabDragDrop(Sender, Source: TObject; X, Y: Integer);
var oq : TOracleQuery;
begin
  if (idStatusToDrag <> GET_NEVIP) and (idStatusToDrag <> GET_RECOMEND) then
    begin
      showmessage('Вы можете перенести только исследование со статусом ''НЕ ВЫП.'' или ''РЕКОМЕНДОВАНО''!');
      odsKab.AfterScroll := nil;
      odsKab.Locate('FK_ID', idKabToDrag, []);
      odsKab.AfterScroll := odsKabAfterScroll;
      odsKabAfterScroll(odsKab);
      odsList.Locate('FK_ID', idNazToDrag, []);
      idKabToDrag := 0;
      idStatusToDrag := 0;
      exit;
    end;

  if MessageDlg('Вы назначаете исследование в '+odsKab.FieldByName('FC_NAME').AsString+'! Продолжить?', mtConfirmation, [mbOK,mbCancel], 0) = IDOk then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' UPDATE TNAZIS SET FK_ROOMID = :PFK_ROOMID WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('PFK_ROOMID', otInteger, odsKab.FieldByName('FK_ID').AsInteger);
        oq.DeclareAndSet('PFK_ID', otInteger, idNazToDrag);
        oq.Execute;
        os.Commit;
        RefreshQuery(odsList);
        odsList.Locate('FK_ID', idNazToDrag, []);
        idNazToDrag:=0;
      finally
        oq.Free;
      end;
    end else
    begin
      odsKab.AfterScroll := nil;
      odsKab.Locate('FK_ID', idKabToDrag, []);
      odsKab.AfterScroll := odsKabAfterScroll;
      odsKabAfterScroll(odsKab);
    end;
end;

procedure TfrmMain.TVListMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  idNazToDrag := odsList.FieldByName('FK_ID').AsInteger;
end;

procedure TfrmMain.Vfc_anGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  if USE_ONE_ACCESSIONNUMBER=1 then  // для хант делалось - Поддержка #30031
  begin
    // все кабинеты кроме флюорографического - колонка "№ исслед". - у пациентов в
    // статусе не вып. не должно быть номера исследования, поле должно быть пустым
//    if odsKab.FieldByName('is_flu').AsInteger <> 1 then
//    begin  // все кабинеты кроме флюорографического
//      if ( odsList.FieldByName('fk_nazsosid').AsInteger = 2 ) // у пациентов в статусе не вып.
      if ( ARecord.Values[VFK_NAZSOSID.Index] = 2 ) // у пациентов в статусе не вып.
      then
        AText := '';
//    end;
  end;
end;

procedure TfrmMain.TVListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if odsList.RecordCount <> 0 then
    begin
      if Key = VK_RETURN then
        aNapravExecute(nil);
    end;
end;

procedure TfrmMain.frxListBlanksGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'CURDATE' then Value := dxdeDate.EditValue;
  if VarName = 'KABNAME' then Value := odsKab.FieldByName('fc_name').AsString;
end;

procedure TfrmMain.frxPrintListGetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'DATENOW' then Value := VarToDateTime(dxdeDate.CurEditValue);
  if VarName = 'KAB' then Value := odsKab.FieldByName('FC_NAME').AsString;
  if VarName = 'SYSDATE' then Value := GET_SYSDATE_4REP;
  if VarName = 'KOLVOPAC' then Value := GET_COUNT_PAC;
  if VarName = 'SORTNAME' then Value := sSortType;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.frxRepKabGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'DATESYS' then Value := GET_SYSDATE_4REP;
  if VarName = 'SOTRNAME' then Value := sSotrFIO;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.aCopyFIOExecute(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := ReplaceSubStr(odsList.FieldByName('FIOPAC').AsString, '.', '');
end;

procedure TfrmMain.aCorrectNumFluExecute(Sender: TObject);
var ods : TOracleDataSet;
     oq : TOracleQuery;
begin
  if (bIsAdmin = 1) and (odsKab.FieldByName('is_flu').AsInteger = 1) then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' select to_date(fc_key, ''dd.mm.yyyy hh24:mi'') as fd_date from asu.tsmini where fc_section = ''SET_NEW_FLU_NUM''||:PKABID ';
        ods.DeclareAndSet('PKABID', otString, IntToStr(odsKab.FieldByName('fk_id').AsInteger));
        ods.Open;
        if dxdeDate.EditValue <> ods.FieldByName('fd_date').AsDateTime then
          begin
            showmessage('Вы можете корректировать последний номер флюорографии только для сегодняшнего дня!');
          end else
          begin
            Application.CreateForm(TfrmSetLastFluNum, frmSetLastFluNum);
            try
              frmSetLastFluNum.ShowModal;
              if frmSetLastFluNum.ModalResult = mrOk then
                begin
                  oq := TOracleQuery.Create(nil);
                  try
                    oq.Session := os;
                    oq.Cursor := crSQLWait;
                    oq.SQL.Text := ' update asu.tsmini '+#13+
                                   '    set fc_value = :pfc_value '+#13+
                                   '  where fc_section = ''SET_NEW_FLU_NUM''||:PKABID '; 
                    oq.DeclareAndSet('pfc_value', otString, IntToStr(frmSetLastFluNum.seLastNum.Value));
                    oq.DeclareAndSet('PKABID', otString, IntToStr(odsKab.FieldByName('fk_id').AsInteger));
                    oq.Execute;
                    os.Commit;
                  finally
                    oq.Free;
                  end;
                end;
            finally
              frmSetLastFluNum.Free;
            end;
          end;
      finally
        ods.Free;
      end;
    end;
end;

procedure TfrmMain.actPrintDateNazExecute(Sender: TObject);
begin
  DoPrintJournal('Печать журнала с сортировкой по дате наз.', odsList_SortDateNaz);
end;

procedure TfrmMain.actPrintDezExecute(Sender: TObject);
begin
  DoPrintJournal('Печать журнала - Дежурство', odsPrintDez);
end;

procedure TfrmMain.actPrintFioExecute(Sender: TObject);
begin
  DoPrintJournal('Печать журнала с сортировкой по ФИО', odsList_SortFIO);
end;

procedure TfrmMain.osAfterLogOn(Sender: TOracleSession);
var Ver: TJclFileVersionInfo;
begin
  Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
	Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
	  Sender.DBMS_Application_Info.Set_Module(ExtractFileName(ParamStr(0)) + ' (' + Ver.FileVersion + ')', Self.Name + ' "' + Self.Caption + '"');
	  FileVersion := Ver.FileVersion;
  finally
    Ver.Free;
  end;
end;

procedure TfrmMain.odsBlanksBeforeOpen(DataSet: TDataSet);
begin
  odsBlanks.SetVariable('PFK_ROOMID', odsKab.FieldByName('FK_ID').AsInteger);
  odsBlanks.SetVariable('PFD_DATE', dxdeDate.EditValue);
  odsBlanks.SetVariable('PNORMA', get_norma_parent);
  odsBlanks.SetVariable('PPRPAT', get_pr_pat);
end;

procedure TfrmMain.cxPrOtmenaPropertiesEditValueChanged(Sender: TObject);
begin
  if cxPrOtmena.EditValue = 1 then 
    begin
      odsList.Filtered := FALSE;
    end else
    begin
      odsList.Filtered := TRUE;
      odsList.Filter := 'not ((FK_NAZSOSID = '+IntToStr(GET_NAZCANCEL)+') or (FK_NAZSOSID = '+IntToStr(GET_NEYAV)+'))';
    end;
end;

end.
