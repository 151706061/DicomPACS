unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActiveX, WbemScripting_TLB, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    procedure fWriteln ( pStr : string );
    procedure ShowTemperatureInfo();
    procedure  ShowCPUFanInfo();
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.fWriteln ( pStr : string );
begin
  Memo1.Lines.Append(pStr);
end;

procedure TForm1.ShowTemperatureInfo();
var
  WMIServices: ISWbemServices;
  Root       : ISWbemObjectSet;
  Item       : Variant;
  I          : Integer;
begin
 {
 http://msdn.microsoft.com/en-us/library/aa394493%28VS.85%29.aspx
 The Win32_TemperatureProbe  WMI class represents the properties of a temperature sensor (electronic thermometer).
 Most of the information that the Win32_TemperatureProbe WMI class provides comes from SMBIOS.
 Real-time readings for the CurrentReading property cannot be extracted from SMBIOS tables.
 For this reason, current implementations of WMI do not populate the CurrentReading property.
 The CurrentReading property's presence is reserved for future use.
 }

  FWriteln('Temperature Info');
  FWriteln('----------------');

  WMIServices := CoSWbemLocator.Create.ConnectServer('.', 'root\CIMV2','', '', '', '', 0, nil);   // root\cimv2 
  Root  := WMIServices.ExecQuery('Select * FROM Win32_TemperatureProbe','WQL', 0, nil);
  for I := 0 to Root.Count - 1 do
  begin
    Item := Root.ItemIndex(I);
      FWriteln('Accuracy                        '+VarToStr(Item.Accuracy));
      FWriteln('Availability                    '+VarToStr(Item.Availability));
      FWriteln('Caption                         '+Item.Caption);
      FWriteln('Config Manager Error Code       '+VarToStr(Item.ConfigManagerErrorCode));
      FWriteln('Config Manager User Config      '+VarToStr(Item.ConfigManagerUserConfig));
      FWriteln('Creation Class Name             '+VarToStr(Item.CreationClassName));
      FWriteln('Current Reading                 '+VarToStr(Item.CurrentReading));
      FWriteln('Description                     '+VarToStr(Item.Description));
      FWriteln('Device ID                       '+VarToStr(Item.DeviceID));
      FWriteln('Error Cleared                   '+VarToStr(Item.ErrorCleared ));
      FWriteln('Error Description               '+VarToStr(Item.ErrorDescription));
      FWriteln('Install Date                    '+VarToStr(Item.InstallDate));
      FWriteln('Is Linear                       '+VarToStr(Item.IsLinear));
      FWriteln('Last Error Code                 '+VarToStr(Item.LastErrorCode));
      FWriteln('Lower Threshold Critical        '+VarToStr(Item.LowerThresholdCritical));
      FWriteln('Lower Threshold Fatal           '+VarToStr(Item.LowerThresholdFatal));
      FWriteln('Lower Threshold NonCritical     '+VarToStr(Item.LowerThresholdNonCritical));
      FWriteln('Max Readable                    '+VarToStr(Item.MaxReadable));
      FWriteln('Min Readable                    '+VarToStr(Item.MinReadable));
      FWriteln('Name                            '+VarToStr(Item.Name));
      FWriteln('Nominal Reading                 '+VarToStr(Item.NominalReading));
      FWriteln('Normal Max                      '+VarToStr(Item.NormalMax));
      FWriteln('Normal Min                      '+VarToStr(Item.NormalMin ));
      FWriteln('PNP Device ID                   '+VarToStr(Item.PNPDeviceID));
      FWriteln('Power Management Capabilities   '+VarToStr(Item.PowerManagementCapabilities));
      FWriteln('Power Management Supported      '+VarToStr(Item.PowerManagementSupported));
      FWriteln('Resolution                      '+VarToStr(Item.Resolution));
      FWriteln('Status                          '+VarToStr(Item.Status));
      FWriteln('Status Info                     '+VarToStr(Item.StatusInfo));
      FWriteln('System Creation Class Name      '+VarToStr(Item.SystemCreationClassName));
      FWriteln('System Name                     '+VarToStr(Item.SystemName));
      FWriteln('Tolerance                       '+VarToStr(Item.Tolerance));
      FWriteln('Upper Threshold Critical        '+VarToStr(Item.UpperThresholdCritical));
      FWriteln('Upper Threshold Fatal           '+VarToStr(Item.UpperThresholdFatal));
      FWriteln('Upper Threshold NonCritical     '+VarToStr(Item.UpperThresholdNonCritical));
      FWriteln('');
  end;
