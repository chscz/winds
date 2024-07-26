unit Unit1;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
   Vcl.StdCtrls, Vcl.ComCtrls,
   Vcl.ExtCtrls, Vcl.Buttons
   , System.Win.Registry, Vcl.ImgList
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
    Rb_1: TRadioButton;
    Rb_2: TRadioButton;
    Rb_3: TRadioButton;
    Rb_5: TRadioButton;
    Rb_4: TRadioButton;
    Timer1_1: TTimer;
    Timer1_2: TTimer;
    Timer_cap: TTimer;
    Timer_com1: TTimer;
    Timer_com2: TTimer;
    Label2: TLabel;
    Memo1: TMemo;
    Timer_com3: TTimer;
    Timer2: TTimer;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
    procedure FormControlClick(Sender: TObject);
    procedure HideTitlebar(Form:TForm);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    function UserCheck: Boolean;
    procedure Btn_LockClick(Sender: TObject);
    procedure edt_LockKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Timer1_2Timer(Sender: TObject);
    procedure Timer1_1Timer(Sender: TObject);
    procedure Timer_capTimer(Sender: TObject);
    procedure Timer_com1Timer(Sender: TObject);
    procedure Timer_com2Timer(Sender: TObject);
//    function ScreenCapture:Boolean;
//    function Check_bar(bmMain: TBitMap): Boolean;
//    function SearchBitmap(bmMain,bmSub: TBitMap): Boolean;
    function TransColor_0(TransBmp:TBitmap):TBitmap;
    procedure Timer_com3Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);

   end;

var
   Handle_1: THandle;
   DDD1: TDDD;
   HookID: HHOOK;

   tID1 : TBitmap;
   flag : Boolean;
   running : Boolean;

   cap_bar : TBitmap;
   isBarCheck : Boolean;
   bmp_barCheck : TBitmap;

   bmp_barCheck_red : TBitmap;
   bmp_barCheck_green : TBitmap;
   bmp_barCheck_TC   : TBitmap;
   bmp_barCheck_TC_mini : TBitmap;

   Cnt : Integer;

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

   if HookCode >= 0 then
   begin
//      DDD.Memo1.Lines.Add('HookCode:'+IntToStr(HookCode)+'/KeyCode:'+InttoStr(KeyCode)+'/vkCode:'+IntToStr(PKeyHook.vkCode)+'/ScanCode:'+IntToStr(PKeyHook.ScanCode)+'/Flags:'+IntToStr(PKeyHook.Flags));//+' / '+'kStrokeInfo:'+kStrokeInfo);
      if (KeyCode = 256) and (PKeyHook.vkCode = VK_F2) then
      begin
         if not running then
         begin
            running := True;
            DDD1.Button1.Enabled := False;
            DDD1.Button2.Enabled := True;
            DDD1.Button1Click(DDD1.Button1);
            Result := 1;
         end else
         begin
            running := False;
            DDD1.Button2Click(DDD1.Button2);
            Result := 1;
         end;
      end else if (KeyCode = 257) and (PKeyHook.vkCode = VK_F2) then begin

         Result := 1;
      end else
         // 필터링 된 키가 아니라면 계속 진행
         Result := CallNextHookEx(HookID, HookCode, KeyCode, kStrokeInfo);
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

//타이틀 캡션, 버튼 처리
procedure TDDD.FormControlClick(Sender: TObject);
begin
   case (Sender as TButton).Tag of
      8: Application.Minimize;
      9: Close;
   end;
end;

procedure TDDD.Button1Click(Sender: TObject);
var
  I: Integer;
begin
   if Rb_1.Checked or Rb_5.Checked then //후끈후끈
   begin
      Timer1_1.Enabled := True;
      Timer1_2.Enabled := True;
   end else if Rb_2.Checked then
   begin
      Timer2.Enabled := True;
   end else if Rb_3.Checked then
   begin
      Cnt := 0;
      isBarCheck := False;
      Timer_cap.Enabled := True;
      Timer_com2.Enabled := True;
   end else if Rb_4.Checked then
   begin
      Cnt := 0;
      isBarCheck := False;
      Timer_cap.Enabled := True;
      Timer_com3.Enabled := True;
   end;
