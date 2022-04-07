object Form11: TForm11
  Left = 247
  Top = 148
  BorderStyle = bsDialog
  Caption = 'Metin Liste Yaz'#305'm'#305
  ClientHeight = 265
  ClientWidth = 323
  Color = clBtnFace
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 231
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Button1: TButton
    Left = 140
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Tamam'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 236
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Vazge'#231
    TabOrder = 1
    OnClick = Button2Click
  end
  object Panel1: TPanel
    Left = 6
    Top = 7
    Width = 311
    Height = 215
    BorderStyle = bsSingle
    Caption = 'Panel1'
    TabOrder = 2
    object RichEdit1: TRichEdit
      Left = 1
      Top = 1
      Width = 305
      Height = 209
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      PopupMenu = PopupMenu1
      ScrollBars = ssBoth
      TabOrder = 0
      WordWrap = False
      OnChange = RichEdit1Change
    end
  end
  object PopupMenu1: TPopupMenu
    Images = Form2.ImageList3
    OnPopup = PopupMenu1Popup
    Left = 32
    Top = 149
    object GeriAl1: TMenuItem
      Caption = 'Geri Al'
      ImageIndex = 3
      ShortCut = 16474
      OnClick = GeriAl1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Kes2: TMenuItem
      Caption = '&Kes'
      ImageIndex = 0
      ShortCut = 16472
      OnClick = Kes2Click
    end
    object Kopyala2: TMenuItem
      Caption = 'K&opyala'
      ImageIndex = 1
      ShortCut = 16451
      OnClick = Kopyala2Click
    end
    object Yaptr2: TMenuItem
      Caption = '&Yap'#305#351't'#305'r'
      ImageIndex = 2
      ShortCut = 16470
      OnClick = Yaptr2Click
    end
    object Sil2: TMenuItem
      Caption = '&Sil'
      ImageIndex = 5
      OnClick = Sil2Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object TmnSe2: TMenuItem
      Caption = '&T'#252'm'#252'n'#252' Se'#231
      ShortCut = 16449
      OnClick = TmnSe2Click
    end
    object DosyadanYkle1: TMenuItem
      Caption = 'Dosyadan Y'#252'kle'
      OnClick = DosyadanYkle1Click
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'proje'
    Filter = 'Proje (*.proje)|*.proje|T'#252'm Dosyalar (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofFileMustExist, ofNoNetworkButton, ofNoDereferenceLinks, ofEnableSizing]
    Title = 'Proje A'#231
    Left = 112
    Top = 152
  end
end
