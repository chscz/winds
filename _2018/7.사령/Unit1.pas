unit Unit1;

//{$DEFINE _LOG_}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ImgList
  , System.Win.Registry, Contnrs, Vcl.ComCtrls, Dateutils;

const
   map_103 = 103;
   map_102 = 102;
   map_101 = 101;
   map_201 = 201;
   map_301 = 301;
   map_401 = 401;
   map_501 = 501;
   map_502 = 502;
   map_503 = 503;
   map_504 = 504;
   map_505 = 505;

type
  TForm1 = class(TForm)
    Timer12_Map_Move: TTimer;
    ImageList_XY: TImageList;
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
    Timer12_Map_Change: TTimer;
    Btn_WinTilte_Set1: TButton;
    Btn_WinTilte_Ret1: TButton;
    Timer12_Cap: TTimer;
    ImageList_Map: TImageList;
    Pnl_Ctrl: TPanel;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Timer_CtrlR: TTimer;
    Btn_WinTilte_Set2: TButton;
    Btn_WinTilte_Ret2: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Timer45_Map_Change: TTimer;
    Timer45_Cap: TTimer;
    Timer45_Map_Move: TTimer;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure HideTitlebar(Form:TForm);
    function UserCheck: Boolean;
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Btn_StartEndClick(Sender: TObject);

    function ScreenCapture12:Boolean;
    function ScreenCapture45:Boolean;
    function TransColor_0(TransBmp:TBitmap):Tbitmap;
    function TransColor_1(TransBmp:TBitmap):Tbitmap;
    function TransColor_test(TransBmp:TBitmap):Tbitmap;
    procedure Timer12_Map_MoveTimer(Sender: TObject);
    function SearchBitmap_XY(bmMain,bmSub: TBitMap): Boolean;
    function SearchBitmap_map(bmMain,bmSub: TBitMap): Boolean;
    function Check_Num(bmMain: TBitMap): Integer;
    function Check_Map(bmMain: TBitMap): Integer;
    procedure Btn_LockClick(Sender: TObject);
    procedure Timer12_Map_ChangeTimer(Sender: TObject);
    procedure edt_LockKeyPress(Sender: TObject; var Key: Char);
    procedure Btn_WinTilte_Setting(Sender: TObject);
    procedure Timer12_CapTimer(Sender: TObject);
    procedure Btn_HelpClick(Sender: TObject);
    procedure Timer_CtrlRTimer(Sender: TObject);
    procedure Timer45_CapTimer(Sender: TObject);
    procedure Timer45_Map_MoveTimer(Sender: TObject);
    procedure Timer45_Map_ChangeTimer(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    //�̹��� ����Ʈ
    bmp_0,bmp_1,bmp_2,bmp_3,bmp_4,bmp_5,bmp_6,bmp_7,bmp_8,bmp_9 : TBitmap;
    X12_100, X12_10, X12_1, Y12_100, Y12_10, Y12_1 : Tbitmap;  //��ǥ
    Pos12_X, Pos12_Y : Integer;         //��ǥ

    X45_100, X45_10, X45_1, Y45_100, Y45_10, Y45_1 : Tbitmap;  //��ǥ
    Pos45_X, Pos45_Y : Integer;         //��ǥ

    Bmp_Map101, Bmp_Map102, Bmp_Map103, Bmp_Map201, Bmp_Map301, bmp_Map401,
    Bmp_Map501, Bmp_Map502, Bmp_Map503, Bmp_Map504, Bmp_Map505 : TBitmap;

    //ĸ�ĺ�
    Bmp_MapMain12 : TBitmap;
    Now_Map12 : Integer;
    Bef_Map12 : Integer;
    Handle_1 : THandle;

    Bmp_MapMain45 : TBitmap;
    Now_Map45 : Integer;
    Bef_Map45 : Integer;
    Handle_2 : THandle;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Btn_LockClick(Sender: TObject);
//���
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
      MessageDlg('Ű ����ġ',mtError,[mbOK],0);
   end;
end;

//�� ��Ʈ�� - Ÿ��Ʋ �����
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

//����üũ
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

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
//�� �̵� ó��
begin
   ReleaseCapture();
   SendMessage(Handle,WM_SYSCOMMAND,$F012,0 );
end;

procedure TForm1.FormCreate(Sender: TObject);
var
   I : Integer;
begin
   try
      HideTitlebar(self);
      if not ((ParamStr(1) = 'DEV') or (ParamStr(2)= 'DEV')) then
      begin
         self.Width  := PnlMain.Width;
         self.Height := PnlMain.Height;
      end;

      Pnl_Ctrl.Left := PnlMain.Width - Pnl_Ctrl.Width - 8;
      Pnl_Ctrl.Top := 0 + 5;
      Pnl_Ctrl.Color := PnlMain.Color;
      Pnl_Ctrl.BringToFront;

      if UserCheck then
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

         //�� Ÿ��Ʋ------
         Bmp_Map101 := TBitmap.Create;
         Bmp_Map102 := TBitmap.Create;
         Bmp_Map103 := TBitmap.Create;
         Bmp_Map201 := TBitmap.Create;
         Bmp_Map301 := TBitmap.Create;
         Bmp_Map401 := TBitmap.Create;
         Bmp_Map501 := TBitmap.Create;
         Bmp_Map502 := TBitmap.Create;
         Bmp_Map503 := TBitmap.Create;
         Bmp_Map504 := TBitmap.Create;
         Bmp_Map505 := TBitmap.Create;

         ImageList_Map.GetBitmap(0,Bmp_Map101);
         ImageList_Map.GetBitmap(1,Bmp_Map102);
         ImageList_Map.GetBitmap(2,Bmp_Map103);
         ImageList_Map.GetBitmap(3,Bmp_Map201);
         ImageList_Map.GetBitmap(4,Bmp_Map301);
         ImageList_Map.GetBitmap(5,Bmp_Map401);
         ImageList_Map.GetBitmap(6,Bmp_Map501);
         ImageList_Map.GetBitmap(7,Bmp_Map502);
         ImageList_Map.GetBitmap(8,Bmp_Map503);
         ImageList_Map.GetBitmap(9,Bmp_Map504);
         ImageList_Map.GetBitmap(10,Bmp_Map505);
         //----------------

{     //�����ҋ� ��
         Bmp_Map101.LoadFromFile('F:\_Source\7.����\Image\map\���\���1_1.bmp');
         Bmp_Map101 := TransColor_0(Bmp_Map101);
//         Image7.Picture := TPicture(Bmp_ElveSub);
         Bmp_Map101.SaveToFile('F:\_Source\7.����\Image\map\���\���1_1_��ȯ.bmp');
}
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

               if CheckBox1.Checked then
               begin
                  Handle_1 := FindWindow(nil, PChar('���12'));
                  if not (Handle_1 > 0) then
                  begin
                     Btn_StartEndClick(Btn_End);
                     MessageDlg('���12 ����',mtError, [mbOK], 0);
                     Exit;
                  end;
                  Timer12_Cap.Enabled         := True;      //ĸ�� Ÿ�̸� 0.25��
                  Timer12_Map_Move.Enabled    := True;      //���� Ÿ�̸�
                  Timer12_Map_Change.Interval := 5000;
               end;

               if CheckBox2.Checked then
               begin
                  Handle_2 := FindWindow(nil, PChar('���45'));
                  if not (Handle_2 > 0) then
                  begin
                     Btn_StartEndClick(Btn_End);
                     MessageDlg('���45 ����',mtError, [mbOK], 0);
                     Exit;
                  end;
                  Timer45_Cap.Enabled         := True;      //ĸ�� Ÿ�̸� 0.25��
                  Timer45_Map_Move.Enabled    := True;      //���� Ÿ�̸�
                  Timer45_Map_Change.Interval := 5000;
               end;

               Btn_Start.Enabled        := False;
               Btn_End.Enabled          := True;
               Btn_WinTilte_Set1.Enabled := False;
               Btn_WinTilte_Ret1.Enabled := False;
               Btn_WinTilte_Set2.Enabled := False;
               Btn_WinTilte_Ret2.Enabled := False;
               CheckBox1.Enabled := False;
               CheckBox2.Enabled := False;

               Timer_CtrlR.Enabled := True;
            end;

         2:
            begin
               Btn_Start.Enabled          := True;
               Btn_End.Enabled            := False;
               Btn_WinTilte_Set1.Enabled  := True;
               Btn_WinTilte_Ret1.Enabled  := True;
               Btn_WinTilte_Set2.Enabled  := True;
               Btn_WinTilte_Ret2.Enabled  := True;
               CheckBox1.Enabled          := True;
               CheckBox2.Enabled          := True;

               Timer12_Cap.Enabled        := False;
               Timer12_Map_Move.Enabled   := False;
               Timer12_Map_Change.Enabled := False;
               Timer45_Cap.Enabled        := False;
               Timer45_Map_Move.Enabled   := False;
               Timer45_Map_Change.Enabled := False;

               Timer_CtrlR.Enabled  := False;

               Handle_1 := 0;
               Handle_2 := 0;
   //            KeybdUnhook;
            end;

         8: Application.Minimize;
         9: Close;
      end;
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Btn_StartEndClick'+'---'); {$ENDIF}
   end;
end;

procedure TForm1.Btn_WinTilte_Setting(Sender: TObject);
//Ÿ��Ʋ ����
var
   wHandle : THandle;
begin
   try
      case (Sender as TButton).Tag of
         6: begin
            wHandle := FindWindow(nil, PChar('�ٶ��ǳ���'));
            if wHandle > 0 then
               SetWindowText(wHandle, '���12');
         end;
         7: begin
            wHandle := FindWindow(nil, PChar('���12'));
            SetWindowText(wHandle, '�ٶ��ǳ���');
         end;
         8: begin
            wHandle := FindWindow(nil, PChar('�ٶ��ǳ���'));
            if wHandle > 0 then
               SetWindowText(wHandle, '���45');
         end;
         9: begin
            wHandle := FindWindow(nil, PChar('���45'));
            SetWindowText(wHandle, '�ٶ��ǳ���');
         end;
      end;
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Btn_WinTilte_Setting'+'---'); {$ENDIF}
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

function TForm1.Check_Map(bmMain: TBitMap): Integer;
begin
   try
      result := 0;
      if SearchBitmap_map(TransColor_0(bmMain), TransColor_0(Bmp_Map501)) then
         result := 501
      else if SearchBitmap_map(TransColor_0(bmMain), TransColor_0(Bmp_Map502)) then
         result := 502
      else if SearchBitmap_map(TransColor_0(bmMain), TransColor_0(Bmp_Map504)) then
         result := 504
      else if SearchBitmap_map(TransColor_0(bmMain), TransColor_0(Bmp_Map505)) then
         result := 505
      else if SearchBitmap_map(TransColor_0(bmMain), TransColor_0(Bmp_Map503)) then
         result := 503
      else if SearchBitmap_map(TransColor_0(bmMain), TransColor_0(Bmp_Map101)) then
         result := 101
      else if SearchBitmap_map(TransColor_0(bmMain), TransColor_0(Bmp_Map102)) then
         result := 102
      else if SearchBitmap_map(TransColor_0(bmMain), TransColor_0(Bmp_Map103)) then
         result := 103
      else if SearchBitmap_map(TransColor_0(bmMain), TransColor_0(Bmp_Map201)) then
         result := 201
      else if SearchBitmap_map(TransColor_0(bmMain), TransColor_0(Bmp_Map301)) then
         result := 301
      else if SearchBitmap_map(TransColor_0(bmMain), TransColor_0(Bmp_Map401)) then
         result := 401;
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Check_Map'+'---'); {$ENDIF}
   end;

{   bmMain.SaveToFile('c:\bmMain.bmp');
   bmp_BMoon_2F.SaveToFile('c:\bmp_BMoon_2F.bmp');
   bmp_BMoon_0F.SaveToFile('c:\bmp_BMoon_0F.bmp');}
//   showmessage('����!');
end;

function TForm1.ScreenCapture12: Boolean;
var
   aDC: HDC;
   aRect, bRect: TRect;
   winplace: TWindowPlacement;
begin
   Result := True;
   try
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
               MessageDlg('�ּ�ȭ��������Ѥ�', mtWarning, [mbOK], 0);
               Result := False;
               Exit;
            end;
      end;
   except
      Result := False;
   end;

   try
      try
         // Bitblt(btm.Canvas.Handle,ĵ��������X, ĵ��������Y, ĸ���̹���width, ĸ���̹���height, aDC, ĸ���̹�������X, ĸ���̹�������Y, SRCCOPY);
         aDC := GetDC(Handle_1); // â ���θ�    // aDC := GetWindowDC(aHandle);   //â �׵θ� ����
         X12_100 := TBitMap.Create;
         X12_10  := TBitMap.Create;
         X12_1   := TBitMap.Create;
         Y12_100 := TBitMap.Create;
         Y12_10  := TBitMap.Create;
         Y12_1   := TBitMap.Create;
         X12_100.Width  := 12;
         X12_100.Height := 14;
         X12_10.Width   := 12;
         X12_10.Height  := 14;
         X12_1.Width    := 12;
         X12_1.Height   := 14;
         Y12_100.Width  := 12;
         Y12_100.Height := 14;
         Y12_10.Width   := 12;
         Y12_10.Height  := 14;
         Y12_1.Width    := 12;
         Y12_1.Height   := 14;
         Bmp_MapMain12 := TBitmap.Create;
         Bmp_MapMain12.Width := 20;
         Bmp_MapMain12.Height := 10;

         //��ǥ
         Bitblt(X12_100.Canvas.Handle, 0, 0, 12, 14, aDC, 914, 737, SRCCOPY);
         Bitblt(X12_10.Canvas.Handle, 0, 0, 12, 14, aDC, 923, 737, SRCCOPY);
         Bitblt(X12_1.Canvas.Handle, 0, 0, 12, 14, aDC, 931, 737, SRCCOPY);
         Bitblt(Y12_100.Canvas.Handle, 0, 0, 12, 14, aDC, 970, 737, SRCCOPY);
         Bitblt(Y12_10.Canvas.Handle, 0, 0, 12, 14, aDC, 980, 737, SRCCOPY);
         Bitblt(Y12_1.Canvas.Handle, 0, 0, 12, 14, aDC, 989, 737, SRCCOPY);
         //�� �̸�
         Bitblt(Bmp_MapMain12.Canvas.Handle, 0, 0, 20, 10, aDC, 430, 5, SRCCOPY);

         TransColor_0(X12_100);
         TransColor_0(X12_10);
         TransColor_0(X12_1);
         TransColor_0(Y12_100);
         TransColor_0(Y12_10);
         TransColor_0(Y12_1);
         TransColor_0(Bmp_MapMain12);

//         Pos_X := (Check_Num(X12_100)*100) + (Check_Num(X_10)*10) + Check_Num(X_1);
//         Pos_Y := (Check_Num(Y_100)*100) + (Check_Num(Y_10)*10) + Check_Num(Y_1);
         Pos12_X := (Check_Num(X12_10)*10) + Check_Num(X12_1); //��ǥüũ
         Pos12_Y := (Check_Num(Y12_10)*10) + Check_Num(Y12_1);

         Label1.Caption := IntToStr(Pos12_X);
         Label2.Caption := IntToStr(Pos12_Y);

         Now_map12 := Check_map(Bmp_MapMain12);  //��üũ

   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] :Check_Map12'+'---'+IntToStr(Now_map12)); {$ENDIF}

         case Now_Map12 of
            map_501,map_502 : begin
                  //todo
            end;

            map_103,map_102,map_101,map_201,map_301,map_401,map_503,map_504,map_505 : begin
               if Timer12_Map_Change.Enabled then
                  Timer12_Map_Change.Enabled := False;
               if not Timer12_Map_Move.Enabled then
                  Timer12_Map_Move.Enabled := True;
            end;
            else begin            // �� ���� ��

            end;
         end;

         X12_100.Destroy;
         X12_10.Destroy;
         X12_1.Destroy;
         Y12_100.Destroy;
         Y12_10.Destroy;
         Y12_1.Destroy;
         Bmp_MapMain12.Destroy;

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

