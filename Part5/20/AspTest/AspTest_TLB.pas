unit AspTest_TLB;

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
// File generated on 8/3/99 3:36:42 PM from Type Library described below.

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
// Type Lib: C:\md5code\Part5\20\AspTest\AspTest.tlb (1)
// IID\LCID: {1F70FA60-499C-11D3-B9F1-00000100A27B}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\SYSTEM\STDOLE2.TLB)
//   (2) v4.0 StdVCL, (C:\WINDOWS\SYSTEM\STDVCL40.DLL)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
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
  AspTestMajorVersion = 1;
  AspTestMinorVersion = 0;

  LIBID_AspTest: TGUID = '{1F70FA60-499C-11D3-B9F1-00000100A27B}';

  IID_IAspTest1: TGUID = '{1F70FA61-499C-11D3-B9F1-00000100A27B}';
  CLASS_AspTest1_: TGUID = '{1F70FA63-499C-11D3-B9F1-00000100A27B}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IAspTest1 = interface;
  IAspTest1Disp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  AspTest1_ = IAspTest1;


// *********************************************************************//
// Interface: IAspTest1
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1F70FA61-499C-11D3-B9F1-00000100A27B}
// *********************************************************************//
  IAspTest1 = interface(IDispatch)
    ['{1F70FA61-499C-11D3-B9F1-00000100A27B}']
    procedure OnStartPage(const AScriptingContext: IUnknown); safecall;
    procedure OnEndPage; safecall;
    procedure ShowData; safecall;
    procedure ShowTable; safecall;
    procedure Hello; safecall;
  end;

// *********************************************************************//
// DispIntf:  IAspTest1Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1F70FA61-499C-11D3-B9F1-00000100A27B}
// *********************************************************************//
  IAspTest1Disp = dispinterface
    ['{1F70FA61-499C-11D3-B9F1-00000100A27B}']
    procedure OnStartPage(const AScriptingContext: IUnknown); dispid 1;
    procedure OnEndPage; dispid 2;
    procedure ShowData; dispid 3;
    procedure ShowTable; dispid 4;
    procedure Hello; dispid 5;
  end;

// *********************************************************************//
// The Class CoAspTest1_ provides a Create and CreateRemote method to          
// create instances of the default interface IAspTest1 exposed by              
// the CoClass AspTest1_. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAspTest1_ = class
    class function Create: IAspTest1;
    class function CreateRemote(const MachineName: string): IAspTest1;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAspTest1_
// Help String      : asptest Object
// Default Interface: IAspTest1
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAspTest1_Properties= class;
{$ENDIF}
  TAspTest1_ = class(TOleServer)
  private
    FIntf:        IAspTest1;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TAspTest1_Properties;
    function      GetServerProperties: TAspTest1_Properties;
{$ENDIF}
    function      GetDefaultInterface: IAspTest1;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IAspTest1);
    procedure Disconnect; override;
    procedure OnStartPage(const AScriptingContext: IUnknown);
    procedure OnEndPage;
    procedure ShowData;
    procedure ShowTable;
    procedure Hello;
    property  DefaultInterface: IAspTest1 read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAspTest1_Properties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAspTest1_
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAspTest1_Properties = class(TPersistent)
  private
    FServer:    TAspTest1_;
    function    GetDefaultInterface: IAspTest1;
    constructor Create(AServer: TAspTest1_);
  protected
  public
    property DefaultInterface: IAspTest1 read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function CoAspTest1_.Create: IAspTest1;
begin
  Result := CreateComObject(CLASS_AspTest1_) as IAspTest1;
end;

class function CoAspTest1_.CreateRemote(const MachineName: string): IAspTest1;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AspTest1_) as IAspTest1;
end;

procedure TAspTest1_.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{1F70FA63-499C-11D3-B9F1-00000100A27B}';
    IntfIID:   '{1F70FA61-499C-11D3-B9F1-00000100A27B}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAspTest1_.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IAspTest1;
  end;
end;

procedure TAspTest1_.ConnectTo(svrIntf: IAspTest1);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TAspTest1_.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TAspTest1_.GetDefaultInterface: IAspTest1;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TAspTest1_.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAspTest1_Properties.Create(Self);
{$ENDIF}
end;

destructor TAspTest1_.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAspTest1_.GetServerProperties: TAspTest1_Properties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TAspTest1_.OnStartPage(const AScriptingContext: IUnknown);
begin
  DefaultInterface.OnStartPage(AScriptingContext);
end;

procedure TAspTest1_.OnEndPage;
begin
  DefaultInterface.OnEndPage;
end;

procedure TAspTest1_.ShowData;
begin
  DefaultInterface.ShowData;
end;

procedure TAspTest1_.ShowTable;
begin
  DefaultInterface.ShowTable;
end;

procedure TAspTest1_.Hello;
begin
  DefaultInterface.Hello;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAspTest1_Properties.Create(AServer: TAspTest1_);
begin
  inherited Create;
  FServer := AServer;
end;

function TAspTest1_Properties.GetDefaultInterface: IAspTest1;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('Servers',[TAspTest1_]);
end;

end.
