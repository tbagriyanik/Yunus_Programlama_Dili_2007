object Form18: TForm18
  Left = 302
  Top = 156
  BorderStyle = bsNone
  Caption = 'Form18'
  ClientHeight = 220
  ClientWidth = 344
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object ColorBox1: TColorBox
    Left = 32
    Top = 64
    Width = 145
    Height = 22
    Selected = clAqua
    ItemHeight = 16
    TabOrder = 0
    Visible = False
  end
  object ColorBox2: TColorBox
    Left = 32
    Top = 104
    Width = 145
    Height = 22
    DefaultColorColor = clMaroon
    Selected = clBlue
    ItemHeight = 16
    TabOrder = 1
    Visible = False
  end
end
