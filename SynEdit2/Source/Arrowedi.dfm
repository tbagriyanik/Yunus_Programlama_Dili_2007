object ArrowSeriesEditor: TArrowSeriesEditor
  Left = 251
  Top = 308
  BorderStyle = bsDialog
  ClientHeight = 105
  ClientWidth = 239
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 152
    Top = 48
    Width = 31
    Height = 13
    Alignment = taRightJustify
    Caption = '&Width:'
    FocusControl = SEArrowWidth
  end
  object Label2: TLabel
    Left = 148
    Top = 76
    Width = 34
    Height = 13
    Alignment = taRightJustify
    Caption = '&Height:'
    FocusControl = SEArrowHeight
  end
  object BPen: TBitBtn
    Left = 4
    Top = 4
    Width = 75
    Height = 25
    HelpContext = 275
    Caption = '&Border...'
    TabOrder = 0
    OnClick = BPenClick
  end
  object BBrush: TBitBtn
    Left = 152
    Top = 4
    Width = 81
    Height = 25
    HelpContext = 274
    Caption = '&Pattern...'
    TabOrder = 1
    OnClick = BBrushClick
  end
  object SEArrowWidth: TEdit
    Left = 188
    Top = 44
    Width = 30
    Height = 21
    HelpContext = 57
    TabOrder = 2
    Text = '1'
    OnChange = SEArrowWidthChange
  end
  object SEArrowHeight: TEdit
    Left = 188
    Top = 72
    Width = 30
    Height = 21
    HelpContext = 55
    TabOrder = 3
    Text = '1'
    OnChange = SEArrowHeightChange
  end
  object GroupBox1: TGroupBox
    Left = 4
    Top = 36
    Width = 129
    Height = 65
    TabOrder = 4
    object SHArrowColor: TShape
      Left = 89
      Top = 32
      Width = 32
      Height = 25
      OnMouseUp = SHArrowColorMouseUp
    end
    object CBColorEach: TCheckBox
      Left = 8
      Top = 12
      Width = 105
      Height = 17
      HelpContext = 164
      Caption = 'Color &Each Arrow'
      TabOrder = 0
      OnClick = CBColorEachClick
    end
    object BArrowColor: TBitBtn
      Left = 8
      Top = 32
      Width = 75
      Height = 25
      HelpContext = 421
      Caption = '&Color...'
      TabOrder = 1
      OnClick = BArrowColorClick
    end
  end
  object UDArrowWidth: TUpDown
    Left = 218
    Top = 44
    Width = 15
    Height = 21
    Associate = SEArrowWidth
    Min = 1
    Position = 1
    TabOrder = 5
    Wrap = False
  end
  object UDArrowHeight: TUpDown
    Left = 218
    Top = 72
    Width = 15
    Height = 21
    Associate = SEArrowHeight
    Min = 1
    Position = 1
    TabOrder = 6
    Wrap = False
  end
end
