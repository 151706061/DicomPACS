unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls,
  cxInplaceContainer, Oracle, cxMaskEdit, cxDBTL, cxTLData, DB, OracleData,
  dxBar, ActnList, ImgList, ShellAPI, ExtCtrls, jvDBUtils, Menus,
  cxContainer, cxEdit, cxTextEdit, cxMemo, cxRichEdit, cxSplitter, Registry, Word2000,
  cxCheckBox, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxGridExportLink, jpeg,
  cxImage, cxDBEdit, frxClass, frxDBSet, dxBarExtDBItems, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxBarPainter, cxLabel,
  cxLookAndFeelPainters, StdCtrls, cxButtons, Clipbrd, JclFileUtils,
  cxBarEditItem, uGlobalConst, uDigitalSignature, SMMainAPI,
  dxSkinOffice2007Green, IniFiles, Medotrade, cxLookAndFeels, dxSkinsForm, cxSpinEdit;


const
  WM_REFRESHNAZ = WM_USER + 100;

type
  TSaveAsTemplate = procedure(AppHandle: THandle;pSotrID, pSmidRazd : Integer; pNazArr : Pointer); stdcall;
  TLoadFromTemplate = procedure(AppHandle: THandle; pSotrID, pSmidRazd, pPacID, pOsmotrID : Integer); stdcall;

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
																	hMainForm : THandle = 0) : LongInt; stdcall;
	TInitPlugin = function(HostObjHandle: THandle; App: THandle; nPacID: Integer; nSotrID : Integer; nSpecID : Integer; nSecID : Integer = -1; nSmidID : Integer = -1; nNazID : Integer = -1; bReadOnly : Boolean = false; ObjID : Integer=-1; hMainForm : THandle = 0) : LongInt; stdcall;
	TEditPlugin = function(HostObjHandle: THandle; App: THandle; nPacID: Integer; nSotrID : Integer; nSpecID : Integer; nSecID : Integer = -1; nSmidID : Integer = -1; nNazID : Integer = -1; bReadOnly : Boolean = false; ObjID : Integer=-1; hMainForm : THandle = 0) : LongInt; stdcall;
  TResizePlugin = function(Panel_HND: THandle): LongInt; stdcall;
  TFreePlugin = function(): LongInt; stdcall;

  TInitDLLWizzard = function(OSS: TOracleSession; Panel_HND, App_HND, Wnd_HND: THandle; pPacID, pSotrID, pAppSotrID, pOsmotrID, pRootID:Integer): THandle; stdcall;
  TResizeDLLWizzard = procedure(Panel_HND : THandle); stdcall;
  TFreeDLLWizzard = procedure ; stdcall;

  TFoundPac = function(Panel_HND, App_HND: THandle; nPacID, nS3otrID, nSpecID, nSecID, nSmidID: Integer): LongInt; stdcall;

  TfrmMain = class(TForm)
    os: TOracleSession;
    BM: TdxBarManager;
    bbRefresh: TdxBarButton;
    bbOpenIB: TdxBarButton;
    bbEdit: TdxBarButton;
    IL: TImageList;
    al: TActionList;
    aRefresh: TAction;
    aEdit: TAction;
    aOpenIB: TAction;
    aClose: TAction;
    paMain: TPanel;
    paText: TPanel;
    split1: TcxSplitter;
    bbResult: TdxBarButton;
    aResult: TAction;
    bbAddFast: TdxBarButton;
    aAddFast: TAction;
    bbAdd: TdxBarButton;
    aAdd: TAction;
    dsNaz: TDataSource;
    odsNaz: TOracleDataSet;
    Timer1: TTimer;
    aArchive: TAction;
    aPrint: TAction;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    sdPopUp: TSaveDialog;
    pmTV: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    bbCancelNaz: TdxBarButton;
    aCancelNaz: TAction;
    N1: TMenuItem;
    odsTypePac: TOracleDataSet;
    dsTypePac: TDataSource;
    aSearchPac: TAction;
    odsNazPepl: TOracleDataSet;
    aPacInfo: TAction;
    odsNazSMIDNAME: TStringField;
    odsNazFC_NAME: TStringField;
    odsNazFK_ID: TFloatField;
    odsNazFK_NAZSOSID: TFloatField;
    odsNazFK_NAZTYPEID: TFloatField;
    odsNazSTATE: TStringField;
    odsNazFK_SMID: TFloatField;
    odsNazPARAM: TStringField;
    odsNazPAT: TStringField;
    odsNazOTKAZ: TStringField;
    odsNazVRACHFIO: TStringField;
    odsNazPeplSMIDNAME: TStringField;
    odsNazPeplFC_NAME: TStringField;
    odsNazPeplFK_ID: TFloatField;
    odsNazPeplFK_NAZSOSID: TFloatField;
    odsNazPeplFK_NAZTYPEID: TFloatField;
    odsNazPeplSTATE: TStringField;
    odsNazPeplFK_SMID: TFloatField;
    odsNazPeplPARAM: TStringField;
    odsNazPeplPAT: TStringField;
    odsNazPeplOTKAZ: TStringField;
    odsNazPeplVRACHFIO: TStringField;
    bbChange: TdxBarButton;
    actChange: TAction;
    odsNazFK_PACID: TFloatField;
    odsNazPeplFK_PACID: TFloatField;
    odsNazPeplFD_RUN: TDateTimeField;
    odsNazFD_RUN: TDateTimeField;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    lbFIO: TcxLabel;
    bClose: TcxButton;
    bFind: TcxButton;
    bInfo: TcxButton;
    bBase: TcxButton;
    bOpenMK: TcxButton;
    Panel2: TPanel;
    Panel3: TPanel;
    cxLabel3: TcxLabel;
    Panel4: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    cxgr: TcxGrid;
    TVISSLED: TcxGridDBTableView;
    VSMIDNAME: TcxGridDBColumn;
    VISSLEDNAME: TcxGridDBColumn;
    VDATE: TcxGridDBColumn;
    VSTATE: TcxGridDBColumn;
    VSHOWPAC: TcxGridDBColumn;
    VPARAM: TcxGridDBColumn;
    VISSLEDSOS: TcxGridDBColumn;
    VISSLEDPAT: TcxGridDBColumn;
    VISSLEDPODT: TcxGridDBColumn;
    VISSLEDOTKAZ: TcxGridDBColumn;
    TVFK_NAZTYPE: TcxGridDBColumn;
    cxgrLevel1: TcxGridLevel;
    pmFIO: TPopupMenu;
    N2: TMenuItem;
    bbPrint: TdxBarButton;
    N3: TMenuItem;
    frxRepList: TfrxReport;
    frxDBList: TfrxDBDataset;
    odsNazFD_RUN_STR: TStringField;
    odsNazPeplFD_RUN_STR: TStringField;
    paProtocol: TPanel;
    lbText: TcxLabel;
    bCloseNaz: TcxButton;
    paProsmotr: TPanel;
    cxreProsmotr: TcxRichEdit;
    bbProsmotr: TdxBarButton;
    aProsmotr: TAction;
    frxRepProsmotr: TfrxReport;
    odsNazAGE: TFloatField;
    odsNazISPOLFIO: TStringField;
    odsNazPeplAGE: TFloatField;
    odsNazPeplISPOLFIO: TStringField;
    cxLabel2: TcxLabel;
    lbNumMK: TcxLabel;
    cxAll: TcxBarEditItem;
    pmNumMK: TPopupMenu;
    N4: TMenuItem;
    odsNazFK_ROOMID: TIntegerField;
    odsNazPeplFK_ROOMID: TIntegerField;
    tmrCheckApplication: TTimer;
    odsNazFK_ISPOLID: TFloatField;
    odsNazPeplFK_ISPOLID: TFloatField;
    bbSaveSh: TdxBarButton;
    bbLoadSh: TdxBarButton;
    aSaveSh: TAction;
    aLoadSh: TAction;
    VISSLEDFK_ID: TcxGridDBColumn;
    VISSLEDFK_SMID: TcxGridDBColumn;
    rprot_TO: TfrxReport;
    dxSkinController1: TdxSkinController;
    cxLookAndFeelController1: TcxLookAndFeelController;
    procedure aCloseExecute(Sender: TObject);
    procedure aOpenIBExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aResultExecute(Sender: TObject);
    procedure aAddFastExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure odsNazBeforeOpen(DataSet: TDataSet);
    procedure odsNazAfterScroll(DataSet: TDataSet);
    procedure VSHOWPACPropertiesChange(Sender: TObject);
    procedure TVISSLEDCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure paTextResize(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aArchiveExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aCancelNazExecute(Sender: TObject);
    procedure VISSLEDPODTPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure paMainResize(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure aSearchPacExecute(Sender: TObject);
    procedure odsNazPeplBeforeOpen(DataSet: TDataSet);
    procedure odsNazPeplAfterScroll(DataSet: TDataSet);
    procedure frx30GetValue(const VarName: String; var Value: Variant);
    procedure TVISSLEDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aPacInfoExecute(Sender: TObject);
    procedure actChangeExecute(Sender: TObject);
    procedure lbFIOMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbFIOMouseLeave(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure frxRepListGetValue(const VarName: string; var Value: Variant);
    procedure bCloseNazClick(Sender: TObject);
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure aProsmotrExecute(Sender: TObject);
    procedure frxRepProsmotrGetValue(const VarName: string; var Value: Variant);
    procedure TVISSLEDCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure lbNumMKMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbNumMKMouseLeave(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure cxAllPropertiesChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrCheckApplicationTimer(Sender: TObject);
    procedure aSaveShExecute(Sender: TObject);
    procedure aLoadShExecute(Sender: TObject);
    procedure rprot_TOGetValue(const VarName: string; var Value: Variant);
  private
    arFIO:array of string;
    gDigSignature: TDigitalSignature;
    SetSignFnc : TSetSignFnc;
    FILENAME : String;
    sTextIssl_4Rep : string; //??? можно ли этот текст взять из richeditа справа
    GET_SYSDATE_4REP : String;
    DateB, DateE : TDate;
    PriemHnd : THandle;
    HandleDLL : THandle;
    InitPlugin : TInitPlugin;
    EditPlugin : TEditPlugin;
    ResizePlugin : TResizePlugin;
    FreePlugin : TFreePlugin;
    EditPlugin_Personal : TEditPlugin_Personal;
    FHandleLib: THandle;
    procedure SetHandleLib(const Value: THandle);
    property HandleLib : THandle read FHandleLib write SetHandleLib;
    procedure StartTimer(var Message: tMessage); message WM_USER + 300;
    procedure UnloadDLL;                                                                     
    procedure DoWordProcess(path : String; FormatPr: Integer = 0; bLandscape: Boolean = false);
    procedure DoCreateNazWizzard(aSmid: Integer);
    procedure DoFreeNazWizzard;
    procedure RefreshOdsNaz(var Msg: TMessage); message WM_REFRESHNAZ;
    procedure SetFocusNazWizzard(var Msg: TMessage); message WM_USER + 114;
    procedure DoRefreshSmidConst;
    procedure CheckEnabledButtons;
    procedure ClearHTMLImages;
    procedure AppOnMessage(VAR Msg: TMsg; VAR Handled: Boolean);
    procedure BmpToJPEG(pFNAME1,pFNAME2:String);
    function PhysicalResolveFileType(AStream: TStream): Integer;
    function RestoreApplication(AAppCaption:string):Boolean;
    { Private declarations }
  public
    get_dicom_show, get_dicom_port, get_dicom_ip, get_dicom_called, sCallingAET : string;
    sPath : string; // путь к лаунчеру мультивокса
    Russian : HKL;
    is_digsig : Boolean;
    get_digsig, get_dbname : string;
    MedotradeSign : string;
    sCompanyName_4Rep, sOtdelName_4Rep, sPhone_4Rep : String;
    sSotrFIO : String;
    EDIT_MODE : Boolean;
    ALL_MODE : Boolean;
    pSOTRID, pPACID, pAPPSOTRID, pPEPLID : Integer;
    ANazHandle : THandle;
    FDMedNazHandle : THandle;
    IsNAZ : Boolean;
    VRACHFIO : String;
    dicom_show_3d : boolean;
    procedure DoShowForm(nSpecID: Integer; nPACID: Integer=0);
    function GetPacientFIO(pPACID: Integer):String;
    procedure DoResult(nNazID: Integer);
    procedure DoResultHTML(nNazID : Integer; nPacID : Integer);
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  GET_VIPNAZ, GET_NEVIP, GET_RG_ISSL, GET_LABVIP, GET_RECOMEND, GET_NAZCANCEL, GET_ISSLEDID, GET_NAZPLAN : Integer;

implementation

uses fPreview, fArchive, fOtmena, fPacInfoDiagnost, fSearchPeople, uReportUtils, fWait, uPrintDocument;

{$R *.dfm}

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.aOpenIBExecute(Sender: TObject);
var ods : TOracleDataSet;
    AppProcID : Integer;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT ASU.PKG_REGIST_PACFUNC.GET_PAC_FIO(:FK_PEPLID) FIOPAC FROM DUAL ';
    ods.DeclareAndSet('FK_PEPLID', otInteger, pPACID);
    ods.Open;
    if RestoreApplication(ods.FieldByName('FIOPAC').AsString) then Exit;
    SetLength(arFIO,Length(frmMain.arFIO)+1);
    arFIO[Length(frmMain.arFIO)-1]:=ods.FieldByName('FIOPAC').AsString;
    aOpenIB.Enabled:=False;
    Application.ProcessMessages;
    Screen.Cursor := crSQLWait;
    tmrCheckApplication.Enabled:=True;

    AppProcID := AppStart('IBRazdel.exe', IntToStr(dsNaz.DataSet.FieldByName('FK_PACID').AsInteger)+' '+IntToStr(-1)+' '+IntToStr(-1));
    if AppProcID = -1 then ShowMessage('Ошибка запуска приложения');
    ShowWait(dsNaz.DataSet.FieldByName('FK_PACID').AsInteger, True);
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.DoShowForm(nSPECID, nPACID: Integer);
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  pAPPSOTRID := nSpecID;
  pPACID := nPACID;
  bCloseNaz.Visible := False;
  ods := TOracleDataSet.Create(nil);
  ods.Session := os;
  ods.Cursor := crSQLWait;
  ods.SQL.Text := ' SELECT FK_SOTRID, asu.DO_VRACHFIO(FK_SOTRID) AS SOTRFIO, '+#13+
                  '        ASU.PKG_SMINI.READSTRING (''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME, '+#13+
                  '        (SELECT FC_NAME '+#13+
                  '           FROM asu.TOTDEL '+#13+
                  '          WHERE FK_ID = (SELECT FK_OTDID FROM asu.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME, '+#13+
                  '        ASU.GET_IB(:PFK_PACID) AS MK '+#13+
                  '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
  ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
  ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
  ods.Open;
  pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
  sCompanyName_4Rep := ods.FieldByName('COMPANYNAME').AsString;
  sOtdelName_4Rep := ods.FieldByName('OTDELNAME').AsString;
  sSotrFIO := ods.FieldByName('SOTRFIO').AsString;
  lbNumMK.Caption := ods.FieldByName('MK').AsString;
  DoRefreshSMIDConst;
  odsTypePac.Open;
  EDIT_MODE := TRUE;
  ALL_MODE := FALSE;
//------------------------------------------------------------------------------
  odsNaz.AfterScroll := nil;
  odsNaz.Open;
  odsNaz.AfterScroll := odsNazAfterScroll;
  odsNazAfterScroll(odsNaz);
//------------------------------------------------------------------------------
  MedotradeSign := ReadMedotradeSign;
  TVISSLED.StoreToRegistry('\SoftWare\SoftMaster\XRAYS\TVISSLED'+'Vrach'+ '_' + IntToStr(pSOTRID)+'Default', TRUE, [], 'TVISSLED');
  TVISSLED.ApplyBestFit;
  TVISSLED.RestoreFromRegistry('\SoftWare\SoftMaster\XRAYS\TVISSLED'+'Vrach'+ '_' + IntToStr(pSOTRID), FALSE, FALSE, [], 'TVISSLED');
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  frmMain.Caption := 'РАБОТА С ПРОТОКОЛАМИ('+Ver.FileVersion+'). Пользователь: '+sSotrFIO;
  lbFIO.Caption := GetPacientFIO(pPACID);
  ods.Free;
  Ver.Free;
end;

procedure TfrmMain.lbFIOMouseLeave(Sender: TObject);
begin
  lbFIO.Style.BorderStyle := ebsNone;
  lbFIO.Style.BorderColor := clBtnFace;
end;

procedure TfrmMain.lbFIOMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lbFIO.Style.BorderStyle := ebsUltraFlat;
  lbFIO.Style.BorderColor := clGray;
end;

procedure TfrmMain.lbNumMKMouseLeave(Sender: TObject);
begin
  lbNumMK.Style.BorderStyle := ebsNone;
  lbNumMK.Style.BorderColor := clBtnFace;
end;

procedure TfrmMain.lbNumMKMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lbNumMK.Style.BorderStyle := ebsUltraFlat;
  lbNumMK.Style.BorderColor := clGray;
end;

function TfrmMain.GetPacientFIO(pPACID: Integer): String;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  ods.Session := os;
  ods.Cursor := crSQLWait;
  if ALL_MODE = TRUE then
    ods.SQL.Text := ' SELECT PKG_REGIST_PEPLFUNC.GET_PEPL_FULLFIO(:PFK_PACID) AS PACFIO FROM DUAL '
  else
    ods.SQL.Text := ' SELECT PKG_REGIST_PACFUNC.GET_PAC_FULLFIO(:PFK_PACID) AS PACFIO FROM DUAL ';
  ods.DeclareAndSet('PFK_PACID', otInteger, pPACID);
  ods.Open;
  Result := ods.FieldByName('PACFIO').AsString;
  ods.Free;
end;

procedure TfrmMain.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
     id : Integer;
begin
  id := dsNaz.DataSet.FieldByName('FK_ID').AsInteger;
  dsNaz.DataSet.AfterScroll := nil;
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
  frxRepList.ShowReport;
  dsNaz.DataSet.Locate('FK_ID', id, []);
  if dsNaz.DataSet.Name = 'odsNaz' then
    dsNaz.DataSet.AfterScroll := odsNazAfterScroll;
  if dsNaz.DataSet.Name = 'odsNazPepl' then
    dsNaz.DataSet.AfterScroll := odsNazPeplAfterScroll;
end;

procedure TfrmMain.aProsmotrExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  if (get_dbname = 'SO') or (get_dbname = 'SK') then // для Сургут ОКБ, Кадио
    begin
      DoResultHTML(dsNaz.DataSet.FieldByName('fk_id').AsInteger, dsNaz.DataSet.FieldByName('fk_pacid').AsInteger); // формируем в HTML
    end else
    begin
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT (SELECT FB_TEXT FROM ASU.TRICHVIEWDATA WHERE FK_PACID = :PFK_PACID) AS FB_TEXT, '+#13+
                        '        (SELECT FC_PHONE FROM ASU.TKABINET WHERE FK_ID = :PFK_ID) AS FC_PHONE '+
                        '   FROM DUAL ';
        ods.DeclareAndSet('PFK_PACID', otInteger, dsNaz.DataSet.FieldByName('FK_ID').AsInteger);
        ods.DeclareAndSet('PFK_ID', otInteger, dsNaz.DataSet.FieldByName('FK_ROOMID').AsInteger);
        ods.Open;
        sTextIssl_4Rep := ods.FieldByName('FB_TEXT').AsString;
        sPhone_4Rep := ods.FieldByName('FC_PHONE').AsString;
        if get_digsig = '1' then
          begin
            ods.Close;
            ods.DeleteVariables;
            ods.SQL.Text := ' SELECT COUNT(*) AS CNT FROM ASU.TPODPIS_RICHVIEWDATA P, ASU.TRICHVIEWDATA D '+#13+
                            '  WHERE P.FK_RICHVIEWDATA = D.FK_ID '+#13+
                            '    AND D.FK_PACID = :PFK_PACID ';
            ods.DeclareAndSet('PFK_PACID', otInteger, dsNaz.DataSet.FieldByName('FK_ID').AsInteger);
            ods.Open;
            if ods.FieldByName('CNT').AsInteger > 0 then
              is_digsig := True
            else
              is_digsig := False;
          end;
        if frmMain.get_dbname = 'TO' then
          begin
            rProt_TO.FindObject('MemTelCaption').Visible := sPhone_4Rep <> '';
            rProt_TO.ShowReport;
            exit;
          end;
        frxRepProsmotr.FindObject('MemTel').Visible := sPhone_4rep = '';
        frxRepProsmotr.ShowReport;
      finally
        ods.Free;
      end;
    end;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin
  if ALL_MODE = TRUE then
    begin
      odsNazPepl.AfterScroll := nil;
      RefreshQuery(odsNazPepl);
      odsNazPepl.AfterScroll := odsNazPeplAfterScroll;
    end else
    begin
      odsNaz.AfterScroll := nil;
      RefreshQuery(odsNaz);
      odsNaz.AfterScroll := odsNazAfterScroll;
    end;
end;

procedure TfrmMain.aEditExecute(Sender: TObject);
begin
  if bbAdd.Down = True then
    bbAdd.Down := False;
  IsNAZ := FALSE;
  DoFreeNazWizzard;
  bCloseNaz.Visible := False;
  dxBarDockControl1.Visible := FALSE;

  HandleDLL := LoadLibrary('PriemDll.dll');
  if HandleDLL <> 0 then
    begin
      EditPlugin := GetProcAddress(HandleDLL, 'EditPlugin');
      if @EditPlugin <> nil then
      begin
        try
          @SetSignFnc := GetProcAddress(HandleDLL, 'SetSignFnc');
          if Assigned(@SetSignFnc) then
            SetSignFnc(frmMain.gDigSignature.SignDocument);
          PriemHnd := EditPlugin(paMain.Handle,
					   										 Application.Handle,
																 pPACID,
																 pSOTRID,
																 pAPPSOTRID,
																 -1,
																 odsNaz.FieldByName('FK_SMID').AsInteger,
																 -1,
																 FALSE,
																 odsNaz.FieldByName('FK_ID').AsInteger,
																 paMain.Parent.Handle);
        except
        end;
    end;
 end;
  odsNaz.AfterScroll := nil; // !!! нужны ли эти строки здесь, проверить, по-моему нет, т.к. после выгрузки приема снова происходит рефреш
  RefreshQuery(odsNaz);
  odsNaz.AfterScroll := odsNazAfterScroll;
end;

procedure TfrmMain.aLoadShExecute(Sender: TObject);
var LoadFromTemplate : TLoadFromTemplate;
    WasLoaded : Boolean;
begin
  WasLoaded := TRUE;
  if HandleLib < 1 then
    begin
      HandleLib := LoadLibrary(PChar('DLL_NazWizzard.dll'));
      WasLoaded := False;
    end;

  if HandleLib <> 0 then
    begin
      @LoadFromTemplate := GetProcAddress(HandleLib, 'LoadFromTemplateWithHandle');
      if @LoadFromTemplate <> nil then
        LoadFromTemplate(Application.Handle, pSOTRID, -2, pPacID, -1);
    end;

  if not WasLoaded then
    begin
      FreeLibrary(HandleLib);
      HandleLib := 0;
    end;
  aRefreshExecute(nil);  
end;

procedure TfrmMain.StartTimer;
begin
  Timer1.Enabled := TRUE;
end;

procedure TfrmMain.UnloadDLL;
begin
  if HandleDLL > HINSTANCE_ERROR then
    begin
      @FreePlugin := GetProcAddress(HandleDLL, 'FreePlugin');
      if Assigned(FreePlugin) then
        begin
          Timer1.Enabled := FALSE;
          if FreePlugin = 1 then
            begin
              @FreePlugin := nil;
              exit;
            end;
          Application.ProcessMessages;
          FreeLibrary(HandleDLL);
          HandleDLL:=0;
          PriemHnd := 0;
        end;
    end
  else
    ShowMessage('Требуемый для работы файл(PriemDll.dll) не был загружен. Обратитесь к администратору системы. ');
  dxBarDockControl1.Visible := TRUE;
  odsNaz.AfterScroll := nil;
  RefreshQuery(odsNaz);
  odsNaz.AfterScroll := odsNazAfterScroll;
  odsNazAfterScroll(nil);
end;

procedure TfrmMain.aResultExecute(Sender: TObject);
begin
  if ALL_MODE = TRUE then
    DoResult(odsNazPepl.FieldByName('FK_ID').AsInteger)
  else
    DoResult(odsNaz.FieldByName('FK_ID').AsInteger);
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
  LOB.SaveToFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+inttostr(pPacID) +'print.htm');
  q.Free;
  LOB.Free;
  frmPreview.wb.Navigate(ExtractFilePath(paramstr(0))+'RGIMAGES'+inttostr(pPacID) +'print.htm');
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
      DoWordProcess(ExtractFilePath(paramstr(0))+'RGIMAGES'+inttostr(pPacID) +'print.htm', frmPreview.bbFormat.ItemIndex);
      try
        DeleteFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+inttostr(pPacID) +'print.htm');
      except
      end;
      frmPreview.Free;
    end else
    begin
      try
        DeleteFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+inttostr(pPacID) +'print.htm');
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
begin
  Application.CreateForm(TfrmPreview, frmPreview);
  RegLoad := TRegIniFile.Create;
  ods := TOracleDataSet.Create(nil);
  oq := TOracleDataSet.Create(nil);
  lob := TLOBLocator.Create(os, otCLOB);
  try
    RegLoad.RootKey := HKEY_CURRENT_USER;
    RegLoad.OpenKey('\Software\Softmaster\Print\ID_VRACH'+IntToStr(pSotrID), True);
    frmPreview.bbFormat.ItemIndex := RegLoad.ReadInteger('\Software\Softmaster\Print\ID_VRACH'+IntToStr(pSOTRID), 'RazmerList', 0);
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
    oq.SQL.Add('  dbms_lob.createtemporary(:html, True, dbms_lob.SESSION); ');
    oq.SQL.Add('  dbms_lob.WRITE(:html,1,1,'' ''); ');
    oq.SQL.Add('  :html := asu.GET_HTM_OSM_KOLYA('+IntToStr(IDRes)+', :pBase); ');
    oq.SQL.Add(' end; ');
    oq.DeclareAndSet('pBase', otString, get_dbname);
    oq.Open;

    lob := TLOBLocator(oq.GetComplexVariable('html'));
    lob.SaveToFile(ExtractFilePath(paramstr(0))+inttostr(nPacID) +'print.htm');
    frmPreview.wb.Navigate(ExtractFilePath(paramstr(0))+inttostr(nPacID) +'print.htm');
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
          RegSave.WriteInteger('\Software\Softmaster\Print\ID_VRACH'+IntToStr(pSotrID), 'RazmerList', frmPreview.bbFormat.ItemIndex);
        except
        end;
        RegSave.Free;
        DoPrintDocument(ExtractFilePath(paramstr(0))+inttostr(nPacID) +'print.htm', frmPreview.bbFormat.ItemIndex);
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
    WordApp.Quit(SaveChanges,OriginalFormat,RouteDocument);
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

procedure TfrmMain.aAddFastExecute(Sender: TObject);
begin
  dxBarDockControl1.Visible := FALSE;
  HandleDLL := LoadLibrary('PriemDll.dll');
  if HandleDLL <> 0 then
    begin
      InitPlugin := GetProcAddress(HandleDLL, 'InitPlugin');
      ResizePlugin := GetProcAddress(HandleDLL, 'ResizePlugin');
      if @InitPlugin <> nil then
      begin
        try
          @SetSignFnc := GetProcAddress(HandleDLL, 'SetSignFnc');
          if Assigned(@SetSignFnc) then
            SetSignFnc(frmMain.gDigSignature.SignDocument);
					InitPlugin(paMain.Handle,
										 Application.Handle,
										 pPACID,
										 pSOTRID,
										 PAPPSOTRID,
										 -1,
										 odsNaz.FieldByName('FK_SMID').AsInteger,
										 -2,
										 FALSE,
										 -1,
										 paMain.Parent.Handle);
          PriemHnd:= ResizePlugin(paMain.Handle);
        except
        end;
      end;
    end;
end;

procedure TfrmMain.aAddExecute(Sender: TObject);
begin
  if bbAdd.Down then
    begin
      IsNAZ := TRUE;
      DoCreateNazWizzard(GET_ISSLEDID);
      bCloseNaz.Visible := True;
      lbText.Caption := 'Панель назначений';
    end else
    begin
      IsNAZ := FALSE;
      DoFreeNazWizzard;
      if odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_NAZCANCEL then
        lbText.Caption := 'Причина отмены'
      else
        lbText.Caption := 'Текст исследования';
      bCloseNaz.Visible := False;
    end;
end;

procedure TfrmMain.odsNazBeforeOpen(DataSet: TDataSet);
begin
  odsNaz.SetVariable('PFK_PACID', pPACID);
  odsNaz.SetVariable('PSOTR', pSOTRID);
end;

procedure TfrmMain.odsNazAfterScroll(DataSet: TDataSet);
var ods : TOracleDataSet;
begin
  CheckEnabledButtons;
  if odsNaz.RecordCount <> 0 then
    begin
      if odsNaz.FieldByName('FK_NAZSOSID').AsInteger <> GET_NAZCANCEL then
        begin
          if bbAdd.Down then
            lbText.Caption := 'Панель назначений'
          else
            lbText.Caption := 'Текст исследования';
          ods := TOracleDataSet.Create(nil);
          try
            ods.Session := os;
            ods.Cursor := crSQLWait;
            ods.SQL.Text := ' SELECT FB_TEXT AS FC_RES FROM ASU.TRICHVIEWDATA WHERE FK_PACID = :PFK_PACID ';
            ods.DeclareAndSet('PFK_PACID', otInteger, odsNaz.FieldByName('FK_ID').AsInteger);
            ods.Open;
            cxreProsmotr.Text := ods.FieldByName('FC_RES').AsString;
          finally
            ods.Free;
          end;
        end else
        begin
          if bbAdd.Down then
            lbText.Caption := 'Панель назначений'
          else
            lbText.Caption := 'Причина отмены';
          ods := TOracleDataSet.Create(nil);
          try
            ods.Session := os;
            ods.Cursor := crSQLWait;
            ods.SQL.Text := ' SELECT FC_RES, FD_INS, FK_VRACHID, ASU.DO_VRACHFIO(FK_VRACHID) AS VRACHFIO '+
                            '   FROM VRES WHERE FK_NAZID = :pFK_NAZID AND FK_SOS = GET_NAZCANCEL ';
            ods.DeclareAndSet('pFK_NAZID', otInteger, dsNaz.DataSet.FieldByName('FK_ID').AsInteger);
            ods.Open;
            cxreProsmotr.Text := 'Сотрудник:'+' '+ods.FieldByName('VRACHFIO').AsString+','+' '+#13#10+
                                 'Дата отмены:'+' '+DateTimeToStr(ods.FieldByName('FD_INS').AsDateTime)+#13#10+
                                 'Обоснование отмены:'+' '+ods.FieldByName('FC_RES').AsString;
          finally
            ods.Free;
          end;
        end;
    end else
    begin
      cxreProsmotr.Text := '';
    end;
end;

procedure TfrmMain.VSHOWPACPropertiesChange(Sender: TObject);
var oq : TOracleQuery;
    ods : TOracleDataSet;
begin
  oq := TOracleQuery.Create(nil);
  oq.Session := os;
  oq.Cursor := crSQLWait;
  if odsNaz.FieldByName('FL_SHOWPAC').AsInteger = 1 then
    begin
      odsNaz.Edit;
      odsNaz.FieldByName('FL_SHOWPAC').AsInteger := 0;
      odsNaz.Post;
      oq.SQL.Text := ' UPDATE TNAZMARK_X SET FL_SHOWPAC = 0 WHERE FK_NAZID ='+IntToStr(odsNaz.FieldByName('FK_ID').AsInteger);
      oq.Execute;
      os.Commit;
    end else
    begin
      ods := TOracleDataSet.Create(nil);
      ods.Session := os;
      ods.Cursor := crSQLWait;
      ods.SQL.Text := ' SELECT FK_ID FROM TNAZMARK_X WHERE FK_NAZID ='+IntToStr(odsNaz.FieldByName('FK_ID').AsInteger);
      ods.Open;
      if ods.RecordCount = 0 then
        begin
          oq.SQL.Text := ' INSERT INTO TNAZMARK_X (FK_NAZID, FL_SHOWPAC) VALUES('+IntToStr(odsNaz.FieldByName('FK_ID').AsInteger)+', 1) ' ;
          oq.Execute;
          os.Commit;
        end else
        begin
          odsNaz.Edit;
          odsNaz.FieldByName('FL_SHOWPAC').AsInteger := 1;
          odsNaz.Post;
          oq.SQL.Text := ' UPDATE TNAZMARK_X SET FL_SHOWPAC = 1 WHERE FK_NAZID ='+IntToStr(odsNaz.FieldByName('FK_ID').AsInteger);
          oq.Execute;
          os.Commit;
        end;
      ods.Free;
    end;
  oq.Free;
end;

procedure TfrmMain.TVISSLEDCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var ods : TOracleDataSet;
begin
  if dsNaz.DataSet.FieldByName('FK_NAZSOSID').AsInteger = GET_NAZCANCEL then
    begin
      Application.CreateForm(TfrmOtmena, frmOtmena);
      frmOtmena.acOk.Visible := FALSE;
      frmOtmena.GroupBox1.Visible := FALSE;
      frmOtmena.cxOtmena.Align := alClient;
      frmOtmena.acCancel.ImageIndex := 2;
      frmOtmena.acCancel.Caption := 'Закрыть';
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' SELECT FC_RES, FD_INS, FK_VRACHID, ASU.DO_VRACHFIO(FK_VRACHID) AS VRACHFIO '+
                        '   FROM VRES WHERE FK_NAZID = :pFK_NAZID AND FK_SOS = GET_NAZCANCEL ';
        ods.DeclareAndSet('pFK_NAZID', otInteger, dsNaz.DataSet.FieldByName('FK_ID').AsInteger);
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
      if (odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_NEVIP) or (odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_RECOMEND) then
        begin
          aEditExecute(nil);
          exit;
        end;
      if odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_VIPNAZ then
        begin
          aProsmotrExecute(nil);
        end;
    end;
end;

procedure TfrmMain.TVISSLEDCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[VISSLEDSOS.Index] = GET_NAZCANCEL then
    ACanvas.Brush.Color:=RGB(251, 172, 182);

  if AViewInfo.GridRecord.Values[TVFK_NAZTYPE.Index] <> GET_NAZPLAN then
    ACanvas.Font.Style := [fsBold];
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  UnloadDLL;
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
                    Screen.Cursor := crDefault;
                    aOpenIB.Enabled:=True;
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

procedure TfrmMain.DoCreateNazWizzard(aSmid: Integer);
var InitDLLWizzard : TInitDLLWizzard;
begin
  ANazHandle := LoadLibrary('DLL_NazWizzard.dll');
  if ANazHandle <> 0 then
    begin
      @InitDLLWizzard := GetProcAddress(ANazHandle, 'InitPluginWithSession');
      if @InitDLLWizzard <> nil then
        FDMedNazHandle := InitDLLWizzard(os, paProsmotr.Handle, Application.Handle, Handle, pPACID, pSOTRID, pAPPSOTRID, -2, aSMID); 
    end;
end;

procedure TfrmMain.paTextResize(Sender: TObject);
var ResizeDLLWizzard : TResizeDLLWizzard;
begin
  if ANazHandle <> 0 then
    begin
      @ResizeDLLWizzard := GetProcAddress(ANazHandle, 'ResizePlugin');
      if @ResizeDLLWizzard <> nil then
        ResizeDLLWizzard(paProsmotr.Handle);
    end;
end;

procedure TfrmMain.DoFreeNazWizzard;
var FreeDLLWizzard : TFreeDLLWizzard;
begin
  if ANazHandle <> 0 then
    begin
      @FreeDLLWizzard := GetProcAddress(ANazHandle, 'FreePlugin');
      if @FreeDLLWizzard <> nil then
        FreeDLLWizzard;
      FreeLibrary(ANazHandle);
    end;
  ANazHandle := 0;
end;

procedure TfrmMain.RefreshOdsNaz(var Msg: TMessage);
begin
  odsNaz.AfterScroll := nil;
  RefreshQuery(odsNaz);
  odsNaz.Locate('FK_ID', Msg.lParam, []);
  odsNaz.AfterScroll := odsNazAfterScroll;
  CheckEnabledButtons;  
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

procedure TfrmMain.rprot_TOGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'PHONE' then Value := sPhone_4Rep;
  if VarName = 'PACAGE' then Value := dsNaz.DataSet.FieldByName('AGE').AsInteger;
  if VarName = 'PACFIO' then Value := lbFIO.Caption;
  if VarName = 'RUNDATE' then Value := dsNaz.DataSet.FieldByName('FD_RUN_STR').AsString;
  if VarName = 'ISSLNAME' then Value := dsNaz.DataSet.FieldByName('FC_NAME').AsString;
  if VarName = 'ISSLTEXT' then Value := sTextIssl_4Rep;
  if is_digsig = True then
    begin
      if VarName = 'SOTRNAME' then Value := 'ЭЦП '+dsNaz.DataSet.FieldByName('ISPOLFIO').AsString
    end else
    begin
      if VarName = 'SOTRNAME' then Value := dsNaz.DataSet.FieldByName('ISPOLFIO').AsString;
    end;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if HandleDLL <> 0 then
    UnloadDLL;
  if ANazHandle <> 0 then
    DoFreeNazWizzard;
  TVISSLED.StoreToRegistry('\SoftWare\SoftMaster\XRAYS\TVISSLEDVrach_' + IntToStr(pSOTRID), TRUE, [], 'TVISSLED');  //!!! разобраться с сохранением в реестр
  ClearHTMLImages;
end;

procedure TfrmMain.aArchiveExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmArchive, frmArchive);
  try
    frmArchive.ShowModal;
  finally
    frmArchive.Free;
  end;
