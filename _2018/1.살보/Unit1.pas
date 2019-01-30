unit Unit1;

{$DEFINE SALBO} // 살보

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
   Vcl.StdCtrls, Vcl.ComCtrls,
   Vcl.ExtCtrls, Vcl.Buttons
   , System.Win.Registry
   // , untImageSearch
     ;

const
   BasicTitle = '바람의나라';

type
   TRecFuncKey = record
      Func_Title : Integer;
      Func_Start : Integer;
      Func_Stop  : Integer;
   end;

{$IFDEF SALBO}
   TRecSALBO = record
      SALBO : Integer;
      JAHYUL: Integer;
      WOONKI: Integer;
      DOBAL : Integer;
   end;
{$ENDIF}

   TForm3 = class(TForm)
      Btn_Start: TButton;
      Btn_End: TButton;
      WinTitleText1: TEdit;
    Btn_Help: TButton;
    PnlMain: TPanel;

      Label1: TLabel;
      Btn_Setting: TButton;
      Memo1: TMemo;
      PnlSALBO_Skill_JAHYUL: TPanel;

{$IFDEF SALBO}
      PnlSALBO: TPanel;
      Timer_SALBO: TTimer;
      PnlSALBO_SetTitle: TPanel;
      PnlSALBO_Skill_SALBO: TPanel;
      LblSALBO_Skill_SALBO: TLabel;
      EdtSALBO_Skill_SALBO: TEdit;
    LblSALBO_Skill_JAHYUL: TLabel;
    EdtSALBO_Skill_JAHYUL: TEdit;
      PnlSALBO_Skill_WOONKI: TPanel;
      LblSALBO_Skill_WOONKI: TLabel;
      EdtSALBO_Skill_WOONKI: TEdit;
    Btn_Minimize: TButton;
    Btn_Close: TButton;
    LLblMain: TLabel;
    Cbx_Start: TComboBox;
    Cbx_Stop: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    PnlSALBO_Skill_DOBAL: TPanel;
    LblSALBO_Skill_DOBAL: TLabel;
    EdtSALBO_Skill_DOBAL: TEdit;
    pnl_Lock: TPanel;
    edt_Lock: TEdit;
    Btn_Lock: TButton;
    Rad_JeonSa: TRadioButton;
    Rad_DoJeok: TRadioButton;
    Cbx_Cnt: TComboBox;
    Lbl_GroupMem: TLabel;
    Cbx_GrpNum1: TComboBox;
    Cbx_GrpNum2: TComboBox;
    Cbx_GrpNum3: TComboBox;
    Cbx_GrpNum4: TComboBox;
{$ENDIF}
      procedure Btn_StartEndClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure Timer_SALBOTimer(Sender: TObject);
      procedure Btn_HelpClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure SetNumberEdit(Edit: TWinControl);
      procedure KeySetting;
      function NumkeyToKeycode(Num: Integer): Integer;
      function FunckeyToKeycode(ItemIndex: Integer): Integer;
      procedure Btn_SettingClick(Sender: TObject);
    procedure SkillNum_OneChar(Sender: TObject; var Key: Char);
    procedure FormControlClick(Sender: TObject);
    procedure HideTitlebar(Form:TForm);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    function UserCheck: Boolean;
    procedure Btn_LockClick(Sender: TObject);
    procedure edt_LockKeyPress(Sender: TObject; var Key: Char);
    procedure Rad_Click(Sender: TObject);
    procedure Cbx_CntChange(Sender: TObject);
   end;

var
   Handle_1: THandle;
   LFlag_1: Boolean;
   RecFuncKey : TRecFuncKey;
{$IFDEF SALBO}
   Flag_SALBO: Integer;
   RecSALBO: TRecSALBO;
   GroupMemNum_1 : Integer;
   GroupMemNum_2 : Integer;
   GroupMemNum_3 : Integer;
   GroupMemNum_4 : Integer;
{$ENDIF}
   Form3: TForm3;
   HookID: HHOOK;
procedure KeybdHook;
procedure KeybdUnhook;

implementation

{$R *.dfm}

