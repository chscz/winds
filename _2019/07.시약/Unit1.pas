unit Unit1;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
   Vcl.StdCtrls, Vcl.ComCtrls,
   Vcl.ExtCtrls, Vcl.Buttons
   , System.Win.Registry, IniFiles;

const
   CONFIGFILE   = 'Config.ini';

type
   TMakeThread1 = class(TThread)
      private
      protected
         procedure Execute; override;
      public
         constructor Create;
         destructor Destroy; override;
   end;

   TMakeThread2 = class(TThread)
      private
      protected
         procedure Execute; override;
      public
         constructor Create;
         destructor Destroy; override;
   end;

   TMakeThread3 = class(TThread)
      private
      protected
         procedure Execute; override;
      public
         constructor Create;
         destructor Destroy; override;
   end;

   TMakeThread4 = class(TThread)
      private
      protected
         procedure Execute; override;
      public
         constructor Create;
         destructor Destroy; override;
   end;

   TForm1 = class(TForm)
    Btn_Start1: TButton;
    Btn_Stop1: TButton;
    PnlMain: TPanel;
    LLblMain: TLabel;
    pnl_Lock: TPanel;
    edt_Lock: TEdit;
    Btn_Lock: TButton;
    Lbl_ID1: TLabel;
    Pnl_Ctrl: TPanel;
    Btn_Minimize: TButton;
    Btn_Close: TButton;
    Btn_Reg1: TButton;
    Btn_Reg2: TButton;
    Btn_Reg3: TButton;
    Btn_Reset1: TButton;
    Btn_Reset2: TButton;
    Btn_Reset3: TButton;
    Img_ID1: TImage;
    Img_ID2: TImage;
    Img_ID3: TImage;
    Img_ID4: TImage;
    Btn_Reg4: TButton;
    Btn_Reset4: TButton;
    Lbl_Key1: TLabel;
    Panel1: TPanel;
    Edt_Key1: TEdit;
    Cbx_Category1_1: TComboBox;
    Cbx_Category1_2: TComboBox;
    Btn_Save1: TButton;
    Lbl_Time1: TLabel;
    Timer1: TTimer;
    Panel2: TPanel;
    Lbl_ID2: TLabel;
    Lbl_Key2: TLabel;
    Lbl_Time2: TLabel;
    Btn_Stop2: TButton;
    Btn_Start2: TButton;
    Edt_Key2: TEdit;
    Cbx_Category2_1: TComboBox;
    Cbx_Category2_2: TComboBox;
    Btn_Save2: TButton;
    Panel3: TPanel;
    Lbl_ID3: TLabel;
    Lbl_Key3: TLabel;
    Lbl_Time3: TLabel;
    Btn_Stop3: TButton;
    Btn_Start3: TButton;
    Edt_Key3: TEdit;
    Cbx_Category3_1: TComboBox;
    Cbx_Category3_2: TComboBox;
    Btn_Save3: TButton;
    Panel4: TPanel;
    Lbl_ID4: TLabel;
    Lbl_Key4: TLabel;
    Lbl_Time4: TLabel;
    Btn_Stop4: TButton;
    Btn_Start4: TButton;
    Edt_Key4: TEdit;
    Cbx_Category4_1: TComboBox;
    Cbx_Category4_2: TComboBox;
    Btn_Save4: TButton;
    Timer2: TTimer;
    Timer3: TTimer;
    Timer4: TTimer;
    RdB_Active: TRadioButton;
    RdB_DeActive: TRadioButton;
    Lbl_RemTime1: TLabel;
    Lbl_RemTime2: TLabel;
    Lbl_RemTime3: TLabel;
    Lbl_RemTime4: TLabel;
    Timer1_1: TTimer;
    Timer2_1: TTimer;
    Timer3_1: TTimer;
    Timer4_1: TTimer;
    Edt_Num1: TEdit;
    Edt_Num2: TEdit;
    Edt_Num3: TEdit;
    Edt_Num4: TEdit;

      procedure Btn_StartClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      function CharToKeycode(Key: String): Integer;
    procedure HideTitlebar(Form:TForm);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Btn_LockClick(Sender: TObject);
    procedure edt_LockKeyPress(Sender: TObject; var Key: Char);
    function UserCheck: Boolean;
    procedure Btn_WinTilte_Setting(Sender: TObject);
    function ScreenCapture(Num:Integer; _Handle:THandle): Boolean;
    procedure Cbx_CategoryChange(Sender: TObject);
    procedure Btn_FormControlClick(Sender: TObject);
    procedure Btn_StopClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure LoadConfig;
    procedure Btn_SaveClick(Sender: TObject);
    procedure Timer1_1Timer(Sender: TObject);
    procedure Timer2_1Timer(Sender: TObject);
    procedure Timer3_1Timer(Sender: TObject);
    procedure Timer4_1Timer(Sender: TObject);

    public
       MakeThread1 : TMakeThread1;
       MakeThread2 : TMakeThread2;
       MakeThread3 : TMakeThread3;
       MakeThread4 : TMakeThread4;
   end;

var
   Handle_1: THandle;
   Form1: TForm1;
   wHandle_1 : THandle;
   wHandle_2 : THandle;
   wHandle_3 : THandle;
   wHandle_4 : THandle;

   tID1, tID2, tID3, tID4 : TBitmap;
   MakingCheck1, MakingCheck2, MakingCheck3, MakingCheck4 : Boolean;  //시약제조 중인지
   NumKey1, NumKey2, NumKey3, NumKey4 : Integer;   //열쇠 알파벳 > 키코드
   MakeStatus : Boolean;   //현재 시약제조상태 (통합)
   RemainTime1, RemainTime2, RemainTime3, RemainTime4 : Integer;

procedure delay(Time: Integer);

implementation

{$R *.dfm}

procedure delay(Time: Integer);
var
  PastCount: LongInt;
begin
  PastCount := GetTickCount;
  repeat
    Application.ProcessMessages;
  until ((GetTickCount-PastCount) >= LongInt(Time));
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
   LockKey := ((StrToInt(Key_a)*922)*7);
   LockKey := StrToInt(Copy(IntToStr(LockKey),1,6));

   if IntToStr(LockKey) = edt_Lock.Text then
   begin
      try
         Reg_2 := TRegistry.Create;
         Reg_2.RootKey := HKEY_CURRENT_USER;
         Reg_2.OpenKey('\Software\MicroSoft\Windows Network', True);
         Reg_2.WriteString('Release Lock_7',DateToStr(now));
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

