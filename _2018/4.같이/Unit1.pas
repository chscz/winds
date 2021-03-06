unit Unit1;

//{$DEFINE SALBO} // 살보

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
   Vcl.StdCtrls, Vcl.ComCtrls,
   Vcl.ExtCtrls, Vcl.Buttons
   , System.Win.Registry;

const
   BasicTitle = '바람의나라';

type
   TForm1 = class(TForm)
      Btn_Start: TButton;
      Btn_End: TButton;
    PnlMain: TPanel;
    LLblMain: TLabel;
    pnl_Lock: TPanel;
    edt_Lock: TEdit;
    Btn_Lock: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Pnl_Ctrl: TPanel;
    Btn_Minimize: TButton;
    Btn_Close: TButton;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    Btn_Help: TButton;
    Label3: TLabel;
    Edit3: TEdit;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;

      procedure Btn_StartEndClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      function NumkeyToKeycode(Num: Integer): Integer;
      function FunckeyToKeycode(ItemIndex: Integer): Integer;
    procedure HideTitlebar(Form:TForm);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Btn_LockClick(Sender: TObject);
    procedure edt_LockKeyPress(Sender: TObject; var Key: Char);
    function UserCheck: Boolean;
    procedure Btn_WinTilte_Setting(Sender: TObject);
    procedure Btn_HelpClick(Sender: TObject);
    procedure EditKeyPress(Sender: TObject; var Key: Char);
   end;

var
   Handle_1: THandle;
   LFlag_1: Boolean;
   Form1: TForm1;
   HookID: HHOOK;
   wHandle_1 : THandle;
   wHandle_2 : THandle;
   wHandle_3 : THandle;

   rHandle_1 : THandle;
   rHandle_2 : THandle;
   rHandle_3 : THandle;

   ChoSang : Integer;
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
      if (PKeyHook.vkCode = VK_DELETE) and (GetAsyncKeyState(VK_CONTROL) < -32766) then
         SetWindowText(GetForegroundWindow, BasicTitle);
      // case로 묶으면 토글키가 눌려져 있네..
      NHandle:= 0;
      NHandle :=  GetForegroundWindow;
//      if (NHandle = rHandle_1) then
      if True then

      begin
         if (Form1.Edit3.Text = '') then
         begin
            case PKeyHook.vkCode of
               VK_UP: begin
PostMessage(rHandle_1, WM_KEYDOWN, PKeyHook.vkCode, 0);
                  PostMessage(rHandle_2, WM_KEYDOWN, PKeyHook.vkCode, 0);
               end;
               VK_DOWN: begin
PostMessage(rHandle_1, WM_KEYDOWN, PKeyHook.vkCode, 0);
                  PostMessage(rHandle_2, WM_KEYDOWN, PKeyHook.vkCode, 0);
               end;
               VK_LEFT: begin
PostMessage(rHandle_1, WM_KEYDOWN, PKeyHook.vkCode, 0);
                  PostMessage(rHandle_2, WM_KEYDOWN, PKeyHook.vkCode, 0);
               end;
               VK_RIGHT: begin