type
   PKeyHookStruct = ^TKeyHookStruct;

   TKeyHookStruct = record
      vkCode: Integer;
      ScanCode: Integer;
      Flags: Integer;
      Time: Integer;
      dwExtraInfo: Integer;
   end;
   // 키 입력 필터링 함수

function LLKeyHookFunc(HookCode: Integer; KeyCode: wParam; kStrokeInfo: lParam): LResult; stdcall;
var
   PKeyHook: PKeyHookStruct;
   idlestate: Boolean;
   NHandle: THandle;
   KeyFlag: Boolean;
   Len: LongInt;
   Title: String;
   TitleTxt: String;
begin
   KeyFlag := False;
   // 키 정보 받아오기
   PKeyHook := Ptr(kStrokeInfo);
   if HookCode >= 0 then
   begin
//      Form3.Memo1.Lines.Add('LLKeyHookFunc');
      // case로 묶으면 토글키가 눌려져 있네..
//      if (PKeyHook.vkCode = RecFuncKey.Func_Title) and (GetAsyncKeyState(VK_CONTROL) < -32766) then
      if (PKeyHook.vkCode = VK_INSERT) and (GetAsyncKeyState(VK_CONTROL) < -32766) then
      begin
//         Form3.Memo1.Lines.Add('창이름변경:'+Form3.WinTitleText1.Text);
         Handle_1 := GetForegroundWindow;
         SetWindowText(Handle_1, Form3.WinTitleText1.Text);
      end else if (PKeyHook.vkCode = VK_DELETE) and (GetAsyncKeyState(VK_CONTROL) < -32766) then
      begin
//         Form3.Memo1.Lines.Add('창이름복원:'+BasicTitle);
         SetWindowText(GetForegroundWindow, BasicTitle);
      end else if (PKeyHook.vkCode = RecFuncKey.Func_Start) and (GetAsyncKeyState(VK_CONTROL) < -32766) then
      begin
//         Form3.Memo1.Lines.Add('시작');
         Handle_1 := FindWindow(nil, PChar(Form3.WinTitleText1.Text));
{$IFDEF SALBO}
         Form3.Timer_SALBO.Interval := 500;
         Form3.Timer_SALBO.Enabled := True;
{$ENDIF}
      end else if (PKeyHook.vkCode = RecFuncKey.Func_Stop) and (GetAsyncKeyState(VK_CONTROL) < -32766) then
      begin
//         Form3.Memo1.Lines.Add('중지');
{$IFDEF SALBO}
         Form3.Timer_SALBO.Enabled := False;
{$ENDIF}
      end else if (PKeyHook.vkCode = VK_F3) and (GetAsyncKeyState(VK_SHIFT) < -32766) then
      begin
         // 항상 맨 위에 아님..
         Form3.FormStyle := fsNormal;
         Result := 1;
      end
      else
         // 필터링 된 키가 아니라면 계속 진행
         Result := CallNextHookEx(HookID, HookCode, KeyCode, kStrokeInfo);
      idlestate := True;
   end;
end;

procedure KeybdHook;
const
   WH_KEYBOARD_LL = 13;
begin
   HookID := SetWindowsHookEx(WH_KEYBOARD_LL, @LLKeyHookFunc, hInstance, 0);
end;

procedure KeybdUnhook;
begin
   UnHookWindowsHookEx(HookID);
end;

// 유저체크
procedure TForm3.Btn_LockClick(Sender: TObject);
var
   Key_a        : String;
   LockKey      : Integer;
   Reg_2        : TRegistry;
begin
{
   Key_a := FormatDateTime('MMDD',Now) + FormatDateTime('YY',Now);
   Key_b := FormatDateTime('MMDD',Now);
   LockKey := ((StrToInt(Key_a)-StrToInt(Key_b))*922);
   LockKey := StrToInt(Copy(IntToStr(LockKey),1,6));
   LockKey := LockKey*922;
   LockKey := StrToInt(Copy(IntToStr(LockKey),1,6));
}
   Key_a := FormatDateTime('HHDDMM',Now);
   LockKey := (StrToInt(Key_a)*922);
   LockKey := StrToInt(Copy(IntToStr(LockKey),1,6));

   if IntToStr(LockKey) = edt_Lock.Text then
   begin
      try
         Reg_2 := TRegistry.Create;
         Reg_2.RootKey := HKEY_CURRENT_USER;
         Reg_2.OpenKey('\Software\MicroSoft\WindsData', True);
         Reg_2.WriteString('Release Lock_1',DateToStr(now));
      finally
         Reg_2.CloseKey;
         Reg_2.Free;
      end;
      pnl_Lock.Visible := False;
      Btn_StartEndClick(Btn_Start);
   end else begin
      MessageDlg('키 불일치',mtError,[mbOK],0);
   end;