end;

procedure TfrmMain.DoRefreshSmidConst;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT ASU.GET_VIPNAZ, ASU.GET_NEVIP, ASU.GET_RG_ISSL, ASU.GET_LABVIP, ASU.GET_RECOMEND, '+#13+
                    '        ASU.GET_NAZCANCEL, ASU.GET_ISSLEDID, ASU.GET_NAZPLAN, '+#13+
                    '        (SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''CONFIG'' AND FC_KEY = ''USE_DIGITSUBSCRIBE'') AS DIGSIG, '+#13+
                    '        ASU.PKG_SMINI.READSTRING(''CONFIG'', ''DB_NAME'', ''H'') AS DB_NAME '+#13+
                    '   FROM DUAL ';
    ods.Close;
    ods.Open;

    get_vipnaz := ods.FieldByName('GET_VIPNAZ').AsInteger;
    get_nevip := ods.FieldByName('GET_NEVIP').AsInteger;
    get_rg_issl := ods.FieldByName('GET_RG_ISSL').AsInteger;
    get_labvip := ods.FieldByName('GET_LABVIP').AsInteger;
    get_recomend := ods.FieldByName('GET_RECOMEND').AsInteger;
    get_nazcancel := ods.FieldByName('GET_NAZCANCEL').AsInteger;
    get_issledid := ods.FieldByName('GET_ISSLEDID').AsInteger;
    get_nazplan := ods.FieldByName('GET_NAZPLAN').AsInteger;
    get_digsig := ods.FieldByName('DIGSIG').AsString;
    get_dbname := ods.FieldByName('db_name').AsString;
