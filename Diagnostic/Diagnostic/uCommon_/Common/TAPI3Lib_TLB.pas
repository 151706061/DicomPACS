unit TAPI3Lib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 31.12.2001 23:05:06 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Tapi_DLLs\tapi3.dll (1)
// LIBID: {21D6D480-A88B-11D0-83DD-00AA003CCABD}
// LCID: 0
// Helpfile: 
// HelpString: Microsoft TAPI 3.0 Type Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\windows\system32\stdole2.tlb)
// Errors:
//   Error creating palette bitmap of (TTAPI) : Server C:\WINDOWS\system32\tapi3.dll contains no icons
//   Error creating palette bitmap of (TDispatchMapper) : Server C:\WINDOWS\system32\tapi3.dll contains no icons
//   Error creating palette bitmap of (TRequestMakeCall) : Server C:\WINDOWS\system32\tapi3.dll contains no icons
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  TAPI3LibMajorVersion = 1;
  TAPI3LibMinorVersion = 0;

  LIBID_TAPI3Lib: TGUID = '{21D6D480-A88B-11D0-83DD-00AA003CCABD}';

  IID_ITCollection: TGUID = '{5EC5ACF2-9C02-11D0-8362-00AA003CCABD}';
  IID_ITMediaPlayback: TGUID = '{627E8AE6-AE4C-4A69-BB63-2AD625404B77}';
  IID_ITMediaRecord: TGUID = '{F5DD4592-5476-4CC1-9D4D-FAD3EEFE7DB2}';
  IID_ITCollection2: TGUID = '{E6DDDDA5-A6D3-48FF-8737-D32FC4D95477}';
  IID_ITCallStateEvent: TGUID = '{62F47097-95C9-11D0-835D-00AA003CCABD}';
  IID_ITCallInfo: TGUID = '{350F85D1-1227-11D3-83D4-00C04FB6809F}';
  IID_ITAddress: TGUID = '{B1EFC386-9355-11D0-835C-00AA003CCABD}';
  IID_ITTAPI: TGUID = '{B1EFC382-9355-11D0-835C-00AA003CCABD}';
  IID_IEnumAddress: TGUID = '{1666FCA1-9363-11D0-835C-00AA003CCABD}';
  IID_IEnumCallHub: TGUID = '{A3C15450-5B92-11D1-8F4E-00C04FB6809F}';
  IID_ITCallHub: TGUID = '{A3C1544E-5B92-11D1-8F4E-00C04FB6809F}';
  IID_IEnumCall: TGUID = '{AE269CF6-935E-11D0-835C-00AA003CCABD}';
  IID_IEnumUnknown: TGUID = '{00000100-0000-0000-C000-000000000046}';
  IID_ITBasicCallControl: TGUID = '{B1EFC389-9355-11D0-835C-00AA003CCABD}';
  IID_ITForwardInformation: TGUID = '{449F659E-88A3-11D1-BB5D-00C04FB6809F}';
  IID_ITCallNotificationEvent: TGUID = '{895801DF-3DD6-11D1-8F30-00C04FB6809F}';
  IID_ITTAPIEventNotification: TGUID = '{EDDB9426-3B91-11D1-8F30-00C04FB6809F}';
  IID_ITBasicAudioTerminal: TGUID = '{B1EFC38D-9355-11D0-835C-00AA003CCABD}';
  IID_ITCallHubEvent: TGUID = '{A3C15451-5B92-11D1-8F4E-00C04FB6809F}';
  IID_ITForwardInformation2: TGUID = '{5229B4ED-B260-4382-8E1A-5DF3A8A4CCC0}';
  IID_ITAddressCapabilities: TGUID = '{8DF232F5-821B-11D1-BB5C-00C04FB6809F}';
  IID_IEnumBstr: TGUID = '{35372049-0BC6-11D2-A033-00C04FB6809F}';
  IID_ITQOSEvent: TGUID = '{CFA3357C-AD77-11D1-BB68-00C04FB6809F}';
  IID_ITAddressEvent: TGUID = '{831CE2D1-83B5-11D1-BB5C-00C04FB6809F}';
  IID_ITTerminal: TGUID = '{B1EFC38A-9355-11D0-835C-00AA003CCABD}';
  IID_ITAddressDeviceSpecificEvent: TGUID = '{3ACB216B-40BD-487A-8672-5CE77BD7E3A3}';
  IID_ITCallMediaEvent: TGUID = '{FF36B87F-EC3A-11D0-8EE4-00C04FB6809F}';
  IID_ITStream: TGUID = '{EE3BD605-3868-11D2-A045-00C04FB6809F}';
  IID_IEnumTerminal: TGUID = '{AE269CF4-935E-11D0-835C-00AA003CCABD}';
  IID_ITTAPIObjectEvent: TGUID = '{F4854D48-937A-11D1-BB58-00C04FB6809F}';
  IID_ITTAPIObjectEvent2: TGUID = '{359DDA6E-68CE-4383-BF0B-169133C41B46}';
  IID_ITPhone: TGUID = '{09D48DB4-10CC-4388-9DE7-A8465618975A}';
  IID_ITAddressTranslation: TGUID = '{0C4D8F03-8DDB-11D1-A09E-00805FC147D3}';
  IID_ITAddressTranslationInfo: TGUID = '{AFC15945-8D40-11D1-A09E-00805FC147D3}';
  IID_IEnumLocation: TGUID = '{0C4D8F01-8DDB-11D1-A09E-00805FC147D3}';
  IID_ITLocationInfo: TGUID = '{0C4D8EFF-8DDB-11D1-A09E-00805FC147D3}';
  IID_IEnumCallingCard: TGUID = '{0C4D8F02-8DDB-11D1-A09E-00805FC147D3}';
  IID_ITCallingCard: TGUID = '{0C4D8F00-8DDB-11D1-A09E-00805FC147D3}';
  IID_ITAgent: TGUID = '{5770ECE5-4B27-11D1-BF80-00805FC147D3}';
  IID_IEnumAgentSession: TGUID = '{5AFC314E-4BCC-11D1-BF80-00805FC147D3}';
  IID_ITAgentSession: TGUID = '{5AFC3147-4BCC-11D1-BF80-00805FC147D3}';
  IID_ITACDGroup: TGUID = '{5AFC3148-4BCC-11D1-BF80-00805FC147D3}';
  IID_IEnumQueue: TGUID = '{5AFC3158-4BCC-11D1-BF80-00805FC147D3}';
  IID_ITQueue: TGUID = '{5AFC3149-4BCC-11D1-BF80-00805FC147D3}';
  IID_ITAgentEvent: TGUID = '{5AFC314A-4BCC-11D1-BF80-00805FC147D3}';
  IID_ITAgentSessionEvent: TGUID = '{5AFC314B-4BCC-11D1-BF80-00805FC147D3}';
  IID_ITACDGroupEvent: TGUID = '{297F3032-BD11-11D1-A0A7-00805FC147D3}';
  IID_ITQueueEvent: TGUID = '{297F3033-BD11-11D1-A0A7-00805FC147D3}';
  IID_ITTAPICallCenter: TGUID = '{5AFC3154-4BCC-11D1-BF80-00805FC147D3}';
  IID_IEnumAgentHandler: TGUID = '{587E8C28-9802-11D1-A0A4-00805FC147D3}';
  IID_ITAgentHandler: TGUID = '{587E8C22-9802-11D1-A0A4-00805FC147D3}';
  IID_IEnumACDGroup: TGUID = '{5AFC3157-4BCC-11D1-BF80-00805FC147D3}';
  IID_ITAgentHandlerEvent: TGUID = '{297F3034-BD11-11D1-A0A7-00805FC147D3}';
  IID_ITCallInfoChangeEvent: TGUID = '{5D4B65F9-E51C-11D1-A02F-00C04FB6809F}';
  IID_ITRequestEvent: TGUID = '{AC48FFDE-F8C4-11D1-A030-00C04FB6809F}';
  IID_ITMediaSupport: TGUID = '{B1EFC384-9355-11D0-835C-00AA003CCABD}';
  IID_ITTerminalSupport: TGUID = '{B1EFC385-9355-11D0-835C-00AA003CCABD}';
  IID_IEnumTerminalClass: TGUID = '{AE269CF5-935E-11D0-835C-00AA003CCABD}';
  IID_ITTerminalSupport2: TGUID = '{F3EB39BC-1B1F-4E99-A0C0-56305C4DD591}';
  IID_IEnumPluggableSuperclassInfo: TGUID = '{E9586A80-89E6-4CFF-931D-478D5751F4C0}';
  IID_ITPluggableTerminalSuperclassInfo: TGUID = '{6D54E42C-4625-4359-A6F7-631999107E05}';
  IID_IEnumPluggableTerminalClassInfo: TGUID = '{4567450C-DBEE-4E3F-AAF5-37BF9EBF5E29}';
  IID_ITPluggableTerminalClassInfo: TGUID = '{41757F4A-CF09-4B34-BC96-0A79D2390076}';
  IID_ITStreamControl: TGUID = '{EE3BD604-3868-11D2-A045-00C04FB6809F}';
  IID_IEnumStream: TGUID = '{EE3BD606-3868-11D2-A045-00C04FB6809F}';
  IID_ITSubStreamControl: TGUID = '{EE3BD607-3868-11D2-A045-00C04FB6809F}';
  IID_ITSubStream: TGUID = '{EE3BD608-3868-11D2-A045-00C04FB6809F}';
  IID_IEnumSubStream: TGUID = '{EE3BD609-3868-11D2-A045-00C04FB6809F}';
  IID_ITLegacyAddressMediaControl: TGUID = '{AB493640-4C0B-11D2-A046-00C04FB6809F}';
  IID_ITLegacyAddressMediaControl2: TGUID = '{B0EE512B-A531-409E-9DD9-4099FE86C738}';
  IID_ITLegacyCallMediaControl: TGUID = '{D624582F-CC23-4436-B8A5-47C625C8045D}';
  IID_ITLegacyCallMediaControl2: TGUID = '{57CA332D-7BC2-44F1-A60C-936FE8D7CE73}';
  IID_ITDetectTone: TGUID = '{961F79BD-3097-49DF-A1D6-909B77E89CA0}';
  IID_ITCustomTone: TGUID = '{357AD764-B3C6-4B2A-8FA5-0722827A9254}';
  IID_ITDigitDetectionEvent: TGUID = '{80D3BFAC-57D9-11D2-A04A-00C04FB6809F}';
  IID_ITDigitGenerationEvent: TGUID = '{80D3BFAD-57D9-11D2-A04A-00C04FB6809F}';
  IID_ITDigitsGatheredEvent: TGUID = '{E52EC4C1-CBA3-441A-9E6A-93CB909E9724}';
  IID_ITToneDetectionEvent: TGUID = '{407E0FAF-D047-4753-B0C6-8E060373FECD}';
  IID_ITPrivateEvent: TGUID = '{0E269CD0-10D4-4121-9C22-9C85D625650D}';
  IID_ITAddress2: TGUID = '{B0AE5D9B-BE51-46C9-B0F7-DFA8A22A8BC4}';
  IID_IEnumPhone: TGUID = '{F15B7669-4780-4595-8C89-FB369C8CF7AA}';
  IID_ITTAPI2: TGUID = '{54FBDC8C-D90F-4DAD-9695-B373097F094B}';
  IID_ITMultiTrackTerminal: TGUID = '{FE040091-ADE8-4072-95C9-BF7DE8C54B44}';
  IID_ITStaticAudioTerminal: TGUID = '{A86B7871-D14C-48E6-922E-A8D15F984800}';
  IID_ITBasicCallControl2: TGUID = '{161A4A56-1E99-4B3F-A46A-168F38A5EE4C}';
  IID_ITAutomatedPhoneControl: TGUID = '{1EE1AF0E-6159-4A61-B79B-6A4BA3FC9DFC}';
  IID_ITMediaControl: TGUID = '{C445DDE8-5199-4BC7-9807-5FFB92E42E09}';
  IID_ITFileTrack: TGUID = '{31CA6EA9-C08A-4BEA-8811-8E9C1BA3EA3A}';
  IID_ITScriptableAudioFormat: TGUID = '{B87658BD-3C59-4F64-BE74-AEDE3E86A81E}';
  IID_ITCallInfo2: TGUID = '{94D70CA6-7AB0-4DAA-81CA-B8F8643FAEC1}';
  IID_ITFileTerminalEvent: TGUID = '{E4A7FBAC-8C17-4427-9F55-9F589AC8AF00}';
  IID_ITToneTerminalEvent: TGUID = '{E6F56009-611F-4945-BBD2-2D0CE5612056}';
  IID_ITASRTerminalEvent: TGUID = '{EE016A02-4FA9-467C-933F-5A15B12377D7}';
  IID_ITTTSTerminalEvent: TGUID = '{D964788F-95A5-461D-AB0C-B9900A6C2713}';
  IID_ITPhoneEvent: TGUID = '{8F942DD8-64ED-4AAF-A77D-B23DB0837EAD}';
  IID_ITPhoneDeviceSpecificEvent: TGUID = '{63FFB2A6-872B-4CD3-A501-326E8FB40AF7}';
  IID_ITLegacyWaveSupport: TGUID = '{207823EA-E252-11D2-B77E-0080C7135381}';
  DIID_ITTAPIDispatchEventNotification: TGUID = '{9F34325B-7E62-11D2-9457-00C04F8EC888}';
  CLASS_TAPI: TGUID = '{21D6D48E-A88B-11D0-83DD-00AA003CCABD}';
  IID_ITDispatchMapper: TGUID = '{E9225295-C759-11D1-A02B-00C04FB6809F}';
  CLASS_DispatchMapper: TGUID = '{E9225296-C759-11D1-A02B-00C04FB6809F}';
  IID_ITRequest: TGUID = '{AC48FFDF-F8C4-11D1-A030-00C04FB6809F}';
  CLASS_RequestMakeCall: TGUID = '{AC48FFE0-F8C4-11D1-A030-00C04FB6809F}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum ADDRESS_STATE
type
  ADDRESS_STATE = TOleEnum;
const
  AS_INSERVICE = $00000000;
  AS_OUTOFSERVICE = $00000001;

// Constants for enum CALLHUB_STATE
type
  CALLHUB_STATE = TOleEnum;
const
  CHS_ACTIVE = $00000000;
  CHS_IDLE = $00000001;

// Constants for enum DISCONNECT_CODE
type
  DISCONNECT_CODE = TOleEnum;
const
  DC_NORMAL = $00000000;
  DC_NOANSWER = $00000001;
  DC_REJECTED = $00000002;

// Constants for enum QOS_SERVICE_LEVEL
type
  QOS_SERVICE_LEVEL = TOleEnum;
const
  QSL_NEEDED = $00000001;
  QSL_IF_AVAILABLE = $00000002;
  QSL_BEST_EFFORT = $00000003;

// Constants for enum FINISH_MODE
type
  FINISH_MODE = TOleEnum;
const
  FM_ASTRANSFER = $00000000;
  FM_ASCONFERENCE = $00000001;

// Constants for enum CALL_STATE
type
  CALL_STATE = TOleEnum;
const
  CS_IDLE = $00000000;
  CS_INPROGRESS = $00000001;
  CS_CONNECTED = $00000002;
  CS_DISCONNECTED = $00000003;
  CS_OFFERING = $00000004;
  CS_HOLD = $00000005;
  CS_QUEUED = $00000006;
  CS_LASTITEM = $00000006;

// Constants for enum CALL_PRIVILEGE
type
  CALL_PRIVILEGE = TOleEnum;
const
  CP_OWNER = $00000000;
  CP_MONITOR = $00000001;

// Constants for enum CALLINFO_LONG
type
  CALLINFO_LONG = TOleEnum;
const
  CIL_MEDIATYPESAVAILABLE = $00000000;
  CIL_BEARERMODE = $00000001;
  CIL_CALLERIDADDRESSTYPE = $00000002;
  CIL_CALLEDIDADDRESSTYPE = $00000003;
  CIL_CONNECTEDIDADDRESSTYPE = $00000004;
  CIL_REDIRECTIONIDADDRESSTYPE = $00000005;
  CIL_REDIRECTINGIDADDRESSTYPE = $00000006;
  CIL_ORIGIN = $00000007;
  CIL_REASON = $00000008;
  CIL_APPSPECIFIC = $00000009;
  CIL_CALLPARAMSFLAGS = $0000000A;
  CIL_CALLTREATMENT = $0000000B;
  CIL_MINRATE = $0000000C;
  CIL_MAXRATE = $0000000D;
  CIL_COUNTRYCODE = $0000000E;
  CIL_CALLID = $0000000F;
  CIL_RELATEDCALLID = $00000010;
  CIL_COMPLETIONID = $00000011;
  CIL_NUMBEROFOWNERS = $00000012;
  CIL_NUMBEROFMONITORS = $00000013;
  CIL_TRUNK = $00000014;
  CIL_RATE = $00000015;
  CIL_GENERATEDIGITDURATION = $00000016;
  CIL_MONITORDIGITMODES = $00000017;
  CIL_MONITORMEDIAMODES = $00000018;

// Constants for enum CALLINFO_STRING
type
  CALLINFO_STRING = TOleEnum;
const
  CIS_CALLERIDNAME = $00000000;
  CIS_CALLERIDNUMBER = $00000001;
  CIS_CALLEDIDNAME = $00000002;
  CIS_CALLEDIDNUMBER = $00000003;
  CIS_CONNECTEDIDNAME = $00000004;
  CIS_CONNECTEDIDNUMBER = $00000005;
  CIS_REDIRECTIONIDNAME = $00000006;
  CIS_REDIRECTIONIDNUMBER = $00000007;
  CIS_REDIRECTINGIDNAME = $00000008;
  CIS_REDIRECTINGIDNUMBER = $00000009;
  CIS_CALLEDPARTYFRIENDLYNAME = $0000000A;
  CIS_COMMENT = $0000000B;
  CIS_DISPLAYABLEADDRESS = $0000000C;
  CIS_CALLINGPARTYID = $0000000D;

// Constants for enum CALLINFO_BUFFER
type
  CALLINFO_BUFFER = TOleEnum;
const
  CIB_USERUSERINFO = $00000000;
  CIB_DEVSPECIFICBUFFER = $00000001;
  CIB_CALLDATABUFFER = $00000002;
  CIB_CHARGINGINFOBUFFER = $00000003;
  CIB_HIGHLEVELCOMPATIBILITYBUFFER = $00000004;
  CIB_LOWLEVELCOMPATIBILITYBUFFER = $00000005;

// Constants for enum CALL_STATE_EVENT_CAUSE
type
  CALL_STATE_EVENT_CAUSE = TOleEnum;
const
  CEC_NONE = $00000000;
  CEC_DISCONNECT_NORMAL = $00000001;
  CEC_DISCONNECT_BUSY = $00000002;
  CEC_DISCONNECT_BADADDRESS = $00000003;
  CEC_DISCONNECT_NOANSWER = $00000004;
  CEC_DISCONNECT_CANCELLED = $00000005;
  CEC_DISCONNECT_REJECTED = $00000006;
  CEC_DISCONNECT_FAILED = $00000007;
  CEC_DISCONNECT_BLOCKED = $00000008;

// Constants for enum CALL_NOTIFICATION_EVENT
type
  CALL_NOTIFICATION_EVENT = TOleEnum;
const
  CNE_OWNER = $00000000;
  CNE_MONITOR = $00000001;
  CNE_LASTITEM = $00000001;

// Constants for enum TAPI_EVENT
type
  TAPI_EVENT = TOleEnum; // !!! смотреть Prihodko 
const
  TE_TAPIOBJECT = $00000001;
  TE_ADDRESS = $00000002;
  TE_CALLNOTIFICATION = $00000004;
  TE_CALLSTATE = $00000008;
  TE_CALLMEDIA = $00000010;
  TE_CALLHUB = $00000020;
  TE_CALLINFOCHANGE = $00000040;
  TE_PRIVATE = $00000080;
  TE_REQUEST = $00000100;
  TE_AGENT = $00000200;
  TE_AGENTSESSION = $00000400;
  TE_QOSEVENT = $00000800;
  TE_AGENTHANDLER = $00001000;
  TE_ACDGROUP = $00002000;
  TE_QUEUE = $00004000;
  TE_DIGITEVENT = $00008000;
  TE_GENERATEEVENT = $00010000;
  TE_ASRTERMINAL = $00020000;
  TE_TTSTERMINAL = $00040000;
  TE_FILETERMINAL = $00080000;
  TE_TONETERMINAL = $00100000;
  TE_PHONEEVENT = $00200000;
  TE_TONEEVENT = $00400000;
  TE_GATHERDIGITS = $00800000;
  TE_ADDRESSDEVSPECIFIC = $01000000;
  TE_PHONEDEVSPECIFIC = $02000000;

// Constants for enum CALLHUB_EVENT
type
  CALLHUB_EVENT = TOleEnum;
const
  CHE_CALLJOIN = $00000000;
  CHE_CALLLEAVE = $00000001;
  CHE_CALLHUBNEW = $00000002;
  CHE_CALLHUBIDLE = $00000003;
  CHE_LASTITEM = $00000003;

// Constants for enum ADDRESS_CAPABILITY
type
  ADDRESS_CAPABILITY = TOleEnum;
const
  AC_ADDRESSTYPES = $00000000;
  AC_BEARERMODES = $00000001;
  AC_MAXACTIVECALLS = $00000002;
  AC_MAXONHOLDCALLS = $00000003;
  AC_MAXONHOLDPENDINGCALLS = $00000004;
  AC_MAXNUMCONFERENCE = $00000005;
  AC_MAXNUMTRANSCONF = $00000006;
  AC_MONITORDIGITSUPPORT = $00000007;
  AC_GENERATEDIGITSUPPORT = $00000008;
  AC_GENERATETONEMODES = $00000009;
  AC_GENERATETONEMAXNUMFREQ = $0000000A;
  AC_MONITORTONEMAXNUMFREQ = $0000000B;
  AC_MONITORTONEMAXNUMENTRIES = $0000000C;
  AC_DEVCAPFLAGS = $0000000D;
  AC_ANSWERMODES = $0000000E;
  AC_LINEFEATURES = $0000000F;
  AC_SETTABLEDEVSTATUS = $00000010;
  AC_PARKSUPPORT = $00000011;
  AC_CALLERIDSUPPORT = $00000012;
  AC_CALLEDIDSUPPORT = $00000013;
  AC_CONNECTEDIDSUPPORT = $00000014;
  AC_REDIRECTIONIDSUPPORT = $00000015;
  AC_REDIRECTINGIDSUPPORT = $00000016;
  AC_ADDRESSCAPFLAGS = $00000017;
  AC_CALLFEATURES1 = $00000018;
  AC_CALLFEATURES2 = $00000019;
  AC_REMOVEFROMCONFCAPS = $0000001A;
  AC_REMOVEFROMCONFSTATE = $0000001B;
  AC_TRANSFERMODES = $0000001C;
  AC_ADDRESSFEATURES = $0000001D;
  AC_PREDICTIVEAUTOTRANSFERSTATES = $0000001E;
  AC_MAXCALLDATASIZE = $0000001F;
  AC_LINEID = $00000020;
  AC_ADDRESSID = $00000021;
  AC_FORWARDMODES = $00000022;
  AC_MAXFORWARDENTRIES = $00000023;
  AC_MAXSPECIFICENTRIES = $00000024;
  AC_MINFWDNUMRINGS = $00000025;
  AC_MAXFWDNUMRINGS = $00000026;
  AC_MAXCALLCOMPLETIONS = $00000027;
  AC_CALLCOMPLETIONCONDITIONS = $00000028;
  AC_CALLCOMPLETIONMODES = $00000029;
  AC_PERMANENTDEVICEID = $0000002A;
  AC_GATHERDIGITSMINTIMEOUT = $0000002B;
  AC_GATHERDIGITSMAXTIMEOUT = $0000002C;
  AC_GENERATEDIGITMINDURATION = $0000002D;
  AC_GENERATEDIGITMAXDURATION = $0000002E;
  AC_GENERATEDIGITDEFAULTDURATION = $0000002F;

// Constants for enum ADDRESS_CAPABILITY_STRING
type
  ADDRESS_CAPABILITY_STRING = TOleEnum;
const
  ACS_PROTOCOL = $00000000;
  ACS_ADDRESSDEVICESPECIFIC = $00000001;
  ACS_LINEDEVICESPECIFIC = $00000002;
  ACS_PROVIDERSPECIFIC = $00000003;
  ACS_SWITCHSPECIFIC = $00000004;
  ACS_PERMANENTDEVICEGUID = $00000005;

// Constants for enum QOS_EVENT
type
  QOS_EVENT = TOleEnum;
const
  QE_NOQOS = $00000001;
  QE_ADMISSIONFAILURE = $00000002;
  QE_POLICYFAILURE = $00000003;
  QE_GENERICERROR = $00000004;
  QE_LASTITEM = $00000004;

// Constants for enum ADDRESS_EVENT
type
  ADDRESS_EVENT = TOleEnum;
const
  AE_STATE = $00000000;
  AE_CAPSCHANGE = $00000001;
  AE_RINGING = $00000002;
  AE_CONFIGCHANGE = $00000003;
  AE_FORWARD = $00000004;
  AE_NEWTERMINAL = $00000005;
  AE_REMOVETERMINAL = $00000006;
  AE_MSGWAITON = $00000007;
  AE_MSGWAITOFF = $00000008;
  AE_LASTITEM = $00000008;

