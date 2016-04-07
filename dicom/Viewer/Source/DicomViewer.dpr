program DicomViewer;

uses
  Forms,
  SysUtils,
  Dialogs,
  Controls,
  Classes,
  UnFrmProgressBar in '..\..\..\uCommon_Dicom\UnFrmProgressBar.pas' {FrmProgressBar},
  UnKalibr in '..\..\..\uCommon_Dicom\UnKalibr.pas' {frmKalibr},
  fCine in '..\..\..\uCommon_Dicom\fCine.pas' {frmCine},
  UnMultiFormsFrame in '..\..\..\uCommon_Dicom\UnMultiFormsFrame.pas' {MultiForms: TFrame},
  UnFrmSize in '..\..\..\uCommon_Dicom\UnFrmSize.pas' {FrmSize},
  SurfaceRenderEx in '..\..\..\uCommon_Dicom\SurfaceRenderEx.pas' {SurfaceRenderForm},
  VolumeRenderingEx in '..\..\..\uCommon_Dicom\VolumeRenderingEx.pas' {VolumeRenderingForm},
  UnFrmGetDevices in '..\..\..\uCommon_Dicom\UnFrmGetDevices.pas' {FrmGetDevices},
  fSendParam in '..\..\..\uCommon_Dicom\fSendParam.pas' {frmSendParam},
  fHeader in '..\..\..\uCommon_Dicom\fHeader.pas' {frmHeader},
  CmnUnit in '..\..\..\uCommon_Dicom\CmnUnit.pas',
  DB_CMN in '..\..\..\uCommon_Dicom\DB_CMN.pas',
  DICOM_CMN in '..\..\..\uCommon_Dicom\DICOM_CMN.pas',
  fSnimki in '..\..\..\uCommon_Dicom\fSnimki.pas' {frmSnimki},
  UnFrmEcgFrag in '..\..\..\uCommon_Dicom\UnFrmEcgFrag.pas' {FrmEcgFrag},
  fCD in '..\..\..\uCommon_Dicom\fCD.pas' {frmCD},
  db_cmn1 in '..\..\..\uCommon_Dicom\db_cmn1.pas',
  UnComment in '..\..\..\uCommon_Dicom\UnComment.pas' {frmComment},
  UnFrmAddDocument in '..\..\..\uCommon_Dicom\UnFrmAddDocument.pas' {FrmAddDocument},
  UnFrmFileBrowse in '..\..\..\uCommon_Dicom\UnFrmFileBrowse.pas' {frmFileBrowse},
  unImportPDF in '..\..\..\uCommon_Dicom\unImportPDF.pas' {frmImportPDF},
  UnFrmDiagTree in '..\..\..\uCommon_Dicom\UnFrmDiagTree.pas' {frmDiag},
  UnDiagEdt in '..\..\..\uCommon_Dicom\UnDiagEdt.pas' {frmDiagEdt},
  UnAbout in '..\..\..\uCommon_Dicom\UnAbout.pas' {FrmAbout},
  V3DRenWindow in '..\..\..\..\DicomVCL\V3DRenWindow.pas',
  fProgressCD in '..\..\..\uCommon_Dicom\fProgressCD.pas' {frmProgressCD},
  UnfrmProgressBurn in '..\..\..\uCommon_Dicom\UnfrmProgressBurn.pas' {frmProgressBurn};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Просмотр DICOM';
  Application.CreateForm(TfrmSnimki, frmSnimki);
  fSnimki.v_is_show_err_msg_ld_files:=False;
  fSnimki.v_isnot_show_3d:=True;
  SetInvisible3D;

  if MessageDlg('Загрузить исследования ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    SetCurrentDir( ExtractFilePath(paramstr(0)) );
    fSnimki.LdImg(True);
  end;
//  ReportMemoryLeaksOnShutdown := true;
  frmSnimki.v_is_start_dicom_server:=False;
  frmSnimki.v_is_main_form:=True;
  frmSnimki.ParamsViewerIni;
  Application.Run;
  { if ParamCount <> 1 then
    begin
      frmSnimok.JoinExtension();
      frmSnimok.DoShowForm;
      Application.Run;
    end else
    begin
      if not frmSnimok.IsRunApp(ParamStr(1)) then
        begin
          frmSnimok.Close();
          FreeAndNil(frmSnimok);
        end else
        begin
          frmSnimok.JoinExtension();
          frmSnimok.DoShowForm;
          Application.Run;
        end;
    end; }
end.
