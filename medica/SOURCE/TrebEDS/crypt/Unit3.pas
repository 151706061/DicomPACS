unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wcrypt2, StdCtrls;

type
 algInfo = record
   algID: ALG_ID;
   dwBits: DWORD;
   dwNameLen: DWORD;
   szName: array[0..100] of char;
  end;

  TForm3 = class(TForm)
    Button1: TButton;
    FileMemo: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

{вспомогательная функция, преобразующая тип провайдера в строку}
function ProvTypeToStr(provType: DWORD): string;
begin
  case provType of
    PROV_RSA_FULL: ProvTypeToStr := 'RSA full provider';
    PROV_RSA_SIG: ProvTypeToStr := 'RSA signature provider';
    PROV_DSS: ProvTypeToStr := 'DSS provider';
    PROV_DSS_DH: ProvTypeToStr := 'DSS and Diffie-Hellman provider';
    PROV_FORTEZZA: ProvTypeToStr := 'Fortezza provider';
    PROV_MS_EXCHANGE: ProvTypeToStr := 'MS Exchange provider';
    PROV_RSA_SCHANNEL: ProvTypeToStr := 'RSA secure channel provider';
    PROV_SSL: ProvTypeToStr := 'SSL provider';
    else ProvTypeToStr := 'Unknown provider';
  end;
end;

{вспомогательная функция, преобразующая тип реализации в строку}
function ImpTypeToStr(it: DWORD): string;
begin
  case it of
    CRYPT_IMPL_HARDWARE: ImpTypeToStr := 'аппаратный';
    CRYPT_IMPL_SOFTWARE: ImpTypeToStr := 'программный';
    CRYPT_IMPL_MIXED: ImpTypeToStr := 'смешанный';
    CRYPT_IMPL_UNKNOWN: ImpTypeToStr := 'неизвестен';
    else ImpTypeToStr := 'неверное значение';
  end;
end;

{процедура вывода информации о криптопровайдерах}
procedure TForm3.Button1Click(Sender: TObject);
var i: DWORD;
  dwProvType, cbName, DataLen: DWORD;
  provName: array[0..200] of char;
  vers: array[0..3] of byte;
  impType: DWORD;
  ai: algInfo;
  err: string;
  hProv       :HCRYPTPROV;
begin
  i:= 0;
  FileMemo.Clear;
  while (CryptEnumProviders(i, nil, 0, @dwProvType, nil, @cbName)) do {проверяем наличие еще одного}
  begin
    if CryptEnumProviders(i, nil, 0,	@dwProvType, @provName, @cbName) then {получаем имя CSP}
    begin
      FileMemo.Lines.Add('Криптопровайдер: '+provName);
      FileMemo.Lines.Add('Тип: '+IntToStr(dwProvType)+' - '+
      ProvTypeToStr(dwProvType));
      if not CryptAcquireContext(@hProv, nil, provName, dwProvType, CRYPT_VERIFYCONTEXT) then
      begin
      {обработка ошибок}
      end;

      DataLen := 4;
      if not CryptGetProvParam(hProv, PP_VERSION, (@vers), @DataLen, 0) then
      begin
      {обработка ошибок}
      end;

      FileMemo.Lines.Add(#13#10'Версия: ' + Chr(vers[1]+48) + '.' + Chr(vers[0]+48));
//      FileMemo.Lines.Add(#13#10'Версия: ' + vers);
      if not CryptGetProvParam(hProv, PP_IMPTYPE, @impType, @DataLen, 0)then
      begin
      {обработка ошибок}
      end;
      FileMemo.Lines.Add('Тип реализации: '+ImpTypeToStr(impType));
      FileMemo.Lines.Add('Поддерживает алгоритмы:');

      DataLen := sizeof(ai);
      if not CryptGetProvParam(hProv, PP_ENUMALGS, @ai, @DataLen, CRYPT_FIRST)
      then
      begin
      {обработка ошибок}
      end;

      with ai do
        FileMemo.Lines.Add(szName+#9+'длина ключа - '+IntToStr(dwBits)+ ' бит' +#9+ 'ID: '+IntToStr(AlgID));

      DataLen := sizeof(ai);
      while CryptGetProvParam(hProv, PP_ENUMALGS, @ai, @DataLen, 0) do
      begin
        with ai do FileMemo.Lines.Add(szName+#9+'длина ключа - '+IntToStr(dwBits)+' бит'+#9+'ID: '+IntToStr(AlgID));
        DataLen := sizeof(ai);
      end;
      FileMemo.Lines.Add('');
      CryptReleaseContext(hProv, 0);
    end;
    inc(i);
  end;
end;

end.