end;

procedure TForm3.Btn_SettingClick(Sender: TObject);
//
begin
   case Btn_Setting.Tag of
      0:
         begin
{$IFDEF SALBO}
            // PnlSALBO.Visible := True;
            PnlSALBO.Enabled := True;
            Self.Width  := PnlMain.Width + PnlSALBO.Width;
{$ENDIF}
            Btn_Start.Enabled := False;
            Btn_Setting.Caption := '설정◀';
            Btn_Setting.Tag := 1;
         end;
      1:
         begin
{$IFDEF SALBO}
            if (EdtSALBO_Skill_SALBO.Text = '') then
            begin
               MessageDlg('살보 필수입력!!',mtError,[mbOK],0);
               Exit;
            end;

            KeySetting;

            // PnlSALBO.Visible := False;
            PnlSALBO.Enabled := False;
            Self.Width  := PnlMain.Width;
{$ENDIF}
            Btn_Start.Enabled := True;
            Btn_Setting.Caption := '설정▶';
            Btn_Setting.Tag := 0;
         end;
   end;
end;

procedure TForm3.Btn_StartEndClick(Sender: TObject);
begin
   case (Sender as TButton).Tag of
      1:
         begin
            Btn_Start.Enabled := False;
            Btn_End.Enabled := True;
            Btn_Setting.Enabled := False;
{$IFDEF SALBO}
            Rad_JeonSa.Enabled := False;
            Rad_DoJeok.Enabled := False;
{$ENDIF}
            KeySetting;
            KeybdHook;
//            Form3.Memo1.Lines.Add('On!!!!!!!!!');
         end;
      2:
         begin
{$IFDEF SALBO}
            Timer_SALBO.Enabled := False;
            Flag_SALBO := 1;
            Rad_JeonSa.Enabled := True;
            Rad_DoJeok.Enabled := True;
{$ENDIF}
            Btn_Start.Enabled := True;
            Btn_End.Enabled := False;
            Btn_Setting.Enabled := True;
            KeybdUnhook;
//            Form3.Memo1.Lines.Add('Off!!!!!!!!');
         end;

   end;

end;

//타이틀 캡션, 버튼 처리
procedure TForm3.FormControlClick(Sender: TObject);
begin
   case (Sender as TButton).Tag of
      8: Application.Minimize;
      9: Close;
   end;
end;

//도움말
procedure TForm3.Btn_HelpClick(Sender: TObject);
begin
   //
   showmessage('Ctrl + Insert : 창이름변경'+#13#10 +
               'Ctrl + Delete : 창이름원복'+#13#10 +
               'Ctrl + '+Cbx_Start.Text+' : 시작'+#13#10 +
               'Ctrl + '+Cbx_Stop.Text+' : 중지'+#13#10 +
               'OFF상태에서만 설정 가능!!'+#13#10 +
               '-다마@XX-'
               );
end;

procedure TForm3.Cbx_CntChange(Sender: TObject);
begin
   case Cbx_Cnt.ItemIndex of
      0: begin
        Cbx_GrpNum1.Visible := True;
        Cbx_GrpNum2.Visible := False;
        Cbx_GrpNum3.Visible := False;
        Cbx_GrpNum4.Visible := False;
      end;
      1: begin
        Cbx_GrpNum1.Visible := True;
        Cbx_GrpNum2.Visible := True;
        Cbx_GrpNum3.Visible := False;
        Cbx_GrpNum4.Visible := False;
      end;
      2: begin
        Cbx_GrpNum1.Visible := True;
        Cbx_GrpNum2.Visible := True;
        Cbx_GrpNum3.Visible := True;
        Cbx_GrpNum4.Visible := False;
      end;
      3: begin
        Cbx_GrpNum1.Visible := True;
        Cbx_GrpNum2.Visible := True;
        Cbx_GrpNum3.Visible := True;
        Cbx_GrpNum4.Visible := True;
      end;
   end;
