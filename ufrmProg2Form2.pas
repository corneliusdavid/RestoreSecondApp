unit ufrmProg2Form2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.AppEvnts, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
  private
    const
      BRINGTOFRONT_MESSAGE = WM_APP + 100;

    procedure BringToFrontMessage(var Msg: TMessage); message BRINGTOFRONT_MESSAGE;
    procedure RestoreSelf;
    procedure BringSelfToFront;
  public
    procedure RestoreForm;
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

{ TForm2 }

procedure TForm2.BringSelfToFront;
begin
  // this doesn't help if the app is minimized but it does bring the app to front otherwise
  FormStyle := fsStayOnTop;
  FormStyle := fsNormal;
end;

procedure TForm2.RestoreSelf;
begin
  WindowState := wsNormal;
end;

procedure TForm2.BringToFrontMessage(var Msg: TMessage);
begin
  OutputDebugString('message event trapped');
  RestoreSelf;
  BringSelfToFront;
  OutputDebugString('message event handled');
end;

procedure TForm2.RestoreForm;
begin
  RestoreSelf;
  BringSelfToFront;
end;

end.
