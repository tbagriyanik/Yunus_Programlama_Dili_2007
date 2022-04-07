object TeeExportForm: TTeeExportForm
  Left = 230
  Top = 162
  ActiveControl = RGFormat
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Export TeeChart'
  ClientHeight = 137
  ClientWidth = 339
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 216
    Top = 10
    Width = 118
    Height = 30
    Caption = '&Copy to Clipboard'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 216
    Top = 56
    Width = 118
    Height = 30
    Caption = '&Save To File...'
    TabOrder = 2
    OnClick = Button2Click
  end
  object RGFormat: TRadioGroup
    Left = 4
    Top = 4
    Width = 205
    Height = 129
    Caption = 'Format'
    ItemIndex = 0
    Items.Strings = (
      'as &Bitmap (BMP)'
      'as &Metafile (WMF)'
      'as &Enhanced Metafile (EMF)'
      'as *.&TEE file (TEE)')
    TabOrder = 0
    OnClick = RGFormatClick
  end
  object Button3: TButton
    Left = 216
    Top = 103
    Width = 118
    Height = 30
    Cancel = True
    Caption = 'Close'
    ModalResult = 1
    TabOrder = 3
  end
  object SaveDialog1: TSaveDialog
    Filter = 
      'Bitmap files|*.BMP|Metafile files|*.WMF|Enhanced Metafile files|' +
      '*.EMF|Tee Native files|*.TEE'
    Options = [ofOverwritePrompt, ofHideReadOnly]
    Left = 136
    Top = 4
  end
end
