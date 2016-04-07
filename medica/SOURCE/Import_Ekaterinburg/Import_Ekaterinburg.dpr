program Import_Ekaterinburg;

uses
  Forms,
  fMain in 'fMain.pas' {Form1},
  uTLINK_IMPNAKL in '..\src\uTLINK_IMPNAKL.pas',
  fdmTheirTables in 'fdmTheirTables.pas' {dmTheirTables: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmTheirTables, dmTheirTables);
  Application.Run;
end.
