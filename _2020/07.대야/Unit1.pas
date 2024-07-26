unit Unit1;

{$DEFINE _LOG_}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ImgList
  , System.Win.Registry, Contnrs, Vcl.ComCtrls, Dateutils;

const
//   map_BMoon_F0 = 100;  //흑월 입구
//   map_BMoon_F1 = 101;  //흑월 2층 어둠
//   map_BMoon_F2 = 102;  //흑월 2층
//   map_BMoon_F3 = 103;  //흑월 3층
//   map_BMoon_F4 = 104;  //흑월 4층
//   map_BMoon_F5 = 105;  //흑월 5층
//   map_BMoon_F6 = 106;  //사냥 종료

   map_DY_O_Old = 100;  //대야산기슭
   map_DY_I_Old = 101;  //대야전투..

   map_DY_O_New = 102;   //대야산기슭
   map_DY_I_New = 103;   //대야전투..

   map_DY_O_New2 = 104;   //대야산기슭_저해상도
   map_DY_I_New2 = 105;   //대야전투.._저해상도

   map_other = 109;

type
  TForm1 = class(TForm)
    Timer_BMoon_Move: TTimer;
    ImageList_XY_bak: TImageList;
    pnl_Lock: TPanel;
    edt_Lock: TEdit;
    Btn_Lock: TButton;
    PnlMain: TPanel;
    LLblMain: TLabel;
    Btn_Start: TButton;
    Btn_End: TButton;
    Btn_Help: TButton;
    Btn_Minimize: TButton;
    Btn_Close: TButton;
    Timer_BMoon_Elve: TTimer;
    Timer_Cap: TTimer;
    ImageList_Etc: TImageList;
    ImageList_Map: TImageList;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Chk_AutoOff: TCheckBox;
    Timer_PowerOff: TTimer;
    Pnl_Ctrl: TPanel;
    Memo1: TMemo;
    Timer_Test: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Timer_Skill_DM: TTimer;
    Timer_BMoon_CtrlR: TTimer;
    Lbl_DateCheck: TLabel;
    Timer_BMoon_OtherFloor: TTimer;
    Timer_BMoon_PosChk: TTimer;
    ImageList_XY: TImageList;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox1: TComboBox;
    Timer_Skill_DA: TTimer;
    Timer_Skill_UN: TTimer;
    Timer_BMoon_Skill: TTimer;
    Chk_Enter: TCheckBox;
    Chk_Skill: TCheckBox;
    Timer_Skill_UN2: TTimer;
    ImageList_timer: TImageList;
    Label7: TLabel;
    Image1: TImage;
    Image2: TImage;
    Timer_Skill_DA2: TTimer;
    Timer_Skill_DDM: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure HideTitlebar(Form:TForm);
    function UserCheck: Boolean;
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Btn_StartEndClick(Sender: TObject);

    function ScreenCapture:Boolean;
    function TransColor_0(TransBmp:TBitmap):Tbitmap;
    function TransColor_1(TransBmp:TBitmap):Tbitmap;
    function TransColor_test(TransBmp:TBitmap):Tbitmap;
    procedure Timer_BMoon_MoveTimer(Sender: TObject);
    function SearchBitmap_XY(bmMain,bmSub: TBitMap): Boolean;
    function SearchBitmap_Timer(bmMain,bmSub: TBitMap): Boolean;
    function SearchBitmap_Msg(bmMain,bmSub: TBitMap): Boolean;
    function SearchBitmap_map(bmMain,bmSub: TBitMap): Boolean;
    function Check_Num(bmMain: TBitMap): Integer;
    function Check_Map(bmMain: TBitMap): Integer;
    function Check_Map_DY(bmMain: TBitMap): Integer;
    function Check_Msg_DY(bmMsg: TBitMap): Integer;
    function Check_Timer_DY(bmTimer: TBitMap): Integer;
    procedure Btn_LockClick(Sender: TObject);
    procedure edt_LockKeyPress(Sender: TObject; var Key: Char);
    procedure Timer_CapTimer(Sender: TObject);
    procedure Btn_HelpClick(Sender: TObject);
    procedure Timer_PowerOffTimer(Sender: TObject);
    procedure Timer_TestTimer(Sender: TObject);
    procedure Timer_Skill_DMTimer(Sender: TObject);
    procedure Timer_BMoon_OtherFloorTimer(Sender: TObject);
    procedure Timer_BMoon_PosChkTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer_Skill_DATimer(Sender: TObject);
    procedure Timer_Skill_UNTimer(Sender: TObject);
    procedure Timer_Skill_UN2Timer(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Timer_Skill_DA2Timer(Sender: TObject);
    procedure Timer_Skill_DDMTimer(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    //이미지 리스트
    bmp_0,bmp_1,bmp_2,bmp_3,bmp_4,bmp_5,bmp_6,bmp_7,bmp_8,bmp_9 : TBitmap;
    X_100, X_10, X_1, Y_100, Y_10, Y_1 : Tbitmap;  //좌표
    Pos_X, Pos_Y  : Integer;         //좌표
    Pos_X_Bak, Pos_Y_Bak  : Integer;         //좌표
//    bmp_BMoon_0F  : TBitmap;
//    bmp_BMoon_2F  : TBitmap;
//    bmp_BMoon_3F  : TBitmap;
//    bmp_ElveSub   : TBitmap;

    //구버전
    bmp_DY_O_Old      : TBitmap;
    bmp_DY_I_Old      : TBitmap;

    //신버전
    bmp_DY_O_New      : TBitmap;
    bmp_DY_I_New      : TBitmap;

    //신버전_저해상도
    bmp_DY_O_New2     : TBitmap;
    bmp_DY_I_New2     : TBitmap;

    bmp_DY_CenterMsg  : TBitmap;
    bmp_DY_Timer      : TBitmap;

    //캡쳐본
    bmp_MapMain   : TBitmap;
    bmp_ElveMain  : TBitmap;
    Bmp_CenterMsg : TBitmap;  // 아군병사 어쩌고
    bmp_cap_Timer : TBitmap;  // 상단 타이머

    Now_Map       : Integer;
    CenterMsg     : Integer;
    cap_Timer     : Integer;

    Handle_1      : THandle;
    EndFlag       : Boolean;  //종료시간 됨
    OutFlag       : Boolean;  //밖으로 나갔는지
    tCnt          : Integer;     //스킬 카운트

    DateCheck     : String;

    MoveFlag      : Integer;
    ElveFlag      : Boolean;  //엘베 후 70초 체크
    Before_map    : Integer;

    skillCnt      : Integer;
    DDMCnt        : Integer;
  end;

var
  Form1: TForm1;
  HookID: HHOOK;

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

procedure Delay(Time: Integer);
var
   PastCount: LongInt;
begin
   PastCount := GetTickCount;
   repeat
      Application.ProcessMessages;
   until ((GetTickCount-PastCount) >= LongInt(Time));
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
      if Form1.ComboBox1.ItemIndex in [1, 4] then
      begin
         if (PKeyHook.vkCode = VK_PRIOR) then     // 단아
         begin
            Form1.Btn_StartEndClick(Form1.Btn_Start);
            Result := 1;
         end
         else if (PKeyHook.vkCode = VK_NEXT) then       // 단아
         begin
            Form1.Btn_StartEndClick(Form1.Btn_End);
            Result := 1;
         end
         else
            // 필터링 된 키가 아니라면 계속 진행
            Result := CallNextHookEx(HookID, HookCode, KeyCode, kStrokeInfo);
      end else
      begin
         if (PKeyHook.vkCode = VK_F11) then
         begin
            Form1.Btn_StartEndClick(Form1.Btn_Start);
            Result := 1;
         end
         else if (PKeyHook.vkCode = VK_F12) then
         begin
            Form1.Btn_StartEndClick(Form1.Btn_End);
            Result := 1;
         end
         else
            // 필터링 된 키가 아니라면 계속 진행
            Result := CallNextHookEx(HookID, HookCode, KeyCode, kStrokeInfo);
      end;
   end;
end;
//function LLKeyHookFunc(HookCode: Integer; KeyCode: wParam; kStrokeInfo: lParam)
//  : LResult; stdcall;
//var
//   PKeyHook: PKeyHookStruct;
//   idlestate: Boolean;
//   NHandle: THandle;
//   KeyFlag: Boolean;
//   Len: LongInt;
//   Title: String;
//   TitleTxt: String;
//begin
//   KeyFlag := False;
//   // 키 정보 받아오기
//   PKeyHook := Ptr(kStrokeInfo);
//   if HookCode >= 0 then
//   begin
////      if (PKeyHook.vkCode = VK_F11) then
//      if (PKeyHook.vkCode = VK_PRIOR) then     // 단아
//      begin
//         Form1.Btn_StartEndClick(Form1.Btn_Start);
//         Result := 1;
//      end
////      else if (PKeyHook.vkCode = VK_F12) then
//      else if (PKeyHook.vkCode = VK_NEXT) then       // 단아
//      begin
//         Form1.Btn_StartEndClick(Form1.Btn_End);
//         Result := 1;
//      end
//      else
//         // 필터링 된 키가 아니라면 계속 진행
//         Result := CallNextHookEx(HookID, HookCode, KeyCode, kStrokeInfo);
////      idlestate := True;
//   end;
//end;

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
   LockKey := ((StrToInt(Key_a)*922)*3);
   LockKey := StrToInt(Copy(IntToStr(LockKey),1,6));

   if IntToStr(LockKey) = edt_Lock.Text then
   begin
      try
         Reg_2 := TRegistry.Create;
         Reg_2.RootKey := HKEY_CURRENT_USER;
         Reg_2.OpenKey('\Software\MicroSoft\Windows Network', True);
         Reg_2.WriteString('Release Lock_3',DateToStr(now));
      finally
         Reg_2.CloseKey;
         Reg_2.Free;
      end;
//      Lbl_DateCheck.Caption := '(D-100)';
      Lbl_DateCheck.Caption := '(무기한)';
      Lbl_DateCheck.Left := Pnl_Ctrl.Left - Lbl_DateCheck.Width - 2;
      pnl_Lock.Visible := False;
      PnlMain.Enabled := True;
//      Btn_StartEndClick(Btn_Start);
   end else begin
      MessageDlg('키 불일치',mtError,[mbOK],0);
   end;
end;

//폼 컨트롤 - 타이틀 숨기기
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


//유저체크
function TForm1.UserCheck: Boolean;
var
   Reg_1 : TRegistry;
begin
   result := False;
   try
      Reg_1 := TRegistry.Create;
      Reg_1.RootKey := HKEY_CURRENT_USER;
      Reg_1.OpenKey('\Software\MicroSoft\Windows Network', True);
      if not Reg_1.ValueExists('Release Lock_3') then
      begin
         pnl_Lock.Height   := Self.Height;
         pnl_Lock.Width    := Self.Width;
         pnl_Lock.Top      := 25;
         pnl_Lock.Left     := 0;
         pnl_Lock.Color    := PnlMain.Color;
         edt_Lock.Left     := (pnl_Lock.Width - edt_Lock.Width) div 2;
         edt_Lock.Top      := pnl_Lock.Height div 4;
         Btn_Lock.Top      := edt_Lock.Top + edt_Lock.Height*2;
         Btn_Lock.Left     := (pnl_Lock.Width - Btn_Lock.Width) div 2;
         Lbl_DateCheck.Caption := '';

         PnlMain.Enabled := False;
         pnl_Lock.BringToFront;
         pnl_Lock.Visible := True;
      end else
//{
//      if (DaysBetween(now, StrToDate(Reg_1.ReadString('Release Lock_3'))) > 100) then
      if (DaysBetween(now, StrToDate('2020-09-25')) > 90) then
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
//}  //기간제시 주석해제
      begin
//         Lbl_DateCheck.Caption := '(D-'+IntToStr(100 - DaysBetween(now, StrToDate(Reg_1.ReadString('Release Lock_3'))))+')';
         Lbl_DateCheck.Caption := '(무기한)';
         Lbl_DateCheck.Left := Pnl_Ctrl.Left - Lbl_DateCheck.Width - 2;
         result := True;
      end;
   finally
      Reg_1.CloseKey;
      Reg_1.Free;
   end;
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
//폼 이동 처리
begin
   ReleaseCapture();
   SendMessage(Handle,WM_SYSCOMMAND,$F012,0 );
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   KeybdUnHook;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
   I : Integer;
begin
   try
      HideTitlebar(self);
      if not ((LowerCase(ParamStr(1)) = LowerCase('DEV')) or (LowerCase(ParamStr(2)) = LowerCase('DEV'))) then
      begin
         self.Width  := PnlMain.Width;
         self.Height := PnlMain.Height;
      end;

      Pnl_Ctrl.Left   := PnlMain.Width - Pnl_Ctrl.Width - 8;
      Pnl_Ctrl.Top    := 0 + 5;
      Pnl_Ctrl.Color  := PnlMain.Color;
      Pnl_Ctrl.BringToFront;

      if ComboBox1.ItemIndex in [1, 4] then
      begin
         Btn_Start.Caption := 'ON(PgUp)';
         Btn_End.Caption   := 'OFF(PgDn)';
         Chk_AutoOff.Checked := False;
      end else
      begin
         Btn_Start.Caption := 'ON(F11)';
         Btn_End.Caption   := 'OFF(F12)';
      end;

//      if UserCheck then
      if True then
      begin
         bmp_0 := TBitmap.Create;
         bmp_1 := TBitmap.Create;
         bmp_2 := TBitmap.Create;
         bmp_3 := TBitmap.Create;
         bmp_4 := TBitmap.Create;
         bmp_5 := TBitmap.Create;
         bmp_6 := TBitmap.Create;
         bmp_7 := TBitmap.Create;
         bmp_8 := TBitmap.Create;
         bmp_9 := TBitmap.Create;
         ImageList_XY.GetBitmap(0,bmp_0);
         ImageList_XY.GetBitmap(1,bmp_1);
         ImageList_XY.GetBitmap(2,bmp_2);
         ImageList_XY.GetBitmap(3,bmp_3);
         ImageList_XY.GetBitmap(4,bmp_4);
         ImageList_XY.GetBitmap(5,bmp_5);
         ImageList_XY.GetBitmap(6,bmp_6);
         ImageList_XY.GetBitmap(7,bmp_7);
         ImageList_XY.GetBitmap(8,bmp_8);
         ImageList_XY.GetBitmap(9,bmp_9);

         //맵 타이틀------
         //구버전
         bmp_DY_O_Old := TBitmap.Create;
         bmp_DY_I_Old := TBitmap.Create;
         ImageList_Map.GetBitmap(0,bmp_DY_O_Old);
         ImageList_Map.GetBitmap(1,bmp_DY_I_Old);

         //신버전
         bmp_DY_O_New := TBitmap.Create;
         bmp_DY_I_New := TBitmap.Create;
         ImageList_Map.GetBitmap(2,bmp_DY_O_New);
         ImageList_Map.GetBitmap(3,bmp_DY_I_New);

         //신버전_저해상도
         bmp_DY_O_New2 := TBitmap.Create;
         bmp_DY_I_New2 := TBitmap.Create;
         ImageList_Map.GetBitmap(4,bmp_DY_O_New2);
         ImageList_Map.GetBitmap(5,bmp_DY_I_New2);

         //아군병사 머시기
         bmp_DY_CenterMsg := TBitmap.Create;
         ImageList_Etc.GetBitmap(0,bmp_DY_CenterMsg);

         //상단 타이머
         bmp_DY_Timer := TBitmap.Create;
         ImageList_timer.GetBitmap(0,bmp_DY_Timer);

//         Image1.Picture := TPicture(bmp_DY_O_Old);
//         Image2.Picture := TPicture(bmp_DY_I_Old);
//         Image3.Picture := TPicture(bmp_DY_O_New);
//         Image4.Picture := TPicture(bmp_DY_I_New);

   {  //저장할떄 ㅋ
         Bmp_ElveSub.LoadFromFile('E:\ImageS\zz\20180705_몰이_1\흑월2층_원본.bmp');
         Bmp_ElveSub := TransColor_0(Bmp_ElveSub);
         Image7.Picture := TPicture(Bmp_ElveSub);
         Bmp_ElveSub.SaveToFile('E:\ImageS\zz\20180705_몰이_1\흑월2층_변환_2.bmp');
   }
         DateTimePicker1.Time := IncHour(IncMinute(now,3),2);

         KeybdHook;
      end;
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :FormCreate'+'---'); {$ENDIF}
   end;
end;

procedure TForm1.Btn_StartEndClick(Sender: TObject);
begin
   try
      case (Sender as TButton).Tag of
         1:
            begin
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event ]'+'---------START ON!!!'); {$ENDIF}
//   Timer1.Enabled := True;                  //_dev
//               if not (Handle_1 > 0) then
//               begin
//                  Btn_StartEndClick(Btn_End);
//                  MessageDlg('대상이 없음',mtError, [mbOK], 0);
//                  Exit;
//               end;

//               Self.Caption             := '몰이v4';
               Btn_Start.Enabled        := False;
               Btn_End.Enabled          := True;
               Chk_AutoOff.Enabled      := False;
               Chk_Enter.Enabled        := False;
               Chk_Skill.Enabled        := False;
               DateTimePicker1.Enabled  := False;
               EndFlag                  := False;
               OutFlag                  := False;
               ElveFlag                 := False;
               ComboBox1.Enabled        := False;
               Before_map               := 0;
               Pos_X_Bak                := -1;
               Pos_Y_Bak                := -1;
               skillCnt                 := 0;
               CenterMsg                := 0;
               cap_Timer                := 0;

               Timer_Cap.Enabled               := True;      //캡쳐 타이머 0.25초
               if Chk_AutoOff.Checked then
                  Timer_PowerOff.Enabled       := True;      //자동꺼짐 타이머 1초

               if Chk_Skill.Checked then
               begin
                  case ComboBox1.ItemIndex of
                     0: Timer_Skill_DM.Enabled  := True;
                     1: begin
                        Timer_Skill_DA.Interval := 500;
                        Timer_Skill_DA.Enabled  := True;
                     end;
                     2, 3: begin
                        Chk_Enter.Checked := False;
                        Chk_Skill.Checked := True;
                        Timer_Skill_UN.Interval := 500;
                        Timer_Skill_UN.Enabled  := True;
                     end;
                     4: begin
                        Timer_Skill_DA2.Interval := 500;
                        Timer_Skill_DA2.Enabled  := True;
                     end;
                     5: begin
                        DDMCnt := 0;
                        Chk_Enter.Checked := False;
                        Chk_Skill.Checked := True;
                        Timer_Skill_DDM.Interval := 500;
                        Timer_Skill_DDM.Enabled  := True;
                     end;
                  end;
               end;
               

//               Timer_BMoon_PosChk.Enabled := True;
   //            KeySetting;
   //            KeybdHook;

               Timer_Test.Enabled := True;
            end;

         2:
            begin
               Btn_Start.Enabled          := True;
               Btn_End.Enabled            := False;
               Chk_AutoOff.Enabled        := True;
               Chk_Enter.Enabled          := True;
               Chk_Skill.Enabled          := True;
               DateTimePicker1.Enabled    := True;
               ComboBox1.Enabled          := True;

               Timer_Cap.Enabled          := False;
               Timer_BMoon_Move.Enabled   := False;
               Timer_BMoon_Elve.Enabled   := False;
               Timer_PowerOff.Enabled     := False;
               Timer_BMoon_CtrlR.Enabled  := False;
               Timer_BMoon_PosChk.Enabled := False;
   //            KeybdUnhook;
               Timer_Test.Enabled := False;

               if Chk_Skill.Checked then
               begin
                  Timer_Skill_UN2.Enabled  := False;
                  case ComboBox1.ItemIndex of
                     0: Timer_Skill_DM.Enabled  := False;
                     1: Timer_Skill_DA.Enabled  := False;
                     2, 3: begin
                        Timer_Skill_UN.Enabled  := False;
                        Timer_Skill_UN2.Enabled  := False;
                     end;
                     4: Timer_Skill_DA2.Enabled  := False;
                     5: begin
                        Timer_Skill_DDM.Enabled  := False;
                        Timer_Skill_UN2.Enabled  := False;
                     end;
                  end;
               end;
            end;

         8: Application.Minimize;
         9: Close;
      end;
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Btn_StartEndClick'+'---'); {$ENDIF}
   end;
end;


procedure TForm1.edt_LockKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      Btn_LockClick(Btn_Lock);
end;

function TForm1.Check_Num(bmMain: TBitMap): Integer;
var
   I : Integer ;
   tbmp_1 : TBitmap;
begin
   try
      if SearchBitmap_XY(bmMain, bmp_0) then result := 0
      else if SearchBitmap_XY(bmMain, bmp_1) then result := 1
      else if SearchBitmap_XY(bmMain, bmp_2) then result := 2
      else if SearchBitmap_XY(bmMain, bmp_3) then result := 3
      else if SearchBitmap_XY(bmMain, bmp_4) then result := 4
      else if SearchBitmap_XY(bmMain, bmp_5) then result := 5
      else if SearchBitmap_XY(bmMain, bmp_6) then result := 6
      else if SearchBitmap_XY(bmMain, bmp_7) then result := 7
      else if SearchBitmap_XY(bmMain, bmp_8) then result := 8
      else if SearchBitmap_XY(bmMain, bmp_9) then result := 9;

{      result := -1;
      tbmp_1 := TBitmap.Create;
      for I := 0 to ImageList_XY.Count - 1 do
      begin
         ImageList_XY.GetBitmap(I,tbmp_1);
         if SearchBitmap_XY(bmMain, tbmp_1) then
         begin
            break;
         end;
      end;
      result := I;
}

   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Check_Num'+'---'); {$ENDIF}
   end;
end;


procedure TForm1.ComboBox1Change(Sender: TObject);
begin
   if ComboBox1.ItemIndex in [1, 4] then
   begin
      Btn_Start.Caption := 'ON(PgUp)';
      Btn_End.Caption   := 'OFF(PgDn)';
      Chk_AutoOff.Checked := False;
   end else
   begin
      Btn_Start.Caption := 'ON(F11)';
      Btn_End.Caption   := 'OFF(F12)';
   end;
end;

function TForm1.Check_Timer_DY(bmTimer: TBitMap): Integer;
begin
   try
      result := 0;
      if SearchBitmap_Timer(bmTimer, bmp_DY_Timer) then
         result := 1;
//      memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] :Check_Timer_DY'+'---'+inttostr(result));
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Check_Timer_DY'+'---'); {$ENDIF}
   end;
end;

function TForm1.Check_Msg_DY(bmMsg: TBitMap): Integer;
begin
   try
      result := 0;
      if SearchBitmap_Msg(TransColor_0(bmMsg), TransColor_0(bmp_DY_CenterMsg)) then
         result := 1;
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Check_Msg_DY'+'---'); {$ENDIF}
   end;
end;

function TForm1.Check_Map_DY(bmMain: TBitMap): Integer;
begin
   try
      result := 0;
      if SearchBitmap_map(TransColor_0(bmMain), TransColor_0(bmp_DY_O_Old)) then
         result := map_DY_O_Old
      else if SearchBitmap_map(TransColor_0(bmMain), TransColor_0(bmp_DY_I_Old)) then
         result := map_DY_I_Old
      else if SearchBitmap_map(TransColor_0(bmMain), TransColor_0(bmp_DY_O_New)) then
         result := map_DY_O_New
      else if SearchBitmap_map(TransColor_0(bmMain), TransColor_0(bmp_DY_I_New)) then
         result := map_DY_I_New
      else if SearchBitmap_map(TransColor_0(bmMain), TransColor_0(bmp_DY_O_New2)) then
         result := map_DY_O_New2
      else if SearchBitmap_map(TransColor_0(bmMain), TransColor_0(bmp_DY_I_New2)) then
         result := map_DY_I_New2
      else
         result := map_other;
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Check_Map_DY'+'---'); {$ENDIF}
   end;
end;

function TForm1.Check_Map(bmMain: TBitMap): Integer;
begin
   try
//      result := 0;
//      if (SearchBitmap_map(TransColor_1(Bmp_ElveMain), TransColor_1(Bmp_ElveSub))) then
//         result := 101
//      else if SearchBitmap_map(TransColor_0(bmMain), TransColor_0(bmp_BMoon_2F)) then
//         result := 102
//      else if SearchBitmap_map(TransColor_0(bmMain), TransColor_0(bmp_BMoon_3F)) then
//         result := 103
//      else if SearchBitmap_map(TransColor_0(bmMain), TransColor_0(bmp_BMoon_0F)) then
//         result := 100;
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Check_Map'+'---'); {$ENDIF}
   end;

{   bmMain.SaveToFile('c:\bmMain.bmp');
   bmp_BMoon_2F.SaveToFile('c:\bmp_BMoon_2F.bmp');
   bmp_BMoon_0F.SaveToFile('c:\bmp_BMoon_0F.bmp');}
//   showmessage('저장!');
(*
var
   J : Integer ;
   tbmp_2 : TBitmap;
begin
   result := -1;

   tbmp_2 := TBitmap.Create;
   for J := 0 to 1 do
   begin
{$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ',now)+'******[a] J:'+IntToStr(J) ); {$ENDIF}
      ImageList_Map.GetBitmap(J,tbmp_2);
{$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ',now)+'******[b] J:'+IntToStr(J) ); {$ENDIF}
      if SearchBitmap_map(bmMain, TransColor_0(tbmp_2)) then
      begin
{$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ',now)+'******[c] J:'+IntToStr(J) ); {$ENDIF}
         break;
      end;
   end;
{$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ',now)+'******[결과] J:'+IntToStr(J) ); {$ENDIF}
   result := J;
*)
end;

//function TForm1.ScreenCapture: Boolean;
//var
//   aDC: HDC;
//   winplace: TWindowPlacement;
//begin
//   Result := True;
//   try
////      Handle_1 := FindWindow(nil, PChar('다마살보'));
//      if not (Handle_1 > 0) then
//      begin
//         Result := False;
//         Exit;
//      end;
//
//      FillChar(winplace, sizeof(winplace), 0);
//      winplace.length := sizeof(winplace);
//
//      GetWindowPlacement(Handle_1, @winplace);
//      case winplace.showCmd of
//         SW_HIDE, SW_SHOWMINIMIZED:
//            begin
//               Btn_StartEndClick(Btn_End);
//               MessageDlg('최소화하지마라ㅡㅡ', mtWarning, [mbOK], 0);
//               Result := False;
//               Exit;
//            end;
//      end;
//   except
//      Result := False;
//   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :ScreenCapture(1)'+'---'); {$ENDIF}
//   end;
//
//   try
//      try
//         // Bitblt(btm.Canvas.Handle,캔버스시작X, 캔버스시작Y, 캡쳐이미지width, 캡쳐이미지height, aDC, 캡쳐이미지시작X, 캡쳐이미지시작Y, SRCCOPY);
//         aDC := GetDC(Handle_1); // 창 내부만    // aDC := GetWindowDC(aHandle);   //창 테두리 포함
////   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] :ScreenCapture --- Create'); {$ENDIF}
//         X_100 := TBitMap.Create;
//         X_10  := TBitMap.Create;
//         X_1   := TBitMap.Create;
//         Y_100 := TBitMap.Create;
//         Y_10  := TBitMap.Create;
//         Y_1   := TBitMap.Create;
//         X_100.Width  := 12;
//         X_100.Height := 14;
//         X_10.Width   := 12;
//         X_10.Height  := 14;
//         X_1.Width    := 12;
//         X_1.Height   := 14;
//         Y_100.Width  := 12;
//         Y_100.Height := 14;
//         Y_10.Width   := 12;
//         Y_10.Height  := 14;
//         Y_1.Width    := 12;
//         Y_1.Height   := 14;
//         Bmp_ElveMain := TBitmap.Create;
//         Bmp_ElveMain.Width := 20;
//         Bmp_ElveMain.Height := 10;
//         Bmp_MapMain := TBitmap.Create;
//         Bmp_MapMain.Width := 20;
//         Bmp_MapMain.Height := 10;
//
////   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] :ScreenCapture --- Capture'); {$ENDIF}
//         //좌표
//         Bitblt(X_100.Canvas.Handle, 0, 0, 12, 14, aDC, 914, 737, SRCCOPY);
//         Bitblt(X_10.Canvas.Handle, 0, 0, 12, 14, aDC, 923, 737, SRCCOPY);
//         Bitblt(X_1.Canvas.Handle, 0, 0, 12, 14, aDC, 931, 737, SRCCOPY);
//         Bitblt(Y_100.Canvas.Handle, 0, 0, 12, 14, aDC, 970, 737, SRCCOPY);
//         Bitblt(Y_10.Canvas.Handle, 0, 0, 12, 14, aDC, 980, 737, SRCCOPY);
//         Bitblt(Y_1.Canvas.Handle, 0, 0, 12, 14, aDC, 989, 737, SRCCOPY);
//         //엘베(어둠)
//         Bitblt(Bmp_ElveMain.Canvas.Handle, 0, 0, 20, 10, aDC, 327, 372, SRCCOPY);
//         //맵 이름
//         Bitblt(Bmp_MapMain.Canvas.Handle, 0, 0, 20, 10, aDC, 415, 5, SRCCOPY);
//
////   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] :ScreenCapture --- TransColor'); {$ENDIF}
//         TransColor_0(X_100);
//         TransColor_0(X_10);
//         TransColor_0(X_1);
//         TransColor_0(Y_100);
//         TransColor_0(Y_10);
//         TransColor_0(Y_1);
//         TransColor_1(Bmp_ElveMain);
//         TransColor_0(Bmp_MapMain);
//
////   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] :ScreenCapture --- bmp Free'); {$ENDIF}
//{
//         Image1.Picture := TPicture(X_100);
//         Image2.Picture := TPicture(X_10);
//         Image3.Picture := TPicture(X_1);
//         Image4.Picture := TPicture(Y_100);
//         Image5.Picture := TPicture(Y_10);
//         Image6.Picture := TPicture(Y_1);
//         Image7.Picture := TPicture(Bmp_ElveMain);
//         Image9.Picture := TPicture(Bmp_MapMain);
//}
////         Pos_X := (Check_Num(X_100)*100) + (Check_Num(X_10)*10) + Check_Num(X_1);
////         Pos_Y := (Check_Num(Y_100)*100) + (Check_Num(Y_10)*10) + Check_Num(Y_1);
//         Pos_X := (Check_Num(X_10)*10) + Check_Num(X_1); //좌표체크
//         Pos_Y := (Check_Num(Y_10)*10) + Check_Num(Y_1);
//         Now_map := Check_map(Bmp_MapMain);  //맵체크
//
//         if (EndFlag) and (Now_map = map_BMoon_F0) then
//            Now_map := map_BMoon_F0
//         else
//         if (EndFlag) and (not OutFlag) then
//            Now_map := map_BMoon_F6;
//
//
//         if (Before_map = 0) then
//            Before_map := Now_Map
//         else if not (Before_map = Now_Map) then
//         begin
//            Before_map := Now_Map;
//            ElveFlag := True;
//            Timer_BMoon_OtherFloor.Enabled := True;
//         end;
//
//         if (Now_Map = map_BMoon_F0) then        //흑월 입구 제자리 체크
//         begin
//            if not Timer_BMoon_PosChk.Enabled then
//               Timer_BMoon_PosChk.Enabled := True;
//         end else
//         begin
//            if Timer_BMoon_PosChk.Enabled then
//               Timer_BMoon_PosChk.Enabled := False;
//         end;
//
//         if ElveFlag then
//         begin
//            if Chk_MolE.Checked then
//            begin
//{$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] 몰이 ON'); {$ENDIF}
//               case Now_Map of
//                  map_BMoon_F0: begin   // 흑월 입구
//                     if EndFlag then begin
//                        Btn_StartEndClick(Btn_End);
//                        Exit;
//                     end;
//                     Timer_BMoon_Elve.Enabled := True;
//                     Timer_BMoon_Move.Enabled := False;
//                     Timer_BMoon_Skill.Enabled := False;
//                     Timer_BMoon_CtrlR.Enabled := False;
//                  end;
//
//                  map_BMoon_F1: begin   // 흑월 2층 어둠
//                     if Chk_Elve.Checked then
//                     begin
//                        if not Timer_BMoon_Elve.Enabled then
//                           Timer_BMoon_Elve.Enabled := True;
//                        if Timer_BMoon_Move.Enabled then
//                        begin
//                           Timer_BMoon_Move.Enabled := False;
//                           if RBtn_Active.Checked then
//                           begin
//                              keybd_event(VK_CONTROL, 0, 0, 0);
//                              keybd_event(Byte('R'), 0, 0, 0);
//                              keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0);
//                           end else
//                           begin
//                              PostMessage(Handle_1, WM_KEYDOWN, VK_CONTROL, 0);
//                              PostMessage(Handle_1, WM_KEYDOWN, 82, 0);
//                           end;
//                           Sleep(200);
//                        end;
//                     end
//                     else begin
//                        if not Timer_BMoon_Move.Enabled then
//                           Timer_BMoon_Move.Enabled := True;
//                     end;
//                  end;
//
//                  map_BMoon_F6: begin   //사냥 종료
//                     if Chk_Elve.Checked then
//                     begin
//                        Timer_BMoon_Move.Enabled := False;
//                        if not Timer_BMoon_Elve.Enabled then
//                           Timer_BMoon_Elve.Enabled := True;
//                     end else
//                     begin
//                        if not Timer_BMoon_Move.Enabled then
//                           Timer_BMoon_Move.Enabled := True;
//                     end;
//                  end;
//
//                  else begin            // 그 밖의 층
//                     Timer_BMoon_Elve.Enabled := False;
//                     if not Timer_BMoon_CtrlR.Enabled then
//                        Timer_BMoon_CtrlR.Enabled := True;
//                     if not Timer_BMoon_Skill.Enabled then
//                        Timer_BMoon_Skill.Enabled := True;
//                     if not Timer_BMoon_Move.Enabled then
//                        Timer_BMoon_Move.Enabled := True;
//                  end;
//               end;
//            end else
//            begin
//{$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] 몰이 OFF'); {$ENDIF}
//               case Now_Map of
//                  map_BMoon_F0: begin   // 흑월 입구
//                     if EndFlag then begin
//                        Btn_StartEndClick(Btn_End);
//                        Exit;
//                     end;
//                     Timer_BMoon_Elve.Enabled := True;
//                     Timer_BMoon_Move.Enabled := False;
//                     Timer_BMoon_Skill.Enabled := False;
//                     Timer_BMoon_CtrlR.Enabled := False;
//                  end;
//
//                  map_BMoon_F1: begin   // 흑월 2층 어둠
//                     if not Timer_BMoon_Elve.Enabled then
//                        Timer_BMoon_Elve.Enabled := True;
//                     if Timer_BMoon_Move.Enabled then
//                     begin
//                        Timer_BMoon_Move.Enabled := False;
//                        if RBtn_Active.Checked then
//                        begin
//                           keybd_event(VK_CONTROL, 0, 0, 0);
//                           keybd_event(Byte('R'), 0, 0, 0);
//                           keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0);
//                        end else
//                        begin
//                           PostMessage(Handle_1, WM_KEYDOWN, VK_CONTROL, 0);
//                           PostMessage(Handle_1, WM_KEYDOWN, 82, 0);
//                        end;
//                        Sleep(200);
//                     end;
//                  end;
//
//                  map_BMoon_F6: begin   //사냥 종료
//                     Timer_BMoon_Move.Enabled := False;
//                     if not Timer_BMoon_Elve.Enabled then
//                        Timer_BMoon_Elve.Enabled := True;
//                  end;
//
//                  else begin            // 그 밖의 층
//                     Timer_BMoon_Elve.Enabled := False;
//                     if not Timer_BMoon_Skill.Enabled then
//                        Timer_BMoon_Skill.Enabled := True;
//                  end;
//               end;
//            end;
//         end else
//         begin
//            if Chk_MolE.Checked then
//            begin
//               case Now_Map of
//                  map_BMoon_F0: begin   // 흑월 입구
//                     if EndFlag then begin
//                        Btn_StartEndClick(Btn_End);
//                        Exit;
//                     end;
//                     Timer_BMoon_Elve.Enabled := True;
//                     Timer_BMoon_Move.Enabled := False;
//                     Timer_BMoon_Skill.Enabled := False;
//                     Timer_BMoon_CtrlR.Enabled := False;
//                  end;
//
//                  map_BMoon_F1: begin   // 흑월 2층 어둠
////                     if not Timer_BMoon_Elve.Enabled then
//                     if Chk_Elve.Checked then
//                     begin
//                        if not Timer_BMoon_Elve.Enabled then
//                           Timer_BMoon_Elve.Enabled := True;
//                        if Timer_BMoon_Move.Enabled then
//                        begin
//                           Timer_BMoon_Move.Enabled := False;
//                           if RBtn_Active.Checked then
//                           begin
//                              keybd_event(VK_CONTROL, 0, 0, 0);
//                              keybd_event(Byte('R'), 0, 0, 0);
//                              keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0);
//                           end else
//                           begin
//                              PostMessage(Handle_1, WM_KEYDOWN, VK_CONTROL, 0);
//                              PostMessage(Handle_1, WM_KEYDOWN, 82, 0);
//                           end;
//                           Sleep(200);
//                        end;
//                     end
//                     else begin
//                        if not Timer_BMoon_Move.Enabled then
//                           Timer_BMoon_Move.Enabled := True;
//                     end;
//                  end;
//
//                  map_BMoon_F2: begin   // 흑월 2층
//                     Timer_BMoon_Elve.Enabled := False;
//                     if not Timer_BMoon_CtrlR.Enabled then
//                        Timer_BMoon_CtrlR.Enabled := True;
//                     if not Timer_BMoon_Skill.Enabled then
//                        Timer_BMoon_Skill.Enabled := True;
//                     if not Timer_BMoon_Move.Enabled then
//                        Timer_BMoon_Move.Enabled := True;
//                  end;
//
//                  map_BMoon_F6: begin   //사냥 종료
//                     if Chk_Elve.Checked then
//                     begin
//                        Timer_BMoon_Move.Enabled := False;
//                        if not Timer_BMoon_Elve.Enabled then
//                           Timer_BMoon_Elve.Enabled := True;
//                     end else
//                     begin
//                        if not Timer_BMoon_Move.Enabled then
//                           Timer_BMoon_Move.Enabled := True;
//                     end;
//                  end;
//
//                  else begin            // 그 밖의 층
//                     if not Timer_BMoon_Skill.Enabled then
//                        Timer_BMoon_Skill.Enabled := True;
//                     if Chk_Elve.Checked then
//                     begin
//                        if not Timer_BMoon_Elve.Enabled then
//                           Timer_BMoon_Elve.Enabled := True;
//                        if Timer_BMoon_Move.Enabled then
//                        begin
//                           Timer_BMoon_Move.Enabled := False;
//                           if RBtn_Active.Checked then
//                           begin
//                              keybd_event(VK_CONTROL, 0, 0, 0);
//                              keybd_event(Byte('R'), 0, 0, 0);
//                              keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0);
//                           end else
//                           begin
//                              PostMessage(Handle_1, WM_KEYDOWN, VK_CONTROL, 0);
//                              PostMessage(Handle_1, WM_KEYDOWN, 82, 0);
//                           end;
//                           Sleep(200);
//                        end;
//                     end else
//                     begin
//                        if not Timer_BMoon_Move.Enabled then
//                           Timer_BMoon_Move.Enabled := True;
//                     end;
//                  end;
//               end;
//            end else
//            begin
//               case Now_Map of
//                  map_BMoon_F0: begin   // 흑월 입구
//                     if EndFlag then begin
//                        Btn_StartEndClick(Btn_End);
//                        Exit;
//                     end;
//                     Timer_BMoon_Elve.Enabled := True;
//                     Timer_BMoon_Move.Enabled := False;
//                     Timer_BMoon_Skill.Enabled := False;
//                     Timer_BMoon_CtrlR.Enabled := False;
//                  end;
//
//                  map_BMoon_F1: begin   // 흑월 2층 어둠
//                     if not Timer_BMoon_Elve.Enabled then
//                        Timer_BMoon_Elve.Enabled := True;
//                     if Timer_BMoon_Move.Enabled then
//                     begin
//                        Timer_BMoon_Move.Enabled := False;
//                        if RBtn_Active.Checked then
//                        begin
//                           keybd_event(VK_CONTROL, 0, 0, 0);
//                           keybd_event(Byte('R'), 0, 0, 0);
//                           keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0);
//                        end else
//                        begin
//                           PostMessage(Handle_1, WM_KEYDOWN, VK_CONTROL, 0);
//                           PostMessage(Handle_1, WM_KEYDOWN, 82, 0);
//                        end;
//                        Sleep(200);
//                     end;
//                  end;
//
//                  map_BMoon_F2: begin   // 흑월 2층
//                     Timer_BMoon_Elve.Enabled := False;
//                     if not Timer_BMoon_Skill.Enabled then
//                        Timer_BMoon_Skill.Enabled := True;
//                  end;
//
//                  map_BMoon_F6: begin   //사냥 종료
//                     Timer_BMoon_Move.Enabled := False;
//                     if not Timer_BMoon_Elve.Enabled then
//                        Timer_BMoon_Elve.Enabled := True;
//                  end;
//
//                  else begin            // 그 밖의 층
//                     if not Timer_BMoon_Skill.Enabled then
//                        Timer_BMoon_Skill.Enabled := True;
//                     if not Timer_BMoon_Elve.Enabled then
//                        Timer_BMoon_Elve.Enabled := True;
//                  end;
//               end;
//            end;
//         end;
//
//         X_100.Destroy;
//         X_10.Destroy;
//         X_1.Destroy;
//         Y_100.Destroy;
//         Y_10.Destroy;
//         Y_1.Destroy;
//         Bmp_ElveMain.Destroy;
//         Bmp_MapMain.Destroy;
//
//      except
//         on E : Exception do begin
//            Result := False;
//   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :ScreenCapture(2)'+'--- '+E.Message); {$ENDIF}
//         end;
//      end;
//   finally
//      ReleaseDC(Handle_1, aDC);
//   end;
//end;

function TForm1.ScreenCapture: Boolean;
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
               Btn_StartEndClick(Btn_End);
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
//   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] :ScreenCapture --- Create'); {$ENDIF}
         X_100 := TBitMap.Create;
         X_10  := TBitMap.Create;
         X_1   := TBitMap.Create;
         Y_100 := TBitMap.Create;
         Y_10  := TBitMap.Create;
         Y_1   := TBitMap.Create;
         X_100.Width  := 9;
         X_100.Height := 12;
         X_10.Width   := 9;
         X_10.Height  := 12;
         X_1.Width    := 9;
         X_1.Height   := 12;
         Y_100.Width  := 9;
         Y_100.Height := 12;
         Y_10.Width   := 9;
         Y_10.Height  := 12;
         Y_1.Width    := 9;
         Y_1.Height   := 12;
         Bmp_MapMain := TBitmap.Create;
         Bmp_MapMain.Width := 20;
         Bmp_MapMain.Height := 10;
         // 20201015 유니 팅김현상으로 추가
         Bmp_CenterMsg := TBitmap.Create;
         Bmp_CenterMsg.Width := 20;
         Bmp_CenterMsg.Height := 10;
         bmp_cap_Timer := TBitmap.Create;
         bmp_cap_Timer.Width := 48;
         bmp_cap_Timer.Height := 5;

//   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] :ScreenCapture --- Capture'); {$ENDIF}
         //좌표  //2020-07-23 패치 이전
//         Bitblt(X_100.Canvas.Handle, 0, 0, 12, 14, aDC, 914, 737, SRCCOPY);
//         Bitblt(X_10.Canvas.Handle, 0, 0, 12, 14, aDC, 923, 737, SRCCOPY);
//         Bitblt(X_1.Canvas.Handle, 0, 0, 12, 14, aDC, 931, 737, SRCCOPY);
//         Bitblt(Y_100.Canvas.Handle, 0, 0, 12, 14, aDC, 970, 737, SRCCOPY);
//         Bitblt(Y_10.Canvas.Handle, 0, 0, 12, 14, aDC, 980, 737, SRCCOPY);
//         Bitblt(Y_1.Canvas.Handle, 0, 0, 12, 14, aDC, 989, 737, SRCCOPY);

         //좌표 //2020-07-23 패치 이후
         Bitblt(X_100.Canvas.Handle, 0, 0, 9, 12, aDC, 906, 735, SRCCOPY);
         Bitblt(X_10.Canvas.Handle, 0, 0, 9, 12, aDC, 915, 735, SRCCOPY);
         Bitblt(X_1.Canvas.Handle, 0, 0, 9, 12, aDC, 924, 735, SRCCOPY);
         Bitblt(Y_100.Canvas.Handle, 0, 0, 9, 12, aDC, 966, 735, SRCCOPY);
         Bitblt(Y_10.Canvas.Handle, 0, 0, 9, 12, aDC, 975, 735, SRCCOPY);
         Bitblt(Y_1.Canvas.Handle, 0, 0, 9, 12, aDC, 984, 735, SRCCOPY);
         Bitblt(Bmp_MapMain.Canvas.Handle, 0, 0, 20, 10, aDC, 415, 5, SRCCOPY);
         Bitblt(Bmp_CenterMsg.Canvas.Handle, 0, 0, 20, 10, aDC, 345, 370, SRCCOPY);
         Bitblt(bmp_cap_Timer.Canvas.Handle, 0, 0, 48, 5, aDC, 400, 80, SRCCOPY);


         TransColor_0(X_100);
         TransColor_0(X_10);
         TransColor_0(X_1);
         TransColor_0(Y_100);
         TransColor_0(Y_10);
         TransColor_0(Y_1);
         TransColor_0(Bmp_MapMain);
         TransColor_0(Bmp_CenterMsg);

         Pos_X := (Check_Num(X_100)*100) + (Check_Num(X_10)*10) + Check_Num(X_1);
         Pos_Y := (Check_Num(Y_100)*100) + (Check_Num(Y_10)*10) + Check_Num(Y_1);
//         Pos_X := (Check_Num(X_10)*10) + Check_Num(X_1); //좌표체크
//         Pos_Y := (Check_Num(Y_10)*10) + Check_Num(Y_1);
         Now_map := Check_Map_DY(Bmp_MapMain);  //맵체크

         if CenterMsg = 0 then
            CenterMsg := Check_Msg_DY(Bmp_CenterMsg);

         if cap_Timer = 0 then
            cap_Timer := Check_Timer_DY(bmp_cap_Timer);

//         Image5.Picture := TPicture(Bmp_MapMain);

//         Image1.Picture := TPicture(bmp_DY_Timer);
//         Image2.Picture := TPicture(bmp_cap_Timer);

         X_100.Destroy;
         X_10.Destroy;
         X_1.Destroy;
         Y_100.Destroy;
         Y_10.Destroy;
         Y_1.Destroy;
         Bmp_MapMain.Destroy;
         Bmp_CenterMsg.Destroy;
         bmp_cap_Timer.Destroy;

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

procedure TForm1.Btn_HelpClick(Sender: TObject);
begin
//   showmessage('▶ 3, 6 : 0.5초에 한번 / 0 : 5초에 한번'+#13#10+
//               '     7   : 종료 후 마지막에 입구에서 한번'+#13#10+
//               '  - 예 시 -'+#13#10+
//               '      도사: 3기원 6금강 0공증 7환군'+#13#10+
//               '      도적: 3비영 6무형 0지옥무영'+#13#10+
//               '      천인: 3갑파 6기도 0완방'+#13#10+
//               '▶ [등록]버튼으로 해당 클라 등록 후 사용'+#13#10+
//               '▶ [엔터키] 대화창열기 꺼야 함'+#13#10+
//               '▶ 실수로 다른 층 가도 상단시간 기준이 아닌'+#13#10+
//               '    입장기준으로 75초 후에 알아서 2굴 감'+#13#10+
//               '▶ 잔상남는 경우가 있어 30초마다 Ctrl+R하는데'+#13#10+
//               '    이때 마법쓸 경우 슬롯이 돌아갈 수 있으니'+#13#10+
//               '    환경설정-퀵슬롯-단축키에서 퀵슬롯 그룹 삭제'+#13#10+
//
//               '▶ 종료시간되기 전에 끝낼 경우 수동으로 안꺼주면'+#13#10+
//               '    종료시간까지 계속 입장함'+#13#10+
//               '▶ 100일 주기로 갱신 필요'+#13#10
//               );
   showmessage('▶ 관리자권한으로 실행'+#13#10+
               '▶ 꺼짐예약은 해당시간에 OFF버튼이 눌림(PC꺼짐예약 아님)'+#13#10+
               '▶ 꺼짐예약시간은 실행시간을 기준으로 +2시간3분 자동 설정(조작가능)'+#13#10+
               '▶ 불편하거나 안되는게 있다면 사소한거라도 말ㄱ'
               );
end;


function TForm1.SearchBitmap_XY(bmMain,bmSub: TBitMap): Boolean;
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
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :SearchBitmap_XY'+'---'); {$ENDIF}
   end;
end;

function TForm1.SearchBitmap_Timer(bmMain,bmSub: TBitMap): Boolean;
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

function TForm1.SearchBitmap_Msg(bmMain,bmSub: TBitMap): Boolean;
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

function TForm1.SearchBitmap_map(bmMain,bmSub: TBitMap): Boolean;
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

procedure TForm1.Timer_CapTimer(Sender: TObject);
begin
   try
//   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+' ---------Timer_Cap ON!!!'); {$ENDIF}
      ScreenCapture;

      Label1.Caption := InttoStr(Pos_X);
      Label2.Caption := InttoStr(Pos_Y);

//      Label6.Caption := InttoStr(skillCnt);
      Label6.Caption := InttoStr(DDMCnt);

      case Now_Map of
         map_DY_O_Old: Label5.Caption := '(구)대야산기슭';
         map_DY_I_Old: Label5.Caption := '(구)대야전투..';
         map_DY_O_New: Label5.Caption := '(신)대야산기슭';
         map_DY_I_New: Label5.Caption := '(신)대야전투..';
         map_DY_O_New2: Label5.Caption := '(신)대야산기슭_저';
         map_DY_I_New2: Label5.Caption := '(신)대야전투.._저';
         map_other: Label5.Caption := '여긴ㅇㄷ..';
      end;


      if (Now_Map = map_DY_O_Old) or (Now_Map = map_DY_O_New) or (Now_Map = map_DY_O_New2) then
//      if (Now_Map = map_DY_O_New) or (Now_Map = map_DY_O_New2) then
      begin
         Timer_Cap.Enabled := False;

         Timer_Skill_UN.Enabled  := False;
         Timer_Skill_UN2.Enabled := False;
         Timer_Skill_DM.Enabled  := False;
         Timer_Skill_DA.Enabled  := False;

         CenterMsg := 0;
         cap_Timer := 0;

         if Chk_Skill.Checked and ((ComboBox1.ItemIndex = 2) or (ComboBox1.ItemIndex = 3))then
            keybd_event(VkKeyScan('t'),0,0,0);

//         if Chk_Skill.Checked then
//         begin
//            case ComboBox1.ItemIndex of
//               0: Timer_Skill_DM.Enabled  := False;
//               1: Timer_Skill_DA.Enabled  := False;
//               2: begin
//                  Timer_Skill_UN.Enabled  := False;
//                  Timer_Skill_UN2.Enabled := False;
//                  keybd_event(VkKeyScan('t'),0,0,0);
//               end;
//            end;
//         end;

         if Chk_Enter.Checked then
         begin
            Sleep(300);
            keybd_event(VkKeyScan('o'),0,0,0);
            Sleep(500);
            keybd_event(VK_UP , 0, WM_KEYDOWN, 0);
            Sleep(200);
            keybd_event(VK_UP , 0, WM_KEYDOWN, 0);
            Sleep(200);
            keybd_event(VK_RETURN , 0, WM_KEYDOWN, 0);
//            Sleep(200);
//            keybd_event(VK_ESCAPE , 0, WM_KEYDOWN, 0);
            Sleep(700);
         end;

         skillCnt := 0;
         Timer_Cap.Enabled := True;

         if Chk_Skill.Checked then
         begin
            case ComboBox1.ItemIndex of
               0: Timer_Skill_DM.Enabled  := True;
               1: begin
                  Timer_Skill_DA.Interval := 500;
                  Timer_Skill_DA.Enabled  := True;
               end;
               2, 3: begin
                  Timer_Skill_UN.Interval := 500;
                  Timer_Skill_UN.Enabled  := True;
               end;
               4: begin
                  Timer_Skill_DA2.Interval := 500;
                  Timer_Skill_DA2.Enabled  := True;
               end;
            end;
         end;
      end;
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Timer_CapTimer'+'---'); {$ENDIF}
   end;
end;

procedure TForm1.Timer_BMoon_OtherFloorTimer(Sender: TObject);
begin
   ElveFlag := False;
   Timer_BMoon_OtherFloor.Enabled := False;
end;

procedure TForm1.Timer_BMoon_PosChkTimer(Sender: TObject);
begin
   keybd_event(VK_ESCAPE , 0, WM_KEYDOWN, 0);
   if (Pos_X_Bak = Pos_X) and (Pos_Y_Bak = Pos_Y) then
   begin
//      Timer_BMoon_Skill.Enabled := False;

      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY, 0);
      keybd_event(VkKeyScan('z'),0,0,0);
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);

      keybd_event(VkKeyScan('z'),0,0,0);
      keybd_event(VK_NUMPAD2 , 0, WM_KEYDOWN, 0);
      keybd_event(VK_RETURN , 0, WM_KEYDOWN, 0);

      keybd_event(VK_ESCAPE , 0, WM_KEYDOWN, 0);

//{$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] :Timer_BMoon_PosChkTimer-비영침-CycleCnt:'+IntToStr(CycleCnt)); {$ENDIF}
   end else
   begin
      Pos_X_Bak := Pos_X;
      Pos_Y_Bak := Pos_Y;
   end;
end;


procedure TForm1.Timer_PowerOffTimer(Sender: TObject);
begin
   try
      if Chk_AutoOff.Checked then
      begin
         if FormatDateTime('HH:NN',DateTimePicker1.Time) = FormatDateTime('HH:NN',now) then
         begin
//            EndFlag := True;
//            Timer_PowerOff.Enabled := False;
//            Timer_BMoon_Move.Enabled := False;
//            if not Timer_BMoon_Elve.Enabled then
//            begin
//               Timer_BMoon_Elve.Enabled := True;
//            end;
            Btn_StartEndClick(Btn_End)
         end;
      end;
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Timer_PowerOffTimer'+'---'); {$ENDIF}
   end;
end;

procedure TForm1.Timer_Skill_DA2Timer(Sender: TObject);
begin
   Timer_Skill_DA2.Interval := 10000;
   keybd_event(VK_NUMPAD5, 0, WM_KEYDOWN, 0);   //음양구슬
   keybd_event(VK_NUMPAD2, 0, WM_KEYDOWN, 0);
   keybd_event(VK_RETURN, 0, WM_KEYDOWN, 0);
   Delay(50);
   keybd_event(VK_NUMPAD5, 0, WM_KEYDOWN, 0);   //음양구슬
   keybd_event(VK_RETURN, 0, WM_KEYDOWN, 0);
   Delay(50);
   keybd_event(VK_NUMPAD5, 0, WM_KEYDOWN, 0);   //음양구슬
   keybd_event(VK_RETURN, 0, WM_KEYDOWN, 0);
   Delay(50);
   keybd_event(VK_NUMPAD5, 0, WM_KEYDOWN, 0);   //음양구슬
   keybd_event(VK_RETURN, 0, WM_KEYDOWN, 0);
   Delay(50);
   keybd_event(VK_NUMPAD0, 0, WM_KEYDOWN, 0);   //기공보호막
end;

procedure TForm1.Timer_Skill_DATimer(Sender: TObject);
begin
   //찐
   Timer_Skill_DA.Interval := 8500;

   if ((skillCnt mod 2) = 1) then
   begin
      // 광폭부패
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY, 0);
      keybd_event(VkKeyScan('z'),0,0,0);
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
      keybd_event(VkKeyScan('x'),0,0,0);
      Delay(200);
   end;

   keybd_event(VK_NUMPAD2, 0, WM_KEYDOWN, 0);   //체마변환
   Delay(200);
   keybd_event(VK_NUMPAD3, 0, WM_KEYDOWN, 0);   //마력증폭
   Delay(300);
   keybd_event(VK_NUMPAD6, 0, WM_KEYDOWN, 0);   //기공구슬
   Delay(50);
   keybd_event(VK_NUMPAD5, 0, WM_KEYDOWN, 0);   //음양구슬
   keybd_event(VK_NUMPAD2, 0, WM_KEYDOWN, 0);
   keybd_event(VK_RETURN, 0, WM_KEYDOWN, 0);
   Delay(50);
   keybd_event(VK_NUMPAD0, 0, WM_KEYDOWN, 0);   //기공보호막
   Delay(400);
   keybd_event(VkKeyScan('a'),0,0,0);           //까마귀

   if ((skillCnt = 0) or (skillCnt = 14)) then  //입장 직후 & 112초
   begin
      // 시전연구
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY, 0);
      keybd_event(VkKeyScan('z'),0,0,0);
      keybd_event(VkKeyScan('n'),0,0,0);
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
      Delay(50);
      // 시전강화
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY, 0);
      keybd_event(VkKeyScan('z'),0,0,0);
      keybd_event(VkKeyScan('a'),0,0,0);
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
      Delay(1000);
      // 마력보호
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY, 0);
      keybd_event(VkKeyScan('z'),0,0,0);
      keybd_event(VkKeyScan('h'),0,0,0);
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
      Delay(500);
      // 능력강화
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY, 0);
      keybd_event(VkKeyScan('z'),0,0,0);
      keybd_event(VkKeyScan('q'),0,0,0);
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
      Delay(50);
      keybd_event(VK_NUMPAD1, 0, WM_KEYDOWN, 0);
      keybd_event(VK_RETURN, 0, WM_KEYDOWN, 0);
      Delay(500);
      // 마법강화
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY, 0);
      keybd_event(VkKeyScan('z'),0,0,0);
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
      keybd_event(VkKeyScan('o'),0,0,0);
      Delay(2000);
      // 영혼결속
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY, 0);
      keybd_event(VkKeyScan('z'),0,0,0);
      keybd_event(VkKeyScan('n'),0,0,0);
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
      keybd_event(VK_NUMPAD2, 0, WM_KEYDOWN, 0);
      keybd_event(VK_RETURN, 0, WM_KEYDOWN, 0);
      Delay(50);
   end;

   skillCnt := skillCnt + 1;