function TForm1.ScreenCapture45: Boolean;
var
   aDC: HDC;
   aRect, bRect: TRect;
   winplace: TWindowPlacement;
begin
   Result := True;
   try
      if not (Handle_2 > 0) then
      begin
         Result := False;
         Exit;
      end;

      FillChar(winplace, sizeof(winplace), 0);
      winplace.length := sizeof(winplace);

      GetWindowPlacement(Handle_2, @winplace);
      case winplace.showCmd of
         SW_HIDE, SW_SHOWMINIMIZED:
            begin
               Btn_StartEndClick(Btn_End);
               MessageDlg('�ּ�ȭ��������Ѥ�', mtWarning, [mbOK], 0);
               Result := False;
               Exit;
            end;
      end;
   except
      Result := False;
   end;

   try
      try
         // Bitblt(btm.Canvas.Handle,ĵ��������X, ĵ��������Y, ĸ���̹���width, ĸ���̹���height, aDC, ĸ���̹�������X, ĸ���̹�������Y, SRCCOPY);
         aDC := GetDC(Handle_2); // â ���θ�    // aDC := GetWindowDC(aHandle);   //â �׵θ� ����
         X45_100 := TBitMap.Create;
         X45_10  := TBitMap.Create;
         X45_1   := TBitMap.Create;
         Y45_100 := TBitMap.Create;
         Y45_10  := TBitMap.Create;
         Y45_1   := TBitMap.Create;
         X45_100.Width  := 12;
         X45_100.Height := 14;
         X45_10.Width   := 12;
         X45_10.Height  := 14;
         X45_1.Width    := 12;
         X45_1.Height   := 14;
         Y45_100.Width  := 12;
         Y45_100.Height := 14;
         Y45_10.Width   := 12;
         Y45_10.Height  := 14;
         Y45_1.Width    := 12;
         Y45_1.Height   := 14;
         Bmp_MapMain45 := TBitmap.Create;
         Bmp_MapMain45.Width := 20;
         Bmp_MapMain45.Height := 10;

         //��ǥ
         Bitblt(X45_100.Canvas.Handle, 0, 0, 12, 14, aDC, 914, 737, SRCCOPY);
         Bitblt(X45_10.Canvas.Handle, 0, 0, 12, 14, aDC, 923, 737, SRCCOPY);
         Bitblt(X45_1.Canvas.Handle, 0, 0, 12, 14, aDC, 931, 737, SRCCOPY);
         Bitblt(Y45_100.Canvas.Handle, 0, 0, 12, 14, aDC, 970, 737, SRCCOPY);
         Bitblt(Y45_10.Canvas.Handle, 0, 0, 12, 14, aDC, 980, 737, SRCCOPY);
         Bitblt(Y45_1.Canvas.Handle, 0, 0, 12, 14, aDC, 989, 737, SRCCOPY);
         //�� �̸�
         Bitblt(Bmp_MapMain45.Canvas.Handle, 0, 0, 20, 10, aDC, 430, 5, SRCCOPY);

         TransColor_0(X45_100);
         TransColor_0(X45_10);
         TransColor_0(X45_1);
         TransColor_0(Y45_100);
         TransColor_0(Y45_10);
         TransColor_0(Y45_1);
         TransColor_0(Bmp_MapMain45);

