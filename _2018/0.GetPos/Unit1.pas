unit Unit1;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics,
   Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls
   ,ImageRecognitionDefs, Vcl.ComCtrls, Vcl.ImgList
   ;

type
   TForm1 = class(TForm)
      Button1: TButton;
      Image1: TImage;
    bb: TEdit;
    aa: TEdit;
      Panel1: TPanel;
      Label1: TLabel;
      Label2: TLabel;
      Panel2: TPanel;
      Label3: TLabel;
      Label4: TLabel;
    dd: TEdit;
    cc: TEdit;
      edit1: TEdit;
      Image2: TImage;
      Button2: TButton;
    Image_0: TImage;
    Image_1: TImage;
    Image_2: TImage;
    Image_3: TImage;
    Image_4: TImage;
    Image_5: TImage;
    Image_6: TImage;
    Image_7: TImage;
    Image_8: TImage;
    Image_9: TImage;
    Image_Test: TImage;
    ComboBox1: TComboBox;
    Label5: TLabel;
    ImageList1: TImageList;
    ImageList2: TImageList;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    OpenDialog1: TOpenDialog;
    Image3: TImage;
    Button6: TButton;
    ImageList3: TImageList;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
      procedure Button1Click(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure Button2Click(Sender: TObject);
      function SearchBitmap1(bmSub: TBitMap): Boolean;
    procedure EnterKeyPress(Sender: TObject; var Key: Char);
    function TransColor_0(TransBmp:TBitmap):Tbitmap;
    function TransColor_1(TransBmp:TBitmap):Tbitmap;
    function TransColor_2(TransBmp:TBitmap):Tbitmap;
    function TransColor_Test(TransBmp:TBitmap):Tbitmap;
    procedure edit1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);


   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   Form1: TForm1;
   btm: TBitMap;
   tbmp: TBitMap;
   bmp_0,bmp_1,bmp_2,bmp_3,bmp_4,bmp_5,bmp_6,bmp_7,bmp_8,bmp_9 : TBitMap;

   LocalDir : WideString;

   Before_Image : TBitmap;
   After_Image : TBitmap;

implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
var
   aHandle: THandle;
   aDC: HDC;

   aRect, bRect: TRect;
   X, Y: Integer;
   BorderThick: Integer;
   aBitmap: TBitMap;

   aaa, bbb, ccc, ddd: Integer;
   winplace: TWindowPlacement;
begin
   aHandle := FindWindow(nil, PChar(edit1.Text));
//   aHandle := FindWindow(nil, PChar('다마살보'));   //ezHelpManager Ver. 2.0.5.7
   if aHandle = 0 then
      Exit;

   FillChar(winplace, sizeof(winplace), 0);
   winplace.length := sizeof(winplace);

   GetWindowPlacement(aHandle, @winplace);
   case winplace.showCmd of
      SW_HIDE, SW_SHOWMINIMIZED:
         begin
            MessageDlg('최소화하지마라ㅡㅡ', mtWarning, [mbOK], 0);
            Exit;
         end;
   end;
                                    //X:914 737 28 14    914 737 12 14  923 737 12 14  931 737 12 14
                                    //Y:970 737 30 14    970 737 12 14  980 737 12 14  989 737 12 14
   // aDC := GetWindowDC(THandle);
   GetWindowRect(aHandle, aRect);

   aaa := StrToInt(aa.Text);
   bbb := StrToInt(bb.Text);
   ccc := StrToInt(cc.Text);
   ddd := StrToInt(dd.Text);

   btm := TBitMap.Create;
   try

//      btm.PixelFormat := pf24bit; //??
      // 비트맵 크기 맞춤
      btm.Width := aRect.Width;
      btm.Height := aRect.Height;

      btm.Width := ccc;
      btm.Height := ddd;
//      btm.Width := 12;
//      btm.Height := 14;
      // 최상위 윈도우의 DC를 가져옴
      aDC := GetDC(aHandle); // 창 내부만
      // aDC := GetWindowDC(aHandle);   //창 테두리 포함
      // 일단 그려주고
