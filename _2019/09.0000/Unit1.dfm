object DDD: TDDD
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '00000000'
  ClientHeight = 161
  ClientWidth = 263
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TPanel
    Left = 0
    Top = 0
    Width = 140
    Height = 105
    Color = 16245500
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    OnMouseMove = FormMouseMove
    object Label1: TLabel
      Left = 11
      Top = 6
      Width = 66
      Height = 16
      Caption = '0000000!!'
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBackground
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      OnMouseMove = FormMouseMove
    end
    object Button1: TButton
      Left = 17
      Top = 54
      Width = 50
      Height = 41
      Caption = 'ON'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Tag = 1
      Left = 73
      Top = 54
      Width = 50
      Height = 41
      Caption = 'OFF'
      TabOrder = 1
      OnClick = Button2Click
    end
    object DateTimePicker1: TDateTimePicker
      Left = 76
      Top = 29
      Width = 55
      Height = 21
      Date = 44340.188263043980000000
      Format = 'HH:mm'
      Time = 44340.188263043980000000
      Kind = dtkTime
      TabOrder = 2
    end
    object Chk_AutoOff: TCheckBox
      Left = 9
      Top = 31
      Width = 65
      Height = 17
      Caption = #44732#51664#50696#50557':'
      TabOrder = 3
    end
  end
  object pnl_Lock: TPanel
    Left = 146
    Top = 4
    Width = 113
    Height = 84
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    Visible = False
    OnMouseMove = FormMouseMove
    object edt_Lock: TEdit
      Left = 9
      Top = 12
      Width = 95
      Height = 21
      PasswordChar = '*'
      TabOrder = 0
      OnKeyPress = edt_LockKeyPress
    end
    object Btn_Lock: TButton
      Left = 16
      Top = 42
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 1
      OnClick = Btn_LockClick
    end
  end
  object Pnl_Ctrl: TPanel
    Left = 90
    Top = 3
    Width = 45
    Height = 20
    Color = 16245500
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    OnMouseMove = FormMouseMove
    object Btn_Minimize: TButton
      Tag = 8
      Left = 0
      Top = 0
      Width = 20
      Height = 20
      Caption = #65293
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = FormControlClick
    end
    object Btn_Close: TButton
      Tag = 9
      Left = 25
      Top = 0
      Width = 20
      Height = 20
      Caption = #215
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = FormControlClick
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 300
    OnTimer = Timer1Timer
    Left = 144
    Top = 96
  end
  object Timer_PowerOff: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = Timer_PowerOffTimer
    Left = 184
    Top = 96
  end
end
