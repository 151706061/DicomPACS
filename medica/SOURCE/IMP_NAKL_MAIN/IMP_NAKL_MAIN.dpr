program IMP_NAKL_MAIN;



uses
  Forms,
  fImportNakl in 'fImportNakl.pas' {fmImportNakl},
  fmKontrakt_Select in 'fmKontrakt_Select.pas' {fm_Kontrakt_Select},
  dmImport in 'dmImport.pas' {dm_Import: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Импорт накладных';
  Application.HelpFile := '';
  Application.CreateForm(Tdm_Import, dm_Import);
  Application.CreateForm(TfmImportNakl, fmImportNakl);
  Application.Run;
end.
