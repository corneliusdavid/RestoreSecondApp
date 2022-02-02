object frmProgram2: TfrmProgram2
  Left = 0
  Top = 0
  Caption = 'Program 2'
  ClientHeight = 330
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 126
    Height = 19
    Caption = 'This is program 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 104
    Top = 57
    Width = 161
    Height = 41
    Caption = 'Launch window'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 104
    Top = 168
    Width = 161
    Height = 49
    Caption = 'Timed restore (10 seconds)'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 280
    Top = 168
  end
  object ApplicationEvents1: TApplicationEvents
    OnMessage = ApplicationEvents1Message
    Left = 112
    Top = 256
  end
end
