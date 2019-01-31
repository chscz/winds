object Form3: TForm3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #48128#45824
  ClientHeight = 276
  ClientWidth = 343
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
    Height = 81
    Color = 12582911
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    OnMouseMove = FormMouseMove
    object LLblMain: TLabel
      Left = 8
      Top = 3
      Width = 36
      Height = 19
      Caption = '* '#48128#45824
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -17
      Font.Name = 'HY'#50685#49436'M'
      Font.Style = [fsBold]
      ParentFont = False
      OnMouseMove = FormMouseMove
    end
    object Label1: TLabel
      Left = 52
      Top = 29
      Width = 37
      Height = 13
      Caption = #52285#51060#47492':'
    end
    object Btn_Start: TButton
      Tag = 1
      Left = 6
      Top = 46
      Width = 40
      Height = 30
      Caption = 'ON'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Btn_StartEndClick
    end
    object Btn_End: TButton
      Tag = 2
      Left = 49
      Top = 46
      Width = 40
      Height = 30
      Caption = 'OFF'
      Enabled = False
      TabOrder = 3
      OnClick = Btn_StartEndClick
    end
    object Button4: TButton
      Left = 92
      Top = 51
      Width = 40
      Height = 25
      Caption = #49444#47749
      TabOrder = 4
      OnClick = Button4Click
    end
    object Btn_Minimize: TButton
      Tag = 8
      Left = 88
      Top = 3
      Width = 20
      Height = 20
      Caption = #65293' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = False
      OnClick = FormControlClick
    end
    object Btn_Close: TButton
      Tag = 9
      Left = 111
      Top = 3
      Width = 20
      Height = 20
      Caption = #215
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = False
      OnClick = FormControlClick
    end
    object Edit1: TEdit
      Left = 90
      Top = 27
      Width = 46
      Height = 21
      TabOrder = 5
      Text = #48128#45824
    end
  end
  object Memo1: TMemo
    Left = 8
    Top = 252
    Width = 302
    Height = 171
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object pnl_Lock: TPanel
    Left = 148
    Top = 119
    Width = 137
    Height = 113
    ParentBackground = False
    TabOrder = 2
    Visible = False
    OnMouseMove = FormMouseMove
    object edt_Lock: TEdit
      Left = 20
      Top = 15
      Width = 95
      Height = 21
      PasswordChar = '*'
      TabOrder = 0
      OnKeyPress = edt_LockKeyPress
    end
    object Btn_Lock: TButton
      Left = 32
      Top = 48
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 1
      OnClick = Btn_LockClick
    end
  end
  object Timer_SALBO: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer_SALBOTimer
    Left = 224
    Top = 30
  end
  object Timer_num2: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer_num2Timer
    Left = 176
    Top = 8
  end
  object Timer_num3: TTimer
    Enabled = False
    Interval = 300
    OnTimer = Timer_num3Timer
    Left = 184
    Top = 64
  end
  object Timer_num1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer_num1Timer
    Left = 144
    Top = 72
  end
end