//-- tsmini
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
        ods.Next;
      end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из приложения ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    action := caFree
  else
    action := caNone;
end;

procedure TfrmMain.CheckEnabledButtons; //!!! проверить эту процедуру
begin
  if EDIT_MODE = TRUE then
    begin
      aCancelNaz.Enabled := (odsNaz.RecordCount <> 0) and (odsNaz.FieldByName('FK_NAZSOSID').AsInteger <> GET_NAZCANCEL)
                            and (odsNaz.FieldByName('FK_NAZSOSID').AsInteger <> GET_VIPNAZ);
      aResult.Enabled := (odsNaz.RecordCount <> 0) and (odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_VIPNAZ);
      aAddFast.Enabled := odsNaz.RecordCount <> 0;
      aEdit.Enabled := (odsNaz.RecordCount <> 0)
                    and ((odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_NEVIP) or (odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_RECOMEND));
      actChange.Enabled := (odsNaz.RecordCount <> 0) and
                           (odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_VIPNAZ) and
                           (odsNaz.FieldByName('FK_NAZSOSID').AsInteger <> GET_NAZCANCEL) and
                           (odsNaz.FieldByName('fk_ispolid').AsInteger = pSotrID);
      aAdd.Enabled := pPACID <> 0;
      aProsmotr.Enabled := odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_VIPNAZ;
      aPrint.Enabled := (odsNaz.RecordCount <> 0) and (pPACID <> 0);

      aOpenIB.Enabled := pPACID <> 0;
      aPacInfo.Enabled := pPACID <> 0;
      aSaveSh.Enabled := (odsNaz.RecordCount <> 0);
      aLoadSh.Enabled := pPACID <> 0;
    end else
    begin
      aAdd.Enabled := False;
      aAddFast.Enabled := False;
      aEdit.Enabled := False;
      aCancelNaz.Enabled := False;
      aOpenIB.Enabled := False;
      actChange.Enabled := False;
      aPacInfo.Enabled := False;
      aSaveSh.Enabled := False;
      aLoadSh.Enabled := False;
      if ALL_MODE = TRUE then //!!! ПРИ стационаре неправильно
        begin
          aPrint.Enabled := odsNazPepl.RecordCount <> 0;
          aProsmotr.Enabled := odsNazPepl.FieldByName('FK_NAZSOSID').AsInteger = GET_VIPNAZ;
          aResult.Enabled := (odsNazPepl.RecordCount <> 0) and (odsNazPepl.FieldByName('FK_NAZSOSID').AsInteger = GET_VIPNAZ);
        end else
        begin
          aPrint.Enabled := odsNazPepl.RecordCount <> 0;
          aProsmotr.Enabled := odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_VIPNAZ;
          aResult.Enabled := (odsNaz.RecordCount <> 0) and (odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_VIPNAZ);
        end;
    end;