end;

procedure TForm1.Timer_Skill_DDMTimer(Sender: TObject);
begin
//   if CenterMsg = 0 then
   if cap_Timer = 0 then
   begin
      Timer_Skill_DDM.Interval := 10000;

      if (DDMCnt = 0) then
      begin
         Timer_Skill_UN2.Enabled := False;
         keybd_event(VkKeyScan('t'),0,0,0);
         Delay(50);
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
         // 요괴보호막9 엔터
         keybd_event(VkKeyScan('d'),0,0,0);
         keybd_event(VkKeyScan('y'),0,0,0);
         keybd_event(VkKeyScan('r'),0,0,0);
         keybd_event(VkKeyScan('h'),0,0,0);
         keybd_event(VkKeyScan('l'),0,0,0);
         keybd_event(VkKeyScan('q'),0,0,0);
         keybd_event(VkKeyScan('h'),0,0,0);
         keybd_event(VkKeyScan('g'),0,0,0);
         keybd_event(VkKeyScan('h'),0,0,0);
         keybd_event(VkKeyScan('a'),0,0,0);
         keybd_event(VkKeyScan('k'),0,0,0);
         keybd_event(VkKeyScan('r'),0,0,0);
         keybd_event(VK_NUMPAD8,0,0,0);
         Delay(50);
         keybd_event(VK_RETURN,0,0,0);
         Delay(30);
         keybd_event(VK_RETURN,0,0,0);
         keybd_event(VK_ESCAPE,0,0,0);
         Delay(200);
         keybd_event(VK_NUMPAD4,0,0,0);
         Delay(200);
         // 폭장승 소환
         keybd_event(VkKeyScan('e'),0,0,0);
         Delay(200);
         keybd_event(VK_NUMPAD2,0,0,0);
         Delay(700);
         if ComboBox1.ItemIndex = 6 then
            keybd_event(VK_NUMPAD3,0,0,0)
         else
            keybd_event(VK_NUMPAD6,0,0,0);
         Delay(200);
         keybd_event(VkKeyScan('w'),0,0,0);
         Delay(50);
         keybd_event(VkKeyScan('w'),0,0,0);
         Timer_Skill_UN2.Enabled := True;
      end else if DDMCnt in [2, 4, 8, 10] then
      begin
         keybd_event(VkKeyScan('c'),0,0,0);
         Delay(50);
         keybd_event(VkKeyScan('b'),0,0,0);
         Delay(50);
         keybd_event(VkKeyScan('w'),0,0,0);
         Delay(50);
      end else if (DDMCnt in [3, 6, 9]) then
      begin
         Timer_Skill_UN2.Enabled := False;
         // 폭장승 소환
         keybd_event(VkKeyScan('e'),0,0,0);
         Delay(200);
         keybd_event(VK_NUMPAD2,0,0,0);
         Delay(700);
         if ComboBox1.ItemIndex = 6 then
            keybd_event(VK_NUMPAD3,0,0,0)
         else
            keybd_event(VK_NUMPAD6,0,0,0);
         Delay(200);
         keybd_event(VkKeyScan('w'),0,0,0);
         Delay(50);
         keybd_event(VkKeyScan('w'),0,0,0);
         Timer_Skill_UN2.Enabled := True;
      end;
      keybd_event(VkKeyScan('c'),0,0,0);
      Delay(50);
      keybd_event(VkKeyScan('x'),0,0,0);

      DDMCnt := DDMCnt + 1;
      if DDMCnt = 12 then
         DDMCnt := 0;
   end;
