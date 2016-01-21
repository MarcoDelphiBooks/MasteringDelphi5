unit Mlist;

interface

uses
  SysUtils, Classes, Messages;

var
  MsgList: TStringList;

function GetMessageName (Msg: Integer): string; 

implementation

function GetMessageName (Msg: Integer): string;
var
  N: Integer;
begin
  N := MsgList.IndexOfObject (TObject(Msg));
  if N >= 0 then
    Result := MsgList.Strings [N]
  else if Msg >= wm_User then
    Result := 'wm_User message     '
  else
    Result := 'Unknown message     ';
end;

initialization
  MsgList := TStringList.Create;
  MsgList.AddObject ('wm_Null             ', TObject($0000));
  MsgList.AddObject ('wm_Create           ', TObject($0001));
  MsgList.AddObject ('wm_Destroy          ', TObject($0002));
  MsgList.AddObject ('wm_Move             ', TObject($0003));
  MsgList.AddObject ('wm_Size             ', TObject($0005));
  MsgList.AddObject ('wm_Activate         ', TObject($0006));
  MsgList.AddObject ('wm_SetFocus         ', TObject($0007));
  MsgList.AddObject ('wm_KillFocus        ', TObject($0008));
  MsgList.AddObject ('wm_Enable           ', TObject($000A));
  MsgList.AddObject ('wm_SetRedraw        ', TObject($000B));
  MsgList.AddObject ('wm_SetText          ', TObject($000C));
  MsgList.AddObject ('wm_GetText          ', TObject($000D));
  MsgList.AddObject ('wm_GetTextLength    ', TObject($000E));
  MsgList.AddObject ('wm_Paint            ', TObject($000F));
  MsgList.AddObject ('wm_Close            ', TObject($0010));
  MsgList.AddObject ('wm_QueryEndSession  ', TObject($0011));
  MsgList.AddObject ('wm_Quit             ', TObject($0012));
  MsgList.AddObject ('wm_QueryOpen        ', TObject($0013));
  MsgList.AddObject ('wm_EraseBkGnd       ', TObject($0014));
  MsgList.AddObject ('wm_SysColorChange   ', TObject($0015));
  MsgList.AddObject ('wm_EndSession       ', TObject($0016));
  MsgList.AddObject ('wm_SystemError      ', TObject($0017));
  MsgList.AddObject ('wm_ShowWindow       ', TObject($0018));
  MsgList.AddObject ('wm_CtlColor         ', TObject($0019));
  MsgList.AddObject ('wm_WinIniChange     ', TObject($001A));
  MsgList.AddObject ('wm_DevModeChange    ', TObject($001B));
  MsgList.AddObject ('wm_ActivateApp      ', TObject($001C));
  MsgList.AddObject ('wm_FontChange       ', TObject($001D));
  MsgList.AddObject ('wm_TimeChange       ', TObject($001E));
  MsgList.AddObject ('wm_CancelMode       ', TObject($001F));
  MsgList.AddObject ('wm_SetCursor        ', TObject($0020));
  MsgList.AddObject ('wm_MouseActivate    ', TObject($0021));
  MsgList.AddObject ('wm_ChildActivate    ', TObject($0022));
  MsgList.AddObject ('wm_QueueSync        ', TObject($0023));
  MsgList.AddObject ('wm_GetMinMaxInfo    ', TObject($0024));
  MsgList.AddObject ('wm_PaintIcon        ', TObject($0026));
  MsgList.AddObject ('wm_IconEraseBkGnd   ', TObject($0027));
  MsgList.AddObject ('wm_NextDlgCtl       ', TObject($0028));
  MsgList.AddObject ('wm_SpoolerStatus    ', TObject($002A));
  MsgList.AddObject ('wm_DrawItem         ', TObject($002B));
  MsgList.AddObject ('wm_MeasureItem      ', TObject($002C));
  MsgList.AddObject ('wm_DeleteItem       ', TObject($002D));
  MsgList.AddObject ('wm_VKeyToItem       ', TObject($002E));
  MsgList.AddObject ('wm_CharToItem       ', TObject($002F));
  MsgList.AddObject ('wm_SetFont          ', TObject($0030));
  MsgList.AddObject ('wm_GetFont          ', TObject($0031));
  MsgList.AddObject ('wm_QueryDragIcon    ', TObject($0037));
  MsgList.AddObject ('wm_CompareItem      ', TObject($0039));
  MsgList.AddObject ('wm_Compacting       ', TObject($0041));
  MsgList.AddObject ('wm_CommNotify       ', TObject($0044));
  MsgList.AddObject ('wm_WindowPosChanging', TObject($0046));
  MsgList.AddObject ('wm_WindowPosChanged ', TObject($0047));
  MsgList.AddObject ('wm_Power            ', TObject($0048));
  MsgList.AddObject ('wm_CopyData         ', TObject($004A));
  MsgList.AddObject ('wm_CancelJournal    ', TObject($004B));
  MsgList.AddObject ('wm_Notify           ', TObject($004E));
  MsgList.AddObject ('wm_StyleChanging    ', TObject($007C));
  MsgList.AddObject ('wm_StyleChanged     ', TObject($007D));
  MsgList.AddObject ('wm_GetIcon          ', TObject($007F));
  MsgList.AddObject ('wm_SetIcon          ', TObject($0080));
  MsgList.AddObject ('wm_NCCreate         ', TObject($0081));
  MsgList.AddObject ('wm_NCDestroy        ', TObject($0082));
  MsgList.AddObject ('wm_NCCalcSize       ', TObject($0083));
  MsgList.AddObject ('wm_NCHitTest        ', TObject($0084));
  MsgList.AddObject ('wm_NCPaint          ', TObject($0085));
  MsgList.AddObject ('wm_NCActivate       ', TObject($0086));
  MsgList.AddObject ('wm_GetDlgCode       ', TObject($0087));
  MsgList.AddObject ('wm_NCMouseMove      ', TObject($00A0));
  MsgList.AddObject ('wm_NCLButtonDown    ', TObject($00A1));
  MsgList.AddObject ('wm_NCLButtonUp      ', TObject($00A2));
  MsgList.AddObject ('wm_NCLButtonDblClk  ', TObject($00A3));
  MsgList.AddObject ('wm_NCRButtonDown    ', TObject($00A4));
  MsgList.AddObject ('wm_NCRButtonUp      ', TObject($00A5));
  MsgList.AddObject ('wm_NCRButtonDblClk  ', TObject($00A6));
  MsgList.AddObject ('wm_NCMButtonDown    ', TObject($00A7));
  MsgList.AddObject ('wm_NCMButtonUp      ', TObject($00A8));
  MsgList.AddObject ('wm_NCMButtonDblClk  ', TObject($00A9));
  MsgList.AddObject ('wm_KeyDown          ', TObject($0100));
  MsgList.AddObject ('wm_KeyUp            ', TObject($0101));
  MsgList.AddObject ('wm_Char             ', TObject($0102));
  MsgList.AddObject ('wm_DeadChar         ', TObject($0103));
  MsgList.AddObject ('wm_SysKeyDown       ', TObject($0104));
  MsgList.AddObject ('wm_SysKeyUp         ', TObject($0105));
  MsgList.AddObject ('wm_SysChar          ', TObject($0106));
  MsgList.AddObject ('wm_SysDeadChar      ', TObject($0107));
  MsgList.AddObject ('wm_InitDialog       ', TObject($0110));
  MsgList.AddObject ('wm_Command          ', TObject($0111));
  MsgList.AddObject ('wm_SysCommand       ', TObject($0112));
  MsgList.AddObject ('wm_Timer            ', TObject($0113));
  MsgList.AddObject ('wm_HScroll          ', TObject($0114));
  MsgList.AddObject ('wm_VScroll          ', TObject($0115));
  MsgList.AddObject ('wm_InitMenu         ', TObject($0116));
  MsgList.AddObject ('wm_InitMenuPopup    ', TObject($0117));
  MsgList.AddObject ('wm_MenuSelect       ', TObject($011F));
  MsgList.AddObject ('wm_MenuChar         ', TObject($0120));
  MsgList.AddObject ('wm_EnterIdle        ', TObject($0121));
  MsgList.AddObject ('wm_CtlColorMsgbox   ', TObject($0132));
  MsgList.AddObject ('wm_CtlColorEdit     ', TObject($0133));
  MsgList.AddObject ('wm_CtlColorListbox  ', TObject($0134));
  MsgList.AddObject ('wm_CtlColorBtn      ', TObject($0135));
  MsgList.AddObject ('wm_CtlColorDlg      ', TObject($0136));
  MsgList.AddObject ('wm_CtlColorScrollbar', TObject($0137));
  MsgList.AddObject ('wm_CtlColorStatic   ', TObject($0138));
  MsgList.AddObject ('wm_MouseMove        ', TObject($0200));
  MsgList.AddObject ('wm_LButtonDown      ', TObject($0201));
  MsgList.AddObject ('wm_LButtonUp        ', TObject($0202));
  MsgList.AddObject ('wm_LButtonDblClk    ', TObject($0203));
  MsgList.AddObject ('wm_RButtonDown      ', TObject($0204));
  MsgList.AddObject ('wm_RButtonUp        ', TObject($0205));
  MsgList.AddObject ('wm_RButtonDblClk    ', TObject($0206));
  MsgList.AddObject ('wm_MButtonDown      ', TObject($0207));
  MsgList.AddObject ('wm_MButtonUp        ', TObject($0208));
  MsgList.AddObject ('wm_MButtonDblClk    ', TObject($0209));
  MsgList.AddObject ('wm_ParentNotify     ', TObject($0210));
  MsgList.AddObject ('wm_MDICreate        ', TObject($0220));
  MsgList.AddObject ('wm_MDIDestroy       ', TObject($0221));
  MsgList.AddObject ('wm_MDIActivate      ', TObject($0222));
  MsgList.AddObject ('wm_MDIRestore       ', TObject($0223));
  MsgList.AddObject ('wm_MDINext          ', TObject($0224));
  MsgList.AddObject ('wm_MDIMaximize      ', TObject($0225));
  MsgList.AddObject ('wm_MDITile          ', TObject($0226));
  MsgList.AddObject ('wm_MDICascade       ', TObject($0227));
  MsgList.AddObject ('wm_MDIIconArrange   ', TObject($0228));
  MsgList.AddObject ('wm_MDIGetActive     ', TObject($0229));
  MsgList.AddObject ('wm_MDISetMenu       ', TObject($0230));
  MsgList.AddObject ('wm_DropFiles        ', TObject($0233));
  MsgList.AddObject ('wm_MDIRefreshMenu   ', TObject($0234));
  MsgList.AddObject ('wm_Cut              ', TObject($0300));
  MsgList.AddObject ('wm_Copy             ', TObject($0301));
  MsgList.AddObject ('wm_Paste            ', TObject($0302));
  MsgList.AddObject ('wm_Clear            ', TObject($0303));
  MsgList.AddObject ('wm_Undo             ', TObject($0304));
  MsgList.AddObject ('wm_RenderFormat     ', TObject($0305));
  MsgList.AddObject ('wm_RenderAllFormats ', TObject($0306));
  MsgList.AddObject ('wm_DestroyClipboard ', TObject($0307));
  MsgList.AddObject ('wm_DrawClipboard    ', TObject($0308));
  MsgList.AddObject ('wm_PaintClipboard   ', TObject($0309));
  MsgList.AddObject ('wm_VScrollClipboard ', TObject($030A));
  MsgList.AddObject ('wm_SizeClipboard    ', TObject($030B));
  MsgList.AddObject ('wm_AskCBFormatName  ', TObject($030C));
  MsgList.AddObject ('wm_ChangeCBChain    ', TObject($030D));
  MsgList.AddObject ('wm_HScrollClipboard ', TObject($030E));
  MsgList.AddObject ('wm_QueryNewPalette  ', TObject($030F));
  MsgList.AddObject ('wm_PaletteIsChanging', TObject($0310));
  MsgList.AddObject ('wm_PaletteChanged   ', TObject($0311));
end.
