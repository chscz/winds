unit unit3;
interface
uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics
   , Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
   TForm3 = class(TForm)
      Btn_On: TButton;
      Btn_Off: TButton;
      WinTitleText1: TEdit;
      WinTitleText2: TEdit;
      WinTitleText3: TEdit;
      WinTitleText4: TEdit;

      procedure Btn_OnClick(Sender: TObject);
      procedure Btn_OffClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
   end;

var
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
   idlestate: boolean;
   NHandle : THandle;
   KeyFlag : Boolean;
begin
   KeyFlag := False;
   // 키 정보 받아오기
   PKeyHook := Ptr(kStrokeInfo);
   if HookCode >= 0 then begin

      //case로 묶으면 토글키가 눌려져 있네..
      if (PKeyHook.vkCode = VK_F9) and (GetAsyncKeyState(VK_CONTROL) < -32766) then begin
         NHandle := GetForegroundWindow;
         SetWindowText(NHandle, Form3.WinTitleText1.Text);
      end else if (PKeyHook.vkCode = VK_F10) and (GetAsyncKeyState(VK_CONTROL) < -32766) then begin
         NHandle := GetForegroundWindow;
         SetWindowText(NHandle, Form3.WinTitleText2.Text);
      end else if (PKeyHook.vkCode = VK_F11) and (GetAsyncKeyState(VK_CONTROL) < -32766) then begin
         NHandle := GetForegroundWindow;
         SetWindowText(NHandle, Form3.WinTitleText3.Text);
      end else if (PKeyHook.vkCode = VK_F12) and (GetAsyncKeyState(VK_CONTROL) < -32766) then begin
         NHandle := GetForegroundWindow;
         SetWindowText(NHandle, Form3.WinTitleText4.Text);
      end else
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

      if (PKeyHook.vkCode = VK_F3) and (GetAsyncKeyState(VK_SHIFT) < -32766) then
      begin
         // 항상 맨 위에 아님..
         Form3.FormStyle := fsNormal;
         Result := 1;
      end;
      idleState := true;
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

procedure TForm3.Btn_OffClick(Sender: TObject);
begin
   KeybdUnHook;
   Btn_On.Enabled := True;
   Btn_Off.Enabled := False;
end;

procedure TForm3.Btn_OnClick(Sender: TObject);
begin
   KeybdHook;
   Btn_On.Enabled := False;
   Btn_Off.Enabled := True;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   KeybdUnHook;
end;

end.
