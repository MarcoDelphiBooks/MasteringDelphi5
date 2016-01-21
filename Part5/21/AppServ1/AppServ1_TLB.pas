unit AppServ1_TLB;

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
// File generated on 8/4/99 10:13:12 AM from Type Library described below.

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
// Type Lib: C:\md5code\Part5\21\AppServ1\AppServ1.tlb (1)
// IID\LCID: {09E11D60-4A55-11D3-B9F1-00000100A27B}\0
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
  AppServ1MajorVersion = 1;
  AppServ1MinorVersion = 0;

  LIBID_AppServ1: TGUID = '{09E11D60-4A55-11D3-B9F1-00000100A27B}';

  IID_IAppServerOne: TGUID = '{09E11D61-4A55-11D3-B9F1-00000100A27B}';
  CLASS_AppServerOne: TGUID = '{09E11D63-4A55-11D3-B9F1-00000100A27B}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IAppServerOne = interface;
  IAppServerOneDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  AppServerOne = IAppServerOne;


// *********************************************************************//
// Interface: IAppServerOne
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {09E11D61-4A55-11D3-B9F1-00000100A27B}
// *********************************************************************//
  IAppServerOne = interface(IAppServer)
    ['{09E11D61-4A55-11D3-B9F1-00000100A27B}']
  end;

// *********************************************************************//
// DispIntf:  IAppServerOneDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {09E11D61-4A55-11D3-B9F1-00000100A27B}
// *********************************************************************//
  IAppServerOneDisp = dispinterface
    ['{09E11D61-4A55-11D3-B9F1-00000100A27B}']
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
// The Class CoAppServerOne provides a Create and CreateRemote method to          
// create instances of the default interface IAppServerOne exposed by              
// the CoClass AppServerOne. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAppServerOne = class
    class function Create: IAppServerOne;
    class function CreateRemote(const MachineName: string): IAppServerOne;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAppServerOne
// Help String      : AppServerOne Object
// Default Interface: IAppServerOne
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAppServerOneProperties= class;
{$ENDIF}
  TAppServerOne = class(TOleServer)
  private
    FIntf:        IAppServerOne;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TAppServerOneProperties;
    function      GetServerProperties: TAppServerOneProperties;
{$ENDIF}
    function      GetDefaultInterface: IAppServerOne;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IAppServerOne);
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
    property  DefaultInterface: IAppServerOne read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAppServerOneProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAppServerOne
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAppServerOneProperties = class(TPersistent)
  private
    FServer:    TAppServerOne;
    function    GetDefaultInterface: IAppServerOne;
    constructor Create(AServer: TAppServerOne);
  protected
  public
    property DefaultInterface: IAppServerOne read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function CoAppServerOne.Create: IAppServerOne;
begin
  Result := CreateComObject(CLASS_AppServerOne) as IAppServerOne;
end;

class function CoAppServerOne.CreateRemote(const MachineName: string): IAppServerOne;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AppServerOne) as IAppServerOne;
end;

procedure TAppServerOne.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{09E11D63-4A55-11D3-B9F1-00000100A27B}';
    IntfIID:   '{09E11D61-4A55-11D3-B9F1-00000100A27B}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAppServerOne.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IAppServerOne;
  end;
end;

procedure TAppServerOne.ConnectTo(svrIntf: IAppServerOne);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TAppServerOne.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TAppServerOne.GetDefaultInterface: IAppServerOne;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TAppServerOne.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAppServerOneProperties.Create(Self);
{$ENDIF}
end;

destructor TAppServerOne.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAppServerOne.GetServerProperties: TAppServerOneProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TAppServerOne.AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                                        MaxErrors: Integer; out ErrorCount: Integer; 
                                        var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_ApplyUpdates(ProviderName, Delta, MaxErrors, ErrorCount, OwnerData);
end;

function  TAppServerOne.AS_GetRecords(const ProviderName: WideString; Count: Integer; 
                                      out RecsOut: Integer; Options: Integer; 
                                      const CommandText: WideString; var Params: OleVariant; 
                                      var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetRecords(ProviderName, Count, RecsOut, Options, CommandText, 
                                           Params, OwnerData);
end;

function  TAppServerOne.AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_DataRequest(ProviderName, Data);
end;

function  TAppServerOne.AS_GetProviderNames: OleVariant;
begin
  Result := DefaultInterface.AS_GetProviderNames;
end;

function  TAppServerOne.AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetParams(ProviderName, OwnerData);
end;

function  TAppServerOne.AS_RowRequest(const ProviderName: WideString; Row: OleVariant; 
                                      RequestType: Integer; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_RowRequest(ProviderName, Row, RequestType, OwnerData);
end;

procedure TAppServerOne.AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                                   var Params: OleVariant; var OwnerData: OleVariant);
begin
  DefaultInterface.AS_Execute(ProviderName, CommandText, Params, OwnerData);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAppServerOneProperties.Create(AServer: TAppServerOne);
begin
  inherited Create;
  FServer := AServer;
end;

function TAppServerOneProperties.GetDefaultInterface: IAppServerOne;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('Servers',[TAppServerOne]);
end;

end.
