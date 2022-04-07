object Form12: TForm12
  Left = 382
  Top = 199
  BorderStyle = bsDialog
  Caption = 'Ara'#231'lar Se'#231'enekleri'
  ClientHeight = 215
  ClientWidth = 303
  Color = clBtnFace
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 227
    Top = 8
    Width = 70
    Height = 25
    Caption = '&Ekle'
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000C40E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD000DDDDDDDDDDDDD000DDD
      DDDDDDDDDD000DDDDDDDDDD000000000DDDDDDD000000000DDDDDDD000000000
      DDDDDDDDDD000DDDDDDDDDDDDD000DDDDDDDDDDDDD000DDDDDDDDDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 227
    Top = 40
    Width = 70
    Height = 25
    Caption = '&Sil'
    Enabled = False
    Glyph.Data = {
      1E010000424D1E010000000000007600000028000000110000000E0000000100
      040000000000A8000000C40E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
      DDDDD0000000DDDDDDDDDDDDDDDDD0000000DDDDDDDDDDDDDDDDD0000000DDDD
      DDDDDDDDDDDDD0000000DDDDDDDDDDDDDDDDD0000000DDDD0000000000DDD000
      0000DDDD0000000000DDD0000000DDDD0000000000DDD0000000DDDDDDDDDDDD
      DDDDD0000000DDDDDDDDDDDDDDDDD0000000DDDDDDDDDDDDDDDDD0000000DDDD
      DDDDDDDDDDDDD0000000DDDDDDDDDDDDDDDDD0000000DDDDDDDDDDDDDDDDD000
      0000}
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 229
    Top = 184
    Width = 70
    Height = 25
    Caption = '&Kapat'
    OnClick = SpeedButton3Click
  end
  object SpeedButton4: TSpeedButton
    Left = 229
    Top = 152
    Width = 70
    Height = 25
    Caption = '&Vazge'#231
    OnClick = SpeedButton4Click
  end
  object ListView1: TListView
    Left = 3
    Top = 8
    Width = 215
    Height = 202
    BorderWidth = 1
    Columns = <>
    ColumnClick = False
    FlatScrollBars = True
    HotTrack = True
    HotTrackStyles = [htHandPoint]
    IconOptions.Arrangement = iaLeft
    IconOptions.AutoArrange = True
    PopupMenu = PopupMenu1
    TabOrder = 0
    ViewStyle = vsSmallIcon
    OnChange = ListView1Change
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Uygulama Programlar'#305' (*.exe)|*.exe|T'#252'm Dosyalar (*.*)|*.*'
    Options = [ofHideReadOnly, ofEnableSizing, ofForceShowHidden]
    Title = 'Yunus - Dosya Se'#231'imi'
    Left = 120
    Top = 88
  end
  object PopupMenu1: TPopupMenu
    Images = Form2.ImageList3
    OnPopup = PopupMenu1Popup
    Left = 120
    Top = 32
    object Ekle1: TMenuItem
      Caption = 'Ekle'
      ImageIndex = 22
      OnClick = Ekle1Click
    end
    object Sil1: TMenuItem
      Caption = 'Sil'
      ImageIndex = 19
      OnClick = Sil1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object altr1: TMenuItem
      Caption = #199'al'#305#351't'#305'r'
      OnClick = altr1Click
    end
    object Kapat1: TMenuItem
      Caption = 'Kapat'
      OnClick = Kapat1Click
    end
    object Vazge1: TMenuItem
      Caption = 'Vazge'#231
      OnClick = Vazge1Click
    end
  end
  object ImageList1: TImageList
    Left = 120
    Top = 144
  end
end
