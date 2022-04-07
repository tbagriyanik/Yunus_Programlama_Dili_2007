object Form8: TForm8
  Left = 262
  Top = 330
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Derleme Penceresi'
  ClientHeight = 158
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 140
    Top = 128
    Width = 75
    Height = 25
    Caption = '&Tamam'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Panel1: TPanel
    Left = 6
    Top = 8
    Width = 345
    Height = 112
    TabOrder = 1
    object StaticText1: TStaticText
      Left = 10
      Top = 9
      Width = 327
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'Proje:'
      TabOrder = 0
    end
    object StaticText2: TStaticText
      Left = 10
      Top = 35
      Width = 327
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'Tamamland'#305'.'
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object StaticText3: TStaticText
      Left = 10
      Top = 61
      Width = 327
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'Hata say'#305's'#305':'
      TabOrder = 2
    end
    object StaticText4: TStaticText
      Left = 10
      Top = 85
      Width = 327
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'Toplam sat'#305'r:'
      TabOrder = 3
    end
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 131
    Width = 129
    Height = 17
    Caption = 'Hata Penceresi'
    TabOrder = 2
  end
end
