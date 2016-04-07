{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit KxDeviceCaps;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,cnsmsg;

type
  TDeviceCapsForm = class(TForm)
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    ReadCDR: TCheckBox;
    ReadCDRW: TCheckBox;
    WriteCDR: TCheckBox;
    WriteCDRW: TCheckBox;
    WriteDVDPR: TCheckBox;
    UnderrunProtection: TCheckBox;
    ReadDVD: TCheckBox;
    ReadDVDRAM: TCheckBox;
    ReadDVDRW: TCheckBox;
    WriteDVDR: TCheckBox;
    WriteDVDRAM: TCheckBox;
    Button1: TButton;
    ReadDVDPR: TCheckBox;
    WriteDVDPRW: TCheckBox;
    WriteDVDRW: TCheckBox;
    ReadDVDPRW: TCheckBox;
    ReadDVDR: TCheckBox;
    WriteTest: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TDeviceCapsForm.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TDeviceCapsForm.FormCreate(Sender: TObject);
begin
  Caption := cns_DeviceCapsForm_Caption;
end;

end.