procedure TForm1.Btn_FormControlClick(Sender: TObject);
begin
   case (Sender as TButton).Tag of
      0: Application.Minimize;
      1: Close;
   end;
end;

procedure TForm1.Btn_SaveClick(Sender: TObject);
var
 	Ini: TIniFile;
begin
   try
      Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + CONFIGFILE);
      try
         case (Sender as TButton).Tag of
            1: begin
               ini.WriteString('MAKE_1', 'HOUSE_KEY', UpperCase(Edt_Key1.Text));
               ini.WriteString('MAKE_1', 'SIYAK_NUM', UpperCase(Edt_Num1.Text));
               ini.WriteInteger('MAKE_1', 'SELECT_1', Cbx_Category1_1.ItemIndex);;
               ini.WriteInteger('MAKE_1', 'SELECT_2', Cbx_Category1_2.ItemIndex);;
            end;

            2: begin
               ini.WriteString('MAKE_2', 'HOUSE_KEY', UpperCase(Edt_Key2.Text));
               ini.WriteString('MAKE_2', 'SIYAK_NUM', UpperCase(Edt_Num2.Text));
               ini.WriteInteger('MAKE_2', 'SELECT_1', Cbx_Category2_1.ItemIndex);;
               ini.WriteInteger('MAKE_2', 'SELECT_2', Cbx_Category2_2.ItemIndex);;
            end;

            3: begin
               ini.WriteString('MAKE_3', 'HOUSE_KEY', UpperCase(Edt_Key3.Text));
               ini.WriteString('MAKE_3', 'SIYAK_NUM', UpperCase(Edt_Num3.Text));
               ini.WriteInteger('MAKE_3', 'SELECT_1', Cbx_Category3_1.ItemIndex);;
               ini.WriteInteger('MAKE_3', 'SELECT_2', Cbx_Category3_2.ItemIndex);;
            end;

            4: begin
               ini.WriteString('MAKE_4', 'HOUSE_KEY', UpperCase(Edt_Key4.Text));
               ini.WriteString('MAKE_4', 'SIYAK_NUM', UpperCase(Edt_Num4.Text));
               ini.WriteInteger('MAKE_4', 'SELECT_1', Cbx_Category4_1.ItemIndex);;
               ini.WriteInteger('MAKE_4', 'SELECT_2', Cbx_Category4_2.ItemIndex);;
            end;
         end;
      finally
          ini.Free;
          ShowMessage('저장완료!');
      end;
   except

   end;

end;

procedure TForm1.Btn_StartClick(Sender: TObject);
var
   tmp : String;
begin
   case (Sender as TButton).Tag of
      1: begin
            if (wHandle_1 <= 0) then
            begin
               ShowMessage('ID를 등록해주세요');
               Exit;
            end;

            if (Edt_Key1.Text = '') or (Length(Edt_Key1.Text) > 1) then
            begin
               ShowMessage('열쇠를 올바르게 등록해주세요');
               Exit;
            end;

            NumKey1 := CharToKeycode(Edt_Key1.Text);
            if NumKey1 = -1 then
            begin
               ShowMessage('열쇠를 올바르게 등록해주세요');
               Exit;
            end;


            if (Cbx_Category1_1.ItemIndex = 0) then
            begin
               ShowMessage('단계를 선택해주세요');
               Exit;
            end;

            if (Cbx_Category1_2.ItemIndex = 0) then
            begin
               ShowMessage('시약을 선택해주세요');
               Exit;
            end;

            Btn_Reg1.Enabled        := False;
            Btn_Reset1.Enabled      := False;
            Btn_Start1.Enabled      := False;
            Btn_Stop1.Enabled       := True;
            Edt_Key1.Enabled        := False;
            Edt_Num1.Enabled        := False;
            Cbx_Category1_1.Enabled := False;
            Cbx_Category1_2.Enabled := False;

            MakingCheck1 := True;
            MakeThread1.Execute;
         end;

      2: begin
            if (wHandle_2 <= 0) then
            begin
               ShowMessage('ID를 등록해주세요');
               Exit;
            end;

            if (Edt_Key2.Text = '') or (Length(Edt_Key2.Text) > 1) then
            begin
               ShowMessage('열쇠를 올바르게 등록해주세요');
               Exit;
            end;

            NumKey2 := CharToKeycode(Edt_Key2.Text);
            if NumKey2 = -1 then
            begin
               ShowMessage('열쇠를 올바르게 등록해주세요');
               Exit;
            end;

            if (Cbx_Category2_1.ItemIndex = 0) then
            begin
               ShowMessage('단계를 선택해주세요');
               Exit;
            end;

            if (Cbx_Category2_2.ItemIndex = 0) then
            begin
               ShowMessage('시약을 선택해주세요');
               Exit;
            end;

            Btn_Reg2.Enabled        := False;
            Btn_Reset2.Enabled      := False;
            Btn_Start2.Enabled      := False;
            Btn_Stop2.Enabled       := True;
            Edt_Key2.Enabled        := False;
            Edt_Num2.Enabled        := False;
            Cbx_Category2_1.Enabled := False;
            Cbx_Category2_2.Enabled := False;

            MakingCheck2 := True;
            MakeThread2.Execute;
         end;

      3: begin
            if (wHandle_3 <= 0) then
            begin
               ShowMessage('ID를 등록해주세요');
               Exit;
            end;

            if (Edt_Key3.Text = '') or (Length(Edt_Key3.Text) > 1) then
            begin
               ShowMessage('열쇠를 올바르게 등록해주세요');
               Exit;
            end;

            NumKey3 := CharToKeycode(Edt_Key3.Text);
            if NumKey3 = -1 then
            begin
               ShowMessage('열쇠를 올바르게 등록해주세요');
               Exit;
            end;

            if (Cbx_Category3_1.ItemIndex = 0) then
            begin
               ShowMessage('단계를 선택해주세요');
               Exit;
            end;

            if (Cbx_Category3_2.ItemIndex = 0) then
            begin
               ShowMessage('시약을 선택해주세요');
               Exit;
            end;

            Btn_Reg3.Enabled        := False;
            Btn_Reset3.Enabled      := False;
            Btn_Start3.Enabled      := False;
            Btn_Stop3.Enabled       := True;
            Edt_Key3.Enabled        := False;
            Edt_Num3.Enabled        := False;
            Cbx_Category3_1.Enabled := False;
            Cbx_Category3_2.Enabled := False;

            MakingCheck3 := True;
            MakeThread3.Execute;
         end;

      4: begin
            if (wHandle_4 <= 0) then
            begin
               ShowMessage('ID를 등록해주세요');
               Exit;
            end;

            if (Edt_Key4.Text = '') or (Length(Edt_Key4.Text) > 1) then
            begin
               ShowMessage('열쇠를 올바르게 등록해주세요');
               Exit;
            end;

            NumKey4 := CharToKeycode(Edt_Key4.Text);
            if NumKey4 = -1 then
            begin
               ShowMessage('열쇠를 올바르게 등록해주세요');
               Exit;
            end;

            if (Cbx_Category4_1.ItemIndex = 0) then
            begin
               ShowMessage('단계를 선택해주세요');
               Exit;
            end;

            if (Cbx_Category4_2.ItemIndex = 0) then
            begin
               ShowMessage('시약을 선택해주세요');
               Exit;
            end;

            Btn_Reg4.Enabled        := False;
            Btn_Reset4.Enabled      := False;
            Btn_Start4.Enabled      := False;
            Btn_Stop4.Enabled       := True;
            Edt_Key4.Enabled        := False;
            Edt_Num4.Enabled        := False;
            Cbx_Category4_1.Enabled := False;
            Cbx_Category4_2.Enabled := False;

            MakingCheck4 := True;
            MakeThread4.Execute;
         end;
   end;
