unit fMain;

interface                

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Oracle, ImgList, ActnList, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  OracleData, dxBar, ComCtrls, ToolWin, cxSplitter, ShellApi,
	cxPC, cxGridExportLink, JclFileUtils, dxWrap, dxPrnDev, jvDbUtils, frxClass, frxDBSet,
  StdCtrls, Registry, Jpeg, word2000, cxContainer, cxCheckBox, dxPScxGrid6Lnk, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, AppEvnts, dxSkinsdxBarPainter, dxBarExtItems, ClipBrd, dxPSUtl,
  cxBarEditItem, uGlobalConst, uReportUtils, uDigitalSignature, SMMainAPI,
  cxLabel, Grids, DBGrids, frxRich, RVStyle,
  rvhtmlimport, RVScroll, RichView, RVEdit, uGlobal, IniFiles, cxSpinEdit, cxRadioGroup;

type
  TSetSignFnc = procedure (aSignFnc: TSignFnc); stdcall;
  TEditPlugin_Personal = function(HostObjHandle: THandle;
                                  App: THandle;
                                  nPacID: Integer;
                                  nSotrID: Integer;
                                  nSpecID: Integer;
                                  nSecID: Integer = -1;
                                  nSmidID: Integer = -1;
                                  nNazID: Integer = -1;
                                  bReadOnly: Boolean = false;
																	ObjID: Integer=-1;
																	hMainForm : THandle=0) : LongInt; stdcall;
  TFreePlugin = function(): LongInt; stdcall;
  TfrmMain = class(TForm)
    os: TOracleSession;
    ilMain: TImageList;
    alMain: TActionList;
    aClose: TAction;
    dsKab: TDataSource;
    odsKab: TOracleDataSet;
    aRefresh: TAction;
    aOpen: TAction;
    odsList: TOracleDataSet;
    dsList: TDataSource;
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
    TVListDATERUN: TcxGridDBColumn;
    TVListVRACHFIO: TcxGridDBColumn;
    TVListNAZ: TcxGridDBColumn;
    TVListPARAM: TcxGridDBColumn;
    cxGrLevel1: TcxGridLevel;
    aFill: TAction;
    pmTV: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    sdPopUp: TSaveDialog;
    al: TActionList;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    aPrint: TAction;
    N1: TMenuItem;
    aCancel: TAction;
    odsListFK_ID: TFloatField;
    odsListFK_SMID: TFloatField;
    odsListFD_NAZ: TDateTimeField;
    odsListFK_PACID: TFloatField;
    odsListFK_NAZSOSID: TFloatField;
    odsListFK_ISPOLID: TFloatField;
    odsListVRACHFIO: TStringField;
    odsListFIOPAC: TStringField;
    odsListFD_ROJD: TDateTimeField;
    odsListAGE: TFloatField;
    odsListFC_NAME: TStringField;
    odsListPARAM: TStringField;
    TVSOS: TcxGridDBColumn;
    N2: TMenuItem;
    odsListPEPLID: TFloatField;
    TVSEX: TcxGridDBColumn;
    odsListFD_RUN: TDateTimeField;
    odsListSEX: TStringField;
    odsListSTATE: TStringField;
    odsListTIME_ISL: TStringField;
    TVSTATE: TcxGridDBColumn;
    TVTIME_ISL: TcxGridDBColumn;
    aPreview: TAction;
    aEditNaz: TAction;
    odsListFK_ROOMID: TIntegerField;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    odsListOTDEL: TStringField;
    TVOTDEL: TcxGridDBColumn;
    odsListFC_TYPE: TStringField;
    odsListFK_NAZTYPEID: TFloatField;
    TVNAZTYPE: TcxGridDBColumn;
    TVFK_NAZTYPE: TcxGridDBColumn;
    TVDATENAZ: TcxGridDBColumn;
    aEdit: TAction;
    aInfo: TAction;
    aSearch: TAction;
    pmPrint: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    frxDBPrintList: TfrxDBDataset;
    frxPrintList: TfrxReport;
    ApplicationEvents1: TApplicationEvents;
    odsListFD_NAZ_STR: TStringField;
    odsListFD_RUN_STR: TStringField;
    odsListFK_VRACHID: TFloatField;
    aProsmotr: TAction;
    frxRepProsmotr: TfrxReport;
    odsListISPOLFIO: TStringField;
    aDolg: TAction;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbRefresh: TdxBarButton;
    bbInfo: TdxBarButton;
    bbFind: TdxBarButton;
    bbOpenMK: TdxBarButton;
    dxBarButton6: TdxBarButton;
    bbEdit: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarButton15: TdxBarButton;
    dxBarButton16: TdxBarButton;
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
    aPrintKab: TAction;
    aTextKab: TAction;
    aWebKab: TAction;
    aXMLKab: TAction;
    aXLSKab: TAction;
    pmKab: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Web1: TMenuItem;
    XLS1: TMenuItem;
    XLS2: TMenuItem;
    frxRepKab: TfrxReport;
    frxDBKab: TfrxDBDataset;
    aCopyFIO: TAction;
    N8: TMenuItem;
    cxPrOtmena: TcxBarEditItem;
    odsListIS_AMB: TFloatField;
    dxdeDate: TcxBarEditItem;
    cxStyleRepository2: TcxStyleRepository;
    DateText: TcxStyle;
    aHide: TAction;
    aShow: TAction;
    tmrCheckApplication: TTimer;
    bbLaborant: TdxBarButton;
    aLaborant: TAction;
    odsListNUMISSL: TStringField;
    TVNUMISSL: TcxGridDBColumn;
    bbVrach: TdxBarButton;
    aVrach: TAction;
    TVDATE_IN: TcxGridDBColumn;
    odsListDATE_IN: TDateTimeField;
    N9: TMenuItem;
    N10: TMenuItem;
    aDatePos: TAction;
    aSysInfo: TAction;
    aNapr: TAction;
    bbNapr: TdxBarButton;
    frxPatGist: TfrxReport;
    frxCitolog: TfrxReport;
    frxRichObject1: TfrxRichObject;
    odsPatGist: TOracleDataSet;
    odsCitolog: TOracleDataSet;
    vOtdelVrach: TcxGridDBColumn;
    odsListOTDEL_VRACH: TStringField;
    odsListFIOPAC_SHORT: TStringField;
    bbEditNaz: TdxBarLargeButton;
    frxPatGist_NT: TfrxReport;
    rve1: TRichViewEdit;
    RvHtmlImporter1: TRvHtmlImporter;
    RVStyle1: TRVStyle;
    odsListIS_PAT: TFloatField;
    VPAT: TcxGridDBColumn;
    frxCitologNT: TfrxReport;
    odsCitologNT: TOracleDataSet;
    N11: TMenuItem;
    N12: TMenuItem;
    aNevip: TAction;
    beirgDate: TcxBarEditItem;
    odsListFK_NAZOWNER: TFloatField;
    procedure aCloseExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aOpenExecute(Sender: TObject);
    procedure odsKabAfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aFillExecute(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure odsListAfterScroll(DataSet: TDataSet);
    procedure TVListCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure N2Click(Sender: TObject);
    procedure odsKabBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
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
    procedure aPreviewExecute(Sender: TObject);
    procedure aEditNazExecute(Sender: TObject);
    procedure aInfoExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aSearchExecute(Sender: TObject);
    procedure frxPrintListGetValue(const VarName: String;
      var Value: Variant);
    procedure tbnPrintClick(Sender: TObject);
    procedure TVListCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure aProsmotrExecute(Sender: TObject);
    procedure frxRepProsmotrGetValue(const VarName: string; var Value: Variant);
    procedure aDolgExecute(Sender: TObject);
    procedure aTextKabExecute(Sender: TObject);
    procedure aWebKabExecute(Sender: TObject);
    procedure aXMLKabExecute(Sender: TObject);
    procedure aXLSKabExecute(Sender: TObject);
    procedure aPrintKabExecute(Sender: TObject);
    procedure frxRepKabGetValue(const VarName: string; var Value: Variant);
    procedure odsKabAfterOpen(DataSet: TDataSet);
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure FormShow(Sender: TObject);
    procedure aCopyFIOExecute(Sender: TObject);
    procedure cxPrOtmenaPropertiesEditValueChanged(Sender: TObject);
    procedure dxdeDateChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aHideExecute(Sender: TObject);
    procedure aShowExecute(Sender: TObject);
    procedure tmrCheckApplicationTimer(Sender: TObject);
    procedure aLaborantExecute(Sender: TObject);
    procedure aVrachExecute(Sender: TObject);
    procedure aDatePosExecute(Sender: TObject);
    procedure aSysInfoExecute(Sender: TObject);
    procedure aNaprExecute(Sender: TObject);
    procedure frxPatGistGetValue(const VarName: string; var Value: Variant);
    procedure frxCitologGetValue(const VarName: string; var Value: Variant);
    procedure frxPatGist_NTGetValue(const VarName: string; var Value: Variant);
    procedure frxCitologNTGetValue(const VarName: string; var Value: Variant);
    procedure aNevipExecute(Sender: TObject);
    procedure TVListFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
  private
//    AppHandle : Integer;
    SetSignFnc : TSetSignFnc;
    sPhone_4Rep, sSotrSpec_4Rep, sSotrSpec2_4Rep, sNumMK_4Rep, sDateSys_4Rep, strOper_4Rep, sSotr_4Rep, sSotr2_4Rep : string;
    IDNAZ : Integer;
    DLL_FORM_HANDLE : Longint;
    HandleDLL: THandle;
    EditPlugin_Personal : TEditPlugin_Personal;
    FILENAME : String;
    procedure DoRefreshSmidConst;
    procedure CheckEnabledButons;
    procedure DateChange;
    procedure BmpToJPEG(pFNAME1,pFNAME2:String);
    procedure DoWordProcess(path : String; FormatPr: Integer = 0; bLandscape: Boolean = false);
    function PhysicalResolveFileType(AStream: TStream): Integer;
    procedure DoShowPatogistNapr(Sender: Tobject);
//    function WinExecAndWait32(FileName: string; Visibility: integer): integer;
    { Private declarations }
  public
    get_dicom_show, get_dicom_port, get_dicom_ip, get_dicom_called, get_dbname, sCallingAET : string;
    LIST_PATANAT_PROSMOTR_HTML, list_patanat_show_filter_date : integer;
    sPath : string; // путь к лаунчеру мультивокса
    Russian: HKL;
    arFIO:array of string;
    is_digsig : Boolean;
    get_digsig : string;
    gDigSignature: TDigitalSignature;
    MedotradeSign : string;
    sTextIssl_4Rep : String;
    GET_SYSDATE_4REP : String;
    pSOTRID : Integer;
    sSotrFIO : String;
    pAPPSOTRID : Integer;
    GET_ISSLEDID : Integer;
    sCompanyName_4Rep, sOtdelName_4Rep,sADDR_4Rep,sDiag_4Rep : String;
    pOTDELID : Integer;
    dicom_show_3d : Boolean;
    procedure DoShowForm;
    procedure DoResult(nNazID: Integer);
    procedure On_set_form_handle(var Msg: TMessage); message 1024+112;
    procedure DoSetEditRights;
    function RestoreApplication(AAppCaption:string):Boolean;
    procedure DoResultHTML(nNazID : Integer; nPacID : Integer);
    function Get_Pac_NUMIB(pFK_PacID: Integer): String;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  get_neyav, get_nazcancel, get_vipnaz, get_nazplan, get_nevip, get_recomend, get_labvip, listpatanatom_days2edit : Integer;
  get_systemdate : TDate;
implementation

uses fOtmena, fDolg, fPreview, fSetNaz, fSearch, fPacInfoDiagnost, fWait, uDBTableUtils,
     fEditNaz, fLabPatAnatom, fProtocol, fSetDatePos, fSysInfo, uPrintDocument, uPrintType;
{$R *.dfm}

procedure TfrmMain.On_set_form_handle(var Msg: TMessage);
begin
  if (HandleDLL > 0) and (msg.WParam>0) then
    DLL_FORM_HANDLE:=msg.WParam;
end;

procedure TfrmMain.osAfterLogOn(Sender: TOracleSession);
var Ver: TJclFileVersionInfo;
begin
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
	  Sender.DBMS_Application_Info.Set_Module(ExtractFileName(ParamStr(0)) + ' (' + Ver.FileVersion + ')', Self.Name + ' "' + Self.Caption + '"');
	  FILENAME := ExtractFileName(ParamStr(0));
  finally
  	Ver.Free;
  end;
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.aCopyFIOExecute(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := ReplaceSubStr(dsList.DataSet.FieldByName('FIOPAC').AsString, '.', '');
end;

procedure TfrmMain.aDatePosExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  Application.CreateForm(TfrmSetDatePos, frmSetDatePos);
  try
    if DateTimeToStr(odsList.FieldByName('DATE_IN').AsDateTime) = '30.12.1899' then
      frmSetDatePos.deDatePos.Text := ''
    else
      frmSetDatePos.deDatePos.Date := odsList.FieldByName('DATE_IN').AsDateTime;
    frmSetDatePos.ShowModal;
    if frmSetDatePos.ModalResult = mrOk then
      begin
        ods := TOracleDataSet.Create(nil);
        try
          ods.Session := os;
          ods.Cursor := crSQLWait;
          ods.SQL.Text := ' MERGE INTO ASU.TIB '+#13+
                          '  USING DUAL ON (FK_PACID = :PFK_PACID '+#13+
                          '                 AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''DATEIN_PATANATOM'')) '+#13+
                          ' WHEN MATCHED THEN UPDATE SET FD_DATE = :PFD_DATE '+#13+
                          '                    WHERE FK_PACID = :PFK_PACID '+#13+
                          '                      AND FK_SMID = (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''DATEIN_PATANATOM'') '+#13+
                          ' WHEN NOT MATCHED THEN INSERT(FD_DATE, FK_PACID, FK_SMID, FK_SMEDITID, FK_VRACHID) '+#13+
                          '                       VALUES(:PFD_DATE, :pFK_PACID, (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''DATEIN_PATANATOM''), (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = ''DATEIN_PATANATOM''), :pFK_VRACHID) ';
          ods.DeclareAndSet('PFD_DATE', otDate, frmSetDatePos.deDatePos.Date);
          ods.DeclareAndSet('PFK_PACID', otInteger, odsList.FieldByName('fk_id').AsInteger);
          ods.DeclareAndSet('pFK_VRACHID', otInteger, frmMain.pSOTRID);
          ods.Open;
          os.Commit;
        finally
          ods.Free;
        end;
        RefreshQuery(odsList);
      end;
  finally
    frmSetDatePos.Free;
  end;
end;

procedure TfrmMain.aDolgExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmDolg, frmDolg);
  try
    frmDolg.DoShowfrmDolg;
    frmDolg.ShowModal;
  finally
    frmDolg.Free;
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
  odsList.EnableControls;
  odsList.Locate('FK_ID', id, []);
end;

procedure TfrmMain.aOpenExecute(Sender: TObject);
var AppProcID : Integer; 
begin
  try
    if RestoreApplication(dsList.DataSet.FieldByName('FIOPAC_SHORT').AsString + ' - ' + Get_Pac_NUMIB(dsList.DataSet.FieldByName('FK_PACID').AsInteger))
    then Exit;

    SetLength(arFIO,Length(arFIO)+1);
    arFIO[Length(arFIO)-1]:=dsList.DataSet.FieldByName('FIOPAC_SHORT').AsString;
    aOpen.Enabled:=False;
    Application.ProcessMessages;
    Screen.Cursor := crSQLWait;
    tmrCheckApplication.Enabled:=True;

//  AppHandle := WinExecAndWait32(PChar('IBRazdel.exe '+IntToStr(pAPPSOTRID)+' '+IntToStr(odsList.FieldByName('FK_PACID').AsInteger)+' '+IntToStr(-1)+' '+IntToStr(-1)), 1);
//  GetInputMapAppFromApp(AppHandle);
    AppProcID := AppStart('IBRazdel.exe', IntToStr(odsList.FieldByName('FK_PACID').AsInteger)+' '+IntToStr(-1)+' '+IntToStr(-1));
    if AppProcID = -1 then ShowMessage('Ошибка запуска приложения');
    ShowWait(odsList.FieldByName('FK_PACID').AsInteger,True);
  finally
    aOpen.Enabled := True; 
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMain.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if HandleDLL > 0 then 
    case msg.message of
      WM_KEYDOWN: if ((msg.wParam>=112) and (msg.wParam<=123))or
                      ((msg.wParam>=37) and (msg.wParam<=40))or(msg.wParam=93)or(msg.wParam=33)or(msg.wParam=34)
                      or (msg.wParam=27)or (msg.wParam=9) then
                    SendMessage(DLL_FORM_HANDLE,wm_user+113,msg.wParam,msg.lParam);
     end;
end;

procedure TfrmMain.DoSetEditRights;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT NAZ.FK_SMID FROM TVRACHKAB KAB, TVRACHKAB_NAZ NAZ '+
                    '  WHERE KAB.FK_SOTRID = :PFK_SOTRID '+
                    '    AND KAB.FK_ID = NAZ.FK_SOTRKABID '+
                    '    AND FK_SMID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = :PFC_SYNONIM) ';
    ods.DeclareAndSet('PFK_SOTRID', otInteger, pSOTRID);
    ods.DeclareAndSet('PFC_SYNONIM', otString, 'DIAGNOSTIC_RIGHTS_OPENMK');
    ods.Open;
    aOpen.Visible := ods.RecordCount <> 0; // Открыть МК
    ods.Close;
    ods.DeleteVariables;
    ods.DeclareAndSet('PFK_SOTRID', otInteger, pSOTRID);
    ods.DeclareAndSet('PFC_SYNONIM', otString, 'DIAGNOSTIC_RIGHTS_FILL');
    ods.Open;
    aFill.Visible := ods.RecordCount <> 0; // Заполнить
    ods.Close;
    ods.DeleteVariables;
    ods.DeclareAndSet('PFK_SOTRID', otInteger, pSOTRID);
    ods.DeclareAndSet('PFC_SYNONIM', otString, 'DIAGNOSTIC_RIGHTS_EDIT');
    ods.Open;
    aEdit.Visible := ods.RecordCount <> 0; // Изменить
    ods.Close;
    ods.DeleteVariables;
    ods.DeclareAndSet('PFK_SOTRID', otInteger, pSOTRID);
    ods.DeclareAndSet('PFC_SYNONIM', otString, 'DIAGNOSTIC_RIGHTS_OTMENA');
    ods.Open;
    aCancel.Visible := ods.RecordCount <> 0; // Отмена
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
    Reg : TRegIniFile;
    id : Integer;                                        
    Ver : TJclFileVersionInfo;
begin
  frmMain.Show;
  DoRefreshSmidConst;
  pAPPSOTRID := StrToInt(paramstr(1));
  ods := TOracleDataSet.Create(nil);
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
  ods.Session := os;
  ods.Cursor := crSQLWait;
  ods.SQL.Text := ' SELECT FK_SOTRID, DO_VRACHFIO(FK_SOTRID) AS SOTRFIO, '+#13+
                  '        ASU.PKG_SMINI.READSTRING(''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME, '+#13+
                  '        (SELECT FC_NAME  '+#13+
                  '           FROM ASU.TOTDEL '+#13+
                  '          WHERE FK_ID = (SELECT FK_OTDID FROM ASU.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME, '+#13+
                  '        (SELECT FK_OTDELID FROM ASU.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID) AS OTDELID '+#13+
                  '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
  ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
  ods.Open;
  pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
  pOTDELID := ods.FieldByName('OTDELID').AsInteger;
  sSotrFIO := ods.FieldByName('SOTRFIO').AsString;
  sCompanyName_4Rep := ods.FieldByName('COMPANYNAME').AsString;
  sOtdelName_4Rep := ods.FieldByName('OTDELNAME').AsString;
  odsKab.AfterScroll := nil;
  odsKab.Open;
//------------------------------------------------------------------------------
  Reg:=TRegIniFile.Create;
  try
    Reg.RootKey:=HKEY_CURRENT_USER;
    Reg.OpenKey('\Software\Softmaster\ListPatAnatom\ID_SOTR'+IntToStr(pSOTRID), True);
    id := Reg.ReadInteger('\Software\Softmaster\ListPatAnatom\ID_SOTR'+IntToStr(pSOTRID), 'ID_OTMENA', 0);
    case id of
      1: cxPrOtmena.EditValue := 1;
      0: cxPrOtmena.EditValue := 0;
    end;
    cxPrOtmenaPropertiesEditValueChanged(nil);
    id := Reg.ReadInteger('\Software\Softmaster\ListPatAnatom\ID_SOTR'+IntToStr(pSOTRID), 'ID_KABINET', 0);
    if id <> 0 then
      odsKab.Locate('FK_ID', id, []);
  finally
    Reg.Free;
  end;
//------------------------------------------------------------------------------
  odsKab.AfterScroll := odsKabAfterScroll;
  dxdeDate.EditValue := GET_SYSTEMDATE;
  frmMain.Caption := '';
  frmMain.Caption := 'ЖУРНАЛ ВРАЧА-ПАТОЛОГОАНАТОМА('+Ver.FileVersion+'). Пользователь: '+sSotrFIO+'; КАБИНЕТ: '+odsKab.FieldByName('FC_NAME').AsString;
  cxGr.SetFocus;

  MedotradeSign := ReadMedotradeSign;
  TVList.StoreToRegistry('\SoftWare\SoftMaster\ListPatAnatom\cxGrVrach_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'cxGr');
  TVList.RestoreFromRegistry('\SoftWare\SoftMaster\ListPatAnatom\cxGrVrach_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'cxGr');
  DoSetEditRights;
  aNevip.Visible := (DO_CHECK_OBJECT_ACCESS(os, pAPPSOTRID, aNevip.Owner.Name + '.' + aNevip.Name) > 0);
  finally
    ods.Free;
    Ver.Free;
  end;
end;

procedure TfrmMain.odsKabAfterOpen(DataSet: TDataSet);
begin
  aPrintKab.Enabled := odsKab.RecordCount <> 0;
end;

procedure TfrmMain.odsKabAfterScroll(DataSet: TDataSet);
var Ver : TJclFileVersionInfo;
begin
  aRefreshExecute(Self);
  frmMain.Caption := '';
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  frmMain.Caption := 'ЖУРНАЛ ВРАЧА-ПАТОЛОГОАНАТОМА('+Ver.FileVersion+'). Пользователь: '+sSotrFIO+'; КАБИНЕТ: '+odsKab.FieldByName('FC_NAME').AsString;
  Ver.Free;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg : TRegIniFile;
begin
//------------------------------------------------------------------------------
  Reg := TRegIniFile.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if not Reg.OpenKey('\Software\Softmaster\ListPatAnatom\', FALSE) then
   begin
     Reg.CreateKey('\Software\Softmaster\ListPatAnatom');
   end;
  try
    Reg.WriteInteger('\Software\Softmaster\ListPatAnatom\ID_SOTR'+IntToStr(pSOTRID), 'ID_KABINET', odsKab.FieldByName('FK_ID').AsInteger);
    Reg.WriteInteger('\Software\Softmaster\ListPatAnatom\ID_SOTR'+IntToStr(pSOTRID), 'ID_OTMENA',  cxPrOtmena.EditValue);
  except
  end;
  Reg.Free;
//------------------------------------------------------------------------------
  TVList.StoreToRegistry('\SoftWare\SoftMaster\ListPatAnatom\cxGrVrach_' + IntToStr(pSOTRID), TRUE, [], 'cxGr');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из приложения ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    action := caFree
  else
    action := caNone;
end;

procedure TfrmMain.aFillExecute(Sender: TObject);
var ods : TOracleDataSet;
     oq : TOracleQuery;
    IDSMID : Integer;
begin
  IDNAZ := odsList.FieldByName('FK_ID').AsInteger;
	IDSMID := -1;
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_ID FROM ASU.TSMID WHERE FK_OWNER = :PFK_OWNER AND FL_SHOWANAL = 1 ';
    ods.DeclareAndSet('PFK_OWNER', otInteger, odsList.FieldByName('FK_SMID').AsInteger);
    ods.Open;
    if ods.RecordCount > 1 then
      begin
        Application.CreateForm(TfrmSetNaz, frmSetNaz);
        frmSetNaz.DoShowForm(odsList.FieldByName('FK_SMID').AsInteger);
        frmSetNaz.ShowModal;
        if frmSetNaz.ModalResult = MrOk then
          begin
            oq := TOracleQuery.Create(nil);
            try
              oq.Session := os;
              oq.Cursor := crSQLWait;
              oq.SQL.Text := ' UPDATE ASU.TNAZIS SET FK_SMID = :PFK_SMID WHERE FK_ID = :PFK_ID ';
              oq.DeclareAndSet('PFK_SMID', otInteger, frmSetNaz.odsNaz.FieldByName('FK_ID').AsInteger);
              oq.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
              oq.Execute;
              IDSMID := frmSetNaz.odsNaz.FieldByName('FK_ID').AsInteger;
              os.Commit;
            finally
              oq.Free;
            end;
            frmSetNaz.Free;
          end else
          begin
            frmSetNaz.Free;
            exit;
          end;
      end;
  finally
    ods.Free;
  end;
//------------------------------------------------------------------------------
  HandleDLL := LoadLibrary('PriemDll.dll');
  if HandleDLL <> 0 then
    begin
      EditPlugin_Personal := GetProcAddress(HandleDLL, 'EditPlugin_Personal');
      if @EditPlugin_Personal <> nil then
      begin
        try
          @SetSignFnc := GetProcAddress(HandleDLL, 'SetSignFnc');
          if Assigned(@SetSignFnc) then
            SetSignFnc(frmMain.gDigSignature.SignDocument);
					EditPlugin_Personal(Panel1.Handle, //хэндл панели
															Application.Handle, //хэндл аппликейшена
															odsList.FieldByName('FK_PACID').AsInteger, //код пациента
															pSOTRID, //код сотрудника
															pAPPSOTRID, //специализация
                              -1, //секция
															IDSMID, //odsList.FieldByName('FK_SMID').AsInteger, //смид
															odsList.FieldByName('FK_ID').AsInteger, //назид
															FALSE,
															odsList.FieldByName('FK_ID').AsInteger, //ид объекта
															Panel1.Parent.Handle);
        except
        end;
      end;
    end;
  try
    Application.ProcessMessages;
    FreeLibrary(HandleDLL);
    HandleDll:=0;
  except
  end;
  RefreshQuery(odsList);
  odsList.Locate('FK_ID', IDNAZ, []);
end;

procedure TfrmMain.aHideExecute(Sender: TObject);
begin
  cxSplitter1.CloseSplitter;
end;

//function TfrmMain.WinExecAndWait32(FileName: string; Visibility: integer): integer; //15.02.03
//var zAppName: array[0..512] of char;
//    zCurDir: array[0..255] of char;
//    WorkDir: string;
//    StartupInfo: TStartupInfo;
//    ProcessInfo: TProcessInformation;
//begin
//  StrPCopy(zAppName, FileName);
//  GetDir(0, WorkDir);
//  StrPCopy(zCurDir, FileName);
//  FillChar(StartupInfo, Sizeof(StartupInfo), #0);
//  StartupInfo.cb := Sizeof(StartupInfo);
//  StartupInfo.hStdInput := 23999;
//  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
//  StartupInfo.wShowWindow := Visibility;
//  if not CreateProcess(nil,
//         zAppName, { указатель командной строки }
//         nil, { указатель на процесс атрибутов безопасности }
//         nil, { указатель на поток атрибутов безопасности }
//         false, { флаг родительского обработчика }
//         CREATE_NEW_CONSOLE or { флаг создания }
//         NORMAL_PRIORITY_CLASS,
//         nil, { указатель на новую среду процесса }
//         nil, { указатель на имя текущей директории }
//         StartupInfo, { указатель на STARTUPINFO }
//         ProcessInfo) then Result := -1 { указатель на PROCESS_INF }
//  else begin
//      Result := ProcessInfo.dwProcessId;
//  end;
//end;

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

procedure TfrmMain.aVrachExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmProtocol, frmProtocol);
  try
    frmProtocol.DoShowForm(odsList.FieldByName('FK_PACID').AsInteger,
                           odsList.FieldByName('PEPLID').AsInteger,
                           odsList.FieldByName('FK_SMID').AsInteger,
                           odsList.FieldByName('FK_ID').AsInteger);
    frmProtocol.ShowModal;
  finally
    frmProtocol.Free;
  end;
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

procedure TfrmMain.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS SYSTEMDATE FROM DUAL ';
    ods.Open;
    GET_SYSDATE_4REP := ods.FieldByName('SYSTEMDATE').AsString;
  finally
    ods.Free;
  end;
  frxPrintList.ShowReport;
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

procedure TfrmMain.aProsmotrExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  if get_dbname = 'H' then // для Ханты ОКБ
    begin
      DoResultHTML(odsList.FieldByName('fk_id').AsInteger, odsList.FieldByName('fk_pacid').AsInteger); // формируем в HTML
    end
  else if (get_dbname = 'SO') and (odsList.FieldByName('fk_nazowner').asinteger > -1) then
   begin
      DoResultHTML(odsList.FieldByName('fk_nazowner').AsInteger, odsList.FieldByName('fk_pacid').AsInteger); // формируем в HTML
   end
  else
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := os;
        ods.Cursor := crSQLWait;
        ods.sql.text := 'select ''(''||s.fk_mkb10||'') ''||d.fc_write diag from asu.tdiag d, asu.tsmid s '+#13+
                        ' where d.fk_pacid = :pacid '+#13+
                        '   and s.fk_id = d.fk_smdiagid '+#13+
                        ' order by decode(d.fp_type,asu.get_zakldiag,1,asu.get_clinik_diag,2,3),d.fd_date desc,decode(d.fl_main,asu.get_maindiag,1,2)';
        ods.close;                           
        ods.DeclareAndSet('PACID', otInteger, odsList.FieldByName('FK_PACID').AsInteger);
        ods.open;

        if ods.recordcount > 0 then
         sDIAG_4Rep := ods.FieldByName('diag').asstring
        else
         sDIAG_4Rep := '';

        ods.Close;
        ods.DeleteVariables;
        
        ods.SQL.Text := ' SELECT (SELECT FB_TEXT FROM ASU.TRICHVIEWDATA WHERE FK_PACID = :PFK_PACID) AS FB_TEXT, '+#13+
                        '        (SELECT FC_PHONE FROM ASU.TKABINET WHERE FK_ID = :PFK_ID) AS FC_PHONE, '+#13+
                        '        ASU.GET_IB(:PACID) AS IB, '+#13+
                        '        asu.pkg_regist_pacfunc.GET_PAC_ADrfull(:pacid) addr'+#13+
                        '   FROM DUAL ';
        ods.DeclareAndSet('PFK_PACID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        ods.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ROOMID').AsInteger);
        ods.DeclareAndSet('PACID', otInteger, odsList.FieldByName('FK_PACID').AsInteger);
        ods.Open;
        sTextIssl_4Rep := ods.FieldByName('FB_TEXT').AsString;
        sPhone_4Rep := ods.FieldByName('FC_PHONE').AsString;
        sNumMK_4Rep := ods.FieldByName('IB').AsString;
        sADDR_4Rep := ods.FieldByName('addr').asstring;
        if get_digsig = '1' then
          begin
            ods.Close;
            ods.DeleteVariables;
            ods.SQL.Text := ' SELECT COUNT(*) AS CNT FROM ASU.TPODPIS_RICHVIEWDATA P, ASU.TRICHVIEWDATA D '+#13+
                            '  WHERE P.FK_RICHVIEWDATA = D.FK_ID '+#13+
                            '    AND D.FK_PACID = :PFK_PACID ';
            ods.DeclareAndSet('PFK_PACID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
            ods.Open;
            if ods.FieldByName('CNT').AsInteger > 0 then
              is_digsig := True
            else
              is_digsig := False;
          end;
// -- вторая подпись
        ods.DeleteVariables;
        ods.Close;
        ods.SQL.Text := ' select rownum, '+#13+
                        '        asu.do_vrachfio(fk_sotrid) as vrachfio, '+#13+
                        '        (select t1.fc_name from asu.ts_sprav t1, asu.tsotr t2 '+#13+
                        '          where t1.fk_id = t2.fk_spravid and t2.fk_id = tpodpisnaz.fk_sotrid) as spec '+#13+
                        '   from asu.tpodpisnaz where fk_nazid = :pfk_nazid and fk_sos = 1 order by fd_date ';
        ods.DeclareAndSet('pfk_nazid', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        ods.Open;
        if ods.RecordCount > 1 then
          begin
            ods.First;
            sSotr_4Rep := ods.FieldByName('vrachfio').AsString;
            sSotrSpec_4Rep := ods.FieldByName('spec').AsString;
            ods.Next;
            sSotr2_4Rep := ods.FieldByName('vrachfio').AsString;
            sSotrSpec2_4Rep := ods.FieldByName('spec').AsString;
          end else
          begin
            sSotr_4Rep := ods.FieldByName('vrachfio').AsString;
            sSotr2_4Rep := '';
            sSotrSpec_4Rep := ods.FieldByName('spec').AsString;
            sSotrSpec2_4Rep := '';
          end;
        if sPhone_4Rep = '' then
          begin
            frxRepProsmotr.FindObject('Memo13').Visible := False;
            frxRepProsmotr.FindObject('MemTel').Visible := False;
          end else
          begin
            frxRepProsmotr.FindObject('Memo13').Visible := True;
            frxRepProsmotr.FindObject('MemTel').Visible := True;
          end;
      finally
        ods.Free;
      end;
      frxRepProsmotr.ShowReport;
    end;
end;

procedure TfrmMain.DoRefreshSmidConst;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
	  ods.SQL.Text := ' select asu.get_neyav, asu.get_nazcancel, asu.get_vipnaz, asu.get_nazplan, asu.get_nevip, asu.get_recomend, asu.get_labvip, '+#13+
                    '        asu.get_issledid, trunc(sysdate) as systemdate, '+#13+
                    '        (select fc_value from asu.tsmini where fc_section = ''CONFIG'' and FC_KEY = ''USE_DIGITSUBSCRIBE'') as digsig, '+#13+
                    '        asu.pkg_smini.readstring(''CONFIG'', ''DB_NAME'', ''H'') as db_name '+#13+
                    '   from dual ';
    ods.Close;
    ods.Open;
    get_neyav := ods.FieldByName('get_neyav').AsInteger;
    get_nazcancel := ods.FieldByName('GET_NAZCANCEL').AsInteger;
    get_vipnaz := ods.FieldByName('GET_VIPNAZ').AsInteger;
    get_nazplan := ods.FieldByName('GET_NAZPLAN').AsInteger;
    get_nevip := ods.FieldByName('GET_NEVIP').AsInteger;
	  get_recomend := ods.FieldByName('GET_RECOMEND').AsInteger;
	  get_labvip := ods.FieldByName('GET_LABVIP').AsInteger;
    get_issledid := ods.FieldByName('GET_ISSLEDID').AsInteger;
	  get_systemdate := ods.FieldByName('SYSTEMDATE').AsDateTime;
    get_digsig := ods.FieldByName('DIGSIG').AsString;
    get_dbname := ods.FieldByName('DB_NAME').AsString;
    LIST_PATANAT_PROSMOTR_HTML := TDBUtils.GetConstantDef('LIST_PATANAT_PROSMOTR_HTML',os,0);
    list_patanat_show_filter_date := TDBUtils.GetConstantDef('list_patanat_show_filter_date',os,0);

    if list_patanat_show_filter_date = 1 then
     beirgDate.Visible := ivAlways
    else
     beirgDate.Visible := ivNever;
     
    try
      listpatanatom_days2edit := TDBUtils.GetConstantDef('listpatanatom_days2edit',os,30);
    except
      listpatanatom_days2edit := 30;
    end;                

    dicom_show_3d := True; // по умолчанию НЕ включаем 3D
    ods.Close;
    ods.DeleteVariables;
    ods.SQL.Text := ' select fc_value, fc_key from asu.tsmini where fc_section = ''XRAY'' order by fk_id ';
    ods.Open;
    ods.First;
    while not ods.Eof do
      begin
        if ods.FieldByName('fc_key').AsString = 'SHOW_DICOM' then
          begin
            if ods.FieldByName('fc_value').AsString = '' then
              get_dicom_show := '0'
            else
              get_dicom_show := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'DICOM_PORT' then
          begin
            get_dicom_port := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'DICOM_IP' then
          begin
            get_dicom_ip := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'DICOM_CALLED_AE' then
          begin
            get_dicom_called := ods.FieldByName('fc_value').AsString;
          end;
        if ods.FieldByName('fc_key').AsString = 'DICOM_SHOW_3D' then // Показывать кнопку "Включить 3D"
          begin
            if ods.FieldByName('fc_value').AsString = '-1' then // обратная логика если True, то не показываем 3D
              dicom_show_3d := False
            else
              dicom_show_3d := True;
          end;
        ods.Next;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.aCancelExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmOtmena, frmOtmena);
  frmOtmena.DoShowfrmOtmena(odsList.FieldByName('FK_PACID').AsInteger, pSOTRID);
  frmOtmena.ShowModal;
  if frmOtmena.ModalResult = MrOK then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' UPDATE ASU.VNAZ SET FK_ISPOLID = :pFK_ISPOLID, FK_NAZSOSID = :pFK_NAZSOSID WHERE FK_ID = :pFK_ID ';
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
        RefreshQuery(odsList);
      finally
        oq.Free;
      end;
    end;
  frmOtmena.Free;
end;

procedure TfrmMain.odsListAfterScroll(DataSet: TDataSet);
begin
  CheckEnabledButons;
end;

procedure TfrmMain.CheckEnabledButons;
begin
  aInfo.Enabled := odsList.RecordCount <> 0;
  aOpen.Enabled := odsList.RecordCount <> 0;
  aFill.Enabled := (odsList.RecordCount <> 0)
                   and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> get_vipnaz)
                   and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> get_nazcancel)
                   and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> get_neyav);
  if get_dbname = 'TO' then
    begin
      aCancel.Enabled := (odsList.RecordCount <> 0) and
                         ((odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_NEVIP) or
                          (odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_RECOMEND) or
                          (odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_LABVIP));
    end else
    begin
      aCancel.Enabled := (odsList.RecordCount <> 0) and
                         ((odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_NEVIP) or (odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_RECOMEND));
    end;
  aPreview.Enabled := (odsList.RecordCount <> 0) and (odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_VIPNAZ);
  aEdit.Enabled := (odsList.RecordCount <> 0)
                   and (odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_VIPNAZ)
                   and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> GET_NAZCANCEL)
                   and (odsList.FieldByName('fk_nazsosid').AsInteger <> get_neyav);
  aEditNaz.Enabled := (odsList.RecordCount <> 0)
                       and ((odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_NEVIP) or (odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_RECOMEND));
  aPrint.Enabled := odsList.RecordCount <> 0;
  aProsmotr.Enabled := ((odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_VIPNAZ) and (get_dbname = 'H'))
   or ((odsList.FieldByName('fk_nazowner').asinteger > 0) and (get_dbname = 'SO'));
  aLaborant.Enabled := (odsList.RecordCount <> 0) and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> GET_NAZCANCEL) and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> get_neyav);
  aDatePos.Enabled := (odsList.RecordCount <> 0) and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> GET_NAZCANCEL);
  aSysInfo.Enabled := odsList.RecordCount <> 0;
  aNapr.Enabled := odsList.RecordCount <> 0;

  aProsmotr.Visible := (get_dbname = 'H') or (get_dbname = 'SO');
  aNevip.Enabled := (odsList.RecordCount <> 0) and (odsList.FieldByName('fk_nazsosid').AsInteger <> get_nevip);