// Constants for enum TERMINAL_STATE
type
  TERMINAL_STATE = TOleEnum;
const
  TS_INUSE = $00000000;
  TS_NOTINUSE = $00000001;

// Constants for enum TERMINAL_TYPE
type
  TERMINAL_TYPE = TOleEnum;
const
  TT_STATIC = $00000000;
  TT_DYNAMIC = $00000001;

// Constants for enum TERMINAL_DIRECTION
type
  TERMINAL_DIRECTION = TOleEnum;
const
  TD_CAPTURE = $00000000;
  TD_RENDER = $00000001;
  TD_BIDIRECTIONAL = $00000002;
  TD_MULTITRACK_MIXED = $00000003;
  TD_NONE = $00000004;

// Constants for enum CALL_MEDIA_EVENT
type
  CALL_MEDIA_EVENT = TOleEnum;
const
  CME_NEW_STREAM = $00000000;
  CME_STREAM_FAIL = $00000001;
  CME_TERMINAL_FAIL = $00000002;
  CME_STREAM_NOT_USED = $00000003;
  CME_STREAM_ACTIVE = $00000004;
  CME_STREAM_INACTIVE = $00000005;
  CME_LASTITEM = $00000005;

// Constants for enum CALL_MEDIA_EVENT_CAUSE
type
  CALL_MEDIA_EVENT_CAUSE = TOleEnum;
const
  CMC_UNKNOWN = $00000000;
  CMC_BAD_DEVICE = $00000001;
  CMC_CONNECT_FAIL = $00000002;
  CMC_LOCAL_REQUEST = $00000003;
  CMC_REMOTE_REQUEST = $00000004;
  CMC_MEDIA_TIMEOUT = $00000005;
  CMC_MEDIA_RECOVERED = $00000006;
  CMC_QUALITY_OF_SERVICE = $00000007;

// Constants for enum TAPIOBJECT_EVENT
type
  TAPIOBJECT_EVENT = TOleEnum;
const
  TE_ADDRESSCREATE = $00000000;
  TE_ADDRESSREMOVE = $00000001;
  TE_REINIT = $00000002;
  TE_TRANSLATECHANGE = $00000003;
  TE_ADDRESSCLOSE = $00000004;
  TE_PHONECREATE = $00000005;
  TE_PHONEREMOVE = $00000006;

// Constants for enum PHONE_PRIVILEGE
type
  PHONE_PRIVILEGE = TOleEnum;
const
  PP_OWNER = $00000000;
  PP_MONITOR = $00000001;

// Constants for enum PHONECAPS_LONG
type
  PHONECAPS_LONG = TOleEnum;
const
  PCL_HOOKSWITCHES = $00000000;
  PCL_HANDSETHOOKSWITCHMODES = $00000001;
  PCL_HEADSETHOOKSWITCHMODES = $00000002;
  PCL_SPEAKERPHONEHOOKSWITCHMODES = $00000003;
  PCL_DISPLAYNUMROWS = $00000004;
  PCL_DISPLAYNUMCOLUMNS = $00000005;
  PCL_NUMRINGMODES = $00000006;
  PCL_NUMBUTTONLAMPS = $00000007;
  PCL_GENERICPHONE = $00000008;

// Constants for enum PHONECAPS_STRING
type
  PHONECAPS_STRING = TOleEnum;
const
  PCS_PHONENAME = $00000000;
  PCS_PHONEINFO = $00000001;
  PCS_PROVIDERINFO = $00000002;

// Constants for enum PHONE_BUTTON_MODE
type
  PHONE_BUTTON_MODE = TOleEnum;
const
  PBM_DUMMY = $00000000;
  PBM_CALL = $00000001;
  PBM_FEATURE = $00000002;
  PBM_KEYPAD = $00000003;
  PBM_LOCAL = $00000004;
  PBM_DISPLAY = $00000005;

// Constants for enum PHONE_BUTTON_FUNCTION
type
  PHONE_BUTTON_FUNCTION = TOleEnum;
const
  PBF_UNKNOWN = $00000000;
  PBF_CONFERENCE = $00000001;
  PBF_TRANSFER = $00000002;
  PBF_DROP = $00000003;
  PBF_HOLD = $00000004;
  PBF_RECALL = $00000005;
  PBF_DISCONNECT = $00000006;
  PBF_CONNECT = $00000007;
  PBF_MSGWAITON = $00000008;
  PBF_MSGWAITOFF = $00000009;
  PBF_SELECTRING = $0000000A;
  PBF_ABBREVDIAL = $0000000B;
  PBF_FORWARD = $0000000C;
  PBF_PICKUP = $0000000D;
  PBF_RINGAGAIN = $0000000E;
  PBF_PARK = $0000000F;
  PBF_REJECT = $00000010;
  PBF_REDIRECT = $00000011;
  PBF_MUTE = $00000012;
  PBF_VOLUMEUP = $00000013;
  PBF_VOLUMEDOWN = $00000014;
  PBF_SPEAKERON = $00000015;
  PBF_SPEAKEROFF = $00000016;
  PBF_FLASH = $00000017;
  PBF_DATAON = $00000018;
  PBF_DATAOFF = $00000019;
  PBF_DONOTDISTURB = $0000001A;
  PBF_INTERCOM = $0000001B;
  PBF_BRIDGEDAPP = $0000001C;
  PBF_BUSY = $0000001D;
  PBF_CALLAPP = $0000001E;
  PBF_DATETIME = $0000001F;
  PBF_DIRECTORY = $00000020;
  PBF_COVER = $00000021;
  PBF_CALLID = $00000022;
  PBF_LASTNUM = $00000023;
  PBF_NIGHTSRV = $00000024;
  PBF_SENDCALLS = $00000025;
  PBF_MSGINDICATOR = $00000026;
  PBF_REPDIAL = $00000027;
  PBF_SETREPDIAL = $00000028;
  PBF_SYSTEMSPEED = $00000029;
  PBF_STATIONSPEED = $0000002A;
  PBF_CAMPON = $0000002B;
  PBF_SAVEREPEAT = $0000002C;
  PBF_QUEUECALL = $0000002D;
  PBF_NONE = $0000002E;
  PBF_SEND = $0000002F;

// Constants for enum PHONE_BUTTON_STATE
type
  PHONE_BUTTON_STATE = TOleEnum;
const
  PBS_UP = $00000001;
  PBS_DOWN = $00000002;
  PBS_UNKNOWN = $00000004;
  PBS_UNAVAIL = $00000008;

// Constants for enum PHONE_HOOK_SWITCH_DEVICE
type
  PHONE_HOOK_SWITCH_DEVICE = TOleEnum;
const
  PHSD_HANDSET = $00000001;
  PHSD_SPEAKERPHONE = $00000002;
  PHSD_HEADSET = $00000004;

// Constants for enum PHONE_HOOK_SWITCH_STATE
type
  PHONE_HOOK_SWITCH_STATE = TOleEnum;
const
  PHSS_ONHOOK = $00000001;
  PHSS_OFFHOOK_MIC_ONLY = $00000002;
  PHSS_OFFHOOK_SPEAKER_ONLY = $00000004;
  PHSS_OFFHOOK = $00000008;

// Constants for enum PHONECAPS_BUFFER
type
  PHONECAPS_BUFFER = TOleEnum;
const
  PCB_DEVSPECIFICBUFFER = $00000000;

// Constants for enum PHONE_LAMP_MODE
type
  PHONE_LAMP_MODE = TOleEnum;
const
  LM_DUMMY = $00000001;
  LM_OFF = $00000002;
  LM_STEADY = $00000004;
  LM_WINK = $00000008;
  LM_FLASH = $00000010;
  LM_FLUTTER = $00000020;
  LM_BROKENFLUTTER = $00000040;
  LM_UNKNOWN = $00000080;

// Constants for enum AGENT_SESSION_STATE
type
  AGENT_SESSION_STATE = TOleEnum;
const
  ASST_NOT_READY = $00000000;
  ASST_READY = $00000001;
  ASST_BUSY_ON_CALL = $00000002;
  ASST_BUSY_WRAPUP = $00000003;
  ASST_SESSION_ENDED = $00000004;

// Constants for enum AGENT_STATE
type
  AGENT_STATE = TOleEnum;
const
  AS_NOT_READY = $00000000;
  AS_READY = $00000001;
  AS_BUSY_ACD = $00000002;
  AS_BUSY_INCOMING = $00000003;
  AS_BUSY_OUTGOING = $00000004;
  AS_UNKNOWN = $00000005;

// Constants for enum AGENT_EVENT
type
  AGENT_EVENT = TOleEnum;
const
  AE_NOT_READY = $00000000;
  AE_READY = $00000001;
  AE_BUSY_ACD = $00000002;
  AE_BUSY_INCOMING = $00000003;
  AE_BUSY_OUTGOING = $00000004;
  AE_UNKNOWN = $00000005;

// Constants for enum AGENT_SESSION_EVENT
type
  AGENT_SESSION_EVENT = TOleEnum;
const
  ASE_NEW_SESSION = $00000000;
  ASE_NOT_READY = $00000001;
  ASE_READY = $00000002;
  ASE_BUSY = $00000003;
  ASE_WRAPUP = $00000004;
  ASE_END = $00000005;

// Constants for enum ACDGROUP_EVENT
type
  ACDGROUP_EVENT = TOleEnum;
const
  ACDGE_NEW_GROUP = $00000000;
  ACDGE_GROUP_REMOVED = $00000001;

// Constants for enum ACDQUEUE_EVENT
type
  ACDQUEUE_EVENT = TOleEnum;
const
  ACDQE_NEW_QUEUE = $00000000;
  ACDQE_QUEUE_REMOVED = $00000001;

// Constants for enum AGENTHANDLER_EVENT
type
  AGENTHANDLER_EVENT = TOleEnum;
const
  AHE_NEW_AGENTHANDLER = $00000000;
  AHE_AGENTHANDLER_REMOVED = $00000001;

// Constants for enum CALLINFOCHANGE_CAUSE
type
  CALLINFOCHANGE_CAUSE = TOleEnum;
const
  CIC_OTHER = $00000000;
  CIC_DEVSPECIFIC = $00000001;
  CIC_BEARERMODE = $00000002;
  CIC_RATE = $00000003;
  CIC_APPSPECIFIC = $00000004;
  CIC_CALLID = $00000005;
  CIC_RELATEDCALLID = $00000006;
  CIC_ORIGIN = $00000007;
  CIC_REASON = $00000008;
  CIC_COMPLETIONID = $00000009;
  CIC_NUMOWNERINCR = $0000000A;
  CIC_NUMOWNERDECR = $0000000B;
  CIC_NUMMONITORS = $0000000C;
  CIC_TRUNK = $0000000D;
  CIC_CALLERID = $0000000E;
  CIC_CALLEDID = $0000000F;
  CIC_CONNECTEDID = $00000010;
  CIC_REDIRECTIONID = $00000011;
  CIC_REDIRECTINGID = $00000012;
  CIC_USERUSERINFO = $00000013;
  CIC_HIGHLEVELCOMP = $00000014;
  CIC_LOWLEVELCOMP = $00000015;
  CIC_CHARGINGINFO = $00000016;
  CIC_TREATMENT = $00000017;
  CIC_CALLDATA = $00000018;
  CIC_PRIVILEGE = $00000019;
  CIC_MEDIATYPE = $0000001A;
  CIC_LASTITEM = $0000001A;

// Constants for enum TAPI_TONEMODE
type
  TAPI_TONEMODE = TOleEnum;
const
  TTM_RINGBACK = $00000002;
  TTM_BUSY = $00000004;
  TTM_BEEP = $00000008;
  TTM_BILLING = $00000010;

// Constants for enum TAPI_GATHERTERM
type
  TAPI_GATHERTERM = TOleEnum;
const
  TGT_BUFFERFULL = $00000001;
  TGT_TERMDIGIT = $00000002;
  TGT_FIRSTTIMEOUT = $00000004;
  TGT_INTERTIMEOUT = $00000008;
  TGT_CANCEL = $00000010;

// Constants for enum PHONE_TONE
type
  PHONE_TONE = TOleEnum;
const
  PT_KEYPADZERO = $00000000;
  PT_KEYPADONE = $00000001;
  PT_KEYPADTWO = $00000002;
  PT_KEYPADTHREE = $00000003;
  PT_KEYPADFOUR = $00000004;
  PT_KEYPADFIVE = $00000005;
  PT_KEYPADSIX = $00000006;
  PT_KEYPADSEVEN = $00000007;
  PT_KEYPADEIGHT = $00000008;
  PT_KEYPADNINE = $00000009;
  PT_KEYPADSTAR = $0000000A;
  PT_KEYPADPOUND = $0000000B;
  PT_KEYPADA = $0000000C;
  PT_KEYPADB = $0000000D;
  PT_KEYPADC = $0000000E;
  PT_KEYPADD = $0000000F;
  PT_NORMALDIALTONE = $00000010;
  PT_EXTERNALDIALTONE = $00000011;
  PT_BUSY = $00000012;
  PT_RINGBACK = $00000013;
  PT_ERRORTONE = $00000014;
  PT_SILENCE = $00000015;

// Constants for enum TERMINAL_MEDIA_STATE
type
  TERMINAL_MEDIA_STATE = TOleEnum;
const
  TMS_IDLE = $00000000;
  TMS_ACTIVE = $00000001;
  TMS_PAUSED = $00000002;
  TMS_LASTITEM = $00000002;

// Constants for enum FT_STATE_EVENT_CAUSE
type
  FT_STATE_EVENT_CAUSE = TOleEnum;
const
  FTEC_NORMAL = $00000000;
  FTEC_END_OF_FILE = $00000001;
  FTEC_READ_ERROR = $00000002;
  FTEC_WRITE_ERROR = $00000003;

// Constants for enum PHONE_EVENT
type
  PHONE_EVENT = TOleEnum;
const
  PE_DISPLAY = $00000000;
  PE_LAMPMODE = $00000001;
  PE_RINGMODE = $00000002;
  PE_RINGVOLUME = $00000003;
  PE_HOOKSWITCH = $00000004;
  PE_CAPSCHANGE = $00000005;
  PE_BUTTON = $00000006;
  PE_CLOSE = $00000007;
  PE_NUMBERGATHERED = $00000008;
  PE_DIALING = $00000009;
  PE_ANSWER = $0000000A;
  PE_DISCONNECT = $0000000B;
  PE_LASTITEM = $0000000B;

// Constants for enum FULLDUPLEX_SUPPORT
type
  FULLDUPLEX_SUPPORT = TOleEnum;
const
  FDS_SUPPORTED = $00000000;
  FDS_NOTSUPPORTED = $00000001;
  FDS_UNKNOWN = $00000002;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ITCollection = interface;
  ITCollectionDisp = dispinterface;
  ITMediaPlayback = interface;
  ITMediaPlaybackDisp = dispinterface;
  ITMediaRecord = interface;
  ITMediaRecordDisp = dispinterface;
  ITCollection2 = interface;
  ITCollection2Disp = dispinterface;
  ITCallStateEvent = interface;
  ITCallStateEventDisp = dispinterface;
  ITCallInfo = interface;
  ITCallInfoDisp = dispinterface;
  ITAddress = interface;
  ITAddressDisp = dispinterface;
  ITTAPI = interface;
  ITTAPIDisp = dispinterface;
  IEnumAddress = interface;
  IEnumCallHub = interface;
  ITCallHub = interface;
  ITCallHubDisp = dispinterface;
  IEnumCall = interface;
  IEnumUnknown = interface;
  ITBasicCallControl = interface;
  ITBasicCallControlDisp = dispinterface;
  ITForwardInformation = interface;
  ITForwardInformationDisp = dispinterface;
  ITCallNotificationEvent = interface;
  ITCallNotificationEventDisp = dispinterface;
  ITTAPIEventNotification = interface;
  ITBasicAudioTerminal = interface;
  ITBasicAudioTerminalDisp = dispinterface;
  ITCallHubEvent = interface;
  ITForwardInformation2 = interface;
  ITForwardInformation2Disp = dispinterface;
  ITAddressCapabilities = interface;
  ITAddressCapabilitiesDisp = dispinterface;
  IEnumBstr = interface;
  ITQOSEvent = interface;
  ITAddressEvent = interface;
  ITTerminal = interface;
  ITTerminalDisp = dispinterface;
  ITAddressDeviceSpecificEvent = interface;
  ITCallMediaEvent = interface;
  ITCallMediaEventDisp = dispinterface;
  ITStream = interface;
  ITStreamDisp = dispinterface;
  IEnumTerminal = interface;
  ITTAPIObjectEvent = interface;
  ITTAPIObjectEventDisp = dispinterface;
  ITTAPIObjectEvent2 = interface;
  ITPhone = interface;
  ITPhoneDisp = dispinterface;
  ITAddressTranslation = interface;
  ITAddressTranslationDisp = dispinterface;
  ITAddressTranslationInfo = interface;
  ITAddressTranslationInfoDisp = dispinterface;
  IEnumLocation = interface;
  ITLocationInfo = interface;
  ITLocationInfoDisp = dispinterface;
  IEnumCallingCard = interface;
  ITCallingCard = interface;
  ITCallingCardDisp = dispinterface;
  ITAgent = interface;
  ITAgentDisp = dispinterface;
  IEnumAgentSession = interface;
  ITAgentSession = interface;
  ITAgentSessionDisp = dispinterface;
  ITACDGroup = interface;
  ITACDGroupDisp = dispinterface;
  IEnumQueue = interface;
  ITQueue = interface;
  ITQueueDisp = dispinterface;
  ITAgentEvent = interface;
  ITAgentEventDisp = dispinterface;
  ITAgentSessionEvent = interface;
  ITAgentSessionEventDisp = dispinterface;
  ITACDGroupEvent = interface;
  ITACDGroupEventDisp = dispinterface;
  ITQueueEvent = interface;
  ITQueueEventDisp = dispinterface;
  ITTAPICallCenter = interface;
  ITTAPICallCenterDisp = dispinterface;
  IEnumAgentHandler = interface;
  ITAgentHandler = interface;
  ITAgentHandlerDisp = dispinterface;
  IEnumACDGroup = interface;
  ITAgentHandlerEvent = interface;
  ITAgentHandlerEventDisp = dispinterface;
  ITCallInfoChangeEvent = interface;
  ITRequestEvent = interface;
  ITMediaSupport = interface;
  ITMediaSupportDisp = dispinterface;
  ITTerminalSupport = interface;
  ITTerminalSupportDisp = dispinterface;
  IEnumTerminalClass = interface;
  ITTerminalSupport2 = interface;
  ITTerminalSupport2Disp = dispinterface;
  IEnumPluggableSuperclassInfo = interface;
  ITPluggableTerminalSuperclassInfo = interface;
  ITPluggableTerminalSuperclassInfoDisp = dispinterface;
  IEnumPluggableTerminalClassInfo = interface;
  ITPluggableTerminalClassInfo = interface;
  ITPluggableTerminalClassInfoDisp = dispinterface;
  ITStreamControl = interface;
  ITStreamControlDisp = dispinterface;
  IEnumStream = interface;
  ITSubStreamControl = interface;
  ITSubStreamControlDisp = dispinterface;
  ITSubStream = interface;
  ITSubStreamDisp = dispinterface;
  IEnumSubStream = interface;
  ITLegacyAddressMediaControl = interface;
  ITLegacyAddressMediaControl2 = interface;
  ITLegacyCallMediaControl = interface;
  ITLegacyCallMediaControlDisp = dispinterface;
  ITLegacyCallMediaControl2 = interface;
  ITLegacyCallMediaControl2Disp = dispinterface;
  ITDetectTone = interface;
  ITDetectToneDisp = dispinterface;
  ITCustomTone = interface;
  ITCustomToneDisp = dispinterface;
  ITDigitDetectionEvent = interface;
  ITDigitGenerationEvent = interface;
  ITDigitGenerationEventDisp = dispinterface;
  ITDigitsGatheredEvent = interface;
  ITDigitsGatheredEventDisp = dispinterface;
  ITToneDetectionEvent = interface;
  ITToneDetectionEventDisp = dispinterface;
  ITPrivateEvent = interface;
  ITPrivateEventDisp = dispinterface;
  ITAddress2 = interface;
  ITAddress2Disp = dispinterface;
  IEnumPhone = interface;
  ITTAPI2 = interface;
  ITTAPI2Disp = dispinterface;
  ITMultiTrackTerminal = interface;
  ITMultiTrackTerminalDisp = dispinterface;
  ITStaticAudioTerminal = interface;
  ITStaticAudioTerminalDisp = dispinterface;
  ITBasicCallControl2 = interface;
  ITBasicCallControl2Disp = dispinterface;
  ITAutomatedPhoneControl = interface;
  ITAutomatedPhoneControlDisp = dispinterface;
  ITMediaControl = interface;
  ITMediaControlDisp = dispinterface;
  ITFileTrack = interface;
  ITFileTrackDisp = dispinterface;
  ITScriptableAudioFormat = interface;
  ITScriptableAudioFormatDisp = dispinterface;
  ITCallInfo2 = interface;
  ITCallInfo2Disp = dispinterface;
  ITFileTerminalEvent = interface;
  ITToneTerminalEvent = interface;
  ITASRTerminalEvent = interface;
  ITTTSTerminalEvent = interface;
  ITPhoneEvent = interface;
  ITPhoneDeviceSpecificEvent = interface;
  ITLegacyWaveSupport = interface;
  ITLegacyWaveSupportDisp = dispinterface;
  ITTAPIDispatchEventNotification = dispinterface;
  ITDispatchMapper = interface;
  ITRequest = interface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  TAPI = ITTAPI;
  DispatchMapper = ITDispatchMapper;
  RequestMakeCall = ITRequest;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  wireHWND = ^_RemotableHandle; 
  POleVariant1 = ^OleVariant; {*}
  PByte1 = ^Byte; {*}
  PUserType1 = ^TAPI_DETECTTONE; {*}
  PUserType2 = ^TAPI_CUSTOMTONE; {*}
  PUserType3 = ^_AMMediaType; {*}


  __MIDL_IWinTypes_0009 = record
    case Integer of
      0: (hInproc: Integer);
      1: (hRemote: Integer);
  end;

  _RemotableHandle = packed record
    fContext: Integer;
    u: __MIDL_IWinTypes_0009;
  end;

  TAPI_DETECTTONE = packed record
    dwAppSpecific: LongWord;
    dwDuration: LongWord;
    dwFrequency1: LongWord;
    dwFrequency2: LongWord;
    dwFrequency3: LongWord;
  end;

  TAPI_CUSTOMTONE = packed record
    dwFrequency: LongWord;
    dwCadenceOn: LongWord;
    dwCadenceOff: LongWord;
    dwVolume: LongWord;
  end;

  _AMMediaType = packed record
    majortype: TGUID;
    subtype: TGUID;
    bFixedSizeSamples: Integer;
    bTemporalCompression: Integer;
    lSampleSize: LongWord;
    formattype: TGUID;
    pUnk: IUnknown;
    cbFormat: LongWord;
    pbFormat: ^Byte;
  end;


// *********************************************************************//
// Interface: ITCollection
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5EC5ACF2-9C02-11D0-8362-00AA003CCABD}
// *********************************************************************//
  ITCollection = interface(IDispatch)
    ['{5EC5ACF2-9C02-11D0-8362-00AA003CCABD}']
    function Get_Count: Integer; safecall;
    function Get_Item(Index: Integer): OleVariant; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property Item[Index: Integer]: OleVariant read Get_Item; default;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  ITCollectionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5EC5ACF2-9C02-11D0-8362-00AA003CCABD}
// *********************************************************************//
  ITCollectionDisp = dispinterface
    ['{5EC5ACF2-9C02-11D0-8362-00AA003CCABD}']
    property Count: Integer readonly dispid 1610743808;
    property Item[Index: Integer]: OleVariant readonly dispid 0; default;
    property _NewEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: ITMediaPlayback
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {627E8AE6-AE4C-4A69-BB63-2AD625404B77}
// *********************************************************************//
  ITMediaPlayback = interface(IDispatch)
    ['{627E8AE6-AE4C-4A69-BB63-2AD625404B77}']
    procedure Set_PlayList(pPlayListVariant: OleVariant); safecall;
    function Get_PlayList: OleVariant; safecall;
    property PlayList: OleVariant read Get_PlayList write Set_PlayList;
  end;

// *********************************************************************//
// DispIntf:  ITMediaPlaybackDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {627E8AE6-AE4C-4A69-BB63-2AD625404B77}
// *********************************************************************//
  ITMediaPlaybackDisp = dispinterface
    ['{627E8AE6-AE4C-4A69-BB63-2AD625404B77}']
    property PlayList: OleVariant dispid 262145;
  end;

// *********************************************************************//
// Interface: ITMediaRecord
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F5DD4592-5476-4CC1-9D4D-FAD3EEFE7DB2}
// *********************************************************************//
  ITMediaRecord = interface(IDispatch)
    ['{F5DD4592-5476-4CC1-9D4D-FAD3EEFE7DB2}']
    procedure Set_FileName(const pbstrFileName: WideString); safecall;
    function Get_FileName: WideString; safecall;
    property FileName: WideString read Get_FileName write Set_FileName;
  end;