end;

procedure TForm1.Btn_StopClick(Sender: TObject);
begin
   //todo 중지시 쓰레드 처리 관련 메모리 누수 체크 필요
   case (Sender as TButton).Tag of
      1: begin
            MakeThread1.Suspend;
            Btn_Reg1.Enabled        := True;
            Btn_Reset1.Enabled      := True;
            Btn_Start1.Enabled      := True;
            Btn_Stop1.Enabled       := False;
            Edt_Key1.Enabled        := True;
            Edt_Num1.Enabled        := True;
            Cbx_Category1_1.Enabled := True;
            Cbx_Category1_2.Enabled := True;
            Timer1.Enabled          := False;
            Timer1_1.Enabled        := False;
            Lbl_RemTime1.Caption    := ' ㅡ 초';
         end;
      2: begin
            MakeThread2.Suspend;
            Btn_Reg2.Enabled        := True;
            Btn_Reset2.Enabled      := True;
            Btn_Start2.Enabled      := True;
            Btn_Stop2.Enabled       := False;
            Edt_Key2.Enabled        := True;
            Edt_Num2.Enabled        := True;
            Cbx_Category2_1.Enabled := True;
            Cbx_Category2_2.Enabled := True;
            Timer2.Enabled          := False;
            Timer2_1.Enabled        := False;
            Lbl_RemTime2.Caption    := ' ㅡ 초';
         end;
      3: begin
            MakeThread3.Suspend;
            Btn_Reg3.Enabled        := True;
            Btn_Reset3.Enabled      := True;
            Btn_Start3.Enabled      := True;
            Btn_Stop3.Enabled       := False;
            Edt_Key3.Enabled        := True;
            Edt_Num3.Enabled        := True;
            Cbx_Category3_1.Enabled := True;
            Cbx_Category3_2.Enabled := True;
            Timer3.Enabled          := False;
            Timer3_1.Enabled        := False;
            Lbl_RemTime3.Caption    := ' ㅡ 초';
         end;
      4: begin
            MakeThread4.Suspend;
            Btn_Reg4.Enabled        := True;
            Btn_Reset4.Enabled      := True;
            Btn_Start4.Enabled      := True;
            Btn_Stop4.Enabled       := False;
            Edt_Key4.Enabled        := True;
            Edt_Num4.Enabled        := True;
            Cbx_Category4_1.Enabled := True;
            Cbx_Category4_2.Enabled := True;
            Timer4.Enabled          := False;
            Timer4_1.Enabled        := False;
            Lbl_RemTime4.Caption    := ' ㅡ 초';
         end;
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
            if not (tID1 = nil) then
               tID1.Destroy;
            Img_ID1.Picture := nil;
            wHandle_1 := 0;
         end;
         10: begin
            if not (tID2 = nil) then
               tID2.Destroy;
            Img_ID2.Picture := nil;
            wHandle_2 := 0;
         end;
         11: begin
            if not (tID3 = nil) then
               tID3.Destroy;
            Img_ID3.Picture := nil;
            wHandle_3 := 0;
         end;
         12: begin
            if not (tID4 = nil) then
               tID4.Destroy;
            Img_ID4.Picture := nil;
            wHandle_4 := 0;
         end;
      end;
   except
   end;
end;