end;

procedure TfrmMain.ClearHTMLImages;
var SR: TSearchRec;
begin
  FindFirst(ExtractFilePath(paramstr(0))+'RGIMAGES'+'*.jpg', faAnyFile, SR);
  repeat
    DeleteFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+SR.Name);
  until FindNext(SR) <> 0;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  cxgr.SetFocus;
end;

procedure TfrmMain.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TVISSLED.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TVISSLED.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TVISSLED.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TVISSLED.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmMain.aCancelNazExecute(Sender: TObject);
var oq : TOracleQuery;
begin
  Application.CreateForm(TfrmOtmena, frmOtmena);
  frmOtmena.DoShowfrmOtmena(pPACID, pSOTRID);
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
        oq.DeclareAndSet('pFK_ID', otInteger, odsNaz.FieldByName('FK_ID').AsInteger);
        oq.Execute;
        os.Commit;
        oq.DeleteVariables;
        oq.SQL.Text := ' INSERT INTO ASU.VRES(FK_SMID, FD_INS, FC_RES, FC_TYPE, FK_VRACHID, FK_PACID, FK_NAZID, FK_SOS) '+
                       ' VALUES(:pFK_SMID, SYSDATE, :pFC_RES, ''TEXT'', :pFK_VRACHID, :pFK_PACID, :pFK_NAZID, :pFK_SOS) ';
        oq.DeclareAndSet('pFK_SMID', otInteger, odsNaz.FieldByName('FK_SMID').AsInteger);
        oq.DeclareAndSet('pFC_RES', otString, frmOtmena.cxOtmena.Text+';'+frmOtmena.cxOtmenaHand.Text);
        oq.DeclareAndSet('pFK_VRACHID', otInteger, pSOTRID);
        oq.DeclareAndSet('pFK_PACID', otInteger, pPACID);
        oq.DeclareAndSet('pFK_NAZID', otInteger, odsNaz.FieldByName('FK_ID').AsInteger);
        oq.DeclareAndSet('pFK_SOS', otInteger, GET_NAZCANCEL);
        oq.Execute;
        os.Commit;
        odsNaz.AfterScroll := nil;
        RefreshQuery(odsNaz);
        odsNaz.AfterScroll := odsNazAfterScroll;
        odsNazAfterScroll(nil);
      finally
        oq.Free;
      end;
    end;
  frmOtmena.Free;