end;

procedure TForm3.edt_LockKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      Btn_LockClick(Btn_Lock);
end;

//마법키 제한
procedure TForm3.SkillNum_OneChar(Sender: TObject; var Key: Char);
begin
   if not StrToIntDef(Key,-1) in [0..9] then
      (Sender as TEdit).Text := ''
   else
      (Sender as TEdit).Text := Key;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   KeybdUnhook;
   ExitProcess(0);
end;

procedure TForm3.FormCreate(Sender: TObject);
var
   Reg_1 : TRegistry;
begin
   HideTitlebar(self);
   Self.Height := 114;
   Self.Width  := PnlMain.Width;
   PnlSALBO.Left := PnlMain.Width;

   if UserCheck then
   begin
{$IFDEF SALBO}
      LLblMain.Caption := '* 살보';
      Flag_SALBO := 1;
      SetNumberEdit(EdtSALBO_Skill_SALBO);
      SetNumberEdit(EdtSALBO_Skill_JAHYUL);
      SetNumberEdit(EdtSALBO_Skill_WOONKI);
      SetNumberEdit(EdtSALBO_Skill_DOBAL);

      Cbx_CntChange(nil);
{$ENDIF}
      Btn_StartEndClick(Btn_Start);
   end else begin
       //
   end;
end;

//폼 이동 처리
procedure TForm3.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
   ReleaseCapture();
   SendMessage(Handle,WM_SYSCOMMAND,$F012,0 );
end;

function TForm3.NumkeyToKeycode(Num: Integer): Integer;
begin
   case Num of
      0:Result := 48;
      1:Result := 49;
      2:Result := 50;
      3:Result := 51;
      4:Result := 52;
      5:Result := 53;
      6:Result := 54;
      7:Result := 55;
      8:Result := 56;
      9:Result := 57;
   end;
end;

procedure TForm3.Rad_Click(Sender: TObject);
begin
   case (Sender as TRadioButton).Tag of
      0: begin
         LblSALBO_Skill_DOBAL.Enabled := True;
         EdtSALBO_Skill_DOBAL.Enabled := True;
         LblSALBO_Skill_JAHYUL.Caption := '자혈:';
         Cbx_Cnt.Items.Clear;
         Cbx_Cnt.Items.Add('1명');
         Cbx_Cnt.Items.Add('2명');
         Cbx_Cnt.Items.Add('3명');
         Cbx_Cnt.Items.Add('4명');
         Cbx_Cnt.ItemIndex := 2;
         Cbx_GrpNum1.Visible := True;
         Cbx_GrpNum2.Visible := True;
         Cbx_GrpNum3.Visible := True;
         Cbx_GrpNum4.Visible := False;
      end;
      1: begin
         LblSALBO_Skill_DOBAL.Enabled := False;
         EdtSALBO_Skill_DOBAL.Enabled := False;
         LblSALBO_Skill_JAHYUL.Caption := '전혈:';
         Cbx_Cnt.Items.Clear;
         Cbx_Cnt.Items.Add('1명');
         Cbx_Cnt.Items.Add('2명');
         Cbx_Cnt.ItemIndex := 1;
         Cbx_GrpNum1.Visible := True;
         Cbx_GrpNum2.Visible := True;
         Cbx_GrpNum3.Visible := False;
         Cbx_GrpNum4.Visible := False;
      end;
   end;
end;

function TForm3.FunckeyToKeycode(ItemIndex: Integer): Integer;
begin
   case ItemIndex of
      0:Result := 112;   //F1
      1:Result := 113;
      2:Result := 114;   //F3
      3:Result := 115;
      4:Result := 116;   //F5
      5:Result := 117;
      6:Result := 118;   //F7=118
      7:Result := 119;
      8:Result := 120;   //F9
      9:Result := 121;
      10:Result := 122;  //F11
      11:Result := 123;

      12:Result := 55;   //7
      13:Result := 56;
      14:Result := 57;   //9
      15:Result := 48;
   end;
