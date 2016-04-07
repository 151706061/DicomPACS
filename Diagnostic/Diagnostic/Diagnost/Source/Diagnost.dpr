program Diagnost;

// Кардио Агапов ДВ 420621 -1
// Междуреченск Колесникова ЕВ 159785 88896887

uses
//  ShareMem,
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  Forms,
  SysUtils,
  Dialogs,
  OracleMonitor,
  fArchive in 'fArchive.pas' {frmArchive},
  fImages in 'fImages.pas' {frmImages},
  fOtmena in '..\..\..\uCommon_Kolya\fOtmena.pas' {frmOtmena},
  fPreview in '..\..\..\uCommon_Kolya\fPreview.pas' {frmPreview},
  fPacInfoDiagnost in '..\..\..\uCommon_Kolya\fPacInfoDiagnost.pas' {frmPacInfoDiagnost},
  fMain in 'fMain.pas' {frmMain},
  fSearchPeople in 'fSearchPeople.pas' {frmSearchPeople};

{$R *.res}                            

begin
  if Application.Terminated then
    Exit;
  if not GetCheckConnect() then
    Exit;
  Application.Initialize;
  Application.Title := 'Работа с протоколами';
  Application.CreateForm(TfrmMain, frmMain);
  if paramstr(2) = '' then
    begin
      frmMain.DoShowForm(StrToInt(paramstr(1)), 0);
      Application.Run;
      exit;
    end;

  frmMain.DoShowForm(StrToInt(paramstr(1)), //специализация login.tappsotr.fk_id
                     StrToInt(paramstr(2))); //пациент
  Application.Run;
end.