end;

procedure TfrmMain.VISSLEDPODTPropertiesChange(Sender: TObject);
var oq : TOracleQuery;
    ods : TOracleDataSet;
begin
  oq := TOracleQuery.Create(nil);
  oq.Session := os;
  oq.Cursor := crSQLWait;
  if odsNaz.FieldByName('FL_PODT').AsInteger = 1 then
    begin
      odsNaz.Edit;
      odsNaz.FieldByName('FL_PODT').AsInteger := 0;
      odsNaz.Post;
      oq.SQL.Text := ' UPDATE TNAZMARK_X SET FL_PODT = 0 WHERE FK_NAZID ='+IntToStr(odsNaz.FieldByName('FK_ID').AsInteger);
      oq.Execute;
      os.Commit;
    end else
    begin
      ods := TOracleDataSet.Create(nil);
      ods.Session := os;
      ods.Cursor := crSQLWait;
      ods.SQL.Text := ' SELECT FK_ID FROM TNAZMARK_X WHERE FK_NAZID ='+IntToStr(odsNaz.FieldByName('FK_ID').AsInteger);
      ods.Open;
      if ods.RecordCount = 0 then
        begin
          oq.SQL.Text := ' INSERT INTO TNAZMARK_X (FK_NAZID, FL_PODT) VALUES('+IntToStr(odsNaz.FieldByName('FK_ID').AsInteger)+', 1) ' ;
          oq.Execute;
          os.Commit;
        end else
        begin
          odsNaz.Edit;
          odsNaz.FieldByName('FL_PODT').AsInteger := 1;
          odsNaz.Post;
          oq.SQL.Text := ' UPDATE TNAZMARK_X SET FL_PODT = 1 WHERE FK_NAZID ='+IntToStr(odsNaz.FieldByName('FK_ID').AsInteger);
          oq.Execute;
          os.Commit;
        end;
      ods.Free;
    end;
  oq.Free;
