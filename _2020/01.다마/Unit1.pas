unit Unit1;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
   Vcl.StdCtrls, Vcl.ComCtrls,
   Vcl.ExtCtrls, Vcl.Buttons
   , System.Win.Registry
   // , untImageSearch
     ;

type
   TDDD = class(TForm)
    PnlMain: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    pnl_Lock: TPanel;
    edt_Lock: TEdit;
    Btn_Lock: TButton;
    Pnl_Ctrl: TPanel;
    Btn_Minimize: TButton;
    Btn_Close: TButton;
    ComboBox1: TComboBox;
    Timer1: TTimer;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
    procedure FormControlClick(Sender: TObject);
    procedure HideTitlebar(Form:TForm);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    function UserCheck: Boolean;
    procedure Btn_LockClick(Sender: TObject);
    procedure edt_LockKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);

   end;

var
   Handle_1: THandle;
   DDD1: TDDD;
   HookID: HHOOK;

   tID1 : TBitmap;
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

procedure delay(Time: Integer);
var
   PastCount: LongInt;
begin
   PastCount := GetTickCount;
   repeat
      Application.ProcessMessages;
   until ((GetTickCount-PastCount) >= LongInt(Time));
end;
function LLKeyHookFunc(HookCode: Integer; KeyCode: wParam; kStrokeInfo: lParam): LResult; stdcall;
var
   PKeyHook: PKeyHookStruct;
begin
   // 키 정보 받아오기
   PKeyHook := Ptr(kStrokeInfo);
                                                       // and (GetAsyncKeyState(VK_CONTROL) < -32766)  //눌리면
   if HookCode >= 0 then
   begin
      // 진백 영풍 무해 어검화 극백 대지파열 광백
      if (KeyCode = 256) and (PKeyHook.vkCode = VK_NEXT) and (GetAsyncKeyState(VK_CONTROL) > -32766) then
      begin
         keybd_event(VkKeyScan('q'),0,0,0);
         keybd_event(VK_NUMPAD4,0,0,0);
         keybd_event(VK_NUMPAD6,0,0,0);
         keybd_event(VK_SHIFT, 0, 0, 0);
         keybd_event(VkKeyScan('r'),0,0,0);
         keybd_event(VkKeyScan('z'),0,0,0);
         keybd_event(VkKeyScan('s'),0,0,0);
         keybd_event(VK_SHIFT, 0, KEYEVENTF_KEYUP, 0);
         keybd_event(VkKeyScan('c'),0,0,0);
         keybd_event(VK_NUMPAD2,0,0,0);
         Result := 1;
      end
      else if (KeyCode = 257) and (PKeyHook.vkCode = VK_NEXT) then
         Result := 1
      // 2뱀 묵저
      else if (KeyCode = 256) and (PKeyHook.vkCode = VK_PRIOR) and (GetAsyncKeyState(VK_CONTROL) > -32766) then
//      else if (KeyCode = 256) and (PKeyHook.vkCode = VK_F1) and (GetAsyncKeyState(VK_CONTROL) > -32766) then
      begin
         keybd_event(VK_MENU, 0, 0, 0);
         keybd_event(VK_DIVIDE,0,0,0);
         keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
         keybd_event(VK_NUMPAD8,0,0,0);   //청룡 소환
         delay(100);
         keybd_event(VK_MENU, 0, 0, 0);
         keybd_event(VK_DIVIDE,0,0,0);
         keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
         keybd_event(VK_NUMPAD9,0,0,0);   //청룡 소환
         delay(150);
         keybd_event(VK_RETURN,0,0,0);   //엔터
         keybd_event(VK_RETURN,0,0,0);   //엔터
         delay(50);

         keybd_event(VK_DIVIDE,0,0,0);
         keybd_event(VK_NUMPAD9,0,0,0);
         keybd_event(VkKeyScan('f'),0,0,0);
         keybd_event(VK_NUMPAD5,0,0,0);      // 무카
         delay(100);
         keybd_event(VK_DIVIDE,0,0,0);
         keybd_event(VK_NUMPAD8,0,0,0);
         keybd_event(VkKeyScan('f'),0,0,0);
         keybd_event(VK_NUMPAD5,0,0,0);      // 무카
         delay(100);
         keybd_event(VK_DIVIDE,0,0,0);
         keybd_event(VK_NUMPAD8,0,0,0);
         keybd_event(VkKeyScan('f'),0,0,0);
         keybd_event(VK_NUMPAD9,0,0,0);      // 저주
         delay(100);
         keybd_event(VK_DIVIDE,0,0,0);
         keybd_event(VK_NUMPAD8,0,0,0);
         keybd_event(VkKeyScan('f'),0,0,0);
         keybd_event(VK_NUMPAD0,0,0,0);      // 재앙
         delay(100);
      // 불멸청룡 묵저
      end