// *********************************************************************//
// DispIntf:  ITMediaRecordDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F5DD4592-5476-4CC1-9D4D-FAD3EEFE7DB2}
// *********************************************************************//
  ITMediaRecordDisp = dispinterface
    ['{F5DD4592-5476-4CC1-9D4D-FAD3EEFE7DB2}']
    property FileName: WideString dispid 196609;
  end;

// *********************************************************************//
// Interface: ITCollection2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E6DDDDA5-A6D3-48FF-8737-D32FC4D95477}
// *********************************************************************//
  ITCollection2 = interface(ITCollection)
    ['{E6DDDDA5-A6D3-48FF-8737-D32FC4D95477}']
    procedure Add(Index: Integer; var pVariant: OleVariant); safecall;
    procedure Remove(Index: Integer); safecall;
  end;

// *********************************************************************//
// DispIntf:  ITCollection2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E6DDDDA5-A6D3-48FF-8737-D32FC4D95477}
// *********************************************************************//
  ITCollection2Disp = dispinterface
    ['{E6DDDDA5-A6D3-48FF-8737-D32FC4D95477}']
    procedure Add(Index: Integer; var pVariant: OleVariant); dispid 1;
    procedure Remove(Index: Integer); dispid 2;
    property Count: Integer readonly dispid 1610743808;
    property Item[Index: Integer]: OleVariant readonly dispid 0; default;
    property _NewEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: ITCallStateEvent
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {62F47097-95C9-11D0-835D-00AA003CCABD}
// *********************************************************************//
  ITCallStateEvent = interface(IDispatch)
    ['{62F47097-95C9-11D0-835D-00AA003CCABD}']
    function Get_Call: ITCallInfo; safecall;
    function Get_State: CALL_STATE; safecall;
    function Get_Cause: CALL_STATE_EVENT_CAUSE; safecall;
    function Get_CallbackInstance: Integer; safecall;
    property Call: ITCallInfo read Get_Call;
    property State: CALL_STATE read Get_State;
    property Cause: CALL_STATE_EVENT_CAUSE read Get_Cause;
    property CallbackInstance: Integer read Get_CallbackInstance;
  end;

// *********************************************************************//
// DispIntf:  ITCallStateEventDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {62F47097-95C9-11D0-835D-00AA003CCABD}
// *********************************************************************//
  ITCallStateEventDisp = dispinterface
    ['{62F47097-95C9-11D0-835D-00AA003CCABD}']
    property Call: ITCallInfo readonly dispid 1;
    property State: CALL_STATE readonly dispid 2;
    property Cause: CALL_STATE_EVENT_CAUSE readonly dispid 3;
    property CallbackInstance: Integer readonly dispid 4;
  end;

// *********************************************************************//
// Interface: ITCallInfo
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {350F85D1-1227-11D3-83D4-00C04FB6809F}
// *********************************************************************//
  ITCallInfo = interface(IDispatch)
    ['{350F85D1-1227-11D3-83D4-00C04FB6809F}']
    function Get_Address: ITAddress; safecall;
    function Get_CallState: CALL_STATE; safecall;
    function Get_Privilege: CALL_PRIVILEGE; safecall;
    function Get_CallHub: ITCallHub; safecall;
    function Get_CallInfoLong(CallInfoLong: CALLINFO_LONG): Integer; safecall;
    procedure Set_CallInfoLong(CallInfoLong: CALLINFO_LONG; plCallInfoLongVal: Integer); safecall;
    function Get_CallInfoString(CallInfoString: CALLINFO_STRING): WideString; safecall;
    procedure Set_CallInfoString(CallInfoString: CALLINFO_STRING; const ppCallInfoString: WideString); safecall;
    function Get_CallInfoBuffer(CallInfoBuffer: CALLINFO_BUFFER): OleVariant; safecall;
    procedure Set_CallInfoBuffer(CallInfoBuffer: CALLINFO_BUFFER; ppCallInfoBuffer: OleVariant); safecall;
    procedure GetCallInfoBuffer(CallInfoBuffer: CALLINFO_BUFFER; out pdwSize: LongWord; 
                                out ppCallInfoBuffer: PByte1); safecall;
    procedure SetCallInfoBuffer(CallInfoBuffer: CALLINFO_BUFFER; dwSize: LongWord; 
                                var pCallInfoBuffer: Byte); safecall;
    procedure ReleaseUserUserInfo; safecall;
    property Address: ITAddress read Get_Address;
    property CallState: CALL_STATE read Get_CallState;
    property Privilege: CALL_PRIVILEGE read Get_Privilege;
    property CallHub: ITCallHub read Get_CallHub;
    property CallInfoLong[CallInfoLong: CALLINFO_LONG]: Integer read Get_CallInfoLong write Set_CallInfoLong;
    property CallInfoString[CallInfoString: CALLINFO_STRING]: WideString read Get_CallInfoString write Set_CallInfoString;
    property CallInfoBuffer[CallInfoBuffer: CALLINFO_BUFFER]: OleVariant read Get_CallInfoBuffer write Set_CallInfoBuffer;
  end;

// *********************************************************************//
// DispIntf:  ITCallInfoDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {350F85D1-1227-11D3-83D4-00C04FB6809F}
// *********************************************************************//
  ITCallInfoDisp = dispinterface
    ['{350F85D1-1227-11D3-83D4-00C04FB6809F}']
    property Address: ITAddress readonly dispid 65537;
    property CallState: CALL_STATE readonly dispid 65538;
    property Privilege: CALL_PRIVILEGE readonly dispid 65539;
    property CallHub: ITCallHub readonly dispid 65540;
    property CallInfoLong[CallInfoLong: CALLINFO_LONG]: Integer dispid 65541;
    property CallInfoString[CallInfoString: CALLINFO_STRING]: WideString dispid 65542;
    property CallInfoBuffer[CallInfoBuffer: CALLINFO_BUFFER]: OleVariant dispid 65543;
    procedure GetCallInfoBuffer(CallInfoBuffer: CALLINFO_BUFFER; out pdwSize: LongWord; 
                                out ppCallInfoBuffer: {??PByte1}OleVariant); dispid 65544;
    procedure SetCallInfoBuffer(CallInfoBuffer: CALLINFO_BUFFER; dwSize: LongWord; 
                                var pCallInfoBuffer: Byte); dispid 65545;
    procedure ReleaseUserUserInfo; dispid 65546;
  end;

// *********************************************************************//
// Interface: ITAddress
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B1EFC386-9355-11D0-835C-00AA003CCABD}
// *********************************************************************//
  ITAddress = interface(IDispatch)
    ['{B1EFC386-9355-11D0-835C-00AA003CCABD}']
    function Get_State: ADDRESS_STATE; safecall;
    function Get_AddressName: WideString; safecall;
    function Get_ServiceProviderName: WideString; safecall;
    function Get_TAPIObject: ITTAPI; safecall;
    function CreateCall(const pDestAddress: WideString; lAddressType: Integer; lMediaTypes: Integer): ITBasicCallControl; safecall;
    function Get_Calls: OleVariant; safecall;
    function EnumerateCalls: IEnumCall; safecall;
    function Get_DialableAddress: WideString; safecall;
    function CreateForwardInfoObject: ITForwardInformation; safecall;
    procedure Forward(const pForwardInfo: ITForwardInformation; const pCall: ITBasicCallControl); safecall;
    function Get_CurrentForwardInfo: ITForwardInformation; safecall;
    procedure Set_MessageWaiting(pfMessageWaiting: WordBool); safecall;
    function Get_MessageWaiting: WordBool; safecall;
    procedure Set_DoNotDisturb(pfDoNotDisturb: WordBool); safecall;
    function Get_DoNotDisturb: WordBool; safecall;
    property State: ADDRESS_STATE read Get_State;
    property AddressName: WideString read Get_AddressName;
    property ServiceProviderName: WideString read Get_ServiceProviderName;
    property TAPIObject: ITTAPI read Get_TAPIObject;
    property Calls: OleVariant read Get_Calls;
    property DialableAddress: WideString read Get_DialableAddress;
    property CurrentForwardInfo: ITForwardInformation read Get_CurrentForwardInfo;
    property MessageWaiting: WordBool read Get_MessageWaiting write Set_MessageWaiting;
    property DoNotDisturb: WordBool read Get_DoNotDisturb write Set_DoNotDisturb;
  end;

// *********************************************************************//
// DispIntf:  ITAddressDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B1EFC386-9355-11D0-835C-00AA003CCABD}
// *********************************************************************//
  ITAddressDisp = dispinterface
    ['{B1EFC386-9355-11D0-835C-00AA003CCABD}']
    property State: ADDRESS_STATE readonly dispid 65537;
    property AddressName: WideString readonly dispid 65538;
    property ServiceProviderName: WideString readonly dispid 65539;
    property TAPIObject: ITTAPI readonly dispid 65540;
    function CreateCall(const pDestAddress: WideString; lAddressType: Integer; lMediaTypes: Integer): ITBasicCallControl; dispid 65541;
    property Calls: OleVariant readonly dispid 65542;
    function EnumerateCalls: IEnumCall; dispid 65543;
    property DialableAddress: WideString readonly dispid 65544;
    function CreateForwardInfoObject: ITForwardInformation; dispid 65546;
    procedure Forward(const pForwardInfo: ITForwardInformation; const pCall: ITBasicCallControl); dispid 65547;
    property CurrentForwardInfo: ITForwardInformation readonly dispid 65548;
    property MessageWaiting: WordBool dispid 65550;
    property DoNotDisturb: WordBool dispid 65551;
  end;

// *********************************************************************//
// Interface: ITTAPI
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B1EFC382-9355-11D0-835C-00AA003CCABD}
// *********************************************************************//
  ITTAPI = interface(IDispatch)
    ['{B1EFC382-9355-11D0-835C-00AA003CCABD}']
    procedure Initialize; safecall;
    procedure Shutdown; safecall;
    function Get_Addresses: OleVariant; safecall;
    function EnumerateAddresses: IEnumAddress; safecall;
    function RegisterCallNotifications(const pAddress: ITAddress; fMonitor: WordBool; 
                                       fOwner: WordBool; lMediaTypes: Integer; 
                                       lCallbackInstance: Integer): Integer; safecall;
    procedure UnregisterNotifications(lRegister: Integer); safecall;
    function Get_CallHubs: OleVariant; safecall;
    function EnumerateCallHubs: IEnumCallHub; safecall;
    procedure SetCallHubTracking(pAddresses: OleVariant; bTracking: WordBool); safecall;
    procedure EnumeratePrivateTAPIObjects(out ppEnumUnknown: IEnumUnknown); safecall;
    function Get_PrivateTAPIObjects: OleVariant; safecall;
    procedure RegisterRequestRecipient(lRegistrationInstance: Integer; lRequestMode: Integer; 
                                       fEnable: WordBool); safecall;
    procedure SetAssistedTelephonyPriority(const pAppFilename: WideString; fPriority: WordBool); safecall;
    procedure SetApplicationPriority(const pAppFilename: WideString; lMediaType: Integer; 
                                     fPriority: WordBool); safecall;
    procedure Set_EventFilter(plFilterMask: Integer); safecall;
    function Get_EventFilter: Integer; safecall;
    property Addresses: OleVariant read Get_Addresses;
    property CallHubs: OleVariant read Get_CallHubs;
    property PrivateTAPIObjects: OleVariant read Get_PrivateTAPIObjects;
    property EventFilter: Integer read Get_EventFilter write Set_EventFilter;
  end;

// *********************************************************************//
// DispIntf:  ITTAPIDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B1EFC382-9355-11D0-835C-00AA003CCABD}
// *********************************************************************//
  ITTAPIDisp = dispinterface
    ['{B1EFC382-9355-11D0-835C-00AA003CCABD}']
    procedure Initialize; dispid 65549;
    procedure Shutdown; dispid 65550;
    property Addresses: OleVariant readonly dispid 65537;
    function EnumerateAddresses: IEnumAddress; dispid 65538;
    function RegisterCallNotifications(const pAddress: ITAddress; fMonitor: WordBool; 
                                       fOwner: WordBool; lMediaTypes: Integer; 
                                       lCallbackInstance: Integer): Integer; dispid 65539;
    procedure UnregisterNotifications(lRegister: Integer); dispid 65540;
    property CallHubs: OleVariant readonly dispid 65541;
    function EnumerateCallHubs: IEnumCallHub; dispid 65542;
    procedure SetCallHubTracking(pAddresses: OleVariant; bTracking: WordBool); dispid 65543;
    procedure EnumeratePrivateTAPIObjects(out ppEnumUnknown: IEnumUnknown); dispid 65544;
    property PrivateTAPIObjects: OleVariant readonly dispid 65545;
    procedure RegisterRequestRecipient(lRegistrationInstance: Integer; lRequestMode: Integer; 
                                       fEnable: WordBool); dispid 65546;
    procedure SetAssistedTelephonyPriority(const pAppFilename: WideString; fPriority: WordBool); dispid 65547;
    procedure SetApplicationPriority(const pAppFilename: WideString; lMediaType: Integer; 
                                     fPriority: WordBool); dispid 65548;
    property EventFilter: Integer dispid 65551;
  end;

// *********************************************************************//
// Interface: IEnumAddress
// Flags:     (16) Hidden
// GUID:      {1666FCA1-9363-11D0-835C-00AA003CCABD}
// *********************************************************************//
  IEnumAddress = interface(IUnknown)
    ['{1666FCA1-9363-11D0-835C-00AA003CCABD}']
    function Next(celt: LongWord; out ppElements: ITAddress; var pceltFetched: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
    function Clone(out ppEnum: IEnumAddress): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IEnumCallHub
// Flags:     (16) Hidden
// GUID:      {A3C15450-5B92-11D1-8F4E-00C04FB6809F}
// *********************************************************************//
  IEnumCallHub = interface(IUnknown)
    ['{A3C15450-5B92-11D1-8F4E-00C04FB6809F}']
    function Next(celt: LongWord; out ppElements: ITCallHub; var pceltFetched: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
    function Clone(out ppEnum: IEnumCallHub): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITCallHub
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A3C1544E-5B92-11D1-8F4E-00C04FB6809F}
// *********************************************************************//
  ITCallHub = interface(IDispatch)
    ['{A3C1544E-5B92-11D1-8F4E-00C04FB6809F}']
    procedure Clear; safecall;
    function EnumerateCalls: IEnumCall; safecall;
    function Get_Calls: OleVariant; safecall;
    function Get_NumCalls: Integer; safecall;
    function Get_State: CALLHUB_STATE; safecall;
    property Calls: OleVariant read Get_Calls;
    property NumCalls: Integer read Get_NumCalls;
    property State: CALLHUB_STATE read Get_State;
  end;

// *********************************************************************//
// DispIntf:  ITCallHubDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A3C1544E-5B92-11D1-8F4E-00C04FB6809F}
// *********************************************************************//
  ITCallHubDisp = dispinterface
    ['{A3C1544E-5B92-11D1-8F4E-00C04FB6809F}']
    procedure Clear; dispid 1;
    function EnumerateCalls: IEnumCall; dispid 2;
    property Calls: OleVariant readonly dispid 3;
    property NumCalls: Integer readonly dispid 4;
    property State: CALLHUB_STATE readonly dispid 5;
  end;

// *********************************************************************//
// Interface: IEnumCall
// Flags:     (16) Hidden
// GUID:      {AE269CF6-935E-11D0-835C-00AA003CCABD}
// *********************************************************************//
  IEnumCall = interface(IUnknown)
    ['{AE269CF6-935E-11D0-835C-00AA003CCABD}']
    function Next(celt: LongWord; out ppElements: ITCallInfo; var pceltFetched: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
    function Clone(out ppEnum: IEnumCall): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IEnumUnknown
// Flags:     (0)
// GUID:      {00000100-0000-0000-C000-000000000046}
// *********************************************************************//
  IEnumUnknown = interface(IUnknown)
    ['{00000100-0000-0000-C000-000000000046}']
    function RemoteNext(celt: LongWord; out rgelt: IUnknown; out pceltFetched: LongWord): HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Clone(out ppEnum: IEnumUnknown): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITBasicCallControl
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B1EFC389-9355-11D0-835C-00AA003CCABD}
// *********************************************************************//
  ITBasicCallControl = interface(IDispatch)
    ['{B1EFC389-9355-11D0-835C-00AA003CCABD}']
    procedure Connect(fSync: WordBool); safecall;
    procedure Answer; safecall;
    procedure Disconnect(code: DISCONNECT_CODE); safecall;
    procedure Hold(fHold: WordBool); safecall;
    procedure HandoffDirect(const pApplicationName: WideString); safecall;
    procedure HandoffIndirect(lMediaType: Integer); safecall;
    procedure Conference(const pCall: ITBasicCallControl; fSync: WordBool); safecall;
    procedure Transfer(const pCall: ITBasicCallControl; fSync: WordBool); safecall;
    procedure BlindTransfer(const pDestAddress: WideString); safecall;
    procedure SwapHold(const pCall: ITBasicCallControl); safecall;
    procedure ParkDirect(const pParkAddress: WideString); safecall;
    function ParkIndirect: WideString; safecall;
    procedure Unpark; safecall;
    procedure SetQOS(lMediaType: Integer; ServiceLevel: QOS_SERVICE_LEVEL); safecall;
    procedure Pickup(const pGroupID: WideString); safecall;
    procedure Dial(const pDestAddress: WideString); safecall;
    procedure Finish(finishMode: FINISH_MODE); safecall;
    procedure RemoveFromConference; safecall;
  end;

// *********************************************************************//
// DispIntf:  ITBasicCallControlDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B1EFC389-9355-11D0-835C-00AA003CCABD}
// *********************************************************************//
  ITBasicCallControlDisp = dispinterface
    ['{B1EFC389-9355-11D0-835C-00AA003CCABD}']
    procedure Connect(fSync: WordBool); dispid 131075;
    procedure Answer; dispid 131076;
    procedure Disconnect(code: DISCONNECT_CODE); dispid 131077;
    procedure Hold(fHold: WordBool); dispid 131078;
    procedure HandoffDirect(const pApplicationName: WideString); dispid 131079;
    procedure HandoffIndirect(lMediaType: Integer); dispid 131080;
    procedure Conference(const pCall: ITBasicCallControl; fSync: WordBool); dispid 131081;
    procedure Transfer(const pCall: ITBasicCallControl; fSync: WordBool); dispid 131082;
    procedure BlindTransfer(const pDestAddress: WideString); dispid 131083;
    procedure SwapHold(const pCall: ITBasicCallControl); dispid 131084;
    procedure ParkDirect(const pParkAddress: WideString); dispid 131085;
    function ParkIndirect: WideString; dispid 131086;
    procedure Unpark; dispid 131087;
    procedure SetQOS(lMediaType: Integer; ServiceLevel: QOS_SERVICE_LEVEL); dispid 131088;
    procedure Pickup(const pGroupID: WideString); dispid 131091;
    procedure Dial(const pDestAddress: WideString); dispid 131092;
    procedure Finish(finishMode: FINISH_MODE); dispid 131093;
    procedure RemoveFromConference; dispid 131094;
  end;

// *********************************************************************//
// Interface: ITForwardInformation
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {449F659E-88A3-11D1-BB5D-00C04FB6809F}
// *********************************************************************//
  ITForwardInformation = interface(IDispatch)
    ['{449F659E-88A3-11D1-BB5D-00C04FB6809F}']
    procedure Set_NumRingsNoAnswer(plNumRings: Integer); safecall;
    function Get_NumRingsNoAnswer: Integer; safecall;
    procedure SetForwardType(ForwardType: Integer; const pDestAddress: WideString; 
                             const pCallerAddress: WideString); safecall;
    function Get_ForwardTypeDestination(ForwardType: Integer): WideString; safecall;
    function Get_ForwardTypeCaller(ForwardType: Integer): WideString; safecall;
    procedure GetForwardType(ForwardType: Integer; out ppDestinationAddress: WideString; 
                             out ppCallerAddress: WideString); safecall;
    procedure Clear; safecall;
    property NumRingsNoAnswer: Integer read Get_NumRingsNoAnswer write Set_NumRingsNoAnswer;
    property ForwardTypeDestination[ForwardType: Integer]: WideString read Get_ForwardTypeDestination;
    property ForwardTypeCaller[ForwardType: Integer]: WideString read Get_ForwardTypeCaller;
  end;

// *********************************************************************//
// DispIntf:  ITForwardInformationDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {449F659E-88A3-11D1-BB5D-00C04FB6809F}
// *********************************************************************//
  ITForwardInformationDisp = dispinterface
    ['{449F659E-88A3-11D1-BB5D-00C04FB6809F}']
    property NumRingsNoAnswer: Integer dispid 1;
    procedure SetForwardType(ForwardType: Integer; const pDestAddress: WideString; 
                             const pCallerAddress: WideString); dispid 2;
    property ForwardTypeDestination[ForwardType: Integer]: WideString readonly dispid 3;
    property ForwardTypeCaller[ForwardType: Integer]: WideString readonly dispid 4;
    procedure GetForwardType(ForwardType: Integer; out ppDestinationAddress: WideString; 
                             out ppCallerAddress: WideString); dispid 5;
    procedure Clear; dispid 6;
  end;

// *********************************************************************//
// Interface: ITCallNotificationEvent
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {895801DF-3DD6-11D1-8F30-00C04FB6809F}
// *********************************************************************//
  ITCallNotificationEvent = interface(IDispatch)
    ['{895801DF-3DD6-11D1-8F30-00C04FB6809F}']
    function Get_Call: ITCallInfo; safecall;
    function Get_Event: CALL_NOTIFICATION_EVENT; safecall;
    function Get_CallbackInstance: Integer; safecall;
    property Call: ITCallInfo read Get_Call;
    property Event: CALL_NOTIFICATION_EVENT read Get_Event;
    property CallbackInstance: Integer read Get_CallbackInstance;
  end;

// *********************************************************************//
// DispIntf:  ITCallNotificationEventDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {895801DF-3DD6-11D1-8F30-00C04FB6809F}
// *********************************************************************//
  ITCallNotificationEventDisp = dispinterface
    ['{895801DF-3DD6-11D1-8F30-00C04FB6809F}']
    property Call: ITCallInfo readonly dispid 1;
    property Event: CALL_NOTIFICATION_EVENT readonly dispid 2;
    property CallbackInstance: Integer readonly dispid 3;
  end;

// *********************************************************************//
// Interface: ITTAPIEventNotification
// Flags:     (256) OleAutomation
// GUID:      {EDDB9426-3B91-11D1-8F30-00C04FB6809F}
// *********************************************************************//
  ITTAPIEventNotification = interface(IUnknown)
    ['{EDDB9426-3B91-11D1-8F30-00C04FB6809F}']
    function Event(TapiEvent: TAPI_EVENT; const pEvent: IDispatch): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITBasicAudioTerminal
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B1EFC38D-9355-11D0-835C-00AA003CCABD}
// *********************************************************************//
  ITBasicAudioTerminal = interface(IDispatch)
    ['{B1EFC38D-9355-11D0-835C-00AA003CCABD}']
    procedure Set_Volume(plVolume: Integer); safecall;
    function Get_Volume: Integer; safecall;
    procedure Set_Balance(plBalance: Integer); safecall;
    function Get_Balance: Integer; safecall;
    property Volume: Integer read Get_Volume write Set_Volume;
    property Balance: Integer read Get_Balance write Set_Balance;
  end;

// *********************************************************************//
// DispIntf:  ITBasicAudioTerminalDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B1EFC38D-9355-11D0-835C-00AA003CCABD}
// *********************************************************************//
  ITBasicAudioTerminalDisp = dispinterface
    ['{B1EFC38D-9355-11D0-835C-00AA003CCABD}']
    property Volume: Integer dispid 1;
    property Balance: Integer dispid 2;
  end;

// *********************************************************************//
// Interface: ITCallHubEvent
// Flags:     (4352) OleAutomation Dispatchable
// GUID:      {A3C15451-5B92-11D1-8F4E-00C04FB6809F}
// *********************************************************************//
  ITCallHubEvent = interface(IDispatch)
    ['{A3C15451-5B92-11D1-8F4E-00C04FB6809F}']
    function Get_Event(out pEvent: CALLHUB_EVENT): HResult; stdcall;
    function Get_CallHub(out ppCallHub: ITCallHub): HResult; stdcall;
    function Get_Call(out ppCall: ITCallInfo): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITForwardInformation2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5229B4ED-B260-4382-8E1A-5DF3A8A4CCC0}
// *********************************************************************//
  ITForwardInformation2 = interface(ITForwardInformation)
    ['{5229B4ED-B260-4382-8E1A-5DF3A8A4CCC0}']
    procedure SetForwardType2(ForwardType: Integer; const pDestAddress: WideString; 
                              DestAddressType: Integer; const pCallerAddress: WideString; 
                              CallerAddressType: Integer); safecall;
    procedure GetForwardType2(ForwardType: Integer; out ppDestinationAddress: WideString; 
                              out pDestAddressType: Integer; out ppCallerAddress: WideString; 
                              out pCallerAddressType: Integer); safecall;
    function Get_ForwardTypeDestinationAddressType(ForwardType: Integer): Integer; safecall;
    function Get_ForwardTypeCallerAddressType(ForwardType: Integer): Integer; safecall;
    property ForwardTypeDestinationAddressType[ForwardType: Integer]: Integer read Get_ForwardTypeDestinationAddressType;
    property ForwardTypeCallerAddressType[ForwardType: Integer]: Integer read Get_ForwardTypeCallerAddressType;
  end;