end;

procedure TfrmMain.AppOnMessage(var Msg: TMsg; var Handled: Boolean);
begin
  if PriemHnd <> 0 then
    case msg.message of
      WM_KEYDOWN: if ((msg.wParam>=37) and (msg.wParam<=40))or(msg.wParam=93)or(msg.wParam=33)or(msg.wParam=34) then
                    SendMessage(PriemHnd,wm_user+113,msg.wParam,msg.lParam);
     end;

  if (FDMedNazHandle <> 0) and (IsNAZ) then
    case msg.message of
      WM_KEYDOWN: if (((msg.wParam>=37) and (msg.wParam<=40))or(msg.wParam=93)or(msg.wParam=33)or(msg.wParam=34))and(msg.lParam<>-1) then
                    SendMessage(FDMedNazHandle,WM_USER+113,msg.wParam,msg.lParam);
     end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var Ini : TIniFile;
begin
  dicom_show_3d := false;
  Ini := TIniFile.Create(ExtractFilePath(paramstr(0))+'DicomSettings.ini');
  try
    sCallingAET := Ini.ReadString('MAIN', 'CALLING_AET', 'MEDOTRADE');
  finally
    Ini.Free;
  end;

  GetSession(os, 'ASU');
  gDigSignature := TDigitalSignature.Create(Self);
  russian:=LoadKeyboardLayout('00000419', 0);
  Application.OnMessage:=AppOnMessage;
  Application.HelpFile:=ExtractFilePath(Application.ExeName)+'Diagnost.chm';
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(gDigSignature);
end;

