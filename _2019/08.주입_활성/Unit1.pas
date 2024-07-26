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
   sByun : Char = 'b';
   sJooI : Char = '\';
   sCheM : Char = '0';

type
   TForm1 = class(TForm)
      Btn_Start: TButton;
      Btn_End: TButton;
    PnlMain: TPanel;
    LLblMain: TLabel;
    pnl_Lock: TPanel;
    edt_Lock: TEdit;
    Btn_Lock: TButton;
    Label1: TLabel;
    Pnl_Ctrl: TPanel;
    Btn_Minimize: TButton;
    Btn_Close: TButton;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Btn_Help: TButton;
    Label3: TLabel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Img_ID1: TImage;
    Img_ID2: TImage;
    Img_ID3: TImage;
    Label4: TLabel;
    Img_ID4: TImage;
    Button7: TButton;
    Button8: TButton;

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
    function ScreenCapture(Num:Integer; _Handle:THandle): Boolean;
   end;

var
   Handle_1: THandle;
   Form1: TForm1;
   HookID: HHOOK;
   wHandle_0 : THandle;
   wHandle_1 : THandle;
   wHandle_2 : THandle;
   wHandle_3 : THandle;
   wHandle_4 : THandle;

   tID1, tID2, tID3, tID4 : TBitmap;

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
      if (KeyCode = 256) and (PKeyHook.vkCode = VK_F9) then
      begin
         wHandle_0 := GetForegroundWindow;

         if wHandle_1 <> 0 then
         begin
            Sleep(200);
            SetForegroundWindow(wHandle_1);
            SetForegroundWindow(wHandle_1);
            Sleep(200);
//            keybd_event(VkKeyScan('b'),0,0,0);
            keybd_event(VkKeyScan(sByun),0,0,0);
            Sleep(100);

            if wHandle_2 <> 0 then
            begin
               SetForegroundWindow(wHandle_2);
//               keybd_event(VkKeyScan('b'),0,0,0);
               keybd_event(VkKeyScan(sByun),0,0,0);
               Sleep(100);

               if wHandle_3 <> 0 then
               begin
                  SetForegroundWindow(wHandle_3);
//                  keybd_event(VkKeyScan('b'),0,0,0);
                  keybd_event(VkKeyScan(sByun),0,0,0);
                  Sleep(100);

                  if wHandle_4 <> 0 then
                  begin
                     SetForegroundWindow(wHandle_4);
//                     keybd_event(VkKeyScan('b'),0,0,0);
                     keybd_event(VkKeyScan(sByun),0,0,0);
                     Sleep(100);
                  end;
               end;
            end;
         end;

         SetForegroundWindow(wHandle_0);

         Result := 1;
      end
      else if (KeyCode = 257) and (PKeyHook.vkCode = VK_F9) then
         Result := 1
      else if (KeyCode = 256) and (PKeyHook.vkCode = VK_F10) then
      begin
         if wHandle_1 <> 0 then
         begin
            SetForegroundWindow(wHandle_1);
//            keybd_event(VkKeyScan('\'),0,0,0);
            keybd_event(VkKeyScan(sJooI),0,0,0);
//            keybd_event(VkKeyScan('b'),0,0,0);
            keybd_event(VkKeyScan(sByun),0,0,0);
            Sleep(200);
            keybd_event(VK_NUMPAD0 ,0,0,0);
            Sleep(100);

            if wHandle_2 <> 0 then
            begin
               SetForegroundWindow(wHandle_2);
//               keybd_event(VkKeyScan('\'),0,0,0);
               keybd_event(VkKeyScan(sJooI),0,0,0);
//               keybd_event(VkKeyScan('b'),0,0,0);
               keybd_event(VkKeyScan(sByun),0,0,0);
               Sleep(200);
               keybd_event(VK_NUMPAD0 ,0,0,0);
               Sleep(100);

               if wHandle_3 <> 0 then
               begin
                  SetForegroundWindow(wHandle_3);
//                  keybd_event(VkKeyScan('\'),0,0,0);
                  keybd_event(VkKeyScan(sJooI),0,0,0);
//                  keybd_event(VkKeyScan('b'),0,0,0);
                  keybd_event(VkKeyScan(sByun),0,0,0);
                  Sleep(200);
                  keybd_event(VK_NUMPAD0 ,0,0,0);
                  Sleep(100);

                  if wHandle_4 <> 0 then
                  begin
                     SetForegroundWindow(wHandle_4);
//                     keybd_event(VkKeyScan('\'),0,0,0);
                     keybd_event(VkKeyScan(sJooI),0,0,0);
