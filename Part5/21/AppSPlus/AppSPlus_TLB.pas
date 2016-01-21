unit AppSPlus_TLB;

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

// PASTLWTR : $Revision:   1.84  $
// File generated on 8/4/99 5:16:01 PM from Type Library described below.

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
// Type Lib: C:\md5code\Part5\21\AppSPlus\AppSPlus.tlb (1)
// IID\LCID: {E31849A6-4A82-11D3-B9F1-00000100A27B}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\SYSTEM\STDOLE2.TLB)
//   (2) v4.0 StdVCL, (C:\WINDOWS\SYSTEM\STDVCL40.DLL)
//   (3) v1.0 Midas, (C:\WINDOWS\SYSTEM\MIDAS.DLL)
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
  AppSPlusMajorVersion = 1;
  AppSPlusMinorVersion = 0;

  LIBID_AppSPlus: TGUID = '{E31849A6-4A82-11D3-B9F1-00000100A27B}';

  IID_IAppServerPlus: TGUID = '{E31849A7-4A82-11D3-B9F1-00000100A27B}';
  CLASS_AppServerPlus: TGUID = '{E31849A9-4A82-11D3-B9F1-00000100A27B}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IAppServerPlus = interface;
  IAppServerPlusDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  AppServerPlus = IAppServerPlus;


// *********************************************************************//
// Interface: IAppServerPlus
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E31849A7-4A82-11D3-B9F1-00000100A27B}
// *********************************************************************//
  IAppServerPlus = interface(IAppServer)
    ['{E31849A7-4A82-11D3-B9F1-00000100A27B}']
    procedure Login(const Name: WideString; const Password: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IAppServerPlusDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E31849A7-4A82-11D3-B9F1-00000100A27B}
// *********************************************************************//
  IAppServerPlusDisp = dispinterface
    ['{E31849A7-4A82-11D3-B9F1-00000100A27B}']
    procedure Login(const Name: WideString; const Password: WideString); dispid 1;
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
// The Class CoAppServerPlus provides a Create and CreateRemote method to          
// create instances of the default interface IAppServerPlus exposed by              
// the CoClass AppServerPlus. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAppServerPlus = class
    class function Create: IAppServerPlus;
    class function CreateRemote(const MachineName: string): IAppServerPlus;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAppServerPlus
// Help String      : AppServerPlus Object
// Default Interface: IAppServerPlus
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAppServerPlusProperties= class;
{$ENDIF}
  TAppServerPlus = class(TOleServer)
  private
    FIntf:        IAppServerPlus;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TAppServerPlusProperties;
    function      GetServerProperties: TAppServerPlusProperties;
{$ENDIF}
    function      GetDefaultInterface: IAppServerPlus;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IAppServerPlus);
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
    procedure Login(const Name: WideString; const Password: WideString);
    property  DefaultInterface: IAppServerPlus read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAppServerPlusProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAppServerPlus
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAppServerPlusProperties = class(TPersistent)
  private
    FServer:    TAppServerPlus;
    function    GetDefaultInterface: IAppServerPlus;
    constructor Create(AServer: TAppServerPlus);
  protected
  public
    property DefaultInterface: IAppServerPlus read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function CoAppServerPlus.Create: IAppServerPlus;
begin
  Result := CreateComObject(CLASS_AppServerPlus) as IAppServerPlus;
end;

class function CoAppServerPlus.CreateRemote(const MachineName: string): IAppServerPlus;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AppServerPlus) as IAppServerPlus;
end;

procedure TAppServerPlus.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{E31849A9-4A82-11D3-B9F1-00000100A27B}';
    IntfIID:   '{E31849A7-4A82-11D3-B9F1-00000100A27B}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAppServerPlus.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IAppServerPlus;
  end;
end;

procedure TAppServerPlus.ConnectTo(svrIntf: IAppServerPlus);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TAppServerPlus.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TAppServerPlus.GetDefaultInterface: IAppServerPlus;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TAppServerPlus.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAppServerPlusProperties.Create(Self);
{$ENDIF}
end;

destructor TAppServerPlus.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAppServerPlus.GetServerProperties: TAppServerPlusProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TAppServerPlus.AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                                         MaxErrors: Integer; out ErrorCount: Integer; 
                                         var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_ApplyUpdates(ProviderName, Delta, MaxErrors, ErrorCount, OwnerData);
end;

function  TAppServerPlus.AS_GetRecords(const ProviderName: WideString; Count: Integer; 
                                       out RecsOut: Integer; Options: Integer; 
                                       const CommandText: WideString; var Params: OleVariant; 
                                       var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetRecords(ProviderName, Count, RecsOut, Options, CommandText, 
                                           Params, OwnerData);
end;

function  TAppServerPlus.AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_DataRequest(ProviderName, Data);
end;

function  TAppServerPlus.AS_GetProviderNames: OleVariant;
begin
  Result := DefaultInterface.AS_GetProviderNames;
end;

function  TAppServerPlus.AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetParams(ProviderName, OwnerData);
end;

function  TAppServerPlus.AS_RowRequest(const ProviderName: WideString; Row: OleVariant; 
                                       RequestType: Integer; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_RowRequest(ProviderName, Row, RequestType, OwnerData);
end;

procedure TAppServerPlus.AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                                    var Params: OleVariant; var OwnerData: OleVariant);
begin
  DefaultInterface.AS_Execute(ProviderName, CommandText, Params, OwnerData);
end;

procedure TAppServerPlus.Login(const Name: WideString; const Password: WideString);
begin
  DefaultInterface.Login(Name, Password);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAppServerPlusProperties.Create(AServer: TAppServerPlus);
begin
  inherited Create;
  FServer := AServer;
end;

function TAppServerPlusProperties.GetDefaultInterface: IAppServerPlus;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('Servers',[TAppServerPlus]);
end;

end.
