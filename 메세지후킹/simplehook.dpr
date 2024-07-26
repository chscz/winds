library simplehook;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
    System.SysUtils, Winapi.Windows, Winapi.messages, Vcl.Dialogs
    ;

{$R *.res}
const
   WM_KeyEvent             =  WM_USER + 0922;
   SetWinTitle             = $1;
   SetWinTitle_Back        = $2;

var
    hook: HHOOK;
    PHandle : THandle;

function CallbackHookProc(code: Integer; wParam: wParam; lParam: lParam): NativeInt; stdcall;
var
   KeyCode : Integer;
   aHandle : THandle;
begin
   aHandle := GetForegroundWindow;
      SetWindowText(aHandle,'zzz');

//   case wParam of
//      120: PostMessage(PHandle, WM_KeyEvent, SetWinTitle, 1);
//      121: PostMessage(PHandle, WM_KeyEvent, SetWinTitle, 2);
//      122: PostMessage(PHandle, WM_KeyEvent, SetWinTitle, 3);
//      123: PostMessage(PHandle, WM_KeyEvent, SetWinTitle, 4);
//      else
//
//   end;
         MessageBox(0, PChar(Chr(wParam) + #0), '', MB_OK);
//         PostMessage(PHandle, WM_KEYDOWN, VK_F9, 0); //Send a message to a button that key pressed
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

procedure SendHandle(MyHandle:HWND);
begin
   PHandle := MyHandle;
end;

exports
    HookKB, UnHookKB, SendHandle
    ;

begin
    hook := 0;

end.
