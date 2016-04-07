{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DefineCal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs,Dcm_Attributes, StdCtrls, Buttons, ExtCtrls;

type
  TCalibrateForm = class(TForm)
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DefineRulerUnit: TLabel;
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CalObject: TDicomDrawObject;
  end;


implementation

{$R *.dfm}

procedure TCalibrateForm.RadioGroup1Click(Sender: TObject);
begin
  Edit1.Enabled := RadioGroup1.ItemIndex = 5;
end;

end.