//      else if (KeyCode = 257) and (PKeyHook.vkCode = VK_F1) then
      else if (KeyCode = 257) and (PKeyHook.vkCode = VK_PRIOR) then
         Result := 1
      else if (KeyCode = 256) and (PKeyHook.vkCode = VK_PRIOR) and (GetAsyncKeyState(VK_CONTROL) < -32766) then
      begin
         keybd_event(VK_MENU, 0, 0, 0);
         keybd_event(VK_DIVIDE,0,0,0);
         keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
         keybd_event(VK_NUMPAD1,0,0,0);   //청룡 소환
         delay(100);
         keybd_event(VK_DIVIDE,0,0,0);
         keybd_event(VK_NUMPAD1,0,0,0);
         keybd_event(VkKeyScan('f'),0,0,0);
         keybd_event(VK_NUMPAD5,0,0,0);      // 무카
         delay(100);
         keybd_event(VK_DIVIDE,0,0,0);
         keybd_event(VK_NUMPAD1,0,0,0);
         keybd_event(VkKeyScan('f'),0,0,0);
         keybd_event(VK_NUMPAD9,0,0,0);      // 저주
         delay(100);
      end
      else if (KeyCode = 257) and (PKeyHook.vkCode = VK_PRIOR) then
         Result := 1
      // 사맹 해제
      else if (KeyCode = 256) and (PKeyHook.vkCode = VK_F9) then
      begin
         keybd_event(222,0,0,0);
         Delay(50);
         // /마법해제
         keybd_event(VkKeyScan('/'),0,0,0);
         keybd_event(VkKeyScan('a'),0,0,0);
         keybd_event(VkKeyScan('k'),0,0,0);
         keybd_event(VkKeyScan('q'),0,0,0);
         keybd_event(VkKeyScan('j'),0,0,0);
         keybd_event(VkKeyScan('q'),0,0,0);
         keybd_event(VkKeyScan('g'),0,0,0);
         keybd_event(VkKeyScan('o'),0,0,0);
         keybd_event(VkKeyScan('w'),0,0,0);
         keybd_event(VkKeyScan('p'),0,0,0);
         keybd_event(VkKeyScan(' '),0,0,0);
         Delay(50);
         // 사맹해제 엔터
         keybd_event(VkKeyScan('t'),0,0,0);
         keybd_event(VkKeyScan('k'),0,0,0);
         keybd_event(VkKeyScan('t'),0,0,0);
         keybd_event(VkKeyScan('l'),0,0,0);
         keybd_event(VkKeyScan('s'),0,0,0);
         keybd_event(VkKeyScan('a'),0,0,0);
         keybd_event(VkKeyScan('o'),0,0,0);
         keybd_event(VkKeyScan('d'),0,0,0);
         keybd_event(VkKeyScan('d'),0,0,0);
         keybd_event(VkKeyScan('i'),0,0,0);
         keybd_event(VkKeyScan('r'),0,0,0);
         keybd_event(VkKeyScan(' '),0,0,0);
         keybd_event(VK_NUMPAD5,0,0,0);
         keybd_event(VkKeyScan('t'),0,0,0);
         keybd_event(VkKeyScan('j'),0,0,0);
         keybd_event(VkKeyScan('d'),0,0,0);
         Delay(50);
         keybd_event(VK_RETURN,0,0,0);
         Delay(30);
         keybd_event(VK_RETURN,0,0,0);
         Delay(30);
      end
      else if (KeyCode = 257) and (PKeyHook.vkCode = VK_F9) then
         Result := 1
      // 쾌도
      else if (KeyCode = 256) and (PKeyHook.vkCode = VK_SCROLL) then
      begin
         keybd_event(VkKeyScan(']'),0,0,0);
         keybd_event(VkKeyScan('g'),0,0,0);
         Delay(230);
         keybd_event(VkKeyScan('a'),0,0,0);
         keybd_event(VkKeyScan(']'),0,0,0);
         keybd_event(VkKeyScan('g'),0,0,0);
      end
      else if (KeyCode = 257) and (PKeyHook.vkCode = VK_SCROLL) then
         Result := 1
      // 쾌도
      else if (KeyCode = 256) and (PKeyHook.vkCode = VK_PAUSE) then
      begin
         keybd_event(VkKeyScan(']'),0,0,0);
         keybd_event(VkKeyScan('c'),0,0,0);
         Delay(230);
         keybd_event(VkKeyScan('a'),0,0,0);
         keybd_event(VkKeyScan(']'),0,0,0);
         keybd_event(VkKeyScan('c'),0,0,0);
