unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, ExtCtrls, ComCtrls, ToolWin, ImgList, Menus, inifiles,
  printers, buttons, shellapi, ValEdit, registry,math , typinfo, ExtDlgs,
  DB, DBClient,mmsystem,comobj, hrtimer, zlportio, System.ImageList;

type
  TForm2 = class(TForm)
    ImageList1: TImageList;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    PopupMenu1: TPopupMenu;
    MainMenu1: TMainMenu;
    Dosya1: TMenuItem;
    Yeni2: TMenuItem;
    A1: TMenuItem;
    Kaydet1: TMenuItem;
    k1: TMenuItem;
    N1: TMenuItem;
    Yardm1: TMenuItem;
    Hakknda1: TMenuItem;
    indekiler1: TMenuItem;
    Proje1: TMenuItem;
    dur1: TMenuItem;
    Dzen1: TMenuItem;
    Kes1: TMenuItem;
    Kopyala1: TMenuItem;
    Yaptr1: TMenuItem;
    Sil1: TMenuItem;
    TmnSe1: TMenuItem;
    altr1: TMenuItem;
    Seenekler2: TMenuItem;
    Sonnesneyisil1: TMenuItem;
    N3: TMenuItem;
    FormKod1: TMenuItem;
    Grnm1: TMenuItem;
    Nesnezellikleri1: TMenuItem;
    Bilgi1: TMenuItem;
    N4: TMenuItem;
    Dayal1: TMenuItem;
    ste1: TMenuItem;
    Alta1: TMenuItem;
    Sola1: TMenuItem;
    Saa1: TMenuItem;
    Kayt1: TMenuItem;
    Form_1: TMenuItem;
    Kod1: TMenuItem;
    Ayar1: TMenuItem;
    Hepsini1: TMenuItem;
    N11: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N2: TMenuItem;
    PrintDialog1: TPrintDialog;
    Yazdr1: TMenuItem;
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    DelphiuyumluDFMKaydet1: TMenuItem;
    Yataydat1: TMenuItem;
    Dikeydat1: TMenuItem;
    Kes2: TMenuItem;
    Kopyala2: TMenuItem;
    Yaptr2: TMenuItem;
    Sil2: TMenuItem;
    Sonnesneyisil2: TMenuItem;
    TmnSe2: TMenuItem;
    Dayal2: TMenuItem;
    ste2: TMenuItem;
    Alta2: TMenuItem;
    Sola2: TMenuItem;
    Saa2: TMenuItem;
    Yataydat2: TMenuItem;
    Dikeydat2: TMenuItem;
    PopupMenu2: TPopupMenu;
    Seiliblgeyeuygula1: TMenuItem;
    Bul1: TMenuItem;
    Yorumla1: TMenuItem;
    N7: TMenuItem;
    HataPenceresi1: TMenuItem;
    PopupMenu3: TPopupMenu;
    Form_2: TMenuItem;
    Kod2: TMenuItem;
    Ayar2: TMenuItem;
    Hepsini2: TMenuItem;
    Araubuu1: TMenuItem;
    Dil1: TMenuItem;
    rke1: TMenuItem;
    ngilizce1: TMenuItem;
    CoolBar1: TCoolBar;
    ImageList3: TImageList;
    GeriyeYolla1: TMenuItem;
    neGetir1: TMenuItem;
    GeriyeYolla2: TMenuItem;
    neGetir2: TMenuItem;
    N5: TMenuItem;
    VisualBasicUyumluOlarakKaydet1: TMenuItem;
    VisualCUyumluOlarakKaydet1: TMenuItem;
    Aralar1: TMenuItem;
    Dzenle1: TMenuItem;
    N8: TMenuItem;
    N10: TMenuItem;
    project1exe1: TMenuItem;
    devam1: TMenuItem;
    N13: TMenuItem;
    Deitir1: TMenuItem;
    N12: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    Deitir2: TMenuItem;
    Metin1: TMenuItem;
    Etiket1: TMenuItem;
    Dugme1: TMenuItem;
    Onay1: TMenuItem;
    Liste1: TMenuItem;
    Acilir1: TMenuItem;
    M1: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    PopupMenu5: TPopupMenu;
    Ekle1: TMenuItem;
    sil3: TMenuItem;
    edit1: TMenuItem;
    hepsiniTemizle1: TMenuItem;
    KalcDeikenler1: TMenuItem;
    Komutlar1: TMenuItem;
    Veritaban1: TMenuItem;
    OpenDialog2: TOpenDialog;
    Windows1: TMenuItem;
    JScript1: TMenuItem;
    VBScript1: TMenuItem;
    OlayOlutur1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ValueListEditor1: TValueListEditor;
    Panel3: TPanel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    TabSheet2: TTabSheet;
    ListView1: TListView;
    TabSheet3: TTabSheet;
    ListView2: TListView;
    PopupMenu4: TPopupMenu;
    timer1: TMenuItem;
    table1: TMenuItem;
    excel1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton13: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ToolButton14: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolBar2: TToolBar;
    ToolButton15: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton19: TToolButton;
    ToolButton24: TToolButton;
    ToolButton5: TToolButton;
    ToolButton16: TToolButton;
    ToolButton9: TToolButton;
    ToolButton7: TToolButton;
    ToolButton20: TToolButton;
    Export1: TMenuItem;
    Import1: TMenuItem;
    EXEResource1: TMenuItem;
    HTMLFile1: TMenuItem;
    project1html1: TMenuItem;
    project1VBhtml1: TMenuItem;
    ToolButton21: TToolButton;
    Devam2: TMenuItem;
    SatrnumarasnaGit1: TMenuItem;
    Kitapzleri1: TMenuItem;
    N14: TMenuItem;
    N22: TMenuItem;
    N32: TMenuItem;
    N42: TMenuItem;
    N51: TMenuItem;
    N61: TMenuItem;
    N71: TMenuItem;
    N81: TMenuItem;
    N91: TMenuItem;
    N001: TMenuItem;
    N9: TMenuItem;
    Herzamanstte1: TMenuItem;
    PopupMenu6: TPopupMenu;
    Araubuu2: TMenuItem;
    Nesneler1: TMenuItem;
    zelletir1: TMenuItem;
    Araubuklar1: TMenuItem;
    Nesneler2: TMenuItem;
    zelletir2: TMenuItem;
    YeniForm1: TMenuItem;
    N17: TMenuItem;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    N18: TMenuItem;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    TabSheet4: TTabSheet;
    ListBox1: TListBox;
    PopupMenu7: TPopupMenu;
    mnTemizle1: TMenuItem;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure k1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure Kaydet1Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure altr1Click(Sender: TObject);
    procedure dur1Click(Sender: TObject);
    procedure Seenekler2Click(Sender: TObject);
    procedure Sil1Click(Sender: TObject);
    procedure Hakknda1Click(Sender: TObject);
    procedure TmnSe1Click(Sender: TObject);
    procedure Kes1Click(Sender: TObject);
    procedure Kopyala1Click(Sender: TObject);
    procedure Yaptr1Click(Sender: TObject);
    procedure FormKod1Click(Sender: TObject);
    procedure Nesnezellikleri1Click(Sender: TObject);
    procedure Bilgi1Click(Sender: TObject);
    procedure Yorumla1Click(Sender: TObject);
    procedure indekiler1Click(Sender: TObject);
    procedure ste1Click(Sender: TObject);
    procedure Alta1Click(Sender: TObject);
    procedure Sola1Click(Sender: TObject);
    procedure Saa1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Hepsini1Click(Sender: TObject);
    procedure Form_1Click(Sender: TObject);
    procedure Kod1Click(Sender: TObject);
    procedure Ayar1Click(Sender: TObject);
    procedure Yazdr1Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure FontDialog1Apply(Sender: TObject; Wnd: HWND);
    procedure DelphiuyumluDFMKaydet1Click(Sender: TObject);
    procedure Yataydat1Click(Sender: TObject);
    procedure Dikeydat1Click(Sender: TObject);
    procedure Seiliblgeyeuygula1Click(Sender: TObject);
    procedure Bul1Click(Sender: TObject);
    procedure ListView2ColumnClick(Sender: TObject; Column: TListColumn);
    procedure ListView2Compare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure HataPenceresi1Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Araubuu1Click(Sender: TObject);
    procedure zelletir1Click(Sender: TObject);
    procedure rke1Click(Sender: TObject);
    procedure ngilizce1Click(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ToolBar1StartDock(Sender: TObject;
      var DragObject: TDragDockObject);
    procedure Dzen1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure ValueListEditor1EditButtonClick(Sender: TObject);
    procedure ValueListEditor1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ValueListEditor1Click(Sender: TObject);
    procedure ValueListEditor1Validate(Sender: TObject; ACol,
      ARow: Integer; const KeyName, KeyValue: String);
    procedure ValueListEditor1ContextPopup(Sender: TObject;
      MousePos: TPoint; var Handled: Boolean);
    procedure GeriyeYolla1Click(Sender: TObject);
    procedure neGetir1Click(Sender: TObject);
    procedure FindFile(StartDir, FileMask: string);
    procedure Dzenle1Click(Sender: TObject);
    procedure project1exe1Click(Sender: TObject);
    procedure ValueListEditor1Exit(Sender: TObject);
    procedure devam1Click(Sender: TObject);
    procedure Deitir1Click(Sender: TObject);
    procedure Etiket1Click(Sender: TObject);
    procedure Metin1Click(Sender: TObject);
    procedure Dugme1Click(Sender: TObject);
    procedure Onay1Click(Sender: TObject);
    procedure Liste1Click(Sender: TObject);
    procedure Acilir1Click(Sender: TObject);
    procedure M1Click(Sender: TObject);
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure ListView1Compare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure Yeni2Click(Sender: TObject);
    procedure PopupMenu5Popup(Sender: TObject);
    procedure Ekle1Click(Sender: TObject);
    procedure edit1Click(Sender: TObject);
    procedure hepsiniTemizle1Click(Sender: TObject);
    procedure sil3Click(Sender: TObject);
    procedure ListView2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Veritaban1Click(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);

    procedure grid;
    procedure gride_yaz;
    procedure gridden_oku;
    procedure calistir(satirno:integer;kim:string);
    function  dosyaadi_ayikla(dsy:string):string;
    function  projeadi_ayikla(dsy:string):string;
    function  mid(metin:string; ilk:integer; uzunluk:integer):string;
    function  bul(metin:string; degeri:char):integer;
    procedure YeniYeni;
    procedure derle;
    function komutlistesi(neyin:string):string;
    procedure Turkcele(dil:boolean);
    procedure Windows1Click(Sender: TObject);
    procedure Game1Click(Sender: TObject);
    procedure OlayOlutur1Click(Sender: TObject);
    procedure EXEResource1Click(Sender: TObject);
    procedure HTMLFile1Click(Sender: TObject);
    procedure JScript1Click(Sender: TObject);
    procedure VBScript1Click(Sender: TObject);
    procedure project1html1Click(Sender: TObject);
    procedure Export1Click(Sender: TObject);
    procedure project1VBhtml1Click(Sender: TObject);
    procedure VisualBasicUyumluOlarakKaydet1Click(Sender: TObject);
    procedure ToolButton21Click(Sender: TObject);
    procedure SatrnumarasnaGit1Click(Sender: TObject);
    procedure Kitapzleri1Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure Herzamanstte1Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure N71Click(Sender: TObject);
    procedure N81Click(Sender: TObject);
    procedure N91Click(Sender: TObject);
    procedure N001Click(Sender: TObject);
    procedure Nesneler2Click(Sender: TObject);
    procedure ToolBar2StartDock(Sender: TObject;
      var DragObject: TDragDockObject);
    procedure PopupMenu6Popup(Sender: TObject);
    procedure YeniForm1Click(Sender: TObject);
    procedure mnTemizle1Click(Sender: TObject);
    procedure PopupMenu7Popup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function icHesaplama (var metin: string):boolean;
    function icHesaplamaMetin (var metin: string):boolean;
    function CallFunction(fun: string; var R: string): Boolean;
    procedure akilliListe;
    procedure AcceptFiles( var msg : TMessage );
      message WM_DROPFILES;
        function PlayWavFile(const FileName: string): Boolean;
        procedure StopWav;
    function tekKomutCalistir(satir:string):boolean;
    function NesneOzelligiBul(nesneadi1:string;nesneturu1:string):string;
    procedure NesneOzelligineAtama(nesneadi1:string;nesneturu1:string;gecicisag:string);
    function str2int(const value:string;const HEX:boolean):integer;
    procedure atom(sat:string); //bir satýrdaki olay adlarý
   end;
  TCheckClass = class(TControl);

type
   komut_tip=record
    tip:string;
    ad:string;
   end;
type
   Excel_tip=record
    book:Variant;
    num:integer;
   end;
type
   degisken_tip=record
    ad:string;
    degeri:integer;
    bitis_degeri:integer;
    artim:integer;
    ilk_satir:integer;
    son_satir:integer;
   end;

var
  Form2: TForm2;
  aktifpencere:boolean;
  komut:array[1..10] of komut_tip;    //?? sadece bu kadar mý?
  proje:String;klasorproje:string;
  secili_satir:integer;
//  derlem:Derleme;
  ListItem: TListItem;
  ColumnToSort: Integer;
  yon,yon2:byte;
  degiskensayisi:integer;
  kapatlen:boolean;
  disarida_stan,disarida_nesn:boolean;
  gridsatir:integer;
  derlemehatalari:integer;
  gecDel:boolean;
  ararakam:integer;
  dcc32:string;
  forDegisken: array of degisken_tip; //daha sonra setlength ile boyu deðiþecek
  ExcelBook: array of Excel_tip;
  HRT : THRTimer;
  breaknoktasi:integer; //aktif olarak bir tane durak olabilir
  breakBayragi:Boolean; //break oldu mu?
  formsayisi:integer;
  aktifPencereNo:integer;

implementation

uses Unit1, Unit3, Unit4, Unit5, Unit6, Unit8, Unit9, Unit10, Unit11,
  Unit12, Unit13, Unit14, Unit15, Unit16, Unit17, Unit19,
  DTestPrintPreview, SynEdit;   //herkes burada

{$R *.DFM}
{$R menu.res}				//menüler için kaynak dosyamýz

function TForm2.str2int(const value:string;const HEX:boolean):integer;
begin
  if HEX then
     result := strtoint('$' + value)
    else
     result := strtoint(value);
end;

procedure TForm2.YeniYeni;
var i,nesnesayisi:integer;
begin
   for i:=1 to 256 do
     BreakPointListesi[i]:=-1; //boþ liste
form5.StatusBar1.SimplePanel:=false;
form16.ListView1.Items.Clear;
   form5.RichEdit1.CaretX:=0;
   form5.RichEdit1.CaretY:=0;
form2.label1.Caption:='0';degiskensayisi:=0;
form3.Close;
form4.close;
form5.Show;
form1.Show;
aktifpencere:=true;
aktifPencereNo:=1;
form2.ToolButton5.ImageIndex:=5;

TestPrintPreviewDlg.CloseCmdExecute(self);

form7.close;
form8.Close;
form9.Close;
form11.Close;
form12.Close;
form16.Close;

if rke1.Checked then ararakam:=0 else ararakam:=1000;
ToolButton1.down:=true;
ToolButton7Click(self);

akilliListe;  //sýk kullanýlan listeyi günceller
ListView1.Items.Clear;
ListView2.Items.Clear;
form2.ListBox1.Items.Clear;
if form1.ComponentCount>0 then
 begin
 nesnesayisi:=form1.ComponentCount;
 for i:=nesnesayisi-1 downto 0 do  //ters yön olmazsa silinemez!...
  form1.Components[i].Free;
 end;
form1.nesne_sayisi;
form5.RichEdit1.Lines.Clear;
form5.RichEdit1.Modified:=false;
ToolBar1.Visible:=true;

form2.PageControl1.ActivePageIndex:=0;
form5.PageControl1.ActivePageIndex:=0;
ToolButton7.Enabled:=false;
ToolButton9.Enabled:=true;
end;

procedure Tform2.akilliListe;           //sýk kullanýlan listesi güncelleme
var  ayarini:Tinifile;dizin,dosya1,dosya2,dosya3,dosya4:string;
begin
screen.Cursor:=crhourglass;

form2.StatusBar1.Visible:=false;
form2.Panel1.Visible:=true;
form2.ProgressBar1.Position:=1;
form2.ProgressBar1.Max:=13; //120 satýr / 10 satýr böldük

dizin:=extractfilepath(application.ExeName);
ayarini:=TIniFile.Create(dizin+'\varsayilan.ayar');

     form3.ComboBoxEx1.ItemIndex:=ayarini.Readinteger('Form_2','Varsayilan_Dil',-1);
     form3.SpinEdit1.Value:=ayarini.Readinteger('Form_2','Varsayilan_Aralik',0);
     form3.CheckBox10.Checked:=ayarini.readBool('Form_3','IzgarayaDaya',false);
     form3.CheckBox11.Checked:=ayarini.readBool('Form_3','OtoYardim',true);
     form3.SpinEdit2.Value:=ayarini.ReadInteger('Form_3','Grid',1);
     form3.SpinEdit3.Value:=ayarini.ReadInteger('Form_3','Boyutla',1);
     sizeBorder:=form3.SpinEdit3.Value;
     form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1;
     form3.CheckBox8.Checked:=ayarini.Readbool('Form_3','ExcelGorunur',false);
     form3.CheckBox9.Checked:=ayarini.readBool('Form_3','YapiskanSecim',false);
     form3.TrackBar1.Position:=ayarini.ReadInteger('Form_3','Oncelik',-1);
     form3.ComboBox1.ItemIndex:=ayarini.Readinteger('Form_3','Yazici',-1);

dosya1:=ayarini.readstring('DosyaListesi','1','');
dosya2:=ayarini.readstring('DosyaListesi','2','');
dosya3:=ayarini.readstring('DosyaListesi','3','');
dosya4:=ayarini.readstring('DosyaListesi','4','');

     form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1;
if not(FileExists(dosya1+'.proje')) then
begin
dosya1:='';
ayarini.WriteString('DosyaListesi','1','');
end;
if not(FileExists(dosya2+'.proje')) then
begin
dosya2:='';
ayarini.WriteString('DosyaListesi','2','');
end;
     form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1;
if not(FileExists(dosya3+'.proje')) then
begin
dosya3:='';
ayarini.WriteString('DosyaListesi','3','');
end;
if not(FileExists(dosya4+'.proje')) then
begin
dosya4:='';
ayarini.WriteString('DosyaListesi','4','');
end;
     form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1;

if not((klasorproje=dosya1)or(klasorproje=dosya2)
   or(klasorproje=dosya3)or(klasorproje=dosya4)) then begin

if (klasorproje<>'')and(dosya1='')
  then ayarini.WriteString('DosyaListesi','1',klasorproje)
else
if (klasorproje<>'')and(dosya2='')
  then ayarini.WriteString('DosyaListesi','2',klasorproje)
else
if (klasorproje<>'')and(dosya3='')
  then ayarini.WriteString('DosyaListesi','3',klasorproje)
else
if (klasorproje<>'')and(dosya4='')
  then ayarini.WriteString('DosyaListesi','4',klasorproje)
else
begin
  if (klasorproje<>'')and(klasorproje<>dosya1) then begin
     form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1;
   ayarini.WriteString('DosyaListesi','1',klasorproje);
   ayarini.WriteString('DosyaListesi','2',dosya1);
   ayarini.WriteString('DosyaListesi','3',dosya2);
   ayarini.WriteString('DosyaListesi','4',dosya3);
   end;
end;
end;
     form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1;

dosya1:=ayarini.readstring('DosyaListesi','1','');
dosya2:=ayarini.readstring('DosyaListesi','2','');
dosya3:=ayarini.readstring('DosyaListesi','3','');
dosya4:=ayarini.readstring('DosyaListesi','4','');

     form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1;

if (dosya1='')and(dosya2<>'') then
 begin
   ayarini.WriteString('DosyaListesi','1',dosya2);
   ayarini.WriteString('DosyaListesi','2',dosya1);
   dosya1:=dosya2;
   dosya2:='';
 end;
     form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1;
if (dosya1='')and(dosya3<>'') then
 begin
   ayarini.WriteString('DosyaListesi','1',dosya3);
   ayarini.WriteString('DosyaListesi','3',dosya1);
   dosya1:=dosya3;
   dosya3:='';
 end;
     form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1;
if (dosya1='')and(dosya4<>'') then
 begin
   ayarini.WriteString('DosyaListesi','1',dosya4);
   ayarini.WriteString('DosyaListesi','4',dosya1);
   dosya1:=dosya4;
   dosya4:='';
 end;
     form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1;
if (dosya2='')and(dosya3<>'') then
 begin
   ayarini.WriteString('DosyaListesi','2',dosya3);
   ayarini.WriteString('DosyaListesi','3',dosya2);
   dosya2:=dosya3;
   dosya3:='';
 end;
if (dosya2='')and(dosya4<>'') then
 begin
   ayarini.WriteString('DosyaListesi','2',dosya4);
   ayarini.WriteString('DosyaListesi','4',dosya2);
   dosya2:=dosya4;
   dosya4:='';
 end;
     form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1;
if (dosya3='')and(dosya4<>'') then
 begin
   ayarini.WriteString('DosyaListesi','3',dosya4);
   ayarini.WriteString('DosyaListesi','4',dosya3);
   dosya3:=dosya4;
   dosya4:='';
 end;
     form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1;
if FileExists(dosya1+'.proje') then n11.Caption:='&1 '+dosya1 else begin dosya1:='';n11.Caption:='&1 '; end;
if FileExists(dosya2+'.proje') then n21.Caption:='&2 '+dosya2 else begin dosya2:='';n21.Caption:='&2 '; end;
if FileExists(dosya3+'.proje') then n31.Caption:='&3 '+dosya3 else begin dosya3:='';n31.Caption:='&3 '; end;
if FileExists(dosya4+'.proje') then n41.Caption:='&4 '+dosya4 else begin dosya4:='';n41.Caption:='&4 '; end;
if dosya1<>'' then n11.Enabled:=true else n11.Enabled:=false;
if dosya2<>'' then n21.Enabled:=true else n21.Enabled:=false;
if dosya3<>'' then n31.Enabled:=true else n31.Enabled:=false;
if dosya4<>'' then n41.Enabled:=true else n41.Enabled:=false;
     form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1;

form2.StatusBar1.Visible:=true;
form2.Panel1.Visible:=false;
screen.Cursor:=crDefault;
end;

procedure Tform2.Turkcele(dil:boolean);
var ararakam:integer; adlar:TStrings;
begin
Screen.Cursor:=crHourGlass;             //ana menü komutlarý
form2.StatusBar1.Visible:=false;
form2.Panel1.Visible:=true;
form2.ProgressBar1.Position:=1;
form2.ProgressBar1.Max:=20; //400 satýr / 20 satýr böldük

if dil then ararakam:=0 else ararakam:=1000;
form2.Dosya1.Caption := LoadStr(ararakam+1);
form2.Yeni2.Caption := LoadStr(ararakam+2);
form2.A1.Caption := LoadStr(ararakam+3);
form2.Kayt1.Caption := LoadStr(ararakam+4);
form2.Kaydet1.Caption := LoadStr(ararakam+5);
form2.Yazdr1.Caption := LoadStr(ararakam+6);
form2.k1.Caption := LoadStr(ararakam+7);
form2.Form_1.Caption := LoadStr(ararakam+8);
form2.Kod1.Caption := LoadStr(ararakam+9);
form2.Ayar1.Caption := LoadStr(ararakam+10);
form2.Hepsini1.Caption := LoadStr(ararakam+11);
form2.DelphiuyumluDFMKaydet1.Caption := LoadStr(ararakam+12);
form2.Dzen1.Caption := LoadStr(ararakam+13);
form2.kes1.Caption := LoadStr(ararakam+14);
form2.Kopyala1.Caption := LoadStr(ararakam+15);
form2.Yaptr1.Caption := LoadStr(ararakam+16);
form2.sil1.Caption := LoadStr(ararakam+17);
form2.Sonnesneyisil1.Caption := LoadStr(ararakam+18);

form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1;//1

form2.TmnSe1.Caption := LoadStr(ararakam+19);
form2.Dayal1.Caption := LoadStr(ararakam+20);
form2.Bul1.Caption := LoadStr(ararakam+21);
form2.ste1.Caption := LoadStr(ararakam+22);
form2.Alta1.Caption := LoadStr(ararakam+23);
form2.Sola1.Caption := LoadStr(ararakam+24);
form2.Saa1.Caption := LoadStr(ararakam+25);
form2.Yataydat1.Caption := LoadStr(ararakam+26);
form2.Dikeydat1.Caption := LoadStr(ararakam+27);
//
form2.Form_2.Caption := LoadStr(ararakam+8);    //araç çubuðu pulldown menüsü
form2.Kod2.Caption := LoadStr(ararakam+9);
form2.Ayar2.Caption := LoadStr(ararakam+10);
form2.Hepsini2.Caption := LoadStr(ararakam+11);
//2.
form2.kes2.Caption := LoadStr(ararakam+14);     //nesne sað tuþ menüsü
form2.Kopyala2.Caption := LoadStr(ararakam+15);
form2.Yaptr2.Caption := LoadStr(ararakam+16);
form2.sil2.Caption := LoadStr(ararakam+17);     form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1; //2
form2.TmnSe2.Caption := LoadStr(ararakam+19);
form2.Dayal2.Caption := LoadStr(ararakam+20);
form2.ste2.Caption := LoadStr(ararakam+22);
form2.Alta2.Caption := LoadStr(ararakam+23);
form2.Sola2.Caption := LoadStr(ararakam+24);
form2.Saa2.Caption := LoadStr(ararakam+25);
form2.Yataydat2.Caption := LoadStr(ararakam+26);
form2.Dikeydat2.Caption := LoadStr(ararakam+27);

                                        //form5 kod yazýmý sað tuþ elemanlarý
form5.Kes2.Caption:=LoadStr(ararakam+14);
form5.Kopyala2.Caption:=LoadStr(ararakam+15);
form5.Yaptr2.Caption:=LoadStr(ararakam+16);
form5.Sil2.Caption:=LoadStr(ararakam+17);
form5.TmnSe2.Caption:=LoadStr(ararakam+19);
form5.Bul1.Caption:=LoadStr(ararakam+21);
form5.HataPenceresi1.Caption:=LoadStr(ararakam+31);

form2.Grnm1.Caption := LoadStr(ararakam+28);
form2.FormKod1.Caption := LoadStr(ararakam+29); form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1; //3
form2.Nesnezellikleri1.Caption := LoadStr(ararakam+30);
form2.HataPenceresi1.Caption := LoadStr(ararakam+31);
form2.Araubuu1.Caption := LoadStr(ararakam+32);
form2.Dil1.Caption := LoadStr(ararakam+34);
form2.rke1.Caption := LoadStr(ararakam+35);
form2.ngilizce1.Caption := LoadStr(ararakam+36);
form2.Proje1.Caption := LoadStr(ararakam+40);
form2.altr1.Caption := LoadStr(ararakam+41);
form2.dur1.Caption := LoadStr(ararakam+42);
form2.Yorumla1.Caption := LoadStr(ararakam+43);
form2.Bilgi1.Caption := LoadStr(ararakam+44);
form2.Seenekler2.Caption := LoadStr(ararakam+45);
form2.Yardm1.Caption := LoadStr(ararakam+46);
form2.Hakknda1.Caption := LoadStr(ararakam+47);
form2.indekiler1.Caption := LoadStr(ararakam+48);

form2.Seiliblgeyeuygula1.Caption:=loadstr(ararakam+49);
form5.GeriAl1.Caption:=loadstr(ararakam+50);
form5.SatrSil1.Caption:=loadstr(ararakam+51);
form5.Kodablonu1.Caption:=loadstr(ararakam+52);form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1; //4
form5.KodTamamla1.Caption:=loadstr(ararakam+53);

form4.Label1.Caption:=loadstr(ararakam+54);
form4.Label2.Caption:=loadstr(ararakam+55);
form4.Label3.Caption:=loadstr(ararakam+56);

form3.Caption:=loadstr(ararakam+62);
form3.Label6.Caption:=loadstr(ararakam+82);
form3.Label7.Caption:=loadstr(ararakam+69);
form3.Label8.Caption:=loadstr(ararakam+68);
form3.Label9.Caption:=loadstr(ararakam+75);
form3.CheckBox1.Caption:=loadstr(ararakam+76);
form3.RadioGroup1.Caption:=loadstr(ararakam+77);

form3.CheckBox3.Caption:=loadstr(ararakam+78);
form3.CheckBox4.Caption:=loadstr(ararakam+79);
form3.CheckBox5.Caption:=loadstr(ararakam+80);
form3.CheckBox6.Caption:=loadstr(ararakam+81);
form3.CheckBox7.Caption:=loadstr(ararakam+161);
form3.CheckBox8.Caption:=loadstr(ararakam+190);
form3.button1.Caption:=loadstr(ararakam+59);form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1; //5
form3.button2.Caption:=loadstr(ararakam+72);
form3.button3.Caption:=loadstr(ararakam+73);
form3.BitBtn2.Caption:=loadstr(ararakam+71)+#13+loadstr(ararakam+74);
form3.BitBtn4.Caption:=form3.BitBtn2.Caption;
form3.BitBtn1.Caption:=loadstr(ararakam+70);
form3.BitBtn3.Caption:=loadstr(ararakam+70);

form2.OpenDialog1.Title:=loadstr(ararakam+84);
form2.saveDialog1.Title:=loadstr(ararakam+85);
form9.Varsaylan1.Caption:=loadstr(ararakam+4);
form9.Varsaylan2.Caption:=loadstr(ararakam+86);
form9.ekrarYkle1.Caption:=loadstr(ararakam+87);
form9.Seenek1.Caption:=loadstr(ararakam+156)+' 1';
form9.Seenek11.Caption:=loadstr(ararakam+156)+' 1';
form9.Seenek21.Caption:=loadstr(ararakam+156)+' 2';
form9.Seenek22.Caption:=loadstr(ararakam+156)+' 2';
form9.Kapat1.Caption:=loadstr(ararakam+88);

if proje='yeni' then form5.Caption:=loadstr(ararakam+82);
form2.ListView1.Columns[0].Caption:=loadstr(ararakam+102);form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1; //6
form2.ListView1.Columns[1].Caption:=loadstr(ararakam+103);
form2.ListView1.Columns[2].Caption:=loadstr(ararakam+104);
form2.ListView2.Columns[0].Caption:=loadstr(ararakam+105);
form2.ListView2.Columns[1].Caption:=loadstr(ararakam+106);
form2.ToolButton11.Hint:=loadstr(ararakam+3);
if form3.CheckBox4.Checked then form2.ToolButton11.Hint:=form2.ToolButton11.Hint+' (Ctrl+O)';
form2.ToolButton12.Hint:=loadstr(ararakam+4);
if form3.CheckBox4.Checked then form2.ToolButton12.Hint:=form2.ToolButton12.Hint+' (Ctrl+S)';
form2.ToolButton1.Hint:=loadstr(ararakam+97);
form2.ToolButton2.Hint:=loadstr(ararakam+98);
form2.ToolButton3.Hint:=loadstr(ararakam+99);
form2.ToolButton4.Hint:=loadstr(ararakam+100);
form2.ToolButton5.Hint:=loadstr(ararakam+18);
form2.ToolButton15.Hint:=loadstr(ararakam+2);
if form3.CheckBox4.Checked then form2.ToolButton15.Hint:=form2.ToolButton15.Hint+' (Ctrl+N)';
form2.ToolButton19.Hint:=loadstr(ararakam+6);
if form3.CheckBox4.Checked then form2.ToolButton19.Hint:=form2.ToolButton19.Hint+' (Ctrl+P)';
form2.ToolButton9.Hint:=loadstr(ararakam+41);
if form3.CheckBox4.Checked then form2.ToolButton9.Hint:=form2.ToolButton9.Hint+' (F9)';
form2.ToolButton7.Hint:=loadstr(ararakam+42);form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1; //7
if form3.CheckBox4.Checked then form2.ToolButton7.Hint:=form2.ToolButton7.Hint+' (Ctrl+F2)';

form2.ListView2.Hint:=loadstr(ararakam+107);
form2.ListView1.Hint:=loadstr(ararakam+108);
form2.ValueListEditor1.Hint:=loadstr(ararakam+109);
//form4.Image1.Hint:=loadstr(ararakam+110);
form3.CheckBox1.hint:=loadstr(ararakam+111);
form3.CheckBox3.Hint:=loadstr(ararakam+112);
form3.CheckBox5.Hint:=loadstr(ararakam+113);
form3.CheckBox6.Hint:=loadstr(ararakam+114);
form2.Dzen1.Hint:=loadstr(ararakam+117);
form2.bul1.Hint:=loadstr(ararakam+118);

if ararakam=0 then
form5.yap1.Caption:=loadstr(ararakam+122)+' '+loadstr(ararakam+123)+'/'+loadstr(ararakam+124)
else
form5.yap1.Caption:=loadstr(ararakam+123)+'/'+loadstr(ararakam+124)+' '+loadstr(ararakam+122);

form3.Label12.Caption:=loadstr(ararakam+125);
form3.Label13.Caption:=loadstr(ararakam+126);form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1; //8

form5.Renklendir1.Caption:=loadstr(ararakam+127);
form5.Yinele1.Caption:=loadstr(ararakam+312);

form3.ComboBoxEx1.Hint:=loadstr(ararakam+86)+' '+loadstr(ararakam+34);
form3.Label19.Caption:=loadstr(ararakam+86)+' '+loadstr(ararakam+34);

form3.Label1.Caption:=loadstr(ararakam+131);

form5.emizle1.Caption:=loadstr(ararakam+128);
form5.HatalSatraGit1.Caption:=loadstr(ararakam+129);

ToolButton8.Hint:=loadstr(ararakam+135);  //REdit
ToolButton10.Hint:=loadstr(ararakam+133);  //list
ToolButton6.Hint:=loadstr(ararakam+134);  //combo
ToolButton13.Hint:=loadstr(ararakam+132);  //check
ToolButton14.Hint:=loadstr(ararakam+163);  //timer
ToolButton17.Hint:=loadstr(ararakam+172);  //tablo
ToolButton18.Hint:=loadstr(ararakam+188);  //Excel Tablosu
form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1; //9
if aktifpencere then
form2.ToolButton5.Hint:=loadstr(ararakam+18)
else
form2.ToolButton5.Hint:=loadstr(ararakam+50);


form11.Caption:=loadstr(ararakam+136);
form11.Button1.Caption:=loadstr(ararakam+59);
form11.Button2.Caption:=loadstr(ararakam+72);

GeriyeYolla1.Caption:=loadstr(ararakam+137);
neGetir1.Caption:=loadstr(ararakam+138);
GeriyeYolla2.Caption:=loadstr(ararakam+137);
neGetir2.Caption:=loadstr(ararakam+138);

DelphiuyumluDFMKaydet1.Hint:=loadstr(ararakam+141);
VisualBasicUyumluOlarakKaydet1.Caption:=loadstr(ararakam+144);
VisualBasicUyumluOlarakKaydet1.Hint:=loadstr(ararakam+140);
VisualCUyumluOlarakKaydet1.Caption:=loadstr(ararakam+145);

form3.button4.Caption:=loadstr(ararakam+146);
form3.button5.Caption:=loadstr(ararakam+146);form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1; //10
form3.edit1.hint:=loadstr(ararakam+147);
form3.edit2.hint:=loadstr(ararakam+147);

Aralar1.Caption:=loadstr(ararakam+148);
Dzenle1.Caption:=loadstr(ararakam+149);
form12.SpeedButton1.Caption:=loadstr(ararakam+150);
form12.SpeedButton2.Caption:=loadstr(ararakam+17);
form12.SpeedButton3.Caption:=loadstr(ararakam+88);
form12.SpeedButton4.Caption:=loadstr(ararakam+72);
form12.Caption:=loadstr(ararakam+151);
form12.OpenDialog1.Title:=loadstr(ararakam+152);
form12.OpenDialog1.Filter:=loadstr(ararakam+153)+'|*.exe|'+loadstr(ararakam+154)+'|*.*';
form12.Ekle1.Caption:=loadstr(ararakam+150);
form12.Sil1.Caption:=loadstr(ararakam+17);
form12.Vazge1.Caption:=loadstr(ararakam+88);
form12.Kapat1.Caption:=loadstr(ararakam+72);

OpenDialog1.Filter:=loadstr(ararakam+155)+'|*.proje|'+loadstr(ararakam+154)+'|*.*';
SaveDialog1.Filter:=loadstr(ararakam+155)+'|*.proje|'+loadstr(ararakam+154)+'|*.*';
form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1; //11

ToolBar2.Caption:=loadstr(ararakam+32);

devam1.Caption:=loadstr(ararakam+157);
Deitir1.Caption:=loadstr(ararakam+158);
form3.Button6.Hint:=loadstr(ararakam+159);
Deitir2.Caption:=loadstr(ararakam+160);
KalcDeikenler1.Caption:=loadstr(ararakam+168);
KalcDeikenler1.hint:=loadstr(ararakam+169);

OpenPictureDialog1.Title:=loadstr(ararakam+167);
OpenPictureDialog1.Filter:=loadstr(ararakam+166)+'|*.bmp|'+loadstr(ararakam+154)+'|*.*';

ekle1.Caption:=loadstr(ararakam+150);
sil3.Caption:=loadstr(ararakam+17);
edit1.Caption:=loadstr(ararakam+149);
hepsiniTemizle1.Caption:=loadstr(ararakam+164);
form13.LabeledEdit1.EditLabel.Caption:=loadstr(ararakam+105);
form13.LabeledEdit2.EditLabel.Caption:=loadstr(ararakam+106);
form13.Button1.Caption:=loadstr(ararakam+59);form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1; //12
form13.Button2.Caption:=loadstr(ararakam+72);
form13.Button3.Caption:=loadstr(ararakam+17);
form13.Caption:=loadstr(ararakam+165);

Komutlar1.Caption:=loadstr(ararakam+170);
Veritaban1.Caption:=loadstr(ararakam+171);

form14.TabSheet1.Caption:=loadstr(ararakam+92);
form14.TabSheet2.Caption:=loadstr(ararakam+173);
form14.Label1.Caption:=loadstr(ararakam+174);
adlar:=TStringList.Create;
adlar.add(loadstr(ararakam+183));
adlar.add(loadstr(ararakam+176));
form14.ValueListEditor1.TitleCaptions.Assign(adlar);
adlar.Free;
form14.LabeledEdit1.EditLabel.Caption:=loadstr(ararakam+175);
form14.LabeledEdit6.EditLabel.Caption:=loadstr(ararakam+177);
form14.LabeledEdit5.EditLabel.Caption:=loadstr(ararakam+86);
form14.CheckBox1.Caption:=loadstr(ararakam+178);
form14.CheckBox2.Caption:=loadstr(ararakam+179);form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1; //13
form14.CheckBox3.Caption:=loadstr(ararakam+180);
form14.CheckBox4.Caption:=loadstr(ararakam+186);
form14.label2.Caption:=loadstr(ararakam+187);
form14.ToolButton1.hint:=loadstr(ararakam+2);
form14.ToolButton5.hint:=loadstr(ararakam+4);
form14.ToolButton2.hint:=loadstr(ararakam+17);
form14.ToolButton3.hint:=loadstr(ararakam+181);
form14.ToolButton4.hint:=loadstr(ararakam+7);
form14.ToolButton9.hint:=loadstr(ararakam+88);
form14.ToolButton12.hint:=loadstr(ararakam+185);
form14.RichEdit1.hint:=loadstr(ararakam+182);
form2.OpenDialog2.Title:=loadstr(ararakam+152);
form2.OpenDialog2.Filter:=loadstr(ararakam+184)+'|*.xml;*.cds|'+loadstr(ararakam+154)+'|*.*';
form14.FilterComboBox1.Filter:=form2.OpenDialog2.Filter;
form14.Undo1.Caption:=LoadStr(ararakam+50);
form14.Cut1.Caption:=LoadStr(ararakam+14);
form14.Copy1.Caption:=LoadStr(ararakam+15);
form14.Paste1.Caption:=LoadStr(ararakam+16);   form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1; //14
if form2.rke1.Checked then begin
form14.ToolButton10.hint:='SQL Metnini Uygula';
form14.Uygula1.Caption:='SQL Metnini Uygula'
end
else begin
form14.ToolButton10.hint:='Apply SQL String';
form14.Uygula1.Caption:='Apply SQL String';
end;

form3.TabSheet1.Caption:=loadstr(ararakam+192);
form3.TabSheet2.Caption:=loadstr(ararakam+191);

form12.altr1.Caption:=LoadStr(ararakam+41);

form14.A1.Caption:=LoadStr(ararakam+3);
form14.Yeni1.Caption:=LoadStr(ararakam+2);
form14.Kapat1.Caption:=LoadStr(ararakam+88);
form14.Kaydet1.Caption:=LoadStr(ararakam+4);
form14.oalt1.Caption:=LoadStr(ararakam+181);
form14.azele1.Caption:=LoadStr(ararakam+185);
form14.Sil1.Caption:=LoadStr(ararakam+17);

Windows1.Caption:=LoadStr(ararakam+193);form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1; //15
OlayOlutur1.Caption:=LoadStr(ararakam+194);

form3.Label11.Caption:=LoadStr(ararakam+195);
form3.Label11.hint:=LoadStr(ararakam+199);
form3.Label14.Caption:=LoadStr(ararakam+196);
form3.Label16.Caption:=LoadStr(ararakam+197);
form3.Label17.Caption:=LoadStr(ararakam+198);
form3.BitBtn5.Caption:=LoadStr(ararakam+86);
form3.varsayilanayardosyasyenile1.Hint:=LoadStr(ararakam+208);

TabSheet1.Caption:=loadstr(ararakam+200);
TabSheet2.Caption:=loadstr(ararakam+201);
TabSheet3.Caption:=loadstr(ararakam+202);
ToolBar1.Caption:=loadstr(ararakam+203);
form5.TabSheet1.Caption:=loadstr(ararakam+204);
form5.TabSheet2.Caption:=loadstr(ararakam+205);
form5.BenchmarkSil1.Caption:=loadstr(ararakam+206);
form5.Hatalarsil1.Caption:=loadstr(ararakam+207);
form5.KodPenceresi1.Caption:=loadstr(ararakam+82);
form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1; //16

Export1.Caption:=loadstr(ararakam+209);
Import1.Caption:=loadstr(ararakam+210);
EXEResource1.Caption:=loadstr(ararakam+211);
HTMLFile1.Caption:=loadstr(ararakam+212);
//Import1.Caption:=loadstr(ararakam+210);
form3.Label18.Caption:=loadstr(ararakam+213);

form11.kes2.Caption := LoadStr(ararakam+14);     //nesne sað tuþ menüsü
form11.Kopyala2.Caption := LoadStr(ararakam+15);
form11.Yaptr2.Caption := LoadStr(ararakam+16);
form11.sil2.Caption := LoadStr(ararakam+17);
form11.TmnSe2.Caption := LoadStr(ararakam+19);
form11.GeriAl1.Caption := LoadStr(ararakam+50);
form11.DosyadanYkle1.Caption:=LoadStr(ararakam+215);

form3.CheckBox9.Caption:=loadstr(ararakam+216);

form9.Label1.Caption:=loadstr(ararakam+217);
//form9.ToolBar1.Hint:=loadstr(ararakam+218); //artýk her iki kolonda arama var 
form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1; //17
form9.Button1.Caption:=loadstr(ararakam+88);

form4.Image1.Hint:=loadstr(ararakam+130);
form5.DurakNoktas1.Caption:=loadstr(ararakam+219);
form5.Ekle1.Caption:=loadstr(ararakam+150);
form5.mnSil1.Caption:=loadstr(ararakam+221);
form5.Edit1.Caption:=loadstr(ararakam+149);
form16.Caption:=loadstr(ararakam+220);
form16.Ekle1.Caption:=loadstr(ararakam+150);
form16.Sil1.Caption:=loadstr(ararakam+17);
form16.Kapat1.Caption:=loadstr(ararakam+88);
form16.mnSil1.Caption:=loadstr(ararakam+221);
form16.ListView1.Columns[1].Caption:=loadstr(ararakam+223);
form16.ListView1.Columns[0].Caption:=loadstr(ararakam+104);
form16.StayonTop1.Caption:=loadstr(ararakam+222);
form16.Dzenle1.Caption:=loadstr(ararakam+149);

form17.Caption:=loadstr(ararakam+219);
form17.LabeledEdit1.EditLabel.Caption:=loadstr(ararakam+219);form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1; //18
form17.LabeledEdit2.EditLabel.Caption:=loadstr(ararakam+223);
form17.Button1.Caption:=loadstr(ararakam+59);
form17.Button2.Caption:=loadstr(ararakam+72);

form16.Git1.Caption:=loadstr(ararakam+129);
SatrnumarasnaGit1.Caption:=loadstr(ararakam+225);
Kitapzleri1.Caption:=loadstr(ararakam+226);

devam2.Caption:=loadstr(ararakam+224);
ToolButton21.hint:=loadstr(ararakam+224);
if form3.CheckBox4.Checked then form2.ToolButton21.Hint:=form2.ToolButton21.Hint+' (Shift+F9)';
Herzamanstte1.Caption:=loadstr(ararakam+222);

Araubuu2.Caption:=loadstr(ararakam+32);
Nesneler1.Caption:=loadstr(ararakam+203);
zelletir1.Caption:=loadstr(ararakam+33);
Nesneler2.Caption:=loadstr(ararakam+203);
zelletir2.Caption:=loadstr(ararakam+33);
Araubuklar1.Caption:=loadstr(ararakam+227);
form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1; //19

form3.varsayilanayardosyasyenile1.Caption:=LoadStr(ararakam+229);
form3.VarsaylanDeerler1.Caption:=LoadStr(ararakam+228);

YeniForm1.Caption:=LoadStr(ararakam+230);
ToolButton22.hint:=LoadStr(ararakam+230);
ToolButton23.hint:=LoadStr(ararakam+231);

form3.label4.Caption:=LoadStr(ararakam+233);
form3.label5.Caption:=LoadStr(ararakam+234);
form3.CheckBox10.Caption:=LoadStr(ararakam+235);
form3.CheckBox11.Caption:=LoadStr(ararakam+236);

form3.RadioGroup1.Items.Strings[0]:=LoadStr(ararakam+237);
form3.RadioGroup1.Items.Strings[1]:=LoadStr(ararakam+238);
form3.RadioGroup1.Items.Strings[2]:=LoadStr(ararakam+239);

form2.TabSheet4.Caption:=LoadStr(ararakam+240);
form2.ListBox1.Hint:=LoadStr(ararakam+241);
mnTemizle1.Caption:=LoadStr(ararakam+164);

form3.Label10.Caption:=LoadStr(ararakam+242);

if form3.CheckBox4.Checked then form2.ToolButton23.Hint:=form2.ToolButton23.Hint+' (Shift+F2)';
Kitapzleri1.Hint:=loadstr(ararakam+232);

form2.ComboBox1.Text:=komutlistesi('Form');
grid;

form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1; //20

form2.StatusBar1.Visible:=true;
form2.Panel1.Visible:=false;
Screen.Cursor:=crDefault;
end;

function TForm2.komutlistesi(neyin:string):string;
var i:integer;
begin            // a:=komutlistesi('Dugme'); //kullanýcý ne özelleþtirmiþse
try
form9.ValueListEditor1.FindRow(lowercase(neyin),i);
komutlistesi:=form9.ValueListEditor1.cells[1,i];
except
//aslýnda tüm komutlarýn bulunmasý gerek
end;
end;

procedure TForm2.ListView2ColumnClick(Sender: TObject;
  Column: TListColumn);
begin
ColumnToSort := Column.Index;
  (Sender as TCustomListView).AlphaSort;
yon2:=-1*yon2;
end;

procedure TForm2.ListView2Compare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
var
  ix: Integer;
begin
  if ColumnToSort = 0 then
    Compare := yon2+CompareText(Item1.Caption,Item2.Caption)
  else
  if ColumnToSort = 1 then begin
   ix := ColumnToSort - 1;
   Compare := yon2+CompareText(Item1.SubItems[ix],Item2.SubItems[ix]);
  end;
end;

procedure TForm2.ListView1ColumnClick(Sender: TObject;
  Column: TListColumn);
begin
ColumnToSort := Column.Index;
  (Sender as TCustomListView).AlphaSort;
yon:=-1*yon;
end;

procedure TForm2.ListView1Compare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
var
  ix: Integer;
begin
  if ColumnToSort = 0 then
    Compare := yon+CompareText(Item1.Caption,Item2.Caption)
  else
  if ColumnToSort = 1 then begin
   ix := ColumnToSort - 1;
   Compare := yon+CompareText(Item1.SubItems[ix],Item2.SubItems[ix]);
  end
  else begin
   ix := ColumnToSort - 1;
   Compare := yon+CompareValue(strtoint(Item1.SubItems[ix]),strtoint(Item2.SubItems[ix]));
  end;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var i:integer;
begin
akilliListe;
kapatlen:=true;
for i:=0 to length(excelbook)-1 do
 ExcelBook[i].book.quit; //direkt kapatýver, sonra da diziyi sýfýrla
   form5.RichEdit1.CaretX:=0;
   form5.RichEdit1.CaretY:=0;
canclose:=true;//soru sorabilirdi...
end;

procedure TForm2.grid;
var ara:integer;
begin
if rke1.Checked then ara:=0 else ara:=1000;
form2.ValueListEditor1.Cells[0,0]:=loadstr(ara+94)+' (.'+komutlistesi('aktif')+')';
form2.ValueListEditor1.Cells[0,1]:=loadstr(ara+95)+' (.'+komutlistesi('baslik')+')';
form2.ValueListEditor1.Cells[0,2]:=loadstr(ara+64)+' (.'+komutlistesi('ust')+')';
form2.ValueListEditor1.Cells[0,3]:=loadstr(ara+65)+' (.'+komutlistesi('sol')+')';
form2.ValueListEditor1.Cells[0,4]:=loadstr(ara+66)+' (.'+komutlistesi('genislik')+')';
form2.ValueListEditor1.Cells[0,5]:=loadstr(ara+67)+' (.'+komutlistesi('yukseklik')+')';
form2.ValueListEditor1.Cells[0,6]:=loadstr(ara+75)+' (.'+komutlistesi('ipucu')+')';
form2.ValueListEditor1.Cells[0,7]:=loadstr(ara+96)+' (.'+komutlistesi('renk')+')';
form2.ValueListEditor1.Cells[0,8]:=komutlistesi('Yazitipi');
form2.ValueListEditor1.Cells[0,9]:=loadstr(ara+142)+' (.'+komutlistesi('deger')+')';
form2.ValueListEditor1.Cells[0,10]:=loadstr(ara+143)+' (.'+komutlistesi('secili')+')';
if form1.enabled then
        form2.ValueListEditor1.Cells[1,0]:=komutlistesi('Evet')
else
        form2.ValueListEditor1.Cells[1,0]:=komutlistesi('Hayir');
form2.ValueListEditor1.Cells[1,1]:=form1.Caption;
form2.ValueListEditor1.Cells[1,2]:=inttostr(form1.top);
form2.ValueListEditor1.Cells[1,3]:=inttostr(form1.left);
form2.ValueListEditor1.Cells[1,4]:=inttostr(form1.width);
form2.ValueListEditor1.Cells[1,5]:=inttostr(form1.height);
form2.ValueListEditor1.Cells[1,6]:=form1.Hint;
form2.ValueListEditor1.Cells[1,7]:=inttostr(form1.Color);
form2.ValueListEditor1.Cells[1,8]:=form1.Font.Name;
form2.ValueListEditor1.Cells[1,9]:='';
form2.ValueListEditor1.Cells[1,10]:='';
ValueListEditor1.ItemProps[7].EditStyle:=esEllipsis;
ValueListEditor1.ItemProps[8].EditStyle:=esEllipsis;
ValueListEditor1.ItemProps[9].EditStyle:=esSimple;
end;

procedure TForm2.FormShow(Sender: TObject);      //create sakýncalý oluyor
var
    Device, Driver, Port   : array [0..255] of Char;
    Mode                   : Thandle;
begin
      form2.StatusBar1.SimpleText:=Application.Title;

if (paramstr(1)='')and(proje='yeni') then Yeni2Click(self);
form5.show;
form1.show;
aktifpencere:=true;
aktifPencereNo:=1;
form2.ToolButton5.ImageIndex:=5;

ValueListEditor1.ItemProps[0].PickList.text:=komutlistesi('Evet')+#13+komutlistesi('Hayir');
ValueListEditor1.ItemProps[7].EditStyle:=esEllipsis;
ValueListEditor1.ItemProps[8].EditStyle:=esEllipsis;
ValueListEditor1.ItemProps[9].EditStyle:=esSimple;
Form3.FormShow(Self);
if ParamStr(1)='' then form9.ilkoku;
form2.ComboBox1.Text:=komutlistesi('Form');
grid;
try
 Printer.GetPrinter(Device,Driver,Port,Mode);
except
end;
form3.comboBox1.Items:=printer.printers;
form3.ComboBox1.ItemIndex:=printer.PrinterIndex;
end;

procedure Tform2.gride_yaz;        //týklanan nesnenin özellikleri StringGrid1'e gelsin.
var Dugmemiz: TBitbtn;Etiket:TStatictext;Metin:TEdit;
    onay:TCheckBox; liste: TListBox; acilir: TCombobox ; yazi :TRichedit;
    ara1,ara2:string;
begin
grid;
if lowercase(ComboBox1.Text) = lowercase(komutlistesi('Form')) then
        begin
        if form1.Enabled then ValueListEditor1.Cells[1,0]:=komutlistesi('Evet')
         else ValueListEditor1.Cells[1,0]:=komutlistesi('Hayir');
        ValueListEditor1.Cells[1,1]:=form1.caption;
        ValueListEditor1.Cells[1,2]:=inttostr(form1.top);
        ValueListEditor1.Cells[1,3]:=inttostr(form1.left);
        ValueListEditor1.Cells[1,4]:=inttostr(form1.width);
        ValueListEditor1.Cells[1,5]:=inttostr(form1.height);
        ValueListEditor1.Cells[1,6]:=form1.hint;
        ValueListEditor1.Cells[1,7]:=inttostr(form1.Color);
        ValueListEditor1.Cells[1,8]:=form1.Font.Name;
        FontDialog1.Font:=form1.Font;
        ValueListEditor1.Cells[1,9]:='';
        ValueListEditor1.Cells[1,10]:='';
        end else
if form1.componentcount<>0 then begin
if form1.Components[combobox1.ItemIndex] is TBitBtn then begin
ara1:=lowercase(form1.ada_ayikla((form1.Components[combobox1.ItemIndex] as TBitbtn).name));
ara2:=lowercase(form2.komutlistesi('Dugme'));
  if ara1=ara2 then begin
dugmemiz := form1.Components[combobox1.ItemIndex] as TBitBtn;
ValueListEditor1.ItemProps[9].EditStyle:=esEllipsis;
if dugmemiz.Enabled then ValueListEditor1.Cells[1,0]:=komutlistesi('Evet')
 else ValueListEditor1.Cells[1,0]:=komutlistesi('Hayir');
ValueListEditor1.Cells[1,1]:=dugmemiz.Caption;
ValueListEditor1.Cells[1,2]:=inttostr(dugmemiz.top);
ValueListEditor1.Cells[1,3]:=inttostr(dugmemiz.left);
ValueListEditor1.Cells[1,4]:=inttostr(dugmemiz.width);
ValueListEditor1.Cells[1,5]:=inttostr(dugmemiz.height);
ValueListEditor1.Cells[1,6]:=dugmemiz.hint;
ValueListEditor1.Cells[1,7]:=inttostr(dugmemiz.Font.Color);
ValueListEditor1.Cells[1,8]:=dugmemiz.Font.Name;
FontDialog1.Font:=dugmemiz.Font;
ValueListEditor1.Cells[1,9]:=dugmemiz.HelpKeyword;
ValueListEditor1.Cells[1,10]:='';
   end
   else
if (ara1)=lowercase(form2.komutlistesi('Zamanlayici')) then
 begin
   dugmemiz := form1.Components[combobox1.ItemIndex] as TBitBtn;
  if dugmemiz.Enabled then ValueListEditor1.Cells[1,0]:=komutlistesi('Evet')
 else ValueListEditor1.Cells[1,0]:=komutlistesi('Hayir');
ValueListEditor1.ItemProps[7].EditStyle:=esSimple;
ValueListEditor1.ItemProps[8].EditStyle:=esSimple;
ValueListEditor1.Cells[1,1]:='';
ValueListEditor1.Cells[1,2]:=inttostr(dugmemiz.top);
ValueListEditor1.Cells[1,3]:=inttostr(dugmemiz.left);
ValueListEditor1.Cells[1,4]:=inttostr(dugmemiz.width);
ValueListEditor1.Cells[1,5]:=inttostr(dugmemiz.height);
ValueListEditor1.Cells[1,6]:='';
ValueListEditor1.Cells[1,7]:='';
ValueListEditor1.Cells[1,8]:='';
ValueListEditor1.Cells[1,9]:=dugmemiz.Hint;
ValueListEditor1.Cells[1,10]:='';
   end
   else
if (ara1)=lowercase(form2.komutlistesi('Tablo')) then
   begin
dugmemiz := form1.Components[combobox1.ItemIndex] as TBitBtn;
if dugmemiz.Enabled then ValueListEditor1.Cells[1,0]:=komutlistesi('Evet')
 else ValueListEditor1.Cells[1,0]:=komutlistesi('Hayir');
ValueListEditor1.ItemProps[7].EditStyle:=esSimple;
ValueListEditor1.ItemProps[8].EditStyle:=esSimple;
ValueListEditor1.ItemProps[9].EditStyle:=esEllipsis;
ValueListEditor1.Cells[1,1]:='';
ValueListEditor1.Cells[1,2]:=inttostr(dugmemiz.top);
ValueListEditor1.Cells[1,3]:=inttostr(dugmemiz.left);
ValueListEditor1.Cells[1,4]:=inttostr(dugmemiz.width);
ValueListEditor1.Cells[1,5]:=inttostr(dugmemiz.height);
ValueListEditor1.Cells[1,6]:='';
ValueListEditor1.Cells[1,7]:='';
ValueListEditor1.Cells[1,8]:='';
ValueListEditor1.Cells[1,9]:=dugmemiz.Hint;
ValueListEditor1.Cells[1,10]:='';
   end
   else
if (ara1)=lowercase(form2.komutlistesi('ExcelTablosu')) then
   begin
dugmemiz := form1.Components[combobox1.ItemIndex] as TBitBtn;
if dugmemiz.Enabled then ValueListEditor1.Cells[1,0]:=komutlistesi('Evet')
 else ValueListEditor1.Cells[1,0]:=komutlistesi('Hayir');
ValueListEditor1.ItemProps[7].EditStyle:=esSimple;
ValueListEditor1.ItemProps[8].EditStyle:=esSimple;
ValueListEditor1.ItemProps[9].EditStyle:=esEllipsis;
ValueListEditor1.Cells[1,1]:='';
ValueListEditor1.Cells[1,2]:=inttostr(dugmemiz.top);
ValueListEditor1.Cells[1,3]:=inttostr(dugmemiz.left);
ValueListEditor1.Cells[1,4]:=inttostr(dugmemiz.width);
ValueListEditor1.Cells[1,5]:=inttostr(dugmemiz.height);
ValueListEditor1.Cells[1,6]:='';
ValueListEditor1.Cells[1,7]:='';
ValueListEditor1.Cells[1,8]:='';
ValueListEditor1.Cells[1,9]:=dugmemiz.Hint;
ValueListEditor1.Cells[1,10]:='';
   end;
end;
if form1.Components[combobox1.ItemIndex] is TStaticText then begin
etiket := form1.Components[combobox1.ItemIndex] as TStaticText;
if etiket.Enabled then ValueListEditor1.Cells[1,0]:=komutlistesi('Evet');
if etiket.Enabled=false then ValueListEditor1.Cells[1,0]:=komutlistesi('Hayir');
ValueListEditor1.Cells[1,1]:=etiket.Caption;
ValueListEditor1.Cells[1,2]:=inttostr(etiket.top);
ValueListEditor1.Cells[1,3]:=inttostr(etiket.left);
ValueListEditor1.Cells[1,4]:=inttostr(etiket.width);
ValueListEditor1.Cells[1,5]:=inttostr(etiket.height);
ValueListEditor1.Cells[1,6]:=etiket.hint;
ValueListEditor1.Cells[1,7]:=inttostr(etiket.Color);
ValueListEditor1.Cells[1,8]:=etiket.Font.Name;
ValueListEditor1.Cells[1,9]:='';
ValueListEditor1.Cells[1,10]:='';
end;
if form1.Components[combobox1.ItemIndex] is TEdit then begin
metin := form1.Components[combobox1.ItemIndex] as Tedit;
if metin.Enabled then ValueListEditor1.Cells[1,0]:=komutlistesi('Evet');
if metin.Enabled=false then ValueListEditor1.Cells[1,0]:=komutlistesi('Hayir');
ValueListEditor1.Cells[1,1]:=metin.text;
ValueListEditor1.Cells[1,2]:=inttostr(metin.top);
ValueListEditor1.Cells[1,3]:=inttostr(metin.left);
ValueListEditor1.Cells[1,4]:=inttostr(metin.width);
ValueListEditor1.Cells[1,5]:=inttostr(metin.height);
ValueListEditor1.Cells[1,6]:=metin.hint;
ValueListEditor1.Cells[1,7]:=inttostr(metin.Color);
ValueListEditor1.Cells[1,8]:=metin.Font.Name;
ValueListEditor1.Cells[1,9]:='';
ValueListEditor1.Cells[1,10]:='';
end;
if form1.Components[combobox1.ItemIndex] is TCheckBox then begin
ValueListEditor1.ItemProps[9].EditStyle:=esPickList;
ValueListEditor1.ItemProps[9].PickList.text:=komutlistesi('Evet')+#13+komutlistesi('Hayir');
onay := form1.Components[combobox1.ItemIndex] as TCheckBox;
if onay.Enabled then ValueListEditor1.Cells[1,0]:=komutlistesi('Evet');
if onay.Enabled=false then ValueListEditor1.Cells[1,0]:=komutlistesi('Hayir');
ValueListEditor1.Cells[1,1]:=onay.Caption;
ValueListEditor1.Cells[1,2]:=inttostr(onay.top);
ValueListEditor1.Cells[1,3]:=inttostr(onay.left);
ValueListEditor1.Cells[1,4]:=inttostr(onay.width);
ValueListEditor1.Cells[1,5]:=inttostr(onay.height);
ValueListEditor1.Cells[1,6]:=onay.hint;
ValueListEditor1.Cells[1,7]:=inttostr(onay.Color);
ValueListEditor1.Cells[1,8]:=onay.Font.Name;
if onay.Checked then ValueListEditor1.Cells[1,9]:=komutlistesi('Evet');
if onay.Checked=false then ValueListEditor1.Cells[1,9]:=komutlistesi('Hayir');
ValueListEditor1.Cells[1,10]:='';
end;
if form1.Components[combobox1.ItemIndex] is TListBox then begin
ValueListEditor1.ItemProps[9].EditStyle:=esEllipsis;
liste := form1.Components[combobox1.ItemIndex] as TListBox;
if liste.Enabled then ValueListEditor1.Cells[1,0]:=komutlistesi('Evet');
if liste.Enabled=false then ValueListEditor1.Cells[1,0]:=komutlistesi('Hayir');
if liste.ItemIndex<>-1 then
  ValueListEditor1.Cells[1,1]:=liste.Items[liste.ItemIndex]
 else
  ValueListEditor1.Cells[1,1]:='';
ValueListEditor1.Cells[1,2]:=inttostr(liste.top);
ValueListEditor1.Cells[1,3]:=inttostr(liste.left);
ValueListEditor1.Cells[1,4]:=inttostr(liste.width);
ValueListEditor1.Cells[1,5]:=inttostr(liste.height);
ValueListEditor1.Cells[1,6]:=liste.hint;
ValueListEditor1.Cells[1,7]:=inttostr(liste.Color);
ValueListEditor1.Cells[1,8]:=liste.Font.Name;
ValueListEditor1.Cells[1,9]:='<>';
ValueListEditor1.Cells[1,10]:=inttostr(liste.ItemIndex);
end;
if form1.Components[combobox1.ItemIndex] is TComboBox then begin
ValueListEditor1.ItemProps[9].EditStyle:=esEllipsis;
acilir := form1.Components[combobox1.ItemIndex] as TComboBox;
if acilir.Enabled then ValueListEditor1.Cells[1,0]:=komutlistesi('Evet');
if acilir.Enabled=false then ValueListEditor1.Cells[1,0]:=komutlistesi('Hayir');
ValueListEditor1.Cells[1,1]:=acilir.text;
ValueListEditor1.Cells[1,2]:=inttostr(acilir.top);
ValueListEditor1.Cells[1,3]:=inttostr(acilir.left);
ValueListEditor1.Cells[1,4]:=inttostr(acilir.width);
ValueListEditor1.Cells[1,5]:=inttostr(acilir.height);
ValueListEditor1.Cells[1,6]:=acilir.hint;
ValueListEditor1.Cells[1,7]:=inttostr(acilir.Color);
ValueListEditor1.Cells[1,8]:=acilir.Font.Name;
ValueListEditor1.Cells[1,9]:='<>';
ValueListEditor1.Cells[1,10]:=inttostr(acilir.ItemIndex);
end;
if form1.Components[combobox1.ItemIndex] is TRichEdit then begin
ValueListEditor1.ItemProps[9].EditStyle:=esEllipsis;
yazi := form1.Components[combobox1.ItemIndex] as TRichEdit;
if yazi.Enabled then ValueListEditor1.Cells[1,0]:=komutlistesi('Evet');
if yazi.Enabled=false then ValueListEditor1.Cells[1,0]:=komutlistesi('Hayir');
ValueListEditor1.Cells[1,1]:=yazi.text;
ValueListEditor1.Cells[1,2]:=inttostr(yazi.top);
ValueListEditor1.Cells[1,3]:=inttostr(yazi.left);
ValueListEditor1.Cells[1,4]:=inttostr(yazi.width);
ValueListEditor1.Cells[1,5]:=inttostr(yazi.height);
ValueListEditor1.Cells[1,6]:=yazi.hint;
ValueListEditor1.Cells[1,7]:=inttostr(yazi.Color);
ValueListEditor1.Cells[1,8]:=yazi.Font.Name;
ValueListEditor1.Cells[1,9]:='<>';
ValueListEditor1.Cells[1,10]:='';
end;
end;
end;

procedure Tform2.gridden_oku;   //týklanan nesnenin özellikleri ValueListEditor1'den okunur...
var dugmemiz: TBitBtn;Etiket:TStatictext;Metin:TEdit;sil:string;
    onay:TCheckBox; liste: TListBox; acilir: TCombobox ; yazi :TRichEdit;
    bosResim:TBitmap;
begin
if lowercase(ComboBox1.Text) <> lowercase(komutlistesi('Form')) then begin
sil:=lowercase(ValueListEditor1.Cells[1,0]);
if form1.ComponentCount=0 then exit;
if form1.Components[combobox1.ItemIndex] is TBitBtn then begin
dugmemiz := form1.Components[combobox1.ItemIndex] as TBitBtn;
 if form1.ada_ayikla(dugmemiz.name)=form2.komutlistesi('Dugme') then begin
        if sil=lowercase(komutlistesi('Evet')) then dugmemiz.Enabled:=true;
        if sil=lowercase(komutlistesi('Hayir')) then dugmemiz.Enabled:=false;
        dugmemiz.Caption:=ValueListEditor1.Cells[1,1];
        dugmemiz.top:=strtoint(ValueListEditor1.Cells[1,2]);
        dugmemiz.left:=strtoint(ValueListEditor1.Cells[1,3]);
        dugmemiz.width:=strtoint(ValueListEditor1.Cells[1,4]);
        dugmemiz.height:=strtoint(ValueListEditor1.Cells[1,5]);
        dugmemiz.hint:=ValueListEditor1.Cells[1,6];
        dugmemiz.Font.Color:=strtoint(ValueListEditor1.Cells[1,7]);
        dugmemiz.Font.Name:=ValueListEditor1.Cells[1,8];
        dugmemiz.HelpKeyword:=ValueListEditor1.Cells[1,9];
        dugmemiz.HelpType:=htContext;
        if dugmemiz.HelpKeyword<>'' then begin
         try
          if FileExists(dugmemiz.HelpKeyword) then
          dugmemiz.Glyph.LoadFromFile(dugmemiz.HelpKeyword);
         except
         end;
        end
        else begin
          bosResim := TBitmap.Create;
          dugmemiz.Glyph:=bosResim;
          bosResim.Free;
        end;
  end
  else
  if (form1.ada_ayikla(dugmemiz.name)=form2.komutlistesi('Zamanlayici'))
     or(form1.ada_ayikla(dugmemiz.name)=form2.komutlistesi('Tablo'))
     or(form1.ada_ayikla(dugmemiz.name)=form2.komutlistesi('ExcelTablosu'))
     then begin
        if sil=lowercase(komutlistesi('Evet')) then dugmemiz.Enabled:=true;
        if sil=lowercase(komutlistesi('Hayir')) then dugmemiz.Enabled:=false;
        dugmemiz.top:=strtoint(ValueListEditor1.Cells[1,2]);
        dugmemiz.left:=strtoint(ValueListEditor1.Cells[1,3]);
        dugmemiz.width:=strtoint(ValueListEditor1.Cells[1,4]);
        dugmemiz.height:=strtoint(ValueListEditor1.Cells[1,5]);
        dugmemiz.hint:=ValueListEditor1.Cells[1,9];
  end;
end else
if form1.Components[combobox1.ItemIndex] is TStatictext then begin
etiket := form1.Components[combobox1.ItemIndex] as TStatictext;
if sil=lowercase(komutlistesi('Evet')) then etiket.Enabled:=true;
if sil=lowercase(komutlistesi('Hayir')) then etiket.Enabled:=false;
etiket.Caption:=ValueListEditor1.Cells[1,1];
etiket.top:=strtoint(ValueListEditor1.Cells[1,2]);
etiket.left:=strtoint(ValueListEditor1.Cells[1,3]);
etiket.width:=strtoint(ValueListEditor1.Cells[1,4]);
etiket.height:=strtoint(ValueListEditor1.Cells[1,5]);
etiket.hint:=ValueListEditor1.Cells[1,6];
etiket.Color:=strtoint(ValueListEditor1.Cells[1,7]);
etiket.Font.Name:=ValueListEditor1.Cells[1,8];
end else
if form1.Components[combobox1.ItemIndex] is TEdit then begin
metin := form1.Components[combobox1.ItemIndex] as Tedit;
if sil=lowercase(komutlistesi('Evet')) then  metin.Enabled:=true;
if sil=lowercase(komutlistesi('Hayir')) then  metin.Enabled:=false;
metin.text:=ValueListEditor1.Cells[1,1];
metin.top:=strtoint(ValueListEditor1.Cells[1,2]);
metin.left:=strtoint(ValueListEditor1.Cells[1,3]);
metin.width:=strtoint(ValueListEditor1.Cells[1,4]);
metin.height:=strtoint(ValueListEditor1.Cells[1,5]);
metin.hint:=ValueListEditor1.Cells[1,6];
metin.Color:=strtoint(ValueListEditor1.Cells[1,7]);
metin.Font.Name:=ValueListEditor1.Cells[1,8];
end else
if form1.Components[combobox1.ItemIndex] is TCheckBox then begin
onay := form1.Components[combobox1.ItemIndex] as TCheckBox;
if sil=lowercase(komutlistesi('Evet')) then  onay.Enabled:=true;
if sil=lowercase(komutlistesi('Hayir')) then  onay.Enabled:=false;
onay.Caption:=ValueListEditor1.Cells[1,1];
onay.top:=strtoint(ValueListEditor1.Cells[1,2]);
onay.left:=strtoint(ValueListEditor1.Cells[1,3]);
onay.width:=strtoint(ValueListEditor1.Cells[1,4]);
onay.height:=strtoint(ValueListEditor1.Cells[1,5]);
onay.hint:=ValueListEditor1.Cells[1,6];
onay.Color:=strtoint(ValueListEditor1.Cells[1,7]);
onay.Font.Name:=ValueListEditor1.Cells[1,8];
sil:=lowercase(ValueListEditor1.Cells[1,9]);
if sil=lowercase(komutlistesi('Evet')) then  onay.Checked:=true;
if sil=lowercase(komutlistesi('Hayir')) then  onay.Checked:=false;
end else
if form1.Components[combobox1.ItemIndex] is TListBox then begin
liste := form1.Components[combobox1.ItemIndex] as TListBox;
if sil=lowercase(komutlistesi('Evet')) then  liste.Enabled:=true;
if sil=lowercase(komutlistesi('Hayir')) then  liste.Enabled:=false;
//liste.Items[liste.ItemIndex]:=ValueListEditor1.Cells[1,1];
liste.top:=strtoint(ValueListEditor1.Cells[1,2]);
liste.left:=strtoint(ValueListEditor1.Cells[1,3]);
liste.width:=strtoint(ValueListEditor1.Cells[1,4]);
liste.height:=strtoint(ValueListEditor1.Cells[1,5]);
liste.hint:=ValueListEditor1.Cells[1,6];
liste.Color:=strtoint(ValueListEditor1.Cells[1,7]);
liste.Font.Name:=ValueListEditor1.Cells[1,8];
//liste.ItemIndex:=strtoint(ValueListEditor1.Cells[1,10]);
end else
if form1.Components[combobox1.ItemIndex] is Tcombobox then begin
acilir := form1.Components[combobox1.ItemIndex] as Tcombobox;
if sil=lowercase(komutlistesi('Evet')) then  acilir.Enabled:=true;
if sil=lowercase(komutlistesi('Hayir')) then  acilir.Enabled:=false;
acilir.text:=ValueListEditor1.Cells[1,1];
acilir.top:=strtoint(ValueListEditor1.Cells[1,2]);
acilir.left:=strtoint(ValueListEditor1.Cells[1,3]);
acilir.width:=strtoint(ValueListEditor1.Cells[1,4]);
acilir.height:=strtoint(ValueListEditor1.Cells[1,5]);
acilir.hint:=ValueListEditor1.Cells[1,6];
acilir.Color:=strtoint(ValueListEditor1.Cells[1,7]);
acilir.Font.Name:=ValueListEditor1.Cells[1,8];
acilir.ItemIndex:=strtoint(ValueListEditor1.Cells[1,10]);
acilir.ItemIndex:=strtoint(ValueListEditor1.Cells[1,10]);
end else
if form1.Components[combobox1.ItemIndex] is TRichEdit then begin
yazi := form1.Components[combobox1.ItemIndex] as TRichEdit;
if sil=lowercase(komutlistesi('Evet')) then  yazi.Enabled:=true;
if sil=lowercase(komutlistesi('Hayir')) then  yazi.Enabled:=false;
yazi.text:=ValueListEditor1.Cells[1,1];
yazi.top:=strtoint(ValueListEditor1.Cells[1,2]);
yazi.left:=strtoint(ValueListEditor1.Cells[1,3]);
yazi.width:=strtoint(ValueListEditor1.Cells[1,4]);
yazi.height:=strtoint(ValueListEditor1.Cells[1,5]);
yazi.hint:=ValueListEditor1.Cells[1,6];
yazi.Color:=strtoint(ValueListEditor1.Cells[1,7]);
yazi.Font.Name:=ValueListEditor1.Cells[1,8];
end;
end
else
        begin
        sil:=lowercase(ValueListEditor1.Cells[1,0]);
        if sil=lowercase(komutlistesi('Evet')) then  form1.Enabled:=true;
        if sil=lowercase(komutlistesi('Hayir')) then  form1.Enabled:=false;
        form1.caption:=ValueListEditor1.Cells[1,1];
        form1.top:=strtoint(ValueListEditor1.Cells[1,2]);
        form1.left:=strtoint(ValueListEditor1.Cells[1,3]);
        form1.width:=strtoint(ValueListEditor1.Cells[1,4]);
        form1.height:=strtoint(ValueListEditor1.Cells[1,5]);
        form1.hint:=ValueListEditor1.Cells[1,6];
        form1.Color:=strtoint(ValueListEditor1.Cells[1,7]);
        form1.Font.Name:=ValueListEditor1.Cells[1,8];
        end;
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
gride_yaz;
end;

procedure TForm2.Button1Click(Sender: TObject);    //son nesneyi sil...
var i:integer;
begin
if aktifpencere then begin
 if Form1.ComponentCount>0 then begin
   form1.Components[Form1.ComponentCount-1].Free;
   form2.ComboBox1.Items.Clear;
   for i:=0 to form1.ComponentCount-1 do
   begin
    form2.ComboBox1.Items.Add(form1.Components[i].Name);
   end;
   form2.ComboBox1.text:=komutlistesi('Form');
   form1.nesne_sayisi;
   end;
end
else
form5.richedit1.Undo;
end;

procedure TForm2.k1Click(Sender: TObject);
begin
kapatlen:=true;
hrt.Free;
close;
end;

function Tform2.dosyaadi_ayikla(dsy:string):string;  //uzanti yok ediliyor
var sonuc:string;
begin
sonuc:='';
sonuc:=copy(dsy,1,length(dsy)-length(extractfileext(dsy)) );
dosyaadi_ayikla:=sonuc;
end;

function Tform2.projeadi_ayikla(dsy:string):string;  //uzanti ve klasör yok ediliyor
var sonuc:string;
begin
sonuc:='';
sonuc:=copy(dsy,length(ExtractFilePath(dsy))+1,length(dsy)-length(ExtractFilePath(dsy))+1);
projeadi_ayikla:=sonuc;
end;

procedure TForm2.A1Click(Sender: TObject);
begin
form1.FormA1Click(self);
akilliListe;
form5.ListBox1.Clear;
form1.nesne_sayisi;
end;

procedure TForm2.Kaydet1Click(Sender: TObject);   //Farklý Kaydet
begin
form1.FormKaydet1Click(self);
if saveDialog1.FileName<>'' then begin
form1.nesne_sayisi;
form5.RichEdit1.Lines.SaveToFile(dosyaadi_ayikla(savedialog1.FileName)+'.proje');
form5.RichEdit1.Modified:=false;
proje:=projeadi_ayikla(saveDialog1.FileName);
klasorproje:=dosyaadi_ayikla(saveDialog1.FileName);
if form2.rke1.Checked then begin
form2.caption:='Yunus - <'+proje+'> ['+loadstr(92)+']';
form5.Caption:=loadstr(82)+' - '+dosyaadi_ayikla(savedialog1.filename)+'.proje';
end
else
begin
form2.caption:='Yunus - <'+proje+'> ['+loadstr(1092)+']';
form5.Caption:=loadstr(1082)+' - '+dosyaadi_ayikla(savedialog1.filename)+'.proje';
end;
form2.ComboBox1.Text:=komutlistesi('Form');
end;
end;

procedure TForm2.ToolButton7Click(Sender: TObject); //DUR (Ctrl+F2)
var i:integer;
begin
breaknoktasi:=-1;
breakBayragi:=false;
form5.StatusBar1.Refresh;
ToolButton21.Enabled:=false;
devam2.Enabled:=false;
ToolButton9.Enabled:=true;
ToolButton7.Enabled:=false;
   for i:=0 to form2.ListView1.Items.Count-1 do
     if lowercase(form2.ListView1.Items[i].Caption)=lowercase(form2.komutlistesi('Form')) then begin
     ListItem:= form2.ListView1.Items[i];
           if (lowercase(listitem.SubItems[0])=lowercase(form2.komutlistesi('kapanirken'))) then
              begin //son deðerler ve ayarlar için
              form2.calistir(strtoint(listitem.SubItems[1]),'Form');
              break;
              end;
     end;
form2.ComboBox1.Text:=form2.komutlistesi('Form');
form2.gride_yaz;
ComboBox1.Enabled:=true;
ValueListEditor1.Enabled:=true;
Yorumla1.Enabled:=true;
altr1.Enabled:=true;
dur1.Enabled:=false;
Dzen1.Enabled:=true;
toolbutton5.Enabled:=true;
sil2.ShortCut:=TextToShortCut('Del');
kes2.ShortCut:=TextToShortCut('Ctrl+X');
kopyala2.ShortCut:=TextToShortCut('Ctrl+C');
Yaptr2.ShortCut:=TextToShortCut('Ctrl+V');
TmnSe2.ShortCut:=TextToShortCut('Ctrl+A');
form2.WindowState:=wsNormal;
form5.WindowState:=wsNormal;
form2.Visible:=true;
form5.Visible:=true;
form1.Hide;
form1.Show;
//if aktifpencere then form5.show else form1.show;
StopWav;
if form2.rke1.Checked then begin
form2.caption:='Yunus - <'+proje+'> ['+loadstr(92)+']';
end
else
begin
form2.caption:='Yunus - <'+proje+'> ['+loadstr(1092)+']';
end;
form5.RichEdit1.ReadOnly:=false;
PopupMenu1.AutoPopup:=true;
PopupMenu2.AutoPopup:=true;
if KalcDeikenler1.Checked=false then ListView2.Items.Clear;

if form1.ComponentCount>0 then      //eski Timer'lar ve Tablo'lar yok edilir
 begin                              //Excel Tablosu ise görünür
 for i:=form1.ComponentCount-1 downto 0 do
  if (form1.Components[i] is TTimer) or (form1.Components[i] is TClientDataSet)
   then form1.Components[i].Free
  else
  if (form1.Components[i] is TBitbtn) then
     if (Form1.ada_ayikla((form1.Components[i] as TBitbtn).name)=komutlistesi('Zamanlayici'))or
        (Form1.ada_ayikla((form1.Components[i] as TBitbtn).name)=komutlistesi('Tablo')) or
        (Form1.ada_ayikla((form1.Components[i] as TBitbtn).name)=komutlistesi('excelTablosu'))
     then
         (form1.Components[i] as TBitbtn).Visible:=true;
 end;
Form1.nesne_sayisi;
for i:=0 to length(excelbook)-1 do
 ExcelBook[i].book.quit; //direkt kapatýver, sonra da diziyi sýfýrla
SetLength(ExcelBook,0);
if derlemeAktif then form1.derlemeThread.Free;
derlemeAktif:=false;
end;

procedure TForm2.ToolButton21Click(Sender: TObject); //breakpoint için devam tuþu
begin
calistir(breaknoktasi,'Form');
{breaknoktasi:=-1;
breakBayragi:=false;
ToolButton21.Enabled:=false;
devam2.Enabled:=false;}
end;

procedure TForm2.ToolButton9Click(Sender: TObject); //RUN (F9)
var key:word;shift:TShiftState;
    i,k:integer;
    gecici:TTimer;
    geciciVT:TClientDataSet;
    loading:string;
begin
breaknoktasi:=-1; breakBayragi:=false;
form5.Show;
if form3.RadioGroup1.ItemIndex=1 then begin
  form2.WindowState:=wsMinimized;
  form5.WindowState:=wsMinimized;
  end;
if form3.RadioGroup1.ItemIndex=2 then begin
  form2.Visible:=false;
  form5.Visible:=false;
  end;
form1.FareImleciNormallestir;
ToolButton9.Enabled:=false;
ToolButton7.Enabled:=true;
form3.Close;
form4.close;
TestPrintPreviewDlg.CloseCmdExecute(self);
ComboBox1.Enabled:=false;
ValueListEditor1.Enabled:=false;
Yorumla1.Enabled:=false;
ToolButton1.Down:=true;
Dzen1.Enabled:=false;
toolbutton5.Enabled:=false;
sil2.ShortCut:=TextToShortCut('');
kes2.ShortCut:=TextToShortCut('');
kopyala2.ShortCut:=TextToShortCut('');
Yaptr2.ShortCut:=TextToShortCut('');
TmnSe2.ShortCut:=TextToShortCut('');
combobox1.Text:=komutlistesi('Form');
form1.Hide;
form1.Show;
aktifpencere:=true;
aktifPencereNo:=1;
form2.ToolButton5.ImageIndex:=5;
if form2.rke1.Checked then
  form2.caption:='Yunus - <'+proje+'> ['+loadstr(93)+']'
else
  form2.caption:='Yunus - <'+proje+'> ['+loadstr(1093)+']';

form5.RichEdit1.ReadOnly:=true;
form5.Hatalarsil1Click(self);  //hata penceresi
PopupMenu1.AutoPopup:=false;
PopupMenu2.AutoPopup:=false;
key:=VK_ESCAPE;
Form1.FormKeyDown(self,key,shift); //seçim shape'inden kurtulmak için
if dur1.Enabled then exit;  //tekrar Run edilirse gereksiz beklemeyelim...
altr1.Enabled:=false;
dur1.Enabled:=true;

if form1.ComponentCount>0 then      //eski Timer'lar ve Tablolar yok edilir
 begin
 for i:=form1.ComponentCount-1 downto 0 do begin
   if (form1.Components[i] is TTimer) or (form1.Components[i] is TClientDataSet)  then
       form1.Components[i].Free;
   end;
 end;
k:=0;
if form1.ComponentCount<>0 then
  for i:=0 to form1.ComponentCount-1 do
    if (form1.Components[i] is TBitbtn) then
     if Form1.ada_ayikla((form1.Components[i] as TBitbtn).name)=komutlistesi('Zamanlayici') then
      begin
         (form1.Components[i] as TBitbtn).Visible:=false;
         gecici:=TTimer.Create(Form1);
         gecici.Enabled:=(form1.Components[i] as TBitbtn).Enabled;
         gecici.Interval:=strtoint((form1.Components[i] as TBitbtn).hint);
         gecici.Name:=(form1.Components[i] as TBitbtn).Name+'Gercek';
         gecici.OnTimer:=form1.TimerTiklama;
      end
      else if (Form1.ada_ayikla((form1.Components[i] as TBitbtn).name)=komutlistesi('Tablo')) then
      begin
         (form1.Components[i] as TBitbtn).Visible:=false;
         geciciVT:=TClientDataSet.Create(Form1);
         geciciVT.FileName:= (form1.Components[i] as TBitbtn).hint;
         if FileExists(geciciVT.FileName) then
          geciciVT.Active:=(form1.Components[i] as TBitbtn).Enabled;
         geciciVT.Name:=(form1.Components[i] as TBitbtn).Name+'Gercek';
      end
      else if (Form1.ada_ayikla((form1.Components[i] as TBitbtn).name)=komutlistesi('ExcelTablosu')) then
      begin
         (form1.Components[i] as TBitbtn).Visible:=false;
         inc(k);
         SetLength(excelbook,k);
         ExcelBook[k-1].book:=createoleobject('excel.application');//excel uygulamasý
         ExcelBook[k-1].book.visible:=form3.CheckBox8.Checked;
         if fileexists((form1.Components[i] as TBitbtn).hint) then
         ExcelBook[k-1].book.workbooks.open((form1.Components[i] as TBitbtn).hint); //yeni calisma kitabini ekle
         ExcelBook[k-1].num:=strtoint(form1.no_ayikla((form1.Components[i] as TBitbtn).name));
      end;
SetLength(fordegisken,0);

Yorumla1Click(self); //KÝLÝT KOMUT

form2.Width:=form2.Width+1; //to resize both of the listviews...
form2.Width:=form2.Width-1;

loading:=form8.StaticText2.Caption;

if form2.rke1.Checked then
  form8.StaticText2.Caption:='Form Yuklenince olayý çalýþtýrýlýyor'
else
  form8.StaticText2.Caption:='Form OnLoad is being executed';
//Derle;     //iþte kod çalýþýyoooor...   thread yapýlabilirdim, vazgeçtim
           //Form Yuklenince þimdi çalýþýyor...
   for i:=0 to form2.ListView1.Items.Count-1 do
     if lowercase(form2.ListView1.Items[i].Caption)=lowercase(form2.komutlistesi('Form')) then begin
     ListItem:= form2.ListView1.Items[i];
           if (lowercase(listitem.SubItems[0])=lowercase(form2.komutlistesi('Yuklenince'))) then
              begin //ilk deðerler ve ayarlar için
              form2.calistir(strtoint(listitem.SubItems[1]),'Form');
              break;
              end;
     end;
form8.StaticText2.Caption:=loading;
form8.close; //yuklenince uygulanýp kapansýn Derleme Penceresi
end;

procedure TForm2.altr1Click(Sender: TObject);
begin
ToolButton9Click(self);
end;

procedure TForm2.dur1Click(Sender: TObject);
begin
ToolButton7Click(self);
end;

procedure TForm2.Seenekler2Click(Sender: TObject);
begin
form3.showmodal;
end;

procedure TForm2.Sil1Click(Sender: TObject);
begin
if aktifpencere then begin
form1.sil;
form1.nesne_sayisi;
end
else
form5.richedit1.ClearSelection;
end;

procedure TForm2.Hakknda1Click(Sender: TObject);
begin
form4.Image1.Visible:=true;
form4.showmodal;
end;

procedure TForm2.TmnSe1Click(Sender: TObject);
begin
if aktifpencere then begin
form1.tumunusec;
end
else
begin
form5.RichEdit1.SelStart:=1;
form5.RichEdit1.SelLength:=length(form5.RichEdit1.Lines.text);
end;
end;

procedure TForm2.Kes1Click(Sender: TObject);
begin
if aktifpencere then begin
form1.kes;
form1.nesne_sayisi;
end
else
form5.richedit1.CutToClipboard;
end;

procedure TForm2.Kopyala1Click(Sender: TObject);
begin
if aktifpencere then begin
form1.kopyala(false);
end
else
form5.richedit1.CopyToClipboard;
end;

procedure TForm2.Yaptr1Click(Sender: TObject);
begin
if aktifpencere then begin
form1.yapistir;
end
else
form5.richedit1.PasteFromClipboard;
end;

procedure TForm2.FormKod1Click(Sender: TObject);
begin

if aktifpencere then
begin
form5.WindowState:=wsNormal;
form5.show;
 if form5.PageControl1.ActivePageIndex=0 then
  if  form5.RichEdit1.enabled then
   form5.RichEdit1.SetFocus;
end
else
begin
 form1.show;
end;

end;

procedure TForm2.Nesnezellikleri1Click(Sender: TObject);
begin
form2.WindowState:=wsNormal;
form2.visible:=true;
form2.PageControl1.ActivePageIndex:=0;
if form2.ValueListEditor1.Enabled then
 form2.ValueListEditor1.SetFocus
 else
 form2.PageControl1.SetFocus;
end;

procedure TForm2.Bilgi1Click(Sender: TObject);
var msj:string;
var toplam:longint;i:integer;
begin
toplam:=0;
if form5.RichEdit1.Lines.Count<>0 then
 for i:=0 to form5.RichEdit1.lines.Count-1 do
  toplam:=toplam+length(form5.RichEdit1.Lines[i]);

if rke1.Checked then
msj:='Proje Adý: '+klasorproje+' / '+proje+#13
      +#13+inttostr(butt)+chr(9)+' Düðme'
      +#13+inttostr(labe)+chr(9)+' Etiket'
      +#13+inttostr(edit)+chr(9)+' Metin Kutusu'
      +#13+inttostr(check)+chr(9)+' Onay Kutusu'
      +#13+inttostr(list)+chr(9)+' Liste Kutusu'
      +#13+inttostr(combo)+chr(9)+' Açýlýr Kutu'
      +#13+inttostr(REdit)+chr(9)+' Yazý Kutusu'
      +#13+inttostr(ExcelTablo)+chr(9)+' Excel Tablosu'
      +#13+inttostr(timer)+chr(9)+' Zamanlayýcý*'
      +#13+inttostr(tablo)+chr(9)+' Tablo*'
      +#13+#13+'Toplam Nesne Sayýsý: '+inttostr(butt+labe+edit+check+list+combo+redit+timer+tablo+ExcelTablo)
      +#13+'*Gizli Nesne Sayýsý: '+inttostr(form1.ComponentCount-(butt+labe+edit+check+list+combo+redit+timer+tablo+ExcelTablo))
      +#13+#13+'Kod Satýrý: '+inttostr(form5.RichEdit1.Lines.Count)
      +#13+'Kod Alaný: '+inttostr(toplam)+ ' byte'
else
msj:='Project: '+klasorproje+' / '+proje+#13
      +#13+inttostr(butt)+#9+' Button(s)'
      +#13+inttostr(labe)+#9+' Label(s)'
      +#13+inttostr(edit)+#9+' Edit(s)'
      +#13+inttostr(check)+#9+' CheckBox(es)'
      +#13+inttostr(list)+#9+' ListBox(es)'
      +#13+inttostr(combo)+#9+' ComboBox(es)'
      +#13+inttostr(redit)+#9+' RichEdit(s)'
      +#13+inttostr(ExcelTablo)+#9+' ExcelTable(s)'
      +#13+inttostr(timer)+#9+' Timer(s)*'
      +#13+inttostr(tablo)+#9+' Table(s)*'
      +#13+#13+'Total Components: '+inttostr(butt+labe+edit+check+list+combo+redit+timer+tablo+ExcelTablo)
      +#13+'*Hidden Components: '+inttostr(form1.ComponentCount-(butt+labe+edit+check+list+combo+redit+timer+tablo+ExcelTablo))
      +#13+#13+'Code Lines: '+inttostr(form5.RichEdit1.Lines.Count)
      +#13+'Code Size: '+inttostr(toplam)+' byte(s)';

ShowMessage(msj);
end;

function ada_ayikla(met:string):string;  //son rakamlarý siliyoruz
var i:integer;sonuc:string;
begin
sonuc:='';
for i:=1 to length(met) do
   if met[i] in ['a'..'z','A'..'Z'] then
     sonuc:=sonuc+met[i];
ada_ayikla:=sonuc;
end;

procedure TForm2.Yorumla1Click(Sender: TObject);  //F9
var str1,str2:string;
begin
if rke1.Checked then
 begin
 str1:='Proje adý: ';
 str2:='(* kaydedilmemiþ)';
 end
 else
 begin
 str1:='Project: ';
 str2:='(* not saved)';
 end;

if klasorproje<>'' then
form8.StaticText1.Caption:=str1+chr(VK_TAB)+proje+'.proje'
else
form8.StaticText1.Caption:=str1+chr(VK_TAB)+str2;
form8.StaticText2.Caption:='';
form8.StaticText3.Caption:='';
form8.StaticText4.Caption:='';
if form3.CheckBox7.Checked then form8.Show;
if form2.ToolButton9.Enabled then form8.show;
derle;
end;

procedure TForm2.indekiler1Click(Sender: TObject);
begin
WinExec(pchar('HH.EXE '+ExtractFilePath(Application.ExeName)+'yunus.chm'), SW_SHOWNORMAL)
end;

procedure TForm2.ste1Click(Sender: TObject);
begin
form1.uste;
end;

procedure TForm2.Alta1Click(Sender: TObject);
begin
form1.alta;
end;

procedure TForm2.Sola1Click(Sender: TObject);
begin
form1.sola;
end;

procedure TForm2.Saa1Click(Sender: TObject);
begin
form1.saga;
end;

procedure TForm2.Yataydat1Click(Sender: TObject);
begin
form1.yataydagit;
end;

procedure TForm2.Dikeydat1Click(Sender: TObject);
begin
form1.dikeydagit;
end;

procedure TForm2.Yeni2Click(Sender: TObject);
var i,nesnesayisi:integer;
    ayarini:TIniFile;
    formc:string;
    forml,formt,formw,formh,forml2,formt2,formw2,formh2,formstate:integer;
    dizin:string;
//    ara:integer;
begin
Application.Title := form4.label4.Caption;
   for i:=1 to 256 do
     BreakPointListesi[i]:=-1; //boþ liste
form5.StatusBar1.SimplePanel:=false;
   form5.RichEdit1.CaretX:=0;
   form5.RichEdit1.CaretY:=0;
form16.ListView1.Items.Clear;
ToolButton7.Enabled:=false;
ToolButton9.Enabled:=true;
form2.label1.Caption:='0';degiskensayisi:=0;
Screen.Cursor:=crDefault;
form3.Close;
form4.close;
form5.Show;
TestPrintPreviewDlg.CloseCmdExecute(self);
form7.close;
form8.Close;
form9.Close;
form11.Close;
form12.Close;
form16.Close;
Form9.ilkoku;
form5.ListBox1.Clear;

dizin:=ExtractFilePath(Application.ExeName);
if FileExists(dizin+'\varsayilan.ayar') then begin
akilliListe;  //sýk kullanýlanlar listesi güncellenir
ayarini:=TIniFile.Create(dizin+'\varsayilan.ayar');    //form ayar bilgileri
form1.Enabled:=true;
form1.PopupMenu:=form2.PopupMenu1;
     formc:=ayarini.readstring('Form_1','Baslik','');
     forml:=ayarini.readinteger('Form_1','Sol',-99);
     formt:=ayarini.readinteger('Form_1','Ust',-99);
     formw:=ayarini.readinteger('Form_1','Genislik',-99);
     formh:=ayarini.readinteger('Form_1','Yukseklik',-99);
     formstate:=ayarini.ReadInteger('Form_1','Durum',-99);
     if ayarini.readInteger('Form_1','Renk',-99)<>-99 then
     form1.color:=ayarini.readInteger('Form_1','Renk',-99);
     if ayarini.readString('Form_1','YazitipiAdi','')<>'' then
     form1.font.name:=ayarini.readString('Form_1','YazitipiAdi','');
     if ayarini.readInteger('Form_1','YazitipiRengi',-9)<>-9 then
     form1.font.color:=ayarini.readInteger('Form_1','YazitipiRengi',-9);
     form1.font.Height:=ayarini.readInteger('Form_1','YazitipiYukseklik',-11);
     form1.font.size:=ayarini.readInteger('Form_1','YazitipiBoyut',-9);
     form1.Hint:='';
     form1.Font.Style   := TFontStyles(Byte(ayarini.ReadInteger('Form_1', 'Stil', Byte(form1.Font.Style))));
     form1.Font.CharSet := TFontCharSet(ayarini.ReadInteger('Form_1', 'CharSet', form1.Font.CharSet));

     form2.Left:=ayarini.readinteger('Form_2','Sol',-99);
     form2.top:=ayarini.readinteger('Form_2','Ust',-99);
     form2.width:=ayarini.readinteger('Form_2','Genislik',-99);
     form2.height:=ayarini.readinteger('Form_2','Yukseklik',-99);

     forml2:=ayarini.readinteger('Form_5','Sol',-99);
     formt2:=ayarini.readinteger('Form_5','Ust',-99);
     formw2:=ayarini.readinteger('Form_5','Genislik',-99);
     formh2:=ayarini.readinteger('Form_5','Yukseklik',-99);
     if (forml2<>-99)and(formt2<>99) then form5.setbounds(forml2,formt2,formw2,formh2);

     form5.RichEdit1.Font.Name:=ayarini.ReadString('Form_5','Yazitipi','');
     form5.RichEdit1.Font.Size:=ayarini.Readinteger('Form_5','Yazitipi_Size',-99);
     form5.RichEdit1.Font.color:=colortorgb(ayarini.Readinteger('Form_5','Yazi_rengi',-99));
     form5.RichEdit1.Color:=colortorgb( ayarini.readinteger('Form_5','Arkaplan_rengi',-99));
     form5.RichEdit1.Font.Style   := TFontStyles(Byte(ayarini.ReadInteger('Form_5', 'Stil', Byte(form5.RichEdit1.Font.Style))));
     form5.RichEdit1.Font.CharSet := TFontCharSet(ayarini.ReadInteger('Form_5', 'CharSet', form5.RichEdit1.Font.CharSet));

     form3.CheckBox1.Checked:=ayarini.ReadBool('Form_3','Ustte',false);
     SetWindowPos(Form2.handle, HWND_NOTOPMOST,Form2.Left, Form2.Top, Form2.Width, Form2.Height,0);
     form3.RadioGroup1.ItemIndex:=ayarini.ReadInteger('Form_3','Etiket',0);
     form3.CheckBox3.Checked:=ayarini.ReadBool('Form_3','Tasarim',false);
     form3.CheckBox4.Checked:=ayarini.ReadBool('Form_3','Ipucu',false);
     form3.CheckBox5.Checked:=ayarini.ReadBool('Form_3','Renkli',false);
     form3.CheckBox6.Checked:=ayarini.ReadBool('Form_3','Ses',false);
     form3.CheckBox7.Checked:=ayarini.ReadBool('Form_3','DerlemePenceresi',false);
     form3.CheckBox8.Checked:=ayarini.ReadBool('Form_3','ExcelGorunur',false);
     form3.CheckBox9.Checked:=ayarini.ReadBool('Form_3','YapiskanSecim',false);
     form3.TrackBar1.Position:=ayarini.ReadInteger('Form_3','Oncelik',-1);
     form3.label12.Font.Color:=colortorgb(ayarini.readinteger('Form_3','Olay_Arkaplan_rengi',-99));
     form3.label13.Font.Color:=colortorgb(ayarini.readinteger('Form_3','Aciklama_Arkaplan_rengi',-99));
     form3.label18.Font.Color:=colortorgb(ayarini.readinteger('Form_3','Metin_rengi',-99));
     form3.label12.Color:=colortorgb( ayarini.readinteger('Form_5','Arkaplan_rengi',-99));
     form3.label13.Color:=colortorgb( ayarini.readinteger('Form_5','Arkaplan_rengi',-99));
     form3.label6.Color:=colortorgb( ayarini.readinteger('Form_5','Arkaplan_rengi',-99));

     form3.CheckBox10.Checked:=ayarini.readBool('Form_3','IzgarayaDaya',false);
     form3.CheckBox11.Checked:=ayarini.readBool('Form_3','OtoYardim',true);
     form3.SpinEdit2.Value:=ayarini.ReadInteger('Form_3','Grid',-1);
     form3.SpinEdit3.Value:=ayarini.ReadInteger('Form_3','Boyutla',-1);
     sizeBorder:=form3.SpinEdit3.Value;

     Application.HintHidePause:=ayarini.readInteger('Form_3','Ipucu_suresi',-99);
     Application.HintPause:=ayarini.readInteger('Form_3','Ipucu_cikma_suresi',-99);
     Application.HintColor:=colortorgb( ayarini.readinteger('Form_3','Ipucu_rengi',-99));
     screen.HintFont.Name:=ayarini.ReadString('Form_3','Yazitipi','');
     screen.HintFont.Size:=ayarini.Readinteger('Form_3','Yazitipi_Size',-99);
     screen.HintFont.Style   := TFontStyles(Byte(ayarini.ReadInteger('Form_3', 'Stil', Byte(screen.HintFont.Style))));
     screen.HintFont.CharSet := TFontCharSet(ayarini.ReadInteger('Form_3', 'CharSet', screen.HintFont.CharSet));
     screen.HintFont.Color:=ayarini.readinteger('Form_3','IpucuYaziRengi',colortorgb(screen.HintFont.Color));

     form1.Caption:=formc;
     ListView1.Items.Clear;
     ListView2.Items.Clear;
     form2.ListBox1.Items.Clear;
     if (forml<>-99)and(formt<>99) then form1.setbounds(forml,formt,formw,formh);
     case formstate of
     0:windowstate:=wsNormal;
     1:windowstate:=wsmaximized;
     2:windowstate:=wsminimized;
     end;
     formstate:=ayarini.ReadInteger('Form_5','Durum',-99);
     case formstate of
     0:form5.windowstate:=wsNormal;
     1:form5.windowstate:=wsmaximized;
     2:form5.windowstate:=wsminimized;
     end;

if  ayarini.readInteger('Form_2','Varsayilan_Dil',1) = 0 then begin
form2.rke1.Checked:=true;
Turkcele(True);
end
else begin
form2.ngilizce1.Checked:=true;
Turkcele(False);
end;
     ToolBar2.Visible:=ayarini.ReadBool('Form_2','Standart',false);
     ToolBar1.Visible:=ayarini.ReadBool('Form_2','Nesneler',false);
     Araubuu1.Checked:=ToolBar2.Visible;
     Nesneler2.Checked:=ToolBar1.Visible;

ayarini.Free;

form3.Close;
if form1.ComponentCount>0 then
 begin
 nesnesayisi:=form1.ComponentCount;
 for i:=nesnesayisi-1 downto 0 do  //ters yön olmazsa silinemez!...
  form1.Components[i].Free;
 end;
form1.nesne_sayisi;

form5.RichEdit1.lines.Clear;
form5.RichEdit1.Modified:=false;

ListView1.Items.Clear;
form2.ListBox1.Items.Clear;

proje:='yeni';
klasorproje:='';
if form2.rke1.Checked then begin
form2.caption:='Yunus - <'+proje+'> ['+loadstr(92)+']';
form5.Caption:=loadstr(82);
end
else
begin
form2.caption:='Yunus - <'+proje+'> ['+loadstr(1092)+']';
form5.Caption:=loadstr(1082);
end;

if rke1.Checked then ararakam:=0 else ararakam:=1000;
ToolButton1.down:=true;
ToolButton7Click(self);
ComboBox1.Text:=komutlistesi('Form');
end
else
   begin
   //varsayýlan ayarlar tekrar oluþturulsun
   form6.Memo1.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+'\varsayilan.ayar');
   yeni2.Click;
   end;
   form5.RichEdit1.CaretX:=0;
   form5.RichEdit1.CaretY:=0;
