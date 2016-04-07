{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DicomVideoCapStrings;

interface

uses DicomVideoCap;

const
  DialogTitles: array [TCaptureDialog] of string = (
    'Video Format',	        // VFORMAT,
    'Video Source',	        // VSOURCE,
    'Video Display',	        // VDISPLAY,
    'Video Capture Filter',	// VCAPTURE,
    'Video Crossbar',           // VCROSSBAR,
    'TV Tuner',	                // TVTUNER,
    'Audio Capture Filter',	// ACAPTURE,
    'Audio Crossbar',           // ACROSSBAR,
    'TV Audio',	                // TVAUDIO,
    'Video Capture Pin',	// VCAPTURE_PIN,
    'Video Preview Pin',	// VPREVIEW_PIN,
    'Audio Capture Pin',        // ACAPTURE_PIN
    'Video Compressor',	        // VCOMPRESSOR,
    'Audio Compressor'	        // ACOMPRESSOR,
  );

resourcestring

  rsDShowCapture = 'DirectShow - Capture';
  rsCantRenderCC = 'Cannot render closed captioning!';
  rsCantSetPreviewFrameRate = '%x: can''t set preview frame rate!';
  rsSetMasterStreamFailed = 'SetMasterStream failed!';
  rsCantSetCaptureFile = 'Can''t set capture file!';
  rsCantRenderVCaptureStream = 'Can''t render video capture stream!';
  rsCantRenderPreviewStream = 'Can''t render preview stream!';
  rsCantRenderACaptureStream = 'Can''t render audio capture stream!';
  rsCantRenderAPreviewStream = 'Can''t render audio preview stream!';
  rsThisGraphCantPreview = 'This graph cannot preview!';
  rsCantSetCaptureFrameRate = 'Cannot set frame rate for capture!';
  rsCantMakeGraphBuilder = 'Can''t init graph builder. Probably DirectShow is not installed!';
  rsCantCreateVCaptureFilter = 'Error %x.'#13#10'Can''t create video capture filter - propably you havn''t video capture device!';
  rsCantMakeGraph = 'Can''t init graph. Probably DirectShow is not installed!';
  rsCantSetFilterGraph = 'Can''t set filter graph!';
  rsCantAddVFilterToGraph = 'Error %x: Can''t add video capture filter into graph!';
  rsCantFindVStreamConfig = 'Error %x: Can''t find VCapture:IAMStreamConfig!';
  rsCantMakeACapFilter = 'Can''t create audio capture filter!';
  rsCantAddAFilterToGraph = 'Error %x: Can''t add audio capture filter into graph!';
  rsCantFindAStreamConfig = 'Can''t find ACapture:IAMStreamConfig!';
  rsCantRunPreviewGraph = 'Error %x: Cannot run preview graph!';
  rsCantStopPreviewGraph = 'Error %x: Cannot stop preview graph!';
  rsCantGetMediaControl = 'Error %x: Can''t get IMediaControl!';
  rsCantRunGraph = 'Error %x: Cannot run graph!';
//  rsStartCapture = 'Starting capture!';
  // FOMIN 26.10.2012
  rsStartCapture = 'Запустить захват видео ?';
  rsCantStopGraph = 'Error %x: Cannot stop graph!';
  rsEmptyFileName = 'Capture filename required!';
  rsFailedToAllocFileSize = 'Can''t allocate space for capture file! Disk full?';
  rsCantInstallSampleGrabber = 'Can''t install SampleGrabber. Probably wrong color depth used?';
  rsCantAddVCompFilter = 'Can''t add video compression';
  rsCantAddACompFilter = 'Can''t add audio compression';
  rsCantAddDVSplitter = 'Can''t add DV Splitter';
  rsCantAddDVDecoder = 'Can''t add DV Decoder';
  rsCantAddSmartTee = 'Can''t add SmartTee';
  rsCantAddInfTee = 'Can''t add InfiniteTee';

implementation

end.