// *********************************************************************//
// DispIntf:  ITForwardInformation2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5229B4ED-B260-4382-8E1A-5DF3A8A4CCC0}
// *********************************************************************//
  ITForwardInformation2Disp = dispinterface
    ['{5229B4ED-B260-4382-8E1A-5DF3A8A4CCC0}']
    procedure SetForwardType2(ForwardType: Integer; const pDestAddress: WideString; 
                              DestAddressType: Integer; const pCallerAddress: WideString; 
                              CallerAddressType: Integer); dispid 7;
    procedure GetForwardType2(ForwardType: Integer; out ppDestinationAddress: WideString; 
                              out pDestAddressType: Integer; out ppCallerAddress: WideString; 
                              out pCallerAddressType: Integer); dispid 8;
    property ForwardTypeDestinationAddressType[ForwardType: Integer]: Integer readonly dispid 9;
    property ForwardTypeCallerAddressType[ForwardType: Integer]: Integer readonly dispid 10;
    property NumRingsNoAnswer: Integer dispid 1;
    procedure SetForwardType(ForwardType: Integer; const pDestAddress: WideString; 
                             const pCallerAddress: WideString); dispid 2;
    property ForwardTypeDestination[ForwardType: Integer]: WideString readonly dispid 3;
    property ForwardTypeCaller[ForwardType: Integer]: WideString readonly dispid 4;
    procedure GetForwardType(ForwardType: Integer; out ppDestinationAddress: WideString; 
                             out ppCallerAddress: WideString); dispid 5;
    procedure Clear; dispid 6;
  end;

// *********************************************************************//
// Interface: ITAddressCapabilities
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8DF232F5-821B-11D1-BB5C-00C04FB6809F}
// *********************************************************************//
  ITAddressCapabilities = interface(IDispatch)
    ['{8DF232F5-821B-11D1-BB5C-00C04FB6809F}']
    function Get_AddressCapability(AddressCap: ADDRESS_CAPABILITY): Integer; safecall;
    function Get_AddressCapabilityString(AddressCapString: ADDRESS_CAPABILITY_STRING): WideString; safecall;
    function Get_CallTreatments: OleVariant; safecall;
    function EnumerateCallTreatments: IEnumBstr; safecall;
    function Get_CompletionMessages: OleVariant; safecall;
    function EnumerateCompletionMessages: IEnumBstr; safecall;
    function Get_DeviceClasses: OleVariant; safecall;
    function EnumerateDeviceClasses: IEnumBstr; safecall;
    property AddressCapability[AddressCap: ADDRESS_CAPABILITY]: Integer read Get_AddressCapability;
    property AddressCapabilityString[AddressCapString: ADDRESS_CAPABILITY_STRING]: WideString read Get_AddressCapabilityString;
    property CallTreatments: OleVariant read Get_CallTreatments;
    property CompletionMessages: OleVariant read Get_CompletionMessages;
    property DeviceClasses: OleVariant read Get_DeviceClasses;
  end;

// *********************************************************************//
// DispIntf:  ITAddressCapabilitiesDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8DF232F5-821B-11D1-BB5C-00C04FB6809F}
// *********************************************************************//
  ITAddressCapabilitiesDisp = dispinterface
    ['{8DF232F5-821B-11D1-BB5C-00C04FB6809F}']
    property AddressCapability[AddressCap: ADDRESS_CAPABILITY]: Integer readonly dispid 131073;
    property AddressCapabilityString[AddressCapString: ADDRESS_CAPABILITY_STRING]: WideString readonly dispid 131074;
    property CallTreatments: OleVariant readonly dispid 131075;
    function EnumerateCallTreatments: IEnumBstr; dispid 131076;
    property CompletionMessages: OleVariant readonly dispid 131077;
    function EnumerateCompletionMessages: IEnumBstr; dispid 131078;
    property DeviceClasses: OleVariant readonly dispid 131079;
    function EnumerateDeviceClasses: IEnumBstr; dispid 131080;
  end;

// *********************************************************************//
// Interface: IEnumBstr
// Flags:     (16) Hidden
// GUID:      {35372049-0BC6-11D2-A033-00C04FB6809F}
// *********************************************************************//
  IEnumBstr = interface(IUnknown)
    ['{35372049-0BC6-11D2-A033-00C04FB6809F}']
    function Next(celt: LongWord; out ppStrings: WideString; var pceltFetched: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
    function Clone(out ppEnum: IEnumBstr): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITQOSEvent
// Flags:     (4352) OleAutomation Dispatchable
// GUID:      {CFA3357C-AD77-11D1-BB68-00C04FB6809F}
// *********************************************************************//
  ITQOSEvent = interface(IDispatch)
    ['{CFA3357C-AD77-11D1-BB68-00C04FB6809F}']
    function Get_Call(out ppCall: ITCallInfo): HResult; stdcall;
    function Get_Event(out pQosEvent: QOS_EVENT): HResult; stdcall;
    function Get_MediaType(out plMediaType: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITAddressEvent
// Flags:     (4352) OleAutomation Dispatchable
// GUID:      {831CE2D1-83B5-11D1-BB5C-00C04FB6809F}
// *********************************************************************//
  ITAddressEvent = interface(IDispatch)
    ['{831CE2D1-83B5-11D1-BB5C-00C04FB6809F}']
    function Get_Address(out ppAddress: ITAddress): HResult; stdcall;
    function Get_Event(out pEvent: ADDRESS_EVENT): HResult; stdcall;
    function Get_Terminal(out ppTerminal: ITTerminal): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITTerminal
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B1EFC38A-9355-11D0-835C-00AA003CCABD}
// *********************************************************************//
  ITTerminal = interface(IDispatch)
    ['{B1EFC38A-9355-11D0-835C-00AA003CCABD}']
    function Get_Name: WideString; safecall;
    function Get_State: TERMINAL_STATE; safecall;
    function Get_TerminalType: TERMINAL_TYPE; safecall;
    function Get_TerminalClass: WideString; safecall;
    function Get_MediaType: Integer; safecall;
    function Get_Direction: TERMINAL_DIRECTION; safecall;
    property Name: WideString read Get_Name;
    property State: TERMINAL_STATE read Get_State;
    property TerminalType: TERMINAL_TYPE read Get_TerminalType;
    property TerminalClass: WideString read Get_TerminalClass;
    property MediaType: Integer read Get_MediaType;
    property Direction: TERMINAL_DIRECTION read Get_Direction;
  end;

// *********************************************************************//
// DispIntf:  ITTerminalDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B1EFC38A-9355-11D0-835C-00AA003CCABD}
// *********************************************************************//
  ITTerminalDisp = dispinterface
    ['{B1EFC38A-9355-11D0-835C-00AA003CCABD}']
    property Name: WideString readonly dispid 1;
    property State: TERMINAL_STATE readonly dispid 2;
    property TerminalType: TERMINAL_TYPE readonly dispid 3;
    property TerminalClass: WideString readonly dispid 4;
    property MediaType: Integer readonly dispid 5;
    property Direction: TERMINAL_DIRECTION readonly dispid 6;
  end;

// *********************************************************************//
// Interface: ITAddressDeviceSpecificEvent
// Flags:     (4352) OleAutomation Dispatchable
// GUID:      {3ACB216B-40BD-487A-8672-5CE77BD7E3A3}
// *********************************************************************//
  ITAddressDeviceSpecificEvent = interface(IDispatch)
    ['{3ACB216B-40BD-487A-8672-5CE77BD7E3A3}']
    function Get_Address(out ppAddress: ITAddress): HResult; stdcall;
    function Get_Call(out ppCall: ITCallInfo): HResult; stdcall;
    function Get_lParam1(out pParam1: Integer): HResult; stdcall;
    function Get_lParam2(out pParam2: Integer): HResult; stdcall;
    function Get_lParam3(out pParam3: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITCallMediaEvent
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FF36B87F-EC3A-11D0-8EE4-00C04FB6809F}
// *********************************************************************//
  ITCallMediaEvent = interface(IDispatch)
    ['{FF36B87F-EC3A-11D0-8EE4-00C04FB6809F}']
    function Get_Call: ITCallInfo; safecall;
    function Get_Event: CALL_MEDIA_EVENT; safecall;
    function Get_Error: HResult; safecall;
    function Get_Terminal: ITTerminal; safecall;
    function Get_Stream: ITStream; safecall;
    function Get_Cause: CALL_MEDIA_EVENT_CAUSE; safecall;
    property Call: ITCallInfo read Get_Call;
    property Event: CALL_MEDIA_EVENT read Get_Event;
    property Error: HResult read Get_Error;
    property Terminal: ITTerminal read Get_Terminal;
    property Stream: ITStream read Get_Stream;
    property Cause: CALL_MEDIA_EVENT_CAUSE read Get_Cause;
  end;

// *********************************************************************//
// DispIntf:  ITCallMediaEventDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FF36B87F-EC3A-11D0-8EE4-00C04FB6809F}
// *********************************************************************//
  ITCallMediaEventDisp = dispinterface
    ['{FF36B87F-EC3A-11D0-8EE4-00C04FB6809F}']
    property Call: ITCallInfo readonly dispid 1;
    property Event: CALL_MEDIA_EVENT readonly dispid 2;
    property Error: HResult readonly dispid 3;
    property Terminal: ITTerminal readonly dispid 4;
    property Stream: ITStream readonly dispid 5;
    property Cause: CALL_MEDIA_EVENT_CAUSE readonly dispid 6;
  end;

// *********************************************************************//
// Interface: ITStream
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EE3BD605-3868-11D2-A045-00C04FB6809F}
// *********************************************************************//
  ITStream = interface(IDispatch)
    ['{EE3BD605-3868-11D2-A045-00C04FB6809F}']
    function Get_MediaType: Integer; safecall;
    function Get_Direction: TERMINAL_DIRECTION; safecall;
    function Get_Name: WideString; safecall;
    procedure StartStream; safecall;
    procedure PauseStream; safecall;
    procedure StopStream; safecall;
    procedure SelectTerminal(const pTerminal: ITTerminal); safecall;
    procedure UnselectTerminal(const pTerminal: ITTerminal); safecall;
    procedure EnumerateTerminals(out ppEnumTerminal: IEnumTerminal); safecall;
    function Get_Terminals: OleVariant; safecall;
    property MediaType: Integer read Get_MediaType;
    property Direction: TERMINAL_DIRECTION read Get_Direction;
    property Name: WideString read Get_Name;
    property Terminals: OleVariant read Get_Terminals;
  end;

// *********************************************************************//
// DispIntf:  ITStreamDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EE3BD605-3868-11D2-A045-00C04FB6809F}
// *********************************************************************//
  ITStreamDisp = dispinterface
    ['{EE3BD605-3868-11D2-A045-00C04FB6809F}']
    property MediaType: Integer readonly dispid 1;
    property Direction: TERMINAL_DIRECTION readonly dispid 2;
    property Name: WideString readonly dispid 3;
    procedure StartStream; dispid 4;
    procedure PauseStream; dispid 5;
    procedure StopStream; dispid 6;
    procedure SelectTerminal(const pTerminal: ITTerminal); dispid 7;
    procedure UnselectTerminal(const pTerminal: ITTerminal); dispid 8;
    procedure EnumerateTerminals(out ppEnumTerminal: IEnumTerminal); dispid 9;
    property Terminals: OleVariant readonly dispid 10;
  end;

// *********************************************************************//
// Interface: IEnumTerminal
// Flags:     (16) Hidden
// GUID:      {AE269CF4-935E-11D0-835C-00AA003CCABD}
// *********************************************************************//
  IEnumTerminal = interface(IUnknown)
    ['{AE269CF4-935E-11D0-835C-00AA003CCABD}']
    function Next(celt: LongWord; out ppElements: ITTerminal; var pceltFetched: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
    function Clone(out ppEnum: IEnumTerminal): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITTAPIObjectEvent
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F4854D48-937A-11D1-BB58-00C04FB6809F}
// *********************************************************************//
  ITTAPIObjectEvent = interface(IDispatch)
    ['{F4854D48-937A-11D1-BB58-00C04FB6809F}']
    function Get_TAPIObject: ITTAPI; safecall;
    function Get_Event: TAPIOBJECT_EVENT; safecall;
    function Get_Address: ITAddress; safecall;
    function Get_CallbackInstance: Integer; safecall;
    property TAPIObject: ITTAPI read Get_TAPIObject;
    property Event: TAPIOBJECT_EVENT read Get_Event;
    property Address: ITAddress read Get_Address;
    property CallbackInstance: Integer read Get_CallbackInstance;
  end;

// *********************************************************************//
// DispIntf:  ITTAPIObjectEventDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F4854D48-937A-11D1-BB58-00C04FB6809F}
// *********************************************************************//
  ITTAPIObjectEventDisp = dispinterface
    ['{F4854D48-937A-11D1-BB58-00C04FB6809F}']
    property TAPIObject: ITTAPI readonly dispid 1;
    property Event: TAPIOBJECT_EVENT readonly dispid 2;
    property Address: ITAddress readonly dispid 3;
    property CallbackInstance: Integer readonly dispid 4;
  end;

// *********************************************************************//
// Interface: ITTAPIObjectEvent2
// Flags:     (4352) OleAutomation Dispatchable
// GUID:      {359DDA6E-68CE-4383-BF0B-169133C41B46}
// *********************************************************************//
  ITTAPIObjectEvent2 = interface(ITTAPIObjectEvent)
    ['{359DDA6E-68CE-4383-BF0B-169133C41B46}']
    function Get_Phone(out ppPhone: ITPhone): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITPhone
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {09D48DB4-10CC-4388-9DE7-A8465618975A}
// *********************************************************************//
  ITPhone = interface(IDispatch)
    ['{09D48DB4-10CC-4388-9DE7-A8465618975A}']
    procedure Open(Privilege: PHONE_PRIVILEGE); safecall;
    procedure Close; safecall;
    function Get_Addresses: OleVariant; safecall;
    function EnumerateAddresses: IEnumAddress; safecall;
    function Get_PhoneCapsLong(pclCap: PHONECAPS_LONG): Integer; safecall;
    function Get_PhoneCapsString(pcsCap: PHONECAPS_STRING): WideString; safecall;
    function Get_Terminals(const pAddress: ITAddress): OleVariant; safecall;
    function EnumerateTerminals(const pAddress: ITAddress): IEnumTerminal; safecall;
    function Get_ButtonMode(lButtonID: Integer): PHONE_BUTTON_MODE; safecall;
    procedure Set_ButtonMode(lButtonID: Integer; pButtonMode: PHONE_BUTTON_MODE); safecall;
    function Get_ButtonFunction(lButtonID: Integer): PHONE_BUTTON_FUNCTION; safecall;
    procedure Set_ButtonFunction(lButtonID: Integer; pButtonFunction: PHONE_BUTTON_FUNCTION); safecall;
    function Get_ButtonText(lButtonID: Integer): WideString; safecall;
    procedure Set_ButtonText(lButtonID: Integer; const ppButtonText: WideString); safecall;
    function Get_ButtonState(lButtonID: Integer): PHONE_BUTTON_STATE; safecall;
    function Get_HookSwitchState(HookSwitchDevice: PHONE_HOOK_SWITCH_DEVICE): PHONE_HOOK_SWITCH_STATE; safecall;
    procedure Set_HookSwitchState(HookSwitchDevice: PHONE_HOOK_SWITCH_DEVICE; 
                                  pHookSwitchState: PHONE_HOOK_SWITCH_STATE); safecall;
    procedure Set_RingMode(plRingMode: Integer); safecall;
    function Get_RingMode: Integer; safecall;
    procedure Set_RingVolume(plRingVolume: Integer); safecall;
    function Get_RingVolume: Integer; safecall;
    function Get_Privilege: PHONE_PRIVILEGE; safecall;
    procedure GetPhoneCapsBuffer(pcbCaps: PHONECAPS_BUFFER; out pdwSize: LongWord; 
                                 out ppPhoneCapsBuffer: PByte1); safecall;
    function Get_PhoneCapsBuffer(pcbCaps: PHONECAPS_BUFFER): OleVariant; safecall;
    function Get_LampMode(lLampID: Integer): PHONE_LAMP_MODE; safecall;
    procedure Set_LampMode(lLampID: Integer; pLampMode: PHONE_LAMP_MODE); safecall;
    function Get_Display: WideString; safecall;
    procedure SetDisplay(lRow: Integer; lColumn: Integer; const bstrDisplay: WideString); safecall;
    function Get_PreferredAddresses: OleVariant; safecall;
    function EnumeratePreferredAddresses: IEnumAddress; safecall;
    procedure DeviceSpecific(var pParams: Byte; dwSize: LongWord); safecall;
    procedure DeviceSpecificVariant(varDevSpecificByteArray: OleVariant); safecall;
    function NegotiateExtVersion(lLowVersion: Integer; lHighVersion: Integer): Integer; safecall;
    property Addresses: OleVariant read Get_Addresses;
    property PhoneCapsLong[pclCap: PHONECAPS_LONG]: Integer read Get_PhoneCapsLong;
    property PhoneCapsString[pcsCap: PHONECAPS_STRING]: WideString read Get_PhoneCapsString;
    property Terminals[const pAddress: ITAddress]: OleVariant read Get_Terminals;
    property ButtonMode[lButtonID: Integer]: PHONE_BUTTON_MODE read Get_ButtonMode write Set_ButtonMode;
    property ButtonFunction[lButtonID: Integer]: PHONE_BUTTON_FUNCTION read Get_ButtonFunction write Set_ButtonFunction;
    property ButtonText[lButtonID: Integer]: WideString read Get_ButtonText write Set_ButtonText;
    property ButtonState[lButtonID: Integer]: PHONE_BUTTON_STATE read Get_ButtonState;
    property HookSwitchState[HookSwitchDevice: PHONE_HOOK_SWITCH_DEVICE]: PHONE_HOOK_SWITCH_STATE read Get_HookSwitchState write Set_HookSwitchState;
    property RingMode: Integer read Get_RingMode write Set_RingMode;
    property RingVolume: Integer read Get_RingVolume write Set_RingVolume;
    property Privilege: PHONE_PRIVILEGE read Get_Privilege;
    property PhoneCapsBuffer[pcbCaps: PHONECAPS_BUFFER]: OleVariant read Get_PhoneCapsBuffer;
    property LampMode[lLampID: Integer]: PHONE_LAMP_MODE read Get_LampMode write Set_LampMode;
    property Display: WideString read Get_Display;
    property PreferredAddresses: OleVariant read Get_PreferredAddresses;
  end;

// *********************************************************************//
// DispIntf:  ITPhoneDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {09D48DB4-10CC-4388-9DE7-A8465618975A}
// *********************************************************************//
  ITPhoneDisp = dispinterface
    ['{09D48DB4-10CC-4388-9DE7-A8465618975A}']
    procedure Open(Privilege: PHONE_PRIVILEGE); dispid 65537;
    procedure Close; dispid 65538;
    property Addresses: OleVariant readonly dispid 65539;
    function EnumerateAddresses: IEnumAddress; dispid 65540;
    property PhoneCapsLong[pclCap: PHONECAPS_LONG]: Integer readonly dispid 65541;
    property PhoneCapsString[pcsCap: PHONECAPS_STRING]: WideString readonly dispid 65542;
    property Terminals[const pAddress: ITAddress]: OleVariant readonly dispid 65543;
    function EnumerateTerminals(const pAddress: ITAddress): IEnumTerminal; dispid 65544;
    property ButtonMode[lButtonID: Integer]: PHONE_BUTTON_MODE dispid 65545;
    property ButtonFunction[lButtonID: Integer]: PHONE_BUTTON_FUNCTION dispid 65546;
    property ButtonText[lButtonID: Integer]: WideString dispid 65547;
    property ButtonState[lButtonID: Integer]: PHONE_BUTTON_STATE readonly dispid 65548;
    property HookSwitchState[HookSwitchDevice: PHONE_HOOK_SWITCH_DEVICE]: PHONE_HOOK_SWITCH_STATE dispid 65549;
    property RingMode: Integer dispid 65550;
    property RingVolume: Integer dispid 65551;
    property Privilege: PHONE_PRIVILEGE readonly dispid 65552;
    procedure GetPhoneCapsBuffer(pcbCaps: PHONECAPS_BUFFER; out pdwSize: LongWord; 
                                 out ppPhoneCapsBuffer: {??PByte1}OleVariant); dispid 65553;
    property PhoneCapsBuffer[pcbCaps: PHONECAPS_BUFFER]: OleVariant readonly dispid 65554;
    property LampMode[lLampID: Integer]: PHONE_LAMP_MODE dispid 65555;
    property Display: WideString readonly dispid 65556;
    procedure SetDisplay(lRow: Integer; lColumn: Integer; const bstrDisplay: WideString); dispid 65557;
    property PreferredAddresses: OleVariant readonly dispid 65558;
    function EnumeratePreferredAddresses: IEnumAddress; dispid 65559;
    procedure DeviceSpecific(var pParams: Byte; dwSize: LongWord); dispid 65560;
    procedure DeviceSpecificVariant(varDevSpecificByteArray: OleVariant); dispid 65561;
    function NegotiateExtVersion(lLowVersion: Integer; lHighVersion: Integer): Integer; dispid 65562;
  end;

// *********************************************************************//
// Interface: ITAddressTranslation
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0C4D8F03-8DDB-11D1-A09E-00805FC147D3}
// *********************************************************************//
  ITAddressTranslation = interface(IDispatch)
    ['{0C4D8F03-8DDB-11D1-A09E-00805FC147D3}']
    function TranslateAddress(const pAddressToTranslate: WideString; lCard: Integer; 
                              lTranslateOptions: Integer): ITAddressTranslationInfo; safecall;
    procedure TranslateDialog(hwndOwner: Integer; const pAddressIn: WideString); safecall;
    function EnumerateLocations: IEnumLocation; safecall;
    function Get_Locations: OleVariant; safecall;
    function EnumerateCallingCards: IEnumCallingCard; safecall;
    function Get_CallingCards: OleVariant; safecall;
    property Locations: OleVariant read Get_Locations;
    property CallingCards: OleVariant read Get_CallingCards;
  end;

// *********************************************************************//
// DispIntf:  ITAddressTranslationDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0C4D8F03-8DDB-11D1-A09E-00805FC147D3}
// *********************************************************************//
  ITAddressTranslationDisp = dispinterface
    ['{0C4D8F03-8DDB-11D1-A09E-00805FC147D3}']
    function TranslateAddress(const pAddressToTranslate: WideString; lCard: Integer; 
                              lTranslateOptions: Integer): ITAddressTranslationInfo; dispid 262145;
    procedure TranslateDialog(hwndOwner: Integer; const pAddressIn: WideString); dispid 262146;
    function EnumerateLocations: IEnumLocation; dispid 262147;
    property Locations: OleVariant readonly dispid 262148;
    function EnumerateCallingCards: IEnumCallingCard; dispid 262149;
    property CallingCards: OleVariant readonly dispid 262150;
  end;

// *********************************************************************//
// Interface: ITAddressTranslationInfo
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {AFC15945-8D40-11D1-A09E-00805FC147D3}
// *********************************************************************//
  ITAddressTranslationInfo = interface(IDispatch)
    ['{AFC15945-8D40-11D1-A09E-00805FC147D3}']
    function Get_DialableString: WideString; safecall;
    function Get_DisplayableString: WideString; safecall;
    function Get_CurrentCountryCode: Integer; safecall;
    function Get_DestinationCountryCode: Integer; safecall;
    function Get_TranslationResults: Integer; safecall;
    property DialableString: WideString read Get_DialableString;
    property DisplayableString: WideString read Get_DisplayableString;
    property CurrentCountryCode: Integer read Get_CurrentCountryCode;
    property DestinationCountryCode: Integer read Get_DestinationCountryCode;
    property TranslationResults: Integer read Get_TranslationResults;
  end;

// *********************************************************************//
// DispIntf:  ITAddressTranslationInfoDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {AFC15945-8D40-11D1-A09E-00805FC147D3}
// *********************************************************************//
  ITAddressTranslationInfoDisp = dispinterface
    ['{AFC15945-8D40-11D1-A09E-00805FC147D3}']
    property DialableString: WideString readonly dispid 1;
    property DisplayableString: WideString readonly dispid 2;
    property CurrentCountryCode: Integer readonly dispid 3;
    property DestinationCountryCode: Integer readonly dispid 4;
    property TranslationResults: Integer readonly dispid 5;
  end;