PostMessage(rHandle_1, WM_KEYDOWN, PKeyHook.vkCode, 0);
                  PostMessage(rHandle_2, WM_KEYDOWN, PKeyHook.vkCode, 0);
               end;
               else
               begin
                  if (PKeyHook.vkCode >= 96) and (PKeyHook.vkCode <= 105) then
                  begin
                      if (PKeyHook.vkCode = ChoSang) then
                      begin
                        PostMessage(rHandle_2, WM_KEYDOWN, PKeyHook.vkCode, 0);
                      end;
                  end;
               end;
            end;
         end else
         begin
            case PKeyHook.vkCode of
               VK_UP: begin
                  PostMessage(rHandle_2, WM_KEYDOWN, PKeyHook.vkCode, 0);
                  PostMessage(rHandle_3, WM_KEYDOWN, PKeyHook.vkCode, 0);
               end;
               VK_DOWN: begin
                  PostMessage(rHandle_2, WM_KEYDOWN, PKeyHook.vkCode, 0);
                  PostMessage(rHandle_3, WM_KEYDOWN, PKeyHook.vkCode, 0);
               end;
               VK_LEFT: begin
                  PostMessage(rHandle_2, WM_KEYDOWN, PKeyHook.vkCode, 0);
                  PostMessage(rHandle_3, WM_KEYDOWN, PKeyHook.vkCode, 0);
               end;
               VK_RIGHT: begin
                  PostMessage(rHandle_2, WM_KEYDOWN, PKeyHook.vkCode, 0);
                  PostMessage(rHandle_3, WM_KEYDOWN, PKeyHook.vkCode, 0);
               end;
               else
               begin
                  if (PKeyHook.vkCode >= 96) and (PKeyHook.vkCode <= 105) then
                  begin
                      if (PKeyHook.vkCode = ChoSang) then
                      begin
                        PostMessage(rHandle_2, WM_KEYDOWN, PKeyHook.vkCode, 0);
                        PostMessage(rHandle_3, WM_KEYDOWN, PKeyHook.vkCode, 0);
                      end;
                  end;
               end;
            end;
         end;
      end;
{
      if (PKeyHook.vkCode = VK_F7) and (GetAsyncKeyState(VK_CONTROL) < -32766) then
      begin
//         Form3.Memo1.Lines.Add('창이름변경:'+Form3.WinTitleText1.Text);
         Handle_1 := GetForegroundWindow;
         SetWindowText(Handle_1, Form1.Edit1.Text);
      end else if (PKeyHook.vkCode = VK_F8) and (GetAsyncKeyState(VK_CONTROL) < -32766) then
      begin
//         Form3.Memo1.Lines.Add('창이름복원:'+BasicTitle);
         SetWindowText(GetForegroundWindow, BasicTitle);
      end else if (PKeyHook.vkCode = VK_F7) then
      begin
//         Form1.Memo1.Lines.Add('시작');
//         Handle_1 := FindWindow(nil, PChar('밀대'));
         Handle_1 := FindWindow(nil, PChar(Form1.Edit1.Text));

      end else if (PKeyHook.vkCode = VK_F8) then
      begin
//         Form1.Memo1.Lines.Add('중지');
      end {else if (PKeyHook.vkCode = VK_F3) and (GetAsyncKeyState(VK_SHIFT) < -32766) then
      begin
         // 항상 맨 위에 아님..
         Form1.FormStyle := fsNormal;
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


procedure TForm1.Btn_HelpClick(Sender: TObject);
begin
   Showmessage('- 오른아래 숫자는 초상키' + #13#10 +
               '- 두개 사용시 Slave2 비우고, 세개 사용시 Slave2 입력.' + #13#10 +
               '- 다른 핫키 사용중이면 해당 창이름 입력하고 ' + #13#10 +
               '  변경 안해도 됨.' + #13#10 +
               '- Ctrl + Delete : 창이름 복원(ON상태에서 가능)'
               );
end;

procedure TForm1.Btn_LockClick(Sender: TObject);
//잠금
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
   LockKey := ((StrToInt(Key_a)*922)*4);
   LockKey := StrToInt(Copy(IntToStr(LockKey),1,6));

   if IntToStr(LockKey) = edt_Lock.Text then
   begin
      try
         Reg_2 := TRegistry.Create;
         Reg_2.RootKey := HKEY_CURRENT_USER;
         Reg_2.OpenKey('\Software\MicroSoft\WindsData', True);
         Reg_2.WriteString('Release Lock_4',DateToStr(now));
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

procedure TForm1.Btn_StartEndClick(Sender: TObject);
begin
   case (Sender as TButton).Tag of
      1:
         begin
            rHandle_1 := FindWindow(nil,PChar(Edit1.Text));
            rHandle_2 := FindWindow(nil,PChar(Edit2.Text));
            if Edit3.Text <> '' then
               rHandle_3 := FindWindow(nil,PChar(Edit3.Text));
{            if (rHandle_1 <= 0) then
            begin
               ShowMessage(Edit1.Text + ' 없음');
               Exit;
            end;
            if (rHandle_2 <= 0) then
            begin
               ShowMessage(Edit2.Text + ' 없음');
               Exit;
            end;
            if (Edit3.Text <> '') then
            begin
               rHandle_3 := FindWindow(nil,PChar(Edit3.Text));
               if (rHandle_3 <= 0) then
               begin
                  ShowMessage(Edit3.Text + ' 없음');
                  Exit;
               end;
            end;

}
            ChoSang := NumkeyToKeycode(ComboBox1.ItemIndex);

            Btn_Start.Enabled := False;
            Btn_End.Enabled := True;
            Button1.Enabled := False;
            Button2.Enabled := False;
            Button3.Enabled := False;
            Edit1.Enabled := False;
            Edit2.Enabled := False;
            Edit3.Enabled := False;
            ComboBox1.Enabled := False;

//            KeySetting;
            KeybdHook;

//            Form1.Memo1.Lines.Add('On!!!!!!!!!');
         end;
      2:
         begin
            Btn_Start.Enabled := True;
            Btn_End.Enabled := False;
            Button1.Enabled := True;
            Button2.Enabled := True;
            Button3.Enabled := True;
            Edit1.Enabled := True;
            Edit2.Enabled := True;
            Edit3.Enabled := True;
            ComboBox1.Enabled := True;
            KeybdUnhook;
//            Form1.Memo1.Lines.Add('Off!!!!!!!!');
         end;
      3: Application.Minimize;
      4: Close;
   end;

end;

procedure TForm1.Btn_WinTilte_Setting(Sender: TObject);
//타이틀 변경
begin
   try
      case (Sender as TButton).Tag of
         5: begin
            wHandle_1 := FindWindow(nil, PChar('바람의나라'));
            if wHandle_1 > 0 then
               SetWindowText(wHandle_1, Edit1.Text);
         end;
         6: begin
            wHandle_2 := FindWindow(nil, PChar('바람의나라'));
            if wHandle_2 > 0 then
               SetWindowText(wHandle_2, Edit2.Text);
         end;
         7: begin
            wHandle_3 := FindWindow(nil, PChar('바람의나라'));
            if wHandle_3 > 0 then
               SetWindowText(wHandle_3, Edit3.Text);
         end;

         8: begin
            wHandle_1 := FindWindow(nil, PChar(Edit1.Text));
            if wHandle_1 > 0 then
               SetWindowText(wHandle_1, '바람의나라');
         end;
         9: begin
            wHandle_2 := FindWindow(nil, PChar(Edit2.Text));
            if wHandle_2 > 0 then
               SetWindowText(wHandle_2, '바람의나라');
         end;
         10: begin
            wHandle_3 := FindWindow(nil, PChar(Edit3.Text));
            if wHandle_3 > 0 then
               SetWindowText(wHandle_3, '바람의나라');
         end;
      end;
   except
   end;
end;



procedure TForm1.EditKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      Btn_StartEndClick(Btn_Start);
end;

procedure TForm1.edt_LockKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      Btn_LockClick(Btn_Lock);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   KeybdUnhook;
   ExitProcess(0);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   HideTitlebar(self);
   Pnl_Ctrl.Left := PnlMain.Width - Pnl_Ctrl.Width - 8;
   Pnl_Ctrl.Top := 3;
   Pnl_Ctrl.Color := PnlMain.Color;
   Pnl_Ctrl.BringToFront;

//   Self.Height := 114;
   Self.Height := PnlMain.Height;
   Self.Width  := PnlMain.Width;

   if  UserCheck then
//      Btn_StartEndClick(Btn_Start);
end;

//폼 이동 처리
procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
   ReleaseCapture();
   SendMessage(Handle,WM_SYSCOMMAND,$F012,0 );
end;

function TForm1.NumkeyToKeycode(Num: Integer): Integer;
begin
   case Num of
{      0:Result := 48;
      1:Result := 49;
      2:Result := 50;
      3:Result := 51;
      4:Result := 52;
      5:Result := 53;
      6:Result := 54;
      7:Result := 55;
      8:Result := 56;
      9:Result := 57;}
      0:Result := 96;
      1:Result := 97;
      2:Result := 98;
      3:Result := 99;
      4:Result := 100;
      5:Result := 101;
      6:Result := 102;
      7:Result := 103;
      8:Result := 104;
      9:Result := 105;
   end;
end;

function TForm1.FunckeyToKeycode(ItemIndex: Integer): Integer;
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

procedure TForm1.HideTitlebar(Form:TForm);
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

function TForm1.UserCheck: Boolean;
var
   Reg_1 : TRegistry;
begin
   result := False;
   try
      Reg_1 := TRegistry.Create;
      Reg_1.RootKey := HKEY_CURRENT_USER;
      Reg_1.OpenKey('\Software\MicroSoft\WindsData', True);
      if not Reg_1.ValueExists('Release Lock_4') then
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

         PnlMain.Enabled := False;
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

