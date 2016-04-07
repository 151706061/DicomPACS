unit DCM_MemTypes;

interface

{$I DCM_MemTable.inc}

uses DB
{$IFDEF DOTNET}
  ,System.Runtime.InteropServices
{$ENDIF}
  ;

type
{$IFDEF DOTNET}
  PkbmRecord    = IntPtr; // TkbmRecord;
{$ELSE}
  PkbmRecord    = ^TkbmRecord;
{$ENDIF}

{$IFDEF DOTNET}
  [StructLayout(LayoutKind.Sequential)]
{$ENDIF}
  TkbmRecord=record
{$IFDEF DO_CHECKRECORD}
      StartIdent:longint;
{$ENDIF}

      RecordNo: integer;      // Will be set on every single getrecord call.
      RecordID: integer;
      UniqueRecordID: integer;

      Flag:byte;              // Record flags.
      UpdateStatus:TUpdateStatus;

      TransactionLevel:integer;
      Tag:longint;
      PrevRecordVersion:PkbmRecord;

      // Data starts at place pointed at by data, right after the end of TkbmRecord.
{$IFDEF DOTNET}
      Data:TValueBuffer;//           array of byte;
{$ELSE}
      Data:PAnsiChar;
{$ENDIF}

{$IFDEF DO_CHECKRECORD}
      EndIdent:longint;
{$ENDIF}
  end;

{
  Internal Data layout:
+------------+------------------------+-----------------------+------------------+----------------------+
| TkbmRecord | FIXED LENGTH DATA      | CALCULATED FIELDS     |Bookmark arrays   | VARIABLE LENGTH PTRS |
|            | FFixedRecordSize bytes | FCalcRecordSize bytes |FBookmarkArraySize| FVarLengthRecordSize |
+------------+------------------------+-----------------------+------------------+----------------------+
             ^                        ^                       ^                  ^
             GetFieldPointer          StartCalculated         StartBookmarks     StartVarLength

Blobsfields in the internal buffer are pointers to the blob data.
}

{$IFDEF DOTNET}
  PDateTimeRec = IntPtr;
  PWordBool    = IntPtr;
{$ELSE}
  PDateTimeRec=^TDateTimeRec;
  PWordBool=^WordBool;
{$ENDIF}

{$IFDEF DOTNET}
  PkbmInternalAddRecord = TRecordBuffer;
  PkbmInternalInitRecord = TRecordBuffer;
  PkbmInternalSetToRecord = TRecordBuffer;
  PkbmAllocRecordBuffer = TRecordBuffer;
  PkbmFreeRecordBuffer = TRecordBuffer;
  PkbmSetFieldData = TRecordBuffer;
  PkbmGetRecord = TRecordBuffer;
  PkbmRecordBuffer = TRecordBuffer;
  PkbmGetBookmarkFlag = TRecordBuffer;
  PkbmSetBookmarkFlag = TRecordBuffer;
  PkbmGetBookmarkData = TRecordBuffer;
  PkbmSetBookmarkData = TRecordBuffer;
  PkbmInternalBookmarkValid = IntPtr;
  PkbmInternalGotoBookmark = TBookmark;
  PkbmClearCalcFields = TRecordBuffer;
  PkbmGetCalcFields = TRecordBuffer;
  PBookmarkFlag = IntPtr; // ^TBookmarkFlag;
  PkbmCalculateFields = IntPtr;
  PkbmGetFieldData = TValueBuffer;
{$ELSE}
 {$IFDEF LEVEL13}
  PkbmInternalAddRecord = Pointer;
  PkbmInternalInitRecord = TRecordBuffer;
  PkbmInternalSetToRecord = TRecordBuffer;
  PkbmAllocRecordBuffer = TRecordBuffer;
  PkbmFreeRecordBuffer = TRecordBuffer;
  PkbmSetFieldData = Pointer;
  PkbmGetRecord = TRecordBuffer;
  PkbmRecordBuffer = PAnsiChar;
  PkbmGetBookmarkFlag = TRecordBuffer;
  PkbmSetBookmarkFlag = TRecordBuffer;
  PkbmGetBookmarkData = TRecordBuffer;
  PkbmSetBookmarkData = TRecordBuffer;
  PkbmInternalBookmarkValid = Pointer;
  PkbmInternalGotoBookmark = Pointer;
  PkbmClearCalcFields = PByte;
  PkbmGetCalcFields = PByte;
  PBookmarkFlag = ^TBookmarkFlag;
  PkbmCalculateFields = TRecordBuffer;
  PkbmGetFieldData = Pointer;
 {$ELSE}
  PkbmInternalAddRecord = Pointer;
  PkbmInternalInitRecord = PChar;
  PkbmInternalSetToRecord = PChar;
  PkbmAllocRecordBuffer = PChar;
  PkbmFreeRecordBuffer = PChar;
  PkbmSetFieldData = Pointer;
  PkbmGetRecord = PChar;
  PkbmRecordBuffer = PChar;
  PkbmGetBookmarkFlag = PChar;
  PkbmSetBookmarkFlag = PChar;
  PkbmGetBookmarkData = PChar;
  PkbmSetBookmarkData = PChar;
  PkbmInternalBookmarkValid = Pointer;
  PkbmInternalGotoBookmark = Pointer;
  PkbmClearCalcFields = PChar;
  PkbmGetCalcFields = PChar;
  PBookmarkFlag = ^TBookmarkFlag;
  PkbmCalculateFields = PChar;
  PkbmGetFieldData = Pointer;
 {$ENDIF}
{$ENDIF}

implementation

end.