end;

procedure TfrmMain.TVListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var ods : TOracleDataSet;
begin
	if odsList.RecordCount <> 0 then
	  begin
	    if odsList.FieldByName('FK_NAZSOSID').AsInteger = GET_NAZCANCEL then
		    begin
			    Application.CreateForm(TfrmOtmena, frmOtmena);
			    frmOtmena.acOk.Visible := False;
          frmOtmena.GroupBox1.Visible := False;
          frmOtmena.cxOtmena.Align := alClient;
          frmOtmena.acCancel.ImageIndex := 2;
			    frmOtmena.acCancel.Caption := 'Закрыть';
			    ods := TOracleDataSet.Create(nil);
			    try
				    ods.Session := os;
				    ods.Cursor := crSQLWait;
				    ods.SQL.Text := ' SELECT FC_RES, FD_INS, FK_VRACHID, ASU.DO_VRACHFIO(FK_VRACHID) AS VRACHFIO '+#13+
                            '   FROM ASU.VRES WHERE FK_NAZID = :pFK_NAZID AND FK_SOS = ASU.GET_NAZCANCEL ';
				    ods.DeclareAndSet('pFK_NAZID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
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
          if aFill.Visible = True then
            begin
			        if (odsList.FieldByName('FK_NAZSOSID').AsInteger <> get_vipnaz) and (odsList.FieldByName('FK_NAZSOSID').AsInteger <> get_neyav) then
				        aFillExecute(nil);
            end;
		    end;
	  end;
end;

procedure TfrmMain.TVListCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[TVSOS.Index] = get_nazcancel then // отменено - красный
    ACanvas.Brush.Color:=RGB(251, 172, 182);
  if AViewInfo.GridRecord.Values[TVSOS.Index] = get_neyav then // неявка - красный
    ACanvas.Brush.Color:=RGB(251, 172, 182);
  if AViewInfo.GridRecord.Values[TVFK_NAZTYPE.Index] <> get_nazplan then
    ACanvas.Font.Style := [fsBold];
  if AViewInfo.GridRecord.Values[VPAT.Index] = 1 then // если патология красим желтым
    ACanvas.Brush.Color := RGB(255, 255, 136);
end;

procedure TfrmMain.DoShowPatogistNapr(Sender: Tobject);
var
 DLL_PRINT_HANDLE: THandle;
 PrintPathohistEndo: procedure (pFK_NAZID_VALUE, pAPPSOTRID: integer);stdcall;
begin
  //frviewer4Print(CITOLOG_NAZ_FILE_NAME, odsVNAZ.FieldByName('FK_ID').AsString);
  DLL_PRINT_HANDLE := LoadLibrary('DLL_PRINT.DLL');
 Try
 if DLL_PRINT_HANDLE <> 0 then
   begin
     @PrintPathohistEndo := GetProcAddress(DLL_PRINT_HANDLE, 'DoPrintNaprPathohist');
     if @PrintPathohistEndo <> nil then
      PrintPathohistEndo(odslist.FieldByName('FK_ID').AsINteger, pAPPSOTRID);
   end;
 Finally
   FreeLibrary(DLL_PRINT_HANDLE);
 End;
end;

procedure TfrmMain.TVListFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if odsList.recordcount > 0 then
  if get_dbname = 'SO' then
    with TOracleDataSet.create(nil) do
     begin
       try
         session := os;
         sql.text := 'select 1 from asu.tsmid where fc_synonim = ''I_PATGIST_ENDO'' and fk_id = :pid';
         declareandset('pid',otinteger,odsList.FieldByName('fk_smid').asinteger);
         open;
         if recordcount > 0 then
          begin
            aNapr.OnExecute := DoShowPatogistNapr;
          end
         else
          begin
            aNapr.OnExecute := aProsmotrExecute;
          end;
       finally
         free;
       end;
     end
  else
   aNapr.OnExecute := aProsmotrExecute;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  TVList.RestoreFromRegistry('\SoftWare\SoftMaster\ListPatAnatom\cxGrVrach_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'cxGr');
end;

procedure TfrmMain.odsKabBeforeOpen(DataSet: TDataSet);
begin
  odsKab.SetVariable('PSOTR', pSOTRID);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var Ini : TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(paramstr(0))+'DicomSettings.ini');
  try
    sCallingAET := Ini.ReadString('MAIN', 'CALLING_AET', 'MEDOTRADE');
  finally
    Ini.Free;
  end;
  GetSession(os, 'ASU');
  gDigSignature := TDigitalSignature.Create(Self);
  russian:=LoadKeyboardLayout('00000419', 0);
  Application.HelpFile:=ExtractFilePath(Application.ExeName)+'Spiski.chm';
  Self.WindowState := wsMaximized;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(gDigSignature);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
//dxBarControlContainerItem1.
end;

procedure TfrmMain.blMonClick(Sender: TObject);
var mm,yy,dd:word;
begin
  decodeDate(dxdeDate.EditValue,yy,mm,dd);
  if dd=31 then dd:=30;
  if ((mm=3) and (dd>28)) then dd:=28;
  if mm>1 then mm:=mm-1
   else
     begin
       mm:=12;
       yy:=yy-1;
     end;

  dxdeDate.EditValue:=encodeDate(yy,mm,dd);
end;

procedure TfrmMain.blWeeksClick(Sender: TObject);
begin
  dxdeDate.EditValue:=dxdeDate.EditValue-1;
end;

procedure TfrmMain.p1Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+2;
end;

procedure TfrmMain.p2Click(Sender: TObject);
var
 wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+3;
end;

procedure TfrmMain.p3Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+4;
end;

procedure TfrmMain.p4Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+5;
end;

procedure TfrmMain.p5Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+6;
end;

procedure TfrmMain.p6Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+7;
end;

procedure TfrmMain.p7Click(Sender: TObject);
var wd:integer;
begin
  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
  dxdeDate.EditValue:=dxdeDate.EditValue-wd+8;
end;

procedure TfrmMain.brWeeksClick(Sender: TObject);
begin
  dxdeDate.EditValue:=dxdeDate.EditValue+1;
end;

procedure TfrmMain.brMonClick(Sender: TObject);
var yy,mm,dd:word;
begin
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
end;

procedure TfrmMain.DateChange;
var
 yy,mm,dd:word;
 wd:integer;
// pDate:tDateTime;
begin
//  pDate:=dxdeDate.Date;
  pMonth.Caption:=FormatDateTime('mmmm',dxdeDate.EditValue)+', '+(FormatDateTime('dddd',dxdeDate.EditValue));

  wd:=dayofweek(dxdeDate.EditValue);
  if wd=1 then wd:=8;
//  pDate:=dxdeDate.Date;

//  pDate:=dxdeDate.Date-wd+2;
  decodeDate(dxdeDate.EditValue-wd+2,yy,mm,dd);
  p1.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+3;
  decodeDate(dxdeDate.EditValue-wd+3,yy,mm,dd);
  p2.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+4;
  decodeDate(dxdeDate.EditValue-wd+4,yy,mm,dd);
  p3.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+5;
  decodeDate(dxdeDate.EditValue-wd+5,yy,mm,dd);
  p4.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+6;
  decodeDate(dxdeDate.EditValue-wd+6,yy,mm,dd);
  p5.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+7;
  decodeDate(dxdeDate.EditValue-wd+7,yy,mm,dd);
  p6.Caption:=inttostr(dd);

//  pDate:=dxdeDate.Date-wd+8;
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

procedure TfrmMain.aPreviewExecute(Sender: TObject);
begin
  DoResult(odsList.FieldByName('FK_ID').AsInteger);
end;

procedure TfrmMain.DoResult(nNazID: Integer);
var q : TOracleDataSet;
    ods : TOracleDataSet;
    LOB : TLOBLocator;
    IDRes : Integer;
    RegSave, RegLoad : TRegIniFile;
begin
  Application.CreateForm(TfrmPreview, frmPreview);
//------------------------------------------------------------------------------
  RegLoad := TRegIniFile.Create;
  RegLoad.RootKey:=HKEY_CURRENT_USER;
  RegLoad.OpenKey('\Software\Softmaster\Print\ID_VRACH'+IntToStr(pSotrID), True);
  frmPreview.bbFormat.ItemIndex := RegLoad.ReadInteger('\Software\Softmaster\Print\ID_VRACH'+IntToStr(pSOTRID), 'RazmerList', 0);
  RegLoad.Free;
//------------------------------------------------------------------------------
  if not DirectoryExists(ExtractFilePath(paramstr(0))+'RGIMAGES') then
    CreateDir(ExtractFilePath(paramstr(0))+'RGIMAGES');
//------------------------------------------------------------------------------
  ods := TOracleDataSet.Create(nil);
  ods.Session := os;
  ods.Cursor := crSQLWait;
  ods.SQL.Text := ' SELECT FK_ID FROM asu.VRES WHERE FK_NAZID ='+IntToStr(nNazID);
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
  LOB.SaveToFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+inttostr(odsList.FieldByName('FK_PACID').AsInteger) +'print.htm');
  q.Free;
  LOB.Free;
  frmPreview.wb.Navigate(ExtractFilePath(paramstr(0))+'RGIMAGES'+inttostr(odsList.FieldByName('FK_PACID').AsInteger) +'print.htm');
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
      DoWordProcess(ExtractFilePath(paramstr(0))+'RGIMAGES'+inttostr(odsList.FieldByName('FK_PACID').AsInteger) +'print.htm', frmPreview.bbFormat.ItemIndex);
      try
        DeleteFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+inttostr(odsList.FieldByName('FK_PACID').AsInteger) +'print.htm');
      except
      end;
      frmPreview.Free;
    end else
    begin
      try
        DeleteFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+inttostr(odsList.FieldByName('FK_PACID').AsInteger) +'print.htm');
      except
      end;
      frmPreview.Free;
    end;