// *********************************************************************//
// Interface: IEnumLocation
// Flags:     (16) Hidden
// GUID:      {0C4D8F01-8DDB-11D1-A09E-00805FC147D3}
// *********************************************************************//
  IEnumLocation = interface(IUnknown)
    ['{0C4D8F01-8DDB-11D1-A09E-00805FC147D3}']
    function Next(celt: LongWord; out ppElements: ITLocationInfo; var pceltFetched: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
    function Clone(out ppEnum: IEnumLocation): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITLocationInfo
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0C4D8EFF-8DDB-11D1-A09E-00805FC147D3}
// *********************************************************************//
  ITLocationInfo = interface(IDispatch)
    ['{0C4D8EFF-8DDB-11D1-A09E-00805FC147D3}']
    function Get_PermanentLocationID: Integer; safecall;
    function Get_CountryCode: Integer; safecall;
    function Get_CountryID: Integer; safecall;
    function Get_Options: Integer; safecall;
    function Get_PreferredCardID: Integer; safecall;
    function Get_LocationName: WideString; safecall;
    function Get_CityCode: WideString; safecall;
    function Get_LocalAccessCode: WideString; safecall;
    function Get_LongDistanceAccessCode: WideString; safecall;
    function Get_TollPrefixList: WideString; safecall;
    function Get_CancelCallWaitingCode: WideString; safecall;
    property PermanentLocationID: Integer read Get_PermanentLocationID;
    property CountryCode: Integer read Get_CountryCode;
    property CountryID: Integer read Get_CountryID;
    property Options: Integer read Get_Options;
    property PreferredCardID: Integer read Get_PreferredCardID;
    property LocationName: WideString read Get_LocationName;
    property CityCode: WideString read Get_CityCode;
    property LocalAccessCode: WideString read Get_LocalAccessCode;
    property LongDistanceAccessCode: WideString read Get_LongDistanceAccessCode;
    property TollPrefixList: WideString read Get_TollPrefixList;
    property CancelCallWaitingCode: WideString read Get_CancelCallWaitingCode;
  end;

// *********************************************************************//
// DispIntf:  ITLocationInfoDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0C4D8EFF-8DDB-11D1-A09E-00805FC147D3}
// *********************************************************************//
  ITLocationInfoDisp = dispinterface
    ['{0C4D8EFF-8DDB-11D1-A09E-00805FC147D3}']
    property PermanentLocationID: Integer readonly dispid 1;
    property CountryCode: Integer readonly dispid 2;
    property CountryID: Integer readonly dispid 3;
    property Options: Integer readonly dispid 4;
    property PreferredCardID: Integer readonly dispid 5;
    property LocationName: WideString readonly dispid 6;
    property CityCode: WideString readonly dispid 7;
    property LocalAccessCode: WideString readonly dispid 8;
    property LongDistanceAccessCode: WideString readonly dispid 9;
    property TollPrefixList: WideString readonly dispid 10;
    property CancelCallWaitingCode: WideString readonly dispid 11;
  end;

// *********************************************************************//
// Interface: IEnumCallingCard
// Flags:     (16) Hidden
// GUID:      {0C4D8F02-8DDB-11D1-A09E-00805FC147D3}
// *********************************************************************//
  IEnumCallingCard = interface(IUnknown)
    ['{0C4D8F02-8DDB-11D1-A09E-00805FC147D3}']
    function Next(celt: LongWord; out ppElements: ITCallingCard; var pceltFetched: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
    function Clone(out ppEnum: IEnumCallingCard): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITCallingCard
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0C4D8F00-8DDB-11D1-A09E-00805FC147D3}
// *********************************************************************//
  ITCallingCard = interface(IDispatch)
    ['{0C4D8F00-8DDB-11D1-A09E-00805FC147D3}']
    function Get_PermanentCardID: Integer; safecall;
    function Get_NumberOfDigits: Integer; safecall;
    function Get_Options: Integer; safecall;
    function Get_CardName: WideString; safecall;
    function Get_SameAreaDialingRule: WideString; safecall;
    function Get_LongDistanceDialingRule: WideString; safecall;
    function Get_InternationalDialingRule: WideString; safecall;
    property PermanentCardID: Integer read Get_PermanentCardID;
    property NumberOfDigits: Integer read Get_NumberOfDigits;
    property Options: Integer read Get_Options;
    property CardName: WideString read Get_CardName;
    property SameAreaDialingRule: WideString read Get_SameAreaDialingRule;
    property LongDistanceDialingRule: WideString read Get_LongDistanceDialingRule;
    property InternationalDialingRule: WideString read Get_InternationalDialingRule;
  end;

// *********************************************************************//
// DispIntf:  ITCallingCardDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0C4D8F00-8DDB-11D1-A09E-00805FC147D3}
// *********************************************************************//
  ITCallingCardDisp = dispinterface
    ['{0C4D8F00-8DDB-11D1-A09E-00805FC147D3}']
    property PermanentCardID: Integer readonly dispid 1;
    property NumberOfDigits: Integer readonly dispid 2;
    property Options: Integer readonly dispid 3;
    property CardName: WideString readonly dispid 4;
    property SameAreaDialingRule: WideString readonly dispid 5;
    property LongDistanceDialingRule: WideString readonly dispid 6;
    property InternationalDialingRule: WideString readonly dispid 7;
  end;

// *********************************************************************//
// Interface: ITAgent
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5770ECE5-4B27-11D1-BF80-00805FC147D3}
// *********************************************************************//
  ITAgent = interface(IDispatch)
    ['{5770ECE5-4B27-11D1-BF80-00805FC147D3}']
    function EnumerateAgentSessions: IEnumAgentSession; safecall;
    function CreateSession(const pACDGroup: ITACDGroup; const pAddress: ITAddress): ITAgentSession; safecall;
    function CreateSessionWithPIN(const pACDGroup: ITACDGroup; const pAddress: ITAddress; 
                                  const pPIN: WideString): ITAgentSession; safecall;
    function Get_ID: WideString; safecall;
    function Get_User: WideString; safecall;
    procedure Set_State(pAgentState: AGENT_STATE); safecall;
    function Get_State: AGENT_STATE; safecall;
    procedure Set_MeasurementPeriod(plPeriod: Integer); safecall;
    function Get_MeasurementPeriod: Integer; safecall;
    function Get_OverallCallRate: Currency; safecall;
    function Get_NumberOfACDCalls: Integer; safecall;
    function Get_NumberOfIncomingCalls: Integer; safecall;
    function Get_NumberOfOutgoingCalls: Integer; safecall;
    function Get_TotalACDTalkTime: Integer; safecall;
    function Get_TotalACDCallTime: Integer; safecall;
    function Get_TotalWrapUpTime: Integer; safecall;
    function Get_AgentSessions: OleVariant; safecall;
    property ID: WideString read Get_ID;
    property User: WideString read Get_User;
    property State: AGENT_STATE read Get_State write Set_State;
    property MeasurementPeriod: Integer read Get_MeasurementPeriod write Set_MeasurementPeriod;
    property OverallCallRate: Currency read Get_OverallCallRate;
    property NumberOfACDCalls: Integer read Get_NumberOfACDCalls;
    property NumberOfIncomingCalls: Integer read Get_NumberOfIncomingCalls;
    property NumberOfOutgoingCalls: Integer read Get_NumberOfOutgoingCalls;
    property TotalACDTalkTime: Integer read Get_TotalACDTalkTime;
    property TotalACDCallTime: Integer read Get_TotalACDCallTime;
    property TotalWrapUpTime: Integer read Get_TotalWrapUpTime;
    property AgentSessions: OleVariant read Get_AgentSessions;
  end;

// *********************************************************************//
// DispIntf:  ITAgentDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5770ECE5-4B27-11D1-BF80-00805FC147D3}
// *********************************************************************//
  ITAgentDisp = dispinterface
    ['{5770ECE5-4B27-11D1-BF80-00805FC147D3}']
    function EnumerateAgentSessions: IEnumAgentSession; dispid 1;
    function CreateSession(const pACDGroup: ITACDGroup; const pAddress: ITAddress): ITAgentSession; dispid 2;
    function CreateSessionWithPIN(const pACDGroup: ITACDGroup; const pAddress: ITAddress; 
                                  const pPIN: WideString): ITAgentSession; dispid 3;
    property ID: WideString readonly dispid 4;
    property User: WideString readonly dispid 5;
    property State: AGENT_STATE dispid 6;
    property MeasurementPeriod: Integer dispid 7;
    property OverallCallRate: Currency readonly dispid 8;
    property NumberOfACDCalls: Integer readonly dispid 9;
    property NumberOfIncomingCalls: Integer readonly dispid 10;
    property NumberOfOutgoingCalls: Integer readonly dispid 11;
    property TotalACDTalkTime: Integer readonly dispid 12;
    property TotalACDCallTime: Integer readonly dispid 13;
    property TotalWrapUpTime: Integer readonly dispid 14;
    property AgentSessions: OleVariant readonly dispid 15;
  end;

// *********************************************************************//
// Interface: IEnumAgentSession
// Flags:     (16) Hidden
// GUID:      {5AFC314E-4BCC-11D1-BF80-00805FC147D3}
// *********************************************************************//
  IEnumAgentSession = interface(IUnknown)
    ['{5AFC314E-4BCC-11D1-BF80-00805FC147D3}']
    function Next(celt: LongWord; out ppElements: ITAgentSession; out pceltFetched: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
    function Clone(out ppEnum: IEnumAgentSession): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITAgentSession
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5AFC3147-4BCC-11D1-BF80-00805FC147D3}
// *********************************************************************//
  ITAgentSession = interface(IDispatch)
    ['{5AFC3147-4BCC-11D1-BF80-00805FC147D3}']
    function Get_Agent: ITAgent; safecall;
    function Get_Address: ITAddress; safecall;
    function Get_ACDGroup: ITACDGroup; safecall;
    procedure Set_State(pSessionState: AGENT_SESSION_STATE); safecall;
    function Get_State: AGENT_SESSION_STATE; safecall;
    function Get_SessionStartTime: TDateTime; safecall;
    function Get_SessionDuration: Integer; safecall;
    function Get_NumberOfCalls: Integer; safecall;
    function Get_TotalTalkTime: Integer; safecall;
    function Get_AverageTalkTime: Integer; safecall;
    function Get_TotalCallTime: Integer; safecall;
    function Get_AverageCallTime: Integer; safecall;
    function Get_TotalWrapUpTime: Integer; safecall;
    function Get_AverageWrapUpTime: Integer; safecall;
    function Get_ACDCallRate: Currency; safecall;
    function Get_LongestTimeToAnswer: Integer; safecall;
    function Get_AverageTimeToAnswer: Integer; safecall;
    property Agent: ITAgent read Get_Agent;
    property Address: ITAddress read Get_Address;
    property ACDGroup: ITACDGroup read Get_ACDGroup;
    property State: AGENT_SESSION_STATE read Get_State write Set_State;
    property SessionStartTime: TDateTime read Get_SessionStartTime;
    property SessionDuration: Integer read Get_SessionDuration;
    property NumberOfCalls: Integer read Get_NumberOfCalls;
    property TotalTalkTime: Integer read Get_TotalTalkTime;
    property AverageTalkTime: Integer read Get_AverageTalkTime;
    property TotalCallTime: Integer read Get_TotalCallTime;
    property AverageCallTime: Integer read Get_AverageCallTime;
    property TotalWrapUpTime: Integer read Get_TotalWrapUpTime;
    property AverageWrapUpTime: Integer read Get_AverageWrapUpTime;
    property ACDCallRate: Currency read Get_ACDCallRate;
    property LongestTimeToAnswer: Integer read Get_LongestTimeToAnswer;
    property AverageTimeToAnswer: Integer read Get_AverageTimeToAnswer;
  end;

// *********************************************************************//
// DispIntf:  ITAgentSessionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5AFC3147-4BCC-11D1-BF80-00805FC147D3}
// *********************************************************************//
  ITAgentSessionDisp = dispinterface
    ['{5AFC3147-4BCC-11D1-BF80-00805FC147D3}']
    property Agent: ITAgent readonly dispid 1;
    property Address: ITAddress readonly dispid 2;
    property ACDGroup: ITACDGroup readonly dispid 3;
    property State: AGENT_SESSION_STATE dispid 4;
    property SessionStartTime: TDateTime readonly dispid 5;
    property SessionDuration: Integer readonly dispid 6;
    property NumberOfCalls: Integer readonly dispid 7;
    property TotalTalkTime: Integer readonly dispid 8;
    property AverageTalkTime: Integer readonly dispid 9;
    property TotalCallTime: Integer readonly dispid 10;
    property AverageCallTime: Integer readonly dispid 11;
    property TotalWrapUpTime: Integer readonly dispid 12;
    property AverageWrapUpTime: Integer readonly dispid 13;
    property ACDCallRate: Currency readonly dispid 14;
    property LongestTimeToAnswer: Integer readonly dispid 15;
    property AverageTimeToAnswer: Integer readonly dispid 16;
  end;

// *********************************************************************//
// Interface: ITACDGroup
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5AFC3148-4BCC-11D1-BF80-00805FC147D3}
// *********************************************************************//
  ITACDGroup = interface(IDispatch)
    ['{5AFC3148-4BCC-11D1-BF80-00805FC147D3}']
    function Get_Name: WideString; safecall;
    function EnumerateQueues: IEnumQueue; safecall;
    function Get_Queues: OleVariant; safecall;
    property Name: WideString read Get_Name;
    property Queues: OleVariant read Get_Queues;
  end;

// *********************************************************************//
// DispIntf:  ITACDGroupDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5AFC3148-4BCC-11D1-BF80-00805FC147D3}
// *********************************************************************//
  ITACDGroupDisp = dispinterface
    ['{5AFC3148-4BCC-11D1-BF80-00805FC147D3}']
    property Name: WideString readonly dispid 1;
    function EnumerateQueues: IEnumQueue; dispid 2;
    property Queues: OleVariant readonly dispid 3;
  end;

// *********************************************************************//
// Interface: IEnumQueue
// Flags:     (16) Hidden
// GUID:      {5AFC3158-4BCC-11D1-BF80-00805FC147D3}
// *********************************************************************//
  IEnumQueue = interface(IUnknown)
    ['{5AFC3158-4BCC-11D1-BF80-00805FC147D3}']
    function Next(celt: LongWord; out ppElements: ITQueue; out pceltFetched: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
    function Clone(out ppEnum: IEnumQueue): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITQueue
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5AFC3149-4BCC-11D1-BF80-00805FC147D3}
// *********************************************************************//
  ITQueue = interface(IDispatch)
    ['{5AFC3149-4BCC-11D1-BF80-00805FC147D3}']
    procedure Set_MeasurementPeriod(plPeriod: Integer); safecall;
    function Get_MeasurementPeriod: Integer; safecall;
    function Get_TotalCallsQueued: Integer; safecall;
    function Get_CurrentCallsQueued: Integer; safecall;
    function Get_TotalCallsAbandoned: Integer; safecall;
    function Get_TotalCallsFlowedIn: Integer; safecall;
    function Get_TotalCallsFlowedOut: Integer; safecall;
    function Get_LongestEverWaitTime: Integer; safecall;
    function Get_CurrentLongestWaitTime: Integer; safecall;
    function Get_AverageWaitTime: Integer; safecall;
    function Get_FinalDisposition: Integer; safecall;
    function Get_Name: WideString; safecall;
    property MeasurementPeriod: Integer read Get_MeasurementPeriod write Set_MeasurementPeriod;
    property TotalCallsQueued: Integer read Get_TotalCallsQueued;
    property CurrentCallsQueued: Integer read Get_CurrentCallsQueued;
    property TotalCallsAbandoned: Integer read Get_TotalCallsAbandoned;
    property TotalCallsFlowedIn: Integer read Get_TotalCallsFlowedIn;
    property TotalCallsFlowedOut: Integer read Get_TotalCallsFlowedOut;
    property LongestEverWaitTime: Integer read Get_LongestEverWaitTime;
    property CurrentLongestWaitTime: Integer read Get_CurrentLongestWaitTime;
    property AverageWaitTime: Integer read Get_AverageWaitTime;
    property FinalDisposition: Integer read Get_FinalDisposition;
    property Name: WideString read Get_Name;
  end;

// *********************************************************************//
// DispIntf:  ITQueueDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5AFC3149-4BCC-11D1-BF80-00805FC147D3}
// *********************************************************************//
  ITQueueDisp = dispinterface
    ['{5AFC3149-4BCC-11D1-BF80-00805FC147D3}']
    property MeasurementPeriod: Integer dispid 1;
    property TotalCallsQueued: Integer readonly dispid 2;
    property CurrentCallsQueued: Integer readonly dispid 3;
    property TotalCallsAbandoned: Integer readonly dispid 4;
    property TotalCallsFlowedIn: Integer readonly dispid 5;
    property TotalCallsFlowedOut: Integer readonly dispid 6;
    property LongestEverWaitTime: Integer readonly dispid 7;
    property CurrentLongestWaitTime: Integer readonly dispid 8;
    property AverageWaitTime: Integer readonly dispid 9;
    property FinalDisposition: Integer readonly dispid 10;
    property Name: WideString readonly dispid 11;
  end;

// *********************************************************************//
// Interface: ITAgentEvent
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5AFC314A-4BCC-11D1-BF80-00805FC147D3}
// *********************************************************************//
  ITAgentEvent = interface(IDispatch)
    ['{5AFC314A-4BCC-11D1-BF80-00805FC147D3}']
    function Get_Agent: ITAgent; safecall;
    function Get_Event: AGENT_EVENT; safecall;
    property Agent: ITAgent read Get_Agent;
    property Event: AGENT_EVENT read Get_Event;
  end;

// *********************************************************************//
// DispIntf:  ITAgentEventDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5AFC314A-4BCC-11D1-BF80-00805FC147D3}
// *********************************************************************//
  ITAgentEventDisp = dispinterface
    ['{5AFC314A-4BCC-11D1-BF80-00805FC147D3}']
    property Agent: ITAgent readonly dispid 1;
    property Event: AGENT_EVENT readonly dispid 2;
  end;

// *********************************************************************//
// Interface: ITAgentSessionEvent
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5AFC314B-4BCC-11D1-BF80-00805FC147D3}
// *********************************************************************//
  ITAgentSessionEvent = interface(IDispatch)
    ['{5AFC314B-4BCC-11D1-BF80-00805FC147D3}']
    function Get_Session: ITAgentSession; safecall;
    function Get_Event: AGENT_SESSION_EVENT; safecall;
    property Session: ITAgentSession read Get_Session;
    property Event: AGENT_SESSION_EVENT read Get_Event;
  end;

// *********************************************************************//
// DispIntf:  ITAgentSessionEventDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5AFC314B-4BCC-11D1-BF80-00805FC147D3}
// *********************************************************************//
  ITAgentSessionEventDisp = dispinterface
    ['{5AFC314B-4BCC-11D1-BF80-00805FC147D3}']
    property Session: ITAgentSession readonly dispid 1;
    property Event: AGENT_SESSION_EVENT readonly dispid 2;
  end;

// *********************************************************************//
// Interface: ITACDGroupEvent
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {297F3032-BD11-11D1-A0A7-00805FC147D3}
// *********************************************************************//
  ITACDGroupEvent = interface(IDispatch)
    ['{297F3032-BD11-11D1-A0A7-00805FC147D3}']
    function Get_Group: ITACDGroup; safecall;
    function Get_Event: ACDGROUP_EVENT; safecall;
    property Group: ITACDGroup read Get_Group;
    property Event: ACDGROUP_EVENT read Get_Event;
  end;

// *********************************************************************//
// DispIntf:  ITACDGroupEventDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {297F3032-BD11-11D1-A0A7-00805FC147D3}
// *********************************************************************//
  ITACDGroupEventDisp = dispinterface
    ['{297F3032-BD11-11D1-A0A7-00805FC147D3}']
    property Group: ITACDGroup readonly dispid 1;
    property Event: ACDGROUP_EVENT readonly dispid 2;
  end;

// *********************************************************************//
// Interface: ITQueueEvent
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {297F3033-BD11-11D1-A0A7-00805FC147D3}
// *********************************************************************//
  ITQueueEvent = interface(IDispatch)
    ['{297F3033-BD11-11D1-A0A7-00805FC147D3}']
    function Get_Queue: ITQueue; safecall;
    function Get_Event: ACDQUEUE_EVENT; safecall;
    property Queue: ITQueue read Get_Queue;
    property Event: ACDQUEUE_EVENT read Get_Event;
  end;

// *********************************************************************//
// DispIntf:  ITQueueEventDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {297F3033-BD11-11D1-A0A7-00805FC147D3}
// *********************************************************************//
  ITQueueEventDisp = dispinterface
    ['{297F3033-BD11-11D1-A0A7-00805FC147D3}']
    property Queue: ITQueue readonly dispid 1;
    property Event: ACDQUEUE_EVENT readonly dispid 2;
  end;

// *********************************************************************//
// Interface: ITTAPICallCenter
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5AFC3154-4BCC-11D1-BF80-00805FC147D3}
// *********************************************************************//
  ITTAPICallCenter = interface(IDispatch)
    ['{5AFC3154-4BCC-11D1-BF80-00805FC147D3}']
    function EnumerateAgentHandlers: IEnumAgentHandler; safecall;
    function Get_AgentHandlers: OleVariant; safecall;
    property AgentHandlers: OleVariant read Get_AgentHandlers;
  end;

// *********************************************************************//
// DispIntf:  ITTAPICallCenterDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5AFC3154-4BCC-11D1-BF80-00805FC147D3}
// *********************************************************************//
  ITTAPICallCenterDisp = dispinterface
    ['{5AFC3154-4BCC-11D1-BF80-00805FC147D3}']
    function EnumerateAgentHandlers: IEnumAgentHandler; dispid 131073;
    property AgentHandlers: OleVariant readonly dispid 131074;
  end;