end;

procedure TForm3.Timer_SALBOTimer(Sender: TObject);
begin
{$IFDEF SALBO}
   if Rad_JeonSa.Checked then
   begin
      Timer_SALBO.Interval := 22000;
      PostMessage(Handle_1, WM_KEYDOWN, VK_ESCAPE, 0); // ESC
      PostMessage(Handle_1, WM_KEYUP, VK_ESCAPE, 0);

      if not (EdtSALBO_Skill_JAHYUL.Text = '') then
      begin
         PostMessage(Handle_1, WM_KEYDOWN, RecSALBO.JAHYUL, 0); // 자혈or소생
         PostMessage(Handle_1, WM_KEYUP, RecSALBO.JAHYUL, 0);
         PostMessage(Handle_1, WM_KEYDOWN, RecSALBO.JAHYUL, 0);
         PostMessage(Handle_1, WM_KEYUP, RecSALBO.JAHYUL, 0);
         PostMessage(Handle_1, WM_KEYDOWN, RecSALBO.JAHYUL, 0);
         PostMessage(Handle_1, WM_KEYUP, RecSALBO.JAHYUL, 0);
      end;

      if not (EdtSALBO_Skill_DOBAL.Text = '') then
      begin
         PostMessage(Handle_1, WM_KEYDOWN, RecSALBO.DOBAL, 0);  // 도발
         PostMessage(Handle_1, WM_KEYUP, RecSALBO.DOBAL, 0);
      end;

      if not (EdtSALBO_Skill_WOONKI.Text = '')  then
      begin
         PostMessage(Handle_1, WM_KEYDOWN, RecSALBO.WOONKI, 0); // 운기
         PostMessage(Handle_1, WM_KEYUP, RecSALBO.WOONKI, 0);
      end;

      PostMessage(Handle_1, WM_KEYDOWN, RecSALBO.SALBO, 0); // 살보
      PostMessage(Handle_1, WM_KEYUP, RecSALBO.SALBO, 0);
      PostMessage(Handle_1, WM_KEYDOWN, RecSALBO.SALBO, 0); // 살보
      PostMessage(Handle_1, WM_KEYUP, RecSALBO.SALBO, 0);

//      memo1.Lines.Add('Flag_SALBO:'+IntToStr(Flag_SALBO));

