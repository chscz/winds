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
  object PnlMain: TPanel
    Left = 0
    Top = 0
    Width = 350
    Height = 276
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
      Left = 8
      Top = 3
      Width = 93
      Height = 21
      Caption = '* '#49884#50557#51012' '#47564#46308#51088
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
    object Panel1: TPanel
      Left = 0
      Top = 24
      Width = 350
      Height = 63
      TabOrder = 0
      OnMouseMove = FormMouseMove
      object Lbl_ID1: TLabel
        Left = 10
        Top = 10
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
      object Img_ID1: TImage
        Left = 62
        Top = 10
        Width = 40
        Height = 17
        OnMouseMove = FormMouseMove
      end
      object Lbl_Key1: TLabel
        Left = 10
        Top = 40
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
      object Lbl_Time1: TLabel
        Left = 240
        Top = 40
        Width = 53
        Height = 16
        Caption = #45224#51008#49884#44036' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnMouseMove = FormMouseMove
      end
      object Lbl_RemTime1: TLabel
        Left = 300
        Top = 39
        Width = 38
        Height = 19
        Caption = ' '#12641' '#52488
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnMouseMove = FormMouseMove
      end
      object Btn_Reg1: TButton
        Tag = 5
        Left = 108
        Top = 8
        Width = 35
        Height = 22
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
      object Btn_Stop1: TButton
        Tag = 1
        Left = 240
        Top = 3
        Width = 45
        Height = 30
        Caption = #51473#51648
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Btn_StopClick
      end
      object Btn_Start1: TButton
        Tag = 1
        Left = 194
        Top = 3
        Width = 45
        Height = 30
        Caption = #49884#51089
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = Btn_StartClick
      end
      object Btn_Reset1: TButton
        Tag = 9
        Left = 145
        Top = 8
        Width = 35
        Height = 22
        Caption = #47532#49483
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = Btn_WinTilte_Setting
      end
      object Edt_Key1: TEdit
        Left = 44
        Top = 35
        Width = 20
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Text = 'w'
      end
      object Cbx_Category1_1: TComboBox
        Tag = 1
        Left = 93
        Top = 35
        Width = 70
        Height = 22
        Style = csOwnerDrawFixed
        DropDownCount = 10
        ItemIndex = 0
        TabOrder = 5
        Text = #45800#44228#49440#53469
        OnChange = Cbx_CategoryChange
        Items.Strings = (
          #45800#44228#49440#53469
          '1'#45800#44228
          '2'#45800#44228
          '3'#45800#44228
          '4'#45800#44228
          '5'#45800#44228)
      end
      object Cbx_Category1_2: TComboBox
        Left = 167
        Top = 35
        Width = 70
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
        TabOrder = 6
        Text = #49884#50557#49440#53469
        Items.Strings = (
          #49884#50557#49440#53469)
      end
      object Btn_Save1: TButton
        Tag = 1
        Left = 287
        Top = 3
        Width = 58
        Height = 30
        Caption = #49444#51221#51200#51109
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = Btn_SaveClick
      end
      object Edt_Num1: TEdit
        Left = 68
        Top = 35
        Width = 20
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 8
        Text = 'w'
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 87
      Width = 350
      Height = 63
      TabOrder = 1
      OnMouseMove = FormMouseMove
      object Lbl_ID2: TLabel
        Left = 10
        Top = 10
        Width = 46
        Height = 13
        Caption = #50500#51060#46356'2 :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnMouseMove = FormMouseMove
      end
      object Lbl_Key2: TLabel
        Left = 10
        Top = 40
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
      object Lbl_Time2: TLabel
        Left = 240
        Top = 40
        Width = 53
        Height = 16
        Caption = #45224#51008#49884#44036' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnMouseMove = FormMouseMove
      end
      object Img_ID2: TImage
        Left = 62
        Top = 10
        Width = 40
        Height = 17
        OnMouseMove = FormMouseMove
      end
      object Lbl_RemTime2: TLabel
        Left = 300
        Top = 39
        Width = 38
        Height = 19
        Caption = ' '#12641' '#52488
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnMouseMove = FormMouseMove
      end
      object Btn_Stop2: TButton
        Tag = 2
        Left = 240
        Top = 3
        Width = 45
        Height = 30
        Caption = #51473#51648
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Btn_StopClick
      end
      object Btn_Start2: TButton
        Tag = 2
        Left = 194
        Top = 3
        Width = 45
        Height = 30
        Caption = #49884#51089
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Btn_StartClick
      end
      object Edt_Key2: TEdit
        Left = 44
        Top = 35
        Width = 20
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = 'w'
      end
      object Cbx_Category2_1: TComboBox
        Tag = 2
        Left = 93
        Top = 35
        Width = 70
        Height = 22
        Style = csOwnerDrawFixed
        DropDownCount = 10
        ItemIndex = 0
        TabOrder = 3
        Text = #45800#44228#49440#53469
        OnChange = Cbx_CategoryChange
        Items.Strings = (
          #45800#44228#49440#53469
          '1'#45800#44228
          '2'#45800#44228
          '3'#45800#44228
          '4'#45800#44228
          '5'#45800#44228)
      end
      object Cbx_Category2_2: TComboBox
        Left = 167
        Top = 35
        Width = 70
        Height = 22
        Style = csOwnerDrawFixed
        DropDownCount = 10
        ItemIndex = 0
        TabOrder = 4
        Text = #49884#50557#49440#53469
        Items.Strings = (
          #49884#50557#49440#53469)
      end
      object Btn_Save2: TButton
        Tag = 2
        Left = 287
        Top = 3
        Width = 58
        Height = 30
        Caption = #49444#51221#51200#51109
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = Btn_SaveClick
      end
      object Btn_Reg2: TButton
        Tag = 6
        Left = 108
        Top = 8
        Width = 35
        Height = 22
        Caption = #46321#47197
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = Btn_WinTilte_Setting
      end
      object Btn_Reset2: TButton
        Tag = 10
        Left = 145
        Top = 8
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
      object Edt_Num2: TEdit
        Left = 68
        Top = 35
        Width = 20
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 8
        Text = 'w'
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 150
      Width = 350
      Height = 63
      TabOrder = 2
      OnMouseMove = FormMouseMove
      object Lbl_ID3: TLabel
        Left = 10
        Top = 10
        Width = 46
        Height = 13
        Caption = #50500#51060#46356'3 :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnMouseMove = FormMouseMove
      end
      object Lbl_Key3: TLabel
        Left = 10
        Top = 40
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
      object Lbl_Time3: TLabel
        Left = 240
        Top = 40
        Width = 53
        Height = 16
        Caption = #45224#51008#49884#44036' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnMouseMove = FormMouseMove
      end
      object Img_ID3: TImage
        Left = 62
        Top = 10
        Width = 40
        Height = 17
        OnMouseMove = FormMouseMove
      end
      object Lbl_RemTime3: TLabel
        Left = 300
        Top = 39
        Width = 38
        Height = 19
        Caption = ' '#12641' '#52488
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnMouseMove = FormMouseMove
      end
      object Btn_Stop3: TButton
        Tag = 3
        Left = 240
        Top = 3
        Width = 45
        Height = 30
        Caption = #51473#51648
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Btn_StopClick
      end
      object Btn_Start3: TButton
        Tag = 3
        Left = 194
        Top = 3
        Width = 45
        Height = 30
        Caption = #49884#51089
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Btn_StartClick
      end
      object Edt_Key3: TEdit
        Left = 44
        Top = 35
        Width = 20
        Height = 21
        TabOrder = 2
        Text = 'w'
      end
      object Cbx_Category3_1: TComboBox
        Tag = 3
        Left = 93
        Top = 35
        Width = 70
        Height = 22
        Style = csOwnerDrawFixed
        DropDownCount = 10
        ItemIndex = 0
        TabOrder = 3
        Text = #45800#44228#49440#53469
        OnChange = Cbx_CategoryChange
        Items.Strings = (
          #45800#44228#49440#53469
          '1'#45800#44228
          '2'#45800#44228
          '3'#45800#44228
          '4'#45800#44228
          '5'#45800#44228)
      end
      object Cbx_Category3_2: TComboBox
        Left = 167
        Top = 35
        Width = 70
        Height = 22
        Style = csOwnerDrawFixed
        DropDownCount = 10
        ItemIndex = 0
        TabOrder = 4
        Text = #49884#50557#49440#53469
        Items.Strings = (
          #49884#50557#49440#53469)
      end
      object Btn_Save3: TButton
        Tag = 3
        Left = 287
        Top = 3
        Width = 58
        Height = 30
        Caption = #49444#51221#51200#51109
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = Btn_SaveClick
      end
      object Btn_Reg3: TButton
        Tag = 7
        Left = 108
        Top = 8
        Width = 35
        Height = 22
        Caption = #46321#47197
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = Btn_WinTilte_Setting
      end
      object Btn_Reset3: TButton
        Tag = 11
        Left = 146
        Top = 8
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
      object Edt_Num3: TEdit
        Left = 68
        Top = 35
        Width = 20
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 8
        Text = 'w'
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 213
      Width = 350
      Height = 63
      TabOrder = 3
      OnMouseMove = FormMouseMove
      object Lbl_ID4: TLabel
        Left = 10
        Top = 10
        Width = 46
        Height = 13
        Caption = #50500#51060#46356'4 :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnMouseMove = FormMouseMove
      end
      object Lbl_Key4: TLabel
        Left = 10
        Top = 40
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
      object Lbl_Time4: TLabel
        Left = 240
        Top = 40
        Width = 53
        Height = 16
        Caption = #45224#51008#49884#44036' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnMouseMove = FormMouseMove
      end
      object Img_ID4: TImage
        Left = 62
        Top = 10
        Width = 40
        Height = 17
        OnMouseMove = FormMouseMove
      end
      object Lbl_RemTime4: TLabel
        Left = 300
        Top = 39
        Width = 38
        Height = 19
        Caption = ' '#12641' '#52488
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnMouseMove = FormMouseMove
      end
      object Btn_Stop4: TButton
        Tag = 4
        Left = 240
        Top = 3
        Width = 45
        Height = 30
        Caption = #51473#51648
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Btn_StopClick
      end
      object Btn_Start4: TButton
        Tag = 4
        Left = 194
        Top = 3
        Width = 45
        Height = 30
        Caption = #49884#51089
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Btn_StartClick
      end
      object Edt_Key4: TEdit
        Left = 44
        Top = 35
        Width = 20
        Height = 21
        TabOrder = 2
        Text = 'w'
      end
      object Cbx_Category4_1: TComboBox
        Tag = 4
        Left = 93
        Top = 35
        Width = 70
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 3
        Text = #45800#44228#49440#53469
        OnChange = Cbx_CategoryChange
        Items.Strings = (
          #45800#44228#49440#53469
          '1'#45800#44228
          '2'#45800#44228
          '3'#45800#44228
          '4'#45800#44228
          '5'#45800#44228)
      end
      object Cbx_Category4_2: TComboBox
        Left = 167
        Top = 35
        Width = 70
        Height = 22
        Style = csOwnerDrawFixed
        DropDownCount = 10
        ItemIndex = 0
        TabOrder = 4
        Text = #49884#50557#49440#53469
        Items.Strings = (
          #49884#50557#49440#53469)
      end
      object Btn_Save4: TButton
        Tag = 4
        Left = 287
        Top = 3
        Width = 58
        Height = 30
        Caption = #49444#51221#51200#51109
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = Btn_SaveClick
      end
      object Btn_Reg4: TButton
        Tag = 8
        Left = 108
        Top = 8
        Width = 35
        Height = 22
        Caption = #46321#47197
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = Btn_WinTilte_Setting
      end
      object Btn_Reset4: TButton
        Tag = 12
        Left = 146
        Top = 8
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
      object Edt_Num4: TEdit
        Left = 68
        Top = 35
        Width = 20
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 8
        Text = 'w'
      end
    end
    object RdB_Active: TRadioButton
      Left = 173
      Top = 4
      Width = 43
      Height = 17
      Caption = #54876#49457
      Enabled = False
      TabOrder = 4
    end
    object RdB_DeActive: TRadioButton
      Left = 217
      Top = 4
      Width = 52
      Height = 17
      Caption = #48708#54876#49457
      Checked = True
      TabOrder = 5
      TabStop = True
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
    Left = 291
    Top = 1
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
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 352
    Top = 24
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 352
    Top = 88
  end
  object Timer3: TTimer
    Enabled = False
    OnTimer = Timer3Timer
    Left = 352
    Top = 151
  end
  object Timer4: TTimer
    Enabled = False
    OnTimer = Timer4Timer
    Left = 352
    Top = 213
  end
  object Timer1_1: TTimer
    Enabled = False
    OnTimer = Timer1_1Timer
    Left = 384
    Top = 24
  end
  object Timer2_1: TTimer
    Enabled = False
    OnTimer = Timer2_1Timer
    Left = 384
    Top = 88
  end
  object Timer3_1: TTimer
    Enabled = False
    OnTimer = Timer3_1Timer
    Left = 384
    Top = 152
  end
  object Timer4_1: TTimer
    Enabled = False
    OnTimer = Timer4_1Timer
    Left = 384
    Top = 216
  end
end