end;

procedure TfrmMain.DoResultHTML(nNazID, nPacID: Integer);
var oq : TOracleDataSet;
    ods : TOracleDataSet;
    LOB : TLOBLocator;
    IDRes : Integer;
    RegSave, RegLoad : TRegIniFile;
    vBeforePrintCallBack: TBeforePrintCallBack;
begin
  vBeforePrintCallBack := nil;
  Application.CreateForm(TfrmPreview, frmPreview);
  RegLoad := TRegIniFile.Create;
  ods := TOracleDataSet.Create(nil);
  oq := TOracleDataSet.Create(nil);
  lob := TLOBLocator.Create(os, otCLOB);
  try
    RegLoad.RootKey := HKEY_CURRENT_USER;
    RegLoad.OpenKey('\Software\Softmaster\Print\ID_VRACH'+IntToStr(pSotrID), True);
    frmPreview.bbFormat.ItemIndex := RegLoad.ReadInteger('\Software\Softmaster\Print\ID_VRACH'+IntToStr(pSOTRID), 'RazmerList', 0);
    frmPreview.beiKolvoCopy.EditValue := RegLoad.ReadInteger('\Software\Softmaster\Print\ID_VRACH'+IntToStr(pSOTRID), 'CountCopy', 0);
    if frmPreview.beiKolvoCopy.EditValue = 0 then
      frmPreview.beiKolvoCopy.EditValue := 1;    
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_ID FROM asu.VRES WHERE FK_NAZID = :pfk_nazid ';
    ods.DeclareAndSet('pfk_nazid', otInteger, nNazID);
    ods.Open;
    IDRes := ods.FieldByName('FK_ID').AsInteger;
    ods.DeleteVariables;
    ods.Close;
    ods.SQL.Text := ' SELECT THTMLIMAGES.FC_NAME||''.JPG'' SFILENAME, THTMLIMAGES.FB_BLOB '+#13+
                    '   FROM ASU.TRICHVIEWDATA, ASU.THTMLIMAGES '+#13+
                    '  WHERE TRICHVIEWDATA.FK_PACID = :pfk_pacid '+#13+
                    '    AND THTMLIMAGES.FK_RICHVIEW = TRICHVIEWDATA.FK_ID ';
    ods.DeclareAndSet('pfk_pacid', otInteger, nNazID);
    ods.Open;
    if ods.RecordCount > 0 then
      begin
        while not ods.Eof do
          begin
            TBlobField(ods.FieldByName('FB_BLOB')).SaveToFile(ExtractFilePath(paramstr(0))+ods.FieldByName('SFILENAME').AsString);
            BmpToJPEG(ods.FieldByName('SFILENAME').AsString, ods.FieldByName('SFILENAME').AsString);
            ods.Next;
          end;
      end;

    oq.Session:=os;
    oq.Cursor := crSQLWait;
    oq.DeclareVariable('html', otCLOB);
    oq.SetComplexVariable('html', LOB);
    oq.SQL.Add(' begin ');
    oq.SQL.Add('  dbms_lob.createtemporary(:html, TRUE, dbms_lob.SESSION); ');
    oq.SQL.Add('  dbms_lob.WRITE(:html,1,1,'' ''); ');
    if get_dbname = 'SO1' then
     oq.SQL.Add('  :html := asu.GET_HTM_OSM_KOLYA('+IntToStr(IDRes)+', /*:pBase, */1/*, :pCompany, :pOtdel*/); ')
    else
     oq.SQL.Add('  :html := asu.GET_HTM_OSM_KOLYA('+IntToStr(IDRes)+', :pBase, 1, :pCompany, :pOtdel); ');
    oq.SQL.Add(' end; ');                                              
    if get_dbname <> 'SO1' then
     begin
      oq.DeclareAndSet('pBase', otString, get_dbname);
      oq.DeclareAndSet('pCompany', otString, sCompanyName_4Rep);
      oq.DeclareAndSet('pOtdel', otString, sOtdelName_4Rep);
     end;
    oq.Open;

    lob := TLOBLocator(oq.GetComplexVariable('html'));
    lob.SaveToFile(ExtractFilePath(paramstr(0))+inttostr(nPacID) +'print.htm');
    frmPreview.wb.Navigate(ExtractFilePath(paramstr(0))+inttostr(nPacID) +'print.htm');
    frmPreview.ShowModal;
    if frmPreview.ModalResult = MrOk then
      begin
        RegSave := TRegIniFile.Create;
        RegSave.RootKey:=HKEY_CURRENT_USER;
        if not RegSave.OpenKey('\Software\Softmaster\Print\', False) then
          begin
            RegSave.CreateKey('\Software\Softmaster\Print');
          end;
        try
          RegSave.WriteInteger('\Software\Softmaster\Print\ID_VRACH'+IntToStr(pSotrID), 'RazmerList', frmPreview.bbFormat.ItemIndex);
          RegSave.WriteInteger('\Software\Softmaster\Print\ID_VRACH'+IntToStr(pSotrID), 'CountCopy', frmPreview.beiKolvoCopy.EditValue);
        except
        end;
        RegSave.Free;
        DoPrintDocument(ExtractFilePath(paramstr(0))+inttostr(nPacID) +'print.htm',
                        frmPreview.bbFormat.ItemIndex,
                        False,
                        False,
                        vBeforePrintCallBack,
                        frmPreview.beiKolvoCopy.EditValue);
        try
          DeleteFile(ExtractFilePath(paramstr(0))+inttostr(nPacID) +'print.htm');
          ods.First;
          while not ods.Eof do
            begin
              DeleteFile(ExtractFilePath(paramstr(0))+ods.FieldByName('SFILENAME').AsString);
              ods.Next;
            end;
        except
        end;
      end else
      begin
        try
          DeleteFile(ExtractFilePath(paramstr(0))+inttostr(nPacID) +'print.htm');
          ods.First;
          while not ods.Eof do
            begin
              DeleteFile(ExtractFilePath(paramstr(0))+ods.FieldByName('SFILENAME').AsString);
              ods.Next;
            end;
        except
        end;
      end;
  finally
    RegLoad.Free;
    ods.Free;
    oq.Free;
    lob.Free;
    frmPreview.Free;
  end;
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

procedure TfrmMain.dxdeDateChange(Sender: TObject);
begin
  case beirgDate.editvalue of
   1: odsList.setvariable('pdate','fd_naz');
   2: odsList.setvariable('pdate','(select fd_date from asu.tib where fk_pacid = isl.fk_id and fk_smid = (select fk_id from asu.tsmid where fc_synonim = ''DATEIN_PATANATOM''))');
  else
    odsList.setvariable('pdate','fd_run');
  end;
  DateChange;
  paDate.Repaint;
  paDate.Refresh;
  p1.Repaint;
  p1.Refresh;
  p2.Repaint;
  p2.Refresh;
  p3.Repaint;
  p3.Refresh;
  p4.Repaint;
  p4.Refresh;
  p5.Repaint;
  p5.Refresh;
  p6.Repaint;
  p6.Refresh;
  p7.Repaint;
  p7.Refresh;
  aRefreshExecute(nil);
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

procedure TfrmMain.aEditNazExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmEditNaz, frmEditNaz);
  frmEditNaz.DoShowEditNaz(odsList.FieldByName('FK_PACID').AsInteger,
                           pSOTRID,
                           odsList.FieldByName('PEPLID').AsInteger,
                           odsList.FieldByName('VRACHFIO').AsString,
                           Trunc(odsList.FieldByName('FD_RUN').AsDateTime),
                           odsList.FieldByName('FK_ROOMID').AsInteger,
                           odsList.FieldByName('FK_SMID').AsInteger,
                           odsList.FieldByName('FK_ID').AsInteger);
  frmEditNaz.ShowModal;
  if frmEditNaz.ModalResult = MrOK then
    begin
      oq := TOracleQuery.Create(nil);
      try
        oq.Session := os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' UPDATE TNAZIS SET FD_RUN = :PFD_RUN, FK_ROOMID = :PFK_ROOMID, fl_in_raspis = 1 WHERE FK_ID = :PFK_ID ';
        oq.DeclareAndSet('PFD_RUN', otDate, StrToDateTime(DateToStr(frmEditNaz.cxdeDate.Date)+' '+FormatDateTime('hh:nn:ss', frmEditNaz.cxteTime.Time)));
        oq.DeclareAndSet('PFK_ROOMID', otInteger, frmEditNaz.cxlcKabinet.EditValue);
        oq.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        oq.Execute;
        os.Commit;
        RefreshQuery(odsList);
      finally
        oq.Free;
      end;
    end;
  frmEditNaz.Free;
