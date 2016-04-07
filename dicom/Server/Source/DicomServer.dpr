// JCL_DEBUG_EXPERT_GENERATEJDBG ON
// JCL_DEBUG_EXPERT_INSERTJDBG ON
program DicomServer;

uses
  Forms,
  fMain in 'fMain.pas' {frmMain},
  fParam in 'fParam.pas' {frmParam},
  fReasonStop in 'fReasonStop.pas' {frmReasonStop},
  fAbout in 'fAbout.pas' {frmAbout},
  fFilter in 'fFilter.pas' {frmFilter},
  fParamsBD in 'fParamsBD.pas' {frmParamsBD},
  fCopy in 'fCopy.pas' {frmCopy},
  fArchive in 'fArchive.pas' {frmArchive},
  fAddEditDevice in 'fAddEditDevice.pas' {frmAddEditDevice},
  uPeriod in 'uPeriod.pas' {frmParamDate};

//ExceptDlg D:\Install\Delphi\Components_Utils\Components\JEDI\3.36\jcl\experts\debug\dialog\
{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Dicom-сервер';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowMainForm;
  Application.Run;
end.