//         Pos_X := (Check_Num(X12_100)*100) + (Check_Num(X_10)*10) + Check_Num(X_1);
//         Pos_Y := (Check_Num(Y_100)*100) + (Check_Num(Y_10)*10) + Check_Num(Y_1);
         Pos45_X := (Check_Num(X45_10)*10) + Check_Num(X45_1); //��ǥüũ
         Pos45_Y := (Check_Num(Y45_10)*10) + Check_Num(Y45_1);
         Now_map45 := Check_map(Bmp_MapMain45);  //��üũ

         Label3.Caption := IntToStr(Pos45_X);
         Label4.Caption := IntToStr(Pos45_Y);

   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] :Check_Map45'+'---'+IntToStr(Now_map45)); {$ENDIF}

         case Now_Map45 of
            map_504,map_505 : begin

            end;

            map_103,map_102,map_101,map_201,map_301,map_401,map_501,map_502,map_503 : begin
               if Timer45_Map_Change.Enabled then
                  Timer45_Map_Change.Enabled := False;
               if not Timer45_Map_Move.Enabled then
                  Timer45_Map_Move.Enabled := True;
            end;
            else begin            // �� ���� ��

            end;
         end;

         X45_100.Destroy;
         X45_10.Destroy;
         X45_1.Destroy;
         Y45_100.Destroy;
         Y45_10.Destroy;
         Y45_1.Destroy;
         Bmp_MapMain45.Destroy;

      except
         on E : Exception do begin
            Result := False;
         end;
      end;
   finally
      ReleaseDC(Handle_2, aDC);
      // CloseHandle(aHandle);
   end;
