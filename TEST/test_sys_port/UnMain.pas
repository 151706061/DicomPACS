unit UnMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, WinSvc;

type
  TMain = class(TForm)
    Memo1: TMemo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Memo2: TMemo;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Splitter1: TSplitter;
    Memo3: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure ExecConsoleApp(CommandLine: AnsiString; Output: TStringList; Errors:
      TStringList);
    function OEM2ANSI(const aStr: AnsiString): AnsiString;
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

function TMain.OEM2ANSI(const aStr: AnsiString): AnsiString;
begin
  Result := aStr;
  try
    OEMToChar(PAnsiChar(Result),PAnsiChar(Result));
  except

  end;
end;

function ServiceGetList(
   sMachine : string;
   dwServiceType,
   dwServiceState : DWord;
   slServicesList : TStrings )
   : boolean;
 const cnMaxServices = 4096;        { ���������� ����� �� ����� 4096 ��������� ��� ������������� }
 type
   TSvcA = array[0..cnMaxServices]
           of TEnumServiceStatus;
   PSvcA = ^TSvcA;
 var
   j : integer;                  // ��������� ����������
   schm          : SC_Handle;    // ���������� ��������
   nBytesNeeded,                 // ���� ����� ��� ������
   nServices,                    // ���������� �����
   nResumeHandle : DWord;        // ��������� �� ��������� ������
   ssa : PSvcA;                  // ��������� ������
begin
   Result := false;

   // ������������ � ���������� ��������
   schm := OpenSCManager(
     PChar(sMachine),
     Nil,
     SC_MANAGER_ALL_ACCESS);

   // ���� ������
   if(schm > 0)then
   begin
     nResumeHandle := 0;

     New(ssa);

     EnumServicesStatus(
       schm,
       dwServiceType,
       dwServiceState,
       ssa^[0],
       SizeOf(ssa^),
       nBytesNeeded,
       nServices,
       nResumeHandle );

     //
     // �����������, ��� ������ ������� ����������

     for j := 0 to nServices-1 do
     begin
       slServicesList.
         Add( StrPas( ssa^[j].lpDisplayName ) +' | '+
              StrPas( ssa^[j].lpServiceName ) 
            );
     end;

     Result := true;

     Dispose(ssa);

     // ������� ���������� ���������� ��������
     CloseServiceHandle(schm);
   end;
end;

procedure TMain.ExecConsoleApp(CommandLine: AnsiString; Output: TStringList; Errors:
  TStringList);
var
  sa: TSECURITYATTRIBUTES;
  si: TSTARTUPINFO;
  pi: TPROCESSINFORMATION;
  hPipeOutputRead: THANDLE;
  hPipeOutputWrite: THANDLE;
  hPipeErrorsRead: THANDLE;
  hPipeErrorsWrite: THANDLE;
  Res, bTest: Boolean;
  env: array[0..100] of Char;
  szBuffer: array[0..256] of Char;
  dwNumberOfBytesRead: DWORD;
  Stream: TMemoryStream;
begin
  sa.nLength := sizeof(sa);
  sa.bInheritHandle := true;
  sa.lpSecurityDescriptor := nil;
  CreatePipe(hPipeOutputRead, hPipeOutputWrite, @sa, 0);
  CreatePipe(hPipeErrorsRead, hPipeErrorsWrite, @sa, 0);
  ZeroMemory(@env, SizeOf(env));
  ZeroMemory(@si, SizeOf(si));
  ZeroMemory(@pi, SizeOf(pi));
  si.cb := SizeOf(si);
  si.dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
  si.wShowWindow := SW_HIDE;
  si.hStdInput := 0;
  si.hStdOutput := hPipeOutputWrite;
  si.hStdError := hPipeErrorsWrite;

  (* Remember that if you want to execute an app with no parameters you nil the
     second parameter and use the first, you can also leave it as is with no
     problems.                                                                 *)
  Res := CreateProcess(nil, pchar(CommandLine), nil, nil, true,
    CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, @env, nil, si, pi);

  // Procedure will exit if CreateProcess fail
  if not Res then
  begin
    CloseHandle(hPipeOutputRead);
    CloseHandle(hPipeOutputWrite);
    CloseHandle(hPipeErrorsRead);
    CloseHandle(hPipeErrorsWrite);
    Exit;
  end;
  CloseHandle(hPipeOutputWrite);
  CloseHandle(hPipeErrorsWrite);

  //Read output pipe
  Stream := TMemoryStream.Create;
  try
    while true do
    begin
      bTest := ReadFile(hPipeOutputRead, szBuffer, 256, dwNumberOfBytesRead,
        nil);
      if not bTest then
      begin
        break;
      end;
      Stream.Write(szBuffer, dwNumberOfBytesRead);
    end;
    Stream.Position := 0;
    Output.LoadFromStream(Stream);
  finally
    Stream.Free;
  end;

  //Read error pipe
  Stream := TMemoryStream.Create;
  try
    while true do
    begin
      bTest := ReadFile(hPipeErrorsRead, szBuffer, 256, dwNumberOfBytesRead,
        nil);
      if not bTest then
      begin
        break;
      end;
      Stream.Write(szBuffer, dwNumberOfBytesRead);
    end;
    Stream.Position := 0;
    Errors.LoadFromStream(Stream);
  finally
    Stream.Free;
  end;

  WaitForSingleObject(pi.hProcess, INFINITE);
  CloseHandle(pi.hProcess);
  CloseHandle(hPipeOutputRead);
  CloseHandle(hPipeErrorsRead);
end;

procedure TMain.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
end;

procedure TMain.Button1Click(Sender: TObject);
var OutP, ErrorP: TStringList;
    i : Integer;
begin
  Memo1.Lines.Clear;
  Memo2.Lines.Clear;

{  OutP := TStringList.Create;
  ErrorP := TstringList.Create;

  ExecConsoleApp( Edit1.Text, OutP, ErrorP);
  Memo1.Lines.Assign(OutP);
  Memo2.Lines.Assign(ErrorP);

  for I := 0 to Memo1.Lines.Count - 1 do
    Memo1.Lines[i] := OEM2ANSI(Memo1.Lines[i]);
  for I := 0 to Memo2.Lines.Count - 1 do
    Memo2.Lines[i] := OEM2ANSI(Memo2.Lines[i]);

  OutP.Free;
  ErrorP.Free; }

  ServiceGetList( '',
    SERVICE_WIN32,
    SERVICE_STATE_ALL,
    Memo3.Lines );

end;



end.
