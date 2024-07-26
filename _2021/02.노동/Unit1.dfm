object DDD: TDDD
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #45432#46041
  ClientHeight = 516
  ClientWidth = 900
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
  object Label2: TLabel
    Left = 193
    Top = 149
    Width = 8
    Height = 33
    Caption = ' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PnlMain: TPanel
    Left = 0
    Top = 0
    Width = 140
    Height = 225
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
      Left = 8
      Top = 6
      Width = 22
      Height = 16
      Caption = #45432#46041
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      OnMouseMove = FormMouseMove
    end
    object Button1: TButton
      Left = 17
      Top = 175
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
      Top = 175
      Width = 50
      Height = 41
      Caption = 'OFF'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Rb_1: TRadioButton
      Left = 14
      Top = 29
      Width = 120
      Height = 20
      Caption = #54980#45128#54980#45128'(7'#52488')'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      TabStop = True
    end
    object Rb_2: TRadioButton
      Left = 14
      Top = 55
      Width = 120
      Height = 20
      Caption = #46168#44592'-'#49457#50669#51452#51469#44592
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object Rb_3: TRadioButton
      Left = 14
      Top = 81
      Width = 120
      Height = 20
      Caption = #45804#44256#45208' '#51228#51089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object Rb_5: TRadioButton
      Left = 14
      Top = 133
      Width = 120
      Height = 20
      Caption = #44397#48165' '#49885#54784
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object Rb_4: TRadioButton
      Left = 14
      Top = 107
      Width = 120
      Height = 20
      Caption = #45804#44256#45208' '#51900#44060
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
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
  object Memo1: TMemo
    Left = 0
    Top = 231
    Width = 601
    Height = 277
    Lines.Strings = (
      '')
    TabOrder = 3
  end
  object Timer1_1: TTimer
    Enabled = False
    Interval = 7000
    OnTimer = Timer1_1Timer
    Left = 152
    Top = 96
  end
  object Timer1_2: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1_2Timer
    Left = 184
    Top = 96
  end
  object Timer_cap: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer_capTimer
    Left = 152
    Top = 136
  end
  object Timer_com1: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer_com1Timer
    Left = 152
    Top = 184
  end
  object Timer_com2: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer_com2Timer
    Left = 184
    Top = 184
  end
  object Timer_com3: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer_com3Timer
    Left = 216
    Top = 184
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer2Timer
    Left = 216
    Top = 96
  end
end
