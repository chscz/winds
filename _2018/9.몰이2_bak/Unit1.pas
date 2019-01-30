unit Unit1;

//{$DEFINE _LOG_}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ImgList
  , System.Win.Registry, Contnrs, Vcl.ComCtrls, Dateutils;

const
   map_BMoon_F0 = 100;  //��� �Ա�
   map_BMoon_F1 = 101;  //��� 2�� ���
   map_BMoon_F2 = 102;  //��� 2��
   map_BMoon_F3 = 103;  //��� 3��
   map_BMoon_F4 = 104;  //��� 4��
   map_BMoon_F5 = 105;  //��� 5��
   map_BMoon_F6 = 106;  //��� ����

type
  TForm1 = class(TForm)
    Timer_BMoon_Move: TTimer;
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
    Cbx_Type: TComboBox;
    Timer_BMoon_Elve: TTimer;
    Chk_Elve: TCheckBox;
    Btn_WinTilte_Set: TButton;
    Btn_WinTilte_Ret: TButton;
    Lbl_Title: TLabel;
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
    Timer_BMoon_Skill: TTimer;
    Timer_BMoon_CtrlR: TTimer;
    Lbl_DateCheck: TLabel;
    Timer_BMoon_OtherFloor: TTimer;
    Timer_BMoon_PosChk: TTimer;
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
    function SearchBitmap_map(bmMain,bmSub: TBitMap): Boolean;
    function Check_Num(bmMain: TBitMap): Integer;
    function Check_Map(bmMain: TBitMap): Integer;
    procedure Btn_LockClick(Sender: TObject);
    procedure Timer_BMoon_ElveTimer(Sender: TObject);
    procedure edt_LockKeyPress(Sender: TObject; var Key: Char);
    procedure Btn_WinTilte_Setting(Sender: TObject);
    procedure Cbx_TypeChange(Sender: TObject);
    procedure Timer_CapTimer(Sender: TObject);
    procedure Btn_HelpClick(Sender: TObject);
    procedure Timer_PowerOffTimer(Sender: TObject);
    procedure Timer_TestTimer(Sender: TObject);
    procedure Timer_BMoon_SkillTimer(Sender: TObject);
    procedure Timer_BMoon_CtrlRTimer(Sender: TObject);
    procedure Timer_BMoon_OtherFloorTimer(Sender: TObject);
    procedure Timer_BMoon_PosChkTimer(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    //�̹��� ����Ʈ
    bmp_0,bmp_1,bmp_2,bmp_3,bmp_4,bmp_5,bmp_6,bmp_7,bmp_8,bmp_9 : TBitmap;
    X_100, X_10, X_1, Y_100, Y_10, Y_1 : Tbitmap;  //��ǥ
    Pos_X, Pos_Y  : Integer;         //��ǥ
    Pos_X_Bak, Pos_Y_Bak  : Integer;         //��ǥ
    bmp_BMoon_0F  : TBitmap;
    bmp_BMoon_2F  : TBitmap;
    bmp_BMoon_3F  : TBitmap;
    bmp_ElveSub   : TBitmap;

    //ĸ�ĺ�
    bmp_MapMain   : TBitmap;
    bmp_ElveMain  : TBitmap;
    Now_Map       : Integer;

    Handle_1      : THandle;
    EndFlag       : Boolean;  //����ð� ��
    OutFlag       : Boolean;  //������ ��������
    tCnt          : Integer;     //��ų ī��Ʈ

    DateCheck     : String;

    ElveFlag      : Boolean;  //���� �� 70�� üũ
    Before_map    : Integer;

    ElveFlag_0F   : Boolean;
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
      Lbl_DateCheck.Caption := '(������)';
      Lbl_DateCheck.Left := Pnl_Ctrl.Left - Lbl_DateCheck.Width - 2;
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
      if not Reg_1.ValueExists('Release Lock_3') then
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
{      if (DaysBetween(now, StrToDate(Reg_1.ReadString('Release Lock_3'))) > 100) then
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
      end else}
      begin
//         Lbl_DateCheck.Caption := '(D-'+IntToStr(100 - DaysBetween(now, StrToDate(Reg_1.ReadString('Release Lock_3'))))+')';
         Lbl_DateCheck.Caption := '(������)';
         Lbl_DateCheck.Left := Pnl_Ctrl.Left - Lbl_DateCheck.Width - 2;
         result := True;
      end;
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

         //���� ���------
         Bmp_ElveSub := TBitmap.Create;
         ImageList_Etc.GetBitmap(0,Bmp_ElveSub);
         //---------------

         //�� Ÿ��Ʋ------
         bmp_BMoon_0F := TBitmap.Create;
         bmp_BMoon_2F := TBitmap.Create;
         bmp_BMoon_3F := TBitmap.Create;
         ImageList_Map.GetBitmap(0,bmp_BMoon_0F);
         ImageList_Map.GetBitmap(1,bmp_BMoon_2F);
         ImageList_Map.GetBitmap(2,bmp_BMoon_3F);
         //----------------

   {  //�����ҋ� ��
         Bmp_ElveSub.LoadFromFile('E:\ImageS\zz\20180705_����_1\���2��_����.bmp');
         Bmp_ElveSub := TransColor_0(Bmp_ElveSub);
         Image7.Picture := TPicture(Bmp_ElveSub);
         Bmp_ElveSub.SaveToFile('E:\ImageS\zz\20180705_����_1\���2��_��ȯ_2.bmp');
   }
         DateTimePicker1.Time := IncHour(IncMinute(now,3),2);
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
               Handle_1 := FindWindow(nil, PChar(Cbx_Type.Text));
               if not (Handle_1 > 0) then
               begin
                  Btn_StartEndClick(Btn_End);
                  MessageDlg(''''+Cbx_Type.Text+''' ����',mtError, [mbOK], 0);
                  Exit;
               end;

               Self.Caption             := '����2';
               Btn_Start.Enabled        := False;
               Btn_End.Enabled          := True;
               Cbx_Type.Enabled         := False;
               Chk_Elve.Enabled         := False;
               Btn_WinTilte_Set.Enabled := False;
               Btn_WinTilte_Ret.Enabled := False;
               Chk_AutoOff.Enabled      := False;
               DateTimePicker1.Enabled  := False;
               EndFlag                  := False;
               OutFlag                  := False;
               ElveFlag                 := False;
               Before_map               := 0;
               ElveFlag_0F              := False;
               Pos_X_Bak                := -1;
               Pos_Y_Bak                := -1;

               Timer_Cap.Enabled               := True;      //ĸ�� Ÿ�̸� 0.25��
               if Chk_AutoOff.Checked then
                  Timer_PowerOff.Enabled       := True;      //�ڵ����� Ÿ�̸� 1��
//               if Chk_Elve.Checked then
//               begin
//                  Timer_BMoon_Elve.Enabled     := True;      //���� Ÿ�̸�
//               end;

               case Cbx_Type.ItemIndex of
                  0: begin
                     Timer_BMoon_Move.Enabled  := True;      //���� Ÿ�̸�
                     Timer_BMoon_Skill.Enabled := True;      //��ų Ÿ�̸�
                     tCnt := 1;
                  end;
                  1: begin
                     Timer_BMoon_Skill.Enabled := True;      //��ų Ÿ�̸�
                     tCnt := 1;
                  end;
               end;
               Timer_BMoon_CtrlR.Enabled := True;
//               Timer_BMoon_PosChk.Enabled := True;
   //            KeySetting;
   //            KeybdHook;

//               Timer_Test.Enabled := True;
            end;

         2:
            begin
               Btn_Start.Enabled          := True;
               Btn_End.Enabled            := False;
               Cbx_Type.Enabled           := True;
               Chk_Elve.Enabled           := True;
               Btn_WinTilte_Set.Enabled   := True;
               Btn_WinTilte_Ret.Enabled   := True;
               Chk_AutoOff.Enabled        := True;
               DateTimePicker1.Enabled    := True;

               Timer_Cap.Enabled          := False;
               Timer_BMoon_Move.Enabled   := False;
               Timer_BMoon_Skill.Enabled  := False;
               Timer_BMoon_Elve.Enabled   := False;
               Timer_PowerOff.Enabled     := False;
               Timer_BMoon_CtrlR.Enabled  := False;
               Timer_BMoon_PosChk.Enabled := False;
   //            KeybdUnhook;
//               Timer_Test.Enabled := False;;
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
               SetWindowText(wHandle, Cbx_Type.Text);
         end;
         7: begin
            wHandle := FindWindow(nil, PChar(Cbx_Type.Text));
            SetWindowText(wHandle, '�ٶ��ǳ���');
         end;
      end;
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Btn_WinTilte_Setting'+'---'); {$ENDIF}
   end;
end;

procedure TForm1.Cbx_TypeChange(Sender: TObject);
//Ÿ�� �޺��ڽ�
begin
   try
      case Cbx_Type.ItemIndex of
         0: begin
            Chk_Elve.Enabled := True;
         end;
         1: begin
            Chk_Elve.Checked := True;
            Chk_Elve.Enabled := False;
         end;
         2: begin
            Chk_Elve.Checked := False;
            Chk_Elve.Enabled := False;
         end;
      end;
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Cbx_TypeChange'+'---'); {$ENDIF}
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
      if (SearchBitmap_map(TransColor_1(Bmp_ElveMain), TransColor_1(Bmp_ElveSub))) then
         result := 101
      else if SearchBitmap_map(TransColor_0(bmMain), TransColor_0(bmp_BMoon_2F)) then
         result := 102
      else if SearchBitmap_map(TransColor_0(bmMain), TransColor_0(bmp_BMoon_3F)) then
         result := 103
      else if SearchBitmap_map(TransColor_0(bmMain), TransColor_0(bmp_BMoon_0F)) then
         result := 100;
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Check_Map'+'---'); {$ENDIF}
   end;

{   bmMain.SaveToFile('c:\bmMain.bmp');
   bmp_BMoon_2F.SaveToFile('c:\bmp_BMoon_2F.bmp');
   bmp_BMoon_0F.SaveToFile('c:\bmp_BMoon_0F.bmp');}
//   showmessage('����!');
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
{$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ',now)+'******[���] J:'+IntToStr(J) ); {$ENDIF}
   result := J;
*)
end;

function TForm1.ScreenCapture: Boolean;
var
   aDC: HDC;
   aRect, bRect: TRect;
   winplace: TWindowPlacement;
begin
   Result := True;
   try
//      Handle_1 := FindWindow(nil, PChar('�ٸ��캸'));
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
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :ScreenCapture(1)'+'---'); {$ENDIF}
   end;

   try
      try
         // Bitblt(btm.Canvas.Handle,ĵ��������X, ĵ��������Y, ĸ���̹���width, ĸ���̹���height, aDC, ĸ���̹�������X, ĸ���̹�������Y, SRCCOPY);
         aDC := GetDC(Handle_1); // â ���θ�    // aDC := GetWindowDC(aHandle);   //â �׵θ� ����
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] :ScreenCapture --- Create'); {$ENDIF}
         X_100 := TBitMap.Create;
         X_10  := TBitMap.Create;
         X_1   := TBitMap.Create;
         Y_100 := TBitMap.Create;
         Y_10  := TBitMap.Create;
         Y_1   := TBitMap.Create;
         X_100.Width  := 12;
         X_100.Height := 14;
         X_10.Width   := 12;
         X_10.Height  := 14;
         X_1.Width    := 12;
         X_1.Height   := 14;
         Y_100.Width  := 12;
         Y_100.Height := 14;
         Y_10.Width   := 12;
         Y_10.Height  := 14;
         Y_1.Width    := 12;
         Y_1.Height   := 14;
         Bmp_ElveMain := TBitmap.Create;
         Bmp_ElveMain.Width := 20;
         Bmp_ElveMain.Height := 10;
         Bmp_MapMain := TBitmap.Create;
         Bmp_MapMain.Width := 20;
         Bmp_MapMain.Height := 10;

   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] :ScreenCapture --- Capture'); {$ENDIF}
         //��ǥ
         Bitblt(X_100.Canvas.Handle, 0, 0, 12, 14, aDC, 914, 737, SRCCOPY);
         Bitblt(X_10.Canvas.Handle, 0, 0, 12, 14, aDC, 923, 737, SRCCOPY);
         Bitblt(X_1.Canvas.Handle, 0, 0, 12, 14, aDC, 931, 737, SRCCOPY);
         Bitblt(Y_100.Canvas.Handle, 0, 0, 12, 14, aDC, 970, 737, SRCCOPY);
         Bitblt(Y_10.Canvas.Handle, 0, 0, 12, 14, aDC, 980, 737, SRCCOPY);
         Bitblt(Y_1.Canvas.Handle, 0, 0, 12, 14, aDC, 989, 737, SRCCOPY);
         //����(���)
         Bitblt(Bmp_ElveMain.Canvas.Handle, 0, 0, 20, 10, aDC, 327, 372, SRCCOPY);
         //�� �̸�
         Bitblt(Bmp_MapMain.Canvas.Handle, 0, 0, 20, 10, aDC, 415, 5, SRCCOPY);

   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] :ScreenCapture --- TransColor'); {$ENDIF}
         TransColor_0(X_100);
         TransColor_0(X_10);
         TransColor_0(X_1);
         TransColor_0(Y_100);
         TransColor_0(Y_10);
         TransColor_0(Y_1);
         TransColor_1(Bmp_ElveMain);
         TransColor_0(Bmp_MapMain);

   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Event] :ScreenCapture --- bmp Free'); {$ENDIF}
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
         Pos_X := (Check_Num(X_10)*10) + Check_Num(X_1); //��ǥüũ
         Pos_Y := (Check_Num(Y_10)*10) + Check_Num(Y_1);
         Now_map := Check_map(Bmp_MapMain);  //��üũ

         if (EndFlag) and (Now_map = map_BMoon_F0) then
            Now_map := map_BMoon_F0
         else
         if (EndFlag) and (not OutFlag) then
            Now_map := map_BMoon_F6;


         if (Before_map = 0) then
            Before_map := Now_Map
         else if not (Before_map = Now_Map) then
         begin
            Before_map := Now_Map;
            ElveFlag := True;
            Timer_BMoon_OtherFloor.Enabled := True;
         end;

         if (Now_Map = map_BMoon_F0) then        //��� �Ա� ���ڸ� üũ
         begin
            if not Timer_BMoon_PosChk.Enabled then
               Timer_BMoon_PosChk.Enabled := True;
         end else
         begin
            if Timer_BMoon_PosChk.Enabled then
               Timer_BMoon_PosChk.Enabled := False;
         end;

         if ElveFlag then
         begin
            case Cbx_Type.ItemIndex of
               0: begin
                  case Now_Map of
                     map_BMoon_F0: begin   // ��� �Ա�
                        if EndFlag then begin
                           Btn_StartEndClick(Btn_End);
                           Exit;
                        end;
                        Timer_BMoon_Elve.Enabled := True;
                        Timer_BMoon_Move.Enabled := False;
                        Timer_BMoon_Skill.Enabled := False;
                        Timer_BMoon_CtrlR.Enabled := False;
                     end;

                     map_BMoon_F1: begin   // ��� 2�� ���
   //                     if not Timer_BMoon_Elve.Enabled then
                        ElveFlag_0F := False;
                        if Chk_Elve.Checked then
                        begin
                           if not Timer_BMoon_Elve.Enabled then
                              Timer_BMoon_Elve.Enabled := True;
                           if Timer_BMoon_Move.Enabled then
                           begin
                              Timer_BMoon_Move.Enabled := False;
                              PostMessage(Handle_1, WM_KEYDOWN, VK_CONTROL, 0);
                              PostMessage(Handle_1, WM_KEYDOWN, 82, 0);
                              Sleep(200);
                           end;
                        end
                        else begin
                           if not Timer_BMoon_Move.Enabled then
                              Timer_BMoon_Move.Enabled := True;
                        end;
                     end;

                     map_BMoon_F6: begin   //��� ����
                        ElveFlag_0F := False;
                        if Chk_Elve.Checked then
                        begin
                           Timer_BMoon_Move.Enabled := False;
                           if not Timer_BMoon_Elve.Enabled then
                              Timer_BMoon_Elve.Enabled := True;
                        end else
                        begin
                           if not Timer_BMoon_Move.Enabled then
                              Timer_BMoon_Move.Enabled := True;
                        end;
                     end;

                     else begin            // �� ���� ��
                        ElveFlag_0F := False;
                        Timer_BMoon_Elve.Enabled := False;
                        if not Timer_BMoon_CtrlR.Enabled then
                           Timer_BMoon_CtrlR.Enabled := True;
                        if not Timer_BMoon_Skill.Enabled then
                           Timer_BMoon_Skill.Enabled := True;
                        if not Timer_BMoon_Move.Enabled then
                           Timer_BMoon_Move.Enabled := True;
                     end;
                  end;
               end;

               1: begin
                  case Now_Map of
                     map_BMoon_F0: begin   // ��� �Ա�
                        if EndFlag then begin
                           Btn_StartEndClick(Btn_End);
                           Exit;
                        end;
                        Timer_BMoon_Elve.Enabled := False;
                        Timer_BMoon_Move.Enabled := False;
                        Timer_BMoon_Skill.Enabled := False;
                     end;

                     map_BMoon_F1: begin   // ��� 2�� ���
                        ElveFlag_0F := False;
                        if not Timer_BMoon_Elve.Enabled then
                           Timer_BMoon_Elve.Enabled := True;
                        if Timer_BMoon_Move.Enabled then
                           Timer_BMoon_Move.Enabled := False;
                     end;

                     map_BMoon_F6: begin   //��� ����
                        ElveFlag_0F := False;
                        Timer_BMoon_Move.Enabled := False;
                        if not Timer_BMoon_Elve.Enabled then
                           Timer_BMoon_Elve.Enabled := True;
                     end;

                     else begin            // �� ���� ��
                        ElveFlag_0F := False;
                        Timer_BMoon_Elve.Enabled := False;
                        if not Timer_BMoon_Skill.Enabled then
                           Timer_BMoon_Skill.Enabled := True;
                     end;
                  end;
               end;
            end;
         end else
         begin
            case Cbx_Type.ItemIndex of
               0: begin
                  case Now_Map of
                     map_BMoon_F0: begin   // ��� �Ա�
                        if EndFlag then begin
                           Btn_StartEndClick(Btn_End);
                           Exit;
                        end;
                        Timer_BMoon_Elve.Enabled := True;
                        Timer_BMoon_Move.Enabled := False;
                        Timer_BMoon_Skill.Enabled := False;
                        Timer_BMoon_CtrlR.Enabled := False;
                     end;

                     map_BMoon_F1: begin   // ��� 2�� ���
                        ElveFlag_0F := False;
   //                     if not Timer_BMoon_Elve.Enabled then
                        if Chk_Elve.Checked then
                        begin
                           if not Timer_BMoon_Elve.Enabled then
                              Timer_BMoon_Elve.Enabled := True;
                           if Timer_BMoon_Move.Enabled then
                           begin
                              Timer_BMoon_Move.Enabled := False;
                              PostMessage(Handle_1, WM_KEYDOWN, VK_CONTROL, 0);
                              PostMessage(Handle_1, WM_KEYDOWN, 82, 0);
                              Sleep(200);
                           end;
                        end
                        else begin
                           if not Timer_BMoon_Move.Enabled then
                              Timer_BMoon_Move.Enabled := True;
                        end;
                     end;

                     map_BMoon_F2: begin   // ��� 2��
                        ElveFlag_0F := False;
                        Timer_BMoon_Elve.Enabled := False;
                        if not Timer_BMoon_CtrlR.Enabled then
                           Timer_BMoon_CtrlR.Enabled := True;
                        if not Timer_BMoon_Skill.Enabled then
                           Timer_BMoon_Skill.Enabled := True;
                        if not Timer_BMoon_Move.Enabled then
                           Timer_BMoon_Move.Enabled := True;
                     end;

                     map_BMoon_F6: begin   //��� ����
                        ElveFlag_0F := False;
                        if Chk_Elve.Checked then
                        begin
                           Timer_BMoon_Move.Enabled := False;
                           if not Timer_BMoon_Elve.Enabled then
                              Timer_BMoon_Elve.Enabled := True;
                        end else
                        begin
                           if not Timer_BMoon_Move.Enabled then
                              Timer_BMoon_Move.Enabled := True;
                        end;
                     end;

                     else begin            // �� ���� ��
                        ElveFlag_0F := False;
                        if not Timer_BMoon_Skill.Enabled then
                           Timer_BMoon_Skill.Enabled := True;
                        if Chk_Elve.Checked then
                        begin
                           if not Timer_BMoon_Elve.Enabled then
                              Timer_BMoon_Elve.Enabled := True;
                           if Timer_BMoon_Move.Enabled then
                           begin
                              Timer_BMoon_Move.Enabled := False;
                              PostMessage(Handle_1, WM_KEYDOWN, VK_CONTROL, 0);
                              PostMessage(Handle_1, WM_KEYDOWN, 82, 0);
                              Sleep(200);
                           end;
                        end else
                        begin
                           if not Timer_BMoon_Move.Enabled then
                              Timer_BMoon_Move.Enabled := True;
                        end;
                     end;
                  end;
               end;

               1: begin
                  case Now_Map of
                     map_BMoon_F0: begin   // ��� �Ա�
                        if EndFlag then begin
                           Btn_StartEndClick(Btn_End);
                           Exit;
                        end;
                        Timer_BMoon_Elve.Enabled := False;
                        Timer_BMoon_Move.Enabled := False;
                        Timer_BMoon_Skill.Enabled := False;
                     end;

                     map_BMoon_F1: begin   // ��� 2�� ���
                        ElveFlag_0F := False;
                        if not Timer_BMoon_Elve.Enabled then
                           Timer_BMoon_Elve.Enabled := True;
                        if Timer_BMoon_Move.Enabled then
                           Timer_BMoon_Move.Enabled := False;
                     end;

                     map_BMoon_F2: begin   // ��� 2��
                        ElveFlag_0F := False;
                        Timer_BMoon_Elve.Enabled := False;
                        if not Timer_BMoon_Skill.Enabled then
                           Timer_BMoon_Skill.Enabled := True;
                     end;

                     map_BMoon_F6: begin   //��� ����
                        ElveFlag_0F := False;
                        Timer_BMoon_Move.Enabled := False;
                        if not Timer_BMoon_Elve.Enabled then
                           Timer_BMoon_Elve.Enabled := True;
                     end;

                     else begin            // �� ���� ��
                        ElveFlag_0F := False;
                        if not Timer_BMoon_Skill.Enabled then
                           Timer_BMoon_Skill.Enabled := True;
                        if not Timer_BMoon_Elve.Enabled then
                           Timer_BMoon_Elve.Enabled := True;
                     end;
                  end;
               end;
            end;
         end;

         X_100.Destroy;
         X_10.Destroy;
         X_1.Destroy;
         Y_100.Destroy;
         Y_10.Destroy;
         Y_1.Destroy;
         Bmp_ElveMain.Destroy;
         Bmp_MapMain.Destroy;

      except
         on E : Exception do begin
            Result := False;
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :ScreenCapture(2)'+'--- '+E.Message); {$ENDIF}
         end;
      end;
   finally
      ReleaseDC(Handle_1, aDC);
      // CloseHandle(aHandle);
   end;
