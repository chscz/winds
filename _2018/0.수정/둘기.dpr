program µÑ±â;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {DoolGi};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDoolGi, DoolGi);
  Application.Run;
end.
