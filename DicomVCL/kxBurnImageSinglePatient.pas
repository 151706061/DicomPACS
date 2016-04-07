{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit kxBurnImageSinglePatient;

{$I DicomPack.inc}
interface

uses
  Windows, Messages, SysUtils, {$IFDEF LEVEL6}Variants, {$ENDIF}Classes, Graphics, Controls, Forms,
  Dialogs, kxBurnImageBase, KxDrvLib, ExtCtrls, StdCtrls, Buttons,
  ComCtrls, ToolWin, DCM_Attributes, cnsmsg, DCM_UID, DCM32, Dcm_View,
  CheckLst, ImgList, DicomBurner, DCM_ImageData_Bitmap;

type
  TBurnSinglepatientDataCDForm = class(TBurnCDForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DicomView1: TDicomView;
    Splitter1: TSplitter;
    TreeView1: TTreeView;
    ImageList1: TImageList;
    CheckBox3: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
  private
    { Private declarations }
    procedure SaveAsHtml;
    procedure SaveToMpeg(AIndex: integer; Afilename: string);

  public
    { Public declarations }
    //ADatasets: TDicomDatasets;
    DatasetList: TList;
    procedure AddFilesToCd; override;
    procedure RefreshStudyList;
  end;

implementation
uses DCM_MpegWrite{$IFNDEF LEVEL6}, FileCtrl{$ENDIF};
{$R *.dfm}

procedure TBurnSinglepatientDataCDForm.RefreshStudyList;
var
  j, k: integer;
  ds: TDicomDatasets;
//  da1: TDicomAttributes;
  n1: TTreeNode;
  function GetImageDesc(da: TDicomDataset): string;
  begin
    Result := da.Attributes.GetString($20, $13);
    if Result = '' then
      Result := da.Attributes.GetString($20, $12);
    if Result = '' then
      Result := da.Attributes.GetString($8, $18);
  end;
  function GetSerieDesc(da: TDicomDataset): string;
  begin
    Result := da.Attributes.GetString($20, $11) + ' ' + da.Attributes.GetString($8, $103E);
  end;
  function GetPatientDesc(da: TDicomDataset): string;
  begin
    Result := da.Attributes.GetString($10, $10) + ',' + da.Attributes.GetString($10, $20)
      + ',' + da.Attributes.GetString($8, $20) + ',' + da.Attributes.GetString($8, $1030);
  end;
  function FindSeriesNode(astr: string): TTreeNode;
  var
    kk: Integer;
    n3: TTreeNode;
  begin
    Result := nil;
    for kk := 0 to TreeView1.Items.Count - 1 do
    begin
      n3 := TreeView1.Items.Item[kk];
      if (n3.Level = 1) and (n3.Text = astr) then
      begin
        Result := n3;
        break;
      end;
    end;
  end;
  procedure AddImage(n1: TTreeNode; da: TDicomDataset);
  var
    str1, str2: string;
    n2, n3: TTreeNode;
  begin
    str1 := GetSerieDesc(da);
    str2 := GetImageDesc(da);
    n2 := FindSeriesNode(str1);
    if not assigned(n2) then
    begin
      n2 := TreeView1.Items.AddChild(n1, str1);
      n2.Data := ds;
      n2.ImageIndex := k;
      n2.StateIndex := 2;
    end;
    n3 := TreeView1.Items.AddChild(n2, str2);
    n3.Data := ds;
    n3.ImageIndex := k;
    n3.StateIndex := 2;
  end;
begin
  TreeView1.Items.Clear;
  for j := 0 to DatasetList.Count - 1 do
  begin
    ds := TDicomDatasets(DatasetList[j]);
    n1 := TreeView1.Items.Add(nil, GetPatientDesc(ds[0]));
    n1.Data := ds;
    n1.ImageIndex := 0;
    n1.StateIndex := 2;
    for k := 0 to ds.Count - 1 do
    begin
      AddImage(n1, ds[k]);
    end;
  end;
end;

procedure TBurnSinglepatientDataCDForm.AddFilesToCD;
var
  fpath: string;
  strs: TStringList;
  J{, i}: Integer;
  dd1: TDicomDataset;
  dicomdir: TDicomDataset;
  filename1, BaseDir: string;
  da1: TDicomAttribute;
  sr3: TSearchRec;
  ds: TDicomDatasets;
  n1: TTreeNode;
begin
  DicomCDBurner.IdVolume := Edit1.Text;

  fPath := DicomTempPath;
  BaseDir := fPath + 'TEMP\';
  if not DirectoryExists(BaseDir) then
    CreateDir(BaseDir);
  if FindFirst(BaseDir + '*.dcm', faAnyFile, sr3) = 0 then
  begin
    repeat
      if (sr3.Attr and faAnyFile) = sr3.Attr then
      begin
        filename1 := BaseDir + sr3.Name;
        DeleteFile(filename1);
      end;
    until FindNext(sr3) <> 0;
    FindClose(sr3);
  end;

  strs := TStringList.Create;
  try
    strs.Add('[autorun]');
    strs.Add('open = dicomviewer.exe');
    strs.SaveToFile(BaseDir + 'AUTORUN.INF');
    DicomCDBurner.InsertFile('\', BaseDir + 'AUTORUN.INF', false);
  finally
    strs.Free;
  end;

  inherited;

  dicomdir := TDicomDataset.Create;
  try
    //    dicomdir.FAttributes.Add()
    da1 := dicomdir.Attributes.Add(4, $1220);
    for j := 0 to TreeView1.Items.Count - 1 do
    begin
      n1 := TreeView1.Items.Item[j];
      if (n1.Level = 2) and (n1.StateIndex = 2) then
      begin
        ds := TDicomDatasets(n1.Data);
        dd1 := ds.Item[n1.ImageIndex];
        filename1 := BaseDir + 'FILE' + IntToStr(j) + '.DCM';

        //        dd1.ResetDataToStream;

        if dd1.Attributes.ImageData.FrameCount > 1 then
          dd1.SaveToFile(filename1, true, dd1.Attributes.ImageData.ImageData[0].TransferSyntax, 100)
        else
          dd1.SaveToFile(filename1, true, 8193, 100);

        {        if dd1.Attributes.ImageData.Bits > 12 then
                  dd1.SaveToFile(filename1, true, 8193, 100)
                else
                  dd1.SaveToFile(filename1, true, JPEGBaseline, 100);}
        DicomCDBurner.InsertFile('\', filename1, false);
        AddPatientToDICOMDIR(da1, dd1.Attributes, 'FILE' + IntToStr(J) + '.DCM', '');
      end;
    end;
  finally
    dicomdir.SaveToFile(BaseDir + 'DICOMDIR', true, 8193, 100);
    DicomCDBurner.InsertFile('\', BaseDir + 'DICOMDIR', false);
    dicomdir.Free;
  end;
  DicomCDBurner.InsertFile('\', fPath + 'dicomviewer.exe', false);

  if CheckBox1.Checked then
    SaveAsHtml;

  if CheckBox2.Checked then
  begin
    for j := 0 to DatasetList.Count - 1 do
    begin
      //      if CheckListBox1.Checked[j] then
      begin
        SaveToMpeg(j, BaseDir + 'video' + IntToStr(j) + '.mpg');
        DicomCDBurner.InsertFile('\', BaseDir + 'video' + IntToStr(j) + '.mpg', false);
      end;
    end;
  end;
end;

procedure TBurnSinglepatientDataCDForm.SaveAsHtml;
  procedure SaveToMpeg(da1: TDicomAttributes; Afilename: string);
  var
    i, k: integer;
    fs: TFileStream;
    mpg: TMpeg;
    bm, bm1: TBitmap;
  begin
    k := 32;
    mpg := TMpeg.Create;
    bm := TBitmap.Create;
    bm1 := TBitmap.Create;
    if (da1.ImageData.Width mod k) <> 0 then
      bm1.Width := (da1.ImageData.Width div k + 1) * k
    else
      bm1.Width := da1.ImageData.Width;
    if (da1.ImageData.Height mod k) <> 0 then
      bm1.Height := (da1.ImageData.Height div k + 1) * k
    else
      bm1.Height := da1.ImageData.Height;
    bm1.PixelFormat := pf24bit;
    // Initalization - Create a MPEG stream 400x96 pixels, base frequency
    // is 24 hz but it will be divided by 48 to provide 0.5 hz (one image
    // every 2 seconds). [The demo version has Height fixed to 96];

    fs := TFileStream.Create(Afilename, fmcreate);
    try
      //      mpg.Open(da1.ImageData.Width, da1.ImageData.Height, QUANTCODE[0], 100, bf24hz, fs);
      mpg.Open(bm1.Width, bm1.Height, QUANTCODE[0], 1000 div 25, bf25hz, fs);
      for i := 0 to da1.ImageData.FrameCount - 1 do
      begin
        da1.ImageData.CurrentFrame := i;
        AssignToBitmap(da1.ImageData, bm);
        bm1.Canvas.Draw((bm1.Width - bm.Width) div 2, (bm1.height - bm.height) div 2, bm);
        mpg.AddIImage(bm1);
        //mpg.Keep(24 * 2 - 1); // Keep the frame for 2 seconds.
      end;
    finally
      mpg.Close; // Closes the stream and flush the buffers
      fs.Free;
      mpg.Free;
      bm.Free;
      bm1.Free;
    end;
    //    ShowMessage('成功');
  end;
var
  strs: TStrings;
  i, j: Integer;
  dd1: TDicomDataset;
  //  dicomdir: TDicomDataset;
  filename1, str1: string;
  //  da1: TDicomAttribute;
  bm: TBitmap;
  ds: TDicomDatasets;
  n1: TTreeNode;
begin
  str1 := DicomTempPath + 'TEMP\';
  strs := TStringList.Create;
  try
    strs.Add('<html>');
    strs.Add('<head>');
    strs.Add('<title>PACS</title>');
    strs.Add('</head>');
    strs.Add('<body>');

    for j := 0 to TreeView1.Items.Count - 1 do
    begin
      n1 := TreeView1.Items.Item[j];
      if (n1.Level = 2) and (n1.StateIndex = 2) then
      begin
        ds := TDicomDatasets(n1.Data);
        dd1 := ds.Item[n1.ImageIndex];

        filename1 := str1 + 'FILE' + IntToStr(j);
        if dd1.Attributes.ImageData.FrameCount > 1 then
        begin
          SaveToMpeg(dd1.Attributes, str1 + IntToStr(j) + '.mpg');
          {        DicomCDBurner.InsertFile('\', str1 + IntToStr(i) + '.mpg', false);

                  strs.Add('<h1><img src="' + IntToStr(i) + '.mpg" width="' +
                    IntToStr(dd1.Attributes.ImageData.Width) + '" height="' +
                    IntToStr(dd1.Attributes.ImageData.Height) +
                    '" border="0" alt=""></h1>');}
        end;
        bm := TBitmap.Create;
        AssignToBitmap(dd1.Attributes.ImageData, bm, False);
        bm.SaveToFile(str1 + IntToStr(i) + '.bmp');
        DicomCDBurner.InsertFile('\', str1 + IntToStr(i) + '.bmp', false);

        strs.Add('<h1><img src="' + IntToStr(i) + '.bmp" width="' +
          IntToStr(dd1.Attributes.ImageData.Width) + '" height="' +
          IntToStr(dd1.Attributes.ImageData.Height) +
          '" border="0" alt=""></h1>');
        bm.Free;
      end;
    end;
    strs.Add('</body>');
    strs.Add('</html>');
    strs.SaveToFile(str1 + 'index.htm');
    DicomCDBurner.InsertFile('\', str1 + 'index.htm', false);
    //      ShowMessage('病人检查内容已保存为HTML文件，您可以在任一windows系统下打开观看');
  finally
    strs.Free;
  end;
end;

procedure TBurnSinglepatientDataCDForm.SaveToMpeg(AIndex: integer; Afilename: string);
const
  QUANTCODE: array[0..7] of integer = (1, 2, 3, 4, 6, 8, 12, 16);
var
  i, k, i1: integer;
  fs: TFileStream;
  mpg: TMpeg;
  da1: TDicomAttributes;
  bm, bm1: TBitmap;
  ds: TDicomDatasets;
begin
  k := 32;
  mpg := TMpeg.Create;
  bm := TBitmap.Create;
  bm1 := TBitmap.Create;

  ds := TDicomDatasets(DatasetList[AIndex]);

  fs := TFileStream.Create(Afilename, fmcreate);
  try
    da1 := ds.Item[0].Attributes;
    if (da1.ImageData.Width mod k) <> 0 then
      bm1.Width := (da1.ImageData.Width div k + 1) * k
    else
      bm1.Width := da1.ImageData.Width;
    if (da1.ImageData.Height mod k) <> 0 then
      bm1.Height := (da1.ImageData.Height div k + 1) * k
    else
      bm1.Height := da1.ImageData.Height;

    bm1.PixelFormat := pf24bit;

    mpg.Open(bm1.Width, bm1.Height, QUANTCODE[0], 40, bf25hz, fs);

    for i1 := 0 to ds.Count - 1 do
    begin
      da1 := ds.Item[i1].Attributes;
      if da1.ImageData.FrameCount > 0 then
      begin
        for i := 0 to da1.ImageData.FrameCount - 1 do
        begin
          da1.ImageData.CurrentFrame := i;
          AssignToBitmap(da1.ImageData, bm);
          bm1.Canvas.Draw((bm1.Width - bm.Width) div 2, (bm1.height - bm.height) div 2, bm);
          mpg.AddIImage(bm1);
        end;
        mpg.Keep(24 * 2 - 1); // Keep the frame for 2 seconds.
      end
      else
      begin
        AssignToBitmap(da1.ImageData, bm);
        bm1.Canvas.Draw((bm1.Width - bm.Width) div 2, (bm1.height - bm.height) div 2, bm);
        mpg.AddIImage(bm1);
        mpg.Keep(24 * 2 - 1); // Keep the frame for 2 seconds.
      end;
    end;
  finally
    mpg.Close; // Closes the stream and flush the buffers
    fs.Free;
    mpg.Free;
    bm.Free;
    bm1.Free;
  end;
end;

procedure TBurnSinglepatientDataCDForm.FormCreate(Sender: TObject);
begin
  inherited;
  Caption := cns_BurnCDFormCaption;

  CheckBox1.Caption := 'Save As HTML';

  CheckBox2.Caption := 'Save as MPEG1';

  DatasetList := TList.Create;
end;

procedure TBurnSinglepatientDataCDForm.FormDestroy(Sender: TObject);
begin
  inherited;
  DatasetList.Free;
end;

procedure TBurnSinglepatientDataCDForm.TreeView1Click(Sender: TObject);
//var
//  i: Integer;
begin
  inherited;
  if assigned(TreeView1.Selected) then // and (TreeView1.Selected.Level = 2) then
  begin
    DicomView1.DicomDatasets := TDicomDatasets(TreeView1.Selected.Data);
    DicomView1.AttributesIndex := TreeView1.Selected.ImageIndex;
    CheckBox3.Checked := TreeView1.Selected.StateIndex = 2;
  end;
end;

procedure TBurnSinglepatientDataCDForm.TreeView1DblClick(Sender: TObject);
var
  k, k1: Integer;
begin
  inherited;
  if assigned(TreeView1.Selected) then
  begin
    if TreeView1.Selected.StateIndex = 1 then
      k1 := 2
    else
      k1 := 1;
    TreeView1.Selected.StateIndex := k1;
    CheckBox3.Checked := k1 = 2;
    if TreeView1.Selected.HasChildren then
    begin
      for k := 0 to TreeView1.Selected.Count - 1 do
      begin
        TreeView1.Selected.Item[k].StateIndex := k1;
      end;
    end;
  end;
end;

procedure TBurnSinglepatientDataCDForm.CheckBox3Click(Sender: TObject);
var
  k1, k: Integer;
begin
  inherited;
  if assigned(TreeView1.Selected) then
  begin
    if CheckBox3.Checked then
      k1 := 2
    else
      k1 := 1;
    TreeView1.Selected.StateIndex := k1;
    if TreeView1.Selected.HasChildren then
    begin
      for k := 0 to TreeView1.Selected.Count - 1 do
      begin
        TreeView1.Selected.Item[k].StateIndex := k1;
      end;
    end;
  end;
end;

end.