//       Bitblt(btm.Canvas.Handle,0,0,btm.Width,btm.Height,aDC,0,0,SRCCOPY); //BLACKNESS   WHITENESS
      // Bitblt(btm.Canvas.Handle,캔버스시작X, 캔버스시작Y, 캡쳐이미지width, 캡쳐이미지height, aDC, 캡쳐이미지시작X, 캡쳐이미지시작Y, SRCCOPY);
      Bitblt(btm.Canvas.Handle, 0, 0, ccc, ddd, aDC, aaa, bbb, SRCCOPY);
{      case ComboBox1.ItemIndex of
         0: Bitblt(btm.Canvas.Handle, 0, 0, 12, 14, aDC, 914, 737, SRCCOPY);
         1: Bitblt(btm.Canvas.Handle, 0, 0, 12, 14, aDC, 923, 737, SRCCOPY);
         2: Bitblt(btm.Canvas.Handle, 0, 0, 12, 14, aDC, 931, 737, SRCCOPY);
         3: Bitblt(btm.Canvas.Handle, 0, 0, 12, 14, aDC, 970, 737, SRCCOPY);
         4: Bitblt(btm.Canvas.Handle, 0, 0, 12, 14, aDC, 980, 737, SRCCOPY);
         5: Bitblt(btm.Canvas.Handle, 0, 0, 12, 14, aDC, 989, 737, SRCCOPY);
      end;}
      Image1.Height := btm.Height;
      Image1.Width := btm.Width;

//      btm := TransColor(btm);
      Image1.picture := TPicture(btm);


      { // 테두리 영역의 크기를 구하고 전체화면에서 클라이언트 영역의 위치계산 (좀 더 스마트한 방법은 없을까...)
        //      BorderThick:=(wRect.Right-wRect.Left-cRect.Right) div 2;
        //      X:=wRect.Left+BorderThick;
        //      Y:=wRect.Top+((wRect.Bottom-wRect.Top-cRect.Bottom))-BorderThick;
        BorderThick:=(aRect.Right-aRect.Left) div 2;
        X:=aRect.Left+BorderThick;
        Y:=aRect.Top+((aRect.Bottom-aRect.Top))-BorderThick;
        // 전체화면에 최상위 윈도우의 화면을 덧그려줌
        Bitblt(aBitmap.Canvas.Handle,X,Y,btm.Width,btm.Height,btm.Canvas.Handle,0,0,SRCCOPY); }
   finally
//      FreeAndNil(btm);
      ReleaseDC(aHandle, aDC);
      // CloseHandle(aHandle);
      Button3.Enabled := True;
      Button7.Enabled := True;
      Button8.Enabled := True;
      Button9.Enabled := True;
   end;
end;

function TForm1.SearchBitmap1(bmSub: TBitMap): Boolean;
type
   TIntArray = array [word] of Integer;
   PIntArray = ^TIntArray;
var
   bmMain: TBitMap;
   p0, p1, p2: PIntArray;
   X, Y: Integer;
   x1, y1, w, w0, w1, k: Integer;
   b: Boolean;
begin
   Result := True;
   bmMain := TBitMap.Create;
   bmMain := btm;

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
end;

