unit AppServTwo_TLB;

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

// PASTLWTR : $Revision:   1.81  $
// File generated on 8/4/99 10:21:04 AM from Type Library described below.

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
// ************************************************************************ //
// Type Lib: C:\md5code\Part5\21\AppServ2\AppServ2.tlb (1)
// IID\LCID: {C5DDE901-2214-11D1-98D0-444553540000}\0
// Helpfile: 
// DepndLst: 
//   (1) v1.0 Midas, (C:\WINDOWS\SYSTEM\MIDAS.DLL)
//   (2) v4.0 StdVCL, (C:\WINDOWS\SYSTEM\STDVCL40.DLL)
//   (3) v2.0 stdole, (C:\WINDOWS\SYSTEM\STDOLE2.TLB)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL, 
  MIDAS;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  AppServTwoMajorVersion = 1;
  AppServTwoMinorVersion = 0;

  LIBID_AppServTwo: TGUID = '{C5DDE901-2214-11D1-98D0-444553540000}';

  IID_IRdmCount: TGUID = '{C5DDE902-2214-11D1-98D0-444553540000}';
  CLASS_RdmCount: TGUID = '{C5DDE903-2214-11D1-98D0-444553540000}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IRdmCount = interface;
  IRdmCountDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  RdmCount = IRdmCount;


// *********************************************************************//
// Interface: IRdmCount
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {C5DDE902-2214-11D1-98D0-444553540000}
// *********************************************************************//
  IRdmCount = interface(IAppServer)
    ['{C5DDE902-2214-11D1-98D0-444553540000}']
  end;

// *********************************************************************//
// DispIntf:  IRdmCountDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {C5DDE902-2214-11D1-98D0-444553540000}
// *********************************************************************//
  IRdmCountDisp = dispinterface
    ['{C5DDE902-2214-11D1-98D0-444553540000}']
    function  AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                              MaxErrors: Integer; out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function  AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                            Options: Integer; const CommandText: WideString; 
                            var Params: OleVariant; var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function  AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function  AS_GetProviderNames: OleVariant; dispid 20000003;
    function  AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function  AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                            var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoRdmCount provides a Create and CreateRemote method to          
// create instances of the default interface IRdmCount exposed by              
// the CoClass RdmCount. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRdmCount = class
    class function Create: IRdmCount;
    class function CreateRemote(const MachineName: string): IRdmCount;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRdmCount
// Help String      : RdmCountObject
// Default Interface: IRdmCount
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRdmCountProperties= class;
{$ENDIF}
  TRdmCount = class(TOleServer)
  private
    FIntf:        IRdmCount;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TRdmCountProperties;
    function      GetServerProperties: TRdmCountProperties;
{$ENDIF}
    function      GetDefaultInterface: IRdmCount;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IRdmCount);
    procedure Disconnect; override;
    function  AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                              MaxErrors: Integer; out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant;
    function  AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                            Options: Integer; const CommandText: WideString; 
                            var Params: OleVariant; var OwnerData: OleVariant): OleVariant;
    function  AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant;
    function  AS_GetProviderNames: OleVariant;
    function  AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant;
    function  AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                            var OwnerData: OleVariant): OleVariant;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant);
    property  DefaultInterface: IRdmCount read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRdmCountProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRdmCount
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRdmCountProperties = class(TPersistent)
  private
    FServer:    TRdmCount;
    function    GetDefaultInterface: IRdmCount;
    constructor Create(AServer: TRdmCount);
  protected
  public
    property DefaultInterface: IRdmCount read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function CoRdmCount.Create: IRdmCount;
begin
  Result := CreateComObject(CLASS_RdmCount) as IRdmCount;
end;

class function CoRdmCount.CreateRemote(const MachineName: string): IRdmCount;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RdmCount) as IRdmCount;
end;

procedure TRdmCount.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{C5DDE903-2214-11D1-98D0-444553540000}';
    IntfIID:   '{C5DDE902-2214-11D1-98D0-444553540000}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRdmCount.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IRdmCount;
  end;
end;

procedure TRdmCount.ConnectTo(svrIntf: IRdmCount);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRdmCount.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRdmCount.GetDefaultInterface: IRdmCount;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TRdmCount.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRdmCountProperties.Create(Self);
{$ENDIF}
end;

destructor TRdmCount.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRdmCount.GetServerProperties: TRdmCountProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TRdmCount.AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                                    MaxErrors: Integer; out ErrorCount: Integer; 
                                    var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_ApplyUpdates(ProviderName, Delta, MaxErrors, ErrorCount, OwnerData);
end;

function  TRdmCount.AS_GetRecords(const ProviderName: WideString; Count: Integer; 
                                  out RecsOut: Integer; Options: Integer; 
                                  const CommandText: WideString; var Params: OleVariant; 
                                  var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetRecords(ProviderName, Count, RecsOut, Options, CommandText, 
                                           Params, OwnerData);
end;

function  TRdmCount.AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_DataRequest(ProviderName, Data);
end;

function  TRdmCount.AS_GetProviderNames: OleVariant;
begin
  Result := DefaultInterface.AS_GetProviderNames;
end;

function  TRdmCount.AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetParams(ProviderName, OwnerData);
end;

function  TRdmCount.AS_RowRequest(const ProviderName: WideString; Row: OleVariant; 
                                  RequestType: Integer; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_RowRequest(ProviderName, Row, RequestType, OwnerData);
end;

procedure TRdmCount.AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                               var Params: OleVariant; var OwnerData: OleVariant);
begin
  DefaultInterface.AS_Execute(ProviderName, CommandText, Params, OwnerData);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRdmCountProperties.Create(AServer: TRdmCount);
begin
  inherited Create;
  FServer := AServer;
end;

function TRdmCountProperties.GetDefaultInterface: IRdmCount;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('Servers',[TRdmCount]);
end;

end.
