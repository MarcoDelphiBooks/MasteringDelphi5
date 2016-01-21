unit Project1Lib;

{ Project1Lib Library }
{ Version 1.0 }

interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL;

const
  LIBID_Project1Lib: TGUID = '{89855B41-8EFE-11D0-98D0-444553540000}';

const

{ Component class GUIDs }
  Class_FirstServer: TGUID = '{89855B43-8EFE-11D0-98D0-444553540000}';

type

{ Forward declarations }
  IFirstServer = interface;
  DFirstServer = dispinterface;

{ Dispatch interface for FirstServer Object }

  IFirstServer = interface(IDispatch)
    ['{89855B42-8EFE-11D0-98D0-444553540000}']
    procedure ChangeColor; safecall;
    function Get_Value: Integer; safecall;
    procedure Set_Value(Value: Integer); safecall;
    property Value: Integer read Get_Value write Set_Value;
  end;

{ DispInterface declaration for Dual Interface IFirstServer }

  DFirstServer = dispinterface
    ['{89855B42-8EFE-11D0-98D0-444553540000}']
    procedure ChangeColor; dispid 1;
    property Value: Integer dispid 2;
  end;

{ FirstServerObject }

  FirstServer = IFirstServer;

  CoFirstServer = class
    class function Create: IFirstServer;
    class function CreateRemote(const MachineName: string): IFirstServer;
  end;



implementation

uses ComObj;

class function CoFirstServer.Create: IFirstServer;
begin
  Result := CreateComObject(Class_FirstServer) as IFirstServer;
end;

class function CoFirstServer.CreateRemote(const MachineName: string): IFirstServer;
begin
  Result := CreateRemoteComObject(MachineName, Class_FirstServer) as IFirstServer;
end;


end.
