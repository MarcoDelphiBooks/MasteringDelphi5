unit TlibdemoLib_TLB;

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

// PASTLWTR : $Revision:   1.79  $
// File generated on 7/23/99 12:53:36 PM from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\md5code\Part4\15\TLIBDEMO\Tlibdemo.tlb (1)
// IID\LCID: {89855B41-8EFE-11D0-98D0-444553540000}\0
// Helpfile: 
// DepndLst: 
//   (1) v1.0 stdole, (C:\WINDOWS\SYSTEM\stdole32.tlb)
//   (2) v2.0 StdType, (C:\WINDOWS\SYSTEM\OLEPRO32.DLL)
//   (3) v1.0 StdVCL, (C:\WINDOWS\SYSTEM\STDVCL32.DLL)
// ************************************************************************ //
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  TlibdemoLibMajorVersion = 1;
  TlibdemoLibMinorVersion = 0;

  LIBID_TlibdemoLib: TGUID = '{89855B41-8EFE-11D0-98D0-444553540000}';

  IID_IFirstServer: TGUID = '{89855B42-8EFE-11D0-98D0-444553540000}';
  CLASS_FirstServer: TGUID = '{89855B43-8EFE-11D0-98D0-444553540000}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IFirstServer = interface;
  IFirstServerDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  FirstServer = IFirstServer;


// *********************************************************************//
// Interface: IFirstServer
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {89855B42-8EFE-11D0-98D0-444553540000}
// *********************************************************************//
  IFirstServer = interface(IDispatch)
    ['{89855B42-8EFE-11D0-98D0-444553540000}']
    procedure ChangeColor; safecall;
    function  Get_Value: Integer; safecall;
    procedure Set_Value(Value: Integer); safecall;
    property Value: Integer read Get_Value write Set_Value;
  end;

// *********************************************************************//
// DispIntf:  IFirstServerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {89855B42-8EFE-11D0-98D0-444553540000}
// *********************************************************************//
  IFirstServerDisp = dispinterface
    ['{89855B42-8EFE-11D0-98D0-444553540000}']
    procedure ChangeColor; dispid 1;
    property Value: Integer dispid 2;
  end;

// *********************************************************************//
// The Class CoFirstServer provides a Create and CreateRemote method to          
// create instances of the default interface IFirstServer exposed by              
// the CoClass FirstServer. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoFirstServer = class
    class function Create: IFirstServer;
    class function CreateRemote(const MachineName: string): IFirstServer;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TFirstServer
// Help String      : FirstServerObject
// Default Interface: IFirstServer
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TFirstServerProperties= class;
{$ENDIF}
  TFirstServer = class(TOleServer)
  private
    FIntf:        IFirstServer;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TFirstServerProperties;
    function      GetServerProperties: TFirstServerProperties;
{$ENDIF}
    function      GetDefaultInterface: IFirstServer;
  protected
    procedure InitServerData; override;
    function  Get_Value: Integer;
    procedure Set_Value(Value: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IFirstServer);
    procedure Disconnect; override;
    procedure ChangeColor;
    property  DefaultInterface: IFirstServer read GetDefaultInterface;
    property Value: Integer read Get_Value write Set_Value;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TFirstServerProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TFirstServer
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TFirstServerProperties = class(TPersistent)
  private
    FServer:    TFirstServer;
    function    GetDefaultInterface: IFirstServer;
    constructor Create(AServer: TFirstServer);
  protected
    function  Get_Value: Integer;
    procedure Set_Value(Value: Integer);
  public
    property DefaultInterface: IFirstServer read GetDefaultInterface;
  published
    property Value: Integer read Get_Value write Set_Value;
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function CoFirstServer.Create: IFirstServer;
begin
  Result := CreateComObject(CLASS_FirstServer) as IFirstServer;
end;

class function CoFirstServer.CreateRemote(const MachineName: string): IFirstServer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_FirstServer) as IFirstServer;
end;

procedure TFirstServer.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{89855B43-8EFE-11D0-98D0-444553540000}';
    IntfIID:   '{89855B42-8EFE-11D0-98D0-444553540000}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TFirstServer.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IFirstServer;
  end;
end;

procedure TFirstServer.ConnectTo(svrIntf: IFirstServer);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TFirstServer.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TFirstServer.GetDefaultInterface: IFirstServer;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TFirstServer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TFirstServerProperties.Create(Self);
{$ENDIF}
end;

destructor TFirstServer.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TFirstServer.GetServerProperties: TFirstServerProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TFirstServer.Get_Value: Integer;
begin
  Result := DefaultInterface.Get_Value;
end;

procedure TFirstServer.Set_Value(Value: Integer);
begin
  DefaultInterface.Set_Value(Value);
end;

procedure TFirstServer.ChangeColor;
begin
  DefaultInterface.ChangeColor;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TFirstServerProperties.Create(AServer: TFirstServer);
begin
  inherited Create;
  FServer := AServer;
end;

function TFirstServerProperties.GetDefaultInterface: IFirstServer;
begin
  Result := FServer.DefaultInterface;
end;

function  TFirstServerProperties.Get_Value: Integer;
begin
  Result := DefaultInterface.Get_Value;
end;

procedure TFirstServerProperties.Set_Value(Value: Integer);
begin
  DefaultInterface.Set_Value(Value);
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('Servers',[TFirstServer]);
end;

end.
