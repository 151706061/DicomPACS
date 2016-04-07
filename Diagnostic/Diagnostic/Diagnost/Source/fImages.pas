unit fImages;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, OracleData, ImgList, dxBar, ActnList, Jpeg, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinsdxBarPainter, cxClasses, dxSkinOffice2007Green, Medotrade;

type
  TfrmImages = class(TForm)
    Image1: TImage;
    il16: TImageList;
    BMImage: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    bbPrior: TdxBarButton;
    bbNext: TdxBarButton;
    bbClose: TdxBarButton;
    alImage: TActionList;
    aClose: TAction;
    aPrior: TAction;
    aNext: TAction;
    bbCount: TdxBarEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aPriorExecute(Sender: TObject);
    procedure aNextExecute(Sender: TObject);
  private
    DataSetImg : TOracleDataSet;
    Cnt : Integer;
    procedure ClearHTMLImages;
    procedure BmpToJPEG(pFNAME1,pFNAME2:String);
    function PhysicalResolveFileType(AStream: TStream): Integer;
    { Private declarations }
  public
    procedure DoShowfrmImages(DataSet: TOracleDataSet; Count: Integer=1);
    { Public declarations }
  end;

var
  frmImages: TfrmImages;
//const
//  HTMLImagesPath = 'C:\ASUn\RGIMAGES\';
implementation
{$R *.dfm}

procedure TfrmImages.DoShowfrmImages(DataSet: TOracleDataSet; Count: Integer=1);
begin
  DataSetImg := DataSet;
  Cnt := Count;
  if Count = 1 then
    begin
      aPrior.Enabled := FALSE;
      aNext.Enabled := FALSE;
    end;
  if not DirectoryExists(ExtractFilePath(paramstr(0))+'RGIMAGES') then
    CreateDir(ExtractFilePath(paramstr(0))+'RGIMAGES');
  DataSetImg.First;
  aPrior.Enabled := FALSE;
  try
    BmpToJPEG(DataSetImg.FieldByName('SFILENAME').AsString, DataSetImg.FieldByName('SFILENAME').AsString);
    Image1.Picture.LoadFromFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+DataSetImg.FieldByName('SFILENAME').AsString);
  except
    showmessage('Неправильный формат файла');
  end;
  bbCount.Text := IntToStr(DataSetImg.FieldbyName('ROWNUM').AsInteger)+'/'+IntToStr(Cnt);
  Self.ShowModal;
end;

procedure TfrmImages.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  ClearHTMLImages;
end;

procedure TfrmImages.ClearHTMLImages;
var SR:  TSearchRec;
begin
  FindFirst(ExtractFilePath(paramstr(0))+'RGIMAGES'+'*.JPG', faAnyFile, SR);
  repeat
    DeleteFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+SR.Name);
  until FindNext(SR) <> 0;
end;

procedure TfrmImages.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmImages.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmImages.aPriorExecute(Sender: TObject);
begin
  DataSetImg.Prior;
  try
    BmpToJPEG(DataSetImg.FieldByName('SFILENAME').AsString, DataSetImg.FieldByName('SFILENAME').AsString);
    Image1.Picture.LoadFromFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+DataSetImg.FieldByName('SFILENAME').AsString);
  except
    showmessage('Неправильный формат файла');
  end;
  bbCount.Text := IntToStr(DataSetImg.FieldbyName('ROWNUM').AsInteger)+'/'+IntToStr(Cnt);
  if DataSetImg.FieldbyName('ROWNUM').AsInteger = 1 then
    aPrior.Enabled := FALSE
  else
    aPrior.Enabled := TRUE;
  aNext.Enabled := TRUE;
end;

procedure TfrmImages.aNextExecute(Sender: TObject);
begin
  DataSetImg.Next;
  try
    BmpToJPEG(DataSetImg.FieldByName('SFILENAME').AsString, DataSetImg.FieldByName('SFILENAME').AsString);
    Image1.Picture.LoadFromFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+DataSetImg.FieldByName('SFILENAME').AsString);
  except
    showmessage('Неправильный формат файла');
  end;
  bbCount.Text := IntToStr(DataSetImg.FieldbyName('ROWNUM').AsInteger)+'/'+IntToStr(Cnt);
  if DataSetImg.FieldbyName('ROWNUM').AsInteger = Cnt then
    aNext.Enabled := FALSE
  else
    aNext.Enabled := TRUE;
  aPrior.Enabled := TRUE;
end;

procedure TfrmImages.BmpToJPEG(pFNAME1, pFNAME2: String);
var
  JPEG: TJPEGImage;
  Bitmap: TBitmap;
  Image1: TImage;
  lStream: TFileStream;
begin
  lStream:=TFileStream.Create(ExtractFilePath(paramstr(0))+'RGIMAGES'+pFNAME2,fmOpenRead);
  try
    if PhysicalResolveFileType(lStream)=1 then
      begin
        lStream.Free;
        JPEG := TJPEGImage.Create;
        Bitmap := TBitmap.Create;
        Image1:=timage.create(nil);
        try
          Bitmap.LoadFromFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+pFNAME2);
          JPEG.Assign(Bitmap);
          Image1.Picture.Assign(JPEG);
          Image1.Picture.SaveToFile(ExtractFilePath(paramstr(0))+'RGIMAGES'+pFNAME1);
        finally
          Image1.free;
          JPEG.Free;
          Bitmap.Free;
        end;
      end
      else
          lStream.Free;
  except
    lStream.Free;
  end;
end;


function TfrmImages.PhysicalResolveFileType(AStream: TStream): Integer;
var
  p: PChar;
begin
  Result := 0;
  if not Assigned(AStream) then
    Exit;
  GetMem(p, 10);
  try
    AStream.Position := 0;
    AStream.Read(p[0], 10);
    {bitmap format}
    if (p[0] = #66) and (p[1] = #77) then
      Result := 1;
    {tiff format}
    if ((p[0] = #73) and (p[1] = #73) and (p[2] = #42) and (p[3] = #0)) or
      ((p[0] = #77) and (p[1] = #77) and (p[2] = #42) and (p[3] = #0)) then
      Result := 2;
    {jpg format}
    if (p[6] = #74) and (p[7] = #70) and (p[8] = #73) and (p[9] = #70) then
      Result := 3;
    {png format}
    if (p[0] = #137) and (p[1] = #80) and (p[2] = #78) and (p[3] = #71) and
      (p[4] = #13) and (p[5] = #10) and (p[6] = #26) and (p[7] = #10) then
      Result := 4;
    {dcx format}
    if (p[0] = #177) and (p[1] = #104) and (p[2] = #222) and (p[3] = #58) then
      Result := 5;
    {pcx format}
    if p[0] = #10 then
      Result := 6;
    {emf format}
    if (p[0] = #215) and (p[1] = #205) and (p[2] = #198) and (p[3] = #154) then
      Result := 7;
    {emf format}
    if (p[0] = #1) and (p[1] = #0) and (p[2] = #0) and (p[3] = #0) then
      Result := 7;
  finally
    Freemem(p);
  end;
end;


end.
