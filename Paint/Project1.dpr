program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  AbPr in 'AbPr.pas' {Form2},
  proc in 'proc.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