//         keybd_event(VkKeyScan(']'),0,0,0);
//         keybd_event(VkKeyScan('g'),0,0,0);
//         Delay(230);
//         keybd_event(VkKeyScan('a'),0,0,0);
//         keybd_event(VkKeyScan(']'),0,0,0);
//         keybd_event(VkKeyScan('g'),0,0,0);
      end
      else if (KeyCode = 257) and (PKeyHook.vkCode = VK_PAUSE) then
         Result := 1
//      else if (KeyCode = 256) and (PKeyHook.vkCode = VK_NUMPAD8) and (GetAsyncKeyState(VK_CONTROL) < -32766) then
//      begin
//         keybd_event(VkKeyScan('q'),0,0,0);
//         keybd_event(VK_SHIFT, 0, 0, 0);
//         keybd_event(VkKeyScan('z'),0,0,0);
//         keybd_event(VkKeyScan('x'),0,0,0);
//         keybd_event(VkKeyScan('r'),0,0,0);
//         keybd_event(VK_SHIFT, 0, KEYEVENTF_KEYUP, 0);
//         keybd_event(VK_CONTROL, 0, 0, 0);
//         keybd_event(VK_NUMPAD7,0,0,0);
//         keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0);
//      end
      // 회오리
      else if (KeyCode = 256) and (PKeyHook.vkCode = VK_NUMLOCK) then
      begin
//         keybd_event(VkKeyScan(']'),0,0,0);
//         keybd_event(VkKeyScan('c'),0,0,0);
//         DDD1.Timer1.Enabled := True;

      end
      else if (KeyCode = 257) and (PKeyHook.vkCode = VK_NUMLOCK) then
//         Result := 1
      else
         // 필터링 된 키가 아니라면 계속 진행
         Result := CallNextHookEx(HookID, HookCode, KeyCode, kStrokeInfo);
  end;
end;

procedure TDDD.Timer1Timer(Sender: TObject);
// 회오리
begin
   Timer1.Enabled := False;
   keybd_event(VkKeyScan('a'),0,0,0);
   keybd_event(VkKeyScan(']'),0,0,0);
   keybd_event(VkKeyScan('c'),0,0,0);
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

//타이틀 캡션, 버튼 처리
procedure TDDD.FormControlClick(Sender: TObject);
begin
   case (Sender as TButton).Tag of
      8: Application.Minimize;
      9: Close;
   end;
end;

procedure TDDD.Button1Click(Sender: TObject);
begin
   case (Sender as TButton).Tag of
      0:
      begin
         Button1.Enabled := False;
         Button2.Enabled := True;
         KeybdHook;
      end;
      1:
      begin
         Button1.Enabled := True;
         Button2.Enabled := False;
         KeybdUnhook;
      end;
   end;
end;

procedure TDDD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   KeybdUnhook;
   ExitProcess(0);
end;

procedure TDDD.FormCreate(Sender: TObject);
begin
   HideTitlebar(self);
   Self.Height := PnlMain.Height;
   Self.Width  := PnlMain.Width;