procedure TForm1.EnterKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      Button1Click(button1);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   if SearchBitmap1(bmp_0) then
      Label5.Caption := '0'
   else if SearchBitmap1(bmp_1) then
      Label5.Caption := '1'
   else if SearchBitmap1(bmp_2) then
      Label5.Caption := '2'
   else if SearchBitmap1(bmp_3) then
      Label5.Caption := '3'
   else if SearchBitmap1(bmp_4) then
      Label5.Caption := '4'
   else if SearchBitmap1(bmp_5) then
      Label5.Caption := '5'
   else if SearchBitmap1(bmp_6) then
      Label5.Caption := '6'
   else if SearchBitmap1(bmp_7) then
      Label5.Caption := '7'
   else if SearchBitmap1(bmp_8) then
      Label5.Caption := '8'
   else if SearchBitmap1(bmp_9) then
      Label5.Caption := '9'
   else
      Label5.Caption := '엥';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   if not (btm = nil) then
      btm.SaveToFile('c:\'+edit1.Text+ FormatDateTime('_YYMMDD_HHNNSS',now)+'.bmp');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
   showmessage('어둠: 327 372 20 10'+#13#10+
              '맵명: 415   5 20 10'
   );
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
   case ComboBox1.ItemIndex of
      1: begin
         aa.Text := '914';
         bb.Text := '737';
         cc.Text := '12';
         dd.Text := '14';
      end;
      2: begin
         aa.Text := '923';
         bb.Text := '737';
         cc.Text := '12';
         dd.Text := '14';
      end;
      3: begin
         aa.Text := '931';
         bb.Text := '737';
         cc.Text := '12';
         dd.Text := '14';
      end;
      4: begin
         aa.Text := '970';
         bb.Text := '737';
         cc.Text := '12';
         dd.Text := '14';
      end;
      5: begin
         aa.Text := '980';
         bb.Text := '737';
         cc.Text := '12';
         dd.Text := '14';
      end;
      6: begin
         aa.Text := '989';
         bb.Text := '737';
         cc.Text := '12';
         dd.Text := '14';
      end;
      7: begin
         aa.Text := '400';
         bb.Text := '10';
         cc.Text := '38';
         dd.Text := '5';
      end;
      8: begin
         aa.Text := '327';
         bb.Text := '372';
         cc.Text := '17';
         dd.Text := '7';
      end;
      9: begin
         aa.Text := '327';
         bb.Text := '347';
         cc.Text := '17';
         dd.Text := '7';
      end;
   end;
end;

procedure TForm1.edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      Button1Click(Button1);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   bmp_0 := TBitMap.Create;
   bmp_1 := TBitMap.Create;
   bmp_2 := TBitMap.Create;
   bmp_3 := TBitMap.Create;
   bmp_4 := TBitMap.Create;
   bmp_5 := TBitMap.Create;
   bmp_6 := TBitMap.Create;
   bmp_7 := TBitMap.Create;
   bmp_8 := TBitMap.Create;
   bmp_9 := TBitMap.Create;

   ImageList1.GetBitmap(0,bmp_0);
   ImageList1.GetBitmap(1,bmp_1);
   ImageList1.GetBitmap(2,bmp_2);
   ImageList1.GetBitmap(3,bmp_3);
   ImageList1.GetBitmap(4,bmp_4);
   ImageList1.GetBitmap(5,bmp_5);
   ImageList1.GetBitmap(6,bmp_6);
   ImageList1.GetBitmap(7,bmp_7);
   ImageList1.GetBitmap(8,bmp_8);
   ImageList1.GetBitmap(9,bmp_9);


//   ImageList1.

{
   LocalDir := ExtractFilePath(Application.ExeName)+'\Image\NumSrc\Small2\';
   bmp_1.LoadFromFile(LocalDir+'1.bmp');
   bmp_2.LoadFromFile(LocalDir+'2.bmp');
   bmp_3.LoadFromFile(LocalDir+'3.bmp');
   bmp_4.LoadFromFile(LocalDir+'4.bmp');
   bmp_5.LoadFromFile(LocalDir+'5.bmp');
   bmp_6.LoadFromFile(LocalDir+'6.bmp');
   bmp_7.LoadFromFile(LocalDir+'7.bmp');
   bmp_8.LoadFromFile(LocalDir+'8.bmp');
   bmp_9.LoadFromFile(LocalDir+'9.bmp');

   bmp_0 := TransColor(bmp_0);
   bmp_1 := TransColor(bmp_1);
   bmp_2 := TransColor(bmp_2);
   bmp_3 := TransColor(bmp_3);
   bmp_4 := TransColor(bmp_4);
   bmp_5 := TransColor(bmp_5);
   bmp_6 := TransColor(bmp_6);
   bmp_7 := TransColor(bmp_7);
   bmp_8 := TransColor(bmp_8);
   bmp_9 := TransColor(bmp_9);

   bmp_0.SaveToFile('E:\ImageS\ScreenCapture(4)\Win32\Debug\Image\NumSrc\trans\0.bmp');
   bmp_1.SaveToFile('E:\ImageS\ScreenCapture(4)\Win32\Debug\Image\NumSrc\trans\1.bmp');
   bmp_2.SaveToFile('E:\ImageS\ScreenCapture(4)\Win32\Debug\Image\NumSrc\trans\2.bmp');
   bmp_3.SaveToFile('E:\ImageS\ScreenCapture(4)\Win32\Debug\Image\NumSrc\trans\3.bmp');
   bmp_4.SaveToFile('E:\ImageS\ScreenCapture(4)\Win32\Debug\Image\NumSrc\trans\4.bmp');
   bmp_5.SaveToFile('E:\ImageS\ScreenCapture(4)\Win32\Debug\Image\NumSrc\trans\5.bmp');
   bmp_6.SaveToFile('E:\ImageS\ScreenCapture(4)\Win32\Debug\Image\NumSrc\trans\6.bmp');
   bmp_7.SaveToFile('E:\ImageS\ScreenCapture(4)\Win32\Debug\Image\NumSrc\trans\7.bmp');
   bmp_8.SaveToFile('E:\ImageS\ScreenCapture(4)\Win32\Debug\Image\NumSrc\trans\8.bmp');
   bmp_9.SaveToFile('E:\ImageS\ScreenCapture(4)\Win32\Debug\Image\NumSrc\trans\9.bmp');
}
   Image_0.picture := TPicture(bmp_0);
   Image_1.picture := TPicture(bmp_1);
   Image_2.picture := TPicture(bmp_2);
   Image_3.picture := TPicture(bmp_3);
   Image_4.picture := TPicture(bmp_4);
   Image_5.picture := TPicture(bmp_5);
   Image_6.picture := TPicture(bmp_6);
   Image_7.picture := TPicture(bmp_7);
   Image_8.picture := TPicture(bmp_8);
   Image_9.picture := TPicture(bmp_9);

   tbmp := TBitMap.Create;
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

function TForm1.TransColor_2(TransBmp: TBitmap): Tbitmap;
//허풍
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

//            if TransBmp.Canvas.Pixels[ Lx, Ly ] >= $00A4A7AB then
            if TransBmp.Canvas.Pixels[ Lx, Ly ] >= $0084A7AB then
               TransBmp.Canvas.Pixels[ Lx, Ly ] := $00FFFFFF
            else
               TransBmp.Canvas.Pixels[ Lx, Ly ] := $00000000
         end;
      end;
      result := TransBmp;
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :TransColor_test'+'---'); {$ENDIF}
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

//            if TransBmp.Canvas.Pixels[ Lx, Ly ] >= $00A4A7AB then
            if TransBmp.Canvas.Pixels[ Lx, Ly ] >= $0084A7AB then
               TransBmp.Canvas.Pixels[ Lx, Ly ] := $00FFFFFF
            else
               TransBmp.Canvas.Pixels[ Lx, Ly ] := $00000000
         end;
      end;
      result := TransBmp;
   except
   {$IFDEF _LOG_} memo1.Lines.Add(FormatDateTime('HH:NN:SS ZZZ ',now)+'[Except] :TransColor_test'+'---'); {$ENDIF}
   end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
//   if OpenDialog1.Execute(Self.Handle) then
//   begin
      Before_Image := TBitmap.Create;
//      Before_Image.Width := 7;
//      Before_Image.Height := 7;
//      Before_Image.LoadFromFile(OpenDialog1.FileName);
      Before_Image.LoadFromFile('F:\_Source\5.감지\Image\111.bmp');
      After_Image := TransColor_Test(Before_Image);
      Image3.Picture := TPicture(After_Image);
//   end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
   After_Image.SaveToFile('F:\_Source\5.감지\Image\111_____.bmp');
end;

procedure TForm1.Button7Click(Sender: TObject);
var
   tbmp_0 : Tbitmap;
begin
   if not (btm = nil) then
   begin
      tbmp_0 := TBitmap.Create;
      tbmp_0 := TransColor_0(btm);
      tbmp_0.SaveToFile('c:\'+edit1.Text+ FormatDateTime('_YYMMDD_HHNNSS',now)+'_TC0.bmp');
   end;
end;

procedure TForm1.Button8Click(Sender: TObject);
var
   tbmp_2 : Tbitmap;
begin
   if not (btm = nil) then
   begin
      tbmp_2 := TBitmap.Create;
      tbmp_2 := TransColor_2(btm);
      tbmp_2.SaveToFile('c:\'+edit1.Text+ FormatDateTime('_YYMMDD_HHNNSS',now)+'_TC2.bmp');
   end;
end;

procedure TForm1.Button9Click(Sender: TObject);
var
   tbmp_1 : Tbitmap;
begin
   if not (btm = nil) then
   begin
      tbmp_1 := TBitmap.Create;
      tbmp_1 := TransColor_1(btm);
      tbmp_1.SaveToFile('c:\'+edit1.Text+ FormatDateTime('_YYMMDD_HHNNSS',now)+'_TC1.bmp');
   end;
end;

end.
