unit Unit12;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm12 = class(TForm)
    btn1: TButton;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function HookKB: Boolean; external 'simplehook.dll';
function UnHookKB: Boolean; external 'simplehook.dll';

var
  Form12: TForm12;

implementation

{$R *.dfm}

procedure TForm12.btn1Click(Sender: TObject);
begin
    HookKB;
end;

procedure TForm12.btn2Click(Sender: TObject);
begin
    UnHookKB;
end;

end.
