program Program2;

uses
  Vcl.Forms,
  ufrmProgram2 in 'ufrmProgram2.pas' {frmProgram2},
  ufrmProg2Form2 in 'ufrmProg2Form2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmProgram2, frmProgram2);
  Application.Run;
end.
