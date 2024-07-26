unit Unit1;

interface

uses
    System.SysUtils, Winapi.Windows, Winapi.messages
    ;



var
       hook: HHOOK;
    PHandle : THandle;
implementation
function CallbackHookProc(code: Integer; wParam: wParam; lParam: lParam): NativeInt; //stdcall;
begin
    MessageBox(0, PChar(Chr(wParam) + #0), '', MB_OK);

//   PostMessage(PHandle, WM_KEYDOWN, VK_F9, 0); //Send a message to a button that key pressed
//   POstMessage(PHandle, WM_KEYUP, VK_F9, 0); //Send a message to a button that key up
    Result := CallNextHookEx(hook, code, wParam, lParam);
end;
function HookKB: Boolean;
begin
    hook := SetWindowsHookEx(WH_KEYBOARD, CallbackHookProc, HInstance, 0);
    Result := Boolean(hook);
end;

function UnHookKB: Boolean;
begin
    Result := UnhookWindowsHookEx(hook);
end;

end.