//      Sleep(200);

      case Flag_SALBO of
         1:
            begin
               PostMessage(Handle_1, WM_KEYDOWN, GroupMemNum_1, 0); // 룹번호
               PostMessage(Handle_1, WM_KEYUP, GroupMemNum_1, 0);
               PostMessage(Handle_1, WM_KEYDOWN, GroupMemNum_1, 0);
               PostMessage(Handle_1, WM_KEYUP, GroupMemNum_1, 0);
               if Cbx_GrpNum2.Visible then
                  Inc(Flag_SALBO)
               else
                  Flag_SALBO := 1;
            end;
         2:
            begin
               PostMessage(Handle_1, WM_KEYDOWN, GroupMemNum_2, 0); // 룹번호
               PostMessage(Handle_1, WM_KEYUP, GroupMemNum_2, 0);
               PostMessage(Handle_1, WM_KEYDOWN, GroupMemNum_2, 0);
               PostMessage(Handle_1, WM_KEYUP, GroupMemNum_2, 0);
               if Cbx_GrpNum3.Visible then
                  Inc(Flag_SALBO)
               else
                  Flag_SALBO := 1;
            end;
         3:
            begin
               PostMessage(Handle_1, WM_KEYDOWN, GroupMemNum_3, 0); // 룹번호
               PostMessage(Handle_1, WM_KEYUP, GroupMemNum_3, 0);
               PostMessage(Handle_1, WM_KEYDOWN, GroupMemNum_3, 0);
               PostMessage(Handle_1, WM_KEYUP, GroupMemNum_3, 0);
               if Cbx_GrpNum4.Visible then
                  Inc(Flag_SALBO)
               else
                  Flag_SALBO := 1;
            end;
         4:
            begin
               PostMessage(Handle_1, WM_KEYDOWN, GroupMemNum_4, 0); // 룹번호
               PostMessage(Handle_1, WM_KEYUP, GroupMemNum_4, 0);
               PostMessage(Handle_1, WM_KEYDOWN, GroupMemNum_4, 0);
               PostMessage(Handle_1, WM_KEYUP, GroupMemNum_4, 0);
               Flag_SALBO := 1;
            end;
      end;

      PostMessage(Handle_1, WM_KEYDOWN, VK_RETURN, 0); // enter
      PostMessage(Handle_1, WM_KEYUP, VK_RETURN, 0);

   end else begin
      Timer_SALBO.Interval := 48000;
      PostMessage(Handle_1, WM_KEYDOWN, VK_ESCAPE, 0); // ESC
      PostMessage(Handle_1, WM_KEYUP, VK_ESCAPE, 0);

      Sleep(100);

      PostMessage(Handle_1, WM_KEYDOWN, RecSALBO.SALBO, 0); // 살보
      PostMessage(Handle_1, WM_KEYUP, RecSALBO.SALBO, 0);

      Sleep(100);

      case Flag_SALBO of
         1:
            begin
               PostMessage(Handle_1, WM_KEYDOWN, GroupMemNum_1, 0); // 룹번호
               PostMessage(Handle_1, WM_KEYUP, GroupMemNum_1, 0);
               if Cbx_GrpNum1.Visible then
                  Inc(Flag_SALBO)
               else
                  Flag_SALBO := 1;
            end;
         2:
            begin
               PostMessage(Handle_1, WM_KEYDOWN, GroupMemNum_2, 0); // 룹번호
               PostMessage(Handle_1, WM_KEYUP, GroupMemNum_2, 0);
               Flag_SALBO := 1;
            end;
      end;

      Sleep(100);

      PostMessage(Handle_1, WM_KEYDOWN, VK_RETURN, 0); // enter
      PostMessage(Handle_1, WM_KEYUP, VK_RETURN, 0);

      Sleep(1200);

      if not (EdtSALBO_Skill_JAHYUL.Text = '') then
      begin
         PostMessage(Handle_1, WM_KEYDOWN, RecSALBO.JAHYUL, 0); // 전혈or소생
         PostMessage(Handle_1, WM_KEYUP, RecSALBO.JAHYUL, 0);
         PostMessage(Handle_1, WM_KEYDOWN, RecSALBO.JAHYUL, 0);
         PostMessage(Handle_1, WM_KEYUP, RecSALBO.JAHYUL, 0);
         PostMessage(Handle_1, WM_KEYDOWN, RecSALBO.JAHYUL, 0);
         PostMessage(Handle_1, WM_KEYUP, RecSALBO.JAHYUL, 0);
      end;

      Sleep(100);

      if not (EdtSALBO_Skill_WOONKI.Text = '')  then
      begin
         PostMessage(Handle_1, WM_KEYDOWN, RecSALBO.WOONKI, 0); // 운기
         PostMessage(Handle_1, WM_KEYUP, RecSALBO.WOONKI, 0);
      end;
{$ENDIF}
   end;
end;

function TForm3.UserCheck: Boolean;
var
   Reg_1 : TRegistry;
begin
   result := False;
   try
      Reg_1 := TRegistry.Create;
      Reg_1.RootKey := HKEY_CURRENT_USER;
      Reg_1.OpenKey('\Software\MicroSoft\WindsData', True);
      if not Reg_1.ValueExists('Release Lock_1') then
      begin
         pnl_Lock.Height := Self.Height;
         pnl_Lock.Width := Self.Width;
         pnl_Lock.Top := 25;
         pnl_Lock.Left := 0;
         pnl_Lock.Color := PnlMain.Color;
         pnl_Lock.BringToFront;
         pnl_Lock.Visible := True;
      end else
         result := True;
   finally
      Reg_1.CloseKey;
      Reg_1.Free;
   end;
end;

procedure TForm3.SetNumberEdit(Edit: TWinControl);
var
   defstyle: dWord;
