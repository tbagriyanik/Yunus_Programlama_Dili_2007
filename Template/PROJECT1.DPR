program Project1;

uses
  Forms,
  UNIT1 in 'UNIT1.PAS' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