procedure TForm1.Cbx_CategoryChange(Sender: TObject);
begin
   case (Sender as TCombobox).Tag of
      1: begin
         Cbx_Category1_2.Items.Clear;
         case Cbx_Category1_1.ItemIndex of
            0: begin
               Cbx_Category1_2.Items.Add('시약선택');
            end;
            1: begin
               Cbx_Category1_2.Items.Add('시약선택');
               Cbx_Category1_2.Items.Add('체력(하)');
               Cbx_Category1_2.Items.Add('마력(하)');
               Cbx_Category1_2.Items.Add('공증(하)');
            end;
            2: begin
               Cbx_Category1_2.Items.Add('시약선택');
               Cbx_Category1_2.Items.Add('체력(중)');
               Cbx_Category1_2.Items.Add('마력(중)');
               Cbx_Category1_2.Items.Add('마증(하)');
               Cbx_Category1_2.Items.Add('피흡(하)');
               Cbx_Category1_2.Items.Add('시향(하)');
               Cbx_Category1_2.Items.Add('공증(중)');
            end;
            3: begin
               Cbx_Category1_2.Items.Add('시약선택');
               Cbx_Category1_2.Items.Add('체력(상)');
               Cbx_Category1_2.Items.Add('마력(상)');
               Cbx_Category1_2.Items.Add('방관(하)');
               Cbx_Category1_2.Items.Add('방무(하)');
               Cbx_Category1_2.Items.Add('마증(중)');
               Cbx_Category1_2.Items.Add('공증(상)');
               Cbx_Category1_2.Items.Add('피흡(중)');
               Cbx_Category1_2.Items.Add('시향(중)');
            end;
            4: begin
               Cbx_Category1_2.Items.Add('시약선택');
               Cbx_Category1_2.Items.Add('마증(상)');
               Cbx_Category1_2.Items.Add('피흡(상)');
               Cbx_Category1_2.Items.Add('시향(상)');
               Cbx_Category1_2.Items.Add('방관(중)');
               Cbx_Category1_2.Items.Add('방무(중)');
            end;
            5: begin
               Cbx_Category1_2.Items.Add('시약선택');
               Cbx_Category1_2.Items.Add('방관(상)');
               Cbx_Category1_2.Items.Add('방무(상)');
            end;
         end;
         Cbx_Category1_2.ItemIndex := 0;
      end;

      2: begin
         Cbx_Category2_2.Items.Clear;
         case Cbx_Category2_1.ItemIndex of
            0: begin
               Cbx_Category2_2.Items.Add('시약선택');
            end;
            1: begin
               Cbx_Category2_2.Items.Add('시약선택');
               Cbx_Category2_2.Items.Add('체력(하)');
               Cbx_Category2_2.Items.Add('마력(하)');
               Cbx_Category2_2.Items.Add('공증(하)');
            end;
            2: begin
               Cbx_Category2_2.Items.Add('시약선택');
               Cbx_Category2_2.Items.Add('체력(중)');
               Cbx_Category2_2.Items.Add('마력(중)');
               Cbx_Category2_2.Items.Add('마증(하)');
               Cbx_Category2_2.Items.Add('피흡(하)');
               Cbx_Category2_2.Items.Add('시향(하)');
               Cbx_Category2_2.Items.Add('공증(중)');
            end;
            3: begin
               Cbx_Category2_2.Items.Add('시약선택');
               Cbx_Category2_2.Items.Add('체력(상)');
               Cbx_Category2_2.Items.Add('마력(상)');
               Cbx_Category2_2.Items.Add('방관(하)');
               Cbx_Category2_2.Items.Add('방무(하)');
               Cbx_Category2_2.Items.Add('마증(중)');
               Cbx_Category2_2.Items.Add('공증(상)');
               Cbx_Category2_2.Items.Add('피흡(중)');
               Cbx_Category2_2.Items.Add('시향(중)');
            end;
            4: begin
               Cbx_Category2_2.Items.Add('시약선택');
               Cbx_Category2_2.Items.Add('마증(상)');
               Cbx_Category2_2.Items.Add('피흡(상)');
               Cbx_Category2_2.Items.Add('시향(상)');
               Cbx_Category2_2.Items.Add('방관(중)');
               Cbx_Category2_2.Items.Add('방무(중)');
            end;
            5: begin
               Cbx_Category2_2.Items.Add('시약선택');
               Cbx_Category2_2.Items.Add('방관(상)');
               Cbx_Category2_2.Items.Add('방무(상)');
            end;
         end;
         Cbx_Category2_2.ItemIndex := 0;
      end;

      3: begin
         Cbx_Category3_2.Items.Clear;
         case Cbx_Category3_1.ItemIndex of
            0: begin
               Cbx_Category3_2.Items.Add('시약선택');
            end;
            1: begin
               Cbx_Category3_2.Items.Add('시약선택');
               Cbx_Category3_2.Items.Add('체력(하)');
               Cbx_Category3_2.Items.Add('마력(하)');
               Cbx_Category3_2.Items.Add('공증(하)');
            end;
            2: begin
               Cbx_Category3_2.Items.Add('시약선택');
               Cbx_Category3_2.Items.Add('체력(중)');
               Cbx_Category3_2.Items.Add('마력(중)');
               Cbx_Category3_2.Items.Add('마증(하)');
               Cbx_Category3_2.Items.Add('피흡(하)');
               Cbx_Category3_2.Items.Add('시향(하)');
               Cbx_Category3_2.Items.Add('공증(중)');
            end;
            3: begin
               Cbx_Category3_2.Items.Add('시약선택');
               Cbx_Category3_2.Items.Add('체력(상)');
               Cbx_Category3_2.Items.Add('마력(상)');
               Cbx_Category3_2.Items.Add('방관(하)');
               Cbx_Category3_2.Items.Add('방무(하)');
               Cbx_Category3_2.Items.Add('마증(중)');
               Cbx_Category3_2.Items.Add('공증(상)');
               Cbx_Category3_2.Items.Add('피흡(중)');
               Cbx_Category3_2.Items.Add('시향(중)');
            end;
            4: begin
               Cbx_Category3_2.Items.Add('시약선택');
               Cbx_Category3_2.Items.Add('마증(상)');
               Cbx_Category3_2.Items.Add('피흡(상)');
               Cbx_Category3_2.Items.Add('시향(상)');
               Cbx_Category3_2.Items.Add('방관(중)');
               Cbx_Category3_2.Items.Add('방무(중)');
            end;
            5: begin
               Cbx_Category3_2.Items.Add('시약선택');
               Cbx_Category3_2.Items.Add('방관(상)');
               Cbx_Category3_2.Items.Add('방무(상)');
            end;
         end;
         Cbx_Category3_2.ItemIndex := 0;
      end;

      4: begin
         Cbx_Category4_2.Items.Clear;
         case Cbx_Category4_1.ItemIndex of
            0: begin
               Cbx_Category4_2.Items.Add('시약선택');
            end;
            1: begin
               Cbx_Category4_2.Items.Add('시약선택');
               Cbx_Category4_2.Items.Add('체력(하)');
               Cbx_Category4_2.Items.Add('마력(하)');
               Cbx_Category4_2.Items.Add('공증(하)');
            end;
            2: begin
               Cbx_Category4_2.Items.Add('시약선택');
               Cbx_Category4_2.Items.Add('체력(중)');
               Cbx_Category4_2.Items.Add('마력(중)');
               Cbx_Category4_2.Items.Add('마증(하)');
               Cbx_Category4_2.Items.Add('피흡(하)');
               Cbx_Category4_2.Items.Add('시향(하)');
               Cbx_Category4_2.Items.Add('공증(중)');
            end;
            3: begin
               Cbx_Category4_2.Items.Add('시약선택');
               Cbx_Category4_2.Items.Add('체력(상)');
               Cbx_Category4_2.Items.Add('마력(상)');
               Cbx_Category4_2.Items.Add('방관(하)');
               Cbx_Category4_2.Items.Add('방무(하)');
               Cbx_Category4_2.Items.Add('마증(중)');
               Cbx_Category4_2.Items.Add('공증(상)');
               Cbx_Category4_2.Items.Add('피흡(중)');
               Cbx_Category4_2.Items.Add('시향(중)');
            end;
            4: begin
               Cbx_Category4_2.Items.Add('시약선택');
               Cbx_Category4_2.Items.Add('마증(상)');
               Cbx_Category4_2.Items.Add('피흡(상)');
               Cbx_Category4_2.Items.Add('시향(상)');
               Cbx_Category4_2.Items.Add('방관(중)');
               Cbx_Category4_2.Items.Add('방무(중)');
            end;
            5: begin
               Cbx_Category4_2.Items.Add('시약선택');
               Cbx_Category4_2.Items.Add('방관(상)');
               Cbx_Category4_2.Items.Add('방무(상)');
            end;
         end;
         Cbx_Category4_2.ItemIndex := 0;
      end;


   end;