begin
   defstyle := GetWindowLong(Edit.Handle, GWL_STYLE);
   SetWindowLong(Edit.Handle, GWL_STYLE, defstyle or ES_NUMBER);
end;

procedure TForm3.KeySetting;
begin
//   RecFuncKey.Func_Title   := FunckeyToKeycode(Cbx_Title.ItemIndex);
   RecFuncKey.Func_Start   := FunckeyToKeycode(Cbx_Start.ItemIndex);
   RecFuncKey.Func_Stop    := FunckeyToKeycode(Cbx_Stop.ItemIndex);

{$IFDEF SALBO}
   RecSALBO.SALBO := NumkeyToKeycode(StrToInt(EdtSALBO_Skill_SALBO.Text));
   if not (EdtSALBO_Skill_JAHYUL.Text = '') then
      RecSALBO.JAHYUL := NumkeyToKeycode(StrToInt(EdtSALBO_Skill_JAHYUL.Text));
   if not (EdtSALBO_Skill_WOONKI.Text = '') then
      RecSALBO.WOONKI := NumkeyToKeycode(StrToInt(EdtSALBO_Skill_WOONKI.Text));
   if not (EdtSALBO_Skill_DOBAL.Text = '') then      
      RecSALBO.DOBAL  := NumkeyToKeycode(StrToInt(EdtSALBO_Skill_DOBAL.Text));

   GroupMemNum_1 := NumkeyToKeycode(StrToInt(Cbx_GrpNum1.Text));
   GroupMemNum_2 := NumkeyToKeycode(StrToInt(Cbx_GrpNum2.Text));
   GroupMemNum_3 := NumkeyToKeycode(StrToInt(Cbx_GrpNum3.Text));
   GroupMemNum_4 := NumkeyToKeycode(StrToInt(Cbx_GrpNum4.Text));
{$ENDIF}
end;

procedure TForm3.HideTitlebar(Form:TForm);
var
   Save : LongInt;
begin
   if Form.BorderStyle=bsNone then Exit;
   Save:=GetWindowLong(Form.Handle,gwl_Style);
   if (Save and ws_Caption)=ws_Caption then
   begin
      case Form.BorderStyle of
         bsSingle,bsSizeable : SetWindowLong(Form.Handle,gwl_Style,Save and (not(ws_Caption)) or ws_border);
         bsDialog : SetWindowLong(Form.Handle,gwl_Style,Save and (not(ws_Caption)) or ds_modalframe or ws_dlgframe);
      end;
      Form.Height := Form.Height - getSystemMetrics(sm_cyCaption);
      Form.Refresh;
   end;
end;


end.

// Bak
         { if not WinTitleFlag then
           begin
           //            NHandle := GetForegroundWindow;
           //            SetWindowText(NHandle, Form3.WinTitleText1.Text);
           Handle_1 := GetForegroundWindow;
           // 현재의 타이틀 저장
           if Handle_1 <> 0 then
           begin
           Len := GetWindowTextLength(Handle_1) + 1;
           SetLength(Title, Len);
           GetWindowText(Handle_1, PChar(Title), Len);
           TitleTxt := TrimRight(Title);
           Form3.Memo1.Lines.Add('TitleTxt:'+TitleTxt);
           end;
           SetWindowText(Handle_1, Form3.WinTitleText1.Text);
           WinTitleFlag := True;
           Form3.Memo1.Lines.Add('WinTitleFlag: True');
           end else
           begin
           Form3.Memo1.Lines.Add('TitleTxt:'+TitleTxt);
           SetWindowText(Handle_1, TitleTxt);
           WinTitleFlag := False;
           Form3.Memo1.Lines.Add('WinTitleFlag: False');
           end; }

         {
           // 키 정보 받아오기
           PKeyHook := Ptr(kStrokeInfo);
           if HookCode >= 0 then begin
           // SHIFT + F2
           // Showmessage(Format('%d',[GetAsyncKeyState(VK_SHIFT)]));
           if (PKeyHook.vkCode = VK_F2) then
           begin
           // 항상 맨 위에
           //         Form3.FormStyle := fsStayOnTop;
           Result := 1;
           end else }
