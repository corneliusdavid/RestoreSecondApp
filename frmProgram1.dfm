object Form1: TForm1
  Left = 213
  Top = 165
  Caption = 'Program 1'
  ClientHeight = 357
  ClientWidth = 479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 152
    Top = 96
    Width = 147
    Height = 49
    Caption = 'Launch Program 2'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 80
    Top = 151
    Width = 297
    Height = 49
    Caption = 'Activate Program 2 (ShowWindow, SetForeground)'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 80
    Top = 206
    Width = 297
    Height = 49
    Caption = 'Activate Program 2 (PostMessage)'
    TabOrder = 2
    OnClick = Button3Click
  end
end
