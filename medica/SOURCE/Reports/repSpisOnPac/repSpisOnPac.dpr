program repSpisOnPac;



uses
  Forms,
  fgetperiod in 'fgetperiod.pas' {frmGetPeriod},
  HtmlHlp in 'HtmlHlp.pas',
  uGlobalConst in '..\..\..\..\..\uCommon\uGlobalConst.pas',
  fReportInputActSpis in 'fReportInputActSpis.pas' {fmReportInputActSpis};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Медикаменты, списанные на пациента';
  Application.HelpFile := 'StMedsestra.chm';
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  //  Application.CreateForm(TdmPrintSelect, dmPrintSelect);
  Application.Run;
end.