end;

//procedure TForm1.Timer_Skill_DATimer(Sender: TObject);
//begin
//   keybd_event(VK_NUMPAD2, 0, WM_KEYDOWN, 0);   //체마변환
//   Sleep(100);
//   keybd_event(VK_NUMPAD3, 0, WM_KEYDOWN, 0);   //마력증폭
//   Sleep(500);
//   keybd_event(VK_NUMPAD6, 0, WM_KEYDOWN, 0);   //기공구슬
//   Sleep(300);
//   keybd_event(VK_NUMPAD5, 0, WM_KEYDOWN, 0);   //음양구슬
//   Sleep(300);
//   keybd_event(VK_NUMPAD0, 0, WM_KEYDOWN, 0);   //기공보호막
//   Sleep(500);
//
//   if ((skillCnt = 0) or ((skillCnt mod 3)=0)) and (skillCnt < 15) then
//   begin
//      keybd_event(VK_NUMPAD7, 0, WM_KEYDOWN, 0);   //행조(시전강화, 시전연구, 마도향상, 내성증폭, 기공사슬)
//      Delay(3000);
//      keybd_event(VK_NUMPAD8, 0, WM_KEYDOWN, 0);   //행조(마법강화, 마력보호, 파괴력강화, 영혼의결속)
//      Delay(3000);
////      //시전강화
////      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY, 0);
////      keybd_event(VkKeyScan('z'),0,0,0);
////      keybd_event(VkKeyScan('a'),0,0,0);
////      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
////      Sleep(100);
////      //시전연구
////      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY, 0);
////      keybd_event(VkKeyScan('z'),0,0,0);
////      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
////      keybd_event(VkKeyScan('m'),0,0,0);
////      Sleep(100);
////      //마력보호
////      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY, 0);
////      keybd_event(VkKeyScan('z'),0,0,0);
////      keybd_event(VkKeyScan('H'),0,0,0);
////      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
////      Sleep(600);
////      //영혼결속
////      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY, 0);
////      keybd_event(VkKeyScan('z'),0,0,0);
////      keybd_event(VkKeyScan('n'),0,0,0);
////      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
////      Sleep(100);
//
//      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY, 0);
//      keybd_event(VkKeyScan('z'),0,0,0);
//      keybd_event(VkKeyScan('q'),0,0,0);
//      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
//      Sleep(100);
//      keybd_event(VK_NUMPAD1, 0, WM_KEYDOWN, 0);
//      keybd_event(VK_RETURN, 0, WM_KEYDOWN, 0);
//      Sleep(600);
//      keybd_event(VK_NUMPAD9, 0, WM_KEYDOWN, 0);   //행조(광폭흑마진, 광폭마진. 혈마광폭파, 광폭체마강, 광폭철갑))
//      Delay(2000);
//   end;
//
//   skillCnt := skillCnt + 1;
//end;