// *********************************************************************//
// Interface: IEnumAgentHandler
// Flags:     (16) Hidden
// GUID:      {587E8C28-9802-11D1-A0A4-00805FC147D3}
// *********************************************************************//
  IEnumAgentHandler = interface(IUnknown)
    ['{587E8C28-9802-11D1-A0A4-00805FC147D3}']
    function Next(celt: LongWord; out ppElements: ITAgentHandler; out pceltFetched: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
    function Clone(out ppEnum: IEnumAgentHandler): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITAgentHandler
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {587E8C22-9802-11D1-A0A4-00805FC147D3}
// *********************************************************************//
  ITAgentHandler = interface(IDispatch)
    ['{587E8C22-9802-11D1-A0A4-00805FC147D3}']
    function Get_Name: WideString; safecall;
    function CreateAgent: ITAgent; safecall;
    function CreateAgentWithID(const pID: WideString; const pPIN: WideString): ITAgent; safecall;
    function EnumerateACDGroups: IEnumACDGroup; safecall;
    function EnumerateUsableAddresses: IEnumAddress; safecall;
    function Get_ACDGroups: OleVariant; safecall;
    function Get_UsableAddresses: OleVariant; safecall;
    property Name: WideString read Get_Name;
    property ACDGroups: OleVariant read Get_ACDGroups;
    property UsableAddresses: OleVariant read Get_UsableAddresses;
  end;

// *********************************************************************//
// DispIntf:  ITAgentHandlerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {587E8C22-9802-11D1-A0A4-00805FC147D3}
// *********************************************************************//
  ITAgentHandlerDisp = dispinterface
    ['{587E8C22-9802-11D1-A0A4-00805FC147D3}']
    property Name: WideString readonly dispid 1;
    function CreateAgent: ITAgent; dispid 2;
    function CreateAgentWithID(const pID: WideString; const pPIN: WideString): ITAgent; dispid 3;
    function EnumerateACDGroups: IEnumACDGroup; dispid 4;
    function EnumerateUsableAddresses: IEnumAddress; dispid 5;
    property ACDGroups: OleVariant readonly dispid 6;
    property UsableAddresses: OleVariant readonly dispid 7;
  end;

// *********************************************************************//
// Interface: IEnumACDGroup
// Flags:     (16) Hidden
// GUID:      {5AFC3157-4BCC-11D1-BF80-00805FC147D3}
// *********************************************************************//
  IEnumACDGroup = interface(IUnknown)
    ['{5AFC3157-4BCC-11D1-BF80-00805FC147D3}']
    function Next(celt: LongWord; out ppElements: ITACDGroup; out pceltFetched: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
    function Clone(out ppEnum: IEnumACDGroup): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITAgentHandlerEvent
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {297F3034-BD11-11D1-A0A7-00805FC147D3}
// *********************************************************************//
  ITAgentHandlerEvent = interface(IDispatch)
    ['{297F3034-BD11-11D1-A0A7-00805FC147D3}']
    function Get_AgentHandler: ITAgentHandler; safecall;
    function Get_Event: AGENTHANDLER_EVENT; safecall;
    property AgentHandler: ITAgentHandler read Get_AgentHandler;
    property Event: AGENTHANDLER_EVENT read Get_Event;
  end;

// *********************************************************************//
// DispIntf:  ITAgentHandlerEventDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {297F3034-BD11-11D1-A0A7-00805FC147D3}
// *********************************************************************//
  ITAgentHandlerEventDisp = dispinterface
    ['{297F3034-BD11-11D1-A0A7-00805FC147D3}']
    property AgentHandler: ITAgentHandler readonly dispid 1;
    property Event: AGENTHANDLER_EVENT readonly dispid 2;
  end;

// *********************************************************************//
// Interface: ITCallInfoChangeEvent
// Flags:     (4352) OleAutomation Dispatchable
// GUID:      {5D4B65F9-E51C-11D1-A02F-00C04FB6809F}
// *********************************************************************//
  ITCallInfoChangeEvent = interface(IDispatch)
    ['{5D4B65F9-E51C-11D1-A02F-00C04FB6809F}']
    function Get_Call(out ppCall: ITCallInfo): HResult; stdcall;
    function Get_Cause(out pCIC: CALLINFOCHANGE_CAUSE): HResult; stdcall;
    function Get_CallbackInstance(out plCallbackInstance: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITRequestEvent
// Flags:     (4352) OleAutomation Dispatchable
// GUID:      {AC48FFDE-F8C4-11D1-A030-00C04FB6809F}
// *********************************************************************//
  ITRequestEvent = interface(IDispatch)
    ['{AC48FFDE-F8C4-11D1-A030-00C04FB6809F}']
    function Get_RegistrationInstance(out plRegistrationInstance: Integer): HResult; stdcall;
    function Get_RequestMode(out plRequestMode: Integer): HResult; stdcall;
    function Get_DestAddress(out ppDestAddress: WideString): HResult; stdcall;
    function Get_AppName(out ppAppName: WideString): HResult; stdcall;
    function Get_CalledParty(out ppCalledParty: WideString): HResult; stdcall;
    function Get_Comment(out ppComment: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITMediaSupport
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B1EFC384-9355-11D0-835C-00AA003CCABD}
// *********************************************************************//
  ITMediaSupport = interface(IDispatch)
    ['{B1EFC384-9355-11D0-835C-00AA003CCABD}']
    function Get_MediaTypes: Integer; safecall;
    function QueryMediaType(lMediaType: Integer): WordBool; safecall;
    property MediaTypes: Integer read Get_MediaTypes;
  end;

// *********************************************************************//
// DispIntf:  ITMediaSupportDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B1EFC384-9355-11D0-835C-00AA003CCABD}
// *********************************************************************//
  ITMediaSupportDisp = dispinterface
    ['{B1EFC384-9355-11D0-835C-00AA003CCABD}']
    property MediaTypes: Integer readonly dispid 196609;
    function QueryMediaType(lMediaType: Integer): WordBool; dispid 196610;
  end;

// *********************************************************************//
// Interface: ITTerminalSupport
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B1EFC385-9355-11D0-835C-00AA003CCABD}
// *********************************************************************//
  ITTerminalSupport = interface(IDispatch)
    ['{B1EFC385-9355-11D0-835C-00AA003CCABD}']
    function Get_StaticTerminals: OleVariant; safecall;
    function EnumerateStaticTerminals: IEnumTerminal; safecall;
    function Get_DynamicTerminalClasses: OleVariant; safecall;
    function EnumerateDynamicTerminalClasses: IEnumTerminalClass; safecall;
    function CreateTerminal(const pTerminalClass: WideString; lMediaType: Integer; 
                            Direction: TERMINAL_DIRECTION): ITTerminal; safecall;
    function GetDefaultStaticTerminal(lMediaType: Integer; Direction: TERMINAL_DIRECTION): ITTerminal; safecall;
    property StaticTerminals: OleVariant read Get_StaticTerminals;
    property DynamicTerminalClasses: OleVariant read Get_DynamicTerminalClasses;
  end;

// *********************************************************************//
// DispIntf:  ITTerminalSupportDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B1EFC385-9355-11D0-835C-00AA003CCABD}
// *********************************************************************//
  ITTerminalSupportDisp = dispinterface
    ['{B1EFC385-9355-11D0-835C-00AA003CCABD}']
    property StaticTerminals: OleVariant readonly dispid 393217;
    function EnumerateStaticTerminals: IEnumTerminal; dispid 393218;
    property DynamicTerminalClasses: OleVariant readonly dispid 393219;
    function EnumerateDynamicTerminalClasses: IEnumTerminalClass; dispid 393220;
    function CreateTerminal(const pTerminalClass: WideString; lMediaType: Integer; 
                            Direction: TERMINAL_DIRECTION): ITTerminal; dispid 393221;
    function GetDefaultStaticTerminal(lMediaType: Integer; Direction: TERMINAL_DIRECTION): ITTerminal; dispid 393222;
  end;

// *********************************************************************//
// Interface: IEnumTerminalClass
// Flags:     (16) Hidden
// GUID:      {AE269CF5-935E-11D0-835C-00AA003CCABD}
// *********************************************************************//
  IEnumTerminalClass = interface(IUnknown)
    ['{AE269CF5-935E-11D0-835C-00AA003CCABD}']
    function Next(celt: LongWord; out pElements: TGUID; var pceltFetched: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
    function Clone(out ppEnum: IEnumTerminalClass): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITTerminalSupport2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F3EB39BC-1B1F-4E99-A0C0-56305C4DD591}
// *********************************************************************//
  ITTerminalSupport2 = interface(ITTerminalSupport)
    ['{F3EB39BC-1B1F-4E99-A0C0-56305C4DD591}']
    function Get_PluggableSuperclasses: OleVariant; safecall;
    function EnumeratePluggableSuperclasses: IEnumPluggableSuperclassInfo; safecall;
    function Get_PluggableTerminalClasses(const bstrTerminalSuperclass: WideString; 
                                          lMediaType: Integer): OleVariant; safecall;
    function EnumeratePluggableTerminalClasses(iidTerminalSuperclass: TGUID; lMediaType: Integer): IEnumPluggableTerminalClassInfo; safecall;
    property PluggableSuperclasses: OleVariant read Get_PluggableSuperclasses;
    property PluggableTerminalClasses[const bstrTerminalSuperclass: WideString; lMediaType: Integer]: OleVariant read Get_PluggableTerminalClasses;
  end;

// *********************************************************************//
// DispIntf:  ITTerminalSupport2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F3EB39BC-1B1F-4E99-A0C0-56305C4DD591}
// *********************************************************************//
  ITTerminalSupport2Disp = dispinterface
    ['{F3EB39BC-1B1F-4E99-A0C0-56305C4DD591}']
    property PluggableSuperclasses: OleVariant readonly dispid 393223;
    function EnumeratePluggableSuperclasses: IEnumPluggableSuperclassInfo; dispid 393224;
    property PluggableTerminalClasses[const bstrTerminalSuperclass: WideString; lMediaType: Integer]: OleVariant readonly dispid 393225;
    function EnumeratePluggableTerminalClasses(iidTerminalSuperclass: {??TGUID}OleVariant; 
                                               lMediaType: Integer): IEnumPluggableTerminalClassInfo; dispid 393226;
    property StaticTerminals: OleVariant readonly dispid 393217;
    function EnumerateStaticTerminals: IEnumTerminal; dispid 393218;
    property DynamicTerminalClasses: OleVariant readonly dispid 393219;
    function EnumerateDynamicTerminalClasses: IEnumTerminalClass; dispid 393220;
    function CreateTerminal(const pTerminalClass: WideString; lMediaType: Integer; 
                            Direction: TERMINAL_DIRECTION): ITTerminal; dispid 393221;
    function GetDefaultStaticTerminal(lMediaType: Integer; Direction: TERMINAL_DIRECTION): ITTerminal; dispid 393222;
  end;

// *********************************************************************//
// Interface: IEnumPluggableSuperclassInfo
// Flags:     (16) Hidden
// GUID:      {E9586A80-89E6-4CFF-931D-478D5751F4C0}
// *********************************************************************//
  IEnumPluggableSuperclassInfo = interface(IUnknown)
    ['{E9586A80-89E6-4CFF-931D-478D5751F4C0}']
    function Next(celt: LongWord; out ppElements: ITPluggableTerminalSuperclassInfo; 
                  var pceltFetched: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
    function Clone(out ppEnum: IEnumPluggableSuperclassInfo): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITPluggableTerminalSuperclassInfo
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6D54E42C-4625-4359-A6F7-631999107E05}
// *********************************************************************//
  ITPluggableTerminalSuperclassInfo = interface(IDispatch)
    ['{6D54E42C-4625-4359-A6F7-631999107E05}']
    function Get_Name: WideString; safecall;
    function Get_CLSID: WideString; safecall;
    property Name: WideString read Get_Name;
    property CLSID: WideString read Get_CLSID;
  end;

// *********************************************************************//
// DispIntf:  ITPluggableTerminalSuperclassInfoDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6D54E42C-4625-4359-A6F7-631999107E05}
// *********************************************************************//
  ITPluggableTerminalSuperclassInfoDisp = dispinterface
    ['{6D54E42C-4625-4359-A6F7-631999107E05}']
    property Name: WideString readonly dispid 1;
    property CLSID: WideString readonly dispid 2;
  end;

// *********************************************************************//
// Interface: IEnumPluggableTerminalClassInfo
// Flags:     (16) Hidden
// GUID:      {4567450C-DBEE-4E3F-AAF5-37BF9EBF5E29}
// *********************************************************************//
  IEnumPluggableTerminalClassInfo = interface(IUnknown)
    ['{4567450C-DBEE-4E3F-AAF5-37BF9EBF5E29}']
    function Next(celt: LongWord; out ppElements: ITPluggableTerminalClassInfo; 
                  var pceltFetched: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
    function Clone(out ppEnum: IEnumPluggableTerminalClassInfo): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITPluggableTerminalClassInfo
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {41757F4A-CF09-4B34-BC96-0A79D2390076}
// *********************************************************************//
  ITPluggableTerminalClassInfo = interface(IDispatch)
    ['{41757F4A-CF09-4B34-BC96-0A79D2390076}']
    function Get_Name: WideString; safecall;
    function Get_Company: WideString; safecall;
    function Get_Version: WideString; safecall;
    function Get_TerminalClass: WideString; safecall;
    function Get_CLSID: WideString; safecall;
    function Get_Direction: TERMINAL_DIRECTION; safecall;
    function Get_MediaTypes: Integer; safecall;
    property Name: WideString read Get_Name;
    property Company: WideString read Get_Company;
    property Version: WideString read Get_Version;
    property TerminalClass: WideString read Get_TerminalClass;
    property CLSID: WideString read Get_CLSID;
    property Direction: TERMINAL_DIRECTION read Get_Direction;
    property MediaTypes: Integer read Get_MediaTypes;
  end;

// *********************************************************************//
// DispIntf:  ITPluggableTerminalClassInfoDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {41757F4A-CF09-4B34-BC96-0A79D2390076}
// *********************************************************************//
  ITPluggableTerminalClassInfoDisp = dispinterface
    ['{41757F4A-CF09-4B34-BC96-0A79D2390076}']
    property Name: WideString readonly dispid 1;
    property Company: WideString readonly dispid 2;
    property Version: WideString readonly dispid 3;
    property TerminalClass: WideString readonly dispid 4;
    property CLSID: WideString readonly dispid 5;
    property Direction: TERMINAL_DIRECTION readonly dispid 6;
    property MediaTypes: Integer readonly dispid 7;
  end;

// *********************************************************************//
// Interface: ITStreamControl
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EE3BD604-3868-11D2-A045-00C04FB6809F}
// *********************************************************************//
  ITStreamControl = interface(IDispatch)
    ['{EE3BD604-3868-11D2-A045-00C04FB6809F}']
    function CreateStream(lMediaType: Integer; td: TERMINAL_DIRECTION): ITStream; safecall;
    procedure RemoveStream(const pStream: ITStream); safecall;
    procedure EnumerateStreams(out ppEnumStream: IEnumStream); safecall;
    function Get_Streams: OleVariant; safecall;
    property Streams: OleVariant read Get_Streams;
  end;

// *********************************************************************//
// DispIntf:  ITStreamControlDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EE3BD604-3868-11D2-A045-00C04FB6809F}
// *********************************************************************//
  ITStreamControlDisp = dispinterface
    ['{EE3BD604-3868-11D2-A045-00C04FB6809F}']
    function CreateStream(lMediaType: Integer; td: TERMINAL_DIRECTION): ITStream; dispid 262145;
    procedure RemoveStream(const pStream: ITStream); dispid 262146;
    procedure EnumerateStreams(out ppEnumStream: IEnumStream); dispid 262147;
    property Streams: OleVariant readonly dispid 262148;
  end;

// *********************************************************************//
// Interface: IEnumStream
// Flags:     (16) Hidden
// GUID:      {EE3BD606-3868-11D2-A045-00C04FB6809F}
// *********************************************************************//
  IEnumStream = interface(IUnknown)
    ['{EE3BD606-3868-11D2-A045-00C04FB6809F}']
    function Next(celt: LongWord; out ppElements: ITStream; var pceltFetched: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
    function Clone(out ppEnum: IEnumStream): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITSubStreamControl
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EE3BD607-3868-11D2-A045-00C04FB6809F}
// *********************************************************************//
  ITSubStreamControl = interface(IDispatch)
    ['{EE3BD607-3868-11D2-A045-00C04FB6809F}']
    function CreateSubStream: ITSubStream; safecall;
    procedure RemoveSubStream(const pSubStream: ITSubStream); safecall;
    procedure EnumerateSubStreams(out ppEnumSubStream: IEnumSubStream); safecall;
    function Get_SubStreams: OleVariant; safecall;
    property SubStreams: OleVariant read Get_SubStreams;
  end;

// *********************************************************************//
// DispIntf:  ITSubStreamControlDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EE3BD607-3868-11D2-A045-00C04FB6809F}
// *********************************************************************//
  ITSubStreamControlDisp = dispinterface
    ['{EE3BD607-3868-11D2-A045-00C04FB6809F}']
    function CreateSubStream: ITSubStream; dispid 1;
    procedure RemoveSubStream(const pSubStream: ITSubStream); dispid 2;
    procedure EnumerateSubStreams(out ppEnumSubStream: IEnumSubStream); dispid 3;
    property SubStreams: OleVariant readonly dispid 4;
  end;

// *********************************************************************//
// Interface: ITSubStream
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EE3BD608-3868-11D2-A045-00C04FB6809F}
// *********************************************************************//
  ITSubStream = interface(IDispatch)
    ['{EE3BD608-3868-11D2-A045-00C04FB6809F}']
    procedure StartSubStream; safecall;
    procedure PauseSubStream; safecall;
    procedure StopSubStream; safecall;
    procedure SelectTerminal(const pTerminal: ITTerminal); safecall;
    procedure UnselectTerminal(const pTerminal: ITTerminal); safecall;
    procedure EnumerateTerminals(out ppEnumTerminal: IEnumTerminal); safecall;
    function Get_Terminals: OleVariant; safecall;
    function Get_Stream: ITStream; safecall;
    property Terminals: OleVariant read Get_Terminals;
    property Stream: ITStream read Get_Stream;
  end;

// *********************************************************************//
// DispIntf:  ITSubStreamDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EE3BD608-3868-11D2-A045-00C04FB6809F}
// *********************************************************************//
  ITSubStreamDisp = dispinterface
    ['{EE3BD608-3868-11D2-A045-00C04FB6809F}']
    procedure StartSubStream; dispid 1;
    procedure PauseSubStream; dispid 2;
    procedure StopSubStream; dispid 3;
    procedure SelectTerminal(const pTerminal: ITTerminal); dispid 4;
    procedure UnselectTerminal(const pTerminal: ITTerminal); dispid 5;
    procedure EnumerateTerminals(out ppEnumTerminal: IEnumTerminal); dispid 6;
    property Terminals: OleVariant readonly dispid 7;
    property Stream: ITStream readonly dispid 8;
  end;

// *********************************************************************//
// Interface: IEnumSubStream
// Flags:     (16) Hidden
// GUID:      {EE3BD609-3868-11D2-A045-00C04FB6809F}
// *********************************************************************//
  IEnumSubStream = interface(IUnknown)
    ['{EE3BD609-3868-11D2-A045-00C04FB6809F}']
    function Next(celt: LongWord; out ppElements: ITSubStream; var pceltFetched: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
    function Clone(out ppEnum: IEnumSubStream): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITLegacyAddressMediaControl
// Flags:     (16) Hidden
// GUID:      {AB493640-4C0B-11D2-A046-00C04FB6809F}
// *********************************************************************//
  ITLegacyAddressMediaControl = interface(IUnknown)
    ['{AB493640-4C0B-11D2-A046-00C04FB6809F}']
    function GetID(const pDeviceClass: WideString; out pdwSize: LongWord; out ppDeviceID: PByte1): HResult; stdcall;
    function GetDevConfig(const pDeviceClass: WideString; out pdwSize: LongWord; 
                          out ppDeviceConfig: PByte1): HResult; stdcall;
    function SetDevConfig(const pDeviceClass: WideString; dwSize: LongWord; var pDeviceConfig: Byte): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITLegacyAddressMediaControl2
// Flags:     (16) Hidden
// GUID:      {B0EE512B-A531-409E-9DD9-4099FE86C738}
// *********************************************************************//
  ITLegacyAddressMediaControl2 = interface(ITLegacyAddressMediaControl)
    ['{B0EE512B-A531-409E-9DD9-4099FE86C738}']
    function ConfigDialog(var hwndOwner: _RemotableHandle; const pDeviceClass: WideString): HResult; stdcall;
    function ConfigDialogEdit(var hwndOwner: _RemotableHandle; const pDeviceClass: WideString; 
                              dwSizeIn: LongWord; var pDeviceConfigIn: Byte; 
                              out pdwSizeOut: LongWord; out ppDeviceConfigOut: PByte1): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITLegacyCallMediaControl
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D624582F-CC23-4436-B8A5-47C625C8045D}
// *********************************************************************//
  ITLegacyCallMediaControl = interface(IDispatch)
    ['{D624582F-CC23-4436-B8A5-47C625C8045D}']
    procedure DetectDigits(DigitMode: Integer); safecall;
    procedure GenerateDigits(const pDigits: WideString; DigitMode: Integer); safecall;
    procedure GetID(const pDeviceClass: WideString; out pdwSize: LongWord; out ppDeviceID: PByte1); safecall;
    procedure SetMediaType(lMediaType: Integer); safecall;
    procedure MonitorMedia(lMediaType: Integer); safecall;
  end;

// *********************************************************************//
// DispIntf:  ITLegacyCallMediaControlDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D624582F-CC23-4436-B8A5-47C625C8045D}
// *********************************************************************//
  ITLegacyCallMediaControlDisp = dispinterface
    ['{D624582F-CC23-4436-B8A5-47C625C8045D}']
    procedure DetectDigits(DigitMode: Integer); dispid 196609;
    procedure GenerateDigits(const pDigits: WideString; DigitMode: Integer); dispid 196610;
    procedure GetID(const pDeviceClass: WideString; out pdwSize: LongWord; 
                    out ppDeviceID: {??PByte1}OleVariant); dispid 196611;
    procedure SetMediaType(lMediaType: Integer); dispid 196612;
    procedure MonitorMedia(lMediaType: Integer); dispid 196613;
  end;

// *********************************************************************//
// Interface: ITLegacyCallMediaControl2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {57CA332D-7BC2-44F1-A60C-936FE8D7CE73}
// *********************************************************************//
  ITLegacyCallMediaControl2 = interface(ITLegacyCallMediaControl)
    ['{57CA332D-7BC2-44F1-A60C-936FE8D7CE73}']
    procedure GenerateDigits2(const pDigits: WideString; DigitMode: Integer; lDuration: Integer); safecall;
    procedure GatherDigits(DigitMode: Integer; lNumDigits: Integer; 
                           const pTerminationDigits: WideString; lFirstDigitTimeout: Integer; 
                           lInterDigitTimeout: Integer); safecall;
    procedure DetectTones(var pToneList: TAPI_DETECTTONE; lNumTones: Integer); safecall;
    procedure DetectTonesByCollection(const pDetectToneCollection: ITCollection2); safecall;
    procedure GenerateTone(ToneMode: TAPI_TONEMODE; lDuration: Integer); safecall;
    procedure GenerateCustomTones(var pToneList: TAPI_CUSTOMTONE; lNumTones: Integer; 
                                  lDuration: Integer); safecall;
    procedure GenerateCustomTonesByCollection(const pCustomToneCollection: ITCollection2; 
                                              lDuration: Integer); safecall;
    function CreateDetectToneObject: ITDetectTone; safecall;
    function CreateCustomToneObject: ITCustomTone; safecall;
    function GetIDAsVariant(const bstrDeviceClass: WideString): OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  ITLegacyCallMediaControl2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {57CA332D-7BC2-44F1-A60C-936FE8D7CE73}
// *********************************************************************//
  ITLegacyCallMediaControl2Disp = dispinterface
    ['{57CA332D-7BC2-44F1-A60C-936FE8D7CE73}']
    procedure GenerateDigits2(const pDigits: WideString; DigitMode: Integer; lDuration: Integer); dispid 196614;
    procedure GatherDigits(DigitMode: Integer; lNumDigits: Integer; 
                           const pTerminationDigits: WideString; lFirstDigitTimeout: Integer; 
                           lInterDigitTimeout: Integer); dispid 196615;
    procedure DetectTones(var pToneList: {??TAPI_DETECTTONE}OleVariant; lNumTones: Integer); dispid 196616;
    procedure DetectTonesByCollection(const pDetectToneCollection: ITCollection2); dispid 196617;
    procedure GenerateTone(ToneMode: TAPI_TONEMODE; lDuration: Integer); dispid 196618;
    procedure GenerateCustomTones(var pToneList: {??TAPI_CUSTOMTONE}OleVariant; lNumTones: Integer; 
                                  lDuration: Integer); dispid 196619;
    procedure GenerateCustomTonesByCollection(const pCustomToneCollection: ITCollection2; 
                                              lDuration: Integer); dispid 196620;
    function CreateDetectToneObject: ITDetectTone; dispid 196621;
    function CreateCustomToneObject: ITCustomTone; dispid 196622;
    function GetIDAsVariant(const bstrDeviceClass: WideString): OleVariant; dispid 196623;
    procedure DetectDigits(DigitMode: Integer); dispid 196609;
    procedure GenerateDigits(const pDigits: WideString; DigitMode: Integer); dispid 196610;
    procedure GetID(const pDeviceClass: WideString; out pdwSize: LongWord; 
                    out ppDeviceID: {??PByte1}OleVariant); dispid 196611;
    procedure SetMediaType(lMediaType: Integer); dispid 196612;
    procedure MonitorMedia(lMediaType: Integer); dispid 196613;
  end;

// *********************************************************************//
// Interface: ITDetectTone
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {961F79BD-3097-49DF-A1D6-909B77E89CA0}
// *********************************************************************//
  ITDetectTone = interface(IDispatch)
    ['{961F79BD-3097-49DF-A1D6-909B77E89CA0}']
    function Get_AppSpecific: Integer; safecall;
    procedure Set_AppSpecific(plAppSpecific: Integer); safecall;
    function Get_Duration: Integer; safecall;
    procedure Set_Duration(plDuration: Integer); safecall;
    function Get_Frequency(Index: Integer): Integer; safecall;
    procedure Set_Frequency(Index: Integer; plFrequency: Integer); safecall;
    property AppSpecific: Integer read Get_AppSpecific write Set_AppSpecific;
    property Duration: Integer read Get_Duration write Set_Duration;
    property Frequency[Index: Integer]: Integer read Get_Frequency write Set_Frequency;
  end;

// *********************************************************************//
// DispIntf:  ITDetectToneDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {961F79BD-3097-49DF-A1D6-909B77E89CA0}
// *********************************************************************//
  ITDetectToneDisp = dispinterface
    ['{961F79BD-3097-49DF-A1D6-909B77E89CA0}']
    property AppSpecific: Integer dispid 1;
    property Duration: Integer dispid 2;
    property Frequency[Index: Integer]: Integer dispid 3;
  end;

// *********************************************************************//
// Interface: ITCustomTone
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {357AD764-B3C6-4B2A-8FA5-0722827A9254}
// *********************************************************************//
  ITCustomTone = interface(IDispatch)
    ['{357AD764-B3C6-4B2A-8FA5-0722827A9254}']
    function Get_Frequency: Integer; safecall;
    procedure Set_Frequency(plFrequency: Integer); safecall;
    function Get_CadenceOn: Integer; safecall;
    procedure Set_CadenceOn(plCadenceOn: Integer); safecall;
    function Get_CadenceOff: Integer; safecall;
    procedure Set_CadenceOff(plCadenceOff: Integer); safecall;
    function Get_Volume: Integer; safecall;
    procedure Set_Volume(plVolume: Integer); safecall;
    property Frequency: Integer read Get_Frequency write Set_Frequency;
    property CadenceOn: Integer read Get_CadenceOn write Set_CadenceOn;
    property CadenceOff: Integer read Get_CadenceOff write Set_CadenceOff;
    property Volume: Integer read Get_Volume write Set_Volume;
  end;

// *********************************************************************//
// DispIntf:  ITCustomToneDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {357AD764-B3C6-4B2A-8FA5-0722827A9254}
// *********************************************************************//
  ITCustomToneDisp = dispinterface
    ['{357AD764-B3C6-4B2A-8FA5-0722827A9254}']
    property Frequency: Integer dispid 1;
    property CadenceOn: Integer dispid 2;
    property CadenceOff: Integer dispid 3;
    property Volume: Integer dispid 4;
  end;

// *********************************************************************//
// Interface: ITDigitDetectionEvent
// Flags:     (4352) OleAutomation Dispatchable
// GUID:      {80D3BFAC-57D9-11D2-A04A-00C04FB6809F}
// *********************************************************************//
  ITDigitDetectionEvent = interface(IDispatch)
    ['{80D3BFAC-57D9-11D2-A04A-00C04FB6809F}']
    function Get_Call(out ppCallInfo: ITCallInfo): HResult; stdcall;
    function Get_Digit(out pucDigit: Byte): HResult; stdcall;
    function Get_DigitMode(out pDigitMode: Integer): HResult; stdcall;
    function Get_TickCount(out plTickCount: Integer): HResult; stdcall;
    function Get_CallbackInstance(out plCallbackInstance: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITDigitGenerationEvent
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {80D3BFAD-57D9-11D2-A04A-00C04FB6809F}
// *********************************************************************//
  ITDigitGenerationEvent = interface(IDispatch)
    ['{80D3BFAD-57D9-11D2-A04A-00C04FB6809F}']
    function Get_Call: ITCallInfo; safecall;
    function Get_GenerationTermination: Integer; safecall;
    function Get_TickCount: Integer; safecall;
    function Get_CallbackInstance: Integer; safecall;
    property Call: ITCallInfo read Get_Call;
    property GenerationTermination: Integer read Get_GenerationTermination;
    property TickCount: Integer read Get_TickCount;
    property CallbackInstance: Integer read Get_CallbackInstance;
  end;

// *********************************************************************//
// DispIntf:  ITDigitGenerationEventDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {80D3BFAD-57D9-11D2-A04A-00C04FB6809F}
// *********************************************************************//
  ITDigitGenerationEventDisp = dispinterface
    ['{80D3BFAD-57D9-11D2-A04A-00C04FB6809F}']
    property Call: ITCallInfo readonly dispid 1;
    property GenerationTermination: Integer readonly dispid 2;
    property TickCount: Integer readonly dispid 3;
    property CallbackInstance: Integer readonly dispid 4;
  end;

// *********************************************************************//
// Interface: ITDigitsGatheredEvent
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E52EC4C1-CBA3-441A-9E6A-93CB909E9724}
// *********************************************************************//
  ITDigitsGatheredEvent = interface(IDispatch)
    ['{E52EC4C1-CBA3-441A-9E6A-93CB909E9724}']
    function Get_Call: ITCallInfo; safecall;
    function Get_Digits: WideString; safecall;
    function Get_GatherTermination: TAPI_GATHERTERM; safecall;
    function Get_TickCount: Integer; safecall;
    function Get_CallbackInstance: Integer; safecall;
    property Call: ITCallInfo read Get_Call;
    property Digits: WideString read Get_Digits;
    property GatherTermination: TAPI_GATHERTERM read Get_GatherTermination;
    property TickCount: Integer read Get_TickCount;
    property CallbackInstance: Integer read Get_CallbackInstance;
  end;

// *********************************************************************//
// DispIntf:  ITDigitsGatheredEventDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E52EC4C1-CBA3-441A-9E6A-93CB909E9724}
// *********************************************************************//
  ITDigitsGatheredEventDisp = dispinterface
    ['{E52EC4C1-CBA3-441A-9E6A-93CB909E9724}']
    property Call: ITCallInfo readonly dispid 1;
    property Digits: WideString readonly dispid 2;
    property GatherTermination: TAPI_GATHERTERM readonly dispid 3;
    property TickCount: Integer readonly dispid 4;
    property CallbackInstance: Integer readonly dispid 5;
  end;

// *********************************************************************//
// Interface: ITToneDetectionEvent
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {407E0FAF-D047-4753-B0C6-8E060373FECD}
// *********************************************************************//
  ITToneDetectionEvent = interface(IDispatch)
    ['{407E0FAF-D047-4753-B0C6-8E060373FECD}']
    function Get_Call: ITCallInfo; safecall;
    function Get_AppSpecific: Integer; safecall;
    function Get_TickCount: Integer; safecall;
    function Get_CallbackInstance: Integer; safecall;
    property Call: ITCallInfo read Get_Call;
    property AppSpecific: Integer read Get_AppSpecific;
    property TickCount: Integer read Get_TickCount;
    property CallbackInstance: Integer read Get_CallbackInstance;
  end;

// *********************************************************************//
// DispIntf:  ITToneDetectionEventDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {407E0FAF-D047-4753-B0C6-8E060373FECD}
// *********************************************************************//
  ITToneDetectionEventDisp = dispinterface
    ['{407E0FAF-D047-4753-B0C6-8E060373FECD}']
    property Call: ITCallInfo readonly dispid 1;
    property AppSpecific: Integer readonly dispid 2;
    property TickCount: Integer readonly dispid 3;
    property CallbackInstance: Integer readonly dispid 4;
  end;

// *********************************************************************//
// Interface: ITPrivateEvent
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0E269CD0-10D4-4121-9C22-9C85D625650D}
// *********************************************************************//
  ITPrivateEvent = interface(IDispatch)
    ['{0E269CD0-10D4-4121-9C22-9C85D625650D}']
    function Get_Address: ITAddress; safecall;
    function Get_Call: ITCallInfo; safecall;
    function Get_CallHub: ITCallHub; safecall;
    function Get_EventCode: Integer; safecall;
    function Get_EventInterface: IDispatch; safecall;
    property Address: ITAddress read Get_Address;
    property Call: ITCallInfo read Get_Call;
    property CallHub: ITCallHub read Get_CallHub;
    property EventCode: Integer read Get_EventCode;
    property EventInterface: IDispatch read Get_EventInterface;
  end;