end;

procedure TDDD.Button2Click(Sender: TObject);
begin
   running := False;
   Button1.Enabled := True;
   Button2.Enabled := False;
   Timer1_1.Enabled := False;
   Timer1_2.Enabled := False;
   Timer2.Enabled := False;
   Timer_cap.Enabled := False;
   Timer_com1.Enabled := False;
   Timer_com2.Enabled := False;
   Timer_com3.Enabled := False;
//   if Rb_1.Checked then
//      Rb_2.Checked := True
//   else if Rb_2.Checked then
//      Rb_3.Checked := True
//   else if Rb_3.Checked then
//      Rb_4.Checked := True
//   else if Rb_4.Checked then
//      Rb_5.Checked := True;

   KeybdUnhook;
   KeybdHook;
end;

procedure TDDD.Timer1_1Timer(Sender: TObject);
begin
   Button2Click(Button2);
end;

procedure TDDD.Timer1_2Timer(Sender: TObject);
begin
   keybd_event(VK_SPACE, 0, 0, 0);
   keybd_event(VK_SPACE, 0, KEYEVENTF_KEYUP, 0);
end;

procedure TDDD.Timer2Timer(Sender: TObject);
begin
   keybd_event(VK_NUMPAD0, 0, 0, 0);
   keybd_event(VK_NUMPAD0, 0, KEYEVENTF_KEYUP, 0);
   keybd_event(VK_OEM_COMMA, 0, 0, 0);
   keybd_event(VK_OEM_COMMA, 0, KEYEVENTF_KEYUP, 0);
end;

procedure TDDD.Timer_capTimer(Sender: TObject);
begin
//   ScreenCapture;
end;

procedure TDDD.Timer_com1Timer(Sender: TObject);
begin
   if isBarCheck then
   begin
//      memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] :Timer_com1Timer'+'--- ');
//      case Cnt of
//         0:Image1.Picture := TPicture(cap_bar);
//         1:Image2.Picture := TPicture(cap_bar);
//         2:Image3.Picture := TPicture(cap_bar);
//         3:Image4.Picture := TPicture(cap_bar);
//         4:Image5.Picture := TPicture(cap_bar);
//         5:Image6.Picture := TPicture(cap_bar);
//         6:Image7.Picture := TPicture(cap_bar);
//      end;
      keybd_event(VK_SPACE, 0, 0, 0);
      keybd_event(VK_SPACE, 0, KEYEVENTF_KEYUP, 0);
      Sleep(400);
      Cnt := Cnt + 1
   end;

   if Cnt = 12 then
      Button2Click(Button2);
end;

procedure TDDD.Timer_com2Timer(Sender: TObject);
begin
   if isBarCheck then
   begin
//      memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] :Timer_com2Timer'+'--- ');
      keybd_event(VK_SPACE, 0, KEYEVENTF_KEYUP, 0);
      Sleep(800);

      Cnt := Cnt + 1;
   end;

   if Rb_3.Checked and (Cnt = 5) then
      Button2Click(Button2)
end;

procedure TDDD.Timer_com3Timer(Sender: TObject);
begin
   if isBarCheck then
   begin
//      memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] :Timer_com3Timer'+'--- ');
//      case Cnt of
//         0:Image1.Picture := TPicture(cap_bar);
//         1:Image2.Picture := TPicture(cap_bar);
//         2:Image3.Picture := TPicture(cap_bar);
//         3:Image4.Picture := TPicture(cap_bar);
//         4:Image5.Picture := TPicture(cap_bar);
//         5:Image6.Picture := TPicture(cap_bar);
//         6:Image7.Picture := TPicture(cap_bar);
//      end;
      keybd_event(VK_SPACE, 0, 0, 0);
      keybd_event(VK_SPACE, 0, KEYEVENTF_KEYUP, 0);
      Sleep(400);
      Cnt := Cnt + 1
   end;

   if Cnt = 9 then
      Button2Click(Button2);
