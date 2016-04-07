{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit CnsCRtl;
{$I dicompack.inc}
interface

uses
  SysUtils, classes, math { for IntToStr, PByteArray  }
  ,Windows; { for DWord, MessageBox }

const
  photometricInterpretationMONOCHROME1 = 0;
  photometricInterpretationMONOCHROME2 = 1;
  photometricInterpretationRGB = 2;
  photometricInterpretationARGB = 3;
  photometricInterpretationYBR_FULL_422 = 4;
  photometricInterpretationYBR_PARTIAL_422 = 5;
  photometricInterpretationYBR_FULL = 6;
  photometricInterpretationCMYK = 7;

  compressionSyntaxJPEGBaselineTransferSyntax = 0;
  compressionSyntaxJPEGExtendedTransferSyntax = 1;
  compressionSyntaxJPEGLosslessTransferSyntax = 2;

type
  PStream = ^TMemoryStream;

  {$WARNINGS OFF}
  //////////////for jpeg2000////////////////////////////////
{.$IFNDEF BCB}

// void qsort(void *base, size_t nelem, size_t width, int (_USERENTRY *fcmp)(const void *, const void *));
procedure _qsort(base:Pointer;  nelem:Integer;  width:Integer;
  fcmp:Pointer); cdecl;
procedure _sort(base:Pointer;  nelem:Integer;  width:Integer;
  fcmp:Pointer); cdecl;
//int atexit(void (_USERENTRY * func)(void));
function _atexit(func:Pointer):Integer;cdecl;

function _ceil(x: double): double; cdecl;
// void qsort(void *base, size_t nelem, size_t width, int (_USERENTRY *fcmp)(const void *, const void *));
function _isalpha(c: integer): Integer; cdecl;
//int isdigit(int c);

function _isdigit(c: integer): Integer; cdecl;
//char *strrchr(const char *s, int c);

function _strrchr(const s: PAnsiChar; c: Integer): PAnsiChar; cdecl;
//char *strchr(const char *s, int c);

function _strcmp: Boolean;
function _strchr(s: PAnsiChar; c: Integer): PAnsiChar; cdecl;
function _isspace(c: Integer): Integer; cdecl;
//int atexit(void (_USERENTRY * func)(void));
//function _atexit(func: Pointer): Integer; cdecl;
//long atol(const char *s);

function _atol(s: PAnsiChar): longint; cdecl;
//double atof(const char *s);

function _atof(s: PAnsiChar): Double; cdecl;
//int isprint(int c);
function _isprint(c: integer): integer; cdecl;
//void *memmove(void *dest, const void *src, size_t n);
function _memmove(dest: Pointer; src: Pointer; n: Integer): Pointer; cdecl;
//char *strdup(const char *s);
function _strdup(s: PAnsiChar): PAnsiChar; cdecl;
//char *tmpnam(char *s);
function _tmpnam(s: PAnsiChar): PAnsiChar; cdecl;

procedure __llmul; cdecl;
procedure __lldiv; cdecl;
procedure __lludiv; cdecl;
procedure __llmod; cdecl;
procedure __llmulo; cdecl;
procedure __lldivo; cdecl;
procedure __llmodo; cdecl;
procedure __llumod; cdecl;
procedure __llshl; cdecl;
procedure __llushr; cdecl;


procedure __ftol; cdecl;


function __max_dble: int64; cdecl;
procedure _abort; cdecl;
procedure _setmode; cdecl;
procedure _fputc; cdecl;
procedure _fseek; cdecl;

function _unlink(filename: PAnsiChar): Integer; cdecl;
function _vsprintf(buffer: PAnsiChar; const format: PAnsiChar): Integer; cdecl;
function _fprintf(buffer: PAnsiChar; const format: PAnsiChar): Integer; cdecl;
function _vfprintf(buffer: PAnsiChar; const format: PAnsiChar): Integer; cdecl; //
function _fopen(const path: PAnsiChar;  const format: PAnsiChar): Integer; cdecl;

//////////////////////////////////////////////////

function _getLength(jpegdata: PStream): Integer; cdecl;

function _getBytes(jpegdata: PStream; buffer: PAnsiChar;
  currentPosition, length: Integer): Integer; cdecl;

function _appendBytes(jpegdata: PStream; buffer: PAnsiChar;
  length: Integer): Integer; cdecl;

function _malloc(Size: Integer): Pointer; cdecl;
procedure _free(Ptr: Pointer); cdecl;
function _calloc(NItems: Integer; Size: Integer): Pointer; cdecl;
function _realloc(block: Pointer; Size: Integer): Pointer; cdecl;

function _strcat(Dest, Source: PAnsiChar): PAnsiChar; cdecl;
function _strlen(P1: PAnsiChar): Integer; cdecl;
function _strcpy(Dest, Source: PAnsiChar): PAnsiChar; cdecl;
function _strncmp(const s1: PAnsiChar;
  const s2: PAnsiChar; maxlen: Integer): Integer; cdecl;
function _strncpy(dest: PAnsiChar;
  const src: PAnsiChar; maxlen: Integer): PAnsiChar; cdecl;
function _strtok(const s1: PAnsiChar; const s2: PAnsiChar): PAnsiChar; cdecl;


function _tolower(ch: integer): integer; cdecl;
//function _tolower(ch: Integer): Integer; cdecl;

procedure _memset(P: Pointer; Value: Integer; Count: Cardinal); cdecl;

function _memcpy(Dest, Source: Pointer; Len: Integer): Pointer; cdecl;
function _memcmp(const s1: PByteArray;
  const s2: PByteArray;
  const Size: Integer): Integer; cdecl;

function _ltoa(Value: LongInt; Str: PAnsiChar; Radix: Integer): PAnsiChar; cdecl;
function _exp(value: double): double; cdecl;
function _floor(value: double): double; cdecl;
function _log(value: double): double; cdecl;
function _log10(value: double): double; cdecl;
function _cos(value: double): double; cdecl;
function _sqrt(value: double): double; cdecl;
function _sqr(value: double): double; cdecl;
function _fabs(value: double): double; cdecl;
function _pow(x: double; y: double): double; cdecl;

procedure __turboFloat; cdecl;
procedure __streams; cdecl;

{ C++ Builder 5 requires this function }
function __ltolower(ch: integer): integer; cdecl;

{--------------------------------------------------------------------------}

//function _fprintf(buffer: PAnsiChar; const format: PAnsiChar): Integer; cdecl;
function _sprintf(buffer: PAnsiChar; const format: PAnsiChar): Integer; cdecl;
function _wsprintfA(buffer: PAnsiChar; const format: PAnsiChar): Integer; cdecl;
{ printf simply shows a message box for format }
function _printf(const format: {$IFDEF LEVEL12}PWideChar{$ELSE}PChar{$ENDIF}): Integer; cdecl;
function _sprintf1(buffer: PAnsiChar; const format: PAnsiChar; const value: PAnsiChar): Integer; cdecl;
function _sprintf2(buffer: PAnsiChar; const aformat: PAnsiChar; i1, i2, i3, i4, i5, i6, i7, i8: Integer):
  Integer; cdecl;

procedure _exit(status: integer); cdecl;
procedure __assert(test: integer); cdecl;

{ not really a C function but added to replace _ftol which is a mysterious
  function generated by the C compiler with implicit float to long
  type casts ie, longValue = float(floatValue). The C source code must
  be adapted to replace all typecasts with round(). }
function _round(value: double): Longint; cdecl;

function _setjmp(jmpb: Byte): Integer; cdecl;
procedure _longjmp(jmpb: Byte; RetVal: Integer); cdecl;

{ standard I/O with TStream ! A FILE* type in C is passed a
  Pointer(Stream). }

function _fread(Ptr: Pointer;
  Size: Cardinal;
  Count: Cardinal;
  Stream: Pointer): Cardinal; cdecl;

function _fwrite(Ptr: Pointer;
  Size: Cardinal;
  Count: Cardinal;
  Stream: Pointer): Cardinal; cdecl;

function _fflush(Stream: Pointer): Integer; cdecl;

function _ferror(Stream: Pointer): Integer; cdecl;

(*
function __fgetc( Stream : Pointer ) : Integer; cdecl;

function __fputc( C      : Integer;
                  Stream : Pointer ) : Integer; cdecl;
*)

function _fclose(Stream: Pointer): Integer; cdecl;

{ fdopen is passed a TStream typecasted to an integer, and simply
  returns the TStream as a pointer. }
function _fdopen(handle: Integer; mode: PAnsiChar): Pointer; cdecl;

{ file access using C io functions. handle is a TStream casted to an
  integer }
function _open(const path: PAnsiChar; access: Integer): Integer; cdecl;
function _close(handle: Integer): Integer; cdecl;
function _lseek(handle: Integer; offset: LongInt; fromwhere: Integer): LongInt; cdecl;
function _read(handle: Integer; buf: Pointer; Len: Cardinal): Integer; cdecl;
function _write(handle: Integer; buf: Pointer; Len: Cardinal): Integer; cdecl;

procedure _RaiseDelphiException(Msg: PAnsiChar); cdecl;

function _perror(s: PAnsiChar): longint; cdecl;

{ for debugging }
procedure _ShowIntValue(Msg: PAnsiChar;
  Value: Integer); cdecl;
{.$ENDIF}
implementation

uses
  Dialogs; { for ShowMessage }
//    CnsMisc;   { for AreFlagsSet }
{.$IFNDEF BCB}
{--------------------------------------------------------------------------}

procedure _exit(status: integer);
begin
  raise Exception.Create('C RTL exit called(May be a jpeg decompress/compress error)');
end;

{--------------------------------------------------------------------------}

function _malloc(Size: Integer): Pointer;
begin
  GetMem(Result, Size);
end;

{--------------------------------------------------------------------------}

function _calloc(NItems: Integer; Size: Integer): Pointer;
var
  Total: LongInt;
begin
  if Size = 0 then
    Result := nil
  else
  begin
    Total := NItems * Size;
    GetMem(Result, Total);
    FillChar(Result^, Total, 0);
  end;
end;

{--------------------------------------------------------------------------}

function _realloc(block: Pointer; Size: Integer): Pointer;
begin
  if Size = 0 then
  begin
    FreeMem(Block);
    Result := nil;
  end
  else
  begin
    Result := block;
    ReallocMem(Result, Size);
  end;
end;

{--------------------------------------------------------------------------}

procedure _free(Ptr: Pointer);
begin
  FreeMem(Ptr);
end;

{--------------------------------------------------------------------------}

function _strcat(Dest, Source: PAnsiChar): PAnsiChar;
begin
  Result := SysUtils.strcat(Dest, Source);
end;

{--------------------------------------------------------------------------}

function _strlen(P1: PAnsiChar): Integer;
begin
  Result := SysUtils.StrLen(P1);
end;

{--------------------------------------------------------------------------}

function _memcpy(Dest, Source: Pointer; Len: Integer): Pointer;
begin
  Move(Source^, Dest^, Len);
  Result := Dest;
end;

{--------------------------------------------------------------------------}

function _memcmp(const s1: PByteArray;
  const s2: PByteArray;
  const Size: Integer): Integer;
var
  Index: Integer;
begin
  Result := 0;

  for Index := 0 to (Size - 1) do
  begin
    if s1^[Index] < s2^[Index] then
    begin
      Result := -1;
      Exit;
    end;

    if s1^[Index] > s2^[Index] then
    begin
      Result := 1;
      Exit;
    end;
  end;
end;

{--------------------------------------------------------------------------}

procedure _memset(P: Pointer; Value: Integer; Count: Cardinal);
begin
  FillChar(P^, Count, Value);
end;

{--------------------------------------------------------------------------}

function _strcpy(Dest, Source: PAnsiChar): PAnsiChar;
begin
  Result := StrCopy(Dest, Source);
end;

{--------------------------------------------------------------------------}

function _strncmp(const s1: PAnsiChar;
  const s2: PAnsiChar; maxlen: Integer): Integer;
begin
  Result := StrLComp(S1, S2, MaxLen);
end;

{--------------------------------------------------------------------------}

function _strncpy(dest: PAnsiChar;
  const src: PAnsiChar; maxlen: Integer): PAnsiChar;
begin
  Result := StrLCopy(Dest, Src, MaxLen);
end;

{ Pascal implementation of strtok.

Newsgroups: comp.lang.pascal.delphi.misc
Subject: Re: String Tokenizer for Delphi...
From: Dave Cameron <davec@mstone.demon.co.uk>
Date: Tue, 29 Aug 95 09:35:58 GMT

 Separate tokens in NULL-terminated ANSI string
 This is an untested version of the 'C' 'StrTok' function for the
 Windows ANSI character set (should work with 2-byte character codes)
}

{ strtok may be affected by the previous call to strtok when s1 is nil.
  This is why a file level variable is used. }
var
  AnsiTokPtr: PAnsiChar;

function _strtok(const s1: PAnsiChar; const s2: PAnsiChar): PAnsiChar;

var
  TokStart: PAnsiChar;
  P: PAnsiChar;

  function IsDelim(C: ansichar): Bool;
  var
    D: PAnsiChar;
    res: Bool;
  begin
    D := s2;
    res := FALSE;
    repeat
      if (C = D^) then
        res := TRUE;
      D := AnsiNext(D);
    until ((D^ = Char(0)) or res);

    IsDelim := res;
  end;

begin
  if (s1 <> nil) then
    AnsiTokPtr := s1;

  { Initialise running pointer }
  P := AnsiTokPtr;

  { Scan for start of token }
  while (IsDelim(P^)) do
    P := AnsiNext(P);
  if (P^ = Char(0)) then
    TokStart := nil
  else
    TokStart := P;

  { Scan for end of token }
  while ((P^ <> Char(0)) and not IsDelim(P^)) do
    P := AnsiNext(P);

  { Update the token string pointer and terminate the token string }
  AnsiTokPtr := AnsiNext(P);
  P^ := #0;

  { Return pointer to token }
  _strtok := TokStart;
end;

{--------------------------------------------------------------------------}

function _tolower(ch: Integer): Integer;
var
  Str: string[1];
begin
  Str := Lowercase(Char(ch));
  Result := Integer(Str[1]);
end;

{--------------------------------------------------------------------------}

function _sprintf(buffer: PAnsiChar; const format: PAnsiChar): Integer;
begin
  { in C, this function has a variable number of parameters, which are
    not accessible in pascal }
  StrCopy(buffer, format);
  Result := StrLen(format);
end;

function _sprintf1(buffer: PAnsiChar; const format: PAnsiChar; const value: PAnsiChar): Integer;
begin
  { in C, this function has a variable number of parameters, which are
    not accessible in pascal }
  StrCopy(buffer, format);
  StrCat(buffer, value);
  Result := StrLen(format) + StrLen(value);
end;

function _sprintf2(buffer: PAnsiChar; const aformat: PAnsiChar; i1, i2, i3, i4, i5, i6, i7, i8: Integer):
  Integer;
var
  str1: string;
begin
  { in C, this function has a variable number of parameters, which are
    not accessible in pascal }
  str1 := Format(aformat, [i1, i2, i3, i4, i5, i6, i7, i8]);
  StrCopy(buffer, PAnsiChar(str1));
  Result := Length(str1);
end;

{--------------------------------------------------------------------------}

function _wsprintfA(buffer: PAnsiChar; const format: PAnsiChar): Integer;
begin
  { in C, this function has a variable number of parameters, which are
    not accessible in pascal }
  Result := _sprintf(buffer, format);
end;

{--------------------------------------------------------------------------}


function _printf(const format: {$IFDEF LEVEL12}PWideChar{$ELSE}PChar{$ENDIF}): Integer;
begin
  Windows.MessageBox(0, format, nil, MB_OK);
  Result := StrLen(format);
end;
{--------------------------------------------------------------------------}

procedure __turboFloat;
begin
  { I'm really not sure what this function does but the C obj files make a
    call to it. It does not seem to have any effect. From the BC3.1 RTL:

  Description   The functions described above are essentially used by scanf
                functions family. As for  _realcvt, these functions are not
                called  directly, but  via a  pointer to  function. This is
                done  in  order  to  include  the  real  conversion only if
                needed.

                Each  time the  compiler needs  to build  a reference  to a
                double or  float value, it generates  an external reference
                to __turboFloat which forces this module to be linked in.

  }
end;

{--------------------------------------------------------------------------}

procedure __streams;
begin
  { I'm really not sure what this function does but the C obj files make a
    call to it. }
end;

{--------------------------------------------------------------------------}

function __ltolower(ch: integer): integer; cdecl;
begin
  Result := _tolower(ch);
end;

{--------------------------------------------------------------------------}

procedure __assert(test: integer);
begin
  raise Exception.Create('C RTL assert failed: ' + IntToStr(test));
end;

{--------------------------------------------------------------------------}

function SafeTrunc(const X: Extended): Int64;
begin
  try
    Result := Trunc(X);
  except
    try
      Result := Trunc(X);
    except
      raise Exception.Create('EnMisc unit: Error in SafeTrunc.');
    end;
  end;
end;

function _round(value: double): Longint;
begin
  { the function _ftol generated implcitely by the C compiler is really
    a Trunc rather than a Round. This was discovered with the gamma
    correction not properly working with the PngLib. }
  Result := SafeTrunc(Value);
end;

{--------------------------------------------------------------------------}

function _exp(value: double): double;
begin
  Result := Exp(Value);
end;

{--------------------------------------------------------------------------}

function _floor(value: double): double;
begin
  Result := SafeTrunc(value);
end;

{--------------------------------------------------------------------------}

function _log(value: double): double;
begin
  Result := Ln(Value);
end;
{--------------------------------------------------------------------------}

function _log10(value: double): double;
begin
  Result := Log10(Value);
end;
{--------------------------------------------------------------------------}

function _cos(value: double): double;
begin
  Result := cos(Value);
end;

{--------------------------------------------------------------------------}

function _sqrt(value: double): double;
begin
  Result := Sqrt(value);
end;

function _sqr(value: double): double;
begin
  Result := Sqrt(value);
end;

{--------------------------------------------------------------------------}

function _fabs(value: double): double;
begin
  Result := System.Abs(value);
end;

{--------------------------------------------------------------------------}

function _pow(x: double; y: double): double;
begin
  if X <= 0 then
    Result := 0
  else
    Result := Exp(Y * Ln(X))
end;

{--------------------------------------------------------------------------}

function _ltoa(Value: LongInt; Str: PAnsiChar; Radix: Integer): PAnsiChar;
var
  PStr: string[20];
begin
  { only base 10 supported }
  PStr := IntToStr(Value);
  Result := StrPCopy(Str, PStr);
end;

{--------------------------------------------------------------------------}

function _setjmp(jmpb: Byte): Integer;
begin
  Result := 0;
end;

{--------------------------------------------------------------------------}

procedure _longjmp(jmpb: Byte; RetVal: Integer);
begin
  raise Exception.Create('Error: C RTL longjmp called');
end;

{--------------------------------------------------------------------------}

function _fread(Ptr: Pointer;
  Size: Cardinal;
  Count: Cardinal;
  Stream: Pointer): Cardinal;
begin
  { MB Aug 09, 1999. Continue using Read instead of ReadBuffer, because
    with the JPEG library it is a normal condition to attempt to read
    beyond the end of the stream }
  Result := TStream(Stream).Read(Ptr^, Size * Count);
end;

{--------------------------------------------------------------------------}

function _fwrite(Ptr: Pointer;
  Size: Cardinal;
  Count: Cardinal;
  Stream: Pointer): Cardinal; cdecl;
begin
  { MB Aug 9, 1999. Use WriteBuffer instead of Write which will raise
    an exception if out of disk space. }
  TStream(Stream).WriteBuffer(Ptr^, Size * Count);

  Result := Size * Count;
end;

{--------------------------------------------------------------------------}

(*
function __fgetc( Stream : Pointer ) : Integer;
var
    TempByte : Byte;
begin
    TStream(Stream).Read(TempByte, SizeOf(TempByte));
    Result := TempByte;
end;

{--------------------------------------------------------------------------}

function __fputs( C       : Integer;
                 Stream  : Pointer ) : Integer;
var
    TempByte : Byte;
begin
    TempByte := C;
    TStream(Stream).Write(TempByte, SizeOf(TempByte));
    Result := C;
end;
*)

{--------------------------------------------------------------------------}

function _fflush(Stream: Pointer): Integer;
begin
  Result := 0;
end;

{--------------------------------------------------------------------------}

function _ferror(Stream: Pointer): Integer;
begin
  Result := 0;
end;

{--------------------------------------------------------------------------}

function _fclose(Stream: Pointer): Integer;
begin
  Result := 0;
end;

{--------------------------------------------------------------------------}

function _fdopen(handle: Integer; mode: PAnsiChar): Pointer;
begin
  Result := Pointer(Handle);
end;

{--------------------------------------------------------------------------}

function AreFlagsSet(const Value, Flags: LongInt): Boolean;
begin
  Result := (Flags = Flags and Value);
end;

function _open(const path: PAnsiChar; access: Integer): Integer;
const
  O_RDONLY = 0;
  O_WRONLY = 1;
  O_RDWR = 2;
  O_CREAT = $0100;
  O_TRUNC = $0200;
  O_EXCL = $0400;
  O_APPEND = $0800;

var
  Stream: TFileStream;
  Mode: Word;
begin
  Mode := 0;

//  if AreFlagsSet(O_CREAT or O_TRUNC, access) then
    Mode := Mode or fmCreate;

  if AreFlagsSet(O_EXCL, access) then
    Mode := Mode or fmShareExclusive;

  if AreFlagsSet(O_RDONLY, access) then
    Mode := Mode or fmOpenRead;

  if AreFlagsSet(O_WRONLY, access) then
    Mode := Mode or fmOpenWrite;

  if AreFlagsSet(O_RDWR, access) then
    Mode := Mode or fmOpenReadWrite;

  Stream := TFileStream.Create(StrPas(path), Mode);

  if AreFlagsSet(O_APPEND, access) then
    Stream.Seek(0, soFromEnd);

  Result := Integer(Stream);
end;

{--------------------------------------------------------------------------}

function _close(handle: Integer): Integer;
begin
  try
    TStream(Handle).Free;
    Result := 0;
  except
    Result := -1;
  end;
end;

{--------------------------------------------------------------------------}

function _lseek(handle: Integer; offset: LongInt; fromwhere: Integer): LongInt;
const
  SEEK_CUR = 1;
  SEEK_END = 2;
  SEEK_SET = 0;
var
  Origin: Word;
begin
  case fromwhere of
    SEEK_END: Origin := soFromEnd;
    SEEK_SET: Origin := soFromBeginning;
  else
    Origin := soFromCurrent;
  end;

  Result := TStream(Handle).Seek(Offset, Origin);
end;

{--------------------------------------------------------------------------}

function _read(handle: Integer; buf: Pointer; Len: Cardinal): Integer;
begin
  Result := TStream(Handle).Read(Buf^, Len);
end;

{--------------------------------------------------------------------------}

function _write(handle: Integer; buf: Pointer; Len: Cardinal): Integer;
begin
  Result := TStream(Handle).Write(Buf^, Len);
end;

{--------------------------------------------------------------------------}

procedure _RaiseDelphiException(Msg: PAnsiChar);
begin
  //  raise Exception.Create(Msg);
  ShowMessage(Msg);
end;

{--------------------------------------------------------------------------}

procedure _ShowIntValue(Msg: PAnsiChar;
  Value: Integer);
begin
  ShowMessage(Msg + ' = ' + IntToStr(Value));
end;

function _getLength(jpegdata: PStream): Integer;
begin
  result := jpegdata.Size;
end;

function _getBytes(jpegdata: PStream; buffer: PAnsiChar;
  currentPosition, length: Integer): Integer;
var
  i, k: integer;
begin
  i := jpegdata.Size;
  if i > (currentPosition + length) then
    k := length
  else
    k := i - currentPosition;
  Result := jpegdata.Read(buffer^, k);
end;

function _appendBytes(jpegdata: PStream; buffer: PAnsiChar; length: Integer): Integer;
begin
  jpegdata.Write(buffer^, length);
  Result := length;
end;
////////////////////////////////////////////////////////////////////////////

procedure _abort;
begin
  raise Exception.Create('jpeg2000 runtime error');
end;

//int _unlink(const char *filename);

function _unlink(filename: PAnsiChar): Integer;
begin

end;

function _ceil(x: double): double;
begin
  Result := Round(x);
end;

function _isalpha(c: integer): Integer;
begin

end;

//int isdigit(int c);

function _isdigit(c: integer): Integer;
begin

end;

//char *strrchr(const char *s, int c);

function _strrchr(const s: PAnsiChar; c: Integer): PAnsiChar;
begin

end;
//char *strchr(const char *s, int c);

function _strchr(s: PAnsiChar; c: Integer): PAnsiChar;
begin

end;

function _strcmp: Boolean;
begin

end;

function _isspace(c: Integer): Integer;
begin

end;
//int atexit(void (_USERENTRY * func)(void));

function _atexit(func: Pointer): Integer;
begin

end;
//long atol(const char *s);

function _atol(s: PAnsiChar): longint;
begin

end;

//double atof(const char *s);

function _atof(s: PAnsiChar): Double;
begin

end;

//int isprint(int c);

function _isprint(c: integer): integer;
begin

end;

//void *memmove(void *dest, const void *src, size_t n);

function _memmove(dest: Pointer; src: Pointer; n: Integer): Pointer;
begin

end;

//char *strdup(const char *s);

function _strdup(s: PAnsiChar): PAnsiChar;
begin

end;
//char *tmpnam(char *s);

function _tmpnam(s: PAnsiChar): PAnsiChar;
begin

end;

// 64 bit integer helper routines
//
// These functions always return the 64-bit result in EAX:EDX

// ------------------------------------------------------------------------------
//  64-bit signed multiply
// ------------------------------------------------------------------------------
//
//  Param 1(EAX:EDX), Param 2([ESP+8]:[ESP+4])  ; before reg pushing
//

procedure __llmul;
asm
        push  edx
        push  eax

  // Param2 : [ESP+16]:[ESP+12]  (hi:lo)
  // Param1 : [ESP+4]:[ESP]      (hi:lo)

        mov   eax, [esp+16]
        mul   dword ptr [esp]
        mov   ecx, eax

        mov   eax, [esp+4]
        mul   dword ptr [esp+12]
        add   ecx, eax

        mov   eax, [esp]
        mul   dword ptr [esp+12]
        add   edx, ecx

        pop   ecx
        pop   ecx

        ret     8
end;

// ------------------------------------------------------------------------------
//  64-bit signed multiply, with overflow check (98.05.15: overflow not supported yet)
// ------------------------------------------------------------------------------
//
//  Param1 ~= U   (Uh, Ul)
//  Param2 ~= V   (Vh, Vl)
//
//  Param 1(EAX:EDX), Param 2([ESP+8]:[ESP+4])  ; before reg pushing
//
//  compiler-helper function
//  O-flag set on exit   => result is invalid
//  O-flag clear on exit => result is valid

procedure __llmulo;
asm
        push   edx
        push   eax

        // Param2 : [ESP+16]:[ESP+12]  (hi:lo)
        // Param1 : [ESP+4]:[ESP]      (hi:lo)

        mov    eax, [esp+16]
        mul    dword ptr [esp]
        mov    ecx, eax

        mov    eax, [esp+4]
        mul    dword ptr [esp+12]
        add    ecx, eax

        mov    eax, [esp]
        mul    dword ptr [esp+12]
        add    edx, ecx

        pop    ecx
        pop    ecx

        ret    8
end;

// ------------------------------------------------------------------------------
//  64-bit signed division
// ------------------------------------------------------------------------------

//
//  Dividend = Numerator, Divisor = Denominator
//
//  Dividend(EAX:EDX), Divisor([ESP+8]:[ESP+4])  ; before reg pushing
//
//

procedure __lldiv;
asm
        push    ebp
        push    ebx
        push    esi
        push    edi
        xor     edi,edi

        mov     ebx,20[esp]             // get the divisor low dword
        mov     ecx,24[esp]             // get the divisor high dword

        or      ecx,ecx
        jnz     @__lldiv@slow_ldiv      // both high words are zero

        or      edx,edx
        jz      @__lldiv@quick_ldiv

        or      ebx,ebx
        jz      @__lldiv@quick_ldiv     // if ecx:ebx == 0 force a zero divide
          // we don't expect this to actually
          // work

@__lldiv@slow_ldiv:

//
//               Signed division should be done.  Convert negative
//               values to positive and do an unsigned division.
//               Store the sign value in the next higher bit of
//               di (test mask of 4).  Thus when we are done, testing
//               that bit will determine the sign of the result.
//
        or      edx,edx                 // test sign of dividend
        jns     @__lldiv@onepos
        neg     edx
        neg     eax
        sbb     edx,0                   // negate dividend
        or      edi,1

@__lldiv@onepos:
        or      ecx,ecx                 // test sign of divisor
        jns     @__lldiv@positive
        neg     ecx
        neg     ebx
        sbb     ecx,0                   // negate divisor
        xor edi,1

@__lldiv@positive:
        mov     ebp,ecx
        mov     ecx,64                  // shift counter
        push    edi                     // save the flags
//
//       Now the stack looks something like this:
//
//               24[esp]: divisor (high dword)
//               20[esp]: divisor (low dword)
//               16[esp]: return EIP
//               12[esp]: previous EBP
//                8[esp]: previous EBX
//                4[esp]: previous ESI
//                 [esp]: previous EDI
//
        xor     edi,edi                 // fake a 64 bit dividend
        xor     esi,esi

@__lldiv@xloop:
        shl     eax,1                   // shift dividend left one bit
        rcl     edx,1
        rcl     esi,1
        rcl     edi,1
        cmp     edi,ebp                 // dividend larger?
        jb      @__lldiv@nosub
        ja      @__lldiv@subtract
        cmp     esi,ebx                 // maybe
        jb      @__lldiv@nosub

@__lldiv@subtract:
        sub     esi,ebx
        sbb     edi,ebp                 // subtract the divisor
        inc     eax                     // build quotient

@__lldiv@nosub:
        loop    @__lldiv@xloop
//
//       When done with the loop the four registers values' look like:
//
//       |     edi    |    esi     |    edx     |    eax     |
//       |        remainder        |         quotient        |
//
        pop     ebx                     // get control bits
        test    ebx,1                   // needs negative
        jz      @__lldiv@finish
        neg     edx
        neg     eax
        sbb     edx,0                   // negate

@__lldiv@finish:
        pop     edi
        pop     esi
        pop     ebx
        pop     ebp
        ret     8

@__lldiv@quick_ldiv:
        div     ebx                     // unsigned divide
        xor     edx,edx
        jmp     @__lldiv@finish
end;

// ------------------------------------------------------------------------------
//  64-bit signed division with overflow check (98.05.15: not implementated yet)
// ------------------------------------------------------------------------------

//
//  Dividend = Numerator, Divisor = Denominator
//
//  Dividend(EAX:EDX), Divisor([ESP+8]:[ESP+4])
//  Param 1 (EAX:EDX), Param 2([ESP+8]:[ESP+4])
//
//  Param1 ~= U   (Uh, Ul)
//  Param2 ~= V   (Vh, Vl)
//
//  compiler-helper function
//  O-flag set on exit   => result is invalid
//  O-flag clear on exit => result is valid
//

procedure __lldivo;
asm
  // check for overflow condition: min(int64) DIV -1
        push  esi
        mov esi, [esp+12]   // Vh
        and esi, [esp+8]    // Vl
        cmp esi, 0ffffffffh   // V = -1?
        jne @@divok

        mov esi, eax
        or  esi, edx
        cmp esi, 80000000H    // U = min(int64)?
        jne @@divok

@@divOvl:
        mov eax, esi
        pop esi
        dec eax                     // turn on O-flag
        ret

@@divok:
        pop esi
        push  dword ptr [esp+8]   // Vh
        push  dword ptr [esp+8]   // Vl (offset is changed from push)
        call  __lldiv
        and eax, eax    // turn off O-flag
        ret 8
end;

// ------------------------------------------------------------------------------
//  64-bit unsigned division
// ------------------------------------------------------------------------------

//  Dividend(EAX(hi):EDX(lo)), Divisor([ESP+8](hi):[ESP+4](lo))  // before reg pushing

procedure __lludiv;
asm
        push    ebp
        push    ebx
        push    esi
        push    edi
//
//       Now the stack looks something like this:
//
//               24[esp]: divisor (high dword)
//               20[esp]: divisor (low dword)
//               16[esp]: return EIP
//               12[esp]: previous EBP
//                8[esp]: previous EBX
//                4[esp]: previous ESI
//                 [esp]: previous EDI
//

//       dividend is pushed last, therefore the first in the args
//       divisor next.
//
        mov     ebx,20[esp]             // get the first low word
        mov     ecx,24[esp]             // get the first high word

        or      ecx,ecx
        jnz     @__lludiv@slow_ldiv     // both high words are zero

        or      edx,edx
        jz      @__lludiv@quick_ldiv

        or      ebx,ebx
        jz      @__lludiv@quick_ldiv    // if ecx:ebx == 0 force a zero divide
          // we don't expect this to actually
          // work

@__lludiv@slow_ldiv:
        mov     ebp,ecx
        mov     ecx,64                  // shift counter
        xor     edi,edi                 // fake a 64 bit dividend
        xor     esi,esi

@__lludiv@xloop:
        shl     eax,1                   // shift dividend left one bit
        rcl     edx,1
        rcl     esi,1
        rcl     edi,1
        cmp     edi,ebp                 // dividend larger?
        jb      @__lludiv@nosub
        ja      @__lludiv@subtract
        cmp     esi,ebx                 // maybe
        jb      @__lludiv@nosub

@__lludiv@subtract:
        sub     esi,ebx
        sbb     edi,ebp                 // subtract the divisor
        inc     eax                     // build quotient

@__lludiv@nosub:
        loop    @__lludiv@xloop
//
//       When done with the loop the four registers values' look like:
//
//       |     edi    |    esi     |    edx     |    eax     |
//       |        remainder        |         quotient        |
//

@__lludiv@finish:
        pop     edi
        pop     esi
        pop     ebx
        pop     ebp
        ret     8

@__lludiv@quick_ldiv:
        div     ebx                     // unsigned divide
        xor     edx,edx
        jmp     @__lludiv@finish
end;

// ------------------------------------------------------------------------------
//  64-bit modulo
// ------------------------------------------------------------------------------

//  Dividend(EAX:EDX), Divisor([ESP+8]:[ESP+4])  // before reg pushing

procedure __llmod;
asm
        push    ebp
        push    ebx
        push    esi
        push    edi
        xor   edi,edi
//
//       dividend is pushed last, therefore the first in the args
//       divisor next.
//
        mov     ebx,20[esp]             // get the first low word
        mov     ecx,24[esp]             // get the first high word
        or      ecx,ecx
        jnz     @__llmod@slow_ldiv      // both high words are zero

        or      edx,edx
        jz      @__llmod@quick_ldiv

        or      ebx,ebx
        jz      @__llmod@quick_ldiv     // if ecx:ebx == 0 force a zero divide
          // we don't expect this to actually
          // work
@__llmod@slow_ldiv:
//
//               Signed division should be done.  Convert negative
//               values to positive and do an unsigned division.
//               Store the sign value in the next higher bit of
//               di (test mask of 4).  Thus when we are done, testing
//               that bit will determine the sign of the result.
//
        or      edx,edx                 // test sign of dividend
        jns     @__llmod@onepos
        neg     edx
        neg     eax
        sbb     edx,0                   // negate dividend
        or      edi,1

@__llmod@onepos:
        or      ecx,ecx                 // test sign of divisor
        jns     @__llmod@positive
        neg     ecx
        neg     ebx
        sbb     ecx,0                   // negate divisor

@__llmod@positive:
        mov     ebp,ecx
        mov     ecx,64                  // shift counter
        push    edi                     // save the flags
//
//       Now the stack looks something like this:
//
//               24[esp]: divisor (high dword)
//               20[esp]: divisor (low dword)
//               16[esp]: return EIP
//               12[esp]: previous EBP
//                8[esp]: previous EBX
//                4[esp]: previous ESI
//                 [esp]: previous EDI
//
        xor     edi,edi                 // fake a 64 bit dividend
        xor     esi,esi

@__llmod@xloop:
        shl     eax,1                   // shift dividend left one bit
        rcl     edx,1
        rcl     esi,1
        rcl     edi,1
        cmp     edi,ebp                 // dividend larger?
        jb      @__llmod@nosub
        ja      @__llmod@subtract
        cmp     esi,ebx                 // maybe
        jb      @__llmod@nosub

@__llmod@subtract:
        sub     esi,ebx
        sbb     edi,ebp                 // subtract the divisor
        inc     eax                     // build quotient

@__llmod@nosub:
        loop    @__llmod@xloop
//
//       When done with the loop the four registers values' look like:
//
//       |     edi    |    esi     |    edx     |    eax     |
//       |        remainder        |         quotient        |
//
        mov     eax,esi
        mov     edx,edi                 // use remainder

        pop     ebx                     // get control bits
        test    ebx,1                   // needs negative
        jz      @__llmod@finish
        neg     edx
        neg     eax
        sbb     edx,0                    // negate

@__llmod@finish:
        pop     edi
        pop     esi
        pop     ebx
        pop     ebp
        ret     8

@__llmod@quick_ldiv:
        div     ebx                     // unsigned divide
        xchg  eax,edx
        xor     edx,edx
        jmp     @__llmod@finish
end;

// ------------------------------------------------------------------------------
//  64-bit signed modulo with overflow (98.05.15: overflow not yet supported)
// ------------------------------------------------------------------------------

//  Dividend(EAX:EDX), Divisor([ESP+8]:[ESP+4])
//  Param 1 (EAX:EDX), Param 2([ESP+8]:[ESP+4])
//
//  Param1 ~= U   (Uh, Ul)
//  Param2 ~= V   (Vh, Vl)
//
//  compiler-helper function
//  O-flag set on exit   => result is invalid
//  O-flag clear on exit => result is valid
//

procedure __llmodo;
asm
  // check for overflow condition: min(int64) MOD -1
        push  esi
        mov esi, [esp+12]   // Vh
        and esi, [esp+8]    // Vl
        cmp esi, 0ffffffffh   // V = -1?
        jne @@modok

        mov esi, eax
        or  esi, edx
        cmp esi, 80000000H    // U = min(int64)?
        jne @@modok

@@modOvl:
        mov eax, esi
        pop esi
        dec eax                     // turn on O-flag
        ret

@@modok:
        pop esi
        push  dword ptr [esp+8]       // Vh
        push  dword ptr [esp+8] // Vl (offset is changed from push)
        call  __llmod
        and eax, eax    // turn off O-flag
        ret 8
end;

// ------------------------------------------------------------------------------
//  64-bit unsigned modulo
// ------------------------------------------------------------------------------
//  Dividend(EAX(hi):EDX(lo)), Divisor([ESP+8](hi):[ESP+4](lo))  // before reg pushing

procedure __llumod;
asm
        push    ebp
        push    ebx
        push    esi
        push    edi
//
//       Now the stack looks something like this:
//
//               24[esp]: divisor (high dword)
//               20[esp]: divisor (low dword)
//               16[esp]: return EIP
//               12[esp]: previous EBP
//                8[esp]: previous EBX
//                4[esp]: previous ESI
//                 [esp]: previous EDI
//

//       dividend is pushed last, therefore the first in the args
//       divisor next.
//
        mov     ebx,20[esp]             // get the first low word
        mov     ecx,24[esp]             // get the first high word
        or      ecx,ecx
        jnz     @__llumod@slow_ldiv     // both high words are zero

        or      edx,edx
        jz      @__llumod@quick_ldiv

        or      ebx,ebx
        jz      @__llumod@quick_ldiv    // if ecx:ebx == 0 force a zero divide
          // we don't expect this to actually
          // work
@__llumod@slow_ldiv:
        mov     ebp,ecx
        mov     ecx,64                  // shift counter
        xor     edi,edi                 // fake a 64 bit dividend
        xor     esi,esi                 //

@__llumod@xloop:
        shl     eax,1                   // shift dividend left one bit
        rcl     edx,1
        rcl     esi,1
        rcl     edi,1
        cmp     edi,ebp                 // dividend larger?
        jb      @__llumod@nosub
        ja      @__llumod@subtract
        cmp     esi,ebx                 // maybe
        jb      @__llumod@nosub

@__llumod@subtract:
        sub     esi,ebx
        sbb     edi,ebp                 // subtract the divisor
        inc     eax                     // build quotient

@__llumod@nosub:
        loop    @__llumod@xloop
//
//       When done with the loop the four registers values' look like:
//
//       |     edi    |    esi     |    edx     |    eax     |
//       |        remainder        |         quotient        |
//
        mov     eax,esi
        mov     edx,edi                 // use remainder

@__llumod@finish:
        pop     edi
        pop     esi
        pop     ebx
        pop     ebp
        ret     8

@__llumod@quick_ldiv:
        div     ebx                     // unsigned divide
        xchg  eax,edx
        xor     edx,edx
        jmp     @__llumod@finish
end;

// ------------------------------------------------------------------------------
//  64-bit shift left
// ------------------------------------------------------------------------------

//
// target (EAX:EDX) count (ECX)
//

procedure __llshl;
asm
        cmp cl, 32
        jl  @__llshl@below32
        cmp cl, 64
        jl  @__llshl@below64
        xor edx, edx
        xor eax, eax
        ret

@__llshl@below64:
        mov edx, eax
        shl edx, cl
        xor eax, eax
        ret

@__llshl@below32:
        shld  edx, eax, cl
        shl eax, cl
        ret
end;

// ------------------------------------------------------------------------------
//  64-bit signed shift right
// ------------------------------------------------------------------------------
// target (EAX:EDX) count (ECX)

procedure __llshr;
asm
        cmp cl, 32
        jl  @__llshr@below32
        cmp cl, 64
        jl  @__llshr@below64
        sar edx, 1fh
        mov eax,edx
        ret

@__llshr@below64:
        mov eax, edx
        cdq
        sar eax,cl
        ret

@__llshr@below32:
        shrd  eax, edx, cl
        sar edx, cl
        ret
end;

// ------------------------------------------------------------------------------
//  64-bit unsigned shift right
// ------------------------------------------------------------------------------

// target (EAX:EDX) count (ECX)

procedure __llushr;
asm
        cmp cl, 32
        jl  @__llushr@below32
        cmp cl, 64
        jl  @__llushr@below64
        xor edx, edx
        xor eax, eax
        ret

@__llushr@below64:
        mov eax, edx
        xor edx, edx
        shr eax, cl
        ret

@__llushr@below32:
        shrd  eax, edx, cl
        shr edx, cl
        ret
end;

procedure __ftol; // == __int64 _ftoi64(double)
asm
    push ebp
    mov ebp, esp
    lea esp, [ebp-$c]
//    wait
    fstcw word ptr [ebp-$4]
    wait
    mov al,[ebp-3]
    {$IFNDEF LEVEL5}
    or [ebp-4], $C01
    {$ENDIF}
    fldcw word ptr [ebp-$4]
    fistp qword ptr [ebp-$c]
    mov [ebp-$3], al
    fldcw word ptr [ebp -$4]
    mov eax, [ebp-$c]
    mov edx, [ebp-$8]
    mov esp, ebp
    pop ebp
end;

function __max_dble: int64;
begin

end;

procedure _setmode; cdecl;
begin

end;

procedure _fputc; cdecl;
begin

end;

procedure _fseek; cdecl;
begin

end;

function _vsprintf(buffer: PAnsiChar; const format: PAnsiChar): Integer;
begin
  { in C, this function has a variable number of parameters, which are
    not accessible in pascal }
  StrCopy(buffer, format);
  Result := StrLen(format);
end;

function _fprintf(buffer: PAnsiChar; const format: PAnsiChar): Integer;
begin
  { in C, this function has a variable number of parameters, which are
    not accessible in pascal }
//  StrCopy(buffer, format);
//  Result := StrLen(format);
end;

function _vfprintf(buffer: PAnsiChar; const format: PAnsiChar): Integer;
begin
  { in C, this function has a variable number of parameters, which are
    not accessible in pascal }
//  StrCopy(buffer, format);
//  Result := StrLen(format);
end;

function _fopen(const path: PAnsiChar;  const format: PAnsiChar): Integer; cdecl;
const
  O_RDONLY = 0;
  O_WRONLY = 1;
  O_RDWR = 2;
  O_CREAT = $0100;
  O_TRUNC = $0200;
  O_EXCL = $0400;
  O_APPEND = $0800;

var
  Stream: TFileStream;
  Mode: Word;
begin
  Mode := 0;

  {if AreFlagsSet(O_CREAT or O_TRUNC, access) then
    Mode := Mode or fmCreate;

  if AreFlagsSet(O_EXCL, access) then
    Mode := Mode or fmShareExclusive;

  if AreFlagsSet(O_RDONLY, access) then
    Mode := Mode or fmOpenRead;

  if AreFlagsSet(O_WRONLY, access) then }
    Mode := Mode or fmOpenWrite;

  //if AreFlagsSet(O_RDWR, access) then
  //  Mode := Mode or fmOpenReadWrite;

  Stream := TFileStream.Create(StrPas(path), Mode);

  //if AreFlagsSet(O_APPEND, access) then
  //  Stream.Seek(0, soFromEnd);

  Result := Integer(Stream);
end;
{.$ENDIF}


function _perror(s: PAnsiChar): longint; cdecl;
begin
  ShowMessage(StrPas(s));
end;


// void qsort(void *base, size_t nelem, size_t width, int (_USERENTRY *fcmp)(const void *, const void *));
procedure _qsort(base:Pointer;  nelem:Integer;  width:Integer;
  fcmp:Pointer);
begin

end;
procedure _sort(base:Pointer;  nelem:Integer;  width:Integer;
  fcmp:Pointer);
begin

end;
{$WARNINGS ON}

end.

