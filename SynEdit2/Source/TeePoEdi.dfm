object SeriesPointerEditor: TSeriesPointerEditor
  Left = 234
  Top = 256
  ActiveControl = CBDrawPoint
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 172
  ClientWidth = 320
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poDefault
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GPPoint: TGroupBox
    Left = 8
    Top = 2
    Width = 305
    Height = 165
    TabOrder = 0
    object Label1: TLabel
      Left = 113
      Top = 20
      Width = 61
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = '&Width:'
      FocusControl = SEPointHorizSize
    end
    object Label2: TLabel
      Left = 117
      Top = 48
      Width = 57
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      Caption = '&Height:'
      FocusControl = SEPointVertSize
    end
    object Label3: TLabel
      Left = 129
      Top = 88
      Width = 41
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'St&yle:'
      FocusControl = CBPointStyle
    end
    object CBDrawPoint: TCheckBox
      Left = 8
      Top = 15
      Width = 65
      Height = 17
      HelpContext = 683
      Caption = '&Visible'
      TabOrder = 0
      OnClick = CBDrawPointClick
    end
    object CB3dPoint: TCheckBox
      Left = 8
      Top = 39
      Width = 41
      Height = 17
      HelpContext = 190
      Caption = '&3D'
      TabOrder = 1
      OnClick = CB3dPointClick
    end
    object CBInflate: TCheckBox
      Left = 8
      Top = 63
      Width = 98
      Height = 17
      HelpContext = 249
      Caption = 'Inflate &Margins'
      TabOrder = 2
      OnClick = CBInflateClick
    end
    object SEPointHorizSize: TEdit
      Left = 177
      Top = 16
      Width = 28
      Height = 21
      HelpContext = 245
      TabOrder = 3
      Text = '1'
      OnChange = SEPointHorizSizeChange
    end
    object SEPointVertSize: TEdit
      Left = 177
      Top = 44
      Width = 28
      Height = 21
      HelpContext = 674
      TabOrder = 4
      Text = '1'
      OnChange = SEPointVertSizeChange
    end
    object CBPointStyle: TComboBox
      Left = 177
      Top = 84
      Width = 117
      Height = 21
      HelpContext = 448
      Style = csDropDownList
      DropDownCount = 12
      ItemHeight = 13
      TabOrder = 5
      OnChange = CBPointStyleChange
      Items.Strings = (
        'Square'
        'Circle'
        'Triangle'
        'Down Triangle'
        'Cross'
        'Diagonal Cross'
        'Star'
        'Diamond'
        'Small Dot')
    end
    object BPoinPenCol: TBitBtn
      Left = 201
      Top = 124
      Width = 93
      Height = 25
      HelpContext = 379
      Caption = 'B&order...'
      TabOrder = 6
      OnClick = BPoinPenColClick
    end
    object UDPointHorizSize: TUpDown
      Left = 205
      Top = 16
      Width = 15
      Height = 21
      Associate = SEPointHorizSize
      Min = 1
      Max = 1000
      Position = 1
      TabOrder = 7
      Wrap = False
    end
    object UDPointVertSize: TUpDown
      Left = 205
      Top = 44
      Width = 15
      Height = 21
      Associate = SEPointVertSize
      Min = 1
      Max = 1000
      Position = 1
      TabOrder = 8
      Wrap = False
    end
    object CBPoDark: TCheckBox
      Left = 8
      Top = 87
      Width = 69
      Height = 17
      HelpContext = 164
      Caption = 'Dar&k 3D'
      TabOrder = 9
      OnClick = CBPoDarkClick
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 112
      Width = 180
      Height = 45
      TabOrder = 10
      object BPointFillColor: TBitBtn
        Left = 9
        Top = 12
        Width = 93
        Height = 25
        HelpContext = 117
        Caption = 'B&ackground...'
        TabOrder = 0
        OnClick = BPointFillColorClick
      end
      object CBDefBrushColor: TCheckBox
        Left = 112
        Top = 16
        Width = 64
        Height = 17
        Caption = '&Default'
        TabOrder = 1
        OnClick = CBDefBrushColorClick
      end
    end
  end
end
