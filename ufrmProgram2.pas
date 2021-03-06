unit ufrmProgram2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.AppEvnts, Vcl.ExtCtrls,
  ufrmProg2Form2;

type
  TfrmProgram2 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Timer1: TTimer;
    ApplicationEvents1: TApplicationEvents;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    const
      BRINGTOFRONT_MESSAGE = WM_APP + 100;
    var
      ModalForm: TForm2;
    procedure RestoreSelf;
    procedure BringSelfToFront;
  end;

var
  frmProgram2: TfrmProgram2;

implementation

{$R *.dfm}


procedure TfrmProgram2.RestoreSelf;
begin
  // this restores but does not bring the app to front
  Application.Restore;
end;

procedure TfrmProgram2.BringSelfToFront;
begin
  // this doesn't help if the app is minimized but it does bring the app to front otherwise
  FormStyle := fsStayOnTop;
  FormStyle := fsNormal;
end;

procedure TfrmProgram2.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if Msg.message = BRINGTOFRONT_MESSAGE then begin
    OutputDebugString('message event trapped');

    RestoreSelf;
    BringSelfToFront;

    if Assigned(ModalForm) then
      ModalForm.RestoreToFront;

    Handled := True;

    OutputDebugString('message event handled');
  end;
end;

procedure TfrmProgram2.Button1Click(Sender: TObject);
begin
  if not assigned(ModalForm) then begin
    ModalForm := TForm2.Create(Application.MainForm);
    try
      ModalForm.ShowModal;
    finally
      ModalForm.Free;
      ModalForm := nil;
    end;
  end;
end;

procedure TfrmProgram2.Button2Click(Sender: TObject);
begin
  Timer1.Enabled := True;
  OutputDebugString('restore timer started');
end;

procedure TfrmProgram2.FormCreate(Sender: TObject);
begin
  ModalForm := nil;
end;

procedure TfrmProgram2.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  OutputDebugString('timed restore launched');

  RestoreSelf;
  BringSelfToFront;
  ModalForm.RestoreToFront;

  OutputDebugString('timed restore finished');
end;

end.
