{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
Unit KxISOLib;
{$I DEFINES.INC}
Interface

Uses
  SysUtils, windows;

Type
  PDirEntry = ^TDEntry;
  PFileEntry = ^TFEntry;
  TFEntry = Record
    ShortName: String;
    LongName: String;
    Path: String;
    Imported: Boolean;
    Time: TDateTime;
    FileSize, FileSizeJ: Int64;
    SpaceReqOnDisc: Int64;
    Address: Integer;
    AddressJ: Integer;
    Attr: Integer;

    FileAttr: Integer;                  //2008-08-18  ADD
    CrcChecksum: DWORD;
    SameID: Integer;
    SameIndex: Integer;

    ResetArchiveBit: Boolean;
    DirRec: PDirEntry;
    Next: PFileEntry;
    Prev: Boolean;
    Buffer: PAnsiChar;
  End;

  TDEntry = Record
    ShortName: String;
    LongName: String;
    Imported: Boolean;
    Size, SizeJ: Int64;
    Path: String;
    Address,
      AddressJ: Integer;
    Depth: Byte;
    Number: Integer;
    Parent: PDirEntry;
    Files: PFileEntry;
    Order: Integer;
  End;

  TDirectoryDescriptor = Packed Record
    LenDr: Byte;                        // 01-01
    Extended: Byte;                     // 02-02
    Address,                            // 03-06
    AddressBE: LONGWORD;                // 07-10
    DataLength: LONGWORD;               // 11-14
    DataLengthBE: LONGWORD;             // 15-18
    Year, Month, Day: Byte;             // 19-21
    Hour, Min, Sec: Byte;               // 22-24
    TimeDiffernce: Shortint;            // 25-25
    FileFlag: Byte;                     // 26-26
    FileUnitSize: Byte;                 // 27-27
    InterleaveGap: Byte;                // 28-28
    VolSeqnumber: WORD;                 // 29-32
    VolSeqnumberBE: WORD;               // 29-32
    LenOfFileIdentifier: Byte;          // 33-33
    FileName: Array[0..255] Of AnsiChar;
  End;

  TDirectoryDescriptor2 = Packed Record
    LenDr: Byte;                        // 01-01
    Extended: Byte;                     // 02-02
    Address,                            // 03-06
    AddressBE: LONGWORD;                // 07-10
    DataLength: LONGWORD;               // 11-14
    DataLengthBE: LONGWORD;             // 15-18
    Year, Month, Day: Byte;             // 19-21
    Hour, Min, Sec: Byte;               // 22-24
    TimeDiffernce: Byte;                // 25-25
    FileFlag: Byte;                     // 26-26
    FileUnitSize: Byte;                 // 27-27
    InterleaveGap: Byte;                // 28-28
    VolSeqnumber: WORD;                 // 29-32
    VolSeqnumberBE: WORD;               // 29-32
    LenOfFileIdentifier: Byte;          // 33-33
    Dummy: Byte;                        // 34-34
  End;

  TPathTableRecord = Packed Record
    LenDI: Byte;
    ExtAttr: Byte;
    Address: LONGWORD;
    ParentNumber: WORD;
    Name: Array[0..255] Of AnsiChar;
    BytesToWrite: WORD;
  End;

  TVolumeDescriptor = Packed Record
    pdType: Byte;                       //   1 -   1
    Identifier: Array[1..5] Of AnsiChar;    //   2 -   7
    Version: Byte;                      //   7
    VolumeFlag: Byte;                   //   8
    IdSystem: Array[0..31] Of AnsiChar;     //   9 -  40
    IdVolume: Array[0..31] Of AnsiChar;     //  41 -  72
    IdBC: Array[0..7] Of AnsiChar;          //  73 -  80
    NoOfSectors: LONGWORD;              //  81 -  84
    NoOfSectorsBE: LONGWORD;            //  85 -  88
    EscapeChars: Array[0..31] Of AnsiChar;  //  89 - 120
    VolSetSize: WORD;                   // 121 - 124
    VolSetSizeBE: WORD;                 // 121 - 124
    VolSeqnumber: WORD;                 // 125 - 128
    VolSeqnumberBE: WORD;               // 125 - 128
    SectorSize: WORD;                   // 129 - 132
    SectorSizeBE: WORD;                 // 129 - 132
    PathTableSize: LONGWORD;            // 133 - 136
    PathTableSizeBE: LONGWORD;          // 137 - 140
    Type1PathTable: LONGWORD;           // 141 - 144
    Type1PathTableBE: LONGWORD;         // 145 - 148
    TypeMPathTable: LONGWORD;           // 149 - 152
    TypeMPathTableBE: LONGWORD;         // 153 - 156
    RootDirRec: TDirectoryDescriptor2;  // 157 - 190
    IdVolumeSet: Array[0..127] Of AnsiChar; // 191 - 318
    IdPublisher: Array[0..127] Of AnsiChar; // 319 - 446
    IdPreparer: Array[0..127] Of AnsiChar;  // 447 - 574
    IdApplication: Array[0..127] Of AnsiChar; // 575 - 702
    FileCopyright: Array[0..36] Of AnsiChar; // 703 - 739
    FileAbstract: Array[0..36] Of AnsiChar; // 740 - 776
    FileBibliographic: Array[0..36] Of AnsiChar; // 777 - 813
    DateCreation: Array[0..16] Of AnsiChar; // 814 - 830
    DateModification: Array[0..16] Of AnsiChar; // 831 - 847
    DateExpiration: Array[0..16] Of AnsiChar; // 848 - 864
    DateEffective: Array[0..16] Of AnsiChar; // 865 - 881
    FileStructureVer: Byte;             // 882 - 882
    UnUsed1: Byte;                      // 883 - 883
    AppDataName: Array[0..19] Of AnsiChar;  //884 - 903
    MediumSize: DWORD;                  //904 - 908
    ApplicationData: Array[0..116] Of AnsiChar; // 909  - 915
    ApplicationData2: Array[0..7] Of AnsiChar; // 1025 - 1032
    ApplicationData3: Array[0..362] Of AnsiChar; // 1033 - 1395
    Unused2: Array[1396..2048] Of Byte; // 1396 - 2048
  End;

  TBootVolumeDescriptor = Packed Record
    pdType: Byte;                       //   0
    Identifier: Array[1..5] Of AnsiChar;    //   1 - 5
    Version: Byte;                      //   6
    Ident: Array[7..$26] Of AnsiChar;       //   7 - $26
    UnUsed1: Array[$27..$46] Of Byte;   // $27 - $46
    BootCatLocation: Cardinal;
    Unused2: Array[$4B..$7FF] Of Byte;
  End;
  TBootCatalog = Packed Record
    Header: Byte;
    PlatformID: Byte;
    Reserved1: WORD;
    Developer: Array[$4..$1B] Of AnsiChar;
    Checksum: WORD;
    KeyByte1, KeyByte2: Byte;
    BootIndicator: Byte;
    BootMediaType: Byte;
    LoadSegment: WORD;
    SystemType: Byte;
    UnUsed1: Byte;
    SectorCount: WORD;
    LoadRBA: DWORD;
    Unused2: Array[$0C..$1F] Of Byte;
    Unused3: Array[$30..$7EF] Of Byte;
  End;

Const
  MaxDepth = $FF;
  DefaultSectorSize = 2048;

  //DATA BLOCK TYPES
  RAW_DATA_BLOCK = $00;                 // 2352 BYTES
  RAW_DATA_P_Q_SUB = $01;               // 2368 BYTES
  RAW_DATA_P_W_SUB = $02;               // 2448 BYTES
  RAW_DATA_P_W_SUB2 = $03;              // 2448 BYTES
  MODE_1 = $08;                         // 2048 BYTES
  MODE_2 = $09;                         // 2336 BYTES
  MODE_2_XA_FORM_1 = $0A;               // 2048 BYTES
  MODE_2_XA_FORM_1_SUB = $0B;           // 2056 BYTES
  MODE_2_XA_FORM_2 = $0C;               // 2324 BYTES
  MODE_2_XA_FORM_2_SUB = $0D;           // 2332 BYTES

Var
  MaxFiles: Integer;
  MaxDirs: Integer;
  Files: Array Of PFileEntry;
  Dirs: Array Of Pointer;
  PathTable: Array Of Pointer;
  PathTableJ: Array Of Pointer;
  DirCounter: Integer;
  FileCounter: Integer;
  DirectoryFirst: Boolean = False;
  TimeZoneDiff: SmallInt;
  TimeZoneInformation: TTimeZoneInformation;

Procedure CopyToArrayW(src: String; Var Dest: Array Of AnsiChar; Len: Integer);
Procedure CopyToArray(src: AnsiString; Var Dest: Array Of AnsiChar; Max: Integer);
Procedure SortFiles(Var List: PFileEntry; Joliet: Boolean);
Procedure SortParent(Var A: Array Of Pointer; N: Integer);
Procedure SortNumber(Var A: Array Of Pointer; N: Integer);
Procedure SortLevel(Var A: Array Of Pointer; N: Integer);
Procedure SortPN(Var A: Array Of Pointer; N: Integer; Joliet: Boolean);
Procedure SortLN(Var A: Array Of Pointer; N: Integer; Joliet: Boolean);
Procedure SetDateTime(Time: TDateTime; Var d: TDirectoryDescriptor);
Procedure SetDateTime2(Time: TDateTime; Var d: TDirectoryDescriptor2); //2008-08-18  ADD
Function MSF2LBA(h, m, s, f: Byte): Cardinal;
Procedure LBA2MSFH(lba: Cardinal; Var m, s, f: Byte);
Procedure LBA2MSF(lba: Cardinal; Var m, s, f: Byte);
Function LBA2MSFStr(lba: Cardinal): String;
Function Sectors(bytes: Int64): Int64;
Function Sectors2(Var P: PFileEntry): Int64;
Function IntToDec(i: Int64; N: Integer = 2; pad: String = '0'): String;
Function ExtractLastDir(Path: String): String;
Function ConvertDataBlock(DataBlock: Integer): Integer;
Implementation

Procedure LBA2MSFH(lba: Cardinal; Var m, s, f: Byte);
Begin
  f := lba Mod 75;
  s := (lba Div 75) Mod 60;
  m := (lba Div 75) Div 60;
  f := ((f Div 10) Shl 4) Or (f Mod 10);
  m := ((m Div 10) Shl 4) Or (m Mod 10);
  s := ((s Div 10) Shl 4) Or (s Mod 10);
End;
Procedure LBA2MSF(lba: Cardinal; Var m, s, f: Byte);
Begin
  f := lba Mod 75;
  s := (lba Div 75) Mod 60;
  m := (lba Div 75) Div 60;
End;

Function LBA2MSFStr(lba: Cardinal): String;
Var
  m, s, f: Byte;
Begin
  LBA2MSF(lba, m, s, f);
  Result := Format('%2.2d:%2.2d:%2.2d', [m, s, f]);
End;

Procedure CopyToArrayW(src: String; Var Dest: Array Of AnsiChar; Len: Integer);
Var
  i: Integer;
  ws: WideString;
  sa: Array[0..4096] Of AnsiChar;
Begin
  src := Copy(src + '                                                                                                                                                                 ', 1, Len + 12);
  ws := src;
  Move(ws[1], sa[0], Len * 2);
  i := 0;
  While i < (Len) Do
  Begin
    Dest[i] := sa[i + 1];
    Dest[i + 1] := sa[i];
    inc(i, 2);
  End;
End;

Procedure CopyToArray(src: AnsiString; Var Dest: Array Of AnsiChar; Max: Integer);
Var
  i: Integer;
Begin
  src := Copy(src + '                                                                                                                                                                                                                           ', 1, Max);
  For i := 1 To Max Do
    Dest[i - 1] := src[i]
End;

Procedure Swap(Var X, Y: Pointer);
Var
  Temp: PDirEntry;
Begin
  Temp := X;
  X := Y;
  Y := Temp
End;

{function DirName(s: string): String;
begin
  if s = '.' then
    result := #0
  else if s = '..' then
    result := #1
  else
    result := s;
end;}

Function FileName(s: PFileEntry): String; Overload;
Begin
  If ((s.Attr And faDirectory) = faDirectory) Then
    Result := '1' + s.ShortName
  Else
    Result := '2' + s.ShortName;
End;

Function FileName(s: String): String; Overload;
Begin
  Result := s;
End;

Function FileNameJ(s: PFileEntry): String;
Begin
  Result := s.ShortName;
End;

Procedure SortFiles(Var List: PFileEntry; Joliet: Boolean);
Var
  node, node2, List2: PFileEntry;
Begin
  If (List = Nil) Or (List.Next = Nil) Then Exit;
  New(List2);
  List2.Next := List;
  List := List.Next;
  List2.Next.Next := Nil;
  While List <> Nil Do
  Begin
    node := List;
    List := List.Next;
    node2 := List2;
    If DirectoryFirst Then
    Begin
      If Joliet Then
        While (node2.Next <> Nil) And (FileName(node) > FileName(node2.Next)) Do node2 := node2.Next
      Else
        While (node2.Next <> Nil) And (FileNameJ(node) > FileNameJ(node2.Next)) Do node2 := node2.Next;
    End
    Else
    Begin
      If Joliet Then
        While (node2.Next <> Nil) And (node.ShortName > node2.Next.ShortName) Do node2 := node2.Next
      Else
        While (node2.Next <> Nil) And (FileNameJ(node) > FileNameJ(node2.Next)) Do node2 := node2.Next;
    End;
    node.Next := node2.Next;
    node2.Next := node;
  End;
  List := List2.Next;
  //  node := list;
  Dispose(List2);
End;

Procedure SortLevel(Var A: Array Of Pointer; N: Integer);
Var
  Done: Boolean;
  Jump, i, J: Integer;
  AA, BB: PDirEntry;
Begin
  Jump := N;
  While (Jump > 1) Do
  Begin
    Jump := Jump Div 2;
    Repeat
      Done := true;
      For J := 1 To (N - Jump) Do
      Begin
        i := J + Jump;
        AA := A[J];
        BB := A[i];
        If (AA.Depth > BB.Depth) Then
        Begin
          Swap(A[J], A[i]);
          Done := False
        End;
      End;
    Until Done;
  End;
  For i := 0 To N Do
  Begin
    AA := A[i];
    AA.Number := i + 1;
  End;
End;

Procedure SortNumber(Var A: Array Of Pointer; N: Integer);
Var
  Done: Boolean;
  Jump, i, J: Integer;
  AA, BB: PDirEntry;
Begin
  Jump := N;
  While (Jump > 1) Do
  Begin
    Jump := Jump Div 2;
    Repeat
      Done := true;
      For J := 1 To (N - Jump) Do
      Begin
        i := J + Jump;
        AA := A[J];
        BB := A[i];
        If (AA.Number > BB.Number) Then
        Begin
          Swap(A[J], A[i]);
          Done := False
        End;
      End;
    Until Done;
  End;
  For i := 0 To N Do
  Begin
    AA := A[i];
    AA.Number := i + 1;
  End;
End;

Procedure SortParent(Var A: Array Of Pointer; N: Integer);
Var
  Done: Boolean;
  Jump, i, J: Integer;
  AA, BB: PDirEntry;
Begin
  Jump := N;
  While (Jump > 1) Do
  Begin
    Jump := Jump Div 2;
    Repeat
      Done := true;
      For J := 1 To (N - Jump) Do
      Begin
        i := J + Jump;
        AA := A[J];
        BB := A[i];
        If (AA.Parent.Number > BB.Parent.Number) Then
        Begin
          Swap(A[J], A[i]);
          Done := False
        End;
      End;
    Until Done;
  End;
  For i := 0 To N Do
  Begin
    AA := A[i];
    AA.Number := i + 1;
  End;
End;

Function IntToStrF(i, l: Integer): String;
Var
  s: String;
Begin
  s := '%.' + IntToStr(l) + 'd ';
  Result := Format(s, [i]);
End;

Procedure SortLN(Var A: Array Of Pointer; N: Integer; Joliet: Boolean);
Var
  Done: Boolean;
  Jump, i, J: Integer;
  AA, BB: PDirEntry;
  sa, sb: String;
Begin

  Jump := N;
  While (Jump > 1) Do
  Begin
    Jump := Jump Div 2;
    Repeat
      Done := true;
      For J := 1 To (N - Jump) Do
      Begin
        i := J + Jump;
        AA := A[J];
        BB := A[i];
        If Joliet Then
        Begin
          sa := IntToStrF(AA.Depth, 4) + FileName(AA.LongName);
          sb := IntToStrF(BB.Depth, 4) + FileName(BB.LongName);
        End
        Else
        Begin
          sa := IntToStrF(AA.Depth, 4) + FileName(AA.ShortName);
          sb := IntToStrF(BB.Depth, 4) + FileName(BB.ShortName);
        End;
        If (sa > sb) Then
        Begin
          Swap(A[J], A[i]);
          Done := False
        End;
      End;
    Until Done;
  End;
  For i := 0 To N Do
  Begin
    AA := A[i];
    AA.Number := i + 1;
  End;
End;

Procedure SortPN(Var A: Array Of Pointer; N: Integer; Joliet: Boolean);
Var
  Done: Boolean;
  Jump, i, J: Integer;
  AA, BB: PDirEntry;
  s, sa, sb: String;
Begin
  s := '                                                                                                                                                                                                                                                               ';
  Jump := N;
  While (Jump > 1) Do
  Begin
    Jump := Jump Div 2;
    Repeat
      Done := true;
      For J := 1 To (N - Jump) Do
      Begin
        i := J + Jump;
        AA := A[J];
        BB := A[i];
        If Joliet Then
        Begin
          sa := IntToStrF(AA.Parent.Number, 4) + FileName(AA.LongName);
          sb := IntToStrF(BB.Parent.Number, 4) + FileName(BB.LongName);
        End
        Else
        Begin
          sa := IntToStrF(AA.Parent.Number, 4) + FileName(AA.ShortName);
          sb := IntToStrF(BB.Parent.Number, 4) + FileName(BB.ShortName);
        End;
        If (sa > sb) Then
        Begin
          Swap(A[J], A[i]);
          Done := False
        End;
      End;
    Until Done;
  End;
  For i := 0 To N Do
  Begin
    AA := A[i];
    AA.Number := i + 1;
  End;
End;

Function Sectors2(Var P: PFileEntry): Int64;
Var
  bytes: Int64;
Begin
  bytes := P.FileSize;
  If bytes = 0 Then
  Begin
    Result := 0;
    Exit;
  End;
  If bytes Mod (DefaultSectorSize + 276) = 0 Then
    Result := bytes Div (DefaultSectorSize + 276)
  Else
    Result := (bytes Div (DefaultSectorSize + 276)) + 1;
  P.FileSize := Result * 2048;
  P.FileSizeJ := Result * 2048;
  If Result < 150 Then Result := 150;
  P.SpaceReqOnDisc := Result * (DefaultSectorSize);
End;

Function Sectors(bytes: Int64): Int64;
Begin
  Result := 0;
  If bytes = 0 Then Exit;

  If bytes Mod DefaultSectorSize = 0 Then
    Result := bytes Div DefaultSectorSize
  Else
    Result := (bytes Div DefaultSectorSize) + 1
End;

Function YearOf(Const AValue: TDateTime): WORD;
Var
  LMonth, LDay: WORD;
Begin
  DecodeDate(AValue, Result, LMonth, LDay);
End;

Function MonthOf(Const AValue: TDateTime): WORD;
Var
  LYear, LDay: WORD;
Begin
  DecodeDate(AValue, LYear, Result, LDay);
End;

Function DayOf(Const AValue: TDateTime): WORD;
Var
  LYear, LMonth: WORD;
Begin
  DecodeDate(AValue, LYear, LMonth, Result);
End;

Function HourOf(Const AValue: TDateTime): WORD;
Var
  LMinute, LSecond, LMilliSecond: WORD;
Begin
  DecodeTime(AValue, Result, LMinute, LSecond, LMilliSecond);
End;

Function MinuteOf(Const AValue: TDateTime): WORD;
Var
  LHour, LSecond, LMilliSecond: WORD;
Begin
  DecodeTime(AValue, LHour, Result, LSecond, LMilliSecond);
End;

Function SecondOf(Const AValue: TDateTime): WORD;
Var
  LHour, LMinute, LMilliSecond: WORD;
Begin
  DecodeTime(AValue, LHour, LMinute, Result, LMilliSecond);
End;

Procedure SetDateTime(Time: TDateTime; Var d: TDirectoryDescriptor);
Begin
  d.Year := LoByte(YearOf(Time) - 1900);
  d.Month := LoByte(MonthOf(Time));
  d.Day := LoByte(DayOf(Time));
  d.Hour := LoByte(HourOf(Time));
  d.Min := LoByte(MinuteOf(Time));
  d.Sec := LoByte(SecondOf(Time));
  d.TimeDiffernce := TimeZoneDiff;
End;

Procedure SetDateTime2(Time: TDateTime; Var d: TDirectoryDescriptor2); //2008-08-18  ADD
Begin
  d.Year := LoByte(YearOf(Time) - 1900);
  d.Month := LoByte(MonthOf(Time));
  d.Day := LoByte(DayOf(Time));
  d.Hour := LoByte(HourOf(Time));
  d.Min := LoByte(MinuteOf(Time));
  d.Sec := LoByte(SecondOf(Time));
  d.TimeDiffernce := TimeZoneDiff;
End;

Function MSF2LBA(h, m, s, f: Byte): Cardinal;
Begin
  Result := (h * 60 * 60 * 75) + (m * 60 * 75) + (s * 75) + (f);
End;

Function IntToDec(i: Int64; N: Integer = 2; pad: String = '0'): String;
Var
  s1, s2: String;
  l, J: Integer;
Begin
  s1 := IntToStr(i);
  l := Length(s1);
  For J := l To N - 1 Do
    s2 := s2 + pad;
  Result := s2 + s1;
End;

Function ExtractLastDir(Path: String): String;
Var
  i, J: Integer;
Begin
  J := 1;
  For i := Length(Path) - 1 Downto 1 Do
    If Path[i] = '\' Then
    Begin
      J := i;
      Break;
    End;
  Result := Copy(Path, J, Length(Path));
End;

Function ConvertDataBlock(DataBlock: Integer): Integer;
Var
  DataSize: Integer;
Begin
  DataSize := DefaultSectorSize;
  Case DataBlock Of
    RAW_DATA_BLOCK: DataSize := 2352;
    RAW_DATA_P_Q_SUB: DataSize := 2368;
    RAW_DATA_P_W_SUB: DataSize := 2448;
    RAW_DATA_P_W_SUB2: DataSize := 2448;
    MODE_1: DataSize := DefaultSectorSize;
    MODE_2: DataSize := 2336;
    MODE_2_XA_FORM_1: DataSize := DefaultSectorSize;
    MODE_2_XA_FORM_1_SUB: DataSize := 2056;
    MODE_2_XA_FORM_2: DataSize := 2324;
    MODE_2_XA_FORM_2_SUB: DataSize := 2332;
  End;
  Result := DataSize;
End;

End.

