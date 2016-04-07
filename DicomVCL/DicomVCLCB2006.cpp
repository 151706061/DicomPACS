//---------------------------------------------------------------------------

#include <basepch.h>
#pragma hdrstop
USEFORMNS("SelectPacsHost.pas", Selectpacshost, SelectPacsHostForm);
USEFORMNS("ImageAttributesList.pas", Imageattributeslist, ImageAttributesForm);
USEFORMNS("Save2MpegStatus.pas", Save2mpegstatus, Convert2MpegStatusForm);
USEFORMNS("DefineCal.pas", Definecal, CalibrateForm);
USEFORMNS("SetupLayout.pas", Setuplayout, LayoutSetupForm);
USEFORMNS("Dicom2AVIStatus.pas", Dicom2avistatus, Dicom2AVIStatusForm);
USEFORMNS("ImportAVIProcessing.pas", Importaviprocessing, ImportAVIProcessBarForm);
USEFORMNS("SelectNewHost.pas", Selectnewhost, NewHostForm);
USEFORMNS("KxDeviceCaps.pas", Kxdevicecaps, DeviceCapsForm);
USEFORMNS("KxDriverInfo.pas", Kxdriverinfo, frmSettings);
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------

//   Package source.
//---------------------------------------------------------------------------

#pragma argsused
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
        return 1;
}
//---------------------------------------------------------------------------
 