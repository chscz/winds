program ³ëµ¿;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {DDD};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDDD, DDD1);
//  Application.CreateForm(TDDD1, DDD1);
  Application.Run;
end.
