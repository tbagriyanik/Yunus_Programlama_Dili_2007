object TeeGallery: TTeeGallery
  Left = 301
  Top = 209
  ActiveControl = BOk
  AutoScroll = False
  Caption = 'TeeChart Gallery'
  ClientHeight = 329
  ClientWidth = 415
  Color = clBtnFace
  ParentFont = True
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object P1: TPanel
    Left = 0
    Top = 283
    Width = 415
    Height = 46
    Align = alBottom
    TabOrder = 0
    object BOk: TButton
      Left = 15
      Top = 11
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
    end
    object BCancel: TButton
      Left = 105
      Top = 11
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
    object CB3D: TCheckBox
      Left = 226
      Top = 12
      Width = 49
      Height = 21
      Caption = '&3D'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = CB3DClick
    end
  end
end