end;

procedure TForm1.Btn_HelpClick(Sender: TObject);
//var
//   a_Handle : THandle;
//   Pt: TPoint;
begin
   showmessage('�� 3, 6 : 1�ʿ� �ѹ� / 0 : 10�ʿ� �ѹ�'+#13#10+
               '     7   : ���� �� �������� �Ա����� �ѹ�'+#13#10+
               '- �� �� -'+#13#10+
               '�� ����: 3��� 6�ݰ� 0���� 7ȯ��'+#13#10+
               '�� ����: 3�� '+#13#10+
               '�� õ��: 3���� 6�⵵ 0�Ϲ�'+#13#10+

               '�� [����Ű] ��ȭâ���� ���� ��'+#13#10+
               '�� 100�� �ֱ�� ���� �ʿ�'+#13#10+
               '- �ٸ�@XX -   Ver.3');
//   WindowFromPoint()
{
  Application.ProcessMessages;
  // Get the point in the center of button 1
  Pt.x := 100;
  Pt.y := 100;
  // Convert Pt to screen coordinates
  Pt := ClientToScreen(Pt);

  // Convert Pt to mickeys
//  Pt.x := Ceil(Pt.x * 65535. / Screen.Width);
//  Pt.y := Ceil(Pt.y * 65535. / Screen.Height);
  // Move the mouse
  mouse_event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_MOVE, Pt.x, Pt.y, 0, 0);
  // Simulate the left mouse button down
  mouse_event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_RIGHTDOWN, Pt.x, Pt.y, 0, 0);
  // Simulate the left mouse button up
  mouse_event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_RIGHTUP, Pt.x, Pt.y, 0, 0);
}
{   a_Handle := FindWindow(nil, PChar('�ٸ��캸'));
//   PostMessage(a_Handle, WM_LBUTTONDOWN,0,MakeLParam(100,100));
//   PostMessage(a_Handle, WM_LBUTTONUP,0,MakeLParam(100,100));
//   PostMessage(a_Handle, WM_RBUTTONDOWN,0,(100 shl 15)+100);
//   PostMessage(a_Handle, WM_RBUTTONUP,0,(100 shl 15)+100);
   mouse_event(MOUSEEVENTF_RIGHTDOWN,100,100,);
}
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