form5.RichEdit1.UndoList.Clear;
KalcDeikenler1.Checked:=false;
form1.Show;
aktifpencere:=true;
aktifPencereNo:=1;
form2.ToolButton5.ImageIndex:=5;
form2.PageControl1.ActivePageIndex:=0;
form5.PageControl1.ActivePageIndex:=0;
//form5.mnSil1Click(self);
end;

procedure TForm2.FindFile(StartDir, FileMask: string);
var
  SR: TSearchRec;
  DirList: TStringList;
  IsFound: Boolean;
  i: integer;
begin
  if StartDir[length(StartDir)] <> '\' then
    StartDir := StartDir + '\';
  IsFound :=FindFirst(StartDir+FileMask, faAnyFile-faDirectory, SR) = 0;
  while IsFound do begin
    application.processMessages;
    dcc32:=StartDir;
    IsFound := FindNext(SR) = 0;
  end;
  FindClose(SR);

  DirList := TStringList.Create;
  IsFound := FindFirst(StartDir+'*.*', faAnyFile, SR) = 0;
  while IsFound do begin
    if ((SR.Attr and faDirectory) <> 0) and
         (SR.Name[1] <> '.') then
      DirList.Add(StartDir + SR.Name);
    IsFound := FindNext(SR) = 0;
  end;
  FindClose(SR);

  for i := 0 to DirList.Count-1 do begin
    if dcc32<>'' then exit;
    FindFile(DirList[i], FileMask);
   end;
  DirList.Free;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
