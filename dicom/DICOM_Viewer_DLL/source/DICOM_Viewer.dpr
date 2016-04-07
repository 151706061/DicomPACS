// JCL_DEBUG_EXPERT_GENERATEJDBG OFF
// JCL_DEBUG_EXPERT_INSERTJDBG OFF
library DICOM_Viewer;

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
  UnMain in 'UnMain.pas',
  UnData in 'UnData.pas' {DataModule1: TDataModule},
  CmnUnit in '..\..\..\uCommon_Dicom\CmnUnit.pas',
  DB_CMN in '..\..\..\uCommon_Dicom\DB_CMN.pas',
  DICOM_CMN in '..\..\..\uCommon_Dicom\DICOM_CMN.pas',
  fCine in '..\..\..\uCommon_Dicom\fCine.pas',
  fHeader in '..\..\..\uCommon_Dicom\fHeader.pas',
  fSendParam in '..\..\..\uCommon_Dicom\fSendParam.pas',
  fSnimki in '..\..\..\uCommon_Dicom\fSnimki.pas',
  MprUnit in '..\..\..\uCommon_Dicom\MprUnit.pas',
  SurfaceRenderEx in '..\..\..\uCommon_Dicom\SurfaceRenderEx.pas',
  UnATRIS in '..\..\..\uCommon_Dicom\UnATRIS.pas',
  UnFrmGetDevices in '..\..\..\uCommon_Dicom\UnFrmGetDevices.pas',
  UnFrmSize in '..\..\..\uCommon_Dicom\UnFrmSize.pas',
  UnKalibr in '..\..\..\uCommon_Dicom\UnKalibr.pas',
  UnMultiFormsFrame in '..\..\..\uCommon_Dicom\UnMultiFormsFrame.pas',
  VolumeRenderingEx in '..\..\..\uCommon_Dicom\VolumeRenderingEx.pas',
  DICOM_charset in '..\..\..\..\DicomVCL\DICOM_charset.pas',
  UnFrmProgressBar in '..\..\..\uCommon_Dicom\UnFrmProgressBar.pas' {FrmProgressBar},
  DCM_Server in '..\..\..\..\DicomVCL\DCM_Server.pas',
  uCommonXray in '..\..\..\uCommon_Kolya\uCommonXray.pas',
  UnFrmEcgFrag in '..\..\..\uCommon_Dicom\UnFrmEcgFrag.pas' {FrmEcgFrag},
  UnFrmFileBrowse in '..\..\..\uCommon_Dicom\UnFrmFileBrowse.pas' {frmFileBrowse},
  UnFrmAddDocument in '..\..\..\uCommon_Dicom\UnFrmAddDocument.pas' {FrmAddDocument},
  UnComment in '..\..\..\uCommon_Dicom\UnComment.pas' {frmComment},
  fCD in '..\..\..\uCommon_Dicom\fCD.pas' {frmCD},
  UnAbout in '..\..\..\uCommon_Dicom\UnAbout.pas' {FrmAbout},
  UnDiagEdt in '..\..\..\uCommon_Dicom\UnDiagEdt.pas' {frmDiagEdt},
  UnFrmDiagTree in '..\..\..\uCommon_Dicom\UnFrmDiagTree.pas' {frmDiag},
  unImportPDF in '..\..\..\uCommon_Dicom\unImportPDF.pas' {frmImportPDF},
  fProgressCD in '..\..\..\uCommon_Dicom\fProgressCD.pas' {frmProgressCD},
  UnfrmProgressBurn in '..\..\..\uCommon_Dicom\UnfrmProgressBurn.pas' {frmProgressBurn};

{$R *.res}

procedure p_DicomTest ; stdcall;
var //DllHandl : THandle;
    v_AccessionNumber:string;
   v_studyUID:string;
   v_get_dicom_ip:string;
   v_get_dicom_called:string;
   v_get_dicom_port:string;
   v_get_local_port:string;
   vDirTmp : string;
