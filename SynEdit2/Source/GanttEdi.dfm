object GanttSeriesEditor: TGanttSeriesEditor
  Left = 262
  Top = 262
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  ClientHeight = 160
  ClientWidth = 152
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 25
    Top = 44
    Width = 46
    Height = 17
    Alignment = taRightJustify
    AutoSize = False
    Caption = '&Height:'
    FocusControl = SEPointVertSize
  end
  object SEPointVertSize: TEdit
    Left = 77
    Top = 40
    Width = 40
    Height = 21
    HelpContext = 674
    TabOrder = 0
    Text = '1'
    OnChange = SEPointVertSizeChange
  end
  object BConnLines: TBitBtn
    Left = 6
    Top = 8
    Width = 138
    Height = 25
    HelpContext = 167
    Caption = 'Co&nnecting Lines...'
    TabOrder = 1
    OnClick = BConnLinesClick
  end
  object UDPointVertSize: TUpDown
    Left = 117
    Top = 40
    Width = 15
    Height = 21
    Associate = SEPointVertSize
    Min = 1
    Max = 1000
    Position = 1
    TabOrder = 2
    Wrap = False
  end
  object GPLine: TGroupBox
    Left = 6
    Top = 71
    Width = 137
    Height = 77
    TabOrder = 3
    object SHColor: TShape
      Left = 98
      Top = 15
      Width = 29
      Height = 25
      OnMouseUp = SHColorMouseUp
    end
    object BitBtn1: TBitBtn
      Left = 10
      Top = 15
      Width = 75
      Height = 25
      HelpContext = 421
      Caption = '&Color...'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object CBColorEach: TCheckBox
      Left = 10
      Top = 51
      Width = 119
      Height = 17
      HelpContext = 164
      Caption = 'Color &Each'
      TabOrder = 1
      OnClick = CBColorEachClick
    end
  end
end
