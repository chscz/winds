unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Timer1: TTimer;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
   Button1.Enabled := False;
   Button2.Enabled := True;
   Timer1.Enabled := True;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   Button1.Enabled := True;
   Button2.Enabled := False;
   Timer1.Enabled := False;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   Label1.Caption := '처음에 ON 누르면 5초 뒤부터 시작되고'+#13#10+
                     '31분마다 [O]누르고 [ENTER]누름'+#13#10+
                     '** 관리자권한 실행 꼭 하고 **';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   Timer1.Interval := 1000*31;
   keybd_event(VkKeyScan('o'),0,0,0);
   Sleep(2000);
   keybd_event(VK_RETURN,0,0,0);
end;

end.
