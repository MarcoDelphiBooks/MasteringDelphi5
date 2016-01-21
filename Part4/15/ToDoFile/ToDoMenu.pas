unit ToDoMenu;

interface

uses
  Windows, ActiveX, ComObj, ShlObj, ShellApi;

type
  TToDoMenu = class(TComObject, IUnknown, IContextMenu, IShellExtInit)
  private
    fFileName: string;
  protected
    {Declare IContextMenu methods here}
    function QueryContextMenu(Menu: HMENU; indexMenu, idCmdFirst, idCmdLast,
      uFlags: UINT): HResult; stdcall;
    function InvokeCommand(var lpici: TCMInvokeCommandInfo): HResult; stdcall;
    function GetCommandString(idCmd, uType: UINT; pwReserved: PUINT;
      pszName: LPSTR; cchMax: UINT): HResult; stdcall;
    {Declare IShellExtInit methods here}
    function IShellExtInit.Initialize = InitShellExt;
    function InitShellExt (pidlFolder: PItemIDList; lpdobj: IDataObject;
      hKeyProgID: HKEY): HResult; stdcall;
  end;

  TToDoMenuFactory = class (TComObjectFactory)
  public
    procedure UpdateRegistry (Register: Boolean); override;
  end;

const
  Class_ToDoMenuMenu: TGUID =
    '{CDF05220-DB84-11D1-B9F1-004845400FAA}';

implementation

uses
  ComServ, Messages, SysUtils, Registry;

// IShellExtInit method
function TToDoMenu.InitShellExt(pidlFolder: PItemIDList;
  lpdobj: IDataObject; hKeyProgID: HKEY): HResult; stdcall;
var
  medium: TStgMedium;
  fe: TFormatEtc;
begin
  Result := E_FAIL;
  // check if the lpdobj pointer is nil
  if Assigned (lpdobj) then
  begin
    with fe do
    begin
      cfFormat := CF_HDROP;
      ptd := nil;
      dwAspect := DVASPECT_CONTENT;
      lindex := -1;
      tymed := TYMED_HGLOBAL;
    end;
    // transform the lpdobj data to a storage medium structure
    Result := lpdobj.GetData(fe, medium);
    if not Failed (Result) then
    begin
      // check if only one file is selected
      if DragQueryFile (medium.hGlobal, $FFFFFFFF, nil, 0) = 1 then
      begin
        SetLength (fFileName, 1000);
        DragQueryFile (medium.hGlobal, 0, PChar (fFileName), 1000);
        // realign string
        fFileName := PChar (fFileName);
        Result := NOERROR;
      end
      else
        Result := E_FAIL;
    end;
    ReleaseStgMedium(medium);
  end;
end;

// context menu methods

function TToDoMenu.QueryContextMenu(Menu: HMENU;
  indexMenu, idCmdFirst, idCmdLast, uFlags: UINT): HResult;
begin
  // add entry only if the program is running
  if FindWindow ('TToDoFileForm', nil) <> 0 then
  begin
    // add a new item to context menu
    InsertMenu (Menu, indexMenu,
      MF_STRING or MF_BYPOSITION, idCmdFirst,
      'Send to ToDoFile');
    // Return number of menu items added
    Result := 1;
  end
  else
    Result := 0;
end;

function TToDoMenu.InvokeCommand(var lpici: TCMInvokeCommandInfo): HResult;
var
  hwnd: THandle;
  cds: CopyDataStruct;
begin
  Result := NOERROR;
  // Make sure we are not being called by an application
  if HiWord(Integer(lpici.lpVerb)) <> 0 then
  begin
    Result := E_FAIL;
    Exit;
  end;
  // Make sure we aren't being passed an invalid argument number
  if LoWord(lpici.lpVerb) > 0 then
  begin
    Result := E_INVALIDARG;
    Exit;
  end;
  // execute the command specified by lpici.lpVerb.
  if LoWord(lpici.lpVerb) = 0 then
  begin
    // get the handle of the window
    hwnd := FindWindow ('TToDoFileForm', nil);
    if hwnd <> 0 then
    begin
      // prepare the data to copy
      cds.dwData := 0;
      cds.cbData := length (fFileName);
      cds.lpData := PChar (fFileName);
      // activate the destination window
      SetForegroundWindow (hwnd);
      // send the data
      SendMessage (hwnd, wm_CopyData,
        lpici.hWnd, Integer (@cds));
    end
    else
    begin
      // the program should never get here
      MessageBox(lpici.hWnd,
        'FilesToDo Program not found',
        'Error',
        MB_ICONERROR or MB_OK);
    end;
  end;
end;

function TToDoMenu.GetCommandString(idCmd, uType: UINT; pwReserved: PUINT;
  pszName: LPSTR; cchMax: UINT): HRESULT;
begin
  if idCmd = 0 then
  begin
    // return help string for menu item
    strCopy (pszName, 'Add file to the ToDoFile database');
    Result := NOERROR;
  end
  else
    Result := E_INVALIDARG;
end;

{ TToDoMenuFactory methods }

procedure TToDoMenuFactory.UpdateRegistry(Register: Boolean);
var
  Reg: TRegistry;
begin
  inherited UpdateRegistry (Register);

  Reg := TRegistry.Create;
  try
    // register or remove the menu handler
    if Register then
      Reg.CreateKey (
        '\HKEY_CLASSES_ROOT\*\ShellEx\ContextMenuHandler\' +
        GUIDToString (Class_ToDoMenuMenu))
    else
      Reg.DeleteKey (
        '\HKEY_CLASSES_ROOT\*\ShellEx\ContextMenuHandler\' +
        GUIDToString (Class_ToDoMenuMenu));
  finally
    Reg.Free;
  end;
end;

initialization
  TToDoMenuFactory.Create (
    ComServer, TToDoMenu, Class_ToDoMenuMenu,
    'ToDoMenu', 'ToDoMenu Shell Extension',
    ciMultiInstance, tmApartment);
end.
