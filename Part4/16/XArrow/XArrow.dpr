library XArrow;

uses
  ComServ,
  XArrow_TLB in 'XArrow_TLB.pas',
  MdWArrowImpl1 in 'MdWArrowImpl1.pas' {MdWArrowX: CoClass},
  XAPPage in 'Xappage.pas' {PropertyPage1: TPropertyPage},
  MdWArrow in '..\ArrPack\MdWArrow.pas';

{$E ocx}

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