end;

procedure TfrmMain.aInfoExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmPacInfoDiagnost, frmPacInfoDiagnost);
  try
    frmPacInfoDiagnost.DoShowPacInfo(odsList.FieldByName('FK_PACID').AsInteger,
                                     odsList.FieldByName('PEPLID').AsInteger,
                                     odsList.FieldByName('VRACHFIO').AsString);
    frmPacInfoDiagnost.ShowModal;
  finally
    frmPacInfoDiagnost.Free;
  end;
end;

procedure TfrmMain.aLaborantExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmLabPatAnatom, frmLabPatAnatom);
  try
    frmLabPatAnatom.rowOtdel.Properties.Value := odsList.FieldByName('otdel_vrach').AsString;
    frmLabPatAnatom.DoShowForm(odsList.FieldByName('IS_AMB').AsInteger,
                               odsList.FieldByName('FD_RUN_STR').AsString,
                               odsList.FieldByName('FC_NAME').AsString+odsList.FieldByName('PARAM').AsString,
                               odsList.FieldByName('NUMISSL').AsString,
                               odsList.FieldByName('FK_NAZTYPEID').AsInteger,
                               odsList.FieldByName('FK_PACID').AsInteger,
                               odsList.FieldByName('PEPLID').AsInteger,
                               odsList.FieldByName('FK_SMID').AsInteger,
                               odsList.FieldByName('FK_ID').AsInteger);
    frmLabPatAnatom.ShowModal;
    if frmLabPatAnatom.ModalResult = mrOk then
      begin
        RefreshQuery(odsList);
      end;
  finally
    frmLabPatAnatom.Free;
  end;