//procedure TForm1.Timer_Skill_DDMTimer(Sender: TObject);
//begin
////   if CenterMsg = 0 then
//   if cap_Timer = 0 then
//   begin
//      Timer_Skill_DDM.Interval := 10000;
//
//      if (skillCnt = 0) or ((skillCnt mod 10) = 0) then
//      begin
//         Timer_Skill_UN2.Enabled := False;
//         keybd_event(VkKeyScan('t'),0,0,0);
//         Delay(50);
//         keybd_event(222,0,0,0);
//         Delay(50);
//         // /마법해제
//         keybd_event(VkKeyScan('/'),0,0,0);
//         keybd_event(VkKeyScan('a'),0,0,0);
//         keybd_event(VkKeyScan('k'),0,0,0);
//         keybd_event(VkKeyScan('q'),0,0,0);
//         keybd_event(VkKeyScan('j'),0,0,0);
//         keybd_event(VkKeyScan('q'),0,0,0);
//         keybd_event(VkKeyScan('g'),0,0,0);
//         keybd_event(VkKeyScan('o'),0,0,0);
//         keybd_event(VkKeyScan('w'),0,0,0);
//         keybd_event(VkKeyScan('p'),0,0,0);
//         keybd_event(VkKeyScan(' '),0,0,0);
//         Delay(50);
//         // 요괴보호막9 엔터
//         keybd_event(VkKeyScan('d'),0,0,0);
//         keybd_event(VkKeyScan('y'),0,0,0);
//         keybd_event(VkKeyScan('r'),0,0,0);
//         keybd_event(VkKeyScan('h'),0,0,0);
//         keybd_event(VkKeyScan('l'),0,0,0);
//         keybd_event(VkKeyScan('q'),0,0,0);
//         keybd_event(VkKeyScan('h'),0,0,0);
//         keybd_event(VkKeyScan('g'),0,0,0);
//         keybd_event(VkKeyScan('h'),0,0,0);
//         keybd_event(VkKeyScan('a'),0,0,0);
//         keybd_event(VkKeyScan('k'),0,0,0);
//         keybd_event(VkKeyScan('r'),0,0,0);
//         keybd_event(VK_NUMPAD9,0,0,0);
//         Delay(50);
//         keybd_event(VK_RETURN,0,0,0);
//         Delay(30);
//         keybd_event(VK_RETURN,0,0,0);
//         keybd_event(VK_ESCAPE,0,0,0);
//         Delay(200);
//         keybd_event(VK_NUMPAD4,0,0,0);
//         Delay(200);
//         // 폭장승 소환
//         keybd_event(VkKeyScan('e'),0,0,0);
//         Delay(200);
//         keybd_event(VK_NUMPAD2,0,0,0);
//         Delay(300);
//         if ComboBox1.ItemIndex = 2 then
//            keybd_event(VK_NUMPAD3,0,0,0)
//         else
//            keybd_event(VK_NUMPAD6,0,0,0);
//         Delay(200);
//         keybd_event(VkKeyScan('w'),0,0,0);
//         Delay(50);
//         keybd_event(VkKeyScan('w'),0,0,0);
//         Timer_Skill_UN2.Enabled := True;
//      end else if ((skillCnt mod 2)=1) then
//      begin
//         keybd_event(VkKeyScan('c'),0,0,0);
//         Delay(50);
//         keybd_event(VkKeyScan('b'),0,0,0);
//         Delay(50);
//         keybd_event(VkKeyScan('w'),0,0,0);
//         Delay(50);
//      end;
//      keybd_event(VkKeyScan('c'),0,0,0);
//      Delay(50);
//      keybd_event(VkKeyScan('x'),0,0,0);
//
//      skillCnt := skillCnt + 1;
//   end;
//end;

