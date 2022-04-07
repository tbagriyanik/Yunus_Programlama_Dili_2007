object Form16: TForm16
  Left = 589
  Top = 259
  Width = 226
  Height = 227
  BorderStyle = bsSizeToolWin
  Caption = 'Breakpoint Listesi'
  Color = clBtnFace
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object ListView1: TListView
    Left = 0
    Top = 0
    Width = 218
    Height = 200
    Align = alClient
    BevelOuter = bvNone
    BevelKind = bkTile
    Columns = <
      item
        Caption = 'Sat'#305'r'
        Width = 100
      end
      item
        AutoSize = True
        Caption = 'Dosya Ad'#305
      end>
    ColumnClick = False
    FlatScrollBars = True
    GridLines = True
    ReadOnly = True
    RowSelect = True
    PopupMenu = PopupMenu1
    SortType = stBoth
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = Dzenle1Click
    OnKeyDown = ListView1KeyDown
  end
  object PopupMenu1: TPopupMenu
    Images = Form2.ImageList3
    OnPopup = PopupMenu1Popup
    Left = 24
    Top = 96
    object Ekle1: TMenuItem
      Caption = 'Ekle'
      ImageIndex = 22
      ShortCut = 45
      OnClick = Ekle1Click
    end
    object Dzenle1: TMenuItem
      Caption = 'D'#252'zenle'
      ImageIndex = 25
      ShortCut = 13
      OnClick = Dzenle1Click
    end
    object Git1: TMenuItem
      Caption = 'Git'
      OnClick = Git1Click
    end
    object Sil1: TMenuItem
      Caption = 'Sil'
      ImageIndex = 19
      ShortCut = 46
      OnClick = Sil1Click
    end
    object mnSil1: TMenuItem
      Caption = 'T'#252'm'#252'n'#252' Sil'
      OnClick = mnSil1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object StayonTop1: TMenuItem
      AutoCheck = True
      Caption = 'Stay on Top'
      OnClick = StayonTop1Click
    end
    object Kapat1: TMenuItem
      Caption = 'Kapat'
      ShortCut = 27
      OnClick = Kapat1Click
    end
  end
end