procedure TForm1.Timer_CapTimer(Sender: TObject);
begin
   try
//   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+' ---------Timer_Cap ON!!!'); {$ENDIF}
      ScreenCapture;

      Label1.Caption := InttoStr(Pos_X);
      Label2.Caption := InttoStr(Pos_Y);
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
   if Pos_X_Bak = -1 then
      Pos_X_Bak := Pos_X;
   if Pos_Y_Bak = -1 then
      Pos_Y_Bak := Pos_Y;

   if (Pos_X_Bak = Pos_X) and (Pos_Y_Bak = Pos_Y) then
   begin
      Timer_BMoon_Elve.Enabled := False;
{      PostMessage(Handle_1, WM_KEYDOWN, VK_NUMPAD8, 0);
      Sleep(100);
      PostMessage(Handle_1, WM_KEYDOWN, VK_NUMPAD4, 0);
      Sleep(100);
      PostMessage(Handle_1, WM_KEYDOWN, VK_RETURN, 0);
      Sleep(100);
      PostMessage(Handle_1, WM_KEYDOWN, VK_NUMPAD8, 0);
      Sleep(100);
      PostMessage(Handle_1, WM_KEYDOWN, VK_NUMPAD4, 0);
      Sleep(100);
      PostMessage(Handle_1, WM_KEYDOWN, VK_RETURN, 0);
      Sleep(100);          }
      
      
      PostMessage(Handle_1, WM_KEYUP, VK_DOWN, 0);
      PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
      PostMessage(Handle_1, WM_KEYUP, VK_LEFT, 0);
      PostMessage(Handle_1, WM_KEYUP, VK_RIGHT, 0);

