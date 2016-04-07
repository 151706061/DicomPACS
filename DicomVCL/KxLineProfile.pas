{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit KxLineProfile;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, DCM_Attributes, StdCtrls, cnsmsg, 
  ComCtrls, ExtCtrls, sgr_def, sgr_mark, sgr_data;

type
  TLineProfileForm = class(TForm)
    sp_XYPlot1: Tsp_XYPlot;
    sp_XYLine1: Tsp_XYLine;
    sp_XYLine2: Tsp_XYLine;
    sp_XYLine3: Tsp_XYLine;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fROIAttributes: TDicomAttributes;
    fROIRect: TRect;
    procedure RefreshCurve;
  end;

implementation

{$R *.dfm}

procedure TLineProfileForm.FormCreate(Sender: TObject);
begin
  Caption := cns_LineProfileForm_Caption;
  fROIAttributes := nil;
end;

procedure TLineProfileForm.RefreshCurve;
var
  p1: TDCMIntegerArray;
  n, i, z: integer;
begin
  if assigned(fROIAttributes) and not ((fROIRect.Left = fROIRect.Right) and (fROIRect.Top = fROIRect.Bottom)) then
  begin
    n := fROIAttributes.ImageData.getLine(fROIRect.Left, fROIRect.Top, fROIRect.Right, fROIRect.Bottom, p1);
    Caption := Format('(%d,%d)--(%d,%d)', [fROIRect.Left, fROIRect.Top, fROIRect.Right, fROIRect.Bottom]);
    if n > 0 then
    begin
      for i := 0 to n - 1 do
      begin
        z := p1[i];
        sp_XYLine1.AddXY(i, z);
      end;
      setLength(p1, 0);
    end;
  end;
end;

procedure TLineProfileForm.FormShow(Sender: TObject);
begin
  RefreshCurve;
end;

end.

