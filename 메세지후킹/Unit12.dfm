object Form12: TForm12
  Left = 0
  Top = 0
  Caption = 'Form12'
  ClientHeight = 336
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btn1: TButton
    Left = 29
    Top = 8
    Width = 75
    Height = 25
    Caption = 'ON'
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 124
    Top = 8
    Width = 75
    Height = 25
    Caption = 'OFF'
    TabOrder = 1
    OnClick = btn2Click
  end
  object Panel1: TPanel
    Left = 224
    Top = 8
    Width = 193
    Height = 137
    Caption = 'Panel1'
    TabOrder = 2
    object WinTitleCaption1: TEdit
      Left = 16
      Top = 16
      Width = 97
      Height = 21
      TabOrder = 0
      Text = #44032#44032#44032
    end
    object WinTitleCaption2: TEdit
      Left = 16
      Top = 42
      Width = 97
      Height = 21
      TabOrder = 1
      Text = #45208#45208#45208
    end
    object WinTitleCaption3: TEdit
      Left = 16
      Top = 69
      Width = 97
      Height = 21
      TabOrder = 2
      Text = #45796#45796#45796
    end
    object WinTitleCaption4: TEdit
      Left = 16
      Top = 96
      Width = 97
      Height = 21
      TabOrder = 3
      Text = #46972#46972#46972
    end
    object Button1: TButton
      Tag = 1
      Left = 119
      Top = 15
      Width = 49
      Height = 21
      Caption = 'Button1'
      TabOrder = 4
      OnClick = SetWindowTitle
    end
    object Button2: TButton
      Tag = 2
      Left = 119
      Top = 42
      Width = 49
      Height = 21
      Caption = 'Button1'
      TabOrder = 5
      OnClick = SetWindowTitle
    end
    object Button3: TButton
      Tag = 3
      Left = 119
      Top = 69
      Width = 49
      Height = 21
      Caption = 'Button1'
      TabOrder = 6
      OnClick = SetWindowTitle
    end
    object Button4: TButton
      Tag = 4
      Left = 119
      Top = 96
      Width = 49
      Height = 21
      Caption = 'Button1'
      TabOrder = 7
      OnClick = SetWindowTitle
    end
  end
  object Edit99: TEdit
    Left = 48
    Top = 64
    Width = 49
    Height = 21
    TabOrder = 3
    Text = 'Edit99'
  end
end