proje:='yeni';
klasorproje:='';
yon:=1;
yon2:=1;
randomize; //rasgele fonksiyonu için hazýrlýk
DragAcceptFiles( Handle, True );
formsayisi:=1;
  SendMessage(ListBox1.Handle,
              LB_SetHorizontalExtent,
              1000, // Kaydirma yapilcak uzunluk
              longint(0));
end;

procedure TForm2.Hepsini1Click(Sender: TObject);
begin
screen.Cursor:=crHourGlass;
if (form1.componentcount-1)>=0 then
   if form1.Components[form1.componentcount-1] is tshape then
      (form1.FindComponent('secim') as tshape).Free;
if proje<>'yeni' then
form1.hepsinikaydet(klasorproje)
else
Kaydet1Click(self);
if form3.CheckBox6.Checked then beep;
screen.Cursor:=crDefault;
end;

procedure TForm2.Form_1Click(Sender: TObject);
var  sil:TPopupMenu;
begin
if (form1.componentcount-1)>=0 then
   if form1.Components[form1.componentcount-1] is tshape then
      (form1.FindComponent('secim') as tshape).Free;
if proje<>'yeni' then begin
        try
        sil:=TPopupMenu.Create(form1);
        sil.Name:='pop';
        form1.PopupMenu:=sil;
        finally
        Tpopupmenu(form1.FindComponent('pop')).Free;
        Form1.Name:='Form1';
        WriteComponentResFile(klasorproje+'.dfm', form1);
        form1.PopupMenu:=Form2.PopupMenu1;
        end;
