program PriceMonitoring;



uses
  Forms, //Windows, SysUtils,
  fMain in 'fMain.pas' {frmGetPeriod};

{$R *.RES}
var
 i:Integer;

begin
//  for i := 0 to ParamCount do
//    OutputDebugString ( PAnsiChar( 'Параметр '+IntToStr(i)+' = '+ParamStr(i) ) );
    
  Application.Initialize;
  Application.Title := 'Экспорт остатков для проекта "Мониторинг цен"';
  Application.HelpFile := '';
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  Application.Run;
end.
