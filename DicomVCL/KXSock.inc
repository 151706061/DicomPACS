//
// This file was introduced in version 2.0 (2nd Generation Code)
// It is included as a seperate file to allow you to include at high-levels
// if needed. Normal development will not require you to ever do this.
//
Const
   IsTrue=True;
   IsFalse=False;
   PeekBufferSize=250;
   TimeOut=3;

Type
   PNewConnect=^TNewConnect;
   TNewConnect=Record
      Port:Integer;
      UseNAGLE:Boolean;
      UseUDP:Boolean;
      UseBlocking:Boolean;
      ipAddress:String;
   End;

   PNewListen=^TNewListen;
   TNewListen=Record
      Port:Integer;
      WinsockQueue:Integer;
      UseNAGLE:Boolean;
      UseUDP:Boolean;
      UseBlocking:Boolean;
      ConnectionLess:Boolean;
   End;

   PWinsockInfo=^TWinsockInfo;
   TWinsockInfo=Record
     Major_Version:Byte;                 {current version}
     Minor_Version:Byte;                 {current version}
     Highest_Major_Version:Byte;         {available on disk}
     Highest_Minor_Version:Byte;         {available on disk}
     Description:array[0..256] of Char;  // C++ Char Description[256];
     SystemStatus:array[0..128] of Char; // C++ Char Description[128];
     MaxSockets:Word;                    // C++ Unsigned short MaxSockets;
     MaxUDPDatagramSize:Word;            // C++ Unsigned short MaxUDPDatagramSize;
     VendorInfo:PChar;                   // C++ Char FAR * VendorInfo;
   End;

///////////////////////////////////////////////////////////////////////////////
// Getting ready for IP6 support, I am not done so avoid using it yet!
///////////////////////////////////////////////////////////////////////////////
{   PSockAddrIn6 = ^TSockAddrIn6;
   sockaddr_in6 = record
      sin6_family: u_short;
      sin6_port: u_short;
      sin6_flowlabel: u_long;
      sin6_addr: array[0..4] of Char;
  end;
  TSockAddrIn6 = sockaddr_in6;}

Const
   AF_INET6=1; {1 is v4 but I have not found the true value yet}
