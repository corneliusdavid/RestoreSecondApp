program Program1;

uses
  Vcl.Forms,
  frmProgram1 in 'frmProgram1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
