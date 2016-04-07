{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit Save2MpegStatus;

interface

uses
  Windows, Messages, SysUtils,  Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TConvert2MpegStatusForm = class(TForm)
    ProgressBar1: TProgressBar;
    CancelButton: TBitBtn;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Canceled: boolean;
  end;


implementation

{$R *.dfm}

procedure TConvert2MpegStatusForm.CancelButtonClick(Sender: TObject);
begin
  Canceled := true;
end;

procedure TConvert2MpegStatusForm.FormCreate(Sender: TObject);
begin
  Canceled := false;
end;

end.
