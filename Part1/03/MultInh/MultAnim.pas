unit MultAnim;

interface

type
  IAnimal = interface
    ['{248CC900-64CB-11D1-98D1-004845400FAA}']
    function Kind: string;
  end;

  ICanFly = interface (IAnimal)
    ['{248CC901-64CB-11D1-98D1-004845400FAA}']
    function Fly: string;
  end;

  ICanWalk = interface (IAnimal)
    ['{248CC902-64CB-11D1-98D1-004845400FAA}']
    function Walk: string;
  end;

  ICanSwim = interface (IAnimal)
    ['{248CC903-64CB-11D1-98D1-004845400FAA}']
    function Swim: string;
  end;

  IMammal = interface (IAnimal)
    ['{248CC904-64CB-11D1-98D1-004845400FAA}']
    function CarryChild: string;
  end;

  IBird = interface (IAnimal)
    ['{248CC905-64CB-11D1-98D1-004845400FAA}']
    function LayEggs: string;
  end;

  TAnimal = class (TInterfacedObject, IAnimal)
    function Kind: string; virtual; abstract;
    destructor Destroy; override;    
  end;

  TMammal = class (TAnimal, IMammal)
    function CarryChild: string; virtual;
  end;

  TBird = class (TAnimal, IBird)
    function LayEggs: string; virtual;
  end;

  TEagle = class (TBird, ICanFly)
    function Kind: string; override;
    function Fly: string; virtual;
  end;

  TPenguin = class (TBird, ICanWalk, ICanSwim)
    function Kind: string; override;
    function Walk: string; virtual;
    function Swim: string; virtual;
  end;

  TDuck = class (TBird, ICanWalk, ICanFly, ICanSwim)
    function Kind: string; override;
    function Walk: string; virtual;
    function Fly: string; virtual;
    function Swim: string; virtual;
  end;

  TBat = class (TMammal, ICanFly)
    function Kind: string; override;
    function Fly: string; virtual;
  end;

  TMonkey = class (TMammal, ICanWalk)
    function Kind: string; override;
    function Walk: string; virtual;
  end;

implementation

uses
  Windows;

destructor TAnimal.Destroy;
begin
  // MessageBox (0, pChar ('Destroying ' + Kind),
  //   'Anim MI', MB_OK);
  inherited;
end;

function TMammal.CarryChild: string;
begin
  Result := 'Female mammals carry children for months';
end;

function TBird.LayEggs: string;
begin
  Result := 'Birds lay eggs';
end;

function TEagle.Kind: string;
begin
  Result := 'Eagle';
end;

function TEagle.Fly: string;
begin
  Result := 'Eagles fly over mountains';
end;

function TPenguin.Kind: string;
begin
  Result := 'Penguin';
end;

function TPenguin.Walk: string;
begin
  Result := 'Penguins walk on ice';
end;

function TPenguin.Swim: string;
begin
  Result := 'Penguins swim better than they walk';
end;

function TBat.Kind: string;
begin
  Result := 'Bat';
end;

function TBat.Fly: string;
begin
  Result := 'Bats fly in the night';
end;

function TDuck.Kind: string;
begin
  Result := 'Duck';
end;

function TDuck.Walk: string;
begin
  Result := 'Ducks walk in a funny way';
end;

function TDuck.Fly: string;
begin
  Result := 'Ducks fly and migrate';
end;

function TDuck.Swim: string;
begin
  Result := 'Ducks swim as well';
end;

function TMonkey.Kind: string;
begin
  Result := 'Monkey';
end;

function TMonkey.Walk: string;
begin
  Result := 'A walking monkey';
end;

end.
