unit ImportTlb;

// ************************************************************************ //
// WARNING                                                                  //
// -------                                                                  //
// The types declared in this file were generated from data read from a     //
// Type Library. If this type library is explicitly or indirectly (via      //
// another type library referring to this type library) re-imported, or the //
// 'Refresh' command of the Type Library Editor activated while editing the //
// Type Library, the contents of this file will be regenerated and all      //
// manual modifications will be lost.                                       //
// ************************************************************************ //

// *********************************************************************//
// HelpString: Project1 Library
// Version:    1.0
// *********************************************************************//

interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:      //
//   Type Libraries     : LIBID_xxxx                                    //
//   CoClasses          : CLSID_xxxx                                    //
//   DISPInterfaces     : DIID_xxxx                                     //
//   Non-DISP interfaces: IID_xxxx                                      //
// *********************************************************************//
const
  LIBID_ListServ: TGUID = '{323C4A83-E400-11D1-B9F1-004845400FAA}';
  IID_IListServer: TGUID = '{323C4A84-E400-11D1-B9F1-004845400FAA}';
  CLASS_ListServer: TGUID = '{323C4A86-E400-11D1-B9F1-004845400FAA}';

// *********************************************************************//
// Forward declaration of interfaces defined in Type Library            //
// *********************************************************************//
type
  IListServer = interface;
  IListServerDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                     //
// (NOTE: Here we map each CoClass to it's Default Interface            //
// *********************************************************************//
  ListServer = IListServer;

  IListServer = interface(IDispatch)
    ['{323C4A84-E400-11D1-B9F1-004845400FAA}']
    function Get_Items: IStrings; safecall;
    procedure Set_Items(const Value: IStrings); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    property Items: IStrings read Get_Items write Set_Items;
    property Font: IFontDisp read Get_Font write Set_Font;
  end;

// Dispinterface declaration for dual interface IListServer

  IListServerDisp = dispinterface
    ['{323C4A84-E400-11D1-B9F1-004845400FAA}']
    property Items: IStrings dispid 1;
    property Font: IFontDisp dispid 2;
  end;

  CoListServer = class
    class function Create: IListServer;
    class function CreateRemote(const MachineName: string): IListServer;
  end;

implementation

uses ComObj;

class function CoListServer.Create: IListServer;
begin
  Result := CreateComObject(CLASS_ListServer) as IListServer;
end;

class function CoListServer.CreateRemote(const MachineName: string): IListServer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ListServer) as IListServer;
end;

end.
