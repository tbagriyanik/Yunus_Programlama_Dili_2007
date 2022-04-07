object ChartShapeEditor: TChartShapeEditor
  Left = 206
  Top = 196
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  ClientHeight = 194
  ClientWidth = 339
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SHColor: TShape
    Left = 112
    Top = 36
    Width = 26
    Height = 23
    OnMouseUp = SHColorMouseUp
  end
  object Label1: TLabel
    Left = 220
    Top = 12
    Width = 41
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    Caption = '&Left:'
    FocusControl = SEX0
  end
  object LX1: TLabel
    Left = 220
    Top = 36
    Width = 41
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    Caption = '&Right:'
    FocusControl = SEX1
  end
  object Label2: TLabel
    Left = 224
    Top = 60
    Width = 37
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    Caption = '&Top:'
    FocusControl = SEY0
  end
  object LY1: TLabel
    Left = 208
    Top = 84
    Width = 53
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    Caption = '&Bottom:'
    FocusControl = SEY1
  end
  object Label5: TLabel
    Left = 119
    Top = 103
    Width = 45
    Height = 14
    AutoSize = False
    Caption = 'Te&xt:'
    FocusControl = MemoText
  end
  object Label3: TLabel
    Left = 4
    Top = 8
    Width = 37
    Height = 17
    Alignment = taRightJustify
    AutoSize = False
    Caption = '&Style:'
  end
  object BShapePen: TButton
    Left = 9
    Top = 68
    Width = 94
    Height = 25
    HelpContext = 376
    Caption = 'Bor&der...'
    TabOrder = 0
    OnClick = BShapePenClick
  end
  object BShapeBrush: TButton
    Left = 9
    Top = 101
    Width = 94
    Height = 25
    HelpContext = 108
    Caption = '&Pattern...'
    TabOrder = 1
    OnClick = BShapeBrushClick
  end
  object SEX0: TEdit
    Left = 268
    Top = 8
    Width = 65
    Height = 21
    HelpContext = 693
    TabOrder = 2
    OnChange = SEX0Change
  end
  object SEX1: TEdit
    Left = 268
    Top = 32
    Width = 65
    Height = 21
    HelpContext = 693
    TabOrder = 3
    OnChange = SEX1Change
  end
  object SEY0: TEdit
    Left = 268
    Top = 56
    Width = 65
    Height = 21
    HelpContext = 693
    TabOrder = 4
    OnChange = SEY0Change
  end
  object SEY1: TEdit
    Left = 268
    Top = 80
    Width = 65
    Height = 21
    HelpContext = 693
    TabOrder = 5
    OnChange = SEY1Change
  end
  object Button1: TButton
    Left = 9
    Top = 136
    Width = 94
    Height = 25
    HelpContext = 214
    Caption = 'F&ont...'
    TabOrder = 6
    OnClick = Button1Click
  end
  object RGAlign: TRadioGroup
    Left = 260
    Top = 114
    Width = 73
    Height = 78
    HelpContext = 41
    Caption = '&Alignment'
    Items.Strings = (
      'Left'
      'Center'
      'Right')
    TabOrder = 7
    OnClick = RGAlignClick
  end
  object MemoText: TMemo
    Left = 119
    Top = 120
    Width = 129
    Height = 72
    HelpContext = 641
    TabOrder = 8
    OnChange = MemoTextChange
  end
  object CBTrans: TCheckBox
    Left = 113
    Top = 71
    Width = 93
    Height = 17
    HelpContext = 657
    Caption = 'Tra&nsparent'
    TabOrder = 9
    OnClick = CBTransClick
  end
  object BShapeColor: TButton
    Left = 9
    Top = 35
    Width = 94
    Height = 25
    HelpContext = 428
    Caption = 'Bac&kground...'
    TabOrder = 10
    OnClick = BShapeColorClick
  end
  object CBStyle: TComboBox
    Left = 44
    Top = 4
    Width = 145
    Height = 21
    HelpContext = 446
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 11
    OnChange = CBStyleChange
    Items.Strings = (
      'Rectangle'
      'Circle'
      'Vertical Line'
      'Horiz. Line'
      'Triangle'
      'Invert. Triangle'
      'Line'
      'Diamond'
      'Cube'
      'Cross'
      'Diagonal Cross'
      'Star'
      'Pyramid'
      'Invert. Pyramid')
  end
end
