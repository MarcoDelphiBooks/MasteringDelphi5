џ
 TMAINFORM 04  TPF0	TMainFormMainFormLeftѕ TopЩ WidthГHeight,Caption	MDI FrameColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightѓ	Font.NameSystem
Font.Style 	FormStyle	fsMDIFormMenu	MainMenu1OldCreateOrder	Position	poDefault
WindowMenuWindow1PixelsPerInch`
TextHeight TToolBarToolBar1Left Top WidthЋHeightCaptionToolBar1Images
ImageList1TabOrder  TToolButtonToolButton1Left TopAction	ActionNew  TToolButtonToolButton2LeftTopAction
ActionOpen  TToolButtonToolButton3Left.TopAction
ActionSave  TToolButtonToolButton4LeftETopActionActionClose  TToolButtonToolButton5Left\TopWidthCaptionToolButton5
ImageIndexStyletbsSeparator  TToolButtonToolButton6LeftdTopAction	ActionCut  TToolButtonToolButton7Left{TopAction
ActionCopy  TToolButtonToolButton8Left TopActionActionPaste   	TMainMenu	MainMenu1Images
ImageList1LeftTop  	TMenuItemFile1Caption&File 	TMenuItemNew1Action	ActionNew  	TMenuItemOpen1Action
ActionOpen  	TMenuItemSave2Action
ActionSave  	TMenuItemSave1ActionActionSaveAs  	TMenuItemClose1ActionActionClose  	TMenuItemN1Caption-  	TMenuItemExit1Caption&ExitOnClick
Exit1Click   	TMenuItemEdit1CaptionEdit 	TMenuItemCut1Action	ActionCut  	TMenuItemCopy1Action
ActionCopy  	TMenuItemPaste1ActionActionPaste  	TMenuItemN2Caption-  	TMenuItemFont1Action
ActionFont   	TMenuItemWindow1Caption&Window 	TMenuItemCascade1ActionActionCascade  	TMenuItemTile2ActionActionTileVertical  	TMenuItemTile1ActionActionTileHorizontal  	TMenuItemArrangeIcons1ActionActionArrange  	TMenuItemMinimizeAll1ActionActionMinimizeAll    TActionListActionList1Images
ImageList1LeftTopH TWindowArrangeActionArrangeCategoryWindowCaption&Arrange Icons  TWindowCascadeActionCascadeCategoryWindowCaption&Cascade
ImageIndex  TWindowCloseActionCloseCategoryWindowCaption&Close
ImageIndex  TWindowMinimizeAllActionMinimizeAllCategoryWindowCaption&Minimize All  TWindowTileHorizontalActionTileHorizontalCategoryWindowCaptionTile &Horizontal
ImageIndex  TWindowTileVerticalActionTileVerticalCategoryWindowCaptionTile &Vertical
ImageIndex  	TEditCopy
ActionCopyCategoryEditCaption&CopyHintCopy
ImageIndexShortCutC@  TEditCut	ActionCutCategoryEditCaptionCu&tHintCut
ImageIndex ShortCutX@  
TEditPasteActionPasteCategoryEditCaption&PasteHintPaste
ImageIndexShortCutV@  TAction
ActionFontCategoryEditCaption&Font...
ImageIndexShortCutF@	OnExecuteActionFontExecuteOnUpdateActionFontUpdate  TAction	ActionNewCategoryFileCaption&New
ImageIndex	OnExecuteActionNewExecute  TAction
ActionOpenCategoryFileCaption&Open...
ImageIndexShortCutO@	OnExecuteActionOpenExecute  TActionActionSaveAsCategoryFileCaptionSave &As...	OnExecuteActionSaveAsExecuteOnUpdateActionSaveAsUpdate  TAction
ActionSaveCategoryFileCaption&Save
ImageIndexShortCutS@	OnExecuteActionSaveExecuteOnUpdateActionSaveUpdate   TFontDialogFontDialog1Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightѕ	Font.NameMS Sans Serif
Font.Style MinFontSize MaxFontSize Left`Top   TOpenDialogOpenDialog1Filter*Text file (*.txt)|*.txt|Any file (*.*)|*.*OptionsofHideReadOnlyofPathMustExistofFileMustExistofEnableSizing LeftА Top   TSaveDialogSaveDialog1Filter*Text file (*.txt)|*.txt|Any file (*.*)|*.*OptionsofHideReadOnlyofPathMustExistofEnableSizing LeftЈ TopP  
TImageList
ImageList1LeftdTopLBitmap
&  IL 
    џџџџџ џџџџџџџџBM6       6   (   @   0          $                  TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolBaveDialog1: TSaveDialog;
    Open1: TMenuItem;
    Save1: TMenuItem;
    ActionSave: TAction;
    Save2: TMenuItem;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: ;
    FontDialog1: TFontDialog;
    N2: TMenuItem;
    Font1: TMenuItem;
    ActionNew: TAction;
    ActionOpen: TAction;
    ActionSaveAs: TAction;
    OpenDialog1: TOpenDialog;
    St1: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    ActionCopy: TEditCopy;
    ActionCut: TEditCut;
    ActionPaste: TEditPaste;
    ActionFont: TActionnimizeAll;
    ActionTileHorizontal: TWindowTileHorizontal;
    ActionTileVertical: TWindowTileVertical;
    Tile2: TMenuItem;
    Close1: TMenuItem;
    MinimizeAll1: TMenuItem;
    EdirangeIcons1: TMenuItem;
    ActionList1: TActionList;
    ActionArrange: TWindowArrange;
    ActionCascade: TWindowCascade;
    ActionClose: TWindowClose;
    ActionMinimizeAll: TWindowMi MainMenu1: TMainMenu;
    Window1: TMenuItem;
    New1: TMenuItem;
    File1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Cascade1: TMenuItem;
    Tile1: TMenuItem;
    Arnterface

uses
  Windows, Classes, Graphics, Forms, Controls,
  Child, Menus, SysUtils, StdActns, ActnList, Dialogs, ImgList, ComCtrls,
  ToolWin;

type
  TMainForm = class(TForm)
   џ                                                                                                                                                                              unit@  me;

iџ                                                                                                                                                                                         џ џџ                                                                                                                                                                                      џ  џџџџџџ         џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ                                                                                                                                џ џџџџџ џџ         џџџџџџџџџџџџџџџ  џџџџџџџџџџџџџџџ                                                                                                                           џџџџџџџџџџ џџџџџ         џџџџџџџџџџџџ    џџџџџџџџџџџџџџџ                                                               РРРРРРРРРРРРРРРРРРРРРРРРРРР   РРР                        џџџџџџ џџџџџџџ џџ         џџџџџџџџџ          џџџџџџџџџ               џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ                                             РРР                  џџџ џџџџџ џџџџџ џџџџџ         џџџџџџџџџџџџ    џџџџџџ  џџџџџџ               џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ         РРРРРРРРРРРРРРРРРР џ  џ  џ РРРРРР                  џџџ   џџџџџџ                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   џџџџџџџџџџџџџџџџџџџџџџџџџџџ                                                                                                                                             џџџџџџџџџџџџџџџџџџџџџџџџџџџ                џџ                                                                                                                        џџџџџџџџџџџџџџџџџџџџџџџџџџџ               џџџ џџ                                                                                                                  џџџџџџџџџџџџџџџџџџџџџџџџџџџ                џџџџџ џџ                                                                                                   џџџџџџџџџџџџџџџџџџџџџџџџџџџ               џџџ џџџџџ џџ                                                                                                                               џџџџџџџџџџџџџџџџџџџџџџџџџџџ                џџџџџ џџџџџ џџџџџ џџџџџ џџ                                                                                                                 џџџџџџџџџџџџџџџџџџџџџџџџџџџ               џџџ џџџџџ џџџџџ џџџџџ џџџџџ                                                                                                                       џџџџџџџџџџџџџџџџџџџџџџџџџџџ                џџџџџ џџ                                                                                                                                         џџџџџџџџџџџџџџџџџџ                                                                                                                                                                    џџџџџџџџџџџџџџџџџџ   џџџ                                                                                                                                                                      џџџџџџџџџџџџџџџџџџ                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              џџџџџџџџџџџџџџџџџџџџџџџџ                                                                                                                     џџџџџџџџџџџџџџџџџџџџџ         џџџ                  џџџ                                                                                                                     џџџ               џџџ          џџџџџџџџџџџџџџџџџџџџџџџџ                                                                                                                    џџџџџџџџџџџџџџџџџџџџџ         џџџ         џџџ                                                                                                          џџџџџџџџџџџџџџџ  џџџ               џџџ          џџџџџџџџџџџџџџџ  џџџ                                                                                                         џџџ              џџџџџџџџџџџџџџџџџџџџџ         џџџџџџџџџџџџџџџ                                                                                                                џџџџџџџџџџџџџџџ  џџџ      џџџ                                                                                                                                           џџџ              џџџџџџџџџџџџ  џџџ                                                                                                                             џџџџџџџџџџџџџџџ  џџџџџџџџџџџџ                                                                                                                                                     џџџ      џџџ                                                                                                                                                                   џџџџџџџџџџџџ   џџџ                                 џџ       џџ                                                                                                                   џџџџџџџџџџџџ                                                 џџ џџ                                                                                                                                                                                                                                                                                                                                                                                                                                                                        BM>       >   (   @   0                               џџџ        Р                                                                                                                        џџџџџџџџџџџџРџџР 1ёР 1ћЧР 1љЧР јР §Р  ќР ёќР ёўР ёўРёёўРџљёџ?РџuѕџР?џџџџџџџџџџџџџџџџџџџљџџџќ џџіЯў  я§іЗў   ЧџіЗў   УћјЗ   уїў  ёчў?  јЯџ  ќў? ў?ўП ќќУјЯ§п сч§пџУѓ§пџјЧ§џџџџџџџџ   