{      Timer_BMoon_Move.Interval := 1000;
      Timer_BMoon_Elve.Interval := 1000;
   end else
   begin
      Timer_BMoon_Move.Interval := 100;
      Timer_BMoon_Elve.Interval := 100;
}
      Timer_BMoon_Elve.Enabled := True;
   end;

   Pos_X_Bak := Pos_X;
   Pos_Y_Bak := Pos_Y;
end;

procedure TForm1.Timer_BMoon_CtrlRTimer(Sender: TObject);
begin
   if Timer_BMoon_Move.Enabled then
   begin
      Timer_BMoon_Move.Enabled := False;
      Timer_BMoon_Skill.Enabled := False;
      Sleep(300);
      PostMessage(Handle_1, WM_KEYDOWN, VK_CONTROL, 0);
      PostMessage(Handle_1, WM_KEYDOWN, 82, 0);
      Sleep(300);
      PostMessage(Handle_1, WM_KEYUP, VK_CONTROL, 0);
      PostMessage(Handle_1, WM_KEYUP, 82, 0);
      Sleep(300);
      Timer_BMoon_Move.Enabled := True;
      Timer_BMoon_Skill.Enabled := True;
   end;

end;

procedure TForm1.Timer_PowerOffTimer(Sender: TObject);
begin
   try
      if Chk_AutoOff.Checked then
      begin
         if FormatDateTime('HH:NN',DateTimePicker1.Time) = FormatDateTime('HH:NN',now) then
         begin
            EndFlag := True;
            Timer_PowerOff.Enabled := False;
            Timer_BMoon_Move.Enabled := False;
            if not Timer_BMoon_Elve.Enabled then
            begin
               Timer_BMoon_Elve.Enabled := True;
            end;
         end;
      end;
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Timer_PowerOffTimer'+'---'); {$ENDIF}
   end;
