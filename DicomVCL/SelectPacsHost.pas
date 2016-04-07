{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit SelectPacsHost;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TSelectPacsHostForm = class(TForm)
    RadioGroup1: TRadioGroup;
    Memo1: TMemo;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    newHost: string;
    newPort: Integer;
  end;

implementation

uses SelectNewHost;

{$R *.dfm}

procedure TSelectPacsHostForm.Button1Click(Sender: TObject);
begin
  with TNewHostForm.Create(self) do
  try
    if ShowModal = mrok then
    begin
      if Edit1.Text <> '' then
      begin
        RadioGroup1.Items.Add(Edit1.Text + ':' + Edit2.Text);
        newHost := Edit1.Text;
        newPort := StrToInt(Edit2.Text);
        self.ModalResult := mrRetry;
      end;
    end;
  finally
    Free;
  end;
end;

procedure TSelectPacsHostForm.FormCreate(Sender: TObject);
begin
  newHost := '';
end;

end.