procedure TfrmMain.paMainResize(Sender: TObject);
begin
  if HandleDLL <> 0 then
    begin
      ResizePlugin := GetProcAddress(HandleDLL, 'ResizePlugin');
      if @ResizePlugin <> nil then
        begin
          try
            PriemHnd := ResizePlugin(paMain.Handle);
          except
          end;
        end;
    end;
end;

procedure TfrmMain.BmpToJPEG(pFNAME1, pFNAME2: String);
var
  JPEG: TJPEGImage;
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

function TfrmMain.PhysicalResolveFileType(AStream: TStream): Integer;
var
  p: PChar;
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

procedure TfrmMain.N1Click(Sender: TObject);
begin
  TVISSLED.RestoreFromRegistry('\SoftWare\SoftMaster\XRAYS\TVISSLED'+'Vrach'+ '_' + IntToStr(pSOTRID)+'Default', FALSE, FALSE, [], 'TVISSLED');
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := lbFIO.Caption;
end;

procedure TfrmMain.N4Click(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := lbNumMK.Caption;
end;

procedure TfrmMain.bCloseNazClick(Sender: TObject);
begin
  IsNAZ := FALSE;
  DoFreeNazWizzard;
  bCloseNaz.Visible := False;
  if bbAdd.Down then
    bbAdd.Down := False;
  if odsNaz.FieldByName('FK_NAZSOSID').AsInteger = GET_NAZCANCEL then
    lbText.Caption := 'Причина отмены'
  else
    lbText.Caption := 'Текст исследования';
end;

procedure TfrmMain.aSaveShExecute(Sender: TObject);
var SaveAsTemplate : TSaveAsTemplate;
    WasLoaded: Boolean;
    NazIDListFSh : array of array [1..2] of integer;
    i : Integer;
begin
  SetLength(NazIDListFSh, 0);
  for i := 0 to tvIssled.DataController.RecordCount - 1 do
    begin
      if tvIssled.DataController.IsRowSelected(i) = True then
        begin
          SetLength(NazIDListFSh, Length(NazIDListFSh) + 1);
          NazIDListFSh[High(NazIDListFSh)][1] := tvIssled.DataController.GetValue(i, VISSLEDFK_ID.Index);   // id назначения
          NazIDListFSh[High(NazIDListFSh)][2] := tvIssled.DataController.GetValue(i, VISSLEDFK_SMID.Index); // код из tsmid
        end;
    end;

  WasLoaded := TRUE;

  if HandleLib < 1 then
    begin
      HandleLib := LoadLibrary(PChar('DLL_NazWizzard.dll'));
      WasLoaded := FALSE;
    end;

  if HandleLib <> 0 then
    begin
      @SaveAsTemplate := GetProcAddress(HandleLib, 'SaveAsTemplateWithHandle');
      if @SaveAsTemplate <> nil then
        SaveAsTemplate(Application.Handle, pSOTRID, -2, @NazIDListFSh);
    end;

  if not WasLoaded then
    begin
      FreeLibrary(HandleLib);
      HandleLib := 0;
    end;
end;

procedure TfrmMain.aSearchPacExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSearchPeople, frmSearchPeople);
  try
    frmSearchPeople.DoShowfrmSearchPeople;
    frmSearchPeople.ShowModal;
    if frmSearchPeople.ModalResult = MrOK then
      begin
        lbFIO.Caption := frmSearchPeople.odsPac.FieldByName('FIO').AsString;
        lbNumMK.Caption := frmSearchPeople.odsPac.FieldByName('NIB').AsString;
        pPACID := frmSearchPeople.odsPac.FieldByName('PACID').AsInteger;
        pPEPLID := frmSearchPeople.odsPac.FieldByName('FK_ID').AsInteger;
        odsNaz.AfterScroll := nil;
        odsNaz.Close;
        odsNaz.Open;
        odsNaz.AfterScroll := odsNazAfterScroll;
        odsNazAfterScroll(nil);
      end;
    finally
      frmSearchPeople.Free;
    end;

  if bbAdd.Down = True then
    bbAdd.Down := False;
  IsNAZ := FALSE;
  DoFreeNazWizzard;
  bCloseNaz.Visible := False;
