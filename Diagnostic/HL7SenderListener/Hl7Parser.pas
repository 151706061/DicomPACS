{ *********************************************************************** }

{ Makhaon HL7 Parser                                                      }

{ Copyright (c) 2009 Makhaon Software                                     }

{ *********************************************************************** }

unit Hl7Parser;

interface

uses
  Classes, MakStrUtils, {CommonTypes,} SysUtils;

type
  TSegmentType = (stUNKNOWN, stMSH, stPID, stNTE, stPV1, stORC, stOBR, stEVN, stOBX, stZDS
                 ); //SI добавлен stZDS

  TDAString = array of String;//SI

  TSegment = record
    SegmentType: TSegmentType;
    SegmentRec: array of String;
  end;

  THL7Encoder = class
  private
    FPatientName: String;
    FPatientSex: String;
    FPatientAddr4: String;
    FAETitle: String;
    FShedTime: String;
    FPatientDOB: String;
    FPatientCH: String;
    FPatientID: String;
    FPatientPolice: String;
    FShedDate: String;
    FPatientCategory: String;
    FStudyID: String;
    FPatientAddr2: String;
    FPatientTitle: String;
    FBodyPart: String;
    FStudyRP: String;
    FRequestPhys: String;
    FPatientAddr1: String;
    FPatientAddr3: String;
    FStudyDescr: String;
    FSL: TStringList;
    FS: String;
    procedure AddMSHSeg;
    procedure AddOBRSeg;
    procedure AddOBXSeg;
    procedure AddPIDSeg;
  public
    procedure EncodeResultMessage(const SL: TStringList);
    property PatientName: String read FPatientName write FPatientName;
    property RequestPhys: String read FRequestPhys write FRequestPhys;
    property StudyDescr: String read FStudyDescr write FStudyDescr;
    property StudyID: String read FStudyID write FStudyID;
    property StudyRP: String read FStudyRP write FStudyRP;
    property PatientID: String read FPatientID write FPatientID;
    property PatientDOB: String read FPatientDOB write FPatientDOB;
    property PatientSex: String read FPatientSex write FPatientSex;
    property BodyPart: String read FBodyPart write FBodyPart;
    property ShedDate: String read FShedDate write FShedDate;
    property ShedTime: String read FShedTime write FShedTime;
    property AETitle: String read FAETitle write FAETitle;
    property PatientTitle: String read FPatientTitle write FPatientTitle;
    property PatientAddr1: String read FPatientAddr1 write FPatientAddr1;
    property PatientAddr2: String read FPatientAddr2 write FPatientAddr2;
    property PatientAddr3: String read FPatientAddr3 write FPatientAddr3;
    property PatientAddr4: String read FPatientAddr4 write FPatientAddr4;
    property PatientPolice: String read FPatientPolice write FPatientPolice;
    property PatientCH: String read FPatientCH write FPatientCH;
    property PatientCategory: String read FPatientCategory write FPatientCategory;
  end;

  THl7MessageParser = class
  private
    FSegments: array of TSegment;
    procedure ParseSegment(const s: String; var ASegment: TSegment);
    function GetPatientName: String;
    function GetValue(ASegmentType: TSegmentType; ParamNum, ParamSubNum: Integer): String;
    function GetRequestPhys: String;
    function GetStudyDescr: String;
    function GetPatientID: String;
    function GetPatientDOB: String;
    function GetPatientSex: String;
    function GetBodyPart: String;
    function GetStudyID: String;
    function GetShedDate: String;
    function GetShedTime: String;
    function GetAETitle: String;
    function GetPatientTitle: String;
    function GetPatientAddr1: String;
    function GetPatientAddr2: String;
    function GetPatientAddr3: String;
    function GetPatientAddr4: String;
    function GetPatientPolice: String;
    function GetPatientCH: String;
    function GetPatientCategory: String;
    function GetStudyRP: String;
  public
    procedure ParseMessage(const SL: TStringList);
    property PatientName: String read GetPatientName;
    property RequestPhys: String read GetRequestPhys;
    property StudyDescr: String read GetStudyDescr;
    property StudyID: String read GetStudyID;
    property StudyRP: String read GetStudyRP;
    property PatientID: String read GetPatientID;
    property PatientDOB: String read GetPatientDOB;
    property PatientSex: String read GetPatientSex;
    property BodyPart: String read GetBodyPart;
    property ShedDate: String read GetShedDate;
    property ShedTime: String read GetShedTime;
    property AETitle: String read GetAETitle;
    property PatientTitle: String read GetPatientTitle;
    property PatientAddr1: String read GetPatientAddr1;
    property PatientAddr2: String read GetPatientAddr2;
    property PatientAddr3: String read GetPatientAddr3;
    property PatientAddr4: String read GetPatientAddr4;
    property PatientPolice: String read GetPatientPolice;
    property PatientCH: String read GetPatientCH;
    property PatientCategory: String read GetPatientCategory;
  end;

  //SI
  THl7MessageParserEx = class(THl7MessageParser)
  private
    function GetHIS_ID: string;
    function GetDicomUID: String;
    function GetStudyIsCancelled: Boolean;
    function GetStudyIsDone: Boolean;
    function GetStudyIsNew: Boolean;
    function GetStudyIsUpdate: Boolean;
  public
    property HIS_ID: String read GetHIS_ID;
    property StudyIsNew: Boolean read GetStudyIsNew;
    property StudyIsUpdate: Boolean read GetStudyIsUpdate;
    property StudyIsDone: Boolean read GetStudyIsDone;
    property StudyIsCancelled: Boolean read GetStudyIsCancelled;
    property DicomUID: String read GetDicomUID;
  end;