begin
  vDirTmp:=GetCurrentDir;
  MessageDlg('p_DicomShowSnimki STARTED ...', mtWarning, [mbOK], 0);
  try
    Application.CreateHandle;
  except
  on E:Exception do
    MessageDlg('error - '+E.Message, mtWarning, [mbOK], 0);
  end;
  v_AccessionNumber:='AN-15.1.2015.33082398';
  v_studyUID:='';
  v_get_dicom_ip:='192.168.1.47';
  v_get_dicom_called:='PACSSERVER';
  v_get_dicom_port:='11114';
  v_get_local_port:='1131';
  try
  //  v_AppHandl := p_AppHandl;
    DicomServerCoreCREATE;
    p_showSnimkiDicom (  v_AccessionNumber,
                         v_studyUID ,
                         v_get_dicom_ip,
                         v_get_dicom_called,
                         v_get_dicom_port,
                         v_get_local_port
                      );
  finally
    DicomServerCoreFREE;
    SetCurrentDir(vDirTmp);
  //  Application.Handle := DllHandl;
  end;
end;

procedure p_DicomShowSnimki ( // p_AppHandl : THandle;
                               p_AccessionNumber,
                               p_studyUID,
                               p_get_dicom_ip,
                               p_get_dicom_called,
                               p_get_dicom_port,
                               p_get_local_port,
                               p_debug:pchar
                            ); stdcall;
var // DllHandl : THandle;
    F:TextFile;
    v_AccessionNumber, v_studyUID, vDir : string;
//    v_AppHandl : THandle;
const c_FileStart = 'DicomShowSnimki.log';
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
//  ReportMemoryLeaksOnShutdown := True;
//  v_AppHandl:=Application.Handle;
//WrtLog( 'start !!!' );
  vDir := GetCurrentDir;
  try
    try
      SetCurrentDir( ExtractFilePath(ParamStr(0)) );
  //    WrtLog('p_DicomShowSnimki STARTED ...');
      if p_debug='1' then
        WrtLog('p_DicomShowSnimki STARTED ...');
      try
        Application.CreateHandle;
      except
      on E:Exception do
        WrtLog('error - '+E.Message);
      end;
      if p_debug='1' then
        WrtLog('CreateHandle ...');
     // p_AccessionNumber:=p_AccessionNumber;
    //  v_studyUID:=p_studyUID;
      v_get_dicom_ip:=p_get_dicom_ip;
      v_get_dicom_called:=p_get_dicom_called;
      v_get_dicom_port:=p_get_dicom_port;
      v_get_local_port:=p_get_local_port;
      v_AccessionNumber := p_AccessionNumber;
      v_studyUID        := p_studyUID;
      //
      try
      //  v_AppHandl := p_AppHandl;
        if p_debug='1' then
          WrtLog('DicomServerCoreCREATE ...');

        DicomServerCoreCREATE;
        if p_debug='1' then
          WrtLog('p_showSnimkiDicom ...');

        p_showSnimkiDicom (  v_AccessionNumber, // p_AccessionNumber,
                             v_studyUID, // p_studyUID ,
                             v_get_dicom_ip,
                             v_get_dicom_called,
                             v_get_dicom_port,
                             v_get_local_port
                          );
      finally
        DicomServerCoreFREE;
        if p_debug='1' then
          WrtLog('DicomServerCoreFREE ...');

      //  Application.Handle := DllHandl;
      end;
    except
      on E:Exception do
        WrtLog('ERROR : '+E.Message);
    end;
  finally
    SetCurrentDir(vDir);
  end;

//  Application.Handle:=v_AppHandl;
end;

procedure p_DicomViewer;  stdcall;
begin

end;

procedure p_showSnimki (  p_AppHandl : THandle;
                          p_OracleSession: pointer;
                          p_patientID:string;
                          p_AccessionNumber:string;
                          p_studyUID:string;
                          p_old_form : Boolean;
                          p_use_c_get : Boolean = False
                       ); stdcall;
var DllHandl : THandle;
    vDirTmp : string;
begin

// ShowMessage('123');

  vDirTmp:=GetCurrentDir;
  DllHandl := Application.Handle;
  Application.Handle := p_AppHandl;
  try
    setSession(p_OracleSession);
    DicomServerCoreCREATE;
    v_AppHandl := p_AppHandl;
    v_is_old_form:=p_old_form;
    p_showSnimkiMN (  p_patientID,
                      p_AccessionNumber,
                      p_studyUID,
                      p_old_form,
                      p_use_c_get
                   );
  finally
    DicomServerCoreFREE;
    Application.Handle := DllHandl;
    SetCurrentDir(vDirTmp);
  end;
end;

exports
  p_showSnimki,
  p_DicomShowSnimki,
  p_DicomTest,
  p_DicomViewer;

begin
end.