end;

procedure TfrmMain.aNaprExecute(Sender: TObject);
var ods, odsT : TOracleDataSet;
    mem : TMemoryStream;
    str2 : TStringList;
begin
// -- > Цитологические исследования
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select 1 as cnt from asu.tsmid '+#13+
                    '  where fk_id = :pfk_id '+#13+
                    ' start with fc_synonim = ''I_CITOLOG'' '+#13+
                    ' connect by prior fk_id = fk_owner ';
    ods.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_smid').AsInteger);
    ods.Open;
    if ods.FieldByName('cnt').AsInteger = 1 then
      begin
        if get_dbname = 'TO' then // для Нижнего Тагила
          begin
            odsCitologNT.Close;
            odsCitologNT.SetVariable('pnazid', odsList.FieldByName('fk_id').AsInteger);
            odsCitologNT.Open;
            sDateSys_4Rep := odsCitologNT.FieldByName('datesys').AsString;
            frxCitologNT.ShowReport;
            exit;
          end else
          begin
            odsCitolog.Close;
            odsCitolog.SetVariable('ppacid', odsList.FieldByName('fk_pacid').AsInteger);
            odsCitolog.SetVariable('pvrachid', odsList.FieldByName('fk_vrachid').AsInteger);
            odsCitolog.Open;
            frxCitolog.ShowReport;
            exit;
          end;
      end;
  finally
    ods.Free;
  end;