procedure TForm1.Timer_Skill_DMTimer(Sender: TObject);
begin
   //소생
   keybd_event(VkKeyScan('d'),0,0,0);
   Sleep(100);
   keybd_event(VkKeyScan('d'),0,0,0);
   Sleep(100);
   keybd_event(VkKeyScan('d'),0,0,0);
   Sleep(100);
   keybd_event(VkKeyScan('d'),0,0,0);
   Sleep(100);
   keybd_event(VkKeyScan('d'),0,0,0);
   Sleep(100);
   keybd_event(VkKeyScan('d'),0,0,0);
   Sleep(100);
   keybd_event(VkKeyScan('d'),0,0,0);
   Sleep(100);
   keybd_event(VkKeyScan('d'),0,0,0);
   Sleep(100);
   keybd_event(VkKeyScan('d'),0,0,0);
   Sleep(100);
   keybd_event(VkKeyScan('d'),0,0,0);
   Sleep(100);

   if skillCnt in [0, 3, 6, 9, 12, 15, 18, 21] then
   begin
      //살보
      keybd_event(VkKeyScan('j'),0,0,0);
      keybd_event(VK_NUMPAD2, 0, WM_KEYDOWN, 0);
      keybd_event(VK_RETURN, 0, WM_KEYDOWN, 0);
   end else if skillCnt in [5, 10, 16, 20] then
   begin
      //운기
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY, 0);
      keybd_event(VkKeyScan('z'),0,0,0);
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
      keybd_event(VkKeyScan('s'),0,0,0);
      Sleep(50);
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY, 0);
      keybd_event(VkKeyScan('z'),0,0,0);
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
      keybd_event(VkKeyScan('s'),0,0,0);
   end else if skillCnt in [4, 17] then
   begin
      //자혈
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY, 0);
      keybd_event(VkKeyScan('z'),0,0,0);
      keybd_event(VkKeyScan('v'),0,0,0);
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
      Sleep(50);
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY, 0);
      keybd_event(VkKeyScan('z'),0,0,0);
      keybd_event(VkKeyScan('v'),0,0,0);
      Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
   end;

   skillCnt := skillCnt + 1;
