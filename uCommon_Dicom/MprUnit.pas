unit MprUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, DCM32, Dcm_View, ExtCtrls, DCM_Attributes, StdCtrls, DCM_MPR, Menus,
  cxLookAndFeelPainters, cxButtons, ActnList, dxSkinsCore, dxSkinsdxBarPainter,
  dxSkinBlack, dxSkinOffice2007Green, dxBar, cxClasses, cxControls, cxSplitter,
  Medotrade, dxSkinOffice2007Black;

type
  TMprForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter2: TSplitter;
    MPRDicomImage1: TMPRDicomImage;
    DicomView1: TDicomView;
    DicomView2: TDicomView;
    al: TActionList;
    aPrior: TAction;
    aNext: TAction;
    aReset: TAction;
    aClose: TAction;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxbrsbtm1: TdxBarSubItem;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarButton13: TdxBarButton;
    dxBarButton14: TdxBarButton;
    dxBarButton15: TdxBarButton;
    dxBarButton16: TdxBarButton;
    dxBarButton17: TdxBarButton;
    dxBarSubItem4: TdxBarSubItem;
    dxBarButton18: TdxBarButton;
    BtnExit: TdxBarButton;
    dxBarButton19: TdxBarButton;
    dxBarSubItem5: TdxBarSubItem;
    dxBarSubItem6: TdxBarSubItem;
    dxBarSubItem7: TdxBarSubItem;
    dxBarButton21: TdxBarButton;
    dxBarButton22: TdxBarButton;
    dxBarButton20: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton24: TdxBarButton;
    dxBarButton25: TdxBarButton;
    dxBarButton26: TdxBarButton;
    dxBarButton23: TdxBarButton;
    dxBarButton27: TdxBarButton;
    dxBarButton28: TdxBarButton;
    cxSplitter1: TcxSplitter;
    dxBarButton29: TdxBarButton;
    dxBarDockControl2: TdxBarDockControl;
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MPRDicomImage1MPRLineChanged(Sender: TObject; AIndex,
      ALineX1, ALineY1, ALineX2, ALineY2: Integer);
    procedure DicomView2ImageWinLevelChange(Sender: TObject; W,
      L: Integer);
    procedure DicomView1ImageWinLevelChange(Sender: TObject; W,
      L: Integer);
    procedure MPRDicomImage1ImageWinLevelChange(Sender: TObject; W,
      L: Integer);
    procedure MPRDicomImage1MPRLineChanging(Sender: TObject; AIndex,
      ALineX1, ALineY1, ALineX2, ALineY2: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aPriorExecute(Sender: TObject);
    procedure aNextExecute(Sender: TObject);
    procedure aResetExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    fInMouseMove: Boolean;
  public
    { Public declarations }
    n1: TDicomMPRImage;
  end;

implementation

{$R *.dfm}

procedure TMprForm.FormResize(Sender: TObject);
begin
  Panel1.Width := width div 2;
  DicomView1.Height := Panel2.Height div 2;
end;

procedure TMprForm.FormShow(Sender: TObject);
begin
//  Panel1.Width := width div 2;
//  DicomView1.Height := Panel2.Height div 2;
end;

procedure TMprForm.MPRDicomImage1MPRLineChanged(Sender: TObject; AIndex,
  ALineX1, ALineY1, ALineX2, ALineY2: Integer);
var
  das1, das2: TDicomDataset;
//  i1: Integer;
begin
  das2 := n1.Datasets[0];
 // i1 := gettickcount;
  das1 := TDicomDataset.Create(n1.GetMprDataset(ALineX1, ALineY1, ALineX2, ALineY2));
 // i1 := GetTickCount - i1;
  //ShowMessage(IntToStr(i1));

  das1.Attributes.AddVariant($8, $60, das2.Attributes.GetString($8, $60));

  das1.Attributes.AddVariant($8, $103E, das2.Attributes.GetString($8, $103E) + 'MPR 2D');
  das1.Attributes.AddVariant($18, $15, das2.Attributes.GetString($18, $15));

  das1.Attributes.AddVariant($10, $10, das2.Attributes.GetString($10, $10));
  das1.Attributes.AddVariant($10, $20, das2.Attributes.GetString($10, $20));
  das1.Attributes.AddVariant($10, $30, das2.Attributes.GetString($10, $30));
  das1.Attributes.AddVariant($10, $40, das2.Attributes.GetString($10, $40));
  das1.Attributes.AddVariant($10, $1030, das2.Attributes.GetString($10, $1030));

  das1.Attributes.AddVariant($20, $D, das2.Attributes.GetString($20, $D));
  das1.Attributes.AddVariant($20, $E, das2.Attributes.GetString($20, $E) + '.1');
  //  das1.Attributes.AddVariant($20, $13, form1.GetActiveViewer.DicomDatasets.Count + 1);
  das1.Attributes.AddVariant(8, $18, '1.2.840' + das2.Attributes.GetString($20, $E) + '.' +
    FormatDatetime('yyyymmdd.hhnnss.zzz', now)); //sc

  if AIndex = 0 then
  begin
    if DicomView1.DicomDatasets = nil then
      DicomView1.DicomDatasets := TDicomDatasets.Create(self);
    DicomView1.DicomDatasets.Clear;
    DicomView1.DicomDatasets.Add(das1);
    DicomView1.AttributesIndex := 0;
  end
  else
  begin
    if DicomView2.DicomDatasets = nil then
      DicomView2.DicomDatasets := TDicomDatasets.Create(self);
    DicomView2.DicomDatasets.Clear;
    DicomView2.DicomDatasets.Add(das1);
    DicomView2.AttributesIndex := 0;
  end;
end;

procedure TMprForm.DicomView2ImageWinLevelChange(Sender: TObject; W,
  L: Integer);
var
  i: integer;
begin
  DicomView1.SetWinLevel(W, L);
  MPRDicomImage1.SetWinLevel(W, L);
  for i := 0 to n1.sliceNumber - 1 do
  begin
    n1.ImageData[i].WindowWidth := W;
    n1.ImageData[i].WindowCenter := L;
  end;
end;

procedure TMprForm.DicomView1ImageWinLevelChange(Sender: TObject; W,
  L: Integer);
var
  i: integer;
begin
  DicomView2.SetWinLevel(W, L);
  MPRDicomImage1.SetWinLevel(W, L);
  for i := 0 to n1.sliceNumber - 1 do
  begin
    n1.ImageData[i].WindowWidth := W;
    n1.ImageData[i].WindowCenter := L;
  end;
end;

procedure TMprForm.MPRDicomImage1ImageWinLevelChange(Sender: TObject; W,
  L: Integer);
var
  i: integer;
begin
  DicomView1.SetWinLevel(W, L);
  DicomView2.SetWinLevel(W, L);
  for i := 0 to n1.sliceNumber - 1 do
  begin
    n1.ImageData[i].WindowWidth := W;
    n1.ImageData[i].WindowCenter := L;
  end;
end;

procedure TMprForm.MPRDicomImage1MPRLineChanging(Sender: TObject; AIndex,
  ALineX1, ALineY1, ALineX2, ALineY2: Integer);
//var i1: Integer;
begin
 // i1 := gettickcount;
  fInMouseMove := true;
  try
    if AIndex = 0 then
    begin
      n1.AssignALineToBitmap(ALineX1, ALineY1, ALineX2, ALineY2, DicomView1.Bitmap);
      DicomView1.Invalidate;
      while DicomView1.InUndating do
        Application.ProcessMessages
    end
    else
    begin
      //if DicomView2.InUndating then
      //  exit;
      n1.AssignALineToBitmap(ALineX1, ALineY1, ALineX2, ALineY2, DicomView2.Bitmap);
      DicomView2.Invalidate;
      while DicomView2.InUndating do
        Application.ProcessMessages
    end;
  finally
    fInMouseMove := false;
  end;
 // i1 := GetTickCount - i1;
  //  ShowMessage(IntToStr(i1));
end;

procedure TMprForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  action := caFree;
end;

procedure TMprForm.FormCreate(Sender: TObject);
begin
  fInMouseMove := false;
  n1 := nil;
  self.WindowState := wsMaximized;
end;

procedure TMprForm.FormDestroy(Sender: TObject);
begin
  if assigned(n1) then
    n1.Free;
end;

procedure TMprForm.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TMprForm.aNextExecute(Sender: TObject);
begin
  MPRDicomImage1.Next;
end;

procedure TMprForm.aPriorExecute(Sender: TObject);
begin
  MPRDicomImage1.Prior;
end;

procedure TMprForm.aResetExecute(Sender: TObject);
var k: integer;
begin
  for k := 0 to n1.sliceNumber - 1 do
    begin
      n1.ImageData[k].Reset;
    end;
  MPRDicomImage1.UpdateX;
end;

end.