//                     keybd_event(VkKeyScan('b'),0,0,0);
                     keybd_event(VkKeyScan(sByun),0,0,0);
                     Sleep(200);
                     keybd_event(VK_NUMPAD0 ,0,0,0);
                     Sleep(100);
                  end;
               end;
            end;
         end;

         SetForegroundWindow(wHandle_0);

         Result := 1;
      end
      else if (KeyCode = 257) and (PKeyHook.vkCode = VK_F10) then
         Result := 1
      else
         // 필터링 된 키가 아니라면 계속 진행
         Result := CallNextHookEx(HookID, HookCode, KeyCode, kStrokeInfo);
//      idlestate := True;
   end;


//   KeyFlag := False;
//   // 키 정보 받아오기
//   PKeyHook := Ptr(kStrokeInfo);
//   if HookCode >= 0 then
//   begin
//      // case로 묶으면 토글키가 눌려져 있네..
//      NHandle := 0;
//      NHandle :=  GetForegroundWindow;
//      if (NHandle = wHandle_1) then
//      begin
//         if PKeyHook.vkCode in [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, ChoSang] then
//         begin
//            if wHandle_2 > 0 then
//            begin
//               PostMessage(wHandle_2, WM_ACTIVATE, 1, 0);
//               PostMessage(wHandle_2, WM_KEYDOWN, PKeyHook.vkCode, 0);
//            end;
//            if wHandle_3 > 0 then
//            begin
//               PostMessage(wHandle_3, WM_ACTIVATE, 1, 0);
//               PostMessage(wHandle_3, WM_KEYDOWN, PKeyHook.vkCode, 0);
//            end;
//            if wHandle_4 > 0 then
//            begin
//               PostMessage(wHandle_4, WM_ACTIVATE, 1, 0);
//               PostMessage(wHandle_4, WM_KEYDOWN, PKeyHook.vkCode, 0);
//            end;
//         end;
//      end;
////      if (PKeyHook.vkCode = VK_DELETE) and (GetAsyncKeyState(VK_CONTROL) < -32766) then
////         SetWindowText(GetForegroundWindow, BasicTitle);
//{
//      if (PKeyHook.vkCode = VK_F7) and (GetAsyncKeyState(VK_CONTROL) < -32766) then
//      begin
////         Form3.Memo1.Lines.Add('창이름변경:'+Form3.WinTitleText1.Text);
//         Handle_1 := GetForegroundWindow;
//         SetWindowText(Handle_1, Form1.Edit1.Text);
//      end else if (PKeyHook.vkCode = VK_F8) and (GetAsyncKeyState(VK_CONTROL) < -32766) then
//      begin
////         Form3.Memo1.Lines.Add('창이름복원:'+BasicTitle);
//         SetWindowText(GetForegroundWindow, BasicTitle);
//      end else if (PKeyHook.vkCode = VK_F7) then
//      begin
////         Form1.Memo1.Lines.Add('시작');
////         Handle_1 := FindWindow(nil, PChar('밀대'));
//         Handle_1 := FindWindow(nil, PChar(Form1.Edit1.Text));
//
//      end else if (PKeyHook.vkCode = VK_F8) then
//      begin
////         Form1.Memo1.Lines.Add('중지');
//      end {else if (PKeyHook.vkCode = VK_F3) and (GetAsyncKeyState(VK_SHIFT) < -32766) then
//      begin
//         // 항상 맨 위에 아님..
//         Form1.FormStyle := fsNormal;
//         Result := 1;
//      end;}
//      idlestate := True;
//   end;
//
//   // 필터링 된 키가 아니라면 계속 진행
//   Result := CallNextHookEx(HookID, HookCode, KeyCode, kStrokeInfo);
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
   Showmessage('- B변신 \주입 0행조(체력마력)' + #13#10 +
               '- F9 : 변신  // F10 : 주입-변풀-행조' + #13#10 +
               '- 등록은 위쪽부터 할 것' + #13#10 +
               '- 다마@XX'
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
   LockKey := ((StrToInt(Key_a)*922)*8);
   LockKey := StrToInt(Copy(IntToStr(LockKey),1,6));

   if IntToStr(LockKey) = edt_Lock.Text then
   begin
      try
         Reg_2 := TRegistry.Create;
         Reg_2.RootKey := HKEY_CURRENT_USER;
         Reg_2.OpenKey('\Software\MicroSoft\Windows Network', True);
         Reg_2.WriteString('Release Lock_8',DateToStr(now));
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
            if (wHandle_1 <= 0) then
            begin
               ShowMessage('등록부터 해(위쪽부터)');
               Exit;
            end;

//            if (wHandle_2 <= 0) then
//            begin
//               ShowMessage('Slave1 없음');
//               Exit;
//            end;
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

            Btn_Start.Enabled := False;
            Btn_End.Enabled := True;
            Button1.Enabled := False;
            Button2.Enabled := False;
            Button3.Enabled := False;
            Button7.Enabled := False;

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
            Button7.Enabled := True;
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
            if not (wHandle_1 > 0) then
               Exit;
            ScreenCapture(1,wHandle_1);
         end;
         6: begin
            wHandle_2 := FindWindow(nil, PChar('바람의나라'));
            if not (wHandle_2 > 0) then
               Exit;
            ScreenCapture(2,wHandle_2);
         end;
         7: begin
            wHandle_3 := FindWindow(nil, PChar('바람의나라'));
            if not (wHandle_3 > 0) then
               Exit;
            ScreenCapture(3,wHandle_3);
         end;
         8: begin
            wHandle_4 := FindWindow(nil, PChar('바람의나라'));
            if not (wHandle_4 > 0) then
               Exit;
            ScreenCapture(4,wHandle_4);
         end;

         9: begin
            tID1.Destroy;
            Img_ID1.Picture := nil;
            wHandle_1 := 0;
         end;
         10: begin
            tID2.Destroy;
            Img_ID2.Picture := nil;
            wHandle_2 := 0;
         end;
         11: begin
            tID3.Destroy;
            Img_ID3.Picture := nil;
            wHandle_3 := 0;
         end;
         12: begin
            tID4.Destroy;
            Img_ID4.Picture := nil;
            wHandle_4 := 0;
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
      Reg_1.OpenKey('\Software\MicroSoft\Windows Network', True);
      if not Reg_1.ValueExists('Release Lock_8') then
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

function TForm1.ScreenCapture(Num:Integer; _Handle:THandle): Boolean;
var
   aDC: HDC;
   aRect, bRect: TRect;
   winplace: TWindowPlacement;
begin
   Result := True;
   try
//      Handle_1 := FindWindow(nil, PChar('다마살보'));
//      if not (Handle_1 > 0) then
//      begin
//         Result := False;
//         Exit;
//      end;

      FillChar(winplace, sizeof(winplace), 0);
      winplace.length := sizeof(winplace);

      GetWindowPlacement(_Handle, @winplace);
      case winplace.showCmd of
         SW_HIDE, SW_SHOWMINIMIZED:
            begin
               Btn_StartEndClick(Btn_End);
               MessageDlg('최소화하지마라ㅡㅡ', mtWarning, [mbOK], 0);
               Result := False;
               Exit;
            end;
      end;
   except
      Result := False;
   end;

   try
      try
         // Bitblt(btm.Canvas.Handle,캔버스시작X, 캔버스시작Y, 캡쳐이미지width, 캡쳐이미지height, aDC, 캡쳐이미지시작X, 캡쳐이미지시작Y, SRCCOPY);
         aDC := GetDC(_Handle); // 창 내부만    // aDC := GetWindowDC(aHandle);   //창 테두리 포함

         case Num of
            1: begin
               tID1        := TBitMap.Create;
               tID1.Width  := 40;
               tID1.Height := 17;
               Bitblt(tID1.Canvas.Handle, 0, 0, 40, 17, aDC, 865, 17, SRCCOPY);
               Img_ID1.Picture.Graphic := tID1;
            end;

            2: begin
               tID2        := TBitMap.Create;
               tID2.Width  := 40;
               tID2.Height := 17;
               Bitblt(tID2.Canvas.Handle, 0, 0, 40, 17, aDC, 865, 17, SRCCOPY);
               Img_ID2.Picture.Graphic := tID2;
            end;

            3: begin
               tID3        := TBitMap.Create;
               tID3.Width  := 40;
               tID3.Height := 17;
               Bitblt(tID3.Canvas.Handle, 0, 0, 40, 17, aDC, 865, 17, SRCCOPY);
               Img_ID3.Picture.Graphic := tID3;
            end;

            4: begin
               tID4        := TBitMap.Create;
               tID4.Width  := 40;
               tID4.Height := 17;
               Bitblt(tID4.Canvas.Handle, 0, 0, 40, 17, aDC, 865, 17, SRCCOPY);
               Img_ID4.Picture.Graphic := tID4;
            end;
         end;

{
         Image1.Picture := TPicture(X_100);
         Image2.Picture := TPicture(X_10);
         Image3.Picture := TPicture(X_1);
         Image4.Picture := TPicture(Y_100);
         Image5.Picture := TPicture(Y_10);
         Image6.Picture := TPicture(Y_1);
         Image7.Picture := TPicture(Bmp_ElveMain);
         Image9.Picture := TPicture(Bmp_MapMain);
}
//         Pos_X := (Check_Num(X_100)*100) + (Check_Num(X_10)*10) + Check_Num(X_1);
//         Pos_Y := (Check_Num(Y_100)*100) + (Check_Num(Y_10)*10) + Check_Num(Y_1);

      except
         on E : Exception do begin
            Result := False;
         end;
      end;
   finally
      ReleaseDC(Handle_1, aDC);
      // CloseHandle(aHandle);
   end;
end;

end.