end;

procedure TForm1.Timer_BMoon_SkillTimer(Sender: TObject);
begin
   PostMessage(Handle_1, WM_KEYDOWN, VK_NUMPAD6, 0);
   PostMessage(Handle_1, WM_KEYUP, VK_NUMPAD6, 0);
   PostMessage(Handle_1, WM_KEYDOWN, VK_NUMPAD3, 0);
   PostMessage(Handle_1, WM_KEYUP, VK_NUMPAD3, 0);
   PostMessage(Handle_1, WM_KEYDOWN, VK_RETURN, 0);
   PostMessage(Handle_1, WM_KEYUP, VK_RETURN, 0);
   Inc(tCnt);
   if (tCnt > 10) then
   begin
      PostMessage(Handle_1, WM_KEYDOWN, VK_NUMPAD0, 0);
      PostMessage(Handle_1, WM_KEYUP, VK_NUMPAD0, 0);
      tCnt := 1;
   end;
end;

procedure TForm1.Timer_TestTimer(Sender: TObject);
begin
//   Memo1.Lines.Add('�����:'+IntToStr(Now_Map)+' ������:'+IntToStr(Before_map)+' ElveFlag:'+BoolToStr(ElveFlag)
//   );
            PostMessage(Handle_1, WM_KEYDOWN, VK_RIGHT, 0);
