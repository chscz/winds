object DoolGi: TDoolGi
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #49332#48372
  ClientHeight = 485
  ClientWidth = 356
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
    Width = 137
    Height = 113
    Color = 10930928
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
      Width = 53
      Height = 17
      Caption = '* '#49332#48372
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -17
      Font.Name = 'HY'#50685#49436'M'
      Font.Style = [fsBold]
      ParentFont = False
      OnMouseMove = FormMouseMove
    end
    object Btn_Start: TButton
      Tag = 1
      Left = 14
      Top = 45
      Width = 50
      Height = 30
      Caption = 'ON'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Btn_StartEndClick
    end
    object Btn_End: TButton
      Tag = 2
      Left = 71
      Top = 45
      Width = 50
      Height = 30
      Caption = 'OFF'
      Enabled = False
      TabOrder = 1
      OnClick = Btn_StartEndClick
    end
    object Btn_Setting: TButton
      Left = 71
      Top = 78
      Width = 50
      Height = 30
      Caption = #49444#51221#9654
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Btn_SettingClick
    end
    object Btn_Help: TButton
      Left = 14
      Top = 78
      Width = 50
      Height = 30
      Caption = #46020#50880#47568
      TabOrder = 3
      OnClick = Btn_HelpClick
    end
    object Btn_Minimize: TButton
      Tag = 8
      Left = 90
      Top = 2
      Width = 20
      Height = 20
      Caption = #65293
      TabOrder = 4
      OnClick = FormControlClick
    end
    object Btn_Close: TButton
      Tag = 9
      Left = 110
      Top = 2
      Width = 20
      Height = 20
      Caption = #215
      TabOrder = 5
      OnClick = FormControlClick
    end
    object Rad_JeonSa: TRadioButton
      Left = 37
      Top = 26
      Width = 40
      Height = 17
      Caption = #51204#49324
      Checked = True
      TabOrder = 6
      TabStop = True
      OnClick = Rad_Click
    end
    object Rad_DoJeok: TRadioButton
      Tag = 1
      Left = 81
      Top = 26
      Width = 40
      Height = 17
      Caption = #46020#51201
      TabOrder = 7
      OnClick = Rad_Click
    end
  end
  object PnlSALBO: TPanel
    Left = 137
    Top = 0
    Width = 180
    Height = 113
    Color = 10930928
    ParentBackground = False
    TabOrder = 1
    OnMouseMove = FormMouseMove
    object Lbl_GroupMem: TLabel
      Left = 40
      Top = 94
      Width = 26
      Height = 13
      Caption = #45824#49345':'
    end
    object PnlSALBO_SetTitle: TPanel
      Left = 0
      Top = 0
      Width = 180
      Height = 65
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnMouseMove = FormMouseMove
      object Label1: TLabel
        Left = 2
        Top = 7
        Width = 40
        Height = 13
        Caption = #52285#51060#47492' :'
        OnMouseMove = FormMouseMove
      end
      object Label3: TLabel
        Left = 2
        Top = 43
        Width = 25
        Height = 13
        Caption = 'Ctrl+'
        OnMouseMove = FormMouseMove
      end
      object Label4: TLabel
        Left = 20
        Top = 27
        Width = 46
        Height = 13
        Caption = '- START -'
        OnMouseMove = FormMouseMove
      end
      object Label5: TLabel
        Left = 93
        Top = 27
        Width = 34
        Height = 13
        Caption = '- END -'
        OnMouseMove = FormMouseMove
      end
      object Label6: TLabel
        Left = 78
        Top = 43
        Width = 25
        Height = 13
        Caption = 'Ctrl+'
        OnMouseMove = FormMouseMove
      end
      object WinTitleText1: TEdit
        Left = 45
        Top = 4
        Width = 100
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = #45796#47560#49332#48372
      end
      object Cbx_Start: TComboBox
        Left = 29
        Top = 41
        Width = 40
        Height = 21
        DropDownCount = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 6
        ParentFont = False
        TabOrder = 1
        Text = 'F7'
        Items.Strings = (
          'F1'
          'F2'
          'F3'
          'F4'
          'F5'
          'F6'
          'F7'
          'F8'
          'F9'
          'F10'
          'F11'
          'F12'
          '7'
          '8'
          '9'
          '0')
      end
      object Cbx_Stop: TComboBox
        Left = 108
        Top = 41
        Width = 40
        Height = 21
        DropDownCount = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 7
        ParentFont = False
        TabOrder = 2
        Text = 'F8'
        Items.Strings = (
          'F1'
          'F2'
          'F3'
          'F4'
          'F5'
          'F6'
          'F7'
          'F8'
          'F9'
          'F10'
          'F11'
          'F12'
          '7'
          '8'
          '9'
          '0')
      end
    end
    object PnlSALBO_Skill_SALBO: TPanel
      Left = 0
      Top = 65
      Width = 45
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnMouseMove = FormMouseMove
      object LblSALBO_Skill_SALBO: TLabel
        Left = 1
        Top = 4
        Width = 26
        Height = 13
        Caption = #49332#48372':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnMouseMove = FormMouseMove
      end
      object EdtSALBO_Skill_SALBO: TEdit
        Left = 28
        Top = 1
        Width = 15
        Height = 21
        MaxLength = 1
        TabOrder = 0
        Text = '0'
        OnKeyPress = SkillNum_OneChar
      end
    end
    object PnlSALBO_Skill_JAHYUL: TPanel
      Left = 45
      Top = 65
      Width = 45
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnMouseMove = FormMouseMove
      object LblSALBO_Skill_JAHYUL: TLabel
        Left = 1
        Top = 4
        Width = 26
        Height = 13
        Caption = #51088#54792':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnMouseMove = FormMouseMove
      end
      object EdtSALBO_Skill_JAHYUL: TEdit
        Left = 28
        Top = 1
        Width = 15
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        TabOrder = 0
        Text = '3'
      end
    end
    object PnlSALBO_Skill_WOONKI: TPanel
      Left = 90
      Top = 65
      Width = 45
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnMouseMove = FormMouseMove
      object LblSALBO_Skill_WOONKI: TLabel
        Left = 1
        Top = 4
        Width = 26
        Height = 13
        Caption = #50868#44592':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnMouseMove = FormMouseMove
      end
      object EdtSALBO_Skill_WOONKI: TEdit
        Left = 28
        Top = 1
        Width = 15
        Height = 21
        MaxLength = 1
        TabOrder = 0
        Text = '6'
      end
    end
    object PnlSALBO_Skill_DOBAL: TPanel
      Left = 135
      Top = 65
      Width = 45
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnMouseMove = FormMouseMove
      object LblSALBO_Skill_DOBAL: TLabel
        Left = 1
        Top = 4
        Width = 26
        Height = 13
        Caption = #46020#48156':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnMouseMove = FormMouseMove
      end
      object EdtSALBO_Skill_DOBAL: TEdit
        Left = 28
        Top = 1
        Width = 15
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 1
        ParentFont = False
        TabOrder = 0
        Text = '7'
        OnKeyPress = SkillNum_OneChar
      end
    end
    object Cbx_Cnt: TComboBox
      Left = 0
      Top = 90
      Width = 40
      Height = 21
      ItemIndex = 2
      TabOrder = 5
      Text = '3'#47749
      OnChange = Cbx_CntChange
      Items.Strings = (
        '1'#47749
        '2'#47749
        '3'#47749
        '4'#47749)
    end
    object Cbx_GrpNum1: TComboBox
      Left = 66
      Top = 90
      Width = 28
      Height = 21
      ItemIndex = 0
      TabOrder = 6
      Text = '2'
      Visible = False
      Items.Strings = (
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9')
    end
    object Cbx_GrpNum2: TComboBox
      Left = 94
      Top = 90
      Width = 28
      Height = 21
      ItemIndex = 1
      TabOrder = 7
      Text = '3'
      Visible = False
      Items.Strings = (
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9')
    end
    object Cbx_GrpNum3: TComboBox
      Left = 122
      Top = 90
      Width = 28
      Height = 21
      ItemIndex = 2
      TabOrder = 8
      Text = '4'
      Visible = False
      Items.Strings = (
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9')
    end
    object Cbx_GrpNum4: TComboBox
      Left = 150
      Top = 90
      Width = 28
      Height = 21
      ItemIndex = 3
      TabOrder = 9
      Text = '5'
      Visible = False
      Items.Strings = (
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9')
    end
  end
  object Memo1: TMemo
    Left = 8
    Top = 134
    Width = 340
    Height = 331
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object pnl_Lock: TPanel
    Left = 148
    Top = 119
    Width = 137
    Height = 113
    ParentBackground = False
    TabOrder = 3
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
  object Timer_DOOLGI: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer_DOOLGITimer
    Left = 320
    Top = 14
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 312
    Top = 104
  end
end