end
else Kaydet1Click(self);
if form3.CheckBox6.Checked then beep;
end;

procedure TForm2.Kod1Click(Sender: TObject);
begin
if proje<>'yeni' then begin
form5.RichEdit1.Lines.SaveToFile(klasorproje+'.proje');             //kodlar
form5.RichEdit1.Modified:=false;
end
else Kaydet1Click(self);
if form3.CheckBox6.Checked then beep;
end;

procedure TForm2.Ayar1Click(Sender: TObject);
begin
if proje <> 'yeni' then begin
 //form ayar bilgileri
form1.ayaryaz(klasorproje+'.ayar');
end
else Kaydet1Click(self);
if form3.CheckBox6.Checked then beep;
end;

procedure TForm2.Yazdr1Click(Sender: TObject);
var
    Device, Driver, Port   : array [0..255] of Char;
    Mode                   : Thandle;
begin
device:='';
try
 Printer.GetPrinter(Device,Driver,Port,Mode);
except
 if rke1.Checked then
  Application.MessageBox(pchar('Yazýcýya ulaþýlamýyor'+#13
              +'(Lütfen, Windows Denetim Masasý''ndan bir yazýcý ekleyiniz)' ),'Yazdýr',MB_OK+MB_ICONERROR)
  else
  Application.MessageBox(pchar('Unable to reach printer'+#13
              +'(Please, add a printer from Windows Control Panel)' ),'Print',MB_OK+MB_ICONERROR) ;
end;

    if klasorproje<>'' then
    TestPrintPreviewDlg.Caption:='"'+klasorproje+'.proje"'
    else
    TestPrintPreviewDlg.Caption:='Print Preview';
TestPrintPreviewDlg.SynEditPrint.Lines:=form5.RichEdit1.Lines;
TestPrintPreviewDlg.show;
end;

procedure TForm2.N11Click(Sender: TObject);
var    ayarini:Tinifile;dizin,dsy:string;
begin
dizin:=extractfilepath(application.ExeName);
ayarini:=TIniFile.Create(dizin+'\varsayilan.ayar');    //form ayar bilgileri
dsy:=ayarini.readstring('DosyaListesi','1','');
ayarini.Free;
klasorproje:=form2.dosyaadi_ayikla(dsy);
proje:=form2.projeadi_ayikla(dsy);
Application.Title:=proje;

YeniYeni;
form1.hepsiniac(dsy);
if form3.CheckBox3.Checked=false then
  form2.ToolButton9Click(self);
form1.nesne_sayisi;
end;

procedure TForm2.N21Click(Sender: TObject);
var    ayarini:Tinifile;dizin,dsy:string;
begin
dizin:=extractfilepath(application.ExeName);
ayarini:=TIniFile.Create(dizin+'\varsayilan.ayar');    //form ayar bilgileri
dsy:=ayarini.readstring('DosyaListesi','2','');
ayarini.Free;
YeniYeni;
klasorproje:=form2.dosyaadi_ayikla(dsy);
proje:=form2.projeadi_ayikla(dsy);
Application.Title:=proje;

form1.hepsiniac(dsy);
if form3.CheckBox3.Checked=false then
  form2.ToolButton9Click(self);
form1.nesne_sayisi;
end;

procedure TForm2.N31Click(Sender: TObject);
var    ayarini:Tinifile;dizin,dsy:string;
begin
dizin:=extractfilepath(application.ExeName);
ayarini:=TIniFile.Create(dizin+'\varsayilan.ayar');    //form ayar bilgileri
dsy:=ayarini.readstring('DosyaListesi','3','');
ayarini.Free;
YeniYeni;
klasorproje:=form2.dosyaadi_ayikla(dsy);
proje:=form2.projeadi_ayikla(dsy);
Application.Title:=proje;

form1.hepsiniac(dsy);
if form3.CheckBox3.Checked=false then
  form2.ToolButton9Click(self);
form1.nesne_sayisi;
end;

procedure TForm2.N41Click(Sender: TObject);
var    ayarini:Tinifile;dizin,dsy:string;
begin
dizin:=extractfilepath(application.ExeName);
ayarini:=TIniFile.Create(dizin+'\varsayilan.ayar');    //form ayar bilgileri
dsy:=ayarini.readstring('DosyaListesi','4','');
ayarini.Free;
YeniYeni;
klasorproje:=form2.dosyaadi_ayikla(dsy);
proje:=form2.projeadi_ayikla(dsy);
Application.Title:=proje;

form1.hepsiniac(dsy);
if form3.CheckBox3.Checked=false then
  form2.ToolButton9Click(self);
form1.nesne_sayisi;
end;

procedure TForm2.FontDialog1Apply(Sender: TObject; Wnd: HWND);
var dugmemiz:TBitBtn;
    etiket:TStatictext;
    metin:TEdit;
    onay:TCheckBox; liste: TListBox; acilir: TCombobox ; yazi :TRichEdit;
begin
     if lowercase(ComboBox1.Text)=lowercase(komutlistesi('Form')) then
      begin
         form1.Font:=FontDialog1.Font;
         ValueListEditor1.Cells[1,8]:=FontDialog1.Font.Name;
      end else
     if form1.componentcount<>0 then begin
        if form1.Components[combobox1.ItemIndex] is TBitBtn then begin
         dugmemiz := form1.Components[combobox1.ItemIndex] as TBitBtn;
         dugmemiz.Font:=FontDialog1.Font;
         ValueListEditor1.Cells[1,7]:=inttostr(dugmemiz.Font.color);
         ValueListEditor1.Cells[1,8]:=FontDialog1.Font.Name;
        end;
       if form1.Components[combobox1.ItemIndex] is TStaticText then begin
         etiket := form1.Components[combobox1.ItemIndex] as TStaticText;
         etiket.Font:=FontDialog1.Font;
         ValueListEditor1.Cells[1,8]:=FontDialog1.Font.Name;
        end;
       if form1.Components[combobox1.ItemIndex] is TEdit then begin
         metin := form1.Components[combobox1.ItemIndex] as TEdit;
         metin.Font:=FontDialog1.Font;
         ValueListEditor1.Cells[1,8]:=FontDialog1.Font.Name;
        end;
       if form1.Components[combobox1.ItemIndex] is TCheckbox then begin
         onay := form1.Components[combobox1.ItemIndex] as TCheckbox;
         onay.Font:=FontDialog1.Font;
         ValueListEditor1.Cells[1,8]:=FontDialog1.Font.Name;
        end;
       if form1.Components[combobox1.ItemIndex] is Tlistbox then begin
         liste := form1.Components[combobox1.ItemIndex] as TListbox;
         liste.Font:=FontDialog1.Font;
         ValueListEditor1.Cells[1,8]:=FontDialog1.Font.Name;
        end;
       if form1.Components[combobox1.ItemIndex] is TCombobox then begin
         acilir := form1.Components[combobox1.ItemIndex] as TCombobox;
         acilir.Font:=FontDialog1.Font;
         ValueListEditor1.Cells[1,8]:=FontDialog1.Font.Name;
        end;
       if form1.Components[combobox1.ItemIndex] is TRichEdit then begin
         yazi := form1.Components[combobox1.ItemIndex] as TRichEdit;
         yazi.Font:=FontDialog1.Font;
         ValueListEditor1.Cells[1,8]:=FontDialog1.Font.Name;
        end;
     end;
end;

procedure TForm2.DelphiuyumluDFMKaydet1Click(Sender: TObject);
begin
form1.FareImleciNormallestir;  //grrr
form1.dfmkaydet;
end;

procedure TForm2.VisualBasicUyumluOlarakKaydet1Click(Sender: TObject);
begin
 Application.MessageBox('Under Construction','Unfinished',MB_OK+MB_ICONEXCLAMATION);
end;

procedure TForm2.Seiliblgeyeuygula1Click(Sender: TObject);
begin
form1.uygula(secili_satir);
end;


procedure TForm2.Bul1Click(Sender: TObject);
begin
  form5.Bul1Click(self);
end;

procedure TForm2.HataPenceresi1Click(Sender: TObject);
begin
 form5.HataPenceresi1.OnClick(Self);
end;

procedure TForm2.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
if (key<>#13)or(key<>#27) then key:=#0;
end;

procedure TForm2.Araubuu1Click(Sender: TObject);
var ayar:Tinifile;
begin
Araubuu1.Checked:=not(Araubuu1.Checked);
ToolBar2.Visible:=Araubuu1.Checked;
Araubuu2.Checked:=Araubuu1.Checked;
width:=width+1;
width:=width-1;
ayar:=tinifile.create(ExtractFilePath(Application.ExeName)+'\varsayilan.ayar');
ayar.WriteBool('Form_2','Standart',Araubuu1.Checked);
ayar.WriteString('Form_2','Standart_Dock',ToolBar2.parent.Name);
ayar.Free;

if (toolbar2.Visible)and(disarida_stan=true) then begin
 ToolBar2.ManualDock(CoolBar1);
 disarida_stan:=false;
 end;
end;

procedure TForm2.Nesneler2Click(Sender: TObject);
var ayar:Tinifile;
begin
Nesneler2.Checked:=not(Nesneler2.Checked);
ToolBar1.Visible:=Nesneler2.Checked;
Nesneler1.Checked:=Nesneler2.Checked;
width:=width+1;
width:=width-1;
ayar:=tinifile.create(ExtractFilePath(Application.ExeName)+'\varsayilan.ayar');
ayar.WriteBool('Form_2','Nesneler',Nesneler2.Checked);
ayar.WriteString('Form_2','Nesneler_Dock',ToolBar1.parent.Name);
ayar.Free;

if (toolbar1.Visible)and(disarida_nesn=true) then begin
 ToolBar1.ManualDock(CoolBar1);
 disarida_nesn:=false;
 end;
end;

procedure TForm2.zelletir1Click(Sender: TObject);
begin
form9.showmodal;
end;

procedure TForm2.rke1Click(Sender: TObject);
begin
if rke1.Checked then exit;
rke1.Checked:=true;
Turkcele(True);
end;

procedure TForm2.ngilizce1Click(Sender: TObject);
begin
if ngilizce1.Checked then exit;
ngilizce1.Checked:=true;
Turkcele(False);
end;

procedure TForm2.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var a:integer;
begin
if kapatlen<>true then begin
a:=strtoint(item.SubItems[1]);
form5.RichEdit1.CaretX:= 0;
form5.RichEdit1.CaretY:= a+1;
end;
end;

procedure TForm2.ToolBar1StartDock(Sender: TObject;
  var DragObject: TDragDockObject);
begin
disarida_nesn:=true;
end;

procedure TForm2.ToolBar2StartDock(Sender: TObject;
  var DragObject: TDragDockObject);
begin
disarida_stan:=true;
end;


procedure TForm2.Dzen1Click(Sender: TObject);
var temp:TComponent;
begin
if rke1.Checked then ararakam:=0 else ararakam:=1000;
if aktifpencere then begin
 Sonnesneyisil1.Caption:=LoadStr(ararakam+18);
 form2.Sonnesneyisil2.Caption := LoadStr(ararakam+18);
 ToolButton5.Hint:=loadstr(ararakam+18);
if not(FileExists(ExtractFilePath(Application.ExeName)+'~kopya.txt')) then
 begin
  Yaptr1.Enabled:=false;
  Yaptr2.Enabled:=false;
 end
 else
 begin
  Yaptr1.Enabled:=true;
  Yaptr2.Enabled:=true;
 end;

if ToolButton1.Down then
  TmnSe1.Enabled:=true
else
  TmnSe1.Enabled:=false;
if ToolButton1.Down then
  TmnSe2.Enabled:=true
else
  TmnSe2.Enabled:=false;

if lowercase(ComboBox1.Text)=lowercase(komutlistesi('Form')) then begin
GeriyeYolla1.Enabled:=false;
neGetir1.Enabled:=false;
GeriyeYolla2.Enabled:=false;
neGetir2.Enabled:=false;
end
else
begin
GeriyeYolla1.Enabled:=true;
neGetir1.Enabled:=true;
GeriyeYolla2.Enabled:=true;
neGetir2.Enabled:=true;
end;

 if form1.componentcount<>0 then begin
 Sonnesneyisil1.Enabled:=true;
 Sonnesneyisil2.Enabled:=true;
 Sonnesneyisil1.Caption:=LoadStr(ararakam+17)+' <'+form1.Components[form1.Componentcount-1].Name+'>';
 form2.Sonnesneyisil2.Caption := LoadStr(ararakam+17)+' <'+form1.Components[form1.Componentcount-1].Name+'>';
 ToolButton5.Hint:=loadstr(ararakam+17)+' <'+form1.Components[form1.Componentcount-1].Name+'>';
 temp:=form1.Components[form1.componentcount-1];
 if temp is TShape then
 begin
  dayal1.Enabled:=true;
  dayal2.Enabled:=true;
 end
 else
 begin
  dayal1.Enabled:=false;
  Dayal2.Enabled:=false;
 end;
 if (temp is TShape)or(lowercase(ComboBox1.Text)<>lowercase(komutlistesi('Form'))) then
 begin
  Kopyala1.Enabled:=true;
  Kes1.Enabled:=true;
  Kopyala2.Enabled:=true;
  Kes2.Enabled:=true;
  Sil1.Enabled:=true;
  Sil2.Enabled:=true;
  Deitir2.Enabled:=true;
 end
 else
 begin
  Kopyala1.Enabled:=false;
  Kes1.Enabled:=false;
  Kopyala2.Enabled:=false;
  Kes2.Enabled:=false;
  Sil1.Enabled:=false;
  Sil2.Enabled:=false;
  Deitir2.Enabled:=false;
 end;
 end
 else
 begin
  Sonnesneyisil1.Enabled:=false;
  Sonnesneyisil2.Enabled:=false;
  Kopyala1.Enabled:=false;
  Kes1.Enabled:=false;
  Sil1.Enabled:=false;
  dayal1.Enabled:=false;
  Kopyala2.Enabled:=false;
  Kes2.Enabled:=false;
  Sil2.Enabled:=false;
  Deitir2.Enabled:=false;
  Dayal2.Enabled:=false;
 end;
end
else //Düzen menüsü aktif pencere ne ise o þekilde çalýþmalýdýr...
begin
Sonnesneyisil1.Caption:=LoadStr(ararakam+50);
ToolButton5.Hint:=loadstr(ararakam+50);
Sonnesneyisil1.Enabled:=form5.richedit1.CanUndo;
dayal1.Enabled:=false;
GeriyeYolla2.Enabled:=false;
neGetir2.Enabled:=false;
TmnSe1.Enabled:=true;
Yaptr1.Enabled:=form5.Yaptr2.Enabled;
if form5.richedit1.SelLength>0 then begin
  Kopyala1.Enabled:=true;
  Kes1.Enabled:=true;
  Sil1.Enabled:=true;
end
else
begin
  Kopyala1.Enabled:=false;
  Kes1.Enabled:=false;
  Sil1.Enabled:=false;
end;
end;
end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
Dzen1Click(Self);
aktifpencere:=true;
form2.ToolButton5.ImageIndex:=5;
end;

procedure TForm2.AcceptFiles( var msg : TMessage );
const
  cnMaxFileNameLen = 255;
var
  acFileName : array [0..cnMaxFileNameLen] of char;
  dsy:string;
begin
DragQueryFile( msg.WParam, 0 , acFileName, cnMaxFileNameLen );
dsy:=acFileName;
if lowercase(mid(dsy,length(dsy)-5,6))='.proje' then
begin
delete(dsy,length(dsy)-5,6);
klasorproje:=form2.dosyaadi_ayikla(dsy);
proje:=form2.projeadi_ayikla(dsy);
Application.Title:=proje;

YeniYeni;
form1.hepsiniac(dsy);
  ToolButton9.Enabled:=false;
  ToolButton7.Enabled:=true;
if form3.CheckBox3.Checked=false then
  form2.ToolButton9Click(self);
if rke1.Checked then ararakam:=0 else ararakam:=1000;
ToolButton1.down:=true;
form1.nesne_sayisi;
end;
  DragFinish( msg.WParam );
end;

procedure TForm2.PopupMenu2Popup(Sender: TObject);
begin
if lowercase(ComboBox1.Text)=lowercase(komutlistesi('Form')) then Seiliblgeyeuygula1.Enabled:=false else Seiliblgeyeuygula1.Enabled:=true;
Herzamanstte1.Checked:=form3.CheckBox1.Checked;
end;

procedure TForm2.ValueListEditor1EditButtonClick(Sender: TObject);
var etiket:TStaticText;dugmemiz:TBitbtn;metin:TEdit;
    onay:TCheckBox; liste: TListBox; acilir: TCombobox ; yazi :TRichEdit;
    strgec:integer;
begin
if ValueListEditor1.Row=7 then    //RENK
begin
     if lowercase(ComboBox1.Text)=lowercase(komutlistesi('Form')) then
      begin
         colordialog1.color:=form1.color;
         colordialog1.Execute;
         form1.color:=colordialog1.color;
         ValueListEditor1.Cells[1,7]:=inttostr(colorDialog1.color);
      end else
     if form1.componentcount<>0 then begin
       if form1.Components[combobox1.ItemIndex] is TStaticText then begin
         etiket := form1.Components[combobox1.ItemIndex] as TStaticText;
         colordialog1.color:=etiket.color;
         colordialog1.Execute;
         etiket.color:=colordialog1.color;
         ValueListEditor1.Cells[1,7]:=inttostr(colorDialog1.color);
        end;
       if form1.Components[combobox1.ItemIndex] is TBitbtn then begin
         dugmemiz := form1.Components[combobox1.ItemIndex] as TBitBtn;
         colordialog1.color:=dugmemiz.font.color;
         colordialog1.Execute;
         dugmemiz.Font.color:=colordialog1.color;
         ValueListEditor1.Cells[1,7]:=inttostr(colorDialog1.color);
        end;
       if form1.Components[combobox1.ItemIndex] is TEdit then begin
         metin := form1.Components[combobox1.ItemIndex] as TEdit;
         colordialog1.color:=metin.color;
         colordialog1.Execute;
         metin.color:=colordialog1.color;
         ValueListEditor1.Cells[1,7]:=inttostr(colorDialog1.color);
         end;
       if form1.Components[combobox1.ItemIndex] is TCheckbox then begin
         onay := form1.Components[combobox1.ItemIndex] as TCheckbox;
         colordialog1.color:=onay.color;
         colordialog1.Execute;
         onay.color:=colordialog1.color;
         ValueListEditor1.Cells[1,7]:=inttostr(colorDialog1.color);
        end;
       if form1.Components[combobox1.ItemIndex] is Tlistbox then begin
         liste := form1.Components[combobox1.ItemIndex] as TListbox;
         colordialog1.color:=liste.color;
         colordialog1.Execute;
         liste.color:=colordialog1.color;
         ValueListEditor1.Cells[1,7]:=inttostr(colorDialog1.color);
        end;
       if form1.Components[combobox1.ItemIndex] is TCombobox then begin
         acilir := form1.Components[combobox1.ItemIndex] as TCombobox;
         colordialog1.color:=acilir.color;
         colordialog1.Execute;
         acilir.color:=colordialog1.color;
         ValueListEditor1.Cells[1,7]:=inttostr(colorDialog1.color);
        end;
       if form1.Components[combobox1.ItemIndex] is TRichEdit then begin
         yazi := form1.Components[combobox1.ItemIndex] as TRichEdit;
         colordialog1.color:=yazi.color;
         colordialog1.Execute;
         yazi.color:=colordialog1.color;
         ValueListEditor1.Cells[1,7]:=inttostr(colorDialog1.color);
        end;
     end;
end else
if ValueListEditor1.Row=8 then  //YAZITÝPÝ
begin
     if lowercase(ComboBox1.Text)=lowercase(komutlistesi('Form')) then
      begin
         FontDialog1.Font:=Form1.Font;
         FontDialog1.Execute;
         Form1.Font:=FontDialog1.Font;
         ValueListEditor1.Cells[1,8]:=FontDialog1.Font.Name;
      end else
     if form1.componentcount<>0 then begin
        if form1.Components[combobox1.ItemIndex] is TBitBtn then begin
         dugmemiz := form1.Components[combobox1.ItemIndex] as TBitBtn;
         FontDialog1.Font:=dugmemiz.Font;
         FontDialog1.Execute;
         dugmemiz.Font:=FontDialog1.Font;
         ValueListEditor1.Cells[1,7]:=inttostr(dugmemiz.Font.color);
         ValueListEditor1.Cells[1,8]:=FontDialog1.Font.Name;
        end;
       if form1.Components[combobox1.ItemIndex] is TStaticText then begin
         etiket := form1.Components[combobox1.ItemIndex] as TStaticText;
         FontDialog1.Font:=etiket.Font;
         FontDialog1.Execute;
         etiket.Font:=FontDialog1.Font;
         ValueListEditor1.Cells[1,8]:=FontDialog1.Font.Name;
        end;
       if form1.Components[combobox1.ItemIndex] is TEdit then begin
         metin := form1.Components[combobox1.ItemIndex] as TEdit;
         FontDialog1.Font:=metin.Font;
         FontDialog1.Execute;
         metin.Font:=FontDialog1.Font;
         ValueListEditor1.Cells[1,8]:=FontDialog1.Font.Name;
        end;
       if form1.Components[combobox1.ItemIndex] is TCheckbox then begin
         onay := form1.Components[combobox1.ItemIndex] as TCheckbox;
         FontDialog1.Font:=onay.Font;
         FontDialog1.Execute;
         onay.Font:=FontDialog1.Font;
         ValueListEditor1.Cells[1,8]:=FontDialog1.Font.Name;
        end;
       if form1.Components[combobox1.ItemIndex] is Tlistbox then begin
         liste := form1.Components[combobox1.ItemIndex] as TListbox;
         FontDialog1.Font:=liste.Font;
         FontDialog1.Execute;
         liste.Font:=FontDialog1.Font;
         ValueListEditor1.Cells[1,8]:=FontDialog1.Font.Name;
        end;
       if form1.Components[combobox1.ItemIndex] is TCombobox then begin
         acilir := form1.Components[combobox1.ItemIndex] as TCombobox;
         FontDialog1.Font:=acilir.Font;
         FontDialog1.Execute;
         acilir.Font:=FontDialog1.Font;
         ValueListEditor1.Cells[1,8]:=FontDialog1.Font.Name;
        end;
       if form1.Components[combobox1.ItemIndex] is TRichEdit then begin
         yazi := form1.Components[combobox1.ItemIndex] as TRichEdit;
         FontDialog1.Font:=yazi.Font;
         FontDialog1.Execute;
         yazi.Font:=FontDialog1.Font;
         ValueListEditor1.Cells[1,8]:=FontDialog1.Font.Name;
        end;
     end;
end else
if ValueListEditor1.Row=9 then  //Metin Listesi gibi, Resim seç veya Dosya Seç
begin
     if (form1.componentcount<>0)  then
     if (form1.Components[combobox1.ItemIndex] is Tlistbox)
      or(form1.Components[combobox1.ItemIndex] is TRichEdit)
      or(form1.Components[combobox1.ItemIndex] is TCombobox) then
       begin
     if (form1.Components[combobox1.ItemIndex] is Tlistbox) then begin
//        (form1.Components[combobox1.ItemIndex] as Tlistbox).ItemIndex:=1;

         form11.RichEdit1.Lines.Clear;
         for strgec:=0 to (form1.Components[form2.combobox1.ItemIndex] as Tlistbox).Items.count-1 do
         form11.RichEdit1.Lines.Add((form1.Components[form2.combobox1.ItemIndex] as Tlistbox).Items[strgec]);

        end else
     if (form1.Components[combobox1.ItemIndex] is TRichEdit) then
        form11.RichEdit1.Lines:=(form1.Components[form2.combobox1.ItemIndex] as TRichEdit).Lines
        else
     if (form1.Components[form2.combobox1.ItemIndex] is TComboBox) then
        form11.RichEdit1.Lines:=(form1.Components[form2.combobox1.ItemIndex] as TComboBox).Items;
        form11.showmodal;
       end else
   if (Form1.ada_ayikla((form1.Components[combobox1.ItemIndex] as TBitbtn).name)=komutlistesi('Dugme')) then
    begin
    if fileexists(ValueListEditor1.Cells[1,9]) then
      OpenPictureDialog1.FileName:=ValueListEditor1.Cells[1,9];

    OpenPictureDialog1.Execute;
    if OpenPictureDialog1.FileName<>'' then begin
      (form1.Components[combobox1.ItemIndex] as Tbitbtn).Glyph.LoadFromFile(OpenPictureDialog1.FileName);
      (form1.Components[combobox1.ItemIndex] as Tbitbtn).HelpKeyword:=OpenPictureDialog1.FileName;
      (form1.Components[combobox1.ItemIndex] as Tbitbtn).HelpType:=htContext;
      ValueListEditor1.Cells[1,9]:=OpenPictureDialog1.FileName;
      end;
    end else
   if (Form1.ada_ayikla((form1.Components[combobox1.ItemIndex] as TBitbtn).name)=komutlistesi('Tablo')) then
    begin
    if fileexists(ValueListEditor1.Cells[1,9]) then
      OpenDialog2.FileName:=ValueListEditor1.Cells[1,9]
      else
      OpenDialog2.FileName:='';

    if rke1.Checked then ararakam:=0 else ararakam:=1000;  
    form2.OpenDialog2.Filter:=loadstr(ararakam+184)+'|*.xml;*.cds|'+loadstr(ararakam+154)+'|*.*';
    form14.FilterComboBox1.Filter:=form2.OpenDialog2.Filter;
    OpenDialog2.Execute;
    if OpenDialog2.FileName<>'' then begin
      (form1.Components[combobox1.ItemIndex] as Tbitbtn).HelpKeyword:=OpenDialog2.FileName;
      (form1.Components[combobox1.ItemIndex] as Tbitbtn).HelpType:=htContext;
       ValueListEditor1.Cells[1,9]:=OpenDialog2.FileName;
      end;
    end else
   if (Form1.ada_ayikla((form1.Components[combobox1.ItemIndex] as TBitbtn).name)=komutlistesi('ExcelTablosu')) then
    begin
    if fileexists(ValueListEditor1.Cells[1,9]) then
      OpenDialog2.FileName:=ValueListEditor1.Cells[1,9]
      else
      OpenDialog2.FileName:='';

    if rke1.Checked then ararakam:=0 else ararakam:=1000;
    form2.OpenDialog2.Filter:=loadstr(ararakam+189)+'|*.xls;*.csv|'+loadstr(ararakam+154)+'|*.*';
    OpenDialog2.Execute;
      if OpenDialog2.FileName<>'' then begin
       (form1.Components[combobox1.ItemIndex] as Tbitbtn).Hint:=OpenDialog2.FileName;
        ValueListEditor1.Cells[1,9]:=OpenDialog2.FileName;
       end;
    form2.OpenDialog2.Filter:=loadstr(ararakam+184)+'|*.xml;*.cds|'+loadstr(ararakam+154)+'|*.*';
    form14.FilterComboBox1.Filter:=form2.OpenDialog2.Filter;
    end;
end;
end;

procedure TForm2.ValueListEditor1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=VK_RETURN)or(key=VK_UP)or(key=VK_DOWN) then gridden_oku;
end;

procedure TForm2.ValueListEditor1Click(Sender: TObject);
begin
 gridden_oku;
end;

procedure TForm2.ValueListEditor1Exit(Sender: TObject);
begin
gridden_oku;
end;

procedure TForm2.ValueListEditor1Validate(Sender: TObject; ACol,
  ARow: Integer; const KeyName, KeyValue: String);
begin
 gridden_oku;
end;

procedure TForm2.ValueListEditor1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
  var col,row:integer;
      pt:TPoint;
begin
ValueListEditor1.MouseToCell(mousepos.x,mousepos.y,col,row);
GetCursorPos(pt);
secili_satir:=row;
if col<>1 then //yazýlarýn pop menüsü farklý olmalý, onlarý ayýrýyoruz
 PopupMenu2.Popup(pt.X,pt.y);
end;

procedure TForm2.GeriyeYolla1Click(Sender: TObject);
begin
  form1.geriyeYolla;
end;

procedure TForm2.neGetir1Click(Sender: TObject);
begin
  form1.oneGetir;
end;

procedure TForm2.project1exe1Click(Sender: TObject);
begin
   SetCurrentDirectory(pchar(klasorproje));
   ShellExecute(0,nil,'project1.exe',nil, nil, SW_SHOWDEFAULT);
end;

procedure TForm2.project1html1Click(Sender: TObject);
begin
   SetCurrentDirectory(pchar(klasorproje));
   ShellExecute(0,nil,'project1JS.html',nil, nil, SW_SHOWDEFAULT);
