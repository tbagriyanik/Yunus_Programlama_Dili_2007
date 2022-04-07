object FastLineSeriesEditor: TFastLineSeriesEditor
  Left = 297
  Top = 155
  ActiveControl = BLinePen
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  ClientHeight = 45
  ClientWidth = 153
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SHColor: TShape
    Left = 108
    Top = 12
    Width = 25
    Height = 25
    OnMouseUp = SHColorMouseUp
  end
  object BLinePen: TButton
    Left = 12
    Top = 12
    Width = 89
    Height = 25
    HelpContext = 275
    Caption = '&Border...'
    TabOrder = 0
    OnClick = BLinePenClick
  end
end
