{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DicomInputQuery;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, inifiles,DCM_Attributes, ExtCtrls, Menus,
  cxLookAndFeelPainters, ActnList, cxButtons;

type
  TDicomInputQueryForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Panel2: TPanel;
    cxButton1: TcxButton;
    al: TActionList;
    aCancel: TAction;
    aOk: TAction;
    cxButton2: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCancelExecute(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function InputBox1(const ACaption, APrompt, ADefault: string): string;

implementation

{$R *.dfm}

function InputBox1(const ACaption, APrompt, ADefault: string): string;
begin
  with TDicomInputQueryForm.Create(nil) do
  try
    Caption := ACaption;
    Label1.Caption := APrompt;
    ComboBox1.Text := ADefault;
    if ShowModal = mrok then
    begin
      Result := ComboBox1.Text;
    end
    else
      Result := ADefault;
  finally
    Free;
  end;
end;

procedure TDicomInputQueryForm.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TDicomInputQueryForm.aOkExecute(Sender: TObject);
begin
  Modalresult := mrOk;
end;

procedure TDicomInputQueryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i: Integer;
begin
  if ComboBox1.Items.IndexOf(ComboBox1.Text) < 0 then
    ComboBox1.Items.Add(ComboBox1.Text);
  {$IFDEF USEREGISTERPARAM}
  with TRegIniFile.Create('PacsViewer') do
  try
    Rootkey := HKEY_LOCAL_MACHINE;
    OpenKey('SOFTWARE\Microsoft\Windows\DicomViewer', true);
    {$ELSE}
  with TIniFile.Create(DicomTempPath + 'KxPacs.ini') do
  try
    {$ENDIF}

    for i := 0 to 20 do
    begin
      if ComboBox1.Items.count > (i ) then
        WriteString('MarkText', 'Item' + IntToStr(i), ComboBox1.Items[i])
      else
        break;
    end;
  finally
    Free;
  end;
end;

procedure TDicomInputQueryForm.FormCreate(Sender: TObject);
var
  i: Integer;
  str1: string;
begin
  {$IFDEF USEREGISTERPARAM}
  with TRegIniFile.Create('PacsViewer') do
  try
    Rootkey := HKEY_LOCAL_MACHINE;
    OpenKey('SOFTWARE\Microsoft\Windows\DicomViewer', true);
    {$ELSE}
  with TIniFile.Create(DicomTempPath + 'KxPacs.ini') do
  try
    {$ENDIF}

    for i := 0 to 20 do
    begin
      str1 := ReadString('MarkText', 'Item' + IntToStr(i),'');
      if str1 <> '' then
        ComboBox1.Items.Add(str1)
      else
        break;
    end;
  finally
    Free;
  end;
end;

end.