function SplitField(const s: String): TDAString;

implementation

//SI 21-06-2011
//Введен массив соответствий TSegmentType->строка. Сделано для того, чтобы можно
//было относительно безопасно добавлять новые типы TSegmentType. Компилятор заругается,
//обнаружив недостаток значений массива.
//Функция StrToSegmentType переводит стрку в тип TSegmentType. Предполагается, что
//на вход ей поступает строка в верхнем регистре, описывающая тип сегмента
const
  csSegmentStr: array [TSegmentType] of String =
  (
    '',    //stUNKNOWN
    'MSH', //stMSH
    'PID', //stPID
    'NTE', //stNTE,
    'PV1', //stPV1
    'ORC', //stORC
    'OBR', //stOBR
    'EVN', //stEVN
    'OBX', //stOBX
    'ZDS'  //stZDS
  );

function StrToSegmentType(const s: String): TSegmentType;
var
  i: TSegmentType;
begin
  Result := stUNKNOWN;
  for i := Low(TSegmentType) to High(TSegmentType) do
  begin
    if csSegmentStr[i] = s then
    begin
      Result := i;
      break;
    end;
  end;
end;

{ THl7MessageParser }

function SplitField(const s: String): TDAString;
var
  s1, s2: String;
begin
  SetLength(Result, 0);
  s1 := s;
  while s1 <> '' do
  begin
    s2 := Copy2SymbDel(s1, '^');
    SetLength(Result, Length(Result) + 1);
    Result[High(Result)] := s2;
    DelFirst(s1);
  end;
end;

function GetSubParam(const s: String; SubNum: Integer): String;
var
  LastPos: Integer;
begin
  LastPos := NPos('^', s, SubNum);
  if LastPos = 0 then
    LastPos := MaxInt
  else
    LastPos := LastPos - 1;
  Result := CopyLim(s, NPos('^', s, SubNum - 1) + 1, LastPos);
end;

{procedure THl7MessageParser.AssignSegment(const ASegment: TSegment; Index: Integer);
var
 i: integer;
begin
 with FSegments[Index] do
 begin
  SegmentType := ASegment.SegmentType;
  SetLength(SegmentRec, Length(ASegment.SegmentRec));
  for i := 0 to High(ASegment.SegmentRec) do
   SegmentRec[i] := ASegment.SegmentRec[i];
 end;
end;}

{function THl7MessageParser.GetSegments(Index: Integer): TSegment;
begin
 Result := FSegments[Index];
end;

procedure THl7MessageParser.SetSegments(Index: Integer; const Value: TSegment);
begin
 AssignSegment(Value, Index);
end;}

function THl7MessageParser.GetAETitle: String;
begin
  Result := GetValue(stOBR, 4, 3);
end;

function THl7MessageParser.GetBodyPart: String;
begin
  Result := GetValue(stOBR, 31, -1);
end;

function THl7MessageParser.GetPatientAddr1: String;
begin
  Result := '';
end;

function THl7MessageParser.GetPatientAddr2: String;
begin
  Result := '';
end;

function THl7MessageParser.GetPatientAddr3: String;
begin
  Result := '';
end;

function THl7MessageParser.GetPatientAddr4: String;
begin
  Result := '';
end;

function THl7MessageParser.GetPatientCategory: String;
begin
  Result := '';
end;

function THl7MessageParser.GetPatientCH: String;
begin
  Result := '';
end;

function THl7MessageParser.GetPatientDOB: String;
begin
  Result := HL7Date2RealDate(GetValue(stPID, 7, -1));
end;

function THl7MessageParser.GetPatientID: String;
begin
  Result := GetValue(stPID, 3, -1);
end;

function THl7MessageParser.GetPatientName: String;
begin
  Result := GetValue(stPID, 5, -1);
end;

function THl7MessageParser.GetPatientPolice: String;
begin
  Result := '';
end;

function THl7MessageParser.GetPatientSex: String;
begin
  Result := GetValue(stPID, 8, -1);
end;

function THl7MessageParser.GetPatientTitle: String;
begin
  Result := '';
end;

function THl7MessageParser.GetRequestPhys: String;
begin
  Result := GetValue(stPV1, 8, 2) + GetValue(stPV1, 8, 3);
end;

function THl7MessageParser.GetShedDate: String;
begin
  Result := HL7Date2RealDate(GetValue(stOBR, 6, -1));
end;

