{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit Dicom2AVIStatus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, CnsVfw, StdCtrls, Buttons, ComCtrls, DCM_Attributes,
  DCM_ImageData_Bitmap;

type
  TAVICompressor = (acDefault, acShowDialog, acDivX);

  PAVIStream = ^IAVIStream;

  TDicom2AVIStatusForm = class(TForm)
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    TrackBar1: TTrackBar;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    SpinEdit1: TEdit;
    SpinEdit2: TEdit;
    SpinEdit3: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    AVIBitmap: TBitmap;
    AVIFrameIndex: integer;

    FBitmapInfo: PBitmapInfoHeader;
    FBitmapBits: Pointer;
    FBitmapSize: Dword;

    FWidth: integer;
    FHeight: integer;
    FFPS: byte;
    FAVIFilename: string;

    AVI_DPI: integer;
    asi: TAVIStreamInfoA;
    pfile: IAVIFile;
    Stream, Stream_c: IAVIStream; // AVI stream and stream to be compressed
    FCompressor: TAVICompressor;

  public
    { Public declarations }
    fToConvertAttributes: TDicomAttributes;

    procedure InternalAddAVIFrame;
    function CreateAVIFile(DPI: integer = 0): boolean;
    procedure AddAVIFrame(bmp: TBitmap);
    procedure CloseAVIFile(UserAbort: boolean = false);

    property FPS: byte read FFPS write FFPS default 25;
    property ImageWidth: integer read FWidth write FWidth;
    property ImageHeight: integer read FHeight write FHeight;
    property Filename: string read FAVIFilename write FAVIFilename;
    property Compressor: TAVICompressor read FCompressor write FCompressor;

  end;

var
  Dicom2AVIStatusForm: TDicom2AVIStatusForm;

implementation

uses shellapi;
{$R *.dfm}

procedure TDicom2AVIStatusForm.AddAVIFrame(bmp: TBitmap);
begin
  AVIBitmap.Canvas.Draw(0, 0, bmp);

  InternalAddAVIFrame;
end;

// InternalAddAVIFrame
//

procedure InitializeBitmapInfoHeader(Bitmap: HBITMAP; var BI: TBitmapInfoHeader);
var
  BM: Windows.TBitmap;
begin
  GetObject(Bitmap, SizeOf(BM), @BM);
  with BI do
  begin
    biSize := SizeOf(BI);
    biWidth := BM.bmWidth;
    biHeight := BM.bmHeight;
    biPlanes := 1;
    biXPelsPerMeter := 0;
    biYPelsPerMeter := 0;
    biClrUsed := 0;
    biClrImportant := 0;
    biCompression := BI_RGB;
    biBitCount := 24; // force 24 bits. Most video compressors would deal with 24-bit frames only.
    biSizeImage := (((biWidth * biBitCount) + 31) div 32) * 4 * biHeight;
  end;
end;

procedure InternalGetDIBSizes(Bitmap: HBITMAP; var InfoHeaderSize: Integer; var ImageSize: DWORD);
var
  BI: TBitmapInfoHeader;
begin
  InitializeBitmapInfoHeader(Bitmap, BI);
  InfoHeaderSize := SizeOf(TBitmapInfoHeader);
  ImageSize := BI.biSizeImage;
end;

// InternalGetDIB
//

function InternalGetDIB(bitmap: HBITMAP; var bitmapInfo; var bits): Boolean;
var
  focus: HWND;
  dc: HDC;
  errCode: Integer;
begin
  InitializeBitmapInfoHeader(bitmap, TBitmapInfoHeader(bitmapInfo));
  focus := GetFocus;
  dc := GetDC(focus);
  try
    errCode := GetDIBits(dc, bitmap, 0, TBitmapInfoHeader(bitmapInfo).biHeight,
      @bits, TBitmapInfo(bitmapInfo), DIB_RGB_COLORS);
    Result := (errCode <> 0);
  finally
    ReleaseDC(focus, dc);
  end;
end;

procedure TDicom2AVIStatusForm.InternalAddAVIFrame;
begin
  with AVIBitmap do
  begin
    InternalGetDIB(Handle, FBitmapInfo^, FBitmapBits^);
    if AVIStreamWrite(Stream_c, AVIFrameIndex, 1, FBitmapBits, FBitmapSize,
      AVIIF_KEYFRAME, nil, nil) <> AVIERR_OK then
      raise Exception.Create('Add Frame Error');
    Inc(AVIFrameIndex);
  end;
end;

function TDicom2AVIStatusForm.CreateAVIFile(DPI: Integer = 0): boolean;
var
  //  SaveDialog: TSaveDialog;
  gaAVIOptions: TAVICOMPRESSOPTIONS;
  galpAVIOptions: PAVICOMPRESSOPTIONS;
  bitmapInfoSize: Integer;
  AVIResult: Cardinal;
  ResultString: string;

  FTempName: string;
begin
  FTempName := FAVIFilename;

  Result := (FTempName <> '');
  if Result then
  begin
    if FileExists(FTempName) then
    begin
      Result := (MessageDlg(Format('Overwrite file %s?', [FTempName]),
        mtConfirmation, [mbYes, mbNo], 0) = mrYes);
      // AVI streamers don't trim the file they're written to, so start from zero
      if Result then
        DeleteFile(FTempName);
    end;
  end;

  if not Result then
    Exit;

  AVIFileInit; // initialize the AVI lib.

  AVIBitmap := TBitmap.Create;
  AVIFrameIndex := 0;

  try
    AVIBitmap.PixelFormat := pf24Bit;
    AVIBitmap.Width := FWidth;
    AVIBitmap.Height := FHeight;

    // note: a filename with extension other then AVI give generate an error.
    if AVIFileOpen(pfile, PAnsiChar(FTempName), OF_WRITE or OF_CREATE, nil) <> AVIERR_OK then
      raise Exception.Create('Cannot create AVI file. Disk full or file in use?');

    with AVIBitmap do
    begin
      InternalGetDIBSizes(Handle, bitmapInfoSize, FBitmapSize);
      FBitmapInfo := AllocMem(bitmapInfoSize);
      FBitmapBits := AllocMem(FBitmapSize);
      InternalGetDIB(Handle, FBitmapInfo^, FBitmapBits^);
    end;

    FillChar(asi, sizeof(asi), 0);

    with asi do
    begin
      fccType := streamtypeVIDEO; //  Now prepare the stream
      fccHandler := 0;
      dwScale := 1; // dwRate / dwScale = frames/second
      dwRate := FFPS;
      dwSuggestedBufferSize := FBitmapSize;
      rcFrame.Right := FBitmapInfo.biWidth;
      rcFrame.Bottom := FBitmapInfo.biHeight;
    end;

    if AVIFileCreateStream(pfile, Stream, asi) <> AVIERR_OK then
      raise Exception.Create('Cannot create AVI stream.');

    with AVIBitmap do
      InternalGetDIB(Handle, FBitmapInfo^, FBitmapBits^);

    galpAVIOptions := @gaAVIOptions;
    fillchar(gaAVIOptions, SizeOf(gaAVIOptions), 0);
    gaAVIOptions.fccType := streamtypeVIDEO;

    case FCompressor of
      acShowDialog:
        begin
          // call a dialog box for the user to choose the compressor options
          AVISaveOptions(0, ICMF_CHOOSE_KEYFRAME or ICMF_CHOOSE_DATARATE, 1, Stream, galpAVIOptions);
        end;
      acDivX: with gaAVIOptions do
        begin
          // ask for generic divx, using current default settings
          fccHandler := mmioFOURCCEx('d', 'i', 'v', 'x');
        end;
    else
      with gaAVIOptions do
      begin // or, you may want to fill the compression options yourself
        fccHandler := mmioFOURCCEx('M', 'S', 'V', 'C'); // User MS video 1 as default.
        // I guess it is installed on every Win95 or later.
        dwQuality := 7500; // compress quality 0-10,000
        dwFlags := 0; // setting dwFlags to 0 would lead to some default settings
      end;
    end;

    AVIResult := AVIMakeCompressedStream(Stream_c, Stream, galpAVIOptions, nil);

    if AVIResult <> AVIERR_OK then
    begin
      if AVIResult = AVIERR_NOCOMPRESSOR then
        ResultString := 'No such compressor found'
      else
        ResultString := '';
      raise Exception.Create('Cannot make compressed stream. ' + ResultString);
    end;

    if AVIStreamSetFormat(Stream_c, 0, FBitmapInfo, bitmapInfoSize) <> AVIERR_OK then
      raise Exception.Create('AVIStreamSetFormat Error'); // no error description found in MSDN.

    AVI_DPI := DPI;

  except
    CloseAVIFile(true);
    raise;
  end;

end;

procedure TDicom2AVIStatusForm.CloseAVIFile(UserAbort: boolean = False);
begin
  // if UserAbort, CloseAVIFile will also delete the unfinished file.
  AVIBitmap.Free;

  FreeMem(FBitmapInfo);
  FreeMem(FBitmapBits);

  AVIFileExit; // finalize the AVI lib.

  // release the interfaces explicitly (can't rely on automatic release)
  Stream := nil;
  Stream_c := nil;
  pfile := nil;

end;

procedure TDicom2AVIStatusForm.FormCreate(Sender: TObject);
begin
  FWidth := 320; // default values
  FHeight := 200;
  FFPS := 25;
  FCompressor := acDefault;
end;

procedure TDicom2AVIStatusForm.Button1Click(Sender: TObject);
var
  i: integer;
  bm: TBitmap;
begin
  bm := TBitmap.Create;
  try
    ImageWidth := ((StrToInt(SpinEdit1.Text) + 15) div 16) * 16; //fToConvertAttributes.ImageData.Width;
    ImageHeight := ((StrToInt(SpinEdit2.Text) + 15) div 16) * 16; // fToConvertAttributes.ImageData.Height;
    CreateAVIFile;

    for i := 0 to fToConvertAttributes.ImageData.FrameCount - 1 do
    begin
      //      if fx1.Canceled then
      //        break;
      fToConvertAttributes.ImageData.CurrentFrame := i;
      AssignToBitmap(fToConvertAttributes.ImageData,bm);
      AddAVIFrame(bm);
      ProgressBar1.Position := i+1;
      //mpg.Keep(24 * 2 - 1); // Keep the frame for 2 seconds.
    end;

    CloseAVIFile;
  finally
    bm.Free;
  end;
end;

procedure TDicom2AVIStatusForm.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TDicom2AVIStatusForm.Button2Click(Sender: TObject);
var
  FUrl: string;
begin
  if FileName <> '' then
  begin
    FUrl := Filename;
    ShellExecute(self.Handle, 'Open', PChar(Trim(FUrl)), nil, nil, SW_SHOWNORMAL);
  end;
end;

end.

 