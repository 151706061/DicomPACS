unit UnTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Oracle;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    edAccessionNumber: TEdit;
    OracleSession1: TOracleSession;
    Label2: TLabel;
    edStudyUID: TEdit;
    edPatientID: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edUser: TEdit;
    edPassword: TEdit;
    Label5: TLabel;
    edDatabase: TEdit;
    Label6: TLabel;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
// Отображение снимков по пациенту/исследованию (для АТРИС)
p_showSnimki : procedure (  p_AppHandl : THandle; 
                            p_OracleSession: pointer;
                            p_patientID:string;
                            p_AccessionNumber:string;
                            p_studyUID:string;
                            p_old_form : Boolean
                         ); stdcall;
DLL_HANDLE: THandle;
const c_fileDLL = 'DICOM_Viewer.dll';
begin // снимки HTTP

  OracleSession1.LogonDatabase := edDatabase.Text; // 'ASU_HABAROVSK_KKB2';
  OracleSession1.LogonUsername := edUser.Text; // 'ASU';
  OracleSession1.LogonPassword := edPassword.Text; // 'ASU';
  OracleSession1.Connected:=True;

  if FileExists(c_fileDLL) then
  begin
    try
      DLL_HANDLE:= LoadLibrary(c_fileDLL);
    except
      on E:Exception do
      begin
        ShowMessage('ERROR : '+E.Message);
        Exit;
      end;
    end;
    Try
      if DLL_HANDLE <> 0 then
      begin
        @p_showSnimki := GetProcAddress(DLL_HANDLE, 'p_showSnimki');
        if @p_showSnimki <> nil then
         p_showSnimki(  Application.Handle,
                        OracleSession1.ExternalSVC,
                        edPatientID.Text,               // p_patientID:string;
                        edAccessionNumber.Text,
                        edStudyUID.Text,   // p_studyUID:string
                        False // True // old_form
                     );
      end;
    Finally
      FreeLibrary(DLL_HANDLE);
    End;
  end else
    MessageDlg('Не найден файл '+c_fileDLL, mtWarning, [mbOK], 0);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
p_DicomShowSnimki : procedure ( // p_AppHandl : THandle;
                               p_AccessionNumber,
                               p_studyUID,
                               p_get_dicom_ip,
                               p_get_dicom_called,
                               p_get_dicom_port,
                               p_get_local_port,
                               p_debug:pchar
                            ); stdcall;
// p_DicomTest : procedure ; stdcall;
// p_DicomViewer : procedure ; stdcall;
DLL_HANDLE: THandle;
vAccessionNumber : PAnsiChar;
const c_fileDLL = 'c:\Delphi\Trunk_AUTH\ASU2\Dicom\DICOM_Viewer_DLL\bin\DICOM_Viewer.dll';
begin
  if FileExists(c_fileDLL) then
  begin
    DLL_HANDLE:= LoadLibrary(c_fileDLL);
    Try
      if DLL_HANDLE <> 0 then
      begin
      {  @p_DicomTest := GetProcAddress(DLL_HANDLE, 'p_DicomTest');
        if @p_DicomTest <> nil then
         p_DicomTest; }
        @p_DicomShowSnimki := GetProcAddress(DLL_HANDLE, 'p_DicomShowSnimki');
        if @p_DicomShowSnimki <> nil then
         try
           if Trim(edAccessionNumber.Text)='' then
             vAccessionNumber:='AN-23.12.2014.22985577'
           else
             vAccessionNumber:=PChar(Trim(edAccessionNumber.Text));
           p_DicomShowSnimki( vAccessionNumber,
                              '',             // p_studyUID,
                              '192.168.1.47', // p_get_dicom_ip
                              'PACSSERVER',   // p_get_dicom_called
                              '11114',        //  p_get_dicom_port
                              '1131',         // p_get_local_port   11117
                              '1'             // ="1" - include debugging information
                       );
         except
         on E:Exception do
           MessageDlg('ERROR: '+E.Message, mtWarning, [mbOK], 0);
         end;
      end;
    Finally
      FreeLibrary(DLL_HANDLE);
    End;
  end else
    MessageDlg('Не найден файл '+c_fileDLL, mtWarning, [mbOK], 0);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
pMakeCD : procedure ( pLevel : integer;
                      pStudyList : TStringList;
                      pDICOMhost : string;
                      pDICOMport : Integer;
                      pDICOMCALLEDAE : string;
                      pDICOMCALLINGAE : string;
                      pDICOMLocalPort : Integer;
                      pIsDebug : integer
                    ) ; stdcall;
DLL_HANDLE: THandle;
vStudyList : TStringList;
const c_fileDLL = 'DicomCD.dll';
begin  // DICOM CD
  if FileExists(c_fileDLL) then
  begin
    DLL_HANDLE:= LoadLibrary(c_fileDLL);
    Try
      if DLL_HANDLE <> 0 then
      begin
      {  @p_DicomTest := GetProcAddress(DLL_HANDLE, 'p_DicomTest');
        if @p_DicomTest <> nil then
         p_DicomTest; }
        @pMakeCD := GetProcAddress(DLL_HANDLE, 'pMakeCD');
        if @pMakeCD <> nil then
         try
           vStudyList := TStringList.Create;
           try
             //
           {  vStudyList.Append('2383MRT/14');
             pMakeCD (  1,              // 0 - STUDY  1 - PATIENTS, 2 - IMAGES, 4 - accessionnumber
                        vStudyList,
                        '192.168.1.47', // pDICOMhost : string;
                        11114,          // pDICOMport : Integer;
                        'PACSSERVER',   // pDICOMCALLEDAE : string;
                        'TEST1',        // pDICOMCALLINGAE : string;
                        1131,           // pDICOMLocalPort : Integer;
                        1               // pIsDebug : integer
                      ) ;  }

           //  vStudyList.Append('2015.07.29.09.44.24.100.100000.8593420703');
             vStudyList.Append(edAccessionNumber.Text);
//             vStudyList.Append('1.2.840.113704.1.111.4588.1421305681.10');
             //
             pMakeCD (  4,              // 0 - STUDY  1 - PATIENTS, 2 - IMAGES, 4 - accessionnumber
                        vStudyList,
                        '192.168.1.47', // pDICOMhost : string;
                        11114,          // pDICOMport : Integer;
                        'PACSSERVER',   // pDICOMCALLEDAE : string;
                        'TEST1',        // pDICOMCALLINGAE : string;
                        1131,           // pDICOMLocalPort : Integer;
                        1               // pIsDebug : integer
                      ) ; 
           finally
             vStudyList.Free;
           end;
         except
         on E:Exception do
           MessageDlg('ERROR: '+E.Message, mtWarning, [mbOK], 0);
         end;
      end;
    Finally
      FreeLibrary(DLL_HANDLE);
    End;
  end else
    MessageDlg('Не найден файл '+c_fileDLL, mtWarning, [mbOK], 0);
end;

end.
