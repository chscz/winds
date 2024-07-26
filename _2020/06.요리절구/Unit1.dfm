object DDD: TDDD
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #45432#44032#45796
  ClientHeight = 227
  ClientWidth = 262
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
      Width = 45
      Height = 16
      Caption = #45432#44032#45796'...'
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
    object Label2: TLabel
      Left = 16
      Top = 86
      Width = 26
      Height = 16
      Caption = '1st :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 12
      Top = 113
      Width = 30
      Height = 16
      Caption = '2nd :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 14
      Top = 142
      Width = 28
      Height = 16
      Caption = '3rd :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
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
      Width = 60
      Height = 20
      Caption = #51312#54633
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TabStop = True
      OnClick = Rb_1Click
    end
    object Rb_2: TRadioButton
      Left = 69
      Top = 29
      Width = 60
      Height = 20
      Caption = #51208#44396
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Rb_2Click
    end
    object Rb_3: TRadioButton
      Left = 14
      Top = 55
      Width = 60
      Height = 20
      Caption = #50836#47532
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = Rb_3Click
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
  object ComboBox1: TComboBox
    Left = 58
    Top = 85
    Width = 62
    Height = 21
    Style = csDropDownList
    DropDownCount = 11
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 3
    Text = #50630#51020
    Items.Strings = (
      #50630#51020
      '1 '#44060
      '2 '#44060
      '3 '#44060
      '4 '#44060
      '5 '#44060
      '6 '#44060
      '7 '#44060
      '8 '#44060
      '9 '#44060
      '10 '#44060)
  end
  object ComboBox2: TComboBox
    Left = 58
    Top = 113
    Width = 62
    Height = 21
    Style = csDropDownList
    DropDownCount = 11
    ItemIndex = 0
    TabOrder = 4
    Text = #50630#51020
    Items.Strings = (
      #50630#51020
      '1 '#44060
      '2 '#44060
      '3 '#44060
      '4 '#44060
      '5 '#44060
      '6 '#44060
      '7 '#44060
      '8 '#44060
      '9 '#44060
      '10 '#44060)
  end
  object ComboBox3: TComboBox
    Left = 58
    Top = 141
    Width = 62
    Height = 21
    Style = csDropDownList
    DropDownCount = 11
    ItemIndex = 0
    TabOrder = 5
    Text = #50630#51020
    Items.Strings = (
      #50630#51020
      '1 '#44060
      '2 '#44060
      '3 '#44060
      '4 '#44060
      '5 '#44060
      '6 '#44060
      '7 '#44060
      '8 '#44060
      '9 '#44060
      '10 '#44060)
  end
  object ComboBox4: TComboBox
    Left = 68
    Top = 56
    Width = 62
    Height = 21
    Style = csDropDownList
    DropDownCount = 11
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 6
    Text = '2 '#44032#51648
    Items.Strings = (
      '2 '#44032#51648
      '3 '#44032#51648
      '4 '#44032#51648
      '5 '#44032#51648
      '6 '#44032#51648
      '7 '#44032#51648
      '8 '#44032#51648
      '9 '#44032#51648
      '10 '#44032#51648)
  end
end
