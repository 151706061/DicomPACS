unit UnTestMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
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
  p_DicomCapture : procedure (   p_fio_pac,            // ��� ��������
                                 p_pid,                // ����� ��������
                                 p_pol,                // ���
                                 p_dateborn,           // ���� ��������

                                 p_mod,                // modality
                                 p_doctor,             // ����
                                 p_station,            // ������������ ��� �������
                                 p_accessionnumber,    // ACCESSIONNUMBER:
                                 p_STUDYUID,           // STUDYUID:
                                 p_description,        // ��������:

                                 p_get_dicom_ip,
                                 p_get_dicom_called,
                                 p_get_dicom_port,
                                 p_get_local_port,
                                 p_get_dicom_calling,

                                 p_debug:pchar
                              ); stdcall;
DLL_HANDLE: THandle;
const c_fileDLL = 'c:\Delphi\Trunk_AUTH\ASU2\Dicom\QueryList\Bin\DicomCapture.dll';
begin  //
  if FileExists(c_fileDLL) then
  begin
    DLL_HANDLE:= LoadLibrary(c_fileDLL);
    Try
      if DLL_HANDLE <> 0 then
      begin
      {  @p_DicomTest := GetProcAddress(DLL_HANDLE, 'p_DicomTest');
        if @p_DicomTest <> nil then
         p_DicomTest; }
        @p_DicomCapture := GetProcAddress(DLL_HANDLE, 'p_DicomCapture');
        if @p_DicomCapture <> nil then
         try
           p_DicomCapture(       'p_fio_pac',            // ��� ��������
                                 'p_pid',                // ����� ��������
                                 '�',                // ���
                                 '31.12.1977',           // ���� ��������

                                 'CT',                // modality
                                 '������ ���� ��������',             // ����
                                 '������� �����',            // ������������ ��� �������
                                 'AN-20150326/11/23',    // ACCESSIONNUMBER:
                                 'ST-20150326/11/23',           // STUDYUID:
                                 '������� ������������',        // ��������:

                                 '192.168.1.47', // p_get_dicom_ip,
                                 'PACSSERVER',   // p_get_dicom_called,
                                 '11114',        // p_get_dicom_port,
                                 '1131',         // p_get_local_port,
                                 'TEST1',         // p_get_dicom_calling,

                                 '0'
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
    MessageDlg('�� ������ ���� '+c_fileDLL, mtWarning, [mbOK], 0);
end;

end.