end;

procedure TForm1.edt_LockKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      Btn_LockClick(Btn_Lock);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
   Ini : TiniFile;
begin
   try
      Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + CONFIGFILE);
      Ini.WriteString('MAIN', 'ACT_KIND', StringReplace(BoolToStr(RdB_Active.Checked),'-','',[rfReplaceAll]));
   finally
      ini.Free;
   end;
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
   begin
      LoadConfig;

      //todo 활성/비활성 모드에 따른 쓰레드처리 추가 구현
      //(활성시 전체 통제 및 바람윈도우 폼 조작 구현 필요)

      MakingCheck1 := False;
      MakingCheck2 := False;
      MakingCheck3 := False;
      MakingCheck4 := False;

      //쓰레드 생성
      MakeThread1 := TMakeThread1.Create;
      MakeThread2 := TMakeThread2.Create;
      MakeThread3 := TMakeThread3.Create;
      MakeThread4 := TMakeThread4.Create;
   end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
   if MakeThread1.Suspended then
      MakeThread1.Resume;
   MakeThread1.Terminate;
   MakeThread1.WaitFor;
   MakeThread1.Free;
   if MakeThread2.Suspended then
      MakeThread2.Resume;
   MakeThread2.Terminate;
   MakeThread2.WaitFor;
   MakeThread2.Free;
   if MakeThread3.Suspended then
      MakeThread3.Resume;
   MakeThread3.Terminate;
   MakeThread3.WaitFor;
   MakeThread3.Free;
   if MakeThread4.Suspended then
      MakeThread4.Resume;
   MakeThread4.Terminate;
   MakeThread4.WaitFor;
   MakeThread4.Free;
end;

//폼 이동 처리
procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
   ReleaseCapture();
   SendMessage(Handle,WM_SYSCOMMAND,$F012,0 );
end;

function TForm1.CharToKeycode(Key : String): Integer;
   function CaseOfString(s: string; a: array of string): Integer;
   begin
     Result := 0;
     while (Result < Length(a)) and (a[Result] <> s) do
       Inc(Result);
     if a[Result] <> s then
       Result := -1;
   end;
begin
   case CaseOfString(UpperCase(key), ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']) of
         0: result := 65; //A
         1: result := 66;
         2: result := 67;
         3: result := 68; //D
         4: result := 69;
         5: result := 70;
         6: result := 71; //G
         7: result := 72;
         8: result := 73;
         9: result := 74; //J
         10: result := 75;
         11: result := 76;
         12: result := 77; //M
         13: result := 78;
         14: result := 79;
         15: result := 80; //P
         16: result := 81;
         17: result := 82;
         18: result := 83; //S
         19: result := 84;
         20: result := 85;
         21: result := 86; //V
         22: result := 87;
         23: result := 88;
         24: result := 89; //Y
         25: result := 90;
      else
         result := -1;
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

procedure TForm1.LoadConfig;
var
 	Ini: TIniFile;
begin
   try
      Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + CONFIGFILE);
      try
         RdB_Active.Checked :=  StrToBoolDef(Ini.ReadString('MAIN', 'ACT_KIND', '0'), False);

         Edt_Key1.Text := Ini.ReadString('MAKE_1', 'HOUSE_KEY', '');
         Edt_Key2.Text := Ini.ReadString('MAKE_2', 'HOUSE_KEY', '');
         Edt_Key3.Text := Ini.ReadString('MAKE_3', 'HOUSE_KEY', '');
         Edt_Key4.Text := Ini.ReadString('MAKE_4', 'HOUSE_KEY', '');

         Edt_Num1.Text := Ini.ReadString('MAKE_1', 'SIYAK_NUM', '');
         Edt_Num2.Text := Ini.ReadString('MAKE_2', 'SIYAK_NUM', '');
         Edt_Num3.Text := Ini.ReadString('MAKE_3', 'SIYAK_NUM', '');
         Edt_Num4.Text := Ini.ReadString('MAKE_4', 'SIYAK_NUM', '');

         Cbx_Category1_1.ItemIndex := Ini.ReadInteger('MAKE_1', 'SELECT_1', 0);
         if (Cbx_Category1_1.ItemIndex > 5) then
            Cbx_Category1_1.ItemIndex := 0;
         Cbx_Category2_1.ItemIndex := Ini.ReadInteger('MAKE_2', 'SELECT_1', 0);
         if (Cbx_Category2_1.ItemIndex > 5) then
            Cbx_Category2_1.ItemIndex := 0;
         Cbx_Category3_1.ItemIndex := Ini.ReadInteger('MAKE_3', 'SELECT_1', 0);
         if (Cbx_Category3_1.ItemIndex > 5) then
            Cbx_Category3_1.ItemIndex := 0;
         Cbx_Category4_1.ItemIndex := Ini.ReadInteger('MAKE_4', 'SELECT_1', 0);
         if (Cbx_Category4_1.ItemIndex > 5) then
            Cbx_Category4_1.ItemIndex := 0;

         Cbx_CategoryChange(Cbx_Category1_1);
         Cbx_CategoryChange(Cbx_Category2_1);
         Cbx_CategoryChange(Cbx_Category3_1);
         Cbx_CategoryChange(Cbx_Category4_1);

         Cbx_Category1_2.ItemIndex := Ini.ReadInteger('MAKE_1', 'SELECT_2', 0);
         Cbx_Category2_2.ItemIndex := Ini.ReadInteger('MAKE_2', 'SELECT_2', 0);
         Cbx_Category3_2.ItemIndex := Ini.ReadInteger('MAKE_3', 'SELECT_2', 0);
         Cbx_Category4_2.ItemIndex := Ini.ReadInteger('MAKE_4', 'SELECT_2', 0);
      finally
         Ini.Free;
      end;
   except
      //
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
      if not Reg_1.ValueExists('Release Lock_7') then
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
//      case winplace.showCmd of
//         SW_HIDE, SW_SHOWMINIMIZED:
//            begin
//               Btn_StartEndClick(Btn_End1);
//               MessageDlg('최소화하지마라ㅡㅡ', mtWarning, [mbOK], 0);
//               Result := False;
//               Exit;
//            end;
//      end;
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

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   Timer1.Enabled    := False;
//   Timer1_1.Enabled  := False;
   MakingCheck1      := False;
   MakeThread1.Execute;
