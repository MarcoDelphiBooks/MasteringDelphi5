unit VInfoF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

type
  TLangInfoBuffer = array [1..4] of SmallInt;

procedure TForm1.Button1Click(Sender: TObject);
var
  VInfoSize, DetSize: DWord;
  pVInfo, pDetail: Pointer;
  pLangInfo: ^TLangInfoBuffer;
  strLangId: string;
begin
  Memo1.Lines.Clear;
  VInfoSize := GetFileVersionInfoSize (
    PChar (ParamStr (0)), DetSize);
  if VInfoSize > 0 then
  begin
    GetMem (pVInfo, VInfoSize);
    try
       GetFileVersionInfo (PChar (ParamStr (0)), 0,
         VInfoSize, pVInfo);
       // show the fixed information
       VerQueryValue (pVInfo, '\', pDetail, DetSize);
       with TVSFixedFileInfo (pDetail^) do
       begin
         Memo1.Lines.Add (
           'Signature (should be invariably 0xFEEFO4BD): ' +
           IntToHex (dwSignature, 8));
         Memo1.Lines.Add ('Major version number: ' +
           IntToStr (HiWord (dwFileVersionMS)));
         Memo1.Lines.Add ('Minor version number: ' +
           IntToStr (LoWord (dwFileVersionMS)));
         Memo1.Lines.Add ('Release version number: ' +
           IntToStr (HiWord (dwFileVersionLS)));
         Memo1.Lines.Add ('Build version number: ' +
           IntToStr (LoWord (dwFileVersionLS)));
         if (dwFileFlagsMask and dwFileFlags
             and VS_FF_DEBUG) <> 0 then
           Memo1.Lines.Add ('Debug info included');
         if (dwFileFlagsMask and dwFileFlags and
             VS_FF_PRERELEASE) <> 0 then
           Memo1.Lines.Add ('Pre-release (beta) version');
         if (dwFileFlagsMask and dwFileFlags and
             VS_FF_PRIVATEBUILD) <> 0 then
           Memo1.Lines.Add ('Private Build');
         if (dwFileFlagsMask and dwFileFlags and
             VS_FF_SPECIALBUILD) <> 0 then
           Memo1.Lines.Add ('Special Build');
       end;

       // get the first language
       VerQueryValue(pVInfo,
         '\VarFileInfo\Translation',
         Pointer(pLangInfo), DetSize);
       strLangId := IntToHex (SmallInt (pLangInfo^ [1]), 4) +
           IntToHex (SmallInt (pLangInfo^ [2]), 4);
       Memo1.Lines.Add ('Language: ' + strLangId);

       // show some of the strings
       strLangId := '\StringFileInfo\' + strLangId;
       VerQueryValue(pVInfo, PChar(strLangId + '\FileDescription'),
         pDetail, DetSize);
       Memo1.Lines.Add ('File Description: ' +
         PChar (pDetail));
       VerQueryValue(pVInfo, PChar(strLangId + '\FileVersion'),
         pDetail, DetSize);
       Memo1.Lines.Add ('File Version: ' + PChar (pDetail));
       VerQueryValue(pVInfo, PChar(strLangId + '\InternalName'),
         pDetail, DetSize);
       Memo1.Lines.Add ('Internal Name: ' + PChar (pDetail));
       VerQueryValue(pVInfo, PChar(strLangId + '\LegalCopyright'),
         pDetail, DetSize);
       Memo1.Lines.Add ('Legal Copyright: ' + PChar (pDetail));
       VerQueryValue(pVInfo, PChar(strLangId + '\ProductDescription'),
         pDetail, DetSize);
       Memo1.Lines.Add ('Product Name: ' + PChar (pDetail));
       VerQueryValue(pVInfo, PChar(strLangId + '\ProductVersion'),
         pDetail, DetSize);
       Memo1.Lines.Add ('Product Version: ' + PChar (pDetail));
    finally
      FreeMem (pVInfo);
    end;
  end;
end;

end.
