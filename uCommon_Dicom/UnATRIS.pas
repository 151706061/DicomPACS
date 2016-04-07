unit UnATRIS;

{ ������ ��� ������ � �����
  ��������� � TSMINI :
  begin
    asu.pkg_smini.WRITESTRING('DLL_WORKLIST_NAZN','atris_webpage','http://192.168.56.101:2080/login?redirect=');
    -- � ��� �������� �� ��� ���� :
    asu.pkg_smini.WRITESTRING('DLL_WORKLIST_NAZN','atris_mssql_conn_str', 'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;User ID=sa;Initial Catalog=ClusterPacsServer;Data Source=AFOMIN\MSSQL2012;');
    -- �������� � ����������
    -- asu.pkg_smini.WRITESTRING('DLL_WORKLIST_NAZN','atris_mssql_conn_str', 'Provider=SQLOLEDB.1;Password=Password2013;Persist Security Info=True;User ID=sa;Initial Catalog=ClusterPacsServer;Data Source=10.1.1.18'
    asu.pkg_smini.WRITESTRING('DLL_WORKLIST_NAZN','atris_webuser','Hipax');
    asu.pkg_smini.WRITESTRING('DLL_WORKLIST_NAZN','atris_webpassword','Hipax');
    asu.pkg_smini.WRITESTRING('DLL_WORKLIST_NAZN','atris_use','1');
    asu.pkg_smini.WRITESTRING('DLL_WORKLIST_NAZN','atris_web_timeout','20000');
    -- ������������ WL - ��������� ������
    asu.pkg_smini.WRITESTRING('XRAY','XRAY_USE_WL','-1');
  end;
�������� ��������� USE_C_MOVE = -1

}

interface

Uses Windows, Oracle, DateUtils, SysUtils, Dialogs;

var
  DLL_HANDLE: THandle;

const c_fileDLL = 'dll_worklist_nazn.dll';
      c_fld_razd = '|';
      c_razdel = 'DLL_WORKLIST_NAZN';


function f_chk_atris(p_OraSession:TOracleSession):Boolean;
function f_gtTSMINI ( p_OraSession:TOracleSession; p_key : string; p_section : string ) : string;

function f_chk_cabinet( p_OraSession:TOracleSession; p_ROOMID:Integer; var p_AETitle:string):Boolean;

procedure p_ATRISWorklistIns( p_OraSession:TOracleSession;
                              p_PatientIDINS : string;      // ����� ����� -> PatientID
                              p_patPrefix : string;         // patPrefix (�� ���)
                              p_PatientFamily : string;     // �������
                              p_PatientNAME : string;       // ���
                              p_PatientSurname : string;    // ��������
                              p_BirthDate : TDateTime;         // ���� �������� -> PatientBirthDate
                              p_Sex : string;               // ���
                              p_AETitle : string;           // AETitle ��������
                              p_Room : string;              // ������� (�� ���)
                              p_DiagnMKB10 : string;        // ��� ����. �������� �� ���-10 -> �� ���
                              p_Podrazdelenie : string;     // ����������� �������������
                              p_VrachFam : string;          // ������� ������������ �����
                              p_VrachIm : string;           // ��� ������������ �����
                              p_VrachOtch : string;         // �������� ������������ �����
                              p_Modality : string;          // Modality
                              p_BodyPart : string;          // �������� ����������� ����� ����
                              p_StudyName : string;         // �������� ������������
                              p_FASTEST : string;           // ���������� (1/0)-> �� ��� (integer)
                              p_DateTimeNapravl : TDateTime;       // ���� / ����� �����������
                              p_Polikl_Statsionar : string; // 0 - �����������, 1 - ���������
                              p_AccessionNumber : string;    // AccessionNumber
                              p_studyinstanceuid : string  // studyinstanceuid
                            );


implementation

function f_gtTSMINI ( p_OraSession:TOracleSession; p_key : string; p_section : string ) : string;
var v_OraclePackage : TOraclePackage;
begin
  v_OraclePackage := TOraclePackage.Create(nil);
  try
    v_OraclePackage.Session := p_OraSession;
    v_OraclePackage.PackageName:='asu.PKG_SMINI';
    Result:=v_OraclePackage.CallStringFunction('READSTRING',[p_key,p_section,'']);
  finally
    v_OraclePackage.Free;
  end;
end;

function f_chk_atris(p_OraSession:TOracleSession):Boolean;
var v_atris_mssql_conn_str : string; v_res : Boolean;
// ��������� ��� �������� ����������� MS SQL ATRIS
f_chk_mssql_atris : function  (  p_atris_mssql_conn_str : string
                               ):boolean; stdcall;
begin
  // ������ ��������� MS SQL
  v_atris_mssql_conn_str := f_gtTSMINI(p_OraSession,c_razdel,'atris_mssql_conn_str');
  // connect to ms sql
  if FileExists(c_fileDLL) then
  begin
    DLL_HANDLE:= LoadLibrary(c_fileDLL);
    Try
      if DLL_HANDLE <> 0 then
      begin
        @f_chk_mssql_atris := GetProcAddress(DLL_HANDLE, 'f_chk_mssql_atris');
        if @f_chk_mssql_atris <> nil then
          v_res:=f_chk_mssql_atris( v_atris_mssql_conn_str )
        else
        begin
          v_res:=False;
          MessageDlg( '������ ������ � ����� �� �������� '+#13+#10+
                      '�������� �������������� ������� ...',
                      mtError, [mbOK], 0);
        end;
      end;
    Finally
      FreeLibrary(DLL_HANDLE);
    End;
  end else
    MessageDlg('�� ������ ���� '+c_fileDLL, mtWarning, [mbOK], 0);
  Result:=v_res;
end;

procedure p_ATRISWorklistIns( p_OraSession:TOracleSession;
                              p_PatientIDINS : string;      // ����� ����� -> PatientID
                              p_patPrefix : string;         // patPrefix (�� ���)
                              p_PatientFamily : string;     // �������
                              p_PatientNAME : string;       // ���
                              p_PatientSurname : string;    // ��������
                              p_BirthDate : TDateTime;         // ���� �������� -> PatientBirthDate
                              p_Sex : string;               // ���
                              p_AETitle : string;           // AETitle ��������
                              p_Room : string;              // ������� (�� ���)
                              p_DiagnMKB10 : string;        // ��� ����. �������� �� ���-10 -> �� ���
                              p_Podrazdelenie : string;     // ����������� �������������
                              p_VrachFam : string;          // ������� ������������ �����
                              p_VrachIm : string;           // ��� ������������ �����
                              p_VrachOtch : string;         // �������� ������������ �����
                              p_Modality : string;          // Modality
                              p_BodyPart : string;          // �������� ����������� ����� ����
                              p_StudyName : string;         // �������� ������������
                              p_FASTEST : string;           // ���������� (1/0)-> �� ��� (integer)
                              p_DateTimeNapravl : TDateTime;       // ���� / ����� �����������
                              p_Polikl_Statsionar : string; // 0 - �����������, 1 - ���������
                              p_AccessionNumber : string;    // AccessionNumber
                              p_studyinstanceuid : string  // studyinstanceuid
                            );
var v_atris_mssql_conn_str : string;
  p_INSWorklist : procedure ( p_atris_mssql_conn_str : string;
                              p_PatientIDINS : string;      // ����� ����� -> PatientID
                              p_patPrefix : string;         // patPrefix (�� ���)
                              p_PatientFamily : string;     // �������
                              p_PatientNAME : string;       // ���
                              p_PatientSurname : string;    // ��������
                              p_BirthDate : TDateTime;         // ���� �������� -> PatientBirthDate
                              p_Sex : string;               // ���
                              p_AETitle : string;           // AETitle ��������
                              p_Room : string;              // ������� (�� ���)
                              p_DiagnMKB10 : string;        // ��� ����. �������� �� ���-10 -> �� ���
                              p_Podrazdelenie : string;     // ����������� �������������
                              p_VrachFam : string;          // ������� ������������ �����
                              p_VrachIm : string;           // ��� ������������ �����
                              p_VrachOtch : string;         // �������� ������������ �����
                              p_Modality : string;          // Modality
                              p_BodyPart : string;          // �������� ����������� ����� ����
                              p_StudyName : string;         // �������� ������������
                              p_FASTEST : string;           // ���������� (1/0)-> �� ��� (integer)
                              p_DateTimeNapravl : TDateTime;       // ���� / ����� �����������
                              p_Polikl_Statsionar : string; // 0 - �����������, 1 - ���������
                              p_AccessionNumber : string;    // AccessionNumber
                              p_studyinstanceuid : string  // studyinstanceuid
                           ); stdcall;
begin  // �������� � WORKLIST
  // ������ ��������� MS SQL
  v_atris_mssql_conn_str := f_gtTSMINI(p_OraSession,c_razdel,'atris_mssql_conn_str');
  if MessageDlg('�� ������� �������� ������ � WORKLIST ?', mtConfirmation, [mbOK,mbCancel], 0) = IDOk 
  then
    if FileExists(c_fileDLL) then
    begin
      DLL_HANDLE:= LoadLibrary(c_fileDLL);
      Try
        if DLL_HANDLE <> 0 then
        begin
          @p_INSWorklist := GetProcAddress(DLL_HANDLE, 'p_INSWorklist');
          if @p_INSWorklist <> nil then
          begin
            p_INSWorklist(v_atris_mssql_conn_str,
                          p_PatientIDINS ,      // ����� ����� -> PatientID
                          p_patPrefix ,         // patPrefix (�� ���)
                          p_PatientFamily ,    // �������
                          p_PatientNAME ,       // ���
                          p_PatientSurname ,    // ��������
                          p_BirthDate ,        // ���� �������� -> PatientBirthDate
                          p_Sex ,               // ���
                          p_AETitle ,          // AETitle ��������
                          p_Room,            // ������� (�� ���)
                          p_DiagnMKB10 ,       // ��� ����. �������� �� ���-10 -> �� ���
                          p_Podrazdelenie ,     // ����������� �������������
                          p_VrachFam ,        // ������� ������������ �����
                          p_VrachIm ,          // ��� ������������ �����
                          p_VrachOtch ,         // �������� ������������ �����
                          p_Modality ,         // Modality
                          p_BodyPart ,          // �������� ����������� ����� ����
                          p_StudyName ,         // �������� ������������
                          p_FASTEST ,         // ���������� (1/0)-> �� ��� (integer)
                          p_DateTimeNapravl ,       // ���� / ����� �����������
                          p_Polikl_Statsionar , // 0 - �����������, 1 - ���������
                          p_AccessionNumber ,    // AccessionNumber
                          p_studyinstanceuid      // StudyInstanceUID  
                         );
          end;
        end;
      Finally
        FreeLibrary(DLL_HANDLE);
      End;
    end else
      MessageDlg('�� ������ ���� '+c_fileDLL, mtWarning, [mbOK], 0);
end;

function f_chk_cabinet( p_OraSession:TOracleSession; p_ROOMID:Integer; var p_AETitle:string):Boolean;
begin
  With TOracleQuery.Create(nil) do
  try
    Session:=p_OraSession;
    SQL.Text:='select fc_aetitle from asu.txray_apparats where fk_kabinet=:p_fk_kabinet';
    DeclareAndSet('p_fk_kabinet',otInteger,p_ROOMID);
    Execute;
    if Eof then
      Result:=False
    else
    begin
      Result:=True;
      p_AETitle:=FieldAsString('fc_aetitle');   // ������ AETITLE
    end;
  finally
    Free;
  end;
end;
{
!!! ���������� ���������� ������
GET_RG_GROUP
��� ������ ������ ������������

 ������ ������������ - �.�. ������� ����
SELECT FK_ID, FC_NAME, FK_OWNER, FN_ORDER
  FROM ASU.TSMID TS
WHERE FK_OWNER = ASU.GET_RG_GROUP
  AND FL_SHOWPRINT = 1
  AND FL_DEL = 0
  AND (SELECT COUNT(*) FROM ASU.TSMID, ASU.TNAZVRACH
        WHERE FK_DEFAULT = TS.FK_ID
          AND FK_KABINETID = :PFK_KABINET
          AND TSMID.FK_ID = TNAZVRACH.FK_SMID
          AND FL_DEL = 0
          AND FL_SHOWPRINT = 1
          AND FK_SOTRID = :PFK_SOTRID) > 0

ORDER BY FN_ORDER

������������ � �������� ����� - �.�. ������� � �������������
SELECT FK_SMID,
       ASU.GET_NAME_RGISSL(FK_SMID) ||'/'||TS.FC_TIME||'/'||TRIM(TO_CHAR(TS.FN_NORM0, 'B9G999G999G990D99', 'NLS_NUMERIC_CHARACTERS = ''.0''')) AS FC_NAME
  FROM ASU.TNAZVRACH, ASU.TSMID TS
 WHERE TNAZVRACH.FK_KABINETID = :PFK_KABINET
   AND (SELECT FK_DEFAULT FROM ASU.TSMID WHERE FK_ID = TNAZVRACH.FK_SMID) = :PFK_GROUP
   AND TNAZVRACH.FK_SMID = TS.FK_ID
   AND TS.FL_DEL = 0
   AND TNAZVRACH.FK_SOTRID = :PFK_SOTR

ORDER BY TS.FN_ORDER
}

end.
