object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #49884#50557#51012' '#47564#46308#51088
  ClientHeight = 330
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 96
    Top = 175
    Width = 50
    Height = 13
    Caption = #50500#51060#53596#53412' :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnMouseMove = FormMouseMove
  end
  object PnlMain: TPanel
    Left = 0
    Top = 0
    Width = 225
    Height = 329
    Color = 15783900
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
      Left = 9
      Top = 7
      Width = 52
      Height = 21
      Caption = '* '#47560#47924#47532
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
    object Img_ID1: TImage
      Left = 62
      Top = 36
      Width = 40
      Height = 19
      OnMouseMove = FormMouseMove
    end
    object Lbl_ID1: TLabel
      Left = 10
      Top = 36
      Width = 46
      Height = 13
      Caption = #50500#51060#46356'1 :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnMouseMove = FormMouseMove
    end
    object Lbl_Key1: TLabel
      Left = 65
      Top = 264
      Width = 28
      Height = 13
      Caption = #50676#49632' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnMouseMove = FormMouseMove
    end
    object Label1: TLabel
      Left = 60
      Top = 174
      Width = 50
      Height = 13
      Caption = #50500#51060#53596#53412' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnMouseMove = FormMouseMove
    end
    object Label2: TLabel
      Left = 60
      Top = 204
      Width = 39
      Height = 13
      Caption = #47560#48277#53412' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnMouseMove = FormMouseMove
    end
    object Label3: TLabel
      Left = 60
      Top = 234
      Width = 39
      Height = 13
      Caption = #47560#48277#53412' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnMouseMove = FormMouseMove
    end
    object Label5: TLabel
      Left = 140
      Top = 174
      Width = 50
      Height = 13
      Caption = #51648#51221#48264#54840' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnMouseMove = FormMouseMove
    end
    object Label6: TLabel
      Left = 140
      Top = 264
      Width = 50
      Height = 13
      Caption = #55092#44221#48264#54840' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnMouseMove = FormMouseMove
    end
    object Label7: TLabel
      Left = 79
      Top = 15
      Width = 31
      Height = 13
      Caption = 'Label7'
      Visible = False
    end
    object Label8: TLabel
      Left = 10
      Top = 107
      Width = 31
      Height = 13
      Caption = 'Label7'
    end
    object Btn_Reg1: TButton
      Tag = 5
      Left = 108
      Top = 34
      Width = 35
      Height = 24
      Caption = #46321#47197
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Btn_WinTilte_Setting
    end
    object Btn_Reset1: TButton
      Tag = 9
      Left = 145
      Top = 34
      Width = 35
      Height = 24
      Caption = #47532#49483
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Btn_WinTilte_Setting
    end
    object Btn_Save1: TButton
      Tag = 1
      Left = 149
      Top = 61
      Width = 58
      Height = 32
      Caption = #49444#51221#51200#51109
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Btn_SaveClick
    end
    object Btn_Start1: TButton
      Tag = 1
      Left = 41
      Top = 61
      Width = 45
      Height = 32
      Caption = #49884#51089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Btn_StartClick
    end
    object Btn_Stop1: TButton
      Tag = 1
      Left = 87
      Top = 61
      Width = 45
      Height = 32
      Caption = #51473#51648
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = Btn_StopClick
    end
    object RadioButton1: TRadioButton
      Left = 10
      Top = 140
      Width = 50
      Height = 20
      Caption = #51116#51217
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = RadioButtonClick
    end
    object RadioButton2: TRadioButton
      Tag = 1
      Left = 10
      Top = 170
      Width = 50
      Height = 20
      Caption = #51648#51221
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = RadioButtonClick
    end
    object RadioButton3: TRadioButton
      Tag = 2
      Left = 10
      Top = 200
      Width = 50
      Height = 20
      Caption = #44480#54872
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = RadioButtonClick
    end
    object RadioButton4: TRadioButton
      Tag = 3
      Left = 10
      Top = 230
      Width = 50
      Height = 20
      Caption = #48708#50689
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = RadioButtonClick
    end
    object RadioButton5: TRadioButton
      Tag = 4
      Left = 10
      Top = 260
      Width = 50
      Height = 20
      Caption = #52292#44404
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsStrikeOut]
      ParentFont = False
      TabOrder = 9
      OnClick = RadioButtonClick
    end
    object RadioButton6: TRadioButton
      Tag = 5
      Left = 10
      Top = 290
      Width = 50
      Height = 20
      Caption = #51333#47308
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      OnClick = RadioButtonClick
    end
    object RadioButton7: TRadioButton
      Tag = 6
      Left = 152
      Top = 290
      Width = 55
      Height = 20
      Caption = #44592#53440
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnClick = RadioButtonClick
    end
    object Edit5: TEdit
      Left = 115
      Top = 261
      Width = 20
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      Text = 'w'
    end
    object Edit6: TEdit
      Left = 195
      Top = 261
      Width = 20
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 13
      Text = '6'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 108
      Top = 107
      Width = 55
      Height = 21
      Date = 44184.221527777780000000
      Format = 'HH:mm'
      Time = 44184.221527777780000000
      DateMode = dmUpDown
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Kind = dtkTime
      ParentFont = False
      TabOrder = 14
    end
    object Edit3: TEdit
      Left = 115
      Top = 201
      Width = 20
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
    end
    object Edit4: TEdit
      Left = 115
      Top = 231
      Width = 20
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
    end
    object ComboBox1: TComboBox
      Tag = 1
      Left = 151
      Top = 231
      Width = 40
      Height = 22
      Style = csOwnerDrawFixed
      DropDownCount = 10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 17
      Text = #46041
      OnChange = Cbx_CategoryChange
      Items.Strings = (
        #46041
        #49436
        #45224
        #48513)
    end
    object CheckBox1: TCheckBox
      Left = 65
      Top = 143
      Width = 80
      Height = 14
      Caption = #49324#44600' '#48372#49345#51080
      TabOrder = 18
    end
    object CheckBox2: TCheckBox
      Left = 65
      Top = 293
      Width = 80
      Height = 14
      Caption = #49324#44600' '#48372#49345#51080
      TabOrder = 19
    end
  end
  object pnl_Lock: TPanel
    Left = 446
    Top = 180
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
    Left = 170
    Top = 0
    Width = 45
    Height = 20
    Color = 15783900
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
      OnClick = Btn_FormControlClick
    end
    object Btn_Close: TButton
      Tag = 1
      Left = 25
      Top = 0
      Width = 20
      Height = 20
      Caption = #215
      TabOrder = 1
      OnClick = Btn_FormControlClick
    end
  end
  object Edit2: TEdit
    Left = 195
    Top = 171
    Width = 20
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 115
    Top = 171
    Width = 20
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object Button1: TButton
    Left = 252
    Top = 153
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 5
    Visible = False
    OnClick = Button1Click
  end
  object Timer_Act: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = Timer_ActTimer
    Left = 248
    Top = 96
  end
end