end;

procedure TForm2.project1VBhtml1Click(Sender: TObject);
begin
   SetCurrentDirectory(pchar(klasorproje));
   ShellExecute(0,nil,'project1VB.html',nil, nil, SW_SHOWDEFAULT);
end;

procedure TForm2.Export1Click(Sender: TObject);
var dizin:string;
begin
    if (fileexists(Form3.Edit1.Text))and(klasorproje<>'') then
        DelphiuyumluDFMKaydet1.Enabled:=true
        else
        DelphiuyumluDFMKaydet1.Enabled:=false;
    if (fileexists(Form3.Edit2.Text))and(klasorproje<>'') then
        VisualBasicUyumluOlarakKaydet1.Enabled:=true
        else
        VisualBasicUyumluOlarakKaydet1.Enabled:=false;

     JScript1.Enabled:=(klasorproje<>'');
     VBScript1.Enabled:=(klasorproje<>'');

   dizin:=klasorproje;
   delete(dizin,length(dizin)-length(proje)+1,length(proje));
   SetCurrentDirectory(pchar(dizin));
   project1exe1.Visible:=(FileExists('project1.exe'))and(klasorproje<>'');
   project1html1.Visible:=(FileExists('project1JS.html'))and(klasorproje<>'');
   project1VBhtml1.Visible:=(FileExists('project1VB.html'))and(klasorproje<>'');
end;

procedure TForm2.Dzenle1Click(Sender: TObject);
begin
form12.showmodal;
end;

procedure TForm2.devam1Click(Sender: TObject);
begin
form5.leriBul1Click(self);
end;

procedure TForm2.Deitir1Click(Sender: TObject);
begin
form5.Deitir1Click(self);
end;

procedure TForm2.Etiket1Click(Sender: TObject);
begin
form1.cevir(0);
end;

procedure TForm2.Metin1Click(Sender: TObject);
begin
form1.cevir(1);
end;

procedure TForm2.Dugme1Click(Sender: TObject);
begin
form1.cevir(2);
end;

procedure TForm2.Onay1Click(Sender: TObject);
begin
form1.cevir(3);
end;

procedure TForm2.Liste1Click(Sender: TObject);
begin
form1.cevir(4);
end;

procedure TForm2.Acilir1Click(Sender: TObject);
begin
form1.cevir(5);
end;

procedure TForm2.M1Click(Sender: TObject);
begin
form1.cevir(6);
end;

procedure TForm2.Ekle1Click(Sender: TObject);
var ad,degeri:string;
begin
    form13.LabeledEdit1.Text:='';
    form13.LabeledEdit2.Text:='';
    form13.ShowModal;
    if (tamamTusu) then begin
    if (form13.LabeledEdit1.Text='') then exit;
        listitem:=form2.ListView2.items.add;
        ad:=form13.LabeledEdit1.Text;
        degeri:=form13.LabeledEdit2.Text;
        ListItem.Caption:=ad;
        listitem.SubItems.Add(degeri);
    end;
end;

procedure TForm2.edit1Click(Sender: TObject);
var ad,degeri:string;
    listitem:TListitem;
begin
if form2.ListView2.SelCount=0 then exit; 
ad:= form2.ListView2.Selected.Caption;
 if form2.ListView2.FindCaption(-1,lowercase(ad),false,false,false)<>NIL then begin
   ListItem:= form2.ListView2.FindCaption(-1,lowercase(ad),false,false,false);
   if lowercase(listitem.caption)=lowercase(ad) then degeri:=listitem.SubItems[0];
 end;

 form13.LabeledEdit1.Text:=ad;
 form13.LabeledEdit2.Text:=degeri;
 form13.ShowModal;

if (tamamTusu)  and
   (form2.ListView2.FindCaption(-1,lowercase(ad),false,false,false)<>NIL) then begin
       ListItem:= form2.ListView2.FindCaption(-1,lowercase(ad),false,false,false);
       ad:=form13.LabeledEdit1.Text;
       degeri:=form13.LabeledEdit2.Text;
       ListItem.Caption:=ad;
       listitem.SubItems[0]:=degeri;
     end;
end;

procedure TForm2.hepsiniTemizle1Click(Sender: TObject);
begin
   ListView2.Clear;
end;

procedure TForm2.sil3Click(Sender: TObject);
var ad:string;
begin
if form2.ListView2.SelCount=0 then exit; 
ad:= form2.ListView2.Selected.Caption;
 if form2.ListView2.FindCaption(-1,lowercase(ad),false,false,false)<>NIL then begin
   ListItem:= form2.ListView2.FindCaption(-1,lowercase(ad),false,false,false);
   if lowercase(listitem.caption)=lowercase(ad) then listitem.Delete;
 end;
end;

procedure TForm2.PopupMenu5Popup(Sender: TObject);
begin
 Ekle1.Enabled:=true;
 sil3.Enabled:=false;
 edit1.Enabled:=false;
 hepsiniTemizle1.Enabled:=true;
 if ListView2.Items.Count=0 then  hepsiniTemizle1.Enabled:=false;
 if ListView2.SelCount<>0 then sil3.Enabled:=true;
 if ListView2.SelCount<>0 then edit1.Enabled:=true;
end;

procedure TForm2.ListView2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_RETURN then edit1Click(self);
if key=VK_DELETE then sil3Click(self);
if key=VK_INSERT then Ekle1Click(self);
end;

procedure TForm2.Veritaban1Click(Sender: TObject);
begin
form14.showmodal;
end;

procedure TForm2.FormDeactivate(Sender: TObject);
begin
form2.gridden_oku; //form garip bir þekilde zýplayabiliyor
end;

procedure TForm2.Windows1Click(Sender: TObject);
begin
WinExec(pchar('HH.EXE '+ExtractFilePath(Application.ExeName)+'yunus.chm::/windows.html'), SW_SHOWNORMAL)
end;

procedure TForm2.Game1Click(Sender: TObject);
begin
form15.ShowModal;
end;

procedure TForm2.OlayOlutur1Click(Sender: TObject);
var buldum:boolean;i:integer;
    satir:string;
begin
if lowercase(ComboBox1.Text)=lowercase(komutlistesi('Form')) then form1.FormDblClick(self)
 else begin
 buldum:=false;
 if form5.RichEdit1.Lines.Count<>0 then
  for i:=0 to form5.RichEdit1.Lines.Count-1 do begin
  satir:=trim(form5.RichEdit1.Lines[i]);
  if (lowercase(form2.mid(satir,1,length(combobox1.Text+' '+form2.komutlistesi('tiklaninca'))))
     =lowercase(combobox1.Text+' '+form2.komutlistesi('tiklaninca'))) then
   begin
    buldum:=true;
    break;
    end;
  end;

  if buldum then begin
  form5.RichEdit1.CaretX:= 0;
  form5.RichEdit1.CaretY:= i+2;
  end
  else begin
  form5.RichEdit1.CaretX:= 0;
  form5.richedit1.Lines.insert(form5.RichEdit1.Lines.Count,'');
  form5.richedit1.Lines.insert(form5.RichEdit1.Lines.Count,combobox1.Text+' '+form2.komutlistesi('Tiklaninca'));
  form5.richedit1.Lines.insert(form5.RichEdit1.Lines.Count,'');
  form5.richedit1.Lines.insert(form5.RichEdit1.Lines.Count,form2.komutlistesi('bitti'));
  form5.RichEdit1.Carety:=form5.RichEdit1.Lines.Count-1;
  end;
 form5.Show;
 form5.PageControl1.ActivePageIndex:=0;
 if  form5.RichEdit1.enabled then form5.RichEdit1.SetFocus;
 end;
end;

procedure TForm2.EXEResource1Click(Sender: TObject);
begin
//////////////////////////////////////////////////////////////
 Application.MessageBox('Under Construction','Unfinished',MB_OK+MB_ICONEXCLAMATION);
//////////////////////////////////////////////////////////////
end;

procedure TForm2.HTMLFile1Click(Sender: TObject);
begin
//////////////////////////////////////////////////////////////
 Application.MessageBox('Under Construction','Unfinished',MB_OK+MB_ICONEXCLAMATION);
//////////////////////////////////////////////////////////////
end;

function fontboyu(ne:integer):string;
begin
 case ne of
 9..10  : fontboyu:='2';
 11..13 : fontboyu:='3';
 14..17 : fontboyu:='4';
 18..23 : fontboyu:='5';
 24..35 : fontboyu:='6';
 36..90 : fontboyu:='7';
 else     fontboyu:='1';
 end;
end;

procedure HTMLYap;
var i,j:integer;
    eklenen,baslik,renk : string;
    gd:TBitBtn;gm:TEdit;ge:TStatictext;
    go:TCheckBox; gl: TListBox; gy :TRichEdit;
    ga:TComboBox;
    TheRgbValue : TColorRef;
    bolditalik:string;
    bolditalikSon:string;
    resim:string;imageNesnesi:TImage;
    checkli:string;secili:string;
begin
 for i:=0 to form1.ComponentCount-1 do
  begin
  eklenen:='';baslik:='';
   if form1.Components[i].Name<>'' then begin
     if form1.Components[i].ClassName='TEdit' then begin        //EDIT
     gm:=form1.Components[i] as TEdit;
     eklenen:='<div id="Layer'+inttostr(i)+'" style="Z-INDEX:'+inttostr(i)+'; LEFT:'+inttostr(gm.left)+'px; WIDTH:'+inttostr(gm.width)+'px; POSITION:absolute; TOP:'+inttostr(gm.top)+'px; HEIGHT:'+inttostr(gm.Height)
     +'px">  <input type="text" name="'+form1.Components[i].Name+'" size='+inttostr(gm.GetTextLen)+'  style="height: '+inttostr(gm.Height)+'; width: '+inttostr(gm.width)+'"  title="'+gm.hint+'" value="'+gm.Text+'"></div>';
     end else
     if form1.Components[i].ClassName='TBitBtn' then begin      //DÜÐME
     gd:=form1.Components[i] as TBitBtn;
     baslik:=gd.Caption;
     delete(baslik,Pos('&', baslik),1);

     bolditalik:=''; bolditalikSon:='';
     if fsbold in gd.Font.Style then bolditalik:=bolditalik+'<b>';
     if fsitalic in gd.Font.Style then bolditalik:=bolditalik+'<i>';
     if fsitalic in gd.Font.Style then bolditalikSon:=bolditalikSon+'</i>';
     if fsbold in gd.Font.Style then bolditalikSon:=bolditalikSon+'</b>';
     resim:='';
      if (gd.HelpKeyword<>'')and(fileexists(gd.HelpKeyword))and(lowercase(ExtractFileExt(gd.HelpKeyword))='.bmp') then
       begin
       imageNesnesi:=TImage.Create(nil);
       imageNesnesi.Name:='gecici';
       imageNesnesi.Visible:=false;
       imageNesnesi.Picture.LoadFromFile(gd.HelpKeyword);
       resim:='<img src="'+gd.HelpKeyword+'" width="'+inttostr(imageNesnesi.Picture.Bitmap.Width)+'" height="'+inttostr(imageNesnesi.Picture.Bitmap.Height)+'" align="absmiddle">';
       imageNesnesi.Free;
       end;

     TheRgbValue := ColorToRGB(gd.font.Color);
     renk:=Format('#%.2x%.2x%.2x', [GetRValue(TheRGBValue),  GetGValue(TheRGBValue), GetBValue(TheRGBValue)]);
     baslik:=bolditalik+'<font face="'+gd.Font.Name+'" color="'+renk+'" size="'+fontboyu(gd.Font.size)+'" >'+resim+baslik+'</font>'+bolditalikSon;

     eklenen:='<div id="Layer'+inttostr(i)+'" style="Z-INDEX:'+inttostr(i)+'; LEFT:'+inttostr(gd.left)+'px; WIDTH:'+inttostr(gd.width)+'px; POSITION:absolute; TOP:'+inttostr(gd.top)+'px; HEIGHT:'+inttostr(gd.height)
     +'px">  <button name="'+form1.Components[i].Name+'"  style="height: '+inttostr(gd.Height)+'; width: '+inttostr(gd.width)+'" title="'+gd.hint+'" >'+baslik+'</button></div>';
     end else
     if form1.Components[i].ClassName='TStaticText' then begin  //LABEL
     ge:=form1.Components[i] as TStaticText;
     bolditalik:=''; bolditalikSon:='';
     if fsbold in ge.Font.Style then bolditalik:=bolditalik+'<b>';
     if fsitalic in ge.Font.Style then bolditalik:=bolditalik+'<i>';
     if fsitalic in ge.Font.Style then bolditalikSon:=bolditalikSon+'</i>';
     if fsbold in ge.Font.Style then bolditalikSon:=bolditalikSon+'</b>';
     TheRgbValue := ColorToRGB(ge.font.Color);
     renk:=Format('#%.2x%.2x%.2x', [GetRValue(TheRGBValue),  GetGValue(TheRGBValue), GetBValue(TheRGBValue)]);
     baslik:=bolditalik+'<font face="'+ge.Font.Name+'" color="'+renk+'" size="'+fontboyu(ge.Font.size)+'" >'+ge.Caption+'</font>'+bolditalikSon;
     delete(baslik,Pos('&', baslik),1);
     TheRgbValue := ColorToRGB(ge.Color);
     renk:=Format('#%.2x%.2x%.2x', [GetRValue(TheRGBValue),  GetGValue(TheRGBValue), GetBValue(TheRGBValue)]);
     eklenen:='<div id="Layer'+inttostr(i)+'" style=" background-color='+renk+'; Z-INDEX:'+inttostr(i)+'; LEFT:'+inttostr(ge.left)+'px; WIDTH:'+inttostr(ge.width)+'px; POSITION:absolute; TOP:'+inttostr(ge.top)+'px; HEIGHT:'+inttostr(ge.Height)
     +'px">'+baslik+'</div>';
     end else
     if form1.Components[i].ClassName='TCheckBox' then begin    //ÇEK KUTUSU
     go:=form1.Components[i] as TCheckBox;
     bolditalik:=''; bolditalikSon:='';
     if fsbold in go.Font.Style then bolditalik:=bolditalik+'<b>';
     if fsitalic in go.Font.Style then bolditalik:=bolditalik+'<i>';
     if fsitalic in go.Font.Style then bolditalikSon:=bolditalikSon+'</i>';
     if fsbold in go.Font.Style then bolditalikSon:=bolditalikSon+'</b>';
     TheRgbValue := ColorToRGB(go.font.Color);
     renk:=Format('#%.2x%.2x%.2x', [GetRValue(TheRGBValue),  GetGValue(TheRGBValue), GetBValue(TheRGBValue)]);
     baslik:=bolditalik+'<font face="'+go.Font.Name+'" color="'+renk+'" size="'+fontboyu(go.Font.size)+'" >'+go.Caption+'</font>'+bolditalikSon;
     delete(baslik,Pos('&', baslik),1);
     TheRgbValue := ColorToRGB(go.Color);
     renk:=Format('#%.2x%.2x%.2x', [GetRValue(TheRGBValue),  GetGValue(TheRGBValue), GetBValue(TheRGBValue)]);
     if go.Checked then checkli:='checked' else checkli:='';
     eklenen:='<div id="Layer'+inttostr(i)+'" style=" background-color='+renk+'; Z-INDEX:'+inttostr(i)+'; LEFT:'+inttostr(go.left)+'px; WIDTH:'+inttostr(go.width)+'px; POSITION:absolute; TOP:'+inttostr(go.top)+'px; HEIGHT:'+inttostr(go.Height)
     +'px">  <input type="checkbox" name="'+form1.Components[i].Name+'" title="'+go.hint+'" size='+inttostr(10)+' value="" '+checkli+'>'+baslik+'</div>';
     end else
     if form1.Components[i].ClassName='TRichEdit' then begin    //MEMO
     gy:=form1.Components[i] as TRichEdit;
     baslik:=gy.Text;
     eklenen:='<div id="Layer'+inttostr(i)+'" style="Z-INDEX:'+inttostr(i)+'; LEFT:'+inttostr(gy.left)+'px; WIDTH:'+inttostr(gy.width)+'px; POSITION:absolute; TOP:'+inttostr(gy.top)+'px; HEIGHT:'+inttostr(gy.Height)
     +'px"> <textarea id='+form1.Components[i].Name+' style="height: '+inttostr(gy.Height)+'; width: '+inttostr(gy.width)+'"  title="'+gy.Hint+'" rows='+inttostr(gy.Lines.Count)+' cols=20 wrap="OFF">'+baslik+'</textarea></div>';
     end else
     if form1.Components[i].ClassName='TListBox' then begin     //LÝSTE KUTUSU
     gl:=form1.Components[i] as TListBox;
      for j:=0 to gl.Items.Count-1 do begin
       if gl.Selected[j] then secili:='selected' else secili:='';
       baslik:=baslik+'<option '+secili+'>'+gl.Items[j]+'</option>';
       end;
     delete(baslik,Pos('&', baslik),1);
     eklenen:='<div id="Layer'+inttostr(i)+'" style="Z-INDEX:'+inttostr(i)+'; LEFT:'+inttostr(gl.left)+'px; WIDTH:'+inttostr(gl.Width)+'px; POSITION:absolute; TOP:'+inttostr(gl.Top)+'px; HEIGHT:'+inttostr(gl.Height)
     +'px">  <select id='+form1.Components[i].Name+' style="height: '+inttostr(gl.Height)+'; width: '+inttostr(gl.width)+'"  size=8 name='+form1.Components[i].Name+'>'+baslik+'</select></div>';
     end else
     if form1.Components[i].ClassName='TComboBox' then begin    //AÇILIR KUTU
     ga:=form1.Components[i] as TComboBox;
//     baslik:=ga.Text;
      for j:=0 to ga.Items.Count-1 do begin
       if ga.ItemIndex=j then secili:='selected' else secili:='';
       baslik:=baslik+'<option '+secili+'>'+ga.Items[j]+'</option>';
       end;
     delete(baslik,Pos('&', baslik),1);
     eklenen:='<div id="Layer'+inttostr(i)+'" style="Z-INDEX:'+inttostr(i)+'; LEFT:'+inttostr(ga.left)+'px; WIDTH:'+inttostr(ga.Width)+'px; POSITION:absolute; TOP:'+inttostr(ga.Top)+'px; HEIGHT:'+inttostr(ga.Height)
     +'px">  <select id='+form1.Components[i].Name+' style="height: '+inttostr(ga.Height)+'; width: '+inttostr(ga.width)+'"  size=1 name='+form1.Components[i].Name+'>' +baslik+'</select></div>';
     end;

     form6.RichEdit3.Lines.Insert(form6.RichEdit3.Lines.count-2,eklenen);
   end; //if compo..
  end;
end;

procedure TForm2.JScript1Click(Sender: TObject);
var
    adsiz,baslik,renk: string;
    TheRgbValue : TColorRef;
begin

if klasorproje<>'' then
 begin
 screen.Cursor:=crhourglass;

 adsiz:=extractfilepath(klasorproje);
 SetCurrentDirectory(pchar(adsiz));

 form6.RichEdit3.Lines:=form6.memo2.Lines;  //varolan nesneler unit'e eklenir...
 baslik:='<script language="javascript">'+#13#10+
         'function mesaj()'+#13#10+
         '{'+#13#10+
         'alert ("Under Construction\nVisit www.yunus.projesi.com");'+#13#10+
         '}'+#13#10+
         '</script>';
 form6.RichEdit3.Lines.Insert(form6.RichEdit3.Lines.count-2,baslik);
 TheRgbValue := ColorToRGB(form1.Color);
 renk:=Format('#%.2x%.2x%.2x', [GetRValue(TheRGBValue),  GetGValue(TheRGBValue), GetBValue(TheRGBValue)]);
 baslik:='<title>'+form1.Caption+'</title><body Bgcolor="'+renk+'" onload=mesaj() title="'+form1.hint+'">';
 form6.RichEdit3.Lines.Insert(form6.RichEdit3.Lines.count-2,baslik);

 HtmlYap;

 form6.RichEdit3.Lines.SaveToFile(adsiz+'project1JS.html');
 screen.Cursor:=crDefault;

 ShellExecute(0,nil,'project1JS.html',nil, nil, SW_SHOWDEFAULT);
end;
end;

procedure TForm2.VBScript1Click(Sender: TObject);
var 
    adsiz,baslik,renk: string;
    TheRgbValue : TColorRef;
begin

if klasorproje<>'' then
 begin
 screen.Cursor:=crhourglass;

 adsiz:=ExtractFilePath(klasorproje);
 SetCurrentDirectory(pchar(adsiz));

 form6.RichEdit3.Lines:=form6.memo2.Lines;  //varolan nesneler unit'e eklenir...
 baslik:='<script language="vbscript">'+#13#10+
         'function mesaj()'+#13#10+
         'alert ("Under Construction"+chr(13)+"Visit www.yunus.projesi.com")'+#13#10+
         'end function'+#13#10+
         '</script>';
 form6.RichEdit3.Lines.Insert(form6.RichEdit3.Lines.count-2,baslik);
 TheRgbValue := ColorToRGB(form1.Color);
 renk:=Format('#%.2x%.2x%.2x', [GetRValue(TheRGBValue),  GetGValue(TheRGBValue), GetBValue(TheRGBValue)]);
 baslik:='<title>'+form1.Caption+'</title><body Bgcolor="'+renk+'" onload=mesaj() title="'+form1.hint+'">';
 form6.RichEdit3.Lines.Insert(form6.RichEdit3.Lines.count-2,baslik);

 HtmlYap;

 form6.RichEdit3.Lines.SaveToFile(adsiz+'project1VB.html');
 screen.Cursor:=crDefault;
 ShellExecute(0,nil,'project1VB.html',nil, nil, SW_SHOWDEFAULT);
end;
end;


procedure TForm2.SatrnumarasnaGit1Click(Sender: TObject);
var satno:integer;
    ararakam:integer;
    sat:string;
begin
if rke1.Checked then ararakam:=0 else ararakam:=1000;
satno:=-1;
sat:=(inputbox(loadstr(ararakam+129),loadstr(ararakam+106),''));
val(sat,satno,ararakam);
if ararakam<>0 then exit;
if (satno=-1) then exit;
   form5.RichEdit1.CaretX:=0;
   form5.RichEdit1.CaretY:=satno;
form5.Show;
end;

procedure TForm2.Kitapzleri1Click(Sender: TObject);
begin
(* N14.Checked:=form5.RichEdit1.BookMarkOptions.[1].Valid;
 N22.Checked:=form5.RichEdit1.BookMarks[2].Valid;
 N32.Checked:=form5.RichEdit1.BookMarks[3].Valid;
 N42.Checked:=form5.RichEdit1.BookMarks[4].Valid;
 N51.Checked:=form5.RichEdit1.BookMarks[5].Valid;
 N61.Checked:=form5.RichEdit1.BookMarks[6].Valid;
 N71.Checked:=form5.RichEdit1.BookMarks[7].Valid;
 N81.Checked:=form5.RichEdit1.BookMarks[8].Valid;
 N91.Checked:=form5.RichEdit1.BookMarks[9].Valid;
 N001.Checked:=form5.RichEdit1.BookMarks[0].Valid;*)
end;

procedure TForm2.N14Click(Sender: TObject);
begin
        form5.RichEdit1.GotoBookMark(1);
        if not(form5.RichEdit1.IsBookmark(1)) then
         form5.RichEdit1.SetBookMark(1,form5.RichEdit1.CaretX,form5.RichEdit1.CaretY);
        form5.Show;
end;

procedure TForm2.N22Click(Sender: TObject);
begin
        form5.RichEdit1.GotoBookMark(2);
        if not(form5.RichEdit1.IsBookmark(2)) then
         form5.RichEdit1.SetBookMark(2,form5.RichEdit1.CaretX,form5.RichEdit1.CaretY);
        form5.Show;
end;

procedure TForm2.N32Click(Sender: TObject);
begin
        form5.RichEdit1.GotoBookMark(3);
        if not(form5.RichEdit1.IsBookmark(3)) then
         form5.RichEdit1.SetBookMark(3,form5.RichEdit1.CaretX,form5.RichEdit1.CaretY);
        form5.Show;
end;

procedure TForm2.N42Click(Sender: TObject);
begin
        form5.RichEdit1.GotoBookMark(4);
        if not(form5.RichEdit1.IsBookmark(4)) then
         form5.RichEdit1.SetBookMark(4,form5.RichEdit1.CaretX,form5.RichEdit1.CaretY);
        form5.Show;
end;

procedure TForm2.N51Click(Sender: TObject);
begin
        form5.RichEdit1.GotoBookMark(5);
        if not(form5.RichEdit1.IsBookmark(5)) then
         form5.RichEdit1.SetBookMark(5,form5.RichEdit1.CaretX,form5.RichEdit1.CaretY);
        form5.Show;
end;

procedure TForm2.N61Click(Sender: TObject);
begin
        form5.RichEdit1.GotoBookMark(6);
        if not(form5.RichEdit1.IsBookmark(6)) then
         form5.RichEdit1.SetBookMark(6,form5.RichEdit1.CaretX,form5.RichEdit1.CaretY);
        form5.Show;
end;

procedure TForm2.N71Click(Sender: TObject);
begin
        form5.RichEdit1.GotoBookMark(7);
        if not(form5.RichEdit1.IsBookmark(7)) then
         form5.RichEdit1.SetBookMark(7,form5.RichEdit1.CaretX,form5.RichEdit1.CaretY);
        form5.Show;
end;

procedure TForm2.N81Click(Sender: TObject);
begin
        form5.RichEdit1.GotoBookMark(8);
        if not(form5.RichEdit1.IsBookmark(8)) then
         form5.RichEdit1.SetBookMark(8,form5.RichEdit1.CaretX,form5.RichEdit1.CaretY);
        form5.Show;
end;

procedure TForm2.N91Click(Sender: TObject);
begin
        form5.RichEdit1.GotoBookMark(9);
        if not(form5.RichEdit1.IsBookmark(9)) then
         form5.RichEdit1.SetBookMark(9,form5.RichEdit1.CaretX,form5.RichEdit1.CaretY);
        form5.Show;
end;

procedure TForm2.N001Click(Sender: TObject);
begin
        form5.RichEdit1.GotoBookMark(0);
        if not(form5.RichEdit1.IsBookmark(0)) then
         form5.RichEdit1.SetBookMark(0,form5.RichEdit1.CaretX,form5.RichEdit1.CaretY);
        form5.Show;
end;

procedure TForm2.Herzamanstte1Click(Sender: TObject);
begin
 if (Herzamanstte1.Checked) then begin
  SetWindowPos(Form2.handle, HWND_TOPMOST,Form2.Left, Form2.Top, Form2.Width, Form2.Height,0);
     end
   else
  SetWindowPos(Form2.handle, HWND_NOTOPMOST,Form2.Left, Form2.Top, Form2.Width, Form2.Height,0);
form3.CheckBox1.Checked:=Herzamanstte1.Checked;
end;

procedure TForm2.PopupMenu6Popup(Sender: TObject);
begin
Nesneler1.Checked:=Nesneler2.Checked;
Araubuu2.Checked:=Araubuu1.Checked;
end;

procedure TForm2.YeniForm1Click(Sender: TObject);
begin
  with TForm1.Create(Application) do
    Show;
(*   Form19 := TForm19.CreateNew(Application);
   inc(formsayisi);
   form19.Name:='Form'+inttostr(formsayisi+1000);
   form19.Caption:='Form'+inttostr(formsayisi);//UNDER CONSTRUCTION
//   form19.OnPaint:=Form1.FormPaint;
//   form19.OnMouseDown:=Form1.FormMouseDown;
//   form19.OnMouseup:=Form1.FormMouseup;
//   form19.OnKeyDown:=Form1.FormKeyDown;
//   form19.OnMouseMove:=Form1.FormMouseMove;
//   form19.OnCloseQuery:=Form1.FormCloseQuery;
//   form19.OnActivate:=Form1.FormActivate;
//   form19.OnShow:=Form1.FormShow;
//   form19.OnDblClick:=Form1.FormDblClick;
//          ReadComponentResFile( 'Form2.dfm', Form19 );
          {$IFDEF Delphi4}
            Form19.AfterConstruction;
          {$ELSE}
            if @Form19.OnCreate <> nil then Form19.OnCreate(Form19);
          {$ENDIF}
          Form19.Show;
*)          
end;

procedure TForm2.mnTemizle1Click(Sender: TObject);
begin
form2.ListBox1.Items.Clear;
end;

procedure TForm2.PopupMenu7Popup(Sender: TObject);
begin
mnTemizle1.Enabled:=(ListBox1.Items.Count<>0);
end;

{
///////////////------------SoleBee v1.1-----------------\\\\\\\\\\\\\\\\\\\\\\\\
|||||||||||||||AÞAÐIDAN ÝTÝBAREN KOD ÝÞLEMLERÝ YAPILIYOR||||||||||||||||||||||||
\\\\\\\\\\\\\\\-------------Forever!...-----------------////////////////////////
}

function TForm2.PlayWavFile(const FileName: string): Boolean;
begin
Result := PlaySound(PChar(FileName), 0, SND_ASYNC);
end;

procedure TForm2.StopWav;
var buffer: array[0..2] of char;
begin
buffer[0] := #0;
PlaySound(Buffer, 0, SND_PURGE);
end;

procedure GetArguments(Args: TStrings; S: string; var Proc: string);
var
   p,i,Open,Close:Integer;
   Opened:Boolean;
   ara:string;
begin
   Args.Clear;
   s:='('+s+')';
   p:=Pos('(',S);
   if (p = 0) then Exit;
   Proc:=Trim(Copy(S,1,p - 1));
   S:=Trim(Copy(S,p+1,MaxInt));
   p:=LastDelimiter(')',S);
   Opened:=False;
   while (p > 0) do
   begin
      Open:=0;
      Close:=0;
      for i:=(p - 1) downto 1 do
      begin
         if (S[i] = '"') then Opened:=not(Opened);
         if (Opened) then Continue;
         if (S[i] = '(') then Inc(Open);
         if (S[i] = ')') then Inc(Close);
         if ((S[i] = ',') or (i = 1)) and (Open = Close) then
         begin
            if (i = 1) then
            begin
               ara:=Trim(Copy(S,i,p - i));
               Args.Insert(0,ara);
               S:='';
            end
            else
            begin
               ara:=Trim(Copy(S,i + 1,p - (i + 1)));
               Args.Insert(0,ara);
               S:=Copy(S,1,i);
            end;
            Break;
         end;
      end;
      p:=LastDelimiter(',',S);
   end;
end;

function TForm2.mid(metin:string; ilk:integer; uzunluk:integer):string;
var i:integer;arametin:string;   //mid (ad,1,5) 1'den itibaren 5 karakter kopartýr
begin
arametin:='';
if metin<> '' then for i:=ilk to ilk+uzunluk-1 do arametin:=arametin+metin[i];
mid:=arametin;
end;

function Tform2.bul(metin:string; degeri:char):integer;
var i:integer;arametin:string; //bul (ad, 's') s'yi arayip yerini tamsayý olarak verir
begin
arametin:='';  bul:=0; //bulamazsa 0 deðeri
for i:=1 to length(metin) do begin
 if metin[i]=degeri then begin
 bul:=i;
 exit;
 end;
end;
end;

function geriBul(metin: string; degeri: Char;p:integer): Integer;
begin                             //sondan ilk karakteri bulur
   while (P>0) and (metin[P]<>degeri) do Dec(P);
   Result:=P;
end;

function cifttirnak(metin:string):string;    //sadece " lar yok ediliyor
var i:integer;arametin:string;
begin
  for i:=1 to length(metin) do
  begin
     if not(metin[i] in ['"']) then arametin:=arametin+metin[i];
  end;
  result:=arametin;
end;

procedure degisken(metin,degeri:string);   //list2 den karþýlaþtýrýp atama yapar
begin
     if form2.ListView2.FindCaption(-1,lowercase(metin),false,false,false)<>NIL then begin
     ListItem:= form2.ListView2.FindCaption(-1,lowercase(metin),false,false,false);
           if lowercase(listitem.caption)=metin then begin //zaten varsa eklenmez, günceller
            listitem.SubItems[0]:=cifttirnak(degeri);
            exit;
           end;
     end else
     begin
        listitem:=form2.ListView2.items.add;
        ListItem.Caption:=metin;
        listitem.SubItems.Add(cifttirnak(degeri));
     end;
end;

function deger(metin:string):string;     //ad:=deger(a); a deðiþkeninin deðeri alýnýr
begin
result:='';  //bulamazsa sonuç yok, 0 mý boþluk mu daha iyi?
     if form2.ListView2.FindCaption(-1,lowercase(metin),false,false,false)<>NIL then begin
     ListItem:= form2.ListView2.FindCaption(-1,lowercase(metin),false,false,false);
           if lowercase(listitem.caption)=lowercase(metin) then begin
            result:=listitem.SubItems[0];
            exit;
           end;
     end;
end;

function TForm2.NesneOzelligiBul(nesneadi1:string;nesneturu1:string):string;
var            //  gecici:=NesneOzelligiBul(nesneadi,nesneturu);
    tmp:Tcomponent;
    vt:TClientDataSet;num:integer;
    ExcelBitbtn:TBitbtn;
    sayfa:variant;  //excel application
    i,k:integer;
    ProcName:string;
    Args:TStrings;
    ara1,ara2,ara3:string;
begin

if (lowercase(ada_ayikla(nesneadi1))=lowercase(form2.komutlistesi('Tablo'))) then //TABLOlar ayrýca iþlenebilir
begin
  vt:=TClientDataSet(form1.FindComponent(nesneadi1+'Gercek'));
  if lowercase(ada_ayikla(nesneturu1))=lowercase(form2.komutlistesi('alan')) then begin
    if not(vt.Active) then
     begin
      result:='';
      exit;
     end;
   delete(nesneturu1,1,length(ada_ayikla(nesneturu1)));
   num:=strtoint(nesneturu1)-1;
   result:=vt.Fields.Fields[num].AsString;
   end else
  if lowercase(ada_ayikla(nesneturu1))=lowercase(form2.komutlistesi('kayitsayisi')) then begin
    if not(vt.Active) then
     begin
      result:='0';
      exit;
     end;
   result:=inttostr(vt.RecordCount);
   end else
  if lowercase(ada_ayikla(nesneturu1))=lowercase(form2.komutlistesi('kayitno')) then begin
    if not(vt.Active) then
     begin
      result:='0';
      exit;
     end;
   result:=inttostr(vt.RecNo);
   end else
  if lowercase(ada_ayikla(nesneturu1))=lowercase(form2.komutlistesi('aktif')) then begin
           if vt.Active then
           result:=form2.komutlistesi('Evet') else
           result:=form2.komutlistesi('Hayir');
   end else
  if ada_ayikla(nesneturu1)=lowercase(form2.komutlistesi('deger')) then begin
           result:=vt.FileName;
   end;
