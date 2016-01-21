object MdFrameClock: TMdFrameClock
  Left = 0
  Top = 0
  Width = 179
  Height = 65
  TabOrder = 0
  object FrameLabel: TLabel
    Left = 0
    Top = 0
    Width = 179
    Height = 65
    Align = alClient
    Caption = 'FrameLabel'
  end
  object FrameTimer: TTimer
    OnTimer = FrameTimerTimer
    Left = 48
    Top = 16
  end
end
