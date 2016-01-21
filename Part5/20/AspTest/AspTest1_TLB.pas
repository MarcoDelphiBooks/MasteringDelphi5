unit AspTest1_TLB;

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
// File generated on 8/3/99 12:15:54 PM from Type Library described below.

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
  AspTest1MajorVersion = 1;
  AspTest1MinorVersion = 0;

  LIBID_AspTest1: TGUID = '{1F70FA60-499C-11D3-B9F1-00000100A27B}';

  IID_Iasptest: TGUID = '{1F70FA61-499C-11D3-B9F1-00000100A27B}';
  CLASS_asptest: TGUID = '{1F70FA63-499C-11D3-B9F1-00000100A27B}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  Iasptest = interface;
  IasptestDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  asptest = Iasptest;


// *********************************************************************//
// Interface: Iasptest
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1F70FA61-499C-11D3-B9F1-00000100A27B}
// *********************************************************************//
  Iasptest = interface(IDispatch)
    ['{1F70FA61-499C-11D3-B9F1-00000100A27B}']
    procedure OnStartPage(const AScriptingContext: IUnknown); safecall;
    procedure OnEndPage; safecall;
    procedure ShowData; safecall;
  end;

// *********************************************************************//
// DispIntf:  IasptestDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1F70FA61-499C-11D3-B9F1-00000100A27B}
// *********************************************************************//
  IasptestDisp = dispinterface
    ['{1F70FA61-499C-11D3-B9F1-00000100A27B}']
    procedure OnStartPage(const AScriptingContext: IUnknown); dispid 1;
    procedure OnEndPage; dispid 2;
    procedure ShowData; dispid 3;
  end;

// *********************************************************************//
// The Class Coasptest provides a Create and CreateRemote method to          
// create instances of the default interface Iasptest exposed by              
// the CoClass asptest. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  Coasptest = class
    class function Create: Iasptest;
    class function CreateRemote(const MachineName: string): Iasptest;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : Tasptest
// Help String      : asptest Object
// Default Interface: Iasptest
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TasptestProperties= class;
{$ENDIF}
  Tasptest = class(TOleServer)
  private
    FIntf:        Iasptest;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TasptestProperties;
    function      GetServerProperties: TasptestProperties;
{$ENDIF}
    function      GetDefaultInterface: Iasptest;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: Iasptest);
    procedure Disconnect; override;
    procedure OnStartPage(const AScriptingContext: IUnknown);
    procedure OnEndPage;
    procedure ShowData;
    property  DefaultInterface: Iasptest read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TasptestProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : Tasptest
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TasptestProperties = class(TPersistent)
  private
    FServer:    Tasptest;
    function    GetDefaultInterface: Iasptest;
    constructor Create(AServer: Tasptest);
  protected
  public
    property DefaultInterface: Iasptest read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function Coasptest.Create: Iasptest;
begin
  Result := CreateComObject(CLASS_asptest) as Iasptest;
end;

class function Coasptest.CreateRemote(const MachineName: string): Iasptest;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_asptest) as Iasptest;
end;

procedure Tasptest.InitServerData;
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

procedure Tasptest.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as Iasptest;
  end;
end;

procedure Tasptest.ConnectTo(svrIntf: Iasptest);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure Tasptest.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function Tasptest.GetDefaultInterface: Iasptest;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor Tasptest.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TasptestProperties.Create(Self);
{$ENDIF}
end;

destructor Tasptest.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function Tasptest.GetServerProperties: TasptestProperties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure Tasptest.OnStartPage(const AScriptingContext: IUnknown);
begin
  DefaultInterface.OnStartPage(AScriptingContext);
end;

procedure Tasptest.OnEndPage;
begin
  DefaultInterface.OnEndPage;
end;

procedure Tasptest.ShowData;
begin
  DefaultInterface.ShowData;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TasptestProperties.Create(AServer: Tasptest);
begin
  inherited Create;
  FServer := AServer;
end;

function TasptestProperties.GetDefaultInterface: Iasptest;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('Servers',[Tasptest]);
end;

end.