//   Self.Width  := 125;
   if  UserCheck then
      Button1Click(Button1);
end;

//유저체크
function TDDD.UserCheck: Boolean;
var
   Reg_1 : TRegistry;
begin
   result := False;
   try
      Reg_1 := TRegistry.Create;
      Reg_1.RootKey := HKEY_CURRENT_USER;
      Reg_1.OpenKey('\Software\MicroSoft\Windows Network', True);
      if not Reg_1.ValueExists('Release Lock_1') then
      begin
         pnl_Lock.Height   := Self.Height;
         pnl_Lock.Width    := Self.Width;
         pnl_Lock.Top      := 25;
         pnl_Lock.Left     := 0;
         pnl_Lock.Color    := PnlMain.Color;
         edt_Lock.Left     := (pnl_Lock.Width - edt_Lock.Width) div 2;
         edt_Lock.Top      := pnl_Lock.Height div 4;
         Btn_Lock.Top      := edt_Lock.Top + edt_Lock.Height;
         Btn_Lock.Left     := (pnl_Lock.Width - Btn_Lock.Width) div 2;
//         Lbl_DateCheck.Caption := '';

         PnlMain.Enabled := False;
         pnl_Lock.BringToFront;
         pnl_Lock.Visible := True;
      end else
{
      if (DaysBetween(now, StrToDate(Reg_1.ReadString('Release Lock_3'))) > 100) then
      begin
         pnl_Lock.Height := Self.Height;
         pnl_Lock.Width := Self.Width;
         pnl_Lock.Top := 25;
         pnl_Lock.Left := 0;
         pnl_Lock.Color := PnlMain.Color;
         edt_Lock.Left := (pnl_Lock.Width - edt_Lock.Width) div 2;
         edt_Lock.Top := pnl_Lock.Height div 4;
         Btn_Lock.Top := edt_Lock.Top + edt_Lock.Height*2;
         Btn_Lock.Left := (pnl_Lock.Width - Btn_Lock.Width) div 2;
         Lbl_DateCheck.Caption := '';

         PnlMain.Enabled := False;
         pnl_Lock.BringToFront;
         pnl_Lock.Visible := True;
      end else
}  //기간제시 주석해제
      begin
//         Lbl_DateCheck.Caption := '(D-'+IntToStr(100 - DaysBetween(now, StrToDate(Reg_1.ReadString('Release Lock_3'))))+')';
////         Lbl_DateCheck.Caption := '(무기한)';
//         Lbl_DateCheck.Left := Pnl_Ctrl.Left - Lbl_DateCheck.Width - 2;
         result := True;
      end;
   finally
      Reg_1.CloseKey;
      Reg_1.Free;
   end;
end;

procedure TDDD.Btn_LockClick(Sender: TObject);
//잠금
var
   Key_a        : String;
   LockKey      : Integer;
   Reg_2        : TRegistry;
begin
   Key_a := FormatDateTime('HHDDMM',Now);
   LockKey := ((StrToInt(Key_a)*922)*1);
   LockKey := StrToInt(Copy(IntToStr(LockKey),1,6));

   if IntToStr(LockKey) = edt_Lock.Text then
   begin
      try
         Reg_2 := TRegistry.Create;
         Reg_2.RootKey := HKEY_CURRENT_USER;
         Reg_2.OpenKey('\Software\MicroSoft\Windows Network', True);
         Reg_2.WriteString('Release Lock_1',DateToStr(now));
      finally
         Reg_2.CloseKey;
         Reg_2.Free;
      end;
      pnl_Lock.Visible := False;
      PnlMain.Enabled := True;
//      Btn_StartEndClick(Btn_Start);
   end else begin
      MessageDlg('키 불일치',mtError,[mbOK],0);
   end;
end;

procedure TDDD.edt_LockKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      Btn_LockClick(Btn_Lock);
end;

//폼 이동 처리
procedure TDDD.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
   ReleaseCapture();
   SendMessage(Handle,WM_SYSCOMMAND,$F012,0 );
end;

procedure TDDD.HideTitlebar(Form:TForm);
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