end;

procedure TForm1.Btn_HelpClick(Sender: TObject);
begin
   showmessage('���1-3�� ĳ���ְ� ON' +#13#10+
               '(5-1<->5-2) , (5-4<->5-5) 15�ʸ��� �̵�'  +#13#10+
               '- �ٸ�@XX -');
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

procedure TForm1.Timer12_CapTimer(Sender: TObject);
begin
   try
      ScreenCapture12;
//      Label1.Caption := InttoStr(Pos_X);
//      Label2.Caption := InttoStr(Pos_Y);
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Timer_CapTimer'+'---'); {$ENDIF}
   end;
end;

procedure TForm1.Timer_CtrlRTimer(Sender: TObject);
begin
   PostMessage(Handle_1, WM_KEYDOWN, VK_CONTROL, 0);
   PostMessage(Handle_1, WM_KEYDOWN, 82, 0);
   PostMessage(Handle_1, WM_KEYUP, VK_CONTROL, 0);
   PostMessage(Handle_1, WM_KEYUP, 82, 0);
end;

procedure TForm1.Timer12_Map_ChangeTimer(Sender: TObject);
begin
   try
      case Now_Map12 of
         map_502 : begin
            if (Bef_Map12 = Now_Map12) then
            begin
               Timer12_Map_Change.Interval := 250;
               if (Pos12_Y = 21) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_LEFT, 0);
                  PostMessage(Handle_1, WM_KEYUP, VK_LEFT, 0);
               end else
               if (Pos12_Y > 21) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                  PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
               end else
               if (Pos12_Y > 21) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_DOWN, 0);
                  PostMessage(Handle_1, WM_KEYUP, VK_DOWN, 0);
               end;
            end else
            if not (Bef_Map12 = Now_Map12) then
            begin
               Timer12_Map_Change.Interval := 5000;
               Bef_Map12 := Now_Map12;
            end;
         end;
         map_501 : begin
            if (Bef_Map12 = Now_Map12) then
            begin
               Timer12_Map_Change.Interval := 250;
               if (Pos12_Y = 21) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_RIGHT, 0);
                  PostMessage(Handle_1, WM_KEYUP, VK_RIGHT, 0);
               end else
               if (Pos12_Y > 21) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                  PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
               end else
               if (Pos12_Y > 21) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_DOWN, 0);
                  PostMessage(Handle_1, WM_KEYUP, VK_DOWN, 0);
               end;
            end else
            if not (Bef_Map12 = Now_Map12) then
            begin
               Timer12_Map_Change.Interval := 5000;
               Bef_Map12 := Now_Map12;
            end;
         end;
         else begin

         end;
      end;
