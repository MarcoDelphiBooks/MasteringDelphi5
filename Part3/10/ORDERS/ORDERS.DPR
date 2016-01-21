program Orders;

uses
  Forms,
  OrderF in 'OrderF.pas' {OrdersForm};

{$R *.RES}

begin
  Application.CreateForm(TOrdersForm, OrdersForm);
  Application.Run;
end.
