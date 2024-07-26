object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 303
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Btn_On: TButton
    Left = 24
    Top = 16
    Width = 60
    Height = 60
    Caption = 'ON'
    TabOrder = 0
    OnClick = Btn_OnClick
  end
  object Btn_Off: TButton
    Left = 87
    Top = 16
    Width = 60
    Height = 60
    Caption = 'OFF'
    Enabled = False
    TabOrder = 1
    OnClick = Btn_OffClick
  end
  object WinTitleText1: TEdit
    Left = 256
    Top = 8
    Width = 105
    Height = 21
    TabOrder = 2
    Text = #44032#44032#44032
  end
  object WinTitleText2: TEdit
    Left = 256
    Top = 34
    Width = 105
    Height = 21
    TabOrder = 3
    Text = #45208#45208#45208
  end
  object WinTitleText3: TEdit
    Left = 256
    Top = 61
    Width = 105
    Height = 21
    TabOrder = 4
    Text = #45796#45796#45796
  end
  object WinTitleText4: TEdit
    Left = 256
    Top = 88
    Width = 105
    Height = 21
    TabOrder = 5
    Text = #46972#46972#46972
  end
end
