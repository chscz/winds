unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
   TCallbackHookProc = function(code: Integer; wParam: wParam; lParam: lParam):NativeInt ;    // stdcall;
   TForm2 = class(TForm)
//      function CallbackHookProc(code: Integer; wParam: wParam; lParam: lParam): NativeInt;
      function HookKB: Boolean;
      function unHookKB: Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   Form2: TForm2;
   hook: HHOOK;
//   PHandle : THandle;

implementation

{$R *.dfm}


function CallbackHookProc(code: Integer; wParam: wParam; lParam: lParam): NativeInt; //stdcall;
begin
    MessageBox(0, PChar(Chr(wParam) + #0), '', MB_OK);

//   PostMessage(PHandle, WM_KEYDOWN, VK_F9, 0); //Send a message to a button that key pressed
//   POstMessage(PHandle, WM_KEYUP, VK_F9, 0); //Send a message to a button that key up
    Result := CallNextHookEx(hook, code, wParam, lParam);
end;
function TForm2.HookKB: Boolean;
begin
    hook := SetWindowsHookEx(WH_KEYBOARD, CallbackHookProc, HInstance, 0);
    Result := Boolean(hook);
end;

function TForm2.UnHookKB: Boolean;
begin
    Result := UnhookWindowsHookEx(hook);
end;

end.