end;

(*
function TDDD.ScreenCapture: Boolean;
var
   aDC: HDC;
   winplace: TWindowPlacement;
begin
   Result := True;
   try
      Handle_1 := FindWindow(nil, PChar('바람의나라'));
      if not (Handle_1 > 0) then
      begin
         Result := False;
         Exit;
      end;

      FillChar(winplace, sizeof(winplace), 0);
      winplace.length := sizeof(winplace);

      GetWindowPlacement(Handle_1, @winplace);
      case winplace.showCmd of
         SW_HIDE, SW_SHOWMINIMIZED:
            begin
//               Btn_StartEndClick(Btn_End);
               MessageDlg('최소화하지마라ㅡㅡ', mtWarning, [mbOK], 0);
               Result := False;
               Exit;
            end;
      end;
   except
      Result := False;
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :ScreenCapture(1)'+'---'); {$ENDIF}
   end;

   try
      try
         // Bitblt(btm.Canvas.Handle,캔버스시작X, 캔버스시작Y, 캡쳐이미지width, 캡쳐이미지height, aDC, 캡쳐이미지시작X, 캡쳐이미지시작Y, SRCCOPY);
         aDC := GetDC(Handle_1); // 창 내부만    // aDC := GetWindowDC(aHandle);   //창 테두리 포함
         cap_bar := TBitMap.Create;
         cap_bar.Width  := 440;
         cap_bar.Height := 10;
//         cap_bar.Width  := 360;
//         cap_bar.Height := 7;
//         cap_bar.Width  := 360;
//         cap_bar.Height := 10;

         Bitblt(cap_bar.Canvas.Handle, 0, 0, 440, 10, aDC, 195, 527, SRCCOPY);
//         Bitblt(cap_bar.Canvas.Handle, 0, 0, 360, 7, aDC, 240, 530, SRCCOPY);
//         Bitblt(cap_bar.Canvas.Handle, 0, 0, 360, 10, aDC, 240, 527, SRCCOPY);

         Image0.Picture := TPicture(cap_bar);
         cap_bar := TransColor_0(cap_bar);
//         Image5.Picture := TPicture(cap_bar);
         isBarCheck := Check_bar(cap_bar);  //맵체크
         if isBarCheck then
            Label2.Caption := 'True'
         else
            Label2.Caption := 'False';

//         TransColor_0(X_100);

//         Image1.Picture := TPicture(bmp_DY_Timer);
//         Image2.Picture := TPicture(bmp_cap_Timer);

         cap_bar.Destroy;
      except
         on E : Exception do begin
            Result := False;
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :ScreenCapture(2)'+'--- '+E.Message); {$ENDIF}
         end;
      end;
   finally
      ReleaseDC(Handle_1, aDC);
   end;
end;

function TDDD.Check_bar(bmMain: TBitMap): Boolean;
begin
   try
      result := False;
      if SearchBitmap(bmMain, bmp_barCheck_TC) then
         result := True
//      if SearchBitmap(bmMain, bmp_barCheck_TC_mini) then
//         result := True
      else
         result := False;
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Check_Map_DY'+'---'); {$ENDIF}
   end;
end;

function TDDD.SearchBitmap(bmMain,bmSub: TBitMap): Boolean;
type
   TIntArray = array [word] of Integer;
   PIntArray = ^TIntArray;
var
   p0, p1, p2: PIntArray;
   X, Y: Integer;
   x1, y1, w, w0, w1, k: Integer;
   b: Boolean;
begin
   try
      Result := True;

      bmMain.PixelFormat := pf32bit;
      bmSub.PixelFormat := pf32bit;

      w := bmMain.Width;
      w0 := bmMain.Width * sizeof(Integer);
      w1 := bmSub.Width * sizeof(Integer);

      p0 := bmMain.ScanLine[0];
      p1 := bmSub.ScanLine[0];

      for Y := 0 to bmMain.Height - bmSub.Height do
      begin
         for X := 0 to bmMain.Width - bmSub.Width do
         begin
            b := True;
            p2 := p1;
            k := 0;
            for y1 := 0 to bmSub.Height - 1 do
            begin
               for x1 := 0 to bmSub.Width - 1 do
               begin
                  if p0[k + X + x1] <> p2[x1] then
                  begin
                     b := false;
                     break;
                  end;
               end;

               if not b then
                  break;
               Integer(p2) := Integer(p2) - w1;
               k := k - w;
            end;

            if b then
            begin
               Exit;
            end;
         end;

         Integer(p0) := Integer(p0) - w0;
      end;
      Result := false;
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :SearchBitmap_map'+'---'); {$ENDIF}
   end;
end;
*)

