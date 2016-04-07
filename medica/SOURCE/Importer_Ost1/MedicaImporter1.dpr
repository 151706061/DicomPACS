program MedicaImporter1;

uses
  Forms,
  fmGrid in 'fmGrid.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Импорт остатков для ПО "Аптека"';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
