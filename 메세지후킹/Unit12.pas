unit Unit12;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls
//  , Unit2
  ;

const
   WM_KeyEvent             =  WM_USER + 0922;
   SetWinTitle             = $1;
   SetWinTitle_Back        = $2;

type
  TForm12 = class(TForm)
    btn1: TButton;
    btn2: TButton;
    Panel1: TPanel;
    WinTitleCaption1: TEdit;
    WinTitleCaption2: TEdit;
    WinTitleCaption3: TEdit;
    WinTitleCaption4: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit99: TEdit;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SetWindowTitle(Sender: TObject);
    procedure WM_KeyEvent(var Message: TMessage); message WM_KeyEvent;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

function HookKB: Boolean; external 'simplehook.dll';
function UnHookKB: Boolean; external 'simplehook.dll';
Procedure SendHandle(MyHandle: HWND); external 'simplehook.dll';



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

procedure TForm12.SetWindowTitle(Sender: TObject);
var
   FHandle : THandle;
begin
   FHandle := GetForegroundWindow;
   case (Sender as TButton).Tag of
      1:SetWindowText(FHandle,WinTitleCaption1.Text);
      2:SetWindowText(FHandle,WinTitleCaption2.Text);
      3:SetWindowText(FHandle,WinTitleCaption3.Text);
      4:SetWindowText(FHandle,WinTitleCaption4.Text);
   end;

end;

procedure TForm12.WM_KeyEvent(var Message: TMessage);
var
   EventCode : Integer;
   FHandle : THandle;
begin
   EventCode := Message.WParam;
   case EventCode of
      SetWinTitle : begin
         FHandle := GetForegroundWindow;
         case Message.LParam of
            1:SetWindowText(FHandle,WinTitleCaption1.Text);
            2:SetWindowText(FHandle,WinTitleCaption2.Text);
            3:SetWindowText(FHandle,WinTitleCaption3.Text);
            4:SetWindowText(FHandle,WinTitleCaption4.Text);
         end;
      end;
      SetWinTitle_Back : begin
         showmessage('WM_KeyEvent : SetWinTitle_Back');
      end;

   end;
end;

procedure TForm12.FormCreate(Sender: TObject);
var
   tmpHandle :  THandle;
   String_1  : String;
   String_2  : String;
   String_3  : String;
   String_4  : String;
begin
   String_1 := 'Windows 7 x64 - VMware Workstation';
   String_2 := '������';

   tmpHandle:=FindWindow(nil, PChar(String_2));

   if Edit99.Text <> '' then
      SendHandle(self.Handle)
   else
      SendHandle(self.Handle);
   SetWindowText(tmpHandle,String_1);

end;



end.
