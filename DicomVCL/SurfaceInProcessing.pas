{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit SurfaceInProcessing;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TRenderingProcessBarForm = class(TForm)
    ProgressBar1: TProgressBar;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fAbort:Boolean;
  end;

implementation

{$R *.dfm}

procedure TRenderingProcessBarForm.Button1Click(Sender: TObject);
begin
  fAbort := true;
end;

procedure TRenderingProcessBarForm.FormCreate(Sender: TObject);
begin
  fAbort := false;
end;

end.