//      Timer12_Map_Move.Enabled := not (Timer12_Map_Move.Enabled);
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Timer_BMoon_ElveTimer'+'---'); {$ENDIF}
   end;
end;

procedure TForm1.Timer12_Map_MoveTimer(Sender: TObject);
begin
   try
      case Now_Map12 of
         map_103 : begin
            if (Pos12_X > 10) then begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_LEFT, 0);
               PostMessage(Handle_1, WM_KEYUP, VK_LEFT, 0);
            end else
            if (Pos12_X <= 10) then begin
               if (Pos12_Y > 14) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                  PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
               end else
               if (Pos12_Y < 14) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_DOWN, 0);
                  PostMessage(Handle_1, WM_KEYUP, VK_DOWN, 0);
               end else
               if (Pos12_Y = 14) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_LEFT, 0);
                  PostMessage(Handle_1, WM_KEYUP, VK_LEFT, 0);
               end;
            end;
         end;

         map_102 : begin
            if (Pos12_Y = 14) then begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_LEFT, 0);
               PostMessage(Handle_1, WM_KEYUP, VK_LEFT, 0);
            end else
            if (Pos12_Y > 14) then begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
               PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
            end else
            if (Pos12_Y < 14) then begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_DOWN, 0);
               PostMessage(Handle_1, WM_KEYUP, VK_DOWN, 0);
            end
         end;

         map_101 : begin
            if (Pos12_X > 17) then begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_LEFT, 0);
               PostMessage(Handle_1, WM_KEYUP, VK_LEFT, 0);
            end else
            if (Pos12_X = 17) then begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
               PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
            end else
            if (Pos12_X < 17) then begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_RIGHT, 0);
               PostMessage(Handle_1, WM_KEYUP, VK_RIGHT, 0);
            end;
         end;

         map_201, map_301, map_401 : begin
            if (Pos12_X = 17) then begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
               PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
            end else
            if (Pos12_X > 17) then begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_LEFT, 0);
               PostMessage(Handle_1, WM_KEYUP, VK_LEFT, 0);
            end else
            if (Pos12_X < 17) then begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_RIGHT, 0);
               PostMessage(Handle_1, WM_KEYUP, VK_RIGHT, 0);
            end;
         end;

         map_501 : begin
            if (Pos12_Y > 21) then begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
               PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
            end else
            if (Pos12_Y = 21) then begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_RIGHT, 0);
               PostMessage(Handle_1, WM_KEYUP, VK_RIGHT, 0);
            end else
            if (Pos12_Y < 21) then begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_DOWN, 0);
               PostMessage(Handle_1, WM_KEYUP, VK_DOWN, 0);
            end;
         end;

         map_502 : begin
            if (Pos12_Y > 21) then begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
               PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
            end else
            if (Pos12_Y = 21) then begin
               if not Timer12_Map_Change.Enabled then
                  Timer12_Map_Change.Enabled := True;
               Timer12_Map_Move.Enabled := False;
               Bef_Map12 := Now_Map12;
            end else
            if (Pos12_Y < 21) then begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_DOWN, 0);
               PostMessage(Handle_1, WM_KEYUP, VK_DOWN, 0);
            end;
         end;

         map_503, map_504, map_505 : begin
            if (Pos12_Y > 21) then begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
               PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
            end else
            if (Pos12_Y = 21) then begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_LEFT, 0);
               PostMessage(Handle_1, WM_KEYUP, VK_LEFT, 0);
            end else
            if (Pos12_Y < 21) then begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_DOWN, 0);
               PostMessage(Handle_1, WM_KEYUP, VK_DOWN, 0);
            end;
         end;
      end;
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Timer_BMoon_MoveTimer'+'---'); {$ENDIF}
   end;