// *********************************************************************//
// DispIntf:  ITPrivateEventDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0E269CD0-10D4-4121-9C22-9C85D625650D}
// *********************************************************************//
  ITPrivateEventDisp = dispinterface
    ['{0E269CD0-10D4-4121-9C22-9C85D625650D}']
    property Address: ITAddress readonly dispid 1;
    property Call: ITCallInfo readonly dispid 2;
    property CallHub: ITCallHub readonly dispid 3;
    property EventCode: Integer readonly dispid 4;
    property EventInterface: IDispatch readonly dispid 5;
  end;

// *********************************************************************//
// Interface: ITAddress2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B0AE5D9B-BE51-46C9-B0F7-DFA8A22A8BC4}
// *********************************************************************//
  ITAddress2 = interface(ITAddress)
    ['{B0AE5D9B-BE51-46C9-B0F7-DFA8A22A8BC4}']
    function Get_Phones: OleVariant; safecall;
    function EnumeratePhones: IEnumPhone; safecall;
    function GetPhoneFromTerminal(const pTerminal: ITTerminal): ITPhone; safecall;
    function Get_PreferredPhones: OleVariant; safecall;
    function EnumeratePreferredPhones: IEnumPhone; safecall;
    function Get_EventFilter(TapiEvent: TAPI_EVENT; lSubEvent: Integer): WordBool; safecall;
    procedure Set_EventFilter(TapiEvent: TAPI_EVENT; lSubEvent: Integer; pEnable: WordBool); safecall;
    procedure DeviceSpecific(const pCall: ITCallInfo; var pParams: Byte; dwSize: LongWord); safecall;
    procedure DeviceSpecificVariant(const pCall: ITCallInfo; varDevSpecificByteArray: OleVariant); safecall;
    function NegotiateExtVersion(lLowVersion: Integer; lHighVersion: Integer): Integer; safecall;
    property Phones: OleVariant read Get_Phones;
    property PreferredPhones: OleVariant read Get_PreferredPhones;
    property EventFilter[TapiEvent: TAPI_EVENT; lSubEvent: Integer]: WordBool read Get_EventFilter write Set_EventFilter;
  end;

// *********************************************************************//
// DispIntf:  ITAddress2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B0AE5D9B-BE51-46C9-B0F7-DFA8A22A8BC4}
// *********************************************************************//
  ITAddress2Disp = dispinterface
    ['{B0AE5D9B-BE51-46C9-B0F7-DFA8A22A8BC4}']
    property Phones: OleVariant readonly dispid 65552;
    function EnumeratePhones: IEnumPhone; dispid 65553;
    function GetPhoneFromTerminal(const pTerminal: ITTerminal): ITPhone; dispid 65554;
    property PreferredPhones: OleVariant readonly dispid 65556;
    function EnumeratePreferredPhones: IEnumPhone; dispid 65557;
    property EventFilter[TapiEvent: TAPI_EVENT; lSubEvent: Integer]: WordBool dispid 65555;
    procedure DeviceSpecific(const pCall: ITCallInfo; var pParams: Byte; dwSize: LongWord); dispid 65558;
    procedure DeviceSpecificVariant(const pCall: ITCallInfo; varDevSpecificByteArray: OleVariant); dispid 65559;
    function NegotiateExtVersion(lLowVersion: Integer; lHighVersion: Integer): Integer; dispid 65560;
    property State: ADDRESS_STATE readonly dispid 65537;
    property AddressName: WideString readonly dispid 65538;
    property ServiceProviderName: WideString readonly dispid 65539;
    property TAPIObject: ITTAPI readonly dispid 65540;
    function CreateCall(const pDestAddress: WideString; lAddressType: Integer; lMediaTypes: Integer): ITBasicCallControl; dispid 65541;
    property Calls: OleVariant readonly dispid 65542;
    function EnumerateCalls: IEnumCall; dispid 65543;
    property DialableAddress: WideString readonly dispid 65544;
    function CreateForwardInfoObject: ITForwardInformation; dispid 65546;
    procedure Forward(const pForwardInfo: ITForwardInformation; const pCall: ITBasicCallControl); dispid 65547;
    property CurrentForwardInfo: ITForwardInformation readonly dispid 65548;
    property MessageWaiting: WordBool dispid 65550;
    property DoNotDisturb: WordBool dispid 65551;
  end;

// *********************************************************************//
// Interface: IEnumPhone
// Flags:     (16) Hidden
// GUID:      {F15B7669-4780-4595-8C89-FB369C8CF7AA}
// *********************************************************************//
  IEnumPhone = interface(IUnknown)
    ['{F15B7669-4780-4595-8C89-FB369C8CF7AA}']
    function Next(celt: LongWord; out ppElements: ITPhone; var pceltFetched: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
    function Clone(out ppEnum: IEnumPhone): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITTAPI2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {54FBDC8C-D90F-4DAD-9695-B373097F094B}
// *********************************************************************//
  ITTAPI2 = interface(ITTAPI)
    ['{54FBDC8C-D90F-4DAD-9695-B373097F094B}']
    function Get_Phones: OleVariant; safecall;
    function EnumeratePhones: IEnumPhone; safecall;
    function CreateEmptyCollectionObject: ITCollection2; safecall;
    property Phones: OleVariant read Get_Phones;
  end;

// *********************************************************************//
// DispIntf:  ITTAPI2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {54FBDC8C-D90F-4DAD-9695-B373097F094B}
// *********************************************************************//
  ITTAPI2Disp = dispinterface
    ['{54FBDC8C-D90F-4DAD-9695-B373097F094B}']
    property Phones: OleVariant readonly dispid 65552;
    function EnumeratePhones: IEnumPhone; dispid 65553;
    function CreateEmptyCollectionObject: ITCollection2; dispid 65554;
    procedure Initialize; dispid 65549;
    procedure Shutdown; dispid 65550;
    property Addresses: OleVariant readonly dispid 65537;
    function EnumerateAddresses: IEnumAddress; dispid 65538;
    function RegisterCallNotifications(const pAddress: ITAddress; fMonitor: WordBool; 
                                       fOwner: WordBool; lMediaTypes: Integer; 
                                       lCallbackInstance: Integer): Integer; dispid 65539;
    procedure UnregisterNotifications(lRegister: Integer); dispid 65540;
    property CallHubs: OleVariant readonly dispid 65541;
    function EnumerateCallHubs: IEnumCallHub; dispid 65542;
    procedure SetCallHubTracking(pAddresses: OleVariant; bTracking: WordBool); dispid 65543;
    procedure EnumeratePrivateTAPIObjects(out ppEnumUnknown: IEnumUnknown); dispid 65544;
    property PrivateTAPIObjects: OleVariant readonly dispid 65545;
    procedure RegisterRequestRecipient(lRegistrationInstance: Integer; lRequestMode: Integer; 
                                       fEnable: WordBool); dispid 65546;
    procedure SetAssistedTelephonyPriority(const pAppFilename: WideString; fPriority: WordBool); dispid 65547;
    procedure SetApplicationPriority(const pAppFilename: WideString; lMediaType: Integer; 
                                     fPriority: WordBool); dispid 65548;
    property EventFilter: Integer dispid 65551;
  end;

// *********************************************************************//
// Interface: ITMultiTrackTerminal
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FE040091-ADE8-4072-95C9-BF7DE8C54B44}
// *********************************************************************//
  ITMultiTrackTerminal = interface(IDispatch)
    ['{FE040091-ADE8-4072-95C9-BF7DE8C54B44}']
    function Get_TrackTerminals: OleVariant; safecall;
    function EnumerateTrackTerminals: IEnumTerminal; safecall;
    function CreateTrackTerminal(MediaType: Integer; TerminalDirection: TERMINAL_DIRECTION): ITTerminal; safecall;
    function Get_MediaTypesInUse: Integer; safecall;
    function Get_DirectionsInUse: TERMINAL_DIRECTION; safecall;
    procedure RemoveTrackTerminal(const pTrackTerminalToRemove: ITTerminal); safecall;
    property TrackTerminals: OleVariant read Get_TrackTerminals;
    property MediaTypesInUse: Integer read Get_MediaTypesInUse;
    property DirectionsInUse: TERMINAL_DIRECTION read Get_DirectionsInUse;
  end;

// *********************************************************************//
// DispIntf:  ITMultiTrackTerminalDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FE040091-ADE8-4072-95C9-BF7DE8C54B44}
// *********************************************************************//
  ITMultiTrackTerminalDisp = dispinterface
    ['{FE040091-ADE8-4072-95C9-BF7DE8C54B44}']
    property TrackTerminals: OleVariant readonly dispid 65537;
    function EnumerateTrackTerminals: IEnumTerminal; dispid 65538;
    function CreateTrackTerminal(MediaType: Integer; TerminalDirection: TERMINAL_DIRECTION): ITTerminal; dispid 65539;
    property MediaTypesInUse: Integer readonly dispid 65540;
    property DirectionsInUse: TERMINAL_DIRECTION readonly dispid 65541;
    procedure RemoveTrackTerminal(const pTrackTerminalToRemove: ITTerminal); dispid 65542;
  end;

// *********************************************************************//
// Interface: ITStaticAudioTerminal
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A86B7871-D14C-48E6-922E-A8D15F984800}
// *********************************************************************//
  ITStaticAudioTerminal = interface(IDispatch)
    ['{A86B7871-D14C-48E6-922E-A8D15F984800}']
    function Get_WaveId: Integer; safecall;
    property WaveId: Integer read Get_WaveId;
  end;

// *********************************************************************//
// DispIntf:  ITStaticAudioTerminalDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A86B7871-D14C-48E6-922E-A8D15F984800}
// *********************************************************************//
  ITStaticAudioTerminalDisp = dispinterface
    ['{A86B7871-D14C-48E6-922E-A8D15F984800}']
    property WaveId: Integer readonly dispid 1;
  end;

// *********************************************************************//
// Interface: ITBasicCallControl2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {161A4A56-1E99-4B3F-A46A-168F38A5EE4C}
// *********************************************************************//
  ITBasicCallControl2 = interface(ITBasicCallControl)
    ['{161A4A56-1E99-4B3F-A46A-168F38A5EE4C}']
    function RequestTerminal(const bstrTerminalClassGUID: WideString; lMediaType: Integer; 
                             Direction: TERMINAL_DIRECTION): ITTerminal; safecall;
    procedure SelectTerminalOnCall(const pTerminal: ITTerminal); safecall;
    procedure UnselectTerminalOnCall(const pTerminal: ITTerminal); safecall;
  end;

// *********************************************************************//
// DispIntf:  ITBasicCallControl2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {161A4A56-1E99-4B3F-A46A-168F38A5EE4C}
// *********************************************************************//
  ITBasicCallControl2Disp = dispinterface
    ['{161A4A56-1E99-4B3F-A46A-168F38A5EE4C}']
    function RequestTerminal(const bstrTerminalClassGUID: WideString; lMediaType: Integer; 
                             Direction: TERMINAL_DIRECTION): ITTerminal; dispid 131095;
    procedure SelectTerminalOnCall(const pTerminal: ITTerminal); dispid 131096;
    procedure UnselectTerminalOnCall(const pTerminal: ITTerminal); dispid 131097;
    procedure Connect(fSync: WordBool); dispid 131075;
    procedure Answer; dispid 131076;
    procedure Disconnect(code: DISCONNECT_CODE); dispid 131077;
    procedure Hold(fHold: WordBool); dispid 131078;
    procedure HandoffDirect(const pApplicationName: WideString); dispid 131079;
    procedure HandoffIndirect(lMediaType: Integer); dispid 131080;
    procedure Conference(const pCall: ITBasicCallControl; fSync: WordBool); dispid 131081;
    procedure Transfer(const pCall: ITBasicCallControl; fSync: WordBool); dispid 131082;
    procedure BlindTransfer(const pDestAddress: WideString); dispid 131083;
    procedure SwapHold(const pCall: ITBasicCallControl); dispid 131084;
    procedure ParkDirect(const pParkAddress: WideString); dispid 131085;
    function ParkIndirect: WideString; dispid 131086;
    procedure Unpark; dispid 131087;
    procedure SetQOS(lMediaType: Integer; ServiceLevel: QOS_SERVICE_LEVEL); dispid 131088;
    procedure Pickup(const pGroupID: WideString); dispid 131091;
    procedure Dial(const pDestAddress: WideString); dispid 131092;
    procedure Finish(finishMode: FINISH_MODE); dispid 131093;
    procedure RemoveFromConference; dispid 131094;
  end;

// *********************************************************************//
// Interface: ITAutomatedPhoneControl
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1EE1AF0E-6159-4A61-B79B-6A4BA3FC9DFC}
// *********************************************************************//
  ITAutomatedPhoneControl = interface(IDispatch)
    ['{1EE1AF0E-6159-4A61-B79B-6A4BA3FC9DFC}']
    procedure StartTone(Tone: PHONE_TONE; lDuration: Integer); safecall;
    procedure StopTone; safecall;
    function Get_Tone: PHONE_TONE; safecall;
    procedure StartRinger(lRingMode: Integer; lDuration: Integer); safecall;
    procedure StopRinger; safecall;
    function Get_Ringer: WordBool; safecall;
    procedure Set_PhoneHandlingEnabled(pfEnabled: WordBool); safecall;
    function Get_PhoneHandlingEnabled: WordBool; safecall;
    procedure Set_AutoEndOfNumberTimeout(plTimeout: Integer); safecall;
    function Get_AutoEndOfNumberTimeout: Integer; safecall;
    procedure Set_AutoDialtone(pfEnabled: WordBool); safecall;
    function Get_AutoDialtone: WordBool; safecall;
    procedure Set_AutoStopTonesOnOnHook(pfEnabled: WordBool); safecall;
    function Get_AutoStopTonesOnOnHook: WordBool; safecall;
    procedure Set_AutoStopRingOnOffHook(pfEnabled: WordBool); safecall;
    function Get_AutoStopRingOnOffHook: WordBool; safecall;
    procedure Set_AutoKeypadTones(pfEnabled: WordBool); safecall;
    function Get_AutoKeypadTones: WordBool; safecall;
    procedure Set_AutoKeypadTonesMinimumDuration(plDuration: Integer); safecall;
    function Get_AutoKeypadTonesMinimumDuration: Integer; safecall;
    procedure Set_AutoVolumeControl(fEnabled: WordBool); safecall;
    function Get_AutoVolumeControl: WordBool; safecall;
    procedure Set_AutoVolumeControlStep(plStepSize: Integer); safecall;
    function Get_AutoVolumeControlStep: Integer; safecall;
    procedure Set_AutoVolumeControlRepeatDelay(plDelay: Integer); safecall;
    function Get_AutoVolumeControlRepeatDelay: Integer; safecall;
    procedure Set_AutoVolumeControlRepeatPeriod(plPeriod: Integer); safecall;
    function Get_AutoVolumeControlRepeatPeriod: Integer; safecall;
    procedure SelectCall(const pCall: ITCallInfo; fSelectDefaultTerminals: WordBool); safecall;
    procedure UnselectCall(const pCall: ITCallInfo); safecall;
    function EnumerateSelectedCalls: IEnumCall; safecall;
    function Get_SelectedCalls: OleVariant; safecall;
    property Tone: PHONE_TONE read Get_Tone;
    property Ringer: WordBool read Get_Ringer;
    property PhoneHandlingEnabled: WordBool read Get_PhoneHandlingEnabled write Set_PhoneHandlingEnabled;
    property AutoEndOfNumberTimeout: Integer read Get_AutoEndOfNumberTimeout write Set_AutoEndOfNumberTimeout;
    property AutoDialtone: WordBool read Get_AutoDialtone write Set_AutoDialtone;
    property AutoStopTonesOnOnHook: WordBool read Get_AutoStopTonesOnOnHook write Set_AutoStopTonesOnOnHook;
    property AutoStopRingOnOffHook: WordBool read Get_AutoStopRingOnOffHook write Set_AutoStopRingOnOffHook;
    property AutoKeypadTones: WordBool read Get_AutoKeypadTones write Set_AutoKeypadTones;
    property AutoKeypadTonesMinimumDuration: Integer read Get_AutoKeypadTonesMinimumDuration write Set_AutoKeypadTonesMinimumDuration;
    property AutoVolumeControl: WordBool read Get_AutoVolumeControl write Set_AutoVolumeControl;
    property AutoVolumeControlStep: Integer read Get_AutoVolumeControlStep write Set_AutoVolumeControlStep;
    property AutoVolumeControlRepeatDelay: Integer read Get_AutoVolumeControlRepeatDelay write Set_AutoVolumeControlRepeatDelay;
    property AutoVolumeControlRepeatPeriod: Integer read Get_AutoVolumeControlRepeatPeriod write Set_AutoVolumeControlRepeatPeriod;
    property SelectedCalls: OleVariant read Get_SelectedCalls;
  end;

// *********************************************************************//
// DispIntf:  ITAutomatedPhoneControlDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1EE1AF0E-6159-4A61-B79B-6A4BA3FC9DFC}
// *********************************************************************//
  ITAutomatedPhoneControlDisp = dispinterface
    ['{1EE1AF0E-6159-4A61-B79B-6A4BA3FC9DFC}']
    procedure StartTone(Tone: PHONE_TONE; lDuration: Integer); dispid 131073;
    procedure StopTone; dispid 131074;
    property Tone: PHONE_TONE readonly dispid 131075;
    procedure StartRinger(lRingMode: Integer; lDuration: Integer); dispid 131076;
    procedure StopRinger; dispid 131077;
    property Ringer: WordBool readonly dispid 131078;
    property PhoneHandlingEnabled: WordBool dispid 131079;
    property AutoEndOfNumberTimeout: Integer dispid 131080;
    property AutoDialtone: WordBool dispid 131081;
    property AutoStopTonesOnOnHook: WordBool dispid 131082;
    property AutoStopRingOnOffHook: WordBool dispid 131083;
    property AutoKeypadTones: WordBool dispid 131084;
    property AutoKeypadTonesMinimumDuration: Integer dispid 131085;
    property AutoVolumeControl: WordBool dispid 131086;
    property AutoVolumeControlStep: Integer dispid 131087;
    property AutoVolumeControlRepeatDelay: Integer dispid 131088;
    property AutoVolumeControlRepeatPeriod: Integer dispid 131089;
    procedure SelectCall(const pCall: ITCallInfo; fSelectDefaultTerminals: WordBool); dispid 131090;
    procedure UnselectCall(const pCall: ITCallInfo); dispid 131091;
    function EnumerateSelectedCalls: IEnumCall; dispid 131092;
    property SelectedCalls: OleVariant readonly dispid 131093;
  end;

// *********************************************************************//
// Interface: ITMediaControl
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C445DDE8-5199-4BC7-9807-5FFB92E42E09}
// *********************************************************************//
  ITMediaControl = interface(IDispatch)
    ['{C445DDE8-5199-4BC7-9807-5FFB92E42E09}']
    procedure Start; safecall;
    procedure Stop; safecall;
    procedure Pause; safecall;
    function Get_MediaState: TERMINAL_MEDIA_STATE; safecall;
    property MediaState: TERMINAL_MEDIA_STATE read Get_MediaState;
  end;

// *********************************************************************//
// DispIntf:  ITMediaControlDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C445DDE8-5199-4BC7-9807-5FFB92E42E09}
// *********************************************************************//
  ITMediaControlDisp = dispinterface
    ['{C445DDE8-5199-4BC7-9807-5FFB92E42E09}']
    procedure Start; dispid 131073;
    procedure Stop; dispid 131074;
    procedure Pause; dispid 131075;
    property MediaState: TERMINAL_MEDIA_STATE readonly dispid 131076;
  end;

// *********************************************************************//
// Interface: ITFileTrack
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {31CA6EA9-C08A-4BEA-8811-8E9C1BA3EA3A}
// *********************************************************************//
  ITFileTrack = interface(IDispatch)
    ['{31CA6EA9-C08A-4BEA-8811-8E9C1BA3EA3A}']
    function Get_Format: PUserType3; safecall;
    procedure Set_Format(ppmt: PUserType3); safecall;
    function Get_ControllingTerminal: ITTerminal; safecall;
    function Get_AudioFormatForScripting: ITScriptableAudioFormat; safecall;
    procedure Set_AudioFormatForScripting(const ppAudioFormat: ITScriptableAudioFormat); safecall;
    function Get_EmptyAudioFormatForScripting: ITScriptableAudioFormat; safecall;
    property Format: PUserType3 read Get_Format write Set_Format;
    property ControllingTerminal: ITTerminal read Get_ControllingTerminal;
    property AudioFormatForScripting: ITScriptableAudioFormat read Get_AudioFormatForScripting write Set_AudioFormatForScripting;
    property EmptyAudioFormatForScripting: ITScriptableAudioFormat read Get_EmptyAudioFormatForScripting;
  end;

