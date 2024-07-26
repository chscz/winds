object DDD: TDDD
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #46748#45796
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
      Left = 8
      Top = 6
      Width = 69
      Height = 16
      Caption = #46748#45796#47560' '#50836#48372'!!'
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
      OnClick = Button1Click
    end
    object ComboBox1: TComboBox
      Left = 19
      Top = 28
      Width = 100
      Height = 22
      Style = csOwnerDrawFixed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 2
      Text = #45824#51109#44400
      Items.Strings = (
        #45824#51109#44400
        #46020#44648#48708
        #44340#49440
        #48729#51032#50630#51020)
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
end
