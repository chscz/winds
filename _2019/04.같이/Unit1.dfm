object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #48128#45824
  ClientHeight = 194
  ClientWidth = 334
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
    Width = 185
    Height = 153
    Color = 16572323
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
      Width = 64
      Height = 21
      Caption = '* '#44057#51060#44032#51088
      Color = 16572323
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      OnMouseMove = FormMouseMove
    end
    object Label1: TLabel
      Left = 6
      Top = 28
      Width = 46
      Height = 13
      Caption = 'Master :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 9
      Top = 52
      Width = 43
      Height = 13
      Caption = 'Slave   :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 76
      Width = 44
      Height = 13
      Caption = 'Slave2 :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Img_ID1: TImage
      Left = 59
      Top = 30
      Width = 40
      Height = 17
    end
    object Img_ID2: TImage
      Left = 59
      Top = 53
      Width = 40
      Height = 17
    end
    object Img_ID3: TImage
      Left = 59
      Top = 76
      Width = 40
      Height = 17
    end
    object Label4: TLabel
      Left = 9
      Top = 99
      Width = 44
      Height = 13
      Caption = 'Slave3 :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Img_ID4: TImage
      Left = 59
      Top = 98
      Width = 40
      Height = 17
    end
    object Btn_Start: TButton
      Tag = 1
      Left = 7
      Top = 120
      Width = 45
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
      Left = 53
      Top = 120
      Width = 45
      Height = 30
      Caption = 'OFF'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Btn_StartEndClick
    end
    object Button1: TButton
      Tag = 5
      Left = 103
      Top = 25
      Width = 35
      Height = 22
      Caption = #46321#47197
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Btn_WinTilte_Setting
    end
    object Button2: TButton
      Tag = 6
      Left = 103
      Top = 49
      Width = 35
      Height = 22
      Caption = #46321#47197
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Btn_WinTilte_Setting
    end
    object ComboBox1: TComboBox
      Left = 141
      Top = 124
      Width = 30
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 9
      ParentFont = False
      TabOrder = 5
      Text = '9'
      Items.Strings = (
        '0'
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '-')
    end
    object Btn_Help: TButton
      Left = 100
      Top = 120
      Width = 40
      Height = 30
      Caption = #46020#50880#47568
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = Btn_HelpClick
    end
    object Button3: TButton
      Tag = 7
      Left = 103
      Top = 73
      Width = 35
      Height = 22
      Caption = #46321#47197
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = Btn_WinTilte_Setting
    end
    object Button4: TButton
      Tag = 9
      Left = 139
      Top = 25
      Width = 35
      Height = 22
      Caption = #47532#49483
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = Btn_WinTilte_Setting
    end
    object Button5: TButton
      Tag = 10
      Left = 139
      Top = 49
      Width = 35
      Height = 22
      Caption = #47532#49483
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = Btn_WinTilte_Setting
    end
    object Button6: TButton
      Tag = 11
      Left = 139
      Top = 73
      Width = 35
      Height = 22
      Caption = #47532#49483
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = Btn_WinTilte_Setting
    end
    object Button7: TButton
      Tag = 8
      Left = 103
      Top = 97
      Width = 35
      Height = 22
      Caption = #46321#47197
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnClick = Btn_WinTilte_Setting
    end
    object Button8: TButton
      Tag = 12
      Left = 139
      Top = 99
      Width = 35
      Height = 22
      Caption = #47532#49483
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      OnClick = Btn_WinTilte_Setting
    end
  end
  object pnl_Lock: TPanel
    Left = 191
    Top = 8
    Width = 137
    Height = 113
    ParentBackground = False
    TabOrder = 1
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
  object Pnl_Ctrl: TPanel
    Left = 125
    Top = 1
    Width = 45
    Height = 20
    Color = 16572323
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
      Tag = 3
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
      OnClick = Btn_StartEndClick
    end
    object Btn_Close: TButton
      Tag = 4
      Left = 25
      Top = 0
      Width = 20
      Height = 20
      Caption = #215
      TabOrder = 1
      OnClick = Btn_StartEndClick
    end
  end
end