function THl7MessageParser.GetShedTime: String;
begin
  Result := HL7Date2RealTime(GetValue(stOBR, 6, -1));
end;

function THl7MessageParser.GetStudyDescr: String;
begin
  Result := GetValue(stOBR, 4, 2);
end;

function THl7MessageParser.GetStudyID: String;
begin
  Result := GetValue(stOBR, 4, 1);
  //SI
  if Result = '' then
    Result := GetValue(stORC, 4, -1);
end;

function THl7MessageParser.GetStudyRP: String;
begin
  Result := '';
end;

function THl7MessageParser.GetValue(ASegmentType: TSegmentType; ParamNum, ParamSubNum: Integer): String;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to Length(FSegments) - 1 do
    if FSegments[i].SegmentType = ASegmentType then
    begin
      //SI 21-06-2011 Так как параметры считаются от единицы,
      //нужно к максимальному индексу значений сегмента добавить единицу
      if ParamNum > High(FSegments[i].SegmentRec) + 1 then
        Break;
      if ParamSubNum = -1 then
        Result := FSegments[i].SegmentRec[ParamNum - 1]
      else
        Result := GetSubParam(FSegments[i].SegmentRec[ParamNum - 1], ParamSubNum);
      Break;
    end;
end;

procedure THl7MessageParser.ParseMessage(const SL: TStringList);
var
  i: Integer;
begin
  Finalize(FSegments);
  SetLength(FSegments, SL.Count);
  for i := 0 to SL.Count - 1 do
    ParseSegment(SL[i], FSegments[i]);
end;

procedure THl7MessageParser.ParseSegment(const s: String; var ASegment: TSegment);
var
  s1, s2: String;
begin
  s1 := s;
  {
  //SI 21-06-2011 Был пропушен сегмент 'OBX', из-за этого сегмент 'ZDS' просто не определялся,
  //превращаясь в сегмент 'OBX'
  ASegment.SegmentType := TSegmentType(MultMatch(Copy2SymbDel(s1, '|'),
                                                 ['MSH', 'PID', 'NTE', 'PV1', 'ORC', 'OBR', 'EVN'
                                                  ,'OBX' //SI это было пропущено
                                                  ,'ZDS'
                                                 ],
                                                  -1) + 1);
  }
  //SI 21-06-2011 Приведение результата MultMatch к TSegmentType заменен на
  //специализированную функцию StrToSegmentType.
  ASegment.SegmentType := StrToSegmentType(Copy2SymbDel(s1, '|'));
  DelFirst(s1);
  while s1 <> '' do
  begin
    s2 := Copy2SymbDel(s1, '|');
    SetLength(ASegment.SegmentRec, Length(ASegment.SegmentRec) + 1);
    ASegment.SegmentRec[High(ASegment.SegmentRec)] := s2;
    DelFirst(s1);
  end;
end;

{ THL7Encoder }

procedure THL7Encoder.AddMSHSeg;
begin
  FS := Format('MSH|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s', ['', '', '', '', '', '', '', '', '',
    '', '', '', '', '', '', '', '', '', '', '', '']);
  FSL.Add(FS);
end;

procedure THL7Encoder.AddPIDSeg;
begin
  FS := Format('PID|%s|%s|%s|%s|%s|%s|%s|%s', ['', '', '', '', '', '', '', '']);
  FSL.Add(FS);
end;

procedure THL7Encoder.AddOBRSeg;
begin
  FS := Format('OBR|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s', ['', '', '', '', '', '', '', '', '',
    '', '', '', '', '', '', '', '', '', '', '', '']);
  FSL.Add(FS);
end;

procedure THL7Encoder.AddOBXSeg;
begin
  FS := Format('OBX|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s', ['', '', '', '', '', '', '', '', '', '', '']);
  FSL.Add(FS);
end;

procedure THL7Encoder.EncodeResultMessage(const SL: TStringList);
begin
  FSL := SL;
  AddMSHSeg;
  AddPIDSeg;
  AddOBRSeg;
  AddOBXSeg;
end;

{ THl7MessageParserEx }

function THl7MessageParserEx.GetDicomUID: String;
begin
  Result := GetValue(stZDS, 1, 1);
end;

function THl7MessageParserEx.GetHIS_ID: string;
begin
  Result := GetValue(stOBR, 2, 3);
end;

function THl7MessageParserEx.GetStudyIsCancelled: Boolean;
begin
  Result := (GetValue(stORC, 1, -1) = 'CA') and (GetValue(stORC, 5, -1) = 'CA');
end;

function THl7MessageParserEx.GetStudyIsDone: Boolean;
begin
  Result := (GetValue(stORC, 1, -1) = 'SC') and (GetValue(stORC, 5, -1) = 'IP');
end;

function THl7MessageParserEx.GetStudyIsNew: Boolean;
begin
  Result := GetValue(stORC, 1, -1) = 'NW';
end;

function THl7MessageParserEx.GetStudyIsUpdate: Boolean;
begin
  Result := (GetValue(stORC, 1, -1) = 'XO') and (GetValue(stORC, 5, -1) = 'SC');
end;

end.
