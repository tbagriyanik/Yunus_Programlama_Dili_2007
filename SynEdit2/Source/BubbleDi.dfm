object BubbleSeriesEditor: TBubbleSeriesEditor
  Left = 268
  Top = 267
  ActiveControl = RGStyle
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  ClientHeight = 176
  ClientWidth = 251
  ParentFont = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RGStyle: TRadioGroup
    Left = 120
    Top = 4
    Width = 125
    Height = 165
    HelpContext = 448
    Caption = 'St&yle:'
    Items.Strings = (
      'Square'
      'Circle'
      'Triangle'
      'DownTriangle'
      'Cross'
      'DiagonalCross'
      'Star'
      'Diamond'
      'SmallDot')
    TabOrder = 3
    OnClick = RGStyleClick
  end
  object CB3dPoint: TCheckBox
    Left = 196
    Top = 20
    Width = 41
    Height = 17
    HelpContext = 190
    Caption = '&3D'
    TabOrder = 0
    OnClick = CB3dPointClick
  end
  object CBInflate: TCheckBox
    Left = 8
    Top = 8
    Width = 109
    Height = 17
    HelpContext = 249
    Caption = 'Inflate &Margins'
    TabOrder = 1
    OnClick = CBInflateClick
  end
  object BPoinPenCol: TBitBtn
    Left = 8
    Top = 36
    Width = 75
    Height = 25
    HelpContext = 379
    Caption = '&Border...'
    TabOrder = 2
    OnClick = BPoinPenColClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 92
    Width = 105
    Height = 77
    TabOrder = 4
    object CBPointColorDef: TCheckBox
      Left = 11
      Top = 16
      Width = 74
      Height = 17
      Caption = '&Default'
      TabOrder = 0
      OnClick = CBPointColorDefClick
    end
    object BPointFillColor: TBitBtn
      Left = 10
      Top = 40
      Width = 87
      Height = 25
      HelpContext = 117
      Caption = 'B&ackground...'
      TabOrder = 1
      OnClick = BPointFillColorClick
    end
  end
  object CBColorEach: TCheckBox
    Left = 8
    Top = 70
    Width = 89
    Height = 17
    HelpContext = 249
    Caption = '&Color Each '
    TabOrder = 5
    OnClick = CBColorEachClick
  end
end