end;

procedure TForm1.Timer1_1Timer(Sender: TObject);
begin
   RemainTime1 := RemainTime1 - 1;

   if RemainTime1 > -1 then
      Lbl_RemTime1.Caption := IntToStr(RemainTime1) + '초'
   else
   begin
      Lbl_RemTime1.Caption := '제작완료!!';
      Timer1_1.Enabled  := False;
   end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
   Timer2.Enabled    := False;
   Timer2_1.Enabled  := False;
   MakingCheck2      := False;
   MakeThread2.Execute;
end;

procedure TForm1.Timer2_1Timer(Sender: TObject);
begin
   RemainTime2 := RemainTime2 - 1;

   if RemainTime2 > -1 then
      Lbl_RemTime2.Caption := IntToStr(RemainTime2) + '초'
   else
      Lbl_RemTime2.Caption := '제작완료!!';
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
   Timer3.Enabled    := False;
   Timer3_1.Enabled  := False;
   MakingCheck3      := False;
   MakeThread3.Execute;
end;

procedure TForm1.Timer3_1Timer(Sender: TObject);
begin
   RemainTime3 := RemainTime3 - 1;

   if RemainTime3 > -1 then
      Lbl_RemTime3.Caption := IntToStr(RemainTime3) + '초'
   else
      Lbl_RemTime3.Caption := '제작완료!!';
end;

procedure TForm1.Timer4Timer(Sender: TObject);
begin
   Timer4.Enabled    := False;
   Timer4_1.Enabled  := False;
   MakingCheck4      := False;
   MakeThread4.Execute;
end;

procedure TForm1.Timer4_1Timer(Sender: TObject);
begin
   RemainTime4 := RemainTime4 - 1;

   if RemainTime4 > -1 then
      Lbl_RemTime4.Caption := IntToStr(RemainTime4) + '초'
   else
      Lbl_RemTime4.Caption := '제작완료!!';
end;

{ TMakeThread1 }

constructor TMakeThread1.Create;
begin
   FreeOnTerminate := False;
  inherited Create( true );
end;

destructor TMakeThread1.Destroy;
begin

  inherited;
end;

procedure TMakeThread1.Execute;
var
   I : Integer;
begin
   inherited;
   if MakingCheck1 then
   begin     //제작
      PostMessage(wHandle_1, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_1, WM_KEYDOWN, VK_ESCAPE, 0);
      Sleep(200);
      PostMessage(wHandle_1, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_1, WM_KEYDOWN, 85, 0); //u
      Delay(1000);
      PostMessage(wHandle_1, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_1, WM_KEYDOWN, NumKey1, 0);  //열쇠
      Delay(1000);

      for I := 0 to StrToInt(Form1.Edt_Num1.Text) - 2 do
      begin
         PostMessage(wHandle_1, WM_ACTIVATE, 1, 0);
         PostMessage(wHandle_1, WM_KEYDOWN, VK_DOWN, 0);
         Delay(300);
      end;

      PostMessage(wHandle_1, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_1, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);
      PostMessage(wHandle_1, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_1, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);

      //단계선택
      for I := 0 to Form1.Cbx_Category1_1.ItemIndex - 2 do
      begin
         PostMessage(wHandle_1, WM_ACTIVATE, 1, 0);
         PostMessage(wHandle_1, WM_KEYDOWN, VK_DOWN, 0);
         Delay(300);
      end;
      PostMessage(wHandle_1, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_1, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);

      //시약선택
      for I := 0 to Form1.Cbx_Category1_2.ItemIndex - 2 do
      begin
         PostMessage(wHandle_1, WM_ACTIVATE, 1, 0);
         PostMessage(wHandle_1, WM_KEYDOWN, VK_DOWN, 0);
         Delay(300);
      end;

      PostMessage(wHandle_1, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_1, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);
      PostMessage(wHandle_1, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_1, WM_KEYDOWN, VK_ESCAPE, 0);

      if Form1.Cbx_Category1_1.ItemIndex = 5 then
         Form1.Timer1.Interval := (5 * (Form1.Cbx_Category1_1.ItemIndex + 1) * 60 * 1000) + 1000
      else
         Form1.Timer1.Interval := (5 * Form1.Cbx_Category1_1.ItemIndex * 60 * 1000) + 1000;

      RemainTime1 := Form1.Timer1.Interval div 1000;
      if Form1.Btn_Stop1.Enabled then
         Form1.Timer1_1.Enabled := True;
      Form1.Timer1.Enabled := True;
   end else
   begin     //회수
      PostMessage(wHandle_1, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_1, WM_KEYDOWN, VK_ESCAPE, 0);
      Delay(200);
      PostMessage(wHandle_1, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_1, WM_KEYDOWN, 85, 0); //u
      Delay(1000);
      PostMessage(wHandle_1, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_1, WM_KEYDOWN, NumKey1, 0); //열쇠
      Delay(1000);

      for I := 0 to StrToInt(Form1.Edt_Num1.Text) - 2 do
      begin
         PostMessage(wHandle_1, WM_ACTIVATE, 1, 0);
         PostMessage(wHandle_1, WM_KEYDOWN, VK_DOWN, 0);
         Delay(300);
      end;

      PostMessage(wHandle_1, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_1, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);
      PostMessage(wHandle_1, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_1, WM_KEYDOWN, VK_DOWN, 0);
      Delay(500);
      PostMessage(wHandle_1, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_1, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);
      PostMessage(wHandle_1, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_1, WM_KEYDOWN, VK_DOWN, 0);
      Delay(500);
      PostMessage(wHandle_1, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_1, WM_KEYDOWN, VK_RETURN, 0);
      Delay(500);
      MakingCheck1 := True;
      Execute;
   end;