end

             else
if (lowercase(ada_ayikla(nesneadi1))=lowercase(form2.komutlistesi('ExcelTablosu'))) then //ExcelTablosu
begin
  ExcelBitbtn:=TBitbtn(form1.FindComponent(nesneadi1));
              if (nesneturu1=lowercase(form2.komutlistesi('aktif'))) then
                if ExcelBitbtn.enabled
                 then result:=form2.komutlistesi('Evet')
                 else result:=form2.komutlistesi('Hayir');
              if (nesneturu1=lowercase(form2.komutlistesi('ust'))) then
               result:= inttostr(ExcelBitbtn.top);
              if (nesneturu1=lowercase(form2.komutlistesi('sol'))) then
               result:= inttostr(ExcelBitbtn.left);
              if (nesneturu1=lowercase(form2.komutlistesi('yukseklik'))) then
               result:= inttostr(ExcelBitbtn.height);
              if (nesneturu1=lowercase(form2.komutlistesi('genislik'))) then
               result:= inttostr(ExcelBitbtn.width);
              if (nesneturu1=lowercase(form2.komutlistesi('deger'))) then
               result:= ExcelBitbtn.hint;

if ((lowercase(form2.mid(nesneturu1,1,length(form2.komutlistesi('hucre'))))=lowercase(form2.komutlistesi('hucre')))) then begin
  delete(nesneturu1,1,length(form2.komutlistesi('hucre')));
  nesneturu1:=trim(nesneturu1);
  delete(nesneturu1,1,1);                 //ilk [ silinir
  delete(nesneturu1,length(nesneturu1),1); //son ]
   Args:=TStringList.Create;
   try
   GetArguments(Args,nesneturu1,ProcName);
   if (args.Count=3)or(ExcelBitbtn.Enabled=true) then begin
         ara1:=Args.Strings[0];
         ara2:=Args.Strings[1];
         ara3:=Args.Strings[2];
         form2.icHesaplama(ara1);
         form2.icHesaplama(ara2);
         form2.icHesaplama(ara3);

    k:=0;     
    for i:=0 to length(excelbook)-1 do
       if ExcelBook[i].num=strtoint(form1.no_ayikla(nesneadi1)) then
        begin
         k:=i;
         break;
        end;

    sayfa:=ExcelBook[k].book.workbooks[1].worksheets[strtoint(ara1)];
    result:=sayfa.Cells[strtoint(ara2),strtoint(ara3)]; //Sutun(AB..) Satir(12..) mantiði ile çalýþýyor
     end;
   finally
    args.Free;
   end;
   if (ExcelBitbtn.Enabled=false) then result:='';
  end;

end

             else
             if (lowercase(nesneadi1)=lowercase(form2.komutlistesi('Form'))) then //eh onu unutmak olur mu?
             begin
              if (nesneturu1=lowercase(form2.komutlistesi('baslik'))) then
                result:= form1.Caption;
              if (nesneturu1=lowercase(form2.komutlistesi('ipucu'))) then
                result:= form1.hint;
              if (nesneturu1=lowercase(form2.komutlistesi('aktif'))) then
                if Form1.enabled
                 then result:=form2.komutlistesi('Evet')
                 else result:=form2.komutlistesi('Hayir');
              if (nesneturu1=lowercase(form2.komutlistesi('ust'))) then
               result:= inttostr(form1.top);
              if (nesneturu1=lowercase(form2.komutlistesi('sol'))) then
               result:= inttostr(form1.left);
              if (nesneturu1=lowercase(form2.komutlistesi('yukseklik'))) then
               result:= inttostr(form1.height);
              if (nesneturu1=lowercase(form2.komutlistesi('genislik'))) then
               result:= inttostr(form1.width);
              if (nesneturu1=lowercase(form2.komutlistesi('renk'))) then
               result:= inttostr(form1.color);
             end else
             begin
           tmp:=form1.FindComponent(nesneadi1);
              if (nesneturu1=lowercase(form2.komutlistesi('baslik'))) then
               begin
               if (tmp is TBitBtn) then     result:= ((tmp as TBitBtn).caption);
               if (tmp is TStaticText) then result:= (tmp as TStaticText).caption;
               if (tmp is TEdit) then       result:= (tmp as TEdit).text;
               if (tmp is TCheckBox) then   result:= (tmp as TCheckBox).Caption;
               if (tmp is TListbox) then    result:= (tmp as TListbox).Items[(tmp as TListbox).ItemIndex];
               if (tmp is TCombobox) then   result:= (tmp as TCombobox).Text;
               if (tmp is TRichEdit) then   result:= (tmp as TRichEdit).Text;
               end;
              if (nesneturu1=lowercase(form2.komutlistesi('ipucu'))) then
               begin
               if (tmp is TBitBtn) then      result:= (tmp as TBitBtn).hint;
               if (tmp is TStaticText) then  result:= (tmp as TStaticText).hint;
               if (tmp is TEdit) then        result:= (tmp as TEdit).hint;
               if (tmp is TCheckBox) then    result:= (tmp as TCheckBox).hint;
               if (tmp is TListbox) then     result:= (tmp as TListbox).hint;
               if (tmp is TCombobox) then    result:= (tmp as TCombobox).hint;
               if (tmp is TRichEdit) then    result:= (tmp as TRichEdit).hint;
               end;
              if (nesneturu1=lowercase(form2.komutlistesi('aktif'))) then
               begin
               if (tmp is TBitBtn) then
                if (tmp as TBitBtn).enabled
                 then result:=form2.komutlistesi('Evet')
                 else result:=form2.komutlistesi('Hayir');
               if (tmp is TStaticText) then
                if (tmp as TStaticText).enabled
                 then result:=form2.komutlistesi('Evet')
                 else result:=form2.komutlistesi('Hayir');
               if (tmp is TEdit) then
                if (tmp as TEdit).enabled
                 then result:=form2.komutlistesi('Evet')
                 else result:=form2.komutlistesi('Hayir');
               if (tmp is TCheckBox) then
                if (tmp as TCheckBox).enabled
                 then result:=form2.komutlistesi('Evet')
                 else result:=form2.komutlistesi('Hayir');
               if (tmp is TListBox) then
                if (tmp as TListBox).enabled
                 then result:=form2.komutlistesi('Evet')
                 else result:=form2.komutlistesi('Hayir');
               if (tmp is TCombobox) then
                if (tmp as TCombobox).enabled
                 then result:=form2.komutlistesi('Evet')
                 else result:=form2.komutlistesi('Hayir');
               if (tmp is TRichEdit) then
                if (tmp as TRichEdit).enabled
                 then result:=form2.komutlistesi('Evet')
                 else result:=form2.komutlistesi('Hayir');
               end;
              if (nesneturu1=lowercase(form2.komutlistesi('ust'))) then
               begin
               if (tmp is TBitBtn) then      result:=inttostr((tmp as TBitBtn).top);
               if (tmp is TStaticText) then  result:=inttostr((tmp as TStaticText).top);
               if (tmp is TEdit) then        result:=inttostr((tmp as TEdit).top);
               if (tmp is TCheckBox) then    result:=inttostr((tmp as TCheckBox).top);
               if (tmp is TListbox) then     result:=inttostr((tmp as TListbox).top);
               if (tmp is TCombobox) then    result:=inttostr((tmp as TCombobox).top);
               if (tmp is TRichEdit) then    result:=inttostr((tmp as TRichEdit).top);
               end;
              if (nesneturu1=lowercase(form2.komutlistesi('sol'))) then
               begin
               if (tmp is TBitBtn) then     result:=inttostr((tmp as TBitBtn).left);
               if (tmp is TStaticText) then result:=inttostr((tmp as TStaticText).left);
               if (tmp is TEdit) then       result:=inttostr((tmp as TEdit).left);
               if (tmp is TCheckBox) then   result:=inttostr((tmp as TCheckBox).left);
               if (tmp is TListbox) then    result:=inttostr((tmp as TListbox).left);
               if (tmp is TCombobox) then   result:=inttostr((tmp as TCombobox).left);
               if (tmp is TRichEdit) then   result:=inttostr((tmp as TRichEdit).left);
               end;
              if (nesneturu1=lowercase(form2.komutlistesi('yukseklik'))) then
               begin
               if (tmp is TBitBtn) then      result:=inttostr((tmp as TBitBtn).height);
               if (tmp is TStaticText) then  result:=inttostr((tmp as TStaticText).height);
               if (tmp is TEdit) then        result:=inttostr((tmp as TEdit).height);
               if (tmp is TCheckBox) then    result:=inttostr((tmp as TCheckBox).height);
               if (tmp is TListbox) then     result:=inttostr((tmp as TListbox).height);
               if (tmp is TCombobox) then    result:=inttostr((tmp as TCombobox).height);
               if (tmp is TRichEdit) then    result:=inttostr((tmp as TRichEdit).height);
               end;
              if (nesneturu1=lowercase(form2.komutlistesi('genislik'))) then
               begin
               if (tmp is TBitBtn) then      result:=inttostr((tmp as TBitBtn).width);
               if (tmp is TStaticText) then  result:=inttostr((tmp as TStaticText).width);
               if (tmp is TEdit) then        result:=inttostr((tmp as TEdit).width);
               if (tmp is TCheckBox) then    result:=inttostr((tmp as TCheckBox).width);
               if (tmp is TListbox) then     result:=inttostr((tmp as TListbox).width);
               if (tmp is TCombobox) then    result:=inttostr((tmp as TCombobox).width);
               if (tmp is TRichEdit) then    result:=inttostr((tmp as TRichEdit).width);
               end;
              if (nesneturu1=lowercase(form2.komutlistesi('renk'))) then
               begin
               if (tmp is TStaticText) then  result:=inttostr((tmp as TStaticText).color);
               if (tmp is TBitbtn) then      result:=inttostr((tmp as TBitbtn).font.color);
               if (tmp is TEdit) then        result:=inttostr((tmp as TEdit).color);
               if (tmp is TCheckBox) then    result:=inttostr((tmp as TCheckBox).color);
               if (tmp is TListbox) then     result:=inttostr((tmp as TListbox).color);
               if (tmp is TCombobox) then    result:=inttostr((tmp as TCombobox).color);
               if (tmp is TRichEdit) then    result:=inttostr((tmp as TRichEdit).color);
               end;
              if (nesneturu1=lowercase(form2.komutlistesi('secili'))) then
               begin
               if (tmp is TListbox) then     result:= inttostr((tmp as TListbox).ItemIndex);
               if (tmp is TCombobox) then    result:= inttostr((tmp as TComboBox).ItemIndex);
               end;
   if ((lowercase(form2.mid(nesneturu1,1,length(form2.komutlistesi('deger'))))=lowercase(form2.komutlistesi('deger')))) then
               begin
                if (tmp is TBitbtn) then
                  if lowercase(form1.ada_ayikla(nesneadi1))=lowercase(Form2.komutlistesi('Zamanlayici')) then begin
                       result:=(tmp as TBitbtn).Hint;  //Timer1.interval
                  end else
                  if lowercase(form1.ada_ayikla(nesneadi1))=lowercase(Form2.komutlistesi('Dugme')) then begin
                       result:=(tmp as TBitbtn).HelpKeyword;  //BitBtn1.Glyph.Filename
                  end;

               if (tmp is TCheckBox) then
                if (tmp as TCheckBox).Checked then
                 result:=form2.komutlistesi('Evet')
                else
                 result:=form2.komutlistesi('Hayir');

                if (tmp is TRichEdit) then begin
                  delete(nesneturu1,1,length(form2.komutlistesi('deger')));
                  nesneturu1:=trim(nesneturu1);
                  delete(nesneturu1,1,1);                 //ilk [ silinir
                  delete(nesneturu1,length(nesneturu1),1); //son ]
                  ara1:=nesneturu1;
                  form2.icHesaplama(ara1);
                  result:=(tmp as TRichEdit).Lines[strtoint(ara1)];
                end;

                if (tmp is TComboBox) then begin
                  delete(nesneturu1,1,length(form2.komutlistesi('deger')));
                  nesneturu1:=trim(nesneturu1);
                  delete(nesneturu1,1,1);                 //ilk [ silinir
                  delete(nesneturu1,length(nesneturu1),1); //son ]
                  ara1:=nesneturu1;
                  form2.icHesaplama(ara1);
                  result:=(tmp as TComboBox).items[strtoint(ara1)];
                end;

                if (tmp is TListBox) then begin
                  delete(nesneturu1,1,length(form2.komutlistesi('deger')));
                  nesneturu1:=trim(nesneturu1);
                  delete(nesneturu1,1,1);                 //ilk [ silinir
                  delete(nesneturu1,length(nesneturu1),1); //son ]
                  ara1:=nesneturu1;
                  form2.icHesaplama(ara1);
                  result:=(tmp as TListBox).items[strtoint(ara1)];
                end;

               end;
          end;         //if form
end;

procedure TForm2.NesneOzelligineAtama(nesneadi1:string;nesneturu1:string;gecicisag:string);
var bozuk:integer;rakam:longint;  //NesneOzelligineAtama(nesneadi,nesneturu,gecici);
    tmp:Tcomponent;soltaraf:string;
    vt:TClientDataSet;num:integer;
    vtaktif:boolean;
    ExcelBitbtn:TBitbtn;
    sayfa:variant;  //excel application
    i,k:integer;
    ProcName:string;
    Args:TStrings;
    ara1,ara2,ara3:string;comboindex:integeR;
begin

if (lowercase(ada_ayikla(nesneadi1))=lowercase(form2.komutlistesi('Tablo'))) then //TABLOlar ayrýca iþlenebilir
begin
  vt:=TClientDataSet(form1.FindComponent(nesneadi1+'Gercek'));
  if lowercase(ada_ayikla(nesneturu1))=lowercase(form2.komutlistesi('alan')) then begin
   delete(nesneturu1,1,length(ada_ayikla(nesneturu1)));
               if deger(gecicisag)<>'' then
                soltaraf:=deger(gecicisag)
                else
                soltaraf:=cifttirnak(gecicisag);
   num:=strtoint(nesneturu1)-1;
   vt.Fields.Fields[num].AsString:=soltaraf;
   end
   else if (nesneturu1)=lowercase(form2.komutlistesi('Aktif')) then begin
               if deger(gecicisag)<>'' then
                soltaraf:=deger(gecicisag)
                else
                soltaraf:=cifttirnak(gecicisag);
   vt.Active:=(lowercase(soltaraf)=lowercase(form2.komutlistesi('Evet')));
   end
   else  if (nesneturu1)=lowercase(form2.komutlistesi('deger')) then begin
                    TBitbtn(Form1.FindComponent((tmp as TBitBtn).Name)).Hint:=soltaraf;
                    vtaktif:=vt.Active;            vt.Active:=false;
                    vt.FileName:=soltaraf;         vt.Active:=vtaktif;
         end;
end
  else
if (lowercase(ada_ayikla(nesneadi1))=lowercase(form2.komutlistesi('ExcelTablosu'))) then //ExcelTablosu
begin
  ExcelBitbtn:=TBitbtn(form1.FindComponent(nesneadi1));
               if deger(gecicisag)<>'' then
                soltaraf:=deger(gecicisag)
                else
                soltaraf:=cifttirnak(gecicisag);
              if (nesneturu1=lowercase(form2.komutlistesi('aktif'))) then
                ExcelBitbtn.enabled:=(lowercase(soltaraf)=lowercase(form2.komutlistesi('Evet')));;
              if (nesneturu1=lowercase(form2.komutlistesi('ust'))) then
               ExcelBitbtn.top:=strtoint(soltaraf);
              if (nesneturu1=lowercase(form2.komutlistesi('sol'))) then
               ExcelBitbtn.left:=strtoint(soltaraf);
              if (nesneturu1=lowercase(form2.komutlistesi('yukseklik'))) then
               ExcelBitbtn.height:=strtoint(soltaraf);
              if (nesneturu1=lowercase(form2.komutlistesi('genislik'))) then
               ExcelBitbtn.width:=strtoint(soltaraf);
              if (nesneturu1=lowercase(form2.komutlistesi('deger'))) then
               ExcelBitbtn.hint:=soltaraf;

if ((lowercase(form2.mid(nesneturu1,1,length(form2.komutlistesi('hucre'))))=lowercase(form2.komutlistesi('hucre')))) then begin
  delete(nesneturu1,1,length(form2.komutlistesi('hucre')));
  nesneturu1:=trim(nesneturu1);
  delete(nesneturu1,1,1);                 //ilk [ silinir
  delete(nesneturu1,length(nesneturu1),1); //son ]
   Args:=TStringList.Create;
   try
   GetArguments(Args,nesneturu1,ProcName);
   if (args.Count=3)or(ExcelBitbtn.Enabled=true) then begin
         ara1:=Args.Strings[0];
         ara2:=Args.Strings[1];
         ara3:=Args.Strings[2];
         form2.icHesaplama(ara1);
         form2.icHesaplama(ara2);
         form2.icHesaplama(ara3);

    k:=0;
    for i:=0 to length(excelbook)-1 do
       if ExcelBook[i].num=strtoint(form1.no_ayikla(nesneadi1)) then
        begin
         k:=i;
         break;
        end;

    sayfa:=ExcelBook[k].book.workbooks[1].worksheets[strtoint(ara1)];
    sayfa.Cells[strtoint(ara2),strtoint(ara3)]:=soltaraf; //Sutun(AB..) Satir(12..) mantiði ile çalýþýyor
     end;
   finally
    args.Free;
   end;
  end;

end
        else
             if (lowercase(nesneadi1)=lowercase(form2.komutlistesi('Form'))) then //eh onu unutmak olur mu?
             begin
               if deger(gecicisag)<>'' then
                soltaraf:=deger(gecicisag)
                else
                soltaraf:=cifttirnak(gecicisag);
              if (nesneturu1=lowercase(form2.komutlistesi('baslik'))) then
                form1.Caption:=soltaraf;
              if (nesneturu1=lowercase(form2.komutlistesi('ipucu'))) then
                form1.hint:=soltaraf;
              if (nesneturu1=lowercase(form2.komutlistesi('aktif'))) then
                if soltaraf=lowercase(form2.komutlistesi('Evet')) then
                  form1.enabled:=true else form1.enabled:=false;
              if (nesneturu1=lowercase(form2.komutlistesi('ust'))) then
               begin
               val(soltaraf,rakam,bozuk);
               if bozuk=0 then form1.top:=rakam;
               end;
              if (nesneturu1=lowercase(form2.komutlistesi('sol'))) then
               begin
               val(soltaraf,rakam,bozuk);
               if bozuk=0 then form1.left:=rakam;
               end;
              if (nesneturu1=lowercase(form2.komutlistesi('yukseklik'))) then
               begin
               val(soltaraf,rakam,bozuk);
               if bozuk=0 then form1.height:=rakam;
               end;
              if (nesneturu1=lowercase(form2.komutlistesi('genislik'))) then
               begin
               val(soltaraf,rakam,bozuk);
               if bozuk=0 then form1.width:=rakam;
               end;
              if (nesneturu1=lowercase(form2.komutlistesi('renk'))) then
               begin
               val(soltaraf,rakam,bozuk);
               if bozuk=0 then form1.color:=rakam;
               end;
             end else
             begin
           tmp:=form1.FindComponent(nesneadi1);
              if (nesneturu1=lowercase(form2.komutlistesi('baslik'))) then
               begin
               if deger(gecicisag)<>'' then   //dugme1.baslik=degisken
                soltaraf:=deger(gecicisag)
                else                          //dugme1.baslik="deðer"
                soltaraf:=cifttirnak(gecicisag);
               if (tmp is TBitBtn) then     (tmp as TBitBtn).caption:=soltaraf;
               if (tmp is TStaticText) then (tmp as TStaticText).caption:=soltaraf;
               if (tmp is TEdit) then       (tmp as TEdit).text:=soltaraf;
               if (tmp is TCheckBox) then   (tmp as TCheckBox).Caption:=soltaraf;
               if (tmp is TListbox) then    (tmp as TListbox).Items[(tmp as TListbox).ItemIndex]:=soltaraf;
               if (tmp is TCombobox) then   (tmp as TCombobox).Text:=soltaraf;
               if (tmp is TRichEdit) then   (tmp as TRichEdit).Text:=soltaraf;
               end;
              if (nesneturu1=lowercase(form2.komutlistesi('ipucu'))) then
               begin
               if deger(gecicisag)<>'' then
                soltaraf:=deger(gecicisag)
                else
                soltaraf:=cifttirnak(gecicisag);
               if (tmp is TBitBtn) then      (tmp as TBitBtn).hint:=soltaraf;
               if (tmp is TStaticText) then  (tmp as TStaticText).hint:=soltaraf;
               if (tmp is TEdit) then        (tmp as TEdit).hint:=soltaraf;
               if (tmp is TCheckBox) then   (tmp as TCheckBox).hint:=soltaraf;
               if (tmp is TListbox) then     (tmp as TListbox).hint:=soltaraf;
               if (tmp is TCombobox) then   (tmp as TCombobox).hint:=soltaraf;
               if (tmp is TRichEdit) then       (tmp as TRichEdit).hint:=soltaraf;
               end;
              if (nesneturu1=lowercase(form2.komutlistesi('aktif'))) then
               begin
                if (tmp is TBitBtn) then begin
(tmp as TBitBtn).enabled:=(lowercase(cifttirnak(gecicisag))=lowercase(form2.komutlistesi('Evet')));
TTimer(Form1.FindComponent((tmp as TBitBtn).Name+'Gercek')).Enabled:=(lowercase(cifttirnak(gecicisag))=lowercase(form2.komutlistesi('Evet')));
                  end;
               if (tmp is TStaticText) then
               (tmp as TStaticText).enabled:=(lowercase(cifttirnak(gecicisag))=lowercase(form2.komutlistesi('Evet')));
               if (tmp is TEdit) then
               (tmp as TEdit).enabled:=(lowercase(cifttirnak(gecicisag))=lowercase(form2.komutlistesi('Evet')));
               if (tmp is TCheckBox) then
               (tmp as TCheckBox).enabled:=(lowercase(cifttirnak(gecicisag))=lowercase(form2.komutlistesi('Evet')));
               if (tmp is TListBox) then
               (tmp as TListBox).enabled:=(lowercase(cifttirnak(gecicisag))=lowercase(form2.komutlistesi('Evet')));
               if (tmp is TCombobox) then
               (tmp as TCombobox).enabled:=(lowercase(cifttirnak(gecicisag))=lowercase(form2.komutlistesi('Evet')));
               if (tmp is TRichEdit) then
               (tmp as TRichEdit).enabled:=(lowercase(cifttirnak(gecicisag))=lowercase(form2.komutlistesi('Evet')));
               end;
              if (nesneturu1=lowercase(form2.komutlistesi('ust'))) then
               begin
               if deger(gecicisag)<>'' then   //dugme1.baslik=degisken
                soltaraf:=deger(gecicisag)
                else                          //dugme1.baslik="deðer"
                soltaraf:=cifttirnak(gecicisag);
               val(soltaraf,rakam,bozuk);
               if bozuk=0 then begin  //sað taraf rakam ise atama oluyor
               if (tmp is TBitBtn) then      (tmp as TBitBtn).top:=rakam;
               if (tmp is TStaticText) then  (tmp as TStaticText).top:=rakam;
               if (tmp is TEdit) then        (tmp as TEdit).top:=rakam;
               if (tmp is TCheckBox) then    (tmp as TCheckBox).top:=rakam;
               if (tmp is TListbox) then     (tmp as TListbox).top:=rakam;
               if (tmp is TCombobox) then    (tmp as TCombobox).top:=rakam;
               if (tmp is TRichEdit) then    (tmp as TRichEdit).top:=rakam;
               end;
               end;
              if (nesneturu1=lowercase(form2.komutlistesi('sol'))) then
               begin
               if deger(gecicisag)<>'' then
                soltaraf:=deger(gecicisag)
                else
                soltaraf:=cifttirnak(gecicisag);
               val(soltaraf,rakam,bozuk);
               if bozuk=0 then begin
               if (tmp is TBitBtn) then     (tmp as TBitBtn).left:=rakam;
               if (tmp is TStaticText) then (tmp as TStaticText).left:=rakam;
               if (tmp is TEdit) then       (tmp as TEdit).left:=rakam;
               if (tmp is TCheckBox) then   (tmp as TCheckBox).left:=rakam;
               if (tmp is TListbox) then    (tmp as TListbox).left:=rakam;
               if (tmp is TCombobox) then   (tmp as TCombobox).left:=rakam;
               if (tmp is TRichEdit) then   (tmp as TRichEdit).left:=rakam;
               end;
               end;
              if (nesneturu1=lowercase(form2.komutlistesi('yukseklik'))) then
               begin
               if deger(gecicisag)<>'' then
                soltaraf:=deger(gecicisag)
                else
                soltaraf:=cifttirnak(gecicisag);
               val(soltaraf,rakam,bozuk);
               if bozuk=0 then begin
               if (tmp is TBitBtn) then           (tmp as TBitBtn).height:=rakam;
               if (tmp is TStaticText) then       (tmp as TStaticText).height:=rakam;
               if (tmp is TEdit) then             (tmp as TEdit).height:=rakam;
               if (tmp is TCheckBox) then         (tmp as TCheckBox).height:=rakam;
               if (tmp is TListbox) then          (tmp as TListbox).height:=rakam;
               if (tmp is TCombobox) then         (tmp as TCombobox).height:=rakam;
               if (tmp is TRichEdit) then         (tmp as TRichEdit).height:=rakam;
               end;
               end;
              if (nesneturu1=lowercase(form2.komutlistesi('genislik'))) then
               begin
               if deger(gecicisag)<>'' then
                soltaraf:=deger(gecicisag)
                else
                soltaraf:=cifttirnak(gecicisag);
               val(soltaraf,rakam,bozuk);
               if bozuk=0 then begin
               if (tmp is TBitBtn) then        (tmp as TBitBtn).width:=rakam;
               if (tmp is TStaticText) then    (tmp as TStaticText).width:=rakam;
               if (tmp is TEdit) then          (tmp as TEdit).width:=rakam;
               if (tmp is TCheckBox) then   (tmp as TCheckBox).width:=rakam;
               if (tmp is TListbox) then     (tmp as TListbox).width:=rakam;
               if (tmp is TCombobox) then   (tmp as TCombobox).width:=rakam;
               if (tmp is TRichEdit) then       (tmp as TRichEdit).width:=rakam;
               end;
               end;
              if (nesneturu1=lowercase(form2.komutlistesi('renk'))) then
               begin
               if deger(gecicisag)<>'' then
                soltaraf:=deger(gecicisag)
                else
                soltaraf:=cifttirnak(gecicisag);
               val(soltaraf,rakam,bozuk);
               if bozuk=0 then begin
               if (tmp is TStaticText) then     (tmp as TStaticText).color:=rakam;
               if (tmp is TBitbtn) then         (tmp as TBitbtn).font.color:=rakam;
               if (tmp is TEdit) then           (tmp as TEdit).color:=rakam;
               if (tmp is TCheckBox) then   (tmp as TCheckBox).color:=rakam;
               if (tmp is TListbox) then     (tmp as TListbox).color:=rakam;
               if (tmp is TCombobox) then   (tmp as TCombobox).color:=rakam;
               if (tmp is TRichEdit) then       (tmp as TRichEdit).color:=rakam;
               end;
               end;
              if (nesneturu1=lowercase(form2.komutlistesi('secili'))) then
               begin
               if deger(gecicisag)<>'' then
                soltaraf:=deger(gecicisag)
                else
                soltaraf:=cifttirnak(gecicisag);
               val(soltaraf,rakam,bozuk);
               if bozuk=0 then begin
               if (tmp is TListbox) then     (tmp as TListbox).ItemIndex:=rakam;
               if (tmp is TCombobox) then   (tmp as TCombobox).ItemIndex:=rakam;
               end;
               end;
   if ((lowercase(form2.mid(nesneturu1,1,length(form2.komutlistesi('deger'))))=lowercase(form2.komutlistesi('deger')))) then
               begin
               if deger(gecicisag)<>'' then
                soltaraf:=deger(gecicisag)
                else
                soltaraf:=cifttirnak(gecicisag);
                if (tmp is TBitBtn) then begin
                  if form1.ada_ayikla((tmp as TBitBtn).Name)=Form2.komutlistesi('Zamanlayici') then begin
                        TBitbtn(Form1.FindComponent((tmp as TBitBtn).Name)).Hint:=soltaraf;
                        TTimer(Form1.FindComponent((tmp as TBitBtn).Name+'Gercek')).Interval:=strtoint(soltaraf);
                  end else
                  if form1.ada_ayikla((tmp as TBitBtn).Name)=Form2.komutlistesi('Dugme') then begin
                      TBitbtn(Form1.FindComponent((tmp as TBitBtn).Name)).HelpKeyword:=soltaraf;
                      TBitbtn(Form1.FindComponent((tmp as TBitBtn).Name)).HelpType:=htContext;
                        if soltaraf<>'' then
                         try
                          if FileExists(soltaraf) then
                          (tmp as TBitBtn).Glyph.LoadFromFile(soltaraf);
                         except
                            form2.StatusBar1.SimpleText:=Exception.ClassName+' : '+Exception.MethodName(Exception.ClassInfo);
                            form2.ListBox1.Items.Add(Exception.ClassName+' : '+Exception.MethodName(Exception.ClassInfo));
                         end;
                  end;
                end;
               if (tmp is TCheckBox) then
                if lowercase(soltaraf)=lowercase(form2.komutlistesi('Evet')) then
          (tmp as TCheckBox).Checked:=true  else (tmp as TCheckBox).Checked:=false;

               if (tmp is TRichEdit) then begin
                  delete(nesneturu1,1,length(form2.komutlistesi('deger')));
                  nesneturu1:=trim(nesneturu1);
                  delete(nesneturu1,1,1);                 //ilk [ silinir
                  delete(nesneturu1,length(nesneturu1),1); //son ]
                  ara1:=nesneturu1;
                  form2.icHesaplama(ara1);
                  (tmp as TRichEdit).Lines[strtoint(ara1)]:=soltaraf;
                end;

               if (tmp is TComboBox) then begin
                  delete(nesneturu1,1,length(form2.komutlistesi('deger')));
                  nesneturu1:=trim(nesneturu1);
                  delete(nesneturu1,1,1);                 //ilk [ silinir
                  delete(nesneturu1,length(nesneturu1),1); //son ]
                  ara1:=nesneturu1;
                  form2.icHesaplama(ara1);
                  comboindex:=(tmp as TComboBox).Items.Capacity-1;
                  if (strtoint(ara1)>comboindex) then
                   (tmp as TComboBox).items.add(soltaraf)
                   else
                   (tmp as TComboBox).items[strtoint(ara1)]:=soltaraf;
                end;

               if (tmp is TListBox) then begin
                  delete(nesneturu1,1,length(form2.komutlistesi('deger')));
                  nesneturu1:=trim(nesneturu1);
                  delete(nesneturu1,1,1);                 //ilk [ silinir
                  delete(nesneturu1,length(nesneturu1),1); //son ]
                  ara1:=nesneturu1;
                  form2.icHesaplama(ara1);
                  (tmp as TListBox).items[strtoint(ara1)]:=soltaraf;
                end;

               end;
          end;         //if form
end;

procedure ara_atamaSag(var metin:string);   //hesaplamadaki atom ayrýmý
var gecici1,gecici2:integer;
    nesneadi1,nesneturu1:string;
    hata:integer;ara :real;
begin
    if (strpos(pchar(metin),'.')<> nil)and(form2.bul(metin,'"')=0) then
    begin  //nesne özelliði ise
       nesneadi1:=form2.mid(metin,1,form2.bul(metin,'.')-1);
       nesneturu1:='';
       gecici1:=form2.bul(metin,'.');
       gecici2:=length(metin);
       nesneturu1:=form2.mid(metin,gecici1+1,gecici2-gecici1);
       metin:=form2.NesneOzelligiBul(lowercase(trim(nesneadi1)),lowercase(trim(nesneturu1)));
    end
    else
       if deger(metin)<>'' then
        metin:=deger(metin)    //deðiþken ise
       else begin
          ara:=0;hata:=0;
          try
          ara:=strtofloat(metin);
          except
           on E:EConvertError do begin    hata:=-1;
              form2.StatusBar1.SimpleText:=E.ClassName+' : '+E.Message;
              form2.ListBox1.Items.Add(E.ClassName + ': ' + E.Message);
           end;
          end;
          if (hata<>0)and(form2.bul(metin,'"')=0) then
           begin
           if metin<>'' then degisken(metin,'0');
           metin:='0';
           end;
          if (form2.bul(metin,'"')<>0) then  metin:=cifttirnak(metin);
       end;
end;

procedure ara_atamaSagMetin(var metin:string);   //hesaplamadaki atom ayrýmý
var gecici1,gecici2:integer;
    nesneadi1,nesneturu1:string;
begin
    if (strpos(pchar(metin),'.')<> nil)and(form2.bul(metin,'"')=0) then
    begin
       nesneadi1:=form2.mid(metin,1,form2.bul(metin,'.')-1);
       nesneturu1:='';
       gecici1:=form2.bul(metin,'.');
       gecici2:=length(metin);
       nesneturu1:=form2.mid(metin,gecici1+1,gecici2-gecici1);
       metin:='"'+form2.NesneOzelligiBul(lowercase(trim(nesneadi1)),lowercase(trim(nesneturu1)))+'"';
    end
    else
       if deger(metin)<>'' then
        metin:='"'+deger(metin)+'"'
       else begin
          if (form2.bul(metin,'"')=0) then
           begin
           if metin<>'' then degisken(metin,'');
           metin:='';
           end;
          //if (form2.bul(metin,'"')<>0) then  metin:=cifttirnak(metin);
       end;
end;

