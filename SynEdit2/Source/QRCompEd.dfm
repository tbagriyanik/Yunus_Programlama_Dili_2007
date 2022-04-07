object QRCompEd: TQRCompEd
  Left = 251
  Top = 142
  BorderStyle = bsDialog
  Caption = 'Report Settings'
  ClientHeight = 425
  ClientWidth = 459
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object About: TButton
    Left = 8
    Top = 394
    Width = 109
    Height = 25
    Caption = 'About &QuickReport'
    TabOrder = 5
    OnClick = AboutClick
  end
  object Preview: TButton
    Left = 126
    Top = 394
    Width = 74
    Height = 25
    Caption = '&Preview'
    TabOrder = 6
    OnClick = PreviewClick
  end
  object Apply1: TButton
    Left = 209
    Top = 394
    Width = 74
    Height = 25
    Caption = '&Apply'
    TabOrder = 7
    OnClick = Apply1Click
  end
  object OK1: TButton
    Left = 292
    Top = 394
    Width = 74
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 8
    OnClick = OK1Click
  end
  object Cancel1: TButton
    Left = 375
    Top = 394
    Width = 74
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 9
    OnClick = Cancel1Click
  end
  object PaperSizeGB: TGroupBox
    Left = 8
    Top = 4
    Width = 441
    Height = 47
    Caption = 'Paper size'
    TabOrder = 0
    object Label5: TLabel
      Left = 152
      Top = 20
      Width = 28
      Height = 13
      Caption = 'Width'
    end
    object Label6: TLabel
      Left = 236
      Top = 20
      Width = 33
      Height = 13
      Caption = 'Length'
    end
    object PaperSize: TComboBox
      Left = 8
      Top = 16
      Width = 139
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object PageWidth: TEdit
      Left = 194
      Top = 16
      Width = 37
      Height = 21
      TabOrder = 1
      OnEnter = PageWidthEnter
      OnExit = PageWidthExit
      OnKeyPress = FloatKeyPress
    end
    object PageLength: TEdit
      Left = 278
      Top = 16
      Width = 37
      Height = 21
      TabOrder = 2
      OnEnter = PageWidthEnter
      OnExit = PageWidthExit
      OnKeyPress = FloatKeyPress
    end
    object OrientationCB: TComboBox
      Left = 330
      Top = 16
      Width = 93
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        'Portrait'
        'Landscape')
    end
  end
  object MarginsGB: TGroupBox
    Left = 8
    Top = 56
    Width = 441
    Height = 69
    Caption = 'Margins'
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 19
      Height = 13
      Caption = 'Top'
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 33
      Height = 13
      Caption = 'Bottom'
    end
    object Label3: TLabel
      Left = 152
      Top = 16
      Width = 18
      Height = 13
      Caption = 'Left'
    end
    object Label4: TLabel
      Left = 152
      Top = 42
      Width = 25
      Height = 13
      Caption = 'Right'
    end
    object Label7: TLabel
      Left = 274
      Top = 14
      Width = 105
      Height = 13
      AutoSize = False
      Caption = 'Column space'
    end
    object Label8: TLabel
      Left = 274
      Top = 44
      Width = 105
      Height = 13
      AutoSize = False
      Caption = 'Number of columns'
    end
    object SpeedButton1: TSpeedButton
      Left = 408
      Top = 37
      Width = 13
      Height = 12
      Glyph.Data = {
        8A000000424D8A00000000000000760000002800000007000000050000000100
        0400000000001400000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFF00000
        0000F00000F0FF000FF0FFF0FFF0}
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 408
      Top = 48
      Width = 13
      Height = 12
      Glyph.Data = {
        86000000424D8600000000000000760000002800000007000000040000000100
        0400000000001000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFF0FFF0FF00
        0FF0F00000F000000000}
      OnClick = SpeedButton2Click
    end
    object Topmargin: TEdit
      Left = 62
      Top = 12
      Width = 37
      Height = 21
      TabOrder = 0
      OnEnter = PageWidthEnter
      OnExit = PageWidthExit
      OnKeyPress = FloatKeyPress
    end
    object BottomMargin: TEdit
      Left = 62
      Top = 38
      Width = 37
      Height = 21
      TabOrder = 1
      OnEnter = PageWidthEnter
      OnExit = PageWidthExit
      OnKeyPress = FloatKeyPress
    end
    object LeftMargin: TEdit
      Left = 194
      Top = 12
      Width = 37
      Height = 21
      TabOrder = 2
      OnEnter = PageWidthEnter
      OnExit = PageWidthExit
      OnKeyPress = FloatKeyPress
    end
    object RightMargin: TEdit
      Left = 194
      Top = 38
      Width = 37
      Height = 21
      TabOrder = 3
      OnEnter = PageWidthEnter
      OnExit = PageWidthExit
      OnKeyPress = FloatKeyPress
    end
    object ColumnMargin: TEdit
      Left = 384
      Top = 12
      Width = 37
      Height = 21
      TabOrder = 4
      OnExit = PageWidthExit
      OnKeyPress = FloatKeyPress
    end
    object Columns: TEdit
      Left = 384
      Top = 38
      Width = 23
      Height = 21
      TabOrder = 5
      Text = '1'
      OnKeyPress = FloatKeyPress
    end
  end
  object OtherGB: TGroupBox
    Left = 8
    Top = 130
    Width = 441
    Height = 47
    Caption = 'Other'
    TabOrder = 2
    object Label9: TLabel
      Left = 276
      Top = 20
      Width = 36
      Height = 13
      AutoSize = False
      Caption = 'Units'
    end
    object Label10: TLabel
      Left = 8
      Top = 20
      Width = 21
      Height = 13
      Caption = 'Font'
    end
    object Label11: TLabel
      Left = 152
      Top = 20
      Width = 39
      Height = 13
      AutoSize = False
      Caption = 'Size'
    end
    object Units: TComboBox
      Left = 328
      Top = 18
      Width = 93
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        'MM'
        'Inches'
        'Pixes'
        'Characters'
        'Native')
    end
    object FontName: TComboBox
      Left = 34
      Top = 16
      Width = 111
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object FontSize: TComboBox
      Left = 194
      Top = 16
      Width = 53
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      OnKeyPress = FloatKeyPress
    end
  end
  object PageFrameGB: TGroupBox
    Left = 8
    Top = 184
    Width = 441
    Height = 61
    Caption = 'Page frame'
    TabOrder = 3
    object Label12: TLabel
      Left = 142
      Top = 18
      Width = 39
      Height = 13
      AutoSize = False
      Caption = 'Color'
    end
    object FrameColor: TShape
      Left = 182
      Top = 16
      Width = 17
      Height = 17
      Pen.Style = psClear
      Pen.Width = 0
    end
    object Label13: TLabel
      Left = 276
      Top = 18
      Width = 69
      Height = 13
      AutoSize = False
      Caption = 'Frame width'
    end
    object SpeedButton3: TSpeedButton
      Left = 408
      Top = 13
      Width = 13
      Height = 12
      Glyph.Data = {
        8A000000424D8A00000000000000760000002800000007000000050000000100
        0400000000001400000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFF00000
        0000F00000F0FF000FF0FFF0FFF0}
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 408
      Top = 25
      Width = 13
      Height = 12
      Glyph.Data = {
        86000000424D8600000000000000760000002800000007000000040000000100
        0400000000001000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFF0FFF0FF00
        0FF0F00000F000000000}
      OnClick = SpeedButton4Click
    end
    object PageFrameTop: TCheckBox
      Left = 8
      Top = 16
      Width = 61
      Height = 17
      Caption = 'Top'
      TabOrder = 0
    end
    object PageFrameBottom: TCheckBox
      Left = 8
      Top = 36
      Width = 73
      Height = 17
      Caption = 'Bottom'
      TabOrder = 1
    end
    object PageFrameLeft: TCheckBox
      Left = 84
      Top = 16
      Width = 53
      Height = 17
      Caption = 'Left'
      TabOrder = 2
    end
    object PageFrameRight: TCheckBox
      Left = 84
      Top = 36
      Width = 49
      Height = 17
      Caption = 'Right'
      TabOrder = 3
    end
    object ColorButton: TButton
      Left = 206
      Top = 14
      Width = 49
      Height = 21
      Caption = 'Change'
      TabOrder = 4
      OnClick = ColorButtonClick
    end
    object PageFramePenWidth: TEdit
      Left = 384
      Top = 14
      Width = 23
      Height = 21
      TabOrder = 5
      Text = '0'
      OnKeyPress = FloatKeyPress
    end
  end
  object BandsGB: TGroupBox
    Left = 8
    Top = 250
    Width = 441
    Height = 135
    Caption = 'Bands'
    TabOrder = 4
    object Label14: TLabel
      Left = 118
      Top = 12
      Width = 33
      Height = 13
      Caption = 'Length'
    end
    object Label15: TLabel
      Left = 338
      Top = 12
      Width = 33
      Height = 13
      Caption = 'Length'
    end
    object Title: TCheckBox
      Left = 8
      Top = 56
      Width = 89
      Height = 17
      Caption = 'Title'
      TabOrder = 2
    end
    object PageHeader: TCheckBox
      Left = 8
      Top = 32
      Width = 89
      Height = 17
      Caption = 'Page header'
      TabOrder = 0
    end
    object ColumnHeader: TCheckBox
      Left = 8
      Top = 80
      Width = 100
      Height = 17
      Caption = 'Column header'
      TabOrder = 4
    end
    object Detail: TCheckBox
      Left = 8
      Top = 104
      Width = 89
      Height = 17
      Caption = 'Detail band'
      TabOrder = 6
    end
    object PageHeaderLength: TEdit
      Left = 118
      Top = 28
      Width = 37
      Height = 21
      TabOrder = 1
      OnEnter = PageWidthEnter
      OnExit = PageWidthExit
      OnKeyPress = FloatKeyPress
    end
    object TitleLength: TEdit
      Left = 118
      Top = 52
      Width = 37
      Height = 21
      TabOrder = 3
      OnEnter = PageWidthEnter
      OnExit = PageWidthExit
      OnKeyPress = FloatKeyPress
    end
    object ColumnHeaderLength: TEdit
      Left = 118
      Top = 76
      Width = 37
      Height = 21
      TabOrder = 5
      OnEnter = PageWidthEnter
      OnExit = PageWidthExit
      OnKeyPress = FloatKeyPress
    end
    object DetailLength: TEdit
      Left = 118
      Top = 100
      Width = 37
      Height = 21
      TabOrder = 7
      OnEnter = PageWidthEnter
      OnExit = PageWidthExit
      OnKeyPress = FloatKeyPress
    end
    object SummaryLength: TEdit
      Left = 338
      Top = 52
      Width = 37
      Height = 21
      TabOrder = 11
      OnExit = PageWidthExit
      OnKeyPress = FloatKeyPress
    end
    object PageFooter: TCheckBox
      Left = 226
      Top = 32
      Width = 85
      Height = 17
      Caption = 'Page footer'
      TabOrder = 8
    end
    object Summary: TCheckBox
      Left = 226
      Top = 56
      Width = 73
      Height = 17
      Caption = 'Summary'
      TabOrder = 10
    end
    object PageFooterLength: TEdit
      Left = 338
      Top = 28
      Width = 37
      Height = 21
      TabOrder = 9
      OnExit = PageWidthExit
      OnKeyPress = FloatKeyPress
    end
    object FirstPageHeader: TCheckBox
      Left = 226
      Top = 80
      Width = 150
      Height = 17
      Caption = 'Print first page header'
      TabOrder = 12
    end
    object LastPageFooter: TCheckBox
      Left = 226
      Top = 104
      Width = 150
      Height = 17
      Caption = 'Print last page footer'
      TabOrder = 13
    end
  end
end