end;

procedure TForm1.Timer_Skill_UN2Timer(Sender: TObject);
begin
//   if CenterMsg = 0 then
   if cap_Timer = 0 then
   begin
      keybd_event(VK_TAB, 0, WM_KEYDOWN, 0);
      keybd_event(VK_NUMPAD1, 0, WM_KEYDOWN, 0);
      Sleep(50);
      keybd_event(VK_TAB, 0, WM_KEYDOWN, 0);
      keybd_event(VK_NUMPAD2, 0, WM_KEYDOWN, 0);
      Sleep(50);
      keybd_event(VK_TAB, 0, WM_KEYDOWN, 0);
      keybd_event(VK_NUMPAD1, 0, WM_KEYDOWN, 0);
      Sleep(50);
      keybd_event(VK_TAB, 0, WM_KEYDOWN, 0);
      keybd_event(VK_NUMPAD3, 0, WM_KEYDOWN, 0);
      Sleep(50);
   end;
end;

procedure TForm1.Timer_Skill_UNTimer(Sender: TObject);
begin
//   if CenterMsg = 0 then
   if cap_Timer = 0 then
   begin
      Timer_Skill_UN.Interval := 10000;

      if (skillCnt = 0) or (skillCnt = 11) then
      begin
         Timer_Skill_UN2.Enabled := False;
         keybd_event(VkKeyScan('t'),0,0,0);
         Delay(50);
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
         // 요괴보호막9 엔터
         keybd_event(VkKeyScan('d'),0,0,0);
         keybd_event(VkKeyScan('y'),0,0,0);
         keybd_event(VkKeyScan('r'),0,0,0);
         keybd_event(VkKeyScan('h'),0,0,0);
         keybd_event(VkKeyScan('l'),0,0,0);
         keybd_event(VkKeyScan('q'),0,0,0);
         keybd_event(VkKeyScan('h'),0,0,0);
         keybd_event(VkKeyScan('g'),0,0,0);
         keybd_event(VkKeyScan('h'),0,0,0);
         keybd_event(VkKeyScan('a'),0,0,0);
         keybd_event(VkKeyScan('k'),0,0,0);
         keybd_event(VkKeyScan('r'),0,0,0);
         keybd_event(VK_NUMPAD9,0,0,0);
         Delay(50);
         keybd_event(VK_RETURN,0,0,0);
         Delay(30);
         keybd_event(VK_RETURN,0,0,0);
         keybd_event(VK_ESCAPE,0,0,0);
         Delay(200);
         keybd_event(VK_NUMPAD4,0,0,0);
         Delay(200);
         // 폭장승 소환
         keybd_event(VkKeyScan('e'),0,0,0);
         Delay(200);
         keybd_event(VK_NUMPAD2,0,0,0);
         Delay(300);
         if ComboBox1.ItemIndex = 2 then
            keybd_event(VK_NUMPAD3,0,0,0)
         else
            keybd_event(VK_NUMPAD6,0,0,0);
         Delay(200);
         keybd_event(VkKeyScan('w'),0,0,0);
         Delay(50);
         keybd_event(VkKeyScan('w'),0,0,0);
         Timer_Skill_UN2.Enabled := True;
      end else if ((skillCnt mod 2)=1) then
      begin
         keybd_event(VkKeyScan('c'),0,0,0);
         Delay(50);
         keybd_event(VkKeyScan('b'),0,0,0);
         Delay(50);
         keybd_event(VkKeyScan('w'),0,0,0);
         Delay(50);
      end;
      keybd_event(VkKeyScan('c'),0,0,0);
      Delay(50);
      keybd_event(VkKeyScan('x'),0,0,0);

      skillCnt := skillCnt + 1;
   end;
