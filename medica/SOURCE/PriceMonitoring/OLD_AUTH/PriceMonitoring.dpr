program PriceMonitoring;



uses
  Forms,
  fMain in '..\fMain.pas' {frmGetPeriod};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '������� �������� ��� ������� "���������� ���"';
  Application.HelpFile := '';
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  Application.Run;
end.