end;

{ TMakeThread2 }

constructor TMakeThread2.Create;
begin
   FreeOnTerminate := False;
  inherited Create( true );
end;

destructor TMakeThread2.Destroy;
begin

  inherited;
end;

procedure TMakeThread2.Execute;
var
   I : Integer;
begin
   inherited;
   if MakingCheck2 then
   begin
      PostMessage(wHandle_2, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_2, WM_KEYDOWN, VK_ESCAPE, 0);
      Delay(200);
      PostMessage(wHandle_2, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_2, WM_KEYDOWN, 85, 0); //u
      Delay(500);
      PostMessage(wHandle_2, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_2, WM_KEYDOWN, NumKey2, 0); //열쇠
      Delay(1000);

      for I := 0 to StrToInt(Form1.Edt_Num2.Text) - 2 do
      begin
         PostMessage(wHandle_2, WM_ACTIVATE, 1, 0);
         PostMessage(wHandle_2, WM_KEYDOWN, VK_DOWN, 0);
         Delay(300);
      end;

      PostMessage(wHandle_2, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_2, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);
      PostMessage(wHandle_2, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_2, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);

      //단계선택
      for I := 0 to Form1.Cbx_Category2_1.ItemIndex - 2 do
      begin
         PostMessage(wHandle_2, WM_ACTIVATE, 1, 0);
         PostMessage(wHandle_2, WM_KEYDOWN, VK_DOWN, 0);
         Delay(500);
      end;
      PostMessage(wHandle_2, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_2, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);

      //시약선택
      for I := 0 to Form1.Cbx_Category2_2.ItemIndex - 2 do
      begin
         PostMessage(wHandle_2, WM_ACTIVATE, 1, 0);
         PostMessage(wHandle_2, WM_KEYDOWN, VK_DOWN, 0);
         Delay(500);
      end;

      PostMessage(wHandle_2, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_2, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);
      PostMessage(wHandle_2, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_2, WM_KEYDOWN, VK_ESCAPE, 0);

      if Form1.Cbx_Category2_1.ItemIndex = 5 then
         Form1.Timer2.Interval := (5 * (Form1.Cbx_Category2_1.ItemIndex + 1) * 60 * 1000) + 1000
      else
         Form1.Timer2.Interval := (5 * Form1.Cbx_Category2_1.ItemIndex * 60 * 1000) + 1000;


      RemainTime2 := Form1.Timer2.Interval div 1000;
      if Form1.Btn_Stop2.Enabled then
         Form1.Timer2_1.Enabled := True;
      Form1.Timer2.Enabled := True;
   end else
   begin
      PostMessage(wHandle_2, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_2, WM_KEYDOWN, VK_ESCAPE, 0);
      Delay(200);
      PostMessage(wHandle_2, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_2, WM_KEYDOWN, 85, 0); //u
      Delay(500);
      PostMessage(wHandle_2, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_2, WM_KEYDOWN, NumKey2, 0); //열쇠
      Delay(1000);

      for I := 0 to StrToInt(Form1.Edt_Num2.Text) - 2 do
      begin
         PostMessage(wHandle_2, WM_ACTIVATE, 1, 0);
         PostMessage(wHandle_2, WM_KEYDOWN, VK_DOWN, 0);
         Delay(300);
      end;

      PostMessage(wHandle_2, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_2, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);
      PostMessage(wHandle_2, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_2, WM_KEYDOWN, VK_DOWN, 0);
      Delay(500);
      PostMessage(wHandle_2, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_2, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);
      PostMessage(wHandle_2, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_2, WM_KEYDOWN, VK_DOWN, 0);
      Delay(500);
      PostMessage(wHandle_2, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_2, WM_KEYDOWN, VK_RETURN, 0);
      Delay(500);
      MakingCheck2 := True;
      Execute;
   end;
end;

{ TMakeThread3 }

constructor TMakeThread3.Create;
begin
   FreeOnTerminate := False;
  inherited Create( true );
end;

destructor TMakeThread3.Destroy;
begin

  inherited;
end;

procedure TMakeThread3.Execute;
var
   I : Integer;
