unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFormMain = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses MemForm;

{$R *.DFM}

procedure TFormMain.Button1Click(Sender: TObject);
begin
  if not Assigned (FormMemStatus) then
    FormMemStatus := TFormMemStatus.Create (nil);
  FormMemStatus.Show;
end;

end.