function ara_atamaSol(metin1,metin2:string;islem:char):string;   //hesaplamadaki eþitliðin solu
var  sonuc:real;
begin
result:=metin2; //
if (metin1='')or(metin2='') then exit;
case islem of
'+': begin
         result:= FloatToStr(strtofloat(metin1)+strtofloat(metin2));
      end;
'-': begin
         result:= FloatToStr(strtofloat(metin1)-strtofloat(metin2));
      end;
'*': begin
         result:= FloatToStr(strtofloat(metin1)*strtofloat(metin2));
      end;
'/': begin
       sonuc:= strtofloat(metin1)/strtofloat(metin2);
       result:= FloatToStr(sonuc);
      end;
'^': begin
         result:= FloatToStr(power(strtofloat(metin1),strtofloat(metin2)));
      end;
'%': begin
         result:= intToStr(strtoint(metin1) mod strtoint(metin2));
      end;
'\': begin
         result:= intToStr(strtoint(metin1) div strtoint(metin2));
      end;
'@': begin
         result:= intToStr(strtoint(metin1) and strtoint(metin2));
      end;
'~': begin
         result:= intToStr(strtoint(metin1) or strtoint(metin2));
      end;
end; //case
end;

procedure PortOut(IOPort:word; value:byte);  //Artýk Kullanmýyoruz... NT uyumsuzluðu
assembler;
	asm
        mov ax,IOPort    //adres 2 Byte
	xchg ax,dx
    //    mov al,value     //deðeri 1 Byte
	out dx,al
        end;

function PortIn(IOPort:word):byte;
var value:byte;
begin
	asm
        mov ax,IOPort
	mov dx,ax
	in al,dx
        mov value,al
        end;
  result:=value;
end;

  function isaretiVarMi(metin:string):boolean;    //<>= içindir metinleri atlar...
  var i:integer;
      tirnak:boolean;
  begin
     result:=false;
     tirnak:=false;
    for i:=1 to length(metin) do
     begin
      if metin[i]='"' then tirnak:=not(tirnak);
       if tirnak=false then 
        if (metin[i]='=')or(metin[i]='<')or(metin[i]='>') then
         begin
          result:=true;
          exit;
         end;
     end;
  end;

function isaret_Bul(metin:string):boolean;
var
 sag,sol:string;isaret:byte;hata1,hata2:integer;ara1,ara2:double;
begin
if isaretiVarMi(metin) then
  begin
     isaret:=0;
     if (form2.bul(metin,'=')<>0)and
        ((metin[form2.bul(metin,'=')-1]<>'<')and
         (metin[form2.bul(metin,'=')-1]<>'>'))
        then isaret:=1 else                 //= sadece eþittirse
     if (form2.bul(metin,'=')<>0)and (metin[form2.bul(metin,'=')-1]='<')
        then isaret:=2 else                 //<=
     if (form2.bul(metin,'=')<>0)and (metin[form2.bul(metin,'=')-1]='>')
        then isaret:=3 else                 //>=
     if (form2.bul(metin,'>')<>0)and (metin[form2.bul(metin,'>')-1]<>'<')
        then isaret:=4 else                 //>
     if (form2.bul(metin,'<')<>0)and (metin[form2.bul(metin,'<')+1]='>')
        then isaret:=5 else                 //<>
     if (form2.bul(metin,'<')<>0)
        then isaret:=6;                     //<

     case isaret of
     1:
      begin
          sag:=trim(form2.mid(metin,1,form2.bul(metin,'=')-1));    //aslýnda sað ve sol ters olmuþþþþ
          sol:=trim(form2.mid(metin,form2.bul(metin,'=')+1,
                       length(metin)-form2.bul(metin,'=')));
      end;
     2:
      begin
          sag:=trim(form2.mid(metin,1,form2.bul(metin,'<')-1));
          sol:=trim(form2.mid(metin,form2.bul(metin,'<')+2,
                       length(metin)-form2.bul(metin,'<')));
      end;
     3:
      begin
          sag:=trim(form2.mid(metin,1,form2.bul(metin,'>')-1));
          sol:=trim(form2.mid(metin,form2.bul(metin,'>')+2,
                       length(metin)-form2.bul(metin,'>')));
      end;
     4:
      begin
          sag:=trim(form2.mid(metin,1,form2.bul(metin,'>')-1));
          sol:=trim(form2.mid(metin,form2.bul(metin,'>')+1,
                       length(metin)-form2.bul(metin,'>')));
      end;
     5:
      begin
          sag:=trim(form2.mid(metin,1,form2.bul(metin,'<')-1));
          sol:=trim(form2.mid(metin,form2.bul(metin,'<')+2,
                       length(metin)-form2.bul(metin,'<')));
      end;
     6:
      begin
          sag:=trim(form2.mid(metin,1,form2.bul(metin,'<')-1));
          sol:=trim(form2.mid(metin,form2.bul(metin,'<')+1,
                       length(metin)-form2.bul(metin,'<')));
      end;
     end;

      Form2.icHesaplama(sag);
      Form2.icHesaplama(sol);
     result:=false;

     hata1:=0;hata2:=0;
     val(sag,ara1,hata1);
     val(sol,ara2,hata2);

     if (hata1=0)and(hata2=0) then   //sayýsal karþýlaþtýrma
     case isaret of
     1: if(ara1= ara2) then result:=true;
     2: if(ara1<=ara2) then result:=true;
     3: if(ara1>=ara2) then result:=true;
     4: if(ara1> ara2) then result:=true;
     5: if(ara1<>ara2) then result:=true;
     6: if(ara1< ara2) then result:=true;
     end
     else                    //metin karþýlaþtýrma
     case isaret of
     1: if((sag)= (sol)) then result:=true;
     2: if((sag)<=(sol)) then result:=true;
     3: if((sag)>=(sol)) then result:=true;
     4: if((sag)> (sol)) then result:=true;
     5: if((sag)<>(sol)) then result:=true;
     6: if((sag)< (sol)) then result:=true;
     end;
                        //boolean karþýlaþtýrma
     if (lowercase(form2.komutlistesi('Evet'))=lowercase(sol))or
        (lowercase(form2.komutlistesi('Hayir'))=lowercase(sol))or
        (lowercase(form2.komutlistesi('Evet'))=lowercase(sag))or
        (lowercase(form2.komutlistesi('Hayir'))=lowercase(sag)) then
     case isaret of
     1: if(lowercase(sag)= lowercase(sol)) then result:=true;
     5: if(lowercase(sag)<>lowercase(sol)) then result:=true;
     end;

  end
  else result:=false;
end;

function TForm2.icHesaplama (var metin: string):boolean;
 function removeSpace(met:string):string;
  var i:integer;
      ara:string;
      tirnak:boolean;
 begin
  ara:='';
  tirnak:=false;
    for i:=1 to length(met) do begin
     if metin[i]='"' then tirnak:=not(tirnak);
     if tirnak=false then begin
      if not(metin[i] in [' ']) then ara:=ara+met[i];
      end
     else
     ara:=ara+met[i];
    end;
  result:=ara;
 end;

var
    gecicisag:string;
    ilksag,sonsag:string;
    islemTuru:char;
    i:integer;
    tirnak:boolean;
    araBool:boolean;