end;

procedure TfrmMain.odsNazPeplBeforeOpen(DataSet: TDataSet);
begin
  odsNazPepl.SetVariable('PFK_PACID', pPACID);
  odsNazPepl.SetVariable('PSOTR', pSOTRID);
end;

procedure TfrmMain.osAfterLogOn(Sender: TOracleSession);
var Ver: TJclFileVersionInfo;
begin
  Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
	Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
	Sender.DBMS_Application_Info.Set_Module(ExtractFileName(ParamStr(0)) + ' (' + Ver.FileVersion + ')', Self.Name + ' "' + Self.Caption + '"'); 
	FILENAME := ExtractFileName(ParamStr(0));
	Ver.Free;
end;

procedure TfrmMain.odsNazPeplAfterScroll(DataSet: TDataSet);
var ods : TOracleDataSet;
begin
  CheckEnabledButtons;
  if odsNazPepl.RecordCount <> 0 then
    begin
      ods := TOracleDataSet.Create(nil);
      ods.Session := os;
      ods.Cursor := crSQLWait;
      ods.SQL.Text := ' SELECT FB_TEXT AS FC_RES FROM TRICHVIEWDATA WHERE FK_PACID = :PFK_PACID '; 
      ods.DeclareAndSet('PFK_PACID', otInteger, odsNazPepl.FieldByName('FK_ID').AsInteger);
      ods.Open;
      cxreProsmotr.Text := ods.FieldByName('FC_RES').AsString;
      ods.Free;
    end;
end;

procedure TfrmMain.frx30GetValue(const VarName: String; var Value: Variant);
begin
  if VarName = 'D1' then Value := DateTimeToStr(DateB);
  if VarName = 'D2' then Value := DateTimeToStr(DateE);
end;

procedure TfrmMain.frxRepListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'KOLVONAZ' then Value := dsNaz.DataSet.RecordCount;
  if VarName = 'SYSDATE' then Value := GET_SYSDATE_4REP;
  if VarName = 'PACFIO' then Value := lbFIO.Caption;
  if VarName = 'NUMMK' then Value := lbNumMK.Caption;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;

end;

procedure TfrmMain.frxRepProsmotrGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := sOtdelName_4Rep;
  if VarName = 'PHONE' then Value := sPhone_4Rep;
  if VarName = 'PACAGE' then Value := dsNaz.DataSet.FieldByName('AGE').AsInteger;
  if VarName = 'PACFIO' then Value := lbFIO.Caption;
  if VarName = 'RUNDATE' then Value := dsNaz.DataSet.FieldByName('FD_RUN_STR').AsString;
  if VarName = 'ISSLNAME' then Value := dsNaz.DataSet.FieldByName('FC_NAME').AsString;
  if VarName = 'ISSLTEXT' then Value := sTextIssl_4Rep;
  if is_digsig = True then
    begin
      if VarName = 'SOTRNAME' then Value := 'ЭЦП '+dsNaz.DataSet.FieldByName('ISPOLFIO').AsString
    end else
    begin
      if VarName = 'SOTRNAME' then Value := dsNaz.DataSet.FieldByName('ISPOLFIO').AsString;
    end;
  if VarName = 'MEDOTRADESIGN' then Value := MedotradeSign;
end;

procedure TfrmMain.TVISSLEDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
//  if Key = VK_NUMPAD1 then
//    bbTypepac.DirectClick;
end;

procedure TfrmMain.cxAllPropertiesChange(Sender: TObject);
begin
//
end;

procedure TfrmMain.SetFocusNazWizzard(var Msg: TMessage);
begin
//
end;

procedure TfrmMain.SetHandleLib(const Value: THandle);
begin
  FHandleLib := Value;
end;

procedure TfrmMain.aPacInfoExecute(Sender: TObject);
var ods : TOracleDataSet;
    PeplId : Integer;
begin
  ods := TOracleDataSet.Create(nil);
  ods.Session := os;
  ods.Cursor := crSQLWait;
  ods.SQL.Text := ' select fk_peplid from asu.tkarta where fk_id = :pfk_id '+#13+
                  ' union all '+#13+
                  ' select fk_peplid from asu.tambulance where fk_id = :pfk_id ';
  ods.DeclareAndSet('PFK_ID', otInteger, pPACID);
  ods.Open;
  PeplId := ods.FieldByName('FK_PEPLID').AsInteger;
  ods.Free;

  Application.CreateForm(TfrmPacInfoDiagnost, frmPacInfoDiagnost);
  try
    if ALL_MODE = TRUE then
      begin
        frmPacInfoDiagnost.DoShowPacInfo(pPACID, PeplId, odsNazPepl.FieldByName('VRACHFIO').AsString);
      end else
      begin
        frmPacInfoDiagnost.DoShowPacInfo(pPACID, PeplId, odsNaz.FieldByName('VRACHFIO').AsString);
      end;
    frmPacInfoDiagnost.ShowModal;
  finally
    frmPacInfoDiagnost.Free;
  end;
end;

procedure TfrmMain.actChangeExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  if bbAdd.Down = True then
    bbAdd.Down := False;
  IsNAZ := FALSE;
  DoFreeNazWizzard;
  bCloseNaz.Visible := False;

  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select sysdate - fd_date as raz, '+#13+
                    '        to_char(fd_date, ''dd.mm.yyyy hh24:mi'') as fd_date_str '+#13+
                    '   from asu.tpodpisnaz '+#13+
                    '  where fk_nazid = :pfk_nazid and fk_sos = asu.get_vipnaz ';
    ods.DeclareAndSet('pfk_nazid', otInteger, dsNaz.DataSet.FieldByName('fk_id').AsInteger);
    ods.Open;
    if get_dbname = 'SK' then
      begin
        if ods.FieldByName('raz').AsInteger > 31 then
          begin
            MessageDlg('С момента первой подписи протокола прошло более 31 суток! Изменить протокол невозможно!'
                       +#13+#10+
                       'Дата первого подписания:'+ods.FieldByName('fd_date_str').AsString,
                       mtWarning,
                       [mbOK],
                       0);
            exit;
          end;
      end else
      begin
        if ods.FieldByName('raz').AsInteger > 1 then
          begin
            MessageDlg('С момента первой подписи протокола прошло более суток! Изменить протокол невозможно!'
                       +#13+#10+
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
//--- загружаем длл
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
          EditPlugin_Personal(paMain.Handle, //хэндл панели
															Application.Handle, //хэндл аппликейшена
															pPACID, //код пациента
															pSOTRID, //код сотрудника
															pAPPSOTRID, //специализация
															-1, //секция
															odsNaz.FieldByName('FK_SMID').AsInteger, //смид
															odsNaz.FieldByName('FK_ID').AsInteger, //назид
															FALSE,
															odsNaz.FieldByName('FK_ID').AsInteger, //ид объекта
															paMain.Parent.Handle);
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
  odsNaz.AfterScroll := nil;
  RefreshQuery(odsNaz);
  odsNaz.AfterScroll := odsNazAfterScroll;
  odsNazAfterScroll(nil);
end;

end.