//            PostMessage(Handle_1, WM_KEYUP, VK_RIGHT, 0);
end;

procedure TForm1.Timer_BMoon_ElveTimer(Sender: TObject);
begin
   try
      case Now_Map of
         map_BMoon_F0: begin     //����Ա�
            if ElveFlag_0F then
            begin
               if (Pos_Y < 11) then
                  PostMessage(Handle_1, WM_KEYDOWN, VK_DOWN, 0)
               else
                  ElveFlag_0F := False;
            end else
            begin
               if (Pos_X > 10) and (Pos_X < 19) then begin
                  if (Pos_Y > 11) then begin
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                  end else
                  if (Pos_Y = 11) then begin
                     if Timer_BMoon_Elve.Enabled then
                        Timer_BMoon_Elve.Enabled := False;
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                  end else
                  if (Pos_Y < 9) then begin
//                     ElveFlag_0F := True;
                     Timer_BMoon_Elve.Enabled := False;
                     PostMessage(Handle_1, WM_KEYDOWN, VK_ESCAPE, 0);
                     Sleep(300);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_CONTROL, 0);
                     PostMessage(Handle_1, WM_KEYDOWN, 82, 0);
                     Sleep(300);
                     PostMessage(Handle_1, WM_KEYUP, VK_CONTROL, 0);
                     PostMessage(Handle_1, WM_KEYUP, 82, 0);
                     Sleep(500);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_RETURN, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_RETURN, 0);
                     Sleep(250);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(250);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_DOWN, 0);
                     Sleep(250);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_RETURN, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_RETURN, 0);
                     Sleep(250);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_ESCAPE, 0);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_TAB, 0);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_HOME, 0);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_TAB, 0);
                  end else
                  if (Pos_Y < 11) then begin
                     Timer_BMoon_Elve.Enabled := False;
                     Sleep(250);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_RETURN, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_RETURN, 0);
                     Sleep(250);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
                     Sleep(250);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_DOWN, 0);
                     Sleep(250);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_RETURN, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_RETURN, 0);
                     Sleep(250);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_ESCAPE, 0);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_TAB, 0);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_HOME, 0);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_TAB, 0);
                  end;
               end else
               if (Pos_X < 11) then begin
                  if (Pos_Y < 13) then
                     PostMessage(Handle_1, WM_KEYDOWN, VK_DOWN, 0)
                  else
                     PostMessage(Handle_1, WM_KEYDOWN, VK_RIGHT, 0);
               end else
               if (Pos_X > 18) then begin
                  if (Pos_Y < 13) then
                     PostMessage(Handle_1, WM_KEYDOWN, VK_DOWN, 0)
                  else
                     PostMessage(Handle_1, WM_KEYDOWN, VK_LEFT, 0);
               end;
            end;
         end;

         map_BMoon_F6: begin     //��ɳ�
            if (Pos_Y > 15) then begin
               if (Pos_X = 23) or (Pos_X = 17) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                  PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
               end else
               if (Pos_X > 23) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_LEFT, 0);
//                  PostMessage(Handle_1, WM_KEYUP, VK_LEFT, 0);
               end else
               if (Pos_X < 17) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_RIGHT, 0);
//                  PostMessage(Handle_1, WM_KEYUP, VK_RIGHT, 0);
               end else
               if (Pos_X >= 21) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_RIGHT, 0);
