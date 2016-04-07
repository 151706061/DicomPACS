library DicomCapture;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  Forms,
  Dialogs,
  Windows,
  fCapture in 'fCapture.pas' {frmCapture},
  CmnUnit in '..\..\..\uCommon_Dicom\CmnUnit.pas',
  DB_CMN in '..\..\..\uCommon_Dicom\DB_CMN.pas',
  db_cmn1 in '..\..\..\uCommon_Dicom\db_cmn1.pas',
  DICOM_CMN in '..\..\..\uCommon_Dicom\DICOM_CMN.pas',
  fCine in '..\..\..\uCommon_Dicom\fCine.pas' {frmCine},
  fHeader in '..\..\..\uCommon_Dicom\fHeader.pas' {frmHeader},
  fSendParam in '..\..\..\uCommon_Dicom\fSendParam.pas' {frmSendParam},
  fSnimki in '..\..\..\uCommon_Dicom\fSnimki.pas' {frmSnimki},
  MprUnit in '..\..\..\uCommon_Dicom\MprUnit.pas' {MprForm},
  SurfaceRenderEx in '..\..\..\uCommon_Dicom\SurfaceRenderEx.pas' {SurfaceRenderForm},
  UnAbout in '..\..\..\uCommon_Dicom\UnAbout.pas' {FrmAbout},
  UnATRIS in '..\..\..\uCommon_Dicom\UnATRIS.pas',
  UnComment in '..\..\..\uCommon_Dicom\UnComment.pas' {frmComment},
  UnDiagEdt in '..\..\..\uCommon_Dicom\UnDiagEdt.pas' {frmDiagEdt},
  UnFrmAddDocument in '..\..\..\uCommon_Dicom\UnFrmAddDocument.pas' {FrmAddDocument},
  UnFrmDiagTree in '..\..\..\uCommon_Dicom\UnFrmDiagTree.pas' {frmDiag},
  UnFrmEcgFrag in '..\..\..\uCommon_Dicom\UnFrmEcgFrag.pas' {FrmEcgFrag},
  UnFrmFileBrowse in '..\..\..\uCommon_Dicom\UnFrmFileBrowse.pas' {frmFileBrowse},
  UnFrmGetDevices in '..\..\..\uCommon_Dicom\UnFrmGetDevices.pas' {FrmGetDevices},
  UnFrmProgressBar in '..\..\..\uCommon_Dicom\UnFrmProgressBar.pas' {FrmProgressBar},
  UnFrmSize in '..\..\..\uCommon_Dicom\UnFrmSize.pas' {FrmSize},
  unImportPDF in '..\..\..\uCommon_Dicom\unImportPDF.pas' {frmImportPDF},
  UnKalibr in '..\..\..\uCommon_Dicom\UnKalibr.pas' {frmKalibr},
  UnMultiFormsFrame in '..\..\..\uCommon_Dicom\UnMultiFormsFrame.pas' {MultiForms: TFrame},
  VolumeRenderingEx in '..\..\..\uCommon_Dicom\VolumeRenderingEx.pas' {VolumeRenderingForm},
  fMain in 'fMain.pas' {frmMain};

{$R *.res}

procedure p_DicomCapture (   p_fio_pac,            // фио пациента
                             p_pid,                // номер медкарты
                             p_pol,                // пол
                             p_dateborn,           // дата рождения

                             p_mod,                // modality
                             p_doctor,             // врач
                             p_station,            // наименование раб станции
                             p_accessionnumber,    // ACCESSIONNUMBER:
                             p_STUDYUID,           // STUDYUID:
                             p_description,        // Описание:

                             p_get_dicom_ip,
                             p_get_dicom_called,
                             p_get_dicom_port,
                             p_get_local_port,
                             p_get_dicom_calling,
                             
                             p_debug:pchar
                          ); stdcall;
var DllHandl : THandle; F:TextFile;
     v_fio_pac,            // фио пациента
     v_pid,                // номер медкарты
     v_pol,                // пол
     v_dateborn,           // дата рождения

     v_mod,                // modality
     v_doctor,             // врач
     v_station,            // наименование раб станции
     v_accessionnumber,    // ACCESSIONNUMBER:
     v_STUDYUID,           // STUDYUID:
     v_description,        // Описание:

     v_get_dicom_ip,
     v_get_dicom_called,
     v_get_dicom_port,
     v_get_local_port,
     v_debug,
     v_get_dicom_calling,
     vDir : string;
    v_AppHandl : THandle;
const c_FileStart = 'DicomCapture.log';
  procedure WrtLog (pStr:string);
  begin
    if FileExists(c_FileStart) then
    begin
      Assign(F,c_FileStart);
      Append(F);
    end else
    begin
      Assign(F,c_FileStart);
      Rewrite(F);
    end;
    Writeln(F,pStr);
    CloseFile(F);
  end;
begin
  vDir := GetCurrentDir;
  try
    SetCurrentDir( ExtractFilePath(ParamStr(0)) );
    if p_debug='1' then
      WrtLog('p_DicomCapture STARTED ...');
    try
      Application.CreateHandle;
    except
    on E:Exception do
      WrtLog('error - '+E.Message);
    end;

     v_fio_pac           := p_fio_pac ;
     v_pid               := p_pid ;
     v_pol               := p_pol ;
     v_dateborn          := p_dateborn ;

     v_mod               := p_mod ;
     v_doctor            := p_doctor ;
     v_station           := p_station ;
     v_accessionnumber   := p_accessionnumber ;
     v_STUDYUID          := p_STUDYUID ;
     v_description       := p_description ;

     v_get_dicom_ip      := p_get_dicom_ip ;

     v_get_dicom_called  := p_get_dicom_called ;
     if Trim(v_get_dicom_called)='' then v_get_dicom_called:='PACSSERVER';

     v_get_dicom_port    := p_get_dicom_port ;
     v_get_local_port    := p_get_local_port ;

     v_get_dicom_calling := p_get_dicom_calling;
     if Trim(v_get_dicom_calling)='' then v_get_dicom_calling:='TEST1';

     v_debug             := p_debug ;

      pStartCapture (  v_fio_pac,            // фио пациента
                       v_pid,                // номер медкарты
                       v_pol,                // пол
                       v_dateborn,           // дата рождения

                       v_mod,                // modality
                       v_doctor,             // врач
                       v_station,            // наименование раб станции
                       v_accessionnumber,    // ACCESSIONNUMBER:
                       v_STUDYUID,           // STUDYUID:
                       v_description,        // Описание:

                       v_get_dicom_ip,
                       v_get_dicom_called,
                       v_get_dicom_port,
                       v_get_local_port,
                       v_get_dicom_calling,
                       v_debug
                    );

  except
    on E:Exception do begin
      WrtLog('ERROR : '+E.Message);
      MessageDlg('ERROR : '+E.Message, mtError, [mbOK], 0);
    end;
  end;
  SetCurrentDir(vDir);

end;

exports
  p_DicomCapture;

begin
end.