begin
  inherited;
   if MakingCheck3 then
   begin
      PostMessage(wHandle_3, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_3, WM_KEYDOWN, VK_ESCAPE, 0);
      Delay(200);
      PostMessage(wHandle_3, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_3, WM_KEYDOWN, 85, 0); //u
      Delay(500);
      PostMessage(wHandle_3, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_3, WM_KEYDOWN, NumKey3, 0); //열쇠
      Delay(1000);

      for I := 0 to StrToInt(Form1.Edt_Num3.Text) - 2 do
      begin
         PostMessage(wHandle_3, WM_ACTIVATE, 1, 0);
         PostMessage(wHandle_3, WM_KEYDOWN, VK_DOWN, 0);
         Delay(300);
      end;

      PostMessage(wHandle_3, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_3, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);
      PostMessage(wHandle_3, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_3, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);

      //단계선택
      for I := 0 to Form1.Cbx_Category3_1.ItemIndex - 2 do
      begin
         PostMessage(wHandle_3, WM_ACTIVATE, 1, 0);
         PostMessage(wHandle_3, WM_KEYDOWN, VK_DOWN, 0);
         Delay(500);
      end;
      PostMessage(wHandle_3, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_3, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);

      //시약선택
      for I := 0 to Form1.Cbx_Category3_2.ItemIndex - 2 do
      begin
         PostMessage(wHandle_3, WM_ACTIVATE, 1, 0);
         PostMessage(wHandle_3, WM_KEYDOWN, VK_DOWN, 0);
         Delay(500);
      end;

      PostMessage(wHandle_3, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_3, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);
      PostMessage(wHandle_3, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_3, WM_KEYDOWN, VK_ESCAPE, 0);

      if Form1.Cbx_Category3_1.ItemIndex = 5 then
         Form1.Timer3.Interval := (5 * (Form1.Cbx_Category3_1.ItemIndex + 1) * 60 * 1000) + 1000
      else
         Form1.Timer3.Interval := (5 * Form1.Cbx_Category3_1.ItemIndex * 60 * 1000) + 1000;

      RemainTime3 := Form1.Timer3.Interval div 1000;
      if Form1.Btn_Stop3.Enabled then
         Form1.Timer3_1.Enabled := True;
      Form1.Timer3.Enabled := True;
   end else
   begin
      PostMessage(wHandle_3, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_3, WM_KEYDOWN, VK_ESCAPE, 0);
      Delay(200);
      PostMessage(wHandle_3, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_3, WM_KEYDOWN, 85, 0); //u
      Delay(500);
      PostMessage(wHandle_3, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_3, WM_KEYDOWN, NumKey3, 0); //열쇠
      Delay(1000);

      for I := 0 to StrToInt(Form1.Edt_Num3.Text) - 2 do
      begin
         PostMessage(wHandle_3, WM_ACTIVATE, 1, 0);
         PostMessage(wHandle_3, WM_KEYDOWN, VK_DOWN, 0);
         Delay(300);
      end;

      PostMessage(wHandle_3, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_3, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);
      PostMessage(wHandle_3, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_3, WM_KEYDOWN, VK_DOWN, 0);
      Delay(500);
      PostMessage(wHandle_3, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_3, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);
      PostMessage(wHandle_3, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_3, WM_KEYDOWN, VK_DOWN, 0);
      Delay(500);
      PostMessage(wHandle_3, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_3, WM_KEYDOWN, VK_RETURN, 0);
      Delay(500);
      MakingCheck3 := True;
      Execute;
   end;
end;

{ TMakeThread4 }

constructor TMakeThread4.Create;
begin
   FreeOnTerminate := False;
  inherited Create( true );
end;

destructor TMakeThread4.Destroy;
begin

  inherited;
end;

procedure TMakeThread4.Execute;
var
   I : Integer;
begin
  inherited;
   if MakingCheck4 then
   begin
      PostMessage(wHandle_4, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_4, WM_KEYDOWN, VK_ESCAPE, 0);
      Delay(200);
      PostMessage(wHandle_4, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_4, WM_KEYDOWN, 85, 0); //u
      Delay(500);
      PostMessage(wHandle_4, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_4, WM_KEYDOWN, NumKey4, 0); //열쇠
      Delay(1000);

      for I := 0 to StrToInt(Form1.Edt_Num4.Text) - 2 do
      begin
         PostMessage(wHandle_4, WM_ACTIVATE, 1, 0);
         PostMessage(wHandle_4, WM_KEYDOWN, VK_DOWN, 0);
         Delay(300);
      end;

      PostMessage(wHandle_4, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_4, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);
      PostMessage(wHandle_4, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_4, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);

      //단계선택
      for I := 0 to Form1.Cbx_Category4_1.ItemIndex - 2 do
      begin
         PostMessage(wHandle_4, WM_ACTIVATE, 1, 0);
         PostMessage(wHandle_4, WM_KEYDOWN, VK_DOWN, 0);
         Delay(500);
      end;
      PostMessage(wHandle_4, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_4, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);

      //시약선택
      for I := 0 to Form1.Cbx_Category4_2.ItemIndex - 2 do
      begin
         PostMessage(wHandle_4, WM_ACTIVATE, 1, 0);
         PostMessage(wHandle_4, WM_KEYDOWN, VK_DOWN, 0);
         Delay(500);
      end;

      PostMessage(wHandle_4, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_4, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);
      PostMessage(wHandle_4, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_4, WM_KEYDOWN, VK_ESCAPE, 0);

      if Form1.Cbx_Category4_1.ItemIndex = 5 then
         Form1.Timer4.Interval := (5 * (Form1.Cbx_Category4_1.ItemIndex + 1) * 60 * 1000) + 1000
      else
         Form1.Timer4.Interval := (5 * Form1.Cbx_Category4_1.ItemIndex * 60 * 1000) + 1000;

      RemainTime4 := Form1.Timer4.Interval div 1000;
      if Form1.Btn_Stop4.Enabled then
         Form1.Timer4_1.Enabled := True;
      Form1.Timer4.Enabled := True;
   end else
   begin
      PostMessage(wHandle_4, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_4, WM_KEYDOWN, VK_ESCAPE, 0);
      Delay(200);
      PostMessage(wHandle_4, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_4, WM_KEYDOWN, 85, 0); //u
      Delay(500);
      PostMessage(wHandle_4, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_4, WM_KEYDOWN, NumKey4, 0); //열쇠
      Delay(1000);

      for I := 0 to StrToInt(Form1.Edt_Num4.Text) - 2 do
      begin
         PostMessage(wHandle_4, WM_ACTIVATE, 1, 0);
         PostMessage(wHandle_4, WM_KEYDOWN, VK_DOWN, 0);
         Delay(300);
      end;

      PostMessage(wHandle_4, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_4, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);
      PostMessage(wHandle_4, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_4, WM_KEYDOWN, VK_DOWN, 0);
      Delay(500);
      PostMessage(wHandle_4, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_4, WM_KEYDOWN, VK_RETURN, 0);
      Delay(1000);
      PostMessage(wHandle_4, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_4, WM_KEYDOWN, VK_DOWN, 0);
      Delay(500);
      PostMessage(wHandle_4, WM_ACTIVATE, 1, 0);
      PostMessage(wHandle_4, WM_KEYDOWN, VK_RETURN, 0);
      Delay(500);
      MakingCheck4 := True;
      Execute;
   end;
end;

end.