//                  PostMessage(Handle_1, WM_KEYUP, VK_RIGHT, 0);
               end else
               if (Pos_X < 21) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_LEFT, 0);
//                  PostMessage(Handle_1, WM_KEYUP, VK_LEFT, 0);
               end;
            end else
            if (Pos_Y <= 15) then begin
               if (Pos_X > 21) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_LEFT, 0);
//                  PostMessage(Handle_1, WM_KEYUP, VK_LEFT, 0);
               end else
               if (Pos_X < 21) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_RIGHT, 0);
//                  PostMessage(Handle_1, WM_KEYUP, VK_RIGHT, 0);
               end else
               if (Pos_X = 21) then begin
                  if (Pos_Y > 7) then begin
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                  end else   //â������    Ÿ�̸� ���� ����
                  if (Pos_Y <= 7) then begin
                     Timer_BMoon_CtrlR.Enabled := False;
                     Timer_BMoon_Elve.Enabled := False;
                     Timer_BMoon_Skill.Enabled := False;
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_RETURN, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_RETURN, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_RETURN, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_RETURN, 0);
                     Sleep(150);
                     OutFlag := True;
                     PostMessage(Handle_1, WM_KEYDOWN, VK_NUMPAD7, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_NUMPAD7, 0);
                  end;
               end;
            end;
         end;

         map_BMoon_F1: begin     //����϶�
            if (Pos_Y > 15) then begin
               if (Pos_X = 23) or (Pos_X = 17) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                  PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
               end else
               if (Pos_X > 23) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_LEFT, 0);
//                  PostMessage(Handle_1, WM_KEYUP, VK_LEFT, 0);
               end else
               if (Pos_X < 17) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_RIGHT, 0);
//                  PostMessage(Handle_1, WM_KEYUP, VK_RIGHT, 0);
               end else
               if (Pos_X >= 21) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_RIGHT, 0);
//                  PostMessage(Handle_1, WM_KEYUP, VK_RIGHT, 0);
               end else
               if (Pos_X < 21) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_LEFT, 0);
//                  PostMessage(Handle_1, WM_KEYUP, VK_LEFT, 0);
               end;
            end else
            if (Pos_Y <= 15) then begin
               if (Pos_X > 21) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_LEFT, 0);
//                  PostMessage(Handle_1, WM_KEYUP, VK_LEFT, 0);
               end else
               if (Pos_X < 21) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_RIGHT, 0);
//                  PostMessage(Handle_1, WM_KEYUP, VK_RIGHT, 0);
               end else
               if (Pos_X = 21) then begin
                  if (Pos_Y > 7) then begin
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                  end else   //â������    Ÿ�̸� ���� ���̵� �� �ٽ� ����Ÿ�̸�/����Ÿ�̸� ����
                  if (Pos_Y <= 7) then begin
                     Timer_BMoon_CtrlR.Enabled := False;
                     Timer_BMoon_Elve.Enabled := False;
                     Timer_BMoon_Skill.Enabled := False;
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(250);
//                     PostMessage(Handle_1, WM_KEYDOWN, VK_DOWN, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_DOWN, 0);
                     Sleep(250);
//                     PostMessage(Handle_1, WM_KEYDOWN, VK_DOWN, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_DOWN, 0);
                     Sleep(250);
//                     PostMessage(Handle_1, WM_KEYDOWN, VK_DOWN, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_DOWN, 0);
                     Sleep(250);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_RETURN, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_RETURN, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_RETURN, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_RETURN, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_ESCAPE, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_ESCAPE, 0);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_TAB, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_TAB, 0);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_HOME, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_HOME, 0);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_TAB, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_TAB, 0);
                     Timer_BMoon_Elve.Enabled := True;
                  end;
               end;
            end;
         end;

         else begin
            if (Pos_Y > 15) then begin
               if (Pos_X = 23) or (Pos_X = 17) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                  PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
               end else
               if (Pos_X > 23) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_LEFT, 0);
//                  PostMessage(Handle_1, WM_KEYUP, VK_LEFT, 0);
               end else
               if (Pos_X < 17) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_RIGHT, 0);
//                  PostMessage(Handle_1, WM_KEYUP, VK_RIGHT, 0);
               end else
               if (Pos_X >= 21) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_RIGHT, 0);
//                  PostMessage(Handle_1, WM_KEYUP, VK_RIGHT, 0);
               end else
               if (Pos_X < 21) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_LEFT, 0);
//                  PostMessage(Handle_1, WM_KEYUP, VK_LEFT, 0);
               end;
            end else
            if (Pos_Y <= 15) then begin
               if (Pos_X > 21) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_LEFT, 0);
//                  PostMessage(Handle_1, WM_KEYUP, VK_LEFT, 0);
               end else
               if (Pos_X < 21) then begin
                  PostMessage(Handle_1, WM_KEYDOWN, VK_RIGHT, 0);
//                  PostMessage(Handle_1, WM_KEYUP, VK_RIGHT, 0);
               end else
               if (Pos_X = 21) then begin
                  if (Pos_Y >= 7) then begin
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                  end else   //â������    Ÿ�̸� ���� ���̵� �� �ٽ� ����Ÿ�̸�/����Ÿ�̸� ����
                  if (Pos_Y < 7) then begin
                     Timer_BMoon_CtrlR.Enabled := False;
                     Timer_BMoon_Elve.Enabled := False;
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
                     Sleep(250);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_DOWN, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_DOWN, 0);
                     Sleep(250);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_DOWN, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_DOWN, 0);
                     Sleep(250);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_RETURN, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_RETURN, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_RETURN, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_RETURN, 0);
                     Sleep(150);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_ESCAPE, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_ESCAPE, 0);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_TAB, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_TAB, 0);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_HOME, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_HOME, 0);
                     PostMessage(Handle_1, WM_KEYDOWN, VK_TAB, 0);