end;

procedure  TForm1.ShowCPUFanInfo();
var
  WMIServices: ISWbemServices;
  Root       : ISWbemObjectSet;
  Item       : Variant;
  I          : Integer;
begin
 {
  http://msdn.microsoft.com/en-us/library/aa394146%28VS.85%29.aspx
  The Win32_Fan WMI class represents the properties of a fan device in the computer system. For example, the CPU cooling fan.
 }
  FWriteln('CPU FAN Info');
  FWriteln('----------------');
  WMIServices := CoSWbemLocator.Create.ConnectServer('.', 'root\cimv2','', '', '', '', 0, nil);
  Root  := WMIServices.ExecQuery('Select * FROM Win32_Fan','WQL', 0, nil);
  for I := 0 to Root.Count - 1 do
  begin
    Item := Root.ItemIndex(I);

    FWriteln('ActiveCooling                     '+VarToStr(Item.ActiveCooling));
    FWriteln('Availability                      '+VarToStr(Item.Availability));
    FWriteln('Caption                           '+VarToStr(Item.Caption));
    FWriteln('Config Manager ErrorCode          '+VarToStr(Item.ConfigManagerErrorCode));
    FWriteln('Config Manager UserConfig         '+VarToStr(Item.ConfigManagerUserConfig));
    FWriteln('Creation ClassName                '+VarToStr(Item.CreationClassName));
    FWriteln('Description                       '+VarToStr(Item.Description));
    FWriteln('DesiredSpeed                      '+VarToStr(Item.DesiredSpeed));
    FWriteln('DeviceID                          '+VarToStr(Item.DeviceID));
    FWriteln('ErrorCleared                      '+VarToStr(Item.ErrorCleared));
    FWriteln('ErrorDescription                  '+VarToStr(Item.ErrorDescription));
    FWriteln('InstallDate                       '+VarToStr(Item.InstallDate));
    FWriteln('LastErrorCode                     '+VarToStr(Item.LastErrorCode));
    FWriteln('Name                              '+VarToStr(Item.Name));
    FWriteln('PNPDeviceID                       '+VarToStr(Item.PNPDeviceID));
    FWriteln('PowerManagement Capabilities      '+VarToStr(Item.PowerManagementCapabilities));
    FWriteln('PowerManagement Supported         '+VarToStr(Item.PowerManagementSupported));
    FWriteln('Status                            '+VarToStr(Item.Status));
    FWriteln('StatusInfo                        '+VarToStr(Item.StatusInfo));
    FWriteln('SystemCreation ClassName          '+VarToStr(Item.SystemCreationClassName));
    FWriteln('SystemName                        '+VarToStr(Item.SystemName));
    FWriteln('VariableSpeed                     '+VarToStr(Item.VariableSpeed));
    FWriteln('');
  end;

End;


procedure TForm1.Button1Click(Sender: TObject);
begin
  try
    CoInitialize(nil);
        ShowTemperatureInfo();
        ShowCPUFanInfo();
      //  Readln;
    CoUninitialize;
  except
    on E:Exception do
    Begin
        CoUninitialize;
        FWriteln(E.Classname+ ': '+ E.Message);
       // Readln;
    End;
  end;
end;

end.
