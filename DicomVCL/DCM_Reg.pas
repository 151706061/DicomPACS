{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DCM_Reg;

interface
{$I DicomPack.inc}

uses
  Classes, TypInfo, forms
  {$IFDEF COMPILER6}, DesignIntf, DesignEditors, VCLEditors{$ELSE}, DsgnIntf{$ENDIF}
  ;

procedure Register;

implementation

uses
  DCM32, Dcm_View, DCM_Client, DCM_MemTable, DCM_Server, DicomVFWView,
  OpenGlPanel, DCM_MPR, DCM_WADO,{$IFDEF COMPILER6} DCM32_PlotWindow,
  KxGraph3D,{$ENDIF} DicomBurner, Dcm_GLView,
  DCM_ConferenceServer, V3DRenWindow,
  {$IFDEF NEED_DIRECTX_CAPTURE}DicomVideoCap, {$ENDIF}DicomHistogramBox;

{ Registration }

procedure Register;
begin

  RegisterComponents('DicomVCL', [TCnsDicomConnection, TCnsDicomPrinter,
    TDicomServerCore, TKXHTTPServerCore, TWADOServerCore, TCnsCDBurner,
      TKxmMemTable, TCnsDBTable, TCnsDMTable, TDicomMultiLayoutViewer,
      TDicomMultiViewer, TDicomView,
      TCnsMultiImage32, TDCMMultiImage, TCnsImgView32,
      TDicomHistogramBox, TDicomGLView, TOpenGlPanel, TDicomViewGL,
      TVideoView, TCineView, TMPRDicomImage,
      TDCMConferenceServerServerCore, TDCMConferenceClient,
      TCns3DRenderWindow{$IFDEF COMPILER6}, TFFTPlot32, TPlotPanel, TPlotWindow32{$ENDIF}

    {$IFDEF NEED_DIRECTX_CAPTURE}, TDicomVideoCapture{$ENDIF}]);
end;

end.

