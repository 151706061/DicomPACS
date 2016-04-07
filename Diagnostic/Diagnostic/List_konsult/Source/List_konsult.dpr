program List_konsult;
// окб (новая авторизация) ЗотинАВ - 105559, АлиеваОЭ - 110013 , Амеличкина НВ - 153324
// окб амеличкина 116505, нигматулина 105571
// Сургут Кардио Агапов Д В 134302
// Екатеринбург онко ВахонинаЛВ 105438
// Оренбург Руссу ТВ 138171
// Междуреченск Аксенова ИЛ 160171
// ЕМНЦ Ахатова ОВ 178792
// Междуреченск ХодакНФ 159770
uses
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  Forms,
  OracleMonitor,
  Oracle,
  uDestroyProc,
  multinst,
  uDBTableUtils,
  dialogs,
  fMain in 'fMain.pas' {frmMain},
  fSearch in 'fSearch.pas' {frmSearch},
  fWait in '..\..\..\uCommon_Kolya\fWait.pas' {FrmWait},
  fPacInfoKonsult in 'fPacInfoKonsult.pas' {frmPacInfoKonsult},
  fDolgTalon in 'fDolgTalon.pas' {frmDolgTalon},
  fArchive in 'fArchive.pas' {frmArchive},
  fOtmena in '..\..\..\uCommon_Kolya\fOtmena.pas' {frmOtmena},
  fSetParam in 'fSetParam.pas' {frmSetParam},
  uPeriod in '..\..\..\uCommon_Kolya\uPeriod.pas' {frmParamDate},
  fNeyav in 'fNeyav.pas' {frmNeyav},
  fMS in 'fMS.pas' {frmMS},
  fSetMS in 'fSetMS.pas' {frmSetMS},
  fAddEditAllergy in 'fAddEditAllergy.pas' {frmAddEditAllergy},
  fCheckConfidencial in '..\..\..\pr__IBRazdel\SOURCE\fCheckConfidencial.pas' {fCheckConfidencial},
  uOnkoUchetParam in 'uOnkoUchetParam.pas' {frmOnkoUchetParam};

{$R *.res}

var
  IS_KILL_BAD_PROCESS: Boolean = False;
  IS_RUN_ONE_COPY_APP1: Boolean = False;

procedure InitBoolVar;
  var
    os: TOracleSession;
  begin
    os := TOracleSession.Create(nil);

    try
      os.LogonDatabase := 'ASU';

      {$IFDEF USE_NEW_AUTH}
        GetSession(os, 'ASU');
      {$ELSE}
        exit;
      {$ENDIF}

      IS_KILL_BAD_PROCESS := uDBTableUtils.TDBUtils.GetFunctionDef('IS_KILL_BAD_PROCESS', os, 0) = 1;
      IS_RUN_ONE_COPY_APP1 := uDBTableUtils.TDBUtils.GetFunctionDef('IS_RUN_ONE_COPY_APP', os, 0) = 1;
    finally
      os.free;
    end;
  end;

begin
  InitBoolVar;

  if IS_KILL_BAD_PROCESS
  then DestroyBadProcess('TfrmMain');

  if IS_RUN_ONE_COPY_APP1
  then begin
    if not multinst.InitInstance
    then begin
      ShowMessage('Возможен запуск только одной версии программы!');
      Application.Terminate;
      exit;
    end;
  end;

  if Application.Terminated then
    Exit;
  if not GetCheckConnect() then
    Exit;
  Application.Initialize;
  Application.Title := 'Журнал консультаций';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmOnkoUchetParam, frmOnkoUchetParam);
  frmMain.DoShowForm;
  Application.Run;
end.
