object Form1: TForm1
  Left = 0
  Top = 0
  Caption = '65'#52488#44036' '#53364#47533
  ClientHeight = 140
  ClientWidth = 194
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 135
    Top = 81
    Width = 36
    Height = 40
    Caption = '65'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 105
    Height = 113
    Caption = #45824#44592#51473
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 116
    Top = 8
    Width = 75
    Height = 67
    Caption = #51473#51648
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 333
    OnTimer = Timer1Timer
    Left = 56
    Top = 120
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 65000
    OnTimer = Timer2Timer
    Left = 88
    Top = 119
  end
  object Timer3: TTimer
    Enabled = False
    OnTimer = Timer3Timer
    Left = 120
    Top = 119
  end
end
