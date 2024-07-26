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
    System.SysUtils,
    Winapi.Windows;

{$R *.res}

var
    hook: HHOOK;

function CallbackHookProc(code: Integer; wParam: wParam; lParam: lParam): NativeInt; stdcall;
begin
    MessageBox(0, PChar(Chr(wParam) + #0), '', MB_OK);
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

exports
    HookKB,
    UnHookKB;

begin
    hook := 0;

end.