end;

procedure TForm1.Timer45_CapTimer(Sender: TObject);
begin
   try
      ScreenCapture45;
//      Label1.Caption := InttoStr(Pos_X);
//      Label2.Caption := InttoStr(Pos_Y);
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Timer_CapTimer'+'---'); {$ENDIF}
   end;
end;

procedure TForm1.Timer45_Map_ChangeTimer(Sender: TObject);
begin
   try
      case Now_Map45 of
         map_505 : begin
            if (Bef_Map45 = Now_Map45) then
            begin
               Timer45_Map_Change.Interval := 250;
               if (Pos45_Y = 21) then begin
                  PostMessage(Handle_2, WM_KEYDOWN, VK_LEFT, 0);
                  PostMessage(Handle_2, WM_KEYUP, VK_LEFT, 0);
               end else
               if (Pos45_Y > 21) then begin
                  PostMessage(Handle_2, WM_KEYDOWN, VK_UP, 0);
                  PostMessage(Handle_2, WM_KEYUP, VK_UP, 0);
               end else
               if (Pos45_Y > 21) then begin
                  PostMessage(Handle_2, WM_KEYDOWN, VK_DOWN, 0);
                  PostMessage(Handle_2, WM_KEYUP, VK_DOWN, 0);
               end;
            end else
            if not (Bef_Map45 = Now_Map45) then
            begin
               Timer45_Map_Change.Interval := 5000;
               Bef_Map45 := Now_Map45;
            end;
         end;
         map_504 : begin
            if (Bef_Map45 = Now_Map45) then
            begin
               Timer45_Map_Change.Interval := 250;
               if (Pos45_Y = 21) then begin
                  PostMessage(Handle_2, WM_KEYDOWN, VK_RIGHT, 0);
                  PostMessage(Handle_2, WM_KEYUP, VK_RIGHT, 0);
               end else
               if (Pos45_Y > 21) then begin
                  PostMessage(Handle_2, WM_KEYDOWN, VK_UP, 0);
                  PostMessage(Handle_2, WM_KEYUP, VK_UP, 0);
               end else
               if (Pos45_Y > 21) then begin
                  PostMessage(Handle_2, WM_KEYDOWN, VK_DOWN, 0);
                  PostMessage(Handle_2, WM_KEYUP, VK_DOWN, 0);
               end;
            end else
            if not (Bef_Map45 = Now_Map45) then
            begin
               Timer45_Map_Change.Interval := 5000;
               Bef_Map45 := Now_Map45;
            end;
         end;
         else begin

         end;
      end;
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Timer_BMoon_ElveTimer'+'---'); {$ENDIF}
   end;