// -- > Патогистологические исследования
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select 1 as cnt from asu.tsmid '+#13+
                    '  where fk_id = :pfk_id '+#13+
                    ' start with fc_synonim = ''I_PATGIST'' '+#13+
                    ' connect by prior fk_id = fk_owner ';
    ods.DeclareAndSet('pfk_id', otInteger, odsList.FieldByName('fk_smid').AsInteger);
    ods.Open;
    if ods.FieldByName('cnt').AsInteger = 1 then
      begin
        odsPatGist.Close;
        odsPatGist.SetVariable('ppacid', odsList.FieldByName('fk_pacid').AsInteger);
        odsPatGist.SetVariable('pvrachid', odsList.FieldByName('fk_vrachid').AsInteger);
        odsPatGist.SetVariable('pnazid', odsList.FieldByName('fk_id').AsInteger);
        odsPatGist.Open;
        if get_dbname = 'TO' then
          begin
            strOper_4Rep := '';
            odsT := TOracleDataSet.Create(nil);
            mem := TMemoryStream.Create;
            str2 := TStringList.Create;
            try
              odsT.Session := os;
              odsT.Cursor := crSQLWait;
              odsT.SQL.Text := ' SELECT fb_html as fb_text FROM ASU.TRICHVIEWDATA WHERE FK_PACID = :PFK_PACID ';
              odsT.DeclareAndSet('PFK_PACID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
              odsT.Open;
              RvHtmlImporter1.LoadHtml(odsT.FieldByName('FB_TEXT').AsString); // формируем основной текст протокола
              rve1.SaveRTFToStream(mem, false);
              mem.Position := 0;
              str2.LoadFromStream(mem);
              mem.Clear;
              rve1.Clear;
              rve1.Reformat;
              sTextIssl_4Rep := str2.Text;
              odsT.DeleteVariables;
              odsT.Close;
              odsT.SQL.Text := ' select to_char(sysdate, ''dd.mm.yyyy'') as datesys from dual ';
              odsT.Open;
              sDateSys_4Rep := odsT.FieldByName('datesys').AsString;
              odsT.DeleteVariables;
              odsT.Close;
              odsT.SQL.Text := ' select to_char(fd_run, ''dd.mm.yyyy hh24:mi'') ||'' ''|| '+#13+
                               '        (select fc_char '+#13+
                               '           from asu.tib where tib.fk_pacid = v.fk_id '+#13+
                               '            and tib.fk_smid = (select fk_id from asu.tsmid where fc_synonim like ''PROTHOPER_NAME'')) as fc_name '+#13+
                               '   from asu.vnaz v '+#13+
                               '  where fk_pacid = :pfk_pacid '+#13+
                               '    and fk_smid = any (select fk_id from asu.tsmid where fc_synonim in (''KONS_PROTHOPER'',''RENTGENXIR_OPER'')) '+#13+
                               '    and fk_nazsosid = asu.get_vipnaz ';
              odsT.DeclareAndSet('pfk_pacid', otInteger, odsList.FieldByName('fk_pacid').AsInteger);
              odsT.Open;
              odsT.First;
              while not odsT.Eof do
                begin
                  strOper_4Rep := strOper_4Rep+odsT.FieldByName('fc_name').AsString +'; ';
                  odsT.Next;
                end;
              strOper_4Rep := copy(strOper_4Rep, 1, Length(strOper_4Rep)-2);
            finally
              mem.Free;
              str2.Free;
              odsT.Free;
            end;
            frxPatGist_NT.ShowReport; // для Нижнего Тагила Онко
          end else
          begin
            frxPatGist.ShowReport; // для всех остальных
          end;
        exit;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.aNevipExecute(Sender: TObject);
var oq : TOracleQuery;
    ods : TOracleDataSet;
begin
// -- Делаем проверку можно ли редактировать
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select sysdate - fd_date as raz, '+#13+
                    '        to_char(fd_date, ''dd.mm.yyyy hh24:mi'') as fd_date_str '+#13+
                    '   from asu.tpodpisnaz '+#13+
                    '  where fk_nazid = :pfk_nazid and fk_sos = asu.get_vipnaz ';
    ods.DeclareAndSet('pfk_nazid', otInteger, dsList.DataSet.FieldByName('fk_id').AsInteger);
    ods.Open;
    if get_dbname = 'TO' then
      begin
        if ods.FieldByName('raz').AsInteger > 7 then    
          begin
            MessageDlg('С момента первой подписи протокола исследования прошло более 7 суток! '+#13+#10+
                       'Любые действия с протоколом запрещены!'+#13+#10+
                       'Дата первого подписания:'+ods.FieldByName('fd_date_str').AsString,
                       mtWarning,
                       [mbOK],
                       0);
            exit;
          end;
      end else
      begin
        if ods.FieldByName('raz').AsInteger > 2 then
          begin
            MessageDlg('С момента первой подписи протокола исследования прошло более 2-ух суток! '+#13+#10+
                       'Любые действия с протоколом запрещены!'+#13+#10+
                       'Дата первого подписания:'+ods.FieldByName('fd_date_str').AsString,
                       mtWarning,
                       [mbOK],
                       0);
            exit;
          end;
      end;
  finally
    ods.Free;
  end;
// -- Меняем статус исследования на "Не вып."
	if Application.MessageBox('Вы собираетесь изменить статус исследования на "НЕ ВЫП."! Вы уверены?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
		begin
			oq := TOracleQuery.Create(nil);
			try
        oq.Session := frmMain.os;
        oq.Cursor := crSQLWait;
        oq.SQL.Text := ' begin '+#13+
                       '   update asu.tnazis set fk_nazsosid = asu.get_nevip where fk_id = :pfk_id; '+#13+
                       '   delete from asu.vres where fk_nazid = :pfk_id; '+#13+
                       '   delete from asu.tresis where fk_nazid = :pfk_id; '+#13+
                       ' end; ';
        oq.DeclareAndSet('PFK_ID', otInteger, odsList.FieldByName('FK_ID').AsInteger);
        oq.Execute;
        frmMain.os.Commit;
        RefreshQuery(odsList);
      finally
        oq.Free;
      end;
    end;
end;

procedure TfrmMain.aEditExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select sysdate - fd_date as raz, '+#13+
                    '        to_char(fd_date, ''dd.mm.yyyy hh24:mi'') as fd_date_str '+#13+
                    '   from asu.tpodpisnaz '+#13+
                    '  where fk_nazid = :pfk_nazid and fk_sos = asu.get_vipnaz ';
    ods.DeclareAndSet('pfk_nazid', otInteger, dsList.DataSet.FieldByName('fk_id').AsInteger);
    ods.Open;
    if get_dbname = 'TO' then // для Нижнего Тагила Онко
      begin
        if ods.FieldByName('raz').AsInteger > listpatanatom_days2edit then
          begin
            MessageDlg('С момента первой подписи протокола исследования прошло более ' + inttostr(listpatanatom_days2edit) + ' суток! '+#13+#10+
                       'Изменить протокол исследования невозможно!'+#13+#10+
                       'Дата первого подписания:'+ods.FieldByName('fd_date_str').AsString,
                       mtWarning,
                       [mbOK],
                       0);
            exit;
          end;
      end else
      begin
        if ods.FieldByName('raz').AsInteger > 2 then
          begin
            MessageDlg('С момента первой подписи протокола исследования прошло более 2-ух суток! '+#13+#10+
                       'Изменить протокол исследования невозможно!'+#13+#10+
                       'Дата первого подписания:'+ods.FieldByName('fd_date_str').AsString,
                       mtWarning,
                       [mbOK],
                       0);
            exit;
          end;
      end;
  finally
    ods.Free;
  end;

  HandleDLL := LoadLibrary('PriemDll.dll'); // загружаем длл
  if HandleDLL <> 0 then
    begin
      EditPlugin_Personal := GetProcAddress(HandleDLL, 'EditPlugin_Personal');
      if @EditPlugin_Personal <> nil then
      begin
        try
          @SetSignFnc := GetProcAddress(HandleDLL, 'SetSignFnc');
          if Assigned(@SetSignFnc) then
            SetSignFnc(frmMain.gDigSignature.SignDocument);
					EditPlugin_Personal(Panel1.Handle, //хэндл панели
															Application.Handle, //хэндл аппликейшена
															odsList.FieldByName('FK_PACID').AsInteger, //код пациента
															pSOTRID, //код сотрудника
															pAPPSOTRID, //специализация
															-1, //секция
															odsList.FieldByName('FK_SMID').AsInteger, //смид
															odsList.FieldByName('FK_ID').AsInteger, //назид
															FALSE,
															odsList.FieldByName('FK_ID').AsInteger, //ид объекта
															Panel1.Parent.Handle);
        except
        end;
      end;
    end;
  try
    Application.ProcessMessages;
    FreeLibrary(HandleDLL);
    HandleDll:=0;
  except
  end;
  RefreshQuery(odsList);
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

procedure TfrmMain.cxPrOtmenaPropertiesEditValueChanged(Sender: TObject);
begin
  if cxPrOtmena.EditValue = 1 then
    begin
      odsList.Filtered := FALSE;
    end else
    begin
      odsList.Filtered := TRUE;
      odsList.Filter := 'FK_NAZSOSID <> '+ IntToStr(GET_NAZCANCEL);
    end;
end;

procedure TfrmMain.frxCitologGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'OTDEL' then Value := odsCitolog.FieldByName('otdel').AsString;
  if VarName = 'IB' then Value := odsCitolog.FieldByName('numib').AsString;
  if VarName = 'VRACHFIOTEL' then Value := odsCitolog.FieldByName('vrachfiotel').AsString;
  if VarName = 'FIO' then Value := odsList.FieldByName('FIOPAC').AsString;
  if VarName = 'ROJD' then Value := odsList.FieldByName('FD_ROJD').AsDateTime;
  if VarName = 'SEX' then Value := odsList.FieldByName('SEX').AsString;
  if VarName = 'ADR' then Value := odsCitolog.FieldByName('adr').AsString;
  if VarName = 'WORKPLACE' then Value := odsCitolog.FieldByName('workplace').AsString;
  if VarName = 'INSUR_NAME' then Value := odsCitolog.FieldByName('insur_name').AsString;
  if VarName = 'INSUR_SER' then Value := odsCitolog.FieldByName('insur_ser').AsString;
  if VarName = 'OSNZABOL2' then Value := odsCitolog.FieldByName('osnzabol2').AsString;
  if VarName = 'NAPRAVIL' then Value := odsCitolog.FieldByName('napravil').AsString;
end;

procedure TfrmMain.frxCitologNTGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'FIO' then Value := odsList.FieldByName('FIOPAC').AsString;
  if VarName = 'ROJD' then Value := odsList.FieldByName('FD_ROJD').AsDateTime;
  if VarName = 'OSNZABOL2' then Value := odsCitologNT.FieldByName('DIAG').AsString;
  if VarName = 'VRACH' then Value := odsList.FieldByName('VRACHFIO').AsString;
  if VarName = 'KOLVO_ST' then Value := odsCitologNT.FieldByName('KOLVO').AsString;
  if VarName = 'MATERIAL' then Value := odsCitologNT.FieldByName('MAT_CHAR').AsString;
  if VarName = 'DATESYS' then Value := sDateSys_4Rep;
  if VarName = 'NUMISSL' then Value := odsList.FieldByName('numissl').AsString;
  if VarName = 'ZAKL' then Value := odsCitologNT.FieldByName('zakl').AsString;
  if VarName = 'ISPOLFIO' then Value := odsList.FieldByName('ispolfio').AsString;
end;

procedure TfrmMain.frxPatGistGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'TOWN' then Value := odsPatGist.FieldByName('town').AsString;
  if VarName = 'OTDEL' then Value := odsPatGist.FieldByName('otdel').AsString;
  if VarName = 'NAMEBOLN' then Value := odsPatGist.FieldByName('nameboln').AsString;
  if VarName = 'FIO' then Value := odsList.FieldByName('FIOPAC').AsString;
  if VarName = 'AGE_NOW' then Value := odsList.FieldByName('AGE').AsInteger;
  if VarName = 'SEX' then Value := odsList.FieldByName('SEX').AsString;
  if VarName = 'IB' then Value := odsPatGist.FieldByName('numib').AsString;
  if VarName = 'HMDY' then Value := odsPatGist.FieldByName('hmdy').AsString;
  if VarName = 'OSNZABOL2' then Value := odsPatGist.FieldByName('osnzabol2').AsString;
  if VarName = 'OSLZABOL' then Value := odsPatGist.FieldByName('oslzabol').AsString;
  if VarName = 'SOPUTZABOL' then Value := odsPatGist.FieldByName('soputzabol').AsString;
end;

procedure TfrmMain.frxPatGist_NTGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'OTDEL' then Value := odsPatGist.FieldByName('otdel').AsString;
  if VarName = 'FIOSOTR' then Value := odsList.FieldByName('VRACHFIO').AsString;
  if VarName = 'FIO' then Value := odsList.FieldByName('FIOPAC').AsString;
  if VarName = 'AGE_NOW' then Value := odsList.FieldByName('AGE').AsInteger;
  if VarName = 'SEX' then Value := odsList.FieldByName('SEX').AsString;
  if VarName = 'IB' then Value := odsPatGist.FieldByName('numib').AsString;
  if VarName = 'HMDY' then Value := odsPatGist.FieldByName('hmdy').AsString;
  if VarName = 'OSNZABOL2' then Value := odsPatGist.FieldByName('osnzabol2').AsString;
  if VarName = 'SOPUTZABOL' then Value := odsPatGist.FieldByName('soputzabol').AsString;
  if VarName = 'TEXTISSL' then Value := sTextIssl_4Rep;
  if VarName = 'NAMEISSL' then Value := odsList.FieldByName('fc_name').AsString+' '+odsList.FieldByName('param').AsString;
  if VarName = 'OPER' then Value := strOper_4Rep;
  if VarName = 'DATESYS' then Value := sDateSys_4Rep;
  if VarName = 'SOTR' then Value := sSotrFIO;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.frxPrintListGetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'KAB' then Value := odsKab.FieldByName('FC_NAME').AsString;
  if VarName = 'DATENOW' then Value := VarToDateTime(dxdeDate.EditValue);
  if VarName = 'SYSDATE' then Value := GET_SYSDATE_4REP;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;  
end;

procedure TfrmMain.frxRepKabGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'DATESYS' then Value := GET_SYSDATE_4REP;
  if VarName = 'KOLVO' then Value := odsKab.RecordCount;
  if VarName = 'SOTRNAME' then Value := sSotrFIO;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;  
end;

procedure TfrmMain.frxRepProsmotrGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'AGE' then Value := odsList.FieldByName('AGE').AsInteger;
  if VarName = 'PACFIO' then Value := odsList.FieldByName('FIOPAC').AsString;
  if VarName = 'RUNDATE' then Value := odsList.FieldByName('FD_RUN_STR').AsString;
  if VarName = 'ISSLNAME' then Value := odsList.FieldByName('FC_NAME').AsString;  
  if VarName = 'ADDR' then Value := sADDR_4Rep;
  if VarName = 'DIAG' then Value := sDIAG_4Rep;
  if VarName = 'ISSLTEXT' then Value := sTextIssl_4Rep;
  if is_digsig = True then
    begin
      if VarName = 'SOTRNAME' then Value := 'ЭЦП '+sSotr_4Rep; //odsList.FieldByName('ISPOLFIO').AsString
    end else
    begin
      if VarName = 'SOTRNAME' then Value := sSotr_4Rep; //odsList.FieldByName('ISPOLFIO').AsString;
    end;
  if VarName = 'PHONEKAB' then Value := sPhone_4Rep;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
  if VarName = 'SOTRSPEC' then Value := sSotrSpec_4Rep;
  if VarName = 'NUMMK' then Value := sNumMK_4Rep;
  if VarName = 'ROJD' then Value := odsList.FieldByName('FD_ROJD').AsDateTime;
  if VarName = 'SEX' then Value := odsList.FieldByName('SEX').AsString;
  if VarName = 'SOTRNAME2' then Value := sSotr2_4Rep;
  if VarName = 'SOTRSPEC2' then Value := sSotrSpec2_4Rep;
end;

function TfrmMain.Get_Pac_NUMIB(pFK_PacID: Integer): String;
var
  ODS: TOracleDataSet;
begin
  Result := '';
  ods := TOracleDataSet.Create(nil);

  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT asu.pkg_regist_pacfunc.GET_PAC_IB(:PACID) NUM_IB FROM DUAL';
    ods.DeclareAndSet(':PACID', otInteger, pFK_PACID);
    ods.Open;
    Result := ods.FieldByName('NUM_IB').AsString;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.tbnPrintClick(Sender: TObject);
var ods : TOracleDataSet;
begin
  if odsList.RecordCount <> 0 then
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS SYSTEMDATE FROM DUAL ';
        ods.Open;
        GET_SYSDATE_4REP := ods.FieldByName('SYSTEMDATE').AsString;
      finally
        ods.Free;
      end;
      frxPrintList.ShowReport;
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
                    tmrCheckApplication.Enabled:=False;
                    Screen.Cursor:=crDefault;
                    aOpen.Enabled:=True;
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

end.
