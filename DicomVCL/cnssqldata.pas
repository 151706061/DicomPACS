{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit CnsSQLData;
interface

uses
  SysUtils, Classes, db, typinfo, controls;

type
  TCnsProfileRelate = class //user by field group
  public
    Profile: string;
    Value: string;
      Name: string;
    constructor Create(AName, AProfile, AValue: string);
  end;
  TCnsCollect = class
  private
    FItems: TThreadList;
    FName: string;
    FParent: TCnsCollect;
    FNodeParent: TCnsCollect;
    FNeedSort: Boolean;
    function GetCount: Integer;
  protected
    function GetItem(Index: Integer): TCnsCollect;
    function GetByName(AName: string): TCnsCollect;
  public
    constructor Create(AOwner: TCnsCollect; AName: string); virtual;
    destructor Destroy; override;
    function GetNames(AMode: Integer = 0): string; virtual;
    function GetText(APre: string): string; virtual;
    procedure Add(AItem: TCnsCollect);
    //    procedure Clear; virtual;
    procedure Delete(Index: Integer);
    property Count: Integer read GetCount;
    property Items[Index: Integer]: TCnsCollect read GetItem;
    property ItemByName[AName: string]: TCnsCollect read GetByName;
    property Name: string read FName write FName;
    property Parent: TCnsCollect read FParent write FParent;
    property NodeParent: TCnsCollect read FNodeParent write FNodeParent;
  end;
  TCnsProfileListRelate = class(TCnsCollect)
  protected
    FProfileList: TStringList;
  public
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    procedure AddProfile(AProfileName: string); virtual;
    function GetProfileList: string; virtual;
    function IsForProfile(AprofileName: string): Boolean;
    procedure Clear;
  end;

  TCnsReport = class(TCnsProfileListRelate)
  public
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    function GetText(APre: string): string; override;
  end;
  TCnsReportGroup = class(TCnsCollect)
  protected
    function GetItem(Index: Integer): TCnsReport;
    function GetByName(AName: string): TCnsReport;
  public
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    procedure Clear;
    function GetText(APre: string): string; override;
    function GetForProfile(AProfileName: string): string;
    property Items[Index: Integer]: TCnsReport read GetItem; default;
    property ItemByName[AName: string]: TCnsReport read GetByName;
  end;
  TCnsState = class(TCnsCollect)
  protected
  public
    Value: Integer;
    ColorString: string;
    IsReadOnly: Boolean;
    IsDisableFunction: Boolean;
    ReadOnlyFields: TStrings;
    DefaultValues: TStrings;
    DisableFunctions: TStrings;
    UserMode: Integer;
    UserField: string;
    OrderField: string;
    ClassByField: string;
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    function GetText(APre: string): string; override;
    procedure Clear;
  end;
  TCnsStateGroup = class(TCnsCollect)
  protected
    function GetItem(Index: Integer): TCnsState;
    function GetByName(AName: string): TCnsState;
  public
    function FindStateByValue(AValue: Integer): TCnsState;
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    procedure Clear;
    function GetText(APre: string): string; override;
    property Items[Index: Integer]: TCnsState read GetItem; default;
    property ItemByName[AName: string]: TCnsState read GetByName;
    function FindState(AName: string): Boolean;
    function IsMaxState(AName: string): Boolean;
  end;
  TCnsProfile = class(TCnsCollect)
  protected
  public
    Value: Integer;
    Data: TObject;
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    function GetText(APre: string): string; override;
    procedure Clear;
  end;
  TCnsProfileGroup = class(TCnsCollect)
  protected
    function GetItem(Index: Integer): TCnsProfile;
    function GetByName(AName: string): TCnsProfile;
  public
    function FindStateByValue(AValue: Integer): TCnsProfile;
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    procedure Clear;
    function GetText(APre: string): string; override;
    property Items[Index: Integer]: TCnsProfile read GetItem; default;
    property ItemByName[AName: string]: TCnsProfile read GetByName;
    function FindState(AName: string): Boolean;
  end;
  TCnsTableUserProfileState = class(TCnsCollect)
  public
    StateList: TStrings;
    IsAllState: Boolean;
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    procedure Clear;
    function GetText(APre: string): string; override;
    procedure AddState(AStateName: string);
  end;
  TCnsTableUser = class(TCnsCollect)
  protected
    function GetItem(Index: Integer): TCnsTableUserProfileState;
    function GetByName(AName: string): TCnsTableUserProfileState;
  public
    //    PermitList:TList;
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    procedure Clear;
    function GetText(APre: string): string; override;
    property Items[Index: Integer]: TCnsTableUserProfileState read GetItem;
    property ItemByName[AName: string]: TCnsTableUserProfileState read GetByName;
  end;
  TCnsTableUserGroup = class(TCnsCollect)
  protected
    function GetItem(Index: Integer): TCnsTableUser;
    function GetByName(AName: string): TCnsTableUser;
  public
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    procedure Clear;
    function GetText(APre: string): string; override;
    property Items[Index: Integer]: TCnsTableUser read GetItem; default;
    property ItemByName[AName: string]: TCnsTableUser read GetByName;
  end;

  TCnsQuery = class(TCnsProfileListRelate)
  protected
  public
    FieldNames: TStrings;
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    function GetText(APre: string): string; override;
    procedure Clear;
  end;
  TCnsQueryGroup = class(TCnsCollect)
  protected
    function GetItem(Index: Integer): TCnsQuery;
    function GetByName(AName: string): TCnsQuery;
  public
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    procedure Clear;
    function GetText(APre: string): string; override;
    function GetForProfile(AProfileName: string): string;
    property Items[Index: Integer]: TCnsQuery read GetItem; default;
    property ItemByName[AName: string]: TCnsQuery read GetByName;
  end;
  TCnsAnalyze = class(TCnsProfileListRelate)
  protected
  public
    RowMode: Integer;
    RowField: string;
    ColMode: Integer;
    ColField: string;
    sumMode: Integer;
    sumField: string;
    RangeFields: TStrings;
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    function GetText(APre: string): string; override;
    procedure Clear;
  end;
  TCnsAnalyzedGroup = class(TCnsCollect)
  protected
    function GetItem(Index: Integer): TCnsAnalyze;
    function GetByName(AName: string): TCnsAnalyze;
  public
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    procedure Clear;
    function GetText(APre: string): string; override;
    function GetForProfile(AProfileName: string): string;
    property Items[Index: Integer]: TCnsAnalyze read GetItem; default;
    property ItemByName[AName: string]: TCnsAnalyze read GetByName;
  end;
  //FieldGroup
  TCnsTable = class;
  TCnsDetailTable = class;
  TCnsFieldGroup = class(TCnsCollect)
  private
    FProfileRelateList: TList;
    FStateRelateList: TList;
  protected
    function GetItem(Index: Integer): TCnsFieldGroup;
    function GetByName(AName: string): TCnsFieldGroup;
  public
    StartPos: Integer;
    FControl: TControl;
    IsField: Boolean;

    IsDetail: Boolean;
    DetailTable: string;
    //    DetailKey: string;

    FieldLength: string;
    FieldType: Integer;

    DefaultValue: string;
    Prompt: string;
    Prompt1: string;
    Prompt2: string;
    Prompt3: string;
    Prompt4: string;
    Prompt5: string;
    Hint: string;
    ControlType: string;
    SelectList: Tstrings;
    PictureMask: string;
    IsNull: Boolean;
    ByName: string;
    OrderString: string;
    MinString: string;
    MaxString: string;
    CanQuery: Boolean;
    IsTreeField: Boolean;
    AutoRemmber: Boolean;
    WidthInGrid: Integer;
    WidthInDialog: Integer;
    WidthInMaster: Integer;
      Readonly: Boolean;

    LookupTable: string;
    LookupFieldName: string;
    LookupWhere: string;
    LookupDisplay: string;
    LookupTableDefine: TCnsTable;
    LookupBy: string;

    MasterDetailLink: TCnsDetailTable;

    ColorStrings: TStrings;
    ColorValues: TStrings;
    function getFieldText(PreText: string; WithParent: Boolean = true; ForLookup: Boolean = false): string;
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    function GetText(APre: string): string; override;
    function GetProfileRelate(AName, AProfile: string): string;
    procedure SetProfileRelate(Aname, AProfile, AValue: string);
    function GetStateRelate(AName, AStateName: string): string;
    procedure SetStateRelate(Aname, AStateName, AValue: string);
    property Items[Index: Integer]: TCnsFieldGroup read GetItem; default;
    property ItemByName[AName: string]: TCnsFieldGroup read GetByName;

    function CreateSQL(ADBType: Integer): string;
    function GetAllFields: string;
    function GetDisplayFields: string;
    function SelectSQL(AOpenType: Integer): string;
    function FindField(AFieldName: string): Boolean;
    function FindOrderField: string;
    function FindTreeField: string;
    function GetDefaultString: string;
    function FindNameField(AFieldName: string): TCnsFieldGroup;
    function FindNameField1(AFieldName: string): TCnsFieldGroup;
    function GetFieldType(ADBType: Integer): string;
    procedure Clear;
  end;
  //Table
  TCnsProgram = class(TCnsProfileListRelate)
  protected
  public
    Lines: string;
    ShortCut: string;
    Hint: string;
    ImageIndex: Integer;
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    function GetText(APre: string): string; override;
    procedure Clear;
  end;
  TCnsProgramGroup = class(TCnsCollect)
  private
  protected
    function GetItem(Index: Integer): TCnsProgram;
    function GetByName(AName: string): TCnsProgram;
  public
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    function GetText(APre: string): string; override;
    function GetForProfile(AProfileName: string): string;
    procedure Clear;
    property Items[Index: Integer]: TCnsProgram read GetItem; default;
    property ItemByName[AName: string]: TCnsProgram read GetByName;
  end;
  TCnsTableMode = (cnsIsLookupTable, cnsIsDetailTable, cnsIsNormalTable);
  TCnsTask = class;
  TCnsTable = class(TCnsCollect)
  private
    FCustomOrder: string;
    procedure SetCustomOrder(const Value: string);
  protected
    function GetItem(Index: Integer): TCnsFieldGroup;
    function GetByName(AName: string): TCnsFieldGroup;
  public
    HaveBeenCheckExists: Boolean;
    MultiDatabase: Boolean;
    //SafeUpdate: Boolean;

    StartPos: Integer;
    TableMode: TCnsTableMode;

    ReadOnlyState: Integer;
    UserField: string;

    GroupName: string;
    TableName: string;
    PluginName: string;
    AutoCreate: Boolean;
    NeedLock: Boolean;
    DatabaseName: string;
    TableOwner: string;
    PrimaryKey: TStrings;
    Trigger: string;

    LogExec: Boolean;
    LogTime: Boolean;
    CountFirst: Boolean;
    //    DetailTable: TStrings;
    FetchCount: Word;
    AnalyzeFields: TStrings;

    //    Profiles: TStrings;
    ProfileFieldName: string;

    Analyzes: TCnsAnalyzedGroup;
    Querys: TCnsQueryGroup;
    Scripts: TCnsProgramGroup;
    Reports: TCnsReportGroup;
    Details: TCnsTask;
    UserPermits: TCnsTableUserGroup;
    States: TCnsStateGroup;

    Profiles: TCnsProfileGroup;

    function GetAllFields: string;
    function GetDisplayFields: string;
    function FindOrderField: string;
    function FindTreeField: string;
    function OrderSQL(AStateName: string): string;
    function GetSimpleText(APre: string): string;
    function GetDefaultString: string;
    function GetFullText(APre: string): string;
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    property Items[Index: Integer]: TCnsFieldGroup read GetItem;
    property ItemByName[AName: string]: TCnsFieldGroup read GetByName;
    procedure Clear;

    function FindNameField(AFieldName: string): TCnsFieldGroup;
    function GetText(APre: string): string; override;
    function CreateSQL(ADBOwnername: string; ADBType: Integer): string;

    function CreateSQLEx(ADBOwnername: string; ADBType: Integer): string;

    function SelectSQL(AOpenType: Integer; ADBOwnername: string): string;
    function InsertSQL: string;
    function ModifySQL: string;
    function DeleteSQL: string;
    procedure AddPrimaryKey(AKeyName: string);
    function FindField(AFieldName: string): Boolean;
    function FindMasterTable: TCnsTable;
    function FindProfile(AProfileName: string): Boolean;

    function FromUserGroupToProfile(AUserGroup: string): string;
    function GetStatesForProfile(AUserGroup, AProfile: string): string;

    function SelectSQLForUser(AProfileName, AStateName, AWhereSQL, ADBOwnername: string): string;

    function TestFroUserGroup(AUserGroup: string): Boolean;

    function NotIsMaxState(AStateName: string): Boolean;

    property CustomOrder: string read FCustomOrder write SetCustomOrder;
  end;
  //TableGroup
  TCnsTableGroup = class(TCnsCollect)
  protected
    function GetItem(Index: Integer): TCnsTable;
    function GetByName(AName: string): TCnsTable;
  public
    function GetNames(AMode: Integer = 0): string; override;
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    procedure Clear;
    function GetText(APre: string): string; override;
    function GetForUserGroup(AUserGroup: string): string;
    property Items[Index: Integer]: TCnsTable read GetItem; default;
    property ItemByName[AName: string]: TCnsTable read GetByName;
  end;
  //TableGroupList
  {  TCnsTableGroupList = class(TCnsCollect)
    protected
      function GetItem(Index: Integer): TCnsTableGroup;
      function GetByName(AName: string): TCnsTableGroup;
    public
      constructor Create(AOwner: TCnsCollect; Aname: string); override;
      destructor Destroy; override;
      function GetText(APre: string): string; override;
      property Items[Index: Integer]: TCnsTableGroup read GetItem;
      property ItemByName[AName: string]: TCnsTableGroup read GetByName;
    end;
   }TCnsDetailTable = class(TCnsProfileListRelate)
  public
    DetailLink: TStrings;
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    procedure Clear;
  end;
  TCnsTask = class(TCnsCollect)
  protected
    function GetItem(Index: Integer): TCnsDetailTable;
    function GetByName(AName: string): TCnsDetailTable;
  public
    StartPos: Integer;
    GroupName: string;
    PluginName: string;
    DatasetName: string;
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    procedure Clear;
    function GetText(APre: string): string; override;
    function AddDetailTable(AName: string): TCnsDetailTable;
    function GetForProfile(AProfileName: string): string;
    property Items[Index: Integer]: TCnsDetailTable read GetItem;
    property ItemByName[AName: string]: TCnsDetailTable read GetByName;
  end;
  TCnsTaskGroup = class(TCnsCollect)
  protected
    function GetItem(Index: Integer): TCnsTask;
    function GetByName(AName: string): TCnsTask;
  public
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    procedure Clear;
    function GetText(APre: string): string; override;
    property Items[Index: Integer]: TCnsTask read GetItem;
    property ItemByName[AName: string]: TCnsTask read GetByName;
    function GetNames(AMode: Integer = 0): string; override;
  end;
  TCnsView = class(TCnsCollect)
  protected
  public
    StartPos: Integer;
    GroupName: string;
    PluginName: string;
    DatabaseName: string;
    FromSQL: string;
    WhereSQL: string;
    FieldList: TStrings;
    PromptList: TStrings;
    FetchCount: Word;
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    function GetText(APre: string): string; override;
    procedure Clear;
    function getSelectSQL(AWhereSQL: string): string;
  end;
  TCnsViewGroup = class(TCnsCollect)
  protected
    function GetItem(Index: Integer): TCnsView;
    function GetByName(AName: string): TCnsView;
  public
    constructor Create(AOwner: TCnsCollect; Aname: string); override;
    destructor Destroy; override;
    procedure Clear;
    function GetText(APre: string): string; override;
    property Items[Index: Integer]: TCnsView read GetItem;
    property ItemByName[AName: string]: TCnsView read GetByName;
    function GetNames(AMode: Integer = 0): string; override;
  end;
  TCnsSQLData = class
  public
    TableGroup: TCnsTableGroup;
    TaskGroup: TCnsTaskGroup;
    ViewGroup: TCnsViewGroup;
    GroupName: string;
    UserGroups: TStringList;
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
  end;
function strReplace(s, Find, Replace: string): string;
implementation

procedure TCnsSQLData.Clear;
begin
  TableGroup.Clear;
  TaskGroup.Clear;
  ViewGroup.Clear;
  UserGroups.Clear;
end;

destructor TCnsSQLData.Destroy;
begin
  Clear;
  TableGroup.Free;
  TaskGroup.Free;
  ViewGroup.Free;
  Usergroups.Free;
  inherited;
end;

constructor TCnsSQLData.Create;
begin
  TableGroup := TCnsTableGroup.Create(nil, '数据表');
  TaskGroup := TCnsTaskGroup.Create(nil, '任务');
  ViewGroup := TCnsViewGroup.Create(nil, 'VIEW');
  UserGroups := TStringList.Create;
end;

procedure TCnsProfileListRelate.Clear;
begin
  FProfileList.Clear;
  //  inherited Clear;
end;

function TCnsProfileListRelate.IsForProfile(AprofileName: string): Boolean;
var
  i: Integer;
begin
  if FProfileList.Count <= 0 then
  begin
    Result := true;
    exit;
  end;
  Result := false;
  for I := 0 to FProfileList.Count - 1 do // Iterate
  begin
    if FProfileList[i] = AProfileName then
    begin
      Result := true;
      exit;
    end;
  end; // for
end;

function TCnsProfileListRelate.GetProfileList: string;
var
  I: Integer;
begin
  Result := '';
  if (FProfileList.Count = 0) or
    ((FProfileList.Count > 0) and (UpperCase(FProfileList[0]) = 'ALL')) then
    Result := 'ALL'
  else
  begin
    Result := '( ';
    for I := 0 to FProfileList.Count - 1 do // Iterate
    begin
      if i <> 0 then
        Result := Result + ',';
      Result := Result + FProfileList[i];
    end; // for
    Result := Result + ' )';
  end;
end;

procedure TCnsProfileListRelate.AddProfile(AProfileName: string);
var
  t1: TCnsTable;
begin
  if Parent.Parent is TCnsTable then
  begin
    t1 := TCnsTable(Parent.Parent);
    if t1.FindProfile(AProfileName) then
      //      ShowMessage('添加到(' + Name + ')的组：' + AProfileName + '未定义')
      //    else
      FProfileList.Add(AProfileName);
  end
    //  else
    //    ShowMessage('Error in Add Profile');
end;

destructor TCnsProfileListRelate.Destroy;
begin
  FProfileList.Free;
  inherited Destroy;
end;

constructor TCnsProfileListRelate.Create(AOwner: TCnsCollect; Aname: string);
begin
  inherited Create(AOwner, AName);
  FProfileList := TStringList.Create;
end;

function TCnsReportGroup.GetForProfile(AProfileName: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to Count - 1 do // Iterate
  begin
    if Items[i].IsForProfile(AProfileName) then
      Result := Result + Items[i].Name + #13#10;
  end; // for
end;

function TCnsReportGroup.GetText(APre: string): string;
var
  i: Integer;
begin
  Result := Result + APre + 'REPORT {'#13#10;
  for i := 0 to Count - 1 do
  begin
    //    if i<>0 then
    //      Result := Result +' , ';
    Result := Result + Items[i].GetText(APre + '  ');
  end;
  Result := Result + Apre + '}'#13#10;
end;

destructor TCnsReportGroup.Destroy;
begin
  inherited Destroy;
end;

constructor TCnsReportGroup.Create(AOwner: TCnsCollect; Aname: string);
begin
  inherited Create(AOwner, AName);
end;

function TCnsReportGroup.GetByName(AName: string): TCnsReport;
begin
  Result := TCnsReport(inherited ItemByName[AName]);
end;

function TCnsReportGroup.GetItem(Index: Integer): TCnsReport;
begin
  Result := TCnsReport(inherited Items[Index]);
end;

function TCnsReport.GetText(APre: string): string;
begin
  Result := APre + Name + ' TO ' + GetProfileList + ' '#13#10;
end;

destructor TCnsReport.Destroy;
begin
  inherited Destroy;
end;

constructor TCnsReport.Create(AOwner: TCnsCollect; Aname: string);
begin
  inherited Create(AOwner, AName);
end;

procedure TCnsTableUserProfileState.AddState(AStateName: string);
begin
  if not (Parent.Parent.Parent is TCnsTable) then
  begin
    //    ShowMessage('Error in add state' + Parent.Parent.Parent.ClassName);
    exit;
  end;
  if not (AStateName <> 'ALL') and (not TCnsTable(Parent.Parent.Parent).States.FindState(AStateName)) then
    //    ShowMessage('添加组"' + Name + '"的状态:' + AStateName + '未定义')
    //  else
    StateList.Add(AStateName);
end;

function TCnsTableUserProfileState.GetText(APre: string): string;
var
  I: Integer;
begin
  Result := Name;
  if StateList.COunt > 0 then
  begin
    Result := Result + ' ( ';
    for I := 0 to StateList.Count - 1 do // Iterate
    begin
      if i <> 0 then
        Result := Result + ' , ';
      Result := Result + StateList[i];
    end; // for
    Result := Result + ' )';
  end;
end;

destructor TCnsTableUserProfileState.Destroy;
begin
  StateList.Free;
  inherited Destroy;
end;

constructor TCnsTableUserProfileState.Create(AOwner: TCnsCollect; Aname: string);
begin
  inherited Create(AOwner, AName);
  StateList := TStringList.Create;
  IsAllState := false;
end;

function TCnsTableUserGroup.GetByName(AName: string): TCnsTableUser;
begin
  Result := TCnsTableUser(inherited ItemByName[AName]);
end;

function TCnsTableUserGroup.GetText(APre: string): string;
var
  i: Integer;
begin
  Result := Result + APre + 'USERGROUP {'#13#10;
  for i := 0 to Count - 1 do
  begin
    //    if i<>0 then
    //      Result := Result +' , ';
    Result := Result + Items[i].GetText(APre + '  ');
  end;
  Result := Result + Apre + '}'#13#10;
end;

destructor TCnsTableUserGroup.Destroy;
begin
  inherited Destroy;
end;

constructor TCnsTableUserGroup.Create(AOwner: TCnsCollect; Aname: string);
begin
  inherited Create(AOwner, AName);

end;

function TCnsTableUserGroup.GetItem(Index: Integer): TCnsTableUser;
begin
  Result := TCnsTableUser(inherited Items[Index]);
end;

function TCnsTableUser.GetItem(Index: Integer): TCnsTableUserProfileState;
begin
  Result := TCnsTableUserProfileState(inherited Items[Index]);
end;

function TCnsTableUser.GetByName(AName: string): TCnsTableUserProfileState;
begin
  Result := TCnsTableUserProfileState(inherited ItemByName[AName]);
end;

function TCnsTableUser.GetText(APre: string): string;
var
  I: Integer;
begin
  Result := APre + Name + ' TO ';
  for I := 0 to Count - 1 do // Iterate
  begin
    if i <> 0 then
      Result := Result + ' , ';
    Result := Result + Items[i].GetText(APre);
  end; // for
  Result := Result + ';'#13#10;
end;

destructor TCnsTableUser.Destroy;
begin
  inherited Destroy;
end;

constructor TCnsTableUser.Create(AOwner: TCnsCollect; Aname: string);
begin
  inherited Create(AOwner, AName);
end;

function TCnsViewGroup.GetNames(AMode: Integer = 0): string;
var
  I: Integer;
  Strs: TStringList;
begin
  strs := TStringList.Create;
  for i := 0 to Count - 1 do // Iterate
  begin
    strs.Add(Items[i].GroupName + ',' + Items[i].Name);
  end; // for
  result := strs.Text;
  strs.Free;
end;

function TCnsViewGroup.GetText(APre: string): string;
var
  i: Integer;
  CurGroup: string;
begin
  //  k:=0;
  CurGroup := '';
  for i := 0 to Count - 1 do
  begin
    //    if Items[i].Parent = self then
    begin
      if CurGroup = '' then
      begin
        Result := APre + 'VIEWGROUP ' + Items[i].GroupName + '{'#13#10;
        CurGroup := Items[i].GroupName;
      end
      else
        if CurGroup <> Items[i].GroupName then
      begin
        Result := Result + Apre + '}(*VIEW组：' + CurGroup + '*)'#13#10 + APre + 'VIEWGROUP ' + Items[i].GroupName + '{'#13#10;
        CurGroup := Items[i].GroupName;
      end;
      Result := Result + Items[i].GetText(APre + '  ');
    end;
  end;
  if Count > 0 then
    Result := Result + Apre + '}(*VIEW组：' + Items[Count - 1].GroupName + '*)'#13#10;
end;

destructor TCnsViewGroup.Destroy;
begin
  inherited Destroy;
end;

constructor TCnsViewGroup.Create(AOwner: TCnsCollect; Aname: string);
begin
  inherited Create(AOwner, AName);
end;

function TCnsViewGroup.GetByName(AName: string): TCnsView;
begin
  Result := TCnsView(inherited ItemByName[AName]);
end;

function TCnsViewGroup.GetItem(Index: Integer): TCnsView;
begin
  Result := TCnsView(inherited Items[Index]);
end;

function TCnsView.getSelectSQL(AWhereSQL: string): string;
var
  I: Integer;
begin
  Result := 'SELECT ';
  for I := 0 to FieldList.Count - 1 do // Iterate
  begin
    if i <> 0 then
      Result := Result + ',';
    Result := Result + FieldList[i];
  end; // for
  Result := Result + ' from ' + FromSQL;
  if WhereSQL <> '' then
  begin
    Result := Result + ' WHERE ' + WhereSQL;
    if AWhereSQL <> '' then
      Result := Result + ' and ' + AWhereSQL;
  end
  else
    if AWhereSQL <> '' then
    Result := Result + ' WHERE ' + AWhereSQL;
end;

procedure TCnsView.Clear;
begin
  FieldList.Clear;
  PromptList.Clear;
  //  inherited Clear;
end;

function TCnsView.GetText(APre: string): string;
var
  I: Integer;
begin
  Result := APre + 'VIEW ' + Name + '{'#13#10;
  Result := Result + APre + '  PLUGIN IS ' + PluginName + #13#10;
  Result := Result + APre + '  DATABASE IS ' + DataBasename +
    ' FETCH = ' + IntToStr(FetchCount) + #13#10;
  for I := 0 to FieldList.Count - 1 do // Iterate
  begin
    Result := Result + APre + '    ' + FieldList[I] + '( ' +
      PromptList[i] + ' )'#13#10;
  end; // for
  Result := Result + APre + '  FROM "' + FromSQL + '"'#13#10;
  Result := Result + APre + '  WHERE "' + WhereSQL + '"'#13#10;
  Result := Result + APre + '}(*VIEW:' + Name + '*)'#13#10;
end;

destructor TCnsView.Destroy;
begin
  FieldList.Free;
  PromptList.Free;
  inherited Destroy;
end;

constructor TCnsView.Create(AOwner: TCnsCollect; Aname: string);
begin
  inherited Create(AOwner, AName);
  FetchCount := 0;
  GroupName := '';
  PluginName := '';
  DatabaseName := '';
  FromSQL := '';
  WhereSQL := '';
  FieldList := TStringList.Create;
  PromptList := TStringList.Create;
end;

procedure TCnsDetailTable.Clear;
begin
  DetailLink.Clear;
  inherited Clear;
end;

destructor TCnsDetailTable.Destroy;
begin
  DetailLink.Free;
  inherited Destroy;
end;

constructor TCnsDetailTable.Create(AOwner: TCnsCollect; Aname: string);
begin
  inherited Create(AOwner, Aname);
  DetailLink := TStringList.Create;
end;

function TCnsTaskGroup.GetNames(AMode: Integer = 0): string;
var
  I: Integer;
  Strs: TStringList;
begin
  strs := TStringList.Create;
  for i := 0 to Count - 1 do // Iterate
  begin
    strs.Add(Items[i].GroupName + ',' + Items[i].Name);
  end; // for
  result := strs.Text;
  strs.Free;
end;

function TCnsTaskGroup.GetText(APre: string): string;
var
  i: Integer;
  CurGroup: string;
begin
  CurGroup := '';
  for i := 0 to Count - 1 do
  begin
    //    if Items[i].Parent = self then
    begin
      if CurGroup = '' then
      begin
        Result := APre + 'TASKGROUP ' + Items[i].GroupName + '{'#13#10;
        CurGroup := Items[i].GroupName;
      end
      else
        if CurGroup <> Items[i].GroupName then
      begin
        Result := Result + Apre + '}'#13#10 + APre + 'TASKGROUP ' + Items[i].GroupName + '{'#13#10;
        CurGroup := Items[i].GroupName;
      end;
      Result := Result + Items[i].GetText(APre + '  ');
    end;
  end;
  if Count > 0 then
    Result := Result + Apre + '}(*任务组：' + Name + '*)'#13#10;
end;

destructor TCnsTaskGroup.Destroy;
begin
  inherited Destroy;
end;

constructor TCnsTaskGroup.Create(AOwner: TCnsCollect; Aname: string);
begin
  inherited Create(AOwner, AName);
end;

function TCnsTaskGroup.GetByName(AName: string): TCnsTask;
begin
  Result := TCnsTask(inherited ItemByName[AName]);
end;

function TCnsTaskGroup.GetItem(Index: Integer): TCnsTask;
begin
  Result := TCnsTask(inherited Items[Index]);
end;

function TCnsTask.GetForProfile(AProfileName: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to Count - 1 do // Iterate
  begin
    if Items[i].IsForProfile(AProfileName) then
      Result := Result + Items[i].Name + #13#10;
  end; // for
end;

function TCnsTask.GetItem(Index: Integer): TCnsDetailTable;
begin
  Result := TCnsDetailTable(inherited Items[Index]);
end;

function TCnsTask.GetByName(AName: string): TCnsDetailTable;
begin
  Result := TCnsDetailTable(inherited ItemByName[AName]);
end;

function TCnsTask.AddDetailTable(AName: string): TCnsDetailTable;
begin
  Result := TCnsDetailTable.Create(self, AName);
  Add(Result);
end;

function TCnsTask.GetText(APre: string): string;
var
  I, J: Integer;
  d1: TCnsDetailTable;
begin
  Result := APre + 'TASK ' + Name + '{'#13#10;
  //  Result := Result + APre + '  GROUP IS ' + GroupName + ','#13#10;
  Result := Result + APre + '  PLUGIN IS ' + PluginName + #13#10;
  Result := Result + APre + '  DATASET IS ' + Datasetname;
  for I := 0 to Count - 1 do // Iterate
  begin
    d1 := Items[I];
    Result := Result + APre + #13#10'  MASTER ' + d1.Name + ' BY ( ';
    for J := 0 to d1.DetailLink.Count - 1 do // Iterate
    begin
      Result := Result + d1.DetailLink[J];
    end; // for
    Result := Result + ' )';
  end; // for
  Result := Result + #13#10 + APre + '}(*任务' + Name + '*)'#13#10;
end;

destructor TCnsTask.Destroy;
begin
  inherited Destroy;
end;

constructor TCnsTask.Create(AOwner: TCnsCollect; Aname: string);
begin
  inherited Create(Aowner, AName);
end;

constructor TCnsProfileRelate.Create(AName, AProfile, AValue: string);
begin
  Name := AName;
  Profile := AProfile;
  Value := AValue;
end;

function TCnsProgramGroup.GetForProfile(AProfileName: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to Count - 1 do // Iterate
  begin
    if Items[i].IsForProfile(AProfileName) then
      Result := Result + Items[i].Name + #13#10;
  end; // for
end;

function TCnsProgramGroup.GetText(APre: string): string;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do // Iterate
  begin
    Result := Result + Items[i].getText(APre + '  ');
  end; // for
end;

destructor TCnsProgramGroup.Destroy;
begin
  inherited Destroy;
end;

constructor TCnsProgramGroup.Create(AOwner: TCnsCollect; Aname: string);
begin
  {$IFDEF DEBUGCEATE}
  SendDebug('Program Group:' + AName);
  {$ENDIF}
  inherited Create(AOwner, Aname);
end;

function TCnsProgramGroup.GetByName(AName: string): TCnsProgram;
begin
  Result := TCnsProgram(inherited ItemByName[AName]);
end;

function TCnsProgramGroup.GetItem(Index: Integer): TCnsProgram;
begin
  Result := TCnsProgram(inherited Items[Index]);
end;

procedure TCnsProgram.Clear;
begin
  Lines := '';
  inherited Clear;
end;

function TCnsProgram.GetText(APre: string): string;
begin
  Result := APre + 'PROGRAM ' + Name + ' TO ' + GetProfileList +
    '{' + ' KEY IS "' + ShortCut + '" ' +
    ' HINT IS "' + Hint + '" IMAGEINDEX = ' + IntToStr(ImageIndex) +
    Lines + '}'#13#10;
end;

destructor TCnsProgram.Destroy;
begin
  //  Lines.Free;
  inherited Destroy;
end;

constructor TCnsProgram.Create(AOwner: TCnsCollect; Aname: string);
begin
  inherited Create(AOwner, Aname);
  {$IFDEF DEBUGCEATE}
  SendDebug('Program:' + AName);
  {$ENDIF}
  Lines := '';
  ImageIndex := 0;
end;

function TCnsStateGroup.IsMaxState(AName: string): Boolean;
begin
  Result := Items[Count - 1].Name = AName;
end;

function TCnsStateGroup.GetText(APre: string): string;
var
  i: Integer;
begin
  Result := APre + '  STATE FIELD ' + Name + '{'#13#10;
  for I := 0 to Count - 1 do // Iterate
  begin
    Result := Result + Items[i].getText(APre + '    ');
  end; // for
  Result := Result + APre + '  }'#13#10;
end;

destructor TCnsStateGroup.Destroy;
begin
  Clear;
  inherited Destroy;
end;

constructor TCnsStateGroup.Create(AOwner: TCnsCollect; Aname: string);
begin
  {$IFDEF DEBUGCEATE}
  SendDebug('State Group:' + AName);
  {$ENDIF}
  inherited Create(AOwner, Aname);
end;

function TCnsStateGroup.GetByName(AName: string): TCnsState;
begin
  Result := TCnsState(inherited ItemByName[AName]);
end;

function TCnsStateGroup.GetItem(Index: Integer): TCnsState;
begin
  Result := TCnsState(inherited Items[Index]);
end;

function TCnsStateGroup.FindState(AName: string): Boolean;
begin
  Result := assigned(ItemByName[AName]);
end;

function TCnsStateGroup.FindStateByValue(AValue: Integer): TCnsState;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Count - 1 do // Iterate
  begin
    if Items[i].Value = AValue then
    begin
      Result := Items[i];
    end;
  end; // for
end;

procedure TCnsState.Clear;
begin
  DefaultValues.Clear;
  ReadOnlyFields.Clear;
  DisableFunctions.Clear;
  //  inherited Clear;
end;

function TCnsState.GetText(APre: string): string;
var
  I: Integer;
begin
  Result := APre + Name + '=' + IntToStr(Value);
  if ReadOnlyFields.Count > 0 then
  begin
    if IsReadOnly then
      Result := Result + #13#10 + APre + '  READONLY '
    else
      Result := Result + #13#10 + APre + '  WRITEONLY ';
    if ReadOnlyFields[0] = 'ALL' then
      Result := Result + ' ALL '
    else
    begin
      Result := Result + ' ( ';
      for I := 0 to ReadOnlyFields.Count - 1 do // Iterate
      begin
        if i > 0 then
          Result := Result + ',';
        Result := Result + ReadOnlyFields[i];
      end; // for
      Result := Result + ' )';
    end;
  end;
  if DisableFunctions.Count > 0 then
  begin
    if IsDisableFunction then
      Result := Result + #13#10 + APre + '  DISABLE ( '
    else
      Result := Result + #13#10 + APre + '  ENABLE ( ';
    for I := 0 to DisableFunctions.Count - 1 do // Iterate
    begin
      if i > 0 then
        Result := Result + ',';
      Result := Result + DisableFunctions[i];
    end; // for
    Result := Result + ' )';
  end;
  if ColorString <> '' then
  begin
    Result := Result + #13#10 + APre + '  COLOR ' + ColorString;
  end;
  case UserMode of //
    1: Result := Result + #13#10 + APre + '  FOR SELF ( ' + UserField + ' )';
    0: Result := Result + #13#10 + APre + '  FOR OWNER ( ' + UserField + ' )';
    2: Result := Result + #13#10 + APre + '  FOR ALL ';
  end; // case
  if OrderField <> '' then
    Result := Result + #13#10 + APre + '  ORDER BY ' + OrderField;
  if ClassByField <> '' then
    Result := Result + #13#10 + APre + '  CLASSIFY BY "' + ClassByField + '"';
  Result := Result + #13#10;
end;

destructor TCnsState.Destroy;
begin
  DefaultValues.free;
  ReadOnlyFields.Free;
  DisableFunctions.Free;
  inherited Destroy;
end;

constructor TCnsState.Create(AOwner: TCnsCollect; Aname: string);
begin
  inherited Create(AOwner, Aname);
  {$IFDEF DEBUGCEATE}
  SendDebug('State:' + AName);
  {$ENDIF}
  Value := 1;
  IsReadOnly := true;
  IsDisableFunction := true;
  ReadOnlyFields := TStringList.Create;
  DisableFunctions := TStringList.Create;
  DefaultValues := TStringList.create;
  UserMode := 2;
  UserField := '';
  OrderField := '';
  ClassByField := '';
end;

function TCnsQueryGroup.GetForProfile(AProfileName: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to Count - 1 do // Iterate
  begin
    if Items[i].IsForProfile(AProfileName) then
      Result := Result + Items[i].Name + #13#10;
  end; // for
end;

function TCnsQueryGroup.GetText(APre: string): string;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do // Iterate
  begin
    Result := Result + Items[i].getText(APre);
  end; // for
end;

destructor TCnsQueryGroup.Destroy;
begin
  inherited Destroy;
end;

constructor TCnsQueryGroup.Create(AOwner: TCnsCollect; Aname: string);
begin
  {$IFDEF DEBUGCEATE}
  SendDebug('Query Group:' + AName);
  {$ENDIF}
  inherited Create(AOwner, Aname);
end;

function TCnsQueryGroup.GetByName(AName: string): TCnsQuery;
begin
  Result := TCnsQuery(inherited ItemByName[AName]);
end;

function TCnsQueryGroup.GetItem(Index: Integer): TCnsQuery;
begin
  Result := TCnsQuery(inherited Items[Index]);
end;

procedure TCnsQuery.Clear;
begin
  FieldNames.Clear;
  inherited Clear;
end;

function TCnsQuery.GetText(APre: string): string;
var
  I: Integer;
begin
  Result := APre + '  QUERY COMBIN ' + Name + ' TO ' + GetProfileList + ' ( ';
  for I := 0 to FieldNames.Count - 1 do // Iterate
  begin
    if i > 0 then
      Result := Result + ',';
    Result := Result + FieldNames[i];
  end; // for
  Result := Result + ' )'#13#10;
end;

destructor TCnsQuery.Destroy;
begin
  FieldNames.Free;
  inherited Destroy;
end;

constructor TCnsQuery.Create(AOwner: TCnsCollect; Aname: string);
begin
  {$IFDEF DEBUGCEATE}
  SendDebug('Query:' + AName);
  {$ENDIF}
  inherited Create(AOwner, Aname);
  FieldNames := TStringList.Create;
end;

function TCnsAnalyzedGroup.GetForProfile(AProfileName: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to Count - 1 do // Iterate
  begin
    if Items[i].IsForProfile(AProfileName) then
      Result := Result + Items[i].Name + #13#10;
  end; // for
end;

function TCnsAnalyzedGroup.GetText(APre: string): string;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do // Iterate
  begin
    Result := Result + Items[i].getText(APre);
  end; // for
end;

destructor TCnsAnalyzedGroup.Destroy;
begin
  inherited Destroy;
end;

constructor TCnsAnalyzedGroup.Create(AOwner: TCnsCollect; Aname: string);
begin
  {$IFDEF DEBUGCEATE}
  SendDebug('Analyze Group:' + AName);
  {$ENDIF}
  inherited Create(AOwner, Aname);
end;

function TCnsAnalyzedGroup.GetByName(AName: string): TCnsAnalyze;
begin
  Result := TCnsAnalyze(inherited ItemByName[AName]);
end;

function TCnsAnalyzedGroup.GetItem(Index: Integer): TCnsAnalyze;
begin
  Result := TCnsAnalyze(inherited Items[Index]);
end;

procedure TCnsAnalyze.Clear;
begin
  RangeFields.Clear;
  inherited Clear;
end;

function TCnsAnalyze.GetText(APre: string): string;
var
  I: Integer;
begin
  Result := APre + '  ANALYZE ' + Name + ' TO ' + GetProfileList;
  if RowField <> '' then
  begin
    Result := Result + #13#10 + APre + '    ROW ';
    if RowMode = 0 then
      Result := Result + ' GROUP BY ' + RowField
    else
      Result := Result + ' SPERATE ' + RowField;
  end;
  if ColField <> '' then
  begin
    Result := Result + #13#10 + APre + '    COL';
    if ColMode = 0 then
      Result := Result + ' GROUP BY ' + ColField
    else
      Result := Result + ' SPERATE ON ' + ColField;
  end;
  if SumField <> '' then
  begin
    if SumMode = 0 then
      Result := Result + #13#10 + APre + '    SUM( ' + SumField + ' )'
    else
      if SumMode = 1 then
      Result := Result + #13#10 + APre + '    COUNT( ' + SumField + ' )'
    else
      Result := Result + #13#10 + APre + '    CAL( ' + SumField + ' )';
  end;
  if RangeFields.Count > 0 then
  begin
    Result := Result + #13#10 + APre + '    RANGE BY( ';
    for I := 0 to RangeFields.Count - 1 do // Iterate
    begin
      if i > 0 then
        Result := Result + ',';
      Result := Result + RangeFields[i];
    end; // for
    Result := Result + ' )';
  end;
  Result := Result + #13#10;
end;

destructor TCnsAnalyze.Destroy;
begin
  RangeFields.Free;
  inherited Destroy;
end;

constructor TCnsAnalyze.Create(AOwner: TCnsCollect; Aname: string);
begin
  inherited Create(AOwner, Aname);
  {$IFDEF DEBUGCEATE}
  SendDebug('Analyze:' + AName);
  {$ENDIF}
  RowMode := 0;
  RowField := '';
  ColMode := 0;
  ColField := '';
  sumMode := 0;
  sumField := '';
  RangeFields := TStringList.Create;
end;

function TCnsFieldGroup.GetDisplayFields: string;
var
  i: Integer;
begin
  if IsField then
  begin
    if WidthInGrid <> 0 then
    begin
      Result := Name + ';';
    end;
  end
  else
  begin
    Result := '';
    for i := 0 to Count - 1 do
    begin
      if (not IsDetail) then
      begin
        Result := Result + Items[i].GetDisplayFields;
      end;
    end;
  end;
end;

function TCnsFieldGroup.GetDefaultString: string;
var
  i: Integer;
begin
  if IsField then
  begin
    if DefaultValue <> '' then
      Result := Name + '=' + DefaultValue + #13#10
    else
      Result := '';
  end
  else
  begin
    Result := '';
    for i := 0 to Count - 1 do
    begin
      if (not IsDetail) and (Name <> '主表主健') then
      begin
        Result := Result + Items[i].GetDefaultString;
      end;
    end;
  end;
end;

function TCnsFieldGroup.FindOrderField: string;
var
  i: Integer;
  str1: string;
begin
  Result := '';
  if IsField then
  begin
    if OrderString <> '' then
      Result := Name;
  end
  else
  begin
    Result := '';
    for i := 0 to Count - 1 do
    begin
      if not IsDetail then
      begin
        str1 := Items[i].FindOrderField;
        if str1 <> '' then
          Result := Result + ',' + str1;
      end;
    end;
  end;
  if (Result <> '') and (Result[1] = ',') then
    Result := Copy(Result, 2, Length(Result) - 1);
end;

function TCnsFieldGroup.FindTreeField: string;
var
  i: Integer;
  str1: string;
begin
  Result := '';
  if IsField then
  begin
    if IsTreeField then
      Result := Name + #13#10;
  end
  else
  begin
    Result := '';
    for i := 0 to Count - 1 do
    begin
      if not IsDetail then
      begin
        str1 := Items[i].FindTreeField;
        if str1 <> '' then
          Result := Result + str1;
      end;
    end;
  end;
end;

procedure TCnsFieldGroup.Clear;
var
  I: Integer;
  list1: TList;
begin
  SelectList.Clear;
  for I := FProfileRelateList.Count - 1 downto 0 do // Iterate
  begin
    TCnsProfileRelate(FProfileRelateList[i]).Free;
  end; // for
  FProfileRelateList.Clear;

  List1 := FItems.LockList;
  try
    for I := List1.Count - 1 downto 0 do // Iterate
    begin
      TCnsFieldGroup(List1[i]).Clear;
      TCnsFieldGroup(List1[i]).Free;
    end; // for
    List1.Clear;
  finally
    FItems.UnlockList;
  end;
end;

function TCnsFieldGroup.FindNameField(AFieldName: string): TCnsFieldGroup;
var
  i: Integer;
begin
  if IsField then
  begin
    if (Name = AFieldName) or (Byname = AFieldname) then
    begin
      Result := self;
      exit;
    end;
  end
  else
  begin
    for i := 0 to Count - 1 do
    begin
      if not IsDetail then
      begin
        Result := Items[i].FindNameField(AFieldName);
        if assigned(Result) then
          exit;
      end;
    end;
  end;
  Result := nil;
end;

function TCnsFieldGroup.FindNameField1(AFieldName: string): TCnsFieldGroup;
var
  i: Integer;
begin
  if IsField then
  begin
    if (Name = AFieldName) or (Byname = AFieldname) then
    begin
      Result := self;
      exit;
    end;
  end
  else
  begin
    for i := 0 to Count - 1 do
    begin
      Result := Items[i].FindNameField(AFieldName);
      if assigned(Result) then
        exit;
    end;
  end;
  Result := nil;
end;

function TCnsFieldGroup.SelectSQL(AOpenType: Integer): string;
var
  i: Integer;
  str1: string;
begin
  if IsField then
    Result := Name
  else
  begin
    Result := '';
    for i := 0 to Count - 1 do
    begin
      if not IsDetail then
      begin
        str1 := Items[i].SelectSQL(AOpenType);
        if (str1 <> '') and (Result <> '') then
          Result := Result + ',' + str1
        else
          if (str1 <> '') then
          Result := str1;
      end;
    end;
  end;
end;

function TCnsFieldGroup.GetAllFields: string;
var
  i: Integer;
begin
  if IsField then
    Result := Name + #13#10
  else
  begin
    Result := '';
    for i := 0 to Count - 1 do
    begin
      if not IsDetail then
      begin
        Result := Result + Items[i].GetAllFields;
      end;
    end;
  end;
end;

function TCnsFieldGroup.GetFieldType(ADBType: Integer): string;
begin
  case TFieldType(FieldType) of //
    ftSmallint, ftInteger, ftWord, ftAutoInc: Result := 'INTEGER';
    ftBoolean: Result := 'BOOLEAN';
    ftDate: Result := 'DATE';
    ftTime: Result := 'TIME';
    ftDateTime: Result := 'TIMESTAMP';
    ftBytes: Result := 'BYTE';
    ftMemo: Result := 'MEMO';
    ftBlob: Result := 'BLOB';
    ftString: Result := 'VARCHAR'; //change 2009-7-24 jiawen
    //    15: Result := 'VARCHAR';
    ftFloat, ftCurrency: Result := 'DECIMAL';
  else
    Result := GetEnumName(TypeInfo(TFieldType), FieldType);
  end; // case
  if not (TFieldType(FieldType) in [ftMemo, ftBlob]) then
  begin
    if FieldLength <> '' then
    begin
      Result := Result + '( ' + FieldLength + ' )';
    end;
  end;
  if ADBType > 0 then
    case ADBType - 1 of
      7, 8: //interbase
        begin
          case TFieldType(FieldType) of //
            ftMemo: Result := 'BLOB(65535,1)';
            ftBlob: Result := 'BLOB(65535,0)';
            ftDateTime: Result := 'TIMESTAMP';
          end;
        end;
      1: //stOracle
        begin
          case TFieldType(FieldType) of //
            ftFloat, ftCurrency: Result := 'NUMBER(15,2)';
            ftSmallint, ftInteger, ftWord, ftAutoInc: Result := 'NUMBER(10)';
            ftDate,
              ftTime,
              ftDateTime: Result := 'DATE';
            ftMemo: Result := 'VARCHAR(2048)'; //CLOD
            ftBlob: Result := 'BLOB';
          end;
        end;
      //    stSQLBase,        stSQLServer,        stSybase
      0, 2, 3:
        begin
          case TFieldType(FieldType) of //
            ftDate,
              ftTime,
              ftDateTime: Result := 'DATETIME';
            ftMemo: Result := 'TEXT';
            ftBlob: Result := 'IMAGE';
          end;
        end;
      //   MySQL
      9:
        begin
          case TFieldType(FieldType) of //
            ftDate,
              ftTime,
              ftDateTime: Result := 'DATETIME';
            ftMemo: Result := 'TEXT';
            ftBlob: Result := 'BLOB';
          end;
        end;
    end;
end;

function TCnsFieldGroup.FindField(AFieldName: string): Boolean;
var
  i: Integer;
begin
  if IsField then
    Result := Name = AFieldName
  else
  begin
    Result := false;
    for i := 0 to Count - 1 do
    begin
      if not IsDetail then
      begin
        Result := Items[i].FindField(AFieldName);
        if Result then
          exit;
      end;
    end;
  end;
end;

function TCnsFieldGroup.CreateSQL(ADBType: Integer): string;
  function getFieldText: string;
  begin
    Result := '  ' + Name + ' ' + GetFieldType(ADBType);
    if not IsNULL then
      Result := Result + ' NOT NULL'
    else
      if ADBType = 3 then
      Result := Result + ' NULL';
    Result := Result + ','#13#10;
  end;
var
  i: Integer;
begin
  if IsField then
    Result := GetFieldText
  else
  begin
    Result := '';
    for i := 0 to Count - 1 do
    begin
      if not IsDetail then
        Result := Result + Items[i].CreateSQL(ADBType);
    end;
  end;
end;

function TCnsFieldGroup.GetProfileRelate(AName, AProfile: string): string;
var
  I: Integer;
  p1: TCnsProfileRelate;
begin
  Result := '';
  for I := 0 to FProfileRelateList.Count - 1 do // Iterate
  begin
    p1 := TCnsProfileRelate(FProfileRelateList[i]);
    if (p1.Name = AName) and (p1.Profile = Aprofile) then
    begin
      Result := p1.Value;
      exit;
    end;
  end; // for
end;

procedure TCnsFieldGroup.SetProfileRelate(Aname, AProfile, AValue: string);
var
  p1: TCnsProfileRelate;
begin
  p1 := TCnsProfileRelate.Create(AName, AProfile, Avalue);
  FProfileRelateList.Add(p1);
end;

function TCnsFieldGroup.GetStateRelate(AName, AStateName: string): string;
var
  I: Integer;
  p1: TCnsProfileRelate;
begin
  Result := '';
  for I := 0 to FStateRelateList.Count - 1 do // Iterate
  begin
    p1 := TCnsProfileRelate(FStateRelateList[i]);
    if (p1.Name = AName) and (p1.Profile = AStateName) then
    begin
      Result := p1.Value;
      exit;
    end;
  end; // for
end;

procedure TCnsFieldGroup.SetStateRelate(Aname, AStateName, AValue: string);
var
  p1: TCnsProfileRelate;
begin
  p1 := TCnsProfileRelate.Create(AName, AStateName, Avalue);
  FStateRelateList.Add(p1);
end;

function TCnsFieldGroup.getFieldText(PreText: string; WithParent: Boolean = true; ForLookup: Boolean = false): string;
var
  I: Integer;
  //  str1:string;
  p1: TCnsProfileRelate;
begin
  if WithParent then
    Result := PreText + Name + ' ' + GetFieldType(0) + #13#10
  else
    Result := ' ' + GetFieldType(0) + #13#10;
  if not IsNull then
    Result := Result + PreText + '  NOT NULL'#13#10;
  if CanQuery then
    Result := Result + PreText + '  CAN QUERY'#13#10;
  if IsTreeField then
    Result := Result + PreText + '  TREEFIELD'#13#10;
  if AutoRemmber then
    Result := Result + PreText + '  AUTO REMMBER'#13#10;
  if Readonly then
    Result := Result + PreText + '  READONLY'#13#10;
  for I := 0 to FProfileRelateList.Count - 1 do // Iterate
  begin
    p1 := TCnsProfileRelate(FProfileRelateList[i]);
    if (p1.Name = 'DEFAULT') then
    begin
      Result := Result + PreText + '  DEFAULT "' + p1.Value + '" ON PROFILE ' + p1.Profile + #13#10
    end;
  end; // for
  if DefaultValue <> '' then
    Result := Result + PreText + '  DEFAULT "' + DefaultValue + '"'#13#10;
  //  else
  //    Result := Result + PreText + '  DEFAULT ""'#13#10;
  for I := 0 to FProfileRelateList.Count - 1 do // Iterate
  begin
    p1 := TCnsProfileRelate(FProfileRelateList[i]);
    if (p1.Name = 'PROMPT') then
    begin
      Result := Result + PreText + '  PROMPT "' + p1.Value + '" ON PROFILE ' + p1.Profile + #13#10
    end;
  end; // for
  if Prompt1 <> '' then
    Result := Result + PreText + '  PROMPT1 "' + Prompt1 + '"'#13#10;
  if Prompt2 <> '' then
    Result := Result + PreText + '  PROMPT2 "' + Prompt2 + '"'#13#10;
  if Prompt3 <> '' then
    Result := Result + PreText + '  PROMPT3 "' + Prompt3 + '"'#13#10;
  if Prompt4 <> '' then
    Result := Result + PreText + '  PROMPT4 "' + Prompt4 + '"'#13#10;
  if Prompt5 <> '' then
    Result := Result + PreText + '  PROMPT5 "' + Prompt5 + '"'#13#10;

  if Prompt <> '' then
    Result := Result + PreText + '  PROMPT "' + Prompt + '"'#13#10
  else
    Result := Result + PreText + '  PROMPT "' + Name + '"'#13#10;
  for I := 0 to FProfileRelateList.Count - 1 do // Iterate
  begin
    p1 := TCnsProfileRelate(FProfileRelateList[i]);
    if (p1.Name = 'HINT') then
    begin
      Result := Result + PreText + '  HINT "' + p1.Value + '" ON PROFILE ' + p1.Profile + #13#10
    end;
  end; // for
  if Hint <> '' then
    Result := Result + PreText + '  HINT "' + Hint + '"'#13#10;
  //  else
  //    Result := Result + PreText + '  HINT ""'#13#10;

  if ByName <> '' then
    Result := Result + PreText + '  BYNAME "' + ByName + '"'#13#10;

  if OrderString <> '' then
    Result := Result + PreText + '  ' + OrderString + #13#10;
  if not ForLookup then
  begin
    if WidthInGrid >= 0 then
      Result := Result + PreText + '  WIDTHINGRID ' + IntToStr(WidthInGrid) + #13#10;
    if WidthInDialog >= 0 then
      Result := Result + PreText + '  WIDTHINDIALOG ' + IntToStr(WidthInDialog) + #13#10
    else
      if WidthInGrid >= 0 then
      Result := Result + PreText + '  WIDTHINDIALOG ' + IntToStr(WidthInGrid) + #13#10;
    if WIDTHINMASTER >= 0 then
      Result := Result + PreText + '  WIDTHINMASTER ' + IntToStr(WIDTHINMASTER) + #13#10;
  end;
  if ControlType <> '' then
    Result := Result + PreText + '  CONTROL ' + ControlType + #13#10;

  if WithParent then
    if LookupTable <> '' then
    begin
      //      str1 := Copy(LookupFieldName,Pos('=',LookupFieldName)+1,Length(LookupFieldName));
      if not assigned(LookupTableDefine) then
        Result := Result + PreText + '  LOOKUP ' + LookupFieldName + ' OF ' +
          LookupTable
      else
        Result := Result + PreText + '  LOOKUP ' + LookupFieldName + ' OF '#13#10 +
          LookupTableDefine.GetText(PreText + '  ');
      if LookupWhere = 'PROFILE' then
      begin
        Result := Result + '  WHERE SAME PROFILE';
      end
      else
        if LookupWhere <> '' then
      begin
        Result := Result + ' WHERE  "' + LookupWhere + '"';
      end;
      if LookupBy <> '' then
      begin
        if not assigned(LookupTableDefine) then
          Result := Result + #13#10;
        Result := Result + PreText + '  BY "' + LookupBy + '"';
        if assigned(LookupTableDefine) then
          Result := Result + #13#10;
      end;
      if LookupDisplay <> '' then
        Result := Result + PreText + '  DISPLAY "' + LookupDisplay + '"';

      if not assigned(LookupTableDefine) then
        Result := Result + #13#10;
    end;
  if SelectList.Count > 0 then
  begin
    Result := Result + PreText + '  VALUES ( ';
    for I := 0 to SelectList.Count - 1 do // Iterate
    begin
      if i <> 0 then
        Result := Result + ',';
      Result := Result + '"' + SelectList[i] + '"';
    end; // for
    Result := Result + ' )'#13#10;
  end;
  if ColorStrings.Count > 0 then
  begin
    Result := Result + PreText + '  COLOR TABLE ( ';
    for I := 0 to ColorStrings.Count - 1 do // Iterate
    begin
      if i <> 0 then
        Result := Result + ',';
      Result := Result + '"' + ColorValues[i] + '"=' + ColorStrings[i];
    end; // for
    Result := Result + ' )'#13#10;
  end;
end;

function TCnsFieldGroup.GetText(APre: string): string;
var
  i: Integer;
begin
  if IsField then
    Result := GetFieldText(APre)
  else
  begin
    Result := APre + 'GROUP ' + Name + '{';
    for i := 0 to Count - 1 do
    begin
      if i <> 0 then
        Result := Result + APre + '  ,'#13#10
      else
        Result := Result + APre + #13#10;
      Result := Result + Items[i].GetText(APre + '  ');
    end;
    Result := Result + APre + '}'#13#10;
    if LookupTable <> '' then
    begin
      if not assigned(LookupTableDefine) then
        Result := Result + APre + 'LOOKUP ' + LookupFieldName + ' OF ' +
          LookupTable
      else
        Result := Result + APre + 'LOOKUP ' + LookupFieldName + ' OF '#13#10 +
          LookupTableDefine.GetText(APre + '  ');
      if LookupWhere = 'PROFILE' then
      begin
        Result := Result + 'WHERE SAME PROFILE';
      end
      else
        if LookupWhere <> '' then
      begin
        Result := Result + ' WHERE  "' + LookupWhere + '"';
      end;
      if not assigned(LookupTableDefine) then
        Result := Result + #13#10;
    end;
    if IsDetail then
    begin
      Result := Result + APre + 'DETAIL<' + DetailTable +
        '( ' + LookupTableDefine.TableName + ' )'#13#10 +
        APre + '  TO ' + MasterDetailLink.GetProfileList + #13#10 +
        APre + '  KEY IS ( ';
      for I := 0 to LookupTableDefine.PrimaryKey.Count - 1 do // Iterate
      begin
        if i > 0 then
          Result := Result + ',';
        Result := Result + LookupTableDefine.PrimaryKey[i];
      end; // for
      Result := Result + ' )';
      Result := Result + ' READONLY AFTER ' + IntToStr(LookupTableDefine.ReadOnlyState);
      Result := Result + '>'#13#10;
    end;
  end;
end;

function TCnsFieldGroup.GetItem(Index: Integer): TCnsFieldGroup;
begin
  Result := TCnsFieldGroup(inherited Items[Index]);
end;

function TCnsFieldGroup.GetByName(AName: string): TCnsFieldGroup;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to GetCount - 1 do // Iterate
  begin
    if (Items[i].Name = AName) or (Items[i].ByName = AName) then
    begin
      Result := Items[i];
      exit;
    end;
  end; // for    }
  {begin
    Result := TCnsFieldGroup(inherited ItemByName[AName]);//}
end;

constructor TCnsFieldGroup.Create(AOwner: TCnsCollect; Aname: string);
begin
  {$IFDEF DEBUGCEATE}
  SendDebug('Field Group:' + AName);
  {$ENDIF}
  inherited Create(AOwner, Aname);
  FControl := nil;
  ReadOnly := false;
  MasterDetailLink := nil;
  FProfileRelateList := TList.Create;
  IsField := false;

  LookupTableDefine := nil;

  IsDetail := false;
  DetailTable := '';

  FieldLength := '';
  FieldType := -1;
  DefaultValue := '';
  Prompt := '';
  Prompt1 := '';
  Prompt2 := '';
  Prompt3 := '';
  Prompt4 := '';
  Prompt5 := '';
  Hint := '';
  ControlType := '';
  SelectList := TstringList.Create;
  LookupTable := '';
  LookupFieldName := '';
  LookupWhere := '';
  LookupDisplay := '';
  PictureMask := '';
  IsNull := true;
  OrderString := '';
  ByName := '';
  MinString := '';
  MaxString := '';
  CanQuery := false;
  IsTreeField := false;
  AutoRemmber := false;
  WidthInGrid := -1;
  WidthInDialog := -1;
  WIDTHINMASTER := -1;
  ColorStrings := TStringList.Create;
  ColorValues := TStringList.Create;
end;

destructor TCnsFieldGroup.Destroy;
var
  I: Integer;
begin
  ColorStrings.Free;
  ColorValues.Free;
  SelectList.Free;
  for I := FProfileRelateList.Count - 1 downto 0 do // Iterate
  begin
    TCnsProfileRelate(FProfileRelateList[i]).Free;
  end; // for
  FProfileRelateList.Free;
  inherited Destroy;
end;

{ TODO : function TCnsTable.GetStatesForProfile(AProfile:string):string; }

function TCnsTable.GetDisplayFields: string;
var
  i: Integer;
  f1: TCnsFieldGroup;
  //  str1: string;
//  t1: TCnsTable;
begin
  Result := '';
  //  if Count <= 0 then exit;
  if Parent is TCnsFieldGroup then
  begin
    f1 := (Parent as TCnsFieldGroup);
    if f1.IsField then
    begin
      if f1.WidthInGrid <> 0 then
        Result := Result + f1.LookupFieldName + ';';
    end
    else
      for i := 0 to Parent.Count - 1 do
      begin
        Result := Result + f1.Items[i].GetDisplayFields;
      end;
  end;
  for i := 0 to Count - 1 do
  begin
    Result := Result + Items[i].GetDisplayFields;
  end;
  System.Delete(Result, Length(Result), 1);
end;

function TCnsTable.NotIsMaxState(AStateName: string): Boolean;
begin
  Result := not States.IsMaxState(AStateName);
end;

function TCnsTable.GetStatesForProfile(AUserGroup, AProfile: string): string;
  procedure AddStateName(astrs: TStrings; AName: string);
  var
    strs1: TStringList;
    II, kk: Integer;
  begin
    Strs1 := TStringList.Create;
    try
      strs1.Text := AName;
      if strs1.Count <= 0 then
        exit;
      for II := 0 to strs1.Count - 1 do // Iterate
      begin
        for kk := 0 to astrs.Count - 1 do
        begin
          if astrs[kk] = strs1[ii] then
            exit;
        end;
        astrs.Add(strs1[ii]);
      end; // for
    finally
      strs1.Free;
    end;
  end;
var
  I: Integer;
  UserGroup1: TStringList;
  u1: TCnsTableUser;
  ups1: TCnsTableUserProfileState;
  strs: TStringList;
begin
  Result := '';
  if AUserGroup = '' then
  begin
    exit;
  end;
  if UserPermits.Count <= 0 then
  begin
    exit;
  end;
  UserGroup1 := TStringList.Create;
  strs := TStringList.Create;
  try
    UserGroup1.Text := AUserGroup;
    for I := 0 to UserGroup1.Count - 1 do // Iterate
    begin
      u1 := UserPermits.ItemByName[UserGroup1[i]];
      if assigned(u1) then
      begin
        ups1 := u1.ItemByName['ALL'];
        if not assigned(ups1) then
          ups1 := u1.ItemByName[AProfile];
        if assigned(ups1) then
        begin
          if ups1.StateList.Count <= 0 then
            AddStateName(strs, States.GetNames)
          else
            AddStateName(strs, ups1.StateList.Text);
        end;
      end;
    end; // for
    Result := Strs.Text;
  finally
    UserGroup1.Free;
    strs.Free;
  end;
end;

function TCnsTable.GetDefaultString: string;
var
  i: Integer;
  f1: TCnsFieldGroup;
  strs1: TStrings;
begin
  Result := '';
  if Count <= 0 then
    exit;
  strs1 := TStringList.Create;
  try
    if Parent is TCnsFieldGroup then
    begin
      f1 := (Parent as TCnsFieldGroup);
      if f1.IsField then
      begin
        if f1.DefaultValue <> '' then
        begin
          strs1.Text := Result;
          strs1.Values[f1.Name] := f1.DefaultValue;
          Result := Strs1.Text;
          //        Result := Result + f1.Name+'='+f1.DefaultValue+#13#10;
        end;
      end
      else
      begin
        for i := 0 to f1.Count - 1 do
        begin
          Result := Result + f1.Items[i].GetDefaultString;
        end;
      end;
    end;
    for i := 0 to Count - 1 do
    begin
      Result := Result + Items[i].GetDefaultString;
    end;
  finally
    strs1.Free;
  end;
end;

procedure TCnsTable.Clear;
var
  i: integer;
  list1: TList;
begin
  if assigned(Reports) then
  begin
    Reports.Clear;
    Scripts.Clear;
    Analyzes.Clear;
    Querys.Clear;
    UserPermits.Clear;
    if assigned(States) then
      States.Clear;

    PrimaryKey.Clear;
    Profiles.Clear;
    Trigger := '';
    Details.Clear;
    AnalyzeFields.Clear;
  end;
  list1 := FItems.LockList;
  try
    for I := list1.Count - 1 downto 0 do // Iterate
    begin
      TCnsFieldGroup(list1[i]).Clear;
      TCnsFieldGroup(list1[i]).Free;
    end; // for
    list1.Clear;
  finally
    Fitems.UnlockList;
  end;
  //  inherited Clear;
end;

function TCnsTable.SelectSQLForUser(AProfileName, AStateName, AWhereSQL, ADBOwnername: string): string;
var
  WSQL: string;
  s1: TCnsState;
begin
  Result := SelectSQL(1, ADBOwnername);
  WSql := '';
  if AWhereSQL <> '' then
    WSql := ' WHERE ' + AWhereSQL;
  if (AProfileName <> '') and (AProfileName <> 'ANY') and (ProfileFieldName <> '') then
  begin
    if Wsql <> '' then
      wsql := wsql + ' and '
    else
      wsql := ' WHERE ';
    wsql := wsql + ProfileFieldName + '=' + IntToStr(Profiles.ItemByName[AProfileName].Value) + ' '
  end;
  if assigned(States) and (AStateName <> '') and (AStateName <> 'ANY') then
  begin
    s1 := States.ItemByName[AStateName];
    if assigned(s1) then
    begin
      if Wsql <> '' then
        wsql := wsql + ' and '
      else
        wsql := ' WHERE ';
      wsql := wsql + States.Name + '=' + IntToStr(s1.Value);
    end;
  end;
  Result := Result + ' ' + wsql + ' ' + OrderSQL(AStateName);
end;

function TCnsTable.FromUserGroupToProfile(AUserGroup: string): string;
  procedure AddProfileName(astrs: TStrings; AName: string);
  var
    strs1: TStringList;
    II, kk: Integer;
  begin
    Strs1 := TStringList.Create;
    try
      strs1.Text := AName;
      if strs1.Count <= 0 then
        exit;
      for II := 0 to strs1.Count - 1 do // Iterate
      begin
        if strs1[ii] = 'ALL' then
        begin
          for kk := 0 to Profiles.Count - 1 do
          begin
            AddProfileName(astrs, Profiles[kk].Name);
          end;
        end
        else
        begin
          for kk := 0 to astrs.Count - 1 do
          begin
            if astrs[kk] = strs1[ii] then
              exit;
          end;
          astrs.Add(strs1[ii]);
        end;
      end; // for
    finally
      strs1.Free;
    end;
  end;
var
  I: Integer;
  UserGroup1: TStringList;
  u1: TCnsTableUser;
  strs: TStringList;
begin
  Result := '';
  if AUserGroup = '' then
  begin
    exit;
  end;
  if UserPermits.Count <= 0 then
  begin
    exit;
  end;
  UserGroup1 := TStringList.Create;
  strs := TStringList.Create;
  try
    UserGroup1.Text := AUserGroup;
    for I := 0 to UserGroup1.Count - 1 do // Iterate
    begin
      u1 := UserPermits.ItemByName[UserGroup1[i]];
      if assigned(u1) then
      begin
        AddProfileName(strs, u1.GetNames);
      end;
    end; // for
    Result := Strs.Text;
  finally
    UserGroup1.Free;
    strs.Free;
  end;
end;

function TCnsTable.TestFroUserGroup(AUserGroup: string): Boolean;
var
  I: Integer;
  UserGroup1: TStringList;
begin
  result := false;
  if AUserGroup = '' then
  begin
    exit;
  end;
  if UserPermits.Count <= 0 then
  begin
    result := true;
    exit;
  end;
  UserGroup1 := TStringList.Create;
  try
    UserGroup1.Text := AUserGroup;
    for I := 0 to UserGroup1.Count - 1 do // Iterate
    begin
      if assigned(UserPermits.ItemByName[UserGroup1[i]]) then
      begin
        Result := true;
        exit;
      end;
    end; // for
  finally
    UserGroup1.Free;
  end;
end;

function TCnsTable.FindProfile(AProfileName: string): Boolean;
var
  i: Integer;
begin
  Result := false;
  for I := 0 to Profiles.Count - 1 do // Iterate
  begin
    if Profiles[i].Name = AProfileName then
    begin
      Result := true;
      exit;
    end;
  end; // for
end;

function TCnsTable.FindNameField(AFieldName: string): TCnsFieldGroup;
var
  i: Integer;
  f1: TCnsFieldGroup;
begin
  if Parent is TCnsFieldGroup then
  begin
    f1 := (Parent as TCnsFieldGroup);
    Result := f1.FindNameField1(AFieldName);
    if assigned(Result) then
      exit;
  end;
  for i := 0 to Count - 1 do
  begin
    Result := Items[i].FindNameField(AFieldName);
    if assigned(Result) then
      exit;
  end;
  Result := nil;
end;

function TCnsTable.FindMasterTable: TCnsTable;
var
  tx1: TCnsCollect;
begin
  if TableMode = cnsIsDetailTable then
  begin
    tx1 := Parent;
    while not (tx1 is TCnsTable) do
      tx1 := tx1.Parent;
    Result := TCnsTable(tx1);
  end
  else
    Result := nil;
end;

function TCnsTable.InsertSQL: string;
//var
 // i: Integer;
//  f1: TCnsFieldGroup;
//  str1, strx1, strx2: string;
//  t1: TCnsTable;
begin

end;

function TCnsTable.ModifySQL: string;
begin

end;

function TCnsTable.DeleteSQL: string;
begin

end;

function TCnsTable.SelectSQL(AOpenType: Integer; ADBOwnername: string): string;
var
  i: Integer;
  f1: TCnsFieldGroup;
  str1: string;
  t1: TCnsTable;
begin
  //  Result := 'SELECT * FROM ' + TableName;
  Result := '';
  //  if Count <= 0 then exit;
  if Parent is TCnsFieldGroup then
  begin
    f1 := (Parent as TCnsFieldGroup);
    if f1.IsField then
    begin
      if Result <> '' then
        Result := Result + ',';
      Result := Result + f1.LookupFieldName;
    end
    else
      for i := 0 to Parent.Count - 1 do
      begin
        str1 := f1.Items[i].SelectSQL(AOpenType);
        if (str1 <> '') and (Result <> '') then
          Result := Result + ',' + str1
        else
          if (str1 <> '') then
          Result := str1;
      end;
  end;
  for i := 0 to Count - 1 do
  begin
    str1 := Items[i].SelectSQL(AOpenType);
    if (str1 <> '') and (Result <> '') then
      Result := Result + ',' + str1
    else
      if (str1 <> '') then
      Result := str1;
  end;
  if TableMode = cnsIsDetailTable then
  begin
    t1 := FindMasterTable;
    if assigned(t1) then
    begin
      for I := 0 to t1.PrimaryKey.Count - 1 do // Iterate
      begin
        if (i <> (t1.PrimaryKey.Count - 1)) or (i = 0) then
          Result := Result + ',';
        Result := Result + t1.PrimaryKey[i];
      end; // for
    end;
  end;
  if assigned(States) then
  begin
    result := result + ',' + States.name;
  end;
  if ProfileFieldName <> '' then
    result := result + ',' + ProfileFieldName;
  if (ADBOwnername = '') or (Pos('.', TableName) > 0) then
    Result := 'SELECT ' + result + ' FROM ' + TableName
  else
    Result := 'SELECT ' + result + ' FROM ' + ADBOwnername + '.' + TableName
end;

function TCnsTable.GetAllFields: string;
var
  i: Integer;
  f1: TCnsFieldGroup;
  //  str1: string;
  t1: TCnsTable;
begin
  Result := '';
  //  if Count <= 0 then exit;
  if Parent is TCnsFieldGroup then
  begin
    f1 := (Parent as TCnsFieldGroup);
    if f1.IsField then
    begin
      Result := Result + f1.LookupFieldName + #13#10;
    end
    else
      for i := 0 to Parent.Count - 1 do
      begin
        Result := Result + f1.Items[i].GetAllFields;
      end;
  end;
  for i := 0 to Count - 1 do
  begin
    Result := Result + Items[i].GetAllFields;
  end;
  if TableMode = cnsIsDetailTable then
  begin
    t1 := FindMasterTable;
    if assigned(t1) then
    begin
      for I := 0 to t1.PrimaryKey.Count - 1 do // Iterate
      begin
        Result := Result + t1.PrimaryKey[i] + #13#10;
      end; // for
    end;
  end;
  if assigned(States) then
  begin
    result := result + States.name + #13#10;
  end;
  if ProfileFieldName <> '' then
    result := result + ProfileFieldName + #13#10;
end;

function TCnsTable.FindOrderField: string;
var
  i: Integer;
  f1: TCnsFieldGroup;
  str1: string;
begin
  Result := '';
  if Count <= 0 then
    exit;
  if Parent is TCnsFieldGroup then
  begin
    f1 := (Parent as TCnsFieldGroup);
    if f1.IsField then
    begin
      if f1.OrderString <> '' then
        Result := Result + ',' + f1.Name;
    end
    else
    begin
      for i := 0 to f1.Count - 1 do
      begin
        str1 := f1.Items[i].FindOrderField;
        if str1 <> '' then
          Result := Result + ',' + str1;
      end;
    end;
  end;
  for i := 0 to Count - 1 do
  begin
    str1 := Items[i].FindOrderField;
    if str1 <> '' then
      Result := Result + ',' + str1;
  end;
  if (Result <> '') and (Result[1] = ',') then
    Result := Copy(Result, 2, Length(Result) - 1);
end;

function TCnsTable.FindTreeField: string;
var
  i: Integer;
  f1: TCnsFieldGroup;
  str1: string;
begin
  Result := '';
  if Count <= 0 then
    exit;
  if Parent is TCnsFieldGroup then
  begin
    f1 := (Parent as TCnsFieldGroup);
    if f1.IsField then
    begin
      if f1.IsTreeField then
        Result := Result + f1.Name + #13#10;
    end
    else
    begin
      for i := 0 to f1.Count - 1 do
      begin
        str1 := f1.Items[i].FindTreeField;
        if str1 <> '' then
          Result := Result + str1;
      end;
    end;
  end;
  for i := 0 to Count - 1 do
  begin
    str1 := Items[i].FindTreeField;
    if str1 <> '' then
      Result := Result + str1;
  end;
end;

function TCnsTable.OrderSQL(AStateName: string): string;
var
//  i: Integer;
//  str1: string;
  st1: TcnsState;
begin
  Result := FCustomOrder;
  if assigned(States) and (AStateName <> '') then
  begin
    st1 := States.ItemByName[AStateName];
    if assigned(st1) and (st1.OrderField <> '') then
    begin
      if Result <> '' then
        Result := Result + ',';
      Result := Result + ' ORDER by ' + st1.OrderField + ' desc ';
    end;
  end;
  {
    if Result = '' then
    begin
      str1 := FindOrderField;
      if str1 <> '' then
      begin
        Result := ' ORDER by ' + str1 + ' desc ';
      end
      else
      begin
        Result := ' ORDER by ';
        for I := 0 to PrimaryKey.Count - 1 do // Iterate
        begin
          if (i <> 0) then
            Result := Result + ',';
          Result := Result + PrimaryKey[i];
        end; // for
        Result := Result + ' desc';
      end;
    end; }
end;

function TCnsTable.FindField(AFieldName: string): Boolean;
var
  i: Integer;
  f1: TCnsFieldGroup;
begin
  Result := false;
  if Count <= 0 then
    exit;
  if Parent is TCnsFieldGroup then
  begin
    f1 := (Parent as TCnsFieldGroup);
    if f1.IsField then
    begin
      {$IFDEF DEBUGFINDKEY}
      SendDebug('find ' + AFieldName + ' in field ' + f1.LookupFieldName);
      {$ENDIF}
      Result := f1.LookupFieldName = AFieldName;
      if Result then
        exit;
    end
    else
    begin
      {$IFDEF DEBUGFINDKEY}
      SendDebug('find ' + AFieldName + ' in group ' + f1.Name);
      {$ENDIF}
      Result := false;
      for i := 0 to f1.Count - 1 do
      begin
        Result := f1.Items[i].FindField(AFieldName);
        if Result then
          exit;
      end;
    end;
  end;
  for i := 0 to Count - 1 do
  begin
    Result := Items[i].FindField(AFieldName);
    if Result then
      exit;
  end;
end;

procedure TCnsTable.AddPrimaryKey(AKeyName: string);
begin
  //  if FindField(AKeyName) then
  PrimaryKey.Add(AKeyName)
    //  else
//    ShowMessage('在表"' + Name + '"中,定义主健时,' + AKeyName + '未定义为字段名');
end;

function TCnsTable.GetSimpleText(APre: string): string;
var
  i: Integer;
begin
  Result := APre + 'TABLE ' + Name + '(' + TableName + '){'#13#10;
  //  Result := Result + APre + '  ' + 'GROUP IS ' + GroupName + ','#13#10;
  if PluginName = '' then
    PluginName := '普通';
  Result := Result + APre + '  PLUGIN IS ' + PluginName + #13#10;

  if AutoCreate then
    Result := Result + APre + '  AUTOCREATE ' + #13#10;

  if LogExec then
    Result := Result + APre + '  LOGEXEC ' + #13#10;
  if LogTime then
    Result := Result + APre + '  LOGTIME ' + #13#10;
  if CountFirst then
    Result := Result + APre + '  COUNTFIRST ' + #13#10;

  if MultiDatabase then
    Result := Result + APre + '  MULTIDATABASE ' + #13#10;
  //if SafeUpdate then
  //  Result := Result + APre + '  SAFEUPDATE ' + #13#10;

  if NeedLock then
    Result := Result + APre + '  NEEDLOCK ' + #13#10;

  if TableOwner <> '' then
    Result := Result + APre + '  ' + 'OWNER IS ' + TableOwner + #13#10;

  Result := Result + APre + '  ' + 'DATABASE IS ' + DatabaseName +
    ' FETCH = ' + IntToStr(FetchCount) + #13#10;
  if assigned(States) then
    Result := Result + States.GetText(APre);
  if ProfileFieldName <> '' then
  begin
    Result := Result + APre + '  ' + 'PROFILE FIELD ' + ProfileFieldName + '( ';
    for I := 0 to Profiles.Count - 1 do // Iterate
    begin
      if i <> 0 then
        Result := Result + ',';
      Result := Result + Profiles[i].GetText('');
    end; // for
    Result := Result + ' )'#13#10;
  end;
  Result := Result + UserPermits.GetText(APre + '  ');
  Result := Result + Reports.GetText(APre + '  ');

  for i := 0 to Count - 1 do
  begin
    if not ((Items[i].Name = '继承') or (Items[i].Name = '主表主健')) then
      Result := Result + Items[i].GetText(APre + '  ');
  end;

  Result := Result + APre + '  ' + 'PRIMARY KEY ( ';
  for i := 0 to PrimaryKey.Count - 1 do // Iterate
  begin
    if i <> 0 then
      Result := Result + ',';
    Result := Result + PrimaryKey[i];
  end; // for
  Result := Result + ' )'#13#10;

  Result := Result + Querys.GetText(APre);
  Result := Result + Analyzes.GetText(APre);
  if Trigger <> '' then
  begin
    Result := Result + APre + '  TRIGGER{'#13#10 + Trigger + APre + '  }'#13#10;
  end;
  Result := Result + Scripts.getText(APre);
  Result := Result + APre + '}'#13#10;
end;

function TCnsTable.GetText(APre: string): string;
var
  i: Integer;
begin
  Result := APre + 'TABLE ' + Name + '( ' + TableName + '){'#13#10;
  //  Result := Result + APre + '  ' + 'GROUP IS ' + GroupName + ','#13#10;
  if PluginName = '' then
    PluginName := '普通';
  Result := Result + APre + '  ' + 'PLUGIN IS ' + PluginName + #13#10;
  if AutoCreate then
    Result := Result + APre + '  AUTOCREATE ' + #13#10;

  if LogExec then
    Result := Result + APre + '  LOGEXEC ' + #13#10;
  if LogTime then
    Result := Result + APre + '  LOGTIME ' + #13#10;
  if CountFirst then
    Result := Result + APre + '  COUNTFIRST ' + #13#10;
    
  if MultiDatabase then
    Result := Result + APre + '  MULTIDATABASE ' + #13#10;
//  if SafeUpdate then
//    Result := Result + APre + '  SAFEUPDATE ' + #13#10;

  if NeedLock then
    Result := Result + APre + '  NEEDLOCK ' + #13#10;

  if TableOwner <> '' then
    Result := Result + APre + '  ' + 'OWNER IS ' + TableOwner + #13#10;

  Result := Result + APre + '  ' + 'DATABASE IS ' + DatabaseName +
    ' FETCH = ' + IntToStr(FetchCount) + #13#10;
  if UserField <> '' then
    Result := Result + APre + '  USERFIELD ' + UserField + #13#10;
  if assigned(States) then
    Result := Result + States.GetText(APre);
  if ProfileFieldName <> '' then
  begin
    Result := Result + APre + '  ' + 'PROFILE FIELD ' + ProfileFieldName + '( ';
    for I := 0 to Profiles.Count - 1 do // Iterate
    begin
      if i <> 0 then
        Result := Result + ',';
      Result := Result + Profiles[i].GetText('');
    end; // for
    Result := Result + ' )'#13#10;
  end;
  Result := Result + UserPermits.GetText(APre + '  ');
  Result := Result + Reports.GetText(APre + '  ');

  for i := 0 to Count - 1 do
  begin
    //    if not((Items[i].Name='继承')or(Items[i].Name='主表主健'))then
    Result := Result + Items[i].GetText(APre + '  ');
  end;

  Result := Result + APre + '  ' + 'PRIMARY KEY ( ';
  for i := 0 to PrimaryKey.Count - 1 do // Iterate
  begin
    if i <> 0 then
      Result := Result + ',';
    Result := Result + PrimaryKey[i];
  end; // for
  Result := Result + ' )'#13#10;
  Result := Result + Querys.GetText(APre);
  if AnalyzeFields.Count > 0 then
  begin
    Result := Result + APre + '  ANALYZEFIELD { ';
    for i := 0 to AnalyzeFields.Count - 1 do // Iterate
    begin
      if i <> 0 then
        Result := Result + ',';
      if AnalyzeFields.Names[i] = '' then
        Result := Result + AnalyzeFields[i] + '(' + AnalyzeFields.Values[AnalyzeFields[i]] + ')'
      else
        Result := Result + AnalyzeFields.Names[i] + '(' + AnalyzeFields.Values[AnalyzeFields.Names[i]] + ')';
    end; // for
    Result := Result + ' }'#13#10;
  end;
  Result := Result + Analyzes.GetText(APre);
  if Trigger <> '' then
  begin
    Result := Result + APre + '  TRIGGER{' + Trigger + '}'#13#10;
  end;
  Result := Result + Scripts.getText(APre);
  Result := Result + APre + '}'#13#10;
end;

function TCnsTable.GetFullText(APre: string): string;
var
  i: Integer;
  f1: TCnsFieldGroup;
  t1: TCnsTable;
  //  str1:string;
begin
  Result := APre + 'TABLE ' + Name + '( ' + TableName + '){'#13#10;
  //  Result := Result + APre + '  ' + 'GROUP IS ' + GroupName + ','#13#10;
  if PluginName = '' then
    PluginName := '普通';
  Result := Result + APre + '  ' + 'PLUGIN IS ' + PluginName + #13#10;
  if AutoCreate then
    Result := Result + APre + '  AUTOCREATE ' + #13#10;

  if LogExec then
    Result := Result + APre + '  LOGEXEC ' + #13#10;
  if LogTime then
    Result := Result + APre + '  LOGTIME ' + #13#10;
  if CountFirst then
    Result := Result + APre + '  COUNTFIRST ' + #13#10;
    
  if MultiDatabase then
    Result := Result + APre + '  MULTIDATABASE ' + #13#10;
//  if SafeUpdate then
//    Result := Result + APre + '  SAFEUPDATE ' + #13#10;

  if NeedLock then
    Result := Result + APre + '  NEEDLOCK ' + #13#10;

  if TableOwner <> '' then
    Result := Result + APre + '  ' + 'OWNER IS ' + TableOwner + #13#10;

  Result := Result + APre + '  ' + 'DATABASE IS ' + DatabaseName +
    ' FETCH = ' + IntToStr(FetchCount) + #13#10;
  if UserField <> '' then
    Result := Result + APre + '  USERFIELD ' + UserField + #13#10;

  if assigned(States) then
    Result := Result + States.GetText(APre);
  if ProfileFieldName <> '' then
  begin
    Result := Result + APre + '  ' + 'PROFILE FIELD ' + ProfileFieldName + '( ';
    for I := 0 to Profiles.Count - 1 do // Iterate
    begin
      if i <> 0 then
        Result := Result + ',';
      Result := Result + Profiles[i].GetText('');
    end; // for
    Result := Result + ' )'#13#10;
  end;
  Result := Result + UserPermits.GetText(APre + '  ');
  Result := Result + Reports.GetText(APre + '  ');
  /////////////////////
  if Parent is TCnsFieldGroup then
  begin
    f1 := (Parent as TCnsFieldGroup);
    if f1.IsField then
    begin
      //      str1 := Copy(f1.LookupFieldName,Pos('=',f1.LookupFieldName)+1, Length(f1.LookupFieldName));

      Result := Result + APre + '  GROUP 继承{'#13#10 +
        APre + '    ' + f1.LookupFieldName +
        f1.getFieldText(APre + '    ', false, true) +
        APre + '  }'#13#10
    end
    else
    begin
      Result := Result + APre + '  GROUP 继承{'#13#10;
      for i := 0 to Parent.Count - 1 do
      begin
        if i <> 0 then
          Result := Result + APre + ','#13#10;
        Result := Result + f1.Items[i].GetText(APre + '    ');
      end;
      Result := Result + APre + '  }'#13#10;
    end;
  end;
  if TableMode = cnsIsDetailTable then
  begin
    t1 := FindMasterTable;
    if assigned(t1) then
    begin
      Result := Result + APre + '  GROUP 主表主健{'#13#10;
      for I := 0 to t1.PrimaryKey.Count - 1 do // Iterate
      begin
        Result := Result + t1.FindNameField(t1.PrimaryKey[i]).GetText(APre + '    ') + ' WIDTHINGRID 0 ';
      end; // for
    end
    else
      Result := Result + '//error no parent table'#13#10;
    Result := Result + APre + '  }'#13#10;
  end;
  ////////////////////////////
  for i := 0 to Count - 1 do
  begin
    Result := Result + Items[i].GetText(APre + '  ');
  end;

  Result := Result + APre + '  ' + 'PRIMARY KEY ( ';
  for i := 0 to PrimaryKey.Count - 1 do // Iterate
  begin
    if i <> 0 then
      Result := Result + ',';
    Result := Result + PrimaryKey[i];
  end; // for
  Result := Result + ' )'#13#10;

  Result := Result + Querys.GetText(APre);
  if AnalyzeFields.Count > 0 then
  begin
    Result := Result + APre + '  ANALYZEFIELD { ';
    for i := 0 to AnalyzeFields.Count - 1 do // Iterate
    begin
      if i <> 0 then
        Result := Result + ',';
      if AnalyzeFields.Names[i] = '' then
        Result := Result + AnalyzeFields[i] + '(' + AnalyzeFields.Values[AnalyzeFields[i]] + ')'
      else
        Result := Result + AnalyzeFields.Names[i] + '(' + AnalyzeFields.Values[AnalyzeFields.Names[i]] + ')'
    end; // for
    Result := Result + ' }'#13#10;
  end;
  Result := Result + Analyzes.GetText(APre);
  if Trigger <> '' then
  begin
    Result := Result + APre + '  TRIGGER{'#13#10 + Trigger + APre + '  }'#13#10;
  end;
  Result := Result + Scripts.getText(APre);
  Result := Result + APre + '}'#13#10;
end;

function TCnsTable.CreateSQL(ADBOwnername: string; ADBType: Integer): string;
var
  i: Integer;
  f1: TCnsFieldGroup;
  t1: TCnsTable;
begin
  Result := '';
  //  if Count <= 0 then exit;
  if Parent is TCnsFieldGroup then
  begin
    f1 := (Parent as TCnsFieldGroup);
    if f1.IsField then
      Result := Result + '  ' + f1.LookupFieldName + ' ' + f1.GetFieldType(ADBType) + ' NOT NULL,'#13#10
    else
      for i := 0 to Parent.Count - 1 do
      begin
        Result := Result + f1.Items[i].CreateSQL(ADBType);
      end;
  end;
  if TableMode = cnsIsDetailTable then
  begin
    t1 := FindMasterTable;
    if assigned(t1) then
    begin
      for I := 0 to t1.PrimaryKey.Count - 1 do // Iterate
      begin
        Result := Result + t1.FindNameField(t1.PrimaryKey[i]).CreateSQL(ADBType);
      end; // for
    end
    else
      Result := Result + '//error no parent table'#13#10;
  end;
  for i := 0 to Count - 1 do
  begin
    Result := Result + Items[i].CreateSQL(ADBType);
  end;
  if assigned(States) then
  begin
    result := result + '  ' + States.name + ' INTEGER,'#13#10;
  end;
  if ProfileFieldName <> '' then
    result := result + '  ' + ProfileFieldName + ' INTEGER,'#13#10;
  if (ADBType = 1) and (ADBOwnername <> '') and (Pos('.', TableName) <= 0) then
    Result := 'CREATE TABLE ' + ADBOwnername + '.' + TableName + '('#13#10 + result + '  PRIMARY KEY( '
  else
    Result := 'CREATE TABLE ' + TableName + '('#13#10 + result + '  PRIMARY KEY( ';
  for i := 0 to PrimaryKey.Count - 1 do // Iterate
  begin
    if i <> 0 then
      Result := Result + ',';
    Result := Result + PrimaryKey[i];
  end; // for
  Result := Result + ' )'#13#10')';
end;

function TCnsTable.CreateSQLEx(ADBOwnername: string; ADBType: Integer): string;
var
  i: Integer;
  f1: TCnsFieldGroup;
  t1: TCnsTable;
begin
  Result := '';
  //  if Count <= 0 then exit;
  if Parent is TCnsFieldGroup then
  begin
    f1 := (Parent as TCnsFieldGroup);
    if f1.IsField then
      Result := Result + '  ' + f1.LookupFieldName + ' ' + f1.GetFieldType(ADBType) + ' NOT NULL,'#13#10
    else
      for i := 0 to Parent.Count - 1 do
      begin
        Result := Result + f1.Items[i].CreateSQL(ADBType);
      end;
  end;
  if TableMode = cnsIsDetailTable then
  begin
    t1 := FindMasterTable;
    if assigned(t1) then
    begin
      for I := 0 to t1.PrimaryKey.Count - 1 do // Iterate
      begin
        Result := Result + t1.FindNameField(t1.PrimaryKey[i]).CreateSQL(ADBType);
      end; // for
    end
    else
      Result := Result + '//error no parent table'#13#10;
  end;
  for i := 0 to Count - 1 do
  begin
    Result := Result + Items[i].CreateSQL(ADBType);
  end;
  if assigned(States) then
  begin
    result := result + '  ' + States.name + ' INTEGER,'#13#10;
  end;
  if ProfileFieldName <> '' then
    result := result + '  ' + ProfileFieldName + ' INTEGER,'#13#10;
  {  if (ADBType = 1) and (ADBOwnername <> '') and (Pos('.', TableName) <= 0) then
      Result := 'CREATE TABLE ' + ADBOwnername + '.' + TableName + '('#13#10 + result + '  PRIMARY KEY( '
    else
      Result := 'CREATE TABLE ' + TableName + '('#13#10 + result + '  PRIMARY KEY( ';}

  Result := result + '  PRIMARY KEY( ';
  for i := 0 to PrimaryKey.Count - 1 do // Iterate
  begin
    if i <> 0 then
      Result := Result + ',';
    Result := Result + PrimaryKey[i];
  end; // for
  Result := Result + ' )'#13#10')';
end;

function TCnsTable.GetItem(Index: Integer): TCnsFieldGroup;
begin
  Result := TCnsFieldGroup(inherited Items[Index]);
end;

function TCnsTable.GetByName(AName: string): TCnsFieldGroup;
begin
  Result := TCnsFieldGroup(inherited ItemByName[AName]);
end;

constructor TCnsTable.Create(AOwner: TCnsCollect; Aname: string);
begin
  {$IFDEF DEBUGCEATE}
  SendDebug('Table:' + AName);
  {$ENDIF}
  inherited Create(AOwner, Aname);

  FCustomOrder := '';

  HaveBeenCheckExists := false;
  MultiDatabase := false;
//  SafeUpdate := false;

  NeedLock := false;
  AutoCreate := false;
  
  LogExec := false;
  LogTime := false;
  CountFirst := false;

  ReadOnlyState := 999;
  FetchCount := 0;
  AnalyzeFields := TStringList.Create;
  Details := TCnsTask.Create(self, '');
  TableMode := cnsIsNormalTable;
  GroupName := '';

  TableName := '';
  DatabaseName := '';
  TableOwner := '';
  PluginName := '';
  ProfileFieldName := '';
  PrimaryKey := TStringList.Create;
  Profiles := TCnsProfileGroup.Create(self, '');

  Scripts := TCnsProgramGroup.Create(self, '');
  Analyzes := TCnsAnalyzedGroup.Create(self, '');
  Querys := TCnsQueryGroup.Create(self, '');
  UserPermits := TCnsTableUserGroup.Create(self, '');
  Reports := TCnsReportGroup.Create(self, '');

  States := nil;
end;

destructor TCnsTable.Destroy;
begin
  Clear;
  Reports.Free;
  Reports := nil;
  Scripts.Free;
  Analyzes.Free;
  Querys.Free;
  UserPermits.Free;
  if assigned(States) then
    States.Free;

  PrimaryKey.Free;
  Profiles.Free;
  Details.Free;
  AnalyzeFields.Free;
  inherited Destroy;
end;

function TCnsTableGroup.GetForUserGroup(AUserGroup: string): string;
var
  I: Integer;
  Strs: TStringList;
begin
  strs := TStringList.Create;
  for i := 0 to Count - 1 do // Iterate
  begin
    if (Items[i].TableMode <> cnsIsDetailTable) and Items[i].TestFroUserGroup(AUserGroup) then
    begin
      if (Items[i].TableMode <> cnsIsLookupTable) then
        strs.Add(Items[i].GroupName + ',' + Items[i].Name)
      else
        strs.Add('辅助,' + Items[i].Name);
    end
  end; // for
  result := strs.Text;
  strs.Free;
end;

function TCnsTableGroup.GetNames(AMode: Integer = 0): string;
var
  I: Integer;
  Strs: TStringList;
begin
  strs := TStringList.Create;
  for i := 0 to Count - 1 do // Iterate
  begin
    if AMode = 0 then
    begin
      if Items[i].TableMode = cnsIsNormalTable then
        strs.Add(Items[i].GroupName + ',' + Items[i].Name);
    end
    else
      if AMode = 1 then
    begin
      if Items[i].TableMode = cnsIsLookupTable then
        strs.Add(Items[i].Name);
    end
    else
      if AMode = 2 then
    begin
      //if Items[i].TableMode = cnsIsLookupTable then
      strs.Add(Items[i].Name);
    end;

  end; // for
  result := strs.Text;
  strs.Free;
end;

function TCnsTableGroup.GetText(APre: string): string;
var
  i: Integer;
  CurGroup: string;
begin
  CurGroup := '';
  for i := 0 to Count - 1 do
  begin
    if (Items[i].Parent = self) and (Items[i].TableMode = cnsIsNormalTable) then
    begin
      if CurGroup = '' then
      begin
        Result := APre + 'TABLEGROUP ' + Items[i].GroupName + '{'#13#10;
        CurGroup := Items[i].GroupName;
      end
      else
        if CurGroup <> Items[i].GroupName then
      begin
        Result := Result + Apre + '}'#13#10 + APre + 'TABLEGROUP ' + Items[i].GroupName + '{'#13#10;
        CurGroup := Items[i].GroupName;
      end;
      Result := Result + Items[i].GetText(APre + '  ');
    end;
  end;
  if Count > 0 then
    Result := Result + Apre + '}'#13#10;
end;

function TCnsTableGroup.GetItem(Index: Integer): TCnsTable;
begin
  Result := TCnsTable(inherited Items[Index]);
end;

function CompareTableObject(Item1, Item2: Pointer): Integer;
begin
  Result := CompareText(TCnsTable(Item1).Name, TCnsTable(Item2).Name);
end;

function TCnsTableGroup.GetByName(AName: string): TCnsTable;
var
  k, k1: string;
  l1, h1, m1: Integer;
  list1: TList;
begin
  list1 := Fitems.LockList;
  try
    k := AName;
    l1 := 0;

    if FNeedSort then
    begin
      list1.Sort(CompareTableObject);
      FNeedSort := false;
    end;

    h1 := list1.Count - 1;
    Result := nil;
    while l1 <= h1 do
    begin
      m1 := (l1 + h1) div 2;
      k1 := TCnsTable(list1[m1]).Name;
      if k1 > k then
        h1 := m1 - 1
      else
        if k1 < k then
        l1 := m1 + 1
      else
      begin
        Result := TCnsTable(list1[m1]);
        exit;
      end;
    end; // while
  finally
    FItems.UnlockList;
  end;
  //  Result := TCnsTable(inherited GetByName(AName));
end;

destructor TCnsTableGroup.Destroy;
begin
  Clear;
  inherited Destroy;
end;

constructor TCnsTableGroup.Create(AOwner: TCnsCollect; Aname: string);
begin
  {$IFDEF DEBUGCEATE}
  SendDebug('Table Group:' + AName);
  {$ENDIF}
  inherited Create(AOwner, Aname);
end;

{function TCnsTableGroupList.GetText(APre: string): string;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    Result := Result + Items[i].GetText(APre) + #13#10;
end;

function TCnsTableGroupList.GetItem(Index: Integer): TCnsTableGroup;
begin
  Result := TCnsTableGroup(inherited Items[Index]);
end;

function TCnsTableGroupList.GetByName(AName: string): TCnsTableGroup;
begin
  Result := TCnsTableGroup(inherited ItemByName[AName]);
end;

destructor TCnsTableGroupList.Destroy;
begin
  inherited Destroy;
end;

constructor TCnsTableGroupList.Create(AOwner: TCnsCollect; Aname: string);
begin
  inherited Create(AOwner, Aname);
end;
}

function TCnsCollect.GetNames(AMode: Integer = 0): string;
var
  I: Integer;
  Strs: TStringList;
  list1: TList;
begin
  strs := TStringList.Create;
  list1 := Fitems.LockList;
  try
    for i := 0 to list1.Count - 1 do // Iterate
    begin
      strs.Add(TCnsCollect(list1[i]).Name);
    end; // for
  finally
    FItems.UnlockList;
  end;
  result := strs.Text;
  strs.Free;
end;

function TCnsCollect.GetText(APre: string): string;
begin
  Result := '';
end;

function CompareCollectObject(Item1, Item2: Pointer): Integer;
begin
  Result := CompareText(TCnsCollect(Item1).Name, TCnsCollect(Item2).Name);
end;

function TCnsCollect.GetByName(AName: string): TCnsCollect;
var
  k, k1: string;
  l1, h1, m1: Integer;
  list1: TList;
begin
  k := Uppercase(AName);
  l1 := 0;

  list1 := Fitems.LockList;
  try
    if FNeedSort then
    begin
      list1.Sort(CompareCollectObject);
      FNeedSort := false;
    end;

    h1 := list1.Count - 1;
    Result := nil;
    while l1 <= h1 do
    begin
      m1 := (l1 + h1) div 2;
      k1 := Uppercase(TCnsCollect(list1[m1]).Name);

      //CompareValue(
      if k1 > k then
        h1 := m1 - 1
      else
        if k1 < k then
        l1 := m1 + 1
      else
      begin
        Result := TCnsCollect(list1[m1]);
        exit;
      end;
    end; // while
  finally
    FItems.UnlockList;
  end;
  {var
    I: Integer;
    list1: TList;
  begin
    Result := nil;
    list1 := Fitems.LockList;
    try
      for I := 0 to list1.Count - 1 do // Iterate
      begin
        if TCnsCollect(list1[i]).Name = AName then
        begin
          Result := TCnsCollect(list1[i]);
          exit;
        end;
      end; // for
    finally
      FItems.UnlockList;
    end;}
end;

function TCnsCollect.GetCount: Integer;
var
  list1: TList;
begin
  list1 := Fitems.LockList;
  try
    Result := List1.Count
  finally
    FItems.UnlockList;
  end;
end;

{procedure TCnsCollect.Clear;
var
  I: Integer;
begin
  if Count > 0 then
    for I := FItems.Count - 1 downto 0 do // Iterate
    begin
      TCnsCollect(FItems[i]).Clear;
//      TCnsCollect(FItems[i]).Free;
      FItems[i] := nil;
    end; // for
  FItems.Clear;
end; }

function TCnsCollect.GetItem(Index: Integer): TCnsCollect;
var
  list1: TList;
begin
  list1 := FItems.LockList;
  try
    Result := TCnsCollect(List1[Index]);
  finally
    FItems.UnlockList;
  end;
end;

procedure TCnsCollect.Delete(Index: Integer);
var
  list1: TList;
begin
  list1 := FItems.LockList;
  try
    TCnsCollect(list1[Index]).Free;
    list1.Delete(Index);
  finally
    FItems.UnlockList;
  end;
end;

procedure TCnsCollect.Add(AItem: TCnsCollect);
var
  I: Integer;
  list1: TList;
begin
  list1 := FItems.LockList;
  try
    //  if assigned(AItem) then
    for I := 0 to list1.Count - 1 do // Iterate
    begin
      if TCnsCollect(list1[i]).Name = AItem.Name then
      begin
        //      ShowMessage('在"' + Name + '(' + ClassName + ')"下"' + AItem.Name + '"和已有的' + AItem.ClassName + '名称相同');
        exit;
      end;
    end; // for
    AItem.NodeParent := self;
    list1.Add(AItem);
    FNeedSort := true;
  finally
    FItems.UnlockList;
  end;
end;

constructor TCnsCollect.Create(AOwner: TCnsCollect; Aname: string);
begin
  inherited Create;
  FItems := TThreadList.Create;
  FName := AName;
  FParent := AOwner;
  FNeedSort := false;
end;

destructor TCnsCollect.Destroy;
begin
  //  Clear;
  FItems.Clear;
  FItems.Free;
  inherited Destroy;
end;

function Substring(s: string; Start, Stop: integer): string;
begin
  if Stop = 0 then
    result := Copy(s, Start, length(s) - Start + 1)
  else
    result := Copy(s, Start, Stop - Start);
end;

function IndexOf(Substr, s: string; Index: integer): integer;
begin
  result := pos(Substr, Substring(s, Index, 0));
  if result <> 0 then
    result := result + Index - 1;
end;

function strReplace(s, Find, Replace: string): string;
var
  i: integer;
begin
  i := 1;
  result := '';
  while i <> 0 do
  begin
    result := result + Substring(s, i, IndexOf(Find, s, i));
    if IndexOf(Find, s, i) = 0 then
      break;
    result := result + Replace;
    i := IndexOf(Find, s, i);
    if i <> 0 then
      inc(i, Length(Find));
  end;
end;

procedure TCnsViewGroup.Clear;
var
  I: Integer;
  List1: TList;
begin
  list1 := FItems.LockList;
  try
    if list1.Count > 0 then
      for I := list1.Count - 1 downto 0 do // Iterate
      begin
        TCnsView(list1[i]).Clear;
        TCnsView(list1[i]).Free;
      end; // for
    list1.Clear;
  finally
    Fitems.UnlockList;
  end;
end;

procedure TCnsTaskGroup.Clear;
var
  I: Integer;
  List1: TList;
begin
  list1 := FItems.LockList;
  try
    if list1.Count > 0 then
      for I := list1.Count - 1 downto 0 do // Iterate
      begin
        TCnsTask(list1[i]).Clear;
        TCnsTask(list1[i]).Free;
      end; // for
    list1.Clear;
  finally
    Fitems.UnlockList;
  end;
end;

procedure TCnsTask.Clear;
var
  I: Integer;
  List1: TList;
begin
  list1 := FItems.LockList;
  try
    if list1.Count > 0 then
      for I := list1.Count - 1 downto 0 do // Iterate
      begin
        TCnsDetailTable(list1[i]).Clear;
        TCnsDetailTable(list1[i]).Free;
      end; // for
    list1.Clear;
  finally
    Fitems.UnlockList;
  end;
end;

procedure TCnsTableGroup.Clear;
var
  I: Integer;
  List1: TList;
begin
  list1 := FItems.LockList;
  try
    if list1.Count > 0 then
      for I := list1.Count - 1 downto 0 do // Iterate
      begin
        TCnsTable(list1[i]).Clear;
        TCnsTable(list1[i]).Free;
      end; // for
    list1.Clear;
  finally
    Fitems.UnlockList;
  end;
end;

procedure TCnsProgramGroup.Clear;
var
  I: Integer;
  List1: TList;
begin
  list1 := FItems.LockList;
  try
    if list1.Count > 0 then
      for I := list1.Count - 1 downto 0 do // Iterate
      begin
        TCnsProgram(list1[i]).Clear;
        TCnsProgram(list1[i]).Free;
      end; // for
    list1.Clear;
  finally
    Fitems.UnlockList;
  end;
end;

procedure TCnsAnalyzedGroup.Clear;
var
  I: Integer;
  List1: TList;
begin
  list1 := FItems.LockList;
  try
    if list1.Count > 0 then
      for I := list1.Count - 1 downto 0 do // Iterate
      begin
        TCnsAnalyze(list1[i]).Clear;
        TCnsAnalyze(list1[i]).Free;
      end; // for
    list1.Clear;
  finally
    Fitems.UnlockList;
  end;
end;

procedure TCnsQueryGroup.Clear;
var
  I: Integer;
  List1: TList;
begin
  list1 := FItems.LockList;
  try
    if list1.Count > 0 then
      for I := list1.Count - 1 downto 0 do // Iterate
      begin
        TCnsQuery(list1[i]).Clear;
        TCnsQuery(list1[i]).Free;
      end; // for
    list1.Clear;
  finally
    Fitems.UnlockList;
  end;
end;

procedure TCnsTableUser.Clear;
var
  I: Integer;
  List1: TList;
begin
  list1 := FItems.LockList;
  try
    if list1.Count > 0 then
      for I := list1.Count - 1 downto 0 do // Iterate
      begin
        TCnsTableUserProfileState(list1[i]).Clear;
        TCnsTableUserProfileState(list1[i]).Free;
      end; // for
    list1.Clear;
  finally
    Fitems.UnlockList;
  end;
end;

procedure TCnsTableUserGroup.Clear;
var
  I: Integer;
  List1: TList;
begin
  list1 := FItems.LockList;
  try
    if list1.Count > 0 then
      for I := list1.Count - 1 downto 0 do // Iterate
      begin
        TCnsTableUser(list1[i]).Clear;
        TCnsTableUser(list1[i]).Free;
      end; // for
    list1.Clear;
  finally
    Fitems.UnlockList;
  end;
end;

procedure TCnsStateGroup.Clear;
var
  I: Integer;
  List1: TList;
begin
  list1 := FItems.LockList;
  try
    if list1.Count > 0 then
      for I := list1.Count - 1 downto 0 do // Iterate
      begin
        TCnsState(list1[i]).Clear;
        TCnsState(list1[i]).Free;
      end; // for
    list1.Clear;
  finally
    Fitems.UnlockList;
  end;
end;

procedure TCnsReportGroup.Clear;
var
  I: Integer;
  List1: TList;
begin
  list1 := FItems.LockList;
  try
    if list1.Count > 0 then
      for I := list1.Count - 1 downto 0 do // Iterate
      begin
        TCnsReport(list1[i]).Clear;
        TCnsReport(list1[i]).Free;
      end; // for
    list1.Clear;
  finally
    Fitems.UnlockList;
  end;
end;

procedure TCnsTableUserProfileState.Clear;
begin
  StateList.Clear;
end;

constructor TCnsProfile.Create(AOwner: TCnsCollect; Aname: string);
begin
  inherited Create(AOwner, Aname);
  Value := 1;
  Data := nil;
end;

destructor TCnsProfile.Destroy;
begin
  inherited Destroy;

end;

function TCnsProfile.GetText(APre: string): string;
begin
  Result := Name + '< VALUE = ' + IntToStr(Value) + ' >';
end;

procedure TCnsProfile.Clear;
begin

end;

function TCnsProfileGroup.GetItem(Index: Integer): TCnsProfile;
begin
  Result := TCnsProfile(inherited Items[Index]);
end;

function TCnsProfileGroup.GetByName(AName: string): TCnsProfile;
begin
  Result := TCnsProfile(inherited ItemByName[AName]);
end;

function TCnsProfileGroup.FindStateByValue(AValue: Integer): TCnsProfile;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Count - 1 do // Iterate
  begin
    if Items[i].Value = AValue then
    begin
      Result := Items[i];
    end;
  end; // for
end;

constructor TCnsProfileGroup.Create(AOwner: TCnsCollect; Aname: string);
begin
  inherited Create(AOwner, Aname);
end;

destructor TCnsProfileGroup.Destroy;
begin
  inherited Destroy;
end;

procedure TCnsProfileGroup.Clear;
var
  I: Integer;
  List1: TList;
begin
  list1 := FItems.LockList;
  try
    if list1.Count > 0 then
      for I := list1.Count - 1 downto 0 do // Iterate
      begin
        TCnsProfile(list1[i]).Clear;
        TCnsProfile(list1[i]).Free;
      end; // for
    list1.Clear;
  finally
    Fitems.UnlockList;
  end;
end;

function TCnsProfileGroup.GetText(APre: string): string;
var
  i: Integer;
begin
  Result := APre + '  PROFILE FIELD ' + Name + '{'#13#10;
  for I := 0 to Count - 1 do // Iterate
  begin
    if i <> 0 then
      Result := Result + ',';
    Result := Result + Items[i].getText(APre + '    ');
  end; // for
  Result := Result + APre + '  }'#13#10;
end;

function TCnsProfileGroup.FindState(AName: string): Boolean;
begin
  Result := assigned(ItemByName[AName]);
end;

procedure TCnsTable.SetCustomOrder(const Value: string);
begin
  FCustomOrder := Value;
end;

end.

