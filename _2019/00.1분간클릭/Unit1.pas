unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Timer1: TTimer;
    Timer2: TTimer;
    Label1: TLabel;
    Timer3: TTimer;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
   Button1.Caption := '클릭중..';
   Button1.Enabled := False;
   Button2.Enabled := True;
   Timer1.Enabled := True;
   Timer2.Enabled := True;
   Timer3.Enabled := True;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   Button1.Enabled := True;
   Button2.Enabled := False;
   Timer1.Enabled := False;
   Timer2.Enabled := False;
   Timer3.Enabled := False;
   Button1.Caption := '대기중';
   Label1.Caption := '65';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   mouse_event(MOUSEEVENTF_LEFTDOWN, 0,0,0,0);
   mouse_event(MOUSEEVENTF_LEFTUP, 0,0,0,0);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
   Button1.Enabled := True;
   Button2.Enabled := False;
   Timer1.Enabled := False;
   Timer2.Enabled := False;
   Timer3.Enabled := False;
   Button1.Caption := '대기중';
   Label1.Caption := '65';
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
   Label1.Caption := InttoStr(StrToInt(Label1.Caption) - 1);
end;

end.
