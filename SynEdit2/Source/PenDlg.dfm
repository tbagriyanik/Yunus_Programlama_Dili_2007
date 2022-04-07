object PenDialog: TPenDialog
  Left = 247
  Top = 149
  ActiveControl = CBVisible
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Border Color Editor'
  ClientHeight = 191
  ClientWidth = 213
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LWidth: TLabel
    Left = 87
    Top = 9
    Width = 66
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '&Width:'
    FocusControl = SEWidth
  end
  object CBVisible: TCheckBox
    Left = 14
    Top = 8
    Width = 64
    Height = 17
    HelpContext = 680
    Caption = '&Visible'
    TabOrder = 0
    OnClick = CBVisibleClick
  end
  object SEWidth: TEdit
    Left = 157
    Top = 5
    Width = 33
    Height = 21
    HelpContext = 690
    TabOrder = 1
    Text = '1'
    OnChange = SEWidthChange
  end
  object RGStyle: TRadioGroup
    Left = 5
    Top = 32
    Width = 100
    Height = 153
    HelpContext = 445
    Caption = '&Style:'
    Items.Strings = (
      'Solid'
      'Dash'
      'Dot'
      'Dash Dot'
      'Dash Dot Dot')
    TabOrder = 2
    OnClick = RGStyleClick
  end
  object Button1: TButton
    Left = 122
    Top = 128
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object GroupBox1: TGroupBox
    Left = 112
    Top = 32
    Width = 94
    Height = 73
    TabOrder = 4
    object SHColor: TShape
      Left = 33
      Top = 45
      Width = 26
      Height = 22
      OnMouseUp = SHColorMouseUp
    end
    object BColor: TButton
      Left = 9
      Top = 13
      Width = 75
      Height = 25
      HelpContext = 161
      Caption = '&Color...'
      TabOrder = 0
      OnClick = BColorClick
    end
  end
  object Button3: TButton
    Left = 122
    Top = 159
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
    OnClick = Button3Click
  end
  object UDWidth: TUpDown
    Left = 190
    Top = 5
    Width = 15
    Height = 21
    Associate = SEWidth
    Min = 1
    Position = 1
    TabOrder = 6
    Wrap = False
  end
end
