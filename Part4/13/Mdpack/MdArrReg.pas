unit MdArrReg;

interface

uses
  DsgnIntf, Classes;

type
  TArrowCategory = class (TPropertyCategory)
    class function Name: string; override;
    class function Description: string; override;
  end;

procedure Register;

implementation

uses
  MdArrow;

class function TArrowCategory.Description: string;
begin
  // optional, not displayed
  Result := 'Properties of the Mastering Delphi Arrow component';
end;

class function TArrowCategory.Name: string;
begin
  Result := 'Arrow';
end;

procedure Register;
begin
  RegisterComponents ('Md', [TMdArrow]);
  RegisterPropertyInCategory (
    TInputCategory, TMdArrow, 'OnArrowDblClick');
  RegisterPropertyInCategory (
    TArrowCategory, TMdArrow, 'Direction');
  RegisterPropertyInCategory (
    TArrowCategory, TMdArrow, 'ArrowHeight');
  RegisterPropertyInCategory (
    TArrowCategory, TMdArrow, 'Filled');
  RegisterPropertyInCategory (
    TVisualCategory, TMdArrow, 'Filled');
end;

end.
