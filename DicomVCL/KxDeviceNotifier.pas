{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
{$WARN SYMBOL_DEPRECATED OFF}
Unit KxDeviceNotifier;

Interface

Uses
  Windows, Messages, Classes, Forms;

Type
  TWMDeviceChange = Record
    Msg: Cardinal;
    Event: UINT;
    dwData: Pointer;
    Result: LongInt;
  End;

  PDEV_BROADCAST_HDR = ^TDEV_BROADCAST_HDR;
  TDEV_BROADCAST_HDR = Packed Record
    dbch_size: DWORD;
    dbch_devicetype: DWORD;
    dbch_reserved: DWORD;
  End;

  PDEV_BROADCAST_DEVICEINTERFACE = ^TDEV_BROADCAST_DEVICEINTERFACE;
  TDEV_BROADCAST_DEVICEINTERFACE = Record
    dbcc_size: DWORD;
    dbcc_devicetype: DWORD;
    dbcc_reserved: DWORD;
    dbcc_classguid: TGUID;
    dbcc_name: short;
  End;

  PDEV_BROADCAST_VOLUME = ^TDEV_BROADCAST_VOLUME;
  TDEV_BROADCAST_VOLUME = Packed Record
    dbcv_size: DWORD;
    dbcv_devicetype: DWORD;
    dbcv_reserved: DWORD;
    dbcv_unitmask: DWORD;
    dbcv_flags: Word;
  End;

Const
  GUID_DEVINTERFACE_USB_DEVICE: TGUID = '{A5DCBF10-6530-11D2-901F-00C04FB951ED}';
  DBT_DEVICEARRIVAL = $8000;            // system detected a new device
  DBT_DEVICEREMOVECOMPLETE = $8004;     // device is gone
  DBT_DEVTYP_DEVICEINTERFACE = $00000005; // device interface class

  DBT_DEVTYP_VOLUME = $00000002;        // logical volume
  DBTF_MEDIA = $0001;                   // media comings and goings

Type
  TCDInsertDiskStatusEvent = Procedure(Sender: TObject; DriveLetter: Char) Of Object;
  TCDRemoveDiskStatusEvent = Procedure(Sender: TObject; DriveLetter: Char) Of Object;

  TDeviceNotifier = Class(TComponent)
  Private
    FWindowHandle: HWND;
    FOnDeviceArrival: TNotifyEvent;
    FOnDeviceRemove: TNotifyEvent;
    FOnNewDiskInserted: TCDInsertDiskStatusEvent;
    FOnDiskRemoved: TCDRemoveDiskStatusEvent;
    FHandle: Pointer;
    Procedure WndProc(Var Msg: TMessage);
    Function DeviceRegister: Boolean;
    Function DeviceUnRegister: Boolean;
  Protected
    Procedure OnWMDeviceChange(Var Msg: TWMDeviceChange); Dynamic;
  Public
    Constructor Create(AOwner: TComponent); Override;
    Destructor Destroy; Override;
  Published
    Property OnDeviceArrival: TNotifyEvent Read FOnDeviceArrival Write FOnDeviceArrival;
    Property OnDeviceRemove: TNotifyEvent Read FOnDeviceRemove Write FOnDeviceRemove;
    Property OnDiskInserted: TCDInsertDiskStatusEvent Read FOnNewDiskInserted Write FOnNewDiskInserted;
    Property OnDiskRemoved: TCDRemoveDiskStatusEvent Read FOnDiskRemoved Write FOnDiskRemoved;
  End;

Procedure Register;
Implementation

Procedure Register;
Begin
  RegisterComponents('Magic CD Burner', [TDeviceNotifier]);
End;

Constructor TDeviceNotifier.Create(AOwner: TComponent);
Begin
  Inherited Create(AOwner);
  FHandle := Nil;
  FWindowHandle := AllocateHWnd(WndProc);
  DeviceRegister;
End;

Destructor TDeviceNotifier.Destroy;
Begin
  DeviceUnRegister;
  DeallocateHWnd(FWindowHandle);
  Inherited Destroy;
End;

Procedure TDeviceNotifier.WndProc(Var Msg: TMessage);
Begin
  If (Msg.Msg = WM_DEVICECHANGE) Then
  Begin
    Try
      OnWMDeviceChange(TWMDeviceChange(Msg));
    Except
      Application.HandleException(Self);
    End;
  End
  Else
    Msg.Result := DefWindowProc(FWindowHandle, Msg.Msg, Msg.wParam, Msg.lParam);
End;

Function GetDrive(pDBVol: PDEV_BROADCAST_VOLUME): Char;
Var
  I: Byte;
  Maske: DWORD;
Begin
  Result := 'A';
  If (pDBVol^.dbcv_flags And DBTF_MEDIA) = DBTF_MEDIA Then
  Begin
    Maske := pDBVol^.dbcv_unitmask;
    For I := 0 To 25 Do
    Begin
      If (Maske And 1) = 1 Then
        Result := Char(I + Ord('A'));
      Maske := Maske Shr 1;
    End;
  End;
End;

Procedure TDeviceNotifier.OnWMDeviceChange(Var Msg: TWMDeviceChange);
Var
  lpdb: PDEV_BROADCAST_HDR;
Begin
  lpdb := PDEV_BROADCAST_HDR(Msg.dwData);

  Case Msg.Event Of
    DBT_DEVICEARRIVAL:
      Begin
        Case lpdb^.dbch_devicetype Of
          DBT_DEVTYP_VOLUME: If Assigned(FOnNewDiskInserted) Then FOnNewDiskInserted(Self, GetDrive(PDEV_BROADCAST_VOLUME(Msg.dwData)));
          DBT_DEVTYP_DEVICEINTERFACE: If Assigned(FOnDeviceArrival) Then FOnDeviceArrival(Self);
        End;
      End;
    DBT_DEVICEREMOVECOMPLETE:
      Begin
        Case lpdb^.dbch_devicetype Of
          DBT_DEVTYP_VOLUME: If Assigned(FOnDiskRemoved) Then FOnDiskRemoved(Self, GetDrive(PDEV_BROADCAST_VOLUME(Msg.dwData)));
          DBT_DEVTYP_DEVICEINTERFACE: If Assigned(FOnDeviceRemove) Then FOnDeviceRemove(Self);
        End;
      End;
  End;
End;

Function TDeviceNotifier.DeviceRegister: Boolean;
Var
  dbi: TDEV_BROADCAST_DEVICEINTERFACE;
  Size: Integer;
Begin
  Result := False;
  Size := SizeOf(TDEV_BROADCAST_DEVICEINTERFACE);
  ZeroMemory(@dbi, Size);
  dbi.dbcc_size := Size;
  dbi.dbcc_devicetype := DBT_DEVTYP_DEVICEINTERFACE;
  dbi.dbcc_reserved := 0;
  dbi.dbcc_classguid := GUID_DEVINTERFACE_USB_DEVICE;
  dbi.dbcc_name := 0;

  FHandle := RegisterDeviceNotification(FWindowHandle, @dbi, DEVICE_NOTIFY_WINDOW_HANDLE);
  If Assigned(FHandle) Then Result := True;
End;

Function TDeviceNotifier.DeviceUnRegister: Boolean;
Begin
  If Assigned(FHandle) Then
    Result := UnRegisterDeviceNotification(FHandle)
  Else
    Result := False;
End;

End.

