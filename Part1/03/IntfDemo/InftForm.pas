unit InftForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    btnRunner: TButton;
    btnAthlete: TButton;
    btnClear: TButton;
    btnMyJumper: TButton;
    procedure btnRunnerClick(Sender: TObject);
    procedure btnAthleteClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnMyJumperClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Log (str: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  WalkIntf;

procedure TForm1.btnRunnerClick(Sender: TObject);
var
  W1: IWalker;
begin
  W1 := TRunner.Create;
  Log ('TRunner.Create');
  Log (W1.Run);
  Log (W1.Walk);
  Log (W1.Run);
  Log ('');
end;

procedure TForm1.Log(str: string);
begin
  ListBox1.Items.Add (str);
end;

procedure TForm1.btnAthleteClick(Sender: TObject);
var
  W1: IWalker;
  J1: IJumper;
begin
  W1 := TAthlete.Create;
  Log ('TAthlete.Create');
  Log (W1.Run);
  Log (W1.Walk);
  Log (W1.Run);
  Log ((W1 as IJumper).Jump);
  J1 := W1 as IJumper;
  Log (J1.Walk);
  Log ('');
end;

procedure TForm1.btnClearClick(Sender: TObject);
begin
  ListBox1.Clear;
end;

procedure TForm1.btnMyJumperClick(Sender: TObject);
var
  J1: IJumper;
begin
  J1 := TMyJumper.Create;
  Log ('TMyJumper.Create');
  Log (J1.Walk);
  Log (J1.Jump);
  Log (J1.Walk);
  Log ('');
end;

end.
