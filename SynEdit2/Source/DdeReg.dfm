object DdeLinkDlg: TDdeLinkDlg
  Left = 277
  Top = 181
  ActiveControl = AppEdit
  BorderStyle = bsDialog
  Caption = 'DDE Info'
  ClientHeight = 145
  ClientWidth = 289
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = DoPasteCheck
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 273
    Height = 89
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 12
    Top = 20
    Width = 69
    Height = 18
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Dde&Service:'
    FocusControl = AppEdit
  end
  object Label2: TLabel
    Left = 12
    Top = 44
    Width = 69
    Height = 18
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Dde&Topic:'
    FocusControl = TopicEdit
  end
  object AppEdit: TEdit
    Left = 88
    Top = 16
    Width = 185
    Height = 21
    Color = clWindow
    TabOrder = 0
  end
  object TopicEdit: TEdit
    Left = 88
    Top = 40
    Width = 185
    Height = 21
    Color = clWindow
    TabOrder = 1
  end
  object OK: TButton
    Left = 40
    Top = 104
    Width = 77
    Height = 27
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object CancelBtn: TButton
    Left = 124
    Top = 104
    Width = 77
    Height = 27
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object PasteBtn: TButton
    Left = 88
    Top = 65
    Width = 93
    Height = 27
    Caption = '&Paste Link'
    TabOrder = 4
    OnClick = doPasteLink
  end
  object HelpBtn: TButton
    Left = 208
    Top = 104
    Width = 73
    Height = 27
    Caption = '&Help'
    TabOrder = 5
    OnClick = HelpBtnClick
  end
end