// *********************************************************************//
// DispIntf:  ITFileTrackDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {31CA6EA9-C08A-4BEA-8811-8E9C1BA3EA3A}
// *********************************************************************//
  ITFileTrackDisp = dispinterface
    ['{31CA6EA9-C08A-4BEA-8811-8E9C1BA3EA3A}']
    property Format: {??PUserType3}OleVariant dispid 65537;
    property ControllingTerminal: ITTerminal readonly dispid 65538;
    property AudioFormatForScripting: ITScriptableAudioFormat dispid 65539;
    property EmptyAudioFormatForScripting: ITScriptableAudioFormat readonly dispid 65541;
  end;

// *********************************************************************//
// Interface: ITScriptableAudioFormat
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B87658BD-3C59-4F64-BE74-AEDE3E86A81E}
// *********************************************************************//
  ITScriptableAudioFormat = interface(IDispatch)
    ['{B87658BD-3C59-4F64-BE74-AEDE3E86A81E}']
    function Get_Channels: Integer; safecall;
    procedure Set_Channels(pVal: Integer); safecall;
    function Get_SamplesPerSec: Integer; safecall;
    procedure Set_SamplesPerSec(pVal: Integer); safecall;
    function Get_AvgBytesPerSec: Integer; safecall;
    procedure Set_AvgBytesPerSec(pVal: Integer); safecall;
    function Get_BlockAlign: Integer; safecall;
    procedure Set_BlockAlign(pVal: Integer); safecall;
    function Get_BitsPerSample: Integer; safecall;
    procedure Set_BitsPerSample(pVal: Integer); safecall;
    function Get_FormatTag: Integer; safecall;
    procedure Set_FormatTag(pVal: Integer); safecall;
    property Channels: Integer read Get_Channels write Set_Channels;
    property SamplesPerSec: Integer read Get_SamplesPerSec write Set_SamplesPerSec;
    property AvgBytesPerSec: Integer read Get_AvgBytesPerSec write Set_AvgBytesPerSec;
    property BlockAlign: Integer read Get_BlockAlign write Set_BlockAlign;
    property BitsPerSample: Integer read Get_BitsPerSample write Set_BitsPerSample;
    property FormatTag: Integer read Get_FormatTag write Set_FormatTag;
  end;

// *********************************************************************//
// DispIntf:  ITScriptableAudioFormatDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B87658BD-3C59-4F64-BE74-AEDE3E86A81E}
// *********************************************************************//
  ITScriptableAudioFormatDisp = dispinterface
    ['{B87658BD-3C59-4F64-BE74-AEDE3E86A81E}']
    property Channels: Integer dispid 1;
    property SamplesPerSec: Integer dispid 2;
    property AvgBytesPerSec: Integer dispid 3;
    property BlockAlign: Integer dispid 4;
    property BitsPerSample: Integer dispid 5;
    property FormatTag: Integer dispid 6;
  end;

// *********************************************************************//
// Interface: ITCallInfo2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {94D70CA6-7AB0-4DAA-81CA-B8F8643FAEC1}
// *********************************************************************//
  ITCallInfo2 = interface(ITCallInfo)
    ['{94D70CA6-7AB0-4DAA-81CA-B8F8643FAEC1}']
    function Get_EventFilter(TapiEvent: TAPI_EVENT; lSubEvent: Integer): WordBool; safecall;
    procedure Set_EventFilter(TapiEvent: TAPI_EVENT; lSubEvent: Integer; pEnable: WordBool); safecall;
    property EventFilter[TapiEvent: TAPI_EVENT; lSubEvent: Integer]: WordBool read Get_EventFilter write Set_EventFilter;
  end;

// *********************************************************************//
// DispIntf:  ITCallInfo2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {94D70CA6-7AB0-4DAA-81CA-B8F8643FAEC1}
// *********************************************************************//
  ITCallInfo2Disp = dispinterface
    ['{94D70CA6-7AB0-4DAA-81CA-B8F8643FAEC1}']
    property EventFilter[TapiEvent: TAPI_EVENT; lSubEvent: Integer]: WordBool dispid 65547;
    property Address: ITAddress readonly dispid 65537;
    property CallState: CALL_STATE readonly dispid 65538;
    property Privilege: CALL_PRIVILEGE readonly dispid 65539;
    property CallHub: ITCallHub readonly dispid 65540;
    property CallInfoLong[CallInfoLong: CALLINFO_LONG]: Integer dispid 65541;
    property CallInfoString[CallInfoString: CALLINFO_STRING]: WideString dispid 65542;
    property CallInfoBuffer[CallInfoBuffer: CALLINFO_BUFFER]: OleVariant dispid 65543;
    procedure GetCallInfoBuffer(CallInfoBuffer: CALLINFO_BUFFER; out pdwSize: LongWord; 
                                out ppCallInfoBuffer: {??PByte1}OleVariant); dispid 65544;
    procedure SetCallInfoBuffer(CallInfoBuffer: CALLINFO_BUFFER; dwSize: LongWord; 
                                var pCallInfoBuffer: Byte); dispid 65545;
    procedure ReleaseUserUserInfo; dispid 65546;
  end;

// *********************************************************************//
// Interface: ITFileTerminalEvent
// Flags:     (4352) OleAutomation Dispatchable
// GUID:      {E4A7FBAC-8C17-4427-9F55-9F589AC8AF00}
// *********************************************************************//
  ITFileTerminalEvent = interface(IDispatch)
    ['{E4A7FBAC-8C17-4427-9F55-9F589AC8AF00}']
    function Get_Terminal(out ppTerminal: ITTerminal): HResult; stdcall;
    function Get_Track(out ppTrackTerminal: ITFileTrack): HResult; stdcall;
    function Get_Call(out ppCall: ITCallInfo): HResult; stdcall;
    function Get_State(out pState: TERMINAL_MEDIA_STATE): HResult; stdcall;
    function Get_Cause(out pCause: FT_STATE_EVENT_CAUSE): HResult; stdcall;
    function Get_Error(out phrErrorCode: HResult): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITToneTerminalEvent
// Flags:     (4352) OleAutomation Dispatchable
// GUID:      {E6F56009-611F-4945-BBD2-2D0CE5612056}
// *********************************************************************//
  ITToneTerminalEvent = interface(IDispatch)
    ['{E6F56009-611F-4945-BBD2-2D0CE5612056}']
    function Get_Terminal(out ppTerminal: ITTerminal): HResult; stdcall;
    function Get_Call(out ppCall: ITCallInfo): HResult; stdcall;
    function Get_Error(out phrErrorCode: HResult): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITASRTerminalEvent
// Flags:     (4352) OleAutomation Dispatchable
// GUID:      {EE016A02-4FA9-467C-933F-5A15B12377D7}
// *********************************************************************//
  ITASRTerminalEvent = interface(IDispatch)
    ['{EE016A02-4FA9-467C-933F-5A15B12377D7}']
    function Get_Terminal(out ppTerminal: ITTerminal): HResult; stdcall;
    function Get_Call(out ppCall: ITCallInfo): HResult; stdcall;
    function Get_Error(out phrErrorCode: HResult): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITTTSTerminalEvent
// Flags:     (4352) OleAutomation Dispatchable
// GUID:      {D964788F-95A5-461D-AB0C-B9900A6C2713}
// *********************************************************************//
  ITTTSTerminalEvent = interface(IDispatch)
    ['{D964788F-95A5-461D-AB0C-B9900A6C2713}']
    function Get_Terminal(out ppTerminal: ITTerminal): HResult; stdcall;
    function Get_Call(out ppCall: ITCallInfo): HResult; stdcall;
    function Get_Error(out phrErrorCode: HResult): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITPhoneEvent
// Flags:     (4352) OleAutomation Dispatchable
// GUID:      {8F942DD8-64ED-4AAF-A77D-B23DB0837EAD}
// *********************************************************************//
  ITPhoneEvent = interface(IDispatch)
    ['{8F942DD8-64ED-4AAF-A77D-B23DB0837EAD}']
    function Get_Phone(out ppPhone: ITPhone): HResult; stdcall;
    function Get_Event(out pEvent: PHONE_EVENT): HResult; stdcall;
    function Get_ButtonState(out pState: PHONE_BUTTON_STATE): HResult; stdcall;
    function Get_HookSwitchState(out pState: PHONE_HOOK_SWITCH_STATE): HResult; stdcall;
    function Get_HookSwitchDevice(out pDevice: PHONE_HOOK_SWITCH_DEVICE): HResult; stdcall;
    function Get_RingMode(out plRingMode: Integer): HResult; stdcall;
    function Get_ButtonLampId(out plButtonLampId: Integer): HResult; stdcall;
    function Get_NumberGathered(out ppNumber: WideString): HResult; stdcall;
    function Get_Call(out ppCallInfo: ITCallInfo): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITPhoneDeviceSpecificEvent
// Flags:     (4352) OleAutomation Dispatchable
// GUID:      {63FFB2A6-872B-4CD3-A501-326E8FB40AF7}
// *********************************************************************//
  ITPhoneDeviceSpecificEvent = interface(IDispatch)
    ['{63FFB2A6-872B-4CD3-A501-326E8FB40AF7}']
    function Get_Phone(out ppPhone: ITPhone): HResult; stdcall;
    function Get_lParam1(out pParam1: Integer): HResult; stdcall;
    function Get_lParam2(out pParam2: Integer): HResult; stdcall;
    function Get_lParam3(out pParam3: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITLegacyWaveSupport
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {207823EA-E252-11D2-B77E-0080C7135381}
// *********************************************************************//
  ITLegacyWaveSupport = interface(IDispatch)
    ['{207823EA-E252-11D2-B77E-0080C7135381}']
    procedure IsFullDuplex(out pSupport: FULLDUPLEX_SUPPORT); safecall;
  end;

// *********************************************************************//
// DispIntf:  ITLegacyWaveSupportDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {207823EA-E252-11D2-B77E-0080C7135381}
// *********************************************************************//
  ITLegacyWaveSupportDisp = dispinterface
    ['{207823EA-E252-11D2-B77E-0080C7135381}']
    procedure IsFullDuplex(out pSupport: FULLDUPLEX_SUPPORT); dispid 1610743808;
  end;

// *********************************************************************//
// DispIntf:  ITTAPIDispatchEventNotification
// Flags:     (4096) Dispatchable
// GUID:      {9F34325B-7E62-11D2-9457-00C04F8EC888}
// *********************************************************************//
  ITTAPIDispatchEventNotification = dispinterface
    ['{9F34325B-7E62-11D2-9457-00C04F8EC888}']
    procedure Event(TapiEvent: TAPI_EVENT; const pEvent: IDispatch); dispid 1;
  end;

// *********************************************************************//
// Interface: ITDispatchMapper
// Flags:     (4096) Dispatchable
// GUID:      {E9225295-C759-11D1-A02B-00C04FB6809F}
// *********************************************************************//
  ITDispatchMapper = interface(IDispatch)
    ['{E9225295-C759-11D1-A02B-00C04FB6809F}']
    function QueryDispatchInterface(const pIID: WideString; const pInterfaceToMap: IDispatch; 
                                    out ppReturnedInterface: IDispatch): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITRequest
// Flags:     (4352) OleAutomation Dispatchable
// GUID:      {AC48FFDF-F8C4-11D1-A030-00C04FB6809F}
// *********************************************************************//
  ITRequest = interface(IDispatch)
    ['{AC48FFDF-F8C4-11D1-A030-00C04FB6809F}']
    function MakeCall(const pDestAddress: WideString; const pAppName: WideString; 
                      const pCalledParty: WideString; const pComment: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// The Class CoTAPI provides a Create and CreateRemote method to          
// create instances of the default interface ITTAPI exposed by              
// the CoClass TAPI. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTAPI = class
    class function Create: ITTAPI;
    class function CreateRemote(const MachineName: string): ITTAPI;
  end;

  TTAPIEvent = procedure(ASender: TObject; TapiEvent: TAPI_EVENT; const pEvent: IDispatch) of object;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TTAPI
// Help String      : TAPI 3.0 TAPI Object
// Default Interface: ITTAPI
// Def. Intf. DISP? : No
// Event   Interface: ITTAPIDispatchEventNotification
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TTAPIProperties= class;
{$ENDIF}
  TTAPI = class(TOleServer)
  private
    FOnEvent: TTAPIEvent;
    FIntf:        ITTAPI;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TTAPIProperties;
    function      GetServerProperties: TTAPIProperties;
{$ENDIF}
    function      GetDefaultInterface: ITTAPI;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
    function Get_Addresses: OleVariant;
    function Get_CallHubs: OleVariant;
    function Get_PrivateTAPIObjects: OleVariant;
    procedure Set_EventFilter(plFilterMask: Integer);
    function Get_EventFilter: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ITTAPI);
    procedure Disconnect; override;
    procedure Initialize;
    procedure Shutdown;
    function EnumerateAddresses: IEnumAddress;
    function RegisterCallNotifications(const pAddress: ITAddress; fMonitor: WordBool; 
                                       fOwner: WordBool; lMediaTypes: Integer; 
                                       lCallbackInstance: Integer): Integer;
    procedure UnregisterNotifications(lRegister: Integer);
    function EnumerateCallHubs: IEnumCallHub;
    procedure SetCallHubTracking(pAddresses: OleVariant; bTracking: WordBool);
    procedure EnumeratePrivateTAPIObjects(out ppEnumUnknown: IEnumUnknown);
    procedure RegisterRequestRecipient(lRegistrationInstance: Integer; lRequestMode: Integer; 
                                       fEnable: WordBool);
    procedure SetAssistedTelephonyPriority(const pAppFilename: WideString; fPriority: WordBool);
    procedure SetApplicationPriority(const pAppFilename: WideString; lMediaType: Integer; 
                                     fPriority: WordBool);
    property DefaultInterface: ITTAPI read GetDefaultInterface;
    property Addresses: OleVariant read Get_Addresses;
    property CallHubs: OleVariant read Get_CallHubs;
    property PrivateTAPIObjects: OleVariant read Get_PrivateTAPIObjects;
    property EventFilter: Integer read Get_EventFilter write Set_EventFilter;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TTAPIProperties read GetServerProperties;
{$ENDIF}
    property OnEvent: TTAPIEvent read FOnEvent write FOnEvent;
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TTAPI
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TTAPIProperties = class(TPersistent)
  private
    FServer:    TTAPI;
    function    GetDefaultInterface: ITTAPI;
    constructor Create(AServer: TTAPI);
  protected
    function Get_Addresses: OleVariant;
    function Get_CallHubs: OleVariant;
    function Get_PrivateTAPIObjects: OleVariant;
    procedure Set_EventFilter(plFilterMask: Integer);
    function Get_EventFilter: Integer;
  public
    property DefaultInterface: ITTAPI read GetDefaultInterface;
  published
    property EventFilter: Integer read Get_EventFilter write Set_EventFilter;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoDispatchMapper provides a Create and CreateRemote method to          
// create instances of the default interface ITDispatchMapper exposed by              
// the CoClass DispatchMapper. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDispatchMapper = class
    class function Create: ITDispatchMapper;
    class function CreateRemote(const MachineName: string): ITDispatchMapper;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDispatchMapper
// Help String      : TAPI 3.0 DispatchMapper Object
// Default Interface: ITDispatchMapper
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDispatchMapperProperties= class;
{$ENDIF}
  TDispatchMapper = class(TOleServer)
  private
    FIntf:        ITDispatchMapper;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TDispatchMapperProperties;
    function      GetServerProperties: TDispatchMapperProperties;
{$ENDIF}
    function      GetDefaultInterface: ITDispatchMapper;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ITDispatchMapper);
    procedure Disconnect; override;
    function QueryDispatchInterface(const pIID: WideString; const pInterfaceToMap: IDispatch; 
                                    out ppReturnedInterface: IDispatch): HResult;
    property DefaultInterface: ITDispatchMapper read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDispatchMapperProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDispatchMapper
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDispatchMapperProperties = class(TPersistent)
  private
    FServer:    TDispatchMapper;
    function    GetDefaultInterface: ITDispatchMapper;
    constructor Create(AServer: TDispatchMapper);
  protected
  public
    property DefaultInterface: ITDispatchMapper read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoRequestMakeCall provides a Create and CreateRemote method to          
// create instances of the default interface ITRequest exposed by              
// the CoClass RequestMakeCall. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRequestMakeCall = class
    class function Create: ITRequest;
    class function CreateRemote(const MachineName: string): ITRequest;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRequestMakeCall
// Help String      : TAPI 3.0 RequestMakeCall Object
// Default Interface: ITRequest
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRequestMakeCallProperties= class;
{$ENDIF}
  TRequestMakeCall = class(TOleServer)
  private
    FIntf:        ITRequest;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TRequestMakeCallProperties;
    function      GetServerProperties: TRequestMakeCallProperties;
{$ENDIF}
    function      GetDefaultInterface: ITRequest;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ITRequest);
    procedure Disconnect; override;
    function MakeCall(const pDestAddress: WideString; const pAppName: WideString; 
                      const pCalledParty: WideString; const pComment: WideString): HResult;
    property DefaultInterface: ITRequest read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRequestMakeCallProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRequestMakeCall
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRequestMakeCallProperties = class(TPersistent)
  private
    FServer:    TRequestMakeCall;
    function    GetDefaultInterface: ITRequest;
    constructor Create(AServer: TRequestMakeCall);
  protected
  public
    property DefaultInterface: ITRequest read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoTAPI.Create: ITTAPI;
begin
  Result := CreateComObject(CLASS_TAPI) as ITTAPI;
end;

class function CoTAPI.CreateRemote(const MachineName: string): ITTAPI;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TAPI) as ITTAPI;
end;

procedure TTAPI.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{21D6D48E-A88B-11D0-83DD-00AA003CCABD}';
    IntfIID:   '{B1EFC382-9355-11D0-835C-00AA003CCABD}';
    EventIID:  '{9F34325B-7E62-11D2-9457-00C04F8EC888}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TTAPI.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as ITTAPI;
  end;
end;

procedure TTAPI.ConnectTo(svrIntf: ITTAPI);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TTAPI.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TTAPI.GetDefaultInterface: ITTAPI;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TTAPI.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TTAPIProperties.Create(Self);
{$ENDIF}
end;

destructor TTAPI.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TTAPI.GetServerProperties: TTAPIProperties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TTAPI.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    1: if Assigned(FOnEvent) then
         FOnEvent(Self,
                  Params[0] {TAPI_EVENT},
                  Params[1] {const IDispatch});
  end; {case DispID}
end;

function TTAPI.Get_Addresses: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Addresses;
end;

function TTAPI.Get_CallHubs: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.CallHubs;
end;

function TTAPI.Get_PrivateTAPIObjects: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PrivateTAPIObjects;
end;

procedure TTAPI.Set_EventFilter(plFilterMask: Integer);
begin
  DefaultInterface.Set_EventFilter(plFilterMask);
end;

function TTAPI.Get_EventFilter: Integer;
begin
    Result := DefaultInterface.EventFilter;
end;

procedure TTAPI.Initialize;
begin
  DefaultInterface.Initialize;
end;

procedure TTAPI.Shutdown;
begin
  DefaultInterface.Shutdown;
end;

function TTAPI.EnumerateAddresses: IEnumAddress;
begin
  Result := DefaultInterface.EnumerateAddresses;
end;

function TTAPI.RegisterCallNotifications(const pAddress: ITAddress; fMonitor: WordBool; 
                                         fOwner: WordBool; lMediaTypes: Integer; 
                                         lCallbackInstance: Integer): Integer;
begin
  Result := DefaultInterface.RegisterCallNotifications(pAddress, fMonitor, fOwner, lMediaTypes, 
                                                       lCallbackInstance);
end;

procedure TTAPI.UnregisterNotifications(lRegister: Integer);
begin
  DefaultInterface.UnregisterNotifications(lRegister);
end;

function TTAPI.EnumerateCallHubs: IEnumCallHub;
begin
  Result := DefaultInterface.EnumerateCallHubs;
end;

procedure TTAPI.SetCallHubTracking(pAddresses: OleVariant; bTracking: WordBool);
begin
  DefaultInterface.SetCallHubTracking(pAddresses, bTracking);
end;

procedure TTAPI.EnumeratePrivateTAPIObjects(out ppEnumUnknown: IEnumUnknown);
begin
  DefaultInterface.EnumeratePrivateTAPIObjects(ppEnumUnknown);
end;

procedure TTAPI.RegisterRequestRecipient(lRegistrationInstance: Integer; lRequestMode: Integer; 
                                         fEnable: WordBool);
begin
  DefaultInterface.RegisterRequestRecipient(lRegistrationInstance, lRequestMode, fEnable);
end;

procedure TTAPI.SetAssistedTelephonyPriority(const pAppFilename: WideString; fPriority: WordBool);
begin
  DefaultInterface.SetAssistedTelephonyPriority(pAppFilename, fPriority);
end;

procedure TTAPI.SetApplicationPriority(const pAppFilename: WideString; lMediaType: Integer; 
                                       fPriority: WordBool);
begin
  DefaultInterface.SetApplicationPriority(pAppFilename, lMediaType, fPriority);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TTAPIProperties.Create(AServer: TTAPI);
begin
  inherited Create;
  FServer := AServer;
end;

function TTAPIProperties.GetDefaultInterface: ITTAPI;
begin
  Result := FServer.DefaultInterface;
end;

function TTAPIProperties.Get_Addresses: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Addresses;
end;

function TTAPIProperties.Get_CallHubs: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.CallHubs;
end;

function TTAPIProperties.Get_PrivateTAPIObjects: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PrivateTAPIObjects;
end;

procedure TTAPIProperties.Set_EventFilter(plFilterMask: Integer);
begin
  DefaultInterface.Set_EventFilter(plFilterMask);
end;

function TTAPIProperties.Get_EventFilter: Integer;
begin
    Result := DefaultInterface.EventFilter;
end;

{$ENDIF}

class function CoDispatchMapper.Create: ITDispatchMapper;
begin
  Result := CreateComObject(CLASS_DispatchMapper) as ITDispatchMapper;
end;

class function CoDispatchMapper.CreateRemote(const MachineName: string): ITDispatchMapper;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DispatchMapper) as ITDispatchMapper;
end;

procedure TDispatchMapper.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{E9225296-C759-11D1-A02B-00C04FB6809F}';
    IntfIID:   '{E9225295-C759-11D1-A02B-00C04FB6809F}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDispatchMapper.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ITDispatchMapper;
  end;
end;

procedure TDispatchMapper.ConnectTo(svrIntf: ITDispatchMapper);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDispatchMapper.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDispatchMapper.GetDefaultInterface: ITDispatchMapper;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TDispatchMapper.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDispatchMapperProperties.Create(Self);
{$ENDIF}
end;

destructor TDispatchMapper.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDispatchMapper.GetServerProperties: TDispatchMapperProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TDispatchMapper.QueryDispatchInterface(const pIID: WideString; 
                                                const pInterfaceToMap: IDispatch; 
                                                out ppReturnedInterface: IDispatch): HResult;
begin
  Result := DefaultInterface.QueryDispatchInterface(pIID, pInterfaceToMap, ppReturnedInterface);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDispatchMapperProperties.Create(AServer: TDispatchMapper);
begin
  inherited Create;
  FServer := AServer;
end;

function TDispatchMapperProperties.GetDefaultInterface: ITDispatchMapper;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoRequestMakeCall.Create: ITRequest;
begin
  Result := CreateComObject(CLASS_RequestMakeCall) as ITRequest;
end;

class function CoRequestMakeCall.CreateRemote(const MachineName: string): ITRequest;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RequestMakeCall) as ITRequest;
end;

procedure TRequestMakeCall.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{AC48FFE0-F8C4-11D1-A030-00C04FB6809F}';
    IntfIID:   '{AC48FFDF-F8C4-11D1-A030-00C04FB6809F}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRequestMakeCall.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ITRequest;
  end;
end;

procedure TRequestMakeCall.ConnectTo(svrIntf: ITRequest);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRequestMakeCall.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRequestMakeCall.GetDefaultInterface: ITRequest;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TRequestMakeCall.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRequestMakeCallProperties.Create(Self);
{$ENDIF}
end;

destructor TRequestMakeCall.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRequestMakeCall.GetServerProperties: TRequestMakeCallProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TRequestMakeCall.MakeCall(const pDestAddress: WideString; const pAppName: WideString; 
                                   const pCalledParty: WideString; const pComment: WideString): HResult;
begin
  Result := DefaultInterface.MakeCall(pDestAddress, pAppName, pCalledParty, pComment);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRequestMakeCallProperties.Create(AServer: TRequestMakeCall);
begin
  inherited Create;
  FServer := AServer;
end;

function TRequestMakeCallProperties.GetDefaultInterface: ITRequest;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TTAPI, TDispatchMapper, TRequestMakeCall]);
end;

end.
