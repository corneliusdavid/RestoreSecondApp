unit frmProgram1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    const
      BRINGTOFRONT_MESSAGE = WM_APP + 100;
    function GetWindowHandle(const WindowName: string): HWnd;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  ShellAPI;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar('Program2.exe'), nil, nil, SW_SHOW);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Prg2Handle: HWnd;
begin
  Prg2Handle := GetWindowHandle('Program 2');

  if Prg2Handle = 0 then
    ShowMessage('Program 2 is not running.')
  else begin
    ShowWindow(Prg2Handle, SW_RESTORE);
    SetForegroundWindow(Prg2Handle);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  Prg2Handle: HWnd;
begin
  Prg2Handle := GetWindowHandle('Program 2');

  if Prg2Handle = 0 then
    ShowMessage('Program 2 is not running.')
  else begin
    PostMessage(Prg2Handle, BRINGTOFRONT_MESSAGE, 0, 0);
  end;
end;

function TForm1.GetWindowHandle(const WindowName: string): HWnd;
var
  HCurrWindow: HWnd;
  WndText: string;
  TextLen: Longint;
begin
  Result := 0;
  HCurrWindow := GetWindow(Handle, GW_HWNDFIRST);
  while HCurrWindow <> 0 do begin
    TextLen := GetWindowTextLength(HCurrWindow) + 1;
    if TextLen >= Length(WindowName) then begin
      SetLength(WndText, TextLen - 1);
      GetWindowText(HCurrWindow, PChar(WndText), TextLen);
      if WndText = WindowName then begin
        Result := HCurrWindow;
        Break;
      end;
    end;
    HCurrWindow := GetWindow(HCurrWindow, GW_HWNDNEXT);
  end;
end;

end.
