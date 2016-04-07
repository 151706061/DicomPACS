program TrebEDS;



uses
  Forms,
  uKeysInfoList in '..\..\..\..\DigitalSignature\parts\Collections\uKeysInfoList.pas',
  uDigitalSignature in '..\..\..\..\DigitalSignature\parts\DigKey\uDigitalSignature.pas',
  ufrmDigKey in '..\..\..\..\DigitalSignature\parts\DigKey\ufrmDigKey.pas' {frmDigKey},
  uCryptMng in '..\..\..\..\DigitalSignature\parts\uCryptMng.pas',
  uCertificateKey in '..\..\..\..\DigitalSignature\parts\XMLKeysInfo\uCertificateKey.pas',
  uEmployeeInfo in '..\..\..\..\DigitalSignature\parts\XMLKeysInfo\uEmployeeInfo.pas',
  uEmployeeKeysInfo in '..\..\..\..\DigitalSignature\parts\XMLKeysInfo\uEmployeeKeysInfo.pas',
  uKeyInfo in '..\..\..\..\DigitalSignature\parts\XMLKeysInfo\uKeyInfo.pas',
  uKeysInfoConst in '..\..\..\..\DigitalSignature\parts\XMLKeysInfo\uKeysInfoConst.pas',
  uPrivateKeyInfo in '..\..\..\..\DigitalSignature\parts\XMLKeysInfo\uPrivateKeyInfo.pas',
  uPublicKeyInfo in '..\..\..\..\DigitalSignature\parts\XMLKeysInfo\uPublicKeyInfo.pas',
  uUserKeyInfo in '..\..\..\..\DigitalSignature\parts\XMLKeysInfo\uUserKeyInfo.pas',  
  fMain in 'fMain.pas' {frmGetPeriod};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Модуль ЭЦП требований';
  Application.HelpFile := '';
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  Application.Run;
end.
