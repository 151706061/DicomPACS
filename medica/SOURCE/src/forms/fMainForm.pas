// $Medotrade: sotinov/mis/medica/src/forms/fMainForm.pas,v 1.3 2006/08/23 05:44:41 sotinov Exp $
//
unit fMainForm;

{Использовать FastReport версии 2.53}

interface

uses
  OracleMonitor,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdActns, ActnList, ImgList, ComCtrls, ToolWin, Oracle, Db,
  OracleData, FR_DSet, FR_DBSet, FR_Class, JvGIF, ExtCtrls, StdCtrls {,SPHtmlHelp},
  JvComponentBase, JvBalloonHint, {$IFNDEF MIS2}SMMainAPI,{$ENDIF} frxRich, uProcess, JvFormPlacement,
  JvAppStorage, JvAppIniStorage, AppEvnts, cxConstantsRus, dxBarCustomize_Rus;

type
  TfrmMain = class(TForm)
    alAll: TActionList;
    WindowArrange1: TWindowArrange;
    WindowCascade1: TWindowCascade;
    WindowClose1: TWindowClose;
    WindowMinimizeAll1: TWindowMinimizeAll;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    acPostavshik: TAction;
    acEdIsm: TAction;
    acUchGr: TAction;
    acFarmGr: TAction;
    acMedic: TAction;
    acMatOtv: TAction;
    acDPrih: TAction;
    acMedKard: TAction;
    acExit: TAction;
    MainMenu: TMainMenu;
    miOper: TMenuItem;
    miPrihod: TMenuItem;
    N14: TMenuItem;
    miExit: TMenuItem;
    miSpr: TMenuItem;
    miUchetObj: TMenuItem;
    miUchetObjCards: TMenuItem;
    miFarmGroups: TMenuItem;
    miUchetGroups: TMenuItem;
    miEdIzm: TMenuItem;
    miPostav: TMenuItem;
    miWindows: TMenuItem;
    Cascade1: TMenuItem;
    TileHorizontally1: TMenuItem;
    MenuItem1: TMenuItem;
    Arrange1: TMenuItem;
    MinimizeAll1: TMenuItem;
    Close1: TMenuItem;
    miHelp: TMenuItem;
    miAbout: TMenuItem;
    acAbout: TAction;
    sbMain: TStatusBar;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbPrih: TToolButton;
    acDRash: TAction;
    acDInvList: TAction;
    miSelectMO: TMenuItem;
    acMO: TAction;
    miMO: TMenuItem;
    acSotrRight: TAction;
    miRightsMO: TMenuItem;
    tbMove: TToolButton;
    acDMove: TAction;
    acDKL: TAction;
    miCommon: TMenuItem;
    acNeotl: TAction;
    miNeotlozh: TMenuItem;
    dosetmoveprice: TOracleQuery;
    odsSelNullPrice: TOracleDataSet;
    frNullPrice: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    frUserDataset1: TfrUserDataset;
    odsSelNullPriceFN_KOL: TFloatField;
    odsSelNullPriceEINAME: TStringField;
    odsSelNullPriceFC_NAME: TStringField;
    odsSelNullPriceIDKART: TIntegerField;
    miNegativeOst: TMenuItem;
    odsMinKol: TOracleDataSet;
    frReport1: TfrReport;
    frDBdsMinKol: TfrDBDataSet;
    frUserDataset2: TfrUserDataset;
    frMinKol: TfrReport;
    odsMinKolFN_KOL: TFloatField;
    odsMinKolNAMEMEDIC: TStringField;
    odsMinKolEINAME: TStringField;
    oqRefreshMedic: TOracleQuery;
    miCalcOst: TMenuItem;
    acSecret: TAction;
    miSelectPeriod: TMenuItem;
    miClosePeriod: TMenuItem;
    oqUpdData: TOracleQuery;
    odsGetclose: TOracleDataSet;
    odsGetcloseFD_DATA2: TDateTimeField;
    miMove: TMenuItem;
    miInv: TMenuItem;
    N28: TMenuItem;
    acPrice: TAction;
    acClosePeriod: TAction;
    acNegativeOst: TAction;
    acCommon: TAction;
    acCreateIniLst: TAction;
    frSrok: TfrReport;
    frDBDataSet3: TfrDBDataSet;
    odssrok: TOracleDataSet;
    acSroki: TAction;
    N1: TMenuItem;
    acSetupVisible: TAction;
    tbMedProduce_Sep: TToolButton;
    tbInvList: TToolButton;
    tbOst: TToolButton;
    tbMinSpare: TToolButton;
    acMinSpare: TAction;
    acAsortiment: TAction;
    tbAssortiment: TToolButton;
    miDocs: TMenuItem;
    acUchGrType: TAction;
    N3: TMenuItem;
    acMassUnits: TAction;
    N4: TMenuItem;
    acPayType: TAction;
    N5: TMenuItem;
    acMedicType: TAction;
    N6: TMenuItem;
    acVvodPath: TAction;
    N7: TMenuItem;
    acSpecialMedic: TAction;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    acRecipe: TAction;
    N11: TMenuItem;
    N12: TMenuItem;
    miMedicProduce: TMenuItem;
    acMedicProduce: TAction;
    ToolButton3: TToolButton;
    tbMedProduce: TToolButton;
    tbMinZapas: TToolButton;
    mmHelpContent: TMenuItem;
    acHelpContext: TAction;
    acMOGroup: TAction;
    acMOinGroup: TAction;
    miSelectMOGroup: TMenuItem;
    acMO_SelCur: TAction;
    N13: TMenuItem;
    N15: TMenuItem;
    ToolButton2: TToolButton;
    acSpisanieVid: TAction;
    N16: TMenuItem;
    tbuSroki: TToolButton;
    ToolButton4: TToolButton;
    miReports: TMenuItem;
    ac_prPrihBuh: TAction;
    ac_prRashBuh: TAction;
    ac_GroupingVedomost: TAction;
    ac_Dvig_med: TAction;
    ac_VedomItog: TAction;
    ac_Oborotka: TAction;
    ac_SvodkaPoDefecture: TAction;
    ac_VedomItogRash: TAction;
    ac_OborotkaSMS: TAction;
    ac_aOstByMedic: TAction;
    ac_VedomOstat: TAction;
    ac_Dvig_OneMedic: TAction;
    ac_aOborotkaRazv: TAction;
    ac_ProducedMedics: TAction;
    odsMenuReports: TOracleDataSet;
    N17: TMenuItem;
    acReturnOsnovanieList: TAction;
    N18: TMenuItem;
    miWindowsRepSeparator: TMenuItem;
    ToolButton5: TToolButton;
    tbuReports: TToolButton;
    ToolButton6: TToolButton;
    N19: TMenuItem;
    ac_RepSrokiGodnosti: TAction;
    acProdCert: TAction;
    N20: TMenuItem;
    N21: TMenuItem;
    acInterface: TAction;
    acZayavka: TAction;
    tbuZayavka: TToolButton;
    ApplicationEvents1: TApplicationEvents;
    acHITEC_VidHelp: TAction;
    N22: TMenuItem;
    acSklad: TAction;
    miSklad: TMenuItem;
    acVidPost: TAction;
    mniVidPost: TMenuItem;
    acCROSS_TABLE_CHECK: TAction;
    N23: TMenuItem;
    acFinSource: TAction;
    mniFinSource: TMenuItem;
    acPayCond: TAction;
    N24: TMenuItem;
    acGROUP_LF: TAction;
    N25: TMenuItem;
    acRecalcOst: TAction;
    N2: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    acDocs_AutoNum: TAction;
    N29: TMenuItem;
    acSET_VID_POM_HITECH: TAction;
    N30: TMenuItem;
    acDInvOld: TAction;
    miInvOld: TMenuItem;
    acClosedPeriods: TAction;
    N31: TMenuItem;
    N32: TMenuItem;
    acProfil: TAction;
    N33: TMenuItem;
    acSprOKDP: TAction;
    oqRecalcOst: TOracleQuery;
    PKG_RecalcOst: TOraclePackage;
    miMOGroup: TMenuItem;
    procedure acAboutExecute(Sender: TObject);
    procedure acDInvListExecute(Sender: TObject);
    procedure acEdIsmExecute(Sender: TObject);
    procedure acFarmGrExecute(Sender: TObject);
    procedure acUchGrExecute(Sender: TObject);
    procedure acMedicExecute(Sender: TObject);
    procedure acPostavshikExecute(Sender: TObject);
    procedure acMatOtvExecute(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure acMedKardExecute(Sender: TObject);
    procedure acMOExecute(Sender: TObject);
    procedure acSetupExecute(Sender: TObject);
    procedure miSprClick(Sender: TObject);
    procedure acDPrihExecute(Sender: TObject);
    procedure acDMoveExecute(Sender: TObject);
    procedure MainMenuChange(Sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure acNeotlExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miNegativeOstClick(Sender: TObject);
    procedure ToolButton6tClick(Sender: TObject);
    procedure acSecretExecute(Sender: TObject);
    procedure miCalcOstClick(Sender: TObject);
    procedure miSelectPeriodClick(Sender: TObject);
    procedure acPriceExecute(Sender: TObject);
    procedure acClosePeriodExecute(Sender: TObject);
    procedure acNegativeOstExecute(Sender: TObject);
    procedure acCommonExecute(Sender: TObject);
    procedure acCreateIniLstExecute(Sender: TObject);
    procedure acSrokiExecute(Sender: TObject);
    procedure acSetupVisibleExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acMinSpareExecute(Sender: TObject);
    procedure acAsortimentExecute(Sender: TObject);
    procedure acUchGrTypeExecute(Sender: TObject);
    procedure acMassUnitsExecute(Sender: TObject);
    procedure acPayTypeExecute(Sender: TObject);
    procedure acMedicTypeExecute(Sender: TObject);
    procedure acVvodPathExecute(Sender: TObject);
    procedure acSpecialMedicExecute(Sender: TObject);
    procedure acRecipeExecute(Sender: TObject);
    procedure acMedicProduceExecute(Sender: TObject);
    procedure mmHelpContentClick(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure acHelpContextExecute(Sender: TObject);
    procedure acMOinGroupExecute(Sender: TObject);
    procedure acMO_SelCurExecute(Sender: TObject);
    procedure osMiDocsAfterLogOn(Sender: TOracleSession);
    procedure acSpisanieVidExecute(Sender: TObject);
    procedure acReturnOsnovanieListExecute(Sender: TObject);
    procedure miWindowsClick(Sender: TObject);
    procedure tbuReportsClick(Sender: TObject);
    procedure acProdCertExecute(Sender: TObject);
    procedure acInterfaceExecute(Sender: TObject);
    procedure acZayavkaExecute(Sender: TObject);
    procedure ApplicationEvents1Activate(Sender: TObject);
    procedure ApplicationEvents1Deactivate(Sender: TObject);
    procedure acHITEC_VidHelpExecute(Sender: TObject);
    procedure acSkladExecute(Sender: TObject);
    procedure acVidPostExecute(Sender: TObject);
    procedure acCROSS_TABLE_CHECKExecute(Sender: TObject);
    procedure acFinSourceExecute(Sender: TObject);
    procedure acPayCondExecute(Sender: TObject);
    procedure acGROUP_LFExecute(Sender: TObject);
    procedure acRecalcOstExecute(Sender: TObject);
    procedure acDocs_AutoNumExecute(Sender: TObject);
    procedure acSET_VID_POM_HITECHExecute(Sender: TObject);
    procedure acDInvOldExecute(Sender: TObject);
    procedure acClosedPeriodsExecute(Sender: TObject);
    procedure acProfilExecute(Sender: TObject);
    procedure acSprOKDPExecute(Sender: TObject);
    procedure acMOGroupExecute(Sender: TObject);
  private
    { Private declarations }
    FIsMaximizeChildWindowsState : Boolean;
    FLang: array[0..KL_NAMELENGTH] of char; //Раскладка клавиатуры
    FProvisorState: Integer; // статус пользователя 0 - мс, 1 - провизор

//    FMedses_Give_Mode: Integer;
{Режим внесения данных о выдаче медикаментов постовой медсестре старшей медсестрой
 0 - ни старшая, ни младшая медсестры не вносят запись соотвествий
 1 - старшая медсестра при выдаче постовой медсестре делает соответствие
 2 - старшая медсестра при выдаче постовой медсестре НЕ делает соответствие. Постовая медсестра делает соответствие при выдаче пациенту
 Added by A.Nakorjakov 17.12.2007 12:15:57
}
    FOutterReports : TProcessList; // список ехе-файлов, которые являются отчетами

    procedure SetIsMaximizeChildWindowsState(aValue : boolean);
    procedure SetProvisorState(aValue : Integer);
    procedure MI_Reports_OnClick(Sender: TObject);        // обработчик кликов в меню списка доступных отчетов
    procedure MI_WindowsReports_OnClick(Sender: TObject); // обработчик кликов в меню списка открытых отчетов
    procedure EnableHint(AEnable: Boolean);

  public
    { Public declarations }
    function CreateChild(uType: TcomponentClass; var oForm): Boolean;
    function GetDateClose(os: TOracleSession): TDateTime;
    procedure DoShowReportMenu;  // динамически создаем меню для exe-отчетов Воронов О.А.
    function RestoreMDI_Window( aFormName : string ) : Boolean;
//    procedure ShowBalloonHint( aHintText : string; aHintHeader : string = 'ВНИМАНИЕ'; aForm : TCustomForm = nil);
    property ProvisorState : Integer read FProvisorState write SetProvisorState;


// флаг, показывающий что все дочерние окна должны быть максимизированы (при этом выполняются необходимые действия)
// нужен для прикрытия некорретного поведения дочерних окон - при создании нового окна в wsMaximize - другие окна делаются wsNormal
    property IsMaximizeChildWindowsState : Boolean read FIsMaximizeChildWindowsState write SetIsMaximizeChildWindowsState;
  end;


var
  frmMain: TfrmMain;
  dateclose: tdatetime;
  bLog: Boolean;
  sDLLOCI: string;   //Added by Neronov A.S. 12.01.2012

  function IsPostNurseMode:Boolean; // Added by A.Nakorjakov 29.12.2007 9:48:14
  function IsHeadNurseMode:Boolean; // Added by A.Nakorjakov 29.12.2007 9:48:23
  function IsNobodyMode:Boolean; // Added by A.Nakorjakov 29.12.2007 9:48:40

  function CheckOnMaximize(var aForm : TForm) : boolean;

  function GetParamString(Name: string): string; //Added by Neronov A.S. 12.01.2012
  function fDoShowForm: Boolean;                 //Added by Neronov A.S. 12.01.2012

  procedure DoSetCaption;

implementation

{$R *.DFM}

uses fInvList, fdmMain, fEdIzm, fFarmGr, fUchGr,
  fMedic, fPostavLst, fchmo, fMedKardEdit, fMedKardLst, fMO, fSetup, fgetperiod,
  fPrihList, fmovelist, fZayavList, feditall, fNeotl, fRecipe,
  inifiles, fDateInput, fMinSpare, Globals, fSpecialMedic, fGlobal, fMassUnits,
  fMedProduceList, HtmlHlp, fMOGRoup, fMOinGroup, fSpisanieVid, fSelectPeriod,
  fSklad, fVid_post, fdmPrintReports, uProdCertDlg, fInterface, ShellAPI, PKGMEDSES,
  cxGridTableView, cxGridDBTableView, cxTL, cxDBTL, Variants, fCross_table_check,
  fdmSkladSelect {$IFNDEF MIS2} {$IFNDEF SAKURA} ,uGlobal {$ENDIF} {$ENDIF},
  fImportNakl, fFinSource, fPayCond, fGroup_LF, fDoc_Autonum, fSetPacSpis_HiTech,
  fClosedPeriods, fProfil, uSprOKDP,  DateUtils;

//  , SMMainAPI;
//excludes

//frashlist
//fSotrRightLst

// Get a commandline parameter by name
function GetParamString(Name: string): string;    //Added by Neronov A.S. 12.01.2012
var i: Integer;
begin
  for i := 1 to ParamCount do
  begin
    if Pos(AnsiUpperCase(Name) + '=', AnsiUpperCase(ParamStr(i))) > 0 then
    begin
      Result := Copy(ParamStr(i), Length(Name) + 2, 255);
      Exit;
    end;
  end;
  Result := '';
end;

function fDoShowForm: Boolean;            //Added by Neronov A.S. 12.01.2012
begin
  sDLLOCI := GetParamString('OCIDLL');
  if sDLLOCI <> '' then
  begin
    if not FileExists(sDLLOCI) then
    begin
      Application.MessageBox(pChar('В параметрах запуска МИС указан путь к файлу OCI.DLL: '
          + #13 + sDLLOCI + #13 + 'но он не найден. Обратитесть к администратору системы.'), 'Ошибка', MB_OK + MB_ICONERROR);
      sDLLOCI := '';
    end
    else
      sDLLOCI := ' OCIDLL=' + sDLLOCI;
  end;
end;

{Added by A.Nakorjakov 29122007
started}

function IsPostNurseMode:Boolean;
begin
  Result := (dmMain.ConfigParams.GetParamValue('Medses_Give_Mode', NOBODYMODE) = POSTNURSEMODE);
end;

function IsHeadNurseMode:Boolean;
begin
  Result := (dmMain.ConfigParams.GetParamValue('Medses_Give_Mode', NOBODYMODE) = HEADNURSEMODE);
end;

function IsNobodyMode:Boolean;
begin
  Result := (dmMain.ConfigParams.GetParamValue('Medses_Give_Mode', NOBODYMODE) = NOBODYMODE);
end;
{Added by A.Nakorjakov 29122007
finished}


//****************************************************************************************
//                                 TfrmMain.acAboutExecute
//****************************************************************************************

procedure TfrmMain.acAboutExecute(Sender: TObject);
//begin
//  DoShowAbout;
//end;
//type TDoShowAbout = procedure(NewApp: TApplication); stdcall;
//var sDllName, sFunctionName: string;
//  DoShowAbout: TDoShowAbout;
//  hInstanse: THandle;
begin

//  sDllName := 'smmain.dll';
//  sFunctionName := 'DoShowAbout';
//  hInstanse := SafeLoadLibrary(pChar(sDllName));
//  if hInstanse > 0 then
//  begin
//    try
//      DoShowAbout := GetProcAddress(hInstanse, 'DoShowAbout');
//      if @DoShowAbout <> nil then DoShowAbout(Application)
//      else Windows.MessageBox(Handle, pChar('Функция "' + sFunctionName + '" библиотеки "' +
//          sDllName + '" не найдена!'),
//          'Ошибка', mb_ok + mb_iconerror);
//    finally
//      FreeLibrary(hInstanse);
//    end; // if hInstanse > 0 then
//  end
//  else Windows.MessageBox(Handle, pChar(sDllName + ' библиотека не найдена!.'), 'Ошибка', mb_ok + mb_iconerror);
  {$IFNDEF MIS2}
  DoShowAbout;
  {$ENDIF}  
end;
//****************************************************************************************
//                                 TfrmMain.acDInvListExecute
//****************************************************************************************
procedure TfrmMain.acDInvListExecute(Sender: TObject);
var
  pr : TProcess;
begin
  if ( dmMain.ConfigParams.GetParamValue('FUNC_USE_EDITED_INVENTORY', 0) = 1 ) then
  begin
    tbInvList.ImageIndex := 49;
    DoShowInventoryList;
  end
  else
  begin
    if FileExists('repInv.exe') then
    begin
      pr := TProcess.Create('repInv.exe', ParamStr(1), True);
      try
        {$IFNDEF OLD_AUTH}
        if pr.IsProcessCatched then
          GetInputMapAppFromApp(pr.PID);
        {$ENDIF}
      finally
        pr.Free;
      end;      
    end
    else
      Application.MessageBox(PChar('Не найден модуль repInv.exe'+#13#10'Необходимо обновить модуль'), 'Ошибка', MB_OK+MB_ICONERROR);
  end;

  ToolBar1.Refresh;
end;

procedure TfrmMain.acDInvOldExecute(Sender: TObject);
var
  pr : TProcess;
begin
  tbInvList.ImageIndex := 49;
  if FileExists('repInv.exe') then
  begin
    pr := TProcess.Create('repInv.exe', ParamStr(1), True);
    try
      {$IFNDEF OLD_AUTH}
      if pr.IsProcessCatched then
        GetInputMapAppFromApp(pr.PID);
      {$ENDIF}
    finally
      pr.Free;
    end;
  end
  else
    Application.MessageBox(PChar('Не найден модуль repInv.exe'+#13#10'Необходимо обновить модуль'), 'Ошибка', MB_OK+MB_ICONERROR);
// теперь у нас инвентаризация вызвается извне

  ToolBar1.Refresh;
  tbInvList.ImageIndex := 51;
end;

//****************************************************************************************
//                                 TfrmMain.acEdIsmExecute
//****************************************************************************************

procedure TfrmMain.acEdIsmExecute(Sender: TObject);
begin
  DoShowEdIzm;
end;

{********************************************************************************************************}
{        TfrmMain.CreateChild
{********************************************************************************************************}

function TfrmMain.CreateChild(uType: TcomponentClass; var oForm): Boolean;
var
  I, N: integer;
  lFound: boolean;
begin
  lFound := false;
  N := 0;
  for I := 0 to Self.MDIChildCount - 1 do begin
    if UpperCase(Self.MDIChildren[I].ClassName) = UpperCase(uType.ClassName) then begin
      lFound := true;
      N := I;
      break;
    end;
  end;
  if not lFound then begin
    Application.CreateForm(uType, oForm);
    TForm(oForm).FormStyle := fsMDIChild;
    TForm(oForm).Show;
    Result := TRUE;
  end
  else begin
    MakeWinOpen(Self.MDIChildren[N]);
    Result := FALSE;
  end;
end;

//****************************************************************************************
//                                 TfrmMain.acFarmGrExecute
//****************************************************************************************

procedure TfrmMain.acFarmGrExecute(Sender: TObject);
begin
  DoShowFarmGr;
end;

//****************************************************************************************
//                                 TfrmMain.acUchGrExecute
//****************************************************************************************

procedure TfrmMain.acUchGrExecute(Sender: TObject);
begin
  DoShowUchGr;
end;

//****************************************************************************************
//                                 TfrmMain.acMedicExecute
//****************************************************************************************

procedure TfrmMain.acMedicExecute(Sender: TObject);
//var
//  MedicFilter : string;
begin
  tbAssortiment.ImageIndex := 49;
//  if frmMain.FUNC_USE_SKLAD = 1 then
//  begin
//    if  (VarIsNull(dmMain.CurMO_SKLAD_ID)  = False)and(frmMain.ProvisorState = 1) then
//      MedicFilter := 'FK_SKLAD_ID = '+IntToStr(dmMain.CurMO_SKLAD_ID)
//    else
//      MedicFilter := '';
//  end
//  else
//    MedicFilter := '';

  DoShowMedic(-1, False, '', True, False, '', 'Список объектов учета', dmMain.CurMO_SKLAD_ID);
end;

{****************************************************************************************}
{                                 TfrmMain.acPostavshikExecute
{****************************************************************************************}

procedure TfrmMain.acPostavshikExecute(Sender: TObject);
begin
  DoShowPostavLst(0);
end;

{****************************************************************************************}
{                                 TfrmMain.acMatOtvExecute
{****************************************************************************************}

procedure TfrmMain.acMatOtvExecute(Sender: TObject);
var
  nNewChmo: Integer;
begin
  // теперь эту функцию выполняет группы мат. отв. Воронов О.А. 12.02.2008
  nNewChmo := getChmoID(round(dmMain.pkgMedSes.GETCURMO));
  if nNewChmo <> -1 then
  begin
    dmMain.pkgMedSes.SETCURMO(nNewChmo);
    DoSetCaption;
    ProvisorState := dmMain.pkgMO.IsMOProvisor( nNewChmo );
  end;
end;

{****************************************************************************************}
{                                 TfrmMain.acExitExecute
{****************************************************************************************}

procedure TfrmMain.acExitExecute(Sender: TObject);
begin
  Close;
end;
{****************************************************************************************}
{                                 TfrmMain.FormCloseQuery
{****************************************************************************************}
procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := Windows.MessageBoxEx(Handle, 'Вы действительно хотите выйти из программы?', 'Внимание', MB_YESNO + MB_ICONQUESTION,$0419 {Russian}) = mrYes;

// финальная проверка на открытые отчеты
  FOutterReports.DeleteInvalidProcesses;
  if (CanClose) and (FOutterReports.Count > 0)and(Application.MessageBox('Некоторые отчеты остались незакрытыми.'#13#10' Вы хотите закрыть их все?', 'Внимание', MB_YESNO + MB_ICONQUESTION) = mrYes) then
    FOutterReports.ExitOrTerminateAllProcesses;
  Application.ProcessMessages;
// закрываем все дочерние окна, чтобы там обработались события OnClose
  if CanClose then
  begin
    while Self.MDIChildCount > 0 do
    begin
      Self.MDIChildren[0].Close;
      Application.ProcessMessages;
    end;
  end; // if CanClose then
end;

{****************************************************************************************}
{                                 TfrmMain.acMedKardExecute
{****************************************************************************************}

procedure TfrmMain.acMedKardExecute(Sender: TObject);
begin
  tbOst.ImageIndex := 49;
//  globdata := dmMain.odsEI.FieldByName('datasys').AsDateTime + 1;
  DoShowMedKardLst( -1, 1, 0, False, SPISANIE_VID_NONE, '', True );
  ToolBar1.Refresh;
end;

{****************************************************************************************}
{                                 TfrmMain.acMOExecute
{****************************************************************************************}

procedure TfrmMain.acMOExecute(Sender: TObject);
begin
  DoShowMO;
end;
{ Вызов справочника "Материально ответственные группы лиц" }
procedure TfrmMain.acMOGroupExecute(Sender: TObject);
begin
  DoShowMOGroups;
end;

procedure TfrmMain.acSetupExecute(Sender: TObject);
begin

end;

{****************************************************************************************}
{                                 TfrmMain.miSprClick
{****************************************************************************************}
procedure TfrmMain.miSprClick(Sender: TObject);
begin
end;

{****************************************************************************************}
{                                 TfrmMain.acMORightExecute
{****************************************************************************************}

procedure TfrmMain.acDPrihExecute(Sender: TObject);
begin
  tbPrih.ImageIndex := 49;
  doshowPrihList;
  ToolBar1.Refresh;
end;

procedure TfrmMain.acZayavkaExecute(Sender: TObject);
begin
  tbuZayavka.ImageIndex := 49;
  DoShowZayavList;
  ToolBar1.Refresh;
end;

procedure TfrmMain.acDMoveExecute(Sender: TObject);
begin
  if bLog then SaveToLog('fMainForm', 'acDMoveExecute ... Start');
  tbMove.ImageIndex := 49;
  doshowMOvelist;
  ToolBar1.Refresh;
end;

procedure TfrmMain.acDocs_AutoNumExecute(Sender: TObject);
begin
  DoShowDocs_AutoNum;
end;

procedure TfrmMain.MainMenuChange(Sender: TObject; Source: TMenuItem;
  Rebuild: Boolean);
begin
  {$IFNDEF MIS2}
  MenuDocs.os := dmMain.Os;
  MenuDocs.nSotrID := dmMain.nSotrFK_ID;
  if (dmMain.bNyagan)and(dmMain.IsSotrAdmin = False) then
    MenuDocs.CreateDocMenu(miDocs); //заполнениепункта меню отчетами (TREPAPP)
  {$ENDIF}
  miDocs.Visible := miDocs.Count > 0;

end;

{****************************************************************************************}
{                                 TfrmMain.acNeotlExecute
{****************************************************************************************}

procedure TfrmMain.acNeotlExecute(Sender: TObject);
begin
  tbMinZapas.ImageIndex := 49;
  DoShowNeotlozh;
  ToolBar1.Refresh;  
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmMain.bhtMain.CancelHint;
  IniWriteString(iniFileName, 'Uchet', 'nRed', inttostr(dmmain.nred));

  //загружаем раскладку ту что была до вызова программы
  LoadKeyboardLayout(FLang, KLF_ACTIVATE);

  // сохранение настроек в БД
  {$IFDEF MIS2}
  {$ELSE}
  try
    dmMain.odsAllSettings.Close;
    dmMain.odsAllSettings.SetVariable('FC_COMMENT', ExtractFileName(Application.ExeName)+'_'+IntToStr(dmMain.nSotrFK_ID));
    dmMain.odsAllSettings.Open;
    if dmMain.odsAllSettings.RecordCount=0 then
    begin
      dmMain.oqCLOBS_Ins.SetVariable('FC_COMMENT', ExtractFileName(Application.ExeName)+'_'+IntToStr(dmMain.nSotrFK_ID));
      dmMain.oqCLOBS_Ins.Execute;
      dmMain.odsAllSettings.Close;
      dmMain.odsAllSettings.Open;
    end;

    dmMain.odsAllSettings.Edit;
    TBlobField(dmMain.odsAllSettings.FieldByName('FC_CLOB')).LoadFromFile( iniFileName );
    dmMain.odsAllSettings.Post;
    dmMain.odsAllSettings.Session.Commit;
    DeleteFile(iniFileName);
  except
    on E: Exception do Application.MessageBox( PChar('При сохранении настроек в БД возникла ошибка'#13#10'Обратитесь к разаботчику'#13#10#13#10'Текст ошибки:'#13#10+E.Message),'Ошибка', MB_OK	+MB_ICONERROR);
  end;
  {$ENDIF}
end;

procedure TfrmMain.miNegativeOstClick(Sender: TObject);
begin
  odsMinKol.Close;
  odsMinKol.Open;
  if odsMinKol.RecordCount = 0 then ShowMessage('Нет отрицательных остатков!')
  else frMinKol.ShowReport;
end;

procedure TfrmMain.ToolButton6tClick(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  oqRefreshMedic.Execute;
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.acSecretExecute(Sender: TObject);
var
  i : Integer;
begin
//  if IniReadInteger(iniFileName, 'Config', 'ShowPrih', 0) = 0 then
//    IniWriteString(iniFileName, 'Config', 'ShowPrih', '1')
//  else
//    IniWriteString(iniFileName, 'Config', 'ShowPrih', '0');

  if IniReadInteger(iniFileName, 'Config', 'ShowMedicProduce', 0) = 0 then
    IniWriteString(iniFileName, 'Config', 'ShowMedicProduce', '1')
  else
    IniWriteString(iniFileName, 'Config', 'ShowMedicProduce', '0');

  if IniReadInteger(iniFileName, 'Config', 'ShowInventarizach', 0) = 0 then
    IniWriteString(iniFileName, 'Config', 'ShowInventarizach', '1')
  else
    IniWriteString(iniFileName, 'Config', 'ShowInventarizach', '0');

//  acDPrih.Enabled := IniReadInteger(iniFileName, 'Config', 'ShowPrih', 0) = 1;
//  acDPrih.Visible := acDPrih.Enabled;
  acMedicProduce.Enabled := IniReadInteger(iniFileName, 'Config', 'ShowMedicProduce', 0) = 1;
  acMedicProduce.Visible := acMedicProduce.Enabled;
  acDInvList.Enabled := IniReadInteger(iniFileName, 'Config', 'ShowInventarizach', 0) = 1;
  acDInvList.Visible := acDInvList.Enabled;

  ToolBar1.Repaint;
  for i := 0 to ToolBar1.ButtonCount-1 do
  begin
    ToolBar1.Buttons[i].AutoSize := True;
    ToolBar1.Buttons[i].Wrap := False;
  end;

end;

procedure TfrmMain.miCalcOstClick(Sender: TObject);
begin
  Exit; // добавил Воронов О.А. - чтобы вообще исключить возможность срабатывания перерасчета
  with TfrmGetperiod.Create(nil) do
  try
    if ShowModal = mrok then
    begin
      if dDate1.date < dateclose then
      begin
        windows.MessageBox(Self.Handle, PChar('Данный период закрыт !'), 'Ошибка', MB_OK + MB_ICONError);
        exit;
      end;

      if windows.MessageBox(Handle, PChar('Будет произведен пересчет остатков ! Продолжить ?'),
        'Предупреждение', MB_YESNO + MB_ICONQUESTION) = mrYes then
      begin
        screen.Cursor := crSQLWait;

        dosetmoveprice.SetVariable('d1', dDate1.date);
        dosetmoveprice.SetVariable('d2', dDate2.date);
        dosetmoveprice.Execute;
        dmMain.os.Commit;
        screen.Cursor := crDefault;
      end;
    end;
  finally
    Free;
  end;
end;

procedure TfrmMain.miSelectPeriodClick(Sender: TObject);
begin
  DoShowSetup;
end;

procedure TfrmMain.acPriceExecute(Sender: TObject);
begin
  if windows.MessageBox(Self.Handle, PChar('Все нулевые цены в документах перемещения и расхода будут изменены! Продолжить?'), 'Предупреждение', MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
    screen.Cursor := crSQLWait;
    dosetmoveprice.Execute;
    dmMain.os.Commit;
    odsSelNullPrice.Refresh;
    screen.Cursor := crDefault;
    frNullPrice.ShowReport;
  end;
end;

procedure TfrmMain.acClosedPeriodsExecute(Sender: TObject);
begin
  DoShowClosedPeriods;
end;

procedure TfrmMain.acClosePeriodExecute(Sender: TObject);
begin
  with Tfrmgetperiod.Create(Self) do
  try
    if ShowModal = mrok then
    begin
      oqUpdData.SetVariable('d1', dDate1.date);
      oqUpdData.SetVariable('d2', dDate2.date);
      oqUpdData.Execute;
      dmMain.os.Commit;
//    odsGetclose.Refresh;
//    odsGetclose.FieldByName('FD_DATA2').AsDateTime;
      dateclose := GetDateClose(dmMain.os);
    end;
  finally
    Free;
  end;
end;

procedure TfrmMain.acNegativeOstExecute(Sender: TObject);
begin
  odsMinKol.Close;
  odsMinKol.Open;
  if odsMinKol.RecordCount = 0 then ShowMessage('Нет отрицательных остатков!')
  else frMinKol.ShowReport;
end;

procedure TfrmMain.acCommonExecute(Sender: TObject);
begin
  with TfrmEditAll.Create(Self) do
  try
    ShowModal
  finally
    Free;
  end;
end;

procedure TfrmMain.acCreateIniLstExecute(Sender: TObject);
var I: Integer;
  FIniFile: TIniFile;
begin
  FIniFile := TIniFile.Create(iniFileName);
  try
    for I := 0 to alAll.ActionCount - 1 do
    begin
      if (TAction(alAll.Actions[I]).Category = 'Operations') or
        (TAction(alAll.Actions[I]).Category = 'Setup') and (TAction(alAll.Actions[I]).Enabled) then
        FIniFile.WriteString(UpperCase(TAction(alAll.Actions[I]).Category), TAction(alAll.Actions[I]).Name, '1');
    end;

    for I := 0 to MainMenu.Items.Count - 1 do
      FIniFile.WriteString('MENUITEMS', MainMenu.Items[I].Name, '1');
  finally
    FIniFile.Free;
  end;
end;

procedure TfrmMain.acSrokiExecute(Sender: TObject);
//var
//  cur: TCursor;
begin
// не нужно, поскольку этот отчет вынесен в отдельный отчет
//  tbuSroki.ImageIndex := 49;
//  cur := Screen.Cursor;
//  Screen.Cursor := crSQLWait;
  //  with TfrmDateInput.Create(nil) do // старая реализация
//  with TfrmSelectPeriod.Create(Application) do
//  try
//    deDate1.Properties.ReadOnly := False;
//    deDate2.Properties.ReadOnly := False;
//    if ShowModal = mrOk then begin
//      odssrok.SetVariable('afd_data1', deDate1.Date);
//      odssrok.SetVariable('afd_data2', deDate2.Date);
//      odssrok.close;
//      odssrok.open;
//      Screen.Cursor := crDefault;
//      if odssrok.RecordCount > 0 then
//        frSrok.ShowReport
//      else
//        Application.MessageBox('За выбранный период нет просроченных препаратов', 'Внимание', MB_OK+MB_ICONINFORMATION);
//    end;
//  finally
//    Free;
//    Screen.Cursor := cur;
//  end;
//  tbuSroki.ImageIndex := 51;
end;

procedure TfrmMain.acSetupVisibleExecute(Sender: TObject);
begin
  if IniReadInteger(iniFileName, 'Config', 'ShowSetup', 0) = 0 then
    IniWriteString(iniFileName, 'Config', 'ShowSetup', '1')
  else
    IniWriteString(iniFileName, 'Config', 'ShowSetup', '0');

  miSpr.Enabled := IniReadInteger(iniFileName, 'Config', 'ShowSetup', 0) = 1;
  miSpr.Visible := miSpr.Enabled;
end;

procedure TfrmMain.acSET_VID_POM_HITECHExecute(Sender: TObject);
begin
  DoShowSetVidPom_HITECH;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
  function GetComputerName: string;
  var
    N: Cardinal;
    Buf: array[0..1023] of AnsiChar;
  begin
    N := SizeOf(Buf) - 1;
    Windows.GetComputerName(Buf, N);
    Result := PChar(@Buf[0]);
  end;

  procedure CheckSecondCopy(os: TOracleSession);
  var oq: TOracleQuery;
  begin
    //проверка не запущена ли вторая копия задачи
    //фигня
    oq := TOracleQuery.Create(nil);
    try
      oq.Session := os;
      oq.Sql.Text := 'SELECT S.OSUSER,S.MACHINE FROM V$SESSION S ' +
        'WHERE UPPER(s.PROGRAM) = ''' + AnsiUpperCase(ExtractFileName(ParamStr(0))) + ''' ' +
        '  AND UPPER(S.TERMINAL) = ''' + AnsiUpperCase(GetComputerName) + '''';
      try
        oq.Execute;
        if not oq.Eof then
        begin
          Application.MessageBox(pChar('Вторую копию программы запускать нельзя!'),
            'Ошибка!', MB_OK + MB_ICONERROR);
          Halt;
        end;
      except
        on E: Exception do
        begin
          Application.MessageBox(pChar('Приложение завершает свою работу ' + #10#13 +
            E.Message), 'Ошибка...', MB_OK + MB_ICONERROR);
          Halt;
        end;
      end;
    finally
      oq.Free;
    end;
  end;

  procedure ToggleActionsState(pSection: string);
  var I, J: Integer;
    FIniFile: TIniFile;
    sl: TStringList;
  begin
    sl := TStringList.Create;
    FIniFile := TIniFile.Create(iniFileName);
    try
      FIniFile.ReadSectionValues(pSection, sl);
      for I := 0 to sl.Count - 1 do
      begin
        if sl.Values[sl.Names[I]] = '0' then
          for J := 0 to alAll.ActionCount - 1 do
            if TAction(alAll.Actions[J]).Name = sl.Names[I] then
            begin
              TAction(alAll.Actions[J]).Enabled := False;
              TAction(alAll.Actions[J]).Visible := False;
              Break;
            end;
      end;
    finally
      FIniFile.Free;
      sl.Free;
    end;
  end;

  procedure ToggleMenuItems(pSection: string);
  var I, J: Integer;
    FIniFile: TIniFile;
    sl: TStringList;
  begin
    sl := TStringList.Create;
    FIniFile := TIniFile.Create(iniFileName);
    try
      FIniFile.ReadSectionValues(pSection, sl);
      for I := 0 to sl.Count - 1 do
      begin
        if sl.Values[sl.Names[I]] = '0' then
          for J := 0 to MainMenu.Items.Count - 1 do
            if MainMenu.Items[J].Name = sl.Names[I] then
            begin
              MainMenu.Items[J].Visible := False;
              Break;
            end;
      end;
    finally
      FIniFile.Free;
      sl.Free;
    end;
  end;

//var sDate1, sDate2: string;
//    Date1, Date2, DateNow : TDateTime;
begin
  //ShowMessage(ParamStr(1));
  // те настройки, которые должны инициализоваться первыми
  ProvisorState := dmMain.pkgMO.IsMOProvisor( dmMain.pkgMedSes.GETCURMO );

  if dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1 then
  begin
    dmMain.odsSklad.Open;
    dmSkladSelect.FillSkladMenuItems;
  end;

  DoSetCaption;

  // проверка на параметр OCIDLL
  fDoShowForm; //Added by Neronov A.S. 12.01.2012
  // ---------------------------------------------------------------------------


  //Запоминаем текущюю раскладку
  GetKeyboardLayoutName(FLang);
  //Загружаем русскую раскладку клавиатуры
  LoadKeyboardLayout(PChar('00000419'), KLF_ACTIVATE);

//  CheckSecondCopy(dmMain.os);
  dmPrintReports.SetSession( dmMain.os );
  FOutterReports := TProcessList.Create;


  if dmMain.IsSotrAdmin then
  begin
    miOper.Visible := False;
    miDocs.Visible := False;
    CoolBar1.Hide;
    MainMenu.OnChange := nil;
    miWindows.OnClick := nil;
  end
  else
  begin
    ToggleActionsState('SETUP');
    ToggleActionsState('OPERATIONS');
    ToggleMenuItems('MENUITEMS');
//      dmMain.odsTFinSource.Open;


  //  odsGetclose.Close;
  //  odsGetclose.Open;

  //  dateclose:=odsGetclose.FieldByName('FD_DATA2').AsDateTime;

  //  dateclose := GetDateClose(dmMain.os);

    dmMain.pkgMedSes.ResetDatePeriod;
//    dmMain.SetUnLock('', 'MED.TDOCS.DPID=%', 1);

  // Убрано поскольку рабочий период не нужен Воронов О.А. 03.07.2007
  //  sDate1 := IniReadstring(iniFileName, 'Data', 'data1');
  //  sDate2 := IniReadstring(iniFileName, 'Data', 'data2');
  //  if (trim(sDate1) <> '') and (trim(sDate2) <> '') then
  //    sbMain.Panels[0].Text := 'Рабочий период: [ ' + sDate1 + ' - ' + sDate2 + ' ]'
  //  else
  //  begin
  //    sbMain.Panels[0].Text := 'Рабочий период не определен';
  //    ShowBalloonHint('Рабочий период не определен');
  //  end;


  // Добавил Воронов О.А. 31.05.2007
  // Убрано поскольку рабочий период не нужен Воронов О.А. 03.07.2007
  //  Date1 := StrToDate(sDate1);
  //  Date2 := StrToDate(sDate2);
  //  DateNow := ServerDate(dmMain.os);
  //  if (Date1 > DateNow) or (Date2 < DateNow) then ShowBalloonHint('Рабочий период не включает текущую дату'#13#10'Вы не сможете распоряжаться текущими медикаментами');

  // это не нужно, поскольку сначала определеяется свойство ProvisorState, которое все эти настройки выставит
  //  miSpr.Enabled := IniReadInteger(iniFileName, 'Config', 'ShowSetup', 0) = 1;
  //  miSpr.Visible := miSpr.Enabled;
  //  acDPrih.Enabled := IniReadInteger(iniFileName, 'Config', 'ShowPrih', 0) = 1;
  //  acDPrih.Visible := acDPrih.Enabled;
  //  acMedicProduce.Enabled := IniReadInteger(iniFileName, 'Config', 'ShowMedicProduce', 0) = 1;
  //  acMedicProduce.Visible := acMedicProduce.Enabled;

    bLog := IniReadInteger(iniFileName, 'Config', 'bLog', 0) = 1;

    Application.HelpFile := ExtractFilePath(Application.ExeName) + 'Medica.chm';

    ToolBar1.Refresh;

    // deemaric
    // для Югорска не делаем менюшку, она делается в старом варинте через CreateDocMenu
    {$IFNDEF MIS2}
    if not dmMain.bNyagan then
       DoShowReportMenu;
    {$ENDIF}       

  // Хотелки Гордюк - теперь эта кнопка не нужна. Воронов О.А. 11.03.2008
  //  tbuReports.Visible  := miReports.Visible;
  //  ToolButton6.Visible := miReports.Visible;

    tbInvList.Visible := False;
    ToolButton2.Visible := False;

//    acMinSpare.Visible := (dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_APTEKA);
//    acMinSpare.Enabled := (dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_APTEKA);


    acCROSS_TABLE_CHECK.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_CROSS_TABLE_CHECK', 0) = 1);
    acCROSS_TABLE_CHECK.Enabled := acCROSS_TABLE_CHECK.Visible;

  end;
              
  if dmMain.ConfigParams.GetParamValue('FUNC_USE_PROFIL', 0) = 1 then
  begin
    acProfil.Visible := true;
    acProfil.Enabled := acProfil.Visible;

    dmMain.odsProfil.Open;
  end;

  //Added by Neronov A.S. 26.03.2012
  acDInvOld.Enabled := dmMain.ConfigParams.GetParamValue('FUNC_SHOW_INV_OLD_VIEW', 0) = 1;
  acDInvOld.Visible := acDInvOld.Enabled;

  if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_FIN_SOURCE', 0) = 1 then
  begin
    dmMain.odsTFinSource.Open;
    acFinSource.Visible := True;
  end;

  if dmMain.ConfigParams.GetParamValue('FUNC_SHOW_PAY_COND', 0) = 1 then
  begin
    dmMain.odsPayCond.Open;
    acPayCond.Visible := True;
  end;

  acZayavka.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_ZAYAV', 0) = 1)and
                       (ProvisorState = 1) and
                       ((dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_APTEKA) or ((dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 0)));
  acZayavka.Enabled := acZayavka.Visible;

  acHITEC_VidHelp.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_SPIS_HITEC', 0) = 1);
  acHITEC_VidHelp.Enabled := acHITEC_VidHelp.Visible;    

  acSprOKDP.Visible := (dmMain.IsSotrAdmin)or((dmMain.ConfigParams.GetParamValue('FUNC_USE_OKDP', 0) = 1));
  acSprOKDP.Enabled := acSprOKDP.Visible;

  acSklad.Visible := (dmMain.IsSotrAdmin)or((dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1));
  acSklad.Enabled := acSklad.Visible;

  acFarmGr.Enabled := (dmMain.IsSotrAdmin)or((dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 0)or((dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_APTEKA)));
  acFarmGr.Visible := acFarmGr.Enabled;

  acMassUnits.Enabled := acFarmGr.Enabled;
  acMassUnits.Visible := acFarmGr.Visible;

  acSpecialMedic.Enabled := acFarmGr.Enabled;
  acSpecialMedic.Visible := acFarmGr.Visible;

  acDocs_AutoNum.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_DOCS_AUTONUM', 0) = 1);

  acVidPost.Visible := (dmMain.IsSotrAdmin)or((dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM <> cSKLAD_SYNONIM_APTEKA));
  acVidPost.Enabled := (dmMain.IsSotrAdmin)or((dmMain.ConfigParams.GetParamValue('FUNC_USE_SKLAD', 0) = 1)and(dmMain.CurMO_SKLAD_SYNONIM <> cSKLAD_SYNONIM_APTEKA));

//    acNeotl.Visible := (dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_APTEKA);
//    acNeotl.Enabled := (dmMain.CurMO_SKLAD_SYNONIM = cSKLAD_SYNONIM_APTEKA);

  acMedicProduce.Enabled   := (dmMain.IsSotrAdmin = False)and
                              (ProvisorState = 1)and
                              (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_PRODUCE_MEDIC', False) = True);
  acMedicProduce.Visible   := acMedicProduce.Enabled;
  tbMedProduce_Sep.Visible := acMedicProduce.Enabled;

  acGROUP_LF.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_USE_GROUP_LF', 0) = 1);
  acGROUP_LF.Enabled := acGROUP_LF.Visible;

  acSET_VID_POM_HITECH.Visible := (dmMain.ConfigParams.GetParamValue('FUNC_SET_VID_POM_HITECH', False));

  acSecret.Enabled := False;   // закрываем дырки 
  acSetupVisible.Enabled := False;
end;

procedure TfrmMain.acMinSpareExecute(Sender: TObject);
begin
  tbMinSpare.ImageIndex := 49;
  DoShowMinSpare;
  ToolBar1.Refresh;
end;

procedure TfrmMain.acAsortimentExecute(Sender: TObject);
//var
//  MedicFilter : string;
begin
  tbAssortiment.ImageIndex := 49;
//  if frmMain.FUNC_USE_SKLAD = 1 then
//  begin
//    if  VarIsNull(dmMain.CurMO_SKLAD_ID)  = False then
//      MedicFilter := 'FK_SKLAD_ID = '+IntToStr(dmMain.CurMO_SKLAD_ID)
//    else
//      MedicFilter := '';
//  end
//  else
//    MedicFilter := '';

  DoShowMedic(-1, False, '', miSpr.Visible, False, '', 'Список объектов учета', dmMain.CurMO_SKLAD_ID);
  ToolBar1.Refresh;
end;

function TfrmMain.GetDateClose(os: TOracleSession): TDateTime;
var oq: TOracleQuery;
begin
  oq := TOracleQuery.Create(nil);
  try
    oq.Session := os;
    oq.Sql.Text := 'SELECT NVL(MAX(FD_DATA2),TO_DATE(''01.01.2000'',''DD.MM.YYYY'')) FROM MED.TDATE';
    oq.Execute;
    Result := oq.Field(0);
  finally
    oq.Free;
  end;
end;

procedure TfrmMain.acUchGrTypeExecute(Sender: TObject);
begin
//  DoShowUchGrType;
end;

procedure TfrmMain.acMassUnitsExecute(Sender: TObject);
begin
  DoShowMassUnits;
end;

procedure TfrmMain.acPayTypeExecute(Sender: TObject);
begin
//  DoShowPayType;
end;

procedure TfrmMain.acMedicTypeExecute(Sender: TObject);
begin
//  DoShowMedicType;
end;

procedure TfrmMain.acVvodPathExecute(Sender: TObject);
begin
//  DoShowVvodPath;
end;

procedure TfrmMain.acSpecialMedicExecute(Sender: TObject);
begin
  DoShowSpecialMedic;
end;

procedure DoSetCaption;
//var
//  MOGroup : string;
begin
  dmMain.MOID := TRUNC(dmMain.pkgMedSes.GETCURMO);
  dmMain.FK_CurMO_GROUP := dmMain.pkgMedSes.GET_CUR_MOGROUP_BY_CUR_MO;
  dmMain.FC_CurMO_GROUP := dmMain.pkgMedSes.GET_MOGROUP_NAME( dmMain.FK_CurMO_GROUP );
  dmMain.CurMO_SKLAD_ID := fdmMain.nvl(dmMain.pkgMedSes.GET_CUR_MO_SKLAD_ID,0);
  if fdmMain.nvl(dmMain.CurMO_SKLAD_ID,0) > 0 then
    dmMain.odsSklad.Locate('FK_ID', dmMain.CurMO_SKLAD_ID, []);

  dmMain.CurMO_SKLAD_SYNONIM := dmMain.pkgMedSes.GET_CUR_MO_SKLAD_SYNONIM;
  if dmMain.FC_CurMO_GROUP = '' then
  begin
    dmMain.FC_CurMO_GROUP := 'Группа МО не выбрана';
    dmMain.ShowBalloonHint('Вами не выбрана ни одна из групп МО.'#13#10'Вы не сможете работать с остатками');
    //MessageBox('Вам не не назначена ни одна из групп МО.'#13#10'Вы не сможете работать с партиями препаратов','Внимание', MB_OK+MB_ICONWARNING);
  end;
//  frmMain.Caption := 'Учет медикаментов - ' + dmMain.pkgMO.GETNAMEBYID( dmMain.MOID ) + ' ( '+dmMain.FC_CurMO_GROUP+' )'; // + ' ('+ParamStr(1)+')';
  frmMain.Caption := 'Учет медикаментов';
  if fdmMain.nvl(dmMain.CurMO_SKLAD_ID,0) > 0 then
    frmMain.Caption := frmMain.Caption + ' - ' + '[Склад: '+dmMain.odsSklad.FieldByName('FC_NAME').asString+']   '+dmMain.pkgMO.GETNAMEBYID( dmMain.MOID ) + ' ( '+dmMain.FC_CurMO_GROUP+' )'
  else
    frmMain.Caption := frmMain.Caption + ' - '+dmMain.pkgMO.GETNAMEBYID( dmMain.MOID ) + ' ( '+dmMain.FC_CurMO_GROUP+' )'; // + ' ('+ParamStr(1)+')';
  dmMain.odsUchGr.Close;
  dmMain.odsUchGr.Open;
end;

procedure TfrmMain.acRecalcOstExecute(Sender: TObject);
var
  d : TDateTime;
  dBegin, d_max: TDateTime;
  fGetDate : TfrmDateInput;
begin
  try
    try
      fGetDate := TfrmDateInput.Create(nil);
      d_max := IncYear(EncodeDate(CurrentYear, 1, 1),-2); // откатываем на 2 года надад
      fGetDate.deDate.Date := d_max ;
      fGetDate.v_check_Date:=True;
      fGetDate.v_max_date:=d_max;
      if fGetDate.ShowModal = mrOk then
      begin
        dBegin := Trunc(fGetDate.deDate.Date);
        if dBegin>d_max then dBegin:=d_max;
      end else
        Exit; //ShowMessage('');
    finally
      fGetDate.Free;
    end;
    d := Now;
    //osRecalcOst.Execute;
  {  oqRecalcOst.SetVariable('pDate',dBegin);
    oqRecalcOst.Execute; }
    try
      screen.cursor:=crSQLWait;
      // пересчет остатков - вставить изменение вида курсора на часики
      PKG_RecalcOst.CallProcedure('p_clc_rest',[dBegin]);
    finally
      screen.cursor:=crDefault;
    end;

    Application.MessageBox(PChar('Перерасчет остатков завершён успешно!'+#13+#10+
                                 'Затрачено времени - '+TimeToStr(Now-d)),
                                 'Внимание', MB_ICONINFORMATION + MB_OK);
  except
      on E: Exception do
      begin
        Application.MessageBox(PChar('При пересчете произошла ошибка.'#13#10' Обратитесь в службу поддержки.'#10#13#10#13 +E.Message), 'Ошибка', MB_ICONERROR + MB_OK);
      end;
  end;
end;

procedure TfrmMain.acRecipeExecute(Sender: TObject);
var
  f: TfrmRecipe;
begin
  f := TfrmRecipe.Create(Self);
  if f.ShowModal = mrOk then begin
    dmMain.os.Commit;
  end
  else begin
    dmMain.os.Rollback;
  end;
  f.Free;
end;

procedure TfrmMain.acMedicProduceExecute(Sender: TObject);
begin
  tbMedProduce.ImageIndex := 49;
  doShowMedProduceList;
  ToolBar1.Refresh;
end;

procedure TfrmMain.mmHelpContentClick(Sender: TObject);
begin
  try
    HtmlHelp(0, PChar('Medica.chm'), HH_DISPLAY_TOPIC, 0);
  except
    on EConvertError do
      ShowMessage('Справка не найдена');
  end;
end;

function TfrmMain.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
  Result := False;
  try
    // TODo Подумать насчет праметра  Command
    if Data = -1 then
      HtmlHelp(0, PChar('Medica.chm'), HH_DISPLAY_TOPIC, 0)
    else
      HtmlHelp(0, PChar('Medica.chm'), HH_HELP_CONTEXT, Data);
    CallHelp := False;
    Result := True;
  except
    on EConvertError do
      ShowMessage('Справка не найдена');
  end;
end;

procedure TfrmMain.acHelpContextExecute(Sender: TObject);
begin
  try
    HtmlHelp(0, PChar('Medica.chm'), HH_DISPLAY_TOPIC, 0);
  except
    on EConvertError do
      ShowMessage('Справка не найдена');
  end;
end;

procedure TfrmMain.acMOinGroupExecute(Sender: TObject);
begin
  TfrmMOinGroup.Create(Self);
end;

procedure TfrmMain.acMO_SelCurExecute(Sender: TObject);
begin
  with TfrmMOinGroup.Create(Self) do
    SelectMOInGroup();
end;

procedure TfrmMain.osMiDocsAfterLogOn(Sender: TOracleSession);
begin
   Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));

   //Sender.DBMS_Application_Info.Set_Module(Application.Title + ' - ' + Self.caption, Sender.Owner.Name);
   Sender.DBMS_Application_Info.Set_Module(ExtractFileName(Application.ExeName) + ' - ' + fdmMain.CurrentFileInfo(Application.ExeName),'');
end;

//procedure TfrmMain.ShowBalloonHint( aHintText : string; aHintHeader : string = 'ВНИМАНИЕ'; aForm : TCustomForm = nil);
//var
//  xy : TPoint;
//  HintDelay : Integer;
//begin
//  if aForm = nil then aForm := Self;
//  xy.x := 13;//aForm.Width  - 20;
//  xy.y := 0;//aForm.Height - 50;
//
//  HintDelay := (Length(aHintText) + Length(aHintHeader))*150;
//  if HintDelay < 5000 then HintDelay := 5000;
//
//  bhtMain.ActivateHintPos(aForm, xy, aHintHeader, aHintText, HintDelay);
//end;

procedure TfrmMain.SetProvisorState;
var
  s : string;
begin
  case aValue of
    1 :   FProvisorState := aValue;
  else
    FProvisorState := 0;
  end;
  s := IntToStr( FProvisorState );

// приход, инвентаризация
//  IniWriteString(iniFileName, 'Config', 'ShowPrih',          s);
  IniWriteString(iniFileName, 'Config', 'ShowMedicProduce',  s);
  IniWriteString(iniFileName, 'Config', 'ShowInventarizach', s);

//  acDPrih.Enabled := FProvisorState = 1;
//  acDPrih.Visible := FProvisorState = 1;

  acDInvList.Enabled := (FProvisorState = 1);
  acDInvList.Visible := (FProvisorState = 1);

// меню настройки
  IniWriteString(iniFileName, 'Config', 'ShowSetup', s);

  miSpr.Enabled := (FProvisorState = 1)or(dmMain.IsSotrAdmin);
  miSpr.Visible := (FProvisorState = 1)or(dmMain.IsSotrAdmin);

  acZayavka.Visible :=  (FProvisorState = 1)and(dmMain.ConfigParams.GetParamValue('FUNC_SHOW_ZAYAV', 0) = 1);

  acRecalcOst.Visible := ((FProvisorState = 1) and(dmMain.ConfigParams.GetParamValue('FUNC_USE_RIGHT_RECALC_OST', 0) = 0))
          or ((dmMain.ConfigParams.GetParamValue('FUNC_USE_RIGHT_RECALC_OST', 0) = 1) and dmMain.ConfigParams.GetParamValue('FUNC_RIGHT_RECALC_OST', False) );
  acClosedPeriods.Visible := (FProvisorState = 1);
end;

procedure TfrmMain.acSpisanieVidExecute(Sender: TObject);
begin
  DoShowSpisanieVid( VIDMOVE_SPISANIE );
end;

procedure TfrmMain.acSprOKDPExecute(Sender: TObject);
begin
  if not RestoreMDI_Window('SprOKDP') then
  begin
    SprOKDP := TSprOKDP.Create(Application);
    SprOKDP.actSelect.Visible := False;
    SprOKDP.actSelect.Enabled := False;
    SprOKDP.ToolButton1.Visible := False;

    SprOKDP.FormStyle := fsMDIChild;
  end;
end;

function ShellExecuteOpen(aExeName : string) : Boolean;
var
  FName : string;
begin
  FName := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + aExeName;
  if FileExists(FName) then
  begin
    ShellExecute( 0, PChar('open'), PChar(FName), nil, nil, SW_SHOWNORMAL );
    Result := True;
  end
  else
  begin
    Application.MessageBox(PChar('Не найден модуль '+aExeName+#13#10'Необходимо обновить модуль'), 'Ошибка', MB_OK+MB_ICONERROR);
    Result := False;
  end;
end;  

procedure TfrmMain.acReturnOsnovanieListExecute(Sender: TObject);
begin
  DoShowSpisanieVid( VIDMOVE_RETURN_POSTAV );
end;

procedure TfrmMain.MI_Reports_OnClick(Sender: TObject);
var
  Process : TProcess;
  mi : TMenuItem;
begin
  odsMenuReports.Filter := 'FK_APPID = '+IntToStr(TMenuItem(Sender).Tag);
  odsMenuReports.Filtered := True;

  if odsMenuReports.Eof  then Exit;
//  if AnsiLowerCase(odsMenuReports.FieldByName('FC_FNAME').AsString) = 'repsrokigodnosti.exe' then // для этого отчета передаем группу МО
//    Process := TProcess.Create(odsMenuReports.FieldByName('FC_FNAME').AsString, IntToStr(dmMain.pkgMedSes.GET_CUR_MOGROUP_BY_CUR_MO), True)
//  else
//    Process := TProcess.Create(odsMenuReports.FieldByName('FC_FNAME').AsString,'', True);
//  всем отчетам передаем AppSotrID
  Process := TProcess.Create(odsMenuReports.FieldByName('FC_FNAME').AsString, ParamStr(1)+ sDLLOCI, True);
  if Process.IsProcessCatched then
  begin
    {$IFNDEF OLD_AUTH}
    GetInputMapAppFromApp(Process.PID); // каждому отчету даем разрешение запускаться (в SMMain2.dll)
    {$ENDIF}
    FOutterReports.Add(Process); // помещаем процесс в список
  // создаем менюшку для открытого отчета
    mi := TMenuItem.Create( miWindows );
    mi.Caption := odsMenuReports.FieldByName('FC_NAME').AsString;
    mi.Tag     := Process.PID;
    mi.OnClick := MI_WindowsReports_OnClick;
    mi.Visible := True;
    mi.Name    := 'miOpenedReport'+IntToStr(Process.PID);

    miWindows.Add(mi);
  end
  else
    Process.Free;
//  ShellExecuteOpen( odsMenuReports.FieldByName('FC_FNAME').AsString );
  odsMenuReports.Filtered := False;
end;

procedure TfrmMain.MI_WindowsReports_OnClick(Sender: TObject);
var
  pr : TProcess;
begin
  pr := FOutterReports.FindProcessByPID( TMenuItem(Sender).Tag );
  if Assigned(pr) then Pr.DoActive; // Активизировать и вытащить на обозрение окна процесса
end;

procedure TfrmMain.DoShowReportMenu;
var
  mi : TMenuItem;
begin
  {$IFDEF SAKURA}
    odsMenuReports.SQL.Text := 'select                                                         '#13#10+
                               '  tappview.fk_id as FK_APPID,                                  '#13#10+
                               '  tappview.fc_name as fc_name,                                 '#13#10+
                               '  tappview.fc_opis as FC_FNAME                                 '#13#10+
                               'from ASU.tappview, ASU.trepapp, ASU.tappview m, ASU.tsotrrep   '#13#10+
                               'where tappview.fk_id=trepapp.FK_APPREPID                       '#13#10+
                               'and trepapp.fk_appid=m.fk_id                                   '#13#10+
                               'and m.FC_OPIS=''medica.exe''                                   '#13#10+
                               'and trepapp.fk_apprepid = fk_repid                             '#13#10+
                               'and tsotrrep.fk_sotrid=:APPSOTR                                '#13#10;
  {$ENDIF}
  // динамически создаем меню для exe-отчетов
  try
    odsMenuReports.SetVariable('APPSOTR', StrToInt(ParamStr(1)));
  except
    Exit;
  end;


  odsMenuReports.Open;

  odsMenuReports.First;
  while not odsMenuReports.Eof do
  begin
    if FileExists(ExtractFilePath(Application.ExeName) + odsMenuReports.FieldByName('FC_FNAME').AsString) then
    begin
      mi := TMenuItem.Create( miReports );
      mi.Caption := odsMenuReports.FieldByName('FC_NAME').AsString;
      mi.Tag     := odsMenuReports.FieldByName('FK_APPID').AsInteger;
      mi.OnClick := MI_Reports_OnClick;
      mi.Visible := True;

      miReports.Add(mi); // добавляем в раздел отчетов
    end;      
    odsMenuReports.Next;
  end;
  miReports.Visible := odsMenuReports.RecordCount > 0;
end;

procedure TfrmMain.miWindowsClick(Sender: TObject);
var
  i : Integer;
begin
  FOutterReports.DeleteInvalidProcesses; // нах все закрытые отчеты
  i := miWindows.IndexOf(miWindowsRepSeparator)+1; // начинаем поиск после разделительной черты
  while (i < miWindows.Count)and( Copy(miWindows.Items[i].Name, 1, 14) = 'miOpenedReport') do
  begin
    if FOutterReports.FindProcessByPID( miWindows.Items[i].Tag ) = nil then
      miWindows.Delete(i)
    else
      Inc( i );
  end;  
end;

procedure TfrmMain.tbuReportsClick(Sender: TObject);
begin
// при нажатиин на кнопку вываливаем меню
  tbuReports.CheckMenuDropdown;

end;

function CheckOnMaximize(var aForm : TForm) : boolean;
var
  i, n : Integer;
begin
  Result := False;
  n := Application.MainForm.MDIChildCount;
  i := 0;
  while (i < n) do
  begin
    if (Application.MainForm.MDIChildren[i].Name <> aForm.Name)and(Application.MainForm.MDIChildren[i].WindowState = wsMaximized) then Break;
    Inc( i );
  end;

  if (i < n) then
  begin
    aForm.WindowState := wsMaximized;
    Result := True;
  end;
end;

procedure TfrmMain.acProdCertExecute(Sender: TObject);
begin
  if not RestoreMDI_Window('ProdCertDlg') then
  begin
    ProdCertDlg := TProdCertDlg.Create(Application);
    ProdCertDlg.actSelect.Visible := False;
    ProdCertDlg.actSelect.Enabled := False;
    ProdCertDlg.ToolButton1.Visible := False;

    ProdCertDlg.FormStyle := fsMDIChild;
  end;
end;

procedure TfrmMain.acProfilExecute(Sender: TObject);
begin
  DoShowProfil;
end;

function TfrmMain.RestoreMDI_Window(aFormName : string): Boolean;
var
  i : Integer;
  WindHandle : HWND;
begin
  i := 0;
  while (i < frmMain.MDIChildCount)and(frmMain.MDIChildren[i].Name <> aFormName) do
    Inc( i );

  if (i < frmMain.MDIChildCount) then // проверка на присутствие окна - если оно уже было создано, просто делаем его активным
  begin
    WindHandle := frmMain.MDIChildren[i].Handle;
    if frmMain.MDIChildren[i].WindowState = wsMinimized then ShowWindow(WindHandle, SW_RESTORE);
    BringWindowToTop( WindHandle );
    Result := True;
  end
  else
    Result := False;
end;

procedure TfrmMain.SetIsMaximizeChildWindowsState(aValue: boolean);
//var
//  i : Integer;
begin
//  FIsMaximizeChildWindowsState := aValue;
//  i := 0;
//  while (i < frmMain.MDIChildCount) do
//  begin
//    case FIsMaximizeChildWindowsState of
//      True : if frmMain.MDIChildren[i].WindowState = wsNormal then frmMain.MDIChildren[i].WindowState := wsMaximized;
//      False: if frmMain.MDIChildren[i].WindowState = wsMaximized then frmMain.MDIChildren[i].WindowState := wsNormal;
//    end;
//
//    Inc( i );
//  end;
end;

procedure TfrmMain.acInterfaceExecute(Sender: TObject);
begin
  DoShowInterface;
end;

procedure TfrmMain.EnableHint(AEnable:Boolean);
var
  I,J:Integer;
begin
  for i:=0  to MDIChildCount-1 do
  begin
     for j:=0 to MDIChildren[i].ComponentCount -1 do
     begin
       if MDIChildren[i].Components[j] is TcxGridDBTableView then
       begin
         TcxGridDBTableView(MDIChildren[i].Components[j]).OptionsBehavior.CellHints := AEnable;
         TcxGridDBTableView(MDIChildren[i].Components[j]).OptionsBehavior.ColumnHeaderHints  := AEnable;
       end;

       if MDIChildren[i].Components[j] is TcxGridTableView then
       begin
         TcxGridTableView(MDIChildren[i].Components[j]).OptionsBehavior.CellHints := AEnable;
         TcxGridTableView(MDIChildren[i].Components[j]).OptionsBehavior.ColumnHeaderHints  := AEnable;
       end;

       if MDIChildren[i].Components[j] is TcxDBTreeList then
       begin
         TcxDBTreeList(MDIChildren[i].Components[j]).OptionsBehavior.CellHints := AEnable;
       end;
       if MDIChildren[i].Components[j] is TcxTreeList then
       begin
         TcxTreeList(MDIChildren[i].Components[j]).OptionsBehavior.CellHints := AEnable;
       end;
     end;
  end;
end;

procedure TfrmMain.ApplicationEvents1Activate(Sender: TObject);
begin
  EnableHint(True);
end;

procedure TfrmMain.ApplicationEvents1Deactivate(Sender: TObject);
begin
  EnableHint(False);
end;

procedure TfrmMain.acHITEC_VidHelpExecute(Sender: TObject);
begin
  DoShowSpisanieVid( VIDMOVE_SPISANIE_HITEC );
end;

procedure TfrmMain.acSkladExecute(Sender: TObject);
begin
  DoShowSklad;
end;

procedure TfrmMain.acVidPostExecute(Sender: TObject);
begin
  DoShowVidPost;
end;

procedure TfrmMain.acCROSS_TABLE_CHECKExecute(
  Sender: TObject);
begin
  DoShowCROSS_TABLE_CHECK;
end;

procedure TfrmMain.acFinSourceExecute(Sender: TObject);
begin
  DoShowFinSource;
end;

procedure TfrmMain.acGROUP_LFExecute(Sender: TObject);
begin
  DoShowGROUP_LF;
end;

procedure TfrmMain.acPayCondExecute(Sender: TObject);
begin
  DoShowPayCond;
end;

end.

