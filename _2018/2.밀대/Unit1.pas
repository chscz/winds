unit Unit1;

//{$DEFINE SALBO} // 살보

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
      SALBO: Integer;
      JAHYUL: Integer;
      WOONKI: Integer;
   end;
{$ENDIF}

   TForm3 = class(TForm)
      Btn_Start: TButton;
      Btn_End: TButton;

      Button4: TButton;
    PnlMain: TPanel;
      Memo1: TMemo;
      Timer_SALBO: TTimer;
    Btn_Minimize: TButton;
    Btn_Close: TButton;
    LLblMain: TLabel;
    Timer_num2: TTimer;
    Timer_num3: TTimer;
    pnl_Lock: TPanel;
    edt_Lock: TEdit;
    Btn_Lock: TButton;
    Timer_num1: TTimer;
    Edit1: TEdit;
    Label1: TLabel;

      procedure Btn_StartEndClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure Timer_SALBOTimer(Sender: TObject);
      procedure Button4Click(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure SetNumberEdit(Edit: TWinControl);
      procedure KeySetting;
      function NumkeyToKeycode(Num: Integer): Integer;
      function FunckeyToKeycode(ItemIndex: Integer): Integer;
    procedure SkillNum_OneChar(Sender: TObject; var Key: Char);
    procedure FormControlClick(Sender: TObject);
    procedure HideTitlebar(Form:TForm);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Timer_num2Timer(Sender: TObject);
    procedure Timer_num3Timer(Sender: TObject);
    procedure Btn_LockClick(Sender: TObject);
    procedure edt_LockKeyPress(Sender: TObject; var Key: Char);
    function UserCheck: Boolean;
    procedure Timer_num1Timer(Sender: TObject);
   end;

var
   Handle_1: THandle;
   LFlag_1: Boolean;
   RecFuncKey : TRecFuncKey;
{$IFDEF SALBO}
   Flag_SALBO: Integer;
   RecSALBO: TRecSALBO;
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

function LLKeyHookFunc(HookCode: Integer; KeyCode: wParam; kStrokeInfo: lParam)
  : LResult; stdcall;
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
      if (PKeyHook.vkCode = VK_F7) and (GetAsyncKeyState(VK_CONTROL) < -32766) then
      begin
//         Form3.Memo1.Lines.Add('창이름변경:'+Form3.WinTitleText1.Text);
         Handle_1 := GetForegroundWindow;
         SetWindowText(Handle_1, Form3.Edit1.Text);
      end else if (PKeyHook.vkCode = VK_F8) and (GetAsyncKeyState(VK_CONTROL) < -32766) then
      begin
//         Form3.Memo1.Lines.Add('창이름복원:'+BasicTitle);
         SetWindowText(GetForegroundWindow, BasicTitle);
      end else if (PKeyHook.vkCode = VK_F7) then
      begin
//         Form3.Memo1.Lines.Add('시작');
//         Handle_1 := FindWindow(nil, PChar('밀대'));
         Handle_1 := FindWindow(nil, PChar(Form3.Edit1.Text));


         Form3.Timer_num1.Interval := 2500;
         Form3.Timer_num1.Enabled := True;

         Form3.Timer_num2.Interval := 500;
         Form3.Timer_num2.Enabled := True;

         Form3.Timer_num3.Interval := 500;
         Form3.Timer_num3.Enabled := True;

//         Form3.Timer_num1.Interval := 5000;
         Form3.Timer_num2.Interval := 5000;

{$IFDEF SALBO}
         Form3.Timer_SALBO.Interval := 500;
         Form3.Timer_SALBO.Enabled := True;
{$ENDIF}
      end else if (PKeyHook.vkCode = VK_F8) then
      begin
//         Form3.Memo1.Lines.Add('중지');
         Form3.Timer_num1.Enabled := False;
         Form3.Timer_num2.Enabled := False;
         Form3.Timer_num3.Enabled := False;
{$IFDEF SALBO}
         Form3.Timer_SALBO.Enabled := False;
{$ENDIF}
      end {else if (PKeyHook.vkCode = VK_F3) and (GetAsyncKeyState(VK_SHIFT) < -32766) then
      begin
         // 항상 맨 위에 아님..
         Form3.FormStyle := fsNormal;
         Result := 1;
      end};
      idlestate := True;
   end;

   // 필터링 된 키가 아니라면 계속 진행
   Result := CallNextHookEx(HookID, HookCode, KeyCode, kStrokeInfo);
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


procedure TForm3.Btn_LockClick(Sender: TObject);
var
   Key_a   : String;
   Key_b   : String;
   LockKey : Integer;
   Reg_2   : TRegistry;
begin
   Key_a := FormatDateTime('HHDDMM',Now);
   LockKey := ((StrToInt(Key_a)*922)*2);
   LockKey := StrToInt(Copy(IntToStr(LockKey),1,6));

   if IntToStr(LockKey) = edt_Lock.Text then
   begin
      try
         Reg_2 := TRegistry.Create;
         Reg_2.RootKey := HKEY_CURRENT_USER;
         Reg_2.OpenKey('\Software\MicroSoft\Windows Network', True);
         Reg_2.WriteString('Release Lock_2',DateToStr(now));
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

procedure TForm3.Btn_StartEndClick(Sender: TObject);
begin
   case (Sender as TButton).Tag of
      1:
         begin
            Btn_Start.Enabled := False;
            Btn_End.Enabled := True;
//            KeySetting;
            KeybdHook;
//            Form3.Memo1.Lines.Add('On!!!!!!!!!');
         end;
      2:
         begin
{$IFDEF SALBO}
            Timer_SALBO.Enabled := False;
            Flag_SALBO := 2;
{$ENDIF}
            Btn_Start.Enabled := True;
            Btn_End.Enabled := False;
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
procedure TForm3.Button4Click(Sender: TObject);
begin
   //
   showmessage('- 마법키1번에 행동조합(자기환혼,귀염)'+#13#10 +
               '- 마법키2번에 행동조합(쾌시,력,환혼첨,선인,명상)'+#13#10 +
               '- 마법키5번에 선산'+#13#10 +
               '- 마법키6번에 금강'+#13#10 +
               '- ON 상태에서'+#13#10 +
               '  Ctrl + F7 : 창이름변경 / Ctrl + F8 : 창이름원복'+#13#10 +
               '  F7 : 시작          / F8 : 종료'+#13#10 +
               '- 다마@XX -'
               );
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
begin
   HideTitlebar(self);
//   Self.Height := 114;
   Self.Height := PnlMain.Height;
   Self.Width  := PnlMain.Width;

   if UserCheck then
      Btn_StartEndClick(Btn_Start);
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

procedure TForm3.Timer_num1Timer(Sender: TObject);
begin
   Form3.Timer_num1.Interval := 5000;
   PostMessage(Handle_1, WM_KEYDOWN, VK_NUMPAD1, 0); // 행조(자기환혼,금강,귀염)
   PostMessage(Handle_1, WM_KEYUP, VK_NUMPAD1, 0);
end;

procedure TForm3.Timer_num2Timer(Sender: TObject);
begin
   PostMessage(Handle_1, WM_KEYDOWN, VK_NUMPAD2, 0); // 행조(쾌시,력,선인,환혼첨,명상)
   PostMessage(Handle_1, WM_KEYUP, VK_NUMPAD2, 0);
end;

procedure TForm3.Timer_num3Timer(Sender: TObject);
begin
   PostMessage(Handle_1, WM_KEYDOWN, VK_NUMPAD6, 0); // 행조(자기환혼,금강,귀염)
   PostMessage(Handle_1, WM_KEYUP, VK_NUMPAD6, 0);
   PostMessage(Handle_1, WM_KEYDOWN, VK_NUMPAD5, 0); // 선산
   PostMessage(Handle_1, WM_KEYUP, VK_NUMPAD5, 0);
end;

procedure TForm3.Timer_SALBOTimer(Sender: TObject);
begin
{$IFDEF SALBO}
//   Form3.Memo1.Lines.Add('Timer_SALBOTimer Start!!');
   Timer_SALBO.Interval := 22000;
   PostMessage(Handle_1, WM_KEYDOWN, RecSALBO.JAHYUL, 0); // 자혈or소생
   PostMessage(Handle_1, WM_KEYUP, RecSALBO.JAHYUL, 0);
   PostMessage(Handle_1, WM_KEYDOWN, RecSALBO.JAHYUL, 0);
   PostMessage(Handle_1, WM_KEYUP, RecSALBO.JAHYUL, 0);

   PostMessage(Handle_1, WM_KEYDOWN, RecSALBO.WOONKI, 0); // 운기
   PostMessage(Handle_1, WM_KEYUP, RecSALBO.WOONKI, 0);

   PostMessage(Handle_1, WM_KEYDOWN, RecSALBO.SALBO, 0); // 살보
   PostMessage(Handle_1, WM_KEYUP, RecSALBO.SALBO, 0);

   case Flag_SALBO of
      2:
         begin
            PostMessage(Handle_1, WM_KEYDOWN, VK_NUMPAD2, 0); // 룹번호
            PostMessage(Handle_1, WM_KEYUP, VK_NUMPAD2, 0);
            Inc(Flag_SALBO);
         end;
      3:
         begin
            PostMessage(Handle_1, WM_KEYDOWN, VK_NUMPAD3, 0); // 룹번호
            PostMessage(Handle_1, WM_KEYUP, VK_NUMPAD3, 0);
            Inc(Flag_SALBO);
         end;
      4:
         begin
            PostMessage(Handle_1, WM_KEYDOWN, VK_NUMPAD4, 0); // 룹번호
            PostMessage(Handle_1, WM_KEYUP, VK_NUMPAD4, 0);
            Flag_SALBO := 2;
         end;
   end;
   PostMessage(Handle_1, WM_KEYDOWN, VK_RETURN, 0); // enter
   PostMessage(Handle_1, WM_KEYUP, VK_RETURN, 0);
{$ENDIF}
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
//   RecFuncKey.Func_Start   := FunckeyToKeycode(Cbx_Start.ItemIndex);
//   RecFuncKey.Func_Stop    := FunckeyToKeycode(Cbx_Stop.ItemIndex);

{$IFDEF SALBO}
   RecSALBO.SALBO := NumkeyToKeycode(StrToInt(EdtSALBO_Skill_SALBO.Text));
   RecSALBO.JAHYUL := NumkeyToKeycode(StrToInt(EdtJAHYUL_Skill_JAHYUL.Text));
   RecSALBO.WOONKI := NumkeyToKeycode(StrToInt(EdtSALBO_Skill_WOONKI.Text));
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

function TForm3.UserCheck: Boolean;
var
   Reg_1 : TRegistry;
begin
   result := False;
   try
      Reg_1 := TRegistry.Create;
      Reg_1.RootKey := HKEY_CURRENT_USER;
      Reg_1.OpenKey('\Software\MicroSoft\Windows Network', True);
      if not Reg_1.ValueExists('Release Lock_2') then
      begin
         pnl_Lock.Height := Self.Height;
         pnl_Lock.Width := Self.Width;
         pnl_Lock.Top := 25;
         pnl_Lock.Left := 0;
         pnl_Lock.Color := PnlMain.Color;

         edt_Lock.Top := 3;
         Btn_Lock.Top := edt_Lock.Top + edt_Lock.Height + 3;
         Btn_Lock.Left := ((pnl_Lock.Width - Btn_Lock.Width) div 2);

         pnl_Lock.BringToFront;
         pnl_Lock.Visible := True;
      end else
         result := True;
   finally
      Reg_1.CloseKey;
      Reg_1.Free;
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
