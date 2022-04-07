object BrushDialog: TBrushDialog
  Left = 433
  Top = 285
  ActiveControl = RGStyle
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Pattern Color Editor'
  ClientHeight = 175
  ClientWidth = 243
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RGStyle: TRadioGroup
    Left = 5
    Top = 4
    Width = 129
    Height = 165
    HelpContext = 444
    Caption = 'Style:'
    Items.Strings = (
      '&Solid'
      '&None'
      '&Horizontal'
      '&Vertical'
      '&Diagonal'
      '&Back.Diagonal'
      'C&ross'
      'D&iagonal Cross')
    TabOrder = 0
    OnClick = RGStyleClick
  end
  object Button2: TButton
    Left = 152
    Top = 112
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 143
    Top = 4
    Width = 93
    Height = 85
    TabOrder = 2
    object SHColor: TShape
      Left = 34
      Top = 50
      Width = 26
      Height = 23
      OnMouseUp = SHColorMouseUp
    end
    object BColor: TButton
      Left = 9
      Top = 16
      Width = 75
      Height = 25
      HelpContext = 428
      Caption = '&Color...'
      TabOrder = 0
      OnClick = BColorClick
    end
  end
  object Button3: TButton
    Left = 152
    Top = 144
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
    OnClick = Button3Click
  end
end