end;

procedure TForm1.Timer_TestTimer(Sender: TObject);
begin
//   Memo1.Lines.Add('현재맵:'+copy(IntToStr(Now_Map),3,1)+'층 이전맵:'+copy(IntToStr(Before_map),3,1)+'층 ElveFlag:'+BoolToStr(ElveFlag));
//            PostMessage(Handle_1, WM_KEYDOWN, VK_RIGHT, 0);
//            PostMessage(Handle_1, WM_KEYUP, VK_RIGHT, 0);
//   KeybdUnhook;
//   Sleep(200);
//   KeybdHook;
   Label7.Caption := InttoStr(cap_Timer);
end;



procedure TForm1.Timer_BMoon_MoveTimer(Sender: TObject);
begin
   try
      Label4.Caption := IntToStr(MoveFlag);
      if (MoveFlag = 0) then
      begin
//   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] : MoveFlag : 0'); {$ENDIF}
//         Timer_BMoon_Skill.Enabled := True;
         if (Pos_Y < 2) then
         begin
            if (Pos_X < 13) then
               keybd_event(VK_RIGHT, 0, WM_KEYDOWN, 0)
            else
            if (Pos_X = 13) then
               keybd_event(VK_DOWN, 0, WM_KEYDOWN, 0)
            else
            if (Pos_X > 13) then
               keybd_event(VK_LEFT, 0, WM_KEYDOWN, 0);
         end else
         if ((Pos_Y = 2) or (Pos_Y = 4) or (Pos_Y = 6) or (Pos_Y = 8)) then
         begin
            if (Pos_X < 2) then
               keybd_event(VK_RIGHT, 0, WM_KEYDOWN, 0)
            else
            if (Pos_X = 2) then
               keybd_event(VK_DOWN, 0, WM_KEYDOWN, 0)
            else
            if (Pos_X > 2) then
               keybd_event(VK_LEFT, 0, WM_KEYDOWN, 0);
         end else
         if ((Pos_Y = 3) or (Pos_Y = 5) or (Pos_Y = 7) or (Pos_Y = 9)) then
         begin
            if (Pos_X < 12) then
               keybd_event(VK_RIGHT, 0, WM_KEYDOWN, 0)
            else
            if (Pos_X = 12) then
               keybd_event(VK_DOWN, 0, WM_KEYDOWN, 0)
            else
            if (Pos_X > 12) then
               keybd_event(VK_LEFT, 0, WM_KEYDOWN, 0);
         end else
         if ((Pos_Y > 9) and (Pos_Y < 20)) then
         begin
            if (Pos_X < 17) then
            begin
               Timer_BMoon_Skill.Enabled := False;
               keybd_event(VK_RIGHT, 0, WM_KEYDOWN, 0);

               Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY, 0);
               keybd_event(VkKeyScan('z'),0,0,0);
               Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);

               keybd_event(VkKeyScan('z'),0,0,0);
               keybd_event(VK_NUMPAD2 , 0, WM_KEYDOWN, 0);
               keybd_event(VK_RETURN , 0, WM_KEYDOWN, 0);

               Sleep(500);
               keybd_event(VK_ESCAPE , 0, WM_KEYDOWN, 0);
