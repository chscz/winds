object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 158
  ClientWidth = 248
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 88
    Height = 13
    Caption = #12615#12615#12615#12615#12615#12615#12615#12615
  end
  object Button1: TButton
    Left = 8
    Top = 48
    Width = 113
    Height = 97
    Caption = 'ON'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 127
    Top = 48
    Width = 113
    Height = 97
    Caption = 'OFF'
    Enabled = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 32
    Top = 184
  end
end