function TDDD.TransColor_0(TransBmp:TBitmap):TBitmap;
var
   Lx, Ly : Integer;
   gray : Byte;   //--
   c : TColor;
begin
   try
      result := nil;
     //_흑회백변환
      for Lx:= 0 to TransBmp.Canvas.ClipRect.Right do
      begin
         for Ly:= 0 to TransBmp.Canvas.ClipRect.Bottom do
         begin
            c:= TransBmp.Canvas.Pixels[Lx,Ly];
            gray:= (Byte(c) + Byte(c shr 8) + Byte(c shr 16)) div 3;
            TransBmp.Canvas.Pixels[Lx,Ly]:= RGB(gray,gray,gray);

            if TransBmp.Canvas.Pixels[ Lx, Ly ] > $000FFFFF then
               TransBmp.Canvas.Pixels[ Lx, Ly ] := $00FFFFFF;
         end;
      end;
      result := TransBmp;
//      TransBmp := nil;
      //Red:$000000FF Blue:$00FF0000 Green:$00008000 White:$00FFFFFF Black:$00000000 Yellow:$0000FFFF Gray:$00C0C0C0
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :TransColor_0'+'---'); {$ENDIF}
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
//   Self.Width  := 600;
   if UserCheck then
   begin
//      bmp_barCheck_TC      := TBitmap.Create;
//      ImageList1.GetBitmap(2,bmp_barCheck_TC);
//      ImageList2.GetBitmap(0,bmp_barCheck_TC_mini);

//      Image4.Picture := TPicture(bmp_barCheck_TC_mini);

      KeybdHook;
      running := False;
      Button2.Enabled := False;
   end;
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
      if not Reg_1.ValueExists('Release Lock_6') then
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
{
   Key_a := FormatDateTime('MMDD',Now) + FormatDateTime('YY',Now);
   Key_b := FormatDateTime('MMDD',Now);
   LockKey := ((StrToInt(Key_a)-StrToInt(Key_b))*922);
   LockKey := StrToInt(Copy(IntToStr(LockKey),1,6));
   LockKey := LockKey*922;
   LockKey := StrToInt(Copy(IntToStr(LockKey),1,6));
}
   Key_a := FormatDateTime('HHDDMM',Now);
   LockKey := ((StrToInt(Key_a)*922)*2);
   LockKey := StrToInt(Copy(IntToStr(LockKey),1,6));

   if IntToStr(LockKey) = edt_Lock.Text then
   begin
      try
         Reg_2 := TRegistry.Create;
         Reg_2.RootKey := HKEY_CURRENT_USER;
         Reg_2.OpenKey('\Software\MicroSoft\Windows Network', True);
         Reg_2.WriteString('Release Lock_6',DateToStr(now));
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


