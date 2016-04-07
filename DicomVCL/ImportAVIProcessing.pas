{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit ImportAVIProcessing;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TImportAVIProcessBarForm = class(TForm)
    ProgressBar1: TProgressBar;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fAbort:Boolean;
  end;


implementation

{$R *.dfm}

procedure TImportAVIProcessBarForm.FormCreate(Sender: TObject);
begin
  fAbort := false;
end;

procedure TImportAVIProcessBarForm.Button1Click(Sender: TObject);
begin
  fAbort := true;
end;

end.
