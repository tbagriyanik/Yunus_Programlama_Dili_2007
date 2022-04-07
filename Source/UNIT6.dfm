object Form6: TForm6
  Left = 316
  Top = 124
  Caption = #199'e'#351'itli '#304#351'leri burada y'#252'r'#252't'#252'yoruz (Yaz'#305'c'#305', derleme...)'
  ClientHeight = 529
  ClientWidth = 641
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = 2
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object RichEdit3: TRichEdit
    Left = 280
    Top = 416
    Width = 337
    Height = 89
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'bo'#351' - empty - sonu'#231' pas dosyas'#305' buraya gelecek')
    ParentFont = False
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 2
    WordWrap = False
  end
  object RichEdit2: TRichEdit
    Left = 280
    Top = 8
    Width = 329
    Height = 105
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'unit Unit1;'
      'interface'
      'uses'
      
        '  Windows, Messages, SysUtils, Classes, Graphics, Controls, Form' +
        's, Dialogs,DB, DBClient,'
      
        '  StdCtrls, ExtCtrls, Menus, Grids, inifiles, registry, Buttons,' +
        ' ComCtrls, WinProcs, shellapi, typinfo, ShlObj;'
      'type'
      '  TForm1 = class(TForm)')
    ParentFont = False
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 1
    WordWrap = False
  end
  object Memo1: TMemo
    Left = 16
    Top = 104
    Width = 241
    Height = 89
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      '[Form_1]'
      'Baslik=Form1'
      'Sol=345'
      'Ust=4'
      'Genislik=445'
      'Yukseklik=440'
      'Renk=-2147483633'
      'Ipucu='
      'YazitipiAdi=MS Sans Serif'
      'YazitipiRengi=-2147483640'
      'YazitipiBoyut=8'
      'CharSet=162'
      'Stil=0'
      'Durum=0'
      '[Form_2]'
      'Sol=5'
      'Ust=4'
      'Genislik=340'
      'Yukseklik=500'
      'Dil=1'
      'Varsayilan_Dil=0'
      'Varsayilan_Aralik=3'
      'Standart=1'
      'Nesneler=1'
      'Standart_Dock=CoolBar1'
      'Nesneler_Dock=CoolBar1'
      '[Form_3]'
      'Ustte=0'
      'Etiket=0'
      'Tasarim=1'
      'Ipucu=1'
      'Renkli=0'
      'Ses=1'
      'DerlemePenceresi=0'
      'Yazitipi=Tahoma'
      'Yazitipi_Size=8'
      'CharSet=162'
      'Stil=0'
      'Ipucu_rengi=16776960'
      'IpucuYaziRengi=0'
      'Ipucu_suresi=3000'
      'Ipucu_cikma_suresi=300'
      'Olay_Arkaplan_rengi=16777215'
      'Metin_rengi=16776328'
      'Aciklama_Arkaplan_rengi=12632256'
      'Delphi='
      'VB='
      'ExcelGorunur=1'
      'Oncelik=3'
      'YapiskanSecim=1'
      'Grid=8'
      'Boyutla=5'
      'IzgarayaDaya=1'
      'OtoYardim=1'
      'Yazici=-1'
      '[Form_5]'
      'Sol=370'
      'Ust=280'
      'Genislik=455'
      'Yukseklik=250'
      'Arkaplan_rengi=8388608'
      'Yazitipi=Courier New'
      'Yazitipi_Size=12'
      'Yazi_rengi=65535'
      'CharSet=162'
      'Stil=0'
      'Durum=0'
      '[DosyaListesi]'
      '1='
      '2='
      '3='
      '4='
      '[Form_12]'
      'Araclar=1'
      '1=C:\WINDOWS\NOTEPAD.EXE'
      '[Ozellestir]'
      '1=Dugme'
      '2=MetinKutusu'
      '3=Etiket'
      '4=OnayKutusu'
      '5=ListeKutusu'
      '6=AcilirKutu'
      '7=YaziKutusu'
      '8=Zamanlayici'
      '9=Tablo'
      '10=ExcelTablosu'
      '11=Form'
      '12=Tiklaninca'
      '13=Yuklenince'
      '14=Kapanirken'
      '15=Evet'
      '16=Hayir'
      '17=bitti'
      '18=bitir'
      '19=bip'
      '20=mesaj'
      '21=verigir'
      '22=ses'
      '23=calistir'
      '24=aktif'
      '25=baslik'
      '26=ipucu'
      '27=renk'
      '28=ust'
      '29=sol'
      '30=genislik'
      '31=yukseklik'
      '32=Yazitipi'
      '33=deger'
      '34=secili'
      '35=Hucre'
      '36=Eger'
      '37=Degilse'
      '38=Egerbitti'
      '39=EEger'
      '40=Donder'
      '41=Donderbitti'
      '42=iken'
      '43=ikenBitti'
      '44=Fonksiyon'
      '45=Git'
      '46=ilkKayit'
      '47=onceki'
      '48=sonraki'
      '49=sonKayit'
      '50=kaydet'
      '51=ekle'
      '52=sil'
      '53=kayit'
      '54=ara'
      '55=kaydaGit'
      '56=alan'
      '57=kayitSayisi'
      '58=kayitNo'
      '59=yuzey'
      '60=metin'
      '61=dikdortgen'
      '62=cizgi'
      '63=nokta'
      '64=daire'
      '65=poligon'
      '66=tazele'
      '67=sesCal'
      '68=Komut'
      '69=son'
      '70=kir'
      '71=devam'
      '[Ozellestir2]'
      '1=Button'
      '2=Edit'
      '3=Label'
      '4=Check'
      '5=List'
      '6=Combo'
      '7=Memo'
      '8=Timer'
      '9=Table'
      '10=ExcelTable'
      '11=Form'
      '12=OnClick'
      '13=OnLoad'
      '14=OnClose'
      '15=True'
      '16=False'
      '17=End'
      '18=Close'
      '19=Beep'
      '20=Message'
      '21=Input'
      '22=MessageBeep'
      '23=WinExec'
      '24=Active'
      '25=Caption'
      '26=Hint'
      '27=Color'
      '28=Top'
      '29=Left'
      '30=Width'
      '31=Height'
      '32=Font'
      '33=Value'
      '34=ItemIndex'
      '35=Cell'
      '36=If'
      '37=Else'
      '38=Endif'
      '39=IIf'
      '40=For'
      '41=Next'
      '42=While'
      '43=Do'
      '44=Function'
      '45=Goto'
      '46=First'
      '47=Prior'
      '48=Next'
      '49=Last'
      '50=Post'
      '51=Insert'
      '52=Delete'
      '53=Edit'
      '54=Search'
      '55=GotoRecord'
      '56=Field'
      '57=RecordCount'
      '58=RecNo'
      '59=Canvas'
      '60=Text'
      '61=Rectangle'
      '62=Line'
      '63=Point'
      '64=Circle'
      '65=PolyLine'
      '66=Refresh'
      '67=PlaySound'
      '68=Command'
      '69=Exit'
      '70=Break'
      '71=Continue')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 3
    WordWrap = False
  end
  object Memo2: TMemo
    Left = 16
    Top = 200
    Width = 249
    Height = 89
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      '<html>'
      '<head>'
      
        '<meta http-equiv="Content-Type" content="text/html; charset=wind' +
        'ows-1254"><meta http-equiv="Content-Language" content="tr">'
      '</head>'
      '</body>'
      '</html>')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 4
    WordWrap = False
  end
  object RichEdit1: TRichEdit
    Left = 16
    Top = 9
    Width = 241
    Height = 88
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'program Project1;'
      'uses'
      '  Forms,'
      '  UNIT1 in '#39'UNIT1.PAS'#39' {Form1};'
      '{$R *.res}'
      'begin'
      '  Application.Initialize;'
      '  Application.CreateForm(TForm1, Form1);'
      '  Application.Run;'
      'end.')
    ParentFont = False
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object RichEdit4: TRichEdit
    Left = 280
    Top = 120
    Width = 337
    Height = 89
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      
        '    procedure FormMouseDown(Sender: TObject; Button: TMouseButto' +
        'n;'
      '      Shift: TShiftState; X, Y: Integer);'
      '    procedure FormCreate(Sender: TObject);'
      '    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;'
      '      Shift: TShiftState; X, Y: Integer);'
      '    procedure FormKeyDown(Sender: TObject; var Key: Word;'
      '      Shift: TShiftState);'
      
        '    procedure FormMouseMove(Sender: TObject; Shift: TShiftState;' +
        ' X,'
      '      Y: Integer);'
      '    procedure FormResize(Sender: TObject);'
      '    procedure FormPaint(Sender: TObject);'
      
        '    procedure FormCloseQuery(Sender: TObject; var CanClose: Bool' +
        'ean);'
      '    procedure FormActivate(Sender: TObject);'
      '    procedure FormShow(Sender: TObject);'
      '    procedure FormDblClick(Sender: TObject);'
      '  private'
      '    { Private declarations }'
      '  public'
      '    { Public declarations }'
      '  end;')
    ParentFont = False
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 5
    WordWrap = False
  end
  object RichEdit5: TRichEdit
    Left = 280
    Top = 216
    Width = 337
    Height = 89
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'var'
      '  Form1: TForm1;')
    ParentFont = False
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 7
    WordWrap = False
  end
  object RichEdit6: TRichEdit
    Left = 280
    Top = 312
    Width = 337
    Height = 89
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'implementation'
      '{$R *.dfm}'
      ''
      
        'procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseBu' +
        'tton;'
      '      Shift: TShiftState; X, Y: Integer);'
      'begin'
      '//'
      'end;'
      ''
      'procedure TForm1.FormCreate(Sender: TObject);'
      'begin'
      '//'
      'end;'
      ''
      
        'procedure TForm1.FormMouseUp(Sender: TObject; Button: TMouseButt' +
        'on;'
      '      Shift: TShiftState; X, Y: Integer);'
      'begin'
      '//'
      'end;'
      ''
      'procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;'
      '      Shift: TShiftState);'
      'begin'
      '//'
      'end;'
      ''
      
        'procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftSta' +
        'te; X,'
      '  Y: Integer);'
      'begin'
      '//'
      'end;'
      ''
      'procedure TForm1.FormResize(Sender: TObject);'
      'begin'
      '//'
      'end;'
      ''
      'procedure TForm1.FormPaint(Sender: TObject);'
      'begin'
      '//'
      'end;'
      ''
      
        'procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: B' +
        'oolean);'
      'begin'
      '//'
      'end;'
      ''
      'procedure TForm1.FormActivate(Sender: TObject);'
      'begin'
      '//'
      'end;'
      ''
      'procedure TForm1.FormShow(Sender: TObject);'
      'begin'
      '//'
      'end;'
      ''
      'procedure TForm1.FormDblClick(Sender: TObject);'
      'begin'
      '//'
      'end;'
      ''
      'end.')
    ParentFont = False
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 6
    WordWrap = False
  end
end
