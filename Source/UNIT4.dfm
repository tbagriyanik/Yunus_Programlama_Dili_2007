object Form4: TForm4
  Left = 312
  Top = 226
  BorderStyle = bsNone
  Caption = 'Form4'
  ClientHeight = 170
  ClientWidth = 272
  Color = clSkyBlue
  TransparentColorValue = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDblClick = FormDblClick
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 18
    Height = 18
    AutoSize = True
    ParentShowHint = False
    Picture.Data = {
      07544269746D61704E010000424D4E0100000000000076000000280000001200
      0000120000000100040000000000D80000000000000000000000100000001000
      000000000000000080000080000000808000800000008000800080800000C0C0
      C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF00777777777777777777000000777777444444777777000000777744444444
      4477770000007774444444444447770000007744444444444444770000007744
      444FFFF444447700000074444444FF4444444700000074444444FF4444444700
      000074444444FF4444444700000074444444FF444444470000007444444FFF44
      44444700000074444444444444444700000077444444FF444444770000007744
      4444FF4444447700000077744444444444477700000077774444444444777700
      0000777777444444777777000000777777777777777777000000}
    ShowHint = True
    Transparent = True
    Visible = False
    OnClick = Image1Click
  end
  object Panel1: TPanel
    Left = 75
    Top = 0
    Width = 197
    Height = 170
    Align = alRight
    BevelWidth = 2
    Color = clSkyBlue
    TabOrder = 0
    OnClick = Panel1Click
    object Label4: TLabel
      Left = 20
      Top = 8
      Width = 30
      Height = 22
      Caption = 'ver'
      Color = clBlack
      Font.Charset = TURKISH_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      OnClick = Label4Click
    end
    object Label1: TLabel
      Left = 6
      Top = 36
      Width = 110
      Height = 13
      Caption = 'Yap'#305'm: Tar'#305'k Ba'#287'r'#305'yan'#305'k'
      Font.Charset = TURKISH_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      OnClick = Label7Click
    end
    object Label2: TLabel
      Left = 6
      Top = 50
      Width = 84
      Height = 13
      Caption = 'Tarih: Aral'#305'k 2001'
      Font.Charset = TURKISH_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      OnClick = Label7Click
    end
    object Label3: TLabel
      Left = 6
      Top = 112
      Width = 129
      Height = 13
      Caption = 'Delphi severlere adanm'#305#351't'#305'r'
      Font.Charset = TURKISH_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      OnClick = Label7Click
    end
    object Label5: TLabel
      Left = 41
      Top = 65
      Width = 111
      Height = 13
      Cursor = crHandPoint
      Alignment = taCenter
      Caption = 'yunus.sourceforge.net'
      Color = clMoneyGreen
      Font.Charset = TURKISH_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
      OnClick = Label5Click
      OnMouseMove = Label5MouseMove
      OnMouseLeave = Label5MouseLeave
    end
    object Label6: TLabel
      Left = 41
      Top = 80
      Width = 116
      Height = 13
      Cursor = crHandPoint
      Caption = 'tbagriyanik@mynet.com'
      Color = clMoneyGreen
      Font.Charset = TURKISH_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
      OnClick = Label6Click
      OnMouseMove = Label6MouseMove
      OnMouseLeave = Label6MouseLeave
    end
    object Bevel1: TBevel
      Left = 5
      Top = 102
      Width = 185
      Height = 3
      Shape = bsBottomLine
    end
    object Label7: TLabel
      Left = 6
      Top = 130
      Width = 121
      Height = 13
      Alignment = taCenter
      Caption = 'Powered by Delphi'
      Color = clRed
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      OnClick = Label7Click
    end
    object Label8: TLabel
      Left = 6
      Top = 147
      Width = 167
      Height = 13
      Caption = 'Built-in Script Engine: SoleBee v1.1'
      Font.Charset = TURKISH_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      OnClick = Label7Click
    end
    object Label9: TLabel
      Left = 6
      Top = 65
      Width = 22
      Height = 13
      Caption = 'Site:'
      Font.Charset = TURKISH_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 6
      Top = 80
      Width = 22
      Height = 13
      Caption = 'Mail:'
      Font.Charset = TURKISH_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
end