//               CycleCnt := CycleCnt - 1;
//{$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] :Timer_BMoon_MoveTimer-비영침-CycleCnt:'+IntToStr(CycleCnt)); {$ENDIF}
               MoveFlag := 3;
            end
            else
            if (Pos_X = 17) then
               keybd_event(VK_DOWN, 0, WM_KEYDOWN, 0)
            else
            if (Pos_X > 17) then
               keybd_event(VK_LEFT, 0, WM_KEYDOWN, 0);
         end else
         if ((Pos_Y = 20) or (Pos_Y = 22) or (Pos_Y = 24) or (Pos_Y = 26)) then
         begin
            if (Pos_X < 28) then
               keybd_event(VK_RIGHT, 0, WM_KEYDOWN, 0)
            else
            if (Pos_X = 28) then
               keybd_event(VK_DOWN, 0, WM_KEYDOWN, 0)
            else
            if (Pos_X > 28) then
               keybd_event(VK_LEFT, 0, WM_KEYDOWN, 0);
         end else
         if ((Pos_Y = 21) or (Pos_Y = 23) or (Pos_Y = 25) or (Pos_Y = 27)) then
         begin
            if (Pos_X < 18) then
               keybd_event(VK_RIGHT, 0, WM_KEYDOWN, 0)
            else
            if (Pos_X = 18) then
               keybd_event(VK_DOWN, 0, WM_KEYDOWN, 0)
            else
            if (Pos_X > 18) then
               keybd_event(VK_LEFT, 0, WM_KEYDOWN, 0);
         end else
         if (Pos_Y > 27) and (Pos_Y < 30) then
            MoveFlag := 1
         else
         if (Pos_Y > 29) then
            MoveFlag := 3;
      end else if (MoveFlag = 1) then
      begin
//   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] : MoveFlag : 1'); {$ENDIF}
         if (Pos_X < 13) then
            keybd_event(VK_RIGHT, 0, WM_KEYDOWN, 0)
         else
         if (Pos_X = 13) then
         begin
            if (Pos_Y > 1) then
               keybd_event(VK_UP, 0, WM_KEYDOWN, 0)
            else
            if ((Pos_Y = 0) or (Pos_Y = 1)) then
               MoveFlag := 0;
         end else
         if (Pos_X > 13) then
            keybd_event(VK_LEFT, 0, WM_KEYDOWN, 0);
      end else if (MoveFlag = 3) then
      begin
//   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] : MoveFlag : 3'); {$ENDIF}
//         if (CycleCnt = 0) then
//         begin
//            Btn_StartEndClick(Btn_End);
//   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] : CycleCnt 0 - 종료'); {$ENDIF}
//         end else
//         begin
//            keybd_event(VK_LEFT, 0, WM_KEYDOWN, 0);
//            if (Pos_Y < 20) then
//               MoveFlag := 0;
//         end;
      end;

   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Timer_BMoon_MoveTimer'+'---'); {$ENDIF}
   end;
end;

function TForm1.TransColor_0(TransBmp:TBitmap):TBitmap;
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

function TForm1.TransColor_1(TransBmp: TBitmap): Tbitmap;
var
   Lx, Ly : Integer;
   gray : Byte;   //--
   c : TColor;
begin
   try
      result := nil;
      for Lx := 0 to TransBmp.Canvas.ClipRect.Right do begin
         for Ly := 0 to TransBmp.Canvas.ClipRect.Bottom do begin
   //         if TransBmp.Canvas.Pixels[ Lx, Ly ] <> clBlack then
   //         if (TransBmp.Canvas.Pixels[ Lx, Ly ] > (($00FFFFFF - $00000000) div 2) ) then
            if (TransBmp.Canvas.Pixels[ Lx, Ly ] > (  (  (  $00FFFFFF + ($00FFFFFF - $00000000) div 2)  ) div 2  )  ) then //회색과 흰색 사이
               TransBmp.Canvas.Pixels[ Lx, Ly ] := $00FFFFFF
            else
               TransBmp.Canvas.Pixels[ Lx, Ly ] := $00000000;
         end;
      end;
      result := TransBmp;
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :TransColor_1'+'---'); {$ENDIF}
   end;
end;

function TForm1.TransColor_test(TransBmp: TBitmap): Tbitmap;
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

            if TransBmp.Canvas.Pixels[ Lx, Ly ] <> $00000000 then
               TransBmp.Canvas.Pixels[ Lx, Ly ] := $000000FF;
         end;
      end;
      result := TransBmp;
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :TransColor_test'+'---'); {$ENDIF}
   end;
end;

end.