//                     PostMessage(Handle_1, WM_KEYUP, VK_TAB, 0);
                     Timer_BMoon_Elve.Enabled := True;
                  end;
               end;
            end;
         end;
      end;
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :Timer_BMoon_ElveTimer'+'---'); {$ENDIF}
   end;
end;

procedure TForm1.Timer_BMoon_MoveTimer(Sender: TObject);
begin
   try
//   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+' ---------Timer_Move ON!!!'); {$ENDIF}
      if Now_Map = map_BMoon_F0 then
         Exit;
      if (Pos_X = 15) then begin
         if (Pos_Y = 15) then begin
            PostMessage(Handle_1, WM_KEYDOWN, VK_RIGHT, 0);
//            PostMessage(Handle_1, WM_KEYUP, VK_RIGHT, 0);
         end else
         if (Pos_Y < 15) then begin
            PostMessage(Handle_1, WM_KEYDOWN, VK_DOWN, 0);
//            PostMessage(Handle_1, WM_KEYUP, VK_DOWN, 0);
         end else
         if (Pos_Y > 15) then begin
            PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//            PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
         end;
      end else
      if (Pos_X = 25) then begin
         if (Pos_Y < 25) then begin
            PostMessage(Handle_1, WM_KEYDOWN, VK_DOWN, 0);
//            PostMessage(Handle_1, WM_KEYUP, VK_DOWN, 0);
         end else
         if (Pos_Y = 25) then begin
            PostMessage(Handle_1, WM_KEYDOWN, VK_LEFT, 0);
//            PostMessage(Handle_1, WM_KEYUP, VK_LEFT, 0);
         end else
         if (Pos_Y > 25) then begin
            PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//            PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
         end;
      end else
      if (Pos_X < 15) then begin
            PostMessage(Handle_1, WM_KEYDOWN, VK_RIGHT, 0);
//            PostMessage(Handle_1, WM_KEYUP, VK_RIGHT, 0);
      end else
      if (Pos_X > 15) and (Pos_X < 20) then begin
         if (Pos_Y = 15) then begin
            PostMessage(Handle_1, WM_KEYDOWN, VK_RIGHT, 0);
//            PostMessage(Handle_1, WM_KEYUP, VK_RIGHT, 0);
         end else
         if (Pos_Y = 25) then begin
            PostMessage(Handle_1, WM_KEYDOWN, VK_LEFT, 0);
//            PostMessage(Handle_1, WM_KEYUP, VK_LEFT, 0);
         end else
         if (Pos_Y < 15) then begin
            PostMessage(Handle_1, WM_KEYDOWN, VK_DOWN, 0);
//            PostMessage(Handle_1, WM_KEYUP, VK_DOWN, 0);
         end else
         if (Pos_Y > 25) then begin
            PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//            PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
         end else
         if (Pos_Y > 15) and (Pos_Y <= 20) then begin
            if (Pos_X - 15) > (Pos_Y - 15) then begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//               PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
            end else
            begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_LEFT, 0);
//               PostMessage(Handle_1, WM_KEYUP, VK_LEFT, 0);
            end;
         end else
         if (Pos_Y > 20) and (Pos_Y < 25) then begin
            if (Pos_X - 15) > (25 - Pos_Y) then begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_DOWN, 0);
//               PostMessage(Handle_1, WM_KEYUP, VK_DOWN, 0);
            end else
            begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_LEFT, 0);
//               PostMessage(Handle_1, WM_KEYUP, VK_LEFT, 0);
            end;
         end;
      end else
      if (Pos_X >= 20) and (Pos_X < 25) then begin
         if (Pos_Y = 15) then begin
            PostMessage(Handle_1, WM_KEYDOWN, VK_RIGHT, 0);
//            PostMessage(Handle_1, WM_KEYUP, VK_RIGHT, 0);
         end else
         if (Pos_Y = 25) then begin
            PostMessage(Handle_1, WM_KEYDOWN, VK_LEFT, 0);
//            PostMessage(Handle_1, WM_KEYUP, VK_LEFT, 0);
         end else
         if (Pos_Y < 15) then begin
            PostMessage(Handle_1, WM_KEYDOWN, VK_DOWN, 0);
//            PostMessage(Handle_1, WM_KEYUP, VK_DOWN, 0);
         end else
         if (Pos_Y > 25) then begin
            PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//            PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
         end else
         if (Pos_Y > 15) and (Pos_Y <= 20) then begin
            if (25 - Pos_X) > (Pos_Y - 15) then begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_UP, 0);
//               PostMessage(Handle_1, WM_KEYUP, VK_UP, 0);
            end else
            begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_RIGHT, 0);
//               PostMessage(Handle_1, WM_KEYUP, VK_RIGHT, 0);
            end;
         end else
         if (Pos_Y > 20) and (Pos_Y < 25) then begin
            if (25 - Pos_X) > (25 - Pos_Y) then begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_DOWN, 0);
//               PostMessage(Handle_1, WM_KEYUP, VK_DOWN, 0);
            end else
            begin
               PostMessage(Handle_1, WM_KEYDOWN, VK_RIGHT, 0);
//               PostMessage(Handle_1, WM_KEYUP, VK_RIGHT, 0);
            end;
         end;
      end else
      if (Pos_X > 25) then begin
            PostMessage(Handle_1, WM_KEYDOWN, VK_LEFT, 0);
//            PostMessage(Handle_1, WM_KEYUP, VK_LEFT, 0);
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