begin
result:=false;
if metin='' then exit;
if length(metin)=0 then exit;
gecicisag:=removeSpace(metin);
islemTuru:=' ';
tirnak:=false;
for i:=length(gecicisag) downto 1 do
 begin
  if (gecicisag[i] = '"') then tirnak:=not(tirnak);
  if (gecicisag[i] = '-')
      and                
     (gecicisag[i-1] in ['+', '-', '*', '\', '/', '%', '^', '&','(', '@', '~'])
      then continue;
  if (gecicisag[i] = '-')
      and                //eðer ilk karakter - ise; ( a=-1*9 ) gibi
     (i-1=0)
      then continue;
  if (tirnak=false)and (gecicisag[i] in ['+', '-', '*', '\', '/', '%', '^', '&', '@', '~']) then
    begin
     islemTuru:=gecicisag[i];break;
    end;
 end;
    if  islemTuru='+' then
         begin
          ilksag:=trim(form2.mid(gecicisag,geriBul(gecicisag,'+',length(gecicisag))+1,
                         length(gecicisag)-geribul(gecicisag,'+',length(gecicisag)))
                       );

          sonsag:=trim(form2.mid(gecicisag,1,
                         geribul(gecicisag,'+',length(gecicisag))-1)
                       );

          icHesaplama(ilksag);
          icHesaplama(sonsag);
          metin:=ara_atamaSol(sonsag,ilksag,'+');
          result:=true;
         end else
    if  islemTuru='-' then
         begin

  if (gecicisag[geriBul(gecicisag,'-',length(gecicisag))-1] in ['+', '-', '*', '\', '/', '%', '^', '&','(', '@', '~'])  then
            ilksag:=trim(form2.mid(gecicisag,geriBul(gecicisag,'-',length(gecicisag)),
                         length(gecicisag)-geribul(gecicisag,'-',length(gecicisag))+1)        )
      else  ilksag:=trim(form2.mid(gecicisag,geriBul(gecicisag,'-',length(gecicisag))+1,
                         length(gecicisag)-geribul(gecicisag,'-',length(gecicisag)))        );

          sonsag:=trim(form2.mid(gecicisag,1,
                         geribul(gecicisag,'-',length(gecicisag))-1)
                       );
          icHesaplama(ilksag);
          icHesaplama(sonsag);
          metin:=ara_atamaSol(sonsag,ilksag,'-');
          result:=true;
         end else
    if  islemTuru='*' then
         begin
          ilksag:=trim(form2.mid(gecicisag,geriBul(gecicisag,'*',length(gecicisag))+1,
                         length(gecicisag)-geribul(gecicisag,'*',length(gecicisag)))
                       );

          sonsag:=trim(form2.mid(gecicisag,1,
                         geribul(gecicisag,'*',length(gecicisag))-1)
                       );
          icHesaplama(ilksag);
          icHesaplama(sonsag);
          metin:=ara_atamaSol(sonsag,ilksag,'*');
          result:=true;
         end else
    if  islemTuru='/' then
         begin
          ilksag:=trim(form2.mid(gecicisag,geriBul(gecicisag,'/',length(gecicisag))+1,
                         length(gecicisag)-geribul(gecicisag,'/',length(gecicisag)))
                       );

          sonsag:=trim(form2.mid(gecicisag,1,
                         geribul(gecicisag,'/',length(gecicisag))-1)
                       );
          icHesaplama(ilksag);
          icHesaplama(sonsag);
          if trim(sonsag)<>'0' then //Division by zero
          metin:=ara_atamaSol(sonsag,ilksag,'/')
          else metin:='0';
          result:=true;
         end else
    if  islemTuru='^' then
         begin
          ilksag:=trim(form2.mid(gecicisag,geriBul(gecicisag,'^',length(gecicisag))+1,
                         length(gecicisag)-geribul(gecicisag,'^',length(gecicisag)))
                       );

          sonsag:=trim(form2.mid(gecicisag,1,
                         geribul(gecicisag,'^',length(gecicisag))-1)
                       );
          icHesaplama(ilksag);
          icHesaplama(sonsag);
          metin:=ara_atamaSol(sonsag,ilksag,'^');
          result:=true;
         end else
    if  islemTuru='\' then
         begin
          ilksag:=trim(form2.mid(gecicisag,geriBul(gecicisag,'\',length(gecicisag))+1,
                         length(gecicisag)-geribul(gecicisag,'\',length(gecicisag)))
                       );

          sonsag:=trim(form2.mid(gecicisag,1,
                         geribul(gecicisag,'\',length(gecicisag))-1)
                       );
          icHesaplama(ilksag);
          icHesaplama(sonsag);
          metin:=ara_atamaSol(sonsag,ilksag,'\');
          result:=true;
         end else
    if  islemTuru='%' then
         begin
          ilksag:=trim(form2.mid(gecicisag,geriBul(gecicisag,'%',length(gecicisag))+1,
                         length(gecicisag)-geribul(gecicisag,'%',length(gecicisag)))
                       );

          sonsag:=trim(form2.mid(gecicisag,1,
                         geribul(gecicisag,'%',length(gecicisag))-1)
                       );
          icHesaplama(ilksag);
          icHesaplama(sonsag);
          metin:=ara_atamaSol(sonsag,ilksag,'%');
          result:=true;
         end else
    if  islemTuru='@' then
         begin
          ilksag:=trim(form2.mid(gecicisag,geriBul(gecicisag,'@',length(gecicisag))+1,
                         length(gecicisag)-geribul(gecicisag,'@',length(gecicisag)))
                       );

          sonsag:=trim(form2.mid(gecicisag,1,
                         geribul(gecicisag,'@',length(gecicisag))-1)
                       );
          if isaretiVarMi(ilksag) then
            begin
               araBool:=isaret_Bul(ilksag);                //eðer <>= varsa sonucu bul
               if araBool then ilksag:='1' else ilksag:='0';
            end
            else
            begin
               icHesaplama(ilksag);
               if strtoint(ilksag)<>0 then ilksag:='1' else ilksag:='0';
            end;

          if isaretiVarMi(sonsag) then
            begin
            araBool:=isaret_Bul(sonsag);                //eðer <>= varsa sonucu bul
            if araBool then sonsag:='1' else sonsag:='0';
            end
            else
            begin
               icHesaplama(sonsag);
               if strtoint(sonsag)<>0 then sonsag:='1' else sonsag:='0';
            end;

          metin:=ara_atamaSol(sonsag,ilksag,'@');
          result:=true;
         end else
    if  islemTuru='~' then
         begin
          ilksag:=trim(form2.mid(gecicisag,geriBul(gecicisag,'~',length(gecicisag))+1,
                         length(gecicisag)-geribul(gecicisag,'~',length(gecicisag)))
                       );

          sonsag:=trim(form2.mid(gecicisag,1,
                         geribul(gecicisag,'~',length(gecicisag))-1)
                       );
          if isaretiVarMi(ilksag) then
            begin
               araBool:=isaret_Bul(ilksag);                //eðer <>= varsa sonucu bul
               if araBool then ilksag:='1' else ilksag:='0';
            end
            else
            begin
               icHesaplama(ilksag);
               if strtoint(ilksag)<>0 then ilksag:='1' else ilksag:='0';
            end;

          if isaretiVarMi(sonsag) then
            begin
            araBool:=isaret_Bul(sonsag);                //eðer <>= varsa sonucu bul
            if araBool then sonsag:='1' else sonsag:='0';
            end
            else
            begin
               icHesaplama(sonsag);
               if strtoint(sonsag)<>0 then sonsag:='1' else sonsag:='0';
            end;

          metin:=ara_atamaSol(sonsag,ilksag,'~');
          result:=true;
         end else
    if  islemTuru='&' then
         begin
          ilksag:=trim(form2.mid(gecicisag,geriBul(gecicisag,'&',length(gecicisag))+1,
                         length(gecicisag)-geribul(gecicisag,'&',length(gecicisag)))
                       );

          sonsag:=trim(form2.mid(gecicisag,1,
                         geribul(gecicisag,'&',length(gecicisag))-1)
                       );
          icHesaplama(ilksag);
          icHesaplama(sonsag);
          metin:='"'+sonsag+ilksag+'"';
          result:=true;
         end
   else begin //iþlem yoksa

          if isaretiVarMi(metin) then
          begin
            araBool:=isaret_Bul(metin);                //eðer <>= varsa sonucu bul
            if araBool then metin:='1' else metin:='0';
          end else  //normal nesne imiþ o zaman
          ara_atamaSag(metin);
   end;
end;

function TForm2.icHesaplamaMetin (var metin: string):boolean;
var
    gecicisag:string;
    ilksag,sonsag:string;
begin
result:=false;
if length(metin)=0 then exit;
gecicisag:=metin;
if form2.bul(gecicisag,'&')<>0 then begin
          ilksag:=trim(form2.mid(gecicisag,geriBul(gecicisag,'&',length(gecicisag))+1,
                         length(gecicisag)-geribul(gecicisag,'&',length(gecicisag)))
                       );

          sonsag:=trim(form2.mid(gecicisag,1,
                         geribul(gecicisag,'&',length(gecicisag))-1)
                       );

          icHesaplamaMetin(ilksag);
          if sonsag[length(sonsag)]='(' then
           begin
            form2.icHesaplama(sonsag);
            sonsag:='"'+sonsag+'"';
           end
            else icHesaplamaMetin(sonsag);
          gecicisag:= sonsag+ilksag;
          metin:=gecicisag;
          result:=true;
end
else begin
          ara_atamaSagMetin(metin);
          result:=true;
end;
end;

function Tform2.CallFunction(fun: string; var R: string): Boolean;
var a:char;
   ProcName:string;
   Args:TStrings;
   ara1,ara2,ara3:string;
label SON;
begin
   Result:=False;
   fun:=lowercase(fun);
   Args:=TStringList.Create;

   try
     GetArguments(Args,R,ProcName);
      (*  BOOLEAN FUNCTIONS *)
      if (fun = 'not')   then
      begin
       icHesaplama(R);
       if lowercase(cifttirnak(R))=lowercase(form2.komutlistesi('Evet')) then R:=form2.komutlistesi('Hayir') else
       if lowercase(cifttirnak(R))=lowercase(form2.komutlistesi('Hayir')) then R:=form2.komutlistesi('Evet');
       R:='"'+(R)+'"';
       result:=true;
       goto SON;
      end;
      (*  BITWISE FUNCTIONS *)
      if (fun = 'and') and (Args.Count = 2) then
      begin                  //and(5,3) ==> 101*011=001
         Result:=true;
         ara1:=Args.Strings[0];
         ara2:=Args.Strings[1];
         ichesaplama(ara1);
         ichesaplama(ara2);
         R:=inttostr(strtoint(ara1) and strtoint(ara2));
       goto SON;
      end;
      if (fun = 'or') and (Args.Count = 2) then
      begin                  //or(5,3) ==> 101+011=111
         Result:=true;
         ara1:=Args.Strings[0];
         ara2:=Args.Strings[1];
         ichesaplama(ara1);
         ichesaplama(ara2);
         R:=inttostr(strtoint(ara1) or strtoint(ara2));
       goto SON;
      end;
      if (fun = 'xor') and (Args.Count = 2) then
      begin                  //xor(5,3) ==> 101+011=101
         Result:=true;
         ara1:=Args.Strings[0];
         ara2:=Args.Strings[1];
         ichesaplama(ara1);
         ichesaplama(ara2);
         R:=inttostr(strtoint(ara1) xor strtoint(ara2));
       goto SON;
      end;
      if (fun = 'shr') and (Args.Count = 2) then
      begin                  //shr(5,2) ==> 101 => 001
         Result:=true;
         ara1:=Args.Strings[0];
         ara2:=Args.Strings[1];
         ichesaplama(ara1);
         ichesaplama(ara2);
         R:=inttostr(strtoint(ara1) shr strtoint(ara2));
       goto SON;
      end;
      if (fun = 'shl') and (Args.Count = 2) then
      begin                  //shl(5,2) ==> 101 => 10100
         Result:=true;
         ara1:=Args.Strings[0];
         ara2:=Args.Strings[1];
         ichesaplama(ara1);
         ichesaplama(ara2);
         R:=inttostr(strtoint(ara1) shl strtoint(ara2));
       goto SON;
      end;
      (* STRING FUNCTIONS *)
      if (fun = 'len')   then
      begin
         ichesaplama(R);
         R:=inttostr(Length(cifttirnak(R)));
         result:=true;
       goto SON;
      end;
      if (fun = 'upper')   then
      begin
         ichesaplama(R);
         R:=('"'+uppercase(R)+'"');result:=true;
       goto SON;
      end;
      if (fun = 'lower')   then
      begin
         ichesaplama(R);
         R:=('"'+lowercase(R)+'"');result:=true;
       goto SON;
      end;
      if (fun = 'chr')   then
      begin
         ichesaplama(R);
         a:=chr(StrToInt(R));
         r:='"'+(a)+'"';
         result:=true;
       goto SON;
      end;
      if (fun = 'asc')   then
      begin
         ichesaplama(R);
         R:=inttostr(ord(R[1]));
         result:=true;
       goto SON;
      end;
      if (fun = 'pos') and (Args.Count = 2) then
      begin                  //pos("x","sssxsss") ==> 4
         Result:=true;
         ara1:=Args.Strings[0];
         ara2:=Args.Strings[1];
         ichesaplama(ara1);
         ichesaplama(ara2);
         R:=inttostr(Pos(ara1,ara2));
       goto SON;
      end;
      if (fun = 'mid') and (Args.Count = 3) then
      begin                  //mid("Ahmet",2,3) ==> hme
         Result:=true;
         ara1:=Args.Strings[0];
         ara2:=Args.Strings[1];
         ara3:=Args.Strings[2];
         ichesaplama(ara1);
         ichesaplama(ara2);
         ichesaplama(ara3);
         R:='"' + Copy(ara1,StrToInt(ara2),StrToInt(ara3)) + '"';
       goto SON;
      end;
      if (fun = 'delete') and (Args.Count = 3) then
      begin                  //delete("Ahmet",2,3) ==> At
         Result:=true;
         ara1:=Args.Strings[0];
         ara2:=Args.Strings[1];
         ara3:=Args.Strings[2];
         ichesaplama(ara1);
         ichesaplama(ara2);
         ichesaplama(ara3);
         delete(ara1,StrToInt(ara2),StrToInt(ara3));
         R:='"' + ara1 + '"';
       goto SON;
      end;
      (*  EXTRA FUNCTIONS *)
      if (fun = 'random')   then
      begin
         Result:=true;
         ichesaplama(R);
         R:=inttostr(Random(StrToInt(R)));
       goto SON;
      end;
      if (fun = 'inport')   then
      begin
         ichesaplama(R);
         R:=inttostr(zlioportread(StrToInt(R),0));
         result:=true;
       goto SON;
      end;
      (* MATH FUNCTIONS *)
      if (fun = 'sin')   then
      begin
         Result:=true;
         ichesaplama(R);
         R:=floattostr(sin(StrTofloat(R)/180*pi));
       goto SON;
      end;
      if (fun = 'cos')   then
      begin
         Result:=true;
         ichesaplama(R);
         R:=floattostr(cos(StrTofloat(R)/180*pi));
       goto SON;
      end;
      if (fun = 'int')   then
      begin
         Result:=true;
         ichesaplama(R);
         R:=floattostr(int(StrTofloat(R)));
       goto SON;
      end;
     (* DATE/TIME FUNCTIONS *)
      if (fun = 'time')  then
      begin
         Result:=True;
         ichesaplama(R);
         R:='"' + TimeToStr(Time) + '"';
       goto SON;
      end;
      if (fun = 'date') then
      begin
         Result:=True;
         ichesaplama(R);
         R:='"' + DateToStr(Date) + '"';
      end;
SON:
  finally
   Args.Free;
  end;
end;

function atama(satir:string):string;  //yani a=2+b dugme1.baslik=a gibi iþlemler
var gecici1,gecici2,p,o:integer;
    gecicistr,gecicisag,sil,nesneadi1,nesneturu1:string;
    soltaraf:string;
    s,name:string;
    inp1,inp2:string;
begin
    gecicistr:=trim(lowercase(form2.mid(satir,1, form2.bul(satir,'=')-1)));
    //sol taraf koparýldý
    gecicisag:=trim(form2.mid(satir,form2.bul(satir,'=')+1,length(satir)-form2.bul(satir,'=')));
    //sað taraf koparýlýyor sonra da yorumlanýyor

   inp1:=lowercase(form2.mid(gecicisag,1,length(form2.komutlistesi('verigir'))));
   inp2:=lowercase(form2.komutlistesi('verigir'));
  if inp1=inp2 then
  //basit veri giriþ kutusu, baþlýðý da projenin adý oluyor     a=verigir Adýnýz nedir?
  begin
   sil:= inputBox(pchar(proje),cifttirnak(trim(form2.mid(gecicisag,length(form2.komutlistesi('verigir'))+1,
                 length(gecicisag)-length(form2.komutlistesi('verigir'))))),'<>');
   if sil <> '<>' then
     gecicisag:='"'+sil+'"'
   else
    begin
    gecicisag:='';
    result:='';
    exit; //Cancel veya boþ giriþde çýkýþ
    end;
  end;

  p:=Pos(')',gecicisag);
   while (p > 0) do
   begin
      o:=geriBul(gecicisag,'(',p);
      if (o = 0) then Exit;
      S:=Copy(gecicisag,o + 1,(p - o) - 1);
      if (o > 1) and (not(gecicisag[o - 1] in ['+', '-', '*', '\', '/', '%', '^', '&','(',')',' ','@','~','<','>','='])) then
      begin
         Dec(o);
         Name:=''; //fonksiyon adý ayýklanýr
         repeat
            Name:=gecicisag[o] + Name;
            Dec(o);
         until (o < 1) or (gecicisag[o] in ['+', '-', '*', '\', '/', '%', '^', '&', '(', ')', ',', ' ','@','~','<','>','=']);
         if (not(Form2.CallFunction(lowercase(Name), s ))) then Exit;
         if (o > 0) then Inc(o);
      end
      else
      begin
         if (not(Form2.icHesaplama(s))) then Exit;
      end;
      gecicisag:=Copy(gecicisag,1,o - 1) + string(s) + Copy(gecicisag,p + 1,MaxInt);
      p:=Pos(')',gecicisag);
   end;

   if  ((form2.bul(gecicisag,'+')<>0)or(form2.bul(gecicisag,'-')<>0)or
       (form2.bul(gecicisag,'*')<>0)or(form2.bul(gecicisag,'/')<>0)or
       (form2.bul(gecicisag,'@')<>0)or(form2.bul(gecicisag,'~')<>0)or
       (form2.bul(gecicisag,'^')<>0)or(form2.bul(gecicisag,'\')<>0)or    //üs ve div
       (form2.bul(gecicisag,'&')<>0)or(form2.bul(gecicisag,'%')<>0))     //metin birleþtir ve mod
 //      and(gecicisag[1]<>'"')
       then
   begin
    Form2.icHesaplama(gecicisag);
   end

   else

    if (strpos(pchar(gecicisag),'.')<> nil)and(gecicisag[1]<>'"') then
    //. varsa SAÐ tarafta nesne var demektir
    begin
       nesneadi1:=form2.mid(gecicisag,1,form2.bul(gecicisag,'.')-1);
       nesneturu1:='';
       gecici1:=form2.bul(gecicisag,'.');
       gecici2:=length(gecicisag);
       nesneturu1:=form2.mid(gecicisag,gecici1+1,gecici2-gecici1);
       gecicisag:='"'+form2.NesneOzelligiBul(lowercase(nesneadi1),lowercase(nesneturu1))+'"';
    end;

     if strpos(pchar(gecicistr),'.')= nil then
    //. yoksa SOL tarafta deðiþken veya sabit deðer var..
      begin
       if deger(gecicisag)<>'' then   //a=degisken
       soltaraf:=deger(gecicisag)
       else
          begin           //a="deðer" veya a=ilkkezTanýmlanandegisken
//          if (form2.bul(gecicisag,'"')=0) then degisken(gecicisag,'0') else  
             soltaraf:=cifttirnak(gecicisag);
          end;
       if gecicistr<>'' then
       degisken(gecicistr,soltaraf);  //sol taraf listview1'e itilir/oradan alýnýr
      end else
    //. varsa SOL tarafta nesne var demektir
      begin
       nesneadi1:=form2.mid(gecicistr,1,form2.bul(gecicistr,'.')-1);
       nesneturu1:='';
       gecici1:=form2.bul(gecicistr,'.')+1;
       gecici2:=length(gecicistr)-gecici1+1;
       nesneturu1:=form2.mid(gecicistr,gecici1,gecici2);
       form2.NesneOzelligineAtama(nesneadi1,nesneturu1,gecicisag);
      end ;
    result:='';
end;

procedure yapCanvas(metin:string);
Type
  Noktalar = Array Of TPoint;
var
   ProcName:string;
   Args:TStrings;
   ara1,ara2,ara3,ara4,ara5,ara6,ara7:string;
   polyPoint:   Noktalar;
   i,j:integer;ara:string;
begin
     Args:=TStringList.Create;
      try
       GetArguments(Args,metin,ProcName);
       ara1:=lowercase(Args.Strings[0]);
       form1.canvas.pen.mode:= pmCopy;
       form1.canvas.Brush.Style:=bsSolid;
       form1.canvas.Pen.Style:=psSolid;
       if (ara1=lowercase(form2.komutlistesi('poligon')))and(args.Count>=4) then begin
         //canvas polyline, x1, y1, x2, y2, x3, y3, x4, y4, penColor
         //canvas polyline, 100, 40, 120, 10, 140, 50, 50, 50, 123123123
         i:=0;j:=1;
         SetLength(polyPoint, (args.count div 2)-1);
         while j<=args.Count-2 do
         begin
                 ara:=Args.Strings[j];
                 form2.ichesaplama(ara);
                 polyPoint[i].X:=strtoint(ara);
                 ara:=Args.Strings[j+1];
                 form2.ichesaplama(ara);
                 polyPoint[i].y:=strtoint(ara);
                 inc(i);
                 j:=j+2;
         end;
          ara:=Args.Strings[args.count-1];
          form2.ichesaplama(ara);
          form1.Canvas.pen.Color:=strtoint(ara);
          form1.Canvas.Polyline(polyPoint);
          end else
       if (ara1=lowercase(form2.komutlistesi('metin')))and(args.Count=5) then begin
         //canvas text, x1, y1, textVar, color
         //canvas text, 100, 40, "alooo" , 100100
         ara2:=(Args.Strings[1]);
         ara3:=(Args.Strings[2]);
         ara4:=(Args.Strings[3]);
         ara5:=(Args.Strings[4]);
         form2.ichesaplama(ara2);
         form2.ichesaplama(ara3);
         form2.ichesaplama(ara4);
         form2.ichesaplama(ara5);
          form1.Canvas.pen.Style:=psClear;
          form1.Canvas.Brush.Style:=bsClear;
          form1.Canvas.font.Color:=strtoint(ara5);
          form1.Canvas.TextOut(strtoint(ara2),strtoint(ara3),ara4);
          form1.Brush.Style:=bsSolid;  //form gridini korumak için
          end else
       if (ara1=lowercase(form2.komutlistesi('nokta')))and(args.Count=4) then begin
         //canvas point, x1, y1, color
         //canvas point, 10, 20, 256256
         ara2:=(Args.Strings[1]);
         ara3:=(Args.Strings[2]);
         ara4:=(Args.Strings[3]);
         form2.ichesaplama(ara2);
         form2.ichesaplama(ara3);
         form2.ichesaplama(ara4);
         form1.Canvas.Pixels[strtoint(ara2),strtoint(ara3)]:=strtoint(ara4);
          end else
       if (ara1=lowercase(form2.komutlistesi('cizgi')))and(args.Count=6) then begin
         //canvas line, x1, y1, x2, y2, color
         //canvas line, 10, 10, 100, 100 , 120120
         ara2:=(Args.Strings[1]);
         ara3:=(Args.Strings[2]);
         ara4:=(Args.Strings[3]);
         ara5:=(Args.Strings[4]);
         ara6:=(Args.Strings[5]);
         form2.ichesaplama(ara2);
         form2.ichesaplama(ara3);
         form2.ichesaplama(ara4);
         form2.ichesaplama(ara5);
         form2.ichesaplama(ara6);
          form1.Canvas.pen.Color:=strtoint(ara6);
          form1.Canvas.moveTo(strtoint(ara2),strtoint(ara3));
          form1.Canvas.LineTo(strtoint(ara4),strtoint(ara5));
          end else
       if (ara1=lowercase(form2.komutlistesi('daire')))and(args.Count=7) then begin
         //canvas circle, x1, y1, x2, y2, penColor, brushColor
         //canvas circle, 10, 10, 100, 100, 100200300, 200200200
         ara2:=(Args.Strings[1]);
         ara3:=(Args.Strings[2]);
         ara4:=(Args.Strings[3]);
         ara5:=(Args.Strings[4]);
         ara6:=(Args.Strings[5]);
         ara7:=(Args.Strings[6]);
         form2.ichesaplama(ara2);
         form2.ichesaplama(ara3);
         form2.ichesaplama(ara4);
         form2.ichesaplama(ara5);
         form2.ichesaplama(ara6);
         form2.ichesaplama(ara7);
          form1.Canvas.pen.Color:=strtoint(ara6);
          form1.Canvas.brush.Color:=strtoint(ara7);
          form1.Canvas.Ellipse(strtoint(ara2),strtoint(ara3),strtoint(ara4),strtoint(ara5));
          end else
       if (ara1=lowercase(form2.komutlistesi('dikdortgen')))and(args.Count=7) then begin
         //canvas rectangle, x1, y1, x2, y2, penColor, brushColor
         //canvas rectangle, 10, 10, 100, 100, 100200300, 200200200
         ara2:=(Args.Strings[1]);
         ara3:=(Args.Strings[2]);
         ara4:=(Args.Strings[3]);
         ara5:=(Args.Strings[4]);
         ara6:=(Args.Strings[5]);
         ara7:=(Args.Strings[6]);
         form2.ichesaplama(ara2);
         form2.ichesaplama(ara3);
         form2.ichesaplama(ara4);
         form2.ichesaplama(ara5);
         form2.ichesaplama(ara6);
         form2.ichesaplama(ara7);
          form1.Canvas.pen.Color:=strtoint(ara6);
          form1.Canvas.brush.Color:=strtoint(ara7);
          form1.Canvas.Rectangle(strtoint(ara2),strtoint(ara3),strtoint(ara4),strtoint(ara5));
          end;
      finally
      Args.Free;
      end;
end;

procedure veritabaniHareketi(metin:string);
var TabloAdi,komut:string;
begin
 TabloAdi:=lowercase(form2.mid(metin,1,form2.bul(metin,' ')-1));
 komut:=trim(lowercase(form2.mid(metin,form2.bul(metin,' ')+1,length(metin)-form2.bul(metin,' '))));

 if Form1.FindComponent(TabloAdi+'Gercek') is TClientDataSet then begin
     if (Form1.FindComponent(TabloAdi+'Gercek') as TClientDataSet).Active=false then exit;

     if komut=lowercase(form2.komutlistesi('ilkKayit')) then
        (Form1.FindComponent(TabloAdi+'Gercek') as TClientDataSet).First else
     if komut=lowercase(form2.komutlistesi('onceki')) then
        (Form1.FindComponent(TabloAdi+'Gercek') as TClientDataSet).Prior else
     if komut=lowercase(form2.komutlistesi('sonKayit')) then
        (Form1.FindComponent(TabloAdi+'Gercek') as TClientDataSet).last else
     if komut=lowercase(form2.komutlistesi('sonraki')) then
        (Form1.FindComponent(TabloAdi+'Gercek') as TClientDataSet).next else
     if komut=lowercase(form2.komutlistesi('sil')) then
        (Form1.FindComponent(TabloAdi+'Gercek') as TClientDataSet).Delete else
     if komut=lowercase(form2.komutlistesi('kaydet')) then
        (Form1.FindComponent(TabloAdi+'Gercek') as TClientDataSet).post else
     if komut=lowercase(form2.komutlistesi('ekle')) then
        (Form1.FindComponent(TabloAdi+'Gercek') as TClientDataSet).insert else
     if komut=lowercase(form2.komutlistesi('kayit')) then
        (Form1.FindComponent(TabloAdi+'Gercek') as TClientDataSet).edit else
     if form2.mid(komut,1,length(form2.komutlistesi('ara')))=lowercase(form2.komutlistesi('ara')) then begin
      delete(komut,1,length(form2.komutlistesi('ara')));
      komut:=trim(komut);
      form2.icHesaplamaMetin(komut);
      komut:=cifttirnak(komut);
         if trim(komut)<>'' then
          begin
       (Form1.FindComponent(TabloAdi+'Gercek') as TClientDataSet).Filter:=trim(komut);
       (Form1.FindComponent(TabloAdi+'Gercek') as TClientDataSet).Filtered:=true;
          end
          else
          begin
       (Form1.FindComponent(TabloAdi+'Gercek') as TClientDataSet).Filtered:=false;
          end;
      end else
     if form2.mid(komut,1,length(form2.komutlistesi('kaydagit')))=lowercase(form2.komutlistesi('kaydagit')) then begin
      delete(komut,1,length(form2.komutlistesi('kaydagit')));
      komut:=trim(komut);
      form2.icHesaplama(komut);
      komut:=cifttirnak(komut);
         if trim(komut)<>'' then
          (Form1.FindComponent(TabloAdi+'Gercek') as TClientDataSet).MoveBy(strtoint(komut));
      end;

 end;
end;

procedure donder(satir:string;satno:integer);
var
   ProcName:string;
   Args:TStrings;
   ara,ara_1,ara1,ara2,ara3:string;
   k,kk,forsayisi:integer;
   exist:boolean;
   line:string;
begin
     Args:=TStringList.Create;
     GetArguments(Args,trim(satir),ProcName);
 if (args.Count=3) then begin                   //"s = 20, 100, 5" yani 20'den 100'e kadar 5 artým
     ara1:=(Args.Strings[0]); //þart kýsmý
     ara2:=(Args.Strings[1]); //bitiþ deðeri
     ara3:=(Args.Strings[2]); //artim deðeri

     ara_1:=trim(form2.mid(ara1,1,form2.bul(ara1,'=')-1));
     ara:=trim(form2.mid(ara1,form2.bul(ara1,'=')+1,length(ara1)-form2.bul(ara1,'=')));
     Form2.ichesaplama(Ara);

     degisken(ara_1,ara); //þart degiskeni oluþturulur

//     kk:=0;
     exist:=false;
   if Length(fordegisken)<>0 then begin
     for k:=0 to length(fordegisken)-1 do
      if forDegisken[k].ad=trim(form2.mid(ara1,1,form2.bul(ara1,'=')-1)) then begin
        exist:=true;
        break;
        end;
      if not(exist) then  SetLength(fordegisken,length(fordegisken)+1);
   end
   else
       SetLength(fordegisken,1);

     if not(exist) then kk:=length(fordegisken)-1 else kk:=k;

     forDegisken[kk].ad:=ara_1;
     forDegisken[kk].degeri:=strtoint(ara);
     Form2.ichesaplama(Ara2);
     forDegisken[kk].bitis_degeri:=strtoint(ara2);
     Form2.ichesaplama(Ara3);
     forDegisken[kk].artim:=strtoint(ara3);
     forDegisken[kk].ilk_satir:=satno;

     forsayisi:=0;//ileri doðru arama yaparken, iç kýsýmda kaç adet for yapýlmýþ?
  if form5.RichEdit1.Lines.Count<>0 then
    for k:=(satno+1) to form5.RichEdit1.Lines.Count do //ileri doðru uygun "DonderBitti" aramasý
     begin
     line:=trim(form5.RichEdit1.Lines[k]);
      if (lowercase(line)=lowercase(form2.komutlistesi('Donderbitti')))and(forsayisi=0)  then
        break;

      if (lowercase(form2.mid(line,1,length(form2.komutlistesi('Donder')+' ')))=lowercase(form2.komutlistesi('Donder')+' '))
        then inc(forsayisi);
      if (lowercase(line)=lowercase(form2.komutlistesi('Donderbitti'))) then dec(forsayisi);
     end;  //for
     forDegisken[kk].son_satir:=k;

 end;
end;

procedure PortCikisYap(satir:string);
type
  TIOData = record
  Port,DataType,Data:dword;
  end;
var
   ProcName:string;
   Args:TStrings;
   ara1,ara2:string;
begin
     Args:=TStringList.Create;
     GetArguments(Args,trim(satir),ProcName);
 if (args.Count=2) then begin
     ara1:=(Args.Strings[0]); //port adresi
     ara2:=(Args.Strings[1]); //1 Byte deðer
     Form2.ichesaplama(Ara1);
     Form2.ichesaplama(Ara2);
     zlioportwrite(strtoint(ara1),0,strtoint(ara2));
   //  PortOut(strtoint(ara1),strtoint(ara2));
 end;
end;

procedure yapEEger(satir:string);     //EEger a=1, mesaj "dogru", mesaj "yanlýþ"
var
   ProcName:string;
   Args:TStrings;
   ara1,ara2,ara3:string;
begin
 with form2 do begin
     delete (satir,1,length(komutlistesi('EEger')));
     Args:=TStringList.Create;
     GetArguments(Args,trim(satir),ProcName);
   if (args.Count=3) then begin
     ara1:=(Args.Strings[0]); //þart kýsmý
     ara2:=(Args.Strings[1]); //Dogru ise
     ara3:=(Args.Strings[2]); //Yanlis ise
     ichesaplama(ara1);
     if (ara1)<>'0' then
      tekKomutCalistir(ara2)
      else
      tekKomutCalistir(ara3);
   end;
 end;
end;

function Tform2.tekKomutCalistir(satir:string):boolean; //iif/komut için bunu yapýyoruz
var
    i,k,gecici:integer;muzikFile:string;
    gecicistr,soltaraf:string;
    gecicisol,gecicisag:string;islem:char;duzeltilmis:string;
    Flag: Cardinal;
    nesneadi,nesneturu:string;gecici1,gecici2:integer;
    islemturu:shortint;
    tabloadi:string;
    bip1:string;bip2:integer;
begin
result:=false;
  if (lowercase(satir)=lowercase(komutlistesi('bitir'))) then form1.Close else
  //3/programý bitirme (Form1 kapanýyor!)        bitir

  if (form2.ListView1.FindCaption(-1,lowercase(satir),false,false,false)<>NIL) then begin
     ListItem:=form2.ListView1.FindCaption(-1,lowercase(satir),false,false,false);
  //4/iste fonksiyon çalýþtý                     fonksiyon tanim
     form2.calistir(strtoint(ListItem.SubItems[1]),'Form');
  end else

  if (lowercase(mid(satir,1,length(komutlistesi('EEger'))))=lowercase(komutlistesi('EEger'))) then begin
  //6/EEger þart, komutDogru, komutYanlis
     yapEEger(satir);
  end else

  if (StrPos(PChar(satir), '=') <> nil) then
  //11/atama ve nesne özellikleri
   begin
    if not(satir[Pos('=',satir)-1] in  ['+', '-', '*', '/', '^', '\', '%', '&', '@', '~']) then
     ATAMA(satir)              //dugme1.baslik="deneme" veya a=2 gibi
     else begin                //a+=1 veya a^=2 gibi a=a+1, a=a^2 eþdeðeri de burada

      gecicisol:=trim(lowercase(form2.mid(satir,1, form2.bul(satir,'=')-2)));
      //sol taraf koparýldý
      gecicisag:=trim(form2.mid(satir,form2.bul(satir,'=')+1,length(satir)-form2.bul(satir,'=')));
      //sað taraf koparýldý
      islem:=satir[form2.bul(satir,'=')-1];
      duzeltilmis:=gecicisol+'='+gecicisol+islem+gecicisag;
      tekKomutCalistir(duzeltilmis);

     end;
   end else

  if (lowercase(ada_ayikla(mid(satir,1,bul(satir,' '))))=lowercase(komutlistesi('Tablo'))) then
  //12/Veritabaný kullanýmý
  begin
   veritabaniHareketi(satir);
  end
  else

  if (mid(satir,length(satir)-1,2) = '++')
    or(mid(satir,length(satir)-1,2) = '--') then
  //13/c dili benzeri artým                  a++ veya form.ust--
   begin
    if (mid(satir,length(satir)-1,2) = '++') then
       islemturu:=1 else islemturu:=-1;
       delete(satir,length(satir)-1,2); //++'dan kurtulalým
    if strpos(pchar(satir),'.')<> nil then
    //. varsa nesne var demektir
    begin
       nesneadi:=mid(satir,1,bul(satir,'.')-1);
       nesneturu:='';
       gecici1:=bul(satir,'.');
       gecici2:=length(satir);
       nesneturu:=mid(satir,gecici1+1,gecici2-gecici1);
       satir:=NesneOzelligiBul(lowercase(nesneadi),lowercase(nesneturu));
       NesneOzelligineAtama(nesneadi,nesneturu,inttostr(strtoint(satir)+islemturu));
    end else
    //. yoksa deðiþken var
      begin
       if deger(satir)<>'' then
       soltaraf:=deger(satir)
       else
       soltaraf:='0'; //hmm, eðer tanýmlý deðilse ne oluyor? 0 tabi
       if satir<>'' then
       degisken(satir,inttostr(strtoint(soltaraf)+islemturu));
      end;
   end else
  if (lowercase(satir)=lowercase(komutlistesi('bip'))) then beep else
  //14/basit uyarý için                            bip

  if (lowercase(mid(satir,1,length(komutlistesi('tazele')))))=lowercase(komutlistesi('tazele')) then form1.Refresh else
  //15/ekraný temizlemek,canvas iþlemleri sonrasý  refresh

  if (lowercase(mid(satir,1,length(komutlistesi('yuzey')))))=lowercase(komutlistesi('yuzey')) then
  //16/form üzerine resim çizme                     canvas (text, 1, 2, "aaaa")
   begin
     muzikFile:=trim(mid(satir,length(komutlistesi('yuzey'))+1,length(satir)-length(komutlistesi('yuzey'))));
     yapCanvas(muzikFile);
   end else

  if (lowercase(mid(satir,1,length(komutlistesi('sesCal')))))=lowercase(komutlistesi('sesCal')) then
  //17/wav dosya çalma imkaný                     playsound a.wav
   begin
     muzikFile:=trim(mid(satir,length(komutlistesi('sesCal'))+1,length(satir)-length(komutlistesi('sesCal'))));
     icHesaplamaMetin(muzikFile);
     muzikFile:=cifttirnak(muzikFile);
     StopWav;
     if FileExists(muzikFile) then
       PlayWavFile(muzikFile);
   end else

  if (lowercase(mid(satir,1,length(komutlistesi('ses'))))=lowercase(komutlistesi('ses'))) then
  //18/biraz geliþmiþ bip komutu                   ses3
   begin
     bip2:=length(satir)-length(komutlistesi('ses'));
     bip1:=trim(mid(satir,length(komutlistesi('ses'))+1,bip2));
     icHesaplamaMetin(bip1);
     gecicistr:=cifttirnak(bip1);
     gecici:=strtoint(gecicistr);
          case gecici of
            0: Flag := mb_IconAsterisk;
            1: Flag := mb_IconExclamation;
            2: Flag := mb_IconHand;
            3: Flag := mb_IconQuestion;
            4: Flag := mb_Ok;
          else
            Flag := 0;
          end;
     MessageBeep (Flag);
   end   else

  if (lowercase(mid(satir,1,length(komutlistesi('mesaj'))))=lowercase(komutlistesi('mesaj'))) then
  //19/basit mesaj kutusu, baþlýðý da projenin adý oluyor      mesaj"Dikkat!" veya mesaj a
   begin
     gecicistr:=trim(mid(satir,length(komutlistesi('mesaj'))+1,length(satir)-length(komutlistesi('mesaj'))));
     icHesaplama(gecicistr);
     gecicistr:=cifttirnak(gecicistr);
     Application.MessageBox(pchar(gecicistr),pchar(proje),MB_OK+MB_ICONINFORMATION);
   end  else

  if (lowercase(mid(satir,1,length('outport')))='outport') then
  // /portout(adres,deger)
   begin
     gecicistr:=trim(mid(satir,length('outport')+2,length(satir)-length('outport')-2));
     PortCikisYap(gecicistr);
   end  else

  if (lowercase(mid(satir,1,length(komutlistesi('calistir'))))=lowercase(komutlistesi('calistir'))) then
  //20/dýþ komut çalýþtýrýr                        calistir calc
   begin
     gecicistr:=trim(mid(satir,length(komutlistesi('calistir'))+1,length(satir)-length(komutlistesi('calistir'))));
     if deger(gecicistr)<>'' then       soltaraf:=deger(gecicistr)
     else                               soltaraf:=cifttirnak(gecicistr);
     if strpos(pchar(gecicistr),'.')<> nil then
     //. varsa nesne var demektir
     begin
       nesneadi:=form2.mid(gecicistr,1,form2.bul(gecicistr,'.')-1);
       nesneturu:='';
       gecici1:=form2.bul(gecicistr,'.');
       gecici2:=length(gecicistr);
       nesneturu:=form2.mid(gecicistr,gecici1+1,gecici2-gecici1);
       soltaraf:=NesneOzelligiBul(lowercase(nesneadi),lowercase(nesneturu));
     end;

     if soltaraf<>'' then
      winexec(pchar(''+soltaraf+''),SW_NORMAL); //bazý komutlarý kullanýcý çift týrnak içine alabilir
   end  else

  if (lowercase(mid(satir,1,length(komutlistesi('komut')+' ')))=lowercase(komutlistesi('komut')+' ')) then
  //21/iç komut çalýþtýrýr                        komut iif a=2,b=a,c=a
   begin
     delete(satir,1,length(komutlistesi('komut')));
     satir:=trim(satir);
     if satir[1]='"' then  delete(satir,1,1);
     if satir[length(satir)]='"' then  delete(satir,length(satir),1);
     if deger(satir)<>'' then
     //deðiþken ise deðerini getir
      soltaraf:=deger(satir);
     if strpos(pchar(satir),'.')<> nil then
     //. varsa nesne var demektir
     begin
       nesneadi:=form2.mid(satir,1,form2.bul(satir,'.')-1);
       nesneturu:='';
       gecici1:=form2.bul(satir,'.');
       gecici2:=length(satir);
       nesneturu:=form2.mid(satir,gecici1+1,gecici2-gecici1);
       soltaraf:=NesneOzelligiBul(lowercase(nesneadi),lowercase(nesneturu));
     end;
             if soltaraf<>'' then
             tekKomutCalistir(trim(soltaraf))
             else
             tekKomutCalistir(trim(satir));
   end
   else

  if lowercase(mid(satir,1,length('BenchmarkStart')))='benchmarkstart' then
  //22/Bir iþlem ne kadar iþlem süresi (milisaniye) geçiriyor
   begin
     hrt.StartTimer;
   end
   else

  if lowercase(mid(satir,1,length('BenchmarkEnd')))='benchmarkend' then
  //23/Bir iþlem ne kadar iþlem süresi (milisaniye) geçirdi
   begin
     form2.StatusBar1.SimpleText:='Benchmark: '+ formatfloat('#,###0.000 ms',hrt.ReadTimer);
     form5.ListBox1.Items.Add('Benchmark: '+ formatfloat('#,###0.000 ms',hrt.ReadTimer));
     hrt.Free;
   end
   else

  if (lowercase(ada_ayikla(mid(satir,1,bul(satir,' '))))=lowercase(komutlistesi('ExcelTablosu'))) then
  //24/Excel Veritabaný kullanýmý
  begin
  tabloadi:=lowercase(trim(mid(satir,bul(satir,' ')+1,length(komutlistesi('kaydet') )+1)));
   if tabloadi=lowercase(komutlistesi('kaydet')) then begin
     k:=0;
     tabloadi:=trim(mid(satir,1,bul(satir,' ')));
    for i:=0 to length(excelbook)-1 do
       if ExcelBook[i].num=strtoint(form1.no_ayikla(tabloadi)) then
        begin
         k:=i;
         break;
        end;
      ExcelBook[k].book.activeworkbook.save;
   end;
   end
   else
   result:=true; //hata oluyor...
end;

procedure tform2.calistir(satirno:integer;kim:string); //belli kod bloðu çalýþtýrýlýr
var satir,satirici:string;
    line:integer;
    j,k,derleme_satiri:integer;
    git_etiketi:string;
    ifTrue:boolean;
    ifsayisi:integer; ifarama:string;
    listitemim:Tlistitem;
    breakSarti:string;
    ara:string;

begin
     HRT := THRTimer.Create;

  if kim='Derleme' then begin
   line:=satirno;
   satirno:=satirno-1;
   end
   else
   line:=form5.RichEdit1.Lines.Count;

  derleme_satiri:=satirno;

  while (derleme_satiri<line) do
  begin                         //iþte baþlýyor...
  inc(derleme_satiri);
                                //durak noktasýna gelindi mi? çünkü Shift+F9 ile bu satýra gelinip iþlenecek...
 if form16.ListView1.FindCaption(-1,inttostr(derleme_satiri+1),false,false,false)<>NIL then begin
  ListItemim :=form16.ListView1.FindCaption(-1,inttostr(derleme_satiri+1),false,false,false);
  if length(listitemim.Caption)<>0 then begin
   breaknoktasi:=strtoint(listitemim.Caption)-2;
   breakSarti:=listitemim.SubItems.Text;
   if breakBayragi=false then   //eðer önceden aktif edilmemiþ ise þarta bak...
    if (isaret_Bul(breakSarti))or(breakSarti='-'+#$D#$A) then begin //#D#A ne diye sormayýn...
      breakBayragi:=not(breakBayragi);       //artýk gelindi...
      ToolButton21.Enabled:=breakBayragi;
      devam2.Enabled:=breakBayragi;
      break;                    //(þarta göre) iþlemlere devam etme!, sonra buradan devam edeceðiz
      end;
  end;
  end;

  TRY                           //security
                                // içinde // bulana kadarki kýsým bize lazým
  satirici:=trim(form5.RichEdit1.Lines[derleme_satiri]);
  if mid(satirici,1,1) ='''' then continue;
  //1/tek satýr açýklama için // kullanabiliriz
  satir:=trim(mid(satirici,1,pos('''',satirici)-1));
  if (satir='') then satir:=satirici;
  if (satir='') then Continue;

  if (kim = 'Form') then
   if (lowercase(satir)=lowercase(komutlistesi('bitti')))or(lowercase(satir)=lowercase(komutlistesi('son')))
    then break else
   //2/prosedür bitirme komutu                     bitti veya son
  if (lowercase(satir)=lowercase(komutlistesi('degilse'))) then
  //5/else sonrasý endif'e gidiþ yeri
     begin
    for j:=derleme_satiri+1 to form5.RichEdit1.Lines.Count do
       if (lowercase(trim(form5.RichEdit1.Lines[j]))=lowercase(form2.komutlistesi('Egerbitti'))) //endif
       then
        begin
        derleme_satiri:=j;
        break;
        end;
    end
  else

  if (lowercase(satir)=lowercase(komutlistesi('ikenbitti'))) then
  //26/önceki iken döngüsünü bul
     begin
    ifsayisi:=0;//geri doðru arama yaparken, üst kýsýmda kaç adet iken yapýlmýþ?
    for k:=derleme_satiri-1 downto 0 do
     begin
     ifarama :=trim(form5.RichEdit1.Lines[k]);
     if (lowercase(mid(ifarama,1,length(komutlistesi('iken')+' ')))=lowercase(komutlistesi('iken')+' ')) //do
          and
        (ifsayisi=0) then begin
       derleme_satiri:=k-1;
       break;
       end;

    if (lowercase(ifarama)=lowercase(form2.komutlistesi('ikenbitti')))
        then inc(ifsayisi);
    if (lowercase(form2.mid(ifarama,1,length(form2.komutlistesi('iken')+' ')))=lowercase(form2.komutlistesi('iken')+' '))
        then dec(ifsayisi);
     end;  //for

    end
  else

  if (lowercase(mid(satir,1,length(komutlistesi('Eger')+' ')))=lowercase(komutlistesi('Eger')+' '))
     and(not(satir=lowercase(komutlistesi('Egerbitti')))) then begin
  //7/eðer þart yanlýþ ise Egerbitti'nin satýrýný bul, yoksa devam...
    delete(satir,1,length(form2.komutlistesi('Eger')));
    ara:=trim(satir);
    ichesaplama(ara);
    ifTrue:=(ara)<>'0';
  if not(ifTrue) then
  begin
    ifsayisi:=0;//ileri doðru arama yaparken, iç kýsýmda kaç adet if yapýlmýþ?

    for k:=(derleme_satiri+1) to form5.RichEdit1.Lines.Count do //ileri doðru uygun "EgerBitti/Degilse" aramasý
     begin
     ifarama :=trim(form5.RichEdit1.Lines[k]);
      if ((lowercase(ifarama)=lowercase(form2.komutlistesi('Egerbitti'))) //endif
          or
         (lowercase(ifarama)=lowercase(form2.komutlistesi('degilse'))))   //else
          and
         ((ifsayisi=0)) then begin
       derleme_satiri:=k;
       break;
       end;

      if (lowercase(form2.mid(ifarama,1,length(form2.komutlistesi('Eger')+' ')))=lowercase(form2.komutlistesi('Eger')+' '))
        then inc(ifsayisi);
      if (lowercase(ifarama)=lowercase(form2.komutlistesi('Egerbitti')))
        then dec(ifsayisi);
     end;  //for
    end; //if not(...
   end else
  //Eðer                                        If

  if (lowercase(mid(satir,1,length(komutlistesi('iken')+' ')))=lowercase(komutlistesi('iken')+' '))
     and(not(satir=lowercase(komutlistesi('ikenbitti')))) then begin
  //25/eðer þart yanlýþ ise ikebBitti'nin satýrýný bul, yoksa iç kýsýma devam...
    delete(satir,1,length(form2.komutlistesi('iken')));
    ara:=trim(satir);
    ichesaplama(ara);
    ifTrue:=(ara)<>'0';
//    ifTrue:=isaret_Bul(trim(satir));
  if not(ifTrue) then
  begin
    ifsayisi:=0;//ileri doðru arama yaparken, iç kýsýmda kaç adet iken yapýlmýþ?

    for k:=(derleme_satiri+1) to form5.RichEdit1.Lines.Count do //ileri doðru uygun "ikenBitti" aramasý
     begin
     ifarama :=trim(form5.RichEdit1.Lines[k]);
      if (lowercase(ifarama)=lowercase(form2.komutlistesi('ikenbitti'))) //do
          and
         (ifsayisi=0) then begin
       derleme_satiri:=k;
       break;
       end;

      if (lowercase(form2.mid(ifarama,1,length(form2.komutlistesi('iken')+' ')))=lowercase(form2.komutlistesi('iken')+' '))
        then inc(ifsayisi);
      if (lowercase(ifarama)=lowercase(form2.komutlistesi('ikenbitti')))
        then dec(ifsayisi);
     end;  //for
    end; //if not(...
   end else
  //iken                                        iken a<5

  if (lowercase(mid(satir,1,length(komutlistesi('Git')+' ')))=lowercase(komutlistesi('Git')+' '))
   then begin
  //8/ Git Etiket
   git_etiketi:=trim(lowercase(mid(satir,bul(satir,' ')+1,length(satir)-bul(satir,' '))));
    for k:=0 to form5.RichEdit1.Lines.Count do
     begin
       if lowercase(trim(form5.RichEdit1.Lines[k]))=git_etiketi+':'  then
       begin
        derleme_satiri:=k;
        break;
       end;
     end;
   end else
  //Git                                        Goto Label

  if (lowercase(mid(satir,1,length(komutlistesi('Donder')+' ')))=lowercase(komutlistesi('Donder')+' '))
     and(not(satir=lowercase(komutlistesi('Donderbitti')))) then begin
     delete(satir,1,length(komutlistesi('Donder'))+1);
     donder(satir,derleme_satiri);
   end else
  //9/Donder                                       For

  if (lowercase(satir)=lowercase(komutlistesi('Donderbitti'))) then begin
  //10/döngü bitmemiþse üste geri git
     for k:=0 to length(fordegisken)-1 do
      if forDegisken[k].son_satir=derleme_satiri then begin
        if (forDegisken[k].degeri>forDegisken[k].bitis_degeri)and(forDegisken[k].artim<0) then
         derleme_satiri:=forDegisken[k].ilk_satir;
        if (forDegisken[k].degeri<forDegisken[k].bitis_degeri)and(forDegisken[k].artim>0) then
         derleme_satiri:=forDegisken[k].ilk_satir;
        forDegisken[k].degeri:=forDegisken[k].degeri+forDegisken[k].artim;
        degisken(forDegisken[k].ad,inttostr(forDegisken[k].degeri));
        break;
        end;
   end else
  //DonderBitti                                       For bitiþ / next

   if (satir<>'')and(tekKomutCalistir(satir)) then
   begin    //HATA

   inc(derlemehatalari);
   if rke1.Checked then ararakam:=0 else ararakam:=1000;
   for k:=0 to form5.ListBox1.Items.Count-1 do
    begin
        satir:=form5.ListBox1.Items[k];
        if form2.mid(satir,1,form2.bul(satir,':')-1)='Benchmark' then continue;
        j:=strtoint(form2.mid(satir,1,form2.bul(satir,':')-1));
        if j=derleme_satiri+1 then
         break //varsa zaten ekleme
        else begin
               if j>derleme_satiri+1 then begin
                 form5.ListBox1.Items.Insert(k,inttostr(derleme_satiri+1)+': '+loadstr(ararakam+300));
                 break;
               end;
        end;
    end;
     if (form5.ListBox1.Items.Count=0)or(form5.ListBox1.Items.Count=k) then
       begin
       form2.StatusBar1.SimpleText:=inttostr(derleme_satiri+1)+': '+loadstr(ararakam+300);
       form5.ListBox1.Items.Add(inttostr(derleme_satiri+1)+': '+loadstr(ararakam+300));
       end;
    end;

  EXCEPT
  Screen.Cursor:=crDefault;
  form2.StatusBar1.SimpleText:=Exception.ClassName+' : '+Exception.MethodName(Exception.ClassInfo);
  form2.ListBox1.Items.Add(Exception.ClassName+' : '+Exception.MethodName(Exception.ClassInfo));
  END;
  end; //while


  Screen.Cursor:=crDefault;
end;  //calistir

procedure Tform2.atom(sat:string);
var i,kacinci:integer;temp:string;
begin
kacinci:=0;
temp:='';
sat:=trim(sat)+' ';   //bitirmek için bir boþluk ekleriz

for i:=1 to 10 do     //tek satýrda 10 olay(nesne özellikleri deðil) mý olabilir?
begin
  komut[i].tip:='';
  komut[i].ad:='';
end;

 for i:=1 to length(sat) do begin
  if sat[i]=' ' then
   begin
   inc(kacinci); if kacinci>10 then exit; //klasorproje bozuluyordu...
   komut[kacinci].ad:=(temp);
   if (komut[1].tip='olay') then komut[kacinci].ad:=(temp);
    if (lowercase(ada_ayikla(temp))=lowercase(form2.komutlistesi('Dugme')))
       or(lowercase(ada_ayikla(temp))=lowercase(form2.komutlistesi('Zamanlayici')))
       or(lowercase(ada_ayikla(temp))=lowercase(form2.komutlistesi('Etiket')))
       or(lowercase(ada_ayikla(temp))=lowercase(form2.komutlistesi('OnayKutusu')))
       or(lowercase(ada_ayikla(temp))=lowercase(form2.komutlistesi('AcilirKutu')))
       or(lowercase(ada_ayikla(temp))=lowercase(form2.komutlistesi('ListeKutusu')))
       or(lowercase(ada_ayikla(temp))=lowercase(form2.komutlistesi('MetinKutusu')))
       or(lowercase(ada_ayikla(temp))=lowercase(form2.komutlistesi('YaziKutusu')))
       or(lowercase(ada_ayikla(temp))=lowercase(form2.komutlistesi('Form'))) then
    komut[kacinci].tip:='nesne'
    else
    if (lowercase(temp)=lowercase(form2.komutlistesi('Yuklenince')))
       or(lowercase(temp)=lowercase(form2.komutlistesi('Fonksiyon')))
       or(lowercase(temp)=lowercase(form2.komutlistesi('Tiklaninca')))
       or(lowercase(temp)=lowercase(form2.komutlistesi('Kapanirken')))
     then begin
    komut[kacinci].tip:='olay';
    end;
   temp:=''; //atom ayrýldý ve iþ bitti
   end else
   temp:=temp+sat[i];
 end;
end;

procedure Tform2.derle;
var satir:string;line,i:longint;
    ProcessID : DWORD;
    ProcessHandle : THandle;
    ThreadHandle : THandle;
begin
  ProcessID := GetCurrentProcessID;
  ProcessHandle := OpenProcess(PROCESS_SET_INFORMATION,
                               false,
                               ProcessID);
  ThreadHandle := GetCurrentThread;
  case form3.TrackBar1.Position of
  1: begin
  SetPriorityClass(ProcessHandle, IDLE_PRIORITY_CLASS);
  SetThreadPriority(ThreadHandle, THREAD_PRIORITY_IDLE);
     end;
  2: begin
  SetPriorityClass(ProcessHandle, NORMAL_PRIORITY_CLASS);
  SetThreadPriority(ThreadHandle, THREAD_PRIORITY_NORMAL);
     end;
  3: begin
  SetPriorityClass(ProcessHandle, HIGH_PRIORITY_CLASS);
  SetThreadPriority(ThreadHandle, THREAD_PRIORITY_ABOVE_NORMAL);
     end;
  4: begin
  SetPriorityClass(ProcessHandle, REALTIME_PRIORITY_CLASS);
  SetThreadPriority(ThreadHandle, THREAD_PRIORITY_TIME_CRITICAL);
     end;
  end;
//Screen.Cursor:=crHourGlass;
form2.StatusBar1.Visible:=false;
form2.Panel1.Visible:=true;
form2.ProgressBar1.Position:=1;
 if form5.RichEdit1.Lines.Count<>0 then
  form2.ProgressBar1.Max:=form5.RichEdit1.Lines.Count;

derleDurdur:=false;

if form2.rke1.Checked then
form8.Button1.Caption:=loadstr(72)
else
form8.Button1.Caption:=loadstr(1072);
derlemehatalari:=0;
form5.Hatalarsil1Click(self); //hata penceresi

form2.ListView1.Items.Clear;
Line := form5.RichEdit1.Lines.Count;

gridsatir:=0;

if line<>0 then
  for i:=0 to line-1 do begin    //her satýr tek tek yorumlanýyor
  satir:=(form5.richedit1.Lines[i]);
  form2.ProgressBar1.Position:=form2.ProgressBar1.Position+1;
  if derleDurdur then break;
  if mid (trim(satir),1,1) ='''' then continue;

          if form2.rke1.Checked then begin
          form8.StaticText3.Caption:='Hata sayýsý:'+chr(VK_TAB)+inttostr(derlemehatalari);
          form8.StaticText4.Caption:='Toplam satýr:'+chr(VK_TAB)+inttostr(i+1);
          end
          else begin
          form8.StaticText3.Caption:='Error Count:'+chr(VK_TAB)+inttostr(derlemehatalari);
          form8.StaticText4.Caption:='Total Line(s):'+chr(VK_TAB)+inttostr(i+1);
          end;
          form8.Update;
  atom(satir);  //satir atom kelimelere ayrýlýyor

  if (komut[1].tip='olay') then
   begin
    inc(gridsatir);
        with form2.listview1 do begin
        ListItem:= items.Add;
        ListItem.caption:=komut[2].ad;
        ListItem.SubItems.Add(komut[1].ad);
        ListItem.SubItems.add(inttostr(i));
        end;
   end
   else
  if (komut[1].tip='nesne')and(komut[2].tip='olay') then
   begin
    inc(gridsatir);
        with form2.listview1 do begin
        ListItem:= items.Add;
        ListItem.caption:=komut[1].ad;
        ListItem.SubItems.Add(komut[2].ad);
        ListItem.SubItems.add(inttostr(i));
        end;
   end
   else;
//     form2.calistir(i,'Derleme');  //olay adlarý haricindeki tek satýr hatalý mý bakýver...
  end else begin
          if form2.rke1.Checked then begin
          form8.StaticText4.Caption:='Toplam satýr:'+chr(VK_TAB)+'0'
          end
          else begin
          form8.StaticText4.Caption:='Total Line(s):'+chr(VK_TAB)+'0';
          end;
   end; //for i:=1

          if form3.CheckBox6.Checked then beep;
          if form2.rke1.Checked then begin
          form8.StaticText3.Caption:='Hata sayýsý:'+chr(VK_TAB)+inttostr(derlemehatalari);
          form8.StaticText2.Caption:='Tamamlandý. ('+inttostr(gridsatir)+' olay bulundu)';
          form8.Button1.Caption:=loadstr(59);
          end
          else begin
          form8.StaticText3.Caption:='Error Count:'+chr(VK_TAB)+inttostr(derlemehatalari);
          form8.StaticText2.Caption:='Finished. ('+inttostr(gridsatir)+' event(s) found)';
          form8.Button1.Caption:=loadstr(1059);
          end;
          form2.label1.Caption:=inttostr(gridsatir); //olay sayýsý geçici etikete atýlýr
          form8.CheckBox1.checked:=(derlemehatalari>0);
//   Screen.Cursor:=crDefault;
form2.StatusBar1.Visible:=true;
form2.Panel1.Visible:=false;
end;

end.
