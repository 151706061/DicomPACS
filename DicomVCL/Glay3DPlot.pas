unit Glay3DPlot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, DCM_Attributes, KxGraph3D,cnsmsg;

type
  TPlot3DForm = class(TForm)
    Graph3D1: TGraph3D;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fROIAttributes: TDicomAttributes;
    fROIRect: TRect;
    procedure UpdateShape;
  end;


implementation

{$R *.dfm}

procedure TPlot3DForm.UpdateShape;
var
  i, j: LongInt;
  a: TGraphLine;
  f, g: Single;
  ptX, ptY: Single;
  NoOfPointsInLine:Integer;
begin
  NoOfPointsInLine := fROIRect.Right-fROIRect.Left;
  for j := 0 to fROIRect.Bottom-fROIRect.Top - 1 do
  begin
    a := TGraphLine.Create(NoOfPointsInLine);
    a.StartPoint := Point3D(0, j, 0);
    a.StopPoint := Point3D(NoOfPointsInLine, j, 0);
    for i := 0 to NoOfPointsInLine - 1 do
    begin
      a[i] := fROIAttributes.ImageData.getPixelValue(nil,fROIRect.Left+i,fROIRect.Top+j); //Zmax - Sqr(i-(NoOfPointsInLine div 2)) - Sqr(j-(NoOfLines div 2));//basic square-func.
    end;
    Graph3D1.AddLine(a);
  end;
end;

procedure TPlot3DForm.FormShow(Sender: TObject);
begin
  Caption := Format(cns_Plot3DForm_Caption + '(%d,%d)--(%d,%d)', [fROIRect.Left, fROIRect.Right, fROIRect.Top, fROIRect.Bottom]);

  UpdateShape;
end;

end.

 