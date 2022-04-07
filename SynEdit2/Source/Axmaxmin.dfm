object AxisMaxMin: TAxisMaxMin
  Left = 146
  Top = 296
  ActiveControl = EMaximum
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Axis Maximum and Minimum'
  ClientHeight = 75
  ClientWidth = 266
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 16
    Width = 41
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '&Date:'
    FocusControl = EMaximum
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 53
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '&Time:'
    FocusControl = EMinimum
  end
  object BitBtn1: TButton
    Left = 185
    Top = 11
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TButton
    Left = 185
    Top = 43
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object EMaximum: TEdit
    Left = 65
    Top = 12
    Width = 108
    Height = 21
    Hint = 'Enter Date'
    HelpContext = 180
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object EMinimum: TEdit
    Left = 65
    Top = 44
    Width = 108
    Height = 21
    Hint = 'Enter Time'
    HelpContext = 180
    TabOrder = 1
  end
end