end;

procedure TForm1.Timer45_Map_MoveTimer(Sender: TObject);
begin
   try
      case Now_Map45 of
         map_103 : begin
            if (Pos45_X > 10) then begin
               PostMessage(Handle_2, WM_KEYDOWN, VK_LEFT, 0);
               PostMessage(Handle_2, WM_KEYUP, VK_LEFT, 0);
            end else
            if (Pos45_X <= 10) then begin
               if (Pos45_Y > 14) then begin
                  PostMessage(Handle_2, WM_KEYDOWN, VK_UP, 0);
                  PostMessage(Handle_2, WM_KEYUP, VK_UP, 0);
               end else
               if (Pos45_Y < 14) then begin
                  PostMessage(Handle_2, WM_KEYDOWN, VK_DOWN, 0);
                  PostMessage(Handle_2, WM_KEYUP, VK_DOWN, 0);
               end else
               if (Pos45_Y = 14) then begin
                  PostMessage(Handle_2, WM_KEYDOWN, VK_LEFT, 0);
                  PostMessage(Handle_2, WM_KEYUP, VK_LEFT, 0);
               end;
            end;
         end;

         map_102 : begin
            if (Pos45_Y = 14) then begin
               PostMessage(Handle_2, WM_KEYDOWN, VK_LEFT, 0);
               PostMessage(Handle_2, WM_KEYUP, VK_LEFT, 0);
            end else
            if (Pos45_Y > 14) then begin
               PostMessage(Handle_2, WM_KEYDOWN, VK_UP, 0);
               PostMessage(Handle_2, WM_KEYUP, VK_UP, 0);
            end else
            if (Pos45_Y < 14) then begin
               PostMessage(Handle_2, WM_KEYDOWN, VK_DOWN, 0);
               PostMessage(Handle_2, WM_KEYUP, VK_DOWN, 0);
            end
         end;

         map_101 : begin
            if (Pos45_X > 17) then begin
               PostMessage(Handle_2, WM_KEYDOWN, VK_LEFT, 0);
               PostMessage(Handle_2, WM_KEYUP, VK_LEFT, 0);
            end else
            if (Pos45_X = 17) then begin
               PostMessage(Handle_2, WM_KEYDOWN, VK_UP, 0);
               PostMessage(Handle_2, WM_KEYUP, VK_UP, 0);
            end else
            if (Pos45_X < 17) then begin
               PostMessage(Handle_2, WM_KEYDOWN, VK_RIGHT, 0);
               PostMessage(Handle_2, WM_KEYUP, VK_RIGHT, 0);
            end;
         end;

         map_201, map_301, map_401 : begin
            if (Pos45_X = 17) then begin
               PostMessage(Handle_2, WM_KEYDOWN, VK_UP, 0);
               PostMessage(Handle_2, WM_KEYUP, VK_UP, 0);
            end else
            if (Pos45_X > 17) then begin
               PostMessage(Handle_2, WM_KEYDOWN, VK_LEFT, 0);
               PostMessage(Handle_2, WM_KEYUP, VK_LEFT, 0);
            end else
            if (Pos45_X < 17) then begin
               PostMessage(Handle_2, WM_KEYDOWN, VK_RIGHT, 0);
               PostMessage(Handle_2, WM_KEYUP, VK_RIGHT, 0);
            end;
         end;

         map_501 : begin
            if (Pos45_Y > 21) then begin
               PostMessage(Handle_2, WM_KEYDOWN, VK_UP, 0);
               PostMessage(Handle_2, WM_KEYUP, VK_UP, 0);
            end else
            if (Pos45_Y = 21) then begin
               PostMessage(Handle_2, WM_KEYDOWN, VK_RIGHT, 0);
               PostMessage(Handle_2, WM_KEYUP, VK_RIGHT, 0);
            end else
            if (Pos45_Y < 21) then begin
               PostMessage(Handle_2, WM_KEYDOWN, VK_DOWN, 0);
               PostMessage(Handle_2, WM_KEYUP, VK_DOWN, 0);
            end;
         end;

         map_505 : begin
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Timer45_Map_MoveTimer'+'---'+'map_505:'+IntToStr(Pos45_Y)); {$ENDIF}
            if (Pos45_Y > 21) then begin
               PostMessage(Handle_2, WM_KEYDOWN, VK_UP, 0);
               PostMessage(Handle_2, WM_KEYUP, VK_UP, 0);
            end else
            if (Pos45_Y = 21) then begin
               if not Timer45_Map_Change.Enabled then
                  Timer45_Map_Change.Enabled := True;
               Timer45_Map_Move.Enabled := False;
               Bef_Map45 := Now_Map45;
            end else
            if (Pos45_Y < 21) then begin
               PostMessage(Handle_2, WM_KEYDOWN, VK_DOWN, 0);
               PostMessage(Handle_2, WM_KEYUP, VK_DOWN, 0);
            end;
         end;

         map_502, map_503, map_504 : begin
            if (Pos45_Y > 21) then begin
               PostMessage(Handle_2, WM_KEYDOWN, VK_UP, 0);
               PostMessage(Handle_2, WM_KEYUP, VK_UP, 0);
            end else
            if (Pos45_Y = 21) then begin
               PostMessage(Handle_2, WM_KEYDOWN, VK_RIGHT, 0);
               PostMessage(Handle_2, WM_KEYUP, VK_RIGHT, 0);
            end else
            if (Pos45_Y < 21) then begin
               PostMessage(Handle_2, WM_KEYDOWN, VK_DOWN, 0);
               PostMessage(Handle_2, WM_KEYUP, VK_DOWN, 0);
            end;
         end;
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
     //_��ȸ�麯ȯ
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
            if (TransBmp.Canvas.Pixels[ Lx, Ly ] > (  (  (  $00FFFFFF + ($00FFFFFF - $00000000) div 2)  ) div 2  )  ) then //ȸ���� ��� ����
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
     //_��ȸ�麯ȯ
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